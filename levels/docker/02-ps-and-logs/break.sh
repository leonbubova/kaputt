source ../../../lib/common.sh; source ../lib.sh
setup_work; docker rm -f wg-secret >/dev/null 2>&1
docker run --name wg-secret alpine:3.20 echo "walrus-$RANDOM" >/dev/null 2>&1; true
