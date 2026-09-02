## 1
CORS is enforced by the browser: before a cross-origin request with custom headers it sends an `OPTIONS` preflight with `Origin` + `Access-Control-Request-*` and only proceeds if the answer carries matching `Access-Control-Allow-*` headers. curl never asks. Reproduce the preflight: `curl -i -X OPTIONS -H 'Origin: http://localhost:5173' -H 'Access-Control-Request-Method: GET' -H 'Access-Control-Request-Headers: x-api-key' localhost:3200/admin/stats`.
## 2
Nest wraps the `cors` package: `app.enableCors({ origin: 'http://localhost:5173' })` in `main.ts`, before `app.listen`. Without an `allowedHeaders` option the requested headers are reflected; if you list them, list every header the frontend sends.
## 3
```
app.enableCors({ origin: 'http://localhost:5173', allowedHeaders: ['Content-Type', 'X-Api-Key'] });
```
