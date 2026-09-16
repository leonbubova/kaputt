## 1
`@nestjs/config` reads `.env` — but only once `ConfigModule.forRoot()` is in some module's `imports` (it resolves the file from `process.cwd()`). `isGlobal: true` makes `ConfigService` injectable in every module without importing `ConfigModule` again.
## 2
Inject it like any provider: `constructor(private readonly config: ConfigService) {}` and read `this.config.get<string>('API_KEY')`. `undefined`? Then the module isn't registered or the file wasn't found.
## 3
```
// app.module.ts:  imports: [ConfigModule.forRoot({ isGlobal: true }), UsersModule, OrdersModule, AdminModule]
// api-key.guard.ts:
constructor(private readonly config: ConfigService) {}
const expected = this.config.get<string>('API_KEY');
if (!key || key !== expected) throw new UnauthorizedException('invalid api key');
```
