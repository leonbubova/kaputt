Drop the file into the document root (host side of the bind mount); nginx serves it as-is.
    printf 'User-agent: *\nDisallow: /api/\n' > ~/.k8s-wargame/nginx/app/html/robots.txt
