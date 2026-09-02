## 1
Look before you touch: `cat /etc/app/app.conf /tmp/upload/app.conf.new`. Order matters — back up first.
## 2
`mv SRC DST` renames/moves (also works for a backup: `mv app.conf app.conf.bak`); `cp SRC DST` copies.
## 3
`mv /etc/app/app.conf /etc/app/app.conf.bak && cp /tmp/upload/app.conf.new /etc/app/app.conf`, then `ls -l /etc/app`.
