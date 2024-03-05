//===----------------------------------------------------------------------===//
//
/// A register allocator simplified from RegAllocFast.cpp
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/Statistic.h"
#include "llvm/CodeGen/MachineFunctionPass.h"
#include "llvm/CodeGen/MachineRegisterInfo.h"
#include "llvm/CodeGen/RegAllocRegistry.h"
#include "llvm/CodeGen/RegisterClassInfo.h"
#include "llvm/CodeGen/TargetInstrInfo.h"
#include "llvm/CodeGen/MachineFrameInfo.h"
#include "llvm/InitializePasses.h"
#include "llvm/Pass.h"

#include "llvm/CodeGen/LiveIntervals.h"
#include "llvm/CodeGen/SlotIndexes.h"

#include <map>
#include <set>

using namespace llvm;

#define DEBUG_TYPE "regalloc"

STATISTIC(NumStores, "Number of stores added");
STATISTIC(NumLoads, "Number of loads added");

namespace
{
  /// This is class where you will implement your register allocator in
  class RegAllocSimple : public MachineFunctionPass
  {
  public:
    static char ID;
    RegAllocSimple() : MachineFunctionPass(ID) {}

  private:
    /// Some information that might be useful for register allocation
    /// They are initialized in runOnMachineFunction
    MachineFrameInfo *MFI;
    MachineRegisterInfo *MRI;
    const TargetRegisterInfo *TRI;
    const TargetInstrInfo *TII;
    RegisterClassInfo RegClassInfo;

    // TODO: maintain information about live registers
    std::map<Register, Register> LiveVirtualRegs;
    std::set<Register> UsedInInstr;
    std::map<Register, int> SpillMap;
    MachineBasicBlock::iterator InsertionPoint;
    std::set<Register> Used;
    std::map<Register, bool> DirtyRegs;
    std::vector<const uint32_t *> RegMasks;

    void insertUsedRegister(std::set<Register> &RegSet, Register PhysReg)
    {
      for (MCRegUnitIterator iter(PhysReg, TRI); iter.isValid(); ++iter)
        RegSet.insert(*iter);
    }
    void deleteUsedRegister(std::set<Register> &RegSet, Register PhysReg)
    {
      for (MCRegUnitIterator iter(PhysReg, TRI); iter.isValid(); ++iter)
        RegSet.erase(*iter);
    }
    bool checkOverlap(std::set<Register> &RegSet, Register PhysReg)
    {
      bool isOverlap = false;
      for (MCRegUnitIterator iter(PhysReg, TRI); iter.isValid(); ++iter)
      {
        for (MCRegister reg : RegSet)
        {
          if (*iter == reg)
          {
            isOverlap = true;
            break;
          }
        }
      }
      return isOverlap;
    }
    bool checkOverlap(Register Reg1, Register Reg2)
    {

      bool isOverlap = false;
      for (MCRegUnitIterator iter1(Reg1, TRI); iter1.isValid(); ++iter1)
      {
        for (MCRegUnitIterator iter2(Reg2, TRI); iter2.isValid(); ++iter2)
        {
          if (*iter1 == *iter2)
          {
            isOverlap = true;
            break;
          }
        }
      }
      dbgs() << "checkOverlap " << Reg1 << " " << Reg2 << " " << isOverlap << "\n";
      return isOverlap;
    }
    bool checkClobber(Register PhysReg)
    {
      bool isClobber = false;
      for (auto RegMask : RegMasks)
      {
        if (MachineOperand::clobbersPhysReg(RegMask, PhysReg))
        {
          isClobber = true;
          break;
        }
      }
      return isClobber;
    }
    void spillRegister(Register VirtReg, Register PhysReg, MachineBasicBlock &MBB, MachineBasicBlock::iterator &iter, bool isKill)
    {
      if (DirtyRegs[VirtReg])
      {
        const auto &TRC = *MRI->getRegClass(VirtReg);
        int FrameIdx;
        if (SpillMap.find(VirtReg) != SpillMap.end())
        {
          FrameIdx = SpillMap[VirtReg];
          dbgs() << "slot from spill map\n";
        }
        else
        {
          auto size = TRI->getSpillSize(TRC);
          auto align = TRI->getSpillAlign(TRC);
          FrameIdx = MFI->CreateSpillStackObject(size, align);
          SpillMap[VirtReg] = FrameIdx;
          dbgs() << "create new slot\n";
        }
        // bool isKill = MO.isKill();
        TII->storeRegToStackSlot(MBB, iter, PhysReg, isKill, FrameIdx, &TRC, TRI);
        ++NumStores;
      }
    }

  public:
    StringRef getPassName() const override { return "Simple Register Allocator"; }

