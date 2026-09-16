import { getProducts } from "@/lib/products";

function Greeting({ name }: { name: string }) {
  return <p>hello, {name}</p>;
}

export default function Hello() {
  const worms = 3;
  const products = getProducts();
  return (
    <section>
      <h1>Hello</h1>
      <p>I wrote this myself.</p>
      <p>{worms * 2} worms</p>
      <Greeting name="Ada" />
      <Greeting name="Linus" />
      <p data-testid="catalogue">{products.length} products, first: {products[0].name}</p>
    </section>
  );
}
