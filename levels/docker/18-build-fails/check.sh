source ../../../lib/common.sh; source ../lib.sh
docker image inspect wg-tool:1.0 >/dev/null 2>&1 || fail "image wg-tool:1.0 does not exist — build it"
docker run --rm wg-tool:1.0 2>&1 | grep -q "tool v1.0 ok" || fail "wg-tool:1.0 does not print 'tool v1.0 ok'"
docker run --rm --entrypoint cat wg-tool:1.0 /opt/tool/entrypoint.sh 2>/dev/null | cmp -s - entrypoint.sh || fail "entrypoint.sh was modified"
docker image inspect wg-tool:1.0 -f '{{.Config.Labels}}' | grep -q 'wg.track:docker' || fail "base Dockerfile changed too much (label missing)"
ok "wg-tool:1.0 builds and runs"
