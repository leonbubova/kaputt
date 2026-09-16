source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /etc/app /tmp/upload
printf 'port=8000\nworkers=2\n' > /etc/app/app.conf
printf 'port=9000\nworkers=4\n' > /tmp/upload/app.conf.new
IN
