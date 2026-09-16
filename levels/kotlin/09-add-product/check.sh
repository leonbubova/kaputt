source "$WG_ROOT/levels/kotlin/lib.sh"
grep -rq "data class Product" "$APP/src" || fail "Product must be a data class"
kt_check
