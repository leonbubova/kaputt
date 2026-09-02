## 1
`NAME=value` sets a variable for the shell only; `export NAME` hands it on to programs. `env` is a program — it only sees exported variables.
## 2
`FAVORITE_COLOR=blue`, then `export FAVORITE_COLOR`, then `env > ~/.k8s-wargame/shell/sandbox/env.txt`. (`export FAVORITE_COLOR=blue` does the first two in one go.)
## 3
    export FAVORITE_COLOR=blue
    env > ~/.k8s-wargame/shell/sandbox/env.txt
