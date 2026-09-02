source ../../../lib/common.sh; source ../lib.sh
wait_running wg-report || fail "wg-report not running (status $(docker inspect -f '{{.State.Status}} oom={{.State.OOMKilled}} exit={{.State.ExitCode}}' wg-report 2>/dev/null))"
[ "$(image_of wg-report)" = alpine:3.20 ] || fail "image changed"
docker logs wg-report 2>&1 | grep -q "report done" || fail "logs do not say 'report done'"
sz=$(docker exec wg-report stat -c %s /dev/shm/report.bin 2>/dev/null || echo 0); [ "$sz" -ge 50331648 ] || fail "report.bin is $sz bytes, want 48 MB"
mem=$(docker inspect -f '{{.HostConfig.Memory}}' wg-report); [ "$mem" -gt 0 ] && [ "$mem" -le 268435456 ] || fail "memory limit must be set and ≤ 256 MB (is $mem)"
ok "report completes under a $((mem/1048576)) MB limit"
