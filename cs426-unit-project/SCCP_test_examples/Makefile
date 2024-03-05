CLANG=clang
OPT=../../llvm-14.0.0.src/build/bin/opt
CLANG_FLAGS = -O1 -Xclang -disable-llvm-passes

default: all

SRCS := $(wildcard *.c)

all: $(SRCS:%.c=%.ll) $(SRCS:%.c=%_opt.ll)

clean:
	rm -f *.ll

%.ll: %.c
	$(CLANG) $(CLANG_FLAGS) $+ -S -emit-llvm -o $@

%_opt.ll: %.ll
	$(OPT) -S -stats -load-pass-plugin=../build/libUnitProject.so -passes="mem2reg,unit-sccp" ./$+ -o $@

