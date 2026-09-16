## 1
A location block goes inside the server block — between its `{` and its closing `}`, next to the other location blocks. Copy the block from the lesson exactly, every line ending in `;`.
## 2
After saving: `docker exec wg-nginx nginx -t`. If it names a line, fix that line. Only then `docker exec wg-nginx nginx -s reload`.
## 3
Insert after `index index.html;`:
    location = /ping { default_type text/plain; return 200 "pong\n"; }
then `docker exec wg-nginx nginx -t` and `docker exec wg-nginx nginx -s reload`.
