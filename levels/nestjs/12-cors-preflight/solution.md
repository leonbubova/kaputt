`enableCors({ allowedHeaders: ['Content-Type'] })` — the custom `X-Api-Key` header is not in the list, so the preflight rejects it.
    src/main.ts → allowedHeaders: ['Content-Type', 'X-Api-Key']
