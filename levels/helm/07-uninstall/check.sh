source ../../../lib/common.sh; source ../lib.sh
[ -z "$(rel_status old)" ] || fail "release old still exists — helm uninstall old -n wg-helm"
$K get deploy old >/dev/null 2>&1 && fail "deployment old is still there — remove the release with helm, not single objects"
[ "$(rel_status web)" = deployed ] || fail "release web is gone or not deployed — only old should be removed (wg reset to start over)"
wait_available web 1 60 || fail "release web has no running pod — it must keep running"
ok "old is gone, web still runs"
