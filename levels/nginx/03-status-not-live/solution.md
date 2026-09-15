The /status block is missing a semicolon, so the reload was refused and the old config kept running.
    return 200 "up\n";   then: nginx -t, nginx -s reload
