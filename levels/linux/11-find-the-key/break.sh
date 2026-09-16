source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /var/lib/vendor/acme/.keys /var/backups/acme /var/cache/acme
echo "ACME-7F3A-91BC-0042" > /var/lib/vendor/acme/.keys/license.key
echo "old" > /var/backups/acme/license.key.bak
echo "x" > /var/cache/acme/index.db
rm -f /answer
IN
