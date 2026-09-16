source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X test -f /opt/tick/tick.sh 2>/dev/null || fail "/opt/tick/tick.sh was deleted — stop the process, keep the file (wg reset)"
p=$(X pgrep -f /opt/tick/tick.sh 2>/dev/null | head -1); [ -z "$p" ] || fail "tick.sh is still running as PID ${p}"
ok "tick.sh is gone from ps — you found a process and stopped it"
