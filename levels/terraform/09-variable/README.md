# the greeting must be configurable, not hardcoded
"Write `out/greet.txt` containing `<greeting>, world`, where `greeting` is an input variable that defaults to `hi`. Ops must be able to override it with `-var`."
Goal: default apply writes `hi, world`; `apply -var greeting=yo` writes `yo, world`.
