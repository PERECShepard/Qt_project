--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE db_user;
ALTER ROLE db_user WITH NOSUPERUSER INHERIT NOCREATEROLE CREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:ZWMC6Vnzw0083eoGDiQw3g==$jKHBgvVmde3OjhCdGeAnd+5lAp++J09z4f/NGf8/fTw=:c6j4n57yr9p2e75KqB9VSJX/q6MbSWT6AhfyvaIRvnA=';
CREATE ROLE guest;
ALTER ROLE guest WITH NOSUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:1MnsIQyYl2BfrlfaLMftyQ==$sd9lC/RXMiY0jpoAOe8Ua4nRt43muQkBVXHRZ4EfdtI=:Ak1FoTh39hv7HdFjzy58DiM1eJ82WdiN4Ez8mUqp8Mw=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:boZg8C9DwM3RylxbghgAyw==$2hswR2Luin4MET+2P0OPt7ngj15ctD3Qg3gzNKywM4o=:c7jMGy20e5/Wn45EY3nJpoK8/LaXG/V7NhI73Vz0DrM=';

--
-- User Configurations
--


--
-- Role memberships
--

GRANT postgres TO db_user WITH ADMIN OPTION GRANTED BY postgres;






--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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

--
-- PostgreSQL database dump complete
--

--
-- Database "business" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1
-- Dumped by pg_dump version 15.1

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

--
-- Name: business; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE business WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';


ALTER DATABASE business OWNER TO postgres;

\connect business

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
-- Name: supliers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.supliers (
    id bigint NOT NULL,
    name_of_supplier character varying(50) NOT NULL,
    surname_of_suplier character varying(50) NOT NULL,
    name_of_company character varying(50),
    price integer NOT NULL
);


ALTER TABLE public.supliers OWNER TO postgres;

--
-- Name: supliers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.supliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.supliers_id_seq OWNER TO postgres;

--
-- Name: supliers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.supliers_id_seq OWNED BY public.supliers.id;


--
-- Name: timber_supply; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timber_supply (
    id bigint NOT NULL,
    id_of_tree integer NOT NULL,
    id_of_supplyer integer NOT NULL,
    date_of_supply date NOT NULL,
    volume integer NOT NULL
);


ALTER TABLE public.timber_supply OWNER TO postgres;

--
-- Name: timber_supply_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.timber_supply_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timber_supply_id_seq OWNER TO postgres;

--
-- Name: timber_supply_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.timber_supply_id_seq OWNED BY public.timber_supply.id;


