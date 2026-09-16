# the boot log lists every route
Lesson: when the server starts it prints one line per route it knows about:
    [RouterExplorer] Mapped {/health, GET} route
    [RouterExplorer] Mapped {/users/:id, GET} route
This list is the truth. An address that is not in it does not exist for Nest, and the answer is a 404:
    {"statusCode":404,"message":"Cannot GET /nothing","path":"/nothing"}
So when curl says 404, do not stare at the code first: read the boot log, find the route as Nest sees it, and compare
it letter by letter with the address you typed. Scroll up in terminal 1 — the list appears right after every restart.
Try it:
    curl -s localhost:3200/nothing
    curl -s localhost:3200/health
Your task: `curl -s localhost:3200/health` currently answers 404. The boot log shows where the route went instead.
Change `src/health/health.controller.ts` so that `/health` answers `status: ok` again.
Work in ~/.k8s-wargame/nestjs/app (`wg shell` takes you there). Server: `npm run start:dev` in that folder, in its own terminal — every `wg level` stops it, start it again.
Check yourself:  wg check      stuck?  wg hint
