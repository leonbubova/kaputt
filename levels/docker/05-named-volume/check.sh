source ../../../lib/common.sh; source ../lib.sh
docker volume inspect wg-notes >/dev/null 2>&1 || fail "volume wg-notes does not exist"
wait_running wg-notes || fail "no running container named wg-notes"
docker inspect -f '{{range .Mounts}}{{.Type}} {{.Name}} {{.Destination}}{{"\n"}}{{end}}' wg-notes | grep -q "^volume wg-notes /notes" || fail "wg-notes does not mount volume wg-notes at /notes"
docker run --rm -v wg-notes:/n alpine:3.20 cat /n/hello.txt 2>/dev/null | grep -q "keep me" || fail "volume wg-notes has no hello.txt saying 'keep me'"
ok "notes persist in volume wg-notes"
