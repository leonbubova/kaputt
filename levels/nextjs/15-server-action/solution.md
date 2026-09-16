`lib/guestbook.ts` (array + push), `guestbook/actions.ts` (`"use server"`, push + `revalidatePath("/guestbook")`), `guestbook/page.tsx` (`<form action={sign}>` + `<ul data-testid="guestbook">`).
