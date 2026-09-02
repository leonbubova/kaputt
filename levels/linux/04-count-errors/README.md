# grep -c counts matching lines; the pattern decides what you count
Lesson: `grep PATTERN FILE` prints every line containing the pattern. `grep -c` prints only how many lines matched. Counting things in a log is therefore two steps: understand what a line looks like, then write a pattern that matches exactly the lines you mean and nothing else.
Log lines have a fixed shape. A status code sits in a known position with known neighbours — a space before, a space after, a quote nearby. Those neighbours belong in the pattern. `500` alone also matches a response size of 1500 or an IP octet; `" 500 ` with its surroundings does not.
Look at the data before writing the pattern. `head` shows the first lines, and a quick `grep` without `-c` shows what your pattern really catches.
    head -3 FILE                 see the shape of a line
    grep ' 500 ' FILE | head     check what the pattern hits
    grep -c ' 500 ' FILE         count matching lines
    grep -c PATTERN FILE > /answer   save the number
Try it first: `grep -c 500 /var/log/app/access.log` vs `grep -c ' 500 ' /var/log/app/access.log` — the numbers differ.
Your task: "Management wants a number: how many requests in `/var/log/app/access.log` got HTTP status `500`? Write just the number to `/answer`." (Status is the field after the quoted request. Only 500 — not 502, not 503.)
Goal: `/answer` contains the count.
Check yourself:  wg check      stuck?  wg hint
