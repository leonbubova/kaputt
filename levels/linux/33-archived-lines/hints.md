## 1
Rotated logs ending in `.gz` are compressed; `cat` shows garbage. `zcat FILE` prints the uncompressed content to the terminal and leaves the file alone (`zless` and `zgrep` work the same way).
## 2
`wc -l` counts the lines it receives on stdin, so chain them: `zcat FILE | wc -l`.
## 3
`zcat /var/log/app/access.log.3.gz | wc -l > /answer`
