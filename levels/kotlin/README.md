# kotlin track
App: ~/.k8s-wargame/kotlin/app  (plain Kotlin 2.1 on the JVM: kotlinc + java, no Gradle — reset on every level)
  ./run.sh              # compile src/ and run main() — the demo flow that shows the symptom
  source ../env.sh && kotlinc src -cp "$WG_KT_CP" -d build/app.jar    # what run.sh does
`wg check` compiles your src/ together with a hidden check and runs it. Compile errors count as "not yet".
Files: src/Models.kt · Money.kt · Inventory.kt · Report.kt · Prices.kt · Main.kt
