-- Table: public.product_types

-- DROP TABLE IF EXISTS public.product_types;

CREATE TABLE IF NOT EXISTS public.product_types
(
    type_id integer NOT NULL DEFAULT nextval('product_types_type_id_seq'::regclass),
    subcategory_id integer NOT NULL,
    type_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT product_types_pkey PRIMARY KEY (type_id),
    CONSTRAINT product_types_subcategory_id_fkey FOREIGN KEY (subcategory_id)
        REFERENCES public.subcategories (subcategory_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.product_types
    OWNER to postgres;