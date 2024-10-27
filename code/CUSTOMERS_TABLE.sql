-- Table: public.customers

-- DROP TABLE IF EXISTS public.customers;

CREATE TABLE IF NOT EXISTS public.customers
(
    customer_id integer NOT NULL DEFAULT nextval('customers_customer_id_seq'::regclass),
    cust_first_name character varying(255) COLLATE pg_catalog."default",
    cust_last_name character varying(255) COLLATE pg_catalog."default",
    cust_email character varying(255) COLLATE pg_catalog."default",
    cust_address text COLLATE pg_catalog."default",
    cust_user_name character varying(255) COLLATE pg_catalog."default",
    cust_birth_day date,
    cust_phone_number character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT customers_pkey PRIMARY KEY (customer_id),
    CONSTRAINT customers_cust_email_key UNIQUE (cust_email),
    CONSTRAINT customers_cust_user_name_key UNIQUE (cust_user_name)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.customers
    OWNER to postgres;
-- Index: idx_customers_customer_id

-- DROP INDEX IF EXISTS public.idx_customers_customer_id;

CREATE INDEX IF NOT EXISTS idx_customers_customer_id
    ON public.customers USING btree
    (customer_id ASC NULLS LAST)
    TABLESPACE pg_default;