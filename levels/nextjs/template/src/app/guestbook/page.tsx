import { getEntries } from "@/lib/guestbook";
import { signGuestbook } from "./actions";

export default function Guestbook() {
  const entries = getEntries();
  return (
    <section>
      <h1>Guestbook</h1>
      <form action={signGuestbook}>
        <input name="name" placeholder="your name" />
        <button type="submit">sign</button>
      </form>
      <ul data-testid="guestbook">
        {entries.map((e, i) => (
          <li key={i}>{e}</li>
        ))}
      </ul>
    </section>
  );
}
