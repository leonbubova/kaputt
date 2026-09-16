## 1
`ConfigService.get('API_KEY')` returns undefined. It only knows `process.env` plus whatever `ConfigModule.forRoot()` loaded. Where is `forRoot` configured?
## 2
Look at the options passed in `src/app.module.ts` — which env file does it load? `ls -a` the project root.
## 3
Either drop `envFilePath` (default `.env`) or point it at a file that exists.
