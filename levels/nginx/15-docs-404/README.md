# broken links under /docs/ show the shop app instead of a 404
The docs team publishes static HTML under /docs/ (there is a /docs/index.html and /docs/setup.html).
Their link checker never finds dead links: a missing page like /docs/nope renders the app with 200.
Pages under /docs/ must keep working; anything missing there must return 404.
