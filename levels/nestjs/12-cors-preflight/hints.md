## 1
Reproduce without a browser: `curl -i -X OPTIONS -H 'Origin: http://localhost:5173' -H 'Access-Control-Request-Method: GET' -H 'Access-Control-Request-Headers: x-api-key' localhost:3200/admin/stats` — read `Access-Control-Allow-Headers`.
## 2
`app.enableCors({...})` in `src/main.ts` sets an explicit `allowedHeaders` list. Whatever is not in it is refused by the browser.
## 3
Add `'X-Api-Key'` to `allowedHeaders` (or remove the option so the request headers are reflected).
