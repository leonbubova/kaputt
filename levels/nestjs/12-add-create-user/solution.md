class-validator decorators on `CreateUserDto` (`@IsString @MinLength(2)`, `@IsEmail`, `@IsOptional @IsIn`), and `@Post() @HttpCode(201) create(@Body() dto: CreateUserDto)` in `UsersController`.
