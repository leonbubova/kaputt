## 1
At boot Nest logs every route it maps: `[RouterExplorer] Mapped {/users, GET} route`. Is `/health` in that list?
## 2
A controller class that exists on disk does nothing until a module lists it. `src/health/health.controller.ts` is imported in `src/app.module.ts` — but is it *registered*?
## 3
`controllers: [HealthController]` in `AppModule`.
