source ../../../lib/common.sh; source ../lib.sh
[ "$(R EXISTS inbox)" = 1 ] || fail "the list inbox is gone — wg reset, then LPOP once and RPUSH mail4"
[ "$(Rt inbox)" = list ] || fail "inbox is a $(Rt inbox), not a list — wg reset to start over"
got=$(R LRANGE inbox 0 -1 | tr '\n' ',')
[ "$got" = "mail2,mail3,mail4," ] || fail "inbox is [${got%,}] — wanted mail2,mail3,mail4 (LPOP once from the front, RPUSH mail4 at the back)"
ok "inbox is mail2, mail3, mail4 — one item out at the front, one in at the back"
