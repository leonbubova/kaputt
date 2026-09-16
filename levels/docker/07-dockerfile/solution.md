Three-line Dockerfile (FROM, COPY, CMD), built from its folder.
    printf 'FROM alpine:3.20\nCOPY hello.txt /hello.txt\nCMD ["cat", "/hello.txt"]\n' > ~/.k8s-wargame/docker/07-dockerfile/Dockerfile
    docker build -t wg-hello:1 ~/.k8s-wargame/docker/07-dockerfile
