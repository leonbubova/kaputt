## 1
A `when` over a sealed class is exhaustive: the compiler refuses to compile if a subtype is missing — *unless* there is an `else` branch, which silently swallows every case not listed. Open `describe(result)` in `src/Report.kt` and count the branches against `OrderResult` in `Models.kt`.
## 2
`Backordered` has no branch, so it falls into `else -> "error"`. Add the branch — and delete the `else`, so the next new subtype is a compile error instead of a runtime "error".
## 3
```
// src/Report.kt → describe(result)
is OrderResult.Backordered -> "${result.sku} backordered, eta ${result.eta}"
// and remove:  else -> "error"
```
