CREATE SCHEMA IF NOT EXISTS reviewsSchema;

DROP TABLE IF EXISTS review;
DROP TABLE IF EXISTS characteristics;
DROP TABLE IF EXISTS characteristic_reviews;
DROP TABLE IF EXISTS photos;


CREATE TABLE IF NOT EXISTS public.review
(
    id integer NOT NULL DEFAULT nextval('review_id_seq'::regclass),
    product_id integer,
    rating bigint,
    date bigint,
    summary text COLLATE pg_catalog."default",
    body text COLLATE pg_catalog."default",
    recommend boolean,
    reported boolean,
    reviewer_name text COLLATE pg_catalog."default",
    reviewer_email text COLLATE pg_catalog."default",
    response text COLLATE pg_catalog."default",
    helpfulness integer,
    CONSTRAINT review_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.review
    OWNER to devin;
-- Index: product_id

-- DROP INDEX public.product_id;

CREATE INDEX product_id
    ON public.review USING hash
    (product_id)
    TABLESPACE pg_default;



CREATE TABLE IF NOT EXISTS public.characteristics
(
    id integer NOT NULL DEFAULT nextval('characteristics_id_seq'::regclass),
    product_id integer,
    name text COLLATE pg_catalog."default",
    CONSTRAINT characteristics_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.characteristics
    OWNER to devin;
-- Index: characteristics_id

-- DROP INDEX public.characteristics_id;

CREATE INDEX characteristics_id
    ON public.characteristics USING hash
    (id)
    TABLESPACE pg_default;


CREATE TABLE IF NOT EXISTS public.characteristic_reviews
(
    id integer NOT NULL DEFAULT nextval('characteristic_reviews_id_seq'::regclass),
    characteristic_id integer,
    review_id integer,
    value integer,
    CONSTRAINT characteristic_reviews_pkey PRIMARY KEY (id),
    CONSTRAINT characteristic_reviews_characteristic_id_fkey FOREIGN KEY (characteristic_id)
        REFERENCES public.characteristics (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE public.characteristic_reviews
    OWNER to devin;


CREATE TABLE IF NOT EXISTS public.photos
(
    id integer NOT NULL DEFAULT nextval('photos_id_seq'::regclass),
    review_id integer,
    url text COLLATE pg_catalog."default",
    CONSTRAINT photos_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE public.photos
    OWNER to devin;

-- INSERT INTO `Product` (`id`) VALUES
-- ('');
-- INSERT INTO `Meta Data` (`id`,`product_id`,`ratings`,`total recommended`,`avg characteristics`) VALUES
-- ('','','','','');
-- INSERT INTO `Review` (`id`,`summary`,`body`,`rating`,`date`,`helpful`,`photos`,`response`,`recommend`,`reviewer_id`,`product_id`) VALUES
-- ('','','','','','','','','','','');
-- INSERT INTO `Reviewer (Post Review)` (`id`,`name`,`email`) VALUES
-- ('','','');
-- INSERT INTO `Characteristics` (`id`,`review_id`,`size`,`width`,`comfort`,`quality`,`length`,`fit`) VALUES
-- ('','','','','','','','');