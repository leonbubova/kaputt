The prop type in `ProductList.tsx` says `products: Product` but the page passes `Product[]` — `next build` type-checks, `next dev` does not.
    sed -i '' 's/{ products: Product }/{ products: Product[] }/' src/components/ProductList.tsx
