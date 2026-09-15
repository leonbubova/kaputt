source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -f src/app/gallery/page.tsx ] || fail "no src/app/gallery/page.tsx"
grep -q 'from "next/image"' src/app/gallery/page.tsx || fail "gallery must use next/image"
grep -q '<img' src/app/gallery/page.tsx && fail "no plain <img> — use the Image component"
dev_up; get /gallery; want 200 "/gallery"; body_has '<h1>Gallery</h1>' "no <h1>Gallery</h1>"; body_has 'hero.jpg' "hero image missing"; body_has '_next/image' "image is not going through next/image"
ok "/gallery renders the CDN image via next/image"
