# a module is a visibility boundary: it sees what it provides plus what its imports export
Lesson: `@Module` is an empty class with four lists. `controllers` are its routes, `providers` the classes it builds, `imports` other modules it wants things from, `exports` the providers it hands out. The last list is the one people forget.
Providers are private to their module. If `OrdersService` lives in `AppModule` and asks for `UsersService`, and `UsersService` has moved into `UsersModule`, then `AppModule` must import `UsersModule` and `UsersModule` must export `UsersService`. Importing alone is not enough — an import gives you exactly the exports, nothing more.
A feature module is a small contract: I own these routes and classes, I share these. Everything else stays hidden.
    @Module({ imports: [], controllers: [], providers: [], exports: [] })    the four lists
    export class UsersModule {}      the class body stays empty
    imports: [UsersModule]           in AppModule: pull the feature in
    exports: [UsersService]          in UsersModule: let importers inject it
Try it first: `grep -n 'UsersService' src/*/*.ts` — every constructor that asks for it must still be able to see it afterwards.
Your task: `AppModule` has grown into a grab bag — every controller and service is listed in it. Extract a `UsersModule` (`src/users/users.module.ts`) that owns `UsersController` + `UsersService`, and import it from `AppModule`. Everything must keep working — including orders and admin, which use `UsersService`.
Goal: `users.module.ts` exists, `AppModule` imports it and no longer lists the users classes, all routes work.
Check yourself:  wg check      stuck?  wg hint
