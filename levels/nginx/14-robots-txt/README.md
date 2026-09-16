# SEO wants a robots.txt on shop.local
Crawlers keep hammering the API. http://shop.local/robots.txt must exist and contain
`User-agent: *` and `Disallow: /api/`. Right now that URL renders the app.
Serve it as a plain static file like the CSS and JS — do not add a location for it.
