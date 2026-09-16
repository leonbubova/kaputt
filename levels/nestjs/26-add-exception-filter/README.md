# ticket: error bodies need the request path
"Support wants every error body shaped `{ statusCode, message, path }` so users can paste it into tickets. Add a global exception filter `HttpExceptionFilter` in `src/common/` (`@Catch()`, implements `ExceptionFilter`) and bind it in `AppModule` via the `APP_FILTER` token. Status codes must not change: 404 stays 404, 400 stays 400." Goal: `GET /users/999` → 404 `{ "statusCode": 404, "message": "...", "path": "/users/999" }`.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
