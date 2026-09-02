source ../../../lib/common.sh; source ../lib.sh
setup_work
docker rm -f wg-web >/dev/null 2>&1; docker network rm wg-net >/dev/null 2>&1; docker network create wg-net >/dev/null
docker run -d --name wg-web --network wg-net -v "$WORK/nginx.conf:/etc/nginx/nginx.conf:ro" nginx:1.27-alpine >/dev/null
secret=$(uuidgen | tr 'A-F' 'a-f'); echo "$secret" > "${WG_STATE:-$HOME/.k8s-wargame}/docker.20.secret"
docker run --rm --network wg-net -e S="$secret" busybox:1.36 sh -c '
  rid(){ cat /proc/sys/kernel/random/uuid; }
  i=0; until wget -qO- -T 2 http://wg-web/ >/dev/null 2>&1 || [ $i -gt 20 ]; do sleep 1; i=$((i+1)); done
  for i in $(seq 1 120); do wget -qO- -T 2 --header "X-Request-Id: $(rid)" http://wg-web/ >/dev/null 2>&1
    [ $i -eq 77 ] && wget -qO- -T 2 --header "X-Request-Id: $S" http://wg-web/checkout >/dev/null 2>&1
    [ $i -eq 40 ] && wget -qO- -T 2 --header "X-Request-Id: $(rid)" http://wg-web/cart >/dev/null 2>&1
  done; true' >/dev/null 2>&1
