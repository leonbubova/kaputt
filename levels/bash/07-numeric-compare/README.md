# 'max' picks 9 over 100
"`maxnum.sh A B` should print the larger of two numbers. QA reports `maxnum.sh 9 100` prints `9`. Fix the comparison."
Goal: `maxnum.sh 9 100` prints `100`; `maxnum.sh 100 9` prints `100`; `maxnum.sh 5 5` prints `5`.
