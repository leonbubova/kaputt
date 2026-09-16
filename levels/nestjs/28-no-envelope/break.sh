source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' 's/{ provide: APP_INTERCEPTOR, useClass: TransformInterceptor },/TransformInterceptor,/; s/import { APP_FILTER, APP_INTERCEPTOR }/import { APP_FILTER }/' "$APP/src/app.module.ts"
