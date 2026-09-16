# after a deploy: checkout throws 502 AND deep links 404
Two things broke in the same change. The API returns 502 Bad Gateway,
and reloading a deep link such as /dashboard returns 404.
Both faults live in the shop.local config. Fix both.
