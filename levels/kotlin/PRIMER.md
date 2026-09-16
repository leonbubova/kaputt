# kotlin — the commands & constructs you'll actually use
App: ~/.k8s-wargame/kotlin/app (`wg shell`). Kotlin 2.1 on JVM 17, plain kotlinc, no Gradle. Reset every level.
Never programmed before? Skip this list — levels 1–8 teach it one piece at a time. It comes back any time with `wg help`.

  ./run.sh                                compile src/ + run main() — the FIRST "error:" line is the answer
  source ../env.sh; kotlinc src -cp "$WG_KT_CP" -d build/app.jar     manual compile
  data class Product(val sku: String, val stock: Int)    == compares fields, copy(stock = 3), toString for free — a plain class has none of that
  val p: Product? = find(sku)             nullable type: p?.name · p ?: default · p!! throws NPE when null (avoid)
  "${p.name} costs ${p.priceCents}"       template: `$p.name` is `$p` + ".name" — braces around anything with a dot
  sealed class R { data class Ok(..) : R(); data class Empty(..) : R() }    when (r) { is Ok -> … } is exhaustive: no else needed, a new subclass fails to compile until handled
  fun Int.toEuro(): String = …            extension function · fun f(a: Int, pct: Int = 10) default arg · f(a, pct = 5) named arg
  list.filter { }.sortedBy { }.groupBy { }.sumOf { }.firstOrNull()     first() / getValue() / !! throw; the …OrNull variants don't
  val snap = items.toList()               a List is a read-only VIEW, not a copy — .toList() copies
  x.let { it.trim() }  vs  x.apply { }    let returns the lambda's result; apply / also return x itself
  lateinit var log: MutableList<String>   read before assignment → UninitializedPropertyAccessException
  suspend fun f() { delay(100) }          only callable from a coroutine; runBlocking { } at the edge
  coroutineScope { skus.map { async { fetch(it) } }.awaitAll() }    start all, THEN await — async { }.await() inside map runs one by one
  one child throws → the scope cancels every sibling and rethrows; runCatching per item keeps the rest
  7 / 2 == 3                              Int / Int is integer division — multiply before you divide

Mental model: the compiler is your first test. Nullability, exhaustiveness and immutability are checked at compile time, so most bugs here are a runtime escape hatch: `!!`, `else ->`, integer division, a template without braces, a discarded `copy()`. Read the ticket, reproduce with `./run.sh`, then open the file the symptom names.
