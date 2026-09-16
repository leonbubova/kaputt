## 1
The answer is the object the method returns. Add one more key to that object — `version` with the value `2`, no quotes, since it is a number.
## 2
In `check()` of src/health/health.controller.ts, inside the braces after `return`: keep `status` and `uptime`, add `, version: 2` — commas between the keys.
## 3
```
@Get()
check() {
  return { status: 'ok', uptime: this.health.uptime(), version: 2 };
}
```
