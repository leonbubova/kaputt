## 1
Build the pipe step by step. First field only: `awk '{print $1}' /var/log/app/access.log | head`.
## 2
`uniq -c` counts *adjacent* duplicates, so sort first: `… | sort | uniq -c | sort -rn | head -3` gives the top 3 with counts.
## 3
`awk '{print $1}' /var/log/app/access.log | sort | uniq -c | sort -rn | head -1 | awk '{print $2}' > /answer`
