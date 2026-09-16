source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
[ -f src/app/hello/page.tsx ] || fail "src/app/hello/page.tsx is gone — the file must stay, only its content changes"
grep -q 'export default function' src/app/hello/page.tsx || fail "src/app/hello/page.tsx has no 'export default function' — Next.js needs one to know the page"
dev_up; get /hello; want 200 "/hello"
body_has '<h1>Hello</h1>' "/hello does not show <h1>Hello</h1> — is the file saved?"
body_has '<p>I wrote this myself.</p>' "/hello lacks <p>I wrote this myself.</p> (exact text, inside the section)"
ok "/hello is your own component — a function returning JSX"
