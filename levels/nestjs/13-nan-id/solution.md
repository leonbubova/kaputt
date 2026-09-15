`@Param('id') id: number` receives the string `"1"`; `u.id === id` never matches. Nothing validates the id either.
    src/users/users.controller.ts → @Param('id', ParseIntPipe) id: number
