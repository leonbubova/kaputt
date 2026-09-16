source ../../../lib/common.sh
$K get serviceaccount reporter >/dev/null 2>&1 || fail "no serviceaccount reporter"
$K get role pod-reader >/dev/null 2>&1 || fail "no role pod-reader"
$K get rolebinding reporter-reads-pods >/dev/null 2>&1 || fail "no rolebinding reporter-reads-pods"
sa=system:serviceaccount:wg:reporter
kubectl auth can-i list pods -n $NS --as=$sa | grep -q yes || fail "reporter cannot list pods in wg"
kubectl auth can-i get pods -n $NS --as=$sa | grep -q yes || fail "reporter cannot get pods in wg"
kubectl auth can-i delete pods -n $NS --as=$sa | grep -q no || fail "reporter may delete pods — too much"
kubectl auth can-i list secrets -n $NS --as=$sa | grep -q no || fail "reporter may list secrets — too much"
kubectl auth can-i list pods -n default --as=$sa | grep -q no || fail "reporter may list pods outside wg — bind a Role, not a ClusterRole"
ok "reporter reads pods in wg, nothing more"
