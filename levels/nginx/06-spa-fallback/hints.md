## 1
`try_files` tests each argument as a file on disk and serves the first hit; the last argument is what happens when none exist. A deep link like /dashboard is not a file — it only works if that fallback hands out index.html. Look at the `try_files` line in `location /`.
## 2
Ending try_files with `=404` returns a hard 404. A SPA needs to fall back to /index.html.
## 3
Change the last argument to `/index.html`: `try_files $uri $uri/ /index.html;` then reload.
