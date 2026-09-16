source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
X test -f /etc/systemd/system/wg-marker.service || fail "no /etc/systemd/system/wg-marker.service"
loaded wg-marker.service || fail "wg-marker.service is not loaded ($(prop wg-marker.service LoadState)) — systemctl daemon-reload?"
[ "$(prop wg-marker.service Type)" = oneshot ] || fail "Type is $(prop wg-marker.service Type), want oneshot"
[ "$(prop wg-marker.service Result)" = success ] || fail "last run failed: $(prop wg-marker.service Result)"
# a transient oneshot (no RemainAfterExit) is garbage-collected once it finishes,
# which discards its runtime timestamps — so prove it ran via the durable marker
# file (break.sh removed it; only a successful run recreates it).
[ -n "$(age /opt/wg/marker/ran)" ] || fail "unit has never run (systemctl start wg-marker) — /opt/wg/marker/ran not written"
X grep -qx "$(X hostname)" /opt/wg/marker/ran 2>/dev/null || fail "/opt/wg/marker/ran missing or does not contain the hostname"
ok "wg-marker ran once and wrote the marker"
