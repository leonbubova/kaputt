source ../../../lib/common.sh; source ../lib.sh
docker inspect wg-old >/dev/null 2>&1 && fail "wg-old still exists ($(docker inspect -f '{{.State.Status}}' wg-old)) — stop it, then rm it (or rm -f)"
docker inspect wg-done >/dev/null 2>&1 && fail "wg-done still exists — it is already stopped, docker rm removes it"
ok "wg-old and wg-done are gone — stop, remove, clean"
