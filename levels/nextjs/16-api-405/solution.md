The handler is exported as `get`; Route Handlers only recognise uppercase HTTP method names.
    sed -i '' 's/function get(/function GET(/' src/app/api/health/route.ts
