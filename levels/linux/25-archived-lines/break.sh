source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI < "$WG_ROOT/levels/linux/_gen-access-log.sh"
XI <<'IN'
cd /var/log/app
head -n 150 access.log > access.log.1
head -n 320 access.log | gzip > access.log.2.gz
head -n 437 access.log | tail -n 211 | gzip > access.log.3.gz
rm -f /answer
IN
