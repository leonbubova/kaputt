## 1
A helper component is a plain `function Greeting(…)` in the same file, above `export default function Hello()`. The page uses it as a tag: `<Greeting name="Ada" />`.
## 2
Copy the function from the lesson exactly: `function Greeting({ name }: { name: string }) { return <p>hello, {name}</p>; }`. Then two tags in the section, one per name.
## 3
```tsx
function Greeting({ name }: { name: string }) {
  return <p>hello, {name}</p>;
}

export default function Hello() {
  const worms = 3;
  return (
    <section>
      <h1>Hello</h1>
      <p>I wrote this myself.</p>
      <p>{worms * 2} worms</p>
      <Greeting name="Ada" />
      <Greeting name="Linus" />
    </section>
  );
}
```
