source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
lab_reset; openssl genrsa -out "$LAB/my.key" 2048 >/dev/null 2>&1
openssl req -new -key "$LAB/my.key" -subj /CN=shop.local -out "$LAB/shop.csr" >/dev/null 2>&1
cp "$APP/certs/root.crt" "$LAB/ca.crt"; cp "$APP/certs/root.key" "$LAB/ca.key"
