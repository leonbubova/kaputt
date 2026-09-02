`Counter.tsx` uses `useState` but lost its `"use client"` directive, so it is compiled as a Server Component.
    printf '"use client";\n\n' | cat - src/components/Counter.tsx > /tmp/c && mv /tmp/c src/components/Counter.tsx
