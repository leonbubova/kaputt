## 1
`find` walks a tree and filters by name: `find /var -name license.key`.
## 2
`-name` matches the whole filename exactly, so `license.key.bak` is not returned. Hidden directories (`.keys`) are searched too.
## 3
`find /var -name license.key > /answer`
