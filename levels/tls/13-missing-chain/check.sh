source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
verify_host || fail "chain does not verify (intermediate missing?)"
ok "full certificate chain served"
