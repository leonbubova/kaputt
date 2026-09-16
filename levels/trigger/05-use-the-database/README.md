# use the shop's data: import from src/lib
Lesson: real tasks touch the app's data. This project keeps its (fake) database in `src/lib/db.ts`: a `users`
map, an `orders` map, a `sendEmail(to, template)` function. A task file reaches them with an import:
    import { users } from "../lib/db.js";
Two things to know. `../lib/` means "one folder up, then into lib" — from `src/trigger/` that is `src/lib/`.
And the file is called `db.ts`, but you write `db.js` — that is how this project is set up; `db.ts` in an
import makes `npx tsc --noEmit` complain. `users` is a Map; `users.size` is how many entries it has, and
`users.get("usr_1")` fetches one.
Try it — read the data file and a task that already imports from it:
    cat ~/.k8s-wargame/trigger/app/src/lib/db.ts
    cat ~/.k8s-wargame/trigger/app/src/trigger/process-order.ts
Your task: create `src/trigger/count-users.ts` with a task `id` `count-users`, exported as `countUsers`,
whose `run` returns `{ users: N }` where N is the number of entries in `users` (read it from the map — do not type the number).
File: ~/.k8s-wargame/trigger/app/src/trigger/count-users.ts — a new file. Then `npx tsc --noEmit` in ~/.k8s-wargame/trigger/app.
Check yourself:  wg check      stuck?  wg hint
