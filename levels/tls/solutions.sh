# machine-applied solutions, one function per level — used by run-all.sh only
source "${WG_ROOT:-$ROOT}/levels/tls/lib.sh"
s01(){ good_conf; ngx_restart; }
s02(){ good_conf; ngx_reload; }
s03(){ good_conf; ngx_reload; }
s04(){ good_conf; ngx_restart; }
s05(){ good_conf; ngx_restart; }
s06(){ good_conf; ngx_restart; }
s07(){ good_conf; ngx_restart; }
s08(){ good_conf; ngx_reload; }
s09(){ good_conf; ngx_restart; }
s10(){ good_conf; ngx_restart; }
