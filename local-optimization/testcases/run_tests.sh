#!/usr/bin/env bash
# For each testcase:  <name>.c --clang--> <name>.ll --opt local-opt--> <name>.opt.ll
# Both .ll files are written next to the testcase.
cd "$(dirname "$0")"
LLVM=${LLVM:-../../build/bin}
PLUGIN=${PLUGIN:-../build/LocalOptimization.so}

for src in *.c; do
  name=${src%.c}
  # -disable-O0-optnone: otherwise opt skips every -O0 function.
  $LLVM/clang -S -emit-llvm -O0 -Xclang -disable-O0-optnone \
      -fno-discard-value-names $src -o $name.ll &&
  $LLVM/opt -load-pass-plugin=$PLUGIN -passes=local-opt -S \
      $name.ll -o $name.opt.ll &&
  echo "OK   $name" || echo "FAIL $name"
done
