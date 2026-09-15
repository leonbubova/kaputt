`OOMKilled: true` — 32 MB limit, the job writes 48 MB into tmpfs (memory).
    docker update --memory=128m --memory-swap=128m wg-report && docker start wg-report
