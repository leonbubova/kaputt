## 1
`ls -l /var/log/app/`. Rotated files end in `.1`, `.2.gz`… — the `.gz` ones are compressed.
## 2
`zgrep FATAL /var/log/app/app.log*` searches plain and gzipped files in one go. Beware the WARN lines about the pool — you want `FATAL`.
## 3
`zgrep -h FATAL /var/log/app/app.log* | awk '{print $1}' > /answer`
