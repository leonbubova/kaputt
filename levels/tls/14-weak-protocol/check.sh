source ../../../lib/common.sh; source ../lib.sh
running
[ "$(bodyk $URL/)" = "tls ok" ] || fail "HTTPS handshake fails (obsolete protocol only?)"
ok "modern TLS protocols enabled"
