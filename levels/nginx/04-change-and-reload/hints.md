## 1
Two steps, always: change the file, then tell nginx to re-read it. Skipping the second step is the classic mistake — the file is right, the answer is old.
## 2
In default.conf, inside `location = /health { … }`, the line `return 200 "ok\n";` becomes `return 200 "alive\n";`. Keep the quotes, the `\n` and the `;`.
## 3
Edit the line, save, then:
    docker exec wg-nginx nginx -s reload
    curl -H 'Host: shop.local' http://127.0.0.1:8082/health
