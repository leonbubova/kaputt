Express stores header names lower-cased; the guard reads `req.headers['X-Api-Key']` → undefined → 401.
    src/admin/api-key.guard.ts → req.headers['x-api-key']
