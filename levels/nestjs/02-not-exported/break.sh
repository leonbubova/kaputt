source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' '/exports: \[UsersService\],/d' "$APP/src/users/users.module.ts"
