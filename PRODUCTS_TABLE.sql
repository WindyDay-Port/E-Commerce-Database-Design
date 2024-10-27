-- Table: public.products

-- DROP TABLE IF EXISTS public.products;

CREATE TABLE IF NOT EXISTS public.products
(
    product_id integer NOT NULL DEFAULT nextval('products_product_id_seq'::regclass),
    type_id integer NOT NULL,
    product_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    size character varying(50) COLLATE pg_catalog."default",
    price numeric(10,2) NOT NULL,
    product_description text COLLATE pg_catalog."default",
    image_url character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT products_pkey PRIMARY KEY (product_id),
    CONSTRAINT products_type_id_fkey FOREIGN KEY (type_id)
        REFERENCES public.product_types (type_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.products
    OWNER to postgres;
-- Index: idx_products_product_id

-- DROP INDEX IF EXISTS public.idx_products_product_id;

CREATE INDEX IF NOT EXISTS idx_products_product_id
    ON public.products USING btree
    (product_id ASC NULLS LAST)
    TABLESPACE pg_default;