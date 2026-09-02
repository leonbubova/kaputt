# the homepage cache is broken two ways: wrong type and no expiry
`cache:home` should be a string holding the rendered page that expires so it stays fresh.
Right now it's the wrong data type, and even once fixed it must carry a TTL (1..600 s).
Store the value `<html>home</html>` as a string at `cache:home` with a TTL in that range.
