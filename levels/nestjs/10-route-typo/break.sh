source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "s/@Get(':id')/@Get('id')/" "$APP/src/users/users.controller.ts"
