-- Table: public.product_variations

-- DROP TABLE IF EXISTS public.product_variations;

CREATE TABLE IF NOT EXISTS public.product_variations
(
    variation_id integer NOT NULL DEFAULT nextval('product_variations_variation_id_seq'::regclass),
    product_id integer NOT NULL,
    style_code character varying(50) COLLATE pg_catalog."default",
    color_description character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT product_variations_pkey PRIMARY KEY (variation_id),
    CONSTRAINT product_variations_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product_variations
    OWNER to postgres;
-- Index: idx_product_variations_product_id

-- DROP INDEX IF EXISTS public.idx_product_variations_product_id;

CREATE INDEX IF NOT EXISTS idx_product_variations_product_id
    ON public.product_variations USING btree
    (product_id ASC NULLS LAST)
    TABLESPACE pg_default;