## 1
An interceptor only runs where it is *bound* — to a handler, a controller, or globally. A class that merely exists (or is merely injectable) does nothing to responses. `TransformInterceptor` is fine — is it *applied* anywhere? Look at how `AppModule` registers it in `src/app.module.ts`.
## 2
Listing a class in `providers` only makes it injectable. To run it globally it must be bound to the `APP_INTERCEPTOR` token (or `app.useGlobalInterceptors`).
## 3
`{ provide: APP_INTERCEPTOR, useClass: TransformInterceptor }` (import `APP_INTERCEPTOR` from `@nestjs/core`).
