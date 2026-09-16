`describe()` lost the `Backordered` branch; the `else -> "error"` hides the gap from the compiler.
    src/Report.kt → add `is OrderResult.Backordered -> …`, remove `else`
