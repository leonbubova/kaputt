    awk '{print $1}' /var/log/app/access.log | sort | uniq -c | sort -rn | head -1 | awk '{print $2}' > /answer
