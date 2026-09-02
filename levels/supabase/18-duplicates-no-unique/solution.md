No unique constraint on `email`; duplicates already present block adding one.
    delete from public.subscribers a using public.subscribers b where a.email = b.email and a.id > b.id;
    alter table public.subscribers add constraint subscribers_email_key unique (email);
