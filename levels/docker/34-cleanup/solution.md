Three rebuilds of `wg-junk:latest` left dangling layers; one-off containers and their volumes were never removed.
    docker rm $(docker ps -aq -f name=^wg-old-); docker volume rm $(docker volume ls -q -f name=^wg-old-); docker image prune -f
