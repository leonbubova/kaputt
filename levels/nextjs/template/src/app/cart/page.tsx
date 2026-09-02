import { AddForm } from "@/components/AddForm";
import { addToCart } from "./actions";

export default function Cart() {
  return (
    <section>
      <h1>Cart</h1>
      <AddForm action={addToCart} />
    </section>
  );
}
