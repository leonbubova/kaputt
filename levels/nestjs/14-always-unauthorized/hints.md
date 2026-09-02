## 1
A guard is plain code that runs before the handler and answers true/false. "401 for everyone, even with the right key" means its comparison can never succeed — usually because the value it reads is not what you think it is. The guard lives in `src/admin/api-key.guard.ts`; log what it actually reads from the request before comparing.
## 2
Node/Express lower-cases all incoming header names. `req.headers['X-Api-Key']` is always `undefined`.
## 3
`req.headers['x-api-key']`.
