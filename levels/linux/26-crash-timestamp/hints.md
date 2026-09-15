## 1
Log rotation renames old files (`.1`, `.2.gz`…) and compresses the older ones, so last week's line is not in the current file — and plain `grep` cannot read the gzipped ones. `ls -l /var/log/app/` shows what is there.
## 2
`zgrep FATAL /var/log/app/app.log*` searches plain and gzipped files in one go. Beware the WARN lines about the pool — you want `FATAL`.
## 3
`zgrep -h FATAL /var/log/app/app.log* | awk '{print $1}' > /answer`
