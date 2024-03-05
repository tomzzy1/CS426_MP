// Usage: opt -load-pass-plugin=libUnitProject.so -passes="unit-sccp"
#include "llvm/Support/raw_ostream.h"

#include "UnitSCCP.h"
#include "llvm/IR/CFG.h"
#include "llvm/Analysis/ConstantFolding.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/Analysis/DomTreeUpdater.h"

#define DEBUG_TYPE "UnitSCCP"
// Define any statistics here
ALWAYS_ENABLED_STATISTIC(NumInstRemoved, "Number of instructions removed");
ALWAYS_ENABLED_STATISTIC(NumDeadBlocks, "Number of basic blocks unreachable");
ALWAYS_ENABLED_STATISTIC(NumInstReplaced,
                         "Number of instructions replaced with (simpler) instruction");

using namespace llvm;
using namespace cs426;

/// Main function for running the SCCP optimization
PreservedAnalyses UnitSCCP::run(Function &F, FunctionAnalysisManager &FAM)
{
  dbgs() << "UnitSCCP running on " << F.getName() << "\n";
  // auto &DT = FAM.getResult<DominatorTreeAnalysis>(F);
  // DomTreeUpdater DTU(&DT, DomTreeUpdater::UpdateStrategy::Lazy);
  //  Initialize
  //
  //  flowWorkList to contian edges exiting the start node of the program
  //  SSA WorkList initial is empty
  //  Executable-Flag controls evaluation of phi functions (initially false for all edges)
  //  Each LatticeCell is initially may be constant
  //
  //dbgs() << F;
  // fill flowWorkList with edges exiting the start node
  flowWorkList.emplace_back(nullptr, &F.front());
  /*for(auto& out_edge : successors(&F.front())) {
    // get all successors of the first basic block
    flowWorkList.push_back(pair<&F.front(), out_edge);
  }*/

  // iterate over every instruction and add it as maybe constant in latticeCell
  for (auto &bb : F)
  {
    for (auto &statement : bb)
    {
      latticeCell[&statement] = Lattice(true);
    }
  }

  // while loop over edges
  while (!flowWorkList.empty() || !ssaWorkList.empty())
  {
    if (!flowWorkList.empty())
    {
      Edge edge = flowWorkList.back();
      flowWorkList.pop_back();
      if (execFlags.find(edge) == execFlags.end() || execFlags[edge] == false)
      {
        execFlags[edge] = true;
        // dbgs() << "edge added: " << " " << *edge.second << "\n";
        //  VisitPhi for all of the phi functions in BB
        for (auto &statement : *edge.second)
        {
          if (statement.getOpcode() == Instruction::PHI)
          {
            visitPhi(*dyn_cast<PHINode>(&statement));
          }
        }
        // check exec flags
        // if only one of the executable falgs associated with the program flow graph edges is true
        int flag_count = countInEdges(edge.second);
        if (flag_count == 1)
        {
          // perform VisitExpression
          for (auto &statement : *edge.second)
          {
            // TODO: evaluate the value of the statement (what the constant will be)
            visitExpression(statement);
          }
        }
        int count_out_edges = 0;
        for (auto *succ : successors(edge.second))
        {
          ++count_out_edges;
        }
        if (count_out_edges == 1)
          flowWorkList.emplace_back(edge.second, *successors(edge.second).begin());
      }
    }
    else if (!ssaWorkList.empty())
    {
      SSAEdge edge = ssaWorkList.back();
      ssaWorkList.pop_back();
      if (edge.second->getOpcode() == Instruction::PHI)
      {
        visitPhi(*dyn_cast<PHINode>(edge.second));
      }
      else
      {
        int flag_count = countInEdges(edge.second->getParent());
        if (flag_count >= 1)
        {
          visitExpression(*edge.second);
        }
      }
    }
  }
  // dbgs() << "finish propagation\n";
  for (auto &bb : F)
  {
    for (auto &statement : bb)
    {
      //dbgs() << statement << '\n';
      //latticeCell[&statement].print();
    }
  }

  Value *tempValue;
  for (auto &bb : F)
  {
    for (auto &statement : bb)
    {
      if (latticeCell[&statement] != Lattice(true))
      {
        tempValue = &statement;
      }
    }
  }

  // Perform the optimization
  std::vector<BasicBlock *> BBRemoved;
  std::vector<Instruction *> InstRemoved;
  std::set<Instruction *> InstReplaced;

  // dbgs() << F;

  // dbgs() << "blocks to be removed\n";
  for (auto &bb : F)
  {
    // dbgs() << countInEdges(&bb) << "\n";
    if (countInEdges(&bb) == 0)
    {
      BBRemoved.push_back(&bb);
      ++NumDeadBlocks;
      // dbgs() << bb;
    }
  }

  for (auto bb : BBRemoved)
  {
    // dbgs() << *bb;
    std::vector<Instruction *> BBUserRemoved;
    for (auto user : bb->users())
    {
      BBUserRemoved.push_back(dyn_cast<BranchInst>(user));
    }
    for (auto &bb2 : F)
    {
      for (auto &phi : bb2.phis())
      {
        for (int i = 0; i < phi.getNumIncomingValues(); ++i)
        {
          if (phi.getIncomingBlock(i) == bb)
          {
            BBUserRemoved.push_back(&phi);
            break;
          }
        }
      }
    }
    for (auto user : BBUserRemoved)
    {
      // dbgs() << "user of basic block" << *user << '\n';
      if (auto branch = dyn_cast<BranchInst>(user))
      {
        if (branch->isConditional())
        {
          auto trueBlock = branch->getSuccessor(0) == bb ? branch->getSuccessor(1) : branch->getSuccessor(0);
          auto newBranch = BranchInst::Create(trueBlock, branch);
          branch->eraseFromParent();
          latticeCell[newBranch] = Lattice(true);
          // InstReplaced.insert(dyn_cast<Instruction>(user));
          ++NumInstReplaced;
        }
        else
        {
          // dbgs() << "branch unconditional\n";
          branch->eraseFromParent();
          ++NumInstRemoved;
        }
      }
      if (auto phi = dyn_cast<PHINode>(user))
      {
        phi->removeIncomingValue(bb);
      }
    }
  }
  if (BBRemoved.size() == 1)
  {
    BBRemoved[0]->eraseFromParent();
  }
  if (BBRemoved.size() > 1)
  {
    auto lastInst = &BBRemoved[0]->front();
    for (int i = 1; i < BBRemoved.size(); ++i)
    {
      std::vector<Instruction *> InstMoved;
      for (auto &statement : *BBRemoved[i])
      {
        InstMoved.push_back(&statement);
        ++NumInstRemoved;
      }
      for (auto inst : InstMoved)
      {
        // dbgs() << "moving statement " << *inst << '\n';
        inst->moveAfter(lastInst);
      }
      BBRemoved[i]->eraseFromParent();
    }
    BBRemoved[0]->eraseFromParent();
  }

  for (auto &bb : F)
  {
    for (auto &statement : bb)
    {
      auto lattice = latticeCell[&statement];
      if (lattice.hasValue())
      {
        InstRemoved.push_back(&statement);
        ++NumInstRemoved;
        for (auto user : statement.users())
        {
          InstReplaced.insert(dyn_cast<Instruction>(user));
        }
        statement.replaceAllUsesWith(lattice.getValue());
      }
    }
  }

  // dbgs() << F;

  NumInstReplaced = InstReplaced.size();
  for (auto statement : InstRemoved)
  {
    statement->eraseFromParent();
    if (InstReplaced.find(statement) != InstReplaced.end())
      --NumInstReplaced;
  }

  // dbgs() << F;

  // Set proper preserved analyses
  // auto PA = PreservedAnalyses::all();
  // PA.abandon<CFGAnalyses>();
  // return PreservedAnalyses::all();
  return PreservedAnalyses::none();
}

