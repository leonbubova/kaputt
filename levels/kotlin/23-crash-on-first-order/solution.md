`lateinit var log` is never assigned since the `init` block was removed; first access throws.
    src/Inventory.kt → val log: MutableList<String> = mutableListOf()
