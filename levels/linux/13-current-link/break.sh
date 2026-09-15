source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
rm -rf /opt/app/current
mkdir -p /opt/app/releases/1.4.1 /opt/app/releases/1.4.2
echo 1.4.1 > /opt/app/releases/1.4.1/VERSION
echo 1.4.2 > /opt/app/releases/1.4.2/VERSION
IN
