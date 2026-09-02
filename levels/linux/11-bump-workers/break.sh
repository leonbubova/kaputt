source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /etc/app
printf '# managed by cfg-push 2026-08-14 — do not hand-edit\nport=9000\nworkers=2\nlog_level=info\n' > /etc/app/app.conf
IN
