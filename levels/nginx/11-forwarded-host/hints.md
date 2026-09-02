## 1
Hit /api/whoami — the backend echoes the Host it received. It shows the upstream name, not shop.local.
## 2
Without `proxy_set_header Host`, nginx sends the proxy_pass host (wg-backend) as the Host.
## 3
Add `proxy_set_header Host $host;` in the /api/ location and reload.
