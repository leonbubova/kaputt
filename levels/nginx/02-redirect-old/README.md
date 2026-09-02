# /old should 301 to /new, but it serves the homepage instead
Marketing moved a page. Requests to http://shop.local/old must return a 301
redirect with Location: /new. Right now /old just renders the app.
Add the redirect on the shop.local server.
