source "$WG_ROOT/levels/kotlin/lib.sh"
grep -q "suspend fun fetchPrice" "$APP/src/Prices.kt" || fail "fetchPrice must be a suspend fun"
kt_check
