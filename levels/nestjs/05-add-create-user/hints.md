## 1
`@Post() create(@Body() dto: CreateUserDto) { return this.users.create(dto); }` — the `@Body()` type is what `ValidationPipe` (already global in `main.ts`) validates against.
## 2
Validation rules live on the DTO class as decorators from `class-validator`: `@IsString() @MinLength(2) name`, `@IsEmail() email`, `@IsOptional() @IsIn(['admin','user']) role`. No decorator = no rule (and with `whitelist: true` the field is even stripped).
## 3
```
@Post() @HttpCode(HttpStatus.CREATED)
create(@Body() dto: CreateUserDto) { return this.users.create(dto); }
```
plus the decorators from hint 2 in `create-user.dto.ts`.
