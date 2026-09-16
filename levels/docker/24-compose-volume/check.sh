source ../../../lib/common.sh; source ../lib.sh
C="docker compose -f $WORK/compose.yaml"
wait_running wg-notes || fail "wg-notes not running"
docker volume inspect wg-notes >/dev/null 2>&1 || fail "volume wg-notes does not exist"
docker inspect -f '{{range .Mounts}}{{.Type}} {{.Name}} {{.Destination}}{{"\n"}}{{end}}' wg-notes | grep -q "^volume wg-notes /notes$" || fail "wg-notes does not mount volume wg-notes at /notes"
[ "$(docker volume inspect -f '{{index .Labels "com.docker.compose.project"}}' wg-notes)" = wg ] || fail "volume must be declared in compose.yaml, not created by hand"
marker=wg-$RANDOM
docker exec wg-notes sh -c "echo $marker > /notes/marker" || fail "cannot write /notes"
$C down >/dev/null 2>&1 || fail "compose down failed"; $C up -d >/dev/null 2>&1 || fail "compose up failed"
wait_running wg-notes || fail "wg-notes not running after redeploy"
[ "$(docker exec wg-notes cat /notes/marker 2>/dev/null)" = "$marker" ] || fail "/notes/marker lost after down/up"
ok "notes survive redeploy"
