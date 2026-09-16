## 1
nginx reads the request body before it proxies anything and can refuse it by size. The /api/ location in the shop.local config already carries the directive that sets that limit — find the line with `10m`.
## 2
`client_max_body_size` is that limit; a body larger than it gets 413 without the backend ever being contacted. Sizes take k or m suffixes.
## 3
Set `client_max_body_size 512k;` in the /api/ location, reload, then test: `head -c 800000 /dev/zero > big; curl -o /dev/null -w '%{http_code}\n' -H 'Host: shop.local' --data-binary @big http://127.0.0.1:8082/api/upload`.
