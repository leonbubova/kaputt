## 1
Filtering lines by content is a job for a tool, not a loop. Look at `app.log` first so you know what the output should be.
## 2
`grep PATTERN FILE` prints only the lines of FILE that contain PATTERN.
## 3
`grep ERROR "$1"` — write it to errors.sh.
