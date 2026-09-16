## 1
`Cannot GET /users/1` is Express saying: no route matched. Check the boot log: which `/users/...` routes does RouterExplorer map?
## 2
Look at the decorators in `src/users/users.controller.ts`. A route parameter needs a colon: `:id`. Without it the path is the literal word.
## 3
`@Get(':id')` on `findOne`.
