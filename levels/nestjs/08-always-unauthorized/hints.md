## 1
The guard lives in `src/admin/api-key.guard.ts`. Log what it actually reads from the request before comparing.
## 2
Node/Express lower-cases all incoming header names. `req.headers['X-Api-Key']` is always `undefined`.
## 3
`req.headers['x-api-key']`.
