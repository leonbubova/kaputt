## 1
Redis is a table of key → value. `SET key value` writes a row, `GET key` reads it. The key here is `greeting`, the value is `hello`.
## 2
Open the client with `wg shell`, then type `SET greeting hello` and press Enter. Redis answers OK. Check with `GET greeting`.
## 3
    wg shell
    SET greeting hello
    exit
