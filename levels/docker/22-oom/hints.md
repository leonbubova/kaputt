## 1
A memory limit is a hard ceiling enforced by the kernel (a cgroup): if the container's processes use more, the kernel kills one and the container dies — the app only sees a crash. Docker records whether that happened: `docker inspect wg-report --format 'oom={{.State.OOMKilled}} mem={{.HostConfig.Memory}}'`.
## 2
`/dev/shm` is tmpfs — every byte written there counts as memory of the cgroup. 48 MB into a 32 MB limit can't work.
## 3
`docker update --memory=128m --memory-swap=128m wg-report && docker start wg-report`. Check `docker logs wg-report`.
