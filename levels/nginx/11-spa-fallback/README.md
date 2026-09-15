# deep links 404: /dashboard works from the menu but not on a page reload
The SPA serves index.html for unknown paths so the client router can take over.
After a config edit, reloading a deep link like /dashboard now returns 404.
Restore the fallback to index.html.
