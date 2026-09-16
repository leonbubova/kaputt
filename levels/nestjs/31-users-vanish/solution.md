`@Injectable({ scope: Scope.REQUEST })` on `UsersService`: a fresh instance (empty array) per request, and `onModuleInit` (seed) is skipped for request-scoped providers.
    src/users/users.service.ts → @Injectable()
