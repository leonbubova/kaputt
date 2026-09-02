# HTTPS is HTTP behind a second listener that presents a certificate
Lesson: HTTPS is not a different protocol. It is plain HTTP wrapped in TLS, served by its own listener on port 443. nginx does nothing on 443 until a server block says `listen 443 ssl;` — a config with only a port-80 server has nothing to connect to there.
A TLS listener must present a certificate to every client and hold that certificate's private key to prove it owns it. So the minimal TLS server block is three lines: the listen, the cert, the key. Paths are as nginx sees them inside the container (/etc/nginx/certs), not on your disk.
Cert and key changes need a restart, not just a reload — nginx loads them at startup.
    listen 443 ssl;                                        the TLS listener
    ssl_certificate     /etc/nginx/certs/fullchain.crt;    what the server shows the client
    ssl_certificate_key /etc/nginx/certs/server.key;       the private half that proves it
    curl -k https://127.0.0.1:9443/                        does TLS answer? -k = skip cert checks
    docker restart wg-tls; docker logs wg-tls              apply; if it dies, the reason is here
Try it first: `curl http://127.0.0.1:9080/` works, `curl -k https://127.0.0.1:9443/` is refused — same nginx, one listener missing.
Your task: shop.local answers on port 80 but nothing listens on 443. The server certificate and key are already on disk under /etc/nginx/certs (fullchain.crt + server.key). Add a TLS server block on 443 that uses them and returns "tls ok".
Check yourself:  wg check      stuck?  wg hint
