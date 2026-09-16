## 1
A box is made with `const NAME = VALUE;` — a normal JavaScript line, so it goes before `return`. Inside JSX, `{NAME}` shows its value and `{NAME * 2}` shows the result of the calculation.
## 2
Inside the function, first line: `const worms = 3;`. Then in the section, under the two paragraphs: `<p>{worms * 2} worms</p>`.
## 3
```tsx
export default function Hello() {
  const worms = 3;
  return (
    <section>
      <h1>Hello</h1>
      <p>I wrote this myself.</p>
      <p>{worms * 2} worms</p>
    </section>
  );
}
```
