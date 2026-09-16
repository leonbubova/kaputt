source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /var/log/app; cd /var/log/app
gen(){ # day errors...
  d=$1; shift; for h in 00 03 06 09 12 15 18 21; do echo "${d}T${h}:00:12Z INFO  http: 2xx=1840 5xx=0 p95=112ms"; done
  echo "${d}T11:41:03Z WARN  db: pool at 90% (18/20)"; for l in "$@"; do echo "$l"; done; }
gen 2026-09-01 "2026-09-01T09:12:44Z ERROR http: upstream timeout /api/v1/orders" | sort > app.log
gen 2026-08-31 "2026-08-31T22:03:10Z ERROR db: slow query 3.2s" | sort > app.log.1
gen 2026-08-30 "2026-08-30T02:17:41Z WARN  db: pool at 100% (20/20)" "2026-08-30T02:17:43Z FATAL db: connection pool exhausted (max=20), shutting down" "2026-08-30T02:18:02Z INFO  app: started pid=4127" | sort | gzip > app.log.2.gz
gen 2026-08-29 "2026-08-29T14:20:00Z ERROR http: 502 from upstream" "2026-08-29T14:20:01Z WARN  db: pool at 95% (19/20)" | sort | gzip > app.log.3.gz
IN
