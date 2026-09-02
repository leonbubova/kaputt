# on a user-defined network, containers reach each other by name
Lesson: every container gets a private IP, and that IP changes whenever the container is recreated. Hard-coding it is a bug waiting to happen. What you want is DNS: call the other container by its name and let Docker resolve it.
The default `bridge` network does not do that — containers on it only see IPs. A user-defined network (`docker network create`) has a built-in DNS server: every container attached to it can be reached as `http://<container-name>/` by every other container on it. Containers on different networks cannot see each other at all, which is also the isolation you want between stacks.
Attach a container at start with `--network NAME`. No port publishing needed for container-to-container traffic — that is only for reaching in from the host.
    docker network create name             a user-defined network with DNS
    docker run -d --network name img       start a container attached to it
    docker network inspect name            which containers are on it, with IPs
    docker exec a wget -qO- http://b/      from inside a, fetch b by name
Your task: "`wg-a` needs to reach `wg-b` as `http://wg-b/` — no hard-coded IPs, they change on every restart." Goal: a user-defined network `wg-net` with two running containers on it: `wg-b` (`nginx:1.27-alpine`) and `wg-a` (`busybox:1.36`, idling). `docker exec wg-a wget -qO- http://wg-b/` returns the nginx page.
Check yourself:  wg check      stuck?  wg hint
