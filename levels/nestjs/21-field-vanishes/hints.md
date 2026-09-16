## 1
`main.ts` runs `ValidationPipe({ whitelist: true })`. Read what `whitelist` does in the Nest docs: properties without any validation decorator are removed.
## 2
Open `src/users/dto/create-user.dto.ts`. Which property has no decorator?
## 3
`@IsEmail() email: string;` (import from `class-validator`).
