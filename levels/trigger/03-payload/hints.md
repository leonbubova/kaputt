## 1
The empty brackets `async () =>` mean "takes no input". Put the payload there with its type: `async (payload: { name: string }) =>`.
## 2
Build the text with a template string: backticks, and `${payload.name}` where the name goes: `` `hello, ${payload.name}` ``. Plain quotes would print the letters `${payload.name}` literally.
## 3
```ts
export const greet = task({
  id: "greet",
  run: async (payload: { name: string }) => {
    return { greeting: `hello, ${payload.name}` };
  },
});
```
in `src/trigger/greet.ts`.
