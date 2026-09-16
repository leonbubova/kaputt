source ../../../lib/common.sh; source ../lib.sh
d="$WGH/01-what-is-a-chart/hello"
[ -d "$d" ] || fail "no folder hello in ~/.k8s-wargame/helm/01-what-is-a-chart/ yet — cd there, then: helm create hello"
[ -f "$d/Chart.yaml" ] || fail "hello exists but has no Chart.yaml — it must be made by: helm create hello"
grep -q '^name: hello$' "$d/Chart.yaml" || fail "hello/Chart.yaml does not say 'name: hello' — remove the folder and run: helm create hello"
[ -f "$d/values.yaml" ] && [ -d "$d/templates" ] || fail "hello is missing values.yaml or templates/ — helm create writes both"
ok "hello is a chart: Chart.yaml + values.yaml + templates/"
