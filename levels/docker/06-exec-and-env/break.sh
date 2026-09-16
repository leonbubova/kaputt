source ../../../lib/common.sh; source ../lib.sh
docker rm -f wg-box wg-greet >/dev/null 2>&1
docker run -d --name wg-box alpine:3.20 sleep infinity >/dev/null 2>&1; true
