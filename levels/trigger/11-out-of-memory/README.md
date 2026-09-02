# image runs crash with exit code 137
"`resize-images` runs die after ~20 s: `OutOfMemoryError: process exited with code 137 (OOM)`. Logs show it's decoding a 50 MP photo. The machine shows as `small-1x`." Goal: `resize-images` runs on a machine with at least 2 GB RAM; cheap tasks like `send-welcome-email` stay on the small default.
