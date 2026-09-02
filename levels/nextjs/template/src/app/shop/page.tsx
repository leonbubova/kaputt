import { redirect } from "next/navigation";

// old bookmark: /shop is now /products
export default function Shop() {
  redirect("/products");
}
