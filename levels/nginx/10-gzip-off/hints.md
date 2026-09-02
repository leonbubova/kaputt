## 1
Request app.js with `-H 'Accept-Encoding: gzip'` and look for a Content-Encoding header. It is absent.
## 2
gzip must be on AND the asset's MIME type must be in gzip_types (application/javascript for JS).
## 3
Add `gzip on;` and `gzip_types application/javascript text/css;` to the server, then reload.
