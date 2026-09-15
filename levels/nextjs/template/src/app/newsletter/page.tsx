import { subscribe } from "./actions";

export default function Newsletter() {
  return (
    <section>
      <h1>Newsletter</h1>
      <form action={subscribe}>
        <input name="email" type="email" placeholder="you@example.com" />
        <button type="submit">subscribe</button>
      </form>
    </section>
  );
}
