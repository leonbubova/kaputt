source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "/@Post()/,/create(@Body/d; s/import { Body, Controller, Get, HttpCode, HttpStatus, Param, ParseIntPipe, Post, Query }/import { Controller, Get, Param, ParseIntPipe, Query }/; /create-user.dto'/d" "$APP/src/users/users.controller.ts"
cat > "$APP/src/users/dto/create-user.dto.ts" <<'TS'
export class CreateUserDto {
  name: string;
  email: string;
  role?: 'admin' | 'user';
}
TS
