# "Nest cannot create the OrdersModule instance"
"A cleanup PR removed 'unnecessary forwardRef() wrappers' in users and orders. Now the app dies at boot. Reverting isn't an option — the PR also shipped other things." Goal: the app boots, `GET /users/1` still reports `orderCount`, `POST /orders` still verifies the user exists.
App: ~/.k8s-wargame/nestjs/app · `npm run start:dev` · `npm test` · `npx tsc --noEmit`
