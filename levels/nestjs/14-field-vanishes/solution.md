`ValidationPipe({ whitelist: true })` strips every DTO property that carries no class-validator decorator; `email` lost its `@IsEmail()`.
    src/users/dto/create-user.dto.ts → @IsEmail() email: string
