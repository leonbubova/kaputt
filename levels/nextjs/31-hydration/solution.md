`new Date()` is evaluated on the server and again in the browser; the texts differ → hydration mismatch. Compute it in `useEffect` so the server renders a stable placeholder.
    # Clock.tsx: useState(null) + useEffect(() => setNow(new Date().toLocaleTimeString("de-DE")), []); render now ?? "…"
