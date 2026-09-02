source "$WG_ROOT/levels/nestjs/nest.sh"
rm -f "$APP/src/common/http-exception.filter.ts"
sed -i '' "/http-exception.filter'/d; /{ provide: APP_FILTER, useClass: HttpExceptionFilter },/d; s/import { APP_FILTER, APP_INTERCEPTOR }/import { APP_INTERCEPTOR }/" "$APP/src/app.module.ts"
