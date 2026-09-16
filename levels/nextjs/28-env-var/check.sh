source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q '^SUPPORT_EMAIL=help@wurm.example' .env.local || fail ".env.local has no SUPPORT_EMAIL=help@wurm.example"
grep -rq 'help@wurm.example' src && fail "address is hard-coded in src/ — read it from process.env"
grep -q 'process.env.SUPPORT_EMAIL' src/app/about/page.tsx || fail "/about does not read process.env.SUPPORT_EMAIL"
dev_up; get /about; want 200 "/about"; body_has 'data-testid="support"' "no <a data-testid=\"support\">"
grep -o 'data-testid="support"[^<]*' body | grep -q 'help@wurm.example' || fail "support link does not show help@wurm.example"
ok "/about shows SUPPORT_EMAIL from .env.local"
