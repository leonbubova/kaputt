## 1
413 is nginx rejecting the request body before it reaches the backend. Look for a size limit in the /api/ location.
## 2
`client_max_body_size` caps the request body. It is currently 256k in the /api/ location — far below what the backend allows.
## 3
Raise it, e.g. `client_max_body_size 10m;` in the /api/ location, and reload.
