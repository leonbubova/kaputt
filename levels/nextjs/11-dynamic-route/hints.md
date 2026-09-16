## 1
A folder in square brackets is a dynamic segment: `src/app/posts/[slug]/page.tsx`. The page receives the value in its `params` prop.
## 2
In Next 15 `params` is a **Promise**: type it `params: Promise<{ slug: string }>`, make the component `async`, and `const { slug } = await params;`. See `src/app/products/[slug]/page.tsx`.
## 3
```tsx
export default async function Post({ params }: { params: Promise<{ slug: string }> }) {
  const { slug } = await params;
  return <h1 data-testid="post-slug">{slug}</h1>;
}
```
