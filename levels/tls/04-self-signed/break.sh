source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/tls/lib.sh"
lab_reset; openssl genrsa -out "$LAB/my.key" 2048 >/dev/null 2>&1
