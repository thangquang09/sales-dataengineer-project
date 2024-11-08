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
1	HÃ  Ná»™i
2	Há»“ ChÃ­ Minh
3	Háº£i PhÃ²ng
4	Cáº§n ThÆ¡
5	ÄÃ  Náºµng
6	BiÃªn HÃ²a
7	Háº£i DÆ°Æ¡ng
8	Huáº¿
9	Thuáº­n An
10	Thá»§ Äá»©c
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
4917	852	35	855	3	5945.49	1605.27
4918	177	10	640	8	44058.08	12776.88
4919	177	10	540	4	21924.08	2192.40
4920	833	6	263	8	74978.72	14245.92
4921	177	24	137	5	31931.60	10218.10
4922	177	41	702	3	26497.89	7419.42
4923	177	31	29	10	60257.70	13256.70
4924	344	49	709	1	7182.84	2083.02
4925	177	35	862	3	17859.24	4286.22
4926	177	45	200	1	7889.32	1814.54
4927	177	40	723	8	42403.28	8480.64
4928	177	43	958	8	69459.04	12502.64
4929	177	31	236	10	55698.30	15595.50
4930	177	22	592	3	29453.97	5596.26
4931	177	46	11	3	7340.94	2936.37
4932	177	14	595	9	74115.99	13340.88
4933	177	27	222	6	51831.24	5183.10
4934	508	10	719	9	31997.25	7679.34
4935	177	28	647	1	6978.27	767.61
4936	177	10	874	4	11439.32	2059.08
4937	177	28	567	6	44009.40	4841.04
4938	177	2	664	2	2347.08	258.18
4939	825	21	657	6	2560.32	409.68
4940	177	25	516	1	3455.90	1244.12
4941	177	38	940	2	12774.46	1660.68
4942	337	26	321	4	23255.68	5581.36
4943	177	6	45	4	35417.88	4958.52
4944	177	7	317	1	3993.24	1517.43
4945	177	28	135	11	58888.94	8833.33
4946	177	24	317	4	15972.96	6069.72
4947	177	47	238	9	63915.66	24287.94
4948	177	30	964	10	94862.10	24664.10
4949	177	32	662	8	20296.64	4059.36
4950	104	19	887	3	23518.02	7760.94
4951	156	46	693	4	19083.04	6869.88
4952	177	30	692	9	33005.16	3960.63
4953	177	17	164	7	18000.57	3960.11
4954	799	5	227	2	14822.10	4891.30
4955	177	30	915	8	19900.16	4179.04
4956	177	9	649	7	60714.50	22464.33
4957	177	13	113	2	2352.96	564.72
4958	177	29	659	10	58229.90	12810.60
4959	177	36	403	10	6938.40	763.20
4960	177	31	908	3	17874.51	6613.56
4961	850	34	418	6	9272.76	1576.38
4962	177	37	800	3	29397.21	5291.49
4963	177	20	225	3	16965.06	5259.18
4964	177	45	589	7	38504.06	15401.61
4965	177	8	968	3	11242.32	2922.99
4966	177	6	933	6	48329.04	17398.44
4967	177	35	963	6	38256.66	7268.76
4968	177	36	836	10	72090.30	15859.90
4969	177	49	332	5	48339.75	12568.35
4970	164	8	992	5	4052.05	1215.60
4971	177	31	569	1	4145.80	870.62
4972	177	35	635	3	8318.04	1164.54
4973	177	41	736	17	110538.59	12159.25
4974	177	43	87	10	58864.00	7063.70
4975	177	25	577	8	62480.64	10621.68
4976	177	6	872	3	2550.78	331.59
4977	615	42	308	6	7674.36	3069.72
4978	177	10	132	10	30484.30	10059.80
4979	177	15	493	4	9995.48	1899.16
4980	177	4	180	8	28456.00	11382.40
4981	177	15	38	4	19572.08	5284.48
4982	177	14	718	4	34518.36	7939.24
4983	138	42	492	2	4103.70	943.86
4984	852	35	696	10	69104.20	19349.20
4985	177	31	135	2	10707.08	1606.06
4986	177	30	524	19	127282.90	29275.01
4987	177	16	465	7	25200.21	5796.07
4988	177	34	998	3	21955.50	4171.53
4989	177	23	882	4	3508.80	807.04
4990	177	47	170	2	18565.12	7054.74
4991	177	25	260	2	978.94	186.00
4992	177	45	673	7	36764.70	10661.77
4993	34	3	952	6	120.60	22.92
4994	57	19	639	4	34612.52	11768.24
4995	177	14	457	7	11621.68	3602.69
4996	177	33	688	5	44576.40	5349.15
4997	177	20	468	7	14661.22	1759.38
4998	177	8	778	4	22833.00	8676.56
4999	177	47	279	9	32224.95	7411.77
5000	177	27	142	6	27243.18	7083.24
5001	177	30	27	7	32124.33	10922.24
5002	177	50	268	1	6880.19	688.02
5003	177	45	587	10	1486.50	431.10
5004	177	43	266	7	46245.01	16185.75
5005	137	45	797	7	47773.67	10510.22
5006	177	34	449	3	26082.36	3912.36
5007	720	43	975	1	1249.52	162.44
5008	177	31	99	6	28347.96	11339.16
5009	177	45	400	6	32216.82	9342.90
5010	177	35	844	10	90113.90	35144.40
5011	177	27	64	1	2464.22	837.83
5012	177	18	861	9	4773.96	1575.45
5013	177	28	436	1	6840.30	1710.07
5014	748	35	821	2	14064.92	4782.08
5015	177	35	405	7	38468.08	11925.13
5016	177	10	134	2	9669.54	1643.82
5017	524	44	241	6	35144.64	8083.26
5018	177	1	558	3	29842.56	10146.48
5019	177	42	83	7	55040.09	19264.00
5020	696	7	328	10	79615.90	25477.10
5021	177	33	202	3	26358.45	4480.95
5022	177	36	423	9	80602.47	14508.45
5023	177	8	893	10	62242.30	19917.50
5024	177	32	974	8	68571.84	23314.40
5025	177	29	200	7	55225.24	12701.78
5026	177	20	351	6	1252.14	125.22
5027	177	8	467	8	76229.36	26680.24
5028	792	3	971	8	69874.64	9083.68
5029	716	28	811	5	49058.85	19623.55
5030	177	14	388	11	61379.78	15958.69
5031	177	3	490	2	9601.94	1344.28
5032	177	20	211	6	10444.50	3551.16
5033	124	10	940	1	6387.23	830.34
5034	565	48	571	6	37752.60	4152.78
5035	177	12	138	3	13194.09	1451.34
5036	177	8	95	2	9603.56	2496.92
5037	177	32	146	2	6542.48	785.10
5038	177	25	353	6	13131.96	3676.92
5039	177	33	941	6	50077.62	16525.62
5040	177	10	67	6	41979.36	6716.70
5041	177	4	753	3	15238.11	3961.92
5042	177	49	726	8	34678.32	11443.84
5043	339	18	2	4	8040.48	1206.08
5044	177	39	671	5	12869.90	1930.50
5045	177	11	806	1	5033.13	1711.26
5046	177	9	257	10	47292.00	6620.90
5047	177	13	907	8	401.12	48.16
5048	192	35	775	1	205.96	26.77
5049	177	9	24	3	3905.52	820.17
5050	177	45	461	3	20999.01	2309.88
5051	177	12	570	2	4247.24	1444.06
5052	177	45	1000	8	17788.24	5692.24
5053	177	41	971	9	78608.97	10219.14
5054	816	40	780	3	19224.69	4229.43
5055	451	37	252	7	54047.56	6485.71
5056	177	25	181	4	14911.20	4771.60
5057	177	49	873	1	3110.54	591.00
5058	177	31	815	5	32881.55	5589.85
5059	177	15	940	1	6387.23	830.34
5060	177	2	814	5	42821.50	14987.50
5061	177	43	187	2	2998.52	329.84
5062	565	48	556	2	12445.20	2240.14
5063	177	27	33	10	39544.90	11863.50
5064	177	18	606	12	110756.64	42087.48
5065	177	4	564	2	12824.28	1410.68
5066	177	40	59	5	18827.20	5083.35
5067	177	39	623	1	7168.32	1433.66
5068	177	20	879	2	9806.70	2451.68
5069	177	12	581	10	50463.90	12616.00
5070	177	34	414	5	41519.30	11625.40
5071	177	29	132	9	27435.87	9053.82
5072	177	21	347	7	50610.35	10628.17
5073	177	43	885	1	935.10	355.34
5074	177	19	758	2	9544.38	3722.30
5075	177	17	458	9	63465.57	18405.00
5076	177	44	237	3	23495.31	5403.93
5077	177	14	610	9	78657.21	9438.84
5078	177	4	58	7	66914.96	13383.02
5079	177	6	386	9	68511.33	23293.89
5080	177	31	43	3	28956.93	4922.67
5081	177	17	923	7	22795.50	5698.84
5082	177	40	172	2	218.12	76.34
5083	177	34	667	1	5353.34	2141.34
5084	177	12	871	1	1673.18	184.05
5085	177	14	371	2	8238.56	2142.02
5086	177	49	266	7	46245.01	16185.75
5087	177	6	704	2	17653.40	6531.76
5088	177	7	54	6	862.38	258.72
5089	177	17	379	3	20396.01	2243.55
5090	177	46	800	4	39196.28	7055.32
5091	177	36	558	3	29842.56	10146.48
5092	177	30	353	8	17509.28	4902.56
5093	325	6	495	5	28292.90	8770.80
5094	177	18	991	1	3248.32	519.73
5095	175	1	795	10	66721.00	22017.90
5096	177	33	530	9	36109.17	5777.46
5097	177	37	915	3	7462.56	1567.14
5098	83	21	483	7	51678.27	8268.54
5099	177	15	536	8	56563.28	15272.08
5100	177	19	857	8	27523.76	2752.40
5101	177	30	457	2	3320.48	1029.34
5102	177	31	191	7	21380.94	3634.75
5103	177	15	850	5	43178.00	8635.60
5104	177	30	745	5	40777.65	6932.20
5105	177	44	495	5	28292.90	8770.80
5106	796	16	258	3	27754.83	10824.39
5107	115	29	613	6	37549.44	5256.90
5108	57	19	646	6	34979.22	10143.96
5109	177	20	383	4	31390.72	6592.04
5110	177	22	318	8	29539.20	5907.84
5111	177	22	901	2	3359.12	638.24
5112	177	15	417	2	10452.36	3240.24
5113	177	23	716	9	24649.47	8627.31
5114	177	15	316	10	37878.80	13636.40
5115	660	4	300	4	31607.28	10114.32
5116	177	46	699	7	28081.13	7301.07
5117	177	12	620	9	34098.30	12275.37
5118	177	39	506	1	549.41	197.79
5119	177	34	417	5	26130.90	8100.60
5120	731	1	269	10	85069.10	17013.80
5121	177	14	653	5	17534.75	3682.30
5122	177	44	434	4	33724.44	6407.64
5123	177	1	772	4	19662.04	5505.36
5124	177	47	785	4	18604.12	5581.24
5125	177	10	908	3	17874.51	6613.56
5126	177	11	672	6	44121.42	8383.08
5127	177	37	327	2	2815.10	788.22
5128	177	22	913	8	26168.00	4971.92
5129	177	31	746	6	27276.66	10092.36
5130	177	47	783	4	34160.56	11614.60
5131	798	2	954	10	79444.00	27805.40
5132	461	40	465	3	10800.09	2484.03
5133	177	8	409	8	49929.20	6990.08
5134	177	3	147	9	73443.51	16157.61
5135	177	47	414	8	66430.88	18600.64
5136	177	7	945	2	15996.98	2879.46
5137	177	3	561	10	19797.80	4949.40
5138	177	23	655	2	13834.08	2490.14
5139	177	38	861	3	1591.32	525.15
5140	177	18	55	8	69168.00	8300.16
5141	177	9	694	3	145.44	21.81
5142	177	44	990	10	74935.10	15736.40
5143	177	48	390	4	6549.88	1048.00
5144	177	14	893	10	62242.30	19917.50
5145	177	14	924	7	49165.20	4916.52
5146	177	32	421	7	15350.93	4605.30
5147	177	35	329	8	70333.52	21803.36
5148	177	20	903	7	54375.30	16856.35
5149	433	30	652	10	42414.80	16965.90
5150	177	23	653	10	35069.50	7364.60
5151	769	26	129	10	87302.30	17460.50
5152	177	12	921	1	4410.10	1543.53
5153	177	7	375	6	44032.50	17613.00
5154	177	45	334	10	87503.10	21000.70
5155	862	32	893	9	56018.07	17925.75
5156	177	28	279	1	3580.55	823.53
5157	177	34	376	18	96957.36	26178.48
5158	177	4	735	5	44673.60	15635.75
5159	177	13	276	8	76930.40	27694.96
5160	177	32	360	1	1667.43	283.46
5161	177	33	560	1	9292.88	3252.51
5162	177	28	834	9	30192.21	12076.92
5163	844	42	221	3	19754.37	5926.32
5164	177	10	144	2	15043.20	4212.10
5165	177	31	929	6	9385.62	2628.00
5166	179	14	78	7	45457.30	6364.05
5167	177	15	393	5	24036.35	8653.10
5168	177	1	164	7	18000.57	3960.11
5169	234	31	552	9	43723.26	16614.81
5170	575	36	834	3	10064.07	4025.64
5171	177	20	352	10	95644.80	20085.40
5172	177	46	819	6	18366.00	6795.42
5173	36	26	470	3	21116.82	4434.54
5174	177	11	691	9	76212.63	24388.02
5175	177	43	435	9	66098.07	19829.43
5176	177	44	176	2	9772.32	3322.58
5177	311	16	4	1	6871.63	1786.62
5178	177	48	238	17	120729.58	45877.22
5179	177	49	847	5	12435.65	3482.00
5180	177	16	833	4	15883.96	4924.04
5181	177	7	750	16	5878.24	1880.96
5182	177	2	53	6	58649.94	6451.50
5183	177	37	574	8	67733.20	16933.28
5184	177	2	487	2	13316.80	3995.04
5185	177	28	150	9	74775.78	22432.77
5186	177	37	426	7	31100.30	6220.06
5187	177	30	821	17	119551.82	40647.68
5188	177	9	394	1	6381.39	1340.09
5189	177	13	939	9	19670.31	7868.16
5190	177	37	215	10	96303.70	20223.80
5191	177	48	164	6	15429.06	3394.38
5192	177	4	512	9	8239.23	823.95
5193	177	25	161	1	7608.68	2663.04
5194	177	25	202	2	17572.30	2987.30
5195	177	29	44	4	25658.08	5388.20
5196	177	28	191	7	21380.94	3634.75
5197	177	35	523	6	48608.16	18957.18
5198	177	46	785	6	27906.18	8371.86
5199	177	30	60	1	2698.60	296.85
5200	177	3	662	7	17759.56	3551.94
5201	177	41	539	1	4267.53	896.18
5202	299	12	296	7	42972.09	10313.31
5203	177	6	941	6	50077.62	16525.62
5204	177	50	941	3	25038.81	8262.81
5205	177	6	618	5	34964.55	12587.25
5206	177	45	284	4	6824.40	818.92
5207	177	15	534	5	44930.40	7638.15
5208	177	46	45	8	70835.76	9917.04
5209	177	10	353	9	19697.94	5515.38
5210	177	29	115	5	22453.65	4715.25
5211	177	13	787	5	760.15	136.85
5212	177	14	668	7	26958.61	7818.02
5213	177	40	545	9	5191.83	1869.03
5214	177	31	679	8	78211.52	28938.24
5215	177	24	174	5	31882.65	8927.15
5216	415	7	894	1	5349.62	1551.39
5217	328	45	94	2	17478.86	5243.66
5218	177	44	442	8	47673.28	10964.88
5219	177	42	906	3	23710.68	7113.21
5220	177	31	771	1	2087.23	229.60
5221	150	30	137	9	57476.88	18392.58
5222	177	4	690	7	36809.71	7361.97
5223	177	47	833	5	19854.95	6155.05
5224	177	28	495	2	11317.16	3508.32
5225	177	20	71	2	7664.52	1609.54
5226	177	49	11	10	24469.80	9787.90
5227	177	29	791	5	13817.35	2487.10
5228	177	2	918	2	5886.16	1706.98
5229	177	31	432	8	12704.72	2922.08
5230	177	14	112	9	23505.75	2350.53
5231	177	25	1000	4	8894.12	2846.12
5232	177	37	277	4	35370.16	3890.72
5233	177	14	564	4	25648.56	2821.36
5234	193	20	80	4	19238.72	7503.12
5235	856	18	844	6	54068.34	21086.64
5236	177	49	952	11	221.10	42.02
5237	177	24	263	6	56234.04	10684.44
5238	177	43	877	9	26309.88	4472.64
5239	177	29	378	15	89804.25	30533.40
5240	177	3	831	4	1648.36	329.68
5241	177	7	170	16	148520.96	56437.92
5242	177	15	868	10	36845.20	7737.50
5243	797	3	117	2	7233.82	2893.52
5244	177	16	713	9	72294.93	18796.68
5245	177	48	498	8	56656.24	20962.80
5246	177	43	512	6	5492.82	549.30
5247	177	41	511	1	1536.72	491.75
5248	177	7	31	7	29489.67	9436.70
5249	315	38	425	6	16834.86	2861.94
5250	177	3	744	5	4293.75	987.55
5251	177	28	503	3	11195.28	2574.90
5252	52	12	555	7	17999.17	2879.87
5253	177	12	44	8	51316.16	10776.40
5254	177	9	531	9	54635.04	12566.07
5255	177	6	206	1	8062.44	1289.99
5256	177	16	476	8	66751.44	20692.96
5257	177	46	841	8	60945.84	20721.60
5258	177	14	412	3	24020.97	2882.52
5259	517	24	932	7	22405.46	2240.56
5260	177	39	679	10	97764.40	36172.80
5261	177	23	299	10	90397.00	15367.50
5262	177	25	11	3	7340.94	2936.37
5263	177	7	618	6	41957.46	15104.70
5264	175	1	500	9	52046.82	10409.40
5265	177	45	73	9	21198.51	2543.85
5266	177	22	942	13	23279.23	3491.93
5267	177	43	81	16	97830.72	37175.68
5268	241	12	723	5	26502.05	5300.40
5269	177	32	484	7	63322.28	16463.79
5270	177	1	487	8	53267.20	15980.16
5271	177	21	837	7	65366.14	19609.87
5272	177	47	321	1	5813.92	1395.34
5273	177	17	363	8	62204.96	7464.56
5274	207	29	114	6	56910.36	15934.92
5275	177	22	955	4	4088.20	1471.76
5276	177	47	34	5	26909.15	9418.20
5277	326	24	997	9	41187.78	6178.14
5278	663	38	193	10	51226.70	12806.70
5279	177	46	838	2	10255.70	2256.26
5280	177	14	760	6	23081.40	7155.24
5281	177	30	125	6	21147.06	7612.92
5282	177	15	163	2	6740.38	1752.50
5283	177	47	114	8	75880.48	21246.56
5284	177	13	352	2	19128.96	4017.08
5285	177	8	542	2	18873.04	2642.22
5286	177	37	584	2	10029.34	3209.38
5287	177	15	4	7	48101.41	12506.34
5288	177	45	874	5	14299.15	2573.85
5289	710	28	895	4	21109.72	8021.68
5290	177	12	215	2	19260.74	4044.76
5291	177	29	309	5	7972.75	1594.55
5292	177	48	450	9	75655.17	19670.31
5293	177	24	77	2	13735.36	3159.14
5294	291	2	844	1	9011.39	3514.44
5295	177	10	123	1	2162.44	367.61
5296	177	28	113	5	5882.40	1411.80
5297	177	10	379	25	169966.75	18696.25
5298	177	30	341	7	63404.53	14583.03
5299	177	42	56	9	69451.92	27780.75
5300	177	9	206	6	48374.64	7739.94
5301	177	34	498	4	28328.12	10481.40
5302	177	9	855	2	3963.66	1070.18
5303	177	31	733	5	45523.60	10470.45
5304	177	31	730	3	25798.35	2837.82
5305	487	5	147	9	73443.51	16157.61
5306	684	15	255	10	5110.20	1941.90
5307	177	35	73	7	16487.73	1978.55
5308	177	28	590	8	72492.80	9424.08
5309	177	39	654	11	91451.47	23777.38
5310	177	14	869	10	94364.90	32084.10
5311	177	28	138	9	39582.27	4354.02
5312	177	33	251	2	11396.66	3532.96
5313	177	48	788	7	25630.85	4100.95
5314	177	27	128	5	15749.80	2362.45
5315	177	9	30	10	65440.40	9816.10
5316	177	40	384	3	29507.70	3245.85
5317	12	22	696	8	55283.36	15479.36
5318	177	16	66	9	19291.68	7523.73
5319	177	29	481	3	29791.56	5958.30
5320	177	20	767	17	109720.38	37304.97
5321	177	25	613	3	18774.72	2628.45
5322	284	13	527	2	7500.56	1725.12
5323	177	21	851	8	34435.28	4820.96
5324	177	6	448	1	4519.03	1084.57
5325	177	16	86	2	14484.06	1593.24
5326	177	24	735	5	44673.60	15635.75
5327	177	45	205	6	1379.58	303.48
5328	760	29	462	6	31136.94	10586.58
5329	126	18	537	3	20826.96	5831.55
5330	177	21	259	8	66346.32	6634.64
5331	177	33	770	1	8114.51	1785.19
5332	177	7	588	6	9981.78	2595.24
5333	177	43	625	8	53848.48	12385.12
5334	177	34	261	3	6869.01	2472.84
5335	177	36	738	7	16217.39	3567.83
5336	414	14	619	6	6283.38	1068.18
5337	177	2	993	8	57611.52	14402.88
5338	532	24	122	2	15325.20	5057.32
5339	112	49	323	1	2087.73	626.32
5340	294	20	672	1	7353.57	1397.18
5341	177	25	219	6	54897.42	21409.98
5342	177	9	369	1	2305.00	437.95
5343	177	11	541	8	62166.40	24244.88
5344	177	43	439	7	29388.17	3820.46
5345	177	49	787	8	1216.24	218.96
5346	177	39	344	6	6226.02	1120.68
5347	177	15	459	6	3582.54	1253.88
5348	177	31	73	5	11776.95	1413.25
5349	177	10	4	4	27486.52	7146.48
5350	177	19	101	3	25489.35	6882.12
5351	177	31	333	5	10881.50	3264.45
5352	297	39	712	1	4087.96	776.71
5353	177	41	144	5	37608.00	10530.25
5354	523	37	102	3	14549.37	2327.91
5355	177	17	249	4	32665.40	4246.52
5356	177	44	94	3	26218.29	7865.49
5357	177	9	582	1	2158.18	215.82
5358	177	38	985	9	67783.14	6778.35
5359	177	7	661	4	5410.80	1839.68
5360	177	45	748	8	29962.88	4794.08
5361	177	48	331	6	12877.56	4507.14
5362	177	20	488	6	57757.50	6353.34
5363	177	14	586	9	60031.53	7804.08
5364	83	44	878	3	18459.93	2399.79
5365	177	14	201	6	24256.20	4366.14
5366	760	16	435	2	14688.46	4406.54
5367	177	36	591	1	595.92	65.55
5368	177	43	100	7	40130.79	8427.44
5369	177	43	758	3	14316.57	5583.45
5370	365	12	426	4	17771.60	3554.32
5371	177	30	313	8	74890.64	27709.52
5372	177	9	515	9	79479.00	23048.91
5373	177	14	643	8	57443.60	13212.00
5374	177	33	665	2	1608.74	337.84
5375	177	28	904	10	94640.50	17035.30
5376	177	43	740	10	61912.70	24765.10
5377	177	19	593	7	3397.45	1257.06
5378	177	9	933	7	56383.88	20298.18
5379	177	6	149	8	51164.24	7674.64
5380	177	37	768	5	49741.95	16414.85
5381	177	30	304	8	66882.32	10701.20
5382	177	10	809	5	21537.80	7322.85
5383	177	8	186	10	32437.60	6163.10
5384	177	44	489	9	63084.33	14509.44
5385	177	11	145	9	67826.79	24417.63
5386	853	31	538	8	47058.72	6588.24
5387	177	38	820	4	7389.48	2734.12
5388	177	47	830	8	29595.76	2959.60
5389	177	18	746	4	18184.44	6728.24
5390	177	11	959	1	6899.61	1655.91
5391	177	49	560	10	92928.80	32525.10
5392	773	48	935	6	18379.68	2940.72
5393	177	46	510	2	11106.86	1443.90
5394	177	45	485	4	28176.88	8734.84
5395	177	25	103	7	19098.73	4201.75
5396	177	9	538	2	11764.68	1647.06
5397	177	21	686	7	23938.18	5984.58
5398	177	37	357	2	18813.04	5832.04
5399	177	42	43	1	9652.31	1640.89
5400	177	41	750	2	734.78	235.12
5401	177	32	970	8	1745.28	523.60
5402	177	49	839	5	46103.50	5071.40
5403	798	2	839	2	18441.40	2028.56
5404	177	4	511	9	13830.48	4425.75
5405	177	6	934	11	904.86	126.72
5406	177	21	308	9	11511.54	4604.58
5407	177	36	551	14	99592.36	23902.20
5408	177	25	667	5	26766.70	10706.70
5409	177	27	916	8	22471.12	3820.08
5410	177	16	20	3	8080.77	1616.16
5411	177	42	75	3	11964.21	1196.43
5412	177	9	543	6	23960.88	6709.02
5413	177	36	167	9	67194.99	8063.37
5414	177	1	349	8	39232.72	11377.52
5415	16	4	20	3	8080.77	1616.16
5416	177	32	985	12	90377.52	9037.80
5417	177	4	414	8	66430.88	18600.64
5418	177	1	133	10	42603.90	14485.30
5419	136	41	748	9	33708.24	5393.34
5420	177	15	542	9	84928.68	11889.99
5421	241	12	520	5	2702.05	1026.80
5422	177	4	64	3	7392.66	2513.49
5423	177	3	384	4	39343.60	4327.80
5424	802	45	245	1	8009.90	2322.87
5425	177	9	358	2	49.20	14.76
5426	696	30	474	9	45104.85	7216.74
5427	177	21	307	5	19422.40	7574.75
5428	50	45	77	1	6867.68	1579.57
5429	177	48	210	7	37384.41	11215.33
5430	177	1	197	3	16208.13	4052.04
5431	177	43	731	6	33041.04	4956.18
5432	177	37	128	7	22049.72	3307.43
5433	177	49	306	10	72208.10	28161.20
5434	177	4	475	9	51496.83	14934.06
5435	177	31	22	7	19599.86	1960.00
5436	699	26	801	7	17090.64	2392.67
5437	177	10	703	4	25016.56	5503.64
5438	177	11	261	10	22896.70	8242.80
5439	177	39	105	5	17656.35	5473.45
5440	177	32	670	5	21624.15	4757.30
5441	177	21	52	3	13910.88	1391.10
5442	177	35	656	5	5274.40	580.20
5443	177	20	644	4	3422.72	1163.72
5444	177	29	220	4	18897.24	3968.44
5445	177	22	397	16	87386.88	9612.48
5446	177	38	441	8	54033.36	13508.32
5447	177	20	474	8	40093.20	6414.88
5448	177	14	102	10	48497.90	7759.70
5449	177	40	972	7	17093.65	5811.82
5450	177	27	106	1	8654.06	1557.73
5451	177	8	299	2	18079.40	3073.50
5452	177	3	801	4	9766.08	1367.24
5453	177	32	768	10	99483.90	32829.70
5454	177	8	969	10	24487.60	2938.50
5455	593	23	245	9	72089.10	20905.83
5456	326	24	762	3	16085.07	1769.37
5457	177	49	998	6	43911.00	8343.06
5458	338	22	600	1	2367.99	781.44
5459	177	36	424	5	31281.55	11887.00
5460	220	3	562	1	3456.55	795.01
5461	138	42	401	9	10463.49	2092.68
5462	177	8	707	2	5656.02	904.96
5463	177	38	944	5	22458.10	6063.70
5464	177	49	487	5	33292.00	9987.60
5465	177	37	515	13	114803.00	33292.87
5466	177	13	799	1	5860.05	1640.81
5467	818	6	567	2	14669.80	1613.68
5468	177	42	201	9	36384.30	6549.21
5469	177	41	919	4	36397.24	5095.60
5470	177	13	44	6	38487.12	8082.30
5471	177	5	724	7	64960.91	18189.08
5472	177	29	530	10	40121.30	6419.40
5473	177	36	930	9	84044.16	21851.46
5474	36	26	696	5	34552.10	9674.60
5475	433	30	300	7	55312.74	17700.06
5476	177	40	853	5	34831.45	9404.50
5477	569	48	611	2	13841.30	4844.46
5478	177	14	766	10	15338.20	4448.10
5479	66	14	197	6	32416.26	8104.08
5480	177	26	1	11	63106.34	20825.09
5481	177	6	608	9	46714.41	6072.84
5482	177	27	383	9	70629.12	14832.09
5483	177	18	586	3	20010.51	2601.36
5484	177	37	631	6	15922.14	1751.46
5485	177	36	897	4	8069.80	3147.24
5486	177	12	137	9	57476.88	18392.58
5487	349	10	765	1	29.61	6.51
5488	734	18	891	1	7774.69	1243.95
5489	738	40	461	4	27998.68	3079.84
5490	177	40	765	7	207.27	45.57
5491	177	12	194	10	54372.20	8155.80
5492	177	21	507	4	29277.48	8197.68
5493	532	24	612	5	43362.85	10407.10
5494	177	33	543	8	31947.84	8945.36
5495	177	2	387	7	37810.71	11721.29
5496	177	11	663	2	15160.70	5761.06
5497	605	20	643	8	57443.60	13212.00
5498	177	29	859	9	66962.34	24776.10
5499	177	23	871	3	5019.54	552.15
5500	177	14	747	9	1244.34	199.08
5501	177	36	675	3	1395.33	502.32
5502	177	31	177	3	17218.14	2410.53
5503	177	6	748	2	7490.72	1198.52
5504	254	37	761	8	78762.48	25204.00
5505	262	31	533	1	3276.33	1245.01
5506	177	48	576	7	6983.34	2234.68
5507	177	36	694	1	48.48	7.27
5508	177	35	60	9	24287.40	2671.65
5509	806	3	831	8	3296.72	659.36
5510	177	25	53	9	87974.91	9677.25
5511	769	26	375	5	36693.75	14677.50
5512	177	3	332	2	19335.90	5027.34
5513	177	16	633	7	48187.09	18311.09
5514	177	8	41	6	2568.78	744.96
5515	177	11	537	2	13884.64	3887.70
5516	509	11	135	7	37474.78	5621.21
5517	694	12	715	9	66522.06	7317.45
5518	251	49	184	2	3575.52	1394.46
5519	177	6	918	8	23544.64	6827.92
5520	177	46	750	3	1102.17	352.68
5521	177	15	273	6	21795.96	4141.26
5522	177	43	800	5	48995.35	8819.15
5523	177	46	705	7	53154.64	9567.81
5524	177	30	8	4	13418.32	3622.96
5525	177	31	582	9	19423.62	1942.38
5526	177	44	407	4	17750.40	6212.64
5527	397	43	171	8	73393.52	24953.76
5528	177	14	233	9	40851.99	14298.21
5529	177	49	237	8	62654.16	14410.48
5530	177	33	563	4	31062.16	4038.08
5531	177	4	910	1	2859.92	571.98
5532	177	4	520	9	4863.69	1848.24
5533	177	44	598	4	8818.44	2292.80
5534	277	39	413	6	10229.82	2455.14
5535	395	11	570	4	8494.48	2888.12
5536	177	6	63	6	46435.08	7429.62
5537	177	48	115	8	35925.84	7544.40
5538	177	49	22	1	2799.98	280.00
5539	177	29	803	2	11280.58	1579.28
5540	177	2	204	5	14537.40	4651.95
5541	177	17	503	8	29854.08	6866.40
5542	177	1	28	8	61680.08	11719.20
5543	66	37	461	9	62997.03	6929.64
5544	177	44	352	2	19128.96	4017.08
5545	177	49	454	4	19355.72	3484.04
5546	177	17	613	10	62582.40	8761.50
5547	177	34	919	2	18198.62	2547.80
5548	155	45	338	2	6221.18	2488.48
5549	272	46	481	6	59583.12	11916.60
5550	177	41	953	10	75856.20	9102.70
5551	177	16	314	8	56841.60	18757.76
5552	177	6	565	1	1858.58	650.50
5553	177	50	675	6	2790.66	1004.64
5554	177	4	185	3	23164.62	4632.93
5555	177	40	304	6	50161.74	8025.90
5556	177	41	916	1	2808.89	477.51
5557	177	30	694	2	96.96	14.54
5558	177	39	94	8	69915.44	20974.64
5559	177	49	414	2	16607.72	4650.16
5560	720	43	201	3	12128.10	2183.07
5561	529	31	573	1	1604.43	497.37
5562	177	6	234	9	53880.66	8082.09
5563	415	7	402	2	7765.94	1164.90
5564	177	3	866	10	29535.20	2953.50
5565	177	42	608	4	20761.96	2699.04
5566	177	10	884	9	34633.62	9697.41
5567	177	28	798	5	35486.15	13484.75
5568	177	48	422	2	11002.96	1870.50
5569	177	39	95	7	33612.46	8739.22
5570	177	18	928	9	54753.30	18068.58
5571	177	33	433	1	1335.24	467.33
5572	177	7	18	2	19978.74	3596.18
5573	177	35	433	9	12017.16	4205.97
5574	177	3	373	9	73432.44	8811.90
5575	177	18	7	5	23470.55	3520.60
5576	177	8	814	9	77078.70	26977.50
5577	177	40	316	7	26515.16	9545.48
5578	177	17	130	2	16465.66	2469.84
5579	177	37	570	7	14865.34	5054.21
5580	177	19	814	3	25692.90	8992.50
5581	177	5	847	4	9948.52	2785.60
5582	177	37	57	3	9592.29	2302.14
5583	177	29	707	8	22624.08	3619.84
5584	874	9	270	7	1822.59	601.44
5585	177	34	18	11	109883.07	19778.99
5586	177	15	70	6	13615.68	2450.82
5587	177	42	15	1	5280.98	1214.63
5588	177	26	327	9	12667.95	3546.99
5589	177	50	254	1	1803.90	721.56
5590	177	15	165	6	14882.10	4018.14
5591	177	49	245	1	8009.90	2322.87
5592	177	30	876	8	9785.36	3816.32
5593	177	47	856	8	13354.80	3205.12
5594	191	44	459	5	2985.45	1044.90
5595	177	26	477	4	4906.00	1668.04
5596	177	25	446	9	86244.66	25873.38
5597	177	23	276	5	48081.50	17309.35
5598	177	41	340	2	15505.38	4341.50
5599	177	41	701	7	59484.11	17250.38
5600	177	30	77	4	27470.72	6318.28
5601	477	12	383	4	31390.72	6592.04
5602	177	26	615	7	64155.07	19246.50
5603	595	37	706	4	32907.60	3290.76
5604	177	23	637	3	10256.85	4000.17
5605	177	46	857	8	27523.76	2752.40
5606	177	34	547	4	29697.44	3860.68
5607	107	8	86	7	50694.21	5576.34
5608	723	5	92	9	51336.90	17967.87
5609	259	1	646	7	40809.09	11834.62
5610	262	31	916	8	22471.12	3820.08
5611	177	10	200	3	23667.96	5443.62
5612	177	30	861	5	2652.20	875.25
5613	624	34	163	2	6740.38	1752.50
5614	744	1	956	10	83381.30	23346.80
5615	36	26	450	3	25218.39	6556.77
5616	177	15	7	28	131435.08	19715.36
5617	315	38	689	1	4540.03	1452.81
5618	177	7	979	4	35637.24	11760.28
5619	61	8	774	3	26144.85	4967.52
5620	177	28	966	1	4128.91	536.76
5621	147	34	428	10	45521.50	15932.50
5622	615	12	464	4	2084.84	729.68
5623	177	31	800	7	68593.49	12346.81
5624	177	46	751	6	15348.24	5832.36
5625	177	38	238	8	56813.92	21589.28
5626	177	28	58	1	9559.28	1911.86
5627	377	49	297	2	15459.36	2628.10
5628	177	9	874	7	20018.81	3603.39
5629	177	16	846	9	60125.85	17436.51
5630	177	14	791	4	11053.88	1989.68
5631	346	45	925	4	19954.84	3192.76
5632	177	27	190	7	39681.95	11110.96
5633	177	1	80	9	43287.12	16882.02
5634	177	6	688	2	17830.56	2139.66
5635	669	29	558	9	89527.68	30439.44
5636	177	10	433	7	9346.68	3271.31
5637	177	39	429	7	33271.14	7319.62
5638	177	17	153	7	3581.69	1396.85
5639	177	29	353	4	8754.64	2451.28
5640	177	34	38	1	4893.02	1321.12
5641	177	34	618	7	48950.37	17622.15
5642	177	7	419	3	9530.79	3431.07
5643	177	37	886	3	3742.86	1422.30
5644	177	48	190	1	5668.85	1587.28
5645	177	36	189	4	4887.92	977.60
5646	177	23	381	4	4674.04	1355.48
5647	177	35	141	8	48557.36	7769.20
5648	177	5	451	10	74829.50	14217.60
5649	485	27	559	5	30717.30	8600.85
5650	177	48	232	7	69799.24	14657.86
5651	177	41	649	8	69388.00	25673.52
5652	177	31	93	4	20071.76	6422.96
5653	177	28	941	6	50077.62	16525.62
5654	258	27	216	10	49998.10	13999.50
5655	177	22	509	4	28557.96	8852.96
5656	41	37	465	2	7200.06	1656.02
5657	177	7	301	9	23930.01	5025.33
5658	177	9	987	4	32346.40	10674.32
5659	177	35	44	6	38487.12	8082.30
5660	177	35	312	3	29248.11	8774.43
5661	177	17	699	3	12034.77	3129.03
5662	177	34	771	1	2087.23	229.60
5663	177	7	247	12	75216.00	10530.24
5664	177	30	721	5	49836.20	11960.70
5665	177	40	450	9	75655.17	19670.31
5666	177	7	573	1	1604.43	497.37
5667	177	29	81	7	42800.94	16264.36
5668	177	47	838	10	51278.50	11281.30
5669	177	13	447	6	12362.46	3955.98
5670	177	39	244	7	43007.72	16772.98
5671	177	10	648	2	13562.66	3661.92
5672	177	23	135	2	10707.08	1606.06
5673	177	49	553	6	39188.70	13716.06
5674	177	13	389	9	8648.10	3372.75
5675	177	1	788	10	36615.50	5858.50
5676	597	42	98	8	7766.24	2019.20
5677	177	43	312	5	48746.85	14624.05
5678	177	27	578	8	17907.84	2148.96
5679	177	45	738	6	13900.62	3058.14
5680	337	26	698	5	16432.70	1807.60
5681	870	21	226	1	4475.23	581.78
5682	33	4	201	2	8085.40	1455.38
5683	177	32	779	6	41816.22	12963.00
5684	177	13	93	8	40143.52	12845.92
5685	177	29	345	8	79388.80	23022.72
5686	177	19	798	3	21291.69	8090.85
5687	671	18	389	2	1921.80	749.50
5688	177	13	942	9	16116.39	2417.49
5689	177	27	403	4	2775.36	305.28
5690	177	24	556	10	62226.00	11200.70
5691	177	19	246	6	7482.12	1945.38
5692	177	13	303	4	36988.08	12575.96
5693	177	22	75	9	35892.63	3589.29
5694	177	16	490	2	9601.94	1344.28
5695	177	31	388	4	22319.92	5803.16
5696	177	25	378	2	11973.90	4071.12
5697	95	1	262	8	60486.08	18145.84
5698	177	12	354	3	18259.14	1825.92
5699	814	21	90	1	5654.80	1357.15
5700	177	50	996	8	64163.44	18607.36
5701	177	44	171	4	36696.76	12476.88
5702	177	45	112	6	15670.50	1567.02
5703	177	28	649	5	43367.50	16045.95
5704	833	6	950	8	46128.88	13377.36
5705	177	31	961	19	168661.10	35418.85
5706	177	11	268	2	13760.38	1376.04
5707	177	10	616	10	10551.90	4220.80
5708	177	21	653	6	21041.70	4418.76
5709	177	47	880	7	43991.99	5718.93
5710	177	6	169	8	59484.32	9517.52
5711	177	22	17	5	9511.30	1046.25
5712	177	31	42	8	42092.64	13890.56
5713	331	11	242	4	39988.68	13196.28
5714	177	35	751	2	5116.08	1944.12
5715	177	44	350	3	21098.61	8228.46
5716	177	37	59	6	22592.64	6100.02
5717	177	29	114	1	9485.06	2655.82
5718	177	21	190	1	5668.85	1587.28
5719	177	2	469	6	218.34	65.52
5720	177	18	922	9	82675.44	18188.64
5721	177	6	356	8	35669.44	6777.20
5722	844	12	244	8	49151.68	19169.12
5723	177	6	238	5	35508.70	13493.30
5724	177	35	782	9	12776.85	1660.95
5725	833	6	898	6	30155.34	11459.04
5726	177	35	541	1	7770.80	3030.61
5727	167	3	846	4	26722.60	7749.56
5728	177	26	654	10	83137.70	21615.80
5729	177	30	275	3	21904.26	7009.35
5730	177	10	53	10	97749.90	10752.50
5731	177	12	214	3	1644.06	312.36
5732	177	26	292	3	23744.88	6886.02
5733	177	29	850	17	146805.20	29361.04
5734	177	18	556	2	12445.20	2240.14
5735	177	7	352	8	76515.84	16068.32
5736	177	14	350	7	49230.09	19199.74
5737	524	50	202	6	52716.90	8961.90
5738	177	10	447	5	10302.05	3296.65
5739	177	28	358	6	147.60	44.28
5740	177	6	302	1	6522.44	2608.98
5741	177	36	316	4	15151.52	5454.56
5742	177	41	225	5	28275.10	8765.30
5743	832	20	886	4	4990.48	1896.40
5744	618	6	624	3	28447.20	3413.67
5745	856	18	569	6	24874.80	5223.72
5746	220	3	107	8	67935.28	21739.28
5747	171	36	328	6	47769.54	15286.26
5748	177	19	248	3	8467.56	2286.24
5749	177	48	520	5	2702.05	1026.80
5750	177	15	904	9	85176.45	15331.77
5751	177	7	154	5	28817.50	5187.15
5752	177	17	350	10	70328.70	27428.20
5753	177	43	521	1	8469.44	3303.08
5754	177	15	973	2	6872.04	2542.66
5755	177	43	804	9	40786.65	15498.90
5756	177	6	67	2	13993.12	2238.90
5757	177	38	995	8	76996.64	20789.12
5758	177	23	485	6	42265.32	13102.26
5759	177	6	653	2	7013.90	1472.92
5760	177	35	728	8	79058.64	20555.28
5761	177	31	383	4	31390.72	6592.04
5762	799	5	710	6	50379.78	20151.90
5763	177	36	69	7	44655.10	12950.00
5764	177	14	912	16	79282.08	9513.92
5765	177	4	307	8	31075.84	12119.60
5766	177	38	729	8	44152.16	15453.28
5767	177	41	592	2	19635.98	3730.84
5768	177	42	729	4	22076.08	7726.64
5769	177	9	117	10	36169.10	14467.60
5770	177	45	672	4	29414.28	5588.72
5771	177	47	80	7	33667.76	13130.46
5772	177	41	430	1	1088.39	185.03
5773	177	43	478	7	54942.02	7142.45
5774	177	49	134	8	38678.16	6575.28
5775	177	6	988	6	20871.96	3965.70
5776	1	6	331	8	17170.08	6009.52
5777	177	44	983	9	31385.88	5021.73
5778	177	28	887	3	23518.02	7760.94
5779	177	7	465	5	18000.15	4140.05
5780	177	38	846	10	66806.50	19373.90
5781	177	34	93	7	35125.58	11240.18
5782	177	31	576	3	2992.86	957.72
5783	687	4	567	1	7334.90	806.84
5784	177	29	468	1	2094.46	251.34
5785	177	46	999	5	3431.35	960.80
5786	177	1	896	3	2734.53	546.90
5787	177	22	61	2	3500.56	1365.22
5788	798	2	868	1	3684.52	773.75
5789	177	27	727	1	8440.48	3207.38
5790	177	19	489	1	7009.37	1612.16
5791	177	17	529	2	7179.54	2441.04
5792	177	14	51	3	16441.71	2137.41
5793	177	8	422	7	38510.36	6546.75
5794	177	33	493	9	22489.83	4273.11
5795	177	11	820	10	18473.70	6835.30
5796	177	11	422	2	11002.96	1870.50
5797	177	27	1	2	11473.88	3786.38
5798	177	18	720	9	28394.55	9938.07
5799	177	40	601	3	11869.62	2848.71
5800	177	7	60	5	13493.00	1484.25
5801	177	3	664	10	11735.40	1290.90
5802	177	43	767	3	19362.42	6583.23
5803	731	19	495	7	39610.06	12279.12
5804	177	28	748	7	26217.52	4194.82
5805	177	47	861	1	530.44	175.05
5806	167	3	218	2	15255.10	1830.62
5807	177	46	242	9	89974.53	29691.63
5808	177	49	864	3	23195.70	5566.98
5809	350	10	334	9	78752.79	18900.63
5810	177	15	514	6	2984.94	388.02
5811	177	14	381	7	8179.57	2372.09
5812	177	6	790	6	25406.52	8130.06
5813	177	19	177	8	45915.04	6428.08
5814	99	43	797	10	68248.10	15014.60
5815	671	18	995	9	86621.22	23387.76
5816	816	40	117	5	18084.55	7233.80
5817	177	17	495	8	45268.64	14033.28
5818	177	33	243	4	4199.60	1217.88
5819	177	1	222	3	25915.62	2591.55
5820	177	41	492	6	12311.10	2831.58
5821	177	10	18	4	39957.48	7192.36
5822	177	27	850	10	86356.00	17271.20
5823	508	10	122	1	7662.60	2528.66
5824	177	44	427	14	26526.78	4774.84
5825	177	6	952	3	60.30	11.46
5826	177	18	545	8	4614.96	1661.36
5827	177	25	618	7	48950.37	17622.15
5828	177	32	576	2	1995.24	638.48
5829	177	27	444	1	9855.68	3153.82
5830	177	45	807	2	10757.54	3765.14
5831	177	42	375	7	51371.25	20548.50
5832	177	43	721	10	99672.40	23921.40
5833	418	4	431	10	20898.70	5015.70
5834	177	22	838	10	51278.50	11281.30
5835	177	34	724	10	92801.30	25984.40
5836	177	13	148	6	9874.44	2962.32
5837	177	26	330	5	35208.95	9154.35
5838	720	36	67	5	34982.80	5597.25
5839	177	14	679	3	29329.32	10851.84
5840	177	7	464	10	5212.10	1824.20
5841	346	45	286	3	14112.12	4092.51
5842	177	35	702	8	70661.04	19785.12
5843	177	34	983	5	17436.60	2789.85
5844	177	29	923	1	3256.50	814.12
5845	177	39	859	10	74402.60	27529.00
5846	177	35	306	3	21662.43	8448.36
5847	177	20	344	6	6226.02	1120.68
5848	177	19	113	2	2352.96	564.72
5849	177	30	689	9	40860.27	13075.29
5850	654	44	777	5	48801.50	10736.35
5851	177	39	652	8	33931.84	13572.72
5852	177	39	799	8	46880.40	13126.48
5853	177	12	205	5	1149.65	252.90
5854	177	32	797	3	20474.43	4504.38
5855	177	42	17	1	1902.26	209.25
5856	251	49	644	9	7701.12	2618.37
5857	177	27	873	2	6221.08	1182.00
5858	177	11	104	3	18464.91	7201.32
5859	177	34	156	1	1144.76	194.61
5860	177	33	753	1	5079.37	1320.64
5861	177	10	49	7	63577.08	6993.49
5862	177	22	680	1	9930.49	2581.93
5863	177	30	195	7	69519.10	7647.08
5864	177	32	709	10	71828.40	20830.20
5865	748	39	439	10	41983.10	5457.80
5866	94	31	310	4	5242.56	524.24
5867	177	13	956	9	75043.17	21012.12
5868	177	25	102	5	24248.95	3879.85
5869	177	20	92	8	45632.80	15971.44
5870	177	3	195	5	49656.50	5462.20
5871	177	12	192	4	12221.16	3299.72
5872	177	43	424	10	62563.10	23774.00
5873	177	33	53	10	97749.90	10752.50
5874	524	50	434	4	33724.44	6407.64
5875	177	20	28	7	53970.07	10254.30
5876	192	35	623	5	35841.60	7168.30
5877	177	11	225	8	45240.16	14024.48
5878	177	44	870	4	17617.28	6518.40
5879	177	29	936	3	13886.01	4443.51
5880	177	40	223	1	8608.38	860.84
5881	177	10	598	10	22046.10	5732.00
5882	177	9	798	3	21291.69	8090.85
5883	177	8	42	4	21046.32	6945.28
5884	177	42	709	12	86194.08	24996.24
5885	177	33	663	9	68223.15	25924.77
5886	177	18	481	4	39722.08	7944.40
5887	177	14	171	2	18348.38	6238.44
5888	177	18	34	4	21527.32	7534.56
5889	177	27	558	8	79580.16	27057.28
5890	177	48	203	3	20815.59	7077.30
5891	177	28	34	10	53818.30	18836.40
5892	177	2	803	10	56402.90	7896.40
5893	177	29	874	10	28598.30	5147.70
5894	200	32	470	2	14077.88	2956.36
5895	177	11	897	8	16139.60	6294.48
5896	177	6	429	2	9506.04	2091.32
5897	177	10	950	7	40362.77	11705.19
5898	177	46	90	4	22619.20	5428.60
5899	177	20	80	2	9619.36	3751.56
5900	101	5	86	8	57936.24	6372.96
5901	177	49	41	10	4281.30	1241.60
5902	177	23	938	8	26275.52	7619.92
5903	177	21	279	1	3580.55	823.53
5904	177	20	584	10	50146.70	16046.90
5905	177	37	124	10	47479.40	14243.80
5906	177	22	163	1	3370.19	876.25
5907	807	20	662	9	22833.72	4566.78
5908	177	39	500	4	23131.92	4626.40
5909	177	10	389	5	4804.50	1873.75
5910	177	4	340	5	38763.45	10853.75
5911	177	40	496	9	3475.08	1007.73
5912	177	45	937	10	4859.90	631.80
5913	177	48	625	4	26924.24	6192.56
5914	259	1	130	3	24698.49	3704.76
5915	177	20	605	6	33283.08	12980.40
5916	177	31	902	10	9139.30	2010.60
5917	177	4	377	10	20982.80	5245.70
5918	177	23	308	4	5116.24	2046.48
5919	177	29	920	9	3508.65	1157.85
5920	177	1	831	8	3296.72	659.36
5921	177	11	540	4	21924.08	2192.40
5922	177	40	435	10	73442.30	22032.70
5923	177	27	17	2	3804.52	418.50
5924	177	34	951	5	14219.35	4265.80
5925	177	8	911	1	2362.02	543.26
5926	177	47	590	5	45308.00	5890.05
5927	177	28	934	2	164.52	23.04
5928	696	7	990	1	7493.51	1573.64
5929	177	38	42	10	52615.80	17363.20
5930	177	3	432	5	7940.45	1826.30
5931	177	30	642	3	14463.75	4773.03
5932	177	30	667	1	5353.34	2141.34
5933	177	10	253	10	8471.10	2033.10
5934	177	7	900	10	14916.90	5519.30
5935	177	5	443	5	13516.65	3244.00
5936	177	7	494	8	23310.96	3962.88
5937	177	45	224	10	75344.20	9041.30
5938	177	18	629	3	16766.34	2682.60
5939	177	15	321	2	11627.84	2790.68
5940	177	44	874	2	5719.66	1029.54
5941	177	45	443	10	27033.30	6488.00
5942	177	45	330	8	56334.32	14646.96
5943	177	17	830	1	3699.47	369.95
5944	177	9	180	4	14228.00	5691.20
5945	177	23	300	1	7901.82	2528.58
5946	819	44	166	6	42985.56	16334.52
5947	177	32	568	6	51323.40	15910.26
5948	177	14	215	7	67412.59	14156.66
5949	177	35	12	4	39336.12	6687.16
5950	177	25	70	6	13615.68	2450.82
5951	177	44	454	6	29033.58	5226.06
5952	438	22	888	7	40304.53	10882.20
5953	177	33	406	1	3297.30	1055.14
5954	447	33	2	9	18091.08	2713.68
5955	177	38	911	6	14172.12	3259.56
5956	177	18	204	9	26167.32	8373.51
5957	177	25	318	3	11077.20	2215.44
5958	177	22	738	6	13900.62	3058.14
5959	177	8	435	5	36721.15	11016.35
5960	177	19	465	7	25200.21	5796.07
5961	177	33	548	9	53586.90	17147.79
5962	177	12	367	3	483.81	125.79
5963	177	22	374	12	19871.04	4172.88
5964	177	18	272	3	8870.49	1685.40
5965	639	46	651	6	40693.74	12208.14
5966	177	4	304	2	16720.58	2675.30
5967	177	34	438	3	20106.66	4624.53
5968	177	15	491	4	27996.24	4199.44
5969	177	34	23	12	68071.68	18379.32
5970	399	47	665	5	4021.85	844.60
5971	415	7	881	10	93454.60	37381.80
5972	177	9	771	8	16697.84	1836.80
5973	177	22	259	4	33173.16	3317.32
5974	177	35	81	9	55029.78	20911.32
5975	177	49	167	9	67194.99	8063.37
5976	177	36	588	8	13309.04	3460.32
5977	177	14	367	10	1612.70	419.30
5978	177	40	219	8	73196.56	28546.64
5979	177	33	869	3	28309.47	9625.23
5980	806	3	754	6	201.66	54.42
5981	177	26	312	8	77994.96	23398.48
5982	177	9	31	6	25276.86	8088.60
5983	177	38	87	1	5886.40	706.37
5984	177	28	218	1	7627.55	915.31
5985	177	41	739	10	75496.40	18119.10
5986	177	28	297	11	85026.48	14454.55
5987	16	4	269	5	42534.55	8506.90
5988	177	15	800	5	48995.35	8819.15
5989	177	5	421	4	8771.96	2631.60
5990	177	39	614	6	58741.68	14098.02
5991	177	11	543	2	7986.96	2236.34
5992	177	14	400	2	10738.94	3114.30
5993	177	17	138	7	30786.21	3386.46
5994	415	7	285	2	5892.24	883.84
5995	177	35	425	3	8417.43	1430.97
5996	731	19	617	7	41513.64	15775.20
5997	177	28	338	5	15552.95	6221.20
5998	781	7	15	6	31685.88	7287.78
5999	669	19	490	9	43208.73	6049.26
6000	177	34	519	10	3562.70	1282.60
6001	618	6	50	6	11868.54	3085.80
6002	177	11	831	3	1236.27	247.26
6003	177	35	391	8	4535.20	770.96
6004	177	35	623	5	35841.60	7168.30
6005	177	24	234	8	47893.92	7184.08
6006	38	27	427	2	3789.54	682.12
6007	177	11	151	1	3649.63	693.43
6008	177	25	572	6	37261.74	10433.28
6009	657	23	580	8	45391.52	6808.72
6010	177	14	910	3	8579.76	1715.94
6011	177	42	797	8	54598.48	12011.68
6012	256	29	794	9	42481.26	5522.58
6013	177	21	947	10	33736.70	5397.90
6014	302	12	198	3	22562.73	4738.17
6015	177	18	339	9	67373.73	24928.29
6016	177	44	619	7	7330.61	1246.21
6017	177	24	280	8	65070.16	26028.08
6018	177	14	469	8	291.12	87.36
6019	177	30	133	8	34083.12	11588.24
6020	177	2	768	5	49741.95	16414.85
6021	177	23	92	1	5704.10	1996.43
6022	560	6	933	4	32219.36	11598.96
6023	177	11	624	4	37929.60	4551.56
6024	64	30	807	6	32272.62	11295.42
6025	177	32	908	4	23832.68	8818.08
6026	177	29	78	8	51951.20	7273.20
6027	177	32	138	3	13194.09	1451.34
6028	177	40	130	2	16465.66	2469.84
6029	177	34	758	1	4772.19	1861.15
6030	177	45	239	1	2041.23	632.78
6031	488	23	875	1	9201.63	2208.39
6032	177	37	237	5	39158.85	9006.55
6033	177	32	107	1	8491.91	2717.41
6034	177	10	980	10	75729.20	15145.80
6035	177	11	832	12	66954.24	12721.32
6036	177	34	148	13	21394.62	6418.36
6037	177	26	999	3	2058.81	576.48
6038	177	41	317	4	15972.96	6069.72
6039	426	24	592	8	78543.92	14923.36
6040	177	29	334	9	78752.79	18900.63
6041	177	39	608	9	46714.41	6072.84
6042	177	17	112	7	18282.25	1828.19
6043	177	49	168	3	1971.81	216.90
6044	177	38	903	3	23303.70	7224.15
6045	728	12	901	8	13436.48	2552.96
6046	177	22	216	3	14999.43	4199.85
6047	177	38	188	10	11457.90	1718.70
6048	299	12	223	10	86083.80	8608.40
6049	177	34	603	5	13081.95	3924.60
6050	177	28	582	10	21581.80	2158.20
6051	177	9	50	1	1978.09	514.30
6052	177	34	741	1	6933.73	1802.77
6053	832	20	870	4	17617.28	6518.40
6054	177	9	296	2	12277.74	2946.66
6055	177	10	364	6	37583.34	9771.66
6056	177	1	282	2	5754.32	2244.18
6057	177	1	379	5	33993.35	3739.25
6058	415	7	826	4	23604.92	6137.28
6059	601	50	837	9	84042.18	25212.69
6060	177	46	17	4	7609.04	837.00
6061	177	27	753	5	25396.85	6603.20
6062	177	31	666	4	12557.80	3516.20
6063	177	48	686	7	23938.18	5984.58
6064	177	19	166	7	50149.82	19056.94
6065	177	24	646	7	40809.09	11834.62
6066	177	13	329	5	43958.45	13627.10
6067	177	5	385	15	85966.95	23211.15
6068	177	6	550	1	4666.03	559.92
6069	177	15	14	9	69142.32	16594.20
6070	177	26	488	9	86636.25	9530.01
6071	177	36	295	2	9215.12	1566.58
6072	177	2	891	10	77746.90	12439.50
6073	177	28	906	8	63228.48	18968.56
6074	177	2	929	4	6257.08	1752.00
6075	177	29	660	8	35400.88	13098.32
6076	177	13	33	8	31635.92	9490.80
6077	177	35	368	9	38313.45	11877.21
6078	177	44	388	8	44639.84	11606.32
6079	177	17	84	2	3836.90	422.06
6080	177	20	236	10	55698.30	15595.50
6081	306	17	214	4	2192.08	416.48
6082	177	23	424	5	31281.55	11887.00
6083	177	48	899	3	18379.56	4778.70
6084	177	48	38	5	24465.10	6605.60
6085	177	13	908	1	5958.17	2204.52
6086	177	11	877	11	32156.52	5466.56
6087	177	46	184	5	8938.80	3486.15
6088	177	36	212	7	35902.23	6821.43
6089	488	23	418	1	1545.46	262.73
6090	177	34	486	12	75560.40	17378.88
6091	669	19	947	3	10121.01	1619.37
6092	177	35	34	10	53818.30	18836.40
6093	177	29	433	6	8011.44	2803.98
6094	177	30	132	6	18290.58	6035.88
6095	177	46	260	8	3915.76	744.00
6096	177	9	685	4	1028.00	411.20
6097	177	39	416	7	14563.01	5533.92
6098	177	32	514	6	2984.94	388.02
6099	177	31	198	2	15041.82	3158.78
6100	177	29	336	6	25152.36	3269.82
6101	177	15	186	4	12975.04	2465.24
6102	177	10	533	2	6552.66	2490.02
6103	177	34	282	10	28771.60	11220.90
6104	177	41	654	10	83137.70	21615.80
6105	177	36	782	10	14196.50	1845.50
6106	549	30	1000	6	13341.18	4269.18
6107	177	9	807	21	112954.17	39533.97
6108	177	13	968	10	37474.40	9743.30
6109	177	29	560	6	55757.28	19515.06
6110	177	28	124	9	42731.46	12819.42
6111	716	28	31	3	12638.43	4044.30
6112	264	22	259	8	66346.32	6634.64
6113	177	25	746	1	4546.11	1682.06
6114	171	36	651	10	67822.90	20346.90
6115	328	46	134	5	24173.85	4109.55
6116	177	29	764	8	60629.52	13338.48
6117	177	3	94	2	17478.86	5243.66
6118	95	1	929	3	4692.81	1314.00
6119	177	22	612	8	69380.56	16651.36
6120	257	8	800	10	97990.70	17638.30
6121	177	20	569	4	16583.20	3482.48
6122	177	7	937	6	2915.94	379.08
6123	177	7	642	9	43391.25	14319.09
6124	177	33	635	8	22181.44	3105.44
6125	177	41	288	8	7951.52	2544.48
6126	177	48	503	9	33585.84	7724.70
6127	177	34	135	9	48181.86	7227.27
6128	177	4	11	1	2446.98	978.79
6129	177	44	943	6	37401.00	14586.42
6130	177	6	305	5	45005.35	13501.60
6131	177	7	961	5	44384.50	9320.75
6132	581	32	328	3	23884.77	7643.13
6133	177	12	424	9	56306.79	21396.60
6134	177	37	305	4	36004.28	10801.28
6135	177	6	278	10	82103.20	24631.00
6136	177	33	916	1	2808.89	477.51
6137	177	37	299	9	81357.30	13830.75
6138	708	25	472	2	12730.54	1273.06
6139	433	30	614	6	58741.68	14098.02
6140	177	27	503	3	11195.28	2574.90
6141	177	2	601	7	27695.78	6646.99
6142	177	16	236	4	22279.32	6238.20
6143	177	50	856	7	11685.45	2804.48
6144	177	25	177	2	11478.76	1607.02
6145	177	44	453	1	9043.82	2260.96
6146	177	23	686	10	34197.40	8549.40
6147	177	11	287	3	8717.70	3225.54
6148	696	7	975	9	11245.68	1461.96
6149	280	22	549	3	17940.78	4844.01
6150	177	23	902	3	2741.79	603.18
6151	491	47	426	5	22214.50	4442.90
6152	874	9	39	1	8865.34	1329.80
6153	177	38	602	12	40317.12	7660.20
6154	177	43	673	10	52521.00	15231.10
6155	177	48	840	6	37030.38	8146.68
6156	177	22	699	8	32092.72	8344.08
6157	177	35	925	1	4988.71	798.19
6158	177	20	625	2	13462.12	3096.28
6159	177	28	534	7	62902.56	10693.41
6160	177	49	324	9	53222.85	11709.00
6161	177	27	97	6	57941.40	9850.02
6162	177	10	437	8	43329.28	15165.28
6163	641	14	265	8	10678.24	1708.48
6164	177	42	985	4	30125.84	3012.60
6165	177	38	315	7	30962.19	7121.31
6166	177	4	725	4	22532.36	2478.56
6167	177	37	943	9	56101.50	21879.63
6168	177	15	391	2	1133.80	192.74
6169	177	27	174	7	44635.71	12498.01
6170	177	3	448	7	31633.21	7591.99
6171	177	18	892	5	17244.25	4655.95
6172	177	18	700	9	45694.26	13708.26
6173	177	46	876	7	8562.19	3339.28
6174	177	42	799	1	5860.05	1640.81
6175	38	27	552	3	14574.42	5538.27
6176	177	19	849	6	23280.66	9079.44
6177	177	11	167	9	67194.99	8063.37
6178	177	8	290	5	44383.90	9764.45
6179	177	42	312	1	9749.37	2924.81
6180	177	37	991	1	3248.32	519.73
6181	744	16	377	10	20982.80	5245.70
6182	177	35	806	4	20132.52	6845.04
6183	177	22	218	7	53392.85	6407.17
6184	177	12	234	6	35920.44	5388.06
6185	177	17	803	1	5640.29	789.64
6186	177	6	203	9	62446.77	21231.90
6187	177	50	159	1	4233.80	1185.46
6188	825	21	212	1	5128.89	974.49
6189	177	20	61	5	8751.40	3413.05
6190	177	11	628	6	24169.26	5800.62
6191	177	27	366	6	1277.22	127.74
6192	653	41	286	8	37632.32	10913.36
6193	177	12	901	2	3359.12	638.24
6194	177	2	773	9	11339.64	2834.91
6195	177	12	812	4	18300.76	4209.16
6196	177	37	841	9	68564.07	23311.80
6197	177	16	292	8	63319.68	18362.72
6198	177	36	523	8	64810.88	25276.24
6199	177	27	652	12	50897.76	20359.08
6200	177	13	762	5	26808.45	2948.95
6201	781	7	615	10	91650.10	27495.00
6202	177	17	206	10	80624.40	12899.90
6203	177	43	665	10	8043.70	1689.20
6204	177	13	229	6	16638.78	4326.06
6205	177	5	897	9	18157.05	7081.29
6206	177	2	68	1	7772.38	2953.50
6207	177	31	419	2	6353.86	2287.38
6208	177	42	376	6	32319.12	8726.16
6209	177	27	502	4	23935.16	5026.40
6210	177	32	777	4	39041.20	8589.08
6211	177	23	947	10	33736.70	5397.90
6212	177	36	6	10	56454.20	15242.60
6213	177	1	45	5	44272.35	6198.15
6214	177	28	743	7	31273.83	10007.62
6215	673	46	736	8	52018.16	5722.00
6216	177	15	483	8	59060.88	9449.76
6217	177	19	650	4	33344.24	12337.36
6218	177	6	780	8	51265.84	11278.48
6219	177	18	757	6	6516.66	1107.84
6220	177	14	896	4	3646.04	729.20
6221	177	33	853	1	6966.29	1880.90
6222	177	18	498	5	35410.15	13101.75
6223	177	12	714	2	17461.86	6635.50
6224	177	12	332	3	29003.85	7541.01
6225	177	35	921	2	8820.20	3087.06
6226	177	3	568	7	59877.30	18561.97
6227	177	6	737	9	87972.75	9676.98
6228	177	41	358	9	221.40	66.42
6229	177	31	125	2	7049.02	2537.64
6230	177	40	1	9	51632.46	17038.71
6231	177	19	678	10	33143.90	12263.20
6232	844	42	733	10	91047.20	20940.90
6233	177	20	356	6	26752.08	5082.90
6234	177	32	795	3	20016.30	6605.37
6235	177	15	738	5	11583.85	2548.45
6236	167	3	577	10	78100.80	13277.10
6237	808	42	529	2	7179.54	2441.04
6238	177	12	806	1	5033.13	1711.26
6239	177	39	777	4	39041.20	8589.08
6240	177	12	99	2	9449.32	3779.72
6241	177	31	426	2	8885.80	1777.16
6242	177	45	873	2	6221.08	1182.00
6243	177	33	772	1	4915.51	1376.34
6244	177	2	502	5	29918.95	6283.00
6245	177	18	878	6	36919.86	4799.58
6246	757	25	515	9	79479.00	23048.91
6247	177	26	854	4	16663.12	5832.08
6248	177	47	85	19	67728.73	18964.09
6249	699	47	363	10	77756.20	9330.70
6250	177	32	126	4	17042.96	2045.16
6251	177	2	898	7	35181.23	13368.88
6252	177	34	989	1	728.91	204.09
6253	177	4	922	15	137792.40	30314.40
6254	130	37	524	5	33495.50	7703.95
6255	328	45	120	6	47718.30	10975.20
6256	177	34	281	1	4622.61	1016.97
6257	177	1	318	8	29539.20	5907.84
6258	177	34	250	5	18694.20	5982.15
6259	177	35	820	6	11084.22	4101.18
6260	177	45	716	7	19171.81	6710.13
6261	177	10	436	5	34201.50	8550.35
6262	527	17	376	10	53865.20	14543.60
6263	177	14	872	3	2550.78	331.59
6264	177	21	206	9	72561.96	11609.91
6265	538	14	952	5	100.50	19.10
6266	696	7	899	2	12253.04	3185.80
6267	177	11	658	8	68046.64	18372.56
6268	177	31	919	3	27297.93	3821.70
6269	177	20	309	9	14350.95	2870.19
6270	177	2	275	10	73014.20	23364.50
6271	177	2	777	1	9760.30	2147.27
6272	177	27	113	1	1176.48	282.36
6273	177	29	869	4	37745.96	12833.64
6274	177	24	392	9	58777.65	21159.99
6275	177	1	848	7	31057.95	7453.88
6276	177	4	930	2	18676.48	4855.88
6277	177	36	915	3	7462.56	1567.14
6278	177	2	311	6	18749.28	5624.76
6279	177	34	5	7	61091.52	21382.06
6280	177	9	967	10	96372.20	33730.30
6281	1	6	103	9	24555.51	5402.25
6282	177	28	765	7	207.27	45.57
6283	177	48	596	9	38223.54	5733.54
6284	177	25	861	1	530.44	175.05
6285	177	26	263	7	65606.38	12465.18
6286	177	27	446	7	67079.18	20123.74
6287	177	2	206	5	40312.20	6449.95
6288	177	1	627	4	23461.68	3519.24
6289	177	19	265	8	10678.24	1708.48
6290	183	3	4	1	6871.63	1786.62
6291	708	25	101	7	59475.15	16058.28
6292	177	41	836	3	21627.09	4757.97
6293	83	21	906	5	39517.80	11855.35
6294	177	37	941	7	58423.89	19279.89
6295	177	44	404	6	53588.16	15004.68
6296	177	27	781	4	13648.80	1774.36
6297	177	50	867	1	4425.50	1548.92
6298	177	41	932	5	16003.90	1600.40
6299	177	28	542	4	37746.08	5284.44
6300	177	12	861	9	4773.96	1575.45
6301	177	34	110	1	9350.87	1589.65
6302	177	7	792	8	28730.24	8619.04
6303	177	16	365	8	28338.72	9068.40
6304	177	39	660	9	39825.99	14735.61
6305	16	4	858	8	77346.72	27071.36
6306	349	10	44	1	6414.52	1347.05
6307	177	36	645	8	1566.72	548.32
6308	177	29	370	8	10714.00	1928.56
6309	177	5	21	5	2585.50	336.10
6310	177	43	598	2	4409.22	1146.40
6311	177	38	856	8	13354.80	3205.12
6312	177	20	950	9	51894.99	15049.53
6313	177	6	9	7	51308.32	15905.61
6314	177	29	668	3	11553.69	3350.58
6315	177	23	743	10	44676.90	14296.60
6316	177	3	582	4	8632.72	863.28
6317	177	42	534	5	44930.40	7638.15
6318	177	44	611	1	6920.65	2422.23
6319	177	10	879	4	19613.40	4903.36
6320	177	6	755	6	50874.42	9666.12
6321	177	20	520	2	1080.82	410.72
6322	177	45	548	7	41678.70	13337.17
6323	177	5	37	2	18940.00	1894.00
6324	177	42	184	6	10726.56	4183.38
6325	177	17	451	4	29931.80	5687.04
6326	740	35	148	9	14811.66	4443.48
6327	344	49	895	9	47496.87	18048.78
6328	177	44	256	7	1139.11	432.88
6329	177	11	441	2	13508.34	3377.08
6330	177	35	154	1	5763.50	1037.43
6331	177	25	429	1	4753.02	1045.66
6332	177	38	450	4	33624.52	8742.36
6333	177	37	245	10	80099.00	23228.70
6334	229	36	594	10	72687.40	23986.80
6335	177	13	172	2	218.12	76.34
6336	744	11	444	8	78845.44	25230.56
6337	177	47	40	1	4450.12	979.03
6338	177	15	955	4	4088.20	1471.76
6339	177	25	38	22	107646.44	29064.64
6340	177	32	253	9	7623.99	1829.79
6341	274	50	981	6	10626.36	2550.30
6342	177	50	528	3	28786.44	9499.53
6343	177	14	994	5	10024.25	1503.65
6344	177	9	656	3	3164.64	348.12
6345	177	8	566	1	3255.35	976.61
6346	177	24	626	1	4613.43	1614.70
6347	177	23	372	2	16226.88	4543.52
6348	161	19	646	3	17489.61	5071.98
6349	177	32	661	4	5410.80	1839.68
6350	177	30	907	1	50.14	6.02
6351	177	6	884	7	26937.26	7542.43
6352	177	33	978	7	17845.80	3390.73
6353	177	50	612	2	17345.14	4162.84
6354	425	1	643	9	64624.05	14863.50
6355	177	28	456	8	43131.68	4313.20
6356	177	45	424	13	81332.03	30906.20
6357	177	34	705	9	68341.68	12301.47
6358	526	7	948	9	62012.97	21084.39
6359	485	27	279	2	7161.10	1647.06
6360	177	3	109	10	38584.90	10417.90
6361	177	34	833	15	59564.85	18465.15
6362	177	7	36	9	64786.59	18140.22
6363	175	1	932	8	25606.24	2560.64
6364	177	21	292	5	39574.80	11476.70
6365	177	13	188	5	5728.95	859.35
6366	177	22	504	2	1433.38	272.34
6367	177	14	891	3	23324.07	3731.85
6368	177	12	872	1	850.26	110.53
6369	177	25	960	7	5651.10	791.14
6370	177	36	518	7	1735.16	364.35
6371	177	31	999	6	4117.62	1152.96
6372	177	25	146	1	3271.24	392.55
6373	177	11	925	2	9977.42	1596.38
6374	177	22	384	10	98359.00	10819.50
6375	177	39	52	9	41732.64	4173.30
6376	177	21	225	3	16965.06	5259.18
6377	331	11	364	9	56375.01	14657.49
6378	177	35	815	2	13152.62	2235.94
6379	177	8	805	4	11246.72	3823.88
6380	852	20	278	10	82103.20	24631.00
6381	177	30	917	3	2729.16	300.21
6382	177	49	652	5	21207.40	8482.95
6383	177	49	152	6	14589.48	2334.30
6384	177	4	622	4	15553.00	1555.28
6385	177	1	375	5	36693.75	14677.50
6386	311	16	355	5	47851.90	6699.25
6387	177	47	388	10	55799.80	14507.90
6388	177	48	914	7	37330.65	14558.95
6389	177	43	795	6	40032.60	13210.74
6390	177	33	364	9	56375.01	14657.49
6391	177	27	487	4	26633.60	7990.08
6392	191	44	462	10	51894.90	17644.30
6393	177	50	90	3	16964.40	4071.45
6394	177	30	84	8	15347.60	1688.24
6395	76	32	519	2	712.54	256.52
6396	112	49	569	2	8291.60	1741.24
6397	320	20	541	1	7770.80	3030.61
6398	177	50	631	5	13268.45	1459.55
6399	177	23	989	1	728.91	204.09
6400	177	50	123	8	17299.52	2940.88
6401	177	8	860	4	37562.04	11268.60
6402	177	48	35	10	29475.40	7958.40
6403	177	13	823	10	83174.60	22457.10
6404	177	4	290	5	44383.90	9764.45
6405	816	40	655	2	13834.08	2490.14
6406	177	33	699	5	20057.95	5215.05
6407	177	25	218	8	61020.40	7322.48
6408	177	49	982	6	54628.98	21305.28
6409	177	47	950	10	57661.10	16721.70
6410	615	12	591	2	1191.84	131.10
6411	258	32	72	2	15603.32	2496.54
6412	17	40	303	3	27741.06	9431.97
6413	177	43	640	10	55072.60	15971.10
6414	177	42	52	7	32458.72	3245.90
6415	177	10	588	4	6654.52	1730.16
6416	177	34	664	4	4694.16	516.36
6417	177	14	827	4	7283.08	1238.12
6418	177	38	156	3	3434.28	583.83
6419	177	34	219	1	9149.57	3568.33
6420	177	30	824	10	80704.10	26632.40
6421	177	21	670	10	43248.30	9514.60
6422	100	44	694	10	484.80	72.70
6423	177	23	649	9	78061.50	28882.71
6424	177	14	19	8	78754.48	10238.08
6425	177	38	316	5	18939.40	6818.20
6426	177	13	661	9	12174.30	4139.28
6427	761	20	167	1	7466.11	895.93
6428	177	13	805	5	14058.40	4779.85
6429	177	2	914	3	15998.85	6239.55
6430	177	35	503	4	14927.04	3433.20
6431	177	39	363	5	38878.10	4665.35
6432	177	29	393	10	48072.70	17306.20
6433	851	40	24	7	9112.88	1913.73
6434	177	14	515	5	44155.00	12804.95
6435	177	13	961	7	62138.30	13049.05
6436	177	11	872	5	4251.30	552.65
6437	177	1	695	1	9954.99	3484.25
6438	177	26	934	4	329.04	46.08
6439	177	36	205	1	229.93	50.58
6440	177	33	113	9	10588.32	2541.24
6441	177	37	786	7	30345.21	11531.17
6442	177	37	520	17	9186.97	3491.12
6443	177	32	778	2	11416.50	4338.28
6444	177	36	728	9	88940.97	23124.69
6445	177	4	780	7	44857.61	9868.67
6446	177	38	296	1	6138.87	1473.33
6447	177	11	197	6	32416.26	8104.08
6448	177	31	852	6	46343.10	10658.94
6449	177	35	103	6	16370.34	3601.50
6450	397	28	490	3	14402.91	2016.42
6451	193	20	545	7	4038.09	1453.69
6452	177	2	292	9	71234.64	20658.06
6453	177	11	298	9	64741.59	9063.81
6454	177	22	290	16	142028.48	31246.24
6455	177	36	419	3	9530.79	3431.07
6456	177	28	186	3	9731.28	1848.93
6457	529	31	1000	9	20011.77	6403.77
6458	177	46	720	3	9464.85	3312.69
6459	618	6	487	3	19975.20	5992.56
6460	177	3	511	8	12293.76	3934.00
6461	177	27	191	4	12217.68	2077.00
6462	488	23	874	10	28598.30	5147.70
6463	177	3	598	1	2204.61	573.20
6464	177	31	585	10	53740.80	5911.50
6465	177	30	496	6	2316.72	671.82
6466	177	39	328	4	31846.36	10190.84
6467	177	38	981	3	5313.18	1275.15
6468	177	20	772	10	49155.10	13763.40
6469	177	13	549	1	5980.26	1614.67
6470	731	19	956	9	75043.17	21012.12
6471	177	45	538	6	35294.04	4941.18
6472	177	39	332	5	48339.75	12568.35
6473	177	37	197	10	54027.10	13506.80
6474	177	16	351	7	1460.83	146.09
6475	177	6	601	12	47478.48	11394.84
6476	177	1	725	1	5633.09	619.64
6477	177	6	856	2	3338.70	801.28
6478	177	40	400	7	37586.29	10900.05
6479	177	28	661	4	5410.80	1839.68
6480	177	6	307	6	23306.88	9089.70
6481	177	3	49	7	63577.08	6993.49
6482	177	48	327	6	8445.30	2364.66
6483	177	7	748	10	37453.60	5992.60
6484	177	40	271	4	23902.52	4541.48
6485	177	30	295	8	36860.48	6266.32
6486	66	37	459	4	2388.36	835.92
6487	177	6	528	1	9595.48	3166.51
6488	177	2	257	6	28375.20	3972.54
6489	199	49	273	2	7265.32	1380.42
6490	177	37	691	5	42340.35	13548.90
6491	177	35	966	9	37160.19	4830.84
6492	177	2	831	7	2884.63	576.94
6493	177	46	943	5	31167.50	12155.35
6494	177	1	684	4	32918.12	6254.44
6495	595	32	182	5	31771.60	9849.20
6496	177	1	713	10	80327.70	20885.20
6497	177	35	56	1	7716.88	3086.75
6498	358	29	43	4	38609.24	6563.56
6499	177	44	115	9	40416.57	8487.45
6500	311	2	542	5	47182.60	6605.55
6501	197	2	393	2	9614.54	3461.24
6502	877	44	507	6	43916.22	12296.52
6503	797	3	990	2	14987.02	3147.28
6504	177	35	510	9	49980.87	6497.55
6505	177	12	713	8	64262.16	16708.16
6506	177	3	841	2	15236.46	5180.40
6507	386	21	993	9	64812.96	16203.24
6508	177	23	621	9	39189.24	13324.32
6509	177	28	994	2	4009.70	601.46
6510	150	30	584	1	5014.67	1604.69
6511	177	23	669	2	6516.68	1498.84
6512	177	46	202	3	26358.45	4480.95
6513	177	10	932	10	32007.80	3200.80
6514	177	7	984	15	84894.90	11036.40
6515	177	27	53	6	58649.94	6451.50
6516	399	47	607	9	55154.97	12134.07
6517	177	18	139	1	9047.48	1899.97
6518	177	38	559	2	12286.92	3440.34
6519	177	45	482	10	33608.40	7393.80
6520	177	22	171	10	91741.90	31192.20
6521	177	1	503	6	22390.56	5149.80
6522	479	1	348	9	6028.20	2350.98
6523	177	5	639	1	8653.13	2942.06
6524	177	27	808	3	27554.49	6061.98
6525	177	9	492	10	20518.50	4719.30
6526	177	39	418	13	20090.98	3415.49
6527	177	4	112	9	23505.75	2350.53
6528	177	6	294	9	53015.22	9542.70
6529	177	11	101	9	76468.05	20646.36
6530	177	27	327	3	4222.65	1182.33
6531	177	30	732	8	22267.84	2449.44
6532	177	29	986	7	53430.16	17631.95
6533	177	22	201	12	48512.40	8732.28
6534	177	23	136	7	37939.51	8726.06
6535	177	42	494	8	23310.96	3962.88
6536	177	8	148	4	6582.96	1974.88
6537	177	21	561	3	5939.34	1484.82
6538	177	27	853	10	69662.90	18809.00
6539	177	16	53	6	58649.94	6451.50
6540	177	14	245	2	16019.80	4645.74
6541	177	7	523	9	72912.24	28435.77
6542	177	14	675	3	1395.33	502.32
6543	177	30	575	2	11118.98	4225.22
6544	177	13	972	6	14651.70	4981.56
6545	177	13	894	3	16048.86	4654.17
6546	251	49	398	6	16598.64	3651.72
6547	177	33	399	3	11625.00	2673.75
6548	177	38	586	4	26680.68	3468.48
6549	177	31	472	7	44556.89	4455.71
6550	177	22	662	3	7611.24	1522.26
6551	177	19	665	10	8043.70	1689.20
6552	177	1	932	7	22405.46	2240.56
6553	177	4	468	6	12566.76	1508.04
6554	177	41	818	1	8616.34	2412.58
6555	177	14	780	9	57674.07	12688.29
6556	177	6	898	4	20103.56	7639.36
6557	177	6	989	1	728.91	204.09
6558	177	39	380	9	23601.42	5428.35
6559	657	20	635	2	5545.36	776.36
6560	177	45	514	2	994.98	129.34
6561	177	4	462	5	25947.45	8822.15
6562	177	41	174	10	63765.30	17854.30
6563	177	20	882	1	877.20	201.76
6564	177	42	210	4	21362.52	6408.76
6565	177	35	771	7	14610.61	1607.20
6566	177	24	295	7	32252.92	5483.03
6567	177	25	183	6	2601.00	676.26
6568	748	35	186	2	6487.52	1232.62
6569	177	15	862	10	59530.80	14287.40
6570	177	41	118	1	2336.54	630.87
6571	177	33	149	5	31977.65	4796.65
6572	177	13	47	8	33181.04	13272.40
6573	177	18	739	7	52847.48	12683.37
6574	177	12	218	9	68647.95	8237.79
6575	177	17	599	6	16202.16	5184.72
6576	177	38	522	10	82148.80	21358.70
6577	177	28	258	15	138774.15	54121.95
6578	177	39	205	4	919.72	202.32
6579	177	24	649	7	60714.50	22464.33
6580	177	30	308	7	8953.42	3581.34
6581	565	48	128	8	25199.68	3779.92
6582	177	35	671	3	7721.94	1158.30
6583	177	25	261	9	20607.03	7418.52
6584	177	30	868	1	3684.52	773.75
6585	798	2	629	8	44710.24	7153.60
6586	177	4	390	10	16374.70	2620.00
6587	177	10	867	2	8851.00	3097.84
6588	75	36	596	7	29729.42	4459.42
6589	177	5	840	3	18515.19	4073.34
6590	177	4	567	3	22004.70	2420.52
6591	177	39	800	6	58794.42	10582.98
6592	177	10	812	9	41176.71	9470.61
6593	177	49	424	9	56306.79	21396.60
6594	177	43	417	9	47035.62	14581.08
6595	542	14	19	2	19688.62	2559.52
6596	177	22	780	10	64082.30	14098.10
6597	177	45	305	4	36004.28	10801.28
6598	177	8	974	10	85714.80	29143.00
6599	177	7	948	8	55122.64	18741.68
6600	177	20	949	4	27000.48	8910.16
6601	177	24	722	6	57614.58	15555.96
6602	177	14	695	11	109504.89	38326.75
6603	177	49	614	2	19580.56	4699.34
6604	177	25	983	1	3487.32	557.97
6605	177	14	940	8	51097.84	6642.72
6606	177	37	689	5	22700.15	7264.05
6607	177	36	211	1	1740.75	591.86
6608	177	18	786	7	30345.21	11531.17
6609	177	15	740	6	37147.62	14859.06
6610	177	39	909	8	39244.00	9811.04
6611	177	28	417	4	20904.72	6480.48
6612	177	22	886	8	9980.96	3792.80
6613	804	10	108	10	61884.20	8663.80
6614	177	33	695	3	29864.97	10452.75
6615	177	38	758	4	19088.76	7444.60
6616	177	40	377	1	2098.28	524.57
6617	177	40	609	9	81837.81	9820.53
6618	177	37	290	1	8876.78	1952.89
6619	177	45	94	5	43697.15	13109.15
6620	177	47	945	9	71986.41	12957.57
6621	177	50	743	3	13403.07	4288.98
6622	177	40	117	9	32552.19	13020.84
6623	177	3	674	1	6616.00	2381.76
6624	177	1	134	4	19339.08	3287.64
6625	177	29	653	10	35069.50	7364.60
6626	177	37	608	10	51904.90	6747.60
6627	177	9	11	2	4893.96	1957.58
6628	177	33	483	8	59060.88	9449.76
6629	177	11	739	3	22648.92	5435.73
6630	177	39	358	7	172.20	51.66
6631	177	27	597	4	31308.80	8766.48
6632	144	18	457	10	16602.40	5146.70
6633	177	34	954	5	39722.00	13902.70
6634	177	47	914	3	15998.85	6239.55
6635	177	27	989	5	3644.55	1020.45
6636	177	41	210	7	37384.41	11215.33
6637	177	11	846	5	33403.25	9686.95
6638	251	49	177	2	11478.76	1607.02
6639	177	38	523	7	56709.52	22116.71
6640	177	44	260	6	2936.82	558.00
6641	177	13	660	4	17700.44	6549.16
6642	177	26	964	1	9486.21	2466.41
6643	177	13	314	5	35526.00	11723.60
6644	177	15	51	8	43844.56	5699.76
6645	177	47	901	7	11756.92	2233.84
6646	177	35	65	2	13087.16	2486.56
6647	177	6	548	7	41678.70	13337.17
6648	814	21	236	4	22279.32	6238.20
6649	177	34	864	6	46391.40	11133.96
6650	177	32	494	3	8741.61	1486.08
6651	177	4	740	4	24765.08	9906.04
6652	177	7	429	10	47530.20	10456.60
6653	177	9	605	1	5547.18	2163.40
6654	177	31	516	1	3455.90	1244.12
6655	177	45	555	4	10285.24	1645.64
6656	177	47	106	9	77886.54	14019.57
6657	557	44	438	2	13404.44	3083.02
6658	177	15	593	2	970.70	359.16
6659	177	6	740	9	55721.43	22288.59
6660	177	36	792	7	25138.96	7541.66
6661	557	44	996	3	24061.29	6977.76
6662	177	23	586	8	53361.36	6936.96
6663	177	4	56	9	69451.92	27780.75
6664	177	45	150	9	74775.78	22432.77
6665	177	22	27	10	45891.90	15603.20
6666	177	2	975	5	6247.60	812.20
6667	177	31	890	10	13784.00	2756.80
6668	177	11	306	1	7220.81	2816.12
6669	177	7	542	8	75492.16	10568.88
6670	447	33	182	9	57188.88	17728.56
6671	177	21	112	3	7835.25	783.51
6672	177	31	901	3	5038.68	957.36
6673	272	46	501	2	16684.84	5839.70
6674	177	38	867	2	8851.00	3097.84
6675	177	47	731	6	33041.04	4956.18
6676	183	3	987	2	16173.20	5337.16
6677	177	14	782	7	9937.55	1291.85
6678	177	11	724	9	83521.17	23385.96
6679	177	33	158	5	43686.00	13979.50
6680	177	6	16	3	12017.40	2163.12
6681	177	8	158	7	61160.40	19571.30
6682	177	6	546	10	59096.70	7091.60
6683	177	50	811	9	88305.93	35322.39
6684	328	46	582	10	21581.80	2158.20
6685	177	37	790	2	8468.84	2710.02
6686	177	49	456	7	37740.22	3774.05
6687	177	38	598	5	11023.05	2866.00
6688	177	26	8	9	30191.22	8151.66
6689	177	36	743	2	8935.38	2859.32
6690	177	11	569	10	41458.00	8706.20
6691	536	29	363	8	62204.96	7464.56
6692	177	45	533	10	32763.30	12450.10
6693	657	20	332	3	29003.85	7541.01
6694	177	17	574	5	42333.25	10583.30
6695	177	18	97	4	38627.60	6566.68
6696	177	2	883	10	25177.80	8560.50
6697	177	28	269	8	68055.28	13611.04
6698	177	16	749	5	8417.40	2272.70
6699	820	36	120	5	39765.25	9146.00
6700	177	22	877	7	20463.24	3478.72
6701	177	50	305	1	9001.07	2700.32
6702	177	3	929	10	15642.70	4380.00
6703	177	11	796	4	26993.68	4588.92
6704	177	39	361	6	23528.16	4235.04
6705	177	44	48	9	36010.26	14043.96
6706	177	1	491	4	27996.24	4199.44
6707	177	4	223	1	8608.38	860.84
6708	177	1	979	10	89093.10	29400.70
6709	177	11	220	9	42518.79	8928.99
6710	177	45	204	3	8722.44	2791.17
6711	177	29	294	8	47124.64	8482.40
6712	177	2	757	2	2172.22	369.28
6713	177	25	520	9	4863.69	1848.24
6714	297	39	934	3	246.78	34.56
6715	177	15	418	8	12363.68	2101.84
6716	177	1	154	3	17290.50	3112.29
6717	177	15	342	8	63614.48	18448.16
6718	177	40	284	4	6824.40	818.92
6719	177	18	96	4	31442.24	5030.76
6720	177	16	695	5	49774.95	17421.25
6721	529	31	729	1	5519.02	1931.66
6722	177	27	35	9	26527.86	7162.56
6723	654	44	42	2	10523.16	3472.64
6724	177	25	114	5	47425.30	13279.10
6725	177	5	514	10	4974.90	646.70
6726	177	14	568	8	68431.20	21213.68
6727	177	45	81	3	18343.26	6970.44
6728	177	10	74	2	710.10	163.32
6729	441	8	333	10	21763.00	6528.90
6730	253	24	135	7	37474.78	5621.21
6731	177	9	848	9	39931.65	9583.56
6732	177	46	636	7	389.62	62.37
6733	177	48	945	6	47990.94	8638.38
6734	607	5	514	5	2487.45	323.35
6735	177	8	890	9	12405.60	2481.12
6736	177	6	831	7	2884.63	576.94
6737	177	20	184	10	17877.60	6972.30
6738	177	15	630	4	5700.52	1653.16
6739	249	35	242	2	19994.34	6598.14
6740	177	3	567	9	66014.10	7261.56
6741	177	29	832	9	50215.68	9540.99
6742	177	35	688	3	26745.84	3209.49
6743	753	8	640	9	49565.34	14373.99
6744	177	43	683	3	1427.49	471.06
6745	33	27	756	7	27725.60	9149.42
6746	177	49	645	6	1175.04	411.24
6747	177	32	53	8	78199.92	8602.00
6748	177	49	173	7	44887.01	16159.29
6749	177	12	169	2	14871.08	2379.38
6750	177	9	393	10	48072.70	17306.20
6751	177	12	465	4	14400.12	3312.04
6752	177	29	337	2	13869.12	2080.36
6753	177	19	350	2	14065.74	5485.64
6754	853	35	839	7	64544.90	7099.96
6755	177	22	29	6	36154.62	7954.02
6756	177	15	465	8	28800.24	6624.08
6757	177	33	927	8	62092.40	17385.84
6758	177	25	7	9	42246.99	6337.08
6759	177	39	119	10	17138.20	4455.90
6760	177	14	603	7	18314.73	5494.44
6761	177	6	502	3	17951.37	3769.80
6762	177	35	626	5	23067.15	8073.50
6763	119	13	23	4	22690.56	6126.44
6764	641	14	573	5	8022.15	2486.85
6765	177	7	461	2	13999.34	1539.92
6766	177	14	786	10	43350.30	16473.10
6767	797	3	433	1	1335.24	467.33
6768	177	37	23	1	5672.64	1531.61
6769	177	46	47	5	20738.15	8295.25
6770	405	37	394	1	6381.39	1340.09
6771	177	14	67	9	62969.04	10075.05
6772	177	28	389	9	8648.10	3372.75
6773	177	20	731	1	5506.84	826.03
6774	177	25	523	9	72912.24	28435.77
6775	177	30	628	9	36253.89	8700.93
6776	177	24	899	10	61265.20	15929.00
6777	177	19	919	8	72794.48	10191.20
6778	177	10	974	4	34285.92	11657.20
6779	478	18	778	2	11416.50	4338.28
6780	177	12	502	7	41886.53	8796.20
6781	177	39	827	3	5462.31	928.59
6782	177	35	62	5	22184.30	5102.40
6783	177	39	710	7	58776.41	23510.55
6784	575	28	78	1	6493.90	909.15
6785	177	42	132	7	21339.01	7041.86
6786	177	39	686	8	27357.92	6839.52
6787	177	24	117	9	32552.19	13020.84
6788	177	24	814	1	8564.30	2997.50
6789	177	30	657	1	426.72	68.28
6790	177	36	5	8	69818.88	24436.64
6791	177	9	635	1	2772.68	388.18
6792	177	23	729	7	38633.14	13521.62
6793	177	49	147	13	106085.07	23338.77
6794	177	35	834	7	23482.83	9393.16
6795	337	26	136	7	37939.51	8726.06
6796	284	13	921	3	13230.30	4630.59
6797	177	48	683	4	1903.32	628.08
6798	177	50	430	4	4353.56	740.12
6799	177	25	338	10	31105.90	12442.40
6800	177	44	50	10	19780.90	5143.00
6801	689	12	731	6	33041.04	4956.18
6802	177	33	735	7	62543.04	21890.05
6803	177	23	230	8	48894.32	6356.24
6804	177	7	540	3	16443.06	1644.30
6805	177	5	671	5	12869.90	1930.50
6806	177	37	218	5	38137.75	4576.55
6807	177	41	65	2	13087.16	2486.56
6808	177	37	82	9	64526.85	15486.48
6809	408	33	727	5	42202.40	16036.90
6810	177	6	889	1	4413.27	1015.05
6811	177	1	394	2	12762.78	2680.18
6812	297	39	737	5	48873.75	5376.10
6813	177	12	200	3	23667.96	5443.62
6814	177	14	152	9	21884.22	3501.45
6815	177	26	456	2	10782.92	1078.30
6816	177	15	610	6	52438.14	6292.56
6817	177	1	75	3	11964.21	1196.43
6818	177	10	383	6	47086.08	9888.06
6819	177	50	71	4	15329.04	3219.08
6820	177	8	602	7	23518.32	4468.45
6821	177	2	276	6	57697.80	20771.22
6822	458	39	659	8	46583.92	10248.48
6823	177	38	194	4	21748.88	3262.32
6824	177	27	915	5	12437.60	2611.90
6825	177	9	991	3	9744.96	1559.19
6826	538	9	266	9	59457.87	20810.25
6827	177	50	547	3	22273.08	2895.51
6828	177	26	195	10	99313.00	10924.40
6829	177	44	515	7	61817.00	17926.93
6830	773	48	370	1	1339.25	241.07
6831	477	12	876	2	2446.34	954.08
6832	177	47	51	10	54805.70	7124.70
6833	177	12	733	1	9104.72	2094.09
6834	177	47	495	10	56585.80	17541.60
6835	177	9	575	2	11118.98	4225.22
6836	177	14	195	5	49656.50	5462.20
6837	177	47	520	4	2161.64	821.44
6838	177	26	173	1	6412.43	2308.47
6839	177	48	848	2	8873.70	2129.68
6840	177	38	862	9	53577.72	12858.66
6841	177	20	495	7	39610.06	12279.12
6842	177	6	595	7	57645.77	10376.24
6843	177	5	118	3	7009.62	1892.61
6844	177	30	305	6	54006.42	16201.92
6845	177	9	813	10	64746.60	15539.20
6846	177	34	595	2	16470.22	2964.64
6847	177	21	881	6	56072.76	22429.08
6848	177	18	143	10	40941.60	15557.80
6849	177	40	864	8	61855.20	14845.28
6850	586	24	832	9	50215.68	9540.99
6851	177	31	853	2	13932.58	3761.80
6852	177	31	299	5	45198.50	7683.75
6853	177	4	115	20	89814.60	18861.00
6854	177	31	594	1	7268.74	2398.68
6855	815	44	1000	7	15564.71	4980.71
6856	177	6	816	3	3590.94	1220.91
6857	789	4	785	8	37208.24	11162.48
6858	806	3	348	2	1339.60	522.44
6859	177	43	117	10	36169.10	14467.60
6860	177	1	683	5	2379.15	785.10
6861	132	12	554	8	32098.64	10592.56
6862	16	4	890	8	11027.20	2205.44
6863	177	49	100	5	28664.85	6019.60
6864	177	50	328	10	79615.90	25477.10
6865	177	45	988	3	10435.98	1982.85
6866	177	49	193	8	40981.36	10245.36
6867	740	35	47	6	24885.78	9954.30
6868	177	35	740	7	43338.89	17335.57
6869	177	1	453	6	54262.92	13565.76
6870	177	34	496	7	2702.84	783.79
6871	663	38	364	6	37583.34	9771.66
6872	177	32	62	5	22184.30	5102.40
6873	177	15	921	6	26460.60	9261.18
6874	177	14	261	4	9158.68	3297.12
6875	177	10	853	2	13932.58	3761.80
6876	845	35	282	4	11508.64	4488.36
6877	76	32	125	4	14098.04	5075.28
6878	365	12	169	9	66919.86	10707.21
6879	177	38	673	11	57773.10	16754.21
6880	177	48	708	6	38136.42	11059.56
6881	177	12	501	7	58396.94	20438.95
6882	177	32	286	4	18816.16	5456.68
6883	177	3	857	3	10321.41	1032.15
6884	177	9	41	8	3425.04	993.28
6885	177	21	707	9	25452.09	4072.32
6886	177	18	993	4	28805.76	7201.44
6887	177	6	576	8	7980.96	2553.92
6888	177	10	212	4	20515.56	3897.96
6889	177	6	752	5	15555.40	4977.75
6890	177	48	9	10	73297.60	22722.30
6891	177	5	627	8	46923.36	7038.48
6892	177	32	321	5	29069.60	6976.70
6893	177	31	990	5	37467.55	7868.20
6894	177	6	729	6	33114.12	11589.96
6895	177	39	129	4	34920.92	6984.20
6896	177	16	778	4	22833.00	8676.56
6897	177	1	140	7	52863.16	17444.84
6898	177	39	888	10	57577.90	15546.00
6899	177	27	350	7	49230.09	19199.74
6900	177	22	732	4	11133.92	1224.72
6901	177	20	612	9	78053.13	18732.78
6902	177	18	560	5	46464.40	16262.55
6903	177	16	928	8	48669.60	16060.96
6904	177	34	906	1	7903.56	2371.07
6905	177	31	886	10	12476.20	4741.00
6906	177	19	388	2	11159.96	2901.58
6907	177	27	339	10	74859.70	27698.10
6908	177	46	778	6	34249.50	13014.84
6909	177	48	168	4	2629.08	289.20
6910	177	7	459	7	4179.63	1462.86
6911	769	26	639	7	60571.91	20594.42
6912	177	28	705	1	7593.52	1366.83
6913	177	39	969	8	19590.08	2350.80
6914	177	16	58	10	95592.80	19118.60
6915	177	28	620	3	11366.10	4091.79
6916	177	22	758	4	19088.76	7444.60
6917	177	33	468	10	20944.60	2513.40
6918	720	36	920	3	1169.55	385.95
6919	177	37	698	9	29578.86	3253.68
6920	177	7	896	11	10026.61	2005.30
6921	177	4	802	5	15039.10	4511.75
6922	177	9	995	8	76996.64	20789.12
6923	177	45	381	7	8179.57	2372.09
6924	177	4	221	8	52678.32	15803.52
6925	191	33	727	6	50642.88	19244.28
6926	177	2	735	6	53608.32	18762.90
6927	177	37	663	2	15160.70	5761.06
6928	177	47	951	9	25594.83	7678.44
6929	177	37	408	8	79603.28	22288.88
6930	177	39	217	9	42242.67	14362.47
6931	177	45	288	7	6957.58	2226.42
6932	408	33	382	5	10846.50	1843.90
6933	177	50	62	9	39931.74	9184.32
6934	177	10	652	7	29690.36	11876.13
6935	177	28	383	7	54933.76	11536.07
6936	177	16	572	6	37261.74	10433.28
6937	177	18	743	5	22338.45	7148.30
6938	177	26	814	6	51385.80	17985.00
6939	177	12	967	5	48186.10	16865.15
6940	126	18	940	5	31936.15	4151.70
6941	177	38	33	1	3954.49	1186.35
6942	177	27	640	3	16521.78	4791.33
6943	177	22	38	5	24465.10	6605.60
6944	177	6	742	7	51276.26	17433.92
6945	177	4	920	3	1169.55	385.95
6946	177	8	745	1	8155.53	1386.44
6947	177	6	270	8	2082.96	687.36
6948	177	38	799	10	58600.50	16408.10
6949	177	17	940	9	57485.07	7473.06
6950	874	9	618	8	55943.28	20139.60
6951	177	7	725	7	39431.63	4337.48
6952	177	32	190	7	39681.95	11110.96
6953	177	33	551	8	56909.92	13658.40
6954	126	18	430	4	4353.56	740.12
6955	177	18	575	4	22237.96	8450.44
6956	177	43	591	9	5363.28	589.95
6957	177	24	519	7	2493.89	897.82
6958	177	39	9	1	7329.76	2272.23
6959	177	23	181	8	29822.40	9543.20
6960	132	12	981	1	1771.06	425.05
6961	177	20	926	5	26517.80	7425.00
6962	177	38	514	3	1492.47	194.01
6963	177	5	63	2	15478.36	2476.54
6964	177	2	89	4	23117.08	8553.32
6965	177	32	91	3	29831.61	6861.27
6966	177	43	669	1	3258.34	749.42
6967	177	28	441	2	13508.34	3377.08
6968	177	31	88	8	14004.88	4061.44
6969	177	42	287	4	11623.60	4300.72
6970	689	12	526	3	2210.76	287.40
6971	177	35	260	1	489.47	93.00
6972	177	22	878	5	30766.55	3999.65
6973	177	31	495	9	50927.22	15787.44
6974	177	45	244	2	12287.92	4792.28
6975	177	49	356	5	22293.40	4235.75
6976	177	47	863	8	25530.40	9701.52
6977	748	35	359	8	41345.44	13644.00
6978	177	13	187	10	14992.60	1649.20
6979	30	17	43	3	28956.93	4922.67
6980	177	35	333	10	21763.00	6528.90
6981	177	36	561	8	15838.24	3959.52
6982	177	21	890	8	11027.20	2205.44
6983	177	7	145	4	30145.24	10852.28
6984	177	18	253	10	8471.10	2033.10
6985	177	22	571	10	62921.00	6921.30
6986	177	19	902	3	2741.79	603.18
6987	177	4	654	1	8313.77	2161.58
6988	177	32	676	1	465.10	139.53
6989	177	40	802	4	12031.28	3609.40
6990	177	10	792	10	35912.80	10773.80
6991	177	5	581	1	5046.39	1261.60
6992	177	15	652	2	8482.96	3393.18
6993	177	5	681	2	10244.70	1434.26
6994	177	6	551	1	7113.74	1707.30
6995	177	32	807	5	26893.85	9412.85
6996	177	18	287	2	5811.80	2150.36
6997	177	19	912	6	29730.78	3567.72
6998	177	38	479	2	1287.68	154.52
6999	177	19	733	4	36418.88	8376.36
7000	177	7	721	5	49836.20	11960.70
7001	177	6	423	9	80602.47	14508.45
7002	802	45	202	9	79075.35	13442.85
7003	177	13	570	1	2123.62	722.03
7004	177	30	803	9	50762.61	7106.76
7005	177	13	233	2	9078.22	3177.38
7006	753	8	518	1	247.88	52.05
7007	177	35	299	4	36158.80	6147.00
7008	280	22	496	4	1544.48	447.88
7009	177	22	865	6	55259.76	9394.14
7010	177	9	603	6	15698.34	4709.52
7011	177	28	187	3	4497.78	494.76
7012	177	4	951	4	11375.48	3412.64
7013	177	34	541	10	77708.00	30306.10
7014	177	5	522	5	41074.40	10679.35
7015	177	31	584	2	10029.34	3209.38
7016	177	32	208	1	7574.58	2499.61
7017	177	24	40	8	35600.96	7832.24
7018	177	34	179	4	1307.12	366.00
7019	177	10	292	7	55404.72	16067.38
7020	177	18	131	7	3314.15	1226.26
7021	177	44	287	3	8717.70	3225.54
7022	177	5	281	2	9245.22	2033.94
7023	177	9	61	2	3500.56	1365.22
7024	177	49	561	5	9898.90	2474.70
7025	177	6	370	7	9374.75	1687.49
7026	177	22	769	2	18979.46	3416.30
7027	177	48	275	7	51109.94	16355.15
7028	177	26	988	1	3478.66	660.95
7029	177	14	23	4	22690.56	6126.44
7030	177	6	783	8	68321.12	23229.20
7031	177	29	68	4	31089.52	11814.00
7032	434	9	657	10	4267.20	682.80
7033	177	8	619	4	4188.92	712.12
7034	177	18	543	8	31947.84	8945.36
7035	177	25	997	7	32034.94	4805.22
7036	177	39	195	6	59587.80	6554.64
7037	197	2	53	6	58649.94	6451.50
7038	177	20	986	7	53430.16	17631.95
7039	844	42	164	2	5143.02	1131.46
7040	177	22	565	4	7434.32	2602.00
7041	177	44	8	10	33545.80	9057.40
7042	177	5	257	5	23646.00	3310.45
7043	177	31	642	7	33748.75	11137.07
7044	177	33	134	6	29008.62	4931.46
7045	177	35	731	4	22027.36	3304.12
7046	177	27	82	11	78866.15	18927.92
7047	177	17	194	3	16311.66	2446.74
7048	177	30	658	9	76552.47	20669.13
7049	131	24	133	6	25562.34	8691.18
7050	177	35	35	10	29475.40	7958.40
7051	177	7	306	1	7220.81	2816.12
7052	197	2	520	3	1621.23	616.08
7053	177	17	492	1	2051.85	471.93
7054	177	11	780	1	6408.23	1409.81
7055	177	36	12	6	59004.18	10030.74
7056	177	40	700	4	20308.56	6092.56
7057	177	37	757	3	3258.33	553.92
7058	477	12	905	8	7618.96	1828.56
7059	177	6	648	5	33906.65	9154.80
7060	177	35	621	6	26126.16	8882.88
7061	177	26	537	7	48596.24	13606.95
7062	177	31	627	2	11730.84	1759.62
7063	177	31	7	1	4694.11	704.12
7064	177	1	779	2	13938.74	4321.00
7065	177	33	743	6	26806.14	8577.96
7066	177	23	870	3	13212.96	4888.80
7067	807	20	2	7	14070.84	2110.64
7068	177	22	862	19	113108.52	27146.06
7069	177	3	236	1	5569.83	1559.55
7070	177	18	455	2	7948.94	1033.36
7071	177	35	802	6	18046.92	5414.10
7072	177	42	866	2	5907.04	590.70
7073	177	38	389	5	4804.50	1873.75
7074	583	43	93	7	35125.58	11240.18
7075	177	45	408	8	79603.28	22288.88
7076	177	45	357	5	47032.60	14580.10
7077	177	21	285	18	53030.16	7954.56
7078	177	22	784	3	27135.93	10311.66
7079	177	45	255	4	2044.08	776.76
7080	177	22	651	2	13564.58	4069.38
7081	177	14	693	8	38166.08	13739.76
7082	177	11	911	2	4724.04	1086.52
7083	177	41	209	8	13072.80	4706.24
7084	177	12	134	2	9669.54	1643.82
7085	177	16	380	6	15734.28	3618.90
7086	177	42	290	7	62137.46	13670.23
7087	177	16	654	3	24941.31	6484.74
7088	177	35	929	6	9385.62	2628.00
7089	177	22	452	3	7008.18	2102.46
7090	177	44	675	10	4651.10	1674.40
7091	167	3	984	4	22638.64	2943.04
7092	437	29	24	9	11716.56	2460.51
7093	177	3	207	6	43867.56	14914.98
7094	177	31	774	7	61004.65	11590.88
7095	425	1	463	3	28276.59	6220.86
7096	177	39	420	9	44457.30	13337.19
7097	870	21	16	9	36052.20	6489.36
7098	177	31	441	4	27016.68	6754.16
7099	177	50	60	10	26986.00	2968.50
7100	728	12	333	6	13057.80	3917.34
7101	738	40	163	6	20221.14	5257.50
7102	177	30	331	10	21462.60	7511.90
7103	177	35	326	3	23139.75	4165.17
7104	167	47	638	6	52087.80	19272.48
7105	177	7	143	3	12282.48	4667.34
7106	177	46	827	10	18207.70	3095.30
7107	177	10	872	8	6802.08	884.24
7108	177	35	528	12	115145.76	37998.12
7109	177	11	876	4	4892.68	1908.16
7110	177	48	942	8	14325.68	2148.88
7111	177	15	374	3	4967.76	1043.22
7112	177	49	110	4	37403.48	6358.60
7113	177	41	296	1	6138.87	1473.33
7114	177	46	928	8	48669.60	16060.96
7115	177	28	81	3	18343.26	6970.44
7116	177	15	710	1	8396.63	3358.65
7117	177	31	107	2	16983.82	5434.82
7118	177	16	457	3	4980.72	1544.01
7119	177	28	308	8	10232.48	4092.96
7120	177	46	756	5	19804.00	6535.30
7121	177	22	126	7	29825.18	3579.03
7122	177	3	42	3	15784.74	5208.96
7123	177	16	768	1	9948.39	3282.97
7124	788	13	352	8	76515.84	16068.32
7125	177	8	574	4	33866.60	8466.64
7126	177	2	25	6	36116.46	13001.94
7127	177	50	3	8	69149.36	17287.36
7128	177	30	23	8	45381.12	12252.88
7129	262	31	355	7	66992.66	9378.95
7130	177	37	662	1	2537.08	507.42
7131	177	9	639	3	25959.39	8826.18
7132	177	18	266	1	6606.43	2312.25
7133	177	49	286	5	23520.20	6820.85
7134	641	47	934	1	82.26	11.52
7135	177	10	314	3	21315.60	7034.16
7136	177	19	379	6	40792.02	4487.10
7137	177	26	278	6	49261.92	14778.60
7138	177	26	869	10	94364.90	32084.10
7139	177	45	66	1	2143.52	835.97
7140	220	3	980	10	75729.20	15145.80
7141	101	5	545	10	5768.70	2076.70
7142	586	24	458	3	21155.19	6135.00
7143	595	10	598	1	2204.61	573.20
7144	177	41	521	10	84694.40	33030.80
7145	177	34	24	9	11716.56	2460.51
7146	177	36	20	4	10774.36	2154.88
7147	177	15	538	1	5882.34	823.53
7148	177	30	208	2	15149.16	4999.22
7149	833	6	148	7	11520.18	3456.04
7150	177	8	385	4	22924.52	6189.64
7151	177	4	313	6	56167.98	20782.14
7152	177	41	964	6	56917.26	14798.46
7153	177	40	113	10	11764.80	2823.60
7154	177	46	674	8	52928.00	19054.08
7155	177	32	718	3	25888.77	5954.43
7156	177	9	372	7	56794.08	15902.32
7157	46	46	968	8	29979.52	7794.64
7158	684	15	654	7	58196.39	15131.06
7159	177	35	894	1	5349.62	1551.39
7160	101	5	799	3	17580.15	4922.43
7161	177	16	938	1	3284.44	952.49
7162	243	39	545	10	5768.70	2076.70
7163	177	2	559	3	18430.38	5160.51
7164	177	50	145	9	67826.79	24417.63
7165	177	4	906	7	55324.92	16597.49
7166	177	11	773	8	10079.68	2519.92
7167	177	1	435	6	44065.38	13219.62
7168	177	14	936	2	9257.34	2962.34
7169	177	1	699	8	32092.72	8344.08
7170	360	10	810	1	4182.56	1589.37
7171	177	16	356	1	4458.68	847.15
7172	177	36	849	1	3880.11	1513.24
7173	177	4	339	2	14971.94	5539.62
7174	177	30	959	10	68996.10	16559.10
7175	177	10	513	4	28101.00	7306.28
7176	83	44	383	2	15695.36	3296.02
7177	177	25	347	2	14460.10	3036.62
7178	177	36	937	9	4373.91	568.62
7179	177	8	901	1	1679.56	319.12
7180	630	11	740	4	24765.08	9906.04
7181	177	35	78	4	25975.60	3636.60
7182	575	28	516	7	24191.30	8708.84
7183	349	10	430	4	4353.56	740.12
7184	177	2	240	9	14859.36	1931.76
7185	177	8	536	2	14140.82	3818.02
7186	177	12	225	10	56550.20	17530.60
7187	177	19	700	2	10154.28	3046.28
7188	177	10	883	2	5035.56	1712.10
7189	177	37	908	4	23832.68	8818.08
7190	177	42	727	1	8440.48	3207.38
7191	177	10	44	2	12829.04	2694.10
7192	177	11	803	5	28201.45	3948.20
7193	281	37	540	6	32886.12	3288.60
7194	684	15	906	3	23710.68	7113.21
7195	177	6	112	1	2611.75	261.17
7196	177	16	152	6	14589.48	2334.30
7197	177	14	88	5	8753.05	2538.40
7198	177	12	177	8	45915.04	6428.08
7199	177	10	458	10	70517.30	20450.00
7200	36	26	942	8	14325.68	2148.88
7201	177	15	271	1	5975.63	1135.37
7202	177	43	209	1	1634.10	588.28
7203	395	11	585	4	21496.32	2364.60
7204	272	49	639	2	17306.26	5884.12
7205	177	7	169	5	37177.70	5948.45
7206	177	18	774	4	34859.80	6623.36
7207	487	5	24	9	11716.56	2460.51
7208	177	30	387	11	59416.83	18419.17
7209	177	20	911	11	25982.22	5975.86
7210	177	19	487	8	53267.20	15980.16
7211	177	28	80	6	28858.08	11254.68
7212	101	5	849	10	38801.10	15132.40
7213	177	20	895	6	31664.58	12032.52
7214	177	50	601	10	39565.40	9495.70
7215	177	9	845	9	79936.38	16786.62
7216	177	32	238	3	21305.22	8095.98
7217	144	18	642	3	14463.75	4773.03
7218	781	7	449	2	17388.24	2608.24
7219	177	5	337	10	69345.60	10401.80
7220	177	42	956	2	16676.26	4669.36
7221	177	5	217	10	46936.30	15958.30
7222	177	43	579	12	65162.64	23458.56
7223	177	47	29	6	36154.62	7954.02
7224	177	37	291	4	9612.44	3364.36
7225	177	7	840	14	86404.22	19008.92
7226	177	5	534	10	89860.80	15276.30
7227	177	25	815	1	6576.31	1117.97
7228	177	7	775	15	3089.40	401.55
7229	177	48	822	6	32173.44	8365.08
7230	177	1	997	3	13729.26	2059.38
7231	177	39	263	4	37489.36	7122.96
7232	177	29	733	6	54628.32	12564.54
7233	177	4	933	7	56383.88	20298.18
7234	177	37	26	5	18313.50	1831.35
7235	177	17	714	10	87309.30	33177.50
7236	177	48	804	9	40786.65	15498.90
7237	177	39	3	6	51862.02	12965.52
7238	844	12	939	4	8742.36	3496.96
7239	671	18	255	10	5110.20	1941.90
7240	177	27	531	6	36423.36	8377.38
7241	291	2	727	7	59083.36	22451.66
7242	177	48	457	1	1660.24	514.67
7243	177	18	857	12	41285.64	4128.60
7244	207	29	366	7	1490.09	149.03
7245	177	10	724	7	64960.91	18189.08
7246	177	12	587	4	594.60	172.44
7247	177	41	674	9	59544.00	21435.84
7248	177	14	476	5	41719.65	12933.10
7249	177	14	964	4	37944.84	9865.64
7250	177	2	838	6	30767.10	6768.78
7251	365	12	774	9	78434.55	14902.56
7252	177	24	302	6	39134.64	15653.88
7253	177	21	731	2	11013.68	1652.06
7254	132	12	113	7	8235.36	1976.52
7255	177	47	956	5	41690.65	11673.40
7256	738	40	682	1	1393.18	417.95
7257	177	3	185	10	77215.40	15443.10
7258	660	47	988	8	27829.28	5287.60
7259	177	7	740	7	43338.89	17335.57
7260	177	39	340	1	7752.69	2170.75
7261	177	13	262	5	37803.80	11341.15
7262	177	15	550	4	18664.12	2239.68
7263	177	29	858	2	19336.68	6767.84
7264	177	34	429	3	14259.06	3136.98
7265	177	38	340	5	38763.45	10853.75
7266	177	21	622	5	19441.25	1944.10
7267	177	23	713	9	72294.93	18796.68
7268	177	32	442	10	59591.60	13706.10
7269	177	6	589	4	22002.32	8800.92
7270	177	38	983	2	6974.64	1115.94
7271	177	44	358	1	24.60	7.38
7272	580	9	658	9	76552.47	20669.13
7273	177	22	215	8	77042.96	16179.04
7274	177	48	51	5	27402.85	3562.35
7275	177	47	493	6	14993.22	2848.74
7276	177	29	645	5	979.20	342.70
7277	177	23	412	6	48041.94	5765.04
7278	177	16	860	10	93905.10	28171.50
7279	467	28	361	7	27449.52	4940.88
7280	527	17	174	1	6376.53	1785.43
7281	177	26	568	7	59877.30	18561.97
7282	177	9	183	4	1734.00	450.84
7283	177	9	158	3	26211.60	8387.70
7284	461	40	113	1	1176.48	282.36
7285	234	31	738	3	6950.31	1529.07
7286	7	30	844	8	72091.12	28115.52
7287	177	27	91	6	59663.22	13722.54
7288	615	12	128	8	25199.68	3779.92
7289	177	19	419	13	41300.09	14867.97
7290	177	49	951	1	2843.87	853.16
7291	177	40	809	3	12922.68	4393.71
7292	660	47	109	6	23150.94	6250.74
7293	177	37	712	4	16351.84	3106.84
7294	862	32	362	5	47107.25	14132.15
7295	177	7	962	8	57715.84	11543.20
7296	177	48	535	10	99369.20	35772.90
7297	177	16	869	10	94364.90	32084.10
7298	177	8	291	7	16821.77	5887.63
7299	177	40	491	4	27996.24	4199.44
7300	177	44	668	2	7702.46	2233.72
7301	177	29	83	1	7862.87	2752.00
7302	331	11	367	5	806.35	209.65
7303	689	12	446	2	19165.48	5749.64
7304	532	24	775	1	205.96	26.77
7305	177	40	542	6	56619.12	7926.66
7306	177	29	972	10	24419.50	8302.60
7307	177	45	183	2	867.00	225.42
7308	177	48	871	5	8365.90	920.25
7309	177	26	656	2	2109.76	232.08
7310	177	31	224	9	67809.78	8137.17
7311	177	9	794	1	4720.14	613.62
7312	177	37	360	10	16674.30	2834.60
7313	177	45	78	7	45457.30	6364.05
7314	177	37	566	9	29298.15	8789.49
7315	177	50	421	1	2192.99	657.90
7316	177	15	63	6	46435.08	7429.62
7317	177	12	250	1	3738.84	1196.43
7318	177	18	763	8	30299.12	8786.72
7319	581	32	673	5	26260.50	7615.55
7320	177	24	758	2	9544.38	3722.30
7321	177	32	408	7	69652.87	19502.77
7322	808	42	644	4	3422.72	1163.72
7323	177	22	132	9	27435.87	9053.82
7324	654	44	556	10	62226.00	11200.70
7325	177	47	763	10	37873.90	10983.40
7326	177	37	664	3	3520.62	387.27
7327	177	29	804	6	27191.10	10332.60
7328	177	22	74	1	355.05	81.66
7329	177	49	554	7	28086.31	9268.49
7330	177	42	851	15	64566.15	9039.30
7331	177	15	105	6	21187.62	6568.14
7332	742	33	441	2	13508.34	3377.08
7333	177	31	264	3	27194.85	3807.27
7334	137	45	289	3	17663.07	3532.62
7335	177	6	96	6	47163.36	7546.14
7336	177	20	802	8	24062.56	7218.80
7337	177	22	675	11	5116.21	1841.84
7338	177	18	317	15	59898.60	22761.45
7339	177	33	69	1	6379.30	1850.00
7340	177	44	698	10	32865.40	3615.20
7341	177	6	415	1	6525.51	783.06
7342	177	46	252	2	15442.16	1853.06
7343	177	14	694	7	339.36	50.89
7344	177	29	699	10	40115.90	10430.10
7345	177	43	532	1	8956.97	1074.84
7346	177	28	702	6	52995.78	14838.84
7347	177	22	498	4	28328.12	10481.40
7348	191	44	598	3	6613.83	1719.60
7349	177	12	726	3	13004.37	4291.44
7350	177	19	501	6	50054.52	17519.10
7351	177	15	589	5	27502.90	11001.15
7352	177	6	316	2	7575.76	2727.28
7353	491	47	355	10	95703.80	13398.50
7354	177	46	152	3	7294.74	1167.15
7355	250	32	116	3	6725.37	1345.08
7356	177	46	375	8	58710.00	23484.00
7357	177	26	454	4	19355.72	3484.04
7358	177	31	734	10	13623.70	5313.20
7359	786	10	825	7	7857.78	2278.78
7360	177	20	924	1	7023.60	702.36
7361	177	26	347	6	43380.30	9109.86
7362	177	50	9	9	65967.84	20450.07
7363	177	5	752	1	3111.08	995.55
7364	177	35	779	3	20908.11	6481.50
7365	177	48	488	8	77010.00	8471.12
7366	177	34	508	9	86456.88	17291.34
7367	177	9	488	9	86636.25	9530.01
7368	177	4	570	9	19112.58	6498.27
7369	177	41	650	7	58352.42	21590.38
7370	177	17	455	11	43719.17	5683.48
7371	177	50	124	3	14243.82	4273.14
7372	177	30	519	8	2850.16	1026.08
7373	177	40	991	10	32483.20	5197.30
7374	761	20	287	6	17435.40	6451.08
7375	559	14	632	4	1031.08	216.52
7376	177	36	709	14	100559.76	29162.28
7377	177	49	894	10	53496.20	15513.90
7378	177	30	410	3	3738.87	1420.77
7379	177	29	765	7	207.27	45.57
7380	177	29	551	5	35568.70	8536.50
7381	177	29	69	3	19137.90	5550.00
7382	177	4	744	7	6011.25	1382.57
7383	177	23	291	1	2403.11	841.09
7384	177	8	554	9	36110.97	11916.63
7385	177	44	51	7	38363.99	4987.29
7386	177	6	93	1	5017.94	1605.74
7387	177	2	932	9	28807.02	2880.72
7388	177	46	996	8	64163.44	18607.36
7389	177	36	733	10	91047.20	20940.90
7390	177	32	120	8	63624.40	14633.60
7391	177	30	407	9	39938.40	13978.44
7392	177	32	603	7	18314.73	5494.44
7393	177	15	464	7	3648.47	1276.94
7394	177	1	570	1	2123.62	722.03
7395	177	5	170	5	46412.80	17636.85
7396	653	41	901	1	1679.56	319.12
7397	177	36	781	8	27297.60	3548.72
7398	119	13	625	10	67310.60	15481.40
7399	177	6	300	4	31607.28	10114.32
7400	146	31	7	4	18776.44	2816.48
7401	177	31	907	3	150.42	18.06
7402	177	17	890	10	13784.00	2756.80
7403	177	31	101	8	67971.60	18352.32
7404	177	19	77	6	41206.08	9477.42
7405	177	43	357	9	84658.68	26244.18
7406	270	13	517	2	13912.50	3478.12
7407	177	28	514	1	497.49	64.67
7408	417	31	26	1	3662.70	366.27
7409	177	26	753	4	20317.48	5282.56
7410	177	50	16	20	80116.00	14420.80
7411	177	21	106	2	17308.12	3115.46
7412	177	45	156	7	8013.32	1362.27
7413	199	49	609	5	45465.45	5455.85
7414	177	43	358	3	73.80	22.14
7415	397	28	902	4	3655.72	804.24
7416	177	44	300	7	55312.74	17700.06
7417	177	22	655	4	27668.16	4980.28
7418	720	43	756	2	7921.60	2614.12
7419	177	15	964	5	47431.05	12332.05
7420	250	32	555	5	12856.55	2057.05
7421	177	10	174	5	31882.65	8927.15
7422	177	6	402	4	15531.88	2329.80
7423	177	38	406	9	29675.70	9496.26
7424	177	19	11	1	2446.98	978.79
7425	177	29	463	10	94255.30	20736.20
7426	177	41	205	7	1609.51	354.06
7427	76	32	606	6	55378.32	21043.74
7428	177	5	706	10	82269.00	8226.90
7429	177	20	944	16	71865.92	19403.84
7430	177	19	375	8	58710.00	23484.00
7431	177	11	13	1	8247.19	1237.08
7432	177	39	707	6	16968.06	2714.88
7433	653	41	1000	8	17788.24	5692.24
7434	250	32	986	9	68695.92	22669.65
7435	177	40	739	1	7549.64	1811.91
7436	177	3	687	1	1914.19	497.69
7437	177	41	382	2	4338.60	737.56
7438	177	29	273	1	3632.66	690.21
7439	177	7	1000	9	20011.77	6403.77
7440	177	29	11	5	12234.90	4893.95
7441	177	10	462	10	51894.90	17644.30
7442	477	12	761	7	68917.17	22053.50
7443	177	14	33	8	31635.92	9490.80
7444	177	13	371	4	16477.12	4284.04
7445	177	45	709	7	50279.88	14581.14
7446	177	5	838	4	20511.40	4512.52
7447	177	36	540	4	21924.08	2192.40
7448	177	39	871	1	1673.18	184.05
7449	177	6	306	7	50545.67	19712.84
7450	177	39	838	10	51278.50	11281.30
7451	862	32	851	6	25826.46	3615.72
7452	177	14	242	9	89974.53	29691.63
7453	177	37	5	1	8727.36	3054.58
7454	177	37	620	3	11366.10	4091.79
7455	177	49	842	3	11800.11	2714.04
7456	452	14	336	9	37728.54	4904.73
7457	33	27	106	5	43270.30	7788.65
7458	810	41	174	10	63765.30	17854.30
7459	177	17	946	8	70600.00	24004.00
7460	177	43	202	13	114219.95	19417.45
7461	177	13	554	3	12036.99	3972.21
7462	177	29	890	10	13784.00	2756.80
7463	177	5	879	8	39226.80	9806.72
7464	177	32	239	3	6123.69	1898.34
7465	177	41	163	4	13480.76	3505.00
7466	177	48	476	9	75095.37	23279.58
7467	177	4	353	5	10943.30	3064.10
7468	177	11	86	8	57936.24	6372.96
7469	200	12	446	10	95827.40	28748.20
7470	177	41	68	4	31089.52	11814.00
7471	177	38	231	7	49836.85	11960.83
7472	177	10	459	6	3582.54	1253.88
7473	177	3	954	7	55610.80	19463.78
7474	175	1	74	2	710.10	163.32
7475	177	41	556	9	56003.40	10080.63
7476	177	34	518	2	495.76	104.10
7477	177	24	603	7	18314.73	5494.44
7478	802	45	348	8	5358.40	2089.76
7479	177	2	146	6	19627.44	2355.30
7480	177	16	228	4	28969.72	10718.80
7481	177	36	182	3	19062.96	5909.52
7482	177	39	408	10	99504.10	27861.10
7483	177	1	560	10	92928.80	32525.10
7484	177	14	531	4	24282.24	5584.92
7485	95	1	139	1	9047.48	1899.97
7486	177	34	180	1	3557.00	1422.80
7487	510	46	985	5	37657.30	3765.75
7488	177	30	382	8	17354.40	2950.24
7489	34	3	704	10	88267.00	32658.80
7490	177	32	4	7	48101.41	12506.34
7491	177	16	483	10	73826.10	11812.20
7492	177	27	515	4	35324.00	10243.96
7493	177	30	754	4	134.44	36.28
7494	177	30	643	2	14360.90	3303.00
7495	177	37	769	5	47448.65	8540.75
7496	177	8	284	4	6824.40	818.92
7497	177	16	590	10	90616.00	11780.10
7498	177	1	598	7	15432.27	4012.40
7499	177	43	525	4	27557.20	9920.60
7500	177	46	332	1	9667.95	2513.67
7501	546	5	868	1	3684.52	773.75
7502	177	32	444	5	49278.40	15769.10
7503	177	6	572	5	31051.45	8694.40
7504	177	33	58	2	19118.56	3823.72
7505	177	19	478	3	23546.58	3061.05
7506	527	17	70	2	4538.56	816.94
7507	177	8	397	5	27308.40	3003.90
7508	477	48	320	5	36441.85	9110.45
7509	177	47	751	8	20464.32	7776.48
7510	177	15	336	4	16768.24	2179.88
7511	177	6	417	8	41809.44	12960.96
7512	177	8	487	10	66584.00	19975.20
7513	177	28	778	1	5708.25	2169.14
7514	177	9	446	10	95827.40	28748.20
7515	177	16	325	8	55705.44	8912.88
7516	297	39	563	8	62124.32	8076.16
7517	177	16	790	6	25406.52	8130.06
7518	177	42	98	1	970.78	252.40
7519	177	8	523	2	16202.72	6319.06
7520	177	43	463	2	18851.06	4147.24
7521	177	17	406	5	16486.50	5275.70
7522	177	14	1	1	5736.94	1893.19
7523	99	43	526	10	7369.20	958.00
7524	417	31	173	6	38474.58	13850.82
7525	177	10	547	1	7424.36	965.17
7526	177	29	518	1	247.88	52.05
7527	177	2	126	5	21303.70	2556.45
7528	177	31	481	10	99305.20	19861.00
7529	177	35	213	8	8475.20	1017.04
7530	177	34	48	3	12003.42	4681.32
7531	595	37	673	2	10504.20	3046.22
7532	177	28	589	3	16501.74	6600.69
7533	177	42	777	6	58561.80	12883.62
7534	177	27	685	5	1285.00	514.00
7535	485	27	765	10	296.10	65.10
7536	325	6	970	4	872.64	261.80
7537	177	38	423	4	35823.32	6448.20
7538	177	16	425	10	28058.10	4769.90
7539	177	29	184	2	3575.52	1394.46
7540	696	30	654	1	8313.77	2161.58
7541	177	45	308	1	1279.06	511.62
7542	177	48	211	2	3481.50	1183.72
7543	177	20	883	8	20142.24	6848.40
7544	177	11	182	3	19062.96	5909.52
7545	177	35	580	6	34043.64	5106.54
7546	177	2	314	8	56841.60	18757.76
7547	177	41	570	5	10618.10	3610.15
7548	177	34	697	3	3939.84	1418.34
7549	177	24	850	4	34542.40	6908.48
7550	177	49	542	10	94365.20	13211.10
7551	177	23	183	10	4335.00	1127.10
7552	177	39	485	6	42265.32	13102.26
7553	177	3	952	4	80.40	15.28
7554	177	40	403	4	2775.36	305.28
7555	177	31	655	6	41502.24	7470.42
7556	177	47	265	6	8008.68	1281.36
7557	177	18	741	9	62403.57	16224.93
7558	177	14	177	8	45915.04	6428.08
7559	177	42	181	3	11183.40	3578.70
7560	177	26	323	1	2087.73	626.32
7561	177	34	259	1	8293.29	829.33
7562	595	37	876	3	3669.51	1431.12
7563	177	44	273	2	7265.32	1380.42
7564	177	6	241	10	58574.40	13472.10
7565	177	18	79	8	72499.44	13774.88
7566	177	3	232	10	99713.20	20939.80
7567	177	15	432	2	3176.18	730.52
7568	177	37	271	7	41829.41	7947.59
7569	29	2	815	6	39457.86	6707.82
7570	177	26	357	6	56439.12	17496.12
7571	177	16	255	7	3577.14	1359.33
7572	177	42	899	2	12253.04	3185.80
7573	177	25	737	8	78198.00	8601.76
7574	177	36	413	7	11934.79	2864.33
7575	177	37	916	5	14044.45	2387.55
7576	177	4	473	10	83181.30	18299.90
7577	177	42	576	5	4988.10	1596.20
7578	177	9	882	4	3508.80	807.04
7579	177	13	166	10	71642.60	27224.20
7580	177	32	598	3	6613.83	1719.60
7581	177	28	461	9	62997.03	6929.64
7582	177	12	604	1	2943.59	559.28
7583	177	46	259	6	49759.74	4975.98
7584	177	22	676	4	1860.40	558.12
7585	377	49	804	10	45318.50	17221.00
7586	636	24	126	9	38346.66	4601.61
7587	137	45	777	3	29280.90	6441.81
7588	177	3	1	2	11473.88	3786.38
7589	304	27	631	1	2653.69	291.91
7590	485	27	294	8	47124.64	8482.40
7591	146	31	610	1	8739.69	1048.76
7592	177	23	588	9	14972.67	3892.86
7593	177	50	361	1	3921.36	705.84
7594	177	23	668	7	26958.61	7818.02
7595	177	45	361	7	27449.52	4940.88
7596	177	12	705	1	7593.52	1366.83
7597	177	37	475	2	11443.74	3318.68
7598	177	7	659	10	58229.90	12810.60
7599	177	23	420	9	44457.30	13337.19
7600	177	35	850	5	43178.00	8635.60
7601	177	31	33	7	27681.43	8304.45
7602	177	45	826	4	23604.92	6137.28
7603	33	4	500	10	57829.80	11566.00
7604	177	45	114	3	28455.18	7967.46
7605	177	26	893	10	62242.30	19917.50
7606	177	27	180	17	60469.00	24187.60
7607	177	15	43	2	19304.62	3281.78
7608	177	8	22	1	2799.98	280.00
7609	177	23	549	4	23921.04	6458.68
7610	660	4	998	2	14637.00	2781.02
7611	538	14	695	4	39819.96	13937.00
7612	177	29	975	10	12495.20	1624.40
7613	177	30	903	8	62143.20	19264.40
7614	177	13	388	8	44639.84	11606.32
7615	177	45	631	7	18575.83	2043.37
7616	256	29	825	5	5612.70	1627.70
7617	177	32	42	10	52615.80	17363.20
7618	177	35	586	8	53361.36	6936.96
7619	177	34	97	9	86912.10	14775.03
7620	177	30	432	9	14292.81	3287.34
7621	177	50	496	6	2316.72	671.82
7622	177	29	150	7	58158.94	17447.71
7623	107	8	567	9	66014.10	7261.56
7624	491	47	145	10	75363.10	27130.70
7625	177	37	458	5	35258.65	10225.00
7626	177	47	557	9	23747.85	6649.38
7627	124	10	380	5	13111.90	3015.75
7628	177	20	825	10	11225.40	3255.40
7629	177	30	567	2	14669.80	1613.68
7630	177	18	295	5	23037.80	3916.45
7631	177	4	211	8	13926.00	4734.88
7632	177	28	117	3	10850.73	4340.28
7633	183	3	771	4	8348.92	918.40
7634	177	47	68	10	77723.80	29535.00
7635	177	38	474	8	40093.20	6414.88
7636	177	45	884	9	34633.62	9697.41
7637	608	45	7	9	42246.99	6337.08
7638	739	44	612	4	34690.28	8325.68
7639	177	48	119	5	8569.10	2227.95
7640	595	37	991	5	16241.60	2598.65
7641	177	37	270	19	4947.03	1632.48
7642	177	39	866	10	29535.20	2953.50
7643	177	35	367	4	645.08	167.72
7644	241	12	197	10	54027.10	13506.80
7645	311	2	92	9	51336.90	17967.87
7646	177	13	779	10	69693.70	21605.00
7647	660	47	280	3	24401.31	9760.53
7648	742	33	556	9	56003.40	10080.63
7649	177	43	18	2	19978.74	3596.18
7650	177	26	865	4	36839.84	6262.76
7651	177	35	341	10	90577.90	20832.90
7652	177	10	224	1	7534.42	904.13
7653	177	37	832	10	55795.20	10601.10
7654	177	42	568	10	85539.00	26517.10
7655	177	23	597	5	39136.00	10958.10
7656	177	11	418	2	3090.92	525.46
7657	177	36	89	9	52013.43	19244.97
7658	177	25	262	4	30243.04	9072.92
7659	177	49	897	9	18157.05	7081.29
7660	177	3	210	8	42725.04	12817.52
7661	177	50	866	8	23628.16	2362.80
7662	177	39	812	3	13725.57	3156.87
7663	177	22	981	1	1771.06	425.05
7664	177	33	436	6	41041.80	10260.42
7665	177	14	430	4	4353.56	740.12
7666	177	44	458	1	7051.73	2045.00
7667	177	35	20	3	8080.77	1616.16
7668	177	7	685	6	1542.00	616.80
7669	337	26	836	1	7209.03	1585.99
7670	834	41	518	5	1239.40	260.25
7671	177	34	403	1	693.84	76.32
7672	177	9	434	10	84311.10	16019.10
7673	177	5	696	10	69104.20	19349.20
7674	177	12	567	8	58679.20	6454.72
7675	207	29	651	3	20346.87	6104.07
7676	177	48	62	7	31058.02	7143.36
7677	177	39	802	11	33086.02	9925.85
7678	177	18	154	6	34581.00	6224.58
7679	177	33	197	3	16208.13	4052.04
7680	177	9	810	1	4182.56	1589.37
7681	177	48	454	3	14516.79	2613.03
7682	250	15	575	6	33356.94	12675.66
7683	177	1	195	5	49656.50	5462.20
7684	177	14	834	4	13418.76	5367.52
7685	177	44	41	1	428.13	124.16
7686	177	24	638	8	69450.40	25696.64
7687	177	47	700	10	50771.40	15231.40
7688	177	37	740	3	18573.81	7429.53
7689	177	13	880	9	56561.13	7352.91
7690	177	12	129	8	69841.84	13968.40
7691	177	23	833	10	39709.90	12310.10
7692	274	50	858	3	29005.02	10151.76
7693	74	37	800	10	97990.70	17638.30
7694	177	7	224	3	22603.26	2712.39
7695	177	6	861	7	3713.08	1225.35
7696	177	9	339	6	44915.82	16618.86
7697	698	41	916	5	14044.45	2387.55
7698	177	10	560	2	18585.76	6505.02
7699	177	12	891	5	38873.45	6219.75
7700	177	2	142	6	27243.18	7083.24
7701	177	29	871	10	16731.80	1840.50
7702	639	46	626	2	9226.86	3229.40
7703	177	29	222	10	86385.40	8638.50
7704	177	10	803	7	39482.03	5527.48
7705	177	41	626	10	46134.30	16147.00
7706	177	49	467	3	28586.01	10005.09
7707	177	28	635	5	13863.40	1940.90
7708	177	30	551	7	49796.18	11951.10
7709	177	16	469	10	363.90	109.20
7710	177	35	205	8	1839.44	404.64
7711	177	43	547	1	7424.36	965.17
7712	177	15	311	6	18749.28	5624.76
7713	177	34	569	6	24874.80	5223.72
7714	177	38	692	7	25670.68	3080.49
7715	177	26	234	1	5986.74	898.01
7716	177	43	641	4	25130.56	7790.48
7717	177	34	11	10	24469.80	9787.90
7718	562	39	201	5	20213.50	3638.45
7719	177	36	227	3	22233.15	7336.95
7720	177	3	974	8	68571.84	23314.40
7721	177	49	458	6	42310.38	12270.00
7722	177	11	793	5	33233.40	9637.70
7723	177	34	202	5	43930.75	7468.25
7724	479	1	870	7	30830.24	11407.20
7725	177	4	939	8	17484.72	6993.92
7726	177	27	372	19	154155.36	43163.44
7727	177	28	28	5	38550.05	7324.50
7728	819	44	266	1	6606.43	2312.25
7729	177	30	987	9	72779.40	24017.22
7730	177	38	344	7	7263.69	1307.46
7731	177	44	765	9	266.49	58.59
7732	177	32	358	3	73.80	22.14
7733	177	31	985	1	7531.46	753.15
7734	177	23	340	8	62021.52	17366.00
7735	177	47	175	10	99082.10	16844.00
7736	171	36	293	6	29609.88	5922.00
7737	418	4	581	7	35324.73	8831.20
7738	177	43	4	1	6871.63	1786.62
7739	177	37	540	4	21924.08	2192.40
7740	177	2	379	8	54389.36	5982.80
7741	177	30	342	4	31807.24	9224.08
7742	177	29	302	10	65224.40	26089.80
7743	177	9	453	9	81394.38	20348.64
7744	326	24	51	2	10961.14	1424.94
7745	104	19	998	9	65866.50	12514.59
7746	177	41	70	9	20423.52	3676.23
7747	177	11	29	1	6025.77	1325.67
7748	477	12	225	9	50895.18	15777.54
7749	177	6	628	5	20141.05	4833.85
7750	177	12	320	3	21865.11	5466.27
7751	177	37	400	1	5369.47	1557.15
7752	177	36	569	5	20729.00	4353.10
7753	773	48	35	8	23580.32	6366.72
7754	510	46	253	9	7623.99	1829.79
7755	177	13	294	7	41234.06	7422.10
7756	177	3	4	1	6871.63	1786.62
7757	177	39	89	10	57792.70	21383.30
7758	177	43	465	7	25200.21	5796.07
7759	177	15	737	3	29324.25	3225.66
7760	177	28	392	6	39185.10	14106.66
7761	177	46	939	8	17484.72	6993.92
7762	177	31	785	10	46510.30	13953.10
7763	616	15	344	4	4150.68	747.12
7764	339	18	549	1	5980.26	1614.67
7765	177	26	750	9	3306.51	1058.04
7766	177	6	376	3	16159.56	4363.08
7767	177	3	427	2	3789.54	682.12
7768	177	42	148	8	13165.92	3949.76
7769	233	2	866	7	20674.64	2067.45
7770	200	32	918	9	26487.72	7681.41
7771	270	13	927	3	23284.65	6519.69
7772	177	48	618	3	20978.73	7552.35
7773	60	10	997	6	27458.52	4118.76
7774	177	38	117	1	3616.91	1446.76
7775	177	9	775	8	1647.68	214.16
7776	177	42	146	5	16356.20	1962.75
7777	177	11	822	10	53622.40	13941.80
7778	177	24	535	9	89432.28	32195.61
7779	177	22	926	3	15910.68	4455.00
7780	177	17	257	5	23646.00	3310.45
7781	177	33	619	4	4188.92	712.12
7782	177	3	187	4	5997.04	659.68
7783	177	31	816	1	1196.98	406.97
7784	177	5	748	6	22472.16	3595.56
7785	177	34	420	8	39517.60	11855.28
7786	177	37	264	5	45324.75	6345.45
7787	177	33	903	5	38839.50	12040.25
7788	177	8	867	3	13276.50	4646.76
7789	177	2	904	8	75712.40	13628.24
7790	177	13	983	3	10461.96	1673.91
7791	177	15	571	2	12584.20	1384.26
7792	192	35	405	7	38468.08	11925.13
7793	177	2	80	8	38477.44	15006.24
7794	177	29	9	6	43978.56	13633.38
7795	177	44	517	7	48693.75	12173.42
7796	177	28	394	6	38288.34	8040.54
7797	177	27	730	4	34397.80	3783.76
7798	812	11	394	6	38288.34	8040.54
7799	177	35	6	4	22581.68	6097.04
7800	177	45	210	8	42725.04	12817.52
7801	177	39	749	8	13467.84	3636.32
7802	845	35	158	9	78634.80	25163.10
7803	177	49	432	10	15880.90	3652.60
7804	271	11	318	10	36924.00	7384.80
7805	183	3	605	10	55471.80	21634.00
7806	177	31	663	9	68223.15	25924.77
7807	177	18	104	7	43084.79	16803.08
7808	177	38	587	4	594.60	172.44
7809	177	34	340	4	31010.76	8683.00
7810	177	9	828	4	9213.40	3408.96
7811	177	22	670	10	43248.30	9514.60
7812	177	38	718	1	8629.59	1984.81
7813	177	48	673	10	52521.00	15231.10
7814	177	12	634	6	41548.26	10387.08
7815	729	37	503	2	7463.52	1716.60
7816	177	31	552	9	43723.26	16614.81
7817	177	2	852	8	61790.80	14211.92
7818	323	10	281	8	36980.88	8135.76
7819	177	27	45	2	17708.94	2479.26
7820	139	17	452	5	11680.30	3504.10
7821	538	14	487	1	6658.40	1997.52
7822	703	49	61	3	5250.84	2047.83
7823	814	21	247	6	37608.00	5265.12
7824	177	12	290	7	62137.46	13670.23
7825	177	49	700	8	40617.12	12185.12
7826	177	29	738	1	2316.77	509.69
7827	177	6	441	1	6754.17	1688.54
7828	177	38	653	2	7013.90	1472.92
7829	177	42	123	9	19461.96	3308.49
7830	177	21	665	9	7239.33	1520.28
7831	233	2	476	8	66751.44	20692.96
7832	177	14	157	6	8602.68	2236.68
7833	177	41	581	2	10092.78	2523.20
7834	853	31	952	9	180.90	34.38
7835	177	28	304	9	75242.61	12038.85
7836	177	46	411	1	6569.95	1379.69
7837	739	44	44	3	19243.56	4041.15
7838	177	26	786	3	13005.09	4941.93
7839	177	49	56	8	61735.04	24694.00
7840	177	6	318	8	29539.20	5907.84
7841	177	33	269	2	17013.82	3402.76
7842	177	14	636	1	55.66	8.91
7843	177	6	667	8	42826.72	17130.72
7844	177	40	903	5	38839.50	12040.25
7845	517	24	165	8	19842.80	5357.52
7846	512	33	628	3	12084.63	2900.31
7847	177	45	35	8	23580.32	6366.72
7848	177	48	125	7	24671.57	8881.74
7849	177	35	790	3	12703.26	4065.03
7850	177	45	849	6	23280.66	9079.44
7851	728	12	22	8	22399.84	2240.00
7852	177	43	238	2	14203.48	5397.32
7853	177	29	50	1	1978.09	514.30
7854	833	6	457	7	11621.68	3602.69
7855	177	6	991	4	12993.28	2078.92
7856	177	27	632	2	515.54	108.26
7857	527	17	369	4	9220.00	1751.80
7858	177	45	102	10	48497.90	7759.70
7859	177	50	400	5	26847.35	7785.75
7860	177	6	881	1	9345.46	3738.18
7861	177	43	780	6	38449.38	8458.86
7862	60	10	206	4	32249.76	5159.96
7863	708	25	115	6	26944.38	5658.30
7864	177	36	362	5	47107.25	14132.15
7865	177	22	821	6	42194.76	14346.24
7866	740	35	873	10	31105.40	5910.00
7867	177	4	484	2	18092.08	4703.94
7868	177	48	367	4	645.08	167.72
7869	177	24	617	3	17791.56	6760.80
7870	853	31	499	5	36969.80	9981.85
7871	615	12	317	1	3993.24	1517.43
7872	177	48	288	6	5963.64	1908.36
7873	177	33	596	10	42470.60	6370.60
7874	177	6	256	9	1464.57	556.56
7875	177	11	12	9	88506.27	15046.11
7876	177	1	613	3	18774.72	2628.45
7877	177	1	39	5	44326.70	6649.00
7878	799	5	56	5	38584.40	15433.75
7879	177	14	108	2	12376.84	1732.76
7880	130	37	218	4	30510.20	3661.24
7881	177	12	913	9	29439.00	5593.41
7882	177	1	365	9	31881.06	10201.95
7883	277	39	695	4	39819.96	13937.00
7884	583	43	386	3	22837.11	7764.63
7885	177	44	683	7	3330.81	1099.14
7886	177	40	692	10	36672.40	4400.70
7887	177	44	790	2	8468.84	2710.02
7888	177	35	578	4	8953.92	1074.48
7889	177	13	992	3	2431.23	729.36
7890	291	2	617	9	53374.68	20282.40
7891	633	22	11	10	24469.80	9787.90
7892	26	47	572	9	55892.61	15649.92
7893	177	49	866	6	17721.12	1772.10
7894	177	30	207	2	14622.52	4971.66
7895	177	28	870	10	44043.20	16296.00
7896	177	45	369	3	6915.00	1313.85
7897	177	26	463	8	75404.24	16588.96
7898	177	19	865	3	27629.88	4697.07
7899	177	9	48	7	28007.98	10923.08
7900	177	12	470	7	49272.58	10347.26
7901	177	18	235	1	5714.65	1257.22
7902	709	14	211	1	1740.75	591.86
7903	100	44	134	7	33843.39	5753.37
7904	177	14	858	6	58010.04	20303.52
7905	155	45	609	3	27279.27	3273.51
7906	177	11	146	4	13084.96	1570.20
7907	177	36	330	8	56334.32	14646.96
7908	177	50	764	7	53050.83	11671.17
7909	177	6	80	2	9619.36	3751.56
7910	640	37	703	4	25016.56	5503.64
7911	177	3	73	4	9421.56	1130.60
7912	177	7	137	3	19158.96	6130.86
7913	177	34	267	6	38823.72	8152.98
7914	177	6	770	9	73030.59	16066.71
7915	177	4	988	1	3478.66	660.95
7916	177	16	611	7	48444.55	16955.61
7917	177	8	82	3	21508.95	5162.16
7918	177	47	112	2	5223.50	522.34
7919	177	15	433	3	4005.72	1401.99
7920	177	38	325	10	69631.80	11141.10
7921	177	8	750	8	2939.12	940.48
7922	177	29	665	7	5630.59	1182.44
7923	177	43	634	9	62322.39	15580.62
7924	177	43	966	1	4128.91	536.76
7925	177	4	234	2	11973.48	1796.02
7926	177	21	836	9	64881.27	14273.91
7927	177	35	905	5	4761.85	1142.85
7928	177	23	918	6	17658.48	5120.94
7929	177	1	942	10	17907.10	2686.10
7930	177	50	272	10	29568.30	5618.00
7931	177	37	561	7	13858.46	3464.58
7932	177	45	598	9	19841.49	5158.80
7933	177	4	974	2	17142.96	5828.60
7934	177	37	505	12	31172.88	6546.36
7935	177	10	733	2	18209.44	4188.18
7936	177	42	436	10	68403.00	17100.70
7937	177	6	875	7	64411.41	15458.73
7938	177	10	303	10	92470.20	31439.90
7939	177	38	338	3	9331.77	3732.72
7940	177	12	514	10	4974.90	646.70
7941	177	43	70	3	6807.84	1225.41
7942	177	50	251	6	34189.98	10598.88
7943	177	42	692	2	7334.48	880.14
7944	177	28	193	8	40981.36	10245.36
7945	177	31	599	7	18902.52	6048.84
7946	177	26	789	1	9480.91	2275.42
7947	177	29	153	8	4093.36	1596.40
7948	468	19	970	6	1308.96	392.70
7949	177	43	604	9	26492.31	5033.52
7950	177	29	185	4	30886.16	6177.24
7951	177	46	267	9	58235.58	12229.47
7952	177	50	28	3	23130.03	4394.70
7953	177	27	258	5	46258.05	18040.65
7954	673	46	75	7	27916.49	2791.67
7955	66	37	146	3	9813.72	1177.65
7956	177	26	551	8	56909.92	13658.40
7957	177	19	323	10	20877.30	6263.20
7958	177	47	912	8	39641.04	4756.96
7959	177	9	456	6	32348.76	3234.90
7960	734	18	323	3	6263.19	1878.96
7961	177	18	376	9	48478.68	13089.24
7962	177	50	120	4	31812.20	7316.80
7963	177	27	499	9	66545.64	17967.33
7964	177	35	224	4	30137.68	3616.52
7965	177	44	236	7	38988.81	10916.85
7966	30	17	554	10	40123.30	13240.70
7967	773	48	755	3	25437.21	4833.06
7968	177	38	802	5	15039.10	4511.75
7969	177	15	337	10	69345.60	10401.80
7970	177	49	333	8	17410.40	5223.12
7971	177	36	580	9	51065.46	7659.81
7972	177	43	256	1	162.73	61.84
7973	177	18	544	10	89803.70	21552.90
7974	175	13	150	5	41542.10	12462.65
7975	177	35	330	5	35208.95	9154.35
7976	177	46	334	10	87503.10	21000.70
7977	177	44	597	10	78272.00	21916.20
7978	177	31	317	4	15972.96	6069.72
7979	291	2	236	2	11139.66	3119.10
7980	177	25	282	10	28771.60	11220.90
7981	177	48	475	4	22887.48	6637.36
7982	177	8	389	6	5765.40	2248.50
7983	177	38	835	5	12271.20	3190.50
7984	177	15	781	7	23885.40	3105.13
7985	358	29	79	9	81561.87	15496.74
7986	581	32	156	2	2289.52	389.22
7987	853	35	137	2	12772.64	4087.24
7988	177	49	903	3	23303.70	7224.15
7989	177	28	818	6	51698.04	14475.48
7990	199	49	810	7	29277.92	11125.59
7991	177	47	579	5	27151.10	9774.40
7992	177	14	408	3	29851.23	8358.33
7993	177	26	641	9	56543.76	17528.58
7994	177	12	561	4	7919.12	1979.76
7995	177	9	994	1	2004.85	300.73
7996	177	48	923	7	22795.50	5698.84
7997	177	15	663	10	75803.50	28805.30
7998	177	7	118	7	16355.78	4416.09
7999	433	19	939	7	15299.13	6119.68
8000	275	29	963	9	57384.99	10903.14
8001	177	16	461	7	48997.69	5389.72
8002	177	34	425	3	8417.43	1430.97
8003	447	33	466	3	21675.90	6719.52
8004	177	40	869	5	47182.45	16042.05
8005	177	48	850	10	86356.00	17271.20
8006	177	41	985	9	67783.14	6778.35
8007	82	31	431	7	14629.09	3510.99
8008	177	26	425	4	11223.24	1907.96
8009	177	39	724	2	18560.26	5196.88
8010	177	27	798	4	28388.92	10787.80
8011	177	1	633	8	55070.96	20926.96
8012	408	33	3	3	25931.01	6482.76
8013	565	45	443	8	21626.64	5190.40
8014	177	26	200	5	39446.60	9072.70
8015	177	13	506	3	1648.23	593.37
8016	177	50	808	7	64293.81	14144.62
8017	177	8	990	2	14987.02	3147.28
8018	405	37	705	3	22780.56	4100.49
8019	177	1	642	1	4821.25	1591.01
8020	177	4	373	5	40795.80	4895.50
8021	177	16	17	7	13315.82	1464.75
8022	177	11	599	5	13501.80	4320.60
8023	177	22	80	4	19238.72	7503.12
8024	177	22	906	7	55324.92	16597.49
8025	177	31	629	4	22355.12	3576.80
8026	177	14	359	1	5168.18	1705.50
8027	177	16	319	3	18815.55	7149.90
8028	703	49	447	2	4120.82	1318.66
8029	177	3	460	6	19959.24	5588.58
8030	177	15	415	5	32627.55	3915.30
8031	693	3	137	4	25545.28	8174.48
8032	177	13	395	8	61119.44	9779.12
8033	177	41	665	1	804.37	168.92
8034	177	33	841	5	38091.15	12951.00
8035	177	47	727	11	92845.28	35281.18
8036	177	36	155	10	53422.50	13889.90
8037	844	42	244	2	12287.92	4792.28
8038	177	34	907	2	100.28	12.04
8039	7	30	568	1	8553.90	2651.71
8040	177	8	118	2	4673.08	1261.74
8041	177	8	396	2	5382.76	1291.86
8042	597	42	11	5	12234.90	4893.95
8043	177	24	789	9	85328.19	20478.78
8044	177	29	158	10	87372.00	27959.00
8045	177	2	603	1	2616.39	784.92
8046	177	3	242	10	99971.70	32990.70
8047	862	32	335	7	31862.39	3823.47
8048	177	38	469	1	36.39	10.92
8049	177	35	592	4	39271.96	7461.68
8050	177	22	903	5	38839.50	12040.25
8051	177	23	784	2	18090.62	6874.44
8052	177	6	175	7	69357.47	11790.80
8053	177	40	160	8	4194.56	1342.24
8054	177	41	886	9	11228.58	4266.90
8055	365	12	985	6	45188.76	4518.90
8056	177	28	276	7	67314.10	24233.09
8057	177	24	848	9	39931.65	9583.56
8058	177	15	555	4	10285.24	1645.64
8059	177	10	410	4	4985.16	1894.36
8060	808	42	113	6	7058.88	1694.16
8061	177	35	122	2	15325.20	5057.32
8062	175	1	517	3	20868.75	5217.18
8063	177	1	516	1	3455.90	1244.12
8064	177	35	264	3	27194.85	3807.27
8065	478	18	401	5	5813.05	1162.60
8066	177	45	160	3	1572.96	503.34
8067	177	6	468	4	8377.84	1005.36
8068	177	33	982	9	81943.47	31957.92
8069	177	39	569	4	16583.20	3482.48
8070	177	14	711	4	13548.20	2032.24
8071	177	39	481	6	59583.12	11916.60
8072	177	42	22	7	19599.86	1960.00
8073	177	26	14	10	76824.80	18438.00
8074	177	24	718	8	69036.72	15878.48
8075	177	24	772	6	29493.06	8258.04
8076	177	41	822	7	37535.68	9759.26
8077	148	25	122	4	30650.40	10114.64
8078	177	46	871	8	13385.44	1472.40
8079	720	43	598	4	8818.44	2292.80
8080	177	39	296	5	30694.35	7366.65
8081	177	9	483	6	44295.66	7087.32
8082	177	10	465	7	25200.21	5796.07
8083	177	15	528	10	95954.80	31665.10
8084	806	3	227	7	51877.35	17119.55
8085	177	16	664	8	9388.32	1032.72
8086	177	47	561	7	13858.46	3464.58
8087	177	7	734	4	5449.48	2125.28
8088	177	40	876	5	6115.85	2385.20
8089	177	41	647	10	69782.70	7676.10
8090	546	5	504	8	5733.52	1089.36
8091	177	49	6	16	90326.72	24388.16
8092	177	14	431	6	12539.22	3009.42
8093	577	27	777	6	58561.80	12883.62
8094	177	44	299	4	36158.80	6147.00
8095	197	2	816	10	11969.80	4069.70
8096	177	19	339	10	74859.70	27698.10
8097	177	25	517	5	34781.25	8695.30
8098	467	28	209	2	3268.20	1176.56
8099	177	37	985	6	45188.76	4518.90
8100	177	20	331	2	4292.52	1502.38
8101	177	36	210	9	48065.67	14419.71
8102	177	5	47	8	33181.04	13272.40
8103	89	22	693	8	38166.08	13739.76
8104	177	39	436	3	20520.90	5130.21
8105	177	17	930	14	130735.36	33991.16
8106	177	15	949	3	20250.36	6682.62
8107	177	43	970	2	436.32	130.90
8108	696	30	740	4	24765.08	9906.04
8109	177	37	804	4	18127.40	6888.40
8110	177	2	896	12	10938.12	2187.60
8111	177	19	117	9	32552.19	13020.84
8112	177	8	193	2	10245.34	2561.34
8113	177	39	576	6	5985.72	1915.44
8114	744	11	10	3	8478.75	3221.91
8115	437	29	341	1	9057.79	2083.29
8116	177	35	718	1	8629.59	1984.81
8117	26	47	357	9	84658.68	26244.18
8118	739	44	709	9	64645.56	18747.18
8119	177	10	119	4	6855.28	1782.36
8120	177	14	323	3	6263.19	1878.96
8121	177	33	147	7	57122.73	12567.03
8122	177	36	128	15	47249.40	7087.35
8123	852	20	760	7	26928.30	8347.78
8124	177	18	703	2	12508.28	2751.82
8125	177	5	248	10	28225.20	7620.80
8126	177	2	74	5	1775.25	408.30
8127	177	16	119	5	8569.10	2227.95
8128	177	15	658	2	17011.66	4593.14
8129	177	33	705	3	22780.56	4100.49
8130	177	22	249	14	114328.90	14862.82
8131	177	9	648	5	33906.65	9154.80
8132	126	18	274	3	12556.35	2385.72
8133	177	46	180	2	7114.00	2845.60
8134	177	46	850	5	43178.00	8635.60
8135	177	21	877	8	23386.56	3975.68
8136	177	25	152	7	17021.06	2723.35
8137	177	30	867	8	35404.00	12391.36
8138	788	13	774	8	69719.60	13246.72
8139	177	2	471	7	51451.05	13377.28
8140	177	7	628	1	4028.21	966.77
8141	177	9	856	1	1669.35	400.64
8142	177	48	797	10	68248.10	15014.60
8143	281	37	709	5	35914.20	10415.10
8144	177	43	701	12	101972.76	29572.08
8145	689	12	468	6	12566.76	1508.04
8146	177	48	262	5	37803.80	11341.15
8147	177	2	527	4	15001.12	3450.24
8148	177	16	916	4	11235.56	1910.04
8149	177	12	443	1	2703.33	648.80
8150	177	18	280	8	65070.16	26028.08
8151	177	47	772	10	49155.10	13763.40
8152	177	47	837	8	74704.16	22411.28
8153	191	33	242	3	29991.51	9897.21
8154	177	22	278	2	16420.64	4926.20
8155	802	45	154	1	5763.50	1037.43
8156	177	29	399	8	31000.00	7130.00
8157	177	9	19	4	39377.24	5119.04
8158	417	31	7	9	42246.99	6337.08
8159	177	39	415	10	65255.10	7830.60
8160	177	48	247	11	68948.00	9652.72
8161	177	35	411	7	45989.65	9657.83
8162	731	1	443	3	8109.99	1946.40
8163	177	2	144	8	60172.80	16848.40
8164	177	19	286	7	32928.28	9549.19
8165	177	41	885	7	6545.70	2487.38
8166	177	49	233	5	22695.55	7943.45
8167	177	40	443	6	16219.98	3892.80
8168	177	23	498	1	7082.03	2620.35
8169	716	28	507	6	43916.22	12296.52
8170	177	37	342	9	71566.29	20754.18
8171	426	15	940	9	57485.07	7473.06
8172	177	36	290	5	44383.90	9764.45
8173	177	19	862	2	11906.16	2857.48
8174	177	41	956	5	41690.65	11673.40
8175	177	5	526	10	7369.20	958.00
8176	177	12	533	7	22934.31	8715.07
8177	177	6	693	2	9541.52	3434.94
8178	177	1	82	10	71696.50	17207.20
8179	177	49	287	5	14529.50	5375.90
8180	177	50	936	10	46286.70	14811.70
8181	177	46	304	8	66882.32	10701.20
8182	415	7	491	1	6999.06	1049.86
8183	177	31	124	3	14243.82	4273.14
8184	177	22	407	6	26625.60	9318.96
8185	177	12	800	5	48995.35	8819.15
8186	177	44	56	7	54018.16	21607.25
8187	177	41	571	8	50336.80	5537.04
8188	177	2	842	6	23600.22	5428.08
8189	177	18	907	2	100.28	12.04
8190	177	39	237	6	46990.62	10807.86
8191	699	47	421	2	4385.98	1315.80
8192	177	37	373	7	57114.12	6853.70
8193	438	22	850	5	43178.00	8635.60
8194	177	2	353	2	4377.32	1225.64
8195	177	17	371	4	16477.12	4284.04
8196	177	12	175	5	49541.05	8422.00
8197	618	6	195	5	49656.50	5462.20
8198	177	29	372	8	64907.52	18174.08
8199	177	35	33	9	35590.41	10677.15
8200	297	39	982	9	81943.47	31957.92
8201	177	29	227	2	14822.10	4891.30
8202	177	34	871	6	10039.08	1104.30
8203	177	5	398	5	13832.20	3043.10
8204	177	6	820	10	18473.70	6835.30
8205	177	23	123	9	19461.96	3308.49
8206	177	12	802	10	30078.20	9023.50
8207	177	45	938	9	29559.96	8572.41
8208	177	1	811	8	78494.16	31397.68
8209	177	15	872	7	5951.82	773.71
8210	639	46	867	9	39829.50	13940.28
8211	177	41	984	6	33957.96	4414.56
8212	177	18	772	3	14746.53	4129.02
8213	177	35	857	5	17202.35	1720.25
8214	177	30	397	1	5461.68	600.78
8215	177	32	966	5	20644.55	2683.80
8216	177	35	831	1	412.09	82.42
8217	177	13	861	9	4773.96	1575.45
8218	177	33	472	8	50922.16	5092.24
8219	177	20	674	1	6616.00	2381.76
8220	177	35	375	7	51371.25	20548.50
8221	177	3	797	8	54598.48	12011.68
8222	177	38	686	10	34197.40	8549.40
8223	177	10	597	1	7827.20	2191.62
8224	177	20	694	6	290.88	43.62
8225	177	41	586	10	66701.70	8671.20
8226	177	44	317	7	27952.68	10622.01
8227	177	8	489	10	70093.70	16121.60
8228	299	12	344	9	9339.03	1681.02
8229	177	34	703	9	56287.26	12383.19
8230	177	19	712	9	36791.64	6990.39
8231	177	28	760	2	7693.80	2385.08
8232	177	18	442	4	23836.64	5482.44
8233	177	43	530	8	32097.04	5135.52
8234	177	19	715	5	36956.70	4065.25
8235	177	27	78	6	38963.40	5454.90
8236	177	12	151	2	7299.26	1386.86
8237	177	41	637	1	3418.95	1333.39
8238	177	39	1000	3	6670.59	2134.59
8239	177	36	533	1	3276.33	1245.01
8240	177	31	707	9	25452.09	4072.32
8241	177	39	252	1	7721.08	926.53
8242	177	10	901	1	1679.56	319.12
8243	177	3	772	7	34408.57	9634.38
8244	177	39	153	4	2046.68	798.20
8245	177	16	487	5	33292.00	9987.60
8246	520	31	453	8	72350.56	18087.68
8247	177	41	859	3	22320.78	8258.70
8248	177	9	805	2	5623.36	1911.94
8249	177	6	891	7	54422.83	8707.65
8250	177	16	305	8	72008.56	21602.56
8251	177	18	609	4	36372.36	4364.68
8252	177	10	160	7	3670.24	1174.46
8253	177	32	791	5	13817.35	2487.10
8254	177	21	958	6	52094.28	9376.98
8255	605	20	595	10	82351.10	14823.20
8256	177	7	254	1	1803.90	721.56
8257	177	32	401	3	3487.83	697.56
8258	437	29	853	9	62696.61	16928.10
8259	177	30	474	1	5011.65	801.86
8260	177	2	837	6	56028.12	16808.46
8261	177	28	646	4	23319.48	6762.64
8262	177	3	686	1	3419.74	854.94
8263	177	15	101	5	42482.25	11470.20
8264	177	45	942	10	17907.10	2686.10
8265	177	10	641	5	31413.20	9738.10
8266	177	14	993	6	43208.64	10802.16
8267	177	7	393	3	14421.81	5191.86
8268	177	29	849	7	27160.77	10592.68
8269	177	13	835	5	12271.20	3190.50
8270	797	3	371	7	28834.96	7497.07
8271	177	17	222	2	17277.08	1727.70
8272	177	47	859	4	29761.04	11011.60
8273	177	1	285	2	5892.24	883.84
8274	177	4	82	8	57357.20	13765.76
8275	177	24	701	7	59484.11	17250.38
8276	306	3	407	6	26625.60	9318.96
8277	177	47	729	10	55190.20	19316.60
8278	177	5	717	1	9842.23	1771.60
8279	177	29	534	3	26958.24	4582.89
8280	177	3	557	10	26386.50	7388.20
8281	177	42	346	3	12023.49	3246.33
8282	177	46	103	1	2728.39	600.25
8283	177	29	716	1	2738.83	958.59
8284	177	3	149	10	63955.30	9593.30
8285	177	36	425	1	2805.81	476.99
8286	177	40	175	9	89173.89	15159.60
8287	177	33	650	1	8336.06	3084.34
8288	177	21	91	7	69607.09	16009.63
8289	177	23	363	1	7775.62	933.07
8290	177	28	29	6	36154.62	7954.02
8291	322	15	982	4	36419.32	14203.52
8292	177	1	867	10	44255.00	15489.20
8293	177	2	191	6	18326.52	3115.50
8294	177	12	47	7	29033.41	11613.35
8295	177	31	478	8	62790.88	8162.80
8296	328	45	13	3	24741.57	3711.24
8297	177	40	726	4	17339.16	5721.92
8298	177	16	164	1	2571.51	565.73
8299	177	4	751	1	2558.04	972.06
8300	177	30	802	4	12031.28	3609.40
8301	376	41	246	3	3741.06	972.69
8302	669	19	388	5	27899.90	7253.95
8303	177	16	449	4	34776.48	5216.48
8304	177	3	911	4	9448.08	2173.04
8305	177	45	291	3	7209.33	2523.27
8306	177	36	66	11	23578.72	9195.67
8307	799	5	225	4	22620.08	7012.24
8308	177	36	604	7	20605.13	3914.96
8309	177	20	336	3	12576.18	1634.91
8310	177	27	968	8	29979.52	7794.64
8311	177	40	561	5	9898.90	2474.70
8312	177	14	276	10	96163.00	34618.70
8313	177	12	997	7	32034.94	4805.22
8314	177	27	95	10	48017.80	12484.60
8315	177	2	277	2	17685.08	1945.36
8316	177	44	572	6	37261.74	10433.28
8317	177	17	670	5	21624.15	4757.30
8318	177	48	67	7	48975.92	7836.15
8319	272	46	70	2	4538.56	816.94
8320	177	15	792	6	21547.68	6464.28
8321	177	45	713	1	8032.77	2088.52
8322	177	43	997	2	9152.84	1372.92
8323	844	42	440	9	69128.19	7604.10
8324	177	19	281	2	9245.22	2033.94
8325	177	25	548	5	29770.50	9526.55
8326	177	39	682	3	4179.54	1253.85
8327	177	28	878	10	61533.10	7999.30
8328	177	21	658	9	76552.47	20669.13
8329	177	4	214	7	3836.14	728.84
8330	177	32	712	4	16351.84	3106.84
8331	177	38	169	5	37177.70	5948.45
8332	177	43	750	7	2571.73	822.92
8333	177	7	790	10	42344.20	13550.10
8334	177	8	79	2	18124.86	3443.72
8335	177	10	381	11	12853.61	3727.57
8336	177	29	932	3	9602.34	960.24
8337	177	31	507	3	21958.11	6148.26
8338	177	8	923	3	9769.50	2442.36
8339	177	48	990	8	59948.08	12589.12
8340	177	44	975	7	8746.64	1137.08
8341	177	10	552	6	29148.84	11076.54
8342	177	35	304	9	75242.61	12038.85
8343	177	42	612	1	8672.57	2081.42
8344	177	49	281	9	41603.49	9152.73
8345	177	16	353	5	10943.30	3064.10
8346	177	16	990	1	7493.51	1573.64
8347	177	17	525	1	6889.30	2480.15
8348	447	33	759	6	25829.16	5424.12
8349	408	33	752	5	15555.40	4977.75
8350	177	8	248	9	25402.68	6858.72
8351	825	21	579	8	43441.76	15639.04
8352	536	29	673	9	47268.90	13707.99
8353	177	19	186	7	22706.32	4314.17
8354	177	41	935	2	6126.56	980.24
8355	281	37	473	3	24954.39	5489.97
8356	177	19	523	5	40506.80	15797.65
8357	177	40	622	5	19441.25	1944.10
8358	177	48	50	10	19780.90	5143.00
8359	177	31	170	2	18565.12	7054.74
8360	177	13	380	8	20979.04	4825.20
8361	482	6	448	5	22595.15	5422.85
8362	177	16	207	9	65801.34	22372.47
8363	177	26	400	6	32216.82	9342.90
8364	177	47	802	5	15039.10	4511.75
8365	291	2	498	9	63738.27	23583.15
8366	177	8	263	9	84351.06	16026.66
8367	177	9	114	1	9485.06	2655.82
8368	177	43	360	10	16674.30	2834.60
8369	177	49	228	4	28969.72	10718.80
8370	177	47	222	9	77746.86	7774.65
8371	177	2	122	3	22987.80	7585.98
8372	177	50	416	9	18723.87	7115.04
8373	177	24	73	5	11776.95	1413.25
8374	177	15	840	1	6171.73	1357.78
8375	177	36	978	9	22944.60	4359.51
8376	177	31	476	2	16687.86	5173.24
8377	177	1	480	8	44115.60	7499.68
8378	177	33	175	7	69357.47	11790.80
8379	177	25	654	6	49882.62	12969.48
8380	177	34	213	11	11653.40	1398.43
8381	661	44	146	10	32712.40	3925.50
8382	177	26	692	4	14668.96	1760.28
8383	177	43	162	3	26861.16	4835.01
8384	177	41	315	1	4423.17	1017.33
8385	177	28	252	10	77210.80	9265.30
8386	177	34	108	4	24753.68	3465.52
8387	177	38	48	8	32009.12	12483.52
8388	101	5	829	9	73450.71	21300.75
8389	177	39	920	2	779.70	257.30
8390	177	25	948	5	34451.65	11713.55
8391	299	12	704	3	26480.10	9797.64
8392	177	5	383	3	23543.04	4944.03
8393	177	29	181	8	29822.40	9543.20
8394	177	33	6	4	22581.68	6097.04
8395	699	26	831	3	1236.27	247.26
8396	177	26	99	6	28347.96	11339.16
8397	177	19	975	8	9996.16	1299.52
8398	278	18	298	10	71935.10	10070.90
8399	177	42	434	10	84311.10	16019.10
8400	177	9	774	19	165584.05	31460.96
8401	853	35	468	9	18850.14	2262.06
8402	177	19	441	9	60787.53	15196.86
8403	256	29	417	2	10452.36	3240.24
8404	177	25	445	5	41968.20	6714.90
8405	177	46	287	7	20341.30	7526.26
8406	177	37	761	2	19690.62	6301.00
8407	177	3	279	9	32224.95	7411.77
8408	177	3	820	2	3694.74	1367.06
8409	177	24	379	5	33993.35	3739.25
8410	177	32	187	3	4497.78	494.76
8411	177	24	82	9	64526.85	15486.48
8412	177	37	865	2	18419.92	3131.38
8413	657	23	653	10	35069.50	7364.60
8414	177	19	1000	9	20011.77	6403.77
8415	177	43	212	2	10257.78	1948.98
8416	512	33	336	6	25152.36	3269.82
8417	177	37	122	5	38313.00	12643.30
8418	358	29	988	7	24350.62	4626.65
8419	177	28	990	3	22480.53	4720.92
8420	177	48	185	5	38607.70	7721.55
8421	177	5	729	9	49671.18	17384.94
8422	177	20	103	3	8185.17	1800.75
8423	177	10	102	1	4849.79	775.97
8424	177	43	482	8	26886.72	5915.04
8425	177	42	621	10	43543.60	14804.80
8426	177	45	48	1	4001.14	1560.44
8427	177	2	674	4	26464.00	9527.04
8428	177	6	185	5	38607.70	7721.55
8429	177	41	595	9	74115.99	13340.88
8430	177	17	470	5	35194.70	7390.90
8431	177	8	363	9	69980.58	8397.63
8432	177	6	131	6	2840.70	1051.08
8433	177	34	559	12	73721.52	20642.04
8434	177	43	987	1	8086.60	2668.58
8435	177	48	784	1	9045.31	3437.22
8436	731	19	638	9	78131.70	28908.72
8437	177	11	237	8	62654.16	14410.48
8438	177	4	602	7	23518.32	4468.45
8439	177	10	247	10	62680.00	8775.20
8440	177	17	328	10	79615.90	25477.10
8441	177	27	699	3	12034.77	3129.03
8442	177	9	329	10	87916.90	27254.20
8443	177	2	138	2	8796.06	967.56
8444	609	10	90	1	5654.80	1357.15
8445	177	44	459	6	3582.54	1253.88
8446	177	41	442	8	47673.28	10964.88
8447	177	38	148	2	3291.48	987.44
8448	687	4	507	9	65874.33	18444.78
8449	812	11	8	3	10063.74	2717.22
8450	177	46	43	7	67566.17	11486.23
8451	177	20	283	5	47995.65	8639.20
8452	177	7	105	2	7062.54	2189.38
8453	177	13	772	10	49155.10	13763.40
8454	177	33	247	7	43876.00	6142.64
8455	177	7	799	2	11720.10	3281.62
8456	177	29	515	1	8831.00	2560.99
8457	177	40	667	10	53533.40	21413.40
8458	177	9	409	9	56170.35	7863.84
8459	177	48	431	3	6269.61	1504.71
8460	177	41	479	7	4506.88	540.82
8461	177	29	394	2	12762.78	2680.18
8462	177	32	255	9	4599.18	1747.71
8463	177	49	369	10	23050.00	4379.50
8464	177	47	632	7	1804.39	378.91
8465	177	25	937	8	3887.92	505.44
8466	177	37	476	7	58407.51	18106.34
8467	177	4	688	8	71322.24	8558.64
8468	593	23	315	8	35385.36	8138.64
8469	177	43	480	6	33086.70	5624.76
8470	177	47	413	8	13639.76	3273.52
8471	177	48	4	1	6871.63	1786.62
8472	177	16	617	7	41513.64	15775.20
8473	177	22	795	2	13344.20	4403.58
8474	177	50	508	9	86456.88	17291.34
8475	177	23	56	4	30867.52	12347.00
8476	177	33	285	5	14730.60	2209.60
8477	177	19	96	4	31442.24	5030.76
8478	177	27	529	2	7179.54	2441.04
8479	177	47	741	6	41602.38	10816.62
8480	816	40	367	9	1451.43	377.37
8481	177	22	6	2	11290.84	3048.52
8482	177	15	34	14	75345.62	26370.96
8483	177	25	718	9	77666.31	17863.29
8484	177	26	628	9	36253.89	8700.93
8485	377	49	390	8	13099.76	2096.00
8486	177	20	485	8	56353.76	17469.68
8487	177	39	176	3	14658.48	4983.87
8488	641	47	269	3	25520.73	5104.14
8489	177	43	498	7	49574.21	18342.45
8490	177	23	735	9	80412.48	28144.35
8491	177	18	516	8	27647.20	9952.96
8492	177	43	449	1	8694.12	1304.12
8493	177	17	821	6	42194.76	14346.24
8494	177	7	267	1	6470.62	1358.83
8495	177	5	315	3	13269.51	3051.99
8496	177	20	959	5	34498.05	8279.55
8497	83	44	148	9	14811.66	4443.48
8498	177	31	727	10	84404.80	32073.80
8499	177	44	320	2	14576.74	3644.18
8500	177	21	108	5	30942.10	4331.90
8501	177	41	535	1	9936.92	3577.29
8502	177	29	523	5	40506.80	15797.65
8503	177	15	396	3	8074.14	1937.79
8504	177	16	441	8	54033.36	13508.32
8505	304	27	165	6	14882.10	4018.14
8506	177	10	622	9	34994.25	3499.38
8507	177	6	562	2	6913.10	1590.02
8508	441	8	984	5	28298.30	3678.80
8509	177	26	31	9	37915.29	12132.90
8510	177	21	691	10	84680.70	27097.80
8511	177	31	221	5	32923.95	9877.20
8512	177	8	127	5	29819.45	11331.40
8513	177	34	905	8	7618.96	1828.56
8514	177	28	761	8	78762.48	25204.00
8515	177	39	38	1	4893.02	1321.12
8516	177	40	649	7	60714.50	22464.33
8517	177	19	19	9	88598.79	11517.84
8518	121	29	442	6	35754.96	8223.66
8519	698	41	753	7	35555.59	9244.48
8520	177	7	81	7	42800.94	16264.36
8521	177	10	315	10	44231.70	10173.30
8522	177	6	340	8	62021.52	17366.00
8523	177	47	608	6	31142.94	4048.56
8524	177	8	712	16	65407.36	12427.36
8525	177	43	727	5	42202.40	16036.90
8526	177	22	161	1	7608.68	2663.04
8527	177	31	927	3	23284.65	6519.69
8528	177	7	578	1	2238.48	268.62
8529	536	29	165	10	24803.50	6696.90
8530	177	47	879	6	29420.10	7355.04
8531	177	14	566	8	26042.80	7812.88
8532	177	12	422	6	33008.88	5611.50
8533	177	16	710	2	16793.26	6717.30
8534	177	25	42	6	31569.48	10417.92
8535	177	39	489	7	49065.59	11285.12
8536	177	10	930	6	56029.44	14567.64
8537	177	6	229	5	13865.65	3605.05
8538	177	43	691	10	84680.70	27097.80
8539	177	37	27	2	9178.38	3120.64
8540	177	10	793	5	33233.40	9637.70
8541	177	46	870	1	4404.32	1629.60
8542	595	32	949	4	27000.48	8910.16
8543	177	3	409	6	37446.90	5242.56
8544	815	44	213	8	8475.20	1017.04
8545	177	16	752	7	21777.56	6968.85
8546	177	13	940	6	38323.38	4982.04
8547	177	14	674	2	13232.00	4763.52
8548	820	36	635	7	19408.76	2717.26
8549	177	46	524	6	40194.60	9244.74
8550	177	21	834	4	13418.76	5367.52
8551	177	12	803	1	5640.29	789.64
8552	177	7	473	2	16636.26	3659.98
8553	177	31	735	7	62543.04	21890.05
8554	177	3	171	1	9174.19	3119.22
8555	177	18	914	10	53329.50	20798.50
8556	177	23	477	9	11038.50	3753.09
8557	177	23	826	6	35407.38	9205.92
8558	177	17	65	7	45805.06	8702.96
8559	177	31	981	7	12397.42	2975.35
8560	177	27	252	10	77210.80	9265.30
8561	177	21	203	8	55508.24	18872.80
8562	177	17	515	3	26493.00	7682.97
8563	177	41	760	8	30775.20	9540.32
8564	177	43	500	7	40480.86	8096.20
8565	177	43	422	4	22005.92	3741.00
8566	177	16	321	4	23255.68	5581.36
8567	177	49	87	8	47091.20	5650.96
8568	177	22	140	4	30207.52	9968.48
8569	177	41	733	8	72837.76	16752.72
8570	177	13	340	1	7752.69	2170.75
8571	557	44	226	1	4475.23	581.78
8572	177	24	26	6	21976.20	2197.62
8573	177	44	110	1	9350.87	1589.65
8574	760	16	787	10	1520.30	273.70
8575	177	22	2	6	12060.72	1809.12
8576	177	23	525	23	158453.90	57043.45
8577	177	1	70	1	2269.28	408.47
8578	177	48	353	8	17509.28	4902.56
8579	177	19	546	8	47277.36	5673.28
8580	177	45	167	8	59728.88	7167.44
8581	177	14	284	4	6824.40	818.92
8582	177	27	530	10	40121.30	6419.40
8583	177	39	242	9	89974.53	29691.63
8584	177	25	884	1	3848.18	1077.49
8585	177	49	21	1	517.10	67.22
8586	177	20	510	8	44427.44	5775.60
8587	177	47	271	4	23902.52	4541.48
8588	177	48	234	2	11973.48	1796.02
8589	177	26	596	6	25482.36	3822.36
8590	177	2	33	7	27681.43	8304.45
8591	177	9	583	5	26271.55	6305.15
8592	177	4	942	1	1790.71	268.61
8593	856	18	717	4	39368.92	7086.40
8594	523	37	582	2	4316.36	431.64
8595	177	40	591	5	2979.60	327.75
8596	177	9	945	1	7998.49	1439.73
8597	177	33	128	4	12599.84	1889.96
8598	753	29	270	8	2082.96	687.36
8599	177	24	981	16	28336.96	6800.80
8600	177	10	938	8	26275.52	7619.92
8601	177	18	590	4	36246.40	4712.04
8602	177	3	177	2	11478.76	1607.02
8603	177	8	826	2	11802.46	3068.64
8604	177	31	57	10	31974.30	7673.80
8605	177	44	448	3	13557.09	3253.71
8606	376	41	475	6	34331.22	9956.04
8607	177	28	290	3	26630.34	5858.67
8608	177	11	409	3	18723.45	2621.28
8609	177	29	718	5	43147.95	9924.05
8610	532	24	244	9	55295.64	21565.26
8611	177	47	351	7	1460.83	146.09
8612	177	13	412	4	32027.96	3843.36
8613	177	12	186	2	6487.52	1232.62
8614	433	19	961	4	35507.60	7456.60
8615	177	29	395	7	53479.51	8556.73
8616	89	22	895	1	5277.43	2005.42
8617	177	38	289	5	29438.45	5887.70
8618	177	33	852	2	15447.70	3552.98
8619	177	40	55	5	43230.00	5187.60
8620	177	21	613	6	37549.44	5256.90
8621	177	40	431	2	4179.74	1003.14
8622	177	32	731	10	55068.40	8260.30
8623	177	21	265	14	18686.92	2989.84
8624	177	45	522	6	49289.28	12815.22
8625	177	30	188	1	1145.79	171.87
8626	177	2	91	3	29831.61	6861.27
8627	1	6	180	7	24899.00	9959.60
8628	177	1	335	9	40965.93	4915.89
8629	177	12	732	10	27834.80	3061.80
8630	177	41	252	9	69489.72	8338.77
8631	177	36	368	2	8514.10	2639.38
8632	33	27	889	4	17653.08	4060.20
8633	26	47	203	10	69385.30	23591.00
8634	177	42	640	4	22029.04	6388.44
8635	177	16	324	5	29568.25	6505.00
8636	177	3	742	2	14650.36	4981.12
8637	177	31	49	1	9082.44	999.07
8638	177	12	541	6	46624.80	18183.66
8639	177	45	547	2	14848.72	1930.34
8640	177	3	342	9	71566.29	20754.18
8641	177	14	598	10	22046.10	5732.00
8642	517	24	272	8	23654.64	4494.40
8643	177	12	273	3	10897.98	2070.63
8644	177	25	237	2	15663.54	3602.62
8645	177	23	512	5	4577.35	457.75
8646	177	15	588	9	14972.67	3892.86
8647	177	25	801	4	9766.08	1367.24
8648	177	32	846	6	40083.90	11624.34
8649	177	43	896	3	2734.53	546.90
8650	177	35	410	3	3738.87	1420.77
8651	618	6	39	9	79788.06	11968.20
8652	177	50	244	13	79871.48	31149.82
8653	177	33	260	8	3915.76	744.00
8654	177	49	499	8	59151.68	15970.96
8655	520	31	32	6	32349.42	12616.26
8656	177	7	238	6	42610.44	16191.96
8657	744	1	763	9	34086.51	9885.06
8658	792	3	133	3	12781.17	4345.59
8659	529	31	680	1	9930.49	2581.93
8660	177	17	489	1	7009.37	1612.16
8661	177	14	353	6	13131.96	3676.92
8662	177	1	245	5	40049.50	11614.35
8663	177	27	193	4	20490.68	5122.68
8664	177	17	435	3	22032.69	6609.81
8665	177	14	349	3	14712.27	4266.57
8666	177	13	725	5	28165.45	3098.20
8667	177	39	919	10	90993.10	12739.00
8668	177	18	467	2	19057.34	6670.06
8669	177	13	391	10	5669.00	963.70
8670	177	27	434	8	67448.88	12815.28
8671	29	2	96	7	55023.92	8803.83
8672	177	5	513	10	70252.50	18265.70
8673	177	1	321	3	17441.76	4186.02
8674	177	49	850	9	77720.40	15544.08
8675	744	16	37	2	18940.00	1894.00
8676	609	10	753	6	30476.22	7923.84
8677	177	9	913	9	29439.00	5593.41
8678	177	40	915	10	24875.20	5223.80
8679	177	16	195	1	9931.30	1092.44
8680	193	20	639	3	25959.39	8826.18
8681	177	23	522	4	32859.52	8543.48
8682	177	30	804	5	22659.25	8610.50
8683	177	6	784	8	72362.48	27497.76
8684	177	37	640	2	11014.52	3194.22
8685	177	33	603	3	7849.17	2354.76
8686	177	10	750	8	2939.12	940.48
8687	177	48	182	10	63543.20	19698.40
8688	177	40	358	5	123.00	36.90
8689	177	42	63	1	7739.18	1238.27
8690	177	41	104	7	43084.79	16803.08
8691	177	6	659	4	23291.96	5124.24
8692	177	17	998	10	73185.00	13905.10
8693	177	45	596	2	8494.12	1274.12
8694	523	37	192	3	9165.87	2474.79
8695	687	4	874	5	14299.15	2573.85
8696	177	19	359	6	31009.08	10233.00
8697	177	32	271	8	47805.04	9082.96
8698	200	12	431	10	20898.70	5015.70
8699	177	15	572	8	49682.32	13911.04
8700	177	42	14	5	38412.40	9219.00
8701	601	50	597	4	31308.80	8766.48
8702	91	29	94	3	26218.29	7865.49
8703	177	10	365	9	31881.06	10201.95
8704	825	21	358	9	221.40	66.42
8705	177	48	800	5	48995.35	8819.15
8706	177	39	349	8	39232.72	11377.52
8707	177	8	734	10	13623.70	5313.20
8708	177	38	52	2	9273.92	927.40
8709	249	35	144	4	30086.40	8424.20
8710	177	47	447	5	10302.05	3296.65
8711	177	8	140	1	7551.88	2492.12
8712	177	45	2	9	18091.08	2713.68
8713	177	20	590	3	27184.80	3534.03
8714	177	40	137	4	25545.28	8174.48
8715	177	50	584	4	20058.68	6418.76
8716	177	21	214	5	2740.10	520.60
8717	177	4	848	7	31057.95	7453.88
8718	115	29	471	4	29400.60	7644.16
8719	791	7	44	3	19243.56	4041.15
8720	177	15	622	9	34994.25	3499.38
8721	177	14	719	3	10665.75	2559.78
8722	743	47	29	7	42180.39	9279.69
8723	177	38	131	8	3787.60	1401.44
8724	177	10	568	1	8553.90	2651.71
8725	177	44	500	6	34697.88	6939.60
8726	177	7	342	8	63614.48	18448.16
8727	177	8	790	1	4234.42	1355.01
8728	177	30	425	1	2805.81	476.99
8729	415	7	332	8	77343.60	20109.36
8730	177	9	937	5	2429.95	315.90
8731	877	44	811	9	88305.93	35322.39
8732	177	7	382	2	4338.60	737.56
8733	177	49	813	1	6474.66	1553.92
8734	177	47	811	4	39247.08	15698.84
8735	22	47	753	9	45714.33	11885.76
8736	177	20	434	5	42155.55	8009.55
8737	177	37	470	1	7038.94	1478.18
8738	177	33	537	7	48596.24	13606.95
8739	595	32	804	4	18127.40	6888.40
8740	177	7	863	6	19147.80	7276.14
8741	12	22	644	3	2567.04	872.79
8742	177	17	447	1	2060.41	659.33
8743	177	31	343	10	96020.70	14403.10
8744	177	22	539	1	4267.53	896.18
8745	177	42	84	5	9592.25	1055.15
8746	177	5	832	1	5579.52	1060.11
8747	177	16	531	4	24282.24	5584.92
8748	177	43	889	3	13239.81	3045.15
8749	177	3	420	4	19758.80	5927.64
8750	177	45	979	1	8909.31	2940.07
8751	177	1	945	7	55989.43	10078.11
8752	408	33	663	1	7580.35	2880.53
8753	177	41	623	4	28673.28	5734.64
8754	177	36	369	1	2305.00	437.95
8755	177	27	995	7	67372.06	18190.48
8756	177	13	417	5	26130.90	8100.60
8757	177	9	860	8	75124.08	22537.20
8758	535	20	121	2	13729.34	1510.22
8759	177	41	30	8	52352.32	7852.88
8760	177	35	584	2	10029.34	3209.38
8761	177	36	91	7	69607.09	16009.63
8762	177	10	570	5	10618.10	3610.15
8763	177	16	565	6	11151.48	3903.00
8764	757	25	78	1	6493.90	909.15
8765	177	49	958	10	86823.80	15628.30
8766	177	7	535	9	89432.28	32195.61
8767	529	39	262	5	37803.80	11341.15
8768	177	47	252	8	61768.64	7412.24
8769	177	39	178	4	24740.80	3711.12
8770	115	29	992	8	6483.28	1944.96
8771	177	2	962	4	28857.92	5771.60
8772	177	23	707	10	28280.10	4524.80
8773	177	33	65	10	65435.80	12432.80
8774	177	24	996	7	56143.01	16281.44
8775	177	6	280	5	40668.85	16267.55
8776	200	32	983	8	27898.56	4463.76
8777	306	3	491	8	55992.48	8398.88
8778	177	28	309	5	7972.75	1594.55
8779	177	2	784	14	126634.34	48121.08
8780	177	37	233	6	27234.66	9532.14
8781	30	17	726	1	4334.79	1430.48
8782	177	35	872	9	7652.34	994.77
8783	177	35	949	1	6750.12	2227.54
8784	177	24	351	10	2086.90	208.70
8785	177	12	279	5	17902.75	4117.65
8786	177	11	175	9	89173.89	15159.60
8787	177	46	635	4	11090.72	1552.72
8788	177	31	821	7	49227.22	16737.28
8789	177	29	371	7	28834.96	7497.07
8790	177	11	34	3	16145.49	5650.92
8791	358	29	14	9	69142.32	16594.20
8792	177	13	976	3	314.22	87.99
8793	716	28	55	1	8646.00	1037.52
8794	177	15	345	4	39694.40	11511.36
8795	177	46	620	4	15154.80	5455.72
8796	177	8	65	6	39261.48	7459.68
8797	177	25	970	9	1963.44	589.05
8798	177	22	764	6	45472.14	10003.86
8799	177	2	55	5	43230.00	5187.60
8800	177	1	422	4	22005.92	3741.00
8801	177	44	590	1	9061.60	1178.01
8802	177	39	528	10	95954.80	31665.10
8803	177	22	685	2	514.00	205.60
8804	177	36	18	2	19978.74	3596.18
8805	325	36	141	2	12139.34	1942.30
8806	177	49	579	9	48871.98	17593.92
8807	177	34	762	2	10723.38	1179.58
8808	177	34	644	1	855.68	290.93
8809	177	1	740	4	24765.08	9906.04
8810	177	10	78	10	64939.00	9091.50
8811	177	49	802	5	15039.10	4511.75
8812	177	47	57	9	28776.87	6906.42
8813	177	17	544	1	8980.37	2155.29
8814	311	16	167	10	74661.10	8959.30
8815	177	28	206	7	56437.08	9029.93
8816	177	12	7	4	18776.44	2816.48
8817	177	49	49	9	81741.96	8991.63
8818	177	12	241	3	17572.32	4041.63
8819	177	14	451	4	29931.80	5687.04
8820	177	48	282	3	8631.48	3366.27
8821	177	37	535	8	79495.36	28618.32
8822	177	4	382	5	10846.50	1843.90
8823	177	14	561	11	21777.58	5444.34
8824	877	44	3	8	69149.36	17287.36
8825	177	6	997	12	54917.04	8237.52
8826	177	14	639	3	25959.39	8826.18
8827	177	42	155	3	16026.75	4166.97
8828	177	29	406	1	3297.30	1055.14
8829	177	27	125	7	24671.57	8881.74
8830	1	6	876	8	9785.36	3816.32
8831	859	23	874	6	17158.98	3088.62
8832	277	39	763	5	18936.95	5491.70
8833	177	34	220	4	18897.24	3968.44
8834	874	9	387	5	27007.65	8372.35
8835	177	37	564	1	6412.14	705.34
8836	177	3	817	4	17032.56	5450.40
8837	177	33	382	9	19523.70	3319.02
8838	177	35	742	9	65926.62	22415.04
8839	177	14	387	9	48613.77	15070.23
8840	177	45	613	5	31291.20	4380.75
8841	688	16	517	9	62606.25	15651.54
8842	177	49	677	4	9063.36	3444.08
8843	177	3	89	1	5779.27	2138.33
8844	177	28	14	9	69142.32	16594.20
8845	177	34	98	3	2912.34	757.20
8846	177	14	669	1	3258.34	749.42
8847	177	48	793	1	6646.68	1927.54
8848	177	44	71	7	26825.82	5633.39
8849	177	31	449	14	121717.68	18257.68
8850	264	22	175	5	49541.05	8422.00
8851	177	39	357	6	56439.12	17496.12
8852	177	27	63	10	77391.80	12382.70
8853	177	2	462	6	31136.94	10586.58
8854	529	39	144	6	45129.60	12636.30
8855	177	46	695	2	19909.98	6968.50
8856	306	3	613	5	31291.20	4380.75
8857	177	33	212	2	10257.78	1948.98
8858	177	35	624	9	85341.60	10241.01
8859	177	34	215	1	9630.37	2022.38
8860	177	38	152	1	2431.58	389.05
8861	177	5	886	2	2495.24	948.20
8862	177	30	566	7	22787.45	6836.27
8863	177	17	780	10	64082.30	14098.10
8864	720	36	106	2	17308.12	3115.46
8865	177	21	477	7	8585.50	2919.07
8866	177	30	319	7	43902.95	16683.10
8867	177	50	825	7	7857.78	2278.78
8868	177	47	770	8	64916.08	14281.52
8869	177	37	428	2	9104.30	3186.50
8870	557	44	737	7	68423.25	7526.54
8871	177	8	660	5	22125.55	8186.45
8872	605	20	833	1	3970.99	1231.01
8873	241	12	19	3	29532.93	3839.28
8874	177	31	643	9	64624.05	14863.50
8875	177	36	129	3	26190.69	5238.15
8876	177	38	184	9	16089.84	6275.07
8877	177	34	128	7	22049.72	3307.43
8878	586	24	953	5	37928.10	4551.35
8879	177	10	624	3	28447.20	3413.67
8880	177	2	841	10	76182.30	25902.00
8881	177	42	233	9	40851.99	14298.21
8882	177	2	172	5	545.30	190.85
8883	583	43	76	10	15407.10	6008.80
8884	177	6	857	5	17202.35	1720.25
8885	177	42	298	8	57548.08	8056.72
8886	177	7	694	5	242.40	36.35
8887	177	48	107	3	25475.73	8152.23
8888	177	1	56	1	7716.88	3086.75
8889	177	50	66	5	10717.60	4179.85
8890	177	29	579	10	54302.20	19548.80
8891	177	39	560	5	46464.40	16262.55
8892	177	42	154	10	57635.00	10374.30
8893	177	10	491	10	69990.60	10498.60
8894	177	6	167	6	44796.66	5375.58
8895	177	7	560	8	74343.04	26020.08
8896	177	28	262	10	75607.60	22682.30
8897	654	44	970	2	436.32	130.90
8898	177	45	113	4	4705.92	1129.44
8899	177	24	19	2	19688.62	2559.52
8900	177	37	131	4	1893.80	700.72
8901	177	22	570	6	12741.72	4332.18
8902	259	1	143	3	12282.48	4667.34
8903	177	31	294	9	53015.22	9542.70
8904	641	47	931	9	24185.43	3869.64
8905	177	11	733	1	9104.72	2094.09
8906	137	45	992	8	6483.28	1944.96
8907	177	37	74	6	2130.30	489.96
8908	229	36	590	4	36246.40	4712.04
8909	177	26	990	4	29974.04	6294.56
8910	177	3	425	1	2805.81	476.99
8911	177	8	633	2	13767.74	5231.74
8912	177	47	616	9	9496.71	3798.72
8913	177	7	191	8	24435.36	4154.00
8914	177	29	616	1	1055.19	422.08
8915	177	3	264	3	27194.85	3807.27
8916	131	24	818	3	25849.02	7237.74
8917	768	32	541	5	38854.00	15153.05
8918	491	47	980	2	15145.84	3029.16
8919	177	16	205	3	689.79	151.74
8920	177	12	163	8	26961.52	7010.00
8921	177	14	549	4	23921.04	6458.68
8922	259	1	746	8	36368.88	13456.48
8923	177	38	92	16	91265.60	31942.88
8924	177	21	140	8	60415.04	19936.96
8925	177	48	25	6	36116.46	13001.94
8926	177	31	692	4	14668.96	1760.28
8927	177	49	879	2	9806.70	2451.68
8928	605	20	976	5	523.70	146.65
8929	177	21	218	3	22882.65	2745.93
8930	177	25	60	4	10794.40	1187.40
8931	182	11	925	5	24943.55	3990.95
8932	177	45	352	14	133902.72	28119.56
8933	177	43	175	3	29724.63	5053.20
8934	177	11	166	7	50149.82	19056.94
8935	177	38	264	3	27194.85	3807.27
8936	177	49	615	9	82485.09	24745.50
8937	312	12	80	1	4809.68	1875.78
8938	177	34	562	3	10369.65	2385.03
8939	177	32	809	4	17230.24	5858.28
8940	177	28	446	9	86244.66	25873.38
8941	177	42	370	4	5357.00	964.28
8942	177	27	960	4	3229.20	452.08
8943	177	50	604	9	26492.31	5033.52
8944	177	6	38	8	39144.16	10568.96
8945	177	47	766	3	4601.46	1334.43
8946	177	25	830	8	29595.76	2959.60
8947	180	7	629	10	55887.80	8942.00
8948	418	4	221	8	52678.32	15803.52
8949	438	22	736	2	13004.54	1430.50
8950	177	26	919	8	72794.48	10191.20
8951	177	41	776	20	109419.40	29543.20
8952	191	44	129	2	17460.46	3492.10
8953	177	38	962	3	21643.44	4328.70
8954	177	9	497	1	5234.00	1779.56
8955	177	10	840	2	12343.46	2715.56
8956	177	10	953	2	15171.24	1820.54
8957	177	3	690	3	15775.59	3155.13
8958	177	45	153	6	3070.02	1197.30
8959	177	7	323	5	10438.65	3131.60
8960	699	47	213	3	3178.20	381.39
8961	177	27	334	2	17500.62	4200.14
8962	177	32	368	10	42570.50	13196.90
8963	177	29	900	8	11933.52	4415.44
8964	177	23	764	8	60629.52	13338.48
8965	258	27	101	3	25489.35	6882.12
8966	177	29	648	9	61031.97	16478.64
8967	177	4	533	7	22934.31	8715.07
8968	177	11	490	9	43208.73	6049.26
8969	177	9	821	7	49227.22	16737.28
8970	177	38	485	4	28176.88	8734.84
8971	177	29	300	9	71116.38	22757.22
8972	177	17	614	10	97902.80	23496.70
8973	177	32	686	3	10259.22	2564.82
8974	177	3	685	1	257.00	102.80
8975	177	27	535	6	59621.52	21463.74
8976	177	4	128	5	15749.80	2362.45
8977	529	39	710	4	33586.52	13434.60
8978	177	38	49	8	72659.52	7992.56
8979	177	30	200	2	15778.64	3629.08
8980	177	13	487	1	6658.40	1997.52
8981	177	45	608	5	25952.45	3373.80
8982	177	28	754	8	268.88	72.56
8983	177	40	659	4	23291.96	5124.24
8984	177	42	283	6	57594.78	10367.04
8985	177	6	261	6	13738.02	4945.68
8986	177	22	573	10	16044.30	4973.70
8987	177	14	251	9	51284.97	15898.32
8988	177	49	429	5	23765.10	5228.30
8989	177	47	74	6	2130.30	489.96
8990	177	47	353	9	19697.94	5515.38
8991	177	45	512	9	8239.23	823.95
8992	177	39	181	1	3727.80	1192.90
8993	177	10	228	8	57939.44	21437.60
8994	177	37	609	2	18186.18	2182.34
8995	177	5	983	9	31385.88	5021.73
8996	177	9	491	10	69990.60	10498.60
8997	177	31	460	5	16632.70	4657.15
8998	177	16	145	4	30145.24	10852.28
8999	177	46	576	8	7980.96	2553.92
9000	177	8	905	9	8571.33	2057.13
9001	177	29	111	6	55842.90	10610.16
9002	549	30	774	9	78434.55	14902.56
9003	177	23	885	6	5610.60	2132.04
9004	469	30	135	7	37474.78	5621.21
9005	177	11	356	8	35669.44	6777.20
9006	477	48	180	6	21342.00	8536.80
9007	177	49	810	10	41825.60	15893.70
9008	177	31	605	1	5547.18	2163.40
9009	177	48	906	9	71132.04	21339.63
9010	788	13	781	1	3412.20	443.59
9011	177	16	991	9	29234.88	4677.57
9012	177	48	158	6	52423.20	16775.40
9013	177	16	99	10	47246.60	18898.60
9014	177	33	689	9	40860.27	13075.29
9015	177	22	298	9	64741.59	9063.81
9016	177	32	885	3	2805.30	1066.02
9017	177	34	412	1	8006.99	960.84
9018	177	49	776	8	43767.76	11817.28
9019	177	35	87	4	23545.60	2825.48
9020	177	34	691	9	76212.63	24388.02
9021	177	36	771	7	14610.61	1607.20
9022	177	47	89	3	17337.81	6414.99
9023	177	14	329	9	79125.21	24528.78
9024	177	25	242	2	19994.34	6598.14
9025	177	38	959	3	20698.83	4967.73
9026	177	6	768	8	79587.12	26263.76
9027	177	30	196	1	2614.47	836.63
9028	177	11	74	8	2840.40	653.28
9029	177	1	592	2	19635.98	3730.84
9030	177	41	289	1	5887.69	1177.54
9031	177	29	269	3	25520.73	5104.14
9032	177	6	717	4	39368.92	7086.40
9033	177	6	613	2	12516.48	1752.30
9034	180	7	112	3	7835.25	783.51
9035	177	8	88	10	17506.10	5076.80
9036	177	7	891	8	62197.52	9951.60
9037	177	16	914	9	47996.55	18718.65
9038	177	34	913	7	22897.00	4350.43
9039	426	15	705	5	37967.60	6834.15
9040	177	27	736	6	39013.62	4291.50
9041	177	36	903	10	77679.00	24080.50
9042	177	2	30	1	6544.04	981.61
9043	177	32	359	6	31009.08	10233.00
9044	177	3	963	9	57384.99	10903.14
9045	177	19	410	1	1246.29	473.59
9046	177	37	621	13	56606.68	19246.24
9047	740	35	353	7	15320.62	4289.74
9048	177	49	743	10	44676.90	14296.60
9049	177	34	176	11	53747.76	18274.19
9050	173	37	188	6	6874.74	1031.22
9051	177	33	968	1	3747.44	974.33
9052	177	6	50	9	17802.81	4628.70
9053	799	5	890	8	11027.20	2205.44
9054	177	8	670	8	34598.64	7611.68
9055	177	39	326	9	69419.25	12495.51
9056	177	21	450	6	50436.78	13113.54
9057	177	34	831	3	1236.27	247.26
9058	177	30	456	4	21565.84	2156.60
9059	177	19	476	8	66751.44	20692.96
9060	177	46	337	4	27738.24	4160.72
9061	177	41	78	3	19481.70	2727.45
9062	262	31	680	1	9930.49	2581.93
9063	177	20	636	3	166.98	26.73
9064	177	12	943	10	62335.00	24310.70
9065	177	3	329	10	87916.90	27254.20
9066	177	43	109	6	23150.94	6250.74
9067	177	20	227	3	22233.15	7336.95
9068	177	37	568	9	76985.10	23865.39
9069	177	50	955	5	5110.25	1839.70
9070	177	34	69	4	25517.20	7400.00
9071	177	45	810	9	37643.04	14304.33
9072	177	27	661	7	9468.90	3219.44
9073	177	3	730	8	68795.60	7567.52
9074	177	18	261	5	11448.35	4121.40
9075	177	11	805	3	8435.04	2867.91
9076	177	14	926	6	31821.36	8910.00
9077	177	34	553	2	13062.90	4572.02
9078	177	30	227	9	66699.45	22010.85
9079	565	48	513	3	21075.75	5479.71
9080	177	38	812	5	22875.95	5261.45
9081	177	17	882	4	3508.80	807.04
9082	177	2	95	6	28810.68	7490.76
9083	177	24	922	6	55116.96	12125.76
9084	177	6	103	10	27283.90	6002.50
9085	177	35	162	2	17907.44	3223.34
9086	177	3	925	5	24943.55	3990.95
9087	177	18	642	3	14463.75	4773.03
9088	320	20	543	3	11980.44	3354.51
9089	684	15	875	3	27604.89	6625.17
9090	177	13	844	6	54068.34	21086.64
9091	177	41	933	3	24164.52	8699.22
9092	280	22	587	8	1189.20	344.88
9093	177	14	725	3	16899.27	1858.92
9094	177	34	732	2	5566.96	612.36
9095	177	3	604	7	20605.13	3914.96
9096	177	14	363	2	15551.24	1866.14
9097	648	26	899	9	55138.68	14336.10
9098	177	14	847	8	19897.04	5571.20
9099	331	11	283	1	9599.13	1727.84
9100	177	27	270	4	1041.48	343.68
9101	177	48	19	2	19688.62	2559.52
9102	177	7	607	3	18384.99	4044.69
9103	177	45	892	5	17244.25	4655.95
9104	177	50	597	4	31308.80	8766.48
9105	177	49	830	9	33295.23	3329.55
9106	177	30	598	1	2204.61	573.20
9107	290	48	252	9	69489.72	8338.77
9108	251	49	235	6	34287.90	7543.32
9109	549	30	160	2	1048.64	335.56
9110	177	13	392	10	65308.50	23511.10
9111	344	49	584	8	40117.36	12837.52
9112	177	23	953	4	30342.48	3641.08
9113	177	42	586	6	40021.02	5202.72
9114	177	25	922	9	82675.44	18188.64
9115	177	11	841	9	68564.07	23311.80
9116	177	12	989	8	5831.28	1632.72
9117	177	19	333	3	6528.90	1958.67
9118	177	30	697	3	3939.84	1418.34
9119	177	37	580	8	45391.52	6808.72
9120	177	34	369	7	16135.00	3065.65
9121	177	14	326	8	61706.00	11107.12
9122	177	14	770	9	73030.59	16066.71
9123	177	12	12	9	88506.27	15046.11
9124	177	10	393	6	28843.62	10383.72
9125	177	11	993	5	36007.20	9001.80
9126	177	31	272	9	26611.47	5056.20
9127	177	16	10	4	11305.00	4295.88
9128	29	2	592	9	88361.91	16788.78
9129	115	29	749	10	16834.80	4545.40
9130	177	50	854	1	4165.78	1458.02
9131	177	36	795	3	20016.30	6605.37
9132	177	27	693	10	47707.60	17174.70
9133	177	33	98	10	9707.80	2524.00
9134	258	27	510	7	38874.01	5053.65
9135	177	44	387	9	48613.77	15070.23
9136	557	44	279	7	25063.85	5764.71
9137	177	7	218	8	61020.40	7322.48
9138	177	18	163	10	33701.90	8762.50
9139	177	29	344	4	4150.68	747.12
9140	177	19	255	1	511.02	194.19
9141	177	8	437	8	43329.28	15165.28
9142	177	32	667	8	42826.72	17130.72
9143	177	49	244	3	18431.88	7188.42
9144	337	26	559	7	43004.22	12041.19
9145	177	10	653	5	17534.75	3682.30
9146	177	38	200	3	23667.96	5443.62
9147	639	46	532	2	17913.94	2149.68
9148	177	15	520	8	4323.28	1642.88
9149	177	46	565	2	3717.16	1301.00
9150	177	15	668	6	23107.38	6701.16
9151	177	8	933	3	24164.52	8699.22
9152	177	6	35	1	2947.54	795.84
9153	177	12	927	4	31046.20	8692.92
9154	306	3	269	10	85069.10	17013.80
9155	177	14	352	1	9564.48	2008.54
9156	177	14	358	6	147.60	44.28
9157	177	21	732	3	8350.44	918.54
9158	177	43	292	17	134554.32	39020.78
9159	177	21	423	3	26867.49	4836.15
9160	177	18	219	2	18299.14	7136.66
9161	177	22	809	6	25845.36	8787.42
9162	312	12	711	10	33870.50	5080.60
9163	177	45	743	4	17870.76	5718.64
9164	177	48	304	4	33441.16	5350.60
9165	290	48	157	3	4301.34	1118.34
9166	734	18	826	4	23604.92	6137.28
9167	177	17	547	6	44546.16	5791.02
9168	177	43	893	7	43569.61	13942.25
9169	177	12	37	3	28410.00	2841.00
9170	177	15	586	6	40021.02	5202.72
9171	177	43	985	7	52720.22	5272.05
9172	365	12	890	3	4135.20	827.04
9173	41	37	879	7	34323.45	8580.88
9174	177	34	214	5	2740.10	520.60
9175	177	32	854	4	16663.12	5832.08
9176	177	9	728	4	39529.32	10277.64
9177	177	27	208	5	37872.90	12498.05
9178	177	4	787	13	1976.39	355.81
9179	325	36	988	1	3478.66	660.95
9180	177	44	138	6	26388.18	2902.68
9181	177	30	901	8	13436.48	2552.96
9182	177	31	738	9	20850.93	4587.21
9183	177	35	278	1	8210.32	2463.10
9184	177	22	102	9	43648.11	6983.73
9185	177	50	937	5	2429.95	315.90
9186	177	31	420	5	24698.50	7409.55
9187	177	18	710	5	41983.15	16793.25
9188	177	25	404	2	17862.72	5001.56
9189	177	25	321	4	23255.68	5581.36
9190	177	45	515	8	70648.00	20487.92
9191	312	12	54	6	862.38	258.72
9192	177	45	779	5	34846.85	10802.50
9193	437	29	294	3	17671.74	3180.90
9194	523	37	13	9	74224.71	11133.72
9195	177	2	129	5	43651.15	8730.25
9196	180	7	797	10	68248.10	15014.60
9197	177	3	979	4	35637.24	11760.28
9198	177	49	452	7	16352.42	4905.74
9199	433	30	925	2	9977.42	1596.38
9200	177	37	380	3	7867.14	1809.45
9201	177	11	879	4	19613.40	4903.36
9202	633	22	943	7	43634.50	17017.49
9203	177	39	333	10	21763.00	6528.90
9204	177	12	362	6	56528.70	16958.58
9205	177	14	413	5	8524.85	2045.95
9206	177	27	420	10	49397.00	14819.10
9207	177	1	72	2	15603.32	2496.54
9208	415	7	306	6	43324.86	16896.72
9209	177	21	594	4	29074.96	9594.72
9210	177	31	112	8	20894.00	2089.36
9211	177	36	494	2	5827.74	990.72
9212	177	37	973	1	3436.02	1271.33
9213	177	11	906	4	31614.24	9484.28
9214	177	35	760	3	11540.70	3577.62
9215	177	27	540	7	38367.14	3836.70
9216	177	34	114	3	28455.18	7967.46
9217	177	46	889	12	52959.24	12180.60
9218	177	47	390	3	4912.41	786.00
9219	177	1	141	9	54627.03	8740.35
9220	177	1	805	8	22493.44	7647.76
9221	177	10	395	10	76399.30	12223.90
9222	177	39	881	7	65418.22	26167.26
9223	510	46	123	5	10812.20	1838.05
9224	660	4	731	10	55068.40	8260.30
9225	177	19	106	2	17308.12	3115.46
9226	177	40	525	8	55114.40	19841.20
9227	177	36	357	5	47032.60	14580.10
9228	660	47	637	9	30770.55	12000.51
9229	177	11	905	2	1904.74	457.14
9230	177	3	845	1	8881.82	1865.18
9231	177	8	854	5	20828.90	7290.10
9232	177	4	574	10	84666.50	21166.60
9233	177	3	878	7	43073.17	5599.51
9234	177	7	688	14	124813.92	14977.62
9235	177	20	785	2	9302.06	2790.62
9236	177	4	559	5	30717.30	8600.85
9237	177	10	672	5	36767.85	6985.90
9238	177	1	187	3	4497.78	494.76
9239	437	29	520	8	4323.28	1642.88
9240	177	9	278	9	73892.88	22167.90
9241	177	50	417	7	36583.26	11340.84
9242	177	40	240	8	13208.32	1717.12
9243	177	13	158	1	8737.20	2795.90
9244	177	3	324	4	23654.60	5204.00
9245	177	10	14	1	7682.48	1843.80
9246	177	32	194	4	21748.88	3262.32
9247	177	15	137	6	38317.92	12261.72
9248	177	25	364	9	56375.01	14657.49
9249	177	7	420	10	49397.00	14819.10
9250	257	8	399	10	38750.00	8912.50
9251	177	6	194	5	27186.10	4077.90
9252	177	8	511	6	9220.32	2950.50
9253	546	5	135	7	37474.78	5621.21
9254	426	24	757	2	2172.22	369.28
9255	177	30	297	8	61837.44	10512.40
9256	139	17	465	5	18000.15	4140.05
9257	177	7	636	10	556.60	89.10
9258	177	46	433	6	8011.44	2803.98
9259	177	44	58	10	95592.80	19118.60
9260	177	34	943	10	62335.00	24310.70
9261	177	39	641	8	50261.12	15580.96
9262	177	12	371	8	32954.24	8568.08
9263	177	2	666	8	25115.60	7032.40
9264	177	28	65	5	32717.90	6216.40
9265	177	35	191	1	3054.42	519.25
9266	257	48	692	10	36672.40	4400.70
9267	177	29	907	6	300.84	36.12
9268	89	22	469	3	109.17	32.76
9269	177	17	910	7	20019.44	4003.86
9270	177	13	486	10	62967.00	14482.40
9271	64	30	191	7	21380.94	3634.75
9272	177	4	540	8	43848.16	4384.80
9273	177	35	9	5	36648.80	11361.15
9274	177	22	916	10	28088.90	4775.10
9275	177	26	642	7	33748.75	11137.07
9276	177	45	193	4	20490.68	5122.68
9277	177	1	747	3	414.78	66.36
9278	177	22	526	8	5895.36	766.40
9279	177	14	468	7	14661.22	1759.38
9280	177	6	832	10	55795.20	10601.10
9281	177	31	298	5	35967.55	5035.45
9282	696	30	397	9	49155.12	5407.02
9283	177	37	486	9	56670.30	13034.16
9284	760	16	79	1	9062.43	1721.86
9285	377	49	990	4	29974.04	6294.56
9286	177	39	483	2	14765.22	2362.44
9287	630	11	381	1	1168.51	338.87
9288	177	6	701	10	84977.30	24643.40
9289	620	29	167	4	29864.44	3583.72
9290	104	19	813	10	64746.60	15539.20
9291	177	17	706	7	57588.30	5758.83
9292	395	11	67	8	55972.48	8955.60
9293	177	33	803	9	50762.61	7106.76
9294	177	7	492	2	4103.70	943.86
9295	177	46	10	9	25436.25	9665.73
9296	177	47	108	4	24753.68	3465.52
9297	177	25	459	10	5970.90	2089.80
9298	177	16	159	1	4233.80	1185.46
9299	177	27	412	5	40034.95	4804.20
9300	177	47	168	5	3286.35	361.50
9301	720	43	163	3	10110.57	2628.75
9302	177	34	922	2	18372.32	4041.92
9303	177	6	204	6	17444.88	5582.34
9304	177	3	44	1	6414.52	1347.05
9305	177	37	71	4	15329.04	3219.08
9306	177	46	742	7	51276.26	17433.92
9307	177	48	264	11	99714.45	13959.99
9308	177	2	742	4	29300.72	9962.24
9309	177	37	329	5	43958.45	13627.10
9310	526	7	841	8	60945.84	20721.60
9311	177	6	81	7	42800.94	16264.36
9312	177	1	32	8	43132.56	16821.68
9313	177	13	711	8	27096.40	4064.48
9314	177	50	439	10	41983.10	5457.80
9315	66	37	690	2	10517.06	2103.42
9316	177	16	376	4	21546.08	5817.44
9317	177	9	738	3	6950.31	1529.07
9318	177	12	435	2	14688.46	4406.54
9319	177	28	444	4	39422.72	12615.28
9320	177	42	169	4	29742.16	4758.76
9321	192	35	947	4	13494.68	2159.16
9322	177	11	66	6	12861.12	5015.82
9323	177	33	299	9	81357.30	13830.75
9324	452	14	665	8	6434.96	1351.36
9325	177	6	516	7	24191.30	8708.84
9326	177	47	701	8	67981.84	19714.72
9327	177	19	835	8	19633.92	5104.80
9328	524	44	422	8	44011.84	7482.00
9329	177	1	522	3	24644.64	6407.61
9330	177	36	321	1	5813.92	1395.34
9331	177	37	432	9	14292.81	3287.34
9332	177	11	812	7	32026.33	7366.03
9333	177	12	639	11	95184.43	32362.66
9334	177	50	10	4	11305.00	4295.88
9335	177	19	697	8	10506.24	3782.24
9336	177	10	798	8	56777.84	21575.60
9337	814	21	767	2	12908.28	4388.82
9338	177	12	53	2	19549.98	2150.50
9339	34	30	473	9	74863.17	16469.91
9340	370	9	415	5	32627.55	3915.30
9341	177	42	981	1	1771.06	425.05
9342	177	43	871	8	13385.44	1472.40
9343	786	22	652	8	33931.84	13572.72
9344	177	20	63	9	69652.62	11144.43
9345	177	15	378	1	5986.95	2035.56
9346	177	13	181	3	11183.40	3578.70
9347	177	3	103	7	19098.73	4201.75
9348	177	41	216	6	29998.86	8399.70
9349	177	4	778	1	5708.25	2169.14
9350	177	31	511	8	12293.76	3934.00
9351	177	43	955	4	4088.20	1471.76
9352	634	5	795	3	20016.30	6605.37
9353	177	3	361	5	19606.80	3529.20
9354	177	11	815	4	26305.24	4471.88
9355	177	23	701	9	76479.57	22179.06
9356	99	43	35	3	8842.62	2387.52
9357	177	34	684	6	49377.18	9381.66
9358	177	11	254	9	16235.10	6494.04
9359	156	46	163	8	26961.52	7010.00
9360	76	32	770	7	56801.57	12496.33
9361	177	4	561	4	7919.12	1979.76
9362	177	33	521	7	59286.08	23121.56
9363	177	34	12	8	78672.24	13374.32
9364	177	48	195	1	9931.30	1092.44
9365	177	1	206	8	64499.52	10319.92
9366	177	50	784	5	45226.55	17186.10
9367	549	30	470	6	42233.64	8869.08
9368	177	13	36	5	35992.55	10077.90
9369	820	36	124	4	18991.76	5697.52
9370	177	11	636	10	556.60	89.10
9371	94	31	213	4	4237.60	508.52
9372	177	40	942	10	17907.10	2686.10
9373	177	31	149	9	57559.77	8633.97
9374	177	26	908	1	5958.17	2204.52
9375	177	12	623	2	14336.64	2867.32
9376	177	45	747	10	1382.60	221.20
9377	177	6	454	6	29033.58	5226.06
9378	177	13	215	1	9630.37	2022.38
9379	177	30	217	3	14080.89	4787.49
9380	177	10	181	10	37278.00	11929.00
9381	177	6	678	6	19886.34	7357.92
9382	177	18	285	1	2946.12	441.92
9383	177	12	654	5	41568.85	10807.90
9384	177	5	313	9	84251.97	31173.21
9385	177	38	854	2	8331.56	2916.04
9386	177	27	800	1	9799.07	1763.83
9387	177	22	323	4	8350.92	2505.28
9388	177	1	704	1	8826.70	3265.88
9389	177	26	795	6	40032.60	13210.74
9390	177	13	462	4	20757.96	7057.72
9391	177	13	324	3	17740.95	3903.00
9392	575	36	617	1	5930.52	2253.60
9393	177	2	386	1	7612.37	2588.21
9394	601	50	232	7	69799.24	14657.86
9395	177	23	444	2	19711.36	6307.64
9396	177	27	417	9	47035.62	14581.08
9397	177	24	709	1	7182.84	2083.02
9398	177	5	777	4	39041.20	8589.08
9399	114	9	250	9	33649.56	10767.87
9400	177	17	369	3	6915.00	1313.85
9401	177	1	978	3	7648.20	1453.17
9402	177	33	380	8	20979.04	4825.20
9403	177	36	302	1	6522.44	2608.98
9404	177	9	838	4	20511.40	4512.52
9405	177	12	668	10	38512.30	11168.60
9406	177	41	804	8	36254.80	13776.80
9407	177	24	671	1	2573.98	386.10
9408	177	44	601	10	39565.40	9495.70
9409	177	48	733	6	54628.32	12564.54
9410	177	7	890	10	13784.00	2756.80
9411	177	16	819	3	9183.00	3397.71
9412	177	33	704	8	70613.60	26127.04
9413	177	15	453	2	18087.64	4521.92
9414	177	16	295	1	4607.56	783.29
9415	177	20	265	5	6673.90	1067.80
9416	177	10	866	1	2953.52	295.35
9417	177	36	468	1	2094.46	251.34
9418	806	3	624	8	75859.20	9103.12
9419	844	12	84	9	17266.05	1899.27
9420	177	38	900	10	14916.90	5519.30
9421	177	33	919	13	118291.03	16560.70
9422	177	48	197	3	16208.13	4052.04
9423	177	41	484	8	72368.32	18815.76
9424	177	14	851	10	43044.10	6026.20
9425	177	33	765	6	177.66	39.06
9426	177	15	173	2	12824.86	4616.94
9427	270	13	891	4	31098.76	4975.80
9428	709	14	938	8	26275.52	7619.92
9429	177	11	3	9	77793.03	19448.28
9430	177	49	947	9	30363.03	4858.11
9431	177	45	22	3	8399.94	840.00
9432	177	4	996	15	120306.45	34888.80
9433	344	49	791	8	22107.76	3979.36
9434	177	30	235	15	85719.75	18858.30
9435	177	9	504	9	6450.21	1225.53
9436	177	27	255	17	8687.34	3301.23
9437	177	31	330	6	42250.74	10985.22
9438	177	35	38	1	4893.02	1321.12
9439	177	36	831	6	2472.54	494.52
9440	177	7	941	6	50077.62	16525.62
9441	177	49	447	10	20604.10	6593.30
9442	177	46	301	6	15953.34	3350.22
9443	177	47	816	2	2393.96	813.94
9444	177	1	990	4	29974.04	6294.56
9445	177	29	384	3	29507.70	3245.85
9446	177	19	69	1	6379.30	1850.00
9447	177	4	627	7	41057.94	6158.67
9448	177	30	771	3	6261.69	688.80
9449	177	29	597	12	93926.40	26299.44
9450	177	14	877	9	26309.88	4472.64
9451	177	36	138	2	8796.06	967.56
9452	177	28	866	3	8860.56	886.05
9453	177	43	755	8	67832.56	12888.16
9454	191	33	369	6	13830.00	2627.70
9455	177	37	553	9	58783.05	20574.09
9456	177	40	680	4	39721.96	10327.72
9457	177	18	880	9	56561.13	7352.91
9458	66	37	638	6	52087.80	19272.48
9459	177	46	768	3	29845.17	9848.91
9460	177	3	520	9	4863.69	1848.24
9461	177	6	247	4	25072.00	3510.08
9462	177	17	86	1	7242.03	796.62
9463	95	1	872	3	2550.78	331.59
9464	258	32	547	6	44546.16	5791.02
9465	177	32	342	10	79518.10	23060.20
9466	177	32	618	4	27971.64	10069.80
9467	94	8	442	3	17877.48	4111.83
9468	177	2	336	7	29344.42	3814.79
9469	177	39	294	2	11781.16	2120.60
9470	177	6	1	8	45895.52	15145.52
9471	177	8	343	12	115224.84	17283.72
9472	177	6	214	5	2740.10	520.60
9473	177	23	720	8	25239.60	8833.84
9474	177	10	275	9	65712.78	21028.05
9475	177	44	635	2	5545.36	776.36
9476	177	16	212	7	35902.23	6821.43
9477	177	24	284	10	17061.00	2047.30
9478	177	49	940	5	31936.15	4151.70
9479	132	12	493	2	4997.74	949.58
9480	177	15	50	8	15824.72	4114.40
9481	177	29	558	9	89527.68	30439.44
9482	177	36	741	8	55469.84	14422.16
9483	177	29	17	8	15218.08	1674.00
9484	177	26	987	2	16173.20	5337.16
9485	633	22	558	9	89527.68	30439.44
9486	177	31	306	5	36104.05	14080.60
9487	177	38	284	8	13648.80	1637.84
9488	167	3	380	1	2622.38	603.15
9489	177	15	478	9	70639.74	9183.15
9490	177	34	390	10	16374.70	2620.00
9491	58	7	46	5	49601.65	10912.35
9492	177	31	777	8	78082.40	17178.16
9493	177	27	880	2	12569.14	1633.98
9494	177	4	625	3	20193.18	4644.42
9495	177	21	221	9	59263.11	17778.96
9496	177	21	790	1	4234.42	1355.01
9497	38	27	327	3	4222.65	1182.33
9498	177	27	759	2	8609.72	1808.04
9499	177	28	883	2	5035.56	1712.10
9500	177	16	810	10	41825.60	15893.70
9501	33	27	832	2	11159.04	2120.22
9502	853	31	291	3	7209.33	2523.27
9503	177	19	947	9	30363.03	4858.11
9504	199	49	70	10	22692.80	4084.70
9505	177	25	492	3	6155.55	1415.79
9506	177	32	112	2	5223.50	522.34
9507	177	14	997	5	22882.10	3432.30
9508	177	6	293	8	39479.84	7896.00
9509	177	35	875	6	55209.78	13250.34
9510	177	8	857	2	6880.94	688.10
9511	834	41	930	4	37352.96	9711.76
9512	177	8	928	2	12167.40	4015.24
9513	418	4	860	10	93905.10	28171.50
9514	177	45	232	1	9971.32	2093.98
9515	256	48	328	8	63692.72	20381.68
9516	177	22	958	13	112870.94	20316.79
9517	177	45	590	1	9061.60	1178.01
9518	177	43	690	7	36809.71	7361.97
9519	177	26	27	5	22945.95	7801.60
9520	177	27	459	10	5970.90	2089.80
9521	177	15	525	9	62003.70	22321.35
9522	177	5	482	2	6721.68	1478.76
9523	177	25	277	8	70740.32	7781.44
9524	177	23	611	7	48444.55	16955.61
9525	177	41	447	7	14422.87	4615.31
9526	177	50	300	9	71116.38	22757.22
9527	177	32	433	3	4005.72	1401.99
9528	61	8	513	5	35126.25	9132.85
9529	177	41	599	7	18902.52	6048.84
9530	177	30	663	4	30321.40	11522.12
9531	177	50	569	1	4145.80	870.62
9532	132	12	943	8	49868.00	19448.56
9533	177	3	202	7	61503.05	10455.55
9534	175	13	929	3	4692.81	1314.00
9535	177	17	449	2	17388.24	2608.24
9536	524	44	910	10	28599.20	5719.80
9537	177	45	923	1	3256.50	814.12
9538	177	29	335	8	36414.16	4369.68
9539	177	12	621	6	26126.16	8882.88
9540	177	45	921	9	39690.90	13891.77
9541	177	17	429	2	9506.04	2091.32
9542	41	37	458	4	28206.92	8180.00
9543	177	16	770	9	73030.59	16066.71
9544	177	37	508	2	19212.64	3842.52
9545	177	11	428	10	45521.50	15932.50
9546	177	24	7	5	23470.55	3520.60
9547	177	8	209	7	11438.70	4117.96
9548	177	18	716	19	52037.77	18213.21
9549	177	9	972	6	14651.70	4981.56
9550	177	15	90	5	28274.00	6785.75
9551	119	13	330	9	63376.11	16477.83
9552	177	48	132	4	12193.72	4023.92
9553	177	38	851	7	30130.87	4218.34
9554	177	1	602	3	10079.28	1915.05
9555	177	40	198	8	60167.28	12635.12
9556	177	40	870	4	17617.28	6518.40
9557	177	21	570	2	4247.24	1444.06
9558	177	6	603	4	10465.56	3139.68
9559	177	41	14	9	69142.32	16594.20
9560	636	24	79	4	36249.72	6887.44
9561	177	16	568	1	8553.90	2651.71
9562	177	6	465	6	21600.18	4968.06
9563	177	8	219	6	54897.42	21409.98
9564	150	30	938	9	29559.96	8572.41
9565	859	23	866	5	14767.60	1476.75
9566	177	17	722	7	67217.01	18148.62
9567	177	4	255	6	3066.12	1165.14
9568	30	17	935	1	3063.28	490.12
9569	177	37	251	8	45586.64	14131.84
9570	177	33	410	10	12462.90	4735.90
9571	177	15	49	3	27247.32	2997.21
9572	177	12	539	1	4267.53	896.18
9573	177	1	742	4	29300.72	9962.24
9574	177	45	237	10	78317.70	18013.10
9575	177	14	30	6	39264.24	5889.66
9576	177	18	866	5	14767.60	1476.75
9577	177	25	121	3	20594.01	2265.33
9578	177	27	750	5	1836.95	587.80
9579	856	18	215	10	96303.70	20223.80
9580	177	45	181	4	14911.20	4771.60
9581	177	11	246	1	1247.02	324.23
9582	177	45	495	3	16975.74	5262.48
9583	177	22	59	10	37654.40	10166.70
9584	177	4	917	15	13645.80	1501.05
9585	417	31	881	8	74763.68	29905.44
9586	380	1	608	9	46714.41	6072.84
9587	177	12	483	10	73826.10	11812.20
9588	405	31	726	9	39013.11	12874.32
9589	825	21	933	4	32219.36	11598.96
9590	497	5	687	3	5742.57	1493.07
9591	538	9	691	7	59276.49	18968.46
9592	177	47	600	5	11839.95	3907.20
9593	177	14	149	7	44768.71	6715.31
9594	177	10	362	6	56528.70	16958.58
9595	177	37	883	10	25177.80	8560.50
9596	177	48	820	5	9236.85	3417.65
9597	177	33	617	2	11861.04	4507.20
9598	177	50	424	5	31281.55	11887.00
9599	177	41	232	3	29913.96	6281.94
9600	177	2	661	4	5410.80	1839.68
9601	177	10	666	1	3139.45	879.05
9602	177	1	249	6	48998.10	6369.78
9603	177	23	846	1	6680.65	1937.39
9604	167	47	972	5	12209.75	4151.30
9605	150	30	212	8	41031.12	7795.92
9606	177	43	843	4	36646.64	8062.28
9607	177	1	565	7	13010.06	4553.50
9608	177	41	504	18	12900.42	2451.06
9609	177	4	810	3	12547.68	4768.11
9610	177	2	217	8	37549.04	12766.64
9611	177	20	589	2	11001.16	4400.46
9612	570	44	749	7	11784.36	3181.78
9613	3	17	453	3	27131.46	6782.88
9614	177	23	629	2	11177.56	1788.40
9615	177	18	478	9	70639.74	9183.15
9616	177	49	692	7	25670.68	3080.49
9617	177	13	801	2	4883.04	683.62
9618	177	15	484	1	9046.04	2351.97
9619	874	9	384	10	98359.00	10819.50
9620	76	32	453	5	45219.10	11304.80
9621	520	31	65	5	32717.90	6216.40
9622	177	6	165	7	17362.45	4687.83
9623	177	36	116	3	6725.37	1345.08
9624	177	42	909	9	44149.50	11037.42
9625	177	32	688	5	44576.40	5349.15
9626	280	22	805	7	19681.76	6691.79
9627	177	13	980	2	15145.84	3029.16
9628	177	17	96	6	47163.36	7546.14
9629	338	22	739	7	52847.48	12683.37
9630	177	25	684	1	8229.53	1563.61
9631	748	39	492	4	8207.40	1887.72
9632	177	43	661	8	10821.60	3679.36
9633	532	24	173	3	19237.29	6925.41
9634	536	29	617	6	35583.12	13521.60
9635	177	18	22	1	2799.98	280.00
9636	177	14	135	10	53535.40	8030.30
9637	177	4	729	2	11038.04	3863.32
9638	624	34	990	10	74935.10	15736.40
9639	177	20	893	10	62242.30	19917.50
9640	834	41	619	5	5236.15	890.15
9641	238	27	396	10	26913.80	6459.30
9642	177	49	928	2	12167.40	4015.24
9643	177	25	454	9	43550.37	7839.09
9644	177	36	74	2	710.10	163.32
9645	177	20	915	8	19900.16	4179.04
9646	177	45	194	6	32623.32	4893.48
9647	177	10	470	6	42233.64	8869.08
9648	272	46	188	8	9166.32	1374.96
9649	177	18	725	5	28165.45	3098.20
9650	293	31	287	3	8717.70	3225.54
9651	177	40	263	2	18744.68	3561.48
9652	177	36	96	5	39302.80	6288.45
9653	177	31	529	8	28718.16	9764.16
9654	177	38	517	8	55650.00	13912.48
9655	177	28	927	2	15523.10	4346.46
9656	177	3	304	10	83602.90	13376.50
9657	177	36	195	5	49656.50	5462.20
9658	598	9	42	5	26307.90	8681.60
9659	177	34	491	9	62991.54	9448.74
9660	177	26	560	1	9292.88	3252.51
9661	177	23	229	8	22185.04	5768.08
9662	177	26	369	6	13830.00	2627.70
9663	177	49	979	6	53455.86	17640.42
9664	177	7	227	2	14822.10	4891.30
9665	177	47	363	5	38878.10	4665.35
9666	177	16	929	5	7821.35	2190.00
9667	177	29	949	4	27000.48	8910.16
9668	177	46	834	9	30192.21	12076.92
9669	177	10	358	9	221.40	66.42
9670	112	49	263	1	9372.34	1780.74
9671	182	11	892	3	10346.55	2793.57
9672	177	11	273	5	18163.30	3451.05
9673	177	14	248	1	2822.52	762.08
9674	177	16	259	4	33173.16	3317.32
9675	177	36	109	8	30867.92	8334.32
9676	177	39	166	5	35821.30	13612.10
9677	177	27	618	6	41957.46	15104.70
9678	177	47	119	7	11996.74	3119.13
9679	177	45	762	6	32170.14	3538.74
9680	177	37	509	3	21418.47	6639.72
9681	177	19	23	10	56726.40	15316.10
9682	177	49	116	4	8967.16	1793.44
9683	177	13	777	12	117123.60	25767.24
9684	177	11	185	5	38607.70	7721.55
9685	177	2	263	7	65606.38	12465.18
9686	177	17	392	5	32654.25	11755.55
9687	177	29	193	8	40981.36	10245.36
9688	177	45	591	5	2979.60	327.75
9689	417	31	727	8	67523.84	25659.04
9690	177	2	616	7	7386.33	2954.56
9691	177	40	438	3	20106.66	4624.53
9692	256	29	119	5	8569.10	2227.95
9693	177	7	718	9	77666.31	17863.29
9694	177	37	990	6	44961.06	9441.84
9695	177	32	706	10	82269.00	8226.90
9696	177	13	688	3	26745.84	3209.49
9697	177	7	794	7	33040.98	4295.34
9698	177	21	209	4	6536.40	2353.12
9699	177	20	752	8	24888.64	7964.40
9700	177	14	989	5	3644.55	1020.45
9701	760	16	753	6	30476.22	7923.84
9702	177	18	398	8	22131.52	4868.96
9703	177	25	186	1	3243.76	616.31
9704	177	29	735	2	17869.44	6254.30
9705	177	45	556	5	31113.00	5600.35
9706	177	5	839	5	46103.50	5071.40
9707	177	43	425	2	5611.62	953.98
9708	177	9	917	6	5458.32	600.42
9709	177	12	816	6	7181.88	2441.82
9710	177	11	232	8	79770.56	16751.84
9711	177	36	677	3	6797.52	2583.06
9712	177	37	669	5	16291.70	3747.10
9713	177	11	669	3	9775.02	2248.26
9714	641	47	309	5	7972.75	1594.55
9715	177	22	44	5	32072.60	6735.25
9716	177	49	849	7	27160.77	10592.68
9717	177	36	217	9	42242.67	14362.47
9718	177	50	903	4	31071.60	9632.20
9719	177	6	144	3	22564.80	6318.15
9720	177	11	362	9	84793.05	25437.87
9721	177	21	20	2	5387.18	1077.44
9722	177	45	493	8	19990.96	3798.32
9723	177	48	486	8	50373.60	11585.92
9724	177	10	544	5	44901.85	10776.45
9725	529	39	783	9	76861.26	26132.85
9726	220	3	963	1	6376.11	1211.46
9727	177	39	258	4	37006.44	14432.52
9728	177	32	352	10	95644.80	20085.40
9729	177	11	944	8	35932.96	9701.92
9730	177	16	400	19	102019.93	29585.85
9731	177	35	546	4	23638.68	2836.64
9732	177	36	432	5	7940.45	1826.30
9733	177	44	992	8	6483.28	1944.96
9734	177	16	789	6	56885.46	13652.52
9735	177	34	794	1	4720.14	613.62
9736	177	41	666	6	18836.70	5274.30
9737	177	2	207	6	43867.56	14914.98
9738	177	17	386	10	76123.70	25882.10
9739	177	38	714	6	52385.58	19906.50
9740	607	5	982	8	72838.64	28407.04
9741	832	20	158	5	43686.00	13979.50
9742	177	2	703	9	56287.26	12383.19
9743	439	49	612	7	60707.99	14569.94
9744	177	39	495	5	28292.90	8770.80
9745	177	17	403	6	4163.04	457.92
9746	177	37	956	9	75043.17	21012.12
9747	89	43	635	5	13863.40	1940.90
9748	177	6	883	2	5035.56	1712.10
9749	177	41	102	6	29098.74	4655.82
9750	100	44	695	4	39819.96	13937.00
9751	177	47	299	10	90397.00	15367.50
9752	33	27	456	2	10782.92	1078.30
9753	177	24	790	10	42344.20	13550.10
9754	728	12	612	1	8672.57	2081.42
9755	177	31	957	4	20591.64	2882.84
9756	177	50	984	10	56596.60	7357.60
9757	177	41	7	1	4694.11	704.12
9758	177	22	440	5	38404.55	4224.50
9759	312	12	371	5	20596.40	5355.05
9760	177	38	560	6	55757.28	19515.06
9761	177	8	551	3	21341.22	5121.90
9762	177	20	706	6	49361.40	4936.14
9763	177	15	683	1	475.83	157.02
9764	177	47	415	9	58729.59	7047.54
9765	177	30	899	9	55138.68	14336.10
9766	177	6	59	9	33888.96	9150.03
9767	177	26	157	1	1433.78	372.78
9768	177	31	245	3	24029.70	6968.61
9769	177	42	153	8	4093.36	1596.40
9770	177	9	192	7	21387.03	5774.51
9771	177	17	327	3	4222.65	1182.33
9772	177	42	468	6	12566.76	1508.04
9773	177	24	325	1	6963.18	1114.11
9774	177	2	187	6	8995.56	989.52
9775	177	4	363	3	23326.86	2799.21
9776	177	10	294	8	47124.64	8482.40
9777	177	1	168	6	3943.62	433.80
9778	177	38	313	7	65529.31	24245.83
9779	177	11	308	16	20464.96	8185.92
9780	177	1	448	3	13557.09	3253.71
9781	177	13	476	9	75095.37	23279.58
9782	177	31	126	10	42607.40	5112.90
9783	177	36	669	1	3258.34	749.42
9784	311	2	479	6	3863.04	463.56
9785	177	30	611	10	69206.50	24222.30
9786	303	17	367	4	645.08	167.72
9787	177	35	155	10	53422.50	13889.90
9788	177	9	831	4	1648.36	329.68
9789	177	47	308	6	7674.36	3069.72
9790	177	13	994	10	20048.50	3007.30
9791	177	7	45	5	44272.35	6198.15
9792	177	3	701	1	8497.73	2464.34
9793	177	49	912	5	24775.65	2973.10
9794	177	44	315	10	44231.70	10173.30
9795	177	37	838	6	30767.10	6768.78
9796	83	44	588	1	1663.63	432.54
9797	177	47	488	6	57757.50	6353.34
9798	845	35	679	7	68435.08	25320.96
9799	177	18	594	7	50881.18	16790.76
9800	147	34	733	6	54628.32	12564.54
9801	177	22	443	6	16219.98	3892.80
9802	177	16	264	9	81584.55	11421.81
9803	177	31	155	5	26711.25	6944.95
9804	760	16	508	6	57637.92	11527.56
9805	177	28	976	1	104.74	29.33
9806	177	15	758	9	42949.71	16750.35
9807	177	37	565	6	11151.48	3903.00
9808	177	39	963	1	6376.11	1211.46
9809	177	31	601	6	23739.24	5697.42
9810	177	40	344	3	3113.01	560.34
9811	177	7	217	6	28161.78	9574.98
9812	177	27	14	5	38412.40	9219.00
9813	177	13	126	6	25564.44	3067.74
9814	177	30	420	8	39517.60	11855.28
9815	761	20	795	2	13344.20	4403.58
9816	177	35	289	3	17663.07	3532.62
9817	177	38	605	6	33283.08	12980.40
9818	177	18	540	9	49329.18	4932.90
9819	177	17	664	2	2347.08	258.18
9820	177	10	213	5	5297.00	635.65
9821	177	16	108	3	18565.26	2599.14
9822	177	33	326	7	53992.75	9718.73
9823	524	44	314	2	14210.40	4689.44
9824	177	48	136	4	21679.72	4986.32
9825	177	6	619	5	5236.15	890.15
9826	177	30	762	10	53616.90	5897.90
9827	574	45	684	2	16459.06	3127.22
9828	177	25	686	2	6839.48	1709.88
9829	177	15	777	4	39041.20	8589.08
9830	177	30	823	6	49904.76	13474.26
9831	177	17	215	9	86673.33	18201.42
9832	177	20	484	3	27138.12	7055.91
9833	177	9	239	8	16329.84	5062.24
9834	744	11	187	9	13493.34	1484.28
9835	177	11	115	8	35925.84	7544.40
9836	177	29	492	10	20518.50	4719.30
9837	177	30	921	3	13230.30	4630.59
9838	177	18	3	10	86436.70	21609.20
9839	177	43	310	6	7863.84	786.36
9840	177	25	2	19	38192.28	5728.88
9841	177	39	168	8	5258.16	578.40
9842	177	35	812	2	9150.38	2104.58
9843	177	39	603	2	5232.78	1569.84
9844	177	5	651	5	33911.45	10173.45
9845	177	5	583	7	36780.17	8827.21
9846	177	11	585	8	42992.64	4729.20
9847	177	18	182	4	25417.28	7879.36
9848	177	39	145	9	67826.79	24417.63
9849	177	50	810	10	41825.60	15893.70
9850	177	35	197	4	21610.84	5402.72
9851	177	1	345	3	29770.80	8633.52
9852	177	29	948	7	48232.31	16398.97
9853	200	12	247	1	6268.00	877.52
9854	177	15	655	13	89921.52	16185.91
9855	60	10	113	3	3529.44	847.08
9856	177	31	773	5	6299.80	1574.95
9857	306	17	140	8	60415.04	19936.96
9858	177	21	451	7	52380.65	9952.32
9859	177	17	508	10	96063.20	19212.60
9860	397	43	468	2	4188.92	502.68
9861	177	39	43	6	57913.86	9845.34
9862	177	10	446	4	38330.96	11499.28
9863	177	46	527	4	15001.12	3450.24
9864	229	36	449	10	86941.20	13041.20
9865	177	33	591	5	2979.60	327.75
9866	177	17	908	3	17874.51	6613.56
9867	177	27	697	1	1313.28	472.78
9868	177	29	974	2	17142.96	5828.60
9869	177	19	807	2	10757.54	3765.14
9870	177	9	869	1	9436.49	3208.41
9871	377	49	64	9	22177.98	7540.47
9872	177	19	445	3	25180.92	4028.94
9873	177	21	861	9	4773.96	1575.45
9874	177	25	959	8	55196.88	13247.28
9875	34	30	161	1	7608.68	2663.04
9876	177	46	557	5	13193.25	3694.10
9877	177	15	446	10	95827.40	28748.20
9878	177	41	494	3	8741.61	1486.08
9879	177	9	440	5	38404.55	4224.50
9880	177	43	147	4	32641.56	7181.16
9881	177	46	693	2	9541.52	3434.94
9882	177	4	334	3	26250.93	6300.21
9883	862	32	584	3	15044.01	4814.07
9884	177	40	573	3	4813.29	1492.11
9885	177	10	589	2	11001.16	4400.46
9886	177	1	445	5	41968.20	6714.90
9887	177	46	683	10	4758.30	1570.20
9888	753	29	907	4	200.56	24.08
9889	177	34	504	10	7166.90	1361.70
9890	177	42	401	2	2325.22	465.04
9891	177	34	505	4	10390.96	2182.12
9892	177	30	226	10	44752.30	5817.80
9893	177	45	901	3	5038.68	957.36
9894	177	50	402	9	34946.73	5242.05
9895	177	21	403	3	2081.52	228.96
9896	177	46	62	6	26621.16	6122.88
9897	177	1	26	9	32964.30	3296.43
9898	177	17	53	7	68424.93	7526.75
9899	527	17	500	9	52046.82	10409.40
9900	177	28	133	6	25562.34	8691.18
9901	177	43	944	2	8983.24	2425.48
9902	177	12	757	8	8688.88	1477.12
9903	699	26	17	10	19022.60	2092.50
9904	538	14	908	6	35749.02	13227.12
9905	259	1	480	5	27572.25	4687.30
9906	177	40	769	3	28469.19	5124.45
9907	177	11	314	4	28420.80	9378.88
9908	177	50	871	2	3346.36	368.10
9909	177	5	621	9	39189.24	13324.32
9910	177	7	675	10	4651.10	1674.40
9911	661	44	769	6	56938.38	10248.90
9912	177	18	348	6	4018.80	1567.32
9913	177	38	301	5	13294.45	2791.85
9914	177	31	851	2	8608.82	1205.24
9915	177	32	193	2	10245.34	2561.34
9916	177	8	36	1	7198.51	2015.58
9917	177	16	721	9	89705.16	21529.26
9918	177	17	116	6	13450.74	2690.16
9919	177	21	9	10	73297.60	22722.30
9920	177	20	941	9	75116.43	24788.43
9921	177	12	708	5	31780.35	9216.30
9922	177	41	59	1	3765.44	1016.67
9923	177	9	332	3	29003.85	7541.01
9924	177	1	534	5	44930.40	7638.15
9925	177	36	320	3	21865.11	5466.27
9926	177	7	351	3	626.07	62.61
9927	177	3	762	10	53616.90	5897.90
9928	177	21	580	3	17021.82	2553.27
9929	177	37	253	2	1694.22	406.62
9930	177	6	87	4	23545.60	2825.48
9931	177	10	551	9	64023.66	15365.70
9932	177	31	826	1	5901.23	1534.32
9933	177	23	154	2	11527.00	2074.86
9934	177	41	770	4	32458.04	7140.76
9935	177	22	130	5	41164.15	6174.60
9936	177	33	566	1	3255.35	976.61
9937	177	39	539	6	25605.18	5377.08
9938	177	4	238	6	42610.44	16191.96
9939	177	45	845	9	79936.38	16786.62
9940	598	9	950	8	46128.88	13377.36
9941	177	17	982	7	63733.81	24856.16
9942	508	10	922	9	82675.44	18188.64
9943	50	45	91	3	29831.61	6861.27
9944	177	8	595	13	107056.43	19270.16
9945	177	3	217	2	9387.26	3191.66
9946	177	38	771	2	4174.46	459.20
9947	177	9	800	1	9799.07	1763.83
9948	177	34	792	4	14365.12	4309.52
9949	177	33	539	6	25605.18	5377.08
9950	177	39	518	2	495.76	104.10
9951	177	6	482	2	6721.68	1478.76
9952	177	31	454	7	33872.51	6097.07
9953	757	25	990	5	37467.55	7868.20
9954	177	33	685	4	1028.00	411.20
9955	177	28	750	8	2939.12	940.48
9956	177	16	926	10	53035.60	14850.00
9957	820	36	911	7	16534.14	3802.82
9958	131	24	345	5	49618.00	14389.20
9959	177	8	724	1	9280.13	2598.44
9960	177	30	523	4	32405.44	12638.12
9961	177	15	627	10	58654.20	8798.10
9962	311	2	495	9	50927.22	15787.44
9963	177	6	974	10	85714.80	29143.00
9964	177	27	363	5	38878.10	4665.35
9965	177	11	154	10	57635.00	10374.30
9966	177	10	500	2	11565.96	2313.20
9967	177	15	399	1	3875.00	891.25
9968	272	46	624	7	66376.80	7965.23
9969	177	20	979	4	35637.24	11760.28
9970	177	9	770	4	32458.04	7140.76
9971	177	48	442	1	5959.16	1370.61
9972	177	38	909	1	4905.50	1226.38
9973	177	25	457	2	3320.48	1029.34
9974	177	42	523	8	64810.88	25276.24
9975	177	21	942	4	7162.84	1074.44
9976	177	39	470	10	70389.40	14781.80
9977	177	40	294	8	47124.64	8482.40
9978	177	33	546	5	29548.35	3545.80
9979	177	2	200	11	86782.52	19959.94
9980	842	19	190	5	28344.25	7936.40
9981	177	1	59	9	33888.96	9150.03
9982	177	29	788	6	21969.30	3515.10
9983	177	8	301	7	18612.23	3908.59
9984	177	40	188	3	3437.37	515.61
9985	177	39	649	10	86735.00	32091.90
9986	177	39	364	3	18791.67	4885.83
9987	753	29	67	6	41979.36	6716.70
9988	177	40	796	6	40490.52	6883.38
9989	610	32	628	7	28197.47	6767.39
9990	870	21	185	5	38607.70	7721.55
9991	177	6	958	10	86823.80	15628.30
9992	177	14	332	5	48339.75	12568.35
9993	267	23	910	10	28599.20	5719.80
9994	177	12	88	3	5251.83	1523.04
9995	177	29	219	9	82346.13	32114.97
9996	183	3	308	9	11511.54	4604.58
9997	177	48	267	8	51764.96	10870.64
9998	177	32	656	5	5274.40	580.20
9999	177	8	135	9	48181.86	7227.27
10000	177	9	346	2	8015.66	2164.22
10001	177	39	316	10	37878.80	13636.40
10002	177	14	2	1	2010.12	301.52
10003	200	12	521	7	59286.08	23121.56
10004	177	6	725	10	56330.90	6196.40
10005	177	32	241	7	41002.08	9430.47
10006	177	23	505	7	18184.18	3818.71
10007	253	24	237	3	23495.31	5403.93
10008	177	3	16	10	40058.00	7210.40
10009	177	2	596	8	33976.48	5096.48
10010	177	20	423	7	62690.81	11284.35
10011	267	23	224	2	15068.84	1808.26
10012	177	18	341	8	72462.32	16666.32
10013	177	41	839	4	36882.80	4057.12
10014	177	21	781	10	34122.00	4435.90
10015	177	28	67	10	69965.60	11194.50
10016	688	16	784	10	90453.10	34372.20
10017	177	11	451	9	67346.55	12795.84
10018	177	39	479	3	1931.52	231.78
10019	177	38	721	1	9967.24	2392.14
10020	177	20	842	8	31466.96	7237.44
10021	177	21	651	4	27129.16	8138.76
10022	177	3	765	1	29.61	6.51
10023	177	5	141	5	30348.35	4855.75
10024	798	2	463	6	56553.18	12441.72
10025	748	39	812	8	36601.52	8418.32
10026	177	21	739	8	60397.12	14495.28
10027	177	38	792	1	3591.28	1077.38
10028	177	14	380	5	13111.90	3015.75
10029	177	5	253	6	5082.66	1219.86
10030	608	45	987	2	16173.20	5337.16
10031	177	43	168	9	5915.43	650.70
10032	177	8	614	8	78322.24	18797.36
10033	177	39	809	11	47383.16	16110.27
10034	177	25	252	8	61768.64	7412.24
10035	177	25	171	5	45870.95	15596.10
10036	293	31	645	1	195.84	68.54
10037	64	30	446	8	76661.92	22998.56
10038	177	47	395	3	22919.79	3667.17
10039	177	30	467	5	47643.35	16675.15
10040	293	29	231	3	21358.65	5126.07
10041	177	10	344	10	10376.70	1867.80
10042	177	1	30	8	52352.32	7852.88
10043	177	11	668	8	30809.84	8934.88
10044	177	27	10	3	8478.75	3221.91
10045	177	19	337	2	13869.12	2080.36
10046	177	47	760	7	26928.30	8347.78
10047	177	39	723	4	21201.64	4240.32
10048	177	33	99	2	9449.32	3779.72
10049	177	18	660	9	39825.99	14735.61
10050	177	22	959	7	48297.27	11591.37
10051	177	12	560	3	27878.64	9757.53
10052	177	4	242	3	29991.51	9897.21
10053	177	20	397	1	5461.68	600.78
10054	12	22	387	2	10803.06	3348.94
10055	691	29	465	2	7200.06	1656.02
10056	177	45	542	9	84928.68	11889.99
10057	177	27	80	10	48096.80	18757.80
10058	177	3	670	6	25948.98	5708.76
10059	177	37	692	7	25670.68	3080.49
10060	177	48	912	4	19820.52	2378.48
10061	177	49	759	3	12914.58	2712.06
10062	177	42	378	10	59869.50	20355.60
10063	177	38	333	3	6528.90	1958.67
10064	177	33	905	7	6666.59	1599.99
10065	177	3	571	3	18876.30	2076.39
10066	177	29	878	3	18459.93	2399.79
10067	177	29	577	7	54670.56	9293.97
10068	177	19	150	9	74775.78	22432.77
10069	177	44	142	2	9081.06	2361.08
10070	177	6	333	2	4352.60	1305.78
10071	177	25	553	11	71845.95	25146.11
10072	565	48	840	4	24686.92	5431.12
10073	177	15	990	3	22480.53	4720.92
10074	177	15	437	9	48745.44	17060.94
10075	177	7	878	3	18459.93	2399.79
10076	177	16	881	6	56072.76	22429.08
10077	177	8	120	8	63624.40	14633.60
10078	177	5	180	7	24899.00	9959.60
10079	177	49	265	9	12013.02	1922.04
10080	177	38	956	3	25014.39	7004.04
10081	177	18	898	9	45233.01	17188.56
10082	818	6	101	7	59475.15	16058.28
10083	177	30	535	8	79495.36	28618.32
10084	177	16	93	1	5017.94	1605.74
10085	177	34	86	13	94146.39	10356.06
10086	177	50	234	9	53880.66	8082.09
10087	177	27	745	9	73399.77	12477.96
10088	177	24	810	8	33460.48	12714.96
10089	177	17	757	7	7602.77	1292.48
10090	177	36	9	9	65967.84	20450.07
10091	177	45	432	3	4764.27	1095.78
10092	177	5	1	1	5736.94	1893.19
10093	177	22	437	10	54161.60	18956.60
10094	177	36	838	4	20511.40	4512.52
10095	177	28	559	5	30717.30	8600.85
10096	177	9	611	10	69206.50	24222.30
10097	182	11	628	2	8056.42	1933.54
10098	177	18	903	10	77679.00	24080.50
10099	177	12	998	9	65866.50	12514.59
10100	177	40	572	8	49682.32	13911.04
10101	177	13	2	1	2010.12	301.52
10102	177	37	19	4	39377.24	5119.04
10103	816	40	53	10	97749.90	10752.50
10104	177	10	191	3	9163.26	1557.75
10105	177	24	832	6	33477.12	6360.66
10106	177	49	511	4	6146.88	1967.00
10107	177	44	259	5	41466.45	4146.65
10108	177	37	624	4	37929.60	4551.56
10109	177	41	431	3	6269.61	1504.71
10110	177	39	844	5	45056.95	17572.20
10111	177	6	348	3	2009.40	783.66
10112	177	45	3	8	69149.36	17287.36
10113	177	46	958	2	17364.76	3125.66
10114	177	12	249	2	16332.70	2123.26
10115	177	24	526	4	2947.68	383.20
10116	177	33	621	6	26126.16	8882.88
10117	177	36	455	1	3974.47	516.68
10118	177	46	59	12	45185.28	12200.04
10119	177	33	25	9	54174.69	19502.91
10120	177	36	273	8	29061.28	5521.68
10121	177	34	36	5	35992.55	10077.90
10122	177	36	25	7	42135.87	15168.93
10123	177	18	521	3	25408.32	9909.24
10124	177	44	676	4	1860.40	558.12
10125	177	6	161	8	60869.44	21304.32
10126	731	1	799	4	23440.20	6563.24
10127	177	4	138	1	4398.03	483.78
10128	177	39	628	8	32225.68	7734.16
10129	50	45	625	10	67310.60	15481.40
10130	177	36	75	7	27916.49	2791.67
10131	177	19	868	10	36845.20	7737.50
10132	177	12	807	7	37651.39	13177.99
10133	177	21	595	4	32940.44	5929.28
10134	177	10	775	10	2059.60	267.70
10135	177	48	412	4	32027.96	3843.36
10136	791	7	272	4	11827.32	2247.20
10137	788	13	997	9	41187.78	6178.14
10138	177	27	123	6	12974.64	2205.66
10139	570	44	637	8	27351.60	10667.12
10140	177	39	220	3	14172.93	2976.33
10141	177	24	283	10	95991.30	17278.40
10142	818	6	115	3	13472.19	2829.15
10143	17	40	517	2	13912.50	3478.12
10144	177	12	263	6	56234.04	10684.44
10145	177	35	794	4	18880.56	2454.48
10146	788	13	837	10	93380.20	28014.10
10147	177	4	79	4	36249.72	6887.44
10148	177	40	280	9	73203.93	29281.59
10149	177	14	935	9	27569.52	4411.08
10150	257	8	458	7	49362.11	14315.00
10151	177	12	312	4	38997.48	11699.24
10152	177	24	829	4	32644.76	9467.00
10153	177	15	384	10	98359.00	10819.50
10154	177	44	218	7	53392.85	6407.17
10155	177	4	990	1	7493.51	1573.64
10156	177	39	897	3	6052.35	2360.43
10157	177	13	51	8	43844.56	5699.76
10158	177	48	427	4	7579.08	1364.24
10159	89	43	604	8	23548.72	4474.24
10160	177	26	668	3	11553.69	3350.58
10161	669	19	788	1	3661.55	585.85
10162	177	29	62	6	26621.16	6122.88
10163	177	50	356	6	26752.08	5082.90
10164	177	5	279	2	7161.10	1647.06
10165	275	29	921	8	35280.80	12348.24
10166	177	36	546	9	53187.03	6382.44
10167	177	30	624	1	9482.40	1137.89
10168	177	4	650	3	25008.18	9253.02
10169	177	24	4	2	13743.26	3573.24
10170	328	45	546	1	5909.67	709.16
10171	177	43	949	8	54000.96	17820.32
10172	177	31	118	9	21028.86	5677.83
10173	177	42	1	3	17210.82	5679.57
10174	177	15	58	4	38237.12	7647.44
10175	177	1	654	5	41568.85	10807.90
10176	294	20	513	9	63227.25	16439.13
10177	177	37	45	9	79690.23	11156.67
10178	177	35	284	4	6824.40	818.92
10179	177	23	791	5	13817.35	2487.10
10180	740	35	914	4	21331.80	8319.40
10181	177	11	676	8	3720.80	1116.24
10182	83	44	935	8	24506.24	3920.96
10183	241	12	323	2	4175.46	1252.64
10184	177	22	581	3	15139.17	3784.80
10185	171	36	647	3	20934.81	2302.83
10186	177	43	911	8	18896.16	4346.08
10187	177	31	596	9	38223.54	5733.54
10188	163	2	756	4	15843.20	5228.24
10189	177	36	667	10	53533.40	21413.40
10190	177	32	457	5	8301.20	2573.35
10191	177	24	478	10	78488.60	10203.50
10192	173	37	848	4	17747.40	4259.36
10193	64	30	971	2	17468.66	2270.92
10194	177	30	244	8	49151.68	19169.12
10195	177	26	428	6	27312.90	9559.50
10196	156	46	932	1	3200.78	320.08
10197	581	32	535	1	9936.92	3577.29
10198	177	9	218	5	38137.75	4576.55
10199	177	6	677	13	29455.92	11193.26
10200	177	28	922	8	73489.28	16167.68
10201	112	49	768	10	99483.90	32829.70
10202	177	12	164	2	5143.02	1131.46
10203	177	4	67	6	41979.36	6716.70
10204	177	17	718	9	77666.31	17863.29
10205	177	1	716	10	27388.30	9585.90
10206	305	44	507	5	36596.85	10247.10
10207	322	15	123	2	4324.88	735.22
10208	177	34	901	3	5038.68	957.36
10209	177	35	27	1	4589.19	1560.32
10210	177	43	179	1	326.78	91.50
10211	177	21	483	3	22147.83	3543.66
10212	177	6	416	1	2080.43	790.56
10213	177	17	477	9	11038.50	3753.09
10214	177	15	175	3	29724.63	5053.20
10215	177	12	381	9	10516.59	3049.83
10216	177	48	549	5	29901.30	8073.35
10217	177	17	303	10	92470.20	31439.90
10218	177	7	623	5	35841.60	7168.30
10219	177	5	309	3	4783.65	956.73
10220	177	23	330	5	35208.95	9154.35
10221	177	7	997	1	4576.42	686.46
10222	177	4	8	3	10063.74	2717.22
10223	177	19	249	1	8166.35	1061.63
10224	541	16	300	4	31607.28	10114.32
10225	177	7	738	1	2316.77	509.69
10226	177	28	264	9	81584.55	11421.81
10227	177	38	227	7	51877.35	17119.55
10228	177	15	600	10	23679.90	7814.40
10229	177	35	203	5	34692.65	11795.50
10230	177	29	249	15	122495.25	15924.45
10231	61	8	355	5	47851.90	6699.25
10232	177	7	515	8	70648.00	20487.92
10233	177	36	525	8	55114.40	19841.20
10234	405	37	860	5	46952.55	14085.75
10235	177	40	585	8	42992.64	4729.20
10236	177	22	643	7	50263.15	11560.50
10237	177	11	22	9	25199.82	2520.00
10238	177	32	692	5	18336.20	2200.35
10239	177	48	905	8	7618.96	1828.56
10240	177	4	827	1	1820.77	309.53
10241	177	13	268	8	55041.52	5504.16
10242	177	28	372	6	48680.64	13630.56
10243	177	11	51	7	38363.99	4987.29
10244	630	11	577	2	15620.16	2655.42
10245	177	4	614	3	29370.84	7049.01
10246	177	26	796	8	53987.36	9177.84
10247	177	33	702	2	17665.26	4946.28
10248	177	36	821	1	7032.46	2391.04
10249	177	47	323	10	20877.30	6263.20
10250	177	21	452	10	23360.60	7008.20
10251	177	4	534	9	80874.72	13748.67
10252	177	29	965	4	26992.08	5938.24
10253	22	47	747	1	138.26	22.12
10254	177	20	22	1	2799.98	280.00
10255	177	27	337	5	34672.80	5200.90
10256	177	7	5	10	87273.60	30545.80
10257	177	6	288	6	5963.64	1908.36
10258	560	6	338	9	27995.31	11198.16
10259	177	17	272	5	14784.15	2809.00
10260	177	18	198	10	75209.10	15793.90
10261	220	3	531	6	36423.36	8377.38
10262	94	8	149	3	19186.59	2877.99
10263	177	14	142	5	22702.65	5902.70
10264	177	39	116	5	11208.95	2241.80
10265	177	5	137	3	19158.96	6130.86
10266	177	21	330	9	63376.11	16477.83
10267	177	38	953	9	68270.58	8192.43
10268	177	50	957	9	46331.19	6486.39
10269	177	28	601	2	7913.08	1899.14
10270	177	26	87	7	41204.80	4944.59
10271	177	31	190	5	28344.25	7936.40
10272	177	37	52	8	37095.68	3709.60
10273	177	13	998	2	14637.00	2781.02
10274	177	48	918	6	17658.48	5120.94
10275	177	5	555	7	17999.17	2879.87
10276	177	36	270	8	2082.96	687.36
10277	177	18	538	3	17647.02	2470.59
10278	177	36	809	7	30152.92	10251.99
10279	177	14	585	9	48366.72	5320.35
10280	177	25	250	3	11216.52	3589.29
10281	177	42	219	7	64046.99	24978.31
10282	177	18	52	3	13910.88	1391.10
10283	177	37	964	1	9486.21	2466.41
10284	177	26	77	9	61809.12	14216.13
10285	177	17	83	10	78628.70	27520.00
10286	177	28	584	9	45132.03	14442.21
10287	177	18	536	1	7070.41	1909.01
10288	177	36	13	5	41235.95	6185.40
10289	177	10	237	1	7831.77	1801.31
10290	177	46	823	9	74857.14	20211.39
10291	177	11	849	8	31040.88	12105.92
10292	177	18	835	5	12271.20	3190.50
10293	177	13	244	2	12287.92	4792.28
10294	177	7	921	2	8820.20	3087.06
10295	696	7	153	7	3581.69	1396.85
10296	46	46	419	3	9530.79	3431.07
10297	177	14	264	6	54389.70	7614.54
10298	177	27	645	7	1370.88	479.78
10299	112	49	121	1	6864.67	755.11
10300	177	39	791	5	13817.35	2487.10
10301	177	49	676	4	1860.40	558.12
10302	177	36	885	8	7480.80	2842.72
10303	177	16	88	7	12254.27	3553.76
10304	177	6	639	3	25959.39	8826.18
10305	177	44	240	20	33020.80	4292.80
10306	177	9	521	5	42347.20	16515.40
10307	615	12	375	6	44032.50	17613.00
10308	3	17	16	5	20029.00	3605.20
10309	177	13	231	6	42717.30	10252.14
10310	177	32	931	11	29559.97	4729.56
10311	177	42	266	5	33032.15	11561.25
10312	177	8	121	9	61782.03	6795.99
10313	312	12	834	2	6709.38	2683.76
10314	177	36	420	7	34577.90	10373.37
10315	177	16	363	3	23326.86	2799.21
10316	177	32	765	3	88.83	19.53
10317	34	30	22	2	5599.96	560.00
10318	177	18	634	4	27698.84	6924.72
10319	177	49	372	8	64907.52	18174.08
10320	177	34	711	8	27096.40	4064.48
10321	177	11	39	10	88653.40	13298.00
10322	182	11	737	3	29324.25	3225.66
10323	177	49	227	4	29644.20	9782.60
10324	177	27	49	9	81741.96	8991.63
10325	177	23	356	9	40128.12	7624.35
10326	177	16	485	10	70442.20	21837.10
10327	177	44	567	7	51344.30	5647.88
10328	177	33	114	2	18970.12	5311.64
10329	177	14	933	9	72493.56	26097.66
10330	177	15	400	4	21477.88	6228.60
10331	325	36	466	7	50577.10	15678.88
10332	277	39	838	4	20511.40	4512.52
10333	177	49	29	10	60257.70	13256.70
10334	177	21	695	9	89594.91	31358.25
10335	177	50	527	4	15001.12	3450.24
10336	177	39	855	9	17836.47	4815.81
10337	62	34	88	5	8753.05	2538.40
10338	432	3	762	5	26808.45	2948.95
10339	177	2	90	14	79167.20	19000.10
10340	177	7	653	3	10520.85	2209.38
10341	177	36	140	6	45311.28	14952.72
10342	177	4	790	10	42344.20	13550.10
10343	177	24	959	7	48297.27	11591.37
10344	177	38	551	10	71137.40	17073.00
10345	177	14	655	10	69170.40	12450.70
10346	177	6	736	9	58520.43	6437.25
10347	819	44	187	2	2998.52	329.84
10348	177	33	37	6	56820.00	5682.00
10349	177	10	103	4	10913.56	2401.00
10350	802	45	649	2	17347.00	6418.38
10351	177	22	342	2	15903.62	4612.04
10352	177	7	47	10	41476.30	16590.50
10353	177	47	733	8	72837.76	16752.72
10354	177	39	975	10	12495.20	1624.40
10355	177	10	746	11	50007.21	18502.66
10356	177	15	780	7	44857.61	9868.67
10357	177	23	457	10	16602.40	5146.70
10358	177	43	829	4	32644.76	9467.00
10359	177	25	93	6	30107.64	9634.44
10360	177	29	363	5	38878.10	4665.35
10361	177	30	180	9	32013.00	12805.20
10362	177	17	784	1	9045.31	3437.22
10363	177	32	371	9	37073.52	9639.09
10364	177	17	931	2	5374.54	859.92
10365	177	24	745	1	8155.53	1386.44
10366	177	49	318	4	14769.60	2953.92
10367	177	21	396	8	21531.04	5167.44
10368	177	25	762	4	21446.76	2359.16
10369	177	11	392	7	45715.95	16457.77
10370	177	38	709	2	14365.68	4166.04
10371	177	39	805	8	22493.44	7647.76
10372	177	38	635	1	2772.68	388.18
10373	177	9	10	2	5652.50	2147.94
10374	177	31	484	8	72368.32	18815.76
10375	177	6	178	9	55666.80	8350.02
10376	177	28	998	10	73185.00	13905.10
10377	177	20	522	4	32859.52	8543.48
10378	177	27	565	2	3717.16	1301.00
10379	177	18	65	3	19630.74	3729.84
10380	693	3	637	4	13675.80	5333.56
10381	177	17	568	8	68431.20	21213.68
10382	177	43	376	17	91570.84	24724.12
10383	177	45	339	8	59887.76	22158.48
10384	177	44	868	15	55267.80	11606.25
10385	177	37	260	11	5384.17	1023.00
10386	177	11	75	8	31904.56	3190.48
10387	177	37	830	2	7398.94	739.90
10388	177	41	774	2	17429.90	3311.68
10389	177	4	896	6	5469.06	1093.80
10390	177	35	337	6	41607.36	6241.08
10391	177	10	370	6	8035.50	1446.42
10392	177	3	763	4	15149.56	4393.36
10393	150	30	742	6	43951.08	14943.36
10394	177	18	851	7	30130.87	4218.34
10395	177	39	954	18	142999.20	50049.72
10396	501	46	394	10	63813.90	13400.90
10397	177	45	257	1	4729.20	662.09
10398	177	20	70	1	2269.28	408.47
10399	734	18	916	4	11235.56	1910.04
10400	177	42	64	6	14785.32	5026.98
10401	177	11	470	10	70389.40	14781.80
10402	177	17	316	7	26515.16	9545.48
10403	177	5	711	6	20322.30	3048.36
10404	177	22	324	3	17740.95	3903.00
10405	177	33	97	2	19313.80	3283.34
10406	177	45	221	9	59263.11	17778.96
10407	177	26	701	9	76479.57	22179.06
10408	177	19	5	4	34909.44	12218.32
10409	601	50	284	6	10236.60	1228.38
10410	177	13	221	5	32923.95	9877.20
10411	521	7	952	8	160.80	30.56
10412	177	23	142	1	4540.53	1180.54
10413	177	3	640	3	16521.78	4791.33
10414	177	49	962	5	36072.40	7214.50
10415	177	8	639	3	25959.39	8826.18
10416	708	25	726	6	26008.74	8582.88
10417	177	37	98	1	970.78	252.40
10418	177	48	674	10	66160.00	23817.60
10419	177	25	107	4	33967.64	10869.64
10420	177	7	274	6	25112.70	4771.44
10421	177	19	319	8	50174.80	19066.40
10422	177	49	191	4	12217.68	2077.00
10423	320	20	448	10	45190.30	10845.70
10424	177	35	279	5	17902.75	4117.65
10425	177	6	456	5	26957.30	2695.75
10426	177	35	674	9	59544.00	21435.84
10427	177	10	248	5	14112.60	3810.40
10428	177	18	752	7	21777.56	6968.85
10429	177	15	722	2	19204.86	5185.32
10430	177	33	152	4	9726.32	1556.20
10431	177	34	584	3	15044.01	4814.07
10432	177	6	18	6	59936.22	10788.54
10433	7	30	219	6	54897.42	21409.98
10434	177	23	628	5	20141.05	4833.85
10435	177	1	41	18	7706.34	2234.88
10436	177	2	873	4	12442.16	2364.00
10437	177	10	124	5	23739.70	7121.90
10438	177	12	122	7	53638.20	17700.62
10439	177	48	893	2	12448.46	3983.50
10440	177	47	258	8	74012.88	28865.04
10441	177	23	482	2	6721.68	1478.76
10442	177	9	556	4	24890.40	4480.28
10443	177	48	571	4	25168.40	2768.52
10444	177	48	227	8	59288.40	19565.20
10445	177	44	925	10	49887.10	7981.90
10446	177	1	837	1	9338.02	2801.41
10447	177	12	947	8	26989.36	4318.32
10448	177	39	733	4	36418.88	8376.36
10449	177	13	164	5	12857.55	2828.65
10450	177	28	349	7	34328.63	9955.33
10451	177	38	974	8	68571.84	23314.40
10452	834	41	255	4	2044.08	776.76
10453	177	35	133	3	12781.17	4345.59
10454	177	43	225	7	39585.14	12271.42
10455	147	34	966	8	33031.28	4294.08
10456	792	3	641	3	18847.92	5842.86
10457	177	29	671	1	2573.98	386.10
10458	177	10	555	7	17999.17	2879.87
10459	177	6	597	3	23481.60	6574.86
10460	177	9	350	9	63295.83	24685.38
10461	177	25	366	2	425.74	42.58
10462	177	11	178	9	55666.80	8350.02
10463	193	20	947	10	33736.70	5397.90
10464	405	37	300	1	7901.82	2528.58
10465	177	46	549	10	59802.60	16146.70
10466	177	23	703	2	12508.28	2751.82
10467	418	4	312	2	19498.74	5849.62
10468	177	38	208	2	15149.16	4999.22
10469	844	12	642	1	4821.25	1591.01
10470	177	40	868	9	33160.68	6963.75
10471	177	11	406	10	32973.00	10551.40
10472	177	16	407	2	8875.20	3106.32
10473	177	37	718	3	25888.77	5954.43
10474	177	28	735	3	26804.16	9381.45
10475	177	6	696	4	27641.68	7739.68
10476	177	40	544	5	44901.85	10776.45
10477	177	22	548	7	41678.70	13337.17
10478	177	25	996	6	48122.58	13955.52
10479	177	9	754	5	168.05	45.35
10480	177	46	93	9	45161.46	14451.66
10481	250	32	309	3	4783.65	956.73
10482	177	40	886	5	6238.10	2370.50
10483	177	3	356	9	40128.12	7624.35
10484	177	21	21	7	3619.70	470.54
10485	744	11	687	8	15313.52	3981.52
10486	177	4	405	9	49458.96	15332.31
10487	177	47	667	2	10706.68	4282.68
10488	177	43	248	10	28225.20	7620.80
10489	177	33	163	4	13480.76	3505.00
10490	177	17	2	8	16080.96	2412.16
10491	177	39	833	1	3970.99	1231.01
10492	177	38	670	6	25948.98	5708.76
10493	177	23	875	3	27604.89	6625.17
10494	177	35	746	2	9092.22	3364.12
10495	177	35	89	10	57792.70	21383.30
10496	177	16	126	1	4260.74	511.29
10497	177	11	870	2	8808.64	3259.20
10498	177	28	12	7	68838.21	11702.53
10499	177	38	797	10	68248.10	15014.60
10500	177	19	577	3	23430.24	3983.13
10501	177	6	489	7	49065.59	11285.12
10502	177	32	165	7	17362.45	4687.83
10503	177	27	774	9	78434.55	14902.56
10504	177	26	860	9	84514.59	25354.35
10505	177	40	393	4	19229.08	6922.48
10506	380	45	377	4	8393.12	2098.28
10507	177	41	263	1	9372.34	1780.74
10508	812	11	439	8	33586.48	4366.24
10509	177	47	728	2	19764.66	5138.82
10510	177	21	730	5	42997.25	4729.70
10511	177	45	554	13	52160.29	17212.91
10512	177	16	732	9	25051.32	2755.62
10513	177	18	635	6	16636.08	2329.08
10514	262	31	511	7	10757.04	3442.25
10515	177	19	578	10	22384.80	2686.20
10516	177	37	615	5	45825.05	13747.50
10517	399	47	350	5	35164.35	13714.10
10518	177	18	877	1	2923.32	496.96
10519	177	14	833	8	31767.92	9848.08
10520	177	22	915	9	22387.68	4701.42
10521	177	45	426	8	35543.20	7108.64
10522	177	1	617	1	5930.52	2253.60
10523	177	34	199	7	42260.26	7606.83
10524	177	27	538	8	47058.72	6588.24
10525	177	50	41	1	428.13	124.16
10526	815	44	648	5	33906.65	9154.80
10527	177	31	60	4	10794.40	1187.40
10528	177	3	556	9	56003.40	10080.63
10529	177	1	776	5	27354.85	7385.80
10530	630	11	936	5	23143.35	7405.85
10531	177	33	757	9	9774.99	1661.76
10532	177	9	378	7	41908.65	14248.92
10533	325	6	612	2	17345.14	4162.84
10534	107	8	766	10	15338.20	4448.10
10535	177	43	66	1	2143.52	835.97
10536	177	37	120	9	71577.45	16462.80
10537	177	20	922	3	27558.48	6062.88
10538	177	30	521	2	16938.88	6606.16
10539	177	11	334	9	78752.79	18900.63
10540	177	39	276	10	96163.00	34618.70
10541	624	34	329	3	26375.07	8176.26
10542	177	25	923	6	19539.00	4884.72
10543	177	36	664	2	2347.08	258.18
10544	177	44	602	4	13439.04	2553.40
10545	177	13	636	5	278.30	44.55
10546	339	18	999	9	6176.43	1729.44
10547	177	18	417	9	47035.62	14581.08
10548	753	29	620	8	30309.60	10911.44
10549	177	44	831	6	2472.54	494.52
10550	144	18	280	9	73203.93	29281.59
10551	177	31	55	3	25938.00	3112.56
10552	177	7	34	1	5381.83	1883.64
10553	177	23	446	5	47913.70	14374.10
10554	657	20	633	6	41303.22	15695.22
10555	663	38	892	3	10346.55	2793.57
10556	177	35	575	6	33356.94	12675.66
10557	529	31	271	5	29878.15	5676.85
10558	177	8	504	4	2866.76	544.68
10559	177	11	549	5	29901.30	8073.35
10560	177	23	557	2	5277.30	1477.64
10561	177	12	884	9	34633.62	9697.41
10562	177	34	600	3	7103.97	2344.32
10563	326	24	87	3	17659.20	2119.11
10564	177	21	104	2	12309.94	4800.88
10565	177	40	227	6	44466.30	14673.90
10566	177	2	339	5	37429.85	13849.05
10567	177	39	283	9	86392.17	15550.56
10568	177	8	728	5	49411.65	12847.05
10569	177	22	399	9	34875.00	8021.25
10570	177	11	375	7	51371.25	20548.50
10571	36	26	533	9	29486.97	11205.09
10572	177	44	743	2	8935.38	2859.32
10573	177	34	882	7	6140.40	1412.32
10574	177	21	792	9	32321.52	9696.42
10575	177	19	16	16	64092.80	11536.64
10576	305	44	918	7	20601.56	5974.43
10577	177	25	912	4	19820.52	2378.48
10578	177	36	724	6	55680.78	15590.64
10579	177	8	748	6	22472.16	3595.56
10580	177	34	252	1	7721.08	926.53
10581	177	4	765	2	59.22	13.02
10582	177	34	985	8	60251.68	6025.20
10583	177	5	827	8	14566.16	2476.24
10584	302	12	10	1	2826.25	1073.97
10585	744	1	587	1	148.65	43.11
10586	177	39	360	2	3334.86	566.92
10587	177	45	318	7	25846.80	5169.36
10588	177	22	204	9	26167.32	8373.51
10589	520	31	281	4	18490.44	4067.88
10590	177	8	51	9	49325.13	6412.23
10591	177	35	694	2	96.96	14.54
10592	34	3	984	4	22638.64	2943.04
10593	177	13	511	10	15367.20	4917.50
10594	177	42	309	4	6378.20	1275.64
10595	177	12	625	2	13462.12	3096.28
10596	177	48	943	6	37401.00	14586.42
10597	177	4	953	15	113784.30	13654.05
10598	177	2	271	10	59756.30	11353.70
10599	177	38	398	10	27664.40	6086.20
10600	177	42	379	5	33993.35	3739.25
10601	177	32	141	9	54627.03	8740.35
10602	302	12	671	6	15443.88	2316.60
10603	29	2	767	4	25816.56	8777.64
10604	177	39	149	10	63955.30	9593.30
10605	350	10	67	9	62969.04	10075.05
10606	177	39	982	3	27314.49	10652.64
10607	177	29	973	9	30924.18	11441.97
10608	177	45	855	4	7927.32	2140.36
10609	177	9	713	6	48196.62	12531.12
10610	667	8	948	4	27561.32	9370.84
10611	177	14	954	9	71499.60	25024.86
10612	177	9	791	19	52505.93	9450.98
10613	598	9	763	6	22724.34	6590.04
10614	177	26	364	8	50111.12	13028.88
10615	177	33	983	3	10461.96	1673.91
10616	325	6	264	10	90649.50	12690.90
10617	177	15	922	9	82675.44	18188.64
10618	177	14	4	1	6871.63	1786.62
10619	177	42	733	3	27314.16	6282.27
10620	177	4	265	4	5339.12	854.24
10621	177	34	836	6	43254.18	9515.94
10622	52	12	91	7	69607.09	16009.63
10623	177	24	705	6	45561.12	8200.98
10624	177	8	697	4	5253.12	1891.12
10625	177	11	300	10	79018.20	25285.80
10626	177	18	781	8	27297.60	3548.72
10627	177	41	536	5	35352.05	9545.05
10628	177	9	484	4	36184.16	9407.88
10629	177	31	279	8	28644.40	6588.24
10630	177	41	439	10	41983.10	5457.80
10631	660	4	699	4	16046.36	4172.04
10632	609	10	432	9	14292.81	3287.34
10633	177	26	460	9	29938.86	8382.87
10634	558	5	40	1	4450.12	979.03
10635	177	7	932	3	9602.34	960.24
10636	177	45	657	10	4267.20	682.80
10637	177	47	505	1	2597.74	545.53
10638	177	32	739	8	60397.12	14495.28
10639	177	17	958	2	17364.76	3125.66
10640	177	32	604	1	2943.59	559.28
10641	177	3	23	2	11345.28	3063.22
10642	177	8	516	4	13823.60	4976.48
10643	177	29	422	8	44011.84	7482.00
10644	29	2	996	2	16040.86	4651.84
10645	177	32	536	6	42422.46	11454.06
10646	177	6	435	6	44065.38	13219.62
10647	808	42	710	8	67173.04	26869.20
10648	6	48	995	1	9624.58	2598.64
10649	177	15	507	10	73193.70	20494.20
10650	177	9	215	3	28891.11	6067.14
10651	177	25	80	5	24048.40	9378.90
10652	177	19	399	4	15500.00	3565.00
10653	177	16	35	3	8842.62	2387.52
10654	177	15	601	4	15826.16	3798.28
10655	177	27	581	8	40371.12	10092.80
10656	177	45	276	8	76930.40	27694.96
10657	177	33	826	1	5901.23	1534.32
10658	177	17	452	5	11680.30	3504.10
10659	177	30	954	8	63555.20	22244.32
10660	177	1	596	4	16988.24	2548.24
10661	177	28	36	3	21595.53	6046.74
10662	177	10	736	7	45515.89	5006.75
10663	177	48	320	9	65595.33	16398.81
10664	177	43	181	2	7455.60	2385.80
10665	177	15	549	4	23921.04	6458.68
10666	177	48	956	10	83381.30	23346.80
10667	177	22	778	6	34249.50	13014.84
10668	177	4	149	4	25582.12	3837.32
10669	177	42	787	7	1064.21	191.59
10670	449	21	459	2	1194.18	417.96
10671	177	50	948	8	55122.64	18741.68
10672	146	31	843	4	36646.64	8062.28
10673	177	40	135	2	10707.08	1606.06
10674	177	5	261	2	4579.34	1648.56
10675	177	5	344	1	1037.67	186.78
10676	293	29	342	10	79518.10	23060.20
10677	258	27	979	10	89093.10	29400.70
10678	177	21	387	6	32409.18	10046.82
10679	325	6	664	5	5867.70	645.45
10680	177	6	472	9	57287.43	5728.77
10681	177	13	969	4	9795.04	1175.40
10682	177	9	576	10	9976.20	3192.40
10683	177	6	223	8	68867.04	6886.72
10684	104	19	43	3	28956.93	4922.67
10685	177	37	587	2	297.30	86.22
10686	177	31	974	1	8571.48	2914.30
10687	177	44	814	9	77078.70	26977.50
10688	177	16	892	6	20693.10	5587.14
10689	663	38	452	2	4672.12	1401.64
10690	177	50	264	3	27194.85	3807.27
10691	177	32	913	9	29439.00	5593.41
10692	177	45	536	3	21211.23	5727.03
10693	177	6	88	9	15755.49	4569.12
10694	177	27	851	9	38739.69	5423.58
10695	177	26	7	3	14082.33	2112.36
10696	177	26	526	5	3684.60	479.00
10697	177	32	866	7	20674.64	2067.45
10698	177	2	754	3	100.83	27.21
10699	177	39	14	8	61459.84	14750.40
10700	177	34	784	5	45226.55	17186.10
10701	832	29	720	3	9464.85	3312.69
10702	177	29	55	3	25938.00	3112.56
10703	177	22	638	7	60769.10	22484.56
10704	177	5	65	10	65435.80	12432.80
10705	177	9	81	4	24457.68	9293.92
10706	851	40	154	1	5763.50	1037.43
10707	177	15	288	9	8945.46	2862.54
10708	704	31	245	5	40049.50	11614.35
10709	177	37	446	10	95827.40	28748.20
10710	177	13	493	3	7496.61	1424.37
10711	177	39	835	2	4908.48	1276.20
10712	177	37	314	2	14210.40	4689.44
10713	177	15	827	10	18207.70	3095.30
10714	177	3	57	3	9592.29	2302.14
10715	177	49	48	8	32009.12	12483.52
10716	326	24	33	9	35590.41	10677.15
10717	595	10	559	6	36860.76	10321.02
10718	177	4	435	1	7344.23	2203.27
10719	177	10	642	9	43391.25	14319.09
10720	177	28	992	10	8104.10	2431.20
10721	177	15	967	8	77097.76	26984.24
10722	177	26	95	10	48017.80	12484.60
10723	177	45	442	6	35754.96	8223.66
10724	177	18	998	7	51229.50	9733.57
10725	177	13	655	8	55336.32	9960.56
10726	177	10	748	8	29962.88	4794.08
10727	177	13	679	7	68435.08	25320.96
10728	177	43	518	7	1735.16	364.35
10729	177	1	189	10	12219.80	2444.00
10730	177	45	184	3	5363.28	2091.69
10731	177	50	343	2	19204.14	2880.62
10732	731	1	765	5	148.05	32.55
10733	177	32	225	4	22620.08	7012.24
10734	177	14	481	7	69513.64	13902.70
10735	177	23	393	8	38458.16	13844.96
10736	177	15	394	3	19144.17	4020.27
10737	177	7	625	10	67310.60	15481.40
10738	720	36	109	7	27009.43	7292.53
10739	177	21	764	7	53050.83	11671.17
10740	441	8	195	5	49656.50	5462.20
10741	264	22	152	7	17021.06	2723.35
10742	177	7	146	8	26169.92	3140.40
10743	177	49	990	9	67441.59	14162.76
10744	704	31	132	2	6096.86	2011.96
10745	177	43	936	17	78687.39	25179.89
10746	177	4	176	5	24430.80	8306.45
10747	177	11	50	10	19780.90	5143.00
10748	177	34	419	3	9530.79	3431.07
10749	177	7	159	9	38104.20	10669.14
10750	177	45	202	5	43930.75	7468.25
10751	177	17	794	4	18880.56	2454.48
10752	177	35	737	10	97747.50	10752.20
10753	177	39	12	6	59004.18	10030.74
10754	438	22	462	6	31136.94	10586.58
10755	177	9	551	8	56909.92	13658.40
10756	177	22	863	14	44678.20	16977.66
10757	177	43	600	9	21311.91	7032.96
10758	124	10	141	9	54627.03	8740.35
10759	177	45	67	9	62969.04	10075.05
10760	177	6	30	9	58896.36	8834.49
10761	177	36	406	6	19783.80	6330.84
10762	177	2	337	4	27738.24	4160.72
10763	177	24	146	1	3271.24	392.55
10764	177	6	998	4	29274.00	5562.04
10765	177	27	949	8	54000.96	17820.32
10766	177	13	355	5	47851.90	6699.25
10767	177	19	534	4	35944.32	6110.52
10768	538	9	415	9	58729.59	7047.54
10769	693	3	712	1	4087.96	776.71
10770	177	10	180	10	35570.00	14228.00
10771	177	48	642	8	38570.00	12728.08
10772	177	28	449	8	69552.96	10432.96
10773	199	49	833	8	31767.92	9848.08
10774	177	25	491	6	41994.36	6299.16
10775	177	18	122	10	76626.00	25286.60
10776	193	20	368	9	38313.45	11877.21
10777	177	47	809	4	17230.24	5858.28
10778	177	47	23	8	45381.12	12252.88
10779	177	5	677	6	13595.04	5166.12
10780	177	9	427	8	15158.16	2728.48
10781	26	47	93	5	25089.70	8028.70
10782	177	2	843	2	18323.32	4031.14
10783	177	22	117	9	32552.19	13020.84
10784	277	39	795	4	26688.40	8807.16
10785	607	5	34	1	5381.83	1883.64
10786	177	35	999	4	2745.08	768.64
10787	757	25	5	4	34909.44	12218.32
10788	177	40	755	9	76311.63	14499.18
10789	177	47	922	3	27558.48	6062.88
10790	177	23	937	2	971.98	126.36
10791	177	32	721	9	89705.16	21529.26
10792	177	38	504	9	6450.21	1225.53
10793	177	46	588	8	13309.04	3460.32
10794	523	37	9	10	73297.60	22722.30
10795	177	30	173	10	64124.30	23084.70
10796	744	1	33	7	27681.43	8304.45
10797	731	19	835	9	22088.16	5742.90
10798	177	15	117	6	21701.46	8680.56
10799	177	18	247	5	31340.00	4387.60
10800	177	6	610	3	26219.07	3146.28
10801	177	14	623	3	21504.96	4300.98
10802	281	37	287	3	8717.70	3225.54
10803	177	3	634	9	62322.39	15580.62
10804	177	4	246	5	6235.10	1621.15
10805	177	45	292	2	15829.92	4590.68
10806	50	45	935	1	3063.28	490.12
10807	177	21	959	3	20698.83	4967.73
10808	177	46	79	10	90624.30	17218.60
10809	177	46	606	7	64608.04	24551.03
10810	229	36	688	6	53491.68	6418.98
10811	177	8	776	10	54709.70	14771.60
10812	177	3	470	8	56311.52	11825.44
10813	177	35	701	5	42488.65	12321.70
10814	177	22	796	6	40490.52	6883.38
10815	177	39	67	4	27986.24	4477.80
10816	844	12	983	1	3487.32	557.97
10817	177	2	304	5	41801.45	6688.25
10818	177	43	113	1	1176.48	282.36
10819	64	30	527	9	33752.52	7763.04
10820	177	29	213	1	1059.40	127.13
10821	177	50	198	9	67688.19	14214.51
10822	177	38	561	9	17818.02	4454.46
10823	177	13	353	10	21886.60	6128.20
10824	177	47	90	9	50893.20	12214.35
10825	177	33	964	3	28458.63	7399.23
10826	177	36	568	7	59877.30	18561.97
10827	177	48	973	5	17180.10	6356.65
10828	177	24	345	2	19847.20	5755.68
10829	177	9	173	7	44887.01	16159.29
10830	177	4	360	6	10004.58	1700.76
10831	546	5	17	2	3804.52	418.50
10832	177	33	10	10	28262.50	10739.70
10833	177	18	165	5	12401.75	3348.45
10834	177	20	856	5	8346.75	2003.20
10835	177	22	198	7	52646.37	11055.73
10836	797	3	843	6	54969.96	12093.42
10837	636	24	284	5	8530.50	1023.65
10838	177	1	803	9	50762.61	7106.76
10839	177	14	213	4	4237.60	508.52
10840	177	15	349	7	34328.63	9955.33
10841	177	49	980	13	98447.96	19689.54
10842	177	27	970	6	1308.96	392.70
10843	177	43	99	5	23623.30	9449.30
10844	177	26	322	10	77598.80	30263.50
10845	177	42	806	3	15099.39	5133.78
10846	177	2	320	5	36441.85	9110.45
10847	177	10	87	5	29432.00	3531.85
10848	177	31	722	2	19204.86	5185.32
10849	177	31	661	2	2705.40	919.84
10850	177	2	549	10	59802.60	16146.70
10851	177	9	888	10	57577.90	15546.00
10852	104	19	772	1	4915.51	1376.34
10853	177	18	306	2	14441.62	5632.24
10854	177	49	450	1	8406.13	2185.59
10855	177	4	676	6	2790.60	837.18
10856	792	3	574	7	59266.55	14816.62
10857	177	50	499	4	29575.84	7985.48
10858	177	15	789	4	37923.64	9101.68
10859	177	22	477	8	9812.00	3336.08
10860	177	7	265	6	8008.68	1281.36
10861	177	17	500	5	28914.90	5783.00
10862	177	14	253	2	1694.22	406.62
10863	177	9	910	7	20019.44	4003.86
10864	177	42	264	8	72519.60	10152.72
10865	834	41	611	9	62285.85	21800.07
10866	177	4	834	6	20128.14	8051.28
10867	177	40	252	5	38605.40	4632.65
10868	177	26	56	4	30867.52	12347.00
10869	177	32	558	7	69632.64	23675.12
10870	177	1	934	7	575.82	80.64
10871	177	10	937	9	4373.91	568.62
10872	177	43	190	8	45350.80	12698.24
10873	508	10	17	6	11413.56	1255.50
10874	177	41	374	6	9935.52	2086.44
10875	290	48	291	8	19224.88	6728.72
10876	177	2	380	7	18356.66	4222.05
10877	177	30	340	3	23258.07	6512.25
10878	177	38	874	2	5719.66	1029.54
10879	177	20	362	18	169586.10	50875.74
10880	177	23	483	5	36913.05	5906.10
10881	177	14	211	5	8703.75	2959.30
10882	270	46	999	8	5490.16	1537.28
10883	856	18	899	7	42885.64	11150.30
10884	177	11	648	2	13562.66	3661.92
10885	177	41	215	2	19260.74	4044.76
10886	177	4	849	3	11640.33	4539.72
10887	177	23	251	4	22793.32	7065.92
10888	177	38	977	4	34051.36	7491.28
10889	306	3	100	4	22931.88	4815.68
10890	177	6	620	4	15154.80	5455.72
10891	177	31	791	9	24871.23	4476.78
10892	177	28	544	9	80823.33	19397.61
10893	177	40	60	10	26986.00	2968.50
10894	177	22	973	8	27488.16	10170.64
10895	177	4	295	2	9215.12	1566.58
10896	177	45	655	3	20751.12	3735.21
10897	177	42	976	3	314.22	87.99
10898	487	5	501	7	58396.94	20438.95
10899	177	4	243	2	2099.80	608.94
10900	814	21	151	1	3649.63	693.43
10901	553	13	875	3	27604.89	6625.17
10902	177	15	8	11	36900.38	9963.14
10903	177	15	744	7	6011.25	1382.57
10904	177	1	412	9	72062.91	8647.56
10905	177	22	940	3	19161.69	2491.02
10906	177	24	798	8	56777.84	21575.60
10907	177	15	46	6	59521.98	13094.82
10908	748	39	724	2	18560.26	5196.88
10909	177	13	810	3	12547.68	4768.11
10910	177	4	71	8	30658.08	6438.16
10911	177	45	44	10	64145.20	13470.50
10912	257	8	373	3	24477.48	2937.30
10913	177	49	910	1	2859.92	571.98
10914	177	26	980	4	30291.68	6058.32
10915	177	48	94	5	43697.15	13109.15
10916	138	42	494	5	14569.35	2476.80
10917	177	23	515	10	88310.00	25609.90
10918	177	36	226	1	4475.23	581.78
10919	177	2	541	4	31083.20	12122.44
10920	177	43	383	4	31390.72	6592.04
10921	177	21	557	9	23747.85	6649.38
10922	26	47	876	5	6115.85	2385.20
10923	177	6	360	8	13339.44	2267.68
10924	380	45	944	6	26949.72	7276.44
10925	177	33	64	7	17249.54	5864.81
10926	177	38	722	6	57614.58	15555.96
10927	177	40	787	12	1824.36	328.44
10928	177	35	777	1	9760.30	2147.27
10929	177	50	579	4	21720.88	7819.52
10930	177	31	866	16	47256.32	4725.60
10931	294	20	782	8	11357.20	1476.40
10932	177	38	576	5	4988.10	1596.20
10933	177	16	151	6	21897.78	4160.58
10934	852	35	545	4	2307.48	830.68
10935	575	36	596	3	12741.18	1911.18
10936	177	27	997	10	45764.20	6864.60
10937	177	29	356	1	4458.68	847.15
10938	177	26	485	1	7044.22	2183.71
10939	177	7	671	1	2573.98	386.10
10940	177	40	112	4	10447.00	1044.68
10941	177	16	769	7	66428.11	11957.05
10942	177	46	916	7	19662.23	3342.57
10943	177	20	713	5	40163.85	10442.60
10944	177	35	286	7	32928.28	9549.19
10945	177	10	101	7	59475.15	16058.28
10946	177	21	375	10	73387.50	29355.00
10947	177	1	955	8	8176.40	2943.52
10948	177	48	601	11	43521.94	10445.27
10949	177	42	105	1	3531.27	1094.69
10950	177	9	875	9	82814.67	19875.51
10951	177	15	882	3	2631.60	605.28
10952	753	8	12	10	98340.30	16717.90
10953	177	28	283	8	76793.04	13822.72
10954	177	4	737	3	29324.25	3225.66
10955	139	17	845	5	44409.10	9325.90
10956	177	34	879	3	14710.05	3677.52
10957	177	29	910	10	28599.20	5719.80
10958	177	22	947	9	30363.03	4858.11
10959	177	50	757	10	10861.10	1846.40
10960	177	4	75	1	3988.07	398.81
10961	177	47	877	5	14616.60	2484.80
10962	177	9	617	9	53374.68	20282.40
10963	177	3	138	2	8796.06	967.56
10964	17	40	661	6	8116.20	2759.52
10965	177	33	838	8	41022.80	9025.04
10966	177	15	262	8	60486.08	18145.84
10967	177	42	231	7	49836.85	11960.83
10968	177	24	492	7	14362.95	3303.51
10969	177	9	438	5	33511.10	7707.55
10970	177	16	120	6	47718.30	10975.20
10971	177	22	912	3	14865.39	1783.86
10972	177	46	978	5	12747.00	2421.95
10973	30	17	80	8	38477.44	15006.24
10974	177	16	105	4	14125.08	4378.76
10975	177	37	701	2	16995.46	4928.68
10976	177	18	418	6	9272.76	1576.38
10977	177	37	313	3	28083.99	10391.07
10978	177	7	20	4	10774.36	2154.88
10979	177	29	67	11	76962.16	12313.95
10980	819	44	236	1	5569.83	1559.55
10981	565	45	214	9	4932.18	937.08
10982	177	5	908	3	17874.51	6613.56
10983	177	48	671	9	23165.82	3474.90
10984	177	36	512	9	8239.23	823.95
10985	177	30	399	4	15500.00	3565.00
10986	177	50	962	5	36072.40	7214.50
10987	177	19	654	4	33255.08	8646.32
10988	177	43	797	1	6824.81	1501.46
10989	177	17	425	8	22446.48	3815.92
10990	177	28	374	8	13247.36	2781.92
10991	177	42	218	3	22882.65	2745.93
10992	177	23	461	7	48997.69	5389.72
10993	177	41	391	8	4535.20	770.96
10994	250	32	210	2	10681.26	3204.38
10995	177	18	554	2	8024.66	2648.14
10996	177	14	594	6	43612.44	14392.08
10997	177	22	382	5	10846.50	1843.90
10998	177	21	434	1	8431.11	1601.91
10999	177	6	795	10	66721.00	22017.90
11000	177	6	314	6	42631.20	14068.32
11001	177	20	261	7	16027.69	5769.96
11002	177	37	56	1	7716.88	3086.75
11003	177	22	339	8	59887.76	22158.48
11004	177	49	386	8	60898.96	20705.68
11005	177	20	774	4	34859.80	6623.36
11006	710	28	514	8	3979.92	517.36
11007	177	22	951	7	19907.09	5972.12
11008	177	29	180	5	17785.00	7114.00
11009	177	12	719	6	21331.50	5119.56
11010	177	33	726	4	17339.16	5721.92
11011	538	9	768	5	49741.95	16414.85
11012	177	16	125	7	24671.57	8881.74
11013	177	37	929	8	12514.16	3504.00
11014	177	4	852	4	30895.40	7105.96
11015	177	12	724	7	64960.91	18189.08
11016	177	30	779	6	41816.22	12963.00
11017	177	40	268	3	20640.57	2064.06
11018	177	14	281	2	9245.22	2033.94
11019	177	29	431	9	18808.83	4514.13
11020	177	46	503	10	37317.60	8583.00
11021	177	45	851	3	12913.23	1807.86
11022	177	33	796	4	26993.68	4588.92
11023	177	20	627	5	29327.10	4399.05
11024	177	35	307	6	23306.88	9089.70
11025	146	31	336	3	12576.18	1634.91
11026	177	15	982	8	72838.64	28407.04
11027	192	35	821	3	21097.38	7173.12
11028	290	48	597	4	31308.80	8766.48
11029	177	18	906	5	39517.80	11855.35
11030	177	28	518	3	743.64	156.15
11031	177	20	834	6	20128.14	8051.28
11032	177	46	348	1	669.80	261.22
11033	605	20	278	8	65682.56	19704.80
11034	177	38	677	3	6797.52	2583.06
11035	177	7	575	3	16678.47	6337.83
11036	177	33	482	1	3360.84	739.38
11037	177	4	526	5	3684.60	479.00
11038	177	42	167	7	52262.77	6271.51
11039	177	44	679	7	68435.08	25320.96
11040	177	18	961	4	35507.60	7456.60
11041	639	46	933	1	8054.84	2899.74
11042	177	6	926	6	31821.36	8910.00
11043	177	26	373	4	32636.64	3916.40
11044	807	20	903	1	7767.90	2408.05
11045	264	22	357	4	37626.08	11664.08
11046	293	29	583	7	36780.17	8827.21
11047	177	7	399	1	3875.00	891.25
11048	311	16	536	2	14140.82	3818.02
11049	177	33	283	1	9599.13	1727.84
11050	177	1	161	7	53260.76	18641.28
11051	177	14	536	1	7070.41	1909.01
11052	177	13	892	8	27590.80	7449.52
11053	177	39	49	3	27247.32	2997.21
11054	177	31	991	6	19489.92	3118.38
11055	1	6	183	7	3034.50	788.97
11056	177	10	958	3	26047.14	4688.49
11057	254	37	716	1	2738.83	958.59
11058	177	49	863	4	12765.20	4850.76
11059	177	35	42	8	42092.64	13890.56
11060	177	28	384	5	49179.50	5409.75
11061	177	7	841	2	15236.46	5180.40
11062	177	39	443	3	8109.99	1946.40
11063	177	40	603	5	13081.95	3924.60
11064	380	45	592	9	88361.91	16788.78
11065	177	11	260	5	2447.35	465.00
11066	177	35	18	3	29968.11	5394.27
11067	177	15	20	6	16161.54	3232.32
11068	194	49	339	3	22457.91	8309.43
11069	177	46	151	2	7299.26	1386.86
11070	177	38	114	6	56910.36	15934.92
11071	325	36	674	9	59544.00	21435.84
11072	177	42	925	9	44898.39	7183.71
11073	177	21	159	10	42338.00	11854.60
11074	177	9	428	3	13656.45	4779.75
11075	452	14	452	7	16352.42	4905.74
11076	177	46	921	1	4410.10	1543.53
11077	177	8	696	4	27641.68	7739.68
11078	177	47	549	7	41861.82	11302.69
11079	177	41	384	8	78687.20	8655.60
11080	529	39	652	9	38173.32	15269.31
11081	177	6	107	1	8491.91	2717.41
11082	177	38	730	5	42997.25	4729.70
11083	34	30	929	6	9385.62	2628.00
11084	177	32	136	8	43359.44	9972.64
11085	17	40	533	9	29486.97	11205.09
11086	177	33	111	5	46535.75	8841.80
11087	177	39	123	7	15137.08	2573.27
11088	177	3	429	10	47530.20	10456.60
11089	177	39	544	1	8980.37	2155.29
11090	177	34	779	7	48785.59	15123.50
11091	177	44	406	7	23081.10	7385.98
11092	177	7	869	10	94364.90	32084.10
11093	177	6	728	5	49411.65	12847.05
11094	433	30	73	7	16487.73	1978.55
11095	177	17	375	2	14677.50	5871.00
11096	177	27	387	3	16204.59	5023.41
11097	808	42	130	6	49396.98	7409.52
11098	177	6	651	9	61040.61	18312.21
11099	177	50	322	4	31039.52	12105.40
11100	50	45	518	4	991.52	208.20
11101	753	29	947	6	20242.02	3238.74
11102	641	14	21	1	517.10	67.22
11103	177	45	972	5	12209.75	4151.30
11104	177	22	776	9	49238.73	13294.44
11105	177	11	90	3	16964.40	4071.45
11106	425	1	102	1	4849.79	775.97
11107	177	29	529	2	7179.54	2441.04
11108	177	17	934	9	740.34	103.68
11109	177	11	750	3	1102.17	352.68
11110	99	43	712	7	28615.72	5436.97
11111	177	7	107	10	84919.10	27174.10
11112	177	10	235	7	40002.55	8800.54
11113	177	45	931	4	10749.08	1719.84
11114	177	2	70	27	61270.56	11028.69
11115	177	41	217	6	28161.78	9574.98
11116	177	29	990	7	52454.57	11015.48
11117	177	2	589	7	38504.06	15401.61
11118	177	36	306	2	14441.62	5632.24
11119	177	36	317	4	15972.96	6069.72
11120	177	49	954	6	47666.40	16683.24
11121	177	36	543	1	3993.48	1118.17
11122	177	50	598	7	15432.27	4012.40
11123	177	4	609	7	63651.63	7638.19
11124	294	20	934	10	822.60	115.20
11125	177	6	513	6	42151.50	10959.42
11126	177	32	701	2	16995.46	4928.68
11127	177	19	145	9	67826.79	24417.63
11128	177	47	120	6	47718.30	10975.20
11129	177	8	80	8	38477.44	15006.24
11130	177	24	200	10	78893.20	18145.40
11131	177	13	563	1	7765.54	1009.52
11132	177	4	692	4	14668.96	1760.28
11133	177	17	579	5	27151.10	9774.40
11134	139	17	350	5	35164.35	13714.10
11135	177	1	870	1	4404.32	1629.60
11136	177	27	215	4	38521.48	8089.52
11137	177	15	730	10	85994.50	9459.40
11138	177	33	794	1	4720.14	613.62
11139	177	15	495	9	50927.22	15787.44
11140	177	43	787	4	608.12	109.48
11141	177	10	202	8	70289.20	11949.20
11142	177	43	649	2	17347.00	6418.38
11143	177	49	506	7	3845.87	1384.53
11144	34	30	118	8	18692.32	5046.96
11145	177	45	993	3	21604.32	5401.08
11146	177	14	458	5	35258.65	10225.00
11147	177	25	570	5	10618.10	3610.15
11148	177	14	567	6	44009.40	4841.04
11149	177	32	349	6	29424.54	8533.14
11150	177	18	435	7	51409.61	15422.89
11151	177	50	656	6	6329.28	696.24
11152	177	14	317	9	35939.16	13656.87
11153	177	22	14	1	7682.48	1843.80
11154	177	31	409	11	68652.65	9611.36
11155	177	44	540	7	38367.14	3836.70
11156	177	1	960	8	6458.40	904.16
\.


--
-- Data for Name: fact_sales_order; Type: TABLE DATA; Schema: public; Owner: thangquang
--

COPY public.fact_sales_order (id, date_id, source_online_id, customer_id, employee_id, store_id, revenue, revenue_online, revenue_offline, standard_cost, profit, number_order, number_order_online, number_order_offline) FROM stdin;
1	750	1000	924	224	24	53496.20	0.00	53496.20	37982.30	15513.90	1	0	1
2	222	1000	279	205	49	71657.89	0.00	71657.89	50979.37	20678.52	1	0	1
3	349	1000	15	111	27	149516.58	0.00	149516.58	108291.27	41225.31	1	0	1
4	273	1000	559	86	28	26745.84	0.00	26745.84	23536.35	3209.49	1	0	1
5	696	1	328	230	13	69965.60	69965.60	0.00	58771.10	11194.50	1	1	0
6	242	1000	468	37	24	60913.90	0.00	60913.90	43494.44	17419.46	1	0	1
7	215	4	586	69	16	116654.35	116654.35	0.00	88343.21	28311.14	1	1	0
8	416	1000	232	188	39	234077.29	0.00	234077.29	169455.38	64621.91	1	0	1
9	239	2	892	222	27	52441.13	52441.13	0.00	44019.03	8422.10	1	1	0
10	658	3	496	172	41	166222.11	166222.11	0.00	113889.86	52332.25	1	1	0
11	143	1000	716	143	49	232425.86	0.00	232425.86	158957.62	73468.24	1	0	1
12	344	4	852	212	30	131798.90	131798.90	0.00	97684.30	34114.60	1	1	0
13	395	3	437	66	24	130729.57	130729.57	0.00	109660.26	21069.31	1	1	0
14	50	3	151	115	45	108064.69	108064.69	0.00	83444.13	24620.56	1	1	0
15	832	4	660	2	29	9464.85	9464.85	0.00	6152.16	3312.69	1	1	0
16	92	4	467	245	27	63555.37	63555.37	0.00	42653.23	20902.14	1	1	0
17	39	1000	607	49	2	99967.67	0.00	99967.67	65703.04	34264.63	1	0	1
18	265	1000	437	148	49	88818.20	0.00	88818.20	70166.40	18651.80	1	0	1
19	529	4	789	73	46	77790.65	77790.65	0.00	54799.67	22990.98	1	1	0
20	846	1000	187	13	13	109070.95	0.00	109070.95	80248.41	28822.54	1	0	1
21	402	4	271	4	10	56826.16	56826.16	0.00	43441.67	13384.49	1	1	0
22	280	4	734	230	17	22993.56	22993.56	0.00	18164.94	4828.62	1	1	0
23	613	3	905	228	27	53670.69	53670.69	0.00	41373.61	12297.08	1	1	0
24	340	3	17	150	29	96587.18	96587.18	0.00	74341.85	22245.33	1	1	0
25	149	1000	302	47	10	80506.43	0.00	80506.43	71105.90	9400.53	1	0	1
26	479	3	885	31	40	95200.21	95200.21	0.00	76814.31	18385.90	1	1	0
27	850	1000	877	216	23	23547.51	0.00	23547.51	16483.23	7064.28	1	0	1
28	760	1	456	17	29	31136.94	31136.94	0.00	20550.36	10586.58	1	1	0
29	822	1000	784	28	11	159025.64	0.00	159025.64	111005.86	48019.78	1	0	1
30	177	2	1102	3	11	95262.34	95262.34	0.00	67564.13	27698.21	1	1	0
31	715	1	850	253	29	7066.17	7066.17	0.00	6218.22	847.95	1	1	0
32	869	2	600	53	17	20540.14	20540.14	0.00	16759.64	3780.50	1	1	0
33	364	1000	150	229	33	5954.10	0.00	5954.10	4048.79	1905.31	1	0	1
34	213	1000	419	219	35	3139.45	0.00	3139.45	2260.40	879.05	1	0	1
35	624	4	340	139	34	108050.55	108050.55	0.00	82385.39	25665.16	1	1	0
36	396	4	606	172	13	38921.08	38921.08	0.00	28670.77	10250.31	1	1	0
37	593	1	578	224	50	40950.28	40950.28	0.00	26399.72	14550.56	1	1	0
38	280	1000	543	25	49	113836.20	0.00	113836.20	89712.98	24123.22	1	0	1
39	316	1000	96	105	12	33042.39	0.00	33042.39	27159.66	5882.73	1	0	1
40	178	1000	371	107	39	185460.92	0.00	185460.92	143553.49	41907.43	1	0	1
41	177	1	670	50	23	28280.10	28280.10	0.00	23755.30	4524.80	1	1	0
42	12	1000	946	96	17	6128.33	0.00	6128.33	4780.10	1348.23	1	0	1
43	91	4	449	42	24	152767.90	152767.90	0.00	108616.70	44151.20	1	1	0
44	609	2	404	179	38	157838.39	157838.39	0.00	129856.44	27981.95	1	1	0
45	734	4	684	93	34	23130.24	23130.24	0.00	15264.38	7865.86	1	1	0
46	534	2	362	116	48	149124.00	149124.00	0.00	101351.40	47772.60	1	1	0
47	438	4	46	138	42	109310.95	109310.95	0.00	80070.85	29240.10	1	1	0
48	82	1	48	16	10	70176.42	70176.42	0.00	52199.20	17977.22	1	1	0
49	406	1000	838	179	21	94651.50	0.00	94651.50	76120.97	18530.53	1	0	1
50	325	1	694	171	28	44748.48	44748.48	0.00	36301.28	8447.20	1	1	0
51	607	4	498	226	5	80707.92	80707.92	0.00	50093.89	30614.03	1	1	0
52	229	1000	417	197	24	30598.30	0.00	30598.30	26970.75	3627.55	1	0	1
53	499	1000	424	11	14	10772.82	0.00	10772.82	7110.09	3662.73	1	0	1
54	277	1000	990	9	29	194331.49	0.00	194331.49	164077.29	30254.20	1	0	1
55	516	4	307	156	31	103363.01	103363.01	0.00	79190.58	24172.43	1	1	0
56	331	1000	395	171	22	118045.78	0.00	118045.78	78399.20	39646.58	1	0	1
57	458	1000	393	98	1	62230.98	0.00	62230.98	41084.14	21146.84	1	0	1
58	767	1	835	241	27	11735.40	11735.40	0.00	10444.50	1290.90	1	1	0
59	521	2	731	9	7	160.80	160.80	0.00	130.24	30.56	1	1	0
60	797	1000	76	112	27	94428.65	0.00	94428.65	78011.21	16417.44	1	0	1
61	757	1000	609	19	36	8850.22	0.00	8850.22	5575.64	3274.58	1	0	1
62	792	1000	752	157	3	160770.28	0.00	160770.28	126681.53	34088.75	1	0	1
63	411	1000	738	158	18	17158.98	0.00	17158.98	14070.36	3088.62	1	0	1
64	737	1000	755	97	44	109633.05	0.00	109633.05	90515.12	19117.93	1	0	1
65	520	2	166	80	10	129688.06	129688.06	0.00	94833.70	34854.36	1	1	0
66	850	1	800	242	44	84731.10	84731.10	0.00	57471.88	27259.22	1	1	0
67	177	1000	319	250	45	138203.14	0.00	138203.14	107127.68	31075.46	1	0	1
68	573	1	985	90	24	84157.83	84157.83	0.00	69850.98	14306.85	1	1	0
69	177	1000	430	8	39	140692.54	0.00	140692.54	96498.43	44194.11	1	0	1
70	177	3	768	46	18	27955.14	27955.14	0.00	21881.19	6073.95	1	1	0
71	305	3	526	169	48	139902.49	139902.49	0.00	97706.36	42196.13	1	1	0
72	835	1000	848	88	19	110875.87	0.00	110875.87	73275.01	37600.86	1	0	1
73	768	2	64	160	44	57694.28	57694.28	0.00	42623.67	15070.61	1	1	0
74	468	1000	110	145	19	1308.96	0.00	1308.96	916.26	392.70	1	0	1
75	855	1000	500	30	29	3529.44	0.00	3529.44	2682.36	847.08	1	0	1
76	237	3	387	116	13	91963.07	91963.07	0.00	72279.31	19683.76	1	1	0
77	354	1000	601	83	49	21326.05	0.00	21326.05	15042.44	6283.61	1	0	1
78	285	1000	960	152	10	65521.04	0.00	65521.04	44530.69	20990.35	1	0	1
79	401	1000	501	23	12	39829.50	0.00	39829.50	25889.22	13940.28	1	0	1
80	871	1000	724	197	9	2517.78	0.00	2517.78	1661.73	856.05	1	0	1
81	323	1	854	80	26	69191.68	69191.68	0.00	50047.46	19144.22	1	1	0
82	447	4	916	29	33	122785.02	122785.02	0.00	90199.14	32585.88	1	1	0
83	209	3	208	157	32	26008.74	26008.74	0.00	17425.86	8582.88	1	1	0
84	665	2	610	142	23	254986.44	254986.44	0.00	203364.01	51622.43	1	1	0
85	298	1	172	37	34	13059.88	13059.88	0.00	10984.12	2075.76	1	1	0
86	42	4	500	4	25	27661.46	27661.46	0.00	17247.93	10413.53	1	1	0
87	425	2	10	240	1	97750.43	97750.43	0.00	75890.10	21860.33	1	1	0
88	844	1000	396	188	42	197360.70	0.00	197360.70	156965.64	40395.06	1	0	1
89	556	1000	608	165	42	147757.83	0.00	147757.83	117841.71	29916.12	1	0	1
90	21	1000	601	206	47	40371.12	0.00	40371.12	30278.32	10092.80	1	0	1
91	535	2	898	241	20	13729.34	13729.34	0.00	12219.12	1510.22	1	1	0
92	311	3	807	200	49	161417.68	161417.68	0.00	117503.32	43914.36	1	1	0
93	734	1000	51	49	34	124008.27	0.00	124008.27	88206.15	35802.12	1	0	1
94	621	3	176	230	39	170630.93	170630.93	0.00	134253.93	36377.00	1	1	0
95	458	4	298	1	39	46583.92	46583.92	0.00	36335.44	10248.48	1	1	0
96	790	1000	111	16	47	93921.39	0.00	93921.39	66326.00	27595.39	1	0	1
97	240	1000	727	163	1	181904.52	0.00	181904.52	126208.65	55695.87	1	0	1
98	732	1000	487	150	22	68022.05	0.00	68022.05	45966.29	22055.76	1	0	1
99	694	1000	406	56	34	88959.99	0.00	88959.99	70833.13	18126.86	1	0	1
100	177	1000	602	65	5	92261.84	0.00	92261.84	62245.71	30016.13	1	0	1
101	392	1000	175	173	5	126410.40	0.00	126410.40	92628.63	33781.77	1	0	1
102	307	2	38	203	19	60378.07	60378.07	0.00	39843.54	20534.53	1	1	0
103	752	1	186	43	11	172566.24	172566.24	0.00	139791.16	32775.08	1	1	0
104	574	1000	924	177	23	98678.79	0.00	98678.79	66694.35	31984.44	1	0	1
105	285	2	285	179	34	181107.00	181107.00	0.00	130358.77	50748.23	1	1	0
106	800	4	800	29	44	143848.65	143848.65	0.00	118610.46	25238.19	1	1	0
107	493	1000	98	113	5	51960.36	0.00	51960.36	42929.27	9031.09	1	0	1
108	643	1	494	122	46	25794.04	25794.04	0.00	18332.72	7461.32	1	1	0
109	380	1000	332	67	45	123704.75	0.00	123704.75	97541.25	26163.50	1	0	1
110	820	1	931	195	8	23951.33	23951.33	0.00	19390.67	4560.66	1	1	0
111	636	1000	562	181	24	83126.88	0.00	83126.88	70614.18	12512.70	1	0	1
112	729	1	296	37	18	54508.16	54508.16	0.00	43146.26	11361.90	1	1	0
113	554	1000	546	102	21	25189.89	0.00	25189.89	15113.94	10075.95	1	0	1
114	639	4	600	16	22	83280.12	83280.12	0.00	57622.92	25657.20	1	1	0
115	281	1000	403	179	47	48960.92	0.00	48960.92	32342.28	16618.64	1	0	1
116	81	1	286	162	13	126814.02	126814.02	0.00	94954.33	31859.69	1	1	0
117	64	3	377	74	29	26502.05	26502.05	0.00	21201.65	5300.40	1	1	0
118	44	1000	559	245	15	7666.66	0.00	7666.66	6194.39	1472.27	1	0	1
119	385	1000	941	39	38	37718.07	0.00	37718.07	24519.33	13198.74	1	0	1
120	281	3	932	188	37	102472.41	102472.41	0.00	80053.20	22419.21	1	1	0
121	823	1	888	236	4	76514.06	76514.06	0.00	61117.31	15396.75	1	1	0
122	177	3	579	10	26	123746.04	123746.04	0.00	81850.82	41895.22	1	1	0
123	846	3	459	145	26	77021.04	77021.04	0.00	55349.96	21671.08	1	1	0
124	734	3	969	148	48	148407.82	148407.82	0.00	109686.18	38721.64	1	1	0
125	17	1000	694	213	6	161756.40	0.00	161756.40	124135.51	37620.89	1	0	1
126	532	1000	910	49	24	133426.94	0.00	133426.94	89445.08	43981.86	1	0	1
127	487	3	126	153	44	129667.44	129667.44	0.00	83455.46	46211.98	1	1	0
128	480	1000	355	163	49	48997.69	0.00	48997.69	43607.97	5389.72	1	0	1
129	177	1000	1003	77	46	83615.67	0.00	83615.67	56978.24	26637.43	1	0	1
130	131	1000	510	49	32	35498.97	0.00	35498.97	27296.55	8202.42	1	0	1
131	18	1000	36	233	40	73149.34	0.00	73149.34	56729.42	16419.92	1	0	1
132	322	2	812	108	15	40744.20	40744.20	0.00	25805.46	14938.74	1	1	0
133	343	1000	162	91	38	64761.27	0.00	64761.27	39504.36	25256.91	1	0	1
134	623	1	437	239	42	100939.59	100939.59	0.00	76090.95	24848.64	1	1	0
135	130	3	748	43	50	47710.86	47710.86	0.00	33874.74	13836.12	1	1	0
136	286	2	923	158	47	140946.68	140946.68	0.00	113540.05	27406.63	1	1	0
137	857	1000	328	221	26	8228.70	0.00	8228.70	5760.10	2468.60	1	0	1
138	161	1000	625	234	28	143904.28	0.00	143904.28	107426.43	36477.85	1	0	1
139	248	4	979	120	12	237327.29	237327.29	0.00	163568.81	73758.48	1	1	0
140	796	1000	212	189	21	168065.78	0.00	168065.78	127203.60	40862.18	1	0	1
141	767	4	61	249	2	139553.35	139553.35	0.00	100608.68	38944.67	1	1	0
142	469	1000	55	203	10	7759.88	0.00	7759.88	4733.53	3026.35	1	0	1
143	753	1000	706	92	8	148153.52	0.00	148153.52	117009.58	31143.94	1	0	1
144	266	1000	506	247	12	163864.11	0.00	163864.11	131115.24	32748.87	1	0	1
145	708	4	364	177	25	125158.81	125158.81	0.00	93586.29	31572.52	1	1	0
146	810	1000	881	5	10	43213.72	0.00	43213.72	36125.86	7087.86	1	0	1
147	287	1	191	187	33	25518.91	25518.91	0.00	16938.99	8579.92	1	1	0
148	574	2	957	226	9	1745.28	1745.28	0.00	1221.68	523.60	1	1	0
149	391	4	380	73	32	98117.70	98117.70	0.00	58870.60	39247.10	1	1	0
150	867	1	735	184	25	59879.12	59879.12	0.00	46504.77	13374.35	1	1	0
151	3	1000	864	145	2	114440.18	0.00	114440.18	81864.56	32575.62	1	0	1
152	264	3	813	249	22	170534.51	170534.51	0.00	141090.44	29444.07	1	1	0
153	389	1000	443	32	40	59496.24	0.00	59496.24	41891.52	17604.72	1	0	1
154	91	1000	501	68	37	38522.15	0.00	38522.15	25763.48	12758.67	1	0	1
155	177	1000	763	134	5	175408.47	0.00	175408.47	129144.15	46264.32	1	0	1
156	200	4	616	113	32	68464.16	68464.16	0.00	53362.63	15101.53	1	1	0
157	695	1000	258	158	5	31781.43	0.00	31781.43	21929.22	9852.21	1	0	1
158	263	2	415	234	24	118370.82	118370.82	0.00	74467.14	43903.68	1	1	0
159	578	4	655	252	11	119974.13	119974.13	0.00	85839.27	34134.86	1	1	0
160	151	3	32	20	25	178877.30	178877.30	0.00	136855.11	42022.19	1	1	0
161	853	2	946	73	35	96167.68	96167.68	0.00	82718.42	13449.26	1	1	0
162	870	3	253	104	21	79135.13	79135.13	0.00	64342.44	14792.69	1	1	0
163	433	1	281	189	2	162480.71	162480.71	0.00	136269.28	26211.43	1	1	0
164	536	4	927	210	21	113843.24	113843.24	0.00	80472.16	33371.08	1	1	0
165	446	1000	10	109	20	133677.00	0.00	133677.00	100633.14	33043.86	1	0	1
166	479	3	730	86	43	276.52	276.52	0.00	232.28	44.24	1	1	0
167	647	2	502	251	8	154953.46	154953.46	0.00	130331.18	24622.28	1	1	0
168	814	3	763	66	21	82100.03	82100.03	0.00	64157.31	17942.72	1	1	0
169	525	2	803	192	34	155816.88	155816.88	0.00	118570.08	37246.80	1	1	0
170	797	1000	954	211	3	107361.00	0.00	107361.00	81262.38	26098.62	1	0	1
171	254	1000	63	159	37	81501.31	0.00	81501.31	55338.72	26162.59	1	0	1
172	134	3	92	150	5	21359.13	21359.13	0.00	14298.81	7060.32	1	1	0
173	344	3	771	201	49	116904.83	116904.83	0.00	79956.15	36948.68	1	1	0
174	337	1000	631	231	26	127841.14	0.00	127841.14	98098.94	29742.20	1	0	1
175	114	1000	934	249	36	103114.12	0.00	103114.12	68027.31	35086.81	1	0	1
176	182	3	786	89	21	77154.62	77154.62	0.00	51759.83	25394.79	1	1	0
177	76	1	267	210	32	172209.57	172209.57	0.00	122032.90	50176.67	1	1	0
178	144	2	874	175	24	95265.03	95265.03	0.00	65814.06	29450.97	1	1	0
179	678	1	363	95	28	233387.46	233387.46	0.00	167563.74	65823.72	1	1	0
180	674	2	575	22	49	92832.75	92832.75	0.00	64406.09	28426.66	1	1	0
181	411	1000	746	140	26	69551.55	0.00	69551.55	46131.39	23420.16	1	0	1
182	54	1000	728	25	9	79562.60	0.00	79562.60	53375.71	26186.89	1	0	1
183	8	1000	902	17	15	79060.87	0.00	79060.87	55130.79	23930.08	1	0	1
184	494	1	898	27	30	2010.12	2010.12	0.00	1708.60	301.52	1	1	0
185	74	1000	295	214	37	97990.70	0.00	97990.70	80352.40	17638.30	1	0	1
186	259	3	43	193	25	187703.15	187703.15	0.00	155984.32	31718.83	1	1	0
187	255	1000	383	56	6	101190.42	0.00	101190.42	67357.28	33833.14	1	0	1
188	789	4	880	109	17	10390.96	10390.96	0.00	8208.84	2182.12	1	1	0
189	483	3	532	173	15	63192.75	63192.75	0.00	47267.82	15924.93	1	1	0
190	212	1	678	195	41	21847.18	21847.18	0.00	18061.87	3785.31	1	1	0
191	723	1	739	4	17	115699.82	115699.82	0.00	92823.48	22876.34	1	1	0
192	69	2	840	4	8	155517.54	155517.54	0.00	118701.98	36815.56	1	1	0
193	271	1000	906	174	40	52182.52	0.00	52182.52	41286.16	10896.36	1	0	1
194	257	4	678	44	8	210580.29	210580.29	0.00	166777.19	43803.10	1	1	0
195	557	1000	77	185	32	83515.52	0.00	83515.52	64711.08	18804.44	1	0	1
196	649	4	86	133	13	56458.42	56458.42	0.00	41708.98	14749.44	1	1	0
197	7	4	908	59	16	94938.69	94938.69	0.00	76731.92	18206.77	1	1	0
198	776	1000	38	248	22	77501.13	0.00	77501.13	61500.99	16000.14	1	0	1
199	824	1000	443	110	50	190694.67	0.00	190694.67	155945.00	34749.67	1	0	1
200	410	1000	576	201	12	22602.54	0.00	22602.54	16662.22	5940.32	1	0	1
201	716	4	800	79	28	114259.50	114259.50	0.00	77257.61	37001.89	1	1	0
202	609	1000	355	52	10	50423.83	0.00	50423.83	37855.50	12568.33	1	0	1
203	596	2	991	185	12	24671.57	24671.57	0.00	15789.83	8881.74	1	1	0
204	177	3	321	47	32	79637.51	79637.51	0.00	62117.28	17520.23	1	1	0
205	315	1000	233	223	33	167606.82	0.00	167606.82	134889.29	32717.53	1	0	1
206	331	1000	170	247	8	75627.90	0.00	75627.90	56638.50	18989.40	1	0	1
207	439	1000	375	9	40	112619.53	0.00	112619.53	81476.32	31143.21	1	0	1
208	180	1000	660	40	27	234582.92	0.00	234582.92	179529.74	55053.18	1	0	1
209	189	1000	777	242	38	50299.02	0.00	50299.02	42251.22	8047.80	1	0	1
210	840	2	495	165	38	99217.01	99217.01	0.00	74631.11	24585.90	1	1	0
211	816	3	783	69	40	150344.65	150344.65	0.00	125261.41	25083.24	1	1	0
212	192	1000	101	80	35	109107.70	0.00	109107.70	80655.22	28452.48	1	0	1
213	310	3	719	174	22	55994.44	55994.44	0.00	48496.78	7497.66	1	1	0
214	738	3	453	13	10	7857.78	7857.78	0.00	5579.00	2278.78	1	1	0
215	535	1	798	140	12	34140.24	34140.24	0.00	26970.80	7169.44	1	1	0
216	437	1000	445	126	29	8370.90	0.00	8370.90	6780.42	1590.48	1	0	1
217	205	2	741	252	36	108287.40	108287.40	0.00	88157.39	20130.01	1	1	0
218	400	1000	336	145	28	102575.58	0.00	102575.58	71523.56	31052.02	1	0	1
219	327	4	275	217	23	109653.28	109653.28	0.00	84639.06	25014.22	1	1	0
220	375	1000	894	199	4	107466.68	0.00	107466.68	86333.05	21133.63	1	0	1
221	10	1000	645	106	5	8270.40	0.00	8270.40	6616.32	1654.08	1	0	1
222	13	1000	986	94	32	101481.30	0.00	101481.30	67441.50	34039.80	1	0	1
223	608	1000	789	48	30	83582.10	0.00	83582.10	59329.55	24252.55	1	0	1
224	397	1	946	195	28	18058.63	18058.63	0.00	15237.97	2820.66	1	1	0
225	687	1000	227	37	4	87508.38	0.00	87508.38	65682.91	21825.47	1	0	1
226	218	4	77	33	13	65043.90	65043.90	0.00	42071.85	22972.05	1	1	0
227	510	1000	107	33	46	56093.49	0.00	56093.49	48659.90	7433.59	1	0	1
228	180	1000	487	197	7	131971.15	0.00	131971.15	107231.04	24740.11	1	0	1
229	177	1000	1032	101	22	63207.08	0.00	63207.08	47760.03	15447.05	1	0	1
230	61	3	34	244	8	109123.00	109123.00	0.00	88323.38	20799.62	1	1	0
231	195	1000	684	24	44	70855.22	0.00	70855.22	53683.93	17171.29	1	0	1
232	447	1000	947	161	10	4492.66	0.00	4492.66	3773.85	718.81	1	0	1
233	579	1000	211	133	26	41363.49	0.00	41363.49	27458.21	13905.28	1	0	1
234	475	1000	992	4	30	128333.89	0.00	128333.89	101352.44	26981.45	1	0	1
235	482	1000	459	34	6	22595.15	0.00	22595.15	17172.30	5422.85	1	0	1
236	399	1000	718	217	39	124887.85	0.00	124887.85	103637.79	21250.06	1	0	1
237	764	1000	873	129	24	43570.49	0.00	43570.49	31604.61	11965.88	1	0	1
238	675	3	526	93	33	118926.53	118926.53	0.00	97361.21	21565.32	1	1	0
239	288	1	211	194	48	85528.84	85528.84	0.00	74303.38	11225.46	1	1	0
240	759	1000	179	64	24	124586.90	0.00	124586.90	85980.50	38606.40	1	0	1
241	805	2	291	215	14	104413.99	104413.99	0.00	84822.54	19591.45	1	1	0
242	34	4	309	218	19	75910.43	75910.43	0.00	55863.99	20046.44	1	1	0
243	267	4	125	156	23	43668.04	43668.04	0.00	36139.98	7528.06	1	1	0
244	128	1000	591	30	25	55795.20	0.00	55795.20	45194.10	10601.10	1	0	1
245	177	1000	108	116	27	75766.40	0.00	75766.40	65556.90	10209.50	1	0	1
246	864	2	445	54	21	44537.64	44537.64	0.00	36592.19	7945.45	1	1	0
247	253	1000	120	48	25	141294.58	0.00	141294.58	108567.31	32727.27	1	0	1
248	272	1000	305	223	49	17306.26	0.00	17306.26	11422.14	5884.12	1	0	1
249	579	1	462	123	20	206940.32	206940.32	0.00	155483.38	51456.94	1	1	0
250	755	1000	167	79	30	180326.11	0.00	180326.11	150602.66	29723.45	1	0	1
251	33	1000	900	248	4	65915.20	0.00	65915.20	52893.82	13021.38	1	0	1
252	311	1000	461	128	2	153309.76	0.00	153309.76	112485.34	40824.42	1	0	1
253	319	2	702	29	40	167469.23	167469.23	0.00	139516.43	27952.80	1	1	0
254	630	2	287	252	11	64697.10	64697.10	0.00	44390.92	20306.18	1	1	0
255	359	1000	388	79	2	49868.00	0.00	49868.00	30419.44	19448.56	1	0	1
256	41	1000	868	101	25	102657.48	0.00	102657.48	77706.24	24951.24	1	0	1
257	271	1000	889	25	11	36924.00	0.00	36924.00	29539.20	7384.80	1	0	1
258	56	1000	516	161	9	7921.60	0.00	7921.60	5307.48	2614.12	1	0	1
259	706	4	818	170	9	144326.54	144326.54	0.00	118391.69	25934.85	1	1	0
260	49	1000	789	73	47	100901.44	0.00	100901.44	65178.08	35723.36	1	0	1
261	479	1000	844	213	1	36858.44	0.00	36858.44	23100.26	13758.18	1	0	1
262	640	3	646	13	4	7318.16	7318.16	0.00	5669.85	1648.31	1	1	0
263	641	1000	586	121	47	57761.17	0.00	57761.17	47181.32	10579.85	1	0	1
264	226	1	850	164	10	36833.22	36833.22	0.00	27993.24	8839.98	1	1	0
265	174	4	501	80	11	5411.70	5411.70	0.00	3247.02	2164.68	1	1	0
266	682	2	506	127	46	99250.26	99250.26	0.00	75723.35	23526.91	1	1	0
267	427	4	237	34	41	27943.90	27943.90	0.00	23472.90	4471.00	1	1	0
268	867	1000	610	75	17	97596.19	0.00	97596.19	76313.50	21282.69	1	0	1
269	780	3	661	137	29	107168.64	107168.64	0.00	89365.87	17802.77	1	1	0
270	570	1000	279	74	44	39135.96	0.00	39135.96	25287.06	13848.90	1	0	1
271	177	1	1116	165	10	40743.86	40743.86	0.00	29965.30	10778.56	1	1	0
272	94	1000	267	215	33	6549.88	0.00	6549.88	5501.88	1048.00	1	0	1
273	855	1000	776	24	33	16248.48	0.00	16248.48	10561.50	5686.98	1	0	1
274	405	1	567	11	37	84016.32	84016.32	0.00	61961.41	22054.91	1	1	0
275	177	1000	746	93	2	21403.40	0.00	21403.40	18490.03	2913.37	1	0	1
276	452	3	72	117	31	51485.85	51485.85	0.00	42530.94	8954.91	1	1	0
277	625	1000	182	52	5	97947.89	0.00	97947.89	70419.46	27528.43	1	0	1
278	47	4	702	194	26	200507.15	200507.15	0.00	164589.71	35917.44	1	1	0
279	548	1000	855	242	31	114690.59	0.00	114690.59	85112.68	29577.91	1	0	1
280	328	1	200	167	45	95848.40	95848.40	0.00	75209.14	20639.26	1	1	0
281	560	1000	445	112	45	214604.60	0.00	214604.60	154260.06	60344.54	1	0	1
282	29	1000	192	165	2	224701.11	0.00	224701.11	178971.20	45729.91	1	0	1
283	782	3	944	174	30	22776.01	22776.01	0.00	14712.82	8063.19	1	1	0
284	16	1000	955	159	10	148628.31	0.00	148628.31	123568.08	25060.23	1	0	1
285	293	1000	741	206	31	8913.54	0.00	8913.54	5619.46	3294.08	1	0	1
286	665	3	196	109	17	28052.61	28052.61	0.00	23283.66	4768.95	1	1	0
287	30	1000	464	184	17	114955.74	0.00	114955.74	79865.53	35090.21	1	0	1
288	709	1000	558	225	34	106628.41	0.00	106628.41	85036.96	21591.45	1	0	1
289	700	4	656	27	25	44450.64	44450.64	0.00	34167.88	10282.76	1	1	0
290	258	2	974	179	9	175066.44	175066.44	0.00	136053.70	39012.74	1	1	0
291	608	1000	234	108	40	188058.62	0.00	188058.62	138099.20	49959.42	1	0	1
292	87	1000	300	143	17	45020.72	0.00	45020.72	35535.99	9484.73	1	0	1
293	60	1000	490	20	43	45497.89	0.00	45497.89	36496.42	9001.47	1	0	1
294	591	1000	871	218	50	98771.77	0.00	98771.77	78607.66	20164.11	1	0	1
295	299	1000	317	90	2	146027.21	0.00	146027.21	115668.02	30359.19	1	0	1
296	816	1000	149	129	23	15151.52	0.00	15151.52	9696.96	5454.56	1	0	1
297	399	1000	819	47	47	94341.17	0.00	94341.17	67648.40	26692.77	1	0	1
298	470	4	354	93	9	115374.53	115374.53	0.00	97323.99	18050.54	1	1	0
299	443	1000	774	188	22	110519.64	0.00	110519.64	74789.29	35730.35	1	0	1
300	53	1000	144	79	28	116260.40	0.00	116260.40	94568.16	21692.24	1	0	1
301	840	1	353	43	46	16727.22	16727.22	0.00	10872.72	5854.50	1	1	0
302	553	2	334	26	13	27604.89	27604.89	0.00	20979.72	6625.17	1	1	0
303	182	2	116	132	40	36072.40	36072.40	0.00	28857.90	7214.50	1	1	0
304	389	3	380	221	17	18927.17	18927.17	0.00	15683.23	3243.94	1	1	0
305	844	3	743	182	12	83468.66	83468.66	0.00	56754.33	26714.33	1	1	0
306	845	1000	28	168	25	36275.36	0.00	36275.36	24697.15	11578.21	1	0	1
307	177	1000	571	186	6	1858.58	0.00	1858.58	1208.08	650.50	1	0	1
308	622	1000	780	221	30	54882.46	0.00	54882.46	39141.66	15740.80	1	0	1
309	177	1000	408	121	40	54579.50	0.00	54579.50	47492.70	7086.80	1	0	1
310	367	1	291	30	22	157666.96	157666.96	0.00	128571.28	29095.68	1	1	0
311	828	1000	882	24	33	51676.20	0.00	51676.20	39273.94	12402.26	1	0	1
312	108	2	160	143	44	21235.30	21235.30	0.00	18050.00	3185.30	1	1	0
313	546	1000	863	146	3	45666.88	0.00	45666.88	38868.14	6798.74	1	0	1
314	148	1	349	249	18	7770.80	7770.80	0.00	4740.19	3030.61	1	1	0
315	794	1000	684	218	41	35181.23	0.00	35181.23	21812.35	13368.88	1	0	1
316	243	1000	363	40	39	5768.70	0.00	5768.70	3692.00	2076.70	1	0	1
317	323	2	973	230	10	36980.88	36980.88	0.00	28845.12	8135.76	1	1	0
318	375	1000	924	164	48	158331.39	0.00	158331.39	114769.84	43561.55	1	0	1
319	645	1000	367	189	2	57504.16	0.00	57504.16	42553.07	14951.09	1	0	1
320	739	1000	481	58	33	52626.93	0.00	52626.93	40346.63	12280.30	1	0	1
321	666	1000	860	60	5	66850.74	0.00	66850.74	51823.86	15026.88	1	0	1
322	467	1000	877	104	50	58618.84	0.00	58618.84	50504.07	8114.77	1	0	1
323	718	1000	713	17	14	20007.34	0.00	20007.34	17549.38	2457.96	1	0	1
324	5	1000	465	185	50	105209.97	0.00	105209.97	84830.93	20379.04	1	0	1
325	859	1	161	79	19	154480.25	154480.25	0.00	117620.80	36859.45	1	1	0
326	586	1000	765	56	34	1464.57	0.00	1464.57	908.01	556.56	1	0	1
327	177	1	952	42	9	21234.64	21234.64	0.00	18179.60	3055.04	1	1	0
328	109	1	113	69	8	100931.20	100931.20	0.00	71872.56	29058.64	1	1	0
329	847	1000	952	106	50	131687.51	0.00	131687.51	106207.05	25480.46	1	0	1
330	833	2	845	22	6	174404.80	174404.80	0.00	128263.75	46141.05	1	1	0
331	177	4	496	205	6	75835.18	75835.18	0.00	60090.48	15744.70	1	1	0
332	477	1	719	44	48	57783.85	57783.85	0.00	40136.60	17647.25	1	1	0
333	179	1000	786	237	14	45457.30	0.00	45457.30	39093.25	6364.05	1	0	1
334	129	2	15	32	11	156913.16	156913.16	0.00	112598.00	44315.16	1	1	0
335	694	1	909	126	25	93149.37	93149.37	0.00	71916.30	21233.07	1	1	0
336	617	1000	899	54	38	206554.69	0.00	206554.69	153675.02	52879.67	1	0	1
337	683	1000	825	104	6	83268.64	0.00	83268.64	57271.18	25997.46	1	0	1
338	859	1000	17	174	33	829.56	0.00	829.56	696.84	132.72	1	0	1
339	745	2	598	162	20	146296.51	146296.51	0.00	112393.57	33902.94	1	1	0
340	177	4	368	198	47	141996.28	141996.28	0.00	105372.54	36623.74	1	1	0
341	726	1	134	215	4	33820.44	33820.44	0.00	27518.09	6302.35	1	1	0
342	805	1000	15	145	20	179530.00	0.00	179530.00	129166.03	50363.97	1	0	1
343	583	1000	881	87	19	82886.07	0.00	82886.07	65207.75	17678.32	1	0	1
344	292	1000	579	34	4	62461.40	0.00	62461.40	42288.06	20173.34	1	0	1
345	284	1	475	149	13	20730.86	20730.86	0.00	14375.15	6355.71	1	1	0
346	620	3	247	63	29	29864.44	29864.44	0.00	26280.72	3583.72	1	1	0
347	3	4	852	148	40	15956.50	15956.50	0.00	9893.05	6063.45	1	1	0
348	49	1	627	172	30	18695.32	18695.32	0.00	16313.91	2381.41	1	1	0
349	58	2	161	199	36	8188.32	8188.32	0.00	5076.76	3111.56	1	1	0
350	405	2	6	134	31	39013.11	39013.11	0.00	26138.79	12874.32	1	1	0
351	437	1	382	172	12	116038.31	116038.31	0.00	90918.42	25119.89	1	1	0
352	455	4	309	84	41	62859.30	62859.30	0.00	42760.02	20099.28	1	1	0
353	619	1000	127	252	25	27310.62	0.00	27310.62	24033.36	3277.26	1	0	1
354	756	1000	935	140	8	54262.92	0.00	54262.92	40697.16	13565.76	1	0	1
355	791	1000	441	212	7	31070.88	0.00	31070.88	24782.53	6288.35	1	0	1
356	433	1	129	105	19	50806.73	50806.73	0.00	37230.45	13576.28	1	1	0
357	239	1	969	10	23	158328.14	158328.14	0.00	125611.37	32716.77	1	1	0
358	328	1	809	135	28	68676.73	68676.73	0.00	58311.47	10365.26	1	1	0
359	426	1000	991	17	15	95452.67	0.00	95452.67	81145.46	14307.21	1	0	1
360	743	1000	76	81	47	42180.39	0.00	42180.39	32900.70	9279.69	1	0	1
361	517	4	248	81	24	65902.90	65902.90	0.00	53810.42	12092.48	1	1	0
362	420	1000	621	14	7	4859.90	0.00	4859.90	4228.10	631.80	1	0	1
363	789	1000	820	121	4	37208.24	0.00	37208.24	26045.76	11162.48	1	0	1
364	120	4	869	230	20	117585.23	117585.23	0.00	80706.78	36878.45	1	1	0
365	387	1000	414	227	12	133662.43	0.00	133662.43	95817.76	37844.67	1	0	1
366	297	2	158	41	39	197276.28	197276.28	0.00	151054.83	46221.45	1	1	0
367	397	2	21	40	43	77582.44	77582.44	0.00	52126.00	25456.44	1	1	0
368	177	4	792	122	16	63960.33	63960.33	0.00	52369.00	11591.33	1	1	0
369	147	1000	920	211	34	133181.10	0.00	133181.10	100389.98	32791.12	1	0	1
370	248	1	914	195	3	132201.08	132201.08	0.00	88058.18	44142.90	1	1	0
371	175	4	550	146	1	165952.91	165952.91	0.00	125584.47	40368.44	1	1	0
372	377	1000	236	183	36	75288.36	0.00	75288.36	47232.23	28056.13	1	0	1
373	229	4	802	15	36	94286.42	94286.42	0.00	62267.75	32018.67	1	1	0
374	435	2	224	120	18	90698.13	90698.13	0.00	67170.45	23527.68	1	1	0
375	586	1000	359	83	25	87619.56	0.00	87619.56	76684.31	10935.25	1	0	1
376	789	3	288	169	48	108564.14	108564.14	0.00	86516.65	22047.49	1	1	0
377	720	3	119	129	1	28897.36	28897.36	0.00	18286.76	10610.60	1	1	0
378	545	2	850	96	23	131688.26	131688.26	0.00	97614.57	34073.69	1	1	0
379	301	3	818	17	14	132481.11	132481.11	0.00	93252.36	39228.75	1	1	0
380	718	1000	766	97	34	220546.42	0.00	220546.42	168308.67	52237.75	1	0	1
381	109	1000	299	173	37	161164.54	0.00	161164.54	113945.64	47218.90	1	0	1
382	477	4	268	46	12	161268.37	161268.37	0.00	114062.65	47205.72	1	1	0
383	430	1	909	89	19	155183.51	155183.51	0.00	119462.20	35721.31	1	1	0
384	510	1000	475	23	32	122852.70	0.00	122852.70	96926.49	25926.21	1	0	1
385	456	3	254	137	11	51876.18	51876.18	0.00	35262.00	16614.18	1	1	0
386	286	1000	870	3	15	28738.54	0.00	28738.54	23591.84	5146.70	1	0	1
387	323	1000	371	197	24	154602.69	0.00	154602.69	116993.28	37609.41	1	0	1
388	455	1000	764	58	11	104678.59	0.00	104678.59	74508.48	30170.11	1	0	1
389	287	1000	122	142	18	167398.41	0.00	167398.41	115920.35	51478.06	1	0	1
390	177	3	260	151	11	120594.35	120594.35	0.00	89084.18	31510.17	1	1	0
391	168	1000	524	52	40	2907.48	0.00	2907.48	1977.09	930.39	1	0	1
392	64	1	181	236	30	181536.66	181536.66	0.00	133573.97	47962.69	1	1	0
393	671	2	932	156	9	37130.24	37130.24	0.00	23020.76	14109.48	1	1	0
394	105	4	171	204	34	97929.12	97929.12	0.00	73660.50	24268.62	1	1	0
395	731	1000	460	35	19	256386.73	0.00	256386.73	172668.67	83718.06	1	0	1
396	685	1	763	105	4	157282.96	157282.96	0.00	104945.29	52337.67	1	1	0
397	116	1000	682	231	1	33742.10	0.00	33742.10	28005.95	5736.15	1	0	1
398	567	1000	328	9	24	106442.50	0.00	106442.50	76840.67	29601.83	1	0	1
399	266	1000	253	168	21	38220.89	0.00	38220.89	30171.46	8049.43	1	0	1
400	103	4	568	193	44	66219.66	66219.66	0.00	56689.65	9530.01	1	1	0
401	744	1000	375	46	16	39922.80	0.00	39922.80	32783.10	7139.70	1	0	1
402	36	1000	542	80	26	124699.96	0.00	124699.96	90680.08	34019.88	1	0	1
403	379	1000	464	135	36	196546.66	0.00	196546.66	142032.49	54514.17	1	0	1
404	110	2	232	4	39	163089.47	163089.47	0.00	117784.77	45304.70	1	1	0
405	577	2	733	57	32	44546.55	44546.55	0.00	29846.20	14700.35	1	1	0
406	829	1000	824	4	8	116492.95	0.00	116492.95	82743.06	33749.89	1	0	1
407	824	1000	557	105	33	28088.90	0.00	28088.90	23313.80	4775.10	1	0	1
408	274	1000	227	69	49	99777.12	0.00	99777.12	72595.57	27181.55	1	0	1
409	793	1000	170	33	1	115617.07	0.00	115617.07	87300.72	28316.35	1	0	1
410	177	3	145	83	34	168410.02	168410.02	0.00	131315.54	37094.48	1	1	0
411	104	1000	34	227	19	188003.56	0.00	188003.56	145889.82	42113.74	1	0	1
412	445	1000	864	92	50	64046.40	0.00	64046.40	50504.79	13541.61	1	0	1
413	659	2	721	207	26	41733.12	41733.12	0.00	36363.39	5369.73	1	1	0
414	651	1000	595	119	1	56125.19	0.00	56125.19	44732.11	11393.08	1	0	1
415	530	1	288	68	7	62105.67	62105.67	0.00	47538.88	14566.79	1	1	0
416	328	2	998	139	46	45755.65	45755.65	0.00	39487.90	6267.75	1	1	0
417	170	1000	397	80	21	75877.84	0.00	75877.84	62540.96	13336.88	1	0	1
418	445	1000	998	249	18	39934.80	0.00	39934.80	28753.10	11181.70	1	0	1
419	172	1000	126	244	4	67358.74	0.00	67358.74	53002.48	14356.26	1	0	1
420	268	4	392	46	49	82928.65	82928.65	0.00	61280.76	21647.89	1	1	0
421	606	3	843	170	40	89477.07	89477.07	0.00	62589.12	26887.95	1	1	0
422	140	4	333	158	1	88145.17	88145.17	0.00	70307.56	17837.61	1	1	0
423	710	4	589	186	28	25089.64	25089.64	0.00	16550.60	8539.04	1	1	0
424	460	1000	349	42	34	201385.61	0.00	201385.61	159620.92	41764.69	1	0	1
425	686	3	776	87	22	173224.17	173224.17	0.00	115394.52	57829.65	1	1	0
426	730	1000	761	253	9	86283.97	0.00	86283.97	66156.81	20127.16	1	0	1
427	478	1000	89	44	18	17229.55	0.00	17229.55	11728.67	5500.88	1	0	1
428	785	1000	651	71	34	67650.53	0.00	67650.53	46749.42	20901.11	1	0	1
429	563	3	521	172	28	90667.31	90667.31	0.00	75253.82	15413.49	1	1	0
430	436	1000	79	196	27	54170.48	0.00	54170.48	37660.70	16509.78	1	0	1
431	24	2	282	44	32	63603.10	63603.10	0.00	46717.11	16885.99	1	1	0
432	409	1000	932	144	40	93323.98	0.00	93323.98	68890.19	24433.79	1	0	1
433	55	1	923	210	41	53527.21	53527.21	0.00	42915.20	10612.01	1	1	0
434	428	4	563	253	16	4694.11	4694.11	0.00	3989.99	704.12	1	1	0
435	869	2	870	184	8	55989.18	55989.18	0.00	36676.80	19312.38	1	1	0
436	177	1000	1117	162	10	128821.30	0.00	128821.30	103421.57	25399.73	1	0	1
437	410	1	718	18	10	91717.73	91717.73	0.00	77444.97	14272.76	1	1	0
438	810	3	131	179	47	112912.54	112912.54	0.00	87463.46	25449.08	1	1	0
439	502	4	993	159	36	67253.31	67253.31	0.00	47101.26	20152.05	1	1	0
440	390	1000	148	122	16	32145.72	0.00	32145.72	20608.68	11537.04	1	0	1
441	796	1000	826	138	5	12319.98	0.00	12319.98	9257.38	3062.60	1	0	1
442	418	1000	577	252	29	116506.61	0.00	116506.61	91788.09	24718.52	1	0	1
443	110	2	421	136	23	122633.65	122633.65	0.00	90159.70	32473.95	1	1	0
444	150	1000	143	29	27	35880.25	0.00	35880.25	27374.19	8506.06	1	0	1
445	58	1000	275	16	48	17202.35	0.00	17202.35	15482.10	1720.25	1	0	1
446	187	1000	732	92	17	4179.54	0.00	4179.54	2925.69	1253.85	1	0	1
447	303	1000	185	242	34	71133.71	0.00	71133.71	56607.87	14525.84	1	0	1
448	146	1000	691	222	31	76738.95	0.00	76738.95	63176.52	13562.43	1	0	1
449	673	1000	707	17	46	79934.65	0.00	79934.65	71420.98	8513.67	1	0	1
450	320	1000	918	243	22	150727.58	0.00	150727.58	111441.71	39285.87	1	0	1
451	469	1000	609	196	30	37474.78	0.00	37474.78	31853.57	5621.21	1	0	1
452	441	3	789	64	34	61456.17	61456.17	0.00	43141.59	18314.58	1	1	0
453	584	3	297	208	33	34573.37	34573.37	0.00	29227.95	5345.42	1	1	0
454	419	1000	460	100	2	50047.59	0.00	50047.59	34378.24	15669.35	1	0	1
455	163	3	958	170	4	39689.40	39689.40	0.00	30365.68	9323.72	1	1	0
532	360	4	579	39	10	4182.56	4182.56	0.00	2593.19	1589.37	1	1	0
456	596	1000	903	22	44	85057.13	0.00	85057.13	61061.00	23996.13	1	0	1
457	806	3	947	115	15	71308.20	71308.20	0.00	53346.96	17961.24	1	1	0
458	150	1	154	132	1	7827.20	7827.20	0.00	5635.58	2191.62	1	1	0
459	183	4	38	230	3	98377.09	98377.09	0.00	64096.33	34280.76	1	1	0
460	764	4	350	242	35	47022.64	47022.64	0.00	30645.53	16377.11	1	1	0
461	232	1000	269	231	34	39517.80	0.00	39517.80	27662.45	11855.35	1	0	1
462	413	1000	987	220	1	6382.60	0.00	6382.60	3957.22	2425.38	1	0	1
463	444	2	380	235	22	50457.46	50457.46	0.00	38652.78	11804.68	1	1	0
464	82	3	73	97	4	19840.66	19840.66	0.00	15475.72	4364.94	1	1	0
465	168	2	344	207	42	32535.08	32535.08	0.00	19521.04	13014.04	1	1	0
466	846	1	278	5	19	161307.42	161307.42	0.00	112139.76	49167.66	1	1	0
467	47	1000	708	89	22	60613.76	0.00	60613.76	47712.98	12900.78	1	0	1
468	783	4	217	52	28	90872.35	90872.35	0.00	59407.44	31464.91	1	1	0
469	381	2	200	14	6	98792.26	98792.26	0.00	68118.23	30674.03	1	1	0
470	323	1	887	102	2	115215.89	115215.89	0.00	94513.68	20702.21	1	1	0
471	339	2	771	135	46	183379.16	183379.16	0.00	133009.30	50369.86	1	1	0
472	716	1000	999	166	23	155161.64	0.00	155161.64	122205.02	32956.62	1	0	1
473	439	1	384	74	28	69450.51	69450.51	0.00	52563.42	16887.09	1	1	0
474	99	1000	986	219	43	113075.64	0.00	113075.64	89278.55	23797.09	1	0	1
475	177	4	1149	78	17	252611.83	252611.83	0.00	188704.01	63907.82	1	1	0
476	177	1000	1181	11	6	212417.45	0.00	212417.45	157936.00	54481.45	1	0	1
477	436	4	273	78	20	8631.48	8631.48	0.00	5265.21	3366.27	1	1	0
478	58	4	44	2	7	49601.65	49601.65	0.00	38689.30	10912.35	1	1	0
479	207	1000	307	105	22	55303.47	0.00	55303.47	40177.88	15125.59	1	0	1
480	140	2	905	75	45	5033.13	5033.13	0.00	3321.87	1711.26	1	1	0
481	378	3	226	39	26	3968.30	3968.30	0.00	3293.71	674.59	1	1	0
482	263	1000	87	171	24	22289.64	0.00	22289.64	18170.61	4119.03	1	0	1
483	498	1000	389	161	25	150371.68	0.00	150371.68	116485.71	33885.97	1	0	1
484	501	1000	287	106	34	122037.15	0.00	122037.15	97186.80	24850.35	1	0	1
485	70	4	806	158	45	166047.96	166047.96	0.00	112027.08	54020.88	1	1	0
486	693	1000	327	86	41	199801.14	0.00	199801.14	153883.32	45917.82	1	0	1
487	366	4	742	248	17	52959.00	52959.00	0.00	42385.38	10573.62	1	1	0
488	187	1000	182	132	16	47448.77	0.00	47448.77	33864.23	13584.54	1	0	1
489	82	4	766	49	12	1627.30	1627.30	0.00	1008.90	618.40	1	1	0
490	157	1000	83	115	50	129131.66	0.00	129131.66	84254.06	44877.60	1	0	1
491	541	1000	213	20	16	31607.28	0.00	31607.28	21492.96	10114.32	1	0	1
492	686	4	974	141	7	92239.86	92239.86	0.00	67720.17	24519.69	1	1	0
493	589	3	110	215	4	57795.13	57795.13	0.00	50345.75	7449.38	1	1	0
494	608	1	378	173	44	6114.42	6114.42	0.00	3790.94	2323.48	1	1	0
495	760	2	655	114	16	70541.98	70541.98	0.00	54150.46	16391.52	1	1	0
496	823	1000	291	19	48	50927.22	0.00	50927.22	35139.78	15787.44	1	0	1
497	486	1000	304	105	4	26986.00	0.00	26986.00	24017.50	2968.50	1	0	1
498	257	1000	336	135	48	36672.40	0.00	36672.40	32271.70	4400.70	1	0	1
499	592	1	776	180	20	55485.93	55485.93	0.00	43263.07	12222.86	1	1	0
500	681	2	378	121	29	171713.20	171713.20	0.00	124214.42	47498.78	1	1	0
501	571	1	141	27	15	154749.73	154749.73	0.00	105190.34	49559.39	1	1	0
502	98	2	825	99	38	85767.41	85767.41	0.00	63889.68	21877.73	1	1	0
503	51	3	479	167	16	118297.08	118297.08	0.00	83380.00	34917.08	1	1	0
504	736	1000	808	24	14	45394.80	0.00	45394.80	34558.99	10835.81	1	0	1
505	8	1000	900	234	7	89519.49	0.00	89519.49	65629.35	23890.14	1	0	1
506	397	1000	218	162	29	50228.78	0.00	50228.78	41307.64	8921.14	1	0	1
507	672	4	669	93	33	4969.70	4969.70	0.00	3379.40	1590.30	1	1	0
508	673	2	203	188	18	90292.49	90292.49	0.00	78508.21	11784.28	1	1	0
509	354	1000	573	118	10	121671.98	0.00	121671.98	95285.74	26386.24	1	0	1
510	316	1000	281	196	27	158332.19	0.00	158332.19	108484.35	49847.84	1	0	1
511	143	1000	406	67	30	38851.68	0.00	38851.68	24097.94	14753.74	1	0	1
512	260	1000	220	239	19	84402.01	0.00	84402.01	59405.22	24996.79	1	0	1
513	866	1000	36	229	30	139515.70	0.00	139515.70	106294.10	33221.60	1	0	1
514	197	1	720	45	2	81855.51	81855.51	0.00	67256.99	14598.52	1	1	0
515	401	1000	652	71	41	23934.55	0.00	23934.55	20602.14	3332.41	1	0	1
516	684	1000	194	171	15	114622.16	0.00	114622.16	83810.82	30811.34	1	0	1
517	830	1000	500	130	34	61502.25	0.00	61502.25	43961.32	17540.93	1	0	1
518	351	1000	812	69	17	20277.84	0.00	20277.84	16830.58	3447.26	1	0	1
519	251	1	400	14	32	176223.98	176223.98	0.00	144656.14	31567.84	1	1	0
520	853	1000	755	29	32	181456.31	0.00	181456.31	145325.06	36131.25	1	0	1
521	377	4	300	19	49	126029.64	126029.64	0.00	90249.51	35780.13	1	1	0
522	701	2	185	102	38	127571.60	127571.60	0.00	107192.83	20378.77	1	1	0
523	686	1000	851	159	44	79007.75	0.00	79007.75	51346.72	27661.03	1	0	1
524	524	1000	279	28	18	9294.99	0.00	9294.99	8036.51	1258.48	1	0	1
525	639	1000	665	42	46	115718.88	0.00	115718.88	81291.64	34427.24	1	0	1
526	401	2	553	203	6	39869.63	39869.63	0.00	33598.13	6271.50	1	1	0
527	823	2	501	110	12	63996.31	63996.31	0.00	48112.87	15883.44	1	1	0
528	424	1	717	91	3	83436.42	83436.42	0.00	57418.14	26018.28	1	1	0
529	485	3	824	219	35	61574.66	61574.66	0.00	46515.95	15058.71	1	1	0
530	256	1000	524	63	29	67115.42	0.00	67115.42	54496.95	12618.47	1	0	1
531	747	3	708	148	26	30654.47	30654.47	0.00	23292.34	7362.13	1	1	0
533	866	1	263	76	48	15537.92	15537.92	0.00	9478.12	6059.80	1	1	0
534	781	1000	173	76	17	45848.78	0.00	45848.78	37782.45	8066.33	1	0	1
535	110	2	528	99	19	171686.89	171686.89	0.00	130159.37	41527.52	1	1	0
536	328	1	335	29	37	46582.88	46582.88	0.00	37274.16	9308.72	1	1	0
537	74	4	278	168	18	99231.34	99231.34	0.00	77928.58	21302.76	1	1	0
538	177	2	119	192	39	215866.08	215866.08	0.00	154894.36	60971.72	1	1	0
539	500	1000	971	234	49	165961.99	0.00	165961.99	127385.69	38576.30	1	0	1
540	696	3	938	36	34	30075.91	30075.91	0.00	20438.59	9637.32	1	1	0
541	260	1000	549	232	20	54889.02	0.00	54889.02	38724.58	16164.44	1	0	1
542	376	3	341	233	39	31083.20	31083.20	0.00	18960.76	12122.44	1	1	0
543	385	3	370	19	5	13501.80	13501.80	0.00	9181.20	4320.60	1	1	0
544	177	2	121	230	28	192263.82	192263.82	0.00	136435.23	55828.59	1	1	0
545	313	1000	841	151	18	112754.03	0.00	112754.03	87012.43	25741.60	1	0	1
546	740	1	465	225	35	107455.26	107455.26	0.00	74538.34	32916.92	1	1	0
547	474	3	519	126	3	97131.20	97131.20	0.00	83344.25	13786.95	1	1	0
548	417	1000	935	9	31	226671.79	0.00	226671.79	150553.14	76118.65	1	0	1
549	616	3	462	42	29	68142.42	68142.42	0.00	48319.12	19823.30	1	1	0
550	221	1000	152	223	8	89444.53	0.00	89444.53	62557.80	26886.73	1	0	1
551	414	2	13	243	23	85204.84	85204.84	0.00	57203.71	28001.13	1	1	0
552	832	1	297	102	14	76127.99	76127.99	0.00	54620.38	21507.61	1	1	0
553	185	1	959	127	25	137590.62	137590.62	0.00	108146.67	29443.95	1	1	0
554	616	4	29	196	23	39404.91	39404.91	0.00	28962.05	10442.86	1	1	0
555	402	1000	995	210	14	19848.00	0.00	19848.00	12702.72	7145.28	1	0	1
556	73	1000	771	88	44	151121.02	0.00	151121.02	122125.38	28995.64	1	0	1
557	687	2	862	139	18	9033.38	9033.38	0.00	6614.93	2418.45	1	1	0
558	524	1000	814	80	50	86441.34	0.00	86441.34	71071.80	15369.54	1	0	1
559	333	1000	483	65	11	119064.64	0.00	119064.64	99121.58	19943.06	1	0	1
560	80	4	600	9	35	71834.14	71834.14	0.00	55620.69	16213.45	1	1	0
561	859	1000	227	28	23	31926.58	0.00	31926.58	27361.21	4565.37	1	0	1
562	326	1000	925	249	19	209461.33	0.00	209461.33	146252.21	63209.12	1	0	1
563	177	1	794	113	41	304083.79	304083.79	0.00	241036.49	63047.30	1	1	0
564	714	1000	974	80	13	72650.32	0.00	72650.32	49575.63	23074.69	1	0	1
565	153	1000	155	134	32	37669.05	0.00	37669.05	30511.89	7157.16	1	0	1
566	841	4	782	48	1	124550.39	124550.39	0.00	85808.40	38741.99	1	1	0
567	33	2	955	130	6	169814.13	169814.13	0.00	128043.96	41770.17	1	1	0
568	466	1000	36	86	49	212313.39	0.00	212313.39	158821.95	53491.44	1	0	1
569	524	3	134	55	44	121966.08	121966.08	0.00	95991.58	25974.50	1	1	0
570	475	1	132	178	3	166358.28	166358.28	0.00	118323.94	48034.34	1	1	0
571	66	1000	265	11	37	137803.97	0.00	137803.97	107484.86	30319.11	1	0	1
572	581	1000	655	112	20	22537.62	0.00	22537.62	15046.07	7491.55	1	0	1
573	801	1000	765	132	34	171949.79	0.00	171949.79	120014.62	51935.17	1	0	1
574	467	1000	504	241	28	30717.72	0.00	30717.72	24600.28	6117.44	1	0	1
575	38	1	379	62	27	22586.61	22586.61	0.00	15183.89	7402.72	1	1	0
576	462	1000	237	107	36	166403.45	0.00	166403.45	137041.16	29362.29	1	0	1
577	587	3	722	61	27	14365.12	14365.12	0.00	10055.60	4309.52	1	1	0
578	621	1000	489	29	9	202235.02	0.00	202235.02	154205.80	48029.22	1	0	1
579	634	3	980	44	5	20016.30	20016.30	0.00	13410.93	6605.37	1	1	0
580	15	2	809	99	2	187951.61	187951.61	0.00	129203.73	58747.88	1	1	0
581	649	1000	122	238	49	197145.10	0.00	197145.10	134016.19	63128.91	1	0	1
582	70	1000	195	249	15	17268.48	0.00	17268.48	13156.32	4112.16	1	0	1
583	376	1000	258	147	41	38072.28	0.00	38072.28	27143.55	10928.73	1	0	1
584	551	1	269	9	2	135096.46	135096.46	0.00	103479.62	31616.84	1	1	0
585	377	1000	747	46	20	109958.75	0.00	109958.75	89933.29	20025.46	1	0	1
586	427	3	528	221	30	34675.26	34675.26	0.00	21320.27	13354.99	1	1	0
587	20	4	377	244	38	33009.34	33009.34	0.00	28692.66	4316.68	1	1	0
588	177	1	345	37	22	187624.30	187624.30	0.00	158037.14	29587.16	1	1	0
589	699	1	748	101	26	37349.51	37349.51	0.00	32617.08	4732.43	1	1	0
590	349	1000	973	109	15	123700.74	0.00	123700.74	101089.47	22611.27	1	0	1
591	750	1	228	16	28	131273.75	131273.75	0.00	109236.21	22037.54	1	1	0
592	802	4	736	208	2	135177.92	135177.92	0.00	101224.95	33952.97	1	1	0
593	588	3	252	143	37	89292.69	89292.69	0.00	63193.49	26099.20	1	1	0
594	638	1000	148	97	40	179224.91	0.00	179224.91	129945.69	49279.22	1	0	1
595	414	2	172	115	38	161211.91	161211.91	0.00	130747.79	30464.12	1	1	0
596	724	2	487	228	6	174412.72	174412.72	0.00	126708.00	47704.72	1	1	0
597	831	4	160	117	50	10148.32	10148.32	0.00	8118.64	2029.68	1	1	0
598	268	1000	235	167	19	30927.60	0.00	30927.60	23504.96	7422.64	1	0	1
599	407	1000	307	190	45	165975.27	0.00	165975.27	118139.09	47836.18	1	0	1
600	131	1000	203	23	24	101029.36	0.00	101029.36	70711.24	30318.12	1	0	1
601	608	3	435	177	45	58420.19	58420.19	0.00	46745.95	11674.24	1	1	0
602	422	1000	290	39	27	86615.07	0.00	86615.07	73322.30	13292.77	1	0	1
603	801	1000	850	56	1	51879.39	0.00	51879.39	35094.36	16785.03	1	0	1
604	822	2	35	207	6	68960.13	68960.13	0.00	49926.24	19033.89	1	1	0
605	306	1	31	159	8	120320.43	120320.43	0.00	87701.20	32619.23	1	1	0
606	353	1000	885	132	2	82624.29	0.00	82624.29	69877.80	12746.49	1	0	1
607	507	2	791	45	20	78110.85	78110.85	0.00	52185.08	25925.77	1	1	0
608	186	4	123	67	17	104846.75	104846.75	0.00	88313.07	16533.68	1	1	0
609	255	1000	302	48	12	47632.80	0.00	47632.80	32390.32	15242.48	1	0	1
610	182	1000	569	158	11	72670.77	0.00	72670.77	60727.05	11943.72	1	0	1
611	230	1000	708	22	36	143966.31	0.00	143966.31	103296.87	40669.44	1	0	1
612	256	1	920	50	25	92886.13	92886.13	0.00	63077.92	29808.21	1	1	0
613	177	1000	276	84	6	62814.36	0.00	62814.36	52901.02	9913.34	1	0	1
614	408	1000	435	126	18	30915.34	0.00	30915.34	21802.02	9113.32	1	0	1
615	236	2	423	251	35	135514.05	135514.05	0.00	99514.37	35999.68	1	1	0
616	482	2	471	12	3	1287.68	1287.68	0.00	1133.16	154.52	1	1	0
617	738	1000	712	173	7	131107.22	0.00	131107.22	98324.68	32782.54	1	0	1
618	244	1	676	245	11	37037.15	37037.15	0.00	30591.96	6445.19	1	1	0
619	165	1000	580	221	38	18209.01	0.00	18209.01	15295.56	2913.45	1	0	1
620	241	4	185	23	40	74079.46	74079.46	0.00	58535.41	15544.05	1	1	0
621	242	3	541	148	34	7013.90	7013.90	0.00	5540.98	1472.92	1	1	0
622	710	1000	549	227	49	62146.36	0.00	62146.36	44584.57	17561.79	1	0	1
623	237	1	701	209	2	125606.18	125606.18	0.00	91031.91	34574.27	1	1	0
624	181	3	233	140	29	74102.24	74102.24	0.00	47173.03	26929.21	1	1	0
625	570	2	990	22	6	144833.50	144833.50	0.00	111259.75	33573.75	1	1	0
626	437	2	457	236	45	236100.25	236100.25	0.00	188286.47	47813.78	1	1	0
627	838	1000	257	125	41	59389.24	0.00	59389.24	44641.85	14747.39	1	0	1
628	828	3	414	122	7	19184.58	19184.58	0.00	14580.30	4604.28	1	1	0
629	616	1000	749	94	15	4150.68	0.00	4150.68	3403.56	747.12	1	0	1
630	258	1000	88	217	34	85207.67	0.00	85207.67	66903.16	18304.51	1	0	1
631	65	2	954	114	20	52927.71	52927.71	0.00	40116.83	12810.88	1	1	0
632	514	1000	438	128	32	110791.91	0.00	110791.91	97507.07	13284.84	1	0	1
633	833	1000	933	112	22	109182.70	0.00	109182.70	78907.10	30275.60	1	0	1
634	331	2	702	124	23	229381.74	229381.74	0.00	164980.94	64400.80	1	1	0
635	298	1000	61	97	15	16060.02	0.00	16060.02	9636.00	6424.02	1	0	1
636	14	1000	857	148	45	109101.20	0.00	109101.20	76622.86	32478.34	1	0	1
637	369	3	172	220	33	45292.81	45292.81	0.00	33834.14	11458.67	1	1	0
638	205	1000	577	247	36	17653.92	0.00	17653.92	14514.94	3138.98	1	0	1
639	334	1000	155	74	11	69942.96	0.00	69942.96	47693.24	22249.72	1	0	1
640	389	1000	547	132	6	104063.70	0.00	104063.70	76865.81	27197.89	1	0	1
641	13	1000	219	145	9	85764.44	0.00	85764.44	61891.03	23873.41	1	0	1
642	131	3	178	52	11	111376.17	111376.17	0.00	79007.88	32368.29	1	1	0
643	434	2	556	29	2	233021.23	233021.23	0.00	183226.20	49795.03	1	1	0
644	795	1	754	243	18	179792.26	179792.26	0.00	150227.79	29564.47	1	1	0
645	177	1	504	60	48	127238.70	127238.70	0.00	96994.72	30243.98	1	1	0
646	177	1	1024	150	14	180245.53	180245.53	0.00	139877.05	40368.48	1	1	0
647	493	1000	494	68	3	158655.44	0.00	158655.44	124252.87	34402.57	1	0	1
648	519	4	85	68	19	42179.02	42179.02	0.00	34623.04	7555.98	1	1	0
649	713	1	569	148	29	2805.81	2805.81	0.00	2328.82	476.99	1	1	0
650	721	1000	147	44	45	26477.97	0.00	26477.97	22221.58	4256.39	1	0	1
651	177	1	635	233	29	162067.15	162067.15	0.00	107681.62	54385.53	1	1	0
652	546	1	347	187	25	147668.95	147668.95	0.00	106356.75	41312.20	1	1	0
653	595	1000	98	250	32	76899.48	0.00	76899.48	51251.72	25647.76	1	0	1
654	875	1000	605	133	19	90023.94	0.00	90023.94	65149.36	24874.58	1	0	1
655	113	1000	136	152	43	170430.81	0.00	170430.81	113398.45	57032.36	1	0	1
656	101	1000	709	132	15	57968.31	0.00	57968.31	43287.91	14680.40	1	0	1
657	565	1000	430	106	1	191401.52	0.00	191401.52	144750.49	46651.03	1	0	1
658	75	1000	224	153	36	29729.42	0.00	29729.42	25270.00	4459.42	1	0	1
659	594	3	218	21	49	85643.00	85643.00	0.00	55668.00	29975.00	1	1	0
660	69	1000	383	235	10	77363.29	0.00	77363.29	51265.20	26098.09	1	0	1
661	705	3	266	24	30	129994.94	129994.94	0.00	109737.30	20257.64	1	1	0
662	542	1	262	102	34	16559.20	16559.20	0.00	13081.80	3477.40	1	1	0
663	650	4	856	64	9	125209.06	125209.06	0.00	96635.25	28573.81	1	1	0
664	662	1000	442	64	50	72317.91	0.00	72317.91	60236.22	12081.69	1	0	1
665	293	4	694	229	29	137656.92	137656.92	0.00	100643.44	37013.48	1	1	0
666	705	1000	551	71	45	8468.84	0.00	8468.84	5758.82	2710.02	1	0	1
667	150	1000	598	244	30	177033.71	0.00	177033.71	125724.75	51308.96	1	0	1
668	242	1000	590	223	48	94656.29	0.00	94656.29	68365.17	26291.12	1	0	1
669	284	1000	654	103	31	112345.51	0.00	112345.51	98572.93	13772.58	1	0	1
670	177	2	1129	140	45	28176.88	28176.88	0.00	19442.04	8734.84	1	1	0
671	760	1000	43	180	16	88606.26	0.00	88606.26	60133.78	28472.48	1	0	1
672	582	1000	531	51	13	75786.90	0.00	75786.90	59113.80	16673.10	1	0	1
673	251	4	974	164	22	152947.65	152947.65	0.00	117456.26	35491.39	1	1	0
674	222	1000	958	57	7	135433.04	0.00	135433.04	97214.72	38218.32	1	0	1
675	290	3	198	127	48	124324.74	124324.74	0.00	99372.43	24952.31	1	1	0
676	175	1000	130	61	13	46234.91	0.00	46234.91	32458.26	13776.65	1	0	1
677	389	1000	845	117	30	6862.70	0.00	6862.70	4941.10	1921.60	1	0	1
678	122	1000	714	63	5	64041.81	0.00	64041.81	44418.48	19623.33	1	0	1
679	852	1000	21	64	35	77357.17	0.00	77357.17	55572.02	21785.15	1	0	1
680	229	1	77	72	15	212059.93	212059.93	0.00	175649.18	36410.75	1	1	0
681	808	1000	901	85	41	160327.54	0.00	160327.54	127253.19	33074.35	1	0	1
682	652	3	912	152	34	10702.65	10702.65	0.00	7714.82	2987.83	1	1	0
683	706	1000	713	22	6	143997.89	0.00	143997.89	111470.12	32527.77	1	0	1
684	874	1000	307	49	9	191997.86	0.00	191997.86	150735.17	41262.69	1	0	1
685	250	1000	563	200	15	33356.94	0.00	33356.94	20681.28	12675.66	1	0	1
686	485	2	458	107	27	85299.14	85299.14	0.00	66503.73	18795.41	1	1	0
687	513	1000	202	158	35	156920.91	0.00	156920.91	110693.39	46227.52	1	0	1
688	177	1	877	183	31	229643.64	229643.64	0.00	177020.96	52622.68	1	1	0
689	766	1000	686	94	36	120604.46	0.00	120604.46	85836.21	34768.25	1	0	1
690	364	1000	305	91	8	157960.21	0.00	157960.21	118366.30	39593.91	1	0	1
691	207	3	260	214	35	107705.68	107705.68	0.00	84977.35	22728.33	1	1	0
692	720	1000	795	67	47	106573.88	0.00	106573.88	67597.47	38976.41	1	0	1
693	578	2	560	145	42	107516.72	107516.72	0.00	81134.37	26382.35	1	1	0
694	443	1	448	30	30	60923.47	60923.47	0.00	41989.55	18933.92	1	1	0
695	358	1	365	36	29	213664.05	213664.05	0.00	170382.90	43281.15	1	1	0
696	310	4	461	81	29	83927.32	83927.32	0.00	63985.39	19941.93	1	1	0
697	426	1000	403	107	16	39252.36	0.00	39252.36	27052.80	12199.56	1	0	1
698	177	1000	1211	29	11	151792.93	0.00	151792.93	127737.69	24055.24	1	0	1
699	673	1000	64	198	10	196269.65	0.00	196269.65	133405.16	62864.49	1	0	1
700	198	4	439	87	33	36790.67	36790.67	0.00	31687.06	5103.61	1	1	0
701	18	3	382	240	5	7494.88	7494.88	0.00	5546.22	1948.66	1	1	0
702	877	1000	234	31	44	201371.51	0.00	201371.51	136465.24	64906.27	1	0	1
703	177	1000	69	15	43	141633.83	0.00	141633.83	91952.38	49681.45	1	0	1
704	258	4	252	240	27	203454.56	203454.56	0.00	148118.59	55335.97	1	1	0
705	794	1000	579	245	32	153779.73	0.00	153779.73	102168.62	51611.11	1	0	1
706	68	2	581	221	34	48586.37	48586.37	0.00	37036.17	11550.20	1	1	0
707	434	4	85	127	9	4267.20	4267.20	0.00	3584.40	682.80	1	1	0
708	605	1000	144	105	1	12443.65	0.00	12443.65	10412.37	2031.28	1	0	1
709	670	3	97	90	15	73414.86	73414.86	0.00	55728.97	17685.89	1	1	0
710	805	1000	347	80	31	108423.32	0.00	108423.32	69515.49	38907.83	1	0	1
711	569	2	435	166	48	13841.30	13841.30	0.00	8996.84	4844.46	1	1	0
712	177	1000	35	242	30	112680.24	0.00	112680.24	89314.18	23366.06	1	0	1
713	246	1000	985	198	17	149171.82	0.00	149171.82	120054.29	29117.53	1	0	1
714	540	1000	648	86	47	85259.48	0.00	85259.48	65867.24	19392.24	1	0	1
715	27	1000	9	43	23	76764.47	0.00	76764.47	58233.10	18531.37	1	0	1
716	755	4	540	104	44	154963.49	154963.49	0.00	124192.98	30770.51	1	1	0
717	260	1	258	35	19	190973.12	190973.12	0.00	141263.28	49709.84	1	1	0
718	810	1000	599	20	6	97539.47	0.00	97539.47	77299.66	20239.81	1	0	1
719	500	3	627	179	29	123908.35	123908.35	0.00	98353.03	25555.32	1	1	0
720	39	1000	661	188	26	36831.06	0.00	36831.06	24676.82	12154.24	1	0	1
721	388	1000	653	12	1	40258.07	0.00	40258.07	28487.87	11770.20	1	0	1
722	183	1000	353	240	38	203016.31	0.00	203016.31	172397.69	30618.62	1	0	1
723	250	1000	360	181	32	103742.75	0.00	103742.75	73509.86	30232.89	1	0	1
724	145	1	861	165	9	28281.64	28281.64	0.00	20645.60	7636.04	1	1	0
725	321	4	487	53	12	84190.00	84190.00	0.00	60658.75	23531.25	1	1	0
726	530	1000	19	64	21	3291.48	0.00	3291.48	2304.04	987.44	1	0	1
727	590	1000	843	216	10	198380.12	0.00	198380.12	150422.88	47957.24	1	0	1
728	579	1000	718	84	45	154654.58	0.00	154654.58	117805.34	36849.24	1	0	1
729	806	1000	92	37	3	132574.53	0.00	132574.53	105115.64	27458.89	1	0	1
730	792	1000	535	6	48	107310.86	0.00	107310.86	71635.16	35675.70	1	0	1
731	644	1000	995	173	22	233819.99	0.00	233819.99	181085.45	52734.54	1	0	1
732	746	1000	858	206	24	33731.04	0.00	33731.04	26216.22	7514.82	1	0	1
733	107	1000	359	28	8	132046.51	0.00	132046.51	114760.51	17286.00	1	0	1
734	136	3	35	241	35	18403.26	18403.26	0.00	13986.48	4416.78	1	1	0
735	704	3	645	236	10	208575.14	208575.14	0.00	153096.79	55478.35	1	1	0
736	218	1	346	172	11	126509.22	126509.22	0.00	102639.79	23869.43	1	1	0
737	720	1000	910	153	10	239960.03	0.00	239960.03	182939.57	57020.46	1	0	1
738	130	1000	207	187	37	64005.70	0.00	64005.70	52640.51	11365.19	1	0	1
739	374	2	683	74	26	51791.16	51791.16	0.00	36685.86	15105.30	1	1	0
740	580	2	89	204	37	28014.72	28014.72	0.00	20730.90	7283.82	1	1	0
741	326	1000	216	220	43	26450.44	0.00	26450.44	17930.09	8520.35	1	0	1
742	847	2	158	182	48	96807.30	96807.30	0.00	65885.58	30921.72	1	1	0
743	697	1000	928	29	3	15116.04	0.00	15116.04	12243.96	2872.08	1	0	1
744	631	1	177	14	2	152690.51	152690.51	0.00	114963.64	37726.87	1	1	0
745	693	1000	191	133	3	43309.04	0.00	43309.04	29024.29	14284.75	1	0	1
746	563	1000	262	62	29	45664.88	0.00	45664.88	37737.11	7927.77	1	0	1
747	391	1000	807	205	47	174428.15	0.00	174428.15	134332.14	40096.01	1	0	1
748	498	2	686	32	27	115946.42	115946.42	0.00	85607.60	30338.82	1	1	0
749	316	1	778	237	39	36248.52	36248.52	0.00	31933.47	4315.05	1	1	0
750	295	1000	11	80	50	98117.70	0.00	98117.70	58870.60	39247.10	1	0	1
751	596	1000	56	188	33	96760.43	0.00	96760.43	73116.06	23644.37	1	0	1
752	302	4	218	162	20	114800.33	114800.33	0.00	95360.81	19439.52	1	1	0
753	616	1000	172	230	44	40801.95	0.00	40801.95	31825.50	8976.45	1	0	1
754	259	1	324	1	31	14651.70	14651.70	0.00	9670.14	4981.56	1	1	0
755	384	4	268	41	13	69698.62	69698.62	0.00	49182.21	20516.41	1	1	0
756	570	1000	556	209	39	94099.78	0.00	94099.78	77629.43	16470.35	1	0	1
757	807	2	169	181	20	44672.46	44672.46	0.00	35586.99	9085.47	1	1	0
758	177	3	921	200	35	22581.68	22581.68	0.00	16484.64	6097.04	1	1	0
759	386	4	977	131	25	28039.54	28039.54	0.00	22974.74	5064.80	1	1	0
760	296	1000	305	27	21	53606.06	0.00	53606.06	45150.60	8455.46	1	0	1
761	138	4	800	60	46	14662.12	14662.12	0.00	12566.65	2095.47	1	1	0
762	48	1000	931	30	35	93088.71	0.00	93088.71	66705.78	26382.93	1	0	1
763	313	1	218	151	30	143222.31	143222.31	0.00	121596.81	21625.50	1	1	0
764	177	1000	277	68	41	110547.71	0.00	110547.71	92402.91	18144.80	1	0	1
765	547	1	671	103	44	105668.26	105668.26	0.00	84099.26	21569.00	1	1	0
766	177	1000	1197	91	35	100711.93	0.00	100711.93	75054.02	25657.91	1	0	1
767	216	3	916	72	6	106724.83	106724.83	0.00	91949.75	14775.08	1	1	0
768	506	1000	812	173	2	129651.09	0.00	129651.09	92625.46	37025.63	1	0	1
769	14	1000	923	207	49	15742.03	0.00	15742.03	12370.38	3371.65	1	0	1
770	177	1000	738	61	28	7593.52	0.00	7593.52	6226.69	1366.83	1	0	1
771	193	3	550	139	20	121286.35	121286.35	0.00	86228.25	35058.10	1	1	0
772	327	1	213	217	44	52280.11	52280.11	0.00	42052.93	10227.18	1	1	0
773	670	4	868	4	22	73407.52	73407.52	0.00	61107.94	12299.58	1	1	0
774	161	1000	315	1	30	179862.76	0.00	179862.76	136999.38	42863.38	1	0	1
775	121	1000	778	111	29	47587.94	0.00	47587.94	34038.94	13549.00	1	0	1
776	91	2	654	37	29	26218.29	26218.29	0.00	18352.80	7865.49	1	1	0
777	425	2	515	66	18	160532.64	160532.64	0.00	135792.23	24740.41	1	1	0
778	343	1000	55	227	41	27624.91	0.00	27624.91	17204.10	10420.81	1	0	1
779	305	1000	376	132	44	57198.41	0.00	57198.41	40976.88	16221.53	1	0	1
780	177	1000	817	30	42	90497.60	0.00	90497.60	70366.95	20130.65	1	0	1
781	581	1000	164	229	3	47011.40	0.00	47011.40	36589.02	10422.38	1	0	1
782	377	1000	240	244	39	24925.26	0.00	24925.26	17447.67	7477.59	1	0	1
783	389	1000	893	237	20	37171.52	0.00	37171.52	24161.48	13010.04	1	0	1
784	205	4	752	19	42	172211.04	172211.04	0.00	143977.74	28233.30	1	1	0
785	177	4	627	132	12	77282.08	77282.08	0.00	61571.98	15710.10	1	1	0
786	560	1000	721	109	6	60214.67	0.00	60214.67	37417.55	22797.12	1	0	1
787	793	2	677	184	12	93144.13	93144.13	0.00	68337.18	24806.95	1	1	0
788	685	1000	618	70	29	122410.24	0.00	122410.24	98143.76	24266.48	1	0	1
789	457	2	47	86	9	171674.17	171674.17	0.00	123709.85	47964.32	1	1	0
790	508	1000	685	243	10	133748.85	0.00	133748.85	104096.71	29652.14	1	0	1
791	253	3	570	169	24	60970.09	60970.09	0.00	49944.95	11025.14	1	1	0
792	156	1	127	212	46	30162.30	30162.30	0.00	22832.22	7330.08	1	1	0
793	547	1000	37	80	10	131494.88	0.00	131494.88	106994.97	24499.91	1	0	1
794	132	3	347	192	45	126754.92	126754.92	0.00	97601.23	29153.69	1	1	0
795	304	2	908	249	27	17535.79	17535.79	0.00	13225.74	4310.05	1	1	0
796	299	3	648	169	50	53517.29	53517.29	0.00	39231.99	14285.30	1	1	0
797	877	1000	44	158	4	171942.91	0.00	171942.91	124408.70	47534.21	1	0	1
798	260	3	58	178	16	113165.23	113165.23	0.00	85008.21	28157.02	1	1	0
799	127	1000	382	21	20	32849.75	0.00	32849.75	25951.30	6898.45	1	0	1
800	661	4	586	176	24	153627.13	153627.13	0.00	106002.48	47624.65	1	1	0
801	56	2	162	78	9	60062.74	60062.74	0.00	50885.68	9177.06	1	1	0
802	435	4	95	37	16	218520.94	218520.94	0.00	167349.74	51171.20	1	1	0
803	173	3	909	203	10	170789.72	170789.72	0.00	133782.09	37007.63	1	1	0
804	216	1000	80	203	19	63540.30	0.00	63540.30	44075.00	19465.30	1	0	1
805	573	1000	868	206	19	122108.25	0.00	122108.25	93297.98	28810.27	1	0	1
806	352	1000	343	91	10	11868.54	0.00	11868.54	8782.74	3085.80	1	0	1
807	62	1000	578	68	34	8753.05	0.00	8753.05	6214.65	2538.40	1	0	1
808	165	3	444	73	16	123825.52	123825.52	0.00	93438.50	30387.02	1	1	0
809	209	1	460	182	45	45832.65	45832.65	0.00	33940.58	11892.07	1	1	0
810	851	1000	643	176	40	14876.38	0.00	14876.38	11925.22	2951.16	1	0	1
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
3343	177	1000	566	109	17	11680.30	0.00	11680.30	8176.20	3504.10	1	0	1
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
861	177	4	402	66	40	128977.32	128977.32	0.00	105355.93	23621.39	1	1	0
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
873	324	3	141	153	7	149285.55	149285.55	0.00	110352.45	38933.10	1	1	0
874	603	1000	183	166	16	11861.04	0.00	11861.04	7353.84	4507.20	1	0	1
875	189	1	811	128	21	63738.27	63738.27	0.00	40155.12	23583.15	1	1	0
876	837	1000	660	211	13	19240.90	0.00	19240.90	13853.45	5387.45	1	0	1
877	439	1000	657	20	18	29376.92	0.00	29376.92	20563.84	8813.08	1	0	1
878	591	1000	627	229	44	27802.97	0.00	27802.97	20952.40	6850.57	1	0	1
879	650	4	406	124	39	76752.59	76752.59	0.00	56540.53	20212.06	1	1	0
880	12	1	782	155	22	68653.46	68653.46	0.00	48952.37	19701.09	1	1	0
881	33	1000	406	109	45	54231.93	0.00	54231.93	42300.90	11931.03	1	0	1
882	381	1000	62	94	31	7765.94	0.00	7765.94	6601.04	1164.90	1	0	1
883	486	4	611	28	5	16414.80	16414.80	0.00	12639.36	3775.44	1	1	0
884	259	3	993	195	1	141731.19	141731.19	0.00	103380.69	38350.50	1	1	0
885	201	4	65	137	46	22235.30	22235.30	0.00	15120.00	7115.30	1	1	0
886	704	2	363	74	20	54647.79	54647.79	0.00	39858.26	14789.53	1	1	0
887	101	1000	273	130	5	193536.90	0.00	193536.90	143731.66	49805.24	1	0	1
888	65	1000	784	146	23	144982.50	0.00	144982.50	102413.02	42569.48	1	0	1
889	863	1	483	64	43	35621.19	35621.19	0.00	24888.51	10732.68	1	1	0
890	177	1000	675	84	14	75108.99	0.00	75108.99	57874.60	17234.39	1	0	1
891	191	4	474	137	45	39177.64	39177.64	0.00	30856.73	8320.91	1	1	0
892	23	2	61	46	24	16701.84	16701.84	0.00	11691.28	5010.56	1	1	0
893	336	1000	567	133	42	65684.82	0.00	65684.82	42528.74	23156.08	1	0	1
894	867	1000	546	196	48	29907.28	0.00	29907.28	19680.02	10227.26	1	0	1
895	657	3	342	4	40	2046.68	2046.68	0.00	1248.48	798.20	1	1	0
896	245	1	139	234	4	26825.82	26825.82	0.00	21192.43	5633.39	1	1	0
897	2	4	530	239	13	8086.60	8086.60	0.00	5418.02	2668.58	1	1	0
898	177	4	151	233	17	62640.44	62640.44	0.00	50254.04	12386.40	1	1	0
899	826	1000	828	199	39	124721.01	0.00	124721.01	102195.10	22525.91	1	0	1
900	680	1	900	66	41	70311.82	70311.82	0.00	54511.26	15800.56	1	1	0
901	473	1000	803	64	25	96354.15	0.00	96354.15	78647.94	17706.21	1	0	1
902	373	1000	134	48	46	137164.52	0.00	137164.52	99851.23	37313.29	1	0	1
903	452	1000	62	221	20	161397.92	0.00	161397.92	132268.79	29129.13	1	0	1
904	815	1	179	96	44	57946.56	57946.56	0.00	42794.01	15152.55	1	1	0
905	574	1000	634	193	42	64820.07	0.00	64820.07	48913.29	15906.78	1	0	1
906	838	2	248	164	48	95922.98	95922.98	0.00	68200.63	27722.35	1	1	0
907	74	1000	476	168	26	91214.59	0.00	91214.59	70029.44	21185.15	1	0	1
908	762	1000	863	134	42	117867.71	0.00	117867.71	87134.03	30733.68	1	0	1
909	32	1000	176	231	38	56956.40	0.00	56956.40	43286.88	13669.52	1	0	1
910	142	3	538	127	48	125716.53	125716.53	0.00	94838.89	30877.64	1	1	0
911	615	2	160	56	50	175681.61	175681.61	0.00	125520.31	50161.30	1	1	0
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
937	142	4	492	139	5	18884.52	18884.52	0.00	14163.39	4721.13	1	1	0
938	712	3	962	97	25	19022.60	19022.60	0.00	16930.10	2092.50	1	1	0
939	24	1000	586	49	16	95160.08	0.00	95160.08	72363.74	22796.34	1	0	1
940	744	3	649	190	11	116131.05	116131.05	0.00	82212.78	33918.27	1	1	0
941	657	1000	723	170	42	170159.86	0.00	170159.86	122999.36	47160.50	1	0	1
942	390	1	806	60	33	109075.86	109075.86	0.00	79893.16	29182.70	1	1	0
943	735	2	578	200	32	31248.80	31248.80	0.00	21874.20	9374.60	1	1	0
944	482	1000	446	147	39	149590.91	0.00	149590.91	108625.20	40965.71	1	0	1
945	102	3	275	17	8	89072.06	89072.06	0.00	65169.09	23902.97	1	1	0
946	22	1000	475	3	47	45852.59	0.00	45852.59	33944.71	11907.88	1	0	1
947	825	3	611	235	21	83571.73	83571.73	0.00	54883.14	28688.59	1	1	0
948	114	3	90	247	36	105433.45	105433.45	0.00	90140.06	15293.39	1	1	0
949	258	1000	287	130	32	60149.48	0.00	60149.48	51861.92	8287.56	1	0	1
950	137	1000	803	67	27	79486.40	0.00	79486.40	54589.64	24896.76	1	0	1
951	253	2	742	106	12	201357.20	201357.20	0.00	156230.34	45126.86	1	1	0
952	158	2	757	218	47	40051.08	40051.08	0.00	31239.81	8811.27	1	1	0
953	256	2	133	201	2	5756.52	5756.52	0.00	4649.48	1107.04	1	1	0
954	288	1000	202	60	38	10943.30	0.00	10943.30	7879.20	3064.10	1	0	1
955	403	1000	5	86	14	51399.04	0.00	51399.04	36010.82	15388.22	1	0	1
956	37	1	960	92	2	43352.67	43352.67	0.00	30973.26	12379.41	1	1	0
957	177	1000	665	216	23	140439.89	0.00	140439.89	116367.39	24072.50	1	0	1
958	754	1000	473	184	5	63555.20	0.00	63555.20	41310.88	22244.32	1	0	1
959	669	3	626	180	29	89527.68	89527.68	0.00	59088.24	30439.44	1	1	0
960	142	2	705	48	37	222031.21	222031.21	0.00	181837.05	40194.16	1	1	0
961	660	1000	71	170	4	117359.04	0.00	117359.04	92031.36	25327.68	1	0	1
962	852	1000	264	37	20	109031.50	0.00	109031.50	76052.72	32978.78	1	0	1
963	153	4	322	118	20	36988.62	36988.62	0.00	26815.91	10172.71	1	1	0
964	691	1000	654	159	29	7200.06	0.00	7200.06	5544.04	1656.02	1	0	1
965	162	1000	305	148	41	44063.02	0.00	44063.02	37012.96	7050.06	1	0	1
966	848	2	476	80	28	120669.26	120669.26	0.00	89914.86	30754.40	1	1	0
967	112	1000	813	191	49	126100.24	0.00	126100.24	88367.13	37733.11	1	0	1
968	138	1000	682	125	6	12082.86	0.00	12082.86	9487.23	2595.63	1	0	1
969	285	1000	78	109	22	68477.27	0.00	68477.27	50556.80	17920.47	1	0	1
970	725	4	357	42	50	180884.11	180884.11	0.00	136093.93	44790.18	1	1	0
971	650	4	823	71	37	8507.65	8507.65	0.00	5308.69	3198.96	1	1	0
972	177	1000	163	171	8	169061.62	0.00	169061.62	124271.18	44790.44	1	0	1
973	465	1	437	132	40	93580.25	93580.25	0.00	63163.91	30416.34	1	1	0
974	26	4	634	172	47	241142.14	241142.14	0.00	165243.14	75899.00	1	1	0
975	177	1000	144	71	48	60551.09	0.00	60551.09	46229.86	14321.23	1	0	1
976	314	1000	591	157	15	38590.82	0.00	38590.82	32183.16	6407.66	1	0	1
977	276	2	85	149	11	436.24	436.24	0.00	283.56	152.68	1	1	0
978	252	4	89	24	33	127400.94	127400.94	0.00	112691.34	14709.60	1	1	0
979	349	1000	421	98	10	10797.69	0.00	10797.69	8704.01	2093.68	1	0	1
980	33	4	902	172	38	88015.62	88015.62	0.00	69252.88	18762.74	1	1	0
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
1016	177	2	815	151	27	93506.66	93506.66	0.00	71740.20	21766.46	1	1	0
1017	802	2	679	162	32	68436.88	68436.88	0.00	48084.61	20352.27	1	1	0
1018	696	1000	255	202	30	127338.82	0.00	127338.82	102647.44	24691.38	1	0	1
1019	203	3	659	119	8	149179.06	149179.06	0.00	105310.79	43868.27	1	1	0
1020	311	2	234	222	16	143525.45	143525.45	0.00	122262.26	21263.19	1	1	0
1021	418	4	847	248	4	222305.59	222305.59	0.00	158634.05	63671.54	1	1	0
1022	138	1	627	163	20	1533.06	1533.06	0.00	950.49	582.57	1	1	0
1023	85	1	284	30	44	10121.01	10121.01	0.00	8501.64	1619.37	1	1	0
1024	154	4	174	18	29	4628.67	4628.67	0.00	3147.50	1481.17	1	1	0
1025	493	1000	576	102	33	184918.59	0.00	184918.59	136035.04	48883.55	1	0	1
1026	771	1000	956	133	6	239616.30	0.00	239616.30	183082.08	56534.22	1	0	1
1027	878	1000	233	70	14	53602.83	0.00	53602.83	36033.66	17569.17	1	0	1
1028	783	3	652	43	17	78413.73	78413.73	0.00	63841.54	14572.19	1	1	0
1029	140	1000	531	133	31	154898.79	0.00	154898.79	104439.41	50459.38	1	0	1
1030	627	4	57	41	41	124713.88	124713.88	0.00	92588.96	32124.92	1	1	0
1031	699	1000	787	131	27	65228.26	0.00	65228.26	45287.25	19941.01	1	0	1
1032	199	1000	692	193	49	136469.41	0.00	136469.41	104574.77	31894.64	1	0	1
1033	655	2	518	172	18	41704.59	41704.59	0.00	28304.16	13400.43	1	1	0
1034	371	2	45	73	43	90315.57	90315.57	0.00	72775.36	17540.21	1	1	0
1035	156	3	549	21	46	19083.04	19083.04	0.00	12213.16	6869.88	1	1	0
1036	205	3	100	210	34	115017.29	115017.29	0.00	95762.30	19254.99	1	1	0
1037	194	3	407	210	49	22457.91	22457.91	0.00	14148.48	8309.43	1	1	0
1038	805	1	246	164	45	63214.56	63214.56	0.00	42985.92	20228.64	1	1	0
1039	726	1000	505	143	46	132007.52	0.00	132007.52	95756.24	36251.28	1	0	1
1040	560	1000	944	118	40	99945.56	0.00	99945.56	66422.96	33522.60	1	0	1
1041	344	1000	188	229	5	50734.49	0.00	50734.49	32807.50	17926.99	1	0	1
1042	124	1000	794	17	21	89975.45	0.00	89975.45	76142.30	13833.15	1	0	1
1043	367	1000	994	105	17	68124.37	0.00	68124.37	55048.82	13075.55	1	0	1
1044	140	3	967	191	43	23600.70	23600.70	0.00	20532.60	3068.10	1	1	0
1045	34	4	758	116	19	98254.20	98254.20	0.00	70306.38	27947.82	1	1	0
1046	603	1000	61	11	36	22271.80	0.00	22271.80	17372.01	4899.79	1	0	1
1047	227	1000	819	202	2	81831.84	0.00	81831.84	61651.36	20180.48	1	0	1
1048	106	4	168	224	15	63006.88	63006.88	0.00	48141.96	14864.92	1	1	0
1049	177	2	939	244	15	150279.60	150279.60	0.00	115600.66	34678.94	1	1	0
1050	768	1	840	24	32	38854.00	38854.00	0.00	23700.95	15153.05	1	1	0
1051	787	1	762	206	25	61310.27	61310.27	0.00	47362.70	13947.57	1	1	0
1052	528	1	306	18	28	67723.39	67723.39	0.00	51257.51	16465.88	1	1	0
1053	812	3	915	36	11	81938.56	81938.56	0.00	66814.56	15124.00	1	1	0
1054	450	1000	768	43	24	117798.30	0.00	117798.30	88593.19	29205.11	1	0	1
1055	426	1	615	40	24	80716.14	80716.14	0.00	65423.50	15292.64	1	1	0
1056	641	1000	902	64	14	19217.49	0.00	19217.49	14954.94	4262.55	1	0	1
1057	316	1000	810	80	49	42031.04	0.00	42031.04	30235.54	11795.50	1	0	1
1058	256	3	469	233	48	63692.72	63692.72	0.00	43311.04	20381.68	1	1	0
1059	447	1000	361	61	26	111231.92	0.00	111231.92	81809.68	29422.24	1	0	1
1060	870	4	716	172	50	208797.39	208797.39	0.00	178629.95	30167.44	1	1	0
1061	410	1000	18	156	15	98061.16	0.00	98061.16	81250.44	16810.72	1	0	1
1062	496	1	972	44	50	45019.58	45019.58	0.00	30524.36	14495.22	1	1	0
1063	807	2	969	67	38	84870.18	84870.18	0.00	59055.74	25814.44	1	1	0
1064	74	3	701	32	40	273757.92	273757.92	0.00	215328.53	58429.39	1	1	0
1065	596	3	313	100	49	66127.62	66127.62	0.00	57283.26	8844.36	1	1	0
1066	6	1000	862	61	38	47323.64	0.00	47323.64	37549.46	9774.18	1	0	1
1067	810	1000	813	41	41	63765.30	0.00	63765.30	45911.00	17854.30	1	0	1
1068	236	4	879	168	23	91611.09	91611.09	0.00	60253.61	31357.48	1	1	0
1069	449	2	384	250	21	1194.18	1194.18	0.00	776.22	417.96	1	1	0
1070	19	1	495	100	39	146316.59	146316.59	0.00	105815.86	40500.73	1	1	0
1071	269	1000	313	218	12	66341.91	0.00	66341.91	50593.49	15748.42	1	0	1
1072	834	2	302	188	29	121192.74	121192.74	0.00	87680.05	33512.69	1	1	0
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
1083	177	1000	199	236	22	114882.76	0.00	114882.76	87069.56	27813.20	1	0	1
1084	564	2	327	90	50	152151.48	152151.48	0.00	118383.81	33767.67	1	1	0
1085	437	1000	865	160	40	72908.43	0.00	72908.43	54326.97	18581.46	1	0	1
1086	438	1	943	134	25	63159.12	63159.12	0.00	46902.76	16256.36	1	1	0
1087	417	1	556	192	5	89004.42	89004.42	0.00	71881.38	17123.04	1	1	0
1088	452	1000	268	114	14	60515.92	0.00	60515.92	49354.09	11161.83	1	0	1
1089	42	3	190	23	20	85466.23	85466.23	0.00	60353.95	25112.28	1	1	0
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
1163	557	3	705	28	44	135428.06	135428.06	0.00	111494.25	23933.81	1	1	0
1164	267	1000	365	232	26	88363.79	0.00	88363.79	60793.44	27570.35	1	0	1
1165	805	1000	281	244	49	51479.10	0.00	51479.10	44272.00	7207.10	1	0	1
1166	79	1	203	223	48	236526.61	236526.61	0.00	171309.32	65217.29	1	1	0
1167	291	2	573	115	2	196347.36	196347.36	0.00	123396.61	72950.75	1	1	0
1168	76	4	792	19	5	116964.88	116964.88	0.00	95064.31	21900.57	1	1	0
1169	261	1	332	153	42	139056.34	139056.34	0.00	99309.58	39746.76	1	1	0
1170	332	1000	438	101	25	89485.96	0.00	89485.96	70484.38	19001.58	1	0	1
1171	670	4	689	224	37	58396.94	58396.94	0.00	37957.99	20438.95	1	1	0
1172	522	1000	904	108	13	35044.78	0.00	35044.78	24733.94	10310.84	1	0	1
1173	275	1000	685	97	6	73565.24	0.00	73565.24	47379.69	26185.55	1	0	1
1174	56	2	777	181	3	71343.58	71343.58	0.00	53249.55	18094.03	1	1	0
1175	538	3	876	116	39	62499.42	62499.42	0.00	54938.58	7560.84	1	1	0
1176	103	1000	644	4	12	1499.26	0.00	1499.26	1334.34	164.92	1	0	1
1177	177	1	328	117	45	51761.80	51761.80	0.00	36519.61	15242.19	1	1	0
1178	477	1000	484	151	37	89501.48	0.00	89501.48	72825.98	16675.50	1	0	1
1179	624	2	776	175	18	87246.41	87246.41	0.00	61487.51	25758.90	1	1	0
1180	222	1000	158	106	4	37269.44	0.00	37269.44	29252.54	8016.90	1	0	1
1181	123	2	71	31	16	16732.17	16732.17	0.00	11247.83	5484.34	1	1	0
1182	818	1000	376	145	6	87617.14	0.00	87617.14	67116.03	20501.11	1	0	1
1183	706	4	658	64	33	39441.81	39441.81	0.00	27319.89	12121.92	1	1	0
1184	854	2	536	165	38	53827.72	53827.72	0.00	39552.92	14274.80	1	1	0
1185	748	1000	711	105	39	105352.28	0.00	105352.28	84391.56	20960.72	1	0	1
1186	304	1000	62	245	9	28932.57	0.00	28932.57	23243.39	5689.18	1	0	1
1187	84	1000	91	5	4	4767.36	0.00	4767.36	4242.96	524.40	1	0	1
1188	833	1000	527	55	19	60898.20	0.00	60898.20	50482.40	10415.80	1	0	1
1189	177	1000	577	214	1	39522.05	0.00	39522.05	29752.38	9769.67	1	0	1
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
1236	842	1000	593	118	19	28344.25	0.00	28344.25	20407.85	7936.40	1	0	1
1237	549	1000	673	142	37	70600.00	0.00	70600.00	46596.00	24004.00	1	0	1
1238	677	1000	258	187	12	44930.40	0.00	44930.40	37292.25	7638.15	1	0	1
1239	177	1000	478	9	48	43251.74	0.00	43251.74	32084.46	11167.28	1	0	1
1240	833	3	101	7	24	72701.90	72701.90	0.00	49703.43	22998.47	1	1	0
1241	850	1000	570	203	34	9272.76	0.00	9272.76	7696.38	1576.38	1	0	1
1242	220	1000	524	53	25	79431.03	0.00	79431.03	67071.92	12359.11	1	0	1
1243	208	1	40	212	3	81970.86	81970.86	0.00	63015.15	18955.71	1	1	0
1244	773	4	391	173	48	68736.46	68736.46	0.00	54354.89	14381.57	1	1	0
1245	673	3	933	247	2	188141.36	188141.36	0.00	143616.91	44524.45	1	1	0
1246	144	3	879	226	18	104270.08	104270.08	0.00	65068.76	39201.32	1	1	0
1247	376	1000	514	123	34	95469.51	0.00	95469.51	74605.93	20863.58	1	0	1
1248	731	4	398	135	1	116767.34	116767.34	0.00	91211.35	25555.99	1	1	0
1249	126	1000	72	187	18	69673.02	0.00	69673.02	56563.93	13109.09	1	0	1
1250	177	1000	69	125	1	91678.38	0.00	91678.38	72857.44	18820.94	1	0	1
1251	471	4	680	225	19	212609.05	212609.05	0.00	158446.50	54162.55	1	1	0
1252	872	1000	400	180	42	87273.60	0.00	87273.60	56727.80	30545.80	1	0	1
1253	177	4	456	106	5	5046.39	5046.39	0.00	3784.79	1261.60	1	1	0
1254	31	1000	603	171	2	104160.27	0.00	104160.27	86787.97	17372.30	1	0	1
1255	148	1000	537	24	2	56098.67	0.00	56098.67	43513.54	12585.13	1	0	1
1256	329	1000	257	100	28	109735.30	0.00	109735.30	79944.52	29790.78	1	0	1
1257	525	4	162	116	3	53107.27	53107.27	0.00	43820.03	9287.24	1	1	0
1258	106	1	405	226	35	106975.38	106975.38	0.00	74775.98	32199.40	1	1	0
1259	338	1000	179	68	22	55215.47	0.00	55215.47	41750.66	13464.81	1	0	1
1260	777	1000	903	81	30	81722.46	0.00	81722.46	59039.02	22683.44	1	0	1
1261	62	1000	291	80	23	148955.54	0.00	148955.54	111314.12	37641.42	1	0	1
1262	477	1	323	159	35	189639.12	189639.12	0.00	138501.88	51137.24	1	1	0
1263	649	1000	430	128	47	107654.23	0.00	107654.23	90685.99	16968.24	1	0	1
1264	761	1000	477	174	35	53651.46	0.00	53651.46	37075.88	16575.58	1	0	1
1265	11	1	697	178	36	19741.59	19741.59	0.00	13166.34	6575.25	1	1	0
1266	559	3	975	17	14	1031.08	1031.08	0.00	814.56	216.52	1	1	0
1267	177	1	1026	248	10	68621.88	68621.88	0.00	52446.60	16175.28	1	1	0
1268	697	2	981	154	14	53657.76	53657.76	0.00	42965.03	10692.73	1	1	0
1269	177	3	545	141	50	99610.93	99610.93	0.00	59992.66	39618.27	1	1	0
1270	25	3	878	102	31	90586.19	90586.19	0.00	74643.49	15942.70	1	1	0
1271	599	1000	537	30	44	135776.55	0.00	135776.55	89700.79	46075.76	1	0	1
1272	696	1	834	91	47	111765.39	111765.39	0.00	88960.51	22804.88	1	1	0
1273	398	1000	591	141	4	2773.13	0.00	2773.13	2052.12	721.01	1	0	1
1274	538	1000	71	134	9	227205.90	0.00	227205.90	163964.80	63241.10	1	0	1
1275	86	2	570	45	3	128350.21	128350.21	0.00	99675.05	28675.16	1	1	0
1276	272	1000	581	39	19	101942.15	0.00	101942.15	71014.01	30928.14	1	0	1
1277	326	1	308	36	24	121483.60	121483.60	0.00	99314.89	22168.71	1	1	0
1278	220	4	438	204	3	189920.50	189920.50	0.00	142651.57	47268.93	1	1	0
1279	870	1	12	237	37	12143.20	12143.20	0.00	10051.62	2091.58	1	1	0
1280	80	3	372	98	18	56257.87	56257.87	0.00	47456.55	8801.32	1	1	0
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
1309	150	1000	21	61	50	161146.08	0.00	161146.08	112227.88	48918.20	1	0	1
1310	67	3	989	63	37	89032.19	89032.19	0.00	56460.49	32571.70	1	1	0
1311	333	3	715	244	6	145760.35	145760.35	0.00	109799.81	35960.54	1	1	0
1312	732	2	885	205	11	156774.82	156774.82	0.00	117075.86	39698.96	1	1	0
1313	549	1	583	29	47	155220.22	155220.22	0.00	124240.10	30980.12	1	1	0
1314	214	1	935	152	28	46593.24	46593.24	0.00	40536.12	6057.12	1	1	0
1315	626	1	780	162	26	83673.08	83673.08	0.00	61718.85	21954.23	1	1	0
1316	177	1	730	164	23	128855.16	128855.16	0.00	99642.70	29212.46	1	1	0
1317	90	2	856	216	22	64955.28	64955.28	0.00	46111.71	18843.57	1	1	0
1318	575	1000	129	67	31	10738.94	0.00	10738.94	7624.64	3114.30	1	0	1
1319	465	1000	219	148	24	124156.55	0.00	124156.55	92541.35	31615.20	1	0	1
1320	448	1	4	94	9	259401.22	259401.22	0.00	212425.16	46976.06	1	1	0
1321	251	3	354	124	49	73641.94	73641.94	0.00	56827.05	16814.89	1	1	0
1322	177	1	8	253	23	23920.04	23920.04	0.00	17425.18	6494.86	1	1	0
1323	156	1	325	139	49	114498.20	114498.20	0.00	80147.60	34350.60	1	1	0
1324	288	3	496	98	39	29114.95	29114.95	0.00	22709.65	6405.30	1	1	0
1325	119	1000	748	34	1	13247.21	0.00	13247.21	10147.60	3099.61	1	0	1
1326	570	1000	719	59	15	252983.26	0.00	252983.26	196406.66	56576.60	1	0	1
1327	515	1000	247	84	20	74457.80	0.00	74457.80	64686.64	9771.16	1	0	1
1328	33	1000	826	174	22	217967.84	0.00	217967.84	162575.35	55392.49	1	0	1
1329	733	2	626	11	23	131247.73	131247.73	0.00	98010.05	33237.68	1	1	0
1330	670	1000	65	245	38	153501.50	0.00	153501.50	97194.90	56306.60	1	0	1
1331	503	4	983	253	39	43648.11	43648.11	0.00	29933.47	13714.64	1	1	0
1332	456	1000	307	198	4	123496.59	0.00	123496.59	87448.21	36048.38	1	0	1
1333	243	1000	641	161	33	79265.17	0.00	79265.17	56656.02	22609.15	1	0	1
1334	807	3	574	129	2	149401.00	149401.00	0.00	123978.87	25422.13	1	1	0
1335	786	1000	989	231	22	33931.84	0.00	33931.84	20359.12	13572.72	1	0	1
1336	542	1	126	30	10	78435.69	78435.69	0.00	53227.79	25207.90	1	1	0
1337	773	1000	352	124	20	31767.92	0.00	31767.92	21919.84	9848.08	1	0	1
1338	38	3	691	108	16	38330.96	38330.96	0.00	26831.68	11499.28	1	1	0
1339	739	1000	516	111	44	118579.40	0.00	118579.40	87465.39	31114.01	1	0	1
1340	740	2	993	151	31	127227.84	127227.84	0.00	103246.07	23981.77	1	1	0
1341	642	2	304	40	25	9104.83	9104.83	0.00	5553.95	3550.88	1	1	0
1342	505	1000	66	200	27	79886.22	0.00	79886.22	51275.07	28611.15	1	0	1
1343	149	2	662	153	48	62322.39	62322.39	0.00	46741.77	15580.62	1	1	0
1344	418	1000	260	141	31	132908.15	0.00	132908.15	89873.40	43034.75	1	0	1
1345	550	1000	4	160	43	11908.20	0.00	11908.20	8097.58	3810.62	1	0	1
1346	185	2	269	133	17	227946.62	227946.62	0.00	169327.43	58619.19	1	1	0
1347	177	2	1189	208	24	235449.74	235449.74	0.00	173246.45	62203.29	1	1	0
1348	817	3	943	20	33	38854.00	38854.00	0.00	23700.95	15153.05	1	1	0
1349	870	1000	761	56	39	45217.86	0.00	45217.86	28939.44	16278.42	1	0	1
1350	332	1	442	153	37	85078.58	85078.58	0.00	54220.26	30858.32	1	1	0
1351	597	3	477	137	42	20001.14	20001.14	0.00	13087.99	6913.15	1	1	0
1352	521	3	553	63	13	123603.05	123603.05	0.00	88825.27	34777.78	1	1	0
1353	379	1000	92	44	16	8160.39	0.00	8160.39	6365.10	1795.29	1	0	1
1354	73	2	21	156	40	25386.12	25386.12	0.00	19683.12	5703.00	1	1	0
1355	370	4	976	245	9	32627.55	32627.55	0.00	28712.25	3915.30	1	1	0
1356	612	2	924	70	47	10464.75	10464.75	0.00	8221.66	2243.09	1	1	0
1357	527	1	613	148	19	211678.99	211678.99	0.00	172675.05	39003.94	1	1	0
1358	71	1	86	170	39	72203.57	72203.57	0.00	51234.94	20968.63	1	1	0
1359	858	1000	351	191	24	17632.36	0.00	17632.36	11364.59	6267.77	1	0	1
1360	256	3	415	234	23	67101.75	67101.75	0.00	49959.32	17142.43	1	1	0
1361	753	1	805	115	25	97624.51	97624.51	0.00	73946.89	23677.62	1	1	0
1362	372	1000	226	193	14	147510.34	0.00	147510.34	121099.99	26410.35	1	0	1
1363	164	1000	833	133	8	4052.05	0.00	4052.05	2836.45	1215.60	1	0	1
1364	112	4	104	157	8	27125.00	27125.00	0.00	20886.25	6238.75	1	1	0
1365	143	1000	476	61	38	91972.82	0.00	91972.82	77068.82	14904.00	1	0	1
1366	136	1000	71	25	41	33708.24	0.00	33708.24	28314.90	5393.34	1	0	1
1367	790	1000	763	145	7	30191.22	0.00	30191.22	22039.56	8151.66	1	0	1
1368	731	1000	502	178	11	102420.84	0.00	102420.84	70850.52	31570.32	1	0	1
1369	610	1000	525	179	32	28197.47	0.00	28197.47	21430.08	6767.39	1	0	1
1370	133	4	482	116	38	23545.60	23545.60	0.00	20720.12	2825.48	1	1	0
1371	378	2	472	33	16	214343.15	214343.15	0.00	148040.10	66303.05	1	1	0
1372	82	1000	259	249	31	14629.09	0.00	14629.09	11118.10	3510.99	1	0	1
1373	437	1000	118	35	3	20153.48	0.00	20153.48	13431.09	6722.39	1	0	1
1374	358	3	417	214	48	90869.70	90869.70	0.00	64845.90	26023.80	1	1	0
1375	245	1000	39	152	3	115880.09	0.00	115880.09	88792.40	27087.69	1	0	1
1376	492	2	24	102	1	12051.54	12051.54	0.00	9400.20	2651.34	1	1	0
1377	606	1000	341	168	7	65917.08	0.00	65917.08	47274.86	18642.22	1	0	1
1378	533	1000	690	2	26	155400.83	0.00	155400.83	114586.69	40814.14	1	0	1
1379	342	1	706	130	11	104093.81	104093.81	0.00	71126.77	32967.04	1	1	0
1380	874	1000	373	40	5	27982.28	0.00	27982.28	20731.70	7250.58	1	0	1
1381	604	1	180	24	28	114058.16	114058.16	0.00	86857.23	27200.93	1	1	0
1382	177	1000	116	146	10	129606.69	0.00	129606.69	90338.98	39267.71	1	0	1
1383	729	2	150	145	37	7463.52	7463.52	0.00	5746.92	1716.60	1	1	0
1384	349	1	324	190	14	79424.46	79424.46	0.00	67059.66	12364.80	1	1	0
1385	197	1000	56	141	21	20169.32	0.00	20169.32	16390.12	3779.20	1	0	1
1386	177	1	538	230	19	107543.46	107543.46	0.00	82363.40	25180.06	1	1	0
1387	667	3	315	92	28	64289.21	64289.21	0.00	44526.83	19762.38	1	1	0
1388	497	1000	967	241	18	56139.96	0.00	56139.96	48459.10	7680.86	1	0	1
1389	723	1000	496	193	5	51336.90	0.00	51336.90	33369.03	17967.87	1	0	1
1390	618	2	815	8	24	242766.70	242766.70	0.00	172643.66	70123.04	1	1	0
1391	240	1	849	166	30	11941.96	11941.96	0.00	9331.30	2610.66	1	1	0
1392	859	3	533	2	25	98501.74	98501.74	0.00	82756.36	15745.38	1	1	0
1393	233	1000	88	120	33	66592.80	0.00	66592.80	50169.33	16423.47	1	0	1
1394	177	1000	11	87	12	190572.86	0.00	190572.86	155111.79	35461.07	1	0	1
1395	214	4	309	81	27	78863.70	78863.70	0.00	65268.58	13595.12	1	1	0
1396	704	1000	110	24	31	46146.36	0.00	46146.36	32520.05	13626.31	1	0	1
1397	657	1	201	150	20	75852.43	75852.43	0.00	51839.84	24012.59	1	1	0
1398	398	2	63	230	24	113576.52	113576.52	0.00	87333.11	26243.41	1	1	0
1399	858	1000	817	246	16	188913.19	0.00	188913.19	137225.47	51687.72	1	0	1
1400	380	1000	245	209	1	46714.41	0.00	46714.41	40641.57	6072.84	1	0	1
1401	738	1000	808	50	40	49613.00	0.00	49613.00	40857.71	8755.29	1	0	1
1402	404	1000	789	132	1	93346.80	0.00	93346.80	63477.96	29868.84	1	0	1
1403	337	3	708	252	31	114229.03	114229.03	0.00	93411.05	20817.98	1	1	0
1404	846	1000	68	82	26	19739.92	0.00	19739.92	15791.92	3948.00	1	0	1
1405	701	4	653	70	5	119034.60	119034.60	0.00	94961.03	24073.57	1	1	0
1406	680	2	954	216	16	70617.58	70617.58	0.00	49356.78	21260.80	1	1	0
1407	857	1	923	7	19	142437.08	142437.08	0.00	93977.38	48459.70	1	1	0
1408	762	1000	57	148	34	15939.54	0.00	15939.54	12114.09	3825.45	1	0	1
1409	268	1000	930	250	17	236820.55	0.00	236820.55	170236.75	66583.80	1	0	1
1410	453	3	288	24	4	24387.44	24387.44	0.00	16339.60	8047.84	1	1	0
1411	25	1000	204	146	31	47425.03	0.00	47425.03	35637.67	11787.36	1	0	1
1412	206	1	361	150	21	47420.35	47420.35	0.00	39125.38	8294.97	1	1	0
1413	344	1	895	246	41	15148.16	15148.16	0.00	10598.24	4549.92	1	1	0
1414	573	3	594	228	30	122213.34	122213.34	0.00	84315.34	37898.00	1	1	0
1415	227	3	615	135	41	90407.04	90407.04	0.00	59692.41	30714.63	1	1	0
1416	768	1000	736	13	15	654.48	0.00	654.48	458.13	196.35	1	0	1
1417	656	1000	837	142	39	157405.36	0.00	157405.36	134305.80	23099.56	1	0	1
1418	538	1000	166	120	14	82327.88	0.00	82327.88	53147.14	29180.74	1	0	1
1419	803	1000	799	19	8	104289.27	0.00	104289.27	92544.64	11744.63	1	0	1
1420	325	1000	643	74	36	125739.10	0.00	125739.10	86021.13	39717.97	1	0	1
1421	768	3	135	37	49	181288.23	181288.23	0.00	135364.97	45923.26	1	1	0
1422	538	3	340	99	19	36617.26	36617.26	0.00	26917.37	9699.89	1	1	0
1423	727	1	543	18	24	29942.72	29942.72	0.00	23331.68	6611.04	1	1	0
1424	51	1000	714	36	36	9387.26	0.00	9387.26	6195.60	3191.66	1	0	1
1425	872	1000	805	53	28	105380.29	0.00	105380.29	73635.36	31744.93	1	0	1
1426	464	1000	453	180	33	24688.94	0.00	24688.94	17554.83	7134.11	1	0	1
1427	441	2	722	10	25	59077.70	59077.70	0.00	40513.44	18564.26	1	1	0
1428	468	1000	997	249	22	94702.51	0.00	94702.51	68660.82	26041.69	1	0	1
1429	230	4	930	140	35	124394.07	124394.07	0.00	104213.83	20180.24	1	1	0
1430	238	1	272	43	27	26913.80	26913.80	0.00	20454.50	6459.30	1	1	0
1431	88	2	616	234	21	9668.34	9668.34	0.00	6284.42	3383.92	1	1	0
1432	720	1000	986	183	43	40228.23	0.00	40228.23	30347.05	9881.18	1	0	1
1433	566	4	94	173	42	9948.52	9948.52	0.00	7162.92	2785.60	1	1	0
1434	779	1000	822	169	45	138211.14	0.00	138211.14	109569.05	28642.09	1	0	1
1435	391	3	566	245	29	113624.39	113624.39	0.00	76657.55	36966.84	1	1	0
1436	117	1000	538	40	48	118988.82	0.00	118988.82	83913.25	35075.57	1	0	1
1437	514	1000	236	228	27	92966.01	0.00	92966.01	77432.32	15533.69	1	0	1
1438	177	3	757	82	14	127165.26	127165.26	0.00	108351.76	18813.50	1	1	0
1439	450	2	604	22	42	152437.80	152437.80	0.00	110189.50	42248.30	1	1	0
1440	481	2	391	187	30	157204.99	157204.99	0.00	115440.62	41764.37	1	1	0
1441	18	1000	79	102	9	49683.52	0.00	49683.52	42316.81	7366.71	1	0	1
1442	778	4	207	233	19	59240.37	59240.37	0.00	37282.67	21957.70	1	1	0
1443	758	1000	655	49	35	260772.29	0.00	260772.29	214504.82	46267.47	1	0	1
1444	111	3	148	166	5	71677.47	71677.47	0.00	49762.51	21914.96	1	1	0
1445	75	3	872	100	16	31906.53	31906.53	0.00	19720.75	12185.78	1	1	0
1446	374	3	50	124	10	217677.92	217677.92	0.00	168561.61	49116.31	1	1	0
1447	448	1000	830	178	25	3655.72	0.00	3655.72	2851.48	804.24	1	0	1
1448	788	1000	748	120	13	284215.62	0.00	284215.62	220264.75	63950.87	1	0	1
1449	657	1000	691	24	38	190569.31	0.00	190569.31	151420.20	39149.11	1	0	1
1450	501	3	781	84	46	63813.90	63813.90	0.00	50413.00	13400.90	1	1	0
1451	206	1	40	150	18	34293.93	34293.93	0.00	24890.17	9403.76	1	1	0
1452	189	1000	328	200	14	40747.67	0.00	40747.67	28082.39	12665.28	1	0	1
1453	445	1	570	11	11	147667.96	147667.96	0.00	109214.92	38453.04	1	1	0
1454	177	1000	549	101	48	78983.17	0.00	78983.17	60554.28	18428.89	1	0	1
1455	99	3	78	110	46	132744.78	132744.78	0.00	108949.27	23795.51	1	1	0
1456	739	1000	517	78	32	24827.73	0.00	24827.73	19222.47	5605.26	1	0	1
1457	255	1000	265	205	28	33648.41	0.00	33648.41	28604.39	5044.02	1	0	1
1458	377	1	702	107	14	128330.51	128330.51	0.00	100097.85	28232.66	1	1	0
1459	177	1000	638	155	16	72008.56	0.00	72008.56	50406.00	21602.56	1	0	1
1460	720	1000	260	80	36	80469.90	0.00	80469.90	64078.71	16391.19	1	0	1
1461	561	4	499	100	36	7398.94	7398.94	0.00	6659.04	739.90	1	1	0
1462	67	2	766	236	4	129775.98	129775.98	0.00	109011.84	20764.14	1	1	0
1463	177	1000	799	107	7	23502.22	0.00	23502.22	16980.60	6521.62	1	0	1
1464	853	1000	728	90	22	4607.56	0.00	4607.56	3824.27	783.29	1	0	1
1465	306	1000	323	40	44	183137.97	0.00	183137.97	134345.39	48792.58	1	0	1
1466	17	4	644	2	10	64207.49	64207.49	0.00	49819.44	14388.05	1	1	0
1467	683	1000	48	69	29	162430.43	0.00	162430.43	123468.40	38962.03	1	0	1
1468	845	1	848	178	35	158578.52	158578.52	0.00	103606.10	54972.42	1	1	0
1469	789	1000	445	237	32	6450.21	0.00	6450.21	5224.68	1225.53	1	0	1
1470	177	1000	1097	233	11	51265.93	0.00	51265.93	35915.78	15350.15	1	0	1
1471	748	1000	931	54	35	61897.88	0.00	61897.88	42239.18	19658.70	1	0	1
1472	826	1000	685	97	21	152315.36	0.00	152315.36	103859.10	48456.26	1	0	1
1473	385	1000	242	236	29	96258.96	0.00	96258.96	81461.60	14797.36	1	0	1
1474	397	4	577	80	16	161925.34	161925.34	0.00	123178.23	38747.11	1	1	0
1475	309	1000	173	227	30	178965.53	0.00	178965.53	124195.91	54769.62	1	0	1
1476	415	1000	504	167	7	19007.80	0.00	19007.80	15407.67	3600.13	1	0	1
1477	214	1000	292	83	34	77582.12	0.00	77582.12	56381.71	21200.41	1	0	1
1478	771	1000	811	22	38	15447.70	0.00	15447.70	11894.72	3552.98	1	0	1
1479	454	2	179	244	14	190820.43	190820.43	0.00	125649.55	65170.88	1	1	0
1480	826	2	679	49	4	64915.24	64915.24	0.00	48570.44	16344.80	1	1	0
1481	191	2	407	76	44	78954.64	78954.64	0.00	55053.74	23900.90	1	1	0
1482	490	1000	972	145	13	161399.23	0.00	161399.23	129502.41	31896.82	1	0	1
1483	303	4	566	116	17	645.08	645.08	0.00	477.36	167.72	1	1	0
1484	461	4	350	3	40	11976.57	11976.57	0.00	9210.18	2766.39	1	1	0
1485	98	3	566	210	29	102871.82	102871.82	0.00	82733.07	20138.75	1	1	0
1486	177	1000	268	49	49	11728.20	0.00	11728.20	9255.77	2472.43	1	0	1
1487	736	3	805	2	34	34204.79	34204.79	0.00	21686.82	12517.97	1	1	0
1488	573	1000	792	79	25	131818.85	0.00	131818.85	100323.76	31495.09	1	0	1
1489	315	2	389	226	38	21374.89	21374.89	0.00	17060.14	4314.75	1	1	0
1490	443	2	8	151	40	92278.48	92278.48	0.00	64019.96	28258.52	1	1	0
1491	549	1	481	175	30	135058.01	135058.01	0.00	106681.63	28376.38	1	1	0
1492	761	1000	927	116	20	38245.71	0.00	38245.71	26495.12	11750.59	1	0	1
1493	206	1	471	61	14	83537.14	83537.14	0.00	50802.43	32734.71	1	1	0
1494	861	1	592	145	38	261581.35	261581.35	0.00	200395.90	61185.45	1	1	0
1495	312	1	172	200	12	66848.34	66848.34	0.00	51594.43	15253.91	1	1	0
1496	112	3	133	226	18	84670.87	84670.87	0.00	58427.22	26243.65	1	1	0
1497	592	1000	143	149	39	151148.20	0.00	151148.20	124256.70	26891.50	1	0	1
1498	390	1000	836	214	15	14738.08	0.00	14738.08	11643.08	3095.00	1	0	1
1499	123	4	51	29	21	34767.48	34767.48	0.00	25949.76	8817.72	1	1	0
1500	485	1000	432	119	33	40587.20	0.00	40587.20	34004.45	6582.75	1	0	1
1501	81	3	584	141	48	149933.29	149933.29	0.00	112730.55	37202.74	1	1	0
1502	858	1000	136	209	6	92744.06	0.00	92744.06	63996.05	28748.01	1	0	1
1503	275	1000	76	12	29	92665.79	0.00	92665.79	69414.41	23251.38	1	0	1
1504	64	1000	636	129	23	93252.69	0.00	93252.69	65892.18	27360.51	1	0	1
1505	679	1000	559	79	42	199208.50	0.00	199208.50	134007.41	65201.09	1	0	1
1506	328	1000	699	77	13	94844.74	0.00	94844.74	70477.28	24367.46	1	0	1
1507	703	1	559	62	49	9371.66	9371.66	0.00	6005.17	3366.49	1	1	0
1508	274	1000	476	252	3	48962.34	0.00	48962.34	38190.60	10771.74	1	0	1
1509	208	1000	157	58	20	151407.28	0.00	151407.28	103936.68	47470.60	1	0	1
1510	323	1000	434	54	29	28799.14	0.00	28799.14	19871.40	8927.74	1	0	1
1511	686	1000	266	6	8	107933.14	0.00	107933.14	84187.82	23745.32	1	0	1
1512	184	1000	792	102	15	143259.02	0.00	143259.02	99510.53	43748.49	1	0	1
1513	641	2	295	197	42	3081.42	3081.42	0.00	1879.66	1201.76	1	1	0
1514	344	1000	329	88	50	89979.26	0.00	89979.26	57644.90	32334.36	1	0	1
1515	781	1000	242	204	42	38629.38	0.00	38629.38	28931.50	9697.88	1	0	1
1516	552	1000	822	210	32	67682.51	0.00	67682.51	50519.50	17163.01	1	0	1
1517	539	1000	114	217	18	68646.70	0.00	68646.70	61095.60	7551.10	1	0	1
1518	742	1000	873	136	42	71747.77	0.00	71747.77	54150.11	17597.66	1	0	1
1519	302	1000	141	170	12	40832.86	0.00	40832.86	32704.12	8128.74	1	0	1
1520	568	2	546	133	25	60579.54	60579.54	0.00	46646.28	13933.26	1	1	0
1521	856	2	22	110	4	230287.26	230287.26	0.00	147222.64	83064.62	1	1	0
1522	161	3	628	125	21	175588.87	175588.87	0.00	138700.01	36888.86	1	1	0
1523	873	1000	50	205	26	103837.72	0.00	103837.72	79955.06	23882.66	1	0	1
1524	198	1000	345	114	38	28625.16	0.00	28625.16	23447.40	5177.76	1	0	1
1525	470	1000	834	140	9	72227.04	0.00	72227.04	51683.62	20543.42	1	0	1
1526	699	4	130	131	47	85320.38	85320.38	0.00	74292.49	11027.89	1	1	0
1527	840	1000	153	229	28	68682.39	0.00	68682.39	41209.42	27472.97	1	0	1
1528	67	4	479	228	48	164164.14	164164.14	0.00	114546.68	49617.46	1	1	0
1529	231	1000	239	126	25	65849.17	0.00	65849.17	55722.68	10126.49	1	0	1
1530	649	1000	889	22	26	96898.25	0.00	96898.25	78926.15	17972.10	1	0	1
1531	177	1000	1031	192	41	175718.81	0.00	175718.81	141840.41	33878.40	1	0	1
1532	230	2	593	251	5	42481.26	42481.26	0.00	36958.68	5522.58	1	1	0
1533	109	1000	586	100	29	99650.60	0.00	99650.60	83425.64	16224.96	1	0	1
1534	112	1000	939	156	6	181504.84	0.00	181504.84	136934.63	44570.21	1	0	1
1535	86	1000	19	153	49	22076.08	0.00	22076.08	14349.44	7726.64	1	0	1
1536	301	1000	400	42	32	118015.64	0.00	118015.64	82702.72	35312.92	1	0	1
1537	171	1000	466	26	13	153673.41	0.00	153673.41	113876.00	39797.41	1	0	1
1538	383	1000	751	157	28	108163.85	0.00	108163.85	84584.49	23579.36	1	0	1
1539	36	3	839	69	40	18001.05	18001.05	0.00	15326.14	2674.91	1	1	0
1540	497	1	826	5	16	4767.36	4767.36	0.00	4242.96	524.40	1	1	0
1541	862	1	229	192	32	175858.18	175858.18	0.00	131547.02	44311.16	1	1	0
1542	355	1	525	141	21	165137.54	165137.54	0.00	117389.64	47747.90	1	1	0
1543	348	1000	544	145	4	133131.33	0.00	133131.33	99220.12	33911.21	1	0	1
1544	439	4	85	110	49	60707.99	60707.99	0.00	46138.05	14569.94	1	1	0
1545	177	1000	209	191	19	70103.00	0.00	70103.00	55018.42	15084.58	1	0	1
1546	31	1000	477	63	11	99431.95	0.00	99431.95	79588.64	19843.31	1	0	1
1547	802	1000	758	30	46	159457.15	0.00	159457.15	110067.56	49389.59	1	0	1
1548	252	1000	813	26	23	87862.62	0.00	87862.62	74896.89	12965.73	1	0	1
1549	703	1000	348	87	14	111675.82	0.00	111675.82	82104.32	29571.50	1	0	1
1550	33	1	291	40	17	77746.90	77746.90	0.00	65307.40	12439.50	1	1	0
1551	53	1000	252	235	19	141003.38	0.00	141003.38	111598.35	29405.03	1	0	1
1552	267	2	604	76	37	103345.64	103345.64	0.00	86392.49	16953.15	1	1	0
1553	201	1000	74	234	13	10618.10	0.00	10618.10	7007.95	3610.15	1	0	1
1554	69	3	252	146	28	74974.30	74974.30	0.00	57479.24	17495.06	1	1	0
1555	640	1000	994	11	37	25016.56	0.00	25016.56	19512.92	5503.64	1	0	1
1556	170	1	947	3	38	483.81	483.81	0.00	358.02	125.79	1	1	0
1557	239	1	150	28	32	118574.99	118574.99	0.00	97625.67	20949.32	1	1	0
1558	394	1000	561	165	31	27297.60	0.00	27297.60	23748.88	3548.72	1	0	1
1559	74	2	66	9	28	73335.60	73335.60	0.00	59693.01	13642.59	1	1	0
1560	757	2	799	178	25	158349.89	158349.89	0.00	114305.31	44044.58	1	1	0
1561	463	2	531	244	46	215052.96	215052.96	0.00	153564.77	61488.19	1	1	0
1562	421	1000	771	27	45	21437.87	0.00	21437.87	17313.35	4124.52	1	0	1
1563	224	1000	522	36	21	102797.39	0.00	102797.39	80634.07	22163.32	1	0	1
1564	770	3	384	133	38	259196.98	259196.98	0.00	204639.28	54557.70	1	1	0
1565	634	1000	638	189	14	255644.62	0.00	255644.62	211389.11	44255.51	1	0	1
1566	702	1000	913	206	20	88319.30	0.00	88319.30	79487.30	8832.00	1	0	1
1567	431	1000	359	112	44	70895.88	0.00	70895.88	53652.21	17243.67	1	0	1
1568	529	3	693	33	39	231554.50	231554.50	0.00	152740.29	78814.21	1	1	0
1569	849	1000	328	33	15	52981.05	0.00	52981.05	40132.80	12848.25	1	0	1
1570	875	1000	425	132	7	33356.94	0.00	33356.94	20681.28	12675.66	1	0	1
1571	496	1000	359	198	36	133711.95	0.00	133711.95	102662.20	31049.75	1	0	1
1572	600	4	926	23	42	38974.21	38974.21	0.00	30380.41	8593.80	1	1	0
1573	368	4	492	12	21	15735.18	15735.18	0.00	10195.56	5539.62	1	1	0
1574	356	1000	540	142	20	245738.10	0.00	245738.10	175194.51	70543.59	1	0	1
1575	865	1000	199	59	44	7674.12	0.00	7674.12	4757.94	2916.18	1	0	1
1576	392	2	762	51	2	77376.69	77376.69	0.00	58390.50	18986.19	1	1	0
1577	653	1	899	142	41	57100.12	57100.12	0.00	40175.40	16924.72	1	1	0
1578	224	2	464	81	42	148665.09	148665.09	0.00	113896.53	34768.56	1	1	0
1579	177	1000	814	41	43	82684.10	0.00	82684.10	66881.33	15802.77	1	0	1
1580	529	1000	204	66	2	124631.24	0.00	124631.24	91857.12	32774.12	1	0	1
1581	159	4	650	31	1	86914.92	86914.92	0.00	71392.29	15522.63	1	1	0
1582	231	1000	237	130	34	69965.95	0.00	69965.95	44755.30	25210.65	1	0	1
1583	707	1000	459	225	4	34401.86	0.00	34401.86	27305.12	7096.74	1	0	1
1584	536	2	721	184	2	213904.64	213904.64	0.00	151225.64	62679.00	1	1	0
1585	630	3	469	97	27	159270.15	159270.15	0.00	105827.23	53442.92	1	1	0
1586	177	1	143	46	20	65445.31	65445.31	0.00	51759.78	13685.53	1	1	0
1587	294	3	579	133	20	82760.62	82760.62	0.00	63332.71	19427.91	1	1	0
1588	598	1	390	219	1	169637.42	169637.42	0.00	127863.78	41773.64	1	1	0
1589	207	1	908	186	29	155404.48	155404.48	0.00	116989.93	38414.55	1	1	0
1590	580	1000	451	203	9	76552.47	0.00	76552.47	55883.34	20669.13	1	0	1
1591	95	2	351	2	1	76777.15	76777.15	0.00	55085.75	21691.40	1	1	0
1592	346	4	85	134	15	71125.63	71125.63	0.00	51631.07	19494.56	1	1	0
1593	428	1000	749	153	35	31047.77	0.00	31047.77	23461.70	7586.07	1	0	1
1594	657	1000	499	139	23	80461.02	0.00	80461.02	66287.70	14173.32	1	0	1
1595	315	1000	68	112	12	138998.26	0.00	138998.26	99083.83	39914.43	1	0	1
1596	613	1000	349	218	23	153642.51	0.00	153642.51	104527.68	49114.83	1	0	1
1597	497	1000	220	3	5	5742.57	0.00	5742.57	4249.50	1493.07	1	0	1
1598	40	3	942	49	42	104524.70	104524.70	0.00	74568.11	29956.59	1	1	0
1599	722	1000	791	192	33	34637.53	0.00	34637.53	28594.86	6042.67	1	0	1
1600	425	3	345	72	21	223371.28	223371.28	0.00	169824.78	53546.50	1	1	0
1601	177	1	435	147	25	165044.14	165044.14	0.00	120312.54	44731.60	1	1	0
1602	299	3	658	228	31	7001.12	7001.12	0.00	4270.68	2730.44	1	1	0
1603	476	1000	128	204	3	31895.86	0.00	31895.86	23129.56	8766.30	1	0	1
1604	844	3	96	241	20	79066.69	79066.69	0.00	67460.70	11605.99	1	1	0
1605	52	2	678	78	30	39381.24	39381.24	0.00	26779.24	12602.00	1	1	0
1606	770	3	318	95	34	199243.21	199243.21	0.00	159856.74	39386.47	1	1	0
1607	487	1000	385	158	5	143557.01	0.00	143557.01	104499.94	39057.07	1	0	1
1608	154	3	632	12	14	83372.30	83372.30	0.00	61405.35	21966.95	1	1	0
1609	177	1000	445	237	38	90990.12	0.00	90990.12	69784.62	21205.50	1	0	1
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
1630	503	1000	232	245	45	22795.50	0.00	22795.50	17096.66	5698.84	1	0	1
1631	565	1	810	251	43	161110.31	161110.31	0.00	125862.39	35247.92	1	1	0
1632	123	1	405	230	46	56565.96	56565.96	0.00	41293.16	15272.80	1	1	0
1633	131	1	43	173	32	28438.70	28438.70	0.00	19907.10	8531.60	1	1	0
1634	41	1000	738	64	23	95777.41	0.00	95777.41	75846.52	19930.89	1	0	1
1635	466	1000	762	177	1	164488.70	0.00	164488.70	122351.42	42137.28	1	0	1
1636	747	1000	443	110	1	134809.01	0.00	134809.01	100518.39	34290.62	1	0	1
1637	733	1000	450	217	45	75643.70	0.00	75643.70	55370.52	20273.18	1	0	1
1638	53	1000	141	62	35	94447.44	0.00	94447.44	67047.96	27399.48	1	0	1
1639	137	1000	928	70	40	52638.11	0.00	52638.11	36680.09	15958.02	1	0	1
1640	35	2	806	225	39	97603.00	97603.00	0.00	76130.30	21472.70	1	1	0
1641	152	1000	942	165	50	53032.95	0.00	53032.95	43013.43	10019.52	1	0	1
1642	121	1000	678	185	30	28323.68	0.00	28323.68	24513.68	3810.00	1	0	1
1643	832	1000	263	194	20	66293.76	0.00	66293.76	43899.46	22394.30	1	0	1
1644	609	2	323	209	7	96055.34	96055.34	0.00	79587.98	16467.36	1	1	0
1645	413	4	775	112	37	28255.05	28255.05	0.00	20343.60	7911.45	1	1	0
1646	517	2	736	180	9	56359.14	56359.14	0.00	40084.23	16274.91	1	1	0
1647	223	3	253	12	23	41207.67	41207.67	0.00	32931.47	8276.20	1	1	0
1648	464	3	261	60	15	166776.64	166776.64	0.00	108948.75	57827.89	1	1	0
1649	482	1000	766	246	29	35470.23	0.00	35470.23	26147.14	9323.09	1	0	1
1650	283	1000	849	223	32	168648.46	0.00	168648.46	125438.54	43209.92	1	0	1
1651	400	1000	981	44	38	179182.94	0.00	179182.94	133580.81	45602.13	1	0	1
1652	176	4	517	14	9	114251.57	114251.57	0.00	86704.52	27547.05	1	1	0
1653	177	3	730	89	31	67636.26	67636.26	0.00	47396.69	20239.57	1	1	0
1654	277	2	909	42	39	116186.53	116186.53	0.00	80983.01	35203.52	1	1	0
1655	245	1000	728	8	10	131863.41	0.00	131863.41	99476.33	32387.08	1	0	1
1656	807	1000	680	80	40	301529.31	0.00	301529.31	237198.81	64330.50	1	0	1
1657	638	1000	235	144	44	127875.04	0.00	127875.04	95489.30	32385.74	1	0	1
1658	867	3	494	129	13	5321.28	5321.28	0.00	3932.18	1389.10	1	1	0
1659	625	1000	301	173	34	30207.52	0.00	30207.52	20239.04	9968.48	1	0	1
1660	160	1000	537	177	5	104296.63	0.00	104296.63	87451.80	16844.83	1	0	1
1661	177	1	1146	147	49	117311.54	117311.54	0.00	102764.72	14546.82	1	1	0
1662	765	2	26	166	14	91354.81	91354.81	0.00	73401.50	17953.31	1	1	0
1663	382	1000	58	33	21	105498.22	0.00	105498.22	85720.05	19778.17	1	0	1
1664	177	1000	740	43	48	58659.53	0.00	58659.53	42987.69	15671.84	1	0	1
1665	820	1000	152	200	24	163409.50	0.00	163409.50	125907.28	37502.22	1	0	1
1666	229	1000	998	167	36	249366.68	0.00	249366.68	201207.66	48159.02	1	0	1
1667	696	1000	11	64	42	38985.87	0.00	38985.87	26922.18	12063.69	1	0	1
1668	627	1	120	84	27	207359.00	207359.00	0.00	172935.82	34423.18	1	1	0
1669	177	1	813	55	8	4234.42	4234.42	0.00	2879.41	1355.01	1	1	0
1670	166	4	286	173	14	88261.36	88261.36	0.00	67584.72	20676.64	1	1	0
1671	20	4	926	218	29	68052.15	68052.15	0.00	51156.56	16895.59	1	1	0
1672	781	1000	721	93	7	140724.22	0.00	140724.22	103333.20	37391.02	1	0	1
1673	786	1000	768	19	10	7857.78	0.00	7857.78	5579.00	2278.78	1	0	1
1674	423	1000	74	119	6	36233.01	0.00	36233.01	25079.77	11153.24	1	0	1
1675	563	3	127	80	8	123002.55	123002.55	0.00	96281.55	26721.00	1	1	0
1676	177	2	678	14	7	25399.77	25399.77	0.00	21642.36	3757.41	1	1	0
1677	699	3	912	94	6	200513.44	200513.44	0.00	148003.16	52510.28	1	1	0
1678	709	4	476	248	14	28016.27	28016.27	0.00	19804.49	8211.78	1	1	0
1679	832	1000	166	96	44	187059.42	0.00	187059.42	154088.92	32970.50	1	0	1
1680	601	1000	755	180	50	195386.82	0.00	195386.82	145521.41	49865.41	1	0	1
1681	548	3	148	5	23	100143.47	100143.47	0.00	82220.95	17922.52	1	1	0
1682	139	2	136	180	17	109253.90	109253.90	0.00	78569.75	30684.15	1	1	0
1683	426	1000	954	108	15	9817.69	0.00	9817.69	6049.32	3768.37	1	0	1
1684	680	1000	590	191	22	168009.79	0.00	168009.79	117940.29	50069.50	1	0	1
1685	312	2	457	77	6	126587.10	126587.10	0.00	91548.00	35039.10	1	1	0
1686	774	1000	674	226	6	156218.64	0.00	156218.64	110861.49	45357.15	1	0	1
1687	177	1	1172	201	14	105318.44	105318.44	0.00	79819.24	25499.20	1	1	0
1688	607	1000	379	253	4	118934.98	0.00	118934.98	96156.85	22778.13	1	0	1
1689	284	4	633	150	20	45708.61	45708.61	0.00	33944.34	11764.27	1	1	0
1690	527	4	807	11	17	126047.11	126047.11	0.00	96739.94	29307.17	1	1	0
1691	509	1	30	220	11	37474.78	37474.78	0.00	31853.57	5621.21	1	1	0
1692	508	2	805	2	2	89438.02	89438.02	0.00	58858.24	30579.78	1	1	0
1693	6	4	744	123	37	68644.57	68644.57	0.00	43449.82	25194.75	1	1	0
1694	97	4	413	75	1	47762.70	47762.70	0.00	33499.32	14263.38	1	1	0
1695	182	1000	379	26	32	25461.08	0.00	25461.08	22914.96	2546.12	1	0	1
1696	841	1000	259	209	4	158593.41	0.00	158593.41	121514.30	37079.11	1	0	1
1697	171	2	84	72	36	166137.13	166137.13	0.00	122279.14	43857.99	1	1	0
1698	634	2	17	120	38	136001.33	136001.33	0.00	84725.97	51275.36	1	1	0
1699	612	1000	628	146	28	60596.64	0.00	60596.64	40599.76	19996.88	1	0	1
1700	705	4	109	184	21	54675.19	54675.19	0.00	37759.99	16915.20	1	1	0
1701	809	3	841	19	38	148037.90	148037.90	0.00	116361.99	31675.91	1	1	0
1702	388	1000	339	93	15	14747.17	0.00	14747.17	11863.19	2883.98	1	0	1
1703	760	3	797	69	36	90202.80	90202.80	0.00	57481.06	32721.74	1	1	0
1704	315	3	862	134	46	58819.09	58819.09	0.00	48817.49	10001.60	1	1	0
1705	100	4	867	51	26	107481.48	107481.48	0.00	89396.83	18084.65	1	1	0
1706	347	3	397	109	33	119519.70	119519.70	0.00	74797.20	44722.50	1	1	0
1707	740	1000	340	241	34	45501.78	0.00	45501.78	35922.23	9579.55	1	0	1
1708	177	1000	115	131	13	186009.45	0.00	186009.45	135033.57	50975.88	1	0	1
1709	177	1	1009	222	41	28275.10	28275.10	0.00	19509.80	8765.30	1	1	0
1710	826	1000	155	196	9	95557.93	0.00	95557.93	75836.06	19721.87	1	0	1
1711	188	1000	572	113	12	58574.40	0.00	58574.40	45102.30	13472.10	1	0	1
1712	344	2	127	40	1	30280.27	30280.27	0.00	24239.26	6041.01	1	1	0
1713	232	2	51	224	7	83758.96	83758.96	0.00	60789.48	22969.48	1	1	0
1714	131	3	951	119	46	155351.83	155351.83	0.00	116885.05	38466.78	1	1	0
1715	290	2	960	218	19	105347.35	105347.35	0.00	89121.76	16225.59	1	1	0
1716	454	3	70	194	7	145458.05	145458.05	0.00	105791.28	39666.77	1	1	0
1717	853	2	761	32	45	11139.66	11139.66	0.00	8020.56	3119.10	1	1	0
1718	805	1000	13	118	17	65516.30	0.00	65516.30	48000.47	17515.83	1	0	1
1719	760	1000	677	202	16	113385.33	0.00	113385.33	87531.83	25853.50	1	0	1
1720	137	1000	408	87	45	101200.92	0.00	101200.92	78771.31	22429.61	1	0	1
1721	482	1000	83	220	19	70910.25	0.00	70910.25	50603.42	20306.83	1	0	1
1722	96	1	381	198	1	84160.98	84160.98	0.00	57716.70	26444.28	1	1	0
1723	802	1000	630	219	45	115554.15	0.00	115554.15	90242.86	25311.29	1	0	1
1724	586	3	947	127	34	38835.25	38835.25	0.00	30283.01	8552.24	1	1	0
1725	447	1000	517	105	38	44152.16	0.00	44152.16	28698.88	15453.28	1	0	1
1726	152	4	401	157	32	26123.40	26123.40	0.00	16718.96	9404.44	1	1	0
1727	270	3	339	44	46	5490.16	5490.16	0.00	3952.88	1537.28	1	1	0
1728	546	1000	757	103	9	80811.54	0.00	80811.54	55752.39	25059.15	1	0	1
1729	648	1000	768	121	29	98484.94	0.00	98484.94	75029.00	23455.94	1	0	1
1730	234	1000	529	202	31	50673.57	0.00	50673.57	32529.69	18143.88	1	0	1
1731	585	1	714	211	7	116287.19	116287.19	0.00	82809.44	33477.75	1	1	0
1732	772	1000	909	193	47	77722.13	0.00	77722.13	60490.18	17231.95	1	0	1
1733	210	1000	442	188	10	211042.13	0.00	211042.13	133977.47	77064.66	1	0	1
1734	192	3	533	78	42	60201.04	60201.04	0.00	47090.60	13110.44	1	1	0
1735	601	1000	90	96	48	77001.74	0.00	77001.74	62590.12	14411.62	1	0	1
1736	184	1000	543	169	1	121345.83	0.00	121345.83	82055.78	39290.05	1	0	1
1737	240	1000	713	227	29	150315.76	0.00	150315.76	123810.75	26505.01	1	0	1
1738	711	1000	566	119	26	743.64	0.00	743.64	587.49	156.15	1	0	1
1739	177	4	440	193	49	47091.20	47091.20	0.00	41440.24	5650.96	1	1	0
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
1754	3	1000	622	190	5	88802.13	0.00	88802.13	70266.98	18535.15	1	0	1
1755	512	3	864	134	7	78487.00	78487.00	0.00	65118.61	13368.39	1	1	0
1756	502	3	822	145	44	223932.67	223932.67	0.00	185979.27	37953.40	1	1	0
1757	102	1000	888	180	27	181331.05	0.00	181331.05	128607.43	52723.62	1	0	1
1758	704	3	73	48	24	120110.64	120110.64	0.00	92180.20	27930.44	1	1	0
1759	575	2	976	251	10	88026.64	88026.64	0.00	63479.02	24547.62	1	1	0
1760	415	2	840	81	7	244727.04	244727.04	0.00	163152.02	81575.02	1	1	0
1761	395	2	570	141	11	85963.28	85963.28	0.00	71754.96	14208.32	1	1	0
1762	177	1000	540	87	39	37050.03	0.00	37050.03	29159.63	7890.40	1	0	1
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
1777	177	3	905	153	10	31413.20	31413.20	0.00	21675.10	9738.10	1	1	0
1778	33	1000	983	185	27	110590.94	0.00	110590.94	86394.15	24196.79	1	0	1
1779	244	1000	348	75	19	213105.57	0.00	213105.57	156123.56	56982.01	1	0	1
1780	628	4	721	21	23	44011.84	44011.84	0.00	36529.84	7482.00	1	1	0
1781	638	2	561	126	47	147677.93	147677.93	0.00	108249.03	39428.90	1	1	0
1782	675	1000	998	81	25	2299.30	0.00	2299.30	1793.50	505.80	1	0	1
1783	326	1	235	207	47	7683.60	7683.60	0.00	5224.85	2458.75	1	1	0
1784	115	3	332	237	29	90268.12	90268.12	0.00	70876.70	19391.42	1	1	0
1785	177	1000	1111	165	38	65390.26	0.00	65390.26	46366.38	19023.88	1	0	1
1786	798	1000	187	218	2	202833.34	0.00	202833.34	152630.31	50203.03	1	0	1
1787	320	1000	136	148	20	64941.54	0.00	64941.54	47710.72	17230.82	1	0	1
1788	330	1000	964	244	41	18762.42	0.00	18762.42	14634.69	4127.73	1	0	1
1789	696	1000	948	161	28	171737.02	0.00	171737.02	118960.96	52776.06	1	0	1
1790	668	4	684	42	9	185441.27	185441.27	0.00	153187.52	32253.75	1	1	0
1791	358	1	566	118	45	188540.94	188540.94	0.00	154829.95	33710.99	1	1	0
1792	866	1	401	151	15	94299.40	94299.40	0.00	72532.49	21766.91	1	1	0
1793	451	1000	651	233	39	42605.49	0.00	42605.49	37287.88	5317.61	1	0	1
1794	598	1	384	30	9	95161.12	95161.12	0.00	66512.12	28649.00	1	1	0
1795	611	1000	152	175	42	40705.04	0.00	40705.04	27654.25	13050.79	1	0	1
1796	355	1000	652	170	25	75569.67	0.00	75569.67	45341.82	30227.85	1	0	1
1797	692	1000	572	13	25	19165.48	0.00	19165.48	13415.84	5749.64	1	0	1
1798	646	1000	927	86	39	5036.82	0.00	5036.82	3992.69	1044.13	1	0	1
1799	177	3	951	229	44	144387.97	144387.97	0.00	104713.40	39674.57	1	1	0
1800	245	1000	592	199	29	143987.02	0.00	143987.02	103625.16	40361.86	1	0	1
1801	169	1	964	123	27	84628.22	84628.22	0.00	67772.38	16855.84	1	1	0
1802	341	1000	770	39	28	98509.48	0.00	98509.48	88125.20	10384.28	1	0	1
1803	575	1000	150	245	36	28735.77	0.00	28735.77	20545.35	8190.42	1	0	1
1804	725	1000	231	98	10	110629.25	0.00	110629.25	92345.12	18284.13	1	0	1
1805	177	2	511	19	29	78182.54	78182.54	0.00	62617.90	15564.64	1	1	0
1806	478	1000	940	108	37	88712.86	0.00	88712.86	78899.82	9813.04	1	0	1
1807	128	4	746	249	42	35912.80	35912.80	0.00	25139.00	10773.80	1	1	0
1808	198	1000	241	67	26	139143.22	0.00	139143.22	101274.30	37868.92	1	0	1
1809	167	1000	897	107	46	68250.04	0.00	68250.04	58409.76	9840.28	1	0	1
1810	66	1	700	221	39	54234.64	54234.64	0.00	37468.72	16765.92	1	1	0
1811	823	3	890	185	39	99092.38	99092.38	0.00	77267.40	21824.98	1	1	0
1812	825	1000	44	190	29	124913.04	0.00	124913.04	95944.13	28968.91	1	0	1
1813	353	1000	337	122	25	55594.90	0.00	55594.90	34468.80	21126.10	1	0	1
1814	534	1000	553	85	14	95410.49	0.00	95410.49	66434.70	28975.79	1	0	1
1815	488	1000	634	61	23	39345.39	0.00	39345.39	31726.57	7618.82	1	0	1
1816	614	4	381	219	37	19532.16	19532.16	0.00	16797.68	2734.48	1	1	0
1817	654	1000	805	76	26	98165.73	0.00	98165.73	64831.37	33334.36	1	0	1
1818	659	2	141	161	6	68309.24	68309.24	0.00	52886.96	15422.28	1	1	0
1819	100	1000	735	79	44	74148.15	0.00	74148.15	54385.08	19763.07	1	0	1
1820	728	1000	946	79	10	122566.70	0.00	122566.70	85091.27	37475.43	1	0	1
1821	520	1000	124	127	6	38661.35	0.00	38661.35	32845.86	5815.49	1	0	1
1822	551	1000	976	208	27	121335.44	0.00	121335.44	94326.32	27009.12	1	0	1
1823	640	1000	552	202	45	75669.48	0.00	75669.48	55694.70	19974.78	1	0	1
1824	591	1000	427	108	26	130293.26	0.00	130293.26	106835.40	23457.86	1	0	1
1825	177	4	261	240	25	127682.84	127682.84	0.00	108989.60	18693.24	1	1	0
1826	777	2	471	65	50	97482.60	97482.60	0.00	74256.37	23226.23	1	1	0
1827	20	2	924	66	23	47719.03	47719.03	0.00	36304.35	11414.68	1	1	0
1828	668	1000	825	155	5	139833.17	0.00	139833.17	90174.51	49658.66	1	0	1
1829	177	1000	754	198	16	70074.24	0.00	70074.24	49354.76	20719.48	1	0	1
1830	301	1000	769	120	9	195292.88	0.00	195292.88	131459.70	63833.18	1	0	1
1831	496	1000	138	223	13	261379.16	0.00	261379.16	190447.00	70932.16	1	0	1
1832	274	4	606	151	50	39631.38	39631.38	0.00	26929.32	12702.06	1	1	0
1833	739	1000	563	200	29	153382.34	0.00	153382.34	116664.93	36717.41	1	0	1
1834	25	1	527	151	10	83799.83	83799.83	0.00	54237.73	29562.10	1	1	0
1835	795	3	11	139	37	32187.06	32187.06	0.00	21983.46	10203.60	1	1	0
1836	442	1000	322	37	49	177145.76	0.00	177145.76	128987.40	48158.36	1	0	1
1837	113	1000	1000	194	9	246192.76	0.00	246192.76	173387.23	72805.53	1	0	1
1838	287	1000	901	55	11	8009.90	0.00	8009.90	5687.03	2322.87	1	0	1
1839	769	4	898	146	36	66473.55	66473.55	0.00	44362.74	22110.81	1	1	0
1840	447	1000	99	209	42	95738.40	0.00	95738.40	77994.33	17744.07	1	0	1
1841	820	1	106	138	36	94699.91	94699.91	0.00	73336.31	21363.60	1	1	0
1842	335	4	765	31	6	45359.84	45359.84	0.00	34333.72	11026.12	1	1	0
1843	799	1	193	177	5	137433.56	137433.56	0.00	87738.93	49694.63	1	1	0
1844	868	2	271	68	8	160274.71	160274.71	0.00	126539.46	33735.25	1	1	0
1845	563	1000	306	186	35	92733.90	0.00	92733.90	74738.39	17995.51	1	0	1
1846	828	2	63	188	42	223264.33	223264.33	0.00	163428.97	59835.36	1	1	0
1847	399	1000	471	161	18	14965.90	0.00	14965.90	12122.38	2843.52	1	0	1
1848	856	1000	785	248	9	81678.74	0.00	81678.74	54589.62	27089.12	1	0	1
1849	734	1000	479	154	20	54710.23	0.00	54710.23	42895.20	11815.03	1	0	1
1850	365	2	877	164	33	53914.60	53914.60	0.00	48523.10	5391.50	1	1	0
1851	393	1	812	30	5	15061.76	15061.76	0.00	10995.08	4066.68	1	1	0
1852	804	1000	885	152	19	36405.91	0.00	36405.91	23758.63	12647.28	1	0	1
1853	563	2	108	243	9	122257.76	122257.76	0.00	97737.14	24520.62	1	1	0
1854	125	4	794	207	48	105480.88	105480.88	0.00	77114.90	28365.98	1	1	0
1855	513	1000	295	58	10	29922.89	0.00	29922.89	22599.01	7323.88	1	0	1
1856	177	1	792	81	15	69918.40	69918.40	0.00	53645.31	16273.09	1	1	0
1857	273	1000	558	56	33	75484.12	0.00	75484.12	58256.96	17227.16	1	0	1
1858	518	1000	743	23	15	9619.36	0.00	9619.36	5867.80	3751.56	1	0	1
1859	184	1	716	136	11	89705.16	89705.16	0.00	68175.90	21529.26	1	1	0
1860	362	1000	350	250	30	73181.07	0.00	73181.07	59988.87	13192.20	1	0	1
1861	317	3	405	221	35	67628.34	67628.34	0.00	49310.48	18317.86	1	1	0
1862	769	2	341	235	26	184567.96	184567.96	0.00	131835.54	52732.42	1	1	0
1863	472	1000	364	4	26	156588.00	0.00	156588.00	127223.64	29364.36	1	0	1
1864	297	1	912	207	47	61004.65	61004.65	0.00	49413.77	11590.88	1	1	0
1865	163	3	90	195	2	15843.20	15843.20	0.00	10614.96	5228.24	1	1	0
1866	45	2	852	50	2	9766.05	9766.05	0.00	6836.22	2929.83	1	1	0
1867	739	1	359	13	37	68251.10	68251.10	0.00	58013.13	10237.97	1	1	0
1868	810	1000	454	144	29	150011.50	0.00	150011.50	97163.18	52848.32	1	0	1
1869	822	4	37	117	20	19129.59	19129.59	0.00	13773.30	5356.29	1	1	0
1870	258	1000	242	198	2	145557.00	0.00	145557.00	121994.37	23562.63	1	0	1
1871	52	2	772	52	12	87606.26	87606.26	0.00	68716.76	18889.50	1	1	0
1872	556	1000	542	168	42	98842.71	0.00	98842.71	83258.29	15584.42	1	0	1
1873	536	3	385	68	29	169860.48	169860.48	0.00	128469.43	41391.05	1	1	0
1874	520	1000	98	100	31	155908.32	0.00	155908.32	114920.10	40988.22	1	0	1
1875	529	2	742	199	48	79989.93	79989.93	0.00	63213.86	16776.07	1	1	0
1876	600	2	29	205	29	189522.85	189522.85	0.00	137456.70	52066.15	1	1	0
1877	581	1000	183	154	32	62371.71	0.00	62371.71	43146.52	19225.19	1	0	1
1878	546	2	791	61	35	101111.95	101111.95	0.00	80901.29	20210.66	1	1	0
1879	272	2	816	12	46	156349.64	156349.64	0.00	128436.21	27913.43	1	1	0
1880	412	2	141	132	18	5233.99	5233.99	0.00	3815.57	1418.42	1	1	0
1881	371	4	219	69	13	74197.28	74197.28	0.00	51063.16	23134.12	1	1	0
1882	351	2	588	56	36	26144.85	26144.85	0.00	21177.33	4967.52	1	1	0
1883	165	3	866	120	13	92333.05	92333.05	0.00	82034.05	10299.00	1	1	0
1884	177	3	1150	27	44	150409.03	150409.03	0.00	116770.16	33638.87	1	1	0
1885	306	1000	784	213	18	23429.78	0.00	23429.78	17205.29	6224.49	1	0	1
1886	217	3	565	140	8	42433.70	42433.70	0.00	27006.45	15427.25	1	1	0
1887	1	1000	938	208	6	79444.45	0.00	79444.45	53467.79	25976.66	1	0	1
1888	276	3	580	219	32	71842.96	71842.96	0.00	54600.64	17242.32	1	1	0
1889	148	3	767	118	8	47101.52	47101.52	0.00	37681.20	9420.32	1	1	0
1890	836	1000	703	147	36	32158.33	0.00	32158.33	20430.91	11727.42	1	0	1
1891	340	2	306	18	11	87003.57	87003.57	0.00	70598.33	16405.24	1	1	0
1892	481	2	742	40	12	78296.87	78296.87	0.00	61696.72	16600.15	1	1	0
1893	177	1000	1136	58	50	3346.36	0.00	3346.36	2978.26	368.10	1	0	1
1894	241	1000	438	187	12	116939.59	0.00	116939.59	92013.67	24925.92	1	0	1
1895	633	1000	292	131	22	157631.98	0.00	157631.98	100387.15	57244.83	1	0	1
1896	788	1000	460	83	43	157797.12	0.00	157797.12	107432.64	50364.48	1	0	1
1897	6	3	11	121	48	9624.58	9624.58	0.00	7025.94	2598.64	1	1	0
1898	696	1000	632	89	43	34644.60	0.00	34644.60	26530.35	8114.25	1	0	1
1899	612	1	254	43	1	51235.62	51235.62	0.00	36016.25	15219.37	1	1	0
1900	639	4	581	64	7	46962.01	46962.01	0.00	34808.42	12153.59	1	1	0
1901	89	1000	128	44	43	37412.12	0.00	37412.12	30996.98	6415.14	1	0	1
1902	649	1000	17	92	43	19062.96	0.00	19062.96	13153.44	5909.52	1	0	1
1903	655	2	401	246	17	199759.40	199759.40	0.00	158481.73	41277.67	1	1	0
1904	694	1000	607	115	42	85339.38	0.00	85339.38	68649.22	16690.16	1	0	1
1905	784	1	324	136	17	89281.60	89281.60	0.00	70452.23	18829.37	1	1	0
1906	437	1000	898	160	15	175148.84	0.00	175148.84	140392.68	34756.16	1	0	1
1907	520	1	400	69	37	53108.51	53108.51	0.00	34544.00	18564.51	1	1	0
1908	306	2	425	201	3	221910.26	221910.26	0.00	177982.19	43928.07	1	1	0
1909	83	1000	305	139	21	91196.07	0.00	91196.07	71072.18	20123.89	1	0	1
1910	242	4	148	172	50	37489.74	37489.74	0.00	29480.82	8008.92	1	1	0
1911	699	1000	755	225	45	89421.66	0.00	89421.66	72137.13	17284.53	1	0	1
1912	239	1000	891	57	39	29791.47	0.00	29791.47	22045.68	7745.79	1	0	1
1913	387	2	943	93	21	5363.28	5363.28	0.00	3271.59	2091.69	1	1	0
1914	755	1	732	128	25	218108.77	218108.77	0.00	146294.67	71814.10	1	1	0
1915	735	1000	453	184	34	123856.53	0.00	123856.53	89539.16	34317.37	1	0	1
1916	101	1	417	166	17	91475.21	91475.21	0.00	77702.05	13773.16	1	1	0
1917	762	1000	228	53	27	56449.34	0.00	56449.34	37938.14	18511.20	1	0	1
1918	442	1000	317	138	33	58495.04	0.00	58495.04	40956.63	17538.41	1	0	1
1919	25	1000	797	178	40	4384.16	0.00	4384.16	3551.20	832.96	1	0	1
1920	83	1	240	146	16	183096.96	183096.96	0.00	131918.24	51178.72	1	1	0
1921	574	1000	612	157	37	110863.29	0.00	110863.29	89913.19	20950.10	1	0	1
1922	575	1000	258	230	28	30685.20	0.00	30685.20	21067.21	9617.99	1	0	1
1923	842	1000	586	182	39	89214.41	0.00	89214.41	58430.66	30783.75	1	0	1
1924	339	3	675	85	5	77057.69	77057.69	0.00	59445.72	17611.97	1	1	0
1925	802	1000	274	200	21	7729.68	0.00	7729.68	6415.63	1314.05	1	0	1
1926	114	1000	862	133	9	33649.56	0.00	33649.56	22881.69	10767.87	1	0	1
1927	577	1000	736	163	27	58561.80	0.00	58561.80	45678.18	12883.62	1	0	1
1928	665	1000	233	2	40	95839.73	0.00	95839.73	82390.76	13448.97	1	0	1
1929	601	3	918	97	5	26804.50	26804.50	0.00	21762.86	5041.64	1	1	0
1930	812	1	365	45	15	82346.13	82346.13	0.00	50231.16	32114.97	1	1	0
1931	192	1000	510	157	8	155937.24	0.00	155937.24	107987.48	47949.76	1	0	1
1932	53	1000	603	50	33	194496.16	0.00	194496.16	142408.30	52087.86	1	0	1
1933	672	3	647	92	50	101618.05	101618.05	0.00	74645.04	26973.01	1	1	0
1934	851	2	24	174	47	40959.44	40959.44	0.00	34886.80	6072.64	1	1	0
1935	287	1000	230	3	36	79857.14	0.00	79857.14	58126.16	21730.98	1	0	1
1936	49	1000	778	99	19	101265.46	0.00	101265.46	72767.52	28497.94	1	0	1
1937	511	1000	55	101	34	93776.63	0.00	93776.63	75952.33	17824.30	1	0	1
1938	62	1	5	15	22	129962.84	129962.84	0.00	108101.07	21861.77	1	1	0
1939	678	3	54	111	27	80355.86	80355.86	0.00	53252.94	27102.92	1	1	0
1940	204	1000	363	203	30	35400.88	0.00	35400.88	22302.56	13098.32	1	0	1
1941	65	3	949	64	12	64989.06	64989.06	0.00	51074.34	13914.72	1	1	0
1942	188	1	582	95	46	95721.88	95721.88	0.00	73350.27	22371.61	1	1	0
1943	297	2	833	211	8	125998.98	125998.98	0.00	94413.93	31585.05	1	1	0
1944	859	4	127	149	9	142967.76	142967.76	0.00	106828.01	36139.75	1	1	0
1945	326	4	414	66	37	171522.00	171522.00	0.00	127283.32	44238.68	1	1	0
1946	295	1000	228	22	47	76256.20	0.00	76256.20	57317.88	18938.32	1	0	1
1947	878	1000	13	164	2	68017.44	0.00	68017.44	48667.88	19349.56	1	0	1
1948	680	1000	509	56	39	42434.32	0.00	42434.32	29871.70	12562.62	1	0	1
1949	363	1000	628	138	2	72295.60	0.00	72295.60	52690.30	19605.30	1	0	1
1950	270	1000	558	132	13	68295.91	0.00	68295.91	53322.30	14973.61	1	0	1
1951	86	1	184	170	19	131495.50	131495.50	0.00	103253.76	28241.74	1	1	0
1952	728	1000	512	201	12	57566.69	0.00	57566.69	46774.97	10791.72	1	0	1
1953	83	1000	476	236	44	75136.82	0.00	75136.82	60644.03	14492.79	1	0	1
1954	60	1000	869	46	10	63237.72	0.00	63237.72	53111.92	10125.80	1	0	1
1955	746	2	362	12	50	89216.46	89216.46	0.00	59487.82	29728.64	1	1	0
1956	685	1000	613	52	29	37869.28	0.00	37869.28	25876.41	11992.87	1	0	1
1957	655	2	188	33	12	2691.38	2691.38	0.00	2045.45	645.93	1	1	0
1958	152	1000	282	53	34	53351.09	0.00	53351.09	37033.07	16318.02	1	0	1
1959	215	1000	798	72	10	58870.62	0.00	58870.62	35322.36	23548.26	1	0	1
1960	180	1000	153	70	31	53567.60	0.00	53567.60	39212.05	14355.55	1	0	1
1961	512	1	489	121	9	169538.43	169538.43	0.00	142196.14	27342.29	1	1	0
1962	225	3	80	82	11	82861.65	82861.65	0.00	61497.27	21364.38	1	1	0
1963	207	1000	67	208	29	78747.32	0.00	78747.32	56559.30	22188.02	1	0	1
1964	661	3	225	155	44	89650.78	89650.78	0.00	75476.38	14174.40	1	1	0
1965	743	1000	80	141	7	142372.59	0.00	142372.59	108203.20	34169.39	1	0	1
1966	687	1000	866	138	9	51018.59	0.00	51018.59	38263.96	12754.63	1	0	1
1967	714	3	662	157	27	140022.10	140022.10	0.00	124619.66	15402.44	1	1	0
1968	437	3	953	94	41	57068.88	57068.88	0.00	45655.06	11413.82	1	1	0
1969	331	1000	140	131	6	118905.85	0.00	118905.85	92078.02	26827.83	1	0	1
1970	6	1	621	45	17	159381.48	159381.48	0.00	123500.56	35880.92	1	1	0
1971	802	4	73	16	46	127424.92	127424.92	0.00	105569.20	21855.72	1	1	0
1972	810	2	170	143	1	111222.31	111222.31	0.00	83547.05	27675.26	1	1	0
1973	45	1000	671	163	30	123360.28	0.00	123360.28	91387.41	31972.87	1	0	1
1974	763	2	595	190	32	19095.81	19095.81	0.00	17186.22	1909.59	1	1	0
1975	637	4	207	249	41	186461.39	186461.39	0.00	131186.02	55275.37	1	1	0
1976	266	1000	296	73	26	30347.71	0.00	30347.71	20344.29	10003.42	1	0	1
1977	477	1000	876	32	1	127922.66	0.00	127922.66	99584.24	28338.42	1	0	1
1978	47	2	502	68	37	87059.76	87059.76	0.00	69551.41	17508.35	1	1	0
1979	484	1000	312	72	44	87966.76	0.00	87966.76	76605.76	11361.00	1	0	1
1980	177	1000	974	203	42	32319.12	0.00	32319.12	23592.96	8726.16	1	0	1
1981	862	1000	454	125	43	4601.46	0.00	4601.46	3267.03	1334.43	1	0	1
1982	676	3	886	163	11	108260.07	108260.07	0.00	77673.39	30586.68	1	1	0
1983	647	1	448	44	48	66064.30	66064.30	0.00	42941.80	23122.50	1	1	0
1984	135	1000	395	121	20	26170.44	0.00	26170.44	22319.16	3851.28	1	0	1
1985	436	1000	491	51	42	59510.78	0.00	59510.78	44515.09	14995.69	1	0	1
1986	336	1000	311	208	9	89861.95	0.00	89861.95	69624.66	20237.29	1	0	1
1987	784	1000	777	90	44	76828.47	0.00	76828.47	54693.73	22134.74	1	0	1
1988	28	1	2	239	35	52745.81	52745.81	0.00	38487.20	14258.61	1	1	0
1989	583	3	988	116	43	73369.79	73369.79	0.00	48356.18	25013.61	1	1	0
1990	667	1000	908	230	8	27561.32	0.00	27561.32	18190.48	9370.84	1	0	1
1991	4	4	586	40	12	57060.00	57060.00	0.00	45211.17	11848.83	1	1	0
1992	663	1	99	82	38	103828.71	103828.71	0.00	77055.14	26773.57	1	1	0
1993	441	1000	689	243	8	99717.80	0.00	99717.80	84047.90	15669.90	1	0	1
1994	57	1000	511	72	19	69591.74	0.00	69591.74	47679.54	21912.20	1	0	1
1995	540	3	483	49	17	247696.41	247696.41	0.00	173593.31	74103.10	1	1	0
1996	649	1000	426	150	14	22732.20	0.00	22732.20	14548.62	8183.58	1	0	1
1997	277	1000	536	38	48	171944.32	0.00	171944.32	114264.91	57679.41	1	0	1
1998	392	1000	899	177	25	5141.84	0.00	5141.84	3889.46	1252.38	1	0	1
1999	141	1000	53	189	30	84141.76	0.00	84141.76	58930.44	25211.32	1	0	1
2000	42	1000	11	234	4	49823.16	0.00	49823.16	35872.68	13950.48	1	0	1
2001	231	1000	312	101	50	99266.58	0.00	99266.58	82558.30	16708.28	1	0	1
2002	713	2	171	233	17	103831.68	103831.68	0.00	80662.31	23169.37	1	1	0
2003	507	1000	736	251	3	32693.94	0.00	32693.94	26482.05	6211.89	1	0	1
2004	377	1000	366	78	3	174708.73	0.00	174708.73	135435.30	39273.43	1	0	1
2005	842	4	845	119	31	158154.49	158154.49	0.00	121058.97	37095.52	1	1	0
2006	537	1000	492	216	40	85590.16	0.00	85590.16	62362.58	23227.58	1	0	1
2007	632	1	898	207	21	94720.94	94720.94	0.00	69015.32	25705.62	1	1	0
2008	719	1000	510	125	4	134770.28	0.00	134770.28	114415.57	20354.71	1	0	1
2009	861	1000	727	168	37	51650.28	0.00	51650.28	46485.24	5165.04	1	0	1
2010	503	2	675	249	39	142538.37	142538.37	0.00	111848.17	30690.20	1	1	0
2011	347	2	145	161	45	68171.22	68171.22	0.00	45674.73	22496.49	1	1	0
2012	102	1	857	74	10	20.10	20.10	0.00	16.28	3.82	1	1	0
2013	792	1	781	153	7	80521.96	80521.96	0.00	66704.95	13817.01	1	1	0
2014	145	1000	97	134	18	60305.00	0.00	60305.00	49387.07	10917.93	1	0	1
2015	811	1000	162	203	2	68342.32	0.00	68342.32	58678.80	9663.52	1	0	1
2016	856	2	452	140	10	188312.28	188312.28	0.00	139051.68	49260.60	1	1	0
2017	347	3	418	250	10	85676.00	85676.00	0.00	67300.51	18375.49	1	1	0
2018	370	1000	730	103	10	177245.93	0.00	177245.93	147368.50	29877.43	1	0	1
2019	177	1000	310	56	49	71563.47	0.00	71563.47	54212.92	17350.55	1	0	1
2020	324	1000	643	97	45	17776.25	0.00	17776.25	13509.95	4266.30	1	0	1
2021	59	1000	438	97	43	104124.25	0.00	104124.25	80582.35	23541.90	1	0	1
2022	504	1	356	65	31	66246.62	66246.62	0.00	51949.07	14297.55	1	1	0
2023	177	1000	1050	153	34	108199.04	0.00	108199.04	78980.68	29218.36	1	0	1
2024	595	1000	348	115	37	136935.95	0.00	136935.95	108902.08	28033.87	1	0	1
2025	359	4	926	84	10	22854.69	22854.69	0.00	15084.09	7770.60	1	1	0
2026	355	1	48	211	24	102352.23	102352.23	0.00	78249.97	24102.26	1	1	0
2027	804	1	287	56	10	61884.20	61884.20	0.00	53220.40	8663.80	1	1	0
2028	559	1000	24	252	39	128575.78	0.00	128575.78	84902.99	43672.79	1	0	1
2029	824	1000	251	136	14	137350.85	0.00	137350.85	96991.38	40359.47	1	0	1
2030	17	3	841	204	40	79256.73	79256.73	0.00	52382.03	26874.70	1	1	0
2031	95	3	432	14	50	49397.00	49397.00	0.00	34577.90	14819.10	1	1	0
2032	696	3	114	202	7	114189.82	114189.82	0.00	81094.47	33095.35	1	1	0
2033	433	1000	174	6	30	182934.37	0.00	182934.37	130595.46	52338.91	1	0	1
2034	137	1000	75	187	18	66304.46	0.00	66304.46	46354.53	19949.93	1	0	1
2035	581	3	85	182	42	138541.38	138541.38	0.00	100928.82	37612.56	1	1	0
2036	207	1000	586	223	38	113405.22	0.00	113405.22	89621.96	23783.26	1	0	1
2037	407	1	998	139	9	13021.40	13021.40	0.00	9114.96	3906.44	1	1	0
2038	177	1000	16	112	13	16638.78	0.00	16638.78	12312.72	4326.06	1	0	1
2039	565	1	163	130	45	26558.82	26558.82	0.00	20431.34	6127.48	1	1	0
2040	177	4	14	150	34	56993.65	56993.65	0.00	44953.38	12040.27	1	1	0
2041	339	4	753	149	34	200422.15	200422.15	0.00	148760.31	51661.84	1	1	0
2042	12	1000	368	41	29	62666.00	0.00	62666.00	49102.98	13563.02	1	0	1
2043	177	1000	573	54	28	175823.00	0.00	175823.00	142972.09	32850.91	1	0	1
2044	139	1000	674	227	19	70330.12	0.00	70330.12	48799.90	21530.22	1	0	1
2045	825	1000	377	207	31	58352.17	0.00	58352.17	39583.51	18768.66	1	0	1
2046	177	1000	240	163	31	172788.94	0.00	172788.94	137466.95	35321.99	1	0	1
2047	451	1	885	37	37	54047.56	54047.56	0.00	47561.85	6485.71	1	1	0
2048	191	1	215	171	33	94464.39	94464.39	0.00	62695.20	31769.19	1	1	0
2049	177	4	26	123	34	12003.42	12003.42	0.00	7322.10	4681.32	1	1	0
2050	465	1000	801	40	39	29978.76	0.00	29978.76	22404.40	7574.36	1	0	1
2051	792	2	595	70	50	56143.01	56143.01	0.00	39861.57	16281.44	1	1	0
2052	163	1000	2	162	2	126956.16	0.00	126956.16	84004.21	42951.95	1	0	1
2053	167	1000	994	50	3	145339.52	0.00	145339.52	118936.05	26403.47	1	0	1
2054	445	3	749	248	23	37440.30	37440.30	0.00	31559.40	5880.90	1	1	0
2055	563	1000	169	244	18	77499.83	0.00	77499.83	63627.46	13872.37	1	0	1
2056	428	2	844	251	1	98590.08	98590.08	0.00	78542.94	20047.14	1	1	0
2057	534	1	349	144	32	99092.97	99092.97	0.00	72476.63	26616.34	1	1	0
2058	72	1000	311	78	41	7765.54	0.00	7765.54	6756.02	1009.52	1	0	1
2059	543	1000	744	247	41	102174.98	0.00	102174.98	73475.54	28699.44	1	0	1
2060	243	1000	184	212	39	181142.08	0.00	181142.08	130722.64	50419.44	1	0	1
2061	420	4	196	189	38	105805.66	105805.66	0.00	84815.94	20989.72	1	1	0
2062	47	1000	185	252	21	119715.49	0.00	119715.49	86722.98	32992.51	1	0	1
2063	331	1000	436	241	11	106769.17	0.00	106769.17	76977.91	29791.26	1	0	1
2064	73	1000	569	37	19	7229.71	0.00	7229.71	5858.42	1371.29	1	0	1
2065	218	1000	249	155	9	88787.56	0.00	88787.56	75292.48	13495.08	1	0	1
2066	198	2	26	158	16	76552.47	76552.47	0.00	55883.34	20669.13	1	1	0
2067	813	1000	515	11	3	62818.25	0.00	62818.25	43071.30	19746.95	1	0	1
2068	678	4	281	251	39	139151.10	139151.10	0.00	105682.37	33468.73	1	1	0
2069	797	4	230	144	28	117131.62	117131.62	0.00	96690.87	20440.75	1	1	0
2070	875	1000	981	178	45	171725.27	0.00	171725.27	123143.47	48581.80	1	0	1
2071	457	1000	226	250	2	169396.69	0.00	169396.69	138304.26	31092.43	1	0	1
2072	741	3	632	151	43	63372.78	63372.78	0.00	48844.04	14528.74	1	1	0
2073	3	1000	767	171	17	47160.46	0.00	47160.46	36772.38	10388.08	1	0	1
2074	296	1000	318	186	13	87895.77	0.00	87895.77	69474.77	18421.00	1	0	1
2075	417	1	998	100	10	19128.96	19128.96	0.00	15111.88	4017.08	1	1	0
2076	485	1000	329	230	41	61009.10	0.00	61009.10	44807.99	16201.11	1	0	1
2077	615	1000	134	34	42	7674.36	0.00	7674.36	4604.64	3069.72	1	0	1
2078	371	1000	185	89	31	149449.68	0.00	149449.68	99699.43	49750.25	1	0	1
2079	580	1000	3	3	10	224432.20	0.00	224432.20	166611.55	57820.65	1	0	1
2080	717	1000	804	37	37	107568.07	0.00	107568.07	80706.01	26862.06	1	0	1
2081	732	3	903	207	10	146574.26	146574.26	0.00	110060.20	36514.06	1	1	0
2082	831	1000	90	151	26	158084.08	0.00	158084.08	121065.85	37018.23	1	0	1
2083	414	4	528	35	14	6283.38	6283.38	0.00	5215.20	1068.18	1	1	0
2084	558	1000	446	72	5	4450.12	0.00	4450.12	3471.09	979.03	1	0	1
2085	843	4	422	92	24	120085.94	120085.94	0.00	98882.00	21203.94	1	1	0
2086	565	1000	111	66	38	13825.77	0.00	13825.77	9369.74	4456.03	1	0	1
2087	131	1000	941	109	41	130722.31	0.00	130722.31	94689.54	36032.77	1	0	1
2088	85	1000	489	41	33	64237.38	0.00	64237.38	53775.60	10461.78	1	0	1
2089	741	1000	323	182	36	162160.67	0.00	162160.67	122867.32	39293.35	1	0	1
2090	643	1000	169	101	42	160883.68	0.00	160883.68	108847.54	52036.14	1	0	1
2091	407	1	966	137	43	3296.72	3296.72	0.00	2637.36	659.36	1	1	0
2092	233	1000	733	238	2	87426.08	0.00	87426.08	64665.67	22760.41	1	0	1
2093	752	1000	94	195	5	87647.95	0.00	87647.95	58940.90	28707.05	1	0	1
2094	875	1000	40	209	34	132667.10	0.00	132667.10	92122.46	40544.64	1	0	1
2095	574	4	597	124	45	16459.06	16459.06	0.00	13331.84	3127.22	1	1	0
2096	690	1000	997	47	46	9331.62	0.00	9331.62	7558.62	1773.00	1	0	1
2097	69	1000	304	115	31	124442.59	0.00	124442.59	100840.98	23601.61	1	0	1
2098	245	1000	472	233	13	138395.72	0.00	138395.72	99905.75	38489.97	1	0	1
2099	325	2	864	134	6	143027.88	143027.88	0.00	116496.09	26531.79	1	1	0
2100	79	3	243	162	13	17862.30	17862.30	0.00	12146.37	5715.93	1	1	0
2101	394	2	232	199	26	132526.62	132526.62	0.00	93219.35	39307.27	1	1	0
2102	677	2	355	251	18	100630.67	100630.67	0.00	81150.23	19480.44	1	1	0
2103	177	4	402	211	26	113628.10	113628.10	0.00	75725.60	37902.50	1	1	0
2104	177	3	975	249	10	84298.54	84298.54	0.00	56765.47	27533.07	1	1	0
2105	177	4	963	136	6	52693.32	52693.32	0.00	39817.62	12875.70	1	1	0
2106	177	4	302	85	40	105477.82	105477.82	0.00	76644.65	28833.17	1	1	0
2107	177	4	506	113	14	41979.36	41979.36	0.00	35262.66	6716.70	1	1	0
2108	177	4	942	137	34	31767.92	31767.92	0.00	21919.84	9848.08	1	1	0
2109	177	2	322	39	39	46880.40	46880.40	0.00	33753.92	13126.48	1	1	0
2110	177	1000	244	244	10	43585.09	0.00	43585.09	33530.67	10054.42	1	0	1
2111	177	1	421	71	29	30766.62	30766.62	0.00	19039.56	11727.06	1	1	0
2112	177	2	850	228	5	127008.62	127008.62	0.00	99230.13	27778.49	1	1	0
2113	177	2	106	220	33	23859.56	23859.56	0.00	15590.70	8268.86	1	1	0
2114	177	1	109	211	39	127028.83	127028.83	0.00	101086.38	25942.45	1	1	0
2115	177	3	1145	31	5	74130.49	74130.49	0.00	61442.21	12688.28	1	1	0
2116	177	1	1049	146	22	78837.87	78837.87	0.00	60703.90	18133.97	1	1	0
2117	177	2	1057	86	4	127496.39	127496.39	0.00	92691.49	34804.90	1	1	0
2118	177	1000	652	214	26	266328.50	0.00	266328.50	208671.11	57657.39	1	0	1
2119	177	1	1091	1	43	4088.20	4088.20	0.00	2616.44	1471.76	1	1	0
2120	177	3	857	143	17	26515.16	26515.16	0.00	16969.68	9545.48	1	1	0
2121	177	1000	849	41	31	10029.34	0.00	10029.34	6819.96	3209.38	1	0	1
2122	177	1000	1018	79	18	99023.76	0.00	99023.76	64517.00	34506.76	1	0	1
2123	177	3	1188	239	1	71765.04	71765.04	0.00	58908.17	12856.87	1	1	0
2124	177	1000	450	36	9	32905.61	0.00	32905.61	22928.58	9977.03	1	0	1
2125	177	1000	744	86	11	90886.94	0.00	90886.94	77174.23	13712.71	1	0	1
2126	177	1000	109	193	49	66570.38	0.00	66570.38	47201.22	19369.16	1	0	1
2127	177	1	175	235	32	274647.39	274647.39	0.00	197537.49	77109.90	1	1	0
2128	177	1000	311	248	35	27194.85	0.00	27194.85	23387.58	3807.27	1	0	1
2129	177	2	503	175	20	9619.36	9619.36	0.00	5867.80	3751.56	1	1	0
2130	177	1000	677	90	10	102778.82	0.00	102778.82	79804.68	22974.14	1	0	1
2131	177	4	526	184	20	8352.15	8352.15	0.00	6524.67	1827.48	1	1	0
2132	177	1	835	178	12	71561.42	71561.42	0.00	53466.40	18095.02	1	1	0
2133	177	4	937	9	20	39610.06	39610.06	0.00	27330.94	12279.12	1	1	0
2134	177	1000	356	103	22	62113.31	0.00	62113.31	47935.99	14177.32	1	0	1
2135	177	1000	47	106	12	126613.28	0.00	126613.28	99650.36	26962.92	1	0	1
2136	177	1000	1122	65	45	47211.89	0.00	47211.89	38402.42	8809.47	1	0	1
2137	177	2	1095	201	29	230776.46	230776.46	0.00	173050.39	57726.07	1	1	0
2138	177	3	779	241	30	9785.36	9785.36	0.00	5969.04	3816.32	1	1	0
2139	177	1	194	67	27	81196.32	81196.32	0.00	68395.12	12801.20	1	1	0
2140	177	1000	1034	216	32	173955.38	0.00	173955.38	123257.39	50697.99	1	0	1
2141	177	1000	745	195	4	56167.98	0.00	56167.98	35385.84	20782.14	1	0	1
2142	177	1000	433	8	12	144307.35	0.00	144307.35	109811.13	34496.22	1	0	1
2143	177	1000	726	219	37	174052.88	0.00	174052.88	139701.60	34351.28	1	0	1
2144	177	4	917	210	16	141149.84	141149.84	0.00	111289.21	29860.63	1	1	0
2145	177	2	393	206	14	95334.67	95334.67	0.00	74160.46	21174.21	1	1	0
2146	177	1000	209	184	31	32413.88	0.00	32413.88	25066.02	7347.86	1	0	1
2147	177	1	841	56	23	71071.89	71071.89	0.00	55452.11	15619.78	1	1	0
2148	177	3	905	3	11	145015.90	145015.90	0.00	109383.86	35632.04	1	1	0
2149	177	1000	926	230	45	142469.75	0.00	142469.75	103354.83	39114.92	1	0	1
2150	177	1000	1049	116	34	27796.93	0.00	27796.93	19179.86	8617.07	1	0	1
2151	177	1000	1062	176	30	146816.86	0.00	146816.86	103359.45	43457.41	1	0	1
2152	177	2	42	12	13	100930.54	100930.54	0.00	72397.29	28533.25	1	1	0
2153	177	1	937	90	37	127874.37	127874.37	0.00	87630.79	40243.58	1	1	0
2154	177	3	1015	191	30	121426.79	121426.79	0.00	95988.78	25438.01	1	1	0
2155	177	1000	323	23	49	33292.00	0.00	33292.00	23304.40	9987.60	1	0	1
2156	177	1000	916	26	35	22027.36	0.00	22027.36	18723.24	3304.12	1	0	1
2157	177	2	360	46	33	17339.16	17339.16	0.00	11617.24	5721.92	1	1	0
2158	177	1	936	203	1	72979.29	72979.29	0.00	53509.45	19469.84	1	1	0
2159	177	1000	107	63	18	151523.61	0.00	151523.61	103105.87	48417.74	1	0	1
2160	177	1	49	136	49	99558.52	99558.52	0.00	78423.78	21134.74	1	1	0
2161	177	1	629	210	5	74841.14	74841.14	0.00	53598.75	21242.39	1	1	0
2162	177	2	304	77	35	37946.13	37946.13	0.00	23710.15	14235.98	1	1	0
2163	177	4	266	95	7	18000.15	18000.15	0.00	13860.10	4140.05	1	1	0
2164	177	2	408	240	36	63410.29	63410.29	0.00	47161.83	16248.46	1	1	0
2165	177	1000	609	16	36	65967.84	0.00	65967.84	45517.77	20450.07	1	0	1
2166	177	1000	536	227	15	14882.10	0.00	14882.10	10863.96	4018.14	1	0	1
2167	177	3	70	245	32	93992.49	93992.49	0.00	81751.40	12241.09	1	1	0
2168	177	1000	1076	14	8	141278.33	0.00	141278.33	107735.23	33543.10	1	0	1
2169	177	1000	1005	87	34	96666.35	0.00	96666.35	76890.39	19775.96	1	0	1
2170	177	1000	650	201	41	7954.15	0.00	7954.15	5849.80	2104.35	1	0	1
2171	177	1000	575	18	33	51668.07	0.00	51668.07	40752.20	10915.87	1	0	1
2172	177	4	430	217	14	31764.36	31764.36	0.00	27739.13	4025.23	1	1	0
2173	177	1	763	199	49	121885.17	121885.17	0.00	83816.31	38068.86	1	1	0
2174	177	3	580	27	46	2728.39	2728.39	0.00	2128.14	600.25	1	1	0
2175	177	1000	614	190	18	27254.81	0.00	27254.81	20373.97	6880.84	1	0	1
2176	177	1000	1016	19	14	45905.19	0.00	45905.19	39521.22	6383.97	1	0	1
2177	177	4	1153	78	22	205928.37	205928.37	0.00	160760.23	45168.14	1	1	0
2178	177	1000	197	238	23	77133.80	0.00	77133.80	51948.82	25184.98	1	0	1
2179	177	1000	988	123	5	46936.30	0.00	46936.30	30978.00	15958.30	1	0	1
2180	177	1	702	245	43	44130.01	44130.01	0.00	34408.59	9721.42	1	1	0
2181	177	4	331	198	41	80063.83	80063.83	0.00	51947.10	28116.73	1	1	0
2182	177	1000	105	54	6	163139.92	0.00	163139.92	121447.62	41692.30	1	0	1
2183	177	1000	85	126	33	117347.96	0.00	117347.96	75600.89	41747.07	1	0	1
2184	177	2	1036	38	3	21904.54	21904.54	0.00	17225.80	4678.74	1	1	0
2185	177	1	175	199	9	6999.51	6999.51	0.00	5455.68	1543.83	1	1	0
2186	177	1	971	165	38	41963.31	41963.31	0.00	34697.90	7265.41	1	1	0
2187	177	1000	993	14	18	116759.30	0.00	116759.30	84669.56	32089.74	1	0	1
2188	177	2	1116	151	22	124960.02	124960.02	0.00	81721.28	43238.74	1	1	0
2189	177	1000	1008	124	25	148468.25	0.00	148468.25	121431.67	27036.58	1	0	1
2190	177	1000	348	98	9	128669.15	0.00	128669.15	104956.05	23713.10	1	0	1
2191	177	1000	1030	199	7	1803.90	0.00	1803.90	1082.34	721.56	1	0	1
2192	177	1000	1161	218	10	96170.67	0.00	96170.67	81853.78	14316.89	1	0	1
2193	177	1000	784	114	11	73183.22	0.00	73183.22	60358.93	12824.29	1	0	1
2194	177	1	442	6	41	114947.52	114947.52	0.00	76199.27	38748.25	1	1	0
2195	177	1000	1214	31	23	121091.79	0.00	121091.79	87579.50	33512.29	1	0	1
2196	177	1000	846	67	13	19347.08	0.00	19347.08	15253.66	4093.42	1	0	1
2197	177	2	184	42	22	54161.60	54161.60	0.00	35205.00	18956.60	1	1	0
2198	177	1000	582	251	10	87528.50	0.00	87528.50	69449.25	18079.25	1	0	1
2199	177	1000	819	243	48	125691.47	0.00	125691.47	98264.36	27427.11	1	0	1
2200	177	4	303	98	33	97455.52	97455.52	0.00	79855.43	17600.09	1	1	0
2201	177	1000	995	227	38	119882.56	0.00	119882.56	81722.97	38159.59	1	0	1
2202	177	1000	319	201	11	207589.80	0.00	207589.80	146769.11	60820.69	1	0	1
2203	177	1000	99	250	38	71816.56	0.00	71816.56	50277.08	21539.48	1	0	1
2204	177	1000	440	182	25	27183.34	0.00	27183.34	18646.85	8536.49	1	0	1
2205	177	1000	1118	51	32	34189.97	0.00	34189.97	25662.19	8527.78	1	0	1
2206	177	1000	95	232	1	414.78	0.00	414.78	348.42	66.36	1	0	1
2207	177	3	953	160	22	16170.80	16170.80	0.00	13260.04	2910.76	1	1	0
2208	177	1000	177	127	35	158201.98	0.00	158201.98	121363.34	36838.64	1	0	1
2209	177	4	542	55	41	41594.42	41594.42	0.00	29583.52	12010.90	1	1	0
2210	177	3	442	187	5	130872.73	130872.73	0.00	85759.29	45113.44	1	1	0
2211	177	1000	989	76	50	106367.98	0.00	106367.98	75807.98	30560.00	1	0	1
2212	177	1000	1207	219	3	66669.35	0.00	66669.35	51208.82	15460.53	1	0	1
2213	177	1000	1185	1	47	74086.77	0.00	74086.77	55372.31	18714.46	1	0	1
2214	177	1	1169	150	24	105063.50	105063.50	0.00	73006.18	32057.32	1	1	0
2215	177	1000	627	128	49	137140.99	0.00	137140.99	104081.86	33059.13	1	0	1
2216	177	3	1030	216	38	117487.64	117487.64	0.00	84626.60	32861.04	1	1	0
2217	177	1	933	209	9	81985.47	81985.47	0.00	62217.12	19768.35	1	1	0
2218	177	1000	422	122	9	98962.80	0.00	98962.80	77962.14	21000.66	1	0	1
2219	177	1	87	43	38	56173.18	56173.18	0.00	34865.24	21307.94	1	1	0
2220	177	1000	758	163	37	978.94	0.00	978.94	792.94	186.00	1	0	1
2221	177	2	1093	111	18	26746.48	26746.48	0.00	20216.16	6530.32	1	1	0
2222	177	1000	405	123	24	151980.22	0.00	151980.22	125774.42	26205.80	1	0	1
2223	177	1000	854	217	46	83198.16	0.00	83198.16	59494.88	23703.28	1	0	1
2224	177	1000	333	38	47	161415.43	0.00	161415.43	118981.74	42433.69	1	0	1
2225	177	1000	282	241	24	8564.30	0.00	8564.30	5566.80	2997.50	1	0	1
2226	177	1000	606	199	36	156107.00	0.00	156107.00	114696.68	41410.32	1	0	1
2227	177	3	735	253	1	13729.26	13729.26	0.00	11669.88	2059.38	1	1	0
2228	177	4	347	197	33	32840.08	32840.08	0.00	23507.68	9332.40	1	1	0
2229	177	3	946	135	46	38870.99	38870.99	0.00	24706.48	14164.51	1	1	0
2230	177	1	442	80	13	45914.48	45914.48	0.00	29921.22	15993.26	1	1	0
2231	177	2	971	95	26	72794.48	72794.48	0.00	62603.28	10191.20	1	1	0
2232	177	1000	261	223	16	133081.50	0.00	133081.50	97775.62	35305.88	1	0	1
2233	177	2	16	142	4	94894.87	94894.87	0.00	80892.76	14002.11	1	1	0
2234	177	1000	506	202	15	69142.32	0.00	69142.32	52548.12	16594.20	1	0	1
2235	177	3	679	127	32	95412.12	95412.12	0.00	70025.68	25386.44	1	1	0
2236	177	3	882	146	30	44098.13	44098.13	0.00	36136.59	7961.54	1	1	0
2237	177	4	158	82	9	221653.32	221653.32	0.00	152811.16	68842.16	1	1	0
2238	177	1	696	13	9	87622.93	87622.93	0.00	63112.48	24510.45	1	1	0
2239	177	1000	709	58	22	41490.99	0.00	41490.99	30388.17	11102.82	1	0	1
2240	177	1000	36	47	39	96163.00	0.00	96163.00	61544.30	34618.70	1	0	1
2241	177	1000	1167	191	46	115854.25	0.00	115854.25	88124.28	27729.97	1	0	1
2242	177	1000	1118	194	19	180074.59	0.00	180074.59	145425.46	34649.13	1	0	1
2243	177	3	703	37	39	47362.57	47362.57	0.00	34948.01	12414.56	1	1	0
2244	177	1	1085	59	35	8080.77	8080.77	0.00	6464.61	1616.16	1	1	0
2245	177	1000	236	233	48	80878.12	0.00	80878.12	63588.41	17289.71	1	0	1
2246	177	4	92	42	38	32009.12	32009.12	0.00	19525.60	12483.52	1	1	0
2247	177	1000	54	124	41	21336.16	0.00	21336.16	16193.34	5142.82	1	0	1
2248	177	1	1082	102	9	110779.84	110779.84	0.00	84003.34	26776.50	1	1	0
2249	177	1000	317	231	9	196434.88	0.00	196434.88	148805.06	47629.82	1	0	1
2250	177	1	513	93	19	39050.04	39050.04	0.00	32940.74	6109.30	1	1	0
2251	177	4	249	174	37	249634.63	249634.63	0.00	200496.37	49138.26	1	1	0
2252	177	1000	841	130	49	67344.11	0.00	67344.11	51796.53	15547.58	1	0	1
2253	177	1	769	47	7	98769.78	98769.78	0.00	65889.76	32880.02	1	1	0
2254	177	2	210	252	40	22216.61	22216.61	0.00	19967.23	2249.38	1	1	0
2255	177	1	171	221	13	132730.82	132730.82	0.00	96462.16	36268.66	1	1	0
2256	177	4	206	237	3	126794.57	126794.57	0.00	93487.30	33307.27	1	1	0
2257	177	2	408	56	17	55590.71	55590.71	0.00	45956.26	9634.45	1	1	0
2258	177	1000	340	214	10	131355.52	0.00	131355.52	93531.04	37824.48	1	0	1
2259	177	3	634	76	44	16510.40	16510.40	0.00	14364.00	2146.40	1	1	0
2260	177	1000	275	202	45	2571.31	0.00	2571.31	2159.90	411.41	1	0	1
2261	177	1000	314	232	35	33437.78	0.00	33437.78	28661.55	4776.23	1	0	1
2262	177	2	943	38	10	167361.87	167361.87	0.00	130066.83	37295.04	1	1	0
2263	177	3	252	39	22	3855.61	3855.61	0.00	2408.73	1446.88	1	1	0
2264	177	1000	155	96	26	20317.48	0.00	20317.48	15034.92	5282.56	1	0	1
2265	177	2	82	169	14	161893.44	161893.44	0.00	118768.19	43125.25	1	1	0
2266	177	2	980	135	24	29233.00	29233.00	0.00	22951.18	6281.82	1	1	0
2267	177	1000	277	158	31	55542.81	0.00	55542.81	40396.38	15146.43	1	0	1
2268	177	2	37	151	22	154662.90	154662.90	0.00	116549.40	38113.50	1	1	0
2269	177	2	988	53	50	82869.96	82869.96	0.00	56717.42	26152.54	1	1	0
2270	177	3	828	208	28	88528.89	88528.89	0.00	64128.94	24399.95	1	1	0
2271	177	1000	578	4	12	154993.32	0.00	154993.32	124490.18	30503.14	1	0	1
2272	177	1	1020	113	45	43695.22	43695.22	0.00	32819.80	10875.42	1	1	0
2273	177	1000	268	196	22	87375.92	0.00	87375.92	55046.80	32329.12	1	0	1
2274	177	1000	247	243	26	74248.20	0.00	74248.20	50430.62	23817.58	1	0	1
2275	177	1	711	26	7	84893.66	84893.66	0.00	71461.38	13432.28	1	1	0
2276	177	3	873	152	15	110571.00	110571.00	0.00	88132.30	22438.70	1	1	0
2277	177	4	1100	78	41	8114.51	8114.51	0.00	6329.32	1785.19	1	1	0
2278	177	1000	966	2	21	86646.03	0.00	86646.03	67854.71	18791.32	1	0	1
2279	177	4	1201	28	27	71307.25	71307.25	0.00	43962.08	27345.17	1	1	0
2280	177	1000	681	30	37	124139.87	0.00	124139.87	86785.74	37354.13	1	0	1
2281	177	1000	144	169	45	49289.28	0.00	49289.28	36474.06	12815.22	1	0	1
2282	177	1000	188	155	28	119695.03	0.00	119695.03	82902.05	36792.98	1	0	1
2283	177	1000	524	29	17	82230.31	0.00	82230.31	64887.99	17342.32	1	0	1
2284	177	1000	245	176	26	9292.88	0.00	9292.88	6040.37	3252.51	1	0	1
2285	177	1000	1063	224	40	39252.66	0.00	39252.66	34447.62	4805.04	1	0	1
2286	177	1000	216	150	10	151769.30	0.00	151769.30	126048.71	25720.59	1	0	1
2287	177	2	824	183	45	48497.90	48497.90	0.00	40738.20	7759.70	1	1	0
2288	177	3	1036	42	5	74829.50	74829.50	0.00	60611.90	14217.60	1	1	0
2289	177	1000	242	34	1	44115.60	0.00	44115.60	36615.92	7499.68	1	0	1
2290	177	2	470	53	3	9601.94	9601.94	0.00	8257.66	1344.28	1	1	0
2291	177	1	512	26	25	124108.28	124108.28	0.00	98499.11	25609.17	1	1	0
2292	177	3	647	93	47	77886.54	77886.54	0.00	63866.97	14019.57	1	1	0
2293	177	1000	1149	166	49	77016.40	0.00	77016.40	54681.65	22334.75	1	0	1
2294	177	1000	378	97	27	73959.59	0.00	73959.59	57182.71	16776.88	1	0	1
2295	177	1	1160	163	30	30321.40	30321.40	0.00	18799.28	11522.12	1	1	0
2296	177	1000	227	31	37	136621.59	0.00	136621.59	100093.12	36528.47	1	0	1
2297	177	1	430	220	12	136235.38	136235.38	0.00	87447.89	48787.49	1	1	0
2298	177	1000	1109	244	3	94300.04	0.00	94300.04	81886.68	12413.36	1	0	1
2299	177	1000	728	45	12	91221.17	0.00	91221.17	79545.97	11675.20	1	0	1
2300	177	2	451	192	30	10077.36	10077.36	0.00	8162.64	1914.72	1	1	0
2301	177	2	444	178	38	6797.52	6797.52	0.00	4214.46	2583.06	1	1	0
2302	177	1	194	65	25	59196.40	59196.40	0.00	49076.33	10120.07	1	1	0
2303	177	1	264	2	39	25429.38	25429.38	0.00	19022.97	6406.41	1	1	0
2304	177	1000	1117	199	45	66770.30	0.00	66770.30	50140.49	16629.81	1	0	1
2305	177	4	983	6	21	132399.09	132399.09	0.00	100824.39	31574.70	1	1	0
2306	177	3	309	241	39	90993.10	90993.10	0.00	78254.10	12739.00	1	1	0
2307	177	4	861	200	26	244688.22	244688.22	0.00	179391.54	65296.68	1	1	0
2308	177	4	978	32	38	40002.17	40002.17	0.00	29293.81	10708.36	1	1	0
2309	177	4	994	172	30	88525.01	88525.01	0.00	75694.67	12830.34	1	1	0
2310	177	4	180	28	26	35745.84	35745.84	0.00	29011.65	6734.19	1	1	0
2311	177	1000	1018	16	8	74621.33	0.00	74621.33	56157.95	18463.38	1	0	1
2312	177	1000	1191	200	11	4892.68	0.00	4892.68	2984.52	1908.16	1	0	1
2313	177	1	551	207	14	157234.66	157234.66	0.00	104347.97	52886.69	1	1	0
2314	177	1000	105	109	35	58561.58	0.00	58561.58	41340.51	17221.07	1	0	1
2315	177	1000	24	64	31	112222.62	0.00	112222.62	79063.23	33159.39	1	0	1
2316	177	1000	1177	184	41	209190.36	0.00	209190.36	159548.48	49641.88	1	0	1
2317	177	1000	925	68	10	44909.70	0.00	44909.70	29956.85	14952.85	1	0	1
2318	177	1000	809	1	19	97756.18	0.00	97756.18	71302.49	26453.69	1	0	1
2319	177	1000	585	186	13	79291.36	0.00	79291.36	63219.72	16071.64	1	0	1
2320	177	1000	1196	210	17	117478.46	0.00	117478.46	91700.61	25777.85	1	0	1
2321	177	2	526	29	33	17214.86	17214.86	0.00	12425.62	4789.24	1	1	0
2322	177	1000	539	100	45	18939.30	0.00	18939.30	14923.80	4015.50	1	0	1
2323	177	1	12	253	37	133393.97	133393.97	0.00	102727.02	30666.95	1	1	0
2324	177	3	1145	177	12	58451.68	58451.68	0.00	43455.51	14996.17	1	1	0
2325	177	1000	943	9	3	82452.46	0.00	82452.46	57119.58	25332.88	1	0	1
2326	177	1000	447	70	35	99894.08	0.00	99894.08	71864.37	28029.71	1	0	1
2327	177	3	877	241	49	163872.06	163872.06	0.00	125240.64	38631.42	1	1	0
2328	177	4	966	178	30	15243.83	15243.83	0.00	9996.68	5247.15	1	1	0
2329	177	1000	107	79	41	63822.71	0.00	63822.71	45834.77	17987.94	1	0	1
2330	177	1000	263	58	12	59293.11	0.00	59293.11	46048.16	13244.95	1	0	1
2331	177	3	1072	64	8	7198.51	7198.51	0.00	5182.93	2015.58	1	1	0
2332	177	3	809	246	27	98338.80	98338.80	0.00	70586.52	27752.28	1	1	0
2333	177	4	720	60	44	58499.61	58499.61	0.00	35684.73	22814.88	1	1	0
2334	177	1	822	153	15	31377.90	31377.90	0.00	19485.50	11892.40	1	1	0
2335	177	1	480	183	26	129329.17	129329.17	0.00	101572.34	27756.83	1	1	0
2336	177	1000	323	51	23	30342.48	0.00	30342.48	26701.40	3641.08	1	0	1
2337	177	3	1056	27	4	48036.50	48036.50	0.00	33406.82	14629.68	1	1	0
2338	177	2	737	123	16	185438.50	185438.50	0.00	138516.11	46922.39	1	1	0
2339	177	1000	649	44	10	113306.28	0.00	113306.28	85657.46	27648.82	1	0	1
2340	177	2	273	93	18	82351.37	82351.37	0.00	51633.00	30718.37	1	1	0
2341	177	1000	288	140	18	139972.42	0.00	139972.42	100101.82	39870.60	1	0	1
2342	177	1000	391	10	7	51882.78	0.00	51882.78	42806.14	9076.64	1	0	1
2343	177	3	603	140	29	40506.80	40506.80	0.00	24709.15	15797.65	1	1	0
2344	177	1000	773	32	14	74567.16	0.00	74567.16	54719.18	19847.98	1	0	1
2345	177	2	132	219	41	28172.79	28172.79	0.00	20927.44	7245.35	1	1	0
2346	177	2	50	72	32	63624.40	63624.40	0.00	48990.80	14633.60	1	1	0
2347	177	4	622	248	13	55513.22	55513.22	0.00	38794.73	16718.49	1	1	0
2348	177	1000	701	156	27	220807.54	0.00	220807.54	160841.05	59966.49	1	0	1
2349	177	3	112	178	15	29724.63	29724.63	0.00	24671.43	5053.20	1	1	0
2350	177	1000	898	195	35	21795.48	0.00	21795.48	14366.33	7429.15	1	0	1
2351	177	1000	607	217	47	9039.70	0.00	9039.70	7502.95	1536.75	1	0	1
2352	177	3	688	107	37	3782.87	3782.87	0.00	2345.35	1437.52	1	1	0
2353	177	1000	742	114	25	133411.15	0.00	133411.15	101661.60	31749.55	1	0	1
2354	177	1000	591	21	31	48726.73	0.00	48726.73	41653.05	7073.68	1	0	1
2355	177	4	421	160	37	58599.36	58599.36	0.00	42932.64	15666.72	1	1	0
2356	177	2	816	101	16	163085.36	163085.36	0.00	135127.74	27957.62	1	1	0
2357	177	1000	610	6	29	107857.46	0.00	107857.46	79347.99	28509.47	1	0	1
2358	177	1000	855	194	38	106129.16	0.00	106129.16	78051.82	28077.34	1	0	1
2359	177	1000	515	83	35	87852.32	0.00	87852.32	63258.97	24593.35	1	0	1
2360	177	1000	502	92	13	58084.50	0.00	58084.50	42914.86	15169.64	1	0	1
2361	177	1000	1152	175	12	37274.62	0.00	37274.62	26728.01	10546.61	1	0	1
2362	177	2	806	190	16	65112.68	65112.68	0.00	44397.10	20715.58	1	1	0
2363	177	1	592	187	39	75907.56	75907.56	0.00	56648.70	19258.86	1	1	0
2364	177	1000	432	130	43	9145.97	0.00	9145.97	6658.65	2487.32	1	0	1
2365	177	1000	65	184	23	60629.52	0.00	60629.52	47291.04	13338.48	1	0	1
2366	177	1000	756	106	14	212239.03	0.00	212239.03	146891.39	65347.64	1	0	1
2367	177	1000	344	53	8	42103.91	0.00	42103.91	29795.70	12308.21	1	0	1
2368	177	3	967	193	37	19165.48	19165.48	0.00	13415.84	5749.64	1	1	0
2369	177	4	1066	49	2	29300.72	29300.72	0.00	19338.48	9962.24	1	1	0
2370	177	1000	901	124	33	43559.64	0.00	43559.64	30905.77	12653.87	1	0	1
2371	177	1000	494	185	31	27917.74	0.00	27917.74	24701.24	3216.50	1	0	1
2372	177	3	28	248	13	87842.70	87842.70	0.00	68517.27	19325.43	1	1	0
2373	177	1	648	165	46	139405.67	139405.67	0.00	96579.31	42826.36	1	1	0
2374	177	1	52	242	43	76638.96	76638.96	0.00	55474.89	21164.07	1	1	0
2375	177	1000	777	62	48	59948.08	0.00	59948.08	47358.96	12589.12	1	0	1
2376	177	1000	1017	74	2	155112.31	0.00	155112.31	114747.95	40364.36	1	0	1
2377	177	1000	1107	210	28	92591.70	0.00	92591.70	75607.75	16983.95	1	0	1
2378	177	1	670	107	49	53393.53	53393.53	0.00	39000.67	14392.86	1	1	0
2379	177	1000	1165	14	32	50070.01	0.00	50070.01	40553.98	9516.03	1	0	1
2380	177	1000	1197	31	45	143755.75	0.00	143755.75	110481.21	33274.54	1	0	1
2381	177	1	1125	196	19	125159.10	125159.10	0.00	91670.75	33488.35	1	1	0
2382	177	3	599	59	43	231827.54	231827.54	0.00	174287.22	57540.32	1	1	0
2383	177	1000	505	84	29	121786.28	0.00	121786.28	100049.46	21736.82	1	0	1
2384	177	3	205	103	45	31947.59	31947.59	0.00	27683.90	4263.69	1	1	0
2385	177	1000	960	98	25	62983.84	0.00	62983.84	55072.31	7911.53	1	0	1
2386	177	1000	923	200	44	88583.18	0.00	88583.18	74764.40	13818.78	1	0	1
2387	177	1	134	19	23	81463.92	81463.92	0.00	58958.67	22505.25	1	1	0
2388	177	4	652	206	25	143064.66	143064.66	0.00	101448.70	41615.96	1	1	0
2389	177	1000	230	240	20	134848.45	0.00	134848.45	90134.52	44713.93	1	0	1
2390	177	4	144	121	42	44149.50	44149.50	0.00	33112.08	11037.42	1	1	0
2391	177	1	620	190	47	49278.25	49278.25	0.00	32927.35	16350.90	1	1	0
2392	177	1000	402	5	27	73399.77	0.00	73399.77	60921.81	12477.96	1	0	1
2393	177	1	442	98	29	21969.30	21969.30	0.00	18454.20	3515.10	1	1	0
2394	177	2	247	242	14	103075.72	103075.72	0.00	72839.25	30236.47	1	1	0
2395	177	1000	854	222	20	101828.52	0.00	101828.52	70225.34	31603.18	1	0	1
2396	177	1000	281	11	29	180156.28	0.00	180156.28	127478.91	52677.37	1	0	1
2397	177	1	321	242	40	151410.14	151410.14	0.00	109834.57	41575.57	1	1	0
2398	177	1000	874	27	28	93518.21	0.00	93518.21	76797.48	16720.73	1	0	1
2399	177	1000	877	9	25	109750.32	0.00	109750.32	81419.64	28330.68	1	0	1
2400	177	2	1171	98	43	44367.07	44367.07	0.00	36767.92	7599.15	1	1	0
2401	177	1000	192	171	2	81838.48	0.00	81838.48	57542.55	24295.93	1	0	1
2402	177	2	1212	53	2	93177.03	93177.03	0.00	66591.84	26585.19	1	1	0
2403	177	4	396	84	18	271382.58	271382.58	0.00	213505.79	57876.79	1	1	0
2404	177	4	1058	206	42	33160.94	33160.94	0.00	28665.08	4495.86	1	1	0
2405	177	1	940	3	3	76599.39	76599.39	0.00	56416.10	20183.29	1	1	0
2406	177	2	505	209	4	4863.69	4863.69	0.00	3015.45	1848.24	1	1	0
2407	177	2	1045	235	32	72204.21	72204.21	0.00	48465.30	23738.91	1	1	0
2408	177	4	33	174	33	5251.00	5251.00	0.00	4039.67	1211.33	1	1	0
2409	177	1000	117	133	6	20141.05	0.00	20141.05	15307.20	4833.85	1	0	1
2410	177	3	278	71	31	50411.37	50411.37	0.00	41979.55	8431.82	1	1	0
2411	177	1000	281	78	41	90962.44	0.00	90962.44	74793.67	16168.77	1	0	1
2412	177	1	182	41	45	14299.15	14299.15	0.00	11725.30	2573.85	1	1	0
2413	177	1000	1104	17	9	15255.10	0.00	15255.10	13424.48	1830.62	1	0	1
2414	177	4	849	119	29	22633.98	22633.98	0.00	14811.00	7822.98	1	1	0
2415	177	1000	1117	233	30	30964.12	0.00	30964.12	21864.56	9099.56	1	0	1
2416	177	1000	593	161	29	76647.50	0.00	76647.50	62278.68	14368.82	1	0	1
2417	177	1000	182	118	40	143450.97	0.00	143450.97	107147.12	36303.85	1	0	1
2418	177	4	392	79	45	16975.74	16975.74	0.00	11713.26	5262.48	1	1	0
2419	177	3	1128	128	28	107308.53	107308.53	0.00	83491.19	23817.34	1	1	0
2420	177	1000	184	20	19	145522.79	0.00	145522.79	112762.13	32760.66	1	0	1
2421	177	1	1124	109	10	17072.03	17072.03	0.00	12431.18	4640.85	1	1	0
2422	177	2	194	95	15	48745.44	48745.44	0.00	31684.50	17060.94	1	1	0
2423	177	3	1128	174	18	47856.01	47856.01	0.00	32816.31	15039.70	1	1	0
2424	177	1000	885	226	28	142852.56	0.00	142852.56	96873.34	45979.22	1	0	1
2425	177	4	984	34	29	44806.50	44806.50	0.00	32914.20	11892.30	1	1	0
2426	177	4	530	204	5	17999.17	17999.17	0.00	15119.30	2879.87	1	1	0
2427	177	1000	229	215	16	152370.56	0.00	152370.56	110631.42	41739.14	1	0	1
2428	177	1000	1120	123	45	39022.24	0.00	39022.24	28131.95	10890.29	1	0	1
2429	177	3	785	143	35	84234.77	84234.77	0.00	58119.39	26115.38	1	1	0
2430	177	2	758	54	1	92361.32	92361.32	0.00	66945.27	25416.05	1	1	0
2431	177	4	596	33	16	101988.51	101988.51	0.00	78373.57	23614.94	1	1	0
2432	177	1	1163	221	1	71304.49	71304.49	0.00	55166.93	16137.56	1	1	0
2433	177	1	763	163	48	220666.18	220666.18	0.00	167891.52	52774.66	1	1	0
2434	177	1	218	153	15	77097.76	77097.76	0.00	50113.52	26984.24	1	1	0
2435	177	1000	1087	164	46	3431.35	0.00	3431.35	2470.55	960.80	1	0	1
2436	177	3	1120	110	36	201307.17	201307.17	0.00	143936.52	57370.65	1	1	0
2437	177	2	903	96	16	146934.71	146934.71	0.00	96399.46	50535.25	1	1	0
2438	177	1000	1000	153	16	152849.60	0.00	152849.60	110592.43	42257.17	1	0	1
2439	177	2	421	57	20	31466.96	31466.96	0.00	24229.52	7237.44	1	1	0
2440	177	1000	409	127	38	109328.83	0.00	109328.83	72504.00	36824.83	1	0	1
2441	177	4	42	3	1	103943.97	103943.97	0.00	85094.46	18849.51	1	1	0
2442	177	1000	611	123	36	79569.03	0.00	79569.03	58641.34	20927.69	1	0	1
2443	177	1000	803	205	24	91926.17	0.00	91926.17	58832.74	33093.43	1	0	1
2444	177	2	1041	108	27	2464.22	2464.22	0.00	1626.39	837.83	1	1	0
2445	177	3	993	10	34	52758.28	52758.28	0.00	39277.77	13480.51	1	1	0
2446	177	1000	1126	66	6	95953.71	0.00	95953.71	83722.81	12230.90	1	0	1
2447	177	1000	836	72	42	109313.81	0.00	109313.81	82959.44	26354.37	1	0	1
2448	177	3	735	196	45	34846.85	34846.85	0.00	24044.35	10802.50	1	1	0
2449	177	3	1049	37	6	206977.33	206977.33	0.00	145114.87	61862.46	1	1	0
2450	177	1000	599	247	48	101528.32	0.00	101528.32	76209.66	25318.66	1	0	1
2451	177	1000	93	5	40	93045.34	0.00	93045.34	62614.90	30430.44	1	0	1
2452	177	3	1185	227	12	82207.00	82207.00	0.00	70989.40	11217.60	1	1	0
2453	177	3	1094	225	17	17364.76	17364.76	0.00	14239.10	3125.66	1	1	0
2454	177	1000	366	210	36	80602.47	0.00	80602.47	66094.02	14508.45	1	0	1
2455	177	1000	929	245	9	66782.16	0.00	66782.16	51027.97	15754.19	1	0	1
2456	177	1000	688	234	47	173066.43	0.00	173066.43	135870.19	37196.24	1	0	1
2457	177	2	50	81	45	88266.48	88266.48	0.00	66700.17	21566.31	1	1	0
2458	177	1000	722	146	42	82354.25	0.00	82354.25	56807.98	25546.27	1	0	1
2459	177	2	505	12	38	62473.00	62473.00	0.00	49038.38	13434.62	1	1	0
2460	177	1000	204	176	28	194563.51	0.00	194563.51	147201.67	47361.84	1	0	1
2461	177	1000	893	102	45	8116.40	0.00	8116.40	6670.48	1445.92	1	0	1
2462	177	1000	436	58	6	49946.85	0.00	49946.85	40956.40	8990.45	1	0	1
2463	177	1000	340	246	16	41075.50	0.00	41075.50	28773.28	12302.22	1	0	1
2464	177	3	274	233	36	74133.39	74133.39	0.00	65306.82	8826.57	1	1	0
2465	177	1000	1089	10	35	26651.36	0.00	26651.36	21166.27	5485.09	1	0	1
2466	177	1000	628	111	29	121161.26	0.00	121161.26	95145.03	26016.23	1	0	1
2467	177	1	66	42	34	179271.46	179271.46	0.00	135954.89	43316.57	1	1	0
2468	177	4	60	30	50	73645.84	73645.84	0.00	57972.90	15672.94	1	1	0
2469	177	1000	67	213	10	134914.52	0.00	134914.52	95858.88	39055.64	1	0	1
2470	177	3	944	118	9	29059.16	29059.16	0.00	22946.67	6112.49	1	1	0
2471	177	1000	104	28	3	27672.36	0.00	27672.36	24628.41	3043.95	1	0	1
2472	177	3	502	69	3	154311.68	154311.68	0.00	121360.20	32951.48	1	1	0
2473	177	1000	965	48	4	94909.44	0.00	94909.44	69846.82	25062.62	1	0	1
2474	177	2	448	123	12	67132.02	67132.02	0.00	54376.95	12755.07	1	1	0
2475	177	1000	763	59	49	105096.20	0.00	105096.20	68555.86	36540.34	1	0	1
2476	177	1000	929	191	37	25213.16	0.00	25213.16	18201.25	7011.91	1	0	1
2477	177	1000	782	175	1	13898.61	0.00	13898.61	9980.56	3918.05	1	0	1
2478	177	1000	364	192	6	98153.00	0.00	98153.00	78219.60	19933.40	1	0	1
2479	177	1000	773	12	26	134119.56	0.00	134119.56	100593.60	33525.96	1	0	1
2480	177	4	373	211	46	77512.20	77512.20	0.00	59684.46	17827.74	1	1	0
2481	177	1000	340	72	9	41606.70	0.00	41606.70	28455.86	13150.84	1	0	1
2482	177	3	36	29	30	155704.47	155704.47	0.00	113037.11	42667.36	1	1	0
2483	177	2	989	47	44	106629.81	106629.81	0.00	78069.28	28560.53	1	1	0
2484	177	1000	384	45	45	9886.44	0.00	9886.44	8615.34	1271.10	1	0	1
2485	177	1000	1202	162	18	114176.76	0.00	114176.76	89161.93	25014.83	1	0	1
2486	177	4	260	200	44	96481.51	96481.51	0.00	67884.41	28597.10	1	1	0
2487	177	3	1064	246	23	183314.03	183314.03	0.00	145723.81	37590.22	1	1	0
2488	177	3	1165	240	4	55725.48	55725.48	0.00	37871.61	17853.87	1	1	0
2489	177	1000	186	200	3	132959.05	0.00	132959.05	101797.26	31161.79	1	0	1
2490	177	2	801	5	17	41797.22	41797.22	0.00	34427.96	7369.26	1	1	0
2491	177	2	955	156	13	141998.03	141998.03	0.00	118257.95	23740.08	1	1	0
2492	177	1000	40	26	48	94212.88	0.00	94212.88	62762.79	31450.09	1	0	1
2493	177	1	13	175	2	119589.19	119589.19	0.00	93340.56	26248.63	1	1	0
2494	177	1000	145	120	19	148206.97	0.00	148206.97	121963.02	26243.95	1	0	1
2495	177	1000	747	105	29	44636.16	0.00	44636.16	36155.28	8480.88	1	0	1
2496	177	1000	155	152	5	7009.62	0.00	7009.62	5117.01	1892.61	1	0	1
2497	177	3	335	82	35	1839.44	1839.44	0.00	1434.80	404.64	1	1	0
2498	177	3	225	147	11	146592.94	146592.94	0.00	119131.77	27461.17	1	1	0
2499	177	3	110	29	13	64454.28	64454.28	0.00	51371.64	13082.64	1	1	0
2500	177	1000	949	13	40	108754.81	0.00	108754.81	88173.90	20580.91	1	0	1
2501	177	3	606	46	45	163148.37	163148.37	0.00	116138.87	47009.50	1	1	0
2502	177	4	77	242	10	131647.38	131647.38	0.00	103142.88	28504.50	1	1	0
2503	177	1000	759	214	44	133415.48	0.00	133415.48	106347.80	27067.68	1	0	1
2504	177	1000	90	6	12	55549.52	0.00	55549.52	46179.22	9370.30	1	0	1
2505	177	1000	1146	56	7	53215.63	0.00	53215.63	46121.35	7094.28	1	0	1
2506	177	1000	16	64	30	21565.84	0.00	21565.84	19409.24	2156.60	1	0	1
2507	177	1000	11	66	29	129403.40	0.00	129403.40	87492.06	41911.34	1	0	1
2508	177	4	610	28	10	147817.67	147817.67	0.00	118841.39	28976.28	1	1	0
2509	177	1000	873	39	47	147169.88	0.00	147169.88	121855.34	25314.54	1	0	1
2510	177	3	962	203	48	234545.36	234545.36	0.00	172379.85	62165.51	1	1	0
2511	177	1	1067	59	45	26813.52	26813.52	0.00	21308.67	5504.85	1	1	0
2512	177	1	444	106	31	26611.47	26611.47	0.00	21555.27	5056.20	1	1	0
2513	177	2	691	236	43	17364.76	17364.76	0.00	14239.10	3125.66	1	1	0
2514	177	1000	648	27	25	18172.77	0.00	18172.77	12844.42	5328.35	1	0	1
2515	177	2	1107	29	13	171387.56	171387.56	0.00	123821.89	47565.67	1	1	0
2516	177	2	692	111	20	28123.34	28123.34	0.00	23267.68	4855.66	1	1	0
2517	177	2	311	109	41	203008.48	203008.48	0.00	149995.27	53013.21	1	1	0
2518	177	2	258	146	19	46787.80	46787.80	0.00	38497.89	8289.91	1	1	0
2519	177	1000	345	63	15	186497.37	0.00	186497.37	141144.09	45353.28	1	0	1
2520	177	3	29	83	15	4088.20	4088.20	0.00	2616.44	1471.76	1	1	0
2521	177	2	15	221	8	31299.23	31299.23	0.00	23787.40	7511.83	1	1	0
2522	177	1000	279	15	31	57472.82	0.00	57472.82	43175.49	14297.33	1	0	1
2523	177	1000	1070	189	17	93381.97	0.00	93381.97	69816.97	23565.00	1	0	1
2524	177	4	312	17	14	44155.00	44155.00	0.00	31350.05	12804.95	1	1	0
2525	177	1000	692	223	7	113655.68	0.00	113655.68	72422.76	41232.92	1	0	1
2526	177	1000	504	20	7	41191.49	0.00	41191.49	31133.12	10058.37	1	0	1
2527	177	1	1151	137	34	42257.70	42257.70	0.00	29881.82	12375.88	1	1	0
2528	177	1	321	110	14	37388.16	37388.16	0.00	29345.10	8043.06	1	1	0
2529	177	3	865	184	19	30977.07	30977.07	0.00	26935.76	4041.31	1	1	0
2530	177	1000	361	71	8	50593.41	0.00	50593.41	40929.63	9663.78	1	0	1
2531	177	1	983	143	12	27919.27	27919.27	0.00	20597.11	7322.16	1	1	0
2532	177	4	714	53	6	26957.30	26957.30	0.00	24261.55	2695.75	1	1	0
2533	177	4	1021	217	15	15826.16	15826.16	0.00	12027.88	3798.28	1	1	0
2534	177	4	12	150	34	52725.43	52725.43	0.00	36183.59	16541.84	1	1	0
2535	177	3	12	233	1	54262.92	54262.92	0.00	40697.16	13565.76	1	1	0
2536	177	1	1112	232	14	32515.95	32515.95	0.00	25436.22	7079.73	1	1	0
2537	177	3	262	196	46	7114.00	7114.00	0.00	4268.40	2845.60	1	1	0
2538	177	1	426	18	16	7821.35	7821.35	0.00	5631.35	2190.00	1	1	0
2539	177	1	1030	118	2	7612.37	7612.37	0.00	5024.16	2588.21	1	1	0
2540	177	1000	162	123	40	70066.18	0.00	70066.18	54956.36	15109.82	1	0	1
2541	177	4	1193	62	25	13131.96	13131.96	0.00	9455.04	3676.92	1	1	0
2542	177	4	765	5	49	131278.36	131278.36	0.00	98862.81	32415.55	1	1	0
2543	177	1000	1091	158	40	78143.40	0.00	78143.40	56758.68	21384.72	1	0	1
2544	177	3	373	176	32	84179.69	84179.69	0.00	68140.28	16039.41	1	1	0
2545	177	1000	824	186	18	240615.24	0.00	240615.24	174555.86	66059.38	1	0	1
2546	177	1	634	215	35	50915.61	50915.61	0.00	35181.14	15734.47	1	1	0
2547	177	1	643	107	24	171512.12	171512.12	0.00	120353.57	51158.55	1	1	0
2548	177	1000	114	246	7	160295.83	0.00	160295.83	122412.26	37883.57	1	0	1
2549	177	4	583	5	47	59407.16	59407.16	0.00	50948.03	8459.13	1	1	0
2550	177	4	207	119	40	6824.40	6824.40	0.00	6005.48	818.92	1	1	0
2551	177	3	287	65	17	81715.29	81715.29	0.00	60679.61	21035.68	1	1	0
2552	177	1	781	221	21	63376.11	63376.11	0.00	46898.28	16477.83	1	1	0
2553	177	3	773	23	30	63292.14	63292.14	0.00	41772.78	21519.36	1	1	0
2554	177	1000	104	102	24	52998.49	0.00	52998.49	35722.66	17275.83	1	0	1
2555	177	1	1198	188	9	126784.68	126784.68	0.00	100383.76	26400.92	1	1	0
2556	177	1	59	16	34	117330.79	117330.79	0.00	85061.77	32269.02	1	1	0
2557	177	3	1019	3	17	41415.67	41415.67	0.00	35397.20	6018.47	1	1	0
2558	177	1	451	40	21	23938.18	23938.18	0.00	17953.60	5984.58	1	1	0
2559	177	1000	390	103	10	68872.16	0.00	68872.16	49198.02	19674.14	1	0	1
2560	177	1	151	238	27	200227.71	200227.71	0.00	143802.66	56425.05	1	1	0
2561	177	2	625	85	31	175710.20	175710.20	0.00	144027.50	31682.70	1	1	0
2562	177	1000	1025	87	28	136048.08	0.00	136048.08	97005.39	39042.69	1	0	1
2563	177	1000	486	48	22	20346.76	0.00	20346.76	16523.38	3823.38	1	0	1
2564	177	4	1138	188	15	128807.65	128807.65	0.00	88962.29	39845.36	1	1	0
2565	177	3	706	143	36	66515.85	66515.85	0.00	40830.42	25685.43	1	1	0
2566	177	1	866	22	35	82809.62	82809.62	0.00	54544.07	28265.55	1	1	0
2567	177	1000	10	231	20	128160.49	0.00	128160.49	99180.84	28979.65	1	0	1
2568	177	1000	278	218	39	98822.10	0.00	98822.10	68560.17	30261.93	1	0	1
2569	177	1	433	36	10	158942.25	158942.25	0.00	123316.41	35625.84	1	1	0
2570	177	1000	868	1	40	80944.16	0.00	80944.16	53818.40	27125.76	1	0	1
2571	177	2	653	55	44	428.13	428.13	0.00	303.97	124.16	1	1	0
2572	177	3	215	82	4	17142.96	17142.96	0.00	11314.36	5828.60	1	1	0
2573	177	3	849	203	22	87971.08	87971.08	0.00	61048.87	26922.21	1	1	0
2574	177	1000	95	212	42	18506.69	0.00	18506.69	16525.16	1981.53	1	0	1
2575	177	2	695	202	6	54596.50	54596.50	0.00	44721.27	9875.23	1	1	0
2576	177	1	401	178	29	128223.43	128223.43	0.00	91217.51	37005.92	1	1	0
2577	177	2	396	162	27	1313.28	1313.28	0.00	840.50	472.78	1	1	0
2578	177	4	1085	4	28	189867.34	189867.34	0.00	142134.55	47732.79	1	1	0
2579	177	1	988	226	14	80728.17	80728.17	0.00	67445.66	13282.51	1	1	0
2580	177	1000	1016	116	35	145983.64	0.00	145983.64	99371.08	46612.56	1	0	1
2581	177	1000	106	226	32	39283.20	0.00	39283.20	26438.88	12844.32	1	0	1
2582	177	2	209	147	41	196164.94	196164.94	0.00	155179.20	40985.74	1	1	0
2583	177	2	1163	34	36	50698.45	50698.45	0.00	32882.87	17815.58	1	1	0
2584	177	1	705	249	13	178177.31	178177.31	0.00	132123.87	46053.44	1	1	0
2585	177	3	337	203	31	212998.68	212998.68	0.00	178367.28	34631.40	1	1	0
2586	177	1	1155	66	28	59505.18	59505.18	0.00	44916.84	14588.34	1	1	0
2587	177	1000	951	252	37	9612.44	0.00	9612.44	6248.08	3364.36	1	0	1
2588	177	1000	918	149	25	70740.32	0.00	70740.32	62958.88	7781.44	1	0	1
2589	177	1000	1009	236	42	27650.35	0.00	27650.35	19182.66	8467.69	1	0	1
2590	177	4	55	115	6	75141.00	75141.00	0.00	65995.14	9145.86	1	1	0
2591	177	2	78	125	10	115292.13	115292.13	0.00	82126.63	33165.50	1	1	0
2592	177	1000	223	212	2	132436.45	0.00	132436.45	104786.97	27649.48	1	0	1
2593	177	1	256	21	18	78983.24	78983.24	0.00	57560.65	21422.59	1	1	0
2594	177	1000	388	1	22	13564.58	0.00	13564.58	9495.20	4069.38	1	0	1
2595	177	4	798	191	37	203209.04	203209.04	0.00	143528.79	59680.25	1	1	0
2596	177	1000	1128	191	1	146020.72	0.00	146020.72	104565.16	41455.56	1	0	1
2597	177	2	1135	221	22	93473.26	93473.26	0.00	67845.72	25627.54	1	1	0
2598	177	1000	909	213	49	185483.77	0.00	185483.77	130255.49	55228.28	1	0	1
2599	177	1000	152	74	47	163406.39	0.00	163406.39	131118.97	32287.42	1	0	1
2600	177	3	948	219	46	133348.54	133348.54	0.00	100596.13	32752.41	1	1	0
2601	177	1000	282	173	26	172728.26	0.00	172728.26	130739.98	41988.28	1	0	1
2602	177	1000	780	147	6	177750.67	0.00	177750.67	133190.08	44560.59	1	0	1
2603	177	1000	415	60	22	91862.53	0.00	91862.53	73995.82	17866.71	1	0	1
2604	177	1000	155	55	31	57559.77	0.00	57559.77	48925.80	8633.97	1	0	1
2605	177	1000	436	35	44	120445.37	0.00	120445.37	93149.88	27295.49	1	0	1
2606	177	4	437	170	10	123298.44	123298.44	0.00	89884.04	33414.40	1	1	0
2607	177	1000	544	88	4	59252.70	0.00	59252.70	48909.09	10343.61	1	0	1
2608	177	4	948	11	39	136277.65	136277.65	0.00	108753.23	27524.42	1	1	0
2609	177	2	958	192	41	44173.18	44173.18	0.00	27185.07	16988.11	1	1	0
2610	177	4	486	30	42	95269.65	95269.65	0.00	77687.22	17582.43	1	1	0
2611	177	4	483	228	8	103847.18	103847.18	0.00	86982.91	16864.27	1	1	0
2612	177	1000	844	58	12	51316.16	0.00	51316.16	40539.76	10776.40	1	0	1
2613	177	1000	628	185	28	11793.31	0.00	11793.31	8166.86	3626.45	1	0	1
2614	177	1	890	245	42	71828.40	71828.40	0.00	50998.20	20830.20	1	1	0
2615	177	1000	1053	24	11	218283.36	0.00	218283.36	151356.57	66926.79	1	0	1
2616	177	2	538	182	35	9760.30	9760.30	0.00	7613.03	2147.27	1	1	0
2617	177	4	391	146	50	96155.19	96155.19	0.00	65135.16	31020.03	1	1	0
2618	177	2	951	201	29	145453.03	145453.03	0.00	116206.58	29246.45	1	1	0
2619	177	1	58	4	46	130862.37	130862.37	0.00	101120.26	29742.11	1	1	0
2620	177	3	252	244	4	50978.80	50978.80	0.00	39998.06	10980.74	1	1	0
2621	177	1000	438	81	17	68431.20	0.00	68431.20	47217.52	21213.68	1	0	1
2622	177	1000	147	171	39	77783.96	0.00	77783.96	53440.23	24343.73	1	0	1
2623	177	1	835	45	7	33593.18	33593.18	0.00	26257.38	7335.80	1	1	0
2624	177	1000	937	115	4	93018.32	0.00	93018.32	74973.24	18045.08	1	0	1
2625	177	4	55	92	27	17907.84	17907.84	0.00	15758.88	2148.96	1	1	0
2626	177	1	379	236	9	90475.41	90475.41	0.00	65463.85	25011.56	1	1	0
2627	177	4	124	234	32	230358.94	230358.94	0.00	175757.44	54601.50	1	1	0
2628	177	1000	1033	100	27	77644.99	0.00	77644.99	56645.01	20999.98	1	0	1
2629	177	4	681	62	27	61961.64	61961.64	0.00	45478.46	16483.18	1	1	0
2630	177	2	672	89	15	115837.88	115837.88	0.00	78355.28	37482.60	1	1	0
2631	177	2	544	146	35	144165.59	144165.59	0.00	104180.66	39984.93	1	1	0
2632	177	1000	439	192	36	62637.62	0.00	62637.62	47181.14	15456.48	1	0	1
2633	177	2	1183	247	48	19820.52	19820.52	0.00	17442.04	2378.48	1	1	0
2634	177	1000	1122	88	5	130102.40	0.00	130102.40	97743.24	32359.16	1	0	1
2635	177	4	167	12	14	113758.34	113758.34	0.00	96269.61	17488.73	1	1	0
2636	177	2	949	161	13	32027.96	32027.96	0.00	28184.60	3843.36	1	1	0
2637	177	1000	994	68	17	128642.43	0.00	128642.43	106704.09	21938.34	1	0	1
2638	177	4	373	124	32	82087.62	82087.62	0.00	58692.60	23395.02	1	1	0
2639	177	1	216	87	7	146056.46	146056.46	0.00	116904.04	29152.42	1	1	0
2640	177	1000	694	199	29	114992.21	0.00	114992.21	86836.57	28155.64	1	0	1
2641	177	1000	601	134	43	148433.93	0.00	148433.93	115312.07	33121.86	1	0	1
2642	177	1000	965	243	38	55650.00	0.00	55650.00	41737.52	13912.48	1	0	1
2643	177	3	870	155	2	141575.66	141575.66	0.00	105311.67	36263.99	1	1	0
2644	177	1000	1108	245	11	195029.88	0.00	195029.88	149001.47	46028.41	1	0	1
2645	177	4	467	144	18	231276.83	231276.83	0.00	155186.57	76090.26	1	1	0
2646	177	1000	77	88	6	63468.14	0.00	63468.14	51323.27	12144.87	1	0	1
2647	177	2	390	165	20	111207.13	111207.13	0.00	76365.95	34841.18	1	1	0
2648	177	1000	344	229	27	39681.95	0.00	39681.95	28570.99	11110.96	1	0	1
2649	177	3	276	251	50	55122.64	55122.64	0.00	36380.96	18741.68	1	1	0
2650	177	3	1030	22	40	63774.89	63774.89	0.00	50356.22	13418.67	1	1	0
2651	177	4	335	127	35	100378.76	100378.76	0.00	70771.36	29607.40	1	1	0
2652	177	1000	175	168	37	99160.27	0.00	99160.27	69142.67	30017.60	1	0	1
2653	177	1000	35	234	40	42403.28	0.00	42403.28	33922.64	8480.64	1	0	1
2654	177	1000	464	171	32	22320.45	0.00	22320.45	15424.02	6896.43	1	0	1
2655	177	1000	723	23	37	29298.15	0.00	29298.15	20508.66	8789.49	1	0	1
2656	177	1000	657	207	35	38256.66	0.00	38256.66	30987.90	7268.76	1	0	1
2657	177	1000	681	143	8	39170.42	0.00	39170.42	27079.96	12090.46	1	0	1
2658	177	4	171	135	4	91055.15	91055.15	0.00	63781.89	27273.26	1	1	0
2659	177	1000	422	128	22	96965.75	0.00	96965.75	75739.36	21226.39	1	0	1
2660	177	1	418	147	35	122541.75	122541.75	0.00	89268.93	33272.82	1	1	0
2661	177	4	292	38	43	172019.30	172019.30	0.00	124599.40	47419.90	1	1	0
2662	177	1000	1181	170	49	82328.77	0.00	82328.77	61751.87	20576.90	1	0	1
2663	177	4	970	195	31	83631.42	83631.42	0.00	65817.05	17814.37	1	1	0
2664	177	1000	160	56	27	44635.71	0.00	44635.71	32137.70	12498.01	1	0	1
2665	177	1000	724	26	43	124348.35	0.00	124348.35	94041.29	30307.06	1	0	1
2666	177	1000	223	41	14	29376.41	0.00	29376.41	21475.70	7900.71	1	0	1
2667	177	3	86	143	30	65502.32	65502.32	0.00	45599.68	19902.64	1	1	0
2668	177	1	888	45	48	73622.32	73622.32	0.00	55502.82	18119.50	1	1	0
2669	177	1000	987	122	29	115491.44	0.00	115491.44	81537.30	33954.14	1	0	1
2670	177	4	923	13	11	169263.92	169263.92	0.00	142492.52	26771.40	1	1	0
2671	177	2	317	156	2	67515.08	67515.08	0.00	44845.71	22669.37	1	1	0
2672	177	1000	463	22	6	180140.50	0.00	180140.50	148359.55	31780.95	1	0	1
2673	177	1000	1127	167	32	153155.65	0.00	153155.65	114053.75	39101.90	1	0	1
2674	177	1000	723	31	42	61072.99	0.00	61072.99	48988.25	12084.74	1	0	1
2675	177	1000	516	94	25	72321.97	0.00	72321.97	53261.98	19059.99	1	0	1
2676	177	2	327	55	10	108991.89	108991.89	0.00	92322.88	16669.01	1	1	0
2677	177	1000	1210	156	23	12686.86	0.00	12686.86	9067.74	3619.12	1	0	1
2678	177	1000	892	117	43	13918.49	0.00	13918.49	11815.28	2103.21	1	0	1
2679	177	3	500	142	5	83306.67	83306.67	0.00	74892.99	8413.68	1	1	0
2680	177	1000	717	160	33	20057.95	0.00	20057.95	14842.90	5215.05	1	0	1
2681	177	1000	492	87	35	128509.79	0.00	128509.79	112022.85	16486.94	1	0	1
2682	177	3	1135	11	31	20591.64	20591.64	0.00	17708.80	2882.84	1	1	0
2683	177	2	44	135	38	56709.52	56709.52	0.00	34592.81	22116.71	1	1	0
2684	177	1	1029	81	26	76944.20	76944.20	0.00	51998.09	24946.11	1	1	0
2685	177	1000	596	148	34	82548.60	0.00	82548.60	63527.30	19021.30	1	0	1
2686	177	1	532	105	8	169660.32	169660.32	0.00	120166.96	49493.36	1	1	0
2687	177	1000	968	12	25	48950.37	0.00	48950.37	31328.22	17622.15	1	0	1
2688	177	1000	851	10	43	211775.82	0.00	211775.82	150901.63	60874.19	1	0	1
2689	177	3	513	201	9	3500.56	3500.56	0.00	2135.34	1365.22	1	1	0
2690	177	1000	1047	61	39	23131.92	0.00	23131.92	18505.52	4626.40	1	0	1
2691	177	1000	756	236	10	71986.36	0.00	71986.36	46504.65	25481.71	1	0	1
2692	177	1000	413	152	4	137685.79	0.00	137685.79	95064.68	42621.11	1	0	1
2693	177	3	561	109	21	21531.04	21531.04	0.00	16363.60	5167.44	1	1	0
2694	177	1000	949	222	6	68038.57	0.00	68038.57	42796.65	25241.92	1	0	1
2695	177	1000	773	179	39	106672.42	0.00	106672.42	77377.66	29294.76	1	0	1
2696	177	1000	742	82	48	90993.20	0.00	90993.20	61489.72	29503.48	1	0	1
2697	177	2	895	44	7	159595.15	159595.15	0.00	125020.13	34575.02	1	1	0
2698	177	1000	969	84	14	211446.77	0.00	211446.77	148081.13	63365.64	1	0	1
2699	177	3	289	221	36	77068.66	77068.66	0.00	59422.16	17646.50	1	1	0
2700	177	1000	419	84	37	93616.98	0.00	93616.98	65175.33	28441.65	1	0	1
2701	177	4	187	56	15	99293.15	99293.15	0.00	68271.90	31021.25	1	1	0
2702	177	1000	713	156	40	119971.05	0.00	119971.05	85376.10	34594.95	1	0	1
2703	177	1000	38	94	1	219025.30	0.00	219025.30	156171.59	62853.71	1	0	1
2704	177	1000	179	109	6	67900.40	0.00	67900.40	47467.77	20432.63	1	0	1
2705	177	1000	62	196	43	162773.06	0.00	162773.06	133240.88	29532.18	1	0	1
2706	177	3	56	238	30	54455.31	54455.31	0.00	36455.44	17999.87	1	1	0
2707	177	1000	372	213	18	31908.29	0.00	31908.29	26306.44	5601.85	1	0	1
2708	177	1000	886	120	7	100512.96	0.00	100512.96	71352.48	29160.48	1	0	1
2709	177	1000	186	132	1	129805.88	0.00	129805.88	97657.28	32148.60	1	0	1
2710	177	2	966	88	17	70600.00	70600.00	0.00	46596.00	24004.00	1	1	0
2711	177	2	388	122	20	12102.04	12102.04	0.00	9031.42	3070.62	1	1	0
2712	177	1	543	58	47	76873.33	76873.33	0.00	57913.59	18959.74	1	1	0
2713	177	1000	725	89	32	86217.79	0.00	86217.79	62574.00	23643.79	1	0	1
2714	177	1000	1010	73	49	179260.85	0.00	179260.85	128871.87	50388.98	1	0	1
2715	177	1	73	53	21	157991.77	157991.77	0.00	115234.03	42757.74	1	1	0
2716	177	1000	688	207	46	70410.69	0.00	70410.69	46376.40	24034.29	1	0	1
2717	177	3	463	17	40	50161.74	50161.74	0.00	42135.84	8025.90	1	1	0
2718	177	1	1082	94	36	113265.32	113265.32	0.00	94524.84	18740.48	1	1	0
2719	177	1000	578	244	19	129571.93	0.00	129571.93	92121.75	37450.18	1	0	1
2720	177	2	469	52	4	111112.56	111112.56	0.00	88928.28	22184.28	1	1	0
2721	177	1000	1200	35	42	6378.20	0.00	6378.20	5102.56	1275.64	1	0	1
2722	177	1000	1145	124	39	108344.55	0.00	108344.55	81055.90	27288.65	1	0	1
2723	177	4	50	6	8	152398.29	152398.29	0.00	113218.27	39180.02	1	1	0
2724	177	1000	428	195	36	55718.98	0.00	55718.98	43728.49	11990.49	1	0	1
2725	177	1000	1096	17	13	153510.27	0.00	153510.27	125682.24	27828.03	1	0	1
2726	177	1000	1088	196	36	62456.41	0.00	62456.41	44638.92	17817.49	1	0	1
2727	177	1000	191	79	30	6261.69	0.00	6261.69	5572.89	688.80	1	0	1
2728	177	1000	841	196	34	132547.50	0.00	132547.50	106358.85	26188.65	1	0	1
2729	177	2	815	116	20	144493.78	144493.78	0.00	117461.51	27032.27	1	1	0
2730	177	4	1197	180	45	14848.72	14848.72	0.00	12918.38	1930.34	1	1	0
2731	177	1000	353	195	50	17568.85	0.00	17568.85	11821.85	5747.00	1	0	1
2732	177	1000	291	138	31	87791.13	0.00	87791.13	67865.55	19925.58	1	0	1
2733	177	1000	1073	55	32	167255.53	0.00	167255.53	116311.12	50944.41	1	0	1
2734	177	1000	291	102	13	69536.78	0.00	69536.78	47239.02	22297.76	1	0	1
2735	177	1000	562	232	42	97739.67	0.00	97739.67	77669.87	20069.80	1	0	1
2736	177	1000	411	201	34	99893.70	0.00	99893.70	81912.80	17980.90	1	0	1
2737	177	2	255	196	34	7618.96	7618.96	0.00	5790.40	1828.56	1	1	0
2738	177	4	846	54	6	63879.96	63879.96	0.00	50868.00	13011.96	1	1	0
2739	177	1	1114	233	29	51051.95	51051.95	0.00	41189.00	9862.95	1	1	0
2740	177	4	586	58	33	208495.66	208495.66	0.00	145141.68	63353.98	1	1	0
2741	177	3	732	50	14	108505.69	108505.69	0.00	87453.72	21051.97	1	1	0
2742	177	1000	817	44	27	107408.54	0.00	107408.54	84543.45	22865.09	1	0	1
2743	177	1000	956	226	4	12935.79	0.00	12935.79	10782.23	2153.56	1	0	1
2744	177	1000	843	224	20	163363.02	0.00	163363.02	117881.95	45481.07	1	0	1
2745	177	1	202	183	19	133652.08	133652.08	0.00	94161.97	39490.11	1	1	0
2746	177	1	1083	99	43	14753.14	14753.14	0.00	11486.63	3266.51	1	1	0
2747	177	1000	328	164	31	42607.40	0.00	42607.40	37494.50	5112.90	1	0	1
2748	177	1	77	162	41	22445.14	22445.14	0.00	15958.16	6486.98	1	1	0
2749	177	1	1116	82	27	17892.66	17892.66	0.00	12621.55	5271.11	1	1	0
2750	177	1000	42	196	14	30280.40	0.00	30280.40	21959.00	8321.40	1	0	1
2751	177	3	41	189	14	224865.41	224865.41	0.00	164983.24	59882.17	1	1	0
2752	177	1000	1067	173	28	188097.22	0.00	188097.22	132065.20	56032.02	1	0	1
2753	177	1000	485	140	32	101670.74	0.00	101670.74	75701.82	25968.92	1	0	1
2754	177	3	212	176	14	50574.54	50574.54	0.00	38457.14	12117.40	1	1	0
2755	177	1	216	40	22	152112.14	152112.14	0.00	125015.22	27096.92	1	1	0
2756	177	1	1091	221	41	22050.17	22050.17	0.00	18011.11	4039.06	1	1	0
2757	177	3	120	241	36	27441.30	27441.30	0.00	22277.98	5163.32	1	1	0
2758	177	1000	120	179	8	3255.35	0.00	3255.35	2278.74	976.61	1	0	1
2759	177	1000	824	50	27	128998.89	0.00	128998.89	91808.12	37190.77	1	0	1
2760	177	1000	564	175	31	78211.52	0.00	78211.52	49273.28	28938.24	1	0	1
2761	177	2	1170	110	28	150383.38	150383.38	0.00	105268.31	45115.07	1	1	0
2762	177	1000	598	158	26	78912.53	0.00	78912.53	59848.21	19064.32	1	0	1
2763	177	1000	91	22	48	25630.85	0.00	25630.85	21529.90	4100.95	1	0	1
2764	177	1	844	225	46	49261.99	49261.99	0.00	31883.76	17378.23	1	1	0
2765	177	3	756	88	48	178999.84	178999.84	0.00	131585.49	47414.35	1	1	0
2766	177	4	1186	29	31	44574.35	44574.35	0.00	35420.58	9153.77	1	1	0
2767	177	3	851	197	33	88280.29	88280.29	0.00	68578.29	19702.00	1	1	0
2768	177	1000	259	205	19	27967.49	0.00	27967.49	18977.09	8990.40	1	0	1
2769	177	3	952	208	16	234870.73	234870.73	0.00	181585.69	53285.04	1	1	0
2770	177	2	175	72	7	79258.51	79258.51	0.00	62652.16	16606.35	1	1	0
2771	177	1000	99	108	40	125136.32	0.00	125136.32	96805.54	28330.78	1	0	1
2772	177	3	97	92	3	152297.13	152297.13	0.00	115001.47	37295.66	1	1	0
2773	177	1000	758	70	12	112213.38	0.00	112213.38	89478.47	22734.91	1	0	1
2774	177	1000	1052	238	10	31270.20	0.00	31270.20	22413.86	8856.34	1	0	1
2775	177	2	486	5	15	28274.00	28274.00	0.00	21488.25	6785.75	1	1	0
2776	177	1000	308	227	5	4579.34	0.00	4579.34	2930.78	1648.56	1	0	1
2777	177	1	266	198	3	41075.14	41075.14	0.00	28303.06	12772.08	1	1	0
2778	177	2	23	74	45	76019.66	76019.66	0.00	63777.14	12242.52	1	1	0
2779	177	1	808	221	20	108220.98	108220.98	0.00	86500.67	21720.31	1	1	0
2780	177	1000	265	60	48	49866.65	0.00	49866.65	33552.66	16313.99	1	0	1
2781	177	2	202	4	29	18897.24	18897.24	0.00	14928.80	3968.44	1	1	0
2782	177	1000	1180	219	49	95919.90	0.00	95919.90	68082.27	27837.63	1	0	1
2783	177	1000	803	122	6	94703.84	0.00	94703.84	66034.63	28669.21	1	0	1
2784	177	4	714	218	23	971.98	971.98	0.00	845.62	126.36	1	1	0
2785	177	1	169	218	14	48613.77	48613.77	0.00	33543.54	15070.23	1	1	0
2786	177	1000	710	80	16	29318.10	0.00	29318.10	21721.47	7596.63	1	0	1
2787	177	1000	591	99	29	220056.81	0.00	220056.81	161665.51	58391.30	1	0	1
2788	177	1	269	152	12	93219.34	93219.34	0.00	68395.69	24823.65	1	1	0
2789	177	3	982	185	15	122654.80	122654.80	0.00	87084.74	35570.06	1	1	0
2790	177	1	504	78	36	40388.15	40388.15	0.00	27752.51	12635.64	1	1	0
2791	177	4	152	197	3	90389.66	90389.66	0.00	77194.40	13195.26	1	1	0
2792	177	1000	1134	233	41	135334.89	0.00	135334.89	99335.63	35999.26	1	0	1
2793	177	3	708	53	8	51554.08	51554.08	0.00	34738.88	16815.20	1	1	0
2794	177	1	930	246	6	25527.13	25527.13	0.00	19030.05	6497.08	1	1	0
2795	177	1000	450	123	21	36624.34	0.00	36624.34	30401.99	6222.35	1	0	1
2796	177	1000	175	25	28	149285.84	0.00	149285.84	126039.04	23246.80	1	0	1
2797	177	1000	488	220	14	95991.98	0.00	95991.98	75795.79	20196.19	1	0	1
2798	177	3	127	217	10	73935.30	73935.30	0.00	58995.13	14940.17	1	1	0
2799	177	1	383	21	39	120746.56	120746.56	0.00	85207.58	35538.98	1	1	0
2800	177	2	751	4	6	28887.84	28887.84	0.00	18933.18	9954.66	1	1	0
2801	177	4	552	142	36	1735.16	1735.16	0.00	1370.81	364.35	1	1	0
2802	177	1	832	34	22	148721.81	148721.81	0.00	109479.69	39242.12	1	1	0
2803	177	4	1014	54	8	84836.86	84836.86	0.00	70655.85	14181.01	1	1	0
2804	177	1000	662	104	13	17068.23	0.00	17068.23	13557.85	3510.38	1	0	1
2805	177	2	501	12	38	38763.45	38763.45	0.00	27909.70	10853.75	1	1	0
2806	177	1000	298	119	47	56587.44	0.00	56587.44	41320.00	15267.44	1	0	1
2807	177	1000	9	197	45	84928.68	0.00	84928.68	73038.69	11889.99	1	0	1
2808	177	2	491	178	10	162125.27	162125.27	0.00	131751.51	30373.76	1	1	0
2809	177	1000	1008	198	1	29842.56	0.00	29842.56	19696.08	10146.48	1	0	1
2810	177	1000	863	90	2	182864.34	0.00	182864.34	125514.96	57349.38	1	0	1
2811	177	4	14	191	42	91046.87	91046.87	0.00	58551.10	32495.77	1	1	0
2812	177	1000	878	12	31	40102.61	0.00	40102.61	26678.16	13424.45	1	0	1
2813	177	1000	1005	131	41	42364.83	0.00	42364.83	29807.23	12557.60	1	0	1
2814	177	1000	820	199	5	7161.10	0.00	7161.10	5514.04	1647.06	1	0	1
2815	177	1	291	50	9	42280.46	42280.46	0.00	31609.33	10671.13	1	1	0
2816	177	1000	937	135	35	19820.06	0.00	19820.06	15065.74	4754.32	1	0	1
2817	177	2	546	161	18	82726.04	82726.04	0.00	59591.76	23134.28	1	1	0
2818	177	4	732	107	50	102482.80	102482.80	0.00	78883.68	23599.12	1	1	0
2819	177	1	820	29	34	165343.17	165343.17	0.00	138787.08	26556.09	1	1	0
2820	177	1000	385	159	34	108112.46	0.00	108112.46	70462.27	37650.19	1	0	1
2821	177	1000	53	28	22	38839.50	0.00	38839.50	26799.25	12040.25	1	0	1
2822	177	1000	522	25	8	39635.01	0.00	39635.01	29707.28	9927.73	1	0	1
2823	177	1000	676	16	19	58403.07	0.00	58403.07	44909.99	13493.08	1	0	1
2824	177	3	210	92	45	25515.39	25515.39	0.00	20684.40	4830.99	1	1	0
2825	177	3	260	124	27	21145.17	21145.17	0.00	15924.58	5220.59	1	1	0
2826	177	1000	739	40	44	102155.02	0.00	102155.02	73644.77	28510.25	1	0	1
2827	177	3	958	211	32	38854.39	38854.39	0.00	28238.81	10615.58	1	1	0
2828	177	2	995	58	4	98006.64	98006.64	0.00	82204.25	15802.39	1	1	0
2829	177	3	236	156	2	51451.05	51451.05	0.00	38073.77	13377.28	1	1	0
2830	177	1	159	32	18	71406.59	71406.59	0.00	51797.07	19609.52	1	1	0
2831	177	3	819	7	32	37062.99	37062.99	0.00	29639.79	7423.20	1	1	0
2832	177	1	422	169	25	530.44	530.44	0.00	355.39	175.05	1	1	0
2833	177	1000	234	120	33	25787.13	0.00	25787.13	20458.88	5328.25	1	0	1
2834	177	1000	1055	110	40	32552.19	0.00	32552.19	19531.35	13020.84	1	0	1
2835	177	1000	345	95	7	19158.96	0.00	19158.96	13028.10	6130.86	1	0	1
2836	177	1000	1197	68	6	29274.00	0.00	29274.00	23711.96	5562.04	1	0	1
2837	177	1	660	132	1	150363.20	150363.20	0.00	128363.69	21999.51	1	1	0
2838	177	1000	1213	83	50	69389.21	0.00	69389.21	55483.43	13905.78	1	0	1
2839	177	1000	412	118	26	15206.74	0.00	15206.74	12556.93	2649.81	1	0	1
2840	177	1000	700	108	16	53035.60	0.00	53035.60	38185.60	14850.00	1	0	1
2841	177	1000	441	80	29	54797.36	0.00	54797.36	36357.94	18439.42	1	0	1
2842	177	1000	30	166	18	85397.56	0.00	85397.56	58279.16	27118.40	1	0	1
2843	177	1000	272	244	9	97125.70	0.00	97125.70	77374.90	19750.80	1	0	1
2844	177	1000	340	33	22	125625.57	0.00	125625.57	98224.89	27400.68	1	0	1
2845	177	1000	859	179	30	81449.18	0.00	81449.18	62597.31	18851.87	1	0	1
2846	177	1	865	70	15	69601.43	69601.43	0.00	49117.71	20483.72	1	1	0
2847	177	3	901	139	47	3286.35	3286.35	0.00	2924.85	361.50	1	1	0
2848	177	1000	891	98	3	29214.26	0.00	29214.26	22679.70	6534.56	1	0	1
2849	177	1	1094	19	31	97747.22	97747.22	0.00	72110.74	25636.48	1	1	0
2850	177	1000	1186	77	10	28101.00	0.00	28101.00	20794.72	7306.28	1	0	1
2851	177	1000	1121	185	4	80002.43	0.00	80002.43	63643.14	16359.29	1	0	1
2852	177	1	444	74	19	30363.03	30363.03	0.00	25504.92	4858.11	1	1	0
2853	177	1000	239	96	47	39247.08	0.00	39247.08	23548.24	15698.84	1	0	1
2854	177	1000	197	231	7	5449.48	0.00	5449.48	3324.20	2125.28	1	0	1
2855	177	1000	334	232	37	84197.40	0.00	84197.40	71209.44	12987.96	1	0	1
2856	177	1	820	210	33	90882.37	90882.37	0.00	72190.79	18691.58	1	1	0
2857	177	1000	1212	190	13	117965.29	0.00	117965.29	81084.11	36881.18	1	0	1
2858	177	3	479	45	25	183396.97	183396.97	0.00	142732.50	40664.47	1	1	0
2859	177	2	78	192	45	103738.64	103738.64	0.00	84065.86	19672.78	1	1	0
2860	177	1000	1094	156	12	18110.11	0.00	18110.11	13693.45	4416.66	1	0	1
2861	177	1000	365	246	8	135644.00	0.00	135644.00	99510.92	36133.08	1	0	1
2862	177	2	483	200	44	41466.45	41466.45	0.00	37319.80	4146.65	1	1	0
2863	177	1000	454	78	46	125538.05	0.00	125538.05	102197.06	23340.99	1	0	1
2864	177	1000	108	66	16	105846.25	0.00	105846.25	74191.55	31654.70	1	0	1
2865	177	1	946	31	20	101744.00	101744.00	0.00	71513.65	30230.35	1	1	0
2866	177	2	246	98	31	47944.11	47944.11	0.00	38047.71	9896.40	1	1	0
2867	177	1000	870	17	18	116795.08	0.00	116795.08	85628.31	31166.77	1	0	1
2868	177	1000	583	186	17	161178.49	0.00	161178.49	115706.99	45471.50	1	0	1
2869	177	3	902	40	44	7265.32	7265.32	0.00	5884.90	1380.42	1	1	0
2870	177	1	673	121	1	3296.72	3296.72	0.00	2637.36	659.36	1	1	0
2871	177	3	121	242	7	146050.42	146050.42	0.00	100761.54	45288.88	1	1	0
2872	177	1000	585	141	19	90966.77	0.00	90966.77	60196.69	30770.08	1	0	1
2873	177	1000	174	124	25	18774.72	0.00	18774.72	16146.27	2628.45	1	0	1
2874	177	1000	796	252	12	226793.43	0.00	226793.43	161617.36	65176.07	1	0	1
2875	177	1000	528	201	17	70328.70	0.00	70328.70	42900.50	27428.20	1	0	1
2876	177	1000	365	79	43	158554.37	0.00	158554.37	108076.06	50478.31	1	0	1
2877	177	4	209	207	12	45915.04	45915.04	0.00	39486.96	6428.08	1	1	0
2878	177	1000	837	110	45	48032.31	0.00	48032.31	39234.43	8797.88	1	0	1
2879	177	1000	409	60	14	146374.19	0.00	146374.19	124327.64	22046.55	1	0	1
2880	177	1000	998	155	30	87946.80	0.00	87946.80	65395.20	22551.60	1	0	1
2881	177	1000	1037	194	13	82189.31	0.00	82189.31	68231.26	13958.05	1	0	1
2882	177	1	291	208	29	70564.64	70564.64	0.00	47524.62	23040.02	1	1	0
2883	177	1000	115	110	20	175520.94	0.00	175520.94	128657.17	46863.77	1	0	1
2884	177	4	1170	174	40	154463.54	154463.54	0.00	126755.91	27707.63	1	1	0
2885	177	1000	206	192	21	32321.52	0.00	32321.52	22625.10	9696.42	1	0	1
2886	177	1000	582	37	1	95347.11	0.00	95347.11	78661.19	16685.92	1	0	1
2887	177	2	172	237	7	130145.59	130145.59	0.00	103945.33	26200.26	1	1	0
2888	177	2	944	185	28	151099.58	151099.58	0.00	120066.61	31032.97	1	1	0
2889	177	1000	717	87	9	175545.18	0.00	175545.18	121874.89	53670.29	1	0	1
2890	177	2	529	6	26	137760.64	137760.64	0.00	97827.20	39933.44	1	1	0
2891	177	1000	208	207	36	104213.29	0.00	104213.29	71838.61	32374.68	1	0	1
2892	177	1	1084	180	38	80669.29	80669.29	0.00	62790.87	17878.42	1	1	0
2893	177	2	316	21	2	106063.81	106063.81	0.00	74130.01	31933.80	1	1	0
2894	177	1000	197	4	25	11077.20	0.00	11077.20	8861.76	2215.44	1	0	1
2895	177	1	897	5	49	186047.98	186047.98	0.00	141348.60	44699.38	1	1	0
2896	177	1000	613	152	41	53984.82	0.00	53984.82	37972.79	16012.03	1	0	1
2897	177	1	893	12	33	190613.17	190613.17	0.00	135340.91	55272.26	1	1	0
2898	177	1000	518	64	6	104062.02	0.00	104062.02	65618.03	38443.99	1	0	1
2899	177	1	288	34	47	111742.87	111742.87	0.00	80412.17	31330.70	1	1	0
2900	177	1	745	184	28	191667.08	191667.08	0.00	148268.06	43399.02	1	1	0
2901	177	3	680	107	18	7623.99	7623.99	0.00	5794.20	1829.79	1	1	0
2902	177	1000	649	38	35	66584.00	0.00	66584.00	53383.20	13200.80	1	0	1
2903	177	2	183	43	31	31390.72	31390.72	0.00	24798.68	6592.04	1	1	0
2904	177	1000	15	55	21	30383.82	0.00	30383.82	19757.12	10626.70	1	0	1
2905	177	4	814	178	19	118209.18	118209.18	0.00	88753.60	29455.58	1	1	0
2906	177	3	638	191	46	102825.28	102825.28	0.00	74173.81	28651.47	1	1	0
2907	177	4	1133	144	42	162142.36	162142.36	0.00	123325.95	38816.41	1	1	0
2908	177	1000	15	85	27	164513.20	0.00	164513.20	124349.74	40163.46	1	0	1
2909	177	2	30	37	21	56345.05	56345.05	0.00	49479.75	6865.30	1	1	0
2910	177	1000	1010	3	6	119860.36	0.00	119860.36	82779.76	37080.60	1	0	1
2911	177	1000	6	18	24	32552.19	0.00	32552.19	19531.35	13020.84	1	0	1
2912	177	1000	913	84	35	85341.60	0.00	85341.60	75100.59	10241.01	1	0	1
2913	177	1000	133	232	13	5728.95	0.00	5728.95	4869.60	859.35	1	0	1
2914	177	3	195	219	16	85798.72	85798.72	0.00	69233.82	16564.90	1	1	0
2915	177	4	215	236	47	95092.28	95092.28	0.00	78166.28	16926.00	1	1	0
2916	177	1	1103	202	2	92829.22	92829.22	0.00	72409.65	20419.57	1	1	0
2917	177	2	533	31	50	139684.73	139684.73	0.00	103115.52	36569.21	1	1	0
2918	177	1000	637	95	21	91409.52	0.00	91409.52	69272.20	22137.32	1	0	1
2919	177	3	325	134	47	120241.66	120241.66	0.00	87146.35	33095.31	1	1	0
2920	177	1000	153	68	25	64238.05	0.00	64238.05	42626.23	21611.82	1	0	1
2921	177	1000	183	56	31	93185.15	0.00	93185.15	80600.25	12584.90	1	0	1
2922	177	1000	736	75	31	99583.64	0.00	99583.64	78126.57	21457.07	1	0	1
2923	177	3	746	195	23	46473.12	46473.12	0.00	38834.33	7638.79	1	1	0
2924	177	1000	400	26	50	99429.35	0.00	99429.35	68138.50	31290.85	1	0	1
2925	177	1000	509	33	18	132454.43	0.00	132454.43	103417.61	29036.82	1	0	1
2926	177	1000	82	59	3	62113.46	0.00	62113.46	49796.76	12316.70	1	0	1
2927	177	3	937	163	36	196775.12	196775.12	0.00	151890.50	44884.62	1	1	0
2928	177	1	790	110	30	159593.03	159593.03	0.00	111278.60	48314.43	1	1	0
2929	177	1000	142	186	28	166462.14	0.00	166462.14	129144.64	37317.50	1	0	1
2930	177	1000	293	30	38	6022.86	0.00	6022.86	4556.43	1466.43	1	0	1
2931	177	1000	857	50	39	167384.95	0.00	167384.95	109261.97	58122.98	1	0	1
2932	177	4	408	136	11	1904.74	1904.74	0.00	1447.60	457.14	1	1	0
2933	177	1000	1136	109	28	5708.25	0.00	5708.25	3539.11	2169.14	1	0	1
2934	177	4	899	33	48	24060.54	24060.54	0.00	17299.89	6760.65	1	1	0
2935	177	1000	568	147	49	87676.16	0.00	87676.16	63114.52	24561.64	1	0	1
2936	177	1000	112	198	31	157398.07	0.00	157398.07	122012.01	35386.06	1	0	1
2937	177	1000	94	123	23	85571.32	0.00	85571.32	65662.78	19908.54	1	0	1
2938	177	4	706	184	26	100319.11	100319.11	0.00	74590.83	25728.28	1	1	0
2939	177	3	101	229	25	94857.98	94857.98	0.00	71851.80	23006.18	1	1	0
2940	177	1	558	245	37	53331.36	53331.36	0.00	46134.05	7197.31	1	1	0
2941	177	2	573	224	50	228213.38	228213.38	0.00	173040.81	55172.57	1	1	0
2942	177	3	918	93	8	130135.12	130135.12	0.00	104951.60	25183.52	1	1	0
2943	177	1000	465	207	22	159682.82	0.00	159682.82	125552.10	34130.72	1	0	1
2944	177	1000	376	131	41	113685.47	0.00	113685.47	86396.59	27288.88	1	0	1
2945	177	1000	1140	51	33	44576.40	0.00	44576.40	39227.25	5349.15	1	0	1
2946	177	1000	733	148	2	91423.10	0.00	91423.10	66967.52	24455.58	1	0	1
2947	177	3	1160	28	29	18844.40	18844.40	0.00	11603.27	7241.13	1	1	0
2948	177	1000	167	112	40	9386.39	0.00	9386.39	6175.12	3211.27	1	0	1
2949	177	2	234	75	45	72333.47	72333.47	0.00	51967.21	20366.26	1	1	0
2950	177	1	622	180	38	104474.19	104474.19	0.00	79199.89	25274.30	1	1	0
2951	177	4	55	207	47	33667.76	33667.76	0.00	20537.30	13130.46	1	1	0
2952	177	4	653	86	43	107394.05	107394.05	0.00	80976.76	26417.29	1	1	0
2953	177	3	677	47	32	10245.34	10245.34	0.00	7684.00	2561.34	1	1	0
2954	177	1000	114	80	19	74859.70	0.00	74859.70	47161.60	27698.10	1	0	1
2955	177	1	488	66	35	168034.99	168034.99	0.00	140691.38	27343.61	1	1	0
2956	177	2	441	229	17	740.34	740.34	0.00	636.66	103.68	1	1	0
2957	177	3	1118	165	6	76640.02	76640.02	0.00	62438.14	14201.88	1	1	0
2958	177	1000	157	121	22	24261.60	0.00	24261.60	17301.32	6960.28	1	0	1
2959	177	4	347	246	23	25239.60	25239.60	0.00	16405.76	8833.84	1	1	0
2960	177	1000	837	169	20	877.20	0.00	877.20	675.44	201.76	1	0	1
2961	177	2	412	70	43	109744.34	109744.34	0.00	75907.21	33837.13	1	1	0
2962	177	1000	222	101	21	51413.31	0.00	51413.31	42574.46	8838.85	1	0	1
2963	177	1000	938	135	39	107377.63	0.00	107377.63	81269.11	26108.52	1	0	1
2964	177	1000	1123	159	34	13281.99	0.00	13281.99	10139.76	3142.23	1	0	1
2965	177	1000	762	47	34	44458.93	0.00	44458.93	31984.52	12474.41	1	0	1
2966	177	1000	345	52	33	122794.56	0.00	122794.56	95110.70	27683.86	1	0	1
2967	177	1	914	143	29	128714.61	128714.61	0.00	94792.62	33921.99	1	1	0
2968	177	1000	526	252	2	81353.19	0.00	81353.19	64602.98	16750.21	1	0	1
2969	177	1000	1072	30	25	106530.92	0.00	106530.92	67491.11	39039.81	1	0	1
2970	177	1000	923	186	31	19689.22	0.00	19689.22	13334.56	6354.66	1	0	1
2971	177	2	169	59	1	135124.59	135124.59	0.00	101195.86	33928.73	1	1	0
2972	177	1	794	180	27	38623.02	38623.02	0.00	26738.30	11884.72	1	1	0
2973	177	1000	253	30	8	62779.80	0.00	62779.80	50851.67	11928.13	1	0	1
2974	177	1000	231	166	8	24164.52	0.00	24164.52	15465.30	8699.22	1	0	1
2975	177	1000	416	37	37	47957.55	0.00	47957.55	36553.45	11404.10	1	0	1
2976	177	1000	220	134	22	112314.92	0.00	112314.92	86418.48	25896.44	1	0	1
2977	177	1000	444	68	11	84997.34	0.00	84997.34	61547.58	23449.76	1	0	1
2978	177	4	697	26	19	39175.43	39175.43	0.00	27880.80	11294.63	1	1	0
2979	177	1000	1056	26	36	204080.95	0.00	204080.95	144191.24	59889.71	1	0	1
2980	177	4	211	57	39	61671.90	61671.90	0.00	42605.94	19065.96	1	1	0
2981	177	1	175	41	31	238768.89	238768.89	0.00	182506.18	56262.71	1	1	0
2982	177	1000	458	132	7	34900.47	0.00	34900.47	23624.09	11276.38	1	0	1
2983	177	4	800	223	26	95683.16	95683.16	0.00	71290.32	24392.84	1	1	0
2984	177	3	439	162	4	143637.46	143637.46	0.00	102626.00	41011.46	1	1	0
2985	177	1000	1153	7	47	141986.84	0.00	141986.84	97470.92	44515.92	1	0	1
2986	177	2	248	97	40	103960.06	103960.06	0.00	77741.68	26218.38	1	1	0
2987	177	1000	590	121	12	29559.65	0.00	29559.65	26465.75	3093.90	1	0	1
2988	177	1	174	230	37	93548.69	93548.69	0.00	78927.44	14621.25	1	1	0
2989	177	3	1093	198	27	5970.90	5970.90	0.00	3881.10	2089.80	1	1	0
2990	177	1	1051	61	36	158935.01	158935.01	0.00	116633.16	42301.85	1	1	0
2991	177	1	454	35	22	32844.18	32844.18	0.00	20363.38	12480.80	1	1	0
2992	177	4	275	246	5	52002.24	52002.24	0.00	44677.42	7324.82	1	1	0
2993	177	3	677	241	37	96830.13	96830.13	0.00	76755.79	20074.34	1	1	0
2994	177	2	1016	177	45	121284.71	121284.71	0.00	86651.96	34632.75	1	1	0
2995	177	1000	776	217	2	15998.85	0.00	15998.85	9759.30	6239.55	1	0	1
2996	177	2	262	98	1	19339.08	19339.08	0.00	16051.44	3287.64	1	1	0
2997	177	3	1005	94	36	61087.14	61087.14	0.00	50369.04	10718.10	1	1	0
2998	177	2	1018	104	8	41435.08	41435.08	0.00	29407.40	12027.68	1	1	0
2999	177	4	588	46	23	87194.17	87194.17	0.00	60333.38	26860.79	1	1	0
3000	177	1	1058	156	48	84165.04	84165.04	0.00	63926.60	20238.44	1	1	0
3001	177	3	1120	210	44	90685.51	90685.51	0.00	72144.24	18541.27	1	1	0
3002	177	3	1205	200	12	40814.62	40814.62	0.00	27525.20	13289.42	1	1	0
3003	177	4	425	216	31	9139.30	9139.30	0.00	7128.70	2010.60	1	1	0
3004	177	4	1016	67	49	104177.95	104177.95	0.00	74346.13	29831.82	1	1	0
3005	177	1000	807	205	5	36997.16	0.00	36997.16	26744.76	10252.40	1	0	1
3006	177	4	946	101	4	126595.41	126595.41	0.00	97090.97	29504.44	1	1	0
3007	177	1	717	34	27	79783.44	79783.44	0.00	65939.00	13844.44	1	1	0
3008	177	4	402	143	35	172710.53	172710.53	0.00	127763.07	44947.46	1	1	0
3009	177	1000	280	109	45	72103.91	0.00	72103.91	50671.87	21432.04	1	0	1
3010	177	2	67	74	19	82568.34	82568.34	0.00	62218.08	20350.26	1	1	0
3011	177	1000	48	78	42	9813.72	0.00	9813.72	8636.07	1177.65	1	0	1
3012	177	1000	377	88	13	57522.90	0.00	57522.90	44772.30	12750.60	1	0	1
3013	177	2	1123	45	12	104477.15	104477.15	0.00	78100.28	26376.87	1	1	0
3014	177	2	738	107	22	115383.71	115383.71	0.00	92714.28	22669.43	1	1	0
3015	177	1	551	120	34	54902.50	54902.50	0.00	35581.00	19321.50	1	1	0
3016	177	1000	352	141	41	36397.24	0.00	36397.24	31301.64	5095.60	1	0	1
3017	177	4	116	205	8	116711.36	116711.36	0.00	98040.54	18670.82	1	1	0
3018	177	4	144	105	28	85555.46	85555.46	0.00	69131.42	16424.04	1	1	0
3019	177	4	94	156	22	13247.36	13247.36	0.00	10465.44	2781.92	1	1	0
3020	177	1000	900	239	36	17957.33	0.00	17957.33	12025.78	5931.55	1	0	1
3021	177	3	31	193	17	162832.88	162832.88	0.00	130770.51	32062.37	1	1	0
3022	177	1000	853	160	21	142517.87	0.00	142517.87	109951.30	32566.57	1	0	1
3023	177	1	890	116	45	82044.93	82044.93	0.00	57421.01	24623.92	1	1	0
3024	177	1000	81	173	42	22882.65	0.00	22882.65	20136.72	2745.93	1	0	1
3025	177	1000	1035	116	5	97365.51	0.00	97365.51	68449.43	28916.08	1	0	1
3026	177	2	1209	157	29	40831.75	40831.75	0.00	35523.60	5308.15	1	1	0
3027	177	3	1027	145	13	49631.87	49631.87	0.00	37544.18	12087.69	1	1	0
3028	177	1000	1087	156	4	148077.27	0.00	148077.27	112794.38	35282.89	1	0	1
3029	177	3	1166	218	12	11739.35	11739.35	0.00	8983.69	2755.66	1	1	0
3030	177	1000	1098	214	40	4083.20	0.00	4083.20	2965.99	1117.21	1	0	1
3031	177	1000	1159	193	38	201262.69	0.00	201262.69	143899.30	57363.39	1	0	1
3032	177	3	446	240	22	120726.46	120726.46	0.00	92026.11	28700.35	1	1	0
3033	177	3	973	63	37	8876.78	8876.78	0.00	6923.89	1952.89	1	1	0
3034	177	2	107	78	44	55312.74	55312.74	0.00	37612.68	17700.06	1	1	0
3035	177	1000	1207	3	15	48008.28	0.00	48008.28	32282.82	15725.46	1	0	1
3036	177	4	281	91	19	22706.32	22706.32	0.00	18392.15	4314.17	1	1	0
3037	177	2	1089	130	1	9338.02	9338.02	0.00	6536.61	2801.41	1	1	0
3038	177	2	238	11	49	15880.90	15880.90	0.00	12228.30	3652.60	1	1	0
3039	177	2	905	240	9	22166.86	22166.86	0.00	17117.88	5048.98	1	1	0
3040	177	2	1144	1	15	64730.06	64730.06	0.00	53779.64	10950.42	1	1	0
3041	177	1000	711	121	45	115555.87	0.00	115555.87	91167.76	24388.11	1	0	1
3042	177	2	582	79	34	154081.54	154081.54	0.00	123840.49	30241.05	1	1	0
3043	177	3	456	146	22	161118.13	161118.13	0.00	117634.98	43483.15	1	1	0
3044	177	1	1214	189	23	134387.59	134387.59	0.00	93170.98	41216.61	1	1	0
3045	177	1000	889	66	31	163017.42	0.00	163017.42	125693.22	37324.20	1	0	1
3046	177	1000	1199	151	4	98223.37	0.00	98223.37	72195.01	26028.36	1	0	1
3047	177	2	204	60	37	66484.80	66484.80	0.00	45320.16	21164.64	1	1	0
3048	177	1	580	92	23	156330.27	156330.27	0.00	116037.43	40292.84	1	1	0
3049	177	3	1066	233	20	203053.51	203053.51	0.00	154737.70	48315.81	1	1	0
3050	177	3	133	70	15	134383.48	134383.48	0.00	110725.06	23658.42	1	1	0
3051	177	3	309	37	30	66246.75	66246.75	0.00	42776.54	23470.21	1	1	0
3052	177	1000	954	59	11	109087.35	0.00	109087.35	89234.09	19853.26	1	0	1
3053	177	2	752	192	11	97769.13	97769.13	0.00	71524.59	26244.54	1	1	0
3054	177	2	940	132	27	65437.01	65437.01	0.00	49844.66	15592.35	1	1	0
3055	177	1000	110	83	30	83135.11	0.00	83135.11	56462.13	26672.98	1	0	1
3056	177	1	446	52	3	79835.97	79835.97	0.00	67864.20	11971.77	1	1	0
3057	177	1000	482	147	39	65255.10	0.00	65255.10	57424.50	7830.60	1	0	1
3058	177	1000	806	82	39	145501.80	0.00	145501.80	96700.85	48800.95	1	0	1
3059	177	1000	440	246	41	204632.34	0.00	204632.34	158569.46	46062.88	1	0	1
3060	177	4	361	221	17	135277.41	135277.41	0.00	106167.37	29110.04	1	1	0
3061	177	1000	884	79	41	55500.94	0.00	55500.94	40966.78	14534.16	1	0	1
3062	177	1000	544	62	6	120855.07	0.00	120855.07	104217.84	16637.23	1	0	1
3063	177	1000	706	251	33	112451.84	0.00	112451.84	92157.22	20294.62	1	0	1
3064	177	3	326	5	50	112048.68	112048.68	0.00	79222.46	32826.22	1	1	0
3065	177	1000	540	21	29	9602.34	0.00	9602.34	8642.10	960.24	1	0	1
3066	177	3	287	188	22	127991.76	127991.76	0.00	109609.46	18382.30	1	1	0
3067	177	1000	445	35	12	5458.71	0.00	5458.71	4686.22	772.49	1	0	1
3068	177	1	15	67	41	171301.99	171301.99	0.00	148538.51	22763.48	1	1	0
3069	177	1000	78	156	34	71080.89	0.00	71080.89	47900.74	23180.15	1	0	1
3070	177	2	1106	2	15	44042.62	44042.62	0.00	36407.80	7634.82	1	1	0
3071	177	2	439	102	18	55393.94	55393.94	0.00	46144.66	9249.28	1	1	0
3072	177	3	1056	117	46	113283.66	113283.66	0.00	77790.37	35493.29	1	1	0
3073	177	1000	436	209	7	39159.57	0.00	39159.57	25479.66	13679.91	1	0	1
3074	177	1000	1191	155	12	54714.66	0.00	54714.66	36783.29	17931.37	1	0	1
3075	177	1000	216	58	45	146034.60	0.00	146034.60	106976.19	39058.41	1	0	1
3076	177	1000	215	97	46	89974.53	0.00	89974.53	60282.90	29691.63	1	0	1
3077	177	2	585	102	34	84738.98	84738.98	0.00	65275.57	19463.41	1	1	0
3078	177	1000	1069	211	3	125774.63	0.00	125774.63	106631.65	19142.98	1	0	1
3079	177	1000	1174	102	16	42677.25	0.00	42677.25	31880.47	10796.78	1	0	1
3080	177	2	294	122	28	104100.69	104100.69	0.00	80807.16	23293.53	1	1	0
3081	177	1000	330	16	4	45957.42	0.00	45957.42	34326.65	11630.77	1	0	1
3082	177	2	1136	55	19	41624.88	41624.88	0.00	28600.70	13024.18	1	1	0
3083	177	4	1140	71	29	165430.42	165430.42	0.00	119059.36	46371.06	1	1	0
3084	177	2	222	173	23	96970.46	96970.46	0.00	72133.54	24836.92	1	1	0
3085	177	2	607	115	28	21380.94	21380.94	0.00	17746.19	3634.75	1	1	0
3086	177	1000	683	95	40	34498.72	0.00	34498.72	27663.20	6835.52	1	0	1
3087	177	4	296	237	6	82767.90	82767.90	0.00	62816.40	19951.50	1	1	0
3088	177	1000	107	185	21	8468.07	0.00	8468.07	5758.29	2709.78	1	0	1
3089	177	1000	144	152	29	141100.44	0.00	141100.44	108104.84	32995.60	1	0	1
3090	177	3	499	87	22	100610.14	100610.14	0.00	83200.12	17410.02	1	1	0
3091	177	1000	1045	222	42	29779.49	0.00	29779.49	19530.25	10249.24	1	0	1
3092	177	1	764	250	34	36280.40	36280.40	0.00	30444.84	5835.56	1	1	0
3093	177	3	1049	26	3	117683.58	117683.58	0.00	94085.46	23598.12	1	1	0
3094	177	1000	297	34	8	146259.20	0.00	146259.20	107957.63	38301.57	1	0	1
3095	177	1000	213	132	18	92302.88	0.00	92302.88	78238.87	14064.01	1	0	1
3096	177	2	475	50	39	81350.84	81350.84	0.00	54529.76	26821.08	1	1	0
3097	177	1	157	225	7	7062.54	7062.54	0.00	4873.16	2189.38	1	1	0
3098	177	1000	1158	147	48	19572.06	0.00	19572.06	15473.61	4098.45	1	0	1
3099	177	2	211	136	7	58229.90	58229.90	0.00	45419.30	12810.60	1	1	0
3100	177	4	586	132	44	12681.68	12681.68	0.00	9992.89	2688.79	1	1	0
3101	177	3	903	219	45	254249.48	254249.48	0.00	190762.43	63487.05	1	1	0
3102	177	1000	1051	36	37	7398.94	0.00	7398.94	6659.04	739.90	1	0	1
3103	177	1000	990	225	11	116043.64	0.00	116043.64	80424.06	35619.58	1	0	1
3104	177	2	1001	108	29	43763.21	43763.21	0.00	36608.62	7154.59	1	1	0
3105	177	1000	51	85	8	70093.70	0.00	70093.70	53972.10	16121.60	1	0	1
3106	177	3	834	194	30	48264.68	48264.68	0.00	37348.65	10916.03	1	1	0
3107	177	2	57	90	50	229132.28	229132.28	0.00	184259.92	44872.36	1	1	0
3108	177	3	1197	9	45	867.00	867.00	0.00	641.58	225.42	1	1	0
3109	177	1	968	44	29	38878.10	38878.10	0.00	34212.75	4665.35	1	1	0
3110	177	2	540	67	36	13287.04	13287.04	0.00	8633.05	4653.99	1	1	0
3111	177	1000	221	188	41	49052.87	0.00	49052.87	35925.40	13127.47	1	0	1
3112	177	1000	18	205	2	122484.29	0.00	122484.29	100616.90	21867.39	1	0	1
3113	177	3	183	121	20	67027.96	67027.96	0.00	48675.64	18352.32	1	1	0
3114	177	1000	342	243	44	15982.34	0.00	15982.34	11846.69	4135.65	1	0	1
3115	177	3	804	184	18	64304.26	64304.26	0.00	50532.87	13771.39	1	1	0
3116	177	1000	1049	170	33	94906.30	0.00	94906.30	80831.58	14074.72	1	0	1
3117	177	3	182	242	5	36780.17	36780.17	0.00	27952.96	8827.21	1	1	0
3118	177	4	717	201	25	3887.92	3887.92	0.00	3382.48	505.44	1	1	0
3119	177	2	234	166	43	142792.11	142792.11	0.00	89982.87	52809.24	1	1	0
3120	177	1000	1093	195	16	92502.08	0.00	92502.08	62024.15	30477.93	1	0	1
3121	177	1000	750	233	39	68999.92	0.00	68999.92	56544.26	12455.66	1	0	1
3122	177	1000	31	242	8	16663.12	0.00	16663.12	10831.04	5832.08	1	0	1
3123	177	1	867	111	33	82222.23	82222.23	0.00	57276.38	24945.85	1	1	0
3124	177	2	324	20	18	35608.53	35608.53	0.00	29473.01	6135.52	1	1	0
3125	177	2	480	52	12	62685.06	62685.06	0.00	46769.34	15915.72	1	1	0
3126	177	1000	588	245	2	17596.72	0.00	17596.72	13009.81	4586.91	1	0	1
3127	177	1000	286	109	34	91865.64	0.00	91865.64	59965.31	31900.33	1	0	1
3128	177	1000	1207	220	5	5082.66	0.00	5082.66	3862.80	1219.86	1	0	1
3129	177	1000	454	83	33	28309.47	0.00	28309.47	18684.24	9625.23	1	0	1
3130	177	3	1132	226	17	192362.63	192362.63	0.00	148464.59	43898.04	1	1	0
3131	177	1000	119	233	25	23026.32	0.00	23026.32	17583.63	5442.69	1	0	1
3132	177	3	324	192	17	229843.73	229843.73	0.00	179785.76	50057.97	1	1	0
3133	177	3	592	174	10	98267.31	98267.31	0.00	80433.56	17833.75	1	1	0
3134	177	1000	762	245	45	22576.68	0.00	22576.68	15728.60	6848.08	1	0	1
3135	177	4	1177	103	25	122007.25	122007.25	0.00	90110.40	31896.85	1	1	0
3136	177	2	683	55	4	43195.60	43195.60	0.00	36259.94	6935.66	1	1	0
3137	177	1000	240	237	31	101668.04	0.00	101668.04	83245.60	18422.44	1	0	1
3138	177	1000	817	216	22	23478.62	0.00	23478.62	15902.92	7575.70	1	0	1
3139	177	1000	318	213	18	68561.70	0.00	68561.70	53175.84	15385.86	1	0	1
3140	177	1000	653	139	29	209867.06	0.00	209867.06	165389.15	44477.91	1	0	1
3141	177	1000	1070	81	9	205206.21	0.00	205206.21	152771.16	52435.05	1	0	1
3142	177	1000	1004	68	15	106129.72	0.00	106129.72	83857.39	22272.33	1	0	1
3143	177	4	527	1	23	24649.47	24649.47	0.00	16022.16	8627.31	1	1	0
3144	177	1000	1168	42	12	49541.05	0.00	49541.05	41119.05	8422.00	1	0	1
3145	177	3	1130	104	42	57594.78	57594.78	0.00	47227.74	10367.04	1	1	0
3146	177	2	1199	39	15	249776.64	249776.64	0.00	207539.95	42236.69	1	1	0
3147	177	1000	1139	4	37	85241.83	0.00	85241.83	67551.44	17690.39	1	0	1
3148	177	1000	443	138	12	112035.14	0.00	112035.14	73895.57	38139.57	1	0	1
3149	177	1	155	186	44	63985.50	63985.50	0.00	49153.71	14831.79	1	1	0
3150	177	1000	814	95	15	145233.06	0.00	145233.06	101354.49	43878.57	1	0	1
3151	177	1000	449	234	30	69130.54	0.00	69130.54	52535.16	16595.38	1	0	1
3152	177	1000	136	84	43	18896.16	0.00	18896.16	14550.08	4346.08	1	0	1
3153	177	2	844	115	31	140048.57	140048.57	0.00	97838.42	42210.15	1	1	0
3154	177	2	357	75	47	84812.20	84812.20	0.00	58316.10	26496.10	1	1	0
3155	177	3	957	6	4	109226.39	109226.39	0.00	91336.86	17889.53	1	1	0
3156	177	1000	217	19	42	96047.40	0.00	96047.40	76454.10	19593.30	1	0	1
3157	177	1000	656	63	26	133694.40	0.00	133694.40	100336.69	33357.71	1	0	1
3158	177	1000	453	15	50	31071.60	0.00	31071.60	21439.40	9632.20	1	0	1
3159	177	3	482	37	44	116321.17	116321.17	0.00	89686.34	26634.83	1	1	0
3160	177	3	487	179	29	164813.24	164813.24	0.00	129123.87	35689.37	1	1	0
3161	177	1000	298	236	39	11208.95	0.00	11208.95	8967.15	2241.80	1	0	1
3162	177	2	676	250	14	46862.06	46862.06	0.00	37852.16	9009.90	1	1	0
3163	177	1000	571	65	27	174703.11	0.00	174703.11	132382.64	42320.47	1	0	1
3164	177	2	291	146	49	81513.54	81513.54	0.00	56738.46	24775.08	1	1	0
3165	177	4	358	63	37	47392.00	47392.00	0.00	37424.84	9967.16	1	1	0
3166	177	1000	566	99	9	161086.29	0.00	161086.29	124557.94	36528.35	1	0	1
3167	177	1000	511	2	37	165293.89	0.00	165293.89	127289.66	38004.23	1	0	1
3168	177	4	701	137	10	53924.70	53924.70	0.00	42515.98	11408.72	1	1	0
3169	177	1000	808	56	38	139779.26	0.00	139779.26	100078.84	39700.42	1	0	1
3170	177	3	422	235	45	6670.59	6670.59	0.00	4536.00	2134.59	1	1	0
3171	177	3	71	237	18	46588.21	46588.21	0.00	32823.85	13764.36	1	1	0
3172	177	1000	523	78	46	75761.06	0.00	75761.06	62514.92	13246.14	1	0	1
3173	177	4	1178	175	48	8445.30	8445.30	0.00	6080.64	2364.66	1	1	0
3174	177	3	173	46	43	198419.97	198419.97	0.00	147004.12	51415.85	1	1	0
3175	177	1000	37	44	15	119299.60	0.00	119299.60	88376.18	30923.42	1	0	1
3176	177	1000	1136	4	30	27093.90	0.00	27093.90	19146.34	7947.56	1	0	1
3177	177	1	675	23	45	125284.59	125284.59	0.00	101519.65	23764.94	1	1	0
3178	177	1000	471	174	35	31281.04	0.00	31281.04	27300.59	3980.45	1	0	1
3179	177	3	587	163	9	214180.06	214180.06	0.00	144082.72	70097.34	1	1	0
3180	177	1000	627	36	30	87544.12	0.00	87544.12	60569.90	26974.22	1	0	1
3181	177	1000	1069	190	13	65291.34	0.00	65291.34	50419.43	14871.91	1	0	1
3182	177	2	1054	120	26	52114.55	52114.55	0.00	39494.86	12619.69	1	1	0
3183	177	1000	720	190	35	113628.15	0.00	113628.15	94764.06	18864.09	1	0	1
3184	177	1000	1047	112	10	102225.80	0.00	102225.80	69606.31	32619.49	1	0	1
3185	177	2	258	141	20	22233.15	22233.15	0.00	14896.20	7336.95	1	1	0
3186	177	2	537	154	43	92356.87	92356.87	0.00	66903.96	25452.91	1	1	0
3187	177	3	698	145	39	244898.10	244898.10	0.00	184654.26	60243.84	1	1	0
3188	177	1000	201	232	48	57869.05	0.00	57869.05	46920.22	10948.83	1	0	1
3189	177	1000	938	176	1	80327.70	0.00	80327.70	59442.50	20885.20	1	0	1
3190	177	4	1203	146	38	71137.40	71137.40	0.00	54064.40	17073.00	1	1	0
3191	177	3	1060	36	50	19204.14	19204.14	0.00	16323.52	2880.62	1	1	0
3192	177	1000	1050	241	18	131329.98	0.00	131329.98	102938.44	28391.54	1	0	1
3193	177	1000	801	158	30	110526.05	0.00	110526.05	78438.31	32087.74	1	0	1
3194	177	1000	1037	81	25	425.74	0.00	425.74	383.16	42.58	1	0	1
3195	177	1	606	99	17	82426.02	82426.02	0.00	65937.76	16488.26	1	1	0
3196	177	1000	559	112	44	120631.39	0.00	120631.39	78986.32	41645.07	1	0	1
3197	177	1000	939	187	20	97347.40	0.00	97347.40	83577.58	13769.82	1	0	1
3198	177	1	248	55	19	78111.29	78111.29	0.00	57729.56	20381.73	1	1	0
3199	177	1000	710	36	42	56500.74	0.00	56500.74	44279.81	12220.93	1	0	1
3200	177	1000	207	200	49	109454.07	0.00	109454.07	76579.64	32874.43	1	0	1
3201	177	1000	260	62	31	55038.38	0.00	55038.38	42372.53	12665.85	1	0	1
3202	177	2	118	32	18	9047.48	9047.48	0.00	7147.51	1899.97	1	1	0
3203	177	4	370	60	6	146738.58	146738.58	0.00	101614.26	45124.32	1	1	0
3204	177	1000	950	216	48	136192.65	0.00	136192.65	106812.13	29380.52	1	0	1
3205	177	1000	238	233	18	171757.17	0.00	171757.17	127413.85	44343.32	1	0	1
3206	177	2	983	124	4	70938.42	70938.42	0.00	56508.75	14429.67	1	1	0
3207	177	1	71	82	15	107708.28	107708.28	0.00	89455.73	18252.55	1	1	0
3208	177	1000	467	32	2	20423.52	0.00	20423.52	16747.29	3676.23	1	0	1
3209	177	1000	1031	136	14	103086.43	0.00	103086.43	70379.05	32707.38	1	0	1
3210	177	4	1154	114	30	72992.07	72992.07	0.00	50042.56	22949.51	1	1	0
3211	177	1000	134	132	33	72915.40	0.00	72915.40	63042.20	9873.20	1	0	1
3212	177	1000	984	113	15	121629.98	0.00	121629.98	97618.96	24011.02	1	0	1
3213	177	1000	319	12	7	181159.50	0.00	181159.50	134015.16	47144.34	1	0	1
3214	177	1000	947	247	9	136689.45	0.00	136689.45	94723.55	41965.90	1	0	1
3215	177	2	704	89	42	124141.97	124141.97	0.00	85501.24	38640.73	1	1	0
3216	177	2	784	24	48	46186.78	46186.78	0.00	37100.99	9085.79	1	1	0
3217	177	1000	873	120	48	56656.24	0.00	56656.24	35693.44	20962.80	1	0	1
3218	177	1	233	211	49	125990.59	125990.59	0.00	92005.47	33985.12	1	1	0
3219	177	4	1199	174	28	39921.93	39921.93	0.00	26541.56	13380.37	1	1	0
3220	177	1000	429	94	5	9842.23	0.00	9842.23	8070.63	1771.60	1	0	1
3221	177	2	966	15	11	257830.83	257830.83	0.00	189779.68	68051.15	1	1	0
3222	177	2	914	2	26	163538.10	163538.10	0.00	113245.38	50292.72	1	1	0
3223	177	1000	727	77	31	2087.23	0.00	2087.23	1857.63	229.60	1	0	1
3224	177	1000	1198	41	42	140180.14	0.00	140180.14	94833.65	45346.49	1	0	1
3225	177	2	358	242	24	80582.34	80582.34	0.00	67174.26	13408.08	1	1	0
3226	177	1	503	146	3	139651.96	139651.96	0.00	101308.26	38343.70	1	1	0
3227	177	3	1131	162	3	59877.30	59877.30	0.00	41315.33	18561.97	1	1	0
3228	177	2	246	219	40	23902.52	23902.52	0.00	19361.04	4541.48	1	1	0
3229	177	1000	169	224	15	87707.87	0.00	87707.87	68216.84	19491.03	1	0	1
3230	177	1000	835	2	30	196712.20	0.00	196712.20	135499.36	61212.84	1	0	1
3231	177	1000	840	146	14	140450.46	0.00	140450.46	113903.61	26546.85	1	0	1
3232	177	3	706	193	33	135698.97	135698.97	0.00	91255.91	44443.06	1	1	0
3233	177	1000	80	45	11	180074.46	0.00	180074.46	126070.99	54003.47	1	0	1
3234	177	1	475	114	46	43178.00	43178.00	0.00	34542.40	8635.60	1	1	0
3235	177	1000	542	181	27	109564.23	0.00	109564.23	83115.48	26448.75	1	0	1
3236	177	1000	651	187	11	165759.38	0.00	165759.38	126748.14	39011.24	1	0	1
3237	177	1000	507	157	24	213696.29	0.00	213696.29	162913.69	50782.60	1	0	1
3238	177	1000	664	221	20	70589.05	0.00	70589.05	48668.35	21920.70	1	0	1
3239	177	2	241	136	23	5610.60	5610.60	0.00	3478.56	2132.04	1	1	0
3240	177	3	37	77	37	222420.51	222420.51	0.00	173033.77	49386.74	1	1	0
3241	177	1000	819	217	30	39343.84	0.00	39343.84	25534.14	13809.70	1	0	1
3242	177	4	462	36	38	105448.28	105448.28	0.00	91307.40	14140.88	1	1	0
3243	177	1000	531	28	16	46839.09	0.00	46839.09	36193.77	10645.32	1	0	1
3244	177	1000	350	173	20	117320.84	0.00	117320.84	84023.55	33297.29	1	0	1
3245	177	3	922	165	22	139112.20	139112.20	0.00	112184.55	26927.65	1	1	0
3246	177	1000	282	115	19	95624.18	0.00	95624.18	64213.52	31410.66	1	0	1
3247	177	2	1054	6	7	166115.10	166115.10	0.00	117824.44	48290.66	1	1	0
3248	177	1000	612	188	2	152487.09	0.00	152487.09	108333.38	44153.71	1	0	1
3249	177	3	198	210	15	217247.18	217247.18	0.00	176935.78	40311.40	1	1	0
3250	177	1	288	19	49	43911.00	43911.00	0.00	35567.94	8343.06	1	1	0
3251	177	1000	207	35	33	49072.05	0.00	49072.05	42207.23	6864.82	1	0	1
3252	177	1000	479	106	23	105666.39	0.00	105666.39	70158.51	35507.88	1	0	1
3253	177	2	263	101	42	5280.98	5280.98	0.00	4066.35	1214.63	1	1	0
3254	177	3	519	219	7	133760.63	133760.63	0.00	89219.17	44541.46	1	1	0
3255	177	1000	821	186	38	119505.69	0.00	119505.69	96033.90	23471.79	1	0	1
3256	177	2	789	2	3	39643.10	39643.10	0.00	29138.04	10505.06	1	1	0
3257	177	1	422	80	33	97749.90	97749.90	0.00	86997.40	10752.50	1	1	0
3258	177	4	766	46	4	68778.88	68778.88	0.00	55687.79	13091.09	1	1	0
3259	177	3	656	68	8	157484.08	157484.08	0.00	109613.91	47870.17	1	1	0
3260	177	2	30	7	47	118292.72	118292.72	0.00	95387.70	22905.02	1	1	0
3261	177	1000	284	155	23	26859.25	0.00	26859.25	17712.38	9146.87	1	0	1
3262	177	3	1020	240	4	3684.60	3684.60	0.00	3205.60	479.00	1	1	0
3263	177	1000	1119	89	31	207900.78	0.00	207900.78	146313.63	61587.15	1	0	1
3264	177	2	705	73	26	76175.89	76175.89	0.00	53451.41	22724.48	1	1	0
3265	177	1000	469	139	45	39554.49	0.00	39554.49	26857.02	12697.47	1	0	1
3266	177	1000	990	164	21	132285.39	0.00	132285.39	85468.29	46817.10	1	0	1
3267	177	1000	295	223	2	132983.16	0.00	132983.16	105839.94	27143.22	1	0	1
3268	177	3	685	170	39	149614.14	149614.14	0.00	121999.96	27614.18	1	1	0
3269	177	4	16	39	28	17544.94	17544.94	0.00	14921.54	2623.40	1	1	0
3270	177	1000	483	146	7	28817.50	0.00	28817.50	23630.35	5187.15	1	0	1
3271	177	1	1101	143	45	43794.17	43794.17	0.00	27152.37	16641.80	1	1	0
3272	177	1000	508	243	6	178206.29	0.00	178206.29	152558.59	25647.70	1	0	1
3273	177	1000	213	246	17	139657.04	0.00	139657.04	92256.92	47400.12	1	0	1
3274	177	1000	1175	25	2	63713.34	0.00	63713.34	52596.36	11116.98	1	0	1
3275	177	2	707	52	47	136453.39	136453.39	0.00	99870.85	36582.54	1	1	0
3276	177	1000	324	47	35	59544.00	0.00	59544.00	38108.16	21435.84	1	0	1
3277	177	1	1095	120	1	53260.76	53260.76	0.00	34619.48	18641.28	1	1	0
3278	177	1000	1212	48	37	58432.33	0.00	58432.33	44088.53	14343.80	1	0	1
3279	177	1000	1154	152	7	112792.33	0.00	112792.33	86800.37	25991.96	1	0	1
3280	177	4	629	223	9	21291.69	21291.69	0.00	13200.84	8090.85	1	1	0
3281	177	4	244	215	7	87273.60	87273.60	0.00	56727.80	30545.80	1	1	0
3282	177	1000	631	5	16	58541.99	0.00	58541.99	49299.53	9242.46	1	0	1
3283	177	1000	234	68	25	113883.45	0.00	113883.45	85036.25	28847.20	1	0	1
3284	177	1	237	34	10	34633.62	34633.62	0.00	24936.21	9697.41	1	1	0
3285	177	1000	969	37	1	30238.12	0.00	30238.12	23893.90	6344.22	1	0	1
3286	177	1000	745	174	36	44383.90	0.00	44383.90	34619.45	9764.45	1	0	1
3287	177	3	797	9	45	86695.86	86695.86	0.00	68756.36	17939.50	1	1	0
3288	177	1000	125	236	32	91876.90	0.00	91876.90	65841.07	26035.83	1	0	1
3289	177	4	969	122	2	65361.94	65361.94	0.00	53114.06	12247.88	1	1	0
3290	177	3	314	82	35	42344.99	42344.99	0.00	29554.72	12790.27	1	1	0
3291	177	1000	789	132	23	74543.38	0.00	74543.38	54379.36	20164.02	1	0	1
3292	177	4	1152	251	11	64354.70	64354.70	0.00	47405.70	16949.00	1	1	0
3293	177	1000	423	141	17	149631.83	0.00	149631.83	124294.06	25337.77	1	0	1
3294	177	2	677	157	6	160250.34	160250.34	0.00	120272.32	39978.02	1	1	0
3295	177	4	599	108	50	26953.03	26953.03	0.00	19338.43	7614.60	1	1	0
3296	177	1000	466	96	46	124435.16	0.00	124435.16	89303.50	35131.66	1	0	1
3297	177	4	77	105	6	139518.69	139518.69	0.00	115216.05	24302.64	1	1	0
3298	177	1	464	1	18	65085.31	65085.31	0.00	57187.53	7897.78	1	1	0
3299	177	1000	113	249	35	75703.51	0.00	75703.51	57705.47	17998.04	1	0	1
3300	177	4	89	120	44	38988.81	38988.81	0.00	28071.96	10916.85	1	1	0
3301	177	1000	392	228	15	81676.66	0.00	81676.66	57789.28	23887.38	1	0	1
3302	177	1000	184	153	14	180005.84	0.00	180005.84	134499.41	45506.43	1	0	1
3303	177	1000	124	160	31	58607.88	0.00	58607.88	42785.13	15822.75	1	0	1
3304	177	1000	419	120	2	22692.80	0.00	22692.80	18608.10	4084.70	1	0	1
3305	177	3	422	155	44	9043.82	9043.82	0.00	6782.86	2260.96	1	1	0
3306	177	4	19	178	24	156137.97	156137.97	0.00	113571.31	42566.66	1	1	0
3307	177	3	933	206	18	67373.73	67373.73	0.00	42445.44	24928.29	1	1	0
3308	177	1000	924	85	48	149357.06	0.00	149357.06	112179.00	37178.06	1	0	1
3309	177	1000	122	21	23	98241.64	0.00	98241.64	65335.81	32905.83	1	0	1
3310	177	1000	240	249	26	79399.28	0.00	79399.28	62977.95	16421.33	1	0	1
3311	177	4	1103	225	12	123052.32	123052.32	0.00	86986.29	36066.03	1	1	0
3312	177	1	789	97	4	99043.44	99043.44	0.00	76551.19	22492.25	1	1	0
3313	177	1000	24	173	25	78328.06	0.00	78328.06	66525.74	11802.32	1	0	1
3314	177	1000	897	20	43	145150.03	0.00	145150.03	104451.16	40698.87	1	0	1
3315	177	1000	929	37	5	46103.50	0.00	46103.50	41032.10	5071.40	1	0	1
3316	177	3	348	109	33	110406.90	110406.90	0.00	87577.11	22829.79	1	1	0
3317	177	2	25	36	47	110613.10	110613.10	0.00	75820.31	34792.79	1	1	0
3318	177	2	717	80	47	195993.41	195993.41	0.00	137967.89	58025.52	1	1	0
3319	177	1000	915	204	2	27681.43	0.00	27681.43	19376.98	8304.45	1	0	1
3320	177	1000	417	64	21	11013.68	0.00	11013.68	9361.62	1652.06	1	0	1
3321	177	1000	171	74	50	77716.66	0.00	77716.66	64236.22	13480.44	1	0	1
3322	177	1	669	43	37	107633.15	107633.15	0.00	74957.44	32675.71	1	1	0
3323	177	1000	509	96	5	13832.20	0.00	13832.20	10789.10	3043.10	1	0	1
3324	177	3	587	24	32	20016.30	20016.30	0.00	13410.93	6605.37	1	1	0
3325	177	1000	749	2	28	148204.47	0.00	148204.47	121137.15	27067.32	1	0	1
3326	177	1000	1067	195	39	29246.01	0.00	29246.01	18361.59	10884.42	1	0	1
3327	177	4	664	74	37	121169.62	121169.62	0.00	83356.01	37813.61	1	1	0
3328	177	2	283	223	21	28526.50	28526.50	0.00	23407.44	5119.06	1	1	0
3329	177	1000	1072	35	43	136878.30	0.00	136878.30	95985.46	40892.84	1	0	1
3330	177	2	773	26	37	86096.14	86096.14	0.00	62363.05	23733.09	1	1	0
3331	177	3	349	107	16	217485.48	217485.48	0.00	153221.23	64264.25	1	1	0
3332	177	1000	230	32	27	74926.67	0.00	74926.67	49018.57	25908.10	1	0	1
3333	177	4	729	121	39	87809.18	87809.18	0.00	59750.44	28058.74	1	1	0
3334	177	1000	71	168	39	23315.60	0.00	23315.60	17364.74	5950.86	1	0	1
3335	177	1000	729	143	39	82473.32	0.00	82473.32	64647.60	17825.72	1	0	1
3336	177	1000	920	22	13	57327.99	0.00	57327.99	40747.63	16580.36	1	0	1
3337	177	1000	188	139	15	186672.48	0.00	186672.48	149942.15	36730.33	1	0	1
3338	177	1	272	44	16	62261.72	62261.72	0.00	41555.32	20706.40	1	1	0
3339	177	1000	606	73	41	164827.22	0.00	164827.22	136110.78	28716.44	1	0	1
3340	177	4	310	65	30	56856.58	56856.58	0.00	39628.58	17228.00	1	1	0
3341	177	1000	154	27	41	36248.13	0.00	36248.13	27817.07	8431.06	1	0	1
3342	177	1	28	74	6	151573.12	151573.12	0.00	116521.64	35051.48	1	1	0
3344	177	3	703	238	32	69074.60	69074.60	0.00	51708.20	17366.40	1	1	0
3345	177	3	450	205	27	57514.07	57514.07	0.00	43109.97	14404.10	1	1	0
3346	177	4	1203	110	17	123610.95	123610.95	0.00	79805.15	43805.80	1	1	0
3347	177	4	899	5	26	86636.25	86636.25	0.00	77106.24	9530.01	1	1	0
3348	177	1000	1160	134	25	167821.19	0.00	167821.19	129162.10	38659.09	1	0	1
3349	177	4	164	25	33	47458.96	47458.96	0.00	33378.33	14080.63	1	1	0
3350	177	1000	661	34	8	156922.44	0.00	156922.44	106799.33	50123.11	1	0	1
3351	177	1000	638	75	39	28292.90	0.00	28292.90	19522.10	8770.80	1	0	1
3352	177	2	1211	86	27	148479.20	148479.20	0.00	114845.26	33633.94	1	1	0
3353	177	1000	1033	196	9	124727.13	0.00	124727.13	106276.42	18450.71	1	0	1
3354	177	1000	928	213	50	142569.23	0.00	142569.23	105567.51	37001.72	1	0	1
3355	177	2	71	81	15	87038.37	87038.37	0.00	74208.38	12829.99	1	1	0
3356	177	1000	992	175	47	108662.46	0.00	108662.46	80830.68	27831.78	1	0	1
3357	177	1	272	34	1	116018.59	116018.59	0.00	91601.80	24416.79	1	1	0
3358	177	1000	889	232	44	208172.52	0.00	208172.52	150326.07	57846.45	1	0	1
3359	177	1000	734	60	20	180570.06	0.00	180570.06	134525.64	46044.42	1	0	1
3360	177	4	292	46	5	24738.48	24738.48	0.00	17547.51	7190.97	1	1	0
3361	177	2	1109	164	32	60037.83	60037.83	0.00	49457.80	10580.03	1	1	0
3362	177	1	683	92	36	91500.77	91500.77	0.00	73908.31	17592.46	1	1	0
3363	177	3	736	208	14	136053.63	136053.63	0.00	103349.77	32703.86	1	1	0
3364	177	1000	421	184	31	22319.92	0.00	22319.92	16516.76	5803.16	1	0	1
3365	177	1	437	221	21	7835.25	7835.25	0.00	7051.74	783.51	1	1	0
3366	177	1000	131	178	16	139577.18	0.00	139577.18	94904.93	44672.25	1	0	1
3367	177	1	460	4	27	38367.14	38367.14	0.00	34530.44	3836.70	1	1	0
3368	177	4	854	100	34	79016.09	79016.09	0.00	65026.97	13989.12	1	1	0
3369	177	1000	10	71	39	50261.12	0.00	50261.12	34680.16	15580.96	1	0	1
3370	177	2	1197	134	4	2558.04	2558.04	0.00	1585.98	972.06	1	1	0
3371	177	3	304	105	6	40890.94	40890.94	0.00	28341.43	12549.51	1	1	0
3372	177	3	133	22	42	76677.81	76677.81	0.00	59736.42	16941.39	1	1	0
3373	177	4	1014	43	2	218.34	218.34	0.00	152.82	65.52	1	1	0
3374	177	1000	226	250	11	130250.98	0.00	130250.98	97729.60	32521.38	1	0	1
3375	177	2	328	188	11	138168.10	138168.10	0.00	111893.39	26274.71	1	1	0
3376	177	1000	868	169	8	1706.10	0.00	1706.10	1501.37	204.73	1	0	1
3377	177	3	1129	103	36	112267.01	112267.01	0.00	84619.55	27647.46	1	1	0
3378	177	2	743	249	20	55019.25	55019.25	0.00	45677.69	9341.56	1	1	0
3379	177	2	629	161	24	258810.92	258810.92	0.00	200007.38	58803.54	1	1	0
3380	177	1000	995	191	9	78531.36	0.00	78531.36	52608.08	25923.28	1	0	1
3381	177	3	382	151	20	33283.08	33283.08	0.00	20302.68	12980.40	1	1	0
3382	177	2	265	207	50	31339.56	31339.56	0.00	27630.94	3708.62	1	1	0
3383	177	3	990	220	47	29857.31	29857.31	0.00	20153.18	9704.13	1	1	0
3384	177	3	219	3	36	55680.78	55680.78	0.00	40090.14	15590.64	1	1	0
3385	177	1	283	38	43	66788.59	66788.59	0.00	45667.58	21121.01	1	1	0
3386	177	3	298	13	6	102821.97	102821.97	0.00	69199.23	33622.74	1	1	0
3387	177	4	307	217	49	50200.15	50200.15	0.00	37073.68	13126.47	1	1	0
3388	177	1	214	10	8	25530.14	25530.14	0.00	19696.12	5834.02	1	1	0
3389	177	1000	722	112	34	99776.06	0.00	99776.06	70317.71	29458.35	1	0	1
3390	177	3	878	147	9	14544.02	14544.02	0.00	9325.52	5218.50	1	1	0
3391	177	2	955	110	10	108967.64	108967.64	0.00	78883.27	30084.37	1	1	0
3392	177	3	573	133	40	80848.06	80848.06	0.00	62965.38	17882.68	1	1	0
3393	177	1000	305	119	13	60894.97	0.00	60894.97	44687.16	16207.81	1	0	1
3394	177	2	860	10	6	235088.50	235088.50	0.00	166890.76	68197.74	1	1	0
3395	177	4	169	64	27	170075.94	170075.94	0.00	147034.83	23041.11	1	1	0
3396	177	2	80	44	36	186578.72	186578.72	0.00	139273.30	47305.42	1	1	0
3397	177	1000	1106	34	42	77953.91	0.00	77953.91	65725.64	12228.27	1	0	1
3398	177	1	610	32	22	102926.39	102926.39	0.00	81350.89	21575.50	1	1	0
3399	177	3	447	76	45	117175.71	117175.71	0.00	89438.81	27736.90	1	1	0
3400	177	3	1035	183	6	8062.44	8062.44	0.00	6772.45	1289.99	1	1	0
3401	177	1000	256	180	24	89603.49	0.00	89603.49	60607.09	28996.40	1	0	1
3402	177	1	183	232	21	97045.45	97045.45	0.00	67673.77	29371.68	1	1	0
3403	177	1000	253	30	3	71592.73	0.00	71592.73	58550.28	13042.45	1	0	1
3404	177	1000	234	162	31	44556.89	0.00	44556.89	40101.18	4455.71	1	0	1
3405	177	3	1128	210	49	151088.58	151088.58	0.00	120026.07	31062.51	1	1	0
3406	177	4	594	106	30	51431.85	51431.85	0.00	40116.87	11314.98	1	1	0
3407	177	1000	285	124	36	64687.41	0.00	64687.41	50830.54	13856.87	1	0	1
3408	177	2	492	196	7	82566.12	82566.12	0.00	59194.38	23371.74	1	1	0
3409	177	1000	524	252	48	143101.79	0.00	143101.79	102938.49	40163.30	1	0	1
3410	177	3	521	86	48	29901.30	29901.30	0.00	21827.95	8073.35	1	1	0
3411	177	1000	701	236	21	135794.74	0.00	135794.74	106191.64	29603.10	1	0	1
3412	177	1000	384	118	12	64870.57	0.00	64870.57	54740.82	10129.75	1	0	1
3413	177	2	156	20	1	191858.85	191858.85	0.00	153350.59	38508.26	1	1	0
3414	177	2	441	29	3	42129.58	42129.58	0.00	33706.53	8423.05	1	1	0
3415	177	1000	1088	212	44	80390.50	0.00	80390.50	64070.20	16320.30	1	0	1
3416	177	1000	403	212	43	51791.07	0.00	51791.07	41044.55	10746.52	1	0	1
3417	177	4	375	105	13	4773.96	4773.96	0.00	3198.51	1575.45	1	1	0
3418	177	1000	796	63	7	135928.59	0.00	135928.59	95432.16	40496.43	1	0	1
3419	177	1000	550	165	40	73203.93	0.00	73203.93	43922.34	29281.59	1	0	1
3420	177	4	958	70	13	83780.37	83780.37	0.00	59972.35	23808.02	1	1	0
3421	177	1000	1203	36	21	57114.05	0.00	57114.05	47605.58	9508.47	1	0	1
3422	177	1	1000	96	32	56793.14	56793.14	0.00	45612.74	11180.40	1	1	0
3423	177	1000	1084	87	1	42301.98	0.00	42301.98	33713.96	8588.02	1	0	1
3424	177	1000	886	207	4	100469.98	0.00	100469.98	79399.54	21070.44	1	0	1
3425	177	1000	577	210	1	160616.01	0.00	160616.01	116629.60	43986.41	1	0	1
3426	177	4	783	131	39	32225.68	32225.68	0.00	24491.52	7734.16	1	1	0
3427	177	1000	392	141	34	48950.37	0.00	48950.37	31328.22	17622.15	1	0	1
3428	177	1000	297	2	28	132394.23	0.00	132394.23	109926.29	22467.94	1	0	1
3429	177	1000	60	179	50	117127.04	0.00	117127.04	99623.80	17503.24	1	0	1
3430	177	1000	306	37	39	16034.85	0.00	16034.85	12946.74	3088.11	1	0	1
3431	177	1000	842	199	32	20761.74	0.00	20761.74	16562.85	4198.89	1	0	1
3432	177	1000	651	59	45	41641.17	0.00	41641.17	32158.85	9482.32	1	0	1
3433	177	4	943	13	37	125255.25	125255.25	0.00	84261.54	40993.71	1	1	0
3434	177	2	1093	100	43	100023.16	100023.16	0.00	81425.42	18597.74	1	1	0
3435	177	1000	906	192	37	24351.55	0.00	24351.55	16830.93	7520.62	1	0	1
3436	177	3	915	189	2	75348.01	75348.01	0.00	54346.52	21001.49	1	1	0
3437	177	4	976	198	48	168899.84	168899.84	0.00	125077.46	43822.38	1	1	0
3438	177	1000	1208	57	25	80151.92	0.00	80151.92	54517.92	25634.00	1	0	1
3439	177	1000	926	42	39	46990.62	0.00	46990.62	36182.76	10807.86	1	0	1
3440	177	1000	46	157	43	1176.48	0.00	1176.48	894.12	282.36	1	0	1
3441	177	4	630	84	38	151095.08	151095.08	0.00	114850.30	36244.78	1	1	0
3442	177	4	659	116	21	159537.18	159537.18	0.00	128318.33	31218.85	1	1	0
3443	177	4	1166	219	2	125900.93	125900.93	0.00	81978.10	43922.83	1	1	0
3444	177	1000	66	139	3	126631.03	0.00	126631.03	99641.87	26989.16	1	0	1
3445	177	1000	399	77	2	102577.80	0.00	102577.80	76236.60	26341.20	1	0	1
3446	177	1	1186	216	29	200542.29	200542.29	0.00	139646.01	60896.28	1	1	0
3447	177	1	589	8	20	144040.87	144040.87	0.00	108328.50	35712.37	1	1	0
3448	177	1000	1182	18	31	68214.34	0.00	68214.34	47236.67	20977.67	1	0	1
3449	177	1000	313	61	50	107888.29	0.00	107888.29	75526.58	32361.71	1	0	1
3450	177	1	174	16	3	4293.75	4293.75	0.00	3306.20	987.55	1	1	0
3451	177	1000	1016	239	11	115639.82	0.00	115639.82	85561.35	30078.47	1	0	1
3452	177	1000	918	78	40	58282.61	0.00	58282.61	48588.87	9693.74	1	0	1
3453	177	1000	1145	19	38	46647.81	0.00	46647.81	35971.32	10676.49	1	0	1
3454	177	3	1083	143	29	96418.76	96418.76	0.00	75936.40	20482.36	1	1	0
3455	177	1000	99	150	5	22472.16	0.00	22472.16	18876.60	3595.56	1	0	1
3456	177	1	626	171	48	188247.53	188247.53	0.00	129646.24	58601.29	1	1	0
3457	177	1000	740	206	15	59968.59	0.00	59968.59	39997.39	19971.20	1	0	1
3458	177	3	957	190	3	123922.21	123922.21	0.00	97044.49	26877.72	1	1	0
3459	177	1000	25	185	14	56437.69	0.00	56437.69	41102.68	15335.01	1	0	1
3460	177	1000	849	249	33	47921.02	0.00	47921.02	39098.14	8822.88	1	0	1
3461	177	3	596	13	35	132206.54	132206.54	0.00	83171.58	49034.96	1	1	0
3462	177	1000	826	187	23	93239.30	0.00	93239.30	65301.01	27938.29	1	0	1
3463	177	3	913	176	49	125024.56	125024.56	0.00	89414.00	35610.56	1	1	0
3464	177	4	169	92	39	190676.64	190676.64	0.00	136604.09	54072.55	1	1	0
3465	177	1000	1014	38	35	186584.75	0.00	186584.75	133386.91	53197.84	1	0	1
3466	177	1000	1145	194	16	94364.90	0.00	94364.90	62280.80	32084.10	1	0	1
3467	177	1	174	237	50	34158.37	34158.37	0.00	26238.39	7919.98	1	1	0
3468	177	1000	639	158	29	36414.16	0.00	36414.16	32044.48	4369.68	1	0	1
3469	177	1000	1122	74	46	26454.06	0.00	26454.06	22132.85	4321.21	1	0	1
3470	177	1000	416	109	23	62003.70	0.00	62003.70	39682.35	22321.35	1	0	1
3471	177	1000	219	152	18	18184.44	0.00	18184.44	11456.20	6728.24	1	0	1
3472	177	1000	541	121	38	7263.69	0.00	7263.69	5956.23	1307.46	1	0	1
3473	177	1000	292	113	34	38823.72	0.00	38823.72	30670.74	8152.98	1	0	1
3474	177	4	327	50	21	282885.07	282885.07	0.00	191497.91	91387.16	1	1	0
3475	177	4	739	95	24	65960.49	65960.49	0.00	42717.48	23243.01	1	1	0
3476	177	1000	255	232	50	41825.60	0.00	41825.60	25931.90	15893.70	1	0	1
3477	177	4	565	82	36	7873.59	7873.59	0.00	5242.18	2631.41	1	1	0
3478	177	3	1058	253	45	34038.20	34038.20	0.00	21193.62	12844.58	1	1	0
3479	177	1000	1163	33	39	137995.65	0.00	137995.65	113957.56	24038.09	1	0	1
3480	177	1000	829	226	19	58710.00	0.00	58710.00	35226.00	23484.00	1	0	1
3481	177	1000	1045	157	2	36606.00	0.00	36606.00	24925.62	11680.38	1	0	1
3482	177	1000	672	94	38	75444.16	0.00	75444.16	59433.55	16010.61	1	0	1
3483	177	1000	485	250	16	127438.62	0.00	127438.62	96150.28	31288.34	1	0	1
3484	177	1000	302	246	17	88596.27	0.00	88596.27	60963.88	27632.39	1	0	1
3485	177	4	659	36	43	20667.71	20667.71	0.00	16376.35	4291.36	1	1	0
3486	177	3	282	36	27	171186.24	171186.24	0.00	130006.25	41179.99	1	1	0
3487	177	2	1017	38	27	105893.54	105893.54	0.00	79613.54	26280.00	1	1	0
3488	177	1000	565	153	24	46704.17	0.00	46704.17	37102.29	9601.88	1	0	1
3489	177	2	1064	231	27	102810.21	102810.21	0.00	70049.00	32761.21	1	1	0
3490	177	1000	258	149	40	112566.44	0.00	112566.44	95028.16	17538.28	1	0	1
3491	177	3	295	48	14	44596.17	44596.17	0.00	39244.59	5351.58	1	1	0
3492	177	3	187	2	4	115156.51	115156.51	0.00	87300.75	27855.76	1	1	0
3493	177	3	1057	65	6	160892.63	160892.63	0.00	128507.33	32385.30	1	1	0
3494	177	1000	505	59	39	82533.50	0.00	82533.50	57439.08	25094.42	1	0	1
3495	177	1	771	81	33	245518.83	245518.83	0.00	169810.77	75708.06	1	1	0
3496	177	1000	596	36	29	42464.90	0.00	42464.90	37269.74	5195.16	1	0	1
3497	177	2	737	170	41	154184.12	154184.12	0.00	112814.55	41369.57	1	1	0
3498	177	1000	483	29	46	78576.88	0.00	78576.88	58821.15	19755.73	1	0	1
3499	177	2	1194	154	8	7551.88	7551.88	0.00	5059.76	2492.12	1	1	0
3500	177	2	995	208	23	125089.38	125089.38	0.00	82648.43	42440.95	1	1	0
3501	177	1	841	47	36	47107.25	47107.25	0.00	32975.10	14132.15	1	1	0
3502	177	1	726	215	38	174928.12	174928.12	0.00	139356.72	35571.40	1	1	0
3503	177	2	541	72	36	2305.00	2305.00	0.00	1867.05	437.95	1	1	0
3504	177	1000	695	154	24	73659.43	0.00	73659.43	58995.80	14663.63	1	0	1
3505	177	1	957	80	20	3422.72	3422.72	0.00	2259.00	1163.72	1	1	0
3506	177	1000	1060	88	19	151853.00	0.00	151853.00	106802.23	45050.77	1	0	1
3507	177	1000	461	33	12	80723.10	0.00	80723.10	50264.07	30459.03	1	0	1
3508	177	4	491	160	34	98556.79	98556.79	0.00	79108.06	19448.73	1	1	0
3509	177	3	882	90	45	118929.45	118929.45	0.00	86866.71	32062.74	1	1	0
3510	177	1000	10	129	38	11457.90	0.00	11457.90	9739.20	1718.70	1	0	1
3511	177	3	11	247	22	151118.05	151118.05	0.00	121881.38	29236.67	1	1	0
3512	177	1000	575	102	9	52274.25	0.00	52274.25	39213.07	13061.18	1	0	1
3513	177	1000	1096	125	18	83187.76	0.00	83187.76	56440.63	26747.13	1	0	1
3514	177	2	432	146	11	53622.40	53622.40	0.00	39680.60	13941.80	1	1	0
3515	177	3	962	155	24	55116.96	55116.96	0.00	42991.20	12125.76	1	1	0
3516	177	1000	534	159	1	90708.82	0.00	90708.82	55729.63	34979.19	1	0	1
3517	177	2	379	52	6	135703.44	135703.44	0.00	104962.57	30740.87	1	1	0
3518	177	1000	878	217	46	110285.70	0.00	110285.70	78871.56	31414.14	1	0	1
3519	177	1000	833	238	31	28718.16	0.00	28718.16	18954.00	9764.16	1	0	1
3520	177	3	686	116	32	91200.04	91200.04	0.00	70400.33	20799.71	1	1	0
3521	177	1000	837	21	35	36648.80	0.00	36648.80	25287.65	11361.15	1	0	1
3522	177	2	1091	52	29	121752.74	121752.74	0.00	81635.30	40117.44	1	1	0
3523	177	1000	424	147	43	69515.69	0.00	69515.69	52017.40	17498.29	1	0	1
3524	177	3	927	66	46	224843.30	224843.30	0.00	170514.88	54328.42	1	1	0
3525	177	1000	829	100	5	53864.27	0.00	53864.27	40261.65	13602.62	1	0	1
3526	177	4	1162	135	4	10004.58	10004.58	0.00	8303.82	1700.76	1	1	0
3527	177	3	103	23	2	36041.74	36041.74	0.00	29874.33	6167.41	1	1	0
3528	177	2	349	143	38	88019.69	88019.69	0.00	64364.57	23655.12	1	1	0
3529	177	1000	894	210	2	119461.65	0.00	119461.65	91155.36	28306.29	1	0	1
3530	177	4	637	6	8	112036.88	112036.88	0.00	87565.31	24471.57	1	1	0
3531	177	1000	1097	92	20	153190.22	0.00	153190.22	109945.68	43244.54	1	0	1
3532	177	1	267	227	34	101827.37	101827.37	0.00	80324.15	21503.22	1	1	0
3533	177	1000	1144	189	9	215115.87	0.00	215115.87	144910.97	70204.90	1	0	1
3534	177	4	591	64	48	25168.40	25168.40	0.00	22399.88	2768.52	1	1	0
3535	177	1000	550	233	25	77434.91	0.00	77434.91	52108.54	25326.37	1	0	1
3536	177	1000	903	39	49	28586.01	0.00	28586.01	18580.92	10005.09	1	0	1
3537	177	1000	379	231	15	191778.75	0.00	191778.75	144069.78	47708.97	1	0	1
3538	177	1000	918	227	24	72485.64	0.00	72485.64	49465.42	23020.22	1	0	1
3539	177	2	839	20	30	146539.89	146539.89	0.00	108449.53	38090.36	1	1	0
3540	177	1000	706	12	34	42418.02	0.00	42418.02	27768.08	14649.94	1	0	1
3541	177	1000	116	118	28	42089.70	0.00	42089.70	33602.93	8486.77	1	0	1
3542	177	1000	848	249	14	144035.01	0.00	144035.01	103763.11	40271.90	1	0	1
3543	177	1000	942	202	1	56471.34	0.00	56471.34	45971.16	10500.18	1	0	1
3544	177	3	1193	64	32	26598.12	26598.12	0.00	20195.40	6402.72	1	1	0
3545	177	1000	231	90	36	270308.32	0.00	270308.32	196587.54	73720.78	1	0	1
3546	177	1000	297	192	46	25328.18	0.00	25328.18	19487.33	5840.85	1	0	1
3547	177	2	758	71	2	76798.75	76798.75	0.00	55937.61	20861.14	1	1	0
3548	177	1000	8	26	47	26928.30	0.00	26928.30	18580.52	8347.78	1	0	1
3549	177	1000	140	215	8	27890.95	0.00	27890.95	17456.00	10434.95	1	0	1
3550	177	1000	1142	197	13	102063.54	0.00	102063.54	71891.26	30172.28	1	0	1
3551	177	1	347	230	15	62463.52	62463.52	0.00	42226.41	20237.11	1	1	0
3552	177	1	297	206	11	70740.38	70740.38	0.00	52654.97	18085.41	1	1	0
3553	177	1000	447	211	27	153610.40	0.00	153610.40	125786.24	27824.16	1	0	1
3554	177	3	708	103	14	66062.86	66062.86	0.00	52017.28	14045.58	1	1	0
3555	177	1000	20	150	39	179653.62	0.00	179653.62	149310.11	30343.51	1	0	1
3556	177	4	273	56	50	94986.54	94986.54	0.00	75316.04	19670.50	1	1	0
3557	177	1000	1059	140	29	43807.44	0.00	43807.44	34440.58	9366.86	1	0	1
3558	177	3	688	57	49	138956.58	138956.58	0.00	98859.08	40097.50	1	1	0
3559	177	1000	881	97	26	38529.46	0.00	38529.46	27999.55	10529.91	1	0	1
3560	177	3	248	206	28	91832.54	91832.54	0.00	68694.42	23138.12	1	1	0
3561	177	2	1061	81	10	83618.90	83618.90	0.00	62459.10	21159.80	1	1	0
3562	177	2	280	241	7	164930.26	164930.26	0.00	113696.86	51233.40	1	1	0
3563	177	4	740	172	43	79460.40	79460.40	0.00	62252.00	17208.40	1	1	0
3564	177	4	397	248	4	111696.45	111696.45	0.00	90338.50	21357.95	1	1	0
3565	177	1000	894	60	39	162143.47	0.00	162143.47	121654.06	40489.41	1	0	1
3566	177	1000	999	106	3	100627.29	0.00	100627.29	88008.12	12619.17	1	0	1
3567	177	4	963	233	17	33281.62	33281.62	0.00	22796.40	10485.22	1	1	0
3568	177	1000	91	224	38	47510.66	0.00	47510.66	34371.66	13139.00	1	0	1
3569	177	1000	363	226	14	164161.88	0.00	164161.88	110538.02	53623.86	1	0	1
3570	177	1000	984	90	1	41264.93	0.00	41264.93	30106.26	11158.67	1	0	1
3571	177	1	735	138	7	2573.98	2573.98	0.00	2187.88	386.10	1	1	0
3572	177	1000	525	144	44	51816.10	0.00	51816.10	43570.00	8246.10	1	0	1
3573	177	1000	1099	6	45	112476.31	0.00	112476.31	87470.66	25005.65	1	0	1
3574	177	1000	971	217	9	72278.76	0.00	72278.76	49909.78	22368.98	1	0	1
3575	177	1000	1018	54	46	91294.10	0.00	91294.10	73814.28	17479.82	1	0	1
3576	177	1000	59	81	46	9541.52	0.00	9541.52	6106.58	3434.94	1	0	1
3577	177	1000	768	158	30	99740.96	0.00	99740.96	74306.00	25434.96	1	0	1
3578	177	1000	1042	212	35	42019.45	0.00	42019.45	35695.95	6323.50	1	0	1
3579	177	1000	549	136	46	21755.44	0.00	21755.44	14722.06	7033.38	1	0	1
3580	177	4	364	114	39	161017.48	161017.48	0.00	119033.58	41983.90	1	1	0
3581	177	1000	104	87	35	8318.04	0.00	8318.04	7153.50	1164.54	1	0	1
3582	177	1000	297	111	37	31154.02	0.00	31154.02	24660.09	6493.93	1	0	1
3583	177	2	1157	116	27	162805.50	162805.50	0.00	122521.96	40283.54	1	1	0
3584	177	1	861	86	27	39342.46	39342.46	0.00	26374.17	12968.29	1	1	0
3585	177	1000	67	71	37	19690.62	0.00	19690.62	13389.62	6301.00	1	0	1
3586	177	1000	388	225	8	48250.03	0.00	48250.03	34522.11	13727.92	1	0	1
3587	177	3	275	98	29	51010.82	51010.82	0.00	38334.77	12676.05	1	1	0
3588	177	2	979	206	8	71625.24	71625.24	0.00	49452.86	22172.38	1	1	0
3589	177	1000	589	241	5	147294.45	0.00	147294.45	114995.14	32299.31	1	0	1
3590	177	1	805	53	38	80257.68	80257.68	0.00	53029.50	27228.18	1	1	0
3591	177	1000	859	48	42	60721.09	0.00	60721.09	42992.63	17728.46	1	0	1
3592	177	1	373	11	15	19572.08	19572.08	0.00	14287.60	5284.48	1	1	0
3593	177	4	378	154	30	194430.76	194430.76	0.00	126588.77	67841.99	1	1	0
3594	177	1000	967	64	43	136711.85	0.00	136711.85	95592.68	41119.17	1	0	1
3595	177	1000	677	155	25	11973.90	0.00	11973.90	7902.78	4071.12	1	0	1
3596	177	4	427	75	37	39798.68	39798.68	0.00	28120.87	11677.81	1	1	0
3597	177	1000	869	103	4	90730.66	0.00	90730.66	63382.80	27347.86	1	0	1
3598	177	1000	832	106	23	163285.79	0.00	163285.79	112823.97	50461.82	1	0	1
3599	177	1	533	21	33	81357.30	81357.30	0.00	67526.55	13830.75	1	1	0
3600	177	1000	1024	209	6	184586.42	0.00	184586.42	134604.82	49981.60	1	0	1
3601	177	4	489	247	50	76564.89	76564.89	0.00	48299.35	28265.54	1	1	0
3602	177	1000	236	69	7	110567.96	0.00	110567.96	80083.16	30484.80	1	0	1
3603	177	3	847	61	12	44427.75	44427.75	0.00	31527.39	12900.36	1	1	0
3604	177	1	1205	32	1	78768.27	78768.27	0.00	60464.33	18303.94	1	1	0
3605	177	1000	727	94	42	58561.80	0.00	58561.80	45678.18	12883.62	1	0	1
3606	177	4	383	19	40	70691.96	70691.96	0.00	48638.82	22053.14	1	1	0
3607	177	1000	1044	169	13	104949.82	0.00	104949.82	69244.98	35704.84	1	0	1
3608	177	1000	613	94	42	4093.36	0.00	4093.36	2496.96	1596.40	1	0	1
3609	177	2	244	52	6	159295.65	159295.65	0.00	111098.06	48197.59	1	1	0
3610	177	3	687	89	47	109828.89	109828.89	0.00	93071.25	16757.64	1	1	0
3611	177	3	727	17	33	84635.66	84635.66	0.00	72365.95	12269.71	1	1	0
3612	177	4	155	210	26	33748.75	33748.75	0.00	22611.68	11137.07	1	1	0
3613	177	4	865	186	37	123680.16	123680.16	0.00	94179.54	29500.62	1	1	0
3614	177	1	596	178	21	83088.36	83088.36	0.00	62360.70	20727.66	1	1	0
3615	177	4	382	176	21	171329.11	171329.11	0.00	143411.82	27917.29	1	1	0
3616	177	1000	760	54	47	1460.83	0.00	1460.83	1314.74	146.09	1	0	1
3617	177	1000	519	33	37	93765.93	0.00	93765.93	65772.51	27993.42	1	0	1
3618	177	4	1178	228	17	5374.54	5374.54	0.00	4514.62	859.92	1	1	0
3619	177	4	413	89	30	63099.30	63099.30	0.00	56063.51	7035.79	1	1	0
3620	177	1000	432	235	39	227343.83	0.00	227343.83	152496.64	74847.19	1	0	1
3621	177	1	626	41	15	28349.46	28349.46	0.00	22770.73	5578.73	1	1	0
3622	177	1000	769	220	24	85328.19	0.00	85328.19	64849.41	20478.78	1	0	1
3623	177	4	945	218	47	276964.22	276964.22	0.00	214881.65	62082.57	1	1	0
3624	177	1000	770	193	6	64411.41	0.00	64411.41	48952.68	15458.73	1	0	1
3625	177	3	194	16	32	42422.46	42422.46	0.00	30968.40	11454.06	1	1	0
3626	177	4	915	58	42	41675.94	41675.94	0.00	31989.30	9686.64	1	1	0
3627	177	1000	722	58	38	25670.68	0.00	25670.68	22590.19	3080.49	1	0	1
3628	177	3	675	79	7	242.40	242.40	0.00	206.05	36.35	1	1	0
3629	177	1000	41	201	38	79188.42	0.00	79188.42	69237.19	9951.23	1	0	1
3630	177	4	993	229	11	57059.11	57059.11	0.00	47249.90	9809.21	1	1	0
3631	177	1000	355	245	6	156008.26	0.00	156008.26	125899.92	30108.34	1	0	1
3632	177	1	329	130	9	180067.95	180067.95	0.00	138363.51	41704.44	1	1	0
3633	177	1	1009	177	33	15173.29	15173.29	0.00	11847.97	3325.32	1	1	0
3634	177	1000	203	214	12	5033.13	0.00	5033.13	3321.87	1711.26	1	0	1
3635	177	2	211	51	1	74242.63	74242.63	0.00	45663.55	28579.08	1	1	0
3636	177	1000	302	185	34	110126.31	0.00	110126.31	87005.38	23120.93	1	0	1
3637	177	1000	910	246	30	66991.00	0.00	66991.00	51583.10	15407.90	1	0	1
3638	177	1000	220	89	16	81584.55	0.00	81584.55	70162.74	11421.81	1	0	1
3639	177	1000	1001	5	12	3359.12	0.00	3359.12	2720.88	638.24	1	0	1
3640	177	1000	1107	230	1	62794.60	0.00	62794.60	40467.56	22327.04	1	0	1
3641	177	3	315	207	4	76796.15	76796.15	0.00	46812.13	29984.02	1	1	0
3642	177	1000	332	72	43	74943.22	0.00	74943.22	57275.30	17667.92	1	0	1
3643	177	2	30	187	39	66474.43	66474.43	0.00	45400.24	21074.19	1	1	0
3644	177	2	930	205	30	15347.60	15347.60	0.00	13659.36	1688.24	1	1	0
3645	177	1	559	172	7	22639.56	22639.56	0.00	18776.91	3862.65	1	1	0
3646	177	4	627	241	48	86356.00	86356.00	0.00	69084.80	17271.20	1	1	0
3647	177	2	659	145	15	83129.25	83129.25	0.00	63909.31	19219.94	1	1	0
3648	177	1000	294	219	35	29453.97	0.00	29453.97	23857.71	5596.26	1	0	1
3649	177	4	823	139	45	8340.18	8340.18	0.00	5892.56	2447.62	1	1	0
3650	177	1000	604	225	37	91386.64	0.00	91386.64	74346.51	17040.13	1	0	1
3651	177	3	1212	28	49	236042.17	236042.17	0.00	182106.97	53935.20	1	1	0
3652	177	1000	145	220	3	51519.55	0.00	51519.55	39227.63	12291.92	1	0	1
3653	177	1	17	42	16	132540.78	132540.78	0.00	89822.08	42718.70	1	1	0
3654	177	2	294	221	13	159595.66	159595.66	0.00	111100.71	48494.95	1	1	0
3655	177	1	399	197	33	76483.97	76483.97	0.00	63013.31	13470.66	1	1	0
3656	177	2	933	208	30	105315.39	105315.39	0.00	75542.42	29772.97	1	1	0
3657	177	2	695	171	3	138718.45	138718.45	0.00	112819.80	25898.65	1	1	0
3658	177	2	1061	235	36	67224.46	67224.46	0.00	48559.85	18664.61	1	1	0
3659	177	3	236	243	36	1566.72	1566.72	0.00	1018.40	548.32	1	1	0
3660	177	1000	429	157	2	172980.92	0.00	172980.92	133748.82	39232.10	1	0	1
3661	177	3	245	130	7	101623.37	101623.37	0.00	81443.85	20179.52	1	1	0
3662	177	4	1157	128	17	17277.08	17277.08	0.00	15549.38	1727.70	1	1	0
3663	177	1000	1158	86	42	78306.64	0.00	78306.64	63028.59	15278.05	1	0	1
3664	177	1000	416	118	28	129379.04	0.00	129379.04	90055.96	39323.08	1	0	1
3665	177	1	1055	154	4	146277.75	146277.75	0.00	111012.61	35265.14	1	1	0
3666	177	1	986	31	16	78718.81	78718.81	0.00	62152.12	16566.69	1	1	0
3667	177	4	1150	153	37	125804.15	125804.15	0.00	88808.66	36995.49	1	1	0
3668	177	1000	655	120	16	61647.84	0.00	61647.84	47409.08	14238.76	1	0	1
3669	177	4	424	133	7	86001.69	86001.69	0.00	55490.64	30511.05	1	1	0
3670	177	1000	939	225	34	124820.15	0.00	124820.15	88774.85	36045.30	1	0	1
3671	177	1000	247	223	14	26982.61	0.00	26982.61	21532.01	5450.60	1	0	1
3672	177	3	348	22	7	85885.80	85885.80	0.00	71672.76	14213.04	1	1	0
3673	177	1	31	96	18	40439.28	40439.28	0.00	33843.80	6595.48	1	1	0
3674	177	1000	688	61	47	52230.59	0.00	52230.59	33190.25	19040.34	1	0	1
3675	177	1000	885	173	49	33425.08	0.00	33425.08	22865.13	10559.95	1	0	1
3676	177	1000	616	170	12	153246.08	0.00	153246.08	101586.27	51659.81	1	0	1
3677	177	3	368	149	8	4673.08	4673.08	0.00	3411.34	1261.74	1	1	0
3678	177	4	220	31	35	117729.90	117729.90	0.00	86833.20	30896.70	1	1	0
3679	177	1000	980	207	21	156283.50	0.00	156283.50	117067.74	39215.76	1	0	1
3680	177	1000	147	145	48	231639.00	0.00	231639.00	164671.88	66967.12	1	0	1
3681	177	2	670	2	6	101524.53	101524.53	0.00	66794.31	34730.22	1	1	0
3682	177	2	537	80	43	72951.83	72951.83	0.00	57283.30	15668.53	1	1	0
3683	177	1000	842	187	28	109834.63	0.00	109834.63	85636.21	24198.42	1	0	1
3684	177	1000	218	195	38	16089.84	0.00	16089.84	9814.77	6275.07	1	0	1
3685	177	1000	198	232	6	79888.60	0.00	79888.60	51956.22	27932.38	1	0	1
3686	177	1000	156	97	31	50531.52	0.00	50531.52	38919.78	11611.74	1	0	1
3687	177	1000	196	186	9	133196.02	0.00	133196.02	91959.01	41237.01	1	0	1
3688	177	2	1036	31	26	126845.05	126845.05	0.00	89729.46	37115.59	1	1	0
3689	177	1000	434	78	47	198607.08	0.00	198607.08	141884.09	56722.99	1	0	1
3690	177	1000	121	200	33	112291.41	0.00	112291.41	89767.16	22524.25	1	0	1
3691	177	4	1120	222	8	24527.76	24527.76	0.00	19867.50	4660.26	1	1	0
3692	177	1000	801	21	11	556.60	0.00	556.60	467.50	89.10	1	0	1
3693	177	1000	670	29	27	86571.00	0.00	86571.00	63390.36	23180.64	1	0	1
3694	177	1	539	14	23	83731.16	83731.16	0.00	59330.92	24400.24	1	1	0
3695	177	3	1015	215	32	92428.83	92428.83	0.00	76603.67	15825.16	1	1	0
3696	177	1000	134	117	7	188316.92	0.00	188316.92	134508.29	53808.63	1	0	1
3697	177	1000	89	21	15	12751.63	0.00	12751.63	9616.56	3135.07	1	0	1
3698	177	2	1120	197	38	111148.06	111148.06	0.00	78180.10	32967.96	1	1	0
3699	177	3	20	189	47	2393.96	2393.96	0.00	1580.02	813.94	1	1	0
3700	177	4	1122	78	18	165790.44	165790.44	0.00	107249.50	58540.94	1	1	0
3701	177	1	17	14	23	15615.85	15615.85	0.00	11405.01	4210.84	1	1	0
3702	177	1	254	13	2	545.30	545.30	0.00	354.45	190.85	1	1	0
3703	177	1000	781	13	9	89262.12	0.00	89262.12	62153.12	27109.00	1	0	1
3704	177	1000	99	41	15	145049.17	0.00	145049.17	108358.05	36691.12	1	0	1
3705	177	1000	755	146	6	67893.41	0.00	67893.41	48371.15	19522.26	1	0	1
3706	177	3	441	34	12	33008.88	33008.88	0.00	27397.38	5611.50	1	1	0
3707	177	1000	372	136	44	110295.48	0.00	110295.48	84026.35	26269.13	1	0	1
3708	177	2	229	248	42	202506.31	202506.31	0.00	152697.85	49808.46	1	1	0
3709	177	1000	2	83	25	4753.02	0.00	4753.02	3707.36	1045.66	1	0	1
3710	177	4	174	174	3	25468.82	25468.82	0.00	19705.62	5763.20	1	1	0
3711	177	1000	227	241	30	2664.61	0.00	2664.61	1821.96	842.65	1	0	1
3712	177	2	224	98	5	56284.88	56284.88	0.00	41303.55	14981.33	1	1	0
3713	177	2	1117	134	29	123396.87	123396.87	0.00	91583.84	31813.03	1	1	0
3714	177	1	306	187	35	64171.95	64171.95	0.00	53272.54	10899.41	1	1	0
3715	177	1000	981	21	31	84392.47	0.00	84392.47	60743.72	23648.75	1	0	1
3716	177	1000	202	45	7	133284.96	0.00	133284.96	105630.92	27654.04	1	0	1
3717	177	1000	709	83	17	16202.16	0.00	16202.16	11017.44	5184.72	1	0	1
3718	177	1000	894	14	4	21093.34	0.00	21093.34	16873.48	4219.86	1	0	1
3719	177	1000	141	204	1	130879.04	0.00	130879.04	97697.79	33181.25	1	0	1
3720	177	1000	335	152	24	64682.60	0.00	64682.60	50184.30	14498.30	1	0	1
3721	177	1000	627	102	2	135635.33	0.00	135635.33	94038.44	41596.89	1	0	1
3722	177	4	458	21	28	71002.22	71002.22	0.00	54641.52	16360.70	1	1	0
3723	177	1000	233	216	10	172313.85	0.00	172313.85	123593.79	48720.06	1	0	1
3724	177	1	769	190	31	116262.28	116262.28	0.00	89374.04	26888.24	1	1	0
3725	177	2	613	190	49	82956.46	82956.46	0.00	57423.12	25533.34	1	1	0
3726	177	1000	397	12	3	133868.67	0.00	133868.67	99261.95	34606.72	1	0	1
3727	177	2	73	187	44	129018.58	129018.58	0.00	107190.84	21827.74	1	1	0
3728	177	4	378	153	49	96314.56	96314.56	0.00	75324.86	20989.70	1	1	0
3729	177	1000	1013	78	38	57159.21	0.00	57159.21	45582.51	11576.70	1	0	1
3730	177	1000	184	210	9	47205.64	0.00	47205.64	31739.80	15465.84	1	0	1
3731	177	1000	1021	118	15	124598.27	0.00	124598.27	101923.30	22674.97	1	0	1
3732	177	4	411	157	13	2834.50	2834.50	0.00	2352.65	481.85	1	1	0
3733	177	1	743	235	44	54018.16	54018.16	0.00	32410.91	21607.25	1	1	0
3734	177	4	801	177	27	69662.90	69662.90	0.00	50853.90	18809.00	1	1	0
3735	177	4	1214	237	48	93729.44	93729.44	0.00	62740.50	30988.94	1	1	0
3736	177	1000	591	149	14	118389.45	0.00	118389.45	87971.01	30418.44	1	0	1
3737	177	1000	822	145	8	78949.40	0.00	78949.40	63672.37	15277.03	1	0	1
3738	177	3	53	187	18	124599.89	124599.89	0.00	96747.58	27852.31	1	1	0
3739	177	1000	156	31	41	19928.55	0.00	19928.55	14569.72	5358.83	1	0	1
3740	177	1000	838	73	2	120522.32	0.00	120522.32	84557.22	35965.10	1	0	1
3741	177	1	475	247	41	73009.35	73009.35	0.00	59698.55	13310.80	1	1	0
3742	177	3	707	126	3	153585.45	153585.45	0.00	121195.66	32389.79	1	1	0
3743	177	1000	68	225	21	66346.32	0.00	66346.32	59711.68	6634.64	1	0	1
3744	177	1000	810	243	14	41332.99	0.00	41332.99	29417.26	11915.73	1	0	1
3745	177	1000	419	155	22	80576.28	0.00	80576.28	65186.87	15389.41	1	0	1
3746	177	4	59	23	12	60324.70	60324.70	0.00	47121.14	13203.56	1	1	0
3747	177	3	726	105	8	14939.92	14939.92	0.00	9806.60	5133.32	1	1	0
3748	177	1000	1148	146	35	86973.20	0.00	86973.20	69936.11	17037.09	1	0	1
3749	177	3	1142	112	14	56528.13	56528.13	0.00	49279.31	7248.82	1	1	0
3750	177	1000	114	243	34	42912.68	0.00	42912.68	32834.88	10077.80	1	0	1
3751	177	4	518	96	34	31010.76	31010.76	0.00	22327.76	8683.00	1	1	0
3752	177	1000	629	44	32	109965.26	0.00	109965.26	87115.05	22850.21	1	0	1
3753	177	1000	375	213	45	139633.10	0.00	139633.10	105377.21	34255.89	1	0	1
3754	177	1000	915	209	34	55172.32	0.00	55172.32	40262.72	14909.60	1	0	1
3755	177	1000	7	126	45	77036.30	0.00	77036.30	51113.80	25922.50	1	0	1
3756	177	1	867	210	39	103816.75	103816.75	0.00	65283.52	38533.23	1	1	0
3757	177	4	1144	226	31	111750.33	111750.33	0.00	90312.30	21438.03	1	1	0
3758	177	3	682	137	32	109472.19	109472.19	0.00	88860.19	20612.00	1	1	0
3759	177	1000	558	28	17	143707.86	0.00	143707.86	111508.20	32199.66	1	0	1
3760	177	4	296	61	40	133445.20	133445.20	0.00	88401.94	45043.26	1	1	0
3761	177	1000	1023	153	38	8930.09	0.00	8930.09	6208.18	2721.91	1	0	1
3762	177	1000	122	24	4	129125.74	0.00	129125.74	97997.07	31128.67	1	0	1
3763	177	1	1205	179	3	87916.90	87916.90	0.00	60662.70	27254.20	1	1	0
3764	177	3	438	78	32	39041.20	39041.20	0.00	30452.12	8589.08	1	1	0
3765	177	1000	1099	85	38	33624.52	0.00	33624.52	24882.16	8742.36	1	0	1
3766	177	1000	283	73	6	74848.12	0.00	74848.12	62751.63	12096.49	1	0	1
3767	177	1000	994	108	4	52678.32	0.00	52678.32	36874.80	15803.52	1	0	1
3768	177	1000	41	42	7	62032.54	0.00	62032.54	46245.02	15787.52	1	0	1
3769	177	1000	253	84	17	119007.20	0.00	119007.20	96875.69	22131.51	1	0	1
3770	177	1000	139	59	42	83530.59	0.00	83530.59	57183.13	26347.46	1	0	1
3771	177	2	610	12	49	15538.02	15538.02	0.00	10540.02	4998.00	1	1	0
3772	177	1	105	236	36	109953.17	109953.17	0.00	80927.15	29026.02	1	1	0
3773	177	1000	275	235	9	241728.11	0.00	241728.11	188088.58	53639.53	1	0	1
3774	177	1000	264	126	28	135242.39	0.00	135242.39	109451.74	25790.65	1	0	1
3775	177	3	638	117	42	45654.22	45654.22	0.00	35214.91	10439.31	1	1	0
3776	177	1000	913	103	34	41519.30	0.00	41519.30	29893.90	11625.40	1	0	1
3777	177	1	654	188	35	117080.07	117080.07	0.00	77635.34	39444.73	1	1	0
3778	177	1000	124	165	11	117645.68	0.00	117645.68	92298.25	25347.43	1	0	1
3779	177	1000	256	236	8	40879.60	0.00	40879.60	33112.50	7767.10	1	0	1
3780	177	4	1170	107	6	80003.24	80003.24	0.00	61944.17	18059.07	1	1	0
3781	177	2	212	177	38	34197.40	34197.40	0.00	25648.00	8549.40	1	1	0
3782	177	1	469	180	5	83911.76	83911.76	0.00	71033.72	12878.04	1	1	0
3783	177	1000	517	35	24	143476.00	0.00	143476.00	100334.12	43141.88	1	0	1
3784	177	4	1158	11	23	5116.24	5116.24	0.00	3069.76	2046.48	1	1	0
3785	177	2	512	253	36	8069.80	8069.80	0.00	4922.56	3147.24	1	1	0
3786	177	1000	652	204	32	47805.04	0.00	47805.04	38722.08	9082.96	1	0	1
3787	177	1000	1056	114	22	30401.69	0.00	30401.69	18886.23	11515.46	1	0	1
3788	177	2	836	218	6	121974.34	121974.34	0.00	79766.40	42207.94	1	1	0
3789	177	1	1161	188	15	58654.20	58654.20	0.00	49856.10	8798.10	1	1	0
3790	177	1	735	35	46	81528.20	81528.20	0.00	59795.18	21733.02	1	1	0
3791	177	2	874	77	4	46252.93	46252.93	0.00	33103.06	13149.87	1	1	0
3792	177	1	519	23	15	12584.20	12584.20	0.00	11199.94	1384.26	1	1	0
3793	177	1000	406	249	43	66831.01	0.00	66831.01	46585.61	20245.40	1	0	1
3794	177	2	1047	245	35	81380.68	81380.68	0.00	62615.69	18764.99	1	1	0
3795	177	1000	1164	46	50	40775.80	0.00	40775.80	25300.72	15475.08	1	0	1
3796	177	3	712	75	33	149398.38	149398.38	0.00	117574.49	31823.89	1	1	0
3797	177	4	943	50	18	76626.78	76626.78	0.00	68145.16	8481.62	1	1	0
3798	177	1000	64	183	14	95564.91	0.00	95564.91	82899.93	12664.98	1	0	1
3799	177	1000	794	106	6	100807.23	0.00	100807.23	61033.86	39773.37	1	0	1
3800	177	1	1111	112	30	143110.53	143110.53	0.00	110700.12	32410.41	1	1	0
3801	177	1	848	8	21	134063.80	134063.80	0.00	90419.54	43644.26	1	1	0
3802	177	1000	593	178	10	29148.84	0.00	29148.84	18072.30	11076.54	1	0	1
3803	177	1000	450	110	10	122903.53	0.00	122903.53	102146.41	20757.12	1	0	1
3804	177	1000	223	228	34	78279.78	0.00	78279.78	66650.42	11629.36	1	0	1
3805	177	1	795	46	37	82796.46	82796.46	0.00	60879.42	21917.04	1	1	0
3806	177	2	283	224	33	20578.86	20578.86	0.00	14929.38	5649.48	1	1	0
3807	177	1000	262	40	14	53053.26	0.00	53053.26	38579.50	14473.76	1	0	1
3808	177	1000	886	83	37	106522.92	0.00	106522.92	81158.29	25364.63	1	0	1
3809	177	4	906	155	38	22458.10	22458.10	0.00	16394.40	6063.70	1	1	0
3810	177	3	853	156	33	105717.37	105717.37	0.00	80678.21	25039.16	1	1	0
3811	177	3	474	199	29	21897.45	21897.45	0.00	14649.96	7247.49	1	1	0
3812	177	1000	635	221	47	121078.61	0.00	121078.61	91215.70	29862.91	1	0	1
3813	177	1000	1019	21	15	98848.90	0.00	98848.90	68790.05	30058.85	1	0	1
3814	177	1000	1177	153	11	138167.57	0.00	138167.57	101121.71	37045.86	1	0	1
3815	177	1000	829	52	45	21511.45	0.00	21511.45	16172.70	5338.75	1	0	1
3816	177	1000	777	95	29	46039.23	0.00	46039.23	36215.79	9823.44	1	0	1
3817	177	1	139	86	44	61265.94	61265.94	0.00	47739.44	13526.50	1	1	0
3818	177	2	624	187	5	79769.50	79769.50	0.00	57959.97	21809.53	1	1	0
3819	177	1000	794	183	2	71145.87	0.00	71145.87	60642.83	10503.04	1	0	1
3820	177	3	92	247	10	140065.63	140065.63	0.00	109002.22	31063.41	1	1	0
3821	177	1000	644	123	42	52262.77	0.00	52262.77	45991.26	6271.51	1	0	1
3822	177	4	1001	30	36	34628.15	34628.15	0.00	23794.38	10833.77	1	1	0
3823	177	1	297	217	30	200214.10	200214.10	0.00	130819.00	69395.10	1	1	0
3824	177	4	496	33	9	59262.71	59262.71	0.00	49343.66	9919.05	1	1	0
3825	177	1000	633	57	1	132290.06	0.00	132290.06	110739.07	21550.99	1	0	1
3826	177	1000	1204	149	31	114854.25	0.00	114854.25	83432.39	31421.86	1	0	1
3827	177	1000	557	118	48	123497.65	0.00	123497.65	91324.65	32173.00	1	0	1
3828	177	1000	335	171	13	33734.68	0.00	33734.68	26583.24	7151.44	1	0	1
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

SELECT pg_catalog.setval('public.fact_production_id_seq', 11156, true);


--
-- Name: fact_sales_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: thangquang
--

SELECT pg_catalog.setval('public.fact_sales_order_id_seq', 3828, true);


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

