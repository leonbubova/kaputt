source ../../../lib/common.sh; source ../lib.sh
running; conf_ok
[ "$(code $URL/docs/)" = 200 ] || fail "/docs/ returns $(code $URL/docs/), not 200"
body $URL/docs/ | grep -q 'shop docs' || fail "/docs/ does not serve docs/index.html"
[ "$(code $URL/docs/setup.html)" = 200 ] || fail "/docs/setup.html returns $(code $URL/docs/setup.html), not 200"
[ "$(code $URL/docs/nope)" = 404 ] || fail "/docs/nope returns $(code $URL/docs/nope), expected 404"
[ "$(code $URL/dashboard)" = 200 ] || fail "/dashboard broke — the app fallback outside /docs/ must stay"
ok "/docs/ serves files and 404s the rest"
