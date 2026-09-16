source ../../../lib/common.sh; source ../lib.sh
cur=$(X pgrep -o -f 'nginx: master process' 2>/dev/null | tr -d ' \n')
[ -n "$cur" ] || fail "nginx is not running — start it with: nginx"
old=$(XS 'cat /var/tmp/.wg-ngx0' 2>/dev/null | tr -d ' \n')
[ "$cur" != "$old" ] || fail "nginx is still the process that was running when the level started — stop it (nginx -s stop), then start it (nginx)"
inurl localhost:8080 | grep -q 'api ok' || fail "nginx runs but localhost:8080 does not answer 'api ok' yet — give it a second and curl again"
ok "nginx was stopped and started again, 8080 answers — you control the server behind the port"
