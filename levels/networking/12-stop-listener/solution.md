A netcat listener holds 9090; kill it.
    ss -ltnp   →  pkill -f 'nc -lk'
