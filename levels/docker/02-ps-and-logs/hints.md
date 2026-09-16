## 1
A stopped container keeps its output. `docker ps -a` shows it exists; `docker logs wg-secret` shows what it printed.
## 2
Send the output into the file: `docker logs wg-secret > ~/.k8s-wargame/docker/02-ps-and-logs/word.txt` — or read the word and `echo WORD > …word.txt`.
## 3
    docker logs wg-secret > ~/.k8s-wargame/docker/02-ps-and-logs/word.txt
