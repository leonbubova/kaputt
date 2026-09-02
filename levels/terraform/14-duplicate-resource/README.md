# init fails: Duplicate resource "local_file" configuration
"Two file resources, and terraform won't even init: `Duplicate resource ... A local_file resource named "app" was already declared`. Both files are wanted (`out/a.txt` and `out/b.txt`). Fix the clash."
Goal: apply succeeds; both `out/a.txt` and `out/b.txt` exist.
