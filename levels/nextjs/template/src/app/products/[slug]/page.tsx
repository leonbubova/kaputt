import { notFound } from "next/navigation";
import { getProduct } from "@/lib/products";
import { formatPrice } from "@/lib/format";
import { LikeButton } from "@/components/LikeButton";

type Props = { params: Promise<{ slug: string }> };

export default async function ProductPage({ params }: Props) {
  const { slug } = await params;
  const product = getProduct(slug);
  if (!product) notFound();
  return (
    <article>
      <h1>{product.name}</h1>
      <p data-testid="price">{formatPrice(product.price)}</p>
      <LikeButton />
    </article>
  );
}
