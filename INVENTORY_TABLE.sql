-- Table: public.inventory

-- DROP TABLE IF EXISTS public.inventory;

CREATE TABLE IF NOT EXISTS public.inventory
(
    inventory_id integer NOT NULL DEFAULT nextval('inventory_inventory_id_seq'::regclass),
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    CONSTRAINT inventory_pkey PRIMARY KEY (inventory_id),
    CONSTRAINT inventory_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.inventory
    OWNER to postgres;
-- Index: idx_inventory_product_id

-- DROP INDEX IF EXISTS public.idx_inventory_product_id;

CREATE INDEX IF NOT EXISTS idx_inventory_product_id
    ON public.inventory USING btree
    (product_id ASC NULLS LAST)
    TABLESPACE pg_default;