#!/usr/bin/env bash
# runs INSIDE the sandbox during build-full.sh (PREP mode): pull/build everything the tracks need so play is offline.
set -uo pipefail
export PATH=/opt/kaputt/bin:$PATH HOME=/home/player
log(){ printf '\n\033[36m== %s\033[0m\n' "$*"; }
log "level images"; for i in nginx:1.27-alpine busybox:1.36 python:3.12-alpine bitnamilegacy/kubectl:1.31 postgres:16-alpine redis:7-alpine alpine:3.20 ubuntu:24.04 debian:bookworm-slim; do docker pull -q "$i" >/dev/null && echo "  $i"; done
log "k3s air-gap images (so a fresh cluster works with no internet)"
K3SV=$(k3d version | awk '/k3s version/{print $3}'); mkdir -p /opt/kaputt/airgap
curl -fsSL -o /opt/kaputt/airgap/k3s-airgap-images-amd64.tar.zst "https://github.com/k3s-io/k3s/releases/download/${K3SV/-k3s/+k3s}/k3s-airgap-images-amd64.tar.zst" && echo "  $K3SV → $(du -h /opt/kaputt/airgap/k3s-airgap-images-amd64.tar.zst | cut -f1)"
log "k3d: create+delete a cluster once so k3s/proxy/tools images are cached (with the air-gap volume, as at play time)"
runuser -u player -- bash -c 'k3d cluster create prep --servers 1 --agents 2 -p "8080:80@loadbalancer" --wait --timeout 240s >/dev/null 2>&1 && echo "  k3d ok"; k3d cluster delete prep >/dev/null 2>&1'
docker images --format '  {{.Repository}}:{{.Tag}}' | grep -E 'k3s|k3d' 
for t in linux networking nginx tls postgres redis docker; do log "track_start: $t"; runuser -u player -- bash -c "export PATH=/opt/kaputt/bin:\$PATH; cd /opt/kaputt && WG_TRACK=$t timeout 900 wg start >/dev/null 2>&1 && echo '  ok' || echo '  (start returned non-zero — check at play time)'; WG_TRACK=$t wg stop >/dev/null 2>&1 || true"; done
for t in nextjs nestjs trigger pentest; do log "node deps: $t"; runuser -u player -- bash -c "export PATH=/opt/kaputt/bin:\$PATH; cd /opt/kaputt && WG_TRACK=$t timeout 1200 wg start >/dev/null 2>&1 && echo '  ok' || echo '  (non-zero)'"; done
log "terraform provider mirror"; runuser -u player -- bash -c "export PATH=/opt/kaputt/bin:\$PATH; cd /opt/kaputt && WG_TRACK=terraform timeout 600 wg start >/dev/null 2>&1 && echo '  ok' || echo '  (non-zero)'"
docker container prune -f >/dev/null; log "done"; docker images | wc -l | xargs echo "  inner images:"; du -sh /home/player/.k8s-wargame 2>/dev/null | cut -f1 | xargs echo "  player cache:"
