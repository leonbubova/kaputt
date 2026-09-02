# the catalog cache misses — the data is under the wrong key name
A deploy wrote the product catalog to `catalog:v1`, but the app reads it from `catalog`.
The value is correct; the key name is wrong. Make the data available under `catalog`.
