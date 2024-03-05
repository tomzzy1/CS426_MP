CLANG=clang
OPT=opt
CLANG_FLAGS = -O1 -Xclang -disable-llvm-passes

default: all

SRCS := $(wildcard *.c)

all: $(SRCS:%.c=%.ll) $(SRCS:%.c=%_opt.ll)

clean:
	rm -f *.ll

%.ll: %.c
	$(CLANG) $(CLANG_FLAGS) $+ -S -emit-llvm -o $@

%_opt.ll: %.ll
	$(OPT) -load-pass-plugin=../build/libUnitProject.so -passes="function(unit-licm,mem2reg,instcombine,simplifycfg,adce),inline,globaldce,function(sroa,early-cse,unit-sccp,jump-threading,correlated-propagation,simplifycfg,instcombine,simplifycfg,reassociate,adce,simplifycfg,instcombine),globaldce" ./$+ -o $@

