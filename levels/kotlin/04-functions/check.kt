object WgCheck {
    @JvmStatic fun main(args: Array<String>) {
        Wg.expectEq(greet("Ada"), "hello, Ada", "greet(\"Ada\")")
        Wg.expectEq(greet("Grace"), "hello, Grace", "greet(\"Grace\")")

        val buf = java.io.ByteArrayOutputStream(); val old = System.out
        System.setOut(java.io.PrintStream(buf)); try { main() } finally { System.setOut(old) }
        val out = buf.toString()
        Wg.expect(out.contains("hello, Ada") && out.contains("hello, Linus"), "main should print both greetings — printed: ${out.trim()}")
        Wg.done("greet() returns a string")
    }
}
