# configure the app through the environment
"Our app reads its region from the environment; ops wants to see that this works in a container before we ship." Goal: a running container `wg-app` from `alpine:3.20` that idles (e.g. `sleep infinity`) and has the environment variable `REGION=eu-central` — `docker exec wg-app printenv REGION` prints `eu-central`.
