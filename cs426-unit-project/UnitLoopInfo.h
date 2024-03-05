#ifndef INCLUDE_UNIT_LOOP_INFO_H
#define INCLUDE_UNIT_LOOP_INFO_H
#include "llvm/IR/PassManager.h"
#include <set>
#include <vector>
using namespace llvm;

namespace cs426 {
/// An object holding information about the (natural) loops in an LLVM
/// function. At minimum this will need to identify the loops, may hold
/// additional information you find useful for your LICM pass

struct LoopInfo {
  //std::vector<BasicBlock*> loop_body;
  std::set<BasicBlock*> loop_body;
  BasicBlock* header;
  BasicBlock* end;
  std::set<BasicBlock*> exits;
  BasicBlock* preheader;
};


class UnitLoopInfo {
  // Define this class to provide the information you need in LICM
public:
  std::vector<LoopInfo> loop_infos;

};


/// Loop Identification Analysis Pass. Produces a UnitLoopInfo object which
/// should contain any information about the loops in the function which is
/// needed for your implementation of LICM
class UnitLoopAnalysis : public AnalysisInfoMixin<UnitLoopAnalysis> {
  friend AnalysisInfoMixin<UnitLoopAnalysis>;
  static AnalysisKey Key;

  void findNaturalLoopRec(BasicBlock* n, BasicBlock* d, std::set<BasicBlock*>& visited);

public:
  typedef UnitLoopInfo Result;
  //Result all_loops;

  UnitLoopInfo run(Function &F, FunctionAnalysisManager &AM);

  void findNaturalLoop(BasicBlock* n, BasicBlock* d, Result& Loops);


};
} // namespace
#endif // INCLUDE_UNIT_LOOP_INFO_H
