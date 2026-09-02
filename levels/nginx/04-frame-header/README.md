# security scan: shop.local is missing the X-Frame-Options header
The scanner flags every page on http://shop.local for clickjacking protection.
Responses must include the header `X-Frame-Options: DENY`.
Add it on the shop.local server.
