## 1
A route is a method in the controller class with a `@Get('…')` label above it. The text in the brackets is added after the class prefix `/health`.
## 2
Inside `HealthController` (src/health/health.controller.ts): `@Get('ping')` above a method `ping()` that returns `'pong'`. Save, wait for terminal 1 to restart, then `curl -s localhost:3200/health/ping`.
## 3
```
@Get('ping')
ping() {
  return 'pong';
}
```
