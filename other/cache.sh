#!/bin/bash

find ~/spirv/llvm-project/llvm/projects/SPIRV-LLVM-Translator/test -exec ./r.sh {} \; > r.txt 2> /dev/null
LC_COLLATE=C sort r.txt > r_s.txt
grep -v -e \.spvasm -e \.spt -e DebugInfo/ -e SPV_INTEL -e negative/ -e CXX/ r_s.txt > r.txt
