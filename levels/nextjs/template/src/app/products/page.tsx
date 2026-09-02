import Link from "next/link";
import { getProducts } from "@/lib/products";
import { ProductList } from "@/components/ProductList";

export default function Products() {
  const products = getProducts();
  return (
    <section>
      <h1>Products</h1>
      <ProductList products={products} />
      <p><Link href="/">back</Link></p>
    </section>
  );
}
