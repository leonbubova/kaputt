# machine-applied solutions, one function per level — used by run-all.sh only (restore template files)
KT_TPL=${WG_ROOT:-${ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}}/levels/kotlin/template
KT_APP=$HOME/.k8s-wargame/kotlin/app
kt_restore(){ for f in "$@"; do cp "$KT_TPL/src/$f" "$KT_APP/src/$f"; done; }
s01(){ kt_restore Inventory.kt Main.kt Models.kt Money.kt Prices.kt Report.kt; }
s02(){ kt_restore Inventory.kt Main.kt Models.kt Money.kt Prices.kt Report.kt; }
s03(){ kt_restore Inventory.kt Main.kt Models.kt Money.kt Prices.kt Report.kt; }
s04(){ kt_restore Inventory.kt Main.kt Models.kt Prices.kt Report.kt; }
s05(){ kt_restore Inventory.kt Main.kt Models.kt Prices.kt Report.kt; }
s06(){ kt_restore Inventory.kt Main.kt Prices.kt; }
s07(){ kt_restore Main.kt Prices.kt; }
s08(){ kt_restore Main.kt Prices.kt; }
s09(){ kt_restore Inventory.kt; }
s10(){ kt_restore Models.kt; }
s11(){ kt_restore Inventory.kt; }
s12(){ kt_restore Report.kt; }
s13(){ kt_restore Report.kt; }
s14(){ kt_restore Money.kt; }
s15(){ kt_restore Inventory.kt; }
s16(){ kt_restore Inventory.kt; }
s17(){ kt_restore Report.kt; }
s18(){ kt_restore Inventory.kt; }
s19(){ kt_restore Prices.kt; }
s20(){ kt_restore Prices.kt; }
s21(){ kt_restore Inventory.kt Money.kt; }
s22(){ kt_restore Prices.kt; }
