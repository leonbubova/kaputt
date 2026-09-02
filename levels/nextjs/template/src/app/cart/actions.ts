"use server";

export async function addToCart(formData: FormData) {
  const slug = String(formData.get("slug") ?? "");
  console.log("added to cart:", slug);
}
