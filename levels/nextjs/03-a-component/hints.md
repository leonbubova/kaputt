## 1
A page = `export default function NAME() { return ( JSX ); }`. Delete the old content of the file; the copied About page had extra lines you do not need.
## 2
JSX must have one outer element: `<section>` … `</section>` with the `<h1>` and the `<p>` inside. Multi-line JSX goes between `return (` and `);`.
## 3
```tsx
export default function Hello() {
  return (
    <section>
      <h1>Hello</h1>
      <p>I wrote this myself.</p>
    </section>
  );
}
```
