source ../../../lib/common.sh; source ../lib.sh
docker rm -f wg-web >/dev/null 2>&1
docker run -d --name wg-web -p 127.0.0.1:18009:8080 nginx:1.27-alpine >/dev/null
