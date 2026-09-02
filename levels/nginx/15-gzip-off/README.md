# frontend bundle ships uncompressed; front-end team wants gzip back
app.js and the CSS are being sent uncompressed over the wire.
Responses for text assets should carry `Content-Encoding: gzip` when the client accepts it.
Turn compression back on for the shop.local server.
