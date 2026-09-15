# /go shows "Something went wrong" instead of redirecting
"`/go` is our short link to the first product. It used to redirect; after error handling was added it renders 'Something went wrong' and the server log shows `Error: NEXT_REDIRECT` — every single time, even though nothing is wrong."
App: `~/.k8s-wargame/nextjs/app`. Goal: `GET /go` answers with a redirect to `/products/regenwurm`. Keep error handling for the data lookup.
