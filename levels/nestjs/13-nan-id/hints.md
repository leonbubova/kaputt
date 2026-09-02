## 1
Route params arrive as **strings**. `findOne` in `UsersService` compares with `===`. What is `'1' === 1`?
## 2
The TypeScript type `id: number` on `@Param('id')` is a lie at runtime — nothing converts it unless a pipe does. Compare with `orders.controller.ts`.
## 3
`@Param('id', ParseIntPipe) id: number` — also gives you the 400 for `abc` for free.
