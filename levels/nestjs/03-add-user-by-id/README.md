# route params arrive as strings; pipes convert them, exceptions become status codes
Lesson: `@Get(':id')` declares a path segment as a parameter, and `@Param('id')` on a method argument receives it. Everything from a URL is text — `/users/1` gives you `"1"`, not `1`, and `"1" === 1` is false. TypeScript's `id: number` annotation does nothing at runtime.
A pipe fixes that at the door. `ParseIntPipe` turns the string into a number and, if it cannot (`abc`), rejects the request with 400 before your method runs. Validation lives in the decorator, not in your code.
The second half of the concept: your handler never builds error responses. Throwing an `HttpException` subclass — `NotFoundException`, `BadRequestException` — is enough; Nest maps it to the status code and a JSON body. A service can throw it and the controller just passes the result through.
    @Get(':id')                                   path parameter named id
    @Param('id', ParseIntPipe) id: number         extract it, convert, 400 on garbage
    throw new NotFoundException('User 1 not found')   becomes a 404 response
    curl -s -o /dev/null -w '%{http_code}' localhost:3200/users/abc   see only the status
Try it first: `cat src/orders/orders.controller.ts` — `findOne` uses exactly this shape; `cat src/users/users.service.ts` to see who already throws.
Your task: add `GET /users/:id`. The id must be parsed as an integer (`ParseIntPipe` -> 400 for `abc`), unknown ids answer 404 via `NotFoundException`.
Goal: `/users/1` -> Ada, `/users/abc` -> 400, `/users/999` -> 404.
Check yourself:  wg check      stuck?  wg hint
