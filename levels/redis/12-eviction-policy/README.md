# the cache returns OOM errors under load instead of evicting
This instance is a cache, but its maxmemory-policy is `noeviction`, so once memory fills it
rejects writes. Set the policy to `allkeys-lru` so old keys are evicted instead.
