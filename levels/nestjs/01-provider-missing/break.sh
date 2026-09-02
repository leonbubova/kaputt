source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' 's/providers: \[UsersService\],/providers: [],/' "$APP/src/users/users.module.ts"
