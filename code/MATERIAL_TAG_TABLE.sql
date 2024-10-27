-- Table: public.material_tag

-- DROP TABLE IF EXISTS public.material_tag;

CREATE TABLE IF NOT EXISTS public.material_tag
(
    product_id integer NOT NULL DEFAULT nextval('material_tag_product_id_seq'::regclass),
    tag_name character varying(150) COLLATE pg_catalog."default",
    CONSTRAINT material_tag_pkey PRIMARY KEY (product_id),
    CONSTRAINT material_tag_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.material_tag
    OWNER to postgres;
-- Index: idx_product_material_product_id

-- DROP INDEX IF EXISTS public.idx_product_material_product_id;

CREATE INDEX IF NOT EXISTS idx_product_material_product_id
    ON public.material_tag USING btree
    (product_id ASC NULLS LAST)
    TABLESPACE pg_default;