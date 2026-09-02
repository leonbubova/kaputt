# tls — the commands you'll actually use
Config: ~/.k8s-wargame/tls/app/conf.d/default.conf, certs in ~/.k8s-wargame/tls/app/certs/ (= /etc/nginx/certs inside wg-tls). Site: https://127.0.0.1:9443, http://127.0.0.1:9080.

  curl -k https://127.0.0.1:9443/                 does TLS answer at all? (-k = skip cert verification)
  curl -skI https://127.0.0.1:9443/               headers only — e.g. is Strict-Transport-Security there?
  curl -s -o /dev/null -w '%{http_code}' http://127.0.0.1:9080/    is port 80 a 301 to https?
  curl --cacert certs/root.crt --resolve shop.local:9443:127.0.0.1 https://shop.local:9443/    verify like a real client: chain + hostname
  curl -sk --http2 -w '%{http_version}' https://127.0.0.1:9443/    1.1 or 2?
  openssl x509 -noout -subject -in certs/x.crt    who is this cert for? (-dates for validity, -ext subjectAltName for names)
  docker logs wg-tls                              nginx won't start? the reason is here (key mismatch, no such file)
  docker exec wg-tls nginx -t  /  nginx -s reload  check / apply;  docker restart wg-tls if the container is dead
  listen 443 ssl;  ssl_certificate /etc/nginx/certs/fullchain.crt;  ssl_certificate_key /etc/nginx/certs/server.key;    the TLS server block
  ssl_protocols TLSv1.2 TLSv1.3;  http2 on;  add_header Strict-Transport-Security "max-age=31536000" always;    the usual hardening lines
  return 301 https://$host$request_uri;           in the listen-80 server: push everyone to https

Mental model: a TLS server needs three things that agree — the cert, ITS private key, and the chain up to a CA the client trusts. Key ≠ cert → nginx won't start. Leaf without intermediate → "unable to get local issuer certificate". Wrong SAN → hostname mismatch. `curl -k` skips all of that: use it to ask "is the port alive", never "is it correct".
