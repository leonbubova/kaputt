source ../../lib/common.sh
kubectl auth can-i list pods -n wg --as=system:serviceaccount:wg:reporter | grep -q yes || fail "reporter still cannot list pods"
kubectl auth can-i delete deployments -n wg --as=system:serviceaccount:wg:reporter | grep -q no || fail "reporter is over-privileged"
wait_available reporter 1 90 || fail "reporter not available"
ok "reporter reads pods with least privilege"
