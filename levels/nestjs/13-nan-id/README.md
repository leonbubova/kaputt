# every user is "not found"
"`GET /users/1` says `User 1 not found` although `GET /users` clearly lists id 1. Started after the controller cleanup." Goal: `GET /users/1` returns Ada, a non-numeric id gives 400, an unknown id gives 404.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
