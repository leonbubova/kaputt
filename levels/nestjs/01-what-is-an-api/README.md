# an API is a program that answers requests
Lesson: an HTTP API is a program that runs and waits. You send it a request — a method (`GET`) plus an address
(`localhost:3200/health`) — and it sends back an answer, usually text in JSON form like `{"status":"ok"}`. A browser
does exactly this when it opens a page. Here we use `curl`: a command that sends one request and prints the answer.
`localhost` means "this computer", `3200` is the port — the door number the program listens on.
Try it — the API needs its own terminal, because it keeps running. Terminal 1:
    cd ~/.k8s-wargame/nestjs/app
    npm run start:dev
Wait for the line `api listening on http://localhost:3200`. Now open a second terminal and send a request:
    curl -s localhost:3200/health
The answer: `{"data":{"status":"ok","uptime":3}}` — this app wraps every answer in `data`, a house rule, ignore it for
now. `-s` only hides curl's progress bar. Try `curl -s localhost:3200/users` too. Ctrl+C in terminal 1 stops the API;
after that curl gets no answer at all — an API only answers while it runs.
Your task: send a GET request for `/users/1` and save the answer into the file `~/.k8s-wargame/nestjs/app/answer.txt`
(the `>` from the shell track sends curl's output into a file instead of the screen).
Work in ~/.k8s-wargame/nestjs/app (`wg shell` takes you there). Server: `npm run start:dev` in that folder, in its own terminal — every `wg level` stops it, start it again.
Check yourself:  wg check      stuck?  wg hint
