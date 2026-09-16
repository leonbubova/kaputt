## 1
"Who appears most" is a pipeline job: pull out one column, sort so equal values sit together, count the runs, sort by count. Build it step by step — first field only: `awk '{print $1}' /var/log/app/access.log | head`.
## 2
`uniq -c` counts *adjacent* duplicates, so sort first: `… | sort | uniq -c | sort -rn | head -3` gives the top 3 with counts.
## 3
`awk '{print $1}' /var/log/app/access.log | sort | uniq -c | sort -rn | head -1 | awk '{print $2}' > /answer`
