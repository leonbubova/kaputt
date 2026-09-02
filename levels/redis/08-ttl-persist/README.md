# sessions never expire — memory keeps growing
The key `session:live` was written without an expiry, so it persists forever and the
session store leaks memory. Give it a TTL (1..3600 seconds) without changing its value.
