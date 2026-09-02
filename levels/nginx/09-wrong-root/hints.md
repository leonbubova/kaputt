## 1
`root` maps URLs onto a directory: /style.css becomes `<root>/style.css` on disk. Proxied locations never touch it — so static files 404 while dynamic locations still work means the `root` points somewhere with no files.
## 2
The files live in /usr/share/nginx/html (bind-mounted). Check the root directive.
## 3
Set `root /usr/share/nginx/html;` and reload.
