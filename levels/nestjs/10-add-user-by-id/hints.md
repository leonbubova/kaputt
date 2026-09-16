## 1
Route params: `@Get(':id')` on the method, `@Param('id')` on the argument. They arrive as strings — a pipe converts and validates: `@Param('id', ParseIntPipe) id: number`.
## 2
`UsersService.findOne(id)` already exists and throws `NotFoundException` — Nest turns thrown `HttpException`s into the matching status automatically. Compare with `orders.controller.ts`.
## 3
```
@Get(':id')
findOne(@Param('id', ParseIntPipe) id: number) { return this.users.findOne(id); }
```
