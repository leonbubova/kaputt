# a controller is a list of routes
Lesson: a route is one address the API answers, e.g. `GET /health`. In Nest, routes live in a controller: a class in a
file ending in `.controller.ts`. Open `src/health/health.controller.ts` and find these lines:
    @Controller('health')            // every route in this class starts with /health
    export class HealthController {
      @Get()                         // GET /health — nothing added after the prefix
      check() {
        return { status: 'ok', uptime: this.health.uptime() };
      }
    }
Lines starting with `@` are decorators: labels that tell Nest what a class or a method is for. `@Get('time')` on a
method makes it answer `GET /health/time`. Whatever the method returns becomes the answer.
The server restarts by itself every time you save a file — watch terminal 1, then curl again.
Try it — add this method inside the class, below `check()`, save, then `curl -s localhost:3200/health/time`:
    @Get('time')
    time() {
      return new Date().toISOString();
    }
Your task: add a route `GET /health/ping` to `HealthController` that answers with the text `pong`.
Work in ~/.k8s-wargame/nestjs/app (`wg shell` takes you there). Server: `npm run start:dev` in that folder, in its own terminal — every `wg level` stops it, start it again.
Check yourself:  wg check      stuck?  wg hint
