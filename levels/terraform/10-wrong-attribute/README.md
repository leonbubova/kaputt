# plan errors: Unsupported attribute .name
"`out/name.txt` should hold the generated pet name, but plan fails: `Unsupported attribute: This object has no argument, nested block, or exported attribute named "name"`. Fix the reference; don't change what the file is supposed to contain."
Goal: apply succeeds; `out/name.txt` equals output `pet` (the generated name).
