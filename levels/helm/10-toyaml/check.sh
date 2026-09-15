source ../../../lib/common.sh; source ../lib.sh
c="$WGH/10-toyaml/web"; tmp=$(mktemp); printf 'files:\n  wg-probe.txt: "x"\n' > "$tmp"
helm template web "$c" -f "$tmp" 2>/dev/null | grep -q 'wg-probe.txt' || { rm -f "$tmp"; fail "a file added to .Values.files does not show up in the rendered ConfigMap — render the whole map"; }
rm -f "$tmp"
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed"
helm get values web -n $NS --all 2>/dev/null | grep -q 'robots.txt' || fail "robots.txt is not a chart value (helm get values web --all)"
$K get cm web-html -o jsonpath='{.data.robots\.txt}' 2>/dev/null | grep -q 'Disallow: /admin' || fail "ConfigMap web-html has no robots.txt with Disallow: /admin"
wait_available web 1 60 || fail "web has no available replica"
in_cluster_get http://web.wg-helm.svc/ | grep -q "hello from the configmap" || fail "index.html not served from the configmap"
ok "files come from values, rendered with toYaml"
