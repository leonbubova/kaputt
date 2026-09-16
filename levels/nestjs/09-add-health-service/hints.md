## 1
A provider is a class with `@Injectable()`. Nest creates one instance and hands it to anyone whose constructor asks for it by type: `constructor(private readonly health: HealthService) {}`.
## 2
The provider must be *provided* by the module that owns the controller: `providers: [HealthService]` in `AppModule`. Forget it and Nest greets you with "can't resolve dependencies of the HealthController (?)".
## 3
```
@Injectable() export class HealthService { private started = Date.now(); uptime() { return Math.round((Date.now() - this.started) / 1000); } }
// controller: constructor(private readonly health: HealthService) {}  →  return { status: 'ok', uptime: this.health.uptime() }
// app.module.ts → providers: [HealthService, ...]
```
