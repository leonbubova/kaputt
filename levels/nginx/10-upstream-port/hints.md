## 1
502 means nginx reached a location but could not talk to the upstream. Look at the proxy_pass target.
## 2
The backend listens on port 9000. Compare that with the port in proxy_pass.
## 3
Fix the port in `proxy_pass http://wg-backend:9099/` back to 9000 and reload.
