## 1
Two independent mechanisms are broken, so fix them separately: chain verification (the server must send the intermediate with the leaf, or clients can't reach a trusted root) and the HTTP→HTTPS redirect (port 80 stays cleartext unless its server block says otherwise). Two problems: `ssl_certificate` serves only the leaf, and the port-80 server no longer redirects.
## 2
Serve fullchain.crt for the chain, and restore `return 301 https://...` on port 80.
## 3
`ssl_certificate /etc/nginx/certs/fullchain.crt;` and `return 301 https://$host$request_uri;`, then reload.
