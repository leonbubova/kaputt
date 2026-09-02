`actions.ts` lost its `"use server"` directive; without it `addToCart` is an ordinary function and cannot cross the server→client boundary.
    printf '"use server";\n\n' | cat - src/app/cart/actions.ts > /tmp/a && mv /tmp/a src/app/cart/actions.ts
