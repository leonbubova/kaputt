source ../../../lib/common.sh; source ../lib.sh
XS 'ip -4 addr show eth0' | grep -q '10\.99\.0\.5/' || fail "10.99.0.5 is not on eth0"
inurl 10.99.0.5:8080 | grep -q 'api ok' || fail "10.99.0.5:8080 does not answer"
ok "10.99.0.5 configured on eth0"
