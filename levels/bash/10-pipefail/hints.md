## 1
`firstword.sh nope.txt; echo $?` prints 0 even though `head` failed. Why isn't the failure seen?
## 2
A pipeline's exit status is that of its LAST command (`awk`, which succeeds). `head`'s failure is hidden.
## 3
Turn on `set -o pipefail` so the pipeline fails when any stage fails.
