## 1
A list keeps order. The front (left) is where the oldest item sits; the back (right) is where new ones go. One item leaves the front, one enters the back.
## 2
`LPOP inbox` removes mail1 and shows it. `RPUSH inbox mail4` appends. Then `LRANGE inbox 0 -1` should list mail2 mail3 mail4.
## 3
    wg shell
    LPOP inbox
    RPUSH inbox mail4
