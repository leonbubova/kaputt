# plain HTTP isn't redirected to HTTPS
Requests to http://shop.local/ are served over cleartext instead of being pushed to HTTPS.
Make port 80 issue a 301 redirect to the https:// URL.
