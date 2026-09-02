# nestjs — the commands & files you'll actually use
App: ~/.k8s-wargame/nestjs/app (`wg shell`). NestJS 11, in-memory data, reset every level.

  npm run start:dev                  http://localhost:3200, restarts on save — the FIRST red line at boot is the answer
  npx tsc --noEmit  /  npm test      type check / jest (specs: src/**/*.spec.ts)
  curl -s localhost:3200/users  ·  curl -s -X POST -H 'content-type: application/json' -d '{…}' localhost:3200/users
  [RouterExplorer] Mapped {/health, GET}    boot log: a route not listed here doesn't exist for Nest
  @Controller('users') + @Get(':id') / @Post()    a class = route prefix, a method = route; the return value becomes JSON
  @Param('id', ParseIntPipe) id: number    params arrive as STRINGS — the pipe converts and 400s on garbage
  @Body() dto: CreateUserDto         validated by the global ValidationPipe via class-validator decorators (@IsEmail, @IsString…); no decorator = field stripped
  @Module({ imports, controllers, providers, exports })    what I use / my routes / what exists here / what others may inject
  "Nest can't resolve dependencies of X"    X's constructor asks for something no module in scope provides or exports
  forwardRef(() => X)                on BOTH sides of a module/service cycle (imports and @Inject)
  throw new NotFoundException()      HttpExceptions map to status codes — unless a @Catch() filter turns everything into 500

Mental model: Nest is a dependency-injection container. A class does nothing until a module lists it; a module sees only what it provides itself plus what an imported module exports. Nearly every boot crash is one of those two lists. Runtime bugs are usually "string vs number" or "header names are lower-cased" — TypeScript types don't exist at runtime.
