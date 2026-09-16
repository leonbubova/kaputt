source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /etc/app
printf 'host=db.internal\nuser=app\npassword=Pa55w0rd\n' > /etc/app/db.conf
chown root:root /etc/app/db.conf; chmod 666 /etc/app/db.conf
IN
