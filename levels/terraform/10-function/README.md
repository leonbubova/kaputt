# the banner file must be uppercase
"Write `out/shout.txt` containing the variable `word` (default `hello`) in UPPERCASE — computed by terraform, not typed in by hand, so `-var word=bye` yields `BYE`."
Goal: default apply writes `HELLO`; `apply -var word=bye` writes `BYE`.
