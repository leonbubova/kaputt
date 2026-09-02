// wg check harness — indexes the project like `trigger.dev dev` does, runs task code in the
// SDK's own mock task context, and records everything the SDK sends to the (fake) Trigger.dev API.
import { readdirSync, statSync, existsSync } from "node:fs";
import { join, resolve, extname } from "node:path";
import { createServer, type Server } from "node:http";
import { resourceCatalog, lifecycleHooks, runMetadata } from "@trigger.dev/core/v3";
import { StandardResourceCatalog, StandardLifecycleHooksManager } from "@trigger.dev/core/v3/workers";
import { runInMockTaskContext, type MockTaskContextOptions } from "@trigger.dev/core/v3/test";

export const APP = process.env.WG_APP ?? process.cwd();

const EXTS = new Set([".ts", ".tsx", ".mts", ".cts", ".js", ".jsx", ".mjs", ".cjs"]);
const IGNORED_DIRS = new Set(["node_modules", ".git", "dist", "out", "build"]);
const isTestFile = (f: string) => /\.(test|spec)\.(m|c)?[jt]s$/.test(f) || f.endsWith(".d.ts");

function walk(dir: string, out: string[] = []) {
  if (!existsSync(dir)) return out;
  for (const e of readdirSync(dir)) {
    if (IGNORED_DIRS.has(e) || e.startsWith(".")) continue;
    const p = join(dir, e);
    if (statSync(p).isDirectory()) walk(p, out);
    else if (EXTS.has(extname(p)) && !isTestFile(p)) out.push(p);
  }
  return out;
}
// what the CLI does when `dirs` is omitted: any directory literally named `trigger`
function autodetectDirs(root: string, out: string[] = []) {
  for (const e of readdirSync(root)) {
    if (IGNORED_DIRS.has(e) || e.startsWith(".") || e === "wg-check") continue;
    const p = join(root, e);
    if (!statSync(p).isDirectory()) continue;
    if (e === "trigger" && !p.endsWith("app/api/trigger")) out.push(p);
    else autodetectDirs(p, out);
  }
  return out;
}

export type Indexed = {
  config: any;
  dirs: string[];
  files: string[];
  taskIds: string[];
  collisions: { id: string; filePaths: string[] }[];
  importErrors: { file: string; error: string }[];
};

const catalog = new StandardResourceCatalog();
const hooks = new StandardLifecycleHooksManager();
let indexed: Indexed | undefined;

export async function indexProject(): Promise<Indexed> {
  if (indexed) return indexed;
  resourceCatalog.setGlobalResourceCatalog(catalog);
  lifecycleHooks.setGlobalLifecycleHooksManager(hooks);
  const cfgPath = join(APP, "trigger.config.ts");
  if (!existsSync(cfgPath)) throw new Error("trigger.config.ts not found in " + APP);
  const config = (await import(cfgPath)).default;
  const dirs: string[] = (config.dirs ?? []).map((d: string) => resolve(APP, d));
  const resolvedDirs = dirs.length ? dirs : autodetectDirs(APP);
  const files = resolvedDirs.flatMap((d) => walk(d));
  const importErrors: Indexed["importErrors"] = [];
  for (const f of files) {
    resourceCatalog.setCurrentFileContext(f, f);
    try { await import(f); } catch (e: any) { importErrors.push({ file: f, error: e?.message ?? String(e) }); }
    finally { resourceCatalog.clearCurrentFileContext(); }
  }
  indexed = {
    config, dirs: resolvedDirs, files,
    taskIds: catalog.listTaskManifests().map((t) => t.id),
    collisions: catalog.listTaskIdCollisions(),
    importErrors,
  };
  return indexed;
}

export function taskMeta(id: string) {
  const t = catalog.getTask(id);
  if (!t) throw new Error(`task "${id}" is not registered (indexed: ${catalog.listTaskManifests().map((x) => x.id).join(", ") || "none"})`);
  return t as any;
}
export const manifest = (id: string) => catalog.getTaskManifest(id) as any;
export const queues = () => catalog.listQueueManifests();
export const failureHook = (id: string) => hooks.getTaskFailureHook(id) as any;

export const effective = {
  retry: (id: string, config: any) => taskMeta(id).retry ?? config.retries?.default ?? { maxAttempts: 3 },
  maxDuration: (id: string, config: any) => taskMeta(id).maxDuration ?? config.maxDuration,
  machine: (id: string, config: any): string | undefined => taskMeta(id).machine?.preset ?? config.machine,
};
// memory in GB per machine preset
export const MACHINE_GB: Record<string, number> = {
  micro: 0.25, "small-1x": 0.5, "small-2x": 1, "medium-1x": 2, "medium-2x": 4, "large-1x": 8, "large-2x": 16,
};

