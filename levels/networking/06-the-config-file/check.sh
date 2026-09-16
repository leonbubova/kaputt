source ../../../lib/common.sh; source ../lib.sh
XS 'grep -q "listen 8081;" /etc/nginx/sites-enabled/api.conf' || fail "api.conf still does not say 'listen 8081;' — edit the file and save it"
inurl localhost:8081 | grep -q 'api ok' || fail "the file says 8081 but localhost:8081 does not answer — nginx has not re-read it: nginx -s reload"
ok "8081 answers 'api ok' — you changed the config and made nginx re-read it"
