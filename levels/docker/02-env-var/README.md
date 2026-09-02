# a container lives as long as its main process; -e puts config in its environment
Lesson: a container is one process in a box, not a machine. When that process ends, the container ends. `nginx` runs forever, so its container stays up. `alpine` has no daemon — its default command exits at once, so give it something that keeps running. Whatever follows the image name replaces the image's default command.
Configuration goes in through environment variables, not by editing files in the image. `-e KEY=value` sets one for the main process and everything it starts. Apps read their region, database URL and so on exactly this way, in Docker as in Kubernetes.
`docker exec` runs an extra command inside a running container — how you look around or read a variable back.
    docker run -d --name n -e KEY=value img cmd    start with an env var and an explicit command
    docker exec n printenv KEY                     read the variable back from inside
    docker ps -a                                   also shows containers that already exited
Try it first: `docker run --rm alpine:3.20 printenv` — the container runs printenv, prints, exits, and `--rm` deletes it.
Your task: "Our app reads its region from the environment; ops wants to see that this works in a container before we ship." Goal: a running container `wg-app` from `alpine:3.20` that idles (e.g. `sleep infinity`) and has the environment variable `REGION=eu-central` — `docker exec wg-app printenv REGION` prints `eu-central`.
Check yourself:  wg check      stuck?  wg hint
