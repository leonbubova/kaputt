No unique constraint on email, so the form inserted duplicates. Dedupe, then constrain.
    delete from subscribers a using subscribers b where a.email = b.email and a.id > b.id;
    alter table subscribers add unique (email);
