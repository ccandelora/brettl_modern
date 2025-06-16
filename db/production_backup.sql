--
-- PostgreSQL database dump
--

-- Dumped from database version 15.12 (Homebrew)
-- Dumped by pg_dump version 15.12 (Homebrew)

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
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: action_text_rich_texts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.action_text_rich_texts (
    id bigint NOT NULL,
    name character varying NOT NULL,
    body text,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.action_text_rich_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.action_text_rich_texts_id_seq OWNED BY public.action_text_rich_texts.id;


--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    service_name character varying NOT NULL,
    byte_size bigint NOT NULL,
    checksum character varying,
    created_at timestamp(6) without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: active_storage_variant_records; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_variant_records (
    id bigint NOT NULL,
    blob_id bigint NOT NULL,
    variation_digest character varying NOT NULL
);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_variant_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_variant_records_id_seq OWNED BY public.active_storage_variant_records.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ckeditor_assets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ckeditor_assets (
    id bigint NOT NULL,
    data_file_name character varying NOT NULL,
    data_content_type character varying,
    data_file_size integer,
    data_fingerprint character varying,
    type character varying(30),
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ckeditor_assets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ckeditor_assets_id_seq OWNED BY public.ckeditor_assets.id;


--
-- Name: notes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.notes (
    id integer NOT NULL,
    title character varying,
    description character varying,
    message character varying,
    "order" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.notes_id_seq OWNED BY public.notes.id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    title character varying,
    text text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: public_pins; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.public_pins (
    id integer NOT NULL,
    description character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer
);


--
-- Name: public_pins_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.public_pins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: public_pins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.public_pins_id_seq OWNED BY public.public_pins.id;


--
-- Name: reservation_weeks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservation_weeks (
    id integer NOT NULL,
    note text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    res_date date
);


--
-- Name: reservation_weeks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservation_weeks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reservation_weeks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservation_weeks_id_seq OWNED BY public.reservation_weeks.id;


--
-- Name: reservations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.reservations (
    id integer NOT NULL,
    name character varying,
    wed boolean,
    thur boolean,
    fri boolean,
    sat boolean,
    sun boolean,
    mon boolean,
    tue boolean,
    dinner boolean,
    comment text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    reservation_week_id integer,
    sex character varying,
    res_member_type character varying,
    reservation_date date,
    confirmation_number character varying
);


--
-- Name: reservations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.reservations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reservations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.reservations_id_seq OWNED BY public.reservations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    role integer,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: action_text_rich_texts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts ALTER COLUMN id SET DEFAULT nextval('public.action_text_rich_texts_id_seq'::regclass);


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: active_storage_variant_records id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records ALTER COLUMN id SET DEFAULT nextval('public.active_storage_variant_records_id_seq'::regclass);


--
-- Name: ckeditor_assets id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ckeditor_assets ALTER COLUMN id SET DEFAULT nextval('public.ckeditor_assets_id_seq'::regclass);


--
-- Name: notes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notes ALTER COLUMN id SET DEFAULT nextval('public.notes_id_seq'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: public_pins id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.public_pins ALTER COLUMN id SET DEFAULT nextval('public.public_pins_id_seq'::regclass);


--
-- Name: reservation_weeks id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservation_weeks ALTER COLUMN id SET DEFAULT nextval('public.reservation_weeks_id_seq'::regclass);


--
-- Name: reservations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations ALTER COLUMN id SET DEFAULT nextval('public.reservations_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2017-08-22 21:27:08.693191	2025-06-16 16:11:17.320087
\.


--
-- Data for Name: ckeditor_assets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ckeditor_assets (id, data_file_name, data_content_type, data_file_size, data_fingerprint, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: notes; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.notes (id, title, description, message, "order", created_at, updated_at) FROM stdin;
8	EICSL Discounts		<p>All EICSL members are eligible for discounts at ski resorts, restaurants, shops, hotels,&nbsp;and more! &nbsp;Just show your current EICSL membership card at the listed merchants for a discount.</p>\r\n\r\n<ul>\r\n\t<li><a href="http://www.eicsl.org/discounts-ski--sports-equipment.html"><strong>Ski &amp; Sports Equipment</strong></a></li>\r\n\t<li><strong><a href="http://www.eicsl.org/discounts-lodging.html">Lodging</a></strong></li>\r\n\t<li><strong><a href="http://www.eicsl.org/discounts-restaurants.html">Restaurants</a></strong></li>\r\n\t<li><strong><a href="http://www.eicsl.org/discounts-misc-vendors--services.html">Miscellaneous Vendors &amp; Services</a></strong></li>\r\n</ul>\r\n\r\n<p><strong>Source: &nbsp;</strong><a href="http://www.eicsl.org">www.eicsl.org</a></p>\r\n	0	2018-06-22 20:24:07.734055	2018-06-22 20:24:07.734055
13	Lodge Rules		<p><a href="https://www.brettl.org/LodgeRules_Bylaws-12-21-21.pdf">Click here for the lodge rules </a></p>\r\n	\N	2022-01-19 23:27:37.139638	2022-01-20 00:19:26.751273
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.pages (id, title, text, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: public_pins; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.public_pins (id, description, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: reservation_weeks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reservation_weeks (id, note, created_at, updated_at, res_date) FROM stdin;
1	test	2017-08-22 21:52:51.542001	2017-08-22 21:52:51.542001	2017-08-23
29	\N	2018-05-16 21:40:27.806135	2018-05-16 21:40:27.806135	2018-05-16
2	First Work Weekend!!!	2017-10-09 20:15:23.143221	2017-10-09 20:46:50.108774	2017-10-18
3	Test	2017-10-09 20:47:09.464711	2017-10-09 20:47:09.464711	2017-10-11
4	\N	2017-10-09 21:13:13.606859	2017-10-09 21:13:13.606859	2017-11-01
5	Work Weekend #2	2017-10-20 16:10:03.204157	2017-10-24 18:55:46.022295	2017-10-25
6	\N	2017-10-27 01:51:07.387096	2017-10-27 01:51:07.387096	2017-11-22
7	\N	2017-10-31 01:39:55.298949	2017-10-31 01:39:55.298949	2017-12-06
8	\N	2017-11-14 02:11:40.583942	2017-11-14 02:11:40.583942	2017-11-15
9	\N	2017-11-15 16:49:43.620694	2017-11-15 16:49:43.620694	2017-11-29
10	\N	2017-11-15 16:50:40.061184	2017-11-15 16:50:40.061184	2017-12-13
11	\N	2017-11-15 16:51:09.170124	2017-11-15 16:51:09.170124	2017-12-20
12	\N	2017-11-15 16:51:39.726463	2017-11-15 16:51:39.726463	2017-12-27
13	\N	2017-11-28 21:17:56.952158	2017-11-28 21:17:56.952158	2018-01-03
14	\N	2017-12-13 18:28:47.105205	2017-12-13 18:28:47.105205	2018-01-10
15	\N	2017-12-13 18:29:27.56315	2017-12-13 18:29:27.56315	2018-01-24
16	\N	2018-01-08 15:35:02.480663	2018-01-08 15:35:02.480663	2018-02-07
17	\N	2018-01-08 16:24:23.818283	2018-01-08 16:24:23.818283	2018-01-17
18	\N	2018-01-08 19:55:29.736391	2018-01-08 19:55:29.736391	2018-01-31
19	\N	2018-01-31 00:38:31.008487	2018-01-31 00:38:31.008487	2018-02-14
20	\N	2018-01-31 00:39:49.475732	2018-01-31 00:39:49.475732	2018-02-21
21	\N	2018-02-01 11:34:07.15021	2018-02-01 11:34:07.15021	2018-03-21
22	\N	2018-02-12 16:03:24.958071	2018-02-12 16:03:24.958071	2018-02-28
23	\N	2018-02-13 19:28:28.504854	2018-02-13 19:28:28.504854	2018-03-14
24	\N	2018-02-27 22:25:51.818839	2018-02-27 22:25:51.818839	2018-03-07
25	\N	2018-03-07 15:35:20.719315	2018-03-07 15:35:20.719315	2018-04-04
26	\N	2018-03-07 15:37:06.351599	2018-03-07 15:37:06.351599	2018-03-28
27	\N	2018-04-10 13:40:59.127093	2018-04-10 13:40:59.127093	2018-04-11
28	\N	2018-04-12 00:53:05.613896	2018-04-12 00:53:05.613896	2018-05-02
30	\N	2018-06-14 02:29:17.647774	2018-06-14 02:29:17.647774	2018-07-11
31	\N	2018-06-22 15:21:54.254001	2018-06-22 15:21:54.254001	2018-07-18
64	\N	2018-06-22 18:19:24.507413	2018-06-22 18:19:24.507413	2018-07-04
65	\N	2018-06-24 17:55:02.530554	2018-06-24 17:55:02.530554	2018-06-27
66	\N	2018-07-05 13:56:04.34894	2018-07-05 13:56:04.34894	2018-08-08
67	\N	2018-07-05 13:56:52.815423	2018-07-05 13:56:52.815423	2018-08-15
68	\N	2018-08-30 00:18:58.616858	2018-08-30 00:18:58.616858	2018-08-29
69	\N	2018-09-12 21:02:43.324596	2018-09-12 21:02:43.324596	2018-09-12
70	\N	2018-09-12 21:04:28.934017	2018-09-12 21:04:28.934017	2018-10-03
71	\N	2018-09-16 05:55:07.646245	2018-09-16 05:55:07.646245	2018-10-10
72	\N	2018-09-24 18:10:51.033331	2018-09-24 18:10:51.033331	2018-10-24
73	\N	2018-10-16 01:16:57.201923	2018-10-16 01:16:57.201923	2018-12-05
74	\N	2018-10-16 01:19:43.408414	2018-10-16 01:19:43.408414	2018-11-21
106	\N	2018-10-22 14:27:13.698974	2018-10-22 14:27:13.698974	2018-11-14
107	\N	2018-11-19 19:04:32.53601	2018-11-19 19:04:32.53601	2018-11-28
108	\N	2018-11-19 19:05:46.769619	2018-11-19 19:05:46.769619	2018-12-19
109	\N	2018-12-03 20:19:25.846963	2018-12-03 20:19:25.846963	2018-12-12
110	\N	2018-12-06 03:08:11.544271	2018-12-06 03:08:11.544271	2019-01-02
111	\N	2018-12-08 02:37:37.879661	2018-12-08 02:37:37.879661	2018-12-26
112	\N	2018-12-18 19:15:27.984351	2018-12-18 19:15:27.984351	2019-01-09
113	\N	2018-12-18 19:15:48.492452	2018-12-18 19:15:48.492452	2019-01-16
145	\N	2019-01-07 19:09:29.760603	2019-01-07 19:09:29.760603	2019-01-30
146	\N	2019-01-21 12:44:49.033999	2019-01-21 12:44:49.033999	2019-01-23
147	\N	2019-01-22 16:44:28.588205	2019-01-22 16:44:28.588205	2019-02-06
148	\N	2019-01-22 16:45:13.44258	2019-01-22 16:45:13.44258	2019-02-13
149	\N	2019-01-22 16:45:47.923618	2019-01-22 16:45:47.923618	2019-02-20
151	\N	2019-01-22 17:50:12.203062	2019-01-22 17:50:12.203062	2019-03-20
152	\N	2019-02-22 18:34:37.872851	2019-02-22 18:34:37.872851	2019-02-27
153	\N	2019-02-27 19:30:43.781177	2019-02-27 19:30:43.781177	2019-03-06
154	\N	2019-02-27 19:32:15.08091	2019-02-27 19:32:15.08091	2019-03-13
155	\N	2019-02-27 19:33:57.51856	2019-02-27 19:33:57.51856	2019-03-27
156	\N	2019-02-27 19:45:22.190767	2019-02-27 19:45:22.190767	2019-04-10
157	\N	2019-03-13 20:54:21.94018	2019-03-13 20:54:21.94018	2019-04-03
158	\N	2019-04-03 21:57:41.847955	2019-04-03 21:57:41.847955	2019-05-08
160	\N	2019-05-14 15:48:47.497547	2019-05-14 15:48:47.497547	2019-05-15
161	\N	2019-05-14 15:49:30.048902	2019-05-14 15:49:30.048902	2019-05-22
162	\N	2019-05-24 13:32:01.566501	2019-05-24 13:32:01.566501	2019-05-29
164	\N	2019-06-14 13:43:19.544332	2019-06-14 13:43:19.544332	2019-06-19
165	\N	2019-06-24 15:29:42.931403	2019-06-24 15:29:42.931403	2019-07-17
198	\N	2019-06-26 16:10:37.937971	2019-06-26 16:10:37.937971	2019-07-10
199	\N	2019-07-15 20:44:55.148688	2019-07-15 20:44:55.148688	2019-07-24
200	\N	2019-07-22 14:07:45.040106	2019-07-22 14:07:45.040106	2019-07-31
201	\N	2019-07-25 20:19:09.930064	2019-07-25 20:19:09.930064	2019-08-14
202	\N	2019-08-21 16:32:48.493987	2019-08-21 16:32:48.493987	2019-08-28
204	\N	2019-09-08 15:00:42.768934	2019-09-08 15:00:42.768934	2019-09-11
205	\N	2019-09-08 15:01:27.885999	2019-09-08 15:01:27.885999	2019-09-18
207	\N	2019-09-25 14:52:14.362937	2019-09-25 14:52:14.362937	2019-10-23
208	\N	2019-09-25 14:52:55.493561	2019-09-25 14:52:55.493561	2019-10-09
240	\N	2019-10-19 20:04:04.708606	2019-10-19 20:04:04.708606	2019-10-16
241	\N	2019-11-05 10:56:57.141624	2019-11-05 10:56:57.141624	2019-11-27
242	\N	2019-11-05 22:11:41.252304	2019-11-05 22:11:41.252304	2019-12-11
243	\N	2019-11-06 14:04:31.388186	2019-11-06 14:04:31.388186	2019-11-20
244	\N	2019-11-06 14:06:22.649502	2019-11-06 14:06:22.649502	2019-12-18
246	\N	2019-11-07 20:39:53.47702	2019-11-07 20:39:53.47702	2019-12-04
247	\N	2019-11-07 20:42:26.72639	2019-11-07 20:42:26.72639	2019-12-25
248	\N	2019-11-11 01:24:23.208409	2019-11-11 01:24:23.208409	2020-01-01
249	\N	2019-11-11 16:26:12.091526	2019-11-11 16:26:12.091526	2019-11-13
252	\N	2019-11-18 23:49:22.664678	2019-11-18 23:49:22.664678	2020-01-08
254	\N	2019-11-30 18:30:05.51602	2019-11-30 18:30:05.51602	2020-01-15
255	\N	2019-12-07 12:34:35.947982	2019-12-07 12:34:35.947982	2020-01-22
257	\N	2019-12-18 13:53:55.629191	2019-12-18 13:53:55.629191	2020-02-05
258	\N	2019-12-29 21:35:13.560074	2019-12-29 21:35:13.560074	2020-01-29
259	\N	2020-01-06 14:26:27.096056	2020-01-06 14:26:27.096056	2020-02-12
292	\N	2020-01-21 02:20:13.281049	2020-01-21 02:20:13.281049	2020-03-04
293	\N	2020-01-27 15:50:29.984319	2020-01-27 15:50:29.984319	2020-02-19
294	\N	2020-02-12 00:03:45.479584	2020-02-12 00:03:45.479584	2020-03-11
295	\N	2020-02-12 00:05:20.048206	2020-02-12 00:05:20.048206	2020-03-18
296	\N	2020-02-20 02:33:52.3508	2020-02-20 02:33:52.3508	2020-02-26
297	\N	2020-03-05 15:47:47.352387	2020-03-05 15:47:47.352387	2020-03-25
298	\N	2020-10-20 17:12:49.252802	2020-10-20 17:12:49.252802	2020-12-09
299	\N	2020-10-20 17:14:54.15507	2020-10-20 17:14:54.15507	2021-01-06
300	\N	2020-10-20 17:16:30.910007	2020-10-20 17:16:30.910007	2021-02-03
301	\N	2020-10-20 17:18:12.179671	2020-10-20 17:18:12.179671	2021-03-03
302	\N	2020-11-02 13:11:53.323094	2020-11-02 13:11:53.323094	2020-11-11
305	\N	2020-11-16 20:25:37.117551	2020-11-16 20:25:37.117551	2020-12-30
306	\N	2020-11-19 15:33:37.411029	2020-11-19 15:33:37.411029	2020-11-25
307	\N	2020-11-19 15:35:32.20671	2020-11-19 15:35:32.20671	2020-12-23
308	\N	2020-11-22 16:48:58.435495	2020-11-22 16:48:58.435495	2021-04-28
309	\N	2020-12-04 17:28:54.122849	2020-12-04 17:28:54.122849	2020-12-16
310	\N	2020-12-08 00:02:09.255111	2020-12-08 00:02:09.255111	2021-01-20
311	\N	2020-12-10 00:14:37.024928	2020-12-10 00:14:37.024928	2021-01-13
312	\N	2021-01-27 01:22:36.678256	2021-01-27 01:22:36.678256	2021-01-27
313	\N	2021-02-08 15:08:15.784916	2021-02-08 15:08:15.784916	2021-02-10
314	\N	2021-02-08 15:09:08.084801	2021-02-08 15:09:08.084801	2021-02-17
315	\N	2021-02-24 12:54:32.047442	2021-02-24 12:54:32.047442	2021-02-24
316	\N	2021-03-15 14:02:39.877372	2021-03-15 14:02:39.877372	2021-03-17
317	\N	2021-03-15 14:07:11.63044	2021-03-15 14:07:11.63044	2021-03-24
318	\N	2021-04-03 12:59:27.914497	2021-04-03 12:59:27.914497	2021-04-07
319	\N	2021-06-05 16:11:20.10729	2021-06-05 16:11:20.10729	2021-06-02
320	\N	2021-06-05 16:11:36.334722	2021-06-05 16:11:36.334722	2021-07-07
353	\N	2021-06-07 00:44:27.094944	2021-06-07 00:44:27.094944	2021-07-14
354	\N	2021-06-08 20:11:39.375417	2021-06-08 20:11:39.375417	2021-06-23
355	\N	2021-06-08 20:31:25.035145	2021-06-08 20:31:25.035145	2021-06-16
356	\N	2021-06-25 14:15:19.890591	2021-06-25 14:15:19.890591	2021-06-30
357	\N	2021-07-20 03:14:48.840882	2021-07-20 03:14:48.840882	2021-07-21
358	\N	2021-07-27 18:10:19.385227	2021-07-27 18:10:19.385227	2021-07-28
359	\N	2021-08-06 00:32:48.111171	2021-08-06 00:32:48.111171	2021-08-04
360	\N	2021-08-11 12:42:57.919745	2021-08-11 12:42:57.919745	2021-08-11
361	\N	2021-08-16 15:44:53.99822	2021-08-16 15:44:53.99822	2021-08-18
362	\N	2021-08-23 12:18:06.973352	2021-08-23 12:18:06.973352	2021-09-08
363	\N	2021-08-23 19:17:39.002602	2021-08-23 19:17:39.002602	2021-09-01
364	\N	2021-08-23 19:18:58.929514	2021-08-23 19:18:58.929514	2021-09-29
365	\N	2021-09-12 16:31:49.579698	2021-09-12 16:31:49.579698	2021-09-15
366	\N	2021-09-14 13:42:32.497774	2021-09-14 13:42:32.497774	2021-10-27
367	\N	2021-09-22 23:05:38.975369	2021-09-22 23:05:38.975369	2021-09-22
368	\N	2021-09-27 19:54:20.231234	2021-09-27 19:54:20.231234	2021-10-06
369	\N	2021-10-07 17:38:56.641038	2021-10-07 17:38:56.641038	2021-10-13
370	\N	2021-10-13 14:42:47.731074	2021-10-13 14:42:47.731074	2021-10-20
371	\N	2021-10-31 00:42:26.533674	2021-10-31 00:42:26.533674	2021-11-10
372	\N	2021-11-08 10:11:49.894242	2021-11-08 10:11:49.894242	2021-11-17
373	\N	2021-11-08 10:13:16.240655	2021-11-08 10:13:16.240655	2021-11-24
374	\N	2021-11-18 12:16:33.140608	2021-11-18 12:16:33.140608	2022-01-05
375	\N	2021-11-18 12:18:26.445207	2021-11-18 12:18:26.445207	2021-12-01
376	\N	2021-11-18 12:20:30.28876	2021-11-18 12:20:30.28876	2021-12-08
377	\N	2021-11-28 22:36:19.073849	2021-11-28 22:36:19.073849	2021-12-15
378	\N	2021-11-30 11:51:43.057329	2021-11-30 11:51:43.057329	2021-12-29
379	\N	2021-11-30 11:53:09.169124	2021-11-30 11:53:09.169124	2021-12-22
380	\N	2021-11-30 11:54:28.656884	2021-11-30 11:54:28.656884	2022-01-12
381	\N	2021-12-20 20:35:28.883904	2021-12-20 20:35:28.883904	2022-02-02
382	\N	2021-12-20 20:40:12.08773	2021-12-20 20:40:12.08773	2022-01-19
383	\N	2022-01-05 11:53:38.279597	2022-01-05 11:53:38.279597	2022-01-26
384	\N	2022-01-05 11:55:50.663029	2022-01-05 11:55:50.663029	2022-02-09
385	\N	2022-01-09 14:47:36.542987	2022-01-09 14:47:36.542987	2022-02-16
418	\N	2022-01-14 00:54:44.556724	2022-01-14 00:54:44.556724	2022-04-06
419	\N	2022-01-14 00:56:34.189966	2022-01-14 00:56:34.189966	2022-03-09
420	\N	2022-01-31 15:41:08.630509	2022-01-31 15:41:08.630509	2022-03-02
421	\N	2022-02-08 13:35:46.717271	2022-02-08 13:35:46.717271	2022-02-23
422	\N	2022-02-08 14:59:58.057252	2022-02-08 14:59:58.057252	2022-03-30
423	\N	2022-02-08 22:53:51.430634	2022-02-08 22:53:51.430634	2022-03-16
424	\N	2022-03-15 21:06:39.793052	2022-03-15 21:06:39.793052	2022-03-23
425	\N	2022-03-25 23:34:29.320084	2022-03-25 23:34:29.320084	2022-04-13
426	\N	2022-03-30 23:52:05.315771	2022-03-30 23:52:05.315771	2022-05-25
427	\N	2022-04-18 11:44:35.922888	2022-04-18 11:44:35.922888	2022-04-20
428	\N	2022-04-25 01:26:26.122543	2022-04-25 01:26:26.122543	2022-06-29
429	\N	2022-04-25 10:53:59.317814	2022-04-25 10:53:59.317814	2022-06-22
430	\N	2022-04-25 22:29:52.900788	2022-04-25 22:29:52.900788	2022-06-01
431	\N	2022-05-03 11:01:09.734659	2022-05-03 11:01:09.734659	2022-05-04
432	\N	2022-05-04 19:56:28.58137	2022-05-04 19:56:28.58137	2022-05-18
433	\N	2022-05-09 14:35:06.75794	2022-05-09 14:35:06.75794	2022-05-11
434	\N	2022-05-16 16:00:55.415293	2022-05-16 16:00:55.415293	2022-07-20
435	\N	2022-06-01 15:46:34.589329	2022-06-01 15:46:34.589329	2022-07-13
436	\N	2022-06-08 09:52:23.063404	2022-06-08 09:52:23.063404	2022-06-08
437	\N	2022-06-13 09:45:19.072116	2022-06-13 09:45:19.072116	2022-06-15
438	\N	2022-07-01 17:41:54.07652	2022-07-01 17:41:54.07652	2022-07-06
439	\N	2022-07-18 13:52:57.757015	2022-07-18 13:52:57.757015	2022-08-03
440	\N	2022-07-19 23:11:30.437789	2022-07-19 23:11:30.437789	2022-07-27
441	\N	2022-08-09 12:54:08.688498	2022-08-09 12:54:08.688498	2022-08-10
442	\N	2022-08-14 17:06:34.796654	2022-08-14 17:06:34.796654	2022-09-28
443	\N	2022-08-15 22:43:27.318298	2022-08-15 22:43:27.318298	2022-08-17
444	\N	2022-08-15 22:43:51.274775	2022-08-15 22:43:51.274775	2022-08-24
445	\N	2022-08-23 15:39:36.533981	2022-08-23 15:39:36.533981	2022-09-07
446	\N	2022-08-23 15:45:10.607294	2022-08-23 15:45:10.607294	2022-09-14
447	\N	2022-09-14 23:20:40.464563	2022-09-14 23:20:40.464563	2022-10-26
448	\N	2022-09-15 18:24:45.934389	2022-09-15 18:24:45.934389	2022-11-02
449	\N	2022-09-16 13:34:34.40362	2022-09-16 13:34:34.40362	2023-03-01
450	\N	2022-09-19 15:22:56.627569	2022-09-19 15:22:56.627569	2022-10-19
483	\N	2022-09-21 20:10:15.159349	2022-09-21 20:10:15.159349	2022-09-21
484	\N	2022-09-28 16:04:46.185233	2022-09-28 16:04:46.185233	2022-10-05
485	\N	2022-11-09 01:44:36.064949	2022-11-09 01:44:36.064949	2022-11-09
486	\N	2022-11-14 18:45:04.176302	2022-11-14 18:45:04.176302	2022-11-16
487	\N	2022-11-21 21:24:32.870216	2022-11-21 21:24:32.870216	2022-11-30
488	\N	2022-11-21 21:25:15.757209	2022-11-21 21:25:15.757209	2022-12-07
489	\N	2022-11-21 21:26:47.02544	2022-11-21 21:26:47.02544	2022-12-21
490	\N	2022-11-21 21:27:32.452216	2022-11-21 21:27:32.452216	2022-12-28
491	\N	2022-11-22 16:50:10.255753	2022-11-22 16:50:10.255753	2022-11-23
492	\N	2022-11-29 23:29:11.949805	2022-11-29 23:29:11.949805	2022-12-14
493	\N	2022-12-14 16:42:53.861361	2022-12-14 16:42:53.861361	2023-01-04
494	\N	2022-12-15 19:40:49.969785	2022-12-15 19:40:49.969785	2023-01-25
495	\N	2022-12-29 21:04:00.029496	2022-12-29 21:04:00.029496	2023-01-11
496	\N	2022-12-30 01:16:49.730977	2022-12-30 01:16:49.730977	2023-01-18
497	\N	2023-01-10 11:33:32.386679	2023-01-10 11:33:32.386679	2023-02-08
498	\N	2023-01-12 13:30:27.941114	2023-01-12 13:30:27.941114	2023-02-01
499	\N	2023-01-16 08:07:55.841524	2023-01-16 08:07:55.841524	2023-02-22
500	\N	2023-01-17 15:40:10.533468	2023-01-17 15:40:10.533468	2023-02-15
501	\N	2023-02-07 15:33:40.759808	2023-02-07 15:33:40.759808	2023-03-08
502	\N	2023-03-01 02:30:13.81866	2023-03-01 02:30:13.81866	2023-03-15
503	\N	2023-03-02 23:52:31.626707	2023-03-02 23:52:31.626707	2023-03-22
504	\N	2023-03-14 14:51:18.544957	2023-03-14 14:51:18.544957	2023-03-29
505	\N	2023-03-21 11:26:14.636326	2023-03-21 11:26:14.636326	2023-05-03
506	\N	2023-04-03 20:54:46.059537	2023-04-03 20:54:46.059537	2023-04-05
507	\N	2023-04-05 12:10:43.538006	2023-04-05 12:10:43.538006	2023-04-12
508	\N	2023-04-17 12:23:37.834345	2023-04-17 12:23:37.834345	2023-04-19
509	\N	2023-04-26 11:17:17.238187	2023-04-26 11:17:17.238187	2023-04-26
510	\N	2023-05-19 19:13:53.042034	2023-05-19 19:13:53.042034	2023-05-24
511	\N	2023-05-24 10:31:57.306251	2023-05-24 10:31:57.306251	2023-06-21
512	\N	2023-05-24 11:32:18.289187	2023-05-24 11:32:18.289187	2023-07-12
513	\N	2023-05-31 21:36:41.058272	2023-05-31 21:36:41.058272	2023-05-31
514	\N	2023-06-03 23:04:11.756539	2023-06-03 23:04:11.756539	2023-06-14
515	\N	2023-06-07 13:23:07.032334	2023-06-07 13:23:07.032334	2023-06-07
516	\N	2023-06-26 00:08:59.096961	2023-06-26 00:08:59.096961	2023-06-28
517	\N	2023-06-26 23:00:45.856394	2023-06-26 23:00:45.856394	2023-07-05
518	\N	2023-07-06 21:24:00.919777	2023-07-06 21:24:00.919777	2023-09-27
519	\N	2023-07-24 15:58:36.505083	2023-07-24 15:58:36.505083	2023-07-26
520	\N	2023-07-26 01:29:14.912491	2023-07-26 01:29:14.912491	2023-08-23
521	\N	2023-08-02 12:54:38.385271	2023-08-02 12:54:38.385271	2023-08-02
522	\N	2023-08-04 19:26:08.435254	2023-08-04 19:26:08.435254	2023-08-16
523	\N	2023-08-09 21:04:22.962296	2023-08-09 21:04:22.962296	2023-08-09
524	\N	2023-09-02 19:53:13.307325	2023-09-02 19:53:13.307325	2023-09-06
525	\N	2023-09-20 12:41:56.620231	2023-09-20 12:41:56.620231	2023-10-25
526	\N	2023-10-06 00:48:19.672712	2023-10-06 00:48:19.672712	2023-10-04
527	\N	2023-10-07 18:28:55.264888	2023-10-07 18:28:55.264888	2023-10-18
528	\N	2023-10-18 21:40:23.237832	2023-10-18 21:40:23.237832	2023-12-27
529	\N	2023-11-01 17:42:24.806607	2023-11-01 17:42:24.806607	2023-11-01
530	\N	2023-11-07 15:20:39.894922	2023-11-07 15:20:39.894922	2023-11-15
531	\N	2023-11-09 02:24:59.084453	2023-11-09 02:24:59.084453	2023-11-08
532	\N	2023-11-09 13:38:19.811904	2023-11-09 13:38:19.811904	2023-12-06
533	\N	2023-11-20 14:53:54.049347	2023-11-20 14:53:54.049347	2023-11-29
534	\N	2023-11-20 14:54:20.700692	2023-11-20 14:54:20.700692	2023-12-13
535	\N	2023-11-20 14:57:15.597381	2023-11-20 14:57:15.597381	2023-12-20
536	\N	2023-11-21 01:18:38.656735	2023-11-21 01:18:38.656735	2023-11-22
537	\N	2023-12-15 22:38:44.030609	2023-12-15 22:38:44.030609	2024-01-03
538	\N	2023-12-15 22:39:04.386391	2023-12-15 22:39:04.386391	2024-01-10
539	\N	2023-12-25 18:42:05.565859	2023-12-25 18:42:05.565859	2024-01-31
540	\N	2024-01-02 00:38:42.855424	2024-01-02 00:38:42.855424	2024-01-17
541	\N	2024-01-02 15:10:35.315891	2024-01-02 15:10:35.315891	2024-01-24
542	\N	2024-01-19 17:24:56.922666	2024-01-19 17:24:56.922666	2024-02-14
543	\N	2024-01-29 17:16:00.561269	2024-01-29 17:16:00.561269	2024-02-07
544	\N	2024-01-29 17:17:24.897919	2024-01-29 17:17:24.897919	2024-02-21
545	\N	2024-01-29 17:18:13.895444	2024-01-29 17:18:13.895444	2024-02-28
546	\N	2024-02-03 21:02:22.649879	2024-02-03 21:02:22.649879	2024-03-06
547	\N	2024-02-24 02:17:48.986111	2024-02-24 02:17:48.986111	2024-03-20
548	\N	2024-03-04 20:48:54.47038	2024-03-04 20:48:54.47038	2024-03-27
549	\N	2024-03-11 19:02:44.7584	2024-03-11 19:02:44.7584	2024-03-13
550	\N	2024-03-25 20:19:01.298125	2024-03-25 20:19:01.298125	2024-04-10
551	\N	2024-03-25 20:19:54.129094	2024-03-25 20:19:54.129094	2024-04-24
552	\N	2024-03-26 15:19:52.370613	2024-03-26 15:19:52.370613	2024-06-26
553	\N	2024-03-27 17:01:35.359976	2024-03-27 17:01:35.359976	2024-04-17
554	\N	2024-03-31 23:40:30.463929	2024-03-31 23:40:30.463929	2024-04-03
555	\N	2024-04-30 13:51:42.602252	2024-04-30 13:51:42.602252	2024-05-01
556	\N	2024-05-06 16:49:00.202592	2024-05-06 16:49:00.202592	2024-06-19
557	\N	2024-05-08 14:40:47.192774	2024-05-08 14:40:47.192774	2024-05-22
558	\N	2024-05-10 19:38:42.880779	2024-05-10 19:38:42.880779	2024-05-15
559	\N	2024-06-02 15:44:14.78602	2024-06-02 15:44:14.78602	2024-07-17
560	\N	2024-06-05 14:15:38.042286	2024-06-05 14:15:38.042286	2024-06-05
561	\N	2024-06-13 16:53:41.406358	2024-06-13 16:53:41.406358	2024-09-25
562	\N	2024-06-23 18:00:26.826948	2024-06-23 18:00:26.826948	2024-07-10
563	\N	2024-06-23 18:01:35.166826	2024-06-23 18:01:35.166826	2024-07-03
564	\N	2024-06-23 18:02:24.809667	2024-06-23 18:02:24.809667	2024-08-21
565	\N	2024-06-29 22:38:30.715125	2024-06-29 22:38:30.715125	2024-08-14
566	\N	2024-06-30 20:04:44.369032	2024-06-30 20:04:44.369032	2024-07-24
567	\N	2024-07-31 10:03:59.866549	2024-07-31 10:03:59.866549	2024-07-31
568	\N	2024-09-03 21:36:47.525997	2024-09-03 21:36:47.525997	2024-09-04
569	\N	2024-09-30 19:06:50.212969	2024-09-30 19:06:50.212969	2024-10-02
570	\N	2024-10-07 12:48:29.084159	2024-10-07 12:48:29.084159	2024-10-23
571	\N	2024-10-09 15:15:55.176403	2024-10-09 15:15:55.176403	2024-10-30
572	\N	2024-10-09 21:59:45.608211	2024-10-09 21:59:45.608211	2024-10-09
573	\N	2024-10-18 15:16:39.635613	2024-10-18 15:16:39.635613	2024-10-16
574	\N	2024-11-06 22:05:59.636496	2024-11-06 22:05:59.636496	2024-12-11
575	\N	2024-11-07 14:16:36.322021	2024-11-07 14:16:36.322021	2024-11-20
576	\N	2024-11-07 14:17:29.786688	2024-11-07 14:17:29.786688	2024-11-27
577	\N	2024-11-07 14:18:01.811527	2024-11-07 14:18:01.811527	2024-12-04
578	\N	2024-11-07 14:19:51.60388	2024-11-07 14:19:51.60388	2024-12-25
607	\N	2024-11-19 18:42:10.44809	2024-11-19 18:42:10.44809	2025-01-01
608	\N	2024-11-20 15:56:57.865583	2024-11-20 15:56:57.865583	2025-01-08
609	\N	2024-12-18 01:21:52.565935	2024-12-18 01:21:52.565935	2024-12-18
610	\N	2025-01-05 13:48:06.825943	2025-01-05 13:48:06.825943	2025-01-22
611	\N	2025-01-06 15:17:19.264601	2025-01-06 15:17:19.264601	2025-01-15
612	\N	2025-01-08 18:24:10.548073	2025-01-08 18:24:10.548073	2025-01-29
640	\N	2025-01-21 15:51:35.316967	2025-01-21 15:51:35.316967	2025-03-19
641	\N	2025-01-22 02:59:40.698828	2025-01-22 02:59:40.698828	2025-02-19
642	\N	2025-01-27 21:10:00.518284	2025-01-27 21:10:00.518284	2025-02-05
643	\N	2025-02-09 18:28:00.115575	2025-02-09 18:28:00.115575	2025-02-12
673	\N	2025-02-12 23:08:02.229459	2025-02-12 23:08:02.229459	2025-03-12
674	\N	2025-02-15 17:45:46.485345	2025-02-15 17:45:46.485345	2025-02-26
675	\N	2025-02-15 17:47:05.408699	2025-02-15 17:47:05.408699	2025-03-05
676	\N	2025-03-18 14:24:10.302074	2025-03-18 14:24:10.302074	2025-04-02
677	\N	2025-03-23 13:00:16.508931	2025-03-23 13:00:16.508931	2025-04-23
678	\N	2025-03-24 19:15:38.103976	2025-03-24 19:15:38.103976	2025-03-26
679	\N	2025-03-26 16:32:32.008296	2025-03-26 16:32:32.008296	2025-04-09
706	\N	2025-04-07 20:55:11.258185	2025-04-07 20:55:11.258185	2025-04-16
707	\N	2025-04-27 23:06:05.489911	2025-04-27 23:06:05.489911	2025-04-30
739	\N	2025-05-06 23:17:49.609481	2025-05-06 23:17:49.609481	2025-05-07
740	\N	2025-05-08 03:59:08.356175	2025-05-08 03:59:08.356175	2025-06-04
741	\N	2025-05-12 14:09:57.386375	2025-05-12 14:09:57.386375	2025-05-14
742	\N	2025-05-15 22:19:26.898676	2025-05-15 22:19:26.898676	2025-06-25
743	\N	2025-05-15 22:20:32.821939	2025-05-15 22:20:32.821939	2025-08-20
744	\N	2025-05-15 22:21:29.21029	2025-05-15 22:21:29.21029	2025-07-16
745	\N	2025-05-21 22:11:08.775943	2025-05-21 22:11:08.775943	2025-05-21
772	\N	2025-05-28 21:55:52.991312	2025-05-28 21:55:52.991312	2025-05-28
773	\N	2025-06-08 13:24:20.130433	2025-06-08 13:24:20.130433	2025-06-11
774	\N	2025-06-13 23:34:16.506818	2025-06-13 23:34:16.506818	2025-07-09
785	\N	2025-06-16 18:47:14.851395	2025-06-16 18:47:14.851395	2025-07-23
784	This is a test to add a note to the reservation week	2025-06-16 18:39:53.266828	2025-06-16 18:59:56.288376	2025-06-18
786	\N	2025-06-16 19:58:27.345019	2025-06-16 19:58:27.345019	2025-07-30
\.


--
-- Data for Name: reservations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.reservations (id, name, wed, thur, fri, sat, sun, mon, tue, dinner, comment, created_at, updated_at, user_id, reservation_week_id, sex, res_member_type, reservation_date, confirmation_number) FROM stdin;
3959	James Olcott	f	f	t	t	f	f	f	f	New prospect. Seems very interested! - DS	2025-01-28 19:35:48.851796	2025-01-28 19:35:48.851796	20	612	Male	Guest	2025-01-29	\N
4012	T Wall	f	f	t	t	f	f	f	f		2025-02-10 13:24:14.956671	2025-02-10 13:24:14.956671	21	641	Male	Full Member	2025-02-19	\N
4013	Alana M	f	f	t	t	f	f	f	f		2025-02-10 13:24:54.600687	2025-02-10 13:24:54.600687	21	641	Female	Full Member	2025-02-19	\N
4014	Tom Wall Sr.	f	f	t	t	f	f	f	f		2025-02-10 13:25:49.779463	2025-02-10 13:25:49.779463	21	641	Male	Guest	2025-02-19	\N
4015	Jess P	f	f	t	t	f	f	f	f	Beth's bed if Sunny is not up, otherwise I will shift.  Saturday night is a maybe.  Friday Black NH, Saturday Wildcat. 	2025-02-10 20:02:44.314095	2025-02-10 20:05:29.162996	137	643	Female	Associate Member	2025-02-12	\N
4144	Liz Austin	f	f	t	t	f	f	f	f	First time visitor interested in year round membership. Seems nice! - DS	2025-03-30 17:54:22.624387	2025-03-30 17:54:22.624387	20	677	Female	Guest	2025-04-23	\N
4177	Chris B	f	f	t	t	f	f	f	f	Spring Skiing/Spring Fling/Etc.	2025-04-03 05:34:50.000495	2025-04-03 05:34:50.000495	15	679	Male	Full Member	2025-04-09	\N
4210	Tyler Buckeridge	t	f	t	f	f	f	f	f	Coming over after a work meeting in Lebanon NH Weds am to do Tuck’s/skin black weds pm/thurs am. Coming back up Friday for more of the same Friday pm/saturday am. Gotta get while there’s still gettin to be had, good or not…	2025-05-06 23:17:49.634162	2025-05-06 23:20:39.661824	436	739	Male	Full Member	2025-05-07	\N
4243	Michelle Comtois	f	f	t	t	f	f	f	f	Might not be there until Saturday morning 	2025-05-26 10:20:20.159795	2025-05-26 10:20:20.159795	5	740	Female	Full Member	2025-06-04	\N
3960	TWall 	f	f	t	t	f	f	f	t	No dinner	2025-01-28 22:20:56.59346	2025-01-28 22:20:56.59346	21	612	Male	Full Member	2025-01-29	\N
3961	Tyler Buckeridge	f	f	t	t	f	f	f	f		2025-01-29 03:42:00.65963	2025-01-29 03:42:00.65963	267	612	Male	Guest	2025-01-29	\N
4016	Tyler Buckeridge	f	f	t	t	t	f	f	f		2025-02-11 22:31:50.699593	2025-02-11 22:31:50.699593	436	643	Male	Full Member	2025-02-12	\N
4017	Perry	t	t	f	f	f	f	f	f	MayB 	2025-02-11 23:11:53.963339	2025-02-11 23:11:53.963339	153	643	Male	Full Member	2025-02-12	\N
4018	Aaron Uehara	f	f	t	t	t	f	f	f		2025-02-12 00:26:17.703836	2025-02-12 00:26:17.703836	404	643	Male	Full Member	2025-02-12	\N
4019	Sunny Uehara	f	f	t	t	t	f	f	f		2025-02-12 00:27:20.509432	2025-02-12 00:27:20.509432	404	643	Female	Full Member	2025-02-12	\N
4145	Vicki S	f	t	t	t	t	f	f	f	Race Banquet—Thurs/Sun maybe	2025-03-31 22:18:15.429937	2025-03-31 22:18:15.429937	3	679	Female	Full Member	2025-04-09	\N
4146	John D	f	f	t	t	t	f	f	t	Resort closing weekend. 	2025-03-31 23:16:26.09101	2025-03-31 23:16:26.09101	2	676	Male	Full Member	2025-04-02	\N
4147	John D	f	f	t	t	t	f	f	f	Possibly arriving Thursday. Race Awards Weekend. 	2025-03-31 23:17:50.741847	2025-03-31 23:17:50.741847	2	679	Male	Full Member	2025-04-09	\N
4178	Michelle Comtois	f	f	t	t	f	f	f	f		2025-04-05 10:39:06.386691	2025-04-05 10:39:06.386691	5	679	Female	Full Member	2025-04-09	\N
4244	Amanda	f	f	t	t	f	f	f	f	Work weekend	2025-05-27 22:36:08.911145	2025-05-27 22:36:08.911145	352	740	Female	Full Member	2025-06-04	\N
4211	Sara Delaney 	f	f	t	f	f	f	f	f	Partial work weekend, leaving Sat evening 	2025-05-08 03:59:08.37213	2025-06-04 14:50:47.816922	31	740	Female	Full Member	2025-06-04	\N
3962	Lori Lavoie	f	f	t	t	f	f	f	f		2025-01-30 04:56:51.097137	2025-01-30 04:56:51.097137	44	612	Female	Associate Member	2025-01-29	\N
4020	Christian Bortnick	f	f	t	t	f	f	f	f	Prospective member coming for his second visit. Aaron will sponsor! - DS	2025-02-12 14:03:35.184338	2025-02-12 20:10:09.383703	20	643	Male	Guest	2025-02-12	\N
4021	Hannah Uehara	f	f	f	t	t	f	f	f		2025-02-12 22:06:12.860309	2025-02-12 22:06:12.860309	404	643	Female	Guest	2025-02-12	\N
4023	Michelle Comtois	f	f	t	f	f	f	f	f		2025-02-12 23:08:44.655546	2025-02-12 23:08:44.655546	5	643	Female	Full Member	2025-02-12	\N
4024	Sara Delaney	f	f	t	t	f	f	f	f	Tentative	2025-02-12 23:57:37.083884	2025-02-12 23:57:37.083884	31	643	Female	Full Member	2025-02-12	\N
4148	Dan Shults	f	f	f	t	f	f	f	f	I think I'll come up Saturday AM, take some laps at Black, and hit Wildcat for closing day on Sun. 	2025-04-01 14:36:33.482086	2025-04-01 14:36:33.482086	20	676	Male	Full Member	2025-04-02	\N
4149	Ryan B.	f	f	t	t	f	f	f	f	probably 	2025-04-02 00:23:36.547436	2025-04-02 00:23:36.547436	366	677	Male	Full Member	2025-04-23	\N
4150	Jenna W.	f	f	t	t	f	f	f	f	probably 	2025-04-02 00:23:47.154714	2025-04-02 00:23:47.154714	366	677	Female	Full Member	2025-04-23	\N
4151	Dan Shults	f	f	t	t	f	f	f	f	Race Banquet, Spring Fling, skiing anywhere that's still open.	2025-04-02 13:38:29.150267	2025-04-02 13:38:29.150267	20	679	Male	Full Member	2025-04-09	\N
4152	Vicki S	f	f	t	t	f	f	f	f	Maybe	2025-04-02 13:49:43.494586	2025-04-02 13:49:43.494586	3	676	Female	Full Member	2025-04-02	\N
4153	Rob Cant	f	f	t	t	f	f	f	f	First time visitor and prospective member. Seems like a nice guy! - DS	2025-04-02 14:23:26.349061	2025-04-02 14:23:26.349061	20	679	Male	Guest	2025-04-09	\N
4179	Nikki Shults	f	f	f	f	f	f	f	f		2025-04-06 20:58:47.99752	2025-04-06 20:58:47.99752	9	679	Female	Full Member	2025-04-09	\N
4180	Alana M	f	f	t	t	f	f	f	f	Race awards- probably arriving Saturday morning	2025-04-06 21:14:56.367356	2025-04-06 21:14:56.367356	23	679	Female	Full Member	2025-04-09	\N
4181	Tommy W	f	f	f	t	f	f	f	f	Race banquet/ arrival early Saturday	2025-04-06 21:16:32.665031	2025-04-06 21:16:32.665031	23	679	Male	Full Member	2025-04-09	\N
4182	Dominik	f	f	t	t	f	f	f	f	Ski?	2025-04-06 23:46:43.447034	2025-04-06 23:46:43.447034	267	679	Male	Full Member	2025-04-09	\N
4183	Amanda 	f	f	t	t	f	f	f	f		2025-04-06 23:47:07.247355	2025-04-06 23:47:07.247355	267	679	Female	Full Member	2025-04-09	\N
4212	Mike Ryan	f	t	t	t	t	f	f	f	May not be staying all these nights. Be up for some funeral services on Sunday. People may gather at club later Sunday afternoon.   	2025-05-12 14:09:57.394588	2025-05-12 14:09:57.394588	14	741	Male	Full Member	2025-05-14	\N
4245	Amanda	f	f	t	t	f	f	f	f	Tentative on weather	2025-05-28 21:55:53.002658	2025-05-28 21:55:53.002658	352	772	Female	Full Member	2025-05-28	\N
3963	Dan Shults	f	t	t	t	f	f	f	f	Race! Probably coming up Thurs night. Friday Night Lights?	2025-02-03 18:21:15.387418	2025-02-18 15:53:05.995818	20	641	Male	Full Member	2025-02-19	\N
4184	Tyler Buckeridge	f	t	t	t	f	f	f	f		2025-04-07 20:54:46.872242	2025-04-07 20:54:46.872242	436	679	Male	Full Member	2025-04-09	\N
4185	Tyler Buckeridge	f	t	t	t	f	f	f	f		2025-04-07 20:55:11.298399	2025-04-07 20:55:11.298399	436	706	Male	Full Member	2025-04-16	\N
4186	Jess P	f	f	t	t	f	f	f	f	Tentative. No hiking. Nancy bunk please, don’t think she will be up. 	2025-04-08 01:15:05.789181	2025-04-23 20:35:42.533961	137	677	Female	Associate Member	2025-04-23	\N
4213	Christian B	f	f	t	t	f	f	f	f	Work weekend	2025-05-15 22:19:26.938357	2025-05-15 22:19:26.938357	469	742	Male	Full Member	2025-06-25	\N
4214	Christian B	f	f	t	t	f	f	f	f		2025-05-15 22:20:32.864691	2025-05-15 22:20:32.864691	469	743	Male	Full Member	2025-08-20	\N
4215	Christian B	f	f	t	t	f	f	f	f		2025-05-15 22:21:39.797897	2025-05-15 22:21:39.797897	469	744	Male	Full Member	2025-07-16	\N
4246	John D	f	t	t	t	t	f	f	t	Work weekend. 	2025-05-30 00:20:11.997428	2025-05-30 00:20:11.997428	2	740	Male	Full Member	2025-06-04	\N
3964	Scott James	f	f	t	t	f	f	f	t		2025-02-04 01:36:08.117279	2025-02-04 01:36:08.117279	257	642	Male	Full Member	2025-02-05	\N
3965	Rachel Crateau	f	f	f	t	t	f	f	f		2025-02-04 01:36:46.449701	2025-02-04 01:36:46.449701	257	642	Male	Full Member	2025-02-05	\N
3966	Tyler Buckeridge	f	f	t	t	f	f	f	f		2025-02-04 01:37:19.030232	2025-02-04 01:37:19.030232	257	642	Male	Full Member	2025-02-05	\N
3968	Perry	t	t	f	t	t	f	f	f	Not sure what days. Trying to make it for one of the powder days this week/weekend 	2025-02-04 17:18:50.476872	2025-02-04 17:18:50.476872	153	642	Male	Full Member	2025-02-05	\N
3967	Dominik	f	f	t	t	f	f	f	f	Maybe; extremely late Friday possibly Saturday evening	2025-02-04 01:51:08.592935	2025-02-05 21:52:52.521139	267	642	Male	Full Member	2025-02-05	\N
4026	Scott James	f	f	t	t	f	f	f	f		2025-02-15 17:44:31.854046	2025-02-15 17:44:31.854046	257	641	Male	Full Member	2025-02-19	\N
4027	Rachel Crateau	f	f	t	t	f	f	f	f		2025-02-15 17:45:07.979541	2025-02-15 17:45:07.979541	257	641	Male	Full Member	2025-02-19	\N
4028	Scott James	f	f	t	t	f	f	f	f		2025-02-15 17:45:46.493054	2025-02-15 17:45:46.493054	257	674	Male	Full Member	2025-02-26	\N
4029	Rachel Crateau	f	f	t	t	f	f	f	f		2025-02-15 17:46:31.163796	2025-02-15 17:46:31.163796	257	674	Female	Full Member	2025-02-26	\N
4030	Scott James	f	f	t	t	f	f	f	f		2025-02-15 17:47:05.414788	2025-02-15 17:47:05.414788	257	675	Male	Full Member	2025-03-05	\N
4031	Rachel Crateau	f	f	t	t	f	f	f	f		2025-02-15 17:47:36.642682	2025-02-15 17:47:36.642682	257	675	Female	Full Member	2025-03-05	\N
4032	John D	f	t	t	t	t	f	f	f	Race weekend!	2025-02-16 01:02:49.954652	2025-02-16 01:02:49.954652	2	641	Male	Full Member	2025-02-19	\N
4033	John D	f	t	t	t	t	f	f	f	Welcome guests!!!	2025-02-16 01:03:36.659445	2025-02-16 01:03:36.659445	2	674	Male	Full Member	2025-02-26	\N
4187	Beth Smith	f	t	t	t	t	f	f	f		2025-04-08 17:12:02.432373	2025-04-08 17:12:02.432373	20	677	Female	Full Member	2025-04-23	\N
4188	Perry	f	f	t	t	f	f	f	f	Most likely NOT	2025-04-08 18:59:22.27731	2025-04-08 18:59:22.27731	153	679	Male	Full Member	2025-04-09	\N
4216	Perry	f	f	t	t	t	f	f	f	Very small chance, adding just in case 	2025-05-21 22:11:08.79217	2025-05-21 22:11:08.79217	153	745	Male	Full Member	2025-05-21	\N
4217	Yasmine K	f	f	t	t	t	f	f	f	Guest of perry	2025-05-21 22:11:29.622561	2025-05-21 22:11:29.622561	153	745	Female	Guest	2025-05-21	\N
4247	Dominik	f	f	t	t	f	f	f	f		2025-06-01 13:15:07.97432	2025-06-01 13:15:07.97432	267	740	Male	Full Member	2025-06-04	\N
3969	doug mayo	f	f	t	t	f	f	f	f	let's go skiing	2025-02-05 12:04:20.882711	2025-02-05 12:04:20.882711	12	642	Male	Full Member	2025-02-05	\N
3970	megan mayo	f	f	t	t	f	f	f	f	let's go skiing	2025-02-05 12:04:45.07705	2025-02-05 12:04:45.07705	12	642	Female	Full Member	2025-02-05	\N
3971	Amanda	f	f	t	t	t	f	f	f		2025-02-05 19:24:20.922467	2025-02-05 19:24:20.922467	352	642	Female	Full Member	2025-02-05	\N
3972	Aaron Uehara	f	f	f	t	f	f	f	f		2025-02-05 23:11:38.661128	2025-02-05 23:11:38.661128	404	642	Male	Full Member	2025-02-05	\N
3973	Sunny Uehara	f	f	f	t	f	f	f	f		2025-02-05 23:12:23.538753	2025-02-05 23:12:23.538753	404	642	Female	Full Member	2025-02-05	\N
3974	Hannah Uehara	f	f	f	t	f	f	f	f		2025-02-05 23:12:47.239356	2025-02-05 23:12:47.239356	404	642	Female	Guest	2025-02-05	\N
3975	Jonathan Kim	f	f	f	t	f	f	f	f		2025-02-05 23:13:37.041827	2025-02-05 23:13:37.041827	404	642	Male	Guest	2025-02-05	\N
3976	Christian Bortnick	f	f	t	t	f	f	f	f	Nice guy we met at the Skimos party who is checking out clubs. Seems like a strong prospect! Scott and Rachel hosting. - DS	2025-02-06 00:06:08.390921	2025-02-06 00:06:08.390921	20	642	Male	Guest	2025-02-05	\N
3977	Dan Shults	f	f	f	f	f	f	f	f	Small chance I will be up LATE Saturday or very early Sunday. Will depend on the timing of the storm and if I feel like making the drive :P	2025-02-06 00:08:18.770185	2025-02-06 00:08:18.770185	20	642	Male	Full Member	2025-02-05	\N
4034	Amanda	f	f	t	t	f	f	f	f		2025-02-17 17:08:08.170583	2025-02-17 17:08:08.170583	352	641	Female	Full Member	2025-02-19	\N
4035	Nikki Shults	f	t	t	t	f	f	f	f	Thinking about Friday night lights	2025-02-17 21:43:01.189612	2025-02-17 21:43:01.189612	9	641	Female	Full Member	2025-02-19	\N
4189	Dan Shults	f	f	t	t	f	f	f	f	Planning a little day trip up to Jay on Sat.	2025-04-10 13:24:05.628109	2025-04-10 13:24:05.628109	20	706	Male	Full Member	2025-04-16	\N
4248	Dan Shults	f	f	t	t	f	f	f	f	week workend	2025-06-02 14:39:23.536483	2025-06-02 14:39:23.536483	20	740	Male	Full Member	2025-06-04	\N
3978	Dan Shults	f	t	t	f	f	f	f	f	Depending on storm timing and logistics I plan to ski FRIDAY and then head home. I'll only do one night, but I'm not sure if that will be Thurs or Fri.	2025-02-09 18:28:00.147137	2025-02-09 18:28:00.147137	20	643	Male	Full Member	2025-02-12	\N
3979	Doug Mayo	t	f	t	t	t	t	t	f	Let’s go skiing	2025-02-10 02:21:57.158726	2025-02-10 02:21:57.158726	12	643	Male	Full Member	2025-02-12	\N
3980	Doug Mayo	t	t	t	t	f	f	f	f	Let’s go skiing 	2025-02-10 02:22:23.465075	2025-02-10 02:22:23.465075	12	641	Male	Full Member	2025-02-19	\N
3981	Megan mayo 	f	f	t	t	t	t	t	f	Let’s go skiing 	2025-02-10 02:22:55.854198	2025-02-10 02:22:55.854198	12	643	Female	Full Member	2025-02-12	\N
3982	Megan mayo 	t	t	t	t	f	f	f	f	Let’s go skiing	2025-02-10 02:23:50.685965	2025-02-10 02:23:50.685965	12	641	Female	Full Member	2025-02-19	\N
4036	Steve Jacobs	f	f	f	t	f	f	f	f	Amanda's dad. he snores	2025-02-18 13:35:32.129113	2025-02-18 13:35:32.129113	352	641	Male	Guest	2025-02-19	\N
4037	Dominik	f	f	t	t	f	f	f	f		2025-02-19 04:00:50.640039	2025-02-19 04:00:50.640039	267	641	Male	Full Member	2025-02-19	\N
4039	Xavier Crosby	f	f	t	t	f	f	f	f	Can put in hog haven. (guest of dominik)	2025-02-19 04:06:04.571589	2025-02-19 04:06:04.571589	267	641	Male	Guest	2025-02-19	\N
4038	Robbie O'Loughlin	f	f	t	t	f	f	f	f	Maybe Saturday. Can put in hog haven. (guest of dominik)	2025-02-19 04:04:20.943319	2025-02-19 04:08:11.909632	267	641	Male	Guest	2025-02-19	\N
4040	Tyler Buckeridge	f	f	t	t	f	f	f	f	n/a	2025-02-19 04:30:01.519443	2025-02-19 04:30:01.519443	436	641	Male	Full Member	2025-02-19	\N
4190	John D	f	f	t	t	f	f	f	f	Tuckermann’s Tailgate!	2025-04-13 11:33:57.835379	2025-04-13 11:33:57.835379	2	677	Male	Full Member	2025-04-23	\N
4249	Nancy Murphy	f	f	t	t	f	f	f	f	Work weekend	2025-06-02 20:46:09.561313	2025-06-02 20:46:09.561313	51	742	Female	Full Member	2025-06-25	\N
4250	Sunny Uehara	f	f	t	t	f	f	f	f	Cleaning Weekend!!!	2025-06-02 22:47:24.201505	2025-06-02 22:47:24.201505	404	740	Female	Full Member	2025-06-04	\N
4251	Aaron Uehara	f	f	t	t	f	f	f	f	Cleaning!	2025-06-02 22:48:09.83837	2025-06-02 22:48:09.83837	404	742	Male	Full Member	2025-06-25	\N
4252	T Wall	f	f	t	t	f	f	f	f	https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExbHlqbXhtaXExbTMybnp4djZleHFoM2htbXQzaWR5b3h2emg4cHA1NSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/PZXsHz4SVTkExeG3vb/giphy.gif	2025-06-03 11:59:26.360815	2025-06-03 11:59:26.360815	21	740	Male	Full Member	2025-06-04	\N
4253	Alana M	f	f	t	t	f	f	f	f		2025-06-03 12:02:24.849314	2025-06-03 12:02:24.849314	21	740	Female	Full Member	2025-06-04	\N
4041	Vicki S	f	t	t	t	f	f	f	f	Race weekend! Thursday is maybe. 	2025-02-19 12:55:03.45639	2025-02-19 12:55:03.45639	3	641	Female	Full Member	2025-02-19	\N
4042	Nung	f	f	f	t	f	f	f	f		2025-02-19 17:17:58.542644	2025-02-19 17:17:58.542644	7	641	Male	Full Member	2025-02-19	\N
4043	Pop	f	f	f	t	f	f	f	f	Masters please	2025-02-19 17:18:38.209397	2025-02-19 17:18:38.209397	7	641	Female	Guest	2025-02-19	\N
4191	Perry	f	f	f	t	t	f	f	f	Weather depending 	2025-04-13 19:57:40.286654	2025-04-15 16:32:01.792464	153	706	Male	Full Member	2025-04-16	\N
4254	Nicholas Skovran	f	f	t	t	t	f	f	f		2025-06-03 23:07:03.072732	2025-06-03 23:07:03.072732	329	740	Male	Full Member	2025-06-04	\N
4045	Matt 	f	f	t	t	f	f	f	f	Most likely coming up.   Might be late Friday.   	2025-02-20 20:39:01.620366	2025-02-20 20:39:01.620366	328	641	Male	Full Member	2025-02-19	\N
4044	Jess P	f	f	t	t	f	f	f	f	ice bar, bottom bunk please due to knee injury	2025-02-20 19:56:08.451506	2025-03-09 18:25:11.305399	137	640	Female	Associate Member	2025-03-19	\N
4192	Amanda	f	f	t	t	f	f	f	f		2025-04-15 17:23:35.967491	2025-04-15 17:23:35.967491	352	677	Female	Full Member	2025-04-23	\N
4255	Dominik	f	f	t	f	f	f	f	f	Maybe, probably not	2025-06-08 13:24:20.139673	2025-06-08 13:24:20.139673	267	773	Male	Full Member	2025-06-11	\N
4046	Vicki	f	t	t	t	t	f	f	f	Thursday and Sunday maybe	2025-02-24 01:14:54.069427	2025-02-24 01:14:54.069427	3	674	Female	Full Member	2025-02-26	\N
4047	Vicki S	f	t	t	t	t	f	f	f	Championship Weekend! Thursday and Sunday maybe. 	2025-02-24 01:15:59.746463	2025-02-24 01:15:59.746463	3	675	Female	Full Member	2025-03-05	\N
4048	Vicki S	f	f	t	t	t	f	f	f	Ice Bar! Jet lag! Amazeballs!	2025-02-24 01:16:35.080244	2025-03-12 18:34:39.020254	3	640	Female	Full Member	2025-03-19	\N
4193	Dominik	f	f	t	t	f	f	f	f		2025-04-16 04:11:32.184351	2025-04-16 04:11:32.184351	267	677	Male	Full Member	2025-04-23	\N
4256	Michelle Comtois	f	f	t	t	f	f	f	f		2025-06-13 23:34:16.526353	2025-06-13 23:34:16.526353	5	774	Female	Full Member	2025-07-09	\N
4257	Rachel Crateau	f	f	t	t	f	f	f	f	Work Weekend	2025-06-14 23:23:49.199097	2025-06-14 23:23:49.199097	261	742	Female	Full Member	2025-06-25	\N
4258	Scott James	f	f	t	t	f	f	f	f	Work Weekend	2025-06-14 23:25:05.380894	2025-06-14 23:25:05.380894	261	742	Male	Full Member	2025-06-25	\N
4049	Chris B.	f	t	t	t	f	f	f	f	Thursday arrival is tentative. 	2025-02-24 19:49:43.85817	2025-02-24 19:49:43.85817	15	675	Male	Full Member	2025-03-05	\N
4194	Nikki Shults	f	f	t	t	f	f	f	f	Closing out the season!	2025-04-17 15:11:17.548414	2025-04-17 15:11:17.548414	9	706	Female	Full Member	2025-04-16	\N
4050	Lori Lavoie	f	f	t	t	f	f	f	f		2025-02-25 13:30:39.730733	2025-02-25 13:30:39.730733	44	674	Female	Associate Member	2025-02-26	\N
4051	Michelle Comtois	f	f	t	t	f	f	f	f		2025-02-25 19:49:38.391866	2025-02-25 19:49:38.391866	5	675	Female	Full Member	2025-03-05	\N
4053	Pop	f	f	f	t	f	f	f	t	Masters Please.  Thank you!  For some reason, I clicked NO DINNER, and it's showing Dinner....  We do NOT want a dinner.  	2025-02-25 21:30:25.966597	2025-02-25 21:31:02.979686	7	675	Female	Guest	2025-03-05	\N
4052	Nung	f	f	f	t	f	f	f	t	NO Dinner please!!!	2025-02-25 21:29:47.259919	2025-02-25 21:31:28.365044	7	675	Male	Full Member	2025-03-05	\N
4054	Nung	f	f	f	t	f	f	f	t	NO dinner please	2025-02-25 21:36:49.86802	2025-02-25 21:36:49.86802	7	640	Male	Full Member	2025-03-19	\N
4055	Pop	f	f	f	t	f	f	f	t	Masters if available.  NO dinner please.	2025-02-25 21:37:25.14937	2025-02-25 21:37:25.14937	7	640	Female	Guest	2025-03-19	\N
4195	Tyler Buckeridge	f	f	t	t	f	f	f	f		2025-04-18 00:23:38.842166	2025-04-18 00:23:38.842166	436	677	Male	Full Member	2025-04-23	\N
4196	Vicki S	f	f	t	t	f	f	f	f	Tucks weekend - undecided on hiking. 	2025-04-18 02:41:26.234396	2025-04-18 02:43:39.657076	3	677	Female	Full Member	2025-04-23	\N
4056	Nikki Shults	f	f	t	t	t	f	f	f		2025-02-25 22:31:57.111069	2025-02-25 22:31:57.111069	9	640	Female	Full Member	2025-03-19	\N
4057	Shannon Slota	f	f	t	t	f	f	f	f	guest of nikki/dan	2025-02-25 22:32:27.245478	2025-02-25 22:32:27.245478	9	640	Female	Guest	2025-03-19	\N
4058	Kevin Holowaty	f	f	t	t	f	f	f	f	guest of nikki/dan	2025-02-25 22:32:49.498524	2025-02-25 22:32:49.498524	9	640	Male	Guest	2025-03-19	\N
4061	Doug Mayo	f	f	t	t	f	f	f	f	Let’s go skiing, no dinner thank you 	2025-02-26 00:49:42.880107	2025-02-26 00:49:42.880107	12	674	Male	Full Member	2025-02-26	\N
4062	Megan mayo	f	f	t	t	f	f	f	f	Let’s go skiing, no dinner thank you 	2025-02-26 00:50:23.942803	2025-02-26 00:50:23.942803	12	674	Female	Full Member	2025-02-26	\N
4063	Matt O	f	f	t	t	f	f	f	f	Hosted by JD. 	2025-02-26 01:59:23.225147	2025-02-26 01:59:23.225147	2	674	Male	Guest	2025-02-26	\N
4064	Lauren	f	f	t	t	f	f	f	f	Hosted by JD. 	2025-02-26 02:00:02.082092	2025-02-26 02:00:02.082092	2	674	Female	Guest	2025-02-26	\N
4065	Sara Delaney	f	f	t	t	f	f	f	f		2025-02-26 20:44:04.929646	2025-02-26 20:44:04.929646	31	674	Female	Full Member	2025-02-26	\N
4066	Sara Delaney	f	f	t	t	f	f	f	f		2025-02-26 20:44:31.765108	2025-02-26 20:44:31.765108	31	675	Female	Full Member	2025-03-05	\N
4067	Sara Delaney	f	f	t	t	f	f	f	f		2025-02-26 20:46:21.962734	2025-02-26 20:46:21.962734	31	640	Female	Full Member	2025-03-19	\N
4197	Nick Perrotti	f	f	t	t	f	f	f	f	Prospective member. We meet him ice bar weekend. Younger gentleman.	2025-04-19 12:32:16.675925	2025-04-19 12:32:16.675925	267	677	Male	Guest	2025-04-23	\N
4198	Gio Perrotti	f	f	t	t	f	f	f	f	Nicks brother	2025-04-19 12:32:48.417077	2025-04-19 12:32:48.417077	267	677	Male	Guest	2025-04-23	\N
4068	Chris B	f	f	t	t	f	f	f	f	Not 100% sure I will be able to make it yet!! But just in case. 	2025-02-27 00:28:06.707248	2025-02-27 00:28:06.707248	15	674	Male	Full Member	2025-02-26	\N
4199	Mike Ryan	f	f	f	f	f	f	f	f	No staying at club, but Teddy and I plan on joining.  	2025-04-22 15:22:08.073428	2025-04-22 15:22:08.073428	14	677	Male	Full Member	2025-04-23	\N
4200	Perry	f	f	t	t	f	f	f	f		2025-04-22 22:07:36.021254	2025-04-22 22:07:36.021254	153	677	Male	Full Member	2025-04-23	\N
4202	Rob Cant	f	f	t	t	f	f	f	f	First time visitor. Seems like a nice guy! -DS	2025-04-22 22:52:33.315072	2025-04-22 22:52:33.315072	20	677	Male	Guest	2025-04-23	\N
4069	Michelle Comtois	f	f	t	t	f	f	f	t	Maybe not Friday night 	2025-02-28 00:44:36.001161	2025-02-28 00:44:36.001161	5	640	Female	Full Member	2025-03-19	\N
4201	Deborah Bordeau	f	f	t	t	f	f	f	f	First time visitor! - DS	2025-04-22 22:40:56.607404	2025-04-22 22:40:56.607404	20	677	Female	Guest	2025-04-23	\N
4070	Alana	f	f	t	t	f	f	f	f	Race finals	2025-03-02 16:25:22.396018	2025-03-02 16:25:22.396018	23	675	Male	Full Member	2025-03-05	\N
4071	Tommy wall 	f	f	t	t	f	f	f	f	Race finals	2025-03-02 16:26:20.15273	2025-03-02 16:26:20.15273	23	675	Female	Full Member	2025-03-05	\N
4203	Michelle Comtois	f	f	t	t	f	f	f	f	Weather dependent most likely not 	2025-04-23 10:35:58.62001	2025-04-23 10:35:58.62001	5	677	Female	Full Member	2025-04-23	\N
4072	John D	f	t	t	t	t	f	f	f	Championship Weekend. Hat Dance. 	2025-03-03 14:04:21.591793	2025-03-03 14:04:21.591793	2	675	Male	Full Member	2025-03-05	\N
4204	Amanda	f	f	t	t	f	f	f	f		2025-04-27 23:06:05.499617	2025-04-27 23:06:05.499617	352	707	Female	Full Member	2025-04-30	\N
4205	Dominik	f	f	t	t	f	f	f	f		2025-04-27 23:06:43.297455	2025-04-27 23:06:43.297455	352	707	Male	Full Member	2025-04-30	\N
4073	Mike Ryan	f	f	f	f	f	f	f	f	Coming to Ice Bar, riding bus, unknow where I staying	2025-03-04 14:18:10.139427	2025-03-04 14:18:10.139427	14	640	Male	Full Member	2025-03-19	\N
4074	B. Halpin	f	f	f	f	f	f	f	f	Coming to Ice Bar, riding bus, unknow where he is staying	2025-03-04 14:18:43.449561	2025-03-04 14:18:43.449561	14	640	Male	Guest	2025-03-19	\N
4075	Nancy Murphy	f	f	t	t	f	f	f	f	Ice Bar	2025-03-04 14:29:18.890102	2025-03-04 14:29:18.890102	51	640	Female	Full Member	2025-03-19	\N
4076	Doug Mayo	f	f	t	t	f	f	f	f	No dinner thank you, let’s go skiing 	2025-03-04 14:54:42.374907	2025-03-04 14:54:42.374907	12	675	Male	Full Member	2025-03-05	\N
4077	Megan mayo 	f	f	t	t	f	f	f	f	No dinner thank you, let’s go skiing 	2025-03-04 14:55:14.28937	2025-03-04 14:55:14.28937	12	675	Female	Full Member	2025-03-05	\N
4206	Vicki S	f	f	t	t	f	f	f	f	Maybe	2025-04-29 18:04:01.733224	2025-04-29 18:04:01.733224	3	707	Female	Full Member	2025-04-30	\N
4078	Lori Lavoie	f	f	t	t	f	f	f	t	Only a maybe if I’ll actually come up	2025-03-05 11:12:57.945499	2025-03-05 11:12:57.945499	44	675	Female	Associate Member	2025-03-05	\N
4079	Tyler Buckeridge	f	f	t	t	f	f	f	f		2025-03-05 13:38:30.733906	2025-03-05 13:38:30.733906	436	675	Male	Full Member	2025-03-05	\N
4080	Aaron Uehara	f	f	t	t	f	f	f	f		2025-03-05 16:57:50.367761	2025-03-05 16:57:50.367761	404	675	Male	Full Member	2025-03-05	\N
4081	Sunny Uehara	f	f	t	t	f	f	f	f	We might not be up for Friday night, depending on Sunny's knee...	2025-03-05 17:02:02.486287	2025-03-05 17:02:02.486287	404	675	Female	Full Member	2025-03-05	\N
4082	Chris B	f	f	t	t	f	f	f	f	Tentative based on dog sitting. 75% chance. 	2025-03-05 18:10:58.237688	2025-03-05 18:10:58.237688	15	640	Male	Full Member	2025-03-19	\N
4083	Amy Candelora	f	f	t	t	f	f	f	f	Purple drank 	2025-03-05 23:08:58.771131	2025-03-05 23:08:58.771131	16	640	Female	Full Member	2025-03-19	\N
4084	Chris Candelora 	f	f	t	t	f	f	f	f	My wife is getting drunk!!!!  Mike is in charge of her.  Lol	2025-03-05 23:10:00.608956	2025-03-05 23:10:00.608956	16	640	Male	Full Member	2025-03-19	\N
4085	Jon Macomber	f	f	f	f	t	t	t	f		2025-03-06 01:11:14.247756	2025-03-06 01:11:14.247756	340	675	Male	Full Member	2025-03-05	\N
4207	Perry 	f	f	f	t	f	f	f	f	Leaning towards no 	2025-05-01 15:27:21.466194	2025-05-01 15:27:21.466194	153	707	Male	Full Member	2025-04-30	\N
4086	Alana M	f	f	t	t	f	f	f	f	Ice bar + dinner!	2025-03-06 23:16:32.300037	2025-03-06 23:16:32.300037	23	640	Female	Full Member	2025-03-19	\N
4087	Tommy W	f	f	t	t	f	f	f	f	Ice bar!! (Plus dinner)	2025-03-06 23:17:14.347946	2025-03-06 23:17:14.347946	23	640	Male	Full Member	2025-03-19	\N
4088	Andrew Blohm 	f	f	t	t	f	f	f	f	Ice bar.  	2025-03-07 01:02:00.523749	2025-03-07 01:02:00.523749	142	640	Male	Full Member	2025-03-19	\N
4089	Dominik	f	f	t	t	f	f	f	f		2025-03-09 21:05:17.538873	2025-03-09 21:05:17.538873	267	673	Male	Full Member	2025-03-12	\N
4090	Dominik	f	f	t	t	f	f	f	f		2025-03-09 21:08:24.022385	2025-03-09 21:08:24.022385	267	640	Male	Full Member	2025-03-19	\N
4091	Amanda	f	f	t	t	f	f	f	f		2025-03-11 02:22:54.032725	2025-03-11 02:22:54.032725	352	673	Female	Full Member	2025-03-12	\N
4092	Amanda	f	f	t	t	f	f	f	f		2025-03-11 15:12:59.985691	2025-03-11 15:12:59.985691	352	640	Female	Full Member	2025-03-19	\N
4093	Brandon Juby	f	f	t	t	f	f	f	f	Friend of Dan and Nikki. -DS	2025-03-11 20:37:14.572389	2025-03-11 20:37:14.572389	20	640	Male	Guest	2025-03-19	\N
4094	Dan Shults	f	f	t	t	f	f	f	f	*Nice* Bar	2025-03-11 20:39:48.576873	2025-03-11 20:39:48.576873	20	640	Male	Full Member	2025-03-19	\N
4095	John D	f	t	t	t	t	f	f	f		2025-03-12 00:04:08.8527	2025-03-12 00:04:08.8527	2	673	Male	Full Member	2025-03-12	\N
4096	Tyler Buckeridge	f	f	t	t	f	f	f	f		2025-03-12 01:59:59.826876	2025-03-12 01:59:59.826876	436	673	Male	Full Member	2025-03-12	\N
4097	Ankur Chawla	f	f	f	t	f	f	f	f	Returning guest- came to Best Weekend. Indicated Saturday night only, but I will double check with him about Friday. - DS	2025-03-12 15:49:31.571676	2025-03-12 15:49:31.571676	20	640	Male	Guest	2025-03-19	\N
4098	Alana	f	f	t	t	f	f	f	f	Weather dependent	2025-03-12 21:50:07.64977	2025-03-12 21:50:07.64977	23	673	Female	Full Member	2025-03-12	\N
4099	Tommy	f	f	t	t	f	f	f	f	If Alana lets me go	2025-03-12 21:50:49.945095	2025-03-12 21:50:49.945095	23	673	Male	Full Member	2025-03-12	\N
4100	Aaron Uehara	f	f	t	t	f	f	f	f		2025-03-12 22:32:05.566566	2025-03-12 22:32:05.566566	404	673	Male	Full Member	2025-03-12	\N
4101	Sunny Uehara	f	f	t	t	f	f	f	f		2025-03-12 22:32:24.273185	2025-03-12 22:32:24.273185	404	673	Female	Full Member	2025-03-12	\N
3933	Kate Matson	f	f	f	t	f	f	f	f	Returning prospect. Saturday only.  - DS	2025-01-21 15:51:35.348002	2025-03-13 15:10:35.469262	20	640	Female	Guest	2025-03-19	\N
4103	Aaron’s Uehara	f	f	t	t	t	f	f	f		2025-03-15 02:00:57.203578	2025-03-15 02:00:57.203578	404	640	Male	Full Member	2025-03-19	\N
4102	Perry	f	f	t	t	f	f	f	f	Most likely not making it up, but adding just incase 	2025-03-14 22:29:12.159626	2025-03-19 13:14:47.586394	153	640	Male	Full Member	2025-03-19	\N
4104	Sunny Uehara	f	f	t	t	t	f	f	f		2025-03-15 02:01:23.647502	2025-03-15 02:01:23.647502	404	640	Female	Full Member	2025-03-19	\N
4105	John D	f	f	t	t	t	f	f	t	ICE Bah!	2025-03-16 21:20:39.001844	2025-03-19 21:54:54.013752	2	640	Male	Full Member	2025-03-19	\N
4106	Rachel Crateau	f	f	t	t	f	f	f	f	Steamed Hot Dogs will be ready for the bus ride to Ice Bar and Pizza from Maddy B's will be picked up on the way back! 	2025-03-18 14:16:36.21685	2025-03-18 14:16:36.21685	261	640	Female	Full Member	2025-03-19	\N
4107	Scott James	f	f	t	t	f	f	f	f		2025-03-18 14:17:04.261817	2025-03-18 14:17:04.261817	261	640	Male	Full Member	2025-03-19	\N
4108	Rachel Crateau	f	f	t	t	f	f	f	f		2025-03-18 14:24:10.308356	2025-03-18 14:24:10.308356	261	676	Female	Full Member	2025-04-02	\N
4109	Scott James	f	f	t	t	f	f	f	f		2025-03-18 14:24:35.867252	2025-03-18 14:24:35.867252	261	676	Male	Full Member	2025-04-02	\N
4110	Christian Bortnick	f	f	f	t	f	f	f	f		2025-03-18 20:20:05.713203	2025-03-18 20:20:05.713203	261	640	Male	Full Member	2025-03-19	\N
4111	Tyler Buckeridge	f	f	t	t	f	f	f	f		2025-03-19 01:08:31.324836	2025-03-19 01:08:31.324836	436	640	Male	Full Member	2025-03-19	\N
4112	Nicholas Skovran	f	f	t	t	t	f	f	f	Bringing 1 female guest.  (Isabel Rauch)	2025-03-19 17:47:10.126681	2025-03-19 17:47:10.126681	329	640	Male	Full Member	2025-03-19	\N
4113	Isabel Rauch	f	f	t	t	t	f	f	f	Guest of Nick S.	2025-03-19 19:12:07.03511	2025-03-19 19:13:41.510333	261	640	Female	Guest	2025-03-19	\N
4114	Ryan Braid	f	f	f	t	f	f	f	f	No dinner please. Thanks!	2025-03-19 23:20:32.156288	2025-03-19 23:20:32.156288	339	640	Male	Full Member	2025-03-19	\N
4115	Jenna	f	f	f	t	f	f	f	f	No dinner please. Thanks!	2025-03-19 23:21:02.873131	2025-03-19 23:21:02.873131	339	640	Female	Full Member	2025-03-19	\N
4116	Christian Bortnick	f	f	t	t	f	f	f	f		2025-03-23 13:00:16.516408	2025-03-23 13:00:16.516408	469	677	Male	Full Member	2025-04-23	\N
4117	Mike Ryan	f	f	t	t	f	f	f	f	Hosting Wildcat Ski School Party on Saturday night	2025-03-24 19:15:38.123335	2025-03-24 19:15:38.123335	14	678	Male	Full Member	2025-03-26	\N
4118	Dan Shults	f	f	t	t	f	f	f	f	Maybe Jay Peak on Saturday?	2025-03-25 17:04:19.149202	2025-03-25 17:04:19.149202	20	678	Male	Full Member	2025-03-26	\N
4119	Dominik	f	f	t	f	f	f	f	f	Maybe. Friday night only.	2025-03-25 21:11:54.835194	2025-03-25 21:11:54.835194	267	678	Male	Full Member	2025-03-26	\N
4120	Nikki Shults	f	f	t	t	f	f	f	f		2025-03-26 00:41:29.435963	2025-03-26 00:41:29.435963	9	678	Female	Full Member	2025-03-26	\N
4121	Doug Mayo	f	f	t	f	f	f	f	f	Maybe one more time 	2025-03-26 10:50:33.331798	2025-03-26 10:50:33.331798	12	678	Male	Full Member	2025-03-26	\N
4122	Dan Shults	f	f	t	t	f	f	f	f	Tux!	2025-03-26 14:10:00.64295	2025-03-26 14:10:00.64295	20	677	Male	Full Member	2025-04-23	\N
4124	Aaron Uehara	f	f	t	t	t	f	f	f	I am a maybe on Sunday night. Just in case that rain turns to snow, I might be calling in a sick day!	2025-03-26 18:54:29.902575	2025-03-26 18:54:29.902575	404	678	Male	Full Member	2025-03-26	\N
4125	Tyler Buckeridge	f	f	t	t	f	f	f	f		2025-03-26 22:31:25.580241	2025-03-26 22:31:25.580241	436	678	Male	Full Member	2025-03-26	\N
4123	Kate Naples	f	f	f	t	f	f	f	f	Hike Saturday AM then race banquet and party. Interested in membership. -DS	2025-03-26 16:32:32.026869	2025-04-02 13:39:00.622382	20	679	Female	Guest	2025-04-09	\N
3208	Sara Delaney	f	f	t	t	f	f	f	t	First aid, woo hoo!	2024-01-04 20:12:15.778328	2024-01-04 20:12:15.778328	31	540	Female	Full Member	2024-01-17	\N
3244	Perry F	f	f	t	t	f	f	f	f		2024-01-15 12:47:53.881656	2024-01-15 12:47:53.881656	153	540	Male	Full Member	2024-01-17	\N
3288	megan mayo	f	f	t	t	f	f	f	t	GetIntoIt	2024-01-23 16:24:40.832468	2024-01-23 16:24:40.832468	12	541	Female	Full Member	2024-01-24	\N
3743	Vicki S	f	f	t	t	f	f	f	t	‘Tis Peak Work Weekend 	2024-10-22 03:26:56.330464	2024-10-22 03:28:11.054773	3	571	Female	Full Member	2024-10-30	\N
1	Chris	f	f	t	t	f	f	f	t	test	2017-08-22 23:04:42.818132	2017-08-22 23:04:42.818132	1	1	Male	Full Member	2017-08-23	\N
2	Nikki Therrien	f	f	t	t	f	f	f	t	Work Weekend!!!	2017-10-09 20:15:23.174746	2017-10-09 20:15:23.174746	1	2	Female	Full Member	2017-10-18	\N
3	Dan Shults	f	f	t	t	f	f	f	t	Work Weekend	2017-10-09 20:16:43.993097	2017-10-09 20:16:43.993097	1	2	Male	Full Member	2017-10-18	\N
4	Linda McGray	f	f	t	t	f	f	f	t	I'll be up for the first work weekend.	2017-10-09 20:17:56.033134	2017-10-09 20:17:56.033134	1	2	Female	Full Member	2017-10-18	\N
5	Amy	f	f	t	t	f	f	f	t		2017-10-09 21:13:13.617378	2017-10-09 21:13:13.617378	16	4	Female	Full Member	2017-11-01	\N
6	Mike Ryan	f	f	t	t	f	f	f	t	I love work weekend!!!	2017-10-10 22:30:25.898087	2017-10-10 22:30:25.898087	1	2	Male	Full Member	2017-10-18	\N
7	Chris Bromery	f	f	t	t	f	f	f	t	I LOVE Work Weekend!!!	2017-10-17 19:42:14.908122	2017-10-17 19:42:14.908122	1	2	Male	Full Member	2017-10-18	\N
8	Chris	f	f	t	t	f	f	f	t	Workweekend	2017-10-18 21:30:18.54311	2017-10-18 21:30:18.54311	1	2	Male	Full Member	2017-10-18	\N
9	Amy	f	f	t	t	f	f	f	t	Work weekend	2017-10-18 21:31:01.572056	2017-10-18 21:31:01.572056	1	2	Female	Full Member	2017-10-18	\N
10	Nung	f	f	t	t	f	f	f	t	Work weekend.  Yahoo!!!	2017-10-20 16:10:03.219206	2017-10-20 16:10:03.219206	7	5	Male	Full Member	2017-10-25	\N
11	Michelle Comtois	f	f	t	t	f	f	f	t	Work Weekend 	2017-10-21 00:01:01.519996	2017-10-21 00:01:01.519996	5	5	Female	Full Member	2017-10-25	\N
12	Mike Ryan	f	f	t	t	f	f	f	t	Wildcat Meeting on Saturday - May stay at my cabin	2017-10-24 15:09:02.113219	2017-10-24 15:09:02.113219	14	5	Male	Full Member	2017-10-25	\N
13	Darrell	f	f	t	t	f	f	f	t	Work Weekend	2017-10-24 20:09:49.276456	2017-10-24 20:09:49.276456	6	5	Male	Full Member	2017-10-25	\N
14	Kerin	f	f	t	t	f	f	f	t	Work Weekend	2017-10-24 20:10:06.534116	2017-10-24 20:10:06.534116	6	5	Female	Full Member	2017-10-25	\N
15	Katelin Murphy	f	f	t	t	f	f	f	f	New Prospective member sourced through the EISCL Inquiry Form. First visit.	2017-10-27 01:51:07.440253	2017-10-27 01:51:07.440253	15	6	Female	Guest	2017-11-22	\N
16	Stephen Bach	f	f	t	t	f	f	f	f	ULLR Weekend. First time guest/Prospective Member sourced via EISCL member inquiry.	2017-10-31 01:23:40.242297	2017-10-31 01:23:40.242297	15	6	Male	Guest	2017-11-22	\N
18	Axel Christensen	f	f	t	t	f	f	f	f	ULLR Weekend - Guest/Prospective Member sourced via EISCL inquiry form.	2017-11-04 02:19:41.425743	2017-11-04 02:19:41.425743	15	6	Male	Guest	2017-11-22	\N
19	Axel Christensen	f	f	t	t	f	f	f	f	Heaven and Hell Weekend - Guest/Prospective Member sourced via EISCL inquiry form.	2017-11-04 02:24:29.377027	2017-11-04 02:24:29.377027	15	7	Male	Guest	2017-12-06	\N
20	Ron Swanick	f	f	t	t	f	f	f	f	ULLR Weekend! Guest of Chris B and prospective member.	2017-11-08 04:34:35.763307	2017-11-08 04:34:35.763307	15	6	Male	Guest	2017-11-22	\N
22	Amy Cheever	f	f	t	t	t	f	f	f	bringing 2 guests\r\n	2017-11-12 02:39:11.281399	2017-11-12 02:42:39.064239	16	6	Female	Full Member	2017-11-22	\N
23	Chris Candelora	f	f	t	t	f	f	f	f		2017-11-12 02:40:25.325045	2017-11-12 02:42:54.515164	16	6	Male	Full Member	2017-11-22	\N
24	Rose Candelora	f	f	t	t	f	f	f	f		2017-11-12 02:40:53.001829	2017-11-12 02:43:09.936271	16	6	Female	Guest	2017-11-22	\N
25	Linda	f	f	t	t	f	f	f	f		2017-11-12 02:41:20.329209	2017-11-12 02:43:32.956966	16	6	Female	Guest	2017-11-22	\N
3922	Jenna	f	f	f	t	f	f	f	t	possibly 	2025-01-16 04:11:46.017109	2025-01-16 04:11:46.017109	366	611	Female	Full Member	2025-01-15	\N
3923	Chris B.	f	f	t	t	f	f	f	t		2025-01-17 23:45:06.94338	2025-01-17 23:45:06.94338	15	610	Male	Full Member	2025-01-22	\N
3924	Michelle	f	f	t	t	f	f	f	t	No dinner 	2025-01-19 13:14:32.32205	2025-01-19 13:14:32.32205	5	612	Female	Full Member	2025-01-29	\N
281	Alana McCarthy	f	f	t	t	t	f	f	t	Work weekend	2018-04-22 21:56:50.320929	2018-04-22 21:56:50.320929	23	28	Female	Full Member	2018-05-02	\N
28	Linda McGray	f	f	t	t	f	f	f	f	Looking forward to my first Ullr!	2017-11-13 19:09:18.153333	2017-11-13 19:09:18.153333	13	6	Female	Full Member	2017-11-22	\N
29	Linda McGray	f	f	t	t	f	f	f	t		2017-11-14 02:05:30.049981	2017-11-14 02:05:30.049981	13	7	Female	Full Member	2017-12-06	\N
30	Doug mayo	f	f	t	t	f	f	f	t	Work weekend 	2017-11-14 02:11:40.596075	2017-11-14 02:12:08.593592	12	8	Male	Full Member	2017-11-15	\N
31	Megan McCauley	f	f	t	t	f	f	f	t	Work weekend 	2017-11-14 02:13:23.550056	2017-11-14 02:13:23.550056	12	8	Female	Full Member	2017-11-15	\N
32	Michelle Comtois	f	f	t	t	f	f	f	f	ULLR	2017-11-15 02:08:48.434065	2017-11-15 02:08:48.434065	5	6	Female	Full Member	2017-11-22	\N
33	Mike Ryan	f	f	t	t	f	f	f	t	Ullr!!!	2017-11-15 16:48:34.924222	2017-11-15 16:48:34.924222	14	6	Male	Full Member	2017-11-22	\N
34	Mike Ryan	f	f	t	t	f	f	f	t		2017-11-15 16:49:43.629467	2017-11-15 16:49:43.629467	14	9	Male	Full Member	2017-11-29	\N
36	Mike Ryan	f	f	t	t	f	f	f	t		2017-11-15 16:50:40.067438	2017-11-15 16:50:40.067438	14	10	Male	Full Member	2017-12-13	\N
37	Mike Ryan	f	f	t	t	t	f	f	t		2017-11-15 16:51:09.176128	2017-11-15 16:51:09.176128	14	11	Male	Full Member	2017-12-20	\N
38	Mike Ryan	f	f	t	t	t	f	f	t		2017-11-15 16:51:39.733689	2017-11-15 16:51:39.733689	14	12	Male	Full Member	2017-12-27	\N
35	Mike Ryan	f	f	t	t	f	f	f	f		2017-11-15 16:50:07.522131	2017-11-15 16:54:46.24426	14	7	Male	Full Member	2017-12-06	\N
39	Boback Sharifian	f	f	t	t	f	f	f	f	ULLR Weekend - First Time Guest/Prospective Member via EISCL Inquiry.	2017-11-17 00:21:31.577876	2017-11-17 00:21:31.577876	15	6	Male	Guest	2017-11-22	\N
40	Amy Cheever	f	f	t	t	f	f	f	t	Can't wait!	2017-11-18 22:48:00.301232	2017-11-18 22:48:00.301232	16	7	Female	Full Member	2017-12-06	\N
41	Chris Candelora	f	f	t	t	f	f	f	t	I will blow up all the balloons!	2017-11-18 22:48:42.470699	2017-11-18 22:48:42.470699	16	7	Male	Full Member	2017-12-06	\N
42	Michelle Comtois	f	f	t	t	f	f	f	t		2017-11-19 23:52:37.928051	2017-11-19 23:52:37.928051	5	7	Female	Full Member	2017-12-06	\N
44	Karen Tofteroo	f	f	t	t	f	f	f	f	ULLR Weekend. First time guest/prospective member. Friend/guest of Chris B.	2017-11-20 02:30:02.387357	2017-11-20 02:30:02.387357	15	6	Female	Guest	2017-11-22	\N
43	Marge Harlow	f	f	t	t	f	f	f	f	ULLR Weekend. First time guest/prospective member. Sourced via EISCL Inquiry form.	2017-11-20 02:28:39.949563	2017-11-20 02:30:24.487805	15	6	Female	Guest	2017-11-22	\N
45	Chris Bromery	f	f	t	t	f	f	f	f	ULLR Weekend.	2017-11-20 02:31:19.70665	2017-11-20 02:31:19.70665	15	6	Male	Full Member	2017-11-22	\N
46	Nung	f	f	t	t	f	f	f	f	ULLR!!!!	2017-11-20 17:41:58.737211	2017-11-20 17:41:58.737211	7	6	Male	Full Member	2017-11-22	\N
48	Drew Novak	f	f	t	t	f	f	f	f	Guest Friend of Amy Cheever and Chris C.	2017-11-27 01:14:44.153855	2017-11-27 01:14:44.153855	16	7	Male	Guest	2017-12-06	\N
49	Amy Cheever	t	t	t	t	t	f	f	t	Holiday break	2017-11-27 02:50:07.352424	2017-11-27 02:50:07.352424	16	12	Female	Full Member	2017-12-27	\N
50	Chris Candelora	t	t	t	t	t	f	f	t	Christmas break and new years	2017-11-27 02:50:50.851465	2017-11-27 02:50:50.851465	16	12	Male	Full Member	2017-12-27	\N
51	Joanne Murphy	t	t	t	t	t	f	f	t	Guest Possible member	2017-11-27 02:52:19.21011	2017-11-27 02:52:19.21011	16	12	Female	Guest	2017-12-27	\N
52	Cher	f	f	t	t	f	f	f	t	Friend of Chris and Amy (2nd weekend) possible member	2017-11-27 03:07:16.847581	2017-11-27 03:07:16.847581	16	7	Female	Guest	2017-12-06	\N
53	Matt C.	f	f	t	t	f	f	f	t	Guest-  (2nd visit)  Possible member	2017-11-27 03:07:54.09441	2017-11-27 03:07:54.09441	16	7	Male	Guest	2017-12-06	\N
54	Dan Shults	f	f	t	t	f	f	f	f		2017-11-27 14:43:12.481655	2017-11-27 14:43:12.481655	20	7	Male	Full Member	2017-12-06	\N
55	Nita Tallent	f	f	t	t	f	f	f	f	First Aid Weekend. Guest (second visit) sourced via EISCL Inquiry.	2017-11-28 21:17:56.976854	2017-11-28 21:17:56.976854	15	13	Female	Guest	2018-01-03	\N
56	Chris Bromery	f	f	t	t	f	f	f	f	First Aid!!!	2017-11-28 21:18:54.234344	2017-11-28 21:18:54.234344	15	13	Male	Full Member	2018-01-03	\N
17	Sigrun Hancock	f	f	f	f	f	f	f	t	Sigrun is not able to attend this weekend. Will be attending First Aid, couldn't change the date or delete.	2017-10-31 01:39:55.308701	2017-11-30 03:51:09.974575	15	7	Female	Guest	2017-12-06	\N
57	Sigrun Hancock	f	f	t	t	f	f	f	f	First Aid Weekend! Guest/prospective member, second visit, friend of Chris B. Was supposed to attend Best Weekend but had a conflict.	2017-11-30 03:54:52.296728	2017-11-30 03:54:52.296728	15	13	Female	Guest	2018-01-03	\N
21	Nikki Therrien	f	f	t	t	f	f	f	f	Best Weekend Ever	2017-11-08 19:27:41.836292	2017-11-30 15:03:24.69935	9	7	Female	Full Member	2017-12-06	\N
58	Mark Buckley	f	f	t	t	f	f	f	t		2017-12-05 03:15:02.482325	2017-12-05 03:15:02.482325	22	7	Male	Full Member	2017-12-06	\N
59	THOMAS WALL	f	f	t	t	f	f	f	t	Best of the best	2017-12-05 21:26:41.865943	2017-12-05 21:26:41.865943	21	7	Male	Full Member	2017-12-06	\N
60	Darrell	f	f	f	t	f	f	f	t		2017-12-05 21:31:31.398773	2017-12-05 21:31:31.398773	6	7	Male	Full Member	2017-12-06	\N
61	Kerin	f	f	f	t	f	f	f	t		2017-12-05 21:31:46.488879	2017-12-05 21:31:46.488879	6	7	Female	Full Member	2017-12-06	\N
62	Alana McCARTHY 	f	f	t	t	t	f	f	t	Best weekend!	2017-12-05 22:25:15.632199	2017-12-05 22:25:15.632199	23	7	Female	Full Member	2017-12-06	\N
63	Nung	f	f	t	t	t	t	f	t	Heaven 'n Hell!!!!	2017-12-06 00:55:38.606271	2017-12-06 00:55:38.606271	7	7	Male	Full Member	2017-12-06	\N
64	Sara	f	f	f	t	f	f	f	t		2017-12-06 02:53:44.155367	2017-12-06 02:53:44.155367	43	7	Female	Full Member	2017-12-06	\N
65	doug mayo	f	f	t	f	f	f	f	t	No dinner, heading back after attitash training	2017-12-06 11:53:49.098735	2017-12-06 11:53:49.098735	12	7	Male	Full Member	2017-12-06	\N
66	megan mccauley	f	f	t	f	f	f	f	t	no dinner, heading back saturday	2017-12-06 11:54:51.732574	2017-12-06 11:54:51.732574	12	7	Female	Full Member	2017-12-06	\N
67	Karen	f	f	t	t	f	f	f	t	volleyball guest	2017-12-06 17:02:17.49581	2017-12-06 17:02:17.49581	16	7	Female	Guest	2017-12-06	\N
68	Karen's husband	f	f	t	t	f	f	f	t	volleyball guest	2017-12-06 17:02:52.448928	2017-12-06 17:02:52.448928	16	7	Male	Guest	2017-12-06	\N
282	Kurt yang	f	t	f	f	f	f	f	t	Five guests	2018-04-25 14:24:52.648416	2018-04-25 14:24:52.648416	10	28	Male	Full Member	2018-05-02	\N
69	Mark Buckley	f	f	t	t	f	f	f	f		2017-12-12 01:01:44.607707	2017-12-12 01:10:00.815672	22	13	Male	Full Member	2018-01-03	\N
70	Hiliary Carlson	f	f	t	t	f	f	f	f		2017-12-12 01:03:12.661911	2017-12-12 01:10:38.837852	22	13	Female	Guest	2018-01-03	\N
121	Jim Mcwilliams 	f	f	t	t	f	f	f	f	Jim is a Wedeln guest of Nung 	2018-01-01 22:24:12.44691	2018-01-01 22:24:12.44691	7	13	Male	Guest	2018-01-03	\N
122	Katelin Murphy	f	f	t	t	f	f	f	t	repeated guest, possible member	2018-01-02 02:33:24.99504	2018-01-02 02:33:24.99504	16	13	Female	Guest	2018-01-03	\N
73	Brendan Halpin	f	f	t	t	f	f	f	f		2017-12-12 01:07:01.533254	2017-12-12 01:11:55.328825	22	13	Male	Guest	2018-01-03	\N
74	Kristen Chamberlain 	f	f	t	t	f	f	f	f		2017-12-12 01:07:41.670551	2017-12-12 01:12:23.960771	22	13	Female	Guest	2018-01-03	\N
75	John Dobermiller	t	t	t	t	t	t	t	t		2017-12-12 16:47:19.210356	2017-12-12 16:47:19.210356	2	11	Male	Full Member	2017-12-20	\N
76	John Dobermiller	t	t	t	t	t	t	f	t		2017-12-12 16:48:39.433344	2017-12-12 16:48:39.433344	2	12	Male	Full Member	2017-12-27	\N
77	Amy Cheever	f	f	t	t	f	f	f	f	First Aid	2017-12-12 23:45:13.849304	2017-12-12 23:45:13.849304	16	13	Female	Full Member	2018-01-03	\N
78	Chris Candelora	f	f	t	t	f	f	f	t	First Aid!  Can't wait.	2017-12-12 23:46:58.134516	2017-12-12 23:46:58.134516	16	13	Male	Full Member	2018-01-03	\N
79	doug mayo	f	f	t	f	f	f	f	t		2017-12-13 12:01:24.376749	2017-12-13 12:01:24.376749	12	10	Male	Full Member	2017-12-13	\N
80	megan mcccauley	f	f	t	f	f	f	f	t		2017-12-13 12:02:05.880016	2017-12-13 12:02:05.880016	12	10	Female	Full Member	2017-12-13	\N
82	Mike Ryan	f	f	t	t	t	f	f	t		2017-12-13 18:28:47.553655	2017-12-13 18:28:47.553655	14	14	Male	Full Member	2018-01-10	\N
83	Mike Ryan	f	f	t	t	f	f	f	t		2017-12-13 18:29:27.642791	2017-12-13 18:29:27.642791	14	15	Male	Full Member	2018-01-24	\N
84	Dan Shults	f	f	t	t	t	f	f	t	New Year's! The plan is 1 day at Wildcat and 1 at Attitash. Also, the Makusue's party.	2017-12-15 21:45:48.683327	2017-12-15 21:45:48.683327	20	12	Male	Full Member	2017-12-27	\N
85	Nikki T	f	f	f	t	t	t	f	t		2017-12-16 00:36:37.345412	2017-12-16 00:37:33.427797	9	12	Female	Full Member	2017-12-27	\N
86	Nikki Therrien	f	f	t	t	f	f	f	f		2017-12-16 00:38:21.127174	2017-12-16 00:38:21.127174	9	13	Female	Full Member	2018-01-03	\N
87	Ron Swanick	f	f	t	t	f	f	f	f	First Aid Weekend. Guest of Chris Bromery and prospective member (2nd visit).	2017-12-18 20:01:05.201003	2017-12-18 20:01:31.961311	15	13	Male	Guest	2018-01-03	\N
119	Laura Collins	f	f	t	t	f	f	f	f	Friend of Linda McGray. First time at the club..	2017-12-29 12:37:05.751681	2017-12-30 05:50:56.208674	13	13	Female	Guest	2018-01-03	\N
89	Vicki Santarcangelo	f	f	t	t	f	f	f	f	First Aid!	2017-12-18 20:32:11.955034	2017-12-18 20:33:36.573215	3	13	Female	Full Member	2018-01-03	\N
90	doug mayo	f	t	t	t	t	f	f	t	vacation	2017-12-19 13:51:29.416224	2017-12-19 13:51:29.416224	12	12	Male	Full Member	2017-12-27	\N
91	Dan Shults	f	f	t	t	f	f	f	f	Furst Ade	2017-12-19 15:57:35.151209	2017-12-19 15:57:35.151209	20	13	Male	Full Member	2018-01-03	\N
92	Sara Rodriguez	f	f	t	t	f	f	f	t	Guest of Amy Cheever.  2nd time coming up	2017-12-19 23:28:56.499219	2017-12-19 23:28:56.499219	16	13	Female	Guest	2018-01-03	\N
93	Shana Mcginnis	f	f	t	t	f	f	f	t	guest of Amy Cheever  2nd visit	2017-12-19 23:29:49.137071	2017-12-19 23:29:49.137071	16	13	Female	Guest	2018-01-03	\N
159	Pam Sittig	f	f	t	t	f	f	f	f	Friends with Mark and Hiliary - First time guest	2018-01-15 22:44:00.924365	2018-01-15 22:44:00.924365	22	16	Female	Guest	2018-02-07	\N
95	Chris Kirch	f	f	t	t	f	f	f	f	From Volleyball - still plays regularly w Nikki and Dan. Second time at the club (first time was vball weekend). Reserved by Dan.	2017-12-20 13:50:29.158556	2017-12-20 13:50:29.158556	20	13	Male	Guest	2018-01-03	\N
96	Michelle Comtois	f	f	t	t	f	f	f	t		2017-12-23 14:16:40.265378	2017-12-23 14:16:40.265378	5	13	Female	Full Member	2018-01-03	\N
97	Lori Lavoie	t	t	t	t	t	f	f	t	Only Maybe Weds thru Fri	2017-12-24 14:57:33.08453	2017-12-24 14:57:33.08453	44	12	Female	Full Member	2017-12-27	\N
98	Megan McCauley	t	t	t	t	t	t	f	t	I’m headed up tonight Mon Dec25, and also staying Tues 26. 	2017-12-25 20:54:38.599212	2017-12-25 20:54:38.599212	11	12	Female	Full Member	2017-12-27	\N
99	Megan McCauley	t	t	t	t	t	t	f	t	I plan on staying Monday and Tuesday as well 12/25, 12/26	2017-12-25 20:57:03.543109	2017-12-25 20:57:03.543109	11	12	Female	Full Member	2017-12-27	\N
100	Doug mayo	f	t	t	t	t	f	f	t		2017-12-25 22:05:27.042795	2017-12-25 22:05:27.042795	12	12	Male	Full Member	2017-12-27	\N
101	Megan Mccauley 	t	t	t	t	t	f	f	t		2017-12-25 22:06:10.383055	2017-12-25 22:06:10.383055	12	12	Female	Full Member	2017-12-27	\N
102	Sara Delaney	f	f	f	t	t	f	f	t		2017-12-26 18:41:21.334539	2017-12-26 18:41:21.334539	31	12	Female	Associate Member	2017-12-27	\N
103	Cher Vitale	f	t	t	t	t	f	f	t	guest of Amy Cheever and Chris Candelora	2017-12-26 22:52:31.233524	2017-12-26 22:52:31.233524	16	12	Female	Guest	2017-12-27	\N
104	Matt C	f	t	t	t	t	f	f	t	Guest of Amy and Chris	2017-12-26 22:53:48.50529	2017-12-26 22:53:48.50529	16	12	Male	Guest	2017-12-27	\N
105	Greg	f	f	f	t	t	f	f	t	Guest of Amy and Chris	2017-12-26 22:54:42.649131	2017-12-26 22:54:42.649131	16	12	Male	Guest	2017-12-27	\N
106	Tommy Wall	f	f	t	t	t	f	f	f		2017-12-26 23:07:07.490713	2017-12-26 23:08:04.258502	21	12	Male	Full Member	2017-12-27	\N
107	Alana MCCARTHY 	f	f	t	t	t	t	f	t		2017-12-26 23:11:16.665565	2017-12-26 23:11:16.665565	23	12	Female	Full Member	2017-12-27	\N
108	Michelle Comtois	f	f	t	t	f	f	f	t		2017-12-27 03:02:56.395789	2017-12-27 03:02:56.395789	5	12	Female	Full Member	2017-12-27	\N
109	Nung	f	f	t	t	f	f	f	t		2017-12-27 18:05:38.947312	2017-12-27 18:05:38.947312	7	12	Male	Full Member	2017-12-27	\N
110	Kurt Yang	f	f	t	t	f	f	f	t	Hi, I may bring three or so guests with me.  one or two female and one or two male friends. Put one female as Kurt's female friend and one male as Kurt's male friend when arranging the beds. I don't know their exact schedule and extreme cold weather could make hiking event unsure.  Thanks. 	2017-12-27 22:42:10.108717	2017-12-27 22:42:10.108717	10	12	Male	Full Member	2017-12-27	\N
111	Kurt's Female Friend No 1 	f	f	t	t	f	f	f	t		2017-12-27 22:46:12.159508	2017-12-27 22:46:12.159508	10	12	Female	Guest	2017-12-27	\N
112	Kurt's male Friend No 1 	f	f	t	t	f	f	f	t		2017-12-27 22:46:51.720266	2017-12-27 22:46:51.720266	10	12	Male	Guest	2017-12-27	\N
113	Jim Donahue	f	f	t	t	f	f	f	t	friend of Vicki and John	2017-12-28 02:49:04.722267	2017-12-28 02:49:04.722267	16	13	Male	Guest	2018-01-03	\N
114	Tyler Donahue	f	f	t	t	f	f	f	t	Friend of John and Vicki	2017-12-28 02:49:50.650114	2017-12-28 02:49:50.650114	16	13	Male	Guest	2018-01-03	\N
115	Heather Hurst	f	f	t	t	f	f	f	t	Friend of Vicki and John	2017-12-28 02:50:39.380766	2017-12-28 02:50:39.380766	16	13	Female	Guest	2018-01-03	\N
116	Linda McGray	f	f	t	t	f	f	f	f		2017-12-28 04:17:25.066607	2017-12-28 04:17:25.066607	13	13	Female	Full Member	2018-01-03	\N
117	Nung	f	f	t	t	f	f	f	t	First Aid!!!	2017-12-28 15:27:29.498328	2017-12-28 15:27:29.498328	7	13	Male	Full Member	2018-01-03	\N
118	Darrell H	f	f	t	t	f	f	f	f		2017-12-28 19:11:22.305122	2017-12-28 19:11:22.305122	6	13	Male	Full Member	2018-01-03	\N
88	john Dobermiller	f	t	f	f	t	f	f	t	Regrettably I and my friends will not be able to make First Aid. Please reassign the beds. Maybe I will see some of you Sun night.	2017-12-18 20:24:42.660304	2017-12-29 17:27:10.337841	2	13	Male	Full Member	2018-01-03	\N
120	Laura Allen	f	f	t	t	f	f	f	f	Lower bunk, if possible.	2017-12-30 18:55:48.066872	2017-12-30 18:55:48.066872	43	13	Female	Guest	2018-01-03	\N
123	doug mayo	f	f	t	t	f	f	f	t	Getintoit	2018-01-02 17:10:49.954401	2018-01-02 17:10:49.954401	12	13	Male	Full Member	2018-01-03	\N
124	megan mccauley	f	f	t	t	f	f	f	t	xc skiing is the best	2018-01-02 17:11:53.067736	2018-01-02 17:11:53.067736	12	13	Female	Full Member	2018-01-03	\N
81	Mike Ryan	f	f	t	t	t	t	f	f	JELLO	2017-12-13 18:27:23.382296	2018-01-02 20:01:57.634175	14	13	Male	Full Member	2018-01-03	\N
125	Kevin Buckley	f	f	f	t	f	f	f	t	He is just staying for one night and attending the party\r\n	2018-01-02 20:01:57.818759	2018-01-02 20:01:57.818759	16	13	Male	Guest	2018-01-03	\N
126	Mirian B	f	f	f	t	f	f	f	t	She is attending the party and staying one night	2018-01-02 20:02:46.71461	2018-01-02 20:02:46.71461	16	13	Female	Guest	2018-01-03	\N
127	Sara Hickson	f	f	f	t	f	f	f	f		2018-01-03 03:10:51.75038	2018-01-03 03:10:51.75038	43	13	Female	Full Member	2018-01-03	\N
128	Jake Lane	f	f	t	t	f	f	f	f		2018-01-03 03:13:01.069633	2018-01-03 03:13:01.069633	43	13	Male	Guest	2018-01-03	\N
129	LORI lavoie	f	f	t	t	f	f	f	f		2018-01-03 15:01:43.826822	2018-01-03 15:01:43.826822	44	13	Female	Full Member	2018-01-03	\N
130	Amy Cheever	f	f	t	t	f	f	f	t		2018-01-06 23:09:42.271636	2018-01-06 23:09:42.271636	16	14	Female	Full Member	2018-01-10	\N
131	Chris Candelora	f	f	t	t	f	f	f	t		2018-01-06 23:10:11.270027	2018-01-06 23:11:06.611587	16	14	Male	Full Member	2018-01-10	\N
132	Sara Delaney	f	f	t	t	f	f	f	f		2018-01-08 15:35:02.550625	2018-01-21 20:24:01.016169	31	16	Female	Associate Member	2018-02-07	\N
133	Sara Delaney	f	f	t	t	f	f	f	f		2018-01-08 16:24:23.854127	2018-01-08 16:24:23.854127	31	17	Female	Associate Member	2018-01-17	\N
135	Dan Shults	t	t	t	t	f	f	f	t	Wildcat anniversary! Should be up weds night - sun.	2018-01-08 19:52:46.46132	2018-01-08 19:52:46.46132	20	15	Male	Full Member	2018-01-24	\N
134	Dan Shults	f	f	t	t	t	f	f	t	Double digit temps!	2018-01-08 19:50:10.229015	2018-01-08 19:53:23.018787	20	14	Male	Full Member	2018-01-10	\N
137	Dan Shults	f	f	t	t	f	f	f	f	First Aid: resuscitated. 	2018-01-08 19:56:47.556751	2018-01-08 19:58:16.033892	20	16	Male	Full Member	2018-02-07	\N
138	Paul Fogel	f	f	t	t	f	f	f	t	Comment?   Still better be a good time... thats my comment.       Prefer not Wildcat ....   I take my tea with one cube of sugar and with biscuits at 3.  Thanks.   	2018-01-09 19:04:09.21635	2018-01-09 19:04:09.21635	34	14	Male	Associate Member	2018-01-10	\N
139	Nikki Therrien	f	f	t	t	t	f	f	t		2018-01-09 22:23:03.990623	2018-01-09 22:23:03.990623	9	14	Female	Full Member	2018-01-10	\N
140	Michelle Comtois	f	f	t	t	f	f	f	t	Will depend on if I feel better 	2018-01-10 18:43:35.32974	2018-01-10 18:43:35.32974	5	14	Female	Full Member	2018-01-10	\N
141	Michelle Comtois	f	f	t	t	f	f	f	t	Jello	2018-01-10 18:44:26.885306	2018-01-10 18:44:26.885306	5	16	Female	Full Member	2018-02-07	\N
142	Alana McCarthy 	f	f	t	t	t	f	f	f		2018-01-10 22:26:43.616465	2018-01-10 22:26:43.616465	23	16	Female	Full Member	2018-02-07	\N
283	THOMAS WALL	f	f	t	t	f	f	f	t		2018-04-30 16:13:27.812388	2018-04-30 16:13:27.812388	21	28	Male	Full Member	2018-05-02	\N
146	Gary Griffin	f	f	t	t	f	f	f	t	Guest of Dan	2018-01-11 18:07:21.529576	2018-01-11 18:07:21.529576	20	18	Male	Guest	2018-01-31	\N
149	Brandon Juby	f	f	t	t	f	f	f	t	Guest of Dan	2018-01-11 18:09:23.001441	2018-01-11 18:09:23.001441	20	18	Male	Guest	2018-01-31	\N
150	Michelle Philbrick	f	f	t	t	f	f	f	t	Guest of Dan	2018-01-11 18:10:29.088899	2018-01-11 18:10:29.088899	20	18	Female	Guest	2018-01-31	\N
151	Chris Villatoro	f	f	t	t	f	f	f	t	Guest of Dan	2018-01-11 18:10:59.568751	2018-01-11 18:10:59.568751	20	18	Male	Guest	2018-01-31	\N
165	Mike Ryan	f	f	t	t	f	f	f	t		2018-01-17 14:21:32.876873	2018-01-17 14:21:32.876873	14	17	Male	Full Member	2018-01-17	\N
152	Tyler Brennick	f	f	f	t	f	f	f	t	Guest of Dan 	2018-01-12 03:16:52.920444	2018-01-12 03:16:52.920444	20	18	Male	Guest	2018-01-31	\N
154	Linda McGray	f	f	t	t	f	f	f	f		2018-01-13 02:17:45.233023	2018-01-13 02:17:45.233023	13	16	Female	Full Member	2018-02-07	\N
153	Mike Brown	f	f	f	t	f	f	f	t	Guest of Dan	2018-01-12 03:18:18.237241	2018-01-15 20:15:15.770106	20	18	Male	Guest	2018-01-31	\N
155	Mark Buckley	f	f	t	t	f	f	f	f		2018-01-15 22:38:19.908239	2018-01-15 22:38:19.908239	22	16	Male	Full Member	2018-02-07	\N
156	Hiliary Carlson	f	f	t	t	f	f	f	f		2018-01-15 22:39:49.394277	2018-01-15 22:39:49.394277	22	16	Female	Guest	2018-02-07	\N
157	Brendan Halpin	f	f	t	t	f	f	f	f		2018-01-15 22:40:09.501927	2018-01-15 22:40:09.501927	22	16	Male	Guest	2018-02-07	\N
158	Kristen Chamberlain	f	f	t	t	f	f	f	f	Friends with Mark and Hiliary	2018-01-15 22:42:22.065657	2018-01-15 22:42:22.065657	22	16	Female	Guest	2018-02-07	\N
160	Paul Johnson 	f	f	t	t	f	f	f	f	Friends with Mark and Hiliary - First time guest	2018-01-15 22:44:26.236663	2018-01-15 22:44:26.236663	22	16	Male	Guest	2018-02-07	\N
287	Chris Bromery	f	f	t	t	f	f	f	t	Work Weekend!	2018-06-14 02:29:17.658585	2018-06-14 02:29:17.658585	15	30	Male	Full Member	2018-07-11	\N
163	Laura Collins	f	f	t	t	f	f	f	f	Guest of Linda McGray.  First time visit.	2018-01-15 22:48:52.483291	2018-01-15 22:48:52.483291	13	16	Female	Guest	2018-02-07	\N
164	Jon Rago	f	f	t	t	f	f	f	f	Guest of Linda McGray. First time visiting. Just moved here from out west, loves to ski, could be a potential member.	2018-01-15 23:56:50.834863	2018-01-15 23:56:50.834863	13	16	Male	Guest	2018-02-07	\N
148	Nikki Brennick	f	f	f	t	f	f	f	t	Guest of Dan	2018-01-11 18:08:50.180482	2018-01-16 22:47:04.523239	20	18	Female	Guest	2018-01-31	\N
144	Meghan McVeigh	f	f	f	t	f	f	f	t	Guest of Dan	2018-01-11 18:05:56.801567	2018-01-17 14:17:30.665955	20	18	Female	Guest	2018-01-31	\N
147	Evan Lin	f	f	f	t	f	f	f	t	Guest of Dan	2018-01-11 18:07:57.949209	2018-01-17 14:17:47.386833	20	18	Male	Guest	2018-01-31	\N
145	Carly Daniel	f	f	f	t	f	f	f	t	Guest of Dan	2018-01-11 18:06:34.954764	2018-01-17 14:18:05.800346	20	18	Female	Guest	2018-01-31	\N
136	Dan Shults	f	f	t	t	f	f	f	t	Bringing 10 guests. I have made all their reservations for the nights they are staying. Payments have all been made. - 1/18/18	2018-01-08 19:55:29.754099	2018-01-18 19:12:55.68973	20	18	Male	Full Member	2018-01-31	\N
166	Erik Christensen	f	f	t	t	f	f	f	t		2018-01-17 14:22:33.75944	2018-01-17 14:22:33.75944	14	17	Male	Guest	2018-01-17	\N
167	Jason Stokinger	f	f	t	t	f	f	f	t		2018-01-17 14:23:00.6759	2018-01-17 14:23:00.6759	14	17	Male	Guest	2018-01-17	\N
168	Ami Denman	f	f	f	t	f	f	f	t		2018-01-17 14:23:31.099241	2018-01-17 14:23:31.099241	14	17	Female	Guest	2018-01-17	\N
169	Mike Ryan	f	f	t	t	t	t	f	t		2018-01-17 14:25:41.136559	2018-01-17 14:25:41.136559	14	18	Male	Full Member	2018-01-31	\N
170	Chris	f	f	t	t	f	f	f	t		2018-01-17 16:51:30.904357	2018-01-17 16:51:30.904357	1	17	Male	Full Member	2018-01-17	\N
171	Amy	f	f	t	t	f	f	f	t		2018-01-17 16:52:05.422011	2018-01-17 16:52:05.422011	1	17	Female	Full Member	2018-01-17	\N
172	Amy Cheever	f	f	t	t	f	f	f	t		2018-01-17 19:14:41.751433	2018-01-17 19:14:41.751433	16	15	Female	Full Member	2018-01-24	\N
173	Chris Candelora	f	f	t	t	f	f	f	t		2018-01-17 19:15:02.683512	2018-01-17 19:15:02.683512	16	15	Male	Full Member	2018-01-24	\N
174	Chris Candelora	f	f	t	t	f	f	f	t	already paid	2018-01-17 19:17:09.703127	2018-01-17 19:17:09.703127	16	16	Male	Full Member	2018-02-07	\N
175	Amy Cheever	f	f	t	t	f	f	f	t	already paid	2018-01-17 19:17:37.391945	2018-01-17 19:17:37.391945	16	16	Female	Full Member	2018-02-07	\N
176	Pat Shea	f	f	t	t	f	f	f	f	Friend of Mark/Hiliary 	2018-01-17 20:06:34.065832	2018-01-17 20:06:34.065832	22	16	Male	Guest	2018-02-07	\N
177	Beth Smith	t	t	t	t	t	t	t	t	Hi Bretts,  I am coming up on Monday Jan. 22 and staying into this upcoming ski week.. 	2018-01-18 03:23:24.861786	2018-01-18 03:23:24.861786	19	15	Female	Full Member	2018-01-24	\N
178	Nikki Therrien	f	f	t	t	f	f	f	t	First aid	2018-01-19 19:53:55.659506	2018-01-19 19:53:55.659506	9	16	Female	Full Member	2018-02-07	\N
179	Chris Kirch	f	f	t	t	f	f	f	t	Guest of Nikki t	2018-01-19 19:54:35.132959	2018-01-19 19:54:35.132959	9	16	Male	Guest	2018-02-07	\N
180	Nikki Therrien	t	t	t	t	f	f	f	t	Wildcat anniversary	2018-01-19 19:55:26.935932	2018-01-19 19:55:26.935932	9	15	Female	Full Member	2018-01-24	\N
181	Nikki Therrien	f	f	t	t	f	f	f	t	Yay guests	2018-01-19 19:56:12.752296	2018-01-19 19:56:12.752296	9	18	Female	Full Member	2018-01-31	\N
182	LORI lavoie	f	f	t	t	f	f	f	f	FIRST AID	2018-01-22 15:43:20.739851	2018-01-22 15:43:20.739851	44	16	Female	Full Member	2018-02-07	\N
183	Chris Candelora	f	f	t	t	f	f	f	t		2018-01-23 13:50:40.27885	2018-01-23 13:50:40.27885	16	18	Male	Full Member	2018-01-31	\N
184	Amy Cheever	f	f	t	t	f	f	f	t		2018-01-23 13:51:07.642151	2018-01-23 13:51:07.642151	16	18	Female	Full Member	2018-01-31	\N
185	Nung	f	f	t	t	f	f	f	t	I am going to be the Jello shot king!	2018-01-23 14:56:34.026976	2018-01-23 14:56:34.026976	16	16	Male	Full Member	2018-02-07	\N
186	Doug mayo	f	f	t	t	f	f	f	t		2018-01-25 02:31:18.741932	2018-01-25 02:31:18.741932	12	18	Male	Full Member	2018-01-31	\N
187	Megan Mccauley 	f	f	t	t	f	f	f	t		2018-01-25 02:31:49.490898	2018-01-25 02:31:49.490898	12	18	Female	Full Member	2018-01-31	\N
188	Doug mayo	f	f	t	t	f	f	f	t		2018-01-25 02:32:40.85022	2018-01-25 02:32:40.85022	12	16	Male	Full Member	2018-02-07	\N
189	Megan Mccauley 	f	f	t	t	f	f	f	t		2018-01-25 02:33:11.719623	2018-01-25 02:33:11.719623	12	16	Female	Full Member	2018-02-07	\N
190	Sara Hickson	f	f	f	t	f	f	f	f		2018-01-25 20:05:12.794657	2018-01-25 20:05:12.794657	43	16	Female	Full Member	2018-02-07	\N
191	Laura Allen	f	f	t	t	f	f	f	t	Guest of Sara Hickson.  Lower bunk, if possible.  Thanks!	2018-01-25 20:06:20.32376	2018-01-25 20:06:20.32376	43	16	Female	Guest	2018-02-07	\N
192	Jose Colon	f	f	f	t	f	f	f	t	Late-breaking guest of Dan. Should be the last one?	2018-01-27 00:18:54.01507	2018-01-27 00:18:54.01507	20	18	Male	Guest	2018-01-31	\N
194	THOMAS WALL	f	f	t	t	f	f	f	f		2018-01-30 00:55:05.461725	2018-01-30 00:55:05.461725	21	18	Male	Full Member	2018-01-31	\N
195	LORI lavoie	f	f	t	t	f	f	f	t		2018-01-30 06:59:52.518266	2018-01-30 06:59:52.518266	44	18	Female	Full Member	2018-01-31	\N
196	LORI lavoie	f	f	t	t	f	f	f	t		2018-01-30 07:00:53.458948	2018-01-30 07:00:53.458948	44	16	Female	Full Member	2018-02-07	\N
197	Alana McCarthy 	f	f	t	t	t	f	f	t		2018-01-30 12:25:42.036893	2018-01-30 12:25:42.036893	23	18	Female	Full Member	2018-01-31	\N
198	Mike Ryan	f	f	t	t	f	f	f	f		2018-01-30 20:46:46.635309	2018-01-30 20:46:46.635309	14	16	Male	Full Member	2018-02-07	\N
199	Doug mayo	f	f	t	t	f	f	f	t		2018-01-31 00:36:35.495439	2018-01-31 00:36:35.495439	12	18	Male	Full Member	2018-01-31	\N
200	Megan Mccauley 	f	f	t	t	f	f	f	t		2018-01-31 00:37:21.051727	2018-01-31 00:37:21.051727	12	18	Female	Full Member	2018-01-31	\N
201	Doug mayo	f	f	t	t	t	t	t	t		2018-01-31 00:38:31.026977	2018-01-31 00:38:31.026977	12	19	Male	Full Member	2018-02-14	\N
202	Megan Mccauley 	f	f	t	t	t	t	t	t		2018-01-31 00:39:14.810555	2018-01-31 00:39:14.810555	12	19	Female	Full Member	2018-02-14	\N
203	Doug mayo 	t	t	t	t	f	f	f	t		2018-01-31 00:39:49.485752	2018-01-31 00:39:49.485752	12	20	Male	Full Member	2018-02-21	\N
204	Megan Mccauley 	t	t	t	t	f	f	f	t		2018-01-31 00:40:30.917653	2018-01-31 00:40:30.917653	12	20	Female	Full Member	2018-02-21	\N
193	Michelle Comtois	f	f	f	f	f	f	f	t	Won’t be up 	2018-01-30 00:48:59.019043	2018-01-31 01:19:31.87046	5	18	Female	Full Member	2018-01-31	\N
284	Michelle Comtois	f	f	t	t	f	f	f	t		2018-05-01 00:41:10.822299	2018-05-01 00:41:10.822299	5	28	Female	Full Member	2018-05-02	\N
206	Katelin Murphy	f	f	t	t	f	f	f	t	visiting guest	2018-02-01 19:33:46.697648	2018-02-01 19:33:46.697648	16	16	Female	Guest	2018-02-07	\N
207	Ben pritzker	f	f	t	t	f	f	f	t	Back Flip Ben will be up!	2018-02-05 14:16:10.947789	2018-02-05 14:16:10.947789	16	16	Male	Full Member	2018-02-07	\N
208	Sara Delaney	f	f	t	t	f	f	f	f		2018-02-05 21:20:38.755945	2018-02-05 21:20:38.755945	31	21	Female	Associate Member	2018-03-21	\N
237	Vicki Santarcangelo	f	f	t	t	f	f	f	f		2018-03-05 23:26:21.39558	2018-03-05 23:26:39.512528	3	21	Female	Full Member	2018-03-21	\N
211	Nancy Lewis	f	f	f	f	f	t	f	t	Guest of Chris Bromery - Mon-Tues only!	2018-02-07 03:54:25.424567	2018-02-07 03:54:25.424567	15	16	Female	Guest	2018-02-07	\N
210	Sigrun Hancock	f	f	t	t	f	f	f	f	Cancelled!	2018-02-06 02:59:09.589003	2018-02-07 03:55:29.436331	15	16	Female	Guest	2018-02-07	\N
209	Chris Bromery	f	f	t	t	f	t	f	f	First Aid! Heading back Sun then coming back up Mon-Tues.	2018-02-06 02:57:28.627014	2018-02-07 03:56:39.418814	15	16	Male	Full Member	2018-02-07	\N
212	Amy Cheever	f	f	t	t	t	f	f	t		2018-02-08 23:08:40.852344	2018-02-08 23:08:40.852344	16	19	Female	Guest	2018-02-14	\N
213	Chris Candelora	f	f	t	t	t	f	f	t		2018-02-08 23:09:08.317544	2018-02-08 23:09:08.317544	16	19	Male	Full Member	2018-02-14	\N
214	Chris Candelora	f	t	t	t	f	f	f	t		2018-02-08 23:09:57.434273	2018-02-08 23:09:57.434273	16	20	Male	Full Member	2018-02-21	\N
215	Amy Cheever	f	t	t	t	f	f	f	t		2018-02-08 23:10:40.016638	2018-02-08 23:10:40.016638	16	20	Female	Full Member	2018-02-21	\N
216	Amy Cheever	f	f	t	t	f	f	f	t	ICE Bar	2018-02-12 15:23:55.122442	2018-02-12 15:23:55.122442	16	21	Female	Full Member	2018-03-21	\N
217	Chris Candelora	f	f	t	t	f	f	f	t	ICE BAR	2018-02-12 15:25:17.674777	2018-02-12 15:25:17.674777	16	21	Male	Full Member	2018-03-21	\N
218	Cher Vitale	f	f	t	t	f	f	f	t	Guest of Chris C.	2018-02-12 15:26:41.677603	2018-02-12 15:26:41.677603	16	21	Female	Guest	2018-03-21	\N
219	Matt C	f	f	t	t	f	f	f	t	Guest of Chris C.	2018-02-12 15:27:12.81519	2018-02-12 15:27:12.81519	16	21	Male	Guest	2018-03-21	\N
220	Mike Ryan	f	f	t	t	f	f	f	f	ICE BAR!!!!	2018-02-12 16:01:11.439401	2018-02-12 16:01:11.439401	14	21	Male	Full Member	2018-03-21	\N
221	Mike Ryan	f	f	t	t	t	f	f	t		2018-02-12 16:02:02.834127	2018-02-12 16:02:02.834127	14	19	Male	Full Member	2018-02-14	\N
222	Mike Ryan	f	f	t	t	f	f	f	t		2018-02-12 16:02:59.698705	2018-02-12 16:02:59.698705	14	20	Male	Full Member	2018-02-21	\N
223	Mike Ryan	f	f	t	t	f	f	f	t		2018-02-12 16:03:24.97047	2018-02-12 16:03:24.97047	14	22	Male	Full Member	2018-02-28	\N
224	Nikki Therrien	f	f	f	t	f	f	f	t		2018-02-13 19:28:28.514865	2018-02-13 19:28:28.514865	9	23	Female	Full Member	2018-03-14	\N
225	THOMAS WALL	f	f	t	t	f	f	f	t		2018-02-14 03:41:58.21722	2018-02-14 03:41:58.21722	21	19	Male	Full Member	2018-02-14	\N
226	Dan Shults	f	f	f	t	f	f	f	t	Heading to Loon on Sunday.	2018-02-14 21:02:17.920408	2018-02-14 21:02:17.920408	20	19	Male	Full Member	2018-02-14	\N
227	Alana McCARTHY 	f	f	t	t	t	f	f	t		2018-02-20 02:34:23.570314	2018-02-20 02:34:23.570314	23	21	Female	Full Member	2018-03-21	\N
228	Chris Candelora	f	f	t	t	f	f	f	t	We are hoping for great skiing conditions!	2018-02-26 12:41:56.273752	2018-02-26 12:41:56.273752	16	22	Male	Full Member	2018-02-28	\N
229	Amy Cheever	f	f	t	t	f	f	f	t		2018-02-26 12:42:16.086446	2018-02-26 12:42:16.086446	16	22	Female	Full Member	2018-02-28	\N
230	Beth Smith	f	t	t	t	t	t	t	t		2018-02-27 22:24:45.022136	2018-02-27 22:24:45.022136	19	22	Female	Full Member	2018-02-28	\N
231	Beth Smith	t	t	t	t	f	f	f	t	I hope there is good snow.	2018-02-27 22:25:51.904819	2018-02-27 22:25:51.904819	19	24	Female	Full Member	2018-03-07	\N
232	Brette Brickel	f	f	t	t	f	f	f	t	EISCL Member	2018-02-28 13:16:29.360995	2018-02-28 13:16:29.360995	14	22	Female	Guest	2018-02-28	\N
233	Laura Allen	f	f	t	t	f	f	f	f	Lower bunk if possible, please.  	2018-02-28 13:58:23.914504	2018-02-28 13:58:23.914504	43	22	Female	Guest	2018-02-28	\N
235	Sara Hickson	f	f	f	t	f	f	f	f		2018-02-28 14:00:16.740677	2018-02-28 14:00:34.844187	43	22	Female	Full Member	2018-02-28	\N
238	Mollie Watkins	f	f	t	t	f	f	f	f	Guest of Vicki Santarcangelo	2018-03-05 23:27:28.389919	2018-03-05 23:27:28.389919	3	21	Female	Guest	2018-03-21	\N
236	Alana McCarthy 	f	f	t	t	t	f	f	t	Please, weather gods, make it snow...	2018-02-28 23:26:37.569334	2018-02-28 23:26:37.569334	23	22	Female	Full Member	2018-02-28	\N
239	Peter Watkins	f	f	t	t	f	f	f	t	Guest of V. Santarcangelo and John Dobermiller	2018-03-05 23:28:06.617621	2018-03-05 23:28:06.617621	3	21	Male	Guest	2018-03-21	\N
240	John Dobermiller	f	f	t	t	f	f	f	t	Making His Triumphant Return...	2018-03-05 23:30:11.598004	2018-03-05 23:30:11.598004	3	21	Male	Full Member	2018-03-21	\N
241	Nikki Therrien	f	f	t	t	f	f	f	t	not 100% if i'll be up this weekend - depends on work. but i hope to be!	2018-03-06 19:47:14.219106	2018-03-06 19:47:14.219106	9	24	Female	Full Member	2018-03-07	\N
242	Chris Candelora	f	f	t	t	f	f	f	t		2018-03-07 02:37:34.749973	2018-03-07 02:37:34.749973	16	24	Male	Full Member	2018-03-07	\N
243	Amy Cheever	f	f	t	t	f	f	f	t		2018-03-07 02:37:57.764847	2018-03-07 02:37:57.764847	16	24	Female	Full Member	2018-03-07	\N
244	Chris Candelora	f	f	t	t	f	f	f	t		2018-03-07 02:38:48.513021	2018-03-07 02:38:48.513021	16	23	Male	Full Member	2018-03-14	\N
245	Amy Cheever	f	f	t	t	f	f	f	t		2018-03-07 02:39:11.269785	2018-03-07 02:39:11.269785	16	23	Female	Full Member	2018-03-14	\N
246	Mike Ryan	f	f	t	t	f	f	f	t		2018-03-07 15:33:36.152861	2018-03-07 15:33:36.152861	14	23	Male	Full Member	2018-03-14	\N
248	Mike Ryan	f	f	t	t	f	f	f	f	Wildcat Ski School Party!!! Let me know if you want dinner.	2018-03-07 15:36:12.314024	2018-03-07 15:36:12.314024	14	25	Male	Full Member	2018-04-04	\N
249	Mike Ryan	f	f	t	t	f	f	f	t		2018-03-07 15:37:06.360879	2018-03-07 15:37:06.360879	14	26	Male	Full Member	2018-03-28	\N
250	Mark Buckley	f	f	t	t	f	f	f	f		2018-03-09 23:44:48.481306	2018-03-09 23:44:48.481306	22	21	Male	Full Member	2018-03-21	\N
251	Hiliary Carlson	f	f	t	t	f	f	f	f		2018-03-09 23:45:21.343828	2018-03-09 23:45:21.343828	22	21	Male	Guest	2018-03-21	\N
252	Dan Shults	f	f	f	t	f	f	f	t	Nikki and I are skiing Cannon on Sunday.	2018-03-12 13:41:05.829585	2018-03-12 13:41:05.829585	20	23	Male	Full Member	2018-03-14	\N
285	Nung	f	f	t	t	f	f	f	t	Work weekend!!!	2018-05-16 21:40:27.835905	2018-05-16 21:40:27.835905	7	29	Male	Full Member	2018-05-16	\N
253	Dan Shults	f	f	t	t	f	f	f	f	I'm going to try to scare up some guests.	2018-03-12 13:42:03.242279	2018-03-12 17:27:17.700845	20	21	Male	Full Member	2018-03-21	\N
255	Linda McGray	f	f	t	t	f	f	f	t		2018-03-12 17:57:40.574654	2018-03-12 17:57:40.574654	13	23	Female	Full Member	2018-03-14	\N
256	Linda McGray	f	f	t	t	f	f	f	f		2018-03-12 18:01:10.110586	2018-03-12 19:03:50.707762	13	21	Female	Full Member	2018-03-21	\N
257	Ashutosh Joshi\t	f	f	t	t	f	f	f	t	ice bar guest of a former Brett 	2018-03-13 20:19:53.093726	2018-03-13 20:19:53.093726	16	21	Male	Guest	2018-03-21	\N
258	Brandon Juby	f	f	t	t	f	f	f	f	Guest of Dan. Need to double check that he's staying both nights, but I wanted to make the reservation sooner rather than later. 	2018-03-14 14:43:34.790431	2018-03-14 14:43:34.790431	20	21	Male	Guest	2018-03-21	\N
259	Pat Shea	f	f	t	t	f	f	f	f	Guest if Mark B	2018-03-17 02:17:20.436424	2018-03-17 02:17:20.436424	22	21	Male	Guest	2018-03-21	\N
260	Brendan Halpin 	f	f	t	t	f	f	f	f	Guest of Mark B	2018-03-17 02:17:53.963195	2018-03-17 02:17:53.963195	22	21	Male	Guest	2018-03-21	\N
261	Kristen Chamberlain 	f	f	t	t	f	f	f	f	Guest of Mark B	2018-03-17 02:19:15.02919	2018-03-17 02:19:15.02919	22	21	Female	Guest	2018-03-21	\N
262	Chris Bromery	f	f	t	t	f	f	f	f	Ice Bar!!	2018-03-18 12:53:13.443342	2018-03-18 12:53:13.443342	15	21	Male	Full Member	2018-03-21	\N
263	Ron Swanick	f	f	t	t	f	f	f	f	Guest of Chris B. Ice Bar. Second visit. 	2018-03-18 19:53:37.483992	2018-03-18 19:53:37.483992	15	21	Male	Guest	2018-03-21	\N
264	Michelle Comtois	f	f	t	t	f	f	f	t		2018-03-19 00:28:50.854014	2018-03-19 00:28:50.854014	5	21	Female	Full Member	2018-03-21	\N
265	Jamie Smart - guest of Sara Delaney	f	f	t	t	f	f	f	f		2018-03-19 15:12:30.633437	2018-03-19 15:12:30.633437	31	21	Female	Guest	2018-03-21	\N
266	Emily Bularzik - guest of Sara Delaney	f	f	t	t	f	f	f	f	if possible, please place Jamie and Emily in the same room	2018-03-19 15:13:43.598598	2018-03-19 15:13:43.598598	31	21	Female	Guest	2018-03-21	\N
267	THOMAS WALL	f	f	t	t	f	f	f	f	Off the roof!	2018-03-19 16:10:23.120733	2018-03-19 16:10:43.15832	21	21	Male	Full Member	2018-03-21	\N
268	Jacob Voelz - guest of L Lavoie	f	f	t	t	f	f	f	f	Guest of L Lavoie	2018-03-20 16:54:50.726702	2018-03-20 16:54:50.726702	44	21	Male	Guest	2018-03-21	\N
269	Nathaniel Preston Houck - guest of L Lavoie	f	f	t	t	f	f	f	f	Guest of L Lavoie - 1st time guest	2018-03-20 16:56:45.935086	2018-03-20 16:56:45.935086	44	21	Male	Guest	2018-03-21	\N
270	doug mayo	f	f	t	t	f	f	f	t		2018-03-20 17:42:57.024518	2018-03-20 17:42:57.024518	12	21	Male	Full Member	2018-03-21	\N
271	megan mccauley	f	f	t	t	f	f	f	t		2018-03-20 17:43:24.385704	2018-03-20 17:43:24.385704	12	21	Female	Full Member	2018-03-21	\N
272	Conrad Armstrong - friend of Sara Delaney	f	f	t	t	f	f	f	f		2018-03-21 14:31:49.093745	2018-03-21 14:31:49.093745	31	21	Male	Guest	2018-03-21	\N
273	Vicki Somebody - friend of Conrad Armstrong who is a friend of Sara Delaney	f	f	t	t	f	f	f	f		2018-03-21 14:32:49.307265	2018-03-21 14:32:49.307265	31	21	Female	Guest	2018-03-21	\N
286	Michelle Comtois	f	f	f	t	f	f	f	t	Will be up Saturday morning 	2018-05-16 23:48:02.860142	2018-05-16 23:48:02.860142	5	29	Female	Full Member	2018-05-16	\N
288	Sara Delaney	f	f	t	t	f	f	f	f	Tubing, yeah!!	2018-06-22 15:21:54.265027	2018-06-22 15:21:54.265027	31	31	Female	Associate Member	2018-07-18	\N
321	Nikki Therrien	f	t	t	t	f	f	f	t	hoping to get in the mountains some. possibly interested in Wildcat On Tap	2018-06-22 18:19:24.546079	2018-06-22 18:19:24.546079	9	64	Female	Full Member	2018-07-04	\N
205	Lori Lavoie	f	f	t	t	f	f	f	f	Ice bar (FYI - Vicky Somebodys last name is Seward)	2018-02-01 11:34:07.159682	2018-03-21 16:07:28.56167	44	21	Female	Full Member	2018-03-21	\N
276	Alana McCarthy 	f	f	t	t	t	f	f	t		2018-03-28 20:23:42.049488	2018-03-28 20:23:42.049488	23	26	Female	Full Member	2018-03-28	\N
322	Nikki Therrien	f	f	t	t	f	f	f	t	work weekend	2018-06-22 18:20:33.21654	2018-06-22 18:20:33.21654	9	30	Female	Full Member	2018-07-11	\N
323	Nikki Therrien	f	f	t	t	f	f	f	t	Tubing	2018-06-22 18:20:58.453101	2018-06-22 18:20:58.453101	9	31	Female	Full Member	2018-07-18	\N
277	Beth Smith	f	f	t	t	f	f	f	t	I am coming up to the club with a lady friend.  Ellen Snoeyenbos.  We are staying the two nights.\r\n Local hiking will be our interest.  	2018-04-10 13:40:59.142221	2018-04-10 13:43:35.434809	19	27	Female	Full Member	2018-04-11	\N
278	Chris Candelora	f	f	t	t	f	f	f	t	Work Weekend	2018-04-12 00:53:05.623989	2018-04-12 00:53:05.623989	16	28	Male	Full Member	2018-05-02	\N
279	Amy Cheever	f	f	t	t	f	f	f	t	Work Weekend	2018-04-12 00:53:47.040853	2018-04-12 00:53:47.040853	16	28	Female	Full Member	2018-05-02	\N
280	Dan Shults	f	f	t	t	f	f	f	f	Work Weekennnnddddd	2018-04-13 18:37:25.692297	2018-04-13 18:37:25.692297	20	28	Male	Full Member	2018-05-02	\N
324	Dan Shults	f	f	t	t	f	f	f	t	Woooooooork	2018-06-22 20:17:31.030056	2018-06-22 20:17:31.030056	20	30	Male	Full Member	2018-07-11	\N
325	Dan Shults	f	f	t	t	f	f	f	f	Tubular	2018-06-22 20:18:37.875748	2018-06-22 20:18:37.875748	20	31	Male	Full Member	2018-07-18	\N
326	Tommy W	f	f	t	t	f	f	f	t		2018-06-24 17:55:02.541278	2018-06-24 17:55:02.541278	21	65	Male	Full Member	2018-06-27	\N
327	Alana McCarthy	f	f	t	t	f	f	f	t		2018-06-24 17:55:45.351281	2018-06-24 17:56:26.841478	23	65	Female	Full Member	2018-06-27	\N
328	Michelle Comtois	f	f	t	t	f	f	f	t		2018-06-24 23:30:09.557098	2018-06-24 23:30:09.557098	5	31	Female	Full Member	2018-07-18	\N
329	Mark Buckley	f	t	t	t	f	f	f	t		2018-06-27 20:28:18.899355	2018-06-27 20:28:18.899355	22	65	Male	Full Member	2018-06-27	\N
330	Hiliary Carlson	f	t	t	t	f	f	f	t		2018-06-27 20:28:44.834069	2018-06-27 20:28:44.834069	22	65	Female	Guest	2018-06-27	\N
332	Dan Shults	f	f	t	t	f	f	f	t	In the area for a wedding. Gonna be hiking Mt. Washington.	2018-07-05 13:56:04.418883	2018-07-05 13:56:04.418883	20	66	Male	Full Member	2018-08-08	\N
333	Dan Shults	f	f	t	t	f	f	f	f	Volleyball tournament!	2018-07-05 13:56:52.8866	2018-07-05 13:56:52.8866	20	67	Male	Full Member	2018-08-15	\N
337	Kristie Grunert 	f	f	t	t	f	f	f	f	Friend of Mark	2018-07-09 21:11:19.602975	2018-07-09 21:11:19.602975	22	31	Female	Guest	2018-07-18	\N
334	Mark Buckley	f	f	t	t	f	f	f	f		2018-07-09 21:07:55.262344	2018-07-09 21:11:51.456457	22	31	Male	Full Member	2018-07-18	\N
335	Hiliary Carlson	f	f	t	t	f	f	f	f		2018-07-09 21:08:51.097201	2018-07-09 21:12:16.263511	22	31	Female	Guest	2018-07-18	\N
336	Matt Landry 	f	f	t	t	f	f	f	f	Freind of Mark	2018-07-09 21:09:57.333099	2018-07-09 21:12:31.52072	22	31	Male	Guest	2018-07-18	\N
338	Brendan Halpin	f	f	t	t	f	f	f	f	Friend of Mark	2018-07-09 21:13:01.153456	2018-07-09 21:13:01.153456	22	31	Male	Guest	2018-07-18	\N
339	Kristen Chamberlain	f	f	t	t	f	f	f	f	Friend of Mark	2018-07-09 21:13:28.183603	2018-07-09 21:13:28.183603	22	31	Female	Guest	2018-07-18	\N
341	Test	t	f	f	f	f	f	f	t	Test	2018-07-13 22:48:35.248103	2018-07-13 22:48:35.248103	1	31	Male	Full Member	2018-07-18	\N
331	Annie McDonough (guest of Sara Delaney)	f	f	t	t	f	f	f	f	Friend of Delaney	2018-07-03 14:17:27.068222	2018-07-12 16:59:20.47756	31	31	Female	Guest	2018-07-18	\N
340	Biz Woolhouse (guest of Sara Delaney)	f	f	t	t	f	f	f	f	friend of Delaney	2018-07-12 16:57:07.922922	2018-07-12 16:59:34.823658	31	31	Female	Guest	2018-07-18	\N
342	Michelle Philbrook	f	f	t	f	f	f	f	f		2018-07-15 22:24:12.955936	2018-07-15 22:24:12.955936	5	31	Female	Guest	2018-07-18	\N
343	Kate Peterson	f	f	t	t	f	f	f	f	Friend of Delaney	2018-07-16 16:01:11.081287	2018-07-16 16:01:11.081287	31	31	Female	Guest	2018-07-18	\N
344	Michael Anderson	f	f	t	t	f	f	f	f	Friend of Delaney	2018-07-16 16:02:58.419029	2018-07-16 16:02:58.419029	31	31	Male	Guest	2018-07-18	\N
345	Mike Ryan	f	f	t	t	f	f	f	t	Let's get wet!!	2018-07-16 18:09:57.06543	2018-07-16 18:09:57.06543	14	31	Male	Full Member	2018-07-18	\N
346	John Dobermiller	f	t	t	t	t	f	f	t	Vic and I will be up for Tubing Weekend.	2018-07-17 13:14:14.290226	2018-07-17 13:14:28.164652	2	31	Male	Full Member	2018-07-18	\N
347	Vicki Santarcangelo	f	t	t	t	t	f	f	f	Tubing!	2018-07-18 01:38:52.89259	2018-07-18 01:38:52.89259	3	31	Female	Full Member	2018-07-18	\N
348	John Dobermiller	f	t	t	t	t	f	f	t		2018-08-13 15:33:49.639725	2018-08-13 15:33:49.639725	2	67	Male	Full Member	2018-08-15	\N
349	Kurt Yang	f	f	t	t	f	f	f	t		2018-09-12 21:02:43.370495	2018-09-12 21:02:43.370495	10	69	Male	Full Member	2018-09-12	\N
1371	Chris Bromery	f	t	t	t	f	f	f	f	Mini-Best Weekend!	2020-10-20 17:12:49.279327	2020-10-20 17:12:49.279327	15	298	Male	Full Member	2020-12-09	\N
1372	Chris Bromery	f	t	t	t	f	f	f	f	Mini-First Aid Weekend!	2020-10-20 17:14:54.172804	2020-10-20 17:14:54.172804	15	299	Male	Full Member	2021-01-06	\N
353	Dan Shults	f	f	t	t	f	f	f	t	Woooooork	2018-09-24 18:10:51.09635	2018-09-24 18:10:51.09635	20	72	Male	Full Member	2018-10-24	\N
354	Nikki Therrien	f	f	t	t	f	f	f	t	Work Weekend	2018-09-25 15:35:52.023048	2018-09-25 15:35:52.023048	9	72	Female	Full Member	2018-10-24	\N
355	Kurt's guest 1 	f	f	t	t	t	f	f	t	Please arrange my female guest in one room. Thanks. 	2018-10-01 19:07:16.813683	2018-10-01 19:07:16.813683	10	70	Female	Guest	2018-10-03	\N
356	Kurt's guest 2 	f	f	t	t	t	f	f	t		2018-10-01 19:08:16.967413	2018-10-01 19:08:16.967413	10	70	Female	Guest	2018-10-03	\N
357	Kurt's guest  3	f	f	f	t	t	f	f	t		2018-10-01 19:09:35.344105	2018-10-01 19:09:35.344105	10	70	Female	Guest	2018-10-03	\N
358	Kurt's guest 4 	f	f	t	t	t	f	f	t		2018-10-01 19:10:21.999575	2018-10-01 19:10:21.999575	10	70	Male	Guest	2018-10-03	\N
359	Kurt's guest 5 	f	f	f	t	t	f	f	t		2018-10-01 19:11:12.396333	2018-10-01 19:11:12.396333	10	70	Male	Guest	2018-10-03	\N
360	Kurt's guest 6	f	f	f	f	t	f	f	t		2018-10-02 14:40:11.284853	2018-10-02 14:40:11.284853	10	70	Male	Guest	2018-10-03	\N
350	Kurt Yang	f	f	t	t	t	t	f	t	May bring several friends to club  for one night or two. 	2018-09-12 21:04:28.942882	2018-10-02 17:57:16.747067	10	70	Male	Full Member	2018-10-03	\N
361	Lou Parente	f	f	f	t	t	f	f	t		2018-10-02 22:28:08.824013	2018-10-02 22:28:08.824013	32	70	Male	Associate Member	2018-10-03	\N
362	THOMAS WALL	f	f	t	t	t	f	f	t		2018-10-03 13:02:22.278804	2018-10-03 13:02:22.278804	21	70	Male	Full Member	2018-10-03	\N
363	John D	f	f	f	t	t	t	t	t		2018-10-03 15:21:51.466589	2018-10-03 15:21:51.466589	2	70	Male	Full Member	2018-10-03	\N
364	John D	t	t	t	t	t	f	f	t		2018-10-03 15:22:31.546914	2018-10-03 15:22:31.546914	2	71	Male	Full Member	2018-10-10	\N
365	Chris Bromery	f	f	t	t	f	f	f	t	Work Weekend!	2018-10-03 16:42:42.054268	2018-10-03 16:42:42.054268	15	72	Male	Full Member	2018-10-24	\N
366	Joe Griffin	f	f	t	t	t	f	f	t		2018-10-03 22:04:46.903512	2018-10-03 22:04:46.903512	21	70	Male	Guest	2018-10-03	\N
367	Nick cole	f	f	t	t	t	f	f	t		2018-10-03 22:05:51.15006	2018-10-03 22:05:51.15006	21	70	Male	Guest	2018-10-03	\N
368	Amy Cheever	f	f	t	t	t	f	f	t		2018-10-16 01:14:22.136003	2018-10-16 01:14:22.136003	16	72	Female	Full Member	2018-10-24	\N
369	Chris Candelora	f	f	t	t	t	f	f	t		2018-10-16 01:15:04.21952	2018-10-16 01:15:04.21952	16	72	Male	Full Member	2018-10-24	\N
370	Chris Candelora	f	f	t	t	f	f	f	t	Best weekend!	2018-10-16 01:16:57.219249	2018-10-16 01:16:57.219249	16	73	Male	Full Member	2018-12-05	\N
371	Amy Cheever	f	f	t	t	f	f	f	t	Best Weekend	2018-10-16 01:17:28.878133	2018-10-16 01:17:28.878133	16	73	Female	Full Member	2018-12-05	\N
372	Chris Candelora	f	f	t	t	f	f	f	t	ULLR!!!!	2018-10-16 01:19:43.415726	2018-10-16 01:19:43.415726	16	74	Male	Full Member	2018-11-21	\N
373	Amy Cheever	f	f	t	t	f	f	f	t	ULLR	2018-10-16 01:20:12.699843	2018-10-16 01:20:12.699843	16	74	Female	Full Member	2018-11-21	\N
401	Kurt Yang	f	f	t	t	f	f	f	t	work	2018-10-22 14:27:13.723612	2018-10-22 14:27:13.723612	10	106	Male	Full Member	2018-11-14	\N
402	THOMAS WALL	f	f	t	t	f	f	f	t		2018-10-23 01:15:24.508958	2018-10-23 01:15:24.508958	21	72	Male	Full Member	2018-10-24	\N
404	Francis Wood	f	f	t	t	f	f	f	f	Prospective member. Works at Attitash. First time visitor.	2018-11-03 23:30:57.309389	2018-11-03 23:30:57.309389	20	73	Male	Guest	2018-12-05	\N
405	Chris Villatoro	f	f	t	t	f	f	f	f	Recurring guest. Needs to stop doing more grad school so he can join already.	2018-11-04 16:06:17.488396	2018-11-04 16:06:17.488396	20	73	Male	Guest	2018-12-05	\N
406	Michelle Philbrick	f	f	t	t	f	f	f	f	Recurring guest. Will probably join if/when we can get Chris V to join.	2018-11-04 16:07:14.382067	2018-11-04 16:07:14.382067	20	73	Female	Guest	2018-12-05	\N
409	Andrew Blohm	f	f	t	t	f	f	f	f	First time guest. Found him on the r/icecoast subreddit. Lives in Portsmouth, and is looking for better access to the White Mtns. 26 yo. "Advanced" skier. Will pay cash on arrival. 	2018-11-15 14:19:14.234532	2018-11-15 14:19:14.234532	20	73	Male	Guest	2018-12-05	\N
410	Alana McCarthy 	f	f	t	t	f	f	f	f	Ullr! 	2018-11-18 14:44:03.57657	2018-11-18 14:44:03.57657	23	74	Female	Full Member	2018-11-21	\N
411	Nikki Shults	f	f	t	t	f	f	f	t	ULLR	2018-11-19 16:33:12.290734	2018-11-19 16:33:12.290734	9	74	Female	Full Member	2018-11-21	\N
412	Sara Delaney	f	f	t	t	f	f	f	f	Ullr!	2018-11-19 17:18:44.864692	2018-11-19 17:18:44.864692	31	74	Female	Associate Member	2018-11-21	\N
413	Mike Ryan	f	f	t	t	f	f	f	f	Maybe not Friday	2018-11-19 19:03:35.83148	2018-11-19 19:03:35.83148	14	74	Male	Full Member	2018-11-21	\N
414	Mike Ryan	f	f	t	t	f	f	f	t		2018-11-19 19:04:32.546455	2018-11-19 19:04:32.546455	14	107	Male	Full Member	2018-11-28	\N
415	Mike Ryan	f	f	t	t	f	f	f	f		2018-11-19 19:05:08.118512	2018-11-19 19:05:08.118512	14	73	Male	Full Member	2018-12-05	\N
416	Mike Ryan	f	f	t	t	f	f	f	t		2018-11-19 19:05:46.781255	2018-11-19 19:05:46.781255	14	108	Male	Full Member	2018-12-19	\N
417	Tyler Gester	f	f	t	t	f	f	f	t	First time guest, referred by Bromery. Will pay via cash/check.	2018-11-20 16:44:56.722185	2018-11-20 16:44:56.722185	20	73	Male	Guest	2018-12-05	\N
418	Nung	f	f	t	t	f	f	f	t		2018-11-20 22:10:22.166928	2018-11-20 22:10:22.166928	7	74	Male	Full Member	2018-11-21	\N
419	Amy Cogavin	f	f	f	t	f	f	f	t	guest of Nikki	2018-11-21 16:32:15.926245	2018-11-21 16:32:15.926245	9	74	Female	Guest	2018-11-21	\N
420	Mark Buckley	f	f	t	t	f	f	f	f	Best Weekend! 	2018-11-27 20:05:29.674225	2018-11-27 20:05:29.674225	22	73	Male	Full Member	2018-12-05	\N
421	Hiliary Carlson	f	f	t	t	f	f	f	f		2018-11-27 20:06:00.383679	2018-11-27 20:06:00.383679	22	73	Female	Guest	2018-12-05	\N
423	Kristen Chamberlain	f	f	t	t	f	f	f	f	Guest of Mark B	2018-11-27 20:06:48.056468	2018-11-27 20:08:17.975726	22	73	Female	Guest	2018-12-05	\N
424	Brendan Halpin	f	f	t	t	f	f	f	f	Guest of Mark B	2018-11-27 20:08:49.68566	2018-11-27 20:08:49.68566	22	73	Male	Guest	2018-12-05	\N
425	Katie Frascotti	f	f	t	t	f	f	f	f	First time guest sourced via EICSL inquiry form. 25 yo "intermediate" skier. Will pay cash/check.	2018-11-28 15:19:10.876087	2018-11-28 15:20:33.522558	20	73	Female	Guest	2018-12-05	\N
426	Rod Catargiu	f	f	t	t	f	f	f	f	Dan's Coworker. Second time at the club. Paying by cash/check.	2018-11-28 18:54:59.425543	2018-11-28 18:54:59.425543	20	73	Male	Guest	2018-12-05	\N
427	Alex Dolphin	f	f	t	t	f	f	f	f	Apparently has visited years ago, then moved away, but is now living in New England again. Reached out via email. Will pay w cash/check.	2018-11-28 20:37:29.249015	2018-11-28 20:37:37.715771	20	73	Male	Guest	2018-12-05	\N
428	Molly Carmody	f	f	t	t	f	f	f	f	Coworker of Amy's. First time guest, I think. Paying w/ cash/check.	2018-11-29 16:18:32.770973	2018-11-29 16:18:32.770973	20	73	Female	Guest	2018-12-05	\N
429	Matt Beal	f	f	t	t	f	f	f	f	Played Volleyball with us, and continues to play via BSSC. Came to vball weekend and tubing. Skier, originally from VT. STRONG PROSPECT! First time up in the winter.	2018-11-29 16:20:45.114547	2018-11-29 16:20:45.114547	20	73	Male	Guest	2018-12-05	\N
430	Kelley Kugel	f	f	t	t	f	f	f	f	Coworker of Dan's. First time guest. Quite outdoorsy. Paying w cash/check.	2018-11-29 16:22:00.628326	2018-11-29 16:22:00.628326	20	73	Female	Guest	2018-12-05	\N
431	Kate Daniel	f	f	t	t	f	f	f	f	VEGETARIAN. First time guest. Friend of Dan's Coworker, Kelley Kugel. Paying via cash/check.	2018-11-29 16:23:22.459324	2018-11-29 16:23:36.86432	20	73	Female	Guest	2018-12-05	\N
432	Nikki Shults	f	t	t	t	f	f	f	t	Best weekend	2018-11-29 16:25:58.076301	2018-11-29 16:25:58.076301	9	73	Female	Full Member	2018-12-05	\N
433	Alana Mccarthy	f	f	t	t	f	f	f	f	Bestest	2018-11-30 02:45:17.592011	2018-11-30 02:45:17.592011	23	73	Female	Full Member	2018-12-05	\N
403	Dan Shults	f	t	t	t	f	f	f	f	Best Weekend!	2018-11-03 23:29:56.149202	2018-12-01 19:02:30.150304	20	73	Male	Full Member	2018-12-05	\N
434	Christopher Hoeddinghaus	f	f	t	t	f	f	f	f	EDIT: may be cancelling. EDIT 2: He is coming! He has training Sunday at his new job as a snowboard instructor, and requests a quiet room away from the party if at all possible. \r\nFirst time visitor. Snowboard instructor new to the area. Paying w cash/check.	2018-11-30 15:46:42.275366	2018-12-05 22:20:28.74083	20	73	Male	Guest	2018-12-05	\N
435	Jessica Rayno	f	f	t	t	f	f	f	f	Friend of perennial guest, Chris V. First time visitor. paying via paypal.	2018-12-01 19:00:39.108453	2018-12-01 21:41:23.306398	20	73	Female	Guest	2018-12-05	\N
436	Mike Rayno	f	f	t	t	f	f	f	f	Friend of Perennial guest, Chris V. First time visitor. Paying via PayPal.	2018-12-01 19:01:32.392139	2018-12-01 21:41:46.386808	20	73	Male	Guest	2018-12-05	\N
710	Vicki Santarcangelo	f	t	t	t	f	f	f	t		2019-03-12 01:20:41.843773	2019-03-12 01:20:41.843773	3	154	Female	Full Member	2019-03-13	\N
437	Michelle Comtois	f	f	t	t	f	f	f	t	I will make Kielbasa in the crockpot 	2018-12-02 00:17:03.258015	2018-12-02 00:17:03.258015	5	73	Female	Full Member	2018-12-05	\N
438	Ken Simon	f	f	t	t	f	f	f	t		2018-12-03 20:19:25.870759	2018-12-03 20:19:25.870759	45	109	Male	Full Member	2018-12-12	\N
439	Nung	f	f	t	t	f	f	f	t		2018-12-03 20:44:46.724109	2018-12-03 20:44:46.724109	7	73	Male	Full Member	2018-12-05	\N
440	Chris Bromery	f	f	t	t	f	f	f	t	Best Weekend!	2018-12-03 23:51:50.545694	2018-12-03 23:51:50.545694	15	73	Male	Full Member	2018-12-05	\N
441	John O'neill	f	f	t	t	f	f	f	f	First time visitor. Sourced from EICSL inquiry form. Will pay cash/check.	2018-12-04 14:20:08.424559	2018-12-04 14:20:14.62421	20	73	Male	Guest	2018-12-05	\N
442	THOMAS WALL	f	f	t	t	f	f	f	t	😇😈	2018-12-04 15:05:38.55995	2018-12-04 15:05:38.55995	21	73	Male	Full Member	2018-12-05	\N
443	Lori Lavoie	f	f	t	t	f	f	f	t	MY OLD BED IF POSSIBLE (TYROL SINGLE)	2018-12-06 03:08:11.564183	2018-12-06 03:08:11.564183	44	110	Female	Associate Member	2019-01-02	\N
444	John Dobermiller 	f	f	f	f	f	t	t	t		2018-12-08 02:36:24.888155	2018-12-08 02:36:24.888155	2	108	Male	Full Member	2018-12-19	\N
445	John Dobermiller 	t	t	t	t	t	t	f	t		2018-12-08 02:37:37.930595	2018-12-08 02:37:37.930595	2	111	Male	Full Member	2018-12-26	\N
446	Dan Shults	f	f	t	t	f	f	f	t	Ringing in the New Year.	2018-12-10 21:26:38.4371	2018-12-10 21:26:38.4371	20	111	Male	Full Member	2018-12-26	\N
447	Dan Shults	f	f	t	t	f	f	f	f	Thirst-Ade.	2018-12-10 21:28:12.7941	2018-12-10 21:28:12.7941	20	110	Male	Full Member	2019-01-02	\N
449	Mike Ryan	f	f	t	t	f	f	f	f		2018-12-18 19:14:54.85017	2018-12-18 19:14:54.85017	14	110	Male	Full Member	2019-01-02	\N
450	Mike Ryan	f	f	t	t	f	f	f	t		2018-12-18 19:15:27.99328	2018-12-18 19:15:27.99328	14	112	Male	Full Member	2019-01-09	\N
451	Mike Ryan	f	f	t	t	t	f	f	t	Unlikely To be there Friday night 	2018-12-18 19:15:48.501205	2018-12-18 19:17:54.521263	14	113	Male	Full Member	2019-01-16	\N
452	Sara Delaney	f	f	t	t	f	f	f	f		2018-12-18 20:34:19.726455	2018-12-18 20:34:19.726455	31	110	Female	Associate Member	2019-01-02	\N
453	Amy Cheever	f	t	t	t	t	t	f	t	NEW YEARS\r\n	2018-12-19 02:44:30.780586	2018-12-19 02:44:30.780586	16	111	Female	Full Member	2018-12-26	\N
454	Chris Candelora	f	t	t	t	t	t	f	t	New Years	2018-12-19 02:45:00.294792	2018-12-19 02:45:00.294792	16	111	Male	Full Member	2018-12-26	\N
455	Alana McCarthy 	f	f	t	t	t	t	f	t		2018-12-19 19:56:31.494713	2018-12-19 19:56:31.494713	23	111	Female	Full Member	2018-12-26	\N
456	Alana McCarthy 	f	f	t	t	t	f	f	f	First aid	2018-12-19 19:57:52.710964	2018-12-19 19:57:52.710964	23	110	Female	Full Member	2019-01-02	\N
488	Meaghan Sydlowski	f	f	t	t	f	f	f	f	We play BSSC Volleyball with Meaghan... and it turns out her father, and several other members of her family, are former Bretts! This is her first visit. Paying cash/check.	2018-12-20 16:45:13.84577	2018-12-20 16:45:21.078561	20	110	Female	Guest	2019-01-02	\N
448	Mike Ryan	f	f	t	t	t	t	f	t	Only Maybe on Sunday & Monday	2018-12-18 19:13:44.134383	2018-12-21 19:48:49.393686	14	111	Male	Full Member	2018-12-26	\N
575	Chris Candelora	f	f	t	t	f	f	f	t		2019-01-22 14:06:19.904751	2019-01-22 14:06:19.904751	16	146	Male	Full Member	2019-01-23	\N
490	Christopher Hoeddinghaus	f	f	t	t	f	f	f	t	Full time instructor at Bretton Woods. He seems interested in staying a lot. Not sure how cool we are with hime being a guest a ton- not sure he could be a member since I think he primarily needs somewhere to live. Long story. Something to discuss. Will pay cash. -Dan  P.S. requests Bear for bedroom, if possible.  since he works in the AM.	2018-12-24 22:07:55.734043	2018-12-24 22:13:14.728243	20	111	Male	Guest	2018-12-26	\N
489	Christopher Hoeddinghaus	f	f	t	t	f	f	f	f	Returning guest and full time instructor at Bretton Woods. Prrrrrrobably not a membership prospect since he needs a place to LIVE, but he seems interested in hanging out with us a lot. Will pay cash/check. - Dan. P.S. requests Bear for bedroom, if possible.  since he works in the AM.	2018-12-24 22:04:29.480282	2018-12-24 22:13:46.766451	20	110	Male	Guest	2019-01-02	\N
491	Samantha Brown	f	f	t	t	f	f	f	f	Friend of Tommy's. Has been to some EICSL events before. Will pay via PayPal.	2018-12-26 15:20:50.456931	2018-12-26 15:20:50.456931	20	110	Female	Guest	2019-01-02	\N
492	Robert Miller	f	f	t	t	f	f	f	f	Friend of Samantha Brown, who is a friend of Tommy's. Will pay via cash/check. 	2018-12-26 15:26:35.864765	2018-12-26 15:27:12.816485	20	110	Male	Guest	2019-01-02	\N
493	THOMAS WALL	f	f	t	t	t	t	f	t		2018-12-26 21:34:42.688922	2018-12-26 21:34:42.688922	21	111	Male	Full Member	2018-12-26	\N
494	Andrew Blohm	f	f	f	f	f	t	f	t	This is Andrew's second visit. He came out for Best Weekend and said he had a great time. He's a strong prospect! I am filling out his reservation but will NOT be at the club Monday night! Please make sure Andrew finds his way to the party, and ideally, take a few runs with him on Tues if you're going to the same mountain. -Dan	2018-12-26 22:58:55.499292	2018-12-26 22:58:55.499292	20	111	Male	Guest	2018-12-26	\N
495	Kevin Buckley 	f	f	t	t	t	f	f	t	Veggie dinner please 	2018-12-28 15:00:32.967338	2018-12-28 15:00:32.967338	33	110	Male	Associate Member	2019-01-02	\N
496	Mirian Barrientos 	f	f	t	t	t	f	f	t	Saturday dinner please, no restrictions 	2018-12-28 15:02:01.515439	2018-12-28 15:02:01.515439	33	110	Female	Associate Member	2019-01-02	\N
497	Whitney factor 	f	f	t	t	t	f	f	t	Saturday dinner please, no restrictions	2018-12-28 15:02:59.302652	2018-12-28 15:02:59.302652	33	110	Female	Guest	2019-01-02	\N
498	Mallory Spero 	f	f	t	t	t	f	f	t	Saturday dinner please, no dairy	2018-12-28 15:04:08.231267	2018-12-28 15:04:08.231267	33	110	Female	Guest	2019-01-02	\N
499	Michelle Comtois	f	f	t	t	f	f	f	t	Is there a Dr in the house?	2018-12-28 16:42:09.625119	2018-12-28 16:42:09.625119	5	110	Female	Full Member	2019-01-02	\N
500	Amy Cheever	f	f	t	t	f	f	f	t	I need some Medical help!	2018-12-28 20:09:21.159699	2018-12-28 20:09:21.159699	16	110	Female	Full Member	2019-01-02	\N
501	Chris Candelora	f	f	t	t	f	f	f	t	First Aid	2018-12-28 20:10:11.176833	2018-12-28 20:10:11.176833	16	110	Male	Full Member	2019-01-02	\N
502	Nikki Shults	f	t	t	t	f	f	f	f	First Aid 	2018-12-28 20:11:52.07219	2018-12-28 20:11:52.07219	9	110	Female	Full Member	2019-01-02	\N
503	Mark Buckley	f	f	t	t	f	f	f	f		2018-12-28 22:42:00.560177	2018-12-28 22:42:00.560177	22	110	Male	Full Member	2019-01-02	\N
504	Hiliary Carlson	f	f	t	t	f	f	f	f		2018-12-28 22:42:59.022615	2018-12-28 22:42:59.022615	22	110	Female	Guest	2019-01-02	\N
505	Brendan Halpin	f	f	t	t	f	f	f	f		2018-12-28 22:43:19.987826	2018-12-28 22:43:19.987826	22	110	Female	Guest	2019-01-02	\N
506	Kristen Chamberlain	f	f	t	t	f	f	f	f		2018-12-28 22:43:45.383102	2018-12-28 22:43:45.383102	22	110	Female	Guest	2019-01-02	\N
507	Tommy Wall	f	f	t	t	f	f	f	t	I am in to have the most jello shots\r\n	2018-12-29 02:50:08.596411	2018-12-29 02:50:08.596411	16	110	Male	Full Member	2019-01-02	\N
508	John D.	f	t	t	t	f	f	f	t		2018-12-29 02:51:13.296867	2018-12-29 02:51:13.296867	16	110	Male	Full Member	2019-01-02	\N
509	Vicky	f	t	t	t	f	f	f	t		2018-12-29 02:51:42.933452	2018-12-29 02:51:42.933452	16	110	Female	Full Member	2019-01-02	\N
510	Doug mayo	f	f	t	t	f	f	f	t		2018-12-29 03:01:40.322206	2018-12-29 03:01:40.322206	12	110	Male	Full Member	2019-01-02	\N
511	Chris Bromery	f	f	t	t	f	f	f	f	First Aid!!	2018-12-29 19:32:22.451608	2018-12-29 19:32:22.451608	15	110	Male	Full Member	2019-01-02	\N
512	Nung	f	f	t	t	f	f	f	t		2019-01-02 16:24:33.415435	2019-01-02 16:24:33.415435	7	110	Male	Full Member	2019-01-02	\N
513	Doug mayo	f	f	t	t	f	f	f	t	Getintoit 	2019-01-03 01:05:34.52373	2019-01-03 01:05:34.52373	12	112	Male	Full Member	2019-01-09	\N
514	Megan m	f	f	t	t	f	f	f	t		2019-01-03 01:06:07.769867	2019-01-03 01:06:07.769867	12	112	Female	Full Member	2019-01-09	\N
515	Doug M	f	f	t	t	t	f	f	t		2019-01-03 01:06:49.420008	2019-01-03 01:06:49.420008	12	113	Male	Full Member	2019-01-16	\N
546	Dan Shults	f	f	t	t	f	f	f	f	Scoopa-Bowl. Planning to bring a bunch of guests. Will get them registered as RSVPs come in. 	2019-01-07 19:09:29.793573	2019-01-07 19:09:29.793573	20	145	Male	Full Member	2019-01-30	\N
547	Michelle Comtois	f	f	t	t	f	f	f	t		2019-01-08 16:36:24.490742	2019-01-08 16:36:24.490742	5	113	Female	Full Member	2019-01-16	\N
548	Dan Shults	f	f	t	t	f	f	f	t	Most likely bringing a guest or two. 	2019-01-08 21:02:58.630896	2019-01-08 21:02:58.630896	20	112	Male	Full Member	2019-01-09	\N
549	Brandon Juby	f	f	t	t	f	f	f	t	Guest of Dan	2019-01-09 15:34:07.560311	2019-01-09 15:34:07.560311	20	112	Male	Guest	2019-01-09	\N
550	Chris	f	f	t	t	t	f	f	t		2019-01-15 14:38:31.869124	2019-01-15 14:38:31.869124	1	113	Male	Full Member	2019-01-16	\N
551	Amy	f	f	t	t	t	f	f	t		2019-01-15 14:38:58.781425	2019-01-15 14:38:58.781425	1	113	Female	Full Member	2019-01-16	\N
552	Paul Fogel	f	f	t	t	f	f	f	t	Bringing a few people up	2019-01-15 15:20:39.513831	2019-01-15 15:20:39.513831	34	113	Male	Associate Member	2019-01-16	\N
553	Elizabeth B	f	f	t	t	f	f	f	t	Guest of Paul F	2019-01-15 15:22:04.21695	2019-01-15 15:22:04.21695	34	113	Female	Guest	2019-01-16	\N
554	Elizabeth B +1	f	f	t	t	f	f	f	t	Guest of Paul F	2019-01-15 15:28:08.938754	2019-01-15 15:28:08.938754	34	113	Male	Guest	2019-01-16	\N
555	Haydn Ady	f	f	t	t	f	f	f	t	Guest of Paul F	2019-01-15 15:29:01.493146	2019-01-15 15:29:01.493146	34	113	Male	Guest	2019-01-16	\N
556	Isaac Estey	f	f	t	t	f	f	f	t	Guest of Paul F	2019-01-15 15:29:33.158098	2019-01-15 15:29:33.158098	34	113	Male	Guest	2019-01-16	\N
557	Louis Perna	f	f	t	t	f	f	f	t	Guest of Paul F	2019-01-15 15:29:54.92341	2019-01-15 15:29:54.92341	34	113	Male	Guest	2019-01-16	\N
558	Sara Delaney	f	f	f	f	t	f	f	t		2019-01-15 16:19:40.138631	2019-01-15 16:20:45.896537	31	113	Female	Associate Member	2019-01-16	\N
559	Emily Bularzik	f	f	f	f	t	f	f	t	Guest of Sara Delaney	2019-01-15 16:21:51.725845	2019-01-15 16:22:21.026988	31	113	Female	Guest	2019-01-16	\N
561	cher	f	f	t	t	t	f	f	t	guest of Amy	2019-01-16 00:51:57.939313	2019-01-16 00:51:57.939313	16	113	Female	Full Member	2019-01-16	\N
562	Matt C	f	f	t	t	t	f	f	t	guest of Amy	2019-01-16 00:52:28.061122	2019-01-16 00:52:28.061122	16	113	Male	Guest	2019-01-16	\N
563	Mark Buckley	f	f	t	t	f	f	f	t		2019-01-16 13:40:25.4501	2019-01-16 13:40:25.4501	22	113	Male	Full Member	2019-01-16	\N
564	Hiliary Carlson	f	f	t	t	f	f	f	t		2019-01-16 13:41:06.659152	2019-01-16 13:41:06.659152	22	113	Female	Guest	2019-01-16	\N
565	Michelle Comtois	f	f	t	t	f	f	f	t		2019-01-16 15:10:21.079938	2019-01-16 15:10:21.079938	5	145	Female	Full Member	2019-01-30	\N
560	Katy Nardozzi	f	f	f	t	t	f	f	t	Guest of Sara Delaney	2019-01-15 16:22:49.878316	2019-01-16 16:18:53.30112	31	113	Female	Guest	2019-01-16	\N
566	Marcos Rocha	f	f	f	t	t	f	f	t	Guest of Sara Delaney	2019-01-16 16:24:24.604519	2019-01-16 16:24:24.604519	31	113	Male	Guest	2019-01-16	\N
567	Jasleen Kals	f	f	f	t	t	f	f	t	Guest of Sara Delaney	2019-01-16 16:24:49.793519	2019-01-16 16:24:49.793519	31	113	Female	Guest	2019-01-16	\N
568	Vicki Santarcangelo	f	f	t	t	t	f	f	t		2019-01-16 17:49:11.588154	2019-01-16 17:49:11.588154	3	113	Female	Full Member	2019-01-16	\N
569	Nikki Shults	f	f	t	t	f	f	f	f	Scooper bowl	2019-01-16 18:12:55.082221	2019-01-16 18:12:55.082221	9	145	Female	Full Member	2019-01-30	\N
570	THOMAS WALL	f	f	t	t	f	f	f	t	May not be able to make it till sat morn	2019-01-16 20:14:58.994022	2019-01-16 20:14:58.994022	21	113	Male	Full Member	2019-01-16	\N
571	Chris candelora	f	f	t	t	f	f	f	t	Scooper Bowl	2019-01-19 00:43:10.356243	2019-01-19 00:43:10.356243	16	145	Male	Full Member	2019-01-30	\N
572	Amy Cheever	f	f	t	t	f	f	f	t		2019-01-19 00:43:40.533653	2019-01-19 00:43:40.533653	16	145	Female	Full Member	2019-01-30	\N
573	LORI LAVOIE	f	f	t	t	f	f	f	t	My old bed in Tyrol if avail please	2019-01-21 12:44:49.043089	2019-01-21 12:44:49.043089	44	146	Female	Associate Member	2019-01-23	\N
574	amy cheever	f	f	t	t	f	f	f	t		2019-01-22 14:05:58.092858	2019-01-22 14:05:58.092858	16	146	Female	Full Member	2019-01-23	\N
576	Jess Przywara	f	f	t	t	f	f	f	t	Guest of Mike Ryan	2019-01-22 16:42:41.663331	2019-01-22 16:42:41.663331	14	146	Female	Guest	2019-01-23	\N
577	Mike Ryan	f	f	t	t	f	f	f	t		2019-01-22 16:43:27.570623	2019-01-22 16:43:27.570623	14	146	Male	Full Member	2019-01-23	\N
578	Mike Ryan	f	f	t	t	f	f	f	t		2019-01-22 16:44:28.626046	2019-01-22 16:44:28.626046	14	147	Male	Full Member	2019-02-06	\N
579	Mike Ryan	f	f	t	t	t	t	f	t		2019-01-22 16:45:13.4518	2019-01-22 16:45:13.4518	14	148	Male	Full Member	2019-02-13	\N
580	Mike Ryan	f	f	t	t	f	f	f	t		2019-01-22 16:45:47.950831	2019-01-22 16:45:47.950831	14	149	Male	Full Member	2019-02-20	\N
582	Sara Delaney	f	f	t	t	f	f	f	f		2019-01-22 17:50:12.211587	2019-01-22 17:50:12.211587	31	151	Female	Associate Member	2019-03-20	\N
583	Paula Miller	f	f	t	t	f	f	f	f	Guest of Sara Delaney	2019-01-22 17:51:42.090383	2019-01-22 17:51:42.090383	31	151	Female	Guest	2019-03-20	\N
586	Dan Milbrandt	f	f	t	t	f	f	f	f	Guest of Dan	2019-01-22 18:13:52.017311	2019-01-22 18:13:52.017311	20	145	Male	Guest	2019-01-30	\N
587	Jose Colon	f	f	f	t	f	f	f	f	Guest of Dan	2019-01-22 18:15:27.129539	2019-01-22 18:15:27.129539	20	145	Male	Guest	2019-01-30	\N
588	Emily Motroni	f	f	f	t	f	f	f	f	Guest of Dan	2019-01-22 18:16:34.33145	2019-01-22 18:16:34.33145	20	145	Female	Guest	2019-01-30	\N
589	Matt Beal	f	f	t	t	f	f	f	f	Guest of Dan/Nikki	2019-01-22 18:17:29.74317	2019-01-22 18:17:36.222082	20	145	Male	Guest	2019-01-30	\N
590	Brandon Juby	f	f	t	t	f	f	f	f	Guest of Dan/Nikki	2019-01-22 18:17:57.194357	2019-01-22 18:17:57.194357	20	145	Male	Guest	2019-01-30	\N
584	Julie Rawson	f	f	f	t	f	f	f	f	Guest of Dan/Nikki	2019-01-22 18:12:07.095258	2019-01-23 16:15:30.066021	20	145	Female	Guest	2019-01-30	\N
585	Jerry Rawson	f	f	f	t	f	f	f	f	Guest of Dan/Nikki	2019-01-22 18:12:44.142863	2019-01-23 16:15:54.811739	20	145	Male	Guest	2019-01-30	\N
593	Andrew Blohm	f	f	t	t	f	f	f	f	Second visit- also came for best weekend. Strong prospect.	2019-01-26 03:44:59.823039	2019-01-26 03:44:59.823039	20	145	Male	Guest	2019-01-30	\N
594	Danielle T	f	f	t	t	f	f	f	t	coworker of Amy	2019-01-29 12:49:17.709023	2019-01-29 12:49:17.709023	16	145	Female	Guest	2019-01-30	\N
595	Derek T	f	f	t	t	f	f	f	t	Husband of Danielle T, Guest of Amy	2019-01-29 12:49:55.548671	2019-01-29 12:49:55.548671	16	145	Male	Guest	2019-01-30	\N
596	Lenore	f	f	t	t	f	f	f	t	coworker of Amy	2019-01-29 12:52:03.954394	2019-01-29 12:52:03.954394	16	145	Female	Guest	2019-01-30	\N
597	Arabelis	f	f	t	t	f	f	f	t	coworker Amy 	2019-01-29 12:52:32.324423	2019-01-29 12:52:32.324423	16	145	Female	Guest	2019-01-30	\N
598	Kelly	f	f	f	t	f	f	f	t	coworker of Amy.  May only come for the day	2019-01-29 12:55:06.808282	2019-01-29 12:55:06.808282	16	145	Female	Guest	2019-01-30	\N
599	Alana Mccarthy 	f	f	t	t	f	f	f	t		2019-01-29 13:02:26.501215	2019-01-29 13:02:26.501215	23	145	Female	Full Member	2019-01-30	\N
600	Tommy Wall	f	f	t	t	f	f	f	t		2019-01-29 13:03:37.284606	2019-01-29 13:03:37.284606	23	145	Male	Full Member	2019-01-30	\N
601	LORI lavoie	f	f	t	t	f	f	f	f	My old bed in Tyrol please if possible. Friday only maybe, very late night arrival if so.	2019-01-29 13:11:41.879607	2019-01-29 13:12:29.730271	44	145	Female	Associate Member	2019-01-30	\N
602	Andrew Morrissey	f	f	t	t	f	f	f	f	Guest via EICSL inquiry form returning for his second visit. Paying via cash/check.	2019-01-29 14:07:58.793084	2019-01-29 14:07:58.793084	20	145	Male	Guest	2019-01-30	\N
604	Sara Delaney	f	f	t	t	f	f	f	f		2019-01-29 21:18:54.388819	2019-01-29 21:18:54.388819	31	145	Female	Associate Member	2019-01-30	\N
605	Chris Bromery	f	f	t	t	f	f	f	f	Scooper Bowl!!	2019-01-30 00:45:08.603532	2019-01-30 00:45:08.603532	15	145	Male	Full Member	2019-01-30	\N
606	Sigrun Asta	f	f	f	t	f	f	f	f	Guest of Chris B, arriving Sat Eve.	2019-01-30 00:47:25.887995	2019-01-30 00:47:25.887995	15	145	Female	Guest	2019-01-30	\N
603	Dan Jacobs	f	f	t	t	f	f	f	f	First time guest. Friend of Andrew Morrisey. He came by with Andrew several weeks ago and got a tour. Will pay cash/check.	2019-01-29 14:09:26.0238	2019-01-30 14:49:04.727956	20	145	Male	Guest	2019-01-30	\N
607	Dan Shults	f	f	t	t	f	f	f	t	Possibly bringing some guests	2019-02-04 16:33:46.363084	2019-02-04 16:33:46.363084	20	147	Male	Full Member	2019-02-06	\N
609	Chris	f	f	t	t	f	f	f	t		2019-02-04 20:31:35.485893	2019-02-04 20:31:35.485893	1	147	Male	Full Member	2019-02-06	\N
608	Amy	f	f	t	t	f	f	f	t		2019-02-04 20:30:15.940615	2019-02-04 20:31:51.014943	1	147	Female	Full Member	2019-02-06	\N
610	Mike Ryan 	f	f	f	t	f	f	f	t		2019-02-05 14:06:19.399832	2019-02-05 14:06:19.399832	14	147	Male	Full Member	2019-02-06	\N
611	Mike Ryan 	f	f	t	t	t	t	f	t	Vacation week 	2019-02-05 14:07:12.645056	2019-02-05 14:07:12.645056	14	148	Male	Full Member	2019-02-13	\N
612	Jess Przywara 	f	f	f	t	t	f	f	t		2019-02-05 14:08:20.12209	2019-02-05 14:08:20.12209	14	148	Female	Guest	2019-02-13	\N
767	Alana Mccarthy 	f	f	f	t	t	f	f	t	Tubing	2019-06-24 15:29:42.941619	2019-06-24 15:29:42.941619	23	165	Female	Full Member	2019-07-17	\N
613	Jennifer Edwards	f	f	t	f	f	f	f	t	First time guest. She reached out to us via email. I will sponsor her -Dan	2019-02-05 14:25:49.432504	2019-02-05 14:25:49.432504	20	147	Female	Guest	2019-02-06	\N
614	Steve Barry	f	f	t	t	f	f	f	t	First time visitor. His mom is a Lawrencian. I will sponsor, but may need some support, as I will have other guests up. - Dan	2019-02-05 19:55:27.13245	2019-02-05 19:55:27.13245	20	148	Male	Guest	2019-02-13	\N
711	Amy Cheever	f	f	t	t	f	f	f	t		2019-03-12 13:31:12.013022	2019-03-12 13:31:12.013022	1	154	Female	Full Member	2019-03-13	\N
615	Chris Lauria	f	f	t	t	f	f	f	t	First time guest. Coming with Steve Barry, who's mom is a Lawrencian. I'll sponsor, but may need some support since I will have several other guests. - Dan	2019-02-05 19:57:53.360285	2019-02-05 19:57:53.360285	20	148	Male	Guest	2019-02-13	\N
616	Dan Shults	f	t	t	t	f	f	f	t	Bringing a handful of guests. 	2019-02-05 20:17:13.019819	2019-02-05 20:17:13.019819	20	148	Male	Full Member	2019-02-13	\N
617	Mike Lewis	f	f	t	t	f	f	f	t	First time visitor. Friend of Dan and Nikki. 	2019-02-05 20:17:57.409029	2019-02-05 20:17:57.409029	20	148	Male	Guest	2019-02-13	\N
618	Jess Simao	f	f	t	t	f	f	f	t	Friend of Dan and Nikki. Came up once before for tubing. 	2019-02-05 20:18:45.766542	2019-02-05 20:18:45.766542	20	148	Female	Guest	2019-02-13	\N
619	Brandon Juby	f	f	t	t	f	f	f	t	Occasional guest. Friend of Dan and Nikki.	2019-02-05 20:19:37.962279	2019-02-05 20:19:37.962279	20	148	Male	Guest	2019-02-13	\N
620	Ilona Juby	f	f	t	t	f	f	f	t	Friend of Dan and Nikki.	2019-02-05 20:20:01.366697	2019-02-05 20:20:01.366697	20	148	Female	Guest	2019-02-13	\N
621	Doug	f	f	t	t	f	f	f	t		2019-02-06 13:48:33.881098	2019-02-06 13:48:33.881098	1	147	Male	Full Member	2019-02-06	\N
622	Megan	f	f	t	t	f	f	f	t		2019-02-06 13:51:56.331571	2019-02-06 13:51:56.331571	1	147	Female	Full Member	2019-02-06	\N
623	Rod Catargiu	f	f	t	t	f	f	f	t	guest of Dan	2019-02-06 18:38:37.021824	2019-02-06 18:38:37.021824	20	147	Male	Guest	2019-02-06	\N
624	Mark Buckley	f	f	t	t	f	f	f	t		2019-02-10 22:03:51.54132	2019-02-10 22:03:51.54132	22	148	Male	Full Member	2019-02-13	\N
625	Hiliary Carlson	f	f	t	t	f	f	f	t		2019-02-10 22:04:21.495408	2019-02-10 22:04:21.495408	22	148	Female	Guest	2019-02-13	\N
626	John and Vicki	f	t	t	t	t	f	f	t	Adding Reservations for two of us. Vic can’t log in. 	2019-02-11 18:59:27.317832	2019-02-11 18:59:27.317832	2	148	Male	Full Member	2019-02-13	\N
627	Nick Lauria	f	f	f	t	f	f	f	t	Twin of Chris and friend of Steve, who is the son of a Lawrencian. First time visitor. 	2019-02-11 22:25:00.045148	2019-02-11 22:26:36.890221	20	148	Male	Guest	2019-02-13	\N
628	Chris Candelora	f	f	t	t	t	f	f	t		2019-02-13 00:09:24.994709	2019-02-13 00:09:24.994709	16	148	Male	Full Member	2019-02-13	\N
629	Amy Cheever	f	f	t	t	t	f	f	t		2019-02-13 00:09:54.385937	2019-02-13 00:09:54.385937	16	148	Female	Full Member	2019-02-13	\N
630	Amy Cheever	f	f	t	t	f	f	f	t		2019-02-13 00:23:02.608332	2019-02-13 00:23:02.608332	16	149	Female	Full Member	2019-02-20	\N
631	Chris Candelora	f	f	t	t	f	f	f	t		2019-02-13 00:23:58.375064	2019-02-13 00:23:58.375064	16	149	Male	Full Member	2019-02-20	\N
632	Nikki Shults	f	t	t	t	t	f	f	t	loooooong weekend! 	2019-02-13 00:42:50.997221	2019-02-13 00:42:50.997221	9	148	Female	Full Member	2019-02-13	\N
633	Lou Parente	f	f	t	t	f	f	f	t		2019-02-13 01:39:13.110113	2019-02-13 01:39:47.864288	32	148	Male	Associate Member	2019-02-13	\N
634	Argery Katzounas	f	f	t	t	f	f	f	t		2019-02-13 01:42:21.352869	2019-02-13 01:42:21.352869	32	148	Male	Associate Member	2019-02-13	\N
635	Andrew Blohm	f	f	t	t	t	f	f	t	First time reserving.  	2019-02-13 21:58:30.478951	2019-02-13 21:58:30.478951	47	148	Male	Full Member	2019-02-13	\N
668	Andrew Morrissey	f	f	t	t	t	f	f	t		2019-02-20 03:09:28.593237	2019-02-20 03:09:28.593237	46	149	Male	Full Member	2019-02-20	\N
669	Alana McCarthy 	f	f	t	t	f	f	f	t		2019-02-20 19:47:38.308277	2019-02-20 19:47:38.308277	23	149	Female	Full Member	2019-02-20	\N
671	John Dobermiller	f	t	t	t	t	f	f	t		2019-02-22 18:34:37.886733	2019-02-22 18:34:37.886733	2	152	Male	Full Member	2019-02-27	\N
672	Vicki Santarcangelo	f	t	t	t	t	f	f	t		2019-02-23 01:06:56.112143	2019-02-23 01:08:14.257271	3	152	Female	Full Member	2019-02-27	\N
673	Vicki Santarcangelo	f	t	t	t	t	f	f	t		2019-02-23 01:07:31.678488	2019-02-23 01:08:34.393283	3	151	Female	Full Member	2019-03-20	\N
674	Alana McCarthy 	f	f	t	t	t	f	f	t		2019-02-24 17:53:27.334844	2019-02-24 17:53:27.334844	23	152	Female	Full Member	2019-02-27	\N
675	Chris Candelora	f	f	t	t	f	f	f	t		2019-02-25 22:39:23.464133	2019-02-25 22:39:23.464133	16	152	Male	Full Member	2019-02-27	\N
676	Amy Cheever	f	f	t	t	f	f	f	t		2019-02-25 22:39:50.457066	2019-02-25 22:39:50.457066	16	152	Female	Full Member	2019-02-27	\N
677	Chris Candelora	f	f	t	t	f	f	f	t		2019-02-25 22:40:47.343785	2019-02-25 22:40:47.343785	16	151	Male	Full Member	2019-03-20	\N
678	Amy Cheever	f	f	t	t	f	f	f	t		2019-02-25 22:41:09.345349	2019-02-25 22:41:09.345349	16	151	Female	Full Member	2019-03-20	\N
679	Cher N	f	f	t	t	f	f	f	t	guest of Amy and Chris	2019-02-25 22:41:35.609481	2019-02-25 22:41:35.609481	16	151	Female	Guest	2019-03-20	\N
680	Matt C	f	f	t	t	f	f	f	t	guest of Amy and Chris	2019-02-25 22:42:06.907325	2019-02-25 22:42:06.907325	16	151	Male	Guest	2019-03-20	\N
681	Sean Smith	f	f	t	t	f	f	f	t	Contacted Amy Directly by email	2019-02-26 22:26:02.416791	2019-02-26 22:26:02.416791	1	152	Male	Guest	2019-02-27	\N
682	Chris L	f	f	t	f	f	f	f	t	2nd Visit prospective member 	2019-02-26 22:27:15.807067	2019-02-26 22:27:15.807067	1	152	Male	Guest	2019-02-27	\N
683	Sarah 	f	f	t	f	f	f	f	t	Girlfriend of Chris L	2019-02-26 22:28:09.363021	2019-02-26 22:28:09.363021	1	152	Female	Guest	2019-02-27	\N
684	Mike Ryan	f	f	t	t	f	f	f	t	Only tentative	2019-02-27 19:30:43.793079	2019-02-27 19:30:43.793079	14	153	Male	Full Member	2019-03-06	\N
685	Jess Przywara	f	f	t	t	f	f	f	t	Just tentative	2019-02-27 19:31:40.249153	2019-02-27 19:31:40.249153	14	153	Female	Guest	2019-03-06	\N
686	Mike Ryan	f	f	t	t	f	f	f	t	St. Pats!!!!	2019-02-27 19:32:15.095887	2019-02-27 19:32:15.095887	14	154	Male	Full Member	2019-03-13	\N
688	Mike Ryan	f	f	t	t	f	f	f	t	BBQ lunch in B lot Wildcat!!	2019-02-27 19:33:57.528279	2019-02-27 19:33:57.528279	14	155	Male	Full Member	2019-03-27	\N
689	Jess Przywara	f	f	t	t	f	f	f	t	BBQ lunch in B lot Wildcat!!	2019-02-27 19:34:27.145524	2019-02-27 19:34:27.145524	14	155	Female	Guest	2019-03-27	\N
690	Mike Ryan	f	f	t	t	f	f	f	t	Wildcat Ski School Party at the club Saturday 4 PM - till	2019-02-27 19:45:22.201606	2019-02-27 19:45:22.201606	14	156	Male	Full Member	2019-04-10	\N
691	Andrew Morrissey	f	f	t	t	f	f	f	t		2019-02-27 22:43:03.808548	2019-02-27 22:43:03.808548	46	152	Male	Full Member	2019-02-27	\N
692	Dan jacobs	f	f	f	t	f	f	f	t		2019-02-27 22:44:03.379129	2019-02-27 22:44:03.379129	46	152	Male	Guest	2019-02-27	\N
693	M.E. Jacobs 	f	f	f	t	f	f	f	t		2019-02-27 22:45:20.834708	2019-02-27 22:45:20.834708	46	152	Female	Guest	2019-02-27	\N
694	James Morrissey 	f	f	t	t	f	f	f	t		2019-02-27 22:47:11.00153	2019-02-27 22:47:11.00153	46	152	Male	Guest	2019-02-27	\N
695	Adam richer	f	f	f	t	f	f	f	t		2019-02-27 22:49:22.654262	2019-02-27 22:49:22.654262	46	152	Male	Guest	2019-02-27	\N
696	Beth Smith	t	t	t	t	t	t	t	t		2019-03-05 19:03:41.327292	2019-03-05 19:03:41.327292	1	153	Female	Full Member	2019-03-06	\N
697	Beth Smith	t	t	t	t	t	t	t	t		2019-03-05 19:04:27.752468	2019-03-05 19:04:27.752468	1	154	Female	Full Member	2019-03-13	\N
698	Sara Delaney	f	f	t	t	f	f	f	t		2019-03-06 18:30:56.678834	2019-03-06 18:30:56.678834	31	154	Female	Associate Member	2019-03-13	\N
699	Andrew Morrissey	f	f	f	t	f	f	f	t		2019-03-06 20:31:03.492385	2019-03-06 20:31:03.492385	46	153	Male	Full Member	2019-03-06	\N
700	Dan jacobs	f	f	f	t	f	f	f	t		2019-03-06 20:32:16.919712	2019-03-06 20:32:16.919712	46	153	Male	Guest	2019-03-06	\N
701	Alana McCarthy 	f	f	t	t	t	f	f	f	Iceee	2019-03-08 23:26:40.013793	2019-03-08 23:26:40.013793	23	151	Female	Full Member	2019-03-20	\N
702	Tommy Wall 	f	f	t	t	t	f	f	f	Ice Bah	2019-03-08 23:27:19.498867	2019-03-08 23:27:19.498867	23	151	Male	Full Member	2019-03-20	\N
704	ken simon	f	f	t	t	f	f	f	t		2019-03-09 04:53:42.908976	2019-03-09 04:53:42.908976	45	154	Male	Full Member	2019-03-13	\N
703	ken simon	f	f	t	t	f	f	f	f		2019-03-09 04:51:26.853922	2019-03-09 04:54:44.687167	45	151	Male	Full Member	2019-03-20	\N
705	Allison Galbraith	f	f	t	t	f	f	f	t	guest of Sara Delaney	2019-03-09 18:21:50.61783	2019-03-09 18:21:50.61783	31	154	Female	Guest	2019-03-13	\N
1373	Chris Bromery	f	t	t	t	f	f	f	f	Mini-ULLR Weekend!	2020-10-20 17:16:30.940267	2020-10-20 17:16:30.940267	15	300	Male	Full Member	2021-02-03	\N
670	Dan Shults	f	f	t	t	f	f	f	f	Ice Baaaaaaaa	2019-02-21 22:07:22.193718	2019-03-13 15:02:08.290666	20	151	Male	Full Member	2019-03-20	\N
687	Mike Ryan	f	f	t	t	t	f	f	f	Ice Bar!!	2019-02-27 19:32:57.838268	2019-03-15 16:17:27.208247	14	151	Male	Full Member	2019-03-20	\N
707	LORI lavoie	f	f	t	t	f	f	f	t	Ice bar.  My old bed in Tyrol if possible please.	2019-03-10 11:51:03.450719	2019-03-10 11:51:03.450719	44	151	Female	Associate Member	2019-03-20	\N
708	John	f	t	t	t	t	t	t	t	I will be bringing and making corned beef and cabbage Saturday night for up to 10 people. Please send me an email at jdobermill@yahoo.com if interested.	2019-03-11 12:44:51.083428	2019-03-11 12:44:51.083428	2	154	Male	Full Member	2019-03-13	\N
712	Chris C	f	f	t	t	f	f	f	t		2019-03-12 13:31:34.846974	2019-03-12 13:31:34.846974	1	154	Male	Full Member	2019-03-13	\N
713	Alana McCarthy 	f	f	t	t	t	f	f	t		2019-03-12 16:30:16.063408	2019-03-12 16:30:16.063408	23	154	Female	Full Member	2019-03-13	\N
714	Tommy wall	f	f	t	t	f	f	f	t		2019-03-12 16:47:32.801855	2019-03-12 16:47:32.801855	23	154	Male	Full Member	2019-03-13	\N
706	Laurel Galbraith	f	f	t	t	f	f	f	t	guest of Sara Delaney	2019-03-09 18:22:26.359616	2019-03-12 22:13:36.345405	31	154	Female	Guest	2019-03-13	\N
715	LISA	f	f	t	t	f	f	f	t	reached out to me.  Possible member  waterwoman@ymail.	2019-03-12 22:40:03.253	2019-03-12 22:40:03.253	16	154	Female	Guest	2019-03-13	\N
716	Nikki Shult	f	f	t	t	f	f	f	t	I'll bring my own dinner	2019-03-12 23:06:34.319685	2019-03-12 23:06:34.319685	9	151	Female	Full Member	2019-03-20	\N
717	Chris Bromery	f	f	t	t	f	f	f	t	St. Pats!	2019-03-13 01:48:27.416424	2019-03-13 01:48:27.416424	15	154	Male	Full Member	2019-03-13	\N
718	Chris Bromery	f	f	t	t	f	f	f	f	Ice Bar!	2019-03-13 01:50:36.162329	2019-03-13 01:50:36.162329	15	151	Male	Full Member	2019-03-20	\N
719	Ron Swanick	f	f	t	t	f	f	f	f	Guest of Chris B. Ice Bar!!	2019-03-13 02:01:51.122086	2019-03-13 02:01:51.122086	15	151	Male	Guest	2019-03-20	\N
757	Alana McCarthy 	f	f	t	t	t	f	f	t	Work weekend	2019-05-27 17:16:17.037397	2019-05-27 17:16:17.037397	23	162	Female	Full Member	2019-05-29	\N
720	Tevis Morrow	f	f	t	t	f	f	f	f		2019-03-13 20:46:35.246488	2019-03-13 20:46:35.246488	20	151	Male	Associate Member	2019-03-20	\N
721	Dan Shults	f	f	t	t	f	f	f	t	Sunday River on Saturday	2019-03-13 20:54:21.957878	2019-03-13 20:54:21.957878	20	157	Male	Full Member	2019-04-03	\N
722	Nung	f	f	t	t	f	f	f	t	Icebar!!!	2019-03-14 23:43:42.325195	2019-03-14 23:43:42.325195	7	151	Male	Full Member	2019-03-20	\N
723	Chuck Alaimo	f	f	t	t	f	f	f	t	Chuck would like just room for Friday and Saturday Evenings.  He will not partake in any of the parties, meals, etc.	2019-03-14 23:45:07.015719	2019-03-14 23:45:07.015719	7	151	Male	Guest	2019-03-20	\N
724	John Dobermiller	f	t	t	t	t	f	f	t		2019-03-15 13:37:47.255513	2019-03-15 13:37:47.255513	2	155	Male	Full Member	2019-03-27	\N
725	Bec Knight	f	f	f	f	f	f	f	f	Coming to Ice Bar - Bus ride and dinner. Not staying	2019-03-15 16:06:48.491411	2019-03-15 16:06:48.491411	14	151	Female	Guest	2019-03-20	\N
726	Heather Knight	f	f	f	f	f	f	f	f	Coming to Ice Bar - Bus ride and dinner - not staying	2019-03-15 16:08:21.832909	2019-03-15 16:08:21.832909	14	151	Female	Guest	2019-03-20	\N
727	Jess Pfaffinger	f	f	f	t	f	f	f	f	Ice Bar! -Saturday night stay over	2019-03-15 16:10:14.124085	2019-03-15 16:10:14.124085	14	151	Female	Guest	2019-03-20	\N
728	Brian Pfaffinger	f	f	f	t	f	f	f	f	Ice Bar! Saturday night stay over	2019-03-15 16:11:25.481258	2019-03-15 16:11:25.481258	14	151	Male	Guest	2019-03-20	\N
729	Mark Buckley	f	f	t	t	f	f	f	f		2019-03-17 02:59:42.046206	2019-03-17 02:59:42.046206	22	151	Male	Full Member	2019-03-20	\N
730	Hiliary Carlson 	f	f	t	t	f	f	f	f		2019-03-17 03:00:16.528407	2019-03-17 03:00:16.528407	22	151	Female	Guest	2019-03-20	\N
731	Brendan Halpin 	f	f	t	t	f	f	f	f		2019-03-17 03:00:54.198441	2019-03-17 03:00:54.198441	22	151	Male	Guest	2019-03-20	\N
732	Kristen Chamberlain 	f	f	t	t	f	f	f	f		2019-03-17 03:01:20.130949	2019-03-17 03:01:20.130949	22	151	Female	Guest	2019-03-20	\N
758	Michelle Comtois	f	f	t	t	f	f	f	t		2019-05-28 14:38:15.739528	2019-05-28 14:38:15.739528	5	162	Female	Full Member	2019-05-29	\N
734	Doug mayo	f	f	t	t	f	f	f	t		2019-03-17 23:03:42.730391	2019-03-17 23:03:42.730391	12	151	Male	Full Member	2019-03-20	\N
735	Megan Mccauley 	f	f	t	t	f	f	f	t	Getintoit 	2019-03-17 23:04:27.231332	2019-03-17 23:04:27.231332	12	151	Female	Full Member	2019-03-20	\N
736	Bob quintal 	f	f	t	t	f	f	f	t	Getintoit 	2019-03-17 23:05:06.271356	2019-03-17 23:05:06.271356	12	151	Male	Guest	2019-03-20	\N
737	Seth Peterson 	f	f	t	t	f	f	f	t	Getintoit 	2019-03-17 23:05:48.152319	2019-03-17 23:05:48.152319	12	151	Male	Guest	2019-03-20	\N
738	Tyler stolba	f	f	t	t	f	f	f	t	Getintoit 	2019-03-17 23:06:24.508293	2019-03-17 23:06:24.508293	12	151	Male	Guest	2019-03-20	\N
739	Bryan moorey	f	f	t	t	f	f	f	t	Getintoit 	2019-03-17 23:07:00.775011	2019-03-17 23:07:00.775011	12	151	Male	Guest	2019-03-20	\N
709	John Dobermiller	t	t	t	t	t	f	f	f	Check for VS and I is in the box.	2019-03-11 12:45:31.282458	2019-03-19 13:22:58.95593	2	151	Male	Full Member	2019-03-20	\N
740	Emily Bularzik	f	f	t	t	f	f	f	f	Guest of Sara Delaney	2019-03-20 01:52:17.501172	2019-03-20 01:52:17.501172	31	151	Female	Guest	2019-03-20	\N
741	Gene McCarthy	f	f	f	t	f	f	f	t	No lodging/no food. Guest of Alana M	2019-03-20 19:48:01.233122	2019-03-20 19:48:01.233122	23	151	Male	Guest	2019-03-20	\N
742	Vicki Santarcangelo 	f	t	t	t	t	f	f	t	Wildcat BBQ tailgate	2019-03-25 01:06:53.622981	2019-03-25 01:08:59.229485	3	155	Female	Full Member	2019-03-27	\N
743	Chris Bromery	f	f	t	t	f	f	f	t	Tentative	2019-03-27 20:39:00.369685	2019-03-27 20:39:00.369685	15	155	Male	Full Member	2019-03-27	\N
744	Chris Bromery	f	f	t	t	f	f	f	t	Spring Fling	2019-04-02 00:36:17.131533	2019-04-02 00:36:17.131533	15	157	Male	Full Member	2019-04-03	\N
745	Ron Swanick	f	f	t	t	f	f	f	t	Guest of CB	2019-04-02 00:36:52.807513	2019-04-02 00:36:52.807513	15	157	Male	Guest	2019-04-03	\N
746	doug mayo	f	f	t	t	f	f	f	t	getintoit	2019-04-02 10:50:56.108571	2019-04-02 10:50:56.108571	12	157	Male	Full Member	2019-04-03	\N
747	John Dobermiller	f	t	t	t	t	f	f	t	Vic and I will be up for the weekend. Initial thoughts are Wildcat Sat and Sunday River Sunday!	2019-04-03 15:54:02.385013	2019-04-03 15:54:02.385013	2	157	Male	Full Member	2019-04-03	\N
748	Andrew Blohm	f	f	t	t	f	f	f	t		2019-04-03 21:57:41.860249	2019-04-03 21:57:41.860249	47	158	Male	Full Member	2019-05-08	\N
749	John Dobermiller	f	t	t	t	f	f	f	t	Going downhill fast....one last time.	2019-04-08 16:45:03.886591	2019-04-08 16:45:03.886591	2	156	Male	Full Member	2019-04-10	\N
750	Vicki Santarcangelo	f	t	t	t	f	f	f	f	Wildcat Ski School Party.  Sign me up for dinner.	2019-04-10 01:29:54.434028	2019-04-10 01:29:54.434028	3	156	Female	Full Member	2019-04-10	\N
752	John D	f	t	t	t	t	t	t	t		2019-05-14 15:48:47.515147	2019-05-14 15:48:47.515147	2	160	Male	Full Member	2019-05-15	\N
753	John D	t	t	t	t	t	t	f	t	Memorial Day weekend	2019-05-14 15:49:30.057742	2019-05-14 15:49:30.057742	2	161	Male	Full Member	2019-05-22	\N
755	THOMAS WALL	f	f	t	t	f	f	f	t	Work It!	2019-05-24 13:32:01.581304	2019-05-24 13:32:01.581304	21	162	Male	Full Member	2019-05-29	\N
756	Dan Shults	f	f	t	t	f	f	f	t	Work Weekend! On firewood duty, among other things.	2019-05-24 15:42:31.705692	2019-05-24 15:42:31.705692	20	162	Male	Full Member	2019-05-29	\N
759	Nung	f	f	t	t	f	f	f	t	Work Weekend!!!	2019-05-28 14:40:24.227087	2019-05-28 14:40:24.227087	7	162	Male	Full Member	2019-05-29	\N
760	Mike Ryan	f	f	f	t	f	f	f	t	Work Weekend -wood	2019-05-28 14:56:05.106243	2019-05-28 14:56:05.106243	14	162	Male	Full Member	2019-05-29	\N
761	Kurt Yang	f	f	t	t	f	f	f	t	Work	2019-05-28 16:52:46.635311	2019-05-28 16:52:46.635311	10	162	Male	Full Member	2019-05-29	\N
762	John D	f	t	t	t	f	f	f	t	Work weekend. Wo-ho!	2019-05-28 19:05:53.676136	2019-05-28 19:05:53.676136	2	162	Male	Full Member	2019-05-29	\N
763	Chris Bromery	f	f	t	t	f	f	f	t	Work Weekend!	2019-05-29 02:06:17.519388	2019-05-29 02:06:17.519388	15	162	Male	Full Member	2019-05-29	\N
764	doug mayo	f	f	t	t	f	f	f	t	possible for work weekend	2019-05-29 16:47:20.619192	2019-05-29 16:47:20.619192	12	162	Male	Full Member	2019-05-29	\N
766	John D	t	t	t	t	f	f	f	t		2019-06-14 13:43:19.558703	2019-06-14 13:43:19.558703	2	164	Male	Full Member	2019-06-19	\N
800	Mike Ryan	f	f	t	t	f	f	f	t	Floating time	2019-06-25 18:34:50.132474	2019-06-25 18:34:50.132474	14	165	Male	Full Member	2019-07-17	\N
801	Jess Przywara	f	f	t	t	f	f	f	t		2019-06-25 18:35:45.206523	2019-06-25 18:35:45.206523	14	165	Female	Guest	2019-07-17	\N
802	ken simon	f	f	f	t	t	f	f	t		2019-06-26 16:11:03.962089	2019-06-26 16:11:03.962089	45	198	Male	Full Member	2019-07-10	\N
803	Michelle Comtois	f	f	t	t	f	f	f	t	Tubing 	2019-06-28 18:32:09.335766	2019-06-28 18:32:09.335766	5	165	Female	Full Member	2019-07-17	\N
804	Sara Delaney	f	f	t	t	f	f	f	f	tubing!	2019-06-28 19:39:10.077134	2019-06-28 19:39:10.077134	31	165	Female	Associate Member	2019-07-17	\N
805	Dan Shults	f	f	t	t	f	f	f	t	Floats M'goats	2019-06-30 01:49:48.663913	2019-06-30 01:49:48.663913	20	165	Male	Full Member	2019-07-17	\N
806	Nikki Shults	f	f	t	t	f	f	f	t	TUBING	2019-07-02 19:52:36.732139	2019-07-02 19:52:36.732139	9	165	Female	Full Member	2019-07-17	\N
810	Kristie Grunert	f	f	t	t	f	f	f	f	Guest of Mark B	2019-07-05 20:20:42.688049	2019-07-05 20:20:42.688049	22	165	Female	Guest	2019-07-17	\N
811	Brendan Halpin 	f	f	t	t	f	f	f	f		2019-07-05 20:21:07.468484	2019-07-05 20:21:07.468484	22	165	Male	Guest	2019-07-17	\N
812	Kristen Chamberlain 	f	f	t	t	f	f	f	f		2019-07-05 20:21:35.349285	2019-07-05 20:21:35.349285	22	165	Female	Guest	2019-07-17	\N
807	Mark Buckley	f	f	t	t	f	f	f	f	Tubing! 	2019-07-05 20:17:58.955785	2019-07-05 20:22:41.676402	22	165	Male	Full Member	2019-07-17	\N
808	Hiliary Carlson 	f	f	t	t	f	f	f	f		2019-07-05 20:18:42.852543	2019-07-05 20:23:08.464462	22	165	Female	Guest	2019-07-17	\N
809	Matt Landry	f	f	t	t	f	f	f	f	Guest of Mark B	2019-07-05 20:19:48.305815	2019-07-05 20:23:34.94352	22	165	Male	Guest	2019-07-17	\N
813	Ben Pritzker	f	f	t	t	f	f	f	t		2019-07-09 00:27:46.172857	2019-07-09 00:27:46.172857	20	165	Male	Full Member	2019-07-17	\N
814	Liz Thompson	f	f	f	t	f	f	f	t	Guest of Alana	2019-07-09 00:45:31.996034	2019-07-09 00:45:31.996034	23	165	Female	Guest	2019-07-17	\N
815	THOMAS WALL	f	f	t	t	f	f	f	t	Float on!	2019-07-10 13:32:11.143968	2019-07-10 13:32:11.143968	21	165	Male	Full Member	2019-07-17	\N
816	Lori Lavoie	f	f	t	t	f	f	f	t	What is this tubing thing you speak of? (my old bed in Tyrol pretty please and thank you). 	2019-07-11 00:26:47.352194	2019-07-11 00:27:27.193556	44	165	Female	Associate Member	2019-07-17	\N
817	Matt Beal	f	f	t	t	f	f	f	t	Matt has applied for membership this year. Great guy- get to know him a little if you don't know him already! -Dan	2019-07-11 13:42:02.30205	2019-07-11 13:42:02.30205	20	165	Male	Guest	2019-07-17	\N
818	Chris Villatoro	f	f	t	t	f	f	f	t	Perennial guest and MAYBE we can convince him to join some day. -Dan	2019-07-11 13:43:18.913714	2019-07-11 13:43:18.913714	20	165	Male	Guest	2019-07-17	\N
819	Michelle Philbrick	f	f	t	t	f	f	f	t	Perennial guest. Will probably join if we can ever get Chris V to join. - Dan	2019-07-11 13:44:04.818697	2019-07-11 13:44:04.818697	20	165	Female	Guest	2019-07-17	\N
820	Stephenie Hou	f	f	t	t	f	f	f	t	Volleyballer and friend of Nikki and Dan. Not a membership prospect, but comes to our summer events. - Dan	2019-07-11 13:45:12.513397	2019-07-11 13:45:12.513397	20	165	Female	Guest	2019-07-17	\N
821	Nancy Murphy	f	f	t	t	f	f	f	t	VERY interested in the club. Volleyballer. Wants to join this winter, so this will be one of her two visits. Get to know her! - Dan	2019-07-11 13:46:16.865842	2019-07-11 13:46:16.865842	20	165	Female	Guest	2019-07-17	\N
822	Thushanth Bengre (Ben)	f	f	t	t	f	f	f	t	Volleyballer 2 years running. I believe he's been learning to ski. Nice guy, good membership prospect. 	2019-07-11 13:48:07.124918	2019-07-11 13:48:07.124918	20	165	Male	Guest	2019-07-17	\N
823	Krishna Bykadi	f	f	t	t	f	f	f	t	Volleyballer and friend of Ben. -Dan	2019-07-11 13:51:26.2566	2019-07-11 13:52:08.055629	20	165	Male	Guest	2019-07-17	\N
824	Vicki Santarcangelo	f	t	t	t	f	f	f	f	Tubing	2019-07-12 01:59:20.790265	2019-07-12 01:59:20.790265	3	165	Female	Full Member	2019-07-17	\N
825	Diane Gingras	f	f	t	t	f	f	f	t		2019-07-12 13:12:48.159678	2019-07-12 13:12:48.159678	5	165	Female	Associate Member	2019-07-17	\N
826	Diane G guest	f	f	t	t	f	f	f	t		2019-07-12 13:13:24.06534	2019-07-12 13:13:24.06534	5	165	Female	Guest	2019-07-17	\N
827	Diane G guest #2	f	f	t	t	f	f	f	t		2019-07-12 13:14:01.180878	2019-07-12 13:14:01.180878	5	165	Female	Guest	2019-07-17	\N
828	Diane Gingras guest #3	f	f	t	t	f	f	f	t		2019-07-12 13:15:00.114583	2019-07-12 13:15:00.114583	5	165	Female	Guest	2019-07-17	\N
1374	Chris Bromery	f	t	t	t	f	f	f	f	Birthday Weekend!!	2020-10-20 17:18:12.189233	2020-10-20 17:18:12.189233	15	301	Male	Full Member	2021-03-03	\N
829	Karthik Keshava	f	f	t	t	f	f	f	t	Friend of Ben and Krishna, who play volleyball with us.  - Dan	2019-07-15 02:17:24.689336	2019-07-15 02:29:21.256659	20	165	Male	Guest	2019-07-17	\N
832	Kevin Buckley	f	f	t	t	f	f	f	t		2019-07-15 20:41:33.227984	2019-07-15 20:41:33.227984	33	165	Male	Associate Member	2019-07-17	\N
833	Mirian Barrientos	f	f	t	t	f	f	f	t		2019-07-15 20:42:01.715012	2019-07-15 20:42:01.715012	33	165	Female	Associate Member	2019-07-17	\N
834	Whitney Factor	f	f	t	t	f	f	f	t		2019-07-15 20:42:47.988846	2019-07-15 20:42:47.988846	33	165	Female	Guest	2019-07-17	\N
835	John Dobermiller	f	t	t	t	t	t	t	f	Get your float on!	2019-07-15 20:43:01.550581	2019-07-15 20:43:01.550581	2	165	Male	Full Member	2019-07-17	\N
836	Leah Morgenstern	f	f	t	t	f	f	f	t		2019-07-15 20:44:13.857831	2019-07-15 20:44:13.857831	33	165	Female	Guest	2019-07-17	\N
837	John Dobermiller	t	t	t	t	t	t	t	t	I will  be up prepping for AT Week. I will probably skip out  a night or two near the end of the week for a few days so as not to abuse my privileges.	2019-07-15 20:44:55.169302	2019-07-15 20:44:55.169302	2	199	Male	Full Member	2019-07-24	\N
838	ken simon	f	f	t	t	f	f	f	f	tubing!	2019-07-15 23:22:29.827753	2019-07-15 23:22:29.827753	45	165	Male	Full Member	2019-07-17	\N
839	Ingrid Simon + 1	f	f	t	t	f	f	f	f	Guest of Ken. My niece +1. +1 is a maybe will update ASAP	2019-07-15 23:24:47.460856	2019-07-15 23:24:47.460856	45	165	Female	Guest	2019-07-17	\N
840	Abby Golub	f	f	t	t	f	f	f	t	Volleyballer, and friend of Matt Beal, who has applied for membership this year. - Dan	2019-07-16 13:19:29.027418	2019-07-16 13:20:25.183613	20	165	Female	Guest	2019-07-17	\N
841	Dan Shults	f	f	f	f	t	t	t	t	AT Week!	2019-07-22 14:06:52.461667	2019-07-22 14:06:52.461667	20	199	Male	Full Member	2019-07-24	\N
842	Dan Shults	t	t	t	f	f	f	f	t	AT Week!	2019-07-22 14:07:45.053561	2019-07-22 14:07:45.053561	20	200	Male	Full Member	2019-07-31	\N
844	John D	t	t	t	t	t	f	f	t	AT Week and Attitiash Blueberry Festival.	2019-07-26 16:54:35.296622	2019-07-26 16:54:35.296622	2	200	Male	Full Member	2019-07-31	\N
845	Andrew Blohm	f	f	t	f	f	f	f	t	Going hiking Saturday morning...	2019-07-31 22:35:29.751141	2019-07-31 22:35:29.751141	47	200	Male	Full Member	2019-07-31	\N
846	ken simon	f	f	t	t	f	f	f	f	Would love to play if anyone wants an extra on their team, otherwise I'm happy to be a line judge..	2019-08-03 15:20:06.739545	2019-08-03 15:20:06.739545	45	201	Male	Full Member	2019-08-14	\N
847	Mike Ryan	f	f	t	t	f	f	f	f	Volleyball!!	2019-08-07 13:12:45.342361	2019-08-07 13:12:45.342361	14	201	Male	Full Member	2019-08-14	\N
848	Jess Przywara	f	f	t	t	f	f	f	f	Volleyball Guest, Not playing Beth S bunk please.	2019-08-07 13:13:58.230051	2019-08-07 13:13:58.230051	14	201	Female	Guest	2019-08-14	\N
849	Krishna Bykadi	f	f	t	t	f	f	f	f	VEGETARIAN. Volleyball regular season player. Friend of Ben. Sneha and the gang, who are pretty good membership prospects. Came to tubing.	2019-08-11 16:19:43.545833	2019-08-11 16:19:43.545833	20	201	Male	Guest	2019-08-14	\N
850	Thushanth Bengre (Ben)	f	f	t	t	f	f	f	f	Second year playing Vball with us. Has been learning to ski. Good dude and a membership prospect. Likes to invite friends too-- get to know him!	2019-08-11 16:21:41.867745	2019-08-11 16:21:41.867745	20	201	Male	Guest	2019-08-14	\N
851	Stephenie Hou	f	f	t	t	f	f	f	f	Friend and coworker of Nikki. Not a membership prospect, but attends our summer events. 	2019-08-11 16:22:43.12801	2019-08-11 16:22:48.827122	20	201	Female	Guest	2019-08-14	\N
852	Michelle Philbrick	f	f	t	t	f	f	f	f	Perennial guest and returning player. Would love for her and Chris V to join some day, but have stopped pressuring them at this point :P	2019-08-11 16:24:22.403839	2019-08-11 16:24:22.403839	20	201	Female	Guest	2019-08-14	\N
853	Chris Villatoro	f	f	t	t	f	f	f	f	Perennial guest and returning player. Would love for him and Michelle P to join some day, but have stopped pressuring them at this point :P	2019-08-11 16:25:13.385265	2019-08-11 16:25:13.385265	20	201	Male	Guest	2019-08-14	\N
854	Mansi Raghuwanshi	f	f	t	t	f	f	f	f	VEGETARIAN. PAYING ON ARRIVAL. Rolls with our Indian friends. I have not met her yet.	2019-08-11 16:27:11.54041	2019-08-11 16:27:16.256567	20	201	Female	Guest	2019-08-14	\N
1376	Andrew Blohm	f	f	t	t	f	f	f	t	Registering on Andrew's behalf since his account is acting up. -DS	2020-11-02 13:11:53.338941	2020-11-02 13:11:53.338941	20	302	Male	Full Member	2020-11-11	\N
1416	Michelle Comtois	f	t	t	t	f	f	f	t		2020-11-16 20:25:37.131217	2020-11-16 20:25:37.131217	5	305	Female	Full Member	2020-12-30	\N
1424	Matt	f	f	f	t	t	f	f	t		2020-11-22 16:48:58.477779	2020-11-22 16:48:58.477779	50	308	Male	Full Member	2021-04-28	\N
1425	Mike Ryan	f	t	t	t	f	f	f	t	Let's get this party started!!!!!	2020-12-04 17:22:38.807778	2020-12-04 17:22:38.807778	14	298	Male	Full Member	2020-12-09	\N
1426	Mike Ryan	f	f	t	t	f	f	f	t		2020-12-04 17:28:54.132574	2020-12-04 17:28:54.132574	14	309	Male	Full Member	2020-12-16	\N
1427	Mike Ryan	f	f	f	t	t	t	t	t		2020-12-04 17:29:55.762723	2020-12-04 17:29:55.762723	14	307	Male	Full Member	2020-12-23	\N
1428	Mike Ryan	t	t	t	t	f	f	f	t		2020-12-04 17:30:41.181331	2020-12-04 17:30:41.181331	14	305	Male	Full Member	2020-12-30	\N
1429	Andrew Blohm	f	f	t	t	t	f	f	t		2020-12-06 05:43:56.021249	2020-12-06 05:43:56.021249	142	298	Male	Full Member	2020-12-09	\N
1430	Dan Shults	f	t	t	f	f	f	f	t	Planning to ski Fri and Sat and probably return home Sat evening.	2020-12-07 01:58:00.526277	2020-12-09 14:18:43.880463	20	298	Male	Full Member	2020-12-09	\N
1437	Chris Bromery	f	f	t	t	f	f	f	t	Post-New Year Weekend	2020-12-13 19:16:39.977656	2020-12-13 19:16:39.977656	15	305	Male	Full Member	2020-12-30	4JA495311Y5894529
1439	Milan Thakker	f	f	t	t	f	f	f	t		2020-12-17 14:19:49.94376	2020-12-17 14:19:49.94376	140	309	Male	Full Member	2020-12-16	7XK40440F2244133M
1440	Andrew Blohm	t	t	f	f	f	f	f	t		2020-12-17 21:23:44.102445	2020-12-17 21:23:44.102445	142	307	Male	Full Member	2020-12-23	7EK58721LN0053145
1443	Nikki Shults	f	t	t	t	f	f	f	t	Skip day	2021-01-01 01:12:52.445785	2021-01-01 01:12:52.445785	9	299	Female	Full Member	2021-01-06	5UT03894CA156150B
1445	Tom Wall	f	f	t	t	f	f	f	t		2021-01-06 22:39:29.095985	2021-01-06 22:39:29.095985	21	299	Male	Full Member	2021-01-06	2AJ69788RF439914X
1446	Alana McCartgy	f	f	t	t	f	f	f	t		2021-01-06 23:04:00.578739	2021-01-06 23:04:00.578739	23	299	Female	Full Member	2021-01-06	5E874780VV040332E
1448	Keith Metayer	f	f	t	f	f	f	f	t	Staying Friday night.  Guest of Andrew Blohm	2021-01-08 22:25:58.999764	2021-01-08 22:25:58.999764	142	311	Male	Guest	2021-01-13	71S15136WC207800Y
1452	Chris Bromery	f	f	t	t	f	f	f	t		2021-01-19 17:51:06.825796	2021-01-19 17:51:06.825796	15	310	Male	Full Member	2021-01-20	9A368073FD5061034
1453	Dan Shults	f	t	t	f	f	f	f	t	Planning to ski Wildcat Friday and maaaaaybe go to Sunapee or something on Sat? Not sure yet. 	2021-01-19 20:13:31.263127	2021-01-19 20:13:31.263127	20	310	Male	Full Member	2021-01-20	1YE044097F8144936
1455	Mike Ryan	f	f	t	t	t	t	f	t		2021-01-27 16:27:20.221756	2021-01-27 16:27:20.221756	14	312	Male	Full Member	2021-01-27	61S03677BB629131J
1456	Nikki  Shults	f	f	t	t	f	f	f	t	"Ullr" Weekend nightly fee	2021-02-01 16:49:31.318475	2021-02-01 16:49:31.318475	9	300	Female	Full Member	2021-02-03	6U127230UA552684M
1457	Dan Shults	f	f	t	t	f	f	f	t	It snows, I ski.	2021-02-01 23:42:03.901549	2021-02-01 23:42:03.901549	20	300	Male	Full Member	2021-02-03	68542179T32927022
1458	Andrew Blohm	f	f	t	f	f	f	f	t	staying Friday night with guest Cameron Cooper	2021-02-02 13:32:02.089403	2021-02-02 13:32:02.089403	142	300	Male	Full Member	2021-02-03	2P5100481R0856258
1459	Cameron Cooper	f	f	t	f	f	f	f	t	staying Friday night with Andrew Blohm.  Cameron is a co-worker of mine.	2021-02-02 13:34:06.858529	2021-02-02 13:34:06.858529	142	300	Male	Guest	2021-02-03	1NF73821WP5364341
1460	Jessica P	f	f	t	t	t	f	f	t	snow, ski, super bowl....oh my! 	2021-02-03 16:59:48.890781	2021-02-03 16:59:48.890781	137	300	Female	Full Member	2021-02-03	7N719486Y6381220E
1461	Mike Ryan	t	t	t	t	t	f	f	t		2021-02-03 17:16:52.964306	2021-02-03 17:16:52.964306	14	300	Male	Full Member	2021-02-03	1TR25539NS8714145
1462	Perry Frink	f	f	t	t	f	f	f	t	Prospective member. Met Andrew on the lift at Wildcat, emailed us, and has been talking to me for a few weeks. Seems very interested. I've briefed him on our covid policies. - Dan	2021-02-04 00:05:44.070549	2021-02-04 00:05:44.070549	20	300	Male	Guest	2021-02-03	32C55053EG777064V
1463	Mike Ryan	f	f	t	t	t	t	t	t	school vacation week	2021-02-08 15:08:15.822314	2021-02-08 15:08:15.822314	14	313	Male	Full Member	2021-02-10	21B66991W6817391G
1464	Mike Ryan	t	t	t	t	t	f	f	t	School Vacation week	2021-02-08 15:09:08.107226	2021-02-08 15:09:08.107226	14	314	Male	Full Member	2021-02-17	3FG1375128521035B
1465	Andrew Blohm	f	f	f	f	t	f	f	t	staying sunday night	2021-02-09 03:50:03.290908	2021-02-09 03:50:03.290908	142	313	Male	Full Member	2021-02-10	2MT79324Y2060540U
1466	Andrew Blohm	f	f	t	f	f	f	f	t	Friday night	2021-02-14 23:16:50.116652	2021-02-14 23:16:50.116652	142	314	Male	Full Member	2021-02-17	2T917411JY4454435
1467	Chris Bromery	f	f	t	t	f	f	f	t		2021-02-16 01:12:39.8814	2021-02-16 01:12:39.8814	15	314	Male	Full Member	2021-02-17	2CA74644FU377494D
1468	Michelle Comtois	f	f	t	t	f	f	f	t		2021-02-16 01:21:42.602062	2021-02-16 01:21:42.602062	5	314	Female	Full Member	2021-02-17	38A015554U2268721
1469	John D	f	f	f	t	t	f	f	t		2021-02-16 23:32:26.467857	2021-02-16 23:32:26.467857	2	314	Male	Full Member	2021-02-17	19J2484686792900A
1470	Alana Mccarthy 	f	f	t	t	f	f	f	t		2021-02-17 14:53:30.074384	2021-02-17 14:53:30.074384	23	314	Female	Full Member	2021-02-17	4WF60259NC606523W
1471	John D	f	f	t	t	f	f	f	t		2021-02-24 12:54:32.069463	2021-02-24 12:54:32.069463	2	315	Male	Full Member	2021-02-24	78D28686RD325223G
1472	Vicki Santarcangelo	f	t	t	t	f	f	f	t	Woo	2021-02-24 16:31:02.151864	2021-02-24 16:31:02.151864	3	315	Female	Full Member	2021-02-24	4H882805H6689884Y
1473	Andrew Blohm	f	f	t	t	f	f	f	t		2021-02-24 21:39:46.445631	2021-02-24 21:39:46.445631	142	315	Male	Full Member	2021-02-24	4P3490401U789924L
1474	Mike Ryan	f	f	t	t	t	f	f	t		2021-02-25 00:31:09.561844	2021-02-25 00:31:09.561844	14	315	Male	Full Member	2021-02-24	0NB97229TJ660842X
1475	Dan Shults	f	f	t	t	f	f	f	t		2021-02-26 16:21:07.687709	2021-02-26 16:21:07.687709	20	301	Male	Full Member	2021-03-03	6F590137DH564430Y
1476	Michelle Comtois	f	t	t	t	f	f	f	t		2021-03-01 15:51:58.788465	2021-03-01 15:51:58.788465	5	301	Female	Full Member	2021-03-03	6RS38268FU2617139
1477	LORI LAVOIE	f	t	t	t	f	f	f	t	I may also stay Sun/Mon. I'll pay addition if I do.	2021-03-01 21:37:45.245168	2021-03-01 21:37:45.245168	44	301	Female	Associate Member	2021-03-03	40X78177Y3073633V
1478	Alana Mccarthy 	f	t	t	t	f	f	f	t	Birthday weekend! (Tommy’s not mine!)	2021-03-01 22:25:19.751376	2021-03-01 22:25:19.751376	23	301	Female	Full Member	2021-03-03	8090314463510505X
1479	T-Wall	f	t	t	t	f	f	f	t	Aaaaayooooooo!	2021-03-02 00:14:25.732654	2021-03-02 00:14:25.732654	21	301	Male	Full Member	2021-03-03	266524429Y4070836
1481	Joel	f	f	f	t	f	f	f	t	Jackie's Boy Friend	2021-03-02 13:07:34.268055	2021-03-02 13:07:34.268055	14	301	Male	Guest	2021-03-03	8B672554Y52707309
1482	Jackie Schbeider	f	f	f	t	f	f	f	t	Mike's Cousin	2021-03-02 13:10:43.573175	2021-03-02 13:10:43.573175	14	301	Female	Guest	2021-03-03	65W199710T328032Y
1483	Mike Ryan	f	f	t	t	f	f	f	t		2021-03-02 13:13:02.913627	2021-03-02 13:13:02.913627	14	301	Male	Full Member	2021-03-03	0E121137NC288081S
1484	Jessica P	t	t	t	t	f	f	f	t	staying Thu, Fri, Sat, but paying an extra night as I extended my stay 1 night on 2/21/2021	2021-03-02 13:49:07.305755	2021-03-02 13:49:07.305755	137	301	Female	Full Member	2021-03-03	6E490780XX155270A
1485	Nikki Shults	f	f	t	t	f	f	f	t	March 6 weekend fees	2021-03-02 13:55:02.242294	2021-03-02 13:55:02.242294	9	301	Female	Full Member	2021-03-03	57P784404J7283935
1486	Andrew Blohm	f	f	f	f	f	f	t	t		2021-03-02 15:20:30.793027	2021-03-02 15:20:30.793027	142	301	Male	Full Member	2021-03-03	65G59391DF9352101
1487	Murray Wan	f	f	t	t	f	f	f	t	Nikki and Dan's neighbor. Newer skier. Nice guy. 	2021-03-02 19:29:46.178736	2021-03-02 19:29:46.178736	20	301	Male	Guest	2021-03-03	26L642610R149223G
1489	John	f	f	f	t	t	t	t	t		2021-03-15 14:02:39.899611	2021-03-15 14:02:39.899611	2	316	Male	Full Member	2021-03-17	67596869817981133
855	Nancy Murphy	f	f	t	t	f	f	f	f	Nancy has applied for membership, and this will be her second visit to the club. Get to know her!	2019-08-11 16:28:07.783157	2019-08-11 16:28:07.783157	20	201	Female	Guest	2019-08-14	\N
856	David Hsieh	f	f	t	t	f	f	f	f	First year vball player, and first time up at the club!	2019-08-11 16:29:05.406958	2019-08-11 16:29:05.406958	20	201	Male	Guest	2019-08-14	\N
857	Meaghan Sydlowski	f	f	t	t	f	f	f	f	Meaghan is a friend and her father and uncle were Bretts years ago! She came skiing once last year. Strong membership prospect if her work situation calms down (she spends a lot of time abroad). Get to know her!	2019-08-11 16:31:31.053533	2019-08-11 16:31:31.053533	20	201	Female	Guest	2019-08-14	\N
858	Karthik Keshava	f	f	t	t	f	f	f	f	VEGETARIAN. PAYING ON ARRIVAL. Friend of Ben, Sneha and the gang. Not a regular season player, but came to tubing. Nice guy!	2019-08-11 16:32:49.859883	2019-08-11 16:32:49.859883	20	201	Male	Guest	2019-08-14	\N
859	Charles Oh	f	f	t	t	f	f	f	f	Regular season player. This will be his first visit to the club.	2019-08-11 16:33:30.648771	2019-08-11 16:33:30.648771	20	201	Male	Guest	2019-08-14	\N
860	Akshata Baskar (AK)	f	f	t	t	f	f	f	f	VEGETARIAN. Second year volleyballer. Could be a membership prospect- get to know her!	2019-08-11 16:36:32.697388	2019-08-11 16:36:32.697388	20	201	Female	Guest	2019-08-14	\N
861	Paula Kekes Aal	f	f	t	t	f	f	f	f	First time up at the club. 	2019-08-12 00:37:30.117306	2019-08-12 00:37:30.117306	20	201	Female	Guest	2019-08-14	\N
862	MJ Nova	f	f	t	t	f	f	f	f	First year vballer. First time up at the club.	2019-08-12 12:52:18.512727	2019-08-12 12:52:18.512727	20	201	Female	Guest	2019-08-14	\N
863	Vicki Santarcangelo 	f	t	t	t	f	f	f	f	Volleyball 	2019-08-12 14:13:38.646093	2019-08-12 14:13:38.646093	3	201	Female	Full Member	2019-08-14	\N
864	Jyothi Prasad Nama Mahesh (JP)	f	f	t	t	f	f	f	f	VEGETARIAN. PAY ON ARRIVAL. JP played with us last year, and came up for the tournament. He did not play regular season this year, but wants to come to the tournament. Rolls with our Indian friends. Nice guy!	2019-08-12 15:24:45.839002	2019-08-12 15:24:45.839002	20	201	Male	Guest	2019-08-14	\N
865	Rakesh Nittur	f	f	t	t	f	f	f	f	VEGETARIAN. PAYING ON ARRIVAL. Don't know him, but is a friend of the Indian gang. 	2019-08-12 15:56:24.846204	2019-08-12 15:56:24.846204	20	201	Male	Guest	2019-08-14	\N
866	Stephen Tanner	f	f	t	t	f	f	f	f	OWES $40 ON ARRIVAL. Returning player from last year. A bit odd, and not a membership prospect, but harmless. 	2019-08-12 15:58:55.623075	2019-08-12 15:58:55.623075	20	201	Male	Guest	2019-08-14	\N
867	Nikki Shults	f	f	t	t	f	f	f	f	Nikki, I signed you up. -Dan	2019-08-12 18:32:49.590216	2019-08-12 18:32:49.590216	20	201	Female	Full Member	2019-08-14	\N
843	Dan Shults	f	f	t	t	f	f	f	f	Volley ballin' outta control	2019-07-25 20:19:09.96083	2019-08-12 18:33:08.486855	20	201	Male	Full Member	2019-08-14	\N
868	John D	f	f	t	t	f	f	f	t	Vic and I will be up as cheerleaders for volleyball, but won't be playing Thanks for the offer of dinner, but I don't think I can eat another hamburger.	2019-08-12 21:31:26.342186	2019-08-12 21:31:26.342186	2	201	Male	Full Member	2019-08-14	\N
901	John D	t	t	t	t	t	t	f	t	Labor Day getaway!	2019-08-21 16:32:48.612115	2019-08-21 16:32:48.612115	2	202	Male	Full Member	2019-08-28	\N
903	John	f	t	t	t	t	t	t	t	Jen’s Friends Cancer Cancer Walk at Cranmore	2019-09-08 15:00:42.783096	2019-09-08 15:00:42.783096	2	204	Male	Full Member	2019-09-11	\N
904	John	t	t	t	t	t	f	f	t		2019-09-08 15:01:27.900694	2019-09-08 15:01:27.900694	2	205	Male	Full Member	2019-09-18	\N
908	Nikki S	f	f	t	t	f	f	f	t	Work Weekend and interested in the Halloween party	2019-09-25 14:52:14.377779	2019-09-25 14:52:14.377779	9	207	Female	Full Member	2019-10-23	\N
909	Nikki S	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 14:52:55.50158	2019-09-25 14:52:55.50158	9	208	Female	Full Member	2019-10-09	\N
910	Alissa Binford	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 14:53:27.439686	2019-09-25 14:53:27.439686	9	208	Female	Guest	2019-10-09	\N
911	Jaret Binford	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 14:58:17.165357	2019-09-25 14:58:17.165357	9	208	Male	Guest	2019-10-09	\N
912	Michelle Philbrick	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 14:58:39.354877	2019-09-25 14:58:39.354877	9	208	Female	Guest	2019-10-09	\N
913	Chris Villatoro	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 14:58:59.489095	2019-09-25 14:58:59.489095	9	208	Male	Guest	2019-10-09	\N
914	Sher Vogel	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 14:59:17.026108	2019-09-25 14:59:17.026108	9	208	Female	Guest	2019-10-09	\N
915	Bryan Cramer	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 14:59:33.864544	2019-09-25 14:59:33.864544	9	208	Male	Guest	2019-10-09	\N
916	Mark McKevitz	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 14:59:55.337687	2019-09-25 14:59:55.337687	9	208	Male	Guest	2019-10-09	\N
917	Veronica Triana	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 15:00:15.486976	2019-09-25 15:00:15.486976	9	208	Female	Guest	2019-10-09	\N
918	Chris Miner	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 15:00:55.138558	2019-09-25 15:00:55.138558	9	208	Male	Guest	2019-10-09	\N
919	Jess Miner	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 15:01:10.772244	2019-09-25 15:01:10.772244	9	208	Female	Guest	2019-10-09	\N
920	Dan S	f	f	t	t	t	f	f	t	Nikki's peace corps reunion. And maybe fiddlers	2019-09-25 15:06:30.987916	2019-09-25 15:06:30.987916	9	208	Male	Guest	2019-10-09	\N
921	Dan Shults	f	f	t	t	f	f	f	t	Work it! Also Halloween party.	2019-09-25 17:58:12.58959	2019-09-25 17:58:12.58959	20	207	Male	Full Member	2019-10-23	\N
922	Michelle Comtois	f	f	t	t	f	f	f	t		2019-09-25 20:57:41.288935	2019-09-25 20:57:41.288935	5	207	Female	Full Member	2019-10-23	\N
955	Mike Ryan	f	f	t	t	t	f	f	t	Motorcycle 	2019-09-26 15:16:53.78355	2019-09-26 15:16:53.78355	14	208	Male	Full Member	2019-10-09	\N
959	Jess Przywara	f	f	f	t	t	f	f	t	Beth's bed if availably please. 	2019-09-26 15:21:22.949871	2019-09-26 15:21:22.949871	14	208	Female	Guest	2019-10-09	\N
961	Michelle Comtois	f	f	t	t	t	f	f	t		2019-10-03 19:41:43.968581	2019-10-03 19:41:43.968581	5	208	Female	Full Member	2019-10-09	\N
962	Michelle Comtois	f	f	t	t	f	f	f	t		2019-10-03 19:42:14.400125	2019-10-03 19:42:14.400125	5	207	Female	Full Member	2019-10-23	\N
958	Joe	f	f	t	t	f	f	f	t	Motorcycle - If Availably in  North Face Please	2019-09-26 15:20:20.209558	2019-09-26 19:41:04.641515	14	208	Male	Guest	2019-10-09	\N
957	Nick	f	f	t	t	f	f	f	t	Motorcycle - If Availably in  North Face Please	2019-09-26 15:19:59.295121	2019-09-26 19:41:23.018022	14	208	Male	Guest	2019-10-09	\N
956	Halpin	f	f	t	t	f	f	f	t	Motorcycle - If Availably in  North Face Please	2019-09-26 15:19:01.514924	2019-09-26 19:41:38.432069	14	208	Male	Guest	2019-10-09	\N
960	Nancy Murphy	f	f	t	t	t	f	f	t	Clean-up weekend	2019-10-02 14:50:24.312768	2019-10-02 14:50:24.312768	51	207	Female	Full Member	2019-10-23	\N
963	John D	f	t	t	t	t	f	f	t		2019-10-07 14:19:41.734232	2019-10-07 14:19:41.734232	2	208	Male	Full Member	2019-10-09	\N
964	Diane Gingras	f	f	t	t	f	f	f	t		2019-10-07 14:32:40.154809	2019-10-07 14:32:40.154809	20	208	Female	Associate Member	2019-10-09	\N
965	Diane Colligan	f	f	t	t	f	f	f	t	Guest of Diane G	2019-10-07 14:33:22.861957	2019-10-07 14:33:22.861957	20	208	Female	Guest	2019-10-09	\N
967	Milagros Simon	f	f	t	t	t	f	f	t	Guest of Ken	2019-10-08 23:04:47.068281	2019-10-09 14:23:16.853784	45	208	Female	Guest	2019-10-09	\N
968	Matthew Beal	f	f	t	t	f	f	f	f	Dinner on saturday, not friday	2019-10-15 19:05:44.115547	2019-10-15 19:05:44.115547	50	207	Male	Full Member	2019-10-23	\N
966	ken simon	f	f	t	t	t	f	f	t		2019-10-08 23:03:13.207952	2019-10-09 14:22:51.607613	45	208	Male	Full Member	2019-10-09	\N
1417	Jessica P	f	t	t	t	f	f	f	t		2020-11-17 12:38:15.290172	2020-11-17 12:38:15.290172	137	298	Female	Full Member	2020-12-09	\N
1418	Jessica P	t	t	t	t	f	f	f	t		2020-11-17 12:43:46.339371	2020-11-17 12:43:46.339371	137	305	Female	Full Member	2020-12-30	\N
1449	Jessica P	f	f	f	t	t	f	f	t		2021-01-14 00:40:35.071346	2021-01-14 00:40:35.071346	137	311	Female	Full Member	2021-01-13	7ED906515J2796216
969	Chris Bromery	f	f	t	t	f	f	f	t	Work weekend!!!	2019-10-15 19:45:57.78784	2019-10-15 19:45:57.78784	15	207	Male	Full Member	2019-10-23	\N
970	Mike Ryan	f	f	t	t	f	f	f	t	Not full Work weekend - Have to go to Wildcat for pre-season paper work.	2019-10-16 18:57:46.124786	2019-10-16 18:57:46.124786	14	207	Male	Full Member	2019-10-23	\N
971	Chris	f	f	t	t	f	f	f	t		2019-10-19 20:04:17.331708	2019-10-19 20:04:17.331708	1	207	Male	Full Member	2019-10-23	\N
972	Amy	f	f	t	t	f	f	f	t		2019-10-19 20:04:43.830034	2019-10-19 20:04:43.830034	1	207	Female	Full Member	2019-10-23	\N
973	Andrew Blohm 	f	f	t	t	t	f	f	t	Work weekend 	2019-10-21 16:31:10.097288	2019-10-21 16:31:10.097288	47	207	Male	Full Member	2019-10-23	\N
974	Alana McCarthy 	f	f	f	t	t	f	f	t	Work weekend	2019-10-22 23:30:27.783116	2019-10-22 23:30:27.783116	23	207	Female	Full Member	2019-10-23	\N
975	Vicki Santarcangelo	f	f	t	t	f	f	f	t	Work Weekend	2019-10-23 15:09:04.448762	2019-10-23 15:09:04.448762	3	207	Female	Full Member	2019-10-23	\N
976	John Dobermiller	f	f	t	t	f	f	f	t	Work Weekend	2019-10-23 15:09:35.339872	2019-10-23 15:09:35.339872	3	207	Male	Full Member	2019-10-23	\N
977	Tommy wall	f	f	f	t	t	f	f	t	Work	2019-10-23 19:02:28.325591	2019-10-23 19:02:28.325591	23	207	Male	Full Member	2019-10-23	\N
1379	Michelle Comtois	f	f	t	t	f	f	f	t		2020-11-06 17:57:36.471554	2020-11-06 17:57:36.471554	5	298	Female	Full Member	2020-12-09	\N
1012	Nancy Murphy	f	t	t	t	f	f	f	t		2019-11-06 14:04:31.434508	2019-11-06 14:04:31.434508	51	243	Female	Full Member	2019-11-20	\N
1419	Milan Thakker	f	t	t	t	f	f	f	t	In for house dinner if we're having one!	2020-11-17 20:31:11.468234	2020-11-17 20:31:11.468234	140	298	Male	Full Member	2020-12-09	\N
1014	Nancy Murphy	f	t	t	t	t	t	f	t		2019-11-06 14:06:22.680941	2019-11-06 14:06:22.680941	51	244	Female	Full Member	2019-12-18	\N
1450	Mike Ryan	f	f	t	t	t	f	f	t		2021-01-14 00:40:46.963658	2021-01-14 00:40:46.963658	14	311	Male	Full Member	2021-01-13	9A161042LC3751432
1017	Nung	f	f	t	t	f	f	f	t	Work weekend!!!	2019-11-07 15:35:13.120503	2019-11-07 15:35:13.120503	7	243	Male	Full Member	2019-11-20	\N
1454	Andrew Blohm	f	f	f	t	f	f	f	t	Staying Saturday night	2021-01-27 01:22:36.691381	2021-01-27 01:22:36.691381	142	312	Male	Full Member	2021-01-27	5L6578662A250330U
1021	Mike Ryan	f	f	t	t	f	f	f	t		2019-11-07 20:39:53.511982	2019-11-07 20:39:53.511982	14	246	Male	Full Member	2019-12-04	\N
1022	Mike Ryan	f	f	t	t	f	f	f	f		2019-11-07 20:40:20.856121	2019-11-07 20:40:20.856121	14	242	Male	Full Member	2019-12-11	\N
1023	Jess Przywara	f	f	t	t	f	f	f	f	Beth's bed if open please. 	2019-11-07 20:41:07.496871	2019-11-07 20:41:07.496871	14	242	Female	Guest	2019-12-11	\N
1024	Mike Ryan	f	f	t	t	f	f	f	t		2019-11-07 20:41:41.97728	2019-11-07 20:41:41.97728	14	244	Male	Full Member	2019-12-18	\N
1025	Mike Ryan	f	f	t	t	t	t	t	t		2019-11-07 20:42:26.732579	2019-11-07 20:42:26.732579	14	247	Male	Full Member	2019-12-25	\N
1088	ken simon	f	f	t	t	f	f	f	t	wildcat	2019-11-27 13:34:16.852136	2019-11-27 13:36:47.925233	45	246	Male	Full Member	2019-12-04	\N
1030	Kevin Buckley	f	f	f	t	f	f	f	t		2019-11-11 16:26:12.109383	2019-11-11 16:26:12.109383	33	249	Male	Associate Member	2019-11-13	\N
1031	Mirian Barrientos	f	f	f	t	f	f	f	t		2019-11-11 16:26:41.952346	2019-11-11 16:26:41.952346	33	249	Female	Associate Member	2019-11-13	\N
1032	Chris Bromery	f	f	t	t	f	f	f	t	Best Weekend!!!	2019-11-13 00:35:38.883519	2019-11-13 00:35:38.883519	15	242	Male	Full Member	2019-12-11	\N
1033	T Wall	f	f	t	t	f	f	f	f		2019-11-13 10:14:41.625852	2019-11-13 10:14:41.625852	21	242	Male	Full Member	2019-12-11	\N
1034	Michelle Comtois	f	f	t	t	f	f	f	t		2019-11-13 18:12:49.210031	2019-11-13 18:12:49.210031	5	242	Female	Full Member	2019-12-11	\N
1027	David Hsieh	f	f	t	t	f	f	f	f	2019 Volleyballer- has expressed interest in the club before. . - DS	2019-11-08 21:05:45.107267	2019-11-14 02:41:36.18968	20	242	Male	Guest	2019-12-11	\N
1028	Brandon Boyle	f	f	t	t	f	f	f	f	Sourced from an EICSL inquiry. Middle aged guy with a family, but looking to come up and ski by himself regularly. - DS	2019-11-09 02:42:15.794791	2019-11-14 14:20:07.960918	20	242	Male	Guest	2019-12-11	\N
1011	Kevin Smith	f	f	t	t	f	f	f	f	New prospect from reddit.com/r/icecoast outreach. - DS	2019-11-05 22:11:41.263041	2019-11-14 14:20:22.786935	20	242	Male	Guest	2019-12-11	\N
1036	Dan Shults	f	f	t	t	f	f	f	t	Work Weekend? Skiing? Maybe a bit of each?	2019-11-14 14:34:01.274218	2019-11-14 14:34:01.274218	20	243	Male	Full Member	2019-11-20	\N
1037	Alana McCarthy 	f	f	t	t	t	f	f	f	Best!	2019-11-14 23:37:10.063301	2019-11-14 23:37:10.063301	23	242	Female	Full Member	2019-12-11	\N
1039	Vicki Santarcangelo	f	f	t	t	f	f	f	f	My FIRST BEST WEEKEND! (Sad, I know.)	2019-11-16 03:11:49.570166	2019-11-16 03:11:49.570166	3	242	Female	Full Member	2019-12-11	\N
1040	Sara Delaney	f	f	t	t	t	f	f	t	First Aid	2019-11-18 15:01:22.279985	2019-11-18 15:01:22.279985	31	248	Female	Associate Member	2020-01-01	\N
1026	Dan Shults	f	t	t	t	f	f	f	f	BESTEST WEEKEND!	2019-11-08 16:17:48.943549	2019-11-18 19:51:09.867603	20	242	Male	Full Member	2019-12-11	\N
1042	William Hoyt	f	f	t	t	f	f	f	f	Dropped by with his wife Beth for a quick tour over the summer. First overnight visit. -DS	2019-11-20 21:58:48.662722	2019-11-20 21:59:01.338486	20	242	Male	Guest	2019-12-11	\N
1038	Kelsey Miller	f	f	t	t	f	f	f	f	Sourced from reddit.com/r/icecoast. -DS	2019-11-15 02:07:35.607487	2019-11-20 21:59:17.841737	20	242	Female	Guest	2019-12-11	\N
1043	Beth Liakos	f	f	t	t	f	f	f	f	Dropped by with her Husband William for a quick tour over the summer. First overnight visit. -DS	2019-11-21 14:28:14.795958	2019-11-21 14:28:14.795958	20	242	Female	Guest	2019-12-11	\N
1046	Nancy Murphy	f	t	t	t	t	f	f	t		2019-11-22 23:26:48.139013	2019-11-22 23:26:48.139013	51	241	Female	Full Member	2019-11-27	\N
1047	Mark Buckley	f	f	t	t	f	f	f	f		2019-11-23 19:09:35.782418	2019-11-23 19:09:35.782418	22	242	Male	Full Member	2019-12-11	\N
1048	Hiliary Buckley	f	f	t	t	f	f	f	f		2019-11-23 19:10:30.053895	2019-11-23 19:10:30.053895	22	242	Female	Guest	2019-12-11	\N
1080	Alana McCarthy 	f	f	f	t	t	f	f	t		2019-11-25 18:43:06.115322	2019-11-25 18:43:06.115322	23	241	Female	Full Member	2019-11-27	\N
1081	Dan Shults	f	f	t	t	f	f	f	t	Hiding from the "Girls Weekend" going down at my house this weekend. Going to Wildcat and/or somewhere Ikon. 	2019-11-25 19:14:20.555265	2019-11-25 19:14:20.555265	20	246	Male	Full Member	2019-12-04	\N
1082	Kevin Holowaty	f	f	t	t	f	f	f	f	Friends of ours! -DS	2019-11-26 00:49:39.709475	2019-11-26 00:49:39.709475	20	242	Male	Guest	2019-12-11	\N
1084	Nikki Shults	f	t	t	t	f	f	f	f	I forgot to register myself,  so my fabulous husband is doing it for me.	2019-11-26 00:52:38.549226	2019-11-26 00:52:38.549226	20	242	Female	Full Member	2019-12-11	\N
1085	Milan Thakker	f	f	t	t	f	f	f	t	First time visitor! Sourced from reddit.com/r/icecoast - DS	2019-11-26 17:55:50.73451	2019-11-26 17:55:50.73451	20	246	Male	Guest	2019-12-04	\N
1083	Shannon "Ellie" Slota	f	f	t	t	f	f	f	f	VEGETARIAN. Friends of ours! -DS	2019-11-26 00:51:12.51978	2019-11-26 19:11:23.513759	20	242	Female	Guest	2019-12-11	\N
1086	Thushanth Bengre	f	f	t	t	f	f	f	f	Ben has played volleyball with us for the past 2 years, and came to tubing this summer as well. This will be his first winter visit. Strong prospect- get to know him! -DS	2019-11-26 19:26:18.475985	2019-11-26 19:26:18.475985	20	242	Male	Guest	2019-12-11	\N
1087	Prajwal Shravanabelagola	f	f	t	t	f	f	f	f	VEGETARIAN. A friend of Thushanth (Ben). First time at the club. - DS	2019-11-26 19:28:54.928991	2019-11-27 16:03:21.313643	20	242	Male	Guest	2019-12-11	\N
1090	ken simon	f	f	t	t	f	f	f	f		2019-12-02 16:47:23.274805	2019-12-02 16:47:23.274805	45	242	Male	Full Member	2019-12-11	\N
1091	Jess Przywara	f	f	f	f	t	t	t	t	Beth's S Bed if open please. 	2019-12-03 16:34:18.889131	2019-12-03 16:34:18.889131	14	247	Female	Guest	2019-12-25	\N
1093	Nancy Murphy	f	f	t	f	f	f	f	t		2019-12-03 21:06:09.398149	2019-12-24 00:01:40.809661	51	247	Female	Full Member	2019-12-25	\N
1041	Nancy Murphy	f	f	t	f	f	f	f	t		2019-11-18 23:49:22.678073	2019-12-27 13:33:31.985687	51	252	Female	Full Member	2020-01-08	\N
1149	Kevin Buckley	f	f	t	t	f	f	f	t		2019-12-29 23:05:17.329026	2019-12-29 23:05:17.329026	33	248	Male	Associate Member	2020-01-01	\N
1092	John D	f	t	t	t	t	f	f	t	Who keeps deleting my reservations? Are you trying to tell me something?	2019-12-03 20:27:25.64687	2019-12-03 20:27:25.64687	2	242	Male	Full Member	2019-12-11	\N
1094	Jyothi Prasad Nama Mahesh (JP)	f	f	t	t	f	f	f	f	VEGETARIAN.  JP has played volleyball with us and been up to the house for the tournament twice. He has been learning to ski over the past season or two. Good guy-- get to know him!	2019-12-03 21:10:56.365334	2019-12-03 21:10:56.365334	20	242	Male	Guest	2019-12-11	\N
1095	Doug mayo	f	f	t	t	f	f	f	t		2019-12-04 23:53:39.814675	2019-12-04 23:53:39.814675	12	246	Male	Full Member	2019-12-04	\N
1096	Megan Mccauley 	f	f	t	t	f	f	f	t		2019-12-04 23:54:05.522364	2019-12-04 23:54:05.522364	12	246	Female	Full Member	2019-12-04	\N
1097	Doug mayo	f	f	f	t	f	f	f	t	Will be up at night for hang out and ski sunday	2019-12-04 23:55:15.096223	2019-12-04 23:55:15.096223	12	242	Male	Full Member	2019-12-11	\N
1098	Megan Mccauley 	f	f	f	t	f	f	f	t	Ditto as Doug 	2019-12-04 23:55:53.6406	2019-12-04 23:55:53.6406	12	242	Female	Full Member	2019-12-11	\N
1099	Doug mayo	f	f	t	t	f	f	f	t		2019-12-04 23:56:20.497506	2019-12-04 23:56:20.497506	12	244	Male	Full Member	2019-12-18	\N
1100	Kevin Buckley	f	f	t	t	f	f	f	t		2019-12-05 01:23:32.423835	2019-12-05 01:23:32.423835	33	242	Male	Associate Member	2019-12-11	\N
3141	B. Halpin	f	f	t	t	f	f	f	f		2023-12-03 18:50:28.668465	2023-12-03 18:50:28.668465	14	532	Male	Guest	2023-12-06	\N
1101	Mirian Barrientos	f	f	t	t	f	f	f	t		2019-12-05 01:24:30.799104	2019-12-05 01:24:30.799104	33	242	Female	Associate Member	2019-12-11	\N
1102	Krishna Bykadi	f	f	t	t	f	f	f	f	VEGETARIAN. Krishna played volleyball with us this summer and came to tubing as well. Very nice guy- get to know him!	2019-12-05 14:42:04.562907	2019-12-05 14:42:04.562907	20	242	Male	Guest	2019-12-11	\N
1103	Amy Candelora	f	f	t	t	f	f	f	f	BEST WEEKEND!	2019-12-06 00:31:57.920052	2019-12-06 00:31:57.920052	16	242	Female	Full Member	2019-12-11	\N
1104	Chris Candelora	f	f	t	t	f	f	f	t	Best Weekend	2019-12-06 00:32:27.938955	2019-12-06 00:32:27.938955	16	242	Male	Full Member	2019-12-11	\N
1105	Brian Pfaffinger	f	f	f	f	t	f	f	f	North Face Jan Bed if Open Please.	2019-12-06 13:14:13.542455	2019-12-06 13:14:13.542455	14	242	Male	Associate Member	2019-12-11	\N
1380	Alana McCarthy 	f	f	t	t	f	f	f	t	“Not quite the Best but still ok-est” skip weekend	2020-11-07 20:04:02.967631	2020-11-07 20:04:02.967631	23	298	Female	Full Member	2020-12-09	\N
1107	Matthew Beal	f	f	t	t	f	f	f	t	Bringing my girlfriend, Somer Brown	2019-12-09 15:44:31.506872	2019-12-09 15:44:31.506872	50	242	Male	Full Member	2019-12-11	\N
1108	Somer Brown	f	f	t	t	f	f	f	t		2019-12-09 17:12:38.675775	2019-12-09 17:12:38.675775	50	242	Female	Guest	2019-12-11	\N
1013	Nancy Murphy	f	f	t	t	f	f	f	t	Still up early Friday morning. 	2019-11-06 14:05:37.601632	2019-12-10 11:54:26.547179	51	242	Female	Full Member	2019-12-11	\N
1109	David Heimann	f	f	t	t	f	f	f	f	First time visitor recruited at Nikki's gym! - DS	2019-12-10 23:21:36.615092	2019-12-10 23:21:36.615092	20	242	Male	Guest	2019-12-11	\N
1110	Nick Konopka	f	f	f	t	t	f	f	f	First time visitor, coming with his wife- note that he wishes to stay Sunday night, which should be okay since we will have a few members up. I've communicated to him that he should plan to be out early Monday so we can close up. - DS	2019-12-11 19:55:15.224037	2019-12-11 19:55:15.224037	20	242	Male	Guest	2019-12-11	\N
1111	Joanna Konopka	f	f	f	t	t	f	f	f	First time visitor, coming with her husband, Nick- note that she wishes to stay Sunday night, which should be okay since we will have a few members up. I've communicated to her that she should plan to be out early Monday so we can close up. - DS	2019-12-11 19:55:56.276712	2019-12-11 23:03:03.838611	20	242	Female	Guest	2019-12-11	\N
1113	Dan Shults	f	t	t	t	f	f	f	t	F I R S T  A I D	2019-12-16 14:38:39.368299	2019-12-16 14:38:39.368299	20	248	Male	Full Member	2020-01-01	\N
1115	ken simon	f	f	t	t	t	t	t	t		2019-12-17 00:48:43.464757	2019-12-17 00:49:58.037221	45	247	Male	Full Member	2019-12-25	\N
1116	Alana McCarthy 	f	f	t	t	f	f	f	f	First aid!	2019-12-17 03:46:45.511567	2019-12-17 03:46:45.511567	23	248	Female	Full Member	2020-01-01	\N
1117	John D	t	t	t	t	t	t	t	t		2019-12-17 21:27:57.052973	2019-12-17 21:27:57.052973	2	247	Male	Full Member	2019-12-25	\N
1118	John D	f	f	f	f	f	t	t	t		2019-12-17 21:28:43.593564	2019-12-17 21:28:43.593564	2	244	Male	Full Member	2019-12-18	\N
1114	ken simon	f	f	t	t	t	f	f	t		2019-12-17 00:47:29.797059	2019-12-18 20:22:05.2601	45	244	Male	Full Member	2019-12-18	\N
1120	Doug mayo	f	f	f	t	t	t	f	t	Happy new year	2019-12-19 01:57:02.455935	2019-12-19 01:57:02.455935	12	247	Male	Full Member	2019-12-25	\N
1121	Megan mccauley	f	f	t	t	t	t	f	t	Happy new year	2019-12-19 01:58:34.69834	2019-12-19 01:58:34.69834	12	247	Female	Full Member	2019-12-25	\N
1122	Doug mayo	f	f	t	t	f	f	f	t		2019-12-19 01:58:58.116992	2019-12-19 01:58:58.116992	12	248	Male	Full Member	2020-01-01	\N
1123	Megan Mccauley 	f	f	t	t	f	f	f	t		2019-12-19 01:59:19.117123	2019-12-19 01:59:19.117123	12	248	Female	Full Member	2020-01-01	\N
1124	Doug mayo	f	f	t	t	f	f	f	t		2019-12-19 02:00:21.873951	2019-12-19 02:00:21.873951	12	252	Male	Full Member	2020-01-08	\N
1125	Megan Mccauley 	f	f	t	t	f	f	f	t		2019-12-19 02:00:44.612871	2019-12-19 02:00:44.612871	12	252	Female	Full Member	2020-01-08	\N
1126	Doug mayo	f	f	t	t	t	f	f	t		2019-12-19 02:01:17.379551	2019-12-19 02:01:17.379551	12	254	Male	Full Member	2020-01-15	\N
1127	Megan Mccauley 	f	f	t	t	t	f	f	t		2019-12-19 02:01:42.564998	2019-12-19 02:01:42.564998	12	254	Female	Full Member	2020-01-15	\N
1128	Doug mayo	f	f	t	t	f	f	f	t		2019-12-19 02:02:06.099087	2019-12-19 02:02:06.099087	12	255	Male	Full Member	2020-01-22	\N
1129	Megan Mccauley 	f	f	t	t	f	f	f	t		2019-12-19 02:02:29.375042	2019-12-19 02:02:29.375042	12	255	Female	Full Member	2020-01-22	\N
1218	Amy Candelora	f	f	t	t	f	f	f	t		2020-01-19 21:36:11.347024	2020-01-19 21:36:11.347024	16	257	Female	Full Member	2020-02-05	\N
1130	amy candelora	f	t	t	t	t	t	t	t	We will be up from Thursday the 26th to Thursday the 2nd\r\n	2019-12-23 18:29:27.203089	2019-12-23 18:29:27.203089	16	247	Female	Full Member	2019-12-25	\N
1131	Chris Candelora	f	t	t	t	t	t	t	t	We will be up from Thursday the 26th to Wednesday the 1st	2019-12-23 18:30:06.847539	2019-12-23 18:30:06.847539	16	247	Male	Full Member	2019-12-25	\N
1132	Amy Candelora	f	f	t	t	t	f	f	t	First Aid	2019-12-23 18:31:41.609192	2019-12-23 18:31:41.609192	16	248	Female	Full Member	2020-01-01	\N
1133	Chris Candelora	f	f	t	t	t	f	f	t	First Aid DJ	2019-12-23 18:32:14.03979	2019-12-23 18:32:14.03979	16	248	Male	Full Member	2020-01-01	\N
1134	Andrew Blohm	f	t	t	f	f	f	f	t	Bringing Corey Landsman up for thursday friday	2019-12-24 03:46:53.757014	2019-12-24 03:46:53.757014	47	247	Male	Full Member	2019-12-25	\N
1135	Chris Bromery	f	t	t	t	f	f	f	f	First Aid! (Thursday arrival is tentative)	2019-12-24 03:47:30.153975	2019-12-24 03:47:30.153975	15	248	Male	Full Member	2020-01-01	\N
1136	Corey Landsman	f	t	t	f	f	f	f	t	Guest of Andrew Blohm	2019-12-24 03:47:54.168558	2019-12-24 03:47:54.168558	47	247	Female	Guest	2019-12-25	\N
1137	Mike Ryan	f	f	t	f	f	f	f	f	Just Friday night. Heading South after dinner. 	2019-12-24 15:37:17.990491	2019-12-24 15:37:17.990491	14	248	Male	Full Member	2020-01-01	\N
1138	David Hsieh	f	f	t	t	f	f	f	f	Handsome David! Good prospect- hang with him!	2019-12-25 03:28:17.043721	2019-12-25 03:28:17.043721	20	248	Male	Guest	2020-01-01	\N
1139	Lori Lavoie	f	f	t	t	f	f	f	f	My old bed in Tyrol if avail please.	2019-12-26 13:46:49.727655	2019-12-26 13:47:09.891064	44	248	Female	Associate Member	2020-01-01	\N
1142	Brendan Halpin	f	f	t	t	f	f	f	f	Guest of Mark B	2019-12-28 03:43:07.579792	2019-12-28 03:43:07.579792	22	248	Male	Guest	2020-01-01	\N
1140	Mark Buckley	f	f	t	t	f	f	f	f	First Aid!	2019-12-28 03:42:01.477647	2019-12-28 03:45:21.506281	22	248	Male	Full Member	2020-01-01	\N
1141	Hiliary Buckley	f	f	t	t	f	f	f	f		2019-12-28 03:42:35.484975	2019-12-28 03:45:35.268205	22	248	Female	Associate Member	2020-01-01	\N
1143	Kristen Chamberlain 	f	f	t	t	f	f	f	f	Guest of Mark B	2019-12-28 03:43:35.698555	2019-12-28 03:45:55.429879	22	248	Female	Guest	2020-01-01	\N
1144	Kristie Landry	f	f	t	t	f	f	f	f	Guest of Mark B	2019-12-28 03:46:54.396917	2019-12-28 03:46:54.396917	22	248	Female	Guest	2020-01-01	\N
1145	Matt Landry	f	f	t	t	f	f	f	f	Guest of Mark B	2019-12-28 03:48:02.398907	2019-12-28 03:48:02.398907	22	248	Male	Guest	2020-01-01	\N
1146	Tommy wall	f	f	t	t	f	f	f	f	First aid	2019-12-28 16:35:41.6212	2019-12-28 16:35:49.29787	23	248	Male	Full Member	2020-01-01	\N
1029	Nancy Murphy	f	f	t	t	f	f	f	f	First Aid	2019-11-11 01:24:23.238511	2019-12-29 18:25:36.438558	51	248	Female	Full Member	2020-01-01	\N
1119	Nancy Murphy	f	f	t	t	f	f	f	f	Ullr	2019-12-18 13:53:55.647667	2020-01-17 14:31:57.454359	51	257	Female	Full Member	2020-02-05	\N
1150	Mirian Barrientos	f	f	t	t	f	f	f	t		2019-12-29 23:05:41.788937	2019-12-29 23:05:41.788937	33	248	Female	Associate Member	2020-01-01	\N
1151	Whitney Factor	f	f	t	t	f	f	f	t	Guest of Kevin and Mirian	2019-12-29 23:06:27.456055	2019-12-29 23:06:27.456055	33	248	Female	Guest	2020-01-01	\N
1152	Leah Morgenstern	f	f	t	t	f	f	f	t	Guest of Kevin and Mirian	2019-12-29 23:06:49.261126	2019-12-29 23:06:49.261126	33	248	Female	Guest	2020-01-01	\N
1153	Corey Angers	f	f	t	t	f	f	f	t	Guest of Kevin and Mirian	2019-12-29 23:07:16.598953	2019-12-29 23:07:16.598953	33	248	Male	Guest	2020-01-01	\N
1154	Michelle Comtois	f	f	t	t	f	f	f	t		2019-12-30 00:25:09.897919	2019-12-30 00:25:09.897919	5	248	Female	Full Member	2020-01-01	\N
1155	Shana Biletch	f	f	t	t	f	f	f	f	Shana reached out via an EICSL inquiry a few months ago, and after some email correspondence, Nikki and I met up with her for a cup of coffee. This is her first visit! - DS	2019-12-30 02:39:30.424986	2019-12-30 02:39:45.379951	20	248	Female	Guest	2020-01-01	\N
1156	Nikki Shults	f	t	t	t	f	f	f	f	First Aid	2019-12-30 03:28:21.47859	2019-12-30 03:28:21.47859	20	248	Female	Full Member	2020-01-01	\N
1157	Laurel Galbraith	f	f	t	t	f	f	f	f	Delaney's guest	2019-12-30 18:03:00.579579	2019-12-30 18:03:00.579579	31	248	Female	Guest	2020-01-01	\N
1158	John D	t	t	t	t	f	f	f	t	My Brain Hurts! I need First Aid.	2019-12-31 15:16:25.351295	2019-12-31 15:16:25.351295	2	248	Male	Full Member	2020-01-01	\N
1159	Vicki Santarcangelo	f	t	t	t	f	f	f	t	First Aid	2019-12-31 17:04:27.782176	2019-12-31 17:04:27.782176	3	248	Female	Full Member	2020-01-01	\N
1160	Andrew Blohm	f	f	t	t	t	f	f	f	First aid	2019-12-31 20:07:58.901739	2019-12-31 20:12:39.326936	47	248	Male	Full Member	2020-01-01	\N
1161	Corey Landsman 	f	f	t	t	t	f	f	f	Guest of ANDREW for first aid	2019-12-31 20:08:42.095947	2019-12-31 20:12:59.296844	47	248	Female	Guest	2020-01-01	\N
1162	Ken Simon	f	f	t	t	f	f	f	t		2019-12-31 22:08:54.360846	2019-12-31 22:08:54.360846	16	248	Male	Full Member	2020-01-01	\N
1163	Prajwal Shravanabelagola	f	f	t	t	f	f	f	f	VEGETARIAN. Prajwal is a friend of our friend Ben (Thushanth) who has been up to the club a number of times and is a strong prospect. -DS	2020-01-01 16:23:24.802345	2020-01-01 16:23:24.802345	20	248	Male	Guest	2020-01-01	\N
1164	Livia Shehaj	f	f	t	t	f	f	f	f	Livia is a friend of our friend Ben (Thushanth) who has been up to the club a number of times and is a strong prospect. -DS	2020-01-01 16:24:30.61535	2020-01-01 16:24:30.61535	20	248	Female	Guest	2020-01-01	\N
1165	Bryan Kirk	f	f	t	t	f	f	f	f	Bryan was sourced from reddit.com/r/icecoast. Haven't talked with him much, but he seems like an alright dude. -DS	2020-01-01 16:28:15.20434	2020-01-01 16:28:15.20434	20	248	Male	Guest	2020-01-01	\N
1166	Kelsey Miller	f	f	t	t	f	f	f	f	Kelsey visited during Best Weekend and is coming back! She'd make a good member- spend some time with her! -DS	2020-01-01 16:30:47.336877	2020-01-01 16:30:47.336877	20	248	Female	Guest	2020-01-01	\N
1169	Alana Mccarthy	f	f	t	t	f	f	f	t	Cheering on our racers	2020-01-07 13:45:10.680436	2020-01-07 13:45:10.680436	23	255	Female	Full Member	2020-01-22	\N
1202	Mike Ryan	f	f	t	t	t	f	f	t		2020-01-09 20:14:50.529967	2020-01-09 20:14:50.529967	14	254	Male	Full Member	2020-01-15	\N
1203	Mike Ryan	f	f	t	t	f	f	f	t		2020-01-09 20:15:14.953661	2020-01-09 20:15:14.953661	14	255	Male	Full Member	2020-01-22	\N
1204	Jess Przywara	f	f	t	t	t	f	f	t	Beth S bed if open please. 	2020-01-10 13:37:25.110143	2020-01-10 13:37:25.110143	14	254	Female	Guest	2020-01-15	\N
1201	Shana Biletch	f	f	f	t	t	f	f	t	Shana is a returning guest and is VERY INTERESTED IN MEMBERSHIP. Spend some time with her! Vicki will sponsor.  - DS	2020-01-09 17:12:01.001373	2020-01-12 23:43:12.600493	20	254	Female	Guest	2020-01-15	\N
1205	Milan Thakker	f	f	f	t	f	f	f	t	Milan (pronounced like the city) snowboards and skis and likes backcountry. I spent a day skiing with him at Wildcat early in the season. Nice guy and a strong membership prospect! Vicki is sponsoring with Mike as a backup. He may come Fri night, but for now has only committed to Sat. Will edit as needed. -DS	2020-01-13 14:13:50.570313	2020-01-13 14:13:50.570313	20	254	Male	Guest	2020-01-15	\N
1206	Chris Bromery	f	f	t	t	f	f	f	t	ULLR!!!	2020-01-14 03:45:09.075619	2020-01-14 03:45:09.075619	15	257	Male	Full Member	2020-02-05	\N
1207	Amy Candelora	f	f	t	t	t	f	f	t		2020-01-14 23:39:04.862345	2020-01-14 23:39:04.862345	16	254	Female	Full Member	2020-01-15	\N
1208	Chris Candelora	f	f	t	t	t	f	f	t		2020-01-14 23:39:30.043699	2020-01-14 23:39:30.043699	16	254	Male	Full Member	2020-01-15	\N
1209	Sara Delaney	f	f	f	f	t	f	f	t	My old bed in Tyrol, if available, please	2020-01-15 18:47:14.638679	2020-01-15 18:47:14.638679	31	254	Female	Associate Member	2020-01-15	\N
1210	Chris Bromery	f	f	t	t	f	f	f	t		2020-01-15 23:53:14.832043	2020-01-15 23:53:14.832043	15	254	Male	Full Member	2020-01-15	\N
1211	Dan Shults	f	t	t	t	f	f	f	f	Hail Ullr!	2020-01-16 15:44:21.713913	2020-01-16 15:44:21.713913	20	257	Male	Full Member	2020-02-05	\N
1212	Beth Smith	t	t	t	t	t	t	t	f	Hi Bretts, I am coming up to the Club on Monday Jan. 20 and staying through the 31st.	2020-01-19 00:25:29.326825	2020-01-19 00:25:29.326825	19	255	Female	Full Member	2020-01-22	\N
1213	Michelle Comtois	f	f	t	t	f	f	f	t		2020-01-19 20:40:52.580508	2020-01-19 20:40:52.580508	5	255	Female	Full Member	2020-01-22	\N
1214	Michelle Comtois	f	f	t	t	f	f	f	t		2020-01-19 20:41:27.92225	2020-01-19 20:41:27.92225	5	257	Female	Full Member	2020-02-05	\N
1215	Amy Candelora	f	f	t	t	f	f	f	t		2020-01-19 21:34:43.309476	2020-01-19 21:34:43.309476	16	255	Female	Full Member	2020-01-22	\N
1216	Chris Candelora	f	f	t	t	f	f	f	t		2020-01-19 21:35:13.009317	2020-01-19 21:35:13.009317	16	255	Male	Full Member	2020-01-22	\N
1217	Chris Candelora	f	f	t	t	f	f	f	t		2020-01-19 21:35:44.705312	2020-01-19 21:35:44.705312	16	257	Male	Full Member	2020-02-05	\N
1219	John D	f	t	t	t	t	f	f	t		2020-01-20 19:41:20.076838	2020-01-20 19:41:20.076838	2	255	Male	Full Member	2020-01-22	\N
1220	Vicki Santarcangelo 	f	t	t	t	f	f	f	t		2020-01-21 02:19:40.093272	2020-01-21 02:19:40.093272	3	255	Female	Full Member	2020-01-22	\N
1221	Vicki Santarcangelo 	f	f	t	t	f	f	f	t		2020-01-21 02:20:13.303594	2020-01-21 02:20:13.303594	3	292	Female	Full Member	2020-03-04	\N
1222	Tatiana Cook	f	f	t	t	f	f	f	t	Vicki’s College Roommate 	2020-01-21 02:21:25.645547	2020-01-21 02:21:25.645547	3	292	Female	Guest	2020-03-04	\N
1223	Chris Bromery	f	f	t	t	f	f	f	t		2020-01-21 14:18:43.629291	2020-01-21 14:18:43.629291	15	255	Male	Full Member	2020-01-22	\N
1224	Mike Ryan	f	f	t	t	f	f	f	t		2020-01-24 20:41:24.510829	2020-01-24 20:41:24.510829	14	258	Male	Full Member	2020-01-29	\N
1225	Tommy Wall	f	f	t	t	f	f	f	f	Ullr!	2020-01-26 16:27:23.281704	2020-01-26 16:27:23.281704	23	257	Male	Full Member	2020-02-05	\N
1226	Chris Bromery	f	f	t	t	f	f	f	t		2020-01-27 02:29:09.018302	2020-01-27 02:29:09.018302	15	258	Male	Full Member	2020-01-29	\N
1227	Mark Buckley	f	f	t	t	f	f	f	t		2020-01-27 14:50:52.209796	2020-01-27 14:50:52.209796	22	258	Male	Full Member	2020-01-29	\N
1228	Dan Shults	f	f	t	t	f	f	f	t	Hosting Meaghan Sydlowski and a friend of hers. Most likely doing an Ikon weekend (Sunday River/Loon).	2020-01-27 15:17:30.421474	2020-01-27 15:17:30.421474	20	258	Male	Full Member	2020-01-29	\N
1229	Nikki Shults	f	f	t	t	f	f	f	t	Hosting Meaghan Sydlowski and a friend of hers. Most likely doing an Ikon weekend (Sunday River/Loon).	2020-01-27 15:17:51.541653	2020-01-27 15:18:09.020329	20	258	Female	Full Member	2020-01-29	\N
1170	Alana Mccarthy	f	f	t	t	f	f	f	f	Ullr	2020-01-07 13:47:12.821217	2020-01-27 15:48:22.641384	23	257	Female	Full Member	2020-02-05	\N
1230	Alana McCarthy	f	f	t	f	f	f	f	t	Possible stay on Friday- I'll be in the valley with my family mostly though	2020-01-27 15:49:48.249947	2020-01-27 15:49:48.249947	23	259	Female	Full Member	2020-02-12	\N
1231	Alana McCarthy	f	f	t	t	f	f	f	f	Up to help with Alumni weekend	2020-01-27 15:50:30.142414	2020-01-27 15:50:30.142414	23	293	Female	Full Member	2020-02-19	\N
1232	Meaghan Sydlowski	f	f	t	t	f	f	f	t		2020-01-27 15:59:04.770462	2020-01-27 15:59:04.770462	14	258	Female	Guest	2020-01-29	\N
1233	Brooke Lessard	f	f	t	t	f	f	f	t	Put with Meaghan please 	2020-01-27 16:00:44.121834	2020-01-27 16:00:44.121834	14	258	Female	Guest	2020-01-29	\N
1234	Jess Przywara	f	f	f	t	f	f	f	t		2020-01-27 16:01:14.651978	2020-01-27 16:01:14.651978	14	258	Female	Guest	2020-01-29	\N
1235	Doug mayo	f	f	t	t	f	f	f	t		2020-01-28 02:06:14.902581	2020-01-28 02:06:14.902581	12	258	Male	Full Member	2020-01-29	\N
1236	Megan Mccauley 	f	f	t	t	f	f	f	t	Here for the xc	2020-01-28 02:07:18.653349	2020-01-28 02:07:18.653349	12	258	Female	Full Member	2020-01-29	\N
1237	Doug Mayo 	f	f	t	t	f	f	f	t		2020-01-28 02:07:43.306946	2020-01-28 02:07:43.306946	12	257	Male	Full Member	2020-02-05	\N
1238	Megan Mccauley 	f	f	t	t	f	f	f	t	mo Snow	2020-01-28 02:08:59.420721	2020-01-28 02:08:59.420721	12	257	Female	Full Member	2020-02-05	\N
1239	Douglas Mayo 	f	f	t	t	t	t	t	f	School vacation 	2020-01-28 02:09:59.051424	2020-01-28 02:09:59.051424	12	259	Male	Full Member	2020-02-12	\N
1240	Megan Mccauley 	f	f	t	t	t	t	t	f	Lots of xc 	2020-01-28 02:10:38.45236	2020-01-28 02:10:38.45236	12	259	Female	Full Member	2020-02-12	\N
1241	Douglas Mayo 	t	t	t	t	f	f	f	t	End of vacation 	2020-01-28 02:11:18.2067	2020-01-28 02:11:18.2067	12	293	Male	Full Member	2020-02-19	\N
1242	Megan Mccauley 	t	t	t	t	f	f	f	t	Mo Snow 	2020-01-28 02:12:14.277407	2020-01-28 02:12:14.277407	12	293	Female	Full Member	2020-02-19	\N
1244	Milan Thakker	f	f	t	t	f	f	f	t	Second visit and a strong membership prospect. Get to know him! -DS	2020-01-28 20:39:56.610092	2020-01-28 20:39:56.610092	20	258	Male	Guest	2020-01-29	\N
1245	Dan Shults	f	f	t	t	f	f	f	t	Alumni Weekend!	2020-01-28 20:58:27.720438	2020-01-28 20:58:27.720438	20	293	Male	Full Member	2020-02-19	\N
1247	Kevin Holowaty	f	f	t	t	f	f	f	f	Friend of Nikki and Dan	2020-01-31 13:55:40.16064	2020-01-31 13:55:47.924544	20	257	Male	Guest	2020-02-05	\N
1249	Greg Biggs	f	f	t	t	f	f	f	f	Friend of Nikki and Dan	2020-01-31 13:56:43.500817	2020-01-31 13:56:43.500817	20	257	Male	Guest	2020-02-05	\N
1250	Melissa Biggs	f	f	t	t	f	f	f	f	Friend of Nikki and Dan	2020-01-31 13:57:01.218782	2020-01-31 13:57:01.218782	20	257	Female	Guest	2020-02-05	\N
1251	Brandon Juby	f	f	t	t	f	f	f	f	Friend of Nikki and Dan	2020-01-31 13:57:35.128618	2020-01-31 13:57:35.128618	20	257	Male	Guest	2020-02-05	\N
1252	Paula Miller	f	f	t	t	f	f	f	f	Guest of Delaney. Please place Paula and her friend Ruth in the same room, if possible	2020-01-31 21:16:14.038543	2020-01-31 21:16:14.038543	31	257	Female	Guest	2020-02-05	\N
1254	Shana Biletch	f	f	f	t	f	f	f	f	Saturday night only- I offered her a slight discount: $60 for 1 night lodging + party and dinner. Shana is coming up for her 3rd visit. She says she is going to apply! Be nice and get to know her :)  - DS	2020-01-31 21:44:04.961095	2020-01-31 21:44:04.961095	20	257	Female	Guest	2020-02-05	\N
1255	Nikki Shults	f	t	t	t	f	f	f	f	Hail ullr!	2020-02-02 21:02:46.503645	2020-02-02 21:02:46.503645	9	257	Female	Full Member	2020-02-05	\N
1256	Lou Parente	f	f	t	t	f	f	f	t		2020-02-03 23:20:07.515684	2020-02-03 23:20:07.515684	32	293	Male	Associate Member	2020-02-19	\N
1257	Mike Ryan	f	f	t	t	f	f	f	f		2020-02-04 18:47:18.981461	2020-02-04 18:47:18.981461	14	257	Male	Full Member	2020-02-05	\N
1248	Shannon Slota	f	f	t	t	f	f	f	f	VEGETARIAN - Friend of Nikki and Dan	2020-01-31 13:56:25.676231	2020-02-04 19:48:52.032017	20	257	Female	Guest	2020-02-05	\N
1258	Emily Bularzik	f	f	f	t	f	f	f	f	guest of Delaney	2020-02-04 20:08:41.131701	2020-02-04 20:08:41.131701	31	257	Female	Guest	2020-02-05	\N
1253	Ruth	f	f	f	t	f	f	f	f	Friend of Paula, guest of Delaney. Please place Paula and Ruth in the same room, if possible. 	2020-01-31 21:20:14.699759	2020-02-04 20:09:07.596106	31	257	Female	Guest	2020-02-05	\N
1259	Emily Foster	f	f	t	t	f	f	f	f	Guest of Delaney	2020-02-04 20:23:20.36578	2020-02-04 20:23:20.36578	31	257	Female	Guest	2020-02-05	\N
1260	Bryan Kirk	f	f	t	t	f	f	f	f	This is Bryan's second visit. His first was First Aid. He was friendly and fit in well. Could be a good prospect! - DS	2020-02-04 22:17:41.323376	2020-02-04 22:17:41.323376	20	257	Male	Guest	2020-02-05	\N
1261	Matthew veal	f	f	t	t	f	f	f	t		2020-02-05 04:29:40.50561	2020-02-05 04:29:40.50561	50	257	Male	Full Member	2020-02-05	\N
1246	Laurel Galbraith	f	f	t	t	f	f	f	f	Guest of Delaney	2020-01-30 12:50:46.757832	2020-02-05 15:48:53.783099	31	257	Female	Guest	2020-02-05	\N
1243	Sara Delaney	f	f	t	t	f	f	f	f	Ullr!! (Could I have my old bed, if available, please?)	2020-01-28 18:19:47.428336	2020-02-05 18:44:31.335875	31	257	Female	Associate Member	2020-02-05	\N
1262	Andrew Blohm	f	f	t	t	t	f	f	f	Bringing guest Corey Landsman 	2020-02-05 21:32:54.115962	2020-02-05 21:33:04.812227	47	257	Male	Full Member	2020-02-05	\N
1263	Corey Landsman 	f	f	t	t	t	f	f	f	Guest of Andrew Blohm	2020-02-05 21:33:57.601362	2020-02-05 21:33:57.601362	47	257	Female	Guest	2020-02-05	\N
1264	Chris Bromery	f	f	t	t	f	f	f	f	Alumni Weekend!	2020-02-09 23:11:05.762742	2020-02-09 23:11:05.762742	15	293	Male	Full Member	2020-02-19	\N
1265	Chris Bromery	f	f	t	t	f	f	f	t	Tentative...poss Sat arrival	2020-02-09 23:14:18.61313	2020-02-09 23:14:18.61313	15	259	Male	Full Member	2020-02-12	\N
1266	Mike Ryan	f	f	t	t	t	f	f	t		2020-02-11 15:28:51.74664	2020-02-11 15:28:51.74664	14	259	Male	Full Member	2020-02-12	\N
1267	Jess P	f	f	t	t	t	f	f	t	Beth’s bed please 	2020-02-11 15:29:34.700419	2020-02-11 15:29:34.700419	14	259	Female	Guest	2020-02-12	\N
1268	Sara Delaney	f	f	f	t	t	f	f	t	In Tyrol, if possible. I'll be up Sunday night and possibly Sat night	2020-02-11 17:58:21.595486	2020-02-11 17:58:21.595486	31	259	Female	Associate Member	2020-02-12	\N
1269	Nelson Cohn	f	f	f	t	t	f	f	t	guest of Delaney. Sunday and possibly Saturday nights	2020-02-11 18:27:43.130443	2020-02-11 18:27:43.130443	31	259	Male	Guest	2020-02-12	\N
1270	Mary	f	f	f	t	t	f	f	t	Guest of Delaney. Sunday and possibly Saturday nights	2020-02-11 18:28:42.645492	2020-02-11 18:28:42.645492	31	259	Female	Guest	2020-02-12	\N
1271	LORI LAVOIE	f	f	t	t	t	f	f	t	Fri only maybe.  My old bed in Tyrol if possible	2020-02-11 18:49:43.844955	2020-02-11 18:49:43.844955	44	259	Female	Associate Member	2020-02-12	\N
1272	Amy Candelora	f	f	t	t	f	f	f	t		2020-02-12 00:02:33.425657	2020-02-12 00:02:33.425657	16	292	Female	Full Member	2020-03-04	\N
1273	Chris Candelora	f	f	t	t	f	f	f	t		2020-02-12 00:03:06.057416	2020-02-12 00:03:06.057416	16	292	Male	Full Member	2020-03-04	\N
1274	Amy Candelora	f	f	t	t	f	f	f	t		2020-02-12 00:03:45.592554	2020-02-12 00:03:45.592554	16	294	Female	Full Member	2020-03-11	\N
1275	Chris Candelora	f	f	t	t	f	f	f	t		2020-02-12 00:04:47.454027	2020-02-12 00:04:47.454027	16	294	Male	Full Member	2020-03-11	\N
1276	Amy Candelora	f	f	t	t	f	f	f	t	ice bar	2020-02-12 00:05:20.063077	2020-02-12 00:05:20.063077	16	295	Female	Full Member	2020-03-18	\N
1277	Chris Candelora	f	f	t	t	f	f	f	t	ice bar	2020-02-12 00:05:51.335287	2020-02-12 00:05:51.335287	16	295	Male	Full Member	2020-03-18	\N
1278	Tommy Wall	f	f	t	t	f	f	f	t	❄️👍	2020-02-14 08:45:26.196586	2020-02-14 08:45:26.196586	21	293	Male	Full Member	2020-02-19	\N
1279	Vicki Santarcangelo	f	t	t	t	f	f	f	t	Alumni Weekend	2020-02-14 15:08:16.575184	2020-02-14 15:08:16.575184	3	293	Female	Full Member	2020-02-19	\N
1280	Kevin Buckley	f	t	t	t	f	f	f	t		2020-02-15 01:18:56.449448	2020-02-15 01:18:56.449448	33	293	Male	Associate Member	2020-02-19	\N
1281	Mirian Barrientos	f	f	t	t	f	f	f	t		2020-02-15 01:19:42.672675	2020-02-15 01:19:42.672675	33	293	Female	Associate Member	2020-02-19	\N
1282	Argery Katzounas	f	f	t	t	f	f	f	t		2020-02-15 23:08:16.661046	2020-02-15 23:08:16.661046	32	293	Male	Associate Member	2020-02-19	\N
1283	John D	f	t	t	t	t	f	f	t	We will be up for Alumni Weekend. Please include us on any dinner plans and we can help as well. 	2020-02-17 14:23:57.470532	2020-02-17 14:23:57.470532	2	293	Male	Full Member	2020-02-19	\N
1284	ken simon	f	f	f	t	f	f	f	t		2020-02-18 18:07:37.871222	2020-02-18 18:07:37.871222	45	293	Male	Full Member	2020-02-19	\N
1285	Mike Ryan	f	t	t	t	f	f	f	f		2020-02-18 18:54:06.820012	2020-02-18 18:54:06.820012	14	293	Male	Full Member	2020-02-19	\N
1286	Peg Crowe	f	f	t	t	f	f	f	f	Guest of alumnus Lorraine Clarkin	2020-02-18 19:57:35.727894	2020-02-18 19:57:35.727894	20	293	Female	Guest	2020-02-19	\N
1287	Lorraine Clarkin	f	f	t	t	f	f	f	f	Alumnus. Please place w Holly, Cathy, and Peg.	2020-02-18 19:58:55.028652	2020-02-18 19:58:55.028652	20	293	Female	Guest	2020-02-19	\N
1288	Holly Skawinski	f	f	t	t	f	f	f	f	Guest of Lorraine Clarkin.	2020-02-18 20:00:01.950561	2020-02-18 20:00:01.950561	20	293	Female	Guest	2020-02-19	\N
1289	Cathy Obrien	f	f	t	t	f	f	f	f	Alumnus. 	2020-02-18 20:00:35.700412	2020-02-18 20:00:35.700412	20	293	Female	Guest	2020-02-19	\N
1290	Chris Bromery	f	t	t	t	f	f	f	t	Ice Bar	2020-02-20 02:33:11.394804	2020-02-20 02:33:11.394804	15	295	Male	Full Member	2020-03-18	\N
1291	Chris Bromery	f	f	t	t	f	f	f	t		2020-02-20 02:33:52.362096	2020-02-20 02:33:52.362096	15	296	Male	Full Member	2020-02-26	\N
1292	Chris Bromery	f	f	t	t	f	f	f	t		2020-02-20 02:34:26.473612	2020-02-20 02:34:26.473612	15	292	Male	Full Member	2020-03-04	\N
1293	Chris Bromery	f	f	t	t	f	f	f	t		2020-02-20 02:35:59.710604	2020-02-20 02:35:59.710604	15	294	Male	Full Member	2020-03-11	\N
1294	Vicki Santarcangelo 	f	f	t	t	f	f	f	t		2020-02-24 02:24:13.650444	2020-02-24 02:24:13.650444	3	296	Female	Full Member	2020-02-26	\N
1296	Nikki Shults	f	f	t	t	f	f	f	t	Race weekend!	2020-02-25 14:19:05.802767	2020-02-25 14:19:05.802767	20	292	Female	Full Member	2020-03-04	\N
1381	Tommy wall 	f	t	t	t	f	f	f	t	Best skip weekend	2020-11-07 20:05:12.038198	2020-11-07 20:05:12.038198	23	298	Male	Full Member	2020-12-09	\N
1298	Mike Ryan	f	f	f	t	f	f	f	t	Maybe Friday too	2020-02-26 01:38:37.61027	2020-02-26 01:38:37.61027	14	296	Male	Full Member	2020-02-26	\N
1299	Alana McCarthy 	f	f	t	t	f	f	f	t	Race finals!	2020-02-26 03:04:06.724342	2020-02-26 03:04:06.724342	23	292	Female	Full Member	2020-03-04	\N
1300	Tommy Wall	f	f	t	t	f	f	f	t	Race!	2020-02-26 03:04:43.190493	2020-02-26 03:04:43.190493	23	292	Male	Full Member	2020-03-04	\N
1301	John Cushing	f	f	t	t	f	f	f	t	Guest of Chris B.	2020-02-27 00:31:50.260605	2020-02-27 00:31:50.260605	15	296	Male	Guest	2020-02-26	\N
1302	Doug mayo	f	f	t	t	f	f	f	t	Getintoit 	2020-03-02 01:51:38.139958	2020-03-02 01:51:38.139958	12	292	Male	Full Member	2020-03-04	\N
1303	Megan Mccauley 	f	f	t	t	f	f	f	t		2020-03-02 01:52:02.306753	2020-03-02 01:52:02.306753	12	292	Female	Full Member	2020-03-04	\N
1304	Bob quintal	f	f	t	t	f	f	f	t	Guest of Doug 	2020-03-02 01:52:37.163238	2020-03-02 01:52:37.163238	12	292	Male	Guest	2020-03-04	\N
1305	Seth Peterson 	f	f	t	t	f	f	f	t	Guest of Doug 	2020-03-02 01:53:21.084911	2020-03-02 01:53:21.084911	12	292	Male	Guest	2020-03-04	\N
1306	Bob Marcolini	f	f	t	t	f	f	f	t	Guest of doug	2020-03-02 01:54:29.535924	2020-03-02 01:54:29.535924	12	292	Male	Guest	2020-03-04	\N
1307	Bryan Moorey 	f	f	t	t	f	f	f	t	Guest of Doug 	2020-03-02 01:55:01.803937	2020-03-02 01:55:01.803937	12	292	Male	Guest	2020-03-04	\N
1295	Dan Shults	f	f	t	t	f	f	f	t	Race weekend!	2020-02-25 14:18:33.720864	2020-03-03 02:59:45.478605	20	292	Male	Full Member	2020-03-04	\N
1308	Thushanth Bengre (Ben)	f	f	t	t	f	f	f	t	Ben is coming up with some friends. He has played volleyball with us the last couple of years, as well as attended tubing. He and his friends have been learning to ski. Good prospect!	2020-03-03 22:40:51.169257	2020-03-03 22:40:51.169257	20	292	Male	Guest	2020-03-04	\N
1309	Krishna Bykadi	f	f	t	t	f	f	f	t	Krishna played volleyball with us last summer and also came to tubing. Super nice guy. 	2020-03-03 22:41:35.296828	2020-03-03 22:41:35.296828	20	292	Male	Guest	2020-03-04	\N
1310	Prajwal Shravanabelagola	f	f	t	t	f	f	f	t	Friend of Thushanth's (Ben) and first time visitor. 	2020-03-03 22:48:09.406998	2020-03-03 22:48:09.406998	20	292	Male	Guest	2020-03-04	\N
1311	Prasad Kanade	f	f	t	t	f	f	f	t	Friend of Thushanth's (Ben) and first time visitor. 	2020-03-03 22:49:49.214249	2020-03-03 22:49:49.214249	20	292	Male	Guest	2020-03-04	\N
1312	Namratha Rao	f	f	t	t	f	f	f	t	Friend of Thushanth's (Ben) and first time visitor	2020-03-03 22:51:15.27063	2020-03-03 22:51:15.27063	20	292	Female	Guest	2020-03-04	\N
1313	Vishnu Prasad Maruthi	f	f	t	t	f	f	f	t	Friend of Thushanth's (Ben) and first time visitor.	2020-03-03 22:52:46.969575	2020-03-03 22:52:46.969575	20	292	Male	Guest	2020-03-04	\N
1314	Mike Ryan	f	f	t	t	f	f	f	t		2020-03-04 19:26:46.298912	2020-03-04 19:26:46.298912	14	292	Male	Full Member	2020-03-04	\N
1315	Jess Przywara	f	f	t	t	f	f	f	t	In Beth's Bed please	2020-03-04 19:27:31.114204	2020-03-04 19:27:31.114204	14	292	Female	Guest	2020-03-04	\N
1316	Michele Folts	f	f	t	t	f	f	f	t	Friend of Jess P. if can put in same room please	2020-03-04 19:28:44.695338	2020-03-04 19:28:44.695338	14	292	Female	Guest	2020-03-04	\N
1318	Mark Buckley	f	f	t	t	f	f	f	f	Ice Bar!	2020-03-05 20:53:01.477743	2020-03-05 20:53:01.477743	22	295	Male	Full Member	2020-03-18	\N
1319	Hiliary Buckley	f	f	t	t	f	f	f	f		2020-03-05 20:53:32.669813	2020-03-05 20:53:32.669813	22	295	Female	Associate Member	2020-03-18	\N
1320	Brendan Halpin	f	f	t	t	f	f	f	f		2020-03-05 20:54:40.365287	2020-03-05 20:54:40.365287	22	295	Male	Guest	2020-03-18	\N
1321	Kristen Chamberlain	f	f	t	t	f	f	f	f		2020-03-05 20:55:08.830004	2020-03-05 20:55:08.830004	22	295	Female	Guest	2020-03-18	\N
1324	Vicki Santarcangelo	f	t	t	t	t	f	f	t		2020-03-08 02:13:18.859217	2020-03-08 02:13:18.859217	3	294	Female	Full Member	2020-03-11	\N
1325	Vicki Santarcangelo 	f	t	t	t	t	f	f	t	Ice Bar	2020-03-08 02:13:52.269702	2020-03-08 02:13:52.269702	3	295	Female	Full Member	2020-03-18	\N
1357	Michelle Comtois	f	f	t	t	f	f	f	t	May not make it til Saturday morning 	2020-03-08 21:56:59.916334	2020-03-08 21:56:59.916334	5	294	Female	Full Member	2020-03-11	\N
1420	John D	f	f	t	t	t	t	t	t		2020-11-19 15:33:37.462181	2020-11-19 15:33:37.462181	2	306	Male	Full Member	2020-11-25	\N
1359	Nikki Shults	f	f	t	t	f	f	f	t	My last weekend of the season :( 	2020-03-09 18:51:16.63558	2020-03-09 18:51:16.63558	9	294	Female	Full Member	2020-03-11	\N
1360	Dan Shults	f	f	t	t	f	f	f	t	Where's the good snow at?	2020-03-09 18:57:55.174971	2020-03-09 18:57:55.174971	20	294	Male	Full Member	2020-03-11	\N
1322	John D	f	t	t	t	t	t	t	t	Spring skiing? Changing reservation to indicate that I will be up for the whole week between St Paddys and Ice Bar.	2020-03-05 21:45:35.053517	2020-03-09 19:00:23.904768	2	294	Male	Full Member	2020-03-11	\N
1361	Dan Shults	f	f	t	t	f	f	f	f	Ice Baaaaaaa	2020-03-09 20:52:38.878522	2020-03-09 20:52:38.878522	20	295	Male	Full Member	2020-03-18	\N
1362	Alana McCarthy 	f	f	t	t	f	f	f	t	Ice bar!	2020-03-10 19:55:17.963984	2020-03-10 19:55:17.963984	23	295	Female	Full Member	2020-03-18	\N
1363	Tommy Wall	f	f	t	t	f	f	f	t	Ice bar	2020-03-10 19:55:48.100698	2020-03-10 19:55:48.100698	23	295	Male	Full Member	2020-03-18	\N
1364	doug mayo	f	f	t	t	f	f	f	t		2020-03-11 10:57:52.195327	2020-03-11 10:57:52.195327	12	294	Male	Full Member	2020-03-11	\N
1365	megan mccauley	f	f	t	t	f	f	f	t		2020-03-11 10:58:18.604027	2020-03-11 10:58:18.604027	12	294	Female	Full Member	2020-03-11	\N
1366	Mike Ryan	f	f	t	t	f	f	f	f		2020-03-11 14:21:55.544374	2020-03-11 14:21:55.544374	14	294	Male	Full Member	2020-03-11	\N
1367	Jess Przywara	f	f	t	t	f	f	f	f	Beth's bed if open please.	2020-03-11 14:22:40.284524	2020-03-11 14:22:40.284524	14	294	Female	Guest	2020-03-11	\N
1368	Sara Delaney	f	f	f	t	f	f	f	t	Sat night + John D's Delicious Dinner! :)  Tyrol, if possible	2020-03-11 23:16:14.092905	2020-03-11 23:16:14.092905	31	294	Female	Associate Member	2020-03-11	\N
1369	Paula Miller	f	f	f	t	f	f	f	t	guest of Sara Delaney. Lori's bed, if possible	2020-03-11 23:17:53.399673	2020-03-11 23:17:53.399673	31	294	Female	Guest	2020-03-11	\N
1422	John D	f	f	t	t	t	t	t	t		2020-11-19 15:35:32.217532	2020-11-19 15:35:32.217532	2	307	Male	Full Member	2020-12-23	\N
1370	Bryan Kirk	f	f	t	t	f	f	f	f	This will be Bryan's third visit to the club. Nice guy and a strong prospect. Spend some time with him!	2020-03-12 15:19:48.607235	2020-03-12 15:19:48.607235	20	295	Male	Guest	2020-03-18	\N
1317	Nancy Murphy	f	f	t	f	f	f	f	t		2020-03-05 15:47:47.376503	2020-03-13 11:22:05.164183	51	297	Female	Full Member	2020-03-25	\N
1323	John D	t	t	t	t	t	f	f	f	Sad face, no Ice Bar!!!	2020-03-05 21:47:48.321529	2020-03-17 19:11:27.952933	2	295	Male	Full Member	2020-03-18	\N
1423	John D	t	t	t	t	f	f	f	t		2020-11-19 15:36:14.540033	2020-11-19 15:36:14.540033	2	305	Male	Full Member	2020-12-30	\N
1431	Michelle Comtois	f	f	t	t	f	f	f	t		2020-12-07 23:58:56.049393	2020-12-07 23:58:56.049393	5	305	Female	Full Member	2020-12-30	\N
1432	Michelle Comtois	f	t	t	t	f	f	f	t		2020-12-08 00:00:00.670317	2020-12-08 00:00:00.670317	5	299	Female	Full Member	2021-01-06	\N
1433	Michelle Comtois	f	f	t	t	f	f	f	t		2020-12-08 00:02:09.279954	2020-12-08 00:02:09.279954	5	310	Female	Full Member	2021-01-20	\N
1434	Michelle Comtois	f	t	t	t	f	f	f	t		2020-12-08 00:02:55.651896	2020-12-08 00:02:55.651896	5	300	Female	Full Member	2021-02-03	\N
1436	Matthew Beal	f	f	f	t	f	f	f	t	awgewg	2020-12-12 21:38:54.322753	2020-12-12 21:38:54.322753	50	299	Male	Full Member	2021-01-06	204363476W1030450
1438	Andrew Blohm	f	f	t	f	f	f	f	t		2020-12-16 01:52:11.230224	2020-12-16 01:52:11.230224	142	309	Male	Full Member	2020-12-16	4XN39890GS089393W
1441	Dan Shults	f	t	t	f	f	f	f	t	Party down.	2020-12-24 15:51:01.977395	2020-12-24 15:51:01.977395	20	299	Male	Full Member	2021-01-06	2P6565682F247092A
1442	Andrew Blohm	f	f	t	f	f	f	f	t	Staying Friday night	2020-12-29 23:19:17.079953	2020-12-29 23:19:17.079953	142	305	Male	Full Member	2020-12-30	1EJ89561J09804715
1444	Mike Ryan	f	t	t	t	t	f	f	t		2021-01-05 16:12:17.869276	2021-01-05 16:12:17.869276	14	299	Male	Full Member	2021-01-06	1XY49016A36815712
1447	Andrew Blohm	f	f	t	f	f	f	f	t	staying Friday night with guest Keith Metayer	2021-01-08 22:23:57.873692	2021-01-08 22:23:57.873692	142	311	Male	Full Member	2021-01-13	4CV58739NW839583A
1451	Mike Ryan	f	f	t	t	f	f	f	t		2021-01-19 15:41:31.421621	2021-01-19 15:41:31.421621	14	310	Male	Full Member	2021-01-20	84J410929N8045625
1488	Dane Araujo	f	f	t	t	f	f	f	t	New prospect. I will sponsor. May arrive before me on Friday. Spoke on the phone and seems like a nice guy. Used to stay at White Mtn Hostel, but it closed. -DS	2021-03-02 20:59:21.917443	2021-03-02 20:59:21.917443	20	301	Male	Guest	2021-03-03	22270936GH3031040
1490	John	t	t	t	t	f	f	f	t		2021-03-15 14:07:11.715501	2021-03-15 14:07:11.715501	2	317	Male	Full Member	2021-03-24	4E761807BV260303Y
1491	Dan Shults	f	t	t	f	f	f	f	t	Skiing Sunday River on Friday and presumably Wildcat on Sat.	2021-03-15 20:42:12.20227	2021-03-15 20:42:12.20227	20	316	Male	Full Member	2021-03-17	67L66548W7668634L
1492	Mike Ryan	f	f	t	t	t	f	f	t		2021-03-15 22:53:52.587892	2021-03-15 22:53:52.587892	14	316	Male	Full Member	2021-03-17	4SW396378H620791D
1493	Perry Frink	f	f	t	t	f	f	f	t		2021-03-18 22:17:20.191143	2021-03-18 22:17:20.191143	153	316	Male	Full Member	2021-03-17	0740218998990810C
1494	Andrew Blohm	f	f	t	t	f	f	f	t		2021-03-24 01:17:19.890311	2021-03-24 01:17:19.890311	142	317	Male	Full Member	2021-03-24	79R64378MV945021H
1495	Vicki Santarcangelo	f	t	t	t	f	f	f	t		2021-03-24 22:31:10.996639	2021-03-24 22:31:10.996639	3	317	Female	Full Member	2021-03-24	3TG97103GR937794L
1496	Kevin Buckley	f	f	t	t	f	f	f	t	Have vaccine will travel! 	2021-04-03 12:59:27.943649	2021-04-03 12:59:27.943649	33	318	Male	Full Member	2021-04-07	1A4600335K244292G
1497	Mirian Barrientos	f	f	t	t	f	f	f	t	More vaccinated travelers!	2021-04-03 13:00:46.165298	2021-04-03 13:00:46.165298	33	318	Female	Associate Member	2021-04-07	8NU73616S50694947
1498	Mark Buckley	f	f	f	t	f	f	f	t		2021-04-04 21:25:31.288967	2021-04-04 21:25:31.288967	22	318	Male	Full Member	2021-04-07	21M10647K10272426
1499	Nikki Shults	f	f	t	t	f	f	f	t	weekend fees - hiking to TR on Saturday	2021-04-06 19:39:04.943375	2021-04-06 19:39:04.943375	9	318	Female	Full Member	2021-04-07	1X55525284757983H
1500	Chris Bromery	f	f	t	t	f	f	f	t	Paid via PP	2021-04-07 16:28:08.768073	2021-04-07 16:28:08.768073	15	318	Male	Full Member	2021-04-07	5UB36409T24858535
1501	Michelle Comtois	f	f	t	t	f	f	f	t		2021-04-07 20:40:09.593729	2021-04-07 20:40:09.593729	5	318	Female	Full Member	2021-04-07	9EX92764W75421737
1502	Dan Shults	f	f	t	t	f	f	f	t	Hiking up to Tucks on Saturday! Not gonna ski it... just gonna watch other wackos ski it. \r\nMight do a few laps at Wildcat Sunday morning?	2021-04-07 22:08:25.544624	2021-04-07 22:08:25.544624	20	318	Male	Full Member	2021-04-07	3KM63931VG7100238
1503	Perry Frink	f	f	t	t	f	f	f	t		2021-04-08 22:15:24.044045	2021-04-08 22:15:24.044045	153	318	Male	Full Member	2021-04-07	0A296586MT070654F
1536	Test Reservation	f	f	f	f	f	f	t	t		2021-06-05 16:11:36.349835	2021-06-05 16:11:36.349835	50	320	Male	Full Member	2021-07-07	\N
1569	Dan Shults	f	f	t	t	f	f	f	t	Tubin'	2021-06-07 00:44:27.105359	2021-06-07 00:44:27.105359	20	353	Male	Full Member	2021-07-14	\N
1570	Nancy Murphy	f	f	t	t	f	f	f	t		2021-06-08 20:03:25.427043	2021-06-08 20:03:25.427043	5	353	Female	Full Member	2021-07-14	\N
1571	Jessica P	f	f	t	t	f	f	f	t		2021-06-08 20:04:04.330343	2021-06-08 20:04:04.330343	5	353	Female	Full Member	2021-07-14	\N
1572	Joan Apoldo	f	f	t	t	f	f	f	t	Guest of Jess P	2021-06-08 20:04:59.524935	2021-06-08 20:04:59.524935	5	353	Female	Guest	2021-07-14	\N
1573	Mike Ryan	f	f	t	t	f	f	f	t		2021-06-08 20:05:27.591406	2021-06-08 20:05:27.591406	5	353	Male	Full Member	2021-07-14	\N
1575	Michelle Comtois	f	t	t	t	f	f	f	t		2021-06-08 20:06:47.094299	2021-06-08 20:06:47.094299	5	353	Female	Full Member	2021-07-14	\N
1576	Matt Beal	f	f	t	t	f	f	f	t		2021-06-08 20:07:46.075528	2021-06-08 20:07:46.075528	5	353	Male	Full Member	2021-07-14	\N
1577	Michelle Comtois	f	f	t	t	f	f	f	t		2021-06-08 20:11:39.383369	2021-06-08 20:11:39.383369	5	354	Female	Full Member	2021-06-23	\N
1574	Debby Kruszewski	f	f	t	t	f	f	f	t	Guest of Jess P	2021-06-08 20:06:15.731589	2021-06-08 20:15:10.777469	5	353	Female	Guest	2021-07-14	\N
1579	Alana Mccarthy 	f	t	t	t	f	f	f	f	#Tubing	2021-06-08 20:32:16.795167	2021-06-08 20:32:16.795167	23	353	Female	Full Member	2021-07-14	\N
1580	Tommy Wall	f	t	t	t	f	f	f	f	Tubing 	2021-06-08 20:32:58.494111	2021-06-08 20:32:58.494111	23	353	Male	Full Member	2021-07-14	\N
1581	Nikki Shults	f	f	t	t	f	f	f	f	Please someone else order the pizza. 	2021-06-08 20:38:17.791688	2021-06-08 20:38:17.791688	9	353	Female	Full Member	2021-07-14	\N
1582	Chris B	f	f	t	t	f	f	f	t		2021-06-08 20:40:05.630422	2021-06-08 20:40:05.630422	5	353	Male	Full Member	2021-07-14	\N
1583	Mary Ann Yacuzzo	f	f	t	t	f	f	f	f	Guest of Chris B - Tubing Weekend!  	2021-06-09 03:41:45.665288	2021-06-09 03:41:45.665288	15	353	Female	Guest	2021-07-14	\N
1584	Nancy Murphy	f	f	t	t	f	f	f	t	Work weekend	2021-06-09 12:29:14.162024	2021-06-09 12:29:14.162024	51	354	Female	Full Member	2021-06-23	\N
1585	Stephenie Hou	f	f	t	t	f	f	f	f	Tubing! Guest of Nikki Shults. Paid. 	2021-06-11 14:05:05.379298	2021-06-11 14:18:25.161802	9	353	Female	Guest	2021-07-14	\N
1586	Mark Buckley	f	f	t	t	f	f	f	t	Tubing! 	2021-06-13 09:20:52.668238	2021-06-13 09:20:52.668238	22	353	Male	Full Member	2021-07-14	\N
1587	Hiliary Buckley	f	f	t	t	f	f	f	t		2021-06-13 09:21:17.708311	2021-06-13 09:21:17.708311	22	353	Female	Associate Member	2021-07-14	\N
1588	Brendan Halpin	f	f	t	t	f	f	f	t		2021-06-13 09:21:39.360851	2021-06-13 09:21:39.360851	22	353	Male	Guest	2021-07-14	\N
1589	Kristen Chamberlain	f	f	t	t	f	f	f	t		2021-06-13 09:22:01.32536	2021-06-13 09:22:01.32536	22	353	Female	Guest	2021-07-14	\N
1590	Chris Bromery	f	f	t	t	f	f	f	t	Work Weekend #2	2021-06-13 23:29:40.762603	2021-06-13 23:29:40.762603	15	354	Male	Full Member	2021-06-23	\N
1591	Sara Delaney	f	f	t	t	f	f	f	f		2021-06-14 00:02:00.756209	2021-06-14 00:02:00.756209	5	353	Female	Associate Member	2021-07-14	\N
1592	Jessica P	f	f	f	t	t	t	f	t	work weekend #2 because I love to clean haha (driving up early Saturday morning), probably a hike on Sunday	2021-06-15 19:28:35.721665	2021-06-15 19:28:35.721665	137	354	Female	Full Member	2021-06-23	\N
1593	Doug mayo	f	f	f	f	t	t	t	t	After work weekend for hiking and hello NH	2021-06-16 00:35:25.416912	2021-06-16 00:35:25.416912	12	355	Male	Full Member	2021-06-16	\N
1594	Megan mayo	f	f	f	f	t	t	t	t	Hiking and walking around	2021-06-16 00:36:05.693457	2021-06-16 00:36:05.693457	12	355	Female	Full Member	2021-06-16	\N
1603	test	t	f	f	f	f	f	f	t	ignore this test	2021-06-22 02:42:15.983859	2021-06-22 02:42:15.983859	20	354	Male	Full Member	2021-06-23	\N
1596	Dorothy P	f	f	t	f	f	f	f	t	guest of Jessica P	2021-06-16 15:57:35.575129	2021-06-16 15:57:35.575129	137	355	Female	Guest	2021-06-16	\N
1595	Jessica P	f	f	t	f	f	f	f	t	Sugar Hill lupine viewing with Mom on Friday, 6/18, might stay 6/19 too. I will pay guest fees over work weekend #2.	2021-06-16 15:53:41.93199	2021-06-16 15:59:37.82308	137	355	Female	Full Member	2021-06-16	\N
1597	Vicki Santarcangelo	f	f	t	t	f	f	f	t	Work Weekend!	2021-06-17 14:36:52.4271	2021-06-17 14:36:52.4271	3	354	Female	Full Member	2021-06-23	\N
1598	Dane Araujo 	f	f	t	t	f	f	f	t		2021-06-17 16:08:10.510359	2021-06-17 16:08:10.510359	5	353	Male	Full Member	2021-07-14	\N
1599	Andrew Blohm	f	f	t	t	f	f	f	t		2021-06-19 02:59:42.571357	2021-06-19 02:59:42.571357	142	354	Male	Full Member	2021-06-23	\N
1600	Corey Landsman	f	f	t	t	f	f	f	t		2021-06-19 03:00:22.522382	2021-06-19 03:00:22.522382	142	354	Female	Guest	2021-06-23	\N
1601	Shana Biletch	f	f	t	t	f	f	f	t	Work weekend	2021-06-19 15:16:42.20609	2021-06-19 15:16:42.20609	57	354	Female	Full Member	2021-06-23	\N
1602	Matthew Beal	f	f	t	t	f	f	f	t	Tubing	2021-06-22 02:02:21.9628	2021-06-22 02:02:21.9628	50	353	Male	Full Member	2021-07-14	\N
1604	John D	f	t	t	t	t	f	f	t	Cut the grass....Work Weekend cheerleader. AT trail magic.	2021-06-22 17:15:31.766296	2021-06-22 17:15:31.766296	2	354	Male	Full Member	2021-06-23	\N
1605	Mike Ryan	f	f	f	t	t	t	f	t	Maybe	2021-06-22 21:20:40.374461	2021-06-22 21:20:40.374461	14	354	Male	Full Member	2021-06-23	\N
1606	Brian Pfaffinger	f	f	f	f	f	f	f	f	Floating and Dinner a maybe	2021-06-22 21:23:02.262257	2021-06-22 21:23:02.262257	14	353	Male	Guest	2021-07-14	\N
1607	Jess Pfaffinger	f	f	f	f	f	f	f	f	Floating and maybe dinner	2021-06-22 21:24:01.429217	2021-06-22 21:24:01.429217	14	353	Female	Guest	2021-07-14	\N
1608	Perry Frink	f	f	t	t	f	f	f	t	Work weekend 	2021-06-24 12:11:30.112303	2021-06-24 12:11:30.112303	153	354	Male	Full Member	2021-06-23	\N
1609	kurt yang	f	t	t	t	t	t	f	t	Maybe	2021-06-25 14:15:19.901394	2021-06-25 14:15:19.901394	10	356	Male	Full Member	2021-06-30	\N
1610	John D	f	f	t	t	t	t	t	t	Unsure, but want to get it on the books just in case.	2021-06-30 15:31:04.609282	2021-06-30 15:31:04.609282	2	356	Male	Full Member	2021-06-30	\N
1611	John D	t	t	t	t	t	f	f	t	Unsure but want to get it on the books just in case.	2021-06-30 15:31:45.794112	2021-06-30 15:31:45.794112	2	320	Male	Full Member	2021-07-07	\N
1612	Kevin Buckley 	f	f	t	t	f	f	f	f		2021-07-01 20:43:22.641404	2021-07-01 20:43:22.641404	5	353	Male	Full Member	2021-07-14	\N
1613	Mirian Barientos	f	f	t	t	f	f	f	f		2021-07-01 20:44:41.844481	2021-07-01 20:44:41.844481	5	353	Female	Associate Member	2021-07-14	\N
1614	Whitney Factor	f	f	t	t	f	f	f	f		2021-07-01 20:46:34.078771	2021-07-01 20:46:34.078771	5	353	Female	Guest	2021-07-14	\N
1615	Laurel Galbraith	f	f	t	t	f	f	f	f	Friend of Sara Delaney	2021-07-01 23:11:49.868888	2021-07-01 23:11:49.868888	5	353	Female	Guest	2021-07-14	\N
1616	Lori Lavoie 	f	f	t	t	f	f	f	f		2021-07-02 23:48:42.995333	2021-07-02 23:48:42.995333	5	353	Female	Associate Member	2021-07-14	\N
1617	Marissa Pearson	f	f	t	t	f	f	f	f	tubing! guest of Nikki. from bunk assignments, please put in same room as stephenie hou	2021-07-03 14:48:59.378074	2021-07-03 14:48:59.378074	9	353	Female	Guest	2021-07-14	\N
1618	LORI LAVOIE	f	t	f	f	f	t	t	t		2021-07-03 17:18:50.724645	2021-07-03 17:21:07.488133	44	353	Female	Associate Member	2021-07-14	\N
1619	Doug Mayo 	t	f	f	f	f	f	f	t	Will be staying Monday and Tuesday and of this week but reservations were closed for those days, thank you 	2021-07-04 00:51:03.074999	2021-07-04 00:51:03.074999	12	320	Male	Full Member	2021-07-07	\N
1620	Megan Mayo 	t	f	f	f	f	f	f	t	Same as what Doug wrote, thank you 	2021-07-04 00:52:13.180769	2021-07-04 00:52:13.180769	12	320	Female	Full Member	2021-07-07	\N
1652	Kurt Yang	f	f	t	f	t	f	f	t	I have my own camping event around North Conway.  Might stay in Club for Friday night. Prefer Hog Haven. Thanks.	2021-07-06 14:48:11.969879	2021-07-06 14:48:11.969879	10	353	Male	Full Member	2021-07-14	\N
3230	B. Halpin	f	f	t	t	f	f	f	f		2024-01-10 17:06:01.207204	2024-01-10 17:06:01.207204	14	540	Male	Guest	2024-01-17	\N
1653	Justine Labbe	f	f	t	t	f	f	f	f	guest of Nikki. Please put in room with Stephenie Hou	2021-07-08 18:38:21.31681	2021-07-08 18:38:21.31681	9	353	Female	Guest	2021-07-14	\N
1654	Kevin Allenson	f	f	t	t	f	f	f	t	tubing. guest of nikki	2021-07-08 18:39:00.407913	2021-07-08 18:39:00.407913	9	353	Male	Guest	2021-07-14	\N
1656	Mercedes Thompson	f	f	t	t	f	f	f	f	Guest of Nikki. Same room as Stephenie Hou 	2021-07-10 16:01:36.436169	2021-07-10 16:01:36.436169	9	353	Female	Guest	2021-07-14	\N
1657	Kevin Buckley	t	t	t	t	t	t	f	t	Tubing and Hiking!	2021-07-11 19:55:53.95769	2021-07-11 19:55:53.95769	33	353	Male	Full Member	2021-07-14	\N
1655	Krishna Bykadi	f	f	t	t	f	f	f	t	Nice guy- has attended volleyball and tubing in the past. Paid via website. - DS	2021-07-08 23:16:58.671543	2021-07-13 02:29:59.611704	20	353	Male	Guest	2021-07-14	\N
1658	Dane Araujo	f	f	t	t	f	f	f	t		2021-07-13 14:14:10.824447	2021-07-13 14:14:10.824447	154	353	Male	Full Member	2021-07-14	\N
1659	Dane Araujo	f	f	t	t	f	f	f	t	Tubing - Paid	2021-07-13 14:14:34.657286	2021-07-13 14:14:34.657286	154	353	Male	Full Member	2021-07-14	\N
1660	Perry Frink	t	t	f	f	f	f	f	t	Maybe	2021-07-20 03:14:48.852269	2021-07-20 03:14:48.852269	153	357	Male	Full Member	2021-07-21	\N
1661	John	f	t	t	t	t	f	f	t		2021-07-27 18:10:19.393363	2021-07-27 18:10:19.393363	2	358	Male	Full Member	2021-07-28	\N
1662	KBuck 	t	t	t	t	t	t	t	t	Hiking around the hills 	2021-08-11 12:42:57.926879	2021-08-11 12:42:57.926879	33	360	Male	Full Member	2021-08-11	\N
1663	Nancy Murphy	f	f	t	t	f	f	f	t		2021-08-11 17:47:07.719903	2021-08-11 17:47:07.719903	51	360	Female	Full Member	2021-08-11	\N
1664	Dane Araujo	f	f	t	t	f	f	f	t	Sorry for the delay, meant to do this on Wednesday, please let me know if there are any issues. Thank you!	2021-08-12 12:08:34.02527	2021-08-12 12:08:34.02527	154	360	Male	Full Member	2021-08-11	\N
1665	Kurt Yang	f	f	t	t	f	f	f	t	just by myself	2021-08-16 15:45:05.8633	2021-08-16 15:45:05.8633	10	361	Male	Full Member	2021-08-18	\N
1667	Kurt Yang	f	f	f	f	t	t	f	t		2021-08-23 19:17:53.107127	2021-08-23 19:17:53.107127	10	363	Male	Full Member	2021-09-01	\N
1669	T Wall	f	f	t	t	f	f	f	f		2021-08-25 12:21:58.496437	2021-08-25 12:21:58.496437	21	362	Male	Full Member	2021-09-08	\N
1670	Alana Mc	f	f	t	t	f	f	f	f		2021-08-25 12:22:39.153078	2021-08-25 12:22:39.153078	21	362	Female	Full Member	2021-09-08	\N
1702	Michelle Comtois	f	f	t	t	f	f	f	t		2021-08-27 19:43:45.63957	2021-08-27 19:43:45.63957	5	362	Female	Full Member	2021-09-08	\N
1703	Nikki Shults	f	t	t	t	f	f	f	t	coming to WIN	2021-08-27 20:59:57.025732	2021-08-27 20:59:57.025732	9	362	Female	Full Member	2021-09-08	\N
1704	ken simon	f	f	t	t	f	f	f	t		2021-08-29 15:49:26.106195	2021-08-29 15:49:26.106195	45	362	Male	Full Member	2021-09-08	\N
1705	Dan Shults	f	t	t	t	f	f	f	f	Balls. to. the. face.	2021-08-30 13:52:50.69274	2021-08-30 13:52:50.69274	20	362	Male	Full Member	2021-09-08	\N
1706	Jess P	f	f	t	t	f	f	f	t	cheering fan only!  Preference for Beth's bed please. 	2021-08-30 17:15:53.713587	2021-08-30 17:15:53.713587	137	362	Female	Full Member	2021-09-08	\N
1804	Bob Waddell	t	t	f	f	t	t	t	t		2021-11-30 11:51:43.070431	2021-12-29 16:44:24.657741	209	378	Male	Full Member	2021-12-29	\N
1707	Paul Fogel	f	f	f	t	f	f	f	f	Vball weekend and buttermilk drinking contest 	2021-08-30 20:44:57.025793	2021-08-30 20:45:09.864702	34	362	Male	Associate Member	2021-09-08	\N
1708	John D	f	t	t	t	t	t	f	t	Coming up for some fresh air and fridge clean out.	2021-08-31 12:56:19.328957	2021-08-31 12:56:19.328957	2	363	Male	Full Member	2021-09-01	\N
1666	Nancy Murphy	f	f	t	t	f	f	f	f	Volleyball weekend	2021-08-23 12:18:06.982037	2021-09-07 12:47:36.565606	51	362	Female	Full Member	2021-09-08	\N
1709	Kurt Yang	f	f	t	t	t	f	f	t		2021-09-07 15:23:14.4681	2021-09-07 15:23:14.4681	10	362	Male	Full Member	2021-09-08	\N
1710	Kevin Buckley	f	f	t	t	f	f	f	t	Hiking, hope to be back for cookout 	2021-09-07 22:17:30.291816	2021-09-07 22:17:30.291816	33	362	Male	Full Member	2021-09-08	\N
1711	Mirian Barrientos 	f	f	t	t	f	f	f	t	No Vball	2021-09-07 22:19:39.822489	2021-09-07 22:19:39.822489	33	362	Female	Associate Member	2021-09-08	\N
1712	Sara Delaney	f	f	t	t	f	f	f	f	Hiking on Saturday; will be back in time for dinner	2021-09-08 13:38:57.536145	2021-09-08 13:38:57.536145	31	362	Female	Associate Member	2021-09-08	\N
1812	Tyler D 	f	f	t	f	f	f	f	t	Perry F guest - payed 	2021-12-01 16:01:57.969742	2021-12-01 16:03:39.342884	153	375	Male	Guest	2021-12-01	\N
1713	Andrew Blohm	f	f	t	t	f	f	f	t	Highland games at Loon only staying Friday night.  	2021-09-12 16:31:49.590004	2021-09-14 01:15:00.8074	142	365	Male	Full Member	2021-09-15	\N
1715	Dan Shults	f	f	t	t	f	f	f	t	Twerk Weekend	2021-09-14 13:42:32.504605	2021-09-14 13:42:32.504605	20	366	Male	Full Member	2021-10-27	\N
1716	Nancy Murphy	f	f	t	t	f	f	f	t	Work Weekend	2021-09-15 14:51:14.701029	2021-09-15 14:51:14.701029	51	364	Female	Full Member	2021-09-29	\N
1718	Perry F	f	f	t	t	f	f	f	t	Work weekend	2021-09-19 15:22:34.340822	2021-09-19 15:22:34.340822	153	364	Male	Full Member	2021-09-29	\N
1719	Douglas Mayo	f	f	t	t	f	f	f	t	work weekend	2021-09-20 11:02:36.757267	2021-09-20 11:02:36.757267	12	364	Male	Full Member	2021-09-29	\N
1720	megan mayo	f	f	t	t	f	f	f	t	work weekend, Getintoit	2021-09-20 11:03:25.548164	2021-09-20 11:03:25.548164	12	364	Female	Full Member	2021-09-29	\N
1721	Dane Araujo	f	f	t	t	f	f	f	t	Work Weekend	2021-09-22 15:42:40.19047	2021-09-22 15:42:40.19047	154	366	Male	Full Member	2021-10-27	\N
1722	Kevin Buckley 	f	f	t	t	f	f	f	t	Finishing the 48!	2021-09-22 23:05:38.985238	2021-09-22 23:05:38.985238	33	367	Male	Full Member	2021-09-22	\N
1723	Mirian Barrientos 	f	f	t	t	f	f	f	t		2021-09-22 23:06:18.4022	2021-09-22 23:06:18.4022	33	367	Female	Associate Member	2021-09-22	\N
1724	Andrew Blohm	f	f	t	t	f	f	f	t	hiking probably	2021-09-23 02:16:18.355209	2021-09-23 02:16:18.355209	142	367	Male	Full Member	2021-09-22	\N
1725	Michelle Comtois	f	f	t	t	f	f	f	t		2021-09-24 10:13:09.990435	2021-09-24 10:13:09.990435	5	366	Female	Full Member	2021-10-27	\N
1668	Kurt Yang	f	t	f	f	f	f	f	t	Only Thursday is possible 	2021-08-23 19:18:58.952356	2021-09-27 02:13:39.005119	10	364	Male	Full Member	2021-09-29	\N
1726	Kurt Yang	f	f	t	t	t	t	f	t	Go kayak camping for couple nights	2021-09-27 19:54:20.240624	2021-09-27 19:54:20.240624	10	368	Male	Full Member	2021-10-06	\N
1727	Kurt Yang	f	f	t	t	t	f	f	t	work weekend	2021-09-27 19:55:39.068158	2021-09-27 19:55:39.068158	10	366	Male	Full Member	2021-10-27	\N
1728	Shana Biletch	f	f	t	t	f	f	f	t	Spooky work weekend 	2021-09-28 23:50:32.282982	2021-09-28 23:50:32.282982	57	366	Female	Full Member	2021-10-27	\N
1729	THOMAS WALL	f	f	t	t	t	f	f	t		2021-10-06 23:04:01.163804	2021-10-06 23:04:01.163804	21	368	Male	Full Member	2021-10-06	\N
1730	Mike Ryan	f	f	t	t	f	f	f	t	Motorcycle Weekend 	2021-10-06 23:37:08.922347	2021-10-06 23:37:08.922347	14	368	Male	Full Member	2021-10-06	\N
1731	B. Halpin	f	f	t	t	f	f	f	t	Motorcycle Weekend 	2021-10-06 23:38:00.256401	2021-10-06 23:38:00.256401	14	368	Male	Guest	2021-10-06	\N
1732	Nick Cole	f	f	t	t	f	f	f	t	Motorcycle Weekend	2021-10-06 23:39:00.143095	2021-10-06 23:39:00.143095	14	368	Male	Guest	2021-10-06	\N
1733	Joe Griffin 	f	f	f	t	f	f	f	t	Motorcycle Weekend - Maybe	2021-10-06 23:40:47.852715	2021-10-06 23:40:47.852715	14	368	Male	Guest	2021-10-06	\N
1734	Chris Bromery	f	f	f	t	f	f	f	t	MC Weekend - Poss	2021-10-06 23:53:03.866821	2021-10-06 23:53:03.866821	15	368	Male	Full Member	2021-10-06	\N
1735	Kurt Yang	f	f	t	t	f	f	f	t		2021-10-07 17:38:56.650315	2021-10-07 17:38:56.650315	10	369	Male	Full Member	2021-10-13	\N
1736	John D	f	t	t	t	t	f	f	t	Tentative plans	2021-10-13 14:41:44.598598	2021-10-13 14:41:44.598598	2	369	Male	Full Member	2021-10-13	\N
1737	John D	f	t	t	t	t	f	f	t	Maks Pep Rally	2021-10-13 14:42:47.742139	2021-10-13 14:42:47.742139	2	370	Male	Full Member	2021-10-20	\N
1738	John D	f	t	t	t	t	f	f	t	Work Weekend here I come.	2021-10-13 16:25:12.419826	2021-10-13 16:25:12.419826	2	366	Male	Full Member	2021-10-27	\N
1739	Vicki Santarcangelo 	f	t	t	t	t	f	f	t		2021-10-13 23:46:15.16618	2021-10-13 23:46:15.16618	3	369	Female	Full Member	2021-10-13	\N
1740	Vicki Santarcangelo 	f	t	t	t	t	f	f	t	Work Weekend	2021-10-13 23:47:44.313813	2021-10-13 23:47:44.313813	3	366	Female	Full Member	2021-10-27	\N
1741	Bob Waddell 	f	f	t	t	f	f	f	t	Bob is a past member looking to rejoin and is coming to meet people and do work weekend 	2021-10-14 18:59:21.275407	2021-10-14 18:59:21.275407	5	366	Male	Guest	2021-10-27	\N
1742	Nikki Shults	f	t	t	t	f	f	f	t	Work weekend. Will come up Thurs or Fri - unsure. 	2021-10-14 19:29:42.217674	2021-10-14 19:29:42.217674	9	366	Female	Full Member	2021-10-27	\N
1743	Bob Waddell	f	f	t	t	f	f	f	t	Rejoining. Membership has already been paid. Up for the work weekend	2021-10-15 11:12:49.697638	2021-10-15 11:12:49.697638	209	366	Male	Full Member	2021-10-27	\N
1744	Dane Araujo	f	f	t	t	f	f	f	t		2021-10-20 18:13:43.206282	2021-10-20 18:13:43.206282	154	370	Male	Full Member	2021-10-20	\N
1777	Nung	f	f	t	t	f	f	f	t	Work weekend!!!	2021-10-22 17:09:15.839695	2021-10-22 17:09:15.839695	7	366	Male	Full Member	2021-10-27	\N
3431	B. Halpin	f	f	t	t	f	f	f	f		2024-03-05 13:36:44.201135	2024-03-05 13:36:44.201135	14	546	Male	Guest	2024-03-06	\N
1778	Mike Ryan	f	t	t	t	t	f	f	t	Work Weekend	2021-10-25 15:10:38.389865	2021-10-25 15:10:38.389865	14	366	Male	Full Member	2021-10-27	\N
1717	Jessica P	f	t	t	t	t	f	f	t	work weekend	2021-09-16 12:51:00.316595	2021-10-25 17:58:29.925176	137	366	Female	Full Member	2021-10-27	\N
1779	Andrew Blohm	f	f	t	t	f	f	f	t	Work weekend	2021-10-26 00:33:08.340517	2021-10-26 00:33:08.340517	142	366	Male	Full Member	2021-10-27	\N
1780	Corey Landsman 	f	f	t	t	f	f	f	t	Work weekend 	2021-10-26 00:33:43.23273	2021-10-26 00:33:43.23273	142	366	Female	Full Member	2021-10-27	\N
1781	Doug Kinkenon 	f	f	f	t	f	f	f	t	Shana’s guest (boyfriend)	2021-10-28 15:15:39.758831	2021-10-28 15:15:39.758831	57	366	Male	Guest	2021-10-27	\N
1782	Vicki Santarcangelo 	f	f	t	t	f	f	f	t	Girls weekend 	2021-10-31 00:42:26.540425	2021-10-31 00:42:26.540425	3	371	Female	Full Member	2021-11-10	\N
1784	Michelle Comtois	f	f	t	t	f	f	f	t		2021-11-02 01:45:51.519683	2021-11-02 01:45:51.519683	5	371	Female	Full Member	2021-11-10	\N
1785	Alana M	f	f	t	t	f	f	f	t	Girls weekend!	2021-11-04 11:36:03.127027	2021-11-04 11:36:03.127027	23	371	Female	Full Member	2021-11-10	\N
1786	Nikki Shults	f	f	t	t	f	f	f	f	Girls weekend! Count me in for cider co please	2021-11-04 13:39:42.17602	2021-11-04 13:39:42.17602	9	371	Female	Full Member	2021-11-10	\N
1787	Jessica P	f	f	t	t	f	f	f	f	Can't wait for Cider Co dinner! 	2021-11-04 16:59:40.462091	2021-11-04 16:59:40.462091	137	371	Female	Full Member	2021-11-10	\N
1788	Jess Biletch	f	f	t	t	f	f	f	f	Shana’s sister	2021-11-05 01:04:30.47247	2021-11-05 01:04:30.47247	57	371	Female	Guest	2021-11-10	\N
1783	Shana Biletch	f	f	t	t	f	f	f	f	Girls’ Weekend! 	2021-10-31 00:46:58.447347	2021-11-05 01:05:50.773508	57	371	Female	Full Member	2021-11-10	\N
1789	Bob waddell	f	f	t	t	t	f	f	t		2021-11-08 10:09:28.098725	2021-11-08 10:09:28.098725	209	371	Male	Full Member	2021-11-10	\N
1790	Bob waddell	f	f	t	t	t	f	f	t	Hiking and Skiing	2021-11-08 10:11:49.901334	2021-11-08 10:11:49.901334	209	372	Male	Full Member	2021-11-17	\N
1792	Sara Delaney	f	f	t	t	f	f	f	f	Girls' weekend, woohoo!	2021-11-08 16:39:15.440179	2021-11-08 16:39:15.440179	31	371	Female	Associate Member	2021-11-10	\N
1793	Mirian Barrientos 	f	f	t	t	f	f	f	t	Still on fence but probably 	2021-11-11 00:25:51.992422	2021-11-11 00:25:51.992422	33	371	Female	Associate Member	2021-11-10	\N
1794	LORI LAVOIE	f	f	t	t	f	f	f	t		2021-11-11 01:30:44.298122	2021-11-11 01:30:44.298122	44	371	Female	Associate Member	2021-11-10	\N
1795	Kurt Yang	f	f	t	t	f	f	f	t		2021-11-16 18:43:34.830313	2021-11-16 18:43:34.830313	10	372	Male	Full Member	2021-11-17	\N
1796	Andrew Blohm	f	f	t	t	f	f	f	t	Staying nearby at an air B&B for a friend’s birthday.  Will be stopping by at some point to pick up things I forgot the last time up.  Not staying overnight.	2021-11-17 03:13:55.465393	2021-11-17 03:13:55.465393	142	372	Male	Full Member	2021-11-17	\N
1791	Bob waddell	f	f	f	t	t	t	t	t	Hike and Skiing 	2021-11-08 10:13:16.254259	2021-11-18 12:14:26.677219	209	373	Male	Full Member	2021-11-24	\N
1800	Nancy Murphy	f	f	t	t	f	f	f	f		2021-11-28 21:27:54.77356	2021-11-28 21:27:54.77356	51	376	Female	Full Member	2021-12-08	\N
1799	Bob Waddell	f	f	t	t	t	f	t	f	Hiking/skiing/pong	2021-11-18 12:20:30.294691	2021-11-29 12:35:58.518295	209	376	Male	Full Member	2021-12-08	\N
1802	Dan Shults	f	f	t	t	f	f	f	f	Okay-est weekend!	2021-11-29 17:55:42.754161	2021-11-29 17:55:42.754161	20	376	Male	Full Member	2021-12-08	\N
1803	Chris Bromery	f	f	t	t	f	f	f	f	Okayest Weekend!!!!!!!!! 	2021-11-29 19:28:10.147047	2021-11-29 19:28:10.147047	15	376	Male	Full Member	2021-12-08	\N
1798	Bob Waddell	f	f	t	t	t	t	t	t	Skiing/Pong tournament	2021-11-18 12:18:26.451381	2021-11-30 11:49:02.209746	209	375	Male	Full Member	2021-12-01	\N
1807	Mike Ryan	f	f	t	t	f	f	f	t	So it begins!	2021-11-30 18:17:41.903945	2021-11-30 18:17:41.903945	14	375	Male	Full Member	2021-12-01	\N
1808	Mike Ryan	f	f	t	t	t	f	f	f	Party!!!	2021-11-30 18:22:12.502939	2021-11-30 18:22:12.502939	14	376	Male	Full Member	2021-12-08	\N
1811	Perry F	f	f	t	t	f	f	f	t	Friday, maybe Saturday 	2021-12-01 16:00:47.752878	2021-12-01 16:00:47.752878	153	375	Male	Full Member	2021-12-01	\N
1814	Michelle Comtois	f	f	t	t	f	f	f	t		2021-12-02 11:38:45.628579	2021-12-02 11:38:45.628579	5	376	Female	Full Member	2021-12-08	\N
1815	Alana McC	f	f	t	t	f	f	f	f	Okay weekend 	2021-12-02 17:02:40.173556	2021-12-02 17:02:40.173556	23	376	Female	Full Member	2021-12-08	\N
1816	Jess P	f	f	t	t	f	f	f	t		2021-12-02 23:09:06.411101	2021-12-02 23:09:06.411101	137	377	Female	Full Member	2021-12-15	\N
1817	Nikki Shults	f	t	t	t	f	f	f	f	Okayest Weekend	2021-12-04 01:44:24.562798	2021-12-04 01:44:24.562798	9	376	Female	Full Member	2021-12-08	\N
1818	T Wall	f	f	t	t	f	f	f	f	Party!	2021-12-04 19:12:14.235084	2021-12-04 19:12:27.476407	23	376	Male	Full Member	2021-12-08	\N
1819	Kevin Buckley	f	f	t	t	f	f	f	f	Okayyyyyy	2021-12-06 00:23:56.453628	2021-12-06 00:24:03.193195	33	376	Male	Full Member	2021-12-08	\N
1820	Mirian Barrientos 	f	f	t	t	f	f	f	f		2021-12-06 00:24:47.034037	2021-12-06 00:27:57.563163	33	376	Female	Associate Member	2021-12-08	\N
1821	Perry Frink	f	f	t	t	f	f	f	f		2021-12-06 20:53:03.070645	2021-12-06 20:53:03.070645	153	376	Male	Full Member	2021-12-08	\N
1822	David Terwiliger	f	f	t	f	f	f	f	t	Prospect from Meet & Greet. Friday night only. I told him $40 would suffice since he's not going to party or dinner. - DS	2021-12-08 17:09:56.199779	2021-12-08 17:09:56.199779	20	376	Male	Guest	2021-12-08	\N
1823	Scott James	f	f	t	t	f	f	f	f	Former Schusser looking to change clubs. You've seen him at EICSL parties for years. 	2021-12-08 17:11:23.880352	2021-12-08 17:11:23.880352	20	376	Male	Guest	2021-12-08	\N
1824	Rachel Crateau	f	f	t	t	f	f	f	f	Scott James' counterpart. Said she will pay via check. - DS	2021-12-08 17:12:23.255077	2021-12-08 17:12:23.255077	20	376	Female	Guest	2021-12-08	\N
1825	Jessica Martinez	f	f	f	t	t	f	f	f	Prospect from Meet & Greet. She will arrive Saturday afternoon, and would like to stay until Monday AM if possible. Says no worries if we don't have someone to host thru Mon. - DS	2021-12-08 17:13:54.316254	2021-12-08 17:13:54.316254	20	376	Female	Guest	2021-12-08	\N
1826	Noah Jick	f	f	t	t	f	f	f	f	I don't know who this person is... but they filled out the RSVP form. I have reached out to them for info... but let's plan for them to be there unless I put the kibosh on it. -DS	2021-12-08 17:18:13.972315	2021-12-08 17:18:13.972315	20	376	Male	Guest	2021-12-08	\N
1827	Carly Soares	f	f	t	t	f	f	f	f	Came to the Meet & Greet. Seemed excited about the club. - DS	2021-12-08 17:20:30.990748	2021-12-08 17:20:30.990748	20	376	Female	Guest	2021-12-08	\N
1828	Trevor Rowe	f	f	t	t	f	f	f	f	Came to the meet and greet. Request to be put in Wildcat Bedroom with his girlfriend, Rachel Crum. - DS	2021-12-08 17:21:58.703036	2021-12-08 17:21:58.703036	20	376	Male	Guest	2021-12-08	\N
1829	Rachel Crum	f	f	t	t	f	f	f	f	Girlfriend of Trevor Rowe, who was at the Meet & Greet. Requests to be in Wildcat with him. - DS	2021-12-08 17:22:51.029	2021-12-08 17:22:51.029	20	376	Female	Guest	2021-12-08	\N
1830	Carolina Caprile	f	f	t	t	f	f	f	f	Emailed a bunch with her in 2020. She was very interested in the club before the shit hit the fan. Glad she's back on the hook! - DS	2021-12-08 17:25:36.712694	2021-12-08 17:25:44.588855	20	376	Female	Guest	2021-12-08	\N
1831	Dane Araujo	f	f	t	t	f	f	f	t	Dull skis and frail knees	2021-12-08 17:43:12.120902	2021-12-08 17:43:12.120902	154	377	Male	Full Member	2021-12-15	\N
1833	Bryan Kirk	f	f	t	t	t	f	f	t		2021-12-08 23:32:10.523161	2021-12-08 23:32:10.523161	219	376	Male	Full Member	2021-12-08	\N
1810	Mike Ryan	t	t	t	t	t	f	f	t	Sunday night is a maybe	2021-11-30 18:24:43.633099	2021-12-21 22:18:36.2218	14	378	Male	Full Member	2021-12-29	\N
1805	Bob Waddell	f	t	t	t	t	f	t	t		2021-11-30 11:53:09.175528	2021-12-15 18:23:39.822207	209	379	Male	Full Member	2021-12-22	\N
1813	Jess P	t	t	t	t	f	f	f	t		2021-12-02 03:09:53.223522	2021-12-28 21:27:31.487964	137	378	Female	Full Member	2021-12-29	\N
1806	Bob Waddell	t	t	t	t	t	f	t	t		2021-11-30 11:54:28.662706	2021-12-15 18:24:58.542371	209	380	Male	Full Member	2022-01-12	\N
1801	Bob Waddell	f	t	t	t	t	f	t	t	Out hiking	2021-11-28 22:36:19.082822	2021-12-15 18:27:34.471717	209	377	Male	Full Member	2021-12-15	\N
1832	Kurt Yang	f	f	f	t	t	f	f	t	Only Saturday night and Sunday night. Very late on Saturday.  Prefer Hog Haven room. 	2021-12-08 22:39:01.04211	2021-12-08 22:42:35.096855	10	376	Male	Full Member	2021-12-08	\N
2177	Shomik (?)	f	f	t	f	f	f	f	t	Friend of Peter W.	2022-03-03 03:24:43.72007	2022-03-03 03:24:43.72007	20	420	Male	Guest	2022-03-02	\N
1834	Zach Basset	f	f	t	t	f	f	f	t	Emailed back and forth with him a bit. First time visit. -DS	2021-12-09 14:14:43.979696	2021-12-09 14:14:43.979696	20	376	Male	Guest	2021-12-08	\N
1835	Mike Folding	f	f	f	t	f	f	f	t	Hiking Guest of Bob W	2021-12-10 01:02:49.077679	2021-12-10 01:03:22.880483	209	377	Male	Guest	2021-12-15	\N
1836	Alecia Emrich	f	f	f	t	f	f	f	t	Hiking guest of Bob W	2021-12-10 01:04:27.948158	2021-12-10 01:04:27.948158	209	377	Female	Guest	2021-12-15	\N
1837	Catherine Eckroth	f	f	f	t	f	f	f	t	Hiking Guest of Bob W	2021-12-10 01:06:03.136291	2021-12-10 01:06:03.136291	209	377	Female	Guest	2021-12-15	\N
1809	Mike Ryan	f	t	t	t	f	f	f	t	Thursday a maybe 	2021-11-30 18:23:08.726818	2021-12-13 03:58:44.609912	14	377	Male	Full Member	2021-12-15	\N
1838	Kurt Yang	f	f	t	t	t	f	f	t		2021-12-13 17:38:02.877119	2021-12-13 17:38:02.877119	10	379	Male	Full Member	2021-12-22	\N
1839	Kurt Yang	f	f	t	t	t	f	f	t		2021-12-13 17:38:44.308757	2021-12-13 17:38:44.308757	10	378	Male	Full Member	2021-12-29	\N
1840	Nancy Murphy	f	f	t	t	f	f	f	t		2021-12-14 01:53:57.934248	2021-12-14 01:53:57.934248	51	377	Female	Full Member	2021-12-15	\N
1841	Dan Shults	f	t	t	t	f	f	f	t	Saying "hello" to the jello. 	2021-12-14 17:36:40.944142	2021-12-14 17:36:40.944142	20	374	Male	Full Member	2022-01-05	\N
1842	Andrew Blohm	f	f	t	t	f	f	f	t		2021-12-15 22:00:52.371875	2021-12-15 22:00:52.371875	142	377	Male	Full Member	2021-12-15	\N
1843	Corey Landsman 	f	f	t	t	f	f	f	t		2021-12-15 22:01:50.312118	2021-12-15 22:01:50.312118	142	377	Female	Full Member	2021-12-15	\N
1844	Scott James	f	f	f	t	f	f	f	t	Second visit. Has applied. Nancy will sponsor. - DS	2021-12-16 20:48:49.477901	2021-12-16 20:48:49.477901	20	377	Male	Guest	2021-12-15	\N
1845	Rachel Crateau	f	f	f	t	f	f	f	t	Second visit. Has applied. Nancy will sponsor. -DS	2021-12-16 20:50:58.788589	2021-12-16 20:50:58.788589	20	377	Female	Guest	2021-12-15	\N
1846	John	t	t	t	t	t	t	t	t	Tentative 	2021-12-18 17:53:10.367846	2021-12-18 17:53:10.367846	2	379	Male	Full Member	2021-12-22	\N
1847	John	t	t	t	t	f	f	f	t	Tentative 	2021-12-18 17:55:06.393212	2021-12-18 17:55:06.393212	2	378	Male	Full Member	2021-12-29	\N
1849	Nancy Murphy	f	f	t	t	f	f	f	t	First Aid!	2021-12-19 19:53:55.270172	2021-12-19 19:53:55.270172	51	374	Female	Full Member	2022-01-05	\N
1850	Bob Waddell	f	t	t	t	t	f	t	t	Skiing/Hiking/Sleddin'	2021-12-20 20:35:28.896778	2021-12-20 20:35:28.896778	209	381	Male	Full Member	2022-02-02	\N
1852	Alecia Emrich	f	f	t	t	f	f	f	t	Guest of Bob W	2021-12-20 20:40:52.847893	2021-12-20 20:40:52.847893	209	381	Female	Guest	2022-02-02	\N
1857	megan mayo	f	f	f	t	t	t	t	t	This is Doug, I am in Florida, but Megan might be up over the weekend, and I will be up Tuesday night 12/27	2021-12-21 12:58:48.905241	2021-12-21 12:58:48.905241	12	379	Female	Full Member	2021-12-22	\N
1858	megan mayo	t	t	t	f	f	f	f	t	finishing off vacation week	2021-12-21 12:59:24.516945	2021-12-21 12:59:24.516945	12	379	Female	Full Member	2021-12-22	\N
1859	Douglas Mayo	f	f	f	f	f	f	t	t	will be up Tuesday night late after flight from FLA	2021-12-21 13:00:28.547145	2021-12-21 13:00:28.547145	12	379	Male	Full Member	2021-12-22	\N
1860	Douglas Mayo	t	t	t	f	f	f	f	t	rest of vacation week	2021-12-21 13:01:03.710889	2021-12-21 13:01:03.710889	12	378	Male	Full Member	2021-12-29	\N
1861	Douglas Mayo	t	f	f	f	f	f	f	t	This is maybe for Tuesday night, tonight, 12/21/21, I might not be at school tomorrow	2021-12-21 13:02:05.970844	2021-12-21 13:02:05.970844	12	379	Male	Full Member	2021-12-22	\N
1862	Mike Ryan	f	f	t	t	t	f	f	t		2021-12-21 22:20:38.005181	2021-12-21 22:20:38.005181	14	380	Male	Full Member	2022-01-12	\N
1855	Ofer Tal	f	f	t	t	f	f	f	t	Guest of Bob W	2021-12-20 20:42:20.116493	2021-12-22 15:50:45.23058	209	381	Male	Guest	2022-02-02	\N
1856	Dianne Melanson	f	f	t	t	f	f	f	t	Guest of Bob W	2021-12-20 20:42:48.771676	2021-12-22 15:51:05.558309	209	381	Female	Guest	2022-02-02	\N
1864	Michelle Comtois	f	f	t	t	f	f	f	t		2021-12-23 17:57:48.980252	2021-12-23 17:57:48.980252	5	374	Female	Full Member	2022-01-05	\N
1876	Andrew Blohm	f	f	t	t	f	f	f	f	First aid	2021-12-27 19:03:50.385984	2021-12-27 19:07:03.413099	142	374	Male	Full Member	2022-01-05	\N
1866	Dane Araujo	t	t	f	f	f	f	f	t	For some reason was not able to add a guest - will be visiting with my girlfriend (to prove her existence)	2021-12-24 22:26:32.54623	2021-12-24 22:30:50.631687	154	378	Male	Full Member	2021-12-29	\N
1867	Alana McCarthy 	t	t	t	t	f	f	f	t	Week off, not sure when/if we’ll be up	2021-12-25 23:25:47.990083	2021-12-25 23:25:47.990083	23	378	Female	Full Member	2021-12-29	\N
1868	Tommy Wall	t	t	t	t	f	f	f	t	Week off, may come up not 100% on when	2021-12-25 23:26:51.034669	2021-12-25 23:26:51.034669	23	378	Male	Full Member	2021-12-29	\N
1848	Nancy Murphy	f	f	t	t	f	f	f	t		2021-12-19 19:52:15.706355	2021-12-27 11:59:49.834952	51	378	Female	Full Member	2021-12-29	\N
1875	Andrew Blohm	t	t	f	f	f	f	f	t	Staying Tuesday night and Wednesday night.  	2021-12-27 17:17:54.19496	2021-12-27 17:17:54.19496	142	378	Male	Full Member	2021-12-29	\N
1877	Corey Landsman	f	f	t	t	f	f	f	f	First aid	2021-12-27 19:04:44.863345	2021-12-27 19:04:44.863345	142	374	Female	Full Member	2022-01-05	\N
1878	CJ Landsman 	f	f	t	t	f	f	f	f	First aid. Corey’s Dad. 	2021-12-27 19:06:32.353056	2021-12-27 19:06:32.353056	142	374	Male	Guest	2022-01-05	\N
1880	LORI LAVOIE	f	t	t	t	f	f	f	t	Maybe..not yet fully committed. Will pay when I decide. Tyrol always preferred.	2021-12-28 00:57:29.163241	2021-12-28 00:57:29.163241	44	378	Female	Associate Member	2021-12-29	\N
1879	LORI LAVOIE	f	t	t	t	f	f	f	f	"My" bed if possible	2021-12-28 00:45:40.188667	2021-12-28 00:58:10.332884	44	374	Female	Associate Member	2022-01-05	\N
1881	Amy Candelora	f	f	t	t	f	f	f	t	The Candelora’s are coming north!	2021-12-28 01:20:13.106361	2021-12-28 01:20:13.106361	16	378	Female	Full Member	2021-12-29	\N
1882	Chris Candelora 	f	f	t	t	f	f	f	t		2021-12-28 01:20:40.755407	2021-12-28 01:20:40.755407	16	378	Male	Full Member	2021-12-29	\N
1883	Jess P	f	f	t	t	t	f	f	t		2021-12-28 02:27:40.755563	2021-12-28 02:27:40.755563	137	380	Female	Full Member	2022-01-12	\N
1885	Audrey Stout	f	f	t	t	f	f	f	t	First time guest. Came to the Dec 2 Meet and Greet event. Tommy is sponsoring. - DS	2021-12-28 20:45:11.838753	2021-12-28 20:45:11.838753	20	378	Female	Guest	2021-12-29	\N
1886	Scott James	f	f	t	t	f	f	f	t	Scott and Rachel have applied for membership, and this will be their third visit to the club. Tommy is sponsoring. - DS	2021-12-28 20:50:12.808692	2021-12-28 20:50:12.808692	20	378	Male	Guest	2021-12-29	\N
1887	Rachel Crateau	f	f	t	t	f	f	f	t	Rachel and Scott have applied for membership. This is their third visit. - DS	2021-12-28 20:50:45.856159	2021-12-28 20:50:45.856159	20	378	Female	Guest	2021-12-29	\N
1851	Bob Waddell	t	t	t	t	t	f	t	t	Ski time	2021-12-20 20:40:12.108298	2021-12-29 16:45:14.689428	209	382	Male	Full Member	2022-01-19	\N
1797	Bob Waddell	t	t	t	t	t	f	t	f	Skiing/ Hking/ Pong	2021-11-18 12:16:33.147334	2022-01-04 11:46:23.430207	209	374	Male	Full Member	2022-01-05	\N
1863	Mike Ryan	f	f	t	t	t	f	f	t		2021-12-21 22:21:18.399764	2022-01-18 16:16:34.345392	14	382	Male	Full Member	2022-01-19	\N
1889	Larissa Weirich	t	t	f	f	f	f	f	t	Guest of Dane	2021-12-29 14:14:51.898076	2021-12-29 14:14:51.898076	154	378	Female	Guest	2021-12-29	\N
1890	John D	f	f	f	f	t	t	t	t	Arriving the Sunday of First Aid. 	2021-12-29 15:22:00.959412	2021-12-29 15:22:00.959412	2	374	Male	Full Member	2022-01-05	\N
1893	Chris B	f	f	t	t	f	f	f	f	First Aid!!!  	2021-12-31 16:28:55.655528	2021-12-31 16:28:55.655528	15	374	Male	Full Member	2022-01-05	\N
1896	Sara Delaney	f	f	t	t	f	f	f	f	First aid! :D	2022-01-01 19:37:47.081589	2022-01-01 19:37:47.081589	31	374	Female	Associate Member	2022-01-05	\N
1897	Alana	f	f	t	t	f	f	f	t	Boosters!	2022-01-01 20:34:18.047423	2022-01-01 20:34:18.047423	23	374	Female	Full Member	2022-01-05	\N
1898	Tommy w	f	f	t	t	f	f	f	t		2022-01-01 20:34:39.962723	2022-01-01 20:34:39.962723	23	374	Male	Full Member	2022-01-05	\N
1899	Alena Beaulieau	f	f	t	t	f	f	f	t	Guest of Bob Waddell	2022-01-02 12:45:43.40793	2022-01-02 12:45:43.40793	209	382	Female	Guest	2022-01-19	\N
1900	Nikki Shults	f	t	t	t	f	f	f	f	First aid	2022-01-02 20:36:38.071131	2022-01-02 20:36:38.071131	9	374	Female	Full Member	2022-01-05	\N
1901	Dane Araujo	f	f	t	t	f	f	f	t	For health and safety	2022-01-03 13:59:43.759149	2022-01-03 13:59:43.759149	154	374	Male	Full Member	2022-01-05	\N
1902	Megan mayo	f	t	t	t	f	f	f	t	Might not be staying Saturday night	2022-01-04 02:32:53.69661	2022-01-04 02:32:53.69661	12	374	Female	Full Member	2022-01-05	\N
1903	Doug Mayo 	f	t	t	t	f	f	f	t	Might not be staying Saturday night 	2022-01-04 02:33:57.144713	2022-01-04 02:33:57.144713	12	374	Male	Full Member	2022-01-05	\N
1904	Kate Oetheimer	f	f	t	t	f	f	f	f	Kate came to our meet and greet in Watertown. This will be her first visit. VEGETARIAN. - DS	2022-01-04 02:39:42.130304	2022-01-04 02:39:42.130304	20	374	Female	Guest	2022-01-05	\N
1905	Emily Bularzik	f	f	t	t	f	f	f	f	Long time friend of the club. Hangs w Delaney. - DS	2022-01-04 02:41:25.497048	2022-01-04 02:41:25.497048	20	374	Female	Guest	2022-01-05	\N
1907	Noah Jick	f	f	t	t	f	f	f	f	Would you look at the thighs on this kid? Came to best weekend. Visiting w Carly Soares. - DS	2022-01-04 02:47:59.07449	2022-01-04 02:47:59.07449	20	374	Male	Guest	2022-01-05	\N
1908	Carlyn Soares	f	f	t	t	f	f	f	f	Came to Best Weekend. Hangs w Noah Jick. - DS	2022-01-04 02:48:54.112091	2022-01-04 02:48:54.112091	20	374	Female	Guest	2022-01-05	\N
1909	Jessica Martinez	f	f	t	t	f	f	f	f	Jess visited best weekend. Really good prospect- get to know her! - DS	2022-01-04 02:50:30.700943	2022-01-04 02:50:30.700943	20	374	Female	Guest	2022-01-05	\N
1906	Monica Pompey	f	f	t	t	f	f	f	f	A friend of Carly Soares. First time visiting. - DS	2022-01-04 02:46:20.281193	2022-01-04 02:54:23.009874	20	374	Female	Guest	2022-01-05	\N
1910	Perry F	f	f	t	t	f	f	f	t	First aid 	2022-01-04 13:24:59.480699	2022-01-04 13:24:59.480699	153	374	Male	Full Member	2022-01-05	\N
1911	Vicki Santarcangelo 	f	f	t	t	f	f	f	t	First Aid	2022-01-05 02:51:49.798249	2022-01-05 02:51:49.798249	3	374	Female	Full Member	2022-01-05	\N
1913	Bob Waddell	t	f	t	t	t	t	t	t		2022-01-05 11:53:38.287426	2022-01-05 11:53:38.287426	209	383	Male	Full Member	2022-01-26	\N
1914	Bob Waddell	t	t	f	f	f	f	f	t		2022-01-05 11:55:50.668951	2022-01-05 11:55:50.668951	209	384	Male	Full Member	2022-02-09	\N
1915	Dominik Airey	f	f	t	t	f	f	f	f	Dominik came to our meet and greet in Watertown. Young guy- somewhat quiet but nice. - DS	2022-01-05 14:17:17.516367	2022-01-05 14:17:17.516367	20	374	Male	Guest	2022-01-05	\N
1916	Jennifer Oberman 	f	f	t	t	f	f	f	f	Another friend of returning guest Carly Soares. -DS	2022-01-05 14:18:40.145889	2022-01-05 14:18:40.145889	20	374	Female	Guest	2022-01-05	\N
1917	Jocelyn Delaney	f	f	t	t	f	f	f	f	Jocelyn came to the meet and greet in Somerville. First time visiting. - DS	2022-01-06 02:39:51.731103	2022-01-06 02:39:51.731103	20	374	Female	Guest	2022-01-05	\N
1918	Trevor Rowe	f	f	t	t	f	f	f	t	Trevor came to the Somerville meetup, and also came to Best Weekend. He requests a gender-neutral room. - DS	2022-01-06 02:41:35.42118	2022-01-06 02:41:35.42118	20	374	Male	Guest	2022-01-05	\N
1919	Matt Chase	f	f	t	t	f	f	f	f	I got an RSVP form response from this guy... but I don't actually know who he is. I sent a follow up email to ask. - DS	2022-01-06 02:56:14.477566	2022-01-06 02:56:14.477566	20	374	Male	Guest	2022-01-05	\N
1920	Philip Mackson	f	f	t	t	f	f	f	t	A friend of returning guest Jess Martinez.	2022-01-06 21:13:22.574236	2022-01-06 21:13:22.574236	20	374	Male	Guest	2022-01-05	\N
1921	kurt	f	f	t	t	t	f	f	t		2022-01-09 14:44:20.048771	2022-01-09 14:44:20.048771	10	380	Male	Full Member	2022-01-12	\N
1922	kurt	f	f	t	t	t	f	f	t		2022-01-09 14:47:36.555174	2022-01-09 14:47:36.555174	10	385	Male	Full Member	2022-02-16	\N
2014	Sara Delaney	f	f	t	t	f	f	f	t		2022-01-27 22:12:44.903245	2022-01-27 22:12:44.903245	31	383	Female	Associate Member	2022-01-26	\N
1891	John D	t	t	t	t	t	f	f	t	Will be at the house a few days the week after First Aid. May stay in Jackson Th, F, S nights. 	2021-12-29 15:23:41.469247	2022-01-10 12:01:52.54984	2	380	Male	Full Member	2022-01-12	\N
1955	Nikki Shults	f	t	t	t	f	f	f	t		2022-01-12 01:26:54.084418	2022-01-12 01:26:54.084418	9	380	Female	Full Member	2022-01-12	\N
1956	Shana Biletch	f	f	f	t	t	f	f	t		2022-01-12 01:30:51.470775	2022-01-12 01:30:51.470775	57	380	Female	Full Member	2022-01-12	\N
1957	Dan Shults	f	t	t	t	f	f	f	t	Finally starting my ski season!	2022-01-12 01:31:55.206167	2022-01-12 01:31:55.206167	20	380	Male	Full Member	2022-01-12	\N
1958	Doug Kinkenon	f	f	f	t	t	f	f	t	Shana's guest	2022-01-12 01:34:25.609466	2022-01-12 01:34:25.609466	57	380	Male	Guest	2022-01-12	\N
1959	Vicki Santarcangelo 	f	f	f	t	t	f	f	t	Maybe. Not sure yet. 	2022-01-12 02:47:06.945548	2022-01-12 02:47:06.945548	3	380	Female	Full Member	2022-01-12	\N
1960	Perry F	f	f	t	t	t	t	f	t	Maybe, most likely Sunday and Monday only 	2022-01-12 02:48:56.792064	2022-01-12 16:42:40.494392	153	380	Male	Full Member	2022-01-12	\N
1961	Bryan Kirk	f	f	t	t	t	t	f	t		2022-01-12 21:19:52.860263	2022-01-12 21:19:52.860263	219	380	Male	Full Member	2022-01-12	\N
1962	Brett Willey	f	f	f	t	f	f	f	t	This will be Brett's second visit. 	2022-01-13 13:37:10.126209	2022-01-13 13:37:10.126209	20	380	Male	Guest	2022-01-12	\N
1963	Dan Shults	f	f	t	t	f	f	f	t	Race weekend! 	2022-01-13 13:49:27.618678	2022-01-13 13:49:27.618678	20	382	Male	Full Member	2022-01-19	\N
1964	Dan Shults	f	f	t	t	f	f	f	t	Nikki and I will be up with a good handful of guests.	2022-01-13 13:50:37.239947	2022-01-13 13:50:37.239947	20	383	Male	Full Member	2022-01-26	\N
1965	Jessica Martinez	f	f	f	t	t	f	f	t	Jess has been voted in and will shortly be receiving her "pay your dues" email from Michelle, so I am registering her for this weekend. - DS	2022-01-13 20:36:12.370988	2022-01-13 20:36:12.370988	20	380	Female	Full Member	2022-01-12	\N
1966	Scott James	f	f	t	t	f	f	f	t	Scott got voted in this week and is awaiting his "pay your dues" email from Michelle, so I am registering him. - DS	2022-01-13 20:41:23.562366	2022-01-13 20:41:23.562366	20	380	Male	Full Member	2022-01-12	\N
1967	Rachel Crateau	f	f	t	t	f	f	f	t	Rachel got voted in this week and is awaiting his "pay your dues" email from Michelle, so I am registering her. - DS	2022-01-13 20:41:53.691049	2022-01-13 20:41:53.691049	20	380	Female	Full Member	2022-01-12	\N
1968	Jess P	f	f	t	t	f	f	f	t	Beth's bed unless she is visiting. 	2022-01-14 00:48:24.53375	2022-01-14 00:48:24.53375	137	382	Female	Full Member	2022-01-19	\N
1969	Jess P	f	f	t	t	f	f	f	t	Beth's bed unless she is visiting. 	2022-01-14 00:50:22.295427	2022-01-14 00:50:22.295427	137	384	Female	Full Member	2022-02-09	\N
1973	Michelle Comtois	f	f	t	t	f	f	f	t		2022-01-14 12:00:19.113537	2022-01-14 12:00:19.113537	5	382	Female	Full Member	2022-01-19	\N
1974	Nikki Shults	f	f	t	t	f	f	f	t	Go team go!	2022-01-16 22:23:13.933328	2022-01-16 22:23:13.933328	9	382	Female	Full Member	2022-01-19	\N
1975	Nikki Shults	f	t	t	t	f	f	f	t		2022-01-16 22:23:58.400124	2022-01-16 22:23:58.400124	9	383	Female	Full Member	2022-01-26	\N
1976	Andrea Meyer	f	f	t	t	f	f	f	t	Nikki's sister	2022-01-16 22:24:23.913654	2022-01-16 22:24:23.913654	9	383	Female	Guest	2022-01-26	\N
1977	Jeff Meyer	f	f	t	t	f	f	f	t	Nikki's brother-in-law	2022-01-16 22:24:59.200959	2022-01-16 22:24:59.200959	9	383	Male	Guest	2022-01-26	\N
1970	Jess P	f	f	t	t	t	f	f	t	Beth's bed unless she is visiting. I may skip this weekend. I'll update by 2/16.  	2022-01-14 00:53:15.402439	2022-02-08 15:04:15.649137	137	385	Female	Full Member	2022-02-16	\N
1980	Vicki Santarcangelo	f	f	t	t	f	f	f	t	Race #2!	2022-01-17 16:20:47.688196	2022-01-17 16:20:47.688196	3	382	Female	Full Member	2022-01-19	\N
1978	Kevin Holowaty	f	f	t	t	f	f	f	t	Nikki's friend	2022-01-16 22:25:25.152929	2022-01-17 20:50:32.08565	9	383	Male	Guest	2022-01-26	\N
1979	Shannon Slota (Ellie)	f	f	t	t	f	f	f	t	Nikki's friend	2022-01-16 22:25:54.571285	2022-01-17 20:50:56.309467	9	383	Female	Guest	2022-01-26	\N
1984	Scott James	f	f	t	t	f	f	f	t		2022-01-17 23:44:23.628203	2022-01-17 23:44:23.628203	257	382	Male	Full Member	2022-01-19	\N
1985	Doug Mayo 	t	f	t	t	f	f	f	t	Will be up Tuesday night to ski Wednesday 	2022-01-18 01:33:04.815055	2022-01-18 01:33:04.815055	12	382	Male	Full Member	2022-01-19	\N
1986	Megan Mayo 	f	f	t	t	f	f	f	t	Getintoit 	2022-01-18 01:33:33.948125	2022-01-18 01:33:33.948125	12	382	Female	Full Member	2022-01-19	\N
1987	Doug Mayo 	f	f	t	t	f	f	f	t	Getintoit 	2022-01-18 01:34:13.447195	2022-01-18 01:34:13.447195	12	383	Male	Full Member	2022-01-26	\N
1988	Megan Mayo 	f	f	t	t	f	f	f	t	Getintoit 	2022-01-18 01:34:41.350138	2022-01-18 01:34:41.350138	12	383	Female	Full Member	2022-01-26	\N
1989	Doug Mayo 	f	f	t	t	f	f	f	t	Getintoit 	2022-01-18 01:36:08.047446	2022-01-18 01:36:08.047446	12	381	Male	Full Member	2022-02-02	\N
1990	Megan Mayo 	f	f	t	t	f	f	f	t	Getintoit 	2022-01-18 01:36:37.730178	2022-01-18 01:36:37.730178	12	381	Female	Full Member	2022-02-02	\N
1981	Jamie Curtin	f	f	t	t	f	f	f	t	Guest of Bob W, request Tyrol	2022-01-17 16:27:55.464254	2022-01-18 07:43:24.528105	209	382	Female	Guest	2022-01-19	\N
1982	Dan Grant	f	f	t	t	f	f	f	t	Guest of Bob W, Request Tyrol	2022-01-17 16:28:45.324091	2022-01-18 07:43:44.388134	209	382	Male	Guest	2022-01-19	\N
1991	Donnie Cummings	f	f	t	t	f	f	f	t	Guest of Bob W	2022-01-18 07:44:44.760933	2022-01-18 07:44:44.760933	209	381	Male	Guest	2022-02-02	\N
2024	Dan Romano	f	f	t	t	f	f	f	t	Dan came to our Somerville meetup. This will be his first visit. I can sponsor. -DS	2022-02-01 23:13:52.073562	2022-02-01 23:13:52.073562	20	381	Male	Guest	2022-02-02	\N
1992	Rachel Crateau	f	f	t	t	f	f	f	t		2022-01-18 15:46:43.045083	2022-01-18 15:46:43.045083	261	382	Female	Full Member	2022-01-19	\N
2178	Vicki S	f	t	t	t	f	f	f	t	Tuckermans	2022-03-06 14:27:01.040565	2022-03-06 14:27:01.040565	3	422	Female	Full Member	2022-03-30	\N
1993	JD Martinez	f	f	t	t	f	f	f	t	I'm going by JD because Jess was already taken as a nickname lol. Michelle assigned me a bunk in the Tyrol room. We're not sure what number the bunks are yet but we'll confirm that this weekend. \r\n\r\nEXCITED FOR THIS TO BE MY FIRST OFFICIAL WEEKEND AS A MEMBER! Woo!	2022-01-18 18:25:47.574797	2022-01-18 18:25:47.574797	260	382	Female	Full Member	2022-01-19	\N
1994	Alana M	f	f	t	t	f	f	f	t	Cheering section	2022-01-19 01:21:12.276955	2022-01-19 01:21:12.276955	23	382	Female	Full Member	2022-01-19	\N
1995	Tommy W	f	f	t	t	f	f	f	t	Race day	2022-01-19 01:23:51.1045	2022-01-19 01:23:51.1045	23	382	Male	Full Member	2022-01-19	\N
1996	Chris B	f	f	t	t	f	f	f	t	Immersion Therapy & Yoga 	2022-01-19 03:33:47.077643	2022-01-19 03:33:47.077643	15	382	Male	Full Member	2022-01-19	\N
1983	Desiree Stallings	f	f	t	t	f	f	f	t	Guest of Bob W	2022-01-17 16:29:29.953163	2022-01-19 13:19:31.200847	209	382	Female	Guest	2022-01-19	\N
1997	Perry Frink	f	f	t	t	f	f	f	t	Probably not making it up but adding this just incase something changes	2022-01-19 21:55:25.515964	2022-01-19 21:55:25.515964	153	382	Male	Full Member	2022-01-19	\N
2000	Desiree Stallings	f	f	t	t	f	f	f	t	Guesty of Bob W	2022-01-22 15:02:11.685685	2022-01-22 15:02:11.685685	209	383	Female	Guest	2022-01-26	\N
2001	Greg Biggs	f	f	t	t	f	f	f	t	Friend of Nikki	2022-01-23 19:11:15.825327	2022-01-23 19:11:15.825327	9	383	Male	Guest	2022-01-26	\N
2002	Melissa Biggs	f	f	t	t	f	f	f	t	Friend of Nikki	2022-01-23 19:11:42.819918	2022-01-23 19:11:42.819918	9	383	Female	Guest	2022-01-26	\N
2003	Mike Ryan	f	t	t	t	t	f	f	t	Thursday and Sunday are maybes	2022-01-24 16:25:43.245768	2022-01-24 16:25:43.245768	14	383	Male	Full Member	2022-01-26	\N
2005	Trevor Rowe	f	f	t	t	f	f	f	t		2022-01-24 20:45:07.754103	2022-01-24 20:46:14.627769	259	381	Male	Full Member	2022-02-02	\N
2006	Perry F	f	t	t	t	f	f	f	t	Thursday is a maybe…depends when the snow starts 	2022-01-25 03:08:50.283779	2022-01-25 03:08:50.283779	153	383	Male	Full Member	2022-01-26	\N
2007	James S	f	t	t	t	f	f	f	t	Guest of Perry. Thursday is depending on weather 	2022-01-25 19:46:26.782607	2022-01-25 19:46:26.782607	153	383	Male	Guest	2022-01-26	\N
2008	TWall	f	f	t	t	f	f	f	t	Maybe	2022-01-26 01:48:58.768345	2022-01-26 01:48:58.768345	21	383	Male	Full Member	2022-01-26	\N
2009	Alana	f	f	t	t	f	f	f	t	Maybe	2022-01-26 01:52:09.241012	2022-01-26 01:52:09.241012	23	383	Female	Full Member	2022-01-26	\N
2010	Michelle Comtois	f	f	t	t	f	f	f	t		2022-01-26 12:09:21.345155	2022-01-26 12:09:21.345155	5	384	Female	Full Member	2022-02-09	\N
2011	Michelle Comtois	f	f	t	t	f	f	f	t		2022-01-26 12:10:25.032263	2022-01-26 12:10:25.032263	5	381	Female	Full Member	2022-02-02	\N
2012	Zach Basset	f	f	t	t	f	f	f	t	This is Zach's second visit. He came to Best Weekend as well. - DS	2022-01-26 18:18:59.581809	2022-01-26 18:18:59.581809	20	383	Male	Guest	2022-01-26	\N
2013	Trevor Rowe	f	f	f	t	f	f	f	t		2022-01-26 21:33:14.761716	2022-01-26 21:33:14.761716	259	383	Male	Full Member	2022-01-26	\N
2016	Alana McC	f	f	t	t	f	f	f	t	Spectatoring	2022-01-31 17:11:26.088154	2022-01-31 17:11:26.088154	23	381	Female	Full Member	2022-02-02	\N
2017	Dan Shults	f	t	t	t	f	f	f	t	Sunday River with some friends on Friday. Possibly a hike Saturday. Cranmore for the race Sunday.	2022-01-31 21:06:45.559494	2022-01-31 21:06:45.559494	20	381	Male	Full Member	2022-02-02	\N
2018	Bob Waddell	f	f	f	t	t	t	t	t		2022-02-01 12:18:06.256203	2022-02-01 12:18:45.080205	209	385	Male	Full Member	2022-02-16	\N
2019	Bob Waddell	f	f	f	t	t	t	t	t		2022-02-01 12:19:42.589511	2022-02-01 12:19:42.589511	209	420	Male	Full Member	2022-03-02	\N
2020	T Wall	f	f	t	t	f	f	f	t	Feeling fast as F%&@	2022-02-01 15:36:13.07556	2022-02-01 15:36:13.07556	21	381	Male	Race Member	2022-02-02	\N
2021	Rachel Crateau	f	f	t	t	f	f	f	t		2022-02-01 17:45:46.676118	2022-02-01 17:45:46.676118	261	381	Female	Full Member	2022-02-02	\N
2023	Jake Taylor	f	t	t	t	f	f	f	t	First time guest who reached out via email. I will sponsor. - DS	2022-02-01 22:17:25.797814	2022-02-01 22:17:25.797814	20	381	Male	Guest	2022-02-02	\N
2025	Scott James	f	f	t	t	f	f	f	t		2022-02-01 23:26:06.41555	2022-02-01 23:26:06.41555	257	381	Male	Full Member	2022-02-02	\N
2027	Desiree Stallings	f	f	t	t	f	f	f	t	snowmobiling/hiking	2022-02-02 01:44:30.811033	2022-02-02 01:44:30.811033	209	381	Female	Guest	2022-02-02	\N
2026	Perry F	f	t	t	t	f	f	f	t	Not sure yet but adding this in. Might go to mt snow instead 	2022-02-02 00:15:39.454119	2022-02-02 13:18:55.04123	153	381	Male	Full Member	2022-02-02	\N
2028	Nikki Shults	f	t	t	t	f	f	f	t		2022-02-02 13:28:56.592786	2022-02-02 13:28:56.592786	9	381	Female	Full Member	2022-02-02	\N
2061	Dane Araujo	f	f	t	t	f	f	f	t		2022-02-02 14:15:35.170827	2022-02-02 14:15:35.170827	154	381	Male	Full Member	2022-02-02	\N
2062	Larissa Weirich	f	f	t	t	f	f	f	t	Guest of Dane	2022-02-02 14:16:30.69296	2022-02-02 14:16:30.69296	154	381	Female	Guest	2022-02-02	\N
2063	Chris B	f	f	t	t	f	f	f	t		2022-02-02 14:22:45.117884	2022-02-02 14:22:45.117884	15	381	Male	Full Member	2022-02-02	\N
2064	Nancy Murphy	f	f	t	t	f	f	f	t		2022-02-02 19:38:41.574463	2022-02-02 19:38:41.574463	51	384	Female	Full Member	2022-02-09	\N
2065	Nancy Murphy	f	f	t	t	t	f	f	t		2022-02-02 19:39:26.120174	2022-02-02 19:39:26.120174	51	385	Female	Full Member	2022-02-16	\N
2066	Rory Burrows	f	f	t	t	f	f	f	t	First time visitor referred to us by the Schussers. I will sponsor. - DS	2022-02-02 22:54:30.209257	2022-02-02 22:54:30.209257	20	381	Male	Guest	2022-02-02	\N
2067	Trevor Rowe	f	t	t	t	f	f	f	t		2022-02-03 03:30:54.715305	2022-02-03 03:30:54.715305	259	381	Male	Full Member	2022-02-02	\N
2022	Kate Oetheimer	f	f	t	t	f	f	f	t	This will be Kate's second visit. Nancy will sponsor. -DS	2022-02-01 18:37:32.890728	2022-02-07 19:04:51.163052	20	385	Female	Guest	2022-02-16	\N
2015	Jess P	f	t	t	t	f	f	f	f	Beth's bed unless she is visiting.  Preference for guests to stay in Tyrol pending if JD or Lori are visiting. I will be working from club on Friday.  Paid 3/1 via Venmo.	2022-01-31 15:41:08.642463	2022-03-01 19:29:50.830036	137	420	Female	Full Member	2022-03-02	\N
2068	LORI LAVOIE	f	t	t	t	f	f	f	t	Tyrol if avail	2022-02-07 01:09:58.920026	2022-02-07 01:09:58.920026	44	384	Female	Associate Member	2022-02-09	\N
2069	Dan Shults	f	f	t	t	f	f	f	t	Race finals! We may also do some kind of "New Member's Weekend." TBD.	2022-02-07 19:06:34.840337	2022-02-07 19:06:34.840337	20	420	Male	Full Member	2022-03-02	\N
2071	John and Vic	f	t	t	t	t	f	f	t	We hope to be up for the weekend. 	2022-02-08 10:45:40.366002	2022-02-08 10:45:40.366002	2	384	Male	Full Member	2022-02-09	\N
2072	Douglas Mayo	f	f	t	t	f	f	f	t	getintoit	2022-02-08 13:33:45.172491	2022-02-08 13:33:45.172491	12	384	Male	Full Member	2022-02-09	\N
2073	megan mayo	f	f	t	t	f	f	f	t	getintoit	2022-02-08 13:34:12.420062	2022-02-08 13:34:12.420062	12	384	Female	Full Member	2022-02-09	\N
2074	Douglas Mayo	f	f	t	t	t	t	t	t	start of school vacation	2022-02-08 13:34:44.920311	2022-02-08 13:34:44.920311	12	385	Male	Full Member	2022-02-16	\N
2075	megan mayo	f	f	t	t	t	t	t	t	start of school vacation	2022-02-08 13:35:19.925277	2022-02-08 13:35:19.925277	12	385	Female	Full Member	2022-02-16	\N
2076	Douglas Mayo	t	t	t	t	f	f	f	t	end of vacation week	2022-02-08 13:35:46.735696	2022-02-08 13:35:46.735696	12	421	Male	Full Member	2022-02-23	\N
2077	megan mayo	t	t	t	t	f	f	f	t	end of vacation week	2022-02-08 13:36:09.976158	2022-02-08 13:36:09.976158	12	421	Female	Full Member	2022-02-23	\N
2080	Mike Ryan	f	f	t	t	t	f	f	t	All tentative based on uncle duty	2022-02-08 20:21:12.059628	2022-02-08 20:21:12.059628	14	384	Male	Full Member	2022-02-09	\N
2081	Jake Taylor	f	f	t	t	f	f	f	t	This will be Jake's second visit. Nancy will sponsor. - DS	2022-02-08 22:53:51.437249	2022-02-08 22:53:51.437249	20	423	Male	Guest	2022-03-16	\N
2082	Andrew Blohm	f	f	f	f	f	f	t	t	Skiing cannon Wednesday the 16th	2022-02-09 00:03:38.907107	2022-02-09 00:03:38.907107	142	384	Male	Full Member	2022-02-09	\N
2083	Dan Romano	f	f	f	t	f	f	f	t	This is Dan's second visit. Nice guy, easy going. Nancy will sponsor. - DS	2022-02-09 16:56:57.87358	2022-02-09 16:56:57.87358	20	384	Male	Guest	2022-02-09	\N
2084	Vicki S	f	t	t	t	t	f	f	t		2022-02-09 19:29:59.6535	2022-02-09 19:29:59.6535	3	384	Female	Full Member	2022-02-09	\N
2085	Perry F	f	t	f	f	t	t	t	t	Maybe	2022-02-09 23:02:01.891472	2022-02-09 23:02:01.891472	153	384	Male	Full Member	2022-02-09	\N
2181	Mike Ryan	f	f	t	t	f	f	f	t	Stop melting snow	2022-03-07 13:43:12.157367	2022-03-07 13:43:12.157367	14	419	Male	Full Member	2022-03-09	\N
2182	Alana M	f	f	t	t	f	f	f	t	Indie 617 promo at Black- if it doesn’t rain…	2022-03-08 16:50:54.945018	2022-03-08 16:50:54.945018	23	419	Female	Full Member	2022-03-09	\N
2086	Dan Thill	f	f	t	t	f	f	f	t	Dan Thill has been trying to visit the club for a while. I met him a few months ago and gave him a quick tour. He comes on a little strong imo, so this will be a good test run. He is not vax'd and has agreed to show a negative test upon arrival. Nancy will sponsor. - DS	2022-02-10 01:19:49.408249	2022-02-10 01:19:49.408249	20	384	Male	Guest	2022-02-09	\N
2087	Michelle Comtois	f	f	t	t	f	f	f	t		2022-02-10 02:29:31.175644	2022-02-10 02:29:31.175644	5	422	Female	Full Member	2022-03-30	\N
2088	Michelle Comtois	f	f	t	t	f	f	f	t		2022-02-10 02:30:54.234942	2022-02-10 02:30:54.234942	5	420	Female	Full Member	2022-03-02	\N
2089	Sara Delaney	f	f	t	t	f	f	f	t		2022-02-10 19:25:22.83577	2022-02-10 19:25:22.83577	31	384	Female	Associate Member	2022-02-09	\N
2090	Bob Waddell	t	t	t	t	f	f	f	t		2022-02-12 04:51:06.07137	2022-02-12 04:51:06.07137	209	421	Male	Full Member	2022-02-23	\N
2091	Mark Buckley	f	f	f	t	f	f	f	t		2022-02-12 12:43:37.118576	2022-02-12 12:43:37.118576	22	420	Male	Full Member	2022-03-02	\N
2093	Jake Taylor	f	f	t	t	f	f	f	t	Jake's second visit. Nancy will sponsor. - DS	2022-02-13 04:36:54.062932	2022-02-13 04:36:54.062932	20	385	Male	Guest	2022-02-16	\N
2094	John	t	t	t	t	t	t	f	t		2022-02-13 12:45:21.196783	2022-02-13 12:45:21.196783	2	385	Male	Full Member	2022-02-16	\N
2096	Mike Ryan	f	f	t	t	t	t	t	t	Vacation week.	2022-02-14 15:14:45.299827	2022-02-14 15:14:45.299827	14	385	Male	Full Member	2022-02-16	\N
2097	Mike Ryan	t	t	t	t	f	f	f	t	Vacation week	2022-02-14 15:15:20.533106	2022-02-14 15:15:20.533106	14	421	Male	Full Member	2022-02-23	\N
2098	Vicki Santarcangelo	f	t	t	t	t	f	f	t	Championship Race! Victory is mine!	2022-02-15 01:04:07.376935	2022-02-15 01:04:07.376935	3	420	Female	Full Member	2022-03-02	\N
2099	Vicki Santarcangelo	f	t	t	t	t	f	f	t	Red Parka Race	2022-02-15 01:04:52.961716	2022-02-15 01:04:52.961716	3	423	Female	Full Member	2022-03-16	\N
2100	Vicki Santarcangelo	f	t	t	t	t	f	f	t	Maybe. I think.	2022-02-15 01:06:27.574413	2022-02-15 01:06:27.574413	3	385	Female	Full Member	2022-02-16	\N
2101	Perry F	t	t	t	t	t	f	f	t	Maybe 	2022-02-15 19:07:52.127807	2022-02-15 19:07:52.127807	153	385	Male	Full Member	2022-02-16	\N
2102	Sara Delaney	f	f	t	t	f	f	f	t	I may have a guest up, as well (Jamie Smart)	2022-02-17 15:41:49.353203	2022-02-17 15:41:49.353203	31	421	Female	Associate Member	2022-02-23	\N
2103	Trevor Rowe	f	f	t	t	t	f	f	t		2022-02-17 16:50:57.970184	2022-02-17 16:50:57.970184	259	423	Male	Full Member	2022-03-16	\N
2104	Chris B	f	f	t	t	f	f	f	t	FunFest!!!!	2022-02-18 15:14:58.951735	2022-02-18 15:14:58.951735	15	420	Male	Full Member	2022-03-02	\N
2105	Chris B	f	f	t	t	f	f	f	t	Meditation Clinic!	2022-02-18 15:18:04.423473	2022-02-18 15:18:04.423473	15	419	Male	Full Member	2022-03-09	\N
2106	Trevor Rowe	f	f	t	t	f	f	f	f		2022-02-18 20:35:29.270534	2022-02-18 20:35:29.270534	259	420	Male	Full Member	2022-03-02	\N
2107	Bob Waddell	t	t	t	t	t	f	t	t		2022-02-20 20:21:01.593278	2022-02-20 20:21:01.593278	209	419	Male	Full Member	2022-03-09	\N
2108	Desiree Stallings	t	f	f	f	f	f	f	t	guest of Bob W	2022-02-21 13:04:56.203931	2022-02-21 13:04:56.203931	209	421	Female	Guest	2022-02-23	\N
2109	Nikki Shults	f	t	t	t	f	f	f	t	Brettl-Hupfers Rule!	2022-02-22 02:48:14.327419	2022-02-22 02:48:14.327419	9	420	Female	Full Member	2022-03-02	\N
2111	Sara Delaney	f	t	t	t	f	f	f	t	Thurs night is a maybe.	2022-02-22 20:34:56.581913	2022-02-22 20:34:56.581913	31	421	Female	Associate Member	2022-02-23	\N
2112	Scott James	f	f	t	t	f	f	f	t		2022-02-23 00:57:21.826662	2022-02-23 00:57:21.826662	257	421	Male	Full Member	2022-02-23	\N
2113	Rachel Crateau	f	f	t	t	f	f	f	t		2022-02-23 01:00:04.130208	2022-02-23 01:00:04.130208	261	421	Female	Full Member	2022-02-23	\N
2110	Perry F	f	t	t	t	f	f	f	t	Maybe, either NH or VT or both 	2022-02-22 19:46:46.200517	2022-02-23 13:12:38.201094	153	421	Male	Full Member	2022-02-23	\N
2114	Kurt Yang	f	f	t	t	f	f	f	t	May come but not sure. 	2022-02-23 19:55:11.433942	2022-02-23 19:55:11.433942	10	420	Male	Full Member	2022-03-02	\N
2115	Alana M	f	f	t	t	f	f	f	f	Bretts celebration 	2022-02-23 20:22:45.804173	2022-02-23 20:22:45.804173	23	420	Female	Full Member	2022-03-02	\N
2116	Trevor Rowe	f	t	t	t	t	f	f	t	Thursday and Sunday nights are maybes	2022-02-23 22:49:48.60989	2022-02-23 22:49:48.60989	259	421	Male	Full Member	2022-02-23	\N
2117	Trevor Rowe	f	f	t	t	f	f	f	f		2022-02-23 22:51:51.34504	2022-02-23 22:51:51.34504	259	419	Male	Full Member	2022-03-09	\N
2118	Bryan Kirk	f	t	t	t	f	f	f	t		2022-02-23 22:54:44.913577	2022-02-23 22:55:23.043826	219	421	Male	Full Member	2022-02-23	\N
2119	Tyler D	f	f	t	t	f	f	f	t	Guest of Perry. Tyler probably won’t make it but added just in case	2022-02-23 23:29:22.333573	2022-02-23 23:30:07.916961	153	421	Male	Guest	2022-02-23	\N
2120	Various guests	f	f	t	t	f	f	f	t	We have a few late breaking guests who are still maybes. Mike has agreed to sponsor Matt Silvestro, but his reservation is not final yet. Peter Walsh, from the recent meetup, also wants to come up with some friends. I'm waiting on final headcount but if he doesn't get back to me very soon I may tell him it will have to wait. - DS	2022-02-24 03:43:57.280036	2022-02-24 03:43:57.280036	20	421	Male	Guest	2022-02-23	\N
2121	Amy Candelora	f	f	t	t	f	f	f	t		2022-02-24 16:17:24.453429	2022-02-24 16:17:24.453429	16	420	Female	Full Member	2022-03-02	\N
2122	Chris candelora 	f	f	t	t	f	f	f	t		2022-02-24 16:17:55.44123	2022-02-24 16:17:55.44123	16	420	Male	Full Member	2022-03-02	\N
2124	Kristina Johnson	f	f	t	t	f	f	f	f	Guest of Jess P. Paid 3/1 via Venmo.	2022-02-27 21:55:17.344501	2022-03-01 19:30:24.574281	137	420	Female	Guest	2022-03-02	\N
2095	Nancy Murphy	f	f	t	t	f	f	f	f		2022-02-13 20:25:18.877496	2022-03-02 19:03:56.36966	51	420	Female	Full Member	2022-03-02	\N
2078	Jess P	f	t	t	t	f	f	f	t	Tuckerman's Ravine hike.  Beth's bed unless she is visiting. 	2022-02-08 14:59:58.069029	2022-03-15 22:27:47.002061	137	422	Female	Full Member	2022-03-30	\N
2125	Mike Ryan	f	t	t	t	t	f	f	f		2022-02-28 16:47:41.758918	2022-02-28 16:47:55.358983	14	420	Male	Full Member	2022-03-02	\N
2126	Rachel Crateau	f	f	t	t	f	f	f	t		2022-02-28 20:52:01.992886	2022-02-28 20:52:01.992886	261	420	Female	Full Member	2022-03-02	\N
2127	Adam Crateau	f	f	t	t	f	f	f	f	Guest of Rachel Crateau - request  to place  in Wildcat Room 	2022-02-28 20:56:25.900086	2022-02-28 20:56:25.900086	261	420	Male	Guest	2022-03-02	\N
2128	Cam Lunetta	f	f	t	t	f	f	f	f	Guest of Rachel Crateau, request to place in Wildcat room	2022-02-28 20:57:59.748505	2022-02-28 20:57:59.748505	261	420	Male	Guest	2022-03-02	\N
2129	T Wall	f	f	t	t	f	f	f	t	Weekend of Champions	2022-02-28 22:56:43.95156	2022-02-28 22:56:43.95156	21	420	Male	Full Member	2022-03-02	\N
2132	Mirian Barrientos	f	f	t	t	f	f	f	f		2022-03-01 00:13:23.128728	2022-03-01 00:13:32.639339	33	420	Female	Associate Member	2022-03-02	\N
2131	K Buck	f	f	t	t	f	f	f	f		2022-03-01 00:12:34.411256	2022-03-01 00:16:11.501838	33	420	Male	Full Member	2022-03-02	\N
2134	John D	f	t	t	t	t	f	f	f	Please count me in for dinner Sat. 	2022-03-01 12:42:35.88421	2022-03-01 12:45:38.701073	2	420	Male	Full Member	2022-03-02	\N
2123	Heidi Stuck	f	f	t	t	f	f	f	f	Guest of Jess P. Paid 3/1 via Venmo.	2022-02-27 21:54:18.645327	2022-03-01 19:30:08.783147	137	420	Female	Guest	2022-03-02	\N
2135	Perry F	f	t	t	t	f	f	f	f	Probably not thurs	2022-03-01 23:33:52.40944	2022-03-01 23:34:08.225416	153	420	Male	Full Member	2022-03-02	\N
2168	Jessica Martinez	f	f	t	t	f	f	f	f	Jess is having some trouble with her account so I am making a reservation for her. - DS	2022-03-02 19:56:06.828499	2022-03-02 19:56:06.828499	20	420	Female	Full Member	2022-03-02	\N
2169	Tyler D	f	f	t	t	f	f	f	f	Guest of Perry - maybe 	2022-03-02 23:25:55.611431	2022-03-02 23:25:55.611431	153	420	Male	Guest	2022-03-02	\N
2170	Dominik	f	f	t	t	t	f	f	f		2022-03-02 23:33:59.41516	2022-03-02 23:33:59.41516	267	420	Male	Full Member	2022-03-02	\N
2171	Scott James	f	f	t	t	f	f	f	f		2022-03-03 02:17:35.615179	2022-03-03 02:17:35.615179	257	420	Male	Full Member	2022-03-02	\N
2172	Scott James	f	f	t	t	f	f	f	t		2022-03-03 02:20:42.781219	2022-03-03 02:20:42.781219	257	419	Male	Full Member	2022-03-09	\N
2173	Sara Delaney	f	f	t	t	f	f	f	f	One friend (Paula) will be visiting this weekend	2022-03-03 03:17:32.053281	2022-03-03 03:17:32.053281	31	420	Female	Associate Member	2022-03-02	\N
2174	Peter Walsh	f	f	t	f	f	f	f	t	Peter came to our recent meetup. Nice guy. Pretty sure Friday only. Bringing some friends. -DS	2022-03-03 03:17:44.515725	2022-03-03 03:17:44.515725	20	420	Male	Guest	2022-03-02	\N
2175	Shivaanee Kothavale	f	f	t	f	f	f	f	t	Friend of Peter W.	2022-03-03 03:22:32.354262	2022-03-03 03:22:32.354262	20	420	Female	Guest	2022-03-02	\N
2176	Andy Dey	f	f	t	f	f	f	f	t	Friend of Peter W.	2022-03-03 03:23:13.21916	2022-03-03 03:23:13.21916	20	420	Male	Guest	2022-03-02	\N
2183	Dan Shults	f	f	t	t	f	f	f	t	Not 100% but probably. Going wherever conditions are good between Epic and Indy.	2022-03-08 17:06:09.660975	2022-03-08 17:06:09.660975	20	419	Male	Full Member	2022-03-09	\N
2185	Sara Delaney	f	f	t	t	f	f	f	t	bringing friends	2022-03-09 12:15:27.101703	2022-03-09 12:15:27.101703	31	419	Female	Associate Member	2022-03-09	\N
2186	Andrew Blohm	f	f	t	f	f	f	f	t	Probably staying Friday night and trying to find some snow	2022-03-09 13:30:59.256325	2022-03-09 13:30:59.256325	142	419	Male	Full Member	2022-03-09	\N
2187	Rachel Crateau	f	f	t	t	f	f	f	t		2022-03-09 20:31:06.236194	2022-03-09 20:31:06.236194	261	419	Female	Full Member	2022-03-09	\N
2188	Scott James	f	f	t	t	f	f	f	t		2022-03-10 02:09:03.705624	2022-03-10 02:09:03.705624	257	419	Male	Full Member	2022-03-09	\N
2190	Emily Bularzik	f	f	t	t	f	f	f	t	Delaney’s guest	2022-03-10 16:32:25.017758	2022-03-10 16:32:25.017758	31	419	Female	Guest	2022-03-09	\N
2191	Jamie Smart	f	f	t	t	f	f	f	t	Delaney’s guest	2022-03-10 16:32:58.427339	2022-03-10 16:32:58.427339	31	419	Female	Guest	2022-03-09	\N
2192	Tabby	f	f	t	t	f	f	f	t	Delaney’s guest and Jamie’s friend	2022-03-10 16:33:34.31492	2022-03-10 16:33:34.31492	31	419	Female	Guest	2022-03-09	\N
2193	Matt Chase	f	f	t	t	f	f	f	t	Delaney’s friend	2022-03-10 16:34:06.957802	2022-03-10 16:34:06.957802	31	419	Male	Guest	2022-03-09	\N
2195	Jess P	f	f	t	t	f	f	f	t	Weather dependent, to ski Attitash on Saturday.  Beth's bed unless she is visiting. 	2022-03-14 00:24:24.484612	2022-03-15 22:12:32.359756	137	423	Female	Full Member	2022-03-16	\N
2196	Dan Shults	f	f	t	t	f	f	f	t	Tuckerman's tailgate!	2022-03-14 15:15:00.973332	2022-03-14 15:15:00.973332	20	422	Male	Full Member	2022-03-30	\N
2197	Mike Ryan	f	f	t	t	f	f	f	t	Rain rain go away	2022-03-14 22:15:08.084989	2022-03-14 22:15:08.084989	14	423	Male	Full Member	2022-03-16	\N
2189	Bob Waddell	f	f	t	t	f	f	f	t	Spring skiing!	2022-03-10 13:10:17.214954	2022-03-15 21:05:55.727278	209	423	Male	Full Member	2022-03-16	\N
2198	Bob Waddell	f	f	t	t	f	f	t	t		2022-03-15 21:06:39.805249	2022-03-15 21:06:39.805249	209	424	Male	Full Member	2022-03-23	\N
2208	Dominik Airey	f	f	t	t	t	f	f	f		2022-03-23 01:33:08.633783	2022-03-23 01:33:08.633783	267	424	Male	Full Member	2022-03-23	\N
2184	John D	f	t	t	t	t	f	f	t	Spring skiing!!! I might have a male guest Thurs and Fri. I can find a bed for him if I don’t know before the closure time. 	2022-03-09 00:04:55.184567	2022-03-16 14:39:50.089708	2	423	Male	Full Member	2022-03-16	\N
2201	Bryan Kirk	f	f	f	t	t	f	f	t	Bringing a guest	2022-03-16 15:26:09.293384	2022-03-16 15:26:09.293384	219	423	Male	Full Member	2022-03-16	\N
2202	Dafni Frohman	f	f	f	t	t	f	f	t	Bryan's Guest	2022-03-16 15:26:43.437885	2022-03-16 15:26:43.437885	219	423	Female	Guest	2022-03-16	\N
2203	Rachel Crateau	f	t	t	t	f	f	f	t		2022-03-21 12:45:53.85395	2022-03-21 12:45:53.85395	261	424	Female	Full Member	2022-03-23	\N
2200	Jess P	f	t	t	t	f	f	f	t	Possibly up starting Thursday night. For Wildcat ski instructors dinner.  Beth's bed please, unless she is visiting. 	2022-03-15 22:10:11.394303	2022-03-21 17:50:29.893259	137	424	Female	Full Member	2022-03-23	\N
2204	Scott James	f	t	t	t	f	f	f	t		2022-03-21 23:44:42.615059	2022-03-21 23:44:42.615059	257	424	Male	Full Member	2022-03-23	\N
2205	Mike Ryan	f	t	t	t	f	f	f	t	Wildcat Ski School Party	2022-03-22 12:56:08.613704	2022-03-22 12:56:08.613704	14	424	Male	Full Member	2022-03-23	\N
2206	Mike Ryan	f	t	t	t	t	f	f	t	Maybe On Thursday/Sunday 	2022-03-22 12:57:40.101986	2022-03-22 12:57:40.101986	14	422	Male	Full Member	2022-03-30	\N
2209	Nikki Shults	f	f	t	t	f	f	f	t	Tucks tailgate!	2022-03-23 18:27:02.10358	2022-03-23 18:27:02.10358	9	422	Female	Full Member	2022-03-30	\N
2210	John D	f	t	t	t	t	f	f	t		2022-03-23 18:44:32.63413	2022-03-23 18:44:32.63413	2	424	Male	Full Member	2022-03-23	\N
2199	Bob Waddell	f	f	t	f	f	f	f	t	Motor Booty Weekend! Get out your dancing shoes!	2022-03-15 21:07:56.843271	2022-03-24 00:31:14.907941	209	422	Male	Full Member	2022-03-30	\N
2211	Yanni 	f	f	t	t	f	f	f	t	Guest of Dominik	2022-03-24 00:38:21.402886	2022-03-24 00:38:21.402886	267	424	Male	Guest	2022-03-23	\N
2212	Bob Waddell	f	f	t	t	f	f	f	t		2022-03-25 23:34:29.328958	2022-03-25 23:34:29.328958	209	425	Male	Full Member	2022-04-13	\N
2179	Mollie Watkins	f	f	t	t	f	f	f	t	Friend of Vicki. Coming for hike, not staying at the house. 	2022-03-06 14:27:38.224577	2022-03-26 21:07:51.521412	3	422	Female	Guest	2022-03-30	\N
2180	Peter Watkins	f	f	t	t	f	f	f	t	Friend of Vicki. Coming for hike, not staying at the house.  	2022-03-06 14:28:08.780959	2022-03-26 21:08:36.109257	3	422	Male	Guest	2022-03-30	\N
2213	LORI LAVOIE	f	t	t	t	f	f	f	t	Thurs maybe. Lower bunk. When I'm complaining mid hike remind how excited I was to do this.	2022-03-27 15:25:44.049847	2022-03-27 15:25:44.049847	44	422	Female	Associate Member	2022-03-30	\N
2214	Tommy W	f	f	t	t	f	f	f	t	Probably	2022-03-29 01:45:28.530833	2022-03-29 01:45:28.530833	21	422	Male	Full Member	2022-03-30	\N
2194	JD Martinez	f	f	t	t	f	f	f	t	Tuckerman's Tailgate!	2022-03-12 12:28:31.34284	2022-03-29 15:30:41.066208	260	422	Female	Full Member	2022-03-30	\N
2215	Yoana Kuzmova	f	f	t	t	f	f	f	t	JD's friend. Joining for Tuckerman's Tailgate. Coming up with partner (Baylor Bennett). Gender neutral room, ideally Baylor/Yoana get same bunk set. 	2022-03-29 15:11:03.39309	2022-03-29 15:30:19.001772	260	422	Female	Guest	2022-03-30	\N
2216	Baylor Bennett	f	f	t	t	f	f	f	t	JD's friend. Joining for Tuckerman's Tailgate. Coming up with partner (Yoana Kuzmova). Gender neutral room, ideally Baylor/Yoana get same bunk set. 	2022-03-29 15:11:58.43784	2022-03-29 15:30:28.620749	260	422	Male	Guest	2022-03-30	\N
2217	Bryan Kirk	f	f	t	t	t	f	f	t		2022-03-29 16:25:33.704663	2022-03-29 16:25:33.704663	219	422	Male	Full Member	2022-03-30	\N
2218	Shana B 	f	f	t	t	f	f	f	t		2022-03-29 20:39:28.52453	2022-03-29 20:39:28.52453	57	422	Female	Full Member	2022-03-30	\N
2219	Doug Kinkenon 	f	f	t	t	f	f	f	t		2022-03-29 20:41:00.844521	2022-03-29 20:41:00.844521	57	422	Male	Guest	2022-03-30	\N
2220	Perry F	f	f	t	t	f	f	f	t	Possibly 	2022-03-29 23:08:04.121673	2022-03-29 23:08:04.121673	153	422	Male	Full Member	2022-03-30	\N
2221	Alana M	f	f	t	t	f	f	f	t	Not 100%…	2022-03-30 10:33:45.661899	2022-03-30 10:33:45.661899	23	422	Female	Full Member	2022-03-30	\N
2222	Brett Willey	f	f	t	t	f	f	f	t	This is Brett's third visit, I think? He has applied for membership!	2022-03-30 15:55:54.329079	2022-03-30 15:55:54.329079	20	422	Male	Guest	2022-03-30	\N
2223	Andy Kall	f	f	t	t	f	f	f	t	A friend of Brett Willey. First time visiting. 	2022-03-30 15:56:36.678807	2022-03-30 15:56:36.678807	20	422	Male	Guest	2022-03-30	\N
2224	kurt Yang	f	f	t	t	f	f	f	t	Maybe	2022-03-30 20:47:04.753786	2022-03-30 20:47:04.753786	10	422	Male	Full Member	2022-03-30	\N
2225	Dominik	f	f	t	t	t	f	f	t		2022-03-30 23:52:05.326612	2022-03-30 23:52:05.326612	267	426	Male	Full Member	2022-05-25	\N
2226	Dominik	f	f	t	t	t	f	f	t		2022-03-30 23:53:16.827256	2022-03-30 23:53:16.827256	267	422	Male	Full Member	2022-03-30	\N
2227	John D	f	f	t	t	f	f	f	t	Very tentative. I figure it’s better to be on the list and not show up rather than show up without a reservation. 	2022-04-05 12:19:13.811966	2022-04-05 12:19:13.811966	2	418	Male	Full Member	2022-04-06	\N
2228	Vicki S	f	f	t	t	f	f	f	t	Coming up for Race Awards ceremony.	2022-04-05 14:27:25.169548	2022-04-05 14:28:14.301768	3	418	Female	Full Member	2022-04-06	\N
2229	Perry F	f	f	t	t	f	f	f	t	Maybe???	2022-04-05 16:38:07.659385	2022-04-05 16:38:07.659385	153	418	Male	Full Member	2022-04-06	\N
2230	Chris B	f	f	t	t	f	f	f	t	Spring Fling!!!! 	2022-04-05 16:41:44.437557	2022-04-05 16:41:44.437557	15	418	Male	Full Member	2022-04-06	\N
2231	Alana M	f	f	t	t	f	f	f	t	Race awards	2022-04-05 20:32:01.388045	2022-04-05 20:32:01.388045	23	418	Female	Full Member	2022-04-06	\N
2232	Tom Wall	f	f	t	t	f	f	f	t		2022-04-05 21:00:04.093249	2022-04-05 21:00:04.093249	21	418	Male	Full Member	2022-04-06	\N
2233	Ron Swanick	f	f	t	t	f	f	f	t	Guest of Chris B (Tentative)	2022-04-06 15:12:15.704955	2022-04-06 15:12:15.704955	15	418	Male	Guest	2022-04-06	\N
2234	Trevor Rowe	f	f	t	t	f	f	f	t		2022-04-07 00:47:17.413558	2022-04-07 00:47:17.413558	259	418	Male	Full Member	2022-04-06	\N
2235	John D	f	f	t	t	f	f	f	t	If the weather cooperates we may go to Sunday River for the weekend. 	2022-04-13 15:45:12.780463	2022-04-13 15:45:12.780463	2	425	Male	Full Member	2022-04-13	\N
2236	Perry	f	f	t	t	f	f	f	t	Only if the weather changes to no rain 	2022-04-13 22:10:26.485212	2022-04-13 22:10:26.485212	153	425	Male	Full Member	2022-04-13	\N
2237	Bob Waddell	f	f	t	t	f	f	f	t		2022-04-18 11:44:35.947814	2022-04-18 11:44:35.947814	209	427	Male	Full Member	2022-04-20	\N
2238	Perry F	f	f	t	t	f	f	f	t	Friday, maybe Saturday 	2022-04-19 16:14:46.647919	2022-04-19 16:14:46.647919	153	427	Male	Full Member	2022-04-20	\N
2239	Tyler D	f	f	t	t	f	f	f	t	Guest of Perry 	2022-04-19 16:15:23.424559	2022-04-19 16:15:23.424559	153	427	Male	Guest	2022-04-20	\N
2240	Nancy Murphy	f	f	t	t	f	f	f	t	Work weekend	2022-04-25 01:26:26.157656	2022-04-25 01:27:03.062376	51	428	Female	Full Member	2022-06-22	\N
2245	Bob Waddell	t	t	t	t	t	f	f	t	Work Weekend	2022-05-03 10:59:56.530736	2022-06-21 23:07:36.069684	209	429	Male	Full Member	2022-06-22	\N
2242	JD Martinez	f	t	t	t	f	f	f	t	Spring work weekend II. Gotta install Roxy (feminist nutcracker)! I'm not bad with power tools, light electrical work (ha, I'm hilarious), and/or heavier lifting stuff. Also happy to just clean stuff-- whatever is of most use :)	2022-04-25 15:02:39.388341	2022-04-25 15:02:39.388341	260	429	Female	Full Member	2022-06-22	\N
2244	Dane Araujo	f	f	t	t	f	f	f	t	Work Weekend	2022-04-27 16:51:55.73579	2022-04-27 16:51:55.73579	154	430	Male	Full Member	2022-06-01	\N
2259	Chris B.	f	f	t	t	f	f	f	t	Spring Work Weekend!	2022-05-29 04:26:15.536541	2022-05-29 04:26:15.536541	15	434	Male	Full Member	2022-07-20	\N
2246	Bob Waddell	t	t	f	t	t	f	f	t	Out Hiking	2022-05-03 11:01:09.750316	2022-05-03 11:01:09.750316	209	431	Female	Full Member	2022-05-04	\N
2247	Nikki Shults	f	t	t	t	f	f	f	t	This hole gets worse and worse every weekend. 	2022-05-04 19:56:28.594242	2022-05-04 19:56:28.594242	9	432	Female	Full Member	2022-05-18	\N
2248	Dane Araujo	f	f	t	t	f	f	f	t	Fishing and kayaking, maybe even grill...I just don't know if we'll have enough time	2022-05-09 14:35:06.781141	2022-05-09 14:35:06.781141	154	433	Male	Full Member	2022-05-11	\N
2249	Perry F	f	t	f	f	f	f	f	t	…if I can get work off	2022-05-11 22:36:03.704244	2022-05-11 22:36:03.704244	153	433	Male	Full Member	2022-05-11	\N
2250	Yasmine K	f	t	f	f	f	f	f	t	Guest of Perry 	2022-05-11 22:36:43.461422	2022-05-11 22:36:43.461422	153	433	Female	Guest	2022-05-11	\N
2251	Michelle Comtois	f	f	t	f	f	f	f	t	Maybe Saturday night 	2022-05-11 23:37:23.107094	2022-05-11 23:37:23.107094	5	433	Female	Full Member	2022-05-11	\N
2252	Mike Ryan	f	t	t	t	f	f	f	t	Doing a little floor fixing, may not stay Saturday night. 	2022-05-16 15:59:05.035553	2022-05-16 15:59:05.035553	14	432	Male	Full Member	2022-05-18	\N
2254	Mike Ryan	f	f	t	t	f	f	f	t	Work weekend. Maybe Thursday and/or Sunday too.	2022-05-16 16:08:06.126211	2022-05-16 16:08:06.126211	14	429	Male	Full Member	2022-06-22	\N
2255	Bob Waddell	t	t	f	f	f	f	f	t		2022-05-20 09:57:05.651366	2022-05-20 09:57:05.651366	209	426	Male	Full Member	2022-05-25	\N
2256	Perry	f	f	t	t	t	f	f	t	Most likely not…just adding in case my other plans don’t work 	2022-05-25 22:33:46.72797	2022-05-25 22:33:46.72797	153	426	Male	Full Member	2022-05-25	\N
2257	Yasmine K	f	f	t	t	t	f	f	t	Guest of Perry	2022-05-25 22:34:42.090647	2022-05-25 22:34:42.090647	153	426	Female	Guest	2022-05-25	\N
2243	Bob Waddell	f	f	t	f	t	f	f	t	out hiking	2022-04-25 22:29:52.911832	2022-05-26 10:17:38.333	209	430	Male	Full Member	2022-06-01	\N
2258	Alana m	f	f	t	t	f	f	f	t	Work weekend 	2022-05-28 01:21:17.703629	2022-05-28 01:21:17.703629	23	430	Female	Full Member	2022-06-01	\N
2260	Chris B	f	f	t	t	f	f	f	t	Spring Work Weekend!!!	2022-05-30 03:36:21.130307	2022-05-30 03:36:21.130307	15	429	Male	Full Member	2022-06-22	\N
2262	John	f	f	t	t	t	t	f	t		2022-06-01 15:41:30.155242	2022-06-01 15:41:30.155242	2	430	Male	Full Member	2022-06-01	\N
2261	Rachel Crateau	f	f	t	t	f	f	f	t	Work Weekend	2022-05-31 23:38:02.76272	2022-06-01 23:21:46.077601	261	430	Female	Full Member	2022-06-01	\N
2264	Scott James	f	f	t	t	f	f	f	t	Da Roof, Da Roof....Da Roof is on fire	2022-06-02 01:21:54.541384	2022-06-02 01:21:54.541384	257	430	Male	Full Member	2022-06-01	\N
2265	Michelle Comtois	f	t	t	t	f	f	f	t		2022-06-02 15:58:39.479584	2022-06-02 15:58:39.479584	5	429	Female	Full Member	2022-06-22	\N
2266	Bob Waddell	f	f	t	f	t	t	f	t	Hiking/Camping	2022-06-08 09:52:23.136168	2022-06-08 09:52:23.136168	209	436	Male	Full Member	2022-06-08	\N
2268	ke kurt yang	f	f	f	f	t	t	f	t		2022-06-09 17:49:39.388873	2022-06-09 17:49:39.388873	10	436	Male	Full Member	2022-06-08	\N
2269	Bob Waddell	f	f	f	f	f	f	t	t		2022-06-13 09:45:19.090677	2022-06-13 09:45:19.090677	209	437	Male	Full Member	2022-06-15	\N
2270	Michelle Comtois	f	t	t	t	f	f	f	t	Tubing 	2022-06-13 14:58:06.708374	2022-06-13 14:58:06.708374	5	435	Female	Full Member	2022-07-13	\N
2271	Bryan Kirk	f	t	t	t	t	f	f	t		2022-06-14 12:55:21.901938	2022-06-14 12:55:21.901938	219	437	Male	Full Member	2022-06-15	\N
2272	Mike Ryan	f	f	t	t	f	f	f	t	Bike Week	2022-06-15 22:15:02.707606	2022-06-15 22:15:02.707606	14	437	Male	Full Member	2022-06-15	\N
2273	B. Halpin	f	f	f	t	f	f	f	t	Bike Week	2022-06-15 22:15:29.416861	2022-06-15 22:15:29.416861	14	437	Male	Guest	2022-06-15	\N
2274	Nick Cole	f	f	f	t	f	f	f	t	Bike Week	2022-06-15 22:15:55.92049	2022-06-15 22:15:55.92049	14	437	Male	Guest	2022-06-15	\N
2267	Nancy Murphy	f	f	t	t	f	f	f	f	Tubing!	2022-06-09 15:15:50.736151	2022-07-05 22:44:20.277045	51	435	Female	Full Member	2022-07-13	\N
2275	Joe Griffin 	f	f	f	t	f	f	f	t	Bike Week	2022-06-15 22:16:18.944366	2022-06-15 22:16:18.944366	14	437	Male	Guest	2022-06-15	\N
2276	T Wall	f	t	t	t	f	f	f	t	Bike Week (Thurs/Fri? Arrival)	2022-06-15 22:57:31.223798	2022-06-15 22:57:31.223798	21	437	Male	Full Member	2022-06-15	\N
2277	Alana McCarthy 	f	f	t	t	f	f	f	f	Tubing!	2022-06-18 12:59:36.060065	2022-06-18 12:59:36.060065	23	435	Female	Full Member	2022-07-13	\N
2278	John D	f	t	t	t	t	f	f	t	I’ll be around as I have an appt to get the RV worked on Friday and can help with Work Weekend activities. 	2022-06-19 13:13:08.330899	2022-06-19 13:13:08.330899	2	429	Male	Full Member	2022-06-22	\N
2279	Perry F	f	f	t	t	f	f	f	t	Work weekend 	2022-06-20 00:27:58.072237	2022-06-20 00:27:58.072237	153	429	Male	Full Member	2022-06-22	\N
2280	Dominik	f	f	t	t	t	f	f	t		2022-06-20 14:00:14.532085	2022-06-20 14:00:14.532085	267	429	Male	Full Member	2022-06-22	\N
2241	Jess P	f	f	t	t	f	f	f	t	Spring work weekend 	2022-04-25 10:53:59.324931	2022-06-21 17:29:47.474194	137	429	Female	Full Member	2022-06-22	\N
2281	Andrew Blohm	f	f	t	t	f	f	f	t	Work weekend 	2022-06-22 04:11:25.352015	2022-06-22 04:11:25.352015	142	429	Male	Full Member	2022-06-22	\N
2282	Corey Landsman	f	f	f	t	f	f	f	t	Work weekend 	2022-06-22 04:12:20.541185	2022-06-22 04:12:20.541185	142	429	Female	Full Member	2022-06-22	\N
2283	Shana Biletch	f	f	t	t	f	f	f	t	Work weekend!	2022-06-22 21:10:48.745567	2022-06-22 21:11:08.756282	57	429	Female	Full Member	2022-06-22	\N
2284	Doug Kinkenon	f	f	t	t	f	f	f	t		2022-06-22 21:11:42.179575	2022-06-22 21:11:42.179575	57	429	Male	Guest	2022-06-22	\N
2285	Vicki Santarcangelo	f	t	t	t	f	f	f	t	Work weekend. I think. Maybe. Gonna try.	2022-06-22 23:23:32.559779	2022-06-22 23:23:32.559779	3	429	Female	Full Member	2022-06-22	\N
2287	Dane Araujo	f	f	t	t	f	f	f	f	Tubing!	2022-06-28 14:38:31.235524	2022-06-28 14:38:31.235524	154	435	Male	Full Member	2022-07-13	\N
2288	Perry F	f	f	t	t	t	f	f	t		2022-06-28 23:50:01.851564	2022-06-28 23:50:01.851564	153	428	Male	Full Member	2022-06-29	\N
2289	James S	f	f	t	t	t	f	f	t	Guest of perry	2022-06-28 23:50:34.950011	2022-06-28 23:50:34.950011	153	428	Male	Guest	2022-06-29	\N
2290	Yasmine K	f	f	t	t	t	f	f	t	Guest of Perry	2022-06-28 23:50:57.49623	2022-06-28 23:50:57.49623	153	428	Female	Guest	2022-06-29	\N
2291	Jake Taylor	f	f	t	t	f	f	f	f	Jake has come to our meetups and has visited the club once before. Good prospect! - DS	2022-06-29 17:28:13.743626	2022-06-29 17:28:13.743626	20	435	Male	Guest	2022-07-13	\N
2292	Dan Shults	f	f	t	t	f	f	f	f	Floats m'goats.	2022-06-29 17:30:42.940014	2022-06-29 17:30:42.940014	20	435	Male	Full Member	2022-07-13	\N
2293	K Yang	f	f	f	f	f	t	t	t	Maybe	2022-06-29 20:32:42.858408	2022-06-29 20:32:42.858408	10	428	Male	Full Member	2022-06-29	\N
2294	Bryan Kirk	t	t	t	t	t	f	f	t		2022-07-01 17:41:54.102678	2022-07-01 17:41:54.102678	219	438	Male	Full Member	2022-07-06	\N
2295	Amy Candelora	f	f	t	t	f	f	f	t	Tubing!	2022-07-04 00:13:09.321633	2022-07-04 00:13:09.321633	16	435	Female	Full Member	2022-07-13	\N
2296	Chris Candelora 	f	f	t	t	f	f	f	t	Tubing!	2022-07-04 00:13:49.686267	2022-07-04 00:13:49.686267	16	435	Male	Full Member	2022-07-13	\N
2297	Tommy W	f	f	t	t	f	f	f	f	Tubing!!	2022-07-04 16:52:14.65012	2022-07-04 16:52:14.65012	23	435	Male	Full Member	2022-07-13	\N
2298	Bryan Kirk	f	f	t	t	t	f	f	t	Tubing!	2022-07-04 22:35:26.195286	2022-07-04 22:35:26.195286	219	435	Male	Full Member	2022-07-13	\N
2299	Bob Waddell	f	f	t	t	t	f	f	t	biking northern rail trail	2022-07-05 18:02:06.188611	2022-07-05 18:02:06.188611	209	438	Male	Full Member	2022-07-06	\N
2300	Agnes Patnode	f	f	f	t	f	f	f	t	Guest of Bob Waddell	2022-07-05 18:03:26.09297	2022-07-05 18:03:26.09297	209	438	Female	Guest	2022-07-06	\N
2301	Dan Shults	f	f	t	f	f	f	f	t		2022-07-05 19:52:22.715182	2022-07-05 19:52:22.715182	20	438	Male	Full Member	2022-07-06	\N
2302	Tyler Short	f	f	t	f	f	f	f	t	Guest of Dan	2022-07-05 19:53:04.286005	2022-07-05 19:53:04.286005	20	438	Male	Guest	2022-07-06	\N
2303	Nathaniel Rewey	f	f	t	f	f	f	f	t	Guest of Dan	2022-07-05 19:54:19.750503	2022-07-05 19:54:19.750503	20	438	Male	Guest	2022-07-06	\N
2304	Dave Cohen	f	f	t	f	f	f	f	t	Guest of Dan	2022-07-05 19:55:12.573538	2022-07-05 19:55:12.573538	20	438	Male	Guest	2022-07-06	\N
2305	Nikki Shults	f	f	t	t	f	f	f	t		2022-07-06 12:32:56.024892	2022-07-06 12:32:56.024892	9	438	Female	Full Member	2022-07-06	\N
2306	Mike Ryan	f	f	f	t	f	f	f	f	Not floating :(	2022-07-06 18:08:23.13929	2022-07-06 18:09:03.261837	14	435	Male	Full Member	2022-07-13	\N
2351	Bob Waddell	f	f	t	t	f	f	f	t		2022-07-17 19:46:32.850366	2022-07-17 19:46:32.850366	209	434	Male	Full Member	2022-07-20	\N
2307	Shana Biletch	f	f	t	t	f	f	f	t		2022-07-06 20:20:36.311708	2022-07-06 20:20:36.311708	57	438	Female	Full Member	2022-07-06	\N
2308	Doug Kinkenon 	f	f	t	t	f	f	f	t	Shana’s guest 	2022-07-06 20:54:50.436475	2022-07-06 20:54:50.436475	57	438	Male	Guest	2022-07-06	\N
2309	Stephenie Hou	f	f	f	t	f	f	f	t	Friend of Nikki	2022-07-06 21:39:12.262328	2022-07-06 21:39:12.262328	9	438	Female	Guest	2022-07-06	\N
2310	Belinda	f	f	f	t	f	f	f	t	Guest of Nikki	2022-07-06 21:40:22.046341	2022-07-06 21:40:22.046341	9	438	Female	Guest	2022-07-06	\N
2311	Beth 	f	f	f	t	f	f	f	t	Guest of Nikki	2022-07-06 21:40:43.299822	2022-07-06 21:40:43.299822	9	438	Female	Guest	2022-07-06	\N
2312	Perry	f	f	t	t	f	f	f	t	Maybe	2022-07-06 22:01:33.681404	2022-07-06 22:01:33.681404	153	438	Male	Full Member	2022-07-06	\N
2313	Yasmine K	f	f	t	t	f	f	f	t	Guest of Perry 	2022-07-06 22:02:04.73832	2022-07-06 22:02:04.73832	153	438	Female	Guest	2022-07-06	\N
2314	Marissa	f	f	f	t	f	f	f	t	guest of nikki	2022-07-07 15:32:25.650272	2022-07-07 15:32:25.650272	9	438	Female	Guest	2022-07-06	\N
2352	Dan Shults	f	f	t	t	f	f	f	f	Bump/Set/Spike!	2022-07-18 13:52:57.766305	2022-07-18 13:52:57.766305	20	439	Male	Full Member	2022-08-03	\N
2353	Scott James	f	f	f	f	f	f	t	t		2022-07-19 23:11:32.676302	2022-07-19 23:11:32.676302	257	440	Male	Full Member	2022-07-27	\N
2315	JD Martinez	f	f	t	t	f	f	f	t	Tubing weekend!!! Might come up a little sooner; I'll update accordingly. 	2022-07-09 10:53:45.505343	2022-07-09 10:53:45.505343	260	435	Female	Full Member	2022-07-13	\N
2348	Trevor Rowe	f	f	t	t	t	f	f	t		2022-07-10 01:10:20.961799	2022-07-10 01:10:20.961799	259	435	Male	Full Member	2022-07-13	\N
2354	Rachel Crateau	f	f	f	f	f	f	t	t		2022-07-19 23:11:37.181128	2022-07-19 23:11:37.181128	261	440	Female	Full Member	2022-07-27	\N
2349	K Buck	f	f	t	t	f	f	f	t	Saaaaaaco!! Veggie dinner puh-lease 	2022-07-12 01:51:31.607822	2022-07-12 01:51:45.560477	33	435	Male	Full Member	2022-07-13	\N
2350	Mirian! 	f	f	t	t	f	f	f	t	Carnivorous dinner please 	2022-07-12 01:52:21.95486	2022-07-12 01:52:21.95486	33	435	Female	Full Member	2022-07-13	\N
2355	Rachel Crateau	t	t	t	t	f	f	f	t		2022-07-19 23:12:16.120732	2022-07-19 23:12:16.120732	261	439	Female	Full Member	2022-08-03	\N
2263	Jess P	f	f	t	t	f	f	f	f	Yay, I've finally tested negative today, 7/13!  Not tubing though. Beth's bed please	2022-06-01 15:46:34.599699	2022-07-13 16:56:44.905193	137	435	Female	Full Member	2022-07-13	\N
2356	Scott James	t	t	t	t	f	f	f	t		2022-07-19 23:12:20.35598	2022-07-19 23:12:20.35598	257	439	Male	Full Member	2022-08-03	\N
2357	Perry F	f	t	t	t	f	f	f	t	Only if the river is high enough 	2022-07-20 14:23:03.124881	2022-07-20 14:23:03.124881	153	434	Male	Full Member	2022-07-20	\N
2358	Yasmine K	f	t	t	t	f	f	f	t	Guest of Perry 	2022-07-20 14:23:32.376653	2022-07-20 14:23:32.376653	153	434	Female	Guest	2022-07-20	\N
2360	Dane Araujo	f	f	t	t	f	f	f	t	Hiking and fishing	2022-07-21 10:50:59.623744	2022-07-21 10:50:59.623744	154	434	Male	Full Member	2022-07-20	\N
2361	Jim Donaldson	f	f	t	t	f	f	f	t	Guest of Dane hiking	2022-07-21 10:51:33.042367	2022-07-21 10:51:33.042367	154	434	Male	Guest	2022-07-20	\N
2362	Perry F	f	f	t	t	f	f	f	t		2022-07-25 13:25:52.174197	2022-07-25 13:25:52.174197	153	440	Male	Full Member	2022-07-27	\N
2363	Bob Waddell	t	f	f	f	f	f	f	t		2022-07-26 20:21:27.338503	2022-07-26 20:21:27.338503	209	440	Male	Full Member	2022-07-27	\N
2364	Yasmine K	f	f	t	t	f	f	f	t	Guest of Perry 	2022-07-26 22:36:29.234993	2022-07-26 22:36:29.234993	153	440	Female	Guest	2022-07-27	\N
2365	Tyler D	f	f	t	t	f	f	f	t	Guest of Perry	2022-07-27 22:53:13.794947	2022-07-27 22:53:13.794947	153	440	Male	Guest	2022-07-27	\N
2366	Apollo Z	f	f	t	t	f	f	f	t	Guest of Perry	2022-07-27 22:53:45.405314	2022-07-27 22:53:45.405314	153	440	Male	Guest	2022-07-27	\N
2367	Mike Ryan	f	f	t	t	f	f	f	f	Volley Ball - Maybe Thursday or Sunday night too.	2022-07-28 20:40:58.713717	2022-07-28 20:40:58.713717	14	439	Male	Full Member	2022-08-03	\N
2368	Dominik	f	f	f	t	t	f	f	f		2022-08-02 07:54:58.76885	2022-08-02 07:54:58.76885	267	439	Male	Full Member	2022-08-03	\N
2359	Nancy Murphy	f	f	t	t	f	f	f	f	Painting the closet in Attitash/VB dinner/party	2022-07-20 14:53:52.863357	2022-08-02 18:27:59.266963	51	439	Female	Full Member	2022-08-03	\N
2369	TWall	f	f	t	t	f	f	f	f		2022-08-02 19:27:44.364546	2022-08-02 19:27:44.364546	21	439	Male	Full Member	2022-08-03	\N
2370	Bob Waddell	f	f	f	t	f	f	f	t		2022-08-09 12:54:08.697027	2022-08-09 12:54:08.697027	209	441	Male	Full Member	2022-08-10	\N
2371	Alana M	f	f	t	t	f	f	f	t	Girls weekend!!	2022-08-14 17:06:34.807902	2022-08-14 17:06:34.807902	23	442	Female	Full Member	2022-09-28	\N
2372	Nikki Shults	f	f	f	f	t	t	t	t		2022-08-15 22:43:27.327153	2022-08-15 22:43:27.327153	9	443	Female	Full Member	2022-08-17	\N
2373	Nikki Shults	t	t	t	t	f	f	f	t		2022-08-15 22:43:51.280805	2022-08-15 22:43:51.280805	9	444	Female	Full Member	2022-08-24	\N
2374	Nikki Shults	f	f	f	t	f	f	f	t		2022-08-15 22:44:11.769176	2022-08-15 22:44:11.769176	9	443	Female	Full Member	2022-08-17	\N
2375	Jess Simao	f	f	f	f	t	t	t	t	Guest of Nikki. Some nights will be on the trail, weather permitting 	2022-08-15 22:45:31.606477	2022-08-15 22:45:31.606477	9	443	Female	Guest	2022-08-17	\N
2376	Jess Simao	t	t	t	t	f	f	f	t	Guest of Nikki. Some nights will be on the trail, weather permitting 	2022-08-15 22:45:58.191667	2022-08-15 22:45:58.191667	9	444	Female	Guest	2022-08-24	\N
2377	Shana Biletch	f	f	t	t	f	f	f	t	Girls weekend! 	2022-08-16 01:01:50.615093	2022-08-16 01:01:50.615093	57	442	Female	Full Member	2022-09-28	\N
2379	Michelle Comtois	f	f	t	t	f	f	f	t		2022-08-16 19:52:55.080393	2022-08-16 19:52:55.080393	5	442	Female	Full Member	2022-09-28	\N
2380	Bob Waddell	f	f	f	t	t	f	f	t	Carrigan/ Washington	2022-08-17 13:05:16.277178	2022-08-17 13:05:16.277178	209	443	Male	Full Member	2022-08-17	\N
2381	John D	t	t	t	t	t	f	f	t	I will likely be farting around Crawford Notch starting 8/29 through the following weekend. I may stop by to use the kitchen, shower up or sleep in the lot. 	2022-08-23 15:37:32.811768	2022-08-23 15:37:32.811768	2	444	Male	Full Member	2022-08-24	\N
2387	John D	f	t	t	t	f	f	f	t	Returning from the Presies. 	2022-08-23 15:45:10.613937	2022-08-23 15:45:10.613937	2	446	Male	Full Member	2022-09-14	\N
2388	Robert and Warren	f	t	t	f	f	f	f	t	Tentatively adding Robert and Warren as we come out of the Presies. 	2022-08-23 15:46:42.193118	2022-08-23 15:46:42.193118	2	446	Male	Guest	2022-09-14	\N
2444	Andrew Blohm	f	f	t	t	f	f	f	t	Work weekend 	2022-10-15 17:14:49.329247	2022-10-15 17:14:49.329247	142	447	Male	Full Member	2022-10-26	\N
2382	John D	t	t	t	t	f	f	f	t	Bringing guests. 	2022-08-23 15:39:36.543715	2022-08-27 18:00:10.632933	2	445	Male	Full Member	2022-09-07	\N
2383	Robert Vogel	f	f	f	t	f	f	f	t	Guest of John D. Staying Sat night 	2022-08-23 15:41:12.777816	2022-08-27 18:01:29.276142	2	445	Male	Guest	2022-09-07	\N
2384	Warren Nadler	f	f	f	t	f	f	f	t	Guest of John D. Staying Sat night 	2022-08-23 15:42:01.748246	2022-08-27 18:02:38.093321	2	445	Male	Guest	2022-09-07	\N
2385	Natalie Vogel	f	f	f	t	f	f	f	t	Guest of John D. Staying Sat night 	2022-08-23 15:42:45.242369	2022-08-27 18:04:00.009154	2	445	Female	Guest	2022-09-07	\N
2386	Ryan (friend of Natalie Vogel. Guest of John. 	f	f	f	t	f	f	f	t	Guest of John D. Friend of Natalie. Staying Sat night 	2022-08-23 15:43:53.488835	2022-08-27 18:05:39.15616	2	445	Male	Guest	2022-09-07	\N
2389	Sara Delaney	f	f	t	t	t	f	f	t	Girls weekend 	2022-08-29 15:26:03.000165	2022-08-29 15:26:03.000165	31	442	Female	Associate Member	2022-09-28	\N
2390	Vicki S	f	f	t	t	f	f	f	t	Girl’s Weekend	2022-09-04 15:39:49.607278	2022-09-04 15:39:49.607278	3	442	Female	Full Member	2022-09-28	\N
2391	Nikki Shults	f	f	t	t	f	f	f	t	work weekend and mak's halloween party	2022-09-14 23:20:40.473454	2022-09-14 23:20:40.473454	9	447	Female	Full Member	2022-10-26	\N
2392	kurt Yang	f	t	t	t	t	t	f	t	work weekend	2022-09-15 18:24:55.052679	2022-09-15 18:24:55.052679	10	448	Male	Full Member	2022-11-02	\N
2395	Nancy Murphy	f	t	t	t	f	f	f	t	Work weekend	2022-09-19 01:46:44.236349	2022-10-15 21:54:59.899204	51	447	Female	Full Member	2022-10-26	\N
2378	Nancy Murphy	f	t	t	t	f	f	f	t	Girls weekend	2022-08-16 14:54:33.494424	2022-09-19 01:45:48.625791	51	442	Female	Full Member	2022-09-28	\N
2429	Alena Daisy	f	f	t	t	f	f	f	t	Guest of Bob Waddell	2022-09-21 20:10:15.171155	2022-09-21 20:10:15.171155	209	483	Female	Guest	2022-09-21	\N
2445	Perry F	f	f	t	t	f	f	f	t	Work weekend 	2022-10-16 17:18:39.050129	2022-10-16 17:18:39.050129	153	447	Male	Full Member	2022-10-26	\N
2430	Bob Waddell	t	t	t	t	f	f	f	t		2022-09-21 20:11:20.862171	2022-09-21 20:11:20.862171	209	483	Male	Full Member	2022-09-21	\N
2431	Rachel Crateau	f	f	t	t	f	f	f	t	Work Weekend 	2022-09-21 21:45:09.190984	2022-09-21 21:45:09.190984	261	447	Female	Full Member	2022-10-26	\N
2432	Michelle Comtois	f	f	t	t	f	f	f	t		2022-09-26 13:58:57.872577	2022-09-26 13:58:57.872577	5	447	Female	Full Member	2022-10-26	\N
2433	Mike Ryan	f	f	t	t	t	f	f	t		2022-09-28 16:04:46.199574	2022-09-28 16:04:46.199574	14	484	Male	Full Member	2022-10-05	\N
2434	B. Halpin	f	f	t	t	t	f	f	t		2022-09-28 16:05:18.956067	2022-09-28 16:05:18.956067	14	484	Male	Guest	2022-10-05	\N
2435	Nick Cole	f	f	t	t	t	f	f	t		2022-09-28 16:05:36.674177	2022-09-28 16:05:36.674177	14	484	Male	Guest	2022-10-05	\N
2436	k Buck	f	f	t	t	t	f	f	t		2022-10-03 13:26:50.592184	2022-10-03 13:26:50.592184	33	484	Male	Full Member	2022-10-05	\N
2437	Chris Bromery	f	f	t	t	f	f	f	t	Work Weekend + Mak's Party!!!!	2022-10-06 02:19:15.060935	2022-10-06 02:19:15.060935	15	447	Male	Full Member	2022-10-26	\N
2438	JD Martinez	f	f	t	t	f	f	f	t	Work weekend	2022-10-13 19:46:32.34432	2022-10-13 19:46:32.34432	260	447	Female	Full Member	2022-10-26	\N
2439	Bryan Kirk	f	f	t	t	t	f	f	t	Work weekend!	2022-10-13 19:47:47.490783	2022-10-13 19:47:47.490783	219	447	Male	Full Member	2022-10-26	\N
2440	Dane Araujo	f	f	t	t	f	f	f	t	Work Weekend	2022-10-13 20:03:57.023785	2022-10-13 20:03:57.023785	154	447	Male	Full Member	2022-10-26	\N
2441	Dominik	f	f	f	t	t	f	f	t		2022-10-13 22:29:28.816406	2022-10-13 22:29:28.816406	267	447	Male	Full Member	2022-10-26	\N
2396	Bob Waddell	f	f	t	t	t	t	t	t		2022-09-19 15:22:56.639031	2022-10-14 11:00:15.796928	209	450	Male	Full Member	2022-10-19	\N
2442	Bob Waddell	f	f	t	t	t	f	f	t		2022-10-14 11:00:44.597301	2022-10-14 11:00:44.597301	209	447	Male	Full Member	2022-10-26	\N
2443	Corey Blohm	f	f	t	t	f	f	f	t	Work weekend 	2022-10-15 17:14:18.957121	2022-10-15 17:14:18.957121	142	447	Female	Full Member	2022-10-26	\N
2446	John D	t	t	t	t	t	t	f	t	I will be up the week before Oct Work Weekend. 	2022-10-19 12:50:42.589094	2022-10-19 12:50:42.589094	2	447	Male	Full Member	2022-10-26	\N
2447	Mike Ryan	f	f	t	t	f	f	f	t	WORK WORK WORK!!!!	2022-10-22 14:12:44.808829	2022-10-22 14:12:44.808829	14	447	Male	Full Member	2022-10-26	\N
2448	Vicki S	f	t	t	t	f	f	f	t	Work weekend	2022-10-25 16:23:27.33244	2022-10-25 16:23:27.33244	3	447	Female	Full Member	2022-10-26	\N
2449	Alana McCarthy 	f	f	t	t	f	f	f	t	Maybe for work weekend- real work may interfere	2022-10-25 21:14:41.109601	2022-10-25 21:14:41.109601	23	447	Female	Full Member	2022-10-26	\N
2450	Bob Waddell	t	f	f	t	t	t	f	t		2022-11-01 10:49:19.817141	2022-11-01 10:49:19.817141	209	448	Male	Full Member	2022-11-02	\N
2451	Nung	f	f	f	t	f	f	f	t		2022-11-02 21:14:51.101223	2022-11-02 21:14:51.101223	7	448	Male	Full Member	2022-11-02	\N
2452	Trevor Rowe	f	f	t	t	t	f	f	t	Work Weekend 	2022-11-02 23:58:41.696833	2022-11-02 23:58:41.696833	259	448	Male	Full Member	2022-11-02	\N
2453	Bob Waddell	f	t	f	f	f	t	t	t		2022-11-09 01:44:36.075703	2022-11-09 01:44:36.075703	209	485	Male	Full Member	2022-11-09	\N
2454	Perry F	f	f	t	t	f	f	f	t	…If wildcat opens	2022-11-14 18:45:04.206748	2022-11-14 18:45:04.206748	153	486	Male	Full Member	2022-11-16	\N
2455	Yasmine K	f	f	t	t	f	f	f	t	Guest of Perry 	2022-11-16 16:19:01.560804	2022-11-16 16:19:01.560804	153	486	Female	Guest	2022-11-16	\N
2456	Bob Waddell	t	t	f	f	t	f	f	t		2022-11-17 00:00:27.030718	2022-11-17 00:00:27.030718	209	486	Male	Full Member	2022-11-16	\N
2457	Mike Ryan	f	t	t	t	f	f	f	t	Thursday is a maybe	2022-11-21 21:24:32.879877	2022-11-21 21:25:52.776588	14	487	Male	Full Member	2022-11-30	\N
2458	Mike Ryan	f	t	t	t	t	f	f	f		2022-11-21 21:25:15.762515	2022-11-21 21:26:02.335824	14	488	Male	Full Member	2022-12-07	\N
2459	Mike Ryan	f	f	f	f	f	t	t	t		2022-11-21 21:26:47.03	2022-11-21 21:26:47.03	14	489	Male	Full Member	2022-12-21	\N
2460	Mike Ryan	t	t	t	t	t	f	f	t		2022-11-21 21:27:32.456578	2022-11-21 21:27:32.456578	14	490	Male	Full Member	2022-12-28	\N
2461	Nancy Murphy	f	f	t	t	f	f	f	f		2022-11-22 03:00:26.129181	2022-11-22 03:00:26.129181	51	488	Female	Full Member	2022-12-07	\N
2462	Chris B.	f	f	t	t	f	f	f	f	Best Weekend!!!	2022-11-22 03:17:03.729478	2022-11-22 03:17:03.729478	15	488	Male	Full Member	2022-12-07	\N
2463	Michelle Comtois	f	f	t	t	f	f	f	t		2022-11-22 10:17:18.761973	2022-11-22 10:17:18.761973	5	488	Female	Full Member	2022-12-07	\N
2464	Alana McCarthy 	f	f	t	t	f	f	f	t		2022-11-22 16:50:10.260573	2022-11-22 16:50:10.260573	23	491	Female	Full Member	2022-11-23	\N
2465	Alana McCarthy 	f	f	t	t	f	f	f	t	Best weekend!	2022-11-22 16:51:05.511596	2022-11-22 16:51:05.511596	23	488	Female	Full Member	2022-12-07	\N
2467	Perry F	f	f	t	t	f	f	f	t	Probably not, just incase 	2022-11-23 22:58:30.526227	2022-11-23 22:58:30.526227	153	491	Male	Full Member	2022-11-23	\N
2468	Yasmine K	f	f	t	t	f	f	f	t	Guest of Perry, probably not making it up 	2022-11-23 23:03:14.172259	2022-11-23 23:03:14.172259	153	491	Female	Guest	2022-11-23	\N
2469	Louisa Blaney	f	f	f	t	f	f	f	t	Friend of Nancy, only up Saturday	2022-11-26 01:04:48.061573	2022-11-26 01:04:48.061573	51	488	Female	Guest	2022-12-07	\N
2470	Bob Waddell	t	t	f	f	f	f	t	t		2022-11-29 21:16:48.831568	2022-11-29 21:16:48.831568	209	487	Male	Full Member	2022-11-30	\N
2473	Rachel Crateau	f	f	t	t	f	f	f	f		2022-11-29 23:27:22.677374	2022-11-29 23:27:22.677374	261	488	Female	Full Member	2022-12-07	\N
2474	Rachel Crateau	f	f	t	t	f	f	f	t		2022-11-29 23:29:11.960866	2022-11-29 23:29:11.960866	261	492	Female	Full Member	2022-12-14	\N
2475	Rachel Crateau	f	f	t	t	t	f	f	t		2022-11-30 00:16:17.100004	2022-11-30 00:16:17.100004	261	490	Female	Full Member	2022-12-28	\N
2476	Perry F	f	f	t	t	f	f	f	t	Depends on weather 	2022-11-30 11:03:09.65362	2022-11-30 11:03:09.65362	153	487	Male	Full Member	2022-11-30	\N
2477	Dominik	f	f	t	t	f	f	f	t	Friday night-Saturday afternoon 	2022-11-30 12:50:26.745247	2022-11-30 12:50:26.745247	267	487	Male	Full Member	2022-11-30	\N
2478	John D	t	t	t	t	t	t	f	t		2022-11-30 14:38:24.564836	2022-11-30 14:38:24.564836	2	488	Male	Full Member	2022-12-07	\N
2466	Sara Delaney	f	f	t	t	f	f	f	f	Best Weekend! Will have friends up (Allison and Carl)	2022-11-23 18:11:34.992157	2022-12-01 00:07:25.473884	31	488	Female	Associate Member	2022-12-07	\N
2479	Vicki Santarcangelo	f	t	t	t	t	f	f	t	Best Weekend	2022-12-01 02:19:47.116644	2022-12-01 02:19:47.116644	3	488	Female	Full Member	2022-12-07	\N
2480	Andrew Blohm	f	f	t	t	f	f	f	f		2022-12-01 03:08:37.599881	2022-12-01 03:08:37.599881	142	488	Male	Full Member	2022-12-07	\N
2481	Corey Blohm	f	f	t	t	f	f	f	f		2022-12-01 03:09:18.634666	2022-12-01 03:09:18.634666	142	488	Female	Full Member	2022-12-07	\N
2482	CJ Landsman	f	f	t	t	f	f	f	f	Corey's dad!  He loves the ski club.	2022-12-01 03:10:52.577643	2022-12-01 03:10:52.577643	142	488	Male	Guest	2022-12-07	\N
2483	Dominik	f	f	t	t	f	f	f	f		2022-12-03 03:38:41.687453	2022-12-03 03:38:41.687453	267	488	Male	Full Member	2022-12-07	\N
2484	Trevor Rowe	f	t	t	t	t	t	t	f	Arrive/depart days might not be QUITE accurate, but I'll definitely be there for the party.	2022-12-04 00:45:13.681655	2022-12-04 00:45:13.681655	259	488	Male	Full Member	2022-12-07	\N
2485	T Wall	f	t	t	t	f	f	f	f	BESTBEST	2022-12-05 14:53:01.451965	2022-12-05 14:53:01.451965	21	488	Male	Full Member	2022-12-07	\N
2487	Heather Kornack	f	f	t	t	f	f	f	f	Heather reached out via email and she and I have chatted a bit. First time visit. -DS	2022-12-05 23:07:26.875209	2022-12-05 23:22:49.052072	20	488	Female	Guest	2022-12-07	\N
2486	Dan Shults	f	f	t	t	f	f	f	f	Bestest Weekend. I'll be registering some guests from our prospect list shortly.	2022-12-05 14:55:08.164465	2022-12-05 23:22:57.941421	20	488	Male	Full Member	2022-12-07	\N
2489	Allison Galbraith	f	f	t	t	f	f	f	f	Friend of Delaney. - DS	2022-12-05 23:14:58.61888	2022-12-05 23:33:28.53313	20	488	Female	Guest	2022-12-07	\N
2493	KBuck	f	f	t	t	f	f	f	t	Get Best!! 	2022-12-06 01:00:25.082563	2022-12-06 01:00:25.082563	33	488	Male	Full Member	2022-12-07	\N
2494	Mirian B	f	f	t	t	f	f	f	t		2022-12-06 01:01:35.306356	2022-12-06 01:01:35.306356	33	488	Female	Associate Member	2022-12-07	\N
2472	Pat Vaughn	f	f	t	t	f	f	f	f	guest of Bob W. in for dinner Saturday and the Party. Santa Sunday	2022-11-29 21:20:32.142133	2022-12-06 10:29:09.400064	209	488	Female	Guest	2022-12-07	\N
2471	Bob Waddell	f	f	t	t	t	f	f	f		2022-11-29 21:19:37.51723	2022-12-06 10:29:41.896897	209	488	Male	Full Member	2022-12-07	\N
2495	Douglas Mayo	f	f	t	t	f	f	f	t	let's go skiing	2022-12-06 15:38:37.075614	2022-12-06 15:38:37.075614	12	488	Male	Full Member	2022-12-07	\N
2770	Amy Candelora 	f	f	t	t	f	f	f	t		2023-03-04 18:07:49.313846	2023-03-04 18:07:49.313846	16	501	Female	Full Member	2023-03-08	\N
2488	Zach Basset	f	f	t	t	f	f	f	f	Zach came up once last year. Nice guy. A little quiet. Glad to see him coming back! - DS	2022-12-05 23:08:39.159033	2022-12-05 23:22:16.864762	20	488	Male	Guest	2022-12-07	\N
2491	Dawn Bardot	f	f	t	t	f	f	f	f	Dawn filled out the EICSL inquiry form last May. I sent my stock reply and never heard back, but apparently she subscribed to our mailing list. I will reach out and chat w her a little this week. -DS	2022-12-05 23:29:58.981038	2022-12-05 23:29:58.981038	20	488	Female	Guest	2022-12-07	\N
2492	Truman Cavallaro	f	f	t	t	f	f	f	f	Came to the NH meetup. Has indicated he will pay w cash or check. -DS	2022-12-05 23:33:09.342488	2022-12-05 23:33:09.342488	20	488	Male	Guest	2022-12-07	\N
2496	megan mayo	f	f	t	t	f	f	f	t	Getintoit	2022-12-06 15:39:13.505896	2022-12-06 15:39:13.505896	12	488	Female	Full Member	2022-12-07	\N
2497	Carl Shimer	f	f	t	t	f	f	f	f	Friend of Delaney and husband of Allison. - DS	2022-12-07 18:34:47.019632	2022-12-07 18:34:47.019632	20	488	Male	Guest	2022-12-07	\N
2498	Dane Araujo	f	f	t	t	f	f	f	t	Time to dust off the skis	2022-12-13 13:37:03.29561	2022-12-13 13:37:03.29561	154	492	Male	Full Member	2022-12-14	\N
2771	Chris candelora	f	f	t	t	f	f	f	t		2023-03-04 18:08:17.707428	2023-03-04 18:08:17.707428	16	501	Male	Full Member	2023-03-08	\N
2502	Nikki Shults	f	t	t	t	f	f	f	t		2022-12-13 18:08:36.605132	2022-12-13 18:08:36.605132	9	492	Female	Full Member	2022-12-14	\N
2772	Amy Candelora 	f	f	t	t	f	f	f	t		2023-03-04 18:09:31.960921	2023-03-04 18:09:31.960921	16	503	Female	Full Member	2023-03-22	\N
2773	Chris Candelora 	f	f	t	t	f	f	f	t		2023-03-04 18:10:30.852706	2023-03-04 18:10:30.852706	16	503	Male	Full Member	2023-03-22	\N
2774	Kevin Buckley 	f	f	t	t	f	f	f	t	Wildcat Saturday, Cannon Sunday for us!	2023-03-06 01:23:53.59276	2023-03-06 01:23:53.59276	33	501	Male	Full Member	2023-03-08	\N
2775	Mirian Barrientos 	f	f	t	t	f	f	f	t		2023-03-06 01:24:41.198627	2023-03-06 01:24:41.198627	33	501	Female	Associate Member	2023-03-08	\N
2776	Nancy Murphy	f	f	t	t	f	f	f	f		2023-03-06 15:54:36.010854	2023-03-06 15:54:48.645228	51	501	Female	Full Member	2023-03-08	\N
2777	Chris B.	f	f	t	t	f	f	f	f	Member App Weekend!!!	2023-03-06 20:19:32.027946	2023-03-06 20:19:32.027946	15	501	Male	Full Member	2023-03-08	\N
2778	Alana McCarthy 	f	f	t	t	f	f	f	t	Hoping I’ll be there- trying to get out of a commitment…	2023-03-06 20:51:26.323352	2023-03-06 20:51:26.323352	23	501	Female	Full Member	2023-03-08	\N
2779	Vicki Santarcangelo 	f	t	t	t	f	f	f	f	Yes, I want corned beef dinner!	2023-03-07 00:53:04.336256	2023-03-07 00:53:04.336256	3	502	Female	Full Member	2023-03-15	\N
2780	Vicki Santarcangelo 	f	t	t	t	f	f	f	t	Purple drank, purple drank…	2023-03-07 00:54:03.378798	2023-03-07 00:54:03.378798	3	503	Female	Full Member	2023-03-22	\N
2781	Heather K	f	f	t	t	f	f	f	f	Tentative for Friday 	2023-03-07 00:55:11.349893	2023-03-07 00:55:26.810697	324	503	Female	Full Member	2023-03-22	\N
2782	Perry F	f	t	t	t	f	f	f	t		2023-03-07 03:11:34.739869	2023-03-07 03:11:34.739869	153	501	Male	Full Member	2023-03-08	\N
2815	John D	f	t	t	t	t	f	f	t	Corned Beef and Cabbage. 	2023-03-07 11:08:16.751855	2023-03-07 11:08:16.751855	2	502	Male	Full Member	2023-03-15	\N
2816	Sara Delaney	f	f	t	t	f	f	f	f	Ice Bar!	2023-03-07 18:57:16.977571	2023-03-07 18:57:16.977571	31	503	Female	Associate Member	2023-03-22	\N
2817	Paula Miller	f	f	t	t	f	f	f	f	Friend of Delaney	2023-03-07 18:57:48.734305	2023-03-07 18:57:48.734305	31	503	Female	Guest	2023-03-22	\N
2818	Shana Biletch	f	f	f	t	f	f	f	t	Members’ appreciation! 	2023-03-08 00:57:22.360027	2023-03-08 00:57:22.360027	57	501	Female	Full Member	2023-03-08	\N
2819	Doug Kinkenon 	f	f	f	t	f	f	f	t	Members’ appreciation! 	2023-03-08 00:58:17.307907	2023-03-08 00:58:17.307907	57	501	Male	Associate Member	2023-03-08	\N
2821	Dane Araujo	f	f	t	t	f	f	f	t		2023-03-08 13:35:36.597407	2023-03-08 13:35:36.597407	154	501	Male	Full Member	2023-03-08	\N
2822	Jess Simao	f	f	t	t	f	f	f	f	friend of Nikki & Dan	2023-03-08 16:16:24.718848	2023-03-08 16:16:24.718848	9	501	Female	Guest	2023-03-08	\N
2823	Mike Lewis	f	f	t	t	f	f	f	f	friend of Nikki & Dan - might come, but wanted to get reservation in just in case	2023-03-08 16:17:00.603747	2023-03-08 16:17:00.603747	9	501	Male	Guest	2023-03-08	\N
2824	Mike Ryan	f	t	t	t	f	f	f	f	Ice Bar, Dinner, Thursday a maybe	2023-03-08 16:30:47.322072	2023-03-08 16:30:47.322072	14	503	Male	Full Member	2023-03-22	\N
2825	Dominik	f	f	t	t	f	f	f	f		2023-03-08 18:03:41.470565	2023-03-08 18:03:41.470565	267	501	Male	Full Member	2023-03-08	\N
2826	Michelle Comtois	f	t	t	t	f	f	f	t	Possibly Thursday night 	2023-03-08 20:36:13.087101	2023-03-08 20:36:13.087101	5	503	Female	Full Member	2023-03-22	\N
2827	Tommy w	f	f	t	t	f	f	f	t		2023-03-08 21:26:29.917709	2023-03-08 21:26:29.917709	23	501	Male	Full Member	2023-03-08	\N
2828	Lori Lavoie	f	f	t	t	f	f	f	t	Lower bunk if possible. Thanks	2023-03-09 13:51:09.674474	2023-03-09 13:51:09.674474	44	503	Female	Associate Member	2023-03-22	\N
2829	Sara Delaney	f	f	t	t	f	f	f	t		2023-03-09 23:59:10.217576	2023-03-09 23:59:10.217576	31	502	Female	Associate Member	2023-03-15	\N
2830	Paula Miller	f	f	t	t	f	f	f	t	Delaney’s friend	2023-03-10 00:30:03.529097	2023-03-10 00:30:03.529097	31	502	Female	Guest	2023-03-15	\N
2831	Lori Lavoie	f	f	t	t	f	f	f	t	Shamrock shakes all around.	2023-03-10 23:56:39.75196	2023-03-10 23:56:39.75196	44	502	Female	Associate Member	2023-03-15	\N
2833	Andrew Blohm	f	f	t	t	f	f	f	f	Corned beef if not too late. 	2023-03-11 01:05:51.485851	2023-03-11 01:08:45.649894	142	502	Male	Full Member	2023-03-15	\N
2834	Corey Blohm	f	f	t	t	f	f	f	f	Corned beef if not too late. 	2023-03-11 01:06:24.153998	2023-03-11 01:09:45.84355	142	502	Female	Full Member	2023-03-15	\N
2832	Alana m	f	f	t	t	f	f	f	f	Ice bar!	2023-03-11 00:03:55.236885	2023-03-11 03:41:50.239215	23	503	Female	Full Member	2023-03-22	\N
2835	TWALL	f	f	t	t	f	f	f	f	Ice bar! 	2023-03-11 03:41:13.770467	2023-03-11 03:42:01.066713	23	503	Male	Full Member	2023-03-22	\N
2836	Bob Waddell	t	t	f	f	f	f	f	t	tentative	2023-03-13 10:10:43.874789	2023-03-13 10:10:43.874789	209	502	Male	Full Member	2023-03-15	\N
2837	Dane Araujo	f	f	t	t	f	f	f	t		2023-03-13 17:52:05.646006	2023-03-13 17:52:05.646006	154	503	Male	Full Member	2023-03-22	\N
2838	Matt Silvestro	f	f	t	t	f	f	f	t		2023-03-13 18:36:20.13707	2023-03-13 18:36:20.13707	328	503	Male	Full Member	2023-03-22	\N
2839	Nikki Shults	f	t	f	f	f	f	f	t	Only Thursday	2023-03-14 12:15:34.571081	2023-03-14 12:15:34.571081	9	502	Female	Full Member	2023-03-15	\N
2840	Dan Shults	f	t	f	f	f	f	f	t	Playing hooky and skiing Cannon Friday... hopefully.	2023-03-14 14:46:04.940515	2023-03-14 14:46:04.940515	20	502	Male	Full Member	2023-03-15	\N
2841	Dan Shults	f	f	t	t	f	f	f	t	Going bananas! We're wearing banana suits and skiing at Cannon on Saturday for their Spring shindig. Pond skim and other shenanigans. Join us!	2023-03-14 14:51:18.559552	2023-03-14 14:51:18.559552	20	504	Male	Full Member	2023-03-29	\N
2820	Nancy Murphy	f	f	t	t	f	f	f	f		2023-03-08 01:49:49.648641	2023-03-14 18:08:36.928587	51	503	Female	Full Member	2023-03-22	\N
3605	B. Halpin	f	f	t	t	f	f	f	f		2024-06-27 12:39:42.30782	2024-06-27 12:39:42.30782	14	559	Male	Guest	2024-07-17	\N
2843	John Femino 	f	f	t	t	f	f	f	f	Delaney’s friend	2023-03-14 21:48:41.942037	2023-03-14 21:49:44.358804	31	502	Male	Guest	2023-03-15	\N
2844	Amber	f	f	t	t	f	f	f	t	Guest of Matt S. 	2023-03-14 22:55:49.276244	2023-03-14 22:55:49.276244	328	503	Female	Guest	2023-03-22	\N
2845	John D	f	t	t	t	t	f	f	t	Ice Bah!	2023-03-14 22:59:38.99598	2023-03-14 22:59:38.99598	2	503	Male	Full Member	2023-03-22	\N
2846	Michelle Comtois	f	f	t	t	f	f	f	f	Still a maybe will see how I feel Friday 	2023-03-15 11:56:44.618903	2023-03-15 11:56:44.618903	5	502	Female	Full Member	2023-03-15	\N
2847	Perry F	f	f	t	t	f	f	f	t	Probably 	2023-03-15 13:17:34.653719	2023-03-15 13:17:34.653719	153	502	Male	Full Member	2023-03-15	\N
2848	Oleg Shatrovoy	f	f	t	t	f	f	f	t	Oleg is an acquaintance of Fogel's. He came to one of our Meetups, and also came to Ullr. This will be his second visit. - DS	2023-03-15 18:35:52.546882	2023-03-15 18:35:52.546882	20	503	Male	Guest	2023-03-22	\N
2851	Alana	f	f	t	t	f	f	f	t	Race awards day	2023-03-15 20:56:38.041504	2023-03-15 20:56:38.041504	23	504	Female	Full Member	2023-03-29	\N
2852	Tommy w	f	f	t	t	f	f	f	t	Race awards	2023-03-15 20:57:03.655238	2023-03-15 20:57:03.655238	23	504	Male	Full Member	2023-03-29	\N
2853	Chris B.	f	f	t	t	f	f	f	f	Ice Bar!!!	2023-03-16 23:00:18.125239	2023-03-16 23:00:18.125239	15	503	Male	Full Member	2023-03-22	\N
2854	Bob Waddell	t	f	f	f	f	t	f	t	monday is tentative 	2023-03-17 10:53:29.454453	2023-03-22 10:19:30.131342	209	503	Male	Full Member	2023-03-22	\N
2500	Yasmine K	f	t	t	t	t	t	t	t	Guest of Perry	2022-12-13 17:57:15.744585	2022-12-13 17:57:15.744585	153	492	Female	Guest	2022-12-14	\N
2501	Perry F	f	t	t	t	t	t	t	t	Not sure which day yet I’ll be up 	2022-12-13 17:58:11.633213	2022-12-13 17:58:11.633213	153	492	Male	Full Member	2022-12-14	\N
2503	Dan Shults	f	f	t	t	f	f	f	t	Still working out the details but planning to be up. 	2022-12-13 22:31:55.402768	2022-12-13 22:31:55.402768	20	492	Male	Full Member	2022-12-14	\N
2504	Candice Pinkham	f	f	t	t	f	f	f	t	Guest of Dane	2022-12-14 00:27:04.753019	2022-12-14 00:27:04.753019	154	492	Female	Guest	2022-12-14	\N
2505	Jess P	f	t	t	f	f	f	f	t		2022-12-14 16:14:18.311793	2022-12-14 16:14:18.311793	137	492	Female	Associate Member	2022-12-14	\N
2506	Nancy Murphy	f	f	t	t	f	f	f	f	First Aid!	2022-12-14 16:42:53.86807	2022-12-14 16:42:53.86807	51	493	Female	Full Member	2023-01-04	\N
2507	Dominik	f	f	t	t	f	f	f	t		2022-12-15 00:30:13.184536	2022-12-15 00:30:13.184536	267	492	Male	Full Member	2022-12-14	\N
2927	John D	f	f	t	t	t	f	f	t		2023-06-08 12:52:24.950677	2023-06-08 12:52:24.950677	2	514	Male	Full Member	2023-06-14	\N
2510	Dan Shults	f	f	t	t	f	f	f	f	1th Aid	2022-12-15 22:06:57.180889	2022-12-15 22:06:57.180889	20	493	Male	Full Member	2023-01-04	\N
2511	John D	t	t	t	t	t	t	t	t	Tentative arrival for Christmas to New Years. Arrival date may vary. 	2022-12-16 16:13:38.399231	2022-12-16 16:13:38.399231	2	489	Male	Full Member	2022-12-21	\N
2512	Alana M	f	f	t	t	f	f	f	t	New years	2022-12-18 18:14:50.316733	2022-12-18 18:14:50.316733	23	490	Female	Full Member	2022-12-28	\N
2513	Michelle Comtois	f	t	t	t	f	f	f	t		2022-12-19 13:40:03.970551	2022-12-19 13:40:03.970551	5	490	Female	Full Member	2022-12-28	\N
2514	Michelle Comtois	f	f	t	t	f	f	f	t	Not 100 on Friday night yet 	2022-12-19 13:41:28.038672	2022-12-19 13:41:28.038672	5	493	Female	Full Member	2023-01-04	\N
2516	Bob Waddell	t	t	f	f	f	f	t	t		2022-12-20 20:55:19.393047	2022-12-20 20:55:19.393047	209	489	Male	Full Member	2022-12-21	\N
2518	Nikki Shults	f	f	t	t	f	f	f	f	First Aid	2022-12-20 22:21:42.622876	2022-12-20 22:21:42.622876	9	493	Female	Full Member	2023-01-04	\N
2519	Douglas Mayo	t	t	t	t	t	f	f	t	Let's go skiing, will be up Tuesday night late	2022-12-22 11:57:09.001235	2022-12-22 11:57:09.001235	12	490	Male	Full Member	2022-12-28	\N
2520	megan mayo	t	t	t	t	t	f	f	t	GetIntoit, might be up Tuesday, Happy holidays	2022-12-22 11:57:59.952162	2022-12-22 11:57:59.952162	12	490	Female	Full Member	2022-12-28	\N
2546	T Wall	f	f	t	t	f	f	f	f		2023-01-02 17:51:45.481349	2023-01-02 17:51:45.481349	21	493	Male	Full Member	2023-01-04	\N
2521	Chris Candelora 	t	t	t	t	f	f	f	t		2022-12-23 16:23:45.514931	2022-12-23 16:23:45.514931	16	490	Male	Full Member	2022-12-28	\N
2522	Amy candelora 	t	t	t	t	f	f	f	t		2022-12-23 16:24:12.400442	2022-12-23 16:24:12.400442	16	490	Female	Full Member	2022-12-28	\N
2523	Amy Candelora 	f	f	t	t	f	f	f	t	First Aid	2022-12-23 16:25:35.846949	2022-12-23 16:25:35.846949	16	493	Female	Full Member	2023-01-04	\N
2524	Chris Candelora 	f	f	t	t	f	f	f	t	First Aid	2022-12-23 16:27:22.73651	2022-12-23 16:27:22.73651	16	493	Male	Full Member	2023-01-04	\N
2515	Alana McCarthy 	f	f	t	t	f	f	f	f	First aid	2022-12-20 15:52:31.750656	2023-01-02 17:52:03.447924	23	493	Female	Full Member	2023-01-04	\N
2547	Vicki S	f	t	t	t	f	f	f	f	First Aid	2023-01-02 17:54:56.055561	2023-01-02 17:54:56.055561	3	493	Female	Full Member	2023-01-04	\N
2861	Rachel Crateau	f	f	t	t	f	f	f	t		2023-03-20 21:23:25.636515	2023-03-20 21:23:25.636515	261	503	Female	Full Member	2023-03-22	\N
2862	Scott James	f	f	t	t	f	f	f	t		2023-03-20 22:14:09.04631	2023-03-20 22:14:09.04631	257	503	Male	Full Member	2023-03-22	\N
2529	Vicki S	f	t	t	t	f	f	f	t	NYE	2022-12-27 14:23:26.459187	2022-12-27 14:23:26.459187	3	490	Female	Full Member	2022-12-28	\N
2530	Rachel Crateau	f	f	t	t	f	f	f	t		2022-12-27 16:04:21.582395	2022-12-27 16:04:21.582395	261	490	Female	Full Member	2022-12-28	\N
2531	Rachel Crateau	f	f	t	t	f	f	f	f		2022-12-27 16:05:30.494653	2022-12-27 16:05:30.494653	261	493	Female	Full Member	2023-01-04	\N
2528	Pat Vaughn	f	f	f	f	f	t	t	t	Guest of Bob Waddell 	2022-12-26 19:03:11.943079	2022-12-28 11:47:11.713578	209	490	Female	Guest	2022-12-28	\N
2517	Bob Waddell	t	t	f	f	f	t	t	t		2022-12-20 20:56:02.867144	2022-12-28 11:48:01.694536	209	490	Male	Full Member	2022-12-28	\N
2532	Chris B	f	f	t	t	f	f	f	f	First Aid	2022-12-28 14:29:23.297515	2022-12-28 14:29:23.297515	15	493	Male	Full Member	2023-01-04	\N
2534	Dominik	f	f	t	t	t	f	f	f	Maybe. If I am no longer sick.	2022-12-28 17:06:53.397704	2022-12-28 17:06:53.397704	267	490	Male	Full Member	2022-12-28	\N
2533	Perry F	f	t	t	t	t	f	f	t	Maybe 	2022-12-28 15:07:39.701765	2022-12-28 18:12:53.495946	153	490	Male	Full Member	2022-12-28	\N
2535	Shana 	f	f	f	t	t	f	f	t		2022-12-28 19:36:55.574184	2022-12-28 19:36:55.574184	57	490	Female	Full Member	2022-12-28	\N
2536	Doug Kinkenon 	f	f	f	t	t	f	f	t		2022-12-28 19:37:43.572869	2022-12-28 19:37:43.572869	57	490	Male	Associate Member	2022-12-28	\N
2548	LORI LAVOIE	f	f	t	t	f	f	f	f	My old bed if avail. (Guests Emily B/Ali M/Matt C). I may be arriving Friday morning.	2023-01-02 20:46:31.969594	2023-01-02 20:46:46.095303	44	493	Female	Associate Member	2023-01-04	\N
2508	Jess P	f	f	t	t	f	f	f	t	Beth's bed please	2022-12-15 19:31:37.138939	2022-12-28 20:26:09.778766	137	490	Female	Associate Member	2022-12-28	\N
2537	T-Wall	f	f	t	t	f	f	f	f	🥳🥳🥳	2022-12-28 21:01:03.135527	2022-12-28 21:01:03.135527	21	490	Male	Full Member	2022-12-28	\N
2539	Mike Ryan	f	t	t	t	f	f	f	f	Frist Aid, Thursday is maybe.	2022-12-29 21:02:45.387241	2022-12-29 21:02:45.387241	14	493	Male	Full Member	2023-01-04	\N
2540	Mike Ryan	f	t	t	t	t	t	f	t	Maybe on Thursday & Monday	2022-12-29 21:04:00.039277	2022-12-29 21:04:00.039277	14	495	Male	Full Member	2023-01-11	\N
2541	Scott James	f	f	t	t	f	f	f	f		2022-12-30 01:14:17.905436	2022-12-30 01:14:17.905436	257	493	Male	Full Member	2023-01-04	\N
2542	Scott James	f	f	t	t	f	f	f	t		2022-12-30 01:17:36.20456	2022-12-30 01:17:36.20456	257	496	Male	Full Member	2023-01-18	\N
2543	Scott James	f	f	t	t	f	f	f	t		2022-12-30 01:18:28.517753	2022-12-30 01:18:28.517753	257	494	Male	Full Member	2023-01-25	\N
2544	Jackie Schneider	f	f	f	t	f	f	f	f	Mike's cousin	2023-01-01 22:33:01.784785	2023-01-01 22:33:01.784785	14	493	Female	Guest	2023-01-04	\N
2545	Joel	f	f	f	t	f	f	f	f	Cousin Jackie boyfriend 	2023-01-01 22:36:06.989667	2023-01-01 22:36:06.989667	14	493	Male	Guest	2023-01-04	\N
2538	Sara Delaney	f	f	t	t	f	f	f	f	First aid, woo! My old bed would be awesome, if possible. Friends signing up: Emily Bularzik, Ali Martin, Laura Santoski	2022-12-28 23:45:18.510067	2023-01-02 16:41:59.290714	31	493	Female	Associate Member	2023-01-04	\N
2549	John D	f	t	t	t	t	f	f	t	I need First Aid. 	2023-01-02 21:01:35.475046	2023-01-02 21:01:35.475046	2	493	Male	Full Member	2023-01-04	\N
2550	Michael Phillips	f	f	f	t	t	f	f	f	First time guest. I believe he came to a meetup though tbh I don't remember him specifically. - DS	2023-01-03 02:05:50.922218	2023-01-03 02:05:50.922218	20	493	Male	Guest	2023-01-04	\N
2551	Nicholas Skovran	f	f	t	t	f	f	f	f	Prospect from meetup. Iirc he's been up before, possibly as a guest of a guest. - DS	2023-01-03 02:07:14.628697	2023-01-03 02:10:02.587082	20	493	Male	Guest	2023-01-04	\N
2552	Zach Basset	f	f	f	t	f	f	f	f	Zach has been up a couple of times now. Quiet, but a nice guy. Talk to him! -DS	2023-01-03 02:11:13.506895	2023-01-03 02:11:13.506895	20	493	Male	Guest	2023-01-04	\N
2553	Jacob Donovan	f	f	f	t	f	f	f	f	First time visitor and friend of prospect Zach Basset. - DS	2023-01-03 02:12:07.580505	2023-01-03 02:12:07.580505	20	493	Male	Guest	2023-01-04	\N
2555	Ali Martin	f	f	t	t	f	f	f	f	friend of Delaney and Lori	2023-01-03 02:25:29.880151	2023-01-03 02:25:29.880151	31	493	Female	Guest	2023-01-04	\N
2554	Emily Bularzik	f	f	t	t	f	f	f	f	friend of Delaney and NF Lori	2023-01-03 02:24:39.414226	2023-01-03 02:26:01.486591	31	493	Female	Guest	2023-01-04	\N
2556	Laura Santoski	f	f	t	t	f	f	f	f	friend of Delaney and Lori	2023-01-03 02:26:49.39389	2023-01-03 02:26:49.39389	31	493	Female	Guest	2023-01-04	\N
2557	Matt Chase	f	f	t	t	f	f	f	t	friend of Delaney and Lori	2023-01-03 02:27:48.600783	2023-01-03 02:27:48.600783	31	493	Male	Guest	2023-01-04	\N
2558	Dan Shults	f	f	t	t	f	f	f	t	At least Friday and Saturday. Might sign up for more?	2023-01-03 02:36:27.107265	2023-01-03 02:36:27.107265	20	495	Male	Full Member	2023-01-11	\N
2559	Perry F	f	f	t	t	f	f	f	f		2023-01-03 02:51:11.572456	2023-01-03 02:51:11.572456	153	493	Male	Full Member	2023-01-04	\N
2560	Mark Buckley	f	f	t	t	f	f	f	f		2023-01-03 03:32:26.487424	2023-01-03 03:32:26.487424	22	493	Male	Full Member	2023-01-04	\N
2561	Dominik	f	f	t	t	t	f	f	f		2023-01-03 05:25:06.232163	2023-01-03 05:25:06.232163	267	493	Male	Full Member	2023-01-04	\N
2856	Dominik	f	f	t	t	t	f	f	f	I will be up either Thursday or Friday night. TBD	2023-03-18 15:38:25.639567	2023-03-18 15:38:25.639567	267	503	Male	Full Member	2023-03-22	\N
2563	K Buck	f	f	t	t	f	f	f	f	First Aid! 	2023-01-03 20:48:42.190618	2023-01-03 20:48:42.190618	33	493	Male	Full Member	2023-01-04	\N
2564	Mirian B	f	f	t	t	f	f	f	f		2023-01-03 20:51:21.604426	2023-01-03 20:51:21.604426	33	493	Female	Associate Member	2023-01-04	\N
2565	Pat Vaughn	t	f	f	f	f	f	f	t	Skiing Attitash Guest of Bob Waddell	2023-01-03 21:18:07.450545	2023-01-03 21:18:48.93286	209	495	Female	Guest	2023-01-11	\N
2566	Pat Vaughn	f	f	f	f	f	f	t	t	Guest of Bob Waddell	2023-01-03 21:19:16.537279	2023-01-03 21:19:16.537279	209	493	Female	Guest	2023-01-04	\N
2526	Bob Waddell	f	f	f	f	f	f	t	t		2022-12-26 19:01:01.552854	2023-01-03 22:14:56.612341	209	493	Male	Full Member	2023-01-04	\N
2567	Andrew Blohm	f	f	t	t	f	f	f	t		2023-01-03 22:33:08.094976	2023-01-03 22:33:08.094976	142	493	Male	Full Member	2023-01-04	\N
2568	Corey Blohm	f	f	t	t	f	f	f	t		2023-01-03 22:33:36.838869	2023-01-03 22:33:36.838869	142	493	Female	Full Member	2023-01-04	\N
2569	Eliza Kano-Bower	f	f	t	t	f	f	f	f	Friend of Delaney and Lori	2023-01-03 23:36:04.112968	2023-01-03 23:36:04.112968	31	493	Female	Guest	2023-01-04	\N
2570	Megan Mayo	f	f	t	t	f	f	f	t	Getintoit 	2023-01-04 00:09:42.189265	2023-01-04 00:09:42.189265	12	493	Female	Full Member	2023-01-04	\N
2571	Douglas Mayo	f	f	t	t	f	f	f	t	Getintoit 	2023-01-04 00:10:17.94521	2023-01-04 00:10:17.94521	12	493	Male	Full Member	2023-01-04	\N
2572	Megan mayo	f	f	t	t	t	f	f	t	Getintoit MLK	2023-01-04 00:10:53.165825	2023-01-04 00:10:53.165825	12	495	Female	Full Member	2023-01-11	\N
2573	Douglas Mayo	f	f	t	t	t	f	f	t	Getintoit MLK	2023-01-04 00:11:24.180304	2023-01-04 00:11:24.180304	12	495	Male	Full Member	2023-01-11	\N
2574	Scott James	f	f	t	t	f	f	f	f		2023-01-04 13:32:07.578471	2023-01-04 13:32:07.578471	257	493	Male	Full Member	2023-01-04	\N
2575	Scott James	f	f	t	t	f	f	f	t		2023-01-04 13:32:52.342087	2023-01-04 13:32:52.342087	257	495	Male	Full Member	2023-01-11	\N
2576	Bryan Kirk	f	f	t	t	f	f	f	t	First Aid!	2023-01-04 14:35:49.073035	2023-01-04 14:35:49.073035	219	493	Male	Full Member	2023-01-04	\N
2577	Heather Kornack	f	f	t	t	f	f	f	f	Heather is a strong prospect who also came to Best Weekend. Get to know her! -DS	2023-01-04 15:23:43.101951	2023-01-04 15:23:43.101951	20	493	Female	Guest	2023-01-04	\N
2578	Oleg Shatrovoy	f	f	t	t	f	f	f	f	Oleg is a friend of Fogel and came to one of our meetups last year. Nice guy! - DS	2023-01-04 16:04:58.560992	2023-01-04 16:04:58.560992	20	493	Male	Guest	2023-01-04	\N
2579	Ron Swanick	f	f	t	t	f	f	f	f	Guest of Chris B - tentative (please put in my room)	2023-01-04 17:42:00.720231	2023-01-04 17:42:00.720231	15	493	Male	Guest	2023-01-04	\N
2580	Jack Harrington	f	f	t	t	f	f	f	f	First time visitor. Came to one of our meetups. - DS	2023-01-04 18:10:41.435671	2023-01-04 18:10:41.435671	20	493	Male	Guest	2023-01-04	\N
2581	Amy Candelora 	f	f	t	t	t	f	f	t		2023-01-07 03:38:49.799694	2023-01-07 03:38:49.799694	16	495	Female	Full Member	2023-01-11	\N
2582	Chris Candelora 	f	f	t	t	t	f	f	t		2023-01-07 03:39:47.029938	2023-01-07 03:39:47.029938	16	495	Male	Full Member	2023-01-11	\N
2583	Amy Candelora 	f	f	t	t	f	f	f	t		2023-01-07 03:40:52.951299	2023-01-07 03:40:52.951299	16	496	Female	Full Member	2023-01-18	\N
2584	Chris Candelora	f	f	t	t	f	f	f	t		2023-01-07 03:41:44.841586	2023-01-07 03:41:44.841586	16	496	Male	Full Member	2023-01-18	\N
2857	Emily Bularzik 	f	f	t	t	f	f	f	f	Friend of Delaney	2023-03-19 01:15:29.256971	2023-03-19 01:15:29.256971	31	503	Female	Guest	2023-03-22	\N
2586	Bob Waddell	t	f	f	f	f	f	f	t		2023-01-09 14:33:09.146925	2023-01-09 14:33:09.146925	209	495	Male	Full Member	2023-01-11	\N
2858	Eric Klose	f	f	t	t	f	f	f	f	Friend of Delaney	2023-03-19 01:16:05.951276	2023-03-19 01:16:05.951276	31	503	Male	Guest	2023-03-22	\N
2622	Nikki Shults	f	f	t	t	f	f	f	f	Ullr Rules!	2023-01-18 17:34:05.960954	2023-02-07 15:33:01.053459	9	497	Female	Full Member	2023-02-08	\N
2588	Perry F	f	t	t	t	f	f	f	t	Most likely staying elsewhere	2023-01-11 01:15:49.502113	2023-01-11 01:15:49.502113	153	495	Male	Full Member	2023-01-11	\N
2589	Shana 	f	f	f	t	f	f	f	t		2023-01-11 23:24:13.998478	2023-01-11 23:24:13.998478	57	495	Female	Full Member	2023-01-11	\N
2590	Doug Kinkenon 	f	f	f	t	f	f	f	t		2023-01-11 23:24:32.994004	2023-01-11 23:24:32.994004	57	495	Male	Associate Member	2023-01-11	\N
2591	Dominik Airey	f	f	f	t	t	t	f	t	Strong maybe. Hope to be up\r\nSaturday night-Monday	2023-01-12 03:40:39.91654	2023-01-12 03:40:39.91654	267	495	Male	Full Member	2023-01-11	\N
2592	Bob waddell	f	f	f	f	f	f	t	t		2023-01-12 13:29:34.904596	2023-01-12 13:29:34.904596	209	494	Male	Full Member	2023-01-25	\N
2593	Pat Vaughn	f	f	f	f	f	f	t	t	Guest of Bob Waddell	2023-01-12 13:30:04.866189	2023-01-12 13:30:04.866189	209	494	Female	Guest	2023-01-25	\N
2594	Bob waddell	t	t	f	f	f	f	f	t		2023-01-12 13:30:27.948491	2023-01-12 13:30:27.948491	209	498	Male	Full Member	2023-02-01	\N
2595	Pat Vaughn	t	t	f	f	f	f	f	t	Guest of Bob Waddell	2023-01-12 13:30:52.834764	2023-01-12 13:30:52.834764	209	498	Female	Guest	2023-02-01	\N
2597	Rob Vogel	f	f	f	t	t	t	f	t	Guest of John D	2023-01-12 19:49:58.834592	2023-01-12 19:49:58.834592	2	449	Male	Guest	2023-03-01	\N
2598	Warren Nadler	f	f	f	t	t	t	f	t	Guest of John D	2023-01-12 19:50:45.183358	2023-01-12 19:50:45.183358	2	449	Male	Guest	2023-03-01	\N
2600	John D	f	f	f	f	t	f	f	t	I may stop and stay to break up my trip to Jay. 	2023-01-16 08:11:37.847696	2023-01-16 08:11:37.847696	2	496	Male	Full Member	2023-01-18	\N
2601	Rachel Crateau	f	f	t	t	f	f	f	t		2023-01-16 22:17:29.332615	2023-01-16 22:17:44.324576	261	496	Female	Full Member	2023-01-18	\N
2602	Rachel Crateau	f	f	t	t	f	f	f	t		2023-01-16 22:18:59.766494	2023-01-16 22:18:59.766494	261	494	Female	Full Member	2023-01-25	\N
2603	Mike Ryan	f	t	t	t	f	f	f	t	Thursday a Maybe	2023-01-17 15:00:22.049697	2023-01-17 15:00:22.049697	14	496	Male	Full Member	2023-01-18	\N
2604	Douglas Mayo	f	f	t	t	t	f	f	t	Getintoit	2023-01-17 15:19:32.872596	2023-01-17 15:19:32.872596	12	496	Male	Full Member	2023-01-18	\N
2605	megan mayo	f	f	t	t	t	f	f	t	Let's go skiing	2023-01-17 15:20:05.52471	2023-01-17 15:20:05.52471	12	496	Female	Full Member	2023-01-18	\N
2606	Douglas Mayo	f	f	t	t	f	f	f	t	let's go skiing.	2023-01-17 15:20:40.398947	2023-01-17 15:20:40.398947	12	494	Male	Full Member	2023-01-25	\N
2607	megan mayo	f	f	t	t	f	f	f	t	Let's go skiing	2023-01-17 15:21:04.533035	2023-01-17 15:21:04.533035	12	494	Female	Full Member	2023-01-25	\N
2608	Julie Handel	f	f	f	t	f	f	f	t		2023-01-17 15:35:35.856876	2023-01-17 15:35:35.856876	14	496	Female	Race Member	2023-01-18	\N
2609	Mike Ryan	f	f	t	t	f	f	f	t		2023-01-17 15:38:10.679445	2023-01-17 15:38:10.679445	14	494	Male	Full Member	2023-01-25	\N
2612	Mike Ryan	f	f	t	t	f	f	f	t		2023-01-17 15:40:35.240205	2023-01-17 15:40:35.240205	14	499	Male	Full Member	2023-02-22	\N
2615	Perry F	f	t	t	t	t	f	f	t	Maybe Thursday 	2023-01-17 23:04:16.959027	2023-01-17 23:04:16.959027	153	496	Male	Full Member	2023-01-18	\N
2616	Michelle Comtois	f	f	t	t	f	f	f	t	Possibly not Friday night depending on the weather 	2023-01-18 10:51:46.767307	2023-01-18 10:51:46.767307	5	496	Female	Full Member	2023-01-18	\N
2617	Dominik	f	t	t	t	t	f	f	t	Maybe Thursday night depending on weather	2023-01-18 12:54:05.629383	2023-01-18 12:54:05.629383	267	496	Male	Full Member	2023-01-18	\N
2618	Dane Araujo	f	f	t	t	f	f	f	t	Hopefully up Friday if home from work trip in time!	2023-01-18 12:59:32.473314	2023-01-18 12:59:32.473314	154	496	Male	Full Member	2023-01-18	\N
2619	Andrew Blohm	f	f	t	t	f	f	f	t		2023-01-18 17:20:34.786336	2023-01-18 17:20:34.786336	142	496	Male	Full Member	2023-01-18	\N
2620	Corey Blohm	f	f	t	t	f	f	f	t		2023-01-18 17:21:28.439713	2023-01-18 17:21:28.439713	142	496	Female	Full Member	2023-01-18	\N
2610	Mike Ryan	f	f	t	t	f	f	f	f	BEER!!!	2023-01-17 15:39:34.158724	2023-01-18 17:27:34.464147	14	497	Male	Full Member	2023-02-08	\N
2621	Nikki Shults	f	t	t	t	f	f	f	t	Maybe Thurs.  Depends on MY NEW CAT	2023-01-18 17:33:34.721784	2023-01-18 17:33:34.721784	9	498	Female	Full Member	2023-02-01	\N
2623	Alana	f	f	t	t	f	f	f	t	Storm??	2023-01-18 22:59:01.339183	2023-01-18 22:59:01.339183	23	496	Female	Full Member	2023-01-18	\N
2624	T Wall	f	f	t	t	f	f	f	t	🤞🤞freshies 	2023-01-18 23:01:42.767454	2023-01-18 23:01:42.767454	21	496	Male	Full Member	2023-01-18	\N
2625	Megan mayo	f	f	t	t	f	f	f	t	Getintoit 	2023-01-23 00:52:48.642465	2023-01-23 00:52:48.642465	12	494	Female	Full Member	2023-01-25	\N
2626	Doug mayo	f	f	t	t	f	f	f	t	Getintoit 	2023-01-23 00:53:33.618325	2023-01-23 00:53:33.618325	12	494	Male	Full Member	2023-01-25	\N
2596	John D	f	f	t	t	t	t	f	t	Tentative guests Rob Vogel and Warren Nadler. Requesting Tyrol for the three of us. 	2023-01-12 19:48:57.669377	2023-03-01 14:11:48.901441	2	449	Male	Full Member	2023-03-01	\N
2627	Megan mayo	f	f	t	t	f	f	f	t	Getintoit 	2023-01-23 00:54:08.009454	2023-01-23 00:54:08.009454	12	498	Female	Full Member	2023-02-01	\N
2628	Douglas mayo	f	f	t	t	f	f	f	t	Getintoit 	2023-01-23 00:54:51.082386	2023-01-23 00:54:51.082386	12	498	Male	Full Member	2023-02-01	\N
2629	Perry F	f	f	t	t	f	f	f	t		2023-01-23 19:05:32.215105	2023-01-23 19:05:32.215105	153	494	Male	Full Member	2023-01-25	\N
2630	Rachel Crateau	f	f	t	t	f	f	f	f		2023-01-24 20:59:06.529724	2023-01-24 20:59:06.529724	261	497	Female	Full Member	2023-02-08	\N
2631	Rachel Crateau	f	f	t	t	f	f	f	t		2023-01-24 21:00:11.757036	2023-01-24 21:00:11.757036	261	500	Female	Full Member	2023-02-15	\N
2632	Dominik	f	f	t	t	f	f	f	t		2023-01-25 02:21:10.342378	2023-01-25 02:21:10.342378	267	494	Male	Full Member	2023-01-25	\N
2633	TWall	f	f	t	t	f	f	f	t	I wanna go fast.	2023-01-26 01:57:20.991326	2023-01-26 01:57:20.991326	21	494	Male	Full Member	2023-01-25	\N
2634	Dan Shults	f	f	t	t	f	f	f	f	Ulltide greetings	2023-01-26 02:06:33.110368	2023-01-26 02:06:33.110368	20	497	Male	Full Member	2023-02-08	\N
2635	Dan Shults	f	t	t	t	f	f	f	t	Maybe Thurs. Depends on NIKKI'S NEW CAT.	2023-01-26 02:08:17.176197	2023-01-26 02:08:17.176197	20	498	Male	Full Member	2023-02-01	\N
2636	Sara Delaney	f	f	t	t	f	f	f	t	Ullr! 	2023-01-26 03:15:14.635186	2023-01-26 03:15:14.635186	31	497	Female	Associate Member	2023-02-08	\N
2859	Andrew Blohm	f	f	t	t	f	f	f	f	Ice bar	2023-03-19 20:44:27.298831	2023-03-19 20:44:27.298831	142	503	Male	Full Member	2023-03-22	\N
2928	Mike Ryan	f	t	t	t	f	f	f	t	Work Weekend, Thursday a maybe	2023-06-12 14:04:04.680791	2023-06-12 14:04:04.680791	14	511	Male	Full Member	2023-06-21	\N
2639	John D	f	f	t	t	t	f	f	t		2023-01-26 17:23:31.065434	2023-01-26 17:23:31.065434	2	497	Male	Full Member	2023-02-08	\N
2640	Matt Silvestro	f	f	t	t	f	f	f	t	Matt visited once last year. Mike is sponsoring. May or may not stay up on Sat night. - DS	2023-01-26 19:30:13.818501	2023-01-26 19:30:13.818501	20	494	Male	Guest	2023-01-25	\N
2642	Chris B	f	f	t	t	f	f	f	f	ULLR!!!!   	2023-01-26 21:09:45.043592	2023-01-26 21:09:45.043592	15	497	Male	Full Member	2023-02-08	\N
2643	Kevin Holowaty	f	f	t	t	f	f	f	t	Friend of Nikki and Dan	2023-01-27 00:41:39.237201	2023-01-27 00:41:39.237201	9	498	Male	Guest	2023-02-01	\N
2644	Shannon Slota (Ellie)	f	f	t	t	f	f	f	t	Friend of Nikki and Dan	2023-01-27 00:42:11.139181	2023-01-27 00:42:11.139181	9	498	Female	Guest	2023-02-01	\N
2645	Andrea Meyer	f	f	t	t	f	f	f	t	Nikki's sister	2023-01-27 00:42:44.823356	2023-01-27 00:42:44.823356	9	498	Female	Guest	2023-02-01	\N
2646	Jeff Meyer	f	f	t	t	f	f	f	t	Friend of Nikki and Dan	2023-01-27 00:43:07.233984	2023-01-27 00:43:07.233984	9	498	Male	Guest	2023-02-01	\N
2647	Megan mayo 	f	f	t	t	f	f	f	t	Getintoit 	2023-01-27 02:37:19.71519	2023-01-27 02:37:19.71519	12	497	Female	Full Member	2023-02-08	\N
2648	Douglas Mayo 	f	f	t	t	f	f	f	t	Getintoit 	2023-01-27 02:37:49.006021	2023-01-27 02:37:49.006021	12	497	Male	Full Member	2023-02-08	\N
2611	Mike Ryan	f	f	t	t	t	f	f	t		2023-01-17 15:40:10.538117	2023-01-30 19:33:58.850721	14	500	Male	Full Member	2023-02-15	\N
2650	Melissa Biggs	f	f	t	t	f	f	f	t	Friend of Nikki & Dan	2023-01-30 22:46:44.014545	2023-01-30 22:46:44.014545	9	498	Female	Guest	2023-02-01	\N
2649	Greg Biggs	f	f	t	t	f	f	f	t	Friend of Nikki & Dan	2023-01-30 22:46:15.212318	2023-01-30 22:47:00.42502	9	498	Male	Guest	2023-02-01	\N
2651	Dominik	f	f	t	t	f	f	f	t	Eta Late Friday or early Saturday	2023-01-31 17:15:14.043639	2023-01-31 17:15:14.043639	267	498	Male	Full Member	2023-02-01	\N
2654	Vicki S 	f	t	t	t	t	f	f	t	Race weekend. Thursday night arrival is unlikely, but added in case bad weather on Friday. 	2023-02-03 10:24:15.105518	2023-02-03 10:25:57.943709	3	497	Female	Full Member	2023-02-08	\N
2655	Perry F	f	f	t	t	f	f	f	f		2023-02-05 20:46:10.692347	2023-02-05 20:46:10.692347	153	497	Male	Full Member	2023-02-08	\N
2656	Ryan Thorpe	f	f	t	t	f	f	f	f	Guest of Nikki & Dan	2023-02-06 14:49:56.767632	2023-02-06 14:49:56.767632	9	449	Male	Guest	2023-03-01	\N
2657	Nikki Shults	f	f	t	t	f	f	f	f	Happy Birthday Dan! 	2023-02-06 14:51:04.226537	2023-02-06 14:51:04.226537	9	449	Female	Guest	2023-03-01	\N
2658	Jess Simao	f	f	t	t	f	f	f	f	Guest of Nikki & Dan	2023-02-06 14:51:32.592038	2023-02-06 14:51:32.592038	9	449	Female	Guest	2023-03-01	\N
2659	Allison Galbraith	f	f	t	t	f	f	f	f	Friend of Delaney and Lori	2023-02-06 16:47:15.848716	2023-02-06 16:47:15.848716	31	497	Female	Guest	2023-02-08	\N
2660	Carl Shimer 	f	f	t	t	f	f	f	f	Friend of Delaney and Lori	2023-02-06 16:47:55.771286	2023-02-06 16:47:55.771286	31	497	Male	Guest	2023-02-08	\N
2673	Oleg Shatrovoy	f	f	t	t	f	f	f	f	Oleg was intro'd to the club by Fogel. This will be his first visit. He attended a meetup last season. He does not need to pay, because he paid for First Aid but had to cancel. - DS	2023-02-08 18:27:24.939204	2023-02-08 18:27:24.939204	20	497	Male	Guest	2023-02-08	\N
2662	Craig Beckerleg	f	f	t	t	f	f	f	f	Friend of Delaney and Lori	2023-02-06 21:14:40.984068	2023-02-06 21:14:51.671532	31	497	Male	Guest	2023-02-08	\N
2663	Scott James	f	f	t	t	f	f	f	f		2023-02-07 01:00:04.203935	2023-02-07 01:00:04.203935	257	497	Male	Full Member	2023-02-08	\N
2664	JD Martinez	f	f	t	t	f	f	f	f	All hail Ullr	2023-02-07 15:00:05.220247	2023-02-07 15:04:16.070367	260	497	Female	Full Member	2023-02-08	\N
2665	Nikki Shults	f	f	t	t	f	f	f	f		2023-02-07 15:33:40.767048	2023-02-07 15:33:40.767048	9	501	Female	Guest	2023-03-08	\N
2641	Alana m	f	f	t	t	f	f	f	f	Ullr!	2023-01-26 20:34:56.668083	2023-02-08 00:03:04.233891	23	497	Female	Full Member	2023-02-08	\N
2666	Tommy Wall	f	f	t	t	f	f	f	f	Ullr and race!	2023-02-08 00:04:21.096909	2023-02-08 00:04:21.096909	23	497	Male	Full Member	2023-02-08	\N
2667	Douglas Mayo 	f	f	t	t	f	f	f	t	Getintoit 	2023-02-08 00:48:03.682188	2023-02-08 00:48:03.682188	12	497	Male	Full Member	2023-02-08	\N
2668	Megan mayo	f	f	t	t	f	f	f	t	Getintoit 	2023-02-08 00:48:41.536607	2023-02-08 00:48:41.536607	12	497	Female	Full Member	2023-02-08	\N
2661	Lori Lavoie	f	f	t	t	f	f	f	t	Bottom bunk if possible please	2023-02-06 17:24:51.707174	2023-02-08 12:48:31.129935	44	497	Female	Associate Member	2023-02-08	\N
2669	Bryan Kirk	f	f	t	t	f	f	f	f	May Ullr reign victorious!	2023-02-08 15:21:09.756713	2023-02-08 15:21:09.756713	219	497	Male	Full Member	2023-02-08	\N
2670	Amber Wantman	f	f	t	t	f	f	f	f	First time visitor, coming with her husband, Marcos. Sister of a friend of Dan and Nikki. Will pay via Venmo. - DS	2023-02-08 18:22:00.578834	2023-02-08 18:22:00.578834	20	497	Female	Guest	2023-02-08	\N
2671	Marcos Lasso	f	f	t	t	f	f	f	f	First time visitor, coming with wife Amber Wantman. Amber is the sister of a friend of Dan and Nikki's. Requests all-gender bedroom. Will pay w Venmo. - DS	2023-02-08 18:23:25.244754	2023-02-08 18:23:25.244754	20	497	Male	Guest	2023-02-08	\N
2672	Matt Silvestro	f	f	f	t	f	f	f	f	This will be Matt's second visit this year and third overall. He has applied for membership, so get to know him! I told him $70 is fine since he's only staying one night. Will Venmo. - DS	2023-02-08 18:25:40.696344	2023-02-08 18:25:40.696344	20	497	Male	Guest	2023-02-08	\N
2674	Nick Skovran	f	f	t	t	f	f	f	f	Nick played volleyball this summer and has visited the club a couple of times and attended meetups. Very strong prospect, but will probably not join until next season. - DS	2023-02-08 18:28:32.002797	2023-02-08 18:28:32.002797	20	497	Male	Guest	2023-02-08	\N
2675	Andrew Blohm	f	f	t	t	f	f	f	f		2023-02-08 18:38:39.602895	2023-02-08 18:38:39.602895	142	497	Male	Full Member	2023-02-08	\N
2676	Corey Blohm	f	f	t	t	f	f	f	f		2023-02-08 18:39:09.439703	2023-02-08 18:39:23.964505	142	497	Female	Full Member	2023-02-08	\N
2677	Keith Metayer	f	f	f	t	f	f	f	f	Guest of Andrew Blohm he’s been to the club once before. 	2023-02-08 18:40:30.335738	2023-02-08 18:40:30.335738	142	497	Male	Guest	2023-02-08	\N
2678	Kayla Lafond 	f	f	f	t	f	f	f	f	Friend of Andrew Blohm 	2023-02-08 18:41:34.135609	2023-02-08 18:41:34.135609	142	497	Female	Guest	2023-02-08	\N
2708	Corrie Binette	f	f	t	t	f	f	f	f	First time visitor who has been "sleeping around the valley." Let's show her a good time! -DS	2023-02-09 15:01:03.648791	2023-02-09 15:01:03.648791	20	497	Female	Guest	2023-02-08	\N
2709	Douglas Mayo	f	f	t	t	t	t	t	t	school vacation, getintoit	2023-02-10 16:44:28.944392	2023-02-10 16:44:28.944392	12	500	Male	Full Member	2023-02-15	\N
2710	Douglas Mayo	t	t	t	t	t	t	f	t	end of school vacation	2023-02-10 16:45:00.011285	2023-02-10 16:45:00.011285	12	499	Male	Full Member	2023-02-22	\N
2711	megan mayo	f	f	t	t	t	t	t	t	school vacation	2023-02-10 16:45:28.337889	2023-02-10 16:45:28.337889	12	500	Female	Full Member	2023-02-15	\N
2712	megan mayo	t	t	t	t	t	t	f	t	end of school vacation	2023-02-10 16:46:05.232184	2023-02-10 16:46:05.232184	12	499	Female	Full Member	2023-02-22	\N
2714	Bob Waddell	t	t	t	f	f	t	t	t		2023-02-13 11:30:01.753634	2023-02-13 11:30:01.753634	209	500	Male	Full Member	2023-02-15	\N
2715	Bob Waddell	t	t	f	f	f	f	f	t		2023-02-13 11:30:37.61368	2023-02-13 11:30:37.61368	209	499	Male	Full Member	2023-02-22	\N
2716	LeeAnn Larue	f	f	f	f	f	t	t	t	Guest of Bob W	2023-02-13 11:31:19.392478	2023-02-13 11:31:19.392478	209	500	Female	Guest	2023-02-15	\N
2717	LeeAnn Larue	t	t	f	f	f	f	f	t	Guest of Bob W	2023-02-13 11:31:50.340374	2023-02-13 11:31:50.340374	209	499	Female	Guest	2023-02-22	\N
2719	Vicki S	f	t	t	t	f	f	f	t	Championship Race	2023-02-13 12:38:34.278027	2023-02-13 12:38:34.278027	3	449	Female	Full Member	2023-03-01	\N
2720	Dan Shults	f	f	t	t	f	f	f	t	Let's race.	2023-02-14 17:59:41.043266	2023-02-14 17:59:41.043266	20	449	Male	Full Member	2023-03-01	\N
2721	JD Martinez	f	f	t	t	t	f	f	t		2023-02-15 19:35:53.909536	2023-02-15 19:39:14.61099	260	500	Female	Full Member	2023-02-15	\N
2722	Dane Araujo	f	f	f	t	f	f	f	t	Guests will most likely join I will know Wednesday night	2023-02-15 20:10:31.250729	2023-02-15 20:10:31.250729	154	500	Male	Full Member	2023-02-15	\N
2724	Andrea Schwanbeck	f	f	f	t	f	f	f	t	Guest of Dane	2023-02-15 20:11:26.343047	2023-02-15 20:11:26.343047	154	500	Female	Guest	2023-02-15	\N
2723	Marc Schwanbeck	f	f	f	t	f	f	f	t	Guest of Dane	2023-02-15 20:10:59.824697	2023-02-15 20:12:06.770079	154	500	Male	Guest	2023-02-15	\N
2725	Michael Philips	f	f	t	t	f	f	f	t	Mike came to First Aid, so this will be his second visit. JD is sponsoring. - DS	2023-02-15 20:42:52.850376	2023-02-15 20:42:52.850376	20	500	Male	Guest	2023-02-15	\N
2726	David Terwiliger	f	f	t	t	f	f	f	t	David visited once in a prior season, and has remained loosely connected to the club in the interim. He is pretty interested, so try to get to know him a bit! - DS	2023-02-15 20:49:18.678738	2023-02-15 20:49:18.678738	20	449	Male	Guest	2023-03-01	\N
2727	Dominik	f	f	t	t	f	f	f	t	Late fri-Sunday 	2023-02-15 22:39:13.501269	2023-02-15 22:39:13.501269	267	500	Male	Full Member	2023-02-15	\N
2766	Jess P	f	f	t	t	f	f	f	f	Beth's bed please	2023-03-02 15:12:19.097073	2023-03-03 13:25:49.773582	137	502	Female	Associate Member	2023-03-15	\N
2729	John D	t	t	t	t	t	f	f	t	I’ll be in and out during the week as I plan to van camp at Sunday River, but I’ll be back to the house for the weekend. 	2023-02-20 10:54:53.749419	2023-02-20 10:54:53.749419	2	499	Male	Full Member	2023-02-22	\N
2730	Matt silvestro 	f	f	t	t	f	f	f	t		2023-02-20 17:04:12.089189	2023-02-20 17:04:12.089189	328	499	Male	Full Member	2023-02-22	\N
2731	Matt silvestro 	f	f	t	t	f	f	f	t		2023-02-20 17:05:19.197474	2023-02-20 17:05:19.197474	328	499	Male	Full Member	2023-02-22	\N
2732	Dominik	f	f	t	t	f	f	f	t		2023-02-20 23:20:40.122485	2023-02-20 23:20:40.122485	267	499	Male	Full Member	2023-02-22	\N
2733	Rachel Crateau	f	f	t	t	f	f	f	t		2023-02-21 00:13:51.517708	2023-02-21 00:13:51.517708	261	499	Female	Full Member	2023-02-22	\N
2734	Scott James	f	f	t	t	f	f	f	t		2023-02-21 00:15:36.44963	2023-02-21 00:15:36.44963	257	499	Male	Full Member	2023-02-22	\N
2860	Corey Blohm	f	f	t	t	f	f	f	f	Ice bar	2023-03-19 20:44:58.228429	2023-03-19 20:45:38.035976	142	503	Female	Full Member	2023-03-22	\N
2738	Dane Araujo	f	f	f	t	f	f	f	t		2023-02-22 14:05:31.25049	2023-02-22 14:05:31.25049	154	499	Male	Full Member	2023-02-22	\N
2735	Perry F	t	t	t	t	f	f	f	t	Probably 	2023-02-21 19:04:13.135007	2023-02-22 14:12:26.985993	153	499	Male	Full Member	2023-02-22	\N
2739	Vicki S	f	f	t	t	f	f	f	t		2023-02-22 17:09:06.142681	2023-02-22 17:09:06.142681	3	499	Female	Full Member	2023-02-22	\N
2740	Andrew Blohm	f	f	f	t	f	f	f	t		2023-02-22 17:32:08.477435	2023-02-22 17:32:08.477435	142	499	Male	Full Member	2023-02-22	\N
2741	Corey Blohm	f	f	f	t	f	f	f	t		2023-02-22 17:32:56.249296	2023-02-22 17:32:56.249296	142	499	Female	Full Member	2023-02-22	\N
2742	Yanni	f	f	t	t	f	f	f	t	Guest of Dominik. Arrive fri night or sat night, tbd	2023-02-23 04:42:47.180958	2023-02-23 04:42:47.180958	267	499	Male	Guest	2023-02-22	\N
2743	Rachel Crateau	f	f	t	t	f	f	f	t		2023-02-23 11:33:14.24061	2023-02-23 11:33:14.24061	261	449	Female	Full Member	2023-03-01	\N
2745	Tommy w	f	f	t	t	f	f	f	t	Race finals 	2023-02-26 17:42:08.667766	2023-02-26 17:42:08.667766	23	449	Male	Full Member	2023-03-01	\N
2866	Nikki Shults	f	f	t	t	f	f	f	t	April fools silliness 	2023-03-21 11:32:33.882437	2023-03-21 11:32:33.882437	9	504	Female	Full Member	2023-03-29	\N
2744	Alana m	f	f	t	t	f	f	f	t	Tommy’s birthday!! 21 again!	2023-02-26 17:40:47.759916	2023-02-27 20:12:52.351481	23	449	Female	Full Member	2023-03-01	\N
2754	Mike Ryan	f	t	t	t	f	f	f	f	Maybe Thursday, Also Corn Beef Dinner up in the Club. 	2023-03-01 02:30:13.82743	2023-03-01 16:21:08.327105	14	502	Male	Full Member	2023-03-15	\N
2748	Ellen Christian	f	f	f	f	t	t	t	t	Guest of Bob W	2023-02-28 04:16:24.718106	2023-02-28 04:16:24.718106	209	449	Female	Guest	2023-03-01	\N
2749	Dane Araujo	f	f	t	t	f	f	f	t		2023-02-28 13:32:54.190295	2023-02-28 13:32:54.190295	154	449	Male	Full Member	2023-03-01	\N
2750	Marc Schwanbeck	f	f	t	t	f	f	f	t	Guest of Dane A	2023-02-28 20:52:18.912631	2023-02-28 20:52:18.912631	154	449	Male	Guest	2023-03-01	\N
2751	Ralph Emmenegger	f	f	t	t	f	f	f	t	Guest of Dane A - visiting from Switzerland!	2023-02-28 20:54:50.451816	2023-02-28 20:54:50.451816	154	449	Male	Guest	2023-03-01	\N
2746	Pat Vaughn	t	f	f	f	f	f	f	t	Guest of Bob W	2023-02-28 04:15:01.489992	2023-02-28 22:33:24.439507	209	449	Female	Guest	2023-03-01	\N
2760	JD Martinez	f	f	t	t	f	f	f	t		2023-03-01 19:28:18.407464	2023-03-01 19:28:18.407464	260	449	Female	Full Member	2023-03-01	\N
2718	Bob Waddell	t	f	t	t	t	t	t	t	Unsure about Thursday, Friday	2023-02-13 11:32:36.969699	2023-02-28 22:34:30.105839	209	449	Male	Full Member	2023-03-01	\N
2752	Mike Ryan	f	t	t	t	f	f	f	t	Maybe Thursday 	2023-03-01 02:29:19.836783	2023-03-01 02:29:19.836783	14	449	Male	Full Member	2023-03-01	\N
2753	Mike Ryan	f	t	t	t	f	f	f	t	Maybe Thursday 	2023-03-01 02:29:45.659885	2023-03-01 02:29:45.659885	14	501	Male	Full Member	2023-03-08	\N
2755	Andrew Blohm	f	t	f	f	f	f	f	t		2023-03-01 03:48:59.479834	2023-03-01 03:48:59.479834	142	449	Male	Full Member	2023-03-01	\N
2756	Corey Blohm	f	t	f	f	f	f	f	t		2023-03-01 03:49:19.283626	2023-03-01 03:49:19.283626	142	449	Female	Full Member	2023-03-01	\N
2757	Dominik	f	f	t	t	f	f	f	t		2023-03-01 04:32:07.463713	2023-03-01 04:32:07.463713	267	449	Male	Full Member	2023-03-01	\N
2758	Heather Kornack	f	f	f	t	f	f	f	t	Potentially Friday as well tbd	2023-03-01 05:24:38.884564	2023-03-01 05:27:53.257821	324	449	Female	Full Member	2023-03-01	\N
2759	Perry F	f	f	t	t	f	f	f	t	Probably will be at Okemo but adding incase 	2023-03-01 12:26:56.960426	2023-03-01 12:26:56.960426	153	449	Male	Full Member	2023-03-01	\N
2761	Brandon Juby	f	f	t	t	f	f	f	t	Friend of Dan. 	2023-03-01 19:29:41.330781	2023-03-01 19:29:41.330781	20	449	Male	Guest	2023-03-01	\N
2747	Mary Gagliardi	f	f	f	t	f	f	f	t	Guest of Bob W :: Bed in Black please if available	2023-02-28 04:15:42.115059	2023-03-01 20:02:13.414957	209	449	Female	Guest	2023-03-01	\N
2762	PFunk	f	f	t	t	f	f	f	t	PFunk in da house!	2023-03-02 01:03:49.432542	2023-03-02 01:03:49.432542	23	449	Male	Full Member	2023-03-01	\N
2763	Nung	f	f	f	t	f	f	f	t	Woo hoo!	2023-03-02 01:15:35.407388	2023-03-02 01:15:35.407388	7	449	Male	Full Member	2023-03-01	\N
2764	Pop	f	f	f	t	f	f	f	t	Guest of Nung	2023-03-02 01:16:47.114683	2023-03-02 01:16:47.114683	7	449	Female	Guest	2023-03-01	\N
2765	Scott James	f	f	t	t	f	f	f	t		2023-03-02 11:53:43.579637	2023-03-02 11:53:43.579637	257	449	Male	Full Member	2023-03-01	\N
2865	Jess P	f	f	t	t	f	f	f	f	Tuck's hike!  Beth's bed please. 	2023-03-21 11:26:14.64397	2023-04-05 16:28:23.957906	137	505	Female	Associate Member	2023-05-03	\N
2767	Dan Shults	f	f	t	t	f	f	f	f	Members Weekend! 	2023-03-02 21:45:00.51598	2023-03-02 21:45:00.51598	20	501	Male	Full Member	2023-03-08	\N
2768	Dan Shults	f	f	t	t	f	f	f	t	Ice Ice Ba(r)by	2023-03-02 23:52:31.63608	2023-03-02 23:52:31.63608	20	503	Male	Full Member	2023-03-22	\N
2769	Sandra Odonnell	f	f	t	t	f	f	f	t	First time visitor! - DS	2023-03-02 23:53:20.351924	2023-03-02 23:53:20.351924	20	503	Female	Guest	2023-03-22	\N
2864	Jess P	f	f	f	t	f	f	f	f	Maybe for ice bar	2023-03-21 11:25:17.899498	2023-03-21 11:31:35.247583	137	503	Female	Associate Member	2023-03-22	\N
2929	Nikki Shults	f	f	t	t	f	f	f	t	Work weekend	2023-06-12 21:31:22.212056	2023-06-12 21:31:22.212056	9	514	Female	Full Member	2023-06-14	\N
2932	megan mayo	f	f	t	t	f	f	f	t	work weekend, Getintoit	2023-06-13 12:40:30.57142	2023-06-13 12:40:30.57142	12	514	Female	Full Member	2023-06-14	\N
2933	John D	f	t	t	t	t	f	f	t		2023-06-13 13:29:11.374371	2023-06-13 13:29:11.374371	2	511	Male	Full Member	2023-06-21	\N
2842	Perry F	f	f	t	t	t	f	f	f	Ice bar (2% chance of staying sunday) 	2023-03-14 18:38:59.051029	2023-03-21 22:25:01.855519	153	503	Male	Full Member	2023-03-22	\N
2868	Dianne	f	f	t	t	f	f	f	f	Ammie Friend 1	2023-03-21 12:56:36.277341	2023-03-22 14:03:40.407101	14	503	Female	Guest	2023-03-22	\N
2869	Josy	f	f	t	t	f	f	f	f	Ammie Friend 2	2023-03-21 12:57:02.075682	2023-03-22 14:04:19.757426	14	503	Female	Guest	2023-03-22	\N
2867	Ammie Rogers	f	f	t	t	f	f	f	f	Guest/co-worker of Mike Ryan	2023-03-21 12:55:24.214256	2023-03-22 14:04:40.281569	14	503	Female	Guest	2023-03-22	\N
2870	Mike Ryan	f	t	t	t	f	f	f	t	Wildcat Ski School Party Saturday Night, Thursday a maybe	2023-03-22 14:06:21.830328	2023-03-22 14:06:21.830328	14	504	Male	Full Member	2023-03-29	\N
2871	Brian Hauschild	f	f	f	t	f	f	f	f	Cousin of Corey	2023-03-22 18:08:42.125616	2023-03-22 18:08:42.125616	142	503	Male	Guest	2023-03-22	\N
2872	Rhona Thomson	f	f	f	t	f	f	f	f	GF of Brian	2023-03-22 18:09:47.837533	2023-03-22 18:09:47.837533	142	503	Female	Guest	2023-03-22	\N
2873	Bryan Kirk	f	f	t	t	t	f	f	t	Baby's first Ice Bar	2023-03-22 23:28:37.528543	2023-03-22 23:28:37.528543	219	503	Male	Full Member	2023-03-22	\N
2875	Dominik	f	f	f	t	t	f	f	t	May leave Sat afternoon	2023-03-29 16:09:23.254432	2023-03-29 16:09:23.254432	267	504	Male	Full Member	2023-03-29	\N
2876	Zach Bassett	f	f	t	f	f	f	f	t	Spring skiing woo!	2023-03-29 16:15:37.36057	2023-03-29 16:15:37.36057	326	504	Male	Full Member	2023-03-29	\N
2877	Perry F	f	f	t	t	f	f	f	t	Only if the weather completely changes 	2023-03-29 19:53:46.286934	2023-03-29 19:53:46.286934	153	504	Male	Full Member	2023-03-29	\N
2930	JD 	f	f	t	t	f	f	f	t	Work weekend #2	2023-06-13 10:55:10.649735	2023-06-13 10:55:10.649735	260	511	Female	Full Member	2023-06-21	\N
2879	Heather Kornack	f	f	t	t	f	f	f	t		2023-03-30 22:01:47.933346	2023-03-30 22:01:47.933346	324	505	Female	Full Member	2023-05-03	\N
2874	Michelle Comtois	f	f	t	t	f	f	f	t	God help me I’m doing it again! 	2023-03-29 16:07:51.434784	2023-04-03 15:04:45.806056	5	505	Female	Full Member	2023-05-03	\N
2880	Perry F	f	f	t	t	f	f	f	t	Time to start the harvest 	2023-04-03 20:54:46.06974	2023-04-03 20:54:46.06974	153	506	Male	Full Member	2023-04-05	\N
2882	John D	f	t	t	t	t	f	f	t	Fingers crossed. 	2023-04-04 14:31:42.796878	2023-04-04 14:31:42.796878	2	506	Male	Full Member	2023-04-05	\N
2883	Dan Shults	f	f	t	t	f	f	f	t	Probably my last ski weekend of the year. Definitely hitting Cannon, and maybe even Waterville? Could also do BW. 	2023-04-04 17:20:20.779979	2023-04-04 17:20:20.779979	20	506	Male	Full Member	2023-04-05	\N
2881	Dane Araujo	f	f	f	t	f	f	f	t	lemme get a piece of cawnbriddd	2023-04-04 13:15:19.087465	2023-04-05 11:40:12.271187	154	506	Male	Full Member	2023-04-05	\N
2884	Bob Waddell	f	f	f	f	t	t	t	t	maybe friday	2023-04-05 12:09:10.971585	2023-04-05 12:09:10.971585	209	506	Male	Full Member	2023-04-05	\N
2886	Michelle Comtois	f	f	t	f	f	f	f	t	One more time! One more time!	2023-04-05 12:19:16.499783	2023-04-05 12:19:16.499783	5	506	Female	Full Member	2023-04-05	\N
2887	Vicki S	f	f	t	t	f	f	f	t	Spring skiing. Woooooo!	2023-04-05 16:18:07.466892	2023-04-05 16:18:07.466892	3	506	Female	Full Member	2023-04-05	\N
2888	JD Martinez	f	f	t	t	f	f	f	t	Closing time ♫♫♫	2023-04-05 19:36:45.722518	2023-04-05 19:36:45.722518	260	506	Female	Full Member	2023-04-05	\N
2889	Pat Vaughn	t	t	f	f	f	f	f	t	guest of Bob W	2023-04-09 23:58:08.406274	2023-04-11 10:22:38.761146	209	507	Female	Guest	2023-04-12	\N
2931	Douglas Mayo	f	f	t	t	f	f	f	t	work weekend, Getintoit	2023-06-13 12:39:47.648862	2023-06-13 12:39:47.648862	12	514	Male	Full Member	2023-06-14	\N
2891	Dominik 	f	f	t	t	f	f	f	t		2023-04-11 22:27:55.333916	2023-04-11 22:27:55.333916	267	507	Male	Full Member	2023-04-12	\N
2892	Dan Shults	f	f	t	t	f	f	f	t	Looks like I'm coming up this weekend-- Have some stuff to do around the club and it's the LAST CHANCE to ski!	2023-04-12 15:00:25.398298	2023-04-12 15:00:25.398298	20	507	Male	Full Member	2023-04-12	\N
2915	Mike Ryan	f	f	f	f	f	f	f	t	Be down in Conway at my Cabin doing work. Plan on stopping by to mow lawn etc. May try some fishing and will be drinking beer if anyone wants to join. 	2023-05-22 17:14:00.421095	2023-05-22 17:14:00.421095	14	510	Male	Full Member	2023-05-24	\N
2885	Bob Waddell	t	t	f	f	f	f	f	t		2023-04-05 12:10:43.547785	2023-04-12 22:10:12.895165	209	507	Male	Full Member	2023-04-12	\N
2893	Perry F	f	t	t	f	f	f	f	t	Maybe 	2023-04-12 23:12:43.848948	2023-04-12 23:12:43.848948	153	507	Male	Full Member	2023-04-12	\N
2894	Yasmine K	f	t	t	f	f	f	f	t	Guest of Perry - maybe 	2023-04-12 23:13:24.260912	2023-04-12 23:13:24.260912	153	507	Female	Guest	2023-04-12	\N
2895	Bob Waddell	t	t	f	f	f	f	f	t	Skiing Bear Peak. Skin/ski (the last hurah!!)	2023-04-17 12:23:37.843404	2023-04-17 12:23:37.843404	209	508	Male	Full Member	2023-04-19	\N
2896	Dan Shults	f	f	t	t	f	f	f	t	Getting my tux on.	2023-04-17 13:51:25.739824	2023-04-17 13:51:25.739824	20	505	Male	Full Member	2023-05-03	\N
2897	Matt S 	f	f	t	t	f	f	f	t	Might come up. 🤷🏻‍♂️	2023-04-19 10:35:36.782339	2023-04-19 10:35:36.782339	328	508	Male	Full Member	2023-04-19	\N
2898	Nikki Shults	f	f	t	t	f	f	f	t	Can't hike, but coming for the company :) 	2023-04-25 13:23:08.52623	2023-04-25 13:23:08.52623	9	505	Female	Full Member	2023-05-03	\N
2899	Bob Waddell	f	t	t	t	t	f	f	t		2023-04-26 11:17:17.252021	2023-04-26 11:17:17.252021	209	509	Male	Full Member	2023-04-26	\N
2900	Ellen Christian	f	t	t	t	f	f	f	t	Guest of Bob	2023-04-26 11:18:01.501439	2023-04-26 11:18:01.501439	209	509	Female	Guest	2023-04-26	\N
2901	JD Martinez	f	f	t	t	f	f	f	f	HOT DOG	2023-04-26 22:11:33.107651	2023-04-26 22:11:33.107651	260	505	Female	Full Member	2023-05-03	\N
2902	Matt s. 	f	f	t	t	f	f	f	t		2023-04-28 11:30:21.282002	2023-04-28 11:30:21.282002	328	505	Male	Full Member	2023-05-03	\N
2903	Jon latham 	f	f	t	f	f	f	f	t	Guest of Matt. 	2023-04-29 13:47:26.518027	2023-04-29 13:47:26.518027	328	505	Male	Guest	2023-05-03	\N
2904	Amber 	f	f	t	f	f	f	f	t	Guest of Matt.  	2023-04-29 13:48:07.498739	2023-04-29 13:48:07.498739	328	505	Female	Guest	2023-05-03	\N
2905	Dominik	f	f	t	t	f	f	f	t		2023-04-30 17:36:18.23695	2023-04-30 17:36:18.23695	267	505	Male	Full Member	2023-05-03	\N
2906	Perry F	f	f	t	t	f	f	f	t	Not sure I can make it up Friday night - won’t make the hike if so 	2023-04-30 23:28:52.845012	2023-04-30 23:28:52.845012	153	505	Male	Full Member	2023-05-03	\N
2907	Bob Waddell	f	f	t	f	t	f	f	t		2023-05-01 10:49:01.54289	2023-05-01 10:49:01.54289	209	505	Male	Full Member	2023-05-03	\N
2908	Vicki S	f	f	t	t	f	f	f	t	Tentative. Not hiking this year, but may participate in other shenanigans, albeit slowly. 	2023-05-03 20:27:50.580716	2023-05-03 21:08:44.30803	3	505	Female	Full Member	2023-05-03	\N
2909	Dan Shults	f	f	t	t	f	f	f	t	Bringing up my folks!	2023-05-19 19:13:53.050771	2023-05-19 19:13:53.050771	20	510	Male	Full Member	2023-05-24	\N
2910	Tom Shults	f	f	t	t	f	f	f	t	Dan's dad	2023-05-19 19:14:28.540342	2023-05-19 19:14:28.540342	20	510	Male	Guest	2023-05-24	\N
2911	Sally Shults	f	f	t	t	f	f	f	t	Dan's mom	2023-05-19 19:14:54.024475	2023-05-19 19:15:02.188561	20	510	Female	Guest	2023-05-24	\N
2912	Nikki Shults	f	f	t	t	f	f	f	t	Shults family visiting	2023-05-19 19:15:41.077062	2023-05-19 19:15:41.077062	20	510	Female	Full Member	2023-05-24	\N
2914	Nancy Murphy	f	f	t	t	f	f	f	t		2023-05-21 21:28:02.835075	2023-05-21 21:28:02.835075	51	510	Female	Full Member	2023-05-24	\N
2916	Perry F	f	f	f	t	t	f	f	t	Probably 	2023-05-24 02:03:16.307692	2023-05-24 02:03:16.307692	153	510	Male	Full Member	2023-05-24	\N
2917	Yasmine K	f	f	f	t	t	f	f	t	Guest of Perry 	2023-05-24 02:03:59.073539	2023-05-24 02:03:59.073539	153	510	Female	Guest	2023-05-24	\N
2913	Bob Waddell	f	f	t	t	t	t	f	t		2023-05-21 20:29:52.64178	2023-05-24 10:24:53.826464	209	510	Male	Full Member	2023-05-24	\N
2919	Mike Ryan	f	t	t	t	f	f	f	f		2023-05-24 11:32:18.293514	2023-05-24 11:32:18.293514	14	512	Male	Full Member	2023-07-12	\N
2920	Dominik	f	f	t	t	f	f	f	t	Maybe	2023-05-24 16:13:12.965296	2023-05-24 16:13:12.965296	267	510	Male	Full Member	2023-05-24	\N
2921	Kevin Buckley	f	f	t	f	f	f	f	t		2023-05-25 01:30:41.379544	2023-05-25 01:30:41.379544	33	510	Male	Full Member	2023-05-24	\N
2922	Mirian Barrientos 	f	f	t	f	f	f	f	t		2023-05-25 01:31:10.976676	2023-05-25 01:31:10.976676	33	510	Female	Associate Member	2023-05-24	\N
3508	Dominik	f	f	t	t	f	f	f	t		2024-04-10 13:36:25.619776	2024-04-10 13:36:25.619776	267	550	Male	Full Member	2024-04-10	\N
2924	Bob Waddell	f	f	f	t	t	f	f	t	maybe up	2023-05-31 21:36:41.071394	2023-05-31 21:36:41.071394	209	513	Male	Full Member	2023-05-31	\N
2925	Nancy Murphy	f	f	t	t	f	f	f	t	Work Weekend	2023-06-03 23:04:11.768012	2023-06-03 23:04:11.768012	51	514	Female	Full Member	2023-06-14	\N
2918	Bob Waddell	f	f	t	t	t	f	f	t		2023-05-24 10:31:57.313308	2023-06-05 16:24:19.477237	209	511	Male	Full Member	2023-06-21	\N
2926	Dominik	f	f	t	t	f	f	f	t		2023-06-07 13:23:07.046045	2023-06-07 13:23:07.046045	267	515	Male	Full Member	2023-06-07	\N
2934	Matt s. 	f	f	t	t	f	f	f	t		2023-06-13 16:03:12.366882	2023-06-13 16:03:12.366882	328	514	Male	Full Member	2023-06-14	\N
2935	Rachel Crateau	f	f	t	t	f	f	f	t	Work Weekend 	2023-06-13 21:27:51.642256	2023-06-13 21:27:51.642256	261	514	Female	Full Member	2023-06-14	\N
2936	Shana Biletch	f	f	t	t	f	f	f	t	Work Weekend 	2023-06-13 23:59:16.314915	2023-06-13 23:59:16.314915	57	514	Female	Full Member	2023-06-14	\N
2937	Doug Kinkenon 	f	f	t	t	f	f	f	t	Work weekend	2023-06-14 00:00:15.019581	2023-06-14 00:00:15.019581	57	514	Male	Associate Member	2023-06-14	\N
2938	Dan Shults	f	f	t	t	f	f	f	t	Twerk weekend	2023-06-14 14:28:10.818472	2023-06-14 14:28:10.818472	20	514	Male	Full Member	2023-06-14	\N
2939	Bryan Kirk	f	f	t	t	t	f	f	t	Work weekend!	2023-06-14 21:13:57.69499	2023-06-14 21:13:57.69499	219	514	Male	Full Member	2023-06-14	\N
3509	Amanda jacobs	f	f	t	t	f	f	f	t	Dominik can sponsor again	2024-04-10 18:11:22.17233	2024-04-10 18:11:22.17233	267	551	Male	Guest	2024-04-24	\N
2941	Nancy Murphy	f	f	t	t	f	f	f	f	Tubing 	2023-06-19 22:00:22.125934	2023-06-20 00:20:51.467338	51	512	Female	Full Member	2023-07-12	\N
2981	DosBicycles	f	t	t	t	t	f	f	t	Summerfest	2023-08-01 19:53:01.384554	2023-08-01 19:53:01.384554	2	520	Male	Full Member	2023-08-23	\N
2940	Michelle Comtois	f	f	t	t	f	f	f	f	Tubing!	2023-06-19 14:28:08.74305	2023-06-20 11:59:26.470671	5	512	Female	Full Member	2023-07-12	\N
2943	Nung	f	f	f	t	f	f	f	t	Work weekend	2023-06-20 23:07:32.440067	2023-06-20 23:07:32.440067	7	511	Male	Full Member	2023-06-21	\N
2944	V. Santarcangelo 	f	f	t	t	f	f	f	t	Work weekend 	2023-06-21 16:24:15.25287	2023-06-21 16:24:15.25287	3	511	Female	Full Member	2023-06-21	\N
2945	Perry F	f	f	t	t	f	f	f	t	Work weekend - not sure if I can make it 	2023-06-21 23:02:14.878687	2023-06-21 23:02:14.878687	153	511	Male	Full Member	2023-06-21	\N
2946	Mike Ryan	f	t	t	t	f	f	f	f	lets float!!!	2023-06-23 12:50:08.00232	2023-06-23 12:51:10.380154	14	512	Male	Full Member	2023-07-12	\N
2947	Dan Shults	f	f	t	t	f	f	f	f	Tubular, dudes!	2023-06-23 13:52:00.677943	2023-06-23 13:52:00.677943	20	512	Male	Full Member	2023-07-12	\N
2948	Nikki Shults	f	t	t	t	f	f	f	f	River + Beer in cans	2023-06-23 17:09:31.037931	2023-06-23 17:09:31.037931	9	512	Female	Full Member	2023-07-12	\N
2949	Tommy W	f	f	t	t	t	t	f	t	🇺🇸🇺🇸🇺🇸🇺🇸🇺🇸\r\nFloating & Relaxing.	2023-06-26 00:08:59.121906	2023-06-26 00:08:59.121906	21	516	Male	Full Member	2023-06-28	\N
2950	Alana M.	f	f	t	t	t	t	f	t	TW is a dream⛴️	2023-06-26 00:09:39.879678	2023-06-26 00:11:10.986243	21	516	Female	Full Member	2023-06-28	\N
3510	Dominik	f	f	t	t	f	f	f	t		2024-04-10 18:11:53.200624	2024-04-10 18:11:53.200624	267	551	Male	Full Member	2024-04-24	\N
2953	Perry F	f	f	t	t	f	f	f	t		2023-06-26 23:00:45.86688	2023-06-26 23:00:45.86688	153	517	Male	Full Member	2023-07-05	\N
2954	Yasmine K	f	f	t	t	f	f	f	t	Guest of Perry	2023-06-26 23:01:28.071605	2023-06-26 23:01:28.071605	153	517	Female	Guest	2023-07-05	\N
2955	James S	f	f	t	t	f	f	f	t	Guest of Perry	2023-06-26 23:01:56.677652	2023-06-26 23:01:56.677652	153	517	Male	Guest	2023-07-05	\N
2982	Perry F	f	f	t	t	f	f	f	t	Probably not, but just incase 	2023-08-02 12:54:38.393735	2023-08-02 12:54:38.393735	153	521	Male	Full Member	2023-08-02	\N
2956	Matt T	f	f	t	t	f	f	f	t	Guest of Perry 	2023-06-30 00:10:23.4916	2023-06-30 00:10:23.4916	153	517	Male	Guest	2023-07-05	\N
2957	Demetri G	f	f	t	t	f	f	f	t	Guest of Perry 	2023-06-30 00:11:06.952718	2023-06-30 00:11:06.952718	153	517	Male	Guest	2023-07-05	\N
2958	Lori Lavoie	f	f	t	t	f	f	f	t	Tubing	2023-07-02 13:32:51.53137	2023-07-02 13:32:51.53137	44	512	Female	Associate Member	2023-07-12	\N
2959	Rachel Crateau	f	f	t	t	f	f	f	f		2023-07-03 17:51:01.347818	2023-07-03 17:51:01.347818	261	512	Female	Full Member	2023-07-12	\N
2960	Scott James	f	f	t	t	f	f	f	f		2023-07-05 10:58:16.834938	2023-07-05 10:58:16.834938	257	512	Male	Full Member	2023-07-12	\N
2961	John D	f	t	t	t	t	f	f	t	I may be up if I can arrange to have the second cord of wood delivered. 	2023-07-05 13:07:32.366832	2023-07-05 13:07:32.366832	2	517	Male	Full Member	2023-07-05	\N
2962	John M	f	f	t	t	f	f	f	t	Guest of Perry	2023-07-05 23:17:34.660617	2023-07-05 23:17:34.660617	153	517	Male	Guest	2023-07-05	\N
2964	Matt S 	f	f	t	t	f	f	f	f	Tubing 	2023-07-11 23:06:03.979256	2023-07-11 23:06:03.979256	328	512	Male	Full Member	2023-07-12	\N
2965	Dominik	f	f	t	t	f	f	f	t	Maybe. Late Friday or Saturday.	2023-07-12 00:43:34.894133	2023-07-12 00:43:34.894133	267	512	Male	Full Member	2023-07-12	\N
2966	John D	f	f	t	t	t	f	f	t		2023-07-24 15:58:36.513382	2023-07-24 15:58:36.513382	2	519	Male	Full Member	2023-07-26	\N
2967	Dan Shults	f	f	t	t	f	f	f	f	Summerfest!	2023-07-26 01:29:14.927997	2023-07-26 01:29:21.201695	20	520	Male	Full Member	2023-08-23	\N
2968	Dan Shults	f	f	t	f	f	f	f	t	Backpacking with the Bretts!	2023-07-26 01:29:53.807126	2023-07-26 01:29:53.807126	20	519	Male	Full Member	2023-07-26	\N
2969	Sara Delaney	f	f	t	t	f	f	f	f	Summerfest!	2023-07-26 02:03:54.021917	2023-07-26 02:03:54.021917	31	520	Female	Full Member	2023-08-23	\N
2970	Nikki Shults	f	t	t	t	f	f	f	f	Unsure about Thursday. MIGHT need to request Tyrol depending on my ability to climb stairs 	2023-07-26 13:38:16.320691	2023-07-26 13:38:52.176022	9	520	Female	Full Member	2023-08-23	\N
2971	Mike Ryan	f	t	t	t	f	f	f	t	bump, set, spike, drink!	2023-07-26 13:39:59.554855	2023-07-26 13:39:59.554855	14	520	Male	Full Member	2023-08-23	\N
2972	Matt s. 	f	f	t	t	f	f	f	t		2023-07-26 14:48:51.647237	2023-07-26 14:48:51.647237	328	519	Male	Full Member	2023-07-26	\N
2973	Matt s 	f	t	t	t	t	f	f	t		2023-07-26 14:50:47.121166	2023-07-26 14:50:47.121166	328	520	Male	Full Member	2023-08-23	\N
2974	Perry F	f	f	t	t	f	f	f	t	Very small chance 	2023-07-26 17:45:22.645692	2023-07-26 17:45:22.645692	153	519	Male	Full Member	2023-07-26	\N
2975	Yasmine K	f	f	t	t	f	f	f	t	Guest of Perry 	2023-07-26 17:45:50.036647	2023-07-26 17:45:50.036647	153	519	Female	Guest	2023-07-26	\N
2977	Gunnar Horve	f	f	t	t	f	f	f	f	Gunnar is a vballer. He has been up once or twice before. He has already paid.	2023-07-27 21:50:44.31525	2023-07-27 21:50:44.31525	20	520	Male	Guest	2023-08-23	\N
2978	Sandra ODonnell	f	f	t	t	f	f	f	t	First time visitor!	2023-07-27 21:53:14.40044	2023-07-27 21:53:14.40044	20	520	Female	Guest	2023-08-23	\N
2979	Nancy Murphy	f	f	t	t	f	f	f	f	Summerfest!	2023-07-30 22:06:41.659258	2023-07-30 22:06:41.659258	51	520	Female	Full Member	2023-08-23	\N
2984	Dominik	f	f	t	t	f	f	f	f		2023-08-03 16:18:11.397634	2023-08-03 16:18:11.397634	267	520	Male	Full Member	2023-08-23	\N
2985	Stephenie Hou	f	f	t	t	f	f	f	f	friend of Nikki - if I can't make it she won't be there	2023-08-03 16:38:38.206738	2023-08-03 16:38:38.206738	9	520	Female	Guest	2023-08-23	\N
2987	Teresa Yao	f	f	t	t	f	f	f	f	friend of Nikki - if I can't make it she won't be there	2023-08-03 16:39:37.363866	2023-08-03 16:39:37.363866	9	520	Female	Guest	2023-08-23	\N
2988	Andrew Qi	f	f	t	t	f	f	f	f	friend of Nikki - if I can't make it she won't be there	2023-08-03 16:40:00.480695	2023-08-03 16:40:00.480695	9	520	Male	Guest	2023-08-23	\N
2986	Courtney Hisman	f	f	t	t	f	f	f	f	friend of Nikki - if I can't make it she won't be there	2023-08-03 16:39:04.936054	2023-08-03 16:40:43.002899	9	520	Female	Guest	2023-08-23	\N
2989	Mike Ryan	f	t	t	t	f	f	f	t	Back Bulk Head Work	2023-08-04 19:26:08.447671	2023-08-04 19:26:08.447671	14	522	Male	Full Member	2023-08-16	\N
2993	Chris B.	f	f	t	t	f	f	f	f	Summerfest!!!	2023-08-08 18:30:49.64246	2023-08-08 18:31:46.752868	15	520	Male	Full Member	2023-08-23	\N
2994	Dan Shults	f	f	t	f	f	f	f	t	Backpacking the next couple days- just spending the night then shipping off in the morning.	2023-08-09 21:04:22.975561	2023-08-09 21:04:22.975561	20	523	Male	Full Member	2023-08-09	\N
2995	Yang Kurt 	f	t	t	t	t	f	f	t		2023-08-10 01:41:14.832303	2023-08-10 01:41:14.832303	10	523	Male	Full Member	2023-08-09	\N
2996	John D	f	t	t	t	t	f	f	t	Will be up Thurs or Fri to help with bulkhead. 	2023-08-10 21:19:06.652688	2023-08-10 21:19:06.652688	2	522	Male	Full Member	2023-08-16	\N
2997	Tyler Chaulk	f	f	t	t	f	f	f	f	Tyler is a volleyball player- been up a couple of times before.	2023-08-11 01:21:24.548454	2023-08-11 01:21:24.548454	20	520	Male	Guest	2023-08-23	\N
2990	Shana Biletch	f	f	f	t	f	f	f	t		2023-08-04 20:32:27.980993	2023-08-23 12:52:27.682747	57	520	Female	Associate Member	2023-08-23	\N
2991	Jess Biletch	f	f	f	t	f	f	f	t		2023-08-04 20:33:12.345389	2023-08-23 12:52:43.676693	57	520	Female	Guest	2023-08-23	\N
2992	Doug Kinkenon 	f	f	f	t	f	f	f	t		2023-08-04 20:33:41.529374	2023-08-23 12:52:55.852874	57	520	Male	Associate Member	2023-08-23	\N
2963	Jessica P	f	f	t	f	f	f	f	t	Just for one night, will leave after cog rail. 	2023-07-06 21:24:00.93734	2023-09-27 15:48:43.611966	137	518	Female	Associate Member	2023-09-27	\N
2998	Lee Pelletier	f	f	t	t	f	f	f	t	Lee is a friend of Dan and Nikki. Please put him in Wildcat with Eileen Chow.	2023-08-11 01:22:42.468232	2023-08-11 01:22:42.468232	20	520	Male	Guest	2023-08-23	\N
2999	Eileen Chow	f	f	t	t	f	f	f	t	Eileen is a friend of Dan and Nikki. Please put her in Wildcat with Lee Pelletier.	2023-08-11 01:23:33.931217	2023-08-11 01:23:33.931217	20	520	Female	Guest	2023-08-23	\N
3000	Cindy Bright	f	f	f	t	f	f	f	t	New prospect. Saturday night only. I'm going to follow up on how she found out about us, etc.	2023-08-11 01:24:33.080561	2023-08-11 01:24:33.080561	20	520	Female	Guest	2023-08-23	\N
3001	Zach Bassett	f	f	t	t	f	f	f	f		2023-08-11 10:36:44.698755	2023-08-11 10:36:44.698755	326	520	Male	Full Member	2023-08-23	\N
3002	Nicholas Skovran	f	f	t	t	t	f	f	t	Bringing 1 female guest for the same days	2023-08-12 19:08:01.283906	2023-08-12 19:08:01.283906	329	520	Male	Full Member	2023-08-23	\N
3003	kurt yang	t	t	f	f	f	t	t	t		2023-08-15 18:03:59.705974	2023-08-15 18:03:59.705974	10	522	Male	Full Member	2023-08-16	\N
3004	Vicki Santarcangelo 	f	t	t	t	f	f	f	t	Bulkhead repair	2023-08-16 19:25:36.38071	2023-08-16 19:25:36.38071	3	522	Female	Full Member	2023-08-16	\N
3005	Vicki Santarcangelo 	f	t	t	t	f	f	f	t	Summerfest. Thursday is a maybe. 	2023-08-16 19:26:22.248421	2023-08-16 19:26:22.248421	3	520	Female	Full Member	2023-08-23	\N
2983	Perry F	f	t	t	t	f	f	f	f		2023-08-03 15:04:05.354204	2023-08-16 21:56:23.39615	153	520	Male	Full Member	2023-08-23	\N
3038	Nick's guest	f	f	t	t	t	f	f	f	Nick made a note that he's bringing a guest. I'm creating a separate entry so she does not get missed in the shuffle. -DS	2023-08-18 02:41:42.999481	2023-08-18 02:41:42.999481	20	520	Female	Guest	2023-08-23	\N
3039	Amber Wantman	f	f	t	t	f	f	f	f	Possibly only 1 night. Will change reservation if needed. Amber has stayed with us multiple times in the past. Bug her about membership :)  - DS	2023-08-18 02:58:22.049759	2023-08-18 02:58:22.049759	20	520	Female	Guest	2023-08-23	\N
3040	Marcos Lasso	f	f	t	t	f	f	f	f	Possibly 1 night only- will update if needed. Marcos is the SO of Amber, and has visited once before. He is requesting an all-gender bunk. Nice guy. - DS	2023-08-18 03:00:37.536531	2023-08-18 03:00:37.536531	20	520	Male	Guest	2023-08-23	\N
2976	Heather K	f	f	t	t	f	f	f	t	Don’t have an assigned bunk yet but would like to request bottom bunk downstairs or up! Thank you :)	2023-07-27 01:35:43.397598	2023-08-18 20:27:06.631883	324	520	Female	Full Member	2023-08-23	\N
3041	Ron Swanick	f	f	t	t	f	f	f	f	Guest of Chris B - please put in Chris B’s room. 	2023-08-19 14:21:36.673516	2023-08-19 14:21:36.673516	15	520	Male	Guest	2023-08-23	\N
3042	 (Ben) Thushanth Bengre	f	f	t	t	f	f	f	f	VEGETARIAN. Men's room pls. Thushanth (Ben) has visited several times over the last few years. He's been a vball player in the past. Bringing his GF Gauri.	2023-08-20 14:44:03.384462	2023-08-20 14:44:03.384462	20	520	Male	Guest	2023-08-23	\N
3043	Gauri Oza	f	f	t	t	f	f	f	f	VEGETARIAN. Gauri is Thushanth's girlfriend. I can't remember if she's been to the club before, but we've met her at vball I'm pretty sure. Women's room pls. - DS	2023-08-20 14:47:14.070858	2023-08-20 14:47:14.070858	20	520	Female	Guest	2023-08-23	\N
3045	kurt yang	t	t	f	f	f	f	f	t	might be	2023-08-21 14:26:38.731545	2023-08-21 14:26:38.731545	10	520	Male	Full Member	2023-08-23	\N
3044	Brady Post	f	f	t	t	f	f	f	f	Brady played summer vball a few years ago but did not make it up to the club. Dan/Nikki have kept up with him a little. - DS	2023-08-21 02:28:42.466556	2023-08-21 19:57:33.826108	20	520	Male	Guest	2023-08-23	\N
3046	Doug Mayo	t	f	f	f	f	f	f	t	Slightly Stoopid is in town at Guilford, Getintoit 	2023-08-22 02:38:13.553673	2023-08-22 02:38:13.553673	12	520	Male	Full Member	2023-08-23	\N
3047	Megan Mayo 	t	f	f	f	f	f	f	t	It’s party time 🥳 	2023-08-22 02:39:19.576829	2023-08-22 02:39:19.576829	12	520	Female	Full Member	2023-08-23	\N
3048	Rachel Crateau	f	t	t	t	f	f	f	f	Bring on the party!  Scott and I are bringing the smoker...bring your appetites!	2023-08-22 14:29:23.167707	2023-08-22 14:29:23.167707	261	520	Female	Full Member	2023-08-23	\N
3049	K Buck 	f	f	f	t	f	f	f	f	Sommmmerfest - just one night 	2023-08-23 19:36:22.748186	2023-08-23 19:41:50.434425	33	520	Male	Full Member	2023-08-23	\N
3050	Mirian B 	f	f	f	t	f	f	f	f	Summertime and living is E-Z	2023-08-23 19:37:08.406688	2023-08-23 19:42:01.526744	33	520	Female	Associate Member	2023-08-23	\N
3051	Amy Candelora 	f	f	t	t	f	f	f	t	Girl’s Weekend!  	2023-08-23 22:56:51.200039	2023-08-23 22:56:51.200039	16	518	Female	Full Member	2023-09-27	\N
3052	Scott James	f	t	t	t	f	f	f	t		2023-08-23 23:58:25.438061	2023-08-23 23:58:25.438061	257	520	Male	Full Member	2023-08-23	\N
3054	Kurtyang	f	f	f	f	f	t	t	t	Might be three days.	2023-09-02 19:53:13.318745	2023-09-02 19:53:13.318745	10	524	Male	Full Member	2023-09-06	\N
3055	Alana McCarthy 	f	f	t	t	f	f	f	t	Girls weekend!	2023-09-03 00:50:04.083081	2023-09-03 00:50:04.083081	23	518	Female	Full Member	2023-09-27	\N
3056	Nikki	f	f	t	t	f	f	f	t	Girls weekend 	2023-09-03 17:10:25.607102	2023-09-03 17:10:25.607102	9	518	Female	Full Member	2023-09-27	\N
3057	Michelle Comtois	f	f	t	t	f	f	f	t		2023-09-03 20:19:59.997324	2023-09-03 20:19:59.997324	5	518	Female	Full Member	2023-09-27	\N
3058	Shana Biletch	f	f	t	t	f	f	f	t	Girls' weekend! 	2023-09-03 23:42:55.167203	2023-09-03 23:42:55.167203	57	518	Female	Associate Member	2023-09-27	\N
3053	Nancy Murphy	f	f	t	f	f	f	f	t	Girls Weekend / heading home after dinner on Saturday	2023-08-29 17:47:30.573843	2023-09-12 11:43:43.560094	51	518	Female	Full Member	2023-09-27	\N
3059	Mirian Barrientos	f	f	t	f	f	f	f	t	Girls weekend / Attitash please if possible 	2023-09-13 20:22:43.511512	2023-09-13 20:22:43.511512	51	518	Female	Associate Member	2023-09-27	\N
3060	Corey Blohm	f	f	t	t	f	f	f	t	Girls weekend!	2023-09-13 20:24:18.968463	2023-09-13 20:24:18.968463	23	518	Female	Full Member	2023-09-27	\N
3061	Sara Delaney	f	f	t	t	f	f	f	t	Girls weekend	2023-09-13 20:36:14.046126	2023-09-13 20:36:14.046126	31	518	Female	Full Member	2023-09-27	\N
3062	Vicki S	f	f	t	t	f	f	f	f	Brettl Barbie	2023-09-13 23:48:33.504429	2023-09-13 23:48:33.504429	3	518	Female	Full Member	2023-09-27	\N
3063	Michelle Comtois	f	f	t	t	f	f	f	t	Work Weekend 	2023-09-20 12:41:56.632164	2023-09-20 12:41:56.632164	5	525	Female	Full Member	2023-10-25	\N
3511	JD Martinez	f	f	t	t	f	f	f	t		2024-04-10 20:36:55.403662	2024-04-10 20:36:55.403662	260	550	Female	Full Member	2024-04-10	\N
3065	Nikki Shults	f	f	t	t	f	f	f	t	Work weekend 	2023-09-24 12:38:24.644963	2023-09-24 12:38:24.644963	9	525	Female	Full Member	2023-10-25	\N
3066	Nancy Murphy	f	f	t	t	f	f	f	t	Work weekend	2023-09-24 14:34:27.425089	2023-09-24 14:34:27.425089	51	525	Female	Full Member	2023-10-25	\N
3067	Amy Candelora 	f	f	f	t	t	f	f	t	Chris and I will drive up on Saturday morning.	2023-09-24 14:43:08.199313	2023-09-24 14:43:08.199313	16	525	Female	Full Member	2023-10-25	\N
3068	Chris Candelora 	f	f	f	t	f	f	f	t	Amy and I will be driving up on Saturday morning.	2023-09-24 14:43:56.989342	2023-09-24 14:43:56.989342	16	525	Male	Full Member	2023-10-25	\N
3069	K Buck 	f	f	f	t	f	f	f	t	Freind is hiking the very challenging flume slide trail Sunday… tentatively planning on joining him 	2023-09-27 13:10:00.223869	2023-09-27 13:10:00.223869	33	518	Male	Full Member	2023-09-27	\N
3070	Alana M	f	f	t	t	f	f	f	t	Work Weekend Barbie	2023-10-04 21:21:05.344288	2023-10-04 21:21:05.344288	23	525	Female	Full Member	2023-10-25	\N
3071	Nicholas Skovran	f	f	t	t	t	f	f	f		2023-10-07 18:28:55.274667	2023-10-07 18:28:55.274667	329	527	Male	Full Member	2023-10-18	\N
3072	Dan Shults	f	f	t	t	f	f	f	t	Workin' for the weekend.	2023-10-09 23:13:56.394756	2023-10-09 23:13:56.394756	20	525	Male	Full Member	2023-10-25	\N
3073	Perry F	f	f	t	t	f	f	f	t	Work weekend 	2023-10-09 23:34:40.002309	2023-10-09 23:34:40.002309	153	525	Male	Full Member	2023-10-25	\N
3074	Mike Ryan	f	t	t	t	f	f	f	t	Work Weekend. Thursday is a maybe.	2023-10-10 13:56:13.127935	2023-10-10 13:56:13.127935	14	527	Male	Full Member	2023-10-18	\N
3075	Zach Bassett	f	f	t	t	f	f	f	f	Work Weekend	2023-10-11 15:18:43.424698	2023-10-11 15:18:43.424698	326	527	Male	Full Member	2023-10-18	\N
3076	JD Martinez	f	f	t	t	f	f	f	t	Work weekend #1	2023-10-12 21:04:12.411385	2023-10-12 21:04:12.411385	260	527	Female	Full Member	2023-10-18	\N
3077	Chris B	f	f	t	t	f	f	f	t	Work Weekend!!! Will be up late Fri or early Sat!	2023-10-16 17:58:59.971237	2023-10-16 17:58:59.971237	15	525	Male	Full Member	2023-10-25	\N
3078	John D	f	t	t	t	t	f	f	t	Work weekend. It looks like my reservation got deleted. 	2023-10-17 23:30:14.204547	2023-10-17 23:30:14.204547	2	525	Male	Full Member	2023-10-25	\N
3079	T Wall	f	f	t	t	f	f	f	f		2023-10-18 19:14:35.284818	2023-10-18 19:14:35.284818	21	525	Male	Full Member	2023-10-25	\N
3081	Heather k	f	f	f	t	f	f	f	t		2023-10-18 21:43:07.156061	2023-10-18 21:43:07.156061	324	525	Female	Full Member	2023-10-25	\N
3082	Kurt Yang	f	f	t	t	t	f	f	t	Work	2023-10-19 02:08:10.639559	2023-10-19 02:08:10.639559	10	527	Male	Full Member	2023-10-18	\N
3083	Corey Blohm	f	f	t	t	f	f	f	t	Work weekend and Halloween party	2023-10-21 17:59:16.699751	2023-10-21 17:59:16.699751	142	525	Female	Full Member	2023-10-25	\N
3084	Andrew Blohm	f	f	t	t	f	f	f	t	Work weekend and Halloween party	2023-10-21 17:59:59.93389	2023-10-21 18:00:18.403343	142	525	Male	Full Member	2023-10-25	\N
3085	Sara Delaney	f	f	t	t	f	f	f	t	Work weekend!	2023-10-22 03:46:10.844181	2023-10-22 03:46:10.844181	31	525	Female	Full Member	2023-10-25	\N
3086	Vicki S	f	t	t	t	f	f	f	t	Everybody’s working for the weekend…	2023-10-25 17:56:39.071308	2023-10-25 17:56:39.071308	3	525	Female	Full Member	2023-10-25	\N
3087	Rachel Crateau	f	f	t	t	f	f	f	t	Work Weekend	2023-10-26 00:20:17.16381	2023-10-26 00:20:17.16381	261	525	Female	Full Member	2023-10-25	\N
3088	Scott James	f	f	t	t	f	f	f	t	Work Weekend	2023-10-26 00:22:58.806933	2023-10-26 00:22:58.806933	261	525	Male	Full Member	2023-10-25	\N
3089	Dominik	f	f	f	t	t	f	f	t		2023-10-26 21:10:02.089996	2023-10-26 21:10:02.089996	267	525	Male	Full Member	2023-10-25	\N
3090	Perry F	f	t	t	t	f	f	f	t	Probably not 	2023-11-01 17:42:24.816792	2023-11-01 17:42:24.816792	153	529	Male	Full Member	2023-11-01	\N
3091	Argery Katzounos	f	f	t	t	f	f	f	t	No Dinner	2023-11-02 00:01:56.911494	2023-11-02 00:01:56.911494	331	529	Male	Associate Member	2023-11-01	\N
3092	Glen MacPherson	f	f	t	t	f	f	f	t	Guest of Argery Katzounos / No Dinner	2023-11-02 00:04:05.590938	2023-11-02 00:04:05.590938	331	529	Male	Guest	2023-11-01	\N
3093	Jacob MacPherson	f	f	t	t	f	f	f	t	Guest of Argery Katzounos / No Dinner	2023-11-02 00:05:21.486598	2023-11-02 00:05:21.486598	331	529	Male	Guest	2023-11-01	\N
3094	David Cannata	f	f	t	t	f	f	f	t	Guest of Argery Katzounos / No Dinner	2023-11-02 00:07:10.519357	2023-11-02 00:07:10.519357	331	529	Male	Guest	2023-11-01	\N
3095	David Cannata	f	f	t	t	f	f	f	t	This comment is to cancel the reservation for David Cannata.  He cannot attend on Nov 4th and Nov 5th.  I tried to cancel but the edit/cancel button did not work Thanks, Argery	2023-11-02 23:27:52.960857	2023-11-02 23:27:52.960857	331	529	Male	Guest	2023-11-01	\N
3096	Dane Araujo	f	t	t	t	f	f	f	t	Return to the great north country	2023-11-07 15:20:39.908636	2023-11-07 15:20:39.908636	154	530	Male	Full Member	2023-11-15	\N
3097	Perry	f	f	t	t	f	f	f	t	Just incase but most likely won’t go up 	2023-11-09 02:24:59.095327	2023-11-09 02:24:59.095327	153	531	Male	Full Member	2023-11-08	\N
3098	Perry 	f	t	t	t	f	f	f	t		2023-11-09 02:25:36.130047	2023-11-09 02:25:36.130047	153	530	Male	Full Member	2023-11-15	\N
3099	Rachel Crateau	f	t	t	t	f	f	f	f	Club dinner will be served :)	2023-11-09 13:38:19.817738	2023-11-09 13:38:19.817738	261	532	Female	Full Member	2023-12-06	\N
3100	JD Martinez	f	f	t	t	f	f	f	t		2023-11-09 17:08:52.207098	2023-11-09 17:08:52.207098	260	531	Female	Full Member	2023-11-08	\N
3101	Nikki Shults	f	t	t	t	f	f	f	f	Best Weekend 	2023-11-12 20:00:24.690039	2023-11-12 20:00:24.690039	9	532	Female	Full Member	2023-12-06	\N
3102	Jess Simao	f	f	t	t	f	f	f	t	Guest of Nikki	2023-11-12 20:00:52.844009	2023-11-12 20:00:52.844009	9	532	Female	Guest	2023-12-06	\N
3103	Michelle Comtois	f	f	t	t	f	f	f	t		2023-11-13 22:59:25.963545	2023-11-13 22:59:25.963545	5	532	Female	Full Member	2023-12-06	\N
3104	JD Martinez	f	f	t	t	f	f	f	f	Kick-off weekend	2023-11-15 15:43:55.279904	2023-11-15 15:43:55.279904	260	532	Female	Full Member	2023-12-06	\N
3105	Chris B.	f	f	t	t	f	f	f	f	Best Weekend!!!	2023-11-16 02:07:00.137448	2023-11-16 02:07:00.137448	15	532	Male	Full Member	2023-12-06	\N
3106	Ron Swanick	f	f	t	t	f	f	f	f	Best Weekend. Guest of Chris B…please put in Masters if Nung’s bunk is open. He will Venmo $	2023-11-16 02:10:16.450391	2023-11-16 02:10:16.450391	15	532	Male	Guest	2023-12-06	\N
3107	Heather K	f	f	f	t	f	f	f	t		2023-11-16 03:19:32.780849	2023-11-16 03:19:32.780849	324	532	Female	Full Member	2023-12-06	\N
3108	Dan Shults	f	t	t	t	f	f	f	f	Kickin' it off.	2023-11-19 02:11:29.602772	2023-11-19 02:11:29.602772	20	532	Male	Full Member	2023-12-06	\N
3109	Ryan Sielis	f	f	t	t	f	f	f	f	First time visitor. - DS	2023-11-19 02:12:30.527219	2023-11-19 02:12:30.527219	20	532	Male	Guest	2023-12-06	\N
3110	Elise COughlin	f	f	t	t	f	f	f	f	First time visitor - DS	2023-11-19 02:13:17.109627	2023-11-19 02:13:17.109627	20	532	Female	Guest	2023-12-06	\N
3111	Whitney Tyson	f	f	t	t	f	f	f	f	First time guest. - DS	2023-11-19 02:18:01.287922	2023-11-19 02:18:01.287922	20	532	Female	Guest	2023-12-06	\N
3113	Mike Ryan	f	f	t	t	f	f	f	t		2023-11-20 14:54:20.706056	2023-11-20 14:54:20.706056	14	534	Male	Full Member	2023-12-13	\N
3114	Mike Ryan	f	f	t	t	f	f	f	f		2023-11-20 14:55:52.186806	2023-11-20 14:55:52.186806	14	532	Male	Full Member	2023-12-06	\N
3115	Mike Ryan	f	f	f	f	f	f	t	t		2023-11-20 14:57:15.601625	2023-11-20 14:57:15.601625	14	535	Male	Full Member	2023-12-20	\N
3116	Mike Ryan	t	t	t	t	t	t	f	t		2023-11-20 14:57:44.232799	2023-11-20 14:57:44.232799	14	528	Male	Full Member	2023-12-27	\N
3117	Perry F	f	f	t	t	f	f	f	t	Possibly	2023-11-21 01:18:38.662191	2023-11-21 01:18:38.662191	153	536	Male	Full Member	2023-11-22	\N
3118	Yasmine K	f	f	t	t	f	f	f	t	Guest of PF	2023-11-21 01:19:04.540414	2023-11-21 01:19:04.540414	153	536	Female	Guest	2023-11-22	\N
3119	doug mayo	f	t	t	t	f	f	f	t	lets go skiing	2023-11-21 12:04:43.162682	2023-11-21 12:04:43.162682	12	536	Male	Full Member	2023-11-22	\N
3120	megan mayo	f	t	t	t	f	f	f	t	Getintoit	2023-11-21 12:05:07.637804	2023-11-21 12:05:07.637804	12	536	Female	Full Member	2023-11-22	\N
3121	Nancy Murphy	f	f	t	t	t	f	f	f	Best Weekend!	2023-11-21 23:58:01.553951	2023-11-21 23:58:01.553951	51	532	Female	Full Member	2023-12-06	\N
3122	John	f	t	t	t	t	f	f	t		2023-11-23 08:08:27.397166	2023-11-23 08:08:27.397166	2	533	Male	Full Member	2023-11-29	\N
3123	John D	f	t	t	t	t	f	f	t		2023-11-23 08:09:58.970809	2023-11-23 08:09:58.970809	2	532	Male	Full Member	2023-12-06	\N
3124	Amy Candelora	f	f	t	t	f	f	f	t	Margaritaville!!!!	2023-11-26 19:08:29.823578	2023-11-26 19:08:29.823578	16	532	Female	Full Member	2023-12-06	\N
3125	Chris Candelora	f	f	t	t	f	f	f	t		2023-11-26 19:08:57.602241	2023-11-26 19:08:57.602241	16	532	Male	Full Member	2023-12-06	\N
3112	Mike Ryan	f	t	t	t	f	f	f	t	Time to begin	2023-11-20 14:53:54.058048	2023-11-27 16:28:54.735928	14	533	Male	Full Member	2023-11-29	\N
3126	Perry F	f	f	t	t	f	f	f	t	Perhaps 	2023-11-27 19:34:14.430908	2023-11-27 19:34:14.430908	153	533	Male	Full Member	2023-11-29	\N
3127	Zach B	f	f	t	t	f	f	f	f	Margaritaville	2023-11-28 17:11:27.904421	2023-11-28 17:11:27.904421	326	532	Male	Full Member	2023-12-06	\N
3128	Jake D	f	f	t	t	f	f	f	f	Guest of Zach B	2023-11-28 17:15:04.733475	2023-11-28 17:15:04.733475	326	532	Male	Guest	2023-12-06	\N
3129	Bryan Kirk	f	f	t	t	f	f	f	t	BEST WEEKEND!	2023-11-28 19:42:21.584496	2023-11-28 19:42:21.584496	219	532	Male	Full Member	2023-12-06	\N
3561	Jenna Whitney 	f	f	t	t	f	f	f	t		2024-04-25 01:14:05.036319	2024-04-25 01:14:05.036319	338	551	Female	Full Member	2024-04-24	\N
3131	Vicki S	f	t	t	t	t	f	f	f	Margaritaville	2023-11-29 01:05:01.065167	2023-11-29 01:08:02.737094	3	532	Female	Full Member	2023-12-06	\N
3133	JD Martinez	f	f	t	t	t	f	f	t		2023-11-30 14:02:15.998982	2023-11-30 14:02:15.998982	260	533	Female	Full Member	2023-11-29	\N
3134	Dominik	f	f	f	t	t	f	f	f		2023-12-01 06:37:24.941329	2023-12-01 06:37:24.941329	267	532	Male	Full Member	2023-12-06	\N
3135	Katie Blake	f	f	t	t	f	f	f	f	VEGETARIAN. Katie came to our meetup in Somerville before Warren Miller. She is coming with Max Nelson, and they would both like to be in the gender neutral room- neighboring beds if possible. - DS	2023-12-01 20:38:25.210033	2023-12-01 20:38:25.210033	20	532	Female	Guest	2023-12-06	\N
3136	Max Nelson	f	f	t	t	f	f	f	f	VEGETARIAN. Max came to our meetup in Somerville before Warren Miller. He is coming with Katie Blake, and they would both like to be in the gender neutral room- neighboring beds if possible. -DS	2023-12-01 20:39:57.103019	2023-12-01 20:39:57.103019	20	532	Male	Guest	2023-12-06	\N
3137	Preeti Narayanan	f	f	t	t	f	f	f	f	We know Preeti from volleyball over the years. I actually can't recall if she was at one of the volleyball weekends or not. - DS	2023-12-01 20:42:05.201497	2023-12-01 20:42:05.201497	20	532	Female	Guest	2023-12-06	\N
3138	Jeeten Handu	f	f	t	t	f	f	f	f	First time visitor coming with Preeti. He requested the all-gender room, but she did not... so I'll follow up with them about that. - DS	2023-12-01 20:43:39.361351	2023-12-01 20:43:39.361351	20	532	Male	Guest	2023-12-06	\N
3132	Nancy Murphy	f	f	f	t	t	f	f	t	Happy New Year!	2023-11-30 01:15:58.259412	2023-12-23 21:43:48.465466	51	528	Female	Full Member	2023-12-27	\N
3139	Patrick Jacobs	f	f	t	t	f	f	f	f	Friend of Bryan K. Put him in North Face please.	2023-12-01 20:45:33.541465	2023-12-01 20:45:33.541465	20	532	Male	Guest	2023-12-06	\N
3140	Scott James	f	t	t	t	f	f	f	f		2023-12-01 21:48:11.022315	2023-12-01 21:48:11.022315	261	532	Male	Full Member	2023-12-06	\N
3512	Jenna Whitney 	f	f	t	t	f	f	f	t	Just planning on coming up one night, not sure which yet	2024-04-11 13:34:12.070029	2024-04-11 13:34:12.070029	338	550	Female	Full Member	2024-04-10	\N
3142	K Buck	f	f	f	t	f	f	f	t	Up for the party and evening,	2023-12-04 23:54:56.957434	2023-12-04 23:54:56.957434	33	532	Male	Full Member	2023-12-06	\N
3143	Mirian Barrientos 	f	f	f	t	f	f	f	t	Up for the party and evening after 	2023-12-04 23:56:01.460946	2023-12-04 23:56:01.460946	33	532	Female	Associate Member	2023-12-06	\N
3144	Sarah Morton 	f	f	f	t	f	f	f	t	Up for the party and evening after 	2023-12-04 23:56:51.291877	2023-12-04 23:56:51.291877	33	532	Female	Guest	2023-12-06	\N
3145	Andy Gould	f	f	t	t	f	f	f	f	First time visitor. Was briefly a Skimo long ago and has been dipping his toes back into EICSL over the past year. 	2023-12-05 01:36:20.770245	2023-12-05 01:36:20.770245	20	532	Male	Guest	2023-12-06	\N
3146	Michael Phillips	f	f	t	t	f	f	f	f	He visited a couple of times last year... I'm not sure I actually met him. - DS	2023-12-05 01:39:28.208148	2023-12-05 01:39:28.208148	20	532	Male	Guest	2023-12-06	\N
3147	doug mayo	f	f	t	t	f	f	f	t	Happy Ski Season, maybe just Friday night, GetIntoit	2023-12-05 15:40:12.020068	2023-12-05 15:40:12.020068	12	532	Male	Full Member	2023-12-06	\N
3148	megan mayo	f	f	t	t	f	f	f	t	Lets Getintoit	2023-12-05 15:41:16.079027	2023-12-05 15:41:16.079027	12	532	Female	Full Member	2023-12-06	\N
3149	doug mayo	f	f	t	t	f	f	f	t	GetIntoIt	2023-12-05 15:41:48.577071	2023-12-05 15:41:48.577071	12	534	Male	Full Member	2023-12-13	\N
3150	megan mayo	f	f	t	t	f	f	f	t		2023-12-05 15:42:03.216111	2023-12-05 15:42:03.216111	12	534	Female	Full Member	2023-12-13	\N
3151	doug mayo	f	t	t	t	t	f	f	t	Happy New Year, lets go skiing	2023-12-05 15:42:37.370773	2023-12-05 15:42:37.370773	12	528	Male	Full Member	2023-12-27	\N
3152	megan mayo	t	t	t	t	t	f	f	t	Happy New year	2023-12-05 15:43:06.048768	2023-12-05 15:43:06.048768	12	528	Female	Full Member	2023-12-27	\N
3513	JT Shepple	f	f	t	t	f	f	f	t	JT's second or third visit. Dan can sponsor. - DS	2024-04-11 18:26:55.992768	2024-04-11 18:26:55.992768	20	551	Male	Guest	2024-04-24	\N
3154	Perry	f	t	t	f	f	f	f	t		2023-12-05 23:46:54.707074	2023-12-06 03:57:13.612569	153	532	Male	Full Member	2023-12-06	\N
3156	Matt S 	f	f	t	t	f	f	f	t		2023-12-12 12:37:35.559591	2023-12-12 12:37:35.559591	328	534	Male	Full Member	2023-12-13	\N
3157	Perry F	f	f	t	t	t	t	t	t	Not sure yet which days 	2023-12-12 23:05:13.012881	2023-12-12 23:05:13.012881	153	534	Male	Full Member	2023-12-13	\N
3158	Andrew Blohm	f	f	t	t	f	f	f	t		2023-12-13 00:57:24.856151	2023-12-13 00:57:24.856151	142	534	Male	Full Member	2023-12-13	\N
3159	Corey Blohm	f	f	t	t	f	f	f	t		2023-12-13 00:57:54.205109	2023-12-13 00:57:54.205109	142	534	Female	Full Member	2023-12-13	\N
3160	Dan Shults	f	f	t	t	f	f	f	t	Not 100% sure I'll be coming up, but I'll drop a Perry "maybe" just in case. Will ski Wildcat most likely.	2023-12-13 21:05:54.204718	2023-12-13 21:05:54.204718	20	534	Male	Full Member	2023-12-13	\N
3161	Dominik 	f	f	t	t	f	f	f	t	If ski’s get out of the shop in time I will be heading up	2023-12-14 12:38:28.304042	2023-12-14 12:38:28.304042	267	534	Male	Full Member	2023-12-13	\N
3562	Nicholas Skovran	f	f	t	t	t	f	f	f		2024-04-25 03:05:04.841843	2024-04-25 03:05:04.841843	329	551	Male	Full Member	2024-04-24	\N
3163	JD Martinez	f	f	t	t	f	f	f	t		2023-12-14 21:42:23.571689	2023-12-14 21:42:23.571689	260	534	Female	Full Member	2023-12-13	\N
3164	Dan Shults	f	f	t	t	t	f	f	t	Hello 2024	2023-12-15 22:36:08.133836	2023-12-15 22:36:08.133836	20	528	Male	Full Member	2023-12-27	\N
3165	Dan Shults	f	f	t	t	f	f	f	t	Skiing. 	2023-12-15 22:38:44.039672	2023-12-15 22:38:44.039672	20	537	Male	Full Member	2024-01-03	\N
3167	Jon Macomber	f	f	t	t	f	f	f	t	First time visitor- referral from the Schussers. Dan will sponsor. - DS	2023-12-15 22:40:21.063918	2023-12-15 22:40:21.063918	20	537	Male	Guest	2024-01-03	\N
3600	Nikki Shults	f	f	t	t	f	f	f	t		2024-06-23 18:00:26.834679	2024-06-23 18:00:26.834679	9	562	Female	Full Member	2024-07-10	\N
3192	Rachel Crateau	f	f	t	t	f	f	f	f		2024-01-02 12:34:56.281025	2024-01-02 12:34:56.281025	261	540	Female	Full Member	2024-01-17	\N
3169	John D	t	t	t	t	t	f	f	t		2023-12-21 14:05:32.991572	2023-12-21 14:05:32.991572	2	528	Male	Full Member	2023-12-27	\N
3170	Mark Buckley	f	f	t	t	f	f	f	f		2023-12-24 15:43:41.570043	2023-12-24 15:43:41.570043	22	538	Male	Full Member	2024-01-10	\N
3171	Vicki	f	t	t	t	t	f	f	t	NYE	2023-12-25 18:00:52.002222	2023-12-25 18:00:52.002222	3	528	Female	Full Member	2023-12-27	\N
3173	Alana m	f	t	t	t	t	f	f	t	NYE 	2023-12-25 18:43:52.531157	2023-12-25 18:43:52.531157	23	528	Female	Full Member	2023-12-27	\N
3174	Lori Lavoie	f	f	t	t	t	f	f	t	Probably maybe	2023-12-25 22:34:50.889165	2023-12-25 22:34:50.889165	44	528	Female	Associate Member	2023-12-27	\N
3176	Mike Ryan	f	t	t	t	f	f	f	t	Thursday is a maybe	2023-12-26 00:39:12.322757	2023-12-26 00:39:12.322757	14	537	Male	Full Member	2024-01-03	\N
3177	Michelle Comtois	f	f	t	t	t	f	f	t	Days may change 	2023-12-26 12:05:59.60756	2023-12-26 12:05:59.60756	5	528	Female	Full Member	2023-12-27	\N
3178	Nikki Shults	f	f	t	t	t	f	f	t		2023-12-26 21:22:07.178297	2023-12-26 21:22:07.178297	9	528	Female	Full Member	2023-12-27	\N
3179	Jess Simao	f	f	t	t	t	f	f	t	Guest of Nikki 	2023-12-26 21:22:38.329175	2023-12-26 21:22:38.329175	9	528	Female	Guest	2023-12-27	\N
3180	Mike Lewis	f	f	t	t	t	f	f	t	Guest of nikki	2023-12-26 21:23:02.942437	2023-12-26 21:23:02.942437	9	528	Male	Guest	2023-12-27	\N
3080	Heather K	f	f	f	t	t	f	f	t	NYE!	2023-10-18 21:40:23.24765	2023-12-27 00:30:11.200282	324	528	Female	Full Member	2023-12-27	\N
3181	Dominik	f	f	t	t	t	f	f	t	At some point between Thursday and Monday	2023-12-27 13:51:37.911397	2023-12-27 13:51:37.911397	267	528	Male	Full Member	2023-12-27	\N
3182	Perry F	f	f	t	t	t	f	f	t		2023-12-27 14:21:12.058618	2023-12-27 14:21:12.058618	153	528	Male	Full Member	2023-12-27	\N
3183	Rachel Crateau	f	f	t	t	f	f	f	t		2023-12-27 14:57:38.600364	2023-12-27 14:57:38.600364	261	528	Female	Full Member	2023-12-27	\N
3184	Scott James	f	f	t	t	f	f	f	t		2023-12-27 15:00:05.260285	2023-12-27 15:00:05.260285	261	528	Male	Full Member	2023-12-27	\N
3185	Perry	f	t	f	f	f	f	f	t	Couldn’t update original reservation with Thursday 	2023-12-28 10:52:12.912406	2023-12-28 10:52:12.912406	153	528	Male	Full Member	2023-12-27	\N
3186	Matt s. 	f	f	t	t	f	f	f	t	Maybe 	2023-12-28 19:23:59.921098	2023-12-28 19:23:59.921098	328	528	Male	Full Member	2023-12-27	\N
3187	Amy candelora	f	f	t	t	f	f	f	t		2024-01-02 00:06:56.086941	2024-01-02 00:06:56.086941	16	537	Female	Full Member	2024-01-03	\N
3188	Chris candelora	f	f	t	t	f	f	f	t		2024-01-02 00:08:07.295758	2024-01-02 00:08:07.295758	16	537	Male	Full Member	2024-01-03	\N
3191	Dominik 	f	f	t	t	f	f	f	t		2024-01-02 02:39:38.822745	2024-01-02 02:39:38.822745	267	537	Male	Full Member	2024-01-03	\N
3193	Scott James	f	f	t	t	f	f	f	f		2024-01-02 12:35:46.625928	2024-01-02 12:35:46.625928	261	540	Male	Full Member	2024-01-17	\N
3194	Rachel Crateau	f	f	t	t	f	f	f	t		2024-01-02 12:37:08.397122	2024-01-02 12:37:08.397122	261	539	Female	Full Member	2024-01-31	\N
3195	Scott James	f	f	t	t	f	f	f	t		2024-01-02 12:37:43.146456	2024-01-02 12:37:43.146456	261	539	Male	Full Member	2024-01-31	\N
3196	Mike Ryan	f	f	f	f	f	f	f	t	Not at club, but in Valley doing child care/uncle work	2024-01-02 15:09:11.952885	2024-01-02 15:09:11.952885	14	538	Male	Full Member	2024-01-10	\N
3197	Mike Ryan	f	t	t	t	f	f	f	f	First Aid, Thursday a maybe	2024-01-02 15:10:03.57634	2024-01-02 15:10:03.57634	14	540	Male	Full Member	2024-01-17	\N
3198	Mike Ryan	f	t	t	t	f	f	f	t	Thursday a maybe	2024-01-02 15:10:35.32227	2024-01-02 15:10:35.32227	14	541	Male	Full Member	2024-01-24	\N
3166	Dan Shults	f	f	t	t	t	f	f	t	More skiing.	2023-12-15 22:39:04.390852	2024-01-10 00:26:32.858732	20	538	Male	Full Member	2024-01-10	\N
3200	Andrew Blohm	f	f	t	t	f	f	f	t	Snow please	2024-01-03 01:35:03.153708	2024-01-03 01:35:03.153708	142	537	Male	Full Member	2024-01-03	\N
3199	T Wall	f	f	t	t	f	f	f	f		2024-01-02 22:01:33.304917	2024-01-02 22:02:34.578849	21	538	Male	Full Member	2024-01-17	\N
3201	Corey Blohm	f	f	t	t	f	f	f	t		2024-01-03 01:35:40.292176	2024-01-03 01:35:40.292176	142	537	Female	Full Member	2024-01-03	\N
3202	Perry F	f	t	t	t	f	f	f	t	Snow /work dependent 	2024-01-03 16:11:29.254551	2024-01-03 16:21:13.011902	153	537	Male	Full Member	2024-01-03	\N
3203	doug mayo	f	f	t	t	f	f	f	t	GetIntoIt	2024-01-03 16:25:24.892588	2024-01-03 16:25:24.892588	12	537	Male	Full Member	2024-01-03	\N
3204	megan mayo	f	f	t	t	f	f	f	t	Let It Snow	2024-01-03 16:25:50.466448	2024-01-03 16:25:50.466448	12	537	Female	Full Member	2024-01-03	\N
3205	doug mayo	f	f	t	t	t	f	f	t	Let's Go Skiing	2024-01-03 16:26:34.920594	2024-01-03 16:26:34.920594	12	538	Male	Full Member	2024-01-10	\N
3206	megan mayo	f	f	t	t	t	f	f	t	Pray for Snow	2024-01-03 16:26:57.188244	2024-01-03 16:26:57.188244	12	538	Female	Full Member	2024-01-10	\N
3190	Nancy Murphy	f	f	t	t	f	f	f	f	First Aid	2024-01-02 00:38:42.863986	2024-01-04 02:56:11.528119	51	540	Female	Full Member	2024-01-17	\N
3207	Sara Delaney	f	f	t	t	t	f	f	t	Fri and Sun nights are tentative	2024-01-04 20:11:27.421375	2024-01-04 20:11:27.421375	31	537	Female	Full Member	2024-01-03	\N
3209	Jess P	f	f	t	f	f	f	f	t	Maybe for Friday 	2024-01-07 22:26:21.977089	2024-01-07 22:26:21.977089	137	538	Male	Associate Member	2024-01-10	\N
3211	Dominik	f	f	f	t	t	t	f	t		2024-01-08 17:36:13.649642	2024-01-08 17:36:13.649642	267	538	Male	Full Member	2024-01-10	\N
3213	Amy Candelora	f	f	t	t	t	f	f	t		2024-01-08 23:56:53.749094	2024-01-08 23:56:53.749094	16	538	Female	Full Member	2024-01-10	\N
3214	Chris Candelora	f	f	t	t	t	f	f	t		2024-01-08 23:59:22.29574	2024-01-08 23:59:22.29574	16	538	Male	Full Member	2024-01-10	\N
3215	JD Martinez	f	f	t	t	f	f	f	t		2024-01-09 14:59:14.796015	2024-01-09 14:59:14.796015	260	538	Female	Full Member	2024-01-10	\N
3216	Sara Delaney	f	f	f	f	t	f	f	t	Tentative 	2024-01-09 17:19:51.58977	2024-01-09 17:19:51.58977	31	538	Female	Full Member	2024-01-10	\N
3217	Alana McCarthy 	f	f	t	f	t	f	f	t	Not sure which nights- family obligations too	2024-01-09 21:13:14.249742	2024-01-09 21:13:14.249742	23	538	Female	Full Member	2024-01-10	\N
3218	Nikki Shults	f	f	t	t	t	f	f	t		2024-01-10 00:27:02.184569	2024-01-10 00:27:02.184569	20	538	Female	Full Member	2024-01-10	\N
3219	JT Shepple	f	f	t	t	t	f	f	t	First time guest. Visiting with his friend, August. I can sponsor. - DS	2024-01-10 00:36:37.43322	2024-01-10 00:36:37.43322	20	538	Male	Guest	2024-01-10	\N
3220	August Orlow	f	f	t	t	t	f	f	t	First time guest, visiting with his friend, JT. I can sponsor. - DS	2024-01-10 00:37:13.228736	2024-01-10 00:37:40.650862	20	538	Male	Guest	2024-01-10	\N
3221	Andrew Blohm	f	f	t	t	f	f	f	t		2024-01-10 01:07:45.892424	2024-01-10 01:07:45.892424	142	538	Male	Full Member	2024-01-10	\N
3222	Corey Blohm	f	f	t	t	f	f	f	t		2024-01-10 01:08:21.844693	2024-01-10 01:08:21.844693	142	538	Female	Full Member	2024-01-10	\N
3212	Perry 	f	f	t	t	t	f	f	t		2024-01-08 20:40:54.936278	2024-01-10 01:13:36.552916	153	538	Male	Full Member	2024-01-10	\N
3223	TWall	f	f	t	t	t	f	f	t		2024-01-10 02:40:42.689182	2024-01-10 02:40:42.689182	21	538	Male	Full Member	2024-01-10	\N
3224	Lori Lavoie	f	f	t	t	t	f	f	f	Sunday is a maybe	2024-01-10 12:54:38.492328	2024-01-10 12:54:38.492328	44	538	Female	Associate Member	2024-01-10	\N
3225	Jamie Smart	f	f	t	t	f	f	f	f	Guest of Lori/Sara	2024-01-10 12:55:30.81298	2024-01-10 12:55:44.681435	44	538	Female	Guest	2024-01-10	\N
3226	Jamie Smarts friend	f	f	t	t	f	f	f	f	Guest of Lori/Sara	2024-01-10 12:57:18.096483	2024-01-10 12:57:18.096483	44	538	Female	Guest	2024-01-10	\N
3227	Emily Bularzik	f	f	t	t	f	f	f	f	Guest of Lori/Sara	2024-01-10 12:58:42.843064	2024-01-10 12:58:42.843064	44	538	Female	Guest	2024-01-10	\N
3228	Ali Martin	f	f	t	t	f	f	f	f	Guest of Lori/Sara	2024-01-10 12:59:29.349611	2024-01-10 12:59:29.349611	44	538	Female	Guest	2024-01-10	\N
3229	Ryan Braid	f	f	f	f	t	f	f	t	Husband of prospective member Jenna Whitney. I'll sponsor. - DS	2024-01-10 14:58:32.246908	2024-01-10 14:58:32.246908	20	538	Male	Guest	2024-01-10	\N
3210	Jenna Whitney	f	f	f	f	t	f	f	t	Exact plans TBD- may be coming with a friend. First time guest, but we gave her a tour last weekend. Good prospect! I will sponsor - DS	2024-01-08 15:55:23.606452	2024-01-10 15:14:52.26014	20	538	Female	Guest	2024-01-10	\N
3168	Jon Macomber	f	f	t	t	t	f	f	t	This will be his first visit. Referral from the Schussers. Dan will sponsor. - DS	2023-12-15 22:41:05.568769	2024-01-10 19:46:04.18193	20	538	Male	Guest	2024-01-10	\N
3515	Marcos Lasso	f	f	t	t	f	f	f	t	Been a guest before. Amber's husband. - DS	2024-04-14 02:28:20.754181	2024-04-14 02:28:20.754181	20	551	Male	Guest	2024-04-24	\N
3516	Amber Wantman	f	f	t	t	f	f	f	t	Amber's been up a number of times. Kind of a prospect or maybe just a semi-frequent guest? - DS	2024-04-14 02:29:40.32559	2024-04-14 02:29:40.32559	20	551	Female	Guest	2024-04-24	\N
3517	Rachel Crateau	f	f	t	t	f	f	f	f	We will work on a club dinner menu and get it posted to Slack 	2024-04-15 19:13:02.609415	2024-04-15 19:13:02.609415	261	551	Female	Full Member	2024-04-24	\N
3518	Scott James	f	f	t	t	f	f	f	f		2024-04-15 19:13:47.489183	2024-04-15 19:13:47.489183	261	551	Male	Full Member	2024-04-24	\N
3519	JD Martinez	f	f	t	t	f	f	f	t	Tuckermans!	2024-04-16 13:42:21.816134	2024-04-16 13:42:21.816134	260	551	Female	Full Member	2024-04-24	\N
3520	Perry	f	f	t	t	f	f	f	t	depending on weather 	2024-04-16 16:14:18.042913	2024-04-16 16:14:18.042913	153	553	Male	Full Member	2024-04-17	\N
3521	Dominik	f	t	t	f	f	f	f	t	Condition dependent 	2024-04-17 20:11:17.142978	2024-04-17 20:11:17.142978	267	553	Male	Full Member	2024-04-17	\N
3554	Bryan Kirk	f	f	t	t	f	f	f	f	Tucks Tailgate	2024-04-20 13:16:36.841825	2024-04-20 13:16:51.392023	219	551	Male	Full Member	2024-04-24	\N
3555	John D	f	t	t	t	t	f	f	t		2024-04-21 16:33:22.551025	2024-04-21 16:33:22.551025	2	551	Male	Full Member	2024-04-24	\N
3514	August Orlow	f	f	t	t	f	f	f	t	Friend of JT. His second visit. - DS	2024-04-11 18:27:38.416982	2024-04-22 14:48:38.361732	20	551	Male	Guest	2024-04-24	\N
3573	JD Martinez	f	f	t	t	f	f	f	f	Work weekend	2024-05-22 13:32:39.974757	2024-05-22 13:32:39.974757	260	556	Female	Full Member	2024-06-19	\N
3556	Kristina Johnson 	f	f	t	t	f	f	f	f	Guest of Jess P.  Vicki bed please. 	2024-04-21 20:53:22.982349	2024-04-22 23:06:26.212913	137	551	Female	Guest	2024-04-24	\N
3563	Perry	f	f	t	t	f	f	f	t	Maybe	2024-04-30 13:51:42.63412	2024-04-30 13:51:42.63412	153	555	Male	Full Member	2024-05-01	\N
3564	Yasmine	f	f	t	t	f	f	f	t	Maybe - guest of Perry 	2024-05-01 18:45:42.169296	2024-05-01 18:45:42.169296	153	555	Female	Guest	2024-05-01	\N
3565	Nikki Shults	f	f	t	t	f	f	f	t	Work weekend. Kayaking on Sunday - open invite	2024-05-06 16:49:00.218346	2024-05-06 16:49:00.218346	9	556	Female	Full Member	2024-06-19	\N
3574	Ryan and Jenna	f	f	f	t	f	f	f	t		2024-05-22 22:52:22.489626	2024-05-22 22:55:34.922819	339	557	Male	Full Member	2024-05-22	\N
3568	Perry	f	f	t	t	f	f	f	t		2024-05-10 19:38:42.890123	2024-05-10 19:38:42.890123	153	558	Male	Full Member	2024-05-15	\N
3569	James S	f	f	t	t	f	f	f	t	Guest of Perry	2024-05-10 19:39:08.296789	2024-05-10 19:39:08.296789	153	558	Male	Guest	2024-05-15	\N
3570	Samson B	f	f	t	t	f	f	f	t	Guest of Perry	2024-05-10 19:39:36.071053	2024-05-10 19:39:36.071053	153	558	Male	Guest	2024-05-15	\N
3571	Dominik	f	f	t	t	f	f	f	t	Only if the weather improves significantly	2024-05-14 12:23:44.148058	2024-05-14 12:23:44.148058	267	558	Male	Full Member	2024-05-15	\N
3572	Michelle Comtois	f	f	t	f	f	f	f	t	Not sure if I will be staying Saturday night 	2024-05-22 13:02:51.773509	2024-05-22 13:02:51.773509	5	556	Female	Full Member	2024-06-19	\N
3566	Rachel Crateau	f	t	t	f	f	f	f	t	Planned Roof Work  - Plus 6 other reservations for roofers for Thursday night only (if needed Scott thinks they can have this completed Thursday	2024-05-08 14:40:47.20429	2024-05-22 17:45:31.446903	261	557	Female	Full Member	2024-05-22	\N
3567	Scott James	f	t	t	f	f	f	f	t	Planned Roof Work 	2024-05-08 14:43:08.846463	2024-05-22 17:46:10.083472	261	557	Male	Full Member	2024-05-22	\N
3575	Dan Shults	f	f	t	t	f	f	f	t	Work work work	2024-05-25 03:12:35.150185	2024-05-25 03:12:35.150185	20	556	Male	Full Member	2024-06-19	\N
3576	Mike Ryan	f	f	t	t	f	f	f	f		2024-06-02 15:44:14.793749	2024-06-02 15:44:14.793749	14	559	Male	Full Member	2024-07-17	\N
3577	Dominik Airey	f	f	t	t	f	f	f	t	Workweekend!	2024-06-03 01:48:20.023814	2024-06-05 00:14:13.301245	267	556	Male	Full Member	2024-06-19	\N
3578	John D	f	t	t	t	t	f	f	t	Tentative: Porch sittin’. Bike watching’.	2024-06-05 14:15:38.049776	2024-06-05 14:15:38.049776	2	560	Male	Full Member	2024-06-05	\N
3579	Perry 	f	f	t	t	f	f	f	t	Probably not	2024-06-05 15:26:22.606626	2024-06-05 15:26:22.606626	153	560	Male	Full Member	2024-06-05	\N
3580	Dominik	f	f	f	t	f	f	f	t	Sat night to sun evening	2024-06-05 17:47:14.251714	2024-06-05 17:47:14.251714	267	560	Male	Full Member	2024-06-05	\N
3581	Andrew Blohm	f	f	t	t	f	f	f	t	Work weekend 	2024-06-06 02:13:48.330167	2024-06-06 02:13:48.330167	142	556	Male	Full Member	2024-06-19	\N
3582	Corey Blohm	f	f	t	t	f	f	f	t	Work weekend 	2024-06-06 02:14:18.466167	2024-06-06 02:14:18.466167	142	556	Female	Full Member	2024-06-19	\N
3583	Rachel Crateau	f	f	t	t	f	f	f	t		2024-06-09 18:00:43.275975	2024-06-09 18:00:43.275975	261	556	Female	Full Member	2024-06-19	\N
3231	Nicholas Skovran	f	f	t	t	t	f	f	f	Here for the First Aid party and Race weekend	2024-01-10 21:47:54.522266	2024-01-10 21:47:54.522266	329	540	Male	Full Member	2024-01-17	\N
3232	John	f	t	t	t	t	f	f	t	First Aid/Race	2024-01-10 22:23:53.356795	2024-01-10 22:23:53.356795	2	540	Male	Full Member	2024-01-17	\N
3233	Chris B	f	t	t	t	f	f	f	f	First Aid Baby!!! Thurs arrival is tentative. 	2024-01-10 22:57:15.819064	2024-01-10 22:57:15.819064	15	540	Male	Full Member	2024-01-17	\N
3234	Ron Swanick	f	f	t	t	f	f	f	f	Guest of Chris B. Please put in Masters if Nung’s bed is open. 	2024-01-10 22:58:36.379812	2024-01-10 22:58:36.379812	15	540	Male	Guest	2024-01-17	\N
3235	Chris Campbell	f	f	t	t	f	f	f	t	First time guest sourced via EICSL form. Dan and Nancy will tag-team sponsoring. - DS	2024-01-13 21:23:26.520402	2024-01-13 21:45:30.880737	20	541	Male	Guest	2024-01-24	\N
3237	Amy Candelora	f	f	t	t	f	f	f	t	First aid!!!!!	2024-01-13 21:46:53.595786	2024-01-13 21:46:53.595786	16	540	Female	Full Member	2024-01-17	\N
3238	Chris candelora	f	f	t	t	f	f	f	t	Dj is coming up!	2024-01-13 21:47:29.221899	2024-01-13 21:47:29.221899	16	540	Male	Full Member	2024-01-17	\N
3239	Lori Lavoie	f	f	t	t	f	f	f	f	Bottom bunk if possible	2024-01-14 05:45:27.214901	2024-01-14 05:45:27.214901	44	540	Female	Associate Member	2024-01-17	\N
3240	Jamie Smart	f	f	t	t	f	f	f	f	Guest of Lori L/Sara D	2024-01-14 05:50:56.972528	2024-01-14 05:50:56.972528	44	540	Female	Guest	2024-01-17	\N
3241	Friend of Jamie Smart	f	f	t	t	f	f	f	f	Guest of Lori L/Sara D	2024-01-14 05:52:43.756813	2024-01-14 05:52:43.756813	44	540	Female	Guest	2024-01-17	\N
3242	Ali Martin	f	f	t	t	f	f	f	f	Guest of Lori L/Sara D	2024-01-14 05:53:34.241751	2024-01-14 05:53:34.241751	44	540	Female	Guest	2024-01-17	\N
3243	Emily Bularzik	f	f	t	t	f	f	f	f	Guest of Lori L/Sara D	2024-01-14 05:56:26.609073	2024-01-14 05:56:26.609073	44	540	Female	Guest	2024-01-17	\N
3245	Alana	f	f	t	t	f	f	f	t	First aid	2024-01-15 21:01:22.646328	2024-01-15 21:01:22.646328	23	540	Female	Full Member	2024-01-17	\N
3246	doug mayo	f	f	t	t	f	f	f	t	GetIntoIt	2024-01-16 14:10:53.210475	2024-01-16 14:10:53.210475	12	540	Male	Full Member	2024-01-17	\N
3247	megan mayo	f	f	t	t	f	f	f	t	Let It Snow	2024-01-16 14:11:24.382994	2024-01-16 14:11:24.382994	12	540	Female	Full Member	2024-01-17	\N
3248	Jackie Schneider	f	f	f	t	f	f	f	f	Mike's Cousin Jackie	2024-01-16 14:18:21.106653	2024-01-16 14:18:21.106653	14	540	Female	Guest	2024-01-17	\N
3249	Joel	f	f	f	t	f	f	f	f	Jackie Boyfriends Joel	2024-01-16 14:18:54.0235	2024-01-16 14:18:54.0235	14	540	Male	Guest	2024-01-17	\N
3250	JD Martinez	f	f	t	t	f	f	f	f	First Aid!	2024-01-16 14:18:55.391331	2024-01-16 14:18:55.391331	260	540	Female	Full Member	2024-01-17	\N
3252	Jacob Donovan	f	f	t	t	f	f	f	f	Guest of Zach B	2024-01-16 17:50:45.044609	2024-01-16 17:50:45.044609	326	540	Male	Guest	2024-01-17	\N
3251	Zach Bassett	f	f	t	t	f	f	f	f	First aid	2024-01-16 17:49:43.859563	2024-01-16 17:50:56.999999	326	540	Male	Full Member	2024-01-17	\N
3253	Andrew Blohm	f	f	t	t	f	f	f	f		2024-01-16 22:23:09.703822	2024-01-16 22:23:09.703822	142	540	Male	Full Member	2024-01-17	\N
3254	Corey Blohm	f	f	t	t	f	f	f	f		2024-01-16 22:23:34.934979	2024-01-16 22:23:34.934979	142	540	Female	Full Member	2024-01-17	\N
3236	Dominik	f	f	t	t	f	f	f	f		2024-01-13 21:46:20.691218	2024-01-16 22:28:27.794458	267	540	Male	Full Member	2024-01-17	\N
3256	Nung	f	f	f	t	f	f	f	t		2024-01-17 22:02:49.022476	2024-01-17 22:02:49.022476	7	540	Male	Full Member	2024-01-17	\N
3257	Pop	f	f	f	t	f	f	f	t	Guest of Nung	2024-01-17 22:03:49.419102	2024-01-17 22:03:49.419102	7	540	Female	Guest	2024-01-17	\N
3258	Vicki S	f	t	t	t	t	f	f	f	First aid 	2024-01-17 22:09:40.980772	2024-01-17 22:09:40.980772	3	540	Female	Full Member	2024-01-17	\N
3314	Rachel Crateau	f	f	t	t	f	f	f	t		2024-02-04 18:41:43.13553	2024-02-04 18:41:43.13553	261	543	Female	Full Member	2024-02-07	\N
3259	Maurice Grant	f	f	t	t	f	f	f	f	Maurice attended our virtual meetup. This will be his first visit. Paying with cash. Nancy/Tommy/Perry are tag-teaming guest sponsorship. - DS	2024-01-17 22:28:15.381404	2024-01-17 22:28:15.381404	20	540	Male	Guest	2024-01-17	\N
3262	Phoebe Caldwell	f	f	t	t	f	f	f	f	First time visitor who found us on Reddit. Seems like a good prospect. Will pay w Venmo. Nancy/Tommy/Perry are tag-teaming guest sponsorship. - DS	2024-01-17 22:35:49.237458	2024-01-17 22:35:49.237458	20	540	Female	Guest	2024-01-17	\N
3260	Amanda Jacobs	f	f	f	t	f	f	f	f	First time visitor who found us on FB. Paying w Venmo. She will arrive Saturday afternoon. I told her we'd probably give her a break on price since she's only staying one night. $70 should do it. Nancy/Tommy/Perry are tag-teaming guest sponsorship. - DS	2024-01-17 22:31:18.359191	2024-01-17 22:36:02.06772	20	540	Female	Guest	2024-01-17	\N
3261	Oleg Shatrovoy	f	f	t	t	f	f	f	f	Fogel introduced Oleg to the club last year. Oleg has visited once or twice. paying w Venmo. Nancy/Tommy/Perry are tag-teaming guest sponsorship. - DS	2024-01-17 22:32:56.975929	2024-01-17 22:36:11.484978	20	540	Male	Guest	2024-01-17	\N
3263	Sandra ODonnell	f	f	t	t	f	f	f	f	First time visitor. Sandra has been trying to organize a visit for some time. Will pay w Venmo. Nancy/Tommy/Perry are tag-teaming guest sponsorship. - DS	2024-01-17 22:37:41.293097	2024-01-17 22:37:41.293097	20	540	Female	Guest	2024-01-17	\N
3264	Jon Macomber	f	f	t	t	f	f	f	f	This will be Jon's second visit. Very nice guy - drank a lot but stayed friendly. Get to know him! Paying w Cash. Nancy/Tommy/Perry will tag-team sponsorship. - DS	2024-01-17 22:40:42.449769	2024-01-17 22:40:42.449769	20	540	Male	Guest	2024-01-17	\N
3265	Joe Capozzi	f	f	t	t	f	f	f	f	First time visitor. I need to follow up with him to learn more about where he found out about us. Haven't really vetted him yet but will try to before Friday. Paying w Venmo. Nancy/Tommy/Perry are tag-teaming sponsorship. - DS	2024-01-17 22:42:59.558286	2024-01-17 22:42:59.558286	20	540	Male	Guest	2024-01-17	\N
3267	Kate Matson	f	f	t	t	f	f	f	t	First time guest and referral from the Schussers. Could be a good Prospect- get to know her! I'm not coming up til Saturday, so will need help with sponsoring Fri night. - DS	2024-01-19 15:16:45.376434	2024-01-19 15:16:45.376434	20	539	Female	Guest	2024-01-31	\N
3268	Dan Shults	f	f	f	t	f	f	f	t	Coming up Saturday. Probably hit Loon on the way up and Cranmore for the race on Sunday.	2024-01-19 17:23:24.288382	2024-01-19 17:23:24.288382	20	539	Male	Full Member	2024-01-31	\N
3270	Nathaniel Rewey	f	t	f	f	f	f	f	t	Guest of Dan	2024-01-19 17:25:42.362471	2024-01-19 17:25:42.362471	20	541	Male	Guest	2024-01-24	\N
3271	Dan Shults	f	t	f	t	f	f	f	t	Staying over at Sunday River Friday night, then back to the club. SR Fri and Sat, Cat on Sun. 	2024-01-19 17:26:30.249168	2024-01-19 17:26:30.249168	20	541	Male	Full Member	2024-01-24	\N
3272	Tyler Short	f	t	f	f	f	f	f	t	Guest of Dan	2024-01-19 17:28:49.464993	2024-01-19 17:28:49.464993	20	541	Male	Guest	2024-01-24	\N
3274	Nancy Murphy	f	f	t	t	f	f	f	t		2024-01-22 00:06:29.534123	2024-01-22 00:06:29.534123	51	539	Female	Full Member	2024-01-31	\N
3275	Nancy Murphy	f	f	t	t	f	f	f	t		2024-01-22 13:12:17.843505	2024-01-22 13:12:17.843505	51	541	Female	Full Member	2024-01-24	\N
3276	TWall	f	f	t	t	f	f	f	t	Probable	2024-01-22 15:56:07.665906	2024-01-22 15:56:07.665906	21	541	Male	Full Member	2024-01-24	\N
3277	Jenna Whitney	f	f	t	t	f	f	f	t	Jenna and Ryan's second visit. Good prospects! Get to know them. I'm not up until Saturday so will need help w a sponsor Friday night. - DS	2024-01-22 17:49:41.38194	2024-01-22 17:49:41.38194	20	539	Female	Guest	2024-01-31	\N
3278	Ryan Braid	f	f	t	t	f	f	f	t	Ryan and Jenna's second visit. Good prospects! Get to know them. I will need help with sponsoring Friday night; I won't be up until Saturday. - DS	2024-01-22 17:50:41.911098	2024-01-22 17:50:41.911098	20	539	Male	Guest	2024-01-31	\N
3279	Dominik	f	f	t	t	f	f	f	t	Friday night for sure, maybe on saturday night	2024-01-22 21:55:58.8982	2024-01-22 21:55:58.8982	267	541	Male	Full Member	2024-01-24	\N
3280	Lori Lavoie	f	t	t	t	f	f	f	t	Maybe…extra maybe on Thurs.	2024-01-23 04:12:42.342877	2024-01-23 04:12:42.342877	44	541	Female	Associate Member	2024-01-24	\N
3281	JD Martinez	f	f	t	t	f	f	f	t	Probably coming up.	2024-01-23 15:53:34.74536	2024-01-23 15:53:34.74536	260	541	Female	Full Member	2024-01-24	\N
3282	Rachel Crateau	f	f	t	t	f	f	f	t		2024-01-23 16:01:51.683016	2024-01-23 16:01:51.683016	261	541	Female	Full Member	2024-01-24	\N
3283	Scott James	f	f	t	t	f	f	f	t		2024-01-23 16:02:28.404697	2024-01-23 16:02:28.404697	261	541	Male	Full Member	2024-01-24	\N
3284	Rachel Crateau	f	f	t	t	f	f	f	t		2024-01-23 16:03:08.550354	2024-01-23 16:03:08.550354	261	539	Female	Full Member	2024-01-31	\N
3285	Scott James	f	f	t	t	f	f	f	t		2024-01-23 16:03:42.29788	2024-01-23 16:03:42.29788	261	539	Male	Full Member	2024-01-31	\N
3286	Alana	f	f	t	t	f	f	f	t	Maybe?	2024-01-23 16:05:38.733063	2024-01-23 16:05:38.733063	23	541	Female	Full Member	2024-01-24	\N
3287	doug mayo	f	f	t	t	f	f	f	t		2024-01-23 16:24:16.591572	2024-01-23 16:24:16.591572	12	541	Male	Full Member	2024-01-24	\N
3289	Michael Nolan	f	f	t	t	f	f	f	t	Michael is visiting for the first time along with his friend Bill. He's a member of a ski club in VT, and has been inquiring about us for a while. First visit. Nancy/Dan sponsoring. - DS	2024-01-24 17:14:01.524472	2024-01-24 17:14:01.524472	20	541	Male	Guest	2024-01-24	\N
3290	Bill Rodrigues	f	f	t	t	f	f	f	t	Friend of new prospect Michael Nolan. First visit. Dan/Nancy to sponsor. - DS	2024-01-24 17:14:44.434759	2024-01-24 17:14:44.434759	20	541	Male	Guest	2024-01-24	\N
3291	Sara Delaney	f	f	t	t	f	f	f	f		2024-01-24 18:38:01.10774	2024-01-24 18:38:01.10774	31	541	Female	Full Member	2024-01-24	\N
3292	Perry	f	f	t	t	f	f	f	t		2024-01-25 00:47:02.253804	2024-01-25 00:47:02.253804	153	541	Male	Full Member	2024-01-24	\N
3293	John Femino + 1	f	f	t	t	f	f	f	f	Guest(s) of Delaney. He’s a maybe and will maybe have a friend with him	2024-01-25 02:00:04.343821	2024-01-25 02:00:04.343821	31	541	Male	Guest	2024-01-24	\N
3294	Emily Bularzik	f	f	t	t	f	f	f	t	Guest of Delaney	2024-01-25 02:01:44.494171	2024-01-25 02:01:44.494171	31	541	Female	Guest	2024-01-24	\N
3295	Dominik	f	f	t	t	f	f	f	t		2024-01-28 04:36:47.78425	2024-01-28 04:36:47.78425	267	539	Male	Full Member	2024-01-31	\N
3297	Mike Ryan	f	t	t	t	f	f	f	t	Maybe on Thursday	2024-01-29 17:16:00.573074	2024-01-29 17:16:00.573074	14	543	Male	Full Member	2024-02-07	\N
3298	Mike Ryan	f	t	t	t	t	f	f	t	Maybe on Thursday	2024-01-29 17:16:49.398758	2024-01-29 17:16:49.398758	14	542	Male	Full Member	2024-02-14	\N
3299	Mike Ryan	f	f	t	t	f	f	f	t		2024-01-29 17:17:24.904446	2024-01-29 17:17:24.904446	14	544	Male	Full Member	2024-02-21	\N
3300	Mike Ryan	f	t	t	t	f	f	f	t	Maybe on Thursday	2024-01-29 17:18:13.901223	2024-01-29 17:18:13.901223	14	545	Male	Full Member	2024-02-28	\N
3584	Scott James	f	f	t	t	f	f	f	t		2024-06-09 18:01:19.09833	2024-06-09 18:01:19.09833	261	556	Male	Full Member	2024-06-19	\N
3302	Michelle Comtois	f	f	t	t	f	f	f	t	Maybe only Saturday night not sure yet 	2024-01-30 19:49:11.3072	2024-01-30 19:49:11.3072	5	543	Female	Full Member	2024-02-07	\N
3303	Andrew Blohm	f	f	t	f	f	f	f	t		2024-01-31 00:02:58.63468	2024-01-31 00:02:58.63468	142	539	Male	Full Member	2024-01-31	\N
3305	Nikki Shults	f	f	f	t	f	f	f	t		2024-01-31 03:13:17.837381	2024-01-31 03:13:17.837381	9	539	Female	Full Member	2024-01-31	\N
3306	Alana M	f	f	t	t	f	f	f	t	Race!	2024-01-31 18:59:37.741998	2024-01-31 18:59:37.741998	23	539	Female	Full Member	2024-01-31	\N
3307	Tommy	f	f	t	t	f	f	f	t	Race!	2024-01-31 19:18:40.548751	2024-01-31 19:18:40.548751	23	539	Male	Full Member	2024-01-31	\N
3273	Jess P	f	f	t	f	f	f	f	t	Friday only, Beth’s bed please 	2024-01-20 19:14:43.827697	2024-01-31 22:01:56.386107	137	539	Female	Associate Member	2024-01-31	\N
3308	Nicholas Skovran	f	f	t	t	t	f	f	t	Bringing one guest	2024-02-01 04:10:03.114877	2024-02-01 04:10:03.114877	329	539	Male	Full Member	2024-01-31	\N
3309	Benjamin Malin	f	f	t	t	f	f	f	t	First time guest. NEEDS A SPONSOR and I won't be available. Lmk if you can help!  -DS	2024-02-02 01:16:55.944338	2024-02-02 01:16:55.944338	20	542	Male	Guest	2024-02-14	\N
3310	Nancy Murphy	f	f	t	t	f	f	f	t	Coming as long as I’m not feeling contagious	2024-02-02 23:41:54.340932	2024-02-02 23:41:54.340932	51	543	Female	Full Member	2024-02-07	\N
3311	Nancy Murphy	f	t	t	f	f	f	f	t		2024-02-03 21:02:22.672692	2024-02-03 21:02:22.672692	51	546	Female	Full Member	2024-03-06	\N
3313	Nancy Murphy	f	f	t	t	f	f	f	t		2024-02-04 02:24:21.106614	2024-02-04 02:24:21.106614	51	545	Female	Full Member	2024-02-28	\N
3315	Scott James	f	f	t	t	f	f	f	t		2024-02-04 18:42:20.053274	2024-02-04 18:42:20.053274	261	543	Male	Full Member	2024-02-07	\N
3316	Adam Crateau	f	f	t	t	f	f	f	t	Guest of Rachel & Scott - Tentative and maybe only Friday	2024-02-04 18:50:57.069047	2024-02-04 18:50:57.069047	261	543	Male	Guest	2024-02-07	\N
3317	Perry 	f	t	t	t	t	f	f	t	Maybe for Thurs /sun 	2024-02-05 01:44:41.378562	2024-02-05 01:44:41.378562	153	543	Male	Full Member	2024-02-07	\N
3318	Chris B.	f	f	t	t	f	f	f	t		2024-02-05 16:01:13.167341	2024-02-05 16:01:13.167341	15	543	Male	Full Member	2024-02-07	\N
3319	Ron Swanick	f	f	t	t	f	f	f	t	(Tentative) Guest of Chris B - put in Nung’s Bunk please. 	2024-02-05 16:02:50.585555	2024-02-05 16:02:50.585555	15	543	Male	Guest	2024-02-07	\N
3320	Dan Shults	f	t	f	t	f	f	f	t	Thurs and Sat night only. Will have a guest for one or both nights.	2024-02-05 18:16:51.800325	2024-02-05 18:16:51.800325	20	543	Male	Full Member	2024-02-07	\N
3321	Bryan Kirk	f	t	t	t	t	f	f	t	Maybe Thursday	2024-02-06 02:33:46.121303	2024-02-06 02:33:46.121303	219	543	Male	Full Member	2024-02-07	\N
3322	Tyler Short	f	t	f	t	f	f	f	t	Guest of Dan. Tyler is a "maybe" for Saturday. - DS	2024-02-06 19:15:43.504623	2024-02-06 19:15:43.504623	20	543	Male	Guest	2024-02-07	\N
3323	Zach Bassett	f	f	t	t	f	f	f	t		2024-02-06 20:15:32.738921	2024-02-06 20:15:32.738921	326	543	Male	Full Member	2024-02-07	\N
3324	Chris Candelora	f	f	t	t	f	f	f	t		2024-02-07 01:39:35.290807	2024-02-07 01:39:35.290807	16	543	Male	Full Member	2024-02-07	\N
3325	Amy Candelora	f	f	t	t	f	f	f	t		2024-02-07 01:40:30.837782	2024-02-07 01:40:30.837782	16	543	Female	Full Member	2024-02-07	\N
3326	Mike Murphy	f	t	f	f	f	f	f	t	Guest of Dan. Thurs only. -DS	2024-02-07 02:07:09.196326	2024-02-07 02:07:09.196326	20	543	Male	Guest	2024-02-07	\N
3327	Ed Chappel	f	t	f	f	f	f	f	t	Guest of Dan. Thurs only. -DS	2024-02-07 02:07:30.757697	2024-02-07 02:07:30.757697	20	543	Male	Guest	2024-02-07	\N
3328	Doug Mayo	f	f	t	t	f	f	f	t		2024-02-07 12:28:49.963662	2024-02-07 12:28:49.963662	12	543	Male	Full Member	2024-02-07	\N
3329	Megan mayo 	f	f	t	t	f	f	f	t		2024-02-07 12:29:11.162024	2024-02-07 12:29:11.162024	12	543	Female	Full Member	2024-02-07	\N
3330	JD Martinez	f	f	t	t	f	f	f	t		2024-02-07 13:46:45.614738	2024-02-07 13:46:45.614738	260	543	Female	Full Member	2024-02-07	\N
3331	Alana	f	f	t	t	f	f	f	t	Big old maybe	2024-02-08 00:56:23.804799	2024-02-08 00:56:23.804799	23	543	Female	Full Member	2024-02-07	\N
3332	Tommy	f	f	t	t	f	f	f	t		2024-02-08 00:57:42.214999	2024-02-08 00:57:42.214999	23	543	Male	Full Member	2024-02-07	\N
3333	Dominik	f	f	f	t	f	f	f	t	Leaving sat night	2024-02-08 01:07:45.787442	2024-02-08 01:07:45.787442	267	543	Male	Full Member	2024-02-07	\N
3296	Nancy Murphy	f	t	t	f	f	f	f	t	Both days are maybes 	2024-01-28 19:13:58.642197	2024-02-13 15:42:21.187982	51	542	Female	Full Member	2024-02-14	\N
3334	Dominik	f	f	f	t	t	t	f	t	Friday night-sunday or monday	2024-02-13 18:08:47.043772	2024-02-13 18:08:47.043772	267	542	Male	Full Member	2024-02-14	\N
3335	Rachel Crateau	f	f	t	t	f	f	f	t		2024-02-13 21:11:16.408332	2024-02-13 21:11:16.408332	261	542	Female	Full Member	2024-02-14	\N
3336	Scott James	f	f	t	t	f	f	f	t		2024-02-13 21:11:52.099956	2024-02-13 21:11:52.099956	261	542	Male	Full Member	2024-02-14	\N
3337	Rachel Crateau	f	f	t	t	f	f	f	t		2024-02-13 21:12:21.830228	2024-02-13 21:12:21.830228	261	544	Female	Full Member	2024-02-21	\N
3338	Scott James	f	f	t	t	f	f	f	t		2024-02-13 21:12:45.688877	2024-02-13 21:12:45.688877	261	544	Male	Full Member	2024-02-21	\N
3339	Sara Delaney	f	f	f	t	t	f	f	t		2024-02-14 00:19:57.073213	2024-02-14 00:20:09.595373	31	542	Female	Full Member	2024-02-14	\N
3340	Ali Martin	f	f	f	t	t	f	f	t	Guest of Delaney	2024-02-14 00:20:42.388013	2024-02-14 00:20:42.388013	31	542	Female	Guest	2024-02-14	\N
3341	doug mayo	f	f	f	t	t	t	t	t		2024-02-14 11:59:29.033355	2024-02-14 11:59:29.033355	12	542	Male	Full Member	2024-02-14	\N
3342	megan mayo	f	f	f	t	t	t	t	t		2024-02-14 11:59:49.840868	2024-02-14 11:59:49.840868	12	542	Female	Full Member	2024-02-14	\N
3343	doug mayo	t	t	t	t	f	f	f	t		2024-02-14 12:00:12.404078	2024-02-14 12:00:12.404078	12	544	Male	Full Member	2024-02-21	\N
3344	megan mayo	t	t	t	t	f	f	f	t		2024-02-14 12:00:34.105285	2024-02-14 12:00:34.105285	12	544	Female	Full Member	2024-02-21	\N
3345	JD Martinez	f	f	t	t	f	f	f	t		2024-02-14 14:40:16.48134	2024-02-14 14:40:16.48134	260	542	Female	Full Member	2024-02-14	\N
3346	Dan Shults	f	f	t	t	f	f	f	t	Race weekend + bday!	2024-02-16 15:45:37.771485	2024-02-16 15:45:37.771485	20	545	Male	Full Member	2024-02-28	\N
3347	Amy Candelora 	f	f	t	t	f	f	f	t		2024-02-17 13:53:01.80744	2024-02-17 13:53:01.80744	16	544	Female	Full Member	2024-02-21	\N
3348	Chris Candelora	f	f	t	t	f	f	f	t		2024-02-17 13:53:45.565144	2024-02-17 13:53:45.565144	16	544	Male	Full Member	2024-02-21	\N
3381	Nikki Shults	f	t	t	t	f	f	f	t	Maybe thurs	2024-02-18 02:48:44.150723	2024-02-18 02:48:44.150723	9	545	Female	Full Member	2024-02-28	\N
3382	Jess Simao	f	f	t	t	f	f	f	t	Guest of nikki	2024-02-18 02:49:05.905232	2024-02-18 02:49:05.905232	9	545	Female	Guest	2024-02-28	\N
3383	Cindy Bright	f	f	t	t	f	f	f	t	Guest. Visited once before at Summerfield. Looking to join a club, checking a few out. 	2024-02-18 02:51:01.986192	2024-02-18 02:51:01.986192	9	546	Female	Guest	2024-03-06	\N
3384	Vicki S	f	f	t	t	f	f	f	t		2024-02-19 02:24:16.268528	2024-02-19 02:24:16.268528	3	544	Female	Full Member	2024-02-21	\N
3385	Tatiana Cook	f	f	t	t	f	f	f	t	Friend of Vicki	2024-02-19 02:24:54.734307	2024-02-19 02:24:54.734307	3	544	Female	Guest	2024-02-21	\N
3386	John	f	t	t	t	t	t	t	t	I’m hoping to stay at Sunday River Mon and Tue, weather permitting. 	2024-02-19 15:46:09.800719	2024-02-19 15:46:09.800719	2	544	Male	Full Member	2024-02-21	\N
3387	Perry	f	t	t	t	f	f	f	t	MayB 	2024-02-20 17:44:25.383441	2024-02-20 17:44:25.383441	153	544	Male	Full Member	2024-02-21	\N
3388	Matt s	f	f	t	t	f	f	f	t		2024-02-20 18:23:19.881337	2024-02-20 18:23:19.881337	328	544	Male	Full Member	2024-02-21	\N
3389	T Wall	f	f	t	t	f	f	f	t	Likely	2024-02-21 00:48:00.15975	2024-02-21 00:48:00.15975	21	544	Male	Full Member	2024-02-21	\N
3390	Alana	f	f	t	t	f	f	f	t	Probable 	2024-02-21 00:49:20.981382	2024-02-21 00:49:20.981382	21	544	Female	Full Member	2024-02-21	\N
3391	Dominik	f	f	t	t	t	f	f	t		2024-02-21 04:34:21.600788	2024-02-21 04:34:21.600788	267	544	Male	Full Member	2024-02-21	\N
3392	Nung	f	f	f	t	f	f	f	t		2024-02-21 16:49:32.677038	2024-02-21 16:49:32.677038	7	544	Male	Full Member	2024-02-21	\N
3393	Pop	f	f	f	t	f	f	f	t	Masters if available please	2024-02-21 16:50:28.365951	2024-02-21 16:50:28.365951	7	544	Female	Guest	2024-02-21	\N
3394	Jenna Whitney 	f	f	f	t	f	f	f	t	New member adding her as she hasn’t been set up yet 	2024-02-21 18:16:04.882573	2024-02-21 18:16:04.882573	5	544	Female	Full Member	2024-02-21	\N
3395	Ryan Baird	f	f	f	t	f	f	f	t	New member adding him as he hasn’t been set up yet 	2024-02-21 18:17:03.463499	2024-02-21 18:17:03.463499	5	544	Male	Full Member	2024-02-21	\N
3396	Adam Crateau	f	f	t	t	f	f	f	t	Guest of Rachel & Scott, tentatively both nights. 	2024-02-21 18:28:30.512677	2024-02-21 18:28:30.512677	261	544	Male	Guest	2024-02-21	\N
3397	Andrew Blohm	f	f	f	t	f	f	f	t		2024-02-21 20:23:09.684149	2024-02-21 20:23:09.684149	142	544	Male	Full Member	2024-02-21	\N
3398	Corey Blohm	f	f	f	t	f	f	f	t		2024-02-21 20:23:35.91632	2024-02-21 20:23:35.91632	142	544	Female	Full Member	2024-02-21	\N
3399	Tyler Buckeridge	f	f	f	t	f	f	f	t	Guest. Coming up Saturday night only. I will sponsor.	2024-02-22 13:31:23.49719	2024-02-22 13:31:23.49719	267	544	Male	Guest	2024-02-21	\N
3400	Amy Candelora 	f	f	t	t	f	f	f	t		2024-02-24 02:16:30.316608	2024-02-24 02:16:30.316608	16	546	Female	Full Member	2024-03-06	\N
3401	Chris Candelora	f	f	t	t	f	f	f	t		2024-02-24 02:17:05.96782	2024-02-24 02:17:05.96782	16	546	Male	Full Member	2024-03-06	\N
3402	Chris Candelora	f	f	t	t	f	f	f	t	Ice bar- purple drank 	2024-02-24 02:17:48.996883	2024-02-24 02:17:48.996883	16	547	Male	Full Member	2024-03-20	\N
3403	Amy Candelora	f	f	t	t	f	f	f	t	Purple drank!!!!	2024-02-24 02:18:38.778018	2024-02-24 02:18:38.778018	16	547	Female	Full Member	2024-03-20	\N
3405	Vicki S	f	t	t	t	f	f	f	t	We are the Champions!	2024-02-25 14:59:51.332276	2024-02-25 14:59:51.332276	3	545	Female	Full Member	2024-02-28	\N
3406	John Dobermiller	f	t	t	t	f	f	f	t	Woo! Race!	2024-02-25 15:01:22.724276	2024-02-25 15:01:22.724276	3	545	Male	Full Member	2024-02-28	\N
3407	Dominik	f	f	t	t	f	f	f	t		2024-02-26 13:01:58.95611	2024-02-26 13:01:58.95611	267	545	Male	Full Member	2024-02-28	\N
3408	Mike Ryan	f	t	t	t	f	f	f	f		2024-02-26 21:03:18.35398	2024-02-26 21:03:18.35398	14	546	Male	Full Member	2024-03-06	\N
3409	Perry	f	t	t	t	t	f	f	t	Potentially for Thurs and Sunday night	2024-02-26 22:43:41.599141	2024-02-26 22:43:41.599141	153	545	Male	Full Member	2024-02-28	\N
3410	Matt s. 	f	f	t	t	f	f	f	f	Dinner ! 	2024-02-27 12:19:11.579274	2024-02-27 12:19:51.074394	328	546	Male	Full Member	2024-03-06	\N
3411	Alana	f	f	t	t	f	f	f	t	Race	2024-02-28 03:37:56.751295	2024-02-28 03:37:56.751295	23	545	Female	Full Member	2024-02-28	\N
3412	Michelle Comtois	f	f	t	t	f	f	f	t	Might not come up until Saturday morning 	2024-02-28 14:27:03.600855	2024-02-28 14:27:03.600855	5	546	Female	Full Member	2024-03-06	\N
3413	doug mayo	f	f	t	t	f	f	f	t	GetIntoIt	2024-02-28 15:49:48.27811	2024-02-28 15:49:48.27811	12	545	Male	Full Member	2024-02-28	\N
3414	megan mayo	f	f	t	t	f	f	f	t		2024-02-28 15:50:08.869722	2024-02-28 15:50:08.869722	12	545	Female	Full Member	2024-02-28	\N
3415	Tommy	f	f	t	t	f	f	f	t	Race/ bday	2024-02-28 19:49:34.527973	2024-02-28 19:49:34.527973	23	545	Male	Full Member	2024-02-28	\N
3416	Corey Blohm	f	f	t	t	f	f	f	f		2024-02-29 02:11:20.397334	2024-02-29 02:11:20.397334	142	546	Female	Full Member	2024-03-06	\N
3417	Andrew Blohm	f	f	t	t	f	f	f	f		2024-02-29 02:11:51.168106	2024-02-29 02:11:51.168106	142	546	Male	Full Member	2024-03-06	\N
3418	CJ Landsman	f	f	t	t	f	f	f	f	Corey’s dad.  He’s been to the club twice before.	2024-02-29 02:13:33.144492	2024-02-29 02:13:33.144492	142	546	Male	Guest	2024-03-06	\N
3419	Michelle Comtois	f	f	t	t	f	f	f	t		2024-02-29 02:21:01.701526	2024-02-29 02:21:01.701526	5	545	Female	Full Member	2024-02-28	\N
3420	N/a	f	f	f	f	f	f	f	t		2024-02-29 14:53:53.579086	2024-02-29 19:32:54.524484	267	545	Male	Guest	2024-02-28	\N
3421	Chris B.	f	f	t	t	f	f	f	f		2024-03-01 01:42:18.767987	2024-03-01 01:42:18.767987	15	546	Male	Full Member	2024-03-06	\N
3424	JD Martinez	f	f	t	t	f	f	f	t	Wig out!	2024-03-04 19:39:36.802027	2024-03-04 19:39:36.802027	260	546	Female	Full Member	2024-03-06	\N
3425	Nikki Shults	f	t	t	t	f	f	f	f	Maybe Thursday 	2024-03-04 20:48:07.102986	2024-03-04 20:48:07.102986	9	547	Female	Full Member	2024-03-20	\N
3426	Nikki Shults	f	f	t	f	f	f	f	t	Backpacking! 	2024-03-04 20:48:54.478283	2024-03-04 20:48:54.478283	9	548	Female	Full Member	2024-03-27	\N
3427	Alana	f	f	f	f	f	f	f	t	Party only- staying at my parents house so don’t need a bunk	2024-03-04 22:25:26.210184	2024-03-04 22:25:26.210184	23	546	Female	Full Member	2024-03-06	\N
3428	Perry	f	f	t	t	t	f	f	t		2024-03-05 00:06:51.108374	2024-03-05 00:06:51.108374	153	546	Male	Full Member	2024-03-06	\N
3429	Scott Rogers	f	f	t	t	f	f	f	f	First time guest, and friend of second-time guest Cindy.	2024-03-05 02:07:21.224956	2024-03-05 02:07:21.224956	20	546	Male	Guest	2024-03-06	\N
3430	Amanda Jacobs	f	f	t	t	f	f	f	f	Amanda also visited for First Aid. This is her second visit.	2024-03-05 02:22:47.655711	2024-03-05 02:22:47.655711	20	546	Female	Guest	2024-03-06	\N
3404	Jess P	f	f	t	t	f	f	f	f	Ice bar!  Beth's bed please.	2024-02-24 15:02:52.16816	2024-03-18 15:11:46.086784	137	547	Female	Associate Member	2024-03-20	\N
3422	Jenna Whitney 	f	f	f	t	f	f	f	f		2024-03-03 14:17:26.499433	2024-03-06 22:32:21.529731	338	546	Female	Full Member	2024-03-06	\N
3423	Ryan Braid	f	f	f	t	f	f	f	f		2024-03-03 14:18:13.404099	2024-03-06 22:32:22.714005	339	546	Male	Full Member	2024-03-06	\N
3557	Himi Raina	f	f	t	f	f	f	f	t	Guest of Jess P and knows Kristina, part of our metro-west social circle. Big hiker.  Sober.  	2024-04-23 00:49:38.504082	2024-04-23 01:18:46.6463	137	551	Male	Guest	2024-04-24	\N
3585	Sara Delaney	f	f	t	t	f	f	f	t	Work weekend	2024-06-13 16:36:36.992567	2024-06-13 16:36:36.992567	31	552	Female	Full Member	2024-06-26	\N
3587	John D	f	t	t	t	t	t	t	t	Work Weekend #1	2024-06-13 17:44:28.770125	2024-06-13 17:44:28.770125	2	556	Male	Full Member	2024-06-19	\N
3588	John D	t	t	t	t	f	f	f	t	Work Weekend 2. (I’ll be floating around the valley the week between work weekends.)	2024-06-13 17:47:50.490552	2024-06-13 17:47:50.490552	2	552	Male	Full Member	2024-06-26	\N
3589	Michelle Comtois	f	f	t	t	f	f	f	f		2024-06-14 18:21:34.811699	2024-06-14 18:21:34.811699	5	559	Female	Full Member	2024-07-17	\N
3594	Mike Ryan	f	t	t	t	f	f	f	t	WORK	2024-06-17 13:18:34.948107	2024-06-17 13:18:34.948107	14	556	Male	Full Member	2024-06-19	\N
3595	Nicholas Skovran	f	f	t	t	t	f	f	t	Work weekend	2024-06-17 14:28:12.976421	2024-06-17 14:28:12.976421	329	556	Male	Full Member	2024-06-19	\N
3596	Zach Bassett	f	f	t	t	f	f	f	t	Working on the weekend	2024-06-18 16:40:12.315001	2024-06-18 16:40:12.315001	326	556	Male	Full Member	2024-06-19	\N
3597	Vicki S	f	f	t	t	f	f	f	t	Work Weekend 	2024-06-19 00:11:40.686509	2024-06-19 00:11:40.686509	3	556	Female	Full Member	2024-06-19	\N
3558	Perry	f	f	t	t	f	f	f	t	Not sure	2024-04-23 18:52:45.072008	2024-04-23 18:52:45.072008	153	551	Male	Full Member	2024-04-24	\N
3434	Dominik	f	f	t	t	f	f	f	f		2024-03-05 15:36:46.102055	2024-03-05 15:36:46.102055	267	546	Male	Full Member	2024-03-06	\N
3435	Dan Shults	f	t	t	t	f	f	f	t	Drinking the purple kool aid. Thursday is a maybe.	2024-03-05 15:43:22.634037	2024-03-05 15:43:22.634037	20	547	Male	Full Member	2024-03-20	\N
3436	Brandon Juby	f	f	t	t	f	f	f	t	Guest of Dan.	2024-03-05 15:44:01.571808	2024-03-05 15:44:01.571808	20	547	Male	Guest	2024-03-20	\N
3437	TWall	f	f	t	t	f	f	f	f	Wig	2024-03-05 23:03:55.43945	2024-03-05 23:03:55.43945	21	546	Male	Full Member	2024-03-06	\N
3438	Sara Delaney	f	f	t	t	f	f	f	f		2024-03-06 11:23:40.677899	2024-03-06 11:23:40.677899	31	546	Female	Full Member	2024-03-06	\N
3440	Dane Araujo	f	t	t	t	t	f	f	f	Ice Bar Boi	2024-03-06 13:52:43.269154	2024-03-06 13:54:46.902411	154	547	Male	Full Member	2024-03-20	\N
3441	doug mayo	f	f	t	t	f	f	f	t	Think snow	2024-03-06 16:00:09.271208	2024-03-06 16:00:09.271208	12	546	Male	Full Member	2024-03-06	\N
3442	megan mayo	f	f	t	t	f	f	f	t	maybe Sunday night to skip school Monday too, GetIntoIt	2024-03-06 16:00:57.009464	2024-03-06 16:00:57.009464	12	546	Female	Full Member	2024-03-06	\N
3443	Lori Lavoie	f	t	t	t	f	f	f	f	Only maybe on Thurs night	2024-03-06 16:23:37.858754	2024-03-06 16:23:51.49777	44	546	Female	Associate Member	2024-03-06	\N
3444	Nicholas Skovran	f	f	t	t	t	f	f	t	Bringing one female guest for weekend	2024-03-06 17:34:33.434348	2024-03-06 17:34:33.434348	329	546	Male	Full Member	2024-03-06	\N
3445	Rachel Crateau	f	f	t	t	f	f	f	f		2024-03-06 22:59:55.371589	2024-03-06 22:59:55.371589	261	546	Female	Full Member	2024-03-06	\N
3446	Scott James	f	f	t	t	f	f	f	t		2024-03-06 23:00:22.869673	2024-03-06 23:00:22.869673	261	546	Male	Full Member	2024-03-06	\N
3450	Xin Ge	f	f	t	t	f	f	f	f	TENTATIVE. This is a rando who RSVP'd. They're not a subscriber and they're not a contact. It's possible the RSVP is just spam. I've reached out to arrange a phone call, but it it doesn't happen, they're not invited. -DS	2024-03-06 23:12:34.719422	2024-03-06 23:12:34.719422	20	546	Female	Guest	2024-03-06	\N
3451	Paul Korseniowski	f	f	t	t	f	f	f	f	Friend of first time BHSC visitor Scott Rogers. Scott has visited other EICSL clubs before, and he's a friend of recurring guest Cindy Bright. Still need to make contact with Paul and check him out. -DS	2024-03-06 23:18:02.187762	2024-03-06 23:21:53.368231	20	546	Male	Guest	2024-03-06	\N
3452	Alana	f	f	t	t	f	f	f	t	Ice Bar!	2024-03-06 23:27:17.050485	2024-03-06 23:27:17.050485	23	547	Female	Full Member	2024-03-20	\N
3486	Jess P	f	f	t	t	f	f	f	f	Tuck’s! Beth’s bed please. 	2024-03-27 17:00:01.665468	2024-04-22 23:02:34.485113	137	551	Female	Associate Member	2024-04-24	\N
3454	Tyler Buckeridge	f	f	f	t	f	f	f	f	Second visit, be sure to say hi! Dominik will sponsor	2024-03-07 01:18:52.523632	2024-03-07 01:18:52.523632	267	546	Male	Guest	2024-03-06	\N
3455	Nung	f	f	f	t	f	f	f	t		2024-03-07 05:01:11.286913	2024-03-07 05:01:11.286913	7	546	Male	Full Member	2024-03-06	\N
3456	Pop	f	f	f	t	f	f	f	t	Masters please	2024-03-07 05:02:23.52605	2024-03-07 05:02:23.52605	7	546	Female	Guest	2024-03-06	\N
3457	Matt s 	f	f	t	t	f	f	f	t	Ice bar !!! Wooooo 	2024-03-07 13:09:23.107638	2024-03-07 13:09:23.107638	328	547	Male	Full Member	2024-03-20	\N
3458	JT Shepple	f	f	t	t	f	f	f	t	Ice Bar. Please hold a bus seat. 	2024-03-07 15:02:55.639222	2024-03-07 15:02:55.639222	2	547	Male	Guest	2024-03-20	\N
3459	August Orlow	f	f	t	t	f	f	f	t	Ice Bar guest. Please hold a bus seat. 	2024-03-07 15:04:07.461753	2024-03-07 15:04:07.461753	2	547	Male	Guest	2024-03-20	\N
3460	John D	f	t	t	t	t	f	f	t	Ice Bah!!!!	2024-03-07 15:07:59.095856	2024-03-07 15:07:59.095856	2	547	Male	Full Member	2024-03-20	\N
3475	Aaron Uehara	f	f	t	t	f	f	f	f	Guest. He and his wife have gotten a tour and seem like a great fit for our club. Be sure to say hi! Dominik will sponsor.	2024-03-20 14:06:10.040116	2024-03-20 14:06:10.040116	267	547	Male	Guest	2024-03-20	\N
3559	Ryan B	f	f	t	t	f	f	f	t	planning on tailgating	2024-04-23 19:15:21.189787	2024-04-23 19:15:21.189787	339	551	Male	Full Member	2024-04-24	\N
3462	Nung	f	f	f	t	f	f	f	t		2024-03-11 19:05:00.912962	2024-03-11 19:05:00.912962	7	547	Male	Full Member	2024-03-20	\N
3463	Pop	f	f	f	t	f	f	f	t	If available, Masters please. 	2024-03-11 19:06:31.464693	2024-03-11 19:06:31.464693	7	547	Female	Guest	2024-03-20	\N
3464	Perry	f	t	t	t	t	f	f	t		2024-03-11 22:53:19.083203	2024-03-11 22:53:19.083203	153	547	Male	Full Member	2024-03-20	\N
3465	JD Martinez	f	f	t	t	f	f	f	f	Ice bar!	2024-03-12 14:55:49.58155	2024-03-12 14:55:49.58155	260	547	Female	Full Member	2024-03-20	\N
3466	Dominik	f	f	t	t	f	f	f	t	J bar @Black!	2024-03-13 02:02:12.471134	2024-03-13 02:02:12.471134	267	549	Male	Full Member	2024-03-13	\N
3467	Tommy	f	t	t	t	f	f	f	t	Ice bar! (Maybe Thursday)	2024-03-13 10:48:41.369506	2024-03-13 10:48:41.369506	23	547	Male	Full Member	2024-03-20	\N
3468	doug mayo	f	f	t	t	f	f	f	t		2024-03-13 11:02:59.169632	2024-03-13 11:02:59.169632	12	549	Male	Full Member	2024-03-13	\N
3469	megan mayo	f	f	t	t	f	f	f	t		2024-03-13 11:03:31.663458	2024-03-13 11:03:31.663458	12	549	Female	Full Member	2024-03-13	\N
3470	Jess P	f	f	f	t	f	f	f	t	Coming from Maine. Cannon on Sunday. 	2024-03-13 12:06:37.097746	2024-03-13 12:06:37.097746	137	549	Female	Associate Member	2024-03-13	\N
3447	Rachel Crateau	f	t	t	t	f	f	f	f		2024-03-06 23:02:25.758333	2024-03-15 16:38:21.811766	261	547	Female	Full Member	2024-03-20	\N
3448	Scott James	f	t	t	t	f	f	f	f		2024-03-06 23:02:53.376974	2024-03-15 16:38:38.151691	261	547	Male	Full Member	2024-03-20	\N
3449	Adam Crateau	f	f	t	t	f	f	f	f	Guest of Rachel & Scott tentative	2024-03-06 23:03:53.220625	2024-03-15 16:38:51.477228	261	547	Male	Guest	2024-03-20	\N
3439	Nancy Murphy	f	f	t	f	f	f	f	t		2024-03-06 12:43:25.071776	2024-03-15 21:09:20.303487	51	547	Female	Full Member	2024-03-20	\N
3471	Marc Schwanbeck	f	f	t	t	f	f	f	t	Guest of Dane, returning guest to the house because so much fun last time	2024-03-17 17:13:52.351803	2024-03-17 17:14:05.844602	154	547	Male	Guest	2024-03-20	\N
3473	Dominik	f	t	t	t	f	f	f	f	ETA: Thursday night/Friday early afternoon	2024-03-19 17:53:29.494713	2024-03-19 17:53:29.494713	267	547	Male	Full Member	2024-03-20	\N
3474	B. Halpin	f	f	t	t	f	f	f	f		2024-03-19 19:39:52.089357	2024-03-19 19:39:52.089357	14	547	Male	Guest	2024-03-20	\N
3432	Vicki Santarcangelo 	f	t	t	t	f	f	f	f	Purple drank!	2024-03-05 14:39:05.46388	2024-03-20 14:54:28.234793	3	547	Female	Full Member	2024-03-20	\N
3476	Robbie O'Loughlin	f	t	f	f	f	f	f	t	Guest of Dane - Only staying on Thursday night / Hiking on Friday 	2024-03-20 16:56:14.49832	2024-03-20 16:56:14.49832	154	547	Male	Guest	2024-03-20	\N
3477	Jon Macomber	f	f	f	f	f	t	t	t		2024-03-23 19:02:59.117256	2024-03-23 19:02:59.117256	340	548	Male	Full Member	2024-03-27	\N
3478	Vicki S	f	t	t	t	f	f	f	t		2024-03-24 22:56:02.529195	2024-03-24 22:56:02.529195	3	548	Female	Full Member	2024-03-27	\N
3479	Dan Shults	f	f	t	t	f	f	f	t		2024-03-25 20:17:40.193136	2024-03-25 20:17:40.193136	20	548	Male	Full Member	2024-03-27	\N
3480	Dan Shults	f	f	t	t	f	f	f	t		2024-03-25 20:19:01.304887	2024-03-25 20:19:01.304887	20	550	Male	Full Member	2024-04-10	\N
3481	Dan Shults	f	f	t	t	f	f	f	t	Tux!	2024-03-25 20:19:54.133764	2024-03-25 20:19:54.133764	20	551	Male	Full Member	2024-04-24	\N
3482	doug mayo	f	f	t	t	f	f	f	t		2024-03-26 15:09:34.308197	2024-03-26 15:09:34.308197	12	548	Male	Full Member	2024-03-27	\N
3483	megan mayo	f	f	t	t	f	f	f	t		2024-03-26 15:09:51.585849	2024-03-26 15:09:51.585849	12	548	Female	Full Member	2024-03-27	\N
3484	Nancy Murphy	f	f	t	t	f	f	f	t	Work weekend	2024-03-26 15:19:52.376713	2024-03-26 15:19:52.376713	51	552	Female	Full Member	2024-06-26	\N
3485	John D	f	t	t	t	t	f	f	t	I will probably be up and around all of Easter week. I am still trying to get in a trip to Sunday River which did not succeed last attempt.	2024-03-26 17:51:16.360356	2024-03-26 17:52:09.075263	2	548	Male	Full Member	2024-03-27	\N
3489	Andrew Blohm	f	f	f	t	t	f	f	t	Eclipse!	2024-03-31 23:40:30.471033	2024-03-31 23:40:30.471033	142	554	Male	Full Member	2024-04-03	\N
3490	Corey Blohm	f	f	f	t	t	f	f	t	Eclipse!	2024-03-31 23:40:57.8166	2024-03-31 23:40:57.8166	142	554	Female	Full Member	2024-04-03	\N
3491	Vicki S	f	f	t	t	t	f	f	t	Mostly total eclipse of the heart	2024-04-01 13:35:03.792111	2024-04-01 13:35:03.792111	3	554	Female	Full Member	2024-04-03	\N
3493	Jess P	f	f	t	f	f	f	f	t	Wildcat on Saturday. Sunday River on Sunday.  Staying near Sunday River on Saturday. 	2024-04-01 15:51:26.936248	2024-04-01 15:51:26.936248	137	554	Female	Associate Member	2024-04-03	\N
3492	Perry F	t	t	t	f	f	f	f	t	Maybe Tuesday night also 	2024-04-01 15:31:49.943905	2024-04-02 14:15:35.126823	153	554	Male	Full Member	2024-04-03	\N
3496	Dafni Frohman	f	f	f	f	t	t	f	t	Guest of Bryan K	2024-04-01 16:33:20.080185	2024-04-01 16:33:20.080185	219	554	Female	Guest	2024-04-03	\N
3560	Lori Lavoie	f	f	t	t	f	f	f	t	Very loose maybe. May drive up very late Friday(1am) or early Sat… or may bail on the whole plan.	2024-04-24 12:26:46.250769	2024-04-24 12:26:46.250769	44	551	Female	Associate Member	2024-04-24	\N
3495	Bryan Kirk	t	t	t	t	t	t	f	t	TOTALITY!! AND POW	2024-04-01 16:32:19.252798	2024-04-01 18:47:16.968822	219	554	Male	Full Member	2024-04-03	\N
3497	Keith Metayer	f	f	f	f	t	f	f	t	Guest of Andrew and Corey for eclipse shenanigans 	2024-04-02 01:21:43.865587	2024-04-02 01:21:43.865587	142	554	Male	Guest	2024-04-03	\N
3498	Dan Shults	t	t	f	f	f	f	f	t	Screw it; let's do this.	2024-04-02 18:23:56.21079	2024-04-02 18:23:56.21079	20	554	Male	Full Member	2024-04-03	\N
3499	John D	f	t	t	t	t	f	f	t	Another storm. Oh fun! Oh, and an eclipse!\r\n	2024-04-02 22:59:23.344637	2024-04-02 22:59:23.344637	2	554	Male	Full Member	2024-04-03	\N
3500	Aaron Uehara	f	f	t	t	f	f	f	t	Returning guest	2024-04-03 06:12:41.176701	2024-04-03 06:12:41.176701	2	554	Male	Guest	2024-04-03	\N
3501	Aaron’s wife	f	f	t	t	f	f	f	t	Will edit when more info is available. 	2024-04-03 06:13:54.726424	2024-04-03 06:13:54.726424	2	554	Female	Guest	2024-04-03	\N
3502	doug mayo	f	f	f	t	f	f	f	t	maybe, hope to make a few more turns	2024-04-03 13:20:55.800475	2024-04-03 13:20:55.800475	12	554	Male	Full Member	2024-04-03	\N
3494	Kristina Johnson	f	f	t	f	f	f	f	t	Guest of Jess P	2024-04-01 15:52:04.58708	2024-04-03 16:45:54.697327	137	554	Female	Guest	2024-04-03	\N
3503	Matt	t	t	t	t	f	f	f	t	Snow storm !! 	2024-04-03 20:19:03.665364	2024-04-03 20:19:03.665364	328	554	Male	Full Member	2024-04-03	\N
3505	Michelle Comtois	f	f	t	t	f	f	f	t		2024-04-05 12:51:04.86546	2024-04-05 12:51:04.86546	5	551	Female	Full Member	2024-04-24	\N
3506	Vicki S	f	f	t	t	f	f	f	t	Race banquet 	2024-04-06 12:21:42.472113	2024-04-06 12:21:42.472113	3	550	Female	Full Member	2024-04-10	\N
3507	Nikki Shults	f	f	t	t	f	f	f	t		2024-04-06 12:24:43.13868	2024-04-06 12:24:43.13868	9	551	Female	Full Member	2024-04-24	\N
3631	Jenna 	f	f	t	t	f	f	f	t	Friday TBD. 	2024-07-17 01:41:48.40485	2024-07-17 01:41:48.40485	339	559	Female	Full Member	2024-07-17	\N
3488	Jess P	f	f	f	t	f	f	f	t	Maybe for race banquet, M&M, Wildcat on Sunday 	2024-03-31 15:33:01.823132	2024-04-07 22:33:08.682802	137	550	Female	Associate Member	2024-04-10	\N
3590	Perry	f	f	t	t	f	f	f	t	Work weekend 	2024-06-15 15:39:13.109648	2024-06-15 15:39:13.109648	153	556	Male	Full Member	2024-06-19	\N
3629	Ryan B	f	f	t	t	f	f	f	t	Not sure about Friday. 	2024-07-17 01:39:28.370476	2024-07-17 01:42:38.174001	339	559	Male	Full Member	2024-07-17	\N
3592	Ryan	f	f	t	t	f	f	f	t	Work weekend!	2024-06-15 16:00:43.316828	2024-06-15 16:00:43.316828	339	552	Male	Full Member	2024-06-26	\N
3593	Jenna	f	f	t	t	f	f	f	t		2024-06-15 16:02:45.932177	2024-06-15 16:02:45.932177	338	552	Female	Full Member	2024-06-26	\N
3598	Alana	f	f	t	t	f	f	f	t	WW	2024-06-19 21:14:51.636673	2024-06-19 21:14:51.636673	23	556	Female	Full Member	2024-06-19	\N
3599	Tommy W	f	f	t	t	f	f	f	t	Work	2024-06-19 21:15:25.514686	2024-06-19 21:15:25.514686	23	556	Male	Full Member	2024-06-19	\N
3601	Nikki Shults	f	t	f	f	f	f	f	t	Backpacking fri-sun	2024-06-23 18:01:35.171525	2024-06-23 18:01:35.171525	9	563	Female	Full Member	2024-07-03	\N
3602	Nikki Shults	f	f	t	t	f	f	f	f	Tubing 	2024-06-23 18:02:01.801445	2024-06-23 18:02:01.801445	9	559	Female	Full Member	2024-07-17	\N
3603	Nikki Shults	f	f	t	t	f	f	f	t	Summerfest	2024-06-23 18:02:24.814381	2024-06-23 18:02:24.814381	9	564	Female	Full Member	2024-08-21	\N
3604	Vicki S	f	f	t	t	f	f	f	t		2024-06-26 15:21:45.488799	2024-06-26 15:21:45.488799	3	552	Female	Full Member	2024-06-26	\N
3606	Michelle Comtois	f	f	t	t	f	f	f	t		2024-06-27 13:19:23.742199	2024-06-27 13:19:23.742199	5	562	Female	Full Member	2024-07-10	\N
3607	Jess P	f	f	t	t	f	f	f	t		2024-06-27 15:20:51.215021	2024-06-27 15:20:51.215021	137	562	Female	Associate Member	2024-07-10	\N
3608	Dan Shults	f	f	t	t	f	f	f	f	Tubin' time.	2024-06-27 15:59:26.644153	2024-06-27 15:59:26.644153	20	559	Male	Full Member	2024-07-17	\N
3609	Alana 	f	t	t	t	f	f	f	t	4th long weekend. Not sure for Thursday night yet	2024-06-28 18:49:57.303589	2024-06-28 18:49:57.303589	23	563	Female	Full Member	2024-07-03	\N
3610	Tommy	f	t	t	t	f	f	f	t		2024-06-28 18:50:31.200563	2024-06-28 18:50:31.200563	23	563	Male	Full Member	2024-07-03	\N
3611	Michelle Comtois	f	f	t	t	f	f	f	t		2024-06-29 11:03:17.007774	2024-06-29 11:03:17.007774	5	563	Female	Full Member	2024-07-03	\N
3612	Jenna Whitney 	f	f	t	t	f	f	f	t	Maybe just Fri	2024-06-29 22:38:30.720083	2024-06-29 22:38:30.720083	338	565	Female	Full Member	2024-08-14	\N
3615	Jenna Whitney 	f	f	t	f	f	f	f	t		2024-07-01 19:01:11.26026	2024-07-01 19:01:11.26026	338	563	Female	Full Member	2024-07-03	\N
3616	Ryan Braid	f	f	t	f	f	f	f	t		2024-07-01 19:01:32.678515	2024-07-01 19:01:32.678515	338	563	Male	Full Member	2024-07-03	\N
3617	Ryan Braid	f	f	t	t	f	f	f	t		2024-07-01 19:02:21.54438	2024-07-01 19:02:21.54438	338	565	Male	Full Member	2024-08-14	\N
3618	Perry 	t	t	t	t	f	f	f	t	Probably not, not sure which day if I do come up 	2024-07-01 21:05:49.038496	2024-07-01 21:05:49.038496	153	563	Male	Full Member	2024-07-03	\N
3619	Yasmine K	t	t	t	t	f	f	f	t	Guest of Perry - probably not 	2024-07-01 21:06:21.106978	2024-07-01 21:06:21.106978	153	563	Female	Guest	2024-07-03	\N
3712	Alana M	f	f	t	t	f	f	f	t	Girls weekend!	2024-08-26 14:28:51.53477	2024-08-26 14:28:51.53477	23	561	Female	Full Member	2024-09-25	\N
3620	Perry	f	f	t	t	f	f	f	t	If the weather is decent, probably fly fishing instead of tubing 	2024-07-04 16:27:49.630891	2024-07-04 16:27:49.630891	153	559	Male	Guest	2024-07-17	\N
3621	Yasmine K	f	f	t	t	f	f	f	t	Guest of Perry - If the weather is decent, probably fly fishing instead of tubing	2024-07-04 16:28:24.060143	2024-07-04 16:28:24.060143	153	559	Female	Guest	2024-07-17	\N
3614	Nancy Murphy	f	f	t	t	f	f	f	f	Staying on dry land, but happy to see people 	2024-06-30 20:06:24.94954	2024-07-06 15:21:56.92249	51	559	Female	Full Member	2024-07-17	\N
3622	Perry	f	f	t	t	f	f	f	t	MayB 	2024-07-09 02:17:34.839382	2024-07-09 02:17:34.839382	153	562	Male	Full Member	2024-07-10	\N
3623	Yasmine 	f	f	t	t	f	f	f	t	Guest of Perry - mayb 	2024-07-09 02:18:06.198608	2024-07-09 02:18:06.198608	153	562	Female	Guest	2024-07-10	\N
3624	Doug Mayo	f	f	f	t	t	f	f	t	Might be up for a concert	2024-07-10 13:30:29.34399	2024-07-10 13:30:29.34399	12	562	Male	Full Member	2024-07-10	\N
3625	Megan mayo	f	f	f	t	t	f	f	t	Maybe up for a concert	2024-07-10 13:31:05.252394	2024-07-10 13:31:05.252394	12	562	Female	Full Member	2024-07-10	\N
3626	Amanda Jacobs	f	f	t	t	f	f	f	f	I'm going to venmo my dues for the Saco trip with my guests (Marlena)	2024-07-10 15:23:18.301281	2024-07-10 15:23:28.116968	352	559	Female	Full Member	2024-07-17	\N
3627	Marlena Maglieri	f	f	t	t	f	f	f	f	Coming with Amanda	2024-07-10 15:31:24.129412	2024-07-10 15:31:24.129412	352	559	Female	Guest	2024-07-17	\N
3628	Dominik	f	f	t	t	f	f	f	f		2024-07-16 00:24:24.786363	2024-07-16 00:24:59.950456	267	559	Male	Full Member	2024-07-17	\N
3630	Ryan B	f	f	t	t	f	f	f	t		2024-07-17 01:40:28.167422	2024-07-17 01:40:28.167422	339	565	Male	Full Member	2024-08-14	\N
3632	Dan Shults	f	f	t	t	f	f	f	t	S u m m e r f e s t	2024-07-22 15:18:57.461036	2024-07-22 15:18:57.461036	20	564	Male	Full Member	2024-08-21	\N
3634	John D	f	t	t	t	t	f	f	t		2024-07-30 15:04:40.129466	2024-07-30 15:04:40.129466	2	564	Male	Full Member	2024-08-21	\N
3635	John D	f	t	t	t	t	f	f	t	Fire Alarm Inspection 	2024-07-31 10:03:59.87163	2024-07-31 10:03:59.87163	2	567	Male	Full Member	2024-07-31	\N
3636	Michelle Comtois	f	f	t	t	f	f	f	t	Maybe not Friday night 	2024-08-06 13:43:55.655145	2024-08-06 13:43:55.655145	5	564	Female	Full Member	2024-08-21	\N
3638	Matt 	f	f	t	t	f	f	f	t		2024-08-06 18:49:14.453377	2024-08-06 18:49:14.453377	328	564	Male	Full Member	2024-08-21	\N
3639	Mike Ryan	f	f	t	t	f	f	f	f		2024-08-06 19:03:04.498016	2024-08-06 19:03:04.498016	14	564	Male	Full Member	2024-08-21	\N
3640	B. Halpin	f	f	t	t	f	f	f	t		2024-08-06 19:03:24.149603	2024-08-06 19:03:24.149603	14	564	Male	Guest	2024-08-21	\N
3641	Chris B	f	f	t	t	f	f	f	f	SUMMERFEST!!!	2024-08-06 19:13:29.612969	2024-08-06 19:13:29.612969	15	564	Male	Full Member	2024-08-21	\N
3642	Ron Swanick	f	f	t	t	f	f	f	f	Guest of Chris B - Please put in Masters if Nung’s Bunk is open. 	2024-08-06 19:15:05.842097	2024-08-06 19:15:05.842097	15	564	Male	Guest	2024-08-21	\N
3644	Ryan and Jenna	f	f	t	t	f	f	f	t		2024-08-09 00:32:15.733804	2024-08-09 00:32:15.733804	339	564	Male	Full Member	2024-08-21	\N
3643	Alana	f	f	t	t	f	f	f	f	Might be Saturday only	2024-08-08 00:53:33.821626	2024-08-20 16:55:40.961194	23	564	Female	Full Member	2024-08-21	\N
3586	Jess P	f	f	t	t	f	f	f	t	girls weekend. beth's bed please. 	2024-06-13 16:53:41.412484	2024-09-23 18:31:38.733723	137	561	Female	Associate Member	2024-09-25	\N
3645	Nancy Murphy	f	f	t	t	f	f	f	t		2024-08-09 01:16:13.624882	2024-08-09 01:16:13.624882	51	564	Female	Full Member	2024-08-21	\N
3646	Santiago	f	f	f	t	f	f	f	t	band	2024-08-12 16:38:06.342917	2024-08-12 16:38:06.342917	9	564	Male	Guest	2024-08-21	\N
3647	Liz	f	f	f	t	f	f	f	t	band	2024-08-12 16:38:24.663416	2024-08-12 16:38:24.663416	9	564	Female	Guest	2024-08-21	\N
3648	Lee Pelletier	f	f	t	t	f	f	f	f	Friend of N&D. All-gender room with Eileen Chow.	2024-08-12 17:40:58.073013	2024-08-12 17:40:58.073013	20	564	Male	Guest	2024-08-21	\N
3649	Eileen Chow	f	f	t	t	f	f	f	f	Friend of N&D. All-gender room with Lee Pelletier.	2024-08-12 17:41:24.454081	2024-08-12 17:41:24.454081	20	564	Female	Guest	2024-08-21	\N
3650	Chas Luca	f	f	f	f	f	f	f	f	PARTY ONLY: Does not need a bunk. Chas is a Skidad. 	2024-08-12 18:04:45.44989	2024-08-12 18:04:45.44989	20	564	Male	Guest	2024-08-21	\N
3651	Thushanth "Ben" Bengre	f	f	t	t	f	f	f	f	Perennial guest and former volleyballer. Usually eats vegetarian. 	2024-08-12 18:09:19.756835	2024-08-12 18:09:19.756835	20	564	Male	Guest	2024-08-21	\N
3652	Brian Anderson	f	f	f	f	f	f	f	f	PARTY ONLY. Tentative. Friend of Dan.	2024-08-13 17:33:16.094397	2024-08-13 17:33:16.094397	20	564	Male	Guest	2024-08-21	\N
3653	Cathy (Anderson)	f	f	f	f	f	f	f	f	PARTY ONLY. Tentative. Friend of Dan.	2024-08-13 17:33:47.370846	2024-08-13 17:33:47.370846	20	564	Female	Guest	2024-08-21	\N
3654	Perry	f	f	t	t	f	f	f	t	Most likely 	2024-08-13 21:54:51.557632	2024-08-13 21:54:51.557632	153	564	Male	Full Member	2024-08-21	\N
3656	James S	f	f	t	t	f	f	f	t	Guest of Perry (maybe) 	2024-08-13 21:55:42.475081	2024-08-13 21:55:42.475081	153	564	Male	Guest	2024-08-21	\N
3655	Yasmine k	f	f	t	t	f	f	f	t	Guest of Perry - maybe	2024-08-13 21:55:13.668199	2024-08-13 21:56:00.033325	153	564	Female	Guest	2024-08-21	\N
3657	Rachel Crateau	f	t	t	t	f	f	f	f	 Most likely late Thursday PM	2024-08-13 22:10:56.154298	2024-08-13 22:10:56.154298	261	564	Female	Full Member	2024-08-21	\N
3658	Scott James	f	t	t	t	f	f	f	f	Most likely late Thursday PM	2024-08-13 22:11:53.66917	2024-08-13 22:11:53.66917	261	564	Male	Full Member	2024-08-21	\N
3659	K Buck	f	f	t	t	f	f	f	t		2024-08-14 02:35:15.939021	2024-08-14 02:35:15.939021	51	564	Male	Associate Member	2024-08-21	\N
3660	Mirian Barrientos	f	f	t	t	f	f	f	t		2024-08-14 02:36:11.034001	2024-08-14 02:36:11.034001	51	564	Female	Associate Member	2024-08-21	\N
3661	Stephenie Hisman-Hou	f	f	t	t	f	f	f	f	Friend of Nikki and Dan	2024-08-14 12:50:48.403812	2024-08-14 12:50:48.403812	20	564	Female	Guest	2024-08-21	\N
3662	Nicholas Skovran	f	f	t	t	t	f	f	f	Bringing female guest (Isabel Rauch) participating in summerfest	2024-08-14 15:03:08.683099	2024-08-14 15:03:08.683099	329	564	Male	Full Member	2024-08-21	\N
3663	Karl Meissner	f	f	f	t	f	f	f	f	Saturday night only. Karl is a late-breaking volleyball player. Nice guy. Seemed interested in the club! -DS	2024-08-14 16:10:51.159894	2024-08-14 16:10:51.159894	20	564	Male	Guest	2024-08-21	\N
3664	Amanda Jacobs	f	t	f	f	f	f	f	t	No trash, food or shower. Just sleeping before Isolation Friday	2024-08-14 19:53:20.749567	2024-08-14 19:53:20.749567	352	565	Female	Full Member	2024-08-14	\N
3665	Isabel Rauch	f	f	t	t	t	f	f	t	Guest of Nick Skovran	2024-08-15 03:50:40.274352	2024-08-15 03:50:40.274352	329	564	Female	Guest	2024-08-21	\N
3698	Eszter Polecsak	f	f	f	t	f	f	f	t	Jenna's friend, please assign a bed in Tyrol if available. Sat night & Summerfest.	2024-08-16 12:49:24.958583	2024-08-16 12:49:24.958583	366	564	Female	Guest	2024-08-21	\N
3700	Anne Marie Tierney	f	f	f	f	f	f	f	f	PARTY ONLY. Anne Marie is a Ski Dad. Night-par-ty Anne-Ma-rie.	2024-08-16 19:24:27.472039	2024-08-16 19:24:27.472039	20	564	Female	Guest	2024-08-21	\N
3701	Rick Bleakney	f	f	f	f	f	f	f	f	PARTY ONLY. Rick is a Blitzschnell.	2024-08-16 19:25:16.987391	2024-08-16 19:25:16.987391	20	564	Male	Guest	2024-08-21	\N
3699	Gauri Oza	f	f	t	t	f	f	f	f	VEGETARIAN - Ben's GF. Has visited before, iirc. -DS	2024-08-16 19:21:33.4387	2024-08-16 19:41:35.740917	20	564	Female	Guest	2024-08-21	\N
3702	Jim Ryan	f	f	f	f	f	f	f	f	PARTY ONLY.  Ace member.	2024-08-18 13:12:19.450216	2024-08-18 13:12:19.450216	20	564	Male	Guest	2024-08-21	\N
3703	Sara Delaney	f	f	f	t	f	f	f	f	Summerfest! Sat night only	2024-08-18 19:38:10.215776	2024-08-18 19:38:10.215776	31	564	Female	Full Member	2024-08-21	\N
3704	Karen Ryan	f	f	f	f	f	f	f	f	PARTY ONLY. ACE member.	2024-08-19 15:49:40.30306	2024-08-19 15:49:40.30306	20	564	Female	Guest	2024-08-21	\N
3705	Tina Dwan	f	f	f	f	f	f	f	f	PARTY ONLY. Blitzschnell member.	2024-08-19 15:51:13.177138	2024-08-19 15:51:13.177138	20	564	Female	Guest	2024-08-21	\N
3706	Deb Della Selva	f	f	f	f	f	f	f	f	PARTY ONLY. ACE member.	2024-08-19 15:52:27.69944	2024-08-19 15:52:27.69944	20	564	Female	Guest	2024-08-21	\N
3707	Michael Griggs	f	f	f	f	f	f	f	f	PARTY ONLY. ACE member.	2024-08-19 15:53:26.316783	2024-08-19 15:53:26.316783	20	564	Male	Guest	2024-08-21	\N
3708	Vicki Santarcangelo 	f	f	t	t	f	f	f	f	Summerfest!	2024-08-20 01:39:22.648217	2024-08-20 01:39:22.648217	3	564	Female	Full Member	2024-08-21	\N
3709	JD Martinez	f	f	t	t	f	f	f	t	Summer fest!	2024-08-20 16:34:08.814297	2024-08-20 16:34:08.814297	260	564	Female	Full Member	2024-08-21	\N
3710	Alex Nathan (party musician)	f	f	f	t	f	f	f	t		2024-08-21 21:00:08.675394	2024-08-21 21:00:08.675394	366	564	Male	Guest	2024-08-21	\N
3711	Kristin Stobo	f	f	f	t	f	f	f	t	Jenna's friend - coming to Summerfest & staying over Sat night	2024-08-22 00:13:00.654597	2024-08-22 00:13:00.654597	366	564	Female	Guest	2024-08-21	\N
3713	Mike Ryan	f	f	t	t	f	f	f	t	Cabin Clean Out :(	2024-09-03 21:36:47.532014	2024-09-03 21:36:47.532014	14	568	Male	Full Member	2024-09-04	\N
3714	John	f	f	t	t	f	f	f	t		2024-09-03 21:50:46.264574	2024-09-03 21:50:46.264574	2	568	Male	Full Member	2024-09-04	\N
3715	Michelle Comtois	f	f	t	t	f	f	f	t		2024-09-09 17:38:50.932702	2024-09-09 17:38:50.932702	5	561	Female	Full Member	2024-09-25	\N
3716	Nancy Murphy	f	f	t	t	f	f	f	t	Ladies Weekend	2024-09-09 18:34:10.223522	2024-09-09 18:34:10.223522	51	561	Female	Full Member	2024-09-25	\N
3717	Vicki S	f	f	t	t	f	f	f	t	Girls weekend	2024-09-13 13:55:04.690592	2024-09-13 13:55:04.690592	3	561	Female	Full Member	2024-09-25	\N
3718	JD Martinez	f	f	t	t	f	f	f	t	Girls weekend	2024-09-16 13:13:02.006324	2024-09-16 13:13:02.006324	260	561	Female	Full Member	2024-09-25	\N
3719	Sara Delaney	f	f	t	t	f	f	f	f	Ladies weekend!	2024-09-17 17:50:15.628076	2024-09-17 17:50:15.628076	31	561	Female	Full Member	2024-09-25	\N
3720	Shana Biletch	f	f	t	t	f	f	f	t	Girls’ Weekend! 	2024-09-17 22:49:59.779387	2024-09-17 22:49:59.779387	57	561	Female	Associate Member	2024-09-25	\N
3721	Amy Candelora	f	f	t	t	f	f	f	t	GIRLS WEEKEND!!!!!!	2024-09-20 14:03:19.224231	2024-09-20 14:03:19.224231	16	561	Female	Full Member	2024-09-25	\N
3722	Katie Heimbach 	f	f	t	t	f	f	f	t	Shana’s friend 	2024-09-22 23:50:05.298982	2024-09-22 23:50:05.298982	57	561	Female	Guest	2024-09-25	\N
3723	John D	t	t	t	t	t	f	f	t	Probably going to be floating around the valley and will be in and out. 	2024-09-30 19:06:50.224448	2024-09-30 19:06:50.224448	2	569	Male	Full Member	2024-10-02	\N
3724	Rachel Crateau	f	f	t	t	f	f	f	t	Probably Friday, definitely Saturday	2024-10-02 10:32:37.587403	2024-10-02 10:32:37.587403	261	569	Female	Full Member	2024-10-02	\N
3725	Scott James	f	f	t	t	f	f	f	t	Probably Friday, definitely Saturday	2024-10-02 10:33:36.378658	2024-10-02 10:33:36.378658	261	569	Male	Full Member	2024-10-02	\N
3726	Nancy Murphy	f	f	t	t	f	f	f	t	Work weekend	2024-10-07 12:48:29.090188	2024-10-07 12:48:29.090188	51	570	Female	Full Member	2024-10-23	\N
3727	Dan Shults	f	f	t	t	f	f	f	t	Twerk Weekend	2024-10-09 15:15:55.184245	2024-10-09 15:15:55.184245	20	571	Male	Full Member	2024-10-30	\N
3728	Dominik	f	f	t	t	f	f	f	t	Work weekend	2024-10-09 15:48:12.814589	2024-10-09 15:48:12.814589	267	570	Male	Full Member	2024-10-23	\N
3729	Mike Ryan	f	f	f	t	f	f	f	t	Maybe staying up, post house searching.	2024-10-09 21:59:45.613223	2024-10-09 21:59:45.613223	14	572	Male	Full Member	2024-10-09	\N
3730	Amanda Jacobs	f	f	t	t	f	f	f	t	Work Weekend	2024-10-10 13:28:11.249861	2024-10-10 13:28:11.249861	352	570	Female	Full Member	2024-10-23	\N
3731	Chris B	f	f	t	t	f	f	f	t	Work Weekend!!!	2024-10-10 14:12:36.216907	2024-10-10 14:12:36.216907	15	571	Male	Full Member	2024-10-30	\N
3734	Perry	f	f	t	t	f	f	f	t		2024-10-15 20:18:45.292935	2024-10-15 20:18:45.292935	153	571	Male	Full Member	2024-10-30	\N
3735	Jenna Whitney 	f	f	t	t	f	f	f	t	work weekend	2024-10-20 21:09:22.524005	2024-10-20 21:09:22.524005	366	571	Female	Full Member	2024-10-30	\N
3736	Matt S	f	f	t	f	f	f	f	t	Possibly trailering up some bunks Friday and helping out sat day.    	2024-10-20 22:43:48.114275	2024-10-20 22:43:48.114275	328	571	Male	Full Member	2024-10-30	\N
3737	Zach B	f	f	t	t	f	f	f	t	working	2024-10-20 22:51:44.132927	2024-10-20 22:51:44.132927	326	571	Male	Full Member	2024-10-30	\N
3738	John D	f	t	t	t	t	f	f	t	I should be up for both WWs but will not know for sure till the Wed or Thurs before. I’ll update on Slack. 	2024-10-21 12:10:16.931351	2024-10-21 12:10:16.931351	2	570	Male	Full Member	2024-10-23	\N
3739	Ryan B	f	f	t	t	f	f	f	t	Work Weekend	2024-10-21 12:48:49.75208	2024-10-21 12:48:49.75208	339	571	Male	Full Member	2024-10-30	\N
3740	Mike Ryan	f	t	t	t	f	f	f	t	Work Weekend; Thursday is a maybe	2024-10-21 16:14:09.175192	2024-10-21 16:14:09.175192	14	571	Male	Full Member	2024-10-30	\N
3742	Pop	f	f	f	t	f	f	f	t	Work weekend helper	2024-10-22 01:36:52.951264	2024-10-22 01:36:52.951264	7	570	Female	Guest	2024-10-23	\N
3741	Nung	f	f	f	t	f	f	f	t	Work weekend	2024-10-22 01:34:49.666423	2024-10-22 01:37:15.273214	7	570	Male	Full Member	2024-10-23	\N
3744	Sara Delaney	f	f	t	t	t	f	f	f	Work weekend	2024-10-23 00:20:23.013233	2024-10-23 00:20:23.013233	31	571	Female	Full Member	2024-10-30	\N
3746	Nung	f	f	f	t	f	f	f	t	Work weekend - Can't make the 10/27-10/28	2024-10-26 04:03:50.465227	2024-10-26 04:03:50.465227	7	571	Male	Full Member	2024-10-30	\N
3747	Pop	f	f	f	t	f	f	f	t	Work weekend helper	2024-10-26 04:05:09.106619	2024-10-26 04:05:09.106619	7	571	Female	Guest	2024-10-30	\N
3749	Mike Ryan	f	f	t	t	f	f	f	t	Wildcat Orientation @ Attitash	2024-11-07 14:16:36.332437	2024-11-07 14:16:36.332437	14	575	Male	Full Member	2024-11-20	\N
3750	Mike Ryan	f	f	t	t	f	f	f	t	So it begins	2024-11-07 14:17:29.792711	2024-11-07 14:17:29.792711	14	576	Male	Full Member	2024-11-27	\N
3751	Mike Ryan	f	f	t	t	f	f	f	t	Wildcat Training	2024-11-07 14:18:01.817898	2024-11-07 14:18:01.817898	14	577	Male	Full Member	2024-12-04	\N
3752	Mike Ryan	f	f	t	t	f	f	f	f		2024-11-07 14:18:23.044068	2024-11-07 14:18:23.044068	14	574	Male	Full Member	2024-12-11	\N
3753	B. Halpin	f	f	t	t	f	f	f	f		2024-11-07 14:18:44.707672	2024-11-07 14:18:44.707672	14	574	Male	Guest	2024-12-11	\N
3754	Mike Ryan	f	t	t	t	t	t	t	t		2024-11-07 14:19:51.609718	2024-11-07 14:19:51.609718	14	578	Male	Full Member	2024-12-25	\N
3781	Perry	f	f	t	t	f	f	f	t	Depending on weather 	2024-11-19 15:34:40.793368	2024-11-19 15:34:40.793368	153	575	Male	Full Member	2024-11-20	\N
3782	Kate Naples	f	f	f	t	f	f	f	f	First time guest. Seems very interested! Has visited the Schussers before. - DS	2024-11-19 18:42:24.876641	2024-11-19 18:42:24.876641	20	607	Female	Guest	2025-01-01	\N
3783	Dominik	f	f	t	t	f	f	f	t	More then likely	2024-11-19 20:14:59.236511	2024-11-19 20:14:59.236511	267	575	Male	Full Member	2024-11-20	\N
3785	John D	f	t	t	t	t	t	t	t	Merry Friendsmas!	2024-11-20 15:58:42.293934	2024-11-20 15:58:42.293934	2	578	Male	Full Member	2024-12-25	\N
3786	Amanda J	f	f	t	t	f	f	f	t		2024-11-25 16:31:15.432793	2024-11-25 16:31:15.432793	352	577	Female	Full Member	2024-12-04	\N
3787	Nikki Shults	f	t	t	t	f	f	f	f	Hide the salt shakers! 	2024-11-26 13:56:40.883232	2024-11-26 13:56:40.883232	9	574	Female	Full Member	2024-12-11	\N
3788	Matt 	f	f	t	t	f	f	f	f	Best weekend ! 	2024-11-26 14:15:54.974285	2024-11-26 14:15:54.974285	328	574	Male	Full Member	2024-12-11	\N
3819	Scott James	f	f	t	t	f	f	f	f		2024-12-10 23:37:48.349569	2024-12-10 23:37:48.349569	261	607	Male	Full Member	2025-01-01	\N
3748	Dan Shults	f	f	t	t	f	f	f	f	Searchin' for my lost shaker of salt.	2024-11-06 22:05:59.650928	2024-11-26 15:54:13.725135	20	574	Male	Full Member	2024-12-11	\N
3791	Chris B.	f	f	t	t	f	f	f	f	Best!!!!!!!!!!!!!!!!!!!	2024-11-26 16:59:18.396336	2024-11-26 16:59:18.396336	15	574	Male	Full Member	2024-12-11	\N
3793	Jonathan Macomber	f	f	t	t	f	f	f	t		2024-11-27 00:29:19.53276	2024-11-27 00:29:19.53276	340	574	Male	Full Member	2024-12-11	\N
3794	Matt 	f	f	f	t	f	f	f	t	Might hit the cat.  	2024-11-27 16:21:11.670657	2024-11-27 16:21:11.670657	328	576	Male	Full Member	2024-11-27	\N
3795	doug mayo	f	f	t	t	f	f	f	t	lets go skiing	2024-12-02 12:15:22.173604	2024-12-02 12:15:22.173604	12	577	Male	Full Member	2024-12-04	\N
3796	megan mayo	f	f	t	t	f	f	f	t	lets go skiing	2024-12-02 12:15:47.053807	2024-12-02 12:15:47.053807	12	577	Female	Full Member	2024-12-04	\N
3797	Jenna Whitney 	f	f	t	t	f	f	f	t	Friday is TBD	2024-12-02 14:25:15.37551	2024-12-02 14:25:15.37551	366	577	Female	Full Member	2024-12-04	\N
3798	Ryan Braid	f	f	t	t	f	f	f	t	Friday is TBD	2024-12-02 14:25:31.867067	2024-12-02 14:25:31.867067	366	577	Male	Full Member	2024-12-04	\N
3799	James Spalding	f	f	t	t	f	f	f	t	Friday is TBD (guest of Ryan/Jenna)	2024-12-02 14:25:57.250355	2024-12-02 14:25:57.250355	366	577	Male	Guest	2024-12-04	\N
3800	Dina Pitsas	f	f	t	t	f	f	f	t	Friday is TBD (guest of Ryan/Jenna)	2024-12-02 14:26:32.690654	2024-12-02 14:26:32.690654	366	577	Male	Guest	2024-12-04	\N
3801	Dominik	f	f	t	t	f	f	f	t		2024-12-02 17:01:16.265019	2024-12-02 17:01:16.265019	267	577	Male	Full Member	2024-12-04	\N
3802	John D	f	t	t	t	t	f	f	t	I thought I had already signed up but I must have selected the wrong dates. 	2024-12-03 22:42:40.393642	2024-12-03 22:42:40.393642	2	574	Male	Full Member	2024-12-11	\N
3803	Zach Bassett	f	f	t	t	f	f	f	f	First weekend!	2024-12-04 20:26:39.143339	2024-12-04 20:26:39.143339	326	574	Male	Full Member	2024-12-11	\N
3804	Jacob Donovan	f	f	t	t	f	f	f	f	Zach's guest	2024-12-04 20:27:17.016437	2024-12-04 20:27:17.016437	326	574	Male	Guest	2024-12-11	\N
3805	Alex H.	f	f	f	t	f	f	f	t	Maybe - Guest (Dominik)	2024-12-04 20:43:48.787327	2024-12-04 20:43:48.787327	267	577	Male	Guest	2024-12-04	\N
3790	Nancy Murphy	f	f	t	t	f	f	f	f		2024-11-26 14:41:55.593111	2024-12-07 16:01:42.51502	51	574	Female	Full Member	2024-12-11	\N
3806	Dominik	f	f	t	t	f	f	f	f		2024-12-08 21:01:58.30585	2024-12-08 21:01:58.30585	267	574	Male	Full Member	2024-12-11	\N
3808	Aaron Uehara	f	f	t	f	f	f	f	t	Aaron and his wife Sunny visited a few times last year, and have applied for membership. We've requested they visited again so the current board can meet them. Friday only. -DS	2024-12-09 23:01:51.602622	2024-12-09 23:01:51.602622	20	574	Male	Guest	2024-12-11	\N
3809	Sunny Uehara	f	f	t	f	f	f	f	t	Sunny and her husband Aaron visited a few times last year, and have applied for membership. We've requested they visited again so the current board can meet them. Friday only. -DS	2024-12-09 23:02:25.367588	2024-12-09 23:02:25.367588	20	574	Female	Guest	2024-12-11	\N
3810	Ankur Chawla	f	f	t	t	f	f	f	f	Ankur heard about the club through word of mouth and reached out. First time visitor. Coming with a friend named Ashley. -DS	2024-12-09 23:04:50.301337	2024-12-09 23:04:50.301337	20	574	Male	Guest	2024-12-11	\N
3811	Ashley Herrera	f	f	t	t	f	f	f	f	First time visitor who heard about the club from Ankur Chawla. -DS	2024-12-09 23:06:00.371414	2024-12-09 23:06:00.371414	20	574	Female	Guest	2024-12-11	\N
3812	Madison Moore	f	f	t	t	f	f	f	f	First time visitor coming with her brother Conor. Saw my post on Reddit and followed up! -DS	2024-12-09 23:07:44.314708	2024-12-09 23:07:44.314708	20	574	Female	Guest	2024-12-11	\N
3813	Conor Moore	f	f	t	t	f	f	f	f	First time visitor who heard about the club via his sister, Madison. -DS	2024-12-09 23:08:40.161513	2024-12-09 23:08:40.161513	20	574	Male	Guest	2024-12-11	\N
3814	Andrew Block	f	f	t	f	f	f	f	t	Friday only. Andrew heard about the club on Reddit, and I believe he came to our Elm Street meetup. -DS	2024-12-09 23:09:42.756051	2024-12-09 23:09:42.756051	20	574	Male	Guest	2024-12-11	\N
3815	Perry	f	f	t	t	f	f	f	t		2024-12-09 23:16:11.611196	2024-12-09 23:16:11.611196	153	574	Male	Full Member	2024-12-11	\N
3807	Michelle Comtois	f	f	t	f	f	f	f	t	Possibly not Saturday night 	2024-12-08 21:48:40.253662	2024-12-10 11:07:09.989032	5	574	Female	Full Member	2024-12-11	\N
3816	Rachel Crateau	f	f	t	t	f	f	f	f		2024-12-10 23:36:24.42197	2024-12-10 23:36:24.42197	261	574	Female	Full Member	2024-12-11	\N
3817	Scott James	f	f	t	t	f	f	f	f		2024-12-10 23:36:50.8521	2024-12-10 23:36:50.8521	261	574	Male	Full Member	2024-12-11	\N
3818	Rachel Crateau	f	f	t	t	f	f	f	f		2024-12-10 23:37:24.027451	2024-12-10 23:37:24.027451	261	607	Female	Full Member	2025-01-01	\N
3820	Vicki S	f	t	t	t	t	f	f	f	Best weekend	2024-12-11 00:11:27.130847	2024-12-11 00:11:45.97906	3	574	Female	Full Member	2024-12-11	\N
3821	Alex H	f	f	f	t	f	f	f	f	Saturday morning to Sunday. Guest of Dominik	2024-12-11 17:54:42.109887	2024-12-11 17:54:42.109887	267	574	Male	Guest	2024-12-11	\N
3822	Nancy Murphy	f	t	t	t	f	f	f	f	Maybe Thursday	2024-12-15 22:40:13.983579	2024-12-15 22:40:13.983579	51	607	Female	Full Member	2025-01-01	\N
3823	Dan Shults	f	f	t	t	f	f	f	f	The doctor is in.	2024-12-18 00:10:11.852611	2024-12-18 00:10:11.852611	20	607	Male	Full Member	2025-01-01	\N
3824	megan mayo	f	f	t	t	t	t	f	t	lets go skiing	2024-12-18 01:21:52.580077	2024-12-18 01:21:52.580077	12	609	Female	Full Member	2024-12-18	\N
3825	megan mayo	f	f	f	t	t	t	f	t	lets go skiing	2024-12-18 01:22:43.241521	2024-12-18 01:22:43.241521	12	578	Female	Full Member	2024-12-25	\N
3826	douglas mayo	f	f	f	t	t	t	f	t	lets go skiing	2024-12-18 01:23:29.334998	2024-12-18 01:23:29.334998	12	578	Male	Full Member	2024-12-25	\N
3827	Lori Lavoie	f	f	t	t	f	f	f	t	Not 100% committed, but I’ll probably be up.	2024-12-18 02:57:58.182097	2024-12-18 02:57:58.182097	44	609	Female	Associate Member	2024-12-18	\N
3828	Jonathan Macomber 	f	f	t	t	t	f	f	t		2024-12-19 01:02:07.983169	2024-12-19 01:02:07.983169	340	609	Male	Full Member	2024-12-18	\N
3829	Amanda	f	f	f	t	f	f	f	t		2024-12-19 22:21:08.093394	2024-12-19 22:21:08.093394	352	607	Female	Full Member	2025-01-01	\N
3831	Amanda	f	f	t	t	f	f	f	t	Maybe friday	2024-12-24 13:55:22.487601	2024-12-24 13:55:22.487601	352	578	Female	Full Member	2024-12-25	\N
3834	Mike Ryan	f	f	f	f	f	f	f	t	Not staying at club, keeping minors alive, minor with be in truck during party haha	2024-12-24 18:19:52.920592	2024-12-24 18:19:52.920592	14	607	Male	Full Member	2025-01-01	\N
3835	Perry	f	f	t	t	t	t	t	t	Probably not	2024-12-25 12:39:29.984265	2024-12-25 15:58:43.326245	153	578	Male	Full Member	2024-12-25	\N
3836	Yasmine	f	f	t	t	t	t	t	t	Probably not, guest of Perry 	2024-12-25 12:40:05.603428	2024-12-25 15:58:54.833587	153	578	Female	Guest	2024-12-25	\N
3837	Jenna Whitney 	f	f	t	t	f	f	f	t	probably friday, less sure about saturday	2024-12-25 19:46:51.960511	2024-12-25 19:46:51.960511	366	578	Female	Full Member	2024-12-25	\N
3838	Megan Mayo	t	t	t	t	f	f	f	t		2024-12-25 22:53:34.383263	2024-12-25 22:53:34.383263	357	578	Female	Full Member	2024-12-25	\N
3839	Nikki Shults	f	f	t	t	f	f	f	f	I got nuthin'. -Nikki	2024-12-26 03:55:05.284484	2024-12-26 03:55:05.284484	20	607	Female	Full Member	2025-01-01	\N
3840	Jess P	f	f	t	t	f	f	f	t	Not staying, but will be in the valley.	2024-12-26 15:57:36.360369	2024-12-26 15:57:36.360369	137	578	Female	Associate Member	2024-12-25	\N
3841	Sara Delaney	f	t	t	t	t	f	f	f		2024-12-26 22:50:25.100717	2024-12-26 22:50:25.100717	31	607	Female	Full Member	2025-01-01	\N
3842	Emily Bularzik	f	f	t	t	f	f	f	f	Delaney’s guest	2024-12-26 22:51:17.838587	2024-12-26 22:51:17.838587	31	607	Female	Guest	2025-01-01	\N
3843	Amy Candelora	f	f	t	t	f	f	f	t		2024-12-27 01:41:17.761501	2024-12-27 01:41:17.761501	16	607	Female	Full Member	2025-01-01	\N
3844	Chris Candelora 	f	f	t	t	f	f	f	t		2024-12-27 01:41:51.523939	2024-12-27 01:41:51.523939	16	607	Male	Full Member	2025-01-01	\N
3845	Dominik	f	f	t	t	f	f	f	f		2024-12-28 01:49:32.773893	2024-12-28 01:49:32.773893	267	607	Male	Full Member	2025-01-01	\N
3846	Jenna Whitney 	t	t	t	t	f	f	f	t	maybe	2024-12-28 20:31:27.896457	2024-12-28 20:31:27.896457	366	607	Female	Full Member	2025-01-01	\N
3847	Ryan Braid	t	t	t	t	f	f	f	t	maybe	2024-12-28 20:31:42.519698	2024-12-28 20:31:42.519698	366	607	Male	Full Member	2025-01-01	\N
3850	Nicholas Skovran	f	f	t	t	t	f	f	t		2024-12-30 17:27:25.775916	2024-12-30 17:27:25.775916	329	607	Male	Full Member	2025-01-01	\N
3851	Michelle Comtois	f	f	t	t	f	f	f	t		2024-12-30 20:19:09.920249	2024-12-30 20:19:09.920249	5	607	Female	Full Member	2025-01-01	\N
3852	Chris B	f	f	t	t	f	f	f	f	First Aid!!!	2024-12-30 20:36:06.798156	2024-12-30 20:36:17.416551	15	607	Male	Full Member	2025-01-01	\N
3853	Ron Swanick	f	f	t	t	f	f	f	f	Guest of Chris B. Masters if open please. 	2024-12-30 20:43:33.982022	2024-12-30 20:43:33.982022	15	607	Male	Guest	2025-01-01	\N
3854	Ankur Chawla	f	f	t	t	f	f	f	f	Second visit. Seems quite interested in membership! -DS	2024-12-31 14:28:07.710664	2024-12-31 14:28:07.710664	20	607	Male	Guest	2025-01-01	\N
3855	Megan Mayo	f	f	t	t	f	f	f	t		2024-12-31 14:56:06.861825	2024-12-31 14:56:06.861825	357	607	Female	Full Member	2025-01-01	\N
3856	Zach Bassett	f	f	t	t	f	f	f	f	First aid	2024-12-31 15:03:28.031771	2024-12-31 15:03:28.031771	326	607	Male	Full Member	2025-01-01	\N
3857	Julia Frias	f	f	t	t	f	f	f	f	zach's guest	2024-12-31 15:05:13.37188	2024-12-31 15:05:13.37188	326	607	Female	Guest	2025-01-01	\N
3849	Perry	f	f	t	t	f	f	f	f		2024-12-29 16:00:59.855946	2024-12-31 17:59:52.23528	153	607	Male	Full Member	2025-01-01	\N
3878	T Wall	f	f	t	t	f	f	f	t		2025-01-08 18:21:36.638683	2025-01-08 18:21:36.638683	21	611	Male	Full Member	2025-01-15	\N
3848	Vicki	f	t	t	t	f	f	f	f	First aid	2024-12-29 03:42:55.992139	2024-12-31 22:01:01.521216	3	607	Female	Full Member	2025-01-01	\N
3859	Doug Mayo	f	f	t	t	f	f	f	t	Let’s go skiing 	2025-01-01 01:38:13.216706	2025-01-01 01:38:13.216706	12	607	Male	Full Member	2025-01-01	\N
3832	Lori Lavoie	f	t	t	t	f	f	f	f	Only a maybe for Thursday night	2024-12-24 14:43:06.176656	2025-01-01 03:56:18.577308	44	607	Female	Associate Member	2025-01-01	\N
3830	John	f	t	t	t	t	f	f	f	First Aid	2024-12-21 11:47:32.897013	2025-01-01 11:46:12.902272	2	607	Male	Full Member	2025-01-01	\N
3833	Alana M	f	f	t	t	f	f	f	t	First aid! No dinner this time, thanks	2024-12-24 15:07:16.329981	2025-01-01 19:08:45.009484	23	607	Female	Full Member	2025-01-01	\N
3858	Tommy Wall	f	f	t	t	f	f	f	t	First aid- bringing our own dinner	2024-12-31 16:37:49.698107	2025-01-01 19:09:08.003065	23	607	Male	Full Member	2025-01-01	\N
3860	Jon Macomber	f	t	t	t	t	f	f	t	Yes	2025-01-01 20:14:41.782746	2025-01-01 20:14:41.782746	340	607	Male	Full Member	2025-01-01	\N
3861	Sunny Uehara	f	f	t	t	f	f	f	f	New Members	2025-01-01 22:25:40.641457	2025-01-01 22:25:59.975969	261	607	Female	Full Member	2025-01-01	\N
3862	Aaron Uehara	f	f	t	t	f	f	f	f	New Member	2025-01-01 22:27:50.10191	2025-01-01 22:27:50.10191	261	607	Male	Full Member	2025-01-01	\N
3863	Ashley Herrera	f	f	t	t	f	f	f	f	Returning guest! Second visit. -DS	2025-01-02 01:04:59.131012	2025-01-02 01:04:59.131012	20	607	Female	Guest	2025-01-01	\N
3864	Isabel Rauch	f	f	t	t	f	f	f	f	Guest of Nicholas S.	2025-01-02 13:59:20.162549	2025-01-02 13:59:20.162549	261	607	Female	Guest	2025-01-01	\N
3865	Rachel Crateau	f	f	t	t	f	f	f	t		2025-01-05 13:48:06.85057	2025-01-05 13:48:06.85057	261	610	Female	Full Member	2025-01-22	\N
3866	Scott James	f	f	t	t	f	f	f	t		2025-01-05 13:49:22.155058	2025-01-05 13:49:22.155058	261	610	Male	Full Member	2025-01-22	\N
3867	Jenna Whitney 	f	f	t	t	f	f	f	t	strong maybe	2025-01-05 14:56:38.068102	2025-01-05 14:56:38.068102	366	608	Female	Full Member	2025-01-08	\N
3868	Amanda	f	f	t	t	f	f	f	t	Maybe friday	2025-01-05 15:56:44.961641	2025-01-05 15:56:44.961641	352	608	Female	Full Member	2025-01-08	\N
3869	John D	f	f	t	t	t	f	f	t	Tentative based on race reschedule. 	2025-01-05 23:43:04.413974	2025-01-05 23:43:04.413974	2	608	Male	Full Member	2025-01-08	\N
3870	Doug Mayo	f	f	t	t	t	f	f	t	Let’s go skiing	2025-01-06 12:05:58.461842	2025-01-06 12:05:58.461842	12	608	Male	Full Member	2025-01-08	\N
3871	Megan mayo 	f	f	t	t	t	f	f	t	Let’s go skiing 	2025-01-06 12:06:26.54729	2025-01-06 12:06:26.54729	12	608	Female	Full Member	2025-01-08	\N
3873	Vicki S	f	f	t	t	t	f	f	t	Sunday maybe	2025-01-06 19:25:36.162461	2025-01-06 19:25:36.162461	3	608	Female	Full Member	2025-01-08	\N
3874	Alana	f	f	t	t	f	f	f	t		2025-01-08 16:07:44.222634	2025-01-08 16:07:44.222634	23	608	Female	Full Member	2025-01-08	\N
3875	Tommy	f	f	t	t	f	f	f	t		2025-01-08 16:07:59.13333	2025-01-08 16:07:59.13333	23	608	Male	Full Member	2025-01-08	\N
3876	Perry	f	f	t	t	f	f	f	t	Probably not. Adding just incase 	2025-01-08 16:50:34.04012	2025-01-08 16:50:34.04012	153	608	Male	Full Member	2025-01-08	\N
3879	Alana	f	f	t	t	f	f	f	t		2025-01-08 18:22:17.732446	2025-01-08 18:22:17.732446	21	611	Female	Full Member	2025-01-15	\N
3880	T Wall	f	f	t	t	f	f	f	t		2025-01-08 18:23:34.681445	2025-01-08 18:23:34.681445	21	610	Male	Full Member	2025-01-22	\N
3882	Alana M	f	f	t	t	f	f	f	t		2025-01-08 18:25:26.688872	2025-01-08 18:25:26.688872	21	610	Female	Full Member	2025-01-22	\N
3883	Dominik	f	f	t	t	f	f	f	t		2025-01-08 18:57:31.532507	2025-01-08 18:57:31.532507	267	608	Male	Full Member	2025-01-08	\N
3884	Tyler Buckeridge	f	f	t	t	f	f	f	t	Applicant getting in some face time with the gang. John D will sponsor. - DS	2025-01-08 21:11:16.063361	2025-01-08 21:11:16.063361	20	608	Male	Guest	2025-01-08	\N
3885	Jon Macomber	f	f	f	t	t	t	f	t		2025-01-09 01:57:46.948972	2025-01-09 01:57:46.948972	340	608	Male	Full Member	2025-01-08	\N
3913	Perry	f	f	t	t	f	f	f	t		2025-01-11 19:29:38.834453	2025-01-11 19:29:38.834453	153	611	Male	Full Member	2025-01-15	\N
3914	Amanda	f	f	f	t	f	f	f	t	Hard maybe	2025-01-12 14:12:22.320563	2025-01-12 14:12:22.320563	352	611	Female	Full Member	2025-01-15	\N
3915	Michelle Comtois	f	f	t	t	f	f	f	t	Saturday night maybe 	2025-01-13 01:52:50.371014	2025-01-13 01:52:50.371014	5	611	Female	Full Member	2025-01-15	\N
3916	Doug Mayo	t	f	t	t	t	f	f	t	Maybe up Wednesday for Thursday def up for the weekends, let’s go skiing 	2025-01-14 11:55:00.357955	2025-01-14 11:55:00.357955	12	611	Male	Full Member	2025-01-15	\N
3917	Megan mayo 	f	f	t	t	t	f	f	t	Let’s go skiing 	2025-01-14 11:55:28.347213	2025-01-14 11:55:28.347213	12	611	Female	Full Member	2025-01-15	\N
3918	Nikki Shults	f	f	t	f	f	f	f	t		2025-01-14 11:59:59.120884	2025-01-14 11:59:59.120884	9	611	Female	Full Member	2025-01-15	\N
3919	Dominik 	f	f	t	t	t	f	f	t		2025-01-14 15:16:49.098478	2025-01-14 15:16:49.098478	267	611	Male	Full Member	2025-01-15	\N
3920	Dan Shults	f	f	t	t	f	f	f	t		2025-01-15 15:08:02.038199	2025-01-15 15:08:02.038199	20	610	Male	Full Member	2025-01-22	\N
3872	Dan Shults	f	f	t	f	f	f	f	t	Going home Sat evening.	2025-01-06 15:17:19.282528	2025-01-15 20:36:39.788723	20	611	Male	Full Member	2025-01-15	\N
3921	Jon Macomber	f	t	t	t	t	f	f	t		2025-01-16 00:33:00.695872	2025-01-16 00:33:00.695872	340	611	Male	Full Member	2025-01-15	\N
3925	Ron Swanick	f	f	t	t	f	f	f	t	Guest of Chris B. - Please put in Master’s. 	2025-01-20 20:44:49.837403	2025-01-20 20:44:49.837403	15	610	Male	Guest	2025-01-22	\N
3926	Nikki Shults	f	f	t	t	f	f	f	t		2025-01-20 23:45:56.942458	2025-01-20 23:45:56.942458	9	610	Female	Full Member	2025-01-22	\N
3927	Doug Mayo	f	f	t	t	f	f	f	t	Let’s go skiing 	2025-01-21 01:13:39.372983	2025-01-21 01:13:39.372983	12	610	Male	Full Member	2025-01-22	\N
3928	Megan mayo 	f	f	t	t	f	f	f	t	Let’s go skiing 	2025-01-21 01:14:18.52537	2025-01-21 01:14:18.52537	12	610	Female	Full Member	2025-01-22	\N
3929	Megan mayo 	f	f	t	t	f	f	f	t	Let’s go skiing 	2025-01-21 01:14:44.817373	2025-01-21 01:14:44.817373	12	610	Female	Full Member	2025-01-22	\N
3930	Doug Mayo	f	f	t	t	f	f	f	t	Let’s go skiing 	2025-01-21 01:16:29.328417	2025-01-21 01:16:29.328417	12	612	Male	Full Member	2025-01-29	\N
3931	Megan mayo 	f	f	t	t	f	f	f	t	Let’s go skiing 	2025-01-21 01:17:02.061968	2025-01-21 01:17:02.061968	12	612	Female	Full Member	2025-01-29	\N
3932	Nancy Murphy	f	f	t	t	f	f	f	t		2025-01-21 02:03:04.249871	2025-01-21 02:03:04.249871	51	610	Female	Full Member	2025-01-22	\N
3934	Dan Shults	f	f	t	t	f	f	f	f	Party on	2025-01-21 16:16:59.514128	2025-01-21 16:16:59.514128	20	612	Male	Full Member	2025-01-29	\N
3935	Kate Naples	f	f	f	t	f	f	f	f	Second visit from a "member-hopeful". Not arriving until early Saturday afternoon, so take a moment to get to know her! - DS	2025-01-21 20:03:58.633263	2025-01-21 20:03:58.633263	20	612	Female	Guest	2025-01-29	\N
3936	Liam Naples	f	f	f	t	f	f	f	f	Guest Kate Naples son. Not around Friday night, so take a moment to get to know him on Saturday. -DS	2025-01-21 20:04:57.917964	2025-01-21 20:05:22.83195	20	612	Male	Guest	2025-01-29	\N
3937	Tyler Buckeridge	f	f	t	t	f	f	f	t	Has already applied	2025-01-21 23:20:37.649469	2025-01-21 23:20:37.649469	267	610	Male	Guest	2025-01-22	\N
3938	Dominik	f	f	t	t	f	f	f	t		2025-01-21 23:21:06.17831	2025-01-21 23:21:06.17831	267	610	Male	Full Member	2025-01-22	\N
3939	Jon Macomber	f	t	t	t	t	f	f	t		2025-01-22 02:03:35.217061	2025-01-22 02:03:35.217061	340	610	Male	Full Member	2025-01-22	\N
3941	Matt	f	f	t	t	f	f	f	t		2025-01-22 03:01:48.640032	2025-01-22 03:01:48.640032	328	610	Male	Full Member	2025-01-22	\N
3942	Perry 	f	f	t	t	f	f	f	t		2025-01-22 03:14:30.939211	2025-01-22 03:14:30.939211	153	610	Male	Full Member	2025-01-22	\N
3943	Vicki S	f	t	t	t	t	f	f	t		2025-01-22 17:19:02.427336	2025-01-22 17:19:02.427336	3	610	Female	Full Member	2025-01-22	\N
3944	John D	f	t	t	t	t	f	f	t		2025-01-22 17:20:47.847869	2025-01-22 17:20:47.847869	3	610	Male	Full Member	2025-01-22	\N
3945	Aaron Uehara	f	f	t	t	f	f	f	t		2025-01-22 23:32:07.670531	2025-01-22 23:32:07.670531	404	610	Male	Full Member	2025-01-22	\N
3946	Sunny Uehara	f	f	t	t	f	f	f	t		2025-01-22 23:33:12.397232	2025-01-22 23:33:12.397232	404	610	Female	Full Member	2025-01-22	\N
3947	Alex H	f	f	t	t	f	f	f	t	Guest of Dominik	2025-01-23 01:35:55.295055	2025-01-23 01:35:55.295055	267	610	Male	Guest	2025-01-22	\N
3948	Amanda	f	f	f	t	f	f	f	t	Strong maybe	2025-01-23 12:44:47.361947	2025-01-23 12:44:47.361947	352	610	Female	Full Member	2025-01-22	\N
3949	Nancy Murphy	f	f	t	t	f	f	f	f		2025-01-23 16:58:35.490788	2025-01-23 16:58:35.490788	51	612	Female	Full Member	2025-01-29	\N
3950	Mike Ryan	f	f	f	f	f	f	f	t	Coming by for party	2025-01-23 21:28:51.680678	2025-01-23 21:28:51.680678	14	612	Male	Full Member	2025-01-29	\N
3951	Rachel Crateau	f	f	t	t	f	f	f	f	Wig	2025-01-25 01:30:19.602302	2025-01-25 01:30:19.602302	261	612	Female	Full Member	2025-01-29	\N
3952	Scott James	f	f	t	t	f	f	f	f		2025-01-25 01:30:43.750267	2025-01-25 01:30:43.750267	261	612	Male	Full Member	2025-01-29	\N
3953	Kevin Buckley	f	f	t	t	f	f	f	f	Veggie please 	2025-01-25 12:41:38.800224	2025-01-25 12:41:38.800224	33	612	Male	Associate Member	2025-01-29	\N
3954	Mirian Barrientos 	f	f	t	t	f	f	f	t		2025-01-25 12:42:11.143072	2025-01-25 12:42:11.143072	33	612	Female	Associate Member	2025-01-29	\N
3881	Alana M	f	f	t	t	f	f	f	t	No dinner	2025-01-08 18:24:10.576682	2025-01-28 22:22:14.877554	21	612	Female	Full Member	2025-01-29	\N
3955	Nikki Shults	f	f	t	t	f	f	f	f	Wig party. Yes to dinner	2025-01-27 00:14:30.50034	2025-01-27 00:14:30.50034	9	612	Female	Full Member	2025-01-29	\N
3956	Amanda	f	t	f	f	f	f	f	t		2025-01-27 16:47:19.017376	2025-01-27 16:47:19.017376	352	612	Female	Full Member	2025-01-29	\N
3957	Claire Gaffney	f	f	f	t	f	f	f	f	Saturday only. First time visitor. Seems very interested! - DS	2025-01-27 19:22:41.696281	2025-01-27 19:22:41.696281	20	612	Female	Guest	2025-01-29	\N
4259	Chris	t	f	t	f	f	t	f	f	This is just a test	2025-06-16 18:55:34.208655	2025-06-16 18:55:34.208655	1	784	Male	Associate Member	2025-06-16	\N
4261	Chris.Candelora	t	f	t	f	f	f	f	t	test	2025-06-16 20:00:15.468785	2025-06-16 20:00:15.468785	502	784	Male	Full Member	2025-06-16	\N
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.schema_migrations (version) FROM stdin;
20140227011309
20140227011435
20140227014711
20140227015126
20140227015856
20140227020409
20140228010614
20140228010616
20140228010617
20140318204857
20140318204923
20140318211704
20140318212106
20140528022142
20140707010532
20140731142629
20140731142901
20171003221944
20201205231527
20250615125907
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, name, role, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email) FROM stdin;
3	vsantarc@gmail.com	$2a$11$el5MzHktX4jJMjog8znKEeKJY9fSnSpsu47yZghcNMrv.hhZZiNUq	\N	\N	\N	163	2025-04-29 18:03:31.251509	2025-04-22 21:13:24.005405	108.26.193.205	108.26.193.205	2017-10-09 19:37:48.324241	2025-06-16 16:54:05.281075	Victoria Santarcangelo	2	\N	2025-06-16 16:54:05.280852	\N	\N
4	kerin.holigan@gmail.com	$2a$11$BOPufmDFhbn4AZVqeTS/euik10Tj7Eq88voO5BOv5VGA2YTEYlvaq	\N	\N	\N	0	\N	\N	\N	\N	2017-10-09 19:38:50.969408	2025-06-16 16:54:05.291988	Kerin Holigan	0	\N	2025-06-16 16:54:05.291672	\N	\N
6	darrell.holigan@gmail.com	$2a$11$gDEvDoR1xdZvbp/jtfh/D.UOI85wKc.EaVTCy5A/8kZUQE..FYpx.	\N	\N	\N	3	2020-01-31 18:46:04.625655	2017-12-05 21:30:50.377601	144.121.24.243	64.119.134.46	2017-10-09 19:40:04.065064	2025-06-16 16:54:05.306632	Darrell Holigan	0	\N	2025-06-16 16:54:05.306426	\N	\N
8	janlankowski@comcast.net	$2a$11$8uLLeBJXOLEMOlkSCEZI1eSanyYtIHL37D7qYacrXU/3tVMesKiVq	e171fd4d1563cf9979746bbe3447c310822959a5239f05cde2f1b9755883c4f6	2020-04-02 16:02:28.495722	2021-05-11 19:32:21.381286	6	2021-05-31 16:20:11.392125	2021-05-11 19:32:21.387629	73.114.44.194	73.114.44.194	2017-10-09 19:41:13.59402	2025-06-16 16:54:05.323196	Jan Lankowski	0	\N	2025-06-16 16:54:05.322805	\N	\N
16	aciak2004@yahoo.com	$2a$11$YgWnrBshlOv1KM8BvaN0Fe3guwGbZ4v0P4ZIvV94wFfF8EbUqm1Lm	\N	\N	2017-11-12 02:38:02.421333	118	2025-06-16 23:03:49.111464	2025-06-16 23:00:46.279039	10.0.0.60	10.0.0.27	2017-10-09 19:49:46.396177	2025-06-16 23:03:49.111618	Amy Cheever	0	\N	2025-06-16 16:54:05.383602	\N	\N
25	mirian.barrientos@gmail.com	$2a$11$mBvcVD/dMzX1NHHoOHQMC.g5wDVZ9fTVLemfaV0pvPEp.JLn5.ywe	4ff5c1689fe8172cf515e5676bb7fcea618d7af18f6e2d79f987e27f6c878df0	2021-11-05 15:29:34.172921	\N	0	\N	\N	\N	\N	2017-10-09 19:55:29.892089	2025-06-16 16:54:05.417906	Mirian Barrientos	0	\N	2025-06-16 16:54:05.417718	\N	\N
26	hairofthedog1@mns.com	$2a$11$dQBPSH1nEbeR.QURwvDyRODmZpj1Tx7nVXQtYYzKdkHGRsC8R1tZe	\N	\N	\N	0	\N	\N	\N	\N	2017-10-09 19:55:52.837497	2025-06-16 16:54:05.427509	Diane Gingras	0	\N	2025-06-16 16:54:05.427263	\N	\N
27	rice6dc@verizon.net	$2a$11$ILLo1dFAuSRVOsRMcmgQmO6QlXtNc6rPVM27cSg.K2VHEqxby4pDK	\N	\N	\N	0	\N	\N	\N	\N	2017-10-09 19:56:15.804321	2025-06-16 16:54:05.450851	Debbie Rice	0	\N	2025-06-16 16:54:05.450508	\N	\N
29	iekerr@aol.com	$2a$11$VokeCu4D5XzDWFTTj9gI6.gdLrLZBTIaSQCuoWCamEw/8EpHNHvJ2	\N	\N	\N	0	\N	\N	\N	\N	2017-10-09 19:57:16.30819	2025-06-16 16:54:05.458682	Irene Kerr	0	\N	2025-06-16 16:54:05.458374	\N	\N
31	sdelaney33@gmail.com	$2a$11$5YZxmLZQKmXUqM67FLJEB.TQlvBPfcnIekcB7InJE3X92a67wVsTm	\N	\N	2022-03-12 02:18:55.17042	115	2025-06-06 21:30:31.901112	2025-06-04 14:48:50.773227	104.28.39.136	104.28.39.134	2017-10-09 19:58:04.986667	2025-06-16 16:54:05.465895	Sara Delaney	0	\N	2025-06-16 16:54:05.465705	\N	\N
34	pfogel@yahoo.com	$2a$11$jxU.bjXjFx5YLBRAhEO6z.hHOdkxHnr3ofEwrCfjMl9phhU6VCBR6	38e61dce1c370119b279df86a93c81ec6ae5e5628ac894f0e9ac816787383e84	2023-03-01 21:43:27.617484	\N	5	2021-08-30 20:42:52.859909	2019-01-15 15:20:00.408139	174.242.76.150	144.121.39.58	2017-10-09 20:00:26.413474	2025-06-16 16:54:05.481504	Paul Fogel	0	\N	2025-06-16 16:54:05.481303	\N	\N
35	dan51872@yahoo.com	$2a$11$X5v94a8MXSldRbdkm55zKe3oKVctM8S8lIQh9faZYD7qOVgwU5t76	\N	\N	\N	0	\N	\N	\N	\N	2017-10-09 20:01:05.787642	2025-06-16 16:54:05.489571	Dan Hunt	0	\N	2025-06-16 16:54:05.489367	\N	\N
40	enottleson@yahoo.com	$2a$11$E3QJk9OCo.xJpDF66HyIre/qDnmGRWwwR32W8KuHq8SaSuQQXgeZO	\N	\N	\N	0	\N	\N	\N	\N	2017-10-09 20:03:42.938962	2025-06-16 16:54:05.495018	Erik Nottleson	0	\N	2025-06-16 16:54:05.494833	\N	\N
41	puscasuirina@yahoo.com	$2a$11$8qEu7AVNO971yIWegZ79MeGgCWzZROFE7MGC4MR6bHTeHBOelW25e	\N	\N	\N	0	\N	\N	\N	\N	2017-10-09 20:05:30.262002	2025-06-16 16:54:05.500167	Irina Puscasu	0	\N	2025-06-16 16:54:05.499984	\N	\N
42	test@inogus.com	$2a$11$G05C1WxvM4fj6UYoCOAs.e4XjpJS38P040fkpagJP6cW6xxMZycKe	\N	\N	\N	1	2017-10-19 13:35:29.069113	2017-10-19 13:35:29.069113	73.126.49.26	73.126.49.26	2017-10-19 13:35:08.749534	2025-06-16 16:54:05.507049	Test	0	\N	2025-06-16 16:54:05.506857	\N	\N
50	ohno21212@gmail.com	$2a$11$Du9Oki3MU72L5d6VK6o9e.OG8nJ2II7UU6swLIL.5WhZ/G3QePRl2	\N	\N	\N	11	2021-06-22 02:00:54.302957	2021-06-05 16:10:58.583984	98.217.224.88	98.217.224.88	2019-09-08 18:15:32.837108	2025-06-16 16:54:05.534113	Matt Beal	2	\N	2025-06-16 16:54:05.533939	\N	\N
57	sbiletch@gmail.com	$2a$11$dXdKjSBXsRohty.Gf/5XHOtKLLaHhUbRXqCfe8Mt0VoLLrpzTv0E2	3359a48631c8233d3959aca1e345dd93a480110455b59f642cd993e282503456	2023-09-03 23:44:52.783797	\N	67	2024-10-02 21:48:23.312692	2024-09-22 23:47:42.051028	98.216.147.61	98.216.147.61	2020-02-12 00:33:18.30254	2025-06-16 16:54:05.548483	Shana Biletch	0	\N	2025-06-16 16:54:05.548294	\N	\N
154	dane1022@comcast.net	$2a$11$Zrg25rkOdK7aVf30NRbxQ.3ZU.TdviHXiFGjMYEDEUG7LJLAk05JG	\N	\N	\N	72	2024-07-02 00:40:09.610487	2024-04-19 00:05:12.651312	104.177.93.38	104.177.93.38	2021-03-18 21:29:27.302896	2025-06-16 16:54:05.575573	Dane Araujo	0	\N	2025-06-16 16:54:05.575385	\N	\N
329	nick.3.skovran@gmail.com	$2a$11$x9lRxlhMRW2NLuFWNHJd/.EQdPapENdHN5At74XGNeeXIjMgc7b8C	c473ae76dc8fa0372797f40f0ccf65f371ba27e7616536e3b303e0d7e046c712	2024-03-06 15:14:19.221781	2025-06-03 23:05:18.611472	8	2025-06-03 23:05:18.617882	2025-03-19 17:46:33.109072	172.56.192.156	65.215.34.66	2023-06-30 13:54:12.06263	2025-06-16 16:54:05.668337	Nick Skovran	0	\N	2025-06-16 16:54:05.668159	\N	\N
330	corey.blohm130@gmail.com	$2a$11$7ecIIrzcmohzmh8p/2AxluMHBsD3tB2DZuOLWfMGoGn4aAqrMbh0O	46dd2150b290460170d7194a821b4947fbde853d01a565713144c110bc7b6f14	2024-10-17 21:38:17.936296	\N	3	2024-10-18 23:22:19.174259	2024-10-17 21:39:31.939251	173.44.93.121	173.44.93.121	2023-09-12 13:00:16.474447	2025-06-16 16:54:05.676331	Corey Blohm	0	\N	2025-06-16 16:54:05.676078	\N	\N
339	ryan.braid@gmail.com	$2a$11$iRYgzcJo.AkO1GHOqp8S1eY9/MpzwazokaDvB1iqHgfUPCU20rY36	\N	\N	2024-11-02 12:05:50.711726	26	2025-05-03 12:52:00.773682	2025-03-29 11:44:45.819494	172.56.197.37	172.59.138.173	2024-02-22 14:24:58.423602	2025-06-16 16:54:05.684231	Ryan Braid	0	\N	2025-06-16 16:54:05.684039	\N	\N
340	macomber.jon@gmail.com	$2a$11$EfqXWEqdQ0HKe1kS54kyNeyPEyLAnpyq67UmfkOjZKJTxdBda.yea	69d7ba4d436d736418693490bfb17b2671cf50aef394358473310e136474ed72	2024-03-14 17:25:40.147928	\N	25	2025-03-07 01:33:20.619208	2025-03-06 01:10:10.687726	67.186.134.110	67.186.134.110	2024-02-29 14:00:04.377998	2025-06-16 16:54:05.690963	Jonathan Macomber	0	\N	2025-06-16 16:54:05.690767	\N	\N
352	arjacobs012@gmail.com	$2a$11$xPozuKHrQUV07tkWR41CduxwOaJ62Lja/9mA.ODdzokED8y7boSTK	\N	\N	\N	67	2025-06-09 02:20:31.448376	2025-06-07 01:08:31.022765	75.68.241.103	174.242.70.5	2024-06-22 18:53:21.816145	2025-06-16 16:54:05.697551	Amanda Jacobs	0	\N	2025-06-16 16:54:05.697364	\N	\N
353	tevism@gmail.com	$2a$11$UJ8dgmjlV3EE4VETqmdP9O5/zjPes.y.vAiGQcAs.ITBiFrf.ST.u	\N	\N	\N	1	2024-07-01 20:57:12.380801	2024-07-01 20:57:12.380801	185.172.191.100	185.172.191.100	2024-06-27 14:43:48.921062	2025-06-16 16:54:05.703063	Tevis Morrow	0	\N	2025-06-16 16:54:05.702739	\N	\N
354	kckflynn@aol.com	$2a$11$rIfsIktB9xOYVdcUelfIVejblMB.D0rXi5eDJAeQw9LVjIN8IDDwq	\N	\N	\N	1	2024-06-27 22:36:35.824131	2024-06-27 22:36:35.824131	24.250.38.86	24.250.38.86	2024-06-27 14:49:22.579209	2025-06-16 16:54:05.710582	Karen & Kevin Flynn	0	\N	2025-06-16 16:54:05.710345	\N	\N
355	lswattman@yahoo.com	$2a$11$62WVLNLFNPLST2ng2OosMOfzJZ7zgVS9vGpFWsY4hTM6.B/QQc2Ua	\N	\N	\N	0	\N	\N	\N	\N	2024-06-27 14:54:27.083133	2025-06-16 16:54:05.716253	Linda Wattman	0	\N	2025-06-16 16:54:05.71606	\N	\N
356	bethrollsmith@gmail.com	$2a$11$iiUJPe2lvzQ6uf1wnb8NNOAtaBJsOBcrtXzkL1v2VS0kJkZ5T8Gfa	\N	\N	\N	0	\N	\N	\N	\N	2024-06-27 14:58:51.667866	2025-06-16 16:54:05.72591	Beth Smith	0	\N	2025-06-16 16:54:05.725713	\N	\N
357	meganmccauley6@gmail.com	$2a$11$G.Ff5wEDTDKvyk/jlsT73eOKWLDP9H6p03HbaYbTw1id08vc5HQbK	\N	\N	\N	7	2025-03-19 00:14:55.839428	2025-01-31 23:24:49.885499	76.119.192.14	24.198.131.38	2024-06-27 15:02:58.808563	2025-06-16 16:54:05.731229	Megan McCauley	0	\N	2025-06-16 16:54:05.731045	\N	\N
358	konancf596@gmail.com	$2a$11$fc5Ub8cyYAekgqosfS85Q.qZ.MDTenzVef0Ztb2nw/WiykpsiUIES	\N	\N	\N	1	2024-06-28 04:12:57.574551	2024-06-28 04:12:57.574551	98.189.9.130	98.189.9.130	2024-06-28 04:12:57.571858	2025-06-16 16:54:05.736632	acKAJEXgGCDx	0	\N	2025-06-16 16:54:05.7363	\N	\N
359	floretm586@gmail.com	$2a$11$dCLVcQbWQxuQ27XpZZRUxunegB1iDtlNtyeVVtHNpgefbXaYYuPli	\N	\N	\N	1	2024-07-05 07:46:13.461003	2024-07-05 07:46:13.461003	181.164.145.232	181.164.145.232	2024-07-05 07:46:13.457748	2025-06-16 16:54:05.74527	wNqtfBWakLHUpbQP	0	\N	2025-06-16 16:54:05.744981	\N	\N
363	vinadayh@gmail.com	$2a$11$PBN4x.zuTyqUiqAUul4re.eInPhuaBp.DBGn9v992nmKqmsweR/WC	\N	\N	\N	1	2024-07-27 12:15:26.451049	2024-07-27 12:15:26.451049	116.212.149.106	116.212.149.106	2024-07-27 12:15:26.446471	2025-06-16 16:54:05.771736	wOZNldEVxKUtauAp	0	\N	2025-06-16 16:54:05.771276	\N	\N
364	mellonwhitnd41@gmail.com	$2a$11$W.vh78D5T/8KyKeYpM6FiOTsB17LP26Sycr9RKmaUQcY18thhJRze	\N	\N	\N	1	2024-07-29 21:46:25.414393	2024-07-29 21:46:25.414393	5.161.105.232	5.161.105.232	2024-07-29 21:46:25.411693	2025-06-16 16:54:05.778473	jxqbwBug	0	\N	2025-06-16 16:54:05.778279	\N	\N
367	euraburgerjw9g@outlook.com	$2a$11$1Wr0Cjd5oRRiGXqjaBcum.UmLmFv6rIaBwaUMHTzL9fwDUKB1wrv6	\N	\N	\N	1	2024-08-22 11:16:30.995306	2024-08-22 11:16:30.995306	5.135.152.155	5.135.152.155	2024-08-22 11:16:30.990824	2025-06-16 16:54:05.802469	dkLPEMKpjARQCXN	0	\N	2025-06-16 16:54:05.802278	\N	\N
368	kinebcerva19@gmail.com	$2a$11$289CQ67gJiWVzKVDM9bHce3htYiFQa3T4QTl1n24rTUCBrqcQCPAq	\N	\N	\N	1	2024-08-25 10:50:01.570539	2024-08-25 10:50:01.570539	200.50.212.155	200.50.212.155	2024-08-25 10:50:01.56658	2025-06-16 16:54:05.809849	lWIyrFONSjMbo	0	\N	2025-06-16 16:54:05.809612	\N	\N
5	mischy@comcast.net	$2a$11$bLrP.PcvpBIA9T6MhqtrYe1KaYSL9E1Z/NUmoSFgJfr0KQqtw70fG	\N	\N	\N	847	2025-06-13 23:33:12.000306	2025-06-05 09:36:57.899992	76.118.11.219	76.118.11.219	2017-10-09 19:39:29.76273	2025-06-16 16:54:05.298757	Michelle Comtois	2	\N	2025-06-16 16:54:05.298574	\N	\N
9	nltherrien@gmail.com	$2a$11$Kc1wF4q6Cuj11aEIH7cgQuU1GVVt.8nGoMeKfgEodCFAjI/y/XfSS	14726b1bf679f87836cadd3c2445c4c1d04c2c442a56f13577541f3dbef6e606	2023-02-01 18:55:03.827248	2023-02-22 17:04:36.767773	158	2025-04-10 18:34:54.081836	2025-04-06 20:58:27.267668	108.7.178.6	108.7.178.6	2017-10-09 19:41:55.335716	2025-06-16 16:54:05.330541	Nikki Therrien	0	\N	2025-06-16 16:54:05.33033	\N	\N
10	kurtyang04@gmail.com	$2a$11$PjVQqjIEQe/i7StXhH.JMOm1UTLn0H9Gl/NqhChPLDiz8T9pSexEe	\N	\N	2018-08-30 00:17:28.706944	50	2024-06-04 17:23:41.294491	2023-10-19 02:07:30.484774	107.77.225.226	107.77.225.32	2017-10-09 19:45:24.087215	2025-06-16 16:54:05.337902	Kurt Yang	0	\N	2025-06-16 16:54:05.33729	\N	\N
12	douglasrobertmayo@yahoo.com	$2a$11$8m2VKJySfUFPGgjxLkkEE.RSWrVywQZoCJFmbbqNivQg9B4HessGi	27d63dc42c7a33ae140a9cc7256dd07230f23589a23e9e15f16ed9b8b22dedc0	2021-06-15 23:58:50.754598	\N	70	2025-03-26 10:49:56.947184	2025-03-04 14:53:56.250007	172.56.199.142	172.56.117.226	2017-10-09 19:46:33.66312	2025-06-16 16:54:05.344672	Doug Mayo	0	\N	2025-06-16 16:54:05.34445	\N	\N
14	ford289@hotmail.com	$2a$11$2nHi1pbB15kEx7XVa.ck9.V50cDWP/oQ0slKlRV5XuKl0jf9KLQEy	ed0bf5b9581436d669f7dfd9464cfed841fe3ba25d4d5eb3f6aeaac20844e044	2023-02-06 16:08:57.282117	\N	304	2025-05-12 14:07:32.113905	2025-04-24 19:54:54.164817	136.226.72.102	136.226.72.102	2017-10-09 19:48:46.361983	2025-06-16 16:54:05.368007	Mike Ryan	0	\N	2025-06-16 16:54:05.367814	\N	\N
15	cjbroms@gmail.com	$2a$11$OReTz57TEHaRfrbEycN8xOOJuWfcH1CKlYwgcS29UyZF0tRaAV5/2	\N	\N	2017-12-26 19:43:50.53064	228	2025-04-10 03:17:52.997689	2025-04-09 04:30:58.539379	69.48.240.119	69.48.240.119	2017-10-09 19:49:20.32102	2025-06-16 16:54:05.377185	Chris Bromery	0	\N	2025-06-16 16:54:05.37686	\N	\N
21	brickteewall@gmail.com	$2a$11$xpNLcIYdq9UxXP8AuU6yiuQetYhhu9tDBlhKfTxeYwNCoAMHj/HXa	\N	\N	2018-01-30 00:52:42.434572	187	2025-06-05 23:41:58.335734	2025-06-03 11:56:38.705942	172.226.145.164	96.233.123.37	2017-10-09 19:53:39.605188	2025-06-16 16:54:05.398038	Tommy Wall	2	\N	2025-06-16 16:54:05.397841	\N	\N
22	markrbuckley@gmail.com	$2a$11$YucS.dTYkfZMZ9Xwuwv9WetFplWkEDiaDeqnQ.fEvWxb8EeleUJbm	\N	\N	2020-05-08 12:22:21.283529	67	2024-03-22 19:46:21.10217	2024-01-14 02:20:38.864639	104.28.39.139	24.34.3.44	2017-10-09 19:54:14.807121	2025-06-16 16:54:05.406406	Mark Buckley	0	\N	2025-06-16 16:54:05.406014	\N	\N
23	amccarthy005@yahoo.com	$2a$11$JtPRq4Vevjp9NVISzb3axeVJAzM/RxffDB3g6DP3RfEv7yFqsMvbK	\N	\N	2025-04-08 02:29:08.76304	802	2025-06-06 21:24:36.35296	2025-06-04 20:06:26.892781	104.28.57.166	146.75.253.252	2017-10-09 19:54:40.761996	2025-06-16 16:54:05.412555	Alana McCarthy	2	\N	2025-06-16 16:54:05.412339	\N	\N
33	kevbuckley333@gmail.com	$2a$11$JXckAOPpIXVESlD5SzkA8uNDmGehP6GoQSfefcnuhMxyzcGIOAYh6	\N	\N	\N	55	2025-01-31 10:46:39.112008	2025-01-25 12:40:33.627098	104.28.39.138	104.28.39.128	2017-10-09 19:59:56.108006	2025-06-16 16:54:05.475587	Kevin Buckley	0	\N	2025-06-16 16:54:05.475357	\N	\N
44	lll715@aol.com	$2a$11$TQ1.mTBznepxJw1IWEs3ZeL7vO7kLgzXtkzsYRba5vqPLLHy.9176	\N	\N	\N	229	2025-03-07 13:02:15.424416	2025-03-06 13:40:37.097236	151.204.252.202	151.204.252.202	2017-12-23 18:01:13.304514	2025-06-16 16:54:05.522338	Lori Lavoie	0	\N	2025-06-16 16:54:05.521952	\N	\N
137	polcess@hotmail.com	$2a$11$1fDCig6RDscfYUVgbZ946OXUfEce6nd1BLv3/uKQWdh7jlQ4viN0K	\N	\N	\N	558	2025-06-14 15:20:07.709946	2025-05-29 18:28:15.444411	96.89.234.201	165.1.201.224	2020-11-06 18:01:24.340809	2025-06-16 16:54:05.557331	Jessica Przywara 	0	\N	2025-06-16 16:54:05.557133	\N	\N
142	ablohm@portcityair.com	$2a$11$aIdPFMmz0iam3C1rMgfTcec5fXejFmnE4fx6EDWEMVJdfI8s57SJy	\N	\N	\N	167	2025-03-19 00:31:39.152765	2025-03-17 02:21:01.836652	173.44.93.121	173.44.93.121	2020-12-06 05:40:58.102485	2025-06-16 16:54:05.563391	Andrew Blohm	0	\N	2025-06-16 16:54:05.563172	\N	\N
214	clandsman888@gmail.com	$2a$11$bqlr6wZsPGjvBDToJwpHZer9Ct6sUgpSRMF9b2VvsnUiiMsxkLCAS	cf1d30e883d695d9448de18c624a590dffadf205f8a0f58b6e70cd24629acc18	2024-10-17 21:35:13.45245	\N	0	\N	\N	\N	\N	2021-10-26 16:03:51.535139	2025-06-16 16:54:05.580923	Corey Landsman	0	\N	2025-06-16 16:54:05.580731	\N	\N
219	brkirk51@gmail.com	$2a$11$PqvdrrB5YMmFWvqiLiUC1OFnPr76FgymGhC6Gm/kO0TZrfQPVE.Y2	\N	\N	2022-02-23 13:41:46.271888	27	2024-04-24 13:19:18.434606	2024-04-20 13:16:02.824533	24.60.200.220	24.60.200.220	2021-12-06 16:16:28.119868	2025-06-16 16:54:05.592451	Bryan Kirk	0	\N	2025-06-16 16:54:05.592225	\N	\N
257	sjames1776@gmail.com	$2a$11$rDBGyTyywCX6j4qW5kTYX.X83c5kJthjR7MROba/IP33H5Mq3vXsy	a98d5a92e10d7a2d504fabb9d97447080fe0c900ed65ace3ebd8403b14cca485	2022-12-02 20:32:02.723572	2022-01-17 23:42:42.550665	30	2025-03-05 22:52:08.394576	2025-02-15 17:43:47.977456	73.61.37.214	73.61.37.214	2022-01-17 17:45:13.5621	2025-06-16 16:54:05.599773	Scott James	0	\N	2025-06-16 16:54:05.599567	\N	\N
259	tr968114@ohio.edu	$2a$11$Nv8zUt7gcs5C7GW.vYmPC.9YSx/figItoPW5pMBhEf3ivfcH1E32K	5fe4ef7615f64ee6ddb9d4500c4a23cde267f700082fdf3da686079f32afbe5f	2022-01-24 20:37:55.03225	2022-03-07 00:46:24.060161	15	2022-12-04 00:43:20.341978	2022-11-04 14:52:43.70127	100.6.64.252	100.6.173.129	2022-01-17 17:48:17.049329	2025-06-16 16:54:05.609904	Trevor Rowe	0	\N	2025-06-16 16:54:05.609359	\N	\N
260	jessicadm15@gmail.com	$2a$11$CRsqLzaE1opWqcc7XW8an.0coSIF4XYcXvVmGVR0uyYh8iTk5F1LC	\N	\N	2024-06-22 02:11:48.646892	81	2024-09-27 13:11:33.883065	2024-09-19 14:31:27.376511	100.0.193.2	100.0.193.2	2022-01-17 17:49:29.197646	2025-06-16 16:54:05.61576	Jessica Martinez	0	\N	2025-06-16 16:54:05.615573	\N	\N
261	racrateau@gmail.com	$2a$11$nOCu35LJTx0w.E6PjUytlOygQFrDZ6MIhw5enCMu90P60Edazt/ny	\N	\N	\N	84	2025-06-15 01:05:56.7032	2025-06-14 23:22:00.62301	73.89.152.151	73.89.152.151	2022-01-18 01:15:07.962318	2025-06-16 16:54:05.624673	Rachel Crateau	2	\N	2025-06-16 16:54:05.624301	\N	\N
267	dominik.airey@gmail.com	$2a$11$sseyfjJDIlS7VOqRsWCNEuUH2.TyEdpk4HvkJlFaLYnqED.Tcia02	\N	\N	\N	258	2025-06-05 17:34:18.802381	2025-06-04 14:25:54.032987	72.93.229.6	72.93.229.6	2022-02-18 16:00:50.031657	2025-06-16 16:54:05.633181	Dominik Airey	0	\N	2025-06-16 16:54:05.632981	\N	\N
289	warrenrusso@live.com	$2a$11$uE3D2gBkw1wVPRnWLzxUOeWImgd2R39i5CdSJrfbig7ANnhly9/9G	\N	\N	\N	1	2022-07-03 14:35:32.914431	2022-07-03 14:35:32.914431	71.232.120.7	71.232.120.7	2022-07-03 14:35:32.889826	2025-06-16 16:54:05.640407	Warren Russo	0	\N	2025-06-16 16:54:05.640214	\N	\N
326	zachbassett98@gmail.com	$2a$11$PcdGw3qIORfP3nKiO6UDl.LAoPAqda7F1atCNbvuz733pWPyc8Km2	\N	\N	\N	3	2024-10-20 22:50:51.155551	2023-08-11 10:31:49.626697	100.0.162.158	108.34.227.13	2023-02-01 20:16:16.473226	2025-06-16 16:54:05.653362	Zach Bassett	0	\N	2025-06-16 16:54:05.653138	\N	\N
328	stro718@gmail.com	$2a$11$mGi7QKNvdnHnn5cpDP86rubG3VwhU2Qro4OWjNHjUTdV8GQk0G6HS	\N	\N	2023-03-13 18:35:14.034392	40	2025-02-21 19:41:13.08869	2025-02-20 20:37:51.699437	73.249.82.173	73.249.82.173	2023-02-17 17:15:47.032619	2025-06-16 16:54:05.663358	Matt Silvestro	0	\N	2025-06-16 16:54:05.663008	\N	\N
360	brandon_wallace1796@yahoo.com	$2a$11$boqOel/.0wHKvvreIF9sMeAp5bysithI3NA6SVXw98QO8YTRZkM7m	\N	\N	\N	1	2024-07-08 13:03:32.583416	2024-07-08 13:03:32.583416	184.171.230.23	184.171.230.23	2024-07-08 13:03:32.579504	2025-06-16 16:54:05.751026	wYSFnPKHOCdmp	0	\N	2025-06-16 16:54:05.75082	\N	\N
361	paul_williams4ftw@outlook.com	$2a$11$T7/d6dfXwcG0WD2bXz/X..lEzouFvS8EHU9EP4PBksCqGjJEStDyu	\N	\N	\N	1	2024-07-14 10:29:41.742943	2024-07-14 10:29:41.742943	102.0.7.232	102.0.7.232	2024-07-14 10:29:41.739382	2025-06-16 16:54:05.759393	nMZkzbjpSCvUFAfH	0	\N	2025-06-16 16:54:05.759201	\N	\N
362	rjmirkin@aol.com	$2a$11$tMac3DQTx0I0lNZCAlVTGOrFRDZJnYHda4e.3cIKTGN2LeAYU28qi	\N	\N	2024-07-15 14:30:41.523318	1	2024-07-15 14:30:41.528726	2024-07-15 14:30:41.528726	73.100.215.188	73.100.215.188	2024-07-14 23:13:49.801625	2025-06-16 16:54:05.765278	Rick Mirkin	0	\N	2025-06-16 16:54:05.765085	\N	\N
365	daniel31allamongq0p@outlook.com	$2a$11$L4ZKuHeo1tf5Vc3sMh1QR.fm.v/8zhiWLaIDIxtnVPLA647pPcMIK	\N	\N	\N	1	2024-08-01 18:15:41.124532	2024-08-01 18:15:41.124532	45.155.120.203	45.155.120.203	2024-08-01 18:15:41.120753	2025-06-16 16:54:05.788594	aRIpEnCYcXD	0	\N	2025-06-16 16:54:05.788242	\N	\N
366	jenna.l.whitney@gmail.com	$2a$11$V5Z/gfEuEwjQPEIahmUiNOpdQQB6IxGSXTEIhH91HoeUEw.CMxuJK	\N	\N	\N	45	2025-04-20 14:36:22.453635	2025-04-02 00:21:56.420024	173.48.235.53	24.61.184.154	2024-08-13 22:15:09.541939	2025-06-16 16:54:05.796194	Jenna Whitney	0	\N	2025-06-16 16:54:05.795829	\N	\N
369	glenn71harkerhjr@outlook.com	$2a$11$o8FA5cMMgLhRnjubWX0Cg.PbSPraFL5CNkYLgqBDOhP3OZJbqlCEG	\N	\N	\N	1	2024-09-02 04:17:28.828384	2024-09-02 04:17:28.828384	203.189.149.85	203.189.149.85	2024-09-02 04:17:28.824549	2025-06-16 16:54:05.815247	DYkjZMcidRuFBsLr	0	\N	2025-06-16 16:54:05.815062	\N	\N
370	zrenec@aol.com	$2a$11$oETi4wpDEu79BHBqgWs55umsn2lTw5aXfB.WcQ/RZqyy55HjW5jPi	\N	\N	2024-11-07 18:56:50.022358	1	2024-11-07 18:56:50.047929	2024-11-07 18:56:50.047929	75.67.99.192	75.67.99.192	2024-11-04 23:38:08.073113	2025-06-16 16:54:05.823688	Marc & Linda Courtemarche	0	\N	2025-06-16 16:54:05.823475	\N	\N
371	argyles1@verizon.net	$2a$11$LJPIoins7aczvnzQevPPL.vPAnsW7blmnAMgy3Mi6p1CoRoGx86ei	\N	\N	\N	1	2024-11-23 16:52:10.783092	2024-11-23 16:52:10.783092	108.26.171.212	108.26.171.212	2024-11-05 00:09:45.081889	2025-06-16 16:54:05.829947	Argery & Marybeth Katzounas	0	\N	2025-06-16 16:54:05.829527	\N	\N
469	christianbortnick51@gmail.com	$2a$11$oQIFJLj7HAuHVEMZS1berOphah.PKurPXe8HF6oKF.NJ0IlLlBGzm	\N	\N	2025-03-23 12:58:54.836848	6	2025-04-24 23:26:42.760954	2025-03-24 21:41:55.20862	166.182.250.254	65.175.214.197	2025-03-19 13:47:21.59461	2025-06-16 16:54:05.86067	Christian Bortnick	0	\N	2025-06-16 16:54:05.860427	\N	\N
2	jdobermill@yahoo.com	$2a$11$n0Lb4L48uG/Y7sJwzGlmvOjjJdyDO0jlS8QXp.PwLwZuoTuw7bnZe	20b784a5ee0dcd58b797ac1647c537c3f2d522c7a16974845d2fbaa62e99d095	2018-07-06 14:56:08.99948	2025-03-31 22:48:03.480593	495	2025-06-05 20:33:00.875023	2025-06-04 06:58:14.50439	24.198.131.38	108.26.193.205	2017-10-09 19:37:10.137978	2025-06-16 16:54:05.263479	John Dobermiller	0	\N	2025-06-16 16:54:05.262898	\N	\N
7	jelloshot@gmail.com	$2a$11$j2mxCyXJ32IXMtr.FUm3BeZYaevW3.NiQ3yzX25MAcJrORy14UBi2	\N	\N	\N	48	2025-03-06 21:12:50.879159	2025-02-25 21:33:19.334578	50.216.109.14	50.216.109.14	2017-10-09 19:40:44.606997	2025-06-16 16:54:05.31481	Nung Garcia	0	\N	2025-06-16 16:54:05.314602	\N	\N
20	dantshults@gmail.com	$2a$11$o9lJduWFeA519VVWrtehuOItAavioCAv5nR00ansJPMc8UMOXG8QW	e067bf4f3ca84fcb9e5e7998e351ebfb8c2dcbf2ad2173bdad098acb8559661d	2024-06-25 13:36:33.961628	\N	167	2025-06-07 03:47:43.7358	2025-06-04 12:58:39.677002	24.198.131.38	174.242.64.226	2017-10-09 19:53:19.504125	2025-06-16 16:54:05.392614	Dan Schults	0	\N	2025-06-16 16:54:05.392417	\N	\N
47	ablohm@blohmgroup.com	$2a$11$RHQ8z2dIQDkV8SquCu0NUO8vLCTy5Y05.HpOR6vMwg0AviaRgkZB2	fd8d918b8133812b7041a48ff8b447299ddd30f2654b4e20159a91d643295f85	2020-12-06 05:39:29.511448	2019-12-26 18:12:44.410941	36	2020-05-09 21:51:01.443714	2020-02-15 19:20:42.278838	66.31.5.220	72.227.81.54	2019-02-13 00:41:24.566758	2025-06-16 16:54:05.529069	Andrew Blohm	0	\N	2025-06-16 16:54:05.528877	\N	\N
51	murphyn318@gmail.com	$2a$11$ACz02ly6JdCfhZSI15bgdOmTeZZEtBSGFm4eQwKXRJzGtIpRXVsbW	5a88925a6d1c852e9557ebaf44c11b3bdd16e7b06352807ea5d8434a876708e6	2023-08-06 13:26:44.545813	\N	1174	2025-06-13 14:46:42.228255	2025-06-10 22:04:34.427578	73.186.181.209	166.198.21.102	2019-09-08 18:16:11.40623	2025-06-16 16:54:05.542687	Nancy Murphy	0	\N	2025-06-16 16:54:05.54249	\N	\N
153	frink@live.com	$2a$11$wLUtPavzyDcIp8cdjCTgCuNnX9lHSpjp53G.HUfdl9HxPx3ZJh1RS	\N	\N	2023-12-28 10:50:14.416352	2308	2025-05-22 19:53:10.281533	2025-05-21 22:11:35.621381	73.68.184.55	73.68.184.55	2021-03-18 21:25:21.364459	2025-06-16 16:54:05.568476	Perry Frink	0	\N	2025-06-16 16:54:05.568287	\N	\N
324	hkkornack@gmail.com	$2a$11$dgV6sk3kTMMkJbbpVmsJEOlrS.vmDl56TyJ0ANJFz/rjTLLqIEp7K	\N	\N	\N	75	2025-06-15 00:43:19.895259	2025-06-11 00:06:58.05105	24.198.148.168	72.159.224.138	2023-01-27 19:28:22.249772	2025-06-16 16:54:05.648096	Heather Kornack	0	\N	2025-06-16 16:54:05.64783	\N	\N
403	sunnyraeharrison@gmail.com	$2a$11$Caj01SZTPGXFiwlmukWFzeEixvq4yorcMWV1qrpn2HAK35L5Fzque	\N	\N	\N	0	\N	\N	\N	\N	2025-01-04 20:15:50.111145	2025-06-16 16:54:05.83569	Sunny Uehar	0	\N	2025-06-16 16:54:05.835504	\N	\N
404	aaron.uehara@gmail.com	$2a$11$TBE2J7Uenb4UFDbVnKE7FuRmOyWBEankI7bCcNYBuOprz3IodAK52	\N	\N	2025-02-08 21:24:48.522057	26	2025-06-14 16:15:12.585331	2025-06-06 10:48:15.980678	174.242.130.76	73.68.28.66	2025-01-04 20:17:31.542326	2025-06-16 16:54:05.843429	Aaron Uehara	0	\N	2025-06-16 16:54:05.843231	\N	\N
436	tylerbuckeridge@gmail.com	$2a$11$HPlecTrH0SaciCpTBTpXVeEJBo4wsMz2fG.qHQyeJQbOadwZeIX3y	\N	\N	\N	22	2025-06-02 10:35:42.578871	2025-06-01 12:28:46.190557	72.74.154.124	107.122.189.79	2025-02-08 03:28:45.770213	2025-06-16 16:54:05.853277	Tyler Buckeridge	0	\N	2025-06-16 16:54:05.852598	\N	\N
502	chris.candelora@gmail.com	$2a$12$bX/ZTtEqYKDmgsQ.jNBy6ONfpzk3j6mbxcisDLXYfnQ2oud4Fkqmm	\N	\N	\N	5	2025-06-16 22:50:32.281421	2025-06-16 22:50:01.179937	::1	::1	2025-06-16 19:33:04.242441	2025-06-16 22:50:32.281618	Chris	\N	\N	2025-06-16 19:33:04.239272	\N	\N
1	chris@inogus.com	$2a$12$QZSnbBSju4k5hiEt/JCAuOzA5lWh/JlYrshGVZsfY2kIHCFMIoE9i	\N	\N	\N	91	2025-06-16 20:14:42.893187	2025-06-16 18:05:47.408458	::1	::1	2017-08-22 21:43:03.521041	2025-06-16 20:14:42.89338	Chris Candelora	2	\N	2025-06-16 16:53:00.19858	\N	\N
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1, false);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1, false);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 1, false);


--
-- Name: ckeditor_assets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.ckeditor_assets_id_seq', 1, false);


--
-- Name: notes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.notes_id_seq', 13, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, false);


--
-- Name: public_pins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.public_pins_id_seq', 1, false);


--
-- Name: reservation_weeks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reservation_weeks_id_seq', 786, true);


--
-- Name: reservations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.reservations_id_seq', 4261, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 502, true);


--
-- Name: action_text_rich_texts action_text_rich_texts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.action_text_rich_texts
    ADD CONSTRAINT action_text_rich_texts_pkey PRIMARY KEY (id);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: active_storage_variant_records active_storage_variant_records_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT active_storage_variant_records_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: ckeditor_assets ckeditor_assets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ckeditor_assets
    ADD CONSTRAINT ckeditor_assets_pkey PRIMARY KEY (id);


--
-- Name: notes notes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: public_pins public_pins_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.public_pins
    ADD CONSTRAINT public_pins_pkey PRIMARY KEY (id);


--
-- Name: reservation_weeks reservation_weeks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservation_weeks
    ADD CONSTRAINT reservation_weeks_pkey PRIMARY KEY (id);


--
-- Name: reservations reservations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_action_text_rich_texts_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_action_text_rich_texts_uniqueness ON public.action_text_rich_texts USING btree (record_type, record_id, name);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_active_storage_variant_records_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_variant_records_uniqueness ON public.active_storage_variant_records USING btree (blob_id, variation_digest);


--
-- Name: index_ckeditor_assets_on_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_ckeditor_assets_on_type ON public.ckeditor_assets USING btree (type);


--
-- Name: index_public_pins_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_public_pins_on_user_id ON public.public_pins USING btree (user_id);


--
-- Name: index_reservations_on_reservation_week_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reservations_on_reservation_week_id ON public.reservations USING btree (reservation_week_id);


--
-- Name: index_reservations_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_reservations_on_user_id ON public.reservations USING btree (user_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: active_storage_variant_records fk_rails_993965df05; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_variant_records
    ADD CONSTRAINT fk_rails_993965df05 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

