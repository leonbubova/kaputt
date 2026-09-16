## 1
A function lives outside `main`, at the top level of the file: `fun greet(name: String): String { … }`. Inside, `name` is whatever the caller passed.
## 2
`return "hello, $name"` builds the text and hands it back. Then in main: `println(greet("Ada"))`.
## 3
```
fun greet(name: String): String {
    return "hello, $name"
}
fun main() {
    println(greet("Ada"))
    println(greet("Linus"))
}
```
