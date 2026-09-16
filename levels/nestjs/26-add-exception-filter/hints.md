## 1
An exception filter is a class with `@Catch()` (no argument = catches everything) implementing `ExceptionFilter`: `catch(exception: unknown, host: ArgumentsHost)`. `host.switchToHttp()` gives `getRequest<Request>()` / `getResponse<Response>()` (express types) — you write the response yourself.
## 2
Don't invent the status: `exception instanceof HttpException ? exception.getStatus() : 500`, message from `exception.getResponse()` (string or `{ message }`). Then `res.status(status).json({ statusCode: status, message, path: req.url })`. The class does nothing until bound — globally via a provider `{ provide: APP_FILTER, useClass: HttpExceptionFilter }` (`APP_FILTER` from `@nestjs/core`).
## 3
```
@Catch()
export class HttpExceptionFilter implements ExceptionFilter {
  catch(exception: unknown, host: ArgumentsHost) {
    const ctx = host.switchToHttp(); const res = ctx.getResponse<Response>(); const req = ctx.getRequest<Request>();
    const status = exception instanceof HttpException ? exception.getStatus() : 500;
    const body = exception instanceof HttpException ? exception.getResponse() : 'Internal server error';
    res.status(status).json({ statusCode: status, message: typeof body === 'string' ? body : (body as any).message, path: req.url });
  }
}
// app.module.ts → providers: [..., { provide: APP_FILTER, useClass: HttpExceptionFilter }]
```
