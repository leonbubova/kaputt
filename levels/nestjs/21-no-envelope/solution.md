`TransformInterceptor` is listed as a plain provider — that registers nothing. Global interceptors bind to `APP_INTERCEPTOR`.
    src/app.module.ts → { provide: APP_INTERCEPTOR, useClass: TransformInterceptor }
