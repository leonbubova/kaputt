# schema validation happens at trigger time, in the caller — so convert at the boundary
Lesson: a `schemaTask` checks its payload when `trigger()` is called, in the process that calls it. A bad payload never produces a run: the caller gets `TaskPayloadParsedError` and the dashboard shows nothing. By design — but the failure now lives on the caller's side.
It also means the same task can work from one caller and fail from another. The dashboard test page sends a hand-typed JSON object with real numbers. An HTTP form body arrives as strings: `"4999"` is not `4999`, and `z.number()` says so.
TypeScript will not save you here. A body typed `any` lets a string flow into a number field without complaint; only the runtime schema notices. The fix belongs where untyped data enters the code: convert at the boundary so the payload matches the schema — or make the schema coerce.
    cat src/trigger/charge-card.ts        what the schema demands
    cat src/api/checkout.ts               what the caller builds from the request body
    Number(x)                             string "4999" -> number 4999
    z.coerce.number()                     zod: convert before validating
Try it first: `node -e 'console.log(typeof "4999", typeof Number("4999"))'`.
Your task: "Every real checkout fails at `POST /api/checkout` with `TaskPayloadParsedError: Expected number, received string` before a run is even created. Triggering `charge-card` from the dashboard test page works fine." Goal: `checkout()` with a real storefront body creates a `charge-card` run and the run charges exactly 4999 cents for ord_1001.
Check yourself:  wg check      stuck?  wg hint
