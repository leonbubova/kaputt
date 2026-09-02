import { CallHandler, ExecutionContext, Injectable, NestInterceptor } from '@nestjs/common';
import { Observable, map } from 'rxjs';

// frontend expects every success body as { data: ... }
@Injectable()
export class TransformInterceptor<T> implements NestInterceptor<T, { data: T }> {
  intercept(_ctx: ExecutionContext, next: CallHandler<T>): Observable<{ data: T }> {
    return next.handle().pipe(map((data) => ({ data })));
  }
}