void UnitSCCP::visitPhi(PHINode &statement)
{
  //dbgs() << "visiting Phi\n"
  //       << statement << "\n";
  //  find if executable or not-executable
  for (auto &op : statement.operands())
  {
    // if(ExecFlag[InEdge(k)] == true)
    // dbgs() << *op.get() << "\n";
    Lattice lattice;
    if (auto def = dyn_cast<Instruction>(op.get()))
    {
      lattice = latticeCell[def];
    }
    else // op is a constant
    {
      lattice = Lattice(dyn_cast<Constant>(op.get()));
    }
    // Instruction *def = dyn_cast<Instruction>(op.get());
    auto BB = statement.getIncomingBlock(op);
    //dbgs() << *BB;
    // dbgs() << (&BB->getParent()->front() == BB);
    // if (countInEdges(BB) >= 1 || &BB->getParent()->front() == BB) // first basic block
    if (execFlags.find(Edge(BB, statement.getParent())) != execFlags.end())
    {
      // latticeCell[statement] = latticeCell[statement].meet(latticeCell[def]);
      // dbgs() << "executable branch of phi\n";
      Lattice tempLattice = latticeCell[&statement].meets(lattice);
      //latticeCell[&statement].print();
      //lattice.print();
      //tempLattice.print();
      if (tempLattice != latticeCell[&statement])
      {
        // dbgs() << "add more to ssa worklist\n";
        for (auto *user : statement.users())
        {
          // dbgs() << "instructions added ssa worklist " << *dyn_cast<Instruction>(user);
          ssaWorkList.push_back(SSAEdge(&statement, dyn_cast<Instruction>(user)));
        }
      }
      latticeCell[&statement] = tempLattice;
    }
  }
}

