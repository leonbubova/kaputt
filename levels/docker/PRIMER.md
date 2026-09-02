# docker — the commands you'll actually use
  docker ps -a                       all containers (incl. stopped) and their STATUS
  docker logs <name>                 what the container printed — read this first when it exits
  docker inspect <name>              full config: ports, mounts, env, network
  docker exec -it <name> sh          a shell inside a running container
  docker run -d --name n -p 8080:80 img    run detached, publish host:container port
  docker build -t name:tag .         build an image from the Dockerfile here
  docker compose up -d / down        start / stop a compose stack
  docker network ls / inspect        which containers can reach each other
  docker volume ls                   named volumes (persist beyond the container)
  docker system df / prune           what's using disk / clean it

Mental model: an image is a template, a container is a running copy. A container that "exits immediately" ran its command and finished — `docker logs` tells you why.
