// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-licm"
#include "llvm/Support/raw_ostream.h"

#include "UnitLICM.h"
#include "UnitLoopInfo.h"
#include <map>
#include "llvm/IR/CFG.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Analysis/MemoryLocation.h"
#include "llvm/ADT/Statistic.h"

#define DEBUG_TYPE "UnitLICM"

// Define any statistics here

ALWAYS_ENABLED_STATISTIC(NumLoadHoisted, "Number of load instructions hoisted");
ALWAYS_ENABLED_STATISTIC(NumStoreHoisted, "Number of store instructions hoisted");
ALWAYS_ENABLED_STATISTIC(NumCompHoisted, "Number of computational instructions hoisted");

using namespace llvm;
using namespace cs426;

/// Main function for running the LICM optimization
PreservedAnalyses UnitLICM::run(Function &F, FunctionAnalysisManager &FAM)
{
  dbgs() << "UnitLICM running on " << F.getName() << "\n";
  // Acquires the UnitLoopInfo object constructed by your Loop Identification
  // (LoopAnalysis) pass
  UnitLoopInfo &Loops = FAM.getResult<UnitLoopAnalysis>(F);
  DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);
  AAResults &AA = FAM.getResult<AAManager>(F);
  // Perform the optimization
  /*for (auto& bb: F)
  {
    for (auto& i: bb)
    {
      dbgs() << i.getName() << "\n";
    }
  }*/
  /*for (auto &loop_info: Loops.loop_infos)
  {
    auto header = loop_info.header;
    std::vector<BasicBlock*> preds;
    for (auto *pred: predecessors(header))
    {
      if (loop_info.loop_body.find(pred) == loop_info.loop_body.end())
        preds.push_back(pred);
    }
    loop_info.preheader = SplitBlockPredecessors(header, preds, ".preheader", &DT);
  }*/
  // for (auto &bb : F)
  //{
  //   for (auto &statement : bb)
  //   {
  //     dbgs() << statement.getName() << ' ' << statement.getOpcodeName() << "\n";
  //   }
  // }
  //dbgs() << F;

  // int temp_counter = 0;
  //dbgs() << Loops.loop_infos.size() << "start LICM algorithm\n";
  for (auto &loop_info : Loops.loop_infos)
  {
    bool newMarked = false;
    std::map<User *, bool> invariantUser;
    for (auto bb : loop_info.loop_body)
    {
      for (auto &statement : *bb)
      {
        invariantUser[&statement] = false;
      }
    }
    std::vector<Instruction *> invariantStatements;
    // repeat until no new statements are marked
    do
    {
      // newMarked = false;
      invariantStatements.clear();
      // for (each statement in L)
      for (auto bb : loop_info.loop_body)
      {
        for (auto &statement : *bb)
        {
          //dbgs() << statement << "\n";
          if (invariantUser[&statement])
            continue;
          bool isInvariant = true;

          // hoist condition for store
          int countDef = 0;
          if (statement.getOpcode() == Instruction::Store)
          {

            for (auto bb2 : loop_info.loop_body)
            {
              for (auto &store_statement : *bb2)
              {
                if (store_statement.getOpcode() == Instruction::Store)
                {
                  if (!AA.isNoAlias(MemoryLocation::get(&statement),
                                    MemoryLocation::get(&store_statement)))
                  {
                    ++countDef;
                  }
                }
              }
            }
            if (countDef > 1)
            {
              isInvariant = false;
            }
          }
          if (statement.getOpcode() == Instruction::Load) // hoist condition for load
          {
            for (auto bb2 : loop_info.loop_body)
            {
              for (auto &store_statement : *bb2)
              {
                if (store_statement.getOpcode() == Instruction::Store)
                {
                  if (!AA.isNoAlias(MemoryLocation::get(&statement),
                                    MemoryLocation::get(&store_statement)))
                  {
                    isInvariant = false;
                    break;
                  }
                }
              }
            }
          }

          if (isInvariant && 
          (
              statement.isUnaryOp() ||
              statement.isBinaryOp() ||
              statement.getOpcode() == Instruction::BitCast ||
              statement.getOpcode() == Instruction::ICmp ||
              statement.getOpcode() == Instruction::FCmp ||
              statement.getOpcode() == Instruction::Select ||
              statement.getOpcode() == Instruction::GetElementPtr ||
              statement.getOpcode() == Instruction::Load ||
              statement.getOpcode() == Instruction::Store))
          {
            // for (all operands u in S)
            //dbgs() << "statement " << statement << '\n';
            for (Use &u : statement.operands())
            {
              if (isa<Constant>(u)) // constant is not defined
                continue;
              // Since llvm is in SSA form, there's only one definition of a operand u

              Instruction *def = dyn_cast<Instruction>(u.get());
              //dbgs() << "definition: " << *def << "\n";
              if (!def || loop_info.loop_body.find(def->getParent()) != loop_info.loop_body.end())
              {
                // isInvariant = invariantUser[def];
                if (!invariantUser[def])
                {
                  isInvariant = false;
                  break;
                }
              }
            }
          }
          else
            isInvariant = false;
          invariantUser[&statement] = isInvariant;
          if (isInvariant)
          {
            //dbgs() << statement << " marked\n";
            invariantStatements.push_back(&statement);
          }
        }
        //dbgs() << "end statement\n";
      }
      //dbgs() << "tranforamtion begin\n";
      for (auto statement : invariantStatements)
      {
        //dbgs() << "has invariant user\n";
        bool dominateAllExits = true;
        for (auto exit : loop_info.exits)
        {
          //dbgs() << "exit begin\n"
          //       << *exit << "\nexit end\n";
          if (!DT.dominates(statement->getParent(), exit))
            dominateAllExits = false;
        }
        //dbgs() << dominateAllExits << '\n';
        // insert before the unconditional branch of preheader
        auto insert_pos = --loop_info.preheader->getInstList().end();
        if (statement->getOpcode() != Instruction::Store || dominateAllExits)
        {
          //dbgs() << *statement << "\n";
          auto new_instr = statement->clone();
          loop_info.preheader->getInstList().insert(insert_pos, new_instr);
          statement->replaceAllUsesWith(new_instr);
          //dbgs() << *new_instr << "\n";
          //dbgs() << *loop_info.preheader << "\n";
          statement->eraseFromParent();
          //dbgs() << F;
          if (statement->getOpcode() == Instruction::Store)
          {
            ++NumStoreHoisted;
          }
          else if (statement->getOpcode() == Instruction::Load)
          {
            ++NumLoadHoisted;
          }
          else
          {
            ++NumCompHoisted;
          }
        }
      }
    } while (!invariantStatements.empty());
  }
  //dbgs() << F;
  // Set proper preserved analyses
  return PreservedAnalyses::all();
}
