## 1
The file src/health/health.controller.ts is fine and untouched. The module simply does not mention it: look at the `controllers: [...]` list in src/app.module.ts.
## 2
Two lines in src/app.module.ts: an `import { HealthController } from './health/health.controller';` at the top, and `HealthController` inside `controllers: [ ]`.
## 3
```
import { HealthController } from './health/health.controller';
…
controllers: [HealthController],
```
Save; the log shows `Mapped {/health, GET} route`; `curl -s localhost:3200/health`.
