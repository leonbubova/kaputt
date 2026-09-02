# checkout 500s with TaskPayloadParsedError
"Every real checkout fails at `POST /api/checkout` with `TaskPayloadParsedError: Expected number, received string` before a run is even created. Triggering `charge-card` from the dashboard test page works fine." Goal: `checkout()` with a real storefront body creates a `charge-card` run and the run charges exactly 4999 cents for ord_1001.