    void getAnalysisUsage(AnalysisUsage &AU) const override
    {
      AU.setPreservesCFG();
      // At -O1/-O2, llc fails to schedule some required passes if this pass
      // does not preserve these anlyses; these are preserved by recomputing
      // them at the end of runOnFunction(), you can safely ignore these
      AU.addRequired<LiveIntervals>();
      AU.addPreserved<LiveIntervals>();
      AU.addRequired<SlotIndexes>();
      AU.addPreserved<SlotIndexes>();
      MachineFunctionPass::getAnalysisUsage(AU);
    }

    /// Ask the Machine IR verifier to check some simple properties
    /// Enabled with the -verify-machineinstrs flag in llc
    MachineFunctionProperties getRequiredProperties() const override
    {
      return MachineFunctionProperties().set(
          MachineFunctionProperties::Property::NoPHIs);
    }

    MachineFunctionProperties getSetProperties() const override
    {
      return MachineFunctionProperties().set(
          MachineFunctionProperties::Property::NoVRegs);
    }

    MachineFunctionProperties getClearedProperties() const override
    {
      return MachineFunctionProperties().set(
          MachineFunctionProperties::Property::IsSSA);
    }

  private:
    /// Allocate physical register for virtual register operand
    void allocateOperand(MachineOperand &MO, Register VirtReg, bool is_use)
    {
      // TODO: allocate physical register for a virtual register
      // if (MO.getParent()->registerDefIsDead(VirtReg, TRI))
      //{
      //    MO.getParent()->eraseFromParent();
      //}
      //   return;
      MO.print(dbgs(), TRI);
      dbgs() << " " << is_use << " " << MO.isUse() << '\n';
      if (VirtReg.isPhysical())
      {
        // UsedInInstr.insert(VirtReg);
        dbgs() << "physical registers " << is_use << '\n';
        if (!is_use && !checkOverlap(UsedInInstr, VirtReg))
        {
          for (auto &p : LiveVirtualRegs)
          {
            if (checkOverlap(p.second, VirtReg))
            {
              spillRegister(p.first, p.second, *(MO.getParent()->getParent()), InsertionPoint, false);
              LiveVirtualRegs.erase(p.first);
              break;
            }
          }
        }
        insertUsedRegister(UsedInInstr, VirtReg);
        // insertUsedRegister(Used, VirtReg);
      }
      if (!VirtReg.isVirtual())
        return;

      const auto &TRC = *MRI->getRegClass(VirtReg);
      Register PhysReg;
      if (LiveVirtualRegs.find(VirtReg) != LiveVirtualRegs.end())
      {
        PhysReg = LiveVirtualRegs[VirtReg];
        if (!is_use)
        {
          DirtyRegs[VirtReg] = true;
        }
      }
      else
      {
        bool notFound = true;
        const auto order = RegClassInfo.getOrder(&TRC);
        for (auto r : order)
        {
          if (!checkOverlap(Used, r) /*&& !checkClobber(r)*/)
          {
            PhysReg = r;
            // insertUsedRegister(Used, PhysReg);
            notFound = false;
            break;
          }
        }
        if (notFound)
        {
          for (auto r : order)
          {
            if (!checkOverlap(UsedInInstr, r))
            {
              PhysReg = r;
              // spill registers
              // bool isKill = MO.isKill();
              // spillRegister(VirtReg, PhysReg, *(MO.getParent()->getParent()), InsertionPoint, isKill);
              break;
            }
          }
          for (auto &p : LiveVirtualRegs)
          {
            if (p.second == PhysReg)
            {
              spillRegister(p.first, p.second, *(MO.getParent()->getParent()), InsertionPoint, false);
              LiveVirtualRegs.erase(p.first);
              break;
            }
          }
          /*for (auto iter = LiveVirtualRegs.begin(); iter != LiveVirtualRegs.end();)
          {
            if (!checkOverlap(UserInInstr, iter->second))
            {
              PhysReg = iter->second;
              spillRegister(iter->first, iter->second, *MI.getParent(), InsertionPoint, MO.isKill());
              iter = LiveVirtualRegs.erase(iter);
              break;
            }
            else
            {
              ++iter;
            }
          }*/
        }
        if (is_use)
        {
          int FrameIdx = SpillMap[VirtReg];
          TII->loadRegFromStackSlot(*(MO.getParent()->getParent()), InsertionPoint, PhysReg, FrameIdx, &TRC, TRI);
          DirtyRegs[VirtReg] = false; // clean after reloading
          ++NumLoads;
        }
        else
        {
          DirtyRegs[VirtReg] = true;
        }
        // if (!MO.isKill())
        //{
        if (!MO.getParent()->registerDefIsDead(VirtReg, TRI))
          LiveVirtualRegs[VirtReg] = PhysReg;
        //}
      }
      auto SubReg = MO.getSubReg();
      if (SubReg != 0)
      {
        PhysReg = TRI->getSubReg(PhysReg, SubReg);
        MO.setSubReg(0);
      }
      // if (MO.)
      //  UsedInInstr.insert(PhysReg);
      //   insert all unit into used
      // LiveVirtualRegs[VirtReg] = PhysReg;
      if (!MO.getParent()->registerDefIsDead(VirtReg, TRI))
      {
        insertUsedRegister(UsedInInstr, PhysReg);
        insertUsedRegister(Used, PhysReg);
      }

      MO.setReg(PhysReg);
    }

