# two containers must talk by name
"`wg-a` needs to reach `wg-b` as `http://wg-b/` — no hard-coded IPs, they change on every restart." Goal: a user-defined network `wg-net` with two running containers on it: `wg-b` (`nginx:1.27-alpine`) and `wg-a` (`busybox:1.36`, idling). `docker exec wg-a wget -qO- http://wg-b/` returns the nginx page.
