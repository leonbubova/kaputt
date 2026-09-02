`ConfigModule.forRoot({ envFilePath: '.env.production' })` — that file doesn't exist, so nothing is loaded; it only worked where API_KEY was already in the shell.
    src/app.module.ts → ConfigModule.forRoot({ isGlobal: true })
