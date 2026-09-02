## 1
Two independent properties of a key: its data type (fixed at creation, only changeable by deleting and recreating) and its TTL (absent unless set). Both are wrong here — `TYPE cache:home` is a list (should be string), and it has no TTL.
## 2
Delete the wrong-typed key, then SET the string with an EX expiry in one command.
## 3
`redis-cli DEL cache:home; redis-cli SET cache:home '<html>home</html>' EX 300`
