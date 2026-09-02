type Props = { params: Promise<{ slug: string }> };

// Next 15: params is a Promise — await it
export default async function Post({ params }: Props) {
  const { slug } = await params;
  return (
    <article>
      <h1 data-testid="post-slug">{slug}</h1>
      <p>Post content for {slug}.</p>
    </article>
  );
}
