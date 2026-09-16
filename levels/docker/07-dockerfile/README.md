# build your own image — the Dockerfile
Lesson: an image is built from a text file named `Dockerfile` — a recipe, one instruction per line:
    FROM alpine:3.20                start from this image
    COPY hello.txt /hello.txt       copy the file hello.txt from the folder here to /hello.txt in the image
    CMD ["cat", "/hello.txt"]       the command a container from this image runs (the list form, with quotes)
`docker build -t NAME:TAG .` reads the Dockerfile in the current folder (the `.`) and produces the image
NAME:TAG. Files that COPY mentions must be in that folder. Afterwards `docker images` lists your image and
`docker run` works with it like with any other.
Try it:
    cd ~/.k8s-wargame/docker/07-dockerfile
    ls
    cat hello.txt
Your task: in that folder, create a file named `Dockerfile` with exactly the three lines above, then build it as
the image `wg-hello:1`. `docker run --rm wg-hello:1` must print the text of hello.txt.
Work in ~/.k8s-wargame/docker/07-dockerfile — write the Dockerfile with any editor, build from inside the folder.
Check yourself:  wg check      stuck?  wg hint
