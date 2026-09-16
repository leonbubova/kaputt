source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
snapshot
dev_up; get /products; want 200 "/products"; body_has 'data-testid="product-list"' "product list missing on /products"
get /products/regenwurm; want 200 "/products/regenwurm"; body_has 'data-testid="price"' "price missing on /products/regenwurm"
get /; want 200 "/"
ok "/products routes back"