    void allocateInstruction(MachineInstr &MI)
    {
      // TODO: find and allocate all virtual registers in MI
      UsedInInstr.clear();
      RegMasks.clear();
      dbgs() << "LivrVirtualRegs: \n";
      for (auto &p : LiveVirtualRegs)
      {
        dbgs() << p.first << " " << p.second << "\n";
      }

      // for (auto &MO : MI.uses())
      for (auto &MO : MI.operands())
      {
        if (MO.isReg() && MO.isUse())
          allocateOperand(MO, MO.getReg(), true);
      }
      // for (auto &MO : MI.defs())
      for (auto &MO : MI.operands())
      {
        if (MO.isReg() && MO.isDef())
          allocateOperand(MO, MO.getReg(), false);
      }
      if (MI.isCall())
      {
        for (auto &MO : MI.operands())
        {
          if (MO.isRegMask())
          {
            RegMasks.push_back(MO.getRegMask());
          }
        }
        for (auto iter = LiveVirtualRegs.begin(); iter != LiveVirtualRegs.end();)
        {
          if (checkClobber(iter->second))
          {
            spillRegister(iter->first, iter->second, *MI.getParent(), InsertionPoint, false);
            deleteUsedRegister(Used, iter->second);
            iter = LiveVirtualRegs.erase(iter);
          }
          else
          {
            ++iter;
          }
        }
      }
    }

    void allocateBasicBlock(MachineBasicBlock &MBB)
    {
      // TODO: allocate each instruction
      // TODO: spill all live registers at the end
      /*for (auto iter = LiveVirtualRegs.begin(); iter != LiveVirtualRegs.end();)
      {
        if (DirtyRegs[iter->first])
        {
          deleteUsedRegister(Used, iter->second);
          iter = LiveVirtualRegs.erase(iter);
        }
        else
        {
          ++iter;
        }
      }*/
      for (auto &p : LiveVirtualRegs)
      {
        deleteUsedRegister(Used, p.second);
      }
      LiveVirtualRegs.clear();
      // Used.clear();
      DirtyRegs.clear();
      // pre-coloring
      for (auto &p : MBB.liveins()) // Register Mask Pair
      {
        insertUsedRegister(Used, p.PhysReg);
      }
      for (auto i = MBB.begin(); i != MBB.end(); ++i)
      {
        InsertionPoint = i;
        // dbgs() << *i;
        allocateInstruction(*i);
        dbgs() << *i;
      }
      auto last_instr_iter = --MBB.end();
      if (last_instr_iter->isReturn()) // no spill after return
        return;
      while (last_instr_iter->isBranch() && last_instr_iter != MBB.begin()) // spill before the last branching
        --last_instr_iter;
      //++last_instr_iter;
      if (!last_instr_iter->isBranch())
        ++last_instr_iter;
      for (auto &p : LiveVirtualRegs)
      {
        spillRegister(p.first, p.second, MBB, last_instr_iter, false);
      }
    }

    bool runOnMachineFunction(MachineFunction &MF) override
    {
      dbgs() << "simple regalloc running on: " << MF.getName() << "\n";

      // outs() << "simple regalloc not implemented\n";
      // abort();

      // Get some useful information about the target
      MRI = &MF.getRegInfo();
      const TargetSubtargetInfo &STI = MF.getSubtarget();
      TRI = STI.getRegisterInfo();
      TII = STI.getInstrInfo();
      MFI = &MF.getFrameInfo();
      MRI->freezeReservedRegs(MF);
      RegClassInfo.runOnMachineFunction(MF);

      // Allocate each basic block locally
      MF.print(dbgs());
      Used.clear();
      SpillMap.clear();
      for (MachineBasicBlock &MBB : MF)
      {
        allocateBasicBlock(MBB);
      }

      MRI->clearVirtRegs();

      // Recompute the analyses that we marked as preserved above, you can
      // safely ignore this code
      SlotIndexes &SI = getAnalysis<SlotIndexes>();
      SI.releaseMemory();
      SI.runOnMachineFunction(MF);

      LiveIntervals &LI = getAnalysis<LiveIntervals>();
      LI.releaseMemory();
      LI.runOnMachineFunction(MF);

      return true;
    }
  };
}

/// Create the initializer and register the pass
char RegAllocSimple::ID = 0;
FunctionPass *llvm::createSimpleRegisterAllocator() { return new RegAllocSimple(); }
INITIALIZE_PASS(RegAllocSimple, "regallocsimple", "Simple Register Allocator", false, false)
static RegisterRegAlloc simpleRegAlloc("simple", "simple register allocator", createSimpleRegisterAllocator);
