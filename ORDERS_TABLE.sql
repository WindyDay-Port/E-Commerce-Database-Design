-- Table: public.orders

-- DROP TABLE IF EXISTS public.orders;

CREATE TABLE IF NOT EXISTS public.orders
(
    order_id integer NOT NULL DEFAULT nextval('orders_order_id_seq'::regclass),
    customer_id integer NOT NULL,
    order_date timestamp without time zone NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    CONSTRAINT orders_pkey PRIMARY KEY (order_id),
    CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES public.customers (customer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.orders
    OWNER to postgres;
-- Index: idx_orders_customer_id

-- DROP INDEX IF EXISTS public.idx_orders_customer_id;

CREATE INDEX IF NOT EXISTS idx_orders_customer_id
    ON public.orders USING btree
    (customer_id ASC NULLS LAST)
    TABLESPACE pg_default;