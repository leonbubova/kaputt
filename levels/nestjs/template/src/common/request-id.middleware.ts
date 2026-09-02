import { randomUUID } from 'node:crypto';
import { Request, Response, NextFunction } from 'express';

// every response carries X-Request-Id so the frontend can quote it in bug reports
export function requestId(req: Request, res: Response, next: NextFunction) {
  const id = (req.headers['x-request-id'] as string) || randomUUID();
  (req as any).id = id;
  res.setHeader('X-Request-Id', id);
  next();
}
