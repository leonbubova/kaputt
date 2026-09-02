# the worker container is gone right after start
"We start `wg-worker` from `alpine:3.20`, `docker ps` shows nothing a second later. No error on `docker run`."
Goal: a container named `wg-worker` (image `alpine:3.20`) that stays running and prints `worker ready` at startup.
