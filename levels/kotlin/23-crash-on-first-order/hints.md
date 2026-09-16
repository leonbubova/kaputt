## 1
`lateinit var` tells the compiler "trust me, I assign this before anyone reads it" — and the runtime throws `UninitializedPropertyAccessException` the moment that trust is broken. The stack trace names the property; the question is where it was supposed to be assigned.
## 2
Look at how `log` is declared in `src/Inventory.kt`. Nothing assigns it any more. An `init { }` block runs at construction — or drop `lateinit` and initialise it right there.
## 3
```
// src/Inventory.kt
val log: MutableList<String> = mutableListOf()      // or keep lateinit + init { log = mutableListOf() }
```
