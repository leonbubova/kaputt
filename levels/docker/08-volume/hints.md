## 1
The file must end up in the volume, so the container that writes it must have the volume mounted: `-v wg-data:/data`.
## 2
`docker run -d --name wg-keeper -v wg-data:/data alpine:3.20 sleep infinity`, then write from inside: `docker exec wg-keeper sh -c 'echo "still here" > /data/note.txt'`.
## 3
    docker volume create wg-data
    docker run -d --name wg-keeper -v wg-data:/data alpine:3.20 sleep infinity
    docker exec wg-keeper sh -c 'echo "still here" > /data/note.txt'
    docker rm -f wg-keeper
    docker run --rm -v wg-data:/data alpine:3.20 cat /data/note.txt
