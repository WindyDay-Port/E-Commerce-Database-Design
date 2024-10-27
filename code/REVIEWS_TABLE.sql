-- Table: public.reviews

-- DROP TABLE IF EXISTS public.reviews;

CREATE TABLE IF NOT EXISTS public.reviews
(
    review_id integer NOT NULL DEFAULT nextval('reviews_review_id_seq'::regclass),
    customer_id integer NOT NULL,
    product_id integer NOT NULL,
    comment text COLLATE pg_catalog."default",
    review_date timestamp with time zone NOT NULL,
    rating integer,
    CONSTRAINT reviews_pkey PRIMARY KEY (review_id),
    CONSTRAINT reviews_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES public.customers (customer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT reviews_product_id_fkey FOREIGN KEY (product_id)
        REFERENCES public.products (product_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT reviews_rating_check CHECK (rating >= 1 AND rating <= 5)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.reviews
    OWNER to postgres;
-- Index: idx_reviews_customer_id

-- DROP INDEX IF EXISTS public.idx_reviews_customer_id;

CREATE INDEX IF NOT EXISTS idx_reviews_customer_id
    ON public.reviews USING btree
    (customer_id ASC NULLS LAST)
    TABLESPACE pg_default;
-- Index: idx_reviews_product_id

-- DROP INDEX IF EXISTS public.idx_reviews_product_id;

CREATE INDEX IF NOT EXISTS idx_reviews_product_id
    ON public.reviews USING btree
    (product_id ASC NULLS LAST)
    TABLESPACE pg_default;