# ENOENT at boot
"Since the seed loader was 'made path-safe' the app crashes on start: `ENOENT: no such file or directory ... users.json`. The file is right there in `seed/`." Goal: the app boots and `GET /users` returns the 3 users from `seed/users.json` (keep loading them from that file).
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
