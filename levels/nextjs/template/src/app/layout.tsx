import type { Metadata } from "next";
import Link from "next/link";
import { ShopName } from "@/components/ShopName";
import "./globals.css";

export const metadata: Metadata = {
  title: "Wurm Shop",
  description: "Regenwürmer für alle.",
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="de">
      <body>
        <header>
          <ShopName />
          <nav>
            <Link href="/">Home</Link> <Link href="/products">Products</Link>{" "}
            <Link href="/stock">Stock</Link> <Link href="/gallery">Gallery</Link>{" "}
            <Link href="/dashboard">Dashboard</Link> <Link href="/cart">Cart</Link>{" "}
            <Link href="/guestbook">Guestbook</Link> <Link href="/about">About</Link>
          </nav>
        </header>
        <main>{children}</main>
      </body>
    </html>
  );
}
