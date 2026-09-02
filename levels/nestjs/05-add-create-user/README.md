# a DTO class plus class-validator decorators is how a body gets validated
Lesson: a POST body reaches your handler through `@Body()`. On its own that is parsed JSON in any shape the client likes. What makes it safe is the type on the argument: a DTO class. The global `ValidationPipe` (already in `main.ts`) checks the incoming object against the decorators on that class's fields and answers 400 with a list of messages if anything fails. Your handler only sees valid data.
The rules are `class-validator` decorators. No decorator means no rule — and because the pipe runs with `whitelist: true`, an undecorated field is silently stripped. A feature (junk never reaches you) and a trap (forget a decorator, the field vanishes).
A POST answers 201 only when you say so with `@HttpCode`.
    @Post() create(@Body() dto: CreateUserDto)     body, validated against the DTO class
    @IsString() @MinLength(2) name: string          rules stack on one field
    @IsEmail() email: string                        format check
    @IsOptional() @IsIn(['admin','user']) role?: Role   allowed to be absent, else one of these
    @HttpCode(HttpStatus.CREATED)                   201 instead of the default
Try it first: `curl -s -X POST -H 'content-type: application/json' -d '{}' localhost:3200/orders` — read the 400 body.
Your task: add `POST /users` taking a `CreateUserDto` (`src/users/dto/create-user.dto.ts`): `name` (string, >=2 chars) and `email` (valid email) required, `role` optional. Validate with class-validator decorators — missing/invalid fields -> 400, success -> 201 (`@HttpCode`) with the created user.
Goal: `POST {}` -> 400, `POST {name,email}` -> 201 and the user shows up in `GET /users`.
Check yourself:  wg check      stuck?  wg hint
