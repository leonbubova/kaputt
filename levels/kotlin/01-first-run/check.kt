object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        val buf = java.io.ByteArrayOutputStream(); val old = System.out
        System.setOut(java.io.PrintStream(buf)); try { main() } finally { System.setOut(old) }
        val out = buf.toString()
        Wg.expect(out.contains("hello, kotlin"), "the program should print hello, kotlin — it printed: ${out.trim()}")
        Wg.done("main() prints hello, kotlin")
    }
}
