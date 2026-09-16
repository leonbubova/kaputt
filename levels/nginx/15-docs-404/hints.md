## 1
A path without its own location lands in `location /`, whose `try_files $uri $uri/ /index.html` hands out the app for anything that is not a file. /docs/ needs its own `location` so the fallback can be different there.
## 2
`try_files` tries each argument as a file (or directory) on disk in order; the last argument is what happens when none exists — `=404` makes that a status code instead of a file.
## 3
Add `location /docs/ { try_files $uri $uri/ =404; }` to the server and reload. Test: /docs/ → 200, /docs/nope → 404.
