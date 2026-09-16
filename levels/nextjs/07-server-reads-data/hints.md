## 1
Three pieces: an `import` line at the very top of the file, a `const products = getProducts();` line before `return`, and a paragraph using `products` in braces.
## 2
`import { getProducts } from "@/lib/products";` as line 1. Then inside `Hello()`: `const products = getProducts();`. The paragraph from the task goes into the section, braces around each JavaScript part.
## 3
```tsx
import { getProducts } from "@/lib/products";
// …Greeting unchanged…
export default function Hello() {
  const worms = 3;
  const products = getProducts();
  return (
    <section>
      {/* …existing lines… */}
      <p data-testid="catalogue">{products.length} products, first: {products[0].name}</p>
    </section>
  );
}
```
