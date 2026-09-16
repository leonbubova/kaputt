# the new view 404s
"Data team created a `top_articles` view (published articles by views). `GET /rest/v1/top_articles` with the anon key → `404 Could not find the table 'public.top_articles'`. The view definitely exists, we can query it in psql." Goal: `GET /rest/v1/top_articles` (default profile, no extra headers) returns the 3 published articles.
