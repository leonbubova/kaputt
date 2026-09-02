The return directive says "hello"; nginx must re-read the file.
    return 200 "api ok\n";   then: nginx -s reload
