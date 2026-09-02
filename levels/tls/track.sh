# track: one nginx TLS edge (wg-tls). Certs + config on the host under ~/.k8s-wargame/tls/app,
# bind-mounted in. A local CA (root+intermediate) signs the server certs. Needs openssl + curl.
source "$WG_ROOT/levels/tls/lib.sh"
WG_TLS_IMG=nginx:1.27-alpine; BUNDLE=$WG_TLS/bundle
tls_bundle() {  # generate the CA + cert variants once
  [ -s "$BUNDLE/fullchain.crt" ] && return 0
  mkdir -p "$BUNDLE"; local B=$BUNDLE
  openssl req -x509 -newkey rsa:2048 -nodes -days 3650 -subj /CN=WG-Root-CA -keyout "$B/root.key" -out "$B/root.crt" >/dev/null 2>&1
  openssl req -newkey rsa:2048 -nodes -subj /CN=WG-Intermediate-CA -keyout "$B/int.key" -out "$B/int.csr" >/dev/null 2>&1
  printf 'basicConstraints=CA:TRUE\n' > "$B/int.ext"
  openssl x509 -req -in "$B/int.csr" -CA "$B/root.crt" -CAkey "$B/root.key" -CAcreateserial -days 3650 -extfile "$B/int.ext" -out "$B/int.crt" >/dev/null 2>&1
  # server cert with SAN shop.local
  openssl req -newkey rsa:2048 -nodes -subj /CN=shop.local -keyout "$B/server.key" -out "$B/server.csr" >/dev/null 2>&1
  printf 'subjectAltName=DNS:shop.local\n' > "$B/san.ext"
  openssl x509 -req -in "$B/server.csr" -CA "$B/int.crt" -CAkey "$B/int.key" -CAcreateserial -days 3650 -extfile "$B/san.ext" -out "$B/server.crt" >/dev/null 2>&1
  cat "$B/server.crt" "$B/int.crt" > "$B/fullchain.crt"
  # wrong-identity cert with SAN other.local
  openssl req -newkey rsa:2048 -nodes -subj /CN=other.local -keyout "$B/other.key" -out "$B/other.csr" >/dev/null 2>&1
  printf 'subjectAltName=DNS:other.local\n' > "$B/other.ext"
  openssl x509 -req -in "$B/other.csr" -CA "$B/int.crt" -CAkey "$B/int.key" -CAcreateserial -days 3650 -extfile "$B/other.ext" -out "$B/other.crt" >/dev/null 2>&1
  cat "$B/other.crt" "$B/int.crt" > "$B/other-fullchain.crt"
  # no-SAN cert (CN only) for shop.local
  openssl req -newkey rsa:2048 -nodes -subj /CN=shop.local -keyout "$B/nosan.key" -out "$B/nosan.csr" >/dev/null 2>&1
  openssl x509 -req -in "$B/nosan.csr" -CA "$B/int.crt" -CAkey "$B/int.key" -CAcreateserial -days 3650 -out "$B/nosan.crt" >/dev/null 2>&1
  cat "$B/nosan.crt" "$B/int.crt" > "$B/nosan-fullchain.crt"
  # an unrelated key (mismatch)
  openssl genrsa -out "$B/wrong.key" 2048 >/dev/null 2>&1
}
_up() { [ "$(docker inspect -f '{{.State.Running}}' wg-tls 2>/dev/null)" = true ]; }
track_start() {
  docker info >/dev/null 2>&1 || { echo "docker daemon not reachable" >&2; return 1; }
  command -v openssl >/dev/null || { echo "openssl missing" >&2; return 1; }
  command -v curl >/dev/null || { echo "curl missing" >&2; return 1; }
  docker pull -q "$WG_TLS_IMG" >/dev/null 2>&1 || true
  mkdir -p "$WG_TLS"; tls_bundle
  echo "site: https://127.0.0.1:9443 (Host: shop.local)   http://127.0.0.1:9080"
  echo "certs+config: $WG_TLS/app   CA: $BUNDLE/root.crt"
}
track_stop() { docker rm -f wg-tls >/dev/null 2>&1 || true; rm -rf "$WG_TLS"; }
track_ready() { docker info >/dev/null 2>&1 && docker image inspect "$WG_TLS_IMG" >/dev/null 2>&1; }
track_shell() { docker exec -it wg-tls sh; }
track_wipe() {  # fresh certs + good config + container
  local app="$WG_TLS/app"
  docker rm -f wg-tls >/dev/null 2>&1 || true
  tls_bundle
  rm -rf "$app"; mkdir -p "$app/conf.d" "$app/certs"
  cp "$BUNDLE"/*.crt "$BUNDLE"/*.key "$app/certs/"
  good_conf
  local try=0 i
  while [ $try -lt 3 ]; do   # retry to absorb published-port release races
    docker rm -f wg-tls >/dev/null 2>&1 || true
    docker run -d --name wg-tls -p 127.0.0.1:9080:80 -p 127.0.0.1:9443:443 \
      -v "$app/conf.d:/etc/nginx/conf.d" -v "$app/certs:/etc/nginx/certs:ro" "$WG_TLS_IMG" >/dev/null 2>&1
    i=0; while [ $i -lt 20 ]; do
      curl -sk -m 2 https://127.0.0.1:9443/ >/dev/null 2>&1 && return 0; sleep 0.5; i=$((i+1)); done
    try=$((try+1)); sleep 1
  done
  echo "wg-tls did not come up — docker logs wg-tls" >&2; return 1
}
