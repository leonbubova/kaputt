source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q 'from "next/image"' src/app/gallery/page.tsx || fail "gallery no longer uses next/image"
grep -q 'unoptimized' src/app/gallery/page.tsx next.config.* 2>/dev/null && fail "don't disable image optimisation — configure the host"
dev_up; get /gallery; want 200 "/gallery"; body_has 'hero.jpg' "hero image missing"; body_has '<img' "no <img> rendered"
ok "/gallery renders the CDN image"
