#!/bin/bash

#./rfind.sh r.txt > ~/spirv/r.log 2>&1
cut -d":" -f2- r.log | sed 's/^ *//' > r1.log
./sort r1.log > r_2.log
sort r1.log > r2.log
