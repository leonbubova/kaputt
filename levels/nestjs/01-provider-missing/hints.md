## 1
Start it yourself and read the very first ERROR line: `npm run start:dev`. Nest tells you which module and which class it is complaining about.
## 2
A module can only export / inject what it *provides*. Open `src/users/users.module.ts` and compare `providers`, `exports` and what the controller's constructor asks for.
## 3
Add the service back: `providers: [UsersService]` in `UsersModule`. Restart, `curl localhost:3200/users`.
