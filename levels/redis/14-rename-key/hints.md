## 1
A key name is just a label on the value — Redis can move a value to a new name atomically, no need to read it out and write it back. `GET catalog` is nil, but `GET catalog:v1` has the data.
## 2
RENAME moves a value from one key to another without copying it by hand.
## 3
`redis-cli RENAME catalog:v1 catalog`
