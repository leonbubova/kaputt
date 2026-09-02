# campaign send takes 10 minutes and hits 429
"Marketing sends to ~500 users; `notifyAll` takes many minutes and the API starts answering `429 rate limit exceeded` halfway through." Goal: `notifyAll(500 users)` finishes in under 5 s, creates exactly one `notify-user` run per user, and does not call the single-run trigger endpoint at all.
