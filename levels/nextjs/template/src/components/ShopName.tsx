"use client";

// rendered in the browser too, so the value must be public
export function ShopName() {
  return <strong data-testid="shop-name">{process.env.NEXT_PUBLIC_SHOP_NAME}</strong>;
}
