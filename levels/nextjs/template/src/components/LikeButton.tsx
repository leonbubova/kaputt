"use client";

import { useState } from "react";

export function LikeButton() {
  const [likes, setLikes] = useState(0);
  return (
    <button data-testid="like-button" onClick={() => setLikes((n) => n + 1)}>
      likes: {likes}
    </button>
  );
}
