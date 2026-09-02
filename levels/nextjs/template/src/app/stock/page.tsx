import { headers } from "next/headers";

// live stock levels — must never be stale
export default async function StockPage() {
  const h = await headers();
  const host = h.get("host") ?? "localhost:3100";
  let stock: Record<string, number> = {};
  try {
    const res = await fetch(`http://${host}/api/stock`, { cache: "no-store" });
    stock = await res.json();
  } catch (e) {
    console.error("stock api not reachable", e);
  }
  return (
    <section>
      <h1>Stock</h1>
      <ul data-testid="stock">
        {Object.entries(stock).map(([slug, n]) => (
          <li key={slug}>{slug}: {n}</li>
        ))}
      </ul>
    </section>
  );
}
