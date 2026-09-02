# cart page: "Functions cannot be passed directly to Client Components"
"`/cart` is a 500 after the add-to-cart action was moved into its own file `actions.ts`. The page passes the action to a client form component — that worked before."
App: `~/.k8s-wargame/nextjs/app`. Goal: `/cart` renders 200 and the form is wired to a Server Action (a `$ACTION_ID` appears in the HTML). Keep `AddForm` a Client Component and `actions.ts` the home of the action.
