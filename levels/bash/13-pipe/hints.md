## 1
You have a command that prints the matching lines and one that counts lines. What's missing is a way to hand the output of the first to the second without a file in between.
## 2
`a | b` runs both and sends everything `a` prints into `b`'s input — a pipe.
## 3
`grep ERROR "$1" | wc -l` — write it to error-count.sh.
