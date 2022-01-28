#!/bin/bash

#find ~/spirv/llvm-project/llvm/projects/SPIRV-LLVM-Translator/test -exec ./r.sh {} \; > r.txt 2> /dev/null
#LC_COLLATE=C sort r.txt > r_s.txt
#grep -v -e \.spvasm -e \.spt -e DebugInfo/ -e SPV_INTEL -e negative/ -e CXX/ r_s.txt > r.txt

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
  ./run.sh "$SLL"
done < "$1"
