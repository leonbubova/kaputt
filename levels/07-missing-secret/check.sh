source ../../lib/common.sh
wait_available api 1 60 || fail "api not available"
$K logs deploy/api | grep -q "password=s3cret" || fail "api did not receive the password"
ok "api has its secret"
