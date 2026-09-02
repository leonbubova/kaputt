import { NextResponse } from "next/server";
import { getStock } from "@/lib/stock";

export const dynamic = "force-dynamic";

export async function GET() {
  return NextResponse.json(getStock());
}
