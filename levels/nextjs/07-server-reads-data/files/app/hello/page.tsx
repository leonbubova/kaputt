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
