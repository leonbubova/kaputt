# a port mapping is a blind forward: the container side must be where the process listens
Lesson: `-p HOST:CONTAINER` does not check anything. Docker forwards whatever arrives on the host port to that container port, whether a process listens there or not. So a mapping can be "correct" as far as Docker is concerned and still lead nowhere.
The symptoms differ, and they are your diagnosis. "Connection refused" on the host port: nothing is published there at all. "Connection reset by peer" or an empty reply: the forward worked, the packet arrived inside the container, and nobody was listening on that port. The container is Running, the process is healthy — the two sides of the mapping just do not match.
Ports are fixed when the container is created. To change a mapping you recreate the container; there is no flag to edit it in place.
    docker port n                             the mappings of a running container
    docker exec n netstat -tln                what actually listens inside (works in nginx alpine)
    docker rm -f n && docker run ... -p H:C img       recreate with a corrected mapping
Try it first: `curl localhost:1` on the host — "connection refused" is what an unpublished port looks like; compare with what :18009 says.
Your task: "`wg-web` (nginx) is Running, but `curl localhost:18009` gives 'connection reset by peer'."
Goal: `http://localhost:18009/` returns the nginx welcome page from container `wg-web` (image `nginx:1.27-alpine`).
Check yourself:  wg check      stuck?  wg hint
