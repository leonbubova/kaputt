source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "s/  findAll(@Query('role') role?: Role) { return this.users.findAll(role); }/  findAll() { return this.users.findAll(); }/; s/Post, Query }/Post }/; s/import { Role, UsersService }/import { UsersService }/" "$APP/src/users/users.controller.ts"
sed -i '' "s/  findAll(role?: Role): User\[\] { return role ? this.users.filter((u) => u.role === role) : this.users; }/  findAll(): User[] { return this.users; }/" "$APP/src/users/users.service.ts"
