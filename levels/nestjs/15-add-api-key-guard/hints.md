## 1
A guard is an `@Injectable()` class implementing `CanActivate` with one method: `canActivate(context: ExecutionContext): boolean`. Return `true` to let the request through, `throw new UnauthorizedException('…')` to stop it with 401 — Nest runs it before the handler.
## 2
The request is inside the context: `const req = context.switchToHttp().getRequest<Request>()` (`Request` from `express`). Headers live in `req.headers`, and Node lower-cases every name: `req.headers['x-api-key']`. Bind the guard with `@UseGuards(ApiKeyGuard)` on the controller class and list it in `AdminModule.providers`.
## 3
```
@Injectable()
export class ApiKeyGuard implements CanActivate {
  canActivate(context: ExecutionContext): boolean {
    const key = context.switchToHttp().getRequest<Request>().headers['x-api-key'];
    if (key !== 'wg-secret-key') throw new UnauthorizedException('invalid api key');
    return true;
  }
}
// admin.controller.ts: @Controller('admin') @UseGuards(ApiKeyGuard)   ·   admin.module.ts: providers: [ApiKeyGuard]
```
