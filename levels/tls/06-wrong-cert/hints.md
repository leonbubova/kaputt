## 1
`curl --cacert <ca> --resolve shop.local:9443:127.0.0.1 https://shop.local:9443/` fails on the name.
## 2
The served certificate is issued to a different host. Check its subject with `openssl x509 -noout -subject -in`.
## 3
Point ssl_certificate/ssl_certificate_key back to fullchain.crt and server.key, then reload.
