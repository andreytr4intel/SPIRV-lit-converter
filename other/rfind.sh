#!/bin/bash

if [[ -z "$1" ]]; then
  echo "Usage:"
  echo "$0 <list_file>"
  echo 'Author:'
  echo 'Written by Andrey Tretyakov (Intel, 2022)'
  exit 1
fi

STEST=~/spirv/llvm-project/llvm/projects/SPIRV-LLVM-Translator/test/

while IFS='' read -r line || [[ -n "$line" ]]; do
  [[ -z "$line" ]] && continue
#  echo "$line"
  SLL="${STEST}${line}"
#  echo "$SLL"
  ./run.sh "$SLL" -spt -llc -lit
done < "$1"
