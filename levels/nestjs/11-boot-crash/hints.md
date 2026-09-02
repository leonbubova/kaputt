## 1
ENOENT means Node resolved a path and nothing was there. Relative paths aren't relative to "the project" — they are resolved against some base (`process.cwd()`, `__dirname`, …), and the bug is almost always the wrong base. The stack trace names the absolute path it tried to open; compare it with where `seed/users.json` really is.
## 2
`__dirname` is the directory of the *source file* (`src/users/`), not the project root. `onModuleInit` in `src/users/users.service.ts` builds the path with it.
## 3
Use `process.cwd()` (the project root) or `join(__dirname, '..', '..', 'seed', 'users.json')`.
