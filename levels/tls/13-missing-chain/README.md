# clients can't build a trust chain — the intermediate is missing
Only the leaf certificate is being served, without the intermediate CA, so clients that trust the
root still can't verify the chain. Serve the full chain (leaf + intermediate).
