source "$WG_ROOT/levels/kotlin/lib.sh"
grep -q "sealed class OrderResult\|sealed interface OrderResult" "$APP/src/Models.kt" || fail "OrderResult must be sealed"
kt_check
