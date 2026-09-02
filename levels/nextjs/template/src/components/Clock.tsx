"use client";

import { useEffect, useState } from "react";

// shows the current time; only known in the browser, so render it after mount
export function Clock() {
  const [now, setNow] = useState<string | null>(null);
  useEffect(() => {
    setNow(new Date().toLocaleTimeString("de-DE"));
  }, []);
  return <p data-testid="clock">Rendered at {now ?? "…"}</p>;
}
