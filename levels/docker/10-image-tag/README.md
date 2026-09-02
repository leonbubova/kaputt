# an image name is repo:tag, and a tag that is not in the registry cannot be pulled
Lesson: `redis:7-alpine` is two parts. `redis` is the repository; `7-alpine` is the tag, a label the publisher attached to one build. Tags are plain strings: `7-alpine`, `7.2-alpine`, `alpine` may all exist, `7-alpin` does not, and Docker cannot guess what you meant.
Before starting a service, compose must have its image locally or pull it. A pull for a tag that does not exist fails with "manifest unknown" or "not found" — and only that service fails. The others start normally: one container missing, the rest of the stack healthy.
The error is printed by the command that tried the pull. Re-run `docker compose up -d` and read it; it names the image it could not get. Then check which tags you do have locally.
    docker compose up -d                      start; the pull error names the missing image
    docker images REPO                        which tags of REPO are already local
    docker pull repo:tag                      try a tag on its own to see the exact error
Try it first: `docker pull alpine:3.20.nope` — the error text a bad tag produces.
Your task: "`docker compose up -d` in the new stack errors out and `wg-cache` never appears. `wg-web` is fine."
Goal: both `wg-web` and `wg-cache` (a redis 7) running from the compose file in `~/.k8s-wargame/docker/10-image-tag/`, and `docker exec wg-cache redis-cli ping` answers PONG.
Check yourself:  wg check      stuck?  wg hint
