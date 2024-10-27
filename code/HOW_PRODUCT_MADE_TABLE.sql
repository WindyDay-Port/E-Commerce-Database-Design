-- Table: public.how_product_made

-- DROP TABLE IF EXISTS public.how_product_made;

CREATE TABLE IF NOT EXISTS public.how_product_made
(
    product_id integer NOT NULL DEFAULT nextval('how_product_made_product_id_seq'::regclass),
    description text COLLATE pg_catalog."default",
    CONSTRAINT how_product_made_pkey PRIMARY KEY (product_id),
    CONSTRAINT how_product_made_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.how_product_made
    OWNER to postgres;