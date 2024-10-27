-- Table: public.order_details

-- DROP TABLE IF EXISTS public.order_details;

CREATE TABLE IF NOT EXISTS public.order_details
(
    order_detail_id integer NOT NULL DEFAULT nextval('order_details_order_detail_id_seq'::regclass),
    order_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    CONSTRAINT order_details_pkey PRIMARY KEY (order_detail_id),
    CONSTRAINT order_details_order_id_fkey FOREIGN KEY (order_id)
        REFERENCES public.orders (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT order_details_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.order_details
    OWNER to postgres;
-- Index: idx_order_details_product_id

-- DROP INDEX IF EXISTS public.idx_order_details_product_id;

CREATE INDEX IF NOT EXISTS idx_order_details_product_id
    ON public.order_details USING btree
    (product_id ASC NULLS LAST)
    TABLESPACE pg_default;