Missing index on the filter column; the table grew until the seq scan hurt.
    create index orders_customer_id_idx on orders (customer_id);
