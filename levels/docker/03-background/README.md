# keep it running — the -d flag
Lesson: a container lives exactly as long as its command. `echo` finishes at once, so that container stops at
once. A server (web server, database) is a command that never finishes — its container stays `Up`. Two things
make that comfortable:
    -d                 detach: start the container in the background and give the prompt back at once
    sleep infinity     a command that never finishes — a stand-in for a server while you learn
With `-d`, docker prints only the container's long id and returns; the container keeps running. Check with `docker ps`.
Try it:
    docker run -d --name wg-try alpine:3.20 sleep 20
    docker ps
    docker ps -a       (again after 20 seconds: it went from Up to Exited)
Your task: start a container named `wg-clock` from `alpine:3.20`, in the background, with the command
`sleep infinity`, so that `docker ps` lists it as `Up` — and keeps listing it.
Check yourself:  wg check      stuck?  wg hint
