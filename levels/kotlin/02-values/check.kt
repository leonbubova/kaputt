object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val buf = java.io.ByteArrayOutputStream(); val old = System.out
        System.setOut(java.io.PrintStream(buf)); try { main() } finally { System.setOut(old) }
        val out = buf.toString()
        Wg.expect(out.contains("Ada is 36"), "should print Ada is 36 — printed: ${out.trim()}")
        val src = java.io.File(System.getProperty("wg.app"), "src/Main.kt").takeIf { it.exists() }?.readText() ?: ""
        Wg.expect(src.contains("\$age") && src.contains("\$name"), "use the boxes: the printed line must contain \$name and \$age")
        Wg.done("val boxes and $ in strings")
    }
}
