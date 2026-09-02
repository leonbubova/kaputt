import { readFileSync } from "fs";
import path from "path";

export function getStock(): Record<string, number> {
  const file = path.join(process.cwd(), "data", "stock.json");
  return JSON.parse(readFileSync(file, "utf8")) as Record<string, number>;
}
