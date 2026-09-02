`redirect()` throws `NEXT_REDIRECT`; the surrounding `try/catch` catches it and renders the fallback instead.
    # go/page.tsx: let target = "/products"; try { …compute target… } catch {…}; redirect(target);   // redirect outside try
