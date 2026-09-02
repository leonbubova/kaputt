source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
grep -q 'fetch(' src/app/stock/page.tsx || fail "keep fetching /api/stock"
dev_up; get /stock; want 200 "/stock"; body_has 'tauwurm' "stock list empty"
n=$(( RANDOM % 900 + 100 )); sed -i '' "s/\"tauwurm\": [0-9]*/\"tauwurm\": $n/" data/stock.json; sleep 0.5
get /stock; want 200 "/stock"; grep -o 'tauwurm<[^l]*li>' body | grep -q ">$n<" || fail "/stock still shows the old stock (want tauwurm $n) — cached"
ok "/stock is live"
