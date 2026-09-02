## 1
`docker inspect wg-worker --format '{{.HostConfig.RestartPolicy}}'` — what does Docker do when the process exits?
## 2
Restart policies: `no`, `on-failure`, `always`, `unless-stopped`. Note: `docker stop`/`docker kill` are manual — a policy only reacts to the process dying on its own.
## 3
No recreate needed: `docker update --restart=unless-stopped wg-worker` (or `--restart=always`); `docker start` it if it is currently dead. Then crash it and watch `docker ps`.
