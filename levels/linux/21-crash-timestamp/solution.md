The FATAL line is in `app.log.2.gz`.
    zgrep -h FATAL /var/log/app/app.log* | awk '{print $1}' > /answer     # 2026-08-30T02:17:43Z
