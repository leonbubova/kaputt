source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q 'catch' src/app/go/page.tsx || fail "keep the error handling for the data lookup"
grep -q 'redirect(' src/app/go/page.tsx || fail "use redirect() from next/navigation"
dev_up; get /go; case "$CODE" in 30[12378]) ;; *) server_error; fail "/go answered $CODE (want redirect)";; esac
case "$LOC" in */products/regenwurm) ;; *) fail "/go redirects to '$LOC' (want /products/regenwurm)";; esac
ok "/go redirects"
