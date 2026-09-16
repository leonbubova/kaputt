## 1
One line: five time fields, then the user, then the command. "Every minute" is a `*` in every time field.
## 2
Write it with echo in single quotes so the stars survive: `echo '* * * * * root /opt/hello/say.sh' > /etc/cron.d/hello`. Check with `cat /etc/cron.d/hello`.
## 3
    echo '* * * * * root /opt/hello/say.sh' > /etc/cron.d/hello
