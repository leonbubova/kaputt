# a provider is a class Nest builds for you and hands to whoever asks
Lesson: controllers translate HTTP in and out; the logic goes into a service. In Nest a service is a "provider": a plain class marked `@Injectable()`. You never `new` it. A constructor parameter says you want one, and Nest creates a single instance and passes it in. That is dependency injection, the whole idea of the framework.
Two lists make it work: the consumer asks by type in its constructor, and the module lists the class under `providers: [...]` so Nest may build it. Ask for something no module provides and boot stops with "Nest can't resolve dependencies of the X (?)".
One instance means it can hold state: a field set when the class is constructed survives across requests.
    @Injectable() export class HealthService { ... }     mark the class as a provider
    constructor(private readonly health: HealthService) {}   ask for it; Nest injects the instance
    providers: [HealthService]       in the module that owns the controller
    Date.now()                       milliseconds now; store it once, subtract later
Try it first: `cat src/orders/orders.controller.ts` — the constructor asks for `OrdersService`; find where it is provided.
Your task: move the logic out of the controller: add a `HealthService` (`@Injectable`) that remembers when the process started and returns `uptime` in seconds. Inject it into `HealthController` via the constructor. `GET /health` -> `{ status: "ok", uptime: <number> }`.
Goal: the endpoint returns a numeric `uptime`, provided by a service.
Check yourself:  wg check      stuck?  wg hint
