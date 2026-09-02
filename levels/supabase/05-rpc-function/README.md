# a function behind /rpc
Ticket: "We want a smoke-test endpoint. Create a SQL function `greet(name text)` that returns `'hello, ' || name`, callable by the frontend (anon key) as `POST /rest/v1/rpc/greet` with body `{"name":"wg"}` → `"hello, wg"`."
Goal: that call returns 200 with `"hello, wg"`.
