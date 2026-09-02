## 1
Hydration = React renders your components a second time in the browser and compares the result to the server's HTML; the two must be identical, so anything that differs from render to render (the current time, say) breaks it. Check: `curl -s localhost:3100/ | grep -o 'Rendered at[^<]*'` twice — different every time, and the browser renders a third value.
## 2
Anything non-deterministic (`Date`, `Math.random`, `window`, locale) must not be rendered during SSR. Render a placeholder on the server and fill in the real value after mount.
## 3
`src/components/Clock.tsx`: `const [now, setNow] = useState<string|null>(null); useEffect(() => setNow(new Date().toLocaleTimeString()), []);` and render `now ?? "…"`.
