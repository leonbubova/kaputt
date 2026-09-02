# a controller class is a route prefix, its methods are routes
Lesson: in Nest a URL is not wired up in a config file — it is a class. `@Controller('health')` on a class says "everything in here lives under /health", and `@Get()` on a method says "GET on that prefix runs me". Whatever the method returns is turned into JSON and sent back; you never touch `res.send`.
Writing the class is only half of it. Nest does not scan folders. A controller exists for the router only once a module lists it in `controllers: [...]`. Until then the file sits on disk doing nothing.
The boot log is the proof: `[RouterExplorer] Mapped {/health, GET} route` means the route is real. No line, no route.
    @Controller('health')            class-level prefix: /health
    @Get()                           method-level: GET /health (a path arg would append to the prefix)
    controllers: [HealthController]  in @Module({...}) of app.module.ts: registers the class
    npm run start:dev                boot, watch the Mapped lines
Try it first: `wg shell`, then `cat src/orders/orders.controller.ts` — one class, three routes, no plumbing.
Your task: the load balancer needs `GET /health` -> 200 `{ "status": "ok" }`. Put it in a new `HealthController` (`src/health/`) and register it in `AppModule`.
Goal: `curl localhost:3200/health` answers with `status: ok`.
Check yourself:  wg check      stuck?  wg hint
