Change the return text in the /health block, then reload so nginx re-reads the file.
    return 200 "alive\n";   then: docker exec wg-nginx nginx -s reload
