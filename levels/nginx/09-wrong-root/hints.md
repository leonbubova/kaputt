## 1
Static files 404 while dynamic locations still work — the `root` is pointing somewhere with no files.
## 2
The files live in /usr/share/nginx/html (bind-mounted). Check the root directive.
## 3
Set `root /usr/share/nginx/html;` and reload.