void UnitSCCP::visitExpression(Instruction &statement)
{
  // evaluate the expression
  //dbgs() << "visiting Expression\n"
  //       << statement << "\n";
  if (statement.getOpcode() == Instruction::PHI)
    return;
  if (auto branch = dyn_cast<BranchInst>(&statement))
  {
    // latticeCell[&statement] = tempLattice;
    // dbgs() << "branching\n";
    if (branch->isConditional())
    {
      Instruction *def = dyn_cast<Instruction>(statement.operands().begin()->get());
      Lattice op;
      if (def)
        op = latticeCell[def];
      else
        op = dyn_cast<Constant>(statement.operands().begin()->get());
      // Add one or both outgoing edges to flowWL
      if (op == Lattice(false))
      {
        // dbgs() << "can't evluate branch\n";

        for (auto succ : branch->successors())
        {
          flowWorkList.emplace_back(statement.getParent(), succ);
        }
      }
      else
      {
        // only add edge taken
        // evaluate result
        auto index = op.getValue()->isOneValue() ? 0 : 1; // 1 for first branch, 0 for second branch
        flowWorkList.emplace_back(statement.getParent(), branch->getSuccessor(index));
      }
    }
    else // unconditional branch
    {
      flowWorkList.emplace_back(statement.getParent(), branch->getSuccessor(0));
    }
  }
  else // if assignment
  {
    // dbgs() << "not branching\n";
    Lattice tempLattice = latticeCell[&statement];

    if (auto select = dyn_cast<SelectInst>(&statement))
    {
      std::vector<Use *> operands;
      for (auto &op : statement.operands())
      {
        operands.push_back(&op);
      }
      Constant *cond = dyn_cast<Constant>(operands[0]->get());
      if (auto def = dyn_cast<Instruction>(operands[0]->get()))
      {
        auto lattice = latticeCell[def];
        if (lattice.hasValue())
          cond = lattice.getValue();
      }
      if (cond)
      {
        int idx = cond->isOneValue() ? 1 : 2;
        if (auto inst = dyn_cast<Instruction>(operands[idx]->get()))
        {
          tempLattice = latticeCell[inst];
        }
        else
        {
          tempLattice = Lattice(dyn_cast<Constant>(operands[idx]->get()));
        }
      }
      else
      {
        tempLattice = Lattice(false);
      }
    }
    else
    {
      bool isAllHasValue = true;

      for (auto &op : statement.operands())
      {

        // dbgs() << "type: " << *op.get()->getType() << '\n';
        if (isa<Constant>(op.get())) //|| op.get()->getType()->isLabelTy())
          continue;
        Instruction *def = dyn_cast<Instruction>(op.get());
        //if (def)
        //{
          //dbgs() << "operands " << *def << " ";
          //latticeCell[def].print();
        //}

        if (!latticeCell[def].hasValue())
        {
          isAllHasValue = false;
          break;
        }
      }
      if (isa<CallInst>(&statement))
      {
        tempLattice = Lattice(false);
      }
      else if (isAllHasValue)
      {
        std::vector<Constant *> operands;
        const DataLayout DL(statement.getParent()->getParent()->getParent()); // get the current module
        for (auto &op : statement.operands())
        {
          if (isa<Constant>(op.get()))
          {
            operands.push_back(dyn_cast<Constant>(op.get()));
          }
          else
          {
            Instruction *def = dyn_cast<Instruction>(op.get());
            operands.push_back(latticeCell[def].getValue());
          }
        }
        // dbgs() << "constant folding :" << operands.size() << "\n";
        for (auto &o : operands)
        {
          //dbgs() << *o << '\n';
        }
        if (auto comp = dyn_cast<CmpInst>(&statement)) // workaround for llvm 14
        {
          tempLattice = ConstantFoldCompareInstOperands(comp->getPredicate(), operands[0], operands[1], DL, nullptr);
        }
        else
        {
          tempLattice = ConstantFoldInstOperands(&statement, operands, DL);
        }
      }
      else
      {
        for (auto &op : statement.operands())
        {
          if (isa<Constant>(op.get()))
          {
            tempLattice = tempLattice.meets(Lattice(dyn_cast<Constant>(op.get())));
          }
          else
          {
            Instruction *def = dyn_cast<Instruction>(op.get());
            tempLattice = tempLattice.meets(latticeCell[def]);
          }
        }
      }
    }

    //tempLattice.print();
    if (tempLattice != latticeCell[&statement])
    {
      latticeCell[&statement] = tempLattice;
      for (auto *user : statement.users())
      {
        // dbgs() << "user: " << *user << '\n';
        ssaWorkList.push_back(SSAEdge(&statement, dyn_cast<Instruction>(user)));
      }
    }
  }
  // dbgs() << "visit expression end\n";
}