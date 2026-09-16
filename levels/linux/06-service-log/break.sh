source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/linux/lib.sh"
XI <<'IN'
mkdir -p /var/log/app; rm -f /answer
awk 'BEGIN{ for(i=0;i<40;i++){ m=i%60; s=(i*17)%60; lvl="INFO"; msg="GET /api/v1/orders 200";
  if(i%7==3) msg="GET /health 200"; if(i%11==5) msg="worker 2 idle";
  if(i==23){ lvl="ERROR"; msg="db: connection refused (db.internal:5432)" }
  if(i==24) msg="db: reconnected";
  printf "2026-09-15T02:%02d:%02dZ %s %s\n", m, s, lvl, msg } }' > /var/log/app/app.log
IN
