## 1
Named volumes live outside any container: `docker volume create wg-notes`. Mount with `-v wg-notes:/notes` (a name, not a path, means a volume).
## 2
Start `docker run -d --name wg-notes -v wg-notes:/notes alpine:3.20 sleep infinity`, then write the file from inside: `docker exec wg-notes sh -c 'echo "keep me" > /notes/hello.txt'`.
## 3
Prove it: `docker rm -f wg-notes`, start the same `docker run` again, `docker exec wg-notes cat /notes/hello.txt`. Volumes survive `docker rm`.
