## 1
`GET catalog` is nil, but `GET catalog:v1` has the data.
## 2
RENAME moves a value from one key to another without copying it by hand.
## 3
`redis-cli RENAME catalog:v1 catalog`
