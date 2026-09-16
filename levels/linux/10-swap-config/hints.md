## 1
Replacing a file destroys the old content, so the backup has to happen *before* the new one goes in: move the current file aside, then copy the new one into place. Look before you touch: `cat /etc/app/app.conf /tmp/upload/app.conf.new`.
## 2
`mv SRC DST` renames/moves (also works for a backup: `mv app.conf app.conf.bak`); `cp SRC DST` copies.
## 3
`mv /etc/app/app.conf /etc/app/app.conf.bak && cp /tmp/upload/app.conf.new /etc/app/app.conf`, then `ls -l /etc/app`.
