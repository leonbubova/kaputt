    docker volume create wg-notes
    docker run -d --name wg-notes -v wg-notes:/notes alpine:3.20 sleep infinity
    docker exec wg-notes sh -c 'echo "keep me" > /notes/hello.txt'
