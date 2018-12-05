--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.9
-- Dumped by pg_dump version 9.6.9

-- Started on 2018-12-05 17:18:33

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
-- TOC entry 2223 (class 0 OID 0)
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
-- TOC entry 2224 (class 0 OID 0)
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
    cname character varying(45) NOT NULL,
    phone character varying(11) NOT NULL,
    city bigint,
    cid integer NOT NULL
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 48309)
-- Name: customer_cid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_cid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_cid_seq OWNER TO postgres;

--
-- TOC entry 2225 (class 0 OID 0)
-- Dependencies: 197
-- Name: customer_cid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_cid_seq OWNED BY public.customer.cid;


--
-- TOC entry 188 (class 1259 OID 48207)
-- Name: orderdetails; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orderdetails (
    oid bigint NOT NULL,
    pid bigint NOT NULL,
    price numeric(10,2) NOT NULL,
    qty bigint NOT NULL,
    odid integer NOT NULL
);


ALTER TABLE public.orderdetails OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 48319)
-- Name: orderdetails_odid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orderdetails_odid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orderdetails_odid_seq OWNER TO postgres;

--
-- TOC entry 2226 (class 0 OID 0)
-- Dependencies: 198
-- Name: orderdetails_odid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orderdetails_odid_seq OWNED BY public.orderdetails.odid;


--
-- TOC entry 189 (class 1259 OID 48212)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    cid bigint NOT NULL,
    total numeric(10,2) NOT NULL,
    ordertype character varying(45) NOT NULL,
    orderdate date NOT NULL,
    oid integer NOT NULL,
    ship_service integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 199 (class 1259 OID 48329)
-- Name: orders_oid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_oid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_oid_seq OWNER TO postgres;

--
-- TOC entry 2227 (class 0 OID 0)
-- Dependencies: 199
-- Name: orders_oid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_oid_seq OWNED BY public.orders.oid;


--
-- TOC entry 190 (class 1259 OID 48217)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    pname character varying(45) NOT NULL,
    price numeric(10,2) NOT NULL,
    qty bigint NOT NULL,
    price_sale numeric(10,0),
    buy_date date,
    create_date timestamp with time zone,
    update_date timestamp with time zone,
    pid integer NOT NULL
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 48299)
-- Name: product_pid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_pid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_pid_seq OWNER TO postgres;

--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 196
-- Name: product_pid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_pid_seq OWNED BY public.product.pid;


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
-- TOC entry 201 (class 1259 OID 48340)
-- Name: ship_service; Type: TABLE; Schema: public; Owner: liempt
--

CREATE TABLE public.ship_service (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.ship_service OWNER TO liempt;

--
-- TOC entry 200 (class 1259 OID 48338)
-- Name: ship_service_id_seq; Type: SEQUENCE; Schema: public; Owner: liempt
--

CREATE SEQUENCE public.ship_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ship_service_id_seq OWNER TO liempt;

--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 200
-- Name: ship_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: liempt
--

ALTER SEQUENCE public.ship_service_id_seq OWNED BY public.ship_service.id;


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
-- TOC entry 2050 (class 2604 OID 48283)
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- TOC entry 2051 (class 2604 OID 48311)
-- Name: customer cid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN cid SET DEFAULT nextval('public.customer_cid_seq'::regclass);


--
-- TOC entry 2052 (class 2604 OID 48321)
-- Name: orderdetails odid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails ALTER COLUMN odid SET DEFAULT nextval('public.orderdetails_odid_seq'::regclass);


--
-- TOC entry 2053 (class 2604 OID 48331)
-- Name: orders oid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN oid SET DEFAULT nextval('public.orders_oid_seq'::regclass);


--
-- TOC entry 2054 (class 2604 OID 48301)
-- Name: product pid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN pid SET DEFAULT nextval('public.product_pid_seq'::regclass);


--
-- TOC entry 2055 (class 2604 OID 48343)
-- Name: ship_service id; Type: DEFAULT; Schema: public; Owner: liempt
--

ALTER TABLE ONLY public.ship_service ALTER COLUMN id SET DEFAULT nextval('public.ship_service_id_seq'::regclass);


--
-- TOC entry 2199 (class 0 OID 48188)
-- Dependencies: 185
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (code, name, id) FROM stdin;
1	AAA	13
2	BBB	14
3	3	19
4	4	20
5	5	22
6	6	23
7	7	24
8	8	25
9	9	26
11	11	27
12	12	28
\.


--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 195
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_id_seq', 28, true);


--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 194
-- Name: city_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_seq', 1, false);


--
-- TOC entry 2200 (class 0 OID 48197)
-- Dependencies: 186
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name) FROM stdin;
\.


