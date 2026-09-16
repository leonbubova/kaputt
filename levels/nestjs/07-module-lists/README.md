# a module lists what exists
Lesson: Nest does not scan your files. A class only exists for Nest once a module lists it. Open `src/app.module.ts`:
    @Module({
      imports: [...],                          // other modules whose classes I use
      controllers: [HealthController],         // my routes
      providers: [HealthService, ...],         // my services — what can be injected
    })
    export class AppModule {}
Two lists matter now. `controllers`: a controller not in it has no routes — no `Mapped` line, curl gets 404.
`providers`: a service not in it cannot be injected, and the boot fails with
`Nest can't resolve dependencies of the HealthController (?)` — the `?` is the missing service.
To put a class into a list it must also be imported at the top of the file, so TypeScript knows where it lives:
    import { HealthController } from './health/health.controller';
(`./health/health.controller` is the path of the file relative to app.module.ts, without `.ts`.)
Try it — start the server and read the boot log: no `HealthController` line, and `curl -s localhost:3200/health` is 404.
Your task: register `HealthController` in `AppModule` again — the import line plus the entry in `controllers` — so that
the boot log shows `Mapped {/health, GET}` and `curl -s localhost:3200/health` answers `status: ok`.
Work in ~/.k8s-wargame/nestjs/app (`wg shell` takes you there). Server: `npm run start:dev` in that folder, in its own terminal — every `wg level` stops it, start it again.
Check yourself:  wg check      stuck?  wg hint
