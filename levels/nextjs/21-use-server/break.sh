source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
cat > "$APP/src/app/cart/actions.ts" <<'T'
export async function addToCart(formData: FormData) {
  const slug = String(formData.get("slug") ?? "");
  console.log("added to cart:", slug);
}
T
