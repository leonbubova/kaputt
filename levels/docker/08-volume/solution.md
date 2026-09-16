Create the volume, mount it with `-v wg-data:/data`, write the file through exec.
    docker volume create wg-data
    docker run -d --name wg-keeper -v wg-data:/data alpine:3.20 sleep infinity
    docker exec wg-keeper sh -c 'echo "still here" > /data/note.txt'
