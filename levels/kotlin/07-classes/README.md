# a class: several values that belong together
Lesson: a product has a name *and* a stock. Instead of two loose boxes, a class bundles them into one thing:
    class Product(val name: String, val stock: Int)
Then `val p = Product("cable", 12)` makes one product, and `p.name` / `p.stock` read its parts. A class is a
blueprint; each `Product(…)` you write is one object built from it. Functions can take objects as parameters.
Your task: `Product` is already in `src/Main.kt`. Write `fun describe(p: Product): String` that returns
`NAME: STOCK in stock` (for the cable: `cable: 12 in stock`), and print `describe(cable)` from `main`.
File: ~/.k8s-wargame/kotlin/app/src/Main.kt — open it in any editor (VS Code: `code ~/.k8s-wargame/kotlin/app`). Run it: `./run.sh` inside that folder (or `~/.k8s-wargame/kotlin/app/run.sh` from anywhere).
Check yourself:  wg check      stuck?  wg hint
