export default function About() {
  const support = process.env.SUPPORT_EMAIL;
  return (
    <section>
      <h1>About</h1>
      <p>Wurm Shop, seit 2026.</p>
      <p>
        Support: <a data-testid="support" href={`mailto:${support}`}>{support}</a>
      </p>
    </section>
  );
}
