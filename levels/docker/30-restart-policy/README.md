# worker stays dead after a crash
"`wg-worker` crashes now and then (known bug, fix is weeks out). Every time, someone has to notice and start it by hand at 3am."
Goal: when the worker's process dies (simulate: `docker exec wg-worker pkill -9 sleep`), `wg-worker` is running again within 15 s — automatically. Image stays `alpine:3.20`.
