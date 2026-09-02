## 1
Look at the `try_files` line in `location /`. Its last argument decides what happens when no file matches.
## 2
Ending try_files with `=404` returns a hard 404. A SPA needs to fall back to /index.html.
## 3
Change the last argument to `/index.html`: `try_files $uri $uri/ /index.html;` then reload.
