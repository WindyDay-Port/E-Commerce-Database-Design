-- Table: public.subcategories

-- DROP TABLE IF EXISTS public.subcategories;

CREATE TABLE IF NOT EXISTS public.subcategories
(
    subcategory_id integer NOT NULL DEFAULT nextval('subcategories_subcategory_id_seq'::regclass),
    main_category_id integer NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT subcategories_pkey PRIMARY KEY (subcategory_id),
    CONSTRAINT subcategories_main_category_id_fkey FOREIGN KEY (main_category_id)
        REFERENCES public.main_categories (main_category_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.subcategories
    OWNER to postgres;
-- Index: fki_Main_Category_ID

-- DROP INDEX IF EXISTS public."fki_Main_Category_ID";

CREATE INDEX IF NOT EXISTS "fki_Main_Category_ID"
    ON public.subcategories USING btree
    (main_category_id ASC NULLS LAST)
    TABLESPACE pg_default;