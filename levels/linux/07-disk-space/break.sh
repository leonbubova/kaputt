source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
rm -f /answer; rm -rf /var/lib/appdata/db /var/lib/appdata/logs /var/lib/appdata/cache
mkdir -p /var/lib/appdata/db /var/lib/appdata/logs /var/lib/appdata/cache
echo '{"v":1}' > /var/lib/appdata/db/meta.json
echo "startup" > /var/lib/appdata/logs/app.log
head -c 20971520 /dev/zero > /var/lib/appdata/cache/blob.bin
IN
