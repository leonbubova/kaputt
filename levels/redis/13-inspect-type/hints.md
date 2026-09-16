## 1
Every key carries exactly one data type (string, hash, list, set, …), chosen by the command that created it. You don't have to guess: Redis will tell you the type of any key.
## 2
TYPE key prints the type name; write that word into `audit:legacy:type` with SET.
## 3
`redis-cli TYPE legacy:blob` → set, then `redis-cli SET audit:legacy:type set`
