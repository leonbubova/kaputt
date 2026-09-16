object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val buf = java.io.ByteArrayOutputStream(); val old = System.out
        System.setOut(java.io.PrintStream(buf)); try { main() } finally { System.setOut(old) }
        val out = buf.toString()
        Wg.expect(out.contains("19 euro 99 cent"), "should print 19 euro 99 cent — printed: ${out.trim()}")
        val src = java.io.File(System.getProperty("wg.app"), "src/Main.kt").takeIf { it.exists() }?.readText() ?: ""
        Wg.expect(src.contains("price / 100") && src.contains("price % 100"), "compute it from price with / and %, do not type the digits")
        Wg.done("integer division and remainder")
    }
}
