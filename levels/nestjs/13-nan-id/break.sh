source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "s/@Param('id', ParseIntPipe) id: number/@Param('id') id: number/; s/Param, ParseIntPipe, Post/Param, Post/" "$APP/src/users/users.controller.ts"
