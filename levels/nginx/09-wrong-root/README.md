# the site is up but every static asset 404s (blank page, no CSS)
nginx answers, but /style.css and the JS bundle come back 404, so the page is unstyled.
The document root was pointed at a directory that does not exist. Fix the root.
