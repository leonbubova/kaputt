# image vs container — your first docker run
Lesson: Docker runs a program inside a container: a small separate machine with its own files, cut off from
your real machine. A container is started from an image. The image is the frozen template (a set of files plus
the program to start); the container is a running copy of it. One image, as many containers as you like.
    docker images                      the images on this machine
    docker run IMAGE COMMAND           make a NEW container from IMAGE and run COMMAND inside it
Every container gets a name. Give it one with `--name NAME` (otherwise docker invents a random one).
Try it:
    docker images
    docker run --name wg-try alpine:3.20 echo hi from a container
`alpine:3.20` is a tiny Linux image (name:tag — the tag is the version). The second line makes a container `wg-try`,
runs `echo` inside it, and the container stops because its command is finished. Run the line again: docker
refuses, the name is taken — a stopped container still exists (lesson 4 shows how to remove it).
Your task: run a container named `wg-hello` from the image `alpine:3.20` whose command prints exactly `hello from docker`.
Work in your normal terminal, any folder — docker commands do not care where you stand.
Check yourself:  wg check      stuck?  wg hint
