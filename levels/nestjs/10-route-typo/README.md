# a route path is matched literally unless a segment starts with a colon
Lesson: the router compares the request path against each mapped route segment by segment. `@Get('list')` under `@Controller('users')` matches `/users/list` and nothing else. `@Get(':id')` matches `/users/<anything>` and stores that segment under the name `id`. The colon is the only thing that turns a literal word into a parameter.
`Cannot GET /users/1` is the message Express prints when no route matched — Nest never ran any of your code. That is different from a 404 your handler throws, and it is the same situation as the previous level: consult the Mapped lines. This time the controller is registered; the question is whether the path it registered is the path being requested. Read the log's path character by character.
The pipe on the argument only runs when the route matches, so "400 for a bad id" stays intact once the path is right.
    @Get(':id')                      parameter segment, matches /users/1, /users/abc
    @Get('id')                       literal segment, matches only /users/id
    @Get(':id/orders')               mix: parameter then literal
    npm run start:dev 2>&1 | grep 'users'    the exact paths mapped under /users
Try it first: `curl -s localhost:3200/users/id` — if that answers, you have found the shape of the problem.
Your task: the frontend calls `GET /users/1` and gets `Cannot GET /users/1`. `GET /users` (the list) works.
Goal: `GET /users/:id` returns the user; a non-numeric id is still rejected with 400.
Check yourself:  wg check      stuck?  wg hint
