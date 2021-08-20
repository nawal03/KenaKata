CREATE TABLE public.users
(
    user_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username character varying COLLATE pg_catalog."default" NOT NULL UNIQUE,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    authority character varying COLLATE pg_catalog."default" NOT NULL,
    enabled boolean,
    verification character varying COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (user_id)
);
CREATE TABLE public.customers
(
	username character varying COLLATE pg_catalog."default" NOT NULL,
	password character varying COLLATE pg_catalog."default" NOT NULL,
    fname character varying COLLATE pg_catalog."default" NOT NULL,
    lname character varying COLLATE pg_catalog."default" NOT NULL,
    email character varying COLLATE pg_catalog."default" NOT NULL,
    phone character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT customers_pkey PRIMARY KEY (username)
);
CREATE TABLE public.shops
(
    shopname character varying COLLATE pg_catalog."default" NOT null,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    shop_logo character varying COLLATE pg_catalog."default" NOT NULL ,
    delivery_area character varying COLLATE pg_catalog."default" NOT null,
    category character varying COLLATE pg_catalog."default" NOT NULL ,
    contact_number character varying COLLATE pg_catalog."default" NOT NULL,
    shop_email character varying COLLATE pg_catalog."default" NOT NULL,
    about character varying COLLATE pg_catalog."default" NOT NULL,
	CONSTRAINT shop_pkey PRIMARY KEY (shopname)
);
CREATE TABLE public.products
(
    pid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying COLLATE pg_catalog."default" NOT NULL,
    category character varying COLLATE pg_catalog."default" NOT NULL,
    color character varying COLLATE pg_catalog."default" NOT NULL,
    size character varying COLLATE pg_catalog."default" NOT NULL,
   	image1 character varying COLLATE pg_catalog."default" NOT NULL,
    image2 character varying COLLATE pg_catalog."default" NOT NULL,
    image3 character varying COLLATE pg_catalog."default" NOT NULL,
    price double precision NOT NULL,
    description text COLLATE pg_catalog."default",
    shopname character varying COLLATE pg_catalog."default" NOT NULL,
    stock boolean,
    CONSTRAINT products_pkey PRIMARY KEY (pid),
    CONSTRAINT products_price_check CHECK (price > 0.0::double precision)
);
CREATE TABLE public.carts
(
    cid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username character varying COLLATE pg_catalog."default" NOT NULL,
    pid integer NOT NULL,
    size character varying COLLATE pg_catalog."default" NOT NULL,
    quantity integer,
    pname character varying COLLATE pg_catalog."default" NOT NULL,
    shopname character varying COLLATE pg_catalog."default" NOT NULL,
    price double precision NOT NULL,
    CONSTRAINT carts_pkey PRIMARY KEY (cid),
    CONSTRAINT carts_quantity_check CHECK (quantity > 0)
);
CREATE TABLE public.orders
(
    oid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username character varying COLLATE pg_catalog."default" NOT NULL,
    shopname character varying COLLATE pg_catalog."default" NOT NULL,
    address character varying COLLATE pg_catalog."default" NOT NULL,
    status character varying COLLATE pg_catalog."default" NOT NULL,
    details character varying COLLATE pg_catalog."default" NOT NULL,
    totalprice double precision,
    review character varying COLLATE pg_catalog."default",
    "time" timestamp without time zone,
    pnum integer not null,
    CONSTRAINT orders_pkey PRIMARY KEY (oid)
);
CREATE TABLE public.complains
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    username character varying COLLATE pg_catalog."default" NOT NULL,
    message character varying COLLATE pg_catalog."default" NOT NULL,
    reply character varying COLLATE pg_catalog."default",
    "time" timestamp without time zone,
    CONSTRAINT complains_pkey PRIMARY KEY (id)
);