--
-- Name: trees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trees (
    id bigint NOT NULL,
    name_of_tree character varying(50) NOT NULL,
    count integer NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.trees OWNER TO postgres;

--
-- Name: trees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trees_id_seq OWNER TO postgres;

--
-- Name: trees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trees_id_seq OWNED BY public.trees.id;


--
-- Name: supliers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supliers ALTER COLUMN id SET DEFAULT nextval('public.supliers_id_seq'::regclass);


--
-- Name: timber_supply id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timber_supply ALTER COLUMN id SET DEFAULT nextval('public.timber_supply_id_seq'::regclass);


--
-- Name: trees id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trees ALTER COLUMN id SET DEFAULT nextval('public.trees_id_seq'::regclass);


--
-- Data for Name: supliers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.supliers (id, name_of_supplier, surname_of_suplier, name_of_company, price) FROM stdin;
1	Jewel	Jordison	Barton-Fritsch	951
2	Sula	MacGiany	\N	4427
3	Sibeal	Caruth	\N	1151
4	Con	Bratty	\N	771
5	Lockwood	Garratty	\N	1491
6	Gabi	Adamou	\N	2951
7	Adena	Hamill	\N	3899
8	Gipsy	Daice	\N	950
9	Corissa	Urion	O'Connell LLC	2292
10	Manon	Southerton	\N	4736
11	Rey	Duiged	\N	4339
12	Ophelie	Jirik	Hane, White and Kris	4716
13	Christa	Southey	Reilly and Sons	1063
14	Demetre	Guynemer	\N	4844
15	Waylin	Matessian	\N	4973
16	Brita	Bullen	\N	1900
17	Vale	Lardier	Rowe Group	1737
18	Mackenzie	Jakaway	\N	4758
19	Darby	Miner	\N	529
20	Alica	Tacon	Braun, Dickens and Hilll	3357
21	Sal	Imason	\N	719
22	Farley	Chettle	Gusikowski and Sons	2978
23	Kyle	Kuhnhardt	\N	3689
24	Dacy	Camillo	\N	2538
25	Betta	Satch	Hauck, Hackett and Gutmann	2145
26	Morgan	Bennetto	\N	3978
27	Sibley	Baroch	\N	4934
28	Lynsey	Emmins	\N	4048
29	Priscella	Pinnigar	\N	2718
30	Joey	Layzell	Reichert Inc	4761
31	Kellina	Rittelmeyer	Waelchi LLC	3113
32	Sampson	Sennett	\N	3013
33	Veronique	Elnaugh	Carter, O'Hara and Stanton	3707
34	Kristofer	Flatley	\N	3623
35	Lindsey	Shemmin	Cummerata LLC	4929
36	Yetta	Broggetti	\N	2104
37	Hugibert	Jaffa	\N	2143
38	Heindrick	Pain	\N	4829
39	Winifield	Hesser	Crona-Kilback	4773
40	Hewie	Halligan	Huels Inc	4476
41	Leeanne	Radloff	Schmeler-Leannon	1398
42	Nikolos	Gaddas	\N	862
43	Moishe	Metzel	\N	4509
44	Sly	Arnhold	\N	1646
45	Veda	Antunez	\N	3064
46	Denyse	Sommerled	\N	2611
47	Toiboid	Thomazet	\N	1567
48	Pascal	Mathen	\N	4104
49	Teodoor	Minerdo	Predovic LLC	1611
50	Carolan	McGeorge	\N	2320
51	Smitty	Matteotti	\N	2882
52	Reinhard	Ort	\N	1544
53	Audra	Foister	Casper-Abbott	1832
54	Rusty	Bravington	\N	3131
55	Bev	Evason	\N	3862
56	Alistair	Busfield	\N	3867
57	Hedwig	Soonhouse	\N	3377
58	Brunhilde	Buney	\N	3436
59	Danny	Shipley	Carter-Gislason	2150
60	Gilbertina	Burchill	\N	3341
61	Wendi	Lavalde	Hamill-Kohler	4507
62	Wilton	Pinch	Bechtelar LLC	965
63	Wait	Cowles	\N	3815
64	Maryellen	Walas	Dickens, Swaniawski and Kuphal	655
65	Benjie	Ridewood	Kohler, Kub and Feeney	1702
66	Gui	Paulisch	Langosh LLC	2853
67	Erek	McIlvaney	\N	2772
68	Adella	Lyfe	Lowe-Conroy	3757
69	Lyn	Woodhead	Reilly Inc	4909
70	Andras	Lecointe	\N	3600
71	Hermione	Ridehalgh	\N	1849
72	Rosy	Kingcott	Spencer, Rohan and Vandervort	1377
73	Care	Crehan	\N	1753
74	Elwyn	Dowsey	\N	4922
75	Ferd	Cawthron	\N	1495
76	Con	Egell	\N	3562
77	Beth	Brando	Turcotte-Kovacek	2968
78	Isadore	Camell	\N	3894
79	Viva	Possek	\N	4510
80	Pansy	Beeke	\N	1836
81	Eli	Honsch	\N	3219
82	Reeva	Grain	\N	3943
83	Cornelius	Kermeen	\N	4145
84	Maiga	Swanborrow	\N	3919
85	Blithe	Daveridge	Bins, Keebler and Orn	3432
86	Quent	Bhatia	\N	3749
87	Amie	Robardet	\N	2400
88	Inglis	Brooks	\N	1994
89	Germayne	Cristou	Will-Macejkovic	3783
90	Tait	Midghall	\N	948
91	Jacquelin	Knutton	\N	1130
92	Cull	Jarley	Von-Reynolds	3311
93	Ruperta	Bambrick	Bergnaum-Quitzon	2305
94	Christan	Newby	Walter-Murphy	4057
95	Eli	Fitzsimons	\N	1676
96	Oliviero	Cornborough	Kling and Sons	1651
97	Artie	Virgin	\N	2676
98	Rosie	Madoc-Jones	Bosco, Romaguera and Weimann	658
99	Cherice	Rival	\N	2771
100	Helge	Killich	Reichert, Wiegand and Kohler	1687
\.


--
-- Data for Name: timber_supply; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timber_supply (id, id_of_tree, id_of_supplyer, date_of_supply, volume) FROM stdin;
1	14	83	2011-11-18	6768
2	6	63	2008-02-12	5000
3	10	36	2020-10-03	2523
4	13	66	2000-11-21	8353
5	8	92	2005-02-01	8095
6	12	89	2004-08-31	9916
7	10	46	2010-04-18	4690
8	10	85	2009-03-11	3982
9	14	50	2016-07-11	9369
10	7	41	2006-06-24	6388
11	14	2	2022-10-08	1066
12	4	89	2004-03-24	5676
13	14	31	2008-03-10	107
14	13	19	2019-11-25	1746
15	13	63	2009-01-22	9348
16	1	1	2002-04-22	7153
17	1	43	2014-01-18	245
18	4	46	2018-07-14	4800
19	1	74	2004-09-11	2564
20	7	96	2001-01-23	1643
21	10	19	2006-11-07	3810
22	6	31	2008-01-09	5627
23	7	8	2009-07-06	6551
24	14	50	2009-06-30	229
25	5	91	2014-02-20	7448
26	13	7	2015-06-30	1723
27	6	49	2009-12-21	9704
28	5	8	2004-10-07	9927
29	3	48	2003-07-29	6842
30	6	86	2019-08-19	4081
31	12	54	2003-05-07	2906
32	3	64	2000-10-18	7154
33	2	26	2018-11-07	3202
34	2	17	2010-08-25	5666
35	9	54	2016-11-09	7584
36	2	52	2020-11-19	8311
37	9	43	2005-10-02	5955
38	14	89	2015-08-31	8210
39	4	6	2010-02-02	5031
40	2	100	2017-12-16	6863
41	5	5	2017-08-31	356
42	5	71	2007-12-17	8092
43	8	32	2012-11-01	1759
44	8	9	2010-08-22	2756
45	1	61	2019-09-01	3753
46	13	26	2003-04-09	8460
47	11	52	2011-02-23	380
48	4	63	2006-05-06	2394
49	11	37	2017-04-06	3083
50	8	57	2022-01-27	9150
51	4	9	2017-01-12	3874
52	8	58	2003-08-26	2205
53	5	14	2022-12-14	4302
54	5	82	2009-11-25	6472
55	1	18	2012-03-22	5222
56	2	48	2000-11-01	1578
57	6	32	2006-02-02	1136
58	8	67	2007-04-06	5737
59	14	27	2005-12-08	2677
60	7	86	2021-01-23	4901
61	7	17	2011-06-09	791
62	13	36	2014-12-09	3640
63	3	45	2015-03-22	4147
64	8	24	2015-02-21	718
65	6	34	2019-03-13	7469
66	8	74	2020-06-26	7651
67	12	97	2010-11-02	2966
68	3	76	2009-09-26	5510
69	7	42	2012-10-17	2588
70	11	39	2002-12-27	3467
71	10	30	2007-03-15	3527
72	12	43	2003-12-07	2459
73	14	60	2001-11-10	5139
74	5	71	2000-04-25	2064
75	9	59	2007-11-04	8006
76	11	71	2014-07-10	7674
77	13	61	2004-12-18	8675
78	2	26	2004-02-27	8081
79	7	48	2000-03-27	9214
80	10	42	2013-08-07	6242
81	6	41	2006-05-12	7802
82	2	24	2009-06-21	8889
83	7	6	2001-05-16	6320
84	14	57	2009-11-28	1742
85	14	61	2009-12-24	573
86	13	40	2018-08-16	8418
87	11	85	2008-08-07	3232
88	14	71	2008-03-19	443
89	6	33	2017-02-17	8142
90	2	18	2003-09-24	6372
91	6	78	2008-05-01	6180
92	3	65	2010-05-09	2180
93	14	33	2006-08-08	1698
94	9	25	2000-12-04	6063
95	10	85	2000-12-10	6293
96	14	86	2022-05-12	779
97	2	58	2017-08-04	785
98	9	71	2017-08-22	9964
99	12	67	2021-09-04	8160
100	13	65	2000-02-02	6628
\.


--
-- Data for Name: trees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trees (id, name_of_tree, count, price) FROM stdin;
2	Дуб	978	67
3	Береза	329	2226
4	Груша	840	1329
5	Ель	771	126
6	Сосна	879	549
7	Ёлка	380	772
8	Ольха	180	22
9	Лиственница	662	1596
10	Клен	892	38
11	Липа	947	1012
12	Орех	156	152
13	Тополь	490	922
14	Рябина	66	1025
1	Ива	998	2000
\.


--
-- Name: supliers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.supliers_id_seq', 100, true);


--
-- Name: timber_supply_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timber_supply_id_seq', 102, true);


--
-- Name: trees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trees_id_seq', 15, true);


--
-- Name: supliers supliers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.supliers
    ADD CONSTRAINT supliers_pkey PRIMARY KEY (id);


--
-- Name: timber_supply timber_supply_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timber_supply
    ADD CONSTRAINT timber_supply_pkey PRIMARY KEY (id);


--
-- Name: trees trees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trees
    ADD CONSTRAINT trees_pkey PRIMARY KEY (id);


--
-- Name: TABLE trees; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.trees TO guest;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

