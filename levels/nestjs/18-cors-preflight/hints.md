## 1
CORS is enforced by the browser, not the server: before sending a request with a custom header it asks the server first (an `OPTIONS` preflight), and the `Access-Control-Allow-*` answer decides whether the real request may go out. curl never asks, which is why it "works". Reproduce the preflight by hand: `curl -i -X OPTIONS -H 'Origin: http://localhost:5173' -H 'Access-Control-Request-Method: GET' -H 'Access-Control-Request-Headers: x-api-key' localhost:3200/admin/stats` — read `Access-Control-Allow-Headers`.
## 2
`app.enableCors({...})` in `src/main.ts` sets an explicit `allowedHeaders` list. Whatever is not in it is refused by the browser.
## 3
Add `'X-Api-Key'` to `allowedHeaders` (or remove the option so the request headers are reflected).
