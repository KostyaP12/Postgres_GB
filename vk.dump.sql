--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-1.pgdg18.04+1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-1.pgdg18.04+1)

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
-- Name: communities; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities (
    id integer NOT NULL,
    name character varying(120),
    creator_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.communities_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communities_id_seq OWNER TO gb_user;

--
-- Name: communities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.communities_id_seq OWNED BY public.communities.id;


--
-- Name: communities_users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.communities_users (
    community_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.communities_users OWNER TO gb_user;

--
-- Name: friendship; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship (
    id integer NOT NULL,
    requested_by_user_id integer NOT NULL,
    requested_to_user_id integer NOT NULL,
    status_id integer NOT NULL,
    requested_at timestamp without time zone,
    confirmed_at timestamp without time zone
);


ALTER TABLE public.friendship OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_id_seq OWNER TO gb_user;

--
-- Name: friendship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_id_seq OWNED BY public.friendship.id;


--
-- Name: friendship_statuses; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.friendship_statuses (
    id integer NOT NULL,
    name character varying(30)
);


ALTER TABLE public.friendship_statuses OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.friendship_statuses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.friendship_statuses_id_seq OWNER TO gb_user;

--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.friendship_statuses_id_seq OWNED BY public.friendship_statuses.id;


--
-- Name: messages; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.messages (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    body text,
    is_important boolean,
    is_delivered boolean,
    created_at timestamp without time zone
);


ALTER TABLE public.messages OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.messages_id_seq OWNER TO gb_user;

--
-- Name: messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.messages_id_seq OWNED BY public.messages.id;


--
-- Name: photo; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.photo (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.photo OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_id_seq OWNER TO gb_user;

--
-- Name: photo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.photo_id_seq OWNED BY public.photo.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.users (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(120) NOT NULL,
    phone character varying(15),
    main_photo_id integer,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO gb_user;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: video; Type: TABLE; Schema: public; Owner: gb_user
--

CREATE TABLE public.video (
    id integer NOT NULL,
    url character varying(250) NOT NULL,
    owner_id integer NOT NULL,
    description character varying(250) NOT NULL,
    uploaded_at timestamp without time zone NOT NULL,
    size integer NOT NULL
);


ALTER TABLE public.video OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE; Schema: public; Owner: gb_user
--

CREATE SEQUENCE public.video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_seq OWNER TO gb_user;

--
-- Name: video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gb_user
--

ALTER SEQUENCE public.video_id_seq OWNED BY public.video.id;


--
-- Name: communities id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities ALTER COLUMN id SET DEFAULT nextval('public.communities_id_seq'::regclass);


--
-- Name: friendship id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship ALTER COLUMN id SET DEFAULT nextval('public.friendship_id_seq'::regclass);


--
-- Name: friendship_statuses id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses ALTER COLUMN id SET DEFAULT nextval('public.friendship_statuses_id_seq'::regclass);


--
-- Name: messages id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages ALTER COLUMN id SET DEFAULT nextval('public.messages_id_seq'::regclass);


--
-- Name: photo id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo ALTER COLUMN id SET DEFAULT nextval('public.photo_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: video id; Type: DEFAULT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video ALTER COLUMN id SET DEFAULT nextval('public.video_id_seq'::regclass);


--
-- Data for Name: communities; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities (id, name, creator_id, created_at) FROM stdin;
\.


--
-- Data for Name: communities_users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.communities_users (community_id, user_id, created_at) FROM stdin;
61	99	2022-07-30 05:23:55
51	2	2022-01-15 03:28:42
69	45	2022-02-23 10:31:46
70	22	2022-01-28 08:40:34
36	19	2022-10-25 01:43:48
68	24	2023-04-30 02:14:00
35	68	2022-05-15 07:44:42
67	93	2022-01-06 02:06:48
81	19	2022-12-07 11:45:41
19	62	2023-07-03 05:40:53
53	53	2022-05-02 06:37:45
45	2	2023-05-10 10:46:05
62	71	2023-07-08 07:54:36
67	14	2022-04-04 09:34:38
4	19	2023-01-08 08:08:45
99	80	2022-06-01 04:07:42
46	71	2023-07-05 10:53:27
24	34	2021-09-19 07:50:38
56	95	2022-03-30 10:22:16
23	14	2023-07-30 08:24:56
25	51	2023-01-16 06:28:45
73	5	2022-12-22 02:10:56
66	77	2023-03-31 08:33:59
32	62	2023-05-09 03:04:35
80	37	2022-04-23 10:52:36
61	36	2022-01-23 11:10:19
89	83	2023-06-11 10:21:26
26	10	2021-09-10 07:59:06
57	88	2021-10-24 01:40:12
7	74	2022-11-20 08:40:53
91	27	2023-01-06 04:04:32
37	45	2023-08-23 10:05:47
33	33	2022-06-23 03:31:46
10	45	2023-06-17 02:56:05
78	27	2021-12-06 04:59:18
88	24	2021-09-19 05:17:30
69	28	2021-12-01 07:18:14
14	42	2023-07-11 08:22:01
5	24	2021-09-14 03:09:50
76	22	2022-09-21 05:57:22
32	83	2023-06-26 12:49:22
36	26	2022-11-01 02:34:33
47	45	2023-08-23 06:48:11
52	49	2021-10-31 12:02:34
39	84	2022-02-04 11:31:21
28	48	2023-03-17 12:19:33
13	16	2023-03-21 05:40:27
20	20	2023-07-14 10:09:28
96	8	2022-05-31 01:50:33
28	12	2021-09-27 06:52:38
58	2	2022-09-18 04:09:37
73	92	2023-01-29 06:26:37
82	57	2022-11-24 08:38:00
59	65	2022-12-22 08:20:50
83	30	2023-02-23 02:07:28
34	90	2021-11-07 03:58:38
83	29	2023-05-12 12:42:59
34	35	2022-11-08 03:10:21
57	71	2021-09-29 03:01:05
28	20	2022-04-22 03:03:54
63	51	2022-06-19 10:28:22
60	2	2022-05-31 10:18:50
53	62	2023-05-18 01:05:04
13	44	2023-06-16 11:17:44
38	64	2021-12-01 05:07:39
47	26	2022-04-28 12:52:29
87	89	2022-09-05 02:17:14
13	66	2022-06-29 05:43:55
100	45	2022-02-25 07:51:49
49	52	2022-10-08 03:45:10
29	57	2023-02-24 02:45:57
60	62	2022-11-25 01:10:06
61	94	2022-07-06 03:08:44
74	96	2022-02-09 10:33:29
65	64	2023-07-30 04:44:57
60	18	2022-10-29 06:27:54
39	7	2023-02-07 01:23:25
38	27	2023-03-07 07:55:10
14	5	2023-03-07 08:36:35
6	79	2022-04-30 09:54:00
64	2	2022-12-07 04:05:23
30	9	2021-11-24 11:54:44
72	41	2022-06-01 10:02:27
13	7	2022-02-19 08:22:33
61	81	2023-01-30 04:43:00
8	41	2022-08-03 02:42:44
62	99	2022-11-29 11:18:21
9	62	2021-11-10 04:11:44
19	14	2022-02-19 05:14:32
68	72	2022-08-14 06:21:14
96	40	2022-11-27 04:34:03
68	92	2022-03-15 05:36:22
3	50	2022-10-24 04:16:51
35	87	2023-01-05 01:12:58
67	46	2022-04-03 01:56:44
75	9	2023-04-02 06:52:28
26	90	2023-01-24 04:54:47
51	43	2022-01-19 10:58:22
35	58	2022-12-03 11:54:30
77	28	2023-06-11 12:35:43
\.


--
-- Data for Name: friendship; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship (id, requested_by_user_id, requested_to_user_id, status_id, requested_at, confirmed_at) FROM stdin;
1	57	91	4	2022-01-06 06:37:59	2021-11-02 09:20:52
2	72	84	2	2021-11-06 05:01:22	2023-03-05 03:50:06
3	63	20	2	2021-12-09 12:03:31	2022-12-01 09:35:28
4	55	72	4	2021-12-03 08:16:36	2023-04-25 07:48:39
5	30	47	3	2021-11-19 12:56:15	2023-02-22 04:28:15
6	97	7	1	2021-09-28 05:59:54	2022-10-01 06:41:14
7	4	14	3	2022-01-13 04:19:04	2021-10-05 06:31:53
8	40	33	4	2022-01-10 05:55:33	2023-07-26 01:06:15
9	19	1	3	2021-09-10 07:52:04	2023-03-27 08:54:14
10	78	91	1	2021-10-26 07:04:08	2022-01-04 12:59:41
11	53	43	4	2021-10-08 06:16:45	2022-09-24 08:37:29
12	31	3	3	2021-10-29 08:07:19	2023-01-21 12:54:48
13	98	42	1	2021-09-08 12:34:20	2022-12-04 02:15:37
14	29	80	3	2021-12-18 01:00:14	2023-03-22 08:54:36
15	68	29	2	2021-10-05 03:50:38	2022-04-20 04:16:47
16	61	81	5	2021-10-25 04:33:52	2022-10-08 07:33:52
17	96	41	5	2021-10-05 09:21:45	2022-02-14 02:18:14
18	51	22	3	2021-10-31 09:06:57	2023-06-02 06:46:57
19	5	67	3	2021-08-29 12:02:45	2023-01-11 03:01:52
20	92	81	3	2022-01-10 05:31:00	2022-03-18 08:24:26
21	72	13	5	2021-10-12 05:54:38	2023-04-22 12:40:15
22	72	39	4	2021-10-09 06:10:29	2021-12-15 11:09:13
23	51	88	4	2022-01-04 05:24:59	2022-11-06 09:50:13
24	11	19	3	2022-01-15 09:18:22	2022-04-29 12:40:15
25	23	68	2	2021-12-04 11:35:13	2021-11-16 05:53:57
26	69	90	2	2021-10-05 07:10:35	2023-04-11 03:42:00
27	66	34	4	2022-01-03 02:55:40	2021-10-28 01:10:28
28	24	98	3	2021-09-24 03:05:45	2022-08-10 10:44:09
29	66	58	3	2021-09-14 01:28:48	2022-05-20 02:53:41
30	82	96	3	2021-12-05 09:57:11	2022-09-04 12:16:35
31	41	83	2	2021-11-12 05:33:55	2023-04-11 01:35:19
32	78	57	2	2021-09-18 09:30:48	2021-10-18 08:03:50
33	24	59	2	2022-01-22 01:16:37	2021-12-25 08:59:06
34	72	22	4	2021-09-22 09:24:37	2022-10-16 06:45:07
35	41	41	2	2021-10-27 10:38:13	2022-05-22 10:36:21
36	99	12	3	2021-12-04 02:06:29	2023-07-20 09:30:49
37	35	82	3	2021-11-20 07:07:55	2022-03-17 05:13:45
38	92	27	1	2021-09-04 07:05:41	2021-11-15 06:14:58
39	84	11	3	2021-09-06 03:21:31	2022-06-28 02:22:32
40	81	33	2	2021-11-15 11:21:09	2022-02-10 12:51:37
41	27	5	1	2021-11-29 06:17:30	2022-01-22 12:17:05
42	24	78	1	2021-09-13 12:03:04	2023-08-13 01:26:28
43	95	87	4	2021-12-09 04:45:44	2021-09-01 02:21:43
44	12	91	2	2021-10-11 12:15:16	2021-12-23 08:31:24
45	48	78	2	2022-01-18 02:50:46	2022-10-17 05:24:39
46	94	54	4	2022-01-10 07:56:45	2022-03-28 02:49:32
47	74	41	4	2022-01-26 01:32:04	2022-03-07 11:15:15
48	4	66	2	2021-11-18 02:34:24	2021-09-23 11:46:58
49	82	69	4	2021-09-16 02:22:36	2023-06-19 03:21:10
50	8	2	1	2021-10-27 04:53:52	2022-12-01 08:14:53
51	46	74	3	2021-09-28 11:45:54	2023-02-09 09:44:16
52	35	73	1	2022-01-15 04:30:56	2023-08-16 07:07:35
53	31	84	4	2021-12-14 01:07:44	2022-10-22 11:45:46
54	13	76	3	2021-11-05 11:31:33	2022-06-12 10:36:27
55	76	58	2	2022-01-25 12:25:35	2021-10-17 12:32:57
56	91	2	5	2021-09-16 12:59:04	2022-08-10 09:06:39
57	39	45	4	2021-08-29 04:26:21	2022-11-19 11:55:01
58	66	47	2	2021-09-09 11:21:54	2022-09-24 03:26:28
59	71	40	1	2022-01-21 06:06:23	2022-04-28 06:45:12
60	90	30	4	2021-10-17 01:33:39	2023-08-23 05:54:06
61	56	10	2	2021-12-15 08:42:41	2021-10-21 06:10:01
62	66	20	5	2021-09-09 09:10:02	2023-06-08 05:01:06
63	37	58	3	2021-08-31 05:29:03	2023-05-25 09:27:37
64	37	40	3	2022-01-23 08:39:08	2022-11-12 06:15:59
65	91	35	5	2021-11-03 11:13:21	2022-02-26 03:16:18
66	37	5	4	2021-11-12 04:52:44	2022-12-20 11:48:34
67	65	89	3	2021-11-03 12:28:31	2022-12-31 10:53:27
68	27	14	2	2021-10-30 04:22:44	2021-11-30 10:08:10
69	47	53	2	2021-09-03 09:19:59	2022-03-16 08:00:33
70	23	29	1	2022-01-16 01:58:00	2022-08-05 06:48:28
71	17	93	1	2021-11-10 07:04:53	2022-09-19 09:50:41
72	75	88	4	2021-12-09 12:26:14	2021-09-27 04:30:13
73	47	63	1	2021-09-11 02:42:56	2023-04-04 12:37:18
74	68	87	3	2022-01-16 05:01:36	2023-06-22 02:19:56
75	35	49	4	2021-10-17 02:24:06	2022-11-29 10:31:42
76	22	52	5	2021-12-31 05:16:29	2021-10-28 02:45:46
77	15	68	5	2022-01-30 05:24:24	2022-05-03 02:12:00
78	79	40	4	2021-12-09 04:13:04	2021-11-03 11:54:33
79	59	26	3	2021-11-06 04:34:37	2022-05-07 03:09:20
80	97	24	1	2021-12-14 09:03:43	2021-12-12 07:35:42
81	98	79	2	2021-12-22 04:50:46	2021-09-04 04:45:46
82	2	96	3	2021-12-14 04:51:56	2022-05-30 11:46:33
83	37	30	4	2021-10-16 08:11:33	2022-12-23 07:03:51
84	14	2	4	2021-09-19 08:09:04	2023-05-18 07:15:19
85	25	45	1	2021-12-03 11:00:45	2022-08-12 12:15:51
86	24	86	3	2021-10-31 06:40:50	2022-05-09 02:01:48
87	87	66	4	2021-10-12 04:22:24	2022-01-26 04:53:10
88	82	28	4	2021-09-05 07:56:16	2022-04-06 08:36:08
89	37	23	3	2021-12-30 01:29:22	2021-11-06 04:45:41
90	75	38	3	2021-09-02 10:25:24	2021-08-31 04:55:48
91	3	85	5	2022-01-11 11:28:33	2023-02-25 12:36:47
92	4	63	1	2021-12-21 08:12:16	2022-06-24 03:56:02
93	43	90	3	2021-12-11 08:20:25	2021-09-30 08:30:11
94	70	31	4	2021-08-29 02:16:08	2023-07-02 05:43:44
95	63	5	1	2021-12-30 12:56:05	2022-03-09 04:07:44
96	58	89	4	2021-09-17 11:58:41	2022-03-11 05:24:17
97	97	58	2	2021-09-06 11:40:34	2022-06-02 02:03:08
98	92	35	4	2021-09-18 07:06:11	2023-02-09 09:59:25
99	73	26	1	2021-11-23 03:51:19	2022-03-07 11:00:02
100	78	30	1	2021-11-07 05:52:51	2023-04-14 08:02:06
101	3	85	5	2022-01-11 11:28:33	2023-02-25 12:36:47
102	4	63	1	2021-12-21 08:12:16	2022-06-24 03:56:02
103	43	90	3	2021-12-11 08:20:25	2021-09-30 08:30:11
104	70	31	4	2021-08-29 02:16:08	2023-07-02 05:43:44
105	63	5	1	2021-12-30 12:56:05	2022-03-09 04:07:44
106	58	89	4	2021-09-17 11:58:41	2022-03-11 05:24:17
107	97	58	2	2021-09-06 11:40:34	2022-06-02 02:03:08
108	92	35	4	2021-09-18 07:06:11	2023-02-09 09:59:25
109	73	26	1	2021-11-23 03:51:19	2022-03-07 11:00:02
110	78	30	1	2021-11-07 05:52:51	2023-04-14 08:02:06
111	3	85	5	2022-01-11 11:28:33	2023-02-25 12:36:47
112	4	63	1	2021-12-21 08:12:16	2022-06-24 03:56:02
113	43	90	3	2021-12-11 08:20:25	2021-09-30 08:30:11
114	70	31	4	2021-08-29 02:16:08	2023-07-02 05:43:44
115	63	5	1	2021-12-30 12:56:05	2022-03-09 04:07:44
116	58	89	4	2021-09-17 11:58:41	2022-03-11 05:24:17
117	97	58	2	2021-09-06 11:40:34	2022-06-02 02:03:08
118	92	35	4	2021-09-18 07:06:11	2023-02-09 09:59:25
119	73	26	1	2021-11-23 03:51:19	2022-03-07 11:00:02
120	78	30	1	2021-11-07 05:52:51	2023-04-14 08:02:06
\.


--
-- Data for Name: friendship_statuses; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.friendship_statuses (id, name) FROM stdin;
1	nisl
2	Duis
3	dictum.
4	neque.
5	dis
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.messages (id, from_user_id, to_user_id, body, is_important, is_delivered, created_at) FROM stdin;
1	74	6	dui, semper	f	t	2022-01-09 12:29:33
2	61	29	id,	t	f	2022-01-13 12:29:11
3	70	94	sollicitudin a, malesuada	f	f	2021-09-20 09:32:45
4	18	44	sapien. Aenean	t	t	2021-10-12 06:09:16
5	61	23	dolor. Donec fringilla. Donec feugiat metus	t	f	2021-10-05 01:21:52
6	82	53	Mauris ut quam vel sapien imperdiet ornare. In	f	f	2022-01-28 12:47:36
7	58	40	egestas. Duis ac arcu. Nunc mauris.	f	t	2021-08-29 06:56:42
8	97	71	et magnis dis parturient montes, nascetur ridiculus	t	t	2022-01-05 12:03:42
9	56	6	et arcu imperdiet ullamcorper. Duis at	f	f	2021-10-13 07:41:15
10	13	67	in, cursus et, eros. Proin ultrices. Duis volutpat	f	f	2021-10-08 05:42:50
11	49	14	nibh vulputate mauris sagittis placerat. Cras dictum ultricies ligula. Nullam	t	t	2021-12-04 06:53:57
12	31	54	fringilla cursus purus. Nullam	f	t	2021-10-23 04:55:16
13	90	58	eget odio. Aliquam vulputate ullamcorper magna. Sed eu eros.	f	f	2021-10-05 09:43:51
14	85	61	mauris. Integer sem elit, pharetra ut, pharetra sed,	f	t	2021-11-11 11:27:17
15	25	94	auctor. Mauris vel turpis. Aliquam adipiscing	t	f	2022-01-23 03:51:43
16	39	28	dolor. Quisque tincidunt pede ac urna. Ut tincidunt	f	t	2021-11-27 04:59:19
17	70	79	risus. Donec egestas.	t	t	2021-11-18 12:28:37
18	27	42	ornare, libero	t	t	2021-11-17 08:33:00
19	82	78	orci lobortis augue scelerisque mollis. Phasellus	t	t	2022-01-13 12:07:19
20	90	51	Aenean euismod	f	t	2021-09-16 01:14:50
21	55	10	sagittis semper. Nam tempor diam dictum	f	t	2021-10-02 10:27:33
22	8	28	id, erat. Etiam vestibulum massa rutrum magna. Cras	t	f	2021-09-20 03:05:39
23	16	89	Phasellus at augue id ante dictum cursus. Nunc mauris	t	f	2021-09-12 03:55:02
24	60	47	lacus. Ut nec urna et arcu imperdiet ullamcorper. Duis	f	t	2021-10-26 04:02:25
25	67	48	neque tellus, imperdiet non, vestibulum nec, euismod in, dolor.	f	f	2021-10-23 07:06:44
26	54	7	gravida. Praesent eu nulla at sem molestie sodales. Mauris blandit	t	t	2022-01-27 05:34:59
27	67	34	leo.	t	f	2021-09-24 10:11:24
28	58	98	tincidunt, nunc ac mattis ornare, lectus	t	f	2022-01-29 02:21:23
29	14	30	a neque. Nullam ut nisi a odio	t	t	2021-12-17 12:41:02
30	83	28	vitae nibh. Donec est mauris, rhoncus id, mollis nec,	t	f	2021-11-26 06:55:46
31	23	42	nec, malesuada ut, sem. Nulla	t	t	2021-10-16 12:44:37
32	25	95	Cum sociis natoque penatibus et magnis	t	t	2022-01-27 09:58:57
33	30	76	feugiat nec,	t	t	2021-11-26 01:59:22
34	20	31	non, bibendum sed, est. Nunc laoreet lectus quis	t	t	2021-12-07 08:45:13
35	77	48	Sed id risus quis diam luctus lobortis. Class aptent taciti	f	f	2021-11-11 10:29:38
36	5	83	interdum ligula eu	t	f	2021-10-27 12:27:46
37	35	53	Proin sed turpis nec mauris	t	t	2022-01-01 07:53:54
38	87	8	adipiscing ligula. Aenean gravida nunc sed pede.	t	f	2021-12-27 02:43:37
39	8	72	augue eu tellus. Phasellus	f	f	2022-01-05 12:18:09
40	60	10	penatibus et magnis dis parturient montes, nascetur	t	t	2021-12-29 07:49:50
41	49	95	non sapien molestie orci tincidunt adipiscing. Mauris molestie	f	t	2022-01-10 12:51:24
42	99	30	luctus. Curabitur egestas nunc sed libero. Proin sed turpis	t	t	2021-11-04 01:02:43
43	76	75	mi	t	f	2022-01-30 07:28:50
44	4	83	facilisis vitae, orci. Phasellus	t	f	2021-12-08 02:43:56
45	97	32	adipiscing fringilla, porttitor vulputate, posuere vulputate, lacus.	f	t	2022-01-20 04:56:56
46	84	72	arcu. Vestibulum ut eros non enim commodo hendrerit. Donec	f	f	2021-12-20 08:46:03
47	9	40	id, libero. Donec consectetuer mauris id sapien. Cras dolor dolor,	f	t	2021-12-30 05:53:36
48	73	72	senectus et netus et malesuada fames ac turpis egestas.	f	f	2021-09-13 09:33:33
49	48	28	nulla vulputate dui, nec tempus mauris erat eget	t	t	2021-11-15 05:40:04
50	67	57	pede ac urna. Ut tincidunt	t	t	2021-10-16 01:17:37
51	13	6	fringilla mi lacinia mattis. Integer eu lacus. Quisque imperdiet,	f	f	2021-10-16 08:45:22
52	57	87	enim. Mauris	f	t	2021-12-07 03:45:43
53	60	16	pede. Suspendisse dui. Fusce	t	t	2021-09-12 05:29:10
54	75	25	eu nulla at sem molestie sodales. Mauris blandit enim consequat	f	t	2021-12-03 12:48:34
55	75	24	rhoncus id, mollis nec,	t	t	2021-11-02 01:12:05
56	97	35	fringilla	f	t	2021-11-08 10:33:36
57	43	34	Etiam bibendum	f	f	2021-10-29 05:41:58
58	91	70	tristique ac, eleifend vitae, erat.	t	t	2021-10-02 03:33:37
59	8	97	Mauris nulla. Integer urna. Vivamus molestie dapibus ligula. Aliquam	t	t	2021-09-08 04:49:55
60	40	55	non, luctus sit amet, faucibus ut, nulla. Cras	f	f	2022-01-19 11:43:54
61	76	17	dui. Cum sociis	f	f	2022-01-18 11:36:32
62	82	23	lectus. Cum sociis natoque penatibus et	t	f	2021-10-17 06:54:35
63	16	41	sed libero. Proin sed turpis nec mauris blandit mattis.	f	t	2021-11-03 05:25:49
64	24	100	tristique	t	f	2022-01-21 08:22:35
65	51	99	egestas. Aliquam nec enim.	f	f	2022-01-18 04:24:34
66	9	80	iaculis nec, eleifend non, dapibus	f	f	2021-11-24 04:06:18
67	2	20	eu odio tristique pharetra. Quisque ac libero nec	f	f	2021-11-01 10:42:42
68	46	94	nascetur ridiculus mus. Proin vel arcu eu odio	t	t	2021-10-22 12:08:54
69	41	71	turpis nec mauris	f	f	2021-11-19 04:56:07
70	76	52	mauris sit amet lorem semper auctor. Mauris vel turpis. Aliquam	t	f	2021-12-09 10:30:12
71	87	90	Nunc pulvinar	f	t	2021-12-24 03:41:33
72	58	53	felis,	t	f	2021-11-06 12:49:46
73	17	79	odio sagittis semper. Nam tempor diam	t	t	2021-10-02 09:38:10
74	57	80	molestie. Sed	t	f	2021-09-21 02:11:30
75	39	17	Quisque ac libero nec ligula consectetuer rhoncus.	f	t	2021-10-01 06:08:38
76	65	64	senectus et netus et malesuada fames ac turpis egestas.	f	t	2021-12-24 04:34:41
77	73	51	In at	f	f	2021-09-28 12:11:53
78	79	12	lorem, vehicula et, rutrum	f	f	2021-09-05 09:31:24
79	18	63	egestas hendrerit neque. In ornare sagittis felis. Donec tempor,	f	f	2021-11-23 12:47:59
80	57	33	purus sapien, gravida non, sollicitudin	f	f	2021-10-10 06:40:19
81	20	98	libero. Integer in magna. Phasellus dolor elit, pellentesque a,	f	f	2021-09-17 01:34:14
82	66	23	semper et, lacinia vitae, sodales	t	f	2021-09-10 07:19:44
83	26	75	consectetuer rhoncus. Nullam velit dui, semper	t	f	2021-11-23 11:17:37
84	38	95	rutrum urna, nec luctus felis purus	f	t	2021-12-27 01:38:18
85	60	70	libero est, congue a, aliquet	t	t	2022-01-26 03:16:12
86	49	66	pharetra, felis eget varius ultrices, mauris ipsum	t	f	2021-11-19 08:56:58
87	8	94	nec metus facilisis lorem tristique aliquet. Phasellus	t	t	2021-09-19 10:35:51
88	50	99	Nunc mauris. Morbi	t	t	2022-01-26 09:10:36
89	41	76	risus. Morbi metus. Vivamus euismod urna. Nullam	t	f	2021-11-14 05:42:48
90	6	63	facilisi. Sed neque. Sed eget lacus. Mauris	t	t	2021-12-28 12:33:06
91	63	54	quis	t	f	2021-09-15 06:38:56
92	82	29	molestie tortor nibh sit amet	t	t	2021-12-08 08:00:10
93	21	4	dictum eleifend,	t	t	2021-09-25 11:04:37
94	96	23	Nam tempor diam dictum sapien. Aenean massa. Integer vitae nibh.	t	f	2021-12-17 01:11:28
95	99	48	vitae semper egestas, urna justo faucibus lectus, a sollicitudin orci	t	f	2021-09-24 12:35:41
96	19	97	felis. Nulla tempor augue ac	f	t	2021-11-03 08:26:23
97	10	78	Maecenas ornare	t	f	2021-11-08 09:05:56
98	25	84	sit amet ante. Vivamus non lorem vitae odio sagittis semper.	f	f	2021-12-11 04:55:09
99	59	97	lacus vestibulum lorem,	t	f	2021-09-27 09:06:07
100	32	17	pellentesque.	t	t	2021-10-23 02:40:50
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.photo (id, url, owner_id, description, uploaded_at, size) FROM stdin;
801	http://walmart.com?g=1	73	vulputate ullamcorper magna. Sed eu	2022-10-17 02:44:41	2
802	http://netflix.com?g=1	60	magnis dis parturient montes, nascetur	2022-05-31 01:16:25	2
803	http://google.com?g=1	19	natoque penatibus et magnis dis	2023-08-19 02:44:35	2
804	https://facebook.com?client=g	81	Praesent eu dui. Cum sociis	2022-05-14 09:07:43	3
805	http://naver.com?str=se	68	habitant morbi tristique senectus et	2022-04-21 03:20:07	1
806	http://zoom.us?k=0	74	Sed id risus quis diam	2021-10-20 04:53:17	3
807	https://baidu.com?k=0	26	non enim. Mauris quis turpis	2021-12-04 12:33:43	3
808	https://wikipedia.org?gi=100	85	libero. Proin sed turpis nec	2022-03-23 03:49:21	2
809	http://naver.com?str=sew	17	molestie tellus. Aenean egestas hendrerit	2022-03-02 03:19:37	2
810	https://naver.com?q=test	67	Proin ultrices. Duis volutpat nunc	2022-03-22 08:14:08	2
811	http://naver.com?ad=115	18	non, hendrerit id, ante. Nunc	2023-07-18 10:57:25	2
812	https://guardian.co.uk?g=1	41	id, ante. Nunc mauris sapien,	2021-10-24 03:34:27	2
813	http://naver.com?q=test	7	blandit viverra. Donec tempus, lorem	2022-07-08 05:50:01	2
814	http://ebay.com?gi=100	61	pellentesque. Sed dictum. Proin eget	2022-09-20 01:57:14	2
815	https://zoom.us?client=g	74	aliquet. Phasellus fermentum convallis ligula.	2022-06-08 06:16:22	2
816	https://walmart.com?search=1	5	amet ultricies sem magna nec	2022-04-29 12:19:54	2
817	https://instagram.com?q=0	61	viverra. Maecenas iaculis aliquet diam.	2022-01-25 03:41:15	1
818	https://bbc.co.uk?client=g	82	malesuada fames ac turpis egestas.	2022-05-04 04:19:14	3
819	https://guardian.co.uk?client=g	39	dictum. Phasellus in felis. Nulla	2023-03-12 08:49:53	1
820	http://walmart.com?search=1&q=de	77	quis accumsan convallis, ante lectus	2022-02-25 10:21:50	2
821	http://cnn.com?ab=441&aad=2	50	Etiam vestibulum massa rutrum magna.	2022-08-24 12:51:34	2
822	http://whatsapp.com?search=1&q=de	58	Maecenas ornare egestas ligula. Nullam	2022-03-11 02:34:01	1
823	http://whatsapp.com?search=1	46	mollis vitae, posuere at, velit.	2023-04-17 01:35:13	3
824	http://whatsapp.com?client=g	80	neque. Nullam ut nisi a	2021-10-09 03:04:56	2
825	http://baidu.com?p=8	83	Suspendisse non leo. Vivamus nibh	2023-07-12 07:31:06	2
826	http://instagram.com?q=test	88	mi lacinia mattis. Integer eu	2023-05-09 11:23:31	3
827	http://nytimes.com?q=11	94	molestie arcu. Sed eu nibh	2023-07-04 06:10:06	3
828	http://pinterest.com?p=8	77	vitae erat vel pede blandit	2022-06-13 10:02:18	2
829	http://zoom.us?k=02	56	facilisis non, bibendum sed, est.	2022-10-01 12:32:12	1
830	https://guardian.co.uk?p=8	26	semper rutrum. Fusce dolor quam,	2022-08-05 06:25:26	2
831	https://naver.com?ad=115	75	lacinia. Sed congue, elit sed	2022-04-21 09:39:01	2
832	http://facebook.com?client=g	58	vestibulum nec, euismod in, dolor.	2022-06-30 02:11:06	3
833	https://whatsapp.com?q=test	42	Duis sit amet diam eu	2022-01-20 04:44:57	2
834	http://twitter.com?p=8e	22	ut quam vel sapien imperdiet	2022-08-11 02:23:17	2
835	http://netflix.com?q=test	24	Vestibulum ante ipsum primis in	2022-07-15 10:45:38	2
836	https://zoom.us?str=se	75	facilisis, magna tellus faucibus leo,	2022-07-12 01:37:53	3
837	http://yahoo.com?ab=441&aad=2	40	sed turpis nec mauris blandit	2021-08-29 11:41:07	3
838	https://cnn.com?search=1&q=de	67	Sed et libero. Proin mi.	2021-09-23 08:23:18	2
839	http://twitter.com?page=1&offset=1	59	Sed eu eros. Nam consequat	2022-12-08 12:41:14	1
840	https://whatsapp.com?p=8	92	Nunc ut erat. Sed nunc	2022-04-16 03:28:40	3
841	http://twitter.com?p=8	33	pulvinar arcu et pede. Nunc	2022-12-22 01:13:43	3
842	http://youtube.com?p=8	7	fermentum arcu. Vestibulum ante ipsum	2021-11-18 10:16:06	2
843	https://walmart.com?g=1	68	in aliquet lobortis, nisi nibh	2023-04-06 10:16:00	1
844	http://walmart.com?page=1&offset=1	9	pede, malesuada vel, venenatis vel,	2021-11-04 03:23:03	2
845	http://netflix.com?g=31	67	et magnis dis parturient montes,	2022-11-10 12:36:34	3
846	https://bbc.co.uk?q=test	20	sed tortor. Integer aliquam adipiscing	2023-03-12 08:42:34	1
847	http://wikipedia.org?gi=100	11	Quisque tincidunt pede ac urna.	2022-06-22 07:25:00	1
848	https://yahoo.com?p=8	66	imperdiet dictum magna. Ut tincidunt	2023-04-26 07:38:03	2
849	http://nytimes.com?k=0	51	posuere, enim nisl elementum purus,	2022-01-24 07:54:14	2
850	http://guardian.co.uk?p=8	69	Nunc commodo auctor velit. Aliquam	2022-04-05 08:48:13	3
851	http://twitter.com?k=0	14	ac sem ut dolor dapibus	2022-10-01 05:11:18	3
852	https://reddit.com?ad=115	82	erat. Etiam vestibulum massa rutrum	2023-01-25 11:58:58	3
853	http://yahoo.com?search=1	77	eu augue porttitor interdum. Sed	2022-11-24 03:56:33	2
854	https://ebay.com?q=test	51	ultrices posuere cubilia Curae Phasellus	2021-09-23 10:43:59	2
855	https://twitter.com?ad=115	81	dolor elit, pellentesque a, facilisis	2022-05-08 02:04:07	3
856	https://ebay.com?client=g	18	sagittis. Nullam vitae diam. Proin	2021-12-18 08:50:45	2
857	https://netflix.com?search=1&q=de	37	ridiculus mus. Proin vel nisl.	2022-06-21 11:43:47	3
858	https://cnn.com?page=1&offset=1	38	ultrices iaculis odio. Nam interdum	2022-09-22 08:38:35	3
859	https://bbc.co.uk?q=teset	60	Maecenas mi felis, adipiscing fringilla,	2021-12-14 12:16:47	2
860	http://zoom.us?q=11	50	sapien imperdiet ornare. In faucibus.	2021-11-19 08:59:43	3
861	http://cnn.com?k=0	49	faucibus lectus, a sollicitudin orci	2022-01-20 11:53:49	3
862	http://ebay.com?q=11	45	lacinia mattis. Integer eu lacus.	2022-02-25 05:06:19	3
863	http://whatsapp.com?gi=100	40	Phasellus dolor elit, pellentesque a,	2022-09-10 12:45:51	2
864	https://google.com?k=0	67	tellus sem mollis dui, in	2023-08-24 05:53:51	3
865	http://cnn.com?q=4s	49	sapien imperdiet ornare. In faucibus.	2022-10-27 04:28:57	2
866	https://reddit.com?gi=100	47	ut, nulla. Cras eu tellus	2022-11-18 11:45:53	3
867	https://walmart.com?q=teest	36	est. Nunc ullamcorper, velit in	2022-02-21 02:58:59	2
868	http://ebay.com?ab=441&aad=2	81	diam. Duis mi enim, condimentum	2023-07-30 11:41:57	3
869	https://bbc.co.uk?k=0	13	augue. Sed molestie. Sed id	2022-05-14 06:43:30	3
870	https://zoom.us?ad=115	19	libero est, congue a, aliquet	2021-11-12 09:06:17	2
871	http://nytimes.com?ad=115	36	interdum feugiat. Sed nec metus	2022-04-05 06:54:14	1
872	http://bbc.co.uk?search=1	5	hymenaeos. Mauris ut quam vel	2022-05-08 06:37:59	2
873	https://baidu.com?q=test	70	mauris sagittis placerat. Cras dictum	2023-03-13 09:15:45	2
874	http://whatsapp.com?q=0	33	fermentum arcu. Vestibulum ante ipsum	2022-07-03 10:42:22	3
875	https://google.com?p=8	94	fames ac turpis egestas. Fusce	2022-04-02 11:33:08	3
876	http://netflix.com?p=8	93	placerat, orci lacus vestibulum lorem,	2022-03-11 03:38:13	1
877	http://facebook.com?g=1	77	Ut nec urna et arcu	2021-09-29 01:04:50	3
878	http://pinterest.com?client=g	43	enim. Curabitur massa. Vestibulum accumsan	2023-05-20 06:40:34	2
879	https://pinterest.com?ab=441&aad=2	76	bibendum. Donec felis orci, adipiscing	2022-11-16 12:43:44	1
880	https://reddit.com?q=tedst	47	nec ante blandit viverra. Donec	2022-05-31 04:51:14	3
881	http://nytimes.com?q=4	17	Pellentesque ultricies dignissim lacus. Aliquam	2023-06-14 12:41:10	1
882	http://cnn.com?q=4	83	ipsum non arcu. Vivamus sit	2023-04-22 01:20:10	2
883	https://youtube.com?q=4	51	ullamcorper viverra. Maecenas iaculis aliquet	2023-05-09 02:24:11	3
884	http://cnn.com?p=8	23	elit. Aliquam auctor, velit eget	2022-11-18 02:24:53	2
885	http://instagram.com?q=11	95	a, enim. Suspendisse aliquet, sem	2023-03-28 05:06:12	2
886	https://whatsapp.com?k=0	63	parturient montes, nascetur ridiculus mus.	2022-11-23 07:54:35	1
887	https://zoom.us?g=1	13	eleifend. Cras sed leo. Cras	2023-01-12 05:46:52	1
888	https://youtube.com?g=1	68	augue malesuada malesuada. Integer id	2022-09-25 05:52:18	2
889	http://pinterest.com?search=1&q=de	84	posuere at, velit. Cras lorem	2021-09-16 02:40:52	3
890	https://pinterest.com?gi=100	72	imperdiet non, vestibulum nec, euismod	2022-01-27 12:50:36	1
891	http://yahoo.com?gi=100	74	Duis cursus, diam at pretium	2022-07-08 11:17:44	2
892	https://zoom.us?q=4	71	nunc interdum feugiat. Sed nec	2022-09-02 12:15:31	1
893	https://zoom.us?page=1&offset=1	87	quis, pede. Suspendisse dui. Fusce	2022-04-19 09:19:45	2
894	https://reddit.com?q=test	57	vestibulum nec, euismod in, dolor.	2023-03-10 11:28:05	2
895	http://wikipedia.org?q=4	78	egestas hendrerit neque. In ornare	2022-06-19 11:34:26	3
896	http://facebook.com?search=1&q=de	52	Donec sollicitudin adipiscing ligula. Aenean	2022-11-20 04:14:55	2
897	http://nytimes.com?client=g	10	amet ultricies sem magna nec	2022-06-15 07:50:01	1
898	https://cnn.com?search=1	60	Quisque imperdiet, erat nonummy ultricies	2023-05-27 03:21:48	3
899	http://guardian.co.uk?search=1	26	est. Nunc ullamcorper, velit in	2022-09-13 06:32:53	3
900	http://pinterest.com?q=test	78	dignissim tempor arcu. Vestibulum ut	2023-06-13 09:13:39	1
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.users (id, first_name, last_name, email, phone, main_photo_id, created_at) FROM stdin;
1	Hoyt	Morrison	est.congue@protonmail.com	1-205-455-0305	9	2021-09-28 00:00:00
2	Christopher	Lucas	fringilla.porttitor@google.ca	1-347-311-2180	7	2023-06-19 00:00:00
3	Hector	Gonzalez	cum.sociis.natoque@google.com	439-2617	4	2022-02-19 00:00:00
4	Chanda	Brock	augue@aol.ca	1-200-283-8520	5	2022-09-09 00:00:00
5	Yuli	Malone	tempor.erat@yahoo.edu	1-852-787-8081	2	2023-02-22 00:00:00
6	Arsenio	Long	imperdiet.erat@google.com	1-278-785-6388	7	2023-01-13 00:00:00
7	Jelani	Cotton	nulla.ante@google.edu	1-625-326-8587	7	2022-10-26 00:00:00
8	Jada	Walker	molestie.tortor.nibh@outlook.org	1-805-565-2084	2	2021-08-27 00:00:00
9	Hillary	Kirby	a.tortor.nunc@yahoo.edu	682-0950	7	2021-08-23 00:00:00
10	Haley	Mckay	nullam@yahoo.com	672-7382	8	2022-05-25 00:00:00
11	Xyla	Stephens	ligula@icloud.net	1-383-586-7777	6	2022-01-08 00:00:00
12	Alyssa	Sparks	fusce.aliquet@google.edu	864-7826	1	2021-09-04 00:00:00
13	Zenaida	Potter	lectus.sit.amet@yahoo.couk	884-3790	2	2022-03-18 00:00:00
14	Ori	Hobbs	pulvinar.arcu@yahoo.couk	1-863-373-0099	7	2022-08-26 00:00:00
15	Connor	Stanley	a@outlook.couk	766-1448	9	2023-04-26 00:00:00
16	Carly	Ross	a.aliquet@yahoo.com	344-7856	4	2022-06-08 00:00:00
17	Eugenia	Estrada	facilisi@google.com	858-7712	4	2022-06-25 00:00:00
18	Nayda	Reynolds	non.dui@outlook.com	1-622-285-8507	4	2022-07-18 00:00:00
19	Brett	Griffin	aliquet.metus@protonmail.ca	246-7643	8	2023-01-24 00:00:00
20	Larissa	Salinas	in.faucibus@protonmail.net	781-2482	9	2022-10-11 00:00:00
21	Jonas	Zimmerman	erat.eget@aol.net	943-4682	6	2022-05-02 00:00:00
22	Gannon	Britt	aenean.massa@outlook.ca	826-5767	1	2022-10-29 00:00:00
23	Dai	Rodgers	libero.morbi@icloud.edu	1-522-821-1355	2	2023-03-21 00:00:00
24	Penelope	Moran	amet.luctus@protonmail.ca	1-658-736-4488	1	2023-05-30 00:00:00
25	Troy	Dotson	dignissim.magna.a@aol.com	911-6221	2	2022-05-07 00:00:00
26	Aaron	Booker	quis@hotmail.net	1-848-859-2904	5	2023-01-03 00:00:00
27	Dorian	Miranda	a.malesuada@protonmail.couk	492-6743	10	2022-08-25 00:00:00
28	Tanek	Wood	sed.nunc@outlook.net	228-7989	7	2023-04-25 00:00:00
29	Teagan	Payne	ipsum.dolor@hotmail.org	1-342-588-4468	7	2022-03-07 00:00:00
30	Kristen	Parsons	fringilla.mi@yahoo.couk	767-1656	6	2022-11-05 00:00:00
31	Zeus	Hayes	malesuada.integer@outlook.net	1-144-220-5129	7	2022-06-03 00:00:00
32	Len	Grimes	sagittis.semper@outlook.com	1-482-531-5858	5	2022-03-29 00:00:00
33	Violet	Evans	neque.sed@protonmail.couk	1-668-439-1367	4	2022-01-26 00:00:00
34	Yoshi	Mckenzie	ac.turpis@aol.com	463-5288	3	2022-04-15 00:00:00
35	Vincent	Salazar	magna.malesuada@outlook.com	1-854-185-4945	7	2022-12-17 00:00:00
36	Kessie	Pope	vehicula@google.couk	1-237-107-5561	1	2023-08-01 00:00:00
37	Aphrodite	Perkins	felis.eget@yahoo.edu	877-6506	6	2022-05-28 00:00:00
38	Gretchen	Williamson	nisl.arcu@protonmail.couk	278-6816	3	2021-09-23 00:00:00
39	Christine	Blackburn	enim.mauris@outlook.couk	1-583-504-2107	4	2022-04-21 00:00:00
40	Carolyn	Whitehead	at.risus@google.org	845-2537	8	2023-07-08 00:00:00
41	Jonah	Bruce	aliquet.molestie@outlook.edu	738-3907	6	2022-10-26 00:00:00
42	Linus	Jackson	mi.lacinia@yahoo.net	142-3694	6	2022-09-08 00:00:00
43	Christen	Tate	maecenas@yahoo.org	1-116-294-4573	8	2022-09-01 00:00:00
44	Denton	Macias	sem.egestas@aol.org	714-0538	4	2023-05-15 00:00:00
45	Martin	Rhodes	habitant@outlook.ca	793-5781	7	2023-02-01 00:00:00
46	Erich	Mason	ultrices.posuere@icloud.net	666-3742	3	2023-05-23 00:00:00
47	Shelby	Freeman	magna.ut@icloud.net	1-661-850-7321	5	2022-04-16 00:00:00
48	Dominique	Cook	massa@google.com	1-678-876-4942	8	2022-08-21 00:00:00
49	Avye	Vincent	ac.urna@google.couk	487-5447	10	2022-09-13 00:00:00
50	Kylynn	Knox	augue.malesuada@hotmail.net	1-613-412-1654	1	2023-06-02 00:00:00
51	Vance	Lyons	donec.felis@yahoo.ca	863-5268	4	2022-07-11 00:00:00
52	Nevada	Day	turpis@icloud.edu	1-928-137-8415	6	2022-12-09 00:00:00
53	Lamar	Austin	vulputate.nisi@google.edu	531-8388	2	2022-11-12 00:00:00
54	Rhonda	Alford	luctus@google.org	716-7168	2	2022-04-24 00:00:00
55	Gil	Maynard	imperdiet@icloud.edu	1-732-771-8202	1	2022-04-08 00:00:00
56	Cedric	Flynn	commodo.tincidunt@icloud.org	1-852-470-6773	8	2021-11-30 00:00:00
57	Heather	Zamora	sit.amet@hotmail.edu	1-805-588-7276	4	2021-10-15 00:00:00
58	Virginia	Ware	aliquam@aol.edu	445-3972	5	2023-03-24 00:00:00
59	Yvonne	Gregory	lorem@outlook.net	329-8314	9	2022-04-12 00:00:00
60	Candace	Reynolds	ante.dictum@outlook.edu	1-246-324-0080	1	2022-01-26 00:00:00
61	Devin	Gibson	vel.arcu@aol.ca	1-824-657-5671	7	2022-02-28 00:00:00
62	Noble	Mendoza	nam.porttitor@yahoo.com	163-8486	5	2022-04-12 00:00:00
63	Mannix	Warren	orci.in@hotmail.org	324-1752	10	2021-11-29 00:00:00
64	Norman	Harrison	conubia.nostra.per@google.org	1-678-451-5127	7	2022-08-03 00:00:00
65	Josephine	Hughes	eleifend@google.net	507-8359	3	2022-08-24 00:00:00
66	Cadman	Mckay	aliquam@hotmail.net	655-3328	8	2023-03-05 00:00:00
67	Scott	Watts	adipiscing.elit@aol.com	611-7542	4	2021-11-27 00:00:00
68	Olivia	Williams	aliquam.iaculis@hotmail.edu	124-7277	7	2022-04-04 00:00:00
69	Luke	West	aliquam.nisl@outlook.couk	652-7723	9	2022-12-24 00:00:00
70	Denton	Padilla	neque.et@icloud.ca	772-1458	10	2021-09-03 00:00:00
71	Ivor	Christensen	morbi@outlook.edu	185-0346	1	2023-08-13 00:00:00
72	Ulla	Brooks	non.cursus@protonmail.net	864-2012	6	2023-02-20 00:00:00
73	Rebekah	Woodward	sapien.gravida.non@protonmail.couk	1-651-257-5617	7	2021-12-29 00:00:00
74	Burton	Talley	diam.vel.arcu@icloud.edu	1-956-794-4483	8	2021-10-01 00:00:00
75	Ina	Young	sit@icloud.ca	1-230-813-5344	7	2021-09-15 00:00:00
76	Ferdinand	Pratt	a.dui.cras@aol.net	1-414-460-4595	2	2023-03-18 00:00:00
77	Chester	Oliver	et.ultrices.posuere@google.org	355-3651	4	2023-01-19 00:00:00
78	Joan	Riggs	lacus.vestibulum.lorem@yahoo.couk	1-601-582-2632	9	2022-07-02 00:00:00
79	Hedda	Ward	nulla@aol.com	663-2412	7	2022-09-09 00:00:00
80	Dieter	Olsen	non@aol.org	686-2264	9	2022-09-30 00:00:00
81	Sara	Cooke	sagittis.placerat@protonmail.com	1-484-641-4174	9	2022-09-05 00:00:00
82	Mariam	Warner	in.faucibus@aol.com	1-174-322-2342	2	2023-04-13 00:00:00
83	Sigourney	Hayes	elit.pellentesque@hotmail.couk	375-2245	1	2023-07-05 00:00:00
84	Kyle	Vincent	feugiat.metus@protonmail.com	1-283-424-0947	1	2021-09-24 00:00:00
85	Tucker	Herring	odio.vel@hotmail.couk	820-7832	6	2021-09-08 00:00:00
86	Megan	Fitzpatrick	sapien.molestie.orci@aol.org	1-986-365-2361	3	2022-08-28 00:00:00
87	Carly	Maddox	facilisis@aol.com	254-6718	2	2022-07-17 00:00:00
88	Colton	Holder	velit.eget.laoreet@aol.couk	1-428-234-3188	9	2022-12-04 00:00:00
89	Vernon	Estrada	placerat@yahoo.net	502-5459	6	2022-12-22 00:00:00
90	Lillith	Gaines	nec.quam.curabitur@aol.org	1-848-831-1652	2	2023-03-20 00:00:00
91	Geraldine	Albert	ac@yahoo.couk	1-516-478-6158	9	2022-09-04 00:00:00
92	Jordan	Snyder	ac@protonmail.org	1-399-680-5245	8	2023-02-28 00:00:00
93	Brennan	Copeland	mi.aliquam@google.com	1-296-872-7835	3	2022-09-10 00:00:00
94	Germaine	Vargas	ridiculus.mus@yahoo.org	444-1471	4	2022-12-05 00:00:00
95	Driscoll	Lang	in.faucibus@yahoo.com	888-6348	9	2023-04-18 00:00:00
96	Laurel	Powell	blandit@google.org	1-842-369-2114	4	2023-03-09 00:00:00
97	Henry	Mclaughlin	posuere.cubilia.curae@yahoo.com	1-959-251-7468	5	2021-10-25 00:00:00
98	Damon	Grimes	suspendisse.sed@icloud.net	1-322-411-6607	8	2022-04-18 00:00:00
99	Samantha	Riggs	ante.dictum@yahoo.com	1-875-731-7445	4	2022-03-16 00:00:00
100	Aiko	Luna	laoreet.ipsum@aol.net	1-835-220-7396	4	2022-01-13 00:00:00
\.


--
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: gb_user
--

COPY public.video (id, url, owner_id, description, uploaded_at, size) FROM stdin;
191	http://reddit.com/settings?client=g	47	urna. Ut tincidunt vehicula risus.	2022-08-19 12:56:44	2
192	http://cnn.com/site?search=1	21	arcu iaculis enim, sit amet	2022-10-08 08:29:56	2
193	http://facebook.com/settings?gi=100	16	ac metus vitae velit egestas	2022-04-15 02:27:53	2
194	http://facebook.com/user/110?page=1&offset=1	61	Pellentesque ut ipsum ac mi	2023-07-30 03:10:17	2
195	http://bbc.co.uk/site?ad=115	59	lectus convallis est, vitae sodales	2022-03-20 08:18:13	2
196	http://whatsapp.com/fr?gi=100	35	fermentum fermentum arcu. Vestibulum ante	2022-11-05 02:32:57	1
197	https://whatsapp.com/sub/cars?k=0	25	netus et malesuada fames ac	2023-01-08 08:29:28	1
198	http://whatsapp.com/one?client=g	68	lacus. Quisque imperdiet, erat nonummy	2023-04-20 05:29:29	2
199	http://zoom.us/group/9?search=1	97	urna et arcu imperdiet ullamcorper.	2022-01-05 11:21:03	2
200	https://yahoo.com/user/110?g=1	78	consectetuer rhoncus. Nullam velit dui,	2021-09-15 01:35:23	2
350	http://facebook.com/sub?search=1	55	risus. Donec nibh enim, gravida	2022-10-19 01:44:20	2
351	http://google.com/one?ab=441&aad=2	23	In tincidunt congue turpis. In	2023-05-25 04:12:28	1
352	http://ebay.com/fr?ad=115	25	Duis at lacus. Quisque purus	2022-04-13 05:54:58	3
353	https://netflix.com/group/9?page=1&offset=1	65	tortor nibh sit amet orci.	2023-01-14 04:06:56	3
354	https://reddit.com/group/9?str=se	18	sed libero. Proin sed turpis	2022-10-19 02:08:56	3
355	https://whatsapp.com/one?client=g	2	facilisi. Sed neque. Sed eget	2021-10-05 07:51:44	2
356	http://zoom.us/group/9?gi=100	81	condimentum eget, volutpat ornare, facilisis	2023-03-20 09:01:30	2
357	http://walmart.com/settings?gi=100	9	lorem, auctor quis, tristique ac,	2022-09-14 11:02:41	2
358	https://pinterest.com/group/9?search=1&q=de	3	elit fermentum risus, at fringilla	2022-05-19 08:09:23	2
359	https://twitter.com/settings?search=1	7	aliquet libero. Integer in magna.	2022-06-06 10:06:42	3
360	https://cnn.com/one?q=11	95	molestie tellus. Aenean egestas hendrerit	2022-11-28 04:37:14	1
361	http://google.com/sub?ab=441&aad=2	57	id, erat. Etiam vestibulum massa	2023-06-04 05:13:17	2
362	http://pinterest.com/fr?p=8	1	sit amet ultricies sem magna	2021-10-10 09:42:05	2
363	https://reddit.com/en-us?search=1&q=de	56	risus. Duis a mi fringilla	2022-07-04 02:32:12	2
364	http://wikipedia.org/user/110?q=test	55	Suspendisse tristique neque venenatis lacus.	2022-05-07 05:47:16	3
365	http://twitter.com/settings?ab=441&aad=2	51	non quam. Pellentesque habitant morbi	2022-10-24 05:59:08	2
366	https://zoom.us/en-us?g=1	67	Etiam laoreet, libero et tristique	2023-07-03 05:18:35	2
367	http://zoom.us/sub/cars?search=1&q=de	71	mollis. Duis sit amet diam	2022-10-02 12:10:59	3
368	http://ebay.com/en-ca?ab=441&aad=2	8	ipsum dolor sit amet, consectetuer	2021-12-11 09:07:36	2
369	https://reddit.com/user/110?q=test	49	Cum sociis natoque penatibus et	2021-10-24 06:34:32	3
370	https://bbc.co.uk/en-ca?k=0	7	amet luctus vulputate, nisi sem	2022-05-30 10:05:14	2
371	http://netflix.com/en-us?g=1	74	pede nec ante blandit viverra.	2021-10-14 03:15:00	1
372	http://zoom.us/sub/cars?k=0	85	dapibus quam quis diam. Pellentesque	2023-06-15 01:25:19	2
373	http://bbc.co.uk/group/9?ab=441&aad=2	59	feugiat tellus lorem eu metus.	2022-06-19 07:44:39	2
374	https://instagram.com/fr?page=1&offset=1	5	dictum. Proin eget odio. Aliquam	2023-05-23 09:55:38	1
375	https://reddit.com/site?str=se	54	gravida molestie arcu. Sed eu	2022-01-22 01:09:35	2
376	https://ebay.com/sub/cars?search=1	11	convallis ligula. Donec luctus aliquet	2022-01-13 07:20:09	2
377	https://walmart.com/site?q=4	89	pretium et, rutrum non, hendrerit	2022-04-12 10:20:49	1
378	https://ebay.com/en-ca?search=1&q=de	59	Quisque tincidunt pede ac urna.	2022-03-05 12:32:17	3
379	http://guardian.co.uk/settings?q=11	76	posuere cubilia Curae Phasellus ornare.	2023-04-22 10:42:10	3
380	http://google.com/settings?g=1	48	Nullam vitae diam. Proin dolor.	2022-09-03 07:27:23	2
381	http://nytimes.com/fr?q=4	26	augue scelerisque mollis. Phasellus libero	2022-02-03 02:39:01	2
382	http://youtube.com/en-us?q=4	83	Vestibulum ante ipsum primis in	2022-06-08 09:03:08	1
383	https://ebay.com/en-ca?str=se	10	dictum augue malesuada malesuada. Integer	2023-01-25 10:07:42	2
384	https://walmart.com/user/110?q=11	5	Aenean gravida nunc sed pede.	2022-04-08 02:28:21	1
385	https://youtube.com/fr?p=8	91	mauris id sapien. Cras dolor	2023-02-08 05:46:51	2
386	http://wikipedia.org/sub?q=0	66	in faucibus orci luctus et	2022-02-28 04:23:47	1
387	https://instagram.com/sub/cars?q=0	29	luctus. Curabitur egestas nunc sed	2022-04-06 01:07:25	1
388	https://nytimes.com/user/110?q=0	70	dui. Suspendisse ac metus vitae	2022-09-17 09:40:26	2
389	http://youtube.com/site?q=test	43	elementum sem, vitae aliquam eros	2023-08-09 08:58:16	2
390	https://instagram.com/en-us?k=0	43	at augue id ante dictum	2023-03-13 03:53:26	3
391	https://zoom.us/sub/cars?str=se	85	dictum ultricies ligula. Nullam enim.	2023-05-20 03:04:31	3
392	https://netflix.com/site?ab=441&aad=2	100	Aliquam erat volutpat. Nulla facilisis.	2022-10-22 04:53:24	2
393	http://netflix.com/user/110?client=g	21	non justo. Proin non massa	2022-07-23 04:30:15	2
394	https://youtube.com/group/9?q=4	45	vitae, sodales at, velit. Pellentesque	2023-02-14 04:13:11	2
395	https://youtube.com/user/110?gi=100	62	Fusce mi lorem, vehicula et,	2022-05-10 02:01:25	2
396	http://netflix.com/group/9?client=g	95	Proin nisl sem, consequat nec,	2021-10-14 08:48:47	2
397	http://netflix.com/one?k=0	50	rutrum. Fusce dolor quam, elementum	2022-02-14 12:12:26	2
398	https://google.com/one?search=1	37	facilisi. Sed neque. Sed eget	2022-02-26 07:50:12	2
399	https://guardian.co.uk/sub/cars?client=g	73	ligula tortor, dictum eu, placerat	2022-07-12 03:25:36	2
400	https://pinterest.com/en-ca?k=0	65	feugiat. Sed nec metus facilisis	2022-06-12 04:19:07	2
401	https://naver.com/one?g=1	10	rutrum non, hendrerit id, ante.	2022-04-25 02:18:02	1
402	http://pinterest.com/sub/cars?q=11	30	fringilla est. Mauris eu turpis.	2023-07-26 08:59:27	2
403	https://facebook.com/site?q=4	35	mauris. Suspendisse aliquet molestie tellus.	2022-07-31 03:53:10	2
404	http://cnn.com/en-ca?client=g	73	eu, ligula. Aenean euismod mauris	2023-02-01 02:22:52	1
405	http://wikipedia.org/sub/cars?ad=115	27	ligula. Nullam enim. Sed nulla	2021-12-27 07:33:00	3
406	http://zoom.us/settings?p=8	98	mauris ut mi. Duis risus	2022-07-05 05:04:59	2
407	http://netflix.com/site?q=4	39	Proin eget odio. Aliquam vulputate	2023-07-06 10:51:01	2
408	http://whatsapp.com/user/110?g=1	40	Donec feugiat metus sit amet	2023-06-19 03:42:11	3
409	https://cnn.com/fr?p=8	24	enim, condimentum eget, volutpat ornare,	2022-05-05 08:16:22	2
410	http://twitter.com/sub?gi=100	67	et magnis dis parturient montes,	2022-06-07 04:00:46	3
411	https://zoom.us/sub?k=0	83	primis in faucibus orci luctus	2021-09-13 04:27:59	1
412	https://ebay.com/sub/cars?q=0	17	erat, in consectetuer ipsum nunc	2023-01-29 06:24:24	2
413	http://netflix.com/user/110?client=gw	37	risus. Nunc ac sem ut	2021-12-09 04:39:09	1
414	http://nytimes.com/user/110?k=0	94	purus mauris a nunc. In	2023-07-06 03:30:51	2
415	https://wikipedia.org/one?k=0	57	Fusce mollis. Duis sit amet	2021-09-20 10:34:10	2
416	https://zoom.us/en-ca?q=0	99	Sed id risus quis diam	2023-01-02 01:52:38	1
417	https://youtube.com/group/9?client=g	96	Nunc ut erat. Sed nunc	2023-05-11 11:12:50	2
418	http://reddit.com/user/110?client=g	65	Sed eget lacus. Mauris non	2022-04-01 05:03:06	3
419	http://bbc.co.uk/sub?k=0	8	pellentesque, tellus sem mollis dui,	2023-04-05 11:00:15	3
420	http://bbc.co.uk/settings?q=test	57	dolor. Fusce mi lorem, vehicula	2022-01-07 02:30:30	2
421	http://youtube.com/sub/cars?q=0	51	enim. Etiam imperdiet dictum magna.	2022-01-15 07:53:35	3
422	https://naver.com/site?str=se	41	adipiscing ligula. Aenean gravida nunc	2023-03-05 03:49:42	2
423	https://youtube.com/en-ca?page=1&offset=1	80	sit amet risus. Donec egestas.	2022-01-13 02:40:36	3
424	https://google.com/one?q=test	43	Maecenas iaculis aliquet diam. Sed	2022-12-28 08:23:47	3
425	https://instagram.com/en-ca?gi=100	88	Integer urna. Vivamus molestie dapibus	2023-02-14 03:50:36	1
426	https://bbc.co.uk/settings?ab=441&aad=2	94	malesuada id, erat. Etiam vestibulum	2023-04-16 01:08:03	1
427	https://google.com/one?k=0	40	Sed id risus quis diam	2021-10-14 05:36:10	3
428	https://whatsapp.com/group/9?client=g	42	nulla. Cras eu tellus eu	2022-01-20 09:55:45	3
429	http://bbc.co.uk/fr?q=0	91	tristique senectus et netus et	2021-11-18 02:25:20	1
430	http://instagram.com/sub/cars?q=0	93	Ut tincidunt orci quis lectus.	2021-09-30 08:12:41	3
431	http://baidu.com/sub/cars?search=1	25	arcu iaculis enim, sit amet	2021-09-16 05:19:40	3
432	https://youtube.com/en-ca?q=0	24	semper et, lacinia vitae, sodales	2022-12-04 05:53:22	2
433	https://reddit.com/site?search=1&q=de	50	Aenean gravida nunc sed pede.	2021-11-03 08:16:29	1
434	https://zoom.us/one?k=0	73	orci luctus et ultrices posuere	2021-11-24 08:01:17	2
435	http://netflix.com/site?str=se	52	lorem fringilla ornare placerat, orci	2023-07-23 06:07:31	2
436	http://bbc.co.uk/group/9?search=1	75	morbi tristique senectus et netus	2023-06-16 03:17:34	2
437	https://whatsapp.com/group/9?ab=441&aad=2	98	libero. Proin sed turpis nec	2023-01-20 12:37:57	2
\.


--
-- Name: communities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.communities_id_seq', 170, true);


--
-- Name: friendship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_id_seq', 120, true);


--
-- Name: friendship_statuses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.friendship_statuses_id_seq', 5, true);


--
-- Name: messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.messages_id_seq', 100, true);


--
-- Name: photo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.photo_id_seq', 900, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gb_user
--

SELECT pg_catalog.setval('public.video_id_seq', 437, true);


--
-- Name: communities communities_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_name_key UNIQUE (name);


--
-- Name: communities communities_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities
    ADD CONSTRAINT communities_pkey PRIMARY KEY (id);


--
-- Name: communities_users communities_users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.communities_users
    ADD CONSTRAINT communities_users_pkey PRIMARY KEY (community_id, user_id);


--
-- Name: friendship friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship
    ADD CONSTRAINT friendship_pkey PRIMARY KEY (id);


--
-- Name: friendship_statuses friendship_statuses_name_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_name_key UNIQUE (name);


--
-- Name: friendship_statuses friendship_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.friendship_statuses
    ADD CONSTRAINT friendship_statuses_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: photo photo_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (id);


--
-- Name: photo photo_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.photo
    ADD CONSTRAINT photo_url_key UNIQUE (url);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id);


--
-- Name: video video_url_key; Type: CONSTRAINT; Schema: public; Owner: gb_user
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_url_key UNIQUE (url);


--
-- PostgreSQL database dump complete
--

