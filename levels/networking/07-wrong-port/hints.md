## 1
`ss -ltn` shows a listener on :8081, not :8080.
## 2
The listen directive in the site config says 8081.
## 3
Change `listen 8081;` to `listen 8080;` and reload nginx.
