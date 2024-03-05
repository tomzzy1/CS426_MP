CLANG=clang
OPT=../../llvm-14.0.0.src/build/bin/opt
CLANG_FLAGS = -O1 -Xclang -disable-llvm-passes

default: all

SRCS := $(wildcard *.c)

all: $(SRCS:%.c=%.ll) $(SRCS:%.c=%_opt.ll) $(SRCS:%.c=%_ssa.ll) #$(SRCS:%.c=%.bc)

clean:
	rm -f *.ll

%.ll: %.c
	$(CLANG) $(CLANG_FLAGS) $+ -S -emit-llvm -o $@

%_opt.ll: %.ll
	$(OPT) -S -stats -load-pass-plugin=../build/libUnitProject.so -passes="function(mem2reg,loop-simplify,unit-licm,instcombine,simplifycfg,adce),inline,globaldce,function(sroa,early-cse,unit-sccp,jump-threading,correlated-propagation,simplifycfg,instcombine,simplifycfg,reassociate,adce,simplifycfg,instcombine),globaldce" ./$+ -o $@
#	$(OPT) -S -stats -passes="function(loop-simplify,mem2reg,licm,instcombine,simplifycfg,adce),inline,globaldce,function(sroa,early-cse,sccp,jump-threading,correlated-propagation,simplifycfg,instcombine,simplifycfg,reassociate,adce,simplifycfg,instcombine),globaldce" ./$+ -o $@
#%.bc: %.ll
#	$(OPT) -stats -load-pass-plugin=../build/libUnitProject.so -passes="function(mem2reg,loop-simplify,unit-licm,instcombine,simplifycfg,adce),inline,globaldce,function(sroa,early-cse,unit-sccp,jump-threading,correlated-propagation,simplifycfg,instcombine,simplifycfg,reassociate,adce,simplifycfg,instcombine),globaldce" ./$+ -o $@
#	$(OPT) -stats -passes="function(mem2reg,loop-simplify,instcombine,simplifycfg,adce),inline,globaldce,function(sroa,early-cse,sccp,jump-threading,correlated-propagation,simplifycfg,instcombine,simplifycfg,reassociate,adce,simplifycfg,instcombine),globaldce" ./$+ -o $@
%_ssa.ll: %.ll
	$(OPT) -S -passes="mem2reg" ./$+ -o $@