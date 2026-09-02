source "$WG_ROOT/levels/nestjs/nest.sh"
sed -i '' "s/ConfigModule.forRoot({ isGlobal: true })/ConfigModule.forRoot({ isGlobal: true, envFilePath: '.env.production' })/" "$APP/src/app.module.ts"
