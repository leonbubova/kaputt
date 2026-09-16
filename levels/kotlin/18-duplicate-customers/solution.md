`Customer` lost its `data` modifier, so equality fell back to object identity and `distinct()` sees every instance as new.
    src/Models.kt → data class Customer(…)
