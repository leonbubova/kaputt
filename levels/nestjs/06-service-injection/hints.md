## 1
Two small edits: a method in the service that returns the text, and a route in the controller that calls it through the injected `health` field. The constructor line already exists — keep it.
## 2
`greeting() { return 'hello from the service'; }` inside `HealthService` (src/health/health.service.ts). In `HealthController`: `@Get('greeting')` above a method that does `return this.health.greeting();`.
## 3
```
// src/health/health.service.ts, inside the class
greeting() { return 'hello from the service'; }

// src/health/health.controller.ts, inside the class
@Get('greeting')
greeting() { return this.health.greeting(); }
```
