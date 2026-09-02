## 1
`curl -k https://127.0.0.1:9443/` fails the handshake. Check `ssl_protocols`.
## 2
It is set to an obsolete version modern clients won't negotiate.
## 3
Set `ssl_protocols TLSv1.2 TLSv1.3;` and reload.
