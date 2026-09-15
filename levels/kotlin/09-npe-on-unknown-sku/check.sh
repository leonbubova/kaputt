source "$WG_ROOT/levels/kotlin/lib.sh"
grep -q "fun find(sku: String): Product?" "$APP/src/Inventory.kt" || fail "find must stay nullable (Product?)"
kt_check
