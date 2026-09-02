## 1
`INCR page:views` returns "value is not an integer or out of range".
## 2
The string stored there isn't a number. Overwrite it with an integer.
## 3
`redis-cli SET page:views 1000`
