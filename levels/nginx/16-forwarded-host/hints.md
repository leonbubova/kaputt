## 1
When nginx proxies, it builds a fresh request to the upstream — and by default the Host header is the proxy_pass hostname, not what the browser sent. The original Host only gets through if you forward it on purpose. Hit /api/whoami — the backend echoes the Host it received: the upstream name, not shop.local.
## 2
Without `proxy_set_header Host`, nginx sends the proxy_pass host (wg-backend) as the Host.
## 3
Add `proxy_set_header Host $host;` in the /api/ location and reload.
