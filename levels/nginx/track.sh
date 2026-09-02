# track: one nginx container (wg-nginx) + a tiny upstream (wg-backend). Config lives on the host:
# ~/.k8s-wargame/nginx/app/conf.d/*.conf  → bind-mounted into /etc/nginx/conf.d
# ~/.k8s-wargame/nginx/app/html/          → /usr/share/nginx/html
# ~/.k8s-wargame/nginx/app/certs/         → /etc/nginx/certs
WG_NGX=$HOME/.k8s-wargame/nginx; WG_NGX_IMG=nginx:1.27-alpine
track_start() {
  docker info >/dev/null 2>&1 || { echo "docker daemon not reachable — start colima/docker" >&2; return 1; }
  command -v openssl >/dev/null || { echo "openssl missing (brew install openssl)" >&2; return 1; }
  command -v curl >/dev/null || { echo "curl missing" >&2; return 1; }
  echo "pulling ${WG_NGX_IMG}…"; { docker image inspect "$WG_NGX_IMG" >/dev/null 2>&1 || docker pull -q "$WG_NGX_IMG"; } >/dev/null 2>&1 || true
  mkdir -p "$WG_NGX"; ngx_certs
  echo "config: $WG_NGX/app/conf.d/   site: http://127.0.0.1:8082  https://127.0.0.1:8443 (Host: shop.local)"
  echo "apply:  docker exec wg-nginx nginx -s reload   (dead container: docker start wg-nginx)"
}
track_stop()  { ngx_down; rm -rf "$WG_NGX"; }
track_ready() { docker info >/dev/null 2>&1 && docker image inspect "$WG_NGX_IMG" >/dev/null 2>&1; }
track_shell() { docker exec -it wg-nginx sh; }
ngx_certs() {  # self-signed cert for shop.local, generated once
  [ -s "$WG_NGX/certs/shop.key" ] && return 0; mkdir -p "$WG_NGX/certs"
  openssl req -x509 -newkey rsa:2048 -nodes -days 3650 -subj /CN=shop.local \
    -keyout "$WG_NGX/certs/shop.key" -out "$WG_NGX/certs/shop.crt" >/dev/null 2>&1
}
ngx_down() {
  docker rm -f wg-nginx wg-backend >/dev/null 2>&1 || true
  docker network rm wg-nginx-net >/dev/null 2>&1 || true
}
track_wipe() {  # before each level: fresh containers + template config
  local tpl="$WG_ROOT/levels/nginx/template" app="$WG_NGX/app"
  ngx_down; mkdir -p "$WG_NGX"; ngx_certs
  rm -rf "$app" "$WG_NGX/backend"; mkdir -p "$app"
  cp -R "$tpl/conf.d" "$tpl/html" "$app/"; mkdir -p "$app/certs"; cp "$WG_NGX/certs/"* "$app/certs/"
  cp -R "$tpl/backend" "$WG_NGX/backend"
  docker network create wg-nginx-net >/dev/null 2>&1
  docker run -d --name wg-backend --network wg-nginx-net \
    -v "$WG_NGX/backend:/etc/nginx/conf.d:ro" "$WG_NGX_IMG" >/dev/null
  docker run -d --name wg-nginx --network wg-nginx-net \
    -p 127.0.0.1:8082:80 -p 127.0.0.1:8443:443 \
    -v "$app/conf.d:/etc/nginx/conf.d" -v "$app/html:/usr/share/nginx/html" \
    -v "$app/certs:/etc/nginx/certs:ro" "$WG_NGX_IMG" >/dev/null
  local i=0; while [ $i -lt 20 ]; do
    curl -fsS -m 2 -H 'Host: shop.local' http://127.0.0.1:8082/health >/dev/null 2>&1 && return 0; sleep 0.5; i=$((i+1)); done
  echo "wg-nginx did not come up — docker logs wg-nginx" >&2; return 1
}
