# a named volume keeps data alive after the container is gone
Lesson: a container's own filesystem dies with it — `docker rm` wipes everything written inside. A bind mount avoids that with a host path you manage yourself. A named volume is the other option: Docker-managed storage with a name, living outside any container, attachable to one container after another.
Same `-v` flag, different left side: a name instead of a path (no leading `/`) means a volume. Docker creates it on first use, or you create it with `docker volume create`. Replacing the container — upgrade, crash, rebuild — does not touch the volume; the next container that mounts it sees the same files.
Databases survive this way: the container is disposable, the volume is not.
    docker volume create name              create a volume (optional, -v creates it too)
    docker run -v name:/path img           mount the volume at /path in the container
    docker run --rm -v name:/x img ls /x   peek into a volume
Try it first: `docker run --rm -v wg-scratch:/d alpine:3.20 touch /d/t; docker volume ls` — the volume outlived its container.
Your task: "Whatever we save in the `notes` container is gone after every upgrade." Goal: a named volume `wg-notes` mounted at `/notes` in a running container `wg-notes` (`alpine:3.20`), containing a file `/notes/hello.txt` with the text `keep me` — and that file must still be there after `docker rm -f wg-notes` and a fresh container with the same volume.
Check yourself:  wg check      stuck?  wg hint
