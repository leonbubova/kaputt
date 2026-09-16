# stop and remove
Lesson: containers pile up — every `docker run` makes a new one and stopped ones stay in `docker ps -a`, holding
their name. Three commands to clean up:
    docker stop NAME      end a running container (its command is told to quit); it still exists, as Exited
    docker rm NAME        delete a stopped container; the name is free again
    docker rm -f NAME     force: stop and delete in one go, works on running containers too
One flag for the future: `docker run --rm …` makes a container that deletes itself when its command finishes —
good for one-off runs, nothing left behind.
Try it:
    docker run --rm alpine:3.20 echo gone right after this
    docker ps -a          (no trace of it)
Your task: two leftovers exist: `wg-old` (running) and `wg-done` (exited). Stop and remove both, so that
`docker ps -a` lists neither name any more.
Check yourself:  wg check      stuck?  wg hint
