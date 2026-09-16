## 1
proxy_pass in a location means: do not answer yourself, forward to this address and return whatever comes back. The backend's address is http://wg-backend:9000/.
## 2
The block goes inside server, next to the other locations. Both slashes matter: `location /shop/` and `proxy_pass http://wg-backend:9000/;` — then nginx -t, then reload.
## 3
Insert after `index index.html;`:
    location /shop/ { proxy_pass http://wg-backend:9000/; }
then `docker exec wg-nginx nginx -t` and `docker exec wg-nginx nginx -s reload`.
