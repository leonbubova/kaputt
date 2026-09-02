source ../../../lib/common.sh; source ../lib.sh
docker rm -f wg-worker >/dev/null 2>&1
docker run -d --name wg-worker alpine:3.20 sh -c 'echo "worker booting"; ehco "worker ready"; exec sleep infinity' >/dev/null
