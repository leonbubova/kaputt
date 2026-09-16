# what is there? — docker ps and docker logs
Lesson: `docker ps` lists the containers that are running right now. A container whose command has finished is
not running any more, but it still exists: `docker ps -a` lists all of them. Read the STATUS column: `Up …`
means running, `Exited (0) …` means finished (the number is the exit code, 0 = fine). Everything a container
printed is kept, even after it stopped: `docker logs NAME` shows it. When a container does not do what you
expect, this is always the first thing to look at.
    docker ps          running containers
    docker ps -a       all containers, including stopped ones
    docker logs NAME   what NAME printed
Try it:
    docker ps
    docker ps -a
    docker logs wg-secret
Your task: the container `wg-secret` already ran and printed one word. Write that word — nothing else — into the
file `~/.k8s-wargame/docker/02-ps-and-logs/word.txt`. (The folder exists. `>` from the shell track works on
`docker logs` too, or type the word with echo.)
Check yourself:  wg check      stuck?  wg hint
