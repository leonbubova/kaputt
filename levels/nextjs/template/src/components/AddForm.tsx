"use client";

import { useState } from "react";

type Props = { action: (formData: FormData) => Promise<void> };

export function AddForm({ action }: Props) {
  const [slug, setSlug] = useState("regenwurm");
  return (
    <form action={action}>
      <input name="slug" value={slug} onChange={(e) => setSlug(e.target.value)} />
      <button type="submit">add</button>
    </form>
  );
}
