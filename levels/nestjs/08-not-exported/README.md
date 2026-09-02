# importing a module gives you its exports only, not its providers
Lesson: the previous level was about one module's own lists. This one is about the seam between two. `OrdersModule` imports `UsersModule` because `OrdersService` needs `UsersService`. Importing does not open the whole module — it opens the `exports` list. A provider that `UsersModule` builds but does not export is invisible to every importer, exactly as if it did not exist.
That is why the error blames a class nobody touched. The DI error says "...at index [0] is available in the OrdersModule context" — it tells you where the lookup happened (the consumer's module), not where the fix goes (the module that owns the provider). Read it as: OrdersModule searched its own providers and the exports of its imports, and came up empty. Then ask which of its imports should have offered the missing class.
    imports: [UsersModule]           OrdersModule: I want UsersModule's exports
    exports: [UsersService]          UsersModule: what importers get
    grep -n 'imports\|exports' src/*/*.module.ts    the whole visibility map in one screen
Try it first: `cat src/orders/orders.module.ts` and `cat src/users/users.module.ts` side by side; follow the arrow from imports to exports.
Your task: orders were working on Friday. Now the app refuses to boot and blames `OrdersService` — but nobody touched the orders folder.
Goal: the app boots, `GET /orders` lists orders and `POST /orders` for user 1 works (unknown user -> 404).
Check yourself:  wg check      stuck?  wg hint
