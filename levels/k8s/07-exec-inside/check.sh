source ../../../lib/common.sh
[ "$($K get pod box -o jsonpath='{.status.phase}' 2>/dev/null)" = Running ] || fail "pod box is not Running — kubectl get pods (still ContainerCreating? wait a moment; gone? wg reset)"
got=$($K exec box -- cat /tmp/hello.txt 2>/dev/null | tr -d ' \t\r\n' | tr 'A-Z' 'a-z')
[ -n "$got" ] || fail "no /tmp/hello.txt inside box yet — kubectl exec -it box -- sh, then create it at the / # prompt"
[ "$got" = hi ] || fail "/tmp/hello.txt inside box contains '$got' — it should contain just: hi"
ok "/tmp/hello.txt inside box says hi — you worked inside a pod"
