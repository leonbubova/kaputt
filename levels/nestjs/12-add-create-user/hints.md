## 1
A POST body reaches the handler through `@Body()`, and the class you type that argument as is what the global `ValidationPipe` (already in `main.ts`) validates against — no type, no validation. Shape: `@Post() create(@Body() dto: CreateUserDto) { return this.users.create(dto); }`.
## 2
Validation rules live on the DTO class as decorators from `class-validator`: `@IsString() @MinLength(2) name`, `@IsEmail() email`, `@IsOptional() @IsIn(['admin','user']) role`. No decorator = no rule (and with `whitelist: true` the field is even stripped).
## 3
```
@Post() @HttpCode(HttpStatus.CREATED)
create(@Body() dto: CreateUserDto) { return this.users.create(dto); }
```
plus the decorators from hint 2 in `create-user.dto.ts`.
