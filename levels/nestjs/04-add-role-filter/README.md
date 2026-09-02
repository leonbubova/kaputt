# query strings come in through @Query, and the service does the filtering
Lesson: `?role=admin` is the query string. Nest hands single values to a handler argument via `@Query('role')`. Unlike a path parameter it is optional by nature: leave it off and the argument is simply `undefined`. Type it as optional (`role?: string`) so both cases are honest.
The habit this level builds: keep the controller thin. The controller's job is to pull the value out of HTTP and pass it on; deciding what "filter by role" means belongs in the service, where it can be tested without a server. So the same value travels two hops — decorator argument in the controller, plain parameter in the service.
`Array.filter` with a ternary is all the logic there is: a value given, filter; nothing given, return everything.
    @Query('role') role?: string     one query parameter, undefined when absent
    @Query() q: Record<string,string>    the whole query object, if you ever need it
    findAll(role?: Role)             service signature: optional argument
    role ? list.filter((u) => u.role === role) : list    filter only when asked
Try it first: `curl -s 'localhost:3200/users'` — note the `role` field on each user; the quotes around the URL matter once you add `?`.
Your task: support `GET /users?role=admin` (and `?role=user`). Without the query param the full list stays as is.
Goal: `/users?role=admin` returns only admins (Ada), `/users` returns all 3.
Check yourself:  wg check      stuck?  wg hint
