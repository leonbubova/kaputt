# show me just the errors from this log
"Support gets `app.log` and only cares about the failures. Write `errors.sh FILE`: print every line of FILE that contains `ERROR`, nothing else, in the original order."
Goal: `errors.sh app.log` prints the three `ERROR` lines and no `INFO` lines.
