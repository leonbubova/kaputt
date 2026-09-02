## 1
Same process, no restart, yet the array is empty on the next request. That means the next request talks to a *different instance* of `UsersService`. What controls how many instances a provider gets?
## 2
Look at the `@Injectable()` options in `src/users/users.service.ts`. Request scope creates a new instance per request — and lifecycle hooks like `onModuleInit` (the seed loader) never run for request-scoped providers.
## 3
`@Injectable()` — default (singleton) scope. In-memory state must live in a singleton.
