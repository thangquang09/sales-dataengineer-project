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
-- Name: view_fact_production; Type: MATERIALIZED VIEW; Schema: public; Owner: thangquang
--

CREATE MATERIALIZED VIEW public.view_fact_production AS
 SELECT p.name AS product_name,
    b.name AS brand,
    cate.name AS category,
    fp.revenue,
    fp.quantity,
    fp.profit,
    m.month,
    y.name AS year
   FROM ((((((public.fact_production fp
     JOIN public.dim_date dd ON ((dd.date_id = fp.date_id)))
     JOIN public.dim_month m ON ((m.month_id = dd.month_id)))
     JOIN public.dim_year y ON ((y.year_id = dd.year_id)))
     JOIN public.dim_product p ON ((p.product_id = fp.product_id)))
     JOIN public.dim_brand b ON ((b.brand_id = p.brand_id)))
     JOIN public.dim_category cate ON ((cate.category_id = p.category_id)))
  WITH NO DATA;


ALTER TABLE public.view_fact_production OWNER TO thangquang;

--
-- Name: view_fact_sale_orders; Type: MATERIALIZED VIEW; Schema: public; Owner: thangquang
--

CREATE MATERIALIZED VIEW public.view_fact_sale_orders AS
 SELECT e.name AS employee_name,
    st.name AS store_name,
    city.name AS city_name,
    src.link_name,
    m.month,
    y.name AS year,
    f.revenue,
    f.revenue_online,
    f.revenue_offline,
    f.profit,
    f.number_order,
    f.number_order_online,
    f.number_order_offline
   FROM (((((((public.fact_sales_order f
     JOIN public.dim_store st ON ((st.store_id = f.store_id)))
     JOIN public.dim_city city ON ((st.city_id = city.city_id)))
     JOIN public.dim_employee e ON ((e.employee_id = f.employee_id)))
     JOIN public.dim_date dd ON ((dd.date_id = f.date_id)))
     JOIN public.dim_month m ON ((m.month_id = dd.month_id)))
     JOIN public.dim_year y ON ((y.year_id = dd.year_id)))
     JOIN public.dim_source_online src ON ((src.source_online_id = f.source_online_id)))
  WITH NO DATA;


ALTER TABLE public.view_fact_sale_orders OWNER TO thangquang;

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
1	brand 1
2	brand 2
3	brand 3
4	brand 4
5	brand 5
6	brand 6
7	brand 7
8	brand 8
9	brand 9
10	brand 10
11	brand 11
12	brand 12
13	brand 13
14	brand 14
15	brand 15
16	brand 16
17	brand 17
18	brand 18
19	brand 19
20	brand 20
\.


--
-- Data for Name: dim_category; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_category (category_id, name) FROM stdin;
1	category 1
2	category 2
3	category 3
4	category 4
5	category 5
6	category 6
7	category 7
8	category 8
9	category 9
10	category 10
11	category 11
12	category 12
13	category 13
14	category 14
15	category 15
16	category 16
17	category 17
18	category 18
19	category 19
20	category 20
21	category 21
22	category 22
23	category 23
24	category 24
25	category 25
26	category 26
27	category 27
28	category 28
29	category 29
30	category 30
\.


--
-- Data for Name: dim_city; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_city (city_id, name) FROM stdin;
1	Ha Noi
2	Ho Chi Minh
3	Hai Phong
4	Can Tho
5	Da Nang
6	Bien Hoa
7	Hai Duong
8	Hue
9	Thuan An
10	Thu Duc
\.


--
-- Data for Name: dim_customer; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_customer (customer_id, name, email) FROM stdin;
1	customer 1	customer1@example.com
2	customer 2	customer2@example.com
3	customer 3	customer3@example.com
4	customer 4	customer4@example.com
5	customer 5	customer5@example.com
6	customer 6	customer6@example.com
7	customer 7	customer7@example.com
8	customer 8	customer8@example.com
9	customer 9	customer9@example.com
10	customer 10	customer10@example.com
11	customer 11	customer11@example.com
12	customer 12	customer12@example.com
13	customer 13	customer13@example.com
14	customer 14	customer14@example.com
15	customer 15	customer15@example.com
16	customer 16	customer16@example.com
17	customer 17	customer17@example.com
18	customer 18	customer18@example.com
19	customer 19	customer19@example.com
20	customer 20	customer20@example.com
21	customer 21	customer21@example.com
22	customer 22	customer22@example.com
23	customer 23	customer23@example.com
24	customer 24	customer24@example.com
25	customer 25	customer25@example.com
26	customer 26	customer26@example.com
27	customer 27	customer27@example.com
28	customer 28	customer28@example.com
29	customer 29	customer29@example.com
30	customer 30	customer30@example.com
31	customer 31	customer31@example.com
32	customer 32	customer32@example.com
33	customer 33	customer33@example.com
34	customer 34	customer34@example.com
35	customer 35	customer35@example.com
36	customer 36	customer36@example.com
37	customer 37	customer37@example.com
38	customer 38	customer38@example.com
39	customer 39	customer39@example.com
40	customer 40	customer40@example.com
41	customer 41	customer41@example.com
42	customer 42	customer42@example.com
43	customer 43	customer43@example.com
44	customer 44	customer44@example.com
45	customer 45	customer45@example.com
46	customer 46	customer46@example.com
47	customer 47	customer47@example.com
48	customer 48	customer48@example.com
49	customer 49	customer49@example.com
50	customer 50	customer50@example.com
51	customer 51	customer51@example.com
52	customer 52	customer52@example.com
53	customer 53	customer53@example.com
54	customer 54	customer54@example.com
55	customer 55	customer55@example.com
56	customer 56	customer56@example.com
57	customer 57	customer57@example.com
58	customer 58	customer58@example.com
59	customer 59	customer59@example.com
60	customer 60	customer60@example.com
61	customer 61	customer61@example.com
62	customer 62	customer62@example.com
63	customer 63	customer63@example.com
64	customer 64	customer64@example.com
65	customer 65	customer65@example.com
66	customer 66	customer66@example.com
67	customer 67	customer67@example.com
68	customer 68	customer68@example.com
69	customer 69	customer69@example.com
70	customer 70	customer70@example.com
71	customer 71	customer71@example.com
72	customer 72	customer72@example.com
73	customer 73	customer73@example.com
74	customer 74	customer74@example.com
75	customer 75	customer75@example.com
76	customer 76	customer76@example.com
77	customer 77	customer77@example.com
78	customer 78	customer78@example.com
79	customer 79	customer79@example.com
80	customer 80	customer80@example.com
81	customer 81	customer81@example.com
82	customer 82	customer82@example.com
83	customer 83	customer83@example.com
84	customer 84	customer84@example.com
85	customer 85	customer85@example.com
86	customer 86	customer86@example.com
87	customer 87	customer87@example.com
88	customer 88	customer88@example.com
89	customer 89	customer89@example.com
90	customer 90	customer90@example.com
91	customer 91	customer91@example.com
92	customer 92	customer92@example.com
93	customer 93	customer93@example.com
94	customer 94	customer94@example.com
95	customer 95	customer95@example.com
96	customer 96	customer96@example.com
97	customer 97	customer97@example.com
98	customer 98	customer98@example.com
99	customer 99	customer99@example.com
100	customer 100	customer100@example.com
101	customer 101	customer101@example.com
102	customer 102	customer102@example.com
103	customer 103	customer103@example.com
104	customer 104	customer104@example.com
105	customer 105	customer105@example.com
106	customer 106	customer106@example.com
107	customer 107	customer107@example.com
108	customer 108	customer108@example.com
109	customer 109	customer109@example.com
110	customer 110	customer110@example.com
111	customer 111	customer111@example.com
112	customer 112	customer112@example.com
113	customer 113	customer113@example.com
114	customer 114	customer114@example.com
115	customer 115	customer115@example.com
116	customer 116	customer116@example.com
117	customer 117	customer117@example.com
118	customer 118	customer118@example.com
119	customer 119	customer119@example.com
120	customer 120	customer120@example.com
121	customer 121	customer121@example.com
122	customer 122	customer122@example.com
123	customer 123	customer123@example.com
124	customer 124	customer124@example.com
125	customer 125	customer125@example.com
126	customer 126	customer126@example.com
127	customer 127	customer127@example.com
128	customer 128	customer128@example.com
129	customer 129	customer129@example.com
130	customer 130	customer130@example.com
131	customer 131	customer131@example.com
132	customer 132	customer132@example.com
133	customer 133	customer133@example.com
134	customer 134	customer134@example.com
135	customer 135	customer135@example.com
136	customer 136	customer136@example.com
137	customer 137	customer137@example.com
138	customer 138	customer138@example.com
139	customer 139	customer139@example.com
140	customer 140	customer140@example.com
141	customer 141	customer141@example.com
142	customer 142	customer142@example.com
143	customer 143	customer143@example.com
144	customer 144	customer144@example.com
145	customer 145	customer145@example.com
146	customer 146	customer146@example.com
147	customer 147	customer147@example.com
148	customer 148	customer148@example.com
149	customer 149	customer149@example.com
150	customer 150	customer150@example.com
151	customer 151	customer151@example.com
152	customer 152	customer152@example.com
153	customer 153	customer153@example.com
154	customer 154	customer154@example.com
155	customer 155	customer155@example.com
156	customer 156	customer156@example.com
157	customer 157	customer157@example.com
158	customer 158	customer158@example.com
159	customer 159	customer159@example.com
160	customer 160	customer160@example.com
161	customer 161	customer161@example.com
162	customer 162	customer162@example.com
163	customer 163	customer163@example.com
164	customer 164	customer164@example.com
165	customer 165	customer165@example.com
166	customer 166	customer166@example.com
167	customer 167	customer167@example.com
168	customer 168	customer168@example.com
169	customer 169	customer169@example.com
170	customer 170	customer170@example.com
171	customer 171	customer171@example.com
172	customer 172	customer172@example.com
173	customer 173	customer173@example.com
174	customer 174	customer174@example.com
175	customer 175	customer175@example.com
176	customer 176	customer176@example.com
177	customer 177	customer177@example.com
178	customer 178	customer178@example.com
179	customer 179	customer179@example.com
180	customer 180	customer180@example.com
181	customer 181	customer181@example.com
182	customer 182	customer182@example.com
183	customer 183	customer183@example.com
184	customer 184	customer184@example.com
185	customer 185	customer185@example.com
186	customer 186	customer186@example.com
187	customer 187	customer187@example.com
188	customer 188	customer188@example.com
189	customer 189	customer189@example.com
190	customer 190	customer190@example.com
191	customer 191	customer191@example.com
192	customer 192	customer192@example.com
193	customer 193	customer193@example.com
194	customer 194	customer194@example.com
195	customer 195	customer195@example.com
196	customer 196	customer196@example.com
197	customer 197	customer197@example.com
198	customer 198	customer198@example.com
199	customer 199	customer199@example.com
200	customer 200	customer200@example.com
201	customer 201	customer201@example.com
202	customer 202	customer202@example.com
203	customer 203	customer203@example.com
204	customer 204	customer204@example.com
205	customer 205	customer205@example.com
206	customer 206	customer206@example.com
207	customer 207	customer207@example.com
208	customer 208	customer208@example.com
209	customer 209	customer209@example.com
210	customer 210	customer210@example.com
211	customer 211	customer211@example.com
212	customer 212	customer212@example.com
213	customer 213	customer213@example.com
214	customer 214	customer214@example.com
215	customer 215	customer215@example.com
216	customer 216	customer216@example.com
217	customer 217	customer217@example.com
218	customer 218	customer218@example.com
219	customer 219	customer219@example.com
220	customer 220	customer220@example.com
221	customer 221	customer221@example.com
222	customer 222	customer222@example.com
223	customer 223	customer223@example.com
224	customer 224	customer224@example.com
225	customer 225	customer225@example.com
226	customer 226	customer226@example.com
227	customer 227	customer227@example.com
228	customer 228	customer228@example.com
229	customer 229	customer229@example.com
230	customer 230	customer230@example.com
231	customer 231	customer231@example.com
232	customer 232	customer232@example.com
233	customer 233	customer233@example.com
234	customer 234	customer234@example.com
235	customer 235	customer235@example.com
236	customer 236	customer236@example.com
237	customer 237	customer237@example.com
238	customer 238	customer238@example.com
239	customer 239	customer239@example.com
240	customer 240	customer240@example.com
241	customer 241	customer241@example.com
242	customer 242	customer242@example.com
243	customer 243	customer243@example.com
244	customer 244	customer244@example.com
245	customer 245	customer245@example.com
246	customer 246	customer246@example.com
247	customer 247	customer247@example.com
248	customer 248	customer248@example.com
249	customer 249	customer249@example.com
250	customer 250	customer250@example.com
251	customer 251	customer251@example.com
252	customer 252	customer252@example.com
253	customer 253	customer253@example.com
254	customer 254	customer254@example.com
255	customer 255	customer255@example.com
256	customer 256	customer256@example.com
257	customer 257	customer257@example.com
258	customer 258	customer258@example.com
259	customer 259	customer259@example.com
260	customer 260	customer260@example.com
261	customer 261	customer261@example.com
262	customer 262	customer262@example.com
263	customer 263	customer263@example.com
264	customer 264	customer264@example.com
265	customer 265	customer265@example.com
266	customer 266	customer266@example.com
267	customer 267	customer267@example.com
268	customer 268	customer268@example.com
269	customer 269	customer269@example.com
270	customer 270	customer270@example.com
271	customer 271	customer271@example.com
272	customer 272	customer272@example.com
273	customer 273	customer273@example.com
274	customer 274	customer274@example.com
275	customer 275	customer275@example.com
276	customer 276	customer276@example.com
277	customer 277	customer277@example.com
278	customer 278	customer278@example.com
279	customer 279	customer279@example.com
280	customer 280	customer280@example.com
281	customer 281	customer281@example.com
282	customer 282	customer282@example.com
283	customer 283	customer283@example.com
284	customer 284	customer284@example.com
285	customer 285	customer285@example.com
286	customer 286	customer286@example.com
287	customer 287	customer287@example.com
288	customer 288	customer288@example.com
289	customer 289	customer289@example.com
290	customer 290	customer290@example.com
291	customer 291	customer291@example.com
292	customer 292	customer292@example.com
293	customer 293	customer293@example.com
294	customer 294	customer294@example.com
295	customer 295	customer295@example.com
296	customer 296	customer296@example.com
297	customer 297	customer297@example.com
298	customer 298	customer298@example.com
299	customer 299	customer299@example.com
300	customer 300	customer300@example.com
301	customer 301	customer301@example.com
302	customer 302	customer302@example.com
303	customer 303	customer303@example.com
304	customer 304	customer304@example.com
305	customer 305	customer305@example.com
306	customer 306	customer306@example.com
307	customer 307	customer307@example.com
308	customer 308	customer308@example.com
309	customer 309	customer309@example.com
310	customer 310	customer310@example.com
311	customer 311	customer311@example.com
312	customer 312	customer312@example.com
313	customer 313	customer313@example.com
314	customer 314	customer314@example.com
315	customer 315	customer315@example.com
316	customer 316	customer316@example.com
317	customer 317	customer317@example.com
318	customer 318	customer318@example.com
319	customer 319	customer319@example.com
320	customer 320	customer320@example.com
321	customer 321	customer321@example.com
322	customer 322	customer322@example.com
323	customer 323	customer323@example.com
324	customer 324	customer324@example.com
325	customer 325	customer325@example.com
326	customer 326	customer326@example.com
327	customer 327	customer327@example.com
328	customer 328	customer328@example.com
329	customer 329	customer329@example.com
330	customer 330	customer330@example.com
331	customer 331	customer331@example.com
332	customer 332	customer332@example.com
333	customer 333	customer333@example.com
334	customer 334	customer334@example.com
335	customer 335	customer335@example.com
336	customer 336	customer336@example.com
337	customer 337	customer337@example.com
338	customer 338	customer338@example.com
339	customer 339	customer339@example.com
340	customer 340	customer340@example.com
341	customer 341	customer341@example.com
342	customer 342	customer342@example.com
343	customer 343	customer343@example.com
344	customer 344	customer344@example.com
345	customer 345	customer345@example.com
346	customer 346	customer346@example.com
347	customer 347	customer347@example.com
348	customer 348	customer348@example.com
349	customer 349	customer349@example.com
350	customer 350	customer350@example.com
351	customer 351	customer351@example.com
352	customer 352	customer352@example.com
353	customer 353	customer353@example.com
354	customer 354	customer354@example.com
355	customer 355	customer355@example.com
356	customer 356	customer356@example.com
357	customer 357	customer357@example.com
358	customer 358	customer358@example.com
359	customer 359	customer359@example.com
360	customer 360	customer360@example.com
361	customer 361	customer361@example.com
362	customer 362	customer362@example.com
363	customer 363	customer363@example.com
364	customer 364	customer364@example.com
365	customer 365	customer365@example.com
366	customer 366	customer366@example.com
367	customer 367	customer367@example.com
368	customer 368	customer368@example.com
369	customer 369	customer369@example.com
370	customer 370	customer370@example.com
371	customer 371	customer371@example.com
372	customer 372	customer372@example.com
373	customer 373	customer373@example.com
374	customer 374	customer374@example.com
375	customer 375	customer375@example.com
376	customer 376	customer376@example.com
377	customer 377	customer377@example.com
378	customer 378	customer378@example.com
379	customer 379	customer379@example.com
380	customer 380	customer380@example.com
381	customer 381	customer381@example.com
382	customer 382	customer382@example.com
383	customer 383	customer383@example.com
384	customer 384	customer384@example.com
385	customer 385	customer385@example.com
386	customer 386	customer386@example.com
387	customer 387	customer387@example.com
388	customer 388	customer388@example.com
389	customer 389	customer389@example.com
390	customer 390	customer390@example.com
391	customer 391	customer391@example.com
392	customer 392	customer392@example.com
393	customer 393	customer393@example.com
394	customer 394	customer394@example.com
395	customer 395	customer395@example.com
396	customer 396	customer396@example.com
397	customer 397	customer397@example.com
398	customer 398	customer398@example.com
399	customer 399	customer399@example.com
400	customer 400	customer400@example.com
401	customer 401	customer401@example.com
402	customer 402	customer402@example.com
403	customer 403	customer403@example.com
404	customer 404	customer404@example.com
405	customer 405	customer405@example.com
406	customer 406	customer406@example.com
407	customer 407	customer407@example.com
408	customer 408	customer408@example.com
409	customer 409	customer409@example.com
410	customer 410	customer410@example.com
411	customer 411	customer411@example.com
412	customer 412	customer412@example.com
413	customer 413	customer413@example.com
414	customer 414	customer414@example.com
415	customer 415	customer415@example.com
416	customer 416	customer416@example.com
417	customer 417	customer417@example.com
418	customer 418	customer418@example.com
419	customer 419	customer419@example.com
420	customer 420	customer420@example.com
421	customer 421	customer421@example.com
422	customer 422	customer422@example.com
423	customer 423	customer423@example.com
424	customer 424	customer424@example.com
425	customer 425	customer425@example.com
426	customer 426	customer426@example.com
427	customer 427	customer427@example.com
428	customer 428	customer428@example.com
429	customer 429	customer429@example.com
430	customer 430	customer430@example.com
431	customer 431	customer431@example.com
432	customer 432	customer432@example.com
433	customer 433	customer433@example.com
434	customer 434	customer434@example.com
435	customer 435	customer435@example.com
436	customer 436	customer436@example.com
437	customer 437	customer437@example.com
438	customer 438	customer438@example.com
439	customer 439	customer439@example.com
440	customer 440	customer440@example.com
441	customer 441	customer441@example.com
442	customer 442	customer442@example.com
443	customer 443	customer443@example.com
444	customer 444	customer444@example.com
445	customer 445	customer445@example.com
446	customer 446	customer446@example.com
447	customer 447	customer447@example.com
448	customer 448	customer448@example.com
449	customer 449	customer449@example.com
450	customer 450	customer450@example.com
451	customer 451	customer451@example.com
452	customer 452	customer452@example.com
453	customer 453	customer453@example.com
454	customer 454	customer454@example.com
455	customer 455	customer455@example.com
456	customer 456	customer456@example.com
457	customer 457	customer457@example.com
458	customer 458	customer458@example.com
459	customer 459	customer459@example.com
460	customer 460	customer460@example.com
461	customer 461	customer461@example.com
462	customer 462	customer462@example.com
463	customer 463	customer463@example.com
464	customer 464	customer464@example.com
465	customer 465	customer465@example.com
466	customer 466	customer466@example.com
467	customer 467	customer467@example.com
468	customer 468	customer468@example.com
469	customer 469	customer469@example.com
470	customer 470	customer470@example.com
471	customer 471	customer471@example.com
472	customer 472	customer472@example.com
473	customer 473	customer473@example.com
474	customer 474	customer474@example.com
475	customer 475	customer475@example.com
476	customer 476	customer476@example.com
477	customer 477	customer477@example.com
478	customer 478	customer478@example.com
479	customer 479	customer479@example.com
480	customer 480	customer480@example.com
481	customer 481	customer481@example.com
482	customer 482	customer482@example.com
483	customer 483	customer483@example.com
484	customer 484	customer484@example.com
485	customer 485	customer485@example.com
486	customer 486	customer486@example.com
487	customer 487	customer487@example.com
488	customer 488	customer488@example.com
489	customer 489	customer489@example.com
490	customer 490	customer490@example.com
491	customer 491	customer491@example.com
492	customer 492	customer492@example.com
493	customer 493	customer493@example.com
494	customer 494	customer494@example.com
495	customer 495	customer495@example.com
496	customer 496	customer496@example.com
497	customer 497	customer497@example.com
498	customer 498	customer498@example.com
499	customer 499	customer499@example.com
500	customer 500	customer500@example.com
501	customer 501	customer501@example.com
502	customer 502	customer502@example.com
503	customer 503	customer503@example.com
504	customer 504	customer504@example.com
505	customer 505	customer505@example.com
506	customer 506	customer506@example.com
507	customer 507	customer507@example.com
508	customer 508	customer508@example.com
509	customer 509	customer509@example.com
510	customer 510	customer510@example.com
511	customer 511	customer511@example.com
512	customer 512	customer512@example.com
513	customer 513	customer513@example.com
514	customer 514	customer514@example.com
515	customer 515	customer515@example.com
516	customer 516	customer516@example.com
517	customer 517	customer517@example.com
518	customer 518	customer518@example.com
519	customer 519	customer519@example.com
520	customer 520	customer520@example.com
521	customer 521	customer521@example.com
522	customer 522	customer522@example.com
523	customer 523	customer523@example.com
524	customer 524	customer524@example.com
525	customer 525	customer525@example.com
526	customer 526	customer526@example.com
527	customer 527	customer527@example.com
528	customer 528	customer528@example.com
529	customer 529	customer529@example.com
530	customer 530	customer530@example.com
531	customer 531	customer531@example.com
532	customer 532	customer532@example.com
533	customer 533	customer533@example.com
534	customer 534	customer534@example.com
535	customer 535	customer535@example.com
536	customer 536	customer536@example.com
537	customer 537	customer537@example.com
538	customer 538	customer538@example.com
539	customer 539	customer539@example.com
540	customer 540	customer540@example.com
541	customer 541	customer541@example.com
542	customer 542	customer542@example.com
543	customer 543	customer543@example.com
544	customer 544	customer544@example.com
545	customer 545	customer545@example.com
546	customer 546	customer546@example.com
547	customer 547	customer547@example.com
548	customer 548	customer548@example.com
549	customer 549	customer549@example.com
550	customer 550	customer550@example.com
551	customer 551	customer551@example.com
552	customer 552	customer552@example.com
553	customer 553	customer553@example.com
554	customer 554	customer554@example.com
555	customer 555	customer555@example.com
556	customer 556	customer556@example.com
557	customer 557	customer557@example.com
558	customer 558	customer558@example.com
559	customer 559	customer559@example.com
560	customer 560	customer560@example.com
561	customer 561	customer561@example.com
562	customer 562	customer562@example.com
563	customer 563	customer563@example.com
564	customer 564	customer564@example.com
565	customer 565	customer565@example.com
566	customer 566	customer566@example.com
567	customer 567	customer567@example.com
568	customer 568	customer568@example.com
569	customer 569	customer569@example.com
570	customer 570	customer570@example.com
571	customer 571	customer571@example.com
572	customer 572	customer572@example.com
573	customer 573	customer573@example.com
574	customer 574	customer574@example.com
575	customer 575	customer575@example.com
576	customer 576	customer576@example.com
577	customer 577	customer577@example.com
578	customer 578	customer578@example.com
579	customer 579	customer579@example.com
580	customer 580	customer580@example.com
581	customer 581	customer581@example.com
582	customer 582	customer582@example.com
583	customer 583	customer583@example.com
584	customer 584	customer584@example.com
585	customer 585	customer585@example.com
586	customer 586	customer586@example.com
587	customer 587	customer587@example.com
588	customer 588	customer588@example.com
589	customer 589	customer589@example.com
590	customer 590	customer590@example.com
591	customer 591	customer591@example.com
592	customer 592	customer592@example.com
593	customer 593	customer593@example.com
594	customer 594	customer594@example.com
595	customer 595	customer595@example.com
596	customer 596	customer596@example.com
597	customer 597	customer597@example.com
598	customer 598	customer598@example.com
599	customer 599	customer599@example.com
600	customer 600	customer600@example.com
601	customer 601	customer601@example.com
602	customer 602	customer602@example.com
603	customer 603	customer603@example.com
604	customer 604	customer604@example.com
605	customer 605	customer605@example.com
606	customer 606	customer606@example.com
607	customer 607	customer607@example.com
608	customer 608	customer608@example.com
609	customer 609	customer609@example.com
610	customer 610	customer610@example.com
611	customer 611	customer611@example.com
612	customer 612	customer612@example.com
613	customer 613	customer613@example.com
614	customer 614	customer614@example.com
615	customer 615	customer615@example.com
616	customer 616	customer616@example.com
617	customer 617	customer617@example.com
618	customer 618	customer618@example.com
619	customer 619	customer619@example.com
620	customer 620	customer620@example.com
621	customer 621	customer621@example.com
622	customer 622	customer622@example.com
623	customer 623	customer623@example.com
624	customer 624	customer624@example.com
625	customer 625	customer625@example.com
626	customer 626	customer626@example.com
627	customer 627	customer627@example.com
628	customer 628	customer628@example.com
629	customer 629	customer629@example.com
630	customer 630	customer630@example.com
631	customer 631	customer631@example.com
632	customer 632	customer632@example.com
633	customer 633	customer633@example.com
634	customer 634	customer634@example.com
635	customer 635	customer635@example.com
636	customer 636	customer636@example.com
637	customer 637	customer637@example.com
638	customer 638	customer638@example.com
639	customer 639	customer639@example.com
640	customer 640	customer640@example.com
641	customer 641	customer641@example.com
642	customer 642	customer642@example.com
643	customer 643	customer643@example.com
644	customer 644	customer644@example.com
645	customer 645	customer645@example.com
646	customer 646	customer646@example.com
647	customer 647	customer647@example.com
648	customer 648	customer648@example.com
649	customer 649	customer649@example.com
650	customer 650	customer650@example.com
651	customer 651	customer651@example.com
652	customer 652	customer652@example.com
653	customer 653	customer653@example.com
654	customer 654	customer654@example.com
655	customer 655	customer655@example.com
656	customer 656	customer656@example.com
657	customer 657	customer657@example.com
658	customer 658	customer658@example.com
659	customer 659	customer659@example.com
660	customer 660	customer660@example.com
661	customer 661	customer661@example.com
662	customer 662	customer662@example.com
663	customer 663	customer663@example.com
664	customer 664	customer664@example.com
665	customer 665	customer665@example.com
666	customer 666	customer666@example.com
667	customer 667	customer667@example.com
668	customer 668	customer668@example.com
669	customer 669	customer669@example.com
670	customer 670	customer670@example.com
671	customer 671	customer671@example.com
672	customer 672	customer672@example.com
673	customer 673	customer673@example.com
674	customer 674	customer674@example.com
675	customer 675	customer675@example.com
676	customer 676	customer676@example.com
677	customer 677	customer677@example.com
678	customer 678	customer678@example.com
679	customer 679	customer679@example.com
680	customer 680	customer680@example.com
681	customer 681	customer681@example.com
682	customer 682	customer682@example.com
683	customer 683	customer683@example.com
684	customer 684	customer684@example.com
685	customer 685	customer685@example.com
686	customer 686	customer686@example.com
687	customer 687	customer687@example.com
688	customer 688	customer688@example.com
689	customer 689	customer689@example.com
690	customer 690	customer690@example.com
691	customer 691	customer691@example.com
692	customer 692	customer692@example.com
693	customer 693	customer693@example.com
694	customer 694	customer694@example.com
695	customer 695	customer695@example.com
696	customer 696	customer696@example.com
697	customer 697	customer697@example.com
698	customer 698	customer698@example.com
699	customer 699	customer699@example.com
700	customer 700	customer700@example.com
701	customer 701	customer701@example.com
702	customer 702	customer702@example.com
703	customer 703	customer703@example.com
704	customer 704	customer704@example.com
705	customer 705	customer705@example.com
706	customer 706	customer706@example.com
707	customer 707	customer707@example.com
708	customer 708	customer708@example.com
709	customer 709	customer709@example.com
710	customer 710	customer710@example.com
711	customer 711	customer711@example.com
712	customer 712	customer712@example.com
713	customer 713	customer713@example.com
714	customer 714	customer714@example.com
715	customer 715	customer715@example.com
716	customer 716	customer716@example.com
717	customer 717	customer717@example.com
718	customer 718	customer718@example.com
719	customer 719	customer719@example.com
720	customer 720	customer720@example.com
721	customer 721	customer721@example.com
722	customer 722	customer722@example.com
723	customer 723	customer723@example.com
724	customer 724	customer724@example.com
725	customer 725	customer725@example.com
726	customer 726	customer726@example.com
727	customer 727	customer727@example.com
728	customer 728	customer728@example.com
729	customer 729	customer729@example.com
730	customer 730	customer730@example.com
731	customer 731	customer731@example.com
732	customer 732	customer732@example.com
733	customer 733	customer733@example.com
734	customer 734	customer734@example.com
735	customer 735	customer735@example.com
736	customer 736	customer736@example.com
737	customer 737	customer737@example.com
738	customer 738	customer738@example.com
739	customer 739	customer739@example.com
740	customer 740	customer740@example.com
741	customer 741	customer741@example.com
742	customer 742	customer742@example.com
743	customer 743	customer743@example.com
744	customer 744	customer744@example.com
745	customer 745	customer745@example.com
746	customer 746	customer746@example.com
747	customer 747	customer747@example.com
748	customer 748	customer748@example.com
749	customer 749	customer749@example.com
750	customer 750	customer750@example.com
751	customer 751	customer751@example.com
752	customer 752	customer752@example.com
753	customer 753	customer753@example.com
754	customer 754	customer754@example.com
755	customer 755	customer755@example.com
756	customer 756	customer756@example.com
757	customer 757	customer757@example.com
758	customer 758	customer758@example.com
759	customer 759	customer759@example.com
760	customer 760	customer760@example.com
761	customer 761	customer761@example.com
762	customer 762	customer762@example.com
763	customer 763	customer763@example.com
764	customer 764	customer764@example.com
765	customer 765	customer765@example.com
766	customer 766	customer766@example.com
767	customer 767	customer767@example.com
768	customer 768	customer768@example.com
769	customer 769	customer769@example.com
770	customer 770	customer770@example.com
771	customer 771	customer771@example.com
772	customer 772	customer772@example.com
773	customer 773	customer773@example.com
774	customer 774	customer774@example.com
775	customer 775	customer775@example.com
776	customer 776	customer776@example.com
777	customer 777	customer777@example.com
778	customer 778	customer778@example.com
779	customer 779	customer779@example.com
780	customer 780	customer780@example.com
781	customer 781	customer781@example.com
782	customer 782	customer782@example.com
783	customer 783	customer783@example.com
784	customer 784	customer784@example.com
785	customer 785	customer785@example.com
786	customer 786	customer786@example.com
787	customer 787	customer787@example.com
788	customer 788	customer788@example.com
789	customer 789	customer789@example.com
790	customer 790	customer790@example.com
791	customer 791	customer791@example.com
792	customer 792	customer792@example.com
793	customer 793	customer793@example.com
794	customer 794	customer794@example.com
795	customer 795	customer795@example.com
796	customer 796	customer796@example.com
797	customer 797	customer797@example.com
798	customer 798	customer798@example.com
799	customer 799	customer799@example.com
800	customer 800	customer800@example.com
801	customer 801	customer801@example.com
802	customer 802	customer802@example.com
803	customer 803	customer803@example.com
804	customer 804	customer804@example.com
805	customer 805	customer805@example.com
806	customer 806	customer806@example.com
807	customer 807	customer807@example.com
808	customer 808	customer808@example.com
809	customer 809	customer809@example.com
810	customer 810	customer810@example.com
811	customer 811	customer811@example.com
812	customer 812	customer812@example.com
813	customer 813	customer813@example.com
814	customer 814	customer814@example.com
815	customer 815	customer815@example.com
816	customer 816	customer816@example.com
817	customer 817	customer817@example.com
818	customer 818	customer818@example.com
819	customer 819	customer819@example.com
820	customer 820	customer820@example.com
821	customer 821	customer821@example.com
822	customer 822	customer822@example.com
823	customer 823	customer823@example.com
824	customer 824	customer824@example.com
825	customer 825	customer825@example.com
826	customer 826	customer826@example.com
827	customer 827	customer827@example.com
828	customer 828	customer828@example.com
829	customer 829	customer829@example.com
830	customer 830	customer830@example.com
831	customer 831	customer831@example.com
832	customer 832	customer832@example.com
833	customer 833	customer833@example.com
834	customer 834	customer834@example.com
835	customer 835	customer835@example.com
836	customer 836	customer836@example.com
837	customer 837	customer837@example.com
838	customer 838	customer838@example.com
839	customer 839	customer839@example.com
840	customer 840	customer840@example.com
841	customer 841	customer841@example.com
842	customer 842	customer842@example.com
843	customer 843	customer843@example.com
844	customer 844	customer844@example.com
845	customer 845	customer845@example.com
846	customer 846	customer846@example.com
847	customer 847	customer847@example.com
848	customer 848	customer848@example.com
849	customer 849	customer849@example.com
850	customer 850	customer850@example.com
851	customer 851	customer851@example.com
852	customer 852	customer852@example.com
853	customer 853	customer853@example.com
854	customer 854	customer854@example.com
855	customer 855	customer855@example.com
856	customer 856	customer856@example.com
857	customer 857	customer857@example.com
858	customer 858	customer858@example.com
859	customer 859	customer859@example.com
860	customer 860	customer860@example.com
861	customer 861	customer861@example.com
862	customer 862	customer862@example.com
863	customer 863	customer863@example.com
864	customer 864	customer864@example.com
865	customer 865	customer865@example.com
866	customer 866	customer866@example.com
867	customer 867	customer867@example.com
868	customer 868	customer868@example.com
869	customer 869	customer869@example.com
870	customer 870	customer870@example.com
871	customer 871	customer871@example.com
872	customer 872	customer872@example.com
873	customer 873	customer873@example.com
874	customer 874	customer874@example.com
875	customer 875	customer875@example.com
876	customer 876	customer876@example.com
877	customer 877	customer877@example.com
878	customer 878	customer878@example.com
879	customer 879	customer879@example.com
880	customer 880	customer880@example.com
881	customer 881	customer881@example.com
882	customer 882	customer882@example.com
883	customer 883	customer883@example.com
884	customer 884	customer884@example.com
885	customer 885	customer885@example.com
886	customer 886	customer886@example.com
887	customer 887	customer887@example.com
888	customer 888	customer888@example.com
889	customer 889	customer889@example.com
890	customer 890	customer890@example.com
891	customer 891	customer891@example.com
892	customer 892	customer892@example.com
893	customer 893	customer893@example.com
894	customer 894	customer894@example.com
895	customer 895	customer895@example.com
896	customer 896	customer896@example.com
897	customer 897	customer897@example.com
898	customer 898	customer898@example.com
899	customer 899	customer899@example.com
900	customer 900	customer900@example.com
901	customer 901	customer901@example.com
902	customer 902	customer902@example.com
903	customer 903	customer903@example.com
904	customer 904	customer904@example.com
905	customer 905	customer905@example.com
906	customer 906	customer906@example.com
907	customer 907	customer907@example.com
908	customer 908	customer908@example.com
909	customer 909	customer909@example.com
910	customer 910	customer910@example.com
911	customer 911	customer911@example.com
912	customer 912	customer912@example.com
913	customer 913	customer913@example.com
914	customer 914	customer914@example.com
915	customer 915	customer915@example.com
916	customer 916	customer916@example.com
917	customer 917	customer917@example.com
918	customer 918	customer918@example.com
919	customer 919	customer919@example.com
920	customer 920	customer920@example.com
921	customer 921	customer921@example.com
922	customer 922	customer922@example.com
923	customer 923	customer923@example.com
924	customer 924	customer924@example.com
925	customer 925	customer925@example.com
926	customer 926	customer926@example.com
927	customer 927	customer927@example.com
928	customer 928	customer928@example.com
929	customer 929	customer929@example.com
930	customer 930	customer930@example.com
931	customer 931	customer931@example.com
932	customer 932	customer932@example.com
933	customer 933	customer933@example.com
934	customer 934	customer934@example.com
935	customer 935	customer935@example.com
936	customer 936	customer936@example.com
937	customer 937	customer937@example.com
938	customer 938	customer938@example.com
939	customer 939	customer939@example.com
940	customer 940	customer940@example.com
941	customer 941	customer941@example.com
942	customer 942	customer942@example.com
943	customer 943	customer943@example.com
944	customer 944	customer944@example.com
945	customer 945	customer945@example.com
946	customer 946	customer946@example.com
947	customer 947	customer947@example.com
948	customer 948	customer948@example.com
949	customer 949	customer949@example.com
950	customer 950	customer950@example.com
951	customer 951	customer951@example.com
952	customer 952	customer952@example.com
953	customer 953	customer953@example.com
954	customer 954	customer954@example.com
955	customer 955	customer955@example.com
956	customer 956	customer956@example.com
957	customer 957	customer957@example.com
958	customer 958	customer958@example.com
959	customer 959	customer959@example.com
960	customer 960	customer960@example.com
961	customer 961	customer961@example.com
962	customer 962	customer962@example.com
963	customer 963	customer963@example.com
964	customer 964	customer964@example.com
965	customer 965	customer965@example.com
966	customer 966	customer966@example.com
967	customer 967	customer967@example.com
968	customer 968	customer968@example.com
969	customer 969	customer969@example.com
970	customer 970	customer970@example.com
971	customer 971	customer971@example.com
972	customer 972	customer972@example.com
973	customer 973	customer973@example.com
974	customer 974	customer974@example.com
975	customer 975	customer975@example.com
976	customer 976	customer976@example.com
977	customer 977	customer977@example.com
978	customer 978	customer978@example.com
979	customer 979	customer979@example.com
980	customer 980	customer980@example.com
981	customer 981	customer981@example.com
982	customer 982	customer982@example.com
983	customer 983	customer983@example.com
984	customer 984	customer984@example.com
985	customer 985	customer985@example.com
986	customer 986	customer986@example.com
987	customer 987	customer987@example.com
988	customer 988	customer988@example.com
989	customer 989	customer989@example.com
990	customer 990	customer990@example.com
991	customer 991	customer991@example.com
992	customer 992	customer992@example.com
993	customer 993	customer993@example.com
994	customer 994	customer994@example.com
995	customer 995	customer995@example.com
996	customer 996	customer996@example.com
997	customer 997	customer997@example.com
998	customer 998	customer998@example.com
999	customer 999	customer999@example.com
1000	customer 1000	customer1000@example.com
1001	customer 1001	customer1001@example.com
1002	customer 1002	customer1002@example.com
1003	customer 1003	customer1003@example.com
1004	customer 1004	customer1004@example.com
1005	customer 1005	customer1005@example.com
1006	customer 1006	customer1006@example.com
1007	customer 1007	customer1007@example.com
1008	customer 1008	customer1008@example.com
1009	customer 1009	customer1009@example.com
1010	customer 1010	customer1010@example.com
1011	customer 1011	customer1011@example.com
1012	customer 1012	customer1012@example.com
1013	customer 1013	customer1013@example.com
1014	customer 1014	customer1014@example.com
1015	customer 1015	customer1015@example.com
1016	customer 1016	customer1016@example.com
1017	customer 1017	customer1017@example.com
1018	customer 1018	customer1018@example.com
1019	customer 1019	customer1019@example.com
1020	customer 1020	customer1020@example.com
1021	customer 1021	customer1021@example.com
1022	customer 1022	customer1022@example.com
1023	customer 1023	customer1023@example.com
1024	customer 1024	customer1024@example.com
1025	customer 1025	customer1025@example.com
1026	customer 1026	customer1026@example.com
1027	customer 1027	customer1027@example.com
1028	customer 1028	customer1028@example.com
1029	customer 1029	customer1029@example.com
1030	customer 1030	customer1030@example.com
1031	customer 1031	customer1031@example.com
1032	customer 1032	customer1032@example.com
1033	customer 1033	customer1033@example.com
1034	customer 1034	customer1034@example.com
1035	customer 1035	customer1035@example.com
1036	customer 1036	customer1036@example.com
1037	customer 1037	customer1037@example.com
1038	customer 1038	customer1038@example.com
1039	customer 1039	customer1039@example.com
1040	customer 1040	customer1040@example.com
1041	customer 1041	customer1041@example.com
1042	customer 1042	customer1042@example.com
1043	customer 1043	customer1043@example.com
1044	customer 1044	customer1044@example.com
1045	customer 1045	customer1045@example.com
1046	customer 1046	customer1046@example.com
1047	customer 1047	customer1047@example.com
1048	customer 1048	customer1048@example.com
1049	customer 1049	customer1049@example.com
1050	customer 1050	customer1050@example.com
1051	customer 1051	customer1051@example.com
1052	customer 1052	customer1052@example.com
1053	customer 1053	customer1053@example.com
1054	customer 1054	customer1054@example.com
1055	customer 1055	customer1055@example.com
1056	customer 1056	customer1056@example.com
1057	customer 1057	customer1057@example.com
1058	customer 1058	customer1058@example.com
1059	customer 1059	customer1059@example.com
1060	customer 1060	customer1060@example.com
1061	customer 1061	customer1061@example.com
1062	customer 1062	customer1062@example.com
1063	customer 1063	customer1063@example.com
1064	customer 1064	customer1064@example.com
1065	customer 1065	customer1065@example.com
1066	customer 1066	customer1066@example.com
1067	customer 1067	customer1067@example.com
1068	customer 1068	customer1068@example.com
1069	customer 1069	customer1069@example.com
1070	customer 1070	customer1070@example.com
1071	customer 1071	customer1071@example.com
1072	customer 1072	customer1072@example.com
1073	customer 1073	customer1073@example.com
1074	customer 1074	customer1074@example.com
1075	customer 1075	customer1075@example.com
1076	customer 1076	customer1076@example.com
1077	customer 1077	customer1077@example.com
1078	customer 1078	customer1078@example.com
1079	customer 1079	customer1079@example.com
1080	customer 1080	customer1080@example.com
1081	customer 1081	customer1081@example.com
1082	customer 1082	customer1082@example.com
1083	customer 1083	customer1083@example.com
1084	customer 1084	customer1084@example.com
1085	customer 1085	customer1085@example.com
1086	customer 1086	customer1086@example.com
1087	customer 1087	customer1087@example.com
1088	customer 1088	customer1088@example.com
1089	customer 1089	customer1089@example.com
1090	customer 1090	customer1090@example.com
1091	customer 1091	customer1091@example.com
1092	customer 1092	customer1092@example.com
1093	customer 1093	customer1093@example.com
1094	customer 1094	customer1094@example.com
1095	customer 1095	customer1095@example.com
1096	customer 1096	customer1096@example.com
1097	customer 1097	customer1097@example.com
1098	customer 1098	customer1098@example.com
1099	customer 1099	customer1099@example.com
1100	customer 1100	customer1100@example.com
1101	customer 1101	customer1101@example.com
1102	customer 1102	customer1102@example.com
1103	customer 1103	customer1103@example.com
1104	customer 1104	customer1104@example.com
1105	customer 1105	customer1105@example.com
1106	customer 1106	customer1106@example.com
1107	customer 1107	customer1107@example.com
1108	customer 1108	customer1108@example.com
1109	customer 1109	customer1109@example.com
1110	customer 1110	customer1110@example.com
1111	customer 1111	customer1111@example.com
1112	customer 1112	customer1112@example.com
1113	customer 1113	customer1113@example.com
1114	customer 1114	customer1114@example.com
1115	customer 1115	customer1115@example.com
1116	customer 1116	customer1116@example.com
1117	customer 1117	customer1117@example.com
1118	customer 1118	customer1118@example.com
1119	customer 1119	customer1119@example.com
1120	customer 1120	customer1120@example.com
1121	customer 1121	customer1121@example.com
1122	customer 1122	customer1122@example.com
1123	customer 1123	customer1123@example.com
1124	customer 1124	customer1124@example.com
1125	customer 1125	customer1125@example.com
1126	customer 1126	customer1126@example.com
1127	customer 1127	customer1127@example.com
1128	customer 1128	customer1128@example.com
1129	customer 1129	customer1129@example.com
1130	customer 1130	customer1130@example.com
1131	customer 1131	customer1131@example.com
1132	customer 1132	customer1132@example.com
1133	customer 1133	customer1133@example.com
1134	customer 1134	customer1134@example.com
1135	customer 1135	customer1135@example.com
1136	customer 1136	customer1136@example.com
1137	customer 1137	customer1137@example.com
1138	customer 1138	customer1138@example.com
1139	customer 1139	customer1139@example.com
1140	customer 1140	customer1140@example.com
1141	customer 1141	customer1141@example.com
1142	customer 1142	customer1142@example.com
1143	customer 1143	customer1143@example.com
1144	customer 1144	customer1144@example.com
1145	customer 1145	customer1145@example.com
1146	customer 1146	customer1146@example.com
1147	customer 1147	customer1147@example.com
1148	customer 1148	customer1148@example.com
1149	customer 1149	customer1149@example.com
1150	customer 1150	customer1150@example.com
1151	customer 1151	customer1151@example.com
1152	customer 1152	customer1152@example.com
1153	customer 1153	customer1153@example.com
1154	customer 1154	customer1154@example.com
1155	customer 1155	customer1155@example.com
1156	customer 1156	customer1156@example.com
1157	customer 1157	customer1157@example.com
1158	customer 1158	customer1158@example.com
1159	customer 1159	customer1159@example.com
1160	customer 1160	customer1160@example.com
1161	customer 1161	customer1161@example.com
1162	customer 1162	customer1162@example.com
1163	customer 1163	customer1163@example.com
1164	customer 1164	customer1164@example.com
1165	customer 1165	customer1165@example.com
1166	customer 1166	customer1166@example.com
1167	customer 1167	customer1167@example.com
1168	customer 1168	customer1168@example.com
1169	customer 1169	customer1169@example.com
1170	customer 1170	customer1170@example.com
1171	customer 1171	customer1171@example.com
1172	customer 1172	customer1172@example.com
1173	customer 1173	customer1173@example.com
1174	customer 1174	customer1174@example.com
1175	customer 1175	customer1175@example.com
1176	customer 1176	customer1176@example.com
1177	customer 1177	customer1177@example.com
1178	customer 1178	customer1178@example.com
1179	customer 1179	customer1179@example.com
1180	customer 1180	customer1180@example.com
1181	customer 1181	customer1181@example.com
1182	customer 1182	customer1182@example.com
1183	customer 1183	customer1183@example.com
1184	customer 1184	customer1184@example.com
1185	customer 1185	customer1185@example.com
1186	customer 1186	customer1186@example.com
1187	customer 1187	customer1187@example.com
1188	customer 1188	customer1188@example.com
1189	customer 1189	customer1189@example.com
1190	customer 1190	customer1190@example.com
1191	customer 1191	customer1191@example.com
1192	customer 1192	customer1192@example.com
1193	customer 1193	customer1193@example.com
1194	customer 1194	customer1194@example.com
1195	customer 1195	customer1195@example.com
1196	customer 1196	customer1196@example.com
1197	customer 1197	customer1197@example.com
1198	customer 1198	customer1198@example.com
1199	customer 1199	customer1199@example.com
1200	customer 1200	customer1200@example.com
1201	customer 1201	customer1201@example.com
1202	customer 1202	customer1202@example.com
1203	customer 1203	customer1203@example.com
1204	customer 1204	customer1204@example.com
1205	customer 1205	customer1205@example.com
1206	customer 1206	customer1206@example.com
1207	customer 1207	customer1207@example.com
1208	customer 1208	customer1208@example.com
1209	customer 1209	customer1209@example.com
1210	customer 1210	customer1210@example.com
1211	customer 1211	customer1211@example.com
1212	customer 1212	customer1212@example.com
1213	customer 1213	customer1213@example.com
1214	customer 1214	customer1214@example.com
1215	customer 1215	customer1215@example.com
1216	customer 1216	customer1216@example.com
1217	customer 1217	customer1217@example.com
1218	customer 1218	customer1218@example.com
1219	customer 1219	customer1219@example.com
1220	customer 1220	customer1220@example.com
1221	customer 1221	customer1221@example.com
1222	customer 1222	customer1222@example.com
1223	customer 1223	customer1223@example.com
1224	customer 1224	customer1224@example.com
1225	customer 1225	customer1225@example.com
1226	customer 1226	customer1226@example.com
1227	customer 1227	customer1227@example.com
1228	customer 1228	customer1228@example.com
1229	customer 1229	customer1229@example.com
1230	customer 1230	customer1230@example.com
1231	customer 1231	customer1231@example.com
1232	customer 1232	customer1232@example.com
1233	customer 1233	customer1233@example.com
1234	customer 1234	customer1234@example.com
1235	customer 1235	customer1235@example.com
1236	customer 1236	customer1236@example.com
1237	customer 1237	customer1237@example.com
1238	customer 1238	customer1238@example.com
1239	customer 1239	customer1239@example.com
1240	customer 1240	customer1240@example.com
1241	customer 1241	customer1241@example.com
1242	customer 1242	customer1242@example.com
1243	customer 1243	customer1243@example.com
1244	customer 1244	customer1244@example.com
1245	customer 1245	customer1245@example.com
1246	customer 1246	customer1246@example.com
1247	customer 1247	customer1247@example.com
1248	customer 1248	customer1248@example.com
1249	customer 1249	customer1249@example.com
1250	customer 1250	customer1250@example.com
1251	customer 1251	customer1251@example.com
1252	customer 1252	customer1252@example.com
1253	customer 1253	customer1253@example.com
1254	customer 1254	customer1254@example.com
1255	customer 1255	customer1255@example.com
1256	customer 1256	customer1256@example.com
1257	customer 1257	customer1257@example.com
1258	customer 1258	customer1258@example.com
1259	customer 1259	customer1259@example.com
1260	customer 1260	customer1260@example.com
1261	customer 1261	customer1261@example.com
1262	customer 1262	customer1262@example.com
1263	customer 1263	customer1263@example.com
1264	customer 1264	customer1264@example.com
1265	customer 1265	customer1265@example.com
1266	customer 1266	customer1266@example.com
1267	customer 1267	customer1267@example.com
1268	customer 1268	customer1268@example.com
1269	customer 1269	customer1269@example.com
1270	customer 1270	customer1270@example.com
1271	customer 1271	customer1271@example.com
1272	customer 1272	customer1272@example.com
1273	customer 1273	customer1273@example.com
1274	customer 1274	customer1274@example.com
1275	customer 1275	customer1275@example.com
1276	customer 1276	customer1276@example.com
1277	customer 1277	customer1277@example.com
1278	customer 1278	customer1278@example.com
1279	customer 1279	customer1279@example.com
1280	customer 1280	customer1280@example.com
1281	customer 1281	customer1281@example.com
1282	customer 1282	customer1282@example.com
1283	customer 1283	customer1283@example.com
1284	customer 1284	customer1284@example.com
1285	customer 1285	customer1285@example.com
1286	customer 1286	customer1286@example.com
1287	customer 1287	customer1287@example.com
1288	customer 1288	customer1288@example.com
1289	customer 1289	customer1289@example.com
1290	customer 1290	customer1290@example.com
1291	customer 1291	customer1291@example.com
1292	customer 1292	customer1292@example.com
1293	customer 1293	customer1293@example.com
1294	customer 1294	customer1294@example.com
1295	customer 1295	customer1295@example.com
1296	customer 1296	customer1296@example.com
1297	customer 1297	customer1297@example.com
\.


--
-- Data for Name: dim_date; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_date (date_id, month_id, year_id, date_name) FROM stdin;
1	14	3	2022-08-10
2	32	2	2023-01-09
3	31	1	2024-12-15
4	5	1	2024-01-16
5	18	2	2023-04-09
6	17	3	2022-07-16
7	36	3	2022-03-02
8	22	1	2024-05-27
9	10	1	2024-11-28
10	12	2	2023-11-15
11	24	2	2023-05-07
12	2	1	2024-08-26
13	29	2	2023-07-03
14	12	2	2023-11-02
15	31	1	2024-12-06
16	25	1	2024-04-26
17	9	3	2022-10-08
18	9	3	2022-10-24
19	14	3	2022-08-21
20	25	1	2024-04-04
21	14	3	2022-08-16
22	25	1	2024-04-28
23	14	3	2022-08-13
24	26	3	2022-05-12
25	33	2	2023-09-25
26	11	2	2023-08-10
27	18	2	2023-04-07
28	9	3	2022-10-23
29	32	2	2023-01-01
30	18	2	2023-04-15
31	2	1	2024-08-01
32	23	3	2022-02-21
33	3	1	2024-02-19
34	7	2	2023-10-28
35	4	2	2023-06-04
36	13	3	2022-11-26
37	28	3	2022-09-03
38	3	1	2024-02-14
39	9	3	2022-10-14
40	28	3	2022-09-19
41	1	2	2023-12-19
42	14	3	2022-08-11
43	30	1	2024-09-01
44	28	3	2022-09-21
45	4	2	2023-06-11
46	28	3	2022-09-13
47	28	3	2022-09-24
48	7	2	2023-10-21
49	30	1	2024-09-09
50	36	3	2022-03-24
51	14	3	2022-08-08
52	16	1	2024-06-06
53	23	3	2022-02-27
54	7	2	2023-10-16
55	10	1	2024-11-17
56	2	1	2024-08-11
57	27	1	2024-10-17
58	22	1	2024-05-04
59	4	2	2023-06-10
60	13	3	2022-11-10
61	19	2	2023-03-10
62	22	1	2024-05-07
63	1	2	2023-12-08
64	22	1	2024-05-17
65	22	1	2024-05-18
66	31	1	2024-12-23
67	27	1	2024-10-03
68	4	2	2023-06-02
69	21	3	2022-04-13
70	6	1	2024-03-02
71	26	3	2022-05-19
72	8	3	2022-12-14
73	35	3	2022-06-25
74	25	1	2024-04-09
75	10	1	2024-11-16
76	15	1	2024-07-04
77	20	3	2022-01-01
78	29	2	2023-07-26
79	10	1	2024-11-14
80	13	3	2022-11-27
81	23	3	2022-02-22
82	26	3	2022-05-05
83	20	3	2022-01-14
84	35	3	2022-06-11
85	12	2	2023-11-07
86	27	1	2024-10-14
87	1	2	2023-12-10
88	34	2	2023-02-14
89	23	3	2022-02-25
90	18	2	2023-04-14
91	19	2	2023-03-22
92	26	3	2022-05-04
93	11	2	2023-08-24
94	2	1	2024-08-18
95	5	1	2024-01-02
96	9	3	2022-10-25
97	13	3	2022-11-07
98	28	3	2022-09-09
99	10	1	2024-11-09
100	24	2	2023-05-22
101	23	3	2022-02-09
102	8	3	2022-12-08
103	26	3	2022-05-17
104	22	1	2024-05-20
105	10	1	2024-11-21
106	12	2	2023-11-27
107	12	2	2023-11-21
108	2	1	2024-08-06
109	1	2	2023-12-17
110	29	2	2023-07-04
111	31	1	2024-12-18
112	3	1	2024-02-05
113	22	1	2024-05-11
114	30	1	2024-09-22
115	30	1	2024-09-04
116	9	3	2022-10-17
117	32	2	2023-01-25
118	17	3	2022-07-28
119	35	3	2022-06-10
120	36	3	2022-03-06
121	29	2	2023-07-21
122	21	3	2022-04-11
123	26	3	2022-05-11
124	5	1	2024-01-01
125	35	3	2022-06-18
126	7	2	2023-10-11
127	23	3	2022-02-13
128	20	3	2022-01-17
129	19	2	2023-03-15
130	17	3	2022-07-14
131	32	2	2023-01-04
132	4	2	2023-06-28
133	31	1	2024-12-07
134	19	2	2023-03-07
135	36	3	2022-03-13
136	26	3	2022-05-25
137	25	1	2024-04-18
138	35	3	2022-06-28
139	23	3	2022-02-20
140	26	3	2022-05-01
141	35	3	2022-06-26
142	19	2	2023-03-27
143	6	1	2024-03-16
144	22	1	2024-05-08
145	19	2	2023-03-11
146	24	2	2023-05-16
147	17	3	2022-07-15
148	17	3	2022-07-12
149	11	2	2023-08-18
150	24	2	2023-05-10
151	24	2	2023-05-12
152	24	2	2023-05-19
153	6	1	2024-03-05
154	28	3	2022-09-16
155	32	2	2023-01-22
156	32	2	2023-01-18
157	17	3	2022-07-11
158	5	1	2024-01-27
159	34	2	2023-02-03
160	34	2	2023-02-11
161	23	3	2022-02-06
162	5	1	2024-01-09
163	4	2	2023-06-18
164	3	1	2024-02-01
165	25	1	2024-04-14
166	33	2	2023-09-08
167	22	1	2024-05-15
168	12	2	2023-11-19
169	3	1	2024-02-03
170	7	2	2023-10-17
171	13	3	2022-11-16
172	8	3	2022-12-07
173	27	1	2024-10-25
174	28	3	2022-09-12
175	11	2	2023-08-06
176	28	3	2022-09-10
177	10	1	2024-11-08
178	15	1	2024-07-25
179	31	1	2024-12-19
180	31	1	2024-12-13
181	5	1	2024-01-06
182	2	1	2024-08-25
183	23	3	2022-02-24
184	3	1	2024-02-17
185	35	3	2022-06-03
186	3	1	2024-02-11
187	21	3	2022-04-02
188	14	3	2022-08-22
189	36	3	2022-03-25
190	17	3	2022-07-10
191	13	3	2022-11-04
192	23	3	2022-02-28
193	13	3	2022-11-25
194	13	3	2022-11-15
195	1	2	2023-12-05
196	33	2	2023-09-04
197	17	3	2022-07-13
198	19	2	2023-03-13
199	24	2	2023-05-05
200	11	2	2023-08-25
201	20	3	2022-01-24
202	14	3	2022-08-19
203	34	2	2023-02-05
204	21	3	2022-04-21
205	12	2	2023-11-24
206	21	3	2022-04-26
207	36	3	2022-03-26
208	5	1	2024-01-03
209	27	1	2024-10-15
210	8	3	2022-12-19
211	14	3	2022-08-01
212	2	1	2024-08-09
213	26	3	2022-05-15
214	6	1	2024-03-25
215	15	1	2024-07-21
216	20	3	2022-01-25
217	19	2	2023-03-17
218	31	1	2024-12-09
219	4	2	2023-06-03
220	10	1	2024-11-01
221	29	2	2023-07-19
222	18	2	2023-04-06
223	26	3	2022-05-20
224	11	2	2023-08-12
225	10	1	2024-11-12
226	9	3	2022-10-22
227	26	3	2022-05-02
228	17	3	2022-07-02
229	8	3	2022-12-13
230	10	1	2024-11-06
231	16	1	2024-06-28
232	4	2	2023-06-21
233	25	1	2024-04-22
234	9	3	2022-10-27
235	35	3	2022-06-07
236	27	1	2024-10-04
237	32	2	2023-01-21
238	5	1	2024-01-17
239	3	1	2024-02-20
240	32	2	2023-01-16
241	18	2	2023-04-18
242	35	3	2022-06-01
243	30	1	2024-09-18
244	16	1	2024-06-25
245	18	2	2023-04-08
246	20	3	2022-01-02
247	34	2	2023-02-23
248	12	2	2023-11-11
249	19	2	2023-03-04
250	23	3	2022-02-01
251	24	2	2023-05-28
252	30	1	2024-09-28
253	23	3	2022-02-15
254	10	1	2024-11-11
255	8	3	2022-12-02
256	8	3	2022-12-10
257	7	2	2023-10-27
258	36	3	2022-03-22
259	18	2	2023-04-26
260	34	2	2023-02-08
261	15	1	2024-07-08
262	8	3	2022-12-25
263	9	3	2022-10-06
264	34	2	2023-02-19
265	20	3	2022-01-16
266	29	2	2023-07-06
267	4	2	2023-06-06
268	23	3	2022-02-19
269	19	2	2023-03-28
270	18	2	2023-04-13
271	33	2	2023-09-24
272	6	1	2024-03-06
273	35	3	2022-06-27
274	36	3	2022-03-18
275	1	2	2023-12-27
276	15	1	2024-07-06
277	36	3	2022-03-09
278	13	3	2022-11-22
279	1	2	2023-12-01
280	3	1	2024-02-10
281	33	2	2023-09-18
282	15	1	2024-07-14
283	26	3	2022-05-22
284	16	1	2024-06-21
285	17	3	2022-07-01
286	32	2	2023-01-26
287	28	3	2022-09-17
288	27	1	2024-10-27
289	16	1	2024-06-19
290	32	2	2023-01-02
291	19	2	2023-03-02
292	10	1	2024-11-10
293	35	3	2022-06-06
294	28	3	2022-09-02
295	29	2	2023-07-08
296	2	1	2024-08-12
297	26	3	2022-05-27
298	17	3	2022-07-05
299	4	2	2023-06-19
300	32	2	2023-01-10
301	23	3	2022-02-16
302	21	3	2022-04-03
303	13	3	2022-11-03
304	1	2	2023-12-14
305	11	2	2023-08-27
306	26	3	2022-05-09
307	19	2	2023-03-03
308	22	1	2024-05-26
309	29	2	2023-07-07
310	6	1	2024-03-19
311	12	2	2023-11-20
312	2	1	2024-08-28
313	29	2	2023-07-12
314	33	2	2023-09-19
315	2	1	2024-08-17
316	10	1	2024-11-15
317	18	2	2023-04-28
318	24	2	2023-05-03
319	15	1	2024-07-01
320	16	1	2024-06-17
321	7	2	2023-10-14
322	31	1	2024-12-08
323	22	1	2024-05-12
324	18	2	2023-04-04
325	29	2	2023-07-25
326	36	3	2022-03-20
327	24	2	2023-05-02
328	15	1	2024-07-28
329	23	3	2022-02-08
330	1	2	2023-12-03
331	14	3	2022-08-06
332	5	1	2024-01-24
333	11	2	2023-08-23
334	23	3	2022-02-04
335	3	1	2024-02-07
336	31	1	2024-12-02
337	7	2	2023-10-06
338	16	1	2024-06-14
339	17	3	2022-07-03
340	15	1	2024-07-27
341	3	1	2024-02-15
342	34	2	2023-02-07
343	31	1	2024-12-05
344	26	3	2022-05-16
345	7	2	2023-10-22
346	16	1	2024-06-26
347	3	1	2024-02-02
348	13	3	2022-11-08
349	3	1	2024-02-22
350	7	2	2023-10-20
351	21	3	2022-04-14
352	21	3	2022-04-06
353	20	3	2022-01-27
354	29	2	2023-07-16
355	12	2	2023-11-08
356	8	3	2022-12-23
357	31	1	2024-12-20
358	5	1	2024-01-13
359	19	2	2023-03-12
360	13	3	2022-11-02
361	27	1	2024-10-18
362	14	3	2022-08-07
363	9	3	2022-10-15
364	17	3	2022-07-08
365	13	3	2022-11-06
366	24	2	2023-05-24
367	17	3	2022-07-20
368	9	3	2022-10-05
369	32	2	2023-01-28
370	8	3	2022-12-16
371	30	1	2024-09-05
372	16	1	2024-06-15
373	27	1	2024-10-13
374	1	2	2023-12-12
375	13	3	2022-11-23
376	11	2	2023-08-22
377	11	2	2023-08-08
378	31	1	2024-12-12
379	22	1	2024-05-06
380	8	3	2022-12-11
381	13	3	2022-11-12
382	16	1	2024-06-24
383	21	3	2022-04-01
384	27	1	2024-10-16
385	4	2	2023-06-27
386	1	2	2023-12-24
387	36	3	2022-03-08
388	25	1	2024-04-20
389	21	3	2022-04-23
390	26	3	2022-05-06
391	10	1	2024-11-20
392	27	1	2024-10-24
393	6	1	2024-03-15
394	10	1	2024-11-22
395	3	1	2024-02-21
396	21	3	2022-04-08
397	1	2	2023-12-18
398	11	2	2023-08-21
399	1	2	2023-12-11
400	5	1	2024-01-05
401	19	2	2023-03-01
402	11	2	2023-08-03
403	22	1	2024-05-09
404	10	1	2024-11-23
405	21	3	2022-04-20
406	33	2	2023-09-26
407	33	2	2023-09-14
408	19	2	2023-03-19
409	31	1	2024-12-01
410	11	2	2023-08-26
411	4	2	2023-06-12
412	30	1	2024-09-24
413	30	1	2024-09-07
414	3	1	2024-02-16
415	4	2	2023-06-22
416	21	3	2022-04-10
417	25	1	2024-04-19
418	19	2	2023-03-05
419	25	1	2024-04-01
420	16	1	2024-06-22
421	34	2	2023-02-18
422	20	3	2022-01-09
423	27	1	2024-10-10
424	18	2	2023-04-17
425	6	1	2024-03-09
426	7	2	2023-10-24
427	1	2	2023-12-20
428	8	3	2022-12-15
429	3	1	2024-02-13
430	8	3	2022-12-05
431	27	1	2024-10-07
432	19	2	2023-03-20
433	25	1	2024-04-10
434	27	1	2024-10-11
435	16	1	2024-06-10
436	27	1	2024-10-22
437	25	1	2024-04-23
438	12	2	2023-11-28
439	7	2	2023-10-05
440	7	2	2023-10-15
441	34	2	2023-02-01
442	26	3	2022-05-26
443	32	2	2023-01-03
444	15	1	2024-07-09
445	13	3	2022-11-09
446	34	2	2023-02-21
447	14	3	2022-08-25
448	32	2	2023-01-23
449	22	1	2024-05-01
450	12	2	2023-11-13
451	16	1	2024-06-03
452	20	3	2022-01-19
453	15	1	2024-07-12
454	4	2	2023-06-17
455	3	1	2024-02-09
456	36	3	2022-03-04
457	30	1	2024-09-21
458	31	1	2024-12-04
459	11	2	2023-08-17
460	7	2	2023-10-12
461	23	3	2022-02-11
462	3	1	2024-02-23
463	24	2	2023-05-21
464	15	1	2024-07-15
465	35	3	2022-06-24
466	20	3	2022-01-04
467	5	1	2024-01-04
468	18	2	2023-04-21
469	20	3	2022-01-08
470	34	2	2023-02-06
471	31	1	2024-12-21
472	4	2	2023-06-07
473	34	2	2023-02-22
474	23	3	2022-02-18
475	12	2	2023-11-03
476	11	2	2023-08-16
477	26	3	2022-05-10
478	6	1	2024-03-14
479	2	1	2024-08-08
480	4	2	2023-06-16
481	6	1	2024-03-24
482	14	3	2022-08-12
483	36	3	2022-03-15
484	22	1	2024-05-23
485	24	2	2023-05-13
486	15	1	2024-07-05
487	21	3	2022-04-18
488	5	1	2024-01-10
489	30	1	2024-09-26
490	30	1	2024-09-12
491	12	2	2023-11-16
492	17	3	2022-07-24
493	10	1	2024-11-19
494	22	1	2024-05-22
495	7	2	2023-10-25
496	3	1	2024-02-28
497	10	1	2024-11-13
498	24	2	2023-05-17
499	24	2	2023-05-11
500	12	2	2023-11-10
501	18	2	2023-04-02
502	35	3	2022-06-19
503	14	3	2022-08-18
504	14	3	2022-08-03
505	33	2	2023-09-21
506	28	3	2022-09-04
507	3	1	2024-02-26
508	21	3	2022-04-24
509	21	3	2022-04-04
510	20	3	2022-01-07
511	2	1	2024-08-27
512	6	1	2024-03-03
513	23	3	2022-02-12
514	17	3	2022-07-23
515	13	3	2022-11-28
516	33	2	2023-09-15
517	35	3	2022-06-08
518	6	1	2024-03-12
519	18	2	2023-04-01
520	28	3	2022-09-23
521	6	1	2024-03-17
522	9	3	2022-10-07
523	29	2	2023-07-02
524	25	1	2024-04-27
525	32	2	2023-01-06
526	14	3	2022-08-15
527	29	2	2023-07-24
528	25	1	2024-04-13
529	3	1	2024-02-04
530	3	1	2024-02-18
531	13	3	2022-11-21
532	32	2	2023-01-19
533	6	1	2024-03-18
534	5	1	2024-01-28
535	13	3	2022-11-19
536	20	3	2022-01-26
537	9	3	2022-10-26
538	24	2	2023-05-04
539	13	3	2022-11-20
540	25	1	2024-04-21
541	35	3	2022-06-02
542	19	2	2023-03-26
543	9	3	2022-10-10
544	20	3	2022-01-22
545	11	2	2023-08-02
546	1	2	2023-12-04
547	19	2	2023-03-16
548	29	2	2023-07-09
549	20	3	2022-01-20
550	24	2	2023-05-23
551	8	3	2022-12-04
552	33	2	2023-09-01
553	26	3	2022-05-14
554	18	2	2023-04-22
555	13	3	2022-11-18
556	19	2	2023-03-18
557	16	1	2024-06-08
558	27	1	2024-10-12
559	10	1	2024-11-24
560	33	2	2023-09-20
561	20	3	2022-01-05
562	9	3	2022-10-12
563	30	1	2024-09-13
564	1	2	2023-12-16
565	15	1	2024-07-23
566	14	3	2022-08-09
567	24	2	2023-05-14
568	23	3	2022-02-03
569	5	1	2024-01-26
570	21	3	2022-04-22
571	28	3	2022-09-11
572	8	3	2022-12-09
573	35	3	2022-06-13
574	14	3	2022-08-02
575	33	2	2023-09-22
576	36	3	2022-03-10
577	25	1	2024-04-17
578	27	1	2024-10-02
579	13	3	2022-11-14
580	15	1	2024-07-10
581	35	3	2022-06-21
582	4	2	2023-06-13
583	16	1	2024-06-11
584	32	2	2023-01-20
585	30	1	2024-09-17
586	34	2	2023-02-12
587	26	3	2022-05-21
588	34	2	2023-02-27
589	13	3	2022-11-05
590	26	3	2022-05-23
591	12	2	2023-11-25
592	34	2	2023-02-25
593	15	1	2024-07-22
594	4	2	2023-06-24
595	17	3	2022-07-06
596	25	1	2024-04-05
597	6	1	2024-03-01
598	27	1	2024-10-20
599	22	1	2024-05-16
600	2	1	2024-08-21
601	21	3	2022-04-12
602	20	3	2022-01-03
603	7	2	2023-10-13
604	36	3	2022-03-01
605	10	1	2024-11-02
606	16	1	2024-06-09
607	9	3	2022-10-09
608	31	1	2024-12-10
609	25	1	2024-04-02
610	25	1	2024-04-15
611	2	1	2024-08-15
612	5	1	2024-01-11
613	11	2	2023-08-20
614	22	1	2024-05-13
615	23	3	2022-02-14
616	18	2	2023-04-12
617	3	1	2024-02-06
618	29	2	2023-07-01
619	17	3	2022-07-19
620	36	3	2022-03-14
621	29	2	2023-07-15
622	10	1	2024-11-04
623	6	1	2024-03-21
624	2	1	2024-08-14
625	34	2	2023-02-04
626	25	1	2024-04-12
627	33	2	2023-09-06
628	1	2	2023-12-13
629	22	1	2024-05-02
630	1	2	2023-12-23
631	19	2	2023-03-21
632	1	2	2023-12-22
633	2	1	2024-08-22
634	14	3	2022-08-17
635	5	1	2024-01-22
636	7	2	2023-10-19
637	8	3	2022-12-22
638	28	3	2022-09-28
639	14	3	2022-08-28
640	16	1	2024-06-01
641	14	3	2022-08-27
642	31	1	2024-12-28
643	7	2	2023-10-01
644	2	1	2024-08-23
645	14	3	2022-08-26
646	13	3	2022-11-01
647	20	3	2022-01-11
648	12	2	2023-11-23
649	22	1	2024-05-19
650	5	1	2024-01-20
651	32	2	2023-01-24
652	12	2	2023-11-17
653	14	3	2022-08-14
654	1	2	2023-12-09
655	21	3	2022-04-28
656	2	1	2024-08-20
657	2	1	2024-08-16
658	24	2	2023-05-01
659	27	1	2024-10-19
660	36	3	2022-03-12
661	30	1	2024-09-15
662	32	2	2023-01-05
663	33	2	2023-09-28
664	33	2	2023-09-23
665	21	3	2022-04-15
666	7	2	2023-10-02
667	1	2	2023-12-06
668	30	1	2024-09-23
669	33	2	2023-09-27
670	2	1	2024-08-02
671	16	1	2024-06-02
672	29	2	2023-07-10
673	8	3	2022-12-26
674	34	2	2023-02-20
675	36	3	2022-03-16
676	6	1	2024-03-10
677	6	1	2024-03-11
678	11	2	2023-08-28
679	12	2	2023-11-18
680	1	2	2023-12-26
681	36	3	2022-03-28
682	4	2	2023-06-26
683	33	2	2023-09-05
684	35	3	2022-06-20
685	34	2	2023-02-10
686	27	1	2024-10-01
687	9	3	2022-10-02
688	12	2	2023-11-04
689	32	2	2023-01-08
690	27	1	2024-10-21
691	16	1	2024-06-18
692	4	2	2023-06-05
693	17	3	2022-07-22
694	23	3	2022-02-17
695	11	2	2023-08-14
696	15	1	2024-07-07
697	22	1	2024-05-25
698	14	3	2022-08-05
699	13	3	2022-11-17
700	35	3	2022-06-23
701	26	3	2022-05-07
702	19	2	2023-03-09
703	30	1	2024-09-25
704	32	2	2023-01-27
705	12	2	2023-11-01
706	9	3	2022-10-28
707	26	3	2022-05-13
708	18	2	2023-04-03
709	28	3	2022-09-18
710	18	2	2023-04-20
711	31	1	2024-12-16
712	22	1	2024-05-05
713	15	1	2024-07-16
714	6	1	2024-03-07
715	31	1	2024-12-11
716	3	1	2024-02-25
717	18	2	2023-04-10
718	17	3	2022-07-27
719	20	3	2022-01-28
720	28	3	2022-09-14
721	6	1	2024-03-28
722	20	3	2022-01-15
723	4	2	2023-06-25
724	27	1	2024-10-26
725	16	1	2024-06-05
726	25	1	2024-04-06
727	3	1	2024-02-12
728	8	3	2022-12-18
729	2	1	2024-08-24
730	35	3	2022-06-22
731	6	1	2024-03-23
732	8	3	2022-12-12
733	12	2	2023-11-12
734	25	1	2024-04-24
735	34	2	2023-02-15
736	31	1	2024-12-17
737	2	1	2024-08-19
738	28	3	2022-09-08
739	9	3	2022-10-21
740	9	3	2022-10-13
741	22	1	2024-05-14
742	22	1	2024-05-21
743	31	1	2024-12-03
744	23	3	2022-02-10
745	24	2	2023-05-15
746	4	2	2023-06-14
747	30	1	2024-09-11
748	8	3	2022-12-28
749	27	1	2024-10-08
750	7	2	2023-10-18
751	28	3	2022-09-25
752	5	1	2024-01-21
753	18	2	2023-04-23
754	32	2	2023-01-12
755	36	3	2022-03-11
756	29	2	2023-07-23
757	29	2	2023-07-20
758	30	1	2024-09-19
759	33	2	2023-09-13
760	35	3	2022-06-05
761	17	3	2022-07-04
762	20	3	2022-01-10
763	24	2	2023-05-26
764	2	1	2024-08-03
765	25	1	2024-04-25
766	11	2	2023-08-01
767	35	3	2022-06-15
768	6	1	2024-03-08
769	25	1	2024-04-08
770	27	1	2024-10-05
771	29	2	2023-07-13
772	20	3	2022-01-06
773	9	3	2022-10-18
774	21	3	2022-04-09
775	20	3	2022-01-13
776	11	2	2023-08-09
777	1	2	2023-12-25
778	11	2	2023-08-15
779	6	1	2024-03-13
780	27	1	2024-10-23
781	15	1	2024-07-19
782	18	2	2023-04-27
783	12	2	2023-11-22
784	16	1	2024-06-27
785	30	1	2024-09-27
786	36	3	2022-03-27
787	6	1	2024-03-20
788	17	3	2022-07-21
789	16	1	2024-06-20
790	7	2	2023-10-03
791	32	2	2023-01-07
792	18	2	2023-04-05
793	21	3	2022-04-07
794	35	3	2022-06-12
795	8	3	2022-12-03
796	31	1	2024-12-14
797	24	2	2023-05-20
798	30	1	2024-09-08
799	5	1	2024-01-23
800	28	3	2022-09-22
801	30	1	2024-09-16
802	7	2	2023-10-08
803	1	2	2023-12-28
804	35	3	2022-06-04
805	32	2	2023-01-15
806	7	2	2023-10-07
807	24	2	2023-05-18
808	11	2	2023-08-19
809	5	1	2024-01-07
810	23	3	2022-02-23
811	25	1	2024-04-07
812	4	2	2023-06-20
813	9	3	2022-10-11
814	29	2	2023-07-05
815	26	3	2022-05-18
816	29	2	2023-07-18
817	28	3	2022-09-15
818	15	1	2024-07-17
819	12	2	2023-11-05
820	24	2	2023-05-27
821	33	2	2023-09-02
822	9	3	2022-10-20
823	33	2	2023-09-09
824	12	2	2023-11-06
825	20	3	2022-01-23
826	30	1	2024-09-10
827	13	3	2022-11-11
828	15	1	2024-07-13
829	14	3	2022-08-20
830	4	2	2023-06-15
831	27	1	2024-10-06
832	7	2	2023-10-26
833	23	3	2022-02-07
834	21	3	2022-04-05
835	29	2	2023-07-27
836	5	1	2024-01-14
837	1	2	2023-12-02
838	26	3	2022-05-24
839	17	3	2022-07-17
840	34	2	2023-02-28
841	15	1	2024-07-26
842	34	2	2023-02-24
843	24	2	2023-05-06
844	25	1	2024-04-11
845	29	2	2023-07-14
846	9	3	2022-10-01
847	27	1	2024-10-09
848	6	1	2024-03-04
849	30	1	2024-09-14
850	21	3	2022-04-17
851	12	2	2023-11-14
852	5	1	2024-01-19
853	19	2	2023-03-14
854	34	2	2023-02-02
855	36	3	2022-03-05
856	16	1	2024-06-07
857	20	3	2022-01-21
858	2	1	2024-08-05
859	2	1	2024-08-10
860	24	2	2023-05-25
861	10	1	2024-11-26
862	18	2	2023-04-25
863	33	2	2023-09-10
864	17	3	2022-07-25
865	13	3	2022-11-24
866	2	1	2024-08-07
867	11	2	2023-08-05
868	15	1	2024-07-24
869	1	2	2023-12-21
870	3	1	2024-02-08
871	9	3	2022-10-19
872	8	3	2022-12-01
873	26	3	2022-05-03
874	35	3	2022-06-17
875	4	2	2023-06-08
876	5	1	2024-01-08
877	17	3	2022-07-09
878	4	2	2023-06-09
879	19	2	2023-03-06
\.


--
-- Data for Name: dim_employee; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_employee (employee_id, name, dob, identitynumber, store_id) FROM stdin;
1	employee 1	1993-06-25	abc1	1
2	employee 2	1994-04-23	abc2	1
3	employee 3	1996-10-20	abc3	1
4	employee 4	2000-09-19	abc4	1
5	employee 5	1995-03-18	abc5	2
6	employee 6	1992-05-17	abc6	2
7	employee 7	2000-04-07	abc7	2
8	employee 8	1997-12-25	abc8	2
9	employee 9	1995-06-15	abc9	2
10	employee 10	1997-08-28	abc10	2
11	employee 11	1999-08-17	abc11	3
12	employee 12	2000-04-18	abc12	3
13	employee 13	1997-10-21	abc13	3
14	employee 14	1994-06-17	abc14	3
15	employee 15	2000-07-05	abc15	3
16	employee 16	1992-05-28	abc16	3
17	employee 17	1995-01-17	abc17	4
18	employee 18	1991-02-07	abc18	4
19	employee 19	1993-06-05	abc19	4
20	employee 20	1990-09-17	abc20	4
21	employee 21	1992-11-24	abc21	4
22	employee 22	1996-01-22	abc22	4
23	employee 23	1994-05-06	abc23	5
24	employee 24	1991-05-21	abc24	5
25	employee 25	1997-10-21	abc25	5
26	employee 26	1994-02-27	abc26	5
27	employee 27	1995-12-01	abc27	5
28	employee 28	2000-12-18	abc28	6
29	employee 29	1996-09-06	abc29	6
30	employee 30	1995-08-14	abc30	6
31	employee 31	1999-05-03	abc31	6
32	employee 32	1996-06-16	abc32	6
33	employee 33	1993-10-10	abc33	6
34	employee 34	2000-03-12	abc34	7
35	employee 35	1991-07-05	abc35	7
36	employee 36	1998-03-15	abc36	7
37	employee 37	1997-03-25	abc37	7
38	employee 38	1991-07-28	abc38	7
39	employee 39	1991-10-01	abc39	8
40	employee 40	1999-06-07	abc40	8
41	employee 41	1991-12-02	abc41	8
42	employee 42	1994-08-06	abc42	8
43	employee 43	1993-08-25	abc43	8
44	employee 44	1993-06-21	abc44	8
45	employee 45	1999-08-18	abc45	9
46	employee 46	1993-11-07	abc46	9
47	employee 47	1992-04-12	abc47	9
48	employee 48	1992-06-24	abc48	9
49	employee 49	1997-05-02	abc49	10
50	employee 50	2000-07-05	abc50	10
51	employee 51	1991-06-19	abc51	10
52	employee 52	1996-02-06	abc52	10
53	employee 53	1993-09-27	abc53	10
54	employee 54	1993-01-04	abc54	11
55	employee 55	2000-05-12	abc55	11
56	employee 56	1994-10-08	abc56	11
57	employee 57	1996-01-13	abc57	11
58	employee 58	1994-01-27	abc58	12
59	employee 59	2000-10-02	abc59	12
60	employee 60	1990-04-13	abc60	12
61	employee 61	1993-07-27	abc61	12
62	employee 62	1999-04-11	abc62	13
63	employee 63	1997-11-08	abc63	13
64	employee 64	1992-11-11	abc64	13
65	employee 65	1996-04-21	abc65	13
66	employee 66	1994-07-07	abc66	13
67	employee 67	1995-10-01	abc67	13
68	employee 68	2000-09-20	abc68	14
69	employee 69	1992-09-25	abc69	14
70	employee 70	1994-11-17	abc70	14
71	employee 71	1996-07-22	abc71	14
72	employee 72	1998-06-09	abc72	15
73	employee 73	1996-09-19	abc73	15
74	employee 74	1992-05-14	abc74	15
75	employee 75	1993-12-20	abc75	15
76	employee 76	1993-12-14	abc76	15
77	employee 77	1990-09-08	abc77	16
78	employee 78	1997-03-08	abc78	16
79	employee 79	1996-05-20	abc79	16
80	employee 80	1999-04-18	abc80	16
81	employee 81	1992-02-22	abc81	16
82	employee 82	1997-02-16	abc82	16
83	employee 83	1999-03-16	abc83	17
84	employee 84	1999-07-28	abc84	17
85	employee 85	1999-11-20	abc85	17
86	employee 86	1999-08-05	abc86	17
87	employee 87	1998-07-08	abc87	17
88	employee 88	1991-11-16	abc88	17
89	employee 89	1990-02-07	abc89	18
90	employee 90	1994-09-17	abc90	18
91	employee 91	1999-06-11	abc91	18
92	employee 92	1997-11-17	abc92	18
93	employee 93	1992-04-01	abc93	18
94	employee 94	1995-02-25	abc94	18
95	employee 95	1994-07-14	abc95	19
96	employee 96	1996-05-21	abc96	19
97	employee 97	1995-12-20	abc97	19
98	employee 98	1994-03-23	abc98	19
99	employee 99	1993-05-03	abc99	20
100	employee 100	1994-09-05	abc100	20
101	employee 101	1990-04-13	abc101	20
102	employee 102	1996-11-11	abc102	20
103	employee 103	1998-04-03	abc103	20
104	employee 104	1992-03-06	abc104	21
105	employee 105	1997-12-04	abc105	21
106	employee 106	1997-08-03	abc106	21
107	employee 107	1996-12-26	abc107	21
108	employee 108	1998-11-11	abc108	22
109	employee 109	1992-08-13	abc109	22
110	employee 110	1998-07-11	abc110	22
111	employee 111	1990-11-21	abc111	22
112	employee 112	1995-09-07	abc112	22
113	employee 113	1992-10-10	abc113	22
114	employee 114	1996-04-24	abc114	23
115	employee 115	2000-08-12	abc115	23
116	employee 116	1994-09-01	abc116	23
117	employee 117	1998-02-12	abc117	23
118	employee 118	1992-02-22	abc118	23
119	employee 119	1994-02-28	abc119	23
120	employee 120	1997-06-10	abc120	24
121	employee 121	1998-06-25	abc121	24
122	employee 122	1990-04-12	abc122	24
123	employee 123	1994-08-17	abc123	24
124	employee 124	2000-03-09	abc124	25
125	employee 125	1994-02-06	abc125	25
126	employee 126	1996-07-02	abc126	25
127	employee 127	1999-08-11	abc127	25
128	employee 128	1991-07-19	abc128	25
129	employee 129	1998-11-15	abc129	26
130	employee 130	1993-09-14	abc130	26
131	employee 131	1991-05-03	abc131	26
132	employee 132	2000-03-09	abc132	26
133	employee 133	1995-10-21	abc133	26
134	employee 134	1992-09-13	abc134	26
135	employee 135	1996-07-13	abc135	27
136	employee 136	1995-05-25	abc136	27
137	employee 137	2000-04-01	abc137	27
138	employee 138	1994-12-09	abc138	27
139	employee 139	1997-01-14	abc139	27
140	employee 140	1992-01-12	abc140	28
141	employee 141	1990-11-16	abc141	28
142	employee 142	1994-10-04	abc142	28
143	employee 143	2000-11-02	abc143	28
144	employee 144	1996-08-22	abc144	28
145	employee 145	1993-07-13	abc145	28
146	employee 146	1995-05-08	abc146	29
147	employee 147	1998-06-06	abc147	29
148	employee 148	1992-12-17	abc148	29
149	employee 149	1999-12-28	abc149	29
150	employee 150	1996-01-09	abc150	30
151	employee 151	1991-01-01	abc151	30
152	employee 152	1990-03-05	abc152	30
153	employee 153	1996-02-04	abc153	30
154	employee 154	2000-03-17	abc154	30
155	employee 155	1999-02-13	abc155	31
156	employee 156	1992-09-19	abc156	31
157	employee 157	1992-04-02	abc157	31
158	employee 158	1995-07-10	abc158	31
159	employee 159	1995-02-19	abc159	31
160	employee 160	1991-03-04	abc160	31
161	employee 161	1993-03-28	abc161	32
162	employee 162	1991-08-13	abc162	32
163	employee 163	1994-06-06	abc163	32
164	employee 164	2000-07-13	abc164	32
165	employee 165	1997-06-02	abc165	33
166	employee 166	1999-09-10	abc166	33
167	employee 167	1994-07-01	abc167	33
168	employee 168	1990-03-27	abc168	33
169	employee 169	1991-04-09	abc169	34
170	employee 170	1992-05-21	abc170	34
171	employee 171	1991-03-24	abc171	34
172	employee 172	1991-03-05	abc172	34
173	employee 173	1994-11-13	abc173	35
174	employee 174	1997-08-07	abc174	35
175	employee 175	1997-09-07	abc175	35
176	employee 176	1995-07-12	abc176	35
177	employee 177	1990-01-18	abc177	35
178	employee 178	2000-02-02	abc178	35
179	employee 179	1990-09-18	abc179	36
180	employee 180	1991-12-15	abc180	36
181	employee 181	1992-01-01	abc181	36
182	employee 182	1990-06-12	abc182	36
183	employee 183	1999-10-15	abc183	36
184	employee 184	2000-09-24	abc184	36
185	employee 185	1993-11-03	abc185	37
186	employee 186	1993-07-14	abc186	37
187	employee 187	1994-09-12	abc187	37
188	employee 188	2000-10-12	abc188	37
189	employee 189	1997-05-13	abc189	37
190	employee 190	1992-07-12	abc190	37
191	employee 191	1997-06-03	abc191	38
192	employee 192	1998-11-15	abc192	38
193	employee 193	1994-10-12	abc193	38
194	employee 194	1997-01-22	abc194	38
195	employee 195	1997-08-25	abc195	39
196	employee 196	1995-03-26	abc196	39
197	employee 197	1993-06-13	abc197	39
198	employee 198	1996-05-17	abc198	39
199	employee 199	1990-09-19	abc199	39
200	employee 200	1994-09-20	abc200	39
201	employee 201	1998-01-18	abc201	40
202	employee 202	1995-05-08	abc202	40
203	employee 203	1994-12-16	abc203	40
204	employee 204	1996-09-23	abc204	40
205	employee 205	1996-10-24	abc205	41
206	employee 206	1992-10-19	abc206	41
207	employee 207	1991-10-24	abc207	41
208	employee 208	1991-04-21	abc208	41
209	employee 209	1999-09-28	abc209	41
210	employee 210	1997-04-28	abc210	41
211	employee 211	1993-03-24	abc211	42
212	employee 212	1995-11-17	abc212	42
213	employee 213	1991-12-23	abc213	42
214	employee 214	1995-03-23	abc214	42
215	employee 215	1998-10-12	abc215	43
216	employee 216	1990-09-15	abc216	43
217	employee 217	1996-04-26	abc217	43
218	employee 218	1996-08-19	abc218	43
219	employee 219	1999-04-06	abc219	43
220	employee 220	1996-05-26	abc220	44
221	employee 221	1991-06-23	abc221	44
222	employee 222	1993-07-26	abc222	44
223	employee 223	1998-06-16	abc223	44
224	employee 224	1997-07-10	abc224	44
225	employee 225	1997-08-21	abc225	44
226	employee 226	2000-05-09	abc226	45
227	employee 227	1996-06-21	abc227	45
228	employee 228	2000-11-06	abc228	45
229	employee 229	1996-07-06	abc229	45
230	employee 230	1997-10-21	abc230	46
231	employee 231	1990-10-10	abc231	46
232	employee 232	1997-11-24	abc232	46
233	employee 233	1991-05-17	abc233	46
234	employee 234	1991-10-04	abc234	46
235	employee 235	1998-09-19	abc235	46
236	employee 236	1997-03-12	abc236	47
237	employee 237	1997-12-01	abc237	47
238	employee 238	1998-04-15	abc238	47
239	employee 239	1996-09-15	abc239	47
240	employee 240	1991-07-08	abc240	48
241	employee 241	1999-05-20	abc241	48
242	employee 242	1996-03-13	abc242	48
243	employee 243	1995-02-12	abc243	48
244	employee 244	1992-05-23	abc244	48
245	employee 245	1996-06-15	abc245	48
246	employee 246	1994-12-15	abc246	49
247	employee 247	1996-04-12	abc247	49
248	employee 248	2000-07-14	abc248	49
249	employee 249	1990-09-14	abc249	49
250	employee 250	1993-12-16	abc250	50
251	employee 251	1996-11-19	abc251	50
252	employee 252	1998-03-03	abc252	50
253	employee 253	1994-08-09	abc253	50
\.


--
-- Data for Name: dim_month; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_month (month_id, year_id, quarter_id, month, name) FROM stdin;
1	2	4	12	December
2	1	3	8	August
3	1	1	2	February
4	2	2	6	June
5	1	1	1	January
6	1	1	3	March
7	2	4	10	October
8	3	4	12	December
9	3	4	10	October
10	1	4	11	November
11	2	3	8	August
12	2	4	11	November
13	3	4	11	November
14	3	3	8	August
15	1	3	7	July
16	1	2	6	June
17	3	3	7	July
18	2	2	4	April
19	2	1	3	March
20	3	1	1	January
21	3	2	4	April
22	1	2	5	May
23	3	1	2	February
24	2	2	5	May
25	1	2	4	April
26	3	2	5	May
27	1	4	10	October
28	3	3	9	September
29	2	3	7	July
30	1	3	9	September
31	1	4	12	December
32	2	1	1	January
33	2	3	9	September
34	2	1	2	February
35	3	2	6	June
36	3	1	3	March
\.


--
-- Data for Name: dim_product; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_product (product_id, name, description, size, color, brand_id, category_id, standardprice, price) FROM stdin;
1	product 1	des 1	2	blue	11	24	3843.75	5736.94
2	product 2	des 2	8	red	8	9	1708.60	2010.12
3	product 3	des 3	7	blue	9	11	6482.75	8643.67
4	product 4	des 4	2	blue	16	2	5085.01	6871.63
5	product 5	des 5	3	blue	10	25	5672.78	8727.36
6	product 6	des 6	9	blue	7	18	4121.16	5645.42
7	product 7	des 7	9	red	9	6	3989.99	4694.11
8	product 8	des 8	7	green	16	30	2448.84	3354.58
9	product 9	des 9	1	blue	8	10	5057.53	7329.76
10	product 10	des 10	8	green	12	24	1752.28	2826.25
11	product 11	des 11	8	green	5	10	1468.19	2446.98
12	product 12	des 12	6	red	11	17	8162.24	9834.03
13	product 13	des 13	4	red	11	17	7010.11	8247.19
14	product 14	des 14	8	blue	14	21	5838.68	7682.48
15	product 15	des 15	5	blue	18	3	4066.35	5280.98
16	product 16	des 16	1	blue	15	10	3284.76	4005.80
17	product 17	des 17	8	red	1	17	1693.01	1902.26
18	product 18	des 18	1	blue	5	27	8191.28	9989.37
19	product 19	des 19	2	green	11	29	8564.55	9844.31
20	product 20	des 20	2	blue	8	8	2154.87	2693.59
21	product 21	des 21	3	red	6	26	449.88	517.10
22	product 22	des 22	7	red	15	20	2519.98	2799.98
23	product 23	des 23	8	blue	19	8	4141.03	5672.64
24	product 24	des 24	10	red	16	24	1028.45	1301.84
25	product 25	des 25	6	green	20	15	3852.42	6019.41
26	product 26	des 26	3	green	15	7	3296.43	3662.70
27	product 27	des 27	10	red	13	2	3028.87	4589.19
28	product 28	des 28	4	green	10	24	6245.11	7710.01
29	product 29	des 29	2	red	11	11	4700.10	6025.77
30	product 30	des 30	8	blue	17	22	5562.43	6544.04
31	product 31	des 31	9	red	15	14	2864.71	4212.81
32	product 32	des 32	5	green	18	18	3288.86	5391.57
33	product 33	des 33	9	blue	11	21	2768.14	3954.49
34	product 34	des 34	8	red	20	12	3498.19	5381.83
35	product 35	des 35	6	blue	16	12	2151.70	2947.54
36	product 36	des 36	6	blue	14	27	5182.93	7198.51
37	product 37	des 37	2	blue	6	7	8523.00	9470.00
38	product 38	des 38	8	green	17	4	3571.90	4893.02
39	product 39	des 39	1	blue	13	2	7535.54	8865.34
40	product 40	des 40	1	red	14	28	3471.09	4450.12
41	product 41	des 41	5	green	6	17	303.97	428.13
42	product 42	des 42	8	blue	15	22	3525.26	5261.58
43	product 43	des 43	7	red	20	10	8011.42	9652.31
44	product 44	des 44	5	red	3	4	5067.47	6414.52
45	product 45	des 45	5	blue	1	17	7614.84	8854.47
46	product 46	des 46	5	green	16	21	7737.86	9920.33
47	product 47	des 47	10	green	17	3	2488.58	4147.63
48	product 48	des 48	6	blue	14	10	2440.70	4001.14
49	product 49	des 49	9	blue	12	19	8083.37	9082.44
50	product 50	des 50	8	red	1	7	1463.79	1978.09
51	product 51	des 51	3	blue	1	25	4768.10	5480.57
52	product 52	des 52	6	red	14	7	4173.26	4636.96
53	product 53	des 53	3	red	10	24	8699.74	9774.99
54	product 54	des 54	1	red	3	21	100.61	143.73
55	product 55	des 55	5	red	13	23	7608.48	8646.00
56	product 56	des 56	1	green	9	19	4630.13	7716.88
57	product 57	des 57	3	blue	11	24	2430.05	3197.43
58	product 58	des 58	8	green	18	1	7647.42	9559.28
59	product 59	des 59	6	blue	9	3	2748.77	3765.44
60	product 60	des 60	3	blue	16	15	2401.75	2698.60
61	product 61	des 61	10	green	11	9	1067.67	1750.28
62	product 62	des 62	7	blue	3	8	3416.38	4436.86
63	product 63	des 63	7	blue	19	4	6500.91	7739.18
64	product 64	des 64	7	red	4	23	1626.39	2464.22
65	product 65	des 65	10	blue	16	12	5300.30	6543.58
66	product 66	des 66	4	blue	2	30	1307.55	2143.52
67	product 67	des 67	9	red	13	14	5877.11	6996.56
68	product 68	des 68	8	green	1	16	4818.88	7772.38
69	product 69	des 69	8	red	16	15	4529.30	6379.30
70	product 70	des 70	3	red	16	23	1860.81	2269.28
71	product 71	des 71	1	green	17	20	3027.49	3832.26
72	product 72	des 72	3	green	20	26	6553.39	7801.66
73	product 73	des 73	7	blue	5	6	2072.74	2355.39
74	product 74	des 74	7	green	9	13	273.39	355.05
75	product 75	des 75	1	blue	4	16	3589.26	3988.07
76	product 76	des 76	10	red	6	8	939.83	1540.71
77	product 77	des 77	2	blue	5	4	5288.11	6867.68
78	product 78	des 78	2	red	15	17	5584.75	6493.90
79	product 79	des 79	2	blue	13	13	7340.57	9062.43
80	product 80	des 80	8	red	5	19	2933.90	4809.68
81	product 81	des 81	8	green	19	6	3790.94	6114.42
82	product 82	des 82	10	green	1	21	5448.93	7169.65
83	product 83	des 83	3	red	1	5	5110.87	7862.87
84	product 84	des 84	10	blue	12	18	1707.42	1918.45
85	product 85	des 85	1	blue	1	29	2566.56	3564.67
86	product 86	des 86	9	blue	9	30	6445.41	7242.03
87	product 87	des 87	10	red	15	2	5180.03	5886.40
88	product 88	des 88	9	blue	17	26	1242.93	1750.61
89	product 89	des 89	7	red	7	16	3640.94	5779.27
90	product 90	des 90	7	green	16	5	4297.65	5654.80
91	product 91	des 91	2	green	9	21	7656.78	9943.87
92	product 92	des 92	8	red	17	22	3707.67	5704.10
93	product 93	des 93	10	red	19	14	3412.20	5017.94
94	product 94	des 94	2	blue	12	5	6117.60	8739.43
95	product 95	des 95	1	green	5	14	3553.32	4801.78
96	product 96	des 96	4	blue	10	1	6602.87	7860.56
97	product 97	des 97	5	blue	17	20	8015.23	9656.90
98	product 98	des 98	2	red	6	10	718.38	970.78
99	product 99	des 99	8	green	2	5	2834.80	4724.66
100	product 100	des 100	6	blue	15	14	4529.05	5732.97
101	product 101	des 101	2	green	4	28	6202.41	8496.45
102	product 102	des 102	1	red	14	3	4073.82	4849.79
103	product 103	des 103	9	red	7	24	2128.14	2728.39
104	product 104	des 104	5	green	2	24	3754.53	6154.97
105	product 105	des 105	3	red	3	28	2436.58	3531.27
106	product 106	des 106	4	blue	4	13	7096.33	8654.06
107	product 107	des 107	8	green	3	7	5774.50	8491.91
108	product 108	des 108	10	blue	8	2	5322.04	6188.42
109	product 109	des 109	10	green	17	30	2816.70	3858.49
110	product 110	des 110	9	red	14	1	7761.22	9350.87
111	product 111	des 111	5	green	14	1	7538.79	9307.15
112	product 112	des 112	10	green	8	21	2350.58	2611.75
113	product 113	des 113	6	red	16	11	894.12	1176.48
114	product 114	des 114	10	red	7	14	6829.24	9485.06
115	product 115	des 115	8	red	12	8	3547.68	4490.73
116	product 116	des 116	5	red	13	9	1793.43	2241.79
117	product 117	des 117	1	green	17	11	2170.15	3616.91
118	product 118	des 118	2	blue	19	13	1705.67	2336.54
119	product 119	des 119	1	blue	10	4	1268.23	1713.82
120	product 120	des 120	1	green	8	10	6123.85	7953.05
121	product 121	des 121	1	red	5	3	6109.56	6864.67
122	product 122	des 122	2	blue	11	23	5133.94	7662.60
123	product 123	des 123	5	red	7	6	1794.83	2162.44
124	product 124	des 124	3	blue	2	25	3323.56	4747.94
125	product 125	des 125	2	red	5	30	2255.69	3524.51
126	product 126	des 126	8	blue	12	3	3749.45	4260.74
127	product 127	des 127	6	blue	16	29	3697.61	5963.89
128	product 128	des 128	7	green	3	24	2677.47	3149.96
129	product 129	des 129	3	red	11	23	6984.18	8730.23
130	product 130	des 130	5	green	19	14	6997.91	8232.83
131	product 131	des 131	8	blue	19	29	298.27	473.45
132	product 132	des 132	10	red	14	3	2042.45	3048.43
133	product 133	des 133	8	green	15	29	2811.86	4260.39
134	product 134	des 134	8	blue	9	23	4012.86	4834.77
135	product 135	des 135	1	green	9	12	4550.51	5353.54
136	product 136	des 136	3	green	7	4	4173.35	5419.93
137	product 137	des 137	6	blue	4	30	4342.70	6386.32
138	product 138	des 138	7	red	15	22	3914.25	4398.03
139	product 139	des 139	7	blue	8	3	7147.51	9047.48
140	product 140	des 140	7	blue	6	30	5059.76	7551.88
141	product 141	des 141	9	red	18	30	5098.52	6069.67
142	product 142	des 142	4	green	20	23	3359.99	4540.53
143	product 143	des 143	8	blue	19	16	2538.38	4094.16
144	product 144	des 144	2	green	19	7	5415.55	7521.60
145	product 145	des 145	3	blue	6	14	4823.24	7536.31
146	product 146	des 146	7	red	14	10	2878.69	3271.24
147	product 147	des 147	4	green	17	13	6365.10	8160.39
148	product 148	des 148	2	red	12	19	1152.02	1645.74
149	product 149	des 149	7	red	19	4	5436.20	6395.53
150	product 150	des 150	10	red	4	13	5815.89	8308.42
151	product 151	des 151	10	red	4	17	2956.20	3649.63
152	product 152	des 152	6	green	8	14	2042.53	2431.58
153	product 153	des 153	8	red	3	2	312.12	511.67
154	product 154	des 154	1	red	5	1	4726.07	5763.50
155	product 155	des 155	5	blue	20	6	3953.26	5342.25
156	product 156	des 156	9	green	6	14	950.15	1144.76
157	product 157	des 157	3	red	4	30	1061.00	1433.78
158	product 158	des 158	7	green	18	23	5941.30	8737.20
159	product 159	des 159	4	green	15	26	3048.34	4233.80
160	product 160	des 160	3	green	1	13	356.54	524.32
161	product 161	des 161	3	red	13	20	4945.64	7608.68
162	product 162	des 162	9	green	4	25	7342.05	8953.72
163	product 163	des 163	6	red	5	9	2493.94	3370.19
164	product 164	des 164	6	green	17	2	2005.78	2571.51
165	product 165	des 165	3	green	2	17	1810.66	2480.35
166	product 166	des 166	5	green	10	2	4441.84	7164.26
167	product 167	des 167	4	green	11	1	6570.18	7466.11
168	product 168	des 168	4	blue	16	13	584.97	657.27
169	product 169	des 169	3	blue	16	14	6245.85	7435.54
170	product 170	des 170	2	green	15	7	5755.19	9282.56
171	product 171	des 171	9	green	5	15	6054.97	9174.19
172	product 172	des 172	8	red	11	5	70.89	109.06
173	product 173	des 173	9	red	14	23	4103.96	6412.43
174	product 174	des 174	8	red	17	11	4591.10	6376.53
175	product 175	des 175	3	green	16	14	8223.81	9908.21
176	product 176	des 176	9	green	7	20	3224.87	4886.16
177	product 177	des 177	1	green	18	16	4935.87	5739.38
178	product 178	des 178	2	red	1	3	5257.42	6185.20
179	product 179	des 179	1	blue	16	24	235.28	326.78
180	product 180	des 180	7	blue	7	25	2134.20	3557.00
181	product 181	des 181	7	blue	6	3	2534.90	3727.80
182	product 182	des 182	10	green	1	2	4384.48	6354.32
183	product 183	des 183	5	red	18	8	320.79	433.50
184	product 184	des 184	10	blue	3	18	1090.53	1787.76
185	product 185	des 185	6	red	14	2	6177.23	7721.54
186	product 186	des 186	8	red	12	15	2627.45	3243.76
187	product 187	des 187	5	green	15	8	1334.34	1499.26
188	product 188	des 188	2	green	3	7	973.92	1145.79
189	product 189	des 189	7	red	10	5	977.58	1221.98
190	product 190	des 190	6	blue	19	10	4081.57	5668.85
191	product 191	des 191	10	blue	7	27	2535.17	3054.42
192	product 192	des 192	2	red	6	22	2230.36	3055.29
193	product 193	des 193	3	blue	7	3	3842.00	5122.67
194	product 194	des 194	2	green	5	11	4621.64	5437.22
195	product 195	des 195	3	red	1	13	8838.86	9931.30
196	product 196	des 196	4	green	12	20	1777.84	2614.47
197	product 197	des 197	10	blue	9	13	4052.03	5402.71
198	product 198	des 198	5	green	4	15	5941.52	7520.91
199	product 199	des 199	4	green	6	29	4950.49	6037.18
200	product 200	des 200	2	blue	18	26	6074.78	7889.32
201	product 201	des 201	9	green	4	18	3315.01	4042.70
202	product 202	des 202	7	green	1	8	7292.50	8786.15
203	product 203	des 203	5	green	9	11	4579.43	6938.53
204	product 204	des 204	4	green	1	26	1977.09	2907.48
205	product 205	des 205	9	green	14	2	179.35	229.93
206	product 206	des 206	10	blue	18	1	6772.45	8062.44
207	product 207	des 207	8	red	4	28	4825.43	7311.26
208	product 208	des 208	4	blue	12	21	5074.97	7574.58
209	product 209	des 209	9	blue	1	3	1045.82	1634.10
210	product 210	des 210	7	red	5	9	3738.44	5340.63
211	product 211	des 211	10	red	3	18	1148.89	1740.75
212	product 212	des 212	7	green	1	14	4154.40	5128.89
213	product 213	des 213	2	green	7	27	932.27	1059.40
214	product 214	des 214	7	green	6	22	443.90	548.02
215	product 215	des 215	3	green	17	11	7607.99	9630.37
216	product 216	des 216	4	green	12	26	3599.86	4999.81
217	product 217	des 217	6	blue	6	22	3097.80	4693.63
218	product 218	des 218	3	blue	18	27	6712.24	7627.55
219	product 219	des 219	9	red	11	30	5581.24	9149.57
220	product 220	des 220	10	blue	1	22	3732.20	4724.31
221	product 221	des 221	8	green	7	1	4609.35	6584.79
222	product 222	des 222	1	red	16	20	7774.69	8638.54
223	product 223	des 223	3	red	3	26	7747.54	8608.38
224	product 224	des 224	5	green	1	25	6630.29	7534.42
225	product 225	des 225	5	green	9	10	3901.96	5655.02
226	product 226	des 226	7	red	8	20	3893.45	4475.23
227	product 227	des 227	10	green	2	21	4965.40	7411.05
228	product 228	des 228	9	green	4	8	4562.73	7242.43
229	product 229	des 229	6	green	16	12	2052.12	2773.13
230	product 230	des 230	2	red	10	30	5317.26	6111.79
231	product 231	des 231	10	red	13	22	5410.86	7119.55
232	product 232	des 232	4	blue	12	30	7877.34	9971.32
233	product 233	des 233	4	red	10	5	2950.42	4539.11
234	product 234	des 234	4	red	4	8	5088.73	5986.74
235	product 235	des 235	3	green	2	12	4457.43	5714.65
236	product 236	des 236	10	green	20	28	4010.28	5569.83
237	product 237	des 237	4	green	7	23	6030.46	7831.77
238	product 238	des 238	4	red	11	14	4403.08	7101.74
239	product 239	des 239	10	blue	13	26	1408.45	2041.23
240	product 240	des 240	1	blue	9	18	1436.40	1651.04
241	product 241	des 241	8	red	1	27	4510.23	5857.44
242	product 242	des 242	10	red	19	25	6698.10	9997.17
243	product 243	des 243	7	blue	12	16	745.43	1049.90
244	product 244	des 244	5	green	2	9	3747.82	6143.96
245	product 245	des 245	7	red	17	20	5687.03	8009.90
246	product 246	des 246	3	green	11	14	922.79	1247.02
247	product 247	des 247	3	blue	13	10	5390.48	6268.00
248	product 248	des 248	2	green	15	10	2060.44	2822.52
249	product 249	des 249	6	green	15	27	7104.72	8166.35
250	product 250	des 250	8	blue	14	29	2542.41	3738.84
251	product 251	des 251	4	blue	20	28	3931.85	5698.33
252	product 252	des 252	3	green	9	11	6794.55	7721.08
253	product 253	des 253	2	red	4	16	643.80	847.11
254	product 254	des 254	5	blue	9	14	1082.34	1803.90
255	product 255	des 255	7	blue	19	10	316.83	511.02
256	product 256	des 256	4	blue	5	16	100.89	162.73
257	product 257	des 257	3	red	1	17	4067.11	4729.20
258	product 258	des 258	1	green	19	1	5643.48	9251.61
259	product 259	des 259	6	red	5	5	7463.96	8293.29
260	product 260	des 260	1	blue	13	4	396.47	489.47
261	product 261	des 261	9	red	1	4	1465.39	2289.67
262	product 262	des 262	2	red	11	12	5292.53	7560.76
263	product 263	des 263	5	green	14	27	7591.60	9372.34
264	product 264	des 264	1	red	3	6	7795.86	9064.95
265	product 265	des 265	3	red	2	26	1121.22	1334.78
266	product 266	des 266	6	green	1	18	4294.18	6606.43
267	product 267	des 267	5	green	3	2	5111.79	6470.62
268	product 268	des 268	8	red	10	16	6192.17	6880.19
269	product 269	des 269	8	red	10	28	6805.53	8506.91
270	product 270	des 270	2	green	4	21	174.45	260.37
271	product 271	des 271	1	blue	1	10	4840.26	5975.63
272	product 272	des 272	7	green	7	20	2395.03	2956.83
273	product 273	des 273	5	blue	9	2	2942.45	3632.66
274	product 274	des 274	4	red	15	10	3390.21	4185.45
275	product 275	des 275	10	blue	5	10	4964.97	7301.42
276	product 276	des 276	6	red	5	14	6154.43	9616.30
277	product 277	des 277	1	blue	17	26	7869.86	8842.54
278	product 278	des 278	3	red	12	14	5747.22	8210.32
279	product 279	des 279	4	blue	11	22	2757.02	3580.55
280	product 280	des 280	10	blue	6	18	4880.26	8133.77
281	product 281	des 281	9	blue	10	13	3605.64	4622.61
282	product 282	des 282	9	blue	17	3	1755.07	2877.16
283	product 283	des 283	1	red	11	10	7871.29	9599.13
284	product 284	des 284	3	blue	9	5	1501.37	1706.10
285	product 285	des 285	4	blue	16	7	2504.20	2946.12
286	product 286	des 286	5	green	14	3	3339.87	4704.04
287	product 287	des 287	8	green	4	20	1830.72	2905.90
288	product 288	des 288	6	blue	9	13	675.88	993.94
289	product 289	des 289	7	red	10	13	4710.15	5887.69
290	product 290	des 290	5	red	18	5	6923.89	8876.78
291	product 291	des 291	4	red	14	5	1562.02	2403.11
292	product 292	des 292	10	green	10	19	5619.62	7914.96
293	product 293	des 293	4	green	10	28	3947.98	4934.98
294	product 294	des 294	3	blue	1	30	4830.28	5890.58
295	product 295	des 295	8	red	7	17	3824.27	4607.56
296	product 296	des 296	8	blue	12	14	4665.54	6138.87
297	product 297	des 297	1	green	7	12	6415.63	7729.68
298	product 298	des 298	4	green	2	9	6186.42	7193.51
299	product 299	des 299	3	red	14	21	7502.95	9039.70
300	product 300	des 300	5	green	2	10	5373.24	7901.82
301	product 301	des 301	4	blue	4	6	2100.52	2658.89
302	product 302	des 302	7	green	3	6	3913.46	6522.44
303	product 303	des 303	2	red	17	12	6103.03	9247.02
304	product 304	des 304	10	red	13	7	7022.64	8360.29
305	product 305	des 305	8	green	8	9	6300.75	9001.07
306	product 306	des 306	2	red	20	16	4404.69	7220.81
307	product 307	des 307	6	red	5	9	2369.53	3884.48
308	product 308	des 308	4	blue	15	4	767.44	1279.06
309	product 309	des 309	9	green	11	19	1275.64	1594.55
310	product 310	des 310	9	red	9	9	1179.58	1310.64
311	product 311	des 311	5	red	7	7	2187.42	3124.88
312	product 312	des 312	3	blue	20	28	6824.56	9749.37
313	product 313	des 313	9	green	9	6	5897.64	9361.33
314	product 314	des 314	4	red	1	11	4760.48	7105.20
315	product 315	des 315	9	green	13	26	3405.84	4423.17
316	product 316	des 316	10	red	13	23	2424.24	3787.88
317	product 317	des 317	7	blue	2	18	2475.81	3993.24
318	product 318	des 318	7	blue	16	18	2953.92	3692.40
319	product 319	des 319	1	blue	15	19	3888.55	6271.85
320	product 320	des 320	9	blue	15	22	5466.28	7288.37
321	product 321	des 321	1	green	20	10	4418.58	5813.92
322	product 322	des 322	4	blue	13	13	4733.53	7759.88
323	product 323	des 323	4	blue	1	16	1461.41	2087.73
324	product 324	des 324	6	green	9	17	4612.65	5913.65
325	product 325	des 325	2	red	6	9	5849.07	6963.18
326	product 326	des 326	8	red	13	30	6324.86	7713.25
327	product 327	des 327	3	blue	17	12	1013.44	1407.55
328	product 328	des 328	6	green	3	18	5413.88	7961.59
329	product 329	des 329	8	red	6	1	6066.27	8791.69
330	product 330	des 330	7	red	19	27	5210.92	7041.79
331	product 331	des 331	6	blue	2	15	1395.07	2146.26
332	product 332	des 332	2	green	14	11	7154.28	9667.95
333	product 333	des 333	1	red	9	5	1523.41	2176.30
334	product 334	des 334	9	green	9	22	6650.24	8750.31
335	product 335	des 335	7	red	3	29	4005.56	4551.77
336	product 336	des 336	3	green	8	10	3647.09	4192.06
337	product 337	des 337	8	green	7	24	5894.38	6934.56
338	product 338	des 338	4	green	14	28	1866.35	3110.59
339	product 339	des 339	6	red	15	22	4716.16	7485.97
340	product 340	des 340	2	blue	10	15	5581.94	7752.69
341	product 341	des 341	10	green	17	4	6974.50	9057.79
342	product 342	des 342	1	blue	16	8	5645.79	7951.81
343	product 343	des 343	2	green	11	15	8161.76	9602.07
344	product 344	des 344	9	blue	5	27	850.89	1037.67
345	product 345	des 345	7	green	11	19	7045.76	9923.60
346	product 346	des 346	5	blue	3	10	2925.72	4007.83
347	product 347	des 347	6	blue	15	13	5711.74	7230.05
348	product 348	des 348	5	green	5	1	408.58	669.80
349	product 349	des 349	5	green	19	15	3481.90	4904.09
350	product 350	des 350	1	blue	1	30	4290.05	7032.87
351	product 351	des 351	1	blue	18	5	187.82	208.69
352	product 352	des 352	6	red	18	27	7555.94	9564.48
353	product 353	des 353	1	blue	13	4	1575.84	2188.66
354	product 354	des 354	4	green	6	3	5477.74	6086.38
355	product 355	des 355	10	blue	9	16	8230.53	9570.38
356	product 356	des 356	8	red	9	30	3611.53	4458.68
357	product 357	des 357	9	red	6	15	6490.50	9406.52
358	product 358	des 358	1	red	1	20	17.22	24.60
359	product 359	des 359	6	red	18	19	3462.68	5168.18
360	product 360	des 360	7	red	1	30	1383.97	1667.43
361	product 361	des 361	4	red	18	23	3215.52	3921.36
362	product 362	des 362	4	red	10	4	6595.02	9421.45
363	product 363	des 363	3	blue	5	28	6842.55	7775.62
364	product 364	des 364	2	green	18	17	4635.28	6263.89
365	product 365	des 365	1	green	16	4	2408.79	3542.34
366	product 366	des 366	8	red	11	16	191.58	212.87
367	product 367	des 367	9	blue	3	2	119.34	161.27
368	product 368	des 368	4	red	11	5	2937.36	4257.05
369	product 369	des 369	2	blue	13	11	1867.05	2305.00
370	product 370	des 370	10	green	16	11	1098.18	1339.25
371	product 371	des 371	10	blue	2	5	3048.27	4119.28
372	product 372	des 372	7	blue	8	11	5841.68	8113.44
373	product 373	des 373	1	blue	10	27	7180.06	8159.16
374	product 374	des 374	7	green	12	11	1308.18	1655.92
375	product 375	des 375	9	green	9	16	4403.25	7338.75
376	product 376	des 376	4	red	1	5	3932.16	5386.52
377	product 377	des 377	4	green	2	20	1573.71	2098.28
378	product 378	des 378	6	green	17	17	3951.39	5986.95
379	product 379	des 379	5	green	11	20	6050.82	6798.67
380	product 380	des 380	8	blue	11	4	2019.23	2622.38
381	product 381	des 381	3	blue	18	19	829.64	1168.51
382	product 382	des 382	10	green	5	14	1800.52	2169.30
383	product 383	des 383	5	red	20	1	6199.67	7847.68
384	product 384	des 384	10	blue	2	16	8753.95	9835.90
385	product 385	des 385	3	green	6	13	4183.72	5731.13
386	product 386	des 386	3	blue	20	22	5024.16	7612.37
387	product 387	des 387	4	red	17	28	3727.06	5401.53
388	product 388	des 388	5	red	2	20	4129.19	5579.98
389	product 389	des 389	6	blue	19	1	586.15	960.90
390	product 390	des 390	1	green	4	29	1375.47	1637.47
391	product 391	des 391	8	red	9	12	470.53	566.90
392	product 392	des 392	8	red	13	12	4179.74	6530.85
393	product 393	des 393	10	blue	5	14	3076.65	4807.27
394	product 394	des 394	6	red	7	24	5041.30	6381.39
395	product 395	des 395	4	blue	19	13	6417.54	7639.93
396	product 396	des 396	4	green	15	19	2045.45	2691.38
397	product 397	des 397	6	green	13	29	4860.90	5461.68
398	product 398	des 398	9	green	1	18	2157.82	2766.44
399	product 399	des 399	7	red	2	7	2983.75	3875.00
400	product 400	des 400	7	blue	1	23	3812.32	5369.47
401	product 401	des 401	8	red	20	9	930.09	1162.61
402	product 402	des 402	10	red	14	3	3300.52	3882.97
403	product 403	des 403	7	green	13	3	617.52	693.84
404	product 404	des 404	5	green	18	27	6430.58	8931.36
405	product 405	des 405	7	green	9	6	3791.85	5495.44
406	product 406	des 406	6	blue	8	28	2242.16	3297.30
407	product 407	des 407	7	blue	14	29	2884.44	4437.60
408	product 408	des 408	3	blue	4	27	7164.30	9950.41
409	product 409	des 409	2	red	18	13	5367.39	6241.15
410	product 410	des 410	2	blue	19	16	772.70	1246.29
411	product 411	des 411	7	blue	14	30	5190.26	6569.95
412	product 412	des 412	4	green	16	28	7046.15	8006.99
413	product 413	des 413	9	green	16	15	1295.78	1704.97
414	product 414	des 414	2	green	3	1	5978.78	8303.86
415	product 415	des 415	7	green	11	6	5742.45	6525.51
416	product 416	des 416	2	red	5	12	1289.87	2080.43
417	product 417	des 417	3	green	7	1	3606.06	5226.18
418	product 418	des 418	7	red	14	3	1282.73	1545.46
419	product 419	des 419	1	red	2	9	2033.24	3176.93
420	product 420	des 420	5	green	8	13	3457.79	4939.70
421	product 421	des 421	4	green	12	8	1535.09	2192.99
422	product 422	des 422	9	blue	12	5	4566.23	5501.48
423	product 423	des 423	1	red	4	5	7343.78	8955.83
424	product 424	des 424	5	blue	4	28	3878.91	6256.31
425	product 425	des 425	9	red	11	19	2328.82	2805.81
426	product 426	des 426	9	green	18	1	3554.32	4442.90
427	product 427	des 427	5	red	4	2	1553.71	1894.77
428	product 428	des 428	3	blue	11	27	2958.90	4552.15
429	product 429	des 429	8	green	9	9	3707.36	4753.02
430	product 430	des 430	3	green	8	24	903.36	1088.39
431	product 431	des 431	1	green	15	17	1588.30	2089.87
432	product 432	des 432	3	green	3	28	1222.83	1588.09
433	product 433	des 433	10	green	11	25	867.91	1335.24
434	product 434	des 434	9	green	12	30	6829.20	8431.11
435	product 435	des 435	1	green	16	25	5140.96	7344.23
436	product 436	des 436	3	red	18	2	5130.23	6840.30
437	product 437	des 437	5	red	20	16	3520.50	5416.16
438	product 438	des 438	9	red	9	20	5160.71	6702.22
439	product 439	des 439	7	green	16	30	3652.53	4198.31
440	product 440	des 440	5	blue	9	18	6836.01	7680.91
441	product 441	des 441	2	green	18	30	5065.63	6754.17
442	product 442	des 442	4	blue	4	23	4588.55	5959.16
443	product 443	des 443	3	green	16	2	2054.53	2703.33
444	product 444	des 444	9	blue	4	6	6701.86	9855.68
445	product 445	des 445	8	blue	3	24	7050.66	8393.64
446	product 446	des 446	6	green	16	26	6707.92	9582.74
447	product 447	des 447	6	green	15	8	1401.08	2060.41
448	product 448	des 448	9	green	15	22	3434.46	4519.03
449	product 449	des 449	7	blue	18	16	7390.00	8694.12
450	product 450	des 450	1	red	1	24	6220.54	8406.13
451	product 451	des 451	10	red	14	26	6061.19	7482.95
452	product 452	des 452	4	red	2	28	1635.24	2336.06
453	product 453	des 453	10	red	14	17	6782.86	9043.82
454	product 454	des 454	10	blue	6	25	3967.92	4838.93
455	product 455	des 455	5	green	11	11	3457.79	3974.47
456	product 456	des 456	9	blue	18	15	4852.31	5391.46
457	product 457	des 457	5	green	11	19	1145.57	1660.24
458	product 458	des 458	2	blue	1	30	5006.73	7051.73
459	product 459	des 459	5	blue	6	16	388.11	597.09
460	product 460	des 460	9	blue	15	2	2395.11	3326.54
461	product 461	des 461	4	red	8	13	6229.71	6999.67
462	product 462	des 462	4	blue	12	3	3425.06	5189.49
463	product 463	des 463	10	green	18	11	7351.91	9425.53
464	product 464	des 464	5	red	10	17	338.79	521.21
465	product 465	des 465	7	red	4	22	2772.02	3600.03
466	product 466	des 466	5	blue	11	14	4985.46	7225.30
467	product 467	des 467	6	blue	18	18	6193.64	9528.67
468	product 468	des 468	3	red	7	15	1843.12	2094.46
469	product 469	des 469	10	green	16	3	25.47	36.39
470	product 470	des 470	1	blue	14	2	5560.76	7038.94
471	product 471	des 471	5	blue	2	24	5439.11	7350.15
472	product 472	des 472	5	red	6	24	5728.74	6365.27
473	product 473	des 473	1	blue	11	27	6488.14	8318.13
474	product 474	des 474	2	green	7	11	4209.79	5011.65
475	product 475	des 475	1	green	19	11	4062.53	5721.87
476	product 476	des 476	8	green	13	3	5757.31	8343.93
477	product 477	des 477	9	green	17	21	809.49	1226.50
478	product 478	des 478	7	red	14	10	6828.51	7848.86
479	product 479	des 479	6	red	8	11	566.58	643.84
480	product 480	des 480	5	green	2	13	4576.99	5514.45
481	product 481	des 481	3	green	7	26	7944.42	9930.52
482	product 482	des 482	1	red	2	1	2621.46	3360.84
483	product 483	des 483	1	green	12	22	6201.39	7382.61
484	product 484	des 484	8	green	19	27	6694.07	9046.04
485	product 485	des 485	10	blue	12	24	4860.51	7044.22
486	product 486	des 486	3	red	16	20	4848.46	6296.70
487	product 487	des 487	1	red	14	4	4660.88	6658.40
488	product 488	des 488	3	green	16	27	8567.36	9626.25
489	product 489	des 489	4	green	10	1	5397.21	7009.37
490	product 490	des 490	6	red	4	9	4128.83	4800.97
491	product 491	des 491	8	blue	4	3	5949.20	6999.06
492	product 492	des 492	9	red	3	14	1579.92	2051.85
493	product 493	des 493	8	green	13	1	2024.08	2498.87
494	product 494	des 494	1	blue	13	18	2418.51	2913.87
495	product 495	des 495	9	blue	2	16	3904.42	5658.58
496	product 496	des 496	4	blue	2	28	274.15	386.12
497	product 497	des 497	1	red	16	10	3454.44	5234.00
498	product 498	des 498	4	blue	8	7	4461.68	7082.03
499	product 499	des 499	10	blue	1	7	5397.59	7393.96
500	product 500	des 500	10	green	10	3	4626.38	5782.98
501	product 501	des 501	7	blue	10	18	5422.57	8342.42
502	product 502	des 502	5	blue	5	26	4727.19	5983.79
503	product 503	des 503	3	blue	9	24	2873.46	3731.76
504	product 504	des 504	9	blue	16	24	580.52	716.69
505	product 505	des 505	10	red	2	29	2052.21	2597.74
506	product 506	des 506	3	green	20	11	351.62	549.41
507	product 507	des 507	10	red	2	22	5269.95	7319.37
508	product 508	des 508	5	red	19	25	7685.06	9606.32
509	product 509	des 509	1	green	20	6	4926.25	7139.49
510	product 510	des 510	10	green	17	15	4831.48	5553.43
511	product 511	des 511	1	red	16	17	1044.97	1536.72
512	product 512	des 512	5	blue	4	7	823.92	915.47
513	product 513	des 513	1	blue	16	26	5198.68	7025.25
514	product 514	des 514	2	green	16	27	432.82	497.49
515	product 515	des 515	10	blue	14	28	6270.01	8831.00
516	product 516	des 516	4	red	9	20	2211.78	3455.90
517	product 517	des 517	1	red	17	13	5217.19	6956.25
518	product 518	des 518	1	blue	5	17	195.83	247.88
519	product 519	des 519	5	green	13	24	228.01	356.27
520	product 520	des 520	6	green	4	3	335.05	540.41
521	product 521	des 521	3	red	4	15	5166.36	8469.44
522	product 522	des 522	9	green	7	14	6079.01	8214.88
523	product 523	des 523	9	red	2	8	4941.83	8101.36
524	product 524	des 524	2	green	18	29	5158.31	6699.10
525	product 525	des 525	10	green	20	29	4409.15	6889.30
526	product 526	des 526	2	red	11	25	641.12	736.92
527	product 527	des 527	2	red	5	10	2887.72	3750.28
528	product 528	des 528	2	blue	7	17	6428.97	9595.48
529	product 529	des 529	6	green	16	15	2369.25	3589.77
530	product 530	des 530	6	green	13	2	3370.19	4012.13
531	product 531	des 531	7	red	16	13	4674.33	6070.56
532	product 532	des 532	3	blue	7	17	7882.13	8956.97
533	product 533	des 533	5	red	11	28	2031.32	3276.33
534	product 534	des 534	6	green	15	16	7458.45	8986.08
535	product 535	des 535	10	blue	13	15	6359.63	9936.92
536	product 536	des 536	2	green	15	29	5161.40	7070.41
537	product 537	des 537	9	blue	10	24	4998.47	6942.32
538	product 538	des 538	1	green	9	18	5058.81	5882.34
539	product 539	des 539	1	red	7	18	3371.35	4267.53
540	product 540	des 540	6	green	3	21	4932.92	5481.02
541	product 541	des 541	10	blue	9	2	4740.19	7770.80
542	product 542	des 542	10	blue	12	2	8115.41	9436.52
543	product 543	des 543	1	green	6	4	2875.31	3993.48
544	product 544	des 544	6	red	17	24	6825.08	8980.37
545	product 545	des 545	9	green	5	30	369.20	576.87
546	product 546	des 546	6	blue	4	4	5200.51	5909.67
547	product 547	des 547	5	green	14	11	6459.19	7424.36
548	product 548	des 548	9	green	6	21	4048.79	5954.10
549	product 549	des 549	2	green	13	4	4365.59	5980.26
550	product 550	des 550	8	green	12	9	4106.11	4666.03
551	product 551	des 551	1	green	3	5	5406.44	7113.74
552	product 552	des 552	2	green	7	10	3012.05	4858.14
553	product 553	des 553	9	red	11	26	4245.44	6531.45
554	product 554	des 554	4	blue	10	9	2688.26	4012.33
555	product 555	des 555	6	green	4	15	2159.90	2571.31
556	product 556	des 556	2	blue	18	6	5102.53	6222.60
557	product 557	des 557	5	green	14	10	1899.83	2638.65
558	product 558	des 558	9	blue	11	4	6565.36	9947.52
559	product 559	des 559	7	red	11	16	4423.29	6143.46
560	product 560	des 560	7	green	5	11	6040.37	9292.88
561	product 561	des 561	10	blue	5	28	1484.84	1979.78
562	product 562	des 562	6	green	11	30	2661.54	3456.55
563	product 563	des 563	5	red	3	13	6756.02	7765.54
564	product 564	des 564	10	green	13	4	5706.80	6412.14
565	product 565	des 565	1	blue	6	22	1208.08	1858.58
566	product 566	des 566	2	green	19	29	2278.74	3255.35
567	product 567	des 567	1	green	4	1	6528.06	7334.90
568	product 568	des 568	6	red	4	30	5902.19	8553.90
569	product 569	des 569	9	red	12	21	3275.18	4145.80
570	product 570	des 570	8	red	15	30	1401.59	2123.62
571	product 571	des 571	1	red	17	19	5599.97	6292.10
572	product 572	des 572	5	green	3	19	4471.41	6210.29
573	product 573	des 573	3	blue	14	15	1107.06	1604.43
574	product 574	des 574	7	red	8	28	6349.99	8466.65
575	product 575	des 575	5	blue	15	15	3446.88	5559.49
576	product 576	des 576	6	red	12	3	678.38	997.62
577	product 577	des 577	1	blue	8	21	6482.37	7810.08
578	product 578	des 578	1	blue	8	7	1969.86	2238.48
579	product 579	des 579	10	blue	17	29	3475.34	5430.22
580	product 580	des 580	6	red	6	19	4822.85	5673.94
581	product 581	des 581	2	red	20	7	3784.79	5046.39
582	product 582	des 582	4	blue	14	27	1942.36	2158.18
583	product 583	des 583	8	blue	14	26	3993.28	5254.31
584	product 584	des 584	5	red	16	27	3409.98	5014.67
585	product 585	des 585	3	red	11	9	4782.93	5374.08
586	product 586	des 586	2	blue	15	20	5803.05	6670.17
587	product 587	des 587	1	red	10	28	105.54	148.65
588	product 588	des 588	7	green	13	7	1231.09	1663.63
589	product 589	des 589	8	blue	15	25	3300.35	5500.58
590	product 590	des 590	1	green	18	5	7883.59	9061.60
591	product 591	des 591	1	blue	6	6	530.37	595.92
592	product 592	des 592	6	red	1	8	7952.57	9817.99
593	product 593	des 593	9	green	11	6	305.77	485.35
594	product 594	des 594	5	blue	19	7	4870.06	7268.74
595	product 595	des 595	7	red	3	20	6752.79	8235.11
596	product 596	des 596	2	blue	14	20	3610.00	4247.06
597	product 597	des 597	2	green	9	10	5635.58	7827.20
598	product 598	des 598	5	blue	9	20	1631.41	2204.61
599	product 599	des 599	9	green	19	22	1836.24	2700.36
600	product 600	des 600	1	green	16	18	1586.55	2367.99
601	product 601	des 601	3	blue	2	11	3006.97	3956.54
602	product 602	des 602	3	blue	9	10	2721.41	3359.76
603	product 603	des 603	4	blue	12	5	1831.47	2616.39
604	product 604	des 604	3	red	11	27	2384.31	2943.59
605	product 605	des 605	4	red	17	22	3383.78	5547.18
606	product 606	des 606	7	green	13	17	5722.43	9229.72
607	product 607	des 607	7	red	6	24	4780.10	6128.33
608	product 608	des 608	7	green	16	29	4515.73	5190.49
609	product 609	des 609	3	green	12	11	8001.92	9093.09
610	product 610	des 610	9	green	20	29	7690.93	8739.69
611	product 611	des 611	9	red	18	25	4498.42	6920.65
612	product 612	des 612	2	green	3	10	6591.15	8672.57
613	product 613	des 613	4	blue	16	4	5382.09	6258.24
614	product 614	des 614	7	blue	19	7	7440.61	9790.28
615	product 615	des 615	4	green	15	13	6415.51	9165.01
616	product 616	des 616	1	green	13	26	633.11	1055.19
617	product 617	des 617	5	red	12	10	3676.92	5930.52
618	product 618	des 618	4	red	8	5	4475.46	6992.91
619	product 619	des 619	5	green	1	23	869.20	1047.23
620	product 620	des 620	10	blue	6	17	2424.77	3788.70
621	product 621	des 621	10	green	18	17	2873.88	4354.36
622	product 622	des 622	1	red	19	30	3499.43	3888.25
623	product 623	des 623	7	blue	6	13	5734.66	7168.32
624	product 624	des 624	3	red	17	12	8344.51	9482.40
625	product 625	des 625	1	blue	12	21	5182.92	6731.06
626	product 626	des 626	9	blue	2	25	2998.73	4613.43
627	product 627	des 627	1	green	11	14	4985.61	5865.42
628	product 628	des 628	5	blue	13	21	3061.44	4028.21
629	product 629	des 629	9	red	17	17	4694.58	5588.78
630	product 630	des 630	4	red	13	27	1011.84	1425.13
631	product 631	des 631	1	blue	12	8	2361.78	2653.69
632	product 632	des 632	10	blue	6	8	203.64	257.77
633	product 633	des 633	9	green	14	22	4268.00	6883.87
634	product 634	des 634	1	red	14	3	5193.53	6924.71
635	product 635	des 635	7	red	16	15	2384.50	2772.68
636	product 636	des 636	4	red	18	28	46.75	55.66
637	product 637	des 637	3	green	6	30	2085.56	3418.95
638	product 638	des 638	7	red	1	17	5469.22	8681.30
639	product 639	des 639	2	green	4	13	5711.07	8653.13
640	product 640	des 640	1	green	15	11	3910.15	5507.26
641	product 641	des 641	1	red	1	13	4335.02	6282.64
642	product 642	des 642	8	blue	5	25	3230.24	4821.25
643	product 643	des 643	8	red	9	9	5528.95	7180.45
644	product 644	des 644	6	blue	3	6	564.75	855.68
645	product 645	des 645	7	blue	2	18	127.30	195.84
646	product 646	des 646	5	blue	5	24	4139.21	5829.87
647	product 647	des 647	1	blue	6	27	6210.66	6978.27
648	product 648	des 648	8	red	9	15	4950.37	6781.33
649	product 649	des 649	10	red	2	18	5464.31	8673.50
650	product 650	des 650	1	blue	20	24	5251.72	8336.06
651	product 651	des 651	8	green	11	18	4747.60	6782.29
652	product 652	des 652	8	red	3	1	2544.89	4241.48
653	product 653	des 653	7	green	6	6	2770.49	3506.95
654	product 654	des 654	2	green	19	21	6152.19	8313.77
655	product 655	des 655	2	green	20	10	5671.97	6917.04
656	product 656	des 656	3	red	1	29	938.84	1054.88
657	product 657	des 657	4	green	7	30	358.44	426.72
658	product 658	des 658	10	blue	11	22	6209.26	8505.83
659	product 659	des 659	2	red	20	19	4541.93	5822.99
660	product 660	des 660	9	green	11	30	2787.82	4425.11
661	product 661	des 661	7	red	16	20	892.78	1352.70
662	product 662	des 662	8	green	14	26	2029.66	2537.08
663	product 663	des 663	7	red	6	27	4699.82	7580.35
664	product 664	des 664	2	green	16	5	1044.45	1173.54
665	product 665	des 665	9	red	19	12	635.45	804.37
666	product 666	des 666	1	green	19	10	2260.40	3139.45
667	product 667	des 667	6	blue	12	24	3212.00	5353.34
668	product 668	des 668	1	green	4	12	2734.37	3851.23
669	product 669	des 669	5	green	2	15	2508.92	3258.34
670	product 670	des 670	9	red	8	16	3373.37	4324.83
671	product 671	des 671	3	blue	7	6	2187.88	2573.98
672	product 672	des 672	1	blue	15	15	5956.39	7353.57
673	product 673	des 673	9	red	13	6	3728.99	5252.10
674	product 674	des 674	6	red	19	15	4234.24	6616.00
675	product 675	des 675	6	green	8	18	297.67	465.11
676	product 676	des 676	3	green	13	20	325.57	465.10
677	product 677	des 677	6	blue	7	7	1404.82	2265.84
678	product 678	des 678	3	green	7	4	2088.07	3314.39
679	product 679	des 679	3	green	7	17	6159.16	9776.44
680	product 680	des 680	1	green	12	20	7348.56	9930.49
681	product 681	des 681	1	red	3	29	4405.22	5122.35
682	product 682	des 682	2	red	13	4	975.23	1393.18
683	product 683	des 683	8	blue	1	19	318.81	475.83
684	product 684	des 684	7	red	15	4	6665.92	8229.53
685	product 685	des 685	9	green	9	24	154.20	257.00
686	product 686	des 686	6	red	8	20	2564.80	3419.74
687	product 687	des 687	5	red	4	20	1416.50	1914.19
688	product 688	des 688	4	green	13	6	7845.45	8915.28
689	product 689	des 689	6	green	2	29	3087.22	4540.03
690	product 690	des 690	5	red	16	18	4206.82	5258.53
691	product 691	des 691	8	green	1	10	5758.29	8468.07
692	product 692	des 692	9	green	11	24	3227.17	3667.24
693	product 693	des 693	2	blue	18	2	3053.29	4770.76
694	product 694	des 694	9	red	18	14	41.21	48.48
695	product 695	des 695	4	green	11	20	6470.74	9954.99
696	product 696	des 696	1	red	1	17	4975.50	6910.42
697	product 697	des 697	1	red	19	13	840.50	1313.28
698	product 698	des 698	9	blue	17	18	2925.02	3286.54
699	product 699	des 699	6	blue	9	19	2968.58	4011.59
700	product 700	des 700	1	green	1	5	3554.00	5077.14
701	product 701	des 701	5	green	5	25	6033.39	8497.73
702	product 702	des 702	9	red	13	12	6359.49	8832.63
703	product 703	des 703	1	red	6	19	4878.23	6254.14
704	product 704	des 704	4	green	10	16	5560.82	8826.70
705	product 705	des 705	6	green	3	6	6226.69	7593.52
706	product 706	des 706	8	green	16	25	7404.21	8226.90
707	product 707	des 707	3	red	6	1	2375.53	2828.01
708	product 708	des 708	8	blue	4	13	4512.81	6356.07
709	product 709	des 709	10	blue	1	30	5099.82	7182.84
710	product 710	des 710	10	blue	15	19	5037.98	8396.63
711	product 711	des 711	10	red	7	7	2878.99	3387.05
712	product 712	des 712	2	green	13	25	3311.25	4087.96
713	product 713	des 713	9	red	2	11	5944.25	8032.77
714	product 714	des 714	9	green	5	13	5413.18	8730.93
715	product 715	des 715	7	red	12	16	6578.29	7391.34
716	product 716	des 716	2	red	6	14	1780.24	2738.83
717	product 717	des 717	1	blue	14	10	8070.63	9842.23
718	product 718	des 718	10	red	2	22	6644.78	8629.59
719	product 719	des 719	7	blue	16	27	2701.99	3555.25
720	product 720	des 720	2	green	19	11	2050.72	3154.95
721	product 721	des 721	4	red	5	2	7575.10	9967.24
722	product 722	des 722	6	green	3	20	7009.77	9602.43
723	product 723	des 723	6	green	11	16	4240.33	5300.41
724	product 724	des 724	5	red	6	26	6681.69	9280.13
725	product 725	des 725	10	green	16	17	5013.45	5633.09
726	product 726	des 726	6	blue	13	16	2904.31	4334.79
727	product 727	des 727	8	green	15	23	5233.10	8440.48
728	product 728	des 728	4	red	16	24	7312.92	9882.33
729	product 729	des 729	4	red	20	2	3587.36	5519.02
730	product 730	des 730	7	green	18	25	7653.51	8599.45
731	product 731	des 731	2	blue	7	2	4680.81	5506.84
732	product 732	des 732	10	red	4	14	2477.30	2783.48
733	product 733	des 733	6	blue	13	2	7010.63	9104.72
734	product 734	des 734	9	blue	19	15	831.05	1362.37
735	product 735	des 735	5	blue	11	27	5807.57	8934.72
736	product 736	des 736	3	green	1	29	5787.02	6502.27
737	product 737	des 737	1	green	2	3	8699.53	9774.75
738	product 738	des 738	6	green	5	5	1807.08	2316.77
739	product 739	des 739	6	red	11	8	5737.73	7549.64
740	product 740	des 740	10	red	4	16	3714.76	6191.27
741	product 741	des 741	5	red	6	4	5130.96	6933.73
742	product 742	des 742	5	red	20	19	4834.62	7325.18
743	product 743	des 743	10	red	14	22	3038.03	4467.69
744	product 744	des 744	6	blue	2	21	661.24	858.75
745	product 745	des 745	7	red	8	3	6769.09	8155.53
746	product 746	des 746	9	green	9	13	2864.05	4546.11
747	product 747	des 747	7	red	6	11	116.14	138.26
748	product 748	des 748	10	blue	1	19	3146.10	3745.36
749	product 749	des 749	2	red	11	15	1228.94	1683.48
750	product 750	des 750	1	blue	12	30	249.83	367.39
751	product 751	des 751	9	blue	13	20	1585.98	2558.04
752	product 752	des 752	1	blue	11	21	2115.53	3111.08
753	product 753	des 753	7	green	17	1	3758.73	5079.37
754	product 754	des 754	4	red	2	22	24.54	33.61
755	product 755	des 755	10	blue	1	17	6868.05	8479.07
756	product 756	des 756	3	green	12	9	2653.74	3960.80
757	product 757	des 757	8	green	1	22	901.47	1086.11
758	product 758	des 758	10	blue	15	2	2911.04	4772.19
759	product 759	des 759	1	green	20	15	3400.84	4304.86
760	product 760	des 760	5	red	15	2	2654.36	3846.90
761	product 761	des 761	4	blue	3	21	6694.81	9845.31
762	product 762	des 762	2	green	16	23	4771.90	5361.69
763	product 763	des 763	8	red	19	10	2689.05	3787.39
764	product 764	des 764	10	blue	14	19	5911.38	7578.69
765	product 765	des 765	9	red	16	6	23.10	29.61
766	product 766	des 766	7	green	16	17	1089.01	1533.82
767	product 767	des 767	7	green	4	7	4259.73	6454.14
768	product 768	des 768	10	green	13	30	6665.42	9948.39
769	product 769	des 769	6	blue	13	22	7781.58	9489.73
770	product 770	des 770	2	green	10	14	6329.32	8114.51
771	product 771	des 771	9	blue	15	8	1857.63	2087.23
772	product 772	des 772	2	red	18	19	3539.17	4915.51
773	product 773	des 773	3	red	12	8	944.97	1259.96
774	product 774	des 774	5	green	2	19	7059.11	8714.95
775	product 775	des 775	2	green	19	19	179.19	205.96
776	product 776	des 776	9	red	9	5	3993.81	5470.97
777	product 777	des 777	7	blue	4	12	7613.03	9760.30
778	product 778	des 778	5	red	18	29	3539.11	5708.25
779	product 779	des 779	1	blue	3	12	4808.87	6969.37
780	product 780	des 780	7	green	7	3	4998.42	6408.23
781	product 781	des 781	5	blue	5	10	2968.61	3412.20
782	product 782	des 782	8	green	19	13	1235.10	1419.65
783	product 783	des 783	9	red	4	29	5636.49	8540.14
784	product 784	des 784	1	blue	17	19	5608.09	9045.31
785	product 785	des 785	6	red	16	27	3255.72	4651.03
786	product 786	des 786	9	blue	17	28	2687.72	4335.03
787	product 787	des 787	1	green	18	23	124.66	152.03
788	product 788	des 788	9	green	3	6	3075.70	3661.55
789	product 789	des 789	9	red	7	8	7205.49	9480.91
790	product 790	des 790	7	blue	1	23	2879.41	4234.42
791	product 791	des 791	8	blue	17	23	2266.05	2763.47
792	product 792	des 792	4	green	14	21	2513.90	3591.28
793	product 793	des 793	5	green	16	17	4719.14	6646.68
794	product 794	des 794	3	green	12	26	4106.52	4720.14
795	product 795	des 795	6	green	1	11	4470.31	6672.10
796	product 796	des 796	7	blue	15	23	5601.19	6748.42
797	product 797	des 797	6	red	13	27	5323.35	6824.81
798	product 798	des 798	2	blue	4	15	4400.28	7097.23
799	product 799	des 799	9	green	13	14	4219.24	5860.05
800	product 800	des 800	6	red	20	5	8035.24	9799.07
801	product 801	des 801	5	red	10	24	2099.71	2441.52
802	product 802	des 802	4	green	12	4	2105.47	3007.82
803	product 803	des 803	8	green	20	26	4850.65	5640.29
804	product 804	des 804	5	blue	16	1	2809.75	4531.85
805	product 805	des 805	8	green	6	27	1855.71	2811.68
806	product 806	des 806	1	green	2	10	3321.87	5033.13
807	product 807	des 807	10	red	15	3	3496.20	5378.77
808	product 808	des 808	8	red	9	12	7164.17	9184.83
809	product 809	des 809	10	green	19	7	2842.99	4307.56
810	product 810	des 810	6	green	15	15	2593.19	4182.56
811	product 811	des 811	2	green	18	3	5887.06	9811.77
812	product 812	des 812	8	red	18	6	3522.90	4575.19
813	product 813	des 813	2	blue	7	15	4920.74	6474.66
814	product 814	des 814	9	red	11	18	5566.80	8564.30
815	product 815	des 815	2	red	20	14	5458.34	6576.31
816	product 816	des 816	4	blue	17	28	790.01	1196.98
817	product 817	des 817	1	red	3	24	2895.54	4258.14
818	product 818	des 818	2	red	2	29	6203.76	8616.34
819	product 819	des 819	2	blue	9	26	1928.43	3061.00
820	product 820	des 820	8	blue	3	16	1163.84	1847.37
821	product 821	des 821	8	blue	7	29	4641.42	7032.46
822	product 822	des 822	10	red	9	5	3968.06	5362.24
823	product 823	des 823	7	green	9	8	6071.75	8317.46
824	product 824	des 824	9	red	18	14	5407.17	8070.41
825	product 825	des 825	6	blue	6	21	797.00	1122.54
826	product 826	des 826	4	green	12	28	4366.91	5901.23
827	product 827	des 827	8	blue	6	21	1511.24	1820.77
828	product 828	des 828	9	red	11	27	1451.11	2303.35
829	product 829	des 829	9	blue	10	10	5794.44	8161.19
830	product 830	des 830	10	blue	10	2	3329.52	3699.47
831	product 831	des 831	4	red	7	8	329.67	412.09
832	product 832	des 832	8	green	2	19	4519.41	5579.52
833	product 833	des 833	6	blue	18	4	2739.98	3970.99
834	product 834	des 834	6	green	2	23	2012.81	3354.69
835	product 835	des 835	3	green	14	16	1816.14	2454.24
836	product 836	des 836	9	green	20	12	5623.04	7209.03
837	product 837	des 837	8	blue	1	8	6536.61	9338.02
838	product 838	des 838	6	green	9	29	3999.72	5127.85
839	product 839	des 839	4	red	6	1	8206.42	9220.70
840	product 840	des 840	10	blue	9	27	4813.95	6171.73
841	product 841	des 841	9	blue	9	21	5028.03	7618.23
842	product 842	des 842	8	green	6	23	3028.69	3933.37
843	product 843	des 843	10	blue	8	24	7146.09	9161.66
844	product 844	des 844	6	green	15	28	5496.95	9011.39
845	product 845	des 845	9	red	1	30	7016.64	8881.82
846	product 846	des 846	6	red	17	7	4743.26	6680.65
847	product 847	des 847	6	blue	16	23	1790.73	2487.13
848	product 848	des 848	4	red	18	17	3372.01	4436.85
849	product 849	des 849	4	blue	18	16	2366.87	3880.11
850	product 850	des 850	7	blue	2	30	6908.48	8635.60
851	product 851	des 851	7	red	13	29	3701.79	4304.41
852	product 852	des 852	7	blue	10	1	5947.36	7723.85
853	product 853	des 853	10	green	8	11	5085.39	6966.29
854	product 854	des 854	5	red	5	28	2707.76	4165.78
855	product 855	des 855	4	green	13	10	1446.74	1981.83
856	product 856	des 856	7	blue	2	20	1268.71	1669.35
857	product 857	des 857	5	green	15	15	3096.42	3440.47
858	product 858	des 858	5	red	16	11	6284.42	9668.34
859	product 859	des 859	5	red	19	13	4687.36	7440.26
860	product 860	des 860	3	red	8	10	6573.36	9390.51
861	product 861	des 861	7	green	15	10	355.39	530.44
862	product 862	des 862	2	green	15	1	4524.34	5953.08
863	product 863	des 863	9	red	9	21	1978.61	3191.30
864	product 864	des 864	1	red	1	1	5876.24	7731.90
865	product 865	des 865	10	blue	18	16	7644.27	9209.96
866	product 866	des 866	1	blue	17	14	2658.17	2953.52
867	product 867	des 867	5	red	17	23	2876.58	4425.50
868	product 868	des 868	7	green	12	25	2910.77	3684.52
869	product 869	des 869	10	green	10	28	6228.08	9436.49
870	product 870	des 870	4	red	2	5	2774.72	4404.32
871	product 871	des 871	2	red	14	30	1489.13	1673.18
872	product 872	des 872	10	green	13	12	739.73	850.26
873	product 873	des 873	5	green	18	5	2519.54	3110.54
874	product 874	des 874	2	blue	5	10	2345.06	2859.83
875	product 875	des 875	4	blue	13	18	6993.24	9201.63
876	product 876	des 876	7	green	16	25	746.13	1223.17
877	product 877	des 877	6	blue	11	16	2426.36	2923.32
878	product 878	des 878	1	blue	6	8	5353.38	6153.31
879	product 879	des 879	10	green	7	26	3677.51	4903.35
880	product 880	des 880	7	blue	10	17	5467.58	6284.57
881	product 881	des 881	10	red	5	3	5607.28	9345.46
882	product 882	des 882	6	blue	9	27	675.44	877.20
883	product 883	des 883	8	green	20	14	1661.73	2517.78
884	product 884	des 884	10	blue	3	22	2770.69	3848.18
885	product 885	des 885	8	blue	9	22	579.76	935.10
886	product 886	des 886	5	red	1	19	773.52	1247.62
887	product 887	des 887	7	blue	18	18	5252.36	7839.34
888	product 888	des 888	2	blue	1	2	4203.19	5757.79
889	product 889	des 889	10	blue	15	11	3398.22	4413.27
890	product 890	des 890	6	blue	10	28	1102.72	1378.40
891	product 891	des 891	8	green	18	7	6530.74	7774.69
892	product 892	des 892	8	red	3	26	2517.66	3448.85
893	product 893	des 893	9	green	14	8	4232.48	6224.23
894	product 894	des 894	2	green	20	7	3798.23	5349.62
895	product 895	des 895	10	red	18	18	3272.01	5277.43
896	product 896	des 896	8	green	5	10	729.21	911.51
897	product 897	des 897	1	green	14	7	1230.64	2017.45
898	product 898	des 898	1	blue	2	3	3116.05	5025.89
899	product 899	des 899	9	red	2	3	4533.62	6126.52
900	product 900	des 900	10	green	9	10	939.76	1491.69
901	product 901	des 901	8	red	7	10	1360.44	1679.56
902	product 902	des 902	1	green	17	8	712.87	913.93
903	product 903	des 903	10	red	9	26	5359.85	7767.90
904	product 904	des 904	6	green	9	24	7760.52	9464.05
905	product 905	des 905	4	green	9	5	723.80	952.37
906	product 906	des 906	3	blue	10	8	5532.49	7903.56
907	product 907	des 907	4	green	2	16	44.12	50.14
908	product 908	des 908	7	green	20	5	3753.65	5958.17
909	product 909	des 909	9	blue	4	22	3679.12	4905.50
910	product 910	des 910	3	red	18	29	2287.94	2859.92
911	product 911	des 911	10	blue	3	25	1818.76	2362.02
912	product 912	des 912	10	blue	16	10	4360.51	4955.13
913	product 913	des 913	6	red	10	20	2649.51	3271.00
914	product 914	des 914	7	blue	7	2	3253.10	5332.95
915	product 915	des 915	3	red	20	17	1965.14	2487.52
916	product 916	des 916	5	green	1	9	2331.38	2808.89
917	product 917	des 917	6	blue	4	13	809.65	909.72
918	product 918	des 918	2	green	12	6	2089.59	2943.08
919	product 919	des 919	4	blue	10	23	7825.41	9099.31
920	product 920	des 920	9	red	18	23	261.20	389.85
921	product 921	des 921	7	blue	13	20	2866.57	4410.10
922	product 922	des 922	10	green	3	3	7165.20	9186.16
923	product 923	des 923	3	blue	3	2	2442.38	3256.50
924	product 924	des 924	10	blue	10	24	6321.24	7023.60
925	product 925	des 925	9	red	6	23	4190.52	4988.71
926	product 926	des 926	1	blue	2	27	3818.56	5303.56
927	product 927	des 927	8	red	5	9	5588.32	7761.55
928	product 928	des 928	7	red	3	5	4076.08	6083.70
929	product 929	des 929	6	blue	9	19	1126.27	1564.27
930	product 930	des 930	3	blue	20	22	6910.30	9338.24
931	product 931	des 931	4	green	1	7	2257.31	2687.27
932	product 932	des 932	7	red	10	6	2880.70	3200.78
933	product 933	des 933	5	green	9	7	5155.10	8054.84
934	product 934	des 934	4	red	7	21	70.74	82.26
935	product 935	des 935	4	red	19	22	2573.16	3063.28
936	product 936	des 936	1	blue	1	14	3147.50	4628.67
937	product 937	des 937	8	red	15	12	422.81	485.99
938	product 938	des 938	1	red	2	28	2331.95	3284.44
939	product 939	des 939	2	blue	14	11	1311.35	2185.59
940	product 940	des 940	5	red	20	24	5556.89	6387.23
941	product 941	des 941	4	blue	7	13	5592.00	8346.27
942	product 942	des 942	7	blue	8	23	1522.10	1790.71
943	product 943	des 943	1	green	6	1	3802.43	6233.50
944	product 944	des 944	7	green	11	16	3278.88	4491.62
945	product 945	des 945	10	blue	12	4	6558.76	7998.49
946	product 946	des 946	1	red	5	21	5824.50	8825.00
947	product 947	des 947	2	blue	16	3	2833.88	3373.67
948	product 948	des 948	4	red	12	18	4547.62	6890.33
949	product 949	des 949	7	green	12	15	4522.58	6750.12
950	product 950	des 950	1	red	8	14	4093.94	5766.11
951	product 951	des 951	8	green	8	30	1990.71	2843.87
952	product 952	des 952	4	blue	19	13	16.28	20.10
953	product 953	des 953	1	blue	15	26	6675.35	7585.62
954	product 954	des 954	6	blue	15	28	5163.86	7944.40
955	product 955	des 955	7	red	5	7	654.11	1022.05
956	product 956	des 956	3	red	8	13	6003.45	8338.13
957	product 957	des 957	5	red	1	15	4427.20	5147.91
958	product 958	des 958	5	red	13	17	7119.55	8682.38
959	product 959	des 959	9	green	8	22	5243.70	6899.61
960	product 960	des 960	3	red	3	13	694.28	807.30
961	product 961	des 961	2	red	18	27	7012.75	8876.90
962	product 962	des 962	4	red	13	1	5771.58	7214.48
963	product 963	des 963	8	green	16	14	5164.65	6376.11
964	product 964	des 964	9	green	19	12	7019.80	9486.21
965	product 965	des 965	10	red	11	1	5263.46	6748.02
966	product 966	des 966	7	red	18	24	3592.15	4128.91
967	product 967	des 967	2	blue	4	12	6264.19	9637.22
968	product 968	des 968	9	green	13	22	2773.11	3747.44
969	product 969	des 969	6	green	1	18	2154.91	2448.76
970	product 970	des 970	5	blue	1	1	152.71	218.16
971	product 971	des 971	10	blue	9	11	7598.87	8734.33
972	product 972	des 972	4	blue	12	4	1611.69	2441.95
973	product 973	des 973	10	green	15	6	2164.69	3436.02
974	product 974	des 974	6	blue	20	17	5657.18	8571.48
975	product 975	des 975	4	green	9	21	1087.08	1249.52
976	product 976	des 976	4	blue	5	2	75.41	104.74
977	product 977	des 977	3	red	9	10	6640.02	8512.84
978	product 978	des 978	4	green	18	19	2065.01	2549.40
979	product 979	des 979	5	blue	8	3	5969.24	8909.31
980	product 980	des 980	1	red	6	4	6058.34	7572.92
981	product 981	des 981	4	red	9	16	1346.01	1771.06
982	product 982	des 982	10	green	14	30	5553.95	9104.83
983	product 983	des 983	3	green	11	12	2929.35	3487.32
984	product 984	des 984	5	green	16	11	4923.90	5659.66
985	product 985	des 985	7	red	13	22	6778.31	7531.46
986	product 986	des 986	7	blue	19	27	5114.03	7632.88
987	product 987	des 987	9	green	18	30	5418.02	8086.60
988	product 988	des 988	10	green	14	4	2817.71	3478.66
989	product 989	des 989	1	red	1	6	524.82	728.91
990	product 990	des 990	6	red	5	12	5919.87	7493.51
991	product 991	des 991	1	red	13	7	2728.59	3248.32
992	product 992	des 992	7	blue	2	22	567.29	810.41
993	product 993	des 993	4	red	4	2	5401.08	7201.44
994	product 994	des 994	3	blue	17	7	1704.12	2004.85
995	product 995	des 995	7	red	8	16	7025.94	9624.58
996	product 996	des 996	6	green	14	29	5694.51	8020.43
997	product 997	des 997	3	red	8	8	3889.96	4576.42
998	product 998	des 998	2	green	11	7	5927.99	7318.50
999	product 999	des 999	9	green	15	7	494.11	686.27
1000	product 1000	des 1000	8	red	18	26	1512.00	2223.53
\.


--
-- Data for Name: dim_quarter; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_quarter (quarter_id, name) FROM stdin;
1	Q1
2	Q2
3	Q3
4	Q4
\.


--
-- Data for Name: dim_source_online; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_source_online (source_online_id, link_name) FROM stdin;
1	Shopee
2	Tiktok
3	Tiki
4	Lazada
1000	Offline
\.


--
-- Data for Name: dim_store; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_store (store_id, name, city_id) FROM stdin;
1	store 1	9
2	store 2	1
3	store 3	4
4	store 4	6
5	store 5	4
6	store 6	9
7	store 7	6
8	store 8	5
9	store 9	6
10	store 10	2
11	store 11	8
12	store 12	9
13	store 13	4
14	store 14	10
15	store 15	3
16	store 16	7
17	store 17	8
18	store 18	5
19	store 19	6
20	store 20	7
21	store 21	10
22	store 22	7
23	store 23	7
24	store 24	7
25	store 25	7
26	store 26	9
27	store 27	4
28	store 28	9
29	store 29	5
30	store 30	1
31	store 31	4
32	store 32	3
33	store 33	3
34	store 34	4
35	store 35	4
36	store 36	10
37	store 37	4
38	store 38	7
39	store 39	8
40	store 40	6
41	store 41	7
42	store 42	7
43	store 43	7
44	store 44	10
45	store 45	8
46	store 46	6
47	store 47	1
48	store 48	3
49	store 49	3
50	store 50	5
\.


--
-- Data for Name: dim_year; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.dim_year (year_id, name) FROM stdin;
1	2024
2	2023
3	2022
\.


--
-- Data for Name: fact_production; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.fact_production (id, date_id, store_id, product_id, quantity, revenue, profit) FROM stdin;
1	114	36	807	1	5378.77	1882.57
2	152	50	781	9	30709.80	3992.31
3	500	29	619	4	4188.92	712.12
4	407	45	117	9	32552.19	13020.84
5	596	33	4	5	34358.15	8933.10
6	823	39	232	7	69799.24	14657.86
7	452	31	356	7	31210.76	5930.05
8	655	17	195	9	89381.70	9831.96
9	867	48	709	2	14365.68	4166.04
10	863	43	160	7	3670.24	1174.46
11	680	14	794	4	18880.56	2454.48
12	730	9	569	3	12437.40	2611.86
13	657	38	745	9	73399.77	12477.96
14	116	1	796	5	33742.10	5736.15
15	790	47	696	7	48372.94	13544.44
16	162	41	67	2	13993.12	2238.90
17	114	36	821	10	70324.60	23910.40
18	826	39	210	7	37384.41	11215.33
19	327	23	681	1	5122.35	717.13
20	212	18	779	1	6969.37	2160.50
21	767	2	51	1	5480.57	712.47
22	505	27	64	3	7392.66	2513.49
23	579	26	557	1	2638.65	738.82
24	367	17	687	7	13399.33	3483.83
25	774	6	148	3	4937.22	1481.16
26	98	29	844	2	18022.78	7028.88
27	399	39	830	10	36994.70	3699.50
28	452	20	200	3	23667.96	5443.62
29	600	42	65	5	32717.90	6216.40
30	544	1	547	1	7424.36	965.17
31	110	19	961	9	79892.10	16777.35
32	230	36	341	8	72462.32	16666.32
33	161	30	454	2	9677.86	1742.02
34	121	30	52	4	18547.84	1854.80
35	728	10	921	7	30870.70	10804.71
36	258	2	30	13	85072.52	12760.93
37	638	40	442	8	47673.28	10964.88
38	770	34	134	9	43512.93	7397.19
39	208	3	676	7	3255.70	976.71
40	3	5	247	6	37608.00	5265.12
41	670	38	704	10	88267.00	32658.80
42	34	19	421	6	13157.94	3947.40
43	458	1	782	4	5678.60	738.20
44	452	20	299	9	81357.30	13830.75
45	696	28	359	10	51681.80	17055.00
46	284	20	196	3	7843.41	2509.89
47	347	10	880	8	50276.56	6535.92
48	795	18	272	10	29568.30	5618.00
49	410	15	20	4	10774.36	2154.88
50	227	41	244	9	55295.64	21565.26
51	520	37	849	4	15520.44	6052.96
52	138	26	280	1	8133.77	3253.51
53	823	26	558	8	79580.16	27057.28
54	870	50	944	4	17966.48	4850.96
55	517	42	177	10	57393.80	8035.10
56	632	21	312	2	19498.74	5849.62
57	320	22	424	9	56306.79	21396.60
58	659	26	67	1	6996.56	1119.45
59	657	38	37	3	28410.00	2841.00
60	10	29	142	3	13621.59	3541.62
61	443	30	841	5	38091.15	12951.00
62	397	16	864	3	23195.70	5566.98
63	121	29	742	5	36625.90	12452.80
64	538	35	364	5	31319.45	8143.05
65	12	15	947	10	33736.70	5397.90
66	86	44	168	10	6572.70	723.00
67	825	29	440	5	38404.55	4224.50
68	183	38	971	10	87343.30	11354.60
69	283	32	558	7	69632.64	23675.12
70	273	33	411	8	52559.60	11037.52
71	400	39	304	5	41801.45	6688.25
72	131	41	275	7	51109.94	16355.15
73	785	34	25	6	36116.46	13001.94
74	770	38	426	7	31100.30	6220.06
75	69	31	749	3	5050.44	1363.62
76	416	39	437	4	21664.64	7582.64
77	192	42	744	10	8587.50	1975.10
78	866	30	349	10	49040.90	14221.90
79	796	21	848	3	13310.55	3194.52
80	8	50	866	4	11814.08	1181.40
81	657	38	680	5	49652.45	12909.65
82	762	42	515	4	35324.00	10243.96
83	267	37	591	3	1787.76	196.65
84	109	29	382	1	2169.30	368.78
85	358	48	722	7	67217.01	18148.62
86	379	16	147	1	8160.39	1795.29
87	507	20	558	7	69632.64	23675.12
88	676	11	771	4	8348.92	918.40
89	465	39	760	5	19234.50	5962.70
90	777	30	447	5	10302.05	3296.65
91	323	24	453	10	90438.20	22609.60
92	420	38	11	3	7340.94	2936.37
93	342	11	54	10	1437.30	431.20
94	649	14	620	6	22732.20	8183.58
95	579	45	930	8	74705.92	19423.52
96	170	38	367	3	483.81	125.79
97	687	9	320	7	51018.59	12754.63
98	479	8	601	5	19782.70	4747.85
99	331	23	29	6	36154.62	7954.02
100	875	34	714	7	61116.51	23224.25
101	42	25	313	2	18722.66	6927.38
102	417	42	74	2	710.10	163.32
103	85	44	947	3	10121.01	1619.37
104	463	46	650	7	58352.42	21590.38
105	699	6	107	4	33967.64	10869.64
106	552	32	781	4	13648.80	1774.36
107	401	12	867	9	39829.50	13940.28
108	503	39	621	8	34834.88	11843.84
109	233	35	256	10	1627.30	618.40
110	101	15	56	2	15433.76	6173.50
111	467	50	708	1	6356.07	1843.26
112	835	19	588	5	8318.15	2162.70
113	312	6	468	3	6283.38	754.02
114	516	31	182	6	38125.92	11819.04
115	784	12	365	6	21254.04	6801.30
116	369	34	711	11	37257.55	5588.66
117	25	10	127	7	41747.23	15863.96
118	621	9	395	10	76399.30	12223.90
119	70	23	282	2	5754.32	2244.18
120	121	29	540	2	10962.04	1096.20
121	185	25	659	6	34937.94	7686.36
122	743	7	431	7	14629.09	3510.99
123	443	40	286	6	28224.24	8185.02
124	161	44	943	2	12467.00	4862.14
125	485	35	923	5	16282.50	4070.60
126	101	17	437	2	10832.32	3791.32
127	49	19	451	2	14965.90	2843.52
128	771	38	852	2	15447.70	3552.98
129	876	17	701	4	33990.92	9857.36
130	580	10	823	7	58222.22	15719.97
131	292	4	652	10	42414.80	16965.90
132	118	13	684	6	49377.18	9381.66
133	557	49	760	6	23081.40	7155.24
134	253	12	423	8	71646.64	12896.40
135	165	16	628	10	40282.10	9667.70
136	313	18	342	5	39759.05	11530.10
137	244	19	70	7	15884.96	2859.29
138	45	30	593	6	2912.10	1077.48
139	579	20	58	7	66914.96	13383.02
140	732	10	77	8	54941.44	12636.56
141	62	22	310	9	11795.76	1179.54
142	460	34	402	5	19414.85	2912.25
143	53	19	457	10	16602.40	5146.70
144	646	25	14	7	53777.36	12906.60
145	19	39	122	2	15325.20	5057.32
146	696	34	308	7	8953.42	3581.34
147	482	3	479	2	1287.68	154.52
148	528	28	428	5	22760.75	7966.25
149	710	49	54	2	287.46	86.24
150	142	37	571	4	25168.40	2768.52
151	601	5	279	4	14322.20	3294.12
152	23	24	323	8	16701.84	5010.56
153	565	1	655	10	69170.40	12450.70
154	706	9	402	8	31063.76	4659.60
155	252	23	295	5	23037.80	3916.45
156	716	23	736	10	65022.70	7152.50
157	33	38	349	8	39232.72	11377.52
158	468	22	868	9	33160.68	6963.75
159	47	37	947	10	33736.70	5397.90
160	493	33	860	4	37562.04	11268.60
161	215	16	1000	9	20011.77	6403.77
162	718	34	79	6	54374.58	10331.16
163	65	12	394	6	38288.34	8040.54
164	100	26	113	9	10588.32	2541.24
165	638	44	943	9	56101.50	21879.63
166	166	14	239	1	2041.23	632.78
167	767	2	16	7	28040.60	5047.28
168	43	34	171	9	82567.71	28072.98
169	524	18	310	5	6553.20	655.30
170	105	34	138	4	17592.12	1935.12
171	285	34	676	9	4185.90	1255.77
172	502	36	137	3	19158.96	6130.86
173	390	15	868	4	14738.08	3095.00
174	344	30	194	3	16311.66	2446.74
175	168	42	280	4	32535.08	13014.04
176	662	50	461	2	13999.34	1539.92
177	533	26	670	3	12974.49	2854.38
178	377	36	366	1	212.87	21.29
179	602	14	938	1	3284.44	952.49
180	414	23	118	3	7009.62	1892.61
181	277	48	1	9	51632.46	17038.71
182	596	33	616	2	2110.38	844.16
183	161	28	875	7	64411.41	15458.73
184	512	7	142	4	18162.12	4722.16
185	366	3	288	1	993.94	318.06
186	430	26	390	10	16374.70	2620.00
187	25	10	887	3	23518.02	7760.94
188	673	18	427	4	7579.08	1364.24
189	6	17	593	5	2426.75	897.90
190	258	34	327	3	4222.65	1182.33
191	594	46	158	1	8737.20	2795.90
192	571	15	350	9	63295.83	24685.38
193	834	29	921	9	39690.90	13891.77
194	767	2	38	6	29358.12	7926.72
195	602	32	154	10	57635.00	10374.30
196	161	28	986	2	15265.76	5037.70
197	403	14	316	9	34090.92	12272.76
198	575	31	400	2	10738.94	3114.30
199	277	48	843	2	18323.32	4031.14
200	41	25	788	1	3661.55	585.85
201	165	13	472	5	31826.35	3182.65
202	611	42	212	3	15386.67	2923.47
203	701	38	830	9	33295.23	3329.55
204	91	37	996	1	8020.43	2325.92
205	25	31	921	4	17640.40	6174.12
206	216	19	337	2	13869.12	2080.36
207	355	21	585	2	10748.16	1182.30
208	454	8	489	1	7009.37	1612.16
209	877	4	437	6	32496.96	11373.96
210	135	20	555	8	20570.48	3291.28
211	654	26	652	4	16965.92	6786.36
212	110	19	73	5	11776.95	1413.25
213	247	47	240	8	13208.32	1717.12
214	764	35	318	1	3692.40	738.48
215	47	22	272	8	23654.64	4494.40
216	746	50	466	4	28901.20	8959.36
217	609	7	219	2	18299.14	7136.66
218	88	32	606	1	9229.72	3507.29
219	218	11	29	9	54231.93	11931.03
220	302	20	691	1	8468.07	2709.78
221	423	35	47	5	20738.15	8295.25
222	591	26	671	5	12869.90	1930.50
223	678	27	895	8	42219.44	16043.36
224	481	12	955	4	4088.20	1471.76
225	796	5	189	6	7331.88	1466.40
226	167	46	230	8	48894.32	6356.24
227	538	39	564	8	51297.12	5642.72
228	133	38	87	4	23545.60	2825.48
229	830	34	846	7	46764.55	13561.73
230	753	25	397	6	32770.08	3604.68
231	572	31	385	2	11462.26	3094.82
232	43	34	158	1	8737.20	2795.90
233	686	44	515	2	17662.00	5121.98
234	230	36	642	6	28927.50	9546.06
235	25	31	65	6	39261.48	7459.68
236	388	1	458	2	14103.46	4090.00
237	714	13	146	3	9813.72	1177.65
238	668	5	274	5	20927.25	3976.20
239	662	41	860	7	65733.57	19720.05
240	407	45	544	8	71842.96	17242.32
241	693	17	282	4	11508.64	4488.36
242	511	34	909	7	34338.50	8584.66
243	770	34	42	10	52615.80	17363.20
244	174	8	62	10	44368.60	10204.80
245	389	6	92	1	5704.10	1996.43
246	706	9	423	7	62690.81	11284.35
247	122	44	215	2	19260.74	4044.76
248	310	29	262	5	37803.80	11341.15
249	355	24	79	3	27187.29	5165.58
250	766	36	239	10	20412.30	6327.80
251	454	14	301	5	13294.45	2791.85
252	326	37	355	5	47851.90	6699.25
253	716	23	191	6	18326.52	3115.50
254	234	50	50	1	1978.09	514.30
255	209	5	990	4	29974.04	6294.56
256	287	18	844	9	81102.51	31629.96
257	325	28	2	5	10050.60	1507.60
258	143	49	554	9	36110.97	11916.63
259	612	1	155	3	16026.75	4166.97
260	591	26	745	8	65244.24	11091.52
261	8	50	278	10	82103.20	24631.00
262	53	19	222	3	25915.62	2591.55
263	673	2	917	4	3638.88	400.28
264	285	34	42	3	15784.74	5208.96
265	464	15	714	3	26192.79	9953.25
266	323	24	67	3	20989.68	3358.35
267	822	11	634	8	55397.68	13849.44
268	399	18	451	2	14965.90	2843.52
269	389	17	619	10	10472.30	1780.30
270	856	10	550	7	32662.21	3919.44
271	224	21	414	7	58127.02	16275.56
272	556	42	434	3	25293.33	4805.73
273	833	19	412	6	48041.94	5765.04
274	481	30	849	8	31040.88	12105.92
275	436	27	716	7	19171.81	6710.13
276	740	34	889	3	13239.81	3045.15
277	732	11	699	5	20057.95	5215.05
278	538	39	12	1	9834.03	1671.79
279	373	46	954	8	63555.20	22244.32
280	836	36	364	1	6263.89	1628.61
281	718	34	190	6	34013.10	9523.68
282	438	9	64	8	19713.76	6702.64
283	705	30	138	5	21990.15	2418.90
284	53	35	35	8	23580.32	6366.72
285	807	2	379	10	67986.70	7478.50
286	458	1	605	5	27735.90	10817.00
287	678	39	77	7	48073.76	11056.99
288	375	48	261	2	4579.34	1648.56
289	245	3	785	10	46510.30	13953.10
290	407	9	566	4	13021.40	3906.44
291	544	1	522	9	73933.92	19222.83
292	154	14	11	5	12234.90	4893.95
293	369	33	781	2	6824.40	887.18
294	562	40	316	10	37878.80	13636.40
295	638	40	988	8	27829.28	5287.60
296	288	39	659	5	29114.95	6405.30
297	267	26	941	9	75116.43	24788.43
298	12	15	172	3	327.18	114.51
299	723	17	408	6	59702.46	16716.66
300	88	32	161	1	7608.68	2663.04
301	378	16	948	5	34451.65	11713.55
302	851	22	985	2	15062.92	1506.30
303	750	24	894	10	53496.20	15513.90
304	256	41	958	8	69459.04	12502.64
305	846	26	666	9	28255.05	7911.45
306	665	23	355	6	57422.28	8039.10
307	442	33	150	7	58158.94	17447.71
308	342	11	386	10	76123.70	25882.10
309	223	23	542	2	18873.04	2642.22
310	696	42	600	8	18943.92	6251.52
311	810	29	660	8	35400.88	13098.32
312	255	12	548	8	47632.80	15242.48
313	858	24	746	2	9092.22	3364.12
314	575	10	553	6	39188.70	13716.06
315	649	13	573	2	3208.86	994.74
316	299	31	61	4	7001.12	2730.44
317	733	23	179	6	1960.68	549.00
318	285	22	928	3	18251.10	6022.86
319	598	1	179	9	2941.02	823.50
320	875	45	824	9	72633.69	23969.16
321	587	27	792	4	14365.12	4309.52
322	138	20	255	3	1533.06	582.57
323	617	38	575	9	50035.41	19013.49
324	325	28	500	6	34697.88	6939.60
325	323	29	405	1	5495.44	1703.59
326	838	41	8	8	26836.64	7245.92
327	53	33	372	5	40567.20	11358.80
328	631	2	145	3	22608.93	8139.21
329	562	40	170	4	37130.24	14109.48
330	863	14	157	1	1433.78	372.78
331	149	48	634	9	62322.39	15580.62
332	493	33	232	10	99713.20	20939.80
333	536	21	506	4	2197.64	791.16
334	343	38	258	7	64761.27	25256.91
335	497	18	157	7	10036.46	2609.46
336	251	39	351	2	417.38	41.74
337	88	21	858	1	9668.34	3383.92
338	434	2	12	2	19668.06	3343.58
339	75	41	572	7	43472.03	12172.16
340	207	22	920	9	3508.65	1157.85
341	138	26	468	5	10472.30	1256.70
342	33	38	284	2	3412.20	409.46
343	205	42	8	2	6709.16	1811.48
344	872	28	428	1	4552.15	1593.25
345	41	23	303	4	36988.08	12575.96
346	634	14	337	10	69345.60	10401.80
347	150	50	778	10	57082.50	21691.40
348	591	23	727	5	42202.40	16036.90
349	792	48	447	6	12362.46	3955.98
350	733	45	832	2	11159.04	2120.22
351	310	29	66	4	8574.08	3343.88
352	751	3	234	1	5986.74	898.01
353	187	19	297	10	77296.80	13140.50
354	394	26	140	3	22655.64	7476.36
355	472	26	299	10	90397.00	15367.50
356	833	24	95	1	4801.78	1248.46
357	41	25	99	2	9449.32	3779.72
358	220	25	196	1	2614.47	836.63
359	191	45	110	2	18701.74	3179.30
360	376	34	90	8	45238.40	10857.20
361	33	6	998	10	73185.00	13905.10
362	389	6	939	6	13113.54	5245.44
363	120	20	615	7	64155.07	19246.50
364	236	35	615	3	27495.03	8248.50
365	344	30	763	3	11362.17	3295.02
366	236	35	926	10	53035.60	14850.00
367	457	9	485	6	42265.32	13102.26
368	437	3	775	3	617.88	80.31
369	18	40	835	2	4908.48	1276.20
370	868	8	295	9	41468.04	7049.61
371	10	29	109	2	7716.98	2083.58
372	573	30	620	8	30309.60	10911.44
373	650	37	255	10	5110.20	1941.90
374	230	35	615	2	18330.02	5499.00
375	261	29	203	4	27754.12	9436.40
376	771	6	830	3	11098.41	1109.85
377	530	7	241	10	58574.40	13472.10
378	244	19	958	5	43411.90	7814.15
379	392	2	390	3	4912.41	786.00
380	478	37	277	10	88425.40	9726.80
381	261	29	994	1	2004.85	300.73
382	137	40	642	8	38570.00	12728.08
383	810	6	891	4	31098.76	4975.80
384	573	25	618	5	34964.55	12587.25
385	437	3	972	8	19535.60	6642.08
386	500	49	587	8	1189.20	344.88
387	590	10	169	4	29742.16	4758.76
388	465	24	731	10	55068.40	8260.30
389	435	18	505	4	10390.96	2182.12
390	805	17	750	5	1836.95	587.80
391	823	4	564	4	25648.56	2821.36
392	706	33	88	3	5251.83	1523.04
393	277	48	350	10	70328.70	27428.20
394	831	26	863	8	25530.40	9701.52
395	239	27	60	6	16191.60	1781.10
396	354	49	307	2	7768.96	3029.90
397	614	14	905	10	9523.70	2285.70
398	128	25	832	10	55795.20	10601.10
399	639	7	634	3	20774.13	5193.54
400	41	25	120	8	63624.40	14633.60
401	339	34	341	9	81520.11	18749.61
402	417	10	352	2	19128.96	4017.08
403	527	24	341	3	27173.37	6249.87
404	573	19	254	6	10823.40	4329.36
405	6	17	803	3	16920.87	2368.92
406	320	22	608	4	20761.96	2699.04
407	118	13	548	8	47632.80	15242.48
408	536	2	844	10	90113.90	35144.40
409	713	17	290	10	88767.80	19528.90
410	36	40	73	4	9421.56	1130.60
411	268	17	158	4	34948.80	11183.60
412	143	49	280	2	16267.54	6507.02
413	297	8	21	8	4136.80	537.76
414	651	1	82	3	21508.95	5162.16
415	389	20	560	4	37171.52	13010.04
416	399	39	429	5	23765.10	5228.30
417	429	18	175	6	59449.26	10106.40
418	258	34	160	2	1048.64	335.56
419	7	16	75	7	27916.49	2791.67
420	308	4	646	7	40809.09	11834.62
421	59	43	26	10	36627.00	3662.70
422	286	47	133	3	12781.17	4345.59
423	878	14	283	1	9599.13	1727.84
424	801	34	381	6	7011.06	2033.22
425	239	32	340	4	31010.76	8683.00
426	717	37	385	4	22924.52	6189.64
427	212	18	931	7	18810.89	3009.72
428	664	9	114	3	28455.18	7967.46
429	448	9	373	7	57114.12	6853.70
430	34	19	444	8	78845.44	25230.56
431	471	19	713	7	56229.39	14619.64
432	447	38	729	8	44152.16	15453.28
433	418	31	633	9	61954.83	23542.83
434	356	20	163	1	3370.19	876.25
435	51	16	279	2	7161.10	1647.06
436	838	33	911	8	18896.16	4346.08
437	485	15	21	3	1551.30	201.66
438	562	50	233	6	27234.66	9532.14
439	413	42	827	9	16386.93	2785.77
440	95	50	420	10	49397.00	14819.10
441	226	10	296	6	36833.22	8839.98
442	638	44	478	8	62790.88	8162.80
443	616	29	236	1	5569.83	1559.55
444	762	42	771	8	16697.84	1836.80
445	389	6	65	7	45805.06	8702.96
446	765	7	542	8	75492.16	10568.88
447	366	17	787	6	912.18	164.22
448	103	12	187	1	1499.26	164.92
449	776	22	24	10	13018.40	2733.90
450	371	31	234	1	5986.74	898.01
451	109	29	154	1	5763.50	1037.43
452	3	5	210	4	21362.52	6408.76
453	807	40	980	10	75729.20	15145.80
454	154	14	551	10	71137.40	17073.00
455	734	34	810	9	37643.04	14304.33
456	682	46	318	7	25846.80	5169.36
457	508	36	258	9	83264.49	32473.17
458	482	29	601	6	23739.24	5697.42
459	231	34	562	3	10369.65	2385.03
460	803	8	609	3	27279.27	3273.51
461	797	28	96	8	62884.48	10061.52
462	6	38	750	7	2571.73	822.92
463	482	39	56	7	54018.16	21607.25
464	383	28	904	4	37856.20	6814.12
465	394	26	703	6	37524.84	8255.46
466	163	2	485	1	7044.22	2183.71
467	55	41	526	5	3684.60	479.00
468	315	33	91	4	39775.48	9148.36
469	113	43	814	9	77078.70	26977.50
470	69	31	434	5	42155.55	8009.55
471	504	42	607	8	49026.64	10785.84
472	448	9	451	6	44897.70	8530.56
473	129	11	213	4	4237.60	508.52
474	556	42	629	7	39121.46	6259.40
475	518	15	80	2	9619.36	3751.56
476	591	50	433	3	4005.72	1401.99
477	821	33	302	5	32612.20	13044.90
478	83	16	9	8	58638.08	18177.84
479	284	31	51	5	27402.85	3562.35
480	324	45	719	5	17776.25	4266.30
481	637	41	674	9	59544.00	21435.84
482	328	35	901	2	3359.12	638.24
483	420	38	380	4	10489.52	2412.60
484	202	39	100	5	28664.85	6019.60
485	396	13	698	3	9859.62	1084.56
486	847	50	340	3	23258.07	6512.25
487	826	9	237	9	70485.93	16211.79
488	263	24	748	3	11236.08	1797.78
489	364	8	347	9	65070.45	13664.79
490	514	32	610	7	61177.83	7341.32
491	794	32	71	6	22993.56	4828.62
492	685	29	201	8	32341.60	5821.52
493	99	46	864	3	23195.70	5566.98
494	826	21	315	8	35385.36	8138.64
495	406	21	690	3	15775.59	3155.13
496	242	24	33	10	39544.90	11863.50
497	563	35	892	8	27590.80	7449.52
498	606	40	301	10	26588.90	5583.70
499	565	43	521	4	33877.76	13212.32
500	806	15	571	3	18876.30	2076.39
501	273	28	688	3	26745.84	3209.49
502	198	16	658	9	76552.47	20669.13
503	493	5	410	1	1246.29	473.59
504	119	17	679	8	78211.52	28938.24
505	631	2	620	9	34098.30	12275.37
506	407	28	101	10	84964.50	22940.40
507	3	2	954	4	31777.60	11122.16
508	693	41	305	6	54006.42	16201.92
509	470	9	4	3	20614.89	5359.86
510	445	50	690	4	21034.12	4206.84
511	390	17	775	5	1029.80	133.85
512	647	8	836	9	64881.27	14273.91
513	409	40	119	6	10282.92	2673.54
514	324	26	373	2	16318.32	1958.20
515	183	38	473	6	49908.78	10979.94
516	86	42	886	4	4990.48	1896.40
517	571	15	117	5	18084.55	7233.80
518	755	44	414	8	66430.88	18600.64
519	465	39	942	6	10744.26	1611.66
520	60	43	890	2	2756.80	551.36
521	247	47	690	6	31551.18	6310.26
522	396	13	641	3	18847.92	5842.86
523	230	5	794	9	42481.26	5522.58
524	630	27	807	10	53787.70	18825.70
525	266	21	105	4	14125.08	4378.76
526	779	45	776	10	54709.70	14771.60
527	231	25	547	5	37121.80	4825.85
528	599	44	561	8	15838.24	3959.52
529	283	34	134	7	33843.39	5753.37
530	192	42	19	2	19688.62	2559.52
531	327	44	997	1	4576.42	686.46
532	77	38	832	9	50215.68	9540.99
533	647	8	53	9	87974.91	9677.25
534	349	27	244	7	43007.72	16772.98
535	335	6	152	2	4863.16	778.10
536	796	5	576	5	4988.10	1596.20
537	459	21	319	3	18815.55	7149.90
538	67	4	445	10	83936.40	13429.80
539	574	42	33	4	15817.96	4745.40
540	497	16	591	8	4767.36	524.40
541	156	49	209	9	14706.90	5294.52
542	45	2	777	9	87842.70	19325.43
543	208	3	934	7	575.82	80.64
544	233	26	532	1	8956.97	1074.84
545	51	16	173	6	38474.58	13850.82
546	477	1	56	4	30867.52	12347.00
547	731	11	841	10	76182.30	25902.00
548	856	4	784	10	90453.10	34372.20
549	407	45	426	4	17771.60	3554.32
550	785	34	155	3	16026.75	4166.97
551	538	19	930	2	18676.48	4855.88
552	563	9	268	10	68801.90	6880.20
553	85	46	429	3	14259.06	3136.98
554	111	5	574	1	8466.65	2116.66
555	479	43	747	2	276.52	44.24
556	485	33	514	3	1492.47	194.01
557	356	20	575	2	11118.98	4225.22
558	678	39	397	2	10923.36	1201.56
559	781	42	197	7	37818.97	9454.76
560	433	2	169	8	59484.32	9517.52
561	612	47	261	1	2289.67	824.28
562	570	15	964	10	94862.10	24664.10
563	25	31	243	8	8399.20	2435.76
564	351	17	455	1	3974.47	516.68
565	224	42	843	6	54969.96	12093.42
566	591	26	723	8	42403.28	8480.64
567	734	34	184	5	8938.80	3486.15
568	99	32	171	1	9174.19	3119.22
569	15	2	619	8	8377.84	1424.24
570	171	13	286	5	23520.20	6820.85
571	397	16	818	6	51698.04	14475.48
572	166	14	139	8	72379.84	15199.76
573	214	34	819	9	27549.00	10193.13
574	498	30	667	10	53533.40	21413.40
575	527	24	176	1	4886.16	1661.29
576	563	35	121	5	34323.35	3775.55
577	218	13	407	10	44376.00	15531.60
578	630	27	915	2	4975.04	1044.76
579	6	38	287	3	8717.70	3225.54
580	456	4	81	8	48915.36	18587.84
581	258	9	18	10	99893.70	17980.90
582	598	1	85	4	14258.68	3992.44
583	665	23	731	10	55068.40	8260.30
584	386	47	110	8	74806.96	12717.20
585	459	21	86	2	14484.06	1593.24
586	140	31	786	10	43350.30	16473.10
587	218	13	525	3	20667.90	7440.45
588	693	41	480	9	49630.05	8437.14
589	49	30	697	1	1313.28	472.78
590	390	41	600	10	23679.90	7814.40
591	734	48	660	5	22125.55	8186.45
592	802	46	317	2	7986.48	3034.86
593	79	48	970	4	872.64	261.80
594	240	1	436	9	61562.70	15390.63
595	248	12	510	7	38874.01	5053.65
596	478	8	965	2	13496.04	2969.12
597	80	33	392	8	52246.80	18808.88
598	445	18	543	10	39934.80	11181.70
599	482	19	536	3	21211.23	5727.03
600	436	20	282	3	8631.48	3366.27
601	326	19	139	2	18094.96	3799.94
602	185	25	105	3	10593.81	3284.07
603	543	41	33	10	39544.90	11863.50
604	533	26	523	8	64810.88	25276.24
605	211	19	276	7	67314.10	24233.09
606	600	29	930	7	65367.68	16995.58
607	206	44	130	10	82328.30	12349.20
608	833	24	32	6	32349.42	12616.26
609	700	32	34	9	48436.47	16952.76
610	810	6	448	9	40671.27	9761.13
611	810	47	777	6	58561.80	12883.62
612	487	44	711	2	6774.10	1016.12
613	219	32	308	9	11511.54	4604.58
614	666	5	383	6	47086.08	9888.06
615	556	42	997	4	18305.68	2745.84
616	6	37	280	3	24401.31	9760.53
617	279	19	445	6	50361.84	8057.88
618	63	11	617	7	41513.64	15775.20
619	270	33	568	7	59877.30	18561.97
620	391	29	617	1	5930.52	2253.60
621	198	38	126	3	12782.22	1533.87
622	383	23	719	5	17776.25	4266.30
623	514	32	994	3	6014.55	902.19
624	810	47	62	3	13310.58	3061.44
625	220	25	343	8	76816.56	11522.48
626	873	26	120	8	63624.40	14633.60
627	704	10	761	10	98453.10	31505.00
628	13	9	369	8	18440.00	3503.60
629	211	3	781	1	3412.20	443.59
630	341	28	905	4	3809.48	914.28
631	83	16	314	9	63946.80	21102.48
632	165	38	141	3	18209.01	2913.45
633	709	34	190	3	17006.55	4761.84
634	328	37	460	7	23285.78	6520.01
635	256	23	543	3	11980.44	3354.51
636	859	9	281	7	32358.27	7118.79
637	340	11	545	7	4038.09	1453.69
638	347	10	31	3	12638.43	4044.30
639	248	3	982	3	27314.49	10652.64
640	661	24	126	1	4260.74	511.29
641	315	46	788	8	29292.40	4686.80
642	534	32	726	5	21673.95	7152.40
643	174	8	726	7	30343.53	10013.36
644	394	26	570	10	21236.20	7220.30
645	336	42	632	4	1031.08	216.52
646	389	17	270	7	1822.59	601.44
647	760	36	348	2	1339.60	522.44
648	462	36	112	5	13058.75	1305.85
649	81	13	348	1	669.80	261.22
650	56	3	549	9	53822.34	14532.03
651	251	22	663	4	30321.40	11522.12
652	822	11	852	3	23171.55	5329.47
653	701	5	888	9	51820.11	13991.40
654	399	39	622	3	11664.75	1166.46
655	387	12	448	2	9038.06	2169.14
656	667	28	307	5	19422.40	7574.75
657	176	9	980	6	45437.52	9087.48
658	835	19	5	7	61091.52	21382.06
659	395	24	400	5	26847.35	7785.75
660	549	37	946	8	70600.00	24004.00
661	649	47	595	5	41175.55	7411.60
662	6	37	32	7	37740.99	14718.97
663	586	25	103	2	5456.78	1200.50
664	739	37	662	8	20296.64	4059.36
665	700	32	320	1	7288.37	1822.09
666	793	1	114	7	66395.42	18590.74
667	854	38	875	2	18403.26	4416.78
668	740	34	191	9	27489.78	4673.25
669	24	32	306	1	7220.81	2816.12
670	827	20	392	3	19592.55	7053.33
671	516	31	20	8	21548.72	4309.76
672	401	6	546	5	29548.35	3545.80
673	373	46	610	3	26219.07	3146.28
674	248	12	392	8	52246.80	18808.88
675	728	10	460	6	19959.24	5588.58
676	726	46	319	8	50174.80	19066.40
677	214	27	652	4	16965.92	6786.36
678	369	34	563	3	23296.62	3028.56
679	485	18	828	4	9213.40	3408.96
680	205	34	916	9	25280.01	4297.59
681	467	50	167	7	52262.77	6271.51
682	705	24	777	9	87842.70	19325.43
683	85	33	59	3	11296.32	3050.01
684	450	42	700	10	50771.40	15231.40
685	438	25	495	3	16975.74	5262.48
686	477	1	503	7	26122.32	6008.10
687	650	7	397	6	32770.08	3604.68
688	236	23	151	2	7299.26	1386.86
689	811	2	771	2	4174.46	459.20
690	586	34	569	8	33166.40	6964.96
691	349	14	365	4	14169.36	4534.20
692	794	32	170	10	92825.60	35273.70
693	498	27	984	7	39617.62	5150.32
694	560	45	166	8	57314.08	21779.36
695	826	4	426	2	8885.80	1777.16
696	350	34	780	5	32041.15	7049.05
697	858	16	710	9	75569.67	30227.85
698	74	28	718	3	25888.77	5954.43
699	793	12	946	6	52950.00	18003.00
700	563	18	323	3	6263.19	1878.96
701	156	49	874	10	28598.30	5147.70
702	122	5	560	1	9292.88	3252.51
703	328	35	80	6	28858.08	11254.68
704	767	2	443	3	8109.99	1946.40
705	720	10	134	9	43512.93	7397.19
706	10	29	232	10	99713.20	20939.80
707	807	38	262	1	7560.76	2268.23
708	856	9	118	4	9346.16	2523.48
709	371	43	882	4	3508.80	807.04
710	310	22	391	9	5102.10	867.33
711	732	11	722	4	38409.72	10370.64
712	514	27	951	4	11375.48	3412.64
713	233	26	385	7	40117.91	10831.87
714	269	12	334	7	61252.17	14700.49
715	437	12	62	3	13310.58	3061.44
716	243	33	916	8	22471.12	3820.08
717	846	19	958	5	43411.90	7814.15
718	96	1	579	2	10860.44	3909.76
719	770	38	456	9	48523.14	4852.35
720	697	3	901	9	15116.04	2872.08
721	840	46	565	9	16727.22	5854.50
722	301	32	650	7	58352.42	21590.38
723	331	8	193	2	10245.34	2561.34
724	483	15	562	3	10369.65	2385.03
725	355	21	623	9	64514.88	12902.94
726	640	45	820	1	1847.37	683.53
727	751	3	203	10	69385.30	23591.00
728	131	11	605	10	55471.80	21634.00
729	184	15	860	5	46952.55	14085.75
730	320	22	728	3	29646.99	7708.23
731	45	2	254	3	5411.70	2164.68
732	647	48	266	10	66064.30	23122.50
733	813	3	628	4	16112.84	3867.08
734	139	19	311	2	6249.76	1874.92
735	119	1	301	1	2658.89	558.37
736	792	50	996	7	56143.01	16281.44
737	205	36	752	9	27999.72	8959.95
738	570	15	985	10	75314.60	7531.50
739	114	36	715	7	51739.38	5691.35
740	701	38	171	4	36696.76	12476.88
741	57	14	714	7	61116.51	23224.25
742	854	38	310	1	1310.64	131.06
743	665	40	37	3	28410.00	2841.00
744	590	10	814	10	85643.00	29975.00
745	284	20	992	4	3241.64	972.48
746	5	50	801	4	9766.08	1367.24
747	686	22	208	7	53022.06	17497.27
748	327	23	369	9	20745.00	3941.55
749	247	47	583	4	21017.24	5044.12
750	802	46	64	2	4928.44	1675.66
751	184	1	954	8	63555.20	22244.32
752	251	22	717	5	49211.15	8858.00
753	753	25	133	4	17041.56	5794.12
754	521	13	416	9	18723.87	7115.04
755	865	17	388	9	50219.82	13057.11
756	833	22	520	5	2702.05	1026.80
757	319	40	592	9	88361.91	16788.78
758	734	34	1000	6	13341.18	4269.18
759	347	33	599	10	27003.60	8641.20
760	137	18	663	1	7580.35	2880.53
761	421	45	937	7	3401.93	442.26
762	315	33	684	9	74065.77	14072.49
763	608	15	777	4	39041.20	8589.08
764	729	6	539	3	12802.59	2688.54
765	624	18	54	1	143.73	43.12
766	454	7	429	7	33271.14	7319.62
767	608	15	482	10	33608.40	7393.80
768	263	24	868	3	11053.56	2321.25
769	450	24	303	1	9247.02	3143.99
770	267	37	422	2	11002.96	1870.50
771	863	14	443	5	13516.65	3244.00
772	450	42	497	5	26170.00	8897.80
773	670	15	261	6	13738.02	4945.68
774	271	40	706	3	24680.70	2468.07
775	739	33	360	3	5002.29	850.38
776	824	14	853	10	69662.90	18809.00
777	466	49	829	4	32644.76	9467.00
778	573	19	450	2	16812.26	4371.18
779	490	13	255	6	3066.12	1165.14
780	112	8	399	7	27125.00	6238.75
781	375	4	397	6	32770.08	3604.68
782	79	48	983	10	34873.20	5579.70
783	747	1	918	2	5886.16	1706.98
784	542	10	495	10	56585.80	17541.60
785	848	28	722	10	96024.30	25926.60
786	185	17	768	10	99483.90	32829.70
787	428	1	78	7	45457.30	6364.05
788	809	20	765	1	29.61	6.51
789	445	23	631	9	23883.21	2627.19
790	536	21	798	9	63875.07	24272.55
791	377	20	329	1	8791.69	2725.42
792	401	6	951	2	5687.74	1706.32
793	661	38	698	5	16432.70	1807.60
794	299	2	503	7	26122.32	6008.10
795	795	37	934	4	329.04	46.08
796	112	6	411	1	6569.95	1379.69
797	770	34	919	10	90993.10	12739.00
798	846	26	686	3	10259.22	2564.82
799	655	18	42	5	26307.90	8681.60
800	255	6	876	6	7339.02	2862.24
801	856	10	853	10	69662.90	18809.00
802	258	9	834	4	13418.76	5367.52
803	288	38	353	5	10943.30	3064.10
804	762	42	793	8	53173.44	15420.32
805	855	29	113	3	3529.44	847.08
806	580	10	893	4	24896.92	7967.00
807	779	45	309	8	12756.40	2551.28
808	315	12	501	7	58396.94	20438.95
809	303	34	659	9	52406.91	11529.54
810	252	23	449	4	34776.48	5216.48
811	738	10	825	7	7857.78	2278.78
812	747	1	257	1	4729.20	662.09
813	805	17	179	2	653.56	183.00
814	91	24	856	9	15024.15	3605.76
815	699	45	745	9	73399.77	12477.96
816	592	20	615	1	9165.01	2749.50
817	744	31	936	3	13886.01	4443.51
818	373	46	451	3	22448.85	4265.28
819	645	2	522	7	57504.16	14951.09
820	563	28	425	1	2805.81	476.99
821	856	4	80	4	19238.72	7503.12
822	586	34	190	1	5668.85	1587.28
823	858	6	76	2	3081.42	1201.76
824	512	7	757	4	4344.44	738.56
825	392	2	901	3	5038.68	957.36
826	392	25	21	4	2068.40	268.88
827	192	42	700	3	15231.42	4569.42
828	673	10	306	5	36104.05	14080.60
829	314	15	395	2	15279.86	2444.78
830	670	38	804	6	27191.10	10332.60
831	248	12	700	5	25385.70	7615.70
832	209	5	263	2	18744.68	3561.48
833	545	23	973	7	24052.14	8899.31
834	45	30	612	1	8672.57	2081.42
835	45	2	956	6	50028.78	14008.08
836	856	10	615	7	64155.07	19246.50
837	500	29	176	8	39089.28	13290.32
838	75	41	255	8	4088.16	1553.52
839	824	50	502	6	35902.74	7539.60
840	844	20	736	7	45515.89	5006.75
841	879	2	720	10	31549.50	11042.30
842	564	50	245	7	56069.30	16260.09
843	449	37	572	3	18630.87	5216.64
844	376	34	763	4	15149.56	4393.36
845	251	32	865	6	55259.76	9394.14
846	867	25	286	8	37632.32	10913.36
847	705	24	246	3	3741.06	972.69
848	477	35	662	5	12685.40	2537.10
849	513	10	882	10	8772.00	2017.60
850	775	17	296	1	6138.87	1473.33
851	833	19	834	2	6709.38	2683.76
852	53	35	443	6	16219.98	3892.80
853	393	5	59	4	15061.76	4066.68
854	472	26	172	8	872.48	305.36
855	222	7	193	8	40981.36	10245.36
856	608	30	336	1	4192.06	544.97
857	85	33	538	9	52941.06	7411.77
858	617	5	469	2	72.78	21.84
859	285	10	802	7	21054.74	6316.45
860	130	50	342	6	47710.86	13836.12
861	556	42	63	10	77391.80	12382.70
862	377	3	223	9	77475.42	7747.56
863	704	10	130	8	65862.64	9879.36
864	740	31	578	5	11192.40	1343.10
865	227	41	999	1	686.27	192.16
866	608	40	574	10	84666.50	21166.60
867	218	9	19	4	39377.24	5119.04
868	454	14	691	10	84680.70	27097.80
869	696	47	96	9	70745.04	11319.21
870	805	17	92	1	5704.10	1996.43
871	315	33	177	5	28696.90	4017.55
872	20	38	896	2	1823.02	364.60
873	319	40	550	8	37328.24	4479.36
874	257	50	95	1	4801.78	1248.46
875	655	17	702	6	52995.78	14838.84
876	401	41	367	8	1290.16	335.44
877	661	24	378	9	53882.55	18320.04
878	391	29	565	4	7434.32	2602.00
879	668	5	528	2	19190.96	6333.02
880	336	9	473	10	83181.30	18299.90
881	784	44	313	3	28083.99	10391.07
882	504	42	445	2	16787.28	2685.96
883	475	30	226	6	26851.38	3490.68
884	745	20	437	7	37913.12	13269.62
885	565	1	135	6	32121.24	4818.18
886	604	28	430	1	1088.39	185.03
887	680	16	192	5	15276.45	4124.65
888	866	2	851	8	34435.28	4820.96
889	853	32	993	7	50410.08	12602.52
890	869	17	944	1	4491.62	1212.74
891	428	1	894	7	37447.34	10859.73
892	239	23	223	8	68867.04	6886.72
893	720	47	492	1	2051.85	471.93
894	336	42	649	6	52041.00	19255.14
895	161	30	43	6	57913.86	9845.34
896	788	43	168	8	5258.16	578.40
897	447	42	520	9	4863.69	1848.24
898	664	9	390	1	1637.47	262.00
899	397	16	220	10	47243.10	9921.10
900	520	10	552	3	14574.42	5538.27
901	810	29	294	4	23562.32	4241.20
902	506	2	296	7	42972.09	10313.31
903	222	4	584	2	10029.34	3209.38
904	613	23	606	6	55378.32	21043.74
905	589	4	127	1	5963.89	2266.28
906	805	14	85	5	17823.35	4990.55
907	805	49	957	10	51479.10	7207.10
908	215	10	811	6	58870.62	23548.26
909	339	34	116	7	15692.53	3138.52
910	161	44	598	9	19841.49	5158.80
911	667	28	383	1	7847.68	1648.01
912	80	18	284	8	13648.80	1637.84
913	850	23	603	9	23547.51	7064.28
914	578	11	64	9	22177.98	7540.47
915	531	45	977	2	17025.68	3745.64
916	634	14	452	7	16352.42	4905.74
917	521	13	494	9	26224.83	4458.24
918	223	23	815	2	13152.62	2235.94
919	792	48	533	9	29486.97	11205.09
920	221	8	553	5	32657.25	11430.05
921	203	8	201	9	36384.30	6549.21
922	397	29	220	6	28345.86	5952.66
923	608	40	922	3	27558.48	6062.88
924	386	25	323	4	8350.92	2505.28
925	423	35	301	10	26588.90	5583.70
926	560	40	892	8	27590.80	7449.52
927	856	10	179	7	2287.46	640.50
928	274	49	295	2	9215.12	1566.58
929	375	4	845	6	53290.92	11191.08
930	334	11	667	6	32120.04	12848.04
931	766	36	535	4	39747.68	14309.16
932	504	42	542	3	28309.56	3963.33
933	529	2	503	4	14927.04	3433.20
934	10	29	898	14	70362.46	26737.76
935	161	44	721	4	39868.96	9568.56
936	796	21	986	6	45797.28	15113.10
937	417	5	565	3	5575.74	1951.50
938	804	19	266	3	19819.29	6936.75
939	207	29	345	7	69465.20	20144.88
940	542	10	859	2	14880.52	5505.80
941	846	19	74	3	1065.15	244.98
942	649	49	239	6	12247.38	3796.68
943	474	3	399	5	19375.00	4456.25
944	256	23	281	8	36980.88	8135.76
945	256	23	374	4	6623.68	1390.96
946	150	50	237	6	46990.62	10807.86
947	229	24	384	3	29507.70	3245.85
948	801	34	727	8	67523.84	25659.04
949	263	24	145	10	75363.10	27130.70
950	683	6	85	10	35646.70	9981.10
951	768	44	990	4	29974.04	6294.56
952	693	17	317	9	35939.16	13656.87
953	552	32	501	4	33369.68	11679.40
954	810	38	137	7	44704.24	14305.34
955	826	21	786	8	34680.24	13178.48
956	824	14	860	5	46952.55	14085.75
957	423	35	929	4	6257.08	1752.00
958	513	35	724	5	46400.65	12992.20
959	385	38	319	3	18815.55	7149.90
960	204	30	660	8	35400.88	13098.32
961	142	37	197	7	37818.97	9454.76
962	123	16	181	1	3727.80	1192.90
963	131	46	621	9	39189.24	13324.32
964	141	30	330	6	42250.74	10985.22
965	56	9	629	3	16766.34	2682.60
966	481	12	957	9	46331.19	6486.39
967	6	17	220	10	47243.10	9921.10
968	758	35	304	8	66882.32	10701.20
969	552	32	885	1	935.10	355.34
970	846	13	464	6	3127.26	1094.52
971	616	23	509	3	21418.47	6639.72
972	316	27	350	7	49230.09	19199.74
973	246	17	36	5	35992.55	10077.90
974	425	21	259	6	49759.74	4975.98
975	217	41	774	2	17429.90	3311.68
976	398	24	33	6	23726.94	7118.10
977	374	26	250	6	22433.04	7178.58
978	477	34	779	1	6969.37	2160.50
979	655	12	396	1	2691.38	645.93
980	696	43	120	4	31812.20	7316.80
981	248	3	986	8	61063.04	20150.80
982	437	45	14	7	53777.36	12906.60
983	650	9	391	9	5102.10	867.33
984	739	29	993	4	28805.76	7201.44
985	498	25	722	8	76819.44	20741.28
986	82	12	256	10	1627.30	618.40
987	875	45	496	6	2316.72	671.82
988	681	29	633	4	27535.48	10463.48
989	343	41	740	4	24765.08	9906.04
990	6	38	146	5	16356.20	1962.75
991	802	32	981	3	5313.18	1275.15
992	564	7	562	8	27652.40	6360.08
993	870	37	656	6	6329.28	696.24
994	846	26	642	5	24106.25	7955.05
995	237	13	598	2	4409.22	1146.40
996	390	17	463	2	18851.06	4147.24
997	562	50	646	6	34979.22	10143.96
998	546	25	979	9	80183.79	26460.63
999	768	49	258	3	27754.83	10824.39
1000	781	42	992	1	810.41	243.12
1001	503	39	365	5	17711.70	5667.75
1002	347	10	229	3	8319.39	2163.03
1003	760	16	242	6	59983.02	19794.42
1004	832	14	573	5	8022.15	2486.85
1005	614	14	363	10	77756.20	9330.70
1006	612	1	990	1	7493.51	1573.64
1007	372	14	177	9	51654.42	7231.59
1008	187	19	294	2	11781.16	2120.60
1009	374	26	38	6	29358.12	7926.72
1010	284	20	825	2	2245.08	651.08
1011	837	43	700	10	50771.40	15231.40
1012	764	35	804	5	22659.25	8610.50
1013	638	40	938	7	22991.08	6667.43
1014	309	30	546	6	35458.02	4254.96
1015	456	11	578	5	11192.40	1343.10
1016	608	15	539	5	21337.65	4480.90
1017	275	6	661	7	9468.90	3219.44
1018	245	10	271	9	53780.67	10218.33
1019	802	46	905	1	952.37	228.57
1020	74	28	415	4	26102.04	3132.24
1021	564	50	577	3	23430.24	3983.13
1022	780	49	742	5	36625.90	12452.80
1023	685	29	42	6	31569.48	10417.92
1024	581	3	962	1	7214.48	1442.90
1025	82	10	715	4	29565.36	3252.20
1026	470	9	646	7	40809.09	11834.62
1027	668	5	209	6	9804.60	3529.68
1028	222	49	828	10	23033.50	8522.40
1029	668	9	607	7	42898.31	9437.61
1030	706	6	85	8	28517.36	7984.88
1031	433	2	1000	7	15564.71	4980.71
1032	242	48	643	8	57443.60	13212.00
1033	694	25	78	9	58445.10	8182.35
1034	6	17	124	6	28487.64	8546.28
1035	858	16	373	4	32636.64	3916.40
1036	826	39	139	2	18094.96	3799.94
1037	866	48	307	4	15537.92	6059.80
1038	825	29	894	7	37447.34	10859.73
1039	248	3	519	9	3206.43	1154.34
1040	411	26	928	9	54753.30	18068.58
1041	670	38	161	5	38043.40	13315.20
1042	295	25	538	8	47058.72	6588.24
1043	500	49	800	9	88191.63	15874.47
1044	333	24	845	5	44409.10	9325.90
1045	685	4	184	8	14302.08	5577.84
1046	331	22	673	4	21008.40	6092.44
1047	855	38	735	3	26804.16	9381.45
1048	245	4	71	7	26825.82	5633.39
1049	239	23	761	2	19690.62	6301.00
1050	593	50	734	4	5449.48	2125.28
1051	160	5	962	6	43286.88	8657.40
1052	572	31	546	2	11819.34	1418.32
1053	397	29	178	1	6185.20	927.78
1054	650	7	887	8	62714.72	20695.84
1055	489	10	839	5	46103.50	5071.40
1056	565	38	362	1	9421.45	2826.43
1057	717	37	931	8	21498.16	3439.68
1058	571	15	968	10	37474.40	9743.30
1059	70	45	846	10	66806.50	19373.90
1060	272	19	319	2	12543.70	4766.60
1061	725	10	96	6	47163.36	7546.14
1062	25	10	565	8	14868.64	5204.00
1063	525	34	904	7	66248.35	11924.71
1064	251	22	983	7	24411.24	3905.79
1065	765	7	518	8	1983.04	416.40
1066	285	10	227	6	44466.30	14673.90
1067	16	10	717	2	19684.46	3543.20
1068	687	18	273	1	3632.66	690.21
1069	156	49	516	4	13823.60	4976.48
1070	584	26	108	10	61884.20	8663.80
1071	673	2	740	7	43338.89	17335.57
1072	457	9	825	9	10102.86	2929.86
1073	502	36	793	1	6646.68	1927.54
1074	64	29	723	5	26502.05	5300.40
1075	407	28	678	3	9943.17	3678.96
1076	47	31	358	10	246.00	73.80
1077	485	35	755	3	25437.21	4833.06
1078	544	1	637	5	17094.75	6666.95
1079	876	17	229	8	22185.04	5768.08
1080	113	9	898	6	30155.34	11459.04
1081	831	26	808	3	27554.49	6061.98
1082	806	15	148	5	8228.70	2468.60
1083	335	6	535	2	19873.84	7154.58
1084	780	29	890	7	9648.80	1929.76
1085	251	22	967	2	19274.44	6746.06
1086	98	38	909	3	14716.50	3679.14
1087	538	35	602	6	20158.56	3830.10
1088	400	38	184	7	12514.32	4880.61
1089	99	46	110	1	9350.87	1589.65
1090	632	21	288	5	4969.70	1590.30
1091	425	18	264	10	90649.50	12690.90
1092	344	50	137	3	19158.96	6130.86
1093	502	36	798	4	28388.92	10787.80
1094	448	25	902	4	3655.72	804.24
1095	252	23	952	8	160.80	30.56
1096	441	25	958	2	17364.76	3125.66
1097	588	37	950	4	23064.44	6688.68
1098	803	8	488	8	77010.00	8471.12
1099	287	36	4	4	27486.52	7146.48
1100	857	26	148	5	8228.70	2468.60
1101	42	4	414	6	49823.16	13950.48
1102	624	18	818	2	17232.68	4825.16
1103	335	6	285	7	20622.84	3093.44
1104	221	8	466	1	7225.30	2239.84
1105	209	5	543	6	23960.88	6709.02
1106	400	28	38	6	29358.12	7926.72
1107	462	36	9	8	58638.08	18177.84
1108	869	17	530	4	16048.52	2567.76
1109	170	21	975	3	3748.56	487.32
1110	124	21	815	3	19728.93	3353.91
1111	696	43	179	8	2614.24	732.00
1112	279	19	301	10	26588.90	5583.70
1113	218	11	871	8	13385.44	1472.40
1114	827	20	793	4	26586.72	7710.16
1115	18	5	968	2	7494.88	1948.66
1116	326	24	593	5	2426.75	897.90
1117	514	27	925	7	34920.97	5587.33
1118	466	49	789	10	94809.10	22754.20
1119	705	21	250	4	14955.36	4785.72
1120	861	38	114	10	94850.60	26558.20
1121	25	31	439	8	33586.48	4366.24
1122	599	44	339	3	22457.91	8309.43
1123	496	13	841	5	38091.15	12951.00
1124	267	39	277	2	17685.08	1945.36
1125	646	17	29	2	12051.54	2651.34
1126	162	16	970	9	1963.44	589.05
1127	437	45	801	9	21973.68	3076.29
1128	524	18	902	3	2741.79	603.18
1129	392	2	863	1	3191.30	1212.69
1130	621	9	134	6	29008.62	4931.46
1131	112	6	654	6	49882.62	12969.48
1132	802	2	79	6	54374.58	10331.16
1133	673	18	839	3	27662.10	3042.84
1134	820	8	948	1	6890.33	2342.71
1135	471	19	63	9	69652.62	11144.43
1136	699	45	210	3	16021.89	4806.57
1137	355	21	256	4	650.92	247.36
1138	638	40	7	4	18776.44	2816.48
1139	713	29	425	1	2805.81	476.99
1140	475	30	292	6	47489.76	13772.04
1141	502	44	629	10	55887.80	8942.00
1142	112	6	53	4	39099.96	4301.00
1143	699	6	830	10	36994.70	3699.50
1144	283	32	697	6	7879.68	2836.68
1145	274	3	147	6	48962.34	10771.74
1146	13	9	179	3	980.34	274.50
1147	872	28	851	2	8608.82	1205.24
1148	726	13	186	6	19462.56	3697.86
1149	634	14	681	9	46101.15	6454.17
1150	216	6	15	1	5280.98	1214.63
1151	520	10	799	6	35160.30	9844.86
1152	640	45	901	8	13436.48	2552.96
1153	67	48	305	4	36004.28	10801.28
1154	421	45	587	8	1189.20	344.88
1155	573	25	852	7	54066.95	12435.43
1156	599	44	957	2	10295.82	1441.42
1157	835	19	146	2	6542.48	785.10
1158	866	30	139	10	90474.80	18999.70
1159	438	42	903	5	38839.50	12040.25
1160	514	32	917	6	5458.32	600.42
1161	548	23	815	5	32881.55	5589.85
1162	378	16	956	6	50028.78	14008.08
1163	185	17	202	6	52716.90	8961.90
1164	252	33	532	3	26870.91	3224.52
1165	362	30	489	1	7009.37	1612.16
1166	580	10	731	10	55068.40	8260.30
1167	825	31	339	6	44915.82	16618.86
1168	33	17	891	10	77746.90	12439.50
1169	529	48	723	3	15901.23	3180.24
1170	260	16	835	4	9816.96	2552.40
1171	427	30	477	7	8585.50	2919.07
1172	455	41	672	2	14707.14	2794.36
1173	346	15	479	6	3863.04	463.56
1174	519	19	880	2	12569.14	1633.98
1175	776	37	484	2	18092.08	4703.94
1176	18	9	197	2	10805.42	2701.36
1177	301	9	928	8	48669.60	16060.96
1178	510	32	800	9	88191.63	15874.47
1179	802	32	882	7	6140.40	1412.32
1180	858	16	206	5	40312.20	6449.95
1181	503	39	749	8	13467.84	3636.32
1182	838	48	908	10	59581.70	22045.20
1183	69	31	379	6	40792.02	4487.10
1184	499	14	816	9	10772.82	3662.73
1185	829	8	482	3	10082.52	2218.14
1186	680	39	56	2	15433.76	6173.50
1187	463	46	724	6	55680.78	15590.64
1188	705	30	711	7	23709.35	3556.42
1189	144	24	193	6	30736.02	7684.02
1190	252	23	932	8	25606.24	2560.64
1191	513	35	973	7	24052.14	8899.31
1192	138	6	801	3	7324.56	1025.43
1193	327	23	831	9	3708.81	741.78
1194	746	50	42	5	26307.90	8681.60
1195	616	44	147	5	40801.95	8976.45
1196	612	1	246	4	4988.08	1296.92
1197	424	3	808	2	18369.66	4041.32
1198	6	38	84	1	1918.45	211.03
1199	498	27	986	10	76328.80	25188.50
1200	603	36	838	1	5127.85	1128.13
1201	591	23	52	3	13910.88	1391.10
1202	774	6	322	3	23279.64	9079.05
1203	502	44	595	5	41175.55	7411.60
1204	779	34	765	4	118.44	26.04
1205	101	17	632	5	1288.85	270.65
1206	102	27	354	1	6086.38	608.64
1207	148	2	346	5	20039.15	5410.55
1208	542	10	779	1	6969.37	2160.50
1209	753	25	833	10	39709.90	12310.10
1210	606	40	576	7	6983.34	2234.68
1211	214	34	703	8	50033.12	11007.28
1212	847	50	569	10	41458.00	8706.20
1213	140	31	764	3	22736.07	5001.93
1214	349	27	734	3	4087.11	1593.96
1215	413	1	863	2	6382.60	2425.38
1216	152	34	729	7	38633.14	13521.62
1217	86	44	881	2	18690.92	7476.36
1218	529	48	377	1	2098.28	524.57
1219	749	43	469	3	109.17	32.76
1220	726	46	632	8	2062.16	433.04
1221	107	40	6	1	5645.42	1524.26
1222	667	28	665	9	7239.33	1520.28
1223	670	15	91	4	39775.48	9148.36
1224	372	14	391	10	5669.00	963.70
1225	245	13	323	4	8350.92	2505.28
1226	538	19	549	3	17940.78	4844.01
1227	305	48	618	2	13985.82	5034.90
1228	423	35	829	1	8161.19	2366.75
1229	758	35	6	5	28227.10	7621.30
1230	877	31	664	5	5867.70	645.45
1231	78	31	239	3	6123.69	1898.34
1232	33	45	29	9	54231.93	11931.03
1233	283	34	68	7	54406.66	20674.50
1234	473	25	256	9	1464.57	556.56
1235	371	31	949	4	27000.48	8910.16
1236	823	4	724	4	37120.52	10393.76
1237	855	38	629	3	16766.34	2682.60
1238	374	10	124	7	33235.58	9970.66
1239	383	23	158	10	87372.00	27959.00
1240	339	46	415	6	39153.06	4698.36
1241	418	29	146	1	3271.24	392.55
1242	161	21	550	7	32662.21	3919.44
1243	74	26	87	1	5886.40	706.37
1244	323	2	755	7	59353.49	11277.14
1245	500	26	792	6	21547.68	6464.28
1246	439	28	361	2	7842.72	1411.68
1247	321	12	57	10	31974.30	7673.80
1248	604	28	120	3	23859.15	5487.60
1249	333	6	525	9	62003.70	22321.35
1250	208	3	334	8	70002.48	16800.56
1251	640	45	269	3	25520.73	5104.14
1252	253	39	128	10	31499.60	4724.90
1253	67	20	288	3	2981.82	954.18
1254	705	21	383	2	15695.36	3296.02
1255	17	6	381	10	11685.10	3388.70
1256	705	30	634	4	27698.84	6924.72
1257	437	40	831	7	2884.63	576.94
1258	160	5	373	6	48954.96	5874.60
1259	520	10	201	10	40427.00	7276.90
1260	290	19	737	4	39099.00	4300.88
1261	534	32	250	10	37388.40	11964.30
1262	577	32	979	5	44546.55	14700.35
1263	245	13	417	2	10452.36	3240.24
1264	581	3	830	4	14797.88	1479.80
1265	331	6	713	5	40163.85	10442.60
1266	534	14	831	6	2472.54	494.52
1267	381	6	319	8	50174.80	19066.40
1268	190	15	321	3	17441.76	4186.02
1269	516	31	631	10	26536.90	2919.10
1270	86	19	398	2	5532.88	1217.24
1271	180	31	7	5	23470.55	3520.60
1272	476	3	887	3	23518.02	7760.94
1273	142	48	221	10	65847.90	19754.40
1274	400	28	854	9	37492.02	13122.18
1275	81	13	79	9	81561.87	15496.74
1276	581	3	311	8	24999.04	7499.68
1277	733	23	389	1	960.90	374.75
1278	503	39	905	8	7618.96	1828.56
1279	562	40	351	7	1460.83	146.09
1280	236	24	746	5	22730.55	8410.30
1281	244	11	656	3	3164.64	348.12
1282	137	18	591	1	595.92	65.55
1283	81	13	254	8	14431.20	5772.48
1284	260	19	739	4	30198.56	7247.64
1285	858	6	294	6	35343.48	6361.80
1286	866	2	927	3	23284.65	6519.69
1287	616	23	164	5	12857.55	2828.65
1288	296	21	851	10	43044.10	6026.20
1289	281	47	113	4	4705.92	1129.44
1290	435	18	383	4	31390.72	6592.04
1291	805	14	643	5	35902.25	8257.50
1292	344	41	172	1	109.06	38.17
1293	515	20	188	4	4583.16	687.48
1294	105	34	707	8	22624.08	3619.84
1295	112	18	462	7	36326.43	12351.01
1296	140	43	794	5	23600.70	3068.10
1297	113	9	111	9	83764.35	15915.24
1298	508	36	607	8	49026.64	10785.84
1299	699	27	219	5	45747.85	17841.65
1300	14	49	562	4	13826.20	3180.04
1301	14	45	215	3	28891.11	6067.14
1302	132	45	852	8	61790.80	14211.92
1303	601	48	801	10	24415.20	3418.10
1304	215	16	734	6	8174.22	3187.92
1305	207	38	167	6	44796.66	5375.58
1306	656	39	261	1	2289.67	824.28
1307	546	35	694	7	339.36	50.89
1308	807	2	656	2	2109.76	232.08
1309	546	35	765	9	266.49	58.59
1310	258	2	596	7	29729.42	4459.42
1311	846	19	535	10	99369.20	35772.90
1312	351	17	723	1	5300.41	1060.08
1313	551	2	48	2	8002.28	3120.88
1314	37	2	573	5	8022.15	2486.85
1315	450	24	949	9	60751.08	20047.86
1316	16	10	963	8	51008.88	9691.68
1317	354	10	473	9	74863.17	16469.91
1318	717	37	160	7	3670.24	1174.46
1319	592	39	818	4	34465.36	9650.32
1320	283	34	865	1	9209.96	1565.69
1321	43	34	107	6	50951.46	16304.46
1322	465	40	50	2	3956.18	1028.60
1323	755	30	232	10	99713.20	20939.80
1324	717	37	101	7	59475.15	16058.28
1325	792	48	628	3	12084.63	2900.31
1326	543	41	641	2	12565.28	3895.24
1327	841	4	110	8	74806.96	12717.20
1328	792	7	87	9	52977.60	6357.33
1329	49	47	338	5	15552.95	6221.20
1330	228	7	743	1	4467.69	1429.66
1331	246	17	13	6	49483.14	7422.48
1332	326	24	256	10	1627.30	618.40
1333	543	41	507	5	36596.85	10247.10
1334	387	21	184	3	5363.28	2091.69
1335	701	38	699	6	24069.54	6258.06
1336	129	11	950	10	57661.10	16721.70
1337	455	33	821	8	56259.68	19128.32
1338	382	21	52	7	32458.72	3245.90
1339	599	41	221	5	32923.95	9877.20
1340	67	48	140	10	75518.80	24921.20
1341	379	36	574	3	25399.95	6349.98
1342	131	41	647	5	34891.35	3838.05
1343	457	9	466	9	65027.70	20158.56
1344	306	44	405	8	43963.52	13628.72
1345	118	13	78	1	6493.90	909.15
1346	124	21	854	2	8331.56	2916.04
1347	375	4	934	10	822.60	115.20
1348	867	17	485	4	28176.88	8734.84
1349	547	10	624	6	56894.40	6827.34
1350	706	6	699	10	40115.90	10430.10
1351	377	3	908	10	59581.70	22045.20
1352	310	22	270	3	781.11	257.76
1353	232	7	6	7	39517.94	10669.82
1354	572	31	836	8	57672.24	12687.92
1355	248	27	975	6	7497.12	974.64
1356	438	9	211	8	13926.00	4734.88
1357	2	13	987	1	8086.60	2668.58
1358	573	30	841	9	68564.07	23311.80
1359	295	47	574	6	50799.90	12699.96
1360	719	4	891	9	69972.21	11195.55
1361	673	2	289	1	5887.69	1177.54
1362	572	31	657	2	853.44	136.56
1363	624	18	821	6	42194.76	14346.24
1364	642	25	982	1	9104.83	3550.88
1365	498	30	185	10	77215.40	15443.10
1366	399	39	790	5	21172.10	6775.05
1367	736	14	399	7	27125.00	6238.75
1368	810	38	356	7	31210.76	5930.05
1369	305	48	649	2	17347.00	6418.38
1370	685	4	831	6	2472.54	494.52
1371	119	17	114	1	9485.06	2655.82
1372	301	9	869	10	94364.90	32084.10
1373	832	14	4	8	54973.04	14292.96
1374	512	9	915	7	17412.64	3656.66
1375	382	21	748	6	22472.16	3595.56
1376	649	26	247	5	31340.00	4387.60
1377	275	6	998	1	7318.50	1390.51
1378	428	35	774	1	8714.95	1655.84
1379	623	42	468	3	6283.38	754.02
1380	705	24	62	4	17747.44	4081.92
1381	734	48	623	10	71683.20	14336.60
1382	356	20	789	7	66366.37	15927.94
1383	463	46	61	7	12251.96	4778.27
1384	465	24	351	8	1669.52	166.96
1385	649	26	29	9	54231.93	11931.03
1386	442	49	94	10	87394.30	26218.30
1387	117	48	836	5	36045.15	7929.95
1388	251	39	956	8	66705.04	18677.44
1389	623	32	23	5	28363.20	7658.05
1390	437	23	184	5	8938.80	3486.15
1391	768	13	399	2	7750.00	1782.50
1392	685	29	372	6	48680.64	13630.56
1393	453	4	132	8	24387.44	8047.84
1394	683	29	622	6	23329.50	2332.92
1395	683	29	572	10	62102.90	17388.80
1396	573	25	681	6	30734.10	4302.78
1397	109	29	298	10	71935.10	10070.90
1398	877	37	769	9	85407.57	15373.35
1399	229	15	79	8	72499.44	13774.88
1400	710	49	557	1	2638.65	738.82
1401	846	26	418	2	3090.92	525.46
1402	527	19	659	9	52406.91	11529.54
1403	354	10	371	7	28834.96	7497.07
1404	711	26	518	3	743.64	156.15
1405	371	13	994	4	8019.40	1202.92
1406	557	32	776	10	54709.70	14771.60
1407	210	10	946	3	26475.00	9001.50
1408	437	41	116	2	4483.58	896.72
1409	686	8	29	4	24103.08	5302.68
1410	111	11	471	1	7350.15	1911.04
1411	343	41	874	1	2859.83	514.77
1412	40	42	367	8	1290.16	335.44
1413	434	2	508	10	96063.20	19212.60
1414	812	15	219	9	82346.13	32114.97
1415	823	26	153	6	3070.02	1197.30
1416	731	11	189	10	12219.80	2444.00
1417	268	49	554	7	28086.31	9268.49
1418	252	33	488	10	96262.50	10588.90
1419	268	19	864	4	30927.60	7422.64
1420	211	19	864	8	61855.20	14845.28
1421	485	18	878	9	55379.79	7199.37
1422	792	7	418	4	6181.84	1050.92
1423	574	9	970	8	1745.28	523.60
1424	704	24	325	7	48742.26	7798.77
1425	86	19	146	6	19627.44	2355.30
1426	137	26	885	4	3740.40	1421.36
1427	486	1	530	6	24072.78	3851.64
1428	124	21	586	2	13340.34	1734.24
1429	547	10	767	4	25816.56	8777.64
1430	871	9	883	1	2517.78	856.05
1431	217	8	306	5	36104.05	14080.60
1432	839	35	354	5	30431.90	3043.20
1433	91	24	622	1	3888.25	388.82
1434	80	1	82	6	43017.90	10324.32
1435	840	28	811	7	68682.39	27472.97
1436	3	5	91	3	29831.61	6861.27
1437	739	37	571	5	31460.50	3460.65
1438	400	28	404	4	35725.44	10003.12
1439	182	21	960	8	6458.40	904.16
1440	586	34	256	9	1464.57	556.56
1441	843	24	544	4	35921.48	8621.16
1442	337	31	326	3	23139.75	4165.17
1443	326	37	378	8	47895.60	16284.48
1444	177	32	235	2	11429.30	2514.44
1445	877	4	945	6	47990.94	8638.38
1446	73	40	981	7	12397.42	2975.35
1447	546	25	490	3	14402.91	2016.42
1448	439	28	745	4	32622.12	5545.76
1449	309	30	881	10	93454.60	37381.80
1450	143	49	208	10	75745.80	24996.10
1451	334	11	443	2	5406.66	1297.60
1452	80	18	97	2	19313.80	3283.34
1453	421	45	253	6	5082.66	1219.86
1454	779	45	96	9	70745.04	11319.21
1455	820	24	669	9	29325.06	6744.78
1456	588	37	351	2	417.38	41.74
1457	388	1	820	10	18473.70	6835.30
1458	452	31	578	8	17907.84	2148.96
1459	480	48	538	4	23529.36	3294.12
1460	42	20	377	5	10491.40	2622.85
1461	150	50	24	6	7811.04	1640.34
1462	349	15	457	5	8301.20	2573.35
1463	33	6	300	9	71116.38	22757.22
1464	864	21	849	2	7760.22	3026.48
1465	337	31	590	6	54369.60	7068.06
1466	861	38	137	5	31931.60	10218.10
1467	167	17	614	10	97902.80	23496.70
1468	329	28	462	10	51894.90	17644.30
1469	267	39	397	2	10923.36	1201.56
1470	500	49	835	2	4908.48	1276.20
1471	110	39	319	7	43902.95	16683.10
1472	382	21	197	5	27013.55	6753.40
1473	8	7	502	4	23935.16	5026.40
1474	113	43	178	2	12370.40	1855.56
1475	617	38	990	8	59948.08	12589.12
1476	551	27	637	4	13675.80	5333.56
1477	527	19	412	10	80069.90	9608.40
1478	131	32	282	3	8631.48	3366.27
1479	673	2	96	10	78605.60	12576.90
1480	282	9	359	4	20672.72	6822.00
1481	423	6	695	3	29864.97	10452.75
1482	275	6	798	8	56777.84	21575.60
1483	268	49	123	6	12974.64	2205.66
1484	701	38	49	8	72659.52	7992.56
1485	17	6	225	10	56550.20	17530.60
1486	170	21	876	8	9785.36	3816.32
1487	755	30	374	3	4967.76	1043.22
1488	366	17	500	9	52046.82	10409.40
1489	464	15	970	7	1527.12	458.15
1490	627	27	839	8	73765.60	8114.24
1491	306	44	93	10	50179.40	16057.40
1492	414	38	874	8	22878.64	4118.16
1493	143	38	850	6	51813.60	10362.72
1494	824	33	916	10	28088.90	4775.10
1495	229	36	170	7	64977.92	24691.59
1496	34	19	635	7	19408.76	2717.26
1497	709	34	514	4	1989.96	258.68
1498	436	42	849	2	7760.22	3026.48
1499	861	37	223	6	51650.28	5165.04
1500	454	8	329	8	70333.52	21803.36
1501	465	24	476	3	25031.79	7759.86
1502	656	39	327	1	1407.55	394.11
1503	702	20	456	10	53914.60	5391.50
1504	391	29	107	2	16983.82	5434.82
1505	775	17	725	7	39431.63	4337.48
1506	304	9	79	3	27187.29	5165.58
1507	618	24	735	7	62543.04	21890.05
1508	872	42	5	10	87273.60	30545.80
1509	557	49	324	10	59136.50	13010.00
1510	490	47	80	4	19238.72	7503.12
1511	595	37	875	8	73613.04	17667.12
1512	14	45	820	9	16626.33	6151.77
1513	776	22	942	4	7162.84	1074.44
1514	149	10	985	10	75314.60	7531.50
1515	466	1	109	3	11575.47	3125.37
1516	174	8	433	10	13352.40	4673.30
1517	409	40	897	3	6052.35	2360.43
1518	546	9	672	1	7353.57	1397.18
1519	666	5	728	2	19764.66	5138.82
1520	280	49	324	7	41395.55	9107.00
1521	733	45	883	6	15106.68	5136.30
1522	545	23	460	10	33265.40	9314.30
1523	608	40	357	5	47032.60	14580.10
1524	482	29	181	2	7455.60	2385.80
1525	735	34	172	9	981.54	343.53
1526	649	49	574	4	33866.60	8466.64
1527	313	18	230	6	36670.74	4767.18
1528	190	15	134	4	19339.08	3287.64
1529	80	35	44	9	57730.68	12123.45
1530	145	18	141	1	6069.67	971.15
1531	445	23	448	3	13557.09	3253.71
1532	286	47	301	8	21271.12	4466.96
1533	746	50	333	6	13057.80	3917.34
1534	556	42	585	3	16122.24	1773.45
1535	437	15	890	10	13784.00	2756.80
1536	659	6	636	10	556.60	89.10
1537	118	45	23	6	34035.84	9189.66
1538	90	22	180	10	35570.00	14228.00
1539	563	29	988	1	3478.66	660.95
1540	760	16	307	2	7768.96	3029.90
1541	596	44	964	5	47431.05	12332.05
1542	49	19	987	6	48519.60	16011.48
1543	725	50	558	10	99475.20	33821.60
1544	594	46	48	6	24006.84	9362.64
1545	388	9	556	5	31113.00	5600.35
1546	788	43	704	10	88267.00	32658.80
1547	31	2	234	4	23946.96	3592.04
1548	284	20	899	1	6126.52	1592.90
1549	784	44	551	4	28454.96	6829.20
1550	80	35	458	2	14103.46	4090.00
1551	8	15	854	9	37492.02	13122.18
1552	40	42	276	7	67314.10	24233.09
1553	833	22	851	5	21522.05	3013.10
1554	324	7	152	6	14589.48	2334.30
1555	258	9	581	10	50463.90	12616.00
1556	205	36	882	8	7017.60	1614.08
1557	323	26	333	1	2176.30	652.89
1558	244	19	19	3	29532.93	3839.28
1559	504	31	540	6	32886.12	3288.60
1560	158	47	40	9	40051.08	8811.27
1561	368	22	955	3	3066.15	1103.82
1562	299	50	930	1	9338.24	2427.94
1563	245	29	897	10	20174.50	7868.10
1564	332	7	661	8	10821.60	3679.36
1565	120	20	986	7	53430.16	17631.95
1566	431	44	605	3	16641.54	6490.20
1567	80	36	418	4	6181.84	1050.92
1568	301	14	385	8	45849.04	12379.28
1569	18	40	153	7	3581.69	1396.85
1570	866	40	298	7	50354.57	7049.63
1571	47	26	530	10	40121.30	6419.40
1572	555	30	609	5	45465.45	5455.85
1573	792	48	795	8	53376.80	17614.32
1574	17	6	30	7	45808.28	6871.27
1575	109	8	791	10	27634.70	4974.20
1576	177	32	764	9	68208.21	15005.79
1577	310	22	218	5	38137.75	4576.55
1578	618	24	357	7	65845.64	20412.14
1579	721	45	596	4	16988.24	2548.24
1580	592	20	206	2	16124.88	2579.98
1581	695	5	105	9	31781.43	9852.21
1582	531	45	903	8	62143.20	19264.40
1583	239	27	363	3	23326.86	2799.21
1584	378	16	842	4	15733.48	3618.72
1585	222	49	197	9	48624.39	12156.12
1586	344	5	479	5	3219.20	386.30
1587	869	8	118	9	21028.86	5677.83
1588	599	41	828	6	13820.10	5113.44
1589	561	36	830	2	7398.94	739.90
1590	548	31	862	7	41671.56	10001.18
1591	236	23	615	1	9165.01	2749.50
1592	674	49	928	8	48669.60	16060.96
1593	54	9	605	3	16641.54	6490.20
1594	147	12	181	7	26094.60	8350.30
1595	377	36	710	6	50379.78	20151.90
1596	355	25	710	9	75569.67	30227.85
1597	184	1	227	5	37055.25	12228.25
1598	761	35	487	2	13316.80	3995.04
1599	527	19	855	10	19818.30	5350.90
1600	512	7	856	3	5008.05	1201.92
1601	131	46	658	8	68046.64	18372.56
1602	110	39	930	7	65367.68	16995.58
1603	123	21	502	4	23935.16	5026.40
1604	119	17	112	10	26117.50	2611.70
1605	444	22	736	1	6502.27	715.25
1606	9	37	414	2	16607.72	4650.16
1607	809	38	51	10	54805.70	7124.70
1608	377	3	735	1	8934.72	3127.15
1609	140	31	735	9	80412.48	28144.35
1610	361	26	281	3	13867.83	3050.91
1611	430	19	677	9	20392.56	7749.18
1612	601	5	409	2	12482.30	1747.52
1613	777	30	908	6	35749.02	13227.12
1614	248	27	853	7	48764.03	13166.30
1615	105	34	177	2	11478.76	1607.02
1616	248	27	471	7	51451.05	13377.28
1617	142	37	135	10	53535.40	8030.30
1618	430	26	35	5	14737.70	3979.20
1619	657	42	167	5	37330.55	4479.65
1620	531	45	786	2	8670.06	3294.62
1621	743	7	231	10	71195.50	17086.90
1622	634	38	663	10	75803.50	28805.30
1623	701	38	961	2	17753.80	3728.30
1624	649	45	899	8	49012.16	12743.20
1625	457	2	379	9	61188.03	6730.65
1626	672	50	10	3	8478.75	3221.91
1627	481	28	638	3	26043.90	9636.24
1628	45	2	566	3	9766.05	2929.83
1629	180	31	25	5	30097.05	10834.95
1630	777	30	361	3	11764.08	2117.52
1631	52	30	761	4	39381.24	12602.00
1632	239	32	788	4	14646.20	2343.40
1633	447	26	990	6	44961.06	9441.84
1634	71	39	805	4	11246.72	3823.88
1635	315	12	213	8	8475.20	1017.04
1636	437	29	274	2	8370.90	1590.48
1637	714	13	816	8	9575.84	3255.76
1638	414	23	497	6	31404.00	10677.36
1639	795	37	430	4	4353.56	740.12
1640	244	11	454	7	33872.51	6097.07
1641	540	17	615	10	91650.10	27495.00
1642	451	39	381	3	3505.53	1016.61
1643	855	33	437	3	16248.48	5686.98
1644	349	27	285	9	26515.08	3977.28
1645	350	34	271	3	17926.89	3406.11
1646	739	37	712	2	8175.92	1553.42
1647	442	49	273	2	7265.32	1380.42
1648	438	42	95	10	48017.80	12484.60
1649	513	35	278	6	49261.92	14778.60
1650	772	47	452	7	16352.42	4905.74
1651	703	14	682	4	5572.72	1671.80
1652	826	4	930	6	56029.44	14567.64
1653	35	21	850	10	86356.00	17271.20
1654	53	19	40	10	44501.20	9790.30
1655	330	41	703	3	18762.42	4127.73
1656	406	21	447	4	8241.64	2637.32
1657	229	24	172	10	1090.60	381.70
1658	649	13	822	8	42897.92	11153.44
1659	696	34	365	1	3542.34	1133.55
1660	479	40	970	5	1090.80	327.25
1661	381	31	402	2	7765.94	1164.90
1662	720	1	863	8	25530.40	9701.52
1663	141	30	516	8	27647.20	9952.96
1664	160	5	913	3	9813.00	1864.47
1665	188	46	946	2	17650.00	6001.00
1666	217	8	136	1	5419.93	1246.58
1667	574	37	222	8	69108.32	6910.80
1668	371	13	816	8	9575.84	3255.76
1669	391	49	184	1	1787.76	697.23
1670	768	49	691	6	50808.42	16258.68
1671	12	17	607	1	6128.33	1348.23
1672	718	14	366	6	1277.22	127.74
1673	417	5	730	4	34397.80	3783.76
1674	840	38	163	4	13480.76	3505.00
1675	106	15	193	9	46104.03	11526.03
1676	209	5	307	10	38844.80	15149.50
1677	255	28	610	3	26219.07	3146.28
1678	410	10	655	3	20751.12	3735.21
1679	387	12	580	9	51065.46	7659.81
1680	358	45	936	1	4628.67	1481.17
1681	623	42	802	4	12031.28	3609.40
1682	816	23	316	4	15151.52	5454.56
1683	137	18	387	7	37810.71	11721.29
1684	259	31	972	6	14651.70	4981.56
1685	74	18	509	2	14278.98	4426.48
1686	865	17	221	9	59263.11	17778.96
1687	703	14	929	10	15642.70	4380.00
1688	53	28	397	9	49155.12	5407.02
1689	781	17	988	7	24350.62	4626.65
1690	640	45	9	1	7329.76	2272.23
1691	683	6	923	2	6513.00	1628.24
1692	567	45	843	8	73293.28	16124.56
1693	725	50	839	7	64544.90	7099.96
1694	758	35	788	7	25630.85	4100.95
1695	675	33	891	7	54422.83	8707.65
1696	234	50	320	3	21865.11	5466.27
1697	525	34	741	5	34668.65	9013.85
1698	704	20	781	1	3412.20	443.59
1699	802	2	683	8	3806.64	1256.16
1700	476	3	468	4	8377.84	1005.36
1701	207	35	510	8	44427.44	5775.60
1702	769	36	413	4	6819.88	1636.76
1703	703	14	484	10	90460.40	23519.70
1704	866	15	441	9	60787.53	15196.86
1705	118	13	640	6	33043.56	9582.66
1706	768	13	332	8	77343.60	20109.36
1707	638	44	700	1	5077.14	1523.14
1708	331	22	210	6	32043.78	9613.14
1709	578	42	231	9	64075.95	15378.21
1710	860	42	576	8	7980.96	2553.92
1711	575	10	717	2	19684.46	3543.20
1712	92	27	316	8	30303.04	10909.12
1713	745	20	431	1	2089.87	501.57
1714	797	28	406	4	13189.20	4220.56
1715	392	2	308	3	3837.18	1534.86
1716	565	43	565	5	9292.90	3252.50
1717	650	7	92	10	57041.00	19964.30
1718	328	35	153	5	2558.35	997.75
1719	634	38	723	1	5300.41	1060.08
1720	793	12	984	4	22638.64	2943.04
1721	741	36	921	3	13230.30	4630.59
1722	323	24	511	5	7683.60	2458.75
1723	56	3	191	4	12217.68	2077.00
1724	740	31	191	9	27489.78	4673.25
1725	738	7	31	5	21064.05	6740.50
1726	401	41	947	3	10121.01	1619.37
1727	578	42	97	1	9656.90	1641.67
1728	779	34	595	4	32940.44	5929.28
1729	347	10	306	2	14441.62	5632.24
1730	678	28	850	10	86356.00	17271.20
1731	196	2	146	9	29441.16	3532.95
1732	813	3	462	9	46705.41	15879.87
1733	251	32	63	10	77391.80	12382.70
1734	100	26	863	1	3191.30	1212.69
1735	425	18	289	3	17663.07	3532.62
1736	67	20	10	5	14131.25	5369.85
1737	842	31	393	4	19229.08	6922.48
1738	845	25	95	2	9603.56	2496.92
1739	248	3	700	8	40617.12	12185.12
1740	167	17	300	8	63214.56	20228.64
1741	344	41	802	5	15039.10	4511.75
1742	809	20	781	10	34122.00	4435.90
1743	493	3	945	4	31993.96	5758.92
1744	328	35	139	6	54284.88	11399.82
1745	79	48	724	10	92801.30	25984.40
1746	81	13	233	5	22695.55	7943.45
1747	207	35	759	4	17219.44	3616.08
1748	870	37	321	1	5813.92	1395.34
1749	342	11	346	4	16031.32	4328.44
1750	415	42	742	7	51276.26	17433.92
1751	375	48	714	2	17461.86	6635.50
1752	556	42	799	8	46880.40	13126.48
1753	834	29	383	4	31390.72	6592.04
1754	822	20	174	3	19129.59	5356.29
1755	680	39	744	10	8587.50	1975.10
1756	187	16	779	5	34846.85	10802.50
1757	161	28	673	6	31512.60	9138.66
1758	45	2	796	1	6748.42	1147.23
1759	865	17	532	1	8956.97	1074.84
1760	435	16	881	5	46727.30	18690.90
1761	236	24	1	6	34421.64	11359.14
1762	268	17	725	5	28165.45	3098.20
1763	137	18	753	4	20317.48	5282.56
1764	670	37	501	7	58396.94	20438.95
1765	205	34	820	4	7389.48	2734.12
1766	237	2	345	5	49618.00	14389.20
1767	675	33	873	8	24884.32	4728.00
1768	686	7	289	4	23550.76	4710.16
1769	436	42	731	5	27534.20	4130.15
1770	163	2	467	10	95286.70	33350.30
1771	522	13	350	2	14065.74	5485.64
1772	695	46	64	5	12321.10	4189.15
1773	374	10	126	3	12782.22	1533.87
1774	755	44	580	1	5673.94	851.09
1775	706	9	356	5	22293.40	4235.75
1776	679	42	778	9	51374.25	19522.26
1777	745	20	602	9	30237.84	5745.15
1778	251	22	596	7	29729.42	4459.42
1779	137	40	48	1	4001.14	1560.44
1780	248	12	824	9	72633.69	23969.16
1781	592	39	919	10	90993.10	12739.00
1782	371	31	475	5	28609.35	8296.70
1783	720	10	224	9	67809.78	8137.17
1784	117	48	832	2	11159.04	2120.22
1785	590	10	792	6	21547.68	6464.28
1786	760	16	856	10	16693.50	4006.40
1787	245	29	289	10	58876.90	11775.40
1788	145	9	536	4	28281.64	7636.04
1789	208	3	265	1	1334.78	213.56
1790	224	21	931	1	2687.27	429.96
1791	679	42	272	8	23654.64	4494.40
1792	851	47	692	10	36672.40	4400.70
1793	731	11	489	2	14018.74	3224.32
1794	47	37	136	7	37939.51	8726.06
1795	331	22	244	6	36863.76	14376.84
1796	70	15	619	9	9425.07	1602.27
1797	295	25	536	3	21211.23	5727.03
1798	534	48	507	10	73193.70	20494.20
1799	784	12	696	6	41462.52	11609.52
1800	672	50	915	7	17412.64	3656.66
1801	627	27	153	10	5116.70	1995.50
1802	377	20	379	9	61188.03	6730.65
1803	612	28	208	8	60596.64	19996.88
1804	332	25	766	8	12270.56	3558.48
1805	539	18	121	10	68646.70	7551.10
1806	655	18	15	1	5280.98	1214.63
1807	513	10	230	1	6111.79	794.53
1808	790	47	895	5	26387.15	10027.10
1809	573	30	483	3	22147.83	3543.66
1810	540	17	702	9	79493.67	22258.26
1811	725	50	890	6	8270.40	1654.08
1812	484	44	567	9	66014.10	7261.56
1813	670	22	819	6	18366.00	6795.42
1814	90	22	851	1	4304.41	602.62
1815	875	19	757	2	2172.22	369.28
1816	551	27	409	4	24964.60	3495.04
1817	576	4	399	10	38750.00	8912.50
1818	594	46	216	7	34998.67	9799.65
1819	455	11	967	8	77097.76	26984.24
1820	741	43	666	10	31394.50	8790.50
1821	118	45	622	3	11664.75	1166.46
1822	109	29	601	5	19782.70	4747.85
1823	846	13	187	4	5997.04	659.68
1824	436	42	980	1	7572.92	1514.58
1825	719	4	108	10	61884.20	8663.80
1826	181	29	541	7	54395.60	21214.27
1827	512	7	510	9	49980.87	6497.55
1828	207	35	240	4	6604.16	858.56
1829	34	19	712	4	16351.84	3106.84
1830	563	8	721	10	99672.40	23921.40
1831	81	48	572	9	55892.61	15649.92
1832	239	27	362	1	9421.45	2826.43
1833	236	35	470	3	21116.82	4434.54
1834	548	23	519	6	2137.62	769.56
1835	856	4	911	9	21258.18	4889.34
1836	605	1	904	1	9464.05	1703.53
1837	289	34	528	3	28786.44	9499.53
1838	439	28	849	2	7760.22	3026.48
1839	336	42	425	2	5611.62	953.98
1840	572	31	676	3	1395.30	418.59
1841	464	33	972	1	2441.95	830.26
1842	174	8	398	4	11065.76	2434.48
1843	496	13	954	8	63555.20	22244.32
1844	865	44	751	3	7674.12	2916.18
1845	573	25	370	9	12053.25	2169.63
1846	675	25	205	10	2299.30	505.80
1847	520	6	882	9	7894.80	1815.84
1848	545	23	247	1	6268.00	877.52
1849	699	6	767	10	64541.40	21944.10
1850	56	9	178	7	43296.40	6494.46
1851	186	17	53	6	58649.94	6451.50
1852	242	24	155	4	21369.00	5555.96
1853	607	4	825	8	8980.32	2604.32
1854	315	12	410	10	12462.90	4735.90
1855	232	7	315	6	26539.02	6103.98
1856	784	44	132	4	12193.72	4023.92
1857	281	47	867	10	44255.00	15489.20
1858	437	45	958	10	86823.80	15628.30
1859	705	24	262	8	60486.08	18145.84
1860	843	24	426	3	13328.70	2665.74
1861	847	50	972	4	9767.80	3321.04
1862	493	33	467	5	47643.35	16675.15
1863	701	5	343	7	67214.49	10082.17
1864	466	1	126	9	38346.66	4601.61
1865	84	39	502	3	17951.37	3769.80
1866	111	5	338	4	12442.36	4976.96
1867	514	27	78	1	6493.90	909.15
1868	783	28	332	3	29003.85	7541.01
1869	450	24	794	8	37761.12	4908.96
1870	435	16	752	8	24888.64	7964.40
1871	259	25	202	9	79075.35	13442.85
1872	471	19	285	2	5892.24	883.84
1873	66	39	832	2	11159.04	2120.22
1874	305	48	349	7	34328.63	9955.33
1875	578	11	56	3	23150.64	9260.25
1876	207	38	928	6	36502.20	12045.72
1877	79	48	881	5	46727.30	18690.90
1878	251	32	429	3	14259.06	3136.98
1879	162	16	778	1	5708.25	2169.14
1880	825	29	92	1	5704.10	1996.43
1881	439	40	939	10	21855.90	8742.40
1882	307	19	459	1	597.09	208.98
1883	309	30	517	4	27825.00	6956.24
1884	655	17	281	2	9245.22	2033.94
1885	452	20	358	7	172.20	51.66
1886	304	34	771	2	4174.46	459.20
1887	537	40	464	5	2606.05	912.10
1888	500	49	515	7	61817.00	17926.93
1889	503	39	189	5	6109.90	1222.00
1890	570	6	337	7	48541.92	7281.26
1891	388	1	440	1	7680.91	844.90
1892	586	25	222	7	60469.78	6046.95
1893	802	2	302	5	32612.20	13044.90
1894	876	17	505	2	5195.48	1091.06
1895	392	5	50	8	15824.72	4114.40
1896	437	15	338	2	6221.18	2488.48
1897	849	15	835	9	22088.16	5742.90
1898	124	21	415	6	39153.06	4698.36
1899	680	41	625	9	60579.54	13933.26
1900	744	31	198	4	30083.64	6317.56
1901	224	42	573	2	3208.86	994.74
1902	67	20	249	3	24499.05	3184.89
1903	637	41	450	6	50436.78	13113.54
1904	847	48	885	3	2805.30	1066.02
1905	612	47	591	5	2979.60	327.75
1906	673	18	489	1	7009.37	1612.16
1907	428	35	396	3	8074.14	1937.79
1908	686	22	276	8	76930.40	27694.96
1909	859	9	846	5	33403.25	9686.95
1910	878	2	315	7	30962.19	7121.31
1911	400	38	552	6	29148.84	11076.54
1912	455	11	195	1	9931.30	1092.44
1913	863	14	322	3	23279.64	9079.05
1914	123	21	437	2	10832.32	3791.32
1915	341	28	37	10	94700.00	9470.00
1916	187	19	583	6	31525.86	7566.18
1917	325	44	97	3	28970.70	4925.01
1918	551	27	655	6	41502.24	7470.42
1919	549	47	440	2	15361.82	1689.80
1920	859	9	544	8	71842.96	17242.32
1921	740	31	980	10	75729.20	15145.80
1922	344	30	791	3	8290.41	1492.26
1923	627	27	399	6	23250.00	5347.50
1924	822	11	219	4	36598.28	14273.32
1925	621	39	717	3	29526.69	5314.80
1926	695	46	878	9	55379.79	7199.37
1927	189	38	629	9	50299.02	8047.80
1928	69	10	316	5	18939.40	6818.20
1929	328	13	472	4	25461.08	2546.12
1930	38	24	750	3	1102.17	352.68
1931	825	29	889	5	22066.35	5075.25
1932	678	39	652	4	16965.92	6786.36
1933	500	29	647	7	48847.89	5373.27
1934	151	25	964	9	85375.89	22197.69
1935	546	9	869	5	47182.45	16042.05
1936	693	41	242	3	29991.51	9897.21
1937	624	18	972	4	9767.80	3321.04
1938	101	17	610	8	69917.52	8390.08
1939	441	25	350	2	14065.74	5485.64
1940	686	44	419	5	15884.65	5718.45
1941	634	14	203	5	34692.65	11795.50
1942	750	28	590	9	81554.40	10602.09
1943	442	49	248	3	8467.56	2286.24
1944	563	28	202	10	87861.50	14936.50
1945	227	41	618	2	13985.82	5034.90
1946	243	33	805	10	28116.80	9559.70
1947	299	2	235	9	51431.85	11314.98
1948	362	30	890	8	11027.20	2205.44
1949	92	27	496	6	2316.72	671.82
1950	609	38	530	10	40121.30	6419.40
1951	795	37	316	3	11363.64	4090.92
1952	617	5	771	7	14610.61	1607.20
1953	317	35	174	10	63765.30	17854.30
1954	502	44	186	10	32437.60	6163.10
1955	137	27	227	8	59288.40	19565.20
1956	261	42	5	4	34909.44	12218.32
1957	369	33	805	2	5623.36	1911.94
1958	534	48	593	2	970.70	359.16
1959	11	36	164	1	2571.51	565.73
1960	747	1	818	7	60314.38	16888.06
1961	516	31	699	3	12034.77	3129.03
1962	239	23	614	5	48951.40	11748.35
1963	266	12	569	7	29020.60	6094.34
1964	311	49	574	8	67733.20	16933.28
1965	69	28	84	2	3836.90	422.06
1966	867	13	160	7	3670.24	1174.46
1967	470	9	269	7	59548.37	11909.66
1968	694	25	644	4	3422.72	1163.72
1969	591	23	983	8	27898.56	4463.76
1970	501	34	18	5	49946.85	8990.45
1971	424	3	701	4	33990.92	9857.36
1972	143	49	332	7	67675.65	17595.69
1973	603	16	617	2	11861.04	4507.20
1974	696	28	161	8	60869.44	21304.32
1975	122	5	992	6	4862.46	1458.72
1976	325	44	863	7	22339.10	8488.83
1977	55	41	984	6	33957.96	4414.56
1978	251	32	980	3	22718.76	4543.74
1979	391	29	797	5	34124.05	7507.30
1980	570	6	620	7	26520.90	9547.51
1981	783	17	616	8	8441.52	3376.64
1982	140	31	22	3	8399.94	840.00
1983	397	16	894	1	5349.62	1551.39
1984	668	9	440	6	46085.46	5069.40
1985	551	27	371	10	41192.80	10710.10
1986	739	29	522	6	49289.28	12815.22
1987	383	28	205	9	2069.37	455.22
1988	27	23	452	3	7008.18	2102.46
1989	772	47	222	2	17277.08	1727.70
1990	808	41	507	10	73193.70	20494.20
1991	110	19	956	8	66705.04	18677.44
1992	205	36	309	8	12756.40	2551.28
1993	297	47	774	7	61004.65	11590.88
1994	824	14	516	6	20735.40	7464.72
1995	609	38	193	5	25613.35	6403.35
1996	326	43	560	1	9292.88	3252.51
1997	673	10	23	5	28363.20	7658.05
1998	243	39	937	2	971.98	126.36
1999	198	26	797	10	68248.10	15014.60
2000	370	10	433	2	2670.48	934.66
2001	186	17	690	3	15775.59	3155.13
2002	323	24	689	5	22700.15	7264.05
2003	98	29	800	2	19598.14	3527.66
2004	339	46	182	5	31771.60	9849.20
2005	804	19	859	2	14880.52	5505.80
2006	438	9	962	3	21643.44	4328.70
2007	451	39	53	4	39099.96	4301.00
2008	758	35	904	10	94640.50	17035.30
2009	60	43	469	6	218.34	65.52
2010	33	22	68	8	62179.04	23628.00
2011	870	50	86	6	43452.18	4779.72
2012	500	29	157	4	5735.12	1491.12
2013	211	19	239	7	14288.61	4429.46
2014	298	34	273	2	7265.32	1380.42
2015	269	12	512	3	2746.41	274.65
2016	167	17	160	10	5243.20	1677.80
2017	434	2	548	3	17862.30	5715.93
2018	560	45	276	8	76930.40	27694.96
2019	172	4	647	2	13956.54	1535.22
2020	156	49	1	10	57369.40	18931.90
2021	460	34	93	10	50179.40	16057.40
2022	20	29	160	3	1572.96	503.34
2023	615	50	473	9	74863.17	16469.91
2024	459	21	505	8	20781.92	4364.24
2025	437	12	222	7	60469.78	6046.95
2026	41	23	624	2	18964.80	2275.78
2027	807	40	774	1	8714.95	1655.84
2028	410	15	958	6	52094.28	9376.98
2029	562	50	856	6	10016.10	2403.84
2030	161	30	462	5	25947.45	8822.15
2031	809	38	146	7	22898.68	2747.85
2032	805	31	83	6	47177.22	16512.00
2033	245	29	887	6	47036.04	15521.88
2034	80	36	352	2	19128.96	4017.08
2035	62	22	585	5	26870.40	2955.75
2036	665	23	31	8	33702.48	10784.80
2037	657	42	560	7	65050.16	22767.57
2038	702	20	857	10	34404.70	3440.50
2039	390	41	816	6	7181.88	2441.82
2040	680	22	126	7	29825.18	3579.03
2041	838	48	584	1	5014.67	1604.69
2042	762	34	981	9	15939.54	3825.45
2043	41	23	902	10	9139.30	2010.60
2044	259	25	156	2	2289.52	389.22
2045	613	27	5	1	8727.36	3054.58
2046	679	42	728	5	49411.65	12847.05
2047	189	14	82	3	21508.95	5162.16
2048	225	11	853	9	62696.61	16928.10
2049	536	21	369	8	18440.00	3503.60
2050	465	40	713	1	8032.77	2088.52
2051	150	27	653	1	3506.95	736.46
2052	302	1	36	10	71985.10	20155.80
2053	537	40	489	8	56074.96	12897.28
2054	860	42	611	1	6920.65	2422.23
2055	292	4	474	4	20046.60	3207.44
2056	47	31	461	4	27998.68	3079.84
2057	69	28	551	10	71137.40	17073.00
2058	556	42	326	2	15426.50	2776.78
2059	767	2	841	9	68564.07	23311.80
2060	369	33	249	1	8166.35	1061.63
2061	495	47	148	7	11520.18	3456.04
2062	771	6	586	6	40021.02	5202.72
2063	114	36	844	3	27034.17	10543.32
2064	755	44	815	5	32881.55	5589.85
2065	337	31	371	8	32954.24	8568.08
2066	257	50	29	1	6025.77	1325.67
2067	468	22	329	7	61541.83	19077.94
2068	145	18	596	1	4247.06	637.06
2069	810	6	423	2	17911.66	3224.10
2070	646	17	964	2	18972.42	4932.82
2071	253	12	383	10	78476.80	16480.10
2072	400	39	827	1	1820.77	309.53
2073	375	48	315	5	22115.85	5086.65
2074	42	17	943	3	18700.50	7293.21
2075	267	49	537	6	41653.92	11663.10
2076	31	11	37	4	37880.00	3788.00
2077	236	24	228	8	57939.44	21437.60
2078	857	19	549	3	17940.78	4844.01
2079	433	2	19	8	78754.48	10238.08
2080	53	28	753	8	40634.96	10565.12
2081	110	23	60	4	10794.40	1187.40
2082	755	44	750	3	1102.17	352.68
2083	758	35	580	8	45391.52	6808.72
2084	456	38	772	4	19662.04	5505.36
2085	128	42	792	10	35912.80	10773.80
2086	856	9	445	1	8393.64	1342.98
2087	485	18	892	1	3448.85	931.19
2088	417	42	493	5	12494.35	2373.95
2089	143	30	322	4	31039.52	12105.40
2090	600	29	507	7	51235.59	14345.94
2091	239	23	896	3	2734.53	546.90
2092	260	19	584	7	35102.69	11232.83
2093	759	24	493	10	24988.70	4747.90
2094	527	24	773	3	3779.88	944.97
2095	771	6	481	9	89374.68	17874.90
2096	161	21	608	8	41523.92	5398.08
2097	180	27	58	8	76474.24	15294.88
2098	344	30	641	4	25130.56	7790.48
2099	828	33	90	6	33928.80	8142.90
2100	349	27	428	9	40969.35	14339.25
2101	138	6	683	10	4758.30	1570.20
2102	409	40	101	5	42482.25	11470.20
2103	328	13	828	2	4606.70	1704.48
2104	563	35	595	3	24705.33	4446.96
2105	65	20	803	3	16920.87	2368.92
2106	831	26	821	6	42194.76	14346.24
2107	540	47	816	10	11969.80	4069.70
2108	248	12	633	7	48187.09	18311.09
2109	81	13	181	2	7455.60	2385.80
2110	776	22	449	2	17388.24	2608.24
2111	253	12	168	8	5258.16	578.40
2112	796	4	686	7	23938.18	5984.58
2113	768	49	832	8	44636.16	8480.88
2114	496	50	541	1	7770.80	3030.61
2115	227	41	916	5	14044.45	2387.55
2116	805	45	300	8	63214.56	20228.64
2117	765	14	960	8	6458.40	904.16
2118	598	35	688	6	53491.68	6418.98
2119	4	12	759	3	12914.58	2712.06
2120	456	4	421	6	13157.94	3947.40
2121	733	23	890	9	12405.60	2481.12
2122	755	44	53	5	48874.95	5376.25
2123	507	20	741	1	6933.73	1802.77
2124	685	4	286	5	23520.20	6820.85
2125	581	20	41	8	3425.04	993.28
2126	739	32	270	5	1301.85	429.60
2127	168	40	204	1	2907.48	930.39
2128	733	23	266	4	26425.72	9249.00
2129	741	36	290	6	53260.68	11717.34
2130	596	44	357	4	37626.08	11664.08
2131	797	27	648	5	33906.65	9154.80
2132	875	19	140	5	37759.40	12460.60
2133	41	23	351	9	1878.21	187.83
2134	313	30	797	7	47773.67	10510.22
2135	810	38	196	8	20915.76	6693.04
2136	416	39	583	10	52543.10	12610.30
2137	777	30	116	7	15692.53	3138.52
2138	772	47	499	4	29575.84	7985.48
2139	374	10	899	7	42885.64	11150.30
2140	65	12	40	6	26700.72	5874.18
2141	652	34	557	4	10554.60	2955.28
2142	184	15	182	6	38125.92	11819.04
2143	177	18	570	2	4247.24	1444.06
2144	377	14	840	7	43202.11	9504.46
2145	514	32	942	7	12534.97	1880.27
2146	739	37	635	3	8318.04	1164.54
2147	438	25	35	3	8842.62	2387.52
2148	578	42	212	3	15386.67	2923.47
2149	567	24	626	8	36907.44	12917.60
2150	559	39	172	2	218.12	76.34
2151	265	49	845	10	88818.20	18651.80
2152	326	43	33	4	15817.96	4745.40
2153	793	12	388	2	11159.96	2901.58
2154	458	1	872	4	3401.04	442.12
2155	438	9	523	2	16202.72	6319.06
2156	129	11	231	6	42717.30	10252.14
2157	450	24	871	6	10039.08	1104.30
2158	378	16	858	9	87015.06	30455.28
2159	704	24	905	4	3809.48	914.28
2160	639	7	99	2	9449.32	3779.72
2161	274	49	569	5	20729.00	4353.10
2162	41	23	932	9	28807.02	2880.72
2163	477	37	73	2	4710.78	565.30
2164	364	8	328	8	63692.72	20381.68
2165	354	10	828	1	2303.35	852.24
2166	875	45	994	6	12029.10	1804.38
2167	737	44	547	5	37121.80	4825.85
2168	297	8	405	5	27477.20	8517.95
2169	789	32	504	9	6450.21	1225.53
2170	864	21	610	2	17479.38	2097.52
2171	308	4	718	2	17259.18	3969.62
2172	621	39	112	10	26117.50	2611.70
2173	414	38	7	4	18776.44	2816.48
2174	42	20	143	4	16376.64	6223.12
2175	311	49	254	10	18039.00	7215.60
2176	148	2	812	6	27451.14	6313.74
2177	680	22	881	8	74763.68	29905.44
2178	319	40	325	6	41779.08	6684.66
2179	875	7	575	6	33356.94	12675.66
2180	668	5	811	9	88305.93	35322.39
2181	734	20	40	1	4450.12	979.03
2182	375	48	701	10	84977.30	24643.40
2183	12	15	351	9	1878.21	187.83
2184	212	41	872	5	4251.30	552.65
2185	65	20	243	4	4199.60	1217.88
2186	253	25	512	10	9154.70	915.50
2187	45	30	649	6	52041.00	19255.14
2188	807	40	946	9	79425.00	27004.50
2189	857	19	649	3	26020.50	9627.57
2190	493	5	868	3	11053.56	2321.25
2191	700	32	240	3	4953.12	643.92
2192	374	10	232	10	99713.20	20939.80
2193	131	41	27	2	9178.38	3120.64
2194	403	14	106	2	17308.12	3115.46
2195	538	35	792	2	7182.56	2154.76
2196	417	42	654	9	74823.93	19454.22
2197	438	9	795	3	20016.30	6605.37
2198	257	50	699	8	32092.72	8344.08
2199	549	47	567	6	44009.40	4841.04
2200	471	19	618	4	27971.64	10069.80
2201	796	21	382	7	15185.10	2581.46
2202	356	20	704	10	88267.00	32658.80
2203	255	6	683	10	4758.30	1570.20
2204	123	16	726	3	13004.37	4291.44
2205	529	48	456	4	21565.84	2156.60
2206	588	37	662	3	7611.24	1522.26
2207	125	48	906	8	63228.48	18968.56
2208	215	16	405	5	27477.20	8517.95
2209	536	21	399	2	7750.00	1782.50
2210	91	5	231	8	56956.40	13669.52
2211	535	12	539	8	34140.24	7169.44
2212	202	39	826	3	17703.69	4602.96
2213	266	12	138	2	8796.06	967.56
2214	37	2	702	4	35330.52	9892.56
2215	801	1	583	3	15762.93	3783.09
2216	686	7	756	5	19804.00	6535.30
2217	233	33	64	9	22177.98	7540.47
2218	434	2	352	10	95644.80	20085.40
2219	142	37	167	9	67194.99	8063.37
2220	846	19	476	2	16687.86	5173.24
2221	749	43	544	2	17960.74	4310.58
2222	358	48	693	4	19083.04	6869.88
2223	512	9	919	7	63695.17	8917.30
2224	777	50	622	10	38882.50	3888.20
2225	573	19	286	6	28224.24	8185.02
2226	563	18	351	8	1669.52	166.96
2227	680	39	669	5	16291.70	3747.10
2228	383	23	512	4	3661.88	366.20
2229	287	36	562	6	20739.30	4770.06
2230	222	4	675	2	930.22	334.88
2231	609	38	96	10	78605.60	12576.90
2232	516	31	153	10	5116.70	1995.50
2233	105	34	89	8	46234.16	17106.64
2234	266	26	702	1	8832.63	2473.14
2235	579	45	459	7	4179.63	1462.86
2236	75	41	149	6	38373.18	5755.98
2237	550	43	548	2	11908.20	3810.62
2238	634	38	219	6	54897.42	21409.98
2239	796	21	269	10	85069.10	17013.80
2240	606	40	448	1	4519.03	1084.57
2241	503	45	923	7	22795.50	5698.84
2242	570	39	684	2	16459.06	3127.22
2243	400	38	357	4	37626.08	11664.08
2244	782	30	233	3	13617.33	4766.07
2245	856	10	176	4	19544.64	6645.16
2246	574	23	938	10	32844.40	9524.90
2247	73	19	992	4	3241.64	972.48
2248	536	2	763	2	7574.78	2196.68
2249	762	27	1000	4	8894.12	2846.12
2250	315	46	717	3	29526.69	5314.80
2251	560	45	134	7	33843.39	5753.37
2252	240	30	374	1	1655.92	347.74
2253	114	36	812	3	13725.57	3156.87
2254	389	30	999	10	6862.70	1921.60
2255	574	37	228	3	21727.29	8039.10
2256	371	43	932	4	12803.12	1280.32
2257	47	26	100	9	51596.73	10835.28
2258	686	22	944	8	35932.96	9701.92
2259	237	2	376	9	48478.68	13089.24
2260	796	4	231	3	21358.65	5126.07
2261	856	9	279	2	7161.10	1647.06
2262	761	35	660	6	26550.66	9823.74
2263	392	2	739	8	60397.12	14495.28
2264	648	29	198	6	45125.46	9476.34
2265	706	9	916	7	19662.23	3342.57
2266	88	32	964	7	66403.47	17264.87
2267	153	32	274	9	37669.05	7157.16
2268	212	18	336	4	16768.24	2179.88
2269	659	26	402	4	15531.88	2329.80
2270	746	50	258	2	18503.22	7216.26
2271	67	37	589	9	49505.22	19802.07
2272	765	14	359	2	10336.36	3411.00
2273	13	32	679	9	87987.96	32555.52
2274	157	50	150	7	58158.94	17447.71
2275	312	6	841	10	76182.30	25902.00
2276	340	29	537	7	48596.24	13606.95
2277	797	28	627	7	41057.94	6158.67
2278	383	28	214	8	4384.16	832.96
2279	147	12	243	10	10499.00	3044.70
2280	411	18	874	6	17158.98	3088.62
2281	340	11	878	5	30766.55	3999.65
2282	626	26	372	7	56794.08	15902.32
2283	184	1	24	10	13018.40	2733.90
2284	442	33	754	10	336.10	90.70
2285	710	49	468	2	4188.92	502.68
2286	696	43	970	1	218.16	65.45
2287	134	5	530	1	4012.13	641.94
2288	245	3	698	6	19719.24	2169.12
2289	571	15	838	7	35894.95	7896.91
2290	696	34	799	3	17580.15	4922.43
2291	458	19	152	9	21884.22	3501.45
2292	414	23	288	1	993.94	318.06
2293	33	6	24	10	13018.40	2733.90
2294	384	13	795	3	20016.30	6605.37
2295	795	18	919	9	81893.79	11465.10
2296	161	28	46	3	29760.99	6547.41
2297	616	23	212	1	5128.89	974.49
2298	245	3	874	8	22878.64	4118.16
2299	314	15	494	8	23310.96	3962.88
2300	654	26	533	6	19657.98	7470.06
2301	166	14	626	3	13840.29	4844.10
2302	134	47	782	10	14196.50	1845.50
2303	348	4	340	1	7752.69	2170.75
2304	369	33	246	4	4988.08	1296.92
2305	205	36	354	9	54777.42	5477.76
2306	456	11	424	6	37537.86	14264.40
2307	843	24	45	8	70835.76	9917.04
2308	545	23	977	8	68102.72	14982.56
2309	487	44	697	4	5253.12	1891.12
2310	283	32	46	2	19840.66	4364.94
2311	492	1	29	2	12051.54	2651.34
2312	828	7	57	6	19184.58	4604.28
2313	623	42	286	6	28224.24	8185.02
2314	878	14	276	3	28848.90	10385.61
2315	700	32	342	4	31807.24	9224.08
2316	596	12	125	7	24671.57	8881.74
2317	110	39	754	10	336.10	90.70
2318	18	40	456	6	32348.76	3234.90
2319	163	2	668	4	15404.92	4467.44
2320	260	19	520	3	1621.23	616.08
2321	398	24	822	9	48260.16	12547.62
2322	565	38	870	1	4404.32	1629.60
2323	102	10	952	1	20.10	3.82
2324	4	12	727	1	8440.48	3207.38
2325	328	13	361	3	11764.08	2117.52
2326	551	2	326	10	77132.50	13883.90
2327	496	36	815	2	13152.62	2235.94
2328	574	23	803	1	5640.29	789.64
2329	613	23	411	9	59129.55	12417.21
2330	475	3	908	9	53623.53	19840.68
2331	588	37	560	4	37171.52	13010.04
2332	413	37	666	9	28255.05	7911.45
2333	350	34	631	7	18575.83	2043.37
2334	650	9	557	2	5277.30	1477.64
2335	793	1	989	9	6560.19	1836.81
2336	481	30	614	5	48951.40	11748.35
2337	668	9	134	6	29008.62	4931.46
2338	583	19	145	2	15072.62	5426.14
2339	92	27	189	2	2443.96	488.80
2340	631	2	43	7	67566.17	11486.23
2341	859	19	434	3	25293.33	4805.73
2342	705	21	153	1	511.67	199.55
2343	420	38	564	10	64121.40	7053.40
2344	160	5	116	1	2241.79	448.36
2345	68	34	868	1	3684.52	773.75
2346	548	31	764	5	37893.45	8336.55
2347	391	47	475	6	34331.22	9956.04
2348	877	31	394	7	44669.73	9380.63
2349	69	12	71	1	3832.26	804.77
2350	163	4	486	1	6296.70	1448.24
2351	763	32	472	3	19095.81	1909.59
2352	762	4	78	8	51951.20	7273.20
2353	596	49	250	2	7477.68	2392.86
2354	256	25	787	6	912.18	164.22
2355	828	42	887	9	70554.06	23282.82
2356	339	34	627	5	29327.10	4399.05
2357	795	37	824	2	16140.82	5326.48
2358	508	2	359	7	36177.26	11938.50
2359	308	4	627	2	11730.84	1759.62
2360	502	44	503	10	37317.60	8583.00
2361	845	25	896	2	1823.02	364.60
2362	317	30	789	8	75847.28	18203.36
2363	417	5	724	2	18560.26	5196.88
2364	13	32	187	9	13493.34	1484.28
2365	735	34	966	9	37160.19	4830.84
2366	615	50	741	1	6933.73	1802.77
2367	858	16	601	8	31652.32	7596.56
2368	680	14	896	5	4557.55	911.50
2369	107	40	860	5	46952.55	14085.75
2370	713	17	402	2	7765.94	1164.90
2371	598	35	405	10	54954.40	17035.90
2372	732	10	399	8	31000.00	7130.00
2373	867	25	469	2	72.78	21.84
2374	680	39	545	2	1153.74	415.34
2375	608	30	701	8	67981.84	19714.72
2376	454	8	904	8	75712.40	13628.24
2377	863	14	740	8	49530.16	19812.08
2378	5	50	407	2	8875.20	3106.32
2379	477	1	412	2	16013.98	1921.68
2380	579	45	205	3	689.79	151.74
2381	832	14	697	10	13132.80	4727.80
2382	756	8	453	6	54262.92	13565.76
2383	438	25	551	4	28454.96	6829.20
2384	176	9	620	4	15154.80	5455.72
2385	239	23	117	5	18084.55	7233.80
2386	478	37	54	2	287.46	86.24
2387	730	9	809	6	25845.36	8787.42
2388	24	16	907	7	350.98	42.14
2389	439	40	887	2	15678.68	5173.96
2390	752	5	909	6	29433.00	7358.28
2391	713	17	255	7	3577.14	1359.33
2392	443	22	669	2	6516.68	1498.84
2393	378	16	448	6	27114.18	6507.42
2394	87	17	67	1	6996.56	1119.45
2395	306	44	147	7	57122.73	12567.03
2396	27	23	281	5	23113.05	5084.85
2397	268	17	614	10	97902.80	23496.70
2398	692	25	446	2	19165.48	5749.64
2399	848	28	505	8	20781.92	4364.24
2400	387	12	823	1	8317.46	2245.71
2401	489	10	863	4	12765.20	4850.76
2402	446	20	964	9	85375.89	22197.69
2403	69	8	654	10	83137.70	21615.80
2404	853	32	762	8	42893.52	4718.32
2405	266	12	696	4	27641.68	7739.68
2406	18	40	607	1	6128.33	1348.23
2407	88	32	888	8	46062.32	12436.80
2408	371	31	881	6	56072.76	22429.08
2409	734	34	872	1	850.26	110.53
2410	859	25	274	10	41854.50	7952.40
2411	407	43	831	8	3296.72	659.36
2412	332	7	910	7	20019.44	4003.86
2413	776	37	303	1	9247.02	3143.99
2414	680	16	109	3	11575.47	3125.37
2415	440	12	6	5	28227.10	7621.30
2416	649	45	313	1	9361.33	3463.69
2417	847	50	872	9	7652.34	994.77
2418	79	13	548	3	17862.30	5715.93
2419	729	18	68	2	15544.76	5907.00
2420	227	41	57	2	6394.86	1534.76
2421	398	24	366	6	1277.22	127.74
2422	802	2	961	5	44384.50	9320.75
2423	253	25	912	9	44596.17	5351.58
2424	60	43	819	5	15305.00	5662.85
2425	525	3	348	6	4018.80	1567.32
2426	333	6	850	5	43178.00	8635.60
2427	392	5	438	9	60319.98	13873.59
2428	490	13	175	5	49541.05	8422.00
2429	741	36	179	3	980.34	274.50
2430	106	15	990	2	14987.02	3147.28
2431	810	38	394	10	63813.90	13400.90
2432	308	4	195	4	39725.20	4369.76
2433	25	10	189	3	3665.94	733.20
2434	313	30	992	4	3241.64	972.48
2435	548	31	93	7	35125.58	11240.18
2436	313	30	839	10	92207.00	10142.80
2437	39	2	689	9	40860.27	13075.29
2438	218	11	343	5	48010.35	7201.55
2439	14	49	366	9	1915.83	191.61
2440	496	13	924	10	70236.00	7023.60
2441	245	3	598	7	15432.27	4012.40
2442	183	38	195	6	59587.80	6554.64
2443	607	4	901	5	8397.80	1595.60
2444	73	40	505	5	12988.70	2727.65
2445	295	47	934	10	822.60	115.20
2446	66	39	809	10	43075.60	14645.70
2447	418	31	721	3	29901.72	7176.42
2448	73	44	1000	8	17788.24	5692.24
2449	484	44	414	1	8303.86	2325.08
2450	150	27	813	5	32373.30	7769.60
2451	53	33	29	6	36154.62	7954.02
2452	592	39	409	3	18723.45	2621.28
2453	755	25	150	7	58158.94	17447.71
2454	253	12	122	6	45975.60	15171.96
2455	575	10	320	4	29153.48	7288.36
2456	510	32	668	9	34661.07	10051.74
2457	481	30	286	8	37632.32	10913.36
2458	659	26	932	6	19204.68	1920.48
2459	316	39	138	7	30786.21	3386.46
2460	579	45	383	9	70629.12	14832.09
2461	391	47	957	5	25739.55	3603.55
2462	861	38	195	10	99313.00	10924.40
2463	229	15	291	3	7209.33	2523.27
2464	462	36	379	6	40792.02	4487.10
2465	246	17	110	4	37403.48	6358.60
2466	496	36	902	4	3655.72	804.24
2467	180	27	301	8	21271.12	4466.96
2468	425	21	14	1	7682.48	1843.80
2469	15	2	333	7	15234.10	4570.23
2470	328	37	403	1	693.84	76.32
2471	680	16	997	1	4576.42	686.46
2472	431	44	571	6	37752.60	4152.78
2473	465	40	885	8	7480.80	2842.72
2474	646	17	728	5	49411.65	12847.05
2475	154	29	936	1	4628.67	1481.17
2476	615	50	521	8	67755.52	26424.64
2477	28	35	739	4	30198.56	7247.64
2478	628	46	988	8	27829.28	5287.60
2479	726	3	506	2	1098.82	395.58
2480	805	17	350	3	21098.61	8228.46
2481	650	9	800	3	29397.21	5291.49
2482	736	14	346	4	16031.32	4328.44
2483	789	48	755	4	33916.28	6444.08
2484	564	7	180	10	35570.00	14228.00
2485	846	26	90	2	11309.60	2714.30
2486	205	34	399	6	23250.00	5347.50
2487	546	25	885	5	4675.50	1776.70
2488	680	14	769	10	94897.30	17081.50
2489	710	49	640	5	27536.30	7985.55
2490	329	28	347	8	57840.40	12146.48
2491	749	43	969	8	19590.08	2350.80
2492	38	16	446	4	38330.96	11499.28
2493	853	8	260	2	978.94	186.00
2494	704	10	893	7	43569.61	13942.25
2495	86	44	118	5	11682.70	3154.35
2496	828	33	848	4	17747.40	4259.36
2497	256	40	728	10	98823.30	25694.10
2498	780	49	820	3	5542.11	2050.59
2499	25	40	214	8	4384.16	832.96
2500	176	9	602	10	33597.60	6383.50
2501	326	37	419	3	9530.79	3431.07
2502	875	19	441	6	40525.02	10131.24
2503	751	3	322	2	15519.76	6052.70
2504	694	42	98	7	6795.46	1766.80
2505	74	28	757	5	5430.55	923.20
2506	656	39	769	7	66428.11	11957.05
2507	868	8	787	9	1368.27	246.33
2508	446	20	763	6	22724.34	6590.04
2509	39	2	627	1	5865.42	879.81
2510	277	29	320	4	29153.48	7288.36
2511	109	37	339	5	37429.85	13849.05
2512	410	10	984	9	50936.94	6621.84
2513	730	9	489	3	21028.11	4836.48
2514	657	38	489	1	7009.37	1612.16
2515	42	20	275	3	21904.26	7009.35
2516	246	13	619	10	10472.30	1780.30
2517	296	21	15	2	10561.96	2429.26
2518	604	28	708	1	6356.07	1843.26
2519	581	42	180	8	28456.00	11382.40
2520	13	9	485	9	63397.98	19653.39
2521	256	40	3	4	34574.68	8643.68
2522	100	26	532	8	71655.76	8598.72
2523	336	42	61	4	7001.12	2730.44
2524	565	43	703	8	50033.12	11007.28
2525	173	10	733	9	81942.48	18846.81
2526	694	34	484	5	45230.20	11759.85
2527	637	41	682	7	9752.26	2925.65
2528	256	40	226	8	35801.84	4654.24
2529	111	5	620	2	7577.40	2727.86
2530	31	11	212	7	35902.23	6821.43
2531	272	19	701	2	16995.46	4928.68
2532	401	6	738	2	4633.54	1019.38
2533	693	17	150	3	24925.26	7477.59
2534	121	30	189	8	9775.84	1955.20
2535	336	9	846	1	6680.65	1937.39
2536	165	16	183	4	1734.00	450.84
2537	845	25	693	5	23853.80	8587.35
2538	83	16	567	5	36674.50	4034.20
2539	364	33	548	1	5954.10	1905.31
2540	285	34	485	8	56353.76	17469.68
2541	720	47	700	4	20308.56	6092.56
2542	668	5	573	1	1604.43	497.37
2543	49	47	828	7	16123.45	5965.68
2544	770	38	505	9	23379.66	4909.77
2545	53	33	597	4	31308.80	8766.48
2546	355	24	929	5	7821.35	2190.00
2547	668	9	434	8	67448.88	12815.28
2548	230	35	309	8	12756.40	2551.28
2549	420	24	131	5	2367.25	875.90
2550	673	10	973	8	27488.16	10170.64
2551	301	14	173	9	57711.87	20776.23
2552	812	16	631	9	23883.21	2627.19
2553	454	8	511	10	15367.20	4917.50
2554	62	22	726	8	34678.32	11443.84
2555	768	44	926	3	15910.68	4455.00
2556	600	29	146	1	3271.24	392.55
2557	412	18	519	7	2493.89	897.82
2558	457	2	877	3	8769.96	1490.88
2559	177	18	766	5	7669.10	2224.05
2560	876	17	479	4	2575.36	309.04
2561	482	29	630	3	4275.39	1239.87
2562	460	34	474	8	40093.20	6414.88
2563	853	8	90	5	28274.00	6785.75
2564	578	11	28	3	23130.03	4394.70
2565	331	8	143	2	8188.32	3111.56
2566	650	39	329	5	43958.45	13627.10
2567	326	19	407	9	39938.40	13978.44
2568	514	27	177	7	40175.66	5624.57
2569	585	7	566	5	16276.75	4883.05
2570	81	48	488	2	19252.50	2117.78
2571	464	15	704	10	88267.00	32658.80
2572	649	49	996	9	72183.87	20933.28
2573	295	50	811	10	98117.70	39247.10
2574	764	35	948	3	20670.99	7028.13
2575	214	27	277	7	61897.78	6808.76
2576	60	28	226	2	8950.46	1163.56
2577	251	32	406	2	6594.60	2110.28
2578	72	41	563	1	7765.54	1009.52
2579	304	9	970	8	1745.28	523.60
2580	65	23	789	10	94809.10	22754.20
2581	339	34	824	3	24211.23	7989.72
2582	855	38	59	5	18827.20	5083.35
2583	323	24	149	2	12791.06	1918.66
2584	188	46	358	5	123.00	36.90
2585	732	11	364	8	50111.12	13028.88
2586	355	21	541	10	77708.00	30306.10
2587	101	15	269	5	42534.55	8506.90
2588	521	13	180	4	14228.00	5691.20
2589	601	48	820	1	1847.37	683.53
2590	62	22	725	10	56330.90	6196.40
2591	621	39	38	1	4893.02	1321.12
2592	99	32	986	10	76328.80	25188.50
2593	768	49	655	7	48419.28	8715.49
2594	143	30	821	1	7032.46	2391.04
2595	153	20	204	7	20352.36	6512.73
2596	583	19	605	1	5547.18	2163.40
2597	699	27	520	1	540.41	205.36
2598	452	20	51	7	38363.99	4987.29
2599	316	49	320	4	29153.48	7288.36
2600	11	36	331	8	17170.08	6009.52
2601	263	24	244	7	43007.72	16772.98
2602	109	37	722	3	28807.29	7777.98
2603	108	44	596	5	21235.30	3185.30
2604	726	3	963	9	57384.99	10903.14
2605	752	11	978	2	5098.80	968.78
2606	568	25	625	9	60579.54	13933.26
2607	317	30	708	4	25424.28	7373.04
2608	833	24	345	2	19847.20	5755.68
2609	497	18	839	5	46103.50	5071.40
2610	213	35	666	1	3139.45	879.05
2611	739	29	338	4	12442.36	4976.96
2612	584	26	349	10	49040.90	14221.90
2613	361	26	220	4	18897.24	3968.44
2614	390	41	284	6	10236.60	1228.38
2615	680	16	621	9	39189.24	13324.32
2616	159	1	432	5	7940.45	1826.30
2617	129	11	419	6	19061.58	6862.14
2618	585	7	596	9	38223.54	5733.54
2619	820	8	781	5	17061.00	2217.95
2620	251	39	690	7	36809.71	7361.97
2621	236	23	943	10	62335.00	24310.70
2622	207	29	869	3	28309.47	9625.23
2623	710	49	615	3	27495.03	8248.50
2624	447	26	69	8	51034.40	14800.00
2625	223	23	685	9	2313.00	925.20
2626	678	28	507	10	73193.70	20494.20
2627	385	29	45	7	61981.29	8677.41
2628	178	39	577	9	70290.72	11949.39
2629	209	45	453	4	36175.28	9043.84
2630	580	37	930	3	28014.72	7283.82
2631	733	45	290	1	8876.78	1952.89
2632	661	24	709	10	71828.40	20830.20
2633	608	30	92	2	11408.20	3992.86
2634	390	41	407	5	22188.00	7765.80
2635	374	10	273	8	29061.28	5521.68
2636	642	46	422	1	5501.48	935.25
2637	637	27	78	10	64939.00	9091.50
2638	676	11	572	7	43472.03	12172.16
2639	233	33	293	9	44414.82	8883.00
2640	65	20	342	4	31807.24	9224.08
2641	274	49	286	3	14112.12	4092.51
2642	377	20	709	2	14365.68	4166.04
2643	606	7	75	3	11964.21	1196.43
2644	426	15	389	10	9609.00	3747.50
2645	765	7	477	10	12265.00	4170.10
2646	546	3	647	4	27913.08	3070.44
2647	857	19	309	2	3189.10	637.82
2648	43	34	803	5	28201.45	3948.20
2649	704	10	205	3	689.79	151.74
2650	230	35	563	6	46593.24	6057.12
2651	111	5	36	6	43191.06	12093.48
2652	310	22	234	2	11973.48	1796.02
2653	738	7	52	9	41732.64	4173.30
2654	683	29	971	3	26202.99	3406.38
2655	131	32	951	10	28438.70	8531.60
2656	783	28	589	10	55005.80	22002.30
2657	53	28	697	9	11819.52	4255.02
2658	178	39	147	8	65283.12	14362.32
2659	866	2	637	1	3418.95	1333.39
2660	373	46	119	6	10282.92	2673.54
2661	428	1	361	4	15685.44	2823.36
2662	222	7	946	4	35300.00	12002.00
2663	210	10	727	8	67523.84	25659.04
2664	560	45	379	5	33993.35	3739.25
2665	606	7	433	10	13352.40	4673.30
2666	720	10	946	8	70600.00	24004.00
2667	792	7	210	4	21362.52	6408.76
2668	76	5	224	9	67809.78	8137.17
2669	39	2	663	6	45482.10	17283.18
2670	207	22	845	4	35527.28	7460.72
2671	484	44	781	4	13648.80	1774.36
2672	431	14	2	5	10050.60	1507.60
2673	538	39	787	9	1368.27	246.33
2674	64	23	598	5	11023.05	2866.00
2675	801	1	25	6	36116.46	13001.94
2676	680	41	958	1	8682.38	1562.83
2677	682	46	889	4	17653.08	4060.20
2678	287	36	641	5	31413.20	9738.10
2679	564	7	607	1	6128.33	1348.23
2680	351	36	774	3	26144.85	4967.52
2681	686	22	375	1	7338.75	2935.50
2682	726	46	232	8	79770.56	16751.84
2683	144	24	38	5	24465.10	6605.60
2684	805	14	550	9	41994.27	5039.28
2685	57	14	92	9	51336.90	17967.87
2686	353	2	815	1	6576.31	1117.97
2687	759	24	358	5	123.00	36.90
2688	740	31	780	2	12816.46	2819.62
2689	517	42	611	4	27682.60	9688.92
2690	563	9	979	6	53455.86	17640.42
2691	4	12	111	2	18614.30	3536.72
2692	34	19	724	5	46400.65	12992.20
2693	520	37	10	10	28262.50	10739.70
2694	546	35	508	10	96063.20	19212.60
2695	36	40	874	3	8579.49	1544.31
2696	418	31	278	5	41051.60	12315.50
2697	724	6	852	8	61790.80	14211.92
2698	866	40	421	4	8771.96	2631.60
2699	755	25	959	8	55196.88	13247.28
2700	718	34	982	7	63733.81	24856.16
2701	400	39	900	5	7458.45	2759.65
2702	270	33	360	3	5002.29	850.38
2703	131	11	145	2	15072.62	5426.14
2704	97	1	972	8	19535.60	6642.08
2705	714	27	277	10	88425.40	9726.80
2706	24	32	984	5	28298.30	3678.80
2707	493	5	318	5	18462.00	3692.40
2708	323	29	903	3	23303.70	7224.15
2709	286	15	682	4	5572.72	1671.80
2710	664	9	103	3	8185.17	1800.75
2711	833	19	511	4	6146.88	1967.00
2712	222	4	877	9	26309.88	4472.64
2713	755	30	259	7	58053.03	5805.31
2714	356	20	977	9	76615.56	16855.38
2715	658	41	386	9	68511.33	23293.89
2716	182	21	805	9	25305.12	8603.73
2717	650	39	657	6	2560.32	409.68
2718	355	24	643	5	35902.25	8257.50
2719	282	9	18	3	29968.11	5394.27
2720	714	13	161	7	53260.76	18641.28
2721	687	18	599	2	5400.72	1728.24
2722	655	18	570	4	8494.48	2888.12
2723	88	32	316	2	7575.76	2727.28
2724	481	30	30	2	13088.08	1963.22
2725	784	12	649	10	86735.00	32091.90
2726	347	33	258	10	92516.10	36081.30
2727	704	24	403	3	2081.52	228.96
2728	859	19	104	7	43084.79	16803.08
2729	187	19	318	7	25846.80	5169.36
2730	426	16	645	4	783.36	274.16
2731	64	23	919	2	18198.62	2547.80
2732	326	24	851	8	34435.28	4820.96
2733	348	4	928	10	60837.00	20076.20
2734	513	10	802	5	15039.10	4511.75
2735	724	6	23	6	34035.84	9189.66
2736	738	7	194	4	21748.88	3262.32
2737	85	46	844	8	72091.12	28115.52
2738	331	23	286	10	47040.40	13641.70
2739	820	24	467	7	66700.69	23345.21
2740	707	4	506	6	3296.46	1186.74
2741	198	26	275	8	58411.36	18691.60
2742	385	5	599	5	13501.80	4320.60
2743	39	26	42	7	36831.06	12154.24
2744	805	31	638	4	34725.20	12848.32
2745	331	23	123	8	17299.52	2940.88
2746	331	8	736	2	13004.54	1430.50
2747	102	8	369	5	11525.00	2189.75
2748	829	8	404	8	71450.88	20006.24
2749	274	49	140	2	15103.76	4984.24
2750	675	33	426	7	31100.30	6220.06
2751	82	48	257	7	33104.40	4634.63
2752	260	16	592	5	49089.95	9327.10
2753	353	2	592	2	19635.98	3730.84
2754	118	45	659	1	5822.99	1281.06
2755	242	34	653	2	7013.90	1472.92
2756	25	31	344	9	9339.03	1681.02
2757	784	17	470	7	49272.58	10347.26
2758	74	40	911	4	9448.08	2173.04
2759	875	34	825	10	11225.40	3255.40
2760	280	17	71	6	22993.56	4828.62
2761	498	30	352	5	47822.40	10042.70
2762	496	13	182	9	57188.88	17728.56
2763	438	25	426	2	8885.80	1777.16
2764	667	28	406	8	26378.40	8441.12
2765	542	34	374	10	16559.20	3477.40
2766	772	47	454	3	14516.79	2613.03
2767	302	1	339	4	29943.88	11079.24
2768	67	37	378	3	17960.85	6106.68
2769	261	29	418	3	4636.38	788.19
2770	333	24	817	2	8516.28	2725.20
2771	371	43	437	1	5416.16	1895.66
2772	793	1	481	3	29791.56	5958.30
2773	256	41	829	2	16322.38	4733.50
2774	357	11	316	4	15151.52	5454.56
2775	752	5	663	7	53062.45	20163.71
2776	551	2	558	3	29842.56	10146.48
2777	219	32	504	2	1433.38	272.34
2778	402	28	443	7	18923.31	4541.60
2779	680	22	529	9	32307.93	10984.68
2780	399	39	613	5	31291.20	4380.75
2781	694	34	439	5	20991.55	2728.90
2782	877	31	823	9	74857.14	20211.39
2783	716	23	251	5	28491.65	8832.40
2784	67	48	406	10	32973.00	10551.40
2785	91	37	863	6	19147.80	7276.14
2786	810	10	582	4	8632.72	863.28
2787	321	12	177	1	5739.38	803.51
2788	443	22	23	7	39708.48	10721.27
2789	533	26	355	6	57422.28	8039.10
2790	808	41	363	10	77756.20	9330.70
2791	591	44	57	8	25579.44	6139.04
2792	253	39	607	1	6128.33	1348.23
2793	853	45	236	2	11139.66	3119.10
2794	42	17	86	4	28968.12	3186.48
2795	872	28	81	8	48915.36	18587.84
2796	441	34	641	9	56543.76	17528.58
2797	463	46	290	10	88767.80	19528.90
2798	302	20	362	2	18842.90	5652.86
2799	151	25	142	9	40864.77	10624.86
2800	434	2	520	7	3782.87	1437.52
2801	69	31	308	9	11511.54	4604.58
2802	210	10	877	3	8769.96	1490.88
2803	84	4	591	8	4767.36	524.40
2804	425	21	399	8	31000.00	7130.00
2805	189	21	498	9	63738.27	23583.15
2806	260	20	250	10	37388.40	11964.30
2807	418	29	457	10	16602.40	5146.70
2808	73	44	542	10	94365.20	13211.10
2809	780	49	82	1	7169.65	1720.72
2810	339	5	750	10	3673.90	1175.60
2811	201	13	570	5	10618.10	3610.15
2812	44	15	351	6	1252.14	125.22
2813	709	34	524	2	13398.20	3081.58
2814	122	44	655	7	48419.28	8715.49
2815	222	7	499	8	59151.68	15970.96
2816	184	1	109	2	7716.98	2083.58
2817	230	36	400	4	21477.88	6228.60
2818	673	10	317	8	31945.92	12139.44
2819	178	39	196	5	13072.35	4183.15
2820	167	17	155	7	37395.75	9722.93
2821	544	1	320	8	58306.96	14576.72
2822	326	19	836	9	64881.27	14273.91
2823	239	32	902	3	2741.79	603.18
2824	261	42	669	6	19550.04	4496.52
2825	870	50	915	5	12437.60	2611.90
2826	416	39	660	5	22125.55	8186.45
2827	32	38	231	8	56956.40	13669.52
2828	86	3	832	8	44636.16	8480.88
2829	630	27	221	5	32923.95	9877.20
2830	410	10	791	6	16580.82	2984.52
2831	208	3	872	8	6802.08	884.24
2832	864	21	801	3	7324.56	1025.43
2833	825	31	931	5	13436.35	2149.80
2834	841	1	94	9	78654.87	23596.47
2835	170	21	102	8	38798.32	6207.76
2836	42	20	555	8	20570.48	3291.28
2837	373	46	176	3	14658.48	4983.87
2838	118	45	478	9	70639.74	9183.15
2839	762	27	952	10	201.00	38.20
2840	579	20	6	6	33872.52	9145.56
2841	732	11	802	2	6015.64	1804.70
2842	598	35	733	9	81942.48	18846.81
2843	261	29	660	8	35400.88	13098.32
2844	192	49	241	10	58574.40	13472.10
2845	102	27	594	10	72687.40	23986.80
2846	442	49	22	6	16799.88	1680.00
2847	513	35	82	3	21508.95	5162.16
2848	576	4	331	7	15023.82	5258.33
2849	846	26	293	4	19739.92	3948.00
2850	414	38	423	3	26867.49	4836.15
2851	81	48	934	1	82.26	11.52
2852	829	8	533	3	9828.99	3735.03
2853	197	21	628	3	12084.63	2900.31
2854	143	38	167	3	22398.33	2687.79
2855	332	25	185	10	77215.40	15443.10
2856	741	43	999	4	2745.08	768.64
2857	866	15	585	4	21496.32	2364.60
2858	437	15	865	9	82889.64	14091.21
2859	260	20	334	2	17500.62	4200.14
2860	70	45	407	3	13312.80	4659.48
2861	856	4	306	10	72208.10	28161.20
2862	366	3	712	2	8175.92	1553.42
2863	570	39	942	8	14325.68	2148.88
2864	677	18	30	7	45808.28	6871.27
2865	171	13	82	6	43017.90	10324.32
2866	638	44	24	3	3905.52	820.17
2867	197	21	664	6	7041.24	774.54
2868	783	28	999	10	6862.70	1921.60
2869	533	26	625	3	20193.18	4644.42
2870	455	11	151	1	3649.63	693.43
2871	211	3	568	4	34215.60	10606.84
2872	615	50	862	1	5953.08	1428.74
2873	726	4	744	5	4293.75	987.55
2874	529	2	962	4	28857.92	5771.60
2875	802	46	930	8	74705.92	19423.52
2876	608	40	229	8	22185.04	5768.08
2877	143	30	920	2	779.70	257.30
2878	611	42	117	7	25318.37	10127.32
2879	826	39	619	8	8377.84	1424.24
2880	755	25	317	4	15972.96	6069.72
2881	392	5	345	2	19847.20	5755.68
2882	487	44	618	10	69929.10	25174.50
2883	208	20	560	8	74343.04	26020.08
2884	16	10	585	9	48366.72	5320.35
2885	879	2	524	6	40194.60	9244.74
2886	118	13	466	8	57802.40	17918.72
2887	503	39	190	9	51019.65	14285.52
2888	45	30	451	2	14965.90	2843.52
2889	309	30	88	5	8753.05	2538.40
2890	91	24	860	10	93905.10	28171.50
2891	411	26	519	2	712.54	256.52
2892	648	29	190	8	45350.80	12698.24
2893	480	40	894	7	37447.34	10859.73
2894	411	26	205	7	1609.51	354.06
2895	349	15	310	7	9174.48	917.42
2896	504	42	279	4	14322.20	3294.12
2897	650	7	840	7	43202.11	9504.46
2898	161	30	352	4	38257.92	8034.16
2899	245	3	773	9	11339.64	2834.91
2900	165	47	599	9	24303.24	7777.08
2901	629	46	424	10	62563.10	23774.00
2902	842	39	89	5	28896.35	10691.65
2903	877	31	605	3	16641.54	6490.20
2904	455	41	742	2	14650.36	4981.12
2905	567	45	4	5	34358.15	8933.10
2906	846	13	848	7	31057.95	7453.88
2907	500	26	880	3	18853.71	2450.97
2908	240	30	164	4	10286.04	2262.92
2909	321	12	40	2	8900.24	1958.06
2910	833	22	885	10	9351.00	3553.40
2911	841	4	352	2	19128.96	4017.08
2912	379	36	784	8	72362.48	27497.76
2913	529	2	57	10	31974.30	7673.80
2914	867	17	976	5	523.70	146.65
2915	268	17	663	10	75803.50	28805.30
2916	122	5	260	1	489.47	93.00
2917	296	13	373	2	16318.32	1958.20
2918	507	3	273	9	32693.94	6211.89
2919	811	2	354	8	48691.04	4869.12
2920	598	1	607	10	61283.30	13482.30
2921	59	43	463	2	18851.06	4147.24
2922	292	43	150	7	58158.94	17447.71
2923	371	43	138	8	35184.24	3870.24
2924	777	30	664	7	8214.78	903.63
2925	529	2	107	5	42459.55	13587.05
2926	579	20	414	8	66430.88	18600.64
2927	378	26	391	7	3968.30	674.59
2928	287	18	718	10	86295.90	19848.10
2929	354	10	112	6	15670.50	1567.02
2930	866	40	165	4	9921.40	2678.76
2931	401	41	771	6	12523.38	1377.60
2932	563	35	81	1	6114.42	2323.48
2933	513	35	666	5	15697.25	4395.25
2934	131	41	677	7	15860.88	6027.14
2935	358	45	872	5	4251.30	552.65
2936	652	34	765	5	148.05	32.55
2937	377	3	396	4	10765.52	2583.72
2938	709	34	383	5	39238.40	8240.05
2939	67	37	308	5	6395.30	2558.10
2940	619	25	335	6	27310.62	3277.26
2941	207	38	425	5	14029.05	2384.95
2942	875	45	455	8	31795.76	4133.44
2943	658	41	601	10	39565.40	9495.70
2944	307	19	783	7	59780.98	20325.55
2945	182	40	962	5	36072.40	7214.50
2946	656	39	177	1	5739.38	803.51
2947	855	23	656	1	1054.88	116.04
2948	306	8	533	9	29486.97	11205.09
2949	229	15	445	9	75542.76	12086.82
2950	637	41	114	6	56910.36	15934.92
2951	140	1	978	4	10197.60	1937.56
2952	720	47	375	10	73387.50	29355.00
2953	694	34	991	7	22738.24	3638.11
2954	693	41	252	3	23163.24	2779.59
2955	394	31	781	8	27297.60	3548.72
2956	25	31	750	6	2204.34	705.36
2957	74	28	237	2	15663.54	3602.62
2958	441	34	390	3	4912.41	786.00
2959	771	6	53	1	9774.99	1075.25
2960	379	36	315	2	8846.34	2034.66
2961	734	34	719	7	24886.75	5972.82
2962	579	26	767	6	38724.84	13166.46
2963	16	10	324	5	29568.25	6505.00
2964	802	46	127	5	29819.45	11331.40
2965	109	8	21	1	517.10	67.22
2966	627	41	501	7	58396.94	20438.95
2967	705	45	790	2	8468.84	2710.02
2968	536	2	567	2	14669.80	1613.68
2969	306	8	643	2	14360.90	3303.00
2970	113	9	714	9	78578.37	29859.75
2971	732	11	29	7	42180.39	9279.69
2972	197	21	351	5	1043.45	104.35
2973	742	42	90	6	33928.80	8142.90
2974	725	10	33	5	19772.45	5931.75
2975	49	30	126	2	8521.48	1022.58
2976	481	12	779	4	27877.48	8642.00
2977	590	10	440	8	61447.28	6759.20
2978	466	1	937	4	1943.96	252.72
2979	842	39	680	2	19860.98	5163.86
2980	67	37	172	1	109.06	38.17
2981	67	48	12	2	19668.06	3343.58
2982	218	11	333	5	10881.50	3264.45
2983	832	44	45	3	26563.41	3718.89
2984	414	38	67	10	69965.60	11194.50
2985	560	45	771	6	12523.38	1377.60
2986	205	36	358	5	123.00	36.90
2987	760	36	319	10	62718.50	23833.00
2988	856	4	651	4	27129.16	8138.76
2989	266	21	175	1	9908.21	1684.40
2990	140	1	876	8	9785.36	3816.32
2991	205	34	370	4	5357.00	964.28
2992	344	5	331	8	17170.08	6009.52
2993	744	31	563	7	54358.78	7066.64
2994	233	35	543	7	27954.36	7827.19
2995	59	43	733	1	9104.72	2094.09
2996	565	1	617	7	41513.64	15775.20
2997	260	19	681	6	30734.10	4302.78
2998	686	7	184	8	14302.08	5577.84
2999	70	45	702	4	35330.52	9892.56
3000	157	50	391	2	1133.80	192.74
3001	664	9	311	9	28123.92	8437.14
3002	609	7	363	10	77756.20	9330.70
3003	718	45	801	1	2441.52	341.81
3004	385	29	998	2	14637.00	2781.02
3005	271	40	234	1	5986.74	898.01
3006	715	29	73	3	7066.17	847.95
3007	778	19	804	9	40786.65	15498.90
3008	188	46	299	6	54238.20	9220.50
3009	62	22	54	2	287.46	86.24
3010	273	33	385	4	22924.52	6189.64
3011	847	48	436	6	41041.80	10260.42
3012	581	20	570	9	19112.58	6498.27
3013	260	19	436	5	34201.50	8550.35
3014	721	45	769	1	9489.73	1708.15
3015	726	3	515	3	26493.00	7682.97
3016	69	31	442	10	59591.60	13706.10
3017	552	32	815	3	19728.93	3353.91
3018	691	43	903	2	15535.80	4816.10
3019	805	17	199	6	36223.08	6520.14
3020	481	28	884	9	34633.62	9697.41
3021	331	23	292	10	79149.60	22953.40
3022	258	34	845	9	79936.38	16786.62
3023	362	30	480	10	55144.50	9374.60
3024	282	9	564	4	25648.56	2821.36
3025	156	39	723	2	10600.82	2120.16
3026	472	26	383	8	62781.44	13184.08
3027	827	20	35	6	17685.24	4775.04
3028	657	38	894	6	32097.72	9308.34
3029	79	48	334	7	61252.17	14700.49
3030	131	46	671	10	25739.80	3861.00
3031	762	42	1000	2	4447.06	1423.06
3032	465	24	616	4	4220.76	1688.32
3033	546	25	381	5	5842.55	1694.35
3034	207	9	246	8	9976.16	2593.84
3035	807	38	305	4	36004.28	10801.28
3036	479	40	893	3	18672.69	5975.25
3037	435	16	53	10	97749.90	10752.50
3038	17	10	760	8	30775.20	9540.32
3039	472	26	662	1	2537.08	507.42
3040	683	6	560	3	27878.64	9757.53
3041	694	42	592	8	78543.92	14923.36
3042	20	38	160	2	1048.64	335.56
3043	826	21	814	8	68514.40	23980.00
3044	152	50	165	9	22323.15	6027.21
3045	243	33	165	3	7441.05	2009.07
3046	90	22	304	3	25080.87	4012.95
3047	601	50	3	9	77793.03	19448.28
3048	368	21	48	3	12003.42	4681.32
3049	221	8	167	1	7466.11	895.93
3050	498	25	780	2	12816.46	2819.62
3051	208	20	788	2	7323.10	1171.70
3052	156	39	882	8	7017.60	1614.08
3053	363	2	69	10	63793.00	18500.00
3054	665	23	23	7	39708.48	10721.27
3055	82	48	985	7	52720.22	5272.05
3056	231	25	496	9	3475.08	1007.73
3057	593	50	407	8	35500.80	12425.28
3058	443	30	128	4	12599.84	1889.96
3059	718	14	468	5	10472.30	1256.70
3060	38	42	973	10	34360.20	12713.30
3061	722	33	51	4	21922.28	2849.88
3062	386	47	5	1	8727.36	3054.58
3063	599	41	422	2	11002.96	1870.50
3064	114	36	957	4	20591.64	2882.84
3065	377	36	779	3	20908.11	6481.50
3066	216	19	729	9	49671.18	17384.94
3067	788	43	392	4	26123.40	9404.44
3068	857	19	467	10	95286.70	33350.30
3069	812	16	943	2	12467.00	4862.14
3070	842	39	955	4	4088.20	1471.76
3071	706	6	460	8	26612.32	7451.44
3072	328	35	797	2	13649.62	3002.92
3073	659	6	624	4	37929.60	4551.56
3074	267	37	206	10	80624.40	12899.90
3075	829	8	641	4	25130.56	7790.48
3076	331	6	863	7	22339.10	8488.83
3077	560	40	5	4	34909.44	12218.32
3078	617	38	210	7	37384.41	11215.33
3079	147	12	624	5	47412.00	5689.45
3080	156	39	176	5	24430.80	8306.45
3081	245	10	320	3	21865.11	5466.27
3082	764	24	61	8	14002.24	5460.88
3083	383	23	727	2	16880.96	6414.76
3084	389	17	526	9	6632.28	862.20
3085	790	7	8	9	30191.22	8151.66
3086	649	47	563	8	62124.32	8076.16
3087	99	46	838	9	46150.65	10153.17
3088	276	32	544	8	71842.96	17242.32
3089	59	43	350	2	14065.74	5485.64
3090	363	5	225	5	28275.10	8765.30
3091	422	27	610	8	69917.52	8390.08
3092	33	6	493	5	12494.35	2373.95
3093	359	2	943	8	49868.00	19448.56
3094	172	4	713	4	32131.08	8354.08
3095	318	33	306	8	57766.48	22528.96
3096	326	37	226	5	22376.15	2908.90
3097	14	45	943	5	31167.50	12155.35
3098	788	43	845	4	35527.28	7460.72
3099	678	28	606	8	73837.76	28058.32
3100	260	16	651	8	54258.32	16277.52
3101	137	27	180	2	7114.00	2845.60
3102	760	36	196	10	26144.70	8366.30
3103	724	6	557	8	21109.20	5910.56
3104	810	10	154	6	34581.00	6224.58
3105	149	10	545	9	5191.83	1869.03
3106	436	42	416	8	16643.44	6324.48
3107	536	2	101	8	67971.60	18352.32
3108	455	33	698	8	26292.32	2892.16
3109	306	8	23	8	45381.12	12252.88
3110	807	38	673	3	15756.30	4569.33
3111	732	22	351	10	2086.90	208.70
3112	229	36	923	9	29308.50	7327.08
3113	574	42	8	9	30191.22	8151.66
3114	835	19	714	4	34923.72	13271.00
3115	540	47	290	6	53260.68	11717.34
3116	390	16	854	6	24994.68	8748.12
3117	80	36	532	10	89569.70	10748.40
3118	77	38	629	4	22355.12	3576.80
3119	598	1	721	8	79737.92	19137.12
3120	165	13	363	4	31102.48	3732.28
3121	485	41	156	7	8013.32	1362.27
3122	339	5	361	3	11764.08	2117.52
3123	196	19	655	2	13834.08	2490.14
3124	439	12	513	8	56202.00	14612.56
3125	287	33	565	9	16727.22	5854.50
3126	284	31	985	9	67783.14	6778.35
3127	99	46	252	7	54047.56	6485.71
3128	490	13	774	10	87149.50	16558.40
3129	445	50	442	1	5959.16	1370.61
3130	10	5	890	6	8270.40	1654.08
3131	644	22	58	10	95592.80	19118.60
3132	502	44	373	7	57114.12	6853.70
3133	657	40	153	4	2046.68	798.20
3134	437	41	690	10	52585.30	10517.10
3135	258	2	401	10	11626.10	2325.20
3136	676	11	357	6	56439.12	17496.12
3137	261	42	387	10	54015.30	16744.70
3138	178	39	387	1	5401.53	1674.47
3139	677	12	534	5	44930.40	7638.15
3140	437	40	241	6	35144.64	8083.26
3141	277	29	542	10	94365.20	13211.10
3142	437	12	675	5	2325.55	837.20
3143	621	9	205	9	2069.37	455.22
3144	173	10	792	1	3591.28	1077.38
3145	696	42	846	3	20041.95	5812.17
3146	642	46	691	2	16936.14	5419.56
3147	180	27	337	6	41607.36	6241.08
3148	65	23	521	3	25408.32	9909.24
3149	256	25	35	4	11790.16	3183.36
3150	205	42	232	9	89741.88	18845.82
3151	607	4	961	8	71015.20	14913.20
3152	823	4	585	1	5374.08	591.15
3153	86	3	451	3	22448.85	4265.28
3154	529	46	781	5	17061.00	2217.95
3155	805	14	449	1	8694.12	1304.12
3156	836	36	282	9	25894.44	10098.81
3157	396	13	520	7	3782.87	1437.52
3158	618	24	568	4	34215.60	10606.84
3159	206	18	253	8	6776.88	1626.48
3160	805	20	48	9	36010.26	14043.96
3161	506	2	294	2	11781.16	2120.60
3162	863	43	496	7	2702.84	783.79
3163	386	47	524	10	66991.00	15407.90
3164	252	33	539	1	4267.53	896.18
3165	47	21	548	6	35724.60	11431.86
3166	49	19	907	9	451.26	54.18
3167	437	23	491	1	6999.06	1049.86
3168	49	30	866	3	8860.56	886.05
3169	324	7	312	6	58496.22	17548.86
3170	601	48	743	5	22338.45	7148.30
3171	142	48	672	7	51474.99	9780.26
3172	328	28	495	2	11317.16	3508.32
3173	8	7	765	8	236.88	52.08
3174	189	14	80	4	19238.72	7503.12
3175	113	9	400	10	53694.70	15571.50
3176	18	40	5	3	26182.08	9163.74
3177	277	29	205	7	1609.51	354.06
3178	3	2	914	6	31997.70	12479.10
3179	430	19	480	3	16543.35	2812.38
3180	725	10	397	8	43693.44	4806.24
3181	102	27	460	4	13306.16	3725.72
3182	529	46	854	3	12497.34	4374.06
3183	171	13	837	6	56028.12	16808.46
3184	353	25	575	10	55594.90	21126.10
3185	859	33	747	6	829.56	132.72
3186	230	35	608	9	46714.41	6072.84
3187	147	12	555	1	2571.31	411.41
3188	446	20	827	9	16386.93	2785.77
3189	806	15	157	4	5735.12	1491.12
3190	392	5	928	5	30418.50	10038.10
3191	851	22	920	4	1559.40	514.60
3192	339	34	729	9	49671.18	17384.94
3193	159	1	800	7	68593.49	12346.81
3194	240	29	452	3	7008.18	2102.46
3195	242	48	649	3	26020.50	9627.57
3196	413	42	266	8	52851.44	18498.00
3197	845	25	514	2	994.98	129.34
3198	418	29	554	9	36110.97	11916.63
3199	74	18	652	2	8482.96	3393.18
3200	431	44	589	3	16501.74	6600.69
3201	870	50	252	10	77210.80	9265.30
3202	811	2	348	9	6028.20	2350.98
3203	459	21	832	6	33477.12	6360.66
3204	752	11	313	3	28083.99	10391.07
3205	54	9	225	10	56550.20	17530.60
3206	81	48	930	8	74705.92	19423.52
3207	486	5	492	8	16414.80	3775.44
3208	732	10	559	8	49147.68	13761.36
3209	563	29	997	8	36611.36	5491.68
3210	75	16	393	3	14421.81	5191.86
3211	6	17	922	7	64303.12	14146.72
3212	662	41	915	1	2487.52	522.38
3213	867	13	240	1	1651.04	214.64
3214	670	22	268	8	55041.52	5504.16
3215	500	26	52	2	9273.92	927.40
3216	277	29	230	10	61117.90	7945.30
3217	260	19	714	5	43654.65	16588.75
3218	209	45	248	2	5645.04	1524.16
3219	737	44	123	10	21624.40	3676.10
3220	635	30	700	5	25385.70	7615.70
3221	86	44	713	2	16065.54	4177.04
3222	520	10	918	1	2943.08	853.49
3223	859	25	249	3	24499.05	3184.89
3224	20	23	990	3	22480.53	4720.92
3225	430	19	940	10	63872.30	8303.40
3226	171	13	557	5	13193.25	3694.10
3227	517	9	986	6	45797.28	15113.10
3228	844	20	953	2	15171.24	1820.54
3229	427	41	629	5	27943.90	4471.00
3230	793	1	671	5	12869.90	1930.50
3231	783	17	891	9	69972.21	11195.55
3232	503	39	985	7	52720.22	5272.05
3233	384	13	572	8	49682.32	13911.04
3234	520	37	684	1	8229.53	1563.61
3235	114	36	550	3	13998.09	1679.76
3236	517	9	664	9	10561.86	1161.81
3237	31	11	173	4	25649.72	9233.88
3238	617	5	387	8	43212.24	13395.76
3239	435	18	594	4	29074.96	9594.72
3240	274	49	700	8	40617.12	12185.12
3241	496	13	529	9	32307.93	10984.68
3242	855	23	53	1	9774.99	1075.25
3243	546	25	977	5	42564.20	9364.10
3244	236	23	214	6	3288.12	624.72
3245	796	21	211	5	8703.75	2959.30
3246	534	14	949	7	47250.84	15592.78
3247	649	26	970	5	1090.80	327.25
3248	780	29	90	7	39583.60	9500.05
3249	396	13	288	3	2981.82	954.18
3250	347	45	208	9	68171.22	22496.49
3251	790	47	71	5	19161.30	4023.85
3252	734	34	644	9	7701.12	2618.37
3253	737	44	967	1	9637.22	3373.03
3254	410	12	643	2	14360.90	3303.00
3255	824	50	879	2	9806.70	2451.68
3256	493	3	763	10	37873.90	10983.40
3257	207	22	280	2	16267.54	6507.02
3258	781	17	931	8	21498.16	3439.68
3259	372	14	715	2	14782.68	1626.10
3260	325	44	616	1	1055.19	422.08
3261	324	26	995	3	28873.74	7795.92
3262	492	6	645	2	391.68	137.08
3263	489	10	259	8	66346.32	6634.64
3264	560	40	313	4	37445.32	13854.76
3265	780	49	232	5	49856.60	10469.90
3266	643	42	143	9	36847.44	14002.02
3267	655	18	520	3	1621.23	616.08
3268	41	25	447	5	10302.05	3296.65
3269	447	10	991	1	3248.32	519.73
3270	203	8	712	6	24527.76	4660.26
3271	555	30	354	2	12172.76	1217.28
3272	574	37	420	4	19758.80	5927.64
3273	256	40	930	10	93382.40	24279.40
3274	137	26	111	1	9307.15	1768.36
3275	686	7	547	3	22273.08	2895.51
3276	556	42	502	1	5983.79	1256.60
3277	464	33	406	4	13189.20	4220.56
3278	397	29	478	2	15697.72	2040.70
3279	411	26	886	10	12476.20	4741.00
3280	77	38	779	10	69693.70	21605.00
3281	85	46	494	6	17483.22	2972.16
3282	288	48	4	1	6871.63	1786.62
3283	144	24	786	9	39015.27	14825.79
3284	74	40	121	9	61782.03	6795.99
3285	112	6	449	2	17388.24	2608.24
3286	720	10	390	6	9824.82	1572.00
3287	385	29	425	7	19640.67	3338.93
3288	332	37	650	2	16672.12	6168.68
3289	527	19	383	7	54933.76	11536.07
3290	864	26	114	7	66395.42	18590.74
3291	323	26	973	4	13744.08	5085.32
3292	863	43	312	3	29248.11	8774.43
3293	242	50	318	9	33231.60	6646.32
3294	846	19	632	3	773.31	162.39
3295	161	28	866	1	2953.52	295.35
3296	292	43	70	2	4538.56	816.94
3297	243	33	570	10	21236.20	7220.30
3298	47	26	434	1	8431.11	1601.91
3299	266	12	609	6	54558.54	6547.02
3300	244	19	242	10	99971.70	32990.70
3301	215	16	919	6	54595.86	7643.40
3302	525	3	226	1	4475.23	581.78
3303	696	13	67	10	69965.60	11194.50
3304	659	6	677	1	2265.84	861.02
3305	141	30	124	3	14243.82	4273.14
3306	591	26	189	8	9775.84	1955.20
3307	424	3	307	8	31075.84	12119.60
3308	721	19	61	8	14002.24	5460.88
3309	626	26	774	2	17429.90	3311.68
3310	196	19	950	8	46128.88	13377.36
3311	565	1	537	7	48596.24	13606.95
3312	212	41	913	2	6542.00	1242.98
3313	122	44	678	9	29829.51	11036.88
3314	665	40	293	2	9869.96	1974.00
3315	3	40	863	5	15956.50	6063.45
3316	198	38	15	3	15842.94	3643.89
3317	196	19	436	10	68403.00	17100.70
3318	589	4	222	6	51831.24	5183.10
3319	117	48	161	9	68478.12	23967.36
3320	570	15	860	8	75124.08	22537.20
3321	17	10	247	4	25072.00	3510.08
3322	752	5	744	6	5152.50	1185.06
3323	672	50	5	2	17454.72	6109.16
3324	320	29	711	10	33870.50	5080.60
3325	475	3	387	9	48613.77	15070.23
3326	131	32	423	3	26867.49	4836.15
3327	173	10	597	2	15654.40	4383.24
3328	743	7	90	10	56548.00	13571.50
3329	109	37	774	5	43574.75	8279.20
3330	299	2	64	7	17249.54	5864.81
3331	721	19	628	5	20141.05	4833.85
3332	33	22	45	10	88544.70	12396.30
3333	440	39	47	6	24885.78	9954.30
3334	639	22	689	6	27240.18	8716.86
3335	475	30	326	7	53992.75	9718.73
3336	639	22	890	6	8270.40	1654.08
3337	631	2	168	9	5915.43	650.70
3338	812	16	775	5	1029.80	133.85
3339	328	28	310	1	1310.64	131.06
3340	64	23	679	4	39105.76	14469.12
3341	686	8	40	9	40051.08	8811.27
3342	340	11	146	7	22898.68	2747.85
3343	608	40	674	1	6616.00	2381.76
3344	302	20	102	8	38798.32	6207.76
3345	139	19	275	8	58411.36	18691.60
3346	805	20	671	4	10295.92	1544.40
3347	51	16	495	5	28292.90	8770.80
3348	295	47	782	8	11357.20	1476.40
3349	854	38	88	10	17506.10	5076.80
3350	628	23	422	8	44011.84	7482.00
3351	82	4	46	2	19840.66	4364.94
3352	530	7	105	1	3531.27	1094.69
3353	551	2	835	3	7362.72	1914.30
3354	732	22	799	6	35160.30	9844.86
3355	31	2	945	9	71986.41	12957.57
3356	728	10	776	6	32825.82	8862.96
3357	644	22	894	4	21398.48	6205.56
3358	464	15	116	8	17934.32	3586.88
3359	734	20	899	3	18379.56	4778.70
3360	192	42	856	10	16693.50	4006.40
3361	485	15	402	4	15531.88	2329.80
3362	606	7	554	7	28086.31	9268.49
3363	592	39	853	1	6966.29	1880.90
3364	840	38	639	5	43265.65	14710.30
3365	8	15	654	5	41568.85	10807.90
3366	514	32	932	8	25606.24	2560.64
3367	358	45	904	4	37856.20	6814.12
3368	747	1	843	6	54969.96	12093.42
3369	388	15	896	9	8203.59	1640.70
3370	184	15	407	5	22188.00	7765.80
3371	3	2	723	1	5300.41	1060.08
3372	754	5	954	8	63555.20	22244.32
3373	245	13	241	10	58574.40	13472.10
3374	125	48	681	4	20489.40	2868.52
3375	877	4	507	6	43916.22	12296.52
3376	548	23	151	7	25547.41	4854.01
3377	47	21	25	5	30097.05	10834.95
3378	382	21	28	2	15420.02	2929.80
3379	51	36	217	2	9387.26	3191.66
3380	85	46	690	2	10517.06	2103.42
3381	768	44	10	3	8478.75	3221.91
3382	443	30	308	8	10232.48	4092.96
3383	367	22	355	8	76563.04	10718.80
3384	868	8	235	10	57146.50	12572.20
3385	151	25	749	10	16834.80	4545.40
3386	455	41	338	5	15552.95	6221.20
3387	734	20	963	5	31880.55	6057.30
3388	42	25	184	5	8938.80	3486.15
3389	830	34	35	5	14737.70	3979.20
3390	352	10	50	6	11868.54	3085.80
3391	416	39	302	10	65224.40	26089.80
3392	655	17	150	5	41542.10	12462.65
3393	769	36	392	5	32654.25	11755.55
3394	877	37	310	3	3931.92	393.18
3395	208	20	767	2	12908.28	4388.82
3396	534	32	209	1	1634.10	588.28
3397	867	25	715	3	22174.02	2439.15
3398	578	11	678	4	13257.56	4905.28
3399	390	33	646	5	29149.35	8453.30
3400	529	46	948	7	48232.31	16398.97
3401	440	12	883	8	20142.24	6848.40
3402	617	5	961	9	79892.10	16777.35
3403	699	6	366	8	1702.96	170.32
3404	868	8	524	9	60291.90	13867.11
3405	64	23	150	3	24925.26	7477.59
3406	600	29	83	6	47177.22	16512.00
3407	617	5	266	1	6606.43	2312.25
3408	622	30	374	10	16559.20	3477.40
3409	423	6	917	7	6368.04	700.49
3410	327	23	302	4	26089.76	10435.92
3411	53	33	661	7	9468.90	3219.44
3412	588	37	489	3	21028.11	4836.48
3413	807	38	817	6	25548.84	8175.60
3414	427	30	302	4	26089.76	10435.92
3415	833	22	262	10	75607.60	22682.30
3416	547	10	796	5	33742.10	5736.15
3417	316	12	990	3	22480.53	4720.92
3418	159	1	608	2	10380.98	1349.52
3419	256	25	979	9	80183.79	26460.63
3420	742	42	197	7	37818.97	9454.76
3421	350	34	624	1	9482.40	1137.89
3422	853	22	295	1	4607.56	783.29
3423	672	50	813	9	58271.94	13985.28
3424	206	14	552	7	34006.98	12922.63
3425	627	27	848	6	26621.10	6389.04
3426	333	11	7	7	32858.77	4928.84
3427	454	7	387	5	27007.65	8372.35
3428	644	22	490	7	33606.79	4704.98
3429	755	25	99	9	42521.94	17008.74
3430	91	24	487	6	39950.40	11985.12
3431	705	30	984	10	56596.60	7357.60
3432	5	50	981	9	15939.54	3825.45
3433	456	38	187	9	13493.34	1484.28
3434	555	30	243	2	2099.80	608.94
3435	376	34	474	7	35081.55	5613.02
3436	340	29	945	6	47990.94	8638.38
3437	206	21	951	5	14219.35	4265.80
3438	479	40	662	10	25370.80	5074.20
3439	47	22	842	7	27533.59	6332.76
3440	35	39	777	10	97603.00	21472.70
3441	182	21	233	10	45391.10	15886.90
3442	802	46	563	10	77655.40	10095.20
3443	704	20	507	7	51235.59	14345.94
3444	641	13	628	8	32225.68	7734.16
3445	383	23	344	2	2075.34	373.56
3446	292	43	711	7	23709.35	3556.42
3447	323	2	591	2	1191.84	131.10
3448	173	10	105	4	14125.08	4378.76
3449	148	18	541	1	7770.80	3030.61
3450	435	18	598	9	19841.49	5158.80
3451	266	12	364	7	43847.23	11400.27
3452	346	15	283	3	28797.39	5183.52
3453	191	45	531	1	6070.56	1396.23
3454	98	38	143	2	8188.32	3111.56
3455	344	1	647	3	20934.81	2302.83
3456	80	33	814	10	85643.00	29975.00
3457	877	4	362	3	28264.35	8479.29
3458	75	16	939	8	17484.72	6993.92
3459	137	40	750	1	367.39	117.56
3460	443	22	148	7	11520.18	3456.04
3461	810	1	834	5	16773.45	6709.40
3462	332	7	1	5	28684.70	9465.95
3463	437	45	912	7	34685.91	4162.34
3464	237	2	513	2	14050.50	3653.14
3465	456	11	160	6	3145.92	1006.68
3466	722	33	307	1	3884.48	1514.95
3467	627	41	175	6	59449.26	10106.40
3468	430	26	458	2	14103.46	4090.00
3469	762	42	902	9	8225.37	1809.54
3470	776	37	400	3	16108.41	4671.45
3471	277	29	201	2	8085.40	1455.38
3472	240	1	171	6	55045.14	18715.32
3473	787	25	411	7	45989.65	9657.83
3474	316	27	770	6	48687.06	10711.14
3475	231	50	22	2	5599.96	560.00
3476	681	29	509	3	21418.47	6639.72
3477	574	42	931	7	18810.89	3009.72
3478	207	35	275	5	36507.10	11682.25
3479	680	14	31	2	8425.62	2696.20
3480	60	28	648	1	6781.33	1830.96
3481	237	2	669	2	6516.68	1498.84
3482	646	17	885	9	8415.90	3198.06
3483	490	47	545	9	5191.83	1869.03
3484	181	29	938	6	19706.64	5714.94
3485	802	32	251	10	56983.30	17664.80
3486	445	11	288	3	2981.82	954.18
3487	567	45	530	6	24072.78	3851.64
3488	719	4	494	1	2913.87	495.36
3489	802	46	790	6	25406.52	8130.06
3490	391	47	862	8	47624.64	11429.92
3491	87	17	429	8	38024.16	8365.28
3492	506	2	104	8	49239.76	19203.52
3493	86	49	729	4	22076.08	7726.64
3494	724	6	137	9	57476.88	18392.58
3495	339	46	786	10	43350.30	16473.10
3496	642	30	367	9	1451.43	377.37
3497	482	39	119	10	17138.20	4455.90
3498	564	50	304	6	50161.74	8025.90
3499	473	25	731	9	49561.56	7434.27
3500	480	49	461	7	48997.69	5389.72
3501	445	11	637	10	34189.50	13333.90
3502	485	35	833	5	19854.95	6155.05
3503	425	18	562	5	17282.75	3975.05
3504	753	25	88	1	1750.61	507.68
3505	143	38	222	2	17277.08	1727.70
3506	53	35	401	10	11626.10	2325.20
3507	398	4	229	1	2773.13	721.01
3508	648	29	265	6	8008.68	1281.36
3509	92	27	251	5	28491.65	8832.40
3510	205	36	969	2	4897.52	587.70
3511	679	42	606	8	73837.76	28058.32
3512	287	36	172	2	218.12	76.34
3513	355	47	846	4	26722.60	7749.56
3514	425	21	679	9	87987.96	32555.52
3515	625	34	140	4	30207.52	9968.48
3516	455	41	529	5	17948.85	6102.60
3517	581	42	738	10	23167.70	5096.90
3518	522	13	380	8	20979.04	4825.20
3519	810	1	485	6	42265.32	13102.26
3520	691	43	937	5	2429.95	315.90
3521	838	41	44	3	19243.56	4041.15
3522	613	27	923	7	22795.50	5698.84
3523	420	24	935	9	27569.52	4411.08
3524	295	47	867	3	13276.50	4646.76
3525	285	22	341	5	45288.95	10416.45
3526	439	28	533	5	16381.65	6225.05
3527	431	14	298	8	57548.08	8056.72
3528	612	47	505	2	5195.48	1091.06
3529	521	13	770	5	40572.55	8925.95
3530	778	19	626	4	18453.72	6458.80
3531	416	39	264	8	72519.60	10152.72
3532	462	36	456	10	53914.60	5391.50
3533	391	49	757	9	9774.99	1661.76
3534	375	4	124	4	18991.76	5697.52
3535	511	34	55	5	43230.00	5187.60
3536	84	39	136	6	32519.58	7479.48
3537	477	37	755	10	84790.70	16110.20
3538	326	24	447	4	8241.64	2637.32
3539	785	34	565	4	7434.32	2602.00
3540	143	38	367	3	483.81	125.79
3541	428	35	85	4	14258.68	3992.44
3542	317	30	231	1	7119.55	1708.69
3543	521	13	693	5	23853.80	8587.35
3544	562	40	753	2	10158.74	2641.28
3545	228	7	984	1	5659.66	735.76
3546	598	35	613	10	62582.40	8761.50
3547	230	36	350	3	21098.61	8228.46
3548	237	13	46	7	69442.31	15277.29
3549	866	2	91	1	9943.87	2287.09
3550	280	49	348	1	669.80	261.22
3551	82	10	825	7	7857.78	2278.78
3552	138	46	384	1	9835.90	1081.95
3553	631	2	527	6	22501.68	5175.36
3554	414	23	986	6	45797.28	15113.10
3555	86	19	28	8	61680.08	11719.20
3556	311	49	972	8	19535.60	6642.08
3557	874	5	4	4	27486.52	7146.48
3558	455	11	22	5	13999.90	1400.00
3559	878	2	227	5	37055.25	12228.25
3560	661	38	952	10	201.00	38.20
3561	601	48	754	7	235.27	63.49
3562	768	49	134	2	9669.54	1643.82
3563	846	13	960	3	2421.90	339.06
3564	449	37	166	6	42985.56	16334.52
3565	395	24	461	6	41998.02	4619.76
3566	91	5	650	7	58352.42	21590.38
3567	548	23	510	6	33320.58	4331.70
3568	426	16	760	10	38469.00	11925.40
3569	381	6	836	6	43254.18	9515.94
3570	97	1	6	5	28227.10	7621.30
3571	640	45	27	6	27535.14	9361.92
3572	152	32	392	4	26123.40	9404.44
3573	734	34	14	7	53777.36	12906.60
3574	594	46	9	6	43978.56	13633.38
3575	257	50	550	2	9332.06	1119.84
3576	701	38	756	8	31686.40	10456.48
3577	198	26	457	5	8301.20	2573.35
3578	331	6	803	10	56402.90	7896.40
3579	621	39	461	5	34998.35	3849.80
3580	20	23	331	5	10731.30	3755.95
3581	280	49	595	7	57645.77	10376.24
3582	600	42	424	1	6256.31	2377.40
3583	655	17	406	2	6594.60	2110.28
3584	456	4	797	9	61423.29	13513.14
3585	47	31	463	6	56553.18	12441.72
3586	685	4	909	9	44149.50	11037.42
3587	20	23	418	8	12363.68	2101.84
3588	838	48	226	7	31326.61	4072.46
3589	465	24	693	8	38166.08	13739.76
3590	56	3	926	1	5303.56	1485.00
3591	483	15	186	3	9731.28	1848.93
3592	111	11	899	6	36759.12	9557.40
3593	701	38	192	2	6110.58	1649.86
3594	98	38	544	7	62862.59	15087.03
3595	675	33	965	1	6748.02	1484.56
3596	136	35	875	2	18403.26	4416.78
3597	873	26	438	6	40213.32	9249.06
3598	245	10	459	2	1194.18	417.96
3599	485	33	671	5	12869.90	1930.50
3600	492	6	853	1	6966.29	1880.90
3601	320	29	277	9	79582.86	8754.12
3602	292	43	887	10	78393.40	25869.80
3603	622	30	817	9	38323.26	12263.40
3604	212	41	791	4	11053.88	1989.68
3605	865	17	75	5	19940.35	1994.05
3606	844	20	899	3	18379.56	4778.70
3607	113	43	943	4	24934.00	9724.28
3608	410	15	627	6	35192.52	5278.86
3609	344	30	536	10	70704.10	19090.10
3610	621	9	572	9	55892.61	15649.92
3611	27	23	614	4	39161.12	9398.68
3612	80	33	500	2	11565.96	2313.20
3613	285	34	279	4	14322.20	3294.12
3614	18	9	363	5	38878.10	4665.35
3615	506	2	44	4	25658.08	5388.20
3616	447	42	473	6	49908.78	10979.94
3617	795	18	942	7	12534.97	1880.27
3618	482	19	38	8	39144.16	10568.96
3619	94	16	220	8	37794.48	7936.88
3620	173	10	337	8	55476.48	8321.44
3621	599	41	478	10	78488.60	10203.50
3622	332	37	742	4	29300.72	9962.24
3623	454	7	723	6	31802.46	6360.48
3624	109	37	633	5	34419.35	13079.35
3625	713	17	676	8	3720.80	1116.24
3626	473	25	260	6	2936.82	558.00
3627	511	34	197	3	16208.13	4052.04
3628	490	47	919	7	63695.17	8917.30
3629	683	6	921	3	13230.30	4630.59
3630	6	38	662	7	17759.56	3551.94
3631	367	22	368	3	12771.15	3959.07
3632	770	38	990	8	59948.08	12589.12
3633	726	3	766	10	15338.20	4448.10
3634	512	9	985	3	22594.38	2259.45
3635	163	4	482	6	20165.04	4436.28
3636	678	27	708	6	38136.42	11059.56
3637	346	15	276	4	38465.20	13847.48
3638	147	12	28	7	53970.07	10254.30
3639	414	38	208	3	22723.74	7498.83
3640	311	49	860	4	37562.04	11268.60
3641	649	47	621	1	4354.36	1480.48
3642	807	40	959	6	41397.66	9935.46
3643	419	2	143	2	8188.32	3111.56
3644	19	39	533	6	19657.98	7470.06
3645	436	27	216	7	34998.67	9799.65
3646	447	10	747	9	1244.34	199.08
3647	672	33	288	5	4969.70	1590.30
3648	625	5	634	6	41548.26	10387.08
3649	638	47	515	3	26493.00	7682.97
3650	367	22	295	9	41468.04	7049.61
3651	144	24	160	2	1048.64	335.56
3652	520	6	878	5	30766.55	3999.65
3653	367	22	498	1	7082.03	2620.35
3654	8	7	591	7	4171.44	458.85
3655	317	35	479	6	3863.04	463.56
3656	543	41	20	5	13467.95	2693.60
3657	705	21	381	6	7011.06	2033.22
3658	487	44	127	8	47711.12	18130.24
3659	854	38	414	2	16607.72	4650.16
3660	806	15	405	7	38468.08	11925.13
3661	603	36	235	3	17143.95	3771.66
3662	435	16	772	10	49155.10	13763.40
3663	198	26	810	1	4182.56	1589.37
3664	607	4	624	3	28447.20	3413.67
3665	408	18	827	7	12745.39	2166.71
3666	624	18	162	2	17907.44	3223.34
3667	69	10	941	7	58423.89	19279.89
3668	101	17	542	1	9436.52	1321.11
3669	808	41	786	1	4335.03	1647.31
3670	861	38	798	5	35486.15	13484.75
3671	601	48	725	5	28165.45	3098.20
3672	674	49	702	5	44163.15	12365.70
3673	823	12	889	3	13239.81	3045.15
3674	500	49	444	1	9855.68	3153.82
3675	240	1	543	6	23960.88	6709.02
3676	466	1	650	6	50016.36	18506.04
3677	218	9	348	6	4018.80	1567.32
3678	306	8	592	3	29453.97	5596.26
3679	20	38	224	4	30137.68	3616.52
3680	91	37	88	6	10503.66	3046.08
3681	280	49	105	4	14125.08	4378.76
3682	585	7	704	7	61786.90	22861.16
3683	152	34	604	5	14717.95	2796.40
3684	245	29	183	10	4335.00	1127.10
3685	827	20	636	8	445.28	71.28
3686	788	43	310	2	2621.28	262.12
3687	342	11	630	4	5700.52	1653.16
3688	235	49	5	9	78546.24	27491.22
3689	670	15	30	1	6544.04	981.61
3690	570	6	721	7	69770.68	16744.98
3691	272	19	803	3	16920.87	2368.92
3692	823	48	495	9	50927.22	15787.44
3693	747	26	915	10	24875.20	5223.80
3694	345	50	317	1	3993.24	1517.43
3695	528	28	71	9	34490.34	7242.93
3696	407	45	275	6	43808.52	14018.70
3697	261	42	442	2	11918.32	2741.22
3698	591	44	1000	1	2223.53	711.53
3699	228	37	598	8	17636.88	4585.60
3700	402	28	899	4	24506.08	6371.60
3701	826	39	354	10	60863.80	6086.40
3702	305	48	724	8	74241.04	20787.52
3703	323	26	739	5	37748.20	9059.55
3704	386	25	19	2	19688.62	2559.52
3705	198	33	851	8	34435.28	4820.96
3706	534	32	283	4	38396.52	6911.36
3707	736	34	375	4	29355.00	11742.00
3708	448	9	509	10	71394.90	22132.40
3709	82	10	143	8	32753.28	12446.24
3710	704	24	286	2	9408.08	2728.34
3711	694	25	424	5	31281.55	11887.00
3712	320	29	666	4	12557.80	3516.20
3713	15	2	450	9	75655.17	19670.31
3714	811	2	220	2	9448.62	1984.22
3715	656	39	118	1	2336.54	630.87
3716	667	28	391	6	3401.40	578.22
3717	700	25	398	10	27664.40	6086.20
3718	268	49	605	2	11094.36	4326.80
3719	391	47	473	7	58226.91	12809.93
3720	161	21	487	5	33292.00	9987.60
3721	536	21	298	3	21580.53	3021.27
3722	762	4	71	2	7664.52	1609.54
3723	391	32	811	10	98117.70	39247.10
3724	301	9	500	3	17348.94	3469.80
3725	69	31	566	8	26042.80	7812.88
3726	859	9	184	3	5363.28	2091.69
3727	466	1	517	9	62606.25	15651.54
3728	389	40	895	6	31664.58	12032.52
3729	437	40	651	4	27129.16	8138.76
3730	253	25	303	5	46235.10	15719.95
3731	670	15	861	4	2121.76	700.20
3732	69	8	139	8	72379.84	15199.76
3733	473	25	204	7	20352.36	6512.73
3734	112	18	113	4	4705.92	1129.44
3735	530	21	148	2	3291.48	987.44
3736	529	2	173	1	6412.43	2308.47
3737	422	27	156	6	6868.56	1167.66
3738	308	4	239	9	18371.07	5695.02
3739	402	14	674	3	19848.00	7145.28
3740	409	40	93	3	15053.82	4817.22
3741	389	40	527	3	11250.84	2587.68
3742	629	43	492	4	8207.40	1887.72
3743	67	20	51	10	54805.70	7124.70
3744	240	29	277	10	88425.40	9726.80
3745	850	44	443	10	27033.30	6488.00
3746	615	50	116	9	20176.11	4035.24
3747	841	4	9	8	58638.08	18177.84
3748	58	48	857	5	17202.35	1720.25
3749	215	16	308	5	6395.30	2558.10
3750	565	43	647	9	62804.43	6908.49
3751	567	24	103	2	5456.78	1200.50
3752	475	3	79	5	45312.15	8609.30
3753	315	33	628	4	16112.84	3867.08
3754	557	32	490	6	28805.82	4032.84
3755	525	34	310	6	7863.84	786.36
3756	267	26	374	8	13247.36	2781.92
3757	237	13	199	3	18111.54	3260.07
3758	534	48	617	10	59305.20	22536.00
3759	289	34	110	4	37403.48	6358.60
3760	680	22	556	5	31113.00	5600.35
3761	287	11	245	1	8009.90	2322.87
3762	375	48	151	8	29197.04	5547.44
3763	650	9	154	10	57635.00	10374.30
3764	406	21	576	9	8978.58	2873.16
3765	83	16	469	2	72.78	21.84
3766	410	10	892	1	3448.85	931.19
3767	810	6	825	7	7857.78	2278.78
3768	298	34	479	9	5794.56	695.34
3769	332	7	117	4	14467.64	5787.04
3770	740	34	758	1	4772.19	1861.15
3771	810	1	796	4	26993.68	4588.92
3772	664	9	496	4	1544.48	447.88
3773	802	46	307	5	19422.40	7574.75
3774	206	18	371	5	20596.40	5355.05
3775	680	14	707	7	19796.07	3167.36
3776	840	38	596	10	42470.60	6370.60
3777	794	32	992	10	8104.10	2431.20
3778	602	14	724	10	92801.30	25984.40
3779	760	16	616	7	7386.33	2954.56
3780	802	46	825	9	10102.86	2929.86
3781	132	45	442	7	41714.12	9594.27
3782	858	16	939	4	8742.36	3496.96
3783	420	7	937	10	4859.90	631.80
3784	349	15	717	2	19684.46	3543.20
3785	547	10	198	2	15041.82	3158.78
3786	82	48	415	1	6525.51	783.06
3787	820	24	488	7	67383.75	7412.23
3788	306	18	11	1	2446.98	978.79
3789	662	50	115	1	4490.73	943.05
3790	174	8	138	1	4398.03	483.78
3791	306	18	377	10	20982.80	5245.70
3792	573	30	591	2	1191.84	131.10
3793	447	42	335	9	40965.93	4915.89
3794	324	26	729	6	33114.12	11589.96
3795	567	24	731	7	38547.88	5782.21
3796	285	34	484	10	90460.40	23519.70
3797	110	23	266	9	59457.87	20810.25
3798	331	23	558	5	49737.60	16910.80
3799	465	40	227	10	74110.50	24456.50
3800	289	34	864	2	15463.80	3711.32
3801	316	12	664	9	10561.86	1161.81
3802	390	16	184	4	7151.04	2788.92
3803	773	20	833	8	31767.92	9848.08
3804	339	5	431	7	14629.09	3510.99
3805	342	11	490	1	4800.97	672.14
3806	258	9	248	4	11290.08	3048.32
3807	548	23	424	1	6256.31	2377.40
3808	47	31	634	5	34623.55	8655.90
3809	647	8	160	4	2097.28	671.12
3810	73	44	389	3	2882.70	1124.25
3811	439	18	435	4	29376.92	8813.08
3812	198	33	73	1	2355.39	282.65
3813	489	10	592	4	39271.96	7461.68
3814	642	30	705	7	53154.64	9567.81
3815	242	48	233	1	4539.11	1588.69
3816	762	27	42	9	47354.22	15626.88
3817	867	48	541	2	15541.60	6061.22
3818	433	2	382	4	8677.20	1475.12
3819	780	29	86	8	57936.24	6372.96
3820	228	37	773	5	6299.80	1574.95
3821	103	44	627	9	52788.78	7918.29
3822	231	34	727	6	50642.88	19244.28
3823	607	4	468	1	2094.46	251.34
3824	823	12	77	4	27470.72	6318.28
3825	284	31	910	6	17159.52	3431.88
3826	706	6	962	2	14428.96	2885.80
3827	145	18	803	7	39482.03	5527.48
3828	93	22	690	1	5258.53	1051.71
3829	317	30	425	3	8417.43	1430.97
3830	646	17	765	2	59.22	13.02
3831	628	46	286	5	23520.20	6820.85
3832	153	20	473	2	16636.26	3659.98
3833	477	35	638	1	8681.30	3212.08
3834	313	18	142	8	36324.24	9444.32
3835	460	34	461	10	69996.70	7699.60
3836	770	38	995	10	96245.80	25986.40
3837	370	10	513	1	7025.25	1826.57
3838	802	21	297	1	7729.68	1314.05
3839	751	3	894	4	21398.48	6205.56
3840	650	37	593	7	3397.45	1257.06
3841	216	6	839	10	92207.00	10142.80
3842	507	20	496	4	1544.48	447.88
3843	838	41	588	8	13309.04	3460.32
3844	410	12	447	4	8241.64	2637.32
3845	546	9	938	8	26275.52	7619.92
3846	5	50	836	5	36045.15	7929.95
3847	31	2	706	1	8226.90	822.69
3848	218	9	580	8	45391.52	6808.72
3849	402	10	777	5	48801.50	10736.35
3850	112	18	296	4	24555.48	5893.32
3851	113	43	662	3	7611.24	1522.26
3852	502	36	112	5	13058.75	1305.85
3853	165	16	712	6	24527.76	4660.26
3854	232	7	867	4	17702.00	6195.68
3855	789	48	273	1	3632.66	690.21
3856	74	40	444	10	98556.80	31538.20
3857	326	19	276	9	86546.70	31156.83
3858	165	13	26	5	18313.50	1831.35
3859	245	13	376	7	37705.64	10180.52
3860	349	14	415	10	65255.10	7830.60
3861	486	1	500	7	40480.86	8096.20
3862	117	48	750	9	3306.51	1058.04
3863	630	27	881	6	56072.76	22429.08
3864	420	38	693	5	23853.80	8587.35
3865	94	33	390	4	6549.88	1048.00
3866	299	2	681	10	51223.50	7171.30
3867	753	25	432	4	6352.36	1461.04
3868	869	8	307	9	34960.32	13634.55
3869	696	28	544	6	53882.22	12931.74
3870	184	15	36	5	35992.55	10077.90
3871	406	21	483	7	51678.27	8268.54
3872	422	27	533	3	9828.99	3735.03
3873	681	29	730	7	60196.15	6621.58
3874	353	2	247	9	56412.00	7897.68
3875	301	9	5	4	34909.44	12218.32
3876	370	10	542	10	94365.20	13211.10
3877	496	50	216	4	19999.24	5599.80
3878	729	6	392	5	32654.25	11755.55
3879	286	47	120	5	39765.25	9146.00
3880	195	44	320	6	43730.22	10932.54
3881	400	38	18	10	99893.70	17980.90
3882	67	37	59	4	15061.76	4066.68
3883	618	24	986	5	38164.40	12594.25
3884	302	20	354	8	48691.04	4869.12
3885	665	17	110	3	28052.61	4768.95
3886	241	40	224	1	7534.42	904.13
3887	332	37	867	1	4425.50	1548.92
3888	490	47	626	5	23067.15	8073.50
3889	334	11	197	6	32416.26	8104.08
3890	368	22	665	5	4021.85	844.60
3891	671	9	170	4	37130.24	14109.48
3892	383	28	485	6	42265.32	13102.26
3893	383	28	60	8	21588.80	2374.80
3894	138	46	665	6	4826.22	1013.52
3895	540	47	16	5	20029.00	3605.20
3896	377	36	131	8	3787.60	1401.44
3897	388	15	65	1	6543.58	1243.28
3898	106	15	366	9	1915.83	191.61
3899	148	2	223	1	8608.38	860.84
3900	726	13	479	7	4506.88	540.82
3901	720	47	739	1	7549.64	1811.91
3902	86	3	899	10	61265.20	15929.00
3903	525	3	169	6	44613.24	7138.14
3904	701	38	777	5	48801.50	10736.35
3905	47	21	403	8	5550.72	610.56
3906	662	41	579	1	5430.22	1954.88
3907	649	43	182	3	19062.96	5909.52
3908	3	2	595	5	41175.55	7411.60
3909	20	29	980	6	45437.52	9087.48
3910	80	18	370	7	9374.75	1687.49
3911	163	4	598	6	13227.66	3439.20
3912	17	6	361	9	35292.24	6352.56
3913	739	29	442	4	23836.64	5482.44
3914	739	32	482	7	23525.88	5175.66
3915	102	27	586	6	40021.02	5202.72
3916	810	1	439	6	25189.86	3274.68
3917	75	41	139	4	36189.92	7599.88
3918	236	23	905	10	9523.70	2285.70
3919	20	29	10	5	14131.25	5369.85
3920	583	19	235	3	17143.95	3771.66
3921	355	24	944	7	31441.34	8489.18
3922	503	39	443	1	2703.33	648.80
3923	67	4	395	6	45839.58	7334.34
3924	443	22	895	10	52774.30	20054.20
3925	700	25	377	8	16786.24	4196.56
3926	562	40	649	3	26020.50	9627.57
3927	387	12	375	8	58710.00	23484.00
3928	546	3	961	2	17753.80	3728.30
3929	617	38	815	9	59186.79	10061.73
3930	855	38	638	2	17362.60	6424.16
3931	290	19	904	7	66248.35	11924.71
3932	70	23	777	6	58561.80	12883.62
3933	851	22	825	5	5612.70	1627.70
3934	565	43	391	9	5102.10	867.33
3935	573	19	904	7	66248.35	11924.71
3936	745	20	796	10	67484.20	11472.30
3937	732	10	687	6	11485.14	2986.14
3938	605	1	591	5	2979.60	327.75
3939	389	6	569	3	12437.40	2611.86
3940	183	9	285	5	14730.60	2209.60
3941	498	25	796	9	60735.78	10325.07
3942	209	45	554	1	4012.33	1324.07
3943	709	34	491	5	34995.30	5249.30
3944	232	34	906	5	39517.80	11855.35
3945	172	4	301	8	21271.12	4466.96
3946	540	17	810	8	33460.48	12714.96
3947	736	14	578	1	2238.48	268.62
3948	209	35	25	6	36116.46	13001.94
3949	122	44	156	5	5723.80	973.05
3950	832	44	713	5	40163.85	10442.60
3951	650	39	123	6	12974.64	2205.66
3952	755	25	258	5	46258.05	18040.65
3953	309	30	944	3	13474.86	3638.22
3954	287	33	329	1	8791.69	2725.42
3955	730	9	719	2	7110.50	1706.52
3956	12	29	386	1	7612.37	2588.21
3957	570	39	920	2	779.70	257.30
3958	400	39	405	9	49458.96	15332.31
3959	574	23	25	10	60194.10	21669.90
3960	391	29	244	8	49151.68	19169.12
3961	629	43	20	7	18855.13	3771.04
3962	614	37	801	8	19532.16	2734.48
3963	47	26	745	9	73399.77	12477.96
3964	392	25	511	2	3073.44	983.50
3965	460	34	117	6	21701.46	8680.56
3966	649	13	479	1	643.84	77.26
3967	640	4	492	3	6155.55	1415.79
3968	137	27	913	4	13084.00	2485.96
3969	842	39	746	8	36368.88	13456.48
3970	59	43	107	3	25475.73	8152.23
3971	165	47	612	8	69380.56	16651.36
3972	339	5	237	6	46990.62	10807.86
3973	486	1	284	7	11942.70	1433.11
3974	770	34	344	6	6226.02	1120.68
3975	260	19	656	10	10548.80	1160.40
3976	584	33	409	5	31205.75	4368.80
3977	566	42	847	4	9948.52	2785.60
3978	331	22	821	4	28129.84	9564.16
3979	122	5	420	10	49397.00	14819.10
3980	712	25	17	10	19022.60	2092.50
3981	188	12	241	10	58574.40	13472.10
3982	732	22	104	5	30774.85	12002.20
3983	458	19	403	2	1387.68	152.64
3984	686	44	746	10	45461.10	16820.60
3985	604	28	313	3	28083.99	10391.07
3986	71	39	677	1	2265.84	861.02
3987	260	19	404	10	89313.60	25007.80
3988	439	40	67	5	34982.80	5597.25
3989	395	24	108	10	61884.20	8663.80
3990	333	11	919	3	27297.93	3821.70
3991	283	32	115	10	44907.30	9430.50
3992	171	13	532	2	17913.94	2149.68
3993	417	42	381	1	1168.51	338.87
3994	62	23	198	10	75209.10	15793.90
3995	570	39	978	6	15296.40	2906.34
3996	148	8	289	8	47101.52	9420.32
3997	355	21	888	2	11515.58	3109.20
3998	822	6	696	6	41462.52	11609.52
3999	662	50	466	2	14450.60	4479.68
4000	638	47	303	6	55482.12	18863.94
4001	685	29	17	8	15218.08	1674.00
4002	538	35	628	3	12084.63	2900.31
4003	47	26	534	3	26958.24	4582.89
4004	547	44	121	2	13729.34	1510.22
4005	240	29	388	9	50219.82	13057.11
4006	752	11	540	9	49329.18	4932.90
4007	140	1	610	6	52438.14	6292.56
4008	151	25	226	8	35801.84	4654.24
4009	354	49	448	3	13557.09	3253.71
4010	596	49	53	6	58649.94	6451.50
4011	387	12	553	1	6531.45	2286.01
4012	33	38	152	7	17021.06	2723.35
4013	77	38	547	8	59394.88	7721.36
4014	670	15	916	4	11235.56	1910.04
4015	394	26	275	7	51109.94	16355.15
4016	211	19	492	5	10259.25	2359.65
4017	677	18	237	7	54822.39	12609.17
4018	520	10	417	7	36583.26	11340.84
4019	485	15	675	10	4651.10	1674.40
4020	306	44	377	9	18884.52	4721.13
4021	344	50	498	10	70820.30	26203.50
4022	682	46	15	6	31685.88	7287.78
4023	217	8	917	1	909.72	100.07
4024	824	50	445	10	83936.40	13429.80
4025	662	41	457	10	16602.40	5146.70
4026	368	21	503	1	3731.76	858.30
4027	132	45	399	6	23250.00	5347.50
4028	658	41	313	2	18722.66	6927.38
4029	540	17	376	8	43092.16	11634.88
4030	477	35	444	6	59134.08	18922.92
4031	625	5	638	3	26043.90	9636.24
4032	205	36	808	2	18369.66	4041.32
4033	602	14	712	2	8175.92	1553.42
4034	169	27	229	4	11092.52	2884.04
4035	8	50	801	1	2441.52	341.81
4036	123	46	101	4	33985.80	9176.16
4037	4	12	801	7	17090.64	2392.67
4038	415	42	405	10	54954.40	17035.90
4039	875	34	216	5	24999.05	6999.75
4040	182	32	472	4	25461.08	2546.12
4041	725	50	561	1	1979.78	494.94
4042	736	34	102	1	4849.79	775.97
4043	810	47	813	1	6474.66	1553.92
4044	616	29	211	9	15666.75	5326.74
4045	73	44	787	5	760.15	136.85
4046	27	23	246	6	7482.12	1945.38
4047	255	28	157	4	5735.12	1491.12
4048	42	20	828	7	16123.45	5965.68
4049	242	48	460	2	6653.08	1862.86
4050	832	44	532	9	80612.73	9673.56
4051	91	37	872	1	850.26	110.53
4052	239	32	534	2	17972.16	3055.26
4053	644	22	497	7	36638.00	12456.92
4054	494	30	2	1	2010.12	301.52
4055	445	11	533	8	26210.64	9960.08
4056	256	23	828	5	11516.75	4261.20
4057	606	7	929	8	12514.16	3504.00
4058	253	39	681	2	10244.70	1434.26
4059	770	34	526	8	5895.36	766.40
4060	192	8	845	7	62172.74	13056.26
4061	485	18	961	1	8876.90	1864.15
4062	842	31	971	6	52405.98	6812.76
4063	48	35	453	8	72350.56	18087.68
4064	371	31	708	5	31780.35	9216.30
4065	789	17	505	4	10390.96	2182.12
4066	596	33	524	9	60291.90	13867.11
4067	415	42	437	3	16248.48	5686.98
4068	810	29	982	10	91048.30	35508.80
4069	700	32	218	7	53392.85	6407.17
4070	421	45	361	3	11764.08	2117.52
4071	629	46	925	4	19954.84	3192.76
4072	496	36	533	5	16381.65	6225.05
4073	279	19	627	7	41057.94	6158.67
4074	649	49	714	9	78578.37	29859.75
4075	584	33	825	3	3367.62	976.62
4076	340	34	417	5	26130.90	8100.60
4077	739	33	862	8	47624.64	11429.92
4078	492	6	117	8	28935.28	11574.08
4079	351	17	422	2	11002.96	1870.50
4080	49	47	639	8	69225.04	23536.48
4081	797	27	55	7	60522.00	7262.64
4082	296	13	120	9	71577.45	16462.80
4083	649	45	611	8	55365.20	19377.84
4084	71	39	900	5	7458.45	2759.65
4085	749	43	939	3	6556.77	2622.72
4086	186	17	371	5	20596.40	5355.05
4087	534	48	597	2	15654.40	4383.24
4088	273	6	74	2	710.10	163.32
4089	110	39	451	6	44897.70	8530.56
4090	865	17	329	3	26375.07	8176.26
4091	726	4	717	3	29526.69	5314.80
4092	261	42	873	6	18663.24	3546.00
4093	490	13	572	1	6210.29	1738.88
4094	673	10	484	8	72368.32	18815.76
4095	649	49	754	8	268.88	72.56
4096	371	13	824	7	56492.87	18642.68
4097	501	34	836	10	72090.30	15859.90
4098	477	35	338	6	18663.54	7465.44
4099	364	8	151	8	29197.04	5547.44
4100	316	27	140	8	60415.04	19936.96
4101	377	3	502	3	17951.37	3769.80
4102	191	45	95	3	14405.34	3745.38
4103	96	1	854	4	16663.12	5832.08
4104	801	34	291	9	21627.99	7569.81
4105	363	2	872	10	8502.60	1105.30
4106	98	29	794	8	37761.12	4908.96
4107	283	34	748	2	7490.72	1198.52
4108	131	11	249	5	40831.75	5308.15
4109	398	24	206	5	40312.20	6449.95
4110	340	11	799	5	29300.25	8204.05
4111	728	10	903	4	31071.60	9632.20
4112	768	44	683	7	3330.81	1099.14
4113	777	50	140	7	52863.16	17444.84
4114	662	50	19	4	39377.24	5119.04
4115	192	8	392	10	65308.50	23511.10
4116	80	18	17	5	9511.30	1046.25
4117	256	2	401	4	4650.44	930.08
4118	639	7	832	3	16738.56	3180.33
4119	841	1	1	8	45895.52	15145.52
4120	604	28	577	7	54670.56	9293.97
4121	286	47	585	9	48366.72	5320.35
4122	868	47	264	4	36259.80	5076.36
4123	234	50	138	7	30786.21	3386.46
4124	47	22	463	1	9425.53	2073.62
4125	235	19	381	8	9348.08	2710.96
4126	490	47	393	4	19229.08	6922.48
4127	717	18	346	4	16031.32	4328.44
4128	145	18	697	8	10506.24	3782.24
4129	56	9	756	2	7921.60	2614.12
4130	161	44	101	8	67971.60	18352.32
4131	578	11	352	4	38257.92	8034.16
4132	239	39	680	3	29791.47	7745.79
4133	62	23	487	9	59925.60	17977.68
4134	549	47	661	4	5410.80	1839.68
4135	113	43	34	9	48436.47	16952.76
4136	512	9	684	8	65836.24	12508.88
4137	363	5	417	1	5226.18	1620.12
4138	367	17	373	3	24477.48	2937.30
4139	208	20	516	7	24191.30	8708.84
4140	371	43	846	5	33403.25	9686.95
4141	805	20	945	8	63987.92	11517.84
4142	33	22	487	9	59925.60	17977.68
4143	327	44	723	9	47703.69	9540.72
4144	574	37	754	8	268.88	72.56
4145	205	42	37	8	75760.00	7576.00
4146	774	6	903	6	46607.40	14448.30
4147	809	38	329	8	70333.52	21803.36
4148	110	19	407	3	13312.80	4659.48
4149	96	1	943	6	37401.00	14586.42
4150	297	8	900	3	4475.07	1655.79
4151	221	8	884	4	15392.72	4309.96
4152	625	5	923	9	29308.50	7327.08
4153	828	42	331	8	17170.08	6009.52
4154	454	14	533	1	3276.33	1245.01
4155	735	34	974	10	85714.80	29143.00
4156	877	4	967	2	19274.44	6746.06
4157	256	40	438	10	67022.20	15415.10
4158	564	50	581	2	10092.78	2523.20
4159	237	2	537	1	6942.32	1943.85
4160	277	48	292	4	31659.84	9181.36
4161	419	2	785	9	41859.27	12557.79
4162	483	15	350	1	7032.87	2742.82
4163	657	42	910	3	8579.76	1715.94
4164	683	29	548	5	29770.50	9526.55
4165	70	45	80	3	14429.04	5627.34
4166	800	44	800	8	78392.56	14110.64
4167	874	5	518	2	495.76	104.10
4168	73	44	581	7	35324.73	8831.20
4169	53	28	26	4	14650.80	1465.08
4170	657	42	708	7	44492.49	12902.82
4171	28	35	204	6	17444.88	5582.34
4172	236	24	738	6	13900.62	3058.14
4173	243	39	893	6	37345.38	11950.50
4174	734	48	821	6	42194.76	14346.24
4175	621	9	552	8	38865.12	14768.72
4176	665	40	149	9	57559.77	8633.97
4177	390	33	258	2	18503.22	7216.26
4178	784	17	551	3	21341.22	5121.90
4179	6	37	736	1	6502.27	715.25
4180	437	45	903	5	38839.50	12040.25
4181	295	25	213	3	3178.20	381.39
4182	734	48	494	3	8741.61	1486.08
4183	208	20	147	4	32641.56	7181.16
4184	17	6	572	2	12420.58	3477.76
4185	656	39	532	10	89569.70	10748.40
4186	612	1	316	6	22727.28	8181.84
4187	759	24	558	10	99475.20	33821.60
4188	407	28	386	8	60898.96	20705.68
4189	150	50	278	6	49261.92	14778.60
4190	486	4	60	10	26986.00	2968.50
4191	738	7	270	1	260.37	85.92
4192	206	21	692	9	33005.16	3960.63
4193	367	22	601	5	19782.70	4747.85
4194	300	9	410	5	6231.45	2367.95
4195	720	1	749	2	3366.96	909.08
4196	210	10	543	5	19967.40	5590.85
4197	794	32	521	1	8469.44	3303.08
4198	627	41	77	1	6867.68	1579.57
4199	48	35	47	5	20738.15	8295.25
4200	407	28	92	9	51336.90	17967.87
4201	367	17	482	9	30247.56	6654.42
4202	470	9	387	2	10803.06	3348.94
4203	139	19	391	10	5669.00	963.70
4204	609	38	179	8	2614.24	732.00
4205	547	44	423	7	62690.81	11284.35
4206	807	2	883	7	17624.46	5992.35
4207	859	19	848	3	13310.55	3194.52
4208	227	2	894	7	37447.34	10859.73
4209	185	25	935	5	15316.40	2450.60
4210	221	8	210	5	26703.15	8010.95
4211	288	48	610	9	78657.21	9438.84
4212	344	5	786	7	30345.21	11531.17
4213	581	42	993	10	72014.40	18003.60
4214	485	33	494	9	26224.83	4458.24
4215	582	13	764	10	75786.90	16673.10
4216	771	6	735	10	89347.20	31271.50
4217	19	39	767	5	32270.70	10972.05
4218	423	35	320	1	7288.37	1822.09
4219	271	40	807	4	21515.08	7530.28
4220	377	39	150	3	24925.26	7477.59
4221	673	2	486	9	56670.30	13034.16
4222	245	29	651	2	13564.58	4069.38
4223	441	25	516	8	27647.20	9952.96
4224	766	36	654	6	49882.62	12969.48
4225	658	41	444	4	39422.72	12615.28
4226	299	50	828	7	16123.45	5965.68
4227	787	25	353	7	15320.62	4289.74
4228	359	10	841	3	22854.69	7770.60
4229	738	7	56	6	46301.28	18520.50
4230	187	16	182	1	6354.32	1969.84
4231	858	24	783	1	8540.14	2903.65
4232	375	4	861	3	1591.32	525.15
4233	185	17	153	10	5116.70	1995.50
4234	471	19	140	7	52863.16	17444.84
4235	733	23	91	9	89494.83	20583.81
4236	246	17	690	5	26292.65	5258.55
4237	693	41	623	6	43009.92	8601.96
4238	784	17	556	3	18667.80	3360.21
4239	390	33	797	9	61423.29	13513.14
4240	332	37	786	8	34680.24	13178.48
4241	58	36	143	2	8188.32	3111.56
4242	49	19	600	10	23679.90	7814.40
4243	107	40	464	8	4169.68	1459.36
4244	765	7	763	5	18936.95	5491.70
4245	784	12	361	4	15685.44	2823.36
4246	847	50	912	10	49551.30	5946.20
4247	470	9	647	8	55826.16	6140.88
4248	3	2	468	2	4188.92	502.68
4249	178	39	641	5	31413.20	9738.10
4250	245	10	406	10	32973.00	10551.40
4251	643	46	288	10	9939.40	3180.60
4252	822	11	1	6	34421.64	11359.14
4253	606	40	814	6	51385.80	17985.00
4254	563	29	644	3	2567.04	872.79
4255	649	13	98	10	9707.80	2524.00
4256	767	27	664	10	11735.40	1290.90
4257	70	45	117	10	36169.10	14467.60
4258	691	43	705	2	15187.04	2733.66
4259	404	1	219	6	54897.42	21409.98
4260	240	29	367	6	967.62	251.58
4261	231	34	308	7	8953.42	3581.34
4262	439	28	960	6	4843.80	678.12
4263	546	35	426	1	4442.90	888.58
4264	385	38	599	7	18902.52	6048.84
4265	142	5	377	9	18884.52	4721.13
4266	697	14	5	1	8727.36	3054.58
4267	706	9	818	1	8616.34	2412.58
4268	47	37	838	3	15383.55	3384.39
4269	823	12	460	7	23285.78	6520.01
4270	824	50	12	5	49170.15	8358.95
4271	24	32	313	3	28083.99	10391.07
4272	25	31	683	9	4282.47	1413.18
4273	580	10	446	9	86244.66	25873.38
4274	180	27	161	9	68478.12	23967.36
4275	807	40	488	10	96262.50	10588.90
4276	452	20	855	9	17836.47	4815.81
4277	321	12	48	8	32009.12	12483.52
4278	551	2	309	8	12756.40	2551.28
4279	320	29	140	10	75518.80	24921.20
4280	445	11	577	10	78100.80	13277.10
4281	377	14	977	10	85128.40	18728.20
4282	831	26	647	9	62804.43	6908.49
4283	138	26	813	8	51797.28	12431.36
4284	776	37	629	8	44710.24	7153.60
4285	618	24	461	6	41998.02	4619.76
4286	391	47	658	1	8505.83	2296.57
4287	122	44	920	2	779.70	257.30
4288	765	7	361	1	3921.36	705.84
4289	737	44	175	3	29724.63	5053.20
4290	212	18	116	3	6725.37	1345.08
4291	649	26	520	2	1080.82	410.72
4292	102	27	350	7	49230.09	19199.74
4293	426	15	351	1	208.69	20.87
4294	493	3	152	1	2431.58	389.05
4295	326	43	348	2	1339.60	522.44
4296	761	35	890	10	13784.00	2756.80
4297	680	39	367	6	967.62	251.58
4298	777	50	1	1	5736.94	1893.19
4299	764	24	324	5	29568.25	6505.00
4300	685	29	146	8	26169.92	3140.40
4301	525	34	887	6	47036.04	15521.88
4302	165	16	340	6	46516.14	13024.50
4303	328	37	224	3	22603.26	2712.39
4304	412	18	214	5	2740.10	520.60
4305	449	37	190	9	51019.65	14285.52
4306	853	32	769	3	28469.19	5124.45
4307	805	20	548	7	41678.70	13337.17
4308	286	15	671	9	23165.82	3474.90
4309	716	23	405	4	21981.76	6814.36
4310	477	1	825	10	11225.40	3255.40
4311	69	31	640	4	22029.04	6388.44
4312	696	47	799	7	41020.35	11485.67
4313	402	10	554	2	8024.66	2648.14
4314	650	39	718	2	17259.18	3969.62
4315	616	29	450	4	33624.52	8742.36
4316	129	11	124	7	33235.58	9970.66
4317	188	46	906	3	23710.68	7113.21
4318	774	6	453	9	81394.38	20348.64
4319	418	29	55	7	60522.00	7262.64
4320	47	21	594	3	21806.22	7196.04
4321	39	2	322	1	7759.88	3026.35
4322	851	47	66	2	4287.04	1671.94
4323	834	29	364	8	50111.12	13028.88
4324	195	44	399	7	27125.00	6238.75
4325	520	37	214	2	1096.04	208.24
4326	643	42	946	8	70600.00	24004.00
4327	20	23	66	1	2143.52	835.97
4328	407	28	833	8	31767.92	9848.08
4329	737	44	369	5	11525.00	2189.75
4330	243	39	875	10	92016.30	22083.90
4331	554	21	710	3	25189.89	10075.95
4332	489	10	200	7	55225.24	12701.78
4333	19	39	913	4	13084.00	2485.96
4334	447	26	841	2	15236.46	5180.40
4335	581	42	374	9	14903.28	3129.66
4336	231	50	86	6	43452.18	4779.72
4337	564	7	721	1	9967.24	2392.14
4338	745	20	974	1	8571.48	2914.30
4339	241	40	473	8	66545.04	14639.92
4340	243	39	691	6	50808.42	16258.68
4341	686	8	703	7	43778.98	9631.37
4342	337	31	59	1	3765.44	1016.67
4343	259	25	599	10	27003.60	8641.20
4344	301	32	91	6	59663.22	13722.54
4345	19	39	463	7	65978.71	14515.34
4346	187	17	682	3	4179.54	1253.85
4347	782	30	261	4	9158.68	3297.12
4348	623	42	502	7	41886.53	8796.20
4349	437	12	317	10	39932.40	15174.30
4350	349	27	971	4	34937.32	4541.84
4351	368	22	827	2	3641.54	619.06
4352	303	34	748	5	18726.80	2996.30
4353	269	12	270	9	2343.33	773.28
4354	169	27	672	10	73535.70	13971.80
4355	599	44	827	2	3641.54	619.06
4356	483	15	471	2	14700.30	3822.08
4357	236	24	850	4	34542.40	6908.48
4358	680	41	243	1	1049.90	304.47
4359	252	23	41	10	4281.30	1241.60
4360	459	21	953	6	45513.72	5461.62
4361	527	19	40	1	4450.12	979.03
4362	634	14	688	10	89152.80	10698.30
4363	187	16	975	5	6247.60	812.20
4364	231	50	150	2	16616.84	4985.06
4365	328	13	986	6	45797.28	15113.10
4366	832	44	889	9	39719.43	9135.45
4367	233	35	856	1	1669.35	400.64
4368	831	50	662	4	10148.32	2029.68
4369	236	35	574	4	33866.60	8466.64
4370	430	26	1	5	28684.70	9465.95
4371	209	32	726	6	26008.74	8582.88
4372	302	45	121	10	68646.70	7551.10
4373	66	8	899	2	12253.04	3185.80
4374	570	39	796	7	47238.94	8030.61
4375	137	40	102	2	9699.58	1551.94
4376	245	10	471	3	22050.45	5733.12
4377	734	48	26	1	3662.70	366.27
4378	445	11	178	1	6185.20	927.78
4379	185	17	383	9	70629.12	14832.09
4380	766	36	664	9	10561.86	1161.81
4381	640	4	401	1	1162.61	232.52
4382	44	15	44	1	6414.52	1347.05
4383	728	10	887	1	7839.34	2586.98
4384	100	26	598	10	22046.10	5732.00
4385	253	25	826	7	41308.61	10740.24
4386	74	18	880	10	62845.70	8169.90
4387	853	32	301	8	21271.12	4466.96
4388	62	23	696	2	13820.84	3869.84
4389	567	24	863	8	25530.40	9701.52
4390	496	36	264	4	36259.80	5076.36
4391	614	14	612	1	8672.57	2081.42
4392	464	33	341	1	9057.79	2083.29
4393	870	50	13	7	57730.33	8659.56
4394	828	42	749	1	1683.48	454.54
4395	131	41	805	7	19681.76	6691.79
4396	661	24	605	3	16641.54	6490.20
4397	251	39	323	3	6263.19	1878.96
4398	638	47	751	6	15348.24	5832.36
4399	316	39	827	3	5462.31	928.59
4400	227	2	961	5	44384.50	9320.75
4401	372	14	463	8	75404.24	16588.96
4402	404	1	780	6	38449.38	8458.86
4403	673	18	412	6	48041.94	5765.04
4404	228	37	424	2	12512.62	4754.80
4405	8	7	94	7	61176.01	18352.81
4406	716	23	132	7	21339.01	7041.86
4407	864	21	234	2	11973.48	1796.02
4408	389	40	791	6	16580.82	2984.52
4409	107	40	512	1	915.47	91.55
4410	804	19	284	1	1706.10	204.73
4411	276	11	172	4	436.24	152.68
4412	377	20	193	5	25613.35	6403.35
4413	851	22	822	4	21448.96	5576.72
4414	747	26	89	1	5779.27	2138.33
4415	224	42	292	7	55404.72	16067.38
4416	150	1	597	1	7827.20	2191.62
4417	358	48	902	5	4569.65	1005.30
4418	443	40	9	8	58638.08	18177.84
4419	727	24	590	2	18123.20	2356.02
4420	504	31	795	5	33360.50	11008.95
4421	209	5	163	7	23591.33	6133.75
4422	284	20	527	7	26251.96	6037.92
4423	825	29	817	5	21290.70	6813.00
4424	161	30	210	9	48065.67	14419.71
4425	519	19	293	6	29609.88	5922.00
4426	780	49	871	5	8365.90	920.25
4427	810	47	562	10	34565.50	7950.10
4428	821	33	263	5	46861.70	8903.70
4429	68	34	544	5	44901.85	10776.45
4430	826	21	77	2	13735.36	3159.14
4431	55	41	419	5	15884.65	5718.45
4432	576	4	747	2	276.52	44.24
4433	693	17	401	9	10463.49	2092.68
4434	746	50	876	2	2446.34	954.08
4435	425	21	7	10	46941.10	7041.20
4436	71	39	217	4	18774.52	6383.32
4437	828	42	654	8	66510.16	17292.64
4438	616	29	161	1	7608.68	2663.04
4439	74	28	907	5	250.70	30.10
4440	659	6	525	4	27557.20	9920.60
4441	123	46	248	8	22580.16	6096.64
4442	685	29	773	5	6299.80	1574.95
4443	224	42	474	7	35081.55	5613.02
4444	646	25	560	3	27878.64	9757.53
4445	643	46	855	8	15854.64	4280.72
4446	654	26	329	7	61541.83	19077.94
4447	641	42	76	2	3081.42	1201.76
4448	65	23	740	4	24765.08	9906.04
4449	473	25	969	9	22038.84	2644.65
4450	860	42	219	4	36598.28	14273.32
4451	258	2	352	2	19128.96	4017.08
4452	255	6	979	10	89093.10	29400.70
4453	106	35	650	5	41680.30	15421.70
4454	466	49	445	4	33574.56	5371.92
4455	665	23	850	8	69084.80	13816.96
4456	679	42	676	2	930.20	279.06
4457	765	14	719	9	31997.25	7679.34
4458	205	34	585	10	53740.80	5911.50
4459	12	15	359	9	46513.62	15349.50
4460	54	9	570	3	6370.86	2166.09
4461	131	46	226	5	22376.15	2908.90
4462	41	25	577	2	15620.16	2655.42
4463	267	37	481	1	9930.52	1986.10
4464	490	13	598	7	15432.27	4012.40
4465	333	6	698	10	32865.40	3615.20
4466	248	27	401	2	2325.22	465.04
4467	71	39	770	4	32458.04	7140.76
4468	573	24	110	9	84157.83	14306.85
4469	776	37	869	9	84928.41	28875.69
4470	256	2	747	8	1106.08	176.96
4471	555	30	511	10	15367.20	4917.50
4472	80	36	311	2	6249.76	1874.92
4473	315	12	91	6	59663.22	13722.54
4474	185	25	990	9	67441.59	14162.76
4475	223	23	261	3	6869.01	2472.84
4476	437	15	396	9	24222.42	5813.37
4477	53	19	965	8	53984.16	11876.48
4478	245	13	541	3	23312.40	9091.83
4479	228	7	513	6	42151.50	10959.42
4480	312	6	672	6	44121.42	8383.08
4481	339	46	696	10	69104.20	19349.20
4482	477	1	397	8	43693.44	4806.24
4483	795	18	832	10	55795.20	10601.10
4484	13	9	285	1	2946.12	441.92
4485	240	29	820	2	3694.74	1367.06
4486	681	29	424	10	62563.10	23774.00
4487	71	19	530	2	8024.26	1283.88
4488	594	49	814	10	85643.00	29975.00
4489	528	28	468	5	10472.30	1256.70
4490	162	41	474	6	30069.90	4811.16
4491	437	23	103	6	16370.34	3601.50
4492	231	50	602	10	33597.60	6383.50
4493	69	31	609	9	81837.81	9820.53
4494	859	25	360	9	15006.87	2551.14
4495	80	18	598	2	4409.22	1146.40
4496	5	50	55	4	34584.00	4150.08
4497	14	45	197	6	32416.26	8104.08
4498	167	17	597	7	54790.40	15341.34
4499	537	40	34	5	26909.15	9418.20
4500	586	25	382	10	21693.00	3687.80
4501	752	11	148	9	14811.66	4443.48
4502	390	17	369	7	16135.00	3065.65
4503	124	21	73	4	9421.56	1130.60
4504	675	33	981	1	1771.06	425.05
4505	161	21	181	8	29822.40	9543.20
4506	216	6	820	5	9236.85	3417.65
4507	592	20	153	10	5116.70	1995.50
4508	74	18	734	10	13623.70	5313.20
4509	741	43	877	10	29233.20	4969.60
4510	454	7	795	8	53376.80	17614.32
4511	239	32	415	8	52204.08	6264.48
4512	614	14	844	5	45056.95	17572.20
4513	110	23	129	6	52381.38	10476.30
4514	690	46	873	3	9331.62	1773.00
4515	682	46	477	9	11038.50	3753.09
4516	458	1	419	8	25415.44	9149.52
4517	214	28	563	6	46593.24	6057.12
4518	848	28	479	6	3863.04	463.56
4519	746	24	425	9	25252.29	4292.91
4520	140	45	806	1	5033.13	1711.26
4521	365	33	456	10	53914.60	5391.50
4522	718	14	966	2	8257.82	1073.52
4523	333	11	592	6	58907.94	11192.52
4524	621	39	476	9	75095.37	23279.58
4525	760	16	625	8	53848.48	12385.12
4526	67	20	131	4	1893.80	700.72
4527	165	16	396	4	10765.52	2583.72
4528	757	36	660	2	8850.22	3274.58
4529	444	22	733	4	36418.88	8376.36
4530	259	25	55	6	51876.00	6225.12
4531	808	41	54	4	574.92	172.48
4532	174	11	254	3	5411.70	2164.68
4533	452	31	131	5	2367.25	875.90
4534	646	39	61	1	1750.28	682.61
4535	417	5	962	4	28857.92	5771.60
4536	257	50	463	4	37702.12	8294.48
4537	316	49	331	6	12877.56	4507.14
4538	448	9	730	10	85994.50	9459.40
4539	496	36	713	8	64262.16	16708.16
4540	657	42	209	9	14706.90	5294.52
4541	370	10	998	10	73185.00	13905.10
4542	454	14	778	8	45666.00	17353.12
4543	549	47	453	10	90438.20	22609.60
4544	853	32	14	5	38412.40	9219.00
4545	529	48	944	9	40424.58	10914.66
4546	609	38	430	10	10883.90	1850.30
4547	206	21	645	1	195.84	68.54
4548	21	47	581	8	40371.12	10092.80
4549	390	41	987	6	48519.60	16011.48
4550	333	6	326	1	7713.25	1388.39
4551	102	8	818	9	77547.06	21713.22
4552	578	42	428	2	9104.30	3186.50
4553	627	27	96	10	78605.60	12576.90
4554	625	5	619	1	1047.23	178.03
4555	482	39	774	9	78434.55	14902.56
4556	508	2	161	7	53260.76	18641.28
4557	170	21	87	4	23545.60	2825.48
4558	323	2	577	7	54670.56	9293.97
4559	110	39	331	4	8585.04	3004.76
4560	106	35	783	5	42700.70	14518.25
4561	180	27	356	6	26752.08	5082.90
4562	849	15	889	7	30892.89	7105.35
4563	613	23	302	6	39134.64	15653.88
4564	493	3	850	10	86356.00	17271.20
4565	127	20	411	5	32849.75	6898.45
4566	328	13	254	4	7215.60	2886.24
4567	867	17	717	7	68895.61	12401.20
4568	106	35	985	3	22594.38	2259.45
4569	482	19	895	2	10554.86	4010.84
4570	859	19	796	10	67484.20	11472.30
4571	536	2	445	4	33574.56	5371.92
4572	483	15	231	3	21358.65	5126.07
4573	722	33	604	3	8830.77	1677.84
4574	505	27	933	9	72493.56	26097.66
4575	207	29	130	7	57629.81	8644.44
4576	866	2	414	1	8303.86	2325.08
4577	210	10	811	9	88305.93	35322.39
4578	328	28	412	7	56048.93	6725.88
4579	15	2	170	9	83543.04	31746.33
4580	563	18	297	9	69567.12	11826.45
4581	858	6	322	7	54319.16	21184.45
4582	143	49	742	5	36625.90	12452.80
4583	443	40	437	1	5416.16	1895.66
4584	300	9	256	1	162.73	61.84
4585	613	27	483	3	22147.83	3543.66
4586	348	4	925	4	19954.84	3192.76
4587	425	18	971	4	34937.32	4541.84
4588	729	18	78	6	38963.40	5454.90
4589	40	42	234	6	35920.44	5388.06
4590	234	50	228	2	14484.86	5359.40
4591	7	16	438	10	67022.20	15415.10
4592	298	15	667	3	16060.02	6424.02
4593	306	44	78	2	12987.80	1818.30
4594	379	36	13	2	16494.38	2474.16
4595	109	37	574	2	16933.30	4233.32
4596	556	42	344	2	2075.34	373.56
4597	872	28	721	4	39868.96	9568.56
4598	454	8	630	7	9975.91	2893.03
4599	600	29	916	8	22471.12	3820.08
4600	297	8	237	9	70485.93	16211.79
4601	496	50	64	7	17249.54	5864.81
4602	498	30	354	5	30431.90	3043.20
4603	765	14	257	9	42562.80	5958.81
4604	201	46	1000	10	22235.30	7115.30
4605	479	40	613	8	50065.92	7009.20
4606	498	30	332	1	9667.95	2513.67
4607	466	49	251	9	51284.97	15898.32
4608	500	29	958	3	26047.14	4688.49
4609	60	43	622	7	27217.75	2721.74
4610	842	31	101	5	42482.25	11470.20
4611	285	22	148	3	4937.22	1481.16
4612	391	49	297	10	77296.80	13140.50
4613	678	39	441	8	54033.36	13508.32
4614	649	26	512	10	9154.70	915.50
4615	12	29	134	9	43512.93	7397.19
4616	15	2	119	3	5141.46	1336.77
4617	475	3	431	9	18808.83	4514.13
4618	837	13	884	5	19240.90	5387.45
4619	555	30	5	4	34909.44	12218.32
4620	616	29	23	1	5672.64	1531.61
4621	720	10	642	10	48212.50	15910.10
4622	229	15	966	6	24773.46	3220.56
4623	428	16	7	1	4694.11	704.12
4624	875	45	946	6	52950.00	18003.00
4625	85	46	547	8	59394.88	7721.36
4626	779	34	485	10	70442.20	21837.10
4627	283	32	138	6	26388.18	2902.68
4628	785	34	960	10	8073.00	1130.20
4629	801	34	764	10	75786.90	16673.10
4630	752	11	304	9	75242.61	12038.85
4631	578	42	565	5	9292.90	3252.50
4632	718	34	53	7	68424.93	7526.75
4633	299	50	653	8	28055.60	5891.68
4634	643	42	406	10	32973.00	10551.40
4635	206	18	611	1	6920.65	2422.23
4636	769	36	105	6	21187.62	6568.14
4637	866	15	291	5	12015.55	4205.45
4638	119	17	388	6	33479.88	8704.74
4639	696	28	926	1	5303.56	1485.00
4640	456	38	592	3	29453.97	5596.26
4641	187	19	290	6	53260.68	11717.34
4642	86	42	491	3	20997.18	3149.58
4643	33	38	128	9	28349.64	4252.41
4644	247	47	94	8	69915.44	20974.64
4645	408	18	32	3	16174.71	6308.13
4646	176	9	554	5	20061.65	6620.35
4647	808	41	743	1	4467.69	1429.66
4648	534	14	417	7	36583.26	11340.84
4649	800	44	110	7	65456.09	11127.55
4650	608	44	81	1	6114.42	2323.48
4651	686	7	104	2	12309.94	4800.88
4652	720	47	533	1	3276.33	1245.01
4653	51	16	848	10	44368.50	10648.40
4654	817	33	541	5	38854.00	15153.05
4655	564	50	981	7	12397.42	2975.35
4656	324	7	574	9	76199.85	19049.94
4657	206	14	740	8	49530.16	19812.08
4658	177	18	994	8	16038.80	2405.84
4659	112	6	841	9	68564.07	23311.80
4660	167	46	454	4	19355.72	3484.04
4661	266	26	807	4	21515.08	7530.28
4662	315	33	423	1	8955.83	1612.05
4663	823	39	723	2	10600.82	2120.16
4664	632	21	513	10	70252.50	18265.70
4665	563	29	802	1	3007.82	902.35
4666	623	42	929	8	12514.16	3504.00
4667	231	25	425	9	25252.29	4292.91
4668	396	13	892	1	3448.85	931.19
4669	348	4	356	10	44586.80	8471.50
4670	185	25	401	8	9300.88	1860.16
4671	833	24	943	1	6233.50	2431.07
4672	357	11	337	8	55476.48	8321.44
4673	805	31	620	7	26520.90	9547.51
4674	344	1	881	1	9345.46	3738.18
4675	103	44	578	6	13430.88	1611.72
4676	96	1	564	3	19236.42	2116.02
4677	382	21	280	1	8133.77	3253.51
4678	650	9	575	5	27797.45	10563.05
4679	493	5	73	9	21198.51	2543.85
4680	697	14	534	5	44930.40	7638.15
4681	70	15	196	3	7843.41	2509.89
4682	730	9	195	2	19862.60	2184.88
4683	457	9	925	4	19954.84	3192.76
4684	643	42	877	7	20463.24	3478.72
4685	776	22	848	9	39931.65	9583.56
4686	755	30	138	4	17592.12	1935.12
4687	638	47	298	7	50354.57	7049.63
4688	477	35	139	10	90474.80	18999.70
4689	870	39	145	6	45217.86	16278.42
4690	63	11	151	1	3649.63	693.43
4691	824	50	561	6	11878.68	2969.64
4692	678	39	512	10	9154.70	915.50
4693	49	19	781	4	13648.80	1774.36
4694	784	44	60	3	8095.80	890.55
4695	282	9	552	5	24290.70	9230.45
4696	833	24	37	1	9470.00	947.00
4697	409	40	152	8	19452.64	3112.40
4698	457	2	91	10	99438.70	22870.90
4699	856	9	798	8	56777.84	21575.60
4700	20	29	696	1	6910.42	1934.92
4701	86	44	667	10	53533.40	21413.40
4702	547	44	312	3	29248.11	8774.43
4703	256	41	134	7	33843.39	5753.37
4704	283	34	49	10	90824.40	9990.70
4705	135	20	22	2	5599.96	560.00
4706	323	26	927	2	15523.10	4346.46
4707	35	21	672	5	36767.85	6985.90
4708	474	3	363	10	77756.20	9330.70
4709	53	33	995	8	76996.64	20789.12
4710	872	28	744	4	3435.00	790.04
4711	727	24	697	9	11819.52	4255.02
4712	320	29	280	3	24401.31	9760.53
4713	805	20	525	4	27557.20	9920.60
4714	74	26	789	9	85328.19	20478.78
4715	301	14	347	4	28920.20	6073.24
4716	376	39	541	4	31083.20	12122.44
4717	544	1	977	3	25538.52	5618.46
4718	750	28	91	5	49719.35	11435.45
4719	125	48	333	10	21763.00	6528.90
4720	527	24	885	3	2805.30	1066.02
4721	875	34	289	6	35326.14	7065.24
4722	793	12	149	1	6395.53	959.33
4723	259	25	121	4	27458.68	3020.44
4724	358	45	120	7	55671.35	12804.40
4725	109	8	987	9	72779.40	24017.22
4726	76	5	772	10	49155.10	13763.40
4727	240	1	525	6	41335.80	14880.90
4728	646	39	698	1	3286.54	361.52
4729	445	50	179	8	2614.24	732.00
4730	768	15	970	3	654.48	196.35
4731	134	5	649	2	17347.00	6418.38
4732	239	27	88	2	3501.22	1015.36
4733	559	39	302	7	45657.08	18262.86
4734	142	37	368	9	38313.45	11877.21
4735	203	8	704	10	88267.00	32658.80
4736	326	47	511	5	7683.60	2458.75
4737	875	19	309	6	9567.30	1913.46
4738	747	1	979	1	8909.31	2940.07
4739	99	32	965	3	20244.06	4453.68
4740	417	5	367	10	1612.70	419.30
4741	794	32	192	7	21387.03	5774.51
4742	386	47	75	2	7976.14	797.62
4743	74	40	175	8	79265.68	13475.20
4744	163	2	511	6	9220.32	2950.50
4745	306	8	390	1	1637.47	262.00
4746	268	49	212	6	30773.34	5846.94
4747	847	48	704	6	52960.20	19595.28
4748	802	46	212	7	35902.23	6821.43
4749	683	29	452	9	21024.54	6307.38
4750	24	16	789	10	94809.10	22754.20
4751	630	27	84	6	11510.70	1266.18
4752	862	43	766	3	4601.46	1334.43
4753	591	50	571	8	50336.80	5537.04
4754	859	25	969	7	17141.32	2056.95
4755	98	29	191	9	27489.78	4673.25
4756	69	31	291	1	2403.11	841.09
4757	822	6	192	9	27497.61	7424.37
4758	442	49	475	10	57218.70	16593.40
4759	789	48	961	8	71015.20	14913.20
4760	251	39	976	10	1047.40	293.30
4761	165	13	635	4	11090.72	1552.72
4762	769	36	287	2	5811.80	2150.36
4763	28	35	989	7	5102.37	1428.63
4764	33	22	998	1	7318.50	1390.51
4765	706	6	121	5	34323.35	3775.55
4766	86	19	69	7	44655.10	12950.00
4767	437	15	508	5	48031.60	9606.30
4768	119	1	113	9	10588.32	2541.24
4769	161	21	394	6	38288.34	8040.54
4770	826	9	247	4	25072.00	3510.08
4771	828	42	451	9	67346.55	12795.84
4772	183	38	999	9	6176.43	1729.44
4773	438	42	115	5	22453.65	4715.25
4774	233	26	972	7	17093.65	5811.82
4775	310	29	613	6	37549.44	5256.90
4776	699	6	453	7	63306.74	15826.72
4777	725	50	598	3	6613.83	1719.60
4778	183	9	138	5	21990.15	2418.90
4779	53	35	446	2	19165.48	5749.64
4780	371	13	469	3	109.17	32.76
4781	517	42	301	10	26588.90	5583.70
4782	114	36	84	3	5755.35	633.09
4783	327	23	796	8	53987.36	9177.84
4784	112	18	693	4	19083.04	6869.88
4785	598	1	778	2	11416.50	4338.28
4786	859	19	631	2	5307.38	583.82
4787	878	14	620	4	15154.80	5455.72
4788	140	1	205	5	1149.65	252.90
4789	639	22	328	6	47769.54	15286.26
4790	823	4	274	2	8370.90	1590.48
4791	464	15	217	7	32855.41	11170.81
4792	17	10	304	1	8360.29	1337.65
4793	515	20	971	8	69874.64	9083.68
4794	368	22	80	5	24048.40	9378.90
4795	297	8	813	3	19423.98	4661.76
4796	358	45	355	9	86133.42	12058.65
4797	591	50	431	9	18808.83	4514.13
4798	229	15	997	7	32034.94	4805.22
4799	741	36	924	7	49165.20	4916.52
4800	437	40	399	2	7750.00	1782.50
4801	406	21	925	2	9977.42	1596.38
4802	53	35	127	4	23855.56	9065.12
4803	570	15	14	1	7682.48	1843.80
4804	292	43	91	3	29831.61	6861.27
4805	192	8	180	8	28456.00	11382.40
4806	417	42	927	5	38807.75	10866.15
4807	693	17	853	9	62696.61	16928.10
4808	77	38	959	2	13799.22	3311.82
4809	682	46	923	4	13026.00	3256.48
4810	45	30	149	7	44768.71	6715.31
4811	583	19	803	8	45122.32	6317.12
4812	706	33	251	6	34189.98	10598.88
4813	272	19	303	6	55482.12	18863.94
4814	649	45	740	6	37147.62	14859.06
4815	559	39	250	7	26171.88	8375.01
4816	224	21	439	10	41983.10	5457.80
4817	446	20	935	3	9189.84	1470.36
4818	157	50	322	9	69838.92	27237.15
4819	741	36	982	5	45524.15	17754.40
4820	25	31	402	6	23297.82	3494.70
4821	746	24	10	3	8478.75	3221.91
4822	381	6	184	3	5363.28	2091.69
4823	485	41	702	6	52995.78	14838.84
4824	877	31	719	4	14221.00	3413.04
4825	445	50	759	8	34438.88	7232.16
4826	825	26	121	1	6864.67	755.11
4827	599	44	170	9	83543.04	31746.33
4828	637	41	592	1	9817.99	1865.42
4829	626	26	243	9	9449.10	2740.23
4830	591	23	499	8	59151.68	15970.96
4831	733	45	286	7	32928.28	9549.19
4832	794	41	898	7	35181.23	13368.88
4833	225	11	482	6	20165.04	4436.28
4834	579	20	680	4	39721.96	10327.72
4835	661	24	653	2	7013.90	1472.92
4836	592	20	801	8	19532.16	2734.48
4837	739	29	72	5	39008.30	6241.35
4838	591	50	783	3	25620.42	8710.95
4839	827	20	411	9	59129.55	12417.21
4840	821	33	291	2	4806.22	1682.18
4841	73	19	75	1	3988.07	398.81
4842	784	12	462	8	41515.92	14115.44
4843	850	44	276	6	57697.80	20771.22
4844	397	16	759	8	34438.88	7232.16
4845	744	31	324	3	17740.95	3903.00
4846	735	32	311	10	31248.80	9374.60
4847	349	15	106	10	86540.60	15577.30
4848	512	7	518	4	991.52	208.20
4849	705	21	589	3	16501.74	6600.69
4850	842	31	38	9	44037.18	11890.08
4851	457	9	879	7	34323.45	8580.88
4852	695	46	904	3	28392.15	5110.59
4853	651	1	106	4	34616.24	6230.92
4854	534	14	827	5	9103.85	1547.65
4855	186	17	390	6	9824.82	1572.00
4856	140	1	552	3	14574.42	5538.27
4857	723	17	461	8	55997.36	6159.68
4858	408	18	576	2	1995.24	638.48
4859	366	3	883	6	15106.68	5136.30
4860	242	50	817	1	4258.14	1362.60
4861	255	28	253	2	1694.22	406.62
4862	440	12	679	9	87987.96	32555.52
4863	733	45	980	1	7572.92	1514.58
4864	760	16	20	5	13467.95	2693.60
4865	379	36	147	9	73443.51	16157.61
4866	823	39	118	8	18692.32	5046.96
4867	430	19	903	7	54375.30	16856.35
4868	454	14	319	7	43902.95	16683.10
4869	644	22	659	8	46583.92	10248.48
4870	12	29	760	3	11540.70	3577.62
4871	704	24	245	7	56069.30	16260.09
4872	320	22	422	8	44011.84	7482.00
4873	369	33	761	2	19690.62	6301.00
4874	326	37	207	6	43867.56	14914.98
4875	248	27	741	8	55469.84	14422.16
4876	841	4	25	1	6019.41	2166.99
4877	863	14	718	9	77666.31	17863.29
4878	579	45	40	1	4450.12	979.03
4879	591	23	267	10	64706.20	13588.30
4880	286	47	703	3	18762.42	4127.73
4881	807	2	28	8	61680.08	11719.20
4882	779	34	822	3	16086.72	4182.54
4883	207	35	35	1	2947.54	795.84
4884	142	48	445	1	8393.64	1342.98
4885	822	11	869	1	9436.49	3208.41
4886	685	4	982	8	72838.64	28407.04
4887	449	37	24	4	5207.36	1093.56
4888	592	20	605	1	5547.18	2163.40
4889	726	3	648	3	20343.99	5492.88
4890	74	40	595	3	24705.33	4446.96
4891	846	13	793	10	66466.80	19275.40
4892	311	49	52	4	18547.84	1854.80
4893	714	27	730	6	51596.70	5675.64
4894	439	40	996	5	40102.15	11629.60
4895	302	1	416	4	8321.72	3162.24
4896	389	6	599	10	27003.60	8641.20
4897	563	8	550	5	23330.15	2799.60
4898	289	34	615	1	9165.01	2749.50
4899	559	39	362	6	56528.70	16958.58
4900	707	4	873	10	31105.40	5910.00
4901	331	8	621	5	21771.80	7402.40
4902	158	19	115	6	26944.38	5658.30
4903	469	10	322	1	7759.88	3026.35
4904	207	38	29	3	18077.31	3977.01
4905	83	16	756	6	23764.80	7842.36
4906	444	22	145	1	7536.31	2713.07
4907	699	27	37	2	18940.00	1894.00
4908	184	11	721	9	89705.16	21529.26
4909	450	42	739	10	75496.40	18119.10
4910	638	40	633	9	61954.83	23542.83
4911	331	8	116	10	22417.90	4483.60
4912	481	30	604	9	26492.31	5033.52
4913	321	12	732	2	5566.96	612.36
4914	47	21	631	10	26536.90	2919.10
4915	244	19	523	3	24304.08	9478.59
4916	266	21	257	3	14187.60	1986.27
4917	254	32	241	2	11714.88	2694.42
4918	852	35	855	3	5945.49	1605.27
4919	254	10	632	9	2319.93	487.17
4920	254	17	981	5	8855.30	2125.25
4921	254	20	552	10	48581.40	18460.90
4922	254	46	222	7	60469.78	6046.95
4923	833	6	263	8	74978.72	14245.92
4924	254	2	886	14	17466.68	6637.40
4925	254	16	100	6	34397.82	7223.52
4926	254	6	252	1	7721.08	926.53
4927	254	29	989	1	728.91	204.09
4928	344	49	709	1	7182.84	2083.02
4929	254	48	74	2	710.10	163.32
4930	254	6	597	3	23481.60	6574.86
4931	254	38	573	1	1604.43	497.37
4932	254	32	130	10	82328.30	12349.20
4933	254	4	629	4	22355.12	3576.80
4934	254	4	526	5	3684.60	479.00
4935	254	50	905	2	1904.74	457.14
4936	254	37	600	3	7103.97	2344.32
4937	254	45	11	2	4893.96	1957.58
4938	254	10	887	10	78393.40	25869.80
4939	508	10	719	9	31997.25	7679.34
4940	254	44	56	12	92602.56	37041.00
4941	254	33	896	3	2734.53	546.90
4942	254	47	180	4	14228.00	5691.20
4943	254	35	95	10	48017.80	12484.60
4944	254	37	474	10	50116.50	8018.60
4945	254	24	808	9	82663.47	18185.94
4946	254	2	899	4	24506.08	6371.60
4947	254	27	724	9	83521.17	23385.96
4948	825	21	657	6	2560.32	409.68
4949	337	26	321	4	23255.68	5581.36
4950	254	5	267	4	25882.48	5435.32
4951	254	50	968	8	29979.52	7794.64
4952	254	6	384	2	19671.80	2163.90
4953	254	46	656	7	7384.16	812.28
4954	254	39	679	9	87987.96	32555.52
4955	254	45	221	10	65847.90	19754.40
4956	104	19	887	3	23518.02	7760.94
4957	254	31	549	3	17940.78	4844.01
4958	156	46	693	4	19083.04	6869.88
4959	254	31	783	7	59780.98	20325.55
4960	254	32	352	7	66951.36	14059.78
4961	254	36	635	1	2772.68	388.18
4962	254	48	689	2	9080.06	2905.62
4963	254	48	774	1	8714.95	1655.84
4964	254	36	566	4	13021.40	3906.44
4965	799	5	227	2	14822.10	4891.30
4966	254	32	246	8	9976.16	2593.84
4967	254	9	918	7	20601.56	5974.43
4968	254	44	890	9	12405.60	2481.12
4969	254	44	441	10	67541.70	16885.40
4970	254	30	210	9	48065.67	14419.71
4971	850	34	418	6	9272.76	1576.38
4972	254	42	239	5	10206.15	3163.90
4973	254	42	87	8	47091.20	5650.96
4974	254	31	676	6	2790.60	837.18
4975	254	38	462	4	20757.96	7057.72
4976	254	12	716	10	27388.30	9585.90
4977	254	26	413	2	3409.94	818.38
4978	254	37	996	6	48122.58	13955.52
4979	254	12	413	10	17049.70	4091.90
4980	254	8	158	8	69897.60	22367.20
4981	254	4	14	1	7682.48	1843.80
4982	254	36	132	5	15242.15	5029.90
4983	254	45	288	9	8945.46	2862.54
4984	164	8	992	5	4052.05	1215.60
4985	254	13	472	8	50922.16	5092.24
4986	254	7	288	8	7951.52	2544.48
4987	254	27	677	2	4531.68	1722.04
4988	254	7	832	6	33477.12	6360.66
4989	254	33	851	9	38739.69	5423.58
4990	254	3	296	1	6138.87	1473.33
4991	254	40	383	9	70629.12	14832.09
4992	254	17	171	6	55045.14	18715.32
4993	254	31	393	8	38458.16	13844.96
4994	254	31	481	5	49652.60	9930.50
4995	254	6	775	9	1853.64	240.93
4996	254	22	507	7	51235.59	14345.94
4997	254	33	680	9	89374.41	23237.37
4998	254	15	828	3	6910.05	2556.72
4999	254	3	5	4	34909.44	12218.32
5000	254	47	18	9	89904.33	16182.81
5001	254	5	453	2	18087.64	4521.92
5002	254	45	440	6	46085.46	5069.40
5003	254	45	270	8	2082.96	687.36
5004	254	20	942	1	1790.71	268.61
5005	615	42	308	6	7674.36	3069.72
5006	254	28	223	2	17216.76	1721.68
5007	254	37	680	9	89374.41	23237.37
5008	254	36	949	8	54000.96	17820.32
5009	138	42	492	2	4103.70	943.86
5010	254	41	847	4	9948.52	2785.60
5011	852	35	696	10	69104.20	19349.20
5012	254	43	57	9	28776.87	6906.42
5013	254	38	821	6	42194.76	14346.24
5014	254	12	963	10	63761.10	12114.60
5015	254	28	305	8	72008.56	21602.56
5016	254	17	450	5	42030.65	10927.95
5017	254	35	62	8	35494.88	8163.84
5018	254	10	464	4	2084.84	729.68
5019	254	17	226	8	35801.84	4654.24
5020	254	30	861	2	1060.88	350.10
5021	254	21	29	10	60257.70	13256.70
5022	254	41	430	8	8707.12	1480.24
5023	254	12	266	10	66064.30	23122.50
5024	254	2	596	6	25482.36	3822.36
5025	34	3	952	6	120.60	22.92
5026	254	42	506	7	3845.87	1384.53
5027	57	19	639	4	34612.52	11768.24
5028	254	11	674	1	6616.00	2381.76
5029	254	14	935	4	12253.12	1960.48
5030	254	11	254	8	14431.20	5772.48
5031	254	31	326	4	30853.00	5553.56
5032	254	14	62	8	35494.88	8163.84
5033	254	44	601	2	7913.08	1899.14
5034	254	22	728	8	79058.64	20555.28
5035	254	40	511	4	6146.88	1967.00
5036	254	2	227	9	66699.45	22010.85
5037	254	17	54	4	574.92	172.48
5038	254	4	343	1	9602.07	1440.31
5039	254	42	481	1	9930.52	1986.10
5040	254	22	381	6	7011.06	2033.22
5041	254	29	996	14	112286.02	32562.88
5042	254	25	333	4	8705.20	2611.56
5043	254	12	86	17	123114.51	13542.54
5044	254	1	335	5	22758.85	2731.05
5045	254	13	36	2	14397.02	4031.16
5046	254	42	896	6	5469.06	1093.80
5047	254	39	486	5	31483.50	7241.20
5048	254	8	568	10	85539.00	26517.10
5049	137	45	797	7	47773.67	10510.22
5050	254	34	949	8	54000.96	17820.32
5051	720	43	975	1	1249.52	162.44
5052	254	21	661	2	2705.40	919.84
5053	254	26	21	6	3102.60	403.32
5054	254	22	779	4	27877.48	8642.00
5055	254	19	61	8	14002.24	5460.88
5056	254	18	954	6	47666.40	16683.24
5057	254	30	130	10	82328.30	12349.20
5058	254	18	378	1	5986.95	2035.56
5059	748	35	821	2	14064.92	4782.08
5060	524	44	241	6	35144.64	8083.26
5061	254	8	374	3	4967.76	1043.22
5062	254	46	215	5	48151.85	10111.90
5063	254	41	628	7	28197.47	6767.39
5064	254	37	511	2	3073.44	983.50
5065	696	7	328	10	79615.90	25477.10
5066	254	26	128	8	25199.68	3779.92
5067	254	49	43	1	9652.31	1640.89
5068	254	10	470	3	21116.82	4434.54
5069	254	3	908	4	23832.68	8818.08
5070	792	3	971	8	69874.64	9083.68
5071	254	31	23	10	56726.40	15316.10
5072	716	28	811	5	49058.85	19623.55
5073	254	14	840	1	6171.73	1357.78
5074	254	24	937	5	2429.95	315.90
5075	254	47	981	10	17710.60	4250.50
5076	254	23	412	3	24020.97	2882.52
5077	254	50	665	1	804.37	168.92
5078	254	14	347	3	21690.15	4554.93
5079	254	16	971	22	192155.26	24980.12
5080	254	22	56	6	46301.28	18520.50
5081	254	21	183	5	2167.50	563.55
5082	254	9	996	2	16040.86	4651.84
5083	254	28	471	16	117602.40	30576.64
5084	254	43	23	9	51053.76	13784.49
5085	124	10	940	1	6387.23	830.34
5086	254	20	586	2	13340.34	1734.24
5087	254	28	508	9	86456.88	17291.34
5088	254	16	32	4	21566.28	8410.84
5089	565	48	571	6	37752.60	4152.78
5090	254	22	70	1	2269.28	408.47
5091	254	30	425	1	2805.81	476.99
5092	254	22	928	10	60837.00	20076.20
5093	254	9	962	8	57715.84	11543.20
5094	254	3	446	1	9582.74	2874.82
5095	254	13	274	10	41854.50	7952.40
5096	254	34	444	1	9855.68	3153.82
5097	254	33	321	3	17441.76	4186.02
5098	254	8	550	3	13998.09	1679.76
5099	254	8	751	1	2558.04	972.06
5100	339	18	2	4	8040.48	1206.08
5101	254	31	473	8	66545.04	14639.92
5102	254	29	1000	8	17788.24	5692.24
5103	254	28	697	3	3939.84	1418.34
5104	254	34	128	3	9449.88	1417.47
5105	254	3	472	4	25461.08	2546.12
5106	254	42	551	1	7113.74	1707.30
5107	254	15	314	3	21315.60	7034.16
5108	192	35	775	1	205.96	26.77
5109	254	19	727	3	25321.44	9622.14
5110	254	10	193	3	15368.01	3842.01
5111	254	25	169	4	29742.16	4758.76
5112	254	1	175	8	79265.68	13475.20
5113	254	8	361	8	31370.88	5646.72
5114	816	40	780	3	19224.69	4229.43
5115	451	37	252	7	54047.56	6485.71
5116	254	35	999	9	6176.43	1729.44
5117	254	11	355	10	95703.80	13398.50
5118	254	25	961	9	79892.10	16777.35
5119	254	13	576	8	7980.96	2553.92
5120	254	6	705	2	15187.04	2733.66
5121	254	49	819	9	27549.00	10193.13
5122	254	34	467	3	28586.01	10005.09
5123	254	7	651	3	20346.87	6104.07
5124	254	8	797	6	40948.86	9008.76
5125	565	48	556	2	12445.20	2240.14
5126	254	2	896	1	911.51	182.30
5127	254	29	972	10	24419.50	8302.60
5128	254	27	844	3	27034.17	10543.32
5129	254	23	466	7	50577.10	15678.88
5130	254	35	325	8	55705.44	8912.88
5131	254	20	876	8	9785.36	3816.32
5132	254	39	869	2	18872.98	6416.82
5133	254	25	441	4	27016.68	6754.16
5134	254	39	438	2	13404.44	3083.02
5135	254	32	786	3	13005.09	4941.93
5136	254	12	960	6	4843.80	678.12
5137	254	28	138	5	21990.15	2418.90
5138	254	39	65	9	58892.22	11189.52
5139	254	42	991	7	22738.24	3638.11
5140	254	46	612	8	69380.56	16651.36
5141	254	34	999	1	686.27	192.16
5142	254	41	1000	2	4447.06	1423.06
5143	254	31	749	3	5050.44	1363.62
5144	254	19	347	6	43380.30	9109.86
5145	254	22	789	6	56885.46	13652.52
5146	254	50	350	18	126591.66	49370.76
5147	254	44	668	6	23107.38	6701.16
5148	254	36	77	1	6867.68	1579.57
5149	254	27	810	2	8365.12	3178.74
5150	254	3	224	9	67809.78	8137.17
5151	254	40	563	10	77655.40	10095.20
5152	254	50	7	3	14082.33	2112.36
5153	254	36	146	8	26169.92	3140.40
5154	254	20	298	9	64741.59	9063.81
5155	254	39	803	17	95884.93	13423.88
5156	254	45	821	9	63292.14	21519.36
5157	325	6	495	5	28292.90	8770.80
5158	254	43	341	5	45288.95	10416.45
5159	254	32	114	8	75880.48	21246.56
5160	254	36	14	1	7682.48	1843.80
5161	175	1	795	10	66721.00	22017.90
5162	254	47	340	9	69774.21	19536.75
5163	254	43	332	5	48339.75	12568.35
5164	254	27	487	7	46608.80	13982.64
5165	254	18	592	9	88361.91	16788.78
5166	254	8	334	5	43751.55	10500.35
5167	83	21	483	7	51678.27	8268.54
5168	254	6	941	3	25038.81	8262.81
5169	254	9	679	9	87987.96	32555.52
5170	254	1	798	8	56777.84	21575.60
5171	254	27	458	10	70517.30	20450.00
5172	254	8	168	8	5258.16	578.40
5173	254	5	149	7	44768.71	6715.31
5174	254	43	104	5	30774.85	12002.20
5175	254	25	66	8	17148.16	6687.76
5176	254	33	970	2	436.32	130.90
5177	254	33	478	4	31395.44	4081.40
5178	796	16	258	3	27754.83	10824.39
5179	254	43	207	10	73112.60	24858.30
5180	115	29	613	6	37549.44	5256.90
5181	254	49	610	8	69917.52	8390.08
5182	254	33	696	6	41462.52	11609.52
5183	57	19	646	6	34979.22	10143.96
5184	254	24	433	7	9346.68	3271.31
5185	254	6	704	3	26480.10	9797.64
5186	254	1	909	9	44149.50	11037.42
5187	254	28	400	7	37586.29	10900.05
5188	254	13	599	5	13501.80	4320.60
5189	254	21	445	2	16787.28	2685.96
5190	254	16	813	4	25898.64	6215.68
5191	254	39	778	7	39957.75	15183.98
5192	660	4	300	4	31607.28	10114.32
5193	254	8	630	6	8550.78	2479.74
5194	254	18	181	3	11183.40	3578.70
5195	254	30	406	8	26378.40	8441.12
5196	731	1	269	10	85069.10	17013.80
5197	254	43	715	6	44348.04	4878.30
5198	254	35	418	2	3090.92	525.46
5199	254	41	781	1	3412.20	443.59
5200	254	48	681	8	40978.80	5737.04
5201	254	46	350	8	56262.96	21942.56
5202	254	31	540	10	54810.20	5481.00
5203	254	9	321	10	58139.20	13953.40
5204	254	28	719	6	21331.50	5119.56
5205	254	15	469	3	109.17	32.76
5206	254	42	49	9	81741.96	8991.63
5207	254	14	108	10	61884.20	8663.80
5208	254	46	938	1	3284.44	952.49
5209	254	1	674	6	39696.00	14290.56
5210	254	38	517	7	48693.75	12173.42
5211	254	27	243	7	7349.30	2131.29
5212	254	48	502	5	29918.95	6283.00
5213	254	49	565	3	5575.74	1951.50
5214	254	34	151	5	18248.15	3467.15
5215	254	27	792	1	3591.28	1077.38
5216	254	48	703	7	43778.98	9631.37
5217	254	43	491	10	69990.60	10498.60
5218	254	7	168	4	2629.08	289.20
5219	798	2	954	10	79444.00	27805.40
5220	254	44	887	2	15678.68	5173.96
5221	461	40	465	3	10800.09	2484.03
5222	254	11	813	6	38847.96	9323.52
5223	254	48	472	2	12730.54	1273.06
5224	254	2	399	4	15500.00	3565.00
5225	254	8	105	8	28250.16	8757.52
5226	254	8	535	1	9936.92	3577.29
5227	254	4	422	10	55014.80	9352.50
5228	254	22	530	10	40121.30	6419.40
5229	254	50	552	5	24290.70	9230.45
5230	254	4	434	9	75879.99	14417.19
5231	254	5	461	7	48997.69	5389.72
5232	254	21	387	13	70219.89	21768.11
5233	254	24	304	10	83602.90	13376.50
5234	254	37	452	1	2336.06	700.82
5235	254	45	75	6	23928.42	2392.86
5236	254	48	895	6	31664.58	12032.52
5237	433	30	652	10	42414.80	16965.90
5238	254	1	198	6	45125.46	9476.34
5239	254	5	102	3	14549.37	2327.91
5240	254	26	444	3	29567.04	9461.46
5241	769	26	129	10	87302.30	17460.50
5242	862	32	893	9	56018.07	17925.75
5243	254	40	891	1	7774.69	1243.95
5244	254	24	853	9	62696.61	16928.10
5245	254	5	703	5	31270.70	6879.55
5246	254	7	542	5	47182.60	6605.55
5247	254	28	452	6	14016.36	4204.92
5248	254	9	795	3	20016.30	6605.37
5249	254	2	569	9	37312.20	7835.58
5250	254	31	136	6	32519.58	7479.48
5251	254	21	513	6	42151.50	10959.42
5252	844	42	221	3	19754.37	5926.32
5253	254	24	913	2	6542.00	1242.98
5254	254	40	400	9	48325.23	14014.35
5255	254	15	477	8	9812.00	3336.08
5256	254	13	618	9	62936.19	22657.05
5257	254	16	766	10	15338.20	4448.10
5258	179	14	78	7	45457.30	6364.05
5259	254	41	898	9	45233.01	17188.56
5260	254	32	985	7	52720.22	5272.05
5261	254	48	51	6	32883.42	4274.82
5262	254	14	472	9	57287.43	5728.77
5263	254	6	362	6	56528.70	16958.58
5264	254	23	624	3	28447.20	3413.67
5265	254	9	306	7	50545.67	19712.84
5266	234	31	552	9	43723.26	16614.81
5267	254	32	439	5	20991.55	2728.90
5268	575	36	834	3	10064.07	4025.64
5269	254	48	209	3	4902.30	1764.84
5270	254	37	121	4	27458.68	3020.44
5271	254	46	457	6	9961.44	3088.02
5272	254	1	172	4	436.24	152.68
5273	254	39	565	6	11151.48	3903.00
5274	254	15	705	5	37967.60	6834.15
5275	254	29	712	9	36791.64	6990.39
5276	36	26	470	3	21116.82	4434.54
5277	254	24	332	9	87011.55	22623.03
5278	311	16	4	1	6871.63	1786.62
5279	254	28	695	1	9954.99	3484.25
5280	254	46	799	9	52740.45	14767.29
5281	254	44	728	6	59293.98	15416.46
5282	254	19	812	3	13725.57	3156.87
5283	254	24	571	8	50336.80	5537.04
5284	254	31	1000	8	17788.24	5692.24
5285	254	22	788	8	29292.40	4686.80
5286	254	45	129	19	165874.37	33174.95
5287	254	5	383	6	47086.08	9888.06
5288	254	13	123	1	2162.44	367.61
5289	254	29	238	3	21305.22	8095.98
5290	254	17	329	1	8791.69	2725.42
5291	254	24	471	12	88201.80	22932.48
5292	254	36	436	3	20520.90	5130.21
5293	254	9	811	1	9811.77	3924.71
5294	254	23	712	10	40879.60	7767.10
5295	254	4	755	2	16958.14	3222.04
5296	254	17	317	3	11979.72	4552.29
5297	254	28	554	6	24073.98	7944.42
5298	254	26	7	1	4694.11	704.12
5299	254	41	295	1	4607.56	783.29
5300	254	21	92	4	22816.40	7985.72
5301	254	29	454	9	43550.37	7839.09
5302	254	2	864	9	69587.10	16700.94
5303	254	13	39	1	8865.34	1329.80
5304	254	50	346	6	24046.98	6492.66
5305	254	38	172	10	1090.60	381.70
5306	299	12	296	7	42972.09	10313.31
5307	254	8	476	5	41719.65	12933.10
5308	254	5	12	1	9834.03	1671.79
5309	254	41	760	6	23081.40	7155.24
5310	254	19	504	3	2150.07	408.51
5311	254	30	791	14	38688.58	6963.88
5312	415	7	894	1	5349.62	1551.39
5313	254	38	838	1	5127.85	1128.13
5314	254	35	552	10	48581.40	18460.90
5315	328	45	94	2	17478.86	5243.66
5316	254	3	944	10	44916.20	12127.40
5317	254	40	48	4	16004.56	6241.76
5318	254	49	602	6	20158.56	3830.10
5319	254	27	720	3	9464.85	3312.69
5320	150	30	137	9	57476.88	18392.58
5321	254	47	972	2	4883.90	1660.52
5322	254	30	493	2	4997.74	949.58
5323	254	24	340	2	15505.38	4341.50
5324	254	19	158	6	52423.20	16775.40
5325	254	37	438	7	46915.54	10790.57
5326	254	43	58	8	76474.24	15294.88
5327	254	9	877	2	5846.64	993.92
5328	254	39	392	9	58777.65	21159.99
5329	254	18	782	1	1419.65	184.55
5330	254	43	433	7	9346.68	3271.31
5331	254	29	887	2	15678.68	5173.96
5332	254	34	629	9	50299.02	8047.80
5333	254	18	511	3	4610.16	1475.25
5334	254	14	986	2	15265.76	5037.70
5335	254	2	35	8	23580.32	6366.72
5336	254	40	778	6	34249.50	13014.84
5337	254	1	409	8	49929.20	6990.08
5338	254	10	546	1	5909.67	709.16
5339	254	2	269	5	42534.55	8506.90
5340	254	47	371	3	12357.84	3213.03
5341	254	39	308	2	2558.12	1023.24
5342	254	18	650	3	25008.18	9253.02
5343	193	20	80	4	19238.72	7503.12
5344	856	18	844	6	54068.34	21086.64
5345	254	46	570	2	4247.24	1444.06
5346	254	29	358	1	24.60	7.38
5347	254	20	394	1	6381.39	1340.09
5348	254	9	678	4	13257.56	4905.28
5349	254	47	675	8	3720.88	1339.52
5350	254	37	345	3	29770.80	8633.52
5351	254	7	444	5	49278.40	15769.10
5352	254	41	385	8	45849.04	12379.28
5353	254	41	25	7	42135.87	15168.93
5354	254	10	79	14	126874.02	24106.04
5355	254	18	723	6	31802.46	6360.48
5356	797	3	117	2	7233.82	2893.52
5357	254	15	738	6	13900.62	3058.14
5358	254	40	542	1	9436.52	1321.11
5359	254	17	645	10	1958.40	685.40
5360	254	32	391	3	1700.70	289.11
5361	254	17	270	6	1562.22	515.52
5362	315	38	425	6	16834.86	2861.94
5363	254	10	366	4	851.48	85.16
5364	52	12	555	7	17999.17	2879.87
5365	254	39	446	4	38330.96	11499.28
5366	254	17	632	8	2062.16	433.04
5367	254	14	809	6	25845.36	8787.42
5368	254	36	472	6	38191.62	3819.18
5369	254	31	392	2	13061.70	4702.22
5370	254	47	784	9	81407.79	30934.98
5371	254	18	933	10	80548.40	28997.40
5372	254	43	889	8	35306.16	8120.40
5373	254	41	320	6	43730.22	10932.54
5374	254	19	367	9	1451.43	377.37
5375	254	18	615	5	45825.05	13747.50
5376	254	31	534	8	71888.64	12221.04
5377	254	2	657	1	426.72	68.28
5378	254	34	60	6	16191.60	1781.10
5379	254	34	226	3	13425.69	1745.34
5380	254	12	453	5	45219.10	11304.80
5381	254	15	574	14	118533.10	29633.24
5382	517	24	932	7	22405.46	2240.56
5383	254	3	59	2	7530.88	2033.34
5384	254	17	79	5	45312.15	8609.30
5385	254	24	620	9	34098.30	12275.37
5386	254	13	855	4	7927.32	2140.36
5387	175	1	500	9	52046.82	10409.40
5388	254	48	722	6	57614.58	15555.96
5389	254	47	595	7	57645.77	10376.24
5390	254	32	213	7	7415.80	889.91
5391	254	10	286	9	42336.36	12277.53
5392	254	20	555	14	35998.34	5759.74
5393	254	31	186	4	12975.04	2465.24
5394	254	30	148	4	6582.96	1974.88
5395	254	29	291	3	7209.33	2523.27
5396	241	12	723	5	26502.05	5300.40
5397	254	11	562	10	34565.50	7950.10
5398	254	3	280	10	81337.70	32535.10
5399	254	19	676	1	465.10	139.53
5400	254	48	286	9	42336.36	12277.53
5401	254	12	80	1	4809.68	1875.78
5402	254	32	697	3	3939.84	1418.34
5403	207	29	114	6	56910.36	15934.92
5404	254	8	276	6	57697.80	20771.22
5405	254	11	51	6	32883.42	4274.82
5406	254	32	202	5	43930.75	7468.25
5407	326	24	997	9	41187.78	6178.14
5408	254	45	850	10	86356.00	17271.20
5409	254	5	101	10	84964.50	22940.40
5410	254	4	630	10	14251.30	4132.90
5411	254	19	4	15	103074.45	26799.30
5412	254	28	555	5	12856.55	2057.05
5413	663	38	193	10	51226.70	12806.70
5414	254	50	388	9	50219.82	13057.11
5415	254	31	239	4	8164.92	2531.12
5416	254	23	894	3	16048.86	4654.17
5417	254	44	759	6	25829.16	5424.12
5418	254	10	472	7	44556.89	4455.71
5419	254	20	231	4	28478.20	6834.76
5420	254	31	831	6	2472.54	494.52
5421	254	48	987	12	97039.20	32022.96
5422	254	45	5	3	26182.08	9163.74
5423	254	37	24	8	10414.72	2187.12
5424	254	27	296	7	42972.09	10313.31
5425	254	24	985	1	7531.46	753.15
5426	254	28	512	3	2746.41	274.65
5427	254	2	408	5	49752.05	13930.55
5428	254	28	485	8	56353.76	17469.68
5429	710	28	895	4	21109.72	8021.68
5430	291	2	844	1	9011.39	3514.44
5431	254	13	161	10	76086.80	26630.40
5432	254	19	743	19	84886.11	27163.54
5433	254	6	96	7	55023.92	8803.83
5434	254	49	724	7	64960.91	18189.08
5435	254	22	137	2	12772.64	4087.24
5436	254	42	965	6	40488.12	8907.36
5437	254	19	656	3	3164.64	348.12
5438	254	27	937	16	7775.84	1010.88
5439	254	43	867	6	26553.00	9293.52
5440	254	30	830	3	11098.41	1109.85
5441	254	33	359	10	51681.80	17055.00
5442	487	5	147	9	73443.51	16157.61
5443	684	15	255	10	5110.20	1941.90
5444	254	9	125	6	21147.06	7612.92
5445	254	31	82	1	7169.65	1720.72
5446	254	22	683	2	951.66	314.04
5447	254	25	347	3	21690.15	4554.93
5448	254	6	309	3	4783.65	956.73
5449	254	16	816	4	4787.92	1627.88
5450	254	27	782	3	4258.95	553.65
5451	254	21	809	4	17230.24	5858.28
5452	254	49	493	7	17492.09	3323.53
5453	254	18	189	1	1221.98	244.40
5454	254	23	113	3	3529.44	847.08
5455	254	2	39	10	88653.40	13298.00
5456	12	22	696	8	55283.36	15479.36
5457	254	9	35	5	14737.70	3979.20
5458	254	21	184	8	14302.08	5577.84
5459	254	15	551	9	64023.66	15365.70
5460	284	13	527	2	7500.56	1725.12
5461	254	16	706	2	16453.80	1645.38
5462	254	44	832	7	39056.64	7420.77
5463	254	22	31	2	8425.62	2696.20
5464	254	37	764	6	45472.14	10003.86
5465	254	12	178	4	24740.80	3711.12
5466	760	29	462	6	31136.94	10586.58
5467	126	18	537	3	20826.96	5831.55
5468	254	33	134	7	33843.39	5753.37
5469	254	33	274	8	33483.60	6361.92
5470	254	30	95	10	48017.80	12484.60
5471	254	50	989	1	728.91	204.09
5472	254	42	250	5	18694.20	5982.15
5473	254	19	667	4	21413.36	8565.36
5474	254	50	31	6	25276.86	8088.60
5475	254	26	104	3	18464.91	7201.32
5476	414	14	619	6	6283.38	1068.18
5477	254	36	537	2	13884.64	3887.70
5478	532	24	122	2	15325.20	5057.32
5479	112	49	323	1	2087.73	626.32
5480	254	31	268	1	6880.19	688.02
5481	294	20	672	1	7353.57	1397.18
5482	254	28	826	1	5901.23	1534.32
5483	254	31	946	4	35300.00	12002.00
5484	254	8	132	8	24387.44	8047.84
5485	254	10	69	5	31896.50	9250.00
5486	254	47	79	1	9062.43	1721.86
5487	254	14	408	8	79603.28	22288.88
5488	254	23	495	3	16975.74	5262.48
5489	254	6	420	4	19758.80	5927.64
5490	254	37	393	4	19229.08	6922.48
5491	254	43	359	10	51681.80	17055.00
5492	254	40	576	5	4988.10	1596.20
5493	254	30	563	7	54358.78	7066.64
5494	254	15	426	4	17771.60	3554.32
5495	254	50	273	6	21795.96	4141.26
5496	254	11	863	9	28721.70	10914.21
5497	254	19	799	6	35160.30	9844.86
5498	254	43	822	4	21448.96	5576.72
5499	254	40	664	5	5867.70	645.45
5500	254	10	695	9	89594.91	31358.25
5501	254	5	612	2	17345.14	4162.84
5502	254	20	802	6	18046.92	5414.10
5503	254	39	405	7	38468.08	11925.13
5504	254	50	742	8	58601.44	19924.48
5505	254	10	425	5	14029.05	2384.95
5506	254	6	417	4	20904.72	6480.48
5507	254	21	730	2	17198.90	1891.88
5508	254	24	624	4	37929.60	4551.56
5509	297	39	712	1	4087.96	776.71
5510	254	9	456	9	48523.14	4852.35
5511	254	21	199	1	6037.18	1086.69
5512	254	50	414	7	58127.02	16275.56
5513	254	44	659	6	34937.94	7686.36
5514	254	4	192	9	27497.61	7424.37
5515	254	49	396	2	5382.76	1291.86
5516	254	49	485	3	21132.66	6551.13
5517	523	37	102	3	14549.37	2327.91
5518	254	40	823	9	74857.14	20211.39
5519	254	8	401	5	5813.05	1162.60
5520	254	8	793	10	66466.80	19275.40
5521	254	18	695	10	99549.90	34842.50
5522	254	3	532	9	80612.73	9673.56
5523	254	43	503	10	37317.60	8583.00
5524	254	29	157	9	12904.02	3355.02
5525	254	37	785	5	23255.15	6976.55
5526	254	12	384	8	78687.20	8655.60
5527	254	7	96	3	23581.68	3773.07
5528	254	40	109	1	3858.49	1041.79
5529	254	1	594	3	21806.22	7196.04
5530	254	3	475	10	57218.70	16593.40
5531	83	44	878	3	18459.93	2399.79
5532	254	9	39	3	26596.02	3989.40
5533	254	4	765	4	118.44	26.04
5534	760	16	435	2	14688.46	4406.54
5535	254	15	264	9	81584.55	11421.81
5536	254	44	633	10	68838.70	26158.70
5537	254	39	991	6	19489.92	3118.38
5538	254	41	755	3	25437.21	4833.06
5539	365	12	426	4	17771.60	3554.32
5540	254	13	37	10	94700.00	9470.00
5541	254	20	681	8	40978.80	5737.04
5542	254	21	954	6	47666.40	16683.24
5543	254	17	776	4	21883.88	5908.64
5544	254	18	306	12	86649.72	33793.44
5545	254	36	516	6	20735.40	7464.72
5546	254	26	46	7	69442.31	15277.29
5547	254	48	942	4	7162.84	1074.44
5548	254	40	780	3	19224.69	4229.43
5549	254	36	738	4	9267.08	2038.76
5550	254	36	318	10	36924.00	7384.80
5551	254	11	292	1	7914.96	2295.34
5552	254	8	34	13	69963.79	24487.32
5553	254	12	167	6	44796.66	5375.58
5554	254	30	710	10	83966.30	33586.50
5555	254	22	112	10	26117.50	2611.70
5556	254	27	488	5	48131.25	5294.45
5557	254	6	797	3	20474.43	4504.38
5558	853	31	538	8	47058.72	6588.24
5559	254	47	467	1	9528.67	3335.03
5560	254	44	897	4	8069.80	3147.24
5561	254	39	425	7	19640.67	3338.93
5562	254	7	959	8	55196.88	13247.28
5563	254	18	468	1	2094.46	251.34
5564	254	7	846	10	66806.50	19373.90
5565	254	21	888	1	5757.79	1554.60
5566	254	45	367	10	1612.70	419.30
5567	254	19	614	2	19580.56	4699.34
5568	254	1	598	9	19841.49	5158.80
5569	254	38	487	4	26633.60	7990.08
5570	254	35	738	1	2316.77	509.69
5571	773	48	935	6	18379.68	2940.72
5572	254	9	68	1	7772.38	2953.50
5573	254	13	211	4	6963.00	2367.44
5574	254	43	361	5	19606.80	3529.20
5575	254	19	428	7	31865.05	11152.75
5576	254	12	214	8	4384.16	832.96
5577	254	25	507	5	36596.85	10247.10
5578	254	36	342	8	63614.48	18448.16
5579	254	39	612	6	52035.42	12488.52
5580	254	8	774	3	26144.85	4967.52
5581	798	2	839	2	18441.40	2028.56
5582	254	23	237	2	15663.54	3602.62
5583	254	34	585	10	53740.80	5911.50
5584	254	5	765	1	29.61	6.51
5585	254	5	141	5	30348.35	4855.75
5586	254	25	794	8	37761.12	4908.96
5587	254	21	539	6	25605.18	5377.08
5588	254	2	221	10	65847.90	19754.40
5589	254	46	767	9	58087.26	19749.69
5590	254	25	425	1	2805.81	476.99
5591	254	48	935	6	18379.68	2940.72
5592	254	45	980	3	22718.76	4543.74
5593	254	15	996	1	8020.43	2325.92
5594	254	50	685	10	2570.00	1028.00
5595	16	4	20	3	8080.77	1616.16
5596	254	12	126	8	34085.92	4090.32
5597	254	11	739	2	15099.28	3623.82
5598	254	48	190	10	56688.50	15872.80
5599	136	41	748	9	33708.24	5393.34
5600	241	12	520	5	2702.05	1026.80
5601	802	45	245	1	8009.90	2322.87
5602	696	30	474	9	45104.85	7216.74
5603	50	45	77	1	6867.68	1579.57
5604	254	31	301	10	26588.90	5583.70
5605	254	4	867	8	35404.00	12391.36
5606	254	41	661	9	12174.30	4139.28
5607	254	49	941	4	33385.08	11017.08
5608	254	11	34	10	53818.30	18836.40
5609	254	25	559	7	43004.22	12041.19
5610	254	39	593	1	485.35	179.58
5611	254	14	409	8	49929.20	6990.08
5612	254	21	4	7	48101.41	12506.34
5613	254	38	160	5	2621.60	838.90
5614	254	49	660	2	8850.22	3274.58
5615	254	3	631	1	2653.69	291.91
5616	254	8	28	10	77100.10	14649.00
5617	699	26	801	7	17090.64	2392.67
5618	254	28	109	8	30867.92	8334.32
5619	254	43	252	9	69489.72	8338.77
5620	177	14	102	10	48497.90	7759.70
5621	254	50	505	2	5195.48	1091.06
5622	254	6	983	9	31385.88	5021.73
5623	254	45	844	4	36045.56	14057.76
5624	254	6	510	5	27767.15	3609.75
5625	254	5	758	9	42949.71	16750.35
5626	254	16	641	4	25130.56	7790.48
5627	254	29	40	7	31150.84	6853.21
5628	254	7	911	1	2362.02	543.26
5629	593	23	245	9	72089.10	20905.83
5630	326	24	762	3	16085.07	1769.37
5631	254	49	830	4	14797.88	1479.80
5632	254	23	540	2	10962.04	1096.20
5633	254	42	800	2	19598.14	3527.66
5634	254	38	472	10	63652.70	6365.30
5635	254	49	781	9	30709.80	3992.31
5636	338	22	600	1	2367.99	781.44
5637	254	37	668	3	11553.69	3350.58
5638	254	22	115	2	8981.46	1886.10
5639	254	24	264	2	18129.90	2538.18
5640	254	4	93	6	30107.64	9634.44
5641	220	3	562	1	3456.55	795.01
5642	254	2	615	3	27495.03	8248.50
5643	138	42	401	9	10463.49	2092.68
5644	254	32	247	5	31340.00	4387.60
5645	818	6	567	2	14669.80	1613.68
5646	254	12	27	8	36713.52	12482.56
5647	254	7	189	4	4887.92	977.60
5648	254	46	807	12	64545.24	22590.84
5649	254	14	793	5	33233.40	9637.70
5650	254	37	778	5	28541.25	10845.70
5651	254	37	459	1	597.09	208.98
5652	254	8	522	8	65719.04	17086.96
5653	254	20	859	6	44641.56	16517.40
5654	254	1	841	10	76182.30	25902.00
5655	254	10	714	3	26192.79	9953.25
5656	254	18	983	3	10461.96	1673.91
5657	254	24	671	2	5147.96	772.20
5658	254	42	729	10	55190.20	19316.60
5659	36	26	696	5	34552.10	9674.60
5660	254	38	27	5	22945.95	7801.60
5661	254	15	79	2	18124.86	3443.72
5662	254	33	127	7	41747.23	15863.96
5663	254	31	644	4	3422.72	1163.72
5664	254	42	134	1	4834.77	821.91
5665	433	30	300	7	55312.74	17700.06
5666	254	10	622	3	11664.75	1166.46
5667	254	26	611	3	20761.95	7266.69
5668	254	46	349	4	19616.36	5688.76
5669	254	48	614	8	78322.24	18797.36
5670	569	48	611	2	13841.30	4844.46
5671	254	26	516	9	31103.10	11197.08
5672	66	14	197	6	32416.26	8104.08
5673	254	38	882	10	8772.00	2017.60
5674	254	18	551	10	71137.40	17073.00
5675	254	26	134	5	24173.85	4109.55
5676	254	36	993	4	28805.76	7201.44
5677	254	43	661	6	8116.20	2759.52
5678	254	33	458	16	112827.68	32720.00
5679	254	32	543	2	7986.96	2236.34
5680	349	10	765	1	29.61	6.51
5681	254	7	70	3	6807.84	1225.41
5682	254	1	57	9	28776.87	6906.42
5683	734	18	891	1	7774.69	1243.95
5684	738	40	461	4	27998.68	3079.84
5685	254	49	288	3	2981.82	954.18
5686	254	16	370	6	8035.50	1446.42
5687	254	35	564	4	25648.56	2821.36
5688	254	18	42	2	10523.16	3472.64
5689	254	2	543	5	19967.40	5590.85
5690	532	24	612	5	43362.85	10407.10
5691	254	17	761	6	59071.86	18903.00
5692	254	28	28	8	61680.08	11719.20
5693	254	2	90	4	22619.20	5428.60
5694	254	31	813	6	38847.96	9323.52
5695	605	20	643	8	57443.60	13212.00
5696	254	33	659	4	23291.96	5124.24
5697	254	32	897	18	36314.10	14162.58
5698	254	4	835	6	14725.44	3828.60
5699	254	21	736	5	32511.35	3576.25
5700	254	49	213	10	10594.00	1271.30
5701	254	47	251	7	39888.31	12365.36
5702	254	9	647	6	41869.62	4605.66
5703	254	11	778	11	62790.75	23860.54
5704	254	39	501	6	50054.52	17519.10
5705	254	37	761	8	78762.48	25204.00
5706	262	31	533	1	3276.33	1245.01
5707	254	39	457	12	19922.88	6176.04
5708	254	49	981	4	7084.24	1700.20
5709	806	3	831	8	3296.72	659.36
5710	769	26	375	5	36693.75	14677.50
5711	254	5	926	13	68946.28	19305.00
5712	254	22	272	7	20697.81	3932.60
5713	254	48	680	4	39721.96	10327.72
5714	509	11	135	7	37474.78	5621.21
5715	254	6	544	13	116744.81	28018.77
5716	694	12	715	9	66522.06	7317.45
5717	254	35	991	2	6496.64	1039.46
5718	254	21	339	10	74859.70	27698.10
5719	254	30	93	1	5017.94	1605.74
5720	251	49	184	2	3575.52	1394.46
5721	254	21	622	1	3888.25	388.82
5722	254	29	390	7	11462.29	1834.00
5723	254	30	687	10	19141.90	4976.90
5724	254	10	554	5	20061.65	6620.35
5725	254	40	907	1	50.14	6.02
5726	254	44	622	5	19441.25	1944.10
5727	254	25	776	10	54709.70	14771.60
5728	254	42	302	9	58701.96	23480.82
5729	254	36	664	9	10561.86	1161.81
5730	254	11	362	3	28264.35	8479.29
5731	254	44	783	9	76861.26	26132.85
5732	254	50	329	6	52750.14	16352.52
5733	254	38	976	4	418.96	117.32
5734	254	31	324	7	41395.55	9107.00
5735	254	50	614	2	19580.56	4699.34
5736	254	23	332	1	9667.95	2513.67
5737	254	47	735	10	89347.20	31271.50
5738	254	42	642	7	33748.75	11137.07
5739	254	34	595	6	49410.66	8893.92
5740	397	43	171	8	73393.52	24953.76
5741	254	17	932	1	3200.78	320.08
5742	254	37	344	10	10376.70	1867.80
5743	254	46	170	4	37130.24	14109.48
5744	254	27	936	1	4628.67	1481.17
5745	254	2	143	9	36847.44	14002.02
5746	254	25	125	1	3524.51	1268.82
5747	254	22	774	5	43574.75	8279.20
5748	254	45	941	1	8346.27	2754.27
5749	254	34	220	2	9448.62	1984.22
5750	254	16	176	5	24430.80	8306.45
5751	254	4	589	5	27502.90	11001.15
5752	254	3	467	7	66700.69	23345.21
5753	254	35	428	10	45521.50	15932.50
5754	254	42	370	6	8035.50	1446.42
5755	277	39	413	6	10229.82	2455.14
5756	395	11	570	4	8494.48	2888.12
5757	254	26	66	7	15004.64	5851.79
5758	254	25	565	6	11151.48	3903.00
5759	254	8	838	3	15383.55	3384.39
5760	254	11	506	6	3296.46	1186.74
5761	254	38	776	4	21883.88	5908.64
5762	254	43	655	9	62253.36	11205.63
5763	254	19	5	10	87273.60	30545.80
5764	254	25	910	2	5719.84	1143.96
5765	254	34	507	8	58554.96	16395.36
5766	254	35	216	4	19999.24	5599.80
5767	254	6	235	2	11429.30	2514.44
5768	254	17	370	8	10714.00	1928.56
5769	254	8	7	1	4694.11	704.12
5770	254	35	126	8	34085.92	4090.32
5771	254	33	614	5	48951.40	11748.35
5772	254	48	363	12	93307.44	11196.84
5773	254	20	233	4	18156.44	6354.76
5774	254	16	618	9	62936.19	22657.05
5775	254	2	744	10	8587.50	1975.10
5776	254	13	255	10	5110.20	1941.90
5777	66	37	461	9	62997.03	6929.64
5778	254	19	590	8	72492.80	9424.08
5779	254	4	339	6	44915.82	16618.86
5780	254	39	653	9	31562.55	6628.14
5781	254	31	104	1	6154.97	2400.44
5782	155	45	338	2	6221.18	2488.48
5783	254	47	165	3	7441.05	2009.07
5784	272	46	481	6	59583.12	11916.60
5785	254	16	935	11	33696.08	5391.32
5786	254	17	457	10	16602.40	5146.70
5787	720	43	201	3	12128.10	2183.07
5788	529	31	573	1	1604.43	497.37
5789	254	46	905	7	6666.59	1599.99
5790	415	7	402	2	7765.94	1164.90
5791	254	31	581	7	35324.73	8831.20
5792	254	21	857	6	20642.82	2064.30
5793	254	44	720	7	22084.65	7729.61
5794	254	46	933	9	72493.56	26097.66
5795	254	45	400	6	32216.82	9342.90
5796	254	26	997	10	45764.20	6864.60
5797	254	5	85	9	32082.03	8982.99
5798	254	4	922	9	82675.44	18188.64
5799	254	22	331	7	15023.82	5258.33
5800	254	43	255	2	1022.04	388.38
5801	254	37	258	6	55509.66	21648.78
5802	254	41	38	7	34251.14	9247.84
5803	254	29	549	6	35881.56	9688.02
5804	254	36	730	9	77395.05	8513.46
5805	254	48	806	4	20132.52	6845.04
5806	254	48	697	4	5253.12	1891.12
5807	254	9	573	8	12835.44	3978.96
5808	254	4	326	7	53992.75	9718.73
5809	254	34	640	3	16521.78	4791.33
5810	254	1	54	10	1437.30	431.20
5811	254	45	78	8	51951.20	7273.20
5812	254	15	900	12	17900.28	6623.16
5813	254	39	913	3	9813.00	1864.47
5814	254	18	448	10	45190.30	10845.70
5815	254	40	556	3	18667.80	3360.21
5816	254	7	112	6	15670.50	1567.02
5817	254	13	99	10	47246.60	18898.60
5818	254	49	923	1	3256.50	814.12
5819	254	43	695	5	49774.95	17421.25
5820	254	28	792	6	21547.68	6464.28
5821	254	20	690	10	52585.30	10517.10
5822	254	23	88	4	7002.44	2030.72
5823	254	33	268	5	34400.95	3440.10
5824	254	3	82	1	7169.65	1720.72
5825	254	11	918	4	11772.32	3413.96
5826	254	35	634	7	48472.97	12118.26
5827	254	41	84	9	17266.05	1899.27
5828	254	4	350	1	7032.87	2742.82
5829	874	9	270	7	1822.59	601.44
5830	254	47	14	8	61459.84	14750.40
5831	254	4	397	6	32770.08	3604.68
5832	254	15	308	10	12790.60	5116.20
5833	254	27	678	4	13257.56	4905.28
5834	254	20	889	10	44132.70	10150.50
5835	254	31	903	7	54375.30	16856.35
5836	254	38	774	5	43574.75	8279.20
5837	254	19	929	8	12514.16	3504.00
5838	254	8	279	7	25063.85	5764.71
5839	254	5	956	4	33352.52	9338.72
5840	254	13	53	1	9774.99	1075.25
5841	254	22	810	8	33460.48	12714.96
5842	254	17	592	13	127633.87	24250.46
5843	254	11	178	9	55666.80	8350.02
5844	254	42	423	3	26867.49	4836.15
5845	191	44	459	5	2985.45	1044.90
5846	254	9	857	10	34404.70	3440.50
5847	254	22	172	4	436.24	152.68
5848	254	37	326	6	46279.50	8330.34
5849	254	45	401	9	10463.49	2092.68
5850	254	20	131	7	3314.15	1226.26
5851	254	31	111	4	37228.60	7073.44
5852	254	19	476	8	66751.44	20692.96
5853	254	13	50	5	9890.45	2571.50
5854	254	36	173	9	57711.87	20776.23
5855	254	28	449	5	43470.60	6520.60
5856	254	50	390	3	4912.41	786.00
5857	254	28	437	2	10832.32	3791.32
5858	254	45	495	3	16975.74	5262.48
5859	254	23	15	3	15842.94	3643.89
5860	254	11	144	2	15043.20	4212.10
5861	254	26	698	10	32865.40	3615.20
5862	254	1	341	9	81520.11	18749.61
5863	254	48	854	1	4165.78	1458.02
5864	254	32	357	9	84658.68	26244.18
5865	254	28	999	5	3431.35	960.80
5866	477	12	383	4	31390.72	6592.04
5867	254	40	803	6	33841.74	4737.84
5868	254	5	501	10	83424.20	29198.50
5869	595	37	706	4	32907.60	3290.76
5870	107	8	86	7	50694.21	5576.34
5871	254	27	71	14	53651.64	11266.78
5872	723	5	92	9	51336.90	17967.87
5873	254	38	977	5	42564.20	9364.10
5874	254	31	500	7	40480.86	8096.20
5875	259	1	646	7	40809.09	11834.62
5876	262	31	916	8	22471.12	3820.08
5877	254	2	122	1	7662.60	2528.66
5878	254	33	941	9	75116.43	24788.43
5879	254	48	504	10	7166.90	1361.70
5880	624	34	163	2	6740.38	1752.50
5881	254	4	227	5	37055.25	12228.25
5882	254	35	91	7	69607.09	16009.63
5883	744	1	956	10	83381.30	23346.80
5884	36	26	450	3	25218.39	6556.77
5885	254	25	151	9	32846.67	6240.87
5886	254	14	11	7	17128.86	6851.53
5887	254	36	100	1	5732.97	1203.92
5888	315	38	689	1	4540.03	1452.81
5889	254	12	813	4	25898.64	6215.68
5890	254	50	938	4	13137.76	3809.96
5891	254	18	382	6	13015.80	2212.68
5892	61	8	774	3	26144.85	4967.52
5893	254	19	511	3	4610.16	1475.25
5894	254	29	579	10	54302.20	19548.80
5895	147	34	428	10	45521.50	15932.50
5896	254	26	537	3	20826.96	5831.55
5897	254	39	470	4	28155.76	5912.72
5898	615	12	464	4	2084.84	729.68
5899	254	44	412	3	24020.97	2882.52
5900	254	21	189	8	9775.84	1955.20
5901	254	37	911	4	9448.08	2173.04
5902	254	50	833	6	23825.94	7386.06
5903	254	25	175	10	99082.10	16844.00
5904	254	20	356	8	35669.44	6777.20
5905	254	31	36	9	64786.59	18140.22
5906	254	30	503	4	14927.04	3433.20
5907	254	30	11	2	4893.96	1957.58
5908	254	26	746	8	36368.88	13456.48
5909	254	42	563	10	77655.40	10095.20
5910	377	49	297	2	15459.36	2628.10
5911	254	22	542	1	9436.52	1321.11
5912	254	50	883	5	12588.90	4280.25
5913	254	28	325	1	6963.18	1114.11
5914	254	21	762	7	37531.83	4128.53
5915	254	36	653	8	28055.60	5891.68
5916	346	45	925	4	19954.84	3192.76
5917	254	16	578	8	17907.84	2148.96
5918	254	35	996	9	72183.87	20933.28
5919	254	36	858	6	58010.04	20303.52
5920	669	29	558	9	89527.68	30439.44
5921	254	9	854	1	4165.78	1458.02
5922	254	28	98	2	1941.56	504.80
5923	254	21	854	1	4165.78	1458.02
5924	254	8	733	7	63733.04	14658.63
5925	254	23	347	6	43380.30	9109.86
5926	485	27	559	5	30717.30	8600.85
5927	254	45	22	5	13999.90	1400.00
5928	258	27	216	10	49998.10	13999.50
5929	254	27	516	1	3455.90	1244.12
5930	254	6	791	1	2763.47	497.42
5931	254	43	979	4	35637.24	11760.28
5932	254	49	316	3	11363.64	4090.92
5933	254	33	45	5	44272.35	6198.15
5934	254	12	829	6	48967.14	14200.50
5935	41	37	465	2	7200.06	1656.02
5936	254	9	762	7	37531.83	4128.53
5937	254	50	434	11	92742.21	17621.01
5938	254	25	960	10	8073.00	1130.20
5939	254	36	374	7	11591.44	2434.18
5940	254	50	143	6	24564.96	9334.68
5941	254	9	643	6	43082.70	9909.00
5942	254	33	653	9	31562.55	6628.14
5943	254	21	919	8	72794.48	10191.20
5944	254	25	624	20	189648.00	22757.80
5945	254	28	808	1	9184.83	2020.66
5946	254	13	975	9	11245.68	1461.96
5947	254	13	678	10	33143.90	12263.20
5948	254	17	894	1	5349.62	1551.39
5949	254	14	719	3	10665.75	2559.78
5950	254	33	214	8	4384.16	832.96
5951	254	2	304	4	33441.16	5350.60
5952	254	46	209	3	4902.30	1764.84
5953	254	18	885	6	5610.60	2132.04
5954	254	39	35	6	17685.24	4775.04
5955	254	43	523	6	48608.16	18957.18
5956	254	6	276	5	48081.50	17309.35
5957	254	13	80	9	43287.12	16882.02
5958	254	23	593	4	1941.40	718.32
5959	254	21	342	8	63614.48	18448.16
5960	254	15	86	9	65178.27	7169.58
5961	254	50	368	5	21285.25	6598.45
5962	254	17	728	7	69176.31	17985.87
5963	254	11	89	2	11558.54	4276.66
5964	254	28	120	4	31812.20	7316.80
5965	254	46	552	8	38865.12	14768.72
5966	254	21	780	4	25632.92	5639.24
5967	254	31	843	7	64131.62	14108.99
5968	254	40	465	5	18000.15	4140.05
5969	254	40	759	7	30134.02	6328.14
5970	254	26	944	7	31441.34	8489.18
5971	254	22	603	10	26163.90	7849.20
5972	254	37	673	5	26260.50	7615.55
5973	254	17	432	3	4764.27	1095.78
5974	254	23	73	3	7066.17	847.95
5975	597	42	98	8	7766.24	2019.20
5976	254	49	298	7	50354.57	7049.63
5977	254	8	859	6	44641.56	16517.40
5978	254	46	776	6	32825.82	8862.96
5979	254	23	405	2	10990.88	3407.18
5980	254	20	512	2	1830.94	183.10
5981	337	26	698	5	16432.70	1807.60
5982	870	21	226	1	4475.23	581.78
5983	254	13	905	8	7618.96	1828.56
5984	254	34	423	7	62690.81	11284.35
5985	254	15	813	1	6474.66	1553.92
5986	33	4	201	2	8085.40	1455.38
5987	254	7	376	4	21546.08	5817.44
5988	254	9	914	1	5332.95	2079.85
5989	254	1	776	1	5470.97	1477.16
5990	254	11	519	8	2850.16	1026.08
5991	254	16	445	10	83936.40	13429.80
5992	254	47	671	6	15443.88	2316.60
5993	671	18	389	2	1921.80	749.50
5994	254	50	326	10	77132.50	13883.90
5995	254	35	586	9	60031.53	7804.08
5996	254	33	483	5	36913.05	5906.10
5997	254	6	686	5	17098.70	4274.70
5998	254	50	255	4	2044.08	776.76
5999	254	14	547	6	44546.16	5791.02
6000	254	21	932	2	6401.56	640.16
6001	254	49	554	8	32098.64	10592.56
6002	254	25	120	8	63624.40	14633.60
6003	254	38	702	3	26497.89	7419.42
6004	254	47	853	10	69662.90	18809.00
6005	254	23	694	10	484.80	72.70
6006	254	47	211	9	15666.75	5326.74
6007	254	40	684	1	8229.53	1563.61
6008	254	19	173	8	51299.44	18467.76
6009	254	26	192	9	27497.61	7424.37
6010	254	23	655	7	48419.28	8715.49
6011	254	42	750	20	7347.80	2351.20
6012	254	34	804	1	4531.85	1722.10
6013	95	1	262	8	60486.08	18145.84
6014	254	5	588	10	16636.30	4325.40
6015	814	21	90	1	5654.80	1357.15
6016	254	33	344	17	17640.39	3175.26
6017	254	50	974	5	42857.40	14571.50
6018	254	11	406	3	9891.90	3165.42
6019	833	6	950	8	46128.88	13377.36
6020	254	46	139	1	9047.48	1899.97
6021	254	19	47	10	41476.30	16590.50
6022	254	35	258	7	64761.27	25256.91
6023	254	49	427	8	15158.16	2728.48
6024	254	49	185	6	46329.24	9265.86
6025	254	20	353	4	8754.64	2451.28
6026	331	11	242	4	39988.68	13196.28
6027	254	25	315	10	44231.70	10173.30
6028	254	11	705	8	60748.16	10934.64
6029	254	32	8	5	16772.90	4528.70
6030	254	48	789	7	66366.37	15927.94
6031	254	49	723	10	53004.10	10600.80
6032	254	6	967	9	86734.98	30357.27
6033	844	12	244	8	49151.68	19169.12
6034	254	15	857	5	17202.35	1720.25
6035	833	6	898	6	30155.34	11459.04
6036	167	3	846	4	26722.60	7749.56
6037	254	30	360	10	16674.30	2834.60
6038	254	20	493	10	24988.70	4747.90
6039	254	28	979	2	17818.62	5880.14
6040	254	27	169	9	66919.86	10707.21
6041	254	23	612	8	69380.56	16651.36
6042	254	37	592	7	68725.93	13057.94
6043	254	42	55	6	51876.00	6225.12
6044	254	16	110	10	93508.70	15896.50
6045	254	46	394	9	57432.51	12060.81
6046	524	50	202	6	52716.90	8961.90
6047	254	44	893	5	31121.15	9958.75
6048	254	1	878	4	24613.24	3199.72
6049	254	49	734	9	12261.33	4781.88
6050	254	17	34	2	10763.66	3767.28
6051	254	32	161	3	22826.04	7989.12
6052	254	9	25	6	36116.46	13001.94
6053	254	22	366	7	1490.09	149.03
6054	254	7	796	6	40490.52	6883.38
6055	254	47	632	10	2577.70	541.30
6056	832	20	886	4	4990.48	1896.40
6057	254	33	746	5	22730.55	8410.30
6058	254	26	69	5	31896.50	9250.00
6059	254	30	745	5	40777.65	6932.20
6060	254	4	525	9	62003.70	22321.35
6061	618	6	624	3	28447.20	3413.67
6062	254	9	783	4	34160.56	11614.60
6063	254	4	172	6	654.36	229.02
6064	254	9	683	9	4282.47	1413.18
6065	254	23	661	2	2705.40	919.84
6066	856	18	569	6	24874.80	5223.72
6067	254	4	17	3	5706.78	627.75
6068	220	3	107	8	67935.28	21739.28
6069	171	36	328	6	47769.54	15286.26
6070	254	33	390	7	11462.29	1834.00
6071	254	47	193	10	51226.70	12806.70
6072	254	20	248	3	8467.56	2286.24
6073	254	23	170	1	9282.56	3527.37
6074	254	3	809	8	34460.48	11716.56
6075	254	50	394	9	57432.51	12060.81
6076	254	16	854	10	41657.80	14580.20
6077	254	14	516	7	24191.30	8708.84
6078	254	35	452	7	16352.42	4905.74
6079	254	23	144	10	75216.00	21060.50
6080	254	33	398	2	5532.88	1217.24
6081	254	11	848	6	26621.10	6389.04
6082	254	10	922	7	64303.12	14146.72
6083	254	49	152	8	19452.64	3112.40
6084	254	19	438	1	6702.22	1541.51
6085	254	24	293	2	9869.96	1974.00
6086	254	25	16	10	40058.00	7210.40
6087	254	41	409	3	18723.45	2621.28
6088	254	4	39	14	124114.76	18617.20
6089	254	31	426	10	44429.00	8885.80
6090	254	3	360	5	8337.15	1417.30
6091	254	7	222	9	77746.86	7774.65
6092	254	13	349	6	29424.54	8533.14
6093	254	15	814	9	77078.70	26977.50
6094	254	38	710	6	50379.78	20151.90
6095	254	44	92	9	51336.90	17967.87
6096	799	5	710	6	50379.78	20151.90
6097	254	43	388	3	16739.94	4352.37
6098	254	1	544	1	8980.37	2155.29
6099	254	11	807	6	32272.62	11295.42
6100	254	31	729	5	27595.10	9658.30
6101	254	44	415	10	65255.10	7830.60
6102	254	20	851	3	12913.23	1807.86
6103	254	7	72	6	46809.96	7489.62
6104	254	42	662	9	22833.72	4566.78
6105	254	35	942	3	5372.13	805.83
6106	1	6	331	8	17170.08	6009.52
6107	254	23	275	1	7301.42	2336.45
6108	254	41	125	7	24671.57	8881.74
6109	254	42	921	13	57331.30	20065.89
6110	254	2	26	8	29301.60	2930.16
6111	254	39	248	1	2822.52	762.08
6112	254	27	554	12	48147.96	15888.84
6113	254	21	711	10	33870.50	5080.60
6114	687	4	567	1	7334.90	806.84
6115	254	23	650	10	83360.60	30843.40
6116	254	32	925	10	49887.10	7981.90
6117	254	7	170	3	27847.68	10582.11
6118	254	10	187	8	11994.08	1319.36
6119	254	5	983	3	10461.96	1673.91
6120	254	15	1	10	57369.40	18931.90
6121	254	11	543	6	23960.88	6709.02
6122	254	24	957	10	51479.10	7207.10
6123	254	9	163	2	6740.38	1752.50
6124	254	44	988	10	34786.60	6609.50
6125	254	7	789	8	75847.28	18203.36
6126	798	2	868	1	3684.52	773.75
6127	254	1	452	10	23360.60	7008.20
6128	254	27	790	18	76219.56	24390.18
6129	254	10	775	9	1853.64	240.93
6130	254	2	361	8	31370.88	5646.72
6131	254	25	745	11	89710.83	15250.84
6132	254	45	724	8	74241.04	20787.52
6133	254	7	192	9	27497.61	7424.37
6134	254	34	190	1	5668.85	1587.28
6135	254	28	662	7	17759.56	3551.94
6136	254	1	851	1	4304.41	602.62
6137	254	23	269	6	51041.46	10208.28
6138	731	19	495	7	39610.06	12279.12
6139	254	17	568	10	85539.00	26517.10
6140	254	39	436	8	54722.40	13680.56
6141	254	7	576	4	3990.48	1276.96
6142	254	48	222	6	51831.24	5183.10
6143	254	2	429	2	9506.04	2091.32
6144	254	16	772	1	4915.51	1376.34
6145	254	37	328	9	71654.31	22929.39
6146	254	33	549	9	53822.34	14532.03
6147	254	7	11	6	14681.88	5872.74
6148	254	30	511	2	3073.44	983.50
6149	254	23	613	6	37549.44	5256.90
6150	254	30	475	1	5721.87	1659.34
6151	167	3	218	2	15255.10	1830.62
6152	254	6	543	7	27954.36	7827.19
6153	254	44	267	5	32353.10	6794.15
6154	254	11	588	9	14972.67	3892.86
6155	254	2	676	3	1395.30	418.59
6156	254	33	566	1	3255.35	976.61
6157	254	6	185	4	30886.16	6177.24
6158	350	10	334	9	78752.79	18900.63
6159	254	18	780	10	64082.30	14098.10
6160	254	23	355	5	47851.90	6699.25
6161	254	1	728	5	49411.65	12847.05
6162	254	40	438	4	26808.88	6166.04
6163	254	16	502	3	17951.37	3769.80
6164	254	4	197	6	32416.26	8104.08
6165	254	16	119	4	6855.28	1782.36
6166	99	43	797	10	68248.10	15014.60
6167	671	18	995	9	86621.22	23387.76
6168	816	40	117	5	18084.55	7233.80
6169	254	21	934	3	246.78	34.56
6170	254	2	409	7	43688.05	6116.32
6171	254	5	135	1	5353.54	803.03
6172	254	8	628	1	4028.21	966.77
6173	254	33	550	1	4666.03	559.92
6174	254	4	209	13	21243.30	7647.64
6175	254	31	108	7	43318.94	6064.66
6176	254	48	359	1	5168.18	1705.50
6177	254	25	284	10	17061.00	2047.30
6178	254	25	813	5	32373.30	7769.60
6179	254	29	379	9	61188.03	6730.65
6180	254	36	579	9	48871.98	17593.92
6181	254	32	827	8	14566.16	2476.24
6182	254	9	106	3	25962.18	4673.19
6183	254	39	711	7	23709.35	3556.42
6184	254	47	82	2	14339.30	3441.44
6185	508	10	122	1	7662.60	2528.66
6186	254	31	468	4	8377.84	1005.36
6187	254	37	322	2	15519.76	6052.70
6188	254	11	641	9	56543.76	17528.58
6189	254	46	763	5	18936.95	5491.70
6190	254	29	278	1	8210.32	2463.10
6191	254	46	748	8	29962.88	4794.08
6192	254	12	606	7	64608.04	24551.03
6193	254	20	234	12	71840.88	10776.12
6194	254	37	26	7	25638.90	2563.89
6195	254	35	313	1	9361.33	3463.69
6196	254	38	82	1	7169.65	1720.72
6197	418	4	431	10	20898.70	5015.70
6198	254	26	758	10	47721.90	18611.50
6199	720	36	67	5	34982.80	5597.25
6200	254	26	947	10	33736.70	5397.90
6201	346	45	286	3	14112.12	4092.51
6202	254	31	789	3	28442.73	6826.26
6203	254	7	410	2	2492.58	947.18
6204	254	17	336	7	29344.42	3814.79
6205	254	34	265	6	8008.68	1281.36
6206	254	9	825	3	3367.62	976.62
6207	254	34	31	5	21064.05	6740.50
6208	654	44	777	5	48801.50	10736.35
6209	254	1	20	7	18855.13	3771.04
6210	254	39	751	8	20464.32	7776.48
6211	254	25	250	1	3738.84	1196.43
6212	254	3	103	10	27283.90	6002.50
6213	254	8	380	7	18356.66	4222.05
6214	254	42	854	10	41657.80	14580.20
6215	254	19	810	5	20912.80	7946.85
6216	254	41	443	5	13516.65	3244.00
6217	254	27	490	4	19203.88	2688.56
6218	251	49	644	9	7701.12	2618.37
6219	254	28	126	2	8521.48	1022.58
6220	254	15	771	2	4174.46	459.20
6221	254	48	403	8	5550.72	610.56
6222	748	39	439	10	41983.10	5457.80
6223	94	31	310	4	5242.56	524.24
6224	254	14	996	6	48122.58	13955.52
6225	254	3	781	3	10236.60	1330.77
6226	254	43	51	9	49325.13	6412.23
6227	254	22	791	4	11053.88	1989.68
6228	254	12	216	6	29998.86	8399.70
6229	254	16	736	5	32511.35	3576.25
6230	254	34	364	1	6263.89	1628.61
6231	254	37	147	4	32641.56	7181.16
6232	254	42	95	6	28810.68	7490.76
6233	254	5	802	4	12031.28	3609.40
6234	524	50	434	4	33724.44	6407.64
6235	254	39	199	6	36223.08	6520.14
6236	254	13	16	2	8011.60	1442.08
6237	254	23	889	2	8826.54	2030.10
6238	192	35	623	5	35841.60	7168.30
6239	254	33	240	10	16510.40	2146.40
6240	254	21	124	3	14243.82	4273.14
6241	254	27	439	4	16793.24	2183.12
6242	254	45	952	3	60.30	11.46
6243	254	1	321	10	58139.20	13953.40
6244	254	45	107	10	84919.10	27174.10
6245	254	22	17	9	17120.34	1883.25
6246	254	30	480	10	55144.50	9374.60
6247	254	24	678	10	33143.90	12263.20
6248	254	5	972	2	4883.90	1660.52
6249	254	31	54	4	574.92	172.48
6250	254	2	376	2	10773.04	2908.72
6251	254	31	198	8	60167.28	12635.12
6252	254	36	401	9	10463.49	2092.68
6253	254	14	641	8	50261.12	15580.96
6254	254	10	692	8	29337.92	3520.56
6255	254	13	103	3	8185.17	1800.75
6256	254	27	359	17	87859.06	28993.50
6257	254	3	337	5	34672.80	5200.90
6258	254	20	374	7	11591.44	2434.18
6259	254	31	475	8	45774.96	13274.72
6260	254	38	279	9	32224.95	7411.77
6261	254	30	408	5	49752.05	13930.55
6262	254	36	848	5	22184.25	5324.20
6263	254	44	232	1	9971.32	2093.98
6264	254	1	852	7	54066.95	12435.43
6265	254	33	30	7	45808.28	6871.27
6266	254	48	61	6	10501.68	4095.66
6267	254	45	410	6	7477.74	2841.54
6268	254	26	827	4	7283.08	1238.12
6269	254	38	729	12	66228.24	23179.92
6270	254	47	917	7	6368.04	700.49
6271	254	5	323	8	16701.84	5010.56
6272	254	44	517	10	69562.50	17390.60
6273	254	42	62	2	8873.72	2040.96
6274	254	29	872	15	12753.90	1657.95
6275	200	32	470	2	14077.88	2956.36
6276	254	32	936	4	18514.68	5924.68
6277	254	47	744	9	7728.75	1777.59
6278	254	33	420	7	34577.90	10373.37
6279	254	31	693	9	42936.84	15457.23
6280	254	1	195	2	19862.60	2184.88
6281	254	17	527	1	3750.28	862.56
6282	101	5	86	8	57936.24	6372.96
6283	254	7	899	3	18379.56	4778.70
6284	254	25	215	3	28891.11	6067.14
6285	254	17	117	19	68721.29	27488.44
6286	254	1	597	7	54790.40	15341.34
6287	254	34	382	1	2169.30	368.78
6288	254	35	331	6	12877.56	4507.14
6289	254	16	585	5	26870.40	2955.75
6290	254	3	51	6	32883.42	4274.82
6291	254	12	710	6	50379.78	20151.90
6292	807	20	662	9	22833.72	4566.78
6293	254	24	132	5	15242.15	5029.90
6294	254	32	319	8	50174.80	19066.40
6295	254	30	193	7	35858.69	8964.69
6296	254	5	979	1	8909.31	2940.07
6297	254	7	266	3	19819.29	6936.75
6298	254	14	985	5	37657.30	3765.75
6299	254	13	782	8	11357.20	1476.40
6300	259	1	130	3	24698.49	3704.76
6301	254	25	143	3	12282.48	4667.34
6302	254	35	798	7	49680.61	18878.65
6303	254	13	922	8	73489.28	16167.68
6304	254	36	23	10	56726.40	15316.10
6305	254	49	530	7	28084.91	4493.58
6306	696	7	990	1	7493.51	1573.64
6307	254	28	592	1	9817.99	1865.42
6308	254	18	385	4	22924.52	6189.64
6309	254	44	417	7	36583.26	11340.84
6310	254	38	522	2	16429.76	4271.74
6311	254	8	691	10	84680.70	27097.80
6312	254	21	624	1	9482.40	1137.89
6313	254	5	448	3	13557.09	3253.71
6314	254	19	219	10	91495.70	35683.30
6315	254	16	75	9	35892.63	3589.29
6316	254	45	936	2	9257.34	2962.34
6317	254	46	865	9	82889.64	14091.21
6318	254	18	435	7	51409.61	15422.89
6319	254	5	123	1	2162.44	367.61
6320	254	22	682	1	1393.18	417.95
6321	254	27	957	8	41183.28	5765.68
6322	254	41	242	9	89974.53	29691.63
6323	254	27	774	7	61004.65	11590.88
6324	254	39	467	3	28586.01	10005.09
6325	254	43	59	9	33888.96	9150.03
6326	819	44	166	6	42985.56	16334.52
6327	254	39	201	1	4042.70	727.69
6328	254	33	507	3	21958.11	6148.26
6329	254	29	723	7	37102.87	7420.56
6330	254	11	62	1	4436.86	1020.48
6331	254	43	316	11	41666.68	15000.04
6332	254	19	752	8	24888.64	7964.40
6333	254	39	139	8	72379.84	15199.76
6334	254	47	522	10	82148.80	21358.70
6335	438	22	888	7	40304.53	10882.20
6336	254	10	843	4	36646.64	8062.28
6337	447	33	2	9	18091.08	2713.68
6338	254	13	220	3	14172.93	2976.33
6339	254	3	91	7	69607.09	16009.63
6340	254	44	895	1	5277.43	2005.42
6341	254	12	871	10	16731.80	1840.50
6342	254	38	209	7	11438.70	4117.96
6343	254	22	594	8	58149.92	19189.44
6344	254	27	304	2	16720.58	2675.30
6345	639	46	651	6	40693.74	12208.14
6346	254	39	145	5	37681.55	13565.35
6347	254	44	829	14	114256.66	33134.50
6348	254	27	177	6	34436.28	4821.06
6349	254	28	815	7	46034.17	7825.79
6350	254	33	32	5	26957.85	10513.55
6351	254	39	891	2	15549.38	2487.90
6352	254	24	29	5	30128.85	6628.35
6353	399	47	665	5	4021.85	844.60
6354	254	6	208	3	22723.74	7498.83
6355	415	7	881	10	93454.60	37381.80
6356	254	30	398	10	27664.40	6086.20
6357	254	7	690	2	10517.06	2103.42
6358	254	36	429	4	19012.08	4182.64
6359	254	50	482	5	16804.20	3696.90
6360	806	3	754	6	201.66	54.42
6361	254	32	980	6	45437.52	9087.48
6362	254	47	998	4	29274.00	5562.04
6363	254	36	535	5	49684.60	17886.45
6364	254	17	438	1	6702.22	1541.51
6365	16	4	269	5	42534.55	8506.90
6366	254	6	760	4	15387.60	4770.16
6367	254	13	71	8	30658.08	6438.16
6368	254	14	783	8	68321.12	23229.20
6369	254	29	328	9	71654.31	22929.39
6370	254	13	373	13	106069.08	12728.30
6371	254	22	375	1	7338.75	2935.50
6372	254	27	682	4	5572.72	1671.80
6373	254	40	97	8	77255.20	13133.36
6374	254	50	384	3	29507.70	3245.85
6375	254	6	968	9	33726.96	8768.97
6376	254	1	189	3	3665.94	733.20
6377	415	7	285	2	5892.24	883.84
6378	254	20	148	3	4937.22	1481.16
6379	731	19	617	7	41513.64	15775.20
6380	781	7	15	6	31685.88	7287.78
6381	254	31	199	4	24148.72	4346.76
6382	254	2	15	4	21123.92	4858.52
6383	254	47	283	3	28797.39	5183.52
6384	254	2	630	6	8550.78	2479.74
6385	669	19	490	9	43208.73	6049.26
6386	254	31	700	10	50771.40	15231.40
6387	618	6	50	6	11868.54	3085.80
6388	254	11	269	6	51041.46	10208.28
6389	254	8	53	8	78199.92	8602.00
6390	254	45	544	2	17960.74	4310.58
6391	254	14	863	7	22339.10	8488.83
6392	254	48	831	8	3296.72	659.36
6393	254	48	505	7	18184.18	3818.71
6394	254	42	763	7	26511.73	7688.38
6395	254	18	338	5	15552.95	6221.20
6396	254	7	728	6	59293.98	15416.46
6397	254	18	719	5	17776.25	4266.30
6398	254	11	866	7	20674.64	2067.45
6399	254	3	656	3	3164.64	348.12
6400	38	27	427	2	3789.54	682.12
6401	254	49	82	8	57357.20	13765.76
6402	254	16	168	6	3943.62	433.80
6403	254	18	881	5	46727.30	18690.90
6404	657	23	580	8	45391.52	6808.72
6405	254	37	653	9	31562.55	6628.14
6406	254	17	777	5	48801.50	10736.35
6407	254	12	809	4	17230.24	5858.28
6408	254	36	61	6	10501.68	4095.66
6409	254	16	284	7	11942.70	1433.11
6410	256	29	794	9	42481.26	5522.58
6411	254	6	193	3	15368.01	3842.01
6412	254	25	823	5	41587.30	11228.55
6413	254	6	800	4	39196.28	7055.32
6414	302	12	198	3	22562.73	4738.17
6415	254	45	382	3	6507.90	1106.34
6416	254	12	985	4	30125.84	3012.60
6417	254	28	837	5	46690.10	14007.05
6418	254	49	102	1	4849.79	775.97
6419	254	27	10	7	19783.75	7517.79
6420	254	16	742	3	21975.54	7471.68
6421	254	4	731	4	22027.36	3304.12
6422	254	17	717	12	118106.76	21259.20
6423	254	9	389	16	15374.40	5996.00
6424	254	37	423	4	35823.32	6448.20
6425	560	6	933	4	32219.36	11598.96
6426	254	39	206	10	80624.40	12899.90
6427	64	30	807	6	32272.62	11295.42
6428	254	44	599	9	24303.24	7777.08
6429	254	37	42	7	36831.06	12154.24
6430	254	29	305	4	36004.28	10801.28
6431	254	34	431	1	2089.87	501.57
6432	254	13	609	8	72744.72	8729.36
6433	254	49	154	5	28817.50	5187.15
6434	488	23	875	1	9201.63	2208.39
6435	254	14	312	9	87744.33	26323.29
6436	254	44	503	1	3731.76	858.30
6437	254	14	401	9	10463.49	2092.68
6438	254	28	91	2	19887.74	4574.18
6439	254	18	526	4	2947.68	383.20
6440	254	14	794	3	14160.42	1840.86
6441	254	47	437	10	54161.60	18956.60
6442	254	39	135	1	5353.54	803.03
6443	254	2	307	9	34960.32	13634.55
6444	254	48	534	1	8986.08	1527.63
6445	254	48	491	1	6999.06	1049.86
6446	254	5	768	4	39793.56	13131.88
6447	254	46	947	9	30363.03	4858.11
6448	254	1	698	6	19719.24	2169.12
6449	254	25	113	9	10588.32	2541.24
6450	254	37	643	10	71804.50	16515.00
6451	254	48	922	1	9186.16	2020.96
6452	254	31	128	8	25199.68	3779.92
6453	426	24	592	8	78543.92	14923.36
6454	254	10	724	2	18560.26	5196.88
6455	254	37	721	4	39868.96	9568.56
6456	254	10	236	4	22279.32	6238.20
6457	254	28	928	9	54753.30	18068.58
6458	254	6	527	10	37502.80	8625.60
6459	254	20	192	10	30552.90	8249.30
6460	254	1	999	5	3431.35	960.80
6461	254	22	184	4	7151.04	2788.92
6462	254	47	496	11	4247.32	1231.67
6463	254	24	218	3	22882.65	2745.93
6464	728	12	901	8	13436.48	2552.96
6465	254	42	960	8	6458.40	904.16
6466	299	12	223	10	86083.80	8608.40
6467	254	14	4	6	41229.78	10719.72
6468	254	43	502	2	11967.58	2513.20
6469	254	27	799	1	5860.05	1640.81
6470	254	12	309	2	3189.10	637.82
6471	254	39	788	8	29292.40	4686.80
6472	254	39	322	10	77598.80	30263.50
6473	254	24	57	9	28776.87	6906.42
6474	254	41	144	7	52651.20	14742.35
6475	254	30	629	6	33532.68	5365.20
6476	254	47	350	4	28131.48	10971.28
6477	832	20	870	4	17617.28	6518.40
6478	254	27	547	1	7424.36	965.17
6479	254	48	742	7	51276.26	17433.92
6480	254	2	651	7	47476.03	14242.83
6481	415	7	826	4	23604.92	6137.28
6482	601	50	837	9	84042.18	25212.69
6483	254	19	431	9	18808.83	4514.13
6484	254	16	666	5	15697.25	4395.25
6485	254	30	741	4	27734.92	7211.08
6486	254	21	426	10	44429.00	8885.80
6487	254	13	79	8	72499.44	13774.88
6488	254	43	839	4	36882.80	4057.12
6489	254	33	737	10	97747.50	10752.20
6490	254	25	386	3	22837.11	7764.63
6491	254	37	835	9	22088.16	5742.90
6492	254	12	921	2	8820.20	3087.06
6493	254	48	827	2	3641.54	619.06
6494	254	6	318	7	25846.80	5169.36
6495	254	43	838	4	20511.40	4512.52
6496	254	25	135	9	48181.86	7227.27
6497	254	22	391	9	5102.10	867.33
6498	254	33	613	6	37549.44	5256.90
6499	254	4	325	5	34815.90	5570.55
6500	254	11	675	9	4185.99	1506.96
6501	254	16	20	1	2693.59	538.72
6502	254	9	948	9	62012.97	21084.39
6503	254	28	307	3	11653.44	4544.85
6504	254	2	576	2	1995.24	638.48
6505	254	23	256	4	650.92	247.36
6506	254	37	927	8	62092.40	17385.84
6507	254	30	105	4	14125.08	4378.76
6508	254	12	213	8	8475.20	1017.04
6509	306	17	214	4	2192.08	416.48
6510	254	23	948	3	20670.99	7028.13
6511	254	33	884	2	7696.36	2154.98
6512	254	35	249	4	32665.40	4246.52
6513	254	48	127	8	47711.12	18130.24
6514	254	4	935	3	9189.84	1470.36
6515	254	12	910	2	5719.84	1143.96
6516	254	30	410	6	7477.74	2841.54
6517	254	10	332	4	38671.80	10054.68
6518	254	22	539	4	17070.12	3584.72
6519	254	30	323	7	14614.11	4384.24
6520	254	10	663	6	45482.10	17283.18
6521	254	14	523	3	24304.08	9478.59
6522	254	5	747	8	1106.08	176.96
6523	254	1	55	1	8646.00	1037.52
6524	254	6	532	7	62698.79	7523.88
6525	488	23	418	1	1545.46	262.73
6526	669	19	947	3	10121.01	1619.37
6527	254	46	634	1	6924.71	1731.18
6528	254	28	249	4	32665.40	4246.52
6529	254	50	522	6	49289.28	12815.22
6530	254	11	651	1	6782.29	2034.69
6531	254	18	312	8	77994.96	23398.48
6532	254	13	110	6	56105.22	9537.90
6533	254	3	340	3	23258.07	6512.25
6534	254	36	779	10	69693.70	21605.00
6535	254	36	936	1	4628.67	1481.17
6536	254	10	14	3	23047.44	5531.40
6537	254	50	805	10	28116.80	9559.70
6538	254	41	861	1	530.44	175.05
6539	254	23	242	10	99971.70	32990.70
6540	254	42	954	6	47666.40	16683.24
6541	254	13	932	5	16003.90	1600.40
6542	254	33	58	4	38237.12	7647.44
6543	254	27	251	9	51284.97	15898.32
6544	254	14	353	4	8754.64	2451.28
6545	254	2	492	15	30777.75	7078.95
6546	549	30	1000	6	13341.18	4269.18
6547	254	15	837	10	93380.20	28014.10
6548	254	14	563	9	69889.86	9085.68
6549	254	19	826	3	17703.69	4602.96
6550	254	28	922	12	110233.92	24251.52
6551	254	9	164	7	18000.57	3960.11
6552	716	28	31	3	12638.43	4044.30
6553	254	46	988	13	45222.58	8592.35
6554	264	22	259	8	66346.32	6634.64
6555	254	40	147	7	57122.73	12567.03
6556	254	31	55	1	8646.00	1037.52
6557	254	45	16	6	24034.80	4326.24
6558	254	42	503	4	14927.04	3433.20
6559	171	36	651	10	67822.90	20346.90
6560	254	15	466	1	7225.30	2239.84
6561	328	46	134	5	24173.85	4109.55
6562	254	13	171	7	64219.33	21834.54
6563	254	20	104	7	43084.79	16803.08
6564	254	34	88	10	17506.10	5076.80
6565	254	35	353	8	17509.28	4902.56
6566	95	1	929	3	4692.81	1314.00
6567	254	17	293	6	29609.88	5922.00
6568	254	49	966	10	41289.10	5367.60
6569	257	8	800	10	97990.70	17638.30
6570	254	7	630	1	1425.13	413.29
6571	254	2	671	1	2573.98	386.10
6572	581	32	328	3	23884.77	7643.13
6573	254	8	821	5	35162.30	11955.20
6574	254	33	328	4	31846.36	10190.84
6575	254	39	954	7	55610.80	19463.78
6576	254	6	677	8	18126.72	6888.16
6577	708	25	472	2	12730.54	1273.06
6578	433	30	614	6	58741.68	14098.02
6579	254	5	492	4	8207.40	1887.72
6580	254	26	476	6	50063.58	15519.72
6581	254	43	643	10	71804.50	16515.00
6582	254	16	381	4	4674.04	1355.48
6583	254	36	773	4	5039.84	1259.96
6584	254	48	750	4	1469.56	470.24
6585	254	15	495	4	22634.32	7016.64
6586	254	26	907	7	350.98	42.14
6587	254	37	340	10	77526.90	21707.50
6588	254	38	72	1	7801.66	1248.27
6589	254	11	314	8	56841.60	18757.76
6590	254	5	568	6	51323.40	15910.26
6591	254	28	576	2	1995.24	638.48
6592	254	28	89	5	28896.35	10691.65
6593	254	30	966	10	41289.10	5367.60
6594	254	8	712	9	36791.64	6990.39
6595	696	7	975	9	11245.68	1461.96
6596	280	22	549	3	17940.78	4844.01
6597	254	4	896	9	8203.59	1640.70
6598	254	13	680	8	79443.92	20655.44
6599	491	47	426	5	22214.50	4442.90
6600	874	9	39	1	8865.34	1329.80
6601	254	42	117	6	21701.46	8680.56
6602	254	23	391	7	3968.30	674.59
6603	254	25	469	8	291.12	87.36
6604	254	17	884	6	23089.08	6464.94
6605	254	3	710	10	83966.30	33586.50
6606	254	17	510	2	11106.86	1443.90
6607	254	4	952	10	201.00	38.20
6608	641	14	265	8	10678.24	1708.48
6609	254	3	584	7	35102.69	11232.83
6610	254	47	448	16	72304.48	17353.12
6611	254	16	928	10	60837.00	20076.20
6612	254	13	466	8	57802.40	17918.72
6613	254	2	346	4	16031.32	4328.44
6614	254	8	652	8	33931.84	13572.72
6615	254	47	77	2	13735.36	3159.14
6616	254	26	65	4	26174.32	4973.12
6617	254	45	430	8	8707.12	1480.24
6618	254	28	290	8	71014.24	15623.12
6619	254	26	948	5	34451.65	11713.55
6620	254	45	708	5	31780.35	9216.30
6621	254	9	776	5	27354.85	7385.80
6622	254	47	708	11	69916.77	20275.86
6623	254	38	8	2	6709.16	1811.48
6624	254	42	434	5	42155.55	8009.55
6625	254	17	267	7	45294.34	9511.81
6626	254	28	762	12	64340.28	7077.48
6627	254	42	142	2	9081.06	2361.08
6628	38	27	552	3	14574.42	5538.27
6629	254	46	944	2	8983.24	2425.48
6630	744	16	377	10	20982.80	5245.70
6631	254	50	460	5	16632.70	4657.15
6632	254	18	662	3	7611.24	1522.26
6633	254	4	406	10	32973.00	10551.40
6634	254	39	40	10	44501.20	9790.30
6635	254	50	574	9	76199.85	19049.94
6636	825	21	212	1	5128.89	974.49
6637	254	25	195	3	29793.90	3277.32
6638	254	2	762	2	10723.38	1179.58
6639	254	14	752	6	18666.48	5973.30
6640	653	41	286	8	37632.32	10913.36
6641	254	24	474	5	25058.25	4009.30
6642	254	46	966	1	4128.91	536.76
6643	254	34	104	8	49239.76	19203.52
6644	254	20	4	5	34358.15	8933.10
6645	254	33	764	3	22736.07	5001.93
6646	254	32	108	9	55695.78	7797.42
6647	254	33	541	1	7770.80	3030.61
6648	254	19	370	5	6696.25	1205.35
6649	254	3	185	6	46329.24	9265.86
6650	254	44	610	5	43698.45	5243.80
6651	254	33	155	5	26711.25	6944.95
6652	254	46	654	1	8313.77	2161.58
6653	781	7	615	10	91650.10	27495.00
6654	254	10	251	4	22793.32	7065.92
6655	254	7	116	7	15692.53	3138.52
6656	254	13	941	4	33385.08	11017.08
6657	254	49	635	2	5545.36	776.36
6658	254	49	643	2	14360.90	3303.00
6659	254	5	555	1	2571.31	411.41
6660	254	50	229	4	11092.52	2884.04
6661	254	31	412	9	72062.91	8647.56
6662	254	4	189	16	19551.68	3910.40
6663	254	30	121	8	54917.36	6040.88
6664	254	6	432	3	4764.27	1095.78
6665	254	43	860	7	65733.57	19720.05
6666	254	26	880	9	56561.13	7352.91
6667	254	41	652	2	8482.96	3393.18
6668	254	32	591	1	595.92	65.55
6669	254	38	416	7	14563.01	5533.92
6670	254	41	866	3	8860.56	886.05
6671	673	46	736	8	52018.16	5722.00
6672	254	1	815	12	78915.72	13415.64
6673	254	25	654	6	49882.62	12969.48
6674	254	40	537	7	48596.24	13606.95
6675	254	15	655	2	13834.08	2490.14
6676	254	39	743	8	35741.52	11437.28
6677	254	1	150	6	49850.52	14955.18
6678	254	23	703	10	62541.40	13759.10
6679	254	50	77	6	41206.08	9477.42
6680	254	7	119	9	15424.38	4010.31
6681	254	1	145	16	120580.96	43409.12
6682	844	42	733	10	91047.20	20940.90
6683	254	50	593	7	3397.45	1257.06
6684	254	17	829	14	114256.66	33134.50
6685	254	2	859	2	14880.52	5505.80
6686	167	3	577	10	78100.80	13277.10
6687	808	42	529	2	7179.54	2441.04
6688	254	42	625	6	40386.36	9288.84
6689	254	43	499	7	51757.72	13974.59
6690	254	48	53	5	48874.95	5376.25
6691	254	40	871	6	10039.08	1104.30
6692	254	20	744	8	6870.00	1580.08
6693	757	25	515	9	79479.00	23048.91
6694	254	17	154	8	46108.00	8299.44
6695	254	6	946	7	61775.00	21003.50
6696	699	47	363	10	77756.20	9330.70
6697	254	32	788	7	25630.85	4100.95
6698	254	47	730	19	163389.55	17972.86
6699	254	46	622	4	15553.00	1555.28
6700	254	43	317	6	23959.44	9104.58
6701	254	1	922	7	64303.12	14146.72
6702	254	12	23	8	45381.12	12252.88
6703	130	37	524	5	33495.50	7703.95
6704	254	7	723	9	47703.69	9540.72
6705	254	5	283	9	86392.17	15550.56
6706	254	37	583	3	15762.93	3783.09
6707	254	30	752	7	21777.56	6968.85
6708	328	45	120	6	47718.30	10975.20
6709	254	47	236	8	44558.64	12476.40
6710	254	7	197	9	48624.39	12156.12
6711	254	4	798	3	21291.69	8090.85
6712	254	40	202	3	26358.45	4480.95
6713	254	18	310	2	2621.28	262.12
6714	254	24	930	4	37352.96	9711.76
6715	254	9	975	1	1249.52	162.44
6716	254	50	32	5	26957.85	10513.55
6717	254	27	33	5	19772.45	5931.75
6718	527	17	376	10	53865.20	14543.60
6719	538	14	952	5	100.50	19.10
6720	696	7	899	2	12253.04	3185.80
6721	254	21	878	2	12306.62	1599.86
6722	254	8	367	1	161.27	41.93
6723	254	1	595	3	24705.33	4446.96
6724	254	10	350	10	70328.70	27428.20
6725	254	15	198	4	30083.64	6317.56
6726	254	18	387	7	37810.71	11721.29
6727	254	44	524	3	20097.30	4622.37
6728	254	24	794	6	28320.84	3681.72
6729	254	45	138	7	30786.21	3386.46
6730	254	30	892	5	17244.25	4655.95
6731	254	21	968	7	26232.08	6820.31
6732	254	36	501	7	58396.94	20438.95
6733	254	46	459	10	5970.90	2089.80
6734	254	43	660	9	39825.99	14735.61
6735	254	38	464	5	2606.05	912.10
6736	254	26	801	1	2441.52	341.81
6737	254	19	90	10	56548.00	13571.50
6738	254	43	479	6	3863.04	463.56
6739	254	48	381	9	10516.59	3049.83
6740	254	16	628	2	8056.42	1933.54
6741	254	8	385	9	51580.17	13926.69
6742	254	14	595	7	57645.77	10376.24
6743	254	14	903	10	77679.00	24080.50
6744	254	35	786	2	8670.06	3294.62
6745	254	36	356	4	17834.72	3388.60
6746	254	16	527	11	41253.08	9488.16
6747	1	6	103	9	24555.51	5402.25
6748	254	4	880	3	18853.71	2450.97
6749	254	44	275	4	29205.68	9345.80
6750	254	9	244	1	6143.96	2396.14
6751	254	19	733	2	18209.44	4188.18
6752	254	32	982	4	36419.32	14203.52
6753	254	25	825	2	2245.08	651.08
6754	254	1	659	3	17468.97	3843.18
6755	254	19	414	9	74734.74	20925.72
6756	254	10	109	9	34726.41	9376.11
6757	254	34	828	8	18426.80	6817.92
6758	183	3	4	1	6871.63	1786.62
6759	708	25	101	7	59475.15	16058.28
6760	254	27	307	2	7768.96	3029.90
6761	83	21	906	5	39517.80	11855.35
6762	254	26	506	10	5494.10	1977.90
6763	254	42	889	4	17653.08	4060.20
6764	254	2	620	3	11366.10	4091.79
6765	254	28	516	6	20735.40	7464.72
6766	254	41	677	12	27190.08	10332.24
6767	254	44	11	10	24469.80	9787.90
6768	254	34	454	7	33872.51	6097.07
6769	254	10	856	9	15024.15	3605.76
6770	254	44	434	4	33724.44	6407.64
6771	254	18	911	9	21258.18	4889.34
6772	254	32	572	9	55892.61	15649.92
6773	254	46	822	8	42897.92	11153.44
6774	254	4	891	6	46648.14	7463.70
6775	254	34	239	8	16329.84	5062.24
6776	254	29	25	4	24077.64	8667.96
6777	16	4	858	8	77346.72	27071.36
6778	254	42	44	9	57730.68	12123.45
6779	349	10	44	1	6414.52	1347.05
6780	254	34	985	6	45188.76	4518.90
6781	254	48	67	2	13993.12	2238.90
6782	254	21	470	4	28155.76	5912.72
6783	254	26	570	4	8494.48	2888.12
6784	254	8	981	2	3542.12	850.10
6785	254	6	678	5	16571.95	6131.60
6786	254	46	193	2	10245.34	2561.34
6787	254	48	798	1	7097.23	2696.95
6788	254	26	673	3	15756.30	4569.33
6789	254	18	845	5	44409.10	9325.90
6790	254	44	540	6	32886.12	3288.60
6791	254	27	525	9	62003.70	22321.35
6792	254	16	207	3	21933.78	7457.49
6793	254	49	217	7	32855.41	11170.81
6794	254	14	2	10	20101.20	3015.20
6795	254	44	39	4	35461.36	5319.20
6796	254	44	77	16	109882.88	25273.12
6797	254	39	867	3	13276.50	4646.76
6798	254	20	935	9	27569.52	4411.08
6799	254	1	700	8	40617.12	12185.12
6800	254	19	91	2	19887.74	4574.18
6801	254	22	848	1	4436.85	1064.84
6802	254	16	963	6	38256.66	7268.76
6803	254	10	896	10	9115.10	1823.00
6804	254	45	202	3	26358.45	4480.95
6805	254	49	497	8	41872.00	14236.48
6806	254	4	712	7	28615.72	5436.97
6807	254	5	310	7	9174.48	917.42
6808	254	34	319	7	43902.95	16683.10
6809	254	10	893	6	37345.38	11950.50
6810	254	11	25	3	18058.23	6500.97
6811	254	37	469	4	145.56	43.68
6812	254	7	518	2	495.76	104.10
6813	740	35	148	9	14811.66	4443.48
6814	344	49	895	9	47496.87	18048.78
6815	254	48	901	5	8397.80	1595.60
6816	254	45	693	9	42936.84	15457.23
6817	254	27	733	10	91047.20	20940.90
6818	254	43	369	8	18440.00	3503.60
6819	254	20	488	8	77010.00	8471.12
6820	254	12	690	9	47326.77	9465.39
6821	254	28	434	13	109604.43	20824.83
6822	254	36	166	2	14328.52	5444.84
6823	254	1	331	8	17170.08	6009.52
6824	254	27	301	8	21271.12	4466.96
6825	229	36	594	10	72687.40	23986.80
6826	254	4	272	3	8870.49	1685.40
6827	744	11	444	8	78845.44	25230.56
6828	254	19	833	7	27796.93	8617.07
6829	274	50	981	6	10626.36	2550.30
6830	254	17	543	8	31947.84	8945.36
6831	254	18	819	6	18366.00	6795.42
6832	254	30	626	1	4613.43	1614.70
6833	254	41	372	8	64907.52	18174.08
6834	254	17	746	8	36368.88	13456.48
6835	254	49	58	9	86033.52	17206.74
6836	161	19	646	3	17489.61	5071.98
6837	254	9	988	7	24350.62	4626.65
6838	254	32	275	7	51109.94	16355.15
6839	254	6	584	2	10029.34	3209.38
6840	425	1	643	9	64624.05	14863.50
6841	254	27	856	7	11685.45	2804.48
6842	254	34	113	7	8235.36	1976.52
6843	526	7	948	9	62012.97	21084.39
6844	254	42	187	10	14992.60	1649.20
6845	485	27	279	2	7161.10	1647.06
6846	254	4	866	6	17721.12	1772.10
6847	254	45	935	20	61265.60	9802.40
6848	254	45	682	10	13931.80	4179.50
6849	254	1	943	3	18700.50	7293.21
6850	254	43	157	3	4301.34	1118.34
6851	254	44	973	9	30924.18	11441.97
6852	254	7	633	1	6883.87	2615.87
6853	254	17	964	10	94862.10	24664.10
6854	175	1	932	8	25606.24	2560.64
6855	254	28	900	6	8950.14	3311.58
6856	254	50	220	7	33070.17	6944.77
6857	254	27	985	4	30125.84	3012.60
6858	254	44	113	1	1176.48	282.36
6859	254	32	293	8	39479.84	7896.00
6860	254	7	144	1	7521.60	2106.05
6861	254	50	426	6	26657.40	5331.48
6862	254	39	28	10	77100.10	14649.00
6863	254	43	587	16	2378.40	689.76
6864	254	24	272	4	11827.32	2247.20
6865	254	34	12	3	29502.09	5015.37
6866	254	14	333	3	6528.90	1958.67
6867	254	8	438	10	67022.20	15415.10
6868	254	24	649	8	69388.00	25673.52
6869	254	50	370	3	4017.75	723.21
6870	254	4	713	5	40163.85	10442.60
6871	331	11	364	9	56375.01	14657.49
6872	254	27	649	5	43367.50	16045.95
6873	254	38	249	7	57164.45	7431.41
6874	254	33	703	10	62541.40	13759.10
6875	852	20	278	10	82103.20	24631.00
6876	254	14	921	4	17640.40	6174.12
6877	254	11	516	10	34559.00	12441.20
6878	254	2	809	4	17230.24	5858.28
6879	254	30	729	5	27595.10	9658.30
6880	254	40	110	9	84157.83	14306.85
6881	254	13	802	8	24062.56	7218.80
6882	254	7	120	7	55671.35	12804.40
6883	311	16	355	5	47851.90	6699.25
6884	254	42	541	8	62166.40	24244.88
6885	254	17	500	9	52046.82	10409.40
6886	254	50	783	10	85401.40	29036.50
6887	254	46	424	9	56306.79	21396.60
6888	254	1	577	5	39050.40	6638.55
6889	191	44	462	10	51894.90	17644.30
6890	254	15	548	10	59541.00	19053.10
6891	254	33	722	4	38409.72	10370.64
6892	254	23	524	1	6699.10	1540.79
6893	76	32	519	2	712.54	256.52
6894	254	4	52	16	74191.36	7419.20
6895	254	21	532	8	71655.76	8598.72
6896	254	28	623	6	43009.92	8601.96
6897	112	49	569	2	8291.60	1741.24
6898	254	34	586	12	80042.04	10405.44
6899	254	10	902	6	5483.58	1206.36
6900	254	15	540	5	27405.10	2740.50
6901	254	25	787	6	912.18	164.22
6902	320	20	541	1	7770.80	3030.61
6903	254	50	554	8	32098.64	10592.56
6904	254	38	326	8	61706.00	11107.12
6905	254	39	562	6	20739.30	4770.06
6906	254	12	744	2	1717.50	395.02
6907	254	28	540	5	27405.10	2740.50
6908	254	37	973	6	20616.12	7627.98
6909	254	50	104	7	43084.79	16803.08
6910	254	5	345	1	9923.60	2877.84
6911	254	33	781	13	44358.60	5766.67
6912	254	39	465	7	25200.21	5796.07
6913	254	50	100	6	34397.82	7223.52
6914	254	29	56	10	77168.80	30867.50
6915	254	26	703	8	50033.12	11007.28
6916	254	17	814	7	59950.10	20982.50
6917	254	31	680	3	29791.47	7745.79
6918	816	40	655	2	13834.08	2490.14
6919	254	19	334	10	87503.10	21000.70
6920	254	34	422	10	55014.80	9352.50
6921	254	12	925	9	44898.39	7183.71
6922	254	35	44	10	64145.20	13470.50
6923	254	10	221	8	52678.32	15803.52
6924	615	12	591	2	1191.84	131.10
6925	254	3	74	5	1775.25	408.30
6926	254	22	416	1	2080.43	790.56
6927	258	32	72	2	15603.32	2496.54
6928	254	45	456	18	97046.28	9704.70
6929	254	10	827	9	16386.93	2785.77
6930	17	40	303	3	27741.06	9431.97
6931	254	3	891	9	69972.21	11195.55
6932	254	41	900	1	1491.69	551.93
6933	254	20	162	1	8953.72	1611.67
6934	254	34	117	9	32552.19	13020.84
6935	254	17	744	4	3435.00	790.04
6936	254	36	922	6	55116.96	12125.76
6937	254	25	483	1	7382.61	1181.22
6938	254	26	469	10	363.90	109.20
6939	254	39	528	6	57572.88	18999.06
6940	254	24	476	3	25031.79	7759.86
6941	254	18	315	7	30962.19	7121.31
6942	254	27	416	6	12482.58	4743.36
6943	254	1	893	9	56018.07	17925.75
6944	254	2	311	5	15624.40	4687.30
6945	254	32	217	9	42242.67	14362.47
6946	254	22	221	5	32923.95	9877.20
6947	254	18	322	4	31039.52	12105.40
6948	254	20	26	2	7325.40	732.54
6949	254	36	269	5	42534.55	8506.90
6950	254	49	717	4	39368.92	7086.40
6951	254	48	180	6	21342.00	8536.80
6952	100	44	694	10	484.80	72.70
6953	254	24	896	5	4557.55	911.50
6954	254	42	172	1	109.06	38.17
6955	254	32	752	7	21777.56	6968.85
6956	254	44	687	10	19141.90	4976.90
6957	254	15	40	1	4450.12	979.03
6958	254	45	491	9	62991.54	9448.74
6959	254	20	991	2	6496.64	1039.46
6960	761	20	167	1	7466.11	895.93
6961	254	11	105	9	31781.43	9852.21
6962	851	40	24	7	9112.88	1913.73
6963	254	9	233	4	18156.44	6354.76
6964	254	33	228	9	65181.87	24117.30
6965	254	25	567	6	44009.40	4841.04
6966	254	29	38	15	73395.30	19816.80
6967	254	8	211	5	8703.75	2959.30
6968	254	19	854	15	62486.70	21870.30
6969	254	23	356	7	31210.76	5930.05
6970	254	42	225	9	50895.18	15777.54
6971	254	12	788	5	18307.75	2929.25
6972	254	22	303	5	46235.10	15719.95
6973	254	24	440	7	53766.37	5914.30
6974	254	38	450	3	25218.39	6556.77
6975	254	49	858	11	106351.74	37223.12
6976	254	4	527	2	7500.56	1725.12
6977	254	34	789	1	9480.91	2275.42
6978	254	43	328	1	7961.59	2547.71
6979	397	28	490	3	14402.91	2016.42
6980	193	20	545	7	4038.09	1453.69
6981	254	19	456	8	43131.68	4313.20
6982	254	40	753	2	10158.74	2641.28
6983	254	32	394	4	25525.56	5360.36
6984	254	29	200	10	78893.20	18145.40
6985	254	34	463	1	9425.53	2073.62
6986	254	16	884	9	34633.62	9697.41
6987	529	31	1000	9	20011.77	6403.77
6988	254	3	559	1	6143.46	1720.17
6989	254	43	952	10	201.00	38.20
6990	254	25	8	5	16772.90	4528.70
6991	618	6	487	3	19975.20	5992.56
6992	488	23	874	10	28598.30	5147.70
6993	254	43	782	16	22714.40	2952.80
6994	254	40	837	3	28014.06	8404.23
6995	254	22	192	8	24442.32	6599.44
6996	254	12	898	8	40207.12	15278.72
6997	254	1	734	9	12261.33	4781.88
6998	254	37	500	3	17348.94	3469.80
6999	254	16	17	7	13315.82	1464.75
7000	254	45	745	1	8155.53	1386.44
7001	254	1	540	9	49329.18	4932.90
7002	731	19	956	9	75043.17	21012.12
7003	254	36	828	7	16123.45	5965.68
7004	254	18	916	4	11235.56	1910.04
7005	254	7	379	6	40792.02	4487.10
7006	254	25	959	8	55196.88	13247.28
7007	254	17	105	4	14125.08	4378.76
7008	254	38	293	4	19739.92	3948.00
7009	254	32	658	6	51034.98	13779.42
7010	254	40	498	1	7082.03	2620.35
7011	254	17	978	5	12747.00	2421.95
7012	254	34	152	7	17021.06	2723.35
7013	254	16	321	4	23255.68	5581.36
7014	254	23	551	8	56909.92	13658.40
7015	254	9	385	7	40117.91	10831.87
7016	254	30	585	3	16122.24	1773.45
7017	254	46	286	3	14112.12	4092.51
7018	254	23	872	6	5101.56	663.18
7019	254	21	633	7	48187.09	18311.09
7020	254	15	842	7	27533.59	6332.76
7021	254	50	75	6	23928.42	2392.86
7022	254	6	515	9	79479.00	23048.91
7023	254	25	410	1	1246.29	473.59
7024	66	37	459	4	2388.36	835.92
7025	254	45	325	4	27852.72	4456.44
7026	254	1	157	8	11470.24	2982.24
7027	199	49	273	2	7265.32	1380.42
7028	254	20	432	6	9528.54	2191.56
7029	254	23	634	1	6924.71	1731.18
7030	254	14	492	9	18466.65	4247.37
7031	254	7	599	1	2700.36	864.12
7032	254	9	213	8	8475.20	1017.04
7033	254	7	538	3	17647.02	2470.59
7034	254	2	877	8	23386.56	3975.68
7035	254	4	46	5	49601.65	10912.35
7036	595	32	182	5	31771.60	9849.20
7037	254	49	34	5	26909.15	9418.20
7038	254	2	330	14	98585.06	25632.18
7039	254	39	148	10	16457.40	4937.20
7040	254	44	715	10	73913.40	8130.50
7041	358	29	43	4	38609.24	6563.56
7042	254	43	429	9	42777.18	9410.94
7043	254	5	647	3	20934.81	2302.83
7044	254	8	247	5	31340.00	4387.60
7045	254	25	969	6	14692.56	1763.10
7046	254	11	873	7	21773.78	4137.00
7047	254	7	523	9	72912.24	28435.77
7048	254	9	279	3	10741.65	2470.59
7049	254	3	386	8	60898.96	20705.68
7050	311	2	542	5	47182.60	6605.55
7051	254	39	364	6	37583.34	9771.66
7052	254	44	388	7	39059.86	10155.53
7053	254	46	851	12	51652.92	7231.44
7054	254	3	263	16	149957.44	28491.84
7055	254	3	591	5	2979.60	327.75
7056	254	19	250	10	37388.40	11964.30
7057	254	49	678	6	19886.34	7357.92
7058	197	2	393	2	9614.54	3461.24
7059	254	10	776	6	32825.82	8862.96
7060	877	44	507	6	43916.22	12296.52
7061	797	3	990	2	14987.02	3147.28
7062	254	29	197	9	48624.39	12156.12
7063	254	42	759	3	12914.58	2712.06
7064	254	46	985	3	22594.38	2259.45
7065	254	39	596	10	42470.60	6370.60
7066	386	21	993	9	64812.96	16203.24
7067	254	28	108	1	6188.42	866.38
7068	254	20	433	9	12017.16	4205.97
7069	254	46	140	1	7551.88	2492.12
7070	150	30	584	1	5014.67	1604.69
7071	254	32	798	13	92263.99	35060.35
7072	254	23	153	9	4605.03	1795.95
7073	399	47	607	9	55154.97	12134.07
7074	254	8	233	2	9078.22	3177.38
7075	254	41	204	10	29074.80	9303.90
7076	479	1	348	9	6028.20	2350.98
7077	254	18	492	1	2051.85	471.93
7078	254	4	240	4	6604.16	858.56
7079	254	33	813	1	6474.66	1553.92
7080	254	50	299	5	45198.50	7683.75
7081	254	32	382	6	13015.80	2212.68
7082	254	33	905	9	8571.33	2057.13
7083	254	49	992	1	810.41	243.12
7084	254	49	21	10	5171.00	672.20
7085	254	8	546	10	59096.70	7091.60
7086	254	20	166	3	21492.78	8167.26
7087	254	7	453	7	63306.74	15826.72
7088	254	28	745	5	40777.65	6932.20
7089	254	1	413	3	5114.91	1227.57
7090	254	33	413	5	8524.85	2045.95
7091	254	19	339	10	74859.70	27698.10
7092	254	17	109	5	19292.45	5208.95
7093	254	46	300	7	55312.74	17700.06
7094	254	38	506	3	1648.23	593.37
7095	254	49	234	18	107761.32	16164.18
7096	254	47	297	9	69567.12	11826.45
7097	254	44	684	4	32918.12	6254.44
7098	254	36	377	1	2098.28	524.57
7099	254	25	697	10	13132.80	4727.80
7100	254	22	913	1	3271.00	621.49
7101	254	6	826	5	29506.15	7671.60
7102	254	7	850	7	60449.20	12089.84
7103	254	47	198	7	52646.37	11055.73
7104	254	16	387	1	5401.53	1674.47
7105	254	8	674	8	52928.00	19054.08
7106	254	38	995	10	96245.80	25986.40
7107	254	38	586	1	6670.17	867.12
7108	254	37	232	2	19942.64	4187.96
7109	254	27	501	4	33369.68	11679.40
7110	251	49	398	6	16598.64	3651.72
7111	254	5	890	14	19297.60	3859.52
7112	254	3	329	5	43958.45	13627.10
7113	254	24	372	9	73020.96	20445.84
7114	254	46	12	10	98340.30	16717.90
7115	254	21	15	16	84495.68	19434.08
7116	254	36	873	10	31105.40	5910.00
7117	254	32	269	16	136110.56	27222.08
7118	254	22	880	3	18853.71	2450.97
7119	254	38	133	10	42603.90	14485.30
7120	254	12	570	4	8494.48	2888.12
7121	254	27	722	6	57614.58	15555.96
7122	254	37	623	7	50178.24	10035.62
7123	254	29	745	6	48933.18	8318.64
7124	254	20	827	2	3641.54	619.06
7125	254	41	237	4	31327.08	7205.24
7126	254	14	540	7	38367.14	3836.70
7127	254	25	290	7	62137.46	13670.23
7128	254	34	950	8	46128.88	13377.36
7129	254	11	635	5	13863.40	1940.90
7130	657	20	635	2	5545.36	776.36
7131	254	33	471	10	73501.50	19110.40
7132	254	50	408	6	59702.46	16716.66
7133	254	35	659	9	52406.91	11529.54
7134	254	18	410	3	3738.87	1420.77
7135	254	14	183	7	3034.50	788.97
7136	254	7	180	7	24899.00	9959.60
7137	254	43	927	7	54330.85	15212.61
7138	254	48	565	1	1858.58	650.50
7139	254	26	833	4	15883.96	4924.04
7140	254	38	678	8	26515.12	9810.56
7141	254	28	4	8	54973.04	14292.96
7142	254	23	431	4	8359.48	2006.28
7143	254	22	47	9	37328.67	14931.45
7144	748	35	186	2	6487.52	1232.62
7145	254	35	641	6	37695.84	11685.72
7146	254	46	830	7	25896.29	2589.65
7147	254	30	19	9	88598.79	11517.84
7148	254	41	762	6	32170.14	3538.74
7149	254	33	259	5	41466.45	4146.65
7150	254	47	287	9	26153.10	9676.62
7151	254	32	5	9	78546.24	27491.22
7152	254	9	137	8	51090.56	16348.96
7153	254	22	151	8	29197.04	5547.44
7154	254	18	724	5	46400.65	12992.20
7155	254	3	387	5	27007.65	8372.35
7156	254	14	57	2	6394.86	1534.76
7157	254	32	409	6	37446.90	5242.56
7158	254	39	947	10	33736.70	5397.90
7159	254	42	317	2	7986.48	3034.86
7160	565	48	128	8	25199.68	3779.92
7161	254	48	892	1	3448.85	931.19
7162	254	34	662	6	15222.48	3044.52
7163	254	23	325	11	76594.98	12255.21
7164	798	2	629	8	44710.24	7153.60
7165	254	29	878	3	18459.93	2399.79
7166	254	47	192	2	6110.58	1649.86
7167	254	50	459	7	4179.63	1462.86
7168	254	50	226	5	22376.15	2908.90
7169	254	47	530	10	40121.30	6419.40
7170	254	40	469	2	72.78	21.84
7171	254	19	633	6	41303.22	15695.22
7172	254	8	205	3	689.79	151.74
7173	75	36	596	7	29729.42	4459.42
7174	254	36	400	2	10738.94	3114.30
7175	254	19	187	3	4497.78	494.76
7176	254	49	158	2	17474.40	5591.80
7177	542	14	19	2	19688.62	2559.52
7178	254	27	382	6	13015.80	2212.68
7179	254	6	349	10	49040.90	14221.90
7180	254	32	738	1	2316.77	509.69
7181	254	19	915	10	24875.20	5223.80
7182	254	16	383	7	54933.76	11536.07
7183	254	13	138	9	39582.27	4354.02
7184	254	3	663	1	7580.35	2880.53
7185	254	1	507	11	80513.07	22543.62
7186	254	45	839	4	36882.80	4057.12
7187	254	26	539	9	38407.77	8065.62
7188	254	12	543	1	3993.48	1118.17
7189	254	39	87	8	47091.20	5650.96
7190	254	48	820	2	3694.74	1367.06
7191	254	12	105	3	10593.81	3284.07
7192	254	23	523	9	72912.24	28435.77
7193	254	31	738	7	16217.39	3567.83
7194	254	21	920	4	1559.40	514.60
7195	254	17	181	3	11183.40	3578.70
7196	177	14	940	8	51097.84	6642.72
7197	254	31	157	4	5735.12	1491.12
7198	254	13	751	6	15348.24	5832.36
7199	254	33	557	10	26386.50	7388.20
7200	254	29	539	4	17070.12	3584.72
7201	254	22	940	4	25548.92	3321.36
7202	254	31	98	10	9707.80	2524.00
7203	254	11	417	5	26130.90	8100.60
7204	254	13	94	2	17478.86	5243.66
7205	254	50	964	5	47431.05	12332.05
7206	254	38	146	10	32712.40	3925.50
7207	254	42	83	2	15725.74	5504.00
7208	254	49	694	7	339.36	50.89
7209	254	16	732	4	11133.92	1224.72
7210	254	43	569	2	8291.60	1741.24
7211	254	18	390	7	11462.29	1834.00
7212	804	10	108	10	61884.20	8663.80
7213	254	39	225	4	22620.08	7012.24
7214	254	37	783	3	25620.42	8710.95
7215	254	15	35	5	14737.70	3979.20
7216	254	7	889	5	22066.35	5075.25
7217	254	8	309	7	11161.85	2232.37
7218	254	36	536	9	63633.69	17181.09
7219	254	38	634	3	20774.13	5193.54
7220	254	47	348	1	669.80	261.22
7221	254	27	829	10	81611.90	23667.50
7222	254	37	55	19	164274.00	19712.88
7223	254	38	812	7	32026.33	7366.03
7224	254	25	947	1	3373.67	539.79
7225	254	15	670	3	12974.49	2854.38
7226	254	28	749	6	10100.88	2727.24
7227	254	18	456	8	43131.68	4313.20
7228	254	14	839	4	36882.80	4057.12
7229	254	46	86	6	43452.18	4779.72
7230	254	7	235	7	40002.55	8800.54
7231	254	42	365	10	35423.40	11335.50
7232	254	7	302	2	13044.88	5217.96
7233	144	18	457	10	16602.40	5146.70
7234	254	3	1	3	17210.82	5679.57
7235	254	13	764	4	30314.76	6669.24
7236	254	26	710	8	67173.04	26869.20
7237	254	26	32	3	16174.71	6308.13
7238	251	49	177	2	11478.76	1607.02
7239	254	3	601	2	7913.08	1899.14
7240	254	29	532	2	17913.94	2149.68
7241	254	18	260	5	2447.35	465.00
7242	254	25	971	6	52405.98	6812.76
7243	254	32	183	8	3468.00	901.68
7244	254	50	28	7	53970.07	10254.30
7245	814	21	236	4	22279.32	6238.20
7246	254	33	494	1	2913.87	495.36
7247	254	22	256	5	813.65	309.20
7248	254	50	635	9	24954.12	3493.62
7249	254	28	887	2	15678.68	5173.96
7250	254	41	547	4	29697.44	3860.68
7251	254	27	975	13	16243.76	2111.72
7252	254	31	521	5	42347.20	16515.40
7253	254	19	857	4	13761.88	1376.20
7254	254	5	25	1	6019.41	2166.99
7255	254	18	134	9	43512.93	7397.19
7256	254	44	987	16	129385.60	42697.28
7257	254	15	624	2	18964.80	2275.78
7258	557	44	438	2	13404.44	3083.02
7259	254	43	401	7	8138.27	1627.64
7260	254	10	382	9	19523.70	3319.02
7261	254	1	212	3	15386.67	2923.47
7262	254	33	954	7	55610.80	19463.78
7263	254	43	509	9	64255.41	19919.16
7264	254	12	405	2	10990.88	3407.18
7265	254	19	374	3	4967.76	1043.22
7266	254	31	413	7	11934.79	2864.33
7267	254	25	342	4	31807.24	9224.08
7268	254	12	166	10	71642.60	27224.20
7269	254	20	440	1	7680.91	844.90
7270	557	44	996	3	24061.29	6977.76
7271	254	7	147	3	24481.17	5385.87
7272	254	37	101	2	16992.90	4588.08
7273	254	13	709	7	50279.88	14581.14
7274	254	39	857	3	10321.41	1032.15
7275	254	5	79	8	72499.44	13774.88
7276	254	1	945	9	71986.41	12957.57
7277	254	20	448	4	18076.12	4338.28
7278	254	24	816	8	9575.84	3255.76
7279	254	46	601	10	39565.40	9495.70
7280	254	14	884	4	15392.72	4309.96
7281	254	12	591	2	1191.84	131.10
7282	254	1	2	8	16080.96	2412.16
7283	254	9	283	7	67193.91	12094.88
7284	254	19	12	8	78672.24	13374.32
7285	254	19	753	8	40634.96	10565.12
7286	447	33	182	9	57188.88	17728.56
7287	254	21	423	6	53734.98	9672.30
7288	254	47	592	7	68725.93	13057.94
7289	272	46	501	2	16684.84	5839.70
7290	254	8	709	6	43097.04	12498.12
7291	254	43	733	10	91047.20	20940.90
7292	254	10	282	6	17262.96	6732.54
7293	254	4	606	7	64608.04	24551.03
7294	254	26	708	7	44492.49	12902.82
7295	254	36	177	5	28696.90	4017.55
7296	254	29	533	1	3276.33	1245.01
7297	183	3	987	2	16173.20	5337.16
7298	254	16	460	4	13306.16	3725.72
7299	254	48	36	9	64786.59	18140.22
7300	254	34	89	3	17337.81	6414.99
7301	254	20	994	7	14033.95	2105.11
7302	254	45	114	2	18970.12	5311.64
7303	254	15	522	9	73933.92	19222.83
7304	328	46	582	10	21581.80	2158.20
7305	254	35	759	3	12914.58	2712.06
7306	254	17	126	4	17042.96	2045.16
7307	254	37	266	3	19819.29	6936.75
7308	254	34	325	3	20889.54	3342.33
7309	254	34	322	10	77598.80	30263.50
7310	254	23	576	6	5985.72	1915.44
7311	254	3	650	7	58352.42	21590.38
7312	254	2	279	3	10741.65	2470.59
7313	254	43	204	1	2907.48	930.39
7314	254	39	586	5	33350.85	4335.60
7315	536	29	363	8	62204.96	7464.56
7316	254	33	827	5	9103.85	1547.65
7317	657	20	332	3	29003.85	7541.01
7318	254	44	123	5	10812.20	1838.05
7319	254	45	319	1	6271.85	2383.30
7320	254	39	320	9	65595.33	16398.81
7321	254	49	916	4	11235.56	1910.04
7322	254	6	160	8	4194.56	1342.24
7323	254	7	406	8	26378.40	8441.12
7324	254	33	518	4	991.52	208.20
7325	254	37	99	16	75594.56	30237.76
7326	254	19	79	5	45312.15	8609.30
7327	254	21	330	6	42250.74	10985.22
7328	254	3	496	15	5791.80	1679.55
7329	820	36	120	5	39765.25	9146.00
7330	254	5	120	1	7953.05	1829.20
7331	254	21	285	8	23568.96	3535.36
7332	254	36	386	5	38061.85	12941.05
7333	254	19	899	9	55138.68	14336.10
7334	254	15	22	9	25199.82	2520.00
7335	254	27	931	7	18810.89	3009.72
7336	254	26	684	8	65836.24	12508.88
7337	254	13	549	6	35881.56	9688.02
7338	254	22	408	4	39801.64	11144.44
7339	254	38	908	10	59581.70	22045.20
7340	254	19	681	3	15367.05	2151.39
7341	254	45	209	9	14706.90	5294.52
7342	254	16	379	2	13597.34	1495.70
7343	254	18	512	1	915.47	91.55
7344	254	5	493	8	19990.96	3798.32
7345	254	37	853	10	69662.90	18809.00
7346	254	43	856	7	11685.45	2804.48
7347	254	27	730	13	111792.85	12297.22
7348	254	6	680	7	69513.43	18073.51
7349	254	48	568	6	51323.40	15910.26
7350	254	35	596	5	21235.30	3185.30
7351	254	12	978	4	10197.60	1937.56
7352	254	44	817	8	34065.12	10900.80
7353	254	47	656	6	6329.28	696.24
7354	254	19	797	1	6824.81	1501.46
7355	297	39	934	3	246.78	34.56
7356	254	13	852	6	46343.10	10658.94
7357	254	31	674	6	39696.00	14290.56
7358	254	30	216	4	19999.24	5599.80
7359	254	42	324	6	35481.90	7806.00
7360	254	4	188	5	5728.95	859.35
7361	254	20	470	8	56311.52	11825.44
7362	254	32	327	1	1407.55	394.11
7363	254	9	383	10	78476.80	16480.10
7364	529	31	729	1	5519.02	1931.66
7365	254	40	59	8	30123.52	8133.36
7366	254	7	438	8	53617.76	12332.08
7367	654	44	42	2	10523.16	3472.64
7368	254	46	891	1	7774.69	1243.95
7369	254	3	557	2	5277.30	1477.64
7370	254	2	999	1	686.27	192.16
7371	254	43	124	18	85462.92	25638.84
7372	254	21	355	10	95703.80	13398.50
7373	254	50	483	1	7382.61	1181.22
7374	254	35	370	6	8035.50	1446.42
7375	254	19	840	4	24686.92	5431.12
7376	441	8	333	10	21763.00	6528.90
7377	254	40	895	6	31664.58	12032.52
7378	253	24	135	7	37474.78	5621.21
7379	254	2	860	8	75124.08	22537.20
7380	254	26	121	3	20594.01	2265.33
7381	254	26	993	10	72014.40	18003.60
7382	254	27	793	8	53173.44	15420.32
7383	254	45	7	2	9388.22	1408.24
7384	254	26	224	5	37672.10	4520.65
7385	254	25	237	9	70485.93	16211.79
7386	254	20	50	10	19780.90	5143.00
7387	607	5	514	5	2487.45	323.35
7388	254	14	853	13	90561.77	24451.70
7389	254	17	316	10	37878.80	13636.40
7390	254	48	513	2	14050.50	3653.14
7391	254	8	224	7	52740.94	6328.91
7392	254	25	870	4	17617.28	6518.40
7393	249	35	242	2	19994.34	6598.14
7394	254	12	474	6	30069.90	4811.16
7395	254	34	614	10	97902.80	23496.70
7396	254	37	446	1	9582.74	2874.82
7397	254	28	423	1	8955.83	1612.05
7398	254	38	237	5	39158.85	9006.55
7399	254	12	168	3	1971.81	216.90
7400	254	29	280	10	81337.70	32535.10
7401	753	8	640	9	49565.34	14373.99
7402	254	11	964	2	18972.42	4932.82
7403	33	27	756	7	27725.60	9149.42
7404	254	20	238	10	71017.40	26986.60
7405	254	3	538	5	29411.70	4117.65
7406	254	2	786	8	34680.24	13178.48
7407	254	16	488	3	28878.75	3176.67
7408	254	22	966	1	4128.91	536.76
7409	254	5	17	7	13315.82	1464.75
7410	853	35	839	7	64544.90	7099.96
7411	254	19	226	7	31326.61	4072.46
7412	254	14	796	4	26993.68	4588.92
7413	254	32	838	9	46150.65	10153.17
7414	254	41	378	6	35921.70	12213.36
7415	254	44	281	2	9245.22	2033.94
7416	254	39	213	12	12712.80	1525.56
7417	254	49	566	5	16276.75	4883.05
7418	254	39	483	8	59060.88	9449.76
7419	254	23	159	9	38104.20	10669.14
7420	119	13	23	4	22690.56	6126.44
7421	641	14	573	5	8022.15	2486.85
7422	254	50	242	2	19994.34	6598.14
7423	254	40	379	5	33993.35	3739.25
7424	254	43	739	11	83046.04	19931.01
7425	254	46	183	1	433.50	112.71
7426	254	14	722	9	86421.87	23333.94
7427	797	3	433	1	1335.24	467.33
7428	254	16	474	11	55128.15	8820.46
7429	254	48	194	7	38060.54	5709.06
7430	254	32	98	3	2912.34	757.20
7431	254	8	622	4	15553.00	1555.28
7432	254	1	778	8	45666.00	17353.12
7433	254	10	821	3	21097.38	7173.12
7434	405	37	394	1	6381.39	1340.09
7435	254	12	753	4	20317.48	5282.56
7436	254	34	504	6	4300.14	817.02
7437	254	37	685	1	257.00	102.80
7438	254	28	398	10	27664.40	6086.20
7439	254	48	33	6	23726.94	7118.10
7440	254	8	177	5	28696.90	4017.55
7441	254	20	542	3	28309.56	3963.33
7442	254	6	264	6	54389.70	7614.54
7443	478	18	778	2	11416.50	4338.28
7444	254	38	511	3	4610.16	1475.25
7445	575	28	78	1	6493.90	909.15
7446	254	6	222	1	8638.54	863.85
7447	254	6	892	8	27590.80	7449.52
7448	254	23	99	1	4724.66	1889.86
7449	254	16	58	6	57355.68	11471.16
7450	254	36	301	4	10635.56	2233.48
7451	254	45	953	1	7585.62	910.27
7452	254	48	156	14	16026.64	2724.54
7453	254	38	535	5	49684.60	17886.45
7454	254	16	647	4	27913.08	3070.44
7455	254	10	358	5	123.00	36.90
7456	337	26	136	7	37939.51	8726.06
7457	284	13	921	3	13230.30	4630.59
7458	254	43	68	12	93268.56	35442.00
7459	254	43	770	4	32458.04	7140.76
7460	254	8	734	9	12261.33	4781.88
7461	689	12	731	6	33041.04	4956.18
7462	254	32	289	2	11775.38	2355.08
7463	254	30	926	1	5303.56	1485.00
7464	254	6	433	3	4005.72	1401.99
7465	254	49	691	2	16936.14	5419.56
7466	408	33	727	5	42202.40	16036.90
7467	297	39	737	5	48873.75	5376.10
7468	254	38	724	4	37120.52	10393.76
7469	254	22	628	7	28197.47	6767.39
7470	254	26	165	3	7441.05	2009.07
7471	254	38	844	4	36045.56	14057.76
7472	254	34	738	7	16217.39	3567.83
7473	254	36	815	1	6576.31	1117.97
7474	254	16	491	4	27996.24	4199.44
7475	254	25	421	2	4385.98	1315.80
7476	254	4	732	9	25051.32	2755.62
7477	254	20	110	1	9350.87	1589.65
7478	254	48	258	8	74012.88	28865.04
7479	254	40	682	8	11145.44	3343.60
7480	254	9	177	7	40175.66	5624.57
7481	458	39	659	8	46583.92	10248.48
7482	254	25	420	10	49397.00	14819.10
7483	254	50	284	4	6824.40	818.92
7484	538	9	266	9	59457.87	20810.25
7485	254	33	367	9	1451.43	377.37
7486	254	48	248	8	22580.16	6096.64
7487	254	43	434	1	8431.11	1601.91
7488	254	5	960	3	2421.90	339.06
7489	254	48	985	3	22594.38	2259.45
7490	254	46	25	9	54174.69	19502.91
7491	254	4	720	4	12619.80	4416.92
7492	773	48	370	1	1339.25	241.07
7493	477	12	876	2	2446.34	954.08
7494	254	6	24	4	5207.36	1093.56
7495	254	32	721	6	59803.44	14352.84
7496	254	39	119	3	5141.46	1336.77
7497	254	49	832	6	33477.12	6360.66
7498	254	10	420	7	34577.90	10373.37
7499	254	8	261	9	20607.03	7418.52
7500	254	19	602	10	33597.60	6383.50
7501	254	41	371	6	24715.68	6426.06
7502	254	5	757	8	8688.88	1477.12
7503	254	9	395	8	61119.44	9779.12
7504	254	20	531	10	60705.60	13962.30
7505	254	12	940	10	63872.30	8303.40
7506	254	37	457	6	9961.44	3088.02
7507	254	9	828	5	11516.75	4261.20
7508	254	47	590	1	9061.60	1178.01
7509	254	49	707	1	2828.01	452.48
7510	254	27	872	2	1700.52	221.06
7511	254	31	266	11	72670.73	25434.75
7512	254	29	742	5	36625.90	12452.80
7513	254	33	716	1	2738.83	958.59
7514	254	43	664	5	5867.70	645.45
7515	254	14	982	8	72838.64	28407.04
7516	254	25	608	10	51904.90	6747.60
7517	254	5	596	10	42470.60	6370.60
7518	254	17	687	8	15313.52	3981.52
7519	254	37	58	4	38237.12	7647.44
7520	586	24	832	9	50215.68	9540.99
7521	254	20	86	4	28968.12	3186.48
7522	254	24	223	2	17216.76	1721.68
7523	254	18	851	4	17217.64	2410.48
7524	254	44	57	5	15987.15	3836.90
7525	254	21	537	4	27769.28	7775.40
7526	254	32	147	5	40801.95	8976.45
7527	254	31	79	10	90624.30	17218.60
7528	254	17	674	7	46312.00	16672.32
7529	815	44	1000	7	15564.71	4980.71
7530	254	9	423	8	71646.64	12896.40
7531	254	44	66	9	19291.68	7523.73
7532	254	20	823	10	83174.60	22457.10
7533	254	27	54	6	862.38	258.72
7534	254	42	381	10	11685.10	3388.70
7535	789	4	785	8	37208.24	11162.48
7536	254	23	87	9	52977.60	6357.33
7537	254	27	574	4	33866.60	8466.64
7538	254	35	553	1	6531.45	2286.01
7539	806	3	348	2	1339.60	522.44
7540	254	5	224	3	22603.26	2712.39
7541	254	6	469	2	72.78	21.84
7542	254	26	587	7	1040.55	301.77
7543	132	12	554	8	32098.64	10592.56
7544	254	31	970	6	1308.96	392.70
7545	16	4	890	8	11027.20	2205.44
7546	254	42	7	7	32858.77	4928.84
7547	254	50	389	1	960.90	374.75
7548	254	36	119	9	15424.38	4010.31
7549	740	35	47	6	24885.78	9954.30
7550	254	28	273	8	29061.28	5521.68
7551	254	28	570	4	8494.48	2888.12
7552	663	38	364	6	37583.34	9771.66
7553	254	38	352	8	76515.84	16068.32
7554	845	35	282	4	11508.64	4488.36
7555	76	32	125	4	14098.04	5075.28
7556	254	16	668	7	26958.61	7818.02
7557	365	12	169	9	66919.86	10707.21
7558	254	28	244	2	12287.92	4792.28
7559	254	25	196	2	5228.94	1673.26
7560	254	37	479	9	5794.56	695.34
7561	254	22	148	5	8228.70	2468.60
7562	254	24	598	19	41887.59	10890.80
7563	254	33	373	1	8159.16	979.10
7564	254	50	40	2	8900.24	1958.06
7565	254	23	47	3	12442.89	4977.15
7566	254	15	992	4	3241.64	972.48
7567	254	28	517	3	20868.75	5217.18
7568	254	37	821	2	14064.92	4782.08
7569	254	11	875	13	119621.19	28709.07
7570	254	8	840	3	18515.19	4073.34
7571	254	17	394	14	89339.46	18761.26
7572	254	15	516	5	17279.50	6220.60
7573	254	22	977	3	25538.52	5618.46
7574	254	26	462	10	51894.90	17644.30
7575	254	8	95	9	43216.02	11236.14
7576	254	27	962	4	28857.92	5771.60
7577	254	50	907	8	401.12	48.16
7578	254	14	598	4	8818.44	2292.80
7579	254	44	773	1	1259.96	314.99
7580	254	2	270	15	3905.55	1288.80
7581	254	17	664	7	8214.78	903.63
7582	254	24	947	9	30363.03	4858.11
7583	254	38	854	7	29160.46	10206.14
7584	254	46	628	10	40282.10	9667.70
7585	254	25	538	8	47058.72	6588.24
7586	254	11	249	8	65330.80	8493.04
7587	254	44	954	11	87388.40	30585.94
7588	254	39	605	2	11094.36	4326.80
7589	254	49	533	10	32763.30	12450.10
7590	254	12	629	9	50299.02	8047.80
7591	769	26	639	7	60571.91	20594.42
7592	254	38	562	9	31108.95	7155.09
7593	254	42	393	1	4807.27	1730.62
7594	254	28	159	10	42338.00	11854.60
7595	254	33	603	4	10465.56	3139.68
7596	254	9	895	1	5277.43	2005.42
7597	254	36	932	7	22405.46	2240.56
7598	254	29	441	6	40525.02	10131.24
7599	254	28	78	1	6493.90	909.15
7600	254	37	942	8	14325.68	2148.88
7601	720	36	920	3	1169.55	385.95
7602	254	22	97	9	86912.10	14775.03
7603	254	11	887	2	15678.68	5173.96
7604	254	19	381	9	10516.59	3049.83
7605	254	15	343	7	67214.49	10082.17
7606	254	6	29	5	30128.85	6628.35
7607	254	50	254	8	14431.20	5772.48
7608	254	18	764	3	22736.07	5001.93
7609	191	33	727	6	50642.88	19244.28
7610	254	38	171	4	36696.76	12476.88
7611	254	46	483	5	36913.05	5906.10
7612	254	34	584	10	50146.70	16046.90
7613	254	14	590	2	18123.20	2356.02
7614	254	7	32	2	10783.14	4205.42
7615	254	39	760	10	38469.00	11925.40
7616	254	26	536	3	21211.23	5727.03
7617	254	37	477	8	9812.00	3336.08
7618	254	18	482	14	47051.76	10351.32
7619	254	8	538	5	29411.70	4117.65
7620	254	36	239	8	16329.84	5062.24
7621	408	33	382	5	10846.50	1843.90
7622	254	45	375	17	124758.75	49903.50
7623	254	3	909	9	44149.50	11037.42
7624	254	28	694	9	436.32	65.43
7625	254	14	700	4	20308.56	6092.56
7626	254	37	176	4	19544.64	6645.16
7627	254	47	829	6	48967.14	14200.50
7628	254	17	909	10	49055.00	12263.80
7629	254	50	747	7	967.82	154.84
7630	254	17	621	4	17417.44	5921.92
7631	254	23	156	4	4579.04	778.44
7632	254	5	785	9	41859.27	12557.79
7633	254	17	95	10	48017.80	12484.60
7634	126	18	940	5	31936.15	4151.70
7635	254	19	579	4	21720.88	7819.52
7636	254	29	710	6	50379.78	20151.90
7637	254	3	610	2	17479.38	2097.52
7638	254	44	544	3	26941.11	6465.87
7639	254	25	510	7	38874.01	5053.65
7640	254	33	818	4	34465.36	9650.32
7641	254	47	328	6	47769.54	15286.26
7642	874	9	618	8	55943.28	20139.60
7643	254	3	197	18	97248.78	24312.24
7644	254	37	386	9	68511.33	23293.89
7645	254	48	726	3	13004.37	4291.44
7646	254	39	674	5	33080.00	11908.80
7647	254	20	372	9	73020.96	20445.84
7648	254	25	217	6	28161.78	9574.98
7649	254	7	165	5	12401.75	3348.45
7650	254	28	918	2	5886.16	1706.98
7651	254	50	201	3	12128.10	2183.07
7652	254	32	116	10	22417.90	4483.60
7653	126	18	430	4	4353.56	740.12
7654	254	18	920	4	1559.40	514.60
7655	254	26	998	9	65866.50	12514.59
7656	254	37	814	5	42821.50	14987.50
7657	254	37	252	5	38605.40	4632.65
7658	254	33	540	1	5481.02	548.10
7659	254	47	594	8	58149.92	19189.44
7660	254	21	190	10	56688.50	15872.80
7661	254	36	428	9	40969.35	14339.25
7662	132	12	981	1	1771.06	425.05
7663	254	50	1	8	45895.52	15145.52
7664	254	29	858	10	96683.40	33839.20
7665	254	26	168	6	3943.62	433.80
7666	254	45	327	8	11260.40	3152.88
7667	254	49	989	3	2186.73	612.27
7668	254	26	755	5	42395.35	8055.10
7669	254	46	116	5	11208.95	2241.80
7670	254	10	37	4	37880.00	3788.00
7671	254	49	313	5	46806.65	17318.45
7672	254	10	654	5	41568.85	10807.90
7673	254	47	692	6	22003.44	2640.42
7674	254	3	328	8	63692.72	20381.68
7675	254	4	230	14	85565.06	11123.42
7676	689	12	526	3	2210.76	287.40
7677	254	40	371	1	4119.28	1071.01
7678	254	23	10	9	25436.25	9665.73
7679	254	25	230	8	48894.32	6356.24
7680	254	40	360	10	16674.30	2834.60
7681	254	45	674	1	6616.00	2381.76
7682	254	11	205	1	229.93	50.58
7683	254	26	1000	5	11117.65	3557.65
7684	254	31	95	6	28810.68	7490.76
7685	254	13	181	10	37278.00	11929.00
7686	748	35	359	8	41345.44	13644.00
7687	254	10	81	3	18343.26	6970.44
7688	30	17	43	3	28956.93	4922.67
7689	254	36	141	1	6069.67	971.15
7690	254	37	537	7	48596.24	13606.95
7691	254	26	203	4	27754.12	9436.40
7692	254	5	18	2	19978.74	3596.18
7693	254	17	715	1	7391.34	813.05
7694	254	50	746	3	13638.33	5046.18
7695	254	1	541	8	62166.40	24244.88
7696	254	17	871	1	1673.18	184.05
7697	254	34	514	5	2487.45	323.35
7698	254	41	684	3	24688.59	4690.83
7699	254	49	842	5	19666.85	4523.40
7700	254	23	721	2	19934.48	4784.28
7701	254	10	608	5	25952.45	3373.80
7702	254	7	983	7	24411.24	3905.79
7703	802	45	202	9	79075.35	13442.85
7704	254	22	81	5	30572.10	11617.40
7705	254	20	786	4	17340.12	6589.24
7706	254	48	102	4	19399.16	3103.88
7707	254	27	960	3	2421.90	339.06
7708	753	8	518	1	247.88	52.05
7709	254	13	209	7	11438.70	4117.96
7710	280	22	496	4	1544.48	447.88
7711	254	16	758	3	14316.57	5583.45
7712	254	4	233	7	31773.77	11120.83
7713	254	23	1	13	74580.22	24611.47
7714	254	32	299	7	63277.90	10757.25
7715	254	8	423	6	53734.98	9672.30
7716	254	41	20	8	21548.72	4309.76
7717	254	3	855	4	7927.32	2140.36
7718	254	41	786	5	21675.15	8236.55
7719	254	49	424	1	6256.31	2377.40
7720	254	31	441	3	20262.51	5065.62
7721	254	27	595	13	107056.43	19270.16
7722	254	5	663	7	53062.45	20163.71
7723	254	7	600	7	16575.93	5470.08
7724	254	47	8	10	33545.80	9057.40
7725	254	9	229	5	13865.65	3605.05
7726	254	3	789	10	94809.10	22754.20
7727	254	42	692	2	7334.48	880.14
7728	254	1	890	7	9648.80	1929.76
7729	254	14	145	3	22608.93	8139.21
7730	254	11	809	4	17230.24	5858.28
7731	254	23	651	7	47476.03	14242.83
7732	254	25	847	3	7461.39	2089.20
7733	254	11	952	5	100.50	19.10
7734	254	23	491	1	6999.06	1049.86
7735	254	38	484	13	117598.52	30575.61
7736	254	6	58	10	95592.80	19118.60
7737	254	45	737	8	78198.00	8601.76
7738	254	40	846	1	6680.65	1937.39
7739	254	3	694	4	193.92	29.08
7740	254	47	164	5	12857.55	2828.65
7741	434	9	657	10	4267.20	682.80
7742	254	24	566	7	22787.45	6836.27
7743	254	4	569	4	16583.20	3482.48
7744	254	27	319	4	25087.40	9533.20
7745	254	27	58	10	95592.80	19118.60
7746	254	48	866	10	29535.20	2953.50
7747	254	49	994	11	22053.35	3308.03
7748	254	2	365	2	7084.68	2267.10
7749	254	41	967	1	9637.22	3373.03
7750	254	21	278	8	65682.56	19704.80
7751	254	29	679	1	9776.44	3617.28
7752	254	24	418	4	6181.84	1050.92
7753	254	27	850	7	60449.20	12089.84
7754	254	48	970	1	218.16	65.45
7755	254	17	474	6	30069.90	4811.16
7756	197	2	53	6	58649.94	6451.50
7757	254	45	424	6	37537.86	14264.40
7758	844	42	164	2	5143.02	1131.46
7759	254	20	544	4	35921.48	8621.16
7760	254	19	324	3	17740.95	3903.00
7761	254	27	894	4	21398.48	6205.56
7762	254	40	538	4	23529.36	3294.12
7763	254	39	960	7	5651.10	791.14
7764	254	22	629	2	11177.56	1788.40
7765	254	33	687	9	17227.71	4479.21
7766	254	11	960	9	7265.70	1017.18
7767	131	24	133	6	25562.34	8691.18
7768	254	34	794	1	4720.14	613.62
7769	254	43	972	7	17093.65	5811.82
7770	254	8	566	5	16276.75	4883.05
7771	254	27	895	9	47496.87	18048.78
7772	197	2	520	3	1621.23	616.08
7773	254	5	172	8	872.48	305.36
7774	254	36	743	10	44676.90	14296.60
7775	254	3	733	2	18209.44	4188.18
7776	254	14	570	9	19112.58	6498.27
7777	477	12	905	8	7618.96	1828.56
7778	254	45	880	8	50276.56	6535.92
7779	254	6	928	4	24334.80	8030.48
7780	254	42	504	5	3583.45	680.85
7781	254	13	600	3	7103.97	2344.32
7782	254	29	563	1	7765.54	1009.52
7783	254	18	828	5	11516.75	4261.20
7784	254	24	871	8	13385.44	1472.40
7785	254	7	212	3	15386.67	2923.47
7786	254	26	408	2	19900.82	5572.22
7787	254	32	664	7	8214.78	903.63
7788	254	48	501	3	25027.26	8759.55
7789	254	7	107	7	59443.37	19021.87
7790	254	48	290	1	8876.78	1952.89
7791	254	26	962	1	7214.48	1442.90
7792	254	25	376	6	32319.12	8726.16
7793	254	22	801	7	17090.64	2392.67
7794	254	13	781	10	34122.00	4435.90
7795	254	34	857	7	24083.29	2408.35
7796	254	25	122	6	45975.60	15171.96
7797	254	17	14	5	38412.40	9219.00
7798	254	46	663	10	75803.50	28805.30
7799	254	46	609	6	54558.54	6547.02
7800	254	39	147	4	32641.56	7181.16
7801	254	34	242	6	59983.02	19794.42
7802	254	36	977	5	42564.20	9364.10
7803	807	20	2	7	14070.84	2110.64
7804	254	32	318	10	36924.00	7384.80
7805	254	1	525	8	55114.40	19841.20
7806	254	22	106	4	34616.24	6230.92
7807	254	37	837	9	84042.18	25212.69
7808	583	43	93	7	35125.58	11240.18
7809	254	46	316	6	22727.28	8181.84
7810	254	14	725	8	45064.72	4957.12
7811	254	10	306	4	28883.24	11264.48
7812	254	1	215	1	9630.37	2022.38
7813	254	27	335	8	36414.16	4369.68
7814	254	1	359	9	46513.62	15349.50
7815	254	19	315	6	26539.02	6103.98
7816	254	19	646	2	11659.74	3381.32
7817	254	19	500	11	63612.78	12722.60
7818	254	3	486	5	31483.50	7241.20
7819	254	33	573	8	12835.44	3978.96
7820	254	13	298	9	64741.59	9063.81
7821	254	2	54	6	862.38	258.72
7822	254	48	670	9	38923.47	8563.14
7823	254	2	78	8	51951.20	7273.20
7824	254	13	711	5	16935.25	2540.30
7825	254	18	69	8	51034.40	14800.00
7826	254	27	626	7	32294.01	11302.90
7827	254	24	488	4	38505.00	4235.56
7828	254	17	179	18	5882.04	1647.00
7829	254	31	120	9	71577.45	16462.80
7830	254	17	531	1	6070.56	1396.23
7831	254	43	626	9	41520.87	14532.30
7832	254	15	989	7	5102.37	1428.63
7833	167	3	984	4	22638.64	2943.04
7834	437	29	24	9	11716.56	2460.51
7835	254	23	436	6	41041.80	10260.42
7836	254	19	11	3	7340.94	2936.37
7837	254	50	54	6	862.38	258.72
7838	254	45	646	20	116597.40	33813.20
7839	425	1	463	3	28276.59	6220.86
7840	254	3	459	4	2388.36	835.92
7841	254	7	389	6	5765.40	2248.50
7842	254	43	313	3	28083.99	10391.07
7843	254	27	983	17	59284.44	9485.49
7844	870	21	16	9	36052.20	6489.36
7845	254	7	939	8	17484.72	6993.92
7846	254	45	725	1	5633.09	619.64
7847	254	19	56	9	69451.92	27780.75
7848	254	43	857	7	24083.29	2408.35
7849	728	12	333	6	13057.80	3917.34
7850	254	16	507	9	65874.33	18444.78
7851	254	24	387	2	10803.06	3348.94
7852	738	40	163	6	20221.14	5257.50
7853	254	43	840	1	6171.73	1357.78
7854	254	50	549	4	23921.04	6458.68
7855	254	21	577	2	15620.16	2655.42
7856	167	47	638	6	52087.80	19272.48
7857	254	24	230	10	61117.90	7945.30
7858	254	11	98	5	4853.90	1262.00
7859	254	25	775	8	1647.68	214.16
7860	254	8	865	7	64469.72	10959.83
7861	254	4	780	5	32041.15	7049.05
7862	254	1	358	1	24.60	7.38
7863	254	21	677	3	6797.52	2583.06
7864	254	39	513	2	14050.50	3653.14
7865	254	21	515	6	52986.00	15365.94
7866	254	5	745	9	73399.77	12477.96
7867	254	36	979	5	44546.55	14700.35
7868	254	16	984	10	56596.60	7357.60
7869	254	7	85	1	3564.67	998.11
7870	254	48	489	16	112149.92	25794.56
7871	254	14	56	2	15433.76	6173.50
7872	254	23	991	2	6496.64	1039.46
7873	788	13	352	8	76515.84	16068.32
7874	254	23	454	9	43550.37	7839.09
7875	254	35	444	3	29567.04	9461.46
7876	254	27	149	1	6395.53	959.33
7877	254	2	917	5	4548.60	500.35
7878	254	32	592	5	49089.95	9327.10
7879	254	4	237	1	7831.77	1801.31
7880	254	7	223	6	51650.28	5165.04
7881	254	33	489	7	49065.59	11285.12
7882	254	5	762	3	16085.07	1769.37
7883	254	19	924	2	14047.20	1404.72
7884	254	2	555	1	2571.31	411.41
7885	262	31	355	7	66992.66	9378.95
7886	254	14	352	5	47822.40	10042.70
7887	254	46	161	5	38043.40	13315.20
7888	254	23	604	10	29435.90	5592.80
7889	641	47	934	1	82.26	11.52
7890	254	40	505	8	20781.92	4364.24
7891	254	7	27	5	22945.95	7801.60
7892	220	3	980	10	75729.20	15145.80
7893	101	5	545	10	5768.70	2076.70
7894	586	24	458	3	21155.19	6135.00
7895	595	10	598	1	2204.61	573.20
7896	254	9	460	14	46571.56	13040.02
7897	254	46	163	3	10110.57	2628.75
7898	254	43	833	6	23825.94	7386.06
7899	254	19	863	1	3191.30	1212.69
7900	254	18	499	2	14787.92	3992.74
7901	254	24	689	10	45400.30	14528.10
7902	254	11	64	10	24642.20	8378.30
7903	254	26	100	2	11465.94	2407.84
7904	254	20	810	10	41825.60	15893.70
7905	833	6	148	7	11520.18	3456.04
7906	254	21	11	7	17128.86	6851.53
7907	254	7	888	2	11515.58	3109.20
7908	254	11	267	9	58235.58	12229.47
7909	254	17	361	6	23528.16	4235.04
7910	254	3	245	11	88108.90	25551.57
7911	254	8	613	9	56324.16	7885.35
7912	254	44	993	10	72014.40	18003.60
7913	254	41	244	2	12287.92	4792.28
7914	254	40	536	8	56563.28	15272.08
7915	254	41	614	8	78322.24	18797.36
7916	46	46	968	8	29979.52	7794.64
7917	684	15	654	7	58196.39	15131.06
7918	254	22	529	3	10769.31	3661.56
7919	101	5	799	3	17580.15	4922.43
7920	254	27	885	1	935.10	355.34
7921	254	1	354	4	24345.52	2434.56
7922	254	25	587	5	743.25	215.55
7923	254	32	851	2	8608.82	1205.24
7924	243	39	545	10	5768.70	2076.70
7925	254	4	87	2	11772.80	1412.74
7926	254	20	706	7	57588.30	5758.83
7927	254	40	985	5	37657.30	3765.75
7928	254	30	783	6	51240.84	17421.90
7929	360	10	810	1	4182.56	1589.37
7930	254	44	607	9	55154.97	12134.07
7931	254	43	915	8	19900.16	4179.04
7932	254	37	510	1	5553.43	721.95
7933	254	45	884	10	38481.80	10774.90
7934	254	22	88	11	19256.71	5584.48
7935	254	2	683	10	4758.30	1570.20
7936	254	38	975	2	2499.04	324.88
7937	254	48	515	5	44155.00	12804.95
7938	83	44	383	2	15695.36	3296.02
7939	254	34	706	6	49361.40	4936.14
7940	254	6	675	8	3720.88	1339.52
7941	254	20	921	10	44101.00	15435.30
7942	254	48	807	3	16136.31	5647.71
7943	254	17	87	7	41204.80	4944.59
7944	254	28	21	5	2585.50	336.10
7945	630	11	740	4	24765.08	9906.04
7946	254	14	224	8	60275.36	7233.04
7947	254	28	648	8	54250.64	14647.68
7948	575	28	516	7	24191.30	8708.84
7949	254	6	388	7	39059.86	10155.53
7950	254	14	578	15	33577.20	4029.30
7951	254	5	125	1	3524.51	1268.82
7952	349	10	430	4	4353.56	740.12
7953	254	18	840	10	61717.30	13577.80
7954	254	2	291	1	2403.11	841.09
7955	254	16	108	7	43318.94	6064.66
7956	254	43	500	5	28914.90	5783.00
7957	254	46	744	9	7728.75	1777.59
7958	254	29	897	10	20174.50	7868.10
7959	254	8	60	9	24287.40	2671.65
7960	254	44	322	3	23279.64	9079.05
7961	254	16	260	10	4894.70	930.00
7962	254	27	918	14	41203.12	11948.86
7963	281	37	540	6	32886.12	3288.60
7964	254	48	291	9	21627.99	7569.81
7965	684	15	906	3	23710.68	7113.21
7966	254	5	219	4	36598.28	14273.32
7967	254	40	593	16	7765.60	2873.28
7968	254	5	403	9	6244.56	686.88
7969	254	45	748	8	29962.88	4794.08
7970	254	23	976	10	1047.40	293.30
7971	254	34	167	4	29864.44	3583.72
7972	254	36	643	6	43082.70	9909.00
7973	36	26	942	8	14325.68	2148.88
7974	254	25	238	4	28406.96	10794.64
7975	395	11	585	4	21496.32	2364.60
7976	254	27	365	6	21254.04	6801.30
7977	254	16	292	4	31659.84	9181.36
7978	254	33	959	6	41397.66	9935.46
7979	254	13	995	6	57747.48	15591.84
7980	254	16	788	8	29292.40	4686.80
7981	254	42	628	3	12084.63	2900.31
7982	254	34	835	7	17179.68	4466.70
7983	254	45	997	7	32034.94	4805.22
7984	272	49	639	2	17306.26	5884.12
7985	254	11	491	15	104985.90	15747.90
7986	487	5	24	9	11716.56	2460.51
7987	254	25	458	10	70517.30	20450.00
7988	254	37	766	10	15338.20	4448.10
7989	254	24	979	4	35637.24	11760.28
7990	254	18	789	5	47404.55	11377.10
7991	254	47	621	7	30480.52	10363.36
7992	254	19	361	7	27449.52	4940.88
7993	254	21	504	1	716.69	136.17
7994	101	5	849	10	38801.10	15132.40
7995	254	47	806	1	5033.13	1711.26
7996	254	40	170	5	46412.80	17636.85
7997	254	40	225	6	33930.12	10518.36
7998	254	31	701	12	101972.76	29572.08
7999	254	42	80	7	33667.76	13130.46
8000	254	34	7	1	4694.11	704.12
8001	144	18	642	3	14463.75	4773.03
8002	254	12	656	10	10548.80	1160.40
8003	254	21	926	1	5303.56	1485.00
8004	254	22	858	2	19336.68	6767.84
8005	781	7	449	2	17388.24	2608.24
8006	254	17	360	3	5002.29	850.38
8007	254	11	542	9	84928.68	11889.99
8008	254	50	753	1	5079.37	1320.64
8009	254	7	473	10	83181.30	18299.90
8010	254	8	323	3	6263.19	1878.96
8011	254	45	431	10	20898.70	5015.70
8012	254	34	879	5	24516.75	6129.20
8013	254	19	133	8	34083.12	11588.24
8014	254	12	63	7	54174.26	8667.89
8015	254	34	987	9	72779.40	24017.22
8016	254	45	467	9	85758.03	30015.27
8017	254	31	158	10	87372.00	27959.00
8018	254	1	437	9	48745.44	17060.94
8019	254	25	496	7	2702.84	783.79
8020	254	41	945	5	39992.45	7198.65
8021	254	18	19	5	49221.55	6398.80
8022	254	50	141	3	18209.01	2913.45
8023	254	26	924	10	70236.00	7023.60
8024	254	9	889	3	13239.81	3045.15
8025	254	14	153	5	2558.35	997.75
8026	254	48	37	8	75760.00	7576.00
8027	254	29	530	7	28084.91	4493.58
8028	254	18	879	5	24516.75	6129.20
8029	254	19	768	7	69638.73	22980.79
8030	254	45	427	6	11368.62	2046.36
8031	844	12	939	4	8742.36	3496.96
8032	671	18	255	10	5110.20	1941.90
8033	291	2	727	7	59083.36	22451.66
8034	254	9	351	9	1878.21	187.83
8035	254	1	753	7	35555.59	9244.48
8036	254	24	562	8	27652.40	6360.08
8037	207	29	366	7	1490.09	149.03
8038	254	46	730	1	8599.45	945.94
8039	254	41	424	6	37537.86	14264.40
8040	254	28	627	9	52788.78	7918.29
8041	254	46	646	2	11659.74	3381.32
8042	254	42	325	4	27852.72	4456.44
8043	254	16	269	8	68055.28	13611.04
8044	254	43	419	8	25415.44	9149.52
8045	254	37	383	10	78476.80	16480.10
8046	254	6	783	6	51240.84	17421.90
8047	254	35	328	5	39807.95	12738.55
8048	365	12	774	9	78434.55	14902.56
8049	132	12	113	7	8235.36	1976.52
8050	738	40	682	1	1393.18	417.95
8051	254	7	16	1	4005.80	721.04
8052	254	20	463	10	94255.30	20736.20
8053	254	17	281	1	4622.61	1016.97
8054	254	3	290	10	88767.80	19528.90
8055	660	47	988	8	27829.28	5287.60
8056	254	28	628	10	40282.10	9667.70
8057	254	36	10	6	16957.50	6443.82
8058	254	42	328	7	55731.13	17833.97
8059	254	10	579	8	43441.76	15639.04
8060	254	23	459	10	5970.90	2089.80
8061	254	24	804	7	31722.95	12054.70
8062	254	14	499	2	14787.92	3992.74
8063	254	9	626	7	32294.01	11302.90
8064	254	17	174	9	57388.77	16068.87
8065	254	13	935	2	6126.56	980.24
8066	254	45	471	5	36750.75	9555.20
8067	254	15	261	9	20607.03	7418.52
8068	254	12	620	7	26520.90	9547.51
8069	254	11	94	7	61176.01	18352.81
8070	254	23	951	6	17063.22	5118.96
8071	254	29	86	3	21726.09	2389.86
8072	254	3	333	4	8705.20	2611.56
8073	254	5	315	10	44231.70	10173.30
8074	254	26	349	10	49040.90	14221.90
8075	254	12	372	7	56794.08	15902.32
8076	254	2	571	7	44044.70	4844.91
8077	254	41	3	4	34574.68	8643.68
8078	254	24	859	1	7440.26	2752.90
8079	254	2	945	12	95981.88	17276.76
8080	580	9	658	9	76552.47	20669.13
8081	254	46	342	4	31807.24	9224.08
8082	254	21	704	6	52960.20	19595.28
8083	254	50	936	3	13886.01	4443.51
8084	254	6	953	14	106198.68	12743.78
8085	254	39	545	8	4614.96	1661.36
8086	254	7	118	1	2336.54	630.87
8087	254	32	948	9	62012.97	21084.39
8088	467	28	361	7	27449.52	4940.88
8089	527	17	174	1	6376.53	1785.43
8090	254	7	606	6	55378.32	21043.74
8091	254	31	860	9	84514.59	25354.35
8092	254	16	810	9	37643.04	14304.33
8093	461	40	113	1	1176.48	282.36
8094	254	32	808	6	55108.98	12123.96
8095	254	36	637	10	34189.50	13333.90
8096	234	31	738	3	6950.31	1529.07
8097	7	30	844	8	72091.12	28115.52
8098	254	11	898	1	5025.89	1909.84
8099	254	26	616	10	10551.90	4220.80
8100	615	12	128	8	25199.68	3779.92
8101	660	47	109	6	23150.94	6250.74
8102	254	15	115	6	26944.38	5658.30
8103	254	42	28	1	7710.01	1464.90
8104	862	32	362	5	47107.25	14132.15
8105	254	38	513	9	63227.25	16439.13
8106	254	12	411	1	6569.95	1379.69
8107	254	19	918	9	26487.72	7681.41
8108	254	43	26	2	7325.40	732.54
8109	254	13	247	7	43876.00	6142.64
8110	254	16	434	2	16862.22	3203.82
8111	254	1	187	3	4497.78	494.76
8112	254	42	963	7	44632.77	8480.22
8113	254	11	280	4	32535.08	13014.04
8114	254	49	142	5	22702.65	5902.70
8115	254	9	747	6	829.56	132.72
8116	331	11	367	5	806.35	209.65
8117	689	12	446	2	19165.48	5749.64
8118	532	24	775	1	205.96	26.77
8119	254	27	306	6	43324.86	16896.72
8120	254	37	518	5	1239.40	260.25
8121	254	18	951	4	11375.48	3412.64
8122	254	7	855	19	37654.77	10166.71
8123	254	33	304	5	41801.45	6688.25
8124	254	1	680	2	19860.98	5163.86
8125	254	31	361	11	43134.96	7764.24
8126	254	36	529	7	25128.39	8543.64
8127	254	34	286	1	4704.04	1364.17
8128	254	26	523	9	72912.24	28435.77
8129	254	10	960	1	807.30	113.02
8130	254	43	338	4	12442.36	4976.96
8131	254	6	767	2	12908.28	4388.82
8132	254	18	416	7	14563.01	5533.92
8133	254	21	904	1	9464.05	1703.53
8134	254	44	575	9	50035.41	19013.49
8135	254	24	439	4	16793.24	2183.12
8136	254	17	706	10	82269.00	8226.90
8137	254	7	842	8	31466.96	7237.44
8138	254	44	692	3	11001.72	1320.21
8139	254	27	230	7	42782.53	5561.71
8140	254	8	942	3	5372.13	805.83
8141	254	25	464	5	2606.05	912.10
8142	254	4	944	2	8983.24	2425.48
8143	254	26	163	9	30331.71	7886.25
8144	254	2	545	4	2307.48	830.68
8145	254	33	199	9	54334.62	9780.21
8146	581	32	673	5	26260.50	7615.55
8147	254	39	100	6	34397.82	7223.52
8148	254	50	39	3	26596.02	3989.40
8149	254	10	498	6	42492.18	15722.10
8150	254	43	27	7	32124.33	10922.24
8151	808	42	644	4	3422.72	1163.72
8152	254	9	379	8	54389.36	5982.80
8153	254	35	334	11	96253.41	23100.77
8154	254	5	769	3	28469.19	5124.45
8155	654	44	556	10	62226.00	11200.70
8156	254	48	397	17	92848.56	10213.26
8157	254	14	580	3	17021.82	2553.27
8158	742	33	441	2	13508.34	3377.08
8159	254	43	556	9	56003.40	10080.63
8160	254	43	321	1	5813.92	1395.34
8161	254	19	962	7	50501.36	10100.30
8162	254	46	726	7	30343.53	10013.36
8163	254	45	632	5	1288.85	270.65
8164	254	23	340	9	69774.21	19536.75
8165	254	45	304	1	8360.29	1337.65
8166	254	8	966	7	28902.37	3757.32
8167	137	45	289	3	17663.07	3532.62
8168	254	27	156	5	5723.80	973.05
8169	254	35	9	9	65967.84	20450.07
8170	254	3	212	3	15386.67	2923.47
8171	254	45	705	8	60748.16	10934.64
8172	254	13	872	2	1700.52	221.06
8173	254	7	273	8	29061.28	5521.68
8174	254	42	115	2	8981.46	1886.10
8175	254	11	795	4	26688.40	8807.16
8176	254	39	209	8	13072.80	4706.24
8177	191	44	598	3	6613.83	1719.60
8178	254	26	663	4	30321.40	11522.12
8179	254	33	943	9	56101.50	21879.63
8180	254	49	499	5	36969.80	9981.85
8181	491	47	355	10	95703.80	13398.50
8182	254	11	315	2	8846.34	2034.66
8183	254	17	19	2	19688.62	2559.52
8184	254	29	226	2	8950.46	1163.56
8185	254	43	292	9	71234.64	20658.06
8186	254	20	8	3	10063.74	2717.22
8187	254	45	93	4	20071.76	6422.96
8188	254	50	187	10	14992.60	1649.20
8189	254	22	338	8	24884.72	9953.92
8190	254	45	510	4	22213.72	2887.80
8191	250	32	116	3	6725.37	1345.08
8192	254	39	590	8	72492.80	9424.08
8193	254	26	622	6	23329.50	2332.92
8194	254	3	772	9	44239.59	12387.06
8195	254	34	577	4	31240.32	5310.84
8196	254	14	813	2	12949.32	3107.84
8197	254	40	413	3	5114.91	1227.57
8198	254	41	606	9	83067.48	31565.61
8199	786	10	825	7	7857.78	2278.78
8200	254	26	845	1	8881.82	1865.18
8201	254	22	591	9	5363.28	589.95
8202	254	50	799	6	35160.30	9844.86
8203	254	49	137	10	63863.20	20436.20
8204	254	39	856	6	10016.10	2403.84
8205	254	8	216	9	44998.29	12599.55
8206	254	22	875	3	27604.89	6625.17
8207	254	44	625	3	20193.18	4644.42
8208	254	48	167	6	44796.66	5375.58
8209	254	8	703	1	6254.14	1375.91
8210	254	42	600	7	16575.93	5470.08
8211	254	23	500	6	34697.88	6939.60
8212	254	45	718	5	43147.95	9924.05
8213	254	45	763	7	26511.73	7688.38
8214	254	43	163	2	6740.38	1752.50
8215	254	34	57	10	31974.30	7673.80
8216	254	16	398	1	2766.44	608.62
8217	254	45	436	9	61562.70	15390.63
8218	254	39	626	2	9226.86	3229.40
8219	254	31	384	2	19671.80	2163.90
8220	254	39	563	3	23296.62	3028.56
8221	254	6	352	7	66951.36	14059.78
8222	761	20	287	6	17435.40	6451.08
8223	254	13	280	8	65070.16	26028.08
8224	254	40	72	1	7801.66	1248.27
8225	559	14	632	4	1031.08	216.52
8226	254	11	279	7	25063.85	5764.71
8227	254	3	30	7	45808.28	6871.27
8228	254	15	271	10	59756.30	11353.70
8229	254	36	268	3	20640.57	2064.06
8230	254	48	824	10	80704.10	26632.40
8231	254	49	693	1	4770.76	1717.47
8232	254	50	705	7	53154.64	9567.81
8233	254	27	80	3	14429.04	5627.34
8234	254	43	610	2	17479.38	2097.52
8235	254	2	246	10	12470.20	3242.30
8236	254	18	232	4	39885.28	8375.92
8237	254	36	199	5	30185.90	5433.45
8238	254	44	852	6	46343.10	10658.94
8239	254	40	21	5	2585.50	336.10
8240	254	41	953	2	15171.24	1820.54
8241	254	20	751	2	5116.08	1944.12
8242	254	22	265	9	12013.02	1922.04
8243	254	27	641	7	43978.48	13633.34
8244	653	41	901	1	1679.56	319.12
8245	254	18	858	10	96683.40	33839.20
8246	254	24	214	7	3836.14	728.84
8247	119	13	625	10	67310.60	15481.40
8248	146	31	7	4	18776.44	2816.48
8249	254	34	620	6	22732.20	8183.58
8250	270	13	517	2	13912.50	3478.12
8251	254	20	866	6	17721.12	1772.10
8252	417	31	26	1	3662.70	366.27
8253	254	2	250	6	22433.04	7178.58
8254	254	37	795	1	6672.10	2201.79
8255	199	49	609	5	45465.45	5455.85
8256	254	27	406	4	13189.20	4220.56
8257	254	21	23	8	45381.12	12252.88
8258	254	2	332	8	77343.60	20109.36
8259	254	1	705	7	53154.64	9567.81
8260	254	30	653	8	28055.60	5891.68
8261	254	2	812	2	9150.38	2104.58
8262	397	28	902	4	3655.72	804.24
8263	254	16	784	1	9045.31	3437.22
8264	254	11	860	5	46952.55	14085.75
8265	254	20	771	8	16697.84	1836.80
8266	720	43	756	2	7921.60	2614.12
8267	254	6	911	3	7086.06	1629.78
8268	254	14	167	8	59728.88	7167.44
8269	250	32	555	5	12856.55	2057.05
8270	254	17	995	7	67372.06	18190.48
8271	254	22	559	14	86008.44	24082.38
8272	254	21	609	5	45465.45	5455.85
8273	254	28	982	4	36419.32	14203.52
8274	254	45	132	6	18290.58	6035.88
8275	254	15	77	1	6867.68	1579.57
8276	254	26	9	9	65967.84	20450.07
8277	254	9	968	7	26232.08	6820.31
8278	254	45	545	1	576.87	207.67
8279	76	32	606	6	55378.32	21043.74
8280	254	26	152	10	24315.80	3890.50
8281	254	49	985	2	15062.92	1506.30
8282	254	45	837	6	56028.12	16808.46
8283	254	24	746	6	27276.66	10092.36
8284	254	38	444	7	68989.76	22076.74
8285	254	23	505	1	2597.74	545.53
8286	254	26	623	7	50178.24	10035.62
8287	653	41	1000	8	17788.24	5692.24
8288	254	10	171	1	9174.19	3119.22
8289	254	33	913	3	9813.00	1864.47
8290	250	32	986	9	68695.92	22669.65
8291	254	33	527	12	45003.36	10350.72
8292	254	20	780	4	25632.92	5639.24
8293	254	49	896	4	3646.04	729.20
8294	254	48	356	1	4458.68	847.15
8295	477	12	761	7	68917.17	22053.50
8296	254	44	320	7	51018.59	12754.63
8297	254	6	12	4	39336.12	6687.16
8298	254	4	380	8	20979.04	4825.20
8299	254	18	321	10	58139.20	13953.40
8300	254	10	989	6	4373.46	1224.54
8301	862	32	851	6	25826.46	3615.72
8302	254	27	812	9	41176.71	9470.61
8303	254	25	853	9	62696.61	16928.10
8304	254	18	829	10	81611.90	23667.50
8305	254	17	617	10	59305.20	22536.00
8306	254	39	935	2	6126.56	980.24
8307	452	14	336	9	37728.54	4904.73
8308	254	7	269	5	42534.55	8506.90
8309	33	27	106	5	43270.30	7788.65
8310	810	41	174	10	63765.30	17854.30
8311	254	11	418	4	6181.84	1050.92
8312	254	27	297	1	7729.68	1314.05
8313	254	34	545	6	3461.22	1246.02
8314	254	22	458	9	63465.57	18405.00
8315	254	25	672	3	22060.71	4191.54
8316	254	32	537	5	34711.60	9719.25
8317	200	12	446	10	95827.40	28748.20
8318	254	36	623	5	35841.60	7168.30
8319	254	19	119	6	10282.92	2673.54
8320	254	37	183	6	2601.00	676.26
8321	254	4	592	9	88361.91	16788.78
8322	254	21	826	4	23604.92	6137.28
8323	254	26	55	1	8646.00	1037.52
8324	254	50	454	8	38711.44	6968.08
8325	175	1	74	2	710.10	163.32
8326	254	1	723	1	5300.41	1060.08
8327	254	13	960	10	8073.00	1130.20
8328	254	32	245	3	24029.70	6968.61
8329	254	47	898	2	10051.78	3819.68
8330	802	45	348	8	5358.40	2089.76
8331	254	11	718	3	25888.77	5954.43
8332	254	39	473	5	41590.65	9149.95
8333	254	21	485	7	49309.54	15285.97
8334	254	49	110	10	93508.70	15896.50
8335	254	32	149	7	44768.71	6715.31
8336	254	47	752	5	15555.40	4977.75
8337	254	22	21	1	517.10	67.22
8338	254	40	331	3	6438.78	2253.57
8339	254	5	812	9	41176.71	9470.61
8340	254	27	339	18	134747.46	49856.58
8341	254	17	918	6	17658.48	5120.94
8342	254	27	715	1	7391.34	813.05
8343	95	1	139	1	9047.48	1899.97
8344	254	22	896	10	9115.10	1823.00
8345	254	26	280	3	24401.31	9760.53
8346	254	11	961	1	8876.90	1864.15
8347	254	18	726	10	43347.90	14304.80
8348	510	46	985	5	37657.30	3765.75
8349	254	14	585	2	10748.16	1182.30
8350	254	14	708	9	57204.63	16589.34
8351	254	6	142	6	27243.18	7083.24
8352	254	36	113	3	3529.44	847.08
8353	254	31	12	7	68838.21	11702.53
8354	254	45	701	2	16995.46	4928.68
8355	34	3	704	10	88267.00	32658.80
8356	254	19	100	4	22931.88	4815.68
8357	254	47	383	10	78476.80	16480.10
8358	254	11	230	2	12223.58	1589.06
8359	254	36	30	9	58896.36	8834.49
8360	254	26	721	6	59803.44	14352.84
8361	254	5	970	7	1527.12	458.15
8362	254	50	600	7	16575.93	5470.08
8363	254	9	413	1	1704.97	409.19
8364	254	47	774	8	69719.60	13246.72
8365	254	27	831	17	7005.53	1401.14
8366	254	2	726	3	13004.37	4291.44
8367	254	44	529	3	10769.31	3661.56
8368	254	19	55	7	60522.00	7262.64
8369	254	3	434	10	84311.10	16019.10
8370	254	13	794	10	47201.40	6136.20
8371	254	16	122	9	68963.40	22757.94
8372	254	46	226	1	4475.23	581.78
8373	254	22	48	6	24006.84	9362.64
8374	254	20	933	9	72493.56	26097.66
8375	546	5	868	1	3684.52	773.75
8376	254	41	514	10	4974.90	646.70
8377	254	3	848	4	17747.40	4259.36
8378	254	48	799	3	17580.15	4922.43
8379	254	3	61	7	12251.96	4778.27
8380	254	11	648	9	61031.97	16478.64
8381	254	25	218	2	15255.10	1830.62
8382	527	17	70	2	4538.56	816.94
8383	254	16	975	10	12495.20	1624.40
8384	477	48	320	5	36441.85	9110.45
8385	254	42	336	5	20960.30	2724.85
8386	254	2	189	8	9775.84	1955.20
8387	254	14	155	6	32053.50	8333.94
8388	254	16	768	2	19896.78	6565.94
8389	254	26	809	6	25845.36	8787.42
8390	254	12	217	3	14080.89	4787.49
8391	254	4	89	7	40454.89	14968.31
8392	254	21	126	9	38346.66	4601.61
8393	254	44	831	10	4120.90	824.20
8394	254	43	953	9	68270.58	8192.43
8395	254	43	879	10	49033.50	12258.40
8396	254	23	89	9	52013.43	19244.97
8397	254	28	317	4	15972.96	6069.72
8398	254	39	670	2	8649.66	1902.92
8399	297	39	563	8	62124.32	8076.16
8400	254	28	645	1	195.84	68.54
8401	254	3	567	4	29339.60	3227.36
8402	254	36	360	8	13339.44	2267.68
8403	254	18	406	2	6594.60	2110.28
8404	254	3	168	4	2629.08	289.20
8405	254	22	601	6	23739.24	5697.42
8406	99	43	526	10	7369.20	958.00
8407	254	8	125	8	28196.08	10150.56
8408	417	31	173	6	38474.58	13850.82
8409	254	31	219	4	36598.28	14273.32
8410	254	12	588	6	9981.78	2595.24
8411	254	34	419	4	12707.72	4574.76
8412	254	34	958	4	34729.52	6251.32
8413	595	37	673	2	10504.20	3046.22
8414	254	14	611	9	62285.85	21800.07
8415	254	50	675	10	4651.10	1674.40
8416	254	46	421	4	8771.96	2631.60
8417	254	32	970	10	2181.60	654.50
8418	254	3	895	8	42219.44	16043.36
8419	485	27	765	10	296.10	65.10
8420	254	34	563	12	93186.48	12114.24
8421	254	37	751	2	5116.08	1944.12
8422	325	6	970	4	872.64	261.80
8423	254	31	246	6	7482.12	1945.38
8424	696	30	654	1	8313.77	2161.58
8425	254	43	408	9	89553.69	25074.99
8426	254	3	150	8	66467.36	19940.24
8427	254	28	117	2	7233.82	2893.52
8428	254	9	482	5	16804.20	3696.90
8429	254	12	547	6	44546.16	5791.02
8430	254	37	164	1	2571.51	565.73
8431	254	6	754	7	235.27	63.49
8432	254	9	358	10	246.00	73.80
8433	254	19	971	8	69874.64	9083.68
8434	254	6	796	2	13496.84	2294.46
8435	254	26	381	5	5842.55	1694.35
8436	254	40	29	9	54231.93	11931.03
8437	254	30	669	1	3258.34	749.42
8438	254	12	784	2	18090.62	6874.44
8439	254	43	583	4	21017.24	5044.12
8440	254	7	314	5	35526.00	11723.60
8441	254	15	844	3	27034.17	10543.32
8442	254	41	46	3	29760.99	6547.41
8443	254	26	137	6	38317.92	12261.72
8444	254	37	540	6	32886.12	3288.60
8445	595	37	876	3	3669.51	1431.12
8446	254	8	701	10	84977.30	24643.40
8447	254	38	169	4	29742.16	4758.76
8448	254	22	503	8	29854.08	6866.40
8449	254	17	765	5	148.05	32.55
8450	29	2	815	6	39457.86	6707.82
8451	254	28	957	10	51479.10	7207.10
8452	254	46	805	9	25305.12	8603.73
8453	254	24	555	4	10285.24	1645.64
8454	254	27	64	3	7392.66	2513.49
8455	254	32	684	7	57606.71	10945.27
8456	254	11	872	3	2550.78	331.59
8457	254	29	663	7	53062.45	20163.71
8458	254	28	446	2	19165.48	5749.64
8459	254	36	989	1	728.91	204.09
8460	254	36	350	4	28131.48	10971.28
8461	254	10	562	2	6913.10	1590.02
8462	254	5	482	3	10082.52	2218.14
8463	254	6	818	1	8616.34	2412.58
8464	377	49	804	10	45318.50	17221.00
8465	254	18	859	5	37201.30	13764.50
8466	636	24	126	9	38346.66	4601.61
8467	254	38	638	6	52087.80	19272.48
8468	137	45	777	3	29280.90	6441.81
8469	254	4	677	4	9063.36	3444.08
8470	254	14	779	6	41816.22	12963.00
8471	254	14	313	4	37445.32	13854.76
8472	304	27	631	1	2653.69	291.91
8473	485	27	294	8	47124.64	8482.40
8474	146	31	610	1	8739.69	1048.76
8475	254	46	280	8	65070.16	26028.08
8476	254	29	957	1	5147.91	720.71
8477	254	7	762	3	16085.07	1769.37
8478	254	2	852	5	38619.25	8882.45
8479	254	4	603	7	18314.73	5494.44
8480	254	15	323	5	10438.65	3131.60
8481	254	17	471	5	36750.75	9555.20
8482	254	32	542	8	75492.16	10568.88
8483	33	4	500	10	57829.80	11566.00
8484	254	11	607	9	55154.97	12134.07
8485	254	19	896	1	911.51	182.30
8486	660	4	998	2	14637.00	2781.02
8487	254	37	588	1	1663.63	432.54
8488	254	2	445	8	67149.12	10743.84
8489	254	34	209	1	1634.10	588.28
8490	254	19	62	9	39931.74	9184.32
8491	254	11	827	1	1820.77	309.53
8492	538	14	695	4	39819.96	13937.00
8493	254	50	764	9	68208.21	15005.79
8494	254	21	204	5	14537.40	4651.95
8495	254	23	137	6	38317.92	12261.72
8496	254	6	820	2	3694.74	1367.06
8497	254	3	383	6	47086.08	9888.06
8498	256	29	825	5	5612.70	1627.70
8499	254	4	73	4	9421.56	1130.60
8500	254	15	185	1	7721.54	1544.31
8501	254	23	478	10	78488.60	10203.50
8502	254	19	43	1	9652.31	1640.89
8503	254	21	221	7	46093.53	13828.08
8504	254	22	737	3	29324.25	3225.66
8505	254	43	430	10	10883.90	1850.30
8506	254	2	102	5	24248.95	3879.85
8507	254	41	298	1	7193.51	1007.09
8508	107	8	567	9	66014.10	7261.56
8509	254	38	300	9	71116.38	22757.22
8510	254	16	933	7	56383.88	20298.18
8511	491	47	145	10	75363.10	27130.70
8512	254	47	955	2	2044.10	735.88
8513	124	10	380	5	13111.90	3015.75
8514	254	7	97	4	38627.60	6566.68
8515	254	5	567	4	29339.60	3227.36
8516	254	5	319	8	50174.80	19066.40
8517	183	3	771	4	8348.92	918.40
8518	254	8	362	10	94214.50	28264.30
8519	254	3	768	10	99483.90	32829.70
8520	254	1	224	5	37672.10	4520.65
8521	254	44	244	2	12287.92	4792.28
8522	254	11	758	5	23860.95	9305.75
8523	254	37	944	9	40424.58	10914.66
8524	608	45	7	9	42246.99	6337.08
8525	739	44	612	4	34690.28	8325.68
8526	254	17	35	5	14737.70	3979.20
8527	254	49	6	6	33872.52	9145.56
8528	254	32	414	13	107950.18	30226.04
8529	254	34	324	2	11827.30	2602.00
8530	254	36	205	16	3678.88	809.28
8531	595	37	991	5	16241.60	2598.65
8532	254	50	4	9	61844.67	16079.58
8533	254	2	132	10	30484.30	10059.80
8534	254	24	904	6	56784.30	10221.18
8535	254	2	727	9	75964.32	28866.42
8536	254	39	723	1	5300.41	1060.08
8537	254	31	264	1	9064.95	1269.09
8538	254	20	763	10	37873.90	10983.40
8539	241	12	197	10	54027.10	13506.80
8540	311	2	92	9	51336.90	17967.87
8541	254	9	309	6	9567.30	1913.46
8542	660	47	280	3	24401.31	9760.53
8543	254	21	848	8	35494.80	8518.72
8544	254	49	836	2	14418.06	3171.98
8545	742	33	556	9	56003.40	10080.63
8546	254	38	143	9	36847.44	14002.02
8547	254	35	773	3	3779.88	944.97
8548	254	35	719	14	49773.50	11945.64
8549	254	18	352	10	95644.80	20085.40
8550	254	1	631	9	23883.21	2627.19
8551	254	7	879	1	4903.35	1225.84
8552	254	5	367	9	1451.43	377.37
8553	254	6	462	3	15568.47	5293.29
8554	254	21	868	10	36845.20	7737.50
8555	254	14	740	2	12382.54	4953.02
8556	254	45	459	6	3582.54	1253.88
8557	254	9	639	3	25959.39	8826.18
8558	254	38	778	6	34249.50	13014.84
8559	254	21	565	7	13010.06	4553.50
8560	254	40	201	8	32341.60	5821.52
8561	254	11	41	6	2568.78	744.96
8562	254	14	768	1	9948.39	3282.97
8563	254	21	160	3	1572.96	503.34
8564	254	44	799	6	35160.30	9844.86
8565	254	23	580	5	28369.70	4255.45
8566	254	36	878	2	12306.62	1599.86
8567	254	5	100	10	57329.70	12039.20
8568	254	19	109	1	3858.49	1041.79
8569	254	26	910	5	14299.60	2859.90
8570	254	35	163	9	30331.71	7886.25
8571	254	44	768	7	69638.73	22980.79
8572	337	26	836	1	7209.03	1585.99
8573	254	11	988	1	3478.66	660.95
8574	254	3	432	10	15880.90	3652.60
8575	254	34	674	17	112472.00	40489.92
8576	834	41	518	5	1239.40	260.25
8577	254	16	453	10	90438.20	22609.60
8578	254	35	735	7	62543.04	21890.05
8579	254	43	308	7	8953.42	3581.34
8580	254	25	6	1	5645.42	1524.26
8581	254	36	710	5	41983.15	16793.25
8582	254	47	155	2	10684.50	2777.98
8583	254	10	626	2	9226.86	3229.40
8584	254	19	420	10	49397.00	14819.10
8585	254	46	670	1	4324.83	951.46
8586	254	23	192	9	27497.61	7424.37
8587	254	10	28	2	15420.02	2929.80
8588	254	21	529	5	17948.85	6102.60
8589	254	45	233	5	22695.55	7943.45
8590	254	1	352	10	95644.80	20085.40
8591	207	29	651	3	20346.87	6104.07
8592	254	46	967	5	48186.10	16865.15
8593	254	18	835	9	22088.16	5742.90
8594	254	45	243	4	4199.60	1217.88
8595	254	16	310	3	3931.92	393.18
8596	254	28	609	1	9093.09	1091.17
8597	254	41	969	9	22038.84	2644.65
8598	254	48	898	4	20103.56	7639.36
8599	254	33	806	5	25165.65	8556.30
8600	250	15	575	6	33356.94	12675.66
8601	254	49	537	6	41653.92	11663.10
8602	254	32	790	6	25406.52	8130.06
8603	254	29	713	1	8032.77	2088.52
8604	254	46	162	3	26861.16	4835.01
8605	254	44	393	10	48072.70	17306.20
8606	254	3	136	7	37939.51	8726.06
8607	254	12	354	6	36518.28	3651.84
8608	254	45	274	2	8370.90	1590.48
8609	274	50	858	3	29005.02	10151.76
8610	254	32	913	14	45794.00	8700.86
8611	74	37	800	10	97990.70	17638.30
8612	254	39	423	5	44779.15	8060.25
8613	254	27	961	7	62138.30	13049.05
8614	254	26	379	4	27194.68	2991.40
8615	254	6	122	2	15325.20	5057.32
8616	254	8	22	3	8399.94	840.00
8617	254	49	61	8	14002.24	5460.88
8618	254	22	453	1	9043.82	2260.96
8619	254	50	200	1	7889.32	1814.54
8620	698	41	916	5	14044.45	2387.55
8621	254	47	626	1	4613.43	1614.70
8622	254	40	724	10	92801.30	25984.40
8623	254	13	30	1	6544.04	981.61
8624	254	44	221	7	46093.53	13828.08
8625	639	46	626	2	9226.86	3229.40
8626	254	1	836	1	7209.03	1585.99
8627	254	7	826	10	59012.30	15343.20
8628	254	45	866	6	17721.12	1772.10
8629	254	24	931	6	16123.62	2579.76
8630	254	45	631	6	15922.14	1751.46
8631	254	23	668	4	15404.92	4467.44
8632	254	18	156	9	10302.84	1751.49
8633	254	40	673	10	52521.00	15231.10
8634	254	11	612	10	86725.70	20814.20
8635	254	3	524	1	6699.10	1540.79
8636	254	5	469	8	291.12	87.36
8637	254	17	873	6	18663.24	3546.00
8638	254	19	707	3	8484.03	1357.44
8639	254	7	903	5	38839.50	12040.25
8640	254	27	942	1	1790.71	268.61
8641	254	21	297	6	46378.08	7884.30
8642	254	21	421	9	19736.91	5921.10
8643	254	37	880	10	62845.70	8169.90
8644	254	6	948	8	55122.64	18741.68
8645	254	8	425	6	16834.86	2861.94
8646	254	48	106	1	8654.06	1557.73
8647	562	39	201	5	20213.50	3638.45
8648	254	36	625	3	20193.18	4644.42
8649	254	44	924	3	21070.80	2107.08
8650	254	1	256	10	1627.30	618.40
8651	254	46	17	8	15218.08	1674.00
8652	479	1	870	7	30830.24	11407.20
8653	254	46	433	7	9346.68	3271.31
8654	254	28	722	8	76819.44	20741.28
8655	819	44	266	1	6606.43	2312.25
8656	254	33	429	9	42777.18	9410.94
8657	254	2	117	6	21701.46	8680.56
8658	254	5	156	9	10302.84	1751.49
8659	254	43	144	7	52651.20	14742.35
8660	254	5	839	1	9220.70	1014.28
8661	254	5	625	13	87503.78	20125.82
8662	254	16	552	6	29148.84	11076.54
8663	254	34	702	6	52995.78	14838.84
8664	254	24	10	4	11305.00	4295.88
8665	254	8	473	9	74863.17	16469.91
8666	254	17	872	9	7652.34	994.77
8667	254	32	762	3	16085.07	1769.37
8668	254	24	496	9	3475.08	1007.73
8669	171	36	293	6	29609.88	5922.00
8670	254	11	172	1	109.06	38.17
8671	254	39	978	4	10197.60	1937.56
8672	254	40	509	14	99952.86	30985.36
8673	254	37	80	5	24048.40	9378.90
8674	418	4	581	7	35324.73	8831.20
8675	254	8	206	5	40312.20	6449.95
8676	254	37	283	9	86392.17	15550.56
8677	254	20	478	1	7848.86	1020.35
8678	254	12	279	8	28644.40	6588.24
8679	254	5	104	6	36929.82	14402.64
8680	254	24	195	6	59587.80	6554.64
8681	254	8	288	7	6957.58	2226.42
8682	254	20	665	7	5630.59	1182.44
8683	254	35	399	6	23250.00	5347.50
8684	254	34	518	4	991.52	208.20
8685	254	44	10	1	2826.25	1073.97
8686	254	18	787	6	912.18	164.22
8687	326	24	51	2	10961.14	1424.94
8688	254	2	916	10	28088.90	4775.10
8689	104	19	998	9	65866.50	12514.59
8690	254	17	748	8	29962.88	4794.08
8691	254	25	739	2	15099.28	3623.82
8692	254	30	30	17	111248.68	16687.37
8693	254	43	755	5	42395.35	8055.10
8694	254	9	336	5	20960.30	2724.85
8695	477	12	225	9	50895.18	15777.54
8696	254	1	661	9	12174.30	4139.28
8697	254	41	964	8	75889.68	19731.28
8698	254	22	41	9	3853.17	1117.44
8699	254	35	771	6	12523.38	1377.60
8700	254	10	448	1	4519.03	1084.57
8701	254	48	876	7	8562.19	3339.28
8702	773	48	35	8	23580.32	6366.72
8703	510	46	253	9	7623.99	1829.79
8704	254	18	374	4	6623.68	1390.96
8705	254	34	131	5	2367.25	875.90
8706	254	36	328	7	55731.13	17833.97
8707	254	19	281	5	23113.05	5084.85
8708	254	50	445	1	8393.64	1342.98
8709	254	35	616	10	10551.90	4220.80
8710	254	43	413	9	15344.73	3682.71
8711	254	26	738	5	11583.85	2548.45
8712	254	33	536	5	35352.05	9545.05
8713	254	1	40	3	13350.36	2937.09
8714	254	3	45	5	44272.35	6198.15
8715	254	3	528	10	95954.80	31665.10
8716	616	15	344	4	4150.68	747.12
8717	339	18	549	1	5980.26	1614.67
8718	254	22	108	2	12376.84	1732.76
8719	233	2	866	7	20674.64	2067.45
8720	254	44	88	9	15755.49	4569.12
8721	254	7	172	8	872.48	305.36
8722	200	32	918	9	26487.72	7681.41
8723	270	13	927	3	23284.65	6519.69
8724	254	33	297	6	46378.08	7884.30
8725	60	10	997	6	27458.52	4118.76
8726	254	24	866	7	20674.64	2067.45
8727	254	6	993	6	43208.64	10802.16
8728	254	35	778	4	22833.00	8676.56
8729	254	16	896	2	1823.02	364.60
8730	254	33	31	13	54766.53	17525.30
8731	254	2	356	3	13376.04	2541.45
8732	254	11	539	10	42675.30	8961.80
8733	254	46	524	7	46893.70	10785.53
8734	254	35	83	5	39314.35	13760.00
8735	254	22	264	11	99714.45	13959.99
8736	254	17	759	5	21524.30	4520.10
8737	254	7	21	8	4136.80	537.76
8738	254	47	923	7	22795.50	5698.84
8739	254	14	445	5	41968.20	6714.90
8740	254	47	922	10	91861.60	20209.60
8741	254	36	450	14	117685.82	30598.26
8742	254	41	792	9	32321.52	9696.42
8743	254	27	600	6	14207.94	4688.64
8744	254	41	745	1	8155.53	1386.44
8745	254	18	821	10	70324.60	23910.40
8746	254	46	581	2	10092.78	2523.20
8747	254	19	321	3	17441.76	4186.02
8748	254	47	760	5	19234.50	5962.70
8749	254	3	445	7	58755.48	9400.86
8750	254	34	587	5	743.25	215.55
8751	254	39	937	2	971.98	126.36
8752	254	15	167	9	67194.99	8063.37
8753	254	32	726	7	30343.53	10013.36
8754	254	14	407	3	13312.80	4659.48
8755	254	11	13	5	41235.95	6185.40
8756	254	49	611	9	62285.85	21800.07
8757	254	49	639	8	69225.04	23536.48
8758	254	26	491	4	27996.24	4199.44
8759	254	45	925	10	49887.10	7981.90
8760	192	35	405	7	38468.08	11925.13
8761	254	14	699	9	36104.31	9387.09
8762	254	43	627	4	23461.68	3519.24
8763	254	13	527	8	30002.24	6900.48
8764	254	46	941	3	25038.81	8262.81
8765	254	6	452	6	14016.36	4204.92
8766	254	27	404	1	8931.36	2500.78
8767	254	19	873	2	6221.08	1182.00
8768	254	45	437	9	48745.44	17060.94
8769	254	37	368	3	12771.15	3959.07
8770	812	11	394	6	38288.34	8040.54
8771	845	35	158	9	78634.80	25163.10
8772	271	11	318	10	36924.00	7384.80
8773	183	3	605	10	55471.80	21634.00
8774	254	41	270	2	520.74	171.84
8775	254	6	572	7	43472.03	12172.16
8776	254	4	725	4	22532.36	2478.56
8777	254	48	484	8	72368.32	18815.76
8778	254	40	568	8	68431.20	21213.68
8779	254	29	337	6	41607.36	6241.08
8780	254	37	351	8	1669.52	166.96
8781	254	27	596	3	12741.18	1911.18
8782	254	7	526	9	6632.28	862.20
8783	254	44	740	11	68103.97	27241.61
8784	254	30	717	10	98422.30	17716.00
8785	254	18	188	1	1145.79	171.87
8786	254	18	595	1	8235.11	1482.32
8787	254	20	497	3	15702.00	5338.68
8788	729	37	503	2	7463.52	1716.60
8789	254	29	649	1	8673.50	3209.19
8790	254	17	809	7	30152.92	10251.99
8791	254	14	837	8	74704.16	22411.28
8792	323	10	281	8	36980.88	8135.76
8793	139	17	452	5	11680.30	3504.10
8794	254	27	634	4	27698.84	6924.72
8795	254	5	284	7	11942.70	1433.11
8796	254	48	469	7	254.73	76.44
8797	538	14	487	1	6658.40	1997.52
8798	703	49	61	3	5250.84	2047.83
8799	814	21	247	6	37608.00	5265.12
8800	254	38	490	2	9601.94	1344.28
8801	254	13	313	9	84251.97	31173.21
8802	254	10	144	1	7521.60	2106.05
8803	233	2	476	8	66751.44	20692.96
8804	254	42	791	3	8290.41	1492.26
8805	254	47	57	6	19184.58	4604.28
8806	254	50	796	3	20245.26	3441.69
8807	254	14	225	19	107445.38	33308.14
8808	254	2	245	7	56069.30	16260.09
8809	853	31	952	9	180.90	34.38
8810	254	47	288	11	10933.34	3498.66
8811	254	8	686	9	30777.66	7694.46
8812	254	10	556	3	18667.80	3360.21
8813	254	45	19	2	19688.62	2559.52
8814	254	17	877	5	14616.60	2484.80
8815	254	48	473	13	108135.69	23789.87
8816	739	44	44	3	19243.56	4041.15
8817	254	45	65	10	65435.80	12432.80
8818	254	47	304	3	25080.87	4012.95
8819	254	34	578	7	15669.36	1880.34
8820	254	11	553	10	65314.50	22860.10
8821	254	26	652	9	38173.32	15269.31
8822	254	28	924	4	28094.40	2809.44
8823	254	6	481	9	89374.68	17874.90
8824	517	24	165	8	19842.80	5357.52
8825	512	33	628	3	12084.63	2900.31
8826	254	42	576	10	9976.20	3192.40
8827	728	12	22	8	22399.84	2240.00
8828	254	44	701	9	76479.57	22179.06
8829	833	6	457	7	11621.68	3602.69
8830	527	17	369	4	9220.00	1751.80
8831	254	38	796	9	60735.78	10325.07
8832	254	27	219	18	164692.26	64229.94
8833	254	34	954	6	47666.40	16683.24
8834	254	48	627	10	58654.20	8798.10
8835	254	20	382	10	21693.00	3687.80
8836	254	25	724	9	83521.17	23385.96
8837	254	46	218	6	45765.30	5491.86
8838	60	10	206	4	32249.76	5159.96
8839	708	25	115	6	26944.38	5658.30
8840	254	46	282	4	11508.64	4488.36
8841	254	36	375	5	36693.75	14677.50
8842	740	35	873	10	31105.40	5910.00
8843	254	46	987	7	56606.20	18680.06
8844	853	31	499	5	36969.80	9981.85
8845	254	40	234	7	41907.18	6286.07
8846	254	11	783	3	25620.42	8710.95
8847	615	12	317	1	3993.24	1517.43
8848	254	19	551	5	35568.70	8536.50
8849	254	34	862	7	41671.56	10001.18
8850	254	39	936	8	37029.36	11849.36
8851	254	17	367	6	967.62	251.58
8852	254	30	583	3	15762.93	3783.09
8853	254	45	99	9	42521.94	17008.74
8854	254	17	530	3	12036.39	1925.82
8855	254	38	861	10	5304.40	1750.50
8856	254	7	929	9	14078.43	3942.00
8857	254	30	442	1	5959.16	1370.61
8858	254	29	409	3	18723.45	2621.28
8859	254	46	360	2	3334.86	566.92
8860	254	23	806	8	40265.04	13690.08
8861	799	5	56	5	38584.40	15433.75
8862	254	27	293	3	14804.94	2961.00
8863	254	43	244	8	49151.68	19169.12
8864	254	11	896	10	9115.10	1823.00
8865	130	37	218	4	30510.20	3661.24
8866	254	20	679	13	127093.72	47024.64
8867	254	42	456	7	37740.22	3774.05
8868	254	18	30	6	39264.24	5889.66
8869	254	38	264	6	54389.70	7614.54
8870	254	36	598	15	33069.15	8598.00
8871	254	22	360	2	3334.86	566.92
8872	277	39	695	4	39819.96	13937.00
8873	583	43	386	3	22837.11	7764.63
8874	254	43	869	10	94364.90	32084.10
8875	254	30	974	1	8571.48	2914.30
8876	254	13	427	5	9473.85	1705.30
8877	254	48	91	8	79550.96	18296.72
8878	254	33	877	10	29233.20	4969.60
8879	254	43	706	2	16453.80	1645.38
8880	254	34	727	5	42202.40	16036.90
8881	254	3	635	8	22181.44	3105.44
8882	291	2	617	9	53374.68	20282.40
8883	254	17	745	2	16311.06	2772.88
8884	633	22	11	10	24469.80	9787.90
8885	26	47	572	9	55892.61	15649.92
8886	254	47	663	3	22741.05	8641.59
8887	254	36	13	9	74224.71	11133.72
8888	254	35	838	5	25639.25	5640.65
8889	254	33	438	5	33511.10	7707.55
8890	254	48	538	9	52941.06	7411.77
8891	254	19	427	2	3789.54	682.12
8892	254	47	733	1	9104.72	2094.09
8893	254	19	199	6	36223.08	6520.14
8894	254	39	386	6	45674.22	15529.26
8895	254	26	428	6	27312.90	9559.50
8896	254	47	634	12	83096.52	20774.16
8897	254	44	247	2	12536.00	1755.04
8898	254	39	896	3	2734.53	546.90
8899	254	5	842	4	15733.48	3618.72
8900	254	43	829	1	8161.19	2366.75
8901	254	29	195	8	79450.40	8739.52
8902	254	3	79	8	72499.44	13774.88
8903	709	14	211	1	1740.75	591.86
8904	100	44	134	7	33843.39	5753.37
8905	254	31	859	3	22320.78	8258.70
8906	254	16	687	4	7656.76	1990.76
8907	254	40	13	10	82471.90	12370.80
8908	155	45	609	3	27279.27	3273.51
8909	254	10	84	7	13429.15	1477.21
8910	254	25	636	9	500.94	80.19
8911	254	31	156	3	3434.28	583.83
8912	254	28	768	3	29845.17	9848.91
8913	640	37	703	4	25016.56	5503.64
8914	254	22	761	10	98453.10	31505.00
8915	254	18	576	3	2992.86	957.72
8916	254	19	301	7	18612.23	3908.59
8917	254	26	466	1	7225.30	2239.84
8918	254	9	648	3	20343.99	5492.88
8919	254	46	977	4	34051.36	7491.28
8920	254	49	721	3	29901.72	7176.42
8921	254	2	861	5	2652.20	875.25
8922	254	10	785	2	9302.06	2790.62
8923	254	44	50	3	5934.27	1542.90
8924	254	23	815	7	46034.17	7825.79
8925	254	46	954	5	39722.00	13902.70
8926	254	37	719	10	35552.50	8532.60
8927	254	1	859	7	52081.82	19270.30
8928	254	27	905	1	952.37	228.57
8929	254	11	245	6	48059.40	13937.22
8930	254	44	142	6	27243.18	7083.24
8931	254	40	607	7	42898.31	9437.61
8932	254	21	506	1	549.41	197.79
8933	254	36	226	10	44752.30	5817.80
8934	254	10	480	6	33086.70	5624.76
8935	254	30	540	15	82215.30	8221.50
8936	254	19	411	5	32849.75	6898.45
8937	254	38	282	1	2877.16	1122.09
8938	254	23	602	5	16798.80	3191.75
8939	254	22	477	8	9812.00	3336.08
8940	254	4	811	6	58870.62	23548.26
8941	254	36	656	4	4219.52	464.16
8942	254	44	746	2	9092.22	3364.12
8943	254	9	60	5	13493.00	1484.25
8944	254	40	512	8	7323.76	732.40
8945	254	41	189	8	9775.84	1955.20
8946	254	34	154	2	11527.00	2074.86
8947	254	40	40	9	40051.08	8811.27
8948	254	29	666	1	3139.45	879.05
8949	254	5	203	1	6938.53	2359.10
8950	254	39	469	9	327.51	98.28
8951	254	38	593	9	4368.15	1616.22
8952	254	48	342	3	23855.43	6918.06
8953	254	44	133	6	25562.34	8691.18
8954	254	47	433	9	12017.16	4205.97
8955	254	32	107	7	59443.37	19021.87
8956	254	28	886	10	12476.20	4741.00
8957	254	10	406	4	13189.20	4220.56
8958	254	46	340	1	7752.69	2170.75
8959	254	7	907	5	250.70	30.10
8960	254	35	936	10	46286.70	14811.70
8961	254	4	594	1	7268.74	2398.68
8962	254	7	896	2	1823.02	364.60
8963	254	33	88	6	10503.66	3046.08
8964	254	4	282	5	14385.80	5610.45
8965	254	24	735	17	151890.24	53161.55
8966	254	14	941	10	83462.70	27542.70
8967	254	23	233	2	9078.22	3177.38
8968	468	19	970	6	1308.96	392.70
8969	254	7	900	9	13425.21	4967.37
8970	254	2	701	1	8497.73	2464.34
8971	254	29	594	4	29074.96	9594.72
8972	254	19	103	10	27283.90	6002.50
8973	254	12	669	4	13033.36	2997.68
8974	254	48	321	7	40697.44	9767.38
8975	254	38	104	4	24619.88	9601.76
8976	254	50	986	1	7632.88	2518.85
8977	254	18	28	4	30840.04	5859.60
8978	254	23	406	10	32973.00	10551.40
8979	254	6	891	9	69972.21	11195.55
8980	673	46	75	7	27916.49	2791.67
8981	254	4	845	7	62172.74	13056.26
8982	254	36	995	1	9624.58	2598.64
8983	254	14	237	1	7831.77	1801.31
8984	254	19	961	4	35507.60	7456.60
8985	254	3	131	5	2367.25	875.90
8986	254	21	347	7	50610.35	10628.17
8987	66	37	146	3	9813.72	1177.65
8988	254	1	213	9	9534.60	1144.17
8989	254	38	177	8	45915.04	6428.08
8990	734	18	323	3	6263.19	1878.96
8991	254	6	972	4	9767.80	3321.04
8992	254	44	758	6	28633.14	11166.90
8993	254	26	594	3	21806.22	7196.04
8994	30	17	554	10	40123.30	13240.70
8995	773	48	755	3	25437.21	4833.06
8996	254	28	659	5	29114.95	6405.30
8997	254	5	195	9	89381.70	9831.96
8998	254	35	291	5	12015.55	4205.45
8999	254	16	338	10	31105.90	12442.40
9000	254	42	708	9	57204.63	16589.34
9001	254	39	382	9	19523.70	3319.02
9002	254	43	940	3	19161.69	2491.02
9003	254	9	44	4	25658.08	5388.20
9004	175	13	150	5	41542.10	12462.65
9005	254	49	826	8	47209.84	12274.56
9006	254	34	975	3	3748.56	487.32
9007	254	28	372	6	48680.64	13630.56
9008	254	12	748	4	14981.44	2397.04
9009	254	11	119	7	11996.74	3119.13
9010	291	2	236	2	11139.66	3119.10
9011	254	31	531	6	36423.36	8377.38
9012	254	6	853	8	55730.32	15047.20
9013	254	16	249	13	106162.55	13801.19
9014	358	29	79	9	81561.87	15496.74
9015	254	45	624	9	85341.60	10241.01
9016	254	37	646	5	29149.35	8453.30
9017	254	41	365	1	3542.34	1133.55
9018	581	32	156	2	2289.52	389.22
9019	853	35	137	2	12772.64	4087.24
9020	199	49	810	7	29277.92	11125.59
9021	254	17	101	10	84964.50	22940.40
9022	254	11	774	1	8714.95	1655.84
9023	254	10	59	7	26358.08	7116.69
9024	433	19	939	7	15299.13	6119.68
9025	275	29	963	9	57384.99	10903.14
9026	254	33	306	2	14441.62	5632.24
9027	447	33	466	3	21675.90	6719.52
9028	254	25	758	9	42949.71	16750.35
9029	82	31	431	7	14629.09	3510.99
9030	254	30	29	9	54231.93	11931.03
9031	254	40	932	2	6401.56	640.16
9032	254	21	10	9	25436.25	9665.73
9033	254	28	131	11	5207.95	1926.98
9034	408	33	3	3	25931.01	6482.76
9035	254	8	554	1	4012.33	1324.07
9036	254	40	717	10	98422.30	17716.00
9037	254	37	708	10	63560.70	18432.60
9038	565	45	443	8	21626.64	5190.40
9039	254	26	271	8	47805.04	9082.96
9040	254	6	464	3	1563.63	547.26
9041	254	44	835	7	17179.68	4466.70
9042	254	40	784	4	36181.24	13748.88
9043	254	8	97	3	28970.70	4925.01
9044	254	23	526	9	6632.28	862.20
9045	405	37	705	3	22780.56	4100.49
9046	254	26	459	9	5373.81	1880.82
9047	254	41	923	7	22795.50	5698.84
9048	254	36	394	2	12762.78	2680.18
9049	254	45	228	6	43454.58	16078.20
9050	254	27	165	10	24803.50	6696.90
9051	254	33	10	4	11305.00	4295.88
9052	254	45	458	1	7051.73	2045.00
9053	254	46	126	7	29825.18	3579.03
9054	254	40	587	6	891.90	258.66
9055	254	25	79	7	63437.01	12053.02
9056	254	14	716	7	19171.81	6710.13
9057	254	47	645	1	195.84	68.54
9058	254	16	762	3	16085.07	1769.37
9059	254	44	403	2	1387.68	152.64
9060	254	48	135	7	37474.78	5621.21
9061	254	26	367	2	322.54	83.86
9062	254	10	502	5	29918.95	6283.00
9063	254	20	813	3	19423.98	4661.76
9064	703	49	447	2	4120.82	1318.66
9065	254	37	535	3	29810.76	10731.87
9066	254	11	50	16	31649.44	8228.80
9067	254	25	399	8	31000.00	7130.00
9068	254	4	967	10	96372.20	33730.30
9069	254	12	224	3	22603.26	2712.39
9070	254	15	833	3	11912.97	3693.03
9071	693	3	137	4	25545.28	8174.48
9072	254	14	854	6	24994.68	8748.12
9073	844	42	244	2	12287.92	4792.28
9074	254	47	968	4	14989.76	3897.32
9075	254	25	861	7	3713.08	1225.35
9076	7	30	568	1	8553.90	2651.71
9077	254	6	117	5	18084.55	7233.80
9078	254	48	244	4	24575.84	9584.56
9079	597	42	11	5	12234.90	4893.95
9080	254	12	416	3	6241.29	2371.68
9081	254	47	864	10	77319.00	18556.60
9082	254	50	561	10	19797.80	4949.40
9083	254	8	970	4	872.64	261.80
9084	862	32	335	7	31862.39	3823.47
9085	254	50	418	1	1545.46	262.73
9086	254	49	887	11	86232.74	28456.78
9087	365	12	985	6	45188.76	4518.90
9088	254	32	704	1	8826.70	3265.88
9089	254	1	464	7	3648.47	1276.94
9090	254	28	752	10	31110.80	9955.50
9091	254	34	67	8	55972.48	8955.60
9092	808	42	113	6	7058.88	1694.16
9093	254	1	135	1	5353.54	803.03
9094	254	25	348	7	4688.60	1828.54
9095	175	1	517	3	20868.75	5217.18
9096	254	3	202	1	8786.15	1493.65
9097	254	18	901	13	21834.28	4148.56
9098	478	18	401	5	5813.05	1162.60
9099	254	2	963	2	12752.22	2422.92
9100	254	24	612	3	26017.71	6244.26
9101	254	35	989	7	5102.37	1428.63
9102	254	15	578	4	8953.92	1074.48
9103	254	28	179	9	2941.02	823.50
9104	254	48	25	2	12038.82	4333.98
9105	254	49	903	5	38839.50	12040.25
9106	254	9	372	4	32453.76	9087.04
9107	254	40	867	3	13276.50	4646.76
9108	254	42	593	4	1941.40	718.32
9109	254	8	908	4	23832.68	8818.08
9110	254	41	211	2	3481.50	1183.72
9111	254	46	638	4	34725.20	12848.32
9112	254	22	751	3	7674.12	2916.18
9113	254	42	869	11	103801.39	35292.51
9114	254	48	902	3	2741.79	603.18
9115	254	23	887	3	23518.02	7760.94
9116	254	15	88	5	8753.05	2538.40
9117	148	25	122	4	30650.40	10114.64
9118	254	47	875	9	82814.67	19875.51
9119	254	42	20	1	2693.59	538.72
9120	254	48	858	5	48341.70	16919.60
9121	254	18	489	4	28037.48	6448.64
9122	254	2	871	7	11712.26	1288.35
9123	254	29	281	10	46226.10	10169.70
9124	720	43	598	4	8818.44	2292.80
9125	254	23	234	6	35920.44	5388.06
9126	254	24	93	1	5017.94	1605.74
9127	254	18	450	10	84061.30	21855.90
9128	254	50	407	7	31063.20	10872.12
9129	806	3	227	7	51877.35	17119.55
9130	254	36	35	1	2947.54	795.84
9131	254	45	10	3	8478.75	3221.91
9132	546	5	504	8	5733.52	1089.36
9133	254	18	81	3	18343.26	6970.44
9134	577	27	777	6	58561.80	12883.62
9135	254	24	110	3	28052.61	4768.95
9136	254	11	902	6	5483.58	1206.36
9137	254	15	692	4	14668.96	1760.28
9138	254	49	591	2	1191.84	131.10
9139	197	2	816	10	11969.80	4069.70
9140	254	4	981	2	3542.12	850.10
9141	254	43	958	4	34729.52	6251.32
9142	254	38	387	6	32409.18	10046.82
9143	467	28	209	2	3268.20	1176.56
9144	254	29	276	8	76930.40	27694.96
9145	254	7	200	4	31557.28	7258.16
9146	254	7	992	10	8104.10	2431.20
9147	254	35	226	1	4475.23	581.78
9148	89	22	693	8	38166.08	13739.76
9149	254	27	258	6	55509.66	21648.78
9150	254	25	335	1	4551.77	546.21
9151	254	33	26	4	14650.80	1465.08
9152	254	7	613	8	50065.92	7009.20
9153	254	32	351	10	2086.90	208.70
9154	254	44	342	5	39759.05	11530.10
9155	254	14	173	6	38474.58	13850.82
9156	254	44	116	3	6725.37	1345.08
9157	254	49	888	4	23031.16	6218.40
9158	254	37	953	1	7585.62	910.27
9159	254	25	21	7	3619.70	470.54
9160	254	24	354	1	6086.38	608.64
9161	254	13	239	9	18371.07	5695.02
9162	696	30	740	4	24765.08	9906.04
9163	254	3	959	9	62096.49	14903.19
9164	254	40	995	7	67372.06	18190.48
9165	254	8	17	8	15218.08	1674.00
9166	254	50	24	5	6509.20	1366.95
9167	254	8	190	8	45350.80	12698.24
9168	254	49	421	9	19736.91	5921.10
9169	744	11	10	3	8478.75	3221.91
9170	437	29	341	1	9057.79	2083.29
9171	254	39	617	2	11861.04	4507.20
9172	26	47	357	9	84658.68	26244.18
9173	254	16	151	10	36496.30	6934.30
9174	254	38	765	3	88.83	19.53
9175	739	44	709	9	64645.56	18747.18
9176	254	38	315	4	17692.68	4069.32
9177	254	1	913	10	32710.00	6214.90
9178	254	2	88	6	10503.66	3046.08
9179	254	11	58	7	66914.96	13383.02
9180	254	36	54	9	1293.57	388.08
9181	254	34	865	1	9209.96	1565.69
9182	852	20	760	7	26928.30	8347.78
9183	254	15	612	9	78053.13	18732.78
9184	254	12	94	10	87394.30	26218.30
9185	254	33	402	3	11648.91	1747.35
9186	254	37	146	3	9813.72	1177.65
9187	254	13	418	9	13909.14	2364.57
9188	254	39	858	6	58010.04	20303.52
9189	254	27	594	3	21806.22	7196.04
9190	254	8	723	16	84806.56	16961.28
9191	254	12	700	10	50771.40	15231.40
9192	254	20	126	3	12782.22	1533.87
9193	254	3	471	7	51451.05	13377.28
9194	254	6	615	8	73320.08	21996.00
9195	254	1	742	9	65926.62	22415.04
9196	254	37	454	6	29033.58	5226.06
9197	254	38	973	1	3436.02	1271.33
9198	254	12	549	10	59802.60	16146.70
9199	126	18	274	3	12556.35	2385.72
9200	254	13	562	3	10369.65	2385.03
9201	254	23	395	8	61119.44	9779.12
9202	254	7	727	6	50642.88	19244.28
9203	254	33	529	10	35897.70	12205.20
9204	254	28	41	4	1712.52	496.64
9205	254	31	394	6	38288.34	8040.54
9206	788	13	774	8	69719.60	13246.72
9207	254	25	87	1	5886.40	706.37
9208	254	50	866	8	23628.16	2362.80
9209	254	13	67	6	41979.36	6716.70
9210	254	9	956	6	50028.78	14008.08
9211	254	20	453	10	90438.20	22609.60
9212	281	37	709	5	35914.20	10415.10
9213	254	44	73	9	21198.51	2543.85
9214	689	12	468	6	12566.76	1508.04
9215	254	10	794	14	66081.96	8590.68
9216	254	32	829	8	65289.52	18934.00
9217	254	30	571	5	31460.50	3460.65
9218	254	44	892	9	31039.65	8380.71
9219	254	47	327	4	5630.20	1576.44
9220	254	3	376	9	48478.68	13089.24
9221	254	27	823	10	83174.60	22457.10
9222	254	45	413	9	15344.73	3682.71
9223	254	33	62	9	39931.74	9184.32
9224	254	50	834	6	20128.14	8051.28
9225	254	22	90	3	16964.40	4071.45
9226	254	21	876	2	2446.34	954.08
9227	191	33	242	3	29991.51	9897.21
9228	254	38	569	9	37312.20	7835.58
9229	254	42	914	1	5332.95	2079.85
9230	802	45	154	1	5763.50	1037.43
9231	417	31	7	9	42246.99	6337.08
9232	254	11	662	9	22833.72	4566.78
9233	254	1	137	6	38317.92	12261.72
9234	254	25	382	10	21693.00	3687.80
9235	731	1	443	3	8109.99	1946.40
9236	254	39	980	10	75729.20	15145.80
9237	254	23	648	2	13562.66	3661.92
9238	254	28	782	12	17035.80	2214.60
9239	254	49	881	5	46727.30	18690.90
9240	254	42	307	8	31075.84	12119.60
9241	254	43	296	4	24555.48	5893.32
9242	254	32	402	3	11648.91	1747.35
9243	254	5	999	9	6176.43	1729.44
9244	254	6	446	2	19165.48	5749.64
9245	254	15	702	10	88326.30	24731.40
9246	716	28	507	6	43916.22	12296.52
9247	254	23	33	9	35590.41	10677.15
9248	254	41	202	9	79075.35	13442.85
9249	254	39	828	8	18426.80	6817.92
9250	426	15	940	9	57485.07	7473.06
9251	254	7	706	1	8226.90	822.69
9252	254	29	384	6	59015.40	6491.70
9253	254	6	150	5	41542.10	12462.65
9254	254	21	178	9	55666.80	8350.02
9255	254	43	266	9	59457.87	20810.25
9256	254	20	116	10	22417.90	4483.60
9257	254	44	932	7	22405.46	2240.56
9258	254	46	156	4	4579.04	778.44
9259	254	12	778	8	45666.00	17353.12
9260	254	38	283	10	95991.30	17278.40
9261	254	44	514	1	497.49	64.67
9262	254	8	472	6	38191.62	3819.18
9263	254	6	565	8	14868.64	5204.00
9264	254	6	844	2	18022.78	7028.88
9265	254	16	155	5	26711.25	6944.95
9266	254	34	398	5	13832.20	3043.10
9267	254	43	807	2	10757.54	3765.14
9268	254	9	13	4	32988.76	4948.32
9269	254	26	304	9	75242.61	12038.85
9270	415	7	491	1	6999.06	1049.86
9271	254	13	479	5	3219.20	386.30
9272	254	37	487	2	13316.80	3995.04
9273	254	10	323	8	16701.84	5010.56
9274	254	21	691	2	16936.14	5419.56
9275	254	33	656	6	6329.28	696.24
9276	254	8	482	5	16804.20	3696.90
9277	254	23	775	2	411.92	53.54
9278	254	2	74	8	2840.40	653.28
9279	254	28	74	2	710.10	163.32
9280	254	8	156	5	5723.80	973.05
9281	254	1	168	1	657.27	72.30
9282	254	43	210	9	48065.67	14419.71
9283	254	5	736	9	58520.43	6437.25
9284	254	27	744	1	858.75	197.51
9285	254	44	241	2	11714.88	2694.42
9286	254	24	860	6	56343.06	16902.90
9287	254	6	141	3	18209.01	2913.45
9288	699	47	421	2	4385.98	1315.80
9289	254	18	484	10	90460.40	23519.70
9290	254	49	344	9	9339.03	1681.02
9291	254	49	163	8	26961.52	7010.00
9292	438	22	850	5	43178.00	8635.60
9293	254	25	547	3	22273.08	2895.51
9294	254	49	448	4	18076.12	4338.28
9295	254	22	783	10	85401.40	29036.50
9296	618	6	195	5	49656.50	5462.20
9297	254	37	834	2	6709.38	2683.76
9298	254	45	368	6	25542.30	7918.14
9299	254	43	612	10	86725.70	20814.20
9300	254	9	20	2	5387.18	1077.44
9301	297	39	982	9	81943.47	31957.92
9302	254	36	118	8	18692.32	5046.96
9303	254	10	146	10	32712.40	3925.50
9304	254	3	975	9	11245.68	1461.96
9305	254	50	309	9	14350.95	2870.19
9306	254	38	900	10	14916.90	5519.30
9307	254	32	329	1	8791.69	2725.42
9308	254	22	823	9	74857.14	20211.39
9309	254	46	96	5	39302.80	6288.45
9310	254	3	679	5	48882.20	18086.40
9311	254	42	765	5	148.05	32.55
9312	254	28	743	8	35741.52	11437.28
9313	639	46	867	9	39829.50	13940.28
9314	254	27	218	6	45765.30	5491.86
9315	254	44	765	6	177.66	39.06
9316	254	5	69	8	51034.40	14800.00
9317	254	6	839	6	55324.20	6085.68
9318	254	6	900	10	14916.90	5519.30
9319	254	43	90	1	5654.80	1357.15
9320	254	2	289	9	52989.21	10597.86
9321	254	47	438	10	67022.20	15415.10
9322	254	39	684	7	57606.71	10945.27
9323	254	33	69	6	38275.80	11100.00
9324	254	15	794	1	4720.14	613.62
9325	254	12	660	7	30975.77	11461.03
9326	254	22	535	9	89432.28	32195.61
9327	254	41	205	10	2299.30	505.80
9328	254	12	632	3	773.31	162.39
9329	254	50	650	8	66688.48	24674.72
9330	254	2	913	4	13084.00	2485.96
9331	254	50	720	7	22084.65	7729.61
9332	254	49	929	8	12514.16	3504.00
9333	254	27	685	1	257.00	102.80
9334	254	11	963	4	25504.44	4845.84
9335	254	39	516	10	34559.00	12441.20
9336	254	18	213	10	10594.00	1271.30
9337	254	2	535	2	19873.84	7154.58
9338	254	37	554	6	24073.98	7944.42
9339	254	31	278	9	73892.88	22167.90
9340	299	12	344	9	9339.03	1681.02
9341	254	48	284	8	13648.80	1637.84
9342	254	44	572	2	12420.58	3477.76
9343	254	9	437	11	59577.76	20852.26
9344	254	12	982	3	27314.49	10652.64
9345	254	36	897	7	14122.15	5507.67
9346	254	19	432	8	12704.72	2922.08
9347	254	3	678	7	23200.73	8584.24
9348	254	12	927	8	62092.40	17385.84
9349	254	31	372	1	8113.44	2271.76
9350	254	27	460	10	33265.40	9314.30
9351	254	30	531	10	60705.60	13962.30
9352	254	23	622	8	31106.00	3110.56
9353	254	20	485	8	56353.76	17469.68
9354	254	33	139	11	99522.28	20899.67
9355	254	29	907	4	200.56	24.08
9356	254	9	600	9	21311.91	7032.96
9357	254	35	725	5	28165.45	3098.20
9358	254	8	998	2	14637.00	2781.02
9359	254	8	781	6	20473.20	2661.54
9360	520	31	453	8	72350.56	18087.68
9361	254	11	442	8	47673.28	10964.88
9362	254	34	737	6	58648.50	6451.32
9363	254	38	847	2	4974.26	1392.80
9364	254	35	153	2	1023.34	399.10
9365	254	6	327	5	7037.75	1970.55
9366	254	15	318	2	7384.80	1476.96
9367	254	23	710	7	58776.41	23510.55
9368	254	19	765	7	207.27	45.57
9369	254	16	359	5	25840.90	8527.50
9370	605	20	595	10	82351.10	14823.20
9371	437	29	853	9	62696.61	16928.10
9372	254	21	800	8	78392.56	14110.64
9373	254	32	417	9	47035.62	14581.08
9374	254	28	462	1	5189.49	1764.43
9375	254	19	123	3	6487.32	1102.83
9376	254	8	382	1	2169.30	368.78
9377	254	30	470	8	56311.52	11825.44
9378	254	6	357	10	94065.20	29160.20
9379	254	7	287	8	23247.20	8601.44
9380	254	16	733	1	9104.72	2094.09
9381	254	37	793	1	6646.68	1927.54
9382	254	1	424	5	31281.55	11887.00
9383	254	46	248	5	14112.60	3810.40
9384	797	3	371	7	28834.96	7497.07
9385	254	17	534	1	8986.08	1527.63
9386	254	34	960	9	7265.70	1017.18
9387	254	40	844	10	90113.90	35144.40
9388	254	29	508	8	76850.56	15370.08
9389	306	3	407	6	26625.60	9318.96
9390	254	10	295	10	46075.60	7832.90
9391	254	6	531	4	24282.24	5584.92
9392	254	14	102	5	24248.95	3879.85
9393	254	24	683	5	2379.15	785.10
9394	254	13	51	5	27402.85	3562.35
9395	254	11	500	9	52046.82	10409.40
9396	254	19	159	6	25402.80	7112.76
9397	254	29	856	6	10016.10	2403.84
9398	254	39	264	5	45324.75	6345.45
9399	254	23	383	4	31390.72	6592.04
9400	254	50	617	10	59305.20	22536.00
9401	254	2	418	5	7727.30	1313.65
9402	254	43	823	2	16634.92	4491.42
9403	254	34	172	6	654.36	229.02
9404	254	49	613	5	31291.20	4380.75
9405	254	2	287	8	23247.20	8601.44
9406	254	2	904	2	18928.10	3407.06
9407	254	41	883	5	12588.90	4280.25
9408	254	1	511	13	19977.36	6392.75
9409	254	36	832	4	22318.08	4240.44
9410	254	30	251	5	28491.65	8832.40
9411	254	46	825	3	3367.62	976.62
9412	254	43	6	7	39517.94	10669.82
9413	254	21	910	5	14299.60	2859.90
9414	254	33	313	7	65529.31	24245.83
9415	254	14	703	10	62541.40	13759.10
9416	322	15	982	4	36419.32	14203.52
9417	254	12	355	3	28711.14	4019.55
9418	254	45	868	9	33160.68	6963.75
9419	254	25	620	8	30309.60	10911.44
9420	254	2	293	4	19739.92	3948.00
9421	254	3	124	10	47479.40	14243.80
9422	254	23	840	7	43202.11	9504.46
9423	328	45	13	3	24741.57	3711.24
9424	254	25	375	9	66048.75	26419.50
9425	254	15	488	1	9626.25	1058.89
9426	254	28	974	2	17142.96	5828.60
9427	254	14	125	1	3524.51	1268.82
9428	254	22	285	3	8838.36	1325.76
9429	254	33	162	6	53722.32	9670.02
9430	254	34	169	2	14871.08	2379.38
9431	254	4	203	5	34692.65	11795.50
9432	376	41	246	3	3741.06	972.69
9433	669	19	388	5	27899.90	7253.95
9434	254	43	100	4	22931.88	4815.68
9435	254	44	226	10	44752.30	5817.80
9436	254	12	857	3	10321.41	1032.15
9437	254	30	713	8	64262.16	16708.16
9438	254	50	307	7	27191.36	10604.65
9439	254	19	482	5	16804.20	3696.90
9440	254	27	531	5	30352.80	6981.15
9441	254	16	336	5	20960.30	2724.85
9442	254	45	551	5	35568.70	8536.50
9443	254	2	240	3	4953.12	643.92
9444	254	38	188	10	11457.90	1718.70
9445	799	5	225	4	22620.08	7012.24
9446	254	19	808	7	64293.81	14144.62
9447	254	12	472	8	50922.16	5092.24
9448	254	32	374	3	4967.76	1043.22
9449	254	3	950	9	51894.99	15049.53
9450	254	30	275	8	58411.36	18691.60
9451	254	42	846	1	6680.65	1937.39
9452	254	44	218	3	22882.65	2745.93
9453	254	21	824	8	64563.28	21305.92
9454	254	31	896	8	7292.08	1458.40
9455	254	32	676	1	465.10	139.53
9456	272	46	70	2	4538.56	816.94
9457	254	37	424	9	56306.79	21396.60
9458	254	10	333	7	15234.10	4570.23
9459	254	8	860	4	37562.04	11268.60
9460	844	42	440	9	69128.19	7604.10
9461	254	6	15	5	26404.90	6073.15
9462	254	40	217	1	4693.63	1595.83
9463	254	2	47	1	4147.63	1659.05
9464	254	30	844	1	9011.39	3514.44
9465	254	43	549	2	11960.52	3229.34
9466	254	22	446	5	47913.70	14374.10
9467	254	30	995	8	76996.64	20789.12
9468	254	11	111	4	37228.60	7073.44
9469	254	34	652	5	21207.40	8482.95
9470	254	50	900	9	13425.21	4967.37
9471	254	18	999	8	5490.16	1537.28
9472	254	44	301	12	31906.68	6700.44
9473	254	49	205	1	229.93	50.58
9474	254	2	355	7	66992.66	9378.95
9475	254	2	410	10	12462.90	4735.90
9476	254	4	250	9	33649.56	10767.87
9477	447	33	759	6	25829.16	5424.12
9478	254	19	359	2	10336.36	3411.00
9479	408	33	752	5	15555.40	4977.75
9480	825	21	579	8	43441.76	15639.04
9481	536	29	673	9	47268.90	13707.99
9482	254	30	828	2	4606.70	1704.48
9483	254	28	868	5	18422.60	3868.75
9484	254	3	554	9	36110.97	11916.63
9485	281	37	473	3	24954.39	5489.97
9486	254	50	579	10	54302.20	19548.80
9487	254	28	333	3	6528.90	1958.67
9488	254	22	839	7	64544.90	7099.96
9489	482	6	448	5	22595.15	5422.85
9490	254	25	878	5	30766.55	3999.65
9491	254	49	538	5	29411.70	4117.65
9492	254	40	117	3	10850.73	4340.28
9493	291	2	498	9	63738.27	23583.15
9494	254	17	601	14	55391.56	13293.98
9495	254	12	148	9	14811.66	4443.48
9496	254	19	70	6	13615.68	2450.82
9497	254	4	992	1	810.41	243.12
9498	254	9	103	9	24555.51	5402.25
9499	254	37	914	1	5332.95	2079.85
9500	254	41	646	6	34979.22	10143.96
9501	254	21	472	10	63652.70	6365.30
9502	254	16	739	2	15099.28	3623.82
9503	254	47	813	8	51797.28	12431.36
9504	254	27	666	1	3139.45	879.05
9505	254	31	906	3	23710.68	7113.21
9506	254	34	529	5	17948.85	6102.60
9507	254	29	643	5	35902.25	8257.50
9508	254	37	886	9	11228.58	4266.90
9509	254	18	605	5	27735.90	10817.00
9510	254	48	762	10	53616.90	5897.90
9511	661	44	146	10	32712.40	3925.50
9512	254	22	237	7	54822.39	12609.17
9513	254	28	229	4	11092.52	2884.04
9514	254	35	788	4	14646.20	2343.40
9515	254	15	16	2	8011.60	1442.08
9516	254	26	572	9	55892.61	15649.92
9517	254	12	648	3	20343.99	5492.88
9518	254	42	471	2	14700.30	3822.08
9519	101	5	829	9	73450.71	21300.75
9520	254	34	690	8	42068.24	8413.68
9521	254	5	867	8	35404.00	12391.36
9522	254	25	32	8	43132.56	16821.68
9523	254	42	262	9	68046.84	20414.07
9524	254	32	702	7	61828.41	17311.98
9525	254	47	277	3	26527.62	2918.04
9526	299	12	704	3	26480.10	9797.64
9527	254	49	334	12	105003.72	25200.84
9528	254	3	67	8	55972.48	8955.60
9529	254	50	97	15	144853.50	24625.05
9530	254	34	588	7	11645.41	3027.78
9531	699	26	831	3	1236.27	247.26
9532	254	40	552	29	140886.06	53536.61
9533	254	41	445	2	16787.28	2685.96
9534	254	50	976	1	104.74	29.33
9535	278	18	298	10	71935.10	10070.90
9536	254	8	610	6	52438.14	6292.56
9537	254	33	317	4	15972.96	6069.72
9538	254	40	898	8	40207.12	15278.72
9539	254	5	845	7	62172.74	13056.26
9540	853	35	468	9	18850.14	2262.06
9541	254	46	331	4	8585.04	3004.76
9542	254	24	56	10	77168.80	30867.50
9543	254	37	923	4	13026.00	3256.48
9544	254	48	873	6	18663.24	3546.00
9545	256	29	417	2	10452.36	3240.24
9546	254	12	348	9	6028.20	2350.98
9547	254	31	947	6	20242.02	3238.74
9548	254	29	89	9	52013.43	19244.97
9549	254	33	640	3	16521.78	4791.33
9550	254	44	838	2	10255.70	2256.26
9551	254	27	170	12	111390.72	42328.44
9552	254	50	893	6	37345.38	11950.50
9553	254	38	180	9	32013.00	12805.20
9554	254	14	71	5	19161.30	4023.85
9555	254	29	494	7	20397.09	3467.52
9556	254	17	252	2	15442.16	1853.06
9557	254	48	178	7	43296.40	6494.46
9558	254	21	791	4	11053.88	1989.68
9559	254	19	841	1	7618.23	2590.20
9560	254	38	454	8	38711.44	6968.08
9561	657	23	653	10	35069.50	7364.60
9562	254	23	90	5	28274.00	6785.75
9563	254	4	522	2	16429.76	4271.74
9564	254	18	458	3	21155.19	6135.00
9565	254	26	687	10	19141.90	4976.90
9566	254	14	919	6	54595.86	7643.40
9567	254	9	834	4	13418.76	5367.52
9568	512	33	336	6	25152.36	3269.82
9569	254	40	975	2	2499.04	324.88
9570	254	33	864	10	77319.00	18556.60
9571	254	40	288	2	1987.88	636.12
9572	254	10	743	1	4467.69	1429.66
9573	254	4	756	6	23764.80	7842.36
9574	254	42	527	6	22501.68	5175.36
9575	254	48	828	10	23033.50	8522.40
9576	358	29	988	7	24350.62	4626.65
9577	254	27	647	3	20934.81	2302.83
9578	254	39	556	6	37335.60	6720.42
9579	254	1	650	1	8336.06	3084.34
9580	254	38	688	2	17830.56	2139.66
9581	254	37	310	7	9174.48	917.42
9582	254	32	96	13	102187.28	16349.97
9583	254	11	859	1	7440.26	2752.90
9584	254	26	549	8	47842.08	12917.36
9585	254	25	512	1	915.47	91.55
9586	254	43	283	10	95991.30	17278.40
9587	254	19	597	8	62617.60	17532.96
9588	254	8	330	6	42250.74	10985.22
9589	254	24	875	10	92016.30	22083.90
9590	254	1	523	6	48608.16	18957.18
9591	731	19	638	9	78131.70	28908.72
9592	254	42	27	9	41302.71	14042.88
9593	254	5	883	8	20142.24	6848.40
9594	254	36	228	9	65181.87	24117.30
9595	254	39	847	8	19897.04	5571.20
9596	254	50	652	10	42414.80	16965.90
9597	254	35	915	10	24875.20	5223.80
9598	254	36	785	7	32557.21	9767.17
9599	254	9	296	6	36833.22	8839.98
9600	254	4	492	7	14362.95	3303.51
9601	254	13	316	10	37878.80	13636.40
9602	254	8	140	3	22655.64	7476.36
9603	254	20	794	4	18880.56	2454.48
9604	254	9	209	1	1634.10	588.28
9605	254	23	224	10	75344.20	9041.30
9606	254	49	450	7	58842.91	15299.13
9607	609	10	90	1	5654.80	1357.15
9608	254	17	735	9	80412.48	28144.35
9609	254	7	500	3	17348.94	3469.80
9610	254	17	754	8	268.88	72.56
9611	254	3	994	8	16038.80	2405.84
9612	254	45	438	2	13404.44	3083.02
9613	254	37	715	9	66522.06	7317.45
9614	254	42	160	2	1048.64	335.56
9615	687	4	507	9	65874.33	18444.78
9616	254	2	736	7	45515.89	5006.75
9617	812	11	8	3	10063.74	2717.22
9618	254	39	1	10	57369.40	18931.90
9619	254	50	92	8	45632.80	15971.44
9620	254	5	392	3	19592.55	7053.33
9621	254	21	772	5	24577.55	6881.70
9622	254	14	378	1	5986.95	2035.56
9623	254	7	622	10	38882.50	3888.20
9624	254	27	511	2	3073.44	983.50
9625	254	14	753	8	40634.96	10565.12
9626	254	26	388	3	16739.94	4352.37
9627	254	26	583	3	15762.93	3783.09
9628	254	14	26	9	32964.30	3296.43
9629	254	18	956	5	41690.65	11673.40
9630	254	44	653	6	21041.70	4418.76
9631	254	3	692	6	22003.44	2640.42
9632	254	50	146	4	13084.96	1570.20
9633	593	23	315	8	35385.36	8138.64
9634	254	23	943	6	37401.00	14586.42
9635	254	25	933	8	64438.72	23197.92
9636	254	50	448	1	4519.03	1084.57
9637	254	20	393	4	19229.08	6922.48
9638	254	34	937	5	2429.95	315.90
9639	254	10	783	5	42700.70	14518.25
9640	254	8	848	7	31057.95	7453.88
9641	254	3	572	2	12420.58	3477.76
9642	254	28	385	7	40117.91	10831.87
9643	254	45	878	7	43073.17	5599.51
9644	254	25	203	7	48569.71	16513.70
9645	254	2	702	4	35330.52	9892.56
9646	254	44	850	18	155440.80	31088.16
9647	254	48	554	3	12036.99	3972.21
9648	254	48	653	4	14027.80	2945.84
9649	816	40	367	9	1451.43	377.37
9650	254	4	241	6	35144.64	8083.26
9651	254	8	928	6	36502.20	12045.72
9652	254	15	751	8	20464.32	7776.48
9653	254	25	490	6	28805.82	4032.84
9654	254	41	752	2	6222.16	1991.10
9655	254	46	245	10	80099.00	23228.70
9656	254	24	780	4	25632.92	5639.24
9657	254	7	270	1	260.37	85.92
9658	254	27	538	1	5882.34	823.53
9659	377	49	390	8	13099.76	2096.00
9660	641	47	269	3	25520.73	5104.14
9661	254	29	826	4	23604.92	6137.28
9662	254	6	864	8	61855.20	14845.28
9663	254	19	958	18	156282.84	28130.94
9664	254	14	558	5	49737.60	16910.80
9665	254	14	896	10	9115.10	1823.00
9666	83	44	148	9	14811.66	4443.48
9667	254	47	346	5	20039.15	5410.55
9668	254	49	853	8	55730.32	15047.20
9669	254	1	686	8	27357.92	6839.52
9670	254	41	798	9	63875.07	24272.55
9671	254	8	191	4	12217.68	2077.00
9672	254	1	648	6	40687.98	10985.76
9673	254	49	898	8	40207.12	15278.72
9674	304	27	165	6	14882.10	4018.14
9675	254	36	312	9	87744.33	26323.29
9676	254	20	313	8	74890.64	27709.52
9677	254	22	492	5	10259.25	2359.65
9678	441	8	984	5	28298.30	3678.80
9679	254	43	909	3	14716.50	3679.14
9680	254	50	993	4	28805.76	7201.44
9681	254	10	755	10	84790.70	16110.20
9682	254	46	800	9	88191.63	15874.47
9683	254	44	546	5	29548.35	3545.80
9684	254	4	395	2	15279.86	2444.78
9685	254	31	223	6	51650.28	5165.04
9686	254	12	918	4	11772.32	3413.96
9687	254	46	691	6	50808.42	16258.68
9688	254	29	402	3	11648.91	1747.35
9689	254	7	282	8	23017.28	8976.72
9690	254	42	979	1	8909.31	2940.07
9691	254	32	230	6	36670.74	4767.18
9692	254	43	329	2	17583.38	5450.84
9693	254	35	461	2	13999.34	1539.92
9694	254	2	267	1	6470.62	1358.83
9695	254	49	813	5	32373.30	7769.60
9696	254	42	689	10	45400.30	14528.10
9697	254	36	574	10	84666.50	21166.60
9698	254	15	945	2	15996.98	2879.46
9699	254	40	848	9	39931.65	9583.56
9700	121	29	442	6	35754.96	8223.66
9701	698	41	753	7	35555.59	9244.48
9702	254	37	630	10	14251.30	4132.90
9703	254	22	302	22	143493.68	57397.56
9704	254	40	554	15	60184.95	19861.05
9705	254	1	95	9	43216.02	11236.14
9706	254	34	373	6	48954.96	5874.60
9707	254	21	14	3	23047.44	5531.40
9708	254	26	336	7	29344.42	3814.79
9709	254	28	793	11	73113.48	21202.94
9710	536	29	165	10	24803.50	6696.90
9711	254	50	983	7	24411.24	3905.79
9712	254	26	341	8	72462.32	16666.32
9713	254	38	664	3	3520.62	387.27
9714	254	48	499	2	14787.92	3992.74
9715	254	28	632	7	1804.39	378.91
9716	254	18	311	8	24999.04	7499.68
9717	254	42	922	10	91861.60	20209.60
9718	254	23	44	9	57730.68	12123.45
9719	254	21	547	2	14848.72	1930.34
9720	254	2	493	10	24988.70	4747.90
9721	254	34	936	8	37029.36	11849.36
9722	254	16	767	7	45178.98	15360.87
9723	254	33	445	1	8393.64	1342.98
9724	254	6	771	8	16697.84	1836.80
9725	254	15	193	8	40981.36	10245.36
9726	254	12	154	2	11527.00	2074.86
9727	595	32	949	4	27000.48	8910.16
9728	254	49	458	3	21155.19	6135.00
9729	254	22	727	4	33761.92	12829.52
9730	254	21	350	5	35164.35	13714.10
9731	254	38	344	2	2075.34	373.56
9732	254	28	15	7	36966.86	8502.41
9733	815	44	213	8	8475.20	1017.04
9734	254	31	690	6	31551.18	6310.26
9735	254	33	377	1	2098.28	524.57
9736	254	45	942	2	3581.42	537.22
9737	254	48	801	10	24415.20	3418.10
9738	254	25	844	3	27034.17	10543.32
9739	254	46	714	4	34923.72	13271.00
9740	820	36	635	7	19408.76	2717.26
9741	254	15	418	9	13909.14	2364.57
9742	254	38	534	6	53916.48	9165.78
9743	254	33	995	1	9624.58	2598.64
9744	254	24	557	5	13193.25	3694.10
9745	254	34	2	10	20101.20	3015.20
9746	254	49	790	5	21172.10	6775.05
9747	254	26	226	9	40277.07	5236.02
9748	254	11	426	8	35543.20	7108.64
9749	254	19	770	2	16229.02	3570.38
9750	254	30	777	5	48801.50	10736.35
9751	254	27	567	4	29339.60	3227.36
9752	254	7	5	10	87273.60	30545.80
9753	254	11	436	3	20520.90	5130.21
9754	254	49	793	9	59820.12	17347.86
9755	254	30	631	7	18575.83	2043.37
9756	254	48	486	2	12593.40	2896.48
9757	254	12	523	10	81013.60	31595.30
9758	254	38	86	3	21726.09	2389.86
9759	254	43	862	4	23812.32	5714.96
9760	254	10	672	1	7353.57	1397.18
9761	254	44	396	3	8074.14	1937.79
9762	254	9	515	7	61817.00	17926.93
9763	254	7	774	5	43574.75	8279.20
9764	254	18	900	10	14916.90	5519.30
9765	254	40	280	2	16267.54	6507.02
9766	254	34	427	10	18947.70	3410.60
9767	254	35	941	5	41731.35	13771.35
9768	254	13	54	6	862.38	258.72
9769	254	5	491	2	13998.12	2099.72
9770	254	15	362	4	37685.80	11305.72
9771	557	44	226	1	4475.23	581.78
9772	760	16	787	10	1520.30	273.70
9773	254	20	196	10	26144.70	8366.30
9774	254	6	492	4	8207.40	1887.72
9775	254	3	681	5	25611.75	3585.65
9776	254	41	631	8	21229.52	2335.28
9777	254	26	138	4	17592.12	1935.12
9778	254	26	422	8	44011.84	7482.00
9779	254	34	480	2	11028.90	1874.92
9780	254	48	563	2	15531.08	2019.04
9781	254	34	523	6	48608.16	18957.18
9782	254	34	133	5	21301.95	7242.65
9783	254	4	287	8	23247.20	8601.44
9784	254	1	13	4	32988.76	4948.32
9785	254	28	142	2	9081.06	2361.08
9786	254	30	701	3	25493.19	7393.02
9787	254	12	278	10	82103.20	24631.00
9788	254	37	920	6	2339.10	771.90
9789	254	11	226	8	35801.84	4654.24
9790	254	23	71	6	22993.56	4828.62
9791	254	26	315	5	22115.85	5086.65
9792	254	31	930	1	9338.24	2427.94
9793	254	16	463	1	9425.53	2073.62
9794	254	23	29	7	42180.39	9279.69
9795	254	40	591	6	3575.52	393.30
9796	254	42	726	1	4334.79	1430.48
9797	254	15	647	10	69782.70	7676.10
9798	254	39	702	10	88326.30	24731.40
9799	254	49	682	9	12538.62	3761.55
9800	254	9	12	1	9834.03	1671.79
9801	254	27	282	3	8631.48	3366.27
9802	254	41	551	4	28454.96	6829.20
9803	856	18	717	4	39368.92	7086.40
9804	523	37	582	2	4316.36	431.64
9805	254	29	259	8	66346.32	6634.64
9806	254	12	946	6	52950.00	18003.00
9807	254	46	254	10	18039.00	7215.60
9808	254	32	282	10	28771.60	11220.90
9809	254	19	629	5	27943.90	4471.00
9810	254	3	265	1	1334.78	213.56
9811	753	29	270	8	2082.96	687.36
9812	254	1	38	5	24465.10	6605.60
9813	254	28	256	10	1627.30	618.40
9814	254	10	587	6	891.90	258.66
9815	254	18	594	7	50881.18	16790.76
9816	254	14	206	10	80624.40	12899.90
9817	254	28	797	6	40948.86	9008.76
9818	376	41	475	6	34331.22	9956.04
9819	254	36	627	4	23461.68	3519.24
9820	254	37	678	7	23200.73	8584.24
9821	254	24	213	6	6356.40	762.78
9822	254	43	640	8	44058.08	12776.88
9823	532	24	244	9	55295.64	21565.26
9824	254	38	725	9	50697.81	5576.76
9825	254	27	826	10	59012.30	15343.20
9826	254	25	116	7	15692.53	3138.52
9827	254	32	418	4	6181.84	1050.92
9828	254	48	588	6	9981.78	2595.24
9829	433	19	961	4	35507.60	7456.60
9830	254	32	722	2	19204.86	5185.32
9831	254	16	399	6	23250.00	5347.50
9832	89	22	895	1	5277.43	2005.42
9833	254	22	947	6	20242.02	3238.74
9834	254	39	908	4	23832.68	8818.08
9835	254	39	31	2	8425.62	2696.20
9836	254	13	836	4	28836.12	6343.96
9837	254	45	70	5	11346.40	2042.35
9838	254	42	822	10	53622.40	13941.80
9839	254	22	849	1	3880.11	1513.24
9840	254	20	621	6	26126.16	8882.88
9841	254	17	185	10	77215.40	15443.10
9842	254	29	832	7	39056.64	7420.77
9843	254	9	187	9	13493.34	1484.28
9844	254	43	644	5	4278.40	1454.65
9845	1	6	180	7	24899.00	9959.60
9846	254	50	167	7	52262.77	6271.51
9847	254	41	937	5	2429.95	315.90
9848	254	17	177	9	51654.42	7231.59
9849	254	9	110	10	93508.70	15896.50
9850	254	48	183	5	2167.50	563.55
9851	254	10	529	6	21538.62	7323.12
9852	254	41	809	2	8615.12	2929.14
9853	33	27	889	4	17653.08	4060.20
9854	254	3	518	5	1239.40	260.25
9855	254	46	469	10	363.90	109.20
9856	254	8	887	2	15678.68	5173.96
9857	26	47	203	10	69385.30	23591.00
9858	254	15	822	1	5362.24	1394.18
9859	254	6	151	2	7299.26	1386.86
9860	254	32	186	5	16218.80	3081.55
9861	254	38	787	1	152.03	27.37
9862	254	38	178	2	12370.40	1855.56
9863	254	38	213	7	7415.80	889.91
9864	254	8	919	5	45496.55	6369.50
9865	254	8	913	2	6542.00	1242.98
9866	254	50	335	1	4551.77	546.21
9867	254	36	110	3	28052.61	4768.95
9868	517	24	272	8	23654.64	4494.40
9869	254	3	568	5	42769.50	13258.55
9870	254	6	28	6	46260.06	8789.40
9871	254	45	554	1	4012.33	1324.07
9872	254	37	728	2	19764.66	5138.82
9873	254	9	734	5	6811.85	2656.60
9874	254	21	681	2	10244.70	1434.26
9875	618	6	39	9	79788.06	11968.20
9876	254	3	958	4	34729.52	6251.32
9877	254	42	448	4	18076.12	4338.28
9878	254	23	427	1	1894.77	341.06
9879	254	50	302	7	45657.08	18262.86
9880	254	2	400	6	32216.82	9342.90
9881	520	31	32	6	32349.42	12616.26
9882	254	44	994	9	18043.65	2706.57
9883	254	16	696	5	34552.10	9674.60
9884	254	32	840	5	30858.65	6788.90
9885	254	6	378	6	35921.70	12213.36
9886	254	38	398	2	5532.88	1217.24
9887	254	15	102	7	33948.53	5431.79
9888	744	1	763	9	34086.51	9885.06
9889	792	3	133	3	12781.17	4345.59
9890	529	31	680	1	9930.49	2581.93
9891	254	27	449	4	34776.48	5216.48
9892	254	21	554	10	40123.30	13240.70
9893	254	46	438	4	26808.88	6166.04
9894	254	47	135	12	64242.48	9636.36
9895	254	31	386	8	60898.96	20705.68
9896	254	8	260	6	2936.82	558.00
9897	254	42	176	7	34203.12	11629.03
9898	254	31	400	3	16108.41	4671.45
9899	254	39	622	2	7776.50	777.64
9900	254	32	500	2	11565.96	2313.20
9901	254	3	946	1	8825.00	3000.50
9902	254	33	277	6	53055.24	5836.08
9903	254	30	211	3	5222.25	1775.58
9904	254	48	14	7	53777.36	12906.60
9905	254	7	530	4	16048.52	2567.76
9906	254	31	863	5	15956.50	6063.45
9907	29	2	96	7	55023.92	8803.83
9908	254	3	621	5	21771.80	7402.40
9909	254	41	263	5	46861.70	8903.70
9910	254	1	606	9	83067.48	31565.61
9911	254	3	295	6	27645.36	4699.74
9912	254	1	242	5	49985.85	16495.35
9913	254	1	48	1	4001.14	1560.44
9914	254	49	732	6	16700.88	1837.08
9915	744	16	37	2	18940.00	1894.00
9916	254	31	14	9	69142.32	16594.20
9917	609	10	753	6	30476.22	7923.84
9918	254	11	954	2	15888.80	5561.08
9919	254	39	988	8	27829.28	5287.60
9920	254	4	818	8	68930.72	19300.64
9921	254	3	953	3	22756.86	2730.81
9922	254	14	696	9	62193.78	17414.28
9923	254	47	361	9	35292.24	6352.56
9924	254	14	335	3	13655.31	1638.63
9925	254	10	436	5	34201.50	8550.35
9926	254	47	563	4	31062.16	4038.08
9927	193	20	639	3	25959.39	8826.18
9928	254	41	254	3	5411.70	2164.68
9929	254	49	176	4	19544.64	6645.16
9930	254	37	341	6	54346.74	12499.74
9931	254	48	545	7	4038.09	1453.69
9932	254	10	299	9	81357.30	13830.75
9933	254	15	376	10	53865.20	14543.60
9934	254	30	126	5	21303.70	2556.45
9935	254	23	381	3	3505.53	1016.61
9936	254	50	780	4	25632.92	5639.24
9937	254	44	373	9	73432.44	8811.90
9938	254	42	352	3	28693.44	6025.62
9939	254	2	4	4	27486.52	7146.48
9940	254	44	372	8	64907.52	18174.08
9941	254	45	540	3	16443.06	1644.30
9942	523	37	192	3	9165.87	2474.79
9943	254	45	943	3	18700.50	7293.21
9944	687	4	874	5	14299.15	2573.85
9945	254	43	667	7	37473.38	14989.38
9946	254	25	864	6	46391.40	11133.96
9947	254	46	779	5	34846.85	10802.50
9948	254	25	156	5	5723.80	973.05
9949	254	20	580	3	17021.82	2553.27
9950	200	12	431	10	20898.70	5015.70
9951	254	13	204	9	26167.32	8373.51
9952	254	44	822	7	37535.68	9759.26
9953	254	5	814	15	128464.50	44962.50
9954	254	32	471	9	66151.35	17199.36
9955	601	50	597	4	31308.80	8766.48
9956	91	29	94	3	26218.29	7865.49
9957	254	12	743	4	17870.76	5718.64
9958	254	5	915	6	14925.12	3134.28
9959	254	39	961	6	53261.40	11184.90
9960	825	21	358	9	221.40	66.42
9961	254	47	408	2	19900.82	5572.22
9962	254	50	91	3	29831.61	6861.27
9963	254	33	172	7	763.42	267.19
9964	254	17	439	3	12594.93	1637.34
9965	254	49	807	4	21515.08	7530.28
9966	254	6	95	8	38414.24	9987.68
9967	254	6	299	10	90397.00	15367.50
9968	249	35	144	4	30086.40	8424.20
9969	254	25	5	10	87273.60	30545.80
9970	254	22	113	6	7058.88	1694.16
9971	254	2	921	8	35280.80	12348.24
9972	254	42	161	5	38043.40	13315.20
9973	254	34	257	7	33104.40	4634.63
9974	254	44	461	5	34998.35	3849.80
9975	254	1	378	10	59869.50	20355.60
9976	115	29	471	4	29400.60	7644.16
9977	791	7	44	3	19243.56	4041.15
9978	254	37	848	7	31057.95	7453.88
9979	254	40	181	2	7455.60	2385.80
9980	743	47	29	7	42180.39	9279.69
9981	254	50	542	1	9436.52	1321.11
9982	254	8	266	10	66064.30	23122.50
9983	254	14	66	4	8574.08	3343.88
9984	254	38	241	8	46859.52	10777.68
9985	254	38	905	1	952.37	228.57
9986	254	18	708	2	12712.14	3686.52
9987	254	24	69	3	19137.90	5550.00
9988	254	15	483	4	29530.44	4724.88
9989	254	43	817	6	25548.84	8175.60
9990	254	39	198	10	75209.10	15793.90
9991	254	27	481	10	99305.20	19861.00
9992	415	7	332	8	77343.60	20109.36
9993	877	44	811	9	88305.93	35322.39
9994	254	49	196	1	2614.47	836.63
9995	254	12	345	7	69465.20	20144.88
9996	254	28	31	6	25276.86	8088.60
9997	254	44	354	10	60863.80	6086.40
9998	254	39	924	3	21070.80	2107.08
9999	254	35	454	2	9677.86	1742.02
10000	22	47	753	9	45714.33	11885.76
10001	254	48	573	1	1604.43	497.37
10002	254	42	523	8	64810.88	25276.24
10003	254	46	179	5	1633.90	457.50
10004	254	46	251	8	45586.64	14131.84
10005	254	34	243	9	9449.10	2740.23
10006	595	32	804	4	18127.40	6888.40
10007	254	11	440	6	46085.46	5069.40
10008	254	42	152	4	9726.32	1556.20
10009	254	13	674	6	39696.00	14290.56
10010	254	20	896	2	1823.02	364.60
10011	12	22	644	3	2567.04	872.79
10012	254	42	924	3	21070.80	2107.08
10013	254	22	80	2	9619.36	3751.56
10014	254	35	962	10	72144.80	14429.00
10015	254	25	34	7	37672.81	13185.48
10016	254	22	962	1	7214.48	1442.90
10017	254	18	34	7	37672.81	13185.48
10018	254	30	226	2	8950.46	1163.56
10019	254	11	270	10	2603.70	859.20
10020	254	32	864	7	54123.30	12989.62
10021	408	33	663	1	7580.35	2880.53
10022	254	9	596	3	12741.18	1911.18
10023	254	24	242	5	49985.85	16495.35
10024	254	22	278	8	65682.56	19704.80
10025	254	23	222	9	77746.86	7774.65
10026	254	19	628	1	4028.21	966.77
10027	254	44	94	9	78654.87	23596.47
10028	535	20	121	2	13729.34	1510.22
10029	254	34	752	5	15555.40	4977.75
10030	757	25	78	1	6493.90	909.15
10031	529	39	262	5	37803.80	11341.15
10032	254	24	134	8	38678.16	6575.28
10033	115	29	992	8	6483.28	1944.96
10034	254	25	211	7	12185.25	4143.02
10035	254	34	256	1	162.73	61.84
10036	254	16	456	2	10782.92	1078.30
10037	254	27	472	6	38191.62	3819.18
10038	254	12	675	3	1395.33	502.32
10039	254	35	178	10	61852.00	9277.80
10040	200	32	983	8	27898.56	4463.76
10041	254	21	388	10	55799.80	14507.90
10042	306	3	491	8	55992.48	8398.88
10043	254	27	698	1	3286.54	361.52
10044	254	42	286	9	42336.36	12277.53
10045	254	35	253	2	1694.22	406.62
10046	254	32	256	9	1464.57	556.56
10047	254	20	924	4	28094.40	2809.44
10048	254	9	939	5	10927.95	4371.20
10049	254	28	418	1	1545.46	262.73
10050	254	41	770	3	24343.53	5355.57
10051	254	22	859	9	66962.34	24776.10
10052	254	5	228	5	36212.15	13398.50
10053	254	19	343	9	86418.63	12962.79
10054	254	18	733	1	9104.72	2094.09
10055	30	17	726	1	4334.79	1430.48
10056	254	19	960	3	2421.90	339.06
10057	254	15	248	10	28225.20	7620.80
10058	254	26	841	3	22854.69	7770.60
10059	254	39	860	9	84514.59	25354.35
10060	254	34	245	7	56069.30	16260.09
10061	254	5	277	10	88425.40	9726.80
10062	254	12	257	3	14187.60	1986.27
10063	358	29	14	9	69142.32	16594.20
10064	254	36	348	6	4018.80	1567.32
10065	254	6	512	5	4577.35	457.75
10066	254	43	632	6	1546.62	324.78
10067	716	28	55	1	8646.00	1037.52
10068	254	30	203	3	20815.59	7077.30
10069	254	36	601	6	23739.24	5697.42
10070	254	9	217	2	9387.26	3191.66
10071	254	22	355	6	57422.28	8039.10
10072	254	10	727	9	75964.32	28866.42
10073	254	43	948	4	27561.32	9370.84
10074	254	12	559	4	24573.84	6880.68
10075	254	48	541	7	54395.60	21214.27
10076	254	32	73	9	21198.51	2543.85
10077	254	20	257	1	4729.20	662.09
10078	254	6	609	8	72744.72	8729.36
10079	325	36	141	2	12139.34	1942.30
10080	254	45	707	12	33936.12	5429.76
10081	254	3	784	10	90453.10	34372.20
10082	254	42	853	9	62696.61	16928.10
10083	254	17	646	2	11659.74	3381.32
10084	254	20	829	6	48967.14	14200.50
10085	254	1	383	2	15695.36	3296.02
10086	254	23	798	2	14194.46	5393.90
10087	254	45	687	7	13399.33	3483.83
10088	254	10	555	2	5142.62	822.82
10089	254	29	762	2	10723.38	1179.58
10090	254	20	47	3	12442.89	4977.15
10091	254	9	644	8	6845.44	2327.44
10092	254	21	265	8	10678.24	1708.48
10093	254	12	374	1	1655.92	347.74
10094	254	48	344	6	6226.02	1120.68
10095	311	16	167	10	74661.10	8959.30
10096	254	13	648	10	67813.30	18309.60
10097	254	12	866	1	2953.52	295.35
10098	254	21	786	8	34680.24	13178.48
10099	254	50	174	1	6376.53	1785.43
10100	254	3	160	7	3670.24	1174.46
10101	254	34	327	4	5630.20	1576.44
10102	254	3	155	4	21369.00	5555.96
10103	254	13	892	8	27590.80	7449.52
10104	254	46	521	10	84694.40	33030.80
10105	254	7	153	9	4605.03	1795.95
10106	254	7	887	2	15678.68	5173.96
10107	254	32	185	2	15443.08	3088.62
10108	254	20	140	7	52863.16	17444.84
10109	254	19	552	21	102020.94	38767.89
10110	254	50	845	7	62172.74	13056.26
10111	254	6	745	4	32622.12	5545.76
10112	254	22	469	1	36.39	10.92
10113	254	46	817	8	34065.12	10900.80
10114	254	39	664	7	8214.78	903.63
10115	254	26	442	8	47673.28	10964.88
10116	877	44	3	8	69149.36	17287.36
10117	254	49	685	5	1285.00	514.00
10118	1	6	876	8	9785.36	3816.32
10119	254	39	68	3	23317.14	8860.50
10120	254	43	888	2	11515.58	3109.20
10121	859	23	874	6	17158.98	3088.62
10122	277	39	763	5	18936.95	5491.70
10123	254	25	988	7	24350.62	4626.65
10124	254	33	151	5	18248.15	3467.15
10125	874	9	387	5	27007.65	8372.35
10126	254	33	485	2	14088.44	4367.42
10127	254	36	688	5	44576.40	5349.15
10128	254	11	152	3	7294.74	1167.15
10129	254	30	150	7	58158.94	17447.71
10130	254	18	571	6	37752.60	4152.78
10131	254	5	408	10	99504.10	27861.10
10132	254	16	741	10	69337.30	18027.70
10133	254	44	164	5	12857.55	2828.65
10134	254	22	600	8	18943.92	6251.52
10135	254	37	658	4	34023.32	9186.28
10136	688	16	517	9	62606.25	15651.54
10137	254	9	475	3	17165.61	4978.02
10138	254	3	878	1	6153.31	799.93
10139	254	41	629	5	27943.90	4471.00
10140	254	29	304	7	58522.03	9363.55
10141	254	49	315	4	17692.68	4069.32
10142	254	17	286	6	28224.24	8185.02
10143	254	6	568	9	76985.10	23865.39
10144	254	47	945	4	31993.96	5758.92
10145	254	27	39	8	70922.72	10638.40
10146	254	45	391	5	2834.50	481.85
10147	264	22	175	5	49541.05	8422.00
10148	529	39	144	6	45129.60	12636.30
10149	306	3	613	5	31291.20	4380.75
10150	254	49	418	5	7727.30	1313.65
10151	254	10	452	5	11680.30	3504.10
10152	254	30	188	8	9166.32	1374.96
10153	254	48	698	7	23005.78	2530.64
10154	254	39	295	1	4607.56	783.29
10155	254	39	791	7	19344.29	3481.94
10156	254	25	637	3	10256.85	4000.17
10157	254	27	833	7	27796.93	8617.07
10158	254	8	495	6	33951.48	10524.96
10159	254	2	645	10	1958.40	685.40
10160	254	37	900	10	14916.90	5519.30
10161	254	44	132	10	30484.30	10059.80
10162	254	34	182	6	38125.92	11819.04
10163	254	39	635	8	22181.44	3105.44
10164	254	27	311	10	31248.80	9374.60
10165	254	49	649	4	34694.00	12836.76
10166	254	5	809	1	4307.56	1464.57
10167	254	12	681	7	35856.45	5019.91
10168	720	36	106	2	17308.12	3115.46
10169	254	9	394	4	25525.56	5360.36
10170	254	16	78	3	19481.70	2727.45
10171	254	49	95	5	24008.90	6242.30
10172	254	11	989	8	5831.28	1632.72
10173	254	37	248	3	8467.56	2286.24
10174	254	21	323	4	8350.92	2505.28
10175	254	21	442	6	35754.96	8223.66
10176	254	18	718	9	77666.31	17863.29
10177	254	39	402	9	34946.73	5242.05
10178	254	43	949	4	27000.48	8910.16
10179	254	27	806	9	45298.17	15401.34
10180	254	40	327	7	9852.85	2758.77
10181	254	18	969	2	4897.52	587.70
10182	254	13	699	7	28081.13	7301.07
10183	254	1	159	1	4233.80	1185.46
10184	254	16	355	1	9570.38	1339.85
10185	557	44	737	7	68423.25	7526.54
10186	254	36	899	10	61265.20	15929.00
10187	605	20	833	1	3970.99	1231.01
10188	241	12	19	3	29532.93	3839.28
10189	254	14	82	10	71696.50	17207.20
10190	254	47	204	9	26167.32	8373.51
10191	254	47	468	1	2094.46	251.34
10192	586	24	953	5	37928.10	4551.35
10193	254	14	160	5	2621.60	838.90
10194	254	21	236	5	27849.15	7797.75
10195	254	1	357	5	47032.60	14580.10
10196	254	44	155	4	21369.00	5555.96
10197	254	23	589	3	16501.74	6600.69
10198	254	31	420	7	34577.90	10373.37
10199	254	13	301	6	15953.34	3350.22
10200	583	43	76	10	15407.10	6008.80
10201	254	48	755	6	50874.42	9666.12
10202	254	44	881	2	18690.92	7476.36
10203	254	46	567	5	36674.50	4034.20
10204	254	42	806	16	80530.08	27380.16
10205	254	37	277	2	17685.08	1945.36
10206	254	22	65	4	26174.32	4973.12
10207	254	14	620	1	3788.70	1363.93
10208	254	28	767	3	19362.42	6583.23
10209	254	9	841	8	60945.84	20721.60
10210	254	35	34	9	48436.47	16952.76
10211	254	16	793	5	33233.40	9637.70
10212	254	46	181	3	11183.40	3578.70
10213	254	2	113	8	9411.84	2258.88
10214	254	38	174	4	25506.12	7141.72
10215	254	20	2	4	8040.48	1206.08
10216	254	37	713	9	72294.93	18796.68
10217	254	41	366	2	425.74	42.58
10218	254	33	351	3	626.07	62.61
10219	254	24	121	8	54917.36	6040.88
10220	254	28	616	6	6331.14	2532.48
10221	254	38	650	9	75024.54	27759.06
10222	254	46	296	3	18416.61	4419.99
10223	254	7	88	5	8753.05	2538.40
10224	254	17	832	10	55795.20	10601.10
10225	254	16	512	9	8239.23	823.95
10226	254	2	242	10	99971.70	32990.70
10227	254	11	835	2	4908.48	1276.20
10228	254	38	730	10	85994.50	9459.40
10229	254	10	327	6	8445.30	2364.66
10230	254	46	702	10	88326.30	24731.40
10231	654	44	970	2	436.32	130.90
10232	254	22	116	3	6725.37	1345.08
10233	254	36	721	8	79737.92	19137.12
10234	254	34	362	10	94214.50	28264.30
10235	254	33	623	5	35841.60	7168.30
10236	259	1	143	3	12282.48	4667.34
10237	254	10	749	9	15151.32	4090.86
10238	254	16	88	4	7002.44	2030.72
10239	641	47	931	9	24185.43	3869.64
10240	254	17	770	1	8114.51	1785.19
10241	254	30	343	5	48010.35	7201.55
10242	137	45	992	8	6483.28	1944.96
10243	254	8	130	3	24698.49	3704.76
10244	254	37	35	8	23580.32	6366.72
10245	229	36	590	4	36246.40	4712.04
10246	254	4	285	3	8838.36	1325.76
10247	254	40	375	1	7338.75	2935.50
10248	254	33	635	2	5545.36	776.36
10249	254	33	858	8	77346.72	27071.36
10250	254	20	532	2	17913.94	2149.68
10251	131	24	818	3	25849.02	7237.74
10252	254	19	358	10	246.00	73.80
10253	254	29	683	9	4282.47	1413.18
10254	254	29	367	3	483.81	125.79
10255	768	32	541	5	38854.00	15153.05
10256	491	47	980	2	15145.84	3029.16
10257	254	30	771	5	10436.15	1148.00
10258	254	50	758	7	33405.33	13028.05
10259	254	12	466	6	43351.80	13439.04
10260	259	1	746	8	36368.88	13456.48
10261	254	36	282	5	14385.80	5610.45
10262	254	25	668	8	30809.84	8934.88
10263	254	40	807	9	48408.93	16943.13
10264	254	26	600	3	7103.97	2344.32
10265	254	1	315	10	44231.70	10173.30
10266	254	39	349	6	29424.54	8533.14
10267	254	25	477	8	9812.00	3336.08
10268	254	45	21	5	2585.50	336.10
10269	254	46	335	9	40965.93	4915.89
10270	254	49	726	4	17339.16	5721.92
10271	254	30	274	1	4185.45	795.24
10272	254	50	419	2	6353.86	2287.38
10273	605	20	976	5	523.70	146.65
10274	254	19	762	2	10723.38	1179.58
10275	254	30	886	10	12476.20	4741.00
10276	254	47	662	8	20296.64	4059.36
10277	182	11	925	5	24943.55	3990.95
10278	254	30	8	5	16772.90	4528.70
10279	254	26	648	9	61031.97	16478.64
10280	254	24	124	1	4747.94	1424.38
10281	254	34	388	8	44639.84	11606.32
10282	312	12	80	1	4809.68	1875.78
10283	254	39	886	4	4990.48	1896.40
10284	254	34	725	12	67597.08	7435.68
10285	254	22	61	2	3500.56	1365.22
10286	254	43	1000	10	22235.30	7115.30
10287	254	28	567	3	22004.70	2420.52
10288	254	7	43	6	57913.86	9845.34
10289	254	30	292	4	31659.84	9181.36
10290	180	7	629	10	55887.80	8942.00
10291	418	4	221	8	52678.32	15803.52
10292	438	22	736	2	13004.54	1430.50
10293	191	44	129	2	17460.46	3492.10
10294	254	24	65	6	39261.48	7459.68
10295	254	47	61	4	7001.12	2730.44
10296	254	32	466	7	50577.10	15678.88
10297	699	47	213	3	3178.20	381.39
10298	254	46	687	8	15313.52	3981.52
10299	254	26	853	3	20898.87	5642.70
10300	254	15	867	5	22127.50	7744.60
10301	258	27	101	3	25489.35	6882.12
10302	254	27	541	4	31083.20	12122.44
10303	254	5	781	9	30709.80	3992.31
10304	254	30	568	9	76985.10	23865.39
10305	254	43	175	3	29724.63	5053.20
10306	254	7	886	8	9980.96	3792.80
10307	254	33	261	1	2289.67	824.28
10308	254	8	408	1	9950.41	2786.11
10309	254	8	442	6	35754.96	8223.66
10310	254	5	330	1	7041.79	1830.87
10311	254	46	882	9	7894.80	1815.84
10312	254	9	631	7	18575.83	2043.37
10313	254	31	27	5	22945.95	7801.60
10314	254	6	984	1	5659.66	735.76
10315	529	39	710	4	33586.52	13434.60
10316	254	13	603	12	31396.68	9419.04
10317	254	31	790	2	8468.84	2710.02
10318	254	34	840	1	6171.73	1357.78
10319	254	7	501	6	50054.52	17519.10
10320	254	9	710	8	67173.04	26869.20
10321	254	13	58	1	9559.28	1911.86
10322	254	34	273	8	29061.28	5521.68
10323	254	23	251	16	91173.28	28263.68
10324	254	29	255	8	4088.16	1553.52
10325	254	24	705	2	15187.04	2733.66
10326	254	39	356	5	22293.40	4235.75
10327	254	6	966	5	20644.55	2683.80
10328	254	4	799	10	58600.50	16408.10
10329	254	43	88	7	12254.27	3553.76
10330	254	33	530	10	40121.30	6419.40
10331	254	43	427	3	5684.31	1023.18
10332	254	45	267	1	6470.62	1358.83
10333	254	50	358	2	49.20	14.76
10334	254	23	912	9	44596.17	5351.58
10335	254	37	635	8	22181.44	3105.44
10336	254	50	756	2	7921.60	2614.12
10337	254	11	468	2	4188.92	502.68
10338	254	17	256	6	976.38	371.04
10339	254	28	720	5	15774.75	5521.15
10340	549	30	774	9	78434.55	14902.56
10341	254	20	250	6	22433.04	7178.58
10342	469	30	135	7	37474.78	5621.21
10343	477	48	180	6	21342.00	8536.80
10344	254	10	616	2	2110.38	844.16
10345	254	46	109	3	11575.47	3125.37
10346	254	22	222	8	69108.32	6910.80
10347	254	6	325	8	55705.44	8912.88
10348	254	22	13	5	41235.95	6185.40
10349	254	12	57	16	51158.88	12278.08
10350	788	13	781	1	3412.20	443.59
10351	254	46	89	6	34675.62	12829.98
10352	254	19	695	9	89594.91	31358.25
10353	254	50	276	7	67314.10	24233.09
10354	254	31	245	6	48059.40	13937.22
10355	254	33	251	10	56983.30	17664.80
10356	254	39	909	3	14716.50	3679.14
10357	254	4	393	8	38458.16	13844.96
10358	254	38	914	2	10665.90	4159.70
10359	254	39	870	10	44043.20	16296.00
10360	254	12	713	6	48196.62	12531.12
10361	254	18	788	3	10984.65	1757.55
10362	254	37	582	2	4316.36	431.64
10363	254	37	439	1	4198.31	545.78
10364	254	25	123	1	2162.44	367.61
10365	254	40	899	4	24506.08	6371.60
10366	254	4	107	3	25475.73	8152.23
10367	254	39	554	4	16049.32	5296.28
10368	254	31	401	3	3487.83	697.56
10369	254	34	530	7	28084.91	4493.58
10370	254	27	971	7	61140.31	7948.22
10371	254	2	397	6	32770.08	3604.68
10372	254	48	236	2	11139.66	3119.10
10373	254	46	982	2	18209.66	7101.76
10374	254	17	441	7	47279.19	11819.78
10375	254	34	35	8	23580.32	6366.72
10376	254	30	736	9	58520.43	6437.25
10377	254	5	885	4	3740.40	1421.36
10378	254	12	318	9	33231.60	6646.32
10379	254	17	572	1	6210.29	1738.88
10380	254	2	149	5	31977.65	4796.65
10381	254	27	502	6	35902.74	7539.60
10382	254	30	561	5	9898.90	2474.70
10383	254	40	140	5	37759.40	12460.60
10384	254	34	332	9	87011.55	22623.03
10385	254	17	883	5	12588.90	4280.25
10386	180	7	112	3	7835.25	783.51
10387	254	10	769	1	9489.73	1708.15
10388	426	15	705	5	37967.60	6834.15
10389	254	13	456	10	53914.60	5391.50
10390	254	32	940	2	12774.46	1660.68
10391	254	29	66	4	8574.08	3343.88
10392	254	34	895	8	42219.44	16043.36
10393	254	8	504	5	3583.45	680.85
10394	254	23	288	5	4969.70	1590.30
10395	254	26	913	9	29439.00	5593.41
10396	254	8	936	3	13886.01	4443.51
10397	254	27	159	9	38104.20	10669.14
10398	740	35	353	7	15320.62	4289.74
10399	254	29	800	6	58794.42	10582.98
10400	254	34	115	3	13472.19	2829.15
10401	254	6	604	6	17661.54	3355.68
10402	254	19	705	8	60748.16	10934.64
10403	173	37	188	6	6874.74	1031.22
10404	254	20	628	4	16112.84	3867.08
10405	254	48	638	9	78131.70	28908.72
10406	254	44	308	1	1279.06	511.62
10407	799	5	890	8	11027.20	2205.44
10408	254	1	350	6	42197.22	16456.92
10409	254	25	245	5	40049.50	11614.35
10410	254	21	396	6	16148.28	3875.58
10411	254	33	219	7	64046.99	24978.31
10412	262	31	680	1	9930.49	2581.93
10413	254	17	364	8	50111.12	13028.88
10414	254	3	368	2	8514.10	2639.38
10415	254	8	320	9	65595.33	16398.81
10416	254	18	498	5	35410.15	13101.75
10417	254	31	670	9	38923.47	8563.14
10418	254	37	118	12	28038.48	7570.44
10419	254	5	958	2	17364.76	3125.66
10420	254	46	14	7	53777.36	12906.60
10421	254	17	804	10	45318.50	17221.00
10422	254	28	513	5	35126.25	9132.85
10423	254	33	651	4	27129.16	8138.76
10424	254	16	789	9	85328.19	20478.78
10425	254	33	828	2	4606.70	1704.48
10426	254	22	490	4	19203.88	2688.56
10427	254	12	460	8	26612.32	7451.44
10428	565	48	513	3	21075.75	5479.71
10429	254	31	3	1	8643.67	2160.92
10430	254	50	846	5	33403.25	9686.95
10431	254	49	772	8	39324.08	11010.72
10432	254	22	665	12	9652.44	2027.04
10433	254	48	375	3	22016.25	8806.50
10434	254	7	416	5	10402.15	3952.80
10435	254	25	617	10	59305.20	22536.00
10436	320	20	543	3	11980.44	3354.51
10437	254	47	412	6	48041.94	5765.04
10438	254	10	894	2	10699.24	3102.78
10439	684	15	875	3	27604.89	6625.17
10440	254	28	85	5	17823.35	4990.55
10441	254	8	173	4	25649.72	9233.88
10442	254	12	107	1	8491.91	2717.41
10443	280	22	587	8	1189.20	344.88
10444	254	38	802	8	24062.56	7218.80
10445	254	28	756	3	11882.40	3921.18
10446	254	4	827	13	23670.01	4023.89
10447	254	34	610	9	78657.21	9438.84
10448	648	26	899	9	55138.68	14336.10
10449	254	37	857	10	34404.70	3440.50
10450	254	50	894	4	21398.48	6205.56
10451	254	4	467	1	9528.67	3335.03
10452	331	11	283	1	9599.13	1727.84
10453	254	24	785	5	23255.15	6976.55
10454	254	27	703	9	56287.26	12383.19
10455	254	5	989	4	2915.64	816.36
10456	254	31	429	4	19012.08	4182.64
10457	254	20	128	6	18899.76	2834.94
10458	254	42	834	1	3354.69	1341.88
10459	254	47	627	5	29327.10	4399.05
10460	254	21	243	8	8399.20	2435.76
10461	254	42	47	10	41476.30	16590.50
10462	254	43	849	1	3880.11	1513.24
10463	290	48	252	9	69489.72	8338.77
10464	254	15	291	10	24031.10	8410.90
10465	251	49	235	6	34287.90	7543.32
10466	549	30	160	2	1048.64	335.56
10467	254	33	138	5	21990.15	2418.90
10468	254	29	153	11	5628.37	2195.05
10469	254	14	250	16	59821.44	19142.88
10470	254	1	408	6	59702.46	16716.66
10471	344	49	584	8	40117.36	12837.52
10472	254	17	752	5	15555.40	4977.75
10473	254	30	524	10	66991.00	15407.90
10474	254	31	317	9	35939.16	13656.87
10475	254	37	380	1	2622.38	603.15
10476	254	32	227	11	81521.55	26902.15
10477	254	7	230	6	36670.74	4767.18
10478	254	11	356	13	57962.84	11012.95
10479	254	21	699	9	36104.31	9387.09
10480	254	26	843	10	91616.60	20155.70
10481	254	43	605	4	22188.72	8653.60
10482	254	28	202	3	26358.45	4480.95
10483	254	16	79	1	9062.43	1721.86
10484	254	25	364	8	50111.12	13028.88
10485	254	37	364	8	50111.12	13028.88
10486	254	27	529	5	17948.85	6102.60
10487	254	43	510	6	33320.58	4331.70
10488	254	16	243	2	2099.80	608.94
10489	254	25	836	9	64881.27	14273.91
10490	254	47	932	1	3200.78	320.08
10491	254	16	134	3	14504.31	2465.73
10492	254	1	374	3	4967.76	1043.22
10493	29	2	592	9	88361.91	16788.78
10494	254	10	298	8	57548.08	8056.72
10495	254	7	145	2	15072.62	5426.14
10496	254	10	771	7	14610.61	1607.20
10497	115	29	749	10	16834.80	4545.40
10498	254	32	514	9	4477.41	582.03
10499	254	35	873	8	24884.32	4728.00
10500	254	6	845	1	8881.82	1865.18
10501	254	35	140	10	75518.80	24921.20
10502	258	27	510	7	38874.01	5053.65
10503	557	44	279	7	25063.85	5764.71
10504	254	29	670	8	34598.64	7611.68
10505	254	4	647	3	20934.81	2302.83
10506	254	26	456	6	32348.76	3234.90
10507	254	29	869	1	9436.49	3208.41
10508	337	26	559	7	43004.22	12041.19
10509	254	47	895	7	36942.01	14037.94
10510	254	40	973	5	17180.10	6356.65
10511	639	46	532	2	17913.94	2149.68
10512	254	47	660	1	4425.11	1637.29
10513	254	42	260	1	489.47	93.00
10514	254	30	786	4	17340.12	6589.24
10515	254	25	920	2	779.70	257.30
10516	254	38	547	3	22273.08	2895.51
10517	254	28	598	10	22046.10	5732.00
10518	254	40	863	9	28721.70	10914.21
10519	306	3	269	10	85069.10	17013.80
10520	254	49	818	7	60314.38	16888.06
10521	254	50	225	2	11310.04	3506.12
10522	254	3	880	7	43991.99	5718.93
10523	254	17	191	5	15272.10	2596.25
10524	312	12	711	10	33870.50	5080.60
10525	254	8	914	2	10665.90	4159.70
10526	254	30	67	1	6996.56	1119.45
10527	254	46	138	9	39582.27	4354.02
10528	290	48	157	3	4301.34	1118.34
10529	254	6	243	8	8399.20	2435.76
10530	254	45	917	10	9097.20	1000.70
10531	734	18	826	4	23604.92	6137.28
10532	254	18	103	6	16370.34	3601.50
10533	254	39	283	9	86392.17	15550.56
10534	254	44	475	10	57218.70	16593.40
10535	254	41	901	10	16795.60	3191.20
10536	254	33	754	1	33.61	9.07
10537	254	21	156	1	1144.76	194.61
10538	254	34	564	4	25648.56	2821.36
10539	254	24	472	2	12730.54	1273.06
10540	254	19	314	5	35526.00	11723.60
10541	254	25	57	2	6394.86	1534.76
10542	365	12	890	3	4135.20	827.04
10543	254	23	209	9	14706.90	5294.52
10544	254	48	49	6	54494.64	5994.42
10545	41	37	879	7	34323.45	8580.88
10546	254	43	496	1	386.12	111.97
10547	254	31	554	2	8024.66	2648.14
10548	254	20	287	5	14529.50	5375.90
10549	254	8	891	1	7774.69	1243.95
10550	254	47	50	8	15824.72	4114.40
10551	325	36	988	1	3478.66	660.95
10552	254	17	659	7	40760.93	8967.42
10553	254	46	87	8	47091.20	5650.96
10554	254	42	783	7	59780.98	20325.55
10555	254	15	381	9	10516.59	3049.83
10556	254	40	647	3	20934.81	2302.83
10557	254	7	874	4	11439.32	2059.08
10558	254	4	616	6	6331.14	2532.48
10559	254	18	404	1	8931.36	2500.78
10560	254	5	764	9	68208.21	15005.79
10561	254	46	233	4	18156.44	6354.76
10562	254	17	399	1	3875.00	891.25
10563	254	33	397	8	43693.44	4806.24
10564	254	46	888	8	46062.32	12436.80
10565	254	32	687	7	13399.33	3483.83
10566	254	12	85	6	21388.02	5988.66
10567	254	36	741	4	27734.92	7211.08
10568	254	8	501	8	66739.36	23358.80
10569	254	10	877	7	20463.24	3478.72
10570	254	17	725	6	33798.54	3717.84
10571	312	12	54	6	862.38	258.72
10572	254	44	836	6	43254.18	9515.94
10573	437	29	294	3	17671.74	3180.90
10574	523	37	13	9	74224.71	11133.72
10575	254	8	695	6	59729.94	20905.50
10576	254	6	896	1	911.51	182.30
10577	254	25	809	1	4307.56	1464.57
10578	254	15	716	10	27388.30	9585.90
10579	254	1	824	9	72633.69	23969.16
10580	254	43	697	7	9192.96	3309.46
10581	180	7	797	10	68248.10	15014.60
10582	254	37	704	6	52960.20	19595.28
10583	254	46	796	5	33742.10	5736.15
10584	433	30	925	2	9977.42	1596.38
10585	254	13	632	9	2319.93	487.17
10586	254	4	573	6	9626.58	2984.22
10587	254	2	560	1	9292.88	3252.51
10588	254	47	497	9	47106.00	16016.04
10589	254	31	726	2	8669.58	2860.96
10590	254	13	924	7	49165.20	4916.52
10591	633	22	943	7	43634.50	17017.49
10592	254	7	744	8	6870.00	1580.08
10593	254	41	152	6	14589.48	2334.30
10594	254	42	577	5	39050.40	6638.55
10595	254	27	738	10	23167.70	5096.90
10596	254	49	622	8	31106.00	3110.56
10597	254	10	397	3	16385.04	1802.34
10598	254	29	938	9	29559.96	8572.41
10599	415	7	306	6	43324.86	16896.72
10600	254	48	707	3	8484.03	1357.44
10601	254	46	623	1	7168.32	1433.66
10602	254	22	523	7	56709.52	22116.71
10603	254	29	15	6	31685.88	7287.78
10604	254	1	963	4	25504.44	4845.84
10605	254	46	390	9	14737.23	2358.00
10606	254	3	818	6	51698.04	14475.48
10607	254	19	747	10	1382.60	221.20
10608	254	19	612	5	43362.85	10407.10
10609	254	45	819	3	9183.00	3397.71
10610	510	46	123	5	10812.20	1838.05
10611	254	25	264	4	36259.80	5076.36
10612	254	26	111	7	65150.05	12378.52
10613	660	4	731	10	55068.40	8260.30
10614	254	40	287	10	29059.00	10751.80
10615	254	27	354	5	30431.90	3043.20
10616	254	27	630	10	14251.30	4132.90
10617	660	47	637	9	30770.55	12000.51
10618	254	11	801	2	4883.04	683.62
10619	254	6	399	6	23250.00	5347.50
10620	254	4	70	8	18154.24	3267.76
10621	254	4	521	4	33877.76	13212.32
10622	254	11	735	3	26804.16	9381.45
10623	254	37	867	5	22127.50	7744.60
10624	437	29	520	8	4323.28	1642.88
10625	254	19	506	4	2197.64	791.16
10626	254	45	3	8	69149.36	17287.36
10627	254	25	27	3	13767.57	4680.96
10628	254	27	57	1	3197.43	767.38
10629	254	22	576	4	3990.48	1276.96
10630	254	11	239	8	16329.84	5062.24
10631	254	38	794	2	9440.28	1227.24
10632	254	17	580	2	11347.88	1702.18
10633	254	21	145	6	45217.86	16278.42
10634	254	36	15	9	47528.82	10931.67
10635	254	7	649	7	60714.50	22464.33
10636	254	33	430	3	3265.17	555.09
10637	257	8	399	10	38750.00	8912.50
10638	254	17	598	2	4409.22	1146.40
10639	254	37	854	7	29160.46	10206.14
10640	254	13	942	3	5372.13	805.83
10641	254	35	577	20	156201.60	26554.20
10642	254	28	50	8	15824.72	4114.40
10643	546	5	135	7	37474.78	5621.21
10644	426	24	757	2	2172.22	369.28
10645	254	8	100	7	40130.79	8427.44
10646	139	17	465	5	18000.15	4140.05
10647	254	35	281	9	41603.49	9152.73
10648	254	13	889	8	35306.16	8120.40
10649	254	11	998	3	21955.50	4171.53
10650	254	33	755	1	8479.07	1611.02
10651	254	3	999	7	4803.89	1345.12
10652	254	6	212	5	25644.45	4872.45
10653	254	34	750	8	2939.12	940.48
10654	257	48	692	10	36672.40	4400.70
10655	254	20	403	7	4856.88	534.24
10656	254	5	327	9	12667.95	3546.99
10657	254	9	934	1	82.26	11.52
10658	89	22	469	3	109.17	32.76
10659	254	12	600	14	33151.86	10940.16
10660	254	24	644	2	1711.36	581.86
10661	254	3	935	6	18379.68	2940.72
10662	64	30	191	7	21380.94	3634.75
10663	254	34	461	4	27998.68	3079.84
10664	254	1	249	5	40831.75	5308.15
10665	254	26	828	7	16123.45	5965.68
10666	254	45	255	8	4088.16	1553.52
10667	254	29	988	8	27829.28	5287.60
10668	696	30	397	9	49155.12	5407.02
10669	254	19	481	11	109235.72	21847.10
10670	254	35	981	1	1771.06	425.05
10671	254	22	826	5	29506.15	7671.60
10672	254	33	632	7	1804.39	378.91
10673	254	17	702	8	70661.04	19785.12
10674	254	43	362	10	94214.50	28264.30
10675	760	16	79	1	9062.43	1721.86
10676	377	49	990	4	29974.04	6294.56
10677	630	11	381	1	1168.51	338.87
10678	254	46	407	4	17750.40	6212.64
10679	254	2	925	10	49887.10	7981.90
10680	254	31	637	7	23932.65	9333.73
10681	254	38	144	3	22564.80	6318.15
10682	254	44	642	2	9642.50	3182.02
10683	254	17	297	3	23189.04	3942.15
10684	254	47	323	5	10438.65	3131.60
10685	620	29	167	4	29864.44	3583.72
10686	254	44	324	10	59136.50	13010.00
10687	254	36	931	9	24185.43	3869.64
10688	254	14	116	4	8967.16	1793.44
10689	254	44	626	6	27680.58	9688.20
10690	104	19	813	10	64746.60	15539.20
10691	254	50	296	2	12277.74	2946.66
10692	254	49	451	8	59863.60	11374.08
10693	395	11	67	8	55972.48	8955.60
10694	254	36	592	8	78543.92	14923.36
10695	254	43	331	6	12877.56	4507.14
10696	254	9	356	6	26752.08	5082.90
10697	254	3	307	4	15537.92	6059.80
10698	254	46	926	1	5303.56	1485.00
10699	254	40	645	2	391.68	137.08
10700	254	32	667	4	21413.36	8565.36
10701	254	37	912	8	39641.04	4756.96
10702	254	8	782	2	2839.30	369.10
10703	254	43	759	10	43048.60	9040.20
10704	254	1	721	3	29901.72	7176.42
10705	254	37	4	6	41229.78	10719.72
10706	254	10	132	2	6096.86	2011.96
10707	254	32	219	9	82346.13	32114.97
10708	254	49	280	10	81337.70	32535.10
10709	254	48	759	1	4304.86	904.02
10710	254	2	761	8	78762.48	25204.00
10711	254	23	346	5	20039.15	5410.55
10712	254	48	195	7	69519.10	7647.08
10713	720	43	163	3	10110.57	2628.75
10714	254	43	981	7	12397.42	2975.35
10715	254	9	386	9	68511.33	23293.89
10716	254	32	454	8	38711.44	6968.08
10717	254	15	521	6	50816.64	19818.48
10718	254	19	58	7	66914.96	13383.02
10719	526	7	841	8	60945.84	20721.60
10720	254	37	467	3	28586.01	10005.09
10721	254	13	116	7	15692.53	3138.52
10722	254	26	866	4	11814.08	1181.40
10723	254	38	298	4	28774.04	4028.36
10724	66	37	690	2	10517.06	2103.42
10725	254	39	58	1	9559.28	1911.86
10726	254	4	66	4	8574.08	3343.88
10727	254	7	108	9	55695.78	7797.42
10728	254	41	481	4	39722.08	7944.40
10729	254	40	858	10	96683.40	33839.20
10730	254	42	699	1	4011.59	1043.01
10731	192	35	947	4	13494.68	2159.16
10732	254	28	112	4	10447.00	1044.68
10733	254	36	616	2	2110.38	844.16
10734	452	14	665	8	6434.96	1351.36
10735	254	33	85	2	7129.34	1996.22
10736	254	3	450	6	50436.78	13113.54
10737	254	44	827	2	3641.54	619.06
10738	524	44	422	8	44011.84	7482.00
10739	254	44	518	6	1487.28	312.30
10740	254	9	1000	10	22235.30	7115.30
10741	254	19	975	2	2499.04	324.88
10742	254	10	170	7	64977.92	24691.59
10743	254	36	747	4	553.04	88.48
10744	254	33	932	10	32007.80	3200.80
10745	814	21	767	2	12908.28	4388.82
10746	254	16	978	4	10197.60	1937.56
10747	34	30	473	9	74863.17	16469.91
10748	370	9	415	5	32627.55	3915.30
10749	254	44	725	3	16899.27	1858.92
10750	254	27	899	10	61265.20	15929.00
10751	786	22	652	8	33931.84	13572.72
10752	254	44	48	3	12003.42	4681.32
10753	254	18	466	2	14450.60	4479.68
10754	254	50	812	7	32026.33	7366.03
10755	254	16	179	1	326.78	91.50
10756	254	50	313	12	112335.96	41564.28
10757	254	15	951	4	11375.48	3412.64
10758	254	37	788	6	21969.30	3515.10
10759	254	46	936	2	9257.34	2962.34
10760	254	50	696	4	27641.68	7739.68
10761	254	15	440	5	38404.55	4224.50
10762	254	32	796	8	53987.36	9177.84
10763	254	7	876	10	12231.70	4770.40
10764	254	10	42	6	31569.48	10417.92
10765	254	47	78	7	45457.30	6364.05
10766	254	12	450	6	50436.78	13113.54
10767	634	5	795	3	20016.30	6605.37
10768	254	45	41	1	428.13	124.16
10769	254	7	856	4	6677.40	1602.56
10770	254	19	644	9	7701.12	2618.37
10771	254	29	924	12	84283.20	8428.32
10772	254	23	128	4	12599.84	1889.96
10773	99	43	35	3	8842.62	2387.52
10774	254	7	999	2	1372.54	384.32
10775	254	9	615	6	54990.06	16497.00
10776	254	9	688	5	44576.40	5349.15
10777	254	13	601	8	31652.32	7596.56
10778	254	4	618	1	6992.91	2517.45
10779	156	46	163	8	26961.52	7010.00
10780	254	25	943	2	12467.00	4862.14
10781	254	19	653	2	7013.90	1472.92
10782	76	32	770	7	56801.57	12496.33
10783	254	22	881	4	37381.84	14952.72
10784	254	44	753	2	10158.74	2641.28
10785	254	15	489	2	14018.74	3224.32
10786	254	22	674	8	52928.00	19054.08
10787	254	9	400	12	64433.64	18685.80
10788	254	34	410	1	1246.29	473.59
10789	254	31	624	8	75859.20	9103.12
10790	254	45	856	3	5008.05	1201.92
10791	254	21	106	1	8654.06	1557.73
10792	254	17	607	5	30641.65	6741.15
10793	254	31	904	15	141960.75	25552.95
10794	254	46	211	6	10444.50	3551.16
10795	549	30	470	6	42233.64	8869.08
10796	254	46	887	7	54875.38	18108.86
10797	254	30	21	8	4136.80	537.76
10798	820	36	124	4	18991.76	5697.52
10799	254	36	547	7	51970.52	6756.19
10800	94	31	213	4	4237.60	508.52
10801	254	36	22	3	8399.94	840.00
10802	254	16	70	5	11346.40	2042.35
10803	254	44	178	2	12370.40	1855.56
10804	254	33	400	14	75172.58	21800.10
10805	254	22	511	5	7683.60	2458.75
10806	254	48	883	5	12588.90	4280.25
10807	254	17	644	5	4278.40	1454.65
10808	254	43	846	3	20041.95	5812.17
10809	254	32	657	4	1706.88	273.12
10810	254	35	74	5	1775.25	408.30
10811	254	14	137	6	38317.92	12261.72
10812	254	1	727	4	33761.92	12829.52
10813	254	40	175	2	19816.42	3368.80
10814	254	44	704	17	150053.90	55519.96
10815	254	26	765	9	266.49	58.59
10816	254	1	804	10	45318.50	17221.00
10817	254	9	640	12	66087.12	19165.32
10818	254	27	22	6	16799.88	1680.00
10819	254	30	468	6	12566.76	1508.04
10820	254	22	669	5	16291.70	3747.10
10821	254	46	990	1	7493.51	1573.64
10822	254	16	158	3	26211.60	8387.70
10823	254	26	517	2	13912.50	3478.12
10824	254	6	859	1	7440.26	2752.90
10825	254	19	394	1	6381.39	1340.09
10826	575	36	617	1	5930.52	2253.60
10827	254	27	273	5	18163.30	3451.05
10828	254	34	91	4	39775.48	9148.36
10829	254	45	348	7	4688.60	1828.54
10830	254	43	307	7	27191.36	10604.65
10831	254	3	217	10	46936.30	15958.30
10832	601	50	232	7	69799.24	14657.86
10833	254	38	269	6	51041.46	10208.28
10834	254	26	384	5	49179.50	5409.75
10835	254	1	241	10	58574.40	13472.10
10836	254	21	553	7	45720.15	16002.07
10837	254	2	412	2	16013.98	1921.68
10838	254	49	53	7	68424.93	7526.75
10839	254	31	229	13	36050.69	9373.13
10840	254	37	703	5	31270.70	6879.55
10841	254	2	38	7	34251.14	9247.84
10842	254	12	849	5	19400.55	7566.20
10843	254	34	833	1	3970.99	1231.01
10844	254	44	297	1	7729.68	1314.05
10845	114	9	250	9	33649.56	10767.87
10846	254	37	296	4	24555.48	5893.32
10847	254	7	247	3	18804.00	2632.56
10848	254	7	734	7	9536.59	3719.24
10849	254	43	302	3	19567.32	7826.94
10850	254	40	193	9	46104.03	11526.03
10851	254	23	213	4	4237.60	508.52
10852	254	39	816	1	1196.98	406.97
10853	254	8	386	1	7612.37	2588.21
10854	254	45	339	9	67373.73	24928.29
10855	254	10	57	8	25579.44	6139.04
10856	254	22	961	3	26630.70	5592.45
10857	254	37	808	7	64293.81	14144.62
10858	254	38	312	5	48746.85	14624.05
10859	254	49	117	10	36169.10	14467.60
10860	254	23	423	2	17911.66	3224.10
10861	254	14	693	8	38166.08	13739.76
10862	254	22	889	4	17653.08	4060.20
10863	254	25	31	1	4212.81	1348.10
10864	254	33	170	2	18565.12	7054.74
10865	254	48	607	8	49026.64	10785.84
10866	254	39	725	6	33798.54	3717.84
10867	254	2	980	7	53010.44	10602.06
10868	254	43	404	8	71450.88	20006.24
10869	254	2	465	7	25200.21	5796.07
10870	254	47	686	10	34197.40	8549.40
10871	254	17	611	4	27682.60	9688.92
10872	254	33	618	5	34964.55	12587.25
10873	254	50	682	8	11145.44	3343.60
10874	806	3	624	8	75859.20	9103.12
10875	844	12	84	9	17266.05	1899.27
10876	254	17	859	6	44641.56	16517.40
10877	254	22	220	1	4724.31	992.11
10878	254	49	956	1	8338.13	2334.68
10879	254	9	195	9	89381.70	9831.96
10880	254	16	642	4	19285.00	6364.04
10881	270	13	891	4	31098.76	4975.80
10882	709	14	938	8	26275.52	7619.92
10883	254	28	235	8	45717.20	10057.76
10884	254	4	27	6	27535.14	9361.92
10885	254	46	989	6	4373.46	1224.54
10886	254	33	461	1	6999.67	769.96
10887	254	5	301	10	26588.90	5583.70
10888	254	25	380	3	7867.14	1809.45
10889	254	3	863	10	31913.00	12126.90
10890	254	18	438	10	67022.20	15415.10
10891	254	46	806	5	25165.65	8556.30
10892	344	49	791	8	22107.76	3979.36
10893	254	1	789	5	47404.55	11377.10
10894	254	9	865	2	18419.92	3131.38
10895	254	9	304	7	58522.03	9363.55
10896	254	10	266	3	19819.29	6936.75
10897	254	10	130	8	65862.64	9879.36
10898	254	48	21	3	1551.30	201.66
10899	254	36	448	6	27114.18	6507.42
10900	254	37	921	3	13230.30	4630.59
10901	254	39	298	3	21580.53	3021.27
10902	254	15	589	7	38504.06	15401.61
10903	254	24	784	6	54271.86	20623.32
10904	254	39	873	6	18663.24	3546.00
10905	254	10	969	7	17141.32	2056.95
10906	254	23	481	12	119166.24	23833.20
10907	254	1	926	9	47732.04	13365.00
10908	254	29	523	10	81013.60	31595.30
10909	254	3	737	3	29324.25	3225.66
10910	254	12	879	8	39226.80	9806.72
10911	254	37	455	9	35770.23	4650.12
10912	254	4	804	5	22659.25	8610.50
10913	254	40	305	6	54006.42	16201.92
10914	191	33	369	6	13830.00	2627.70
10915	254	17	183	7	3034.50	788.97
10916	254	3	622	1	3888.25	388.82
10917	254	49	402	10	38829.70	5824.50
10918	254	1	960	8	6458.40	904.16
10919	254	39	693	3	14312.28	5152.41
10920	66	37	638	6	52087.80	19272.48
10921	254	39	872	5	4251.30	552.65
10922	254	26	222	2	17277.08	1727.70
10923	95	1	872	3	2550.78	331.59
10924	258	32	547	6	44546.16	5791.02
10925	254	2	952	6	120.60	22.92
10926	254	12	176	9	43975.44	14951.61
10927	254	41	775	8	1647.68	214.16
10928	254	2	951	9	25594.83	7678.44
10929	254	42	112	5	13058.75	1305.85
10930	254	27	276	3	28848.90	10385.61
10931	94	8	442	3	17877.48	4111.83
10932	254	19	338	8	24884.72	9953.92
10933	254	2	502	8	47870.32	10052.80
10934	254	15	249	10	81663.50	10616.30
10935	254	25	917	10	9097.20	1000.70
10936	254	40	636	8	445.28	71.28
10937	254	19	634	7	48472.97	12118.26
10938	132	12	493	2	4997.74	949.58
10939	254	14	603	3	7849.17	2354.76
10940	254	29	334	4	35001.24	8400.28
10941	254	33	597	14	109580.80	30682.68
10942	254	49	372	7	56794.08	15902.32
10943	254	39	853	2	13932.58	3761.80
10944	633	22	558	9	89527.68	30439.44
10945	254	12	237	6	46990.62	10807.86
10946	254	17	688	1	8915.28	1069.83
10947	167	3	380	1	2622.38	603.15
10948	254	49	376	3	16159.56	4363.08
10949	254	26	818	2	17232.68	4825.16
10950	254	4	997	10	45764.20	6864.60
10951	254	9	872	3	2550.78	331.59
10952	254	19	300	3	23705.46	7585.74
10953	58	7	46	5	49601.65	10912.35
10954	254	25	492	7	14362.95	3303.51
10955	254	2	902	6	5483.58	1206.36
10956	254	7	46	7	69442.31	15277.29
10957	254	23	294	7	41234.06	7422.10
10958	254	34	137	2	12772.64	4087.24
10959	254	4	916	8	22471.12	3820.08
10960	254	15	58	6	57355.68	11471.16
10961	254	31	902	4	3655.72	804.24
10962	254	22	488	3	28878.75	3176.67
10963	254	47	392	8	52246.80	18808.88
10964	254	42	830	3	11098.41	1109.85
10965	38	27	327	3	4222.65	1182.33
10966	254	42	620	7	26520.90	9547.51
10967	254	8	18	2	19978.74	3596.18
10968	254	24	217	6	28161.78	9574.98
10969	254	3	106	7	60578.42	10904.11
10970	33	27	832	2	11159.04	2120.22
10971	853	31	291	3	7209.33	2523.27
10972	254	33	146	10	32712.40	3925.50
10973	254	41	586	2	13340.34	1734.24
10974	254	5	672	1	7353.57	1397.18
10975	254	5	929	3	4692.81	1314.00
10976	254	28	606	10	92297.20	35072.90
10977	199	49	70	10	22692.80	4084.70
10978	254	38	758	4	19088.76	7444.60
10979	254	20	242	3	29991.51	9897.21
10980	254	39	128	8	25199.68	3779.92
10981	254	11	536	9	63633.69	17181.09
10982	254	46	159	5	21169.00	5927.30
10983	834	41	930	4	37352.96	9711.76
10984	254	33	513	6	42151.50	10959.42
10985	254	49	174	9	57388.77	16068.87
10986	254	13	328	6	47769.54	15286.26
10987	254	2	988	5	17393.30	3304.75
10988	254	47	310	10	13106.40	1310.60
10989	418	4	860	10	93905.10	28171.50
10990	254	23	937	5	2429.95	315.90
10991	256	48	328	8	63692.72	20381.68
10992	254	19	1	10	57369.40	18931.90
10993	254	41	281	9	41603.49	9152.73
10994	254	20	849	9	34920.99	13619.16
10995	254	6	341	10	90577.90	20832.90
10996	254	24	558	8	79580.16	27057.28
10997	254	32	611	3	20761.95	7266.69
10998	254	1	375	1	7338.75	2935.50
10999	254	33	919	5	45496.55	6369.50
11000	254	5	654	5	41568.85	10807.90
11001	254	27	201	7	28298.90	5093.83
11002	254	28	912	6	29730.78	3567.72
11003	254	7	588	2	3327.26	865.08
11004	254	42	795	18	120097.80	39632.22
11005	254	42	937	4	1943.96	252.72
11006	254	42	736	8	52018.16	5722.00
11007	254	31	404	5	44656.80	12503.90
11008	254	15	160	1	524.32	167.78
11009	254	41	177	3	17218.14	2410.53
11010	254	6	350	4	28131.48	10971.28
11011	254	41	749	7	11784.36	3181.78
11012	254	17	582	3	6474.54	647.46
11013	61	8	513	5	35126.25	9132.85
11014	254	8	70	6	13615.68	2450.82
11015	132	12	943	8	49868.00	19448.56
11016	175	13	929	3	4692.81	1314.00
11017	254	48	795	4	26688.40	8807.16
11018	254	35	121	5	34323.35	3775.55
11019	524	44	910	10	28599.20	5719.80
11020	254	44	93	4	20071.76	6422.96
11021	254	2	300	4	31607.28	10114.32
11022	254	33	492	6	12311.10	2831.58
11023	254	42	845	3	26645.46	5595.54
11024	254	39	793	5	33233.40	9637.70
11025	254	22	680	6	59582.94	15491.58
11026	41	37	458	4	28206.92	8180.00
11027	254	49	806	9	45298.17	15401.34
11028	254	25	785	10	46510.30	13953.10
11029	254	20	721	7	69770.68	16744.98
11030	254	4	461	5	34998.35	3849.80
11031	254	16	43	9	86870.79	14768.01
11032	254	35	608	10	51904.90	6747.60
11033	254	27	453	4	36175.28	9043.84
11034	254	14	976	3	314.22	87.99
11035	254	34	288	3	2981.82	954.18
11036	254	35	625	3	20193.18	4644.42
11037	254	19	210	4	21362.52	6408.76
11038	254	11	433	6	8011.44	2803.98
11039	119	13	330	9	63376.11	16477.83
11040	254	44	220	3	14172.93	2976.33
11041	254	40	956	10	83381.30	23346.80
11042	254	1	569	10	41458.00	8706.20
11043	254	41	92	4	22816.40	7985.72
11044	254	1	204	9	26167.32	8373.51
11045	254	27	7	5	23470.55	3520.60
11046	254	15	284	1	1706.10	204.73
11047	636	24	79	4	36249.72	6887.44
11048	254	23	711	9	30483.45	4572.54
11049	254	2	258	3	27754.83	10824.39
11050	254	1	444	5	49278.40	15769.10
11051	254	10	615	6	54990.06	16497.00
11052	150	30	938	9	29559.96	8572.41
11053	859	23	866	5	14767.60	1476.75
11054	254	38	357	5	47032.60	14580.10
11055	254	28	324	8	47309.20	10408.00
11056	254	2	244	10	61439.60	23961.40
11057	254	22	606	8	73837.76	28058.32
11058	254	39	194	10	54372.20	8155.80
11059	30	17	935	1	3063.28	490.12
11060	254	15	153	7	3581.69	1396.85
11061	254	5	328	10	79615.90	25477.10
11062	254	1	194	8	43497.76	6524.64
11063	254	9	424	2	12512.62	4754.80
11064	254	34	819	6	18366.00	6795.42
11065	254	28	729	8	44152.16	15453.28
11066	254	43	83	9	70765.83	24768.00
11067	254	41	317	6	23959.44	9104.58
11068	254	10	849	3	11640.33	4539.72
11069	254	15	532	4	35827.88	4299.36
11070	254	10	875	9	82814.67	19875.51
11071	254	13	850	3	25906.80	5181.36
11072	254	36	913	8	26168.00	4971.92
11073	254	49	704	9	79440.30	29392.92
11074	856	18	215	10	96303.70	20223.80
11075	254	34	366	7	1490.09	149.03
11076	254	34	940	4	25548.92	3321.36
11077	254	26	917	5	4548.60	500.35
11078	254	39	83	10	78628.70	27520.00
11079	254	6	567	3	22004.70	2420.52
11080	254	12	163	2	6740.38	1752.50
11081	254	39	928	1	6083.70	2007.62
11082	254	29	16	7	28040.60	5047.28
11083	254	1	462	1	5189.49	1764.43
11084	254	46	313	9	84251.97	31173.21
11085	254	44	560	5	46464.40	16262.55
11086	254	43	991	9	29234.88	4677.57
11087	254	18	611	1	6920.65	2422.23
11088	254	35	949	6	40500.72	13365.24
11089	417	31	881	8	74763.68	29905.44
11090	380	1	608	9	46714.41	6072.84
11091	254	34	287	3	8717.70	3225.54
11092	254	7	77	5	34338.40	7897.85
11093	405	31	726	9	39013.11	12874.32
11094	825	21	933	4	32219.36	11598.96
11095	497	5	687	3	5742.57	1493.07
11096	538	9	691	7	59276.49	18968.46
11097	254	47	405	7	38468.08	11925.13
11098	254	37	261	10	22896.70	8242.80
11099	254	50	943	3	18700.50	7293.21
11100	254	48	348	6	4018.80	1567.32
11101	254	16	974	4	34285.92	11657.20
11102	254	23	699	7	28081.13	7301.07
11103	254	44	983	10	34873.20	5579.70
11104	254	37	898	8	40207.12	15278.72
11105	254	4	338	1	3110.59	1244.24
11106	254	21	482	9	30247.56	6654.42
11107	254	45	306	2	14441.62	5632.24
11108	254	31	11	4	9787.92	3915.16
11109	167	47	972	5	12209.75	4151.30
11110	254	38	267	2	12941.24	2717.66
11111	254	9	419	4	12707.72	4574.76
11112	150	30	212	8	41031.12	7795.92
11113	254	22	63	8	61913.44	9906.16
11114	254	47	652	9	38173.32	15269.31
11115	254	29	308	8	10232.48	4092.96
11116	254	21	458	4	28206.92	8180.00
11117	254	41	963	7	44632.77	8480.22
11118	254	42	757	10	10861.10	1846.40
11119	570	44	749	7	11784.36	3181.78
11120	254	19	107	2	16983.82	5434.82
11121	3	17	453	3	27131.46	6782.88
11122	254	14	91	3	29831.61	6861.27
11123	254	14	481	6	59583.12	11916.60
11124	254	26	820	4	7389.48	2734.12
11125	254	15	434	5	42155.55	8009.55
11126	254	8	389	10	9609.00	3747.50
11127	254	38	337	2	13869.12	2080.36
11128	254	17	106	7	60578.42	10904.11
11129	874	9	384	10	98359.00	10819.50
11130	76	32	453	5	45219.10	11304.80
11131	254	9	327	1	1407.55	394.11
11132	520	31	65	5	32717.90	6216.40
11133	254	24	633	8	55070.96	20926.96
11134	254	29	560	4	37171.52	13010.04
11135	254	15	888	10	57577.90	15546.00
11136	254	38	533	8	26210.64	9960.08
11137	254	38	281	7	32358.27	7118.79
11138	254	50	353	5	10943.30	3064.10
11139	254	36	951	5	14219.35	4265.80
11140	254	44	750	8	2939.12	940.48
11141	254	11	934	7	575.82	80.64
11142	254	24	399	2	7750.00	1782.50
11143	254	3	52	15	69554.40	6955.50
11144	254	5	73	7	16487.73	1978.55
11145	280	22	805	7	19681.76	6691.79
11146	254	3	454	6	29033.58	5226.06
11147	254	31	154	6	34581.00	6224.58
11148	338	22	739	7	52847.48	12683.37
11149	254	34	508	10	96063.20	19212.60
11150	254	6	140	5	37759.40	12460.60
11151	748	39	492	4	8207.40	1887.72
11152	254	18	660	3	13275.33	4911.87
11153	532	24	173	3	19237.29	6925.41
11154	536	29	617	6	35583.12	13521.60
11155	254	8	410	1	1246.29	473.59
11156	254	21	283	10	95991.30	17278.40
11157	254	43	225	6	33930.12	10518.36
11158	254	11	556	1	6222.60	1120.07
11159	254	44	1000	9	20011.77	6403.77
11160	254	4	182	8	50834.56	15758.72
11161	254	26	798	6	42583.38	16181.70
11162	254	43	150	2	16616.84	4985.06
11163	624	34	990	10	74935.10	15736.40
11164	254	10	95	8	38414.24	9987.68
11165	254	9	319	1	6271.85	2383.30
11166	254	43	32	2	10783.14	4205.42
11167	834	41	619	5	5236.15	890.15
11168	238	27	396	10	26913.80	6459.30
11169	254	48	311	2	6249.76	1874.92
11170	254	30	552	7	34006.98	12922.63
11171	254	8	213	5	5297.00	635.65
11172	254	48	616	5	5275.95	2110.40
11173	254	1	871	1	1673.18	184.05
11174	254	31	778	6	34249.50	13014.84
11175	272	46	188	8	9166.32	1374.96
11176	293	31	287	3	8717.70	3225.54
11177	254	41	511	8	12293.76	3934.00
11178	254	39	15	6	31685.88	7287.78
11179	254	25	466	3	21675.90	6719.52
11180	598	9	42	5	26307.90	8681.60
11181	254	22	211	3	5222.25	1775.58
11182	254	31	71	10	38322.60	8047.70
11183	254	10	758	1	4772.19	1861.15
11184	254	25	613	5	31291.20	4380.75
11185	254	12	550	3	13998.09	1679.76
11186	254	15	504	10	7166.90	1361.70
11187	254	46	182	2	12708.64	3939.68
11188	254	4	810	3	12547.68	4768.11
11189	254	18	882	7	6140.40	1412.32
11190	112	49	263	1	9372.34	1780.74
11191	254	43	842	3	11800.11	2714.04
11192	182	11	892	3	10346.55	2793.57
11193	254	40	86	3	21726.09	2389.86
11194	254	37	742	10	73251.80	24905.60
11195	254	50	176	1	4886.16	1661.29
11196	254	44	686	2	6839.48	1709.88
11197	254	16	487	10	66584.00	19975.20
11198	254	44	833	8	31767.92	9848.08
11199	254	4	624	4	37929.60	4551.56
11200	254	41	465	7	25200.21	5796.07
11201	254	18	867	10	44255.00	15489.20
11202	254	14	235	1	5714.65	1257.22
11203	254	14	74	7	2485.35	571.62
11204	254	11	290	9	79891.02	17576.01
11205	254	34	309	2	3189.10	637.82
11206	254	21	842	7	27533.59	6332.76
11207	254	50	924	10	70236.00	7023.60
11208	254	32	296	9	55249.83	13259.97
11209	254	6	114	7	66395.42	18590.74
11210	254	49	370	8	10714.00	1928.56
11211	254	35	228	7	50697.01	18757.90
11212	254	11	357	5	47032.60	14580.10
11213	417	31	727	8	67523.84	25659.04
11214	254	36	766	9	13804.38	4003.29
11215	254	6	314	10	71052.00	23447.20
11216	254	44	947	8	26989.36	4318.32
11217	254	49	189	1	1221.98	244.40
11218	256	29	119	5	8569.10	2227.95
11219	254	24	285	10	29461.20	4419.20
11220	254	44	853	9	62696.61	16928.10
11221	254	48	606	8	73837.76	28058.32
11222	254	44	826	3	17703.69	4602.96
11223	254	45	905	4	3809.48	914.28
11224	760	16	753	6	30476.22	7923.84
11225	254	12	774	3	26144.85	4967.52
11226	254	3	250	6	22433.04	7178.58
11227	254	42	861	6	3182.64	1050.30
11228	254	23	180	9	32013.00	12805.20
11229	254	11	914	10	53329.50	20798.50
11230	254	17	593	8	3882.80	1436.64
11231	254	32	118	4	9346.16	2523.48
11232	254	18	841	1	7618.23	2590.20
11233	254	41	359	9	46513.62	15349.50
11234	254	47	144	8	60172.80	16848.40
11235	254	34	336	7	29344.42	3814.79
11236	254	44	487	8	53267.20	15980.16
11237	254	22	461	9	62997.03	6929.64
11238	254	16	715	6	44348.04	4878.30
11239	254	7	883	5	12588.90	4280.25
11240	254	5	628	4	16112.84	3867.08
11241	254	27	94	3	26218.29	7865.49
11242	254	43	132	1	3048.43	1005.98
11243	254	43	326	3	23139.75	4165.17
11244	254	39	98	1	970.78	252.40
11245	254	27	123	5	10812.20	1838.05
11246	254	36	644	10	8556.80	2909.30
11247	254	4	15	6	31685.88	7287.78
11248	254	6	130	8	65862.64	9879.36
11249	254	7	643	10	71804.50	16515.00
11250	254	5	467	7	66700.69	23345.21
11251	254	41	626	4	18453.72	6458.80
11252	254	28	363	7	54429.34	6531.49
11253	254	14	788	6	21969.30	3515.10
11254	641	47	309	5	7972.75	1594.55
11255	254	42	454	8	38711.44	6968.08
11256	254	33	179	8	2614.24	732.00
11257	254	48	558	10	99475.20	33821.60
11258	254	39	868	1	3684.52	773.75
11259	254	4	974	2	17142.96	5828.60
11260	254	12	781	3	10236.60	1330.77
11261	254	22	343	8	76816.56	11522.48
11262	254	47	571	7	44044.70	4844.91
11263	254	14	705	2	15187.04	2733.66
11264	254	29	964	7	66403.47	17264.87
11265	254	40	965	6	40488.12	8907.36
11266	254	44	512	7	6408.29	640.85
11267	529	39	783	9	76861.26	26132.85
11268	254	41	515	13	114803.00	33292.87
11269	220	3	963	1	6376.11	1211.46
11270	254	39	296	7	42972.09	10313.31
11271	254	31	285	7	20622.84	3093.44
11272	254	3	774	2	17429.90	3311.68
11273	254	42	794	1	4720.14	613.62
11274	254	40	928	6	36502.20	12045.72
11275	254	33	731	6	33041.04	4956.18
11276	254	4	354	9	54777.42	5477.76
11277	254	12	238	3	21305.22	8095.98
11278	254	24	595	1	8235.11	1482.32
11279	254	27	779	10	69693.70	21605.00
11280	254	14	340	4	31010.76	8683.00
11281	254	34	502	3	17951.37	3769.80
11282	607	5	982	8	72838.64	28407.04
11283	832	20	158	5	43686.00	13979.50
11284	254	9	454	6	29033.58	5226.06
11285	439	49	612	7	60707.99	14569.94
11286	89	43	635	5	13863.40	1940.90
11287	254	29	733	10	91047.20	20940.90
11288	254	7	866	3	8860.56	886.05
11289	100	44	695	4	39819.96	13937.00
11290	254	40	872	10	8502.60	1105.30
11291	254	22	247	6	37608.00	5265.12
11292	254	43	848	8	35494.80	8518.72
11293	33	27	456	2	10782.92	1078.30
11294	254	31	548	18	107173.80	34295.58
11295	728	12	612	1	8672.57	2081.42
11296	254	19	392	2	13061.70	4702.22
11297	254	42	68	7	54406.66	20674.50
11298	254	31	646	2	11659.74	3381.32
11299	254	1	701	10	84977.30	24643.40
11300	312	12	371	5	20596.40	5355.05
11301	254	46	339	2	14971.94	5539.62
11302	254	34	656	3	3164.64	348.12
11303	254	36	894	2	10699.24	3102.78
11304	254	44	465	16	57600.48	13248.16
11305	254	8	874	2	5719.66	1029.54
11306	254	36	554	8	32098.64	10592.56
11307	254	21	978	1	2549.40	484.39
11308	254	18	1000	10	22235.30	7115.30
11309	254	37	864	6	46391.40	11133.96
11310	254	20	222	10	86385.40	8638.50
11311	254	7	401	1	1162.61	232.52
11312	254	33	437	6	32496.96	11373.96
11313	254	48	155	1	5342.25	1388.99
11314	254	23	909	5	24527.50	6131.90
11315	254	16	382	6	13015.80	2212.68
11316	254	22	944	9	40424.58	10914.66
11317	254	31	771	4	8348.92	918.40
11318	254	11	660	10	44251.10	16372.90
11319	254	24	183	5	2167.50	563.55
11320	254	27	506	13	7142.33	2571.27
11321	254	42	76	2	3081.42	1201.76
11322	254	20	535	9	89432.28	32195.61
11323	254	33	655	6	41502.24	7470.42
11324	254	45	989	8	5831.28	1632.72
11325	254	10	509	4	28557.96	8852.96
11326	254	25	892	4	13795.40	3724.76
11327	254	36	865	1	9209.96	1565.69
11328	254	17	673	12	63025.20	18277.32
11329	254	7	788	8	29292.40	4686.80
11330	254	17	341	10	90577.90	20832.90
11331	254	46	983	10	34873.20	5579.70
11332	254	40	853	9	62696.61	16928.10
11333	254	6	899	1	6126.52	1592.90
11334	254	43	704	2	17653.40	6531.76
11335	254	41	776	2	10941.94	2954.32
11336	254	29	430	7	7618.73	1295.21
11337	254	24	696	18	124387.56	34828.56
11338	311	2	479	6	3863.04	463.56
11339	254	4	699	3	12034.77	3129.03
11340	254	27	623	13	93188.16	18637.58
11341	254	2	681	9	46101.15	6454.17
11342	303	17	367	4	645.08	167.72
11343	254	44	284	2	3412.20	409.46
11344	254	19	319	1	6271.85	2383.30
11345	254	50	708	6	38136.42	11059.56
11346	83	44	588	1	1663.63	432.54
11347	254	45	171	1	9174.19	3119.22
11348	254	42	107	7	59443.37	19021.87
11349	254	38	606	7	64608.04	24551.03
11350	254	6	886	4	4990.48	1896.40
11351	254	50	90	10	56548.00	13571.50
11352	845	35	679	7	68435.08	25320.96
11353	254	24	373	6	48954.96	5874.60
11354	254	2	31	8	33702.48	10784.80
11355	254	14	376	10	53865.20	14543.60
11356	254	20	709	9	64645.56	18747.18
11357	254	22	834	8	26837.52	10735.04
11358	147	34	733	6	54628.32	12564.54
11359	254	34	625	3	20193.18	4644.42
11360	254	8	49	10	90824.40	9990.70
11361	760	16	508	6	57637.92	11527.56
11362	254	44	355	1	9570.38	1339.85
11363	254	47	103	1	2728.39	600.25
11364	254	34	356	7	31210.76	5930.05
11365	254	21	799	1	5860.05	1640.81
11366	254	26	393	1	4807.27	1730.62
11367	254	48	460	7	23285.78	6520.01
11368	254	34	165	8	19842.80	5357.52
11369	254	14	94	7	61176.01	18352.81
11370	254	49	266	3	19819.29	6936.75
11371	254	27	890	4	5513.60	1102.72
11372	254	48	16	2	8011.60	1442.08
11373	254	18	972	6	14651.70	4981.56
11374	254	10	276	7	67314.10	24233.09
11375	254	32	825	4	4490.16	1302.16
11376	254	1	670	4	17299.32	3805.84
11377	254	21	881	10	93454.60	37381.80
11378	254	30	984	6	33957.96	4414.56
11379	254	47	836	4	28836.12	6343.96
11380	761	20	795	2	13344.20	4403.58
11381	254	50	478	8	62790.88	8162.80
11382	254	45	298	2	14387.02	2014.18
11383	254	7	245	4	32039.60	9291.48
11384	254	8	771	10	20872.30	2296.00
11385	254	34	411	3	19709.85	4139.07
11386	254	44	290	8	71014.24	15623.12
11387	254	42	475	10	57218.70	16593.40
11388	254	15	23	5	28363.20	7658.05
11389	254	24	759	10	43048.60	9040.20
11390	254	22	586	1	6670.17	867.12
11391	254	1	302	1	6522.44	2608.98
11392	524	44	314	2	14210.40	4689.44
11393	254	47	911	7	16534.14	3802.82
11394	254	2	697	1	1313.28	472.78
11395	574	45	684	2	16459.06	3127.22
11396	254	8	965	6	40488.12	8907.36
11397	254	4	841	3	22854.69	7770.60
11398	254	42	646	1	5829.87	1690.66
11399	254	12	274	16	66967.20	12723.84
11400	254	20	23	9	51053.76	13784.49
11401	254	48	555	1	2571.31	411.41
11402	254	38	327	9	12667.95	3546.99
11403	254	48	546	8	47277.36	5673.28
11404	254	43	875	4	36806.52	8833.56
11405	254	41	716	7	19171.81	6710.13
11406	744	11	187	9	13493.34	1484.28
11407	254	23	163	9	30331.71	7886.25
11408	254	48	7	8	37552.88	5632.96
11409	254	48	952	3	60.30	11.46
11410	254	10	297	5	38648.40	6570.25
11411	254	43	956	9	75043.17	21012.12
11412	254	28	144	9	67694.40	18954.45
11413	254	34	399	4	15500.00	3565.00
11414	254	7	509	3	21418.47	6639.72
11415	254	23	987	9	72779.40	24017.22
11416	254	48	702	3	26497.89	7419.42
11417	254	30	394	4	25525.56	5360.36
11418	254	41	982	1	9104.83	3550.88
11419	254	22	351	2	417.38	41.74
11420	254	44	303	5	46235.10	15719.95
11421	200	12	247	1	6268.00	877.52
11422	254	2	655	5	34585.20	6225.35
11423	254	35	927	4	31046.20	8692.92
11424	60	10	113	3	3529.44	847.08
11425	254	4	964	2	18972.42	4932.82
11426	254	44	538	10	58823.40	8235.30
11427	254	22	414	1	8303.86	2325.08
11428	254	26	35	4	11790.16	3183.36
11429	306	17	140	8	60415.04	19936.96
11430	254	21	636	7	389.62	62.37
11431	254	16	465	9	32400.27	7452.09
11432	254	9	262	2	15121.52	4536.46
11433	254	23	303	1	9247.02	3143.99
11434	254	1	716	2	5477.66	1917.18
11435	254	5	344	8	8301.36	1494.24
11436	397	43	468	2	4188.92	502.68
11437	254	8	292	2	15829.92	4590.68
11438	254	34	854	10	41657.80	14580.20
11439	229	36	449	10	86941.20	13041.20
11440	254	16	761	3	29535.93	9451.50
11441	254	36	923	7	22795.50	5698.84
11442	254	5	471	8	58801.20	15288.32
11443	254	6	692	3	11001.72	1320.21
11444	254	23	23	10	56726.40	15316.10
11445	254	5	935	9	27569.52	4411.08
11446	254	40	539	3	12802.59	2688.54
11447	254	12	368	7	29799.35	9237.83
11448	254	1	203	6	41631.18	14154.60
11449	254	11	487	8	53267.20	15980.16
11450	254	8	744	2	1717.50	395.02
11451	377	49	64	9	22177.98	7540.47
11452	254	33	265	9	12013.02	1922.04
11453	254	50	575	10	55594.90	21126.10
11454	254	9	231	3	21358.65	5126.07
11455	254	27	706	10	82269.00	8226.90
11456	34	30	161	1	7608.68	2663.04
11457	254	11	796	2	13496.84	2294.46
11458	254	38	936	4	18514.68	5924.68
11459	254	47	630	8	11401.04	3306.32
11460	254	2	461	8	55997.36	6159.68
11461	254	7	843	1	9161.66	2015.57
11462	254	43	79	9	81561.87	15496.74
11463	254	21	293	10	49349.80	9870.00
11464	254	12	60	6	16191.60	1781.10
11465	254	39	431	6	12539.22	3009.42
11466	254	33	216	2	9999.62	2799.90
11467	862	32	584	3	15044.01	4814.07
11468	254	33	343	10	96020.70	14403.10
11469	254	21	785	5	23255.15	6976.55
11470	254	9	821	4	28129.84	9564.16
11471	753	29	907	4	200.56	24.08
11472	254	15	976	16	1675.84	469.28
11473	254	31	992	11	8914.51	2674.32
11474	254	1	644	10	8556.80	2909.30
11475	254	7	829	4	32644.76	9467.00
11476	254	11	248	10	28225.20	7620.80
11477	254	19	175	8	79265.68	13475.20
11478	254	13	807	8	43030.16	15060.56
11479	254	4	999	2	1372.54	384.32
11480	254	9	798	8	56777.84	21575.60
11481	254	44	478	12	94186.32	12244.20
11482	254	27	161	11	83695.48	29293.44
11483	254	6	108	3	18565.26	2599.14
11484	254	44	436	7	47882.10	11970.49
11485	254	8	431	3	6269.61	1504.71
11486	254	24	579	6	32581.32	11729.28
11487	527	17	500	9	52046.82	10409.40
11488	254	11	114	8	75880.48	21246.56
11489	254	16	753	7	35555.59	9244.48
11490	254	31	573	1	1604.43	497.37
11491	254	4	988	10	34786.60	6609.50
11492	699	26	17	10	19022.60	2092.50
11493	538	14	908	6	35749.02	13227.12
11494	254	40	945	9	71986.41	12957.57
11495	259	1	480	5	27572.25	4687.30
11496	254	21	803	7	39482.03	5527.48
11497	254	42	903	6	46607.40	14448.30
11498	254	35	457	7	11621.68	3602.69
11499	254	25	270	6	1562.22	515.52
11500	254	47	700	10	50771.40	15231.40
11501	254	48	305	8	72008.56	21602.56
11502	254	22	856	1	1669.35	400.64
11503	254	20	360	8	13339.44	2267.68
11504	661	44	769	6	56938.38	10248.90
11505	254	5	292	3	23744.88	6886.02
11506	254	25	344	5	5188.35	933.90
11507	254	22	365	11	38965.74	12469.05
11508	254	45	702	7	61828.41	17311.98
11509	254	18	376	3	16159.56	4363.08
11510	254	20	571	8	50336.80	5537.04
11511	254	25	805	2	5623.36	1911.94
11512	254	19	793	9	59820.12	17347.86
11513	254	44	410	9	11216.61	4262.31
11514	254	37	739	2	15099.28	3623.82
11515	254	20	16	7	28040.60	5047.28
11516	254	8	116	6	13450.74	2690.16
11517	254	47	276	2	19232.60	6923.74
11518	254	22	842	5	19666.85	4523.40
11519	254	33	545	9	5191.83	1869.03
11520	254	47	550	5	23330.15	2799.60
11521	254	12	884	5	19240.90	5387.45
11522	254	34	562	2	6913.10	1590.02
11523	254	45	28	1	7710.01	1464.90
11524	254	48	23	1	5672.64	1531.61
11525	254	43	446	8	76661.92	22998.56
11526	254	24	846	4	26722.60	7749.56
11527	254	22	149	6	38373.18	5755.98
11528	598	9	950	8	46128.88	13377.36
11529	254	23	112	10	26117.50	2611.70
11530	254	46	413	1	1704.97	409.19
11531	508	10	922	9	82675.44	18188.64
11532	254	46	409	4	24964.60	3495.04
11533	50	45	91	3	29831.61	6861.27
11534	254	2	973	6	20616.12	7627.98
11535	254	18	897	2	4034.90	1573.62
11536	254	34	233	10	45391.10	15886.90
11537	254	46	212	1	5128.89	974.49
11538	254	25	801	2	4883.04	683.62
11539	254	21	673	13	68277.30	19800.43
11540	254	40	227	5	37055.25	12228.25
11541	254	42	483	3	22147.83	3543.66
11542	254	43	291	6	14418.66	5046.54
11543	254	25	544	3	26941.11	6465.87
11544	254	47	461	4	27998.68	3079.84
11545	254	15	475	3	17165.61	4978.02
11546	254	6	471	9	66151.35	17199.36
11547	254	25	594	11	79956.14	26385.48
11548	254	31	601	8	31652.32	7596.56
11549	254	35	572	10	62102.90	17388.80
11550	254	2	334	7	61252.17	14700.49
11551	254	33	465	2	7200.06	1656.02
11552	757	25	990	5	37467.55	7868.20
11553	254	45	62	8	35494.88	8163.84
11554	254	43	480	2	11028.90	1874.92
11555	254	33	305	2	18002.14	5400.64
11556	254	15	59	9	33888.96	9150.03
11557	254	49	944	10	44916.20	12127.40
11558	254	29	799	7	41020.35	11485.67
11559	254	25	632	5	1288.85	270.65
11560	254	8	337	7	48541.92	7281.26
11561	820	36	911	7	16534.14	3802.82
11562	254	20	675	10	4651.10	1674.40
11563	254	10	66	3	6430.56	2507.91
11564	254	6	425	5	14029.05	2384.95
11565	131	24	345	5	49618.00	14389.20
11566	254	28	657	8	3413.76	546.24
11567	254	48	370	9	12053.25	2169.63
11568	254	4	229	7	19411.91	5047.07
11569	254	45	571	9	56628.90	6229.17
11570	254	41	700	7	35539.98	10661.98
11571	311	2	495	9	50927.22	15787.44
11572	254	29	993	1	7201.44	1800.36
11573	254	19	205	8	1839.44	404.64
11574	254	35	324	2	11827.30	2602.00
11575	254	47	971	7	61140.31	7948.22
11576	254	28	836	8	57672.24	12687.92
11577	254	5	259	6	49759.74	4975.98
11578	254	34	289	3	17663.07	3532.62
11579	254	28	315	1	4423.17	1017.33
11580	272	46	624	7	66376.80	7965.23
11581	254	42	33	3	11863.47	3559.05
11582	254	22	12	8	78672.24	13374.32
11583	254	8	875	6	55209.78	13250.34
11584	254	31	651	9	61040.61	18312.21
11585	254	42	335	3	13655.31	1638.63
11586	254	25	89	4	23117.08	8553.32
11587	254	7	507	4	29277.48	8197.68
11588	254	21	702	5	44163.15	12365.70
11589	842	19	190	5	28344.25	7936.40
11590	254	22	750	9	3306.51	1058.04
11591	254	27	683	10	4758.30	1570.20
11592	254	37	621	4	17417.44	5921.92
11593	254	1	344	3	3113.01	560.34
11594	254	47	184	1	1787.76	697.23
11595	254	48	235	7	40002.55	8800.54
11596	254	35	412	5	40034.95	4804.20
11597	254	12	10	8	22610.00	8591.76
11598	254	14	866	8	23628.16	2362.80
11599	254	32	138	9	39582.27	4354.02
11600	254	33	879	9	44130.15	11032.56
11601	254	10	789	1	9480.91	2275.42
11602	254	50	881	7	65418.22	26167.26
11603	254	33	166	3	21492.78	8167.26
11604	254	45	291	9	21627.99	7569.81
11605	254	13	826	1	5901.23	1534.32
11606	254	45	583	4	21017.24	5044.12
11607	254	26	619	3	3141.69	534.09
11608	254	8	302	9	58701.96	23480.82
11609	254	5	122	1	7662.60	2528.66
11610	254	41	778	9	51374.25	19522.26
11611	254	16	693	9	42936.84	15457.23
11612	254	31	759	6	25829.16	5424.12
11613	753	29	67	6	41979.36	6716.70
11614	254	12	342	6	47710.86	13836.12
11615	610	32	628	7	28197.47	6767.39
11616	254	42	288	2	1987.88	636.12
11617	870	21	185	5	38607.70	7721.55
11618	254	33	873	7	21773.78	4137.00
11619	267	23	910	10	28599.20	5719.80
11620	254	27	398	3	8299.32	1825.86
11621	254	12	98	4	3883.12	1009.60
11622	254	18	630	2	2850.26	826.58
11623	254	8	285	9	26515.08	3977.28
11624	183	3	308	9	11511.54	4604.58
11625	254	41	425	9	25252.29	4292.91
11626	254	7	687	8	15313.52	3981.52
11627	254	37	464	10	5212.10	1824.20
11628	254	19	443	10	27033.30	6488.00
11629	254	39	731	6	33041.04	4956.18
11630	254	29	61	6	10501.68	4095.66
11631	254	43	290	8	71014.24	15623.12
11632	200	12	521	7	59286.08	23121.56
11633	253	24	237	3	23495.31	5403.93
11634	254	3	98	10	9707.80	2524.00
11635	254	31	446	5	47913.70	14374.10
11636	254	32	660	7	30975.77	11461.03
11637	254	33	641	1	6282.64	1947.62
11638	254	48	874	9	25738.47	4632.93
11639	254	49	608	18	93428.82	12145.68
11640	254	22	882	5	4386.00	1008.80
11641	267	23	224	2	15068.84	1808.26
11642	254	21	203	3	20815.59	7077.30
11643	254	50	499	12	88727.52	23956.44
11644	254	2	449	5	43470.60	6520.60
11645	254	50	214	5	2740.10	520.60
11646	254	18	327	4	5630.20	1576.44
11647	254	5	457	8	13281.92	4117.36
11648	688	16	784	10	90453.10	34372.20
11649	254	29	123	4	8649.76	1470.44
11650	254	33	628	8	32225.68	7734.16
11651	254	43	784	2	18090.62	6874.44
11652	254	31	150	9	74775.78	22432.77
11653	254	41	619	7	7330.61	1246.21
11654	798	2	463	6	56553.18	12441.72
11655	254	14	275	17	124124.14	39719.65
11656	254	34	605	7	38830.26	15143.80
11657	254	7	678	5	16571.95	6131.60
11658	748	39	812	8	36601.52	8418.32
11659	254	47	909	2	9811.00	2452.76
11660	254	14	537	8	55538.56	15550.80
11661	254	46	410	6	7477.74	2841.54
11662	608	45	987	2	16173.20	5337.16
11663	254	30	833	8	31767.92	9848.08
11664	254	39	92	5	28520.50	9982.15
11665	254	8	429	10	47530.20	10456.60
11666	254	2	104	9	55394.73	21603.96
11667	254	50	432	2	3176.18	730.52
11668	254	35	607	8	49026.64	10785.84
11669	254	21	401	2	2325.22	465.04
11670	254	3	344	7	7263.69	1307.46
11671	254	46	909	9	44149.50	11037.42
11672	254	23	938	7	22991.08	6667.43
11673	254	41	325	5	34815.90	5570.55
11674	293	31	645	1	195.84	68.54
11675	254	48	422	8	44011.84	7482.00
11676	64	30	446	8	76661.92	22998.56
11677	254	37	972	9	21977.55	7472.34
11678	293	29	231	3	21358.65	5126.07
11679	254	44	145	10	75363.10	27130.70
11680	254	4	71	7	26825.82	5633.39
11681	254	10	840	1	6171.73	1357.78
11682	254	46	430	6	6530.34	1110.18
11683	254	29	41	10	4281.30	1241.60
11684	254	36	272	4	11827.32	2247.20
11685	254	19	193	4	20490.68	5122.68
11686	254	4	678	7	23200.73	8584.24
11687	254	3	933	8	64438.72	23197.92
11688	254	4	839	7	64544.90	7099.96
11689	254	12	887	10	78393.40	25869.80
11690	254	45	67	8	55972.48	8955.60
11691	254	46	812	8	36601.52	8418.32
11692	254	6	698	7	23005.78	2530.64
11693	254	38	741	7	48536.11	12619.39
11694	254	26	310	9	11795.76	1179.54
11695	254	38	63	7	54174.26	8667.89
11696	254	2	28	6	46260.06	8789.40
11697	254	9	964	10	94862.10	24664.10
11698	12	22	387	2	10803.06	3348.94
11699	254	31	975	1	1249.52	162.44
11700	691	29	465	2	7200.06	1656.02
11701	254	37	382	8	17354.40	2950.24
11702	254	11	16	9	36052.20	6489.36
11703	254	10	44	8	51316.16	10776.40
11704	254	2	712	7	28615.72	5436.97
11705	254	26	140	14	105726.32	34889.68
11706	254	3	659	1	5822.99	1281.06
11707	254	1	781	4	13648.80	1774.36
11708	254	24	714	9	78578.37	29859.75
11709	254	5	269	5	42534.55	8506.90
11710	254	42	935	2	6126.56	980.24
11711	254	27	866	9	26581.68	2658.15
11712	565	48	840	4	24686.92	5431.12
11713	254	5	202	9	79075.35	13442.85
11714	254	23	499	2	14787.92	3992.74
11715	254	43	181	4	14911.20	4771.60
11716	254	2	602	9	30237.84	5745.15
11717	254	37	385	8	45849.04	12379.28
11718	254	49	831	1	412.09	82.42
11719	254	6	812	10	45751.90	10522.90
11720	254	33	92	8	45632.80	15971.44
11721	254	29	437	10	54161.60	18956.60
11722	254	47	765	4	118.44	26.04
11723	254	36	665	11	8848.07	1858.12
11724	254	29	24	2	2603.68	546.78
11725	254	32	949	3	20250.36	6682.62
11726	254	11	620	3	11366.10	4091.79
11727	818	6	101	7	59475.15	16058.28
11728	254	37	652	9	38173.32	15269.31
11729	254	43	911	5	11810.10	2716.30
11730	254	31	97	3	28970.70	4925.01
11731	254	32	893	9	56018.07	17925.75
11732	254	3	468	3	6283.38	754.02
11733	254	40	14	7	53777.36	12906.60
11734	254	44	510	5	27767.15	3609.75
11735	254	41	670	8	34598.64	7611.68
11736	254	32	649	4	34694.00	12836.76
11737	254	19	683	7	3330.81	1099.14
11738	254	36	244	9	55295.64	21565.26
11739	254	49	870	15	66064.80	24444.00
11740	254	20	252	6	46326.48	5559.18
11741	254	39	475	8	45774.96	13274.72
11742	254	33	674	3	19848.00	7145.28
11743	254	30	815	8	52610.48	8943.76
11744	254	50	995	3	28873.74	7795.92
11745	254	45	411	16	105119.20	22075.04
11746	182	11	628	2	8056.42	1933.54
11747	254	7	872	5	4251.30	552.65
11748	254	28	162	10	89537.20	16116.70
11749	254	36	982	9	81943.47	31957.92
11750	254	9	430	1	1088.39	185.03
11751	254	43	99	3	14173.98	5669.58
11752	254	9	471	7	51451.05	13377.28
11753	816	40	53	10	97749.90	10752.50
11754	254	45	567	4	29339.60	3227.36
11755	254	17	243	1	1049.90	304.47
11756	254	37	622	7	27217.75	2721.74
11757	254	22	46	8	79362.64	17459.76
11758	254	20	608	7	36333.43	4723.32
11759	254	36	634	3	20774.13	5193.54
11760	254	18	850	5	43178.00	8635.60
11761	254	19	30	2	13088.08	1963.22
11762	254	1	75	10	39880.70	3988.10
11763	254	45	805	7	19681.76	6691.79
11764	254	48	743	7	31273.83	10007.62
11765	254	33	835	5	12271.20	3190.50
11766	254	32	760	10	38469.00	11925.40
11767	254	12	479	6	3863.04	463.56
11768	254	34	416	6	12482.58	4743.36
11769	254	10	167	8	59728.88	7167.44
11770	254	11	350	10	70328.70	27428.20
11771	254	49	277	5	44212.70	4863.40
11772	254	38	296	3	18416.61	4419.99
11773	254	38	889	9	39719.43	9135.45
11774	254	25	609	6	54558.54	6547.02
11775	254	15	566	2	6510.70	1953.22
11776	254	27	356	7	31210.76	5930.05
11777	254	12	76	4	6162.84	2403.52
11778	254	30	684	4	32918.12	6254.44
11779	254	22	76	3	4622.13	1802.64
11780	254	1	872	3	2550.78	331.59
11781	254	35	300	4	31607.28	10114.32
11782	254	33	907	10	501.40	60.20
11783	254	32	696	2	13820.84	3869.84
11784	254	10	611	7	48444.55	16955.61
11785	254	45	633	9	61954.83	23542.83
11786	254	29	782	7	9937.55	1291.85
11787	254	37	222	2	17277.08	1727.70
11788	254	3	139	7	63332.36	13299.79
11789	254	13	227	3	22233.15	7336.95
11790	254	20	911	6	14172.12	3259.56
11791	254	28	822	10	53622.40	13941.80
11792	254	29	914	9	47996.55	18718.65
11793	254	5	603	8	20931.12	6279.36
11794	731	1	799	4	23440.20	6563.24
11795	254	49	974	6	51428.88	17485.80
11796	50	45	625	10	67310.60	15481.40
11797	254	40	926	4	21214.24	5940.00
11798	254	19	28	4	30840.04	5859.60
11799	254	39	397	8	43693.44	4806.24
11800	254	49	857	9	30964.23	3096.45
11801	254	15	211	7	12185.25	4143.02
11802	254	19	294	6	35343.48	6361.80
11803	254	9	726	13	56352.27	18596.24
11804	791	7	272	4	11827.32	2247.20
11805	788	13	997	9	41187.78	6178.14
11806	254	43	942	12	21488.52	3223.32
11807	254	32	815	8	52610.48	8943.76
11808	254	37	395	2	15279.86	2444.78
11809	254	12	950	2	11532.22	3344.34
11810	254	22	593	2	970.70	359.16
11811	570	44	637	8	27351.60	10667.12
11812	254	38	652	7	29690.36	11876.13
11813	818	6	115	3	13472.19	2829.15
11814	17	40	517	2	13912.50	3478.12
11815	254	37	825	8	8980.32	2604.32
11816	254	23	990	2	14987.02	3147.28
11817	254	22	695	5	49774.95	17421.25
11818	788	13	837	10	93380.20	28014.10
11819	254	40	630	6	8550.78	2479.74
11820	177	14	935	9	27569.52	4411.08
11821	257	8	458	7	49362.11	14315.00
11822	254	45	656	6	6329.28	696.24
11823	254	7	220	6	28345.86	5952.66
11824	254	5	750	4	1469.56	470.24
11825	254	42	491	10	69990.60	10498.60
11826	254	42	837	9	84042.18	25212.69
11827	254	26	261	2	4579.34	1648.56
11828	254	41	985	10	75314.60	7531.50
11829	254	7	976	8	837.92	234.64
11830	254	7	964	9	85375.89	22197.69
11831	254	49	285	5	14730.60	2209.60
11832	254	35	731	1	5506.84	826.03
11833	89	43	604	8	23548.72	4474.24
11834	254	47	943	8	49868.00	19448.56
11835	254	34	157	2	2867.56	745.56
11836	669	19	788	1	3661.55	585.85
11837	275	29	921	8	35280.80	12348.24
11838	254	8	903	4	31071.60	9632.20
11839	254	25	520	7	3782.87	1437.52
11840	254	37	932	9	28807.02	2880.72
11841	254	9	47	1	4147.63	1659.05
11842	254	2	746	8	36368.88	13456.48
11843	254	14	673	9	47268.90	13707.99
11844	254	32	521	4	33877.76	13212.32
11845	254	47	388	1	5579.98	1450.79
11846	328	45	546	1	5909.67	709.16
11847	254	9	539	16	68280.48	14338.88
11848	254	49	144	15	112824.00	31590.75
11849	254	50	218	10	76275.50	9153.10
11850	254	27	648	2	13562.66	3661.92
11851	254	38	481	10	99305.20	19861.00
11852	254	22	92	9	51336.90	17967.87
11853	254	5	287	6	17435.40	6451.08
11854	254	7	497	3	15702.00	5338.68
11855	254	42	390	3	4912.41	786.00
11856	254	27	211	10	17407.50	5918.60
11857	294	20	513	9	63227.25	16439.13
11858	254	36	861	6	3182.64	1050.30
11859	740	35	914	4	21331.80	8319.40
11860	83	44	935	8	24506.24	3920.96
11861	254	31	995	5	48122.90	12993.20
11862	241	12	323	2	4175.46	1252.64
11863	254	30	74	3	1065.15	244.98
11864	254	35	710	3	25189.89	10075.95
11865	254	43	374	5	8279.60	1738.70
11866	254	50	507	7	51235.59	14345.94
11867	254	27	318	7	25846.80	5169.36
11868	171	36	647	3	20934.81	2302.83
11869	254	2	130	10	82328.30	12349.20
11870	254	34	498	8	56656.24	20962.80
11871	254	2	884	2	7696.36	2154.98
11872	254	34	689	3	13620.09	4358.43
11873	254	7	514	3	1492.47	194.01
11874	163	2	756	4	15843.20	5228.24
11875	254	44	99	10	47246.60	18898.60
11876	254	25	209	10	16341.00	5882.80
11877	254	19	473	8	66545.04	14639.92
11878	254	10	834	7	23482.83	9393.16
11879	254	1	147	1	8160.39	1795.29
11880	254	14	900	4	5966.76	2207.72
11881	254	26	45	8	70835.76	9917.04
11882	254	12	939	2	4371.18	1748.48
11883	173	37	848	4	17747.40	4259.36
11884	254	44	521	6	50816.64	19818.48
11885	64	30	971	2	17468.66	2270.92
11886	254	22	927	1	7761.55	2173.23
11887	254	7	908	9	53623.53	19840.68
11888	156	46	932	1	3200.78	320.08
11889	581	32	535	1	9936.92	3577.29
11890	254	8	536	1	7070.41	1909.01
11891	254	27	550	5	23330.15	2799.60
11892	254	15	326	7	53992.75	9718.73
11893	254	33	524	1	6699.10	1540.79
11894	254	4	772	4	19662.04	5505.36
11895	254	50	450	7	58842.91	15299.13
11896	254	9	223	2	17216.76	1721.68
11897	254	12	390	3	4912.41	786.00
11898	254	45	597	9	70444.80	19724.58
11899	254	31	527	8	30002.24	6900.48
11900	254	11	709	6	43097.04	12498.12
11901	112	49	768	10	99483.90	32829.70
11902	254	32	80	1	4809.68	1875.78
11903	254	7	864	6	46391.40	11133.96
11904	254	2	441	2	13508.34	3377.08
11905	254	21	935	10	30632.80	4901.20
11906	254	45	447	4	8241.64	2637.32
11907	254	41	352	9	86080.32	18076.86
11908	254	38	719	1	3555.25	853.26
11909	305	44	507	5	36596.85	10247.10
11910	254	48	585	5	26870.40	2955.75
11911	322	15	123	2	4324.88	735.22
11912	254	28	77	2	13735.36	3159.14
11913	254	19	569	4	16583.20	3482.48
11914	254	28	314	3	21315.60	7034.16
11915	254	25	977	9	76615.56	16855.38
11916	254	48	434	6	50586.66	9611.46
11917	254	26	741	6	41602.38	10816.62
11918	254	1	757	10	10861.10	1846.40
11919	254	1	937	9	4373.91	568.62
11920	254	20	692	2	7334.48	880.14
11921	254	25	152	7	17021.06	2723.35
11922	254	27	573	9	14439.87	4476.33
11923	254	46	76	6	9244.26	3605.28
11924	254	13	124	3	14243.82	4273.14
11925	254	8	867	4	17702.00	6195.68
11926	254	20	920	9	3508.65	1157.85
11927	254	48	636	5	278.30	44.55
11928	254	22	201	9	36384.30	6549.21
11929	254	23	831	10	4120.90	824.20
11930	254	19	352	9	86080.32	18076.86
11931	254	45	931	10	26872.70	4299.60
11932	254	26	713	4	32131.08	8354.08
11933	254	23	608	1	5190.49	674.76
11934	254	17	271	9	53780.67	10218.33
11935	254	25	419	7	22238.51	8005.83
11936	254	25	369	4	9220.00	1751.80
11937	254	38	565	6	11151.48	3903.00
11938	254	10	836	10	72090.30	15859.90
11939	254	49	631	1	2653.69	291.91
11940	254	47	759	7	30134.02	6328.14
11941	254	39	965	10	67480.20	14845.60
11942	254	17	56	4	30867.52	12347.00
11943	254	11	528	1	9595.48	3166.51
11944	254	31	363	7	54429.34	6531.49
11945	541	16	300	4	31607.28	10114.32
11946	254	8	167	18	134389.98	16126.74
11947	254	12	442	7	41714.12	9594.27
11948	254	42	857	8	27523.76	2752.40
11949	61	8	355	5	47851.90	6699.25
11950	254	43	936	10	46286.70	14811.70
11951	254	42	636	9	500.94	80.19
11952	254	46	365	8	28338.72	9068.40
11953	254	19	637	2	6837.90	2666.78
11954	405	37	860	5	46952.55	14085.75
11955	254	32	768	9	89535.51	29546.73
11956	254	8	440	9	69128.19	7604.10
11957	254	2	134	6	29008.62	4931.46
11958	254	10	583	4	21017.24	5044.12
11959	254	35	957	6	30887.46	4324.26
11960	254	10	53	2	19549.98	2150.50
11961	254	39	132	3	9145.29	3017.94
11962	254	27	426	8	35543.20	7108.64
11963	254	46	866	2	5907.04	590.70
11964	254	47	174	10	63765.30	17854.30
11965	254	29	357	3	28219.56	8748.06
11966	630	11	577	2	15620.16	2655.42
11967	254	17	600	6	14207.94	4688.64
11968	254	24	887	5	39196.70	12934.90
11969	254	8	293	2	9869.96	1974.00
11970	254	12	78	9	58445.10	8182.35
11971	254	27	310	5	6553.20	655.30
11972	254	12	514	5	2487.45	323.35
11973	254	40	534	4	35944.32	6110.52
11974	22	47	747	1	138.26	22.12
11975	254	26	545	2	1153.74	415.34
11976	254	47	125	1	3524.51	1268.82
11977	254	37	892	2	6897.70	1862.38
11978	254	2	845	10	88818.20	18651.80
11979	254	38	142	2	9081.06	2361.08
11980	254	7	121	4	27458.68	3020.44
11981	254	1	910	9	25739.28	5147.82
11982	254	45	784	7	63317.17	24060.54
11983	254	6	375	5	36693.75	14677.50
11984	560	6	338	9	27995.31	11198.16
11985	254	12	761	7	68917.17	22053.50
11986	220	3	531	6	36423.36	8377.38
11987	254	32	74	7	2485.35	571.62
11988	94	8	149	3	19186.59	2877.99
11989	254	7	797	7	47773.67	10510.22
11990	254	43	381	4	4674.04	1355.48
11991	254	38	503	8	29854.08	6866.40
11992	254	12	973	1	3436.02	1271.33
11993	254	2	23	2	11345.28	3063.22
11994	254	9	451	4	29931.80	5687.04
11995	254	25	679	6	58658.64	21703.68
11996	254	29	191	4	12217.68	2077.00
11997	254	20	659	9	52406.91	11529.54
11998	254	39	546	4	23638.68	2836.64
11999	254	39	799	6	35160.30	9844.86
12000	254	30	624	8	75859.20	9103.12
12001	254	50	117	13	47019.83	18807.88
12002	254	41	128	8	25199.68	3779.92
12003	254	10	195	4	39725.20	4369.76
12004	254	12	997	1	4576.42	686.46
12005	254	30	491	9	62991.54	9448.74
12006	254	40	811	1	9811.77	3924.71
12007	254	29	335	8	36414.16	4369.68
12008	254	48	325	4	27852.72	4456.44
12009	254	39	524	11	73690.10	16948.69
12010	254	34	349	14	68657.26	19910.66
12011	254	32	818	12	103396.08	28950.96
12012	254	13	409	3	18723.45	2621.28
12013	254	1	502	2	11967.58	2513.20
12014	254	27	91	9	89494.83	20583.81
12015	254	25	667	4	21413.36	8565.36
12016	254	39	42	5	26307.90	8681.60
12017	254	7	493	5	12494.35	2373.95
12018	254	46	31	1	4212.81	1348.10
12019	254	28	781	4	13648.80	1774.36
12020	254	14	574	10	84666.50	21166.60
12021	696	7	153	7	3581.69	1396.85
12022	46	46	419	3	9530.79	3431.07
12023	254	19	404	14	125039.04	35010.92
12024	254	28	160	6	3145.92	1006.68
12025	254	50	164	1	2571.51	565.73
12026	112	49	121	1	6864.67	755.11
12027	254	42	231	3	21358.65	5126.07
12028	254	46	137	7	44704.24	14305.34
12029	254	21	898	7	35181.23	13368.88
12030	254	36	803	3	16920.87	2368.92
12031	254	6	951	4	11375.48	3412.64
12032	254	5	90	6	33928.80	8142.90
12033	254	35	983	7	24411.24	3905.79
12034	254	48	709	5	35914.20	10415.10
12035	254	17	504	2	1433.38	272.34
12036	254	19	825	1	1122.54	325.54
12037	254	46	963	4	25504.44	4845.84
12038	254	21	972	6	14651.70	4981.56
12039	254	33	177	7	40175.66	5624.57
12040	254	50	527	8	30002.24	6900.48
12041	254	5	882	1	877.20	201.76
12042	254	31	612	8	69380.56	16651.36
12043	254	25	243	8	8399.20	2435.76
12044	615	12	375	6	44032.50	17613.00
12045	254	22	884	7	26937.26	7542.43
12046	3	17	16	5	20029.00	3605.20
12047	254	46	790	15	63516.30	20325.15
12048	254	35	807	6	32272.62	11295.42
12049	312	12	834	2	6709.38	2683.76
12050	34	30	22	2	5599.96	560.00
12051	254	3	526	5	3684.60	479.00
12052	182	11	737	3	29324.25	3225.66
12053	254	16	746	4	18184.44	6728.24
12054	254	40	558	10	99475.20	33821.60
12055	254	39	51	2	10961.14	1424.94
12056	254	1	635	9	24954.12	3493.62
12057	254	50	719	10	35552.50	8532.60
12058	254	32	553	3	19594.35	6858.03
12059	254	18	182	1	6354.32	1969.84
12060	254	41	201	6	24256.20	4366.14
12061	254	40	284	3	5118.30	614.19
12062	254	22	676	4	1860.40	558.12
12063	254	34	200	14	110450.48	25403.56
12064	254	1	638	10	86813.00	32120.80
12065	254	7	360	9	15006.87	2551.14
12066	254	32	556	6	37335.60	6720.42
12067	254	28	684	13	106983.89	20326.93
12068	254	7	271	8	47805.04	9082.96
12069	254	11	179	8	2614.24	732.00
12070	254	44	648	18	122063.94	32957.28
12071	254	27	750	2	734.78	235.12
12072	254	6	137	4	25545.28	8174.48
12073	254	46	82	3	21508.95	5162.16
12074	254	46	557	5	13193.25	3694.10
12075	325	36	466	7	50577.10	15678.88
12076	254	14	965	7	47236.14	10391.92
12077	254	41	94	6	52436.58	15730.98
12078	277	39	838	4	20511.40	4512.52
12079	254	2	517	6	41737.50	10434.36
12080	254	50	59	2	7530.88	2033.34
12081	254	28	20	1	2693.59	538.72
12082	254	17	470	1	7038.94	1478.18
12083	254	46	869	6	56618.94	19250.46
12084	254	47	588	8	13309.04	3460.32
12085	254	11	298	7	50354.57	7049.63
12086	254	6	725	3	16899.27	1858.92
12087	254	26	102	8	38798.32	6207.76
12088	254	16	137	10	63863.20	20436.20
12089	254	25	658	3	25517.49	6889.71
12090	254	15	60	3	8095.80	890.55
12091	62	34	88	5	8753.05	2538.40
12092	254	25	341	9	81520.11	18749.61
12093	254	15	76	8	12325.68	4807.04
12094	254	26	603	1	2616.39	784.92
12095	254	25	355	8	76563.04	10718.80
12096	254	38	880	10	62845.70	8169.90
12097	254	9	268	6	41281.14	4128.12
12098	254	9	583	9	47288.79	11349.27
12099	432	3	762	5	26808.45	2948.95
12100	254	42	165	7	17362.45	4687.83
12101	254	2	422	3	16504.44	2805.75
12102	254	15	761	16	157524.96	50408.00
12103	254	1	483	1	7382.61	1181.22
12104	254	35	175	2	19816.42	3368.80
12105	254	13	366	5	1064.35	106.45
12106	254	49	877	8	23386.56	3975.68
12107	819	44	187	2	2998.52	329.84
12108	254	14	495	10	56585.80	17541.60
12109	254	1	974	7	60000.36	20400.10
12110	254	23	446	8	76661.92	22998.56
12111	802	45	649	2	17347.00	6418.38
12112	254	50	385	1	5731.13	1547.41
12113	254	12	254	9	16235.10	6494.04
12114	254	17	766	1	1533.82	444.81
12115	254	45	945	5	39992.45	7198.65
12116	254	1	730	10	85994.50	9459.40
12117	254	42	787	1	152.03	27.37
12118	254	30	340	5	38763.45	10853.75
12119	254	1	273	4	14530.64	2760.84
12120	254	6	439	10	41983.10	5457.80
12121	254	8	465	10	36000.30	8280.10
12122	254	5	82	10	71696.50	17207.20
12123	254	20	560	3	27878.64	9757.53
12124	254	34	755	4	33916.28	6444.08
12125	254	43	964	5	47431.05	12332.05
12126	254	4	43	5	48261.55	8204.45
12127	254	27	206	8	64499.52	10319.92
12128	254	14	498	5	35410.15	13101.75
12129	254	17	278	11	90313.52	27094.10
12130	254	48	123	2	4324.88	735.22
12131	254	11	424	4	25025.24	9509.60
12132	254	27	422	2	11002.96	1870.50
12133	254	14	132	7	21339.01	7041.86
12134	254	45	602	9	30237.84	5745.15
12135	254	6	530	9	36109.17	5777.46
12136	254	43	454	8	38711.44	6968.08
12137	254	26	688	6	53491.68	6418.98
12138	254	4	894	7	37447.34	10859.73
12139	254	18	655	1	6917.04	1245.07
12140	693	3	637	4	13675.80	5333.56
12141	254	5	426	3	13328.70	2665.74
12142	254	23	139	2	18094.96	3799.94
12143	254	39	56	4	30867.52	12347.00
12144	254	18	596	9	38223.54	5733.54
12145	254	21	449	4	34776.48	5216.48
12146	254	37	970	2	436.32	130.90
12147	254	7	580	7	39717.58	5957.63
12148	254	49	326	7	53992.75	9718.73
12149	254	6	662	3	7611.24	1522.26
12150	254	6	340	1	7752.69	2170.75
12151	254	33	108	3	18565.26	2599.14
12152	254	44	867	7	30978.50	10842.44
12153	254	39	866	7	20674.64	2067.45
12154	254	47	265	9	12013.02	1922.04
12155	254	10	880	7	43991.99	5718.93
12156	254	26	423	3	26867.49	4836.15
12157	150	30	742	6	43951.08	14943.36
12158	501	46	394	10	63813.90	13400.90
12159	254	9	997	6	27458.52	4118.76
12160	254	35	117	9	32552.19	13020.84
12161	254	15	530	7	28084.91	4493.58
12162	734	18	916	4	11235.56	1910.04
12163	254	21	749	8	13467.84	3636.32
12164	254	13	692	10	36672.40	4400.70
12165	254	7	123	3	6487.32	1102.83
12166	254	45	35	1	2947.54	795.84
12167	254	48	382	4	8677.20	1475.12
12168	254	14	955	10	10220.50	3679.40
12169	254	19	886	1	1247.62	474.10
12170	254	7	325	8	55705.44	8912.88
12171	254	34	164	3	7714.53	1697.19
12172	254	49	150	10	83084.20	24925.30
12173	254	46	783	4	34160.56	11614.60
12174	601	50	284	6	10236.60	1228.38
12175	254	9	567	2	14669.80	1613.68
12176	254	46	443	2	5406.66	1297.60
12177	254	9	973	10	34360.20	12713.30
12178	254	23	698	4	13146.16	1446.08
12179	254	5	607	9	55154.97	12134.07
12180	254	41	573	2	3208.86	994.74
12181	521	7	952	8	160.80	30.56
12182	254	2	889	5	22066.35	5075.25
12183	254	25	691	10	84680.70	27097.80
12184	254	4	275	10	73014.20	23364.50
12185	254	11	28	3	23130.03	4394.70
12186	254	29	31	2	8425.62	2696.20
12187	254	39	889	7	30892.89	7105.35
12188	254	10	645	3	587.52	205.62
12189	254	17	930	6	56029.44	14567.64
12190	254	32	323	4	8350.92	2505.28
12191	254	44	981	5	8855.30	2125.25
12192	254	39	968	1	3747.44	974.33
12193	254	26	316	8	30303.04	10909.12
12194	708	25	726	6	26008.74	8582.88
12195	254	47	93	6	30107.64	9634.44
12196	254	1	623	9	64514.88	12902.94
12197	254	7	326	8	61706.00	11107.12
12198	254	25	893	8	49793.84	15934.00
12199	254	31	450	17	142904.21	37155.03
12200	254	31	364	5	31319.45	8143.05
12201	254	25	585	9	48366.72	5320.35
12202	254	34	934	3	246.78	34.56
12203	254	31	321	1	5813.92	1395.34
12204	254	22	64	6	14785.32	5026.98
12205	254	46	522	6	49289.28	12815.22
12206	254	8	602	10	33597.60	6383.50
12207	254	36	114	4	37940.24	10623.28
12208	320	20	448	10	45190.30	10845.70
12209	254	43	977	4	34051.36	7491.28
12210	254	38	824	7	56492.87	18642.68
12211	254	36	137	1	6386.32	2043.62
12212	254	25	875	3	27604.89	6625.17
12213	254	49	470	10	70389.40	14781.80
12214	254	3	166	5	35821.30	13612.10
12215	254	3	216	6	29998.86	8399.70
12216	254	32	67	8	55972.48	8955.60
12217	254	33	72	5	39008.30	6241.35
12218	254	30	456	3	16174.38	1617.45
12219	254	27	947	7	23615.69	3778.53
12220	254	42	969	10	24487.60	2938.50
12221	254	46	287	5	14529.50	5375.90
12222	254	27	908	5	29790.85	11022.60
12223	254	48	738	10	23167.70	5096.90
12224	254	17	767	14	90357.96	30721.74
12225	7	30	219	6	54897.42	21409.98
12226	254	35	33	8	31635.92	9490.80
12227	254	43	15	2	10561.96	2429.26
12228	254	2	849	5	19400.55	7566.20
12229	254	5	480	2	11028.90	1874.92
12230	254	41	834	2	6709.38	2683.76
12231	254	35	893	1	6224.23	1991.75
12232	254	1	432	3	4764.27	1095.78
12233	254	32	642	6	28927.50	9546.06
12234	254	7	730	4	34397.80	3783.76
12235	254	34	318	1	3692.40	738.48
12236	254	9	532	5	44784.85	5374.20
12237	254	32	866	5	14767.60	1476.75
12238	254	17	334	6	52501.86	12600.42
12239	254	38	763	17	64385.63	18671.78
12240	254	47	284	7	11942.70	1433.11
12241	254	48	247	3	18804.00	2632.56
12242	254	11	354	6	36518.28	3651.84
12243	254	22	835	5	12271.20	3190.50
12244	254	40	613	3	18774.72	2628.45
12245	254	44	356	6	26752.08	5082.90
12246	254	28	528	4	38381.92	12666.04
12247	254	31	898	8	40207.12	15278.72
12248	254	11	251	2	11396.66	3532.96
12249	254	46	415	9	58729.59	7047.54
12250	254	24	946	9	79425.00	27004.50
12251	254	14	625	9	60579.54	13933.26
12252	254	38	817	4	17032.56	5450.40
12253	254	4	13	5	41235.95	6185.40
12254	254	13	74	4	1420.20	326.64
12255	834	41	255	4	2044.08	776.76
12256	254	26	571	5	31460.50	3460.65
12257	147	34	966	8	33031.28	4294.08
12258	254	1	536	5	35352.05	9545.05
12259	254	45	190	6	34013.10	9523.68
12260	254	46	450	17	142904.21	37155.03
12261	254	20	484	4	36184.16	9407.88
12262	254	47	593	4	1941.40	718.32
12263	254	36	709	5	35914.20	10415.10
12264	792	3	641	3	18847.92	5842.86
12265	254	23	764	8	60629.52	13338.48
12266	254	11	88	10	17506.10	5076.80
12267	254	1	411	6	39419.70	8278.14
12268	254	7	171	8	73393.52	24953.76
12269	254	37	711	4	13548.20	2032.24
12270	254	29	754	6	201.66	54.42
12271	254	14	514	3	1492.47	194.01
12272	254	19	308	3	3837.18	1534.86
12273	254	38	616	9	9496.71	3798.72
12274	254	26	70	6	13615.68	2450.82
12275	254	28	82	10	71696.50	17207.20
12276	254	46	155	4	21369.00	5555.96
12277	193	20	947	10	33736.70	5397.90
12278	405	37	300	1	7901.82	2528.58
12279	254	33	782	6	8517.90	1107.30
12280	254	31	932	7	22405.46	2240.56
12281	254	4	906	6	47421.36	14226.42
12282	418	4	312	2	19498.74	5849.62
12283	254	29	847	2	4974.26	1392.80
12284	844	12	642	1	4821.25	1591.01
12285	254	21	556	4	24890.40	4480.28
12286	254	1	830	9	33295.23	3329.55
12287	254	11	93	16	80287.04	25691.84
12288	254	44	170	8	74260.48	28218.96
12289	254	43	919	3	27297.93	3821.70
12290	254	22	969	10	24487.60	2938.50
12291	254	12	346	4	16031.32	4328.44
12292	254	12	834	1	3354.69	1341.88
12293	254	12	170	6	55695.36	21164.22
12294	254	37	50	10	19780.90	5143.00
12295	254	28	977	9	76615.56	16855.38
12296	254	23	489	3	21028.11	4836.48
12297	254	15	502	3	17951.37	3769.80
12298	254	49	103	5	13641.95	3001.25
12299	254	2	790	1	4234.42	1355.01
12300	254	23	587	2	297.30	86.22
12301	250	32	309	3	4783.65	956.73
12302	254	48	86	3	21726.09	2389.86
12303	254	25	423	5	44779.15	8060.25
12304	254	37	482	5	16804.20	3696.90
12305	254	33	154	3	17290.50	3112.29
12306	254	16	429	4	19012.08	4182.64
12307	254	36	349	1	4904.09	1422.19
12308	254	13	249	2	16332.70	2123.26
12309	744	11	687	8	15313.52	3981.52
12310	254	12	647	9	62804.43	6908.49
12311	254	13	809	6	25845.36	8787.42
12312	254	50	387	5	27007.65	8372.35
12313	254	19	23	10	56726.40	15316.10
12314	254	20	723	4	21201.64	4240.32
12315	254	48	630	3	4275.39	1239.87
12316	254	18	33	10	39544.90	11863.50
12317	254	5	434	4	33724.44	6407.64
12318	254	46	128	10	31499.60	4724.90
12319	254	7	122	10	76626.00	25286.60
12320	254	21	821	15	105486.90	35865.60
12321	254	2	192	4	12221.16	3299.72
12322	254	23	812	2	9150.38	2104.58
12323	254	19	851	4	17217.64	2410.48
12324	254	7	833	2	7941.98	2462.02
12325	254	4	585	4	21496.32	2364.60
12326	254	32	366	5	1064.35	106.45
12327	254	15	887	3	23518.02	7760.94
12328	254	25	465	9	32400.27	7452.09
12329	254	14	105	6	21187.62	6568.14
12330	254	35	55	10	86460.00	10375.20
12331	254	38	985	5	37657.30	3765.75
12332	254	6	1	9	51632.46	17038.71
12333	254	18	616	3	3165.57	1266.24
12334	254	25	829	4	32644.76	9467.00
12335	254	44	192	6	18331.74	4949.58
12336	380	45	377	4	8393.12	2098.28
12337	254	37	579	17	92313.74	33232.96
12338	254	15	394	12	76576.68	16081.08
12339	254	37	430	2	2176.78	370.06
12340	812	11	439	8	33586.48	4366.24
12341	254	40	578	3	6715.44	805.86
12342	254	41	139	6	54284.88	11399.82
12343	254	19	166	8	57314.08	21779.36
12344	254	34	720	13	41014.35	14354.99
12345	254	19	323	5	10438.65	3131.60
12346	262	31	511	7	10757.04	3442.25
12347	399	47	350	5	35164.35	13714.10
12348	254	20	521	1	8469.44	3303.08
12349	254	42	804	3	13595.55	5166.30
12350	815	44	648	5	33906.65	9154.80
12351	254	42	237	4	31327.08	7205.24
12352	254	44	105	7	24718.89	7662.83
12353	254	37	228	7	50697.01	18757.90
12354	254	48	797	10	68248.10	15014.60
12355	254	43	891	8	62197.52	9951.60
12356	630	11	936	5	23143.35	7405.85
12357	254	40	745	9	73399.77	12477.96
12358	254	48	612	3	26017.71	6244.26
12359	325	6	612	2	17345.14	4162.84
12360	107	8	766	10	15338.20	4448.10
12361	254	1	490	4	19203.88	2688.56
12362	254	27	843	3	27484.98	6046.71
12363	254	7	259	3	24879.87	2487.99
12364	254	38	362	10	94214.50	28264.30
12365	254	14	639	2	17306.26	5884.12
12366	624	34	329	3	26375.07	8176.26
12367	254	13	404	6	53588.16	15004.68
12368	254	3	743	7	31273.83	10007.62
12369	254	27	402	7	27180.79	4077.15
12370	254	30	749	10	16834.80	4545.40
12371	254	9	718	3	25888.77	5954.43
12372	339	18	999	9	6176.43	1729.44
12373	254	36	755	7	59353.49	11277.14
12374	753	29	620	8	30309.60	10911.44
12375	254	49	657	7	2987.04	477.96
12376	254	25	308	10	12790.60	5116.20
12377	254	34	966	9	37160.19	4830.84
12378	254	3	714	1	8730.93	3317.75
12379	254	28	870	1	4404.32	1629.60
12380	254	8	769	9	85407.57	15373.35
12381	254	19	196	10	26144.70	8366.30
12382	254	2	789	2	18961.82	4550.84
12383	144	18	280	9	73203.93	29281.59
12384	657	20	633	6	41303.22	15695.22
12385	663	38	892	3	10346.55	2793.57
12386	254	5	432	9	14292.81	3287.34
12387	254	38	627	14	82115.88	12317.34
12388	254	19	405	10	54954.40	17035.90
12389	529	31	271	5	29878.15	5676.85
12390	254	20	141	3	18209.01	2913.45
12391	254	16	995	8	76996.64	20789.12
12392	254	4	236	8	44558.64	12476.40
12393	254	8	150	8	66467.36	19940.24
12394	254	31	349	2	9808.18	2844.38
12395	254	49	75	8	31904.56	3190.48
12396	254	18	88	2	3501.22	1015.36
12397	254	26	166	5	35821.30	13612.10
12398	254	17	340	10	77526.90	21707.50
12399	326	24	87	3	17659.20	2119.11
12400	254	1	468	5	10472.30	1256.70
12401	254	43	804	7	31722.95	12054.70
12402	254	28	40	9	40051.08	8811.27
12403	254	11	1	6	34421.64	11359.14
12404	254	38	340	6	46516.14	13024.50
12405	254	48	773	9	11339.64	2834.91
12406	254	2	499	8	59151.68	15970.96
12407	254	25	862	2	11906.16	2857.48
12408	254	7	628	4	16112.84	3867.08
12409	254	37	866	14	41349.28	4134.90
12410	254	2	875	5	46008.15	11041.95
12411	254	30	855	6	11890.98	3210.54
12412	254	16	613	9	56324.16	7885.35
12413	254	26	230	8	48894.32	6356.24
12414	254	32	901	9	15116.04	2872.08
12415	254	46	84	7	13429.15	1477.21
12416	254	34	997	7	32034.94	4805.22
12417	254	13	233	8	36312.88	12709.52
12418	254	36	38	3	14679.06	3963.36
12419	36	26	533	9	29486.97	11205.09
12420	254	34	925	6	29932.26	4789.14
12421	254	33	404	8	71450.88	20006.24
12422	254	38	933	4	32219.36	11598.96
12423	254	19	785	7	32557.21	9767.17
12424	254	33	61	4	7001.12	2730.44
12425	305	44	918	7	20601.56	5974.43
12426	254	28	962	3	21643.44	4328.70
12427	254	50	824	8	64563.28	21305.92
12428	254	44	202	1	8786.15	1493.65
12429	254	40	953	9	68270.58	8192.43
12430	254	32	499	4	29575.84	7985.48
12431	254	30	381	6	7011.06	2033.22
12432	254	22	54	4	574.92	172.48
12433	254	33	584	7	35102.69	11232.83
12434	254	1	488	3	28878.75	3176.67
12435	254	11	656	10	10548.80	1160.40
12436	254	14	101	7	59475.15	16058.28
12437	254	21	790	9	38109.78	12195.09
12438	254	3	752	5	15555.40	4977.75
12439	302	12	10	1	2826.25	1073.97
12440	744	1	587	1	148.65	43.11
12441	254	31	388	4	22319.92	5803.16
12442	254	26	739	6	45297.84	10871.46
12443	520	31	281	4	18490.44	4067.88
12444	254	10	296	5	30694.35	7366.65
12445	254	49	467	2	19057.34	6670.06
12446	254	26	707	9	25452.09	4072.32
12447	254	14	616	8	8441.52	3376.64
12448	254	50	722	2	19204.86	5185.32
12449	254	32	691	6	50808.42	16258.68
12450	254	18	169	5	37177.70	5948.45
12451	254	50	192	8	24442.32	6599.44
12452	254	8	971	6	52405.98	6812.76
12453	254	4	180	18	64026.00	25610.40
12454	254	14	846	2	13361.30	3874.78
12455	34	3	984	4	22638.64	2943.04
12456	254	34	207	3	21933.78	7457.49
12457	254	38	314	6	42631.20	14068.32
12458	254	11	387	8	43212.24	13395.76
12459	254	11	123	1	2162.44	367.61
12460	254	12	733	6	54628.32	12564.54
12461	254	39	938	6	19706.64	5714.94
12462	254	50	745	1	8155.53	1386.44
12463	254	26	701	2	16995.46	4928.68
12464	254	4	319	5	31359.25	11916.50
12465	254	25	784	5	45226.55	17186.10
12466	254	46	582	5	10790.90	1079.10
12467	302	12	671	6	15443.88	2316.60
12468	254	49	645	7	1370.88	479.78
12469	29	2	767	4	25816.56	8777.64
12470	254	36	364	6	37583.34	9771.66
12471	254	36	190	7	39681.95	11110.96
12472	254	50	439	9	37784.79	4912.02
12473	254	50	726	6	26008.74	8582.88
12474	254	13	130	8	65862.64	9879.36
12475	350	10	67	9	62969.04	10075.05
12476	667	8	948	4	27561.32	9370.84
12477	254	16	39	4	35461.36	5319.20
12478	254	9	550	4	18664.12	2239.68
12479	254	46	258	7	64761.27	25256.91
12480	254	10	99	2	9449.32	3779.72
12481	598	9	763	6	22724.34	6590.04
12482	254	3	755	10	84790.70	16110.20
12483	254	21	328	6	47769.54	15286.26
12484	325	6	264	10	90649.50	12690.90
12485	254	36	631	5	13268.45	1459.55
12486	254	28	182	9	57188.88	17728.56
12487	254	28	458	8	56413.84	16360.00
12488	254	24	306	1	7220.81	2816.12
12489	254	14	961	14	124276.60	26098.10
12490	254	21	510	13	72194.59	9385.35
12491	52	12	91	7	69607.09	16009.63
12492	254	46	144	3	22564.80	6318.15
12493	254	34	539	8	34140.24	7169.44
12494	254	37	23	3	17017.92	4594.83
12495	254	17	32	8	43132.56	16821.68
12496	254	47	404	4	35725.44	10003.12
12497	254	5	542	2	18873.04	2642.22
12498	254	16	566	10	32553.50	9766.10
12499	254	37	77	3	20603.04	4738.71
12500	254	6	138	2	8796.06	967.56
12501	254	19	805	7	19681.76	6691.79
12502	254	14	356	6	26752.08	5082.90
12503	254	23	836	9	64881.27	14273.91
12504	254	26	34	5	26909.15	9418.20
12505	660	4	699	4	16046.36	4172.04
12506	254	16	704	1	8826.70	3265.88
12507	254	29	627	5	29327.10	4399.05
12508	254	9	469	10	363.90	109.20
12509	609	10	432	9	14292.81	3287.34
12510	254	30	401	8	9300.88	1860.16
12511	558	5	40	1	4450.12	979.03
12512	254	19	454	9	43550.37	7839.09
12513	254	40	580	2	11347.88	1702.18
12514	254	41	329	5	43958.45	13627.10
12515	254	23	63	9	69652.62	11144.43
12516	254	36	458	6	42310.38	12270.00
12517	254	4	302	10	65224.40	26089.80
12518	254	38	695	2	19909.98	6968.50
12519	254	12	794	8	37761.12	4908.96
12520	254	12	945	9	71986.41	12957.57
12521	29	2	996	2	16040.86	4651.84
12522	254	16	203	6	41631.18	14154.60
12523	254	28	972	8	19535.60	6642.08
12524	808	42	710	8	67173.04	26869.20
12525	6	48	995	1	9624.58	2598.64
12526	254	38	683	4	1903.32	628.08
12527	254	47	546	7	41367.69	4964.12
12528	254	43	717	3	29526.69	5314.80
12529	254	47	751	5	12790.20	4860.30
12530	254	3	613	6	37549.44	5256.90
12531	254	22	685	2	514.00	205.60
12532	254	34	933	8	64438.72	23197.92
12533	254	28	633	2	13767.74	5231.74
12534	254	8	528	4	38381.92	12666.04
12535	254	44	498	1	7082.03	2620.35
12536	254	47	807	8	43030.16	15060.56
12537	254	6	460	14	46571.56	13040.02
12538	254	49	241	9	52716.96	12124.89
12539	254	35	814	8	68514.40	23980.00
12540	254	48	937	1	485.99	63.18
12541	254	20	352	2	19128.96	4017.08
12542	254	37	677	5	11329.20	4305.10
12543	254	23	207	3	21933.78	7457.49
12544	254	37	206	3	24187.32	3869.97
12545	449	21	459	2	1194.18	417.96
12546	254	12	421	7	15350.93	4605.30
12547	254	19	679	7	68435.08	25320.96
12548	254	25	781	9	30709.80	3992.31
12549	146	31	843	4	36646.64	8062.28
12550	254	13	569	2	8291.60	1741.24
12551	254	19	331	2	4292.52	1502.38
12552	293	29	342	10	79518.10	23060.20
12553	254	43	633	5	34419.35	13079.35
12554	258	27	979	10	89093.10	29400.70
12555	254	42	522	3	24644.64	6407.61
12556	254	19	464	3	1563.63	547.26
12557	254	12	972	10	24419.50	8302.60
12558	254	34	129	7	61111.61	12222.35
12559	254	12	171	8	73393.52	24953.76
12560	254	1	816	4	4787.92	1627.88
12561	325	6	664	5	5867.70	645.45
12562	254	16	720	7	22084.65	7729.61
12563	254	6	182	9	57188.88	17728.56
12564	254	37	293	10	49349.80	9870.00
12565	254	37	122	1	7662.60	2528.66
12566	254	2	477	8	9812.00	3336.08
12567	254	26	178	4	24740.80	3711.12
12568	254	5	652	9	38173.32	15269.31
12569	104	19	43	3	28956.93	4922.67
12570	254	37	574	6	50799.90	12699.96
12571	254	34	450	10	84061.30	21855.90
12572	254	18	987	6	48519.60	16011.48
12573	254	11	560	4	37171.52	13010.04
12574	254	47	107	3	25475.73	8152.23
12575	254	45	258	6	55509.66	21648.78
12576	254	37	408	1	9950.41	2786.11
12577	254	36	689	5	22700.15	7264.05
12578	254	17	798	1	7097.23	2696.95
12579	254	15	266	5	33032.15	11561.25
12580	663	38	452	2	4672.12	1401.64
12581	254	44	523	2	16202.72	6319.06
12582	254	1	197	9	48624.39	12156.12
12583	254	16	777	10	97603.00	21472.70
12584	254	3	424	7	43794.17	16641.80
12585	254	14	695	8	79639.92	27874.00
12586	832	29	720	3	9464.85	3312.69
12587	254	3	80	1	4809.68	1875.78
12588	254	37	155	5	26711.25	6944.95
12589	254	33	702	2	17665.26	4946.28
12590	254	27	391	10	5669.00	963.70
12591	254	26	968	7	26232.08	6820.31
12592	254	9	715	7	51739.38	5691.35
12593	851	40	154	1	5763.50	1037.43
12594	254	40	900	4	5966.76	2207.72
12595	254	38	598	10	22046.10	5732.00
12596	254	2	188	4	4583.16	687.48
12597	704	31	245	5	40049.50	11614.35
12598	254	49	965	4	26992.08	5938.24
12599	254	13	528	2	19190.96	6333.02
12600	254	49	386	10	76123.70	25882.10
12601	254	47	176	9	43975.44	14951.61
12602	254	22	580	8	45391.52	6808.72
12603	254	16	862	15	89296.20	21431.10
12604	254	2	990	5	37467.55	7868.20
12605	254	49	804	9	40786.65	15498.90
12606	326	24	33	9	35590.41	10677.15
12607	254	25	463	1	9425.53	2073.62
12608	595	10	559	6	36860.76	10321.02
12609	254	29	415	6	39153.06	4698.36
12610	254	25	653	2	7013.90	1472.92
12611	254	50	948	3	20670.99	7028.13
12612	254	46	127	3	17891.67	6798.84
12613	254	41	188	9	10312.11	1546.83
12614	254	14	787	9	1368.27	246.33
12615	254	34	153	8	4093.36	1596.40
12616	254	39	754	12	403.32	108.84
12617	254	23	646	3	17489.61	5071.98
12618	254	20	934	4	329.04	46.08
12619	254	38	60	6	16191.60	1781.10
12620	254	13	72	9	70214.94	11234.43
12621	254	31	225	3	16965.06	5259.18
12622	254	3	352	9	86080.32	18076.86
12623	254	10	667	10	53533.40	21413.40
12624	254	10	131	5	2367.25	875.90
12625	254	26	933	3	24164.52	8699.22
12626	254	4	550	8	37328.24	4479.36
12627	254	43	533	3	9828.99	3735.03
12628	254	25	764	7	53050.83	11671.17
12629	254	40	391	1	566.90	96.37
12630	254	10	625	9	60579.54	13933.26
12631	254	49	434	7	59017.77	11213.37
12632	254	25	692	3	11001.72	1320.21
12633	254	3	918	8	23544.64	6827.92
12634	254	26	41	9	3853.17	1117.44
12635	254	13	716	10	27388.30	9585.90
12636	731	1	765	5	148.05	32.55
12637	254	43	432	10	15880.90	3652.60
12638	254	19	116	11	24659.69	4931.96
12639	254	49	394	9	57432.51	12060.81
12640	254	36	407	7	31063.20	10872.12
12641	254	19	136	1	5419.93	1246.58
12642	720	36	109	7	27009.43	7292.53
12643	254	9	800	7	68593.49	12346.81
12644	441	8	195	5	49656.50	5462.20
12645	264	22	152	7	17021.06	2723.35
12646	254	32	612	1	8672.57	2081.42
12647	254	11	112	6	15670.50	1567.02
12648	254	10	88	14	24508.54	7107.52
12649	254	33	842	2	7866.74	1809.36
12650	704	31	132	2	6096.86	2011.96
12651	254	1	580	2	11347.88	1702.18
12652	254	31	730	10	85994.50	9459.40
12653	254	17	517	10	69562.50	17390.60
12654	254	2	116	7	15692.53	3138.52
12655	438	22	462	6	31136.94	10586.58
12656	254	10	805	7	19681.76	6691.79
12657	254	14	764	7	53050.83	11671.17
12658	124	10	141	9	54627.03	8740.35
12659	254	8	39	3	26596.02	3989.40
12660	254	16	469	9	327.51	98.28
12661	254	36	759	4	17219.44	3616.08
12662	254	40	747	7	967.82	154.84
12663	254	3	289	5	29438.45	5887.70
12664	254	7	880	8	50276.56	6535.92
12665	254	7	431	7	14629.09	3510.99
12666	254	10	913	10	32710.00	6214.90
12667	254	11	737	10	97747.50	10752.20
12668	254	33	915	1	2487.52	522.38
12669	254	42	296	2	12277.74	2946.66
12670	254	49	860	2	18781.02	5634.30
12671	254	6	316	1	3787.88	1363.64
12672	538	9	415	9	58729.59	7047.54
12673	254	44	767	5	32270.70	10972.05
12674	693	3	712	1	4087.96	776.71
12675	254	25	272	7	20697.81	3932.60
12676	254	47	568	9	76985.10	23865.39
12677	254	40	430	1	1088.39	185.03
12678	199	49	833	8	31767.92	9848.08
12679	254	50	278	9	73892.88	22167.90
12680	254	25	899	2	12253.04	3185.80
12681	254	22	524	10	66991.00	15407.90
12682	254	21	769	5	47448.65	8540.75
12683	254	33	342	4	31807.24	9224.08
12684	254	20	315	9	39808.53	9155.97
12685	254	47	658	5	42529.15	11482.85
12686	254	50	677	10	22658.40	8610.20
12687	193	20	368	9	38313.45	11877.21
12688	254	1	353	3	6565.98	1838.46
12689	254	47	33	14	55362.86	16608.90
12690	254	27	768	5	49741.95	16414.85
12691	254	16	76	2	3081.42	1201.76
12692	26	47	93	5	25089.70	8028.70
12693	254	34	986	8	61063.04	20150.80
12694	254	42	308	4	5116.24	2046.48
12695	254	22	319	8	50174.80	19066.40
12696	254	16	931	4	10749.08	1719.84
12697	254	5	969	7	17141.32	2056.95
12698	277	39	795	4	26688.40	8807.16
12699	607	5	34	1	5381.83	1883.64
12700	254	29	648	9	61031.97	16478.64
12701	757	25	5	4	34909.44	12218.32
12702	254	40	389	9	8648.10	3372.75
12703	254	36	937	5	2429.95	315.90
12704	254	47	185	1	7721.54	1544.31
12705	254	12	830	7	25896.29	2589.65
12706	254	43	455	4	15897.88	2066.72
12707	254	17	118	8	18692.32	5046.96
12708	254	3	686	5	17098.70	4274.70
12709	254	25	818	10	86163.40	24125.80
12710	254	13	150	1	8308.42	2492.53
12711	254	44	416	10	20804.30	7905.60
12712	254	19	164	7	18000.57	3960.11
12713	254	49	763	7	26511.73	7688.38
12714	523	37	9	10	73297.60	22722.30
12715	254	9	933	10	80548.40	28997.40
12716	254	43	961	3	26630.70	5592.45
12717	254	22	704	8	70613.60	26127.04
12718	744	1	33	7	27681.43	8304.45
12719	254	27	834	9	30192.21	12076.92
12720	254	17	246	8	9976.16	2593.84
12721	254	3	210	6	32043.78	9613.14
12722	731	19	835	9	22088.16	5742.90
12723	254	34	560	2	18585.76	6505.02
12724	281	37	287	3	8717.70	3225.54
12725	254	7	996	9	72183.87	20933.28
12726	254	3	939	7	15299.13	6119.68
12727	254	13	745	1	8155.53	1386.44
12728	254	3	93	4	20071.76	6422.96
12729	254	33	719	4	14221.00	3413.04
12730	254	23	337	6	41607.36	6241.08
12731	254	50	55	11	95106.00	11412.72
12732	254	13	475	8	45774.96	13274.72
12733	50	45	935	1	3063.28	490.12
12734	254	25	819	9	27549.00	10193.13
12735	254	49	94	8	69915.44	20974.64
12736	229	36	688	6	53491.68	6418.98
12737	254	47	651	4	27129.16	8138.76
12738	254	6	787	19	2888.57	520.03
12739	254	27	192	14	42774.06	11549.02
12740	254	18	785	4	18604.12	5581.24
12741	254	9	291	4	9612.44	3364.36
12742	254	32	964	2	18972.42	4932.82
12743	254	1	894	6	32097.72	9308.34
12744	844	12	983	1	3487.32	557.97
12745	254	2	865	4	36839.84	6262.76
12746	254	35	797	6	40948.86	9008.76
12747	254	17	740	9	55721.43	22288.59
12748	64	30	527	9	33752.52	7763.04
12749	254	39	957	3	15443.73	2162.13
12750	254	3	963	2	12752.22	2422.92
12751	254	30	695	5	49774.95	17421.25
12752	254	29	547	8	59394.88	7721.36
12753	254	48	843	3	27484.98	6046.71
12754	254	38	348	1	669.80	261.22
12755	254	35	168	6	3943.62	433.80
12756	254	49	889	6	26479.62	6090.30
12757	254	10	271	8	47805.04	9082.96
12758	254	11	38	10	48930.20	13211.20
12759	254	41	434	10	84311.10	16019.10
12760	546	5	17	2	3804.52	418.50
12761	254	2	601	6	23739.24	5697.42
12762	254	12	17	1	1902.26	209.25
12763	254	47	628	1	4028.21	966.77
12764	254	15	244	2	12287.92	4792.28
12765	797	3	843	6	54969.96	12093.42
12766	636	24	284	5	8530.50	1023.65
12767	254	11	47	9	37328.67	14931.45
12768	254	15	660	1	4425.11	1637.29
12769	254	25	642	3	14463.75	4773.03
12770	254	46	568	2	17107.80	5303.42
12771	254	39	238	8	56813.92	21589.28
12772	254	4	598	4	8818.44	2292.80
12773	254	6	957	3	15443.73	2162.13
12774	254	5	798	9	63875.07	24272.55
12775	254	7	309	3	4783.65	956.73
12776	254	10	559	1	6143.46	1720.17
12777	254	14	264	10	90649.50	12690.90
12778	254	5	181	10	37278.00	11929.00
12779	254	29	528	5	47977.40	15832.55
12780	254	26	732	10	27834.80	3061.80
12781	254	19	246	2	2494.04	648.46
12782	254	44	408	5	49752.05	13930.55
12783	254	27	24	12	15622.08	3280.68
12784	254	12	693	1	4770.76	1717.47
12785	254	15	28	3	23130.03	4394.70
12786	254	43	645	10	1958.40	685.40
12787	104	19	772	1	4915.51	1376.34
12788	792	3	574	7	59266.55	14816.62
12789	254	14	862	2	11906.16	2857.48
12790	254	22	346	7	28054.81	7574.77
12791	254	24	849	10	38801.10	15132.40
12792	254	41	43	10	96523.10	16408.90
12793	254	37	957	3	15443.73	2162.13
12794	254	33	83	1	7862.87	2752.00
12795	254	2	729	8	44152.16	15453.28
12796	254	6	180	3	10671.00	4268.40
12797	254	40	390	8	13099.76	2096.00
12798	254	33	191	7	21380.94	3634.75
12799	254	2	377	10	20982.80	5245.70
12800	254	24	142	6	27243.18	7083.24
12801	254	1	619	2	2094.46	356.06
12802	254	16	815	6	39457.86	6707.82
12803	834	41	611	9	62285.85	21800.07
12804	254	44	349	10	49040.90	14221.90
12805	254	14	742	2	14650.36	4981.12
12806	254	44	84	1	1918.45	211.03
12807	254	15	18	16	159829.92	28769.44
12808	254	39	154	14	80689.00	14524.02
12809	254	50	603	9	23547.51	7064.28
12810	254	3	230	17	103900.43	13507.01
12811	254	24	158	6	52423.20	16775.40
12812	254	18	55	2	17292.00	2075.04
12813	254	29	848	5	22184.25	5324.20
12814	254	40	660	6	26550.66	9823.74
12815	254	34	871	4	6692.72	736.20
12816	254	12	173	10	64124.30	23084.70
12817	254	39	41	10	4281.30	1241.60
12818	254	32	198	9	67688.19	14214.51
12819	254	50	817	9	38323.26	12263.40
12820	254	39	200	6	47335.92	10887.24
12821	508	10	17	6	11413.56	1255.50
12822	290	48	291	8	19224.88	6728.72
12823	254	23	359	2	10336.36	3411.00
12824	254	22	729	9	49671.18	17384.94
12825	254	14	901	1	1679.56	319.12
12826	254	11	18	1	9989.37	1798.09
12827	254	11	492	9	18466.65	4247.37
12828	254	34	390	4	6549.88	1048.00
12829	254	46	478	7	54942.02	7142.45
12830	254	28	905	8	7618.96	1828.56
12831	254	21	564	8	51297.12	5642.72
12832	270	46	999	8	5490.16	1537.28
12833	254	47	581	1	5046.39	1261.60
12834	254	21	385	1	5731.13	1547.41
12835	856	18	899	7	42885.64	11150.30
12836	254	33	554	7	28086.31	9268.49
12837	254	18	250	7	26171.88	8375.01
12838	254	39	27	3	13767.57	4680.96
12839	254	13	676	9	4185.90	1255.77
12840	254	31	582	1	2158.18	215.82
12841	254	2	70	3	6807.84	1225.41
12842	254	42	641	10	62826.40	19476.20
12843	254	18	899	10	61265.20	15929.00
12844	254	1	861	4	2121.76	700.20
12845	254	48	986	1	7632.88	2518.85
12846	306	3	100	4	22931.88	4815.68
12847	254	36	373	7	57114.12	6853.70
12848	254	42	601	4	15826.16	3798.28
12849	254	16	447	6	12362.46	3955.98
12850	254	16	581	1	5046.39	1261.60
12851	254	23	761	4	39381.24	12602.00
12852	254	27	366	8	1702.96	170.32
12853	254	20	181	7	26094.60	8350.30
12854	254	20	906	4	31614.24	9484.28
12855	254	44	106	9	77886.54	14019.57
12856	254	28	573	7	11231.01	3481.59
12857	487	5	501	7	58396.94	20438.95
12858	254	49	238	4	28406.96	10794.64
12859	254	4	195	5	49656.50	5462.20
12860	814	21	151	1	3649.63	693.43
12861	553	13	875	3	27604.89	6625.17
12862	254	44	757	7	7602.77	1292.48
12863	254	23	124	15	71219.10	21365.70
12864	254	23	782	9	12776.85	1660.95
12865	254	33	700	3	15231.42	4569.42
12866	254	31	492	1	2051.85	471.93
12867	748	39	724	2	18560.26	5196.88
12868	254	38	410	5	6231.45	2367.95
12869	254	28	607	6	36769.98	8089.38
12870	254	2	63	6	46435.08	7429.62
12871	257	8	373	3	24477.48	2937.30
12872	254	14	797	1	6824.81	1501.46
12873	254	26	625	13	87503.78	20125.82
12874	254	38	829	9	73450.71	21300.75
12875	254	12	111	6	55842.90	10610.16
12876	254	10	104	8	49239.76	19203.52
12877	254	1	567	7	51344.30	5647.88
12878	254	50	777	1	9760.30	2147.27
12879	138	42	494	5	14569.35	2476.80
12880	254	1	395	10	76399.30	12223.90
12881	254	19	423	11	98514.13	17732.55
12882	254	27	42	3	15784.74	5208.96
12883	254	5	980	8	60583.36	12116.64
12884	254	45	991	2	6496.64	1039.46
12885	26	47	876	5	6115.85	2385.20
12886	380	45	944	6	26949.72	7276.44
12887	254	20	650	6	50016.36	18506.04
12888	254	46	810	10	41825.60	15893.70
12889	254	49	742	2	14650.36	4981.12
12890	254	15	878	8	49226.48	6399.44
12891	294	20	782	8	11357.20	1476.40
12892	254	27	562	1	3456.55	795.01
12893	254	37	915	5	12437.60	2611.90
12894	254	46	194	2	10874.44	1631.16
12895	254	36	290	9	79891.02	17576.01
12896	254	10	259	3	24879.87	2487.99
12897	254	25	535	3	29810.76	10731.87
12898	852	35	545	4	2307.48	830.68
12899	575	36	596	3	12741.18	1911.18
12900	254	29	953	3	22756.86	2730.81
12901	254	50	487	5	33292.00	9987.60
12902	254	43	515	6	52986.00	15365.94
12903	254	3	849	9	34920.99	13619.16
12904	254	2	667	4	21413.36	8565.36
12905	254	50	120	3	23859.15	5487.60
12906	254	33	434	4	33724.44	6407.64
12907	254	22	790	6	25406.52	8130.06
12908	254	40	923	9	29308.50	7327.08
12909	254	34	589	8	44004.64	17601.84
12910	254	22	347	2	14460.10	3036.62
12911	254	1	506	3	1648.23	593.37
12912	254	47	238	10	71017.40	26986.60
12913	254	2	669	6	19550.04	4496.52
12914	254	30	664	12	14082.48	1549.08
12915	254	2	838	8	41022.80	9025.04
12916	753	8	12	10	98340.30	16717.90
12917	254	1	655	1	6917.04	1245.07
12918	254	32	536	10	70704.10	19090.10
12919	254	4	554	7	28086.31	9268.49
12920	254	2	515	10	88310.00	25609.90
12921	254	28	181	8	29822.40	9543.20
12922	139	17	845	5	44409.10	9325.90
12923	254	10	431	7	14629.09	3510.99
12924	254	39	845	5	44409.10	9325.90
12925	254	40	596	8	33976.48	5096.48
12926	254	25	145	10	75363.10	27130.70
12927	254	46	134	6	29008.62	4931.46
12928	254	38	9	2	14659.52	4544.46
12929	254	19	132	2	6096.86	2011.96
12930	254	37	701	5	42488.65	12321.70
12931	254	1	944	2	8983.24	2425.48
12932	254	6	260	8	3915.76	744.00
12933	254	33	226	6	26851.38	3490.68
12934	17	40	661	6	8116.20	2759.52
12935	254	20	669	2	6516.68	1498.84
12936	254	13	169	10	74355.40	11896.90
12937	254	49	715	10	73913.40	8130.50
12938	254	7	695	4	39819.96	13937.00
12939	254	29	786	8	34680.24	13178.48
12940	254	1	115	4	17962.92	3772.20
12941	254	21	148	3	4937.22	1481.16
12942	254	48	841	8	60945.84	20721.60
12943	254	25	546	2	11819.34	1418.32
12944	254	35	583	10	52543.10	12610.30
12945	254	9	345	6	59541.60	17267.04
12946	254	9	114	8	75880.48	21246.56
12947	254	36	156	14	16026.64	2724.54
12948	254	11	992	9	7293.69	2188.08
12949	254	44	535	1	9936.92	3577.29
12950	254	34	39	10	88653.40	13298.00
12951	254	1	484	6	54276.24	14111.82
12952	254	10	850	4	34542.40	6908.48
12953	30	17	80	8	38477.44	15006.24
12954	254	47	118	6	14019.24	3785.22
12955	819	44	236	1	5569.83	1559.55
12956	565	45	214	9	4932.18	937.08
12957	254	37	468	9	18850.14	2262.06
12958	254	6	22	18	50399.64	5040.00
12959	254	23	988	8	27829.28	5287.60
12960	254	32	379	2	13597.34	1495.70
12961	254	22	923	5	16282.50	4070.60
12962	254	1	950	15	86491.65	25082.55
12963	254	37	564	4	25648.56	2821.36
12964	254	35	613	10	62582.40	8761.50
12965	254	12	201	10	40427.00	7276.90
12966	254	35	171	3	27522.57	9357.66
12967	254	28	681	6	30734.10	4302.78
12968	254	24	656	5	5274.40	580.20
12969	254	25	409	5	31205.75	4368.80
12970	250	32	210	2	10681.26	3204.38
12971	254	8	725	6	33798.54	3717.84
12972	254	43	814	2	17128.60	5995.00
12973	254	40	105	6	21187.62	6568.14
12974	254	48	732	6	16700.88	1837.08
12975	254	10	213	6	6356.40	762.78
12976	254	7	688	8	71322.24	8558.64
12977	254	32	993	2	14402.88	3600.72
12978	254	13	322	1	7759.88	3026.35
12979	254	25	246	6	7482.12	1945.38
12980	710	28	514	8	3979.92	517.36
12981	254	19	786	1	4335.03	1647.31
12982	254	26	543	10	39934.80	11181.70
12983	254	32	361	10	39213.60	7058.40
12984	538	9	768	5	49741.95	16414.85
12985	254	29	997	9	41187.78	6178.14
12986	254	3	998	4	29274.00	5562.04
12987	254	47	689	7	31780.21	10169.67
12988	254	8	201	9	36384.30	6549.21
12989	254	29	883	7	17624.46	5992.35
12990	254	46	36	5	35992.55	10077.90
12991	254	17	86	7	50694.21	5576.34
12992	254	16	81	1	6114.42	2323.48
12993	254	20	947	10	33736.70	5397.90
12994	254	48	757	6	6516.66	1107.84
12995	254	46	531	5	30352.80	6981.15
12996	254	46	66	1	2143.52	835.97
12997	254	19	272	2	5913.66	1123.60
12998	254	25	528	7	67168.36	22165.57
12999	254	24	707	2	5656.02	904.96
13000	254	49	749	9	15151.32	4090.86
13001	254	25	753	7	35555.59	9244.48
13002	254	45	516	1	3455.90	1244.12
13003	254	40	417	1	5226.18	1620.12
13004	146	31	336	3	12576.18	1634.91
13005	254	44	243	8	8399.20	2435.76
13006	254	16	423	6	53734.98	9672.30
13007	254	13	878	2	12306.62	1599.86
13008	254	4	958	8	69459.04	12502.64
13009	192	35	821	3	21097.38	7173.12
13010	290	48	597	4	31308.80	8766.48
13011	254	35	995	4	38498.32	10394.56
13012	254	10	142	9	40864.77	10624.86
13013	254	20	861	2	1060.88	350.10
13014	254	19	178	3	18555.60	2783.34
13015	254	34	103	2	5456.78	1200.50
13016	254	45	630	6	8550.78	2479.74
13017	605	20	278	8	65682.56	19704.80
13018	254	18	674	3	19848.00	7145.28
13019	254	2	880	5	31422.85	4084.95
13020	254	17	350	6	42197.22	16456.92
13021	254	19	715	9	66522.06	7317.45
13022	254	39	879	6	29420.10	7355.04
13023	254	33	376	8	43092.16	11634.88
13024	639	46	933	1	8054.84	2899.74
13025	254	38	592	5	49089.95	9327.10
13026	807	20	903	1	7767.90	2408.05
13027	254	37	85	2	7129.34	1996.22
13028	264	22	357	4	37626.08	11664.08
13029	254	9	404	5	44656.80	12503.90
13030	293	29	583	7	36780.17	8827.21
13031	254	30	147	5	40801.95	8976.45
13032	254	21	99	3	14173.98	5669.58
13033	254	33	187	1	1499.26	164.92
13034	254	3	510	7	38874.01	5053.65
13035	254	50	898	2	10051.78	3819.68
13036	311	16	536	2	14140.82	3818.02
13037	254	21	461	7	48997.69	5389.72
13038	254	3	862	7	41671.56	10001.18
13039	254	8	777	8	78082.40	17178.16
13040	254	43	174	7	44635.71	12498.01
13041	1	6	183	7	3034.50	788.97
13042	254	38	309	7	11161.85	2232.37
13043	254	37	461	5	34998.35	3849.80
13044	254	37	716	1	2738.83	958.59
13045	254	50	224	2	15068.84	1808.26
13046	254	40	799	8	46880.40	13126.48
13047	254	3	294	7	41234.06	7422.10
13048	254	38	690	3	15775.59	3155.13
13049	254	12	906	10	79035.60	23710.70
13050	380	45	592	9	88361.91	16788.78
13051	194	49	339	3	22457.91	8309.43
13052	254	20	549	6	35881.56	9688.02
13053	325	36	674	9	59544.00	21435.84
13054	254	27	914	8	42663.60	16638.80
13055	254	4	893	9	56018.07	17925.75
13056	254	43	286	3	14112.12	4092.51
13057	254	14	33	1	3954.49	1186.35
13058	254	20	979	19	169276.89	55861.33
13059	254	50	321	5	29069.60	6976.70
13060	452	14	452	7	16352.42	4905.74
13061	254	1	618	4	27971.64	10069.80
13062	254	32	525	3	20667.90	7440.45
13063	254	11	824	9	72633.69	23969.16
13064	254	31	457	3	4980.72	1544.01
13065	254	9	992	2	1620.82	486.24
13066	529	39	652	9	38173.32	15269.31
13067	254	35	423	4	35823.32	6448.20
13068	254	42	125	4	14098.04	5075.28
13069	254	38	594	8	58149.92	19189.44
13070	254	19	51	13	71247.41	9262.11
13071	254	30	946	5	44125.00	15002.50
13072	34	30	929	6	9385.62	2628.00
13073	17	40	533	9	29486.97	11205.09
13074	254	50	854	4	16663.12	5832.08
13075	254	16	855	7	13872.81	3745.63
13076	254	40	401	7	8138.27	1627.64
13077	254	49	134	10	48347.70	8219.10
13078	254	43	387	2	10803.06	3348.94
13079	254	21	525	4	27557.20	9920.60
13080	254	38	755	1	8479.07	1611.02
13081	254	15	479	10	6438.40	772.60
13082	254	36	299	10	90397.00	15367.50
13083	254	36	339	5	37429.85	13849.05
13084	254	6	52	6	27821.76	2782.20
13085	254	46	756	5	19804.00	6535.30
13086	433	30	73	7	16487.73	1978.55
13087	254	5	388	7	39059.86	10155.53
13088	808	42	130	6	49396.98	7409.52
13089	254	26	557	10	26386.50	7388.20
13090	254	46	229	9	24958.17	6489.09
13091	254	36	69	9	57413.70	16650.00
13092	50	45	518	4	991.52	208.20
13093	254	31	708	10	63560.70	18432.60
13094	254	16	743	1	4467.69	1429.66
13095	753	29	947	6	20242.02	3238.74
13096	254	8	582	8	17265.44	1726.56
13097	641	14	21	1	517.10	67.22
13098	254	10	395	9	68759.37	11001.51
13099	254	5	643	6	43082.70	9909.00
13100	254	49	193	4	20490.68	5122.68
13101	254	39	1000	2	4447.06	1423.06
13102	254	27	752	9	27999.72	8959.95
13103	254	25	285	2	5892.24	883.84
13104	254	29	87	10	58864.00	7063.70
13105	254	6	697	4	5253.12	1891.12
13106	254	40	141	3	18209.01	2913.45
13107	254	4	604	1	2943.59	559.28
13108	254	13	934	1	82.26	11.52
13109	254	11	341	6	54346.74	12499.74
13110	254	13	992	5	4052.05	1215.60
13111	425	1	102	1	4849.79	775.97
13112	254	2	303	10	92470.20	31439.90
13113	254	44	942	1	1790.71	268.61
13114	254	27	316	2	7575.76	2727.28
13115	254	44	769	4	37958.92	6832.60
13116	254	1	79	6	54374.58	10331.16
13117	254	17	610	1	8739.69	1048.76
13118	99	43	712	7	28615.72	5436.97
13119	254	22	125	5	17622.55	6344.10
13120	254	35	875	1	9201.63	2208.39
13121	254	17	215	8	77042.96	16179.04
13122	254	33	122	10	76626.00	25286.60
13123	254	7	454	12	58067.16	10452.12
13124	254	16	685	7	1799.00	719.60
13125	254	7	534	3	26958.24	4582.89
13126	254	3	365	9	31881.06	10201.95
13127	254	28	963	9	57384.99	10903.14
13128	254	34	348	10	6698.00	2612.20
13129	254	37	748	6	22472.16	3595.56
13130	254	1	855	8	15854.64	4280.72
13131	254	38	715	1	7391.34	813.05
13132	254	46	227	8	59288.40	19565.20
13133	254	2	643	4	28721.80	6606.00
13134	254	4	660	10	44251.10	16372.90
13135	254	33	975	9	11245.68	1461.96
13136	254	44	613	5	31291.20	4380.75
13137	254	37	528	10	95954.80	31665.10
13138	254	6	242	10	99971.70	32990.70
13139	254	10	551	8	56909.92	13658.40
13140	294	20	934	10	822.60	115.20
13141	254	34	968	13	48716.72	12666.29
13142	254	24	553	8	52251.60	18288.08
13143	254	33	443	6	16219.98	3892.80
13144	254	46	279	2	7161.10	1647.06
13145	139	17	350	5	35164.35	13714.10
13146	254	36	652	6	25448.88	10179.54
13147	254	31	414	8	66430.88	18600.64
13148	254	22	807	7	37651.39	13177.99
13149	254	44	844	7	63079.73	24601.08
13150	254	44	732	7	19484.36	2143.26
13151	254	41	253	6	5082.66	1219.86
13152	254	44	636	1	55.66	8.91
13153	254	26	814	7	59950.10	20982.50
13154	254	22	53	3	29324.97	3225.75
13155	254	33	553	1	6531.45	2286.01
13156	254	48	519	13	4631.51	1667.38
13157	254	47	12	9	88506.27	15046.11
13158	254	23	679	1	9776.44	3617.28
13159	254	27	709	5	35914.20	10415.10
13160	254	40	171	6	55045.14	18715.32
13161	254	9	659	8	46583.92	10248.48
13162	254	5	796	10	67484.20	11472.30
13163	254	2	795	4	26688.40	8807.16
13164	254	6	63	9	69652.62	11144.43
13165	34	30	118	8	18692.32	5046.96
13166	254	44	450	7	58842.91	15299.13
13167	254	25	986	7	53430.16	17631.95
13168	254	27	186	3	9731.28	1848.93
13169	254	48	444	4	39422.72	12615.28
13170	254	37	917	7	6368.04	700.49
13171	254	26	621	8	34834.88	11843.84
13172	254	24	999	2	1372.54	384.32
13173	254	1	279	11	39386.05	9058.83
13174	254	17	840	3	18515.19	4073.34
13175	254	24	712	6	24527.76	4660.26
\.


--
-- Data for Name: fact_sales_order; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.fact_sales_order (id, date_id, source_online_id, customer_id, employee_id, store_id, revenue, revenue_online, revenue_offline, standard_cost, profit, number_order, number_order_online, number_order_offline) FROM stdin;
1	325	2	864	134	6	143027.88	143027.88	0.00	116496.09	26531.79	1	1	0
2	79	3	243	162	13	17862.30	17862.30	0.00	12146.37	5715.93	1	1	0
3	254	1000	538	192	17	158787.27	0.00	158787.27	117281.98	41505.29	1	0	1
4	394	2	232	199	26	132526.62	132526.62	0.00	93219.35	39307.27	1	1	0
5	677	2	355	251	18	100630.67	100630.67	0.00	81150.23	19480.44	1	1	0
6	750	1000	924	224	24	53496.20	0.00	53496.20	37982.30	15513.90	1	0	1
7	222	1000	279	205	49	71657.89	0.00	71657.89	50979.37	20678.52	1	0	1
8	349	1000	15	111	27	149516.58	0.00	149516.58	108291.27	41225.31	1	0	1
9	273	1000	559	86	28	26745.84	0.00	26745.84	23536.35	3209.49	1	0	1
10	254	2	115	80	11	7294.74	7294.74	0.00	6127.59	1167.15	1	1	0
11	696	1	328	230	13	69965.60	69965.60	0.00	58771.10	11194.50	1	1	0
12	242	1000	468	37	24	60913.90	0.00	60913.90	43494.44	17419.46	1	0	1
13	215	4	586	69	16	116654.35	116654.35	0.00	88343.21	28311.14	1	1	0
14	416	1000	232	188	39	234077.29	0.00	234077.29	169455.38	64621.91	1	0	1
15	239	2	892	222	27	52441.13	52441.13	0.00	44019.03	8422.10	1	1	0
16	658	3	496	172	41	166222.11	166222.11	0.00	113889.86	52332.25	1	1	0
17	254	4	97	5	14	172679.10	172679.10	0.00	115657.66	57021.44	1	1	0
18	143	1000	716	143	49	232425.86	0.00	232425.86	158957.62	73468.24	1	0	1
19	344	4	852	212	30	131798.90	131798.90	0.00	97684.30	34114.60	1	1	0
20	395	3	437	66	24	130729.57	130729.57	0.00	109660.26	21069.31	1	1	0
21	50	3	151	115	45	108064.69	108064.69	0.00	83444.13	24620.56	1	1	0
22	832	4	660	2	29	9464.85	9464.85	0.00	6152.16	3312.69	1	1	0
23	92	4	467	245	27	63555.37	63555.37	0.00	42653.23	20902.14	1	1	0
24	39	1000	607	49	2	99967.67	0.00	99967.67	65703.04	34264.63	1	0	1
25	265	1000	437	148	49	88818.20	0.00	88818.20	70166.40	18651.80	1	0	1
26	529	4	789	73	46	77790.65	77790.65	0.00	54799.67	22990.98	1	1	0
27	846	1000	187	13	13	109070.95	0.00	109070.95	80248.41	28822.54	1	0	1
28	254	1000	504	146	22	68537.31	0.00	68537.31	60577.71	7959.60	1	0	1
29	402	4	271	4	10	56826.16	56826.16	0.00	43441.67	13384.49	1	1	0
30	280	4	734	230	17	22993.56	22993.56	0.00	18164.94	4828.62	1	1	0
31	613	3	905	228	27	53670.69	53670.69	0.00	41373.61	12297.08	1	1	0
32	340	3	17	150	29	96587.18	96587.18	0.00	74341.85	22245.33	1	1	0
33	149	1000	302	47	10	80506.43	0.00	80506.43	71105.90	9400.53	1	0	1
34	479	3	885	31	40	95200.21	95200.21	0.00	76814.31	18385.90	1	1	0
35	850	1000	877	216	23	23547.51	0.00	23547.51	16483.23	7064.28	1	0	1
36	760	1	456	17	29	31136.94	31136.94	0.00	20550.36	10586.58	1	1	0
37	822	1000	784	28	11	159025.64	0.00	159025.64	111005.86	48019.78	1	0	1
38	715	1	850	253	29	7066.17	7066.17	0.00	6218.22	847.95	1	1	0
39	869	2	600	53	17	20540.14	20540.14	0.00	16759.64	3780.50	1	1	0
40	364	1000	150	229	33	5954.10	0.00	5954.10	4048.79	1905.31	1	0	1
41	213	1000	419	219	35	3139.45	0.00	3139.45	2260.40	879.05	1	0	1
42	624	4	340	139	34	108050.55	108050.55	0.00	82385.39	25665.16	1	1	0
43	396	4	606	172	13	38921.08	38921.08	0.00	28670.77	10250.31	1	1	0
44	593	1	578	224	50	40950.28	40950.28	0.00	26399.72	14550.56	1	1	0
45	280	1000	543	25	49	113836.20	0.00	113836.20	89712.98	24123.22	1	0	1
46	316	1000	96	105	12	33042.39	0.00	33042.39	27159.66	5882.73	1	0	1
47	178	1000	371	107	39	185460.92	0.00	185460.92	143553.49	41907.43	1	0	1
48	254	1000	976	20	34	115390.10	0.00	115390.10	94253.86	21136.24	1	0	1
49	12	1000	946	96	17	6128.33	0.00	6128.33	4780.10	1348.23	1	0	1
50	91	4	449	42	24	152767.90	152767.90	0.00	108616.70	44151.20	1	1	0
51	609	2	404	179	38	157838.39	157838.39	0.00	129856.44	27981.95	1	1	0
52	734	4	684	93	34	23130.24	23130.24	0.00	15264.38	7865.86	1	1	0
53	534	2	362	116	48	149124.00	149124.00	0.00	101351.40	47772.60	1	1	0
54	438	4	46	138	42	109310.95	109310.95	0.00	80070.85	29240.10	1	1	0
55	82	1	48	16	10	70176.42	70176.42	0.00	52199.20	17977.22	1	1	0
56	406	1000	838	179	21	94651.50	0.00	94651.50	76120.97	18530.53	1	0	1
57	325	1	694	171	28	44748.48	44748.48	0.00	36301.28	8447.20	1	1	0
58	607	4	498	226	5	80707.92	80707.92	0.00	50093.89	30614.03	1	1	0
59	229	1000	417	197	24	30598.30	0.00	30598.30	26970.75	3627.55	1	0	1
60	254	1000	421	59	44	26061.42	0.00	26061.42	19797.79	6263.63	1	0	1
61	499	1000	424	11	14	10772.82	0.00	10772.82	7110.09	3662.73	1	0	1
62	277	1000	990	9	29	194331.49	0.00	194331.49	164077.29	30254.20	1	0	1
63	516	4	307	156	31	103363.01	103363.01	0.00	79190.58	24172.43	1	1	0
64	331	1000	395	171	22	118045.78	0.00	118045.78	78399.20	39646.58	1	0	1
65	458	1000	393	98	1	62230.98	0.00	62230.98	41084.14	21146.84	1	0	1
66	767	1	835	241	27	11735.40	11735.40	0.00	10444.50	1290.90	1	1	0
67	521	2	731	9	7	160.80	160.80	0.00	130.24	30.56	1	1	0
68	797	1000	76	112	27	94428.65	0.00	94428.65	78011.21	16417.44	1	0	1
69	757	1000	609	19	36	8850.22	0.00	8850.22	5575.64	3274.58	1	0	1
70	792	1000	752	157	3	160770.28	0.00	160770.28	126681.53	34088.75	1	0	1
71	254	2	316	131	19	1122.54	1122.54	0.00	797.00	325.54	1	1	0
72	411	1000	738	158	18	17158.98	0.00	17158.98	14070.36	3088.62	1	0	1
73	737	1000	755	97	44	109633.05	0.00	109633.05	90515.12	19117.93	1	0	1
74	520	2	166	80	10	129688.06	129688.06	0.00	94833.70	34854.36	1	1	0
75	850	1	800	242	44	84731.10	84731.10	0.00	57471.88	27259.22	1	1	0
76	573	1	985	90	24	84157.83	84157.83	0.00	69850.98	14306.85	1	1	0
77	177	3	768	46	18	27955.14	27955.14	0.00	21881.19	6073.95	1	1	0
78	305	3	526	169	48	139902.49	139902.49	0.00	97706.36	42196.13	1	1	0
79	835	1000	848	88	19	110875.87	0.00	110875.87	73275.01	37600.86	1	0	1
80	768	2	64	160	44	57694.28	57694.28	0.00	42623.67	15070.61	1	1	0
81	468	1000	110	145	19	1308.96	0.00	1308.96	916.26	392.70	1	0	1
82	855	1000	500	30	29	3529.44	0.00	3529.44	2682.36	847.08	1	0	1
83	237	3	387	116	13	91963.07	91963.07	0.00	72279.31	19683.76	1	1	0
84	254	1000	1043	71	46	109963.12	0.00	109963.12	73986.34	35976.78	1	0	1
85	354	1000	601	83	49	21326.05	0.00	21326.05	15042.44	6283.61	1	0	1
86	285	1000	960	152	10	65521.04	0.00	65521.04	44530.69	20990.35	1	0	1
87	401	1000	501	23	12	39829.50	0.00	39829.50	25889.22	13940.28	1	0	1
88	871	1000	724	197	9	2517.78	0.00	2517.78	1661.73	856.05	1	0	1
89	323	1	854	80	26	69191.68	69191.68	0.00	50047.46	19144.22	1	1	0
90	447	4	916	29	33	122785.02	122785.02	0.00	90199.14	32585.88	1	1	0
91	209	3	208	157	32	26008.74	26008.74	0.00	17425.86	8582.88	1	1	0
92	665	2	610	142	23	254986.44	254986.44	0.00	203364.01	51622.43	1	1	0
93	298	1	172	37	34	13059.88	13059.88	0.00	10984.12	2075.76	1	1	0
94	42	4	500	4	25	27661.46	27661.46	0.00	17247.93	10413.53	1	1	0
95	254	1000	981	104	40	46104.03	0.00	46104.03	34578.00	11526.03	1	0	1
96	425	2	10	240	1	97750.43	97750.43	0.00	75890.10	21860.33	1	1	0
97	844	1000	396	188	42	197360.70	0.00	197360.70	156965.64	40395.06	1	0	1
98	556	1000	608	165	42	147757.83	0.00	147757.83	117841.71	29916.12	1	0	1
99	21	1000	601	206	47	40371.12	0.00	40371.12	30278.32	10092.80	1	0	1
100	535	2	898	241	20	13729.34	13729.34	0.00	12219.12	1510.22	1	1	0
101	311	3	807	200	49	161417.68	161417.68	0.00	117503.32	43914.36	1	1	0
102	734	1000	51	49	34	124008.27	0.00	124008.27	88206.15	35802.12	1	0	1
103	621	3	176	230	39	170630.93	170630.93	0.00	134253.93	36377.00	1	1	0
104	458	4	298	1	39	46583.92	46583.92	0.00	36335.44	10248.48	1	1	0
105	254	2	747	170	4	23595.93	23595.93	0.00	18081.93	5514.00	1	1	0
106	790	1000	111	16	47	93921.39	0.00	93921.39	66326.00	27595.39	1	0	1
107	254	1000	1233	98	38	83005.83	0.00	83005.83	65209.16	17796.67	1	0	1
108	240	1000	727	163	1	181904.52	0.00	181904.52	126208.65	55695.87	1	0	1
109	732	1000	487	150	22	68022.05	0.00	68022.05	45966.29	22055.76	1	0	1
110	254	1	908	29	50	41170.83	41170.83	0.00	30117.15	11053.68	1	1	0
111	694	1000	406	56	34	88959.99	0.00	88959.99	70833.13	18126.86	1	0	1
112	392	1000	175	173	5	126410.40	0.00	126410.40	92628.63	33781.77	1	0	1
113	307	2	38	203	19	60378.07	60378.07	0.00	39843.54	20534.53	1	1	0
114	752	1	186	43	11	172566.24	172566.24	0.00	139791.16	32775.08	1	1	0
115	254	1	147	46	39	46972.42	46972.42	0.00	37549.49	9422.93	1	1	0
116	574	1000	924	177	23	98678.79	0.00	98678.79	66694.35	31984.44	1	0	1
117	285	2	285	179	34	181107.00	181107.00	0.00	130358.77	50748.23	1	1	0
118	254	1	57	40	3	130384.63	130384.63	0.00	95579.23	34805.40	1	1	0
119	800	4	800	29	44	143848.65	143848.65	0.00	118610.46	25238.19	1	1	0
120	493	1000	98	113	5	51960.36	0.00	51960.36	42929.27	9031.09	1	0	1
121	643	1	494	122	46	25794.04	25794.04	0.00	18332.72	7461.32	1	1	0
122	380	1000	332	67	45	123704.75	0.00	123704.75	97541.25	26163.50	1	0	1
123	820	1	931	195	8	23951.33	23951.33	0.00	19390.67	4560.66	1	1	0
124	636	1000	562	181	24	83126.88	0.00	83126.88	70614.18	12512.70	1	0	1
125	729	1	296	37	18	54508.16	54508.16	0.00	43146.26	11361.90	1	1	0
126	554	1000	546	102	21	25189.89	0.00	25189.89	15113.94	10075.95	1	0	1
127	639	4	600	16	22	83280.12	83280.12	0.00	57622.92	25657.20	1	1	0
128	281	1000	403	179	47	48960.92	0.00	48960.92	32342.28	16618.64	1	0	1
129	81	1	286	162	13	126814.02	126814.02	0.00	94954.33	31859.69	1	1	0
130	64	3	377	74	29	26502.05	26502.05	0.00	21201.65	5300.40	1	1	0
131	44	1000	559	245	15	7666.66	0.00	7666.66	6194.39	1472.27	1	0	1
132	385	1000	941	39	38	37718.07	0.00	37718.07	24519.33	13198.74	1	0	1
133	281	3	932	188	37	102472.41	102472.41	0.00	80053.20	22419.21	1	1	0
134	823	1	888	236	4	76514.06	76514.06	0.00	61117.31	15396.75	1	1	0
135	846	3	459	145	26	77021.04	77021.04	0.00	55349.96	21671.08	1	1	0
136	734	3	969	148	48	148407.82	148407.82	0.00	109686.18	38721.64	1	1	0
137	17	1000	694	213	6	161756.40	0.00	161756.40	124135.51	37620.89	1	0	1
138	532	1000	910	49	24	133426.94	0.00	133426.94	89445.08	43981.86	1	0	1
139	487	3	126	153	44	129667.44	129667.44	0.00	83455.46	46211.98	1	1	0
140	480	1000	355	163	49	48997.69	0.00	48997.69	43607.97	5389.72	1	0	1
141	131	1000	510	49	32	35498.97	0.00	35498.97	27296.55	8202.42	1	0	1
142	18	1000	36	233	40	73149.34	0.00	73149.34	56729.42	16419.92	1	0	1
143	322	2	812	108	15	40744.20	40744.20	0.00	25805.46	14938.74	1	1	0
144	343	1000	162	91	38	64761.27	0.00	64761.27	39504.36	25256.91	1	0	1
145	254	1000	468	103	22	86770.29	0.00	86770.29	66026.45	20743.84	1	0	1
146	623	1	437	239	42	100939.59	100939.59	0.00	76090.95	24848.64	1	1	0
147	130	3	748	43	50	47710.86	47710.86	0.00	33874.74	13836.12	1	1	0
148	286	2	923	158	47	140946.68	140946.68	0.00	113540.05	27406.63	1	1	0
149	857	1000	328	221	26	8228.70	0.00	8228.70	5760.10	2468.60	1	0	1
150	161	1000	625	234	28	143904.28	0.00	143904.28	107426.43	36477.85	1	0	1
151	248	4	979	120	12	237327.29	237327.29	0.00	163568.81	73758.48	1	1	0
152	796	1000	212	189	21	168065.78	0.00	168065.78	127203.60	40862.18	1	0	1
153	767	4	61	249	2	139553.35	139553.35	0.00	100608.68	38944.67	1	1	0
154	469	1000	55	203	10	7759.88	0.00	7759.88	4733.53	3026.35	1	0	1
155	753	1000	706	92	8	148153.52	0.00	148153.52	117009.58	31143.94	1	0	1
156	266	1000	506	247	12	163864.11	0.00	163864.11	131115.24	32748.87	1	0	1
157	708	4	364	177	25	125158.81	125158.81	0.00	93586.29	31572.52	1	1	0
158	810	1000	881	5	10	43213.72	0.00	43213.72	36125.86	7087.86	1	0	1
159	254	4	237	165	36	75130.72	75130.72	0.00	57529.50	17601.22	1	1	0
160	287	1	191	187	33	25518.91	25518.91	0.00	16938.99	8579.92	1	1	0
161	574	2	957	226	9	1745.28	1745.28	0.00	1221.68	523.60	1	1	0
162	391	4	380	73	32	98117.70	98117.70	0.00	58870.60	39247.10	1	1	0
163	254	2	1152	201	3	125142.51	125142.51	0.00	93702.94	31439.57	1	1	0
164	867	1	735	184	25	59879.12	59879.12	0.00	46504.77	13374.35	1	1	0
165	3	1000	864	145	2	114440.18	0.00	114440.18	81864.56	32575.62	1	0	1
166	264	3	813	249	22	170534.51	170534.51	0.00	141090.44	29444.07	1	1	0
167	389	1000	443	32	40	59496.24	0.00	59496.24	41891.52	17604.72	1	0	1
168	91	1000	501	68	37	38522.15	0.00	38522.15	25763.48	12758.67	1	0	1
169	200	4	616	113	32	68464.16	68464.16	0.00	53362.63	15101.53	1	1	0
170	695	1000	258	158	5	31781.43	0.00	31781.43	21929.22	9852.21	1	0	1
171	263	2	415	234	24	118370.82	118370.82	0.00	74467.14	43903.68	1	1	0
172	578	4	655	252	11	119974.13	119974.13	0.00	85839.27	34134.86	1	1	0
173	151	3	32	20	25	178877.30	178877.30	0.00	136855.11	42022.19	1	1	0
174	853	2	946	73	35	96167.68	96167.68	0.00	82718.42	13449.26	1	1	0
175	870	3	253	104	21	79135.13	79135.13	0.00	64342.44	14792.69	1	1	0
176	433	1	281	189	2	162480.71	162480.71	0.00	136269.28	26211.43	1	1	0
177	536	4	927	210	21	113843.24	113843.24	0.00	80472.16	33371.08	1	1	0
178	446	1000	10	109	20	133677.00	0.00	133677.00	100633.14	33043.86	1	0	1
179	479	3	730	86	43	276.52	276.52	0.00	232.28	44.24	1	1	0
180	647	2	502	251	8	154953.46	154953.46	0.00	130331.18	24622.28	1	1	0
181	254	1	998	187	48	68859.40	68859.40	0.00	46337.40	22522.00	1	1	0
182	814	3	763	66	21	82100.03	82100.03	0.00	64157.31	17942.72	1	1	0
183	525	2	803	192	34	155816.88	155816.88	0.00	118570.08	37246.80	1	1	0
184	797	1000	954	211	3	107361.00	0.00	107361.00	81262.38	26098.62	1	0	1
185	254	1000	63	159	37	81501.31	0.00	81501.31	55338.72	26162.59	1	0	1
186	134	3	92	150	5	21359.13	21359.13	0.00	14298.81	7060.32	1	1	0
187	344	3	771	201	49	116904.83	116904.83	0.00	79956.15	36948.68	1	1	0
188	337	1000	631	231	26	127841.14	0.00	127841.14	98098.94	29742.20	1	0	1
189	114	1000	934	249	36	103114.12	0.00	103114.12	68027.31	35086.81	1	0	1
190	182	3	786	89	21	77154.62	77154.62	0.00	51759.83	25394.79	1	1	0
191	76	1	267	210	32	172209.57	172209.57	0.00	122032.90	50176.67	1	1	0
192	144	2	874	175	24	95265.03	95265.03	0.00	65814.06	29450.97	1	1	0
193	678	1	363	95	28	233387.46	233387.46	0.00	167563.74	65823.72	1	1	0
194	674	2	575	22	49	92832.75	92832.75	0.00	64406.09	28426.66	1	1	0
195	411	1000	746	140	26	69551.55	0.00	69551.55	46131.39	23420.16	1	0	1
196	54	1000	728	25	9	79562.60	0.00	79562.60	53375.71	26186.89	1	0	1
197	8	1000	902	17	15	79060.87	0.00	79060.87	55130.79	23930.08	1	0	1
198	494	1	898	27	30	2010.12	2010.12	0.00	1708.60	301.52	1	1	0
199	74	1000	295	214	37	97990.70	0.00	97990.70	80352.40	17638.30	1	0	1
200	259	3	43	193	25	187703.15	187703.15	0.00	155984.32	31718.83	1	1	0
201	255	1000	383	56	6	101190.42	0.00	101190.42	67357.28	33833.14	1	0	1
202	789	4	880	109	17	10390.96	10390.96	0.00	8208.84	2182.12	1	1	0
203	483	3	532	173	15	63192.75	63192.75	0.00	47267.82	15924.93	1	1	0
204	212	1	678	195	41	21847.18	21847.18	0.00	18061.87	3785.31	1	1	0
205	723	1	739	4	17	115699.82	115699.82	0.00	92823.48	22876.34	1	1	0
206	69	2	840	4	8	155517.54	155517.54	0.00	118701.98	36815.56	1	1	0
207	271	1000	906	174	40	52182.52	0.00	52182.52	41286.16	10896.36	1	0	1
208	257	4	678	44	8	210580.29	210580.29	0.00	166777.19	43803.10	1	1	0
209	557	1000	77	185	32	83515.52	0.00	83515.52	64711.08	18804.44	1	0	1
210	649	4	86	133	13	56458.42	56458.42	0.00	41708.98	14749.44	1	1	0
211	7	4	908	59	16	94938.69	94938.69	0.00	76731.92	18206.77	1	1	0
212	776	1000	38	248	22	77501.13	0.00	77501.13	61500.99	16000.14	1	0	1
213	824	1000	443	110	50	190694.67	0.00	190694.67	155945.00	34749.67	1	0	1
214	410	1000	576	201	12	22602.54	0.00	22602.54	16662.22	5940.32	1	0	1
215	716	4	800	79	28	114259.50	114259.50	0.00	77257.61	37001.89	1	1	0
216	609	1000	355	52	10	50423.83	0.00	50423.83	37855.50	12568.33	1	0	1
217	596	2	991	185	12	24671.57	24671.57	0.00	15789.83	8881.74	1	1	0
218	177	3	321	47	32	79637.51	79637.51	0.00	62117.28	17520.23	1	1	0
219	315	1000	233	223	33	167606.82	0.00	167606.82	134889.29	32717.53	1	0	1
220	331	1000	170	247	8	75627.90	0.00	75627.90	56638.50	18989.40	1	0	1
221	439	1000	375	9	40	112619.53	0.00	112619.53	81476.32	31143.21	1	0	1
222	180	1000	660	40	27	234582.92	0.00	234582.92	179529.74	55053.18	1	0	1
223	189	1000	777	242	38	50299.02	0.00	50299.02	42251.22	8047.80	1	0	1
224	840	2	495	165	38	99217.01	99217.01	0.00	74631.11	24585.90	1	1	0
225	816	3	783	69	40	150344.65	150344.65	0.00	125261.41	25083.24	1	1	0
226	192	1000	101	80	35	109107.70	0.00	109107.70	80655.22	28452.48	1	0	1
227	310	3	719	174	22	55994.44	55994.44	0.00	48496.78	7497.66	1	1	0
228	738	3	453	13	10	7857.78	7857.78	0.00	5579.00	2278.78	1	1	0
229	535	1	798	140	12	34140.24	34140.24	0.00	26970.80	7169.44	1	1	0
230	437	1000	445	126	29	8370.90	0.00	8370.90	6780.42	1590.48	1	0	1
231	205	2	741	252	36	108287.40	108287.40	0.00	88157.39	20130.01	1	1	0
232	400	1000	336	145	28	102575.58	0.00	102575.58	71523.56	31052.02	1	0	1
233	327	4	275	217	23	109653.28	109653.28	0.00	84639.06	25014.22	1	1	0
234	375	1000	894	199	4	107466.68	0.00	107466.68	86333.05	21133.63	1	0	1
235	10	1000	645	106	5	8270.40	0.00	8270.40	6616.32	1654.08	1	0	1
236	13	1000	986	94	32	101481.30	0.00	101481.30	67441.50	34039.80	1	0	1
237	608	1000	789	48	30	83582.10	0.00	83582.10	59329.55	24252.55	1	0	1
238	397	1	946	195	28	18058.63	18058.63	0.00	15237.97	2820.66	1	1	0
239	687	1000	227	37	4	87508.38	0.00	87508.38	65682.91	21825.47	1	0	1
240	254	1000	340	194	30	42661.96	0.00	42661.96	32017.68	10644.28	1	0	1
241	218	4	77	33	13	65043.90	65043.90	0.00	42071.85	22972.05	1	1	0
242	510	1000	107	33	46	56093.49	0.00	56093.49	48659.90	7433.59	1	0	1
243	180	1000	487	197	7	131971.15	0.00	131971.15	107231.04	24740.11	1	0	1
244	61	3	34	244	8	109123.00	109123.00	0.00	88323.38	20799.62	1	1	0
245	195	1000	684	24	44	70855.22	0.00	70855.22	53683.93	17171.29	1	0	1
246	447	1000	947	161	10	4492.66	0.00	4492.66	3773.85	718.81	1	0	1
247	579	1000	211	133	26	41363.49	0.00	41363.49	27458.21	13905.28	1	0	1
248	475	1000	992	4	30	128333.89	0.00	128333.89	101352.44	26981.45	1	0	1
249	482	1000	459	34	6	22595.15	0.00	22595.15	17172.30	5422.85	1	0	1
250	399	1000	718	217	39	124887.85	0.00	124887.85	103637.79	21250.06	1	0	1
251	764	1000	873	129	24	43570.49	0.00	43570.49	31604.61	11965.88	1	0	1
252	675	3	526	93	33	118926.53	118926.53	0.00	97361.21	21565.32	1	1	0
253	288	1	211	194	48	85528.84	85528.84	0.00	74303.38	11225.46	1	1	0
254	759	1000	179	64	24	124586.90	0.00	124586.90	85980.50	38606.40	1	0	1
255	805	2	291	215	14	104413.99	104413.99	0.00	84822.54	19591.45	1	1	0
256	34	4	309	218	19	75910.43	75910.43	0.00	55863.99	20046.44	1	1	0
257	267	4	125	156	23	43668.04	43668.04	0.00	36139.98	7528.06	1	1	0
258	128	1000	591	30	25	55795.20	0.00	55795.20	45194.10	10601.10	1	0	1
259	864	2	445	54	21	44537.64	44537.64	0.00	36592.19	7945.45	1	1	0
260	253	1000	120	48	25	141294.58	0.00	141294.58	108567.31	32727.27	1	0	1
261	272	1000	305	223	49	17306.26	0.00	17306.26	11422.14	5884.12	1	0	1
262	579	1	462	123	20	206940.32	206940.32	0.00	155483.38	51456.94	1	1	0
263	755	1000	167	79	30	180326.11	0.00	180326.11	150602.66	29723.45	1	0	1
264	33	1000	900	248	4	65915.20	0.00	65915.20	52893.82	13021.38	1	0	1
265	311	1000	461	128	2	153309.76	0.00	153309.76	112485.34	40824.42	1	0	1
266	319	2	702	29	40	167469.23	167469.23	0.00	139516.43	27952.80	1	1	0
267	630	2	287	252	11	64697.10	64697.10	0.00	44390.92	20306.18	1	1	0
268	359	1000	388	79	2	49868.00	0.00	49868.00	30419.44	19448.56	1	0	1
269	41	1000	868	101	25	102657.48	0.00	102657.48	77706.24	24951.24	1	0	1
270	271	1000	889	25	11	36924.00	0.00	36924.00	29539.20	7384.80	1	0	1
271	56	1000	516	161	9	7921.60	0.00	7921.60	5307.48	2614.12	1	0	1
272	706	4	818	170	9	144326.54	144326.54	0.00	118391.69	25934.85	1	1	0
273	49	1000	789	73	47	100901.44	0.00	100901.44	65178.08	35723.36	1	0	1
274	479	1000	844	213	1	36858.44	0.00	36858.44	23100.26	13758.18	1	0	1
275	640	3	646	13	4	7318.16	7318.16	0.00	5669.85	1648.31	1	1	0
276	641	1000	586	121	47	57761.17	0.00	57761.17	47181.32	10579.85	1	0	1
277	226	1	850	164	10	36833.22	36833.22	0.00	27993.24	8839.98	1	1	0
278	174	4	501	80	11	5411.70	5411.70	0.00	3247.02	2164.68	1	1	0
279	682	2	506	127	46	99250.26	99250.26	0.00	75723.35	23526.91	1	1	0
280	427	4	237	34	41	27943.90	27943.90	0.00	23472.90	4471.00	1	1	0
281	867	1000	610	75	17	97596.19	0.00	97596.19	76313.50	21282.69	1	0	1
282	780	3	661	137	29	107168.64	107168.64	0.00	89365.87	17802.77	1	1	0
283	570	1000	279	74	44	39135.96	0.00	39135.96	25287.06	13848.90	1	0	1
284	94	1000	267	215	33	6549.88	0.00	6549.88	5501.88	1048.00	1	0	1
285	855	1000	776	24	33	16248.48	0.00	16248.48	10561.50	5686.98	1	0	1
286	405	1	567	11	37	84016.32	84016.32	0.00	61961.41	22054.91	1	1	0
287	452	3	72	117	31	51485.85	51485.85	0.00	42530.94	8954.91	1	1	0
288	625	1000	182	52	5	97947.89	0.00	97947.89	70419.46	27528.43	1	0	1
289	47	4	702	194	26	200507.15	200507.15	0.00	164589.71	35917.44	1	1	0
290	548	1000	855	242	31	114690.59	0.00	114690.59	85112.68	29577.91	1	0	1
291	328	1	200	167	45	95848.40	95848.40	0.00	75209.14	20639.26	1	1	0
292	560	1000	445	112	45	214604.60	0.00	214604.60	154260.06	60344.54	1	0	1
293	29	1000	192	165	2	224701.11	0.00	224701.11	178971.20	45729.91	1	0	1
294	782	3	944	174	30	22776.01	22776.01	0.00	14712.82	8063.19	1	1	0
295	16	1000	955	159	10	148628.31	0.00	148628.31	123568.08	25060.23	1	0	1
296	293	1000	741	206	31	8913.54	0.00	8913.54	5619.46	3294.08	1	0	1
297	665	3	196	109	17	28052.61	28052.61	0.00	23283.66	4768.95	1	1	0
298	30	1000	464	184	17	114955.74	0.00	114955.74	79865.53	35090.21	1	0	1
299	709	1000	558	225	34	106628.41	0.00	106628.41	85036.96	21591.45	1	0	1
300	700	4	656	27	25	44450.64	44450.64	0.00	34167.88	10282.76	1	1	0
301	258	2	974	179	9	175066.44	175066.44	0.00	136053.70	39012.74	1	1	0
302	608	1000	234	108	40	188058.62	0.00	188058.62	138099.20	49959.42	1	0	1
303	87	1000	300	143	17	45020.72	0.00	45020.72	35535.99	9484.73	1	0	1
304	60	1000	490	20	43	45497.89	0.00	45497.89	36496.42	9001.47	1	0	1
305	591	1000	871	218	50	98771.77	0.00	98771.77	78607.66	20164.11	1	0	1
306	299	1000	317	90	2	146027.21	0.00	146027.21	115668.02	30359.19	1	0	1
307	816	1000	149	129	23	15151.52	0.00	15151.52	9696.96	5454.56	1	0	1
308	399	1000	819	47	47	94341.17	0.00	94341.17	67648.40	26692.77	1	0	1
309	470	4	354	93	9	115374.53	115374.53	0.00	97323.99	18050.54	1	1	0
310	443	1000	774	188	22	110519.64	0.00	110519.64	74789.29	35730.35	1	0	1
311	53	1000	144	79	28	116260.40	0.00	116260.40	94568.16	21692.24	1	0	1
312	840	1	353	43	46	16727.22	16727.22	0.00	10872.72	5854.50	1	1	0
313	553	2	334	26	13	27604.89	27604.89	0.00	20979.72	6625.17	1	1	0
314	182	2	116	132	40	36072.40	36072.40	0.00	28857.90	7214.50	1	1	0
315	389	3	380	221	17	18927.17	18927.17	0.00	15683.23	3243.94	1	1	0
316	844	3	743	182	12	83468.66	83468.66	0.00	56754.33	26714.33	1	1	0
317	845	1000	28	168	25	36275.36	0.00	36275.36	24697.15	11578.21	1	0	1
318	622	1000	780	221	30	54882.46	0.00	54882.46	39141.66	15740.80	1	0	1
319	367	1	291	30	22	157666.96	157666.96	0.00	128571.28	29095.68	1	1	0
320	828	1000	882	24	33	51676.20	0.00	51676.20	39273.94	12402.26	1	0	1
321	108	2	160	143	44	21235.30	21235.30	0.00	18050.00	3185.30	1	1	0
322	546	1000	863	146	3	45666.88	0.00	45666.88	38868.14	6798.74	1	0	1
323	148	1	349	249	18	7770.80	7770.80	0.00	4740.19	3030.61	1	1	0
324	794	1000	684	218	41	35181.23	0.00	35181.23	21812.35	13368.88	1	0	1
325	243	1000	363	40	39	5768.70	0.00	5768.70	3692.00	2076.70	1	0	1
326	323	2	973	230	10	36980.88	36980.88	0.00	28845.12	8135.76	1	1	0
327	375	1000	924	164	48	158331.39	0.00	158331.39	114769.84	43561.55	1	0	1
328	645	1000	367	189	2	57504.16	0.00	57504.16	42553.07	14951.09	1	0	1
329	739	1000	481	58	33	52626.93	0.00	52626.93	40346.63	12280.30	1	0	1
330	666	1000	860	60	5	66850.74	0.00	66850.74	51823.86	15026.88	1	0	1
331	467	1000	877	104	50	58618.84	0.00	58618.84	50504.07	8114.77	1	0	1
332	718	1000	713	17	14	20007.34	0.00	20007.34	17549.38	2457.96	1	0	1
333	5	1000	465	185	50	105209.97	0.00	105209.97	84830.93	20379.04	1	0	1
334	859	1	161	79	19	154480.25	154480.25	0.00	117620.80	36859.45	1	1	0
335	586	1000	765	56	34	1464.57	0.00	1464.57	908.01	556.56	1	0	1
336	109	1	113	69	8	100931.20	100931.20	0.00	71872.56	29058.64	1	1	0
337	847	1000	952	106	50	131687.51	0.00	131687.51	106207.05	25480.46	1	0	1
338	833	2	845	22	6	174404.80	174404.80	0.00	128263.75	46141.05	1	1	0
339	477	1	719	44	48	57783.85	57783.85	0.00	40136.60	17647.25	1	1	0
340	179	1000	786	237	14	45457.30	0.00	45457.30	39093.25	6364.05	1	0	1
341	129	2	15	32	11	156913.16	156913.16	0.00	112598.00	44315.16	1	1	0
342	694	1	909	126	25	93149.37	93149.37	0.00	71916.30	21233.07	1	1	0
343	617	1000	899	54	38	206554.69	0.00	206554.69	153675.02	52879.67	1	0	1
344	683	1000	825	104	6	83268.64	0.00	83268.64	57271.18	25997.46	1	0	1
345	859	1000	17	174	33	829.56	0.00	829.56	696.84	132.72	1	0	1
346	745	2	598	162	20	146296.51	146296.51	0.00	112393.57	33902.94	1	1	0
347	726	1	134	215	4	33820.44	33820.44	0.00	27518.09	6302.35	1	1	0
348	805	1000	15	145	20	179530.00	0.00	179530.00	129166.03	50363.97	1	0	1
349	583	1000	881	87	19	82886.07	0.00	82886.07	65207.75	17678.32	1	0	1
350	292	1000	579	34	4	62461.40	0.00	62461.40	42288.06	20173.34	1	0	1
351	284	1	475	149	13	20730.86	20730.86	0.00	14375.15	6355.71	1	1	0
352	620	3	247	63	29	29864.44	29864.44	0.00	26280.72	3583.72	1	1	0
353	3	4	852	148	40	15956.50	15956.50	0.00	9893.05	6063.45	1	1	0
354	49	1	627	172	30	18695.32	18695.32	0.00	16313.91	2381.41	1	1	0
355	58	2	161	199	36	8188.32	8188.32	0.00	5076.76	3111.56	1	1	0
356	405	2	6	134	31	39013.11	39013.11	0.00	26138.79	12874.32	1	1	0
357	254	4	999	71	47	117876.03	117876.03	0.00	88066.17	29809.86	1	1	0
358	437	1	382	172	12	116038.31	116038.31	0.00	90918.42	25119.89	1	1	0
359	455	4	309	84	41	62859.30	62859.30	0.00	42760.02	20099.28	1	1	0
360	619	1000	127	252	25	27310.62	0.00	27310.62	24033.36	3277.26	1	0	1
361	756	1000	935	140	8	54262.92	0.00	54262.92	40697.16	13565.76	1	0	1
362	791	1000	441	212	7	31070.88	0.00	31070.88	24782.53	6288.35	1	0	1
363	433	1	129	105	19	50806.73	50806.73	0.00	37230.45	13576.28	1	1	0
364	239	1	969	10	23	158328.14	158328.14	0.00	125611.37	32716.77	1	1	0
365	328	1	809	135	28	68676.73	68676.73	0.00	58311.47	10365.26	1	1	0
366	426	1000	991	17	15	95452.67	0.00	95452.67	81145.46	14307.21	1	0	1
367	743	1000	76	81	47	42180.39	0.00	42180.39	32900.70	9279.69	1	0	1
368	517	4	248	81	24	65902.90	65902.90	0.00	53810.42	12092.48	1	1	0
369	420	1000	621	14	7	4859.90	0.00	4859.90	4228.10	631.80	1	0	1
370	789	1000	820	121	4	37208.24	0.00	37208.24	26045.76	11162.48	1	0	1
371	120	4	869	230	20	117585.23	117585.23	0.00	80706.78	36878.45	1	1	0
372	387	1000	414	227	12	133662.43	0.00	133662.43	95817.76	37844.67	1	0	1
373	254	2	1270	37	49	45298.17	45298.17	0.00	29896.83	15401.34	1	1	0
374	297	2	158	41	39	197276.28	197276.28	0.00	151054.83	46221.45	1	1	0
375	397	2	21	40	43	77582.44	77582.44	0.00	52126.00	25456.44	1	1	0
376	147	1000	920	211	34	133181.10	0.00	133181.10	100389.98	32791.12	1	0	1
377	248	1	914	195	3	132201.08	132201.08	0.00	88058.18	44142.90	1	1	0
378	175	4	550	146	1	165952.91	165952.91	0.00	125584.47	40368.44	1	1	0
379	377	1000	236	183	36	75288.36	0.00	75288.36	47232.23	28056.13	1	0	1
380	229	4	802	15	36	94286.42	94286.42	0.00	62267.75	32018.67	1	1	0
381	435	2	224	120	18	90698.13	90698.13	0.00	67170.45	23527.68	1	1	0
382	586	1000	359	83	25	87619.56	0.00	87619.56	76684.31	10935.25	1	0	1
383	789	3	288	169	48	108564.14	108564.14	0.00	86516.65	22047.49	1	1	0
384	720	3	119	129	1	28897.36	28897.36	0.00	18286.76	10610.60	1	1	0
385	545	2	850	96	23	131688.26	131688.26	0.00	97614.57	34073.69	1	1	0
386	254	1000	1159	133	15	94229.16	0.00	94229.16	75622.47	18606.69	1	0	1
387	301	3	818	17	14	132481.11	132481.11	0.00	93252.36	39228.75	1	1	0
388	718	1000	766	97	34	220546.42	0.00	220546.42	168308.67	52237.75	1	0	1
389	109	1000	299	173	37	161164.54	0.00	161164.54	113945.64	47218.90	1	0	1
390	477	4	268	46	12	161268.37	161268.37	0.00	114062.65	47205.72	1	1	0
391	430	1	909	89	19	155183.51	155183.51	0.00	119462.20	35721.31	1	1	0
392	510	1000	475	23	32	122852.70	0.00	122852.70	96926.49	25926.21	1	0	1
393	456	3	254	137	11	51876.18	51876.18	0.00	35262.00	16614.18	1	1	0
394	286	1000	870	3	15	28738.54	0.00	28738.54	23591.84	5146.70	1	0	1
395	254	1	1053	167	2	54988.96	54988.96	0.00	39642.47	15346.49	1	1	0
396	323	1000	371	197	24	154602.69	0.00	154602.69	116993.28	37609.41	1	0	1
397	455	1000	764	58	11	104678.59	0.00	104678.59	74508.48	30170.11	1	0	1
398	287	1000	122	142	18	167398.41	0.00	167398.41	115920.35	51478.06	1	0	1
399	168	1000	524	52	40	2907.48	0.00	2907.48	1977.09	930.39	1	0	1
400	64	1	181	236	30	181536.66	181536.66	0.00	133573.97	47962.69	1	1	0
401	671	2	932	156	9	37130.24	37130.24	0.00	23020.76	14109.48	1	1	0
402	105	4	171	204	34	97929.12	97929.12	0.00	73660.50	24268.62	1	1	0
403	731	1000	460	35	19	256386.73	0.00	256386.73	172668.67	83718.06	1	0	1
404	685	1	763	105	4	157282.96	157282.96	0.00	104945.29	52337.67	1	1	0
405	116	1000	682	231	1	33742.10	0.00	33742.10	28005.95	5736.15	1	0	1
406	567	1000	328	9	24	106442.50	0.00	106442.50	76840.67	29601.83	1	0	1
407	266	1000	253	168	21	38220.89	0.00	38220.89	30171.46	8049.43	1	0	1
408	103	4	568	193	44	66219.66	66219.66	0.00	56689.65	9530.01	1	1	0
409	744	1000	375	46	16	39922.80	0.00	39922.80	32783.10	7139.70	1	0	1
410	36	1000	542	80	26	124699.96	0.00	124699.96	90680.08	34019.88	1	0	1
411	379	1000	464	135	36	196546.66	0.00	196546.66	142032.49	54514.17	1	0	1
412	110	2	232	4	39	163089.47	163089.47	0.00	117784.77	45304.70	1	1	0
413	577	2	733	57	32	44546.55	44546.55	0.00	29846.20	14700.35	1	1	0
414	829	1000	824	4	8	116492.95	0.00	116492.95	82743.06	33749.89	1	0	1
415	824	1000	557	105	33	28088.90	0.00	28088.90	23313.80	4775.10	1	0	1
416	274	1000	227	69	49	99777.12	0.00	99777.12	72595.57	27181.55	1	0	1
417	793	1000	170	33	1	115617.07	0.00	115617.07	87300.72	28316.35	1	0	1
418	104	1000	34	227	19	188003.56	0.00	188003.56	145889.82	42113.74	1	0	1
419	445	1000	864	92	50	64046.40	0.00	64046.40	50504.79	13541.61	1	0	1
420	659	2	721	207	26	41733.12	41733.12	0.00	36363.39	5369.73	1	1	0
421	651	1000	595	119	1	56125.19	0.00	56125.19	44732.11	11393.08	1	0	1
422	530	1	288	68	7	62105.67	62105.67	0.00	47538.88	14566.79	1	1	0
423	328	2	998	139	46	45755.65	45755.65	0.00	39487.90	6267.75	1	1	0
424	170	1000	397	80	21	75877.84	0.00	75877.84	62540.96	13336.88	1	0	1
425	445	1000	998	249	18	39934.80	0.00	39934.80	28753.10	11181.70	1	0	1
426	172	1000	126	244	4	67358.74	0.00	67358.74	53002.48	14356.26	1	0	1
427	268	4	392	46	49	82928.65	82928.65	0.00	61280.76	21647.89	1	1	0
428	606	3	843	170	40	89477.07	89477.07	0.00	62589.12	26887.95	1	1	0
429	140	4	333	158	1	88145.17	88145.17	0.00	70307.56	17837.61	1	1	0
430	710	4	589	186	28	25089.64	25089.64	0.00	16550.60	8539.04	1	1	0
431	460	1000	349	42	34	201385.61	0.00	201385.61	159620.92	41764.69	1	0	1
432	686	3	776	87	22	173224.17	173224.17	0.00	115394.52	57829.65	1	1	0
433	730	1000	761	253	9	86283.97	0.00	86283.97	66156.81	20127.16	1	0	1
434	478	1000	89	44	18	17229.55	0.00	17229.55	11728.67	5500.88	1	0	1
435	785	1000	651	71	34	67650.53	0.00	67650.53	46749.42	20901.11	1	0	1
436	563	3	521	172	28	90667.31	90667.31	0.00	75253.82	15413.49	1	1	0
437	436	1000	79	196	27	54170.48	0.00	54170.48	37660.70	16509.78	1	0	1
438	24	2	282	44	32	63603.10	63603.10	0.00	46717.11	16885.99	1	1	0
439	409	1000	932	144	40	93323.98	0.00	93323.98	68890.19	24433.79	1	0	1
440	55	1	923	210	41	53527.21	53527.21	0.00	42915.20	10612.01	1	1	0
441	428	4	563	253	16	4694.11	4694.11	0.00	3989.99	704.12	1	1	0
442	869	2	870	184	8	55989.18	55989.18	0.00	36676.80	19312.38	1	1	0
443	410	1	718	18	10	91717.73	91717.73	0.00	77444.97	14272.76	1	1	0
444	810	3	131	179	47	112912.54	112912.54	0.00	87463.46	25449.08	1	1	0
445	502	4	993	159	36	67253.31	67253.31	0.00	47101.26	20152.05	1	1	0
446	390	1000	148	122	16	32145.72	0.00	32145.72	20608.68	11537.04	1	0	1
447	796	1000	826	138	5	12319.98	0.00	12319.98	9257.38	3062.60	1	0	1
448	418	1000	577	252	29	116506.61	0.00	116506.61	91788.09	24718.52	1	0	1
449	110	2	421	136	23	122633.65	122633.65	0.00	90159.70	32473.95	1	1	0
450	150	1000	143	29	27	35880.25	0.00	35880.25	27374.19	8506.06	1	0	1
451	58	1000	275	16	48	17202.35	0.00	17202.35	15482.10	1720.25	1	0	1
452	187	1000	732	92	17	4179.54	0.00	4179.54	2925.69	1253.85	1	0	1
453	303	1000	185	242	34	71133.71	0.00	71133.71	56607.87	14525.84	1	0	1
454	146	1000	691	222	31	76738.95	0.00	76738.95	63176.52	13562.43	1	0	1
455	673	1000	707	17	46	79934.65	0.00	79934.65	71420.98	8513.67	1	0	1
684	389	1000	845	117	30	6862.70	0.00	6862.70	4941.10	1921.60	1	0	1
456	320	1000	918	243	22	150727.58	0.00	150727.58	111441.71	39285.87	1	0	1
457	469	1000	609	196	30	37474.78	0.00	37474.78	31853.57	5621.21	1	0	1
458	254	3	467	89	29	41187.78	41187.78	0.00	35009.64	6178.14	1	1	0
459	441	3	789	64	34	61456.17	61456.17	0.00	43141.59	18314.58	1	1	0
460	584	3	297	208	33	34573.37	34573.37	0.00	29227.95	5345.42	1	1	0
461	419	1000	460	100	2	50047.59	0.00	50047.59	34378.24	15669.35	1	0	1
462	163	3	958	170	4	39689.40	39689.40	0.00	30365.68	9323.72	1	1	0
463	596	1000	903	22	44	85057.13	0.00	85057.13	61061.00	23996.13	1	0	1
464	806	3	947	115	15	71308.20	71308.20	0.00	53346.96	17961.24	1	1	0
465	150	1	154	132	1	7827.20	7827.20	0.00	5635.58	2191.62	1	1	0
466	183	4	38	230	3	98377.09	98377.09	0.00	64096.33	34280.76	1	1	0
467	764	4	350	242	35	47022.64	47022.64	0.00	30645.53	16377.11	1	1	0
468	232	1000	269	231	34	39517.80	0.00	39517.80	27662.45	11855.35	1	0	1
469	413	1000	987	220	1	6382.60	0.00	6382.60	3957.22	2425.38	1	0	1
470	444	2	380	235	22	50457.46	50457.46	0.00	38652.78	11804.68	1	1	0
471	82	3	73	97	4	19840.66	19840.66	0.00	15475.72	4364.94	1	1	0
472	168	2	344	207	42	32535.08	32535.08	0.00	19521.04	13014.04	1	1	0
473	846	1	278	5	19	161307.42	161307.42	0.00	112139.76	49167.66	1	1	0
474	47	1000	708	89	22	60613.76	0.00	60613.76	47712.98	12900.78	1	0	1
475	783	4	217	52	28	90872.35	90872.35	0.00	59407.44	31464.91	1	1	0
476	381	2	200	14	6	98792.26	98792.26	0.00	68118.23	30674.03	1	1	0
477	323	1	887	102	2	115215.89	115215.89	0.00	94513.68	20702.21	1	1	0
478	339	2	771	135	46	183379.16	183379.16	0.00	133009.30	50369.86	1	1	0
479	716	1000	999	166	23	155161.64	0.00	155161.64	122205.02	32956.62	1	0	1
480	254	2	894	175	16	35178.95	35178.95	0.00	28056.25	7122.70	1	1	0
481	439	1	384	74	28	69450.51	69450.51	0.00	52563.42	16887.09	1	1	0
482	99	1000	986	219	43	113075.64	0.00	113075.64	89278.55	23797.09	1	0	1
483	254	2	61	226	5	73069.04	73069.04	0.00	55477.52	17591.52	1	1	0
484	436	4	273	78	20	8631.48	8631.48	0.00	5265.21	3366.27	1	1	0
485	58	4	44	2	7	49601.65	49601.65	0.00	38689.30	10912.35	1	1	0
486	207	1000	307	105	22	55303.47	0.00	55303.47	40177.88	15125.59	1	0	1
487	140	2	905	75	45	5033.13	5033.13	0.00	3321.87	1711.26	1	1	0
488	378	3	226	39	26	3968.30	3968.30	0.00	3293.71	674.59	1	1	0
489	263	1000	87	171	24	22289.64	0.00	22289.64	18170.61	4119.03	1	0	1
490	498	1000	389	161	25	150371.68	0.00	150371.68	116485.71	33885.97	1	0	1
491	501	1000	287	106	34	122037.15	0.00	122037.15	97186.80	24850.35	1	0	1
492	70	4	806	158	45	166047.96	166047.96	0.00	112027.08	54020.88	1	1	0
493	693	1000	327	86	41	199801.14	0.00	199801.14	153883.32	45917.82	1	0	1
494	366	4	742	248	17	52959.00	52959.00	0.00	42385.38	10573.62	1	1	0
495	187	1000	182	132	16	47448.77	0.00	47448.77	33864.23	13584.54	1	0	1
496	82	4	766	49	12	1627.30	1627.30	0.00	1008.90	618.40	1	1	0
497	157	1000	83	115	50	129131.66	0.00	129131.66	84254.06	44877.60	1	0	1
498	541	1000	213	20	16	31607.28	0.00	31607.28	21492.96	10114.32	1	0	1
499	686	4	974	141	7	92239.86	92239.86	0.00	67720.17	24519.69	1	1	0
500	589	3	110	215	4	57795.13	57795.13	0.00	50345.75	7449.38	1	1	0
501	608	1	378	173	44	6114.42	6114.42	0.00	3790.94	2323.48	1	1	0
502	760	2	655	114	16	70541.98	70541.98	0.00	54150.46	16391.52	1	1	0
503	823	1000	291	19	48	50927.22	0.00	50927.22	35139.78	15787.44	1	0	1
504	486	1000	304	105	4	26986.00	0.00	26986.00	24017.50	2968.50	1	0	1
505	257	1000	336	135	48	36672.40	0.00	36672.40	32271.70	4400.70	1	0	1
506	592	1	776	180	20	55485.93	55485.93	0.00	43263.07	12222.86	1	1	0
507	681	2	378	121	29	171713.20	171713.20	0.00	124214.42	47498.78	1	1	0
508	571	1	141	27	15	154749.73	154749.73	0.00	105190.34	49559.39	1	1	0
509	98	2	825	99	38	85767.41	85767.41	0.00	63889.68	21877.73	1	1	0
510	51	3	479	167	16	118297.08	118297.08	0.00	83380.00	34917.08	1	1	0
511	736	1000	808	24	14	45394.80	0.00	45394.80	34558.99	10835.81	1	0	1
512	8	1000	900	234	7	89519.49	0.00	89519.49	65629.35	23890.14	1	0	1
513	397	1000	218	162	29	50228.78	0.00	50228.78	41307.64	8921.14	1	0	1
514	672	4	669	93	33	4969.70	4969.70	0.00	3379.40	1590.30	1	1	0
515	673	2	203	188	18	90292.49	90292.49	0.00	78508.21	11784.28	1	1	0
516	354	1000	573	118	10	121671.98	0.00	121671.98	95285.74	26386.24	1	0	1
517	316	1000	281	196	27	158332.19	0.00	158332.19	108484.35	49847.84	1	0	1
518	143	1000	406	67	30	38851.68	0.00	38851.68	24097.94	14753.74	1	0	1
519	260	1000	220	239	19	84402.01	0.00	84402.01	59405.22	24996.79	1	0	1
520	866	1000	36	229	30	139515.70	0.00	139515.70	106294.10	33221.60	1	0	1
521	197	1	720	45	2	81855.51	81855.51	0.00	67256.99	14598.52	1	1	0
522	401	1000	652	71	41	23934.55	0.00	23934.55	20602.14	3332.41	1	0	1
523	684	1000	194	171	15	114622.16	0.00	114622.16	83810.82	30811.34	1	0	1
524	830	1000	500	130	34	61502.25	0.00	61502.25	43961.32	17540.93	1	0	1
525	351	1000	812	69	17	20277.84	0.00	20277.84	16830.58	3447.26	1	0	1
526	251	1	400	14	32	176223.98	176223.98	0.00	144656.14	31567.84	1	1	0
527	853	1000	755	29	32	181456.31	0.00	181456.31	145325.06	36131.25	1	0	1
528	377	4	300	19	49	126029.64	126029.64	0.00	90249.51	35780.13	1	1	0
529	701	2	185	102	38	127571.60	127571.60	0.00	107192.83	20378.77	1	1	0
530	686	1000	851	159	44	79007.75	0.00	79007.75	51346.72	27661.03	1	0	1
531	524	1000	279	28	18	9294.99	0.00	9294.99	8036.51	1258.48	1	0	1
532	639	1000	665	42	46	115718.88	0.00	115718.88	81291.64	34427.24	1	0	1
533	401	2	553	203	6	39869.63	39869.63	0.00	33598.13	6271.50	1	1	0
534	823	2	501	110	12	63996.31	63996.31	0.00	48112.87	15883.44	1	1	0
535	424	1	717	91	3	83436.42	83436.42	0.00	57418.14	26018.28	1	1	0
536	485	3	824	219	35	61574.66	61574.66	0.00	46515.95	15058.71	1	1	0
537	256	1000	524	63	29	67115.42	0.00	67115.42	54496.95	12618.47	1	0	1
538	747	3	708	148	26	30654.47	30654.47	0.00	23292.34	7362.13	1	1	0
539	360	4	579	39	10	4182.56	4182.56	0.00	2593.19	1589.37	1	1	0
540	866	1	263	76	48	15537.92	15537.92	0.00	9478.12	6059.80	1	1	0
541	781	1000	173	76	17	45848.78	0.00	45848.78	37782.45	8066.33	1	0	1
542	110	2	528	99	19	171686.89	171686.89	0.00	130159.37	41527.52	1	1	0
543	328	1	335	29	37	46582.88	46582.88	0.00	37274.16	9308.72	1	1	0
544	74	4	278	168	18	99231.34	99231.34	0.00	77928.58	21302.76	1	1	0
545	500	1000	971	234	49	165961.99	0.00	165961.99	127385.69	38576.30	1	0	1
546	696	3	938	36	34	30075.91	30075.91	0.00	20438.59	9637.32	1	1	0
547	260	1000	549	232	20	54889.02	0.00	54889.02	38724.58	16164.44	1	0	1
548	376	3	341	233	39	31083.20	31083.20	0.00	18960.76	12122.44	1	1	0
549	385	3	370	19	5	13501.80	13501.80	0.00	9181.20	4320.60	1	1	0
550	313	1000	841	151	18	112754.03	0.00	112754.03	87012.43	25741.60	1	0	1
551	740	1	465	225	35	107455.26	107455.26	0.00	74538.34	32916.92	1	1	0
552	474	3	519	126	3	97131.20	97131.20	0.00	83344.25	13786.95	1	1	0
553	417	1000	935	9	31	226671.79	0.00	226671.79	150553.14	76118.65	1	0	1
554	616	3	462	42	29	68142.42	68142.42	0.00	48319.12	19823.30	1	1	0
555	221	1000	152	223	8	89444.53	0.00	89444.53	62557.80	26886.73	1	0	1
556	254	1000	661	165	1	9043.10	0.00	9043.10	7033.59	2009.51	1	0	1
557	414	2	13	243	23	85204.84	85204.84	0.00	57203.71	28001.13	1	1	0
558	832	1	297	102	14	76127.99	76127.99	0.00	54620.38	21507.61	1	1	0
559	185	1	959	127	25	137590.62	137590.62	0.00	108146.67	29443.95	1	1	0
560	616	4	29	196	23	39404.91	39404.91	0.00	28962.05	10442.86	1	1	0
561	402	1000	995	210	14	19848.00	0.00	19848.00	12702.72	7145.28	1	0	1
562	73	1000	771	88	44	151121.02	0.00	151121.02	122125.38	28995.64	1	0	1
563	687	2	862	139	18	9033.38	9033.38	0.00	6614.93	2418.45	1	1	0
564	524	1000	814	80	50	86441.34	0.00	86441.34	71071.80	15369.54	1	0	1
565	333	1000	483	65	11	119064.64	0.00	119064.64	99121.58	19943.06	1	0	1
566	80	4	600	9	35	71834.14	71834.14	0.00	55620.69	16213.45	1	1	0
567	859	1000	227	28	23	31926.58	0.00	31926.58	27361.21	4565.37	1	0	1
568	326	1000	925	249	19	209461.33	0.00	209461.33	146252.21	63209.12	1	0	1
569	714	1000	974	80	13	72650.32	0.00	72650.32	49575.63	23074.69	1	0	1
570	153	1000	155	134	32	37669.05	0.00	37669.05	30511.89	7157.16	1	0	1
571	841	4	782	48	1	124550.39	124550.39	0.00	85808.40	38741.99	1	1	0
572	33	2	955	130	6	169814.13	169814.13	0.00	128043.96	41770.17	1	1	0
573	466	1000	36	86	49	212313.39	0.00	212313.39	158821.95	53491.44	1	0	1
574	524	3	134	55	44	121966.08	121966.08	0.00	95991.58	25974.50	1	1	0
575	475	1	132	178	3	166358.28	166358.28	0.00	118323.94	48034.34	1	1	0
576	66	1000	265	11	37	137803.97	0.00	137803.97	107484.86	30319.11	1	0	1
577	581	1000	655	112	20	22537.62	0.00	22537.62	15046.07	7491.55	1	0	1
578	801	1000	765	132	34	171949.79	0.00	171949.79	120014.62	51935.17	1	0	1
579	467	1000	504	241	28	30717.72	0.00	30717.72	24600.28	6117.44	1	0	1
580	38	1	379	62	27	22586.61	22586.61	0.00	15183.89	7402.72	1	1	0
581	462	1000	237	107	36	166403.45	0.00	166403.45	137041.16	29362.29	1	0	1
582	254	1	89	215	50	117548.58	117548.58	0.00	90320.91	27227.67	1	1	0
583	587	3	722	61	27	14365.12	14365.12	0.00	10055.60	4309.52	1	1	0
584	621	1000	489	29	9	202235.02	0.00	202235.02	154205.80	48029.22	1	0	1
585	634	3	980	44	5	20016.30	20016.30	0.00	13410.93	6605.37	1	1	0
586	15	2	809	99	2	187951.61	187951.61	0.00	129203.73	58747.88	1	1	0
587	649	1000	122	238	49	197145.10	0.00	197145.10	134016.19	63128.91	1	0	1
588	70	1000	195	249	15	17268.48	0.00	17268.48	13156.32	4112.16	1	0	1
589	376	1000	258	147	41	38072.28	0.00	38072.28	27143.55	10928.73	1	0	1
590	551	1	269	9	2	135096.46	135096.46	0.00	103479.62	31616.84	1	1	0
591	377	1000	747	46	20	109958.75	0.00	109958.75	89933.29	20025.46	1	0	1
592	427	3	528	221	30	34675.26	34675.26	0.00	21320.27	13354.99	1	1	0
593	20	4	377	244	38	33009.34	33009.34	0.00	28692.66	4316.68	1	1	0
594	699	1	748	101	26	37349.51	37349.51	0.00	32617.08	4732.43	1	1	0
595	349	1000	973	109	15	123700.74	0.00	123700.74	101089.47	22611.27	1	0	1
596	750	1	228	16	28	131273.75	131273.75	0.00	109236.21	22037.54	1	1	0
597	802	4	736	208	2	135177.92	135177.92	0.00	101224.95	33952.97	1	1	0
598	588	3	252	143	37	89292.69	89292.69	0.00	63193.49	26099.20	1	1	0
599	638	1000	148	97	40	179224.91	0.00	179224.91	129945.69	49279.22	1	0	1
600	414	2	172	115	38	161211.91	161211.91	0.00	130747.79	30464.12	1	1	0
601	724	2	487	228	6	174412.72	174412.72	0.00	126708.00	47704.72	1	1	0
602	831	4	160	117	50	10148.32	10148.32	0.00	8118.64	2029.68	1	1	0
603	268	1000	235	167	19	30927.60	0.00	30927.60	23504.96	7422.64	1	0	1
604	407	1000	307	190	45	165975.27	0.00	165975.27	118139.09	47836.18	1	0	1
605	131	1000	203	23	24	101029.36	0.00	101029.36	70711.24	30318.12	1	0	1
606	254	2	1070	184	17	67193.14	67193.14	0.00	52119.77	15073.37	1	1	0
607	608	3	435	177	45	58420.19	58420.19	0.00	46745.95	11674.24	1	1	0
608	422	1000	290	39	27	86615.07	0.00	86615.07	73322.30	13292.77	1	0	1
609	801	1000	850	56	1	51879.39	0.00	51879.39	35094.36	16785.03	1	0	1
610	822	2	35	207	6	68960.13	68960.13	0.00	49926.24	19033.89	1	1	0
611	306	1	31	159	8	120320.43	120320.43	0.00	87701.20	32619.23	1	1	0
612	353	1000	885	132	2	82624.29	0.00	82624.29	69877.80	12746.49	1	0	1
613	507	2	791	45	20	78110.85	78110.85	0.00	52185.08	25925.77	1	1	0
614	186	4	123	67	17	104846.75	104846.75	0.00	88313.07	16533.68	1	1	0
615	255	1000	302	48	12	47632.80	0.00	47632.80	32390.32	15242.48	1	0	1
616	182	1000	569	158	11	72670.77	0.00	72670.77	60727.05	11943.72	1	0	1
617	230	1000	708	22	36	143966.31	0.00	143966.31	103296.87	40669.44	1	0	1
618	256	1	920	50	25	92886.13	92886.13	0.00	63077.92	29808.21	1	1	0
619	408	1000	435	126	18	30915.34	0.00	30915.34	21802.02	9113.32	1	0	1
620	236	2	423	251	35	135514.05	135514.05	0.00	99514.37	35999.68	1	1	0
621	254	2	759	108	47	47004.91	47004.91	0.00	37865.57	9139.34	1	1	0
622	482	2	471	12	3	1287.68	1287.68	0.00	1133.16	154.52	1	1	0
623	738	1000	712	173	7	131107.22	0.00	131107.22	98324.68	32782.54	1	0	1
624	244	1	676	245	11	37037.15	37037.15	0.00	30591.96	6445.19	1	1	0
625	165	1000	580	221	38	18209.01	0.00	18209.01	15295.56	2913.45	1	0	1
626	241	4	185	23	40	74079.46	74079.46	0.00	58535.41	15544.05	1	1	0
627	242	3	541	148	34	7013.90	7013.90	0.00	5540.98	1472.92	1	1	0
628	710	1000	549	227	49	62146.36	0.00	62146.36	44584.57	17561.79	1	0	1
629	254	3	1028	9	36	141418.79	141418.79	0.00	97850.06	43568.73	1	1	0
630	237	1	701	209	2	125606.18	125606.18	0.00	91031.91	34574.27	1	1	0
631	181	3	233	140	29	74102.24	74102.24	0.00	47173.03	26929.21	1	1	0
632	570	2	990	22	6	144833.50	144833.50	0.00	111259.75	33573.75	1	1	0
633	437	2	457	236	45	236100.25	236100.25	0.00	188286.47	47813.78	1	1	0
634	838	1000	257	125	41	59389.24	0.00	59389.24	44641.85	14747.39	1	0	1
635	828	3	414	122	7	19184.58	19184.58	0.00	14580.30	4604.28	1	1	0
636	616	1000	749	94	15	4150.68	0.00	4150.68	3403.56	747.12	1	0	1
637	258	1000	88	217	34	85207.67	0.00	85207.67	66903.16	18304.51	1	0	1
638	65	2	954	114	20	52927.71	52927.71	0.00	40116.83	12810.88	1	1	0
639	514	1000	438	128	32	110791.91	0.00	110791.91	97507.07	13284.84	1	0	1
640	254	4	1188	63	44	75363.10	75363.10	0.00	48232.40	27130.70	1	1	0
641	833	1000	933	112	22	109182.70	0.00	109182.70	78907.10	30275.60	1	0	1
642	331	2	702	124	23	229381.74	229381.74	0.00	164980.94	64400.80	1	1	0
643	298	1000	61	97	15	16060.02	0.00	16060.02	9636.00	6424.02	1	0	1
644	14	1000	857	148	45	109101.20	0.00	109101.20	76622.86	32478.34	1	0	1
645	369	3	172	220	33	45292.81	45292.81	0.00	33834.14	11458.67	1	1	0
646	254	3	904	88	2	107313.51	107313.51	0.00	80673.56	26639.95	1	1	0
647	205	1000	577	247	36	17653.92	0.00	17653.92	14514.94	3138.98	1	0	1
648	334	1000	155	74	11	69942.96	0.00	69942.96	47693.24	22249.72	1	0	1
649	389	1000	547	132	6	104063.70	0.00	104063.70	76865.81	27197.89	1	0	1
650	13	1000	219	145	9	85764.44	0.00	85764.44	61891.03	23873.41	1	0	1
651	131	3	178	52	11	111376.17	111376.17	0.00	79007.88	32368.29	1	1	0
652	434	2	556	29	2	233021.23	233021.23	0.00	183226.20	49795.03	1	1	0
653	795	1	754	243	18	179792.26	179792.26	0.00	150227.79	29564.47	1	1	0
654	254	2	413	163	18	55046.53	55046.53	0.00	43397.22	11649.31	1	1	0
655	493	1000	494	68	3	158655.44	0.00	158655.44	124252.87	34402.57	1	0	1
656	519	4	85	68	19	42179.02	42179.02	0.00	34623.04	7555.98	1	1	0
657	713	1	569	148	29	2805.81	2805.81	0.00	2328.82	476.99	1	1	0
658	721	1000	147	44	45	26477.97	0.00	26477.97	22221.58	4256.39	1	0	1
659	546	1	347	187	25	147668.95	147668.95	0.00	106356.75	41312.20	1	1	0
660	595	1000	98	250	32	76899.48	0.00	76899.48	51251.72	25647.76	1	0	1
661	875	1000	605	133	19	90023.94	0.00	90023.94	65149.36	24874.58	1	0	1
662	113	1000	136	152	43	170430.81	0.00	170430.81	113398.45	57032.36	1	0	1
663	101	1000	709	132	15	57968.31	0.00	57968.31	43287.91	14680.40	1	0	1
664	254	1000	661	196	38	67363.62	0.00	67363.62	42758.82	24604.80	1	0	1
665	565	1000	430	106	1	191401.52	0.00	191401.52	144750.49	46651.03	1	0	1
666	75	1000	224	153	36	29729.42	0.00	29729.42	25270.00	4459.42	1	0	1
667	594	3	218	21	49	85643.00	85643.00	0.00	55668.00	29975.00	1	1	0
668	69	1000	383	235	10	77363.29	0.00	77363.29	51265.20	26098.09	1	0	1
669	705	3	266	24	30	129994.94	129994.94	0.00	109737.30	20257.64	1	1	0
670	542	1	262	102	34	16559.20	16559.20	0.00	13081.80	3477.40	1	1	0
671	650	4	856	64	9	125209.06	125209.06	0.00	96635.25	28573.81	1	1	0
672	662	1000	442	64	50	72317.91	0.00	72317.91	60236.22	12081.69	1	0	1
673	293	4	694	229	29	137656.92	137656.92	0.00	100643.44	37013.48	1	1	0
674	705	1000	551	71	45	8468.84	0.00	8468.84	5758.82	2710.02	1	0	1
675	150	1000	598	244	30	177033.71	0.00	177033.71	125724.75	51308.96	1	0	1
676	242	1000	590	223	48	94656.29	0.00	94656.29	68365.17	26291.12	1	0	1
677	284	1000	654	103	31	112345.51	0.00	112345.51	98572.93	13772.58	1	0	1
678	760	1000	43	180	16	88606.26	0.00	88606.26	60133.78	28472.48	1	0	1
679	582	1000	531	51	13	75786.90	0.00	75786.90	59113.80	16673.10	1	0	1
680	251	4	974	164	22	152947.65	152947.65	0.00	117456.26	35491.39	1	1	0
681	222	1000	958	57	7	135433.04	0.00	135433.04	97214.72	38218.32	1	0	1
682	290	3	198	127	48	124324.74	124324.74	0.00	99372.43	24952.31	1	1	0
683	175	1000	130	61	13	46234.91	0.00	46234.91	32458.26	13776.65	1	0	1
685	122	1000	714	63	5	64041.81	0.00	64041.81	44418.48	19623.33	1	0	1
686	852	1000	21	64	35	77357.17	0.00	77357.17	55572.02	21785.15	1	0	1
687	229	1	77	72	15	212059.93	212059.93	0.00	175649.18	36410.75	1	1	0
688	808	1000	901	85	41	160327.54	0.00	160327.54	127253.19	33074.35	1	0	1
689	652	3	912	152	34	10702.65	10702.65	0.00	7714.82	2987.83	1	1	0
690	706	1000	713	22	6	143997.89	0.00	143997.89	111470.12	32527.77	1	0	1
691	874	1000	307	49	9	191997.86	0.00	191997.86	150735.17	41262.69	1	0	1
692	250	1000	563	200	15	33356.94	0.00	33356.94	20681.28	12675.66	1	0	1
693	485	2	458	107	27	85299.14	85299.14	0.00	66503.73	18795.41	1	1	0
694	513	1000	202	158	35	156920.91	0.00	156920.91	110693.39	46227.52	1	0	1
695	766	1000	686	94	36	120604.46	0.00	120604.46	85836.21	34768.25	1	0	1
696	364	1000	305	91	8	157960.21	0.00	157960.21	118366.30	39593.91	1	0	1
697	207	3	260	214	35	107705.68	107705.68	0.00	84977.35	22728.33	1	1	0
698	720	1000	795	67	47	106573.88	0.00	106573.88	67597.47	38976.41	1	0	1
699	578	2	560	145	42	107516.72	107516.72	0.00	81134.37	26382.35	1	1	0
700	443	1	448	30	30	60923.47	60923.47	0.00	41989.55	18933.92	1	1	0
701	358	1	365	36	29	213664.05	213664.05	0.00	170382.90	43281.15	1	1	0
702	310	4	461	81	29	83927.32	83927.32	0.00	63985.39	19941.93	1	1	0
703	426	1000	403	107	16	39252.36	0.00	39252.36	27052.80	12199.56	1	0	1
704	673	1000	64	198	10	196269.65	0.00	196269.65	133405.16	62864.49	1	0	1
705	198	4	439	87	33	36790.67	36790.67	0.00	31687.06	5103.61	1	1	0
706	18	3	382	240	5	7494.88	7494.88	0.00	5546.22	1948.66	1	1	0
707	877	1000	234	31	44	201371.51	0.00	201371.51	136465.24	64906.27	1	0	1
708	258	4	252	240	27	203454.56	203454.56	0.00	148118.59	55335.97	1	1	0
709	794	1000	579	245	32	153779.73	0.00	153779.73	102168.62	51611.11	1	0	1
710	68	2	581	221	34	48586.37	48586.37	0.00	37036.17	11550.20	1	1	0
711	434	4	85	127	9	4267.20	4267.20	0.00	3584.40	682.80	1	1	0
712	605	1000	144	105	1	12443.65	0.00	12443.65	10412.37	2031.28	1	0	1
713	670	3	97	90	15	73414.86	73414.86	0.00	55728.97	17685.89	1	1	0
714	805	1000	347	80	31	108423.32	0.00	108423.32	69515.49	38907.83	1	0	1
715	569	2	435	166	48	13841.30	13841.30	0.00	8996.84	4844.46	1	1	0
716	246	1000	985	198	17	149171.82	0.00	149171.82	120054.29	29117.53	1	0	1
717	540	1000	648	86	47	85259.48	0.00	85259.48	65867.24	19392.24	1	0	1
718	27	1000	9	43	23	76764.47	0.00	76764.47	58233.10	18531.37	1	0	1
719	755	4	540	104	44	154963.49	154963.49	0.00	124192.98	30770.51	1	1	0
720	260	1	258	35	19	190973.12	190973.12	0.00	141263.28	49709.84	1	1	0
721	810	1000	599	20	6	97539.47	0.00	97539.47	77299.66	20239.81	1	0	1
722	500	3	627	179	29	123908.35	123908.35	0.00	98353.03	25555.32	1	1	0
723	39	1000	661	188	26	36831.06	0.00	36831.06	24676.82	12154.24	1	0	1
724	388	1000	653	12	1	40258.07	0.00	40258.07	28487.87	11770.20	1	0	1
725	183	1000	353	240	38	203016.31	0.00	203016.31	172397.69	30618.62	1	0	1
726	250	1000	360	181	32	103742.75	0.00	103742.75	73509.86	30232.89	1	0	1
727	145	1	861	165	9	28281.64	28281.64	0.00	20645.60	7636.04	1	1	0
728	321	4	487	53	12	84190.00	84190.00	0.00	60658.75	23531.25	1	1	0
729	530	1000	19	64	21	3291.48	0.00	3291.48	2304.04	987.44	1	0	1
730	590	1000	843	216	10	198380.12	0.00	198380.12	150422.88	47957.24	1	0	1
731	579	1000	718	84	45	154654.58	0.00	154654.58	117805.34	36849.24	1	0	1
732	806	1000	92	37	3	132574.53	0.00	132574.53	105115.64	27458.89	1	0	1
733	792	1000	535	6	48	107310.86	0.00	107310.86	71635.16	35675.70	1	0	1
734	644	1000	995	173	22	233819.99	0.00	233819.99	181085.45	52734.54	1	0	1
735	746	1000	858	206	24	33731.04	0.00	33731.04	26216.22	7514.82	1	0	1
736	107	1000	359	28	8	132046.51	0.00	132046.51	114760.51	17286.00	1	0	1
737	136	3	35	241	35	18403.26	18403.26	0.00	13986.48	4416.78	1	1	0
738	704	3	645	236	10	208575.14	208575.14	0.00	153096.79	55478.35	1	1	0
739	218	1	346	172	11	126509.22	126509.22	0.00	102639.79	23869.43	1	1	0
740	720	1000	910	153	10	239960.03	0.00	239960.03	182939.57	57020.46	1	0	1
741	130	1000	207	187	37	64005.70	0.00	64005.70	52640.51	11365.19	1	0	1
742	374	2	683	74	26	51791.16	51791.16	0.00	36685.86	15105.30	1	1	0
743	580	2	89	204	37	28014.72	28014.72	0.00	20730.90	7283.82	1	1	0
744	326	1000	216	220	43	26450.44	0.00	26450.44	17930.09	8520.35	1	0	1
745	847	2	158	182	48	96807.30	96807.30	0.00	65885.58	30921.72	1	1	0
746	697	1000	928	29	3	15116.04	0.00	15116.04	12243.96	2872.08	1	0	1
747	631	1	177	14	2	152690.51	152690.51	0.00	114963.64	37726.87	1	1	0
748	693	1000	191	133	3	43309.04	0.00	43309.04	29024.29	14284.75	1	0	1
749	563	1000	262	62	29	45664.88	0.00	45664.88	37737.11	7927.77	1	0	1
750	391	1000	807	205	47	174428.15	0.00	174428.15	134332.14	40096.01	1	0	1
751	498	2	686	32	27	115946.42	115946.42	0.00	85607.60	30338.82	1	1	0
752	316	1	778	237	39	36248.52	36248.52	0.00	31933.47	4315.05	1	1	0
753	295	1000	11	80	50	98117.70	0.00	98117.70	58870.60	39247.10	1	0	1
754	596	1000	56	188	33	96760.43	0.00	96760.43	73116.06	23644.37	1	0	1
755	302	4	218	162	20	114800.33	114800.33	0.00	95360.81	19439.52	1	1	0
756	616	1000	172	230	44	40801.95	0.00	40801.95	31825.50	8976.45	1	0	1
757	259	1	324	1	31	14651.70	14651.70	0.00	9670.14	4981.56	1	1	0
758	384	4	268	41	13	69698.62	69698.62	0.00	49182.21	20516.41	1	1	0
759	570	1000	556	209	39	94099.78	0.00	94099.78	77629.43	16470.35	1	0	1
760	807	2	169	181	20	44672.46	44672.46	0.00	35586.99	9085.47	1	1	0
761	386	4	977	131	25	28039.54	28039.54	0.00	22974.74	5064.80	1	1	0
762	296	1000	305	27	21	53606.06	0.00	53606.06	45150.60	8455.46	1	0	1
763	138	4	800	60	46	14662.12	14662.12	0.00	12566.65	2095.47	1	1	0
764	48	1000	931	30	35	93088.71	0.00	93088.71	66705.78	26382.93	1	0	1
765	313	1	218	151	30	143222.31	143222.31	0.00	121596.81	21625.50	1	1	0
766	547	1	671	103	44	105668.26	105668.26	0.00	84099.26	21569.00	1	1	0
767	216	3	916	72	6	106724.83	106724.83	0.00	91949.75	14775.08	1	1	0
768	506	1000	812	173	2	129651.09	0.00	129651.09	92625.46	37025.63	1	0	1
769	14	1000	923	207	49	15742.03	0.00	15742.03	12370.38	3371.65	1	0	1
770	193	3	550	139	20	121286.35	121286.35	0.00	86228.25	35058.10	1	1	0
771	327	1	213	217	44	52280.11	52280.11	0.00	42052.93	10227.18	1	1	0
772	670	4	868	4	22	73407.52	73407.52	0.00	61107.94	12299.58	1	1	0
773	161	1000	315	1	30	179862.76	0.00	179862.76	136999.38	42863.38	1	0	1
774	121	1000	778	111	29	47587.94	0.00	47587.94	34038.94	13549.00	1	0	1
775	91	2	654	37	29	26218.29	26218.29	0.00	18352.80	7865.49	1	1	0
776	425	2	515	66	18	160532.64	160532.64	0.00	135792.23	24740.41	1	1	0
777	343	1000	55	227	41	27624.91	0.00	27624.91	17204.10	10420.81	1	0	1
778	305	1000	376	132	44	57198.41	0.00	57198.41	40976.88	16221.53	1	0	1
779	254	1000	767	221	10	230791.62	0.00	230791.62	170222.01	60569.61	1	0	1
780	581	1000	164	229	3	47011.40	0.00	47011.40	36589.02	10422.38	1	0	1
781	377	1000	240	244	39	24925.26	0.00	24925.26	17447.67	7477.59	1	0	1
782	389	1000	893	237	20	37171.52	0.00	37171.52	24161.48	13010.04	1	0	1
783	205	4	752	19	42	172211.04	172211.04	0.00	143977.74	28233.30	1	1	0
784	254	3	498	184	10	126314.40	126314.40	0.00	97887.93	28426.47	1	1	0
785	560	1000	721	109	6	60214.67	0.00	60214.67	37417.55	22797.12	1	0	1
786	793	2	677	184	12	93144.13	93144.13	0.00	68337.18	24806.95	1	1	0
787	685	1000	618	70	29	122410.24	0.00	122410.24	98143.76	24266.48	1	0	1
788	457	2	47	86	9	171674.17	171674.17	0.00	123709.85	47964.32	1	1	0
789	508	1000	685	243	10	133748.85	0.00	133748.85	104096.71	29652.14	1	0	1
790	253	3	570	169	24	60970.09	60970.09	0.00	49944.95	11025.14	1	1	0
791	156	1	127	212	46	30162.30	30162.30	0.00	22832.22	7330.08	1	1	0
792	547	1000	37	80	10	131494.88	0.00	131494.88	106994.97	24499.91	1	0	1
793	132	3	347	192	45	126754.92	126754.92	0.00	97601.23	29153.69	1	1	0
794	304	2	908	249	27	17535.79	17535.79	0.00	13225.74	4310.05	1	1	0
795	299	3	648	169	50	53517.29	53517.29	0.00	39231.99	14285.30	1	1	0
796	877	1000	44	158	4	171942.91	0.00	171942.91	124408.70	47534.21	1	0	1
797	260	3	58	178	16	113165.23	113165.23	0.00	85008.21	28157.02	1	1	0
798	127	1000	382	21	20	32849.75	0.00	32849.75	25951.30	6898.45	1	0	1
799	661	4	586	176	24	153627.13	153627.13	0.00	106002.48	47624.65	1	1	0
800	56	2	162	78	9	60062.74	60062.74	0.00	50885.68	9177.06	1	1	0
801	435	4	95	37	16	218520.94	218520.94	0.00	167349.74	51171.20	1	1	0
802	173	3	909	203	10	170789.72	170789.72	0.00	133782.09	37007.63	1	1	0
803	216	1000	80	203	19	63540.30	0.00	63540.30	44075.00	19465.30	1	0	1
804	573	1000	868	206	19	122108.25	0.00	122108.25	93297.98	28810.27	1	0	1
805	352	1000	343	91	10	11868.54	0.00	11868.54	8782.74	3085.80	1	0	1
806	62	1000	578	68	34	8753.05	0.00	8753.05	6214.65	2538.40	1	0	1
807	165	3	444	73	16	123825.52	123825.52	0.00	93438.50	30387.02	1	1	0
808	209	1	460	182	45	45832.65	45832.65	0.00	33940.58	11892.07	1	1	0
809	851	1000	643	176	40	14876.38	0.00	14876.38	11925.22	2951.16	1	0	1
810	254	4	327	113	19	3164.64	3164.64	0.00	2816.52	348.12	1	1	0
811	369	1000	779	247	34	60554.17	0.00	60554.17	51936.95	8617.22	1	0	1
812	42	1	567	147	17	47668.62	47668.62	0.00	37188.93	10479.69	1	1	0
813	437	1000	856	129	23	32308.20	0.00	32308.20	24170.69	8137.51	1	0	1
814	35	2	874	56	21	123123.85	123123.85	0.00	98866.75	24257.10	1	1	0
815	69	4	999	10	12	3832.26	3832.26	0.00	3027.49	804.77	1	1	0
816	66	1000	85	239	14	32416.26	0.00	32416.26	24312.18	8104.08	1	0	1
817	339	1000	480	231	18	20197.17	0.00	20197.17	15646.98	4550.19	1	0	1
818	236	4	115	88	24	163534.65	163534.65	0.00	112360.99	51173.66	1	1	0
819	827	1	636	14	20	123439.34	123439.34	0.00	91412.32	32027.02	1	1	0
820	91	3	94	214	5	115308.82	115308.82	0.00	80048.92	35259.90	1	1	0
821	691	4	314	226	43	33152.79	33152.79	0.00	25287.13	7865.66	1	1	0
822	80	4	766	19	36	121130.26	121130.26	0.00	103438.94	17691.32	1	1	0
823	9	2	930	240	37	16607.72	16607.72	0.00	11957.56	4650.16	1	1	0
824	209	1	796	208	5	135115.73	135115.73	0.00	97267.42	37848.31	1	1	0
825	408	1000	590	74	33	102115.66	0.00	102115.66	69893.82	32221.84	1	0	1
826	420	1000	338	40	24	29936.77	0.00	29936.77	24649.79	5286.98	1	0	1
827	386	4	572	93	47	158501.46	158501.46	0.00	126524.16	31977.30	1	1	0
828	99	1000	588	2	32	105747.05	0.00	105747.05	72985.65	32761.40	1	0	1
829	10	4	386	90	29	191414.23	191414.23	0.00	138111.47	53302.76	1	1	0
830	75	1000	499	104	41	122123.29	0.00	122123.29	95041.75	27081.54	1	0	1
831	400	1	765	102	39	100539.63	100539.63	0.00	75449.89	25089.74	1	1	0
832	629	1000	382	200	43	27062.53	0.00	27062.53	21403.77	5658.76	1	0	1
833	111	4	600	174	11	44109.27	44109.27	0.00	32640.83	11468.44	1	1	0
834	165	1000	247	231	47	93683.80	0.00	93683.80	69255.36	24428.44	1	0	1
835	7	4	279	161	30	135542.44	135542.44	0.00	83365.23	52177.21	1	1	0
2432	254	4	781	180	27	137937.00	137937.00	0.00	105268.30	32668.70	1	1	0
836	318	2	536	129	33	57766.48	57766.48	0.00	35237.52	22528.96	1	1	0
837	302	4	886	148	1	110250.70	110250.70	0.00	75853.42	34397.28	1	1	0
838	390	1000	675	45	17	36015.86	0.00	36015.86	28669.12	7346.74	1	0	1
839	235	1000	666	29	19	9348.08	0.00	9348.08	6637.12	2710.96	1	0	1
840	564	1000	211	5	7	79317.97	0.00	79317.97	54989.52	24328.45	1	0	1
841	495	1000	75	166	47	11520.18	0.00	11520.18	8064.14	3456.04	1	0	1
842	147	1000	265	185	12	140546.98	0.00	140546.98	112796.82	27750.16	1	0	1
843	642	2	383	1	46	22437.62	22437.62	0.00	16082.81	6354.81	1	1	0
844	586	2	744	145	24	109298.97	109298.97	0.00	89071.63	20227.34	1	1	0
845	196	4	5	188	2	29441.16	29441.16	0.00	25908.21	3532.95	1	1	0
846	320	4	744	118	29	225931.27	225931.27	0.00	173898.62	52032.65	1	1	0
847	280	1000	391	233	22	40356.22	0.00	40356.22	28027.66	12328.56	1	0	1
848	734	1000	993	51	18	48878.36	0.00	48878.36	37708.13	11170.23	1	0	1
849	233	1000	333	150	35	31251.01	0.00	31251.01	22404.78	8846.23	1	0	1
850	693	1000	752	28	17	145533.16	0.00	145533.16	100889.56	44643.60	1	0	1
851	162	1	674	87	16	7671.69	7671.69	0.00	4913.50	2758.19	1	1	0
852	346	1000	466	101	45	34066.96	0.00	34066.96	26781.69	7285.27	1	0	1
853	161	1	618	218	44	140149.05	140149.05	0.00	102207.23	37941.82	1	1	0
854	246	2	908	145	13	10472.30	10472.30	0.00	8692.00	1780.30	1	1	0
855	669	1000	711	50	19	84891.19	0.00	84891.19	69382.76	15508.43	1	0	1
856	350	1000	234	171	34	78026.27	0.00	78026.27	64389.85	13636.42	1	0	1
857	776	4	657	165	37	173086.16	173086.16	0.00	124537.49	48548.67	1	1	0
858	821	1000	164	140	33	84280.12	0.00	84280.12	60649.34	23630.78	1	0	1
859	187	3	700	24	19	199711.30	199711.30	0.00	159997.32	39713.98	1	1	0
860	695	4	392	191	46	96093.04	96093.04	0.00	79593.93	16499.11	1	1	0
861	254	4	1031	29	17	96578.21	96578.21	0.00	74488.09	22090.12	1	1	0
862	855	1000	73	100	38	79760.30	0.00	79760.30	56188.74	23571.56	1	0	1
863	234	1	469	247	50	69114.27	69114.27	0.00	54387.84	14726.43	1	1	0
864	856	2	552	201	18	257501.40	257501.40	0.00	192730.54	64770.86	1	1	0
865	853	1000	409	210	31	91418.75	0.00	91418.75	72291.01	19127.74	1	0	1
866	565	1000	124	65	48	121160.15	0.00	121160.15	100076.48	21083.67	1	0	1
867	876	1	906	185	17	63946.80	63946.80	0.00	46921.26	17025.54	1	1	0
868	562	1	980	48	50	72229.98	72229.98	0.00	50150.04	22079.94	1	1	0
869	273	1000	135	30	6	710.10	0.00	710.10	546.78	163.32	1	0	1
870	119	1	56	247	13	153377.27	153377.27	0.00	115291.60	38085.67	1	1	0
871	417	1000	381	193	42	128004.64	0.00	128004.64	94808.13	33196.51	1	0	1
872	413	1000	236	236	42	69238.37	0.00	69238.37	47954.60	21283.77	1	0	1
873	254	1000	928	9	20	165447.49	0.00	165447.49	128582.64	36864.85	1	0	1
874	324	3	141	153	7	149285.55	149285.55	0.00	110352.45	38933.10	1	1	0
875	603	1000	183	166	16	11861.04	0.00	11861.04	7353.84	4507.20	1	0	1
876	189	1	811	128	21	63738.27	63738.27	0.00	40155.12	23583.15	1	1	0
877	837	1000	660	211	13	19240.90	0.00	19240.90	13853.45	5387.45	1	0	1
878	439	1000	657	20	18	29376.92	0.00	29376.92	20563.84	8813.08	1	0	1
879	591	1000	627	229	44	27802.97	0.00	27802.97	20952.40	6850.57	1	0	1
880	650	4	406	124	39	76752.59	76752.59	0.00	56540.53	20212.06	1	1	0
881	12	1	782	155	22	68653.46	68653.46	0.00	48952.37	19701.09	1	1	0
882	33	1000	406	109	45	54231.93	0.00	54231.93	42300.90	11931.03	1	0	1
883	381	1000	62	94	31	7765.94	0.00	7765.94	6601.04	1164.90	1	0	1
884	486	4	611	28	5	16414.80	16414.80	0.00	12639.36	3775.44	1	1	0
885	259	3	993	195	1	141731.19	141731.19	0.00	103380.69	38350.50	1	1	0
886	201	4	65	137	46	22235.30	22235.30	0.00	15120.00	7115.30	1	1	0
887	704	2	363	74	20	54647.79	54647.79	0.00	39858.26	14789.53	1	1	0
888	101	1000	273	130	5	193536.90	0.00	193536.90	143731.66	49805.24	1	0	1
889	65	1000	784	146	23	144982.50	0.00	144982.50	102413.02	42569.48	1	0	1
890	863	1	483	64	43	35621.19	35621.19	0.00	24888.51	10732.68	1	1	0
891	191	4	474	137	45	39177.64	39177.64	0.00	30856.73	8320.91	1	1	0
892	23	2	61	46	24	16701.84	16701.84	0.00	11691.28	5010.56	1	1	0
893	336	1000	567	133	42	65684.82	0.00	65684.82	42528.74	23156.08	1	0	1
894	867	1000	546	196	48	29907.28	0.00	29907.28	19680.02	10227.26	1	0	1
895	657	3	342	4	40	2046.68	2046.68	0.00	1248.48	798.20	1	1	0
896	245	1	139	234	4	26825.82	26825.82	0.00	21192.43	5633.39	1	1	0
897	2	4	530	239	13	8086.60	8086.60	0.00	5418.02	2668.58	1	1	0
898	826	1000	828	199	39	124721.01	0.00	124721.01	102195.10	22525.91	1	0	1
899	680	1	900	66	41	70311.82	70311.82	0.00	54511.26	15800.56	1	1	0
900	473	1000	803	64	25	96354.15	0.00	96354.15	78647.94	17706.21	1	0	1
901	373	1000	134	48	46	137164.52	0.00	137164.52	99851.23	37313.29	1	0	1
902	452	1000	62	221	20	161397.92	0.00	161397.92	132268.79	29129.13	1	0	1
903	815	1	179	96	44	57946.56	57946.56	0.00	42794.01	15152.55	1	1	0
904	574	1000	634	193	42	64820.07	0.00	64820.07	48913.29	15906.78	1	0	1
905	838	2	248	164	48	95922.98	95922.98	0.00	68200.63	27722.35	1	1	0
906	74	1000	476	168	26	91214.59	0.00	91214.59	70029.44	21185.15	1	0	1
907	762	1000	863	134	42	117867.71	0.00	117867.71	87134.03	30733.68	1	0	1
908	32	1000	176	231	38	56956.40	0.00	56956.40	43286.88	13669.52	1	0	1
909	142	3	538	127	48	125716.53	125716.53	0.00	94838.89	30877.64	1	1	0
910	615	2	160	56	50	175681.61	175681.61	0.00	125520.31	50161.30	1	1	0
911	254	1000	406	16	5	105102.03	0.00	105102.03	75969.18	29132.85	1	0	1
912	851	2	207	107	22	43683.98	43683.98	0.00	34458.66	9225.32	1	1	0
913	86	1000	75	192	44	106545.26	0.00	106545.26	69601.11	36944.15	1	0	1
914	635	1000	673	137	30	25385.70	0.00	25385.70	17770.00	7615.70	1	0	1
915	853	1000	673	164	8	29252.94	0.00	29252.94	22281.19	6971.75	1	0	1
916	584	1000	428	122	26	110925.10	0.00	110925.10	88039.40	22885.70	1	0	1
917	262	1000	191	107	31	113427.64	0.00	113427.64	92959.42	20468.22	1	0	1
918	148	3	302	244	25	30650.40	30650.40	0.00	20535.76	10114.64	1	1	0
919	648	1000	161	37	26	55138.68	0.00	55138.68	40802.58	14336.10	1	0	1
920	41	1	606	72	37	69730.43	69730.43	0.00	51313.53	18416.90	1	1	0
921	591	1000	190	208	23	207869.72	0.00	207869.72	156418.70	51451.02	1	0	1
922	646	1000	604	155	25	81656.00	0.00	81656.00	58991.87	22664.13	1	0	1
923	415	1000	980	113	42	122479.14	0.00	122479.14	82322.34	40156.80	1	0	1
924	332	1000	907	107	7	73993.38	0.00	73993.38	51057.17	22936.21	1	0	1
925	458	3	660	199	19	23271.90	23271.90	0.00	19617.81	3654.09	1	1	0
926	489	1000	778	84	10	219712.22	0.00	219712.22	182991.96	36720.26	1	0	1
927	614	3	339	231	14	141009.42	141009.42	0.00	109739.40	31270.02	1	1	0
928	538	1000	207	194	35	70745.20	0.00	70745.20	53716.98	17028.22	1	0	1
929	649	1	689	87	45	150886.31	150886.31	0.00	100442.52	50443.79	1	1	0
930	253	2	633	18	39	47872.63	47872.63	0.00	40365.24	7507.39	1	1	0
931	796	1000	698	58	4	45296.83	0.00	45296.83	34186.18	11110.65	1	0	1
932	517	1000	118	238	42	111665.30	0.00	111665.30	88357.58	23307.72	1	0	1
933	247	1	627	16	47	135692.18	135692.18	0.00	101646.04	34046.14	1	1	0
934	207	1000	612	140	9	9976.16	0.00	9976.16	7382.32	2593.84	1	0	1
935	544	1	784	100	1	182298.51	182298.51	0.00	135248.38	47050.13	1	1	0
936	134	1	788	47	47	14196.50	14196.50	0.00	12351.00	1845.50	1	1	0
937	254	1000	100	140	4	149451.85	0.00	149451.85	122477.23	26974.62	1	0	1
938	142	4	492	139	5	18884.52	18884.52	0.00	14163.39	4721.13	1	1	0
939	712	3	962	97	25	19022.60	19022.60	0.00	16930.10	2092.50	1	1	0
940	24	1000	586	49	16	95160.08	0.00	95160.08	72363.74	22796.34	1	0	1
941	744	3	649	190	11	116131.05	116131.05	0.00	82212.78	33918.27	1	1	0
942	657	1000	723	170	42	170159.86	0.00	170159.86	122999.36	47160.50	1	0	1
943	390	1	806	60	33	109075.86	109075.86	0.00	79893.16	29182.70	1	1	0
944	735	2	578	200	32	31248.80	31248.80	0.00	21874.20	9374.60	1	1	0
945	482	1000	446	147	39	149590.91	0.00	149590.91	108625.20	40965.71	1	0	1
946	102	3	275	17	8	89072.06	89072.06	0.00	65169.09	23902.97	1	1	0
947	22	1000	475	3	47	45852.59	0.00	45852.59	33944.71	11907.88	1	0	1
948	825	3	611	235	21	83571.73	83571.73	0.00	54883.14	28688.59	1	1	0
949	114	3	90	247	36	105433.45	105433.45	0.00	90140.06	15293.39	1	1	0
950	258	1000	287	130	32	60149.48	0.00	60149.48	51861.92	8287.56	1	0	1
951	137	1000	803	67	27	79486.40	0.00	79486.40	54589.64	24896.76	1	0	1
952	253	2	742	106	12	201357.20	201357.20	0.00	156230.34	45126.86	1	1	0
953	158	2	757	218	47	40051.08	40051.08	0.00	31239.81	8811.27	1	1	0
954	256	2	133	201	2	5756.52	5756.52	0.00	4649.48	1107.04	1	1	0
955	288	1000	202	60	38	10943.30	0.00	10943.30	7879.20	3064.10	1	0	1
956	403	1000	5	86	14	51399.04	0.00	51399.04	36010.82	15388.22	1	0	1
957	37	1	960	92	2	43352.67	43352.67	0.00	30973.26	12379.41	1	1	0
958	754	1000	473	184	5	63555.20	0.00	63555.20	41310.88	22244.32	1	0	1
959	669	3	626	180	29	89527.68	89527.68	0.00	59088.24	30439.44	1	1	0
960	142	2	705	48	37	222031.21	222031.21	0.00	181837.05	40194.16	1	1	0
961	660	1000	71	170	4	117359.04	0.00	117359.04	92031.36	25327.68	1	0	1
962	254	3	559	207	25	7382.61	7382.61	0.00	6201.39	1181.22	1	1	0
963	852	1000	264	37	20	109031.50	0.00	109031.50	76052.72	32978.78	1	0	1
964	153	4	322	118	20	36988.62	36988.62	0.00	26815.91	10172.71	1	1	0
965	691	1000	654	159	29	7200.06	0.00	7200.06	5544.04	1656.02	1	0	1
966	162	1000	305	148	41	44063.02	0.00	44063.02	37012.96	7050.06	1	0	1
967	848	2	476	80	28	120669.26	120669.26	0.00	89914.86	30754.40	1	1	0
968	112	1000	813	191	49	126100.24	0.00	126100.24	88367.13	37733.11	1	0	1
969	138	1000	682	125	6	12082.86	0.00	12082.86	9487.23	2595.63	1	0	1
970	285	1000	78	109	22	68477.27	0.00	68477.27	50556.80	17920.47	1	0	1
971	725	4	357	42	50	180884.11	180884.11	0.00	136093.93	44790.18	1	1	0
972	650	4	823	71	37	8507.65	8507.65	0.00	5308.69	3198.96	1	1	0
973	465	1	437	132	40	93580.25	93580.25	0.00	63163.91	30416.34	1	1	0
974	26	4	634	172	47	241142.14	241142.14	0.00	165243.14	75899.00	1	1	0
975	314	1000	591	157	15	38590.82	0.00	38590.82	32183.16	6407.66	1	0	1
976	276	2	85	149	11	436.24	436.24	0.00	283.56	152.68	1	1	0
977	252	4	89	24	33	127400.94	127400.94	0.00	112691.34	14709.60	1	1	0
978	349	1000	421	98	10	10797.69	0.00	10797.69	8704.01	2093.68	1	0	1
979	33	4	902	172	38	88015.62	88015.62	0.00	69252.88	18762.74	1	1	0
980	254	1000	853	84	39	48443.16	0.00	48443.16	36244.54	12198.62	1	0	1
981	751	1	887	123	3	112290.28	112290.28	0.00	75543.01	36747.27	1	1	0
982	595	1000	303	221	10	39065.37	0.00	39065.37	28171.15	10894.22	1	0	1
983	602	2	610	169	32	57635.00	57635.00	0.00	47260.70	10374.30	1	1	0
984	819	4	452	124	44	58160.34	58160.34	0.00	37624.18	20536.16	1	1	0
985	118	2	705	224	45	122163.32	122163.32	0.00	101342.99	20820.33	1	1	0
986	671	1000	839	33	18	93653.22	0.00	93653.22	67574.06	26079.16	1	0	1
987	629	4	323	12	46	82517.94	82517.94	0.00	55551.18	26966.76	1	1	0
988	324	2	23	253	26	78306.18	78306.18	0.00	56962.10	21344.08	1	1	0
989	292	4	931	245	43	194631.86	194631.86	0.00	140079.72	54552.14	1	1	0
990	138	4	681	146	42	29136.54	29136.54	0.00	23623.20	5513.34	1	1	0
991	879	1000	534	34	2	71744.10	0.00	71744.10	51457.06	20287.04	1	0	1
992	124	1000	445	26	10	74126.16	0.00	74126.16	61539.72	12586.44	1	0	1
993	34	4	366	184	3	111026.24	111026.24	0.00	75401.48	35624.76	1	1	0
994	478	1000	927	13	8	13496.04	0.00	13496.04	10526.92	2969.12	1	0	1
995	121	1000	709	238	29	35754.96	0.00	35754.96	27531.30	8223.66	1	0	1
996	209	1000	856	106	35	36116.46	0.00	36116.46	23114.52	13001.94	1	0	1
997	689	1000	508	71	12	66984.04	0.00	66984.04	54482.78	12501.26	1	0	1
998	598	1000	578	215	35	252970.96	0.00	252970.96	201907.77	51063.19	1	0	1
999	167	1	950	67	17	258546.71	258546.71	0.00	188079.30	70467.41	1	1	0
1000	438	1000	234	236	9	91502.22	0.00	91502.22	62811.57	28690.65	1	0	1
1001	812	2	870	7	16	37380.01	37380.01	0.00	29756.83	7623.18	1	1	0
1002	572	2	293	222	31	83202.58	83202.58	0.00	65446.37	17756.21	1	1	0
1003	780	1000	157	212	49	107560.16	0.00	107560.16	79945.90	27614.26	1	0	1
1004	431	1000	473	230	14	67598.68	0.00	67598.68	58034.36	9564.32	1	0	1
1005	680	1000	176	109	14	146557.10	0.00	146557.10	120246.06	26311.04	1	0	1
1006	567	1000	171	244	45	131724.21	0.00	131724.21	102814.91	28909.30	1	0	1
1007	283	2	88	7	34	195775.13	195775.13	0.00	156592.35	39182.78	1	1	0
1008	656	1000	811	244	39	10365.59	0.00	10365.59	8106.93	2258.66	1	0	1
1009	628	2	568	243	46	51349.48	51349.48	0.00	39241.03	12108.45	1	1	0
1010	228	2	761	19	7	52278.85	52278.85	0.00	39154.01	13124.84	1	1	0
1011	211	1	240	26	19	153717.16	153717.16	0.00	107849.68	45867.48	1	1	0
1012	440	1000	736	237	12	136357.30	0.00	136357.30	89332.08	47025.22	1	0	1
1013	784	1	91	34	12	206652.92	206652.92	0.00	139211.40	67441.52	1	1	0
1014	155	1000	923	244	45	33500.45	0.00	33500.45	27738.46	5761.99	1	0	1
1015	88	1000	5	97	32	136879.95	0.00	136879.95	98280.67	38599.28	1	0	1
1016	802	2	679	162	32	68436.88	68436.88	0.00	48084.61	20352.27	1	1	0
1017	696	1000	255	202	30	127338.82	0.00	127338.82	102647.44	24691.38	1	0	1
1018	203	3	659	119	8	149179.06	149179.06	0.00	105310.79	43868.27	1	1	0
1019	311	2	234	222	16	143525.45	143525.45	0.00	122262.26	21263.19	1	1	0
1020	418	4	847	248	4	222305.59	222305.59	0.00	158634.05	63671.54	1	1	0
1021	138	1	627	163	20	1533.06	1533.06	0.00	950.49	582.57	1	1	0
1022	85	1	284	30	44	10121.01	10121.01	0.00	8501.64	1619.37	1	1	0
1023	154	4	174	18	29	4628.67	4628.67	0.00	3147.50	1481.17	1	1	0
1024	493	1000	576	102	33	184918.59	0.00	184918.59	136035.04	48883.55	1	0	1
1025	771	1000	956	133	6	239616.30	0.00	239616.30	183082.08	56534.22	1	0	1
1026	878	1000	233	70	14	53602.83	0.00	53602.83	36033.66	17569.17	1	0	1
1027	783	3	652	43	17	78413.73	78413.73	0.00	63841.54	14572.19	1	1	0
1028	140	1000	531	133	31	154898.79	0.00	154898.79	104439.41	50459.38	1	0	1
1029	627	4	57	41	41	124713.88	124713.88	0.00	92588.96	32124.92	1	1	0
1030	699	1000	787	131	27	65228.26	0.00	65228.26	45287.25	19941.01	1	0	1
1031	199	1000	692	193	49	136469.41	0.00	136469.41	104574.77	31894.64	1	0	1
1032	655	2	518	172	18	41704.59	41704.59	0.00	28304.16	13400.43	1	1	0
1033	371	2	45	73	43	90315.57	90315.57	0.00	72775.36	17540.21	1	1	0
1034	156	3	549	21	46	19083.04	19083.04	0.00	12213.16	6869.88	1	1	0
1035	205	3	100	210	34	115017.29	115017.29	0.00	95762.30	19254.99	1	1	0
1036	194	3	407	210	49	22457.91	22457.91	0.00	14148.48	8309.43	1	1	0
1037	805	1	246	164	45	63214.56	63214.56	0.00	42985.92	20228.64	1	1	0
1038	726	1000	505	143	46	132007.52	0.00	132007.52	95756.24	36251.28	1	0	1
1039	560	1000	944	118	40	99945.56	0.00	99945.56	66422.96	33522.60	1	0	1
1040	344	1000	188	229	5	50734.49	0.00	50734.49	32807.50	17926.99	1	0	1
1041	124	1000	794	17	21	89975.45	0.00	89975.45	76142.30	13833.15	1	0	1
1042	367	1000	994	105	17	68124.37	0.00	68124.37	55048.82	13075.55	1	0	1
1043	140	3	967	191	43	23600.70	23600.70	0.00	20532.60	3068.10	1	1	0
1044	34	4	758	116	19	98254.20	98254.20	0.00	70306.38	27947.82	1	1	0
1045	603	1000	61	11	36	22271.80	0.00	22271.80	17372.01	4899.79	1	0	1
1046	254	3	950	123	33	173507.51	173507.51	0.00	110059.24	63448.27	1	1	0
1047	227	1000	819	202	2	81831.84	0.00	81831.84	61651.36	20180.48	1	0	1
1048	106	4	168	224	15	63006.88	63006.88	0.00	48141.96	14864.92	1	1	0
1049	768	1	840	24	32	38854.00	38854.00	0.00	23700.95	15153.05	1	1	0
1050	787	1	762	206	25	61310.27	61310.27	0.00	47362.70	13947.57	1	1	0
1051	528	1	306	18	28	67723.39	67723.39	0.00	51257.51	16465.88	1	1	0
1052	812	3	915	36	11	81938.56	81938.56	0.00	66814.56	15124.00	1	1	0
1053	450	1000	768	43	24	117798.30	0.00	117798.30	88593.19	29205.11	1	0	1
1054	426	1	615	40	24	80716.14	80716.14	0.00	65423.50	15292.64	1	1	0
1055	641	1000	902	64	14	19217.49	0.00	19217.49	14954.94	4262.55	1	0	1
1056	316	1000	810	80	49	42031.04	0.00	42031.04	30235.54	11795.50	1	0	1
1057	256	3	469	233	48	63692.72	63692.72	0.00	43311.04	20381.68	1	1	0
1058	447	1000	361	61	26	111231.92	0.00	111231.92	81809.68	29422.24	1	0	1
1059	870	4	716	172	50	208797.39	208797.39	0.00	178629.95	30167.44	1	1	0
1060	410	1000	18	156	15	98061.16	0.00	98061.16	81250.44	16810.72	1	0	1
1061	496	1	972	44	50	45019.58	45019.58	0.00	30524.36	14495.22	1	1	0
1062	807	2	969	67	38	84870.18	84870.18	0.00	59055.74	25814.44	1	1	0
1063	74	3	701	32	40	273757.92	273757.92	0.00	215328.53	58429.39	1	1	0
1064	596	3	313	100	49	66127.62	66127.62	0.00	57283.26	8844.36	1	1	0
1065	6	1000	862	61	38	47323.64	0.00	47323.64	37549.46	9774.18	1	0	1
1066	810	1000	813	41	41	63765.30	0.00	63765.30	45911.00	17854.30	1	0	1
1067	236	4	879	168	23	91611.09	91611.09	0.00	60253.61	31357.48	1	1	0
1068	449	2	384	250	21	1194.18	1194.18	0.00	776.22	417.96	1	1	0
1069	19	1	495	100	39	146316.59	146316.59	0.00	105815.86	40500.73	1	1	0
1070	269	1000	313	218	12	66341.91	0.00	66341.91	50593.49	15748.42	1	0	1
1071	834	2	302	188	29	121192.74	121192.74	0.00	87680.05	33512.69	1	1	0
1072	254	4	1089	50	24	54703.51	54703.51	0.00	40161.24	14542.27	1	1	0
1073	94	1000	837	192	8	37064.07	0.00	37064.07	30074.25	6989.82	1	0	1
1074	350	1000	700	102	10	141721.83	0.00	141721.83	112746.15	28975.68	1	0	1
1075	762	1	960	12	4	59615.72	59615.72	0.00	50732.98	8882.74	1	1	0
1076	211	1000	586	92	3	37627.80	0.00	37627.80	26577.37	11050.43	1	0	1
1077	440	1000	806	116	39	24885.78	0.00	24885.78	14931.48	9954.30	1	0	1
1078	576	3	883	49	4	54050.34	54050.34	0.00	39835.27	14215.07	1	1	0
1079	60	4	917	110	28	15731.79	15731.79	0.00	12737.27	2994.52	1	1	0
1080	601	4	736	136	50	77793.03	77793.03	0.00	58344.75	19448.28	1	1	0
1081	837	1	984	102	43	50771.40	50771.40	0.00	35540.00	15231.40	1	1	0
1082	526	2	185	140	7	122958.81	122958.81	0.00	81152.82	41805.99	1	1	0
1083	564	2	327	90	50	152151.48	152151.48	0.00	118383.81	33767.67	1	1	0
1084	437	1000	865	160	40	72908.43	0.00	72908.43	54326.97	18581.46	1	0	1
1085	438	1	943	134	25	63159.12	63159.12	0.00	46902.76	16256.36	1	1	0
1086	417	1	556	192	5	89004.42	89004.42	0.00	71881.38	17123.04	1	1	0
1087	452	1000	268	114	14	60515.92	0.00	60515.92	49354.09	11161.83	1	0	1
1088	42	3	190	23	20	85466.23	85466.23	0.00	60353.95	25112.28	1	1	0
1089	254	1000	294	13	11	77004.51	0.00	77004.51	57642.84	19361.67	1	0	1
1090	137	1000	576	29	26	13047.55	0.00	13047.55	9857.83	3189.72	1	0	1
1091	270	1000	614	68	33	64879.59	0.00	64879.59	45467.24	19412.35	1	0	1
1092	46	1000	70	157	46	39510.31	0.00	39510.31	28284.60	11225.71	1	0	1
1093	282	1000	621	131	9	100580.09	0.00	100580.09	76312.01	24268.08	1	0	1
1094	694	1000	545	84	12	66522.06	0.00	66522.06	59204.61	7317.45	1	0	1
1095	602	1000	196	67	14	104261.66	0.00	104261.66	75771.35	28490.31	1	0	1
1096	542	1000	879	60	14	19688.62	0.00	19688.62	17129.10	2559.52	1	0	1
1097	688	2	987	40	16	153059.35	153059.35	0.00	103035.61	50023.74	1	1	0
1098	608	3	837	251	15	93987.25	93987.25	0.00	73523.47	20463.78	1	1	0
1099	279	1000	728	78	19	118008.68	0.00	118008.68	98208.43	19800.25	1	0	1
1100	16	1000	123	207	4	138989.24	0.00	138989.24	99589.38	39399.86	1	0	1
1101	70	1000	624	166	23	64316.12	0.00	64316.12	49188.32	15127.80	1	0	1
1102	618	3	667	11	6	189735.50	189735.50	0.00	159813.07	29922.43	1	1	0
1103	498	1000	77	138	30	218671.05	0.00	218671.05	166214.98	52456.07	1	0	1
1104	641	3	273	141	13	32225.68	32225.68	0.00	24491.52	7734.16	1	1	0
1105	251	1000	155	107	39	111242.72	0.00	111242.72	82989.31	28253.41	1	0	1
1106	527	1000	753	50	24	38644.71	0.00	38644.71	28722.56	9922.15	1	0	1
1107	615	1000	187	248	12	76502.10	0.00	76502.10	52730.97	23771.13	1	0	1
1108	368	1000	306	40	22	34777.94	0.00	34777.94	22831.56	11946.38	1	0	1
1109	190	3	171	63	15	36780.84	36780.84	0.00	29307.18	7473.66	1	1	0
1110	491	3	801	140	47	208427.24	208427.24	0.00	160425.98	48001.26	1	1	0
1111	430	1000	171	88	26	73900.56	0.00	73900.56	53745.41	20155.15	1	0	1
1112	744	4	825	119	1	145297.89	145297.89	0.00	103718.47	41579.42	1	1	0
1113	317	2	409	183	30	116808.54	116808.54	0.00	88092.48	28716.06	1	1	0
1114	355	1000	561	214	47	26722.60	0.00	26722.60	18973.04	7749.56	1	0	1
1115	119	1000	164	21	17	147293.96	0.00	147293.96	104383.46	42910.50	1	0	1
1116	63	1000	867	197	11	45163.27	0.00	45163.27	28694.64	16468.63	1	0	1
1117	662	1	980	224	41	90253.71	90253.71	0.00	62909.70	27344.01	1	1	0
1118	248	1	103	242	27	165507.26	165507.26	0.00	123101.84	42405.42	1	1	0
1119	256	1000	84	73	40	329604.42	0.00	329604.42	250917.90	78686.52	1	0	1
1120	167	1000	111	133	47	64297.55	0.00	64297.55	40873.77	23423.78	1	0	1
1121	765	2	140	172	7	112598.51	112598.51	0.00	91245.59	21352.92	1	1	0
1122	156	2	933	33	39	42049.22	42049.22	0.00	30008.53	12040.69	1	1	0
1123	877	1000	607	208	37	89339.49	0.00	89339.49	73572.96	15766.53	1	0	1
1124	562	3	327	20	40	112649.11	112649.11	0.00	72488.29	40160.82	1	1	0
1125	808	1000	956	252	42	134231.16	0.00	134231.16	94653.52	39577.64	1	0	1
1126	768	3	716	25	13	85093.60	85093.60	0.00	63201.74	21891.86	1	1	0
1127	492	1	668	49	6	36293.25	36293.25	0.00	22701.19	13592.06	1	1	0
1128	86	3	17	1	42	25987.66	25987.66	0.00	20941.68	5045.98	1	1	0
1129	661	1000	721	197	38	16633.70	0.00	16633.70	14787.90	1845.80	1	0	1
1130	71	1000	229	232	19	8024.26	0.00	8024.26	6740.38	1283.88	1	0	1
1131	523	3	523	159	37	175553.91	175553.91	0.00	136463.55	39090.36	1	1	0
1132	308	4	10	137	4	127895.38	127895.38	0.00	100266.74	27628.64	1	1	0
1133	77	3	117	246	38	215458.60	215458.60	0.00	169702.63	45755.97	1	1	0
1134	219	2	537	219	32	12944.92	12944.92	0.00	8068.00	4876.92	1	1	0
1135	174	1000	145	47	8	103528.32	0.00	103528.32	75718.60	27809.72	1	0	1
1136	66	1000	197	157	8	12253.04	0.00	12253.04	9067.24	3185.80	1	0	1
1137	664	1000	271	41	9	67946.22	0.00	67946.22	49030.99	18915.23	1	0	1
1138	866	1000	25	51	40	69047.93	0.00	69047.93	56687.94	12359.99	1	0	1
1139	449	1000	209	1	37	117843.44	0.00	117843.44	80913.20	36930.24	1	0	1
1140	623	1000	281	96	32	28363.20	0.00	28363.20	20705.15	7658.05	1	0	1
1141	386	1	329	222	21	64812.96	64812.96	0.00	48609.72	16203.24	1	1	0
1142	93	1000	303	164	22	5258.53	0.00	5258.53	4206.82	1051.71	1	0	1
1143	80	1000	686	218	1	43017.90	0.00	43017.90	32693.58	10324.32	1	0	1
1144	459	1000	861	219	21	133072.37	0.00	133072.37	108142.71	24929.66	1	0	1
1145	161	3	676	89	19	17489.61	17489.61	0.00	12417.63	5071.98	1	1	0
1146	809	1000	463	163	20	34151.61	0.00	34151.61	29709.20	4442.41	1	0	1
1147	834	1000	34	217	41	108158.44	0.00	108158.44	74719.45	33438.99	1	0	1
1148	304	2	7	79	34	4174.46	4174.46	0.00	3715.26	459.20	1	1	0
1149	749	1000	175	25	43	44216.76	0.00	44216.76	34899.90	9316.86	1	0	1
1150	47	1000	926	139	31	119421.41	0.00	119421.41	95170.15	24251.26	1	0	1
1151	866	1	117	60	2	79386.61	79386.61	0.00	62100.40	17286.21	1	1	0
1152	546	1000	203	70	5	50697.34	0.00	50697.34	42794.52	7902.82	1	0	1
1153	67	1000	20	138	20	98311.62	0.00	98311.62	80977.28	17334.34	1	0	1
1154	200	1000	614	10	12	182280.18	0.00	182280.18	124517.20	57762.98	1	0	1
1155	122	1	775	186	44	104013.03	104013.03	0.00	78985.55	25027.48	1	1	0
1156	391	4	151	241	49	88859.55	88859.55	0.00	73360.06	15499.49	1	1	0
1157	485	2	568	221	18	76918.94	76918.94	0.00	63515.27	13403.67	1	1	0
1158	43	1000	532	40	34	170457.82	0.00	170457.82	119336.28	51121.54	1	0	1
1159	437	2	499	68	29	105465.98	105465.98	0.00	79170.30	26295.68	1	1	0
1160	94	1000	812	198	16	37794.48	0.00	37794.48	29857.60	7936.88	1	0	1
1161	485	1000	418	52	15	21734.28	0.00	21734.28	17528.42	4205.86	1	0	1
1162	646	4	405	152	17	88910.73	88910.73	0.00	65268.44	23642.29	1	1	0
1163	254	1	1135	58	48	86493.40	86493.40	0.00	67065.61	19427.79	1	1	0
1164	557	3	705	28	44	135428.06	135428.06	0.00	111494.25	23933.81	1	1	0
1165	267	1000	365	232	26	88363.79	0.00	88363.79	60793.44	27570.35	1	0	1
1166	805	1000	281	244	49	51479.10	0.00	51479.10	44272.00	7207.10	1	0	1
1167	79	1	203	223	48	236526.61	236526.61	0.00	171309.32	65217.29	1	1	0
1168	291	2	573	115	2	196347.36	196347.36	0.00	123396.61	72950.75	1	1	0
1169	76	4	792	19	5	116964.88	116964.88	0.00	95064.31	21900.57	1	1	0
1170	261	1	332	153	42	139056.34	139056.34	0.00	99309.58	39746.76	1	1	0
1171	332	1000	438	101	25	89485.96	0.00	89485.96	70484.38	19001.58	1	0	1
1172	670	4	689	224	37	58396.94	58396.94	0.00	37957.99	20438.95	1	1	0
1173	254	1000	1167	230	27	27297.46	0.00	27297.46	20724.82	6572.64	1	0	1
1174	522	1000	904	108	13	35044.78	0.00	35044.78	24733.94	10310.84	1	0	1
1175	275	1000	685	97	6	73565.24	0.00	73565.24	47379.69	26185.55	1	0	1
1176	56	2	777	181	3	71343.58	71343.58	0.00	53249.55	18094.03	1	1	0
1177	538	3	876	116	39	62499.42	62499.42	0.00	54938.58	7560.84	1	1	0
1178	103	1000	644	4	12	1499.26	0.00	1499.26	1334.34	164.92	1	0	1
1179	477	1000	484	151	37	89501.48	0.00	89501.48	72825.98	16675.50	1	0	1
1180	624	2	776	175	18	87246.41	87246.41	0.00	61487.51	25758.90	1	1	0
1181	222	1000	158	106	4	37269.44	0.00	37269.44	29252.54	8016.90	1	0	1
1182	123	2	71	31	16	16732.17	16732.17	0.00	11247.83	5484.34	1	1	0
1183	818	1000	376	145	6	87617.14	0.00	87617.14	67116.03	20501.11	1	0	1
1184	706	4	658	64	33	39441.81	39441.81	0.00	27319.89	12121.92	1	1	0
1185	854	2	536	165	38	53827.72	53827.72	0.00	39552.92	14274.80	1	1	0
1186	748	1000	711	105	39	105352.28	0.00	105352.28	84391.56	20960.72	1	0	1
1187	304	1000	62	245	9	28932.57	0.00	28932.57	23243.39	5689.18	1	0	1
1188	84	1000	91	5	4	4767.36	0.00	4767.36	4242.96	524.40	1	0	1
1189	833	1000	527	55	19	60898.20	0.00	60898.20	50482.40	10415.80	1	0	1
1190	864	1000	701	219	26	66395.42	0.00	66395.42	47804.68	18590.74	1	0	1
1191	512	3	820	124	33	37236.99	37236.99	0.00	31066.86	6170.13	1	1	0
1192	594	2	328	244	46	111721.27	111721.27	0.00	76129.70	35591.57	1	1	0
1193	868	1000	133	219	47	36259.80	0.00	36259.80	31183.44	5076.36	1	0	1
1194	863	1000	902	64	14	165426.54	0.00	165426.54	115055.34	50371.20	1	0	1
1195	212	1	314	241	18	49273.87	49273.87	0.00	40578.69	8695.18	1	1	0
1196	38	1000	289	57	42	34360.20	0.00	34360.20	21646.90	12713.30	1	0	1
1197	183	2	792	139	9	36720.75	36720.75	0.00	32092.25	4628.50	1	1	0
1198	701	3	398	253	38	143501.73	143501.73	0.00	107252.46	36249.27	1	1	0
1199	257	1000	233	61	50	89954.45	0.00	89954.45	69621.92	20332.53	1	0	1
1200	637	1000	420	128	27	64939.00	0.00	64939.00	55847.50	9091.50	1	0	1
1201	228	1000	112	29	37	36449.30	0.00	36449.30	25533.95	10915.35	1	0	1
1202	80	2	81	214	33	149455.76	149455.76	0.00	98358.68	51097.08	1	1	0
1203	753	1000	123	90	29	94814.50	0.00	94814.50	73236.18	21578.32	1	0	1
1204	45	1	947	68	2	150031.60	150031.60	0.00	113386.18	36645.42	1	1	0
1205	326	3	861	156	24	46730.97	46730.97	0.00	37756.39	8974.58	1	1	0
1206	118	4	528	116	13	194349.84	194349.84	0.00	141315.17	53034.67	1	1	0
1207	423	4	791	249	35	69033.69	69033.69	0.00	49213.90	19819.79	1	1	0
1208	85	3	864	240	46	173745.34	173745.34	0.00	129695.90	44049.44	1	1	0
1209	295	1000	743	223	25	71448.15	0.00	71448.15	58751.49	12696.66	1	0	1
1210	267	1000	981	158	39	28608.44	0.00	28608.44	25461.52	3146.92	1	0	1
1211	605	1000	633	116	20	209971.95	0.00	209971.95	160854.29	49117.66	1	0	1
1212	481	1000	439	129	28	60677.52	0.00	60677.52	41343.87	19333.65	1	0	1
1213	289	2	978	180	34	90818.73	90818.73	0.00	68499.78	22318.95	1	1	0
1214	860	3	437	79	42	51499.89	51499.89	0.00	32250.42	19249.47	1	1	0
1215	455	3	472	229	33	82552.00	82552.00	0.00	60531.52	22020.48	1	1	0
1216	456	1000	826	46	38	62609.35	0.00	62609.35	50023.45	12585.90	1	0	1
1217	599	1000	648	176	41	136235.61	0.00	136235.61	109170.97	27064.64	1	0	1
1218	357	1000	494	73	11	70628.00	0.00	70628.00	56852.00	13776.00	1	0	1
1219	256	3	513	176	41	119624.81	119624.81	0.00	96635.30	22989.51	1	1	0
1220	480	3	431	107	48	23529.36	23529.36	0.00	20235.24	3294.12	1	1	0
1221	700	1000	441	170	32	145878.05	0.00	145878.05	110828.03	35050.02	1	0	1
1222	529	1	35	7	31	66943.86	66943.86	0.00	49852.28	17091.58	1	1	0
1223	138	1000	425	231	26	70403.35	0.00	70403.35	53461.78	16941.57	1	0	1
1224	718	3	105	6	45	2441.52	2441.52	0.00	2099.71	341.81	1	1	0
1225	705	4	192	246	24	169817.28	169817.28	0.00	127291.40	42525.88	1	1	0
1226	642	1000	793	210	30	54606.07	0.00	54606.07	44660.89	9945.18	1	0	1
1227	383	1	177	217	23	127766.43	127766.43	0.00	88386.61	39379.82	1	1	0
1228	235	2	921	172	49	78546.24	78546.24	0.00	51055.02	27491.22	1	1	0
1229	333	3	254	51	24	52925.38	52925.38	0.00	40874.28	12051.10	1	1	0
1230	729	4	210	164	6	45456.84	45456.84	0.00	31012.75	14444.09	1	1	0
1231	650	1000	957	47	7	195727.91	0.00	195727.91	141958.63	53769.28	1	0	1
1232	823	1000	556	134	26	82650.18	0.00	82650.18	54395.60	28254.58	1	0	1
1233	617	4	394	32	5	144394.16	144394.16	0.00	110279.76	34114.40	1	1	0
1234	744	1000	794	217	31	116069.38	0.00	116069.38	94338.67	21730.71	1	0	1
1235	249	1000	842	65	35	50080.74	0.00	50080.74	35058.40	15022.34	1	0	1
1236	254	1	1112	123	6	276892.74	276892.74	0.00	204717.06	72175.68	1	1	0
1237	842	1000	593	118	19	28344.25	0.00	28344.25	20407.85	7936.40	1	0	1
1238	549	1000	673	142	37	70600.00	0.00	70600.00	46596.00	24004.00	1	0	1
1239	677	1000	258	187	12	44930.40	0.00	44930.40	37292.25	7638.15	1	0	1
1240	833	3	101	7	24	72701.90	72701.90	0.00	49703.43	22998.47	1	1	0
1241	850	1000	570	203	34	9272.76	0.00	9272.76	7696.38	1576.38	1	0	1
1242	220	1000	524	53	25	79431.03	0.00	79431.03	67071.92	12359.11	1	0	1
1243	208	1	40	212	3	81970.86	81970.86	0.00	63015.15	18955.71	1	1	0
1244	254	2	20	97	6	35921.70	35921.70	0.00	23708.34	12213.36	1	1	0
1245	254	3	217	161	15	74530.43	74530.43	0.00	53167.70	21362.73	1	1	0
1246	773	4	391	173	48	68736.46	68736.46	0.00	54354.89	14381.57	1	1	0
1247	673	3	933	247	2	188141.36	188141.36	0.00	143616.91	44524.45	1	1	0
1248	144	3	879	226	18	104270.08	104270.08	0.00	65068.76	39201.32	1	1	0
1249	376	1000	514	123	34	95469.51	0.00	95469.51	74605.93	20863.58	1	0	1
1250	731	4	398	135	1	116767.34	116767.34	0.00	91211.35	25555.99	1	1	0
1251	126	1000	72	187	18	69673.02	0.00	69673.02	56563.93	13109.09	1	0	1
1252	471	4	680	225	19	212609.05	212609.05	0.00	158446.50	54162.55	1	1	0
1253	872	1000	400	180	42	87273.60	0.00	87273.60	56727.80	30545.80	1	0	1
1254	31	1000	603	171	2	104160.27	0.00	104160.27	86787.97	17372.30	1	0	1
1255	148	1000	537	24	2	56098.67	0.00	56098.67	43513.54	12585.13	1	0	1
1256	329	1000	257	100	28	109735.30	0.00	109735.30	79944.52	29790.78	1	0	1
1257	525	4	162	116	3	53107.27	53107.27	0.00	43820.03	9287.24	1	1	0
1258	106	1	405	226	35	106975.38	106975.38	0.00	74775.98	32199.40	1	1	0
1259	338	1000	179	68	22	55215.47	0.00	55215.47	41750.66	13464.81	1	0	1
1260	777	1000	903	81	30	81722.46	0.00	81722.46	59039.02	22683.44	1	0	1
1261	254	1	379	131	14	179147.41	179147.41	0.00	124796.31	54351.10	1	1	0
1262	62	1000	291	80	23	148955.54	0.00	148955.54	111314.12	37641.42	1	0	1
1263	477	1	323	159	35	189639.12	189639.12	0.00	138501.88	51137.24	1	1	0
1264	649	1000	430	128	47	107654.23	0.00	107654.23	90685.99	16968.24	1	0	1
1265	761	1000	477	174	35	53651.46	0.00	53651.46	37075.88	16575.58	1	0	1
1266	11	1	697	178	36	19741.59	19741.59	0.00	13166.34	6575.25	1	1	0
1267	559	3	975	17	14	1031.08	1031.08	0.00	814.56	216.52	1	1	0
1268	697	2	981	154	14	53657.76	53657.76	0.00	42965.03	10692.73	1	1	0
1269	25	3	878	102	31	90586.19	90586.19	0.00	74643.49	15942.70	1	1	0
1270	599	1000	537	30	44	135776.55	0.00	135776.55	89700.79	46075.76	1	0	1
1271	696	1	834	91	47	111765.39	111765.39	0.00	88960.51	22804.88	1	1	0
1272	398	1000	591	141	4	2773.13	0.00	2773.13	2052.12	721.01	1	0	1
1273	538	1000	71	134	9	227205.90	0.00	227205.90	163964.80	63241.10	1	0	1
1274	86	2	570	45	3	128350.21	128350.21	0.00	99675.05	28675.16	1	1	0
1275	272	1000	581	39	19	101942.15	0.00	101942.15	71014.01	30928.14	1	0	1
1276	326	1	308	36	24	121483.60	121483.60	0.00	99314.89	22168.71	1	1	0
1277	220	4	438	204	3	189920.50	189920.50	0.00	142651.57	47268.93	1	1	0
1278	870	1	12	237	37	12143.20	12143.20	0.00	10051.62	2091.58	1	1	0
1279	80	3	372	98	18	56257.87	56257.87	0.00	47456.55	8801.32	1	1	0
1280	254	1	945	235	27	3139.45	3139.45	0.00	2260.40	879.05	1	1	0
1281	300	1000	440	189	9	6394.18	0.00	6394.18	3964.39	2429.79	1	0	1
1282	810	2	574	115	38	160644.66	160644.66	0.00	120315.33	40329.33	1	1	0
1283	429	1000	626	209	18	59449.26	0.00	59449.26	49342.86	10106.40	1	0	1
1284	490	2	513	192	47	130421.95	130421.95	0.00	97136.52	33285.43	1	1	0
1285	202	4	952	1	39	46368.54	46368.54	0.00	35745.98	10622.56	1	1	0
1286	504	1000	883	84	42	108445.68	0.00	108445.68	87716.43	20729.25	1	0	1
1287	12	4	127	216	15	82455.71	82455.71	0.00	61405.97	21049.74	1	1	0
1288	345	2	887	174	50	3993.24	3993.24	0.00	2475.81	1517.43	1	1	0
1289	363	3	274	171	5	33501.28	33501.28	0.00	23115.86	10385.42	1	1	0
1290	407	1000	594	55	28	238911.45	0.00	238911.45	163770.46	75140.99	1	0	1
1291	779	1000	500	69	34	119587.80	0.00	119587.80	87612.84	31974.96	1	0	1
1292	698	1000	451	244	41	49600.04	0.00	49600.04	37968.01	11632.03	1	0	1
1293	796	3	952	206	16	27754.83	27754.83	0.00	16930.44	10824.39	1	1	0
1294	261	3	481	13	29	69796.23	69796.23	0.00	46172.59	23623.64	1	1	0
1295	107	1	231	242	40	57683.12	57683.12	0.00	40522.20	17160.92	1	1	0
1296	555	1000	313	240	30	110014.65	0.00	110014.65	85596.76	24417.89	1	0	1
1297	479	1000	474	218	8	19782.70	0.00	19782.70	15034.85	4747.85	1	0	1
1298	477	1000	693	172	34	6969.37	0.00	6969.37	4808.87	2160.50	1	0	1
1299	438	1000	763	169	22	127624.01	0.00	127624.01	96089.13	31534.88	1	0	1
1300	340	1000	63	6	34	26130.90	0.00	26130.90	18030.30	8100.60	1	0	1
1301	84	1000	989	144	39	50470.95	0.00	50470.95	39221.67	11249.28	1	0	1
1302	69	1	114	115	31	166971.32	166971.32	0.00	133539.04	33432.28	1	1	0
1303	726	2	855	44	13	23969.44	23969.44	0.00	19730.76	4238.68	1	1	0
1304	726	4	27	10	3	120659.00	120659.00	0.00	91736.33	28922.67	1	1	0
1305	855	1000	878	236	23	10829.87	0.00	10829.87	9638.58	1191.29	1	0	1
1306	825	3	702	78	26	6864.67	6864.67	0.00	6109.56	755.11	1	1	0
1307	8	3	379	127	50	96358.80	96358.80	0.00	70204.59	26154.21	1	1	0
1308	89	2	602	71	22	43552.68	43552.68	0.00	27774.74	15777.94	1	1	0
1309	254	3	591	125	3	232630.83	232630.83	0.00	154574.27	78056.56	1	1	0
1310	150	1000	21	61	50	161146.08	0.00	161146.08	112227.88	48918.20	1	0	1
1311	67	3	989	63	37	89032.19	89032.19	0.00	56460.49	32571.70	1	1	0
1312	333	3	715	244	6	145760.35	145760.35	0.00	109799.81	35960.54	1	1	0
1313	732	2	885	205	11	156774.82	156774.82	0.00	117075.86	39698.96	1	1	0
1314	549	1	583	29	47	155220.22	155220.22	0.00	124240.10	30980.12	1	1	0
1315	214	1	935	152	28	46593.24	46593.24	0.00	40536.12	6057.12	1	1	0
1316	626	1	780	162	26	83673.08	83673.08	0.00	61718.85	21954.23	1	1	0
1317	90	2	856	216	22	64955.28	64955.28	0.00	46111.71	18843.57	1	1	0
1318	575	1000	129	67	31	10738.94	0.00	10738.94	7624.64	3114.30	1	0	1
1319	254	3	216	61	5	15910.68	15910.68	0.00	11455.68	4455.00	1	1	0
1320	465	1000	219	148	24	124156.55	0.00	124156.55	92541.35	31615.20	1	0	1
1321	448	1	4	94	9	259401.22	259401.22	0.00	212425.16	46976.06	1	1	0
1322	254	4	1165	25	37	94902.78	94902.78	0.00	64183.36	30719.42	1	1	0
1323	254	2	995	87	10	78566.74	78566.74	0.00	61294.36	17272.38	1	1	0
1324	251	3	354	124	49	73641.94	73641.94	0.00	56827.05	16814.89	1	1	0
1325	254	4	373	44	22	7214.48	7214.48	0.00	5771.58	1442.90	1	1	0
1326	156	1	325	139	49	114498.20	114498.20	0.00	80147.60	34350.60	1	1	0
1327	288	3	496	98	39	29114.95	29114.95	0.00	22709.65	6405.30	1	1	0
1328	119	1000	748	34	1	13247.21	0.00	13247.21	10147.60	3099.61	1	0	1
1329	254	4	1145	143	26	46691.79	46691.79	0.00	32835.83	13855.96	1	1	0
1330	570	1000	719	59	15	252983.26	0.00	252983.26	196406.66	56576.60	1	0	1
1331	515	1000	247	84	20	74457.80	0.00	74457.80	64686.64	9771.16	1	0	1
1332	33	1000	826	174	22	217967.84	0.00	217967.84	162575.35	55392.49	1	0	1
1333	733	2	626	11	23	131247.73	131247.73	0.00	98010.05	33237.68	1	1	0
1334	670	1000	65	245	38	153501.50	0.00	153501.50	97194.90	56306.60	1	0	1
1335	503	4	983	253	39	43648.11	43648.11	0.00	29933.47	13714.64	1	1	0
1336	456	1000	307	198	4	123496.59	0.00	123496.59	87448.21	36048.38	1	0	1
1337	243	1000	641	161	33	79265.17	0.00	79265.17	56656.02	22609.15	1	0	1
1338	254	4	951	117	33	64887.40	64887.40	0.00	49740.38	15147.02	1	1	0
1339	807	3	574	129	2	149401.00	149401.00	0.00	123978.87	25422.13	1	1	0
1340	786	1000	989	231	22	33931.84	0.00	33931.84	20359.12	13572.72	1	0	1
1341	542	1	126	30	10	78435.69	78435.69	0.00	53227.79	25207.90	1	1	0
1342	773	1000	352	124	20	31767.92	0.00	31767.92	21919.84	9848.08	1	0	1
1343	38	3	691	108	16	38330.96	38330.96	0.00	26831.68	11499.28	1	1	0
1344	739	1000	516	111	44	118579.40	0.00	118579.40	87465.39	31114.01	1	0	1
1345	740	2	993	151	31	127227.84	127227.84	0.00	103246.07	23981.77	1	1	0
1346	642	2	304	40	25	9104.83	9104.83	0.00	5553.95	3550.88	1	1	0
1347	505	1000	66	200	27	79886.22	0.00	79886.22	51275.07	28611.15	1	0	1
1348	149	2	662	153	48	62322.39	62322.39	0.00	46741.77	15580.62	1	1	0
1349	418	1000	260	141	31	132908.15	0.00	132908.15	89873.40	43034.75	1	0	1
1350	550	1000	4	160	43	11908.20	0.00	11908.20	8097.58	3810.62	1	0	1
1351	185	2	269	133	17	227946.62	227946.62	0.00	169327.43	58619.19	1	1	0
1352	817	3	943	20	33	38854.00	38854.00	0.00	23700.95	15153.05	1	1	0
1353	870	1000	761	56	39	45217.86	0.00	45217.86	28939.44	16278.42	1	0	1
1354	332	1	442	153	37	85078.58	85078.58	0.00	54220.26	30858.32	1	1	0
1355	597	3	477	137	42	20001.14	20001.14	0.00	13087.99	6913.15	1	1	0
1356	521	3	553	63	13	123603.05	123603.05	0.00	88825.27	34777.78	1	1	0
1357	379	1000	92	44	16	8160.39	0.00	8160.39	6365.10	1795.29	1	0	1
1358	73	2	21	156	40	25386.12	25386.12	0.00	19683.12	5703.00	1	1	0
1359	370	4	976	245	9	32627.55	32627.55	0.00	28712.25	3915.30	1	1	0
1360	612	2	924	70	47	10464.75	10464.75	0.00	8221.66	2243.09	1	1	0
1361	527	1	613	148	19	211678.99	211678.99	0.00	172675.05	39003.94	1	1	0
1362	71	1	86	170	39	72203.57	72203.57	0.00	51234.94	20968.63	1	1	0
1363	254	1000	532	91	49	137291.79	0.00	137291.79	108325.35	28966.44	1	0	1
1364	858	1000	351	191	24	17632.36	0.00	17632.36	11364.59	6267.77	1	0	1
1365	256	3	415	234	23	67101.75	67101.75	0.00	49959.32	17142.43	1	1	0
1366	254	4	32	39	7	43574.75	43574.75	0.00	35295.55	8279.20	1	1	0
1367	753	1	805	115	25	97624.51	97624.51	0.00	73946.89	23677.62	1	1	0
1368	372	1000	226	193	14	147510.34	0.00	147510.34	121099.99	26410.35	1	0	1
1369	164	1000	833	133	8	4052.05	0.00	4052.05	2836.45	1215.60	1	0	1
1370	112	4	104	157	8	27125.00	27125.00	0.00	20886.25	6238.75	1	1	0
1371	254	2	1201	196	5	75541.10	75541.10	0.00	58426.57	17114.53	1	1	0
1372	143	1000	476	61	38	91972.82	0.00	91972.82	77068.82	14904.00	1	0	1
1373	136	1000	71	25	41	33708.24	0.00	33708.24	28314.90	5393.34	1	0	1
1374	790	1000	763	145	7	30191.22	0.00	30191.22	22039.56	8151.66	1	0	1
1375	731	1000	502	178	11	102420.84	0.00	102420.84	70850.52	31570.32	1	0	1
1376	610	1000	525	179	32	28197.47	0.00	28197.47	21430.08	6767.39	1	0	1
1377	133	4	482	116	38	23545.60	23545.60	0.00	20720.12	2825.48	1	1	0
1378	378	2	472	33	16	214343.15	214343.15	0.00	148040.10	66303.05	1	1	0
1379	82	1000	259	249	31	14629.09	0.00	14629.09	11118.10	3510.99	1	0	1
1380	437	1000	118	35	3	20153.48	0.00	20153.48	13431.09	6722.39	1	0	1
1381	358	3	417	214	48	90869.70	90869.70	0.00	64845.90	26023.80	1	1	0
1382	245	1000	39	152	3	115880.09	0.00	115880.09	88792.40	27087.69	1	0	1
1383	492	2	24	102	1	12051.54	12051.54	0.00	9400.20	2651.34	1	1	0
1384	606	1000	341	168	7	65917.08	0.00	65917.08	47274.86	18642.22	1	0	1
1385	533	1000	690	2	26	155400.83	0.00	155400.83	114586.69	40814.14	1	0	1
1386	342	1	706	130	11	104093.81	104093.81	0.00	71126.77	32967.04	1	1	0
1387	874	1000	373	40	5	27982.28	0.00	27982.28	20731.70	7250.58	1	0	1
1388	604	1	180	24	28	114058.16	114058.16	0.00	86857.23	27200.93	1	1	0
1389	729	2	150	145	37	7463.52	7463.52	0.00	5746.92	1716.60	1	1	0
1390	349	1	324	190	14	79424.46	79424.46	0.00	67059.66	12364.80	1	1	0
1391	197	1000	56	141	21	20169.32	0.00	20169.32	16390.12	3779.20	1	0	1
1392	254	3	977	217	33	179477.51	179477.51	0.00	150267.73	29209.78	1	1	0
1393	667	3	315	92	28	64289.21	64289.21	0.00	44526.83	19762.38	1	1	0
1394	497	1000	967	241	18	56139.96	0.00	56139.96	48459.10	7680.86	1	0	1
1395	723	1000	496	193	5	51336.90	0.00	51336.90	33369.03	17967.87	1	0	1
1396	618	2	815	8	24	242766.70	242766.70	0.00	172643.66	70123.04	1	1	0
1397	240	1	849	166	30	11941.96	11941.96	0.00	9331.30	2610.66	1	1	0
1398	859	3	533	2	25	98501.74	98501.74	0.00	82756.36	15745.38	1	1	0
1399	233	1000	88	120	33	66592.80	0.00	66592.80	50169.33	16423.47	1	0	1
1400	214	4	309	81	27	78863.70	78863.70	0.00	65268.58	13595.12	1	1	0
1401	704	1000	110	24	31	46146.36	0.00	46146.36	32520.05	13626.31	1	0	1
1402	657	1	201	150	20	75852.43	75852.43	0.00	51839.84	24012.59	1	1	0
1403	398	2	63	230	24	113576.52	113576.52	0.00	87333.11	26243.41	1	1	0
1404	254	1000	1203	70	20	12017.16	0.00	12017.16	7811.19	4205.97	1	0	1
1405	858	1000	817	246	16	188913.19	0.00	188913.19	137225.47	51687.72	1	0	1
1406	380	1000	245	209	1	46714.41	0.00	46714.41	40641.57	6072.84	1	0	1
1407	738	1000	808	50	40	49613.00	0.00	49613.00	40857.71	8755.29	1	0	1
1408	404	1000	789	132	1	93346.80	0.00	93346.80	63477.96	29868.84	1	0	1
1409	254	3	121	183	42	55190.20	55190.20	0.00	35873.60	19316.60	1	1	0
1410	337	3	708	252	31	114229.03	114229.03	0.00	93411.05	20817.98	1	1	0
1411	846	1000	68	82	26	19739.92	0.00	19739.92	15791.92	3948.00	1	0	1
1412	701	4	653	70	5	119034.60	119034.60	0.00	94961.03	24073.57	1	1	0
1413	680	2	954	216	16	70617.58	70617.58	0.00	49356.78	21260.80	1	1	0
1414	857	1	923	7	19	142437.08	142437.08	0.00	93977.38	48459.70	1	1	0
1415	762	1000	57	148	34	15939.54	0.00	15939.54	12114.09	3825.45	1	0	1
1416	268	1000	930	250	17	236820.55	0.00	236820.55	170236.75	66583.80	1	0	1
1417	453	3	288	24	4	24387.44	24387.44	0.00	16339.60	8047.84	1	1	0
1418	25	1000	204	146	31	47425.03	0.00	47425.03	35637.67	11787.36	1	0	1
1419	206	1	361	150	21	47420.35	47420.35	0.00	39125.38	8294.97	1	1	0
1420	344	1	895	246	41	15148.16	15148.16	0.00	10598.24	4549.92	1	1	0
1421	573	3	594	228	30	122213.34	122213.34	0.00	84315.34	37898.00	1	1	0
1422	227	3	615	135	41	90407.04	90407.04	0.00	59692.41	30714.63	1	1	0
1423	768	1000	736	13	15	654.48	0.00	654.48	458.13	196.35	1	0	1
1424	656	1000	837	142	39	157405.36	0.00	157405.36	134305.80	23099.56	1	0	1
1425	538	1000	166	120	14	82327.88	0.00	82327.88	53147.14	29180.74	1	0	1
1426	803	1000	799	19	8	104289.27	0.00	104289.27	92544.64	11744.63	1	0	1
1427	325	1000	643	74	36	125739.10	0.00	125739.10	86021.13	39717.97	1	0	1
1428	768	3	135	37	49	181288.23	181288.23	0.00	135364.97	45923.26	1	1	0
1429	538	3	340	99	19	36617.26	36617.26	0.00	26917.37	9699.89	1	1	0
1430	727	1	543	18	24	29942.72	29942.72	0.00	23331.68	6611.04	1	1	0
1431	51	1000	714	36	36	9387.26	0.00	9387.26	6195.60	3191.66	1	0	1
1432	254	1000	324	237	46	113461.91	0.00	113461.91	91085.35	22376.56	1	0	1
1433	872	1000	805	53	28	105380.29	0.00	105380.29	73635.36	31744.93	1	0	1
1434	464	1000	453	180	33	24688.94	0.00	24688.94	17554.83	7134.11	1	0	1
1435	441	2	722	10	25	59077.70	59077.70	0.00	40513.44	18564.26	1	1	0
1436	468	1000	997	249	22	94702.51	0.00	94702.51	68660.82	26041.69	1	0	1
1437	230	4	930	140	35	124394.07	124394.07	0.00	104213.83	20180.24	1	1	0
1438	238	1	272	43	27	26913.80	26913.80	0.00	20454.50	6459.30	1	1	0
1439	88	2	616	234	21	9668.34	9668.34	0.00	6284.42	3383.92	1	1	0
1440	720	1000	986	183	43	40228.23	0.00	40228.23	30347.05	9881.18	1	0	1
1441	566	4	94	173	42	9948.52	9948.52	0.00	7162.92	2785.60	1	1	0
1442	779	1000	822	169	45	138211.14	0.00	138211.14	109569.05	28642.09	1	0	1
1443	391	3	566	245	29	113624.39	113624.39	0.00	76657.55	36966.84	1	1	0
1444	117	1000	538	40	48	118988.82	0.00	118988.82	83913.25	35075.57	1	0	1
1445	514	1000	236	228	27	92966.01	0.00	92966.01	77432.32	15533.69	1	0	1
1446	177	3	757	82	14	127165.26	127165.26	0.00	108351.76	18813.50	1	1	0
1447	450	2	604	22	42	152437.80	152437.80	0.00	110189.50	42248.30	1	1	0
1448	481	2	391	187	30	157204.99	157204.99	0.00	115440.62	41764.37	1	1	0
1449	18	1000	79	102	9	49683.52	0.00	49683.52	42316.81	7366.71	1	0	1
1450	778	4	207	233	19	59240.37	59240.37	0.00	37282.67	21957.70	1	1	0
1451	758	1000	655	49	35	260772.29	0.00	260772.29	214504.82	46267.47	1	0	1
1452	111	3	148	166	5	71677.47	71677.47	0.00	49762.51	21914.96	1	1	0
1453	75	3	872	100	16	31906.53	31906.53	0.00	19720.75	12185.78	1	1	0
1454	374	3	50	124	10	217677.92	217677.92	0.00	168561.61	49116.31	1	1	0
1455	448	1000	830	178	25	3655.72	0.00	3655.72	2851.48	804.24	1	0	1
1456	788	1000	748	120	13	284215.62	0.00	284215.62	220264.75	63950.87	1	0	1
1457	657	1000	691	24	38	190569.31	0.00	190569.31	151420.20	39149.11	1	0	1
1458	501	3	781	84	46	63813.90	63813.90	0.00	50413.00	13400.90	1	1	0
1459	206	1	40	150	18	34293.93	34293.93	0.00	24890.17	9403.76	1	1	0
1460	189	1000	328	200	14	40747.67	0.00	40747.67	28082.39	12665.28	1	0	1
1461	445	1	570	11	11	147667.96	147667.96	0.00	109214.92	38453.04	1	1	0
1462	99	3	78	110	46	132744.78	132744.78	0.00	108949.27	23795.51	1	1	0
1463	739	1000	517	78	32	24827.73	0.00	24827.73	19222.47	5605.26	1	0	1
1464	255	1000	265	205	28	33648.41	0.00	33648.41	28604.39	5044.02	1	0	1
1465	377	1	702	107	14	128330.51	128330.51	0.00	100097.85	28232.66	1	1	0
1466	720	1000	260	80	36	80469.90	0.00	80469.90	64078.71	16391.19	1	0	1
1467	561	4	499	100	36	7398.94	7398.94	0.00	6659.04	739.90	1	1	0
1468	67	2	766	236	4	129775.98	129775.98	0.00	109011.84	20764.14	1	1	0
1469	853	1000	728	90	22	4607.56	0.00	4607.56	3824.27	783.29	1	0	1
1470	306	1000	323	40	44	183137.97	0.00	183137.97	134345.39	48792.58	1	0	1
1471	17	4	644	2	10	64207.49	64207.49	0.00	49819.44	14388.05	1	1	0
1472	683	1000	48	69	29	162430.43	0.00	162430.43	123468.40	38962.03	1	0	1
1473	845	1	848	178	35	158578.52	158578.52	0.00	103606.10	54972.42	1	1	0
1474	789	1000	445	237	32	6450.21	0.00	6450.21	5224.68	1225.53	1	0	1
1475	748	1000	931	54	35	61897.88	0.00	61897.88	42239.18	19658.70	1	0	1
1476	826	1000	685	97	21	152315.36	0.00	152315.36	103859.10	48456.26	1	0	1
1477	385	1000	242	236	29	96258.96	0.00	96258.96	81461.60	14797.36	1	0	1
1478	397	4	577	80	16	161925.34	161925.34	0.00	123178.23	38747.11	1	1	0
1479	309	1000	173	227	30	178965.53	0.00	178965.53	124195.91	54769.62	1	0	1
1480	415	1000	504	167	7	19007.80	0.00	19007.80	15407.67	3600.13	1	0	1
1481	214	1000	292	83	34	77582.12	0.00	77582.12	56381.71	21200.41	1	0	1
1482	771	1000	811	22	38	15447.70	0.00	15447.70	11894.72	3552.98	1	0	1
1483	454	2	179	244	14	190820.43	190820.43	0.00	125649.55	65170.88	1	1	0
1484	826	2	679	49	4	64915.24	64915.24	0.00	48570.44	16344.80	1	1	0
1485	191	2	407	76	44	78954.64	78954.64	0.00	55053.74	23900.90	1	1	0
1486	490	1000	972	145	13	161399.23	0.00	161399.23	129502.41	31896.82	1	0	1
1487	303	4	566	116	17	645.08	645.08	0.00	477.36	167.72	1	1	0
1488	461	4	350	3	40	11976.57	11976.57	0.00	9210.18	2766.39	1	1	0
1489	98	3	566	210	29	102871.82	102871.82	0.00	82733.07	20138.75	1	1	0
1490	736	3	805	2	34	34204.79	34204.79	0.00	21686.82	12517.97	1	1	0
1491	573	1000	792	79	25	131818.85	0.00	131818.85	100323.76	31495.09	1	0	1
1492	315	2	389	226	38	21374.89	21374.89	0.00	17060.14	4314.75	1	1	0
1493	443	2	8	151	40	92278.48	92278.48	0.00	64019.96	28258.52	1	1	0
1494	254	1	386	190	17	144882.55	144882.55	0.00	115938.52	28944.03	1	1	0
1495	549	1	481	175	30	135058.01	135058.01	0.00	106681.63	28376.38	1	1	0
1496	761	1000	927	116	20	38245.71	0.00	38245.71	26495.12	11750.59	1	0	1
1497	206	1	471	61	14	83537.14	83537.14	0.00	50802.43	32734.71	1	1	0
1498	861	1	592	145	38	261581.35	261581.35	0.00	200395.90	61185.45	1	1	0
1499	312	1	172	200	12	66848.34	66848.34	0.00	51594.43	15253.91	1	1	0
1500	112	3	133	226	18	84670.87	84670.87	0.00	58427.22	26243.65	1	1	0
1501	592	1000	143	149	39	151148.20	0.00	151148.20	124256.70	26891.50	1	0	1
1502	390	1000	836	214	15	14738.08	0.00	14738.08	11643.08	3095.00	1	0	1
1503	123	4	51	29	21	34767.48	34767.48	0.00	25949.76	8817.72	1	1	0
1504	485	1000	432	119	33	40587.20	0.00	40587.20	34004.45	6582.75	1	0	1
1505	81	3	584	141	48	149933.29	149933.29	0.00	112730.55	37202.74	1	1	0
1506	858	1000	136	209	6	92744.06	0.00	92744.06	63996.05	28748.01	1	0	1
1507	275	1000	76	12	29	92665.79	0.00	92665.79	69414.41	23251.38	1	0	1
1508	64	1000	636	129	23	93252.69	0.00	93252.69	65892.18	27360.51	1	0	1
1509	679	1000	559	79	42	199208.50	0.00	199208.50	134007.41	65201.09	1	0	1
1510	328	1000	699	77	13	94844.74	0.00	94844.74	70477.28	24367.46	1	0	1
1511	703	1	559	62	49	9371.66	9371.66	0.00	6005.17	3366.49	1	1	0
1512	274	1000	476	252	3	48962.34	0.00	48962.34	38190.60	10771.74	1	0	1
1513	208	1000	157	58	20	151407.28	0.00	151407.28	103936.68	47470.60	1	0	1
1514	323	1000	434	54	29	28799.14	0.00	28799.14	19871.40	8927.74	1	0	1
1515	686	1000	266	6	8	107933.14	0.00	107933.14	84187.82	23745.32	1	0	1
1516	184	1000	792	102	15	143259.02	0.00	143259.02	99510.53	43748.49	1	0	1
1517	641	2	295	197	42	3081.42	3081.42	0.00	1879.66	1201.76	1	1	0
1518	344	1000	329	88	50	89979.26	0.00	89979.26	57644.90	32334.36	1	0	1
1519	781	1000	242	204	42	38629.38	0.00	38629.38	28931.50	9697.88	1	0	1
1520	552	1000	822	210	32	67682.51	0.00	67682.51	50519.50	17163.01	1	0	1
1521	539	1000	114	217	18	68646.70	0.00	68646.70	61095.60	7551.10	1	0	1
1522	742	1000	873	136	42	71747.77	0.00	71747.77	54150.11	17597.66	1	0	1
1523	302	1000	141	170	12	40832.86	0.00	40832.86	32704.12	8128.74	1	0	1
1524	568	2	546	133	25	60579.54	60579.54	0.00	46646.28	13933.26	1	1	0
1525	856	2	22	110	4	230287.26	230287.26	0.00	147222.64	83064.62	1	1	0
1526	161	3	628	125	21	175588.87	175588.87	0.00	138700.01	36888.86	1	1	0
1527	873	1000	50	205	26	103837.72	0.00	103837.72	79955.06	23882.66	1	0	1
1528	198	1000	345	114	38	28625.16	0.00	28625.16	23447.40	5177.76	1	0	1
1529	470	1000	834	140	9	72227.04	0.00	72227.04	51683.62	20543.42	1	0	1
1530	699	4	130	131	47	85320.38	85320.38	0.00	74292.49	11027.89	1	1	0
1531	840	1000	153	229	28	68682.39	0.00	68682.39	41209.42	27472.97	1	0	1
1532	67	4	479	228	48	164164.14	164164.14	0.00	114546.68	49617.46	1	1	0
1533	231	1000	239	126	25	65849.17	0.00	65849.17	55722.68	10126.49	1	0	1
1534	649	1000	889	22	26	96898.25	0.00	96898.25	78926.15	17972.10	1	0	1
1535	230	2	593	251	5	42481.26	42481.26	0.00	36958.68	5522.58	1	1	0
1536	109	1000	586	100	29	99650.60	0.00	99650.60	83425.64	16224.96	1	0	1
1537	112	1000	939	156	6	181504.84	0.00	181504.84	136934.63	44570.21	1	0	1
1538	86	1000	19	153	49	22076.08	0.00	22076.08	14349.44	7726.64	1	0	1
1539	301	1000	400	42	32	118015.64	0.00	118015.64	82702.72	35312.92	1	0	1
1540	171	1000	466	26	13	153673.41	0.00	153673.41	113876.00	39797.41	1	0	1
1541	383	1000	751	157	28	108163.85	0.00	108163.85	84584.49	23579.36	1	0	1
1542	36	3	839	69	40	18001.05	18001.05	0.00	15326.14	2674.91	1	1	0
1543	497	1	826	5	16	4767.36	4767.36	0.00	4242.96	524.40	1	1	0
1544	254	1000	1125	214	30	62498.63	0.00	62498.63	40743.60	21755.03	1	0	1
1545	862	1	229	192	32	175858.18	175858.18	0.00	131547.02	44311.16	1	1	0
1546	355	1	525	141	21	165137.54	165137.54	0.00	117389.64	47747.90	1	1	0
1547	348	1000	544	145	4	133131.33	0.00	133131.33	99220.12	33911.21	1	0	1
1548	439	4	85	110	49	60707.99	60707.99	0.00	46138.05	14569.94	1	1	0
1549	31	1000	477	63	11	99431.95	0.00	99431.95	79588.64	19843.31	1	0	1
1550	802	1000	758	30	46	159457.15	0.00	159457.15	110067.56	49389.59	1	0	1
1551	252	1000	813	26	23	87862.62	0.00	87862.62	74896.89	12965.73	1	0	1
1552	703	1000	348	87	14	111675.82	0.00	111675.82	82104.32	29571.50	1	0	1
1553	33	1	291	40	17	77746.90	77746.90	0.00	65307.40	12439.50	1	1	0
1554	53	1000	252	235	19	141003.38	0.00	141003.38	111598.35	29405.03	1	0	1
1555	267	2	604	76	37	103345.64	103345.64	0.00	86392.49	16953.15	1	1	0
1556	201	1000	74	234	13	10618.10	0.00	10618.10	7007.95	3610.15	1	0	1
1557	69	3	252	146	28	74974.30	74974.30	0.00	57479.24	17495.06	1	1	0
1558	640	1000	994	11	37	25016.56	0.00	25016.56	19512.92	5503.64	1	0	1
1559	170	1	947	3	38	483.81	483.81	0.00	358.02	125.79	1	1	0
1560	239	1	150	28	32	118574.99	118574.99	0.00	97625.67	20949.32	1	1	0
1561	394	1000	561	165	31	27297.60	0.00	27297.60	23748.88	3548.72	1	0	1
1562	74	2	66	9	28	73335.60	73335.60	0.00	59693.01	13642.59	1	1	0
1563	757	2	799	178	25	158349.89	158349.89	0.00	114305.31	44044.58	1	1	0
1564	463	2	531	244	46	215052.96	215052.96	0.00	153564.77	61488.19	1	1	0
1565	421	1000	771	27	45	21437.87	0.00	21437.87	17313.35	4124.52	1	0	1
1566	224	1000	522	36	21	102797.39	0.00	102797.39	80634.07	22163.32	1	0	1
1567	770	3	384	133	38	259196.98	259196.98	0.00	204639.28	54557.70	1	1	0
1568	634	1000	638	189	14	255644.62	0.00	255644.62	211389.11	44255.51	1	0	1
1569	702	1000	913	206	20	88319.30	0.00	88319.30	79487.30	8832.00	1	0	1
1570	431	1000	359	112	44	70895.88	0.00	70895.88	53652.21	17243.67	1	0	1
1571	529	3	693	33	39	231554.50	231554.50	0.00	152740.29	78814.21	1	1	0
1572	849	1000	328	33	15	52981.05	0.00	52981.05	40132.80	12848.25	1	0	1
1573	875	1000	425	132	7	33356.94	0.00	33356.94	20681.28	12675.66	1	0	1
1574	496	1000	359	198	36	133711.95	0.00	133711.95	102662.20	31049.75	1	0	1
1575	600	4	926	23	42	38974.21	38974.21	0.00	30380.41	8593.80	1	1	0
1576	368	4	492	12	21	15735.18	15735.18	0.00	10195.56	5539.62	1	1	0
1577	356	1000	540	142	20	245738.10	0.00	245738.10	175194.51	70543.59	1	0	1
1578	865	1000	199	59	44	7674.12	0.00	7674.12	4757.94	2916.18	1	0	1
1579	392	2	762	51	2	77376.69	77376.69	0.00	58390.50	18986.19	1	1	0
1580	653	1	899	142	41	57100.12	57100.12	0.00	40175.40	16924.72	1	1	0
1581	224	2	464	81	42	148665.09	148665.09	0.00	113896.53	34768.56	1	1	0
1582	529	1000	204	66	2	124631.24	0.00	124631.24	91857.12	32774.12	1	0	1
1583	159	4	650	31	1	86914.92	86914.92	0.00	71392.29	15522.63	1	1	0
1584	231	1000	237	130	34	69965.95	0.00	69965.95	44755.30	25210.65	1	0	1
1585	707	1000	459	225	4	34401.86	0.00	34401.86	27305.12	7096.74	1	0	1
1586	536	2	721	184	2	213904.64	213904.64	0.00	151225.64	62679.00	1	1	0
1587	630	3	469	97	27	159270.15	159270.15	0.00	105827.23	53442.92	1	1	0
1588	294	3	579	133	20	82760.62	82760.62	0.00	63332.71	19427.91	1	1	0
1589	598	1	390	219	1	169637.42	169637.42	0.00	127863.78	41773.64	1	1	0
1590	207	1	908	186	29	155404.48	155404.48	0.00	116989.93	38414.55	1	1	0
1591	580	1000	451	203	9	76552.47	0.00	76552.47	55883.34	20669.13	1	0	1
1592	95	2	351	2	1	76777.15	76777.15	0.00	55085.75	21691.40	1	1	0
1593	346	4	85	134	15	71125.63	71125.63	0.00	51631.07	19494.56	1	1	0
1594	428	1000	749	153	35	31047.77	0.00	31047.77	23461.70	7586.07	1	0	1
1595	657	1000	499	139	23	80461.02	0.00	80461.02	66287.70	14173.32	1	0	1
1596	315	1000	68	112	12	138998.26	0.00	138998.26	99083.83	39914.43	1	0	1
1597	613	1000	349	218	23	153642.51	0.00	153642.51	104527.68	49114.83	1	0	1
1598	497	1000	220	3	5	5742.57	0.00	5742.57	4249.50	1493.07	1	0	1
1599	40	3	942	49	42	104524.70	104524.70	0.00	74568.11	29956.59	1	1	0
1600	722	1000	791	192	33	34637.53	0.00	34637.53	28594.86	6042.67	1	0	1
1601	425	3	345	72	21	223371.28	223371.28	0.00	169824.78	53546.50	1	1	0
1602	299	3	658	228	31	7001.12	7001.12	0.00	4270.68	2730.44	1	1	0
1603	476	1000	128	204	3	31895.86	0.00	31895.86	23129.56	8766.30	1	0	1
1604	844	3	96	241	20	79066.69	79066.69	0.00	67460.70	11605.99	1	1	0
1605	52	2	678	78	30	39381.24	39381.24	0.00	26779.24	12602.00	1	1	0
1606	770	3	318	95	34	199243.21	199243.21	0.00	159856.74	39386.47	1	1	0
1607	487	1000	385	158	5	143557.01	0.00	143557.01	104499.94	39057.07	1	0	1
1608	154	3	632	12	14	83372.30	83372.30	0.00	61405.35	21966.95	1	1	0
1609	254	3	430	141	6	59780.95	59780.95	0.00	46873.10	12907.85	1	1	0
1610	480	2	693	131	40	37447.34	37447.34	0.00	26587.61	10859.73	1	1	0
1611	302	1000	315	29	45	68646.70	0.00	68646.70	61095.60	7551.10	1	0	1
1612	38	1000	670	35	24	1102.17	0.00	1102.17	749.49	352.68	1	0	1
1613	132	1000	735	65	12	96970.80	0.00	96970.80	63578.53	33392.27	1	0	1
1614	508	1	234	122	36	132291.13	132291.13	0.00	89032.12	43259.01	1	1	0
1615	278	1	639	76	18	71935.10	71935.10	0.00	61864.20	10070.90	1	1	0
1616	865	1000	57	44	17	164755.32	0.00	164755.32	122674.10	42081.22	1	0	1
1617	306	1000	659	151	17	62607.12	0.00	62607.12	42253.68	20353.44	1	0	1
1618	877	1000	812	53	31	156257.11	0.00	156257.11	116116.40	40140.71	1	0	1
1619	390	1000	80	39	41	111805.98	0.00	111805.98	76544.10	35261.88	1	0	1
1620	839	4	376	67	35	30431.90	30431.90	0.00	27388.70	3043.20	1	1	0
1621	486	1000	602	129	1	76496.34	0.00	76496.34	63115.39	13380.95	1	0	1
1622	206	1000	944	113	44	82328.30	0.00	82328.30	69979.10	12349.20	1	0	1
1623	82	1	712	137	48	92350.13	92350.13	0.00	81660.39	10689.74	1	1	0
1624	34	1	701	143	30	116149.75	116149.75	0.00	88781.84	27367.91	1	1	0
1625	361	3	133	244	26	32765.07	32765.07	0.00	25745.72	7019.35	1	1	0
1626	192	1000	571	94	49	58574.40	0.00	58574.40	45102.30	13472.10	1	0	1
1627	654	1	102	94	44	121986.98	121986.98	0.00	96446.39	25540.59	1	1	0
1628	562	2	11	96	39	20213.50	20213.50	0.00	16575.05	3638.45	1	1	0
1629	366	1000	163	211	3	24276.54	0.00	24276.54	17268.76	7007.78	1	0	1
1630	254	1000	909	67	39	41413.94	0.00	41413.94	34576.43	6837.51	1	0	1
1631	503	1000	232	245	45	22795.50	0.00	22795.50	17096.66	5698.84	1	0	1
1632	565	1	810	251	43	161110.31	161110.31	0.00	125862.39	35247.92	1	1	0
1633	123	1	405	230	46	56565.96	56565.96	0.00	41293.16	15272.80	1	1	0
1634	131	1	43	173	32	28438.70	28438.70	0.00	19907.10	8531.60	1	1	0
1635	41	1000	738	64	23	95777.41	0.00	95777.41	75846.52	19930.89	1	0	1
1636	466	1000	762	177	1	164488.70	0.00	164488.70	122351.42	42137.28	1	0	1
1637	747	1000	443	110	1	134809.01	0.00	134809.01	100518.39	34290.62	1	0	1
1638	254	4	946	221	19	174908.20	174908.20	0.00	137413.66	37494.54	1	1	0
1639	733	1000	450	217	45	75643.70	0.00	75643.70	55370.52	20273.18	1	0	1
1640	53	1000	141	62	35	94447.44	0.00	94447.44	67047.96	27399.48	1	0	1
1641	137	1000	928	70	40	52638.11	0.00	52638.11	36680.09	15958.02	1	0	1
1642	254	1000	545	227	31	71888.64	0.00	71888.64	59667.60	12221.04	1	0	1
1643	35	2	806	225	39	97603.00	97603.00	0.00	76130.30	21472.70	1	1	0
1644	152	1000	942	165	50	53032.95	0.00	53032.95	43013.43	10019.52	1	0	1
1645	121	1000	678	185	30	28323.68	0.00	28323.68	24513.68	3810.00	1	0	1
1646	832	1000	263	194	20	66293.76	0.00	66293.76	43899.46	22394.30	1	0	1
1647	609	2	323	209	7	96055.34	96055.34	0.00	79587.98	16467.36	1	1	0
1648	413	4	775	112	37	28255.05	28255.05	0.00	20343.60	7911.45	1	1	0
1649	517	2	736	180	9	56359.14	56359.14	0.00	40084.23	16274.91	1	1	0
1650	223	3	253	12	23	41207.67	41207.67	0.00	32931.47	8276.20	1	1	0
1651	464	3	261	60	15	166776.64	166776.64	0.00	108948.75	57827.89	1	1	0
1652	482	1000	766	246	29	35470.23	0.00	35470.23	26147.14	9323.09	1	0	1
1653	283	1000	849	223	32	168648.46	0.00	168648.46	125438.54	43209.92	1	0	1
1654	400	1000	981	44	38	179182.94	0.00	179182.94	133580.81	45602.13	1	0	1
1655	176	4	517	14	9	114251.57	114251.57	0.00	86704.52	27547.05	1	1	0
1656	254	1000	1275	222	41	15815.95	0.00	15815.95	12066.15	3749.80	1	0	1
1657	277	2	909	42	39	116186.53	116186.53	0.00	80983.01	35203.52	1	1	0
1658	245	1000	728	8	10	131863.41	0.00	131863.41	99476.33	32387.08	1	0	1
1659	807	1000	680	80	40	301529.31	0.00	301529.31	237198.81	64330.50	1	0	1
1660	638	1000	235	144	44	127875.04	0.00	127875.04	95489.30	32385.74	1	0	1
1661	867	3	494	129	13	5321.28	5321.28	0.00	3932.18	1389.10	1	1	0
1662	625	1000	301	173	34	30207.52	0.00	30207.52	20239.04	9968.48	1	0	1
1663	160	1000	537	177	5	104296.63	0.00	104296.63	87451.80	16844.83	1	0	1
1664	765	2	26	166	14	91354.81	91354.81	0.00	73401.50	17953.31	1	1	0
1665	382	1000	58	33	21	105498.22	0.00	105498.22	85720.05	19778.17	1	0	1
1666	820	1000	152	200	24	163409.50	0.00	163409.50	125907.28	37502.22	1	0	1
1667	229	1000	998	167	36	249366.68	0.00	249366.68	201207.66	48159.02	1	0	1
1668	696	1000	11	64	42	38985.87	0.00	38985.87	26922.18	12063.69	1	0	1
1669	627	1	120	84	27	207359.00	207359.00	0.00	172935.82	34423.18	1	1	0
1670	166	4	286	173	14	88261.36	88261.36	0.00	67584.72	20676.64	1	1	0
1671	20	4	926	218	29	68052.15	68052.15	0.00	51156.56	16895.59	1	1	0
1672	781	1000	721	93	7	140724.22	0.00	140724.22	103333.20	37391.02	1	0	1
1673	786	1000	768	19	10	7857.78	0.00	7857.78	5579.00	2278.78	1	0	1
1674	423	1000	74	119	6	36233.01	0.00	36233.01	25079.77	11153.24	1	0	1
1675	563	3	127	80	8	123002.55	123002.55	0.00	96281.55	26721.00	1	1	0
1676	699	3	912	94	6	200513.44	200513.44	0.00	148003.16	52510.28	1	1	0
1677	709	4	476	248	14	28016.27	28016.27	0.00	19804.49	8211.78	1	1	0
1678	832	1000	166	96	44	187059.42	0.00	187059.42	154088.92	32970.50	1	0	1
1679	601	1000	755	180	50	195386.82	0.00	195386.82	145521.41	49865.41	1	0	1
1680	548	3	148	5	23	100143.47	100143.47	0.00	82220.95	17922.52	1	1	0
1681	139	2	136	180	17	109253.90	109253.90	0.00	78569.75	30684.15	1	1	0
1682	426	1000	954	108	15	9817.69	0.00	9817.69	6049.32	3768.37	1	0	1
1683	680	1000	590	191	22	168009.79	0.00	168009.79	117940.29	50069.50	1	0	1
1684	312	2	457	77	6	126587.10	126587.10	0.00	91548.00	35039.10	1	1	0
1685	774	1000	674	226	6	156218.64	0.00	156218.64	110861.49	45357.15	1	0	1
1686	607	1000	379	253	4	118934.98	0.00	118934.98	96156.85	22778.13	1	0	1
1687	284	4	633	150	20	45708.61	45708.61	0.00	33944.34	11764.27	1	1	0
1688	527	4	807	11	17	126047.11	126047.11	0.00	96739.94	29307.17	1	1	0
1689	509	1	30	220	11	37474.78	37474.78	0.00	31853.57	5621.21	1	1	0
1690	508	2	805	2	2	89438.02	89438.02	0.00	58858.24	30579.78	1	1	0
1691	6	4	744	123	37	68644.57	68644.57	0.00	43449.82	25194.75	1	1	0
1692	97	4	413	75	1	47762.70	47762.70	0.00	33499.32	14263.38	1	1	0
1693	182	1000	379	26	32	25461.08	0.00	25461.08	22914.96	2546.12	1	0	1
1694	841	1000	259	209	4	158593.41	0.00	158593.41	121514.30	37079.11	1	0	1
1695	171	2	84	72	36	166137.13	166137.13	0.00	122279.14	43857.99	1	1	0
1696	634	2	17	120	38	136001.33	136001.33	0.00	84725.97	51275.36	1	1	0
1697	254	1	536	44	46	46534.65	46534.65	0.00	32422.39	14112.26	1	1	0
1698	612	1000	628	146	28	60596.64	0.00	60596.64	40599.76	19996.88	1	0	1
1699	705	4	109	184	21	54675.19	54675.19	0.00	37759.99	16915.20	1	1	0
1700	254	2	828	63	25	81568.98	81568.98	0.00	57417.68	24151.30	1	1	0
1701	809	3	841	19	38	148037.90	148037.90	0.00	116361.99	31675.91	1	1	0
1702	388	1000	339	93	15	14747.17	0.00	14747.17	11863.19	2883.98	1	0	1
1703	760	3	797	69	36	90202.80	90202.80	0.00	57481.06	32721.74	1	1	0
1704	315	3	862	134	46	58819.09	58819.09	0.00	48817.49	10001.60	1	1	0
1705	100	4	867	51	26	107481.48	107481.48	0.00	89396.83	18084.65	1	1	0
1706	347	3	397	109	33	119519.70	119519.70	0.00	74797.20	44722.50	1	1	0
1707	740	1000	340	241	34	45501.78	0.00	45501.78	35922.23	9579.55	1	0	1
1708	826	1000	155	196	9	95557.93	0.00	95557.93	75836.06	19721.87	1	0	1
1709	188	1000	572	113	12	58574.40	0.00	58574.40	45102.30	13472.10	1	0	1
1710	344	2	127	40	1	30280.27	30280.27	0.00	24239.26	6041.01	1	1	0
1711	232	2	51	224	7	83758.96	83758.96	0.00	60789.48	22969.48	1	1	0
1712	254	1000	1177	212	49	148191.49	0.00	148191.49	106440.83	41750.66	1	0	1
1713	131	3	951	119	46	155351.83	155351.83	0.00	116885.05	38466.78	1	1	0
1714	290	2	960	218	19	105347.35	105347.35	0.00	89121.76	16225.59	1	1	0
1715	254	3	706	247	50	125135.31	125135.31	0.00	92957.12	32178.19	1	1	0
1716	454	3	70	194	7	145458.05	145458.05	0.00	105791.28	39666.77	1	1	0
1717	853	2	761	32	45	11139.66	11139.66	0.00	8020.56	3119.10	1	1	0
1718	805	1000	13	118	17	65516.30	0.00	65516.30	48000.47	17515.83	1	0	1
1719	760	1000	677	202	16	113385.33	0.00	113385.33	87531.83	25853.50	1	0	1
1720	254	1000	1058	107	34	11605.95	0.00	11605.95	8925.22	2680.73	1	0	1
1721	137	1000	408	87	45	101200.92	0.00	101200.92	78771.31	22429.61	1	0	1
1722	482	1000	83	220	19	70910.25	0.00	70910.25	50603.42	20306.83	1	0	1
1723	96	1	381	198	1	84160.98	84160.98	0.00	57716.70	26444.28	1	1	0
1724	802	1000	630	219	45	115554.15	0.00	115554.15	90242.86	25311.29	1	0	1
1725	586	3	947	127	34	38835.25	38835.25	0.00	30283.01	8552.24	1	1	0
1726	447	1000	517	105	38	44152.16	0.00	44152.16	28698.88	15453.28	1	0	1
1727	152	4	401	157	32	26123.40	26123.40	0.00	16718.96	9404.44	1	1	0
1728	270	3	339	44	46	5490.16	5490.16	0.00	3952.88	1537.28	1	1	0
1729	546	1000	757	103	9	80811.54	0.00	80811.54	55752.39	25059.15	1	0	1
1730	648	1000	768	121	29	98484.94	0.00	98484.94	75029.00	23455.94	1	0	1
1731	234	1000	529	202	31	50673.57	0.00	50673.57	32529.69	18143.88	1	0	1
1732	585	1	714	211	7	116287.19	116287.19	0.00	82809.44	33477.75	1	1	0
1733	772	1000	909	193	47	77722.13	0.00	77722.13	60490.18	17231.95	1	0	1
1734	210	1000	442	188	10	211042.13	0.00	211042.13	133977.47	77064.66	1	0	1
1735	192	3	533	78	42	60201.04	60201.04	0.00	47090.60	13110.44	1	1	0
1736	601	1000	90	96	48	77001.74	0.00	77001.74	62590.12	14411.62	1	0	1
1737	184	1000	543	169	1	121345.83	0.00	121345.83	82055.78	39290.05	1	0	1
1738	240	1000	713	227	29	150315.76	0.00	150315.76	123810.75	26505.01	1	0	1
1739	711	1000	566	119	26	743.64	0.00	743.64	587.49	156.15	1	0	1
1740	173	1000	196	80	37	24622.14	0.00	24622.14	19331.56	5290.58	1	0	1
1741	557	1000	331	186	49	82217.90	0.00	82217.90	62052.66	20165.24	1	0	1
1742	432	3	748	181	3	26808.45	26808.45	0.00	23859.50	2948.95	1	1	0
1743	402	1000	620	199	28	43429.39	0.00	43429.39	32516.19	10913.20	1	0	1
1744	78	1000	266	42	31	6123.69	0.00	6123.69	4225.35	1898.34	1	0	1
1745	365	1000	183	215	12	212449.97	0.00	212449.97	177939.94	34510.03	1	0	1
1746	57	1000	909	155	14	112453.41	0.00	112453.41	71261.29	41192.12	1	0	1
1747	531	3	303	125	45	87838.94	87838.94	0.00	61534.28	26304.66	1	1	0
1748	196	1000	607	220	19	128365.96	0.00	128365.96	95397.76	32968.20	1	0	1
1749	158	4	124	184	19	26944.38	26944.38	0.00	21286.08	5658.30	1	1	0
1750	660	2	961	226	47	106152.08	106152.08	0.00	72852.70	33299.38	1	1	0
1751	439	1000	441	222	12	56202.00	0.00	56202.00	41589.44	14612.56	1	0	1
1752	388	2	795	60	9	31113.00	31113.00	0.00	25512.65	5600.35	1	1	0
1753	325	2	146	128	44	52364.99	52364.99	0.00	38529.07	13835.92	1	1	0
1754	254	2	434	226	31	48569.08	48569.08	0.00	39582.22	8986.86	1	1	0
1755	3	1000	622	190	5	88802.13	0.00	88802.13	70266.98	18535.15	1	0	1
1756	512	3	864	134	7	78487.00	78487.00	0.00	65118.61	13368.39	1	1	0
1757	502	3	822	145	44	223932.67	223932.67	0.00	185979.27	37953.40	1	1	0
1758	102	1000	888	180	27	181331.05	0.00	181331.05	128607.43	52723.62	1	0	1
1759	704	3	73	48	24	120110.64	120110.64	0.00	92180.20	27930.44	1	1	0
1760	575	2	976	251	10	88026.64	88026.64	0.00	63479.02	24547.62	1	1	0
1761	415	2	840	81	7	244727.04	244727.04	0.00	163152.02	81575.02	1	1	0
1762	395	2	570	141	11	85963.28	85963.28	0.00	71754.96	14208.32	1	1	0
1763	328	2	19	166	35	102710.05	102710.05	0.00	75416.64	27293.41	1	1	0
1764	717	1000	248	89	18	16031.32	0.00	16031.32	11702.88	4328.44	1	0	1
1765	775	2	575	203	17	45570.50	45570.50	0.00	39759.69	5810.81	1	1	0
1766	267	1000	689	180	49	41653.92	0.00	41653.92	29990.82	11663.10	1	0	1
1767	217	4	466	9	41	17429.90	17429.90	0.00	14118.22	3311.68	1	1	0
1768	454	4	254	242	8	178398.40	178398.40	0.00	133544.11	44854.29	1	1	0
1769	742	1	561	31	33	69511.74	69511.74	0.00	56054.03	13457.71	1	1	0
1770	593	4	962	228	23	107474.46	107474.46	0.00	78429.99	29044.47	1	1	0
1771	500	2	887	230	26	49675.31	49675.31	0.00	39832.66	9842.65	1	1	0
1772	721	1000	865	151	19	34143.29	0.00	34143.29	23848.56	10294.73	1	0	1
1773	299	1000	936	223	12	164875.02	0.00	164875.02	134474.65	30400.37	1	0	1
1774	233	3	989	119	26	66168.53	66168.53	0.00	48450.00	17718.53	1	1	0
1775	94	2	684	246	31	9480.16	9480.16	0.00	8447.40	1032.76	1	1	0
1776	838	1	252	57	33	18896.16	18896.16	0.00	14550.08	4346.08	1	1	0
1777	33	1000	983	185	27	110590.94	0.00	110590.94	86394.15	24196.79	1	0	1
1778	244	1000	348	75	19	213105.57	0.00	213105.57	156123.56	56982.01	1	0	1
1779	628	4	721	21	23	44011.84	44011.84	0.00	36529.84	7482.00	1	1	0
1780	638	2	561	126	47	147677.93	147677.93	0.00	108249.03	39428.90	1	1	0
1781	675	1000	998	81	25	2299.30	0.00	2299.30	1793.50	505.80	1	0	1
1782	326	1	235	207	47	7683.60	7683.60	0.00	5224.85	2458.75	1	1	0
1783	115	3	332	237	29	90268.12	90268.12	0.00	70876.70	19391.42	1	1	0
1784	798	1000	187	218	2	202833.34	0.00	202833.34	152630.31	50203.03	1	0	1
1785	320	1000	136	148	20	64941.54	0.00	64941.54	47710.72	17230.82	1	0	1
1786	330	1000	964	244	41	18762.42	0.00	18762.42	14634.69	4127.73	1	0	1
1787	696	1000	948	161	28	171737.02	0.00	171737.02	118960.96	52776.06	1	0	1
1788	668	4	684	42	9	185441.27	185441.27	0.00	153187.52	32253.75	1	1	0
1789	358	1	566	118	45	188540.94	188540.94	0.00	154829.95	33710.99	1	1	0
1790	866	1	401	151	15	94299.40	94299.40	0.00	72532.49	21766.91	1	1	0
1791	451	1000	651	233	39	42605.49	0.00	42605.49	37287.88	5317.61	1	0	1
1792	598	1	384	30	9	95161.12	95161.12	0.00	66512.12	28649.00	1	1	0
1793	611	1000	152	175	42	40705.04	0.00	40705.04	27654.25	13050.79	1	0	1
1794	355	1000	652	170	25	75569.67	0.00	75569.67	45341.82	30227.85	1	0	1
1795	692	1000	572	13	25	19165.48	0.00	19165.48	13415.84	5749.64	1	0	1
1796	646	1000	927	86	39	5036.82	0.00	5036.82	3992.69	1044.13	1	0	1
1797	245	1000	592	199	29	143987.02	0.00	143987.02	103625.16	40361.86	1	0	1
1798	169	1	964	123	27	84628.22	84628.22	0.00	67772.38	16855.84	1	1	0
1799	341	1000	770	39	28	98509.48	0.00	98509.48	88125.20	10384.28	1	0	1
1800	575	1000	150	245	36	28735.77	0.00	28735.77	20545.35	8190.42	1	0	1
1801	725	1000	231	98	10	110629.25	0.00	110629.25	92345.12	18284.13	1	0	1
1802	478	1000	940	108	37	88712.86	0.00	88712.86	78899.82	9813.04	1	0	1
1803	128	4	746	249	42	35912.80	35912.80	0.00	25139.00	10773.80	1	1	0
1804	198	1000	241	67	26	139143.22	0.00	139143.22	101274.30	37868.92	1	0	1
1805	167	1000	897	107	46	68250.04	0.00	68250.04	58409.76	9840.28	1	0	1
1806	66	1	700	221	39	54234.64	54234.64	0.00	37468.72	16765.92	1	1	0
1807	823	3	890	185	39	99092.38	99092.38	0.00	77267.40	21824.98	1	1	0
1808	825	1000	44	190	29	124913.04	0.00	124913.04	95944.13	28968.91	1	0	1
1809	254	1000	618	133	8	130547.94	0.00	130547.94	91222.00	39325.94	1	0	1
1810	353	1000	337	122	25	55594.90	0.00	55594.90	34468.80	21126.10	1	0	1
1811	534	1000	553	85	14	95410.49	0.00	95410.49	66434.70	28975.79	1	0	1
1812	254	3	418	163	1	101173.07	101173.07	0.00	87520.81	13652.26	1	1	0
1813	488	1000	634	61	23	39345.39	0.00	39345.39	31726.57	7618.82	1	0	1
1814	614	4	381	219	37	19532.16	19532.16	0.00	16797.68	2734.48	1	1	0
1815	654	1000	805	76	26	98165.73	0.00	98165.73	64831.37	33334.36	1	0	1
1816	659	2	141	161	6	68309.24	68309.24	0.00	52886.96	15422.28	1	1	0
1817	100	1000	735	79	44	74148.15	0.00	74148.15	54385.08	19763.07	1	0	1
1818	728	1000	946	79	10	122566.70	0.00	122566.70	85091.27	37475.43	1	0	1
1819	520	1000	124	127	6	38661.35	0.00	38661.35	32845.86	5815.49	1	0	1
1820	551	1000	976	208	27	121335.44	0.00	121335.44	94326.32	27009.12	1	0	1
1821	640	1000	552	202	45	75669.48	0.00	75669.48	55694.70	19974.78	1	0	1
1822	591	1000	427	108	26	130293.26	0.00	130293.26	106835.40	23457.86	1	0	1
1823	777	2	471	65	50	97482.60	97482.60	0.00	74256.37	23226.23	1	1	0
1824	20	2	924	66	23	47719.03	47719.03	0.00	36304.35	11414.68	1	1	0
1825	668	1000	825	155	5	139833.17	0.00	139833.17	90174.51	49658.66	1	0	1
1826	301	1000	769	120	9	195292.88	0.00	195292.88	131459.70	63833.18	1	0	1
1827	496	1000	138	223	13	261379.16	0.00	261379.16	190447.00	70932.16	1	0	1
1828	274	4	606	151	50	39631.38	39631.38	0.00	26929.32	12702.06	1	1	0
1829	739	1000	563	200	29	153382.34	0.00	153382.34	116664.93	36717.41	1	0	1
1830	25	1	527	151	10	83799.83	83799.83	0.00	54237.73	29562.10	1	1	0
1831	795	3	11	139	37	32187.06	32187.06	0.00	21983.46	10203.60	1	1	0
1832	442	1000	322	37	49	177145.76	0.00	177145.76	128987.40	48158.36	1	0	1
1833	113	1000	1000	194	9	246192.76	0.00	246192.76	173387.23	72805.53	1	0	1
1834	287	1000	901	55	11	8009.90	0.00	8009.90	5687.03	2322.87	1	0	1
1835	769	4	898	146	36	66473.55	66473.55	0.00	44362.74	22110.81	1	1	0
1836	447	1000	99	209	42	95738.40	0.00	95738.40	77994.33	17744.07	1	0	1
1837	820	1	106	138	36	94699.91	94699.91	0.00	73336.31	21363.60	1	1	0
1838	335	4	765	31	6	45359.84	45359.84	0.00	34333.72	11026.12	1	1	0
1839	799	1	193	177	5	137433.56	137433.56	0.00	87738.93	49694.63	1	1	0
1840	868	2	271	68	8	160274.71	160274.71	0.00	126539.46	33735.25	1	1	0
1841	254	1000	889	73	18	44155.06	0.00	44155.06	30816.31	13338.75	1	0	1
1842	254	1000	321	142	20	71254.42	0.00	71254.42	52911.94	18342.48	1	0	1
1843	563	1000	306	186	35	92733.90	0.00	92733.90	74738.39	17995.51	1	0	1
1844	828	2	63	188	42	223264.33	223264.33	0.00	163428.97	59835.36	1	1	0
1845	399	1000	471	161	18	14965.90	0.00	14965.90	12122.38	2843.52	1	0	1
1846	856	1000	785	248	9	81678.74	0.00	81678.74	54589.62	27089.12	1	0	1
1847	734	1000	479	154	20	54710.23	0.00	54710.23	42895.20	11815.03	1	0	1
1848	365	2	877	164	33	53914.60	53914.60	0.00	48523.10	5391.50	1	1	0
1849	393	1	812	30	5	15061.76	15061.76	0.00	10995.08	4066.68	1	1	0
1850	804	1000	885	152	19	36405.91	0.00	36405.91	23758.63	12647.28	1	0	1
1851	563	2	108	243	9	122257.76	122257.76	0.00	97737.14	24520.62	1	1	0
1852	125	4	794	207	48	105480.88	105480.88	0.00	77114.90	28365.98	1	1	0
1853	513	1000	295	58	10	29922.89	0.00	29922.89	22599.01	7323.88	1	0	1
1854	273	1000	558	56	33	75484.12	0.00	75484.12	58256.96	17227.16	1	0	1
1855	518	1000	743	23	15	9619.36	0.00	9619.36	5867.80	3751.56	1	0	1
1856	184	1	716	136	11	89705.16	89705.16	0.00	68175.90	21529.26	1	1	0
1857	362	1000	350	250	30	73181.07	0.00	73181.07	59988.87	13192.20	1	0	1
1858	254	3	594	73	35	37695.84	37695.84	0.00	26010.12	11685.72	1	1	0
1859	317	3	405	221	35	67628.34	67628.34	0.00	49310.48	18317.86	1	1	0
1860	769	2	341	235	26	184567.96	184567.96	0.00	131835.54	52732.42	1	1	0
1861	472	1000	364	4	26	156588.00	0.00	156588.00	127223.64	29364.36	1	0	1
1862	297	1	912	207	47	61004.65	61004.65	0.00	49413.77	11590.88	1	1	0
1863	163	3	90	195	2	15843.20	15843.20	0.00	10614.96	5228.24	1	1	0
1864	45	2	852	50	2	9766.05	9766.05	0.00	6836.22	2929.83	1	1	0
1865	739	1	359	13	37	68251.10	68251.10	0.00	58013.13	10237.97	1	1	0
1866	810	1000	454	144	29	150011.50	0.00	150011.50	97163.18	52848.32	1	0	1
1867	822	4	37	117	20	19129.59	19129.59	0.00	13773.30	5356.29	1	1	0
1868	258	1000	242	198	2	145557.00	0.00	145557.00	121994.37	23562.63	1	0	1
1869	52	2	772	52	12	87606.26	87606.26	0.00	68716.76	18889.50	1	1	0
1870	254	3	871	200	36	111056.88	111056.88	0.00	89264.83	21792.05	1	1	0
1871	556	1000	542	168	42	98842.71	0.00	98842.71	83258.29	15584.42	1	0	1
1872	536	3	385	68	29	169860.48	169860.48	0.00	128469.43	41391.05	1	1	0
1873	520	1000	98	100	31	155908.32	0.00	155908.32	114920.10	40988.22	1	0	1
1874	254	2	114	252	19	1247.62	1247.62	0.00	773.52	474.10	1	1	0
1875	529	2	742	199	48	79989.93	79989.93	0.00	63213.86	16776.07	1	1	0
1876	600	2	29	205	29	189522.85	189522.85	0.00	137456.70	52066.15	1	1	0
1877	581	1000	183	154	32	62371.71	0.00	62371.71	43146.52	19225.19	1	0	1
1878	546	2	791	61	35	101111.95	101111.95	0.00	80901.29	20210.66	1	1	0
1879	272	2	816	12	46	156349.64	156349.64	0.00	128436.21	27913.43	1	1	0
1880	412	2	141	132	18	5233.99	5233.99	0.00	3815.57	1418.42	1	1	0
1881	371	4	219	69	13	74197.28	74197.28	0.00	51063.16	23134.12	1	1	0
1882	351	2	588	56	36	26144.85	26144.85	0.00	21177.33	4967.52	1	1	0
1883	165	3	866	120	13	92333.05	92333.05	0.00	82034.05	10299.00	1	1	0
1884	306	1000	784	213	18	23429.78	0.00	23429.78	17205.29	6224.49	1	0	1
1885	217	3	565	140	8	42433.70	42433.70	0.00	27006.45	15427.25	1	1	0
1886	1	1000	938	208	6	79444.45	0.00	79444.45	53467.79	25976.66	1	0	1
1887	276	3	580	219	32	71842.96	71842.96	0.00	54600.64	17242.32	1	1	0
1888	148	3	767	118	8	47101.52	47101.52	0.00	37681.20	9420.32	1	1	0
1889	836	1000	703	147	36	32158.33	0.00	32158.33	20430.91	11727.42	1	0	1
1890	340	2	306	18	11	87003.57	87003.57	0.00	70598.33	16405.24	1	1	0
1891	481	2	742	40	12	78296.87	78296.87	0.00	61696.72	16600.15	1	1	0
1892	241	1000	438	187	12	116939.59	0.00	116939.59	92013.67	24925.92	1	0	1
1893	633	1000	292	131	22	157631.98	0.00	157631.98	100387.15	57244.83	1	0	1
1894	788	1000	460	83	43	157797.12	0.00	157797.12	107432.64	50364.48	1	0	1
1895	254	1000	1101	51	7	158782.46	0.00	158782.46	120223.41	38559.05	1	0	1
1896	6	3	11	121	48	9624.58	9624.58	0.00	7025.94	2598.64	1	1	0
1897	696	1000	632	89	43	34644.60	0.00	34644.60	26530.35	8114.25	1	0	1
1898	612	1	254	43	1	51235.62	51235.62	0.00	36016.25	15219.37	1	1	0
1899	639	4	581	64	7	46962.01	46962.01	0.00	34808.42	12153.59	1	1	0
1900	89	1000	128	44	43	37412.12	0.00	37412.12	30996.98	6415.14	1	0	1
1901	649	1000	17	92	43	19062.96	0.00	19062.96	13153.44	5909.52	1	0	1
1902	655	2	401	246	17	199759.40	199759.40	0.00	158481.73	41277.67	1	1	0
1903	694	1000	607	115	42	85339.38	0.00	85339.38	68649.22	16690.16	1	0	1
1904	784	1	324	136	17	89281.60	89281.60	0.00	70452.23	18829.37	1	1	0
1905	437	1000	898	160	15	175148.84	0.00	175148.84	140392.68	34756.16	1	0	1
1906	520	1	400	69	37	53108.51	53108.51	0.00	34544.00	18564.51	1	1	0
1907	306	2	425	201	3	221910.26	221910.26	0.00	177982.19	43928.07	1	1	0
1908	83	1000	305	139	21	91196.07	0.00	91196.07	71072.18	20123.89	1	0	1
1909	242	4	148	172	50	37489.74	37489.74	0.00	29480.82	8008.92	1	1	0
1910	699	1000	755	225	45	89421.66	0.00	89421.66	72137.13	17284.53	1	0	1
1911	239	1000	891	57	39	29791.47	0.00	29791.47	22045.68	7745.79	1	0	1
1912	254	1000	1060	147	30	97295.04	0.00	97295.04	74946.66	22348.38	1	0	1
1913	387	2	943	93	21	5363.28	5363.28	0.00	3271.59	2091.69	1	1	0
1914	755	1	732	128	25	218108.77	218108.77	0.00	146294.67	71814.10	1	1	0
1915	735	1000	453	184	34	123856.53	0.00	123856.53	89539.16	34317.37	1	0	1
1916	101	1	417	166	17	91475.21	91475.21	0.00	77702.05	13773.16	1	1	0
1917	762	1000	228	53	27	56449.34	0.00	56449.34	37938.14	18511.20	1	0	1
1918	442	1000	317	138	33	58495.04	0.00	58495.04	40956.63	17538.41	1	0	1
1919	25	1000	797	178	40	4384.16	0.00	4384.16	3551.20	832.96	1	0	1
1920	83	1	240	146	16	183096.96	183096.96	0.00	131918.24	51178.72	1	1	0
1921	574	1000	612	157	37	110863.29	0.00	110863.29	89913.19	20950.10	1	0	1
1922	254	1000	760	27	39	92385.24	0.00	92385.24	66072.81	26312.43	1	0	1
1923	575	1000	258	230	28	30685.20	0.00	30685.20	21067.21	9617.99	1	0	1
1924	842	1000	586	182	39	89214.41	0.00	89214.41	58430.66	30783.75	1	0	1
1925	339	3	675	85	5	77057.69	77057.69	0.00	59445.72	17611.97	1	1	0
1926	802	1000	274	200	21	7729.68	0.00	7729.68	6415.63	1314.05	1	0	1
1927	114	1000	862	133	9	33649.56	0.00	33649.56	22881.69	10767.87	1	0	1
1928	577	1000	736	163	27	58561.80	0.00	58561.80	45678.18	12883.62	1	0	1
1929	665	1000	233	2	40	95839.73	0.00	95839.73	82390.76	13448.97	1	0	1
1930	601	3	918	97	5	26804.50	26804.50	0.00	21762.86	5041.64	1	1	0
1931	812	1	365	45	15	82346.13	82346.13	0.00	50231.16	32114.97	1	1	0
1932	192	1000	510	157	8	155937.24	0.00	155937.24	107987.48	47949.76	1	0	1
1933	53	1000	603	50	33	194496.16	0.00	194496.16	142408.30	52087.86	1	0	1
1934	672	3	647	92	50	101618.05	101618.05	0.00	74645.04	26973.01	1	1	0
1935	851	2	24	174	47	40959.44	40959.44	0.00	34886.80	6072.64	1	1	0
1936	287	1000	230	3	36	79857.14	0.00	79857.14	58126.16	21730.98	1	0	1
1937	49	1000	778	99	19	101265.46	0.00	101265.46	72767.52	28497.94	1	0	1
1938	511	1000	55	101	34	93776.63	0.00	93776.63	75952.33	17824.30	1	0	1
1939	62	1	5	15	22	129962.84	129962.84	0.00	108101.07	21861.77	1	1	0
1940	678	3	54	111	27	80355.86	80355.86	0.00	53252.94	27102.92	1	1	0
1941	204	1000	363	203	30	35400.88	0.00	35400.88	22302.56	13098.32	1	0	1
1942	65	3	949	64	12	64989.06	64989.06	0.00	51074.34	13914.72	1	1	0
1943	188	1	582	95	46	95721.88	95721.88	0.00	73350.27	22371.61	1	1	0
1944	297	2	833	211	8	125998.98	125998.98	0.00	94413.93	31585.05	1	1	0
1945	859	4	127	149	9	142967.76	142967.76	0.00	106828.01	36139.75	1	1	0
1946	326	4	414	66	37	171522.00	171522.00	0.00	127283.32	44238.68	1	1	0
1947	295	1000	228	22	47	76256.20	0.00	76256.20	57317.88	18938.32	1	0	1
1948	878	1000	13	164	2	68017.44	0.00	68017.44	48667.88	19349.56	1	0	1
1949	680	1000	509	56	39	42434.32	0.00	42434.32	29871.70	12562.62	1	0	1
1950	363	1000	628	138	2	72295.60	0.00	72295.60	52690.30	19605.30	1	0	1
1951	270	1000	558	132	13	68295.91	0.00	68295.91	53322.30	14973.61	1	0	1
1952	86	1	184	170	19	131495.50	131495.50	0.00	103253.76	28241.74	1	1	0
1953	728	1000	512	201	12	57566.69	0.00	57566.69	46774.97	10791.72	1	0	1
1954	83	1000	476	236	44	75136.82	0.00	75136.82	60644.03	14492.79	1	0	1
1955	60	1000	869	46	10	63237.72	0.00	63237.72	53111.92	10125.80	1	0	1
1956	254	1000	562	39	31	54375.30	0.00	54375.30	37518.95	16856.35	1	0	1
1957	746	2	362	12	50	89216.46	89216.46	0.00	59487.82	29728.64	1	1	0
1958	685	1000	613	52	29	37869.28	0.00	37869.28	25876.41	11992.87	1	0	1
1959	655	2	188	33	12	2691.38	2691.38	0.00	2045.45	645.93	1	1	0
1960	254	1000	194	13	18	26662.99	0.00	26662.99	19091.12	7571.87	1	0	1
1961	152	1000	282	53	34	53351.09	0.00	53351.09	37033.07	16318.02	1	0	1
1962	215	1000	798	72	10	58870.62	0.00	58870.62	35322.36	23548.26	1	0	1
1963	180	1000	153	70	31	53567.60	0.00	53567.60	39212.05	14355.55	1	0	1
1964	512	1	489	121	9	169538.43	169538.43	0.00	142196.14	27342.29	1	1	0
1965	225	3	80	82	11	82861.65	82861.65	0.00	61497.27	21364.38	1	1	0
1966	207	1000	67	208	29	78747.32	0.00	78747.32	56559.30	22188.02	1	0	1
1967	661	3	225	155	44	89650.78	89650.78	0.00	75476.38	14174.40	1	1	0
1968	743	1000	80	141	7	142372.59	0.00	142372.59	108203.20	34169.39	1	0	1
1969	687	1000	866	138	9	51018.59	0.00	51018.59	38263.96	12754.63	1	0	1
1970	714	3	662	157	27	140022.10	140022.10	0.00	124619.66	15402.44	1	1	0
1971	437	3	953	94	41	57068.88	57068.88	0.00	45655.06	11413.82	1	1	0
1972	331	1000	140	131	6	118905.85	0.00	118905.85	92078.02	26827.83	1	0	1
1973	6	1	621	45	17	159381.48	159381.48	0.00	123500.56	35880.92	1	1	0
1974	802	4	73	16	46	127424.92	127424.92	0.00	105569.20	21855.72	1	1	0
1975	810	2	170	143	1	111222.31	111222.31	0.00	83547.05	27675.26	1	1	0
1976	45	1000	671	163	30	123360.28	0.00	123360.28	91387.41	31972.87	1	0	1
1977	763	2	595	190	32	19095.81	19095.81	0.00	17186.22	1909.59	1	1	0
1978	637	4	207	249	41	186461.39	186461.39	0.00	131186.02	55275.37	1	1	0
1979	254	1	303	126	39	93219.15	93219.15	0.00	66850.27	26368.88	1	1	0
1980	266	1000	296	73	26	30347.71	0.00	30347.71	20344.29	10003.42	1	0	1
1981	477	1000	876	32	1	127922.66	0.00	127922.66	99584.24	28338.42	1	0	1
1982	47	2	502	68	37	87059.76	87059.76	0.00	69551.41	17508.35	1	1	0
1983	484	1000	312	72	44	87966.76	0.00	87966.76	76605.76	11361.00	1	0	1
1984	862	1000	454	125	43	4601.46	0.00	4601.46	3267.03	1334.43	1	0	1
1985	676	3	886	163	11	108260.07	108260.07	0.00	77673.39	30586.68	1	1	0
1986	647	1	448	44	48	66064.30	66064.30	0.00	42941.80	23122.50	1	1	0
1987	135	1000	395	121	20	26170.44	0.00	26170.44	22319.16	3851.28	1	0	1
1988	436	1000	491	51	42	59510.78	0.00	59510.78	44515.09	14995.69	1	0	1
1989	336	1000	311	208	9	89861.95	0.00	89861.95	69624.66	20237.29	1	0	1
1990	784	1000	777	90	44	76828.47	0.00	76828.47	54693.73	22134.74	1	0	1
1991	28	1	2	239	35	52745.81	52745.81	0.00	38487.20	14258.61	1	1	0
1992	583	3	988	116	43	73369.79	73369.79	0.00	48356.18	25013.61	1	1	0
1993	254	3	972	189	19	79134.32	79134.32	0.00	60685.38	18448.94	1	1	0
1994	667	1000	908	230	8	27561.32	0.00	27561.32	18190.48	9370.84	1	0	1
1995	4	4	586	40	12	57060.00	57060.00	0.00	45211.17	11848.83	1	1	0
1996	254	1000	672	93	11	4908.48	0.00	4908.48	3632.28	1276.20	1	0	1
1997	663	1	99	82	38	103828.71	103828.71	0.00	77055.14	26773.57	1	1	0
1998	441	1000	689	243	8	99717.80	0.00	99717.80	84047.90	15669.90	1	0	1
1999	57	1000	511	72	19	69591.74	0.00	69591.74	47679.54	21912.20	1	0	1
2000	540	3	483	49	17	247696.41	247696.41	0.00	173593.31	74103.10	1	1	0
2001	649	1000	426	150	14	22732.20	0.00	22732.20	14548.62	8183.58	1	0	1
2002	277	1000	536	38	48	171944.32	0.00	171944.32	114264.91	57679.41	1	0	1
2003	392	1000	899	177	25	5141.84	0.00	5141.84	3889.46	1252.38	1	0	1
2004	141	1000	53	189	30	84141.76	0.00	84141.76	58930.44	25211.32	1	0	1
2005	42	1000	11	234	4	49823.16	0.00	49823.16	35872.68	13950.48	1	0	1
2006	254	1	310	184	37	175507.09	175507.09	0.00	127886.72	47620.37	1	1	0
2007	254	1000	548	163	29	143168.16	0.00	143168.16	100890.09	42278.07	1	0	1
2008	231	1000	312	101	50	99266.58	0.00	99266.58	82558.30	16708.28	1	0	1
2009	713	2	171	233	17	103831.68	103831.68	0.00	80662.31	23169.37	1	1	0
2010	507	1000	736	251	3	32693.94	0.00	32693.94	26482.05	6211.89	1	0	1
2011	377	1000	366	78	3	174708.73	0.00	174708.73	135435.30	39273.43	1	0	1
2012	842	4	845	119	31	158154.49	158154.49	0.00	121058.97	37095.52	1	1	0
2013	537	1000	492	216	40	85590.16	0.00	85590.16	62362.58	23227.58	1	0	1
2014	632	1	898	207	21	94720.94	94720.94	0.00	69015.32	25705.62	1	1	0
2015	719	1000	510	125	4	134770.28	0.00	134770.28	114415.57	20354.71	1	0	1
2016	861	1000	727	168	37	51650.28	0.00	51650.28	46485.24	5165.04	1	0	1
2017	503	2	675	249	39	142538.37	142538.37	0.00	111848.17	30690.20	1	1	0
2018	347	2	145	161	45	68171.22	68171.22	0.00	45674.73	22496.49	1	1	0
2019	102	1	857	74	10	20.10	20.10	0.00	16.28	3.82	1	1	0
2020	792	1	781	153	7	80521.96	80521.96	0.00	66704.95	13817.01	1	1	0
2021	145	1000	97	134	18	60305.00	0.00	60305.00	49387.07	10917.93	1	0	1
2022	254	1000	352	85	19	160049.01	0.00	160049.01	127830.64	32218.37	1	0	1
2023	811	1000	162	203	2	68342.32	0.00	68342.32	58678.80	9663.52	1	0	1
2024	856	2	452	140	10	188312.28	188312.28	0.00	139051.68	49260.60	1	1	0
2025	347	3	418	250	10	85676.00	85676.00	0.00	67300.51	18375.49	1	1	0
2026	370	1000	730	103	10	177245.93	0.00	177245.93	147368.50	29877.43	1	0	1
2027	324	1000	643	97	45	17776.25	0.00	17776.25	13509.95	4266.30	1	0	1
2028	59	1000	438	97	43	104124.25	0.00	104124.25	80582.35	23541.90	1	0	1
2029	504	1	356	65	31	66246.62	66246.62	0.00	51949.07	14297.55	1	1	0
2030	595	1000	348	115	37	136935.95	0.00	136935.95	108902.08	28033.87	1	0	1
2031	359	4	926	84	10	22854.69	22854.69	0.00	15084.09	7770.60	1	1	0
2032	355	1	48	211	24	102352.23	102352.23	0.00	78249.97	24102.26	1	1	0
2033	804	1	287	56	10	61884.20	61884.20	0.00	53220.40	8663.80	1	1	0
2034	559	1000	24	252	39	128575.78	0.00	128575.78	84902.99	43672.79	1	0	1
2035	824	1000	251	136	14	137350.85	0.00	137350.85	96991.38	40359.47	1	0	1
2036	17	3	841	204	40	79256.73	79256.73	0.00	52382.03	26874.70	1	1	0
2037	95	3	432	14	50	49397.00	49397.00	0.00	34577.90	14819.10	1	1	0
2038	696	3	114	202	7	114189.82	114189.82	0.00	81094.47	33095.35	1	1	0
2039	433	1000	174	6	30	182934.37	0.00	182934.37	130595.46	52338.91	1	0	1
2040	137	1000	75	187	18	66304.46	0.00	66304.46	46354.53	19949.93	1	0	1
2041	581	3	85	182	42	138541.38	138541.38	0.00	100928.82	37612.56	1	1	0
2042	207	1000	586	223	38	113405.22	0.00	113405.22	89621.96	23783.26	1	0	1
2043	407	1	998	139	9	13021.40	13021.40	0.00	9114.96	3906.44	1	1	0
2044	565	1	163	130	45	26558.82	26558.82	0.00	20431.34	6127.48	1	1	0
2045	254	1000	76	94	18	163355.94	0.00	163355.94	128704.10	34651.84	1	0	1
2046	339	4	753	149	34	200422.15	200422.15	0.00	148760.31	51661.84	1	1	0
2047	12	1000	368	41	29	62666.00	0.00	62666.00	49102.98	13563.02	1	0	1
2048	139	1000	674	227	19	70330.12	0.00	70330.12	48799.90	21530.22	1	0	1
2049	825	1000	377	207	31	58352.17	0.00	58352.17	39583.51	18768.66	1	0	1
2050	451	1	885	37	37	54047.56	54047.56	0.00	47561.85	6485.71	1	1	0
2051	191	1	215	171	33	94464.39	94464.39	0.00	62695.20	31769.19	1	1	0
2052	465	1000	801	40	39	29978.76	0.00	29978.76	22404.40	7574.36	1	0	1
2053	792	2	595	70	50	56143.01	56143.01	0.00	39861.57	16281.44	1	1	0
2054	163	1000	2	162	2	126956.16	0.00	126956.16	84004.21	42951.95	1	0	1
2055	167	1000	994	50	3	145339.52	0.00	145339.52	118936.05	26403.47	1	0	1
2056	445	3	749	248	23	37440.30	37440.30	0.00	31559.40	5880.90	1	1	0
2057	563	1000	169	244	18	77499.83	0.00	77499.83	63627.46	13872.37	1	0	1
2058	428	2	844	251	1	98590.08	98590.08	0.00	78542.94	20047.14	1	1	0
2059	534	1	349	144	32	99092.97	99092.97	0.00	72476.63	26616.34	1	1	0
2060	72	1000	311	78	41	7765.54	0.00	7765.54	6756.02	1009.52	1	0	1
2061	543	1000	744	247	41	102174.98	0.00	102174.98	73475.54	28699.44	1	0	1
2062	243	1000	184	212	39	181142.08	0.00	181142.08	130722.64	50419.44	1	0	1
2063	420	4	196	189	38	105805.66	105805.66	0.00	84815.94	20989.72	1	1	0
2064	47	1000	185	252	21	119715.49	0.00	119715.49	86722.98	32992.51	1	0	1
2065	254	2	984	232	16	111162.47	111162.47	0.00	91177.23	19985.24	1	1	0
2066	331	1000	436	241	11	106769.17	0.00	106769.17	76977.91	29791.26	1	0	1
2067	73	1000	569	37	19	7229.71	0.00	7229.71	5858.42	1371.29	1	0	1
2068	218	1000	249	155	9	88787.56	0.00	88787.56	75292.48	13495.08	1	0	1
2069	198	2	26	158	16	76552.47	76552.47	0.00	55883.34	20669.13	1	1	0
2070	813	1000	515	11	3	62818.25	0.00	62818.25	43071.30	19746.95	1	0	1
2071	678	4	281	251	39	139151.10	139151.10	0.00	105682.37	33468.73	1	1	0
2072	797	4	230	144	28	117131.62	117131.62	0.00	96690.87	20440.75	1	1	0
2073	875	1000	981	178	45	171725.27	0.00	171725.27	123143.47	48581.80	1	0	1
2074	254	1000	1073	54	5	202504.52	0.00	202504.52	171981.88	30522.64	1	0	1
2075	457	1000	226	250	2	169396.69	0.00	169396.69	138304.26	31092.43	1	0	1
2076	741	3	632	151	43	63372.78	63372.78	0.00	48844.04	14528.74	1	1	0
2077	3	1000	767	171	17	47160.46	0.00	47160.46	36772.38	10388.08	1	0	1
2078	296	1000	318	186	13	87895.77	0.00	87895.77	69474.77	18421.00	1	0	1
2079	417	1	998	100	10	19128.96	19128.96	0.00	15111.88	4017.08	1	1	0
2080	485	1000	329	230	41	61009.10	0.00	61009.10	44807.99	16201.11	1	0	1
2081	615	1000	134	34	42	7674.36	0.00	7674.36	4604.64	3069.72	1	0	1
2082	371	1000	185	89	31	149449.68	0.00	149449.68	99699.43	49750.25	1	0	1
2083	580	1000	3	3	10	224432.20	0.00	224432.20	166611.55	57820.65	1	0	1
2084	717	1000	804	37	37	107568.07	0.00	107568.07	80706.01	26862.06	1	0	1
2085	732	3	903	207	10	146574.26	146574.26	0.00	110060.20	36514.06	1	1	0
2086	831	1000	90	151	26	158084.08	0.00	158084.08	121065.85	37018.23	1	0	1
2087	414	4	528	35	14	6283.38	6283.38	0.00	5215.20	1068.18	1	1	0
2088	558	1000	446	72	5	4450.12	0.00	4450.12	3471.09	979.03	1	0	1
2089	843	4	422	92	24	120085.94	120085.94	0.00	98882.00	21203.94	1	1	0
2090	565	1000	111	66	38	13825.77	0.00	13825.77	9369.74	4456.03	1	0	1
2091	131	1000	941	109	41	130722.31	0.00	130722.31	94689.54	36032.77	1	0	1
2092	85	1000	489	41	33	64237.38	0.00	64237.38	53775.60	10461.78	1	0	1
2093	741	1000	323	182	36	162160.67	0.00	162160.67	122867.32	39293.35	1	0	1
2094	643	1000	169	101	42	160883.68	0.00	160883.68	108847.54	52036.14	1	0	1
2095	407	1	966	137	43	3296.72	3296.72	0.00	2637.36	659.36	1	1	0
2096	233	1000	733	238	2	87426.08	0.00	87426.08	64665.67	22760.41	1	0	1
2097	752	1000	94	195	5	87647.95	0.00	87647.95	58940.90	28707.05	1	0	1
2098	875	1000	40	209	34	132667.10	0.00	132667.10	92122.46	40544.64	1	0	1
2099	574	4	597	124	45	16459.06	16459.06	0.00	13331.84	3127.22	1	1	0
2100	690	1000	997	47	46	9331.62	0.00	9331.62	7558.62	1773.00	1	0	1
2101	69	1000	304	115	31	124442.59	0.00	124442.59	100840.98	23601.61	1	0	1
2102	245	1000	472	233	13	138395.72	0.00	138395.72	99905.75	38489.97	1	0	1
2103	254	1000	160	82	37	60574.01	0.00	60574.01	47902.95	12671.06	1	0	1
2104	254	2	192	37	42	73326.21	73326.21	0.00	58820.37	14505.84	1	1	0
2105	254	1000	534	120	24	82663.47	0.00	82663.47	64477.53	18185.94	1	0	1
2106	254	1000	665	8	28	9826.00	0.00	9826.00	6700.68	3125.32	1	0	1
2107	254	2	403	24	45	98296.95	98296.95	0.00	80458.44	17838.51	1	1	0
2108	254	1000	2	6	36	68487.35	0.00	68487.35	51207.55	17279.80	1	0	1
2109	254	2	508	207	5	19978.74	19978.74	0.00	16382.56	3596.18	1	1	0
2110	254	4	1269	30	22	40748.41	40748.41	0.00	32291.58	8456.83	1	1	0
2111	254	1000	455	34	38	7169.65	0.00	7169.65	5448.93	1720.72	1	0	1
2112	254	1	403	14	33	115914.16	115914.16	0.00	75733.64	40180.52	1	1	0
2113	254	2	601	196	33	79492.28	79492.28	0.00	57867.73	21624.55	1	1	0
2114	254	1000	705	199	37	66085.22	0.00	66085.22	50336.51	15748.71	1	0	1
2115	254	1000	775	71	44	168600.66	0.00	168600.66	116122.12	52478.54	1	0	1
2116	254	1	1083	50	41	52273.40	52273.40	0.00	41205.02	11068.38	1	1	0
2117	254	2	1112	213	40	114354.42	114354.42	0.00	80602.17	33752.25	1	1	0
2118	254	1000	553	166	28	54625.92	0.00	54625.92	37979.04	16646.88	1	0	1
2119	254	4	56	177	19	120110.22	120110.22	0.00	97788.09	22322.13	1	1	0
2120	254	1	254	156	15	43060.12	43060.12	0.00	29835.28	13224.84	1	1	0
2121	254	1000	283	94	33	127989.75	0.00	127989.75	92891.32	35098.43	1	0	1
2122	254	1000	1109	153	45	158171.68	0.00	158171.68	114038.53	44133.15	1	0	1
2123	254	3	487	104	26	88023.69	88023.69	0.00	64019.69	24004.00	1	1	0
2124	254	1	1261	147	40	38880.44	38880.44	0.00	25324.95	13555.49	1	1	0
2125	254	4	173	37	31	20622.84	20622.84	0.00	17529.40	3093.44	1	1	0
2126	254	1000	199	110	8	34774.28	0.00	34774.28	29802.85	4971.43	1	0	1
2127	254	1000	678	73	34	51867.65	0.00	51867.65	41653.77	10213.88	1	0	1
2128	254	4	705	182	48	223359.94	223359.94	0.00	182738.05	40621.89	1	1	0
2129	254	2	290	50	12	160765.81	160765.81	0.00	129378.43	31387.38	1	1	0
2130	254	1000	290	187	25	113231.20	0.00	113231.20	93309.09	19922.11	1	0	1
2131	254	1000	533	120	35	191945.40	0.00	191945.40	137170.09	54775.31	1	0	1
2132	254	1000	1094	136	31	38288.34	0.00	38288.34	30247.80	8040.54	1	0	1
2133	254	4	242	227	31	159952.31	159952.31	0.00	111825.68	48126.63	1	1	0
2134	254	1000	69	88	1	116542.60	0.00	116542.60	86478.70	30063.90	1	0	1
2135	254	1000	1070	14	42	57218.70	0.00	57218.70	40625.30	16593.40	1	0	1
2136	254	1000	436	24	20	227339.68	0.00	227339.68	159229.36	68110.32	1	0	1
2137	254	1000	426	95	48	17580.15	0.00	17580.15	12657.72	4922.43	1	0	1
2138	254	1000	1191	252	7	170918.07	0.00	170918.07	122248.93	48669.14	1	0	1
2139	254	1000	1138	146	16	136728.27	0.00	136728.27	111231.24	25497.03	1	0	1
2140	254	1000	1037	202	17	61661.73	0.00	61661.73	44021.53	17640.20	1	0	1
2141	254	1000	658	225	47	16534.14	0.00	16534.14	12731.32	3802.82	1	0	1
2142	254	1000	1160	104	13	6963.00	0.00	6963.00	4595.56	2367.44	1	0	1
2143	254	1000	1184	110	40	130974.34	0.00	130974.34	106977.57	23996.77	1	0	1
2144	254	1000	180	40	33	182894.62	0.00	182894.62	139807.04	43087.58	2	0	2
2145	254	1000	437	192	50	251592.02	0.00	251592.02	183376.14	68215.88	1	0	1
2146	254	1000	1069	220	8	146295.69	0.00	146295.69	109217.66	37078.03	1	0	1
2147	254	2	515	42	43	206431.30	206431.30	0.00	153849.42	52581.88	1	1	0
2148	254	1000	408	162	15	113250.14	0.00	113250.14	91485.00	21765.14	1	0	1
2149	254	1000	1043	175	43	161341.64	0.00	161341.64	126657.76	34683.88	1	0	1
2150	254	1000	7	100	38	70179.96	0.00	70179.96	54174.04	16005.92	1	0	1
2151	254	1	670	145	50	147988.58	147988.58	0.00	95058.98	52929.60	1	1	0
2152	254	1000	1255	88	11	11366.10	0.00	11366.10	7274.31	4091.79	1	0	1
2153	254	4	323	177	11	71456.94	71456.94	0.00	53443.36	18013.58	1	1	0
2154	254	1	374	126	39	35077.64	35077.64	0.00	28709.52	6368.12	1	1	0
2155	254	4	571	111	26	75788.53	75788.53	0.00	61706.12	14082.41	1	1	0
2156	254	1000	532	91	5	51251.07	0.00	51251.07	33006.48	18244.59	1	0	1
2157	254	1000	132	104	30	111394.75	0.00	111394.75	82053.15	29341.60	1	0	1
2158	254	1000	922	93	27	31083.20	0.00	31083.20	18960.76	12122.44	1	0	1
2159	254	1000	947	111	40	147713.82	0.00	147713.82	107640.65	40073.17	1	0	1
2160	254	3	251	155	23	138307.25	138307.25	0.00	103669.66	34637.59	1	1	0
2161	254	2	1242	114	46	10452.76	10452.76	0.00	8066.61	2386.15	1	1	0
2162	254	2	209	67	44	90887.74	90887.74	0.00	59763.66	31124.08	1	1	0
2163	254	1	1229	142	11	84365.89	84365.89	0.00	67449.55	16916.34	1	1	0
2164	254	4	746	135	4	33064.49	33064.49	0.00	23560.90	9503.59	1	1	0
2165	254	1000	144	236	27	97167.94	0.00	97167.94	73699.34	23468.60	1	0	1
2166	254	2	259	107	9	48593.11	48593.11	0.00	36744.20	11848.91	1	1	0
2167	254	1000	737	114	11	82104.99	0.00	82104.99	59322.99	22782.00	1	0	1
2168	254	1000	1148	5	31	54429.34	0.00	54429.34	47897.85	6531.49	1	0	1
2169	254	4	27	8	9	136750.42	136750.42	0.00	100923.08	35827.34	1	1	0
2170	254	2	693	224	5	67070.86	67070.86	0.00	46574.48	20496.38	1	1	0
2171	254	1000	821	100	6	147319.54	0.00	147319.54	125088.50	22231.04	1	0	1
2172	254	3	212	38	7	48892.41	48892.41	0.00	39600.75	9291.66	1	1	0
2173	254	1000	1153	125	15	141625.34	0.00	141625.34	111416.22	30209.12	1	0	1
2174	254	4	91	216	40	80694.88	80694.88	0.00	56495.37	24199.51	1	1	0
2175	254	1000	28	167	40	94454.26	0.00	94454.26	70832.81	23621.45	1	0	1
2176	254	1000	985	43	28	31110.80	0.00	31110.80	21155.30	9955.50	1	0	1
2177	254	3	140	28	41	92179.81	92179.81	0.00	63642.25	28537.56	1	1	0
2178	254	1000	200	166	27	7392.66	0.00	7392.66	4879.17	2513.49	1	0	1
2179	254	1000	1291	166	14	14787.92	0.00	14787.92	10795.18	3992.74	1	0	1
2180	254	2	369	138	19	95809.73	95809.73	0.00	78314.84	17494.89	1	1	0
2181	254	1000	128	103	27	145590.57	0.00	145590.57	110609.86	34980.71	1	0	1
2182	254	2	270	18	21	52986.00	52986.00	0.00	37620.06	15365.94	1	1	0
2183	254	2	327	166	22	6702.56	6702.56	0.00	4109.36	2593.20	1	1	0
2184	254	1	404	242	49	45625.12	45625.12	0.00	31093.71	14531.41	1	1	0
2185	254	1000	731	145	38	150751.75	0.00	150751.75	106210.46	44541.29	1	0	1
2186	254	1	1242	245	50	38068.37	38068.37	0.00	26794.71	11273.66	1	1	0
2187	254	3	401	146	40	62461.46	62461.46	0.00	48966.82	13494.64	1	1	0
2188	254	3	1195	11	26	114787.83	114787.83	0.00	88536.07	26251.76	1	1	0
2189	254	2	16	37	2	32095.00	32095.00	0.00	21640.70	10454.30	1	1	0
2190	254	4	376	222	1	116391.10	116391.10	0.00	97419.99	18971.11	1	1	0
2191	254	4	43	63	39	97964.72	97964.72	0.00	71126.18	26838.54	1	1	0
2192	254	4	988	75	48	52023.44	52023.44	0.00	43099.36	8924.08	1	1	0
2193	254	1000	417	60	26	150478.69	0.00	150478.69	105226.48	45252.21	1	0	1
2194	254	2	755	98	32	240330.00	240330.00	0.00	180118.15	60211.85	1	1	0
2195	254	1000	428	57	31	92681.74	0.00	92681.74	69763.38	22918.36	1	0	1
2196	254	1000	132	199	31	83579.40	0.00	83579.40	62924.26	20655.14	1	0	1
2197	254	1	1288	55	37	3073.44	3073.44	0.00	2089.94	983.50	1	1	0
2198	254	1000	373	94	30	17564.50	0.00	17564.50	15106.88	2457.62	1	0	1
2199	254	1000	1186	62	35	119704.29	0.00	119704.29	97274.46	22429.83	1	0	1
2200	254	3	1238	232	31	228323.43	228323.43	0.00	176523.41	51800.02	1	1	0
2201	254	2	970	232	8	65996.80	65996.80	0.00	52864.81	13131.99	1	1	0
2202	254	1	112	165	22	80924.36	80924.36	0.00	61568.21	19356.15	1	1	0
2203	254	1000	685	196	13	114599.22	0.00	114599.22	97917.46	16681.76	1	0	1
2204	254	1	342	54	4	93527.78	93527.78	0.00	72420.51	21107.27	1	1	0
2205	254	2	442	69	8	9303.11	9303.11	0.00	7592.72	1710.39	1	1	0
2206	254	1000	1142	178	42	99192.06	0.00	99192.06	71882.96	27309.10	1	0	1
2207	254	1	35	233	3	42219.44	42219.44	0.00	26176.08	16043.36	1	1	0
2208	254	2	1047	208	20	186801.49	186801.49	0.00	122235.30	64566.19	1	1	0
2209	254	1000	624	172	9	27084.37	0.00	27084.37	19838.99	7245.38	1	0	1
2210	254	1	654	247	36	87819.12	87819.12	0.00	66768.39	21050.73	1	1	0
2211	254	4	286	200	8	68165.97	68165.97	0.00	54519.52	13646.45	1	1	0
2212	254	2	1058	43	9	5277.43	5277.43	0.00	3272.01	2005.42	1	1	0
2213	254	1000	729	235	45	38025.43	0.00	38025.43	27177.68	10847.75	1	0	1
2214	254	1000	426	120	42	5829.87	0.00	5829.87	4139.21	1690.66	1	0	1
2215	254	4	574	39	49	31357.36	31357.36	0.00	21009.44	10347.92	1	1	0
2216	254	1	276	116	47	70040.98	70040.98	0.00	59177.15	10863.83	1	1	0
2217	254	1000	884	216	8	53828.27	0.00	53828.27	43425.51	10402.76	1	0	1
2218	254	1000	422	200	39	52353.41	0.00	52353.41	37432.51	14920.90	1	0	1
2219	254	1000	1296	72	25	81378.04	0.00	81378.04	55150.86	26227.18	1	0	1
2220	254	1000	1012	106	48	43897.64	0.00	43897.64	31990.88	11906.76	1	0	1
2221	254	1000	151	69	36	64941.09	0.00	64941.09	45541.43	19399.66	1	0	1
2222	254	1000	1121	129	31	113374.38	0.00	113374.38	79535.69	33838.69	1	0	1
2223	254	1000	76	236	49	17339.16	0.00	17339.16	11617.24	5721.92	1	0	1
2224	254	4	459	173	19	161278.33	161278.33	0.00	120617.44	40660.89	1	1	0
2225	254	1	1243	66	19	139133.13	139133.13	0.00	108353.64	30779.49	1	1	0
2226	254	1000	1222	154	46	30143.74	0.00	30143.74	23410.78	6732.96	1	0	1
2227	254	4	2	21	33	44414.14	44414.14	0.00	30121.66	14292.48	1	1	0
2228	254	1000	732	72	12	166703.66	0.00	166703.66	116662.84	50040.82	1	0	1
2229	254	2	829	161	33	64820.70	64820.70	0.00	49253.25	15567.45	1	1	0
2230	254	2	463	240	4	72828.20	72828.20	0.00	60837.23	11990.97	1	1	0
2231	254	2	518	84	34	85052.82	85052.82	0.00	62988.72	22064.10	1	1	0
2232	254	1	379	148	42	5335.71	5335.71	0.00	4433.61	902.10	1	1	0
2233	254	4	704	64	24	50336.80	50336.80	0.00	44799.76	5537.04	1	1	0
2234	254	3	700	167	26	117022.02	117022.02	0.00	94447.14	22574.88	1	1	0
2235	254	2	1093	177	20	216960.91	216960.91	0.00	141159.80	75801.11	1	1	0
2236	254	1000	548	131	13	155620.52	0.00	155620.52	124428.64	31191.88	1	0	1
2237	254	3	1115	223	14	84035.62	84035.62	0.00	60065.66	23969.96	1	1	0
2238	254	3	1133	77	17	68545.09	68545.09	0.00	50830.00	17715.09	1	1	0
2239	254	1000	1281	86	26	74953.35	0.00	74953.35	56767.21	18186.14	1	0	1
2240	254	1000	182	144	33	79167.73	0.00	79167.73	66898.61	12269.12	1	0	1
2241	254	4	324	15	34	23580.32	23580.32	0.00	17213.60	6366.72	1	1	0
2242	254	2	53	65	11	86484.43	86484.43	0.00	58675.64	27808.79	1	1	0
2243	254	1000	1114	233	8	71491.39	0.00	71491.39	57308.88	14182.51	1	0	1
2244	254	1000	1210	153	45	67489.84	0.00	67489.84	53734.98	13754.86	1	0	1
2245	254	4	178	130	34	94310.94	94310.94	0.00	68236.42	26074.52	1	1	0
2246	254	3	479	10	5	111726.69	111726.69	0.00	88478.22	23248.47	1	1	0
2247	254	1000	941	160	45	11157.32	0.00	11157.32	7706.76	3450.56	1	0	1
2248	254	1000	742	100	38	36259.80	0.00	36259.80	31183.44	5076.36	1	0	1
2249	254	2	539	198	17	144396.09	144396.09	0.00	114966.68	29429.41	1	1	0
2250	254	1000	747	123	3	69972.21	0.00	69972.21	58776.66	11195.55	1	0	1
2251	254	1000	1244	244	1	58678.59	0.00	58678.59	44595.75	14082.84	1	0	1
2252	254	1000	574	35	22	128832.79	0.00	128832.79	93055.70	35777.09	1	0	1
2253	254	1000	325	224	16	63874.31	0.00	63874.31	46806.82	17067.49	1	0	1
2254	254	1000	1114	25	34	21306.94	0.00	21306.94	17623.65	3683.29	1	0	1
2255	254	3	535	237	19	33597.60	33597.60	0.00	27214.10	6383.50	1	1	0
2256	254	1000	884	188	16	161843.58	0.00	161843.58	123503.34	38340.24	1	0	1
2257	254	1000	461	201	20	81775.42	0.00	81775.42	54720.22	27055.20	1	0	1
2258	254	2	31	12	16	39546.61	39546.61	0.00	31930.83	7615.78	1	1	0
2259	254	1000	831	158	11	118030.57	0.00	118030.57	86277.60	31752.97	1	0	1
2260	254	1000	1084	229	42	173908.72	0.00	173908.72	144050.64	29858.08	1	0	1
2261	254	1000	876	75	27	127119.88	0.00	127119.88	101675.28	25444.60	1	0	1
2262	254	4	430	41	14	133408.64	133408.64	0.00	99164.37	34244.27	1	1	0
2263	254	1000	994	25	37	64293.81	0.00	64293.81	50149.19	14144.62	1	0	1
2264	254	1000	867	3	20	1790.71	0.00	1790.71	1522.10	268.61	1	0	1
2265	254	2	547	144	44	23279.64	23279.64	0.00	14200.59	9079.05	1	1	0
2266	254	3	1131	143	41	74683.36	74683.36	0.00	54554.08	20129.28	1	1	0
2267	254	1000	546	185	6	14016.36	0.00	14016.36	9811.44	4204.92	1	0	1
2268	254	4	709	164	25	71895.17	71895.17	0.00	56148.34	15746.83	1	1	0
2269	254	2	947	247	48	1679.56	1679.56	0.00	1360.44	319.12	1	1	0
2270	254	1000	1174	114	14	40354.98	0.00	40354.98	31891.28	8463.70	1	0	1
2271	254	1000	346	194	44	127091.37	0.00	127091.37	86418.25	40673.12	1	0	1
2272	254	1000	418	166	9	141287.99	0.00	141287.99	99955.06	41332.93	1	0	1
2273	254	2	1019	16	4	9063.36	9063.36	0.00	5619.28	3444.08	1	1	0
2274	254	2	249	67	18	88361.91	88361.91	0.00	71573.13	16788.78	1	1	0
2275	254	1000	421	148	29	25148.41	0.00	25148.41	16641.72	8506.69	1	0	1
2276	254	3	57	161	46	108734.03	108734.03	0.00	69741.92	38992.11	1	1	0
2277	254	1000	952	100	47	42529.15	0.00	42529.15	31046.30	11482.85	1	0	1
2278	254	1	315	128	21	114398.57	114398.57	0.00	85063.47	29335.10	1	1	0
2279	254	3	76	136	10	31544.06	31544.06	0.00	28074.20	3469.86	1	1	0
2280	254	3	855	167	23	209778.84	209778.84	0.00	169293.33	40485.51	1	1	0
2281	254	1000	179	234	5	37278.00	0.00	37278.00	25349.00	11929.00	1	0	1
2282	254	4	839	240	29	3139.45	3139.45	0.00	2260.40	879.05	1	1	0
2283	254	2	955	12	17	187753.05	187753.05	0.00	143766.72	43986.33	1	1	0
2284	254	1	331	114	27	26218.29	26218.29	0.00	18352.80	7865.49	1	1	0
2285	254	3	632	249	17	90326.15	90326.15	0.00	72483.42	17842.73	1	1	0
2286	254	3	788	165	20	52863.16	52863.16	0.00	35418.32	17444.84	1	1	0
2287	254	1000	227	222	34	29344.42	0.00	29344.42	25529.63	3814.79	1	0	1
2288	254	2	1208	162	36	119827.82	119827.82	0.00	82321.68	37506.14	1	1	0
2289	254	1	640	61	49	137803.75	137803.75	0.00	96103.90	41699.85	1	1	0
2290	254	4	277	90	25	67168.36	67168.36	0.00	45002.79	22165.57	1	1	0
2291	254	1000	129	147	43	29907.67	0.00	29907.67	19822.15	10085.52	1	0	1
2292	254	1000	116	107	38	63333.90	0.00	63333.90	48767.04	14566.86	1	0	1
2293	254	4	625	90	3	3670.24	3670.24	0.00	2495.78	1174.46	1	1	0
2294	254	1	1002	124	45	78040.79	78040.79	0.00	54410.63	23630.16	1	1	0
2295	254	1000	471	197	27	31210.76	0.00	31210.76	25280.71	5930.05	1	0	1
2296	254	3	752	165	4	14251.30	14251.30	0.00	10118.40	4132.90	1	1	0
2297	254	2	1144	6	17	117095.86	117095.86	0.00	85265.71	31830.15	1	1	0
2298	254	1000	244	181	2	72666.06	0.00	72666.06	58565.14	14100.92	1	0	1
2299	254	2	564	218	27	2472.54	2472.54	0.00	1978.02	494.52	1	1	0
2300	254	4	1127	235	6	55705.44	55705.44	0.00	46792.56	8912.88	1	1	0
2301	254	1	376	178	25	71505.11	71505.11	0.00	54592.16	16912.95	1	1	0
2302	254	2	423	3	9	99997.03	99997.03	0.00	71502.84	28494.19	1	1	0
2303	254	1000	611	127	16	66735.45	0.00	66735.45	50520.12	16215.33	1	0	1
2304	254	2	557	25	27	50709.99	50709.99	0.00	43438.02	7271.97	1	1	0
2305	254	1000	18	250	48	3185.18	0.00	3185.18	2236.26	948.92	1	0	1
2306	254	2	296	180	28	249871.03	249871.03	0.00	194570.53	55300.50	1	1	0
2307	254	1	573	157	50	68271.67	68271.67	0.00	50217.25	18054.42	1	1	0
2308	254	1000	558	32	7	108623.09	0.00	108623.09	77823.96	30799.13	1	0	1
2309	254	1000	988	114	25	133362.69	0.00	133362.69	104149.28	29213.41	1	0	1
2310	254	2	86	216	13	133379.20	133379.20	0.00	83334.09	50045.11	1	1	0
2311	254	1000	1180	124	32	83945.80	0.00	83945.80	65748.10	18197.70	1	0	1
2312	254	2	283	212	2	57703.32	57703.32	0.00	38502.58	19200.74	1	1	0
2313	254	4	820	56	10	131166.06	131166.06	0.00	96196.12	34969.94	1	1	0
2314	254	4	583	29	28	23546.22	23546.22	0.00	17511.06	6035.16	1	1	0
2315	254	1000	877	250	40	228267.14	0.00	228267.14	171571.16	56695.98	1	0	1
2316	254	1000	1098	65	40	45880.45	0.00	45880.45	38882.91	6997.54	1	0	1
2317	254	4	766	244	36	553.04	553.04	0.00	464.56	88.48	1	1	0
2318	254	1000	904	26	1	200582.41	0.00	200582.41	139309.52	61272.89	1	0	1
2319	254	1000	340	59	20	111673.04	0.00	111673.04	91480.04	20193.00	1	0	1
2320	254	1000	680	203	42	168901.87	0.00	168901.87	112494.19	56407.68	1	0	1
2321	254	1000	577	113	47	1941.40	0.00	1941.40	1223.08	718.32	1	0	1
2322	254	1000	289	170	7	39241.75	0.00	39241.75	30118.06	9123.69	1	0	1
2323	254	1000	629	31	25	133704.83	0.00	133704.83	96312.96	37391.87	1	0	1
2324	254	4	1155	212	3	112019.92	112019.92	0.00	83586.15	28433.77	1	1	0
2325	254	3	1228	237	28	39640.39	39640.39	0.00	28231.77	11408.62	1	1	0
2326	254	2	1173	64	19	137468.89	137468.89	0.00	103986.10	33482.79	1	1	0
2327	254	2	1237	64	14	135884.26	135884.26	0.00	101488.29	34395.97	1	1	0
2328	254	4	299	126	48	72044.05	72044.05	0.00	55638.31	16405.74	1	1	0
2329	254	1000	203	73	15	83259.66	0.00	83259.66	60363.76	22895.90	1	0	1
2330	254	2	547	209	9	94862.10	94862.10	0.00	70198.00	24664.10	1	1	0
2331	254	2	1184	222	27	30120.45	30120.45	0.00	22759.78	7360.67	1	1	0
2332	254	1000	355	89	6	122656.46	0.00	122656.46	83678.03	38978.43	1	0	1
2333	254	1000	782	133	12	109109.64	0.00	109109.64	73574.36	35535.28	1	0	1
2334	254	1000	871	56	35	142356.67	0.00	142356.67	106738.20	35618.47	1	0	1
2335	254	1	161	200	14	136663.15	136663.15	0.00	105018.08	31645.07	1	1	0
2336	254	1000	341	45	1	79939.16	0.00	79939.16	56102.55	23836.61	1	0	1
2337	254	1000	539	43	32	32559.35	0.00	32559.35	25481.34	7078.01	1	0	1
2338	254	4	1230	106	20	109639.23	109639.23	0.00	80839.89	28799.34	1	1	0
2339	254	1	686	81	42	16315.94	16315.94	0.00	13549.70	2766.24	1	1	0
2340	254	4	740	100	16	93418.68	93418.68	0.00	72701.55	20717.13	1	1	0
2341	254	1000	1172	216	34	151533.36	0.00	151533.36	125566.41	25966.95	1	0	1
2342	254	1000	1007	33	32	49887.10	0.00	49887.10	41905.20	7981.90	1	0	1
2343	254	3	746	20	33	43017.29	43017.29	0.00	37164.61	5852.68	1	1	0
2344	254	1	817	54	48	54802.07	54802.07	0.00	45244.45	9557.62	1	1	0
2345	254	4	441	131	27	111117.90	111117.90	0.00	92505.39	18612.51	1	1	0
2346	254	3	308	208	3	142009.40	142009.40	0.00	109305.80	32703.60	1	1	0
2347	254	1	1018	18	32	147499.18	147499.18	0.00	105357.83	42141.35	1	1	0
2348	254	4	483	14	35	27135.58	27135.58	0.00	21010.48	6125.10	1	1	0
2349	254	1000	254	213	33	48955.86	0.00	48955.86	37978.80	10977.06	1	0	1
2350	254	1	353	42	40	170083.17	170083.17	0.00	123766.01	46317.16	1	1	0
2351	254	1	138	198	17	3034.50	3034.50	0.00	2245.53	788.97	1	1	0
2352	254	3	364	206	2	93907.43	93907.43	0.00	71285.91	22621.52	1	1	0
2353	254	1000	392	235	35	86029.91	0.00	86029.91	67718.12	18311.79	1	0	1
2354	254	1000	797	147	43	63294.24	0.00	63294.24	40508.32	22785.92	1	0	1
2355	254	2	972	206	27	59619.85	59619.85	0.00	50335.45	9284.40	1	1	0
2356	254	1	347	111	26	157488.83	157488.83	0.00	117877.90	39610.93	1	1	0
2357	254	1000	72	65	37	80873.25	0.00	80873.25	66141.87	14731.38	1	0	1
2358	254	1000	284	231	40	110069.20	0.00	110069.20	77323.70	32745.50	1	0	1
2359	254	1	759	130	1	60985.83	60985.83	0.00	42016.86	18968.97	1	1	0
2360	254	1000	1204	22	3	90331.95	0.00	90331.95	70880.14	19451.81	1	0	1
2361	254	4	1230	221	44	71085.27	71085.27	0.00	60248.30	10836.97	1	1	0
2362	254	1000	950	85	43	69623.99	0.00	69623.99	44532.03	25091.96	1	0	1
2363	254	1000	24	14	46	99550.80	0.00	99550.80	85714.53	13836.27	1	0	1
2364	254	1000	251	103	50	51078.13	0.00	51078.13	35055.03	16023.10	1	0	1
2365	254	4	218	202	27	5581.04	5581.04	0.00	3871.30	1709.74	1	1	0
2366	254	1000	702	209	33	212647.07	0.00	212647.07	158662.46	53984.61	1	0	1
2367	254	1000	1118	186	41	71380.50	0.00	71380.50	52497.88	18882.62	1	0	1
2368	254	1000	273	221	28	87442.13	0.00	87442.13	76440.54	11001.59	1	0	1
2369	254	1000	583	126	22	3500.56	0.00	3500.56	2135.34	1365.22	1	0	1
2370	254	4	1017	202	25	170693.90	170693.90	0.00	127518.60	43175.30	1	1	0
2371	254	1	1192	1	10	83202.78	83202.78	0.00	66645.81	16556.97	1	1	0
2372	254	1	760	4	17	11659.74	11659.74	0.00	8278.42	3381.32	1	1	0
2373	254	1	122	117	42	48931.28	48931.28	0.00	32604.35	16326.93	1	1	0
2374	254	3	121	92	23	169439.43	169439.43	0.00	120226.00	49213.43	1	1	0
2375	254	1000	403	177	44	72014.40	0.00	72014.40	54010.80	18003.60	1	0	1
2376	254	1000	294	103	8	55899.57	0.00	55899.57	42497.49	13402.08	1	0	1
2377	254	4	1015	93	28	11653.44	11653.44	0.00	7108.59	4544.85	1	1	0
2378	254	1000	1157	217	31	113663.50	0.00	113663.50	90138.22	23525.28	1	0	1
2379	254	1000	763	174	3	90047.87	0.00	90047.87	70789.54	19258.33	1	0	1
2380	254	3	90	195	49	65634.88	65634.88	0.00	45089.20	20545.68	1	1	0
2381	254	1	417	38	5	49338.24	49338.24	0.00	38916.09	10422.15	1	1	0
2382	254	3	424	45	38	168064.92	168064.92	0.00	123921.00	44143.92	1	1	0
2383	254	1000	854	74	19	123340.81	0.00	123340.81	92709.16	30631.65	1	0	1
2384	254	1	1082	33	4	87791.30	87791.30	0.00	59961.96	27829.34	1	1	0
2385	254	1000	137	244	38	68572.40	0.00	68572.40	52104.28	16468.12	1	0	1
2386	254	2	807	227	6	70301.70	70301.70	0.00	56411.70	13890.00	1	1	0
2387	254	4	658	207	19	24888.64	24888.64	0.00	16924.24	7964.40	1	1	0
2388	254	1000	833	253	41	125444.80	0.00	125444.80	92173.31	33271.49	1	0	1
2389	254	1000	1281	250	43	84054.65	0.00	84054.65	71391.10	12663.55	1	0	1
2390	254	1000	18	9	50	96012.04	0.00	96012.04	71872.73	24139.31	1	0	1
2391	254	4	157	166	28	192569.43	192569.43	0.00	137889.96	54679.47	1	1	0
2392	254	1000	988	74	2	64705.98	0.00	64705.98	41730.80	22975.18	1	0	1
2393	254	1000	1005	148	49	69225.04	0.00	69225.04	45688.56	23536.48	1	0	1
2394	254	1	606	91	4	111702.11	111702.11	0.00	85954.84	25747.27	1	1	0
2395	254	3	961	232	26	196925.40	196925.40	0.00	152899.13	44026.27	1	1	0
2396	254	1000	1098	231	23	40265.04	0.00	40265.04	26574.96	13690.08	1	0	1
2397	254	3	701	217	19	101612.62	101612.62	0.00	83150.71	18461.91	1	1	0
2398	254	2	1286	128	32	181744.50	181744.50	0.00	138681.21	43063.29	1	1	0
2399	254	2	1139	45	7	63224.62	63224.62	0.00	48936.24	14288.38	1	1	0
2400	254	1000	1172	235	9	12707.72	0.00	12707.72	8132.96	4574.76	1	0	1
2401	254	1000	1028	119	26	102052.84	0.00	102052.84	73530.98	28521.86	1	0	1
2402	254	3	683	22	34	62942.98	62942.98	0.00	47342.36	15600.62	1	1	0
2403	254	3	239	200	22	209647.32	209647.32	0.00	164094.14	45553.18	1	1	0
2404	254	1	707	53	46	16777.16	16777.16	0.00	12548.42	4228.74	1	1	0
2405	254	1000	865	98	45	8945.46	0.00	8945.46	6082.92	2862.54	1	0	1
2406	254	4	871	46	1	149452.86	149452.86	0.00	106467.64	42985.22	1	1	0
2407	254	1000	1060	164	12	62980.08	0.00	62980.08	46483.84	16496.24	1	0	1
2408	254	1000	438	43	36	44011.04	0.00	44011.04	34965.40	9045.64	1	0	1
2409	254	1000	863	33	21	167757.95	0.00	167757.95	129136.80	38621.15	1	0	1
2410	254	2	1025	5	14	23944.31	23944.31	0.00	17779.76	6164.55	1	1	0
2411	254	1	1145	144	30	92356.62	92356.62	0.00	75769.46	16587.16	1	1	0
2412	254	1	605	167	13	71911.39	71911.39	0.00	48783.85	23127.54	1	1	0
2413	254	1000	477	90	36	78478.40	0.00	78478.40	58699.20	19779.20	1	0	1
2414	254	1000	1220	85	22	16282.50	0.00	16282.50	12211.90	4070.60	1	0	1
2415	254	1000	843	87	18	75512.48	0.00	75512.48	53571.39	21941.09	1	0	1
2416	254	3	894	207	34	38125.92	38125.92	0.00	26306.88	11819.04	1	1	0
2417	254	1	4	193	5	24357.60	24357.60	0.00	19816.94	4540.66	1	1	0
2418	254	1	924	53	6	84173.18	84173.18	0.00	59457.64	24715.54	1	1	0
2419	254	1	149	173	22	1740.75	1740.75	0.00	1148.89	591.86	1	1	0
2420	254	1000	424	190	37	71982.43	0.00	71982.43	58110.37	13872.06	1	0	1
2421	254	1000	418	24	34	61406.15	0.00	61406.15	53319.42	8086.73	1	0	1
2422	254	1000	949	95	8	139989.23	0.00	139989.23	106550.57	33438.66	1	0	1
2423	254	1000	716	70	3	141665.56	0.00	141665.56	112446.63	29218.93	1	0	1
2424	254	1000	652	88	39	59060.88	0.00	59060.88	49611.12	9449.76	1	0	1
2425	254	1000	1269	189	27	66606.71	0.00	66606.71	54124.89	12481.82	1	0	1
2426	254	1000	781	85	46	176219.24	0.00	176219.24	128741.84	47477.40	1	0	1
2427	254	1000	1178	10	41	101586.51	0.00	101586.51	72639.36	28947.15	1	0	1
2428	254	1000	796	168	21	251992.94	0.00	251992.94	179131.83	72861.11	1	0	1
2429	254	1000	294	239	28	162787.02	0.00	162787.02	124052.12	38734.90	1	0	1
2430	254	1	1135	217	37	58714.89	58714.89	0.00	42705.11	16009.78	1	1	0
2431	254	3	239	71	49	58538.12	58538.12	0.00	44954.94	13583.18	1	1	0
2433	254	1	733	47	32	15116.04	15116.04	0.00	12243.96	2872.08	1	1	0
2434	254	1000	1100	164	21	86741.64	0.00	86741.64	67615.42	19126.22	1	0	1
2435	254	1000	128	101	35	34085.92	0.00	34085.92	29995.60	4090.32	1	0	1
2436	254	1000	413	174	29	113709.14	0.00	113709.14	83867.03	29842.11	1	0	1
2437	254	3	937	52	50	63188.85	63188.85	0.00	49998.85	13190.00	1	1	0
2438	254	1000	1209	78	10	29918.95	0.00	29918.95	23635.95	6283.00	1	0	1
2439	254	2	127	184	13	141835.03	141835.03	0.00	121063.48	20771.55	1	1	0
2440	254	3	590	116	27	116758.59	116758.59	0.00	102781.59	13977.00	1	1	0
2441	254	1000	206	11	12	95413.58	0.00	95413.58	71886.45	23527.13	1	0	1
2442	254	1000	141	36	28	64595.87	0.00	64595.87	53583.10	11012.77	1	0	1
2443	254	4	1123	248	6	268695.22	268695.22	0.00	207994.69	60700.53	1	1	0
2444	254	1000	507	71	24	125553.27	0.00	125553.27	84297.31	41255.96	1	0	1
2445	254	2	468	197	14	21969.30	21969.30	0.00	18454.20	3515.10	1	1	0
2446	254	1	559	162	10	83281.60	83281.60	0.00	67480.42	15801.18	1	1	0
2447	254	4	307	182	16	83710.37	83710.37	0.00	70914.76	12795.61	1	1	0
2448	254	1000	1078	206	43	53932.50	0.00	53932.50	43042.00	10890.50	1	0	1
2449	254	1000	736	127	46	144004.22	0.00	144004.22	110957.19	33047.03	1	0	1
2450	254	3	1223	55	17	46359.51	46359.51	0.00	33956.90	12402.61	1	1	0
2451	254	1000	1230	146	48	146550.66	0.00	146550.66	122379.60	24171.06	1	0	1
2452	254	4	1186	111	26	131193.89	131193.89	0.00	97109.61	34084.28	1	1	0
2453	254	1000	1121	7	11	119332.84	0.00	119332.84	90593.36	28739.48	1	0	1
2454	254	2	232	1	29	11462.29	11462.29	0.00	9628.29	1834.00	1	1	0
2455	254	1000	496	57	46	93763.55	0.00	93763.55	62611.83	31151.72	1	0	1
2456	254	1000	264	73	39	26307.90	0.00	26307.90	17626.30	8681.60	1	0	1
2457	254	1000	668	2	42	119465.58	0.00	119465.58	82917.39	36548.19	1	0	1
2458	254	2	662	218	44	5277.43	5277.43	0.00	3272.01	2005.42	1	1	0
2459	254	1000	690	214	28	114163.83	0.00	114163.83	84525.70	29638.13	1	0	1
2460	254	1	646	152	7	106069.20	106069.20	0.00	74963.01	31106.19	1	1	0
2461	254	1000	103	66	7	83231.68	0.00	83231.68	70387.96	12843.72	1	0	1
2462	254	1000	220	102	7	495.76	0.00	495.76	391.66	104.10	1	0	1
2463	254	1000	722	46	36	152004.03	0.00	152004.03	109323.25	42680.78	1	0	1
2464	254	1000	102	167	27	935.10	0.00	935.10	579.76	355.34	1	0	1
2465	254	1000	992	70	46	182148.63	0.00	182148.63	137097.84	45050.79	1	0	1
2466	254	1	757	233	50	14431.20	14431.20	0.00	8658.72	5772.48	1	1	0
2467	254	2	69	85	25	67586.72	67586.72	0.00	51661.01	15925.71	1	1	0
2468	254	2	527	59	41	119432.18	119432.18	0.00	79052.19	40379.99	1	1	0
2469	254	4	798	159	13	29693.33	29693.33	0.00	20984.04	8709.29	1	1	0
2470	254	1000	383	29	38	22564.80	0.00	22564.80	16246.65	6318.15	1	0	1
2471	254	1000	868	159	27	78079.75	0.00	78079.75	55364.11	22715.64	1	0	1
2472	254	1000	762	248	49	58988.26	0.00	58988.26	49333.66	9654.60	1	0	1
2473	254	1000	283	157	23	56909.92	0.00	56909.92	43251.52	13658.40	1	0	1
2474	254	1000	990	171	37	287053.09	0.00	287053.09	228517.89	58535.20	1	0	1
2475	254	1000	328	98	3	121542.05	0.00	121542.05	96338.92	25203.13	1	0	1
2476	254	3	407	211	48	139453.02	139453.02	0.00	98622.76	40830.26	1	1	0
2477	254	4	985	110	16	92312.67	92312.67	0.00	64864.17	27448.50	1	1	0
2478	254	4	57	196	49	110753.61	110753.61	0.00	81417.02	29336.59	1	1	0
2479	254	3	909	62	23	47479.40	47479.40	0.00	33235.60	14243.80	1	1	0
2480	254	1000	37	75	7	23759.92	0.00	23759.92	18670.38	5089.54	1	0	1
2481	254	1000	56	39	19	71450.88	0.00	71450.88	51444.64	20006.24	1	0	1
2482	254	3	700	155	49	69616.21	69616.21	0.00	54794.59	14821.62	1	1	0
2483	254	1000	539	64	22	240965.09	0.00	240965.09	183458.57	57506.52	1	0	1
2484	254	4	238	143	7	113043.00	113043.00	0.00	84397.35	28645.65	1	1	0
2485	254	1	783	5	15	20607.03	20607.03	0.00	13188.51	7418.52	1	1	0
2486	254	1000	641	31	8	153312.96	0.00	153312.96	107055.04	46257.92	1	0	1
2487	254	1	150	118	43	19145.10	19145.10	0.00	14510.66	4634.44	1	1	0
2488	254	1	248	22	7	97863.18	97863.18	0.00	73690.54	24172.64	1	1	0
2489	254	3	183	40	31	37228.60	37228.60	0.00	30155.16	7073.44	1	1	0
2490	254	1	819	231	37	54981.86	54981.86	0.00	44766.13	10215.73	1	1	0
2491	254	4	554	71	35	24884.32	24884.32	0.00	20156.32	4728.00	1	1	0
2492	254	1000	804	146	47	112341.61	0.00	112341.61	82763.23	29578.38	1	0	1
2493	254	4	1133	113	7	29092.35	29092.35	0.00	22088.96	7003.39	1	1	0
2494	254	1	304	53	3	137929.26	137929.26	0.00	102331.58	35597.68	1	1	0
2495	254	1000	1293	124	19	187987.87	0.00	187987.87	142286.72	45701.15	1	0	1
2496	254	1000	96	104	3	148614.15	0.00	148614.15	97150.30	51463.85	1	0	1
2497	254	1000	288	237	29	81337.70	0.00	81337.70	48802.60	32535.10	1	0	1
2498	254	3	265	10	41	29934.75	29934.75	0.00	19756.95	10177.80	1	1	0
2499	254	1	393	6	44	73191.75	73191.75	0.00	54041.18	19150.57	1	1	0
2500	254	1000	805	184	22	88258.33	0.00	88258.33	59559.45	28698.88	1	0	1
2501	254	3	324	11	24	15242.15	15242.15	0.00	10212.25	5029.90	1	1	0
2502	254	1000	765	25	45	39631.30	0.00	39631.30	31308.72	8322.58	1	0	1
2503	254	1000	147	162	2	86414.84	0.00	86414.84	59751.02	26663.82	1	0	1
2504	254	1	542	50	41	1491.69	1491.69	0.00	939.76	551.93	1	1	0
2505	254	4	671	194	3	121794.34	121794.34	0.00	89732.32	32062.02	1	1	0
2506	254	1	181	84	2	228783.50	228783.50	0.00	165460.40	63323.10	1	1	0
2507	254	1000	694	48	25	183855.83	0.00	183855.83	137211.56	46644.27	1	0	1
2508	254	3	1085	203	12	183345.61	183345.61	0.00	151653.58	31692.03	1	1	0
2509	254	1000	649	227	7	49680.02	0.00	49680.02	44257.94	5422.08	1	0	1
2510	254	1000	745	142	41	57504.14	0.00	57504.14	44321.47	13182.67	1	0	1
2511	254	1000	74	152	4	54337.38	0.00	54337.38	36587.92	17749.46	1	0	1
2512	254	3	890	90	9	48768.53	48768.53	0.00	37391.31	11377.22	1	1	0
2513	254	1	561	196	24	149489.19	149489.19	0.00	121383.90	28105.29	1	1	0
2514	254	1000	171	135	26	96990.41	0.00	96990.41	74953.89	22036.52	1	0	1
2515	254	1000	290	247	16	42321.42	0.00	42321.42	29217.80	13103.62	1	0	1
2516	254	1000	265	27	18	2621.28	0.00	2621.28	2359.16	262.12	1	0	1
2517	254	4	285	167	38	135640.91	135640.91	0.00	99978.42	35662.49	1	1	0
2518	254	4	1211	197	31	128862.02	128862.02	0.00	96514.33	32347.69	1	1	0
2519	254	1	258	200	5	36954.36	36954.36	0.00	32275.17	4679.19	1	1	0
2520	254	4	352	234	40	49904.76	49904.76	0.00	36430.50	13474.26	1	1	0
2521	254	3	861	44	4	41563.61	41563.61	0.00	33423.36	8140.25	1	1	0
2522	254	3	111	247	36	67205.12	67205.12	0.00	53709.95	13495.17	1	1	0
2523	254	1000	616	93	13	37616.33	0.00	37616.33	27241.58	10374.75	1	0	1
2524	254	1	428	65	4	113575.00	113575.00	0.00	77461.83	36113.17	1	1	0
2525	254	1000	708	133	38	63652.70	0.00	63652.70	57287.40	6365.30	1	0	1
2526	254	1000	356	221	40	114716.58	0.00	114716.58	79498.70	35217.88	1	0	1
2527	254	1000	815	133	50	187022.47	0.00	187022.47	127077.32	59945.15	1	0	1
2528	254	1	491	91	42	1943.96	1943.96	0.00	1691.24	252.72	1	1	0
2529	254	4	357	1	39	219893.03	219893.03	0.00	156339.16	63553.87	1	1	0
2530	254	1000	848	212	27	28270.44	0.00	28270.44	17479.86	10790.58	1	0	1
2531	254	1000	1194	20	5	872.48	0.00	872.48	567.12	305.36	1	0	1
2532	254	4	650	120	50	56577.36	56577.36	0.00	49070.90	7506.46	1	1	0
2533	254	1000	68	115	5	50174.80	0.00	50174.80	31108.40	19066.40	1	0	1
2534	254	1000	566	106	22	102465.05	0.00	102465.05	81468.82	20996.23	1	0	1
2535	254	1000	42	33	2	59137.58	0.00	59137.58	44823.01	14314.57	1	0	1
2536	254	4	1210	113	38	21726.09	21726.09	0.00	19336.23	2389.86	1	1	0
2537	254	1000	1263	193	25	130404.57	0.00	130404.57	109489.89	20914.68	1	0	1
2538	254	1000	1278	89	13	61001.54	0.00	61001.54	40951.76	20049.78	1	0	1
2539	254	3	223	71	35	193203.51	193203.51	0.00	154536.20	38667.31	1	1	0
2540	254	3	268	133	9	61822.41	61822.41	0.00	44340.49	17481.92	1	1	0
2541	254	4	777	159	48	133028.51	133028.51	0.00	111613.80	21414.71	1	1	0
2542	254	2	281	48	31	197424.16	197424.16	0.00	139534.55	57889.61	1	1	0
2543	254	1000	610	230	31	92834.96	0.00	92834.96	68637.72	24197.24	1	0	1
2544	254	1000	65	78	34	16521.78	0.00	16521.78	11730.45	4791.33	1	0	1
2545	254	1000	1128	138	18	53317.69	0.00	53317.69	39080.42	14237.27	1	0	1
2546	254	1000	1107	50	6	154305.22	0.00	154305.22	126632.67	27672.55	1	0	1
2547	254	1	1253	80	21	85774.70	85774.70	0.00	61432.43	24342.27	1	1	0
2548	254	4	200	253	49	67999.06	67999.06	0.00	49119.44	18879.62	1	1	0
2549	254	1000	458	206	39	57369.40	0.00	57369.40	38437.50	18931.90	1	0	1
2550	254	1	742	127	19	93402.06	93402.06	0.00	71600.20	21801.86	1	1	0
2551	254	1000	1084	8	7	120883.49	0.00	120883.49	92409.79	28473.70	1	0	1
2552	254	4	1180	196	39	110268.12	110268.12	0.00	84263.12	26005.00	1	1	0
2553	254	1000	1079	123	28	49882.16	0.00	49882.16	43913.96	5968.20	1	0	1
2554	254	1000	407	131	7	10402.15	0.00	10402.15	6449.35	3952.80	1	0	1
2555	254	1000	1296	109	22	72681.53	0.00	72681.53	51188.43	21493.10	1	0	1
2556	254	4	110	246	15	45324.75	45324.75	0.00	38979.30	6345.45	1	1	0
2557	254	1000	953	25	44	195359.50	0.00	195359.50	146190.47	49169.03	1	0	1
2558	254	1000	730	138	6	94065.20	0.00	94065.20	64905.00	29160.20	1	0	1
2559	254	1000	1172	125	32	38422.32	0.00	38422.32	28079.58	10342.74	1	0	1
2560	254	1	1066	216	1	103416.53	103416.53	0.00	80708.16	22708.37	1	1	0
2561	254	1000	1228	96	4	22117.50	0.00	22117.50	17518.18	4599.32	1	0	1
2562	254	3	63	50	4	47052.07	47052.07	0.00	38583.39	8468.68	1	1	0
2563	254	1000	1125	244	46	52740.45	0.00	52740.45	37973.16	14767.29	1	0	1
2564	254	3	816	110	15	78162.30	78162.30	0.00	59396.76	18765.54	1	1	0
2565	254	1	1203	214	39	121863.93	121863.93	0.00	99801.59	22062.34	1	1	0
2566	254	4	933	127	25	4385.98	4385.98	0.00	3070.18	1315.80	1	1	0
2567	254	1000	1098	70	19	246736.74	0.00	246736.74	171397.00	75339.74	1	0	1
2568	254	1000	77	20	8	33597.60	0.00	33597.60	27214.10	6383.50	1	0	1
2569	254	1	1269	36	47	17054.56	17054.56	0.00	14327.41	2727.15	1	1	0
2570	254	2	1087	55	19	96442.45	96442.45	0.00	64393.46	32048.99	1	1	0
2571	254	1000	947	122	28	14409.87	0.00	14409.87	11498.71	2911.16	1	0	1
2572	254	4	905	78	33	21990.15	21990.15	0.00	19571.25	2418.90	1	1	0
2573	254	4	546	251	1	104825.23	104825.23	0.00	80012.34	24812.89	1	1	0
2574	254	1000	562	118	19	5419.93	0.00	5419.93	4173.35	1246.58	1	0	1
2575	254	2	193	243	48	16265.28	16265.28	0.00	12201.75	4063.53	1	1	0
2576	254	1000	241	248	50	83717.11	0.00	83717.11	58065.65	25651.46	1	0	1
2577	254	1000	1073	92	14	162906.03	0.00	162906.03	113049.03	49857.00	1	0	1
2578	254	1000	1084	185	47	57589.78	0.00	57589.78	50633.66	6956.12	1	0	1
2579	254	1000	756	137	10	135258.70	0.00	135258.70	90340.94	44917.76	1	0	1
2580	254	4	1197	20	44	108699.82	108699.82	0.00	80899.91	27799.91	1	1	0
2581	254	2	447	24	42	156507.41	156507.41	0.00	105485.75	51021.66	1	1	0
2582	254	2	932	250	9	57925.75	57925.75	0.00	39645.89	18279.86	1	1	0
2583	254	1000	358	160	50	92218.79	0.00	92218.79	65805.57	26413.22	1	0	1
2584	254	1000	493	30	5	78160.50	0.00	78160.50	59844.30	18316.20	1	0	1
2585	254	1	671	59	37	66811.18	66811.18	0.00	44092.90	22718.28	1	1	0
2586	254	4	1008	60	19	87086.11	87086.11	0.00	60064.20	27021.91	1	1	0
2587	254	4	1095	250	29	96020.78	96020.78	0.00	75846.62	20174.16	1	1	0
2588	254	1	1127	21	2	110619.72	110619.72	0.00	93355.28	17264.44	1	1	0
2589	254	1000	545	78	48	94619.80	0.00	94619.80	72215.08	22404.72	1	0	1
2590	254	2	1296	83	15	101320.97	101320.97	0.00	86730.14	14590.83	1	1	0
2591	254	1000	1238	226	8	21419.16	0.00	21419.16	18453.42	2965.74	1	0	1
2592	254	4	339	238	12	36481.02	36481.02	0.00	28896.87	7584.15	1	1	0
2593	254	1	786	11	32	24029.70	24029.70	0.00	17061.09	6968.61	1	1	0
2594	254	2	757	183	44	73913.40	73913.40	0.00	65782.90	8130.50	1	1	0
2595	254	1000	608	191	40	34249.50	0.00	34249.50	21234.66	13014.84	1	0	1
2596	254	1000	1107	238	45	92197.90	0.00	92197.90	82196.14	10001.76	1	0	1
2597	254	3	115	240	1	124229.15	124229.15	0.00	100934.85	23294.30	1	1	0
2598	254	1000	377	128	30	66510.73	0.00	66510.73	52477.53	14033.20	1	0	1
2599	254	1000	662	152	11	99927.48	0.00	99927.48	78943.53	20983.95	1	0	1
2600	254	1000	434	229	22	9343.47	0.00	9343.47	6026.65	3316.82	1	0	1
2601	254	1000	545	164	30	82553.63	0.00	82553.63	67751.41	14802.22	1	0	1
2602	254	1	329	26	38	189486.92	189486.92	0.00	132361.41	57125.51	1	1	0
2603	254	1000	916	85	50	53388.04	0.00	53388.04	42934.57	10453.47	1	0	1
2604	254	2	676	193	13	79052.60	79052.60	0.00	70140.64	8911.96	1	1	0
2605	254	2	822	117	27	222803.38	222803.38	0.00	170415.05	52388.33	1	1	0
2606	254	1000	134	144	37	88951.44	0.00	88951.44	65916.24	23035.20	1	0	1
2607	254	2	770	106	34	89065.00	89065.00	0.00	62577.58	26487.42	1	1	0
2608	254	1000	449	35	8	201609.51	0.00	201609.51	154600.89	47008.62	1	0	1
2609	254	1000	750	168	43	141888.79	0.00	141888.79	115019.61	26869.18	1	0	1
2610	254	1000	595	7	32	143797.16	0.00	143797.16	94993.06	48804.10	1	0	1
2611	254	3	1146	70	48	44437.36	44437.36	0.00	34609.52	9827.84	1	1	0
2612	254	1000	1093	87	43	66184.24	0.00	66184.24	41564.72	24619.52	1	0	1
2613	254	1	859	120	4	16161.92	16161.92	0.00	10894.90	5267.02	1	1	0
2614	254	1	1006	171	3	31131.90	31131.90	0.00	25768.26	5363.64	1	1	0
2615	254	1	683	209	44	31137.34	31137.34	0.00	22135.28	9002.06	1	1	0
2616	254	1	23	188	13	15348.24	15348.24	0.00	9515.88	5832.36	1	1	0
2617	254	2	462	79	18	17776.25	17776.25	0.00	13509.95	4266.30	1	1	0
2618	254	1000	1003	245	6	25108.84	0.00	25108.84	16450.18	8658.66	1	0	1
2619	254	1000	564	35	50	73002.70	0.00	73002.70	46160.69	26842.01	1	0	1
2620	254	1000	366	134	2	122311.21	0.00	122311.21	89682.78	32628.43	1	0	1
2621	254	1000	691	114	30	27270.95	0.00	27270.95	21577.55	5693.40	1	0	1
2622	254	3	945	219	27	62003.70	62003.70	0.00	39682.35	22321.35	1	1	0
2623	254	3	560	186	10	53289.06	53289.06	0.00	40947.38	12341.68	1	1	0
2624	254	3	1243	83	44	132146.29	132146.29	0.00	93660.85	38485.44	1	1	0
2625	254	1000	36	19	36	205488.72	0.00	205488.72	148402.88	57085.84	1	0	1
2626	254	1000	1167	157	4	16429.76	0.00	16429.76	12158.02	4271.74	1	0	1
2627	254	1	781	111	20	57588.30	57588.30	0.00	51829.47	5758.83	1	1	0
2628	254	1000	960	64	24	80154.46	0.00	80154.46	56726.11	23428.35	1	0	1
2629	254	3	751	73	14	62141.47	62141.47	0.00	49227.12	12914.35	1	1	0
2630	254	1000	640	173	40	50577.26	0.00	50577.26	44949.05	5628.21	1	0	1
2631	254	2	1195	143	3	183041.98	183041.98	0.00	144948.88	38093.10	1	1	0
2632	254	1000	852	102	23	89857.24	0.00	89857.24	57974.38	31882.86	1	0	1
2633	254	1000	630	211	43	55249.13	0.00	55249.13	36880.14	18368.99	1	0	1
2634	254	1000	709	154	25	95741.69	0.00	95741.69	73136.50	22605.19	1	0	1
2635	254	1	338	98	13	57829.74	57829.74	0.00	42226.38	15603.36	1	1	0
2636	254	1000	1077	92	9	128873.18	0.00	128873.18	93041.85	35831.33	1	0	1
2637	254	1000	981	224	2	81778.69	0.00	81778.69	56643.40	25135.29	1	0	1
2638	254	1000	1214	103	43	166838.29	0.00	166838.29	116360.44	50477.85	1	0	1
2639	254	2	62	210	8	131277.62	131277.62	0.00	103425.66	27851.96	1	1	0
2640	254	1000	253	60	33	21493.81	0.00	21493.81	17788.91	3704.90	1	0	1
2641	254	1000	721	248	32	80314.04	0.00	80314.04	56844.98	23469.06	1	0	1
2642	254	1000	287	12	31	95515.74	0.00	95515.74	75950.81	19564.93	1	0	1
2643	254	1	11	209	27	57614.58	57614.58	0.00	42058.62	15555.96	1	1	0
2644	254	1	520	55	43	93218.14	93218.14	0.00	63735.12	29483.02	1	1	0
2645	254	3	626	192	41	54793.87	54793.87	0.00	41335.56	13458.31	1	1	0
2646	254	2	533	128	28	120025.20	120025.20	0.00	90613.42	29411.78	1	1	0
2647	254	1000	387	168	36	44676.90	0.00	44676.90	30380.30	14296.60	1	0	1
2648	254	1000	936	11	14	3034.50	0.00	3034.50	2245.53	788.97	1	0	1
2649	254	1	710	170	38	220332.40	220332.40	0.00	168742.44	51589.96	1	1	0
2650	254	1000	279	230	36	84853.01	0.00	84853.01	72387.05	12465.96	1	0	1
2651	254	4	1101	253	28	67748.86	67748.86	0.00	47368.24	20380.62	1	1	0
2652	254	3	579	156	16	53734.98	53734.98	0.00	44062.68	9672.30	1	1	0
2653	254	2	1296	175	34	42377.75	42377.75	0.00	29386.88	12990.87	1	1	0
2654	254	1000	776	52	6	111281.80	0.00	111281.80	88218.06	23063.74	1	0	1
2655	254	1000	411	222	44	43329.78	0.00	43329.78	29406.69	13923.09	1	0	1
2656	254	3	909	169	21	123372.43	123372.43	0.00	82911.92	40460.51	1	1	0
2657	254	1000	926	7	15	77078.70	0.00	77078.70	50101.20	26977.50	1	0	1
2658	254	1000	109	58	2	54070.08	0.00	54070.08	41949.04	12121.04	1	0	1
2659	254	3	693	2	27	80153.76	80153.76	0.00	57476.58	22677.18	1	1	0
2963	254	3	76	16	13	83996.00	83996.00	0.00	59529.12	24466.88	1	1	0
2660	254	3	555	71	44	46387.89	46387.89	0.00	30881.20	15506.69	1	1	0
2661	254	1	361	16	16	26870.40	26870.40	0.00	23914.65	2955.75	1	1	0
2662	254	1000	422	124	36	159338.52	0.00	159338.52	118867.14	40471.38	1	0	1
2663	254	3	571	207	9	158157.84	158157.84	0.00	126889.74	31268.10	1	1	0
2664	254	3	306	153	45	85965.41	85965.41	0.00	72720.21	13245.20	1	1	0
2665	254	1000	1263	199	14	134199.14	0.00	134199.14	104266.86	29932.28	1	0	1
2666	254	1000	117	220	24	87032.36	0.00	87032.36	65065.56	21966.80	1	0	1
2667	254	1000	385	144	19	44638.12	0.00	44638.12	32431.02	12207.10	1	0	1
2668	254	3	525	74	43	92480.03	92480.03	0.00	72283.90	20196.13	1	1	0
2669	254	1	888	130	34	86042.91	86042.91	0.00	59962.89	26080.02	1	1	0
2670	254	1000	771	52	5	60958.00	0.00	60958.00	43280.16	17677.84	1	0	1
2671	254	1000	548	139	24	58045.97	0.00	58045.97	40512.01	17533.96	1	0	1
2672	254	1000	583	131	12	154188.92	0.00	154188.92	114792.18	39396.74	1	0	1
2673	254	4	1073	138	7	185569.08	185569.08	0.00	142922.63	42646.45	1	1	0
2674	254	2	1095	100	36	42668.32	42668.32	0.00	28872.70	13795.62	1	1	0
2675	254	1000	1186	63	50	72582.18	0.00	72582.18	57851.07	14731.11	1	0	1
2676	254	1000	844	44	33	100197.73	0.00	100197.73	74502.54	25695.19	1	0	1
2677	254	3	1199	33	32	16218.80	16218.80	0.00	13137.25	3081.55	1	1	0
2678	254	1000	829	187	42	71048.51	0.00	71048.51	59845.34	11203.17	1	0	1
2679	254	1000	502	32	16	42936.84	0.00	42936.84	27479.61	15457.23	1	0	1
2680	254	1000	1135	148	47	71267.68	0.00	71267.68	55824.65	15443.03	1	0	1
2681	254	1000	999	77	26	31896.50	0.00	31896.50	22646.50	9250.00	1	0	1
2682	254	3	879	19	40	53663.38	53663.38	0.00	44041.12	9622.26	1	1	0
2683	254	1000	343	253	15	24031.10	0.00	24031.10	15620.20	8410.90	1	0	1
2684	254	3	12	135	47	173127.74	173127.74	0.00	123618.81	49508.93	1	1	0
2685	254	1000	275	196	49	195623.14	0.00	195623.14	146346.07	49277.07	1	0	1
2686	254	3	175	172	37	103768.10	103768.10	0.00	73878.10	29890.00	1	1	0
2687	254	1	439	139	9	1088.39	1088.39	0.00	903.36	185.03	1	1	0
2688	254	2	40	122	10	103150.38	103150.38	0.00	71764.84	31385.54	1	1	0
2689	254	1000	994	185	45	151875.59	0.00	151875.59	122907.89	28967.70	1	0	1
2690	254	2	511	78	3	217787.77	217787.77	0.00	147893.68	69894.09	1	1	0
2691	254	1000	131	186	16	115894.74	0.00	115894.74	87930.18	27964.56	1	0	1
2692	254	1000	727	203	14	232184.46	0.00	232184.46	186517.67	45666.79	1	0	1
2693	254	1000	1061	35	3	92239.67	0.00	92239.67	66106.80	26132.87	1	0	1
2694	254	2	866	17	22	61254.49	61254.49	0.00	44515.08	16739.41	1	1	0
2695	254	2	812	3	10	238331.16	238331.16	0.00	188129.89	50201.27	1	1	0
2696	254	4	281	227	28	158432.00	158432.00	0.00	128000.58	30431.42	1	1	0
2697	254	1	476	166	43	84201.92	84201.92	0.00	64711.57	19490.35	1	1	0
2698	254	1000	906	225	44	130948.92	0.00	130948.92	102421.34	28527.58	1	0	1
2699	254	1	186	3	32	56018.07	56018.07	0.00	38092.32	17925.75	1	1	0
2700	254	4	919	45	21	112639.94	112639.94	0.00	93821.88	18818.06	1	1	0
2701	254	1	908	129	29	9937.55	9937.55	0.00	8645.70	1291.85	1	1	0
2702	254	2	933	235	6	30679.10	30679.10	0.00	20512.96	10166.14	1	1	0
2703	254	4	790	182	29	10087.25	10087.25	0.00	6153.20	3934.05	1	1	0
2704	254	1000	176	189	20	39747.68	0.00	39747.68	25438.52	14309.16	1	0	1
2705	254	1000	580	100	17	195549.28	0.00	195549.28	133039.89	62509.39	1	0	1
2706	254	2	748	87	11	31418.04	31418.04	0.00	26181.80	5236.24	1	1	0
2707	254	1000	265	119	20	43084.79	0.00	43084.79	26281.71	16803.08	1	0	1
2708	254	1	741	76	41	92670.14	92670.14	0.00	67201.04	25469.10	1	1	0
2709	254	1000	945	38	25	157417.66	0.00	157417.66	129354.75	28062.91	1	0	1
2710	254	1000	445	33	18	79176.97	0.00	79176.97	57523.20	21653.77	1	0	1
2711	254	1000	149	6	36	41983.15	0.00	41983.15	25189.90	16793.25	1	0	1
2712	254	4	33	166	38	50877.53	50877.53	0.00	36611.30	14266.23	1	1	0
2713	254	1000	978	49	50	228377.23	0.00	228377.23	176921.82	51455.41	1	0	1
2714	254	1000	1127	86	3	66955.78	0.00	66955.78	51352.03	15603.75	1	0	1
2715	254	2	225	65	42	208317.80	208317.80	0.00	156424.50	51893.30	1	1	0
2716	254	1000	986	7	7	41036.67	0.00	41036.67	32511.78	8524.89	1	0	1
2717	254	4	1214	3	45	82189.04	82189.04	0.00	69170.69	13018.35	1	1	0
2718	254	1000	607	128	7	1372.54	0.00	1372.54	988.22	384.32	1	0	1
2719	254	1000	272	11	13	187752.38	0.00	187752.38	136382.02	51370.36	1	0	1
2720	254	3	549	165	32	37446.90	37446.90	0.00	32204.34	5242.56	1	1	0
2721	254	1000	928	74	27	30637.34	0.00	30637.34	25765.18	4872.16	1	0	1
2722	254	1000	1126	247	2	149772.90	0.00	149772.90	108684.68	41088.22	1	0	1
2723	254	1000	565	140	26	26867.49	0.00	26867.49	22031.34	4836.15	1	0	1
2724	254	2	478	14	43	50711.24	50711.24	0.00	35913.56	14797.68	1	1	0
2725	254	3	703	220	31	8468.84	8468.84	0.00	5758.82	2710.02	1	1	0
2726	254	1000	1037	151	45	64914.70	0.00	64914.70	45626.34	19288.36	1	0	1
2727	254	1	1220	72	39	32802.55	32802.55	0.00	23971.63	8830.92	1	1	0
2728	254	2	754	70	3	112117.74	112117.74	0.00	90752.82	21364.92	1	1	0
2729	254	1	162	17	33	85275.94	85275.94	0.00	59021.11	26254.83	1	1	0
2730	254	1000	1024	136	47	70045.38	0.00	70045.38	61639.92	8405.46	1	0	1
2731	254	1000	241	194	41	105540.62	0.00	105540.62	87186.24	18354.38	1	0	1
2732	254	4	347	22	36	93602.22	93602.22	0.00	77337.51	16264.71	1	1	0
2733	254	1000	401	154	27	49644.76	0.00	49644.76	34174.90	15469.86	1	0	1
2734	254	2	981	137	42	152.03	152.03	0.00	124.66	27.37	1	1	0
2735	254	1000	882	240	20	131044.26	0.00	131044.26	102299.04	28745.22	1	0	1
2736	254	1000	745	106	10	167672.72	0.00	167672.72	115390.17	52282.55	1	0	1
2737	254	1	795	100	21	159132.93	159132.93	0.00	114067.46	45065.47	1	1	0
2738	254	1000	522	225	17	188210.11	0.00	188210.11	144452.91	43757.20	1	0	1
2739	254	3	906	169	15	10438.65	10438.65	0.00	7307.05	3131.60	1	1	0
2740	254	1000	637	77	11	50354.57	0.00	50354.57	43304.94	7049.63	1	0	1
2741	254	1	598	243	42	63442.80	63442.80	0.00	44448.70	18994.10	1	1	0
2742	254	2	293	241	11	214349.50	214349.50	0.00	151358.40	62991.10	1	1	0
2743	254	1000	977	64	12	16191.60	0.00	16191.60	14410.50	1781.10	1	0	1
2744	254	3	837	114	33	10465.56	10465.56	0.00	7325.88	3139.68	1	1	0
2745	254	2	768	63	30	142599.00	142599.00	0.00	114207.36	28391.64	1	1	0
2746	254	1000	675	89	43	90396.33	0.00	90396.33	67247.25	23149.08	1	0	1
2747	254	4	626	41	17	67081.53	67081.53	0.00	46440.39	20641.14	1	1	0
2748	254	1	180	122	19	151491.94	151491.94	0.00	96044.79	55447.15	1	1	0
2749	254	4	551	196	32	119788.33	119788.33	0.00	88369.12	31419.21	1	1	0
2750	254	1	994	173	10	177185.75	177185.75	0.00	138634.68	38551.07	1	1	0
2751	254	1000	1175	105	6	56528.70	0.00	56528.70	39570.12	16958.58	1	0	1
2752	254	1000	304	56	45	56954.56	0.00	56954.56	46474.48	10480.08	1	0	1
2753	254	1000	548	56	10	38648.40	0.00	38648.40	32078.15	6570.25	1	0	1
2754	254	3	283	16	25	84913.41	84913.41	0.00	56406.31	28507.10	1	1	0
2755	254	3	919	11	39	28407.54	28407.54	0.00	23454.79	4952.75	1	1	0
2756	254	1	813	250	45	111722.36	111722.36	0.00	87932.00	23790.36	1	1	0
2757	254	1	1049	121	38	95403.15	95403.15	0.00	63439.45	31963.70	1	1	0
2758	254	1000	961	202	50	123627.17	0.00	123627.17	90941.35	32685.82	1	0	1
2759	254	1000	577	176	40	52889.69	0.00	52889.69	39102.02	13787.67	1	0	1
2760	254	3	17	249	28	19896.78	19896.78	0.00	13330.84	6565.94	1	1	0
2761	254	1000	902	6	48	49003.02	0.00	49003.02	35337.05	13665.97	1	0	1
2762	254	1	950	127	50	67989.73	67989.73	0.00	41256.74	26732.99	1	1	0
2763	254	1000	312	202	42	3583.45	0.00	3583.45	2902.60	680.85	1	0	1
2764	254	1000	306	253	32	159893.52	0.00	159893.52	122153.83	37739.69	1	0	1
2765	254	1000	497	111	31	79188.48	0.00	79188.48	63985.04	15203.44	1	0	1
2766	254	1000	1196	222	7	29029.99	0.00	29029.99	24014.03	5015.96	1	0	1
2767	254	4	1201	234	25	99884.20	99884.20	0.00	80174.24	19709.96	1	1	0
2768	254	3	677	3	6	43722.44	43722.44	0.00	33810.57	9911.87	1	1	0
2769	254	4	3	29	31	32360.42	32360.42	0.00	23744.14	8616.28	1	1	0
2770	254	1000	1126	174	17	148076.12	0.00	148076.12	117609.24	30466.88	1	0	1
2771	254	2	780	11	2	14880.52	14880.52	0.00	9374.72	5505.80	1	1	0
2772	254	1000	762	190	13	82369.61	0.00	82369.61	59123.45	23246.16	1	0	1
2773	254	1000	534	155	31	82979.40	0.00	82979.40	62427.80	20551.60	1	0	1
2774	254	1	357	91	14	104914.67	104914.67	0.00	80830.44	24084.23	1	1	0
2775	254	1000	913	198	18	49184.58	0.00	49184.58	34807.86	14376.72	1	0	1
2776	254	3	702	207	27	196652.93	196652.93	0.00	139370.59	57282.34	1	1	0
2777	254	1000	372	119	41	43730.22	0.00	43730.22	32797.68	10932.54	1	0	1
2778	254	1000	901	78	15	147783.40	0.00	147783.40	119061.11	28722.29	1	0	1
2779	254	1	357	186	40	55490.42	55490.42	0.00	36703.82	18786.60	1	1	0
2780	254	1	1154	28	14	122554.88	122554.88	0.00	84347.49	38207.39	1	1	0
2781	254	1000	1137	126	43	42925.06	0.00	42925.06	33304.10	9620.96	1	0	1
2782	254	1	382	107	33	29233.20	29233.20	0.00	24263.60	4969.60	1	1	0
2783	254	3	322	119	23	72772.30	72772.30	0.00	57205.09	15567.21	1	1	0
2784	254	3	940	28	8	9858.96	9858.96	0.00	6539.67	3319.29	1	1	0
2785	254	1000	257	188	12	161297.82	0.00	161297.82	130630.94	30666.88	1	0	1
2786	254	3	1194	87	30	18575.83	18575.83	0.00	16532.46	2043.37	1	1	0
2787	254	1000	745	239	33	76321.21	0.00	76321.21	54227.04	22094.17	1	0	1
2788	254	4	1242	47	49	86266.24	86266.24	0.00	60144.90	26121.34	1	1	0
2789	254	4	989	218	32	30347.83	30347.83	0.00	22432.43	7915.40	1	1	0
2790	254	1000	983	252	22	77731.65	0.00	77731.65	49293.99	28437.66	1	0	1
2791	254	1000	150	78	45	121605.53	0.00	121605.53	87256.56	34348.97	1	0	1
2792	254	1	1050	102	7	142008.85	142008.85	0.00	103611.92	38396.93	1	1	0
2793	254	1	1218	17	11	16850.64	16850.64	0.00	12469.51	4381.13	1	1	0
2794	254	1	692	222	37	118152.00	118152.00	0.00	87833.93	30318.07	1	1	0
2795	254	1	1171	15	5	13906.69	13906.69	0.00	10714.28	3192.41	1	1	0
2796	254	4	1154	134	32	4490.16	4490.16	0.00	3188.00	1302.16	1	1	0
2797	254	1000	1098	10	49	56794.08	0.00	56794.08	40891.76	15902.32	1	0	1
2798	254	1000	766	43	22	43566.03	0.00	43566.03	36577.43	6988.60	1	0	1
2799	254	1000	669	198	3	103292.47	0.00	103292.47	71638.69	31653.78	1	0	1
2800	254	1000	787	159	45	90454.78	0.00	90454.78	73322.14	17132.64	1	0	1
2801	254	2	120	31	2	70417.90	70417.90	0.00	52109.20	18308.70	1	1	0
2802	254	1000	235	180	37	53541.95	0.00	53541.95	46267.02	7274.93	1	0	1
2803	254	4	1285	118	50	60394.57	60394.57	0.00	44638.78	15755.79	1	1	0
2804	254	1	611	89	40	56563.28	56563.28	0.00	41291.20	15272.08	1	1	0
2805	254	2	1207	25	43	185367.90	185367.90	0.00	146718.07	38649.83	1	1	0
2806	254	1000	1004	244	33	63728.69	0.00	63728.69	39056.01	24672.68	1	0	1
2807	254	1000	601	205	41	13340.34	0.00	13340.34	11606.10	1734.24	1	0	1
2808	254	1000	107	20	14	25307.72	0.00	25307.72	22625.80	2681.92	1	0	1
2809	254	4	44	6	25	22238.51	22238.51	0.00	14232.68	8005.83	1	1	0
2810	254	1000	798	245	45	60051.21	0.00	60051.21	36890.49	23160.72	1	0	1
2811	254	1000	1219	170	26	4807.27	0.00	4807.27	3076.65	1730.62	1	0	1
2812	254	1000	1013	9	36	38191.62	0.00	38191.62	34372.44	3819.18	1	0	1
2813	254	1000	939	152	5	192725.89	0.00	192725.89	138102.36	54623.53	1	0	1
2814	254	1000	780	236	46	4128.91	0.00	4128.91	3592.15	536.76	1	0	1
2815	254	1000	310	47	23	63244.99	0.00	63244.99	49739.63	13505.36	1	0	1
2816	254	1000	100	60	35	108454.32	0.00	108454.32	77558.61	30895.71	1	0	1
2817	254	3	896	226	35	24791.37	24791.37	0.00	18654.48	6136.89	1	1	0
2818	254	1000	214	206	5	139810.04	0.00	139810.04	110553.76	29256.28	1	0	1
2819	254	1000	264	229	40	967.82	0.00	967.82	812.98	154.84	1	0	1
2820	254	3	734	43	12	37548.65	37548.65	0.00	29231.95	8316.70	1	1	0
2821	254	1	758	51	21	200493.44	200493.44	0.00	156836.22	43657.22	1	1	0
2822	254	3	495	132	47	46291.67	46291.67	0.00	30644.48	15647.19	1	1	0
2823	254	2	657	155	33	68954.56	68954.56	0.00	56588.91	12365.65	1	1	0
2824	254	3	485	63	49	90268.38	90268.38	0.00	60742.33	29526.05	1	1	0
2825	254	3	478	188	1	112756.75	112756.75	0.00	74778.46	37978.29	1	1	0
2826	254	1000	435	172	23	37392.30	0.00	37392.30	28854.62	8537.68	1	0	1
2827	254	1	702	143	27	74093.78	74093.78	0.00	54064.43	20029.35	1	1	0
2828	254	1000	918	124	23	140398.59	0.00	140398.59	93970.43	46428.16	1	0	1
2829	254	3	1010	230	7	115508.82	115508.82	0.00	89662.17	25846.65	1	1	0
2830	254	1000	729	100	28	41399.76	0.00	41399.76	32154.42	9245.34	1	0	1
2831	254	2	185	41	29	215678.69	215678.69	0.00	158422.33	57256.36	1	1	0
2832	254	1000	398	136	18	95943.33	0.00	95943.33	74073.92	21869.41	1	0	1
2833	254	1000	569	86	46	38697.69	0.00	38697.69	30157.75	8539.94	1	0	1
2834	254	1000	101	193	49	48525.09	0.00	48525.09	39156.84	9368.25	1	0	1
2835	254	3	1167	129	27	90323.48	90323.48	0.00	70179.06	20144.42	1	1	0
2836	254	1	128	140	43	23114.04	23114.04	0.00	18254.96	4859.08	1	1	0
2837	254	1	1121	31	12	10154.28	10154.28	0.00	7108.00	3046.28	1	1	0
2838	254	3	651	140	22	18853.71	18853.71	0.00	16402.74	2450.97	1	1	0
2839	254	4	1234	220	18	18366.00	18366.00	0.00	11570.58	6795.42	1	1	0
2840	254	1000	596	107	6	18974.92	0.00	18974.92	14877.62	4097.30	1	0	1
2841	254	4	1140	89	7	2611.75	2611.75	0.00	2350.58	261.17	1	1	0
2842	254	3	605	166	40	39440.66	39440.66	0.00	32382.16	7058.50	1	1	0
2843	254	2	299	46	36	136092.28	136092.28	0.00	105962.96	30129.32	1	1	0
2844	254	1000	1173	211	43	150923.03	0.00	150923.03	122025.68	28897.35	1	0	1
2845	254	1000	536	126	23	41789.44	0.00	41789.44	25366.96	16422.48	1	0	1
2846	254	1	1138	250	11	60111.79	60111.79	0.00	37278.60	22833.19	1	1	0
2847	254	1000	145	166	27	139863.76	0.00	139863.76	114183.94	25679.82	1	0	1
2848	254	2	67	179	17	114917.13	114917.13	0.00	92789.69	22127.44	1	1	0
2849	254	1	470	146	10	17141.32	17141.32	0.00	15084.37	2056.95	1	1	0
2850	254	1000	591	70	38	200534.71	0.00	200534.71	152899.97	47634.74	1	0	1
2851	254	4	1011	48	42	12084.63	12084.63	0.00	9184.32	2900.31	1	1	0
2852	254	2	198	176	10	116608.84	116608.84	0.00	80075.48	36533.36	1	1	0
2853	254	1000	390	195	32	3939.84	0.00	3939.84	2521.50	1418.34	1	0	1
2854	254	1000	271	187	35	128945.54	0.00	128945.54	92715.82	36229.72	1	0	1
2855	254	1000	1117	42	24	107583.62	0.00	107583.62	81725.16	25858.46	1	0	1
2856	254	2	569	108	29	190040.31	190040.31	0.00	153375.23	36665.08	1	1	0
2857	254	1	196	147	40	126017.39	126017.39	0.00	95218.81	30798.58	1	1	0
2858	254	1000	116	241	8	61484.20	0.00	61484.20	51494.06	9990.14	1	0	1
2859	254	1000	435	36	18	4247.06	0.00	4247.06	3610.00	637.06	1	0	1
2860	254	2	969	160	18	37752.60	37752.60	0.00	33599.82	4152.78	1	1	0
2861	254	4	604	135	25	77919.77	77919.77	0.00	59686.75	18233.02	1	1	0
2862	254	1000	818	203	42	98579.55	0.00	98579.55	72378.77	26200.78	1	0	1
2863	254	1000	766	249	8	4804.50	0.00	4804.50	2930.75	1873.75	1	0	1
2864	254	1000	1120	222	8	31057.95	0.00	31057.95	23604.07	7453.88	1	0	1
2865	254	4	1120	11	41	53382.91	53382.91	0.00	34277.51	19105.40	1	1	0
2866	254	2	330	204	5	17141.32	17141.32	0.00	15084.37	2056.95	1	1	0
2867	254	3	361	92	50	804.37	804.37	0.00	635.45	168.92	1	1	0
2868	254	3	569	185	44	77666.29	77666.29	0.00	46734.12	30932.17	1	1	0
2869	254	1	304	96	42	62166.40	62166.40	0.00	37921.52	24244.88	1	1	0
2870	254	4	154	188	41	59505.70	59505.70	0.00	49010.78	10494.92	1	1	0
2871	254	1000	204	121	5	16085.07	0.00	16085.07	14315.70	1769.37	1	0	1
2872	254	4	1277	120	23	14303.86	14303.86	0.00	9936.69	4367.17	1	1	0
2873	254	1	174	169	37	74867.31	74867.31	0.00	61448.95	13418.36	1	1	0
2874	254	1000	29	58	20	15185.10	0.00	15185.10	12603.64	2581.46	1	0	1
2875	254	4	85	170	46	48881.76	48881.76	0.00	32183.38	16698.38	1	1	0
2876	254	3	536	88	28	34859.68	34859.68	0.00	28100.44	6759.24	1	1	0
2877	254	1000	934	245	26	40942.30	0.00	40942.30	28254.34	12687.96	1	0	1
2878	254	1000	1081	119	18	77994.96	0.00	77994.96	54596.48	23398.48	1	0	1
2879	254	1000	133	237	27	110191.15	0.00	110191.15	81686.46	28504.69	1	0	1
2880	254	1000	561	62	34	58648.50	0.00	58648.50	52197.18	6451.32	1	0	1
2881	254	1000	412	107	32	32117.84	0.00	32117.84	20723.31	11394.53	1	0	1
2882	254	1	197	88	45	42936.84	42936.84	0.00	27479.61	15457.23	1	1	0
2883	254	1	146	31	12	30383.94	30383.94	0.00	20372.87	10011.07	1	1	0
2884	254	1000	1211	97	37	203301.64	0.00	203301.64	142536.34	60765.30	1	0	1
2885	254	3	801	153	47	72891.02	72891.02	0.00	53964.41	18926.61	1	1	0
2886	254	1000	433	198	45	56628.90	0.00	56628.90	50399.73	6229.17	1	0	1
2887	254	1	779	125	48	41428.84	41428.84	0.00	33968.19	7460.65	1	1	0
2888	254	3	210	158	21	156773.15	156773.15	0.00	121429.67	35343.48	1	1	0
2889	254	1000	786	93	24	52251.60	0.00	52251.60	33963.52	18288.08	1	0	1
2890	254	3	528	155	16	155913.27	155913.27	0.00	124914.71	30998.56	1	1	0
2891	254	4	442	94	35	78838.89	78838.89	0.00	51006.35	27832.54	1	1	0
2892	254	4	417	216	46	56618.94	56618.94	0.00	37368.48	19250.46	1	1	0
2893	254	1000	1053	150	30	249172.46	0.00	249172.46	197552.22	51620.24	1	0	1
2894	254	1000	1252	130	24	68007.15	0.00	68007.15	48228.89	19778.26	1	0	1
2895	254	1	603	126	49	115843.83	115843.83	0.00	88098.98	27744.85	1	1	0
2896	254	1	188	215	8	117677.22	117677.22	0.00	78621.91	39055.31	1	1	0
2897	254	1000	673	108	1	34355.51	0.00	34355.51	30471.62	3883.89	1	0	1
2898	254	2	1229	94	37	143145.21	143145.21	0.00	107535.51	35609.70	1	1	0
2899	254	1000	656	133	38	43685.36	0.00	43685.36	32564.62	11120.74	1	0	1
2900	254	4	558	109	32	26695.20	26695.20	0.00	22487.80	4207.40	1	1	0
2901	254	1000	1268	73	27	167005.83	0.00	167005.83	124027.22	42978.61	1	0	1
2902	254	4	342	99	42	87818.23	87818.23	0.00	54526.64	33291.59	1	1	0
2903	254	1000	1011	168	38	35192.52	0.00	35192.52	29913.66	5278.86	1	0	1
2904	254	1000	1091	27	47	153799.08	0.00	153799.08	103454.85	50344.23	1	0	1
2905	254	2	306	18	39	65354.79	65354.79	0.00	49233.94	16120.85	1	1	0
2906	254	1000	834	125	34	52223.75	0.00	52223.75	44493.58	7730.17	1	0	1
2907	254	4	795	143	17	45736.83	45736.83	0.00	34654.00	11082.83	1	1	0
2908	254	1000	1016	26	9	199747.68	0.00	199747.68	167455.63	32292.05	1	0	1
2909	254	1000	826	39	32	138540.38	0.00	138540.38	99864.37	38676.01	1	0	1
2910	254	1000	901	208	43	24345.56	0.00	24345.56	15129.01	9216.55	1	0	1
2911	254	1000	668	3	9	71646.64	0.00	71646.64	58750.24	12896.40	1	0	1
2912	254	4	559	196	3	102058.50	102058.50	0.00	81780.04	20278.46	1	1	0
2913	254	3	9	224	26	78232.48	78232.48	0.00	68102.38	10130.10	1	1	0
2914	254	1	395	73	2	46008.15	46008.15	0.00	34966.20	11041.95	1	1	0
2915	254	4	1184	199	16	51269.85	51269.85	0.00	38872.85	12397.00	1	1	0
2916	254	1000	1093	92	40	129471.28	0.00	129471.28	99377.89	30093.39	1	0	1
2917	254	1000	751	34	4	63665.31	0.00	63665.31	47936.04	15729.27	1	0	1
2918	254	2	272	132	36	76741.28	76741.28	0.00	62135.76	14605.52	1	1	0
2919	254	1000	280	246	1	55996.58	0.00	55996.58	46127.92	9868.66	1	0	1
2920	254	1000	276	33	38	207909.25	0.00	207909.25	150078.83	57830.42	1	0	1
2921	254	3	1068	89	11	16414.80	16414.80	0.00	12639.36	3775.44	1	1	0
2922	254	1	558	16	16	47166.90	47166.90	0.00	37922.41	9244.49	1	1	0
2923	254	2	950	239	17	125839.91	125839.91	0.00	94171.61	31668.30	1	1	0
2924	254	1	1064	14	46	59641.67	59641.67	0.00	46686.02	12955.65	1	1	0
2925	254	1000	350	200	25	73765.42	0.00	73765.42	56470.16	17295.26	1	0	1
2926	254	1000	186	103	47	199999.14	0.00	199999.14	155598.20	44400.94	1	0	1
2927	254	3	409	17	30	76536.30	76536.30	0.00	61532.62	15003.68	1	1	0
2928	254	1000	360	211	36	187046.98	0.00	187046.98	137654.82	49392.16	1	0	1
2929	254	3	428	37	46	113421.66	113421.66	0.00	79154.04	34267.62	1	1	0
2930	254	4	1145	205	41	154965.03	154965.03	0.00	121790.90	33174.13	1	1	0
2931	254	2	187	144	43	74092.89	74092.89	0.00	52081.97	22010.92	1	1	0
2932	254	1000	269	178	33	51170.82	0.00	51170.82	40416.90	10753.92	1	0	1
2933	254	3	1272	209	43	14325.68	14325.68	0.00	12176.80	2148.88	1	1	0
2934	254	4	1156	28	37	129860.22	129860.22	0.00	96309.36	33550.86	1	1	0
2935	254	1000	474	189	17	39940.96	0.00	39940.96	25871.52	14069.44	1	0	1
2936	254	1000	1182	2	47	20296.64	0.00	20296.64	16237.28	4059.36	1	0	1
2937	254	1000	449	50	7	95960.19	0.00	95960.19	67089.78	28870.41	1	0	1
2938	254	4	130	129	33	53791.96	53791.96	0.00	36841.42	16950.54	1	1	0
2939	254	1000	335	72	9	37697.14	0.00	37697.14	26219.52	11477.62	1	0	1
2940	254	1000	945	85	3	19818.26	0.00	19818.26	15670.66	4147.60	1	0	1
2941	254	1000	885	216	31	147309.76	0.00	147309.76	102835.66	44474.10	1	0	1
2942	254	4	186	232	13	107263.94	107263.94	0.00	73705.58	33558.36	1	1	0
2943	254	4	85	153	22	26630.70	26630.70	0.00	21038.25	5592.45	1	1	0
2944	254	2	340	69	37	109680.65	109680.65	0.00	83680.40	26000.25	1	1	0
2945	254	1	549	232	15	95800.80	95800.80	0.00	71671.34	24129.46	1	1	0
2946	254	1000	1145	145	26	111656.52	0.00	111656.52	91967.88	19688.64	1	0	1
2947	254	1000	21	130	49	229264.63	0.00	229264.63	155892.29	73372.34	1	0	1
2948	254	2	1049	91	9	124391.46	124391.46	0.00	93066.87	31324.59	1	1	0
2949	254	1000	261	74	48	137472.78	0.00	137472.78	99686.16	37786.62	1	0	1
2950	254	2	1158	249	11	53818.30	53818.30	0.00	34981.90	18836.40	1	1	0
2951	254	1000	550	187	49	94820.07	0.00	94820.07	79331.05	15489.02	1	0	1
2952	254	3	644	197	16	66672.17	66672.17	0.00	56284.62	10387.55	1	1	0
2953	254	1000	864	92	28	140852.40	0.00	140852.40	101314.07	39538.33	1	0	1
2954	254	4	767	86	16	138850.88	138850.88	0.00	96391.12	42459.76	1	1	0
2955	254	1000	1095	105	48	28508.90	0.00	28508.90	18610.40	9898.50	1	0	1
2956	254	4	788	52	49	46761.67	46761.67	0.00	41314.33	5447.34	1	1	0
2957	254	1000	128	174	34	131682.29	0.00	131682.29	94252.12	37430.17	1	0	1
2958	254	1000	320	131	20	95005.52	0.00	95005.52	70804.51	24201.01	1	0	1
2959	254	3	681	155	34	62959.75	62959.75	0.00	41136.90	21822.85	1	1	0
2960	254	3	393	86	27	20402.11	20402.11	0.00	13251.16	7150.95	1	1	0
2961	254	3	49	195	12	25153.67	25153.67	0.00	17785.01	7368.66	1	1	0
2962	254	1000	262	251	29	51769.86	0.00	51769.86	40681.80	11088.06	1	0	1
2964	254	2	1194	34	44	100059.84	100059.84	0.00	74226.47	25833.37	1	1	0
2965	254	1000	1145	215	28	8955.83	0.00	8955.83	7343.78	1612.05	1	0	1
2966	254	1000	196	235	9	14737.70	0.00	14737.70	10758.50	3979.20	1	0	1
2967	254	1	555	57	23	35590.41	35590.41	0.00	24913.26	10677.15	1	1	0
2968	254	4	86	92	1	43826.28	43826.28	0.00	29475.76	14350.52	1	1	0
2969	254	3	886	213	38	37312.20	37312.20	0.00	29476.62	7835.58	1	1	0
2970	254	1	1118	123	19	175106.59	175106.59	0.00	128664.71	46441.88	1	1	0
2971	254	3	734	217	25	134873.40	134873.40	0.00	105379.32	29494.08	1	1	0
2972	254	3	128	28	29	53263.01	53263.01	0.00	33075.22	20187.79	1	1	0
2973	254	1	428	42	1	66224.49	66224.49	0.00	47476.53	18747.96	1	1	0
2974	254	1000	295	95	11	30307.46	0.00	30307.46	23246.78	7060.68	1	0	1
2975	254	4	740	79	50	176732.93	176732.93	0.00	117794.40	58938.53	1	1	0
2976	254	2	217	224	14	116358.29	116358.29	0.00	83030.54	33327.75	1	1	0
2977	254	1000	792	168	34	63247.82	0.00	63247.82	48402.34	14845.48	1	0	1
2978	254	2	1259	225	7	33477.12	33477.12	0.00	27116.46	6360.66	1	1	0
2979	254	1000	112	57	44	187970.29	0.00	187970.29	138226.76	49743.53	1	0	1
2980	254	2	730	170	14	111821.82	111821.82	0.00	82137.90	29683.92	1	1	0
2981	254	2	72	23	16	29535.93	29535.93	0.00	20084.43	9451.50	1	1	0
2982	254	1000	523	168	28	16804.66	0.00	16804.66	11514.95	5289.71	1	0	1
2983	254	1000	256	225	1	27626.20	0.00	27626.20	22080.16	5546.04	1	0	1
2984	254	4	191	106	19	150711.28	150711.28	0.00	117644.02	33067.26	1	1	0
2985	254	1000	302	184	39	7776.50	0.00	7776.50	6998.86	777.64	1	0	1
2986	254	4	346	196	9	24350.62	24350.62	0.00	19723.97	4626.65	1	1	0
2987	254	1000	1119	238	17	2649.56	0.00	2649.56	2094.47	555.09	1	0	1
2988	254	3	1025	149	24	62696.61	62696.61	0.00	45768.51	16928.10	1	1	0
2989	254	3	296	169	41	8013.18	8013.18	0.00	5107.42	2905.76	1	1	0
2990	254	1	194	174	14	108509.08	108509.08	0.00	76980.74	31528.34	1	1	0
2991	254	1000	468	241	50	99725.67	0.00	99725.67	70812.61	28913.06	1	0	1
2992	254	1	131	194	34	146077.11	146077.11	0.00	107027.55	39049.56	1	1	0
2993	254	1000	853	10	40	141382.70	0.00	141382.70	96937.40	44445.30	1	0	1
2994	254	3	1229	197	2	66992.66	66992.66	0.00	57613.71	9378.95	1	1	0
2995	254	3	787	37	15	69290.64	69290.64	0.00	49354.39	19936.25	1	1	0
2996	254	2	150	16	33	47346.81	47346.81	0.00	39882.20	7464.61	1	1	0
2997	254	4	161	138	9	122205.48	122205.48	0.00	96685.92	25519.56	1	1	0
2998	254	1000	557	248	2	189198.34	0.00	189198.34	150163.07	39035.27	1	0	1
2999	254	4	832	133	10	9606.44	9606.44	0.00	6770.71	2835.73	1	1	0
3000	254	1000	117	91	36	34248.16	0.00	34248.16	24647.52	9600.64	1	0	1
3001	254	1000	1086	175	22	9247.02	0.00	9247.02	6103.03	3143.99	1	0	1
3002	254	1	250	176	44	72665.36	72665.36	0.00	62573.42	10091.94	1	1	0
3003	254	3	168	55	24	106430.19	106430.19	0.00	72041.58	34388.61	1	1	0
3004	254	3	764	153	17	25802.32	25802.32	0.00	19410.20	6392.12	1	1	0
3005	254	1	753	187	21	1144.76	1144.76	0.00	950.15	194.61	1	1	0
3006	254	2	1068	229	15	8943.93	8943.93	0.00	6152.90	2791.03	1	1	0
3007	254	2	516	7	48	40720.04	40720.04	0.00	25088.76	15631.28	1	1	0
3008	254	1000	531	19	29	28084.91	0.00	28084.91	23591.33	4493.58	1	0	1
3009	254	1000	917	138	46	13823.30	0.00	13823.30	9439.58	4383.72	1	0	1
3010	254	3	525	227	31	122665.97	122665.97	0.00	106800.63	15865.34	1	1	0
3011	254	1000	442	184	32	31340.00	0.00	31340.00	26952.40	4387.60	1	0	1
3012	254	2	284	25	48	83167.90	83167.90	0.00	73882.98	9284.92	1	1	0
3013	254	1000	748	31	23	75216.00	0.00	75216.00	54155.50	21060.50	1	0	1
3014	254	4	638	53	21	113169.04	113169.04	0.00	93841.92	19327.12	1	1	0
3015	254	4	987	51	24	111937.98	111937.98	0.00	84951.38	26986.60	1	1	0
3016	254	3	1047	100	46	175609.95	175609.95	0.00	116625.76	58984.19	1	1	0
3017	254	4	37	233	32	16085.07	16085.07	0.00	14315.70	1769.37	1	1	0
3018	254	4	1272	99	25	122292.03	122292.03	0.00	96279.26	26012.77	1	1	0
3019	254	1000	189	71	20	144717.34	0.00	144717.34	114877.89	29839.45	1	0	1
3020	254	4	22	217	33	18149.43	18149.43	0.00	13504.84	4644.59	1	1	0
3021	254	4	607	197	50	119880.83	119880.83	0.00	91857.44	28023.39	1	1	0
3022	254	3	425	246	34	171826.08	171826.08	0.00	118531.44	53294.64	1	1	0
3023	254	2	675	164	4	95541.87	95541.87	0.00	66395.79	29146.08	1	1	0
3024	254	4	259	18	34	50015.76	50015.76	0.00	44850.60	5165.16	1	1	0
3025	254	1000	985	74	48	78827.26	0.00	78827.26	62647.74	16179.52	1	0	1
3026	254	1000	1117	191	29	94558.01	0.00	94558.01	68163.35	26394.66	1	0	1
3027	254	1000	370	122	17	166974.20	0.00	166974.20	128830.32	38143.88	1	0	1
3028	254	2	161	84	49	9749.68	9749.68	0.00	7693.60	2056.08	1	1	0
3029	254	1	1126	185	35	38410.58	38410.58	0.00	32964.87	5445.71	1	1	0
3030	254	1000	610	195	48	96356.50	0.00	96356.50	81398.88	14957.62	1	0	1
3031	254	4	980	204	18	43742.50	43742.50	0.00	31597.17	12145.33	1	1	0
3032	254	1000	864	88	49	29956.04	0.00	29956.04	25747.76	4208.28	1	0	1
3033	254	2	488	148	47	49668.73	49668.73	0.00	39379.76	10288.97	1	1	0
3034	254	1000	667	165	42	102734.24	0.00	102734.24	67050.94	35683.30	1	0	1
3035	254	1000	332	92	24	140650.93	0.00	140650.93	124310.47	16340.46	1	0	1
3036	254	1000	1166	224	49	109021.14	0.00	109021.14	82412.97	26608.17	1	0	1
3037	254	1	698	163	25	79181.86	79181.86	0.00	64824.59	14357.27	1	1	0
3038	254	4	1129	129	22	14785.32	14785.32	0.00	9758.34	5026.98	1	1	0
3039	254	1000	306	134	3	142362.11	0.00	142362.11	112105.12	30256.99	1	0	1
3040	254	1000	1188	14	49	19589.83	0.00	19589.83	13878.36	5711.47	1	0	1
3041	254	1000	29	31	45	22695.55	0.00	22695.55	14752.10	7943.45	1	0	1
3042	254	1	429	189	37	27217.75	27217.75	0.00	24496.01	2721.74	1	1	0
3043	254	2	886	179	9	102447.81	102447.81	0.00	65314.82	37132.99	1	1	0
3044	254	1000	610	239	23	131651.02	0.00	131651.02	100408.69	31242.33	1	0	1
3045	254	1000	1260	147	27	62707.23	0.00	62707.23	47141.67	15565.56	1	0	1
3046	254	3	391	4	37	28586.01	28586.01	0.00	18580.92	10005.09	1	1	0
3047	254	1	432	24	3	71024.04	71024.04	0.00	49952.32	21071.72	1	1	0
3048	254	4	176	164	50	16804.20	16804.20	0.00	13107.30	3696.90	1	1	0
3049	254	1000	19	11	29	55899.72	0.00	55899.72	45539.56	10360.16	1	0	1
3050	254	2	1017	20	2	9775.84	9775.84	0.00	7820.64	1955.20	1	1	0
3051	254	1000	279	64	20	64645.83	0.00	64645.83	49410.18	15235.65	1	0	1
3052	254	1000	523	73	33	4666.03	0.00	4666.03	4106.11	559.92	1	0	1
3053	254	1000	160	203	8	37625.02	0.00	37625.02	30602.39	7022.63	1	0	1
3054	254	1000	498	90	50	18209.01	0.00	18209.01	15295.56	2913.45	1	0	1
3055	254	1	1220	118	11	97138.56	97138.56	0.00	70788.32	26350.24	1	1	0
3056	254	1000	574	151	7	28345.86	0.00	28345.86	22393.20	5952.66	1	0	1
3057	254	1000	112	212	14	24994.68	0.00	24994.68	16246.56	8748.12	1	0	1
3058	254	1000	581	212	25	131087.75	0.00	131087.75	95062.60	36025.15	1	0	1
3059	254	1	1062	49	1	62513.39	62513.39	0.00	50977.61	11535.78	1	1	0
3060	254	1000	657	39	15	28692.78	0.00	28692.78	25797.76	2895.02	1	0	1
3061	254	1	318	234	39	159070.75	159070.75	0.00	121564.19	37506.56	1	1	0
3062	254	1000	1225	27	10	142075.23	0.00	142075.23	120575.56	21499.67	1	0	1
3063	254	1000	683	213	12	102803.54	0.00	102803.54	69528.84	33274.70	1	0	1
3064	254	4	637	193	29	64078.64	64078.64	0.00	40912.56	23166.08	1	1	0
3065	254	1000	1154	248	29	81756.12	0.00	81756.12	50084.04	31672.08	1	0	1
3066	254	1	1040	251	5	25448.88	25448.88	0.00	15269.34	10179.54	1	1	0
3067	254	1	702	123	39	203337.75	203337.75	0.00	149075.30	54262.45	1	1	0
3068	254	1000	604	226	23	125775.04	0.00	125775.04	94476.00	31299.04	1	0	1
3069	254	4	1058	71	24	17216.76	17216.76	0.00	15495.08	1721.68	1	1	0
3070	254	1	671	35	47	47769.54	47769.54	0.00	32483.28	15286.26	1	1	0
3071	254	2	932	103	17	164442.23	164442.23	0.00	129626.82	34815.41	1	1	0
3072	254	3	1282	8	44	120834.50	120834.50	0.00	92387.45	28447.05	1	1	0
3073	254	2	195	223	29	48995.35	48995.35	0.00	40176.20	8819.15	1	1	0
3074	254	1000	1135	19	12	167007.27	0.00	167007.27	109775.18	57232.09	1	0	1
3075	254	2	264	159	4	12036.99	12036.99	0.00	8064.78	3972.21	1	1	0
3076	254	1000	764	64	25	20338.01	0.00	20338.01	16988.07	3349.94	1	0	1
3077	254	3	356	127	47	184916.54	184916.54	0.00	132426.94	52489.60	1	1	0
3078	254	1	152	6	20	71293.14	71293.14	0.00	50826.12	20467.02	1	1	0
3079	254	4	674	209	1	7319.37	7319.37	0.00	5269.95	2049.42	1	1	0
3080	254	1000	1121	34	29	58522.03	0.00	58522.03	49158.48	9363.55	1	0	1
3081	254	1000	1292	158	40	20914.94	0.00	20914.94	15128.98	5785.96	1	0	1
3082	254	1000	71	219	39	99292.54	0.00	99292.54	74761.11	24531.43	1	0	1
3083	254	1000	1227	142	18	119710.14	0.00	119710.14	94027.49	25682.65	1	0	1
3084	254	1000	882	14	19	90892.98	0.00	90892.98	73037.13	17855.85	1	0	1
3085	254	3	112	237	38	55458.37	55458.37	0.00	41885.18	13573.19	1	1	0
3086	254	4	824	119	34	156279.78	156279.78	0.00	110514.26	45765.52	1	1	0
3087	254	2	651	6	34	72066.57	72066.57	0.00	50544.98	21521.59	1	1	0
3088	254	1000	185	51	4	65224.40	0.00	65224.40	39134.60	26089.80	1	0	1
3089	254	1000	1275	247	34	98667.10	0.00	98667.10	65037.38	33629.72	1	0	1
3090	254	1	463	13	1	136505.58	136505.58	0.00	107850.30	28655.28	1	1	0
3091	254	1000	378	46	50	36488.74	0.00	36488.74	31881.52	4607.22	1	0	1
3092	254	1	490	14	9	124990.69	124990.69	0.00	95589.20	29401.49	1	1	0
3093	254	1000	396	183	6	60350.97	0.00	60350.97	47656.20	12694.77	1	0	1
3094	254	2	544	123	2	141739.62	141739.62	0.00	98129.04	43610.58	1	1	0
3095	254	3	194	192	22	16288.60	16288.60	0.00	11087.15	5201.45	1	1	0
3096	254	2	789	118	27	86487.07	86487.07	0.00	73034.31	13452.76	1	1	0
3097	254	1000	1289	99	21	46410.95	0.00	46410.95	35844.75	10566.20	1	0	1
3098	254	1	394	222	28	86455.94	86455.94	0.00	63074.06	23381.88	1	1	0
3099	254	2	895	48	25	5386.52	5386.52	0.00	3975.93	1410.59	1	1	0
3100	254	2	1035	74	21	99300.68	99300.68	0.00	76633.32	22667.36	1	1	0
3101	254	1000	995	59	50	73173.49	0.00	73173.49	50880.25	22293.24	1	0	1
3102	254	1000	237	198	36	94066.07	0.00	94066.07	72142.53	21923.54	1	0	1
3103	254	3	356	2	34	20602.19	20602.19	0.00	16129.09	4473.10	1	1	0
3104	254	1000	953	165	42	58844.46	0.00	58844.46	41017.79	17826.67	1	0	1
3105	254	1	169	128	4	30107.64	30107.64	0.00	20473.20	9634.44	1	1	0
3106	254	1	530	33	28	41051.61	41051.61	0.00	27441.86	13609.75	1	1	0
3107	254	1000	850	61	29	52013.43	0.00	52013.43	32768.46	19244.97	1	0	1
3108	254	3	562	208	41	12293.76	12293.76	0.00	8359.76	3934.00	1	1	0
3109	254	1000	827	153	43	150974.04	0.00	150974.04	117724.04	33250.00	1	0	1
3110	254	1000	620	182	27	74897.48	0.00	74897.48	50847.14	24050.34	1	0	1
3111	254	4	494	184	38	93953.75	93953.75	0.00	76889.18	17064.57	1	1	0
3112	254	3	1109	28	41	16787.28	16787.28	0.00	14101.32	2685.96	1	1	0
3113	254	1000	942	107	42	28071.19	0.00	28071.19	22353.23	5717.96	1	0	1
3114	254	1000	446	122	38	106027.72	0.00	106027.72	93402.06	12625.66	1	0	1
3115	254	2	549	243	48	70035.22	70035.22	0.00	49253.14	20782.08	1	1	0
3116	254	1000	915	51	3	4150.68	0.00	4150.68	3403.56	747.12	1	0	1
3117	254	1000	727	216	39	264206.67	0.00	264206.67	198280.02	65926.65	1	0	1
3118	254	1	1022	221	41	22300.80	22300.80	0.00	18670.41	3630.39	1	1	0
3119	254	1000	1271	89	47	164551.30	0.00	164551.30	136772.51	27778.79	1	0	1
3120	254	1000	547	47	5	31270.70	0.00	31270.70	24391.15	6879.55	1	0	1
3121	254	3	1093	203	14	69288.52	69288.52	0.00	55854.13	13434.39	1	1	0
3122	254	1000	852	212	17	107305.72	0.00	107305.72	80708.07	26597.65	1	0	1
3123	254	1000	998	161	9	65706.77	0.00	65706.77	43089.85	22616.92	1	0	1
3124	254	1000	176	240	25	300181.91	0.00	300181.91	222688.23	77493.68	1	0	1
3125	254	1000	1210	244	18	58901.96	0.00	58901.96	40308.68	18593.28	1	0	1
3126	254	1000	1131	155	45	55972.48	0.00	55972.48	47016.88	8955.60	1	0	1
3127	254	4	558	143	16	96528.10	96528.10	0.00	66033.84	30494.26	1	1	0
3128	254	1000	161	242	7	107035.15	0.00	107035.15	79716.15	27319.00	1	0	1
3129	254	4	497	132	8	235953.18	235953.18	0.00	187496.39	48456.79	1	1	0
3130	254	1000	1045	166	48	172315.81	0.00	172315.81	133218.78	39097.03	1	0	1
3131	254	1000	1209	65	45	66477.35	0.00	66477.35	47501.46	18975.89	1	0	1
3132	254	1000	1088	220	30	161861.70	0.00	161861.70	133521.85	28339.85	1	0	1
3133	254	1	594	113	40	16200.04	16200.04	0.00	12254.44	3945.60	1	1	0
3134	254	3	601	207	3	72198.37	72198.37	0.00	57255.94	14942.43	1	1	0
3135	254	1000	1249	166	10	31896.50	0.00	31896.50	22646.50	9250.00	1	0	1
3136	254	1000	929	240	49	40856.70	0.00	40856.70	28507.74	12348.96	1	0	1
3137	254	1000	1021	32	41	8482.96	0.00	8482.96	5089.78	3393.18	1	0	1
3138	254	1	107	186	22	183521.73	183521.73	0.00	131658.43	51863.30	1	1	0
3139	254	1	966	25	17	285786.54	285786.54	0.00	212685.53	73101.01	1	1	0
3140	254	1000	1236	252	48	58074.11	0.00	58074.11	44946.88	13127.23	1	0	1
3141	254	1000	313	35	38	74082.02	0.00	74082.02	50878.07	23203.95	1	0	1
3142	254	1000	972	7	25	90048.30	0.00	90048.30	56270.80	33777.50	1	0	1
3143	254	1000	129	106	50	114190.08	0.00	114190.08	91729.14	22460.94	1	0	1
3144	254	2	53	175	23	142108.72	142108.72	0.00	110828.87	31279.85	1	1	0
3145	254	4	326	200	34	95380.17	95380.17	0.00	83501.55	11878.62	1	1	0
3146	254	1000	1057	67	23	101866.47	0.00	101866.47	68534.71	33331.76	1	0	1
3147	254	1000	1279	5	41	74306.01	0.00	74306.01	55598.34	18707.67	1	0	1
3148	254	3	653	58	21	90436.74	90436.74	0.00	59011.79	31424.95	1	1	0
3149	254	1000	569	124	41	214874.84	0.00	214874.84	161219.92	53654.92	1	0	1
3150	254	4	875	62	9	103194.91	103194.91	0.00	80655.21	22539.70	1	1	0
3151	254	1000	387	238	23	51041.46	0.00	51041.46	40833.18	10208.28	1	0	1
3152	254	2	6	242	20	141761.67	141761.67	0.00	110335.18	31426.49	1	1	0
3153	254	3	1102	160	19	36053.99	36053.99	0.00	27959.38	8094.61	1	1	0
3154	254	1000	816	140	7	44308.55	0.00	44308.55	35119.18	9189.37	1	0	1
3155	254	2	1029	16	33	6999.67	6999.67	0.00	6229.71	769.96	1	1	0
3156	254	1000	353	186	41	43470.46	0.00	43470.46	31141.85	12328.61	1	0	1
3157	254	1000	677	117	2	53367.75	0.00	53367.75	43189.81	10177.94	1	0	1
3158	254	1	805	101	10	42336.36	42336.36	0.00	30058.83	12277.53	1	1	0
3159	254	1	896	249	2	131230.73	131230.73	0.00	104732.70	26498.03	1	1	0
3160	254	1	566	210	2	71381.58	71381.58	0.00	57234.24	14147.34	1	1	0
3161	254	2	883	245	19	43864.88	43864.88	0.00	33064.69	10800.19	1	1	0
3162	254	1000	1221	115	50	34283.66	0.00	34283.66	26770.29	7513.37	1	0	1
3163	254	1000	836	14	37	21969.30	0.00	21969.30	18454.20	3515.10	1	0	1
3164	254	3	830	2	12	12182.72	12182.72	0.00	8644.44	3538.28	1	1	0
3165	254	1000	785	192	35	36055.66	0.00	36055.66	25351.42	10704.24	1	0	1
3166	254	1000	134	216	23	173277.83	0.00	173277.83	132772.70	40505.13	1	0	1
3167	254	1	1035	190	7	47605.80	47605.80	0.00	37779.88	9825.92	1	1	0
3168	254	4	370	148	40	82970.11	82970.11	0.00	61898.58	21071.53	1	1	0
3169	254	1000	444	26	34	90273.58	0.00	90273.58	75912.72	14360.86	1	0	1
3170	254	1000	1197	10	17	88627.26	0.00	88627.26	59579.28	29047.98	1	0	1
3171	254	4	1106	209	8	48054.59	48054.59	0.00	40713.03	7341.56	1	1	0
3172	254	2	1135	19	8	148326.76	148326.76	0.00	101871.31	46455.45	1	1	0
3173	254	1000	40	83	16	79847.83	0.00	79847.83	64134.02	15713.81	1	0	1
3174	254	1	853	214	40	66409.26	66409.26	0.00	50820.74	15588.52	1	1	0
3175	254	1000	1287	196	9	90969.29	0.00	90969.29	69731.81	21237.48	1	0	1
3176	254	1000	695	237	50	78336.62	0.00	78336.62	55719.81	22616.81	1	0	1
3177	254	2	138	50	22	65224.40	65224.40	0.00	39134.60	26089.80	1	1	0
3178	254	1000	1129	192	33	59072.89	0.00	59072.89	49819.82	9253.07	1	0	1
3179	254	4	493	3	46	34380.45	34380.45	0.00	22895.48	11484.97	1	1	0
3180	254	1000	339	43	25	44009.40	0.00	44009.40	39168.36	4841.04	1	0	1
3181	254	1	1285	55	43	79550.06	79550.06	0.00	67889.93	11660.13	1	1	0
3182	254	1000	882	241	25	47058.72	0.00	47058.72	40470.48	6588.24	1	0	1
3183	254	1	536	116	29	170006.24	170006.24	0.00	136268.22	33738.02	1	1	0
3184	254	1000	714	222	5	56265.16	0.00	56265.16	44489.92	11775.24	1	0	1
3185	254	2	284	196	8	156055.14	156055.14	0.00	123966.18	32088.96	1	1	0
3186	254	1000	12	190	21	124221.36	0.00	124221.36	85168.58	39052.78	1	0	1
3187	254	4	332	18	36	37583.34	37583.34	0.00	27811.68	9771.66	1	1	0
3188	254	1000	495	58	5	117332.21	0.00	117332.21	89340.00	27992.21	1	0	1
3189	254	1000	921	163	50	62172.74	0.00	62172.74	49116.48	13056.26	1	0	1
3190	254	1000	1188	91	42	159590.78	0.00	159590.78	130359.44	29231.34	1	0	1
3191	254	4	491	6	17	6222.16	6222.16	0.00	4231.06	1991.10	1	1	0
3192	254	4	539	144	43	49426.23	49426.23	0.00	31642.08	17784.15	1	1	0
3193	254	3	1088	75	38	142115.11	142115.11	0.00	113852.90	28262.21	1	1	0
3194	254	1000	567	249	31	19012.08	0.00	19012.08	14829.44	4182.64	1	0	1
3195	254	1000	653	20	37	88531.66	0.00	88531.66	61181.28	27350.38	1	0	1
3196	254	1000	1089	85	23	15663.54	0.00	15663.54	12060.92	3602.62	1	0	1
3197	254	1000	109	103	31	27648.58	0.00	27648.58	20280.57	7368.01	1	0	1
3198	254	1000	1191	50	39	137680.94	0.00	137680.94	107157.70	30523.24	1	0	1
3199	254	2	802	56	1	103719.85	103719.85	0.00	84054.62	19665.23	1	1	0
3200	254	3	187	124	19	27449.52	27449.52	0.00	22508.64	4940.88	1	1	0
3201	254	1000	483	89	41	173881.05	0.00	173881.05	138141.02	35740.03	1	0	1
3202	254	1000	83	52	2	55989.43	0.00	55989.43	45911.32	10078.11	1	0	1
3203	254	2	939	245	29	52421.75	52421.75	0.00	41423.52	10998.23	1	1	0
3204	254	1	488	20	24	206031.71	206031.71	0.00	142538.31	63493.40	1	1	0
3205	254	1	386	226	38	25888.19	25888.19	0.00	19070.20	6817.99	1	1	0
3206	254	1000	187	173	38	64250.46	0.00	64250.46	43903.48	20346.98	1	0	1
3207	254	2	134	211	29	78638.63	78638.63	0.00	62225.69	16412.94	1	1	0
3208	254	2	169	10	21	80073.34	80073.34	0.00	68781.84	11291.50	1	1	0
3209	254	3	1073	248	28	26655.24	26655.24	0.00	19550.00	7105.24	1	1	0
3210	254	1000	306	130	5	93450.85	0.00	93450.85	71911.76	21539.09	1	0	1
3211	254	1000	332	186	35	5372.13	0.00	5372.13	4566.30	805.83	1	0	1
3212	254	1000	1037	72	40	118457.52	0.00	118457.52	82127.00	36330.52	1	0	1
3213	254	1000	194	235	40	64757.46	0.00	64757.46	46688.79	18068.67	1	0	1
3214	254	1000	1203	31	43	66709.42	0.00	66709.42	48777.51	17931.91	1	0	1
3215	254	2	1146	240	11	143058.22	143058.22	0.00	96110.15	46948.07	1	1	0
3216	254	3	929	133	31	104263.78	104263.78	0.00	70436.83	33826.95	1	1	0
3217	254	1	1258	129	35	70853.39	70853.39	0.00	52554.76	18298.63	1	1	0
3218	254	1	611	22	36	157858.83	157858.83	0.00	117207.20	40651.63	1	1	0
3219	254	1000	61	131	33	1804.39	0.00	1804.39	1425.48	378.91	1	0	1
3220	254	1000	122	112	38	6231.45	0.00	6231.45	3863.50	2367.95	1	0	1
3221	254	2	848	56	18	146477.46	146477.46	0.00	107816.45	38661.01	1	1	0
3222	254	4	702	5	32	119638.45	119638.45	0.00	92331.85	27306.60	1	1	0
3223	254	1000	828	150	11	44586.80	0.00	44586.80	36115.30	8471.50	1	0	1
3224	254	1	996	54	8	66122.94	66122.94	0.00	51455.97	14666.97	1	1	0
3225	254	1000	619	138	28	56235.89	0.00	56235.89	40260.28	15975.61	1	0	1
3226	254	1000	932	137	17	1533.82	0.00	1533.82	1089.01	444.81	1	0	1
3227	254	1000	490	100	12	10197.60	0.00	10197.60	8260.04	1937.56	1	0	1
3228	254	1000	972	206	48	32732.21	0.00	32732.21	23861.26	8870.95	1	0	1
3229	254	1000	155	169	1	23360.60	0.00	23360.60	16352.40	7008.20	1	0	1
3230	254	2	863	238	11	35801.84	35801.84	0.00	31147.60	4654.24	1	1	0
3231	254	3	191	210	26	9009.90	9009.90	0.00	7863.18	1146.72	1	1	0
3232	254	1000	297	63	23	86205.80	0.00	86205.80	71800.40	14405.40	1	0	1
3233	254	1000	1158	43	48	10402.13	0.00	10402.13	7612.57	2789.56	1	0	1
3234	254	1	88	59	21	71345.16	71345.16	0.00	58588.00	12757.16	1	1	0
3235	254	3	882	66	14	94088.79	94088.79	0.00	80967.36	13121.43	1	1	0
3236	254	1000	333	72	4	54512.27	0.00	54512.27	43643.14	10869.13	1	0	1
3237	254	4	746	200	49	163262.85	163262.85	0.00	120852.89	42409.96	1	1	0
3238	254	1	563	65	36	52037.56	52037.56	0.00	33586.39	18451.17	1	1	0
3239	254	1000	438	148	15	17279.50	0.00	17279.50	11058.90	6220.60	1	0	1
3240	254	4	75	76	19	92869.73	92869.73	0.00	69969.16	22900.57	1	1	0
3241	254	1	484	44	10	68023.93	68023.93	0.00	52227.30	15796.63	1	1	0
3242	254	3	215	67	36	130506.47	130506.47	0.00	102061.66	28444.81	1	1	0
3243	254	1	647	26	5	26867.82	26867.82	0.00	22300.43	4567.39	1	1	0
3244	254	1000	59	155	30	237223.04	0.00	237223.04	180979.88	56243.16	1	0	1
3245	254	1000	785	151	6	86643.92	0.00	86643.92	72413.63	14230.29	1	0	1
3246	254	3	353	113	37	47811.24	47811.24	0.00	37035.48	10775.76	1	1	0
3247	254	1	687	143	33	70517.30	70517.30	0.00	50067.30	20450.00	1	1	0
3248	254	1000	1076	190	44	122038.90	0.00	122038.90	93386.19	28652.71	1	0	1
3249	254	1000	855	88	22	219881.76	0.00	219881.76	148647.48	71234.28	1	0	1
3250	254	4	903	16	39	55543.40	55543.40	0.00	44466.56	11076.84	1	1	0
3251	254	2	474	117	16	60837.00	60837.00	0.00	40760.80	20076.20	1	1	0
3252	254	1	441	17	7	149275.26	149275.26	0.00	122102.18	27173.08	1	1	0
3253	254	1000	1028	58	21	91903.88	0.00	91903.88	71470.76	20433.12	1	0	1
3254	254	3	157	103	7	20276.10	20276.10	0.00	17516.31	2759.79	1	1	0
3255	254	1	1280	21	8	203593.07	203593.07	0.00	170304.28	33288.79	1	1	0
3256	254	3	705	210	37	144332.32	144332.32	0.00	102347.44	41984.88	1	1	0
3257	254	3	1090	121	28	12533.89	12533.89	0.00	8914.82	3619.07	1	1	0
3258	254	1	573	69	36	17667.02	17667.02	0.00	14788.26	2878.76	1	1	0
3259	254	1	1205	77	2	72506.32	72506.32	0.00	53626.10	18880.22	1	1	0
3260	254	1000	1103	9	39	153306.43	0.00	153306.43	118944.48	34361.95	1	0	1
3261	254	1000	1186	142	32	158938.06	0.00	158938.06	126843.91	32094.15	1	0	1
3262	254	1000	1015	238	46	89102.58	0.00	89102.58	70345.53	18757.05	1	0	1
3263	254	1	728	176	4	91181.77	91181.77	0.00	60795.16	30386.61	1	1	0
3264	254	1000	906	47	12	120528.61	0.00	120528.61	93517.90	27010.71	1	0	1
3265	254	1000	557	65	30	83869.04	0.00	83869.04	67702.80	16166.24	1	0	1
3266	254	2	544	149	48	62449.25	62449.25	0.00	40299.85	22149.40	1	1	0
3267	254	4	496	242	38	42564.20	42564.20	0.00	33200.10	9364.10	1	1	0
3268	254	1000	1230	198	1	234466.74	0.00	234466.74	165252.61	69214.13	1	0	1
3269	254	3	926	112	34	297.30	297.30	0.00	211.08	86.22	1	1	0
3270	254	1000	1104	222	47	91567.25	0.00	91567.25	65439.04	26128.21	1	0	1
3271	254	4	688	221	22	85698.70	85698.70	0.00	66261.49	19437.21	1	1	0
3272	254	1000	327	77	50	115954.56	0.00	115954.56	89786.98	26167.58	1	0	1
3273	254	1000	493	53	18	242789.47	0.00	242789.47	183267.62	59521.85	1	0	1
3274	254	1000	135	19	23	91819.99	0.00	91819.99	69799.25	22020.74	1	0	1
3275	254	2	1132	138	14	205641.71	205641.71	0.00	159033.56	46608.15	1	1	0
3276	254	2	1169	114	37	84042.18	84042.18	0.00	58829.49	25212.69	1	1	0
3277	254	1000	276	161	31	151578.30	0.00	151578.30	103767.31	47810.99	1	0	1
3278	254	1000	245	26	23	24618.19	0.00	24618.19	18429.20	6188.99	1	0	1
3279	254	4	846	104	21	43713.47	43713.47	0.00	30805.30	12908.17	1	1	0
3280	254	1	941	145	47	127119.83	127119.83	0.00	95805.98	31313.85	1	1	0
3281	254	1000	1032	100	15	43457.02	0.00	43457.02	31638.22	11818.80	1	0	1
3282	254	1000	628	169	16	93508.70	0.00	93508.70	77612.20	15896.50	1	0	1
3283	254	1000	387	219	45	149924.73	0.00	149924.73	104593.65	45331.08	1	0	1
3284	254	3	409	140	20	71692.80	71692.80	0.00	48653.93	23038.87	1	1	0
3285	254	1000	830	57	36	41097.78	0.00	41097.78	33810.26	7287.52	1	0	1
3286	254	1000	369	224	20	9785.36	0.00	9785.36	5969.04	3816.32	1	0	1
3287	254	1	351	162	38	86499.07	86499.07	0.00	59775.51	26723.56	1	1	0
3288	254	1000	1213	35	49	137636.85	0.00	137636.85	117841.48	19795.37	1	0	1
3289	254	1000	794	208	23	93820.51	0.00	93820.51	76066.64	17753.87	1	0	1
3290	254	2	223	44	23	98357.42	98357.42	0.00	85428.84	12928.58	1	1	0
3291	254	2	457	88	47	6110.58	6110.58	0.00	4460.72	1649.86	1	1	0
3292	254	1	1217	155	5	23859.93	23859.93	0.00	18854.73	5005.20	1	1	0
3293	254	2	569	67	12	47868.57	47868.57	0.00	35292.34	12576.23	1	1	0
3294	254	1000	179	169	15	129539.00	0.00	129539.00	110509.20	19029.80	1	0	1
3295	254	4	1208	189	7	61373.27	61373.27	0.00	43356.11	18017.16	1	1	0
3296	254	2	833	191	46	130555.30	130555.30	0.00	94307.11	36248.19	1	1	0
3297	254	1000	418	156	42	107279.48	0.00	107279.48	72483.32	34796.16	1	0	1
3298	254	1000	93	104	24	96542.43	0.00	96542.43	80655.14	15887.29	1	0	1
3299	254	1000	1035	180	43	136866.09	0.00	136866.09	90715.24	46150.85	1	0	1
3300	254	2	929	124	19	10516.59	10516.59	0.00	7466.76	3049.83	1	1	0
3301	254	4	499	244	37	75432.36	75432.36	0.00	52241.52	23190.84	1	1	0
3302	254	1000	348	219	5	93118.21	0.00	93118.21	82077.41	11040.80	1	0	1
3303	254	3	1023	119	26	23329.50	23329.50	0.00	20996.58	2332.92	1	1	0
3304	254	2	866	20	22	124385.42	124385.42	0.00	78659.14	45726.28	1	1	0
3305	254	1000	423	174	42	17362.45	0.00	17362.45	12674.62	4687.83	1	0	1
3306	254	1000	744	224	1	165164.80	0.00	165164.80	130396.94	34767.86	1	0	1
3307	254	4	917	203	50	142782.37	142782.37	0.00	105598.60	37183.77	1	1	0
3308	254	2	976	72	5	140730.75	140730.75	0.00	117327.75	23403.00	1	1	0
3309	254	1000	59	66	46	22893.80	0.00	22893.80	15205.30	7688.50	1	0	1
3310	254	2	1123	65	18	152716.17	152716.17	0.00	106565.87	46150.30	1	1	0
3311	254	1000	27	4	26	133565.82	0.00	133565.82	104357.36	29208.46	1	0	1
3312	254	3	902	150	29	164784.08	164784.08	0.00	123243.93	41540.15	1	1	0
3313	254	1000	796	23	37	122625.38	0.00	122625.38	93198.51	29426.87	1	0	1
3314	254	1000	651	95	41	191154.63	0.00	191154.63	147022.49	44132.14	1	0	1
3315	254	2	149	233	29	4605.03	4605.03	0.00	2809.08	1795.95	1	1	0
3316	254	2	266	243	7	110489.34	110489.34	0.00	88057.07	22432.27	1	1	0
3317	254	1000	755	60	40	114307.57	0.00	114307.57	81025.13	33282.44	1	0	1
3318	254	1000	375	228	37	236944.22	0.00	236944.22	195679.97	41264.25	1	0	1
3319	254	4	408	120	44	105085.95	105085.95	0.00	77720.21	27365.74	1	1	0
3320	254	3	872	48	38	7801.66	7801.66	0.00	6553.39	1248.27	1	1	0
3321	254	1000	1296	24	2	33933.55	0.00	33933.55	24818.78	9114.77	1	0	1
3322	254	1000	307	158	6	202136.35	0.00	202136.35	155671.30	46465.05	1	0	1
3323	254	3	811	230	19	59820.12	59820.12	0.00	42472.26	17347.86	1	1	0
3324	254	1000	191	62	11	144664.61	0.00	144664.61	107351.06	37313.55	1	0	1
3325	254	1000	158	192	45	63336.78	0.00	63336.78	52503.26	10833.52	1	0	1
3326	254	1000	361	41	12	152684.59	0.00	152684.59	103372.85	49311.74	1	0	1
3327	254	4	850	177	24	53635.41	53635.41	0.00	37624.99	16010.42	1	1	0
3328	254	1	811	170	45	103564.32	103564.32	0.00	76386.40	27177.92	1	1	0
3329	254	1000	1206	193	20	100864.09	0.00	100864.09	80078.12	20785.97	1	0	1
3330	254	1000	29	46	2	100264.58	0.00	100264.58	68304.80	31959.78	1	0	1
3331	254	1000	452	181	6	74237.00	0.00	74237.00	56206.75	18030.25	1	0	1
3332	254	2	1042	219	38	145602.79	145602.79	0.00	101576.83	44025.96	1	1	0
3333	254	3	206	243	5	117913.52	117913.52	0.00	81630.24	36283.28	1	1	0
3334	254	1000	6	195	33	151800.65	0.00	151800.65	119724.70	32075.95	1	0	1
3335	254	2	759	163	27	94968.51	94968.51	0.00	80616.83	14351.68	1	1	0
3336	254	4	1275	134	45	70686.82	70686.82	0.00	53878.17	16808.65	1	1	0
3337	254	1000	229	47	14	61884.20	0.00	61884.20	53220.40	8663.80	1	0	1
3338	254	1000	231	123	43	122306.78	0.00	122306.78	81706.39	40600.39	1	0	1
3339	254	1	1281	174	23	58438.07	58438.07	0.00	43099.04	15339.03	1	1	0
3340	254	1000	816	196	24	156877.88	0.00	156877.88	126086.61	30791.27	1	0	1
3341	254	2	255	148	43	29351.56	29351.56	0.00	19623.52	9728.04	1	1	0
3342	254	1000	35	182	20	33263.03	0.00	33263.03	24235.44	9027.59	1	0	1
3343	254	1	1082	234	25	105325.35	105325.35	0.00	70199.58	35125.77	1	1	0
3344	254	3	309	90	23	49038.69	49038.69	0.00	34568.75	14469.94	1	1	0
3345	254	1000	764	102	11	148210.75	0.00	148210.75	105964.63	42246.12	1	0	1
3346	254	3	994	22	44	165906.90	165906.90	0.00	127357.91	38548.99	1	1	0
3347	254	1000	1002	81	25	19280.73	0.00	19280.73	15773.21	3507.52	1	0	1
3348	254	1000	602	20	28	95428.92	0.00	95428.92	67373.14	28055.78	1	0	1
3349	254	4	1053	94	24	202671.06	202671.06	0.00	152443.22	50227.84	1	1	0
3350	254	3	781	71	13	60257.42	60257.42	0.00	50492.05	9765.37	1	1	0
3351	254	1000	646	79	26	132124.30	0.00	132124.30	106665.54	25458.76	1	0	1
3352	254	1000	1245	48	16	116055.91	0.00	116055.91	79573.01	36482.90	1	0	1
3353	254	1000	1246	117	43	36806.52	0.00	36806.52	27972.96	8833.56	1	0	1
3354	254	4	442	222	3	74046.66	74046.66	0.00	51497.28	22549.38	1	1	0
3355	254	2	744	145	46	141299.68	141299.68	0.00	101944.86	39354.82	1	1	0
3356	254	3	314	3	17	73185.48	73185.48	0.00	51983.31	21202.17	1	1	0
3357	254	1000	920	167	29	1023.34	0.00	1023.34	624.24	399.10	1	0	1
3358	254	4	752	227	11	166024.15	166024.15	0.00	120572.58	45451.57	1	1	0
3359	254	1000	884	157	18	79185.56	0.00	79185.56	59041.60	20143.96	1	0	1
3360	254	1000	1229	188	28	80972.63	0.00	80972.63	56285.26	24687.37	1	0	1
3361	254	3	459	242	29	57947.66	57947.66	0.00	42812.43	15135.23	1	1	0
3362	254	1000	191	30	49	21172.10	0.00	21172.10	14397.05	6775.05	1	0	1
3363	254	4	849	32	35	107588.61	107588.61	0.00	80899.19	26689.42	1	1	0
3364	254	1000	872	224	20	35881.56	0.00	35881.56	26193.54	9688.02	1	0	1
3365	254	1000	646	66	29	105986.71	0.00	105986.71	77543.23	28443.48	1	0	1
3366	254	1000	924	195	34	92953.54	0.00	92953.54	78838.52	14115.02	1	0	1
3367	254	1000	1107	74	1	179270.85	0.00	179270.85	124392.98	54877.87	1	0	1
3368	254	1000	614	242	30	130211.49	0.00	130211.49	94464.63	35746.86	1	0	1
3369	254	2	1249	111	48	121392.79	121392.79	0.00	84572.51	36820.28	1	1	0
3370	254	1000	779	250	6	33649.63	0.00	33649.63	26974.97	6674.66	1	0	1
3371	254	1000	182	176	15	233505.08	0.00	233505.08	177336.09	56168.99	1	0	1
3372	254	1000	234	85	43	40637.61	0.00	40637.61	29693.84	10943.77	1	0	1
3373	254	1	644	199	9	64619.49	64619.49	0.00	55633.31	8986.18	1	1	0
3374	254	1000	283	46	37	69205.30	0.00	69205.30	55913.01	13292.29	1	0	1
3375	254	4	27	54	3	102562.45	102562.45	0.00	78555.41	24007.04	1	1	0
3376	254	2	465	142	10	142586.47	142586.47	0.00	117569.87	25016.60	1	1	0
3377	254	2	872	249	43	42731.46	42731.46	0.00	29912.04	12819.42	1	1	0
3378	254	1	834	231	50	68043.01	68043.01	0.00	43605.83	24437.18	1	1	0
3379	254	1000	1165	213	25	50471.93	0.00	50471.93	34532.81	15939.12	1	0	1
3380	254	4	479	125	25	35347.60	35347.60	0.00	25096.81	10250.79	1	1	0
3381	254	1000	459	126	34	71136.72	0.00	71136.72	45326.60	25810.12	1	0	1
3382	254	2	466	121	37	100757.19	100757.19	0.00	74914.79	25842.40	1	1	0
3383	254	1	359	46	5	181492.72	181492.72	0.00	128640.28	52852.44	1	1	0
3384	254	1000	891	247	50	89208.61	0.00	89208.61	74841.67	14366.94	1	0	1
3385	254	1000	419	129	6	48239.07	0.00	48239.07	33313.00	14926.07	1	0	1
3386	254	2	815	13	29	237827.10	237827.10	0.00	198530.42	39296.68	1	1	0
3387	254	1000	320	82	15	144929.77	0.00	144929.77	108727.52	36202.25	1	0	1
3388	254	1000	934	1	4	143696.23	0.00	143696.23	114248.98	29447.25	1	0	1
3389	254	1	1247	21	24	11305.00	11305.00	0.00	7009.12	4295.88	1	1	0
3390	254	1000	1007	116	4	121665.91	0.00	121665.91	102862.21	18803.70	1	0	1
3391	254	1	1098	149	20	142956.79	142956.79	0.00	106946.15	36010.64	1	1	0
3392	254	1000	918	167	50	81136.51	0.00	81136.51	67069.08	14067.43	1	0	1
3393	254	1	442	55	17	134077.76	134077.76	0.00	105350.97	28726.79	1	1	0
3394	254	4	824	211	39	183938.04	183938.04	0.00	144325.29	39612.75	1	1	0
3395	254	1000	61	203	48	62602.98	0.00	62602.98	55177.45	7425.53	1	0	1
3396	254	1000	653	139	29	155166.13	0.00	155166.13	111343.16	43822.97	1	0	1
3397	254	3	1145	12	14	151948.18	151948.18	0.00	99125.20	52822.98	1	1	0
3398	254	3	386	198	47	2577.70	2577.70	0.00	2036.40	541.30	1	1	0
3399	254	3	1000	131	30	161086.66	161086.66	0.00	128462.25	32624.41	1	1	0
3400	254	1	797	83	42	157089.75	157089.75	0.00	119385.66	37704.09	1	1	0
3401	254	1000	1071	69	49	198424.32	0.00	198424.32	156944.60	41479.72	1	0	1
3402	254	1000	601	215	7	21652.11	0.00	21652.11	15862.05	5790.06	1	0	1
3403	254	1	100	156	6	85083.84	85083.84	0.00	62371.00	22712.84	1	1	0
3404	254	1000	396	50	1	125902.63	0.00	125902.63	100988.52	24914.11	1	0	1
3405	254	1000	429	90	44	123620.93	0.00	123620.93	88130.44	35490.49	1	0	1
3406	254	1000	1075	127	16	135522.67	0.00	135522.67	92747.26	42775.41	1	0	1
3407	254	1	229	55	34	162436.10	162436.10	0.00	122717.68	39718.42	1	1	0
3408	254	2	276	205	39	75829.90	75829.90	0.00	51548.36	24281.54	1	1	0
3409	254	1000	633	96	41	25840.90	0.00	25840.90	17313.40	8527.50	1	0	1
3410	254	1000	1005	209	43	53063.11	0.00	53063.11	39244.37	13818.74	1	0	1
3411	254	1000	520	23	22	38428.59	0.00	38428.59	29901.71	8526.88	1	0	1
3412	254	2	13	207	15	14737.70	14737.70	0.00	10758.50	3979.20	1	1	0
3413	254	4	1130	89	22	80559.84	80559.84	0.00	62988.24	17571.60	1	1	0
3414	254	2	247	55	28	148981.50	148981.50	0.00	117425.27	31556.23	1	1	0
3415	254	1000	100	85	47	137054.77	0.00	137054.77	107210.98	29843.79	1	0	1
3416	254	4	848	49	43	96261.90	96261.90	0.00	72823.34	23438.56	1	1	0
3417	254	1000	666	89	8	102055.35	0.00	102055.35	89142.47	12912.88	1	0	1
3418	254	1000	499	211	17	152272.94	0.00	152272.94	108820.32	43452.62	1	0	1
3419	254	1000	49	64	10	135372.09	0.00	135372.09	100117.56	35254.53	1	0	1
3420	254	1000	189	228	8	159315.66	0.00	159315.66	115575.91	43739.75	1	0	1
3421	254	1	1097	119	3	216366.72	216366.72	0.00	166640.26	49726.46	1	1	0
3422	254	1000	634	220	21	85641.77	0.00	85641.77	67485.62	18156.15	1	0	1
3423	254	3	500	108	24	59235.46	59235.46	0.00	50996.14	8239.32	1	1	0
3424	254	4	878	191	50	96569.00	96569.00	0.00	80152.30	16416.70	1	1	0
3425	254	2	1154	147	34	54031.34	54031.34	0.00	38390.69	15640.65	1	1	0
3426	254	1000	478	128	16	115979.79	0.00	115979.79	90388.37	25591.42	1	0	1
3427	254	2	495	149	12	150329.80	150329.80	0.00	114450.00	35879.80	1	1	0
3428	254	1	687	203	39	170103.97	170103.97	0.00	129672.12	40431.85	1	1	0
3429	254	1	54	247	47	67960.92	67960.92	0.00	46318.72	21642.20	1	1	0
3430	254	1	518	168	18	105421.89	105421.89	0.00	77258.58	28163.31	1	1	0
3431	254	1000	962	228	29	48639.08	0.00	48639.08	35858.20	12780.88	1	0	1
3432	254	1000	492	115	47	31780.21	0.00	31780.21	21610.54	10169.67	1	0	1
3433	254	1000	468	103	39	5651.10	0.00	5651.10	4859.96	791.14	1	0	1
3434	254	2	283	238	45	79601.87	79601.87	0.00	66216.26	13385.61	1	1	0
3435	254	1000	879	184	21	25605.18	0.00	25605.18	20228.10	5377.08	1	0	1
3436	254	2	1190	228	6	116534.58	116534.58	0.00	89085.76	27448.82	1	1	0
3437	254	4	1096	252	2	59549.04	59549.04	0.00	45786.38	13762.66	1	1	0
3438	254	3	674	221	16	29563.21	29563.21	0.00	18574.27	10988.94	1	1	0
3439	254	4	1069	109	5	17435.40	17435.40	0.00	10984.32	6451.08	1	1	0
3440	254	4	1230	55	7	138469.31	138469.31	0.00	111531.60	26937.71	1	1	0
3441	254	1000	287	176	24	141213.30	0.00	141213.30	92160.45	49052.85	1	0	1
3442	254	1000	374	166	26	7214.48	0.00	7214.48	5771.58	1442.90	1	0	1
3443	254	1000	990	66	21	60314.17	0.00	60314.17	52927.98	7386.19	1	0	1
3444	254	2	1021	97	16	27394.15	27394.15	0.00	19883.86	7510.29	1	1	0
3445	254	3	145	35	45	20898.70	20898.70	0.00	15883.00	5015.70	1	1	0
3446	254	4	976	216	46	113317.31	113317.31	0.00	76956.87	36360.44	1	1	0
3447	254	2	481	153	32	139673.34	139673.34	0.00	117428.81	22244.53	1	1	0
3448	254	2	141	26	40	126473.61	126473.61	0.00	98246.31	28227.30	1	1	0
3449	254	1000	1022	188	47	79712.14	0.00	79712.14	59510.85	20201.29	1	0	1
3450	254	1000	538	153	9	55320.45	0.00	55320.45	37300.92	18019.53	1	0	1
3451	254	2	168	146	30	83966.30	83966.30	0.00	50379.80	33586.50	1	1	0
3452	254	1000	85	207	26	189180.22	0.00	189180.22	128776.83	60403.39	1	0	1
3453	254	1000	1013	23	1	101281.34	0.00	101281.34	67501.26	33780.08	1	0	1
3454	254	1	1196	22	10	103608.21	103608.21	0.00	82434.36	21173.85	1	1	0
3455	254	2	846	181	25	7482.12	7482.12	0.00	5536.74	1945.38	1	1	0
3456	254	1000	727	160	12	95360.46	0.00	95360.46	68485.37	26875.09	1	0	1
3457	254	4	50	185	14	123275.17	123275.17	0.00	99273.79	24001.38	1	1	0
3458	254	1000	1297	64	12	4384.16	0.00	4384.16	3551.20	832.96	1	0	1
3459	254	1000	165	55	33	148779.47	0.00	148779.47	114923.96	33855.51	1	0	1
3460	254	1000	164	97	4	43576.02	0.00	43576.02	38233.50	5342.52	1	0	1
3461	254	1000	820	118	37	246732.71	0.00	246732.71	174385.58	72347.13	1	0	1
3462	254	4	21	190	37	99783.80	99783.80	0.00	66719.54	33064.26	1	1	0
3463	254	1000	948	118	47	47455.27	0.00	47455.27	30757.42	16697.85	1	0	1
3464	254	1000	820	123	50	154805.31	0.00	154805.31	104692.49	50112.82	1	0	1
3465	254	1000	877	181	26	126713.39	0.00	126713.39	83680.58	43032.81	1	0	1
3466	254	2	72	58	16	44348.04	44348.04	0.00	39469.74	4878.30	1	1	0
3467	254	1	86	11	42	26511.73	26511.73	0.00	18823.35	7688.38	1	1	0
3468	254	1000	208	23	17	119616.38	0.00	119616.38	94545.96	25070.42	1	0	1
3469	254	1000	643	229	46	109121.16	0.00	109121.16	76781.20	32339.96	1	0	1
3470	254	1000	757	157	14	74704.16	0.00	74704.16	52292.88	22411.28	1	0	1
3471	254	1000	688	145	47	46205.36	0.00	46205.36	32391.05	13814.31	1	0	1
3472	254	4	895	203	18	171664.65	171664.65	0.00	126166.27	45498.38	1	1	0
3473	254	1000	950	216	32	56536.97	0.00	56536.97	41190.48	15346.49	1	0	1
3474	254	1000	1022	180	20	56363.62	0.00	56363.62	38714.62	17649.00	1	0	1
3475	254	1	386	11	31	91318.80	91318.80	0.00	62096.82	29221.98	1	1	0
3476	254	1000	1270	231	22	68200.76	0.00	68200.76	53492.14	14708.62	1	0	1
3477	254	2	892	84	46	58301.93	58301.93	0.00	40469.61	17832.32	1	1	0
3478	254	2	988	50	39	24808.68	24808.68	0.00	19324.53	5484.15	1	1	0
3479	254	2	1089	218	12	77690.00	77690.00	0.00	60692.80	16997.20	1	1	0
3480	254	1000	410	188	38	4974.26	0.00	4974.26	3581.46	1392.80	1	0	1
3481	254	3	905	34	31	15447.58	15447.58	0.00	12487.82	2959.76	1	1	0
3482	254	1000	1064	11	5	133799.82	0.00	133799.82	104264.60	29535.22	1	0	1
3483	254	4	981	52	44	111464.08	111464.08	0.00	84962.14	26501.94	1	1	0
3484	254	4	1009	136	36	57711.87	57711.87	0.00	36935.64	20776.23	1	1	0
3485	254	1000	753	231	19	115292.35	0.00	115292.35	89215.06	26077.29	1	0	1
3486	254	1000	522	189	25	3524.51	0.00	3524.51	2255.69	1268.82	1	0	1
3487	254	1	382	248	20	137447.59	137447.59	0.00	100923.80	36523.79	1	1	0
3488	254	1000	659	178	30	121434.87	0.00	121434.87	102484.95	18949.92	1	0	1
3489	254	3	265	74	28	186721.12	186721.12	0.00	138852.80	47868.32	1	1	0
3490	254	1	188	76	11	30107.64	30107.64	0.00	20473.20	9634.44	1	1	0
3491	254	1000	932	9	38	82961.32	0.00	82961.32	60812.04	22149.28	1	0	1
3492	254	1	973	101	8	149714.70	149714.70	0.00	111887.80	37826.90	1	1	0
3493	254	2	1126	84	34	100322.49	100322.49	0.00	77088.83	23233.66	1	1	0
3494	254	1000	282	126	30	58232.10	0.00	58232.10	39537.97	18694.13	1	0	1
3495	254	1000	1038	13	3	108320.74	0.00	108320.74	80933.76	27386.98	1	0	1
3496	254	1000	599	168	23	115380.88	0.00	115380.88	97171.17	18209.71	1	0	1
3497	254	1000	533	153	48	68248.10	0.00	68248.10	53233.50	15014.60	1	0	1
3498	254	2	351	174	27	176686.91	176686.91	0.00	140428.16	36258.75	1	1	0
3499	254	2	403	241	37	436.32	436.32	0.00	305.42	130.90	1	1	0
3500	254	4	427	139	28	46879.90	46879.90	0.00	35478.08	11401.82	1	1	0
3501	254	1000	1261	216	45	108450.36	0.00	108450.36	91276.05	17174.31	1	0	1
3502	254	1	1080	195	18	110815.60	110815.60	0.00	73128.09	37687.51	1	1	0
3503	254	1000	156	14	11	243130.47	0.00	243130.47	192056.90	51073.57	1	0	1
3504	254	4	500	217	27	52558.99	52558.99	0.00	35381.19	17177.80	1	1	0
3505	254	1	1132	34	28	28692.78	28692.78	0.00	21033.24	7659.54	1	1	0
3506	254	4	176	91	27	53346.34	53346.34	0.00	35376.78	17969.56	1	1	0
3507	254	1000	1009	183	20	148684.39	0.00	148684.39	119616.04	29068.35	1	0	1
3508	254	1000	391	220	31	153310.85	0.00	153310.85	111241.60	42069.25	1	0	1
3509	254	1000	348	174	18	162056.86	0.00	162056.86	123305.12	38751.74	1	0	1
3510	254	1000	177	220	36	133980.99	0.00	133980.99	95683.58	38297.41	1	0	1
3511	254	3	1148	18	44	88808.69	88808.69	0.00	67457.37	21351.32	1	1	0
3512	254	2	102	33	50	154369.62	154369.62	0.00	112425.42	41944.20	1	1	0
3513	254	1000	635	90	38	120374.07	0.00	120374.07	92034.84	28339.23	1	0	1
3514	254	1000	1245	54	44	146642.99	0.00	146642.99	118557.13	28085.86	1	0	1
3515	254	1000	1152	136	3	18549.35	0.00	18549.35	13771.95	4777.40	1	0	1
3516	254	1000	889	114	6	106092.38	0.00	106092.38	74037.76	32054.62	1	0	1
3517	254	3	1191	124	37	98540.50	98540.50	0.00	77665.01	20875.49	1	1	0
3518	254	3	973	214	32	75302.28	75302.28	0.00	58737.22	16565.06	1	1	0
3519	254	1000	85	14	8	9936.92	0.00	9936.92	6359.63	3577.29	1	0	1
3520	254	4	1192	142	19	115447.81	115447.81	0.00	92195.96	23251.85	1	1	0
3521	254	3	110	241	48	154318.42	154318.42	0.00	107486.15	46832.27	1	1	0
3522	254	1000	908	54	7	64068.02	0.00	64068.02	52417.64	11650.38	1	0	1
3523	254	2	1115	109	27	233318.18	233318.18	0.00	145308.16	88010.02	1	1	0
3524	254	4	1199	190	20	28478.20	28478.20	0.00	21643.44	6834.76	1	1	0
3525	254	1000	652	126	43	104926.72	0.00	104926.72	68546.21	36380.51	1	0	1
3526	254	3	475	173	1	196692.80	196692.80	0.00	147596.07	49096.73	1	1	0
3527	254	4	605	158	6	80983.69	80983.69	0.00	58868.39	22115.30	1	1	0
3528	254	1000	715	73	10	140287.96	0.00	140287.96	104114.59	36173.37	1	0	1
3529	254	2	346	250	36	4628.67	4628.67	0.00	3147.50	1481.17	1	1	0
3530	254	1000	434	223	2	34960.32	0.00	34960.32	21325.77	13634.55	1	0	1
3531	254	4	1045	28	20	72833.19	72833.19	0.00	59393.93	13439.26	1	1	0
3532	254	1000	444	87	24	6542.00	0.00	6542.00	5299.02	1242.98	1	0	1
3533	254	1	1294	133	31	124168.21	124168.21	0.00	95400.36	28767.85	1	1	0
3534	254	1000	837	104	10	36521.43	0.00	36521.43	27483.91	9037.52	1	0	1
3535	254	1000	430	9	22	20697.81	0.00	20697.81	16765.21	3932.60	1	0	1
3536	254	1000	170	51	9	147219.02	0.00	147219.02	99238.55	47980.47	1	0	1
3537	254	1000	953	120	2	36093.30	0.00	36093.30	28894.74	7198.56	1	0	1
3538	254	1	265	118	1	192197.54	192197.54	0.00	142633.48	49564.06	1	1	0
3539	254	3	894	77	27	66191.34	66191.34	0.00	53412.21	12779.13	1	1	0
3540	254	1000	615	126	32	13005.09	0.00	13005.09	8063.16	4941.93	1	0	1
3541	254	1000	940	132	47	79141.45	0.00	79141.45	61295.31	17846.14	1	0	1
3542	254	4	990	122	30	72536.44	72536.44	0.00	49466.08	23070.36	1	1	0
3543	254	1000	899	203	22	91415.98	0.00	91415.98	73819.85	17596.13	1	0	1
3544	254	2	1	12	44	104079.87	104079.87	0.00	73483.46	30596.41	1	1	0
3545	254	1000	1270	176	37	41685.42	0.00	41685.42	32618.75	9066.67	1	0	1
3546	254	1000	665	119	4	201099.81	0.00	201099.81	153935.74	47164.07	1	0	1
3547	254	1000	657	165	7	23017.28	0.00	23017.28	14040.56	8976.72	1	0	1
3548	254	4	1278	234	50	163463.17	163463.17	0.00	123208.12	40255.05	1	1	0
3549	254	1000	315	183	48	54812.88	0.00	54812.88	41090.20	13722.68	1	0	1
3550	254	1	1255	151	18	149486.42	149486.42	0.00	108314.59	41171.83	1	1	0
3551	254	3	269	72	28	64288.55	64288.55	0.00	47626.38	16662.17	1	1	0
3552	254	1000	30	252	43	143783.45	0.00	143783.45	108699.21	35084.24	1	0	1
3553	254	2	602	137	30	59070.33	59070.33	0.00	44011.38	15058.95	1	1	0
3554	254	1	1133	115	48	51740.95	51740.95	0.00	40357.95	11383.00	1	1	0
3555	254	1000	898	30	47	7693.80	0.00	7693.80	5308.72	2385.08	1	0	1
3556	254	3	309	147	7	51770.19	51770.19	0.00	43496.26	8273.93	1	1	0
3557	254	1000	563	15	48	60958.02	0.00	60958.02	46433.49	14524.53	1	0	1
3558	254	4	731	63	46	185332.31	185332.31	0.00	132796.50	52535.81	1	1	0
3559	254	2	301	54	37	39641.04	39641.04	0.00	34884.08	4756.96	1	1	0
3560	254	1000	1040	121	33	63754.28	0.00	63754.28	45837.49	17916.79	1	0	1
3561	254	3	665	233	22	142904.17	142904.17	0.00	92521.71	50382.46	1	1	0
3562	254	1000	1103	215	3	100818.68	0.00	100818.68	67775.42	33043.26	1	0	1
3563	254	1000	199	146	47	239995.17	0.00	239995.17	195236.29	44758.88	1	0	1
3564	254	1000	297	103	7	45709.50	0.00	45709.50	32089.17	13620.33	1	0	1
3565	254	1	711	15	49	215106.93	215106.93	0.00	166630.98	48475.95	1	1	0
3566	254	3	412	196	40	272267.28	272267.28	0.00	222431.83	49835.45	1	1	0
3567	254	4	192	172	50	27733.50	27733.50	0.00	19162.26	8571.24	1	1	0
3568	254	2	358	201	9	52470.06	52470.06	0.00	36777.65	15692.41	1	1	0
3569	254	4	1152	105	37	21208.27	21208.27	0.00	14130.57	7077.70	1	1	0
3570	254	2	548	209	47	222555.40	222555.40	0.00	160903.48	61651.92	1	1	0
3571	254	3	304	30	42	22826.04	22826.04	0.00	14836.92	7989.12	1	1	0
3572	254	1	607	47	34	80601.13	80601.13	0.00	55862.22	24738.91	1	1	0
3573	254	1000	883	136	11	120909.74	0.00	120909.74	84200.37	36709.37	1	0	1
3574	254	1000	1182	226	1	12174.30	0.00	12174.30	8035.02	4139.28	1	0	1
3575	254	1000	515	3	6	70234.58	0.00	70234.58	59610.52	10624.06	1	0	1
3576	254	1000	330	226	15	60420.84	0.00	60420.84	51033.73	9387.11	1	0	1
3577	254	1000	292	3	50	77239.04	0.00	77239.04	47149.64	30089.40	1	0	1
3578	254	3	650	9	12	61415.20	61415.20	0.00	39107.02	22308.18	1	1	0
3579	254	4	842	130	19	112545.45	112545.45	0.00	72392.50	40152.95	1	1	0
3580	254	3	1192	132	15	115890.68	115890.68	0.00	95030.32	20860.36	1	1	0
3581	254	1000	1025	103	49	226840.73	0.00	226840.73	172139.95	54700.78	1	0	1
3582	254	1000	636	71	7	117126.37	0.00	117126.37	82453.62	34672.75	1	0	1
3583	254	1000	1233	235	4	105190.64	0.00	105190.64	69167.54	36023.10	1	0	1
3584	254	3	689	185	8	230784.43	230784.43	0.00	164044.12	66740.31	1	1	0
3585	254	1000	1142	245	38	2075.34	0.00	2075.34	1701.78	373.56	1	0	1
3586	254	4	1068	72	10	103727.75	103727.75	0.00	69483.76	34243.99	1	1	0
3587	254	4	1145	150	28	64303.12	64303.12	0.00	50156.40	14146.72	1	1	0
3588	254	1000	984	170	7	25956.11	0.00	25956.11	21284.00	4672.11	1	0	1
3589	254	1000	187	123	26	141118.22	0.00	141118.22	108107.79	33010.43	1	0	1
3590	254	1000	471	78	10	107694.54	0.00	107694.54	85331.04	22363.50	1	0	1
3591	254	1000	240	187	41	31663.82	0.00	31663.82	23839.88	7823.94	1	0	1
3592	254	4	105	125	39	160088.35	160088.35	0.00	109847.44	50240.91	1	1	0
3593	254	1	277	92	46	139676.03	139676.03	0.00	97682.35	41993.68	1	1	0
3594	254	1000	63	56	20	78325.92	0.00	78325.92	55856.55	22469.37	1	0	1
3595	254	3	1011	125	47	35725.44	35725.44	0.00	25722.32	10003.12	1	1	0
3596	254	1000	1161	219	50	72400.51	0.00	72400.51	58512.44	13888.07	1	0	1
3597	254	2	1245	217	30	4606.70	4606.70	0.00	2902.22	1704.48	1	1	0
3598	254	1000	207	42	19	16804.20	0.00	16804.20	13107.30	3696.90	1	0	1
3599	254	1000	445	104	35	205061.46	0.00	205061.46	145816.96	59244.50	1	0	1
3600	254	3	1056	114	21	116359.19	116359.19	0.00	81904.89	34454.30	1	1	0
3601	254	2	1090	10	50	51235.59	51235.59	0.00	36889.65	14345.94	1	1	0
3602	254	1	618	191	19	82047.84	82047.84	0.00	57109.60	24938.24	1	1	0
3603	254	4	641	248	13	111699.65	111699.65	0.00	80846.29	30853.36	1	1	0
3604	254	3	1050	217	43	104255.67	104255.67	0.00	82787.12	21468.55	1	1	0
3605	254	2	1271	114	50	19371.41	19371.41	0.00	15223.39	4148.02	1	1	0
3606	254	1000	226	163	38	29690.36	0.00	29690.36	17814.23	11876.13	1	0	1
3607	254	1000	174	203	11	82898.48	0.00	82898.48	65520.61	17377.87	1	0	1
3608	254	1000	330	32	12	191261.47	0.00	191261.47	159720.21	31541.26	1	0	1
3609	254	3	168	16	18	53127.68	53127.68	0.00	35279.38	17848.30	1	1	0
3610	254	1	87	21	6	143936.46	143936.46	0.00	106011.29	37925.17	1	1	0
3611	254	2	723	172	4	92845.80	92845.80	0.00	68596.28	24249.52	1	1	0
3612	254	1	1156	132	22	71629.58	71629.58	0.00	62262.52	9367.06	1	1	0
3613	254	1	112	107	26	57619.29	57619.29	0.00	45574.60	12044.69	1	1	0
3614	254	1000	457	63	20	175387.60	0.00	175387.60	130142.52	45245.08	1	0	1
3615	254	1000	546	52	3	52090.21	0.00	52090.21	45378.04	6712.17	1	0	1
3616	254	2	403	152	19	17740.95	17740.95	0.00	13837.95	3903.00	1	1	0
3617	254	1000	897	60	46	88125.54	0.00	88125.54	69379.05	18746.49	1	0	1
3618	254	1000	1112	242	13	126342.57	0.00	126342.57	93593.55	32749.02	1	0	1
3619	254	4	161	53	47	81361.50	81361.50	0.00	62504.96	18856.54	1	1	0
3620	254	1	729	232	48	160273.68	160273.68	0.00	113127.25	47146.43	1	1	0
3621	254	2	1117	175	10	46185.50	46185.50	0.00	32703.18	13482.32	1	1	0
3622	254	3	591	232	25	130942.55	130942.55	0.00	98756.50	32186.05	1	1	0
3623	254	1000	573	33	13	214623.68	0.00	214623.68	169172.56	45451.12	1	0	1
3624	254	1	362	233	43	138722.76	138722.76	0.00	108624.94	30097.82	1	1	0
3625	254	1	200	44	12	105556.20	105556.20	0.00	83179.99	22376.21	1	1	0
3626	254	4	663	81	46	68828.00	68828.00	0.00	49265.20	19562.80	1	1	0
3627	254	1000	608	11	30	32828.80	0.00	32828.80	22630.62	10198.18	1	0	1
3628	254	1000	733	244	14	95741.07	0.00	95741.07	70045.95	25695.12	1	0	1
3629	254	4	922	233	15	100239.27	100239.27	0.00	71814.84	28424.43	1	1	0
3630	254	1000	881	51	5	2756.80	0.00	2756.80	2205.44	551.36	1	0	1
3631	254	3	409	174	9	46583.92	46583.92	0.00	36335.44	10248.48	1	1	0
3632	254	1000	1037	233	5	54439.65	0.00	54439.65	43154.41	11285.24	1	0	1
3633	254	1000	425	75	33	11250.84	0.00	11250.84	8663.16	2587.68	1	0	1
3634	254	4	522	241	24	112906.28	112906.28	0.00	80482.58	32423.70	1	1	0
3635	254	1000	893	32	26	158628.20	0.00	158628.20	127521.25	31106.95	1	0	1
3636	254	2	1276	23	28	79831.50	79831.50	0.00	61943.38	17888.12	1	1	0
3637	254	1000	319	160	32	98511.99	0.00	98511.99	75320.85	23191.14	1	0	1
3638	254	4	417	57	1	81520.11	81520.11	0.00	62770.50	18749.61	1	1	0
3639	254	3	1199	160	43	10803.06	10803.06	0.00	7454.12	3348.94	1	1	0
3640	254	2	853	53	39	162637.43	162637.43	0.00	119313.94	43323.49	1	1	0
3641	254	1000	1149	39	45	45712.15	0.00	45712.15	32316.35	13395.80	1	0	1
3642	254	1	680	151	38	106691.95	106691.95	0.00	78349.83	28342.12	1	1	0
3643	254	4	514	244	35	80390.60	80390.60	0.00	58714.50	21676.10	1	1	0
3644	254	1000	460	224	44	21369.00	0.00	21369.00	15813.04	5555.96	1	0	1
3645	254	1	1010	161	1	144972.39	144972.39	0.00	101944.28	43028.11	1	1	0
3646	254	1	313	134	14	116233.16	116233.16	0.00	79956.17	36276.99	1	1	0
3647	254	3	1248	147	31	39696.00	39696.00	0.00	25405.44	14290.56	1	1	0
3648	254	3	343	216	2	166695.76	166695.76	0.00	135853.82	30841.94	1	1	0
3649	254	2	23	77	42	148.05	148.05	0.00	115.50	32.55	1	1	0
3650	254	2	529	241	27	100190.35	100190.35	0.00	83104.17	17086.18	1	1	0
3651	254	1000	33	30	9	50353.61	0.00	50353.61	35548.22	14805.39	1	0	1
3652	254	1	134	123	10	149759.46	149759.46	0.00	100654.98	49104.48	1	1	0
3653	254	1000	1084	187	45	205756.94	0.00	205756.94	157614.97	48141.97	1	0	1
3654	254	1	4	205	47	5222.25	5222.25	0.00	3446.67	1775.58	1	1	0
3655	254	1000	1278	180	14	112618.31	0.00	112618.31	93592.20	19026.11	1	0	1
3656	254	1000	1118	85	7	116696.28	0.00	116696.28	91945.96	24750.32	1	0	1
3657	254	1000	798	169	34	213835.37	0.00	213835.37	165925.50	47909.87	1	0	1
3658	254	1000	485	194	9	55619.46	0.00	55619.46	44932.91	10686.55	1	0	1
3659	254	4	284	119	50	66688.48	66688.48	0.00	42013.76	24674.72	1	1	0
3660	254	1000	314	148	40	146228.08	0.00	146228.08	106809.30	39418.78	1	0	1
3661	254	1000	1289	40	17	83556.96	0.00	83556.96	59478.66	24078.30	1	0	1
3662	254	1000	788	240	49	128385.50	0.00	128385.50	96080.71	32304.79	1	0	1
3663	254	3	1242	57	46	56958.06	56958.06	0.00	37461.31	19496.75	1	1	0
3664	254	3	174	246	31	243374.92	243374.92	0.00	190603.98	52770.94	1	1	0
3665	254	3	461	6	25	136872.99	136872.99	0.00	116149.42	20723.57	1	1	0
3666	254	4	272	32	19	149349.77	149349.77	0.00	118006.51	31343.26	1	1	0
3667	254	1	793	118	10	23482.83	23482.83	0.00	14089.67	9393.16	1	1	0
3668	254	1000	409	65	25	132924.27	0.00	132924.27	92974.72	39949.55	1	0	1
3669	254	1000	1175	142	25	72953.32	0.00	72953.32	55230.34	17722.98	1	0	1
3670	254	2	757	44	49	57357.20	57357.20	0.00	43591.44	13765.76	1	1	0
3671	254	3	1238	47	5	5353.54	5353.54	0.00	4550.51	803.03	1	1	0
3672	254	1000	1056	193	46	100520.98	0.00	100520.98	74385.59	26135.39	1	0	1
3673	254	1000	753	35	3	25611.75	0.00	25611.75	22026.10	3585.65	1	0	1
3674	254	3	1075	222	46	51566.43	51566.43	0.00	45333.69	6232.74	1	1	0
3675	254	1	18	241	24	114886.50	114886.50	0.00	86639.04	28247.46	1	1	0
3676	254	1	546	219	3	95773.70	95773.70	0.00	72069.79	23703.91	1	1	0
3677	254	1	935	36	44	145672.32	145672.32	0.00	106938.33	38733.99	1	1	0
3678	254	4	931	159	21	198635.53	198635.53	0.00	149866.66	48768.87	1	1	0
3679	254	1000	1157	77	34	32982.66	0.00	32982.66	24438.84	8543.82	1	0	1
3680	254	2	889	239	45	184258.63	184258.63	0.00	129710.23	54548.40	1	1	0
3681	254	1000	460	203	45	144199.64	0.00	144199.64	108750.59	35449.05	1	0	1
3682	254	1	820	57	7	138964.83	138964.83	0.00	90987.33	47977.50	1	1	0
3683	254	1	482	62	32	58744.28	58744.28	0.00	44881.50	13862.78	1	1	0
3684	254	4	879	218	38	47638.22	47638.22	0.00	35499.16	12139.06	1	1	0
3685	254	1000	1029	252	35	25639.25	0.00	25639.25	19998.60	5640.65	1	0	1
3686	254	3	681	13	1	210775.98	210775.98	0.00	150495.25	60280.73	1	1	0
3687	254	1	157	190	19	65092.74	65092.74	0.00	46830.22	18262.52	1	1	0
3688	254	2	6	14	3	7580.35	7580.35	0.00	4699.82	2880.53	1	1	0
3689	254	1000	1249	15	16	138882.81	0.00	138882.81	111324.94	27557.87	1	0	1
3690	254	3	191	31	29	50917.60	50917.60	0.00	35919.16	14998.44	1	1	0
3691	254	1	59	241	11	17499.45	17499.45	0.00	12015.96	5483.49	1	1	0
3692	254	1	313	189	23	67617.36	67617.36	0.00	46781.66	20835.70	1	1	0
3693	254	1000	48	59	39	113757.14	0.00	113757.14	94546.66	19210.48	1	0	1
3694	254	1000	1010	118	17	50672.26	0.00	50672.26	39732.66	10939.60	1	0	1
3695	254	1000	773	93	11	81454.24	0.00	81454.24	55515.00	25939.24	1	0	1
3696	254	4	62	216	12	214207.59	214207.59	0.00	163235.30	50972.29	1	1	0
3697	254	2	393	143	12	148217.29	148217.29	0.00	113896.92	34320.37	1	1	0
3698	254	3	172	123	48	92460.90	92460.90	0.00	74433.56	18027.34	1	1	0
3699	254	1000	1187	43	43	113512.91	0.00	113512.91	87786.64	25726.27	1	0	1
3700	254	2	892	203	33	42226.98	42226.98	0.00	29325.54	12901.44	1	1	0
3701	254	3	761	43	47	62818.82	62818.82	0.00	51699.40	11119.42	1	1	0
3702	254	1000	1236	97	26	64935.51	0.00	64935.51	50761.68	14173.83	1	0	1
3703	254	1	100	36	10	70362.05	70362.05	0.00	50914.41	19447.64	1	1	0
3704	254	3	34	243	46	121430.89	121430.89	0.00	96320.17	25110.72	1	1	0
3705	254	1000	1179	131	17	85566.41	0.00	85566.41	54331.74	31234.67	1	0	1
3706	254	1000	1020	6	45	38038.91	0.00	38038.91	28039.15	9999.76	1	0	1
3707	254	1000	202	71	25	132683.08	0.00	132683.08	107575.65	25107.43	1	0	1
3708	254	3	604	242	45	72719.40	72719.40	0.00	59198.40	13521.00	1	1	0
3709	254	3	359	152	9	84636.57	84636.57	0.00	62732.74	21903.83	1	1	0
3710	254	1000	991	181	33	173023.03	0.00	173023.03	129608.96	43414.07	1	0	1
3711	254	2	176	125	31	66322.25	66322.25	0.00	51286.69	15035.56	1	1	0
3712	254	2	121	128	15	67092.29	67092.29	0.00	45863.37	21228.92	1	1	0
3713	254	3	1234	172	22	150603.42	150603.42	0.00	119223.66	31379.76	1	1	0
3714	254	4	381	81	42	45519.00	45519.00	0.00	32191.17	13327.83	1	1	0
3715	254	1000	1223	156	4	94463.72	0.00	94463.72	64610.77	29852.95	1	0	1
3716	254	2	616	47	4	171951.40	171951.40	0.00	111178.28	60773.12	1	1	0
3717	254	4	963	91	13	57953.34	57953.34	0.00	47904.30	10049.04	1	1	0
3718	254	3	958	90	32	18514.68	18514.68	0.00	12590.00	5924.68	1	1	0
3719	254	1000	733	165	5	70344.79	0.00	70344.79	56073.22	14271.57	1	0	1
3720	254	2	874	207	44	178088.77	178088.77	0.00	135621.25	42467.52	1	1	0
3721	254	4	493	15	7	121054.28	121054.28	0.00	76748.37	44305.91	1	1	0
3722	254	1000	1024	52	42	18689.04	0.00	18689.04	12179.36	6509.68	1	0	1
3723	254	2	77	123	39	119406.33	119406.33	0.00	91789.65	27616.68	1	1	0
3724	254	1000	88	20	16	34552.10	0.00	34552.10	24877.50	9674.60	1	0	1
3725	254	3	520	223	11	193239.53	193239.53	0.00	145510.78	47728.75	1	1	0
3726	254	1000	1262	122	50	56727.40	0.00	56727.40	38666.18	18061.22	1	0	1
3727	254	1000	571	170	15	176683.45	0.00	176683.45	147982.61	28700.84	1	0	1
3728	254	3	1206	209	14	64179.39	64179.39	0.00	43966.74	20212.65	1	1	0
3729	254	1000	1274	100	45	87640.37	0.00	87640.37	63369.02	24271.35	1	0	1
3730	254	1000	659	42	26	111215.38	0.00	111215.38	79681.86	31533.52	1	0	1
3731	254	3	1038	233	30	4136.80	4136.80	0.00	3599.04	537.76	1	1	0
3732	254	4	985	130	15	14326.13	14326.13	0.00	9986.91	4339.22	1	1	0
3733	254	1	519	202	10	90548.54	90548.54	0.00	71391.34	19157.20	1	1	0
3734	254	1000	588	84	1	162290.56	0.00	162290.56	115490.22	46800.34	1	0	1
3735	254	1000	765	149	19	22171.38	0.00	22171.38	16138.76	6032.62	1	0	1
3736	254	2	631	202	6	107610.48	107610.48	0.00	73590.29	34020.19	1	1	0
3737	254	2	1227	115	10	76963.65	76963.65	0.00	57931.66	19031.99	1	1	0
3738	254	3	49	215	4	276649.33	276649.33	0.00	220435.43	56213.90	1	1	0
3739	254	1	317	30	16	62839.55	62839.55	0.00	51158.28	11681.27	1	1	0
3740	254	1	862	36	30	104254.81	104254.81	0.00	79026.58	25228.23	1	1	0
3741	254	1000	207	124	2	38619.25	0.00	38619.25	29736.80	8882.45	1	0	1
3742	254	1000	40	54	33	89470.24	0.00	89470.24	69951.06	19519.18	1	0	1
3743	254	1	418	87	48	70261.89	70261.89	0.00	53019.90	17241.99	1	1	0
3744	254	1000	647	113	12	55842.90	0.00	55842.90	45232.74	10610.16	1	0	1
3745	254	2	916	135	42	59289.04	59289.04	0.00	41869.61	17419.43	1	1	0
3746	254	1000	774	181	21	56259.68	0.00	56259.68	37131.36	19128.32	1	0	1
3747	254	3	795	228	15	115222.84	115222.84	0.00	83355.97	31866.87	1	1	0
3748	254	1000	548	79	6	81231.43	0.00	81231.43	56598.67	24632.76	1	0	1
3749	254	1000	548	237	43	26445.83	0.00	26445.83	17725.74	8720.09	1	0	1
3750	254	3	276	202	46	102860.44	102860.44	0.00	77271.54	25588.90	1	1	0
3751	254	1000	356	79	18	5490.16	0.00	5490.16	3952.88	1537.28	1	0	1
3752	254	3	1061	194	36	431.19	431.19	0.00	301.83	129.36	1	1	0
3753	254	1000	89	117	3	50247.38	0.00	50247.38	43019.16	7228.22	1	0	1
3754	254	4	1248	49	38	97802.55	97802.55	0.00	68239.55	29563.00	1	1	0
3755	254	1000	394	18	40	99453.90	0.00	99453.90	64947.96	34505.94	1	0	1
3756	254	4	508	109	11	124821.46	124821.46	0.00	92096.34	32725.12	1	1	0
3757	254	1000	418	91	3	174777.20	0.00	174777.20	137495.97	37281.23	1	0	1
3758	254	2	72	43	31	55604.37	55604.37	0.00	39518.20	16086.17	1	1	0
3759	254	1000	715	239	43	47913.70	0.00	47913.70	33539.60	14374.10	1	0	1
3760	254	1000	141	45	25	86316.30	0.00	86316.30	60135.21	26181.09	1	0	1
3761	254	1	335	156	42	153192.90	153192.90	0.00	104368.29	48824.61	1	1	0
3762	254	3	676	147	43	12442.36	12442.36	0.00	7465.40	4976.96	1	1	0
3763	254	1000	975	30	16	99542.92	0.00	99542.92	74839.23	24703.69	1	0	1
3764	254	1000	906	55	44	214402.39	0.00	214402.39	144364.63	70037.76	1	0	1
3765	254	1000	923	176	47	80497.35	0.00	80497.35	65191.16	15306.19	1	0	1
3766	254	4	604	168	12	27314.49	27314.49	0.00	16661.85	10652.64	1	1	0
3767	254	1000	1119	233	29	83095.40	0.00	83095.40	63751.05	19344.35	1	0	1
3768	254	3	616	192	7	48031.43	48031.43	0.00	35640.96	12390.47	1	1	0
3769	254	1000	1091	147	3	4999.81	0.00	4999.81	3599.86	1399.95	1	0	1
3770	254	1000	737	27	42	72442.72	0.00	72442.72	53877.27	18565.45	1	0	1
3771	254	1	637	105	33	105394.73	105394.73	0.00	84595.47	20799.26	1	1	0
3772	254	1000	389	52	10	17262.96	0.00	17262.96	10530.42	6732.54	1	0	1
3773	254	1000	450	144	39	117074.86	0.00	117074.86	91467.18	25607.68	1	0	1
3774	254	2	717	72	49	77823.02	77823.02	0.00	51692.32	26130.70	1	1	0
3775	254	4	331	95	22	58512.60	58512.60	0.00	45954.48	12558.12	1	1	0
3776	254	1000	644	214	7	33924.87	0.00	33924.87	24984.99	8939.88	1	0	1
3777	254	1000	673	245	24	82010.11	0.00	82010.11	54636.93	27373.18	1	0	1
3778	254	4	208	122	21	48101.41	48101.41	0.00	35595.07	12506.34	1	1	0
3779	254	2	93	84	28	92297.20	92297.20	0.00	57224.30	35072.90	1	1	0
3780	254	2	372	138	48	200423.78	200423.78	0.00	134058.58	66365.20	1	1	0
3781	254	1	1046	106	10	79837.56	79837.56	0.00	52164.96	27672.60	1	1	0
3782	254	1000	1200	59	49	67711.44	0.00	67711.44	51084.30	16627.14	1	0	1
3783	254	2	318	46	16	10749.08	10749.08	0.00	9029.24	1719.84	1	1	0
3784	254	1000	1239	19	50	52516.12	0.00	52516.12	39532.58	12983.54	1	0	1
3785	254	1000	898	45	9	72034.92	0.00	72034.92	62567.01	9467.91	1	0	1
3786	254	1	283	112	5	61030.27	61030.27	0.00	45138.95	15891.32	1	1	0
3787	254	1000	916	12	22	102427.20	0.00	102427.20	73874.79	28552.41	1	0	1
3788	254	1000	454	187	26	128801.25	0.00	128801.25	88217.96	40583.29	1	0	1
3789	254	4	387	219	37	107467.62	107467.62	0.00	74372.85	33094.77	1	1	0
3790	254	1	177	167	18	75936.02	75936.02	0.00	57417.90	18518.12	1	1	0
3791	254	1000	691	216	26	109956.22	0.00	109956.22	85036.99	24919.23	1	0	1
3792	254	1000	469	247	16	118449.20	0.00	118449.20	94652.20	23797.00	1	0	1
3793	254	4	1001	65	44	71079.23	71079.23	0.00	50857.93	20221.30	1	1	0
3794	254	2	292	17	28	98869.59	98869.59	0.00	78204.47	20665.12	1	1	0
3795	254	1	597	115	27	73196.56	73196.56	0.00	44649.92	28546.64	1	1	0
3796	254	1	1228	67	11	57785.22	57785.22	0.00	49728.18	8057.04	1	1	0
3797	254	3	1265	92	34	130652.65	130652.65	0.00	98786.14	31866.51	1	1	0
3798	254	2	1033	190	11	127641.10	127641.10	0.00	103393.32	24247.78	1	1	0
3799	254	2	370	233	28	8494.48	8494.48	0.00	5606.36	2888.12	1	1	0
3800	254	3	357	126	24	37460.24	37460.24	0.00	29573.80	7886.44	1	1	0
3801	254	3	439	21	18	21258.18	21258.18	0.00	16368.84	4889.34	1	1	0
3802	254	3	392	40	2	70741.20	70741.20	0.00	48228.96	22512.24	1	1	0
3803	254	1000	865	241	38	36045.56	0.00	36045.56	21987.80	14057.76	1	0	1
3804	254	1000	171	196	13	202663.16	0.00	202663.16	169965.13	32698.03	1	0	1
3805	254	3	377	230	25	132708.94	132708.94	0.00	99496.69	33212.25	1	1	0
3806	254	1	606	86	19	57943.96	57943.96	0.00	43604.30	14339.66	1	1	0
3807	254	3	988	138	15	58675.22	58675.22	0.00	46505.68	12169.54	1	1	0
3808	254	4	896	200	50	7889.32	7889.32	0.00	6074.78	1814.54	1	1	0
3809	254	1	475	211	45	40888.98	40888.98	0.00	26430.72	14458.26	1	1	0
3810	254	1	1287	97	44	66610.56	66610.56	0.00	56914.32	9696.24	1	1	0
3811	254	1000	1054	167	31	60198.48	0.00	60198.48	41474.88	18723.60	1	0	1
3812	254	1000	627	23	20	8040.48	0.00	8040.48	6834.40	1206.08	1	0	1
3813	254	4	929	56	46	110991.31	110991.31	0.00	89149.43	21841.88	1	1	0
3814	254	4	1203	211	3	155661.50	155661.50	0.00	117674.35	37987.15	1	1	0
3815	254	1000	736	74	11	6616.00	0.00	6616.00	4234.24	2381.76	1	0	1
3816	254	1000	549	94	39	32165.16	0.00	32165.16	25731.28	6433.88	1	0	1
3817	254	1000	909	33	31	8646.00	0.00	8646.00	7608.48	1037.52	1	0	1
3818	254	1000	1163	37	28	57384.99	0.00	57384.99	46481.85	10903.14	1	0	1
3819	254	1	136	187	20	9652.79	9652.79	0.00	7651.16	2001.63	1	1	0
3820	254	1000	1111	246	24	25031.79	0.00	25031.79	17271.93	7759.86	1	0	1
3821	254	1000	771	237	15	33032.15	0.00	33032.15	21470.90	11561.25	1	0	1
3822	254	1000	752	219	50	79495.47	0.00	79495.47	56706.78	22788.69	1	0	1
3823	254	4	393	52	1	109779.51	109779.51	0.00	85884.10	23895.41	1	1	0
3824	254	3	366	206	8	184942.83	184942.83	0.00	154081.15	30861.68	1	1	0
3825	254	4	888	191	2	147633.83	147633.83	0.00	97529.40	50104.43	1	1	0
3826	254	1000	980	196	12	48708.12	0.00	48708.12	37505.24	11202.88	1	0	1
3827	254	1000	727	79	28	2693.59	0.00	2693.59	2154.87	538.72	1	0	1
3828	254	1000	905	181	2	149456.16	0.00	149456.16	106378.39	43077.77	1	0	1
3829	254	4	984	23	2	99409.95	99409.95	0.00	74225.34	25184.61	1	1	0
3830	254	1000	854	49	34	87794.44	0.00	87794.44	67122.50	20671.94	1	0	1
3831	254	1000	952	19	15	92712.51	0.00	92712.51	71321.78	21390.73	1	0	1
3832	254	1	1242	128	19	171623.35	171623.35	0.00	130007.27	41616.08	1	1	0
3833	254	4	635	63	50	36121.20	36121.20	0.00	25901.59	10219.61	1	1	0
3834	254	2	1073	230	32	67688.19	67688.19	0.00	53473.68	14214.51	1	1	0
3835	254	1	1165	218	23	44249.51	44249.51	0.00	34451.75	9797.76	1	1	0
3836	254	4	1149	111	28	17823.35	17823.35	0.00	12832.80	4990.55	1	1	0
3837	254	1000	899	54	44	121149.21	0.00	121149.21	100003.37	21145.84	1	0	1
3838	254	1000	1283	127	41	84938.84	0.00	84938.84	67965.23	16973.61	1	0	1
3839	254	1	1101	60	5	44172.40	44172.40	0.00	34631.22	9541.18	1	1	0
3840	254	1000	895	72	26	60999.60	0.00	60999.60	40802.61	20196.99	1	0	1
3841	254	1000	1208	125	36	163433.68	0.00	163433.68	119723.52	43710.16	1	0	1
3842	254	1000	54	65	23	73836.05	0.00	73836.05	58806.03	15030.02	1	0	1
3843	254	1000	752	5	11	111616.70	0.00	111616.70	86539.85	25076.85	1	0	1
3844	254	2	135	39	15	50816.64	50816.64	0.00	30998.16	19818.48	1	1	0
3845	254	1000	1026	192	6	60443.97	0.00	60443.97	46636.03	13807.94	1	0	1
3846	254	1000	729	208	49	53139.60	0.00	53139.60	40170.50	12969.10	1	0	1
3847	254	1000	321	27	19	29494.88	0.00	29494.88	18065.71	11429.17	1	0	1
3848	254	1000	1251	230	46	118256.33	0.00	118256.33	88349.36	29906.97	1	0	1
3849	254	3	976	123	34	71233.87	71233.87	0.00	54046.80	17187.07	1	1	0
3850	254	1000	169	158	44	15987.15	0.00	15987.15	12150.25	3836.90	1	0	1
3851	254	4	68	138	23	61054.13	61054.13	0.00	43201.66	17852.47	1	1	0
3852	254	1000	1003	89	9	197935.57	0.00	197935.57	140694.92	57240.65	1	0	1
3853	254	1000	975	88	44	139149.40	0.00	139149.40	93420.78	45728.62	1	0	1
3854	254	4	1274	24	35	110979.51	110979.51	0.00	72136.70	38842.81	1	1	0
3855	254	1000	1088	57	14	13312.80	0.00	13312.80	8653.32	4659.48	1	0	1
3856	254	1000	1147	23	36	89169.38	0.00	89169.38	71523.30	17646.08	1	0	1
3857	254	4	995	2	28	57419.98	57419.98	0.00	45074.69	12345.29	1	1	0
3858	254	1000	843	23	36	30658.28	0.00	30658.28	22166.24	8492.04	1	0	1
3859	254	1000	665	172	46	186440.70	0.00	186440.70	153376.52	33064.18	1	0	1
3860	254	1000	296	72	12	160112.25	0.00	160112.25	127337.07	32775.18	1	0	1
3861	254	2	666	115	21	48187.09	48187.09	0.00	29876.00	18311.09	1	1	0
3862	254	3	961	121	45	168161.84	168161.84	0.00	113940.64	54221.20	1	1	0
3863	254	3	127	108	13	155221.83	155221.83	0.00	113827.94	41393.89	1	1	0
3864	254	1000	488	9	9	159188.09	0.00	159188.09	106279.61	52908.48	1	0	1
3865	254	1000	1119	14	1	4497.78	0.00	4497.78	4003.02	494.76	1	0	1
3866	254	1000	935	91	43	167893.00	0.00	167893.00	118521.19	49371.81	1	0	1
3867	254	2	546	162	11	55666.80	55666.80	0.00	47316.78	8350.02	1	1	0
3868	254	1000	752	177	4	104192.00	0.00	104192.00	79633.29	24558.71	1	0	1
3869	254	1000	840	219	48	212523.44	0.00	212523.44	162792.70	49730.74	1	0	1
3870	254	1000	503	19	27	139298.03	0.00	139298.03	103967.42	35330.61	1	0	1
3871	254	1000	870	104	45	28322.14	0.00	28322.14	21017.31	7304.83	1	0	1
3872	254	1000	1193	134	33	31562.55	0.00	31562.55	24934.41	6628.14	1	0	1
3873	254	3	1160	34	44	99221.14	99221.14	0.00	67156.58	32064.56	1	1	0
3874	254	1000	175	249	2	131779.65	0.00	131779.65	99797.56	31982.09	1	0	1
3875	254	4	70	231	37	99652.94	99652.94	0.00	72105.50	27547.44	1	1	0
3876	254	3	427	247	17	128400.89	128400.89	0.00	103235.73	25165.16	1	1	0
3877	254	2	1180	118	3	37549.44	37549.44	0.00	32292.54	5256.90	1	1	0
3878	254	3	614	115	35	74500.64	74500.64	0.00	53057.67	21442.97	1	1	0
3879	254	1000	347	133	6	93725.82	0.00	93725.82	79424.12	14301.70	1	0	1
3880	254	1000	1253	214	13	98319.33	0.00	98319.33	74537.59	23781.74	1	0	1
3881	254	4	1193	238	3	64230.28	64230.28	0.00	47269.12	16961.16	1	1	0
3882	254	1000	1274	53	14	168162.53	0.00	168162.53	134691.70	33470.83	1	0	1
3883	254	4	183	127	2	71256.00	71256.00	0.00	52078.36	19177.64	1	1	0
3884	254	1000	711	17	10	9115.10	0.00	9115.10	7292.10	1823.00	1	0	1
3885	254	1000	350	15	37	68741.30	0.00	68741.30	53226.54	15514.76	1	0	1
3886	254	1000	989	157	12	212310.88	0.00	212310.88	142622.65	69688.23	1	0	1
3887	254	1000	459	247	50	58127.02	0.00	58127.02	41851.46	16275.56	1	0	1
3888	254	1000	803	220	49	113999.38	0.00	113999.38	92980.20	21019.18	1	0	1
3889	254	1000	308	197	10	37880.00	0.00	37880.00	34092.00	3788.00	1	0	1
3890	254	1000	1224	247	35	62582.40	0.00	62582.40	53820.90	8761.50	1	0	1
3891	254	1000	349	50	32	147760.91	0.00	147760.91	118665.46	29095.45	1	0	1
3892	254	1	557	131	4	3803.04	3803.04	0.00	3298.00	505.04	1	1	0
3893	254	1000	1187	46	12	155046.89	0.00	155046.89	105090.24	49956.65	1	0	1
3894	254	4	99	74	6	85033.79	85033.79	0.00	66121.56	18912.23	1	1	0
3895	254	3	879	124	17	147679.95	147679.95	0.00	102353.44	45326.51	1	1	0
3896	254	4	27	114	47	141076.58	141076.58	0.00	94014.62	47061.96	1	1	0
3897	254	2	350	197	22	137974.87	137974.87	0.00	105504.84	32470.03	1	1	0
3898	254	1000	469	32	33	234639.22	0.00	234639.22	174890.48	59748.74	1	0	1
3899	254	3	501	43	33	127450.27	127450.27	0.00	106298.02	21152.25	1	1	0
3900	254	1000	1190	126	31	121066.91	0.00	121066.91	99073.93	21992.98	1	0	1
3901	254	1	271	35	28	192776.42	192776.42	0.00	140920.84	51855.58	1	1	0
3902	254	1000	488	177	13	7927.32	0.00	7927.32	5786.96	2140.36	1	0	1
3903	254	1000	404	39	38	99471.20	0.00	99471.20	84906.29	14564.91	1	0	1
3904	254	1	642	33	6	28474.18	28474.18	0.00	20786.84	7687.34	1	1	0
3905	254	1000	712	155	20	88927.66	0.00	88927.66	64159.77	24767.89	1	0	1
3906	254	2	728	253	33	41462.52	41462.52	0.00	29853.00	11609.52	1	1	0
3907	254	2	546	190	43	131947.38	131947.38	0.00	91622.77	40324.61	1	1	0
3908	254	1000	414	11	22	144907.71	0.00	144907.71	100374.17	44533.54	1	0	1
3909	254	2	1211	212	25	35555.59	35555.59	0.00	26311.11	9244.48	1	1	0
3910	254	1	221	115	33	130080.72	130080.72	0.00	102499.54	27581.18	1	1	0
3911	254	1	833	233	17	18692.32	18692.32	0.00	13645.36	5046.96	1	1	0
3912	254	1	631	84	27	34776.48	34776.48	0.00	29560.00	5216.48	1	1	0
3913	254	1000	939	15	21	33476.29	0.00	33476.29	25078.14	8398.15	1	0	1
3914	254	2	1049	29	11	67483.86	67483.86	0.00	46349.89	21133.97	1	1	0
3915	254	1000	1109	200	36	131218.38	0.00	131218.38	96423.58	34794.80	1	0	1
3916	254	1000	1088	236	35	163476.08	0.00	163476.08	106976.67	56499.41	1	0	1
3917	254	1	1120	218	42	33748.75	33748.75	0.00	22611.68	11137.07	1	1	0
3918	254	1	999	88	34	109978.71	109978.71	0.00	81121.88	28856.83	1	1	0
3919	254	1000	1023	170	44	79001.13	0.00	79001.13	51477.54	27523.59	1	0	1
3920	254	3	295	161	3	101449.76	101449.76	0.00	81148.40	20301.36	1	1	0
3921	254	1000	1225	97	9	363.90	0.00	363.90	254.70	109.20	1	0	1
3922	254	1000	1041	45	40	90493.13	0.00	90493.13	64058.40	26434.73	1	0	1
3923	254	1	1116	219	12	123155.19	123155.19	0.00	106739.40	16415.79	1	1	0
3924	254	1000	1212	239	18	20142.26	0.00	20142.26	17240.64	2901.62	1	0	1
3925	254	1000	96	192	31	93564.67	0.00	93564.67	70949.45	22615.22	1	0	1
3926	254	1	905	159	38	123764.34	123764.34	0.00	81895.80	41868.54	1	1	0
3927	254	1000	1070	162	7	8104.10	0.00	8104.10	5672.90	2431.20	1	0	1
3928	254	2	486	231	1	65285.67	65285.67	0.00	48449.78	16835.89	1	1	0
3929	254	4	603	173	25	23782.97	23782.97	0.00	18970.51	4812.46	1	1	0
3930	254	1000	1	86	38	7749.45	0.00	7749.45	5782.42	1967.03	1	0	1
3931	254	3	143	104	31	62102.28	62102.28	0.00	55162.88	6939.40	1	1	0
3932	254	1000	133	175	16	91642.73	0.00	91642.73	69518.90	22123.83	1	0	1
3933	254	1000	197	221	32	165683.46	0.00	165683.46	119476.18	46207.28	1	0	1
3934	254	1000	850	157	24	134564.79	0.00	134564.79	98502.41	36062.38	1	0	1
3935	254	2	321	189	12	20317.48	20317.48	0.00	15034.92	5282.56	1	1	0
3936	254	1000	783	64	44	108875.79	0.00	108875.79	73739.06	35136.73	1	0	1
3937	254	1000	280	20	25	29826.55	0.00	29826.55	19541.55	10285.00	1	0	1
3938	254	1000	619	164	22	122255.72	0.00	122255.72	97351.00	24904.72	1	0	1
3939	254	2	922	135	49	120960.38	120960.38	0.00	86427.62	34532.76	1	1	0
3940	254	1000	538	121	32	196901.34	0.00	196901.34	143042.12	53859.22	1	0	1
3941	254	1	1035	6	21	105224.91	105224.91	0.00	83709.32	21515.59	1	1	0
3942	254	1000	670	130	29	12904.02	0.00	12904.02	9549.00	3355.02	1	0	1
3943	254	1000	718	49	8	64418.19	0.00	64418.19	53319.10	11099.09	1	0	1
3944	254	1000	532	209	50	77132.50	0.00	77132.50	63248.60	13883.90	1	0	1
3945	254	1000	1279	194	32	137781.17	0.00	137781.17	107554.41	30226.76	1	0	1
3946	254	1000	920	120	48	221448.09	0.00	221448.09	165110.47	56337.62	1	0	1
3947	254	1000	215	238	40	62685.27	0.00	62685.27	51463.72	11221.55	1	0	1
3948	254	4	501	179	37	154738.19	154738.19	0.00	118631.04	36107.15	1	1	0
3949	254	4	546	211	1	108276.45	108276.45	0.00	83067.05	25209.40	1	1	0
3950	254	1000	48	200	39	140999.42	0.00	140999.42	108038.79	32960.63	1	0	1
3951	254	1000	449	223	1	109482.32	0.00	109482.32	76870.67	32611.65	1	0	1
3952	254	2	521	200	48	144777.48	144777.48	0.00	105755.10	39022.38	1	1	0
3953	254	1000	992	71	19	234445.27	0.00	234445.27	174818.44	59626.83	1	0	1
3954	254	1000	927	113	21	51254.36	0.00	51254.36	37542.96	13711.40	1	0	1
3955	254	1000	949	66	4	26241.16	0.00	26241.16	18909.66	7331.50	1	0	1
3956	254	1000	900	247	46	85154.95	0.00	85154.95	57384.40	27770.55	1	0	1
3957	254	3	541	22	31	66704.63	66704.63	0.00	43883.06	22821.57	1	1	0
3958	254	1	476	32	21	27412.90	27412.90	0.00	19606.77	7806.13	1	1	0
3959	254	2	661	166	30	40159.88	40159.88	0.00	29600.64	10559.24	1	1	0
3960	254	1000	401	207	27	189416.82	0.00	189416.82	142548.17	46868.65	1	0	1
3961	254	1000	529	41	7	18379.56	0.00	18379.56	13600.86	4778.70	1	0	1
3962	254	1000	204	152	21	80681.39	0.00	80681.39	62467.18	18214.21	1	0	1
3963	254	1000	125	162	40	161526.30	0.00	161526.30	116839.65	44686.65	1	0	1
3964	254	1000	857	18	7	111594.81	0.00	111594.81	78199.24	33395.57	1	0	1
3965	254	1000	82	235	32	122084.64	0.00	122084.64	88010.71	34073.93	1	0	1
3966	254	1000	178	89	26	51657.48	0.00	51657.48	37469.39	14188.09	1	0	1
3967	254	3	34	194	13	169326.10	169326.10	0.00	135777.21	33548.89	1	1	0
3968	254	2	743	129	30	172802.01	172802.01	0.00	150716.57	22085.44	1	1	0
3969	254	1	183	2	19	156301.77	156301.77	0.00	113455.64	42846.13	1	1	0
3970	254	1000	33	143	49	187721.06	0.00	187721.06	135756.80	51964.26	1	0	1
3971	254	2	1084	81	25	18475.43	18475.43	0.00	15274.81	3200.62	1	1	0
3972	254	2	589	156	45	143859.88	143859.88	0.00	104512.29	39347.59	1	1	0
3973	254	1	408	22	43	81379.20	81379.20	0.00	55692.37	25686.83	1	1	0
3974	254	2	37	195	16	88861.12	88861.12	0.00	71612.46	17248.66	1	1	0
3975	254	1	1111	162	6	135261.46	135261.46	0.00	103405.58	31855.88	1	1	0
3976	254	1	22	158	13	110329.12	110329.12	0.00	69818.12	40511.00	1	1	0
3977	254	3	266	124	44	156610.89	156610.89	0.00	121046.14	35564.75	1	1	0
3978	254	1000	510	125	14	22608.93	0.00	22608.93	14469.72	8139.21	1	0	1
3979	254	1000	1131	177	50	25170.16	0.00	25170.16	22190.56	2979.60	1	0	1
3980	254	1	310	136	11	30217.19	30217.19	0.00	21130.77	9086.42	1	1	0
3981	254	4	61	90	43	182148.11	182148.11	0.00	124959.21	57188.90	1	1	0
3982	254	1000	604	238	6	91365.98	0.00	91365.98	68338.19	23027.79	1	0	1
3983	254	3	715	158	50	12128.10	12128.10	0.00	9945.03	2183.07	1	1	0
3984	254	3	1115	120	48	86217.50	86217.50	0.00	64300.94	21916.56	1	1	0
3985	254	1000	1002	116	33	124445.32	0.00	124445.32	86408.13	38037.19	1	0	1
3986	254	3	842	216	12	30808.70	30808.70	0.00	27433.05	3375.65	1	1	0
3987	254	2	1244	133	37	67320.90	67320.90	0.00	50167.20	17153.70	1	1	0
3988	254	1	562	39	1	58703.27	58703.27	0.00	46865.04	11838.23	1	1	0
3989	254	1000	436	110	18	110093.85	0.00	110093.85	74612.58	35481.27	1	0	1
3990	254	1	171	87	36	137379.60	137379.60	0.00	97476.99	39902.61	1	1	0
3991	254	1000	1192	74	15	103225.91	0.00	103225.91	76246.11	26979.80	1	0	1
3992	254	3	1161	14	44	58842.91	58842.91	0.00	43543.78	15299.13	1	1	0
3993	254	1	106	62	44	93498.65	93498.65	0.00	71395.85	22102.80	1	1	0
3994	254	2	894	165	12	60618.70	60618.70	0.00	46356.66	14262.04	1	1	0
3995	254	1000	733	249	43	218739.23	0.00	218739.23	165655.98	53083.25	1	0	1
3996	254	1000	310	114	25	49397.00	0.00	49397.00	34577.90	14819.10	1	0	1
3997	254	1	1015	191	22	126281.21	126281.21	0.00	106104.73	20176.48	1	1	0
3998	254	1	218	8	22	23388.34	23388.34	0.00	20627.57	2760.77	1	1	0
3999	254	4	955	48	31	32646.29	32646.29	0.00	27628.01	5018.28	1	1	0
4000	254	1000	34	183	27	93359.99	0.00	93359.99	80510.53	12849.46	1	0	1
4001	254	1000	954	51	47	54161.60	0.00	54161.60	35205.00	18956.60	1	0	1
4002	254	1000	1172	70	24	78876.48	0.00	78876.48	54675.44	24201.04	1	0	1
4003	254	4	216	247	14	54522.73	54522.73	0.00	34922.71	19600.02	1	1	0
4004	254	1000	295	155	37	36837.21	0.00	36837.21	25305.63	11531.58	1	0	1
4005	254	1000	598	135	32	137968.39	0.00	137968.39	95247.68	42720.71	1	0	1
4006	254	1	417	206	32	98288.24	98288.24	0.00	74924.12	23364.12	1	1	0
4007	254	2	265	4	29	107831.40	107831.40	0.00	73494.54	34336.86	1	1	0
4008	254	2	1224	232	21	92545.36	92545.36	0.00	81847.78	10697.58	1	1	0
4009	254	3	323	64	45	118447.77	118447.77	0.00	91592.20	26855.57	1	1	0
4010	254	1000	498	159	23	39440.54	0.00	39440.54	31591.16	7849.38	1	0	1
4011	254	1	334	166	39	57644.23	57644.23	0.00	44612.30	13031.93	1	1	0
4012	254	1000	1061	230	26	211751.49	0.00	211751.49	172684.32	39067.17	1	0	1
4013	254	2	533	5	27	51571.86	51571.86	0.00	31830.14	19741.72	1	1	0
4014	254	1000	689	26	25	139147.19	0.00	139147.19	99827.97	39319.22	1	0	1
4015	254	1000	1282	242	23	100045.19	0.00	100045.19	78990.15	21055.04	1	0	1
4016	254	1	172	119	25	177595.06	177595.06	0.00	123675.37	53919.69	1	1	0
4017	254	3	828	99	5	235274.34	235274.34	0.00	172374.45	62899.89	1	1	0
4018	254	1000	533	51	47	105913.65	0.00	105913.65	78673.88	27239.77	1	0	1
4019	254	4	829	192	25	25517.49	25517.49	0.00	18627.78	6889.71	1	1	0
4020	254	1000	522	151	3	264515.68	0.00	264515.68	192047.04	72468.64	1	0	1
4021	254	1000	816	36	28	168394.49	0.00	168394.49	130394.36	38000.13	1	0	1
4022	254	3	763	92	23	71857.18	71857.18	0.00	59501.85	12355.33	1	1	0
4023	254	4	693	39	13	36672.40	36672.40	0.00	32271.70	4400.70	1	1	0
4024	254	1000	1184	63	31	48059.40	0.00	48059.40	34122.18	13937.22	1	0	1
4025	254	1000	632	27	15	38283.49	0.00	38283.49	31020.21	7263.28	1	0	1
4026	254	1000	426	184	23	139575.45	0.00	139575.45	105101.52	34473.93	1	0	1
4027	254	1000	1263	145	12	123650.83	0.00	123650.83	82027.56	41623.27	1	0	1
4028	254	1000	982	215	23	81838.93	0.00	81838.93	61527.51	20311.42	1	0	1
4029	254	1	549	82	32	4477.41	4477.41	0.00	3895.38	582.03	1	1	0
4030	254	3	994	248	46	89513.33	89513.33	0.00	65831.70	23681.63	1	1	0
4031	254	2	520	211	14	109978.35	109978.35	0.00	74107.59	35870.76	1	1	0
4032	254	1	1034	219	3	4803.89	4803.89	0.00	3458.77	1345.12	1	1	0
4033	254	1000	499	30	30	83906.62	0.00	83906.62	62422.88	21483.74	1	0	1
4034	254	4	173	121	48	58955.32	58955.32	0.00	47442.79	11512.53	1	1	0
4035	254	2	238	250	14	70477.04	70477.04	0.00	62127.30	8349.74	1	1	0
4036	254	1	43	128	37	9813.72	9813.72	0.00	8636.07	1177.65	1	1	0
4037	254	3	1178	34	49	162207.26	162207.26	0.00	131696.60	30510.66	1	1	0
4038	254	2	247	85	39	15549.38	15549.38	0.00	13061.48	2487.90	1	1	0
4039	254	1000	626	187	27	39482.45	0.00	39482.45	28552.38	10930.07	1	0	1
4040	254	1000	56	5	49	37949.04	0.00	37949.04	28227.94	9721.10	1	0	1
4041	254	1000	81	177	43	75523.43	0.00	75523.43	53806.34	21717.09	1	0	1
4042	254	4	372	200	24	71530.10	71530.10	0.00	51893.54	19636.56	1	1	0
4043	254	1000	531	68	46	184734.30	0.00	184734.30	149864.03	34870.27	1	0	1
4044	254	4	484	87	18	128814.46	128814.46	0.00	83887.42	44927.04	1	1	0
4045	254	3	401	8	32	7693.80	7693.80	0.00	5308.72	2385.08	1	1	0
4046	254	1000	313	81	19	32319.11	0.00	32319.11	24395.86	7923.25	1	0	1
4047	254	1000	8	144	29	111712.71	0.00	111712.71	79338.16	32374.55	1	0	1
4048	254	1000	953	71	15	107347.97	0.00	107347.97	87425.21	19922.76	1	0	1
4049	254	1000	193	119	36	142644.29	0.00	142644.29	106135.42	36508.87	1	0	1
4050	254	1000	843	166	49	58842.91	0.00	58842.91	43543.78	15299.13	1	0	1
4051	254	3	435	207	48	53689.82	53689.82	0.00	47856.22	5833.60	1	1	0
4052	254	4	1128	68	26	164662.24	164662.24	0.00	120725.54	43936.70	1	1	0
4053	254	1000	1073	21	16	50482.89	0.00	50482.89	41490.00	8992.89	1	0	1
4054	254	4	1158	20	43	17615.32	17615.32	0.00	13028.83	4586.49	1	1	0
4055	254	1000	967	69	31	105457.34	0.00	105457.34	82748.66	22708.68	1	0	1
4056	254	1	255	234	17	1433.38	1433.38	0.00	1161.04	272.34	1	1	0
4057	254	1	933	111	32	170697.12	170697.12	0.00	130338.39	40358.73	1	1	0
4058	254	1000	361	55	5	74791.91	0.00	74791.91	57810.23	16981.68	1	0	1
4059	254	1000	808	164	29	11648.91	0.00	11648.91	9901.56	1747.35	1	0	1
4060	254	1000	19	123	28	40756.49	0.00	40756.49	30965.13	9791.36	1	0	1
4061	254	3	842	224	11	24465.10	24465.10	0.00	17859.50	6605.60	1	1	0
4062	254	1000	603	27	46	17160.47	0.00	17160.47	13908.55	3251.92	1	0	1
4063	254	1000	343	235	4	81688.90	0.00	81688.90	57797.79	23891.11	1	0	1
4064	254	1000	951	126	46	20153.04	0.00	20153.04	13264.36	6888.68	1	0	1
4065	254	1000	149	16	36	55295.64	0.00	55295.64	33730.38	21565.26	1	0	1
4066	254	1000	682	235	5	78110.56	0.00	78110.56	62746.61	15363.95	1	0	1
4067	254	1000	1059	247	27	165488.76	0.00	165488.76	123673.03	41815.73	1	0	1
4068	254	1	136	98	23	175489.82	175489.82	0.00	140822.37	34667.45	1	1	0
4069	254	2	1038	196	41	91365.04	91365.04	0.00	72069.16	19295.88	1	1	0
4070	254	1000	105	79	12	167237.00	0.00	167237.00	126469.16	40767.84	1	0	1
4071	254	1000	711	107	37	136825.45	0.00	136825.45	96291.75	40533.70	1	0	1
4072	254	1000	728	191	6	89756.36	0.00	89756.36	67182.00	22574.36	1	0	1
4073	254	2	1232	125	18	71034.97	71034.97	0.00	56465.22	14569.75	1	1	0
4074	254	1000	1132	231	20	109115.77	0.00	109115.77	78447.69	30668.08	1	0	1
4075	254	1000	719	46	48	42034.53	0.00	42034.53	30915.15	11119.38	1	0	1
4076	254	2	240	130	43	172495.46	172495.46	0.00	135405.66	37089.80	1	1	0
4077	254	1000	1268	89	42	14927.04	0.00	14927.04	11493.84	3433.20	1	0	1
4078	254	1000	1090	154	7	51289.09	0.00	51289.09	43802.85	7486.24	1	0	1
4079	254	1000	1283	50	22	86522.22	0.00	86522.22	59684.11	26838.11	1	0	1
4080	254	1000	102	24	12	83498.53	0.00	83498.53	58365.21	25133.32	1	0	1
4081	254	1000	960	51	39	37583.34	0.00	37583.34	27811.68	9771.66	1	0	1
4082	254	1000	1043	117	29	24.60	0.00	24.60	17.22	7.38	1	0	1
4083	254	1000	1283	193	31	41750.65	0.00	41750.65	33805.35	7945.30	1	0	1
4084	254	1	552	38	34	36596.85	36596.85	0.00	26349.75	10247.10	1	1	0
4085	254	4	512	204	13	45703.03	45703.03	0.00	30622.69	15080.34	1	1	0
4086	254	1000	1003	236	47	40369.92	0.00	40369.92	30620.42	9749.50	1	0	1
4087	254	1	709	28	47	9528.67	9528.67	0.00	6193.64	3335.03	1	1	0
4088	254	1000	861	246	42	29261.57	0.00	29261.57	24010.61	5250.96	1	0	1
4089	254	1000	971	80	42	109.06	0.00	109.06	70.89	38.17	1	0	1
4090	254	1000	312	177	46	38739.69	0.00	38739.69	33316.11	5423.58	1	0	1
4091	254	1000	968	213	1	163489.20	0.00	163489.20	118555.56	44933.64	1	0	1
4092	254	2	1043	226	21	42250.74	42250.74	0.00	31265.52	10985.22	1	1	0
4093	254	1000	269	7	46	134082.37	0.00	134082.37	103735.90	30346.47	1	0	1
4094	254	4	712	161	42	55697.50	55697.50	0.00	45504.96	10192.54	1	1	0
4095	254	1000	1182	203	37	44843.49	0.00	44843.49	29782.77	15060.72	1	0	1
4096	254	1000	1122	201	2	68491.59	0.00	68491.59	56887.62	11603.97	1	0	1
4097	254	1000	757	218	34	158774.95	0.00	158774.95	119644.85	39130.10	1	0	1
4098	254	1000	484	72	36	91946.39	0.00	91946.39	62692.24	29254.15	1	0	1
4099	254	2	763	190	34	178284.54	178284.54	0.00	131889.16	46395.38	1	1	0
4100	254	1000	146	210	38	51684.96	0.00	51684.96	34838.58	16846.38	1	0	1
4101	254	4	700	129	23	25436.25	25436.25	0.00	15770.52	9665.73	1	1	0
4102	254	2	893	127	8	39000.61	39000.61	0.00	33340.64	5659.97	1	1	0
4103	254	3	707	248	14	62193.78	62193.78	0.00	44779.50	17414.28	1	1	0
4104	254	4	457	220	10	1853.64	1853.64	0.00	1612.71	240.93	1	1	0
4105	254	1000	173	242	18	97722.29	0.00	97722.29	75501.45	22220.84	1	0	1
4106	254	3	5	73	8	45850.24	45850.24	0.00	34107.39	11742.85	1	1	0
4107	254	2	649	75	40	25338.90	25338.90	0.00	18263.35	7075.55	1	1	0
4108	254	1	303	101	17	72230.83	72230.83	0.00	56649.37	15581.46	1	1	0
4109	254	3	1114	182	11	192725.07	192725.07	0.00	158567.17	34157.90	1	1	0
4110	254	1000	1063	238	8	73904.56	0.00	73904.56	62524.19	11380.37	1	0	1
4111	254	1000	345	31	6	160101.53	0.00	160101.53	125508.67	34592.86	1	0	1
4112	254	1000	178	215	17	141990.78	0.00	141990.78	97282.78	44708.00	1	0	1
4113	254	2	882	152	22	171329.14	171329.14	0.00	128682.82	42646.32	1	1	0
4114	254	1000	930	86	21	109089.15	0.00	109089.15	77579.91	31509.24	1	0	1
4115	254	4	410	38	17	9333.24	9333.24	0.00	6346.59	2986.65	1	1	0
4116	254	1000	226	125	28	23326.86	0.00	23326.86	20527.65	2799.21	1	0	1
4117	254	1	201	106	2	113987.70	113987.70	0.00	83245.24	30742.46	1	1	0
4118	254	3	1092	178	18	134497.35	134497.35	0.00	86814.67	47682.68	1	1	0
4119	254	1000	80	55	7	50054.52	0.00	50054.52	32535.42	17519.10	1	0	1
4120	254	1000	288	41	23	50577.10	0.00	50577.10	34898.22	15678.88	1	0	1
4121	254	1000	98	137	49	17692.68	0.00	17692.68	13623.36	4069.32	1	0	1
4122	254	4	155	161	43	41520.87	41520.87	0.00	26988.57	14532.30	1	1	0
4123	254	1000	459	186	17	116543.48	0.00	116543.48	86537.90	30005.58	1	0	1
4124	254	1000	727	210	36	82562.72	0.00	82562.72	66072.04	16490.68	1	0	1
4125	254	4	628	107	11	111879.53	111879.53	0.00	79331.59	32547.94	1	1	0
4126	254	1000	1113	201	24	7531.46	0.00	7531.46	6778.31	753.15	1	0	1
4127	254	1	458	240	28	110044.67	110044.67	0.00	87859.37	22185.30	1	1	0
4128	254	4	995	8	8	31071.60	31071.60	0.00	21439.40	9632.20	1	1	0
4129	254	1000	927	205	27	66346.77	0.00	66346.77	50884.79	15461.98	1	0	1
4130	254	2	528	147	1	33725.02	33725.02	0.00	23798.28	9926.74	1	1	0
4131	254	3	664	137	38	84177.52	84177.52	0.00	67658.64	16518.88	1	1	0
4132	254	4	58	211	35	12169.29	12169.29	0.00	9042.86	3126.43	1	1	0
4133	254	4	1186	186	33	42197.12	42197.12	0.00	29178.96	13018.16	1	1	0
4134	254	1	362	39	23	101783.23	101783.23	0.00	71453.37	30329.86	1	1	0
4135	254	1000	1266	174	21	716.69	0.00	716.69	580.52	136.17	1	0	1
4136	254	3	377	67	49	143308.76	143308.76	0.00	96815.36	46493.40	1	1	0
4137	254	1	888	20	42	61884.12	61884.12	0.00	50678.79	11205.33	1	1	0
4138	254	1000	831	232	9	154817.88	0.00	154817.88	104796.65	50021.23	1	0	1
4139	254	1000	1180	41	27	126028.24	0.00	126028.24	92682.24	33346.00	1	0	1
4140	254	4	80	139	50	24659.93	24659.93	0.00	18639.95	6019.98	1	1	0
4141	254	2	1284	176	42	72059.74	72059.74	0.00	47325.04	24734.70	1	1	0
4142	254	1000	83	131	47	162271.92	0.00	162271.92	128274.17	33997.75	1	0	1
4143	254	1000	390	64	38	98655.50	0.00	98655.50	66962.29	31693.21	1	0	1
4144	254	1000	536	5	28	80835.88	0.00	80835.88	68443.96	12391.92	1	0	1
4145	254	1000	406	51	1	194671.13	0.00	194671.13	129232.13	65439.00	1	0	1
4146	254	1	912	164	34	178962.63	178962.63	0.00	127662.26	51300.37	1	1	0
4147	254	1000	1147	141	14	45754.58	0.00	45754.58	33012.18	12742.40	1	0	1
4148	254	1000	980	42	12	16222.46	0.00	16222.46	12586.96	3635.50	1	0	1
4149	254	1000	239	52	33	36358.40	0.00	36358.40	27066.72	9291.68	1	0	1
4150	254	1000	872	107	20	53642.60	0.00	53642.60	43249.34	10393.26	1	0	1
4151	254	1000	1043	56	23	69380.56	0.00	69380.56	52729.20	16651.36	1	0	1
4152	254	1	499	72	22	180505.10	180505.10	0.00	122773.68	57731.42	1	1	0
4153	254	1000	1184	206	43	104699.51	0.00	104699.51	73918.63	30780.88	1	0	1
4154	254	1000	730	183	30	119987.72	0.00	119987.72	100279.09	19708.63	1	0	1
4155	254	4	465	52	48	16700.88	16700.88	0.00	14863.80	1837.08	1	1	0
4156	254	1000	331	84	23	32380.66	0.00	32380.66	22650.74	9729.92	1	0	1
4157	254	1	409	54	40	6146.88	6146.88	0.00	4179.88	1967.00	1	1	0
4158	254	1000	1111	55	32	71947.20	0.00	71947.20	50390.88	21556.32	1	0	1
4159	254	1000	912	130	41	13307.62	0.00	13307.62	10998.51	2309.11	1	0	1
4160	254	1000	143	230	29	108220.30	0.00	108220.30	85675.85	22544.45	1	0	1
4161	254	1000	995	187	12	17435.58	0.00	17435.58	11306.21	6129.37	1	0	1
4162	254	2	1080	35	19	47706.53	47706.53	0.00	36956.91	10749.62	1	1	0
4163	254	1000	946	8	33	32712.40	0.00	32712.40	28786.90	3925.50	1	0	1
4164	254	1000	982	134	34	17636.01	0.00	17636.01	14500.70	3135.31	1	0	1
4165	254	1000	1271	105	22	66419.79	0.00	66419.79	45751.44	20668.35	1	0	1
4166	254	1000	1096	3	26	94673.97	0.00	94673.97	70146.61	24527.36	1	0	1
4167	254	1	75	145	43	68956.06	68956.06	0.00	49191.23	19764.83	1	1	0
4168	254	2	1280	86	9	36116.46	36116.46	0.00	23114.52	13001.94	1	1	0
4169	254	1000	1290	174	22	136237.50	0.00	136237.50	92040.54	44196.96	1	0	1
4170	254	1000	223	161	48	62880.21	0.00	62880.21	48858.33	14021.88	1	0	1
4171	254	1000	1117	99	46	94657.23	0.00	94657.23	76139.14	18518.09	1	0	1
4172	254	1000	554	68	6	51852.49	0.00	51852.49	34892.34	16960.15	1	0	1
4173	254	1000	1269	48	41	42309.83	0.00	42309.83	30919.66	11390.17	1	0	1
4174	254	1	61	174	7	158976.31	158976.31	0.00	112450.28	46526.03	1	1	0
4175	254	1000	133	205	7	38627.60	0.00	38627.60	32060.92	6566.68	1	0	1
4176	254	1	724	99	40	7487.14	7487.14	0.00	5566.06	1921.08	1	1	0
4177	254	2	827	78	10	9489.73	9489.73	0.00	7781.58	1708.15	1	1	0
4178	254	4	865	75	30	68732.72	68732.72	0.00	58015.51	10717.21	1	1	0
4179	254	1000	925	84	47	26410.10	0.00	26410.10	21180.76	5229.34	1	0	1
4180	254	1000	300	134	29	119318.65	0.00	119318.65	91503.82	27814.83	1	0	1
4181	254	1000	7	58	6	57177.84	0.00	57177.84	50851.23	6326.61	1	0	1
4182	254	1	100	179	41	141757.92	141757.92	0.00	101859.43	39898.49	1	1	0
4183	254	1000	794	169	41	127879.31	0.00	127879.31	89194.35	38684.96	1	0	1
4184	254	1000	521	162	4	40259.96	0.00	40259.96	29628.30	10631.66	1	0	1
4185	254	1000	858	13	13	127802.84	0.00	127802.84	101147.53	26655.31	1	0	1
4186	254	2	354	81	45	115384.88	115384.88	0.00	77748.51	37636.37	1	1	0
4187	254	1000	57	127	20	44061.75	0.00	44061.75	35233.58	8828.17	1	0	1
4188	254	1000	922	76	40	26527.15	0.00	26527.15	20933.78	5593.37	1	0	1
4189	254	2	995	182	44	86363.72	86363.72	0.00	59395.61	26968.11	1	1	0
4190	254	4	225	104	40	48325.23	48325.23	0.00	34310.88	14014.35	1	1	0
4191	254	1	900	56	15	55669.67	55669.67	0.00	35290.04	20379.63	1	1	0
4192	254	1	590	11	34	4720.14	4720.14	0.00	4106.52	613.62	1	1	0
4193	254	3	863	95	39	89347.50	89347.50	0.00	64485.82	24861.68	1	1	0
4194	254	1000	1030	191	15	524.32	0.00	524.32	356.54	167.78	1	0	1
4195	254	4	1183	200	4	22194.72	22194.72	0.00	17089.90	5104.82	1	1	0
4196	254	4	332	227	10	69811.54	69811.54	0.00	52640.98	17170.56	1	1	0
4197	254	1000	497	194	35	132206.80	0.00	132206.80	105752.56	26454.24	1	0	1
4198	254	1000	170	212	5	79405.41	0.00	79405.41	53138.12	26267.29	1	0	1
4199	254	1000	1136	253	38	140005.84	0.00	140005.84	103038.09	36967.75	1	0	1
4200	254	1000	978	54	9	27369.73	0.00	27369.73	22302.43	5067.30	1	0	1
4201	254	1000	928	122	6	74090.78	0.00	74090.78	55559.52	18531.26	1	0	1
4202	254	1000	1111	201	48	18786.87	0.00	18786.87	15677.94	3108.93	1	0	1
4203	254	1000	581	40	15	628.44	0.00	628.44	452.46	175.98	1	0	1
4204	254	4	1104	11	40	77255.20	77255.20	0.00	64121.84	13133.36	1	1	0
4205	254	1000	796	12	33	51553.11	0.00	51553.11	39745.61	11807.50	1	0	1
4206	254	2	150	44	23	411.92	411.92	0.00	358.38	53.54	1	1	0
4207	254	1000	453	214	21	39482.03	0.00	39482.03	33954.55	5527.48	1	0	1
4208	254	1000	1194	195	28	473.45	0.00	473.45	298.27	175.18	1	0	1
4209	254	1000	224	108	11	61756.85	0.00	61756.85	50441.24	11315.61	1	0	1
4210	254	2	273	208	46	121986.20	121986.20	0.00	82142.44	39843.76	1	1	0
4211	254	1000	329	14	39	88803.59	0.00	88803.59	70539.00	18264.59	1	0	1
4212	254	3	31	90	33	87100.12	87100.12	0.00	59582.47	27517.65	1	1	0
4213	254	1000	305	114	50	20750.32	0.00	20750.32	15302.27	5448.05	1	0	1
4214	254	1000	79	1	47	28797.39	0.00	28797.39	23613.87	5183.52	1	0	1
4215	254	1000	445	56	16	53210.57	0.00	53210.57	39354.63	13855.94	1	0	1
4216	254	1000	257	11	9	143488.63	0.00	143488.63	121187.97	22300.66	1	0	1
4217	254	1000	724	169	1	95644.80	0.00	95644.80	75559.40	20085.40	1	0	1
4218	254	2	197	10	28	8744.74	8744.74	0.00	6127.05	2617.69	1	1	0
4219	254	4	1105	6	39	131300.86	131300.86	0.00	100879.94	30420.92	1	1	0
4220	254	1000	339	169	17	102489.12	0.00	102489.12	81698.87	20790.25	1	0	1
4221	254	4	781	48	36	52409.02	52409.02	0.00	39516.45	12892.57	1	1	0
4222	254	1000	1241	181	4	18154.24	0.00	18154.24	14886.48	3267.76	1	0	1
4223	254	1000	673	50	5	263351.24	0.00	263351.24	211169.29	52181.95	1	0	1
4224	254	3	397	73	3	34920.99	34920.99	0.00	21301.83	13619.16	1	1	0
4225	254	2	849	222	25	29742.16	29742.16	0.00	24983.40	4758.76	1	1	0
4226	254	1000	54	183	48	126655.81	0.00	126655.81	103188.46	23467.35	1	0	1
4227	254	1000	204	66	28	44884.28	0.00	44884.28	32345.04	12539.24	1	0	1
4228	254	1000	137	159	28	68618.99	0.00	68618.99	47356.02	21262.97	1	0	1
4229	254	3	1118	108	42	43289.14	43289.14	0.00	31561.75	11727.39	1	1	0
4230	254	2	1164	16	44	79098.88	79098.88	0.00	63248.89	15849.99	1	1	0
4231	254	1000	1216	154	7	4605.03	0.00	4605.03	2809.08	1795.95	1	0	1
4232	254	1000	910	213	20	111370.83	0.00	111370.83	87673.83	23697.00	1	0	1
4233	254	1000	1172	239	2	78760.84	0.00	78760.84	60652.99	18107.85	1	0	1
4234	254	1000	781	47	46	55036.47	0.00	55036.47	37351.22	17685.25	1	0	1
4235	254	1	952	103	16	102450.30	102450.30	0.00	76015.86	26434.44	1	1	0
4236	254	4	818	146	36	41710.52	41710.52	0.00	28011.98	13698.54	1	1	0
4237	254	3	1291	150	22	140333.44	140333.44	0.00	98495.94	41837.50	1	1	0
4238	254	1	967	192	6	16899.27	16899.27	0.00	15040.35	1858.92	1	1	0
4239	254	4	78	89	25	43004.22	43004.22	0.00	30963.03	12041.19	1	1	0
4240	254	1000	866	53	13	13501.80	0.00	13501.80	9181.20	4320.60	1	0	1
4241	254	2	1105	216	9	33265.40	33265.40	0.00	23951.10	9314.30	1	1	0
4242	254	2	694	100	26	219374.52	219374.52	0.00	174388.40	44986.12	1	1	0
4243	254	3	1087	223	43	60405.26	60405.26	0.00	40600.20	19805.06	1	1	0
4244	254	4	235	45	11	197112.48	197112.48	0.00	138328.12	58784.36	1	1	0
4245	254	1000	804	131	33	41217.60	0.00	41217.60	28711.42	12506.18	1	0	1
4246	254	1	1191	216	36	61528.25	61528.25	0.00	46931.95	14596.30	1	1	0
4247	254	1	991	144	21	65416.49	65416.49	0.00	51197.63	14218.86	1	1	0
4248	254	1000	375	166	9	44594.50	0.00	44594.50	32027.18	12567.32	1	0	1
4249	254	1000	687	229	13	4307.56	0.00	4307.56	2842.99	1464.57	1	0	1
4250	254	1	551	61	38	147636.05	147636.05	0.00	106752.38	40883.67	1	1	0
4251	254	1000	1057	175	45	54951.05	0.00	54951.05	37139.66	17811.39	1	0	1
4252	254	3	372	103	33	17290.50	17290.50	0.00	14178.21	3112.29	1	1	0
4253	254	1000	728	84	5	153879.57	0.00	153879.57	111886.24	41993.33	1	0	1
4254	254	4	1231	93	40	8648.10	8648.10	0.00	5275.35	3372.75	1	1	0
4255	254	1	15	83	36	35637.24	35637.24	0.00	23876.96	11760.28	1	1	0
4256	254	1	1289	150	39	165938.07	165938.07	0.00	115929.94	50008.13	1	1	0
4257	254	1000	1197	149	13	129348.24	0.00	129348.24	94621.08	34727.16	1	0	1
4258	254	3	1038	150	42	34257.54	34257.54	0.00	25310.61	8946.93	1	1	0
4259	254	4	1005	79	3	138368.63	138368.63	0.00	99878.56	38490.07	1	1	0
4260	254	1000	1136	185	24	89144.58	0.00	89144.58	66118.98	23025.60	1	0	1
4261	254	1000	716	245	29	55517.09	0.00	55517.09	40803.87	14713.22	1	0	1
4262	254	1000	1217	68	27	55279.61	0.00	55279.61	33669.49	21610.12	1	0	1
4263	254	3	634	107	6	140783.01	140783.01	0.00	109712.89	31070.12	1	1	0
4264	254	1000	460	138	15	7721.54	0.00	7721.54	6177.23	1544.31	1	0	1
4265	254	1	939	189	46	45574.47	45574.47	0.00	35095.63	10478.84	1	1	0
4266	254	1000	1032	219	9	173397.41	0.00	173397.41	139432.56	33964.85	1	0	1
4267	254	1000	1093	14	23	116850.71	0.00	116850.71	100969.59	15881.12	1	0	1
4268	254	1000	515	171	23	72798.47	0.00	72798.47	56238.40	16560.07	1	0	1
4269	254	1000	201	190	7	153103.75	0.00	153103.75	125380.91	27722.84	1	0	1
4270	254	2	614	171	18	89169.75	89169.75	0.00	64882.59	24287.16	1	1	0
4271	254	1000	375	126	3	21998.23	0.00	21998.23	14337.76	7660.47	1	0	1
4272	254	4	600	62	9	113974.70	113974.70	0.00	96390.65	17584.05	1	1	0
4273	254	1000	814	119	18	107402.49	0.00	107402.49	81939.05	25463.44	1	0	1
4274	254	4	209	63	26	118135.20	118135.20	0.00	85241.02	32894.18	1	1	0
4275	254	1000	381	240	37	2435.23	0.00	2435.23	1567.27	867.96	1	0	1
4276	254	1	982	78	5	105262.23	105262.23	0.00	86315.06	18947.17	1	1	0
4277	254	4	182	126	28	174405.71	174405.71	0.00	134030.54	40375.17	1	1	0
4278	254	2	1115	253	22	89987.10	89987.10	0.00	69753.24	20233.86	1	1	0
4279	254	1000	766	221	18	41705.01	0.00	41705.01	28071.21	13633.80	1	0	1
4280	254	1000	1221	229	18	30408.42	0.00	30408.42	23030.12	7378.30	1	0	1
4281	254	1000	826	126	16	326.78	0.00	326.78	235.28	91.50	1	0	1
4282	254	1	617	8	27	117659.39	117659.39	0.00	82534.32	35125.07	1	1	0
4283	254	3	993	207	44	94482.81	94482.81	0.00	71131.54	23351.27	1	1	0
4284	254	2	952	21	46	267323.78	267323.78	0.00	174981.56	92342.22	1	1	0
4285	254	1	1112	198	29	96712.13	96712.13	0.00	74849.84	21862.29	1	1	0
4286	254	1000	1014	135	13	111032.70	0.00	111032.70	99439.44	11593.26	1	0	1
4287	254	1	479	9	50	112845.50	112845.50	0.00	75126.53	37718.97	1	1	0
4288	254	1000	554	81	38	176283.50	0.00	176283.50	140071.04	36212.46	1	0	1
4289	254	4	768	146	47	60914.37	60914.37	0.00	37003.47	23910.90	1	1	0
4290	254	1	588	224	47	99242.44	99242.44	0.00	75007.60	24234.84	1	1	0
4291	254	1000	1002	4	34	31240.32	0.00	31240.32	25929.48	5310.84	1	0	1
4292	254	1000	320	184	27	110327.25	0.00	110327.25	79112.89	31214.36	1	0	1
4293	254	3	492	35	44	100562.59	100562.59	0.00	81393.67	19168.92	1	1	0
4294	254	1000	213	114	29	84289.93	0.00	84289.93	51449.62	32840.31	1	0	1
4295	254	2	141	196	33	123357.30	123357.30	0.00	91725.65	31631.65	1	1	0
4296	254	3	1270	99	32	120334.49	120334.49	0.00	78571.64	41762.85	1	1	0
4297	254	1000	829	41	34	81564.76	0.00	81564.76	70074.73	11490.03	1	0	1
4298	254	2	841	153	8	4694.11	4694.11	0.00	3989.99	704.12	1	1	0
4299	254	1	467	43	33	68735.87	68735.87	0.00	53191.12	15544.75	1	1	0
4300	254	1000	1159	112	39	130894.29	0.00	130894.29	96326.31	34567.98	1	0	1
4301	254	2	255	207	34	47429.14	47429.14	0.00	36044.83	11384.31	1	1	0
4302	254	1	14	107	34	511.67	511.67	0.00	312.12	199.55	1	1	0
4303	254	2	1021	146	44	1279.06	1279.06	0.00	767.44	511.62	1	1	0
4304	254	3	505	122	27	97698.45	97698.45	0.00	78434.53	19263.92	1	1	0
4305	254	1000	972	163	34	50132.23	0.00	50132.23	41770.75	8361.48	1	0	1
4306	254	1000	423	139	50	104.74	0.00	104.74	75.41	29.33	1	0	1
4307	254	2	472	10	9	39380.22	39380.22	0.00	33523.99	5856.23	1	1	0
4308	254	1000	823	141	35	60031.53	0.00	60031.53	52227.45	7804.08	1	0	1
4309	254	3	547	232	6	105708.66	105708.66	0.00	83077.48	22631.18	1	1	0
4310	254	3	1209	71	13	13051.24	13051.24	0.00	10465.67	2585.57	1	1	0
4311	254	2	1106	39	12	8820.20	8820.20	0.00	5733.14	3087.06	1	1	0
4312	254	3	91	38	2	121241.05	121241.05	0.00	101335.62	19905.43	1	1	0
4313	254	1000	274	40	5	139328.05	0.00	139328.05	87339.00	51989.05	1	0	1
4314	254	1000	147	34	7	26692.84	0.00	26692.84	19290.96	7401.88	1	0	1
4315	254	2	204	195	47	177695.42	177695.42	0.00	126098.68	51596.74	1	1	0
4316	254	1000	1288	229	2	129867.13	0.00	129867.13	98205.93	31661.20	1	0	1
4317	254	1000	110	132	42	105657.36	0.00	105657.36	89472.67	16184.69	1	0	1
4318	254	1000	506	105	49	50803.10	0.00	50803.10	33630.50	17172.60	1	0	1
4319	254	1	246	38	14	97373.64	97373.64	0.00	75302.62	22071.02	1	1	0
4320	254	4	25	142	6	103547.07	103547.07	0.00	76650.63	26896.44	1	1	0
4321	254	1	272	144	33	53055.24	53055.24	0.00	47219.16	5836.08	1	1	0
4322	254	1000	256	158	23	156422.80	0.00	156422.80	115807.45	40615.35	1	0	1
4323	254	4	843	180	43	81561.87	81561.87	0.00	66065.13	15496.74	1	1	0
4324	254	1	980	141	19	38696.57	38696.57	0.00	29608.26	9088.31	1	1	0
4325	254	1000	826	55	44	190121.07	0.00	190121.07	144595.00	45526.07	1	0	1
4326	254	1000	996	212	12	16031.32	0.00	16031.32	11702.88	4328.44	1	0	1
4327	254	1000	758	18	42	143153.68	0.00	143153.68	110194.53	32959.15	1	0	1
4328	254	1000	1195	87	13	1620.82	0.00	1620.82	1134.58	486.24	1	0	1
4329	254	1000	799	241	49	146206.32	0.00	146206.32	112151.18	34055.14	1	0	1
4330	254	4	1040	17	32	40177.18	40177.18	0.00	27388.32	12788.86	1	1	0
4331	254	1000	37	29	14	36882.80	0.00	36882.80	32825.68	4057.12	1	0	1
4332	254	2	1209	73	43	126953.08	126953.08	0.00	96693.53	30259.55	1	1	0
4333	254	4	738	77	49	60686.69	60686.69	0.00	45318.25	15368.44	1	1	0
4334	254	4	588	180	44	141529.88	141529.88	0.00	97533.88	43996.00	1	1	0
4335	254	2	985	37	39	60762.40	60762.40	0.00	44601.25	16161.15	1	1	0
4336	254	1000	378	23	11	229.93	0.00	229.93	179.35	50.58	1	0	1
4337	254	1	1058	124	45	19688.62	19688.62	0.00	17129.10	2559.52	1	1	0
4338	254	1000	1174	159	13	34122.00	0.00	34122.00	29686.10	4435.90	1	0	1
4339	254	1000	1099	68	2	95159.94	0.00	95159.94	70658.70	24501.24	1	0	1
4340	254	3	714	178	44	96951.99	96951.99	0.00	68802.85	28149.14	1	1	0
4341	254	3	202	125	19	29148.84	29148.84	0.00	18072.30	11076.54	1	1	0
4342	254	1000	925	101	21	85843.45	0.00	85843.45	56600.68	29242.77	1	0	1
4343	254	3	795	245	44	7602.77	7602.77	0.00	6310.29	1292.48	1	1	0
4344	254	1	1259	236	32	164772.12	164772.12	0.00	125741.11	39031.01	1	1	0
4345	254	1	802	51	37	116822.71	116822.71	0.00	83214.31	33608.40	1	1	0
4346	254	3	33	237	3	126941.97	126941.97	0.00	108002.55	18939.42	1	1	0
4347	254	1000	1128	117	48	34453.42	0.00	34453.42	28164.65	6288.77	1	0	1
4348	254	3	139	72	9	12741.18	12741.18	0.00	10830.00	1911.18	1	1	0
4349	254	3	962	4	45	188624.37	188624.37	0.00	132642.53	55981.84	1	1	0
4350	254	1000	937	182	47	71814.06	0.00	71814.06	58316.00	13498.06	1	0	1
4351	254	1000	227	38	33	87416.25	0.00	87416.25	65516.41	21899.84	1	0	1
4352	254	3	372	234	13	5110.20	5110.20	0.00	3168.30	1941.90	1	1	0
4353	254	1000	1245	11	35	10551.90	0.00	10551.90	6331.10	4220.80	1	0	1
4354	254	3	894	25	41	106174.18	106174.18	0.00	78412.10	27762.08	1	1	0
4355	254	2	952	99	44	136430.73	136430.73	0.00	109401.81	27028.92	1	1	0
4356	254	1	149	124	8	93075.45	93075.45	0.00	74905.12	18170.33	1	1	0
4357	254	1000	563	170	22	60902.58	0.00	60902.58	45477.82	15424.76	1	0	1
4358	254	1000	708	16	27	128967.61	0.00	128967.61	84048.14	44919.47	1	0	1
4359	254	1000	1102	41	20	52616.00	0.00	52616.00	43494.32	9121.68	1	0	1
4360	254	4	120	129	27	73789.74	73789.74	0.00	54795.71	18994.03	1	1	0
4361	254	2	158	228	10	29451.94	29451.94	0.00	18364.13	11087.81	1	1	0
4362	254	1000	389	144	9	111148.22	0.00	111148.22	87361.02	23787.20	1	0	1
4363	254	1000	1013	3	26	73013.18	0.00	73013.18	47589.24	25423.94	1	0	1
4364	254	3	15	13	25	87464.46	87464.46	0.00	61727.94	25736.52	1	1	0
4365	254	1000	474	109	8	154336.63	0.00	154336.63	113666.01	40670.62	1	0	1
4366	254	1000	796	145	11	80413.84	0.00	80413.84	57099.86	23313.98	1	0	1
4367	254	2	1293	218	1	30604.25	30604.25	0.00	25948.78	4655.47	1	1	0
4368	254	1000	373	66	35	198553.52	0.00	198553.52	164529.81	34023.71	1	0	1
4369	254	1000	1029	40	42	100956.63	0.00	100956.63	76728.83	24227.80	1	0	1
4370	254	4	1217	146	39	66332.88	66332.88	0.00	50870.78	15462.10	1	1	0
4371	254	1000	930	157	29	131153.61	0.00	131153.61	108680.88	22472.73	1	0	1
4372	254	4	497	83	30	48017.80	48017.80	0.00	35533.20	12484.60	1	1	0
4373	254	4	703	45	12	37991.64	37991.64	0.00	27244.39	10747.25	1	1	0
4374	254	1000	843	24	17	39903.06	0.00	39903.06	29917.51	9985.55	1	0	1
4375	254	1000	52	18	35	132961.15	0.00	132961.15	100334.55	32626.60	1	0	1
4376	254	2	995	86	19	40014.72	40014.72	0.00	31426.70	8588.02	1	1	0
4377	254	2	737	48	31	10373.91	10373.91	0.00	8712.12	1661.79	1	1	0
4378	254	1000	550	168	25	5719.84	0.00	5719.84	4575.88	1143.96	1	0	1
4379	254	1000	1267	96	16	60802.92	0.00	60802.92	46754.14	14048.78	1	0	1
4380	254	3	64	89	35	18384.99	18384.99	0.00	14340.30	4044.69	1	1	0
4381	254	4	1110	104	26	16174.71	16174.71	0.00	9866.58	6308.13	1	1	0
4382	254	2	685	58	45	24034.80	24034.80	0.00	19708.56	4326.24	1	1	0
4383	254	1000	20	43	4	152921.52	0.00	152921.52	111382.06	41539.46	1	0	1
4384	254	1000	632	231	5	35409.27	0.00	35409.27	31210.76	4198.51	1	0	1
4385	254	1000	1055	219	14	148610.70	0.00	148610.70	111087.66	37523.04	1	0	1
4386	254	1000	1068	228	33	76626.00	0.00	76626.00	51339.40	25286.60	1	0	1
4387	254	2	763	97	45	44349.90	44349.90	0.00	37541.64	6808.26	1	1	0
4388	254	4	1115	96	23	88692.30	88692.30	0.00	64023.42	24668.88	1	1	0
4389	254	2	995	126	20	182342.22	182342.22	0.00	149712.75	32629.47	1	1	0
4390	254	1	2	25	37	90340.87	90340.87	0.00	64608.37	25732.50	1	1	0
4391	254	3	526	182	2	288690.28	288690.28	0.00	226217.30	62472.98	1	1	0
4392	254	1000	1125	151	31	198500.49	0.00	198500.49	148573.87	49926.62	1	0	1
4393	254	1000	1141	36	35	75994.71	0.00	75994.71	52142.18	23852.53	1	0	1
4394	254	2	35	156	21	122772.76	122772.76	0.00	99463.64	23309.12	1	1	0
4395	254	3	1289	133	21	17128.86	17128.86	0.00	10277.33	6851.53	1	1	0
4396	254	1000	1049	203	48	208787.90	0.00	208787.90	156458.70	52329.20	1	0	1
4397	254	4	963	94	22	108045.04	108045.04	0.00	75491.36	32553.68	1	1	0
4398	254	1	1210	4	8	72342.88	72342.88	0.00	53706.40	18636.48	1	1	0
4399	254	1000	1296	241	37	111885.82	0.00	111885.82	89090.17	22795.65	1	0	1
4400	254	1000	252	129	2	46795.38	0.00	46795.38	35049.60	11745.78	1	0	1
4401	254	1000	1206	179	27	79642.33	0.00	79642.33	61642.93	17999.40	1	0	1
4402	254	1000	927	239	2	172983.31	0.00	172983.31	124084.13	48899.18	1	0	1
4403	254	2	1130	252	42	35609.16	35609.16	0.00	21760.38	13848.78	1	1	0
4404	254	3	1131	192	5	14391.94	14391.94	0.00	10650.03	3741.91	1	1	0
4405	254	1000	884	72	34	239148.25	0.00	239148.25	160600.70	78547.55	1	0	1
4406	254	1000	420	46	28	49447.93	0.00	49447.93	41075.90	8372.03	1	0	1
4407	254	1000	363	225	35	52294.82	0.00	52294.82	43824.61	8470.21	1	0	1
4408	254	1	501	220	38	6709.16	6709.16	0.00	4897.68	1811.48	1	1	0
4409	254	1000	1103	111	8	82345.79	0.00	82345.79	64291.24	18054.55	1	0	1
4410	254	4	382	113	2	62845.08	62845.08	0.00	51763.93	11081.15	1	1	0
4411	254	4	136	36	32	227611.36	227611.36	0.00	164463.86	63147.50	1	1	0
4412	254	1000	1049	116	16	59697.47	0.00	59697.47	44700.97	14996.50	1	0	1
4413	254	4	266	195	50	16829.51	16829.51	0.00	13336.64	3492.87	1	1	0
4414	254	1000	499	181	47	85343.08	0.00	85343.08	63854.32	21488.76	1	0	1
4415	254	1	1175	158	7	58336.17	58336.17	0.00	44247.80	14088.37	1	1	0
4416	254	3	348	210	33	204515.27	204515.27	0.00	165303.75	39211.52	1	1	0
4417	254	1000	584	128	43	110551.64	0.00	110551.64	82351.38	28200.26	1	0	1
4418	254	1000	542	208	46	49891.90	0.00	49891.90	40660.07	9231.83	1	0	1
4419	254	1000	1284	30	31	180636.57	0.00	180636.57	126564.70	54071.87	1	0	1
4420	254	1000	804	173	41	25437.21	0.00	25437.21	20604.15	4833.06	1	0	1
4421	254	1000	367	1	44	42494.78	0.00	42494.78	31769.78	10725.00	1	0	1
4422	254	1	432	139	19	75685.42	75685.42	0.00	59343.35	16342.07	1	1	0
4423	254	4	626	174	19	138930.93	138930.93	0.00	95235.02	43695.91	1	1	0
4424	254	3	76	205	17	34898.37	34898.37	0.00	21082.18	13816.19	1	1	0
4425	254	2	656	147	31	158617.92	158617.92	0.00	117294.62	41323.30	1	1	0
4426	254	1000	422	88	33	92047.98	0.00	92047.98	71554.61	20493.37	1	0	1
4427	254	1000	335	104	45	18290.58	0.00	18290.58	12254.70	6035.88	1	0	1
4428	254	3	61	84	18	173081.78	173081.78	0.00	115051.82	58029.96	1	1	0
4429	254	1000	377	35	22	45745.61	0.00	45745.61	37593.66	8151.95	1	0	1
4430	254	2	890	206	40	57122.73	57122.73	0.00	44555.70	12567.03	1	1	0
4431	254	1000	123	220	21	30632.80	0.00	30632.80	25731.60	4901.20	1	0	1
4432	254	1	1229	24	4	99823.65	99823.65	0.00	76056.36	23767.29	1	1	0
4433	254	4	400	126	25	41643.41	41643.41	0.00	29159.29	12484.12	1	1	0
4434	254	1000	340	174	25	203670.66	0.00	203670.66	157750.08	45920.58	1	0	1
4435	254	1000	1143	106	16	150272.90	0.00	150272.90	116263.98	34008.92	1	0	1
4436	254	3	597	13	1	82281.75	82281.75	0.00	67486.07	14795.68	1	1	0
4437	254	3	541	19	38	105218.60	105218.60	0.00	80435.93	24782.67	1	1	0
4438	254	1000	270	212	26	206188.76	0.00	206188.76	155281.76	50907.00	1	0	1
4439	254	4	767	191	42	11863.47	11863.47	0.00	8304.42	3559.05	1	1	0
4440	254	3	252	83	44	30004.56	30004.56	0.00	20092.47	9912.09	1	1	0
4441	254	1	1134	235	44	13589.93	13589.93	0.00	9687.90	3902.03	1	1	0
4442	254	3	579	148	45	66028.01	66028.01	0.00	47498.15	18529.86	1	1	0
4443	254	4	1206	220	41	118236.56	118236.56	0.00	87791.69	30444.87	1	1	0
4444	254	1000	334	189	36	71866.48	0.00	71866.48	59541.26	12325.22	1	0	1
4445	254	1000	545	62	1	53672.16	0.00	53672.16	40503.31	13168.85	1	0	1
4446	254	1000	916	143	39	4447.06	0.00	4447.06	3024.00	1423.06	1	0	1
4447	254	4	530	108	20	59867.40	59867.40	0.00	50887.30	8980.10	1	1	0
4448	254	4	780	203	4	135150.43	135150.43	0.00	102552.00	32598.43	1	1	0
4449	254	3	179	74	34	111242.92	111242.92	0.00	84869.12	26373.80	1	1	0
4450	254	1000	134	174	14	49929.20	0.00	49929.20	42939.12	6990.08	1	0	1
4451	254	3	326	207	37	115411.80	115411.80	0.00	87927.21	27484.59	1	1	0
4452	254	3	121	170	22	45980.76	45980.76	0.00	32548.87	13431.89	1	1	0
4453	254	1	616	64	6	120025.04	120025.04	0.00	89108.49	30916.55	1	1	0
4454	254	1000	1124	183	27	149381.85	0.00	149381.85	107788.76	41593.09	1	0	1
4455	254	3	151	156	31	161278.53	161278.53	0.00	127210.60	34067.93	1	1	0
4456	254	4	917	79	24	168724.75	168724.75	0.00	122395.94	46328.81	1	1	0
4457	254	1	303	119	34	39082.76	39082.76	0.00	30926.68	8156.08	1	1	0
4458	254	1000	667	46	16	254055.85	0.00	254055.85	205958.26	48097.59	1	0	1
4459	254	2	818	203	3	126417.81	126417.81	0.00	93799.99	32617.82	1	1	0
4460	254	1000	511	211	43	40263.80	0.00	40263.80	28530.14	11733.66	1	0	1
4461	254	1000	900	177	8	272421.07	0.00	272421.07	183703.38	88717.69	1	0	1
4462	254	1000	470	234	42	158592.81	0.00	158592.81	121020.11	37572.70	1	0	1
4463	254	2	408	53	30	143976.10	143976.10	0.00	104702.81	39273.29	1	1	0
4464	254	3	1035	178	19	132844.44	132844.44	0.00	101283.42	31561.02	1	1	0
4465	254	2	400	213	28	72127.08	72127.08	0.00	59363.20	12763.88	1	1	0
4466	254	2	1083	90	45	69515.52	69515.52	0.00	57392.14	12123.38	1	1	0
4467	254	1	1061	205	44	118310.31	118310.31	0.00	77700.57	40609.74	1	1	0
4468	254	3	1288	30	33	29435.17	29435.17	0.00	22892.45	6542.72	1	1	0
4469	254	1	880	196	34	134872.79	134872.79	0.00	108890.05	25982.74	1	1	0
4470	254	2	1261	125	45	46085.46	46085.46	0.00	41016.06	5069.40	1	1	0
4471	254	1000	12	205	36	130974.69	0.00	130974.69	91572.49	39402.20	1	0	1
4472	254	1	178	143	32	76938.43	76938.43	0.00	56257.08	20681.35	1	1	0
4473	254	1000	417	154	40	123981.28	0.00	123981.28	83788.08	40193.20	1	0	1
4474	254	1	758	126	1	189898.70	189898.70	0.00	136156.43	53742.27	1	1	0
4475	254	4	44	100	16	89834.00	89834.00	0.00	64511.30	25322.70	1	1	0
4476	254	1	182	92	46	20943.05	20943.05	0.00	13237.47	7705.58	1	1	0
4477	254	1000	144	80	49	171456.38	0.00	171456.38	114788.04	56668.34	1	0	1
4478	254	1000	508	186	39	140412.98	0.00	140412.98	103598.07	36814.91	1	0	1
4479	254	1000	400	118	11	40022.32	0.00	40022.32	28623.82	11398.50	1	0	1
4480	254	1000	253	186	29	83117.80	0.00	83117.80	64714.18	18403.62	1	0	1
4481	254	4	636	22	22	4128.91	4128.91	0.00	3592.15	536.76	1	1	0
4482	254	1000	334	72	32	159620.38	0.00	159620.38	129349.68	30270.70	1	0	1
4483	254	1000	1094	236	10	46089.74	0.00	46089.74	35668.51	10421.23	1	0	1
4484	254	1000	1150	163	31	63092.46	0.00	63092.46	44308.32	18784.14	1	0	1
4485	254	1	1288	12	4	104758.50	104758.50	0.00	81831.19	22927.31	1	1	0
4486	254	1000	772	132	47	10444.50	0.00	10444.50	6893.34	3551.16	1	0	1
4487	254	1000	1088	65	5	47551.31	0.00	47551.31	32277.14	15274.17	1	0	1
4488	254	4	1267	58	39	31483.50	31483.50	0.00	24242.30	7241.20	1	1	0
4489	254	1000	570	78	34	114107.39	0.00	114107.39	87046.20	27061.19	1	0	1
4490	254	1	12	85	39	75729.20	75729.20	0.00	60583.40	15145.80	1	1	0
4491	254	2	1040	249	10	49239.76	49239.76	0.00	30036.24	19203.52	1	1	0
4492	254	1000	1195	223	4	107019.92	0.00	107019.92	77311.42	29708.50	1	0	1
4493	254	1000	997	51	30	44201.46	0.00	44201.46	32719.28	11482.18	1	0	1
4494	254	4	442	243	46	105669.39	105669.39	0.00	80361.39	25308.00	1	1	0
4495	254	1000	147	68	23	6924.71	0.00	6924.71	5193.53	1731.18	1	0	1
4496	254	1000	1289	247	24	28279.45	0.00	28279.45	22449.77	5829.68	1	0	1
4497	254	1	411	142	20	16112.84	16112.84	0.00	12245.76	3867.08	1	1	0
4498	254	1	460	203	49	207785.71	207785.71	0.00	157843.39	49942.32	1	1	0
4499	254	1000	1118	141	43	80061.91	0.00	80061.91	63692.84	16369.07	1	0	1
4500	254	1000	1219	90	13	73502.51	0.00	73502.51	53539.73	19962.78	1	0	1
4501	254	1	1100	241	35	117760.25	117760.25	0.00	85651.00	32109.25	1	1	0
4502	254	1	640	36	39	77450.14	77450.14	0.00	63168.06	14282.08	1	1	0
4503	254	1000	416	147	1	71297.25	0.00	71297.25	46957.10	24340.15	1	0	1
4504	254	3	67	42	19	94337.46	94337.46	0.00	62586.50	31750.96	1	1	0
4505	254	4	953	209	10	41514.17	41514.17	0.00	29435.18	12078.99	1	1	0
4506	254	1000	518	36	13	42417.34	0.00	42417.34	29540.08	12877.26	1	0	1
4507	254	3	1160	10	25	157457.76	157457.76	0.00	128145.69	29312.07	1	1	0
4508	254	1000	785	230	14	106881.17	0.00	106881.17	77775.74	29105.43	1	0	1
4509	254	2	534	86	42	42075.11	42075.11	0.00	33897.64	8177.47	1	1	0
4510	254	1000	323	182	27	208952.62	0.00	208952.62	161152.99	47799.63	1	0	1
4511	254	1000	918	35	47	206946.66	0.00	206946.66	143646.07	63300.59	1	0	1
4512	254	1	806	72	37	23876.92	23876.92	0.00	15758.76	8118.16	1	1	0
4513	254	1000	3	44	6	90420.68	0.00	90420.68	58990.38	31430.30	1	0	1
4514	254	1000	598	222	45	27947.51	0.00	27947.51	22025.84	5921.67	1	0	1
4515	254	1000	897	15	50	80186.05	0.00	80186.05	51916.05	28270.00	1	0	1
4516	254	1000	383	12	9	81586.08	0.00	81586.08	61099.68	20486.40	1	0	1
4517	254	1000	882	253	50	54774.49	0.00	54774.49	41696.86	13077.63	1	0	1
4518	254	1000	1040	115	28	63435.47	0.00	63435.47	46767.13	16668.34	1	0	1
4519	254	1000	534	143	14	125879.43	0.00	125879.43	91457.60	34421.83	1	0	1
4520	254	1	84	18	21	30335.34	30335.34	0.00	21899.04	8436.30	1	1	0
4521	254	1000	121	197	44	70760.22	0.00	70760.22	53037.78	17722.44	1	0	1
4522	254	1000	1025	148	35	114007.80	0.00	114007.80	89871.40	24136.40	1	0	1
4523	254	1000	432	16	4	40452.56	0.00	40452.56	35004.08	5448.48	1	0	1
4524	254	2	700	65	14	143332.74	143332.74	0.00	103057.39	40275.35	1	1	0
4525	254	4	33	166	4	85589.79	85589.79	0.00	72905.98	12683.81	1	1	0
4526	254	1000	34	240	4	119808.56	0.00	119808.56	93257.30	26551.26	1	0	1
4527	254	1000	977	185	24	61117.90	0.00	61117.90	53172.60	7945.30	1	0	1
4528	254	1	375	23	8	170432.47	170432.47	0.00	122592.18	47840.29	1	1	0
4529	254	1000	270	49	42	44360.88	0.00	44360.88	34117.17	10243.71	1	0	1
4530	254	3	15	116	27	55509.66	55509.66	0.00	33860.88	21648.78	1	1	0
4531	254	4	751	35	2	50999.47	50999.47	0.00	44786.36	6213.11	1	1	0
4532	254	3	363	250	11	215864.92	215864.92	0.00	175087.15	40777.77	1	1	0
4533	254	1000	1256	139	3	57292.46	0.00	57292.46	42626.49	14665.97	1	0	1
4534	254	1000	907	5	33	40770.75	0.00	40770.75	36097.57	4673.18	1	0	1
4535	254	3	515	196	48	29971.93	29971.93	0.00	20302.05	9669.88	1	1	0
4536	254	4	135	39	31	93102.33	93102.33	0.00	64324.66	28777.67	1	1	0
4537	254	3	415	216	15	82298.24	82298.24	0.00	58305.77	23992.47	1	1	0
4538	254	1000	245	171	15	41001.90	0.00	41001.90	33159.34	7842.56	1	0	1
4539	254	1	514	153	13	88559.96	88559.96	0.00	68309.34	20250.62	1	1	0
4540	254	1000	139	193	12	39571.31	0.00	39571.31	32204.90	7366.41	1	0	1
4541	254	2	839	120	33	35815.10	35815.10	0.00	27322.50	8492.60	1	1	0
4542	254	1000	863	124	39	14601.16	0.00	14601.16	10901.83	3699.33	1	0	1
4543	254	1000	266	83	8	112437.28	0.00	112437.28	88929.56	23507.72	1	0	1
4544	254	1000	206	100	26	27194.68	0.00	27194.68	24203.28	2991.40	1	0	1
4545	254	1	736	21	9	37271.23	37271.23	0.00	30909.73	6361.50	1	1	0
4546	254	1000	43	32	35	89374.57	0.00	89374.57	70739.11	18635.46	1	0	1
4547	254	1000	378	101	18	67179.52	0.00	67179.52	45500.68	21678.84	1	0	1
4548	254	1000	844	81	40	7082.03	0.00	7082.03	4461.68	2620.35	1	0	1
4549	254	2	184	240	4	163602.11	163602.11	0.00	121946.24	41655.87	1	1	0
4550	254	1000	833	239	1	59618.37	0.00	59618.37	46521.60	13096.77	1	0	1
4551	254	3	98	172	6	65738.74	65738.74	0.00	49680.04	16058.70	1	1	0
4552	254	1	454	238	43	55280.80	55280.80	0.00	39426.32	15854.48	1	1	0
4553	254	1000	190	236	46	14112.12	0.00	14112.12	10019.61	4092.51	1	0	1
4554	254	1000	90	34	15	6474.66	0.00	6474.66	4920.74	1553.92	1	0	1
4555	254	1000	103	32	10	25688.99	0.00	25688.99	20112.60	5576.39	1	0	1
4556	254	4	597	246	14	79821.60	79821.60	0.00	56930.43	22891.17	1	1	0
4557	254	2	642	232	25	84971.82	84971.82	0.00	57786.66	27185.16	1	1	0
4558	254	1000	131	226	2	60944.55	0.00	60944.55	52017.67	8926.88	1	0	1
4559	254	4	1054	106	42	138993.99	138993.99	0.00	108256.75	30737.24	1	1	0
4560	254	4	946	196	16	35418.96	35418.96	0.00	29751.92	5667.04	1	1	0
4561	254	4	326	148	7	194565.78	194565.78	0.00	148866.37	45699.41	1	1	0
4562	254	3	1108	150	23	13562.66	13562.66	0.00	9900.74	3661.92	1	1	0
4563	254	2	666	152	37	38993.42	38993.42	0.00	32482.00	6511.42	1	1	0
4564	254	1	529	110	26	58379.11	58379.11	0.00	42614.40	15764.71	1	1	0
4565	254	2	191	150	21	144378.87	144378.87	0.00	106636.91	37741.96	1	1	0
4566	254	3	109	38	32	69770.56	69770.56	0.00	50067.12	19703.44	1	1	0
4567	254	1000	1141	168	7	212344.88	0.00	212344.88	168613.57	43731.31	1	0	1
4568	254	1000	440	156	36	50545.39	0.00	50545.39	39434.11	11111.28	1	0	1
4569	254	2	210	62	10	120511.72	120511.72	0.00	91767.01	28744.71	1	1	0
4570	254	1000	166	186	25	68427.81	0.00	68427.81	44537.20	23890.61	1	0	1
4571	254	1000	828	248	34	18585.76	0.00	18585.76	12080.74	6505.02	1	0	1
4572	254	3	992	104	15	119511.90	119511.90	0.00	87860.32	31651.58	1	1	0
4573	254	1000	743	119	1	21673.23	0.00	21673.23	17298.77	4374.46	1	0	1
4574	254	3	804	78	19	33944.12	33944.12	0.00	25302.23	8641.89	1	1	0
4575	254	2	204	116	19	113435.93	113435.93	0.00	90384.27	23051.66	1	1	0
4576	254	2	778	102	17	12990.37	12990.37	0.00	11317.06	1673.31	1	1	0
4577	254	1	56	229	8	190911.48	190911.48	0.00	157202.02	33709.46	1	1	0
4578	254	4	197	168	35	77810.59	77810.59	0.00	54179.39	23631.20	1	1	0
4579	254	2	389	84	39	14312.28	14312.28	0.00	9159.87	5152.41	1	1	0
4580	254	1000	402	199	47	124331.07	0.00	124331.07	101871.09	22459.98	1	0	1
4581	254	1000	473	193	6	99372.69	0.00	99372.69	71557.59	27815.10	1	0	1
4582	254	1000	454	37	14	29831.61	0.00	29831.61	22970.34	6861.27	1	0	1
4583	254	1	977	216	41	189933.64	189933.64	0.00	142486.10	47447.54	1	1	0
4584	254	4	384	198	44	91107.62	91107.62	0.00	68481.55	22626.07	1	1	0
4585	254	4	648	72	12	60665.05	60665.05	0.00	47633.42	13031.63	1	1	0
4586	254	1	900	103	24	44279.42	44279.42	0.00	35214.00	9065.42	1	1	0
4587	254	1	456	208	19	208896.57	208896.57	0.00	148259.30	60637.27	1	1	0
4588	254	1000	1043	172	19	68625.11	0.00	68625.11	49048.97	19576.14	1	0	1
4589	254	3	501	242	21	109581.44	109581.44	0.00	80432.09	29149.35	1	1	0
4590	254	1000	1135	133	8	130477.78	0.00	130477.78	97191.03	33286.75	1	0	1
4591	254	2	462	131	3	71830.84	71830.84	0.00	52903.70	18927.14	1	1	0
4592	254	4	21	116	4	82211.13	82211.13	0.00	65261.46	16949.67	1	1	0
4593	254	3	491	105	17	45318.50	45318.50	0.00	28097.50	17221.00	1	1	0
4594	254	3	923	164	14	83148.89	83148.89	0.00	67496.48	15652.41	1	1	0
4595	254	1000	448	75	33	124119.08	0.00	124119.08	87413.49	36705.59	1	0	1
4596	254	1	894	147	17	59181.57	59181.57	0.00	38839.51	20342.06	1	1	0
4597	254	4	1123	127	28	25952.00	25952.00	0.00	17858.12	8093.88	1	1	0
4598	254	2	678	70	24	78578.37	78578.37	0.00	48718.62	29859.75	1	1	0
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

SELECT pg_catalog.setval('public.dim_date_date_id_seq', 879, true);


--
-- Name: dim_employee_employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_employee_employee_id_seq', 1, false);


--
-- Name: dim_month_month_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_month_month_id_seq', 36, true);


--
-- Name: dim_product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_product_product_id_seq', 1, false);


--
-- Name: dim_quarter_quarter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.dim_quarter_quarter_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.dim_year_year_id_seq', 3, true);


--
-- Name: fact_production_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.fact_production_id_seq', 13175, true);


--
-- Name: fact_sales_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.fact_sales_order_id_seq', 4598, true);


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
-- Name: view_fact_production; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: thangquang
--

REFRESH MATERIALIZED VIEW public.view_fact_production;


--
-- Name: view_fact_sale_orders; Type: MATERIALIZED VIEW DATA; Schema: public; Owner: thangquang
--

REFRESH MATERIALIZED VIEW public.view_fact_sale_orders;


--
-- PostgreSQL database dump complete
--

