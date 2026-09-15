## 1
Who turns a `NotFoundException` into a 500? A global `@Catch()` filter catches *everything*, including Nest's own HttpExceptions. Find it in `src/common/`.
## 2
An `HttpException` knows its status (`getStatus()`) and body (`getResponse()`). Only non-HttpExceptions should become 500.
## 3
`const status = exception instanceof HttpException ? exception.getStatus() : 500;` and take the message from `exception.getResponse()`.
