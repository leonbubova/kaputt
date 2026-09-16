# how many lines are in the oldest archived access log?
Ticket: "Before we purge rotated logs, storage wants numbers. `/var/log/app/access.log.3.gz` is the oldest one. Write its number of lines to `/answer`. Leave the archive as it is — don't unpack it in place, we still need it compressed."
Goal: `/answer` holds the line count of `access.log.3.gz`; the file is still there and still gzipped.
