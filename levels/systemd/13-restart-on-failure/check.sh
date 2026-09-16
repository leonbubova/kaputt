source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/systemd/lib.sh"
unchanged /opt/wg/api/api.sh api || fail "api.sh was modified"
active wg-api.service || fail "wg-api.service is not active"
p1=$(prop wg-api.service MainPID); [ "$p1" -gt 0 ] || fail "no main pid"
X kill -9 "$p1"; info "killed pid $p1, waiting for systemd…"
wait_ok 15 "systemctl is-active --quiet wg-api.service && [ \$(systemctl show wg-api.service -p MainPID --value) -ne $p1 ]" \
  || fail "not restarted after kill (state: $(prop wg-api.service ActiveState), Result: $(prop wg-api.service Result))"
[ "$(prop wg-api.service NRestarts)" -ge 1 ] || fail "NRestarts is 0 — who started it?"
ok "systemd restarted wg-api (NRestarts=$(prop wg-api.service NRestarts))"
