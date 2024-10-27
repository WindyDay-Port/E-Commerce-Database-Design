-- Table: public.main_categories

-- DROP TABLE IF EXISTS public.main_categories;

CREATE TABLE IF NOT EXISTS public.main_categories
(
    main_category_id integer NOT NULL DEFAULT nextval('main_categories_main_category_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT main_categories_pkey PRIMARY KEY (main_category_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.main_categories
    OWNER to postgres;