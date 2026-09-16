# a typo stops the server — read the error
Lesson: every save restarts the server. If a file cannot be understood, the server does not start at all — and it
prints why. Look in terminal 1 for the first line that names a file:
    src/health/health.controller.ts(10,27): error TS1005: ',' expected.
Read it as: file `src/health/health.controller.ts`, line 10, column 27, problem: a comma is expected there.
Everything below (the long list of `at …` lines) is noise — where inside node the error was noticed. Ignore it.
Fix the named line, save, and the server starts again by itself. Until then curl gets no answer.
Try it — the app is currently broken this way. Start the server and read what it prints:
    cd ~/.k8s-wargame/nestjs/app
    npm run start:dev
Your task: find the line the error names, repair it, and make `curl -s localhost:3200/health` answer `status: ok`
again. The log tells you the file, the line and what is missing — nothing else needs changing.
Work in ~/.k8s-wargame/nestjs/app (`wg shell` takes you there). Server: `npm run start:dev` in that folder, in its own terminal — every `wg level` stops it, start it again.
Check yourself:  wg check      stuck?  wg hint
