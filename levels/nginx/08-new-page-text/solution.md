Edit the return string in default.conf, then reload so nginx re-reads the file.
    return 200 "new page\n";   then: docker exec wg-nginx nginx -s reload
