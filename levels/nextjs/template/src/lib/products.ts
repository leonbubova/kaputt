// server-only: reads the product catalogue from disk
import { readFileSync } from "fs";
import path from "path";

export type Product = { slug: string; name: string; price: number };

export function getProducts(): Product[] {
  const file = path.join(process.cwd(), "data", "products.json");
  return JSON.parse(readFileSync(file, "utf8")) as Product[];
}

export function getProduct(slug: string): Product | undefined {
  return getProducts().find((p) => p.slug === slug);
}
