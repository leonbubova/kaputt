source ../../../lib/common.sh; source ../lib.sh
running
[ -f "$APP/html/hello.txt" ] || fail "no ~/.k8s-wargame/nginx/app/html/hello.txt yet"
[ "$(code $URL/hello.txt)" = 200 ] || fail "/hello.txt does not return 200"
body $URL/hello.txt | grep -q 'hello from nginx' || fail "/hello.txt answers '$(body $URL/hello.txt | head -c 40)', expected 'hello from nginx'"
ok "/hello.txt is served straight from the html folder"
