# one file per region, from one block
"We need `out/eu.txt` containing `Europe` and `out/us.txt` containing `United States`. Regions will grow, so use `for_each` over a map of region → name — one resource block, not one per region."
Goal: after apply, both files exist with the right content, from a single `for_each` resource.
