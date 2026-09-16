source ../../../lib/common.sh; source ../lib.sh
inurl localhost:8080 | grep -q 'api ok' || fail "localhost:8080 does not return 'api ok' — is nginx running?"
ok "API is up on 8080"
