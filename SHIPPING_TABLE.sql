-- Table: public.shipping

-- DROP TABLE IF EXISTS public.shipping;

CREATE TABLE IF NOT EXISTS public.shipping
(
    shipping_id integer NOT NULL DEFAULT nextval('shipping_shipping_id_seq'::regclass),
    order_id integer NOT NULL,
    shipping_date timestamp with time zone NOT NULL,
    delivery_date timestamp without time zone NOT NULL,
    CONSTRAINT shipping_pkey PRIMARY KEY (shipping_id),
    CONSTRAINT shipping_order_id_fkey FOREIGN KEY (order_id)
        REFERENCES public.orders (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.shipping
    OWNER to postgres;