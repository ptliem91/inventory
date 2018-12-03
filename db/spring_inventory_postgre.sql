--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

-- Started on 2018-12-03 16:24:38

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12387)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2195 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 48188)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    code character varying(3) NOT NULL,
    name character varying(45) NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 48281)
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_id_seq OWNER TO postgres;

--
-- TOC entry 2196 (class 0 OID 0)
-- Dependencies: 195
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- TOC entry 194 (class 1259 OID 48270)
-- Name: city_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_seq OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 48197)
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id bigint NOT NULL,
    name character varying(45) NOT NULL
);


ALTER TABLE public.country OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 48202)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    cid bigint NOT NULL,
    cname character varying(45) NOT NULL,
    phone character varying(11) NOT NULL,
    city bigint
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 48207)
-- Name: orderdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderdetails (
    odid bigint NOT NULL,
    oid bigint NOT NULL,
    pid bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    qty bigint NOT NULL
);


ALTER TABLE public.orderdetails OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 48212)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    oid bigint NOT NULL,
    cid bigint NOT NULL,
    total numeric(10,2) NOT NULL,
    ordertype character varying(45) NOT NULL,
    orderdate date NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 48217)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    pid bigint NOT NULL,
    pname character varying(45) NOT NULL,
    price numeric(10,2) NOT NULL,
    qty bigint NOT NULL,
    price_sale numeric(10,0),
    buy_date date,
    create_date timestamp with time zone,
    update_date timestamp with time zone
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 48222)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id bigint NOT NULL,
    role_name character varying(30) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 48234)
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 48229)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    userid bigint NOT NULL,
    username character varying(45) NOT NULL,
    email character varying(45) NOT NULL,
    password character varying(45) NOT NULL,
    encryted_password character varying(128) NOT NULL,
    enabled bit(1) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2035 (class 2604 OID 48283)
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- TOC entry 2177 (class 0 OID 48188)
-- Dependencies: 185
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (code, name, id) FROM stdin;
123	111	2
\.


--
-- TOC entry 2197 (class 0 OID 0)
-- Dependencies: 195
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_id_seq', 4, true);


--
-- TOC entry 2198 (class 0 OID 0)
-- Dependencies: 194
-- Name: city_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_seq', 1, false);


--
-- TOC entry 2178 (class 0 OID 48197)
-- Dependencies: 186
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name) FROM stdin;
\.


--
-- TOC entry 2179 (class 0 OID 48202)
-- Dependencies: 187
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (cid, cname, phone, city) FROM stdin;
1	zubayer	01515634889	\N
2	rasel	01914008411	\N
3	uzzol	01670813134	\N
4	sharmin	01715491885	\N
6	bithi	01864203231	\N
8	akram	01515634889	\N
9	liem	1234	\N
10	pt111	1234	\N
\.


--
-- TOC entry 2180 (class 0 OID 48207)
-- Dependencies: 188
-- Data for Name: orderdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderdetails (odid, oid, pid, price, qty) FROM stdin;
1	1	1	500.00	1
2	0	0	0.00	0
3	2	2	700.00	10
4	1	4	700.00	2
5	1	1	500.00	1
6	1	1	500.00	2
7	2	8	1600.00	10
8	3	1	500.00	10
9	3	1	500.00	10
10	4	1	500.00	10
11	5	9	300.00	10
12	6	9	300.00	10
13	7	9	300.00	10
14	7	8	1600.00	10
15	8	1	500.00	200
16	9	1	500.00	1
17	9	4	700.00	2
18	10	1	500.00	1
19	11	1	500.00	2
20	12	1	500.00	6
21	13	1	500.00	1
22	13	1	500.00	11
23	14	1	500.00	18800
24	14	1	500.00	9
25	16	1	500.00	12
26	17	1	500.00	88
27	18	1	500.00	0
28	19	1	500.00	1
29	20	1	500.00	1
30	21	1	500.00	2
31	22	1	500.00	2
32	23	1	500.00	1
33	24	1	500.00	1
34	25	1	500.00	1
35	26	10	5500.00	1
36	26	9	300.00	1
37	27	4	700.00	2
38	27	1	500.00	1
39	28	5	15000.00	1
40	28	1	500.00	1
41	29	7	76000.00	1
42	29	1	500.00	4
43	29	8	1600.00	1
44	30	1	500.00	5
45	31	1	500.00	2
46	32	1	500.00	1
47	32	1	500.00	1
48	34	1	500.00	1
\.


