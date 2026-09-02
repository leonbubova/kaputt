import 'reflect-metadata';
import { NestFactory } from '@nestjs/core';
import { ValidationPipe } from '@nestjs/common';
import { AppModule } from './app.module';
import { requestId } from './common/request-id.middleware';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  app.use(requestId);
  app.enableCors({
    origin: 'http://localhost:5173',
    allowedHeaders: ['Content-Type', 'X-Api-Key'],
  });
  app.useGlobalPipes(new ValidationPipe({ whitelist: true }));
  const port = Number(process.env.PORT ?? 3200);
  await app.listen(port);
  console.log(`api listening on http://localhost:${port}`);
}
bootstrap();
