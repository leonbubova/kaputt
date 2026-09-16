## 1
Compression is negotiated per request: the client announces `Accept-Encoding: gzip`, and nginx compresses only if the config tells it to — nothing is gzipped by default. Request app.js with `-H 'Accept-Encoding: gzip'` and look for a Content-Encoding header. It is absent.
## 2
gzip must be on AND the asset's MIME type must be in gzip_types (application/javascript for JS).
## 3
Add `gzip on;` and `gzip_types application/javascript text/css;` to the server, then reload.
