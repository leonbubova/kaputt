source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/terraform/tflib.sh"
need_app; fresh_apply
grep -qx 'port=8080' "$APP/out/cfg.txt" 2>/dev/null || fail "cfg.txt: $(cat "$APP/out/cfg.txt" 2>/dev/null)"
ok "port defaults to 8080"
