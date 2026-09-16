# keep data — volumes
Lesson: a container's files die with it: `docker rm`, and everything written inside is gone. A volume is a
piece of storage that docker keeps outside of any container. You mount it into a container at a path; whatever
lands at that path is really in the volume. Remove the container, mount the same volume into a new one — the
files are still there.
    docker volume create NAME       make a volume
    docker volume ls                list volumes
    docker run -v NAME:/path …      mount volume NAME at /path inside the container (a name, not a folder path)
Try it:
    docker volume create wg-try
    docker run --rm -v wg-try:/data alpine:3.20 sh -c 'echo test > /data/a.txt'
    docker run --rm -v wg-try:/data alpine:3.20 cat /data/a.txt
Two separate containers, both gone (`--rm`) — the file survived in the volume.
Your task: create a volume `wg-data`, start a container `wg-keeper` (`alpine:3.20`, background, `sleep infinity`)
with it mounted at `/data`, and with `docker exec` write the text `still here` into `/data/note.txt`.
Prove it: `docker rm -f wg-keeper`, then `docker run --rm -v wg-data:/data alpine:3.20 cat /data/note.txt` prints `still here`.
Check yourself:  wg check      stuck?  wg hint
