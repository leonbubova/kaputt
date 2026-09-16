# the API answers "hello" — clients expect "api ok"
The health checker compares the response body and fails on anything but "api ok".
Change the reply in the API vhost (/etc/nginx/sites-enabled/api.conf) to "api ok" and make nginx pick it up.
