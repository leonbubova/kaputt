# a service does the work — the controller asks for it
Lesson: a controller should only know routes. The actual logic lives in a service: a plain class labelled
`@Injectable()`, in a file ending in `.service.ts`. Open `src/health/health.service.ts`:
    @Injectable()
    export class HealthService {
      private readonly startedAt = Date.now();
      uptime(): number { return Math.round((Date.now() - this.startedAt) / 1000); }
    }
The controller never creates the service itself. It asks for one in its constructor, and Nest hands over a shared
instance — this is called dependency injection:
    constructor(private readonly health: HealthService) {}     // "I need a HealthService; inside this class call it health"
From then on every method of the controller can use it: `this.health.uptime()`.
Try it — open both files side by side and follow `uptime` from the curl answer back to the service method:
    curl -s localhost:3200/health
Your task: add a method `greeting()` to `HealthService` that returns the text `hello from the service`, and a route
`GET /health/greeting` in `HealthController` that returns whatever `this.health.greeting()` gives back.
Work in ~/.k8s-wargame/nestjs/app (`wg shell` takes you there). Server: `npm run start:dev` in that folder, in its own terminal — every `wg level` stops it, start it again.
Check yourself:  wg check      stuck?  wg hint
