# add a like button to the product page
"Product detail pages (`/products/<slug>`) need a `<button data-testid="like-button">likes: N</button>` that counts up on click. The page itself stays a Server Component (it reads from disk); put the button in `src/components/LikeButton.tsx`."
App: `~/.k8s-wargame/nextjs/app`. Goal: `/products/regenwurm` renders 200 with the button showing `likes: 0`; the button is a Client Component, the page is not.
