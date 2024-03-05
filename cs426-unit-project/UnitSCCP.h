#ifndef INCLUDE_UNIT_SCCP_H
#define INCLUDE_UNIT_SCCP_H
#include "llvm/IR/PassManager.h"
#include <map>
#include <vector>
#include <set>
#include "llvm/IR/Instructions.h"

using namespace llvm;

namespace cs426
{
  class Lattice
  {
    bool may;
    Constant *value;

  public:
    Lattice(Constant *v)
    {
      may = false;
      value = v;
    }

    Lattice(bool may_be)
    {
      value = nullptr;
      may = may_be;
    }

    Lattice() = default;
    Lattice(const Lattice &other) = default;

    Lattice meets(Lattice other)
    {
      if (value)
      {
        if (value == other.value)
          return Lattice(value);
        else
          return Lattice(false);
      }
      else if (may)
      {
        return other;
      }
      else
      {
        return Lattice(false);
      }
    }

    bool hasValue() const
    {
      return value != nullptr;
    }

    Constant *getValue()
    {
      return value;
    }

    bool operator==(Lattice other)
    {
      if (value != nullptr && other.value != nullptr)
      {
        return value == other.value;
      }
      else if (value == nullptr && other.value == nullptr)
      {
        return may == other.may;
      }
      else
        return false;
    }

    bool operator!=(Lattice other)
    {
      return !(*this == other);
    }

    void print() const // for debug use
    {
      if (value)
      {
        dbgs() << *value << "\n";
      }
      else if (may)
      {
        dbgs() << "maybe constant\n";
      }
      else
      {
        dbgs() << "not constant\n";
      }
    }
  };

  /// Sparse Conditional Constant Propagation Optimization Pass
  struct UnitSCCP : PassInfoMixin<UnitSCCP>
  {
    PreservedAnalyses run(Function &F, FunctionAnalysisManager &FAM);
    using Edge = std::pair<BasicBlock *, BasicBlock *>;
    using SSAEdge = std::pair<Instruction *, Instruction *>;
    std::vector<Edge> flowWorkList;
    std::vector<SSAEdge> ssaWorkList;
    std::map<Edge, bool> execFlags;
    //std::map<SSAEdge, bool> ssaExecFlags;
    std::map<Instruction *, Lattice> latticeCell;
    std::set<BasicBlock *> visited;

    void visitPhi(PHINode &statement);

    void visitExpression(Instruction &statement);

    int countInEdges(BasicBlock *b)
    {
      int flag_count = 0;
      for (auto &flag : execFlags)
      {
        if (flag.second && flag.first.second == b)
        {
          flag_count++;
        }
      }
      return flag_count;
    }
  };
} // namespace

#endif // INCLUDE_UNIT_SCCP_H
