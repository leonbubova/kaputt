source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(code $URL/new)" = 200 ] || fail "/new does not return 200"
[ "$(body $URL/new)" = "new page" ] || fail "/new body is '$(body $URL/new)', expected 'new page'"
ok "/new says 'new page'"
