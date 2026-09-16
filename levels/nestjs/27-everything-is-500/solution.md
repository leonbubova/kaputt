The global `HttpExceptionFilter` (`@Catch()`) hard-codes 500 for every exception, swallowing the status of `HttpException`s.
    src/common/http-exception.filter.ts → status = exception instanceof HttpException ? exception.getStatus() : 500
