## 1
Nest builds the whole dependency graph at boot: every constructor parameter must be satisfied by a provider in that module (or something an imported module exports). If one is missing it refuses to start — and names the module and class. Start it yourself and read the very first ERROR line: `npm run start:dev`.
## 2
A module can only export / inject what it *provides*. Open `src/users/users.module.ts` and compare `providers`, `exports` and what the controller's constructor asks for.
## 3
Add the service back: `providers: [UsersService]` in `UsersModule`. Restart, `curl localhost:3200/users`.
