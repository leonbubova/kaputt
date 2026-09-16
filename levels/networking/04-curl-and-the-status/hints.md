## 1
Same curl as in the lesson, but the URL ends in `/old`. The `-w '%{http_code}'` part prints only the three-digit code.
## 2
    curl -s -o /dev/null -w '%{http_code}\n' http://localhost:8080/old
prints the number; then `echo NUMBER > /root/status.txt`.
## 3
    curl -s -o /dev/null -w '%{http_code}\n' http://localhost:8080/old
    echo 404 > /root/status.txt
