source ../../../lib/common.sh; source ../lib.sh
setup_work; docker rm -f wg-web >/dev/null 2>&1
docker run -d --name wg-web nginx:1.27-alpine >/dev/null
