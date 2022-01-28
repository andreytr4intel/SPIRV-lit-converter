#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Usage:"
  echo "$0 <file.ll>"
  echo 'Author:'
  echo 'Written by Andrey Tretyakov (Intel, 2022)'
  exit 1
fi

[[ ! -f "$1" ]] && exit 1
#grep llvm-spirv "$1" > /dev/null || exit 1

STEST=~/spirv/llvm-project/llvm/projects/SPIRV-LLVM-Translator/test/
SLL=$1
SLL=${SLL#$STEST}

OUT=`./strip.py $1`
EX=$?
if [[ $EX == 0 && -n "$OUT" ]]; then
#  echo "$SLL"
  echo "$SLL:$OUT"
  echo
fi
