import { CanActivate, ExecutionContext, Injectable, InternalServerErrorException, UnauthorizedException } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { Request } from 'express';

@Injectable()
export class ApiKeyGuard implements CanActivate {
  constructor(private readonly config: ConfigService) {}

  canActivate(context: ExecutionContext): boolean {
    const expected = this.config.get<string>('API_KEY');
    if (!expected) throw new InternalServerErrorException('API_KEY is not configured');
    const req = context.switchToHttp().getRequest<Request>();
    const key = req.headers['x-api-key'];
    if (!key || key !== expected) throw new UnauthorizedException('invalid api key');
    return true;
  }
}
