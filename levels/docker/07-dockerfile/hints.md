## 1
The Dockerfile is a plain text file named exactly `Dockerfile` (capital D, no extension) in the same folder as hello.txt. Three lines: FROM, COPY, CMD.
## 2
Then, standing in `~/.k8s-wargame/docker/07-dockerfile`: `docker build -t wg-hello:1 .` — the `.` is the folder to build from. Test with `docker run --rm wg-hello:1`.
## 3
    cd ~/.k8s-wargame/docker/07-dockerfile
    printf 'FROM alpine:3.20\nCOPY hello.txt /hello.txt\nCMD ["cat", "/hello.txt"]\n' > Dockerfile
    docker build -t wg-hello:1 .
    docker run --rm wg-hello:1
