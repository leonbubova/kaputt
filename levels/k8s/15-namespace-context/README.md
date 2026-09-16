# a namespace for team A
Ticket: "Team A gets their own space. Create namespace `team-a`, deploy `web` there (image `nginx:1.27-alpine`, 1 replica is fine), and switch your kubectl context so that `team-a` is the default namespace — we're tired of typing `-n`."
Goal: deployment `web` is available in `team-a`, and `kubectl config view --minify` shows namespace `team-a`.
