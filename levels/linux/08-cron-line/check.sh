source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
X test -f /etc/cron.d/hello 2>/dev/null || fail "no /etc/cron.d/hello on the box yet"
X grep -Eq '^\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+\*[[:space:]]+root[[:space:]]+/opt/hello/say.sh[[:space:]]*$' /etc/cron.d/hello 2>/dev/null \
  || fail "/etc/cron.d/hello has no line '* * * * * root /opt/hello/say.sh' — cat it and compare field by field"
ok "cron line in place — five stars, root, the script"
