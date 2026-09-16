## 1
Nest doesn't scan folders for controllers — a route exists only when a module registers the controller that declares it. At boot Nest logs every route it actually mapped: `[RouterExplorer] Mapped {/users, GET} route`. Is `/health` in that list?
## 2
A controller class that exists on disk does nothing until a module lists it. `src/health/health.controller.ts` is imported in `src/app.module.ts` — but is it *registered*?
## 3
`controllers: [HealthController]` in `AppModule`.
