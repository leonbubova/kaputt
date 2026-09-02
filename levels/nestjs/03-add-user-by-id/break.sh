source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "/@Get(':id')/,/findOne(/d; s/Param, ParseIntPipe, Post/Post/" "$APP/src/users/users.controller.ts"
