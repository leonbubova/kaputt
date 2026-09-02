## 1
The stack trace names the file it tried to open. Compare that absolute path with where `seed/users.json` really is.
## 2
`__dirname` is the directory of the *source file* (`src/users/`), not the project root. `onModuleInit` in `src/users/users.service.ts` builds the path with it.
## 3
Use `process.cwd()` (the project root) or `join(__dirname, '..', '..', 'seed', 'users.json')`.
