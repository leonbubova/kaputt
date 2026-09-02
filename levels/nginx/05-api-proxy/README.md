# the shop API is unreachable: /api/* no longer hits the backend
The frontend calls /api/orders and expects the upstream (wg-backend:9000) to answer.
Right now nothing proxies /api/, so the requests fall through to the static site.
Add a location that proxies /api/ to http://wg-backend:9000/ (note the trailing slash).
