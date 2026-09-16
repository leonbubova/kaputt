# the answer is JSON: return an object
Lesson: curl showed answers like `{"status":"ok","uptime":3}`. That is JSON — text describing an object: a key in
quotes, a colon, a value. In the code the method simply returns a TypeScript object and Nest turns it into JSON:
    return { status: 'ok', uptime: 3 };        →   {"status":"ok","uptime":3}
Every key you put into the object becomes a field of the answer. Text values get quotes in JSON, numbers do not.
Keys are separated by commas; one missing comma and the file no longer compiles.
Try it — compare the code of `check()` in `src/health/health.controller.ts` with the live answer:
    curl -s localhost:3200/health
Your task: `GET /health` must additionally report `"version":2`. Change what `check()` returns so the answer
still contains `status` and `uptime`, and now also `version` with the number 2.
Work in ~/.k8s-wargame/nestjs/app (`wg shell` takes you there). Server: `npm run start:dev` in that folder, in its own terminal — every `wg level` stops it, start it again.
Check yourself:  wg check      stuck?  wg hint
