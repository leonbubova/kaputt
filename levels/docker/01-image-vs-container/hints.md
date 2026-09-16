## 1
`docker run IMAGE COMMAND` starts a new container from IMAGE and runs COMMAND in it. `--name` goes between `run` and the image.
## 2
The image is `alpine:3.20`, the command is `echo` with the words `hello from docker` as its arguments — same shape as the Try-it line.
## 3
    docker run --name wg-hello alpine:3.20 echo hello from docker
