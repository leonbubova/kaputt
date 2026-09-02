# app can't write its log
"`/opt/app/run.sh` is started as user `app` and fails with `Permission denied` on the log. Worked yesterday, then ops 'cleaned up /var/log'."
Goal: `su - app -c /opt/app/run.sh` prints `run ok` and `/var/log/app/app.log` gets the entry. Log must stay in `/var/log/app/`.
