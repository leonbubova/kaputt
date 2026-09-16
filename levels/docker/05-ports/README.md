# reach a server inside — ports with -p
Lesson: a container has its own network. A web server inside it listens on port 80 *of the container* — nothing
on your machine can see that. `-p HOST:CONTAINER` connects a port of your machine to a port in the container:
    -p 18105:80        my port 18105 leads to the container's port 80
After that, `curl localhost:18105` on your machine reaches the server inside. `nginx:1.27-alpine` is a web
server image: its command is nginx, which never finishes, so a container from it stays Up by itself (no sleep needed).
Try it:
    docker run -d --name wg-try nginx:1.27-alpine
    curl localhost:18105          (connection refused: nginx runs, but no port leads to it)
    docker rm -f wg-try
Your task: start a container `wg-page` from `nginx:1.27-alpine` in the background, with your port 18105
connected to the container's port 80. `curl localhost:18105` must print a page containing `Welcome to nginx!`.
Check yourself:  wg check      stuck?  wg hint
