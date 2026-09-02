# a redirect is a location that returns 301 and a new path
Lesson: a redirect is not a file and not a rewrite — it is an answer. nginx sends status 301 (moved permanently) or 302 (moved temporarily) plus a `Location:` header, and the browser makes a second request to that new URL. Nothing is served from the old path at all.
In nginx that is one line inside a location: `return 301 /new;`. The second argument is the target; with a redirect code nginx puts it into the `Location:` header instead of the body. Relative targets like `/new` keep the current scheme and host; a full URL moves the client elsewhere.
Because a request still picks only one location, an old path with no block of its own falls into `location /` and renders whatever the catch-all serves. The redirect only exists if the block exists.
    return 301 /new;                                    permanent redirect to /new
    return 302 /new;                                    temporary redirect
    curl -I -H 'Host: shop.local' http://127.0.0.1:8082/old    headers only: status + Location
    curl -L ...                                         follow the redirect like a browser
Try it first: `curl -I -H 'Host: shop.local' http://127.0.0.1:8082/old` — note the status and whether a `Location:` line is present.
Your task: marketing moved a page. Requests to http://shop.local/old must return a 301 redirect with Location: /new. Right now /old just renders the app. Add the redirect on the shop.local server.
Check yourself:  wg check      stuck?  wg hint
