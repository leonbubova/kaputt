"use client";

import { useState } from "react";
import Link from "next/link";
import type { Product } from "@/lib/products";
import { formatPrice } from "@/lib/format";

export function ProductList({ products }: { products: Product[] }) {
  const [filter, setFilter] = useState("");
  const shown = products.filter((p) => p.name.toLowerCase().includes(filter.toLowerCase()));
  return (
    <div>
      <input placeholder="filter" value={filter} onChange={(e) => setFilter(e.target.value)} />
      <ul data-testid="product-list">
        {shown.map((p) => (
          <li key={p.slug}>
            <Link href={`/products/${p.slug}`}>{p.name}</Link> — {formatPrice(p.price)}
          </li>
        ))}
      </ul>
    </div>
  );
}
