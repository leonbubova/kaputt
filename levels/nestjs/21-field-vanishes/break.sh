source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' '/@IsEmail()/d; s/import { IsEmail, IsString, MinLength }/import { IsString, MinLength }/' "$APP/src/users/dto/create-user.dto.ts"
