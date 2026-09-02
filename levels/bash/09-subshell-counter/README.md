# the error counter always reports 0
"`count-matches.sh FILE PATTERN` should print how many lines of FILE contain PATTERN. The log clearly has errors, but it always prints `0`."
Goal: with a log of 3 lines containing `ERROR`, `count-matches.sh app.log ERROR` prints `3`.
