## 1
`curl -s localhost:3100/ | grep -o 'Rendered at[^<]*'` twice. Different every time — and the browser renders a third value. React compares server HTML with the first client render; they must be identical.
## 2
Anything non-deterministic (`Date`, `Math.random`, `window`, locale) must not be rendered during SSR. Render a placeholder on the server and fill in the real value after mount.
## 3
`src/components/Clock.tsx`: `const [now, setNow] = useState<string|null>(null); useEffect(() => setNow(new Date().toLocaleTimeString()), []);` and render `now ?? "…"`.
