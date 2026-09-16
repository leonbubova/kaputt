## 1
`logger` comes from the SDK like `task` does: `import { task, logger } from "@trigger.dev/sdk";`. Then one line inside `run`, before `return`.
## 2
The text is built like the greeting: `` logger.info(`greeting ${payload.name}`); `` — backticks, `${payload.name}` for the name.
## 3
```ts
import { task, logger } from "@trigger.dev/sdk";

export const greet = task({
  id: "greet",
  run: async (payload: { name: string }) => {
    logger.info(`greeting ${payload.name}`);
    return { greeting: `hello, ${payload.name}` };
  },
});
```
in `src/trigger/greet.ts`.
