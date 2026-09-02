## 1
The container is not running: `docker ps -a | grep wg-nginx`. Read `docker logs wg-nginx`.
## 2
The log shows an unknown directive in conf.d/default.conf. A bad directive makes nginx refuse to start.
## 3
Remove the `bogus_directive on;` line, then `docker start wg-nginx`.
