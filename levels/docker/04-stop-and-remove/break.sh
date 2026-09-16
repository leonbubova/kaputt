source ../../../lib/common.sh; source ../lib.sh
docker rm -f wg-old wg-done >/dev/null 2>&1
docker run -d --name wg-old alpine:3.20 sleep infinity >/dev/null 2>&1
docker run --name wg-done alpine:3.20 echo done >/dev/null 2>&1; true
