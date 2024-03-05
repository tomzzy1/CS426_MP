#include "llvm/IR/Dominators.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/CFG.h"
#include "UnitLoopInfo.h"

using namespace llvm;
using namespace cs426;

/// Main function for running the Loop Identification analysis. This function
/// returns information about the loops in the function via the UnitLoopInfo
/// object
UnitLoopInfo UnitLoopAnalysis::run(Function &F, FunctionAnalysisManager &FAM)
{
  dbgs() << "UnitLoopAnalysis running on " << F.getName() << "\n";
  // Acquires the Dominator Tree constructed by LLVM for this function. You may
  // find this useful in identifying the natural loops
  DominatorTree &DT = FAM.getResult<DominatorTreeAnalysis>(F);

  UnitLoopInfo Loops;
  // Fill in appropriate information
  //dbgs() << "loop analysis begin\n";
  //dbgs() << F;
  // for (auto& bb: F)
  //{

  // dbgs() << "basic block begin\n";
  // for (auto& i: bb)
  //{
  // dbgs() << i << "\n";
  //}
  // dbgs() << "basic block end\n";
  //}

  for (auto &bb : F)
  {

    for (auto *succ : successors(&bb))
    {

      if (DT.dominates(succ, &bb))
      {
        // dbgs() << *succ;
        // dbgs() << bb;
        // dbgs() << "dominates\n";
        findNaturalLoop(&bb, succ, Loops);
      }
    }
  }
  // get the loop body of all loops
  /*for (auto& loop: Loops.loop_infos)
  {
    dbgs() << "loop body start\n";
    for (auto bb: loop.loop_body)
    {

      dbgs() << *bb;

    }
    dbgs() << "loop body end\n";
  }*/
  // find the exit of loops
  for (auto &loop : Loops.loop_infos)
  {
    for (auto bb : loop.loop_body)
    {
      for (auto succ : successors(bb))
      {
        if (loop.loop_body.find(succ) == loop.loop_body.end())
        {
          loop.exits.insert(bb);
          break;
        }
      }
    }
  }
  /*for (auto& loop: Loops.loop_infos)
  {
    dbgs() << "loop exits start\n";
    for (auto bb: loop.exits)
    {

      dbgs() << *bb;
    }
    dbgs() << "loop exits end\n";
  }*/

  return Loops;
}

void UnitLoopAnalysis::findNaturalLoop(BasicBlock *n, BasicBlock *d, Result &Loops)
{
  LoopInfo info;
  std::set<BasicBlock *> visited;
  findNaturalLoopRec(n, d, visited);
  visited.insert(n);
  visited.insert(d);
  info.loop_body = visited;
  info.header = d;
  info.end = n;
  for (auto *pred : predecessors(info.header))
  {
    if (info.loop_body.find(pred) == info.loop_body.end())
    {
      info.preheader = pred;
      break;
    }
  }
  // info.preheader = *predecessors(info.header).begin();
  Loops.loop_infos.push_back(info);
}

void UnitLoopAnalysis::findNaturalLoopRec(BasicBlock *n, BasicBlock *d, std::set<BasicBlock *> &visited)
{
  if (n != d)
  {
    for (auto *pred : predecessors(n))
    {
      if (visited.find(pred) == visited.end())
      {
        visited.insert(pred);
        findNaturalLoopRec(pred, d, visited);
      }
    }
  }
}

AnalysisKey UnitLoopAnalysis::Key;
