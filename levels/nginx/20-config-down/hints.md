## 1
nginx parses its whole config at startup and refuses to start on any error — one bad line and the process exits, taking the container with it. "Connection refused" means nobody is listening at all, not a wrong answer. Check `docker ps -a | grep wg-nginx`, then read `docker logs wg-nginx`.
## 2
The log shows an unknown directive in conf.d/default.conf. A bad directive makes nginx refuse to start.
## 3
Remove the `bogus_directive on;` line, then `docker start wg-nginx`.
