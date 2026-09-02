`ConfigModule.forRoot({ isGlobal: true })` in `AppModule.imports`; `ApiKeyGuard` injects `ConfigService` and compares the header with `config.get('API_KEY')` instead of the literal.
