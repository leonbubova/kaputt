source ../../../lib/common.sh; source ../lib.sh
f="$WGH/02-render-it/rendered.yaml"
[ -f "$f" ] || fail "no rendered.yaml in ~/.k8s-wargame/helm/02-render-it/ yet — helm template demo ./web > rendered.yaml"
grep -q '^kind: Deployment' "$f" || fail "rendered.yaml has no Deployment in it — it should be the full output of helm template"
grep -q '^  name: demo$' "$f" || fail "rendered.yaml does not use release name demo — helm template demo ./web"
grep -q 'name: demo-html' "$f" || fail "rendered.yaml is missing the ConfigMap demo-html — render the whole chart, not one file"
ok "rendered.yaml holds the filled-in YAML of chart web as release demo"
