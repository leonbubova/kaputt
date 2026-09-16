## 1
A Nest route = a class with `@Controller('health')` and a method with `@Get()`. Whatever the method returns is JSON-serialised. Look at `src/orders/orders.controller.ts` for the shape.
## 2
A controller only exists for Nest once a module lists it: `controllers: [HealthController]` in `src/app.module.ts`. The boot log (`[RouterExplorer] Mapped {/health, GET}`) confirms it.
## 3
```
// src/health/health.controller.ts
@Controller('health') export class HealthController { @Get() check() { return { status: 'ok' }; } }
// src/app.module.ts → controllers: [HealthController]
```
