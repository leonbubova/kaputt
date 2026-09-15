`fetch(..., { cache: "force-cache" })` puts `/api/stock` into the persistent Data Cache; the page never re-fetches.
    sed -i '' 's/cache: "force-cache"/cache: "no-store"/' src/app/stock/page.tsx
