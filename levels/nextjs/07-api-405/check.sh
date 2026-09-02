source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
dev_up; get /api/health; want 200 "/api/health"; body_has '"ok":true' "/api/health does not return {\"ok\":true}"
ok "GET /api/health → 200"
