source ../../../lib/common.sh; source ../lib.sh
docker volume inspect wg-data >/dev/null 2>&1 || fail "no volume wg-data yet — docker volume create wg-data"
got=$(docker run --rm -v wg-data:/d alpine:3.20 cat /d/note.txt 2>/dev/null || true)
echo "$got" | grep -q "still here" || fail "volume wg-data has no /note.txt saying 'still here' (got '$got') — mount it at /data in wg-keeper and write the file with docker exec"
ok "note.txt lives in volume wg-data, independent of any container"
