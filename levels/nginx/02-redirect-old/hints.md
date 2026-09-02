## 1
Compare /old with /new in conf.d/default.conf. /new still has its location; /old lost its redirect.
## 2
A permanent redirect is `return 301 <target>;` inside an exact-match location.
## 3
Add `location = /old { return 301 /new; }` then reload nginx.
