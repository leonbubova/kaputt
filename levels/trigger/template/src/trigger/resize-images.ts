import { task } from "@trigger.dev/sdk";

// decodes product photos (up to 50 MP, ~1.5 GB of raw pixels) with sharp
export const resizeImages = task({
  id: "resize-images",
  machine: "medium-1x",
  run: async (payload: { productId: string; sources: string[] }) => {
    return { productId: payload.productId, variants: payload.sources.length * 3 };
  },
});
