import { Injectable } from '@nestjs/common';

@Injectable()
export class HealthService {
  private readonly startedAt = Date.now();
  uptime(): number { return Math.round((Date.now() - this.startedAt) / 1000); }
}
