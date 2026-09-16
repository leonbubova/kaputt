# talk to a port — curl and the status code
Lesson: a web server is a program listening on a port and speaking HTTP. `curl URL` opens a connection, asks
for the page, and prints the answer. A URL is address, port and a path: `http://localhost:8080/` means
"this machine, port 8080, the top page /". `-s` keeps curl quiet about progress.
Every HTTP answer carries a three-digit status code: `200` = fine, `404` = no such page, `500` = server crashed.
`-o /dev/null -w '%{http_code}'` throws the page away and prints only that code.
Try it — inside the box, a web server is listening on 8080:
    curl -s http://localhost:8080/
    curl -s -o /dev/null -w '%{http_code}\n' http://localhost:8080/
    curl -s http://localhost:9999/
The third one says `Connection refused` — nobody listens on 9999 (lesson 3 taught how to see that).
Your task: find the status code the server returns for the path `/old` (that is `http://localhost:8080/old`)
and write only the three digits into the file `/root/status.txt`.
Work inside the box (`wg shell`).
Check yourself:  wg check      stuck?  wg hint
