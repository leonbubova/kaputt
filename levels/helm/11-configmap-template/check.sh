source ../../../lib/common.sh; source ../lib.sh
[ "$(rel_status web)" = deployed ] || fail "release web is not deployed"
[ "$($K get cm web-config -o jsonpath='{.metadata.annotations.meta\.helm\.sh/release-name}' 2>/dev/null)" = web ] || fail "ConfigMap web-config is not managed by release web — add it to the chart"
want=$(helm get values web -n $NS --all 2>/dev/null | awk '/^greeting:/{sub(/^greeting: */,""); gsub(/"/,""); print}'); [ -n "$want" ] || fail "no value 'greeting' in the chart values"
[ "$($K get cm web-config -o jsonpath='{.data.GREETING}')" = "$want" ] || fail "GREETING in the ConfigMap does not come from .Values.greeting"
wait_available web 1 60 || fail "web has no available replica"
[ "$($K exec deploy/web -- printenv GREETING 2>/dev/null)" = "$want" ] || fail "pod does not see GREETING=$want"
ok "web reads GREETING from a templated ConfigMap"
