## 1
In a string template `$name` takes exactly one identifier. `"$p.name"` is `$p` followed by the literal text `.name` — so the whole `Product(...)` toString is printed, then ".name". Run `./run.sh` and read the first rows.
## 2
Anything more than a bare name needs braces: `"${p.name}"`, `"${p.priceCents.toEuro()}"`. Look at `stockReport` in `src/Report.kt`.
## 3
```
// src/Report.kt → stockReport
"${p.sku}  ${p.name.padEnd(10)} ${p.priceCents.toEuro()}  stock=${p.stock}"
```
