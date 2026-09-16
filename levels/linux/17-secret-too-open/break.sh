source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /etc/app /opt/app
echo "k7Qw9zP2mX4rT8vB1nL6" > /etc/app/secret.key
chown app:app /etc/app/secret.key; chmod 644 /etc/app/secret.key
cat > /opt/app/start <<'S'
#!/bin/bash
# app launcher — refuses keys readable by others (like ssh does)
f=/etc/app/secret.key
[ -r "$f" ] || { echo "cannot read $f"; exit 1; }
m=$(stat -c %a "$f"); [ $(( 8#$m & 8#077 )) -eq 0 ] || { echo "FATAL: key file permissions $m too open (must not be readable by group/others)"; exit 1; }
echo "app started"
S
chmod 755 /opt/app/start
IN
