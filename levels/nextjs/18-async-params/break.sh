source "$WG_ROOT/lib/common.sh"; source "$WG_ROOT/levels/nextjs/lib.sh"
cat > "$APP/src/app/products/[slug]/page.tsx" <<'T'
import { notFound } from "next/navigation";
import { getProduct } from "@/lib/products";
import { formatPrice } from "@/lib/format";

type Props = { params: { slug: string } };

export default function ProductPage({ params }: Props) {
  const product = getProduct(params.slug);
  if (!product) notFound();
  return (
    <article>
      <h1>{product.name}</h1>
      <p data-testid="price">{formatPrice(product.price)}</p>
    </article>
  );
}
T
