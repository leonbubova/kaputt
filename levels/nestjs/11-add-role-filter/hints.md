## 1
Query string values come in via `@Query('role') role?: string` on the handler argument (import from `@nestjs/common`). Optional — it is `undefined` when absent.
## 2
Keep the controller thin: pass it to the service, filter there: `role ? this.users.filter(u => u.role === role) : this.users`.
## 3
```
@Get() findAll(@Query('role') role?: Role) { return this.users.findAll(role); }        // controller
findAll(role?: Role) { return role ? this.users.filter((u) => u.role === role) : this.users; }  // service
```
