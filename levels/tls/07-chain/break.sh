source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
lab_reset
cp "$APP/certs/server.crt" "$LAB/leaf.crt"; cp "$APP/certs/int.crt" "$LAB/int.crt"; cp "$APP/certs/root.crt" "$LAB/root.crt"
