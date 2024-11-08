--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Debian 14.5-2.pgdg110+2)
-- Dumped by pg_dump version 14.5 (Debian 14.5-2.pgdg110+2)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: dim_brand; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_brand (
    brand_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.dim_brand OWNER TO thangquang;

--
-- Name: dim_brand_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_brand_brand_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_brand_brand_id_seq OWNER TO thangquang;

--
-- Name: dim_brand_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_brand_brand_id_seq OWNED BY public.dim_brand.brand_id;


--
-- Name: dim_category; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_category (
    category_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.dim_category OWNER TO thangquang;

--
-- Name: dim_category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_category_category_id_seq OWNER TO thangquang;

--
-- Name: dim_category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_category_category_id_seq OWNED BY public.dim_category.category_id;


--
-- Name: dim_city; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_city (
    city_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.dim_city OWNER TO thangquang;

--
-- Name: dim_city_city_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_city_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_city_city_id_seq OWNER TO thangquang;

--
-- Name: dim_city_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_city_city_id_seq OWNED BY public.dim_city.city_id;


--
-- Name: dim_customer; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_customer (
    customer_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.dim_customer OWNER TO thangquang;

--
-- Name: dim_customer_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_customer_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_customer_customer_id_seq OWNER TO thangquang;

--
-- Name: dim_customer_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_customer_customer_id_seq OWNED BY public.dim_customer.customer_id;


--
-- Name: dim_date; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_date (
    date_id integer NOT NULL,
    month_id integer,
    year_id integer,
    date_name date
);


ALTER TABLE public.dim_date OWNER TO thangquang;

--
-- Name: dim_date_date_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_date_date_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_date_date_id_seq OWNER TO thangquang;

--
-- Name: dim_date_date_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_date_date_id_seq OWNED BY public.dim_date.date_id;


--
-- Name: dim_employee; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_employee (
    employee_id integer NOT NULL,
    name character varying(255) NOT NULL,
    dob date,
    identitynumber character varying(20),
    store_id integer
);


ALTER TABLE public.dim_employee OWNER TO thangquang;

--
-- Name: dim_employee_employee_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_employee_employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_employee_employee_id_seq OWNER TO thangquang;

--
-- Name: dim_employee_employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_employee_employee_id_seq OWNED BY public.dim_employee.employee_id;


--
-- Name: dim_month; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_month (
    month_id integer NOT NULL,
    year_id integer,
    quarter_id integer,
    month integer,
    name character varying(50) NOT NULL
);


ALTER TABLE public.dim_month OWNER TO thangquang;

--
-- Name: dim_month_month_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_month_month_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_month_month_id_seq OWNER TO thangquang;

--
-- Name: dim_month_month_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_month_month_id_seq OWNED BY public.dim_month.month_id;


--
-- Name: dim_product; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_product (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    size double precision,
    color character varying(50),
    brand_id integer,
    category_id integer,
    standardprice numeric(15,2),
    price numeric(15,2)
);


ALTER TABLE public.dim_product OWNER TO thangquang;

--
-- Name: dim_product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_product_product_id_seq OWNER TO thangquang;

--
-- Name: dim_product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_product_product_id_seq OWNED BY public.dim_product.product_id;


--
-- Name: dim_quarter; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_quarter (
    quarter_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.dim_quarter OWNER TO thangquang;

--
-- Name: dim_quarter_quarter_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_quarter_quarter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_quarter_quarter_id_seq OWNER TO thangquang;

--
-- Name: dim_quarter_quarter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_quarter_quarter_id_seq OWNED BY public.dim_quarter.quarter_id;


--
-- Name: dim_source_online; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_source_online (
    source_online_id integer NOT NULL,
    link_name character varying(255) NOT NULL
);


ALTER TABLE public.dim_source_online OWNER TO thangquang;

--
-- Name: dim_source_online_source_online_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_source_online_source_online_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_source_online_source_online_id_seq OWNER TO thangquang;

--
-- Name: dim_source_online_source_online_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_source_online_source_online_id_seq OWNED BY public.dim_source_online.source_online_id;


--
-- Name: dim_store; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_store (
    store_id integer NOT NULL,
    name character varying(255),
    city_id integer
);


ALTER TABLE public.dim_store OWNER TO thangquang;

--
-- Name: dim_store_store_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_store_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_store_store_id_seq OWNER TO thangquang;

--
-- Name: dim_store_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_store_store_id_seq OWNED BY public.dim_store.store_id;


--
-- Name: dim_year; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.dim_year (
    year_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.dim_year OWNER TO thangquang;

--
-- Name: dim_year_year_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.dim_year_year_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dim_year_year_id_seq OWNER TO thangquang;

--
-- Name: dim_year_year_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.dim_year_year_id_seq OWNED BY public.dim_year.year_id;


--
-- Name: fact_production; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.fact_production (
    id integer NOT NULL,
    date_id integer NOT NULL,
    store_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer,
    revenue numeric(15,2),
    profit numeric(15,2)
);


ALTER TABLE public.fact_production OWNER TO thangquang;

--
-- Name: fact_production_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.fact_production_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_production_id_seq OWNER TO thangquang;

--
-- Name: fact_production_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.fact_production_id_seq OWNED BY public.fact_production.id;


--
-- Name: fact_sales_order; Type: TABLE; Schema: public; Owner: thangquang
--

CREATE TABLE public.fact_sales_order (
    id integer NOT NULL,
    date_id integer NOT NULL,
    source_online_id integer,
    customer_id integer NOT NULL,
    employee_id integer NOT NULL,
    store_id integer NOT NULL,
    revenue numeric(15,2),
    revenue_online numeric(15,2),
    revenue_offline numeric(15,2),
    standard_cost numeric(15,2),
    profit numeric(15,2),
    number_order integer,
    number_order_online integer,
    number_order_offline integer
);


ALTER TABLE public.fact_sales_order OWNER TO thangquang;

--
-- Name: fact_sales_order_id_seq; Type: SEQUENCE; Schema: public; Owner: thangquang
--

CREATE SEQUENCE public.fact_sales_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fact_sales_order_id_seq OWNER TO thangquang;

--
-- Name: fact_sales_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: thangquang
--

ALTER SEQUENCE public.fact_sales_order_id_seq OWNED BY public.fact_sales_order.id;


--
-- Name: dim_brand brand_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_brand ALTER COLUMN brand_id SET DEFAULT nextval('public.dim_brand_brand_id_seq'::regclass);


--
-- Name: dim_category category_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_category ALTER COLUMN category_id SET DEFAULT nextval('public.dim_category_category_id_seq'::regclass);


--
-- Name: dim_city city_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_city ALTER COLUMN city_id SET DEFAULT nextval('public.dim_city_city_id_seq'::regclass);


--
-- Name: dim_customer customer_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_customer ALTER COLUMN customer_id SET DEFAULT nextval('public.dim_customer_customer_id_seq'::regclass);


--
-- Name: dim_date date_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_date ALTER COLUMN date_id SET DEFAULT nextval('public.dim_date_date_id_seq'::regclass);


--
-- Name: dim_employee employee_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_employee ALTER COLUMN employee_id SET DEFAULT nextval('public.dim_employee_employee_id_seq'::regclass);


--
-- Name: dim_month month_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_month ALTER COLUMN month_id SET DEFAULT nextval('public.dim_month_month_id_seq'::regclass);


--
-- Name: dim_product product_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_product ALTER COLUMN product_id SET DEFAULT nextval('public.dim_product_product_id_seq'::regclass);


--
-- Name: dim_quarter quarter_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_quarter ALTER COLUMN quarter_id SET DEFAULT nextval('public.dim_quarter_quarter_id_seq'::regclass);


--
-- Name: dim_source_online source_online_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_source_online ALTER COLUMN source_online_id SET DEFAULT nextval('public.dim_source_online_source_online_id_seq'::regclass);


--
-- Name: dim_store store_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_store ALTER COLUMN store_id SET DEFAULT nextval('public.dim_store_store_id_seq'::regclass);


--
-- Name: dim_year year_id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_year ALTER COLUMN year_id SET DEFAULT nextval('public.dim_year_year_id_seq'::regclass);


--
-- Name: fact_production id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_production ALTER COLUMN id SET DEFAULT nextval('public.fact_production_id_seq'::regclass);


--
-- Name: fact_sales_order id; Type: DEFAULT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_sales_order ALTER COLUMN id SET DEFAULT nextval('public.fact_sales_order_id_seq'::regclass);


--
-- Data for Name: dim_brand; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_brand (brand_id, name) FROM stdin;
\.


--
-- Data for Name: dim_category; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_category (category_id, name) FROM stdin;
\.


--
-- Data for Name: dim_city; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_city (city_id, name) FROM stdin;
\.


--
-- Data for Name: dim_customer; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_customer (customer_id, name, email) FROM stdin;
\.


--
-- Data for Name: dim_date; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_date (date_id, month_id, year_id, date_name) FROM stdin;
\.


--
-- Data for Name: dim_employee; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_employee (employee_id, name, dob, identitynumber, store_id) FROM stdin;
\.


--
-- Data for Name: dim_month; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_month (month_id, year_id, quarter_id, month, name) FROM stdin;
\.


--
-- Data for Name: dim_product; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_product (product_id, name, description, size, color, brand_id, category_id, standardprice, price) FROM stdin;
\.


--
-- Data for Name: dim_quarter; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_quarter (quarter_id, name) FROM stdin;
\.


--
-- Data for Name: dim_source_online; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_source_online (source_online_id, link_name) FROM stdin;
1000	offline
\.


--
-- Data for Name: dim_store; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_store (store_id, name, city_id) FROM stdin;
\.


--
-- Data for Name: dim_year; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_year (year_id, name) FROM stdin;
\.


--
-- Data for Name: fact_production; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.fact_production (id, date_id, store_id, product_id, quantity, revenue, profit) FROM stdin;
\.


--
-- Data for Name: fact_sales_order; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.fact_sales_order (id, date_id, source_online_id, customer_id, employee_id, store_id, revenue, revenue_online, revenue_offline, standard_cost, profit, number_order, number_order_online, number_order_offline) FROM stdin;
\.


--
-- Name: dim_brand_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_brand_brand_id_seq', 1, false);


--
-- Name: dim_category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_category_category_id_seq', 1, false);


--
-- Name: dim_city_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_city_city_id_seq', 1, false);


--
-- Name: dim_customer_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_customer_customer_id_seq', 1, false);


--
-- Name: dim_date_date_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_date_date_id_seq', 1, false);


--
-- Name: dim_employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_employee_employee_id_seq', 1, false);


--
-- Name: dim_month_month_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_month_month_id_seq', 1, false);


--
-- Name: dim_product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_product_product_id_seq', 1, false);


--
-- Name: dim_quarter_quarter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_quarter_quarter_id_seq', 1, false);


--
-- Name: dim_source_online_source_online_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_source_online_source_online_id_seq', 1, false);


--
-- Name: dim_store_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_store_store_id_seq', 1, false);


--
-- Name: dim_year_year_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_year_year_id_seq', 1, false);


--
-- Name: fact_production_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.fact_production_id_seq', 1, false);


--
-- Name: fact_sales_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.fact_sales_order_id_seq', 1, false);


--
-- Name: dim_brand dim_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_brand
    ADD CONSTRAINT dim_brand_pkey PRIMARY KEY (brand_id);


--
-- Name: dim_category dim_category_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_category
    ADD CONSTRAINT dim_category_pkey PRIMARY KEY (category_id);


--
-- Name: dim_city dim_city_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_city
    ADD CONSTRAINT dim_city_pkey PRIMARY KEY (city_id);


--
-- Name: dim_customer dim_customer_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_customer
    ADD CONSTRAINT dim_customer_pkey PRIMARY KEY (customer_id);


--
-- Name: dim_date dim_date_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_date
    ADD CONSTRAINT dim_date_pkey PRIMARY KEY (date_id);


--
-- Name: dim_employee dim_employee_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_employee
    ADD CONSTRAINT dim_employee_pkey PRIMARY KEY (employee_id);


--
-- Name: dim_month dim_month_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_month
    ADD CONSTRAINT dim_month_pkey PRIMARY KEY (month_id);


--
-- Name: dim_product dim_product_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_product
    ADD CONSTRAINT dim_product_pkey PRIMARY KEY (product_id);


--
-- Name: dim_quarter dim_quarter_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_quarter
    ADD CONSTRAINT dim_quarter_pkey PRIMARY KEY (quarter_id);


--
-- Name: dim_source_online dim_source_online_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_source_online
    ADD CONSTRAINT dim_source_online_pkey PRIMARY KEY (source_online_id);


--
-- Name: dim_store dim_store_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_store
    ADD CONSTRAINT dim_store_pkey PRIMARY KEY (store_id);


--
-- Name: dim_year dim_year_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_year
    ADD CONSTRAINT dim_year_pkey PRIMARY KEY (year_id);


--
-- Name: fact_production fact_production_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_production
    ADD CONSTRAINT fact_production_pkey PRIMARY KEY (id);


--
-- Name: fact_sales_order fact_sales_order_pkey; Type: CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_sales_order
    ADD CONSTRAINT fact_sales_order_pkey PRIMARY KEY (id);


--
-- Name: dim_date date_fk_month; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_date
    ADD CONSTRAINT date_fk_month FOREIGN KEY (month_id) REFERENCES public.dim_month(month_id);


--
-- Name: dim_date date_fk_year; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_date
    ADD CONSTRAINT date_fk_year FOREIGN KEY (year_id) REFERENCES public.dim_year(year_id);


--
-- Name: dim_employee employee_fk_store; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_employee
    ADD CONSTRAINT employee_fk_store FOREIGN KEY (store_id) REFERENCES public.dim_store(store_id);


--
-- Name: dim_month month_fk_quater; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_month
    ADD CONSTRAINT month_fk_quater FOREIGN KEY (quarter_id) REFERENCES public.dim_quarter(quarter_id);


--
-- Name: dim_month month_fk_year; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_month
    ADD CONSTRAINT month_fk_year FOREIGN KEY (year_id) REFERENCES public.dim_year(year_id);


--
-- Name: dim_product product_fk_brand; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_product
    ADD CONSTRAINT product_fk_brand FOREIGN KEY (brand_id) REFERENCES public.dim_brand(brand_id);


--
-- Name: dim_product product_fk_category; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_product
    ADD CONSTRAINT product_fk_category FOREIGN KEY (category_id) REFERENCES public.dim_category(category_id);


--
-- Name: fact_production production_fk_date; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_production
    ADD CONSTRAINT production_fk_date FOREIGN KEY (date_id) REFERENCES public.dim_date(date_id);


--
-- Name: fact_production production_fk_product; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_production
    ADD CONSTRAINT production_fk_product FOREIGN KEY (product_id) REFERENCES public.dim_product(product_id);


--
-- Name: fact_production production_fk_store; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_production
    ADD CONSTRAINT production_fk_store FOREIGN KEY (store_id) REFERENCES public.dim_store(store_id);


--
-- Name: fact_sales_order sales_fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_sales_order
    ADD CONSTRAINT sales_fk_customer FOREIGN KEY (customer_id) REFERENCES public.dim_customer(customer_id);


--
-- Name: fact_sales_order sales_fk_date; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_sales_order
    ADD CONSTRAINT sales_fk_date FOREIGN KEY (date_id) REFERENCES public.dim_date(date_id);


--
-- Name: fact_sales_order sales_fk_employee; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_sales_order
    ADD CONSTRAINT sales_fk_employee FOREIGN KEY (employee_id) REFERENCES public.dim_employee(employee_id);


--
-- Name: fact_sales_order sales_fk_source; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_sales_order
    ADD CONSTRAINT sales_fk_source FOREIGN KEY (source_online_id) REFERENCES public.dim_source_online(source_online_id);


--
-- Name: fact_sales_order sales_fk_store; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.fact_sales_order
    ADD CONSTRAINT sales_fk_store FOREIGN KEY (store_id) REFERENCES public.dim_store(store_id);


--
-- Name: dim_store store_fk_city; Type: FK CONSTRAINT; Schema: public; Owner: thangquang
--

ALTER TABLE ONLY public.dim_store
    ADD CONSTRAINT store_fk_city FOREIGN KEY (city_id) REFERENCES public.dim_city(city_id);


--
-- PostgreSQL database dump complete
--

