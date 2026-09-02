# nginx — the commands you'll actually use
Config lives on your machine: ~/.k8s-wargame/nginx/app/conf.d/default.conf (mounted into the wg-nginx container). Edit there, then reload.

  docker exec wg-nginx nginx -t                       is the config valid? the error names the line
  docker exec wg-nginx nginx -s reload                apply your edit (container still running)
  docker logs wg-nginx  /  docker start wg-nginx      container dead? the log says which directive killed it; then start it
  curl -H 'Host: shop.local' http://127.0.0.1:8082/   hit the shop vhost (https: curl -k … :8443); -I for headers only
  location /api/ { … }  /  location = /health { … }   prefix match / exact match
  return 200 "ok\n";  /  return 301 /new;             fixed answer / redirect
  proxy_pass http://wg-backend:9000/;                 hand off to the upstream (trailing slash strips the location prefix)
  proxy_set_header Host $host;                        keep the original Host for the upstream
  try_files $uri $uri/ /index.html;                   file → dir → SPA fallback (ending in =404 kills deep links)
  root /usr/share/nginx/html;                         where static files come from
  client_max_body_size 10m;  add_header X 'y';  gzip on;    upload cap (413) / response header / compression

Mental model: a request picks a `server` (by Host), then the best-matching `location`, then does ONE thing: serve a file, `return`, or `proxy_pass`. 502 = the upstream didn't answer (port?). Static 404 = `root` or `try_files`. Connection refused = nginx died on a bad config → `docker logs wg-nginx`.
