## 1
Docker never restarts a container on its own: when the main process dies, the container simply stays Exited — unless a restart policy tells the daemon otherwise. `docker inspect wg-worker --format '{{.HostConfig.RestartPolicy}}'` shows what the worker has.
## 2
Restart policies: `no`, `on-failure`, `always`, `unless-stopped`. Note: `docker stop`/`docker kill` are manual — a policy only reacts to the process dying on its own.
## 3
No recreate needed: `docker update --restart=unless-stopped wg-worker` (or `--restart=always`); `docker start` it if it is currently dead. Then crash it and watch `docker ps`.
