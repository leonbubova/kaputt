source "$WG_ROOT/levels/kotlin/lib.sh"
grep -q "else ->" "$APP/src/Report.kt" && fail "describe() should be an exhaustive when over the sealed class — no else branch"; true
kt_check
