source "$WG_ROOT/levels/kotlin/lib.sh"
grep -q "fun find(sku: String): Product?" "$APP/src/Inventory.kt" || fail "find must return the nullable type Product?"
kt_check
