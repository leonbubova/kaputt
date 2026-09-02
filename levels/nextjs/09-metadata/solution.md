The layout exports `metaData`; Next.js only reads `metadata` / `generateMetadata`.
    sed -i '' 's/export const metaData/export const metadata/' src/app/layout.tsx
