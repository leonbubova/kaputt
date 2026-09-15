source ../../../lib/common.sh; source ../lib.sh
mkdir -p "$APP/html/docs"
printf '<h1>shop docs</h1>\n' > "$APP/html/docs/index.html"
printf '<h1>setup guide</h1>\n' > "$APP/html/docs/setup.html"
del_block 'location /docs/'
ngx_reload