--
-- TOC entry 2201 (class 0 OID 48202)
-- Dependencies: 187
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (cname, phone, city, cid) FROM stdin;
AAA	1677514336	14	5
\.


--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 197
-- Name: customer_cid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_cid_seq', 6, true);


--
-- TOC entry 2202 (class 0 OID 48207)
-- Dependencies: 188
-- Data for Name: orderdetails; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orderdetails (oid, pid, price, qty, odid) FROM stdin;
1	3	12311.00	1	1
2	3	12311.00	1	2
\.


--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 198
-- Name: orderdetails_odid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orderdetails_odid_seq', 2, true);


--
-- TOC entry 2203 (class 0 OID 48212)
-- Dependencies: 189
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (cid, total, ordertype, orderdate, oid, ship_service) FROM stdin;
5	12311.00	sell	2018-12-05	1	\N
5	12311.00	sell	2018-12-05	2	1
\.


--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 199
-- Name: orders_oid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_oid_seq', 2, true);


--
-- TOC entry 2204 (class 0 OID 48217)
-- Dependencies: 190
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (pname, price, qty, price_sale, buy_date, create_date, update_date, pid) FROM stdin;
AAA11	12311.00	78911	45611	2018-01-05	\N	\N	3
\.


--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 196
-- Name: product_pid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_pid_seq', 25, true);


--
-- TOC entry 2205 (class 0 OID 48222)
-- Dependencies: 191
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, role_name) FROM stdin;
1	ROLE_ADMIN
2	ROLE_USER
\.


--
-- TOC entry 2215 (class 0 OID 48340)
-- Dependencies: 201
-- Data for Name: ship_service; Type: TABLE DATA; Schema: public; Owner: liempt
--

COPY public.ship_service (id, name) FROM stdin;
1	Ho Chi Minh1
3	2223
\.


--
-- TOC entry 2236 (class 0 OID 0)
-- Dependencies: 200
-- Name: ship_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: liempt
--

SELECT pg_catalog.setval('public.ship_service_id_seq', 3, true);


--
-- TOC entry 2207 (class 0 OID 48234)
-- Dependencies: 193
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role (id, user_id, role_id) FROM stdin;
1	1	1
2	1	2
3	2	2
\.


--
-- TOC entry 2206 (class 0 OID 48229)
-- Dependencies: 192
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (userid, username, email, password, encryted_password, enabled) FROM stdin;
1	admin	admin@gmail.com	12345	$2a$10$L2JosoBYgoAkuvscp5WSCuLGReaEyFnNMGgQWlj0HidjuPwkifbi2	1
2	liempt	ptliem91@gmail.com	12345	$2a$10$L2JosoBYgoAkuvscp5WSCuLGReaEyFnNMGgQWlj0HidjuPwkifbi2	1
\.


--
-- TOC entry 2057 (class 2606 OID 48194)
-- Name: city city_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_code_key UNIQUE (code);


--
-- TOC entry 2059 (class 2606 OID 48196)
-- Name: city city_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_name_key UNIQUE (name);


--
-- TOC entry 2061 (class 2606 OID 48290)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- TOC entry 2065 (class 2606 OID 48316)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (cid);


--
-- TOC entry 2067 (class 2606 OID 48326)
-- Name: orderdetails orderdetails_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orderdetails
    ADD CONSTRAINT orderdetails_pkey PRIMARY KEY (odid);


--
-- TOC entry 2069 (class 2606 OID 48336)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (oid);


--
-- TOC entry 2063 (class 2606 OID 48201)
-- Name: country p_country; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT p_country PRIMARY KEY (id);


--
-- TOC entry 2073 (class 2606 OID 48226)
-- Name: roles p_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT p_roles PRIMARY KEY (role_id);


--
-- TOC entry 2079 (class 2606 OID 48238)
-- Name: user_role p_user_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT p_user_role PRIMARY KEY (id);


--
-- TOC entry 2077 (class 2606 OID 48233)
-- Name: users p_users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT p_users PRIMARY KEY (userid);


--
-- TOC entry 2071 (class 2606 OID 48306)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (pid);


--
-- TOC entry 2075 (class 2606 OID 48228)
-- Name: roles roles_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_role_name_key UNIQUE (role_name);


--
-- TOC entry 2081 (class 2606 OID 48348)
-- Name: ship_service ship_service_pkey; Type: CONSTRAINT; Schema: public; Owner: liempt
--

ALTER TABLE ONLY public.ship_service
    ADD CONSTRAINT ship_service_pkey PRIMARY KEY (id);


-- Completed on 2018-12-05 17:18:34

--
-- PostgreSQL database dump complete
--

