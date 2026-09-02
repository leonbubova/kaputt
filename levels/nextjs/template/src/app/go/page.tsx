import { redirect } from "next/navigation";
import { getProducts } from "@/lib/products";

// legacy entry point: send visitors to the first product
export default function Go() {
  let target = "/products";
  try {
    const first = getProducts()[0];
    if (first) target = `/products/${first.slug}`;
  } catch {
    target = "/products";
  }
  redirect(target);
}
