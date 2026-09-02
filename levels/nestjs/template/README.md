# wg-shop-api
Small NestJS 11 API, in-memory data, no DB.

    npm run start:dev      # http://localhost:3200 (watch mode)
    npm test               # jest
    npx tsc --noEmit       # type check

Routes: GET /health · GET|POST /users (?role=admin|user) · GET /users/:id · GET|POST /orders · GET /orders/:id · GET /admin/stats (header X-Api-Key, see .env)
Frontend origin: http://localhost:5173
