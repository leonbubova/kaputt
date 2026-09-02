source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
cat > "$APP/src/app/go/page.tsx" <<'T'
import { redirect } from "next/navigation";
import { getProducts } from "@/lib/products";

// legacy entry point: send visitors to the first product
export default function Go() {
  try {
    const first = getProducts()[0];
    redirect(first ? `/products/${first.slug}` : "/products");
  } catch (err) {
    console.error("go: could not redirect", err);
    return (
      <p>
        Something went wrong. <a href="/products">Continue to products</a>
      </p>
    );
  }
}
T
