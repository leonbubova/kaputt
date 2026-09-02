import { it, expect } from "vitest";
import { indexProject, taskMeta, queues } from "./harness.js";
it("queue shopify-api exists with limit 2 and sync-shopify uses it", async () => {
  const ix = await indexProject();
  expect(ix.importErrors, "task files fail to import").toEqual([]);
  const def = queues().find((x) => x.name === "shopify-api");
  expect(def, "queue shopify-api is not defined").toBeTruthy();
  expect(def!.concurrencyLimit, "concurrencyLimit").toBe(2);
  expect(taskMeta("sync-shopify").queue?.name, "sync-shopify is not in the queue").toBe("shopify-api");
});
