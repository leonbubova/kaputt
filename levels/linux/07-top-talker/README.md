# pipelines: sort | uniq -c | sort -rn answers "which appears most"
Lesson: a pipe `|` sends one command's output into the next command's input. Instead of one tool that does everything, you chain small ones, each doing a single transformation. Build it left to right and look at the output after each step.
"Who appears most often" is a classic chain. `awk '{print $1}'` keeps only the first column. `sort` puts equal values next to each other — necessary because `uniq -c` only counts *adjacent* duplicates. `sort -rn` orders the counts numerically, biggest first, and `head -1` keeps the winner.
The result line looks like `  123 10.0.0.7` — count then value. One more `awk '{print $2}'` peels off the value alone.
    awk '{print $1}' FILE        first column of every line
    sort | uniq -c               group equal lines and count them
    sort -rn | head -3           highest counts first, top three
    awk '{print $2}'             second column: the value without its count
Try it first: `awk '{print $1}' /var/log/app/access.log | sort | uniq -c` — every client with its count.
Your task: "From `/var/log/app/access.log`, find the client IP (first field) with the most requests and write only that IP to `/answer`."
Goal: `/answer` contains the most frequent client IP.
Check yourself:  wg check      stuck?  wg hint
