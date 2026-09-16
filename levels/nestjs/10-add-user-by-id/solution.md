`@Get(':id') findOne(@Param('id', ParseIntPipe) id: number) { return this.users.findOne(id); }` in `UsersController` (service method already throws `NotFoundException`).
