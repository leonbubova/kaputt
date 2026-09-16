Next 15 passes `params` as a Promise; the page still treats it as a plain object.
    # page.tsx: type Props = { params: Promise<{ slug: string }> }; export default async function …; const { slug } = await params;
