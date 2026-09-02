import { describe, expect, it } from "vitest";
import { formatPrice } from "@/lib/format";

describe("formatPrice", () => {
  it("formats euros German style", () => {
    expect(formatPrice(4.5)).toBe("4,50 €");
  });
});