--
-- TOC entry 2181 (class 0 OID 48212)
-- Dependencies: 189
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (oid, cid, total, ordertype, orderdate) FROM stdin;
1	1	1000.00	sell	2017-09-19
2	6	166000.00	sell	2017-09-01
3	1	5000.00	sell	2017-09-21
4	1	5000.00	sell	2017-09-19
5	2	3000.00	sell	2017-09-30
6	4	19000.00	sell	2017-09-20
7	3	19000.00	sell	2017-09-01
8	1	100000.00	purchase	2017-09-27
9	1	1900.00	sell	2017-09-01
10	1	500.00	sell	2017-09-01
11	1	1000.00	sell	2017-09-01
12	2	3000.00	sell	2017-09-19
13	1	5500.00	purchase	2017-09-19
14	1	9400000.00	sell	2017-09-19
15	1	4500.00	purchase	2017-09-19
16	1	6000.00	purchase	2017-09-19
17	1	44000.00	purchase	2017-09-19
18	0	0.00	sell	2017-09-20
19	0	500.00	sell	2017-09-20
20	1	500.00	sell	2017-09-20
21	1	1000.00	sell	2017-09-20
22	2	1000.00	sell	2017-09-20
23	1	500.00	sell	2017-09-20
24	1	500.00	sell	2017-09-20
25	1	500.00	sell	2017-09-20
26	7	5800.00	sell	2017-09-15
27	1	1900.00	sell	2017-09-22
28	1	15500.00	sell	2017-09-24
29	1	79600.00	sell	2017-09-30
30	2	6500.00	sell	2017-10-11
31	1	1000.00	sell	2018-11-19
32	1	500.00	sell	2018-11-22
33	1	500.00	sell	2018-11-22
34	1	500.00	sell	2018-11-22
\.


--
-- TOC entry 2182 (class 0 OID 48217)
-- Dependencies: 190
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (pid, pname, price, qty, price_sale, buy_date, create_date, update_date) FROM stdin;
7	laptop	76000.00	79	50	2018-01-01	2018-01-01 00:00:00+07	2018-01-01 00:00:00+07
8	bag	1600.00	189	50	2018-01-01	2018-01-01 00:00:00+07	2018-01-01 00:00:00+07
9	mouse	300.00	119	50	2018-01-01	2018-01-01 00:00:00+07	2018-01-01 00:00:00+07
10	hdd	5500.00	119	50	2018-01-01	2018-01-01 00:00:00+07	2018-01-01 00:00:00+07
11	printer	5000.00	100	50	2018-01-01	2018-01-01 00:00:00+07	2018-01-01 00:00:00+07
12	AAA12	123.00	123	50	2018-01-01	2018-01-01 00:00:00+07	2018-01-01 00:00:00+07
5	mobile	15000.00	49	50	2018-01-01	2018-01-01 00:00:00+07	2018-01-01 00:00:00+07
1	shirt	500.00	48	50	2018-01-01	2018-01-01 00:00:00+07	2018-01-01 00:00:00+07
6	sunglass	4000.00	39	0	\N	\N	2018-12-03 14:31:54.108+07
\.


--
-- TOC entry 2183 (class 0 OID 48222)
-- Dependencies: 191
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, role_name) FROM stdin;
1	ROLE_ADMIN
2	ROLE_USER
\.


--
-- TOC entry 2185 (class 0 OID 48234)
-- Dependencies: 193
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role (id, user_id, role_id) FROM stdin;
1	1	1
2	1	2
3	2	2
\.


--
-- TOC entry 2184 (class 0 OID 48229)
-- Dependencies: 192
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, username, email, password, encryted_password, enabled) FROM stdin;
1	admin	admin@gmail.com	12345	$2a$10$L2JosoBYgoAkuvscp5WSCuLGReaEyFnNMGgQWlj0HidjuPwkifbi2	1
2	liempt	ptliem91@gmail.com	12345	$2a$10$L2JosoBYgoAkuvscp5WSCuLGReaEyFnNMGgQWlj0HidjuPwkifbi2	1
\.


--
-- TOC entry 2037 (class 2606 OID 48194)
-- Name: city city_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_code_key UNIQUE (code);


--
-- TOC entry 2039 (class 2606 OID 48196)
-- Name: city city_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_name_key UNIQUE (name);


--
-- TOC entry 2041 (class 2606 OID 48290)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 2043 (class 2606 OID 48201)
-- Name: country p_country; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT p_country PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 48206)
-- Name: customer p_customer; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT p_customer PRIMARY KEY (cid);


--
-- TOC entry 2047 (class 2606 OID 48211)
-- Name: orderdetails p_orderdetails; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT p_orderdetails PRIMARY KEY (odid);


--
-- TOC entry 2049 (class 2606 OID 48216)
-- Name: orders p_orders; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT p_orders PRIMARY KEY (oid);


--
-- TOC entry 2051 (class 2606 OID 48221)
-- Name: product p_product; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT p_product PRIMARY KEY (pid);


--
-- TOC entry 2053 (class 2606 OID 48226)
-- Name: roles p_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT p_roles PRIMARY KEY (role_id);


--
-- TOC entry 2059 (class 2606 OID 48238)
-- Name: user_role p_user_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT p_user_role PRIMARY KEY (id);


--
-- TOC entry 2057 (class 2606 OID 48233)
-- Name: users p_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT p_users PRIMARY KEY (userid);


--
-- TOC entry 2055 (class 2606 OID 48228)
-- Name: roles roles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);


-- Completed on 2018-12-03 16:24:40

--
-- PostgreSQL database dump complete
--