/** Run a task's run() inside the SDK mock context (ctx, metadata, wait, locals all wired). */
export async function runTask<T = any>(id: string, payload: unknown, opts?: MockTaskContextOptions & { validate?: boolean }): Promise<T> {
  const t = taskMeta(id);
  const p = opts?.validate !== false && t.fns.parsePayload ? await t.fns.parsePayload(payload) : payload;
  return runInMockTaskContext(async ({ ctx }) => {
    return await t.fns.run(p, { ctx, signal: new AbortController().signal });
  }, { ...opts, ctx: { task: { id, filePath: "x.ts" }, ...opts?.ctx } });
}
/** Like runTask but also returns the run metadata as the task left it. */
export async function runTaskWithMetadata(id: string, payload: unknown, opts?: MockTaskContextOptions) {
  const t = taskMeta(id);
  return runInMockTaskContext(async ({ ctx }) => {
    const result = await t.fns.run(payload, { ctx, signal: new AbortController().signal });
    return { result, metadata: runMetadata.current() ?? {} };
  }, { ...opts, ctx: { task: { id, filePath: "x.ts" }, ...opts?.ctx } });
}

// ---------------------------------------------------------------- fake Trigger.dev API
export type Recorded = {
  triggers: { taskId: string; payload: any; options: any; runId: string; cached: boolean }[];
  batches: { id: string; runCount: number; items: { task: string; payload: any; options: any }[] }[];
  waits: { runId: string; date: Date }[];
};
export type FakeApi = { url: string; rec: Recorded; close: () => Promise<void>; latencyMs: number };

function readBody(req: any): Promise<string> {
  return new Promise((res, rej) => { let b = ""; req.on("data", (c: any) => (b += c)); req.on("end", () => res(b)); req.on("error", rej); });
}
const parsePacket = (data: any, type?: string) => {
  if (typeof data !== "string" || !type?.includes("json")) return data;
  const v = JSON.parse(data);
  return type === "application/super+json" && v && typeof v === "object" && "json" in v ? v.json : v;
};

export async function startFakeApi(latencyMs = 0): Promise<FakeApi> {
  const rec: Recorded = { triggers: [], batches: [], waits: [] };
  const byKey = new Map<string, string>();
  let n = 0;
  const server: Server = createServer(async (req, res) => {
    const url = req.url ?? "";
    const send = (code: number, body: any) => { res.writeHead(code, { "content-type": "application/json" }); res.end(JSON.stringify(body)); };
    if (latencyMs) await new Promise((r) => setTimeout(r, latencyMs));
    let m;
    if ((m = url.match(/^\/api\/v1\/tasks\/([^/]+)\/trigger$/)) && req.method === "POST") {
      const taskId = decodeURIComponent(m[1]);
      if (indexed && !catalog.taskExists(taskId)) return send(404, { error: `Task not found: ${taskId}` });
      const body = JSON.parse(await readBody(req));
      const key = body.options?.idempotencyKey as string | undefined;
      let runId = key ? byKey.get(key) : undefined;
      const cached = !!runId;
      if (!runId) { runId = `run_wg${String(++n).padStart(6, "0")}`; if (key) byKey.set(key, runId); }
      rec.triggers.push({ taskId, payload: parsePacket(body.payload, body.options?.payloadType), options: body.options ?? {}, runId, cached });
      return send(200, { id: runId, isCached: cached });
    }
    if (url === "/api/v3/batches" && req.method === "POST") {
      const body = JSON.parse(await readBody(req));
      const id = `batch_wg${String(++n).padStart(6, "0")}`;
      rec.batches.push({ id, runCount: body.runCount, items: [] });
      return send(200, { id, runCount: body.runCount, isCached: false });
    }
    if ((m = url.match(/^\/api\/v3\/batches\/([^/]+)\/items$/)) && req.method === "POST") {
      const b = rec.batches.find((x) => x.id === m![1]);
      if (!b) return send(404, { error: "batch not found" });
      const lines = (await readBody(req)).split("\n").filter(Boolean).map((l) => JSON.parse(l));
      for (const it of lines) b.items.push({ task: it.task, payload: parsePacket(it.payload, it.options?.payloadType), options: it.options ?? {} });
      return send(200, { id: b.id, itemsAccepted: lines.length, itemsDeduplicated: 0, sealed: b.items.length >= b.runCount, enqueuedCount: b.items.length, expectedCount: b.runCount });
    }
    if ((m = url.match(/^\/engine\/v1\/runs\/([^/]+)\/wait\/duration$/)) && req.method === "POST") {
      const body = JSON.parse(await readBody(req));
      rec.waits.push({ runId: m[1], date: new Date(body.date) });
      return send(200, { waitUntil: body.date, waitpoint: { id: `waitpoint_wg${++n}` } });
    }
    send(404, { error: `wg fake api: no route for ${req.method} ${url}` });
  });
  await new Promise<void>((r) => server.listen(0, "127.0.0.1", r));
  const port = (server.address() as any).port;
  const url = `http://127.0.0.1:${port}`;
  process.env.TRIGGER_API_URL = url;
  process.env.TRIGGER_SECRET_KEY = "tr_dev_wg_fake_secret_key_0000";
  return { url, rec, latencyMs, close: () => new Promise((r) => server.close(() => r())) };
}
