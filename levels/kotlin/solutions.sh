# machine-applied solutions, one function per level — used by run-all.sh only (restore template files)
KT_TPL=${WG_ROOT:-${ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)}}/levels/kotlin/template
KT_APP=$HOME/.k8s-wargame/kotlin/app
kt_restore(){ for f in "$@"; do cp "$KT_TPL/src/$f" "$KT_APP/src/$f"; done; }
kt_solved(){ cp "$KT_TPL/../$1/solved/Main.kt" "$KT_APP/src/Main.kt"; }
s01(){ kt_solved 01-first-run; }
s02(){ kt_solved 02-values; }
s03(){ kt_solved 03-numbers; }
s04(){ kt_solved 04-functions; }
s05(){ kt_solved 05-decisions; }
s06(){ kt_solved 06-lists-and-loops; }
s07(){ kt_solved 07-classes; }
s08(){ kt_solved 08-nothing; }
s09(){ kt_restore Inventory.kt Main.kt Models.kt Money.kt Prices.kt Report.kt; }
s10(){ kt_restore Inventory.kt Main.kt Models.kt Money.kt Prices.kt Report.kt; }
s11(){ kt_restore Inventory.kt Main.kt Models.kt Money.kt Prices.kt Report.kt; }
s12(){ kt_restore Inventory.kt Main.kt Models.kt Prices.kt Report.kt; }
s13(){ kt_restore Inventory.kt Main.kt Models.kt Prices.kt Report.kt; }
s14(){ kt_restore Inventory.kt Main.kt Prices.kt; }
s15(){ kt_restore Main.kt Prices.kt; }
s16(){ kt_restore Main.kt Prices.kt; }
s17(){ kt_restore Inventory.kt; }
s18(){ kt_restore Models.kt; }
s19(){ kt_restore Inventory.kt; }
s20(){ kt_restore Report.kt; }
s21(){ kt_restore Report.kt; }
s22(){ kt_restore Money.kt; }
s23(){ kt_restore Inventory.kt; }
s24(){ kt_restore Inventory.kt; }
s25(){ kt_restore Report.kt; }
s26(){ kt_restore Inventory.kt; }
s27(){ kt_restore Prices.kt; }
s28(){ kt_restore Prices.kt; }
s29(){ kt_restore Inventory.kt Money.kt; }
s30(){ kt_restore Prices.kt; }
