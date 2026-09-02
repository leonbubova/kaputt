# an image is a template, a container is a running copy: docker run starts one
Lesson: an image is a frozen filesystem plus a start command, pulled once and reused. A container is a live copy of that image with its own process. `docker run IMAGE` creates a container and starts its command; the same image can run a hundred times.
By default `docker run` stays attached to the container's output. `-d` (detach) hands it back to you and prints the container ID. `--name` gives it a name you can use everywhere instead of the ID.
A container has its own network — the nginx inside listens on port 80, but nothing on the host can see it. `-p HOST:CONTAINER` publishes it: traffic to the host port is forwarded to the container port.
    docker run -d --name n -p 8080:80 img    start detached, named, host 8080 -> container 80
    docker ps                                running containers, their ports and status
    docker logs n                            what the container printed
    docker rm -f n                           stop and delete it (to start over)
Try it first: `docker ps` — nothing named wg-web yet. `docker image ls nginx` shows which nginx images are already local.
Your task: "Marketing wants a placeholder page on this box today." Goal: a container named `wg-web` from image `nginx:1.27-alpine`, running in the background, with host port 18001 forwarded to the container's port 80 — `curl localhost:18001` shows the nginx welcome page.
Check yourself:  wg check      stuck?  wg hint
