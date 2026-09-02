# the RouterExplorer boot log is the list of routes that exist
Lesson: a 404 from a Nest app can mean two different things. Either a handler ran and threw `NotFoundException`, or no handler exists for that path at all. The bodies look similar; the diagnosis is different. The second kind is a wiring problem, and there is one place that settles it: the boot log.
At startup Nest prints one `[RoutesResolver] XController {/x}` line per registered controller and one `[RouterExplorer] Mapped {/x, GET} route` line per route. That list is the truth. A controller file that compiles, imports cleanly and even appears in an `import` statement at the top of a module still maps nothing until a module's `controllers` array names it. Importing a symbol and registering a class are two separate acts.
So the debugging move is: boot, find the Mapped line for the failing path. Absent? Then stop curling and find out why the router never saw the controller.
    npm run start:dev 2>&1 | grep Mapped     every route Nest knows about
    curl -s localhost:3200/health            compare with what the log says
    grep -n 'controllers' src/*.module.ts src/*/*.module.ts    where classes get registered
Try it first: boot and count the Mapped lines against the controllers in `src/`.
Your task: health checks hit `GET /health` every 5 s and get 404 since the last deploy. The app itself boots fine and the other routes work.
Goal: `GET /health` returns 200 with `status: ok`.
Check yourself:  wg check      stuck?  wg hint
