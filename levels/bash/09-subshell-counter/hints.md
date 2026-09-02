## 1
Each stage of a pipeline runs in its own process, and a variable set in a child process never flows back to the parent. Add `echo "$count"` inside the loop — it climbs, yet the final value is 0.
## 2
The `while` runs in a pipeline, so it executes in a subshell; its `count` is discarded when the subshell ends.
## 3
Avoid the subshell: `count=$(grep -c "$2" "$1")`. (Or feed the loop with `< <(grep …)`.)
