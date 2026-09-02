source ../../../lib/common.sh; source ../lib.sh
setup_work; mkdir -p "$WORK/stie"
docker rm -f wg-web >/dev/null 2>&1
docker run -d --name wg-web -p 127.0.0.1:18011:80 -v "$WORK/stie:/usr/share/nginx/html:ro" nginx:1.27-alpine >/dev/null
