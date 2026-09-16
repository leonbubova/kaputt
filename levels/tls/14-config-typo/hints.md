## 1
nginx parses the whole config at startup and exits on the first error — and the container dies with it, so `docker ps -a` shows wg-tls as Exited. Its last words are kept: `docker logs wg-tls` prints the error with file and line number.
## 2
The log says `unknown directive` — a misspelled directive name on that line of default.conf. Every directive name must match exactly.
## 3
`docker logs wg-tls` names the line; the directive is `ssl_protocols` (plural). Fix it, then `docker start wg-tls`.
