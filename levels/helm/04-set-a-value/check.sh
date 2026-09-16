source ../../../lib/common.sh; source ../lib.sh
[ -n "$(rel_status web)" ] || fail "no release web in wg-helm yet — helm install web ./web -n wg-helm --set page.title=Hello"
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed — helm status web -n wg-helm"
helm get values web -n $NS 2>/dev/null | grep -q '^  title: Hello$' || fail "helm get values web -n wg-helm does not show title: Hello — pass it with --set page.title=Hello, not by editing values.yaml"
grep -q '^  title: web$' "$WGH/04-set-a-value/web/values.yaml" || fail "values.yaml was edited — put it back to 'title: web'; the override belongs on the command line"
wait_available web 1 60 || fail "release web has no running pod yet — kubectl get pods -n wg-helm"
in_cluster_get http://web.wg-helm.svc/ | grep -q '<h1>Hello</h1>' || fail "the page does not show the title Hello"
ok "web installed with page.title=Hello from the command line"
