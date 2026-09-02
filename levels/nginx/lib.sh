# nginx-track helpers — sourced by break.sh / check.sh after lib/common.sh (cwd = level dir)
WG_NGX=$HOME/.k8s-wargame/nginx; APP=$WG_NGX/app; CONF=$APP/conf.d/default.conf
URL=http://127.0.0.1:8082; SURL=https://127.0.0.1:8443
sedi() { if sed --version >/dev/null 2>&1; then sed -i "$@"; else sed -i '' "$@"; fi; }
# insert a line after the first line matching PATTERN (BRE) in $CONF
ins_after() { awk -v pat="$1" -v txt="$2" '{print} !done && $0 ~ pat {print txt; done=1}' "$CONF" > "$CONF.tmp" && mv "$CONF.tmp" "$CONF"; }
# delete a whole "location X {" … "}" block (one level of braces)
del_block() { awk -v pat="$1" '$0 ~ pat && !skip {skip=1} skip {if ($0 ~ /}/) {skip=0}; next} {print}' "$CONF" > "$CONF.tmp" && mv "$CONF.tmp" "$CONF"; }
ngx_reload()  { docker exec wg-nginx nginx -s reload >/dev/null 2>&1 || true; sleep 1; }
ngx_restart() { docker restart wg-nginx >/dev/null 2>&1 || true; sleep 2; }
# http helpers — always talk to the shop.local vhost unless a Host is given
code() { curl -s -k -o /dev/null -m 5 -w '%{http_code}' -H "Host: ${2:-shop.local}" "$1"; }       # url [host]
body() { curl -s -k -m 5 -H "Host: ${2:-shop.local}" "$1"; }                                        # url [host]
hdr()  { curl -s -k -m 5 -D - -o /dev/null -H "Host: shop.local" "$@" | tr -d '\r' | awk -v h="$HDR" 'tolower($1)==tolower(h":"){sub(/^[^:]*: */,""); print}'; }  # HDR=name hdr url [curl opts]
running() { [ "$(docker inspect -f '{{.State.Running}}' wg-nginx 2>/dev/null)" = true ] || fail "wg-nginx is not running — docker logs wg-nginx, then docker start wg-nginx"; }
conf_ok() { docker exec wg-nginx nginx -t >/dev/null 2>&1 || fail "nginx -t fails inside wg-nginx"; }
