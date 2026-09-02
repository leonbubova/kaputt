# interactivity lives in a "use client" file that a server page renders
Lesson: in the App Router every component is a Server Component by default. It runs on the server and ships no JavaScript to the browser. The price: it cannot hold state, run effects, or handle clicks — there is no browser there.
Anything interactive goes into its own file whose first line is `"use client";`. That directive marks a boundary: this file and what it imports are bundled for the browser. The server page then imports and renders `<LikeButton />` like any other tag, passing plain props.
So push the boundary as low as possible: the page stays on the server with its data access; only the small button that needs `useState` becomes client.
    "use client";                     first line of any file using useState / useEffect / onClick
    src/components/<Name>.tsx         where this app keeps shared components
    const [n, set] = useState(0);     from "react"; state that survives re-renders
    curl -s localhost:3100/products/regenwurm | grep -o 'likes[^<]*'   the server-rendered initial state
Try it first: `cat src/components/Counter.tsx src/app/dashboard/page.tsx` — a client widget and the server page that renders it.
Your task: product detail pages (`/products/<slug>`) need a `<button data-testid="like-button">likes: N</button>` that counts up on click. The page itself stays a Server Component (it reads from disk); put the button in `src/components/LikeButton.tsx`. App: `~/.k8s-wargame/nextjs/app`.
Goal: `/products/regenwurm` renders 200 with the button showing `likes: 0`; the button is a Client Component, the page is not.
Check yourself:  wg check      stuck?  wg hint
