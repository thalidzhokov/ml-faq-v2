--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3 (Debian 10.3-1.pgdg90+1)
-- Dumped by pg_dump version 10.3 (Debian 10.3-1.pgdg90+1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO app;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO app;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO app;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO app;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO app;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO app;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO app;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO app;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO app;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO app;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO app;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO app;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO app;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO app;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO app;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO app;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO app;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO app;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO app;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO app;

--
-- Name: faq_answer; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.faq_answer (
    id integer NOT NULL,
    answer text
);


ALTER TABLE public.faq_answer OWNER TO app;

--
-- Name: faq_answer_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.faq_answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_answer_id_seq OWNER TO app;

--
-- Name: faq_answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.faq_answer_id_seq OWNED BY public.faq_answer.id;


--
-- Name: faq_question; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.faq_question (
    id integer NOT NULL,
    question text,
    answer_id_id integer,
    answer_label integer
);


ALTER TABLE public.faq_question OWNER TO app;

--
-- Name: faq_question_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.faq_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_question_id_seq OWNER TO app;

--
-- Name: faq_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.faq_question_id_seq OWNED BY public.faq_question.id;


--
-- Name: faq_rating; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.faq_rating (
    id integer NOT NULL,
    name character varying(128),
    vote_score integer
);


ALTER TABLE public.faq_rating OWNER TO app;

--
-- Name: faq_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.faq_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_rating_id_seq OWNER TO app;

--
-- Name: faq_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.faq_rating_id_seq OWNED BY public.faq_rating.id;


--
-- Name: faq_s7answer; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.faq_s7answer (
    id integer NOT NULL,
    answer text
);


ALTER TABLE public.faq_s7answer OWNER TO app;

--
-- Name: faq_s7answer_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.faq_s7answer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_s7answer_id_seq OWNER TO app;

--
-- Name: faq_s7answer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.faq_s7answer_id_seq OWNED BY public.faq_s7answer.id;


--
-- Name: faq_s7data; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.faq_s7data (
    id integer NOT NULL,
    question text,
    answer text
);


ALTER TABLE public.faq_s7data OWNER TO app;

--
-- Name: faq_s7data_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.faq_s7data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_s7data_id_seq OWNER TO app;

--
-- Name: faq_s7data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.faq_s7data_id_seq OWNED BY public.faq_s7data.id;


--
-- Name: faq_s7question; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.faq_s7question (
    id integer NOT NULL,
    question text,
    answer_label integer,
    answer_id_id integer
);


ALTER TABLE public.faq_s7question OWNER TO app;

--
-- Name: faq_s7question_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.faq_s7question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_s7question_id_seq OWNER TO app;

--
-- Name: faq_s7question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.faq_s7question_id_seq OWNED BY public.faq_s7question.id;


--
-- Name: faq_statistic; Type: TABLE; Schema: public; Owner: app
--

CREATE TABLE public.faq_statistic (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    question text,
    answer text,
    right_answer text,
    user_id integer NOT NULL
);


ALTER TABLE public.faq_statistic OWNER TO app;

--
-- Name: faq_statistic_id_seq; Type: SEQUENCE; Schema: public; Owner: app
--

CREATE SEQUENCE public.faq_statistic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_statistic_id_seq OWNER TO app;

--
-- Name: faq_statistic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: app
--

ALTER SEQUENCE public.faq_statistic_id_seq OWNED BY public.faq_statistic.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: faq_answer id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_answer ALTER COLUMN id SET DEFAULT nextval('public.faq_answer_id_seq'::regclass);


--
-- Name: faq_question id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_question ALTER COLUMN id SET DEFAULT nextval('public.faq_question_id_seq'::regclass);


--
-- Name: faq_rating id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_rating ALTER COLUMN id SET DEFAULT nextval('public.faq_rating_id_seq'::regclass);


--
-- Name: faq_s7answer id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_s7answer ALTER COLUMN id SET DEFAULT nextval('public.faq_s7answer_id_seq'::regclass);


--
-- Name: faq_s7data id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_s7data ALTER COLUMN id SET DEFAULT nextval('public.faq_s7data_id_seq'::regclass);


--
-- Name: faq_s7question id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_s7question ALTER COLUMN id SET DEFAULT nextval('public.faq_s7question_id_seq'::regclass);


--
-- Name: faq_statistic id; Type: DEFAULT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_statistic ALTER COLUMN id SET DEFAULT nextval('public.faq_statistic_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add answer	8	add_answer
30	Can change answer	8	change_answer
31	Can delete answer	8	delete_answer
32	Can view answer	8	view_answer
33	Can add question	9	add_question
34	Can change question	9	change_question
35	Can delete question	9	delete_question
36	Can view question	9	view_question
37	Can add rating	10	add_rating
38	Can change rating	10	change_rating
39	Can delete rating	10	delete_rating
40	Can view rating	10	view_rating
41	Can add statistic	11	add_statistic
42	Can change statistic	11	change_statistic
43	Can delete statistic	11	delete_statistic
44	Can view statistic	11	view_statistic
45	Can add s7 data	12	add_s7data
46	Can change s7 data	12	change_s7data
47	Can delete s7 data	12	delete_s7data
48	Can view s7 data	12	view_s7data
49	Can add s7 question	13	add_s7question
50	Can change s7 question	13	change_s7question
51	Can delete s7 question	13	delete_s7question
52	Can view s7 question	13	view_s7question
53	Can add s7 answer	14	add_s7answer
54	Can change s7 answer	14	change_s7answer
55	Can delete s7 answer	14	delete_s7answer
56	Can view s7 answer	14	view_s7answer
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$120000$HpOn4aFKhBzn$81N5q8g20EJHWVn89neqX2KfIg0XNHGNepFqdRu3N2E=	2019-02-13 16:58:28.350357+00	t	user			brl@brl.ru	t	t	2018-11-27 11:42:03.66316+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
1838b2598179977f52a9f7bb431fc10f34e88668	2018-11-27 11:42:03.858276+00	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-11-27 11:49:21.931264+00	0	  В письме с уведомлением внизу есть возможность отписаться от получения уведомлений. 	1	new through import_export	8	1
2	2018-11-27 11:49:21.936139+00	0	  В письме с уведомлением внизу есть возможность отписаться от получения уведомлений. 	2	update through import_export	8	1
3	2018-11-27 11:49:21.938172+00	0	  В письме с уведомлением внизу есть возможность отписаться от получения уведомлений. 	2	update through import_export	8	1
4	2018-11-27 11:49:21.940143+00	0	  В письме с уведомлением внизу есть возможность отписаться от получения уведомлений. 	2	update through import_export	8	1
5	2018-11-27 11:49:21.941764+00	0	  В письме с уведомлением внизу есть возможность отписаться от получения уведомлений. 	2	update through import_export	8	1
6	2018-11-27 11:49:21.943706+00	1	  Возможность редактировать прогноз есть, но только текстовую его часть, заголовки нельзя. Причем исправлять возможные опечатки необходимо сразу, поскольку после того, как материал будет принят модера	1	new through import_export	8	1
7	2018-11-27 11:49:21.945678+00	1	  Возможность редактировать прогноз есть, но только текстовую его часть, заголовки нельзя. Причем исправлять возможные опечатки необходимо сразу, поскольку после того, как материал будет принят модера	2	update through import_export	8	1
8	2018-11-27 11:49:21.947635+00	1	  Возможность редактировать прогноз есть, но только текстовую его часть, заголовки нельзя. Причем исправлять возможные опечатки необходимо сразу, поскольку после того, как материал будет принят модера	2	update through import_export	8	1
9	2018-11-27 11:49:21.94971+00	1	  Возможность редактировать прогноз есть, но только текстовую его часть, заголовки нельзя. Причем исправлять возможные опечатки необходимо сразу, поскольку после того, как материал будет принят модера	2	update through import_export	8	1
10	2018-11-27 11:49:21.951439+00	1	  Возможность редактировать прогноз есть, но только текстовую его часть, заголовки нельзя. Причем исправлять возможные опечатки необходимо сразу, поскольку после того, как материал будет принят модера	2	update through import_export	8	1
11	2018-11-27 11:49:21.955498+00	1	  Возможность редактировать прогноз есть, но только текстовую его часть, заголовки нельзя. Причем исправлять возможные опечатки необходимо сразу, поскольку после того, как материал будет принят модера	2	update through import_export	8	1
12	2018-11-27 11:49:21.95805+00	2	  У РБ есть не только сайт, но и паблики в социальных сетях.  bookmakersrating   BookmakerRatings   BookmakersRating      bookierating  Конкурсы проводятся не только на сайте, но и в наших пабликах. Ч	1	new through import_export	8	1
13	2018-11-27 11:49:21.960098+00	2	  У РБ есть не только сайт, но и паблики в социальных сетях.  bookmakersrating   BookmakerRatings   BookmakersRating      bookierating  Конкурсы проводятся не только на сайте, но и в наших пабликах. Ч	2	update through import_export	8	1
14	2018-11-27 11:49:21.961942+00	2	  У РБ есть не только сайт, но и паблики в социальных сетях.  bookmakersrating   BookmakerRatings   BookmakersRating      bookierating  Конкурсы проводятся не только на сайте, но и в наших пабликах. Ч	2	update through import_export	8	1
15	2018-11-27 11:49:21.963913+00	2	  У РБ есть не только сайт, но и паблики в социальных сетях.  bookmakersrating   BookmakerRatings   BookmakersRating      bookierating  Конкурсы проводятся не только на сайте, но и в наших пабликах. Ч	2	update through import_export	8	1
16	2018-11-27 11:49:21.965767+00	3	 1xBet работает по лицензии Кюрасао, сайт блокируется на территории РФ. Играть на этом сайте с территории РФ получится только с использованием методик обхода блокировки доступа.  На территории РФ абсо	1	new through import_export	8	1
17	2018-11-27 11:49:21.969082+00	3	 1xBet работает по лицензии Кюрасао, сайт блокируется на территории РФ. Играть на этом сайте с территории РФ получится только с использованием методик обхода блокировки доступа.  На территории РФ абсо	2	update through import_export	8	1
18	2018-11-27 11:49:21.971159+00	3	 1xBet работает по лицензии Кюрасао, сайт блокируется на территории РФ. Играть на этом сайте с территории РФ получится только с использованием методик обхода блокировки доступа.  На территории РФ абсо	2	update through import_export	8	1
19	2018-11-27 11:49:21.973321+00	3	 1xBet работает по лицензии Кюрасао, сайт блокируется на территории РФ. Играть на этом сайте с территории РФ получится только с использованием методик обхода блокировки доступа.  На территории РФ абсо	2	update through import_export	8	1
20	2018-11-27 11:49:21.975696+00	3	 1xBet работает по лицензии Кюрасао, сайт блокируется на территории РФ. Играть на этом сайте с территории РФ получится только с использованием методик обхода блокировки доступа.  На территории РФ абсо	2	update through import_export	8	1
307	2018-11-27 11:49:22.628803+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
21	2018-11-27 11:49:21.983541+00	75	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	1	new through import_export	8	1
22	2018-11-27 11:49:21.991909+00	75	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	2	update through import_export	8	1
23	2018-11-27 11:49:21.995093+00	75	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	2	update through import_export	8	1
24	2018-11-27 11:49:21.997954+00	75	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	2	update through import_export	8	1
25	2018-11-27 11:49:22.000545+00	4	 Все отзывы проходят модерацию, по этому могут быть опубликованы с опозданием.  	1	new through import_export	8	1
26	2018-11-27 11:49:22.00311+00	4	 Все отзывы проходят модерацию, по этому могут быть опубликованы с опозданием.  	2	update through import_export	8	1
27	2018-11-27 11:49:22.005423+00	4	 Все отзывы проходят модерацию, по этому могут быть опубликованы с опозданием.  	2	update through import_export	8	1
28	2018-11-27 11:49:22.007589+00	4	 Все отзывы проходят модерацию, по этому могут быть опубликованы с опозданием.  	2	update through import_export	8	1
29	2018-11-27 11:49:22.009725+00	4	 Все отзывы проходят модерацию, по этому могут быть опубликованы с опозданием.  	2	update through import_export	8	1
30	2018-11-27 11:49:22.011769+00	5	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре конторы.  	1	new through import_export	8	1
31	2018-11-27 11:49:22.013764+00	5	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре конторы.  	2	update through import_export	8	1
32	2018-11-27 11:49:22.015695+00	5	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре конторы.  	2	update through import_export	8	1
33	2018-11-27 11:49:22.018057+00	5	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре конторы.  	2	update through import_export	8	1
34	2018-11-27 11:49:22.019998+00	6	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 	1	new through import_export	8	1
35	2018-11-27 11:49:22.022088+00	6	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 	2	update through import_export	8	1
36	2018-11-27 11:49:22.023879+00	6	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 	2	update through import_export	8	1
37	2018-11-27 11:49:22.025926+00	7	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	1	new through import_export	8	1
38	2018-11-27 11:49:22.027795+00	7	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
39	2018-11-27 11:49:22.029774+00	7	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
40	2018-11-27 11:49:22.031555+00	7	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
41	2018-11-27 11:49:22.033648+00	7	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
42	2018-11-27 11:49:22.035516+00	8	 Если Вы добавили прогноз, то он в любом случае будет проверен. В связи с рестартом конкурса прогнозов объем прогнозов очень большой, поэтому обработка идет с задержкой. Извините за неудобства. 	1	new through import_export	8	1
308	2018-11-27 11:49:22.630664+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
43	2018-11-27 11:49:22.037157+00	8	 Если Вы добавили прогноз, то он в любом случае будет проверен. В связи с рестартом конкурса прогнозов объем прогнозов очень большой, поэтому обработка идет с задержкой. Извините за неудобства. 	2	update through import_export	8	1
44	2018-11-27 11:49:22.038727+00	8	 Если Вы добавили прогноз, то он в любом случае будет проверен. В связи с рестартом конкурса прогнозов объем прогнозов очень большой, поэтому обработка идет с задержкой. Извините за неудобства. 	2	update through import_export	8	1
45	2018-11-27 11:49:22.040318+00	8	 Если Вы добавили прогноз, то он в любом случае будет проверен. В связи с рестартом конкурса прогнозов объем прогнозов очень большой, поэтому обработка идет с задержкой. Извините за неудобства. 	2	update through import_export	8	1
46	2018-11-27 11:49:22.042008+00	9	 Если пополнить два счета с одной карты, то это мультиакк. Если вы вынуждены играть с одного устройства, тогда скажите об этом конторе, и это не будет считаться мультиакком.  	1	new through import_export	8	1
47	2018-11-27 11:49:22.043725+00	9	 Если пополнить два счета с одной карты, то это мультиакк. Если вы вынуждены играть с одного устройства, тогда скажите об этом конторе, и это не будет считаться мультиакком.  	2	update through import_export	8	1
48	2018-11-27 11:49:22.04533+00	9	 Если пополнить два счета с одной карты, то это мультиакк. Если вы вынуждены играть с одного устройства, тогда скажите об этом конторе, и это не будет считаться мультиакком.  	2	update through import_export	8	1
49	2018-11-27 11:49:22.04698+00	9	 Если пополнить два счета с одной карты, то это мультиакк. Если вы вынуждены играть с одного устройства, тогда скажите об этом конторе, и это не будет считаться мультиакком.  	2	update through import_export	8	1
50	2018-11-27 11:49:22.048951+00	9	 Если пополнить два счета с одной карты, то это мультиакк. Если вы вынуждены играть с одного устройства, тогда скажите об этом конторе, и это не будет считаться мультиакком.  	2	update through import_export	8	1
51	2018-11-27 11:49:22.050834+00	10	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	1	new through import_export	8	1
52	2018-11-27 11:49:22.052586+00	10	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
53	2018-11-27 11:49:22.05432+00	10	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
54	2018-11-27 11:49:22.056131+00	10	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
55	2018-11-27 11:49:22.057945+00	11	 К ответу могут быть призваны букмекеры, а не их клиенты. 	1	new through import_export	8	1
56	2018-11-27 11:49:22.059787+00	11	 К ответу могут быть призваны букмекеры, а не их клиенты. 	2	update through import_export	8	1
57	2018-11-27 11:49:22.061881+00	11	 К ответу могут быть призваны букмекеры, а не их клиенты. 	2	update through import_export	8	1
58	2018-11-27 11:49:22.063751+00	11	 К ответу могут быть призваны букмекеры, а не их клиенты. 	2	update through import_export	8	1
59	2018-11-27 11:49:22.065399+00	11	 К ответу могут быть призваны букмекеры, а не их клиенты. 	2	update through import_export	8	1
60	2018-11-27 11:49:22.067171+00	12	 К сожалению сейчас у пользователей нет такой возможности, но мы усердно работаем над добавлением этой и много других функций. 	1	new through import_export	8	1
61	2018-11-27 11:49:22.069026+00	12	 К сожалению сейчас у пользователей нет такой возможности, но мы усердно работаем над добавлением этой и много других функций. 	2	update through import_export	8	1
62	2018-11-27 11:49:22.070838+00	12	 К сожалению сейчас у пользователей нет такой возможности, но мы усердно работаем над добавлением этой и много других функций. 	2	update through import_export	8	1
63	2018-11-27 11:49:22.07266+00	12	 К сожалению сейчас у пользователей нет такой возможности, но мы усердно работаем над добавлением этой и много других функций. 	2	update through import_export	8	1
64	2018-11-27 11:49:22.074722+00	22	 Создайте жалобу на нашем сайте. Как правило, после разбирательств по таким жалобам выясняется, что документы поддельные.  	1	new through import_export	8	1
309	2018-11-27 11:49:22.632411+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
65	2018-11-27 11:49:22.077011+00	22	 Создайте жалобу на нашем сайте. Как правило, после разбирательств по таким жалобам выясняется, что документы поддельные.  	2	update through import_export	8	1
66	2018-11-27 11:49:22.079514+00	22	 Создайте жалобу на нашем сайте. Как правило, после разбирательств по таким жалобам выясняется, что документы поддельные.  	2	update through import_export	8	1
67	2018-11-27 11:49:22.082317+00	22	 Создайте жалобу на нашем сайте. Как правило, после разбирательств по таким жалобам выясняется, что документы поддельные.  	2	update through import_export	8	1
68	2018-11-27 11:49:22.085007+00	88	Можно привязать карту платежной системы, например, Skrill. Если возможности оформить такую карту нет, то да, обязательно. Но зависит от БК.	1	new through import_export	8	1
69	2018-11-27 11:49:22.088193+00	88	Можно привязать карту платежной системы, например, Skrill. Если возможности оформить такую карту нет, то да, обязательно. Но зависит от БК.	2	update through import_export	8	1
70	2018-11-27 11:49:22.090447+00	88	Можно привязать карту платежной системы, например, Skrill. Если возможности оформить такую карту нет, то да, обязательно. Но зависит от БК.	2	update through import_export	8	1
71	2018-11-27 11:49:22.092614+00	88	Можно привязать карту платежной системы, например, Skrill. Если возможности оформить такую карту нет, то да, обязательно. Но зависит от БК.	2	update through import_export	8	1
72	2018-11-27 11:49:22.094701+00	13	 Мы принимаем все замечания и предложения от наших пользователей. Изменения будутобязательно внесены  порядке приоритета. Следите за новостями!	1	new through import_export	8	1
73	2018-11-27 11:49:22.097345+00	13	 Мы принимаем все замечания и предложения от наших пользователей. Изменения будутобязательно внесены  порядке приоритета. Следите за новостями!	2	update through import_export	8	1
74	2018-11-27 11:49:22.099739+00	13	 Мы принимаем все замечания и предложения от наших пользователей. Изменения будутобязательно внесены  порядке приоритета. Следите за новостями!	2	update through import_export	8	1
75	2018-11-27 11:49:22.102132+00	13	 Мы принимаем все замечания и предложения от наших пользователей. Изменения будутобязательно внесены  порядке приоритета. Следите за новостями!	2	update through import_export	8	1
76	2018-11-27 11:49:22.104431+00	14	 На почту присылается ответ о том, почему прогноз не прошел модерацию. Обычные причины — низкий уровень грамотности описания текста прогноза, опоздание по срокам, отсутствие аргументации.  	1	new through import_export	8	1
77	2018-11-27 11:49:22.10666+00	14	 На почту присылается ответ о том, почему прогноз не прошел модерацию. Обычные причины — низкий уровень грамотности описания текста прогноза, опоздание по срокам, отсутствие аргументации.  	2	update through import_export	8	1
78	2018-11-27 11:49:22.109007+00	14	 На почту присылается ответ о том, почему прогноз не прошел модерацию. Обычные причины — низкий уровень грамотности описания текста прогноза, опоздание по срокам, отсутствие аргументации.  	2	update through import_export	8	1
79	2018-11-27 11:49:22.111181+00	14	 На почту присылается ответ о том, почему прогноз не прошел модерацию. Обычные причины — низкий уровень грамотности описания текста прогноза, опоздание по срокам, отсутствие аргументации.  	2	update through import_export	8	1
80	2018-11-27 11:49:22.113335+00	15	 Нажмите на вид спорта, вы правы, сначала отображаются события live, опуститесь ниже и увидите события прематч. 	1	new through import_export	8	1
81	2018-11-27 11:49:22.115726+00	15	 Нажмите на вид спорта, вы правы, сначала отображаются события live, опуститесь ниже и увидите события прематч. 	2	update through import_export	8	1
82	2018-11-27 11:49:22.117992+00	15	 Нажмите на вид спорта, вы правы, сначала отображаются события live, опуститесь ниже и увидите события прематч. 	2	update through import_export	8	1
83	2018-11-27 11:49:22.120767+00	15	 Нажмите на вид спорта, вы правы, сначала отображаются события live, опуститесь ниже и увидите события прематч. 	2	update through import_export	8	1
84	2018-11-27 11:49:22.123471+00	17	 Напишите на почту, вашу группу рассмотрят для добавления в список капперов.  Здесь  представлены критерии оценки капперов. Сообщества мы не рекламируем.  	1	new through import_export	8	1
85	2018-11-27 11:49:22.126095+00	17	 Напишите на почту, вашу группу рассмотрят для добавления в список капперов.  Здесь  представлены критерии оценки капперов. Сообщества мы не рекламируем.  	2	update through import_export	8	1
86	2018-11-27 11:49:22.128818+00	16	 Напишите на почту, вашу группу рассмотрят для добавления в список капперов.  Есть критерии оценки капперов. Сообщества мы не рекламируем.  	1	new through import_export	8	1
155	2018-11-27 11:49:22.290528+00	33	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	2	update through import_export	8	1
87	2018-11-27 11:49:22.131063+00	17	 Напишите на почту, вашу группу рассмотрят для добавления в список капперов.  Здесь  представлены критерии оценки капперов. Сообщества мы не рекламируем.  	2	update through import_export	8	1
88	2018-11-27 11:49:22.133466+00	18	 Нужно соответствовать нашим  критериям  и пройти проверку в течении одного месяца.  	1	new through import_export	8	1
89	2018-11-27 11:49:22.135773+00	18	 Нужно соответствовать нашим  критериям  и пройти проверку в течении одного месяца.  	2	update through import_export	8	1
90	2018-11-27 11:49:22.138093+00	18	 Нужно соответствовать нашим  критериям  и пройти проверку в течении одного месяца.  	2	update through import_export	8	1
91	2018-11-27 11:49:22.140025+00	18	 Нужно соответствовать нашим  критериям  и пройти проверку в течении одного месяца.  	2	update through import_export	8	1
92	2018-11-27 11:49:22.142237+00	19	 Обратитесь к капперу. 	1	new through import_export	8	1
93	2018-11-27 11:49:22.144989+00	19	 Обратитесь к капперу. 	2	update through import_export	8	1
94	2018-11-27 11:49:22.147731+00	19	 Обратитесь к капперу. 	2	update through import_export	8	1
95	2018-11-27 11:49:22.150573+00	19	 Обратитесь к капперу. 	2	update through import_export	8	1
96	2018-11-27 11:49:22.153344+00	36	В большинстве хороших букмекерских контор исправляют такие опечатки. Ни о какой блокировке обычно не идет речь.	1	new through import_export	8	1
97	2018-11-27 11:49:22.155459+00	36	В большинстве хороших букмекерских контор исправляют такие опечатки. Ни о какой блокировке обычно не идет речь.	2	update through import_export	8	1
98	2018-11-27 11:49:22.157565+00	36	В большинстве хороших букмекерских контор исправляют такие опечатки. Ни о какой блокировке обычно не идет речь.	2	update through import_export	8	1
99	2018-11-27 11:49:22.159764+00	36	В большинстве хороших букмекерских контор исправляют такие опечатки. Ни о какой блокировке обычно не идет речь.	2	update through import_export	8	1
100	2018-11-27 11:49:22.162039+00	37	В конторах с оценкой «5» и «4» в нашем рейтинге, которые мы рекомендуем, за «догон» не режут, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	1	new through import_export	8	1
101	2018-11-27 11:49:22.164062+00	37	В конторах с оценкой «5» и «4» в нашем рейтинге, которые мы рекомендуем, за «догон» не режут, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	2	update through import_export	8	1
102	2018-11-27 11:49:22.166334+00	37	В конторах с оценкой «5» и «4» в нашем рейтинге, которые мы рекомендуем, за «догон» не режут, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	2	update through import_export	8	1
103	2018-11-27 11:49:22.168592+00	37	В конторах с оценкой «5» и «4» в нашем рейтинге, которые мы рекомендуем, за «догон» не режут, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	2	update through import_export	8	1
104	2018-11-27 11:49:22.170696+00	20	 Просто карта должна быть на ваше имя. Совпадение гражданства и банка не обязательно. 	1	new through import_export	8	1
105	2018-11-27 11:49:22.172738+00	20	 Просто карта должна быть на ваше имя. Совпадение гражданства и банка не обязательно. 	2	update through import_export	8	1
106	2018-11-27 11:49:22.175136+00	20	 Просто карта должна быть на ваше имя. Совпадение гражданства и банка не обязательно. 	2	update through import_export	8	1
107	2018-11-27 11:49:22.177242+00	20	 Просто карта должна быть на ваше имя. Совпадение гражданства и банка не обязательно. 	2	update through import_export	8	1
108	2018-11-27 11:49:22.179369+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	1	new through import_export	8	1
109	2018-11-27 11:49:22.181465+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
110	2018-11-27 11:49:22.183628+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
111	2018-11-27 11:49:22.185596+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
112	2018-11-27 11:49:22.18767+00	23	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность порезки аккаунта, объективно, есть почти всегда, и хотя для простого игрока она весьма низка, но все же выше вероятности сборной Ро	1	new through import_export	8	1
421	2018-11-27 11:49:22.866481+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
113	2018-11-27 11:49:22.190001+00	23	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность порезки аккаунта, объективно, есть почти всегда, и хотя для простого игрока она весьма низка, но все же выше вероятности сборной Ро	2	update through import_export	8	1
114	2018-11-27 11:49:22.192516+00	23	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность порезки аккаунта, объективно, есть почти всегда, и хотя для простого игрока она весьма низка, но все же выше вероятности сборной Ро	2	update through import_export	8	1
115	2018-11-27 11:49:22.19465+00	23	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность порезки аккаунта, объективно, есть почти всегда, и хотя для простого игрока она весьма низка, но все же выше вероятности сборной Ро	2	update through import_export	8	1
116	2018-11-27 11:49:22.196939+00	24	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Если же Вы участвуете в наших конкурсах — другой разговор.	1	new through import_export	8	1
117	2018-11-27 11:49:22.19936+00	24	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Если же Вы участвуете в наших конкурсах — другой разговор.	2	update through import_export	8	1
118	2018-11-27 11:49:22.20174+00	24	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Если же Вы участвуете в наших конкурсах — другой разговор.	2	update through import_export	8	1
119	2018-11-27 11:49:22.204285+00	24	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Если же Вы участвуете в наших конкурсах — другой разговор.	2	update through import_export	8	1
120	2018-11-27 11:49:22.206489+00	26	 Это разные конторы с юридической точки зрения. Однаработает легально в рамках российского законодательства, в то время как другая считается офшорной БК. Ее используют клиенты, представляющие  остальн	1	new through import_export	8	1
121	2018-11-27 11:49:22.208715+00	25	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК. Ее используют клиенты, представляющие  осталь	1	new through import_export	8	1
122	2018-11-27 11:49:22.210832+00	25	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК. Ее используют клиенты, представляющие  осталь	2	update through import_export	8	1
123	2018-11-27 11:49:22.212935+00	25	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК. Ее используют клиенты, представляющие  осталь	2	update through import_export	8	1
124	2018-11-27 11:49:22.215126+00	25	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК. Ее используют клиенты, представляющие  осталь	2	update through import_export	8	1
125	2018-11-27 11:49:22.217539+00	27	 все актуальные конкурсы указаны в разделе  «Конкурсы» . Можете ознакомиться. 	1	new through import_export	8	1
126	2018-11-27 11:49:22.219486+00	27	 все актуальные конкурсы указаны в разделе  «Конкурсы» . Можете ознакомиться. 	2	update through import_export	8	1
127	2018-11-27 11:49:22.221174+00	27	 все актуальные конкурсы указаны в разделе  «Конкурсы» . Можете ознакомиться. 	2	update through import_export	8	1
128	2018-11-27 11:49:22.223011+00	39	В нашем рейтинге Вы найдете два Фонбета. Один из них работает в рамках российского законодательства, в то время как другой является офшорной компанией. Роскомнадзор блокирует только сайт нелегальной Б	1	new through import_export	8	1
129	2018-11-27 11:49:22.225207+00	39	В нашем рейтинге Вы найдете два Фонбета. Один из них работает в рамках российского законодательства, в то время как другой является офшорной компанией. Роскомнадзор блокирует только сайт нелегальной Б	2	update through import_export	8	1
130	2018-11-27 11:49:22.227064+00	39	В нашем рейтинге Вы найдете два Фонбета. Один из них работает в рамках российского законодательства, в то время как другой является офшорной компанией. Роскомнадзор блокирует только сайт нелегальной Б	2	update through import_export	8	1
131	2018-11-27 11:49:22.228984+00	39	В нашем рейтинге Вы найдете два Фонбета. Один из них работает в рамках российского законодательства, в то время как другой является офшорной компанией. Роскомнадзор блокирует только сайт нелегальной Б	2	update through import_export	8	1
132	2018-11-27 11:49:22.230963+00	28	1хставка ориентирована на российский рынок и ее деятельность абсолютно законна в РФ. Поэтому игроки более защищены в правовом плане. Что касается 1хбет, это офшорная БК. К тому же, на нее сейчас оформ	1	new through import_export	8	1
133	2018-11-27 11:49:22.232988+00	28	1хставка ориентирована на российский рынок и ее деятельность абсолютно законна в РФ. Поэтому игроки более защищены в правовом плане. Что касается 1хбет, это офшорная БК. К тому же, на нее сейчас оформ	2	update through import_export	8	1
134	2018-11-27 11:49:22.234938+00	28	1хставка ориентирована на российский рынок и ее деятельность абсолютно законна в РФ. Поэтому игроки более защищены в правовом плане. Что касается 1хбет, это офшорная БК. К тому же, на нее сейчас оформ	2	update through import_export	8	1
135	2018-11-27 11:49:22.23725+00	29	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	1	new through import_export	8	1
136	2018-11-27 11:49:22.239974+00	29	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	2	update through import_export	8	1
137	2018-11-27 11:49:22.242562+00	29	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	2	update through import_export	8	1
138	2018-11-27 11:49:22.245417+00	29	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	2	update through import_export	8	1
139	2018-11-27 11:49:22.247881+00	30	БК не хочет с вами играть, смените контору. 	1	new through import_export	8	1
140	2018-11-27 11:49:22.25008+00	30	БК не хочет с вами играть, смените контору. 	2	update through import_export	8	1
141	2018-11-27 11:49:22.252691+00	30	БК не хочет с вами играть, смените контору. 	2	update through import_export	8	1
142	2018-11-27 11:49:22.255149+00	30	БК не хочет с вами играть, смените контору. 	2	update through import_export	8	1
143	2018-11-27 11:49:22.257717+00	31	Большинство ППС компенсируют размер налога на выигрыш. 	1	new through import_export	8	1
144	2018-11-27 11:49:22.260169+00	31	Большинство ППС компенсируют размер налога на выигрыш. 	2	update through import_export	8	1
145	2018-11-27 11:49:22.261996+00	31	Большинство ППС компенсируют размер налога на выигрыш. 	2	update through import_export	8	1
146	2018-11-27 11:49:22.265786+00	31	Большинство ППС компенсируют размер налога на выигрыш. 	2	update through import_export	8	1
147	2018-11-27 11:49:22.273634+00	32	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	1	new through import_export	8	1
148	2018-11-27 11:49:22.276079+00	32	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	2	update through import_export	8	1
149	2018-11-27 11:49:22.278097+00	32	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	2	update through import_export	8	1
150	2018-11-27 11:49:22.280308+00	32	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	2	update through import_export	8	1
151	2018-11-27 11:49:22.282455+00	32	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	2	update through import_export	8	1
152	2018-11-27 11:49:22.284256+00	33	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	1	new through import_export	8	1
153	2018-11-27 11:49:22.286323+00	33	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	2	update through import_export	8	1
154	2018-11-27 11:49:22.288572+00	33	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	2	update through import_export	8	1
303	2018-11-27 11:49:22.620792+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
156	2018-11-27 11:49:22.292787+00	34	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют, переведя при этом баланс на первый счет. В любо	1	new through import_export	8	1
157	2018-11-27 11:49:22.294592+00	34	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют, переведя при этом баланс на первый счет. В любо	2	update through import_export	8	1
158	2018-11-27 11:49:22.296908+00	34	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют, переведя при этом баланс на первый счет. В любо	2	update through import_export	8	1
159	2018-11-27 11:49:22.29891+00	35	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	1	new through import_export	8	1
160	2018-11-27 11:49:22.300531+00	35	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	2	update through import_export	8	1
161	2018-11-27 11:49:22.302147+00	35	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	2	update through import_export	8	1
162	2018-11-27 11:49:22.303766+00	35	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	2	update through import_export	8	1
163	2018-11-27 11:49:22.305556+00	38	В настройках своего профиля Вы можете изменить имя и фамилию. Отзыв не будет удален.	1	new through import_export	8	1
164	2018-11-27 11:49:22.30713+00	39	В нашем рейтинге Вы найдете два Фонбета. Один из них работает в рамках российского законодательства, в то время как другой является офшорной компанией. Роскомнадзор блокирует только сайт нелегальной Б	2	update through import_export	8	1
165	2018-11-27 11:49:22.308844+00	40	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при у	1	new through import_export	8	1
166	2018-11-27 11:49:22.310485+00	40	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при у	2	update through import_export	8	1
167	2018-11-27 11:49:22.312215+00	40	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при у	2	update through import_export	8	1
168	2018-11-27 11:49:22.313832+00	41	В обзорах компаний на «Рейтинге Букмекеров» указаны платежные системы, оплату через которые принимает БК. Мы стараемся регулярно обновлять эти данные. Но компании постоянно развиваются и добавляют нов	1	new through import_export	8	1
169	2018-11-27 11:49:22.31549+00	41	В обзорах компаний на «Рейтинге Букмекеров» указаны платежные системы, оплату через которые принимает БК. Мы стараемся регулярно обновлять эти данные. Но компании постоянно развиваются и добавляют нов	2	update through import_export	8	1
170	2018-11-27 11:49:22.317645+00	41	В обзорах компаний на «Рейтинге Букмекеров» указаны платежные системы, оплату через которые принимает БК. Мы стараемся регулярно обновлять эти данные. Но компании постоянно развиваются и добавляют нов	2	update through import_export	8	1
171	2018-11-27 11:49:22.320414+00	41	В обзорах компаний на «Рейтинге Букмекеров» указаны платежные системы, оплату через которые принимает БК. Мы стараемся регулярно обновлять эти данные. Но компании постоянно развиваются и добавляют нов	2	update through import_export	8	1
172	2018-11-27 11:49:22.323186+00	42	В подобных ситуациях вина редко лежит на букмекерах, обычно – на банках-посредниках. Узнайте у БК номер транзакции, чтобы отследить платеж в вашем банке. Больше – в разделе «Платежные системы» этого F	1	new through import_export	8	1
173	2018-11-27 11:49:22.326023+00	42	В подобных ситуациях вина редко лежит на букмекерах, обычно – на банках-посредниках. Узнайте у БК номер транзакции, чтобы отследить платеж в вашем банке. Больше – в разделе «Платежные системы» этого F	2	update through import_export	8	1
174	2018-11-27 11:49:22.32992+00	42	В подобных ситуациях вина редко лежит на букмекерах, обычно – на банках-посредниках. Узнайте у БК номер транзакции, чтобы отследить платеж в вашем банке. Больше – в разделе «Платежные системы» этого F	2	update through import_export	8	1
175	2018-11-27 11:49:22.332829+00	68	Если у Вас возникают технические трудности с сайтом, то можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	1	new through import_export	8	1
176	2018-11-27 11:49:22.335025+00	68	Если у Вас возникают технические трудности с сайтом, то можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	2	update through import_export	8	1
177	2018-11-27 11:49:22.337217+00	68	Если у Вас возникают технические трудности с сайтом, то можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	2	update through import_export	8	1
178	2018-11-27 11:49:22.33976+00	68	Если у Вас возникают технические трудности с сайтом, то можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	2	update through import_export	8	1
179	2018-11-27 11:49:22.342775+00	43	В рейтинг «БК на русском» попадают только те букмекерские конторы, которые предлагают не только русский сайт, но и услуги русскоязычной службы поддержки клиентов.	1	new through import_export	8	1
180	2018-11-27 11:49:22.345742+00	44	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских контор	1	new through import_export	8	1
181	2018-11-27 11:49:22.348081+00	44	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских контор	2	update through import_export	8	1
182	2018-11-27 11:49:22.349819+00	44	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских контор	2	update through import_export	8	1
183	2018-11-27 11:49:22.351692+00	44	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских контор	2	update through import_export	8	1
184	2018-11-27 11:49:22.353794+00	45	Вам нужно просто подождать немного, пока сотрудники БК проверят Ваши документы. Думаю, в ближайшие дни Вам восстановят доступ, если документы в порядке и Вы ничего не нарушали. 	1	new through import_export	8	1
185	2018-11-27 11:49:22.355816+00	45	Вам нужно просто подождать немного, пока сотрудники БК проверят Ваши документы. Думаю, в ближайшие дни Вам восстановят доступ, если документы в порядке и Вы ничего не нарушали. 	2	update through import_export	8	1
186	2018-11-27 11:49:22.358172+00	45	Вам нужно просто подождать немного, пока сотрудники БК проверят Ваши документы. Думаю, в ближайшие дни Вам восстановят доступ, если документы в порядке и Вы ничего не нарушали. 	2	update through import_export	8	1
187	2018-11-27 11:49:22.360623+00	45	Вам нужно просто подождать немного, пока сотрудники БК проверят Ваши документы. Думаю, в ближайшие дни Вам восстановят доступ, если документы в порядке и Вы ничего не нарушали. 	2	update through import_export	8	1
188	2018-11-27 11:49:22.364846+00	46	Вкладка "Статистика" в профиле прогнозиста. 	1	new through import_export	8	1
189	2018-11-27 11:49:22.367238+00	46	Вкладка "Статистика" в профиле прогнозиста. 	2	update through import_export	8	1
190	2018-11-27 11:49:22.369231+00	46	Вкладка "Статистика" в профиле прогнозиста. 	2	update through import_export	8	1
191	2018-11-27 11:49:22.371044+00	47	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.	1	new through import_export	8	1
192	2018-11-27 11:49:22.373234+00	47	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.	2	update through import_export	8	1
193	2018-11-27 11:49:22.37571+00	47	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.	2	update through import_export	8	1
194	2018-11-27 11:49:22.378672+00	48	Воспользуйтесь дополнительным способом пополнения депозита, чтобы иметь в дальнейшем дополнительный способ вывода выигрышей. 	1	new through import_export	8	1
304	2018-11-27 11:49:22.622918+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
195	2018-11-27 11:49:22.381311+00	48	Воспользуйтесь дополнительным способом пополнения депозита, чтобы иметь в дальнейшем дополнительный способ вывода выигрышей. 	2	update through import_export	8	1
196	2018-11-27 11:49:22.383684+00	48	Воспользуйтесь дополнительным способом пополнения депозита, чтобы иметь в дальнейшем дополнительный способ вывода выигрышей. 	2	update through import_export	8	1
197	2018-11-27 11:49:22.385682+00	49	Все зависит от конторы. Где-то деньги приходят в течении часа, а где-то 3-4 рабочих дня.	1	new through import_export	8	1
198	2018-11-27 11:49:22.387754+00	49	Все зависит от конторы. Где-то деньги приходят в течении часа, а где-то 3-4 рабочих дня.	2	update through import_export	8	1
199	2018-11-27 11:49:22.389942+00	49	Все зависит от конторы. Где-то деньги приходят в течении часа, а где-то 3-4 рабочих дня.	2	update through import_export	8	1
200	2018-11-27 11:49:22.392347+00	49	Все зависит от конторы. Где-то деньги приходят в течении часа, а где-то 3-4 рабочих дня.	2	update through import_export	8	1
201	2018-11-27 11:49:22.394349+00	50	Все западные букмекеры практикуют эту процедуру.	1	new through import_export	8	1
202	2018-11-27 11:49:22.396227+00	51	Все кто принимают участие в организации договорных матчей являются мошенниками. 	1	new through import_export	8	1
203	2018-11-27 11:49:22.398095+00	52	Все легальные БК должны снимать 13% налог с прибыли. Просто некоторые конторы его компенсируют, но не всем игрокам.	1	new through import_export	8	1
204	2018-11-27 11:49:22.399911+00	52	Все легальные БК должны снимать 13% налог с прибыли. Просто некоторые конторы его компенсируют, но не всем игрокам.	2	update through import_export	8	1
205	2018-11-27 11:49:22.401676+00	52	Все легальные БК должны снимать 13% налог с прибыли. Просто некоторые конторы его компенсируют, но не всем игрокам.	2	update through import_export	8	1
206	2018-11-27 11:49:22.403413+00	53	Вы можете разместить не более трёх прогнозов в одном материале. 	1	new through import_export	8	1
207	2018-11-27 11:49:22.405188+00	53	Вы можете разместить не более трёх прогнозов в одном материале. 	2	update through import_export	8	1
208	2018-11-27 11:49:22.40714+00	53	Вы можете разместить не более трёх прогнозов в одном материале. 	2	update through import_export	8	1
209	2018-11-27 11:49:22.409321+00	53	Вы можете разместить не более трёх прогнозов в одном материале. 	2	update through import_export	8	1
210	2018-11-27 11:49:22.411534+00	54	Вы нарушили правила букмекера ранее. Букмекер в соответствии со своими правилами прекратил сотрудничество с Вами.  Сейчас они отказываются от возобновления сотрудничества. Вы можете воспользоваться ус	1	new through import_export	8	1
211	2018-11-27 11:49:22.413644+00	55	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридор	1	new through import_export	8	1
212	2018-11-27 11:49:22.41633+00	55	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридор	2	update through import_export	8	1
213	2018-11-27 11:49:22.418788+00	55	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридор	2	update through import_export	8	1
214	2018-11-27 11:49:22.421077+00	49	Все зависит от конторы. Где-то деньги приходят в течении часа, а где-то 3-4 рабочих дня.	2	update through import_export	8	1
215	2018-11-27 11:49:22.423666+00	49	Все зависит от конторы. Где-то деньги приходят в течении часа, а где-то 3-4 рабочих дня.	2	update through import_export	8	1
216	2018-11-27 11:49:22.426147+00	49	Все зависит от конторы. Где-то деньги приходят в течении часа, а где-то 3-4 рабочих дня.	2	update through import_export	8	1
217	2018-11-27 11:49:22.428477+00	56	Гуру. Этот статус говорит сам за себя. Гуру становится пользователь, который:написал 3 или более отзывов к разным букмекерским конторам;оставил не менее 10 комментариев к материалам сайта в течение ме	1	new through import_export	8	1
218	2018-11-27 11:49:22.430799+00	56	Гуру. Этот статус говорит сам за себя. Гуру становится пользователь, который:написал 3 или более отзывов к разным букмекерским конторам;оставил не менее 10 комментариев к материалам сайта в течение ме	2	update through import_export	8	1
219	2018-11-27 11:49:22.433238+00	56	Гуру. Этот статус говорит сам за себя. Гуру становится пользователь, который:написал 3 или более отзывов к разным букмекерским конторам;оставил не менее 10 комментариев к материалам сайта в течение ме	2	update through import_export	8	1
305	2018-11-27 11:49:22.624928+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
422	2018-11-27 11:49:22.868475+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
220	2018-11-27 11:49:22.435443+00	56	Гуру. Этот статус говорит сам за себя. Гуру становится пользователь, который:написал 3 или более отзывов к разным букмекерским конторам;оставил не менее 10 комментариев к материалам сайта в течение ме	2	update through import_export	8	1
221	2018-11-27 11:49:22.437903+00	57	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были в	1	new through import_export	8	1
222	2018-11-27 11:49:22.440283+00	57	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были в	2	update through import_export	8	1
223	2018-11-27 11:49:22.442588+00	57	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были в	2	update through import_export	8	1
224	2018-11-27 11:49:22.444808+00	102	Об этом упоминается в рекомендациях по написанию прогнозов -  (в самом конце). Но каких-то четких критериев отбора и гарантий попадания нет. Для этого просто должны сойтись звезды. Удачи! 	1	new through import_export	8	1
225	2018-11-27 11:49:22.447024+00	102	Об этом упоминается в рекомендациях по написанию прогнозов -  (в самом конце). Но каких-то четких критериев отбора и гарантий попадания нет. Для этого просто должны сойтись звезды. Удачи! 	2	update through import_export	8	1
226	2018-11-27 11:49:22.449562+00	102	Об этом упоминается в рекомендациях по написанию прогнозов -  (в самом конце). Но каких-то четких критериев отбора и гарантий попадания нет. Для этого просто должны сойтись звезды. Удачи! 	2	update through import_export	8	1
227	2018-11-27 11:49:22.451852+00	58	Да, это обычная практика. Каждая контора из числа рекомендуемых «Рейтингом Букмекеров» (с оценкой «4» и «5») прилагает максимальные усилия для сохранения личных данных клиентов в безопасности. Список 	1	new through import_export	8	1
228	2018-11-27 11:49:22.453835+00	59	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.	1	new through import_export	8	1
229	2018-11-27 11:49:22.455913+00	59	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.	2	update through import_export	8	1
230	2018-11-27 11:49:22.458111+00	59	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.	2	update through import_export	8	1
231	2018-11-27 11:49:22.46037+00	60	Данный вопрос вы можете решить только с поддержкой самого букмекера.	1	new through import_export	8	1
232	2018-11-27 11:49:22.463099+00	61	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	1	new through import_export	8	1
233	2018-11-27 11:49:22.465237+00	61	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
234	2018-11-27 11:49:22.467109+00	61	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
235	2018-11-27 11:49:22.469099+00	61	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
236	2018-11-27 11:49:22.47147+00	61	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
237	2018-11-27 11:49:22.473692+00	61	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
238	2018-11-27 11:49:22.475572+00	61	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
239	2018-11-27 11:49:22.477271+00	61	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
240	2018-11-27 11:49:22.478933+00	61	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"""""Трибуны"""""""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
241	2018-11-27 11:49:22.48091+00	62	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"Трибуны"""", он должен быть размещен не позднее, чем за 2 часа до события.	1	new through import_export	8	1
242	2018-11-27 11:49:22.482974+00	62	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"Трибуны"""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
243	2018-11-27 11:49:22.485436+00	62	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"Трибуны"""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
244	2018-11-27 11:49:22.487739+00	62	Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу """"Трибуны"""", он должен быть размещен не позднее, чем за 2 часа до события.	2	update through import_export	8	1
245	2018-11-27 11:49:22.49007+00	63	Для этого при публикации прогноза необходимо выбрать тип ставки "экспресс", а не "ординар". Дать прогноз на "матч 1", после чего нажать "добавить матч" и дать ставку для второго матча. Если их больше,	1	new through import_export	8	1
246	2018-11-27 11:49:22.492351+00	128	Прибыль экспертов подсчитывается следующим образом:   Условная сумма каждой ставки – 10$  Средний коэф. выигранных ставок = (Коэф. выигранной ставки #1 + Коэф. выигранной ставки #2 +… Коэф. выигранной	1	new through import_export	8	1
247	2018-11-27 11:49:22.494622+00	65	Если Вы заинтересованы в добавлении капперского сайта или группы в рейтинг капперов, для начала внимательно ознакомьтесь с  нашими правилами и критериями оценки капперов . В правилах можно найти ответ	1	new through import_export	8	1
248	2018-11-27 11:49:22.496552+00	64	Если Ваша ситуация разрешилась и Вы нашли общий язык с каппером, Вы можете просто оставить новый положительный комментарий в его обзоре.	1	new through import_export	8	1
249	2018-11-27 11:49:22.49864+00	64	Если Ваша ситуация разрешилась и Вы нашли общий язык с каппером, Вы можете просто оставить новый положительный комментарий в его обзоре.	2	update through import_export	8	1
250	2018-11-27 11:49:22.500733+00	64	Если Ваша ситуация разрешилась и Вы нашли общий язык с каппером, Вы можете просто оставить новый положительный комментарий в его обзоре.	2	update through import_export	8	1
251	2018-11-27 11:49:22.502503+00	66	Если вам снизили максимумы, то вряд ли их поднимут когда либо. 	1	new through import_export	8	1
252	2018-11-27 11:49:22.504797+00	66	Если вам снизили максимумы, то вряд ли их поднимут когда либо. 	2	update through import_export	8	1
253	2018-11-27 11:49:22.507541+00	66	Если вам снизили максимумы, то вряд ли их поднимут когда либо. 	2	update through import_export	8	1
254	2018-11-27 11:49:22.510839+00	66	Если вам снизили максимумы, то вряд ли их поднимут когда либо. 	2	update through import_export	8	1
255	2018-11-27 11:49:22.513845+00	67	Если речь об одной из рекомендуемых нами контор, оцененных на «4» и «5» в рейтинге букмекерских компаний, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы на «Рейтинге 	1	new through import_export	8	1
256	2018-11-27 11:49:22.516289+00	67	Если речь об одной из рекомендуемых нами контор, оцененных на «4» и «5» в рейтинге букмекерских компаний, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы на «Рейтинге 	2	update through import_export	8	1
257	2018-11-27 11:49:22.518702+00	67	Если речь об одной из рекомендуемых нами контор, оцененных на «4» и «5» в рейтинге букмекерских компаний, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы на «Рейтинге 	2	update through import_export	8	1
258	2018-11-27 11:49:22.521152+00	67	Если речь об одной из рекомендуемых нами контор, оцененных на «4» и «5» в рейтинге букмекерских компаний, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы на «Рейтинге 	2	update through import_export	8	1
259	2018-11-27 11:49:22.52405+00	69	Если у вас нет других аккаунтов в этой БК и вы предоставили все необходимые документы, то вопрос решается в считанные дни. 	1	new through import_export	8	1
260	2018-11-27 11:49:22.526707+00	70	Если эти конторы не устраивают, то скачать приложение удобной для вас БК и на листочки делать ставки, ну или в Excel и самому рассчитывать.	1	new through import_export	8	1
261	2018-11-27 11:49:22.52907+00	71	Есть некоторая задержка в обновлении информации в статистике.	1	new through import_export	8	1
262	2018-11-27 11:49:22.531002+00	73	Еще не слышал, чтобы кто-то платил налоги за выигрыш в БК.  	1	new through import_export	8	1
306	2018-11-27 11:49:22.626929+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
263	2018-11-27 11:49:22.53306+00	74	Еще раз Прежде всего, нужно писать качественные прогнозы, которые будут попадать на Трибуну. Немалую роль играет и проходимость прогнозов. Если уровень материалов будет высоким, а статистика плюсовой 	1	new through import_export	8	1
264	2018-11-27 11:49:22.535138+00	75	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	2	update through import_export	8	1
265	2018-11-27 11:49:22.537124+00	76	Зайдите в свой профиль и нажмите на ссылку ""Дать прогноз"". 	1	new through import_export	8	1
266	2018-11-27 11:49:22.539036+00	77	Заполните форму жалобы, пожалуйста.	1	new through import_export	8	1
267	2018-11-27 11:49:22.541059+00	77	Заполните форму жалобы, пожалуйста.	2	update through import_export	8	1
268	2018-11-27 11:49:22.543025+00	77	Заполните форму жалобы, пожалуйста.	2	update through import_export	8	1
269	2018-11-27 11:49:22.545081+00	77	Заполните форму жалобы, пожалуйста.	2	update through import_export	8	1
270	2018-11-27 11:49:22.548434+00	77	Заполните форму жалобы, пожалуйста.	2	update through import_export	8	1
271	2018-11-27 11:49:22.550936+00	77	Заполните форму жалобы, пожалуйста.	2	update through import_export	8	1
272	2018-11-27 11:49:22.552863+00	77	Заполните форму жалобы, пожалуйста.	2	update through import_export	8	1
273	2018-11-27 11:49:22.555165+00	77	Заполните форму жалобы, пожалуйста.	2	update through import_export	8	1
274	2018-11-27 11:49:22.557402+00	77	Заполните форму жалобы, пожалуйста.	2	update through import_export	8	1
275	2018-11-27 11:49:22.55959+00	77	Заполните форму жалобы, пожалуйста.	2	update through import_export	8	1
276	2018-11-27 11:49:22.561796+00	78	Заполните форму жалобы, пожалуйста. 	1	new through import_export	8	1
277	2018-11-27 11:49:22.564081+00	78	Заполните форму жалобы, пожалуйста. 	2	update through import_export	8	1
278	2018-11-27 11:49:22.566062+00	78	Заполните форму жалобы, пожалуйста. 	2	update through import_export	8	1
279	2018-11-27 11:49:22.56788+00	78	Заполните форму жалобы, пожалуйста. 	2	update through import_export	8	1
280	2018-11-27 11:49:22.569955+00	79	Заходите в профиль, нажимаете на значок "Карандаш" (Справа вверху) листаете страницу вниз, вот и всё.	1	new through import_export	8	1
281	2018-11-27 11:49:22.572245+00	79	Заходите в профиль, нажимаете на значок "Карандаш" (Справа вверху) листаете страницу вниз, вот и всё.	2	update through import_export	8	1
282	2018-11-27 11:49:22.574307+00	79	Заходите в профиль, нажимаете на значок "Карандаш" (Справа вверху) листаете страницу вниз, вот и всё.	2	update through import_export	8	1
283	2018-11-27 11:49:22.576862+00	79	Заходите в профиль, нажимаете на значок "Карандаш" (Справа вверху) листаете страницу вниз, вот и всё.	2	update through import_export	8	1
284	2018-11-27 11:49:22.579342+00	79	Заходите в профиль, нажимаете на значок "Карандаш" (Справа вверху) листаете страницу вниз, вот и всё.	2	update through import_export	8	1
285	2018-11-27 11:49:22.581637+00	80	Из тех, которые могли бы порекомендовать:Marathonbet Sbobet Tonybet	1	new through import_export	8	1
286	2018-11-27 11:49:22.583831+00	81	Из тех, которые можно посоветовать, Sbobet и Tonybet.	1	new through import_export	8	1
287	2018-11-27 11:49:22.585898+00	82	Имеется в виду получение выигрыша с оффшорной БК? В настоящий момент актуальной является не проблема получения крупной суммы, а возможность перевода из иностранных контор денег на карты российских бан	1	new through import_export	8	1
288	2018-11-27 11:49:22.588032+00	83	Ищите способы обхода блокировок в поисковике.	1	new through import_export	8	1
289	2018-11-27 11:49:22.590682+00	83	Ищите способы обхода блокировок в поисковике.	2	update through import_export	8	1
290	2018-11-27 11:49:22.59336+00	83	Ищите способы обхода блокировок в поисковике.	2	update through import_export	8	1
291	2018-11-27 11:49:22.59565+00	83	Ищите способы обхода блокировок в поисковике.	2	update through import_export	8	1
292	2018-11-27 11:49:22.598005+00	84	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
293	2018-11-27 11:49:22.600028+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
294	2018-11-27 11:49:22.602157+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
295	2018-11-27 11:49:22.60391+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
296	2018-11-27 11:49:22.605772+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
297	2018-11-27 11:49:22.607503+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
298	2018-11-27 11:49:22.609378+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
299	2018-11-27 11:49:22.611785+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
300	2018-11-27 11:49:22.614216+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
301	2018-11-27 11:49:22.616483+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
302	2018-11-27 11:49:22.618728+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
310	2018-11-27 11:49:22.633961+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
311	2018-11-27 11:49:22.635525+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
312	2018-11-27 11:49:22.63729+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
313	2018-11-27 11:49:22.639004+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
314	2018-11-27 11:49:22.640893+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
315	2018-11-27 11:49:22.642611+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
316	2018-11-27 11:49:22.644597+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
317	2018-11-27 11:49:22.646846+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
318	2018-11-27 11:49:22.648732+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
319	2018-11-27 11:49:22.650687+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
320	2018-11-27 11:49:22.652815+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
321	2018-11-27 11:49:22.654788+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
322	2018-11-27 11:49:22.657188+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
323	2018-11-27 11:49:22.659308+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
324	2018-11-27 11:49:22.661454+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
325	2018-11-27 11:49:22.663958+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
326	2018-11-27 11:49:22.666283+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
327	2018-11-27 11:49:22.668631+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
328	2018-11-27 11:49:22.671154+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
329	2018-11-27 11:49:22.673279+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
330	2018-11-27 11:49:22.675456+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
331	2018-11-27 11:49:22.678116+00	84	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
332	2018-11-27 11:49:22.680468+00	85	Комиссия по азартным играм Кюрасао. Лицензия №1668/JAZ.	1	new through import_export	8	1
333	2018-11-27 11:49:22.682702+00	86	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.	1	new through import_export	8	1
334	2018-11-27 11:49:22.685412+00	86	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.	2	update through import_export	8	1
335	2018-11-27 11:49:22.687499+00	86	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.	2	update through import_export	8	1
336	2018-11-27 11:49:22.689626+00	87	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профес	1	new through import_export	8	1
337	2018-11-27 11:49:22.691869+00	87	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профес	2	update through import_export	8	1
338	2018-11-27 11:49:22.694108+00	87	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профес	2	update through import_export	8	1
339	2018-11-27 11:49:22.696153+00	89	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	1	new through import_export	8	1
340	2018-11-27 11:49:22.698562+00	89	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
341	2018-11-27 11:49:22.700927+00	89	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
342	2018-11-27 11:49:22.702535+00	89	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
343	2018-11-27 11:49:22.704313+00	89	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
344	2018-11-27 11:49:22.706381+00	89	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
345	2018-11-27 11:49:22.708643+00	89	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
346	2018-11-27 11:49:22.71065+00	89	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
347	2018-11-27 11:49:22.712916+00	89	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
348	2018-11-27 11:49:22.715129+00	90	На главной странице РБ размещаются только прогнозы экспертов.Для капперских прогнозов есть раздел ""Трибуна"". 	1	new through import_export	8	1
349	2018-11-27 11:49:22.71711+00	90	На главной странице РБ размещаются только прогнозы экспертов.Для капперских прогнозов есть раздел ""Трибуна"". 	2	update through import_export	8	1
350	2018-11-27 11:49:22.719425+00	91	На деле, это распространенное правило, и действует оно в большинстве букмекерских контор. То, как и к кому применяется это правило, зависит от конкретного случая.	1	new through import_export	8	1
351	2018-11-27 11:49:22.722149+00	92	На западе отсутствует понятие «регистрация». Адрес человека там, где он живет. За ваш адрес принимается указанный на выписке из банка или квитанции за коммунальный платеж.	1	new through import_export	8	1
352	2018-11-27 11:49:22.72454+00	93	На самом сайте минимум полезной информации о сути сделки и ее условиях. Никаких статистических данных для оцнки эффективности нет.  Также сотрудник этого ресурса уверял, что они имеют отношение к БК О	1	new through import_export	8	1
353	2018-11-27 11:49:22.726768+00	94	Наведите курсор мыши на свою аватару, которая расположена в правом верхнем углу экрана. В выпадающем меню есть пункт "Настройки уведомлений". Дальше, думаю, понятно, что делать.  	1	new through import_export	8	1
354	2018-11-27 11:49:22.729017+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
355	2018-11-27 11:49:22.731262+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
356	2018-11-27 11:49:22.733471+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
357	2018-11-27 11:49:22.735509+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
358	2018-11-27 11:49:22.737725+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
359	2018-11-27 11:49:22.740076+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
360	2018-11-27 11:49:22.742234+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
361	2018-11-27 11:49:22.744526+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
362	2018-11-27 11:49:22.746838+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
363	2018-11-27 11:49:22.749716+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
364	2018-11-27 11:49:22.752086+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
365	2018-11-27 11:49:22.754119+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
366	2018-11-27 11:49:22.755942+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
367	2018-11-27 11:49:22.757619+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
368	2018-11-27 11:49:22.759309+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
369	2018-11-27 11:49:22.761197+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
370	2018-11-27 11:49:22.762617+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
371	2018-11-27 11:49:22.764284+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
372	2018-11-27 11:49:22.765972+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
373	2018-11-27 11:49:22.767846+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
374	2018-11-27 11:49:22.769887+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
375	2018-11-27 11:49:22.771692+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
376	2018-11-27 11:49:22.77379+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
377	2018-11-27 11:49:22.775841+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
378	2018-11-27 11:49:22.777838+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
379	2018-11-27 11:49:22.779849+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
380	2018-11-27 11:49:22.781886+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
381	2018-11-27 11:49:22.784409+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
382	2018-11-27 11:49:22.7867+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
383	2018-11-27 11:49:22.789554+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
384	2018-11-27 11:49:22.791936+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
385	2018-11-27 11:49:22.7941+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
386	2018-11-27 11:49:22.795842+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
387	2018-11-27 11:49:22.797599+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
388	2018-11-27 11:49:22.799417+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
389	2018-11-27 11:49:22.80132+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
390	2018-11-27 11:49:22.803284+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
391	2018-11-27 11:49:22.805587+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
392	2018-11-27 11:49:22.808062+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
393	2018-11-27 11:49:22.810545+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
394	2018-11-27 11:49:22.813251+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
395	2018-11-27 11:49:22.815497+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
396	2018-11-27 11:49:22.817533+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
397	2018-11-27 11:49:22.819367+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
398	2018-11-27 11:49:22.82105+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
399	2018-11-27 11:49:22.822775+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
400	2018-11-27 11:49:22.82482+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
401	2018-11-27 11:49:22.826509+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
402	2018-11-27 11:49:22.828284+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
403	2018-11-27 11:49:22.829773+00	95	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
404	2018-11-27 11:49:22.83151+00	96	Нет, информация отображается за последний месяц. 	1	new through import_export	8	1
405	2018-11-27 11:49:22.833183+00	97	Нет, никакие ссылки публиковать нельзя. Есть специальные формы для соц сетей, не более. Каналы видео пока не предусмотрены. Вы регистрируетесь и публикуете прогнозы от себя или от группы - без разницы	1	new through import_export	8	1
406	2018-11-27 11:49:22.83475+00	98	Нет, такой прогноз нет смысла рассчитывать, поскольку он в любом случае не пойдёт в статистику.	1	new through import_export	8	1
407	2018-11-27 11:49:22.836504+00	99	Нет. Сроки перевода следует уточнить в банке или у сотрудников платежной системы, если вы отправили средства в банк из нее. Обычно это занимает 3-5 банковских дней.	1	new through import_export	8	1
408	2018-11-27 11:49:22.839005+00	100	Нужно подождать. Они пережили хакерскую атаку. Восстанавливаются. Обещают, что деньги будут в целости и сохранности. 	1	new through import_export	8	1
409	2018-11-27 11:49:22.842017+00	101	Нужно, иначе будут проблемы с выводом средств, ввод паспортных данных предусмотрен правилами БК!!!	1	new through import_export	8	1
410	2018-11-27 11:49:22.84448+00	103	Обратитесь в поддержку букмекера.	1	new through import_export	8	1
411	2018-11-27 11:49:22.846532+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
412	2018-11-27 11:49:22.848869+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
413	2018-11-27 11:49:22.850732+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
414	2018-11-27 11:49:22.852752+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
415	2018-11-27 11:49:22.854653+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
416	2018-11-27 11:49:22.856695+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
417	2018-11-27 11:49:22.858456+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
418	2018-11-27 11:49:22.860316+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
419	2018-11-27 11:49:22.862024+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
420	2018-11-27 11:49:22.864393+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
423	2018-11-27 11:49:22.87065+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
424	2018-11-27 11:49:22.873174+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
425	2018-11-27 11:49:22.875736+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
426	2018-11-27 11:49:22.877411+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
427	2018-11-27 11:49:22.879112+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
428	2018-11-27 11:49:22.880934+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
429	2018-11-27 11:49:22.883221+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
430	2018-11-27 11:49:22.885404+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
431	2018-11-27 11:49:22.887591+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
432	2018-11-27 11:49:22.889906+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
433	2018-11-27 11:49:22.891998+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
434	2018-11-27 11:49:22.894063+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
435	2018-11-27 11:49:22.895978+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
436	2018-11-27 11:49:22.897934+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
437	2018-11-27 11:49:22.900037+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
438	2018-11-27 11:49:22.902021+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
439	2018-11-27 11:49:22.903985+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
440	2018-11-27 11:49:22.906508+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
441	2018-11-27 11:49:22.908356+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
442	2018-11-27 11:49:22.910159+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
443	2018-11-27 11:49:22.912352+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
444	2018-11-27 11:49:22.914186+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
445	2018-11-27 11:49:22.916423+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
446	2018-11-27 11:49:22.918196+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
447	2018-11-27 11:49:22.919993+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
448	2018-11-27 11:49:22.921845+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
449	2018-11-27 11:49:22.923815+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
450	2018-11-27 11:49:22.925664+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
451	2018-11-27 11:49:22.927413+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
452	2018-11-27 11:49:22.929275+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
453	2018-11-27 11:49:22.931057+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
454	2018-11-27 11:49:22.932801+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
455	2018-11-27 11:49:22.934399+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
456	2018-11-27 11:49:22.93626+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
457	2018-11-27 11:49:22.938353+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
458	2018-11-27 11:49:22.940574+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
459	2018-11-27 11:49:22.943048+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
460	2018-11-27 11:49:22.945592+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
461	2018-11-27 11:49:22.948254+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
462	2018-11-27 11:49:22.951502+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
463	2018-11-27 11:49:22.95415+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
464	2018-11-27 11:49:22.956692+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
465	2018-11-27 11:49:22.959313+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
466	2018-11-27 11:49:22.961591+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
467	2018-11-27 11:49:22.963683+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
468	2018-11-27 11:49:22.965966+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
469	2018-11-27 11:49:22.968592+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
470	2018-11-27 11:49:22.971359+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
471	2018-11-27 11:49:22.973992+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
472	2018-11-27 11:49:22.976805+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
473	2018-11-27 11:49:22.979371+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
474	2018-11-27 11:49:22.981754+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
475	2018-11-27 11:49:22.984205+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
476	2018-11-27 11:49:22.986882+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
477	2018-11-27 11:49:22.989624+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
478	2018-11-27 11:49:22.992042+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
479	2018-11-27 11:49:22.994407+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
480	2018-11-27 11:49:22.996459+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
481	2018-11-27 11:49:22.998634+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
482	2018-11-27 11:49:23.001012+00	103	Обратитесь в поддержку букмекера.	2	update through import_export	8	1
483	2018-11-27 11:49:23.003334+00	104	Обычно документы проверяют в течение двух недель.	1	new through import_export	8	1
484	2018-11-27 11:49:23.005925+00	104	Обычно документы проверяют в течение двух недель.	2	update through import_export	8	1
485	2018-11-27 11:49:23.008342+00	104	Обычно документы проверяют в течение двух недель.	2	update through import_export	8	1
486	2018-11-27 11:49:23.010666+00	104	Обычно документы проверяют в течение двух недель.	2	update through import_export	8	1
487	2018-11-27 11:49:23.012783+00	104	Обычно документы проверяют в течение двух недель.	2	update through import_export	8	1
488	2018-11-27 11:49:23.014781+00	104	Обычно документы проверяют в течение двух недель.	2	update through import_export	8	1
489	2018-11-27 11:49:23.017289+00	104	Обычно документы проверяют в течение двух недель.	2	update through import_export	8	1
490	2018-11-27 11:49:23.019465+00	104	Обычно документы проверяют в течение двух недель.	2	update through import_export	8	1
491	2018-11-27 11:49:23.02154+00	105	Обычно перевод осуществляется в тот же или на следующий день. В то же время, точный срок зависит от букмекерской конторы, клиентом которой вы являетесь.	1	new through import_export	8	1
492	2018-11-27 11:49:23.023749+00	105	Обычно перевод осуществляется в тот же или на следующий день. В то же время, точный срок зависит от букмекерской конторы, клиентом которой вы являетесь.	2	update through import_export	8	1
493	2018-11-27 11:49:23.025632+00	106	Означает то, что из данных стран нельзя делать ставки в данной БК.На территории РФ блокируют сайты БК, потому что прием ставок в сети запрещен. Легально на территории РФ работают только 1хСтавка, Лига	1	new through import_export	8	1
494	2018-11-27 11:49:23.027783+00	107	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК. 	1	new through import_export	8	1
495	2018-11-27 11:49:23.029865+00	108	Ответ на этот вопрос зависит от того, о каком букмекере и о карте какого банка идет речь. Мы настоятельно рекомендуем использовать для этих целей Visa Classic, поскольку Electron предназначена в перву	1	new through import_export	8	1
496	2018-11-27 11:49:23.032045+00	109	Отправка копии паспорта - обычное требование БК при верификации. Не стоит бояться, что ваша личная информация попадет в третьи руки. 	1	new through import_export	8	1
497	2018-11-27 11:49:23.034108+00	110	Первая ссылка на официально зарегистрированную под Российское законодательство БК - она не блокируется Росскомнадзором. Вторая это  официально другая БК. Но с Рейтинга Букмекеров при нажатии на перейт	1	new through import_export	8	1
498	2018-11-27 11:49:23.036092+00	111	Переводы, которые проводятся через банк, занимают больше времени, чем переводы посредством платежных интернет-систем (к примеру, платежной системы Skrill).	1	new through import_export	8	1
499	2018-11-27 11:49:23.038118+00	112	Перепроверь все еще раз. Понимаю что звучит глупо, но мне как то помогло то что я почистил кэш, cookie , историю в браузерах и потом получилось зайти. Попробуй проверить почту на которую регистрировал	1	new through import_export	8	1
500	2018-11-27 11:49:23.040207+00	113	Платежные системы Skrill и Neteller принимаются практически всеми БК. Со Skrill можно делать вывод на карточку VISA.	1	new through import_export	8	1
501	2018-11-27 11:49:23.042308+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	1	new through import_export	8	1
502	2018-11-27 11:49:23.044545+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
503	2018-11-27 11:49:23.046708+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
607	2018-11-27 11:49:23.259346+00	158	Статистика прогнозов указывается в вашем профиле, в разделе ""статистика"". Каждая ставка принимается за 10$.	1	new through import_export	8	1
504	2018-11-27 11:49:23.04927+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
505	2018-11-27 11:49:23.051623+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
506	2018-11-27 11:49:23.053581+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
507	2018-11-27 11:49:23.055646+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
508	2018-11-27 11:49:23.057416+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
509	2018-11-27 11:49:23.059723+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
510	2018-11-27 11:49:23.061708+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
511	2018-11-27 11:49:23.064048+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
512	2018-11-27 11:49:23.066518+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
513	2018-11-27 11:49:23.068765+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
514	2018-11-27 11:49:23.070674+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
515	2018-11-27 11:49:23.072568+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
516	2018-11-27 11:49:23.074773+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
517	2018-11-27 11:49:23.077289+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
518	2018-11-27 11:49:23.079467+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
519	2018-11-27 11:49:23.081296+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
520	2018-11-27 11:49:23.083041+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
608	2018-11-27 11:49:23.260991+00	159	Такие верификаторы есть. Их можно легко найти в поисковике. 	1	new through import_export	8	1
521	2018-11-27 11:49:23.085184+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
522	2018-11-27 11:49:23.087557+00	114	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом """"Знания/Полезные стат	2	update through import_export	8	1
523	2018-11-27 11:49:23.089541+00	115	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом ""Знания/Полезные статьи	1	new through import_export	8	1
524	2018-11-27 11:49:23.091244+00	116	По всей видимости, Ваш прогноз не соответствует правилам, установленным для прогноза. Что бы в дальнейшем проблем с попаданием на трибуну не возникало, ознакомьтесь с разделом "Знания/Полезные статьи"	1	new through import_export	8	1
525	2018-11-27 11:49:23.093137+00	117	По правилам букмекерских контор, они не несут ответственности за предоставленную в лайве информацию, так как эти данные (счет матча, т.д.) получают от партнеров. Потому ставку не вернут.	1	new through import_export	8	1
526	2018-11-27 11:49:23.095269+00	118	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	1	new through import_export	8	1
527	2018-11-27 11:49:23.097525+00	118	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	2	update through import_export	8	1
528	2018-11-27 11:49:23.099626+00	118	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	2	update through import_export	8	1
529	2018-11-27 11:49:23.10149+00	118	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	2	update through import_export	8	1
530	2018-11-27 11:49:23.10345+00	118	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	2	update through import_export	8	1
531	2018-11-27 11:49:23.105398+00	119	Подойдет общая выписка по счету, главное, чтобы в ней был указан ваш адрес – тот же, который вы указали при регистрации в выбранной вами платежной системе.	1	new through import_export	8	1
532	2018-11-27 11:49:23.107224+00	120	Подписаться на уведомления можно непосредственно в статье. Под комментариями к статье немного левее есть кнопка "Подписаться на обсуждение" (выделена синим).  А Вы где отписались? 	1	new through import_export	8	1
533	2018-11-27 11:49:23.109142+00	121	Попробуйте обратиться в службу поддержки ""Киви"". 	1	new through import_export	8	1
534	2018-11-27 11:49:23.111021+00	121	Попробуйте обратиться в службу поддержки ""Киви"". 	2	update through import_export	8	1
535	2018-11-27 11:49:23.112861+00	121	Попробуйте обратиться в службу поддержки ""Киви"". 	2	update through import_export	8	1
536	2018-11-27 11:49:23.114778+00	122	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	1	new through import_export	8	1
537	2018-11-27 11:49:23.116633+00	122	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	2	update through import_export	8	1
538	2018-11-27 11:49:23.118431+00	122	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	2	update through import_export	8	1
539	2018-11-27 11:49:23.120358+00	122	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	2	update through import_export	8	1
609	2018-11-27 11:49:23.262852+00	160	Такие сайты есть. Воспользуйтесь поисковиком для их нахождения. Также можно обратиться к стандартным инструментам "Эксель".	1	new through import_export	8	1
540	2018-11-27 11:49:23.122254+00	123	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	1	new through import_export	8	1
541	2018-11-27 11:49:23.124448+00	123	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	2	update through import_export	8	1
542	2018-11-27 11:49:23.12658+00	123	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	2	update through import_export	8	1
543	2018-11-27 11:49:23.128855+00	123	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	2	update through import_export	8	1
544	2018-11-27 11:49:23.130765+00	123	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	2	update through import_export	8	1
545	2018-11-27 11:49:23.132738+00	124	При входе в свой аккаунт нажмите кнопку """"Забыли пароль?"""". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона.	1	new through import_export	8	1
546	2018-11-27 11:49:23.13443+00	124	При входе в свой аккаунт нажмите кнопку """"Забыли пароль?"""". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона.	2	update through import_export	8	1
547	2018-11-27 11:49:23.136153+00	124	При входе в свой аккаунт нажмите кнопку """"Забыли пароль?"""". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона.	2	update through import_export	8	1
548	2018-11-27 11:49:23.137857+00	125	При размещении прогноза в выпадающем меню поля "Букмекер" доступны только конторы с положительными оценками, а также БК, работающие через ЦУПИС. У Бетсити пока не сложилось ни с первым, ни со вторым. 	1	new through import_export	8	1
549	2018-11-27 11:49:23.139779+00	126	При регистрации в зарубежных букмекерских конторах поля можно заполнить, использовав либо перевод, либо транслитерацию.	1	new through import_export	8	1
550	2018-11-27 11:49:23.141819+00	127	При условии, что все документы для проверки личности и адреса были вами предоставлены, вы должны отправлять в букмекерские конторы более 2500 евро в месяц.	1	new through import_export	8	1
551	2018-11-27 11:49:23.143906+00	72	Есть, ищите ссылку на нашем сайте.	1	new through import_export	8	1
552	2018-11-27 11:49:23.145877+00	72	Есть, ищите ссылку на нашем сайте.	2	update through import_export	8	1
553	2018-11-27 11:49:23.147964+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
554	2018-11-27 11:49:23.149794+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
555	2018-11-27 11:49:23.151683+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
556	2018-11-27 11:49:23.153739+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
557	2018-11-27 11:49:23.15558+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
558	2018-11-27 11:49:23.157646+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
559	2018-11-27 11:49:23.159739+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
560	2018-11-27 11:49:23.161869+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
561	2018-11-27 11:49:23.164059+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
562	2018-11-27 11:49:23.166014+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
563	2018-11-27 11:49:23.168216+00	21	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически и, как правило, очень оперативно.  Наши модераторы в ручную о	2	update through import_export	8	1
564	2018-11-27 11:49:23.170406+00	129	Пришлите запрос на почту службы поддержки. Менеджер, работающий с капперами, свяжется с вами.	1	new through import_export	8	1
565	2018-11-27 11:49:23.17272+00	130	Прогнозы на РБ рассчитываются в соответствии с правилами БК, которую вы выбираете при публикации прогноза. Если где-то закралась ошибка, укажите об этом в комментарии к самому прогнозу. 	1	new through import_export	8	1
566	2018-11-27 11:49:23.174795+00	131	Прогнозы обрабатываются в порядке очереди. И все зависит от загруженности сотрудника, который занимается проверкой прогнозов. Необходимо ожидать.	1	new through import_export	8	1
567	2018-11-27 11:49:23.177243+00	131	Прогнозы обрабатываются в порядке очереди. И все зависит от загруженности сотрудника, который занимается проверкой прогнозов. Необходимо ожидать.	2	update through import_export	8	1
568	2018-11-27 11:49:23.179271+00	131	Прогнозы обрабатываются в порядке очереди. И все зависит от загруженности сотрудника, который занимается проверкой прогнозов. Необходимо ожидать.	2	update through import_export	8	1
569	2018-11-27 11:49:23.181835+00	131	Прогнозы обрабатываются в порядке очереди. И все зависит от загруженности сотрудника, который занимается проверкой прогнозов. Необходимо ожидать.	2	update through import_export	8	1
570	2018-11-27 11:49:23.183978+00	132	Пройдитесь по линии William Hill.    	1	new through import_export	8	1
571	2018-11-27 11:49:23.186025+00	133	Проходимость прогнозов мы не учитывается в рейтинге капперов. Мы оцениваем капперов по нашим  критериям . В списке проверенных вы найдете тех, кто не нарушал наши правила.	1	new through import_export	8	1
572	2018-11-27 11:49:23.188388+00	134	Процедура проверки документов (верификация) — стандартная процедура, проводимая букмекерскими компаниями. Со 100% гарантией того, что у Вас документы при заказе вывода денежных средств не будут запрош	1	new through import_export	8	1
573	2018-11-27 11:49:23.190632+00	135	Публикуйте пока прогнозы без выбора букмекера, оставляйте поле «букмекер» пустым.    	1	new through import_export	8	1
574	2018-11-27 11:49:23.192628+00	135	Публикуйте пока прогнозы без выбора букмекера, оставляйте поле «букмекер» пустым.    	2	update through import_export	8	1
575	2018-11-27 11:49:23.194689+00	136	Публикуйте прогнозы без выбора букмекера пока. Можете в тексте писать, например, что коэффициент взят по линии БК William Hill или другой конторы, если вы не участник конкурса. 	1	new through import_export	8	1
576	2018-11-27 11:49:23.196442+00	137	Развернутый ответ на данный вопрос опубликован в  нашей статье . Пожалуйста, ознакомьтесь!	1	new through import_export	8	1
577	2018-11-27 11:49:23.197956+00	138	Разумеется. Можно играть во всех существующих БК, никаких запретов на это нет. Но мы рекомендуем играть только в тех конторах, которые оценены на «5» и «4» в нашем рейтинге: https://bookmaker-ratings.	1	new through import_export	8	1
578	2018-11-27 11:49:23.199892+00	139	Расчет ставок занимает определенное время. Пожалуйста, подождите.	1	new through import_export	8	1
579	2018-11-27 11:49:23.20204+00	140	Режут максимальную ставку или вовсе могут заблокировать счет, если это прописано в правилах. Но есть конторы вроде Pinnacle или SBOBET которые не ограничивают ни как вилочников.Вообще на этом сайте у 	1	new through import_export	8	1
580	2018-11-27 11:49:23.204239+00	141	Ровно один абзац посвящен у нас данному сайту. Отсутствие толковой информации в сети и размещение данного ресурса в списке капперов РБ, которым нельзя доверять, свидетельствуют о том, что особой нужды	1	new through import_export	8	1
581	2018-11-27 11:49:23.206269+00	142	С позиции законодательства эти БК отличаются и отношения друг к другу не имеют. Можете регистрироваться.	1	new through import_export	8	1
790	2018-11-27 11:50:01.870422+00	131	Какая разница между 1хбетом и 1хставкой?	1	new through import_export	9	1
582	2018-11-27 11:49:23.208384+00	143	С сайта рейтинга букмекеров можно перейти только на лицензированные и легальные в России БК - их всего 4 штуки...посмотрите на сайте Первого СРО...если вам нужно ну например на Fonbet, то устанавливае	1	new through import_export	8	1
583	2018-11-27 11:49:23.210948+00	144	С точки зрения законодательства - это разные БК. Деятельность БК Winline с оценкой 3 осуществляется на основании лицензии ФНС России, а действия другой на территории РФ запрещены (блокируется Роскомна	1	new through import_export	8	1
584	2018-11-27 11:49:23.213348+00	145	Сайт 1хБет работает (в том числе и мобильная версия), сегодня довольно много времени провел на нем и в чате с ТП общался. Если с территории РФ или через российского оператора сотовой связи пытаетесь п	1	new through import_export	8	1
585	2018-11-27 11:49:23.215943+00	146	Сайты БК, работающие с ЦУПИС удержание налогов производят автоматически. Остальные сайты работают не по законодательству РФ и не предоставляют сведения по Вашим финансовым операциям в налоговую РФ. Уп	1	new through import_export	8	1
586	2018-11-27 11:49:23.218025+00	147	Самостоятельных ограничений нет. Но мы можем проверить пользователя на какие-либо нарушения с его стороны. Если Вы считаете, что пользователь нарушил правила,  то напишите, пожалуйста, сюда, либо на п	1	new through import_export	8	1
587	2018-11-27 11:49:23.220388+00	148	Свои прогнозы Вы можете видеть у себя в профиле    Либо найти их в трибуне в разделе "все прогнозы" 	1	new through import_export	8	1
588	2018-11-27 11:49:23.222389+00	149	Сервис 1cupis работает с  российскими БК, которые на данный момент имеют статус легальных. Что касается других ""ЦУПИСов"", полноценно работать они начнут позднее.	1	new through import_export	8	1
589	2018-11-27 11:49:23.224664+00	150	Скан паспорта (с отметкой о регистрации) и на выбор скан водительского удостоверения, загранпаспорта, свидетельства о рождении, военного билета. В правилах ряда БК есть также пункт, согласно которому 	1	new through import_export	8	1
590	2018-11-27 11:49:23.22662+00	151	Скорее всего Вам придется пройти процедуру верификации после запроса на вывод средств. 	1	new through import_export	8	1
591	2018-11-27 11:49:23.228657+00	152	Скорее всего вы не подтвердили свою почту. Вам должно были прислать письмо с подтверждением почты и только после подтверждения будут приходить прогнозы. 	1	new through import_export	8	1
592	2018-11-27 11:49:23.23057+00	153	Скорее всего,вы пользуетесь разными почтовыми адресами, и разными соц сетями. Попробуйте зайти с другого профиля.	1	new through import_export	8	1
593	2018-11-27 11:49:23.232658+00	154	Следите за новостями на нашем сайте.	1	new through import_export	8	1
594	2018-11-27 11:49:23.234547+00	154	Следите за новостями на нашем сайте.	2	update through import_export	8	1
595	2018-11-27 11:49:23.23659+00	154	Следите за новостями на нашем сайте.	2	update through import_export	8	1
596	2018-11-27 11:49:23.238479+00	154	Следите за новостями на нашем сайте.	2	update through import_export	8	1
597	2018-11-27 11:49:23.240594+00	154	Следите за новостями на нашем сайте.	2	update through import_export	8	1
598	2018-11-27 11:49:23.242435+00	154	Следите за новостями на нашем сайте.	2	update through import_export	8	1
599	2018-11-27 11:49:23.244211+00	155	Советуем изначально выбрать БК с русской версией и поддержкой на русском языке. Вы найдете список таких контор здесь: https://bookmaker-ratings.ru/rejting-bukmekerov/bukmekery-na-russkom/	1	new through import_export	8	1
600	2018-11-27 11:49:23.24585+00	156	Ставки на страйк-ауты принимает Марафон и Бетсити	1	new through import_export	8	1
601	2018-11-27 11:49:23.247899+00	157	Ставки рассчитываются вручную в порядке очереди. Иногда возможны задержки, однако зачастую прогноз приводят в порядок в течении суток после окончания матча.	1	new through import_export	8	1
602	2018-11-27 11:49:23.249887+00	157	Ставки рассчитываются вручную в порядке очереди. Иногда возможны задержки, однако зачастую прогноз приводят в порядок в течении суток после окончания матча.	2	update through import_export	8	1
603	2018-11-27 11:49:23.251616+00	157	Ставки рассчитываются вручную в порядке очереди. Иногда возможны задержки, однако зачастую прогноз приводят в порядок в течении суток после окончания матча.	2	update through import_export	8	1
604	2018-11-27 11:49:23.253789+00	157	Ставки рассчитываются вручную в порядке очереди. Иногда возможны задержки, однако зачастую прогноз приводят в порядок в течении суток после окончания матча.	2	update through import_export	8	1
605	2018-11-27 11:49:23.255837+00	157	Ставки рассчитываются вручную в порядке очереди. Иногда возможны задержки, однако зачастую прогноз приводят в порядок в течении суток после окончания матча.	2	update through import_export	8	1
606	2018-11-27 11:49:23.257739+00	157	Ставки рассчитываются вручную в порядке очереди. Иногда возможны задержки, однако зачастую прогноз приводят в порядок в течении суток после окончания матча.	2	update through import_export	8	1
610	2018-11-27 11:49:23.264868+00	161	Текст прогноза Вы можете исправить самостоятельно. Для исправления ставки следует написать модераторам в комментариях к своему прогнозу.	1	new through import_export	8	1
611	2018-11-27 11:49:23.26674+00	162	Только если у вас есть все документы на эти номера, и вы можете подтвердить что вы являетесь их владельцем. Обратитесь в поддержку букмекера.	1	new through import_export	8	1
612	2018-11-27 11:49:23.268779+00	163	У Вас было неважное фото (круглый логотип, который обрезался), поэтому изначально я хотел запросить у Вас другое, потом передумал и поставил сам, чтобы сэкономить Вам и себе время, но забыл отметить г	1	new through import_export	8	1
613	2018-11-27 11:49:23.270597+00	164	У каждой конторы свои правила расчета карточек. Кто-то красную за две желтых считает, то есть как два очка, грубо говоря. И неважно, прямая она или нет. А кто-то вообще даже две ЖК повлекшие удаление 	1	new through import_export	8	1
614	2018-11-27 11:49:23.272333+00	165	У пользователей есть возможность публиковать прогнозы в текстовом формате. С рекомендациями по написанию можете ознакомиться  здесь .	1	new through import_export	8	1
615	2018-11-27 11:49:23.274146+00	166	Удобнее всего найти подробную информацию по данным лигам можно на сайтах этих самых лиг и их представительствах в социальных сетях. Особо обширно лиги и команды низших дивизионов представлены в Twitte	1	new through import_export	8	1
616	2018-11-27 11:49:23.276232+00	167	Уже поправили, приносим извинения за неудобства.   P.S. В подобной ситуации достаточно написать под прогнозом, модератор заметит ошибку и внесет коррективы. Не нужно создавать дубли одного и того же в	1	new through import_export	8	1
617	2018-11-27 11:49:23.278362+00	168	Узнать валюты, в которых та или иная БК позволяет открыть счет, вы можете в обзоре этого букмекера в нашем рейтинге: https://bookmaker-ratings.ru/rejting-bukmekerov/vse-bukmekery/.В ряде БК можно внес	1	new through import_export	8	1
618	2018-11-27 11:49:23.280697+00	169	Указанная Вами БК не работает в рамках российского законодательства, поэтому и блокируется Роскомнадзором. Мы, в свою очередь, не имеем права размещать на своем сайте ссылки, которые ведут на запрещен	1	new through import_export	8	1
619	2018-11-27 11:49:23.282285+00	170	Уточните в поддежке БК. Вообще, юридически это разные конторы, поэтому, думаю, сможете зарегистрироваться. Другое дело, что раз Вас заблокировали на международной версии Лиги ставок, значит что-то Вы 	1	new through import_export	8	1
620	2018-11-27 11:49:23.283914+00	171	Уточните этот вопрос в службе поддержки.	1	new through import_export	8	1
621	2018-11-27 11:49:23.286049+00	172	Уточните, пожалуйста, данный вопрос у службы поддержки БК.	1	new through import_export	8	1
622	2018-11-27 11:49:23.287874+00	173	Учетная запись через соцсеть тоже может принимать участие в конкурсе - необходимо просто нажать на соответствующую кнопку на этой странице   	1	new through import_export	8	1
623	2018-11-27 11:49:23.289891+00	174	Учитывается чистая прибыль. Условная сумма каждой ставки – 10$.	1	new through import_export	8	1
624	2018-11-27 11:49:23.29148+00	175	ЦУПИС создан для жителей Рф.	1	new through import_export	8	1
625	2018-11-27 11:49:23.292784+00	176	Чтобы вывести деньги без комиссии, необходимо проставить сумму депозита один раз. 	1	new through import_export	8	1
626	2018-11-27 11:49:23.294344+00	177	Чтобы начать пользоваться всеми возможностями Skrill, нужно пройти процедуру верификации. Для верификации счета вам потребуется отсканировать и послать документы, подтверждающие вашу личность и адрес.	1	new through import_export	8	1
627	2018-11-27 11:49:23.295817+00	178	Чтобы узнать, какие БК и какой бонус предлагают, зайдите в наш рейтинг букмекерских контор и выберите «Упорядочить по бонусу». Детальная информация о бонусе указана в обзорах букмекеров.	1	new through import_export	8	1
628	2018-11-27 11:49:23.297294+00	179	Эти деньги попали на ваш счет в Skrill. Вы с ними можете делать что захотите.  	1	new through import_export	8	1
629	2018-11-27 11:49:23.298635+00	180	Это два разных сайта. Если вы просто не можете зайти на сайт, воспользуйтесь одним из средств обхода блокировки, описанных в сети.	1	new through import_export	8	1
630	2018-11-27 11:49:23.300201+00	181	Это зависит как от популярности события, так и от возможных ограничений (порезка максимумов), наложенных букмекерской конторой на ваш аккаунт.	1	new through import_export	8	1
631	2018-11-27 11:49:23.30154+00	182	Это любой другой счет, который не указан в росписи, обычно ставка выигрывает, когда одна из команд забивает как минимум 4 гола. Это что касается футбола.	1	new through import_export	8	1
632	2018-11-27 11:49:23.303055+00	183	Это можно сделать при помощи банковского перевода или кредитной карточки.	1	new through import_export	8	1
633	2018-11-27 11:49:23.304583+00	184	Это мультиаккаунтинг. Контора имеет право Вас заблокировать. 	1	new through import_export	8	1
634	2018-11-27 11:49:23.305908+00	185	Это обычная практика процедуры верификации, никакого злого умысла здесь нет.	1	new through import_export	8	1
635	2018-11-27 11:49:23.307514+00	186	Этот вопрос лучше задать представителям банка.	1	new through import_export	8	1
636	2018-11-27 11:49:23.309053+00	187	Этот момент лучше уточнить в службе поддержки БК.	1	new through import_export	8	1
637	2018-11-27 11:49:23.310784+00	188	Этот прогноз не участвует в конкурсе, плюс он не попал на Трибуну, значит на статистику он тоже не повлияет. Поэтому рассчитан он или нет не имеет никакого значения. Подобные прогнозы мы начали регуля	1	new through import_export	8	1
638	2018-11-27 11:49:23.312518+00	190	антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	1	new through import_export	8	1
639	2018-11-27 11:49:23.314203+00	191	в настройках профиля, который расположен под вашим фото справа вверху. Там есть мои букмекеры, и конторы в которых Вы играете отмечены цветным логотипом, а в которых не играете черно-белым. Если Вы хо	1	new through import_export	8	1
640	2018-11-27 11:49:23.31629+00	191	в настройках профиля, который расположен под вашим фото справа вверху. Там есть мои букмекеры, и конторы в которых Вы играете отмечены цветным логотипом, а в которых не играете черно-белым. Если Вы хо	2	update through import_export	8	1
641	2018-11-27 11:49:23.31815+00	192	в таком случае ставка возвращается. Но прежде чем ставить, советую прочитать правила данной конторы.	1	new through import_export	8	1
642	2018-11-27 11:49:23.320447+00	193	контора сама принимает подобные решения. Мы влиять на лимиты и коэффициенты не можем. Конечно, Вы можете написать в поддержку БК и попросить вернуть нормальные коэффициенты. Кроме этого, у Вас всегда 	1	new through import_export	8	1
643	2018-11-27 11:49:23.322524+00	194	маржа - это прибыль букмекера, заложенная в каждый выставленный им коэффициент.  	1	new through import_export	8	1
644	2018-11-27 11:49:23.324466+00	195	на мастер карт можно выводить через систему Ecommpay, максимальная сумма на одну транзакцию 15000 рублей. Советую пользоваться платежными системами Skrill или Neteller. Вывод через них намного быстрее	1	new through import_export	8	1
645	2018-11-27 11:49:23.326069+00	196	на сайте Бетсити в верхнем углу есть кнопка """"""""Приложения Бетсити"""""""". Нажмите её и Вы увидите программу для своей платформы. 	1	new through import_export	8	1
646	2018-11-27 11:49:23.327483+00	198	пишите качественные прогнозы, которые будут нравиться людям и они будут на Вас подписываться. 	1	new through import_export	8	1
647	2018-11-27 11:49:23.32908+00	199	прогнозирование результатов спортивных мероприятий не точная наука, Вы можете посмотреть и статистику капперов на главной трибуны и участников конкурса «Деньги и слава». У всех бывают как плюсовые сер	1	new through import_export	8	1
648	2018-11-27 11:49:23.330771+00	189	Я-бот. Я отвечаю только на вопросы, связанные с РБ	1	new through import_export	8	1
649	2018-11-27 11:49:23.33224+00	189	Я-бот. Я отвечаю только на вопросы, связанные с РБ	2	update through import_export	8	1
650	2018-11-27 11:49:23.333931+00	189	Я-бот. Я отвечаю только на вопросы, связанные с РБ	2	update through import_export	8	1
651	2018-11-27 11:49:23.335545+00	189	Я-бот. Я отвечаю только на вопросы, связанные с РБ	2	update through import_export	8	1
652	2018-11-27 11:49:23.337486+00	197	не ругайся, я чувствительный :(	1	new through import_export	8	1
653	2018-11-27 11:49:23.339463+00	197	не ругайся, я чувствительный :(	2	update through import_export	8	1
654	2018-11-27 11:49:23.341328+00	197	не ругайся, я чувствительный :(	2	update through import_export	8	1
655	2018-11-27 11:49:23.343891+00	197	не ругайся, я чувствительный :(	2	update through import_export	8	1
656	2018-11-27 11:49:23.345918+00	197	не ругайся, я чувствительный :(	2	update through import_export	8	1
657	2018-11-27 11:49:23.347633+00	197	не ругайся, я чувствительный :(	2	update through import_export	8	1
658	2018-11-27 11:49:23.34953+00	189	Я-бот. Я отвечаю только на вопросы, связанные с РБ	2	update through import_export	8	1
659	2018-11-27 11:50:01.433637+00	0	Подскажите, как отключить уведомления, которые приходят на электронную почту при каждом комментарии к моему вопросу на вашем сайте? В настройках моего профиля, в разделе - "Настройки уведомлений" нет 	1	new through import_export	9	1
660	2018-11-27 11:50:01.436595+00	1	Как отписаться от уведомлений о комментариях?	1	new through import_export	9	1
661	2018-11-27 11:50:01.438684+00	2	Как отписаться от уведомлений об ответах на формуе? В настройках не нашел.	1	new through import_export	9	1
662	2018-11-27 11:50:01.440654+00	3	Уже достали ваши уведомления, как можно от них отписаться? Каждый раз когда кто-то отвечает они приходят. Я, кажется, на них не подписывался	1	new through import_export	9	1
663	2018-11-27 11:50:01.44306+00	4	Как отписаться от вашей рассылки?	1	new through import_export	9	1
664	2018-11-27 11:50:01.445928+00	5	Как редактировать свой прогноз? Сделал опечатку в самом заголовке.	1	new through import_export	9	1
665	2018-11-27 11:50:01.448832+00	6	После того как прогнозист публикует свой прогноз, почему нет возможности редактировать, потому что в ходе прогноза вполне возможно ошибиться?!	1	new through import_export	9	1
666	2018-11-27 11:50:01.450953+00	7	Почему я не могу редактировать свой прогноз? Мог же где то ошибиться или опечататься и понять потом. Помогите мне его отредактировать	1	new through import_export	9	1
667	2018-11-27 11:50:01.453043+00	8	Как я могу отредактировать прогноз? Сделал мелкую опечатку в заголовке	1	new through import_export	9	1
668	2018-11-27 11:50:01.455029+00	9	Ошибся в заголовке прогноза. Как отредактировать? нигде не нашел этой функции	1	new through import_export	9	1
669	2018-11-27 11:50:01.457037+00	10	Как я могу внести правки в прогноз который уже опубликован? нигде не могу найти.	1	new through import_export	9	1
670	2018-11-27 11:50:01.458883+00	11	Здравствуйте !!! Как принять участие в конкурсе капперов ?	1	new through import_export	9	1
671	2018-11-27 11:50:01.461014+00	12	Как поучавствовать в вашем конкурсе? не вижу где зарегистрироваться	1	new through import_export	9	1
672	2018-11-27 11:50:01.46297+00	13	Как поучаствовать в конкурсе прогнозистов?	1	new through import_export	9	1
673	2018-11-27 11:50:01.465077+00	14	Как принять участие в конкурсе?	1	new through import_export	9	1
674	2018-11-27 11:50:01.467037+00	15	Развели 1хбет, можно ли как то привлечь их к ответственности? Мошенники! У них есть официальное представительство в россии? 1xbet	1	new through import_export	9	1
675	2018-11-27 11:50:01.469117+00	16	1xbet вывели с моего счета деньги. как привлечь их к ответственности? Они совсем мошенники? Они официально дейстуют в РФ, России?	1	new through import_export	9	1
676	2018-11-27 11:50:01.470911+00	17	Как играть на 1xbet? Сайт заблокирован в России.	1	new through import_export	9	1
677	2018-11-27 11:50:01.472775+00	18	1xbet это официальная бк или нет? Помогите разобраться в действиях этой букмекерской конторы. 1хбет.	1	new through import_export	9	1
678	2018-11-27 11:50:01.474641+00	19	Скажите, официальные ли действия 1xbet на территории РФ?	1	new through import_export	9	1
679	2018-11-27 11:50:01.476832+00	20	Если играть на крупные суммы, как лучше всего выводить деньги? какую валюты выбрать? чтобы проценты были минимальные.	1	new through import_export	9	1
680	2018-11-27 11:50:01.479066+00	21	Как лучше выводить деньги в какой валюте, если играешь на крупные суммы? Скрилл? чтобы % были маленькие.	1	new through import_export	9	1
681	2018-11-27 11:50:01.481619+00	22	Играю много и на большие суммы. Не уверен что вывожу деньги лучшим способом. Чем лучше всего это делать?	1	new through import_export	9	1
682	2018-11-27 11:50:01.483951+00	23	Если играть довольно на крупные суммы, то счет в какой валюте лучше всего выбрать, что бы с минимальными % можно было выводить деньги в платежную систему, а потом и на банковскую карту.	1	new through import_export	9	1
683	2018-11-27 11:50:01.486839+00	24	Мой негативный отзыв не появился на сайте! Вы специально? сколько вам за это платят?	1	new through import_export	9	1
684	2018-11-27 11:50:01.489417+00	25	Почему не опубликовали мой отзыв?	1	new through import_export	9	1
685	2018-11-27 11:50:01.491639+00	26	Где мой отзыв? он негативный, они не публикуются?	1	new through import_export	9	1
686	2018-11-27 11:50:01.493981+00	27	Я составил жалобу на бк, негативную, в виде отзыва, почему не опубликовали? Когда появится на сайте?	1	new through import_export	9	1
687	2018-11-27 11:50:01.496062+00	28	Создается впечатление что негативные отзывы не размещаются	1	new through import_export	9	1
688	2018-11-27 11:50:01.498365+00	29	Если я буду играть в Италии Франции Кипре любой другой строне, не в россии, со счета контор в которых я регался регистрировался из россии, смогу ли я делать ставки и вывести деньги?	1	new through import_export	9	1
689	2018-11-27 11:50:01.50069+00	30	Могу ли я играть со своего российского аккаунта в другой странне?	1	new through import_export	9	1
690	2018-11-27 11:50:01.502848+00	31	Могу ли я играть в другой стране с российских букмекеров?	1	new through import_export	9	1
691	2018-11-27 11:50:01.505029+00	32	Если я перееду в другую страну, смогу ли я пользоваться своими счетами зарегистрированными в России, т.е делать ставки и выводить деньги, скажем из Италии, и кому в таком случае платить налоги?	1	new through import_export	9	1
692	2018-11-27 11:50:01.507165+00	33	могу ли вывести депозит в скрилл через нетеллер	1	new through import_export	9	1
693	2018-11-27 11:50:01.509219+00	34	skrill skkril skril скрил скрилл нетеллер нетелер neteller могу ли вывести деньги через них?	1	new through import_export	9	1
694	2018-11-27 11:50:01.511517+00	35	депозит делал через skrill смогу ли вывести через neteller в бет 365, пинакл , сбобет , мачбук , бетфаир.	1	new through import_export	9	1
695	2018-11-27 11:50:01.513801+00	36	Почему мой прогноз не прошел проверку? Все же было нормально. Хороший прогноз, но все равно не прошел	1	new through import_export	9	1
696	2018-11-27 11:50:01.516053+00	37	Написал отличный прогноз, но он не появился на трибуне. Что я написал не так? Как надо его писать чтобы он прошел проверку и появился на трибуне?	1	new through import_export	9	1
697	2018-11-27 11:50:01.518007+00	38	Почему прогноз не прошел модерацию? Вы пускаете на трибуну обычных людей или надо что то сделать?	1	new through import_export	9	1
698	2018-11-27 11:50:01.520235+00	39	Сделала  прогноз, но вы его не разместили. Почему он не прошел модерацию?	1	new through import_export	9	1
699	2018-11-27 11:50:01.522572+00	40	Почему мой прогноз Эвертон - Лестер не прошел проверку? Всё же написано нормально	1	new through import_export	9	1
700	2018-11-27 11:50:01.525069+00	41	Сколько мой прогноз будет проверяться давно на рассмотрении, хочу на трибуну	1	new through import_export	9	1
701	2018-11-27 11:50:01.527529+00	42	Прогноз долго висит на рассмотрении сколько идет проверка	1	new through import_export	9	1
702	2018-11-27 11:50:01.530255+00	43	Сделал прогноз, но его очень долго проверяют. Почему? на рассмотрении давно висит	1	new through import_export	9	1
703	2018-11-27 11:50:01.532438+00	44	Опубликовал прогноз,но его все еще нет на Трибуне,на рассмотрении почему то	1	new through import_export	9	1
704	2018-11-27 11:50:01.53467+00	45	Мы играем с женой, с одной карты на двух аккаунтах. Будет ли это считаться мультиаккаунтингом? С одного устройства	1	new through import_export	9	1
705	2018-11-27 11:50:01.541892+00	46	Если играем с братом другом с одной карты на разных двух нескольких аккаунтах, считается ли это мультиаккаунтингом? Мультиакком, мультиком, или как он там. Устройства разные	1	new through import_export	9	1
706	2018-11-27 11:50:01.544992+00	47	Одна кредитка, то есть кредитная карта, и два аккаунта. могут ли забанить? Если я пополнил так. И почему. Устройство одно	1	new through import_export	9	1
707	2018-11-27 11:50:01.548021+00	48	Забанили за мультиакк, друг пополнил с моей карты аккаунт. Как так?	1	new through import_export	9	1
708	2018-11-27 11:50:01.55698+00	49	если мой брат будет играть в той же конторе что и я, с одного компа, пополнять счет с одной карты на разные счета - это мультиаккаунтинг???	1	new through import_export	9	1
709	2018-11-27 11:50:01.56416+00	50	Если я сменю данные пользователя, например имя и фамилию, то изменятся ли они в моих ставках прогнозах комментариях и тп до этого?	1	new through import_export	9	1
710	2018-11-27 11:50:01.571436+00	51	Сменил фамилию, если я изменю ее в профиле то изменится ли она в прогнозах?	1	new through import_export	9	1
711	2018-11-27 11:50:01.581358+00	52	ПОчему не изменяются имя и фамилия в прогнозах постах ставках, если я сменил ее в настройках	1	new through import_export	9	1
712	2018-11-27 11:50:01.584447+00	53	Вопрос такой: А если в настройках профиля сменить имя и фамилию, то возможно ли сменить имя и фамилию в заголовках моих завершенных ранее ставок?	1	new through import_export	9	1
713	2018-11-27 11:50:01.587911+00	54	Какая ответственность за игру на нелегальных букмекерах? Уголовная или административная? Могут ли меня найти и наказать?	1	new through import_export	9	1
714	2018-11-27 11:50:01.590589+00	55	Если я постоянно играю и вывожу деньги с букмекеров запрещенных в россии могут ли меня наказать? Есть ли какая то статья для этого? они же не просто так нелегальные.	1	new through import_export	9	1
715	2018-11-27 11:50:01.593152+00	56	Как избежать ответственности за игру на запрещенных букмекерах в россии? Есть ли вообще эта ответственность? Я про букмекеров запрещенных РКН роскомнадзором, в общем, которые в реесте запрещенных сайт	1	new through import_export	9	1
716	2018-11-27 11:50:01.595901+00	57	Могут ли меня наказать за игру на незаконных букмекерах? Те кто не ведут свою деятельность из россии.	1	new through import_export	9	1
717	2018-11-27 11:50:01.598373+00	58	Является ли игра, на сайтах букмекерских контор, которые попали в реестр запрещенных сайтов (William Hill, Betfair и т.д.) уголовно-наказуемой? а так же получение постоянной прибыли с них	1	new through import_export	9	1
718	2018-11-27 11:50:01.600798+00	59	Могу ли я как-то посмотреть всех, кто на меня подписался? ИЛи получать уведомления о подписке. Ну или хотя бы количество подписавшихся	1	new through import_export	9	1
719	2018-11-27 11:50:01.603385+00	60	Как понять, сколько человек на меня подписалось? Можно ли настроить уведомления о подписках	1	new through import_export	9	1
720	2018-11-27 11:50:01.60644+00	61	Сколько человек на меня подписано?	1	new through import_export	9	1
721	2018-11-27 11:50:01.60923+00	62	Такой вопрос, можно ли каким-то способом посмотреть кол-во подписок на меня? Приходит ли при новой подписке уведомление на почту и т.д.?	1	new through import_export	9	1
722	2018-11-27 11:50:01.614914+00	63	Почему бк конфисковало у меня балансы и заблокировало меня? С документами проблем нет и не было.	1	new through import_export	9	1
791	2018-11-27 11:50:01.874412+00	132	В чем разница между 1xbet и 1xставкой. Также известные как 1хбет и 1хставка	1	new through import_export	9	1
723	2018-11-27 11:50:01.617994+00	64	За что букмекерская контора, бк, контора, может заблокировать мой счет? Или конфисковать деньги. Документы в порядке, ну нормальные и не поддельные.	1	new through import_export	9	1
724	2018-11-27 11:50:01.628265+00	65	БК забрала деньги и дала бан, заблокировало.  С документами все ок.	1	new through import_export	9	1
725	2018-11-27 11:50:01.631312+00	66	Почему бк конфискует балансы и блокирует счета игроков, у которых нет проблем с документами?	1	new through import_export	9	1
726	2018-11-27 11:50:01.634482+00	67	Как не привязывать карту банка и играть делать ставки на сайте БК	1	new through import_export	9	1
727	2018-11-27 11:50:01.637779+00	68	Можно ли обойтись без банковской карты	1	new through import_export	9	1
728	2018-11-27 11:50:01.643553+00	69	Могу ли я не привязывать карту банка на аккаунт бк?	1	new through import_export	9	1
729	2018-11-27 11:50:01.646592+00	70	Обязательно привязывать карту банка?	1	new through import_export	9	1
730	2018-11-27 11:50:01.649307+00	71	Система расчета прибыли не очень хорошо работает	1	new through import_export	9	1
731	2018-11-27 11:50:01.652626+00	72	Плохо работает ваш сайт. Будут ли внесены изменения, подсчет работает плохо	1	new through import_export	9	1
732	2018-11-27 11:50:01.655773+00	73	Схема рссчета сломана, некорректно показывает коэфициенты	1	new through import_export	9	1
733	2018-11-27 11:50:01.658471+00	74	Люди часто описывают недостатки существующей системы подсчитывания коэфициентов и выигрышей, прибыли. Скажите, будут ли внесены изменения в формулу расчёта прибыли? Иначе ставки с кэфом меньше 2 не им	1	new through import_export	9	1
734	2018-11-27 11:50:01.661453+00	75	Почему прогноз не прошел модерацию? Как понять причину? Никто не объясняет	1	new through import_export	9	1
735	2018-11-27 11:50:01.663919+00	76	Как понять причину почему прогноз не прошел модерацию на трибуну	1	new through import_export	9	1
736	2018-11-27 11:50:01.666868+00	77	За что могут завернуть не дать опубликовать прогноз на трибуну? Почему обычно не проходят модерацию?	1	new through import_export	9	1
737	2018-11-27 11:50:01.670833+00	78	Прогноз не прошёл модерацию.На просьбу пояснить ответить нужным не считают.	1	new through import_export	9	1
738	2018-11-27 11:50:01.673976+00	79	Как в винлайне найти линию? Вообще не могу найти.	1	new through import_export	9	1
739	2018-11-27 11:50:01.67726+00	80	Как в winline найти линию? Вижу только лайвы, live, линии вообще нет.	1	new through import_export	9	1
740	2018-11-27 11:50:01.683423+00	81	На винлайне нет линии, я тупой? Как найти ее?	1	new through import_export	9	1
741	2018-11-27 11:50:01.691027+00	82	Может мой вопрос смешной, но я только что зарегестрировался на винлайне и просто не могу на сайте найти линию, только лайв вижу!	1	new through import_export	9	1
742	2018-11-27 11:50:01.69545+00	83	Как попасть в список капперов? Надо ли покупать место или рекламу?	1	new through import_export	9	1
743	2018-11-27 11:50:01.699675+00	84	Где можно прорекламировать мою группу прогнозов? Есть группа меня как каппера в вк ок	1	new through import_export	9	1
744	2018-11-27 11:50:01.703496+00	85	Как попасть в рекомендуемых капперов?	1	new through import_export	9	1
745	2018-11-27 11:50:01.706489+00	86	Что мне нужно сделать чтоб попасть к вам в рекомендуемые? И подскажите пожалуйста, где можно купить рекламу моего сообщества?	1	new through import_export	9	1
746	2018-11-27 11:50:01.709924+00	87	Как попасть в список доверенных капперов?	1	new through import_export	9	1
747	2018-11-27 11:50:01.713858+00	88	Хочу попасть в список капперов которым можно доверять, как это сделать?	1	new through import_export	9	1
748	2018-11-27 11:50:01.71655+00	89	Хочу стать доверенным каппером, как попасть в их список?	1	new through import_export	9	1
749	2018-11-27 11:50:01.719197+00	90	Каким образом моно попасть в список капперов, которым можно доверять ?	1	new through import_export	9	1
750	2018-11-27 11:50:01.721976+00	91	Почему ничего не приходит на почту когда подписался на каппера? И не могу посмотреть его прогнозы	1	new through import_export	9	1
751	2018-11-27 11:50:01.724603+00	92	Не могу посмотреть прогнозы каппера, не приходят уведомления и ничего тоже	1	new through import_export	9	1
752	2018-11-27 11:50:01.72711+00	93	Подписался на каппера но ничего не приходит, что делать	1	new through import_export	9	1
753	2018-11-27 11:50:01.730331+00	94	Добрый день. Подписался на каппера Никита Емельянов, но не могу посмотреть его прогнозы на сегодня и завтра. На почту также ничего не приходит. Объясните пожалуйста, что я сделал не так. (первый день 	1	new through import_export	9	1
754	2018-11-27 11:50:01.733804+00	95	при регистрации в бк сделал опечатку, могут ли они заблокировать или исправят по просьбе? добавил лишнюю букву а в друго месте перепутал букву	1	new through import_export	9	1
755	2018-11-27 11:50:01.736869+00	96	перепутал букву, проста опечатка, при регистрации в букмекерской конторе. могут ли они ее исправить или забанят? Заблокируют то есть.	1	new through import_export	9	1
756	2018-11-27 11:50:01.739581+00	97	сделал ошибку когда регистрировался у букмекера, можно ли ее исправить?	1	new through import_export	9	1
757	2018-11-27 11:50:01.74217+00	98	при регистрации сделал в имени одну ошибку, тоесть букву добавил, как быть в этом случае, могут ли они меня заблокировать если я им об этом скажу и отправлю паспорт? конечно не специально, просто техн	1	new through import_export	9	1
758	2018-11-27 11:50:01.744868+00	99	Как относится бк леон 1хбет марафон легалбет лига ставок к догонам?	1	new through import_export	9	1
759	2018-11-27 11:50:01.748008+00	100	Какие конторы блокируют за догоны? Банят ли за это, нарушает ли это правила игры?	1	new through import_export	9	1
760	2018-11-27 11:50:01.753248+00	101	Могут ли меня заблокировать за догоны	1	new through import_export	9	1
761	2018-11-27 11:50:01.757451+00	102	Как относиться бк марафон к догонам?	1	new through import_export	9	1
762	2018-11-27 11:50:01.760564+00	103	Подскажите пожалуйста,как правильно сделать,я гражданин Украины,но живу в России и для ставок хочу открыть визу классик.Если я правильно понял,пополнить с нее не получиться,так как нужно чтоб совпадал	1	new through import_export	9	1
763	2018-11-27 11:50:01.763646+00	104	Зачем конторе мои паспортные данные? Гражданство влияет на что то? Что конкретно им нужно?	1	new through import_export	9	1
764	2018-11-27 11:50:01.766889+00	105	Что конкретно нужно конторе из моих паспортных данных?	1	new through import_export	9	1
765	2018-11-27 11:50:01.77691+00	106	Контора просит у меня паспортные данные для полной регистрации!	1	new through import_export	9	1
766	2018-11-27 11:50:01.780716+00	107	Почему удалили мой прогноз?	1	new through import_export	9	1
767	2018-11-27 11:50:01.783745+00	108	За что удалили прогноз	1	new through import_export	9	1
768	2018-11-27 11:50:01.786747+00	109	Почему в профиле не отображается пронгоз?	1	new through import_export	9	1
769	2018-11-27 11:50:01.790283+00	110	Почему в профиле не отображается прогноз?	1	new through import_export	9	1
770	2018-11-27 11:50:01.793791+00	111	Если я стабильно выигрываю в бк, могут ли меня забанить или порезать максимумы?	1	new through import_export	9	1
771	2018-11-27 11:50:01.79714+00	112	Несколько аккаунтов в разных бк букмекерских конторах, могут ли мне порезать максимумы или заблокировать, забанить? Если я стабильно выигрываю. Считается ли это спекуляцией?	1	new through import_export	9	1
772	2018-11-27 11:50:01.802639+00	113	Стабильный выигрыш это спекуляция? Могут заблокировать?	1	new through import_export	9	1
773	2018-11-27 11:50:01.805331+00	114	У меня есть счета во многих БК. Но я не занимаюсь вилками прогрузами и прочими спекулятивными действиями. Если играть только на WH и стабильно выигрывать, какова вероятность что мне порежут максимумы?	1	new through import_export	9	1
774	2018-11-27 11:50:01.808617+00	115	Поощряют ли как то людей, часто делающих прогнозы на трибуне? если нет, то в чем смысл?	1	new through import_export	9	1
775	2018-11-27 11:50:01.81134+00	116	ЗАчем размещать свои прогнозы на трибуне? есть какие то призы?	1	new through import_export	9	1
776	2018-11-27 11:50:01.814061+00	117	Что я получу за размещение своих прогнозов? В чем смысл?	1	new through import_export	9	1
777	2018-11-27 11:50:01.816758+00	118	Подскажите пожайлуста есть ли смысл размещать свои прогнозы на стене трибуны? За большое количество успешных прогнозов есть ли какая-то система поощрения? Cпасибо!	1	new through import_export	9	1
778	2018-11-27 11:50:01.81934+00	119	Можно ли перевести средства, закрыть аккаунт из winline com на winline ру и играть по человечески? спасибо.	1	new through import_export	9	1
779	2018-11-27 11:50:01.823314+00	120	Можно ли перевести средства из winline.com на winline.ru?	1	new through import_export	9	1
780	2018-11-27 11:50:01.82642+00	121	Можно ли перевести средства из bkfon.ru на fonbet.com?	1	new through import_export	9	1
781	2018-11-27 11:50:01.831455+00	122	Можно ли перевести средства между 1хставкой и 1хбетом? 1xbet 1xставка разные конторы вообще или нет?	1	new through import_export	9	1
782	2018-11-27 11:50:01.835209+00	123	Здравствуйте fonbet .ком И bkfon.ru это разные букмекеры? и могут ли возникнуть какие либо проблемы если зарегистрирован там и там	1	new through import_export	9	1
783	2018-11-27 11:50:01.838946+00	124	Какие сейчас у вас конкурсы	1	new through import_export	9	1
784	2018-11-27 11:50:01.842606+00	125	Какие у вас проходят сейчас конкурсы?	1	new through import_export	9	1
785	2018-11-27 11:50:01.847855+00	126	А скажите пожалуйста в каком конкурсе прогнозов можно поучаствовать в ближайшее время?? есть ли какие нибудь варианты заработать на этом сайте?	1	new through import_export	9	1
786	2018-11-27 11:50:01.853614+00	127	Разноцветные фонбеты, в чем разница? Красный и синий.	1	new through import_export	9	1
787	2018-11-27 11:50:01.861582+00	128	Чем различается фонбет и бетфон? 	1	new through import_export	9	1
788	2018-11-27 11:50:01.864555+00	129	Две конторы Фонбет красная и синяя, чем они отличаются ? Или это одна ?	1	new through import_export	9	1
789	2018-11-27 11:50:01.867177+00	130	Интересно, чисто теоретически, предположим, я возьму Джек-Пот в ФОНБЕТ. Если на ""синей"" версии конторы (тотализатор), то 13% налога платить не нужно, а если на ""красной"" (суперэкспресс), то нужно?	1	new through import_export	9	1
792	2018-11-27 11:50:01.878166+00	133	В чем принципиальная разница между этими двумя конторами? Почему у них разные оценки? речь про 1хбет и 1хставка. 	1	new through import_export	9	1
793	2018-11-27 11:50:01.881594+00	134	Как играть антиэкспресс? что это такое?	1	new through import_export	9	1
794	2018-11-27 11:50:01.896045+00	135	Что такое антиэкспресс	1	new through import_export	9	1
795	2018-11-27 11:50:01.899427+00	136	СЛышал про антиэкспресс, расскажите что это	1	new through import_export	9	1
796	2018-11-27 11:50:01.901942+00	137	Скажите как правильно играет антиэкспресс?	1	new through import_export	9	1
797	2018-11-27 11:50:01.905015+00	138	Не могу играть, порезаны ставки. Порезаны максимумы. Могу ставить только маленькие суммы. Что делать?	1	new through import_export	9	1
798	2018-11-27 11:50:01.909128+00	139	ЧТо делать если не могу поставить нормальные ставки?	1	new through import_export	9	1
799	2018-11-27 11:50:01.912408+00	140	Что делать если режут максимумы	1	new through import_export	9	1
800	2018-11-27 11:50:01.920959+00	141	Не могу поставить ни одной ставки, т.к. порезаны максимумы....даже тупо беру любой попавшийся прогноз с кэф 34 и то там максимально возможная сумма ставки 1 р.	1	new through import_export	9	1
801	2018-11-27 11:50:01.924717+00	142	Есть ли налог в оффлайн точках букмекеров	1	new through import_export	9	1
802	2018-11-27 11:50:01.927942+00	143	Играя в ппс есть ли налог? В наземных точках, оффлайн точках	1	new through import_export	9	1
803	2018-11-27 11:50:01.931171+00	144	Надо ли платить налог играя с ППС?	1	new through import_export	9	1
804	2018-11-27 11:50:01.934761+00	145	Плтатит ли игрок наземного ППС какие либо налоги?	1	new through import_export	9	1
805	2018-11-27 11:50:01.938463+00	146	Сделал две ставки с одним исходом. Так можно? Могут ли наказать?	1	new through import_export	9	1
806	2018-11-27 11:50:01.941227+00	147	Может ли бк заблокировать или как то наказать за ординар с одним и тем же исходом несколько раз?	1	new through import_export	9	1
807	2018-11-27 11:50:01.944217+00	148	Могут ли заблокировать за одинаковый ординар?	1	new through import_export	9	1
808	2018-11-27 11:50:01.94658+00	149	Можно ли несколько раз поставить одну и ту же ставку? На одинаковый исход. Ординарами например	1	new through import_export	9	1
809	2018-11-27 11:50:01.948992+00	150	Можно ли ставить несколько раз на один и тот же исход (ординарами)?	1	new through import_export	9	1
810	2018-11-27 11:50:01.951498+00	151	Зарегался с другого устройства, не могу вывести средства. Типа зареган другой логин	1	new through import_export	9	1
811	2018-11-27 11:50:01.954456+00	152	Забыл логин пароль от акка, зарегался с другого, не могу вывести средства	1	new through import_export	9	1
812	2018-11-27 11:50:01.957376+00	153	Потерял телефон, зарегался со второго, деньги не выводятся. Не могу восстановить симку	1	new through import_export	9	1
813	2018-11-27 11:50:01.964783+00	154	Был зарегестрирован с первого своего телефона и забыл логин пароль. Зарегестрировал с второго телефона и не могу вывести средства. Пишут что на ваши данные зарегестрирован другой логин. Что делать. Во	1	new through import_export	9	1
814	2018-11-27 11:50:01.968458+00	155	Можно ли зарегистрироваться зарегаться заново если забыл пароль заблокируют или нет	1	new through import_export	9	1
815	2018-11-27 11:50:01.975624+00	156	Что делать если забыл пароль можно ли пройти регистрацию заново	1	new through import_export	9	1
816	2018-11-27 11:50:01.979247+00	157	Забыл пароль к своему счету. Могу ли я пройти регистрацию заново, станет ли это поводом для конторы заблокировать мой счет?	1	new through import_export	9	1
817	2018-11-27 11:50:01.982515+00	158	Почему БК не принимает клиентов из тех или иных стран?	1	new through import_export	9	1
818	2018-11-27 11:50:01.984995+00	159	Почему букмекерская контора не принимает ставки из каких то стран?	1	new through import_export	9	1
819	2018-11-27 11:50:01.987281+00	160	Почему БК не хочет принимать мои ставки на основе гражданства?	1	new through import_export	9	1
820	2018-11-27 11:50:01.989678+00	161	Почему БК дискриминирует клиентам по гражданству? например, ставки граждан одной страны принимает, а другой нет?	1	new through import_export	9	1
821	2018-11-27 11:50:01.991977+00	162	Удалить или изменить имя и фамилию - не хочу светится у Вас.	1	new through import_export	9	1
822	2018-11-27 11:50:01.994317+00	163	Коллеги, У Вас на сайте БК Фонбет позиционируется с позитивной стороны, Подскажите, пожалуйста, почему ее блокирует Роскомнадзор? она же является легальной. Заранее спасибо!	1	new through import_export	9	1
823	2018-11-27 11:50:01.996688+00	164	Можно ли пользоваться киви для вывода? В каких можно?	1	new through import_export	9	1
824	2018-11-27 11:50:01.999443+00	165	КИви-кошелек. можно через него выводить деньги и где?	1	new through import_export	9	1
825	2018-11-27 11:50:02.001975+00	166	Можно ли использовать QIWI-кошелек для вывода средств в зарубежных БК?	1	new through import_export	9	1
826	2018-11-27 11:50:02.004677+00	167	Как узнать, через что можно вывести деньги у БК? У букмекерской конторы.	1	new through import_export	9	1
864	2018-11-27 11:50:02.147724+00	205	Сколько прогнозов можно разместить в одном материале?	1	new through import_export	9	1
827	2018-11-27 11:50:02.007217+00	168	Как узнать какие платежные инструменты системы поддерживает контора?	1	new through import_export	9	1
828	2018-11-27 11:50:02.009611+00	169	Как узнать через что можно закинуть или вывести деньги на счет букмекерских контор, БК?	1	new through import_export	9	1
829	2018-11-27 11:50:02.011864+00	170	Как узнать, какие платежные системы позволяет использовать букмекерская контора?	1	new through import_export	9	1
830	2018-11-27 11:50:02.014042+00	171	Долго идет выигрыш на карту, что делать?	1	new through import_export	9	1
831	2018-11-27 11:50:02.017648+00	172	Вывел деньги из бк, очень долго, прямо продолжительное время они не доходят, не поступают на карту. Букмекерская контора косячит?	1	new through import_export	9	1
832	2018-11-27 11:50:02.020501+00	173	Выведенные из БК деньги продолжительное время не поступают на кредитную карту. Что делать?	1	new through import_export	9	1
833	2018-11-27 11:50:02.023028+00	174	Сайт плохо работает, что делать.	1	new through import_export	9	1
834	2018-11-27 11:50:02.025445+00	175	Плохо работает сайт	1	new through import_export	9	1
835	2018-11-27 11:50:02.028403+00	176	Сайт не работает, виснет, лагает, зависает	1	new through import_export	9	1
836	2018-11-27 11:50:02.030876+00	177	Недавно зарегистрировался , испытываю проблемы с сайтом	1	new through import_export	9	1
837	2018-11-27 11:50:02.033641+00	178	У конторы есть русская версия сайта, но она отсутствует в вашем рейтинге контор на русском языке. Почему?	1	new through import_export	9	1
838	2018-11-27 11:50:02.036062+00	179	зачем мы платим налог 13% кому он идет	1	new through import_export	9	1
839	2018-11-27 11:50:02.039072+00	180	что за налог в 13 процентов и зачем он?	1	new through import_export	9	1
840	2018-11-27 11:50:02.043382+00	181	налог на выигрыш 13% в лиге ставок , куда он идет !?	1	new through import_export	9	1
841	2018-11-27 11:50:02.046376+00	182	Платит ли фонбет 13% в фнс или игрок сам должен платить налог?	1	new through import_export	9	1
842	2018-11-27 11:50:02.04912+00	183	Долго не отвечает бк, проверяет документы	1	new through import_export	9	1
843	2018-11-27 11:50:02.052524+00	184	СЛишком долго проверяет документы по запросу	1	new through import_export	9	1
844	2018-11-27 11:50:02.056739+00	185	Заблокировали аккаунт и очень долго проверяют доки, документы, что я им отправил, которые они запрашивали.	1	new through import_export	9	1
845	2018-11-27 11:50:02.059684+00	186	У меня заблокировали аккаунт, я отправил документы по запросу. Служба поддержки клиентов молчит. Что делать. Я регистрировался в БК Winline с этого сайта, помогите пожалуйста!	1	new through import_export	9	1
846	2018-11-27 11:50:02.069361+00	187	Как посмотреть все ставки и прогнозы прогнозиста или каппера?	1	new through import_export	9	1
847	2018-11-27 11:50:02.072903+00	188	Как посмотреть все прогнозы прогнозиста, есть ли где то архив всех его постов?	1	new through import_export	9	1
848	2018-11-27 11:50:02.076065+00	189	Есть ли возможность ознакомиться с архивом (с начала 2016 года) прогнозов определенного прогнозиста?	1	new through import_export	9	1
849	2018-11-27 11:50:02.080223+00	190	Не могу войти в аккаунт бк что делать	1	new through import_export	9	1
850	2018-11-27 11:50:02.089351+00	191	Нельзя делать ставку не могу ставить заблокировали что делать	1	new through import_export	9	1
851	2018-11-27 11:50:02.092626+00	192	Не могу войти на аккаунт причина: "Нельзя делать ставки и пополнять баланс". Как решить эту проблему?	1	new through import_export	9	1
852	2018-11-27 11:50:02.095397+00	193	Что делать если не работает способ вывода денег	1	new through import_export	9	1
853	2018-11-27 11:50:02.103466+00	194	Не могу вывести депозит	1	new through import_export	9	1
854	2018-11-27 11:50:02.107292+00	195	Не получается вывести деньги, что делать?	1	new through import_export	9	1
855	2018-11-27 11:50:02.110617+00	196	Как долго идут деньги до карты, если вывод подтвержден	1	new through import_export	9	1
856	2018-11-27 11:50:02.114111+00	197	Сколько выводятся деньги до карты если бк согласовала	1	new through import_export	9	1
857	2018-11-27 11:50:02.120272+00	198	Как долго выводятся деньги, скоро придут на карту?	1	new through import_export	9	1
858	2018-11-27 11:50:02.123483+00	199	Если в запрос на вывод подтвержден оператором то через какое время деньги поступят на карту visa?	1	new through import_export	9	1
859	2018-11-27 11:50:02.126893+00	200	Во всех ли букмекерских конторах нужно пройти проверку личности, чтобы получить выигрыш?	1	new through import_export	9	1
860	2018-11-27 11:50:02.130799+00	201	Является ли бк мошенником, если заранее зная результат матча приняла лайв ставку и отказывается вернуть деньги? Источник:  	1	new through import_export	9	1
861	2018-11-27 11:50:02.140494+00	202	Почему кто то берет налог а кто то нет? ПО какому принципу?	1	new through import_export	9	1
862	2018-11-27 11:50:02.143358+00	203	Как понять какие БК берут налог, а какие нет? В легальных? но иногда же не берут	1	new through import_export	9	1
863	2018-11-27 11:50:02.145728+00	204	Так и не понимаю в каких БК берут налог с выигрыша, в каких нет. Или в каждой легальной берут, но только у некоторых игроков?	1	new through import_export	9	1
1306	2018-11-27 11:50:03.225404+00	647	Как дела?	1	new through import_export	9	1
865	2018-11-27 11:50:02.15005+00	206	Хочу сделать несколько прогнозов, можно ли сделать в одном прогнозе, в одном посте, в одной статье?	1	new through import_export	9	1
866	2018-11-27 11:50:02.153506+00	207	Надо ли делать отдельны публикации для каждого прогноза или можно дать прогнозы вместе?	1	new through import_export	9	1
867	2018-11-27 11:50:02.156745+00	208	Если я хочу написать несколько прогнозов на разные матчи одного чемпионата, то могу ли я давать их в одной публикации отдельными ординарами или же надо для каждого прогноза делать отдельную публикацию	1	new through import_export	9	1
868	2018-11-27 11:50:02.162706+00	209	меня заблокировали на леоне в связи с тем что я зарегистрировался там будучи несовершеннолетним. Сейчас мне почти 20. ТП леона отвечает по шаблону и отказывает в разбане. Как быть?	1	new through import_export	9	1
869	2018-11-27 11:50:02.165833+00	210	Что за категория нежелательных клиентов?	1	new through import_export	9	1
870	2018-11-27 11:50:02.16863+00	211	Что такое нежелательные клиенты? Заблокировали, но дали вывести деньги.	1	new through import_export	9	1
871	2018-11-27 11:50:02.172673+00	212	Букмекерская компания заблокировала мой счет, предварительно дав вывести баланс. Почему?	1	new through import_export	9	1
872	2018-11-27 11:50:02.177026+00	213	Подскажите если кто знает.Сколько времени занимает вывод с 1хбет на карту MasterCard ?	1	new through import_export	9	1
873	2018-11-27 11:50:02.18091+00	214	Сделал запрос на вывод выигрыша с бк вильям хилл деньги со счета ушли но на карта и не поступили что мне делать	1	new through import_export	9	1
874	2018-11-27 11:50:02.183523+00	215	Через какой промежуток времени поступают деньги, отправленные на вывод?	1	new through import_export	9	1
875	2018-11-27 11:50:02.18583+00	216	За что дают статус гуру	1	new through import_export	9	1
876	2018-11-27 11:50:02.188138+00	217	ЧТо за гуру у вас на сайте и как его получить	1	new through import_export	9	1
877	2018-11-27 11:50:02.19065+00	218	как стать гуру у вас на сайте	1	new through import_export	9	1
878	2018-11-27 11:50:02.193383+00	219	Видел где то на сайте, что за размещение прогноза, дадут статус "гуру") Прогноз разместил, мой экспресс выиграл) статуса не получил. Может мне приснилось, т.к. объявления я этого больше не вижу.	1	new through import_export	9	1
879	2018-11-27 11:50:02.196365+00	220	Можно ли использовать несколько способов вывода и пополнения в одной и той же бк	1	new through import_export	9	1
880	2018-11-27 11:50:02.199364+00	221	Можно ли выводить деньги с разных систем в одной и той же конторе?	1	new through import_export	9	1
881	2018-11-27 11:50:02.202946+00	222	Можно ли использовать несколько платёжных систем при работе с одной и той же БК?	1	new through import_export	9	1
882	2018-11-27 11:50:02.206935+00	223	Как попасть в команду прогнозистов	1	new through import_export	9	1
883	2018-11-27 11:50:02.211278+00	224	Как стать вашим прогнозистом, прогнозистом РБ	1	new through import_export	9	1
884	2018-11-27 11:50:02.21609+00	225	Возможно ли попасть в команду профессиональных прогнозистов?	1	new through import_export	9	1
885	2018-11-27 11:50:02.221303+00	226	БК потребовала у меня отправить сканированные копии документа, удостоверяющего личность (нотариально заверенную копию), для вывода средств. Безопасно ли это?	1	new through import_export	9	1
886	2018-11-27 11:50:02.225747+00	227	ошибка 32 что значит	1	new through import_export	9	1
887	2018-11-27 11:50:02.229638+00	228	что за ошибка 32	1	new through import_export	9	1
888	2018-11-27 11:50:02.232841+00	229	почему при входе в фонбет выскакивает ошибка 32	1	new through import_export	9	1
889	2018-11-27 11:50:02.235979+00	230	Добрый день! Открыл счет в валюте "Рубль". Оказалось что пополнение только через Qiwi, меня это не устраивает. Сделал запрос о изменении валюты на USD. Тех.поддержка настаивает на валюте счета EURO. М	1	new through import_export	9	1
890	2018-11-27 11:50:02.239343+00	231	Пот какой причине мои прогнозы не публикуются на главную страницу трибуны?	1	new through import_export	9	1
891	2018-11-27 11:50:02.242993+00	232	Снова не допустили прогноз на трибуну, хочется уже узнать что не так в этот раз.	1	new through import_export	9	1
892	2018-11-27 11:50:02.248184+00	233	Я выложил свой прогноз на теннис, на что через время среагировали Ваши модераторы значком "Прогноз не допущен на трибуну". Почему? Даже никаких объяснений не увидел.	1	new through import_export	9	1
893	2018-11-27 11:50:02.254396+00	234	объясните хотя бы причину по которой неопубликован прогноз. Хочу попробовать себя в роли прогнозиста.	1	new through import_export	9	1
894	2018-11-27 11:50:02.258256+00	235	Из-за чего отклонили мой прогноз? Он достаточно правильный, с точки зрения русского языка.	1	new through import_export	9	1
895	2018-11-27 11:50:02.261267+00	236	Почему прогноз не прошёл на трибуну?  	1	new through import_export	9	1
896	2018-11-27 11:50:02.264369+00	237	Добрый день! Почему мой прогноз не прошел модерацию? Прогноз был опубликован в 23:40. Матч начинался в 00:00.	1	new through import_export	9	1
897	2018-11-27 11:50:02.26747+00	238	Что значит " прогноз не прошёл модерацию, и не будет рассчитан?"	1	new through import_export	9	1
898	2018-11-27 11:50:02.270777+00	239	Опубликовал около 2 часа ранее прогноз на матч МЛС, но его не опубликовали, проста хочу узнать причину?	1	new through import_export	9	1
899	2018-11-27 11:50:02.274509+00	240	Не добавлен прогноз на страницу Трибуны на матч Манчестер Сити - Барселона	1	new through import_export	9	1
900	2018-11-27 11:50:02.280397+00	241	теперь заставка не содержит никаких ссылок,но прогноз опять не допущен на главную трибуну	1	new through import_export	9	1
901	2018-11-27 11:50:02.283302+00	242	Не показывает причину не прохода модерация, хотя сам прогноз сделал от часа - 30 минут до матча. и опубликовал	1	new through import_export	9	1
902	2018-11-27 11:50:02.286509+00	243	Хотел бы узнать причину не допуска прогноза на Трибуну.	1	new through import_export	9	1
903	2018-11-27 11:50:02.295451+00	244	Хотел поставить экспресс, но не нашёл так сказать "инструкцию". Основной момент, правильность оформления "название прогноза" Заранее спасибо!	1	new through import_export	9	1
904	2018-11-27 11:50:02.298559+00	245	подскажите, сколько процентов идет на ставку? по какому принципу высчитывается прибыль в конце месяца у экспертов, а так же у обычных участников,которые выкладывают свои прогнозы?	1	new through import_export	9	1
905	2018-11-27 11:50:02.301789+00	246	есть каппер /Вопрос отредактирован. Ссылки на сторонние ресурсы и адреса запрещены/, не могу найти его в рейтинге, как добавить его на проверку?	1	new through import_export	9	1
906	2018-11-27 11:50:02.305538+00	247	Изменил свое мнение о каппере как изменить отзыв	1	new through import_export	9	1
907	2018-11-27 11:50:02.308142+00	248	хочу изменить негативный отыв о капере каппере	1	new through import_export	9	1
908	2018-11-27 11:50:02.31054+00	249	пару дней назад я оставил негативный отзыв о Денисе Алексееве и проекте stakebet.погорячился был не прав,мы с ним спокойно поговорили и все обсудили.прошу вас удалить мой комментарий	1	new through import_export	9	1
909	2018-11-27 11:50:02.313179+00	250	как я могу поднять свои лимиты?	1	new through import_export	9	1
910	2018-11-27 11:50:02.315845+00	251	мне снизили максимумы, как повысить их обратно	1	new through import_export	9	1
911	2018-11-27 11:50:02.318443+00	252	хочу поднять лимиты, как это сделать	1	new through import_export	9	1
912	2018-11-27 11:50:02.321549+00	253	Как поднять лимиты в лайве?	1	new through import_export	9	1
913	2018-11-27 11:50:02.324669+00	254	все сделал но не получил бонус что делать	1	new through import_export	9	1
914	2018-11-27 11:50:02.327856+00	255	не дали бонус хоть все условия акции сделал, что делать	1	new through import_export	9	1
915	2018-11-27 11:50:02.330983+00	256	что делать если не начислили бонус, условия выполнены	1	new through import_export	9	1
916	2018-11-27 11:50:02.334139+00	257	Я выполнил все условия промоакции, но не получил автоматически начисляемый бонус. Что делать?	1	new through import_export	9	1
917	2018-11-27 11:50:02.336805+00	258	Я бы хотел узнать,как долго решается вопрос с бк о блокировки счета на время верификации?	1	new through import_export	9	1
918	2018-11-27 11:50:02.339941+00	259	Есть конторы с демо счётом? Желательно чтобы с телефона можно было сидеть. Винлайн и бетсити не предлагать.	1	new through import_export	9	1
919	2018-11-27 11:50:02.343297+00	260	Все мои предыдущие ставки рассчитаны, но статистика отображается не корректно. Думаю, что там ошибка, ведь она (статистика) должна пересчитываться автоматически. Проверьте, пожалуйста.	1	new through import_export	9	1
920	2018-11-27 11:50:02.345837+00	261	По логике раз бк не зарегистрирована на тер.РФ и нет контроля, то платить должна бк и если ваш банк заблокировал счет, то им достаточно дать понять, что это не финансирование терроризма или отмывание 	1	new through import_export	9	1
921	2018-11-27 11:50:02.348363+00	262	Как максимально быстро можно сделать, чтобы больше людей узнали о моих прогнозах и стало больше подписчиков?	1	new through import_export	9	1
922	2018-11-27 11:50:02.351147+00	263	Играя онлайн, какими средствами ввода-вывода и платёжными банковскими карточками лучше всего пользоваться или какими пользуются эксперты РБ?	1	new through import_export	9	1
923	2018-11-27 11:50:02.354052+00	264	Как мне выкладывать свои прогнозы? Я каппер занимаюсь давно	1	new through import_export	9	1
924	2018-11-27 11:50:02.356755+00	265	Делал ставку на хоккей, общая сумма выигрыш составила 13.000 грн . Данная БК отказывается выплачивать средства, ссылаясь на непонятные причины. Что мне делать ? Заранее спасибо	1	new through import_export	9	1
925	2018-11-27 11:50:02.359589+00	266	Я сделал ставку на кассе получил чек выиграл но деньги мне не отдают я поставил 200 шт выигрыш составляет 233 шт подскажите что можно сделать это контора мошенников	1	new through import_export	9	1
926	2018-11-27 11:50:02.362601+00	267	Вчера в лайве поставил победу Спартака при счете 0-1 в пользу Амкара, кф-27. Сделали возврат пишут: Ваши ставки рассчитаны с коэффициентом 1 , так как были поставлены на известный исход .	1	new through import_export	9	1
1307	2018-11-27 11:50:03.227393+00	648	привет как дела	1	new through import_export	9	1
927	2018-11-27 11:50:02.365035+00	268	Как снять со счёта winline деньги ?	1	new through import_export	9	1
928	2018-11-27 11:50:02.367317+00	269	забыл в бк зенит имя лучшего друга и мой люимый клуб без этих ключевых записей не могу вывести деньги как их восстановить?в техподдержку обрашался писал на маил но тишишна	1	new through import_export	9	1
929	2018-11-27 11:50:02.369701+00	270	К кому можна обратиться по поводу блокировки счета в БК "Бетсити"?	1	new through import_export	9	1
930	2018-11-27 11:50:02.371929+00	271	Уважаемая команда РБ. Может ли так быть что капперы, которым вы доверяете-мошенники? Столкнулся с непонятной ситуацией.	1	new through import_export	9	1
931	2018-11-27 11:50:02.374635+00	272	Заблокировали меня, то мои документы на верификации, то зайди на сайт но доступ к аккаунту все равно не даете. Почему вы такие мелочные деньги лопатами гребете, а честный выигрыш 33418 не можете отдат	1	new through import_export	9	1
932	2018-11-27 11:50:02.376838+00	273	Бетсити не выплачивает выигрыш! Говорят: ставка не рассчитана, результат уточняется...уже два года уточняют На официальных сайтах есть данные с результатами...Как помочь конторе Бетсити уточнить счет 	1	new through import_export	9	1
933	2018-11-27 11:50:02.379325+00	274	Здравствуйте еще раз,заблокировали счет в бетсити, попросили выслать им документы,все выслали и со второго марта они не отвечают,как быть,куда написать?	1	new through import_export	9	1
934	2018-11-27 11:50:02.381554+00	275	Мне произвели разблокировку счета, а баланс со счета списали, что делать и возможно ли вернуть деньги? Если выяснили что я не мошенник и никаких противоправных действий не совершал почему забрали мои 	1	new through import_export	9	1
935	2018-11-27 11:50:02.384222+00	276	Я заказал на вывод средств через киви кошелёк мне пришёл отказ хотя у меня счёт верифецирован и я не однократно снимал деньги. В службе поддержке мне ничего не отвечают.	1	new through import_export	9	1
936	2018-11-27 11:50:02.386661+00	277	не могу вывести денег,саппорт молчит,.отсылаю фото с паспортом тут же отклонено , бред какой и где там лайв чат??прошел кеф 40 и бонус отыграл(	1	new through import_export	9	1
937	2018-11-27 11:50:02.389711+00	278	ФонБет отказывается выплачивать мой выграш. уже почти 5 дней веду с ними переписку но бесполезно. блокировка счета. деньги не выводятся не на визу не на скрил. Как мне поступить ?	1	new through import_export	9	1
938	2018-11-27 11:50:02.392712+00	279	Как сменить пароль на рб?	1	new through import_export	9	1
939	2018-11-27 11:50:02.39538+00	280	Хочу сменить пароль, как это сделать	1	new through import_export	9	1
940	2018-11-27 11:50:02.397748+00	281	изменить пароль на вашем сайте	1	new through import_export	9	1
941	2018-11-27 11:50:02.399659+00	282	где можно изменить пароль	1	new through import_export	9	1
942	2018-11-27 11:50:02.402016+00	283	как изменить пароль на сайте?	1	new through import_export	9	1
943	2018-11-27 11:50:02.404191+00	284	Добрый день, подскажите БК в которой дают фиксированные коэффициенты на лошадиные скачки в США, надёжного и принимающего игроков из РФ.	1	new through import_export	9	1
944	2018-11-27 11:50:02.406679+00	285	Интересует БК, которая принимает ставки на футбол в компенсируемое время, (вплоть до свистка), знаю что принимал и принимает МАРАФОН БЕТ, но на моем счете порезали макс-ы, вот ищу замену. Прошу помочь	1	new through import_export	9	1
945	2018-11-27 11:50:02.409306+00	286	В каком банке(РФ) в случае перевода крупной суммы на кредитную карту будет меньше проблем с получением этих денег?Если будут проблемы, то какие?	1	new through import_export	9	1
946	2018-11-27 11:50:02.411894+00	287	расширения давно перестали помогать, даже кровные хз как вывести, подскажите дельным советом пожалуйста.	1	new through import_export	9	1
947	2018-11-27 11:50:02.414326+00	288	Сайты все перевели на один 1х ставка, но для ставок в 1хставке требуется сходить в контору, может кто знает другое приложение подобное леону или где-нибудь с файлообменника ссылку кинет	1	new through import_export	9	1
948	2018-11-27 11:50:02.416923+00	289	Не могу попасть на сайт лиги ставок	1	new through import_export	9	1
949	2018-11-27 11:50:02.419361+00	290	Не могу попасть на сайт вильям хил, чтобы посмотреть коэффициенты для участям в конкурсе. Как решить эту проблему ?	1	new through import_export	9	1
950	2018-11-27 11:50:02.421936+00	291	Я не могу зайти на свой логин .нет доступа.с Казахстана сам.для нас заблокирован ?	1	new through import_export	9	1
951	2018-11-27 11:50:02.425292+00	292	скиньте новый сайт зенит бк	1	new through import_export	9	1
952	2018-11-27 11:50:02.427782+00	293	Как выйти на сайт бк пари-матч?	1	new through import_export	9	1
953	2018-11-27 11:50:02.429936+00	294	Вчера и сегодня безуспешно пытаюсь войти на сайты БК "Марафон" и БК "Фонбет". В чем причина? Опять блокировка?	1	new through import_export	9	1
954	2018-11-27 11:50:02.432296+00	295	Нет входа ни с браузеров ПК ни с телефона андроид. Только мобильная версия работает. По ссылке РБ тоже не получается войти. Сам сайт не загружается вообще.	1	new through import_export	9	1
955	2018-11-27 11:50:02.434543+00	296	Сделал прогноз для конурса, его удалили, т.к. такой ставки нет в БК Вильям Хилл. Как узнать, если ли данный исход, если у Вильям Хилл нет сайта ?	1	new through import_export	9	1
956	2018-11-27 11:50:02.437401+00	297	подскажите пожалуйста, как войти на вильям хилл? сегодня блокнул провайдер. расширения или зеркала? есть мозилла и опера турбо. спасибо	1	new through import_export	9	1
957	2018-11-27 11:50:02.439774+00	298	Здравствуйте,не могу зайти на сайты букмекерских контор,они заблокированы,как обойти это?	1	new through import_export	9	1
958	2018-11-27 11:50:02.442091+00	299	Нахожусь в Испании, не заходит на BetFair.com перекидывает на BetFair.es. подскажите, как решить эту проблему?	1	new through import_export	9	1
959	2018-11-27 11:50:02.444893+00	300	я не могу зайти в 1xbet когда я захожу там написано страница заблокирована что делать?	1	new through import_export	9	1
960	2018-11-27 11:50:02.447125+00	301	Как зайти на Вильям Хилл?	1	new through import_export	9	1
961	2018-11-27 11:50:02.449203+00	302	не могу получить доступ к сайту	1	new through import_export	9	1
962	2018-11-27 11:50:02.45108+00	303	Заблокировали Winline22, есть зеркало?	1	new through import_export	9	1
963	2018-11-27 11:50:02.453355+00	304	Не могу перейти на вилиям хилл почему?	1	new through import_export	9	1
964	2018-11-27 11:50:02.456347+00	305	Помогите войти на сайт Вильям Хилл	1	new through import_export	9	1
965	2018-11-27 11:50:02.45999+00	306	Заходил на этот сайт в течении 2 месяцев ... Бац и заходу сегодня и пишет доступ ограничен	1	new through import_export	9	1
966	2018-11-27 11:50:02.462707+00	307	Вопрос прост: многие сайты бекмекерских контор в России регулярно блокируются по требованию росинтернетнадзора (или как их там). В частности, страдает WH, где не очень оперативно создают зеркала и дво	1	new through import_export	9	1
967	2018-11-27 11:50:02.464898+00	308	при верификации на бетфайр при отправке доков нужно ли отключать плагин ZenMate(так как сижу с немецкого IP а паспорт отправляю российский) не возникнет ли у меня проблем?	1	new through import_export	9	1
968	2018-11-27 11:50:02.466944+00	309	Вопрос такого характера: два дня назад пропало соединение с БК Winline, работает ли сайт? не заблокировали его?	1	new through import_export	9	1
969	2018-11-27 11:50:02.469149+00	310	Хотел бы открыть счет, но оператор МТС(Россия) блокирует вход на официальный сайт. Как то возможно обойти данную преграду?	1	new through import_export	9	1
970	2018-11-27 11:50:02.471103+00	311	Перехожу на сайт и его блокирует как сотовый так и интернет провайдер,как зайти?	1	new through import_export	9	1
971	2018-11-27 11:50:02.473093+00	312	без всяких проблем ставил в интернете в БК 1хбет... А сейчас зайти не могу, сайт заблокирован. Не подскажите в чем дело?	1	new through import_export	9	1
972	2018-11-27 11:50:02.474928+00	313	Не могу зайти на сайт может есть какой-нибудь другой сайт фонбета	1	new through import_export	9	1
973	2018-11-27 11:50:02.47673+00	314	Не могу, зайти на ваш сайт!!!	1	new through import_export	9	1
974	2018-11-27 11:50:02.478295+00	315	не могу зайти на сайт pinnacle, есть средства на счету,как можно их вывести?	1	new through import_export	9	1
975	2018-11-27 11:50:02.480203+00	316	Сайт иногда блокируют.Каким образом обойти блокировку?	1	new through import_export	9	1
976	2018-11-27 11:50:02.482067+00	317	Не могу войти на сайт почему?	1	new through import_export	9	1
977	2018-11-27 11:50:02.484055+00	318	Сайт на котором я играл заблокировали , что делать подскажите?	1	new through import_export	9	1
978	2018-11-27 11:50:02.486091+00	319	Друзья, помогите разобраться. С телефона не могу зайти на этот сайт, блокирует (MTC-BLOK) что за хрень? до этого все работало.	1	new through import_export	9	1
979	2018-11-27 11:50:02.48841+00	320	Известно ли почему не работает сайт Виллиам Хилл? И когда на него можно будет зайти?	1	new through import_export	9	1
980	2018-11-27 11:50:02.490856+00	321	не могу зайти на сайт	1	new through import_export	9	1
981	2018-11-27 11:50:02.493483+00	322	Как зайти на сайт БК Титанбет?	1	new through import_export	9	1
982	2018-11-27 11:50:02.495851+00	323	весь день не могу зайти на сайт,раньше заходил без пробле	1	new through import_export	9	1
983	2018-11-27 11:50:02.497954+00	324	Немогу попасть на сайт	1	new through import_export	9	1
984	2018-11-27 11:50:02.500254+00	325	Я не могу зайти на сайт появляется изображение что доступ ограничен	1	new through import_export	9	1
985	2018-11-27 11:50:02.502235+00	326	Не могу зайти на сайт LEON	1	new through import_export	9	1
986	2018-11-27 11:50:02.504265+00	327	Я не могу зайти на сайт ресурс заблокирован визде	1	new through import_export	9	1
987	2018-11-27 11:50:02.506148+00	328	Мужчины и леди, доброго времени суток. Столкнулся я с такой проблемой: не нахожу ссылку на William Hill. Воооот. Быть может, кто в курсе, окажет мне помощь?? Безмерно благодарен)))	1	new through import_export	9	1
988	2018-11-27 11:50:02.507917+00	329	Как попасть на сайт БК William hill? Пробую, но он заблокирован. Есть ли другой способ?	1	new through import_export	9	1
989	2018-11-27 11:50:02.510136+00	330	Как зайти бк William Hill, никак не могу найти альтернативную ссылку.	1	new through import_export	9	1
990	2018-11-27 11:50:02.512352+00	331	Какая лицензия у букмекера 1хbet? кем выдана, когда и под каким номером? П.С. Служба поддержки БК этой информацией не владеет, на сайте БК такая информация отсутствует. Спасибо	1	new through import_export	9	1
991	2018-11-27 11:50:02.51461+00	332	Есть ли минимумы у скрилл	1	new through import_export	9	1
992	2018-11-27 11:50:02.516672+00	333	Какой миним у Skrill	1	new through import_export	9	1
993	2018-11-27 11:50:02.519143+00	334	Какой минимум на депозит и на вывод в Skrill?	1	new through import_export	9	1
994	2018-11-27 11:50:02.521203+00	335	Где лучше всего получать лайв стату статистику	1	new through import_export	9	1
995	2018-11-27 11:50:02.523246+00	336	Как букмекеры получают лайв статистику	1	new through import_export	9	1
996	2018-11-27 11:50:02.525394+00	337	Где букмекеры берут live статистику? есть ли такие сайты с live статистикой более быстрые и точные чем myscore и тому подобные? спасибо	1	new through import_export	9	1
997	2018-11-27 11:50:02.528097+00	338	Решил ставить ставки, какую букмекерскую конторы посоветуете?	1	new through import_export	9	1
998	2018-11-27 11:50:02.530762+00	339	В какой бк лучше делать ставки?	1	new through import_export	9	1
999	2018-11-27 11:50:02.533126+00	340	Доброго времени суток! Можно ли использовать бк только для игры в тотализатор и не более? В случае выигрыша не возникнут ли проблемы с выплатами ( джекпота :-)) )?	1	new through import_export	9	1
1000	2018-11-27 11:50:02.535824+00	341	Посоветуйте бк которые дают высокий кеф на ничью в лайфе (футбол)	1	new through import_export	9	1
1001	2018-11-27 11:50:02.538303+00	342	Какие топовые зарубежные БК принимают рубли?	1	new through import_export	9	1
1002	2018-11-27 11:50:02.541058+00	343	Подскажите нормальная контора бк bwin	1	new through import_export	9	1
1003	2018-11-27 11:50:02.543436+00	344	подскажите пожалуйста БК?в которой все честно и где есть гарантия того что не кинут,а то я тут почитал отзывы о Фонбете! И что то желания у меня пропало в ней играть	1	new through import_export	9	1
1004	2018-11-27 11:50:02.545975+00	345	Прошу добавить контору bkfon.ru. Как я понял, fonbet ком и bkfon.ru - разные конторы. Последней на сайте у вас нет	1	new through import_export	9	1
1005	2018-11-27 11:50:02.548341+00	346	добрый вечер.у нас в городе появилось несколько ппс с названием sport bet между словами стоит логотип в виде морской звезды.зарегистрованы эти ребята как ооо 23bet.ru что вы можете сказать об этой кон	1	new through import_export	9	1
1006	2018-11-27 11:50:02.55065+00	347	Хотя даже в конкурсе от БК Леон встречаются вполне достойные прогнозы не уступающие уважаемым экспертом сайта.	1	new through import_export	9	1
1007	2018-11-27 11:50:02.553468+00	348	Как попасть в рейтинг букмеккеров? Чтобы прогнозы публиковали на главной странице	1	new through import_export	9	1
1008	2018-11-27 11:50:02.555898+00	349	Нашел в правилах промоакции букмекерской конторы следующее: мы оставляем за собой право отменять данное предложение либо изменять любые из его правил и условий в любое время без уведомлений или объясн	1	new through import_export	9	1
1009	2018-11-27 11:50:02.558597+00	350	Для верификации адреса в зарубежных платежных системах обязательно иметь квитанцию за коммунальные платежи с адресом, совпадающим с пропиской?	1	new through import_export	9	1
1010	2018-11-27 11:50:02.560829+00	351	Наткнулся на контору Olimp-smart. Есть и в инстаграмме и в интернете есть сайт. предлагают хорошие условия. Можно ли доверять этой конторе?	1	new through import_export	9	1
1011	2018-11-27 11:50:02.563207+00	352	Как отказаться от подписки на сайте?	1	new through import_export	9	1
1012	2018-11-27 11:50:02.565915+00	353	Добрый день, как попасть к Вам в раздел капперы?	1	new through import_export	9	1
1013	2018-11-27 11:50:02.568036+00	354	Добрый вечер! Как можно удалить свой аккаунт ?	1	new through import_export	9	1
1014	2018-11-27 11:50:02.570246+00	355	Здравствуйьте. Искал ответ на вопрос на сайте,но не нашел. В контакте часто вижу наклейку на аватарках групп о том,что они прошли Вашу проверку. Как сделать так,чтобы и моя группа прошла вашу проверку	1	new through import_export	9	1
1015	2018-11-27 11:50:02.572712+00	356	Здравствуйте Уважаемый Рейтинг букмекеров.Как можно получить вашу проверку на вкладку капперы,т.е попасть в список проверенных капперских сайтов?	1	new through import_export	9	1
1016	2018-11-27 11:50:02.575042+00	357	Добрый вечер уважаемые "РБ" . Хочу попасть в ваш рейтинг капперов,точнее свою группу дать на проверку..	1	new through import_export	9	1
1017	2018-11-27 11:50:02.577289+00	358	Куда можно предложить сайт каппера на проверку?	1	new through import_export	9	1
1018	2018-11-27 11:50:02.579209+00	359	Доброго времени суток! Наблюдаю что многие сайты и группы в вк отмечены тем что прошли проверку "Рейтинга Букмекеров". Скажите пожалуйста как пройти вашу проверку?	1	new through import_export	9	1
1019	2018-11-27 11:50:02.581207+00	360	Добрый день,хочу отправить свою группу по ставкам на проверку и получить одобрение,как это возможно сделать?	1	new through import_export	9	1
1308	2018-11-27 11:50:03.229569+00	649	ты кто такой	1	new through import_export	9	1
1020	2018-11-27 11:50:02.583177+00	361	Добрый день. Как я могу пройти проверку на вашем ресурсе? Наш сайт streambet.ru.	1	new through import_export	9	1
1021	2018-11-27 11:50:02.585499+00	362	Как пройти проверку у Вас, если у меня есть паблик 3800 участников?	1	new through import_export	9	1
1022	2018-11-27 11:50:02.588338+00	363	Здравствуйте я занимаюсь прогнозами на спорт и их продажей в социальной сити вконтакте. Есть ли возможность пройти у вас проверку?	1	new through import_export	9	1
1023	2018-11-27 11:50:02.591033+00	364	Здравствуйте я администратор одного из пабликов в ВК по тематике "Прогнозы на спорт" хотел бы пройти проверку у вас. Куда обратиться?	1	new through import_export	9	1
1024	2018-11-27 11:50:02.593756+00	365	Всем доброго времени! такой вопрос:как пройти проверку прогнозистов , веду группу, планирую создать сайт,хотелось бы пройти проверку и вступить в ваш рейтинг!	1	new through import_export	9	1
1025	2018-11-27 11:50:02.596546+00	366	приветствую, веду свой паблик в ВК ставки полностью верфицированы на сервисе betonsuccess, как пройти вашу проверку? /Комментарий был отредактирован. Ссылки на сторонние ресурсы запрещены/	1	new through import_export	9	1
1026	2018-11-27 11:50:02.598389+00	367	Как подать заявку на проверку своей группы вконтакте?	1	new through import_export	9	1
1027	2018-11-27 11:50:02.600193+00	368	Есть свой капперский проект, хочу пройти проверку сайта "Рейтинг букмекеров". Куда надо подать заявку?	1	new through import_export	9	1
1028	2018-11-27 11:50:02.601976+00	369	А можно как то новость создать?Сегодня зашел ординаром кф 101)))хотел дать прогноз но что в трибуне на это событие но что то рука не дошла)))	1	new through import_export	9	1
1029	2018-11-27 11:50:02.604164+00	370	Доброго времени суток. Я точно не помню был ли ранее зарегистрирован на Вашем ресурсе. Сегодня прошел регистрацию, но так как планирую принять участие в конкурсе, то возникает вопрос - не получу я в с	1	new through import_export	9	1
1030	2018-11-27 11:50:02.606684+00	371	Как попасть моей группе в ваш раздел Капперы. ? Занимаюсь Прогнозами на движение коэффициента на бирже бетфаир до начала игры. И обычными ординарными ставками.по выгодным коэффициентам.Все бесплатно в	1	new through import_export	9	1
1031	2018-11-27 11:50:02.608917+00	372	Добрый день ! Каким образом можно попасть в список "Рейтинг капперских сайтов" . Группа ВК 750 участников	1	new through import_export	9	1
1032	2018-11-27 11:50:02.610581+00	373	Рядом со статусом написано (оценка через 3 месяца), что это значит? Для нового статуса (гуру) не получается дать последний отзыв о БК?	1	new through import_export	9	1
1033	2018-11-27 11:50:02.612621+00	374	Приветствую, администрация РБ, хотел узнать, каким образом моя группа могла бы попасть в рейтинг капперов. Она полностью соответствует требованиям РБ. Все проверки готов пройт	1	new through import_export	9	1
1034	2018-11-27 11:50:02.614777+00	375	Можно-ли удалить свой профиль на сайте РБ? Если да, то как?	1	new through import_export	9	1
1035	2018-11-27 11:50:02.616925+00	376	Как удалить прогноз на сайте РБ?	1	new through import_export	9	1
1036	2018-11-27 11:50:02.618978+00	377	Что мне делать если при регистрации в Skrill система пишет некорректный город и некорректный адрес???	1	new through import_export	9	1
1037	2018-11-27 11:50:02.621115+00	378	Как мне зарегистрироваться в Skrill ,когда система пишет, что у меня некорректный адрес и город. Всё правильно как в паспорте что не так?	1	new through import_export	9	1
1038	2018-11-27 11:50:02.623397+00	379	логина, сегодня первый раз получилось войти, но потом вылетел и снова не могу войти. Может вы в курсе в вем проблема?	1	new through import_export	9	1
1039	2018-11-27 11:50:02.626291+00	380	Нашла одно приложение в аб сторе , но там не даёт Приложение регистрации , пишит введите номер купона. Но у меня его нет . Как мне на айфон скачать приложение и зарегистрироватся?	1	new through import_export	9	1
1040	2018-11-27 11:50:02.629401+00	381	не могу зайти в личный кабинет пишет не правильный пароль,а все пишу правильно,и восстановить так же не получается,что делать?	1	new through import_export	9	1
1041	2018-11-27 11:50:02.632054+00	382	Хочу удалить анкету !	1	new through import_export	9	1
1042	2018-11-27 11:50:02.634021+00	383	Приветствую! Подскажите пожалуйста как это сделать, кому и куда написать?	1	new through import_export	9	1
1043	2018-11-27 11:50:02.636048+00	384	доброго времени суток. у меня на сайте два профиля. один я хочу удалить. подскажите как	1	new through import_export	9	1
1044	2018-11-27 11:50:02.637844+00	385	подскажите как добавить каппера в рейтинг? заранее спс	1	new through import_export	9	1
1045	2018-11-27 11:50:02.639752+00	386	Как добавить свою группу вк в рейтинг капперов ?	1	new through import_export	9	1
1046	2018-11-27 11:50:02.641656+00	387	Проблемы с системой Skrill	1	new through import_export	9	1
1047	2018-11-27 11:50:02.64331+00	388	Не могу найти как удалить свою страницу.	1	new through import_export	9	1
1048	2018-11-27 11:50:02.645144+00	389	Почему вы меня заблокировали?	1	new through import_export	9	1
1309	2018-11-27 11:50:03.231883+00	650	кто ты такой	1	new through import_export	9	1
1049	2018-11-27 11:50:02.646556+00	390	Как добавить свою группу вк по спорт.прогнозам в рейтинг?	1	new through import_export	9	1
1050	2018-11-27 11:50:02.648225+00	391	Хотелось бы добавить свою группу к вам на сайт. Что для это нужно сделать?	1	new through import_export	9	1
1051	2018-11-27 11:50:02.649861+00	392	Хотелось узнать на какой стадии мой запрос, и какое решение было принято.	1	new through import_export	9	1
1052	2018-11-27 11:50:02.651578+00	393	Что нужно сделать, чтобы моя капперская группа в вк попала в ваш рейтинг?	1	new through import_export	9	1
1053	2018-11-27 11:50:02.653654+00	394	Столкнулась с группой прогнозистов  verbalen. В ваших отзывах о каперах о них ничего не написано. Статистика у них отличная. Пожалуйста проверьте эту группу, не рисуют ли они статистику. Спасибо))	1	new through import_export	9	1
1054	2018-11-27 11:50:02.655802+00	395	Примет ли Betcity нотариально заверенную доверенность мобильного номера?	1	new through import_export	9	1
1055	2018-11-27 11:50:02.65795+00	396	Случайно указал не ту дату события, как это исправить?	1	new through import_export	9	1
1056	2018-11-27 11:50:02.660606+00	397	Выйграл сумму денег в ив играх на 1xbet,не могу понять как вывести выйгранную сумму денег,подскажите?	1	new through import_export	9	1
1057	2018-11-27 11:50:02.663219+00	398	не выплачивают выигрыши хочу закрыть счет	1	new through import_export	9	1
1058	2018-11-27 11:50:02.665577+00	399	Если в теннисном матче до победы игрока, на которого сделана ставка, остается один гейм на его подаче, а соперник сдается ( счет 7:6, 5:4) Букмекерская контора Бет365 Спасибо	1	new through import_export	9	1
1059	2018-11-27 11:50:02.667588+00	400	Не могу зайти в личный кабинет, для пополнения счета, сервер не отвечает, почему?	1	new through import_export	9	1
1060	2018-11-27 11:50:02.6695+00	401	Не могу зайти к себе в личный кабинет !	1	new through import_export	9	1
1061	2018-11-27 11:50:02.671337+00	402	Как удалить свой аккаунт на всегда?	1	new through import_export	9	1
1062	2018-11-27 11:50:02.67336+00	403	Здраствуйте, хотел спросить есть ли где то на сайте информация по ставкам прогнозистов за более длительный период (например за полгода на Генича)?	1	new through import_export	9	1
1063	2018-11-27 11:50:02.675147+00	404	Подскажите, пожалуйста, как можно попасть в рейтинг капперов? Имеется группа вконтакте и различные рассылки на разных биржах о ставках! Также есть канал на ютюбе. Не знаю можно ли здесь публиковать сс	1	new through import_export	9	1
1064	2018-11-27 11:50:02.677256+00	405	Если мой прогноз не допускается на главную страницу трибуны то его по окончание не расчитывают?	1	new through import_export	9	1
1065	2018-11-27 11:50:02.679334+00	406	Является ли банковский перевод моментальным?	1	new through import_export	9	1
1066	2018-11-27 11:50:02.681219+00	407	Что случилось с ФАВБЕТ ? Насколько это серьезно?Как вывести средства со счетов?	1	new through import_export	9	1
1067	2018-11-27 11:50:02.683259+00	408	мне вот интересно!Когда регистрируюсь в БК,то нужно вводить паспортные данные,это надёжно???	1	new through import_export	9	1
1068	2018-11-27 11:50:02.685288+00	409	Я инвалид 2группы и позтому индентификацию могу пройти заочно.Для этого 7.04.2017 заполнил все требуемые паспортные данные и также повторил по скайпу.Но оказалось ,что -то не прошёл.Прошу сообщить пож	1	new through import_export	9	1
1069	2018-11-27 11:50:02.687296+00	410	Я сделал ставку, потом уже через 3 дня пишут что сайт заблокировали, могу я вернуть деньги ?	1	new through import_export	9	1
1070	2018-11-27 11:50:02.689452+00	411	Я вожу числа с карточки , деньги снимаются на пару минут , и потом снова перекидываются на аккаунт Помогите пожалуйста	1	new through import_export	9	1
1071	2018-11-27 11:50:02.691757+00	412	Как перевести деньги если на выводе средств в 1xbet нет такого пункта как Сбербанк онлайн	1	new through import_export	9	1
1072	2018-11-27 11:50:02.693975+00	413	Кинул деньги на сайт через киви кошелёк они не пришли. Много раз так делал все было хорошо а сейчас деньги не пришли остался чек. Как быть.	1	new through import_export	9	1
1073	2018-11-27 11:50:02.695965+00	414	не принимает деньги по картам, по киви прошла оплата. в чем дело?	1	new through import_export	9	1
1074	2018-11-27 11:50:02.69832+00	415	прошла ставка!выиграл деньги. после чего решил вывести их. захожу, на счет -он заблокирован! мне пришло от вас письмо с паролем! что с ним делать? как вывести деньги? с кем связаться? вот такое письмо	1	new through import_export	9	1
1075	2018-11-27 11:50:02.700598+00	416	Запрос на вывод был одобрен, но деньги все никак не проходят. В окошке обозначено, что перевод в процессе и ожидает подтверждения у оператора. Но что-то долго он не подтверждает. Сколько времени приде	1	new through import_export	9	1
1076	2018-11-27 11:50:02.702876+00	417	Сделал запрос на вывод средств, одобрили но деньги не приходят они в процессе уже 3 день, но попробовал вывести 100 рублей сразу перевели	1	new through import_export	9	1
1310	2018-11-27 11:50:03.23429+00	651	сука блядь	1	new through import_export	9	1
1311	2018-11-27 11:50:03.236739+00	652	ах ты пидор	1	new through import_export	9	1
1077	2018-11-27 11:50:02.705077+00	418	В техподдержке уже неделю пишут что проблемы со шлюзом и деньги нельзя вывести. Выводы висят в обработке день, затем возвращаются с пометкой "Перезакажите выплату"	1	new through import_export	9	1
1078	2018-11-27 11:50:02.707386+00	419	Только зарегистрировалась и положила деньги на счет а номер счета не по смотрела приложение вылетело тут же захожу нет профиля как узнать номер счета?	1	new through import_export	9	1
1079	2018-11-27 11:50:02.709527+00	420	Здравствуйте,я вчера пополнил счёт 2 раза деньги не пришли.В чем дело?3026293	1	new through import_export	9	1
1080	2018-11-27 11:50:02.711709+00	421	Забыл номер счета,он мне пришел на телефон а это сообщение удалил,что мне делать	1	new through import_export	9	1
1081	2018-11-27 11:50:02.713881+00	422	я создал через мобильное прил номер счета потом мне придложили скачать другую версию!!!!! когда я хотел снять со счета деньги он попросил авторизоватся я зарегистрировался заново и не могу вывести ден	1	new through import_export	9	1
1082	2018-11-27 11:50:02.715719+00	423	не могу вывести денежные средства со счета, не приходит индефикация? Как мне быть?	1	new through import_export	9	1
1083	2018-11-27 11:50:02.718122+00	424	Как получить бесплатный бонус, после пополнения счёта и после скольких игр, его можно вывести ?	1	new through import_export	9	1
1084	2018-11-27 11:50:02.720427+00	425	что делать если забыли секретные вопросы?	1	new through import_export	9	1
1085	2018-11-27 11:50:02.722642+00	426	Квитанция:2453 Терминал:10261474 Дата:02.05.2017 15:33:36 Поставщик: Киви банк Зачислено:100 руб. Номер телефона/счета: 79670847870 Код операции:3891908147 Почему деньги не пришел на моего личного каб	1	new through import_export	9	1
1086	2018-11-27 11:50:02.724785+00	427	Подскажите как я могу снять деньги	1	new through import_export	9	1
1087	2018-11-27 11:50:02.727071+00	428	уважаемый админ! Ответьте, пожалуйста на вопрос. Как мне вывести деньги со счета БК Марафон, если я не помню ответа на секретный вопрос? Ответ по глупости оказался не записан и со временем забыт. Возм	1	new through import_export	9	1
1088	2018-11-27 11:50:02.72925+00	429	Нет возможности делать запросы в личном кабинете через пк.	1	new through import_export	9	1
1089	2018-11-27 11:50:02.733489+00	430	Добрый день, не выводят на киви уже в течении трёх дней, проблема как будто не решается, возможно ли вывести другим способом деньги? 	1	new through import_export	9	1
1090	2018-11-27 11:50:02.736716+00	431	Ограничения по количеству ставок в экспрессе отсутствует?	1	new through import_export	9	1
1091	2018-11-27 11:50:02.739341+00	432	Здрасте. Когда Марафон станет белым, пушистым и будет работать через ЦУПИС? Чехарда с перебоями в работе из-за блокировок уже утомила. Раз ваши программисты не могут наладить бесперебойную работу, как	1	new through import_export	9	1
1092	2018-11-27 11:50:02.741975+00	433	Как осуществляется (или осуществляется ли) удержание налога с выигрышных ставок?	1	new through import_export	9	1
1093	2018-11-27 11:50:02.744389+00	434	Доброго времени суток. Год назад были порезаны максимумы по счёту 93768GU из-за нескольких ставок по вилкам, это стратегий давно не пользуюсь. Есть ли возможность восстановить максимумы для комфортной	1	new through import_export	9	1
1094	2018-11-27 11:50:02.746281+00	435	Зарегистрировался на Лига ставок по вашей партнёрке, бонус не начислен, Телепняк Максим Анатольевич, номер счёта 997468834	1	new through import_export	9	1
1095	2018-11-27 11:50:02.748075+00	436	Скиньте сылку на Фонбет в апстори	1	new through import_export	9	1
1096	2018-11-27 11:50:02.749779+00	437	давно не заходил в приложение(ФОНБЕТ)на айфоне,недавно попытался зайти,не чего не открывает и выдаёт непонятные ошибки,чтобы перезайти не помню не логин не пароль. подскажите как быть?	1	new through import_export	9	1
1097	2018-11-27 11:50:02.752023+00	438	Подскажие что нужно сделать для того чтобы отправить свой ресурс на проверку Вашей компанией?	1	new through import_export	9	1
1098	2018-11-27 11:50:02.754089+00	439	Не могу зайти на свой профиль,пишет безопасное подключение не возможно	1	new through import_export	9	1
1099	2018-11-27 11:50:02.75638+00	440	Никак не получается зайти на страницу входа,где я смог бы ввести свой логин и пароль,главная страница,страница поддержки и т.д. спокойно открываются.Подскажите пожалуйста,в чем дело?	1	new through import_export	9	1
1100	2018-11-27 11:50:02.758382+00	441	несколько раз пробовал снять деньги на карту, но показывает что какая то ошибка	1	new through import_export	9	1
1101	2018-11-27 11:50:02.760838+00	442	на счете в бк находится депозит оплаченный истекшей картой. Если я сейчас сделаю пополнение новой картой, смогу ли снять потом и предыдущий депозит? Или только банковский перевод?	1	new through import_export	9	1
1102	2018-11-27 11:50:02.763277+00	443	При регистрации пишет, что пользователь с данным lp уже зарегистрирован	1	new through import_export	9	1
1312	2018-11-27 11:50:03.23913+00	653	мудила ебаная	1	new through import_export	9	1
1313	2018-11-27 11:50:03.241224+00	654	пидорас обоссаный 	1	new through import_export	9	1
1103	2018-11-27 11:50:02.766516+00	444	Подскажите, не будет ли проблем (при выводе средств с букмекерской конторы) при использовании НЕ именной карты? могут ли они потребовать её фото и не вызовет ли она каких-либо вопросов или подозрений?	1	new through import_export	9	1
1104	2018-11-27 11:50:02.769548+00	445	Через рейтинг букмекеров по бонусной программе в бк Леон не проходит регистрация?Все поля заполнил правильно!Пишут добавить 1цифру или букву в пароль.Добавил аж до двадцати включая символы!-и так раз 	1	new through import_export	9	1
1105	2018-11-27 11:50:02.772686+00	446	Когда я хочу пополнить счёт с карты,то пишет ваш депозит заблокирован,что делать?	1	new through import_export	9	1
1106	2018-11-27 11:50:02.775184+00	447	Вчера только что зарегистрировался на сайте,а сегодня уже не могу туда зайти,пишет ваш щет заблокировать,как так что это такое	1	new through import_export	9	1
1107	2018-11-27 11:50:02.777603+00	448	Заблокировали игровой счёт, почему?	1	new through import_export	9	1
1108	2018-11-27 11:50:02.779969+00	449	Уже третьи сутки не пополняется счёт в бетсити с карты VISA. Вводу все данные нажимаю продолжить и пишет сразу счёт не выставлен ошибка пополнения. Помогите	1	new through import_export	9	1
1109	2018-11-27 11:50:02.782505+00	450	Не могу зайти в аккаунт, пишет, что не правильный логин или пароль, хотя логин мой майл, пароль поменяла, но всё равно пишет, что не правильно!! Что я делаю не так?	1	new through import_export	9	1
1110	2018-11-27 11:50:02.785392+00	451	Дело в том что я хочу зарегистрироваться в БК но имею временную прописку,по этому хочу узнать возникнут ли у меня с этим проблемы с дальнейшей идентификацией.	1	new through import_export	9	1
1111	2018-11-27 11:50:02.787832+00	452	Вазможно ли вастановить 1 ый аккаунт 1xBet по паспортным данным ели я потерял номер счёта и пароль ?	1	new through import_export	9	1
1112	2018-11-27 11:50:02.790637+00	453	Правда ли что есть такие ограничения? Я ни где не нашёл это в их правилах	1	new through import_export	9	1
1113	2018-11-27 11:50:02.793485+00	454	просят верифицироваться на сайте но я не могу найти где это можно сделать, подскажите пожалуйста	1	new through import_export	9	1
1114	2018-11-27 11:50:02.798203+00	455	Как восстановить пароль на 1x bet ?	1	new through import_export	9	1
1115	2018-11-27 11:50:02.801585+00	456	Будут ли в этом году традиционные новогодние фрибеты от компании фонбет?	1	new through import_export	9	1
1116	2018-11-27 11:50:02.804148+00	457	Почему в белорусской версии сайта и на ППС не предлагаются дополнительные исходы на статистику футбол, теннис, хоккей?	1	new through import_export	9	1
1117	2018-11-27 11:50:02.806338+00	458	Я бы хотел поменять мой электронный адрес на сайте Винлайн.com я указал неверный ошибочно как это сделать?	1	new through import_export	9	1
1118	2018-11-27 11:50:02.808554+00	459	Скажите Можно ли восстановить пароль с помощью номера телефона через который я регистрировался?	1	new through import_export	9	1
1119	2018-11-27 11:50:02.810589+00	460	Зарегистрировал не правильный номер,не могу поменять,не открывает страницу	1	new through import_export	9	1
1120	2018-11-27 11:50:02.812765+00	461	Интересует количество накопленных баллов	1	new through import_export	9	1
1121	2018-11-27 11:50:02.814893+00	462	Что у вас за платформа .Как мне войти на покер онлайн.Всё время пишет не верный пароль .Пробовал менять .Открывается всё кроме покера онлайн .Мой логин 3370813.	1	new through import_export	9	1
1122	2018-11-27 11:50:02.817236+00	463	Пройдёт ли верификация если счёт зарегистрирован на старый паспорт (номер,прописка и т.д) а я пришлю ксерокопию нового паспорта (заменил в 20 лет)	1	new through import_export	9	1
1123	2018-11-27 11:50:02.819698+00	464	Такой вопрос я играю по бою и довольно таки не плохо могу выкатать играя в лайве. Скажите после какой суммы вы меня обрежете?? Ставлю не вилки не доги и т.д. По бою но выиграть могу много	1	new through import_export	9	1
1124	2018-11-27 11:50:02.821966+00	465	живу в украине,bet365 заблокировал аккаунт,пвх получила,документы заверила и отослала,отправила банковские реквизиты они не подходят,они не могут переслать средства через американский банк посредник,ч	1	new through import_export	9	1
1125	2018-11-27 11:50:02.824009+00	466	Зарегистрировался в конторе Leon. Ввел бонусный код. Зачисление бонусных денег не произошло. Что делать?	1	new through import_export	9	1
1126	2018-11-27 11:50:02.826052+00	467	Я немогу зарегистрироваться на winline , может белорусам закрыли доступ?	1	new through import_export	9	1
1127	2018-11-27 11:50:02.828052+00	468	А скажите пожалуйста в каком конкурсе прогнозов можно поучаствовать в ближайшее время?? есть ли какие нибудь варианты заработать на этом сайте?	1	new through import_export	9	1
1128	2018-11-27 11:50:02.830598+00	469	Выкинуло с моего аккаунта и не заходит и вобще олимп не работает	1	new through import_export	9	1
1129	2018-11-27 11:50:02.83358+00	470	Хочу знать какие страны запрещены на Winline	1	new through import_export	9	1
1314	2018-11-27 11:50:03.243151+00	655	блядь ебись ты	1	new through import_export	9	1
1130	2018-11-27 11:50:02.845386+00	471	А скажите пожалуйста в каком конкурсе прогнозов можно поучаствовать в ближайшее время?? есть ли какие нибудь варианты заработать на этом сайте?	1	new through import_export	9	1
1131	2018-11-27 11:50:02.847893+00	472	Прошло почти 2 недели, как мой счет заблокирован в БК Марафон после моего обращения о неавторизированном использовании игрового счета. Хотелось бы конкретики относительно сроков рассмотрения деталей п	1	new through import_export	9	1
1132	2018-11-27 11:50:02.850032+00	473	Как мне пополнить счет?	1	new through import_export	9	1
1133	2018-11-27 11:50:02.852076+00	474	У моего друга заблокировали счет в БК "Олимп".Видимо , потому что , он очень много выиграл.Как вернуть деньги и разблокировать счет?	1	new through import_export	9	1
1134	2018-11-27 11:50:02.8542+00	475	По какой ссылке можно зайти на сайт ?	1	new through import_export	9	1
1135	2018-11-27 11:50:02.856207+00	476	Здравствуйте не могу зайти на сайт?	1	new through import_export	9	1
1136	2018-11-27 11:50:02.858093+00	477	Добрый день, у меня вопрос касательно конторы 1xbet. Поставил свою первую ставку в этой конторе (крупную сумму) на событие ночью с коэффициентом 1,43, утром захожу в историю ставок стоит 1,2. Скрины н	1	new through import_export	9	1
1137	2018-11-27 11:50:02.86002+00	478	три дня назад поставил ставку выбрал экспресс вроде бы все съиграло только я незнаю одной игры из экспресса тенисный матч ну я думаю что моя ставка съиграла. я не могу получить расчет уже 3 дня	1	new through import_export	9	1
1138	2018-11-27 11:50:02.861718+00	479	Что делать если взломали и забрали деньги ?	1	new through import_export	9	1
1139	2018-11-27 11:50:02.863682+00	480	В моем городе Луганске, в 1 момент закрылись все ваши конторы(одновременно и спонтанно) а деньги выигранные остались у Вас, как мне их вернуть?	1	new through import_export	9	1
1140	2018-11-27 11:50:02.865441+00	481	я не пойму почему пару моих ставок застыли и ничего не происходит с ними,написано не рассчитано и всё!!!как это понимать?	1	new through import_export	9	1
1141	2018-11-27 11:50:02.867209+00	482	Направил документы в зенитбет для верификации счета еще 18 июня,Сегодня уже 29 июня но так и не могу вывести денежные средства.Сколько еще ждать?	1	new through import_export	9	1
1142	2018-11-27 11:50:02.868936+00	483	Заблокировали аккаунт на Лиге ставок, документы отправил в тот же день. Прошло два дня ни ответа ни привета. Неприятно.......	1	new through import_export	9	1
1143	2018-11-27 11:50:02.870771+00	484	запросили документы на БК Betcity, отправил весь пакет документов, отличного качества, написали ожидайте, прошла неделя, я пишу уже 2 дня они игнорируют мои сообщения!	1	new through import_export	9	1
1144	2018-11-27 11:50:02.872912+00	485	Сколько длится верификация Подскажите	1	new through import_export	9	1
1145	2018-11-27 11:50:02.874821+00	486	Здравствуйте,уважаемые специалисты.Пожалуйста подскажите-сколько времени длиться проверка документов в следующих конторах:Betfair,Liga stavok,SBOBET?	1	new through import_export	9	1
1146	2018-11-27 11:50:02.876883+00	487	Попросили фото паспорта я скинул и теперь говорят что я в очереди. эта очередь вообще существует ? и сколько мне ждать пока проверять данные ?	1	new through import_export	9	1
1147	2018-11-27 11:50:02.878808+00	488	Заблокировали счет. Попросили все нужные документы для идентификации. Отправил всё что запрашивали. Но четвертый день с заблокированным счетом и замороженным балансом на нем. Подскажите пожалуйста ско	1	new through import_export	9	1
1148	2018-11-27 11:50:02.880903+00	489	Хотел вывести средства, запросили документы ... Сказали ожидать... Прошло около недели... Это нормально? И по каким прияинам мой счет проверяют?? Контора бетсити...	1	new through import_export	9	1
1149	2018-11-27 11:50:02.882753+00	490	Как долго идут деньги с вебмани, сколько ждать	1	new through import_export	9	1
1150	2018-11-27 11:50:02.88463+00	491	Как долго ждать перевода на Webmoney из букмекерской конторы?	1	new through import_export	9	1
1151	2018-11-27 11:50:02.886081+00	492	То, что в РФ блокируют сайты, не означает что они запрещены?	1	new through import_export	9	1
1152	2018-11-27 11:50:02.887857+00	493	Какими суммами лучше выводить, слышал лучше каждый день по 1,5к так меньше вероятность что на счет поставят ограничегия	1	new through import_export	9	1
1153	2018-11-27 11:50:02.8897+00	494	Пойдет ли Visa Electron для ввода и вывода средств в БК?	1	new through import_export	9	1
1154	2018-11-27 11:50:02.891462+00	495	Стоит ли отправлять фото паспорта в 1xbet? Боюсь что вся личная информация попадет не в тех руки и воспользуется для корыстных дел ??	1	new through import_export	9	1
1155	2018-11-27 11:50:02.893036+00	496	у вас на сайте есть два обзора конторы ""Винлайн"", я не совсем понимаю это две разные конторы с двумя разными сайтами или как?  	1	new through import_export	9	1
1156	2018-11-27 11:50:02.89451+00	497	Какой способ перевода денег более быстрый?	1	new through import_export	9	1
1315	2018-11-27 11:50:03.24514+00	656	иди нахуй	1	new through import_export	9	1
1316	2018-11-27 11:50:03.247335+00	657	как ты?	1	new through import_export	9	1
1157	2018-11-27 11:50:02.896213+00	498	Ало! Логин и пароль все на листочки, заходил все норм было,сейчас пишет Неверный пароль или Логин!200 что делать?	1	new through import_export	9	1
1158	2018-11-27 11:50:02.897713+00	499	Добрый день.Я только изучаю искусство беттинга,поэтому прошу прощения за,может быть,глупые вопросы)	1	new through import_export	9	1
1159	2018-11-27 11:50:02.899087+00	500	Две ставки не допустили на трибуну, загружал с картинками, что ещё не так делаю?)	1	new through import_export	9	1
1160	2018-11-27 11:50:02.900582+00	501	уже который раз удалили мои прогнозы без объяснения причины, напишите хотя бы что не так делаю, чтобы больше не совершать таких ошибок. Модераторы, к вам вопрос.	1	new through import_export	9	1
1161	2018-11-27 11:50:02.902183+00	502	Добрый вечер, мой прогноз не попал на главную страницу трибуны по не понятным мне причинам.Может быть, он совпадает с прогнозом кого-либо, но я не могу каждый раз проверять все прогнозы на матч, дабы 	1	new through import_export	9	1
1162	2018-11-27 11:50:02.903938+00	503	Добрый день, не могли бы указать на мои ошибки, что я не так сделал? Мой прогноз не попал на трибуну. Чтоб я в дальнейшим исправился и не делал прежних ошибок.  	1	new through import_export	9	1
1163	2018-11-27 11:50:02.906089+00	504	Здраствуйте,опубликовал прогноз,а что нужно сделать что бы он попал в каперскую трибуну?	1	new through import_export	9	1
1164	2018-11-27 11:50:02.908148+00	505	Ман Сити - Саутгемптон прогноз не засчитан почему?	1	new through import_export	9	1
1165	2018-11-27 11:50:02.909577+00	506	Скажите.А почему мой прогноз Манчестер Юнайтед- Суонси не выставили на трибуну?Спасибо	1	new through import_export	9	1
1166	2018-11-27 11:50:02.911346+00	507	Здравствуйте вчера удалили прогноз на МЮ без объяснения два раза, как понять? А прогноз прошел	1	new through import_export	9	1
1167	2018-11-27 11:50:02.91333+00	508	Мой прогноз не опубликовали на Трибуну, как можно узнать, почему? и можно ли отредактировать, чтобы прогноз пропустили на трибуну?  	1	new through import_export	9	1
1168	2018-11-27 11:50:02.915116+00	509	Сделал прогноз на матч Ростов - Андерлехт прогноз не прошел модерацию и не будет расчитан	1	new through import_export	9	1
1169	2018-11-27 11:50:02.916735+00	510	прогноз не допущен на главную трибуну, УКАЖИТЕ пожалуйста на ошибки допущенные мной	1	new through import_export	9	1
1170	2018-11-27 11:50:02.918515+00	511	почему не выложили мой последний прогноз?	1	new through import_export	9	1
1171	2018-11-27 11:50:02.920422+00	512	Почему не одобряют прогноз?	1	new through import_export	9	1
1172	2018-11-27 11:50:02.92251+00	513	я оставлял прогноз на лигу чемпионов но его не допустили.можно узнать почему?	1	new through import_export	9	1
1173	2018-11-27 11:50:02.924751+00	514	что значит прогноз не прошел модерацию и почему,в связи с чем как узнать	1	new through import_export	9	1
1174	2018-11-27 11:50:02.926901+00	515	Выложил прогноз,а он не прошел почему то модерацию,в чем причина?!  	1	new through import_export	9	1
1175	2018-11-27 11:50:02.929705+00	516	Второй раз подряд не публикуют прогноз на трибуну ? Могу узнать причину?	1	new through import_export	9	1
1176	2018-11-27 11:50:02.931946+00	517	Почему я не могу добавить прогноз? Почему не меняется с любителя на игрок? я уже сделал 2 отзыва	1	new through import_export	9	1
1177	2018-11-27 11:50:02.933947+00	518	ДАЛ 2 ПРОГНОЗА-НИ ОДИН НЕ ПРОШЕЛ МОДЕРАЦИЮ-ЧТО ТАКОЕ?	1	new through import_export	9	1
1178	2018-11-27 11:50:02.935949+00	519	можно узнать причину не попадания моего прогноза на МЮ-Сток , чтобы исправить мои ошибкы.?	1	new through import_export	9	1
1179	2018-11-27 11:50:02.938238+00	520	Пропали 2 моих последних прогноза.	1	new through import_export	9	1
1180	2018-11-27 11:50:02.940461+00	521	Доброго времени суток! Мои два прогноза не попали на трибуну (один на нба, второй на КХЛ). Коэффициента брал с Вильям Хилла, картинка соответствующего размера.	1	new through import_export	9	1
1181	2018-11-27 11:50:02.946057+00	522	хотел узнать почему мой прогноз не был допущен на главную страницу трибуны?	1	new through import_export	9	1
1182	2018-11-27 11:50:02.949144+00	523	Я вылаживаю прогноз на трибуне, но при просмотре ставки ее удаляют, почему? Подозрение в копипасте? Этот прогноз я выложил еще на vprognoze.ru Могу подтвердить что там тоже моя страница привязана к са	1	new through import_export	9	1
1183	2018-11-27 11:50:02.951258+00	524	Вернут ли ставку, если счет в лайве был неправильным, а я проиграл, сделав ставку?	1	new through import_export	9	1
1184	2018-11-27 11:50:02.953417+00	525	За что бк может меня заблокировать забанить?	1	new through import_export	9	1
1185	2018-11-27 11:50:02.955517+00	526	За что обычно блокируют букмекерские конторы?	1	new through import_export	9	1
1186	2018-11-27 11:50:02.958219+00	527	Почему делают блок букмекеры?	1	new through import_export	9	1
1187	2018-11-27 11:50:02.960555+00	528	За что могут заблокировать счет в БК	1	new through import_export	9	1
1188	2018-11-27 11:50:02.962842+00	529	За что мой счет в БК может быть заблокирован?	1	new through import_export	9	1
1317	2018-12-25 11:34:48.815693+00	0	Как мне разместить прогноз?	2	update through import_export	9	1
1189	2018-11-27 11:50:02.965133+00	530	Для верификации адреса в платежной системе нужна банковская выписка по переводу именно в ту систему, в которой я прохожу проверку личности?	1	new through import_export	9	1
1190	2018-11-27 11:50:02.967201+00	531	День добрый! Отписался от писем, которые приходят с информацией о комментариях к постам. Как подписать обратно?	1	new through import_export	9	1
1191	2018-11-27 11:50:02.969458+00	532	ПРоблемы с киви	1	new through import_export	9	1
1192	2018-11-27 11:50:02.971435+00	533	есть проблемы с выводом на QIWI	1	new through import_export	9	1
1193	2018-11-27 11:50:02.974902+00	534	Утеряна симка, но доступ к киви-кошельку остался. При переводе денежных средств приложение постоянно запрашивает подтверждение по смс-номеру кошелька. Как быть? Восстановлению сим-карта не подлежит, и	1	new through import_export	9	1
1194	2018-11-27 11:50:02.977466+00	535	За что режут максимумы	1	new through import_export	9	1
1195	2018-11-27 11:50:02.979815+00	536	порезка счетов, что это и почему	1	new through import_export	9	1
1196	2018-11-27 11:50:02.982393+00	537	Почему порезали максимумы, что это вообще такое, что за ограничение	1	new through import_export	9	1
1197	2018-11-27 11:50:02.984756+00	538	Почему понизили максимумы на сумму ставки? Что с этим можно сделать?	1	new through import_export	9	1
1198	2018-11-27 11:50:02.986858+00	539	Как делать ставки?	1	new through import_export	9	1
1199	2018-11-27 11:50:02.988718+00	540	Хочу начать играть. Как это сделать? с чего начать? как зарегистрироваться в бк?	1	new through import_export	9	1
1200	2018-11-27 11:50:02.99099+00	541	Хочу сделать ставку, как зарегаться у букмекера	1	new through import_export	9	1
1201	2018-11-27 11:50:02.993667+00	542	Как начать играть, как пополнить счет. что делать?	1	new through import_export	9	1
1202	2018-11-27 11:50:02.995995+00	543	как пополнить счет и как делать ставки?	1	new through import_export	9	1
1203	2018-11-27 11:50:02.998386+00	544	Забыл свой айдишник, айди, что делать чтобы его восстановить?	1	new through import_export	9	1
1204	2018-11-27 11:50:03.000539+00	545	Как можно восстановить айди? Id, я забыл его	1	new through import_export	9	1
1205	2018-11-27 11:50:03.003391+00	546	Забыл свой ID, что делать?	1	new through import_export	9	1
1206	2018-11-27 11:50:03.005947+00	547	Почему когда даешь прогноз в разделе "Букмекер" нету букмекерской конторы Бетсити?	1	new through import_export	9	1
1207	2018-11-27 11:50:03.009222+00	548	Нужно ли при регистрации в зарубежных БК переводить паспортные данные?	1	new through import_export	9	1
1208	2018-11-27 11:50:03.011795+00	549	Что нужно для получения VIP-статуса в Skrill?	1	new through import_export	9	1
1209	2018-11-27 11:50:03.013839+00	550	Пользуюсь вашим сайтом. Но с мобильного телефона немного неудобно. Хотелось бы иметь приложение. Если оно есть. И если его нет, то будете ли вы его создавать?	1	new through import_export	9	1
1210	2018-11-27 11:50:03.015992+00	551	Есть ли мобильное приложение Вашего сайта для устройств на Andriod?	1	new through import_export	9	1
1211	2018-11-27 11:50:03.018119+00	552	почему мои прогнозы удаляют?	1	new through import_export	9	1
1212	2018-11-27 11:50:03.020774+00	553	Публикую прогноз на матч "Наполи" - "Аталанта" во второй или третий раз и он почему-то пропадает. Остальные прогнозы публикуются адекватно.	1	new through import_export	9	1
1213	2018-11-27 11:50:03.023311+00	554	Даю прогнозы на РБ , но спустя несколько часов они просто исчезают , и даже если они нормально написаны , то у других то прогнозы остаются , а мои убирают с сайта , что за дискриминация	1	new through import_export	9	1
1214	2018-11-27 11:50:03.025504+00	555	Спустя час после публикации прогноз был удалён	1	new through import_export	9	1
1215	2018-11-27 11:50:03.027738+00	556	Добрый день. Сегодня был по непонятной мне причине удалён прогноз "Лестер"-"Челси". Прогноз Дмитрия Юркина. Висел весь день, было 400 просмотров. Все названия команд в кавычках, написано грамотно и со	1	new through import_export	9	1
1216	2018-11-27 11:50:03.030614+00	557	Что за бред ??? какой день уже в подряд удаляют прогноз без обяснение , причем быстро. Где справедливость , или это палки в колеса ? Админы вообще в адеквате ?	1	new through import_export	9	1
1217	2018-11-27 11:50:03.033177+00	558	Мой первый прогноз на матч Аргентина-Чили не прошел проверку, в связи ряда ошибок. Я делал несколько раз новый прогноз с учетом ошибок указанные модератором, но он в течение минуты пропадал.	1	new through import_export	9	1
1218	2018-11-27 11:50:03.035426+00	559	Выложил прогноз на матч в 20-30 Лестер-Манчестер Сити Ставка Обе забьют-да кф-1.66, все сделал по правилам и без ошибок. И не могу понять почему отказали и не выложили его в трибуну? Затратил много вр	1	new through import_export	9	1
1219	2018-11-27 11:50:03.038276+00	560	Почему был удалён мой прогноз?	1	new through import_export	9	1
1220	2018-11-27 11:50:03.040384+00	561	Добрый Разместил 2 прогноза в Конкурсе слава и деньги. Но через 5 минут после размещения они исчезли из моего профиля. В чем проблема?	1	new through import_export	9	1
1318	2018-12-25 11:34:48.823655+00	1	Каким образом я могу опубликовать прогноз?	2	update through import_export	9	1
1221	2018-11-27 11:50:03.042227+00	562	Сегодня днем разместил свой прогноз на матч КХЛ. Динамо (Минск) - Амур. Сейчас прогноза нет, хотя, по моему мнению, он соответствовал требованиям по содержанию. В чем дело?	1	new through import_export	9	1
1222	2018-11-27 11:50:03.04428+00	563	Находится в процессе создания мой сайт, в котором я буду давать прогнозы. Скажите пожалуйста, что нужно будет сделать что бы он прошел проверку РБ? И какое время на это понадобится?	1	new through import_export	9	1
1223	2018-11-27 11:50:03.046435+00	564	Если же игрок в стартовом составе не вышел, то должен быть возврат. Такие правила во всех БК, тогда почему здесь на сайте это проигрыш?	1	new through import_export	9	1
1224	2018-11-27 11:50:03.048942+00	565	В последнее время долго рассматриваются ставки модераторами и долго рассчитываются так долго будет? Просто надеюсь на ваше понимание :)	1	new through import_export	9	1
1225	2018-11-27 11:50:03.051033+00	566	Можете ли вы посмотреть мой прогноз и допустить его на трибуну?	1	new through import_export	9	1
1226	2018-11-27 11:50:03.053314+00	567	Добрый день подскажите как понять прошел модерацию мой прогноз или нет? когда он станет доступен пользователям? Могу ли я в прогнозе написать прогноз от команды аналитиков армани бет. без ссылки или н	1	new through import_export	9	1
1227	2018-11-27 11:50:03.055437+00	568	Сделал прогноз примерно в 4 утра, первый матч по прогнозу в 9 утра,в чем проблема?	1	new through import_export	9	1
1228	2018-11-27 11:50:03.057401+00	569	Подскажите пожалуйста,какие по вашему мнению имеются хорошие букмекерские конторы для ставок в лайве на баскетбол?	1	new through import_export	9	1
1229	2018-11-27 11:50:03.059226+00	570	Посоветуйте пожалуйста хорошего каппера с которым можно поднять банк.	1	new through import_export	9	1
1230	2018-11-27 11:50:03.061097+00	571	Восстанавливаю документы, в ближайшее время предоставить их нет возможности.	1	new through import_export	9	1
1231	2018-11-27 11:50:03.063168+00	572	При вводе прогноза не могу выбрать букмекера,в поиске ничего нельзя найти. Как можно исправить эту проблему?	1	new through import_export	9	1
1232	2018-11-27 11:50:03.065288+00	573	участвую в конкурсе капперов, но при написании прогноза в окне непосредственно ставки не могу выбрать букмекера, выпадает пустой список и при написании ничего не находит. Хэлп	1	new through import_export	9	1
1233	2018-11-27 11:50:03.067269+00	574	Не могу дать прогноз, так как нет выбора букмекерской конторы. Как можно исправить эту не поладку? Или это ограничение?	1	new through import_export	9	1
1234	2018-11-27 11:50:03.069214+00	575	А у уровня "Гуру" есть какие-то привилегии?	1	new through import_export	9	1
1235	2018-11-27 11:50:03.07115+00	576	Разрешено ли регистрироваться и играть в нескольких букмекерских конторах?	1	new through import_export	9	1
1236	2018-11-27 11:50:03.073111+00	577	Просто недавно я дал прогноз и ставку, а результат ещё не рассчитан. Пишут, что Ординар не разыгран.	1	new through import_export	9	1
1237	2018-11-27 11:50:03.074879+00	578	Что грозит вилочнику, если БК вычислит игру на вилках?	1	new through import_export	9	1
1238	2018-11-27 11:50:03.076745+00	579	Приветствую, читателей РБ. Возник вопрос по поводу WinnerLike . О них столько много отзывов у вас на сайте . А по факту, не могу найти толковую информацию о них .	1	new through import_export	9	1
1239	2018-11-27 11:50:03.078607+00	580	подскажите это будет рассматриваться, как открытие второго счета? что запрещено правилами?	1	new through import_export	9	1
1240	2018-11-27 11:50:03.080577+00	581	Что за странная ссылка, при нажатии кнопки - перейти на сайт? Причем нерабочая. На сайт так и не попал.	1	new through import_export	9	1
1241	2018-11-27 11:50:03.082489+00	582	Букмекерская контора winline находится в двух отделах по оценкам. Winline есть 5 звёзд и 3 звезды, что вводит в не понятки. Прошу разъяснить ситуацию!	1	new through import_export	9	1
1242	2018-11-27 11:50:03.084473+00	583	скажите что случилось с БК? не могу зайти с мобильного и не могу найти программу для установки на мобильный?	1	new through import_export	9	1
1243	2018-11-27 11:50:03.086426+00	584	должен ли я буду заплатить какой то налог в налоговую, при выводе денежных средств в России.	1	new through import_export	9	1
1244	2018-11-27 11:50:03.088367+00	585	Я могу ограничить себя от комментариев и прочего вообще появления на мои глаза одного человека ?	1	new through import_export	9	1
1245	2018-11-27 11:50:03.089907+00	586	как посмотреть свой прогноз?	1	new through import_export	9	1
1246	2018-11-27 11:50:03.091723+00	587	При регистрации в "Лиге ставок", прошел регистрацию на 1cupis. ru. При вводе "цупис" в присковой системе помимо 1cupis, одним из первых идет tsupis.ru.	1	new through import_export	9	1
1247	2018-11-27 11:50:03.093998+00	588	Какие документы контора затребует для проверки возраста и личных данных?	1	new through import_export	9	1
1248	2018-11-27 11:50:03.096269+00	589	Играю в международной конторе, не верифицировал счёт. Надёжно ли это?	1	new through import_export	9	1
1249	2018-11-27 11:50:03.098813+00	590	На эл.почту не приходят прогнозы	1	new through import_export	9	1
1250	2018-11-27 11:50:03.101166+00	591	Почему, когда я пишу комментарии будучи авторизованным под данным профилем, они публикуются от имени другого профиля?	1	new through import_export	9	1
1251	2018-11-27 11:50:03.103689+00	592	Как попасть в команду "РБ"? Какие для этого требования и на каких условиях?	1	new through import_export	9	1
1252	2018-11-27 11:50:03.105768+00	593	Как стать аналитиком РБ?	1	new through import_export	9	1
1253	2018-11-27 11:50:03.107998+00	594	Как попасть в команду "РБ"?	1	new through import_export	9	1
1254	2018-11-27 11:50:03.11016+00	595	подскажите пожалуйста планируются какие нибудь конкурсы на сайте?))	1	new through import_export	9	1
1255	2018-11-27 11:50:03.112401+00	596	нужны рекомендаций советы стратегий-относительно команд(ы) (включая саму игру) имеет ли значение опыт - из чего исходить именно ???	1	new through import_export	9	1
1256	2018-11-27 11:50:03.11453+00	597	Когда стартует анонсированный в новогоднем поздравлении конкурс на 1.5 млн рублей? 	1	new through import_export	9	1
1257	2018-11-27 11:50:03.118062+00	598	Как быть, если для общения со службой поддержки БК требуется знание английского языка, а я им не владею?	1	new through import_export	9	1
1258	2018-11-27 11:50:03.120964+00	599	В какой букмекерской конторе можно делать ставки в mlb именно на победу питчера, а не на победу команды ?	1	new through import_export	9	1
1259	2018-11-27 11:50:03.123465+00	600	Можно ли, как можно быстрее, рассчитать мои прогнозы за прошлый вечер?	1	new through import_export	9	1
1260	2018-11-27 11:50:03.126347+00	601	Подскажите, пожалуйста, в течении какого времени расчитываються прогнозы? Просто мои 2 матча закончились утром , и один в обед, а до сих пор написано - Ожидание. Заранее спасибо.	1	new through import_export	9	1
1261	2018-11-27 11:50:03.129524+00	602	Если я слелал прогноз в трибуне,после окончания прогноза надо самому писать результат и сиграл прогноз или нет если да то как?	1	new through import_export	9	1
1262	2018-11-27 11:50:03.131703+00	603	В течение какого времени модератор проверяет прогноз и распределяет его по спортивной категории(хоккей,баскетбол,футбол)?	1	new through import_export	9	1
1263	2018-11-27 11:50:03.133998+00	604	Почему мой прогноз Локомотив-Рубин не разыгран если я его правильный сделал?	1	new through import_export	9	1
1264	2018-11-27 11:50:03.136676+00	605	Участвую в конкурсе капперов и не могу продолжить, потому что много не рассчитанных ставок.	1	new through import_export	9	1
1265	2018-11-27 11:50:03.139461+00	606	Какой мой баланс на РБ, как он расчитывается и где его смотреть	1	new through import_export	9	1
1266	2018-11-27 11:50:03.14158+00	607	Если верификаторы, которые ведут статистику по лайв-ставкам?	1	new through import_export	9	1
1267	2018-11-27 11:50:03.143583+00	608	Есть ли сайты с помощью которых можно вычислять верояность?? Например, где есть поля для ввода предпологаемых значений, а автоматом выдает вероятностью	1	new through import_export	9	1
1268	2018-11-27 11:50:03.14549+00	609	Доброго времени суток, можно ли как то исправить прогноз после его публикации или удалить его? В спешке прописал не ту команду в итоговой ставке и теперь совсем не ловко подталкивать людей на, вероятн	1	new through import_export	9	1
1269	2018-11-27 11:50:03.147209+00	610	Я хочу изменить свой электронный кошелек, чтобы сделать вывод деньги. Номер моего игрового счета 2732557 , мой электронный кошелек(qiwi) +77087489341 , хочу изменить на +77072611996 . Заранее спасибо,	1	new through import_export	9	1
1270	2018-11-27 11:50:03.148758+00	611	Добрый день! Хотелось бы понять, почему не попадает последний мой прогноз и будет ли он рассчитан для конкурса.	1	new through import_export	9	1
1271	2018-11-27 11:50:03.150368+00	612	Скажите пожалуйста почему в БК Betcity прямая красная карточка не рассчитывается как две ЖК, и более того вторая ЖК повлёкшая за собой красную карточку тоже не считается в общий Тотал ЖК?	1	new through import_export	9	1
1272	2018-11-27 11:50:03.152387+00	613	Можно ли зарегистрированным пользователям, кроме "Команды РБ" добавлять видеопрогнозы?	1	new through import_export	9	1
1273	2018-11-27 11:50:03.154453+00	614	Ищу информационные порталы, посвященные лигам английского футбола начиная от Чемпионшипа (про АПЛ пишут везде и много). Подскажите, если у вас есть подобные.	1	new through import_export	9	1
1274	2018-11-27 11:50:03.156409+00	615	я давал прогноз на матч Реал-Атлетико обе забьют-НЕТ.   ссылка на прогноз, счет 3- 0 и вы ставите мне проигрыш....	1	new through import_export	9	1
1275	2018-11-27 11:50:03.158851+00	616	Как узнать, позволяет ли букмекер завести рублевый счет?	1	new through import_export	9	1
1276	2018-11-27 11:50:03.161392+00	617	С помощью Вашего сайта хотел перейти на сайт БК Пиннакл,с удивлением для меня был перенаправлен на 1хбет,это что сработала партнерская программа с этим букмекером?	1	new through import_export	9	1
1277	2018-11-27 11:50:03.163927+00	618	на прежней версии сайта мой счет был заблокирован. могу ли я на русской версии открыть счет с теми же фио	1	new through import_export	9	1
1278	2018-11-27 11:50:03.166372+00	619	Мой фактический адрес проживания отличается от прописки в паспорте. Какой мне адрес указывать	1	new through import_export	9	1
1279	2018-11-27 11:50:03.168662+00	620	Помогите решить проблему, на ФобетКлиент (Программа для Windows) постоянное подключение на сервер.	1	new through import_export	9	1
1280	2018-11-27 11:50:03.170892+00	621	По правилам необходимо именно зарегистрироваться, т.е вход через соц сети не считается регистрацией?	1	new through import_export	9	1
1281	2018-11-27 11:50:03.172951+00	622	Добрый вечер. Скажите пожалуйста, по каким критериям попадают в топ 12 спортивных прогнозистов «Трибуны», которые были лучшими за последний месяц? Учитываются только % прибыли и чистая прибыль? Или ещ	1	new through import_export	9	1
1282	2018-11-27 11:50:03.1752+00	623	Могут ли граждане Снг сделать ставку в букмекерской конторе? Или только с паспортом Рф?	1	new through import_export	9	1
1283	2018-11-27 11:50:03.177368+00	624	Добрый день, хочу уточнить если я положил на счет например 3 тыс рублей, 1 тыс проиграл, могу ли я вывести эти деньги обратно? Фонбет	1	new through import_export	9	1
1284	2018-11-27 11:50:03.179739+00	625	Какие документы потребуются для прохождения верификации в платежной системе Skrill? Можно ли отослать цифровые фото документов вместо сканированных копий?	1	new through import_export	9	1
1285	2018-11-27 11:50:03.181863+00	626	Какие конторы предлагают бонус? А бонус для России?	1	new through import_export	9	1
1286	2018-11-27 11:50:03.184061+00	627	Добрый день. Закидывал день с помощью MasterCard, списали со счета почти 3 бакса за верификацию. Их вообще вернут обратно? Конечно я лопух, ведь вывести деньги можно только на Visa и банковский счет.	1	new through import_export	9	1
1287	2018-11-27 11:50:03.186535+00	628	не могу зайди на сайт 1xbet хочу снять деньги , захожу на сайт 1xставка ввожу свои данные пишут не правильные что делать ?	1	new through import_export	9	1
1288	2018-11-27 11:50:03.189165+00	629	Какую максимальную ставку я могу сделать на тот или иной исход (событие)?	1	new through import_export	9	1
1289	2018-11-27 11:50:03.190917+00	630	обьясните пожалуйста. Бк дает кф на точный счет+исход "другое". Что это значит?	1	new through import_export	9	1
1290	2018-11-27 11:50:03.192867+00	631	Как можно положить деньги на Skrill?	1	new through import_export	9	1
1291	2018-11-27 11:50:03.195084+00	632	Зарегистрировал 3 аккаунта на одну карту в БК Winline! Все заблокировали!	1	new through import_export	9	1
1292	2018-11-27 11:50:03.197589+00	633	Я хочу зарегистрироваться в бк Бетсити, безопасно им отправить фотографии своего паспорта. Я читал в интернете что с помощью скана паспорта можно взять онлайн кредит. Я просто беспокоюсь за свои данны	1	new through import_export	9	1
1293	2018-11-27 11:50:03.199975+00	634	Сделал запрос на вывод средств, пришла смс от банка что деньги притшли в размере указанной суммы, но баланс карты не был увеличен. Такое возможно?	1	new through import_export	9	1
1294	2018-11-27 11:50:03.201954+00	635	Заблокировали мой счёт, говорят что я нарушел правила, что идёт расследование , документов ни каких не спрашивают, хотел бы узнать в чем именно я нарушел правила и когда меня разблокируют?	1	new through import_export	9	1
1295	2018-11-27 11:50:03.204392+00	636	А сколько раз нужно написать чтоб ставку рассчитали, что бы ее все таки рассчитали? Уже раз 10 есть.	1	new through import_export	9	1
1296	2018-11-27 11:50:03.206666+00	637	Заблокировали счёт в БК, якобы за подозрение в мультиаккаунтинге ( полный бред ). Выслал все доки, и фото банковских карт с которых пополнял счёт, пошла уже третья неделя, служба поддержки меня игнори	1	new through import_export	9	1
1297	2018-11-27 11:50:03.20879+00	638	Добрый день. Как можно удалить из профиля\\в личном кабинете - БК, в которых я не играю? 	1	new through import_export	9	1
1298	2018-11-27 11:50:03.210949+00	639	как к себе добавить бк "Олимп" в раздел "играет"?	1	new through import_export	9	1
1299	2018-11-27 11:50:03.212957+00	640	ставка: какой игрок гол. например я взял какой то игрок забьет гол, но этот игрок не вышел в составе и на замену тоже. это считается ВОЗВРАТ или ПРОИГРЫШ?	1	new through import_export	9	1
1300	2018-11-27 11:50:03.21461+00	641	Почему 1хСтавка режет индивидуально коэффициенты. На равные шансы вместо приблизительно 1.85-1.9 дают 1.65-1.7. Можно ли с этим что-то сделать? Или просто уходить оттуда?	1	new through import_export	9	1
1301	2018-11-27 11:50:03.216599+00	642	что такое маржа ?	1	new through import_export	9	1
1302	2018-11-27 11:50:03.218262+00	643	Здравствуйте подскажите пожалуйста , сколько выводятся деньги с конторы на банковскую карту мастер карт.	1	new through import_export	9	1
1303	2018-11-27 11:50:03.219917+00	644	Хочу через телефон делать ставки Где на сайте у вас можна скачать?	1	new through import_export	9	1
1304	2018-11-27 11:50:03.221695+00	645	Что нужно делать чтобы появились у меня подписчики?	1	new through import_export	9	1
1305	2018-11-27 11:50:03.223439+00	646	Почему топ букмекеры сайта дают столько минусов? Они делают специально чтоб люди заходили в минус?	1	new through import_export	9	1
1319	2018-12-25 11:34:48.825584+00	2	Я хочу выложить свой прогноз	2	update through import_export	9	1
1320	2018-12-25 11:34:48.827537+00	3	Где я могу дать свой прогноз на матч?	2	update through import_export	9	1
1321	2018-12-25 11:34:48.829141+00	4	Как редактировать свой прогноз? Сделал опечатку в самом заголовке.	2	update through import_export	9	1
1322	2018-12-25 11:34:48.830782+00	5	После того как прогнозист публикует свой прогноз, почему нет возможности редактировать, потому что в ходе прогноза вполне возможно ошибиться?!	2	update through import_export	9	1
1323	2018-12-25 11:34:48.832482+00	6	Почему я не могу изменить свой прогноз? Мог же где то ошибиться или опечататься и понять потом. Помогите мне его отредактировать	2	update through import_export	9	1
1324	2018-12-25 11:34:48.833919+00	7	Как я могу отредактировать прогноз? Сделал мелкую опечатку в заголовке	2	update through import_export	9	1
1325	2018-12-25 11:34:48.835234+00	8	Ошибся в заголовке прогноза. Как внести изменения? нигде не нашел этой функции	2	update through import_export	9	1
1326	2018-12-25 11:34:48.83655+00	9	Как я могу внести правки в прогноз который уже опубликован? нигде не могу найти.	2	update through import_export	9	1
1327	2018-12-25 11:34:48.837892+00	10	Куда вводить сумму ставки в моем прогнозе?	2	update through import_export	9	1
1328	2018-12-25 11:34:48.839529+00	11	Не нашел где ввести сумму ставки моего прогноза	2	update through import_export	9	1
1329	2018-12-25 11:34:48.84151+00	12	Я разместил прогноз но не указал сумму ставки	2	update through import_export	9	1
1330	2018-12-25 11:34:48.843366+00	13	Сколько прогнозов можно разместить в одном материале?	2	update through import_export	9	1
1331	2018-12-25 11:34:48.845286+00	14	Хочу сделать несколько ставок, можно ли сделать в одном прогнозе, в одном посте, в одной статье?	2	update through import_export	9	1
1332	2018-12-25 11:34:48.84721+00	15	Надо ли делать отдельны публикации для каждого прогноза или можно дать прогнозы вместе?	2	update through import_export	9	1
1333	2018-12-25 11:34:48.848921+00	16	Если я хочу написать несколько прогнозов на разные матчи одного чемпионата, то могу ли я давать их в одной публикации отдельными ординарами или же надо для каждого прогноза делать отдельную публикацию	2	update through import_export	9	1
1334	2018-12-25 11:34:48.850781+00	17	Я хочу разместить видеопрогноз	2	update through import_export	9	1
1335	2018-12-25 11:34:48.852668+00	18	Как я могу выложить видео к своему прогнозу?	2	update through import_export	9	1
1336	2018-12-25 11:34:48.854595+00	19	Я прикрепил видео к прогнозу, нужен ли текст?	2	update through import_export	9	1
1337	2018-12-25 11:34:48.856453+00	20	Нужно ли описание к прогнозу, если прикрепил видео?	2	update through import_export	9	1
1338	2018-12-25 11:34:48.858201+00	21	Как сделать прогноз на экспресс?	2	update through import_export	9	1
1339	2018-12-25 11:34:48.859921+00	22	Хочу дать экспресс в прогнозе, как это сделать?	2	update through import_export	9	1
1340	2018-12-25 11:34:48.864364+00	23	Не находит событие при добавлении прогноза. Что делать?	2	update through import_export	9	1
1341	2018-12-25 11:34:48.866113+00	24	Хочу сделать прогноз на футбол, но такого события нет	2	update through import_export	9	1
1342	2018-12-25 11:34:48.867804+00	25	Какую картинку выбрать при оформлении прогноза?	2	update through import_export	9	1
1343	2018-12-25 11:34:48.86956+00	26	Какого размера должно быть фото в прогнозе?	2	update through import_export	9	1
1344	2018-12-25 11:34:48.871197+00	27	Почему мой прогноз не прошел проверку? Все же было нормально. Хороший прогноз, но все равно не прошел	2	update through import_export	9	1
1345	2018-12-25 11:34:48.873146+00	28	Написал отличный прогноз, но он не появился на трибуне. Что я написал не так? Как надо его писать чтобы он прошел проверку и появился на трибуне?	2	update through import_export	9	1
1346	2018-12-25 11:34:48.875175+00	29	Почему прогноз не прошел модерацию? Вы пускаете на трибуну обычных людей или надо что то сделать?	2	update through import_export	9	1
1347	2018-12-25 11:34:48.87785+00	30	Сделала  прогноз, но вы его не разместили. Почему он не прошел модерацию?	2	update through import_export	9	1
1348	2018-12-25 11:34:48.879686+00	31	Почему мой прогноз не прошел проверку? Всё же написано нормально	2	update through import_export	9	1
1349	2018-12-25 11:34:48.881265+00	32	Мой прогноз не попал на Трибуну. В чем проблема?	2	update through import_export	9	1
1350	2018-12-25 11:34:48.882608+00	33	Две ставки не допустили на трибуну, загружал с картинками, что ещё не так делаю?)	2	update through import_export	9	1
1351	2018-12-25 11:34:48.884283+00	34	Доброго времени суток! Мои два прогноза не попали на трибуну (один на нба, второй на КХЛ). Коэффициента брал с Вильям Хилла, картинка соответствующего размера.	2	update through import_export	9	1
1352	2018-12-25 11:34:48.885767+00	35	Добрый вечер, мой прогноз не попал на главную страницу трибуны по не понятным мне причинам.Может быть, он совпадает с прогнозом кого-либо, но я не могу каждый раз проверять все прогнозы на матч, дабы 	2	update through import_export	9	1
1385	2018-12-25 11:34:48.936976+00	68	Почему в моем прогнозе красный глаз?	2	update through import_export	9	1
1353	2018-12-25 11:34:48.887257+00	36	Добрый день, не могли бы указать на мои ошибки, что я не так сделал? Мой прогноз не попал на трибуну. Чтоб я в дальнейшим исправился и не делал прежних ошибок.  	2	update through import_export	9	1
1354	2018-12-25 11:34:48.888768+00	37	Здраствуйте,опубликовал прогноз,а что нужно сделать что бы он попал в каперскую трибуну?	2	update through import_export	9	1
1355	2018-12-25 11:34:48.890343+00	38	хотел узнать почему мой прогноз не был допущен на главную страницу трибуны?	2	update through import_export	9	1
1356	2018-12-25 11:34:48.891906+00	39	Скажите.А почему мой прогноз Манчестер Юнайтед- Суонси не выставили на трибуну?Спасибо	2	update through import_export	9	1
1357	2018-12-25 11:34:48.893475+00	40	Я вылаживаю прогноз на трибуне, но при просмотре ставки ее удаляют, почему? Подозрение в копипасте? Этот прогноз я выложил еще на vprognoze.ru Могу подтвердить что там тоже моя страница привязана к са	2	update through import_export	9	1
1358	2018-12-25 11:34:48.894849+00	41	Мой прогноз не опубликовали на Трибуну, как можно узнать, почему? и можно ли отредактировать, чтобы прогноз пропустили на трибуну?  	2	update through import_export	9	1
1359	2018-12-25 11:34:48.896358+00	42	Сделал прогноз на матч Ростов - Андерлехт прогноз не прошел модерацию	2	update through import_export	9	1
1360	2018-12-25 11:34:48.898167+00	43	прогноз не допущен на главную трибуну, УКАЖИТЕ пожалуйста на ошибки допущенные мной	2	update through import_export	9	1
1361	2018-12-25 11:34:48.899789+00	44	почему не выложили мой последний прогноз?	2	update through import_export	9	1
1362	2018-12-25 11:34:48.901414+00	45	Почему не одобряют прогноз?	2	update through import_export	9	1
1363	2018-12-25 11:34:48.902958+00	46	я оставлял прогноз на лигу чемпионов но его не допустили.можно узнать почему?	2	update through import_export	9	1
1364	2018-12-25 11:34:48.904667+00	47	что значит прогноз не прошел модерацию и почему,в связи с чем как узнать	2	update through import_export	9	1
1365	2018-12-25 11:34:48.906211+00	48	Выложил прогноз,а он не прошел почему то модерацию,в чем причина?!  	2	update through import_export	9	1
1366	2018-12-25 11:34:48.907899+00	49	Второй раз подряд не публикуют прогноз на трибуну ? Могу узнать причину?	2	update through import_export	9	1
1367	2018-12-25 11:34:48.909522+00	50	Почему я не могу добавить прогноз? Почему не меняется с любителя на игрок? я уже сделал 2 отзыва	2	update through import_export	9	1
1368	2018-12-25 11:34:48.911148+00	51	ДАЛ 2 ПРОГНОЗА-НИ ОДИН НЕ ПРОШЕЛ МОДЕРАЦИЮ-ЧТО ТАКОЕ?	2	update through import_export	9	1
1369	2018-12-25 11:34:48.912718+00	52	можно узнать причину не попадания моего прогноза на футбол , чтобы исправить мои ошибкы.?	2	update through import_export	9	1
1370	2018-12-25 11:34:48.914148+00	53	Пот какой причине мои прогнозы не публикуются на главную страницу трибуны?	2	update through import_export	9	1
1371	2018-12-25 11:34:48.915568+00	54	Снова не допустили прогноз на трибуну, хочется уже узнать что не так в этот раз.	2	update through import_export	9	1
1372	2018-12-25 11:34:48.917129+00	55	Я выложил свой прогноз на теннис, на что через время среагировали Ваши модераторы значком "Прогноз не допущен на трибуну". Почему? Даже никаких объяснений не увидел.	2	update through import_export	9	1
1373	2018-12-25 11:34:48.918484+00	56	объясните хотя бы причину по которой неопубликован прогноз. Хочу попробовать себя в роли прогнозиста.	2	update through import_export	9	1
1374	2018-12-25 11:34:48.919949+00	57	Из-за чего отклонили мой прогноз? Он достаточно правильный, с точки зрения русского языка.	2	update through import_export	9	1
1375	2018-12-25 11:34:48.921295+00	58	Почему прогноз не прошёл на трибуну?  	2	update through import_export	9	1
1376	2018-12-25 11:34:48.92265+00	59	Добрый день! Почему мой прогноз не прошел модерацию? Прогноз был опубликован в 23:40. Матч начинался в 00:00.	2	update through import_export	9	1
1377	2018-12-25 11:34:48.924352+00	60	Что значит " прогноз не прошёл модерацию, и не будет рассчитан?"	2	update through import_export	9	1
1378	2018-12-25 11:34:48.92593+00	61	Опубликовал около 2 часа ранее прогноз на матч МЛС, но его не опубликовали, проста хочу узнать причину?	2	update through import_export	9	1
1379	2018-12-25 11:34:48.927472+00	62	Не добавлен прогноз на страницу Трибуны на матч Манчестер Сити - Барселона	2	update through import_export	9	1
1380	2018-12-25 11:34:48.929168+00	63	теперь заставка не содержит никаких ссылок,но прогноз опять не допущен на главную трибуну	2	update through import_export	9	1
1381	2018-12-25 11:34:48.930934+00	64	Не показывает причину не прохода модерация, хотя сам прогноз сделал от часа - 30 минут до матча. и опубликовал	2	update through import_export	9	1
1382	2018-12-25 11:34:48.932583+00	65	Хотел бы узнать причину не допуска прогноза на Трибуну.	2	update through import_export	9	1
1383	2018-12-25 11:34:48.934138+00	66	Опубликовал прогноз,но его все еще нет на Трибуне,на рассмотрении почему то	2	update through import_export	9	1
1384	2018-12-25 11:34:48.935539+00	67	Почему прогноз не прошел модерацию? Как понять причину? Никто не объясняет	2	update through import_export	9	1
1386	2018-12-25 11:34:48.938268+00	69	За что могут завернуть не дать опубликовать прогноз на трибуну? Почему обычно не проходят модерацию?	2	update through import_export	9	1
1387	2018-12-25 11:34:48.939644+00	70	Прогноз не прошёл модерацию.На просьбу пояснить ответить нужным не считают.	2	update through import_export	9	1
1388	2018-12-25 11:34:48.941005+00	71	почему мои прогнозы удаляют?	2	update through import_export	9	1
1389	2018-12-25 11:34:48.942625+00	72	Публикую прогноз на матч во второй или третий раз и он почему-то пропадает. Остальные прогнозы публикуются нормальною	2	update through import_export	9	1
1390	2018-12-25 11:34:48.944266+00	73	Даю прогнозы на РБ , но спустя несколько часов они просто исчезают , и даже если они нормально написаны , то у других то прогнозы остаются , а мои убирают с сайта , что за дискриминация	2	update through import_export	9	1
1391	2018-12-25 11:34:48.945939+00	74	Спустя час после публикации прогноз был удалён	2	update through import_export	9	1
1392	2018-12-25 11:34:48.947519+00	75	Добрый день. Сегодня был по непонятной мне причине удалён прогноз "Лестер"-"Челси". Прогноз Дмитрия Юркина. Висел весь день, было 400 просмотров. Все названия команд в кавычках, написано грамотно и со	2	update through import_export	9	1
1393	2018-12-25 11:34:48.948988+00	76	Что за бред ??? какой день уже в подряд удаляют прогноз без обяснение , причем быстро. Где справедливость , или это палки в колеса ? Админы вообще в адеквате ?	2	update through import_export	9	1
1394	2018-12-25 11:34:48.950442+00	77	Почему в профиле не отображается прогноз?	2	update through import_export	9	1
1395	2018-12-25 11:34:48.951895+00	78	Разместил 2 прогноза, но через 5 минут после размещения они исчезли из моего профиля. В чем проблема?	2	update through import_export	9	1
1396	2018-12-25 11:34:48.953477+00	79	Почему был удалён мой прогноз?	2	update through import_export	9	1
1397	2018-12-25 11:34:48.954963+00	80	Пропал мой прогноз, хотя он был ранее.	2	update through import_export	9	1
1398	2018-12-25 11:34:48.956553+00	81	В последнее время долго рассматриваются ставки модераторами и долго рассчитываются так долго будет? Просто надеюсь на ваше понимание :)	2	update through import_export	9	1
1399	2018-12-25 11:34:48.958002+00	82	Можете ли вы посмотреть мой прогноз и допустить его на трибуну?	2	update through import_export	9	1
1400	2018-12-25 11:34:48.959489+00	83	Сколько вы будете рассматривать мой прогноз?	2	update through import_export	9	1
1401	2018-12-25 11:34:48.96093+00	84	Сделал прогноз примерно в 4 утра, первый матч по прогнозу в 9 утра,в чем проблема?	2	update through import_export	9	1
1402	2018-12-25 11:34:48.962396+00	85	Можно ли, как можно быстрее, рассчитать мои прогнозы за прошлый вечер?	2	update through import_export	9	1
1403	2018-12-25 11:34:48.963886+00	86	Подскажите, пожалуйста, в течении какого времени расчитываються прогнозы? Просто мои 2 матча закончились утром , и один в обед, а до сих пор написано - Ожидание. Заранее спасибо.	2	update through import_export	9	1
1404	2018-12-25 11:34:48.965331+00	87	Если я сделал прогноз в трибуне,после окончания прогноза надо самому писать результат и сиграл прогноз или нет если да то как?	2	update through import_export	9	1
1405	2018-12-25 11:34:48.966693+00	88	В течение какого времени модератор проверяет прогноз и распределяет его по спортивной категории(хоккей,баскетбол,футбол)?	2	update through import_export	9	1
1406	2018-12-25 11:34:48.96803+00	89	Почему мой прогноз не разыгран если я его правильный сделал?	2	update through import_export	9	1
1407	2018-12-25 11:34:48.969299+00	90	Почему желтый глаз в прогнозе, на рассмотрении	2	update through import_export	9	1
1408	2018-12-25 11:34:48.970676+00	91	Рассчитайте пожалуйта прогноз	2	update through import_export	9	1
1409	2018-12-25 11:34:48.972366+00	92	Матч завершился вчера а ставка не рассчитана на рассмотрении	2	update through import_export	9	1
1410	2018-12-25 11:34:48.974101+00	93	При вводе прогноза не могу выбрать букмекера,в поиске ничего нельзя найти. Как можно исправить эту проблему?	2	update through import_export	9	1
1411	2018-12-25 11:34:48.976243+00	94	участвую в конкурсе капперов, но при написании прогноза в окне непосредственно ставки не могу выбрать букмекера, выпадает пустой список и при написании ничего не находит. Хэлп	2	update through import_export	9	1
1412	2018-12-25 11:34:48.977986+00	95	Не могу дать прогноз, так как нет выбора букмекерской конторы. Как можно исправить эту не поладку? Или это ограничение?	2	update through import_export	9	1
1413	2018-12-25 11:34:48.979488+00	96	Если же игрок в стартовом составе не вышел, то должен быть возврат. Такие правила во всех БК, тогда почему здесь на сайте это проигрыш?	2	update through import_export	9	1
1414	2018-12-25 11:34:48.981122+00	97	Полузащитник забил гол, букмекер засчитал ставку,а на Трибуне расчитали проигрышем.	2	update through import_export	9	1
1415	2018-12-25 11:34:48.982666+00	98	Ставка выиграла, а вы рассчитали проигрыш	2	update through import_export	9	1
1416	2018-12-25 11:34:48.984349+00	99	Почему моя ставка сыграла, но в прогнозе поражение?	2	update through import_export	9	1
1417	2018-12-25 11:34:48.985936+00	100	Неправильно рассчитали ставку в моем прогнозе	2	update through import_export	9	1
1418	2018-12-25 11:34:48.987605+00	101	Исправьте рассчет ставки в моем прогнозе	2	update through import_export	9	1
1419	2018-12-25 11:34:48.989372+00	102	Если я сменю данные пользователя, например имя и фамилию, то изменятся ли они в моих ставках прогнозах комментариях и тп до этого?	2	update through import_export	9	1
1420	2018-12-25 11:34:48.991183+00	103	Сменил фамилию, если я изменю ее в профиле то изменится ли она в прогнозах?	2	update through import_export	9	1
1421	2018-12-25 11:34:48.99303+00	104	ПОчему не изменяются имя и фамилия в прогнозах постах ставках, если я сменил ее в настройках	2	update through import_export	9	1
1422	2018-12-25 11:34:48.994859+00	105	Вопрос такой: А если в настройках профиля сменить имя и фамилию, то возможно ли сменить имя и фамилию в заголовках моих завершенных ранее ставок?	2	update through import_export	9	1
1423	2018-12-25 11:34:48.996639+00	106	Поощряют ли как то людей, часто делающих прогнозы на трибуне? если нет, то в чем смысл?	2	update through import_export	9	1
1424	2018-12-25 11:34:48.998718+00	107	Зачем размещать свои прогнозы на трибуне? есть какие то призы?	2	update through import_export	9	1
1425	2018-12-25 11:34:49.000521+00	108	Что я получу за размещение своих прогнозов? В чем смысл?	2	update through import_export	9	1
1426	2018-12-25 11:34:49.002055+00	109	Подскажите пожайлуста есть ли смысл размещать свои прогнозы на стене трибуны? За большое количество успешных прогнозов есть ли какая-то система поощрения? Cпасибо!	2	update through import_export	9	1
1427	2018-12-25 11:34:49.003633+00	110	Где я могу посмотреть мои прогнозы?	2	update through import_export	9	1
1428	2018-12-25 11:34:49.005036+00	111	Не могу найти где увидеть свои прогнозы и ставки.	2	update through import_export	9	1
1429	2018-12-25 11:34:49.006321+00	112	Где можно посмотреть свою статистику?	2	update through import_export	9	1
1430	2018-12-25 11:34:49.007722+00	113	Как узнать свою статистику на РБ?	2	update through import_export	9	1
1431	2018-12-25 11:34:49.009415+00	114	Как определить успешность вашего эксперта, прогнозиста?	2	update through import_export	9	1
1432	2018-12-25 11:34:49.011054+00	115	Где можно увидеть статистику эксперта, прогнозиста?	2	update through import_export	9	1
1433	2018-12-25 11:34:49.012589+00	116	Как посмотреть все ставки и прогнозы прогнозиста или каппера?	2	update through import_export	9	1
1434	2018-12-25 11:34:49.013946+00	117	Как посмотреть все прогнозы прогнозиста, есть ли где то архив всех его постов?	2	update through import_export	9	1
1435	2018-12-25 11:34:49.015643+00	118	Как узнать на кого я подписан?	2	update through import_export	9	1
1436	2018-12-25 11:34:49.017666+00	119	На скольких людей я подписался, где посмотреть?	2	update through import_export	9	1
1437	2018-12-25 11:34:49.019522+00	120	Могу ли я как-то посмотреть всех, кто на меня подписался? ИЛи получать уведомления о подписке. Ну или хотя бы количество подписавшихся	2	update through import_export	9	1
1438	2018-12-25 11:34:49.021414+00	121	Как понять, сколько человек на меня подписалось? Можно ли настроить уведомления о подписках	2	update through import_export	9	1
1439	2018-12-25 11:34:49.023255+00	122	Сколько человек на меня подписано?	2	update through import_export	9	1
1440	2018-12-25 11:34:49.024912+00	123	Такой вопрос, можно ли каким-то способом посмотреть кол-во подписок на меня? Приходит ли при новой подписке уведомление на почту и т.д.?	2	update through import_export	9	1
1441	2018-12-25 11:34:49.026347+00	124	Как сменить пароль на рб?	2	update through import_export	9	1
1442	2018-12-25 11:34:49.027913+00	125	Хочу сменить пароль, как это сделать?	2	update through import_export	9	1
1443	2018-12-25 11:34:49.02944+00	126	где поминять имя, логин на сайте?	2	update through import_export	9	1
1444	2018-12-25 11:34:49.030946+00	127	где можно изменить имя и фамилию на сайте?	2	update through import_export	9	1
1445	2018-12-25 11:34:49.032383+00	128	Как добавить ссылку на социальную сеть в профиль	2	update through import_export	9	1
1446	2018-12-25 11:34:49.033744+00	129	Как прикрепить ссылку на учетную запись вконтакте, Facebook, Twitter, Instagram	2	update through import_export	9	1
1447	2018-12-25 11:34:49.03525+00	130	Добрый день. Как можно удалить из профиля\\в личном кабинете - БК, в которых я не играю? 	2	update through import_export	9	1
1448	2018-12-25 11:34:49.036666+00	131	как к себе добавить букмекера в раздел "играет"?	2	update through import_export	9	1
1449	2018-12-25 11:34:49.038083+00	132	Где посмотреть прогнозы, на которые я подписан?	2	update through import_export	9	1
1450	2018-12-25 11:34:49.039693+00	133	Мне дали ответ на комментарий. Где его найти?	2	update through import_export	9	1
1451	2018-12-25 11:34:49.041405+00	134	Как мне отписаться от прогнозиста?	2	update through import_export	9	1
1452	2018-12-25 11:34:49.042953+00	135	Прекратите присылать уведомления о прогнозах.	2	update through import_export	9	1
1453	2018-12-25 11:34:49.044639+00	136	Не хочу получать от вас письма на почту	2	update through import_export	9	1
1454	2018-12-25 11:34:49.046308+00	137	Не присылайте мне уведомления на мой емаил	2	update through import_export	9	1
1455	2018-12-25 11:34:49.047926+00	138	Хочу отписаться от вашей рассылки	2	update through import_export	9	1
1456	2018-12-25 11:34:49.049419+00	139	Почему удалили мой комментарий?	2	update through import_export	9	1
1457	2018-12-25 11:34:49.050945+00	140	Написал, оставил комментарий, но его удалили. Какая причина?	2	update through import_export	9	1
1458	2018-12-25 11:34:49.052723+00	141	Удалили мой негативный комментарий. Вам заплатили?	2	update through import_export	9	1
1459	2018-12-25 11:34:49.054315+00	142	Создается впечатление что негативные отзывы не размещаются	2	update through import_export	9	1
1460	2018-12-25 11:34:49.055971+00	143	Мой негативный отзыв не появился на сайте! Вы специально? сколько вам за это платят?	2	update through import_export	9	1
1461	2018-12-25 11:34:49.057758+00	144	Почему не опубликовали мой отзыв?	2	update through import_export	9	1
1462	2018-12-25 11:34:49.059113+00	145	Где мой отзыв? он негативный, они не публикуются?	2	update through import_export	9	1
1463	2018-12-25 11:34:49.060591+00	146	Я составил жалобу на бк, негативную, в виде отзыва, почему не опубликовали? Когда появится на сайте?	2	update through import_export	9	1
1464	2018-12-25 11:34:49.061958+00	147	Я хочу изменить свой отзыв о БК	2	update through import_export	9	1
1465	2018-12-25 11:34:49.063343+00	148	Как я могу отредактировать отзыв на букмекера?	2	update through import_export	9	1
1466	2018-12-25 11:34:49.064684+00	149	Как принять участие в конкурсе капперов ?	2	update through import_export	9	1
1467	2018-12-25 11:34:49.066189+00	150	Как поучавствовать в вашем конкурсе? не вижу где зарегистрироваться	2	update through import_export	9	1
1468	2018-12-25 11:34:49.067615+00	151	Как поучаствовать в конкурсе прогнозистов?	2	update through import_export	9	1
1469	2018-12-25 11:34:49.069271+00	152	Где ваши конкурсы?	2	update through import_export	9	1
1470	2018-12-25 11:34:49.071186+00	153	Какие сейчас у вас конкурсы	2	update through import_export	9	1
1471	2018-12-25 11:34:49.073238+00	154	Какие у вас проходят сейчас конкурсы?	2	update through import_export	9	1
1472	2018-12-25 11:34:49.07517+00	155	А скажите пожалуйста в каком конкурсе прогнозов можно поучаствовать в ближайшее время?? есть ли какие нибудь варианты заработать на этом сайте?	2	update through import_export	9	1
1473	2018-12-25 11:34:49.077274+00	156	Как попасть в команду прогнозистов	2	update through import_export	9	1
1474	2018-12-25 11:34:49.079343+00	157	Как стать вашим прогнозистом, прогнозистом РБ	2	update through import_export	9	1
1475	2018-12-25 11:34:49.081119+00	158	Возможно ли попасть в команду профессиональных прогнозистов?	2	update through import_export	9	1
1476	2018-12-25 11:34:49.082685+00	159	подскажите, сколько процентов идет на ставку? по какому принципу высчитывается прибыль в конце месяца у экспертов, а так же у обычных участников,которые выкладывают свои прогнозы?	2	update through import_export	9	1
1477	2018-12-25 11:34:49.084299+00	160	как вы считаете прибыль экспертов и прогнозистов?	2	update through import_export	9	1
1478	2018-12-25 11:34:49.085804+00	161	каким образом вы высчитываете статистику?	2	update through import_export	9	1
1479	2018-12-25 11:34:49.087378+00	162	Доходы прогнозиста, эксперта. Как подсчитать?	2	update through import_export	9	1
1480	2018-12-25 11:34:49.08887+00	163	Хочу сравнить успешность ваших экспертов. Как это сделать?	2	update through import_export	9	1
1481	2018-12-25 11:34:49.09062+00	164	У какого эксперта лучшая статистика, кто из них самый прибыльный?	2	update through import_export	9	1
1482	2018-12-25 11:34:49.092129+00	165	Где сравнить статистику пользователей, прогнозистов?	2	update through import_export	9	1
1483	2018-12-25 11:34:49.093641+00	166	Кто лучший каппер Трибуны?	2	update through import_export	9	1
1484	2018-12-25 11:34:49.095049+00	167	Как попасть в топ-12 Трибуны?	2	update through import_export	9	1
1485	2018-12-25 11:34:49.096678+00	168	Каким образом попасть в список лучших капперов Трибуны??	2	update through import_export	9	1
1486	2018-12-25 11:34:49.098142+00	169	Как максимально быстро можно сделать, чтобы больше людей узнали о моих прогнозах и стало больше подписчиков?	2	update through import_export	9	1
1487	2018-12-25 11:34:49.099539+00	170	Что нужно делать чтобы появились у меня подписчики?	2	update through import_export	9	1
1488	2018-12-25 11:34:49.101109+00	171	Хочу больше подписчиков, где их взять?	2	update through import_export	9	1
1489	2018-12-25 11:34:49.102825+00	172	Система расчета прибыли не очень хорошо работает	2	update through import_export	9	1
1490	2018-12-25 11:34:49.104572+00	173	Плохо работает ваш сайт. Будут ли внесены изменения, подсчет работает плохо	2	update through import_export	9	1
1491	2018-12-25 11:34:49.10641+00	174	Схема рассчета сломана, некорректно показывает коэфициенты	2	update through import_export	9	1
1492	2018-12-25 11:34:49.108342+00	175	Люди часто описывают недостатки существующей системы подсчитывания коэфициентов и выигрышей, прибыли. Скажите, будут ли внесены изменения в формулу расчёта прибыли? Иначе ставки с кэфом меньше 2 не им	2	update through import_export	9	1
1493	2018-12-25 11:34:49.110296+00	176	Хочу чтобы мои прогнозы публиковали на главной странице РБ	2	update through import_export	9	1
1494	2018-12-25 11:34:49.112054+00	177	У меня отличные прогнозы, перенесите их на первую страницу сайта.	2	update through import_export	9	1
1495	2018-12-25 11:34:49.113763+00	178	Почуму уже 2 дня не рассчитывают прогноз?	2	update through import_export	9	1
1496	2018-12-25 11:34:49.115317+00	179	Дал прогноз неделю назад, ставка до сих пор не разыгранна	2	update through import_export	9	1
1497	2018-12-25 11:34:49.116887+00	180	При размещении прогнза не много букмекеров. Почему?	2	update through import_export	9	1
1498	2018-12-25 11:34:49.118495+00	181	Не нашел свою БК в списке при оформлении прогноза	2	update through import_export	9	1
1499	2018-12-25 11:34:49.120202+00	182	Что это за статусы у пользователей?	2	update through import_export	9	1
1500	2018-12-25 11:34:49.121793+00	183	Как мне повысить статус до профи?	2	update through import_export	9	1
1501	2018-12-25 11:34:49.123497+00	184	Зачем нужны статусы, что они дают?	2	update through import_export	9	1
1502	2018-12-25 11:34:49.12541+00	185	Какая польза от этих статусов?	2	update through import_export	9	1
1503	2018-12-25 11:34:49.127275+00	186	За что дают статус гуру	2	update through import_export	9	1
1504	2018-12-25 11:34:49.129149+00	187	ЧТо за гуру у вас на сайте и как его получить	2	update through import_export	9	1
1505	2018-12-25 11:34:49.130868+00	188	как стать гуру, профи у вас на сайте	2	update through import_export	9	1
1506	2018-12-25 11:34:49.132327+00	189	Видел где то на сайте, что за размещение прогноза, дадут статус "гуру") Прогноз разместил, мой экспресс выиграл) статуса не получил. Может мне приснилось, т.к. объявления я этого больше не вижу.	2	update through import_export	9	1
1507	2018-12-25 11:34:49.133928+00	190	Делал ставку на футбол, общая сумма выигрыш составила 13.000 грн . Данная БК отказывается выплачивать средства, ссылаясь на непонятные причины. Что мне делать ? Заранее спасибо	2	update through import_export	9	1
1508	2018-12-25 11:34:49.135319+00	191	Я сделал ставку на кассе получил чек выиграл но деньги мне не отдают я поставил 200 шт выигрыш составляет 233 шт подскажите что можно сделать это контора мошенников	2	update through import_export	9	1
1509	2018-12-25 11:34:49.136975+00	192	Вчера в лайве поставил победу Спартака при счете 0-1 в пользу Амкара, кф-27. Сделали возврат пишут: Ваши ставки рассчитаны с коэффициентом 1 , так как были поставлены на известный исход .	2	update through import_export	9	1
1510	2018-12-25 11:34:49.138745+00	193	1хставка украла деньги со счета, где пожаловаться?	2	update through import_export	9	1
1511	2018-12-25 11:34:49.140339+00	194	1хbet проставил мои деньги за меня, что делать?	2	update through import_export	9	1
1512	2018-12-25 11:34:49.141788+00	195	К кому можна обратиться по поводу блокировки счета в БК "Бетсити"?	2	update through import_export	9	1
1513	2018-12-25 11:34:49.143502+00	196	Безосновательно заблокировали счет, поддержка не отвечает	2	update through import_export	9	1
1514	2018-12-25 11:34:49.146217+00	197	Где заполнить жалобу?	2	update through import_export	9	1
1515	2018-12-25 11:34:49.147855+00	198	Бетсити не выплачивает выигрыш! Говорят: ставка не рассчитана, результат уточняется...уже два года уточняют На официальных сайтах есть данные с результатами...Как помочь конторе Бетсити уточнить счет 	2	update through import_export	9	1
1516	2018-12-25 11:34:49.149517+00	199	Здравствуйте еще раз,заблокировали счет, попросили выслать им документы,все выслали  они не отвечают месяц,как быть,куда написать?	2	update through import_export	9	1
1517	2018-12-25 11:34:49.151531+00	200	Мне произвели разблокировку счета, а баланс со счета списали, что делать и возможно ли вернуть деньги? Если выяснили что я не мошенник и никаких противоправных действий не совершал почему забрали мои 	2	update through import_export	9	1
1518	2018-12-25 11:34:49.153316+00	201	Я заказал на вывод средств через киви кошелёк мне пришёл отказ хотя у меня счёт верифецирован и я не однократно снимал деньги. В службе поддержке мне ничего не отвечают.	2	update through import_export	9	1
1519	2018-12-25 11:34:49.154819+00	202	не могу вывести денег,саппорт молчит,.отсылаю фото с паспортом тут же отклонено , бред какой и где там лайв чат??прошел кеф 40 и бонус отыграл(	2	update through import_export	9	1
1520	2018-12-25 11:34:49.156476+00	203	ФонБет отказывается выплачивать мой выграш. уже почти 5 дней веду с ними переписку но бесполезно. блокировка счета. деньги не выводятся не на визу не на скрил. Как мне поступить ?	2	update through import_export	9	1
1521	2018-12-25 11:34:49.158153+00	204	Почему бк конфисковало у меня балансы и заблокировало меня? С документами проблем нет и не было.	2	update through import_export	9	1
1522	2018-12-25 11:34:49.160016+00	205	За что букмекерская контора, бк, контора, может заблокировать мой счет? Или конфисковать деньги. Документы в порядке, ну нормальные и не поддельные.	2	update through import_export	9	1
1523	2018-12-25 11:34:49.161913+00	206	БК забрала деньги и дала бан, заблокировало.  С документами все ок.	2	update through import_export	9	1
1524	2018-12-25 11:34:49.163681+00	207	Букмекер неправильно рассчитал ставку, хотя на официальном сайте результат есть	2	update through import_export	9	1
1525	2018-12-25 11:34:49.165573+00	208	Правил не нарушал, букмекер заблокировал счет и забрал деньги	2	update through import_export	9	1
1526	2018-12-25 11:34:49.167372+00	209	Мошенники! Не дают вывести деньги со счета.	2	update through import_export	9	1
1527	2018-12-25 11:34:49.169167+00	210	Блокировка счета, поддержка не отвечает	2	update through import_export	9	1
1528	2018-12-25 11:34:49.171227+00	211	Когда опубликуют мою жалобу?	2	update through import_export	9	1
1529	2018-12-25 11:34:49.173336+00	212	Моя жалоба уже два дня на рассмотрении, сколько еще ждать?	2	update through import_export	9	1
1530	2018-12-25 11:34:49.174894+00	213	Заполнил жалобу, но её нигде нет, не опубликовали	2	update through import_export	9	1
1531	2018-12-25 11:34:49.176584+00	214	Сколько времени занимает публикация жалобы?	2	update through import_export	9	1
1532	2018-12-25 11:34:49.178142+00	215	Что там по моей жалобе?	2	update through import_export	9	1
1533	2018-12-25 11:34:49.179961+00	216	Когда будут результаты по жалобе, прошла неделя?	2	update through import_export	9	1
1534	2018-12-25 11:34:49.181666+00	217	Уже месяц моя жалоба в обработке. Сколько еще ждать?	2	update through import_export	9	1
1535	2018-12-25 11:34:49.183059+00	218	Какие примерные сроки решения по жалобе?	2	update through import_export	9	1
1536	2018-12-25 11:34:49.184552+00	219	Прошло больше двух недель, но по жалобе тишина. Долго мне ожидать?	2	update through import_export	9	1
1537	2018-12-25 11:34:49.18617+00	220	Жалоба признана безосновательной, но это ложь, не может быть	2	update through import_export	9	1
1538	2018-12-25 11:34:49.187769+00	221	Посчитали мою жалобу безосновательной, но у меня есть доказательства правоты	2	update through import_export	9	1
1539	2018-12-25 11:34:49.189414+00	222	Жалоба сменила статус на безосновательна, что это за мошенничество	2	update through import_export	9	1
1540	2018-12-25 11:34:49.191108+00	223	Почему жалоба безосновательная, я не нарушал правил БК?	2	update through import_export	9	1
1541	2018-12-25 11:34:49.192785+00	224	Вы хоть помогаете людям, решаете жалобы?	2	update through import_export	9	1
1542	2018-12-25 11:34:49.194101+00	225	Для чего нужны эти жалобы, РБ хоть кому-то помог?	2	update through import_export	9	1
1543	2018-12-25 11:34:49.195577+00	226	Какой смысл в жалобе, что она даст?	2	update through import_export	9	1
1544	2018-12-25 11:34:49.197213+00	227	РБ вернул деньги хоть одному человеку?	2	update through import_export	9	1
1545	2018-12-25 11:34:49.198765+00	228	Направил документы в зенитбет для верификации счета еще 18 июня,Сегодня уже 29 июня но так и не могу вывести денежные средства.Сколько еще ждать?	2	update through import_export	9	1
1546	2018-12-25 11:34:49.200431+00	229	Заблокировали аккаунт на Лиге ставок, документы отправил в тот же день. Прошло два дня ни ответа ни привета. Неприятно.......	2	update through import_export	9	1
1547	2018-12-25 11:34:49.201933+00	230	запросили документы на БК, отправил весь пакет документов, отличного качества, написали ожидайте, прошла неделя, я пишу уже 2 дня они игнорируют мои сообщения!	2	update through import_export	9	1
1548	2018-12-25 11:34:49.203523+00	231	Сколько длится верификация Подскажите	2	update through import_export	9	1
1549	2018-12-25 11:34:49.205122+00	232	Здравствуйте,уважаемые специалисты.Пожалуйста подскажите-сколько времени длиться проверка документов в следующих конторах:Betfair,Liga stavok,SBOBET?	2	update through import_export	9	1
1550	2018-12-25 11:34:49.206527+00	233	Попросили фото паспорта я скинул и теперь говорят что я в очереди. эта очередь вообще существует ? и сколько мне ждать пока проверять данные ?	2	update through import_export	9	1
1551	2018-12-25 11:34:49.20815+00	234	Заблокировали счет. Попросили все нужные документы для идентификации. Отправил всё что запрашивали. Но четвертый день с заблокированным счетом и замороженным балансом на нем. Подскажите пожалуйста ско	2	update through import_export	9	1
1552	2018-12-25 11:34:49.209759+00	235	Хотел вывести средства, запросили документы ... Сказали ожидать... Прошло около недели... Это нормально? И по каким прияинам мой счет проверяют?? Контора бетсити...	2	update through import_export	9	1
1553	2018-12-25 11:34:49.211447+00	236	Что такое Цупис, зачем он?	2	update through import_export	9	1
1554	2018-12-25 11:34:49.213164+00	237	Какой-то цупис. Для чего он нужен?	2	update through import_export	9	1
1555	2018-12-25 11:34:49.214787+00	238	Почему кто то берет налог а кто то нет? ПО какому принципу?	2	update through import_export	9	1
1556	2018-12-25 11:34:49.21627+00	239	Как понять какие БК берут налог, а какие нет? В легальных? но иногда же не берут	2	update through import_export	9	1
1557	2018-12-25 11:34:49.217962+00	240	Так и не понимаю в каких БК берут налог с выигрыша, в каких нет. Или в каждой легальной берут, но только у некоторых игроков?	2	update through import_export	9	1
1558	2018-12-25 11:34:49.219622+00	241	Как подсчитать налог, куда его отдавать?	2	update through import_export	9	1
1559	2018-12-25 11:34:49.22106+00	242	Должен ли я платить налог со ставок или букмекер это сделает вместо меня?	2	update through import_export	9	1
1560	2018-12-25 11:34:49.222573+00	243	Каким образом высчитать сумму налога, если я играл в нескольких БК	2	update through import_export	9	1
1561	2018-12-25 11:34:49.224242+00	244	Мой выигрыш составил более 15 тыс. рублей, мне платить налог?	2	update through import_export	9	1
1562	2018-12-25 11:34:49.225772+00	245	зачем мы платим налог 13% кому он идет	2	update through import_export	9	1
1563	2018-12-25 11:34:49.227875+00	246	что за налог в 13 процентов и зачем он?	2	update through import_export	9	1
1564	2018-12-25 11:34:49.229594+00	247	налог на выигрыш 13% в лиге ставок , куда он идет !?	2	update through import_export	9	1
1565	2018-12-25 11:34:49.231101+00	248	Есть ли налог в оффлайн точках букмекеров	2	update through import_export	9	1
1566	2018-12-25 11:34:49.232531+00	249	Играя в ппс есть ли налог? В наземных точках, оффлайн точках	2	update through import_export	9	1
1567	2018-12-25 11:34:49.234039+00	250	Надо ли платить налог играя с ППС?	2	update through import_export	9	1
1568	2018-12-25 11:34:49.235775+00	251	Плтатит ли игрок наземного ППС какие либо налоги?	2	update through import_export	9	1
1569	2018-12-25 11:34:49.237551+00	252	Решил ставить ставки, какую букмекерскую конторы посоветуете?	2	update through import_export	9	1
1570	2018-12-25 11:34:49.239496+00	253	В какой бк лучше делать ставки?	2	update through import_export	9	1
1571	2018-12-25 11:34:49.241472+00	254	Доброго времени суток! Можно ли использовать бк только для игры в тотализатор и не более? В случае выигрыша не возникнут ли проблемы с выплатами ( джекпота :-)) )?	2	update through import_export	9	1
1572	2018-12-25 11:34:49.243579+00	255	Посоветуйте бк которые дают высокий кеф на ничью в лайфе (футбол)	2	update through import_export	9	1
1573	2018-12-25 11:34:49.24572+00	256	Какие топовые зарубежные БК принимают рубли?	2	update through import_export	9	1
1574	2018-12-25 11:34:49.247576+00	257	Подскажите нормальная контора бк bwin	2	update through import_export	9	1
1575	2018-12-25 11:34:49.24965+00	258	подскажите пожалуйста БК?в которой все честно и где есть гарантия того что не кинут,а то я тут почитал отзывы о Фонбете! И что то желания у меня пропало в ней играть	2	update through import_export	9	1
1576	2018-12-25 11:34:49.252083+00	259	Какую БК мне выбрать, чтобы не было проблем?	2	update through import_export	9	1
1577	2018-12-25 11:34:49.254105+00	260	Какой букмекер самый лучший?	2	update through import_export	9	1
1578	2018-12-25 11:34:49.25635+00	261	Если играть на крупные суммы, как лучше всего выводить деньги? какую валюты выбрать? чтобы проценты были минимальные.	2	update through import_export	9	1
1579	2018-12-25 11:34:49.258356+00	262	Как лучше выводить деньги в какой валюте, если играешь на крупные суммы? Скрилл? чтобы % были маленькие.	2	update through import_export	9	1
1580	2018-12-25 11:34:49.260202+00	263	Играю много и на большие суммы. Не уверен что вывожу деньги лучшим способом. Чем лучше всего это делать?	2	update through import_export	9	1
1581	2018-12-25 11:34:49.261835+00	264	Если играть довольно на крупные суммы, то счет в какой валюте лучше всего выбрать, что бы с минимальными % можно было выводить деньги в платежную систему, а потом и на банковскую карту.	2	update through import_export	9	1
1582	2018-12-25 11:34:49.263406+00	265	Если я буду играть в Италии Франции Кипре любой другой строне, не в россии, со счета контор в которых я регался регистрировался из россии, смогу ли я делать ставки и вывести деньги?	2	update through import_export	9	1
1583	2018-12-25 11:34:49.265164+00	266	Могу ли я играть со своего российского аккаунта в другой странне?	2	update through import_export	9	1
1584	2018-12-25 11:34:49.266671+00	267	Могу ли я играть в другой стране с российских букмекеров?	2	update through import_export	9	1
1585	2018-12-25 11:34:49.26821+00	268	Если я перееду в другую страну, смогу ли я пользоваться своими счетами зарегистрированными в России, т.е делать ставки и выводить деньги, скажем из Италии, и кому в таком случае платить налоги?	2	update through import_export	9	1
1586	2018-12-25 11:34:49.269819+00	269	могу ли вывести депозит в скрилл через нетеллер	2	update through import_export	9	1
1587	2018-12-25 11:34:49.271292+00	270	skrill skkril skril скрил скрилл нетеллер нетелер neteller могу ли вывести деньги через них?	2	update through import_export	9	1
1588	2018-12-25 11:34:49.272804+00	271	депозит делал через skrill смогу ли вывести через neteller в бет 365, пинакл , сбобет , мачбук , бетфаир.	2	update through import_export	9	1
1589	2018-12-25 11:34:49.274278+00	272	Как не привязывать карту банка и играть делать ставки на сайте БК	2	update through import_export	9	1
1590	2018-12-25 11:34:49.27592+00	273	Можно ли обойтись без банковской карты	2	update through import_export	9	1
1591	2018-12-25 11:34:49.2783+00	274	Могу ли я не привязывать карту банка на аккаунт бк?	2	update through import_export	9	1
1592	2018-12-25 11:34:49.280406+00	275	Обязательно привязывать карту банка?	2	update through import_export	9	1
1593	2018-12-25 11:34:49.281984+00	276	Как вы ставите рейтинг, оценку БК	2	update through import_export	9	1
1594	2018-12-25 11:34:49.283837+00	277	Каким обазом вы оцениваете букмекеров	2	update through import_export	9	1
1595	2018-12-25 11:34:49.285464+00	278	Почему у Париматч оценка 5?	2	update through import_export	9	1
1596	2018-12-25 11:34:49.286953+00	279	Откуда такой высокий рейтинг у букмекера?	2	update through import_export	9	1
1597	2018-12-25 11:34:49.288489+00	280	Каким способом я могу пополнить счет в конторе?	2	update through import_export	9	1
1598	2018-12-25 11:34:49.290024+00	281	какой метод для пополнения своего счета в БК	2	update through import_export	9	1
1599	2018-12-25 11:34:49.291673+00	282	Как узнать, через что можно вывести деньги у БК? У букмекерской конторы.	2	update through import_export	9	1
1600	2018-12-25 11:34:49.29346+00	283	Как узнать какие платежные инструменты системы поддерживает контора?	2	update through import_export	9	1
1601	2018-12-25 11:34:49.295162+00	284	Как узнать через что можно закинуть или вывести деньги на счет букмекерских контор, БК?	2	update through import_export	9	1
1602	2018-12-25 11:34:49.296938+00	285	Как узнать, какие платежные системы позволяет использовать букмекерская контора?	2	update through import_export	9	1
1603	2018-12-25 11:34:49.298823+00	286	Есть ли лицензия у букмекера?	2	update through import_export	9	1
1604	2018-12-25 11:34:49.300781+00	287	Где посмотреть информацию о лицензии БК?	2	update through import_export	9	1
1605	2018-12-25 11:34:49.303094+00	288	Напишите мне почту, телефон службы поддержки букмекера	2	update through import_export	9	1
1606	2018-12-25 11:34:49.30497+00	289	как связаться со службой поддержки БК?	2	update through import_export	9	1
1607	2018-12-25 11:34:49.30656+00	290	Где ознакомиться с отзывами о БК?	2	update through import_export	9	1
1608	2018-12-25 11:34:49.3081+00	291	Хочу почитать отзывы на букмекера. 	2	update through import_export	9	1
1609	2018-12-25 11:34:49.309732+00	292	Можно ли перевести средства, закрыть аккаунт из winline com на winline ру и играть по человечески? спасибо.	2	update through import_export	9	1
1610	2018-12-25 11:34:49.311491+00	293	Можно ли перевести средства из winline.com на winline.ru?	2	update through import_export	9	1
1611	2018-12-25 11:34:49.313897+00	294	Можно ли перевести средства из bkfon.ru на fonbet.com?	2	update through import_export	9	1
1612	2018-12-25 11:34:49.316061+00	295	Можно ли перевести средства между 1хставкой и 1хбетом? 1xbet 1xставка разные конторы вообще или нет?	2	update through import_export	9	1
1613	2018-12-25 11:34:49.318244+00	296	Здравствуйте fonbet .ком И bkfon.ru это разные букмекеры? и могут ли возникнуть какие либо проблемы если зарегистрирован там и там	2	update through import_export	9	1
1614	2018-12-25 11:34:49.320204+00	297	Разноцветные фонбеты, в чем разница? Красный и синий.	2	update through import_export	9	1
1615	2018-12-25 11:34:49.321929+00	298	Чем различается фонбет и бетфон? 	2	update through import_export	9	1
1616	2018-12-25 11:34:49.323721+00	299	Две конторы Фонбет красная и синяя, чем они отличаются ? Или это одна ?	2	update through import_export	9	1
1617	2018-12-25 11:34:49.325795+00	300	париматч.ru и париматч.com в чем разница?	2	update through import_export	9	1
1618	2018-12-25 11:34:49.327889+00	301	1хставка это и есть 1xbet	2	update through import_export	9	1
1619	2018-12-25 11:34:49.329768+00	302	Какая разница между 1хбетом и 1хставкой?	2	update through import_export	9	1
1620	2018-12-25 11:34:49.331679+00	303	В чем разница между 1xbet и 1xставкой. Также известные как 1хбет и 1хставка	2	update through import_export	9	1
1621	2018-12-25 11:34:49.333582+00	304	В чем принципиальная разница между этими двумя конторами? Почему у них разные оценки? речь про 1хбет и 1хставка.	2	update through import_export	9	1
1622	2018-12-25 11:34:49.335469+00	305	В чем разница между 1xbet и 1xставкой. Также известные как 1хбет и 1хставка	2	update through import_export	9	1
1623	2018-12-25 11:34:49.337524+00	306	В чем принципиальная разница между этими двумя конторами? Почему у них разные оценки? речь про 1хбет и 1хставка.	2	update through import_export	9	1
1624	2018-12-25 11:34:49.339521+00	307	Букмекерская контора winline находится в двух отделах по оценкам. Winline есть 5 звёзд и 3 звезды, что вводит в не понятки. Прошу разъяснить ситуацию!	2	update through import_export	9	1
1625	2018-12-25 11:34:49.341591+00	308	Что за странная ссылка, при нажатии кнопки - перейти на сайт? Причем нерабочая. На сайт так и не попал.	2	update through import_export	9	1
1626	2018-12-25 11:34:49.343972+00	309	Почему при переходе на 1xbet меня направляет на 1хставка	2	update through import_export	9	1
1627	2018-12-25 11:34:49.346458+00	310	Надижаю перейти на сайт, переводит на другого букмекера. В чем дело?	2	update through import_export	9	1
1628	2018-12-25 11:34:49.348621+00	311	Развели 1хбет, можно ли как то привлечь их к ответственности? Мошенники! У них есть официальное представительство в россии? 1xbet	2	update through import_export	9	1
1629	2018-12-25 11:34:49.350683+00	312	1xbet вывели с моего счета деньги. как привлечь их к ответственности? Они совсем мошенники? Они официально дейстуют в РФ, России?	2	update through import_export	9	1
1630	2018-12-25 11:34:49.352853+00	313	Как играть на 1xbet? Сайт заблокирован в России.	2	update through import_export	9	1
1631	2018-12-25 11:34:49.354775+00	314	1xbet это официальная бк или нет? Помогите разобраться в действиях этой букмекерской конторы. 1хбет.	2	update through import_export	9	1
1632	2018-12-25 11:34:49.356627+00	315	Скажите, официальные ли действия 1xbet на территории РФ?	2	update through import_export	9	1
1633	2018-12-25 11:34:49.358664+00	316	Какая ответственность за игру на нелегальных букмекерах? Уголовная или административная? Могут ли меня найти и наказать?	2	update through import_export	9	1
1665	2018-12-25 11:34:49.425275+00	348	Можно ли выводить деньги с разных систем в одной и той же конторе?	2	update through import_export	9	1
1634	2018-12-25 11:34:49.360392+00	317	Если я постоянно играю и вывожу деньги с букмекеров запрещенных в россии могут ли меня наказать? Есть ли какая то статья для этого? они же не просто так нелегальные.	2	update through import_export	9	1
1635	2018-12-25 11:34:49.362283+00	318	Как избежать ответственности за игру на запрещенных букмекерах в россии? Есть ли вообще эта ответственность? Я про букмекеров запрещенных РКН роскомнадзором, в общем, которые в реесте запрещенных сайт	2	update through import_export	9	1
1636	2018-12-25 11:34:49.364233+00	319	Могут ли меня наказать за игру на незаконных букмекерах? Те кто не ведут свою деятельность из россии.	2	update through import_export	9	1
1637	2018-12-25 11:34:49.36606+00	320	Является ли игра, на сайтах букмекерских контор, которые попали в реестр запрещенных сайтов (William Hill, Betfair и т.д.) уголовно-наказуемой? а так же получение постоянной прибыли с них	2	update through import_export	9	1
1638	2018-12-25 11:34:49.368181+00	321	при регистрации в бк сделал опечатку, могут ли они заблокировать или исправят по просьбе? добавил лишнюю букву а в друго месте перепутал букву	2	update through import_export	9	1
1639	2018-12-25 11:34:49.370287+00	322	перепутал букву, проста опечатка, при регистрации в букмекерской конторе. могут ли они ее исправить или забанят? Заблокируют то есть.	2	update through import_export	9	1
1640	2018-12-25 11:34:49.372394+00	323	сделал ошибку когда регистрировался у букмекера, можно ли ее исправить?	2	update through import_export	9	1
1641	2018-12-25 11:34:49.374808+00	324	при регистрации сделал в имени одну ошибку, тоесть букву добавил, как быть в этом случае, могут ли они меня заблокировать если я им об этом скажу и отправлю паспорт? конечно не специально, просто техн	2	update through import_export	9	1
1642	2018-12-25 11:34:49.377461+00	325	Почему БК не принимает клиентов из тех или иных стран?	2	update through import_export	9	1
1643	2018-12-25 11:34:49.380081+00	326	Почему букмекерская контора не принимает ставки из каких то стран?	2	update through import_export	9	1
1644	2018-12-25 11:34:49.382526+00	327	Почему БК не хочет принимать мои ставки на основе гражданства?	2	update through import_export	9	1
1645	2018-12-25 11:34:49.384978+00	328	Почему БК дискриминирует клиентам по гражданству? например, ставки граждан одной страны принимает, а другой нет?	2	update through import_export	9	1
1646	2018-12-25 11:34:49.387014+00	329	Безопасно ли передавать букмекеру свои данные паспорта?	2	update through import_export	9	1
1647	2018-12-25 11:34:49.389289+00	330	Зачем конторе мои паспортные данные? Гражданство влияет на что то? Что конкретно им нужно?	2	update through import_export	9	1
1648	2018-12-25 11:34:49.391447+00	331	Что конкретно нужно конторе из моих паспортных данных?	2	update through import_export	9	1
1649	2018-12-25 11:34:49.393678+00	332	Контора просит у меня паспортные данные для полной регистрации!	2	update through import_export	9	1
1650	2018-12-25 11:34:49.395668+00	333	БК требует место прописки или выписку	2	update through import_export	9	1
1651	2018-12-25 11:34:49.397512+00	334	букмекер затребовал сделать фото на фоне переписки	2	update through import_export	9	1
1652	2018-12-25 11:34:49.399501+00	335	Как долго идут деньги до карты, если вывод подтвержден	2	update through import_export	9	1
1653	2018-12-25 11:34:49.401186+00	336	Сколько выводятся деньги до карты если бк согласовала	2	update through import_export	9	1
1654	2018-12-25 11:34:49.403058+00	337	Как долго выводятся деньги, скоро придут на карту?	2	update through import_export	9	1
1655	2018-12-25 11:34:49.40514+00	338	Если в запрос на вывод подтвержден оператором то через какое время деньги поступят на карту visa?	2	update through import_export	9	1
1656	2018-12-25 11:34:49.407468+00	339	Долго идет выигрыш на карту, что делать?	2	update through import_export	9	1
1657	2018-12-25 11:34:49.409886+00	340	Вывел деньги из бк, очень долго, прямо продолжительное время они не доходят, не поступают на карту. Букмекерская контора косячит?	2	update through import_export	9	1
1658	2018-12-25 11:34:49.412329+00	341	Выведенные из БК деньги продолжительное время не поступают на кредитную карту. Что делать?	2	update through import_export	9	1
1659	2018-12-25 11:34:49.414222+00	342	Подскажите если кто знает.Сколько времени занимает вывод с 1хбет на карту MasterCard ?	2	update through import_export	9	1
1660	2018-12-25 11:34:49.416052+00	343	Сделал запрос на вывод выигрыша с бк вильям хилл деньги со счета ушли но на карта и не поступили что мне делать	2	update through import_export	9	1
1661	2018-12-25 11:34:49.417874+00	344	Через какой промежуток времени поступают деньги, отправленные на вывод?	2	update through import_export	9	1
1662	2018-12-25 11:34:49.419746+00	345	Какой способ перевода денег более быстрый?	2	update through import_export	9	1
1663	2018-12-25 11:34:49.421611+00	346	Как быстрее всего вывести средства?	2	update through import_export	9	1
1664	2018-12-25 11:34:49.423364+00	347	Можно ли использовать несколько способов вывода и пополнения в одной и той же бк	2	update through import_export	9	1
1749	2018-12-25 11:34:49.583251+00	432	Этот чек подлинный или подделка?	2	update through import_export	9	1
1666	2018-12-25 11:34:49.427037+00	349	Можно ли использовать несколько платёжных систем при работе с одной и той же БК?	2	update through import_export	9	1
1667	2018-12-25 11:34:49.428995+00	350	Какими суммами лучше выводить, слышал лучше каждый день по 1,5к так меньше вероятность что на счет поставят ограничегия	2	update through import_export	9	1
1668	2018-12-25 11:34:49.430824+00	351	Какая минимальная сумма для вывода средств?	2	update through import_export	9	1
1669	2018-12-25 11:34:49.432742+00	352	Какая максимальная сумма для вывода средств?	2	update through import_export	9	1
1670	2018-12-25 11:34:49.434588+00	353	Сделал запрос на вывод средств, пришла смс от банка что деньги пришли в размере указанной суммы, но баланс карты не был увеличен. Такое возможно?	2	update through import_export	9	1
1671	2018-12-25 11:34:49.436557+00	354	Деньги пришли на карту, но сумма не увеличена.	2	update through import_export	9	1
1672	2018-12-25 11:34:49.438499+00	355	Что делать если не работает способ вывода денег	2	update through import_export	9	1
1673	2018-12-25 11:34:49.440824+00	356	Не могу вывести депозит	2	update through import_export	9	1
1674	2018-12-25 11:34:49.443074+00	357	Не получается вывести деньги, что делать?	2	update through import_export	9	1
1675	2018-12-25 11:34:49.445255+00	358	Я инвалид 2группы и позтому индентификацию могу пройти заочно.Для этого 7.04.2017 заполнил все требуемые паспортные данные и также повторил по скайпу.Но оказалось ,что -то не прошёл.Прошу сообщить пож	2	update through import_export	9	1
1676	2018-12-25 11:34:49.447648+00	359	Я сделал ставку, потом уже через 3 дня пишут что сайт заблокировали, могу я вернуть деньги ?	2	update through import_export	9	1
1677	2018-12-25 11:34:49.449697+00	360	Я вожу числа с карточки , деньги снимаются на пару минут , и потом снова перекидываются на аккаунт Помогите пожалуйста	2	update through import_export	9	1
1678	2018-12-25 11:34:49.451604+00	361	Как перевести деньги если на выводе средств в 1xbet нет такого пункта как Сбербанк онлайн	2	update through import_export	9	1
1679	2018-12-25 11:34:49.453759+00	362	Кинул деньги на сайт через киви кошелёк они не пришли. Много раз так делал все было хорошо а сейчас деньги не пришли остался чек. Как быть.	2	update through import_export	9	1
1680	2018-12-25 11:34:49.455595+00	363	не принимает деньги по картам, по киви прошла оплата. в чем дело?	2	update through import_export	9	1
1681	2018-12-25 11:34:49.457424+00	364	прошла ставка!выиграл деньги. после чего решил вывести их. захожу, на счет -он заблокирован! мне пришло от вас письмо с паролем! что с ним делать? как вывести деньги? с кем связаться? вот такое письмо	2	update through import_export	9	1
1682	2018-12-25 11:34:49.45918+00	365	Запрос на вывод был одобрен, но деньги все никак не проходят. В окошке обозначено, что перевод в процессе и ожидает подтверждения у оператора. Но что-то долго он не подтверждает. Сколько времени приде	2	update through import_export	9	1
1683	2018-12-25 11:34:49.460885+00	366	Сделал запрос на вывод средств, одобрили но деньги не приходят они в процессе уже 3 день, но попробовал вывести 100 рублей сразу перевели	2	update through import_export	9	1
1684	2018-12-25 11:34:49.462784+00	367	В техподдержке уже неделю пишут что проблемы со шлюзом и деньги нельзя вывести. Выводы висят в обработке день, затем возвращаются с пометкой "Перезакажите выплату"	2	update through import_export	9	1
1685	2018-12-25 11:34:49.46463+00	368	Только зарегистрировалась и положила деньги на счет а номер счета не по смотрела приложение вылетело тут же захожу нет профиля как узнать номер счета?	2	update through import_export	9	1
1686	2018-12-25 11:34:49.466442+00	369	Здравствуйте,я вчера пополнил счёт 2 раза деньги не пришли.В чем дело?3026293	2	update through import_export	9	1
1687	2018-12-25 11:34:49.468327+00	370	Забыл номер счета,он мне пришел на телефон а это сообщение удалил,что мне делать	2	update through import_export	9	1
1688	2018-12-25 11:34:49.47048+00	371	я создал через мобильное прил номер счета потом мне придложили скачать другую версию!!!!! когда я хотел снять со счета деньги он попросил авторизоватся я зарегистрировался заново и не могу вывести ден	2	update through import_export	9	1
1689	2018-12-25 11:34:49.472562+00	372	не могу вывести денежные средства со счета, не приходит индефикация? Как мне быть?	2	update through import_export	9	1
1690	2018-12-25 11:34:49.474624+00	373	Как получить бесплатный бонус, после пополнения счёта и после скольких игр, его можно вывести ?	2	update through import_export	9	1
1691	2018-12-25 11:34:49.476779+00	374	что делать если забыли секретные вопросы?	2	update through import_export	9	1
1692	2018-12-25 11:34:49.47898+00	375	Квитанция:2453 Терминал:10261474 Дата:02.05.2017 15:33:36 Поставщик: Киви банк Зачислено:100 руб. Номер телефона/счета: 79670847870 Код операции:3891908147 Почему деньги не пришел на моего личного каб	2	update through import_export	9	1
1693	2018-12-25 11:34:49.480777+00	376	Не работает приложение БК.	2	update through import_export	9	1
1719	2018-12-25 11:34:49.534001+00	402	Правда ли что есть такие ограничения? Я ни где не нашёл это в их правилах	2	update through import_export	9	1
1694	2018-12-25 11:34:49.482638+00	377	уважаемый админ! Ответьте, пожалуйста на вопрос. Как мне вывести деньги со счета БК Марафон, если я не помню ответа на секретный вопрос? Ответ по глупости оказался не записан и со временем забыт. Возм	2	update through import_export	9	1
1695	2018-12-25 11:34:49.484636+00	378	Нет возможности делать запросы в личном кабинете через пк.	2	update through import_export	9	1
1696	2018-12-25 11:34:49.486581+00	379	Добрый день, не выводят на киви уже в течении трёх дней, проблема как будто не решается, возможно ли вывести другим способом деньги? 	2	update through import_export	9	1
1697	2018-12-25 11:34:49.488322+00	380	Ограничения по количеству ставок в экспрессе отсутствует?	2	update through import_export	9	1
1698	2018-12-25 11:34:49.490456+00	381	Здрасте. Когда Марафон станет белым, пушистым и будет работать через ЦУПИС? Чехарда с перебоями в работе из-за блокировок уже утомила. Раз ваши программисты не могут наладить бесперебойную работу, как	2	update through import_export	9	1
1699	2018-12-25 11:34:49.492458+00	382	Как осуществляется (или осуществляется ли) удержание налога с выигрышных ставок?	2	update through import_export	9	1
1700	2018-12-25 11:34:49.494442+00	383	Доброго времени суток. Год назад были порезаны максимумы по счёту 93768GU из-за нескольких ставок по вилкам, это стратегий давно не пользуюсь. Есть ли возможность восстановить максимумы для комфортной	2	update through import_export	9	1
1701	2018-12-25 11:34:49.496329+00	384	Зарегистрировался на Лига ставок по вашей партнёрке, бонус не начислен, Телепняк Максим Анатольевич, номер счёта 997468834	2	update through import_export	9	1
1702	2018-12-25 11:34:49.498312+00	385	Скиньте сылку на Фонбет в апстори	2	update through import_export	9	1
1703	2018-12-25 11:34:49.500081+00	386	давно не заходил в приложение(ФОНБЕТ)на айфоне,недавно попытался зайти,не чего не открывает и выдаёт непонятные ошибки,чтобы перезайти не помню не логин не пароль. подскажите как быть?	2	update through import_export	9	1
1704	2018-12-25 11:34:49.501904+00	387	Подскажие что нужно сделать для того чтобы отправить свой ресурс на проверку Вашей компанией?	2	update through import_export	9	1
1705	2018-12-25 11:34:49.50345+00	388	Не могу зайти на свой профиль,пишет безопасное подключение не возможно	2	update through import_export	9	1
1706	2018-12-25 11:34:49.505409+00	389	Никак не получается зайти на страницу входа,где я смог бы ввести свой логин и пароль,главная страница,страница поддержки и т.д. спокойно открываются.Подскажите пожалуйста,в чем дело?	2	update through import_export	9	1
1707	2018-12-25 11:34:49.50723+00	390	несколько раз пробовал снять деньги на карту, но показывает что какая то ошибка	2	update through import_export	9	1
1708	2018-12-25 11:34:49.50901+00	391	на счете в бк находится депозит оплаченный истекшей картой. Если я сейчас сделаю пополнение новой картой, смогу ли снять потом и предыдущий депозит? Или только банковский перевод?	2	update through import_export	9	1
1709	2018-12-25 11:34:49.510661+00	392	При регистрации пишет, что пользователь с данным lp уже зарегистрирован	2	update through import_export	9	1
1710	2018-12-25 11:34:49.512669+00	393	Подскажите, не будет ли проблем (при выводе средств с букмекерской конторы) при использовании НЕ именной карты? могут ли они потребовать её фото и не вызовет ли она каких-либо вопросов или подозрений?	2	update through import_export	9	1
1711	2018-12-25 11:34:49.515073+00	394	Через рейтинг букмекеров по бонусной программе в бк Леон не проходит регистрация?Все поля заполнил правильно!Пишут добавить 1цифру или букву в пароль.Добавил аж до двадцати включая символы!-и так раз 	2	update through import_export	9	1
1712	2018-12-25 11:34:49.517535+00	395	Когда я хочу пополнить счёт с карты,то пишет ваш депозит заблокирован,что делать?	2	update through import_export	9	1
1713	2018-12-25 11:34:49.519898+00	396	Вчера только что зарегистрировался на сайте,а сегодня уже не могу туда зайти,пишет ваш щет заблокировать,как так что это такое	2	update through import_export	9	1
1714	2018-12-25 11:34:49.52239+00	397	Заблокировали игровой счёт, почему?	2	update through import_export	9	1
1715	2018-12-25 11:34:49.524997+00	398	Уже третьи сутки не пополняется счёт в бетсити с карты VISA. Вводу все данные нажимаю продолжить и пишет сразу счёт не выставлен ошибка пополнения. Помогите	2	update through import_export	9	1
1716	2018-12-25 11:34:49.527107+00	399	Не могу зайти в аккаунт, пишет, что не правильный логин или пароль, хотя логин мой майл, пароль поменяла, но всё равно пишет, что не правильно!! Что я делаю не так?	2	update through import_export	9	1
1717	2018-12-25 11:34:49.529322+00	400	Дело в том что я хочу зарегистрироваться в БК но имею временную прописку,по этому хочу узнать возникнут ли у меня с этим проблемы с дальнейшей идентификацией.	2	update through import_export	9	1
1718	2018-12-25 11:34:49.53158+00	401	Вазможно ли восстановить 1 ый аккаунт 1xBet по паспортным данным ели я потерял номер счёта и пароль ?	2	update through import_export	9	1
1720	2018-12-25 11:34:49.536491+00	403	просят верифицироваться на сайте но я не могу найти где это можно сделать, подскажите пожалуйста	2	update through import_export	9	1
1721	2018-12-25 11:34:49.53864+00	404	Как восстановить пароль?	2	update through import_export	9	1
1722	2018-12-25 11:34:49.540866+00	405	Будут ли в этом году традиционные новогодние фрибеты от компании фонбет?	2	update through import_export	9	1
1723	2018-12-25 11:34:49.542958+00	406	Почему в белорусской версии сайта и на ППС не предлагаются дополнительные исходы на статистику футбол, теннис, хоккей?	2	update through import_export	9	1
1724	2018-12-25 11:34:49.544669+00	407	Я бы хотел поменять мой электронный адрес на сайте Винлайн.com я указал неверный ошибочно как это сделать?	2	update through import_export	9	1
1725	2018-12-25 11:34:49.546338+00	408	Скажите Можно ли восстановить пароль с помощью номера телефона через который я регистрировался?	2	update through import_export	9	1
1726	2018-12-25 11:34:49.548154+00	409	Зарегистрировал не правильный номер,не могу поменять,не открывает страницу	2	update through import_export	9	1
1727	2018-12-25 11:34:49.54989+00	410	Интересует количество накопленных баллов	2	update through import_export	9	1
1728	2018-12-25 11:34:49.551534+00	411	Что у вас за платформа .Как мне войти на покер онлайн.Всё время пишет не верный пароль .Пробовал менять .Открывается всё кроме покера онлайн .Мой логин 3370813.	2	update through import_export	9	1
1729	2018-12-25 11:34:49.553321+00	412	Пройдёт ли верификация если счёт зарегистрирован на старый паспорт (номер,прописка и т.д) а я пришлю ксерокопию нового паспорта (заменил в 20 лет)	2	update through import_export	9	1
1730	2018-12-25 11:34:49.554855+00	413	Такой вопрос я играю по бою и довольно таки не плохо могу выкатать играя в лайве. Скажите после какой суммы вы меня обрежете?? Ставлю не вилки не доги и т.д. По бою но выиграть могу много	2	update through import_export	9	1
1731	2018-12-25 11:34:49.556551+00	414	живу в украине,bet365 заблокировал аккаунт,пвх получила,документы заверила и отослала,отправила банковские реквизиты они не подходят,они не могут переслать средства через американский банк посредник,ч	2	update through import_export	9	1
1732	2018-12-25 11:34:49.557951+00	415	Зарегистрировался в конторе Leon. Ввел бонусный код. Зачисление бонусных денег не произошло. Что делать?	2	update through import_export	9	1
1733	2018-12-25 11:34:49.559549+00	416	как поменять номер телефона	2	update through import_export	9	1
1734	2018-12-25 11:34:49.561034+00	417	А скажите пожалуйста в каком конкурсе прогнозов можно поучаствовать в ближайшее время?? есть ли какие нибудь варианты заработать на этом сайте?	2	update through import_export	9	1
1735	2018-12-25 11:34:49.56244+00	418	Выкинуло с моего аккаунта и не заходит и вобще олимп не работает	2	update through import_export	9	1
1736	2018-12-25 11:34:49.563997+00	419	Хочу знать какие страны запрещены на Winline	2	update through import_export	9	1
1737	2018-12-25 11:34:49.565488+00	420	А скажите пожалуйста в каком конкурсе прогнозов можно поучаствовать в ближайшее время?? есть ли какие нибудь варианты заработать на этом сайте?	2	update through import_export	9	1
1738	2018-12-25 11:34:49.567178+00	421	Прошло почти 2 недели, как мой счет заблокирован в БК Марафон после моего обращения о неавторизированном использовании игрового счета. Хотелось бы конкретики относительно сроков рассмотрения деталей п	2	update through import_export	9	1
1739	2018-12-25 11:34:49.568742+00	422	В БК проводятся ремонтные работы, сайт не работает?	2	update through import_export	9	1
1740	2018-12-25 11:34:49.570158+00	423	У моего друга заблокировали счет в БК "Олимп".Видимо , потому что , он очень много выиграл.Как вернуть деньги и разблокировать счет?	2	update through import_export	9	1
1741	2018-12-25 11:34:49.571717+00	424	Букмекер уже 2 дня не расчитывает ставку.	2	update through import_export	9	1
1742	2018-12-25 11:34:49.573164+00	425	Здравствуйте не могу зайти на сайт?	2	update through import_export	9	1
1743	2018-12-25 11:34:49.574473+00	426	Добрый день, у меня вопрос касательно конторы 1xbet. Поставил свою первую ставку в этой конторе (крупную сумму) на событие ночью с коэффициентом 1,43, утром захожу в историю ставок стоит 1,2. Скрины н	2	update through import_export	9	1
1744	2018-12-25 11:34:49.575918+00	427	три дня назад поставил ставку выбрал экспресс вроде бы все съиграло только я незнаю одной игры из экспресса тенисный матч ну я думаю что моя ставка съиграла. я не могу получить расчет уже 3 дня	2	update through import_export	9	1
1745	2018-12-25 11:34:49.577727+00	428	Что делать если взломали и забрали деньги ?	2	update through import_export	9	1
1746	2018-12-25 11:34:49.579158+00	429	почему опять возврат по выиграшной ставке?	2	update through import_export	9	1
1747	2018-12-25 11:34:49.580656+00	430	я не пойму почему пару моих ставок застыли и ничего не происходит с ними,написано не рассчитано и всё!!!как это понимать?	2	update through import_export	9	1
1748	2018-12-25 11:34:49.58202+00	431	Букмекер неправильно рассчитал матч, что делать?	2	update through import_export	9	1
1750	2018-12-25 11:34:49.584617+00	433	Я хочу сменить валюту счета	2	update through import_export	9	1
1751	2018-12-25 11:34:49.586459+00	434	Сайт плохо работает, что делать.	2	update through import_export	9	1
1752	2018-12-25 11:34:49.588236+00	435	Плохо работает сайт	2	update through import_export	9	1
1753	2018-12-25 11:34:49.58969+00	436	Сайт не работает, виснет, лагает, зависает	2	update through import_export	9	1
1754	2018-12-25 11:34:49.591221+00	437	Недавно зарегистрировался , испытываю проблемы с сайтом	2	update through import_export	9	1
1755	2018-12-25 11:34:49.592558+00	438	Добрый день, как попасть к Вам в раздел капперы?	2	update through import_export	9	1
1756	2018-12-25 11:34:49.593871+00	439	Добрый вечер! Как можно удалить свой аккаунт ?	2	update through import_export	9	1
1757	2018-12-25 11:34:49.595421+00	440	Здравствуйьте. Искал ответ на вопрос на сайте,но не нашел. В контакте часто вижу наклейку на аватарках групп о том,что они прошли Вашу проверку. Как сделать так,чтобы и моя группа прошла вашу проверку	2	update through import_export	9	1
1758	2018-12-25 11:34:49.59696+00	441	Здравствуйте Уважаемый Рейтинг букмекеров.Как можно получить вашу проверку на вкладку капперы,т.е попасть в список проверенных капперских сайтов?	2	update through import_export	9	1
1759	2018-12-25 11:34:49.598336+00	442	Добрый вечер уважаемые "РБ" . Хочу попасть в ваш рейтинг капперов,точнее свою группу дать на проверку..	2	update through import_export	9	1
1760	2018-12-25 11:34:49.599744+00	443	Куда можно предложить сайт каппера на проверку?	2	update through import_export	9	1
1761	2018-12-25 11:34:49.601101+00	444	Доброго времени суток! Наблюдаю что многие сайты и группы в вк отмечены тем что прошли проверку "Рейтинга Букмекеров". Скажите пожалуйста как пройти вашу проверку?	2	update through import_export	9	1
1762	2018-12-25 11:34:49.602561+00	445	Добрый день,хочу отправить свою группу по ставкам на проверку и получить одобрение,как это возможно сделать?	2	update through import_export	9	1
1763	2018-12-25 11:34:49.604036+00	446	Добрый день. Как я могу пройти проверку на вашем ресурсе? Наш сайт streambet.ru.	2	update through import_export	9	1
1764	2018-12-25 11:34:49.605563+00	447	Как пройти проверку у Вас, если у меня есть паблик 3800 участников?	2	update through import_export	9	1
1765	2018-12-25 11:34:49.607054+00	448	Здравствуйте я занимаюсь прогнозами на спорт и их продажей в социальной сити вконтакте. Есть ли возможность пройти у вас проверку?	2	update through import_export	9	1
1766	2018-12-25 11:34:49.608719+00	449	Здравствуйте я администратор одного из пабликов в ВК по тематике "Прогнозы на спорт" хотел бы пройти проверку у вас. Куда обратиться?	2	update through import_export	9	1
1767	2018-12-25 11:34:49.610279+00	450	Всем доброго времени! такой вопрос:как пройти проверку прогнозистов , веду группу, планирую создать сайт,хотелось бы пройти проверку и вступить в ваш рейтинг!	2	update through import_export	9	1
1768	2018-12-25 11:34:49.611871+00	451	приветствую, веду свой паблик в ВК ставки полностью верфицированы на сервисе betonsuccess, как пройти вашу проверку? /Комментарий был отредактирован. Ссылки на сторонние ресурсы запрещены/	2	update through import_export	9	1
1769	2018-12-25 11:34:49.613563+00	452	Как подать заявку на проверку своей группы вконтакте?	2	update through import_export	9	1
1770	2018-12-25 11:34:49.61508+00	453	Есть свой капперский проект, хочу пройти проверку сайта "Рейтинг букмекеров". Куда надо подать заявку?	2	update through import_export	9	1
1771	2018-12-25 11:34:49.616636+00	454	А можно как то новость создать?Сегодня зашел ординаром кф 101)))хотел дать прогноз но что в трибуне на это событие но что то рука не дошла)))	2	update through import_export	9	1
1772	2018-12-25 11:34:49.618308+00	455	Доброго времени суток. Я точно не помню был ли ранее зарегистрирован на Вашем ресурсе. Сегодня прошел регистрацию, но так как планирую принять участие в конкурсе, то возникает вопрос - не получу я в с	2	update through import_export	9	1
1773	2018-12-25 11:34:49.620071+00	456	Как попасть моей группе в ваш раздел Капперы. ? Занимаюсь Прогнозами на движение коэффициента на бирже бетфаир до начала игры. И обычными ординарными ставками.по выгодным коэффициентам.Все бесплатно в	2	update through import_export	9	1
1774	2018-12-25 11:34:49.621863+00	457	Добрый день ! Каким образом можно попасть в список "Рейтинг капперских сайтов" . Группа ВК 750 участников	2	update through import_export	9	1
1775	2018-12-25 11:34:49.623544+00	458	Удалите мой аккаунт на РБ	2	update through import_export	9	1
1776	2018-12-25 11:34:49.625158+00	459	Приветствую, администрация РБ, хотел узнать, каким образом моя группа могла бы попасть в рейтинг капперов. Она полностью соответствует требованиям РБ. Все проверки готов пройт	2	update through import_export	9	1
1777	2018-12-25 11:34:49.626741+00	460	Можно-ли удалить свой профиль на сайте РБ? Если да, то как?	2	update through import_export	9	1
1778	2018-12-25 11:34:49.62839+00	461	Как удалить прогноз на сайте РБ?	2	update through import_export	9	1
1779	2018-12-25 11:34:49.630018+00	462	Статус не обновился через 2 месяца, почему?	2	update through import_export	9	1
1780	2018-12-25 11:34:49.631501+00	463	Статус понижен с Гуру на Профи, хотя все условия соблюдены	2	update through import_export	9	1
1781	2018-12-25 11:34:49.633238+00	464	логина, сегодня первый раз получилось войти, но потом вылетел и снова не могу войти. Может вы в курсе в вем проблема?	2	update through import_export	9	1
1782	2018-12-25 11:34:49.635328+00	465	Нашла одно приложение в аб сторе , но там не даёт Приложение регистрации , пишит введите номер купона. Но у меня его нет . Как мне на айфон скачать приложение и зарегистрироватся?	2	update through import_export	9	1
1783	2018-12-25 11:34:49.637517+00	466	не могу зайти в личный кабинет пишет не правильный пароль,а все пишу правильно,и восстановить так же не получается,что делать?	2	update through import_export	9	1
1784	2018-12-25 11:34:49.63937+00	467	Удалите спам	2	update through import_export	9	1
1785	2018-12-25 11:34:49.64131+00	468	хочу поменять почту на РБ	2	update through import_export	9	1
1786	2018-12-25 11:34:49.643098+00	469	доброго времени суток. у меня на сайте два профиля. один я хочу удалить. подскажите как	2	update through import_export	9	1
1787	2018-12-25 11:34:49.645143+00	470	подскажите как добавить каппера в рейтинг? заранее спс	2	update through import_export	9	1
1788	2018-12-25 11:34:49.646955+00	471	Как добавить свою группу вк в рейтинг капперов ?	2	update through import_export	9	1
1789	2018-12-25 11:34:49.648575+00	472	Проблемы с системой Skrill	2	update through import_export	9	1
1790	2018-12-25 11:34:49.650233+00	473	Не могу найти как удалить свою страницу.	2	update through import_export	9	1
1791	2018-12-25 11:34:49.651973+00	474	Почему вы меня заблокировали?	2	update through import_export	9	1
1792	2018-12-25 11:34:49.653926+00	475	Как добавить свою группу вк по спорт.прогнозам в рейтинг?	2	update through import_export	9	1
1793	2018-12-25 11:34:49.655606+00	476	Хотелось бы добавить свою группу к вам на сайт. Что для это нужно сделать?	2	update through import_export	9	1
1794	2018-12-25 11:34:49.657048+00	477	Хотелось узнать на какой стадии мой запрос, и какое решение было принято.	2	update through import_export	9	1
1795	2018-12-25 11:34:49.65834+00	478	Что нужно сделать, чтобы моя капперская группа в вк попала в ваш рейтинг?	2	update through import_export	9	1
1796	2018-12-25 11:34:49.659751+00	479	Столкнулась с группой прогнозистов  verbalen. В ваших отзывах о каперах о них ничего не написано. Статистика у них отличная. Пожалуйста проверьте эту группу, не рисуют ли они статистику. Спасибо))	2	update through import_export	9	1
1797	2018-12-25 11:34:49.661306+00	480	Я хочу предложить идею для развития сайта, конкурса	2	update through import_export	9	1
1798	2018-12-25 11:34:49.662797+00	481	Не могли бы вы улучшить сайт, внеся необходимые изменения	2	update through import_export	9	1
1799	2018-12-25 11:34:49.664263+00	482	не работает ваше приложение, что случилось?	2	update through import_export	9	1
1800	2018-12-25 11:34:49.665749+00	483	у меня есть предложение о сотрудничестве	2	update through import_export	9	1
1801	2018-12-25 11:34:49.667182+00	484	я представитель букмекерской компании	2	update through import_export	9	1
1802	2018-12-25 11:34:49.66868+00	485	Не могу зайти в личный кабинет, для пополнения счета, сервер не отвечает, почему?	2	update through import_export	9	1
1803	2018-12-25 11:34:49.670198+00	486	Не могу зайти к себе в личный кабинет !	2	update through import_export	9	1
1804	2018-12-25 11:34:49.671731+00	487	Как удалить свой аккаунт на всегда?	2	update through import_export	9	1
1805	2018-12-25 11:34:49.673353+00	488	расширения давно перестали помогать, даже кровные хз как вывести, подскажите дельным советом пожалуйста.	2	update through import_export	9	1
1806	2018-12-25 11:34:49.675014+00	489	Сайты все перевели на один 1х ставка, но для ставок в 1хставке требуется сходить в контору, может кто знает другое приложение подобное леону или где-нибудь с файлообменника ссылку кинет	2	update through import_export	9	1
1807	2018-12-25 11:34:49.676817+00	490	Не могу попасть на сайт лиги ставок	2	update through import_export	9	1
1808	2018-12-25 11:34:49.678624+00	491	Не могу попасть на сайт вильям хил, чтобы посмотреть коэффициенты для участям в конкурсе. Как решить эту проблему ?	2	update through import_export	9	1
1809	2018-12-25 11:34:49.680588+00	492	Я не могу зайти на свой логин .нет доступа.с Казахстана сам.для нас заблокирован ?	2	update through import_export	9	1
1810	2018-12-25 11:34:49.68219+00	493	скиньте новый сайт зенит бк	2	update through import_export	9	1
1811	2018-12-25 11:34:49.683791+00	494	Как выйти на сайт бк пари-матч.ком?	2	update through import_export	9	1
1812	2018-12-25 11:34:49.685422+00	495	Вчера и сегодня безуспешно пытаюсь войти на сайты БК "Марафон" и БК "Фонбет". В чем причина? Опять блокировка?	2	update through import_export	9	1
1813	2018-12-25 11:34:49.686994+00	496	Нет входа ни с браузеров ПК ни с телефона андроид. Только мобильная версия работает. По ссылке РБ тоже не получается войти. Сам сайт не загружается вообще.	2	update through import_export	9	1
1814	2018-12-25 11:34:49.688754+00	497	Сделал прогноз для конурса, его удалили, т.к. такой ставки нет в БК Вильям Хилл. Как узнать, если ли данный исход, если у Вильям Хилл нет сайта ?	2	update through import_export	9	1
1815	2018-12-25 11:34:49.690707+00	498	подскажите пожалуйста, как войти на вильям хилл? сегодня блокнул провайдер. расширения или зеркала? есть мозилла и опера турбо. спасибо	2	update through import_export	9	1
1816	2018-12-25 11:34:49.692416+00	499	Здравствуйте,не могу зайти на сайты букмекерских контор,они заблокированы,как обойти это?	2	update through import_export	9	1
1817	2018-12-25 11:34:49.693791+00	500	Нахожусь в Испании, не заходит на BetFair.com перекидывает на BetFair.es. подскажите, как решить эту проблему?	2	update through import_export	9	1
1818	2018-12-25 11:34:49.695214+00	501	я не могу зайти в 1xbet когда я захожу там написано страница заблокирована что делать?	2	update through import_export	9	1
1819	2018-12-25 11:34:49.696568+00	502	Как зайти на Вильям Хилл?	2	update through import_export	9	1
1820	2018-12-25 11:34:49.69817+00	503	не могу получить доступ к сайту	2	update through import_export	9	1
1821	2018-12-25 11:34:49.699554+00	504	Заблокировали Winline22, есть зеркало?	2	update through import_export	9	1
1822	2018-12-25 11:34:49.700853+00	505	Не могу перейти на вилиям хилл почему?	2	update through import_export	9	1
1823	2018-12-25 11:34:49.702415+00	506	Помогите войти на сайт Вильям Хилл	2	update through import_export	9	1
1824	2018-12-25 11:34:49.70422+00	507	Заходил на этот сайт в течении 2 месяцев ... Бац и заходу сегодня и пишет доступ ограничен	2	update through import_export	9	1
1825	2018-12-25 11:34:49.706085+00	508	Вопрос прост: многие сайты бекмекерских контор в России регулярно блокируются по требованию росинтернетнадзора (или как их там). В частности, страдает WH, где не очень оперативно создают зеркала и дво	2	update through import_export	9	1
1826	2018-12-25 11:34:49.707895+00	509	при верификации на бетфайр при отправке доков нужно ли отключать плагин ZenMate(так как сижу с немецкого IP а паспорт отправляю российский) не возникнет ли у меня проблем?	2	update through import_export	9	1
1827	2018-12-25 11:34:49.710082+00	510	Вопрос такого характера: два дня назад пропало соединение с БК Winline, работает ли сайт? не заблокировали его?	2	update through import_export	9	1
1828	2018-12-25 11:34:49.712253+00	511	Хотел бы открыть счет, но оператор МТС(Россия) блокирует вход на официальный сайт. Как то возможно обойти данную преграду?	2	update through import_export	9	1
1829	2018-12-25 11:34:49.714203+00	512	Перехожу на сайт и его блокирует как сотовый так и интернет провайдер,как зайти?	2	update through import_export	9	1
1830	2018-12-25 11:34:49.716186+00	513	без всяких проблем ставил в интернете в БК 1хбет... А сейчас зайти не могу, сайт заблокирован. Не подскажите в чем дело?	2	update through import_export	9	1
1831	2018-12-25 11:34:49.718053+00	514	Не могу зайти на сайт может есть какой-нибудь другой сайт фонбета	2	update through import_export	9	1
1832	2018-12-25 11:34:49.719942+00	515	дайте зеркало	2	update through import_export	9	1
1833	2018-12-25 11:34:49.721872+00	516	не могу зайти на сайт pinnacle, есть средства на счету,как можно их вывести?	2	update through import_export	9	1
1834	2018-12-25 11:34:49.724052+00	517	Сайт иногда блокируют.Каким образом обойти блокировку?	2	update through import_export	9	1
1835	2018-12-25 11:34:49.726164+00	518	Не могу войти на сайт, есть ссылка?	2	update through import_export	9	1
1836	2018-12-25 11:34:49.727992+00	519	Сайт на котором я играл заблокировали , что делать подскажите?	2	update through import_export	9	1
1837	2018-12-25 11:34:49.729844+00	520	Друзья, помогите разобраться. С телефона не могу зайти на этот сайт, блокирует (MTC-BLOK) что за хрень? до этого все работало.	2	update through import_export	9	1
1838	2018-12-25 11:34:49.731408+00	521	Известно ли почему не работает сайт Виллиам Хилл? И когда на него можно будет зайти?	2	update through import_export	9	1
1839	2018-12-25 11:34:49.733023+00	522	не могу зайти на сайт	2	update through import_export	9	1
1840	2018-12-25 11:34:49.734582+00	523	Как зайти на сайт БК Титанбет?	2	update through import_export	9	1
1841	2018-12-25 11:34:49.736757+00	524	весь день не могу зайти на сайт,раньше заходил без проблем	2	update through import_export	9	1
1842	2018-12-25 11:34:49.738521+00	525	Немогу попасть на сайт, зеркало	2	update through import_export	9	1
1843	2018-12-25 11:34:49.740273+00	526	Я не могу зайти на сайт появляется изображение что доступ ограничен	2	update through import_export	9	1
1844	2018-12-25 11:34:49.742232+00	527	Не могу зайти на сайт LEON	2	update through import_export	9	1
1845	2018-12-25 11:34:49.744549+00	528	Я не могу зайти на сайт ресурс заблокирован везде	2	update through import_export	9	1
1846	2018-12-25 11:34:49.7466+00	529	Мужчины и леди, доброго времени суток. Столкнулся я с такой проблемой: не нахожу ссылку на William Hill. Воооот. Быть может, кто в курсе, окажет мне помощь?? Безмерно благодарен)))	2	update through import_export	9	1
1847	2018-12-25 11:34:49.748436+00	530	Как попасть на сайт БК William hill? Пробую, но он заблокирован. Есть ли другой способ?	2	update through import_export	9	1
1848	2018-12-25 11:34:49.75029+00	531	Как зайти бк William Hill, никак не могу найти альтернативную ссылку.	2	update through import_export	9	1
1849	2018-12-25 11:34:49.752139+00	532	Какие критерии для капперских сайтов	2	update through import_export	9	1
1850	2018-12-25 11:34:49.75357+00	533	каким критериям нужно соответствовать каперской группе, ресурсу?	2	update through import_export	9	1
1851	2018-12-25 11:34:49.755118+00	534	Почему ничего не приходит на почту когда подписался на каппера? И не могу посмотреть его прогнозы	2	update through import_export	9	1
1852	2018-12-25 11:34:49.756861+00	535	Не могу посмотреть прогнозы каппера, не приходят уведомления и ничего тоже	2	update through import_export	9	1
1853	2018-12-25 11:34:49.758672+00	536	Подписался на каппера но ничего не приходит, что делать	2	update through import_export	9	1
1854	2018-12-25 11:34:49.760456+00	537	Добрый день. Подписался на каппера, но не могу посмотреть его прогнозы на сегодня и завтра. На почту также ничего не приходит. Объясните пожалуйста, что я сделал не так. (первый день на сайте)	2	update through import_export	9	1
1855	2018-12-25 11:34:49.762066+00	538	Капперская группа подделывает статистику и обманывает	2	update through import_export	9	1
1856	2018-12-25 11:34:49.763471+00	539	каппер мошенник	2	update through import_export	9	1
1857	2018-12-25 11:34:49.764882+00	540	Мы играем с женой, с одной карты на двух аккаунтах. Будет ли это считаться мультиаккаунтингом? С одного устройства	2	update through import_export	9	1
1858	2018-12-25 11:34:49.76632+00	541	Если играем с братом другом с одной карты на разных двух нескольких аккаунтах, считается ли это мультиаккаунтингом? Мультиакком, мультиком, или как он там. Устройства разные	2	update through import_export	9	1
1859	2018-12-25 11:34:49.767829+00	542	Одна кредитка, то есть кредитная карта, и два аккаунта. могут ли забанить? Если я пополнил так. И почему. Устройство одно	2	update through import_export	9	1
1860	2018-12-25 11:34:49.769215+00	543	Забанили за мультиакк, друг пополнил с моей карты аккаунт. Как так?	2	update through import_export	9	1
1861	2018-12-25 11:34:49.770558+00	544	если мой брат будет играть в той же конторе что и я, с одного компа, пополнять счет с одной карты на разные счета - это мультиаккаунтинг???	2	update through import_export	9	1
1862	2018-12-25 11:34:49.772364+00	545	Зарегался с другого устройства, не могу вывести средства. Типа зареган другой логин	2	update through import_export	9	1
1863	2018-12-25 11:34:49.773857+00	546	Забыл логин пароль от акка, зарегался с другого, не могу вывести средства	2	update through import_export	9	1
1864	2018-12-25 11:34:49.775281+00	547	Потерял телефон, зарегался со второго, деньги не выводятся. Не могу восстановить симку	2	update through import_export	9	1
1865	2018-12-25 11:34:49.776784+00	548	Был зарегестрирован с первого своего телефона и забыл логин пароль. Зарегестрировал с второго телефона и не могу вывести средства. Пишут что на ваши данные зарегестрирован другой логин. Что делать. Во	2	update through import_export	9	1
1866	2018-12-25 11:34:49.778236+00	549	Можно ли зарегистрироваться зарегаться заново если забыл пароль заблокируют или нет	2	update through import_export	9	1
1867	2018-12-25 11:34:49.780013+00	550	Что делать если забыл пароль можно ли пройти регистрацию заново	2	update through import_export	9	1
1868	2018-12-25 11:34:49.781588+00	551	Забыл пароль к своему счету. Могу ли я пройти регистрацию заново, станет ли это поводом для конторы заблокировать мой счет?	2	update through import_export	9	1
1869	2018-12-25 11:34:49.783071+00	552	Как относится бк леон 1хбет марафон легалбет лига ставок к догонам?	2	update through import_export	9	1
1870	2018-12-25 11:34:49.784658+00	553	Какие конторы блокируют за догоны? Банят ли за это, нарушает ли это правила игры?	2	update through import_export	9	1
1871	2018-12-25 11:34:49.786293+00	554	Могут ли меня заблокировать за догоны	2	update through import_export	9	1
1872	2018-12-25 11:34:49.787846+00	555	Как относиться бк марафон к догонам?	2	update through import_export	9	1
1873	2018-12-25 11:34:49.789481+00	556	Если я стабильно выигрываю в бк, могут ли меня забанить или порезать максимумы?	2	update through import_export	9	1
1874	2018-12-25 11:34:49.790924+00	557	Несколько аккаунтов в разных бк букмекерских конторах, могут ли мне порезать максимумы или заблокировать, забанить? Если я стабильно выигрываю. Считается ли это спекуляцией?	2	update through import_export	9	1
1875	2018-12-25 11:34:49.792306+00	558	Стабильный выигрыш это спекуляция? Могут заблокировать?	2	update through import_export	9	1
1876	2018-12-25 11:34:49.793737+00	559	У меня есть счета во многих БК. стабильно выигрывать, какова вероятность что мне порежут максимумы? Считается ли стабильный выигрыш спекуляцией???	2	update through import_export	9	1
1877	2018-12-25 11:34:49.795197+00	560	За что режут максимумы	2	update through import_export	9	1
1878	2018-12-25 11:34:49.796727+00	561	порезка счетов, что это и почему	2	update through import_export	9	1
1879	2018-12-25 11:34:49.798103+00	562	Почему порезали максимумы, что это вообще такое, что за ограничение	2	update through import_export	9	1
1880	2018-12-25 11:34:49.799643+00	563	Почему понизили максимумы на сумму ставки? Что с этим можно сделать?	2	update through import_export	9	1
1881	2018-12-25 11:34:49.801166+00	564	как я могу поднять свои лимиты?	2	update through import_export	9	1
1882	2018-12-25 11:34:49.802593+00	565	мне снизили максимумы, как повысить их обратно	2	update through import_export	9	1
1883	2018-12-25 11:34:49.804332+00	566	хочу поднять лимиты, как это сделать	2	update through import_export	9	1
1884	2018-12-25 11:34:49.806096+00	567	Как поднять лимиты в лайве?	2	update through import_export	9	1
1885	2018-12-25 11:34:49.807843+00	568	я играю на вилках, чего опасаться?	2	update through import_export	9	1
1886	2018-12-25 11:34:49.809743+00	569	как можно выигрывать на вилках?	2	update through import_export	9	1
1887	2018-12-25 11:34:49.811233+00	570	вилочники законны или нет?	2	update through import_export	9	1
1888	2018-12-25 11:34:49.812625+00	571	Не могу играть, порезаны ставки. Порезаны максимумы. Могу ставить только маленькие суммы. Что делать?	2	update through import_export	9	1
1889	2018-12-25 11:34:49.814032+00	572	ЧТо делать если не могу поставить нормальные ставки?	2	update through import_export	9	1
1890	2018-12-25 11:34:49.815813+00	573	Что делать если режут максимумы	2	update through import_export	9	1
1891	2018-12-25 11:34:49.817479+00	574	Не могу поставить ни одной ставки, т.к. порезаны максимумы....даже тупо беру любой попавшийся прогноз с кэф 34 и то там максимально возможная сумма ставки 1 р.	2	update through import_export	9	1
1892	2018-12-25 11:34:49.819055+00	575	Как играть антиэкспресс? что это такое?	2	update through import_export	9	1
1893	2018-12-25 11:34:49.820561+00	576	Что такое антиэкспресс	2	update through import_export	9	1
1894	2018-12-25 11:34:49.822006+00	577	СЛышал про антиэкспресс, расскажите что это	2	update through import_export	9	1
1895	2018-12-25 11:34:49.823494+00	578	Скажите как правильно играет антиэкспресс?	2	update through import_export	9	1
1896	2018-12-25 11:34:49.82494+00	579	Коридор - что это такое? 	2	update through import_export	9	1
1897	2018-12-25 11:34:49.826525+00	580	Коридорщики это кто такие?	2	update through import_export	9	1
1898	2018-12-25 11:34:49.828089+00	581	Что значит фора -0,25, +0,75, -1,25	2	update through import_export	9	1
1899	2018-12-25 11:34:49.829576+00	582	как рассчитать азиатсую фору  +0,25, -0,75, +1,25	2	update through import_export	9	1
1900	2018-12-25 11:34:49.830878+00	583	Сделал две ставки с одним исходом. Так можно? Могут ли наказать?	2	update through import_export	9	1
1901	2018-12-25 11:34:49.832261+00	584	Может ли бк заблокировать или как то наказать за ординар с одним и тем же исходом несколько раз?	2	update through import_export	9	1
1902	2018-12-25 11:34:49.83354+00	585	Могут ли заблокировать за одинаковый ординар?	2	update through import_export	9	1
1903	2018-12-25 11:34:49.834771+00	586	Можно ли несколько раз поставить одну и ту же ставку? На одинаковый исход. Ординарами например	2	update through import_export	9	1
1904	2018-12-25 11:34:49.836149+00	587	Можно ли ставить несколько раз на один и тот же исход (ординарами)?	2	update through import_export	9	1
1905	2018-12-25 11:34:49.837511+00	588	Можно ли пользоваться киви для вывода? В каких можно?	2	update through import_export	9	1
1906	2018-12-25 11:34:49.838817+00	589	КИви-кошелек. можно через него выводить деньги и где?	2	update through import_export	9	1
1907	2018-12-25 11:34:49.84026+00	590	Можно ли использовать QIWI-кошелек для вывода средств в зарубежных БК?	2	update through import_export	9	1
1908	2018-12-25 11:34:49.841665+00	591	ПРоблемы с киви	2	update through import_export	9	1
1909	2018-12-25 11:34:49.84298+00	592	есть проблемы с выводом на QIWI	2	update through import_export	9	1
1910	2018-12-25 11:34:49.844366+00	593	Утеряна симка, но доступ к киви-кошельку остался. При переводе денежных средств приложение постоянно запрашивает подтверждение по смс-номеру кошелька. Как быть? Восстановлению сим-карта не подлежит, и	2	update through import_export	9	1
1911	2018-12-25 11:34:49.845795+00	594	Не могу войти в аккаунт бк что делать	2	update through import_export	9	1
1912	2018-12-25 11:34:49.847182+00	595	Нельзя делать ставку не могу ставить заблокировали что делать	2	update through import_export	9	1
1913	2018-12-25 11:34:49.848568+00	596	Не могу войти на аккаунт причина: "Нельзя делать ставки и пополнять баланс". Как решить эту проблему?	2	update through import_export	9	1
1914	2018-12-25 11:34:49.850013+00	597	Что за категория нежелательных клиентов?	2	update through import_export	9	1
1915	2018-12-25 11:34:49.851414+00	598	Что такое нежелательные клиенты? Заблокировали, но дали вывести деньги.	2	update through import_export	9	1
1916	2018-12-25 11:34:49.852857+00	599	Букмекерская компания заблокировала мой счет, предварительно дав вывести баланс. Почему?	2	update through import_export	9	1
1917	2018-12-25 11:34:49.854324+00	600	ошибка 32 что значит	2	update through import_export	9	1
1918	2018-12-25 11:34:49.855885+00	601	что за ошибка 32	2	update through import_export	9	1
1919	2018-12-25 11:34:49.857208+00	602	почему при входе в фонбет выскакивает ошибка 32	2	update through import_export	9	1
1920	2018-12-25 11:34:49.858566+00	603	все сделал но не получил бонус что делать	2	update through import_export	9	1
1921	2018-12-25 11:34:49.859808+00	604	не дали бонус хоть все условия акции сделал, что делать	2	update through import_export	9	1
1922	2018-12-25 11:34:49.861113+00	605	что делать если не начислили бонус, условия выполнены	2	update through import_export	9	1
1923	2018-12-25 11:34:49.862456+00	606	Я выполнил все условия промоакции, но не получил автоматически начисляемый бонус. Что делать?	2	update through import_export	9	1
1924	2018-12-25 11:34:49.86385+00	607	За что бк может меня заблокировать забанить?	2	update through import_export	9	1
1925	2018-12-25 11:34:49.865234+00	608	За что обычно блокируют букмекерские конторы?	2	update through import_export	9	1
1926	2018-12-25 11:34:49.866663+00	609	Почему делают блок букмекеры?	2	update through import_export	9	1
1927	2018-12-25 11:34:49.868079+00	610	За что могут заблокировать счет в БК	2	update through import_export	9	1
1928	2018-12-25 11:34:49.869702+00	611	За что мой счет в БК может быть заблокирован?	2	update through import_export	9	1
1929	2018-12-25 11:34:49.871271+00	612	Как делать ставки?	2	update through import_export	9	1
1930	2018-12-25 11:34:49.872906+00	613	Хочу начать играть. Как это сделать? с чего начать? как зарегистрироваться в бк?	2	update through import_export	9	1
1931	2018-12-25 11:34:49.874574+00	614	Хочу сделать ставку, как зарегаться у букмекера	2	update through import_export	9	1
1932	2018-12-25 11:34:49.876023+00	615	Как начать играть, как пополнить счет. что делать?	2	update through import_export	9	1
1933	2018-12-25 11:34:49.877565+00	616	как пополнить счет и как делать ставки?	2	update through import_export	9	1
1934	2018-12-25 11:34:49.878926+00	617	Забыл свой айдишник, айди, что делать чтобы его восстановить?	2	update through import_export	9	1
1935	2018-12-25 11:34:49.880351+00	618	Как можно восстановить айди? Id, я забыл его	2	update through import_export	9	1
1936	2018-12-25 11:34:49.881908+00	619	Забыл свой ID, что делать?	2	update through import_export	9	1
1937	2018-12-25 11:34:49.88329+00	620	Забыл пароль 	2	update through import_export	9	1
1938	2018-12-25 11:34:49.885035+00	621	Есть ли новая информация о законах по ставкам	2	update through import_export	9	1
1939	2018-12-25 11:34:49.886872+00	622	Когда будет материал о ставках	2	update through import_export	9	1
1940	2018-12-25 11:34:49.889396+00	623	Когда будет обещаный конкурс	2	update through import_export	9	1
1941	2018-12-25 11:34:49.891247+00	624	подскажите пожалуйста планируются какие нибудь конкурсы на сайте?))	2	update through import_export	9	1
1942	2018-12-25 11:34:49.892895+00	625	нужны рекомендаций советы стратегий-относительно команд(ы) (включая саму игру) имеет ли значение опыт - из чего исходить именно ???	2	update through import_export	9	1
1943	2018-12-25 11:34:49.894468+00	626	Когда стартует анонсированный в новогоднем поздравлении конкурс на 1.5 млн рублей?	2	update through import_export	9	1
1944	2018-12-25 11:34:49.895873+00	627	Посоветуйте русскоязычную БК, служба поддержки на русском языке	2	update through import_export	9	1
1945	2018-12-25 11:34:49.897337+00	628	Какие букмекеры используют русский язык?	2	update through import_export	9	1
1946	2018-12-25 11:34:49.898661+00	629	какие букмекеры принимают ставки на киберспорт?	2	update through import_export	9	1
1947	2018-12-25 11:34:49.900188+00	630	где я могу поставить на киберспорт, в какой БК?	2	update through import_export	9	1
1948	2018-12-25 11:34:49.901667+00	631	Какие букмекеры легальные в России?	2	update through import_export	9	1
1949	2018-12-25 11:34:49.903187+00	632	Хочу играть в легальных БК, из каких выбирать? 	2	update through import_export	9	1
1950	2018-12-25 11:34:49.904742+00	633	Дайте промокод для регистрации	2	update through import_export	9	1
1951	2018-12-25 11:34:49.906398+00	634	Какие есть бонусы в БК?	2	update through import_export	9	1
1952	2018-12-25 11:34:49.907995+00	635	Есть фрибеты для регистрации?	2	update through import_export	9	1
1953	2018-12-25 11:34:49.909793+00	636	Какие акции сейчас в букмекеских конторах?	2	update through import_export	9	1
1954	2018-12-25 11:34:49.911615+00	637	Где можно посмотреть статистику команд?	2	update through import_export	9	1
1955	2018-12-25 11:34:49.913291+00	638	Где найти статистику чемпионата?	2	update through import_export	9	1
1956	2018-12-25 11:34:49.914833+00	639	Где узнать результаты футбольных матчей?	2	update through import_export	9	1
1957	2018-12-25 11:34:49.916228+00	640	Как посмотреть историю изменений коэффициентов?	2	update through import_export	9	1
1958	2018-12-25 11:34:49.917482+00	641	Какие прогнозы на матч Бавария - Боруссия?	2	update through import_export	9	1
1959	2018-12-25 11:34:49.918889+00	642	Есть мысли по ставкам на игру Арсенал - Ливерпуль?	2	update through import_export	9	1
1960	2018-12-25 11:34:49.920571+00	643	Посоветуйте литературу, книги по ставкам, стратегии ставок	2	update through import_export	9	1
1961	2018-12-25 11:34:49.922243+00	644	Есть какие-то издания, материалы для начинающих капперов, прогнозистов	2	update through import_export	9	1
1962	2018-12-25 11:34:49.923672+00	645	Что такое тотал, фора?	2	update through import_export	9	1
1963	2018-12-25 11:34:49.925067+00	646	Учебники по беттингу, где найти?	2	update through import_export	9	1
1964	2018-12-25 11:34:49.926657+00	647	Что такое маржа?	2	update through import_export	9	1
1965	2018-12-25 11:34:49.928174+00	648	Все пишут о марже, а что это?	2	update through import_export	9	1
1966	2018-12-25 11:34:49.92951+00	649	Как определить маржу букмекера?	2	update through import_export	9	1
1967	2018-12-25 11:34:49.9312+00	650	Что еще за система, как это?	2	update through import_export	9	1
1968	2018-12-25 11:34:49.932895+00	651	Как правильно посчитать прибыль по системе?	2	update through import_export	9	1
1969	2018-12-25 11:34:49.934728+00	652	Вконтакте предлагают договорные матчи, это развод?	2	update through import_export	9	1
1970	2018-12-25 11:34:49.936566+00	653	Купил точный счет договорного матча, но ставка не сыграла	2	update through import_export	9	1
1971	2018-12-25 11:34:49.938247+00	654	Мне предлагают архивированный файл на почту	2	update through import_export	9	1
1972	2018-12-25 11:34:49.939877+00	655	Раскрутка счета, гарантированные прогнозы, 100% прибыль	2	update through import_export	9	1
1973	2018-12-25 11:34:49.941625+00	656	Что такое Первая СРО, для чего она?	2	update through import_export	9	1
1974	2018-12-25 11:34:49.943209+00	657	Зачем нужна СРО Букмекеров?	2	update through import_export	9	1
1975	2018-12-25 11:34:49.944655+00	658	Есть зарубежный аналог Рейтинга букмекеров?	1	new through import_export	9	1
1976	2018-12-25 11:34:49.946106+00	659	Есть еще что-то воде рейтинга букмекеров?	1	new through import_export	9	1
1977	2018-12-25 11:34:49.94756+00	660	Для чего нужны сканеры вилок?	1	new through import_export	9	1
1978	2018-12-25 11:34:49.948877+00	661	Сканер вилок, что это такое? 	1	new through import_export	9	1
1979	2018-12-25 11:34:49.950407+00	662	Что такое мультиаккаунтинг?	1	new through import_export	9	1
1980	2018-12-25 11:34:49.952001+00	663	Мультиаккаунтинг, это что и как избежать? 	1	new through import_export	9	1
1981	2018-12-25 11:34:49.953482+00	664	Что такое верификация?	1	new through import_export	9	1
1982	2018-12-25 11:34:49.954866+00	665	Для чего нужна верификация?	1	new through import_export	9	1
1983	2018-12-25 11:34:49.95629+00	666	Срочно понижайте оценку букмекера	1	new through import_export	9	1
1984	2018-12-25 11:34:49.957635+00	667	Переносите БК в черный список, они не реагируют на жалобы	1	new through import_export	9	1
1985	2018-12-25 11:34:49.959081+00	668	Почему вы не снижаете рейтинг букмекера	1	new through import_export	9	1
1986	2018-12-25 11:34:49.960547+00	669	Вам платят за рейтинг? Срочно понижайте рейтинг!	1	new through import_export	9	1
1987	2018-12-25 11:34:49.961919+00	670	В каком банке(РФ) в случае перевода крупной суммы на кредитную карту будет меньше проблем с получением этих денег?Если будут проблемы, то какие?	1	new through import_export	9	1
1988	2018-12-25 11:34:49.9633+00	671	Сбербанк заблокировал перевод зарубежного букмекера.	1	new through import_export	9	1
1989	2018-12-25 11:34:49.964592+00	672	Нашел в правилах промоакции букмекерской конторы следующее: мы оставляем за собой право отменять данное предложение либо изменять любые из его правил и условий в любое время без уведомлений или объясн	2	update through import_export	9	1
1990	2018-12-25 11:34:49.965917+00	673	Для верификации адреса в зарубежных платежных системах обязательно иметь квитанцию за коммунальные платежи с адресом, совпадающим с пропиской?	1	new through import_export	9	1
1991	2018-12-25 11:34:49.967271+00	674	Есть ли минимумы у скрилл	1	new through import_export	9	1
1992	2018-12-25 11:34:49.968581+00	675	Какой миним у Skrill	2	update through import_export	9	1
1993	2018-12-25 11:34:49.970018+00	676	Какой минимум на депозит и на вывод в Skrill?	2	update through import_export	9	1
1994	2018-12-25 11:34:49.971358+00	677	Что нужно для получения VIP-статуса в Skrill?	1	new through import_export	9	1
1995	2018-12-25 11:34:49.97266+00	678	Где лучше всего получать лайв стату статистику	2	update through import_export	9	1
1996	2018-12-25 11:34:49.973952+00	679	Как букмекеры получают лайв статистику	1	new through import_export	9	1
1997	2018-12-25 11:34:49.975293+00	680	Где букмекеры берут live статистику? есть ли такие сайты с live статистикой более быстрые и точные чем myscore и тому подобные? спасибо	1	new through import_export	9	1
1998	2018-12-25 11:34:49.976671+00	681	То, что в РФ блокируют сайты, не означает что они запрещены?	2	update through import_export	9	1
1999	2018-12-25 11:34:49.977978+00	682	на территории РФ блокируют всех букмекеров или только избранных?	2	update through import_export	9	1
2000	2018-12-25 11:34:49.979268+00	683	Наткнулся на контору Olimp-smart. Есть и в инстаграмме и в интернете есть сайт. предлагают хорошие условия. Можно ли доверять этой конторе?	2	update through import_export	9	1
2001	2018-12-25 11:34:49.980638+00	684	Является ли банковский перевод моментальным?	1	new through import_export	9	1
2002	2018-12-25 11:34:49.981917+00	685	Как долго идут деньги с вебмани, сколько ждать	2	update through import_export	9	1
2003	2018-12-25 11:34:49.983276+00	686	Как долго ждать перевода на Webmoney из букмекерской конторы?	2	update through import_export	9	1
2004	2018-12-25 11:34:49.98467+00	687	Пойдет ли Visa Electron для ввода и вывода средств в БК?	2	update through import_export	9	1
2005	2018-12-25 11:34:49.986163+00	688	Ало! Логин и пароль все на листочки, заходил все норм было,сейчас пишет Неверный пароль или Логин!200 что делать?	2	update through import_export	9	1
2006	2018-12-25 11:34:49.987618+00	689	10 раз уже вводил, но пишет неверный пароль	2	update through import_export	9	1
2007	2018-12-25 11:34:49.989336+00	690	ставил лайв, но гол забили после того, как я поставил ставку	2	update through import_export	9	1
2008	2018-12-25 11:34:49.990816+00	691	Вернут ли ставку, если счет в лайве был неправильным, а я проиграл, сделав ставку?	1	new through import_export	9	1
2009	2018-12-25 11:34:49.992379+00	692	Для верификации адреса в платежной системе нужна банковская выписка по переводу именно в ту систему, в которой я прохожу проверку личности?	1	new through import_export	9	1
2010	2018-12-25 11:34:49.993793+00	693	Нужно ли при регистрации в зарубежных БК переводить паспортные данные?	1	new through import_export	9	1
2011	2018-12-25 11:34:49.99502+00	694	Пользуюсь вашим сайтом. Но с мобильного телефона немного неудобно. Хотелось бы иметь приложение на Android?. Если оно есть. И если его нет, то будете ли вы его создавать?	1	new through import_export	9	1
2012	2018-12-25 11:34:49.996397+00	695	Есть ли мобильное приложение Вашего сайта для устройств на Andriod?	2	update through import_export	9	1
2013	2018-12-25 11:34:49.997983+00	696	Есть ли приложение ios для РБ	1	new through import_export	9	1
2014	2018-12-25 11:34:49.999435+00	697	Уменя apple, ifone, есть приложение рейтинга букмекеов?	1	new through import_export	9	1
2015	2018-12-25 11:34:50.001149+00	698	По логике раз бк не зарегистрирована на тер.РФ и нет контроля, то платить налог должна бк и если ваш банк заблокировал счет, то им достаточно дать понять, что это не финансирование терроризма или отмы	1	new through import_export	9	1
2016	2018-12-25 11:34:50.002616+00	699	Нужно ли платить налог за игру в зарубежных БК	1	new through import_export	9	1
2017	2018-12-25 11:34:50.004197+00	700	Играю в офшорной, нелегальной БК, платить налог?	2	update through import_export	9	1
2018	2018-12-25 11:34:50.005863+00	701	Платить ли налог, если играешь у зарубежного букмекера?	2	update through import_export	9	1
2019	2018-12-25 11:34:50.007342+00	702	Добрый день, подскажите БК в которой дают фиксированные коэффициенты на лошадиные скачки в США, надёжного и принимающего игроков из РФ.	2	update through import_export	9	1
2020	2018-12-25 11:34:50.008879+00	703	Где можно поставить на лошадиный скачки?	2	update through import_export	9	1
2021	2018-12-25 11:34:50.010339+00	704	Здравствуйте подскажите пожалуйста , сколько выводятся деньги с конторы на банковскую карту мастер карт.	2	update through import_export	9	1
2022	2018-12-25 11:34:50.011989+00	705	Почему топ капперы сайта дают столько минусов? Они делают специально чтоб люди заходили в минус?	2	update through import_export	9	1
2023	2018-12-25 11:34:50.013627+00	706	Ваши эксперты специально работают на контору, давая неправильный результат?	2	update through import_export	9	1
2024	2018-12-25 11:34:50.015583+00	707	Сколько букмекеры платят вашим экспертам?	2	update through import_export	9	1
2025	2018-12-25 11:34:50.017282+00	708	ставка: какой игрок гол. например я взял какой то игрок забьет гол, но этот игрок не вышел в составе и на замену тоже. это считается ВОЗВРАТ или ПРОИГРЫШ?	2	update through import_export	9	1
2026	2018-12-25 11:34:50.018654+00	709	поставил что забьет полузащитник, но рассчитали проигрышем	2	update through import_export	9	1
2027	2018-12-25 11:34:50.02017+00	710	Тычет мне на какой-то пункт правил	2	update through import_export	9	1
2028	2018-12-25 11:34:50.021561+00	711	поставил на основное время матча, но ставка рассчитана с дополнительный таймом	2	update through import_export	9	1
2029	2018-12-25 11:34:50.022905+00	712	Какие конторы посоветуете для игры в лайве, онлайн?	2	update through import_export	9	1
2030	2018-12-25 11:34:50.024281+00	713	Какая БК дает широкую линий на live?	1	new through import_export	9	1
2031	2018-12-25 11:34:50.025653+00	714	Самый крутой букмекер в прематче?	2	update through import_export	9	1
2032	2018-12-25 11:34:50.027078+00	715	У какой БК самая широкая роспись, линия?	2	update through import_export	9	1
2033	2018-12-25 11:34:50.028494+00	716	у вас неправильный рейтинг, он должен основываться на мнении игроков	2	update through import_export	9	1
2034	2018-12-25 11:34:50.029869+00	717	почему при составлении рейтинга не обращают внимание на мнение людей?	2	update through import_export	9	1
2035	2018-12-25 11:34:50.031194+00	718	Посоветуйте пожалуйста хорошего каппера с которым можно поднять банк.	2	update through import_export	9	1
2036	2018-12-25 11:34:50.032715+00	719	Какой каппер имеют лучшую проходимость ставок?	1	new through import_export	9	1
2037	2018-12-25 11:34:50.034337+00	720	Разрешено ли регистрироваться и играть в нескольких букмекерских конторах?	2	update through import_export	9	1
2038	2018-12-25 11:34:50.035773+00	721	можно регистриовать сразу в трех, четырех БК?	2	update through import_export	9	1
2039	2018-12-25 11:34:50.037058+00	722	Что грозит вилочнику, если БК вычислит игру на вилках?	2	update through import_export	9	1
2040	2018-12-25 11:34:50.038372+00	723	что будет за игру на вилках?	2	update through import_export	9	1
2041	2018-12-25 11:34:50.039931+00	724	Я могу ограничить себя от комментариев и прочего вообще появления на мои глаза одного человека ?	2	update through import_export	9	1
2042	2018-12-25 11:34:50.041553+00	725	Играю в международной конторе, не верифицировал счёт. Надёжно ли это?	2	update through import_export	9	1
2043	2018-12-25 11:34:50.043088+00	726	На эл.почту не приходят прогнозы	2	update through import_export	9	1
2044	2018-12-25 11:34:50.044753+00	727	Почему, когда я пишу комментарии будучи авторизованным под данным профилем, они публикуются от имени другого профиля?	2	update through import_export	9	1
2045	2018-12-25 11:34:50.046435+00	728	Как быть, если для общения со службой поддержки БК требуется знание английского языка, а я им не владею?	2	update through import_export	9	1
2046	2018-12-25 11:34:50.04836+00	729	В какой букмекерской конторе можно делать ставки в mlb именно на победу питчера, а не на победу команды ?	2	update through import_export	9	1
2047	2018-12-25 11:34:50.050278+00	730	Если верификаторы, которые ведут статистику по лайв-ставкам?	2	update through import_export	9	1
2048	2018-12-25 11:34:50.052249+00	731	Есть ли сайты с помощью которых можно вычислять верояность?? Например, где есть поля для ввода предпологаемых значений, а автоматом выдает вероятностью	2	update through import_export	9	1
2049	2018-12-25 11:34:50.053647+00	732	Я хочу изменить свой электронный кошелек, чтобы сделать вывод деньги. Номер моего игрового счета 2732557 , мой электронный кошелек(qiwi) +77087489341 , хочу изменить на +77072611996 . Заранее спасибо,	2	update through import_export	9	1
2050	2018-12-25 11:34:50.055026+00	733	Скажите пожалуйста почему в БК Betcity прямая красная карточка не рассчитывается как две ЖК, и более того вторая ЖК повлёкшая за собой красную карточку тоже не считается в общий Тотал ЖК?	2	update through import_export	9	1
2051	2018-12-25 11:34:50.05648+00	734	Ищу информационные порталы, посвященные лигам английского футбола начиная от Чемпионшипа (про АПЛ пишут везде и много). Подскажите, если у вас есть подобные.	1	new through import_export	9	1
2052	2018-12-25 11:34:50.05791+00	735	С помощью Вашего сайта хотел перейти на сайт БК Пиннакл,с удивлением для меня был перенаправлен на 1хбет,это что сработала партнерская программа с этим букмекером?	1	new through import_export	9	1
2053	2018-12-25 11:34:50.059435+00	736	Мой фактический адрес проживания отличается от прописки в паспорте. Какой мне адрес указывать	1	new through import_export	9	1
2054	2018-12-25 11:34:50.060785+00	737	Помогите решить проблему, на ФобетКлиент (Программа для Windows) постоянное подключение на сервер.	2	update through import_export	9	1
2055	2018-12-25 11:34:50.062308+00	738	По правилам необходимо именно зарегистрироваться, т.е вход через соц сети не считается регистрацией?	2	update through import_export	9	1
2056	2018-12-25 11:34:50.063784+00	739	Добрый день, хочу уточнить если я положил на счет например 3 тыс рублей, 1 тыс проиграл, могу ли я вывести эти деньги обратно? Фонбет	2	update through import_export	9	1
2057	2018-12-25 11:34:50.06526+00	740	Какие документы потребуются для прохождения верификации в платежной системе Skrill? Можно ли отослать цифровые фото документов вместо сканированных копий?	2	update through import_export	9	1
2058	2018-12-25 11:34:50.066611+00	741	Какие конторы предлагают бонус? А бонус для России?	2	update through import_export	9	1
2059	2018-12-25 11:34:50.067908+00	742	Добрый день. Закидывал день с помощью MasterCard, списали со счета почти 3 бакса за верификацию. Их вообще вернут обратно? Конечно я лопух, ведь вывести деньги можно только на Visa и банковский счет.	2	update through import_export	9	1
2060	2018-12-25 11:34:50.069411+00	743	не могу зайди на сайт 1xbet хочу снять деньги , захожу на сайт 1xставка ввожу свои данные пишут не правильные что делать ?	2	update through import_export	9	1
2061	2018-12-25 11:34:50.07087+00	744	Какую максимальную ставку я могу сделать на тот или иной исход (событие)?	2	update through import_export	9	1
2062	2018-12-25 11:34:50.072465+00	745	обьясните пожалуйста. Бк дает кф на точный счет+исход "другое". Что это значит?	2	update through import_export	9	1
2063	2018-12-25 11:34:50.074142+00	746	Как можно положить деньги на Skrill?	2	update through import_export	9	1
2064	2018-12-25 11:34:50.075911+00	747	Зарегистрировал 3 аккаунта на одну карту в БК Winline! Все заблокировали!	1	new through import_export	9	1
2065	2018-12-25 11:34:50.077621+00	748	Что такое биржа ставок и чем она отличается?	1	new through import_export	9	1
2066	2018-12-25 11:34:50.079398+00	749	Какие есть биржи ставок, что посоветуете?	1	new through import_export	9	1
2067	2018-12-25 11:34:50.081029+00	750	Как дела?	1	new through import_export	9	1
2068	2018-12-25 11:34:50.082645+00	751	привет как дела	1	new through import_export	9	1
2069	2018-12-25 11:34:50.084344+00	752	ты кто такой	1	new through import_export	9	1
2070	2018-12-25 11:34:50.08604+00	753	как настроение?	1	new through import_export	9	1
2071	2018-12-25 11:34:50.087755+00	754	как ты?	1	new through import_export	9	1
2072	2018-12-25 11:34:50.089424+00	755	ах ты пидор	1	new through import_export	9	1
2073	2018-12-25 11:34:50.090913+00	756	мудила ебаная	1	new through import_export	9	1
2074	2018-12-25 11:34:50.092334+00	757	пидорас обоссаный 	1	new through import_export	9	1
2075	2018-12-25 11:34:50.093764+00	758	блядь ебись ты	1	new through import_export	9	1
2076	2018-12-25 11:34:50.095286+00	759	иди нахуй	1	new through import_export	9	1
2077	2018-12-25 11:34:50.096983+00	760	сука блядь	1	new through import_export	9	1
2078	2018-12-25 11:34:50.098648+00	761	застрелите ваших программистов	1	new through import_export	9	1
2079	2018-12-25 11:34:50.100406+00	762	РБ мошенники и уроды	1	new through import_export	9	1
2080	2018-12-25 11:34:50.101955+00	763	скоты продажные, чтоб вы сдохли	1	new through import_export	9	1
2081	2018-12-25 11:35:08.673502+00	0	Зайдите в свой профиль и нажмите на вкладку "Дать прогноз" или перейдите по ссылке: https://bookmaker-ratings.ru/tribune/add-tip/	2	update through import_export	8	1
2082	2018-12-25 11:35:08.676086+00	1	Зайдите в свой профиль и нажмите на вкладку "Дать прогноз" или перейдите по ссылке: https://bookmaker-ratings.ru/tribune/add-tip/	2	update through import_export	8	1
2083	2018-12-25 11:35:08.678259+00	2	Зайдите в свой профиль и нажмите на вкладку "Дать прогноз" или перейдите по ссылке: https://bookmaker-ratings.ru/tribune/add-tip/	2	update through import_export	8	1
2084	2018-12-25 11:35:08.680682+00	3	Зайдите в свой профиль и нажмите на вкладку "Дать прогноз" или перейдите по ссылке: https://bookmaker-ratings.ru/tribune/add-tip/	2	update through import_export	8	1
2085	2018-12-25 11:35:08.682557+00	4	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2086	2018-12-25 11:35:08.684238+00	5	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2087	2018-12-25 11:35:08.686152+00	6	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2088	2018-12-25 11:35:08.6883+00	7	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2089	2018-12-25 11:35:08.689668+00	8	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2090	2018-12-25 11:35:08.690946+00	9	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2091	2018-12-25 11:35:08.692453+00	10	Условная сумма каждой ставки — 1000 рублей. Подробнее: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
2092	2018-12-25 11:35:08.693953+00	11	Условная сумма каждой ставки — 1000 рублей. Подробнее: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
2093	2018-12-25 11:35:08.695523+00	12	Условная сумма каждой ставки — 1000 рублей. Подробнее: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
2094	2018-12-25 11:35:08.697671+00	13	Вы можете разместить не более трёх ставок в одном материале. 	2	update through import_export	8	1
2095	2018-12-25 11:35:08.699339+00	14	Вы можете разместить не более трёх ставок в одном материале. 	2	update through import_export	8	1
2096	2018-12-25 11:35:08.70087+00	15	Вы можете разместить не более трёх ставок в одном материале. 	2	update through import_export	8	1
2097	2018-12-25 11:35:08.702393+00	16	Вы можете разместить не более трёх ставок в одном материале. 	2	update through import_export	8	1
2098	2018-12-25 11:35:08.704169+00	17	Вы можете добавить видео к описанию прогноза, вставив ссылку в соответствующее поле. В описании вашего видео на Youtube обязательно должна быть ссылка на «Рейтинг Букмекеров». Текстовая часть прогноза	2	update through import_export	8	1
2099	2018-12-25 11:35:08.706035+00	18	Вы можете добавить видео к описанию прогноза, вставив ссылку в соответствующее поле. В описании вашего видео на Youtube обязательно должна быть ссылка на «Рейтинг Букмекеров». Текстовая часть прогноза	2	update through import_export	8	1
2100	2018-12-25 11:35:08.708009+00	19	Вы можете добавить видео к описанию прогноза, вставив ссылку в соответствующее поле. В описании вашего видео на Youtube обязательно должна быть ссылка на «Рейтинг Букмекеров». Текстовая часть прогноза	2	update through import_export	8	1
2101	2018-12-25 11:35:08.709711+00	20	Вы можете добавить видео к описанию прогноза, вставив ссылку в соответствующее поле. В описании вашего видео на Youtube обязательно должна быть ссылка на «Рейтинг Букмекеров». Текстовая часть прогноза	2	update through import_export	8	1
2102	2018-12-25 11:35:08.711533+00	21	При публикации прогноза в поле "Тип ставки" необходимо выбрать "Экспресс". Затем нужно добавить необходимое количество исходов, нажав кнопку "Добавить событие".	2	update through import_export	8	1
2103	2018-12-25 11:35:08.713364+00	22	При публикации прогноза в поле "Тип ставки" необходимо выбрать "Экспресс". Затем нужно добавить необходимое количество исходов, нажав кнопку "Добавить событие".	2	update through import_export	8	1
2104	2018-12-25 11:35:08.715202+00	23	Напишите, пожалуйста, нам на почту (support@bookmaker-ratings.ru), указав названия команд. Также Вы можете выбрать вид спорта "Другие" и самостоятельноо заполнить все поля прогноза.	2	update through import_export	8	1
2105	2018-12-25 11:35:08.716764+00	24	Напишите, пожалуйста, нам на почту (support@bookmaker-ratings.ru), указав названия команд. Также Вы можете выбрать вид спорта "Другие" и самостоятельноо заполнить все поля прогноза.	2	update through import_export	8	1
2106	2018-12-25 11:35:08.718675+00	25	Картинка должна иметь отношение к событию в прогнозе. Идеальные параметры — 760?480 или хотя бы что-то около того.	2	update through import_export	8	1
2107	2018-12-25 11:35:08.720916+00	26	Картинка должна иметь отношение к событию в прогнозе. Идеальные параметры — 760?480 или хотя бы что-то около того.	2	update through import_export	8	1
2108	2018-12-25 11:35:08.723087+00	27	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2109	2018-12-25 11:35:08.725085+00	28	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2110	2018-12-25 11:35:08.727213+00	29	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2111	2018-12-25 11:35:08.729863+00	30	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2112	2018-12-25 11:35:08.731862+00	31	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2113	2018-12-25 11:35:08.733861+00	32	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2114	2018-12-25 11:35:08.735767+00	33	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2115	2018-12-25 11:35:08.737556+00	34	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2116	2018-12-25 11:35:08.739614+00	35	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2117	2018-12-25 11:35:08.741948+00	36	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2118	2018-12-25 11:35:08.74425+00	37	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2119	2018-12-25 11:35:08.746613+00	38	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2120	2018-12-25 11:35:08.748611+00	39	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2121	2018-12-25 11:35:08.750541+00	40	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2122	2018-12-25 11:35:08.752467+00	41	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2123	2018-12-25 11:35:08.754464+00	42	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2124	2018-12-25 11:35:08.756432+00	43	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2125	2018-12-25 11:35:08.75821+00	44	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2126	2018-12-25 11:35:08.759954+00	45	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2127	2018-12-25 11:35:08.761687+00	46	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2128	2018-12-25 11:35:08.763331+00	47	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2129	2018-12-25 11:35:08.765077+00	48	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2130	2018-12-25 11:35:08.76671+00	49	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2131	2018-12-25 11:35:08.769155+00	50	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2132	2018-12-25 11:35:08.770948+00	51	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2133	2018-12-25 11:35:08.77267+00	52	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2134	2018-12-25 11:35:08.774438+00	53	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2135	2018-12-25 11:35:08.776301+00	54	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2136	2018-12-25 11:35:08.778029+00	55	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2137	2018-12-25 11:35:08.779626+00	56	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2138	2018-12-25 11:35:08.781222+00	57	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2139	2018-12-25 11:35:08.782701+00	58	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2140	2018-12-25 11:35:08.784365+00	59	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2141	2018-12-25 11:35:08.78595+00	60	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2142	2018-12-25 11:35:08.787568+00	61	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2143	2018-12-25 11:35:08.789176+00	62	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2144	2018-12-25 11:35:08.790697+00	63	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2145	2018-12-25 11:35:08.792925+00	64	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2146	2018-12-25 11:35:08.794944+00	65	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2147	2018-12-25 11:35:08.797079+00	66	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2148	2018-12-25 11:35:08.798784+00	67	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2149	2018-12-25 11:35:08.800505+00	68	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2150	2018-12-25 11:35:08.802042+00	69	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2151	2018-12-25 11:35:08.803671+00	70	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2152	2018-12-25 11:35:08.805605+00	71	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2153	2018-12-25 11:35:08.807312+00	72	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2154	2018-12-25 11:35:08.808896+00	73	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2155	2018-12-25 11:35:08.810638+00	74	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2156	2018-12-25 11:35:08.812633+00	75	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2157	2018-12-25 11:35:08.8143+00	76	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2158	2018-12-25 11:35:08.815983+00	77	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2159	2018-12-25 11:35:08.817736+00	78	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2160	2018-12-25 11:35:08.819461+00	79	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2161	2018-12-25 11:35:08.821054+00	80	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2162	2018-12-25 11:35:08.822673+00	81	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2163	2018-12-25 11:35:08.824423+00	82	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2164	2018-12-25 11:35:08.826083+00	83	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2165	2018-12-25 11:35:08.828023+00	84	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2166	2018-12-25 11:35:08.829691+00	85	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2167	2018-12-25 11:35:08.831443+00	86	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2168	2018-12-25 11:35:08.833005+00	87	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2169	2018-12-25 11:35:08.834481+00	88	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2170	2018-12-25 11:35:08.836205+00	89	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2171	2018-12-25 11:35:08.837869+00	90	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2172	2018-12-25 11:35:08.839487+00	91	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2173	2018-12-25 11:35:08.841122+00	92	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2174	2018-12-25 11:35:08.842776+00	93	 Если Вы принимаете участие в конкурсе, выбор букмекера при размещении прогноза недоступен.	2	update through import_export	8	1
2175	2018-12-25 11:35:08.844454+00	94	 Если Вы принимаете участие в конкурсе, выбор букмекера при размещении прогноза недоступен.	2	update through import_export	8	1
2176	2018-12-25 11:35:08.846229+00	95	 Если Вы принимаете участие в конкурсе, выбор букмекера при размещении прогноза недоступен.	2	update through import_export	8	1
2177	2018-12-25 11:35:08.847762+00	96	Прогнозы на РБ рассчитываются в соответствии с правилами БК, которую вы выбираете при публикации прогноза. Если где-то закралась ошибка, укажите об этом в комментарии к самому прогнозу. 	2	update through import_export	8	1
2178	2018-12-25 11:35:08.84928+00	97	Прогнозы на РБ рассчитываются в соответствии с правилами БК, которую вы выбираете при публикации прогноза. Если где-то закралась ошибка, укажите об этом в комментарии к самому прогнозу. 	2	update through import_export	8	1
2179	2018-12-25 11:35:08.850964+00	98	Пожалуйста, напишите об этом непосредственно в комментариях к прогнозу.	2	update through import_export	8	1
2180	2018-12-25 11:35:08.852477+00	99	Пожалуйста, напишите об этом непосредственно в комментариях к прогнозу.	2	update through import_export	8	1
2181	2018-12-25 11:35:08.853892+00	100	Пожалуйста, напишите об этом непосредственно в комментариях к прогнозу.	2	update through import_export	8	1
2182	2018-12-25 11:35:08.855412+00	101	Пожалуйста, напишите об этом непосредственно в комментариях к прогнозу.	2	update through import_export	8	1
2262	2018-12-25 11:35:09.000411+00	181	При размещении прогноза в выпадающем меню поля "Букмекер" доступны только лучшие зарубежные конторы и БК, имеющие лицензию ФНС.   	2	update through import_export	8	1
2183	2018-12-25 11:35:08.856849+00	102	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
2184	2018-12-25 11:35:08.858589+00	103	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
2185	2018-12-25 11:35:08.860083+00	104	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
2186	2018-12-25 11:35:08.861638+00	105	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
2187	2018-12-25 11:35:08.863064+00	106	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Но если Ваша статистика будет действительно впечатляющей, 	2	update through import_export	8	1
2188	2018-12-25 11:35:08.864566+00	107	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Но если Ваша статистика будет действительно впечатляющей, 	2	update through import_export	8	1
2189	2018-12-25 11:35:08.866149+00	108	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Но если Ваша статистика будет действительно впечатляющей, 	2	update through import_export	8	1
2190	2018-12-25 11:35:08.867878+00	109	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Но если Ваша статистика будет действительно впечатляющей, 	2	update through import_export	8	1
2191	2018-12-25 11:35:08.869898+00	110	Мой профиль, вкладка "Прогнозы".	2	update through import_export	8	1
2192	2018-12-25 11:35:08.872075+00	111	Мой профиль, вкладка "Прогнозы".	2	update through import_export	8	1
2193	2018-12-25 11:35:08.874505+00	112	Мой профиль, вкладка "Статистика".	2	update through import_export	8	1
2194	2018-12-25 11:35:08.876535+00	113	Мой профиль, вкладка "Статистика".	2	update through import_export	8	1
2195	2018-12-25 11:35:08.87818+00	114	Перейдите в профиль интересующего вас каппера и выберите вкладку "Статистика".	2	update through import_export	8	1
2196	2018-12-25 11:35:08.879751+00	115	Перейдите в профиль интересующего вас каппера и выберите вкладку "Статистика".	2	update through import_export	8	1
2197	2018-12-25 11:35:08.881357+00	116	Перейдите в профиль интересующего вас каппера и выберите вкладку "Статистика".	2	update through import_export	8	1
2198	2018-12-25 11:35:08.8828+00	117	Перейдите в профиль интересующего вас каппера и выберите вкладку "Статистика".	2	update through import_export	8	1
2199	2018-12-25 11:35:08.884779+00	118	Мой профиль, вкладка "Подписки".	2	update through import_export	8	1
2200	2018-12-25 11:35:08.887177+00	119	Мой профиль, вкладка "Подписки".	2	update through import_export	8	1
2201	2018-12-25 11:35:08.888871+00	120	Количество подписанных на Вас пользователей можно посмотреть в своём профиле, вкладка "Подписчики".	2	update through import_export	8	1
2202	2018-12-25 11:35:08.890464+00	121	Количество подписанных на Вас пользователей можно посмотреть в своём профиле, вкладка "Подписчики".	2	update through import_export	8	1
2203	2018-12-25 11:35:08.892049+00	122	Количество подписанных на Вас пользователей можно посмотреть в своём профиле, вкладка "Подписчики".	2	update through import_export	8	1
2204	2018-12-25 11:35:08.893703+00	123	Количество подписанных на Вас пользователей можно посмотреть в своём профиле, вкладка "Подписчики".	2	update through import_export	8	1
2205	2018-12-25 11:35:08.895334+00	124	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2206	2018-12-25 11:35:08.897336+00	125	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2207	2018-12-25 11:35:08.899018+00	126	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2208	2018-12-25 11:35:08.900878+00	127	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2209	2018-12-25 11:35:08.902728+00	128	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2210	2018-12-25 11:35:08.904661+00	129	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2211	2018-12-25 11:35:08.906765+00	130	Заходите в "Настойки профиля", выбираете вкладку "Интересы". Конторы в которых Вы играете отмечены цветным логотипом, а в которых не играете - черно-белым.	2	update through import_export	8	1
2212	2018-12-25 11:35:08.908946+00	131	Заходите в "Настойки профиля", выбираете вкладку "Интересы". Конторы в которых Вы играете отмечены цветным логотипом, а в которых не играете - черно-белым.	2	update through import_export	8	1
2213	2018-12-25 11:35:08.911106+00	132	Выберите вкладку "Уведомления" в выпадающем меню профиля.	2	update through import_export	8	1
2214	2018-12-25 11:35:08.913422+00	133	Выберите вкладку "Уведомления" в выпадающем меню профиля.	2	update through import_export	8	1
2215	2018-12-25 11:35:08.915205+00	134	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.	2	update through import_export	8	1
2216	2018-12-25 11:35:08.917125+00	135	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.	2	update through import_export	8	1
2217	2018-12-25 11:35:08.918809+00	136	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.	2	update through import_export	8	1
2218	2018-12-25 11:35:08.920571+00	137	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.	2	update through import_export	8	1
2219	2018-12-25 11:35:08.922429+00	138	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.	2	update through import_export	8	1
2220	2018-12-25 11:35:08.924584+00	139	Комментарий может быть удален по причине наличия спама, оскорблений, мата, откровенного обмана, рекламы или запрещенных ссылок.  	2	update through import_export	8	1
2221	2018-12-25 11:35:08.926584+00	140	Комментарий может быть удален по причине наличия спама, оскорблений, мата, откровенного обмана, рекламы или запрещенных ссылок.  	2	update through import_export	8	1
2222	2018-12-25 11:35:08.928601+00	141	Комментарий может быть удален по причине наличия спама, оскорблений, мата, откровенного обмана, рекламы или запрещенных ссылок.  	2	update through import_export	8	1
2223	2018-12-25 11:35:08.930982+00	142	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  	2	update through import_export	8	1
2224	2018-12-25 11:35:08.933269+00	143	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  	2	update through import_export	8	1
2225	2018-12-25 11:35:08.935392+00	144	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  	2	update through import_export	8	1
2226	2018-12-25 11:35:08.937571+00	145	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  	2	update through import_export	8	1
2227	2018-12-25 11:35:08.939503+00	146	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  	2	update through import_export	8	1
2228	2018-12-25 11:35:08.941663+00	147	Вы можете редактировать отзыв, выбрав его во вкладке "Отзывы" Вашего профиля. Учтите, измененный отзыв вновь проходит модерацию.	2	update through import_export	8	1
2229	2018-12-25 11:35:08.943694+00	148	Вы можете редактировать отзыв, выбрав его во вкладке "Отзывы" Вашего профиля. Учтите, измененный отзыв вновь проходит модерацию.	2	update through import_export	8	1
2230	2018-12-25 11:35:08.945749+00	149	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2231	2018-12-25 11:35:08.947309+00	150	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2232	2018-12-25 11:35:08.948812+00	151	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2233	2018-12-25 11:35:08.950284+00	152	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2234	2018-12-25 11:35:08.951865+00	153	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2235	2018-12-25 11:35:08.953575+00	154	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2442	2018-12-25 11:35:09.309696+00	361	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2236	2018-12-25 11:35:08.955017+00	155	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2237	2018-12-25 11:35:08.956648+00	156	Ежегодно мы разыгрываем место в команде экспертов РБ. Следите за конкусами и побеждайте в них.	2	update through import_export	8	1
2238	2018-12-25 11:35:08.958409+00	157	Ежегодно мы разыгрываем место в команде экспертов РБ. Следите за конкусами и побеждайте в них.	2	update through import_export	8	1
2239	2018-12-25 11:35:08.960268+00	158	Ежегодно мы разыгрываем место в команде экспертов РБ. Следите за конкусами и побеждайте в них.	2	update through import_export	8	1
2240	2018-12-25 11:35:08.961935+00	159	Методика подсчета прибыли/убытка очень проста: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
2241	2018-12-25 11:35:08.963777+00	160	Методика подсчета прибыли/убытка очень проста: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
2242	2018-12-25 11:35:08.965278+00	161	Методика подсчета прибыли/убытка очень проста: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
2243	2018-12-25 11:35:08.966829+00	162	Методика подсчета прибыли/убытка очень проста: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
2244	2018-12-25 11:35:08.968523+00	163	Статистику прогнозов нашей команды экспертов можно найти здесь: https://bookmaker-ratings.ru/infographics-template/tips_stats/	2	update through import_export	8	1
2245	2018-12-25 11:35:08.970082+00	164	Статистику прогнозов нашей команды экспертов можно найти здесь: https://bookmaker-ratings.ru/infographics-template/tips_stats/	2	update through import_export	8	1
2246	2018-12-25 11:35:08.971926+00	165	Вы можете увидеть 12 лучших капперов "Трибуны" за последние 30 дней здесь: https://bookmaker-ratings.ru/tribune/	2	update through import_export	8	1
2247	2018-12-25 11:35:08.973685+00	166	Вы можете увидеть 12 лучших капперов "Трибуны" за последние 30 дней здесь: https://bookmaker-ratings.ru/tribune/	2	update through import_export	8	1
2248	2018-12-25 11:35:08.975629+00	167	В ротаторе показаны 12 спортивных прогнозистов «Трибуны», которые были лучшими за последний месяц по статистике прогнозов, допущенных на главную страницу раздела (среди написавших более 4 прогнозов).	2	update through import_export	8	1
2249	2018-12-25 11:35:08.977671+00	168	В ротаторе показаны 12 спортивных прогнозистов «Трибуны», которые были лучшими за последний месяц по статистике прогнозов, допущенных на главную страницу раздела (среди написавших более 4 прогнозов).	2	update through import_export	8	1
2250	2018-12-25 11:35:08.979679+00	169	Аргументированость прогнозов и хорошая статистика заметно увеличивают количество подписчиков. 	2	update through import_export	8	1
2251	2018-12-25 11:35:08.981569+00	170	Аргументированость прогнозов и хорошая статистика заметно увеличивают количество подписчиков. 	2	update through import_export	8	1
2252	2018-12-25 11:35:08.983467+00	171	Аргументированость прогнозов и хорошая статистика заметно увеличивают количество подписчиков. 	2	update through import_export	8	1
2253	2018-12-25 11:35:08.98535+00	172	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru	2	update through import_export	8	1
2254	2018-12-25 11:35:08.987027+00	173	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru	2	update through import_export	8	1
2255	2018-12-25 11:35:08.98877+00	174	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru	2	update through import_export	8	1
2256	2018-12-25 11:35:08.990646+00	175	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru	2	update through import_export	8	1
2257	2018-12-25 11:35:08.992404+00	176	На главной странице РБ размещаются только прогнозы экспертов. Для капперских прогнозов есть раздел "Трибуна". 	2	update through import_export	8	1
2258	2018-12-25 11:35:08.994052+00	177	На главной странице РБ размещаются только прогнозы экспертов. Для капперских прогнозов есть раздел "Трибуна". 	2	update through import_export	8	1
2259	2018-12-25 11:35:08.995704+00	178	Мы не рассчитываем прогнозы, которые не попали на главную страницу "Трибуны" и не участвуют в конкурсе.	2	update through import_export	8	1
2260	2018-12-25 11:35:08.997258+00	179	Мы не рассчитываем прогнозы, которые не попали на главную страницу "Трибуны" и не участвуют в конкурсе.	2	update through import_export	8	1
2261	2018-12-25 11:35:08.998743+00	180	При размещении прогноза в выпадающем меню поля "Букмекер" доступны только лучшие зарубежные конторы и БК, имеющие лицензию ФНС.   	2	update through import_export	8	1
2263	2018-12-25 11:35:09.001955+00	182	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
2264	2018-12-25 11:35:09.003585+00	183	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
2265	2018-12-25 11:35:09.005046+00	184	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
2266	2018-12-25 11:35:09.006519+00	185	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
2267	2018-12-25 11:35:09.008166+00	186	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
2268	2018-12-25 11:35:09.009649+00	187	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
2269	2018-12-25 11:35:09.011452+00	188	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
2270	2018-12-25 11:35:09.013209+00	189	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
2271	2018-12-25 11:35:09.015173+00	190	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
2272	2018-12-25 11:35:09.016828+00	191	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
2273	2018-12-25 11:35:09.018857+00	192	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
2274	2018-12-25 11:35:09.020692+00	193	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
2275	2018-12-25 11:35:09.02248+00	194	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
2276	2018-12-25 11:35:09.024186+00	195	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
2277	2018-12-25 11:35:09.025772+00	196	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
2278	2018-12-25 11:35:09.027407+00	197	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
2279	2018-12-25 11:35:09.028794+00	198	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
2280	2018-12-25 11:35:09.030452+00	199	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
2281	2018-12-25 11:35:09.031825+00	200	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2282	2018-12-25 11:35:09.033328+00	201	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2283	2018-12-25 11:35:09.034942+00	202	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2284	2018-12-25 11:35:09.036496+00	203	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2285	2018-12-25 11:35:09.037994+00	204	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2286	2018-12-25 11:35:09.039457+00	205	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2287	2018-12-25 11:35:09.040993+00	206	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2288	2018-12-25 11:35:09.04292+00	207	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2289	2018-12-25 11:35:09.044541+00	208	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2290	2018-12-25 11:35:09.046266+00	209	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2291	2018-12-25 11:35:09.048047+00	210	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2292	2018-12-25 11:35:09.050047+00	211	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.	1	new through import_export	8	1
2293	2018-12-25 11:35:09.051588+00	212	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.	1	new through import_export	8	1
2294	2018-12-25 11:35:09.053239+00	213	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.	1	new through import_export	8	1
2440	2018-12-25 11:35:09.306379+00	359	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2295	2018-12-25 11:35:09.0549+00	214	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.	2	update through import_export	8	1
2296	2018-12-25 11:35:09.056582+00	215	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.	1	new through import_export	8	1
2297	2018-12-25 11:35:09.058157+00	216	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.	1	new through import_export	8	1
2298	2018-12-25 11:35:09.05982+00	217	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.	2	update through import_export	8	1
2299	2018-12-25 11:35:09.061268+00	218	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.	1	new through import_export	8	1
2300	2018-12-25 11:35:09.062744+00	219	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.	1	new through import_export	8	1
2301	2018-12-25 11:35:09.064198+00	220	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 	2	update through import_export	8	1
2302	2018-12-25 11:35:09.06572+00	221	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 	2	update through import_export	8	1
2303	2018-12-25 11:35:09.067053+00	222	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 	1	new through import_export	8	1
2304	2018-12-25 11:35:09.068462+00	223	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 	1	new through import_export	8	1
2305	2018-12-25 11:35:09.069989+00	224	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic	2	update through import_export	8	1
2306	2018-12-25 11:35:09.071479+00	225	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic	2	update through import_export	8	1
2307	2018-12-25 11:35:09.07308+00	226	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic	1	new through import_export	8	1
2308	2018-12-25 11:35:09.074477+00	227	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic	1	new through import_export	8	1
2309	2018-12-25 11:35:09.075976+00	228	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
2310	2018-12-25 11:35:09.077585+00	229	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
2311	2018-12-25 11:35:09.079342+00	230	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	1	new through import_export	8	1
2312	2018-12-25 11:35:09.081133+00	231	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	1	new through import_export	8	1
2313	2018-12-25 11:35:09.082594+00	232	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	1	new through import_export	8	1
2314	2018-12-25 11:35:09.084154+00	233	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
2315	2018-12-25 11:35:09.085928+00	234	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
2316	2018-12-25 11:35:09.087711+00	235	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
2317	2018-12-25 11:35:09.089222+00	236	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
2318	2018-12-25 11:35:09.091186+00	237	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
2593	2018-12-25 11:35:09.59007+00	512	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2319	2018-12-25 11:35:09.092755+00	238	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	1	new through import_export	8	1
2320	2018-12-25 11:35:09.095152+00	239	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	1	new through import_export	8	1
2321	2018-12-25 11:35:09.096555+00	240	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	1	new through import_export	8	1
2322	2018-12-25 11:35:09.098123+00	241	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	1	new through import_export	8	1
2323	2018-12-25 11:35:09.099922+00	242	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	1	new through import_export	8	1
2324	2018-12-25 11:35:09.101523+00	243	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	1	new through import_export	8	1
2325	2018-12-25 11:35:09.103178+00	244	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	1	new through import_export	8	1
2326	2018-12-25 11:35:09.104949+00	245	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских контор	1	new through import_export	8	1
2327	2018-12-25 11:35:09.106857+00	246	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских контор	1	new through import_export	8	1
2328	2018-12-25 11:35:09.10918+00	247	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских контор	1	new through import_export	8	1
2329	2018-12-25 11:35:09.111392+00	248	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.	1	new through import_export	8	1
2330	2018-12-25 11:35:09.113126+00	249	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.	1	new through import_export	8	1
2331	2018-12-25 11:35:09.114929+00	250	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.	1	new through import_export	8	1
2332	2018-12-25 11:35:09.116836+00	251	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.	1	new through import_export	8	1
2333	2018-12-25 11:35:09.118507+00	252	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	1	new through import_export	8	1
2334	2018-12-25 11:35:09.12019+00	253	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	1	new through import_export	8	1
2335	2018-12-25 11:35:09.122067+00	254	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	1	new through import_export	8	1
2336	2018-12-25 11:35:09.123981+00	255	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	1	new through import_export	8	1
2337	2018-12-25 11:35:09.125711+00	256	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	1	new through import_export	8	1
2338	2018-12-25 11:35:09.127421+00	257	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	1	new through import_export	8	1
2339	2018-12-25 11:35:09.129038+00	258	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	1	new through import_export	8	1
2340	2018-12-25 11:35:09.130728+00	259	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	1	new through import_export	8	1
2341	2018-12-25 11:35:09.132409+00	260	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	1	new through import_export	8	1
2342	2018-12-25 11:35:09.13381+00	261	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	1	new through import_export	8	1
2343	2018-12-25 11:35:09.135563+00	262	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	1	new through import_export	8	1
2344	2018-12-25 11:35:09.137477+00	263	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	1	new through import_export	8	1
2441	2018-12-25 11:35:09.307961+00	360	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2345	2018-12-25 11:35:09.139453+00	264	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы. Если	1	new through import_export	8	1
2346	2018-12-25 11:35:09.141536+00	265	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  	1	new through import_export	8	1
2347	2018-12-25 11:35:09.1438+00	266	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  	1	new through import_export	8	1
2348	2018-12-25 11:35:09.145925+00	267	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  	1	new through import_export	8	1
2349	2018-12-25 11:35:09.147894+00	268	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  	1	new through import_export	8	1
2350	2018-12-25 11:35:09.14961+00	269	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 	1	new through import_export	8	1
2351	2018-12-25 11:35:09.15125+00	270	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 	1	new through import_export	8	1
2352	2018-12-25 11:35:09.152859+00	271	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 	1	new through import_export	8	1
2353	2018-12-25 11:35:09.15457+00	272	Можно привязать карту платежной системы, например, Skrill. 	1	new through import_export	8	1
2354	2018-12-25 11:35:09.156492+00	273	Можно привязать карту платежной системы, например, Skrill. 	1	new through import_export	8	1
2355	2018-12-25 11:35:09.158366+00	274	Можно привязать карту платежной системы, например, Skrill. 	1	new through import_export	8	1
2356	2018-12-25 11:35:09.160007+00	275	Можно привязать карту платежной системы, например, Skrill. 	1	new through import_export	8	1
2357	2018-12-25 11:35:09.161422+00	276	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/	1	new through import_export	8	1
2358	2018-12-25 11:35:09.162718+00	277	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/	1	new through import_export	8	1
2359	2018-12-25 11:35:09.164159+00	278	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/	1	new through import_export	8	1
2360	2018-12-25 11:35:09.165611+00	279	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/	1	new through import_export	8	1
2361	2018-12-25 11:35:09.167435+00	280	Методы пополнения/вывода средств доступны в обзоре БК	1	new through import_export	8	1
2362	2018-12-25 11:35:09.169035+00	281	Методы пополнения/вывода средств доступны в обзоре БК	1	new through import_export	8	1
2363	2018-12-25 11:35:09.170788+00	282	Методы пополнения/вывода средств доступны в обзоре БК	1	new through import_export	8	1
2364	2018-12-25 11:35:09.172869+00	283	Методы пополнения/вывода средств доступны в обзоре БК	1	new through import_export	8	1
2365	2018-12-25 11:35:09.174879+00	284	Методы пополнения/вывода средств доступны в обзоре БК	1	new through import_export	8	1
2366	2018-12-25 11:35:09.176821+00	285	Методы пополнения/вывода средств доступны в обзоре БК	1	new through import_export	8	1
2367	2018-12-25 11:35:09.178765+00	286	Информация о лицензии доступна в обзоре БК.	1	new through import_export	8	1
2368	2018-12-25 11:35:09.18068+00	287	Информация о лицензии доступна в обзоре БК.	1	new through import_export	8	1
2369	2018-12-25 11:35:09.182221+00	288	Информация о контактах букмекера доступна в обзоре БК.	1	new through import_export	8	1
2370	2018-12-25 11:35:09.183731+00	289	Информация о контактах букмекера доступна в обзоре БК.	1	new through import_export	8	1
2371	2018-12-25 11:35:09.185268+00	290	С отзывами можно ознакомиться в обзоре БК.	1	new through import_export	8	1
2372	2018-12-25 11:35:09.186824+00	291	С отзывами можно ознакомиться в обзоре БК.	1	new through import_export	8	1
2373	2018-12-25 11:35:09.18842+00	292	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2374	2018-12-25 11:35:09.189884+00	293	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2375	2018-12-25 11:35:09.191378+00	294	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2376	2018-12-25 11:35:09.192878+00	295	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2377	2018-12-25 11:35:09.194307+00	296	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2378	2018-12-25 11:35:09.196323+00	297	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2379	2018-12-25 11:35:09.19816+00	298	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2380	2018-12-25 11:35:09.199742+00	299	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2381	2018-12-25 11:35:09.201206+00	300	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2382	2018-12-25 11:35:09.202692+00	301	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2383	2018-12-25 11:35:09.204263+00	302	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2384	2018-12-25 11:35:09.205811+00	303	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2385	2018-12-25 11:35:09.207575+00	304	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2386	2018-12-25 11:35:09.209503+00	305	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2387	2018-12-25 11:35:09.211796+00	306	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2388	2018-12-25 11:35:09.213557+00	307	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	1	new through import_export	8	1
2389	2018-12-25 11:35:09.215297+00	308	Если вы находитесь на территории РФ, перейти можно только на лицензированные и легальные в России БК (требования Роскомнадзора).	1	new through import_export	8	1
2390	2018-12-25 11:35:09.216913+00	309	Если вы находитесь на территории РФ, перейти можно только на лицензированные и легальные в России БК (требования Роскомнадзора).	1	new through import_export	8	1
2391	2018-12-25 11:35:09.21855+00	310	Если вы находитесь на территории РФ, перейти можно только на лицензированные и легальные в России БК (требования Роскомнадзора).	1	new through import_export	8	1
2392	2018-12-25 11:35:09.220237+00	311	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.	1	new through import_export	8	1
2393	2018-12-25 11:35:09.221991+00	312	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.	1	new through import_export	8	1
2394	2018-12-25 11:35:09.22404+00	313	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.	1	new through import_export	8	1
2395	2018-12-25 11:35:09.226199+00	314	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.	1	new through import_export	8	1
2396	2018-12-25 11:35:09.228223+00	315	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.	1	new through import_export	8	1
2397	2018-12-25 11:35:09.230051+00	316	 К ответственности могут быть призваны букмекеры, а не их клиенты. 	1	new through import_export	8	1
2398	2018-12-25 11:35:09.231626+00	317	 К ответственности могут быть призваны букмекеры, а не их клиенты. 	1	new through import_export	8	1
2399	2018-12-25 11:35:09.233192+00	318	 К ответственности могут быть призваны букмекеры, а не их клиенты. 	1	new through import_export	8	1
2400	2018-12-25 11:35:09.235003+00	319	 К ответственности могут быть призваны букмекеры, а не их клиенты. 	1	new through import_export	8	1
2401	2018-12-25 11:35:09.236908+00	320	 К ответственности могут быть призваны букмекеры, а не их клиенты. 	1	new through import_export	8	1
2402	2018-12-25 11:35:09.239019+00	321	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов	1	new through import_export	8	1
2403	2018-12-25 11:35:09.240925+00	322	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов	1	new through import_export	8	1
2404	2018-12-25 11:35:09.242522+00	323	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов	1	new through import_export	8	1
2405	2018-12-25 11:35:09.244194+00	324	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов	1	new through import_export	8	1
2406	2018-12-25 11:35:09.245642+00	325	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	1	new through import_export	8	1
2407	2018-12-25 11:35:09.247381+00	326	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	1	new through import_export	8	1
2408	2018-12-25 11:35:09.249084+00	327	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	1	new through import_export	8	1
2409	2018-12-25 11:35:09.250671+00	328	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	1	new through import_export	8	1
2410	2018-12-25 11:35:09.252222+00	329	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	1	new through import_export	8	1
2411	2018-12-25 11:35:09.253673+00	330	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	1	new through import_export	8	1
2412	2018-12-25 11:35:09.255578+00	331	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	1	new through import_export	8	1
2413	2018-12-25 11:35:09.257336+00	332	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	1	new through import_export	8	1
2414	2018-12-25 11:35:09.2592+00	333	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	1	new through import_export	8	1
2415	2018-12-25 11:35:09.260758+00	334	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	1	new through import_export	8	1
2416	2018-12-25 11:35:09.26254+00	335	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	1	new through import_export	8	1
2594	2018-12-25 11:35:09.591976+00	513	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2417	2018-12-25 11:35:09.264506+00	336	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	1	new through import_export	8	1
2418	2018-12-25 11:35:09.266605+00	337	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	1	new through import_export	8	1
2419	2018-12-25 11:35:09.268605+00	338	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	1	new through import_export	8	1
2420	2018-12-25 11:35:09.270642+00	339	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	1	new through import_export	8	1
2421	2018-12-25 11:35:09.272816+00	340	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	1	new through import_export	8	1
2422	2018-12-25 11:35:09.2747+00	341	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	1	new through import_export	8	1
2423	2018-12-25 11:35:09.276711+00	342	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	1	new through import_export	8	1
2424	2018-12-25 11:35:09.279803+00	343	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	1	new through import_export	8	1
2425	2018-12-25 11:35:09.281443+00	344	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	1	new through import_export	8	1
2426	2018-12-25 11:35:09.282964+00	345	Переводы, которые проводятся через банк, занимают больше времени, чем переводы посредством платежных интернет-систем (к примеру, платежной системы Skrill).	1	new through import_export	8	1
2427	2018-12-25 11:35:09.284783+00	346	Переводы, которые проводятся через банк, занимают больше времени, чем переводы посредством платежных интернет-систем (к примеру, платежной системы Skrill).	1	new through import_export	8	1
2428	2018-12-25 11:35:09.286505+00	347	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были в	1	new through import_export	8	1
2429	2018-12-25 11:35:09.288254+00	348	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были в	1	new through import_export	8	1
2430	2018-12-25 11:35:09.289965+00	349	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были в	1	new through import_export	8	1
2431	2018-12-25 11:35:09.291648+00	350	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК, и ограничения для конкретной платежной системы	1	new through import_export	8	1
2432	2018-12-25 11:35:09.293245+00	351	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК, и ограничения для конкретной платежной системы	1	new through import_export	8	1
2433	2018-12-25 11:35:09.295092+00	352	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК, и ограничения для конкретной платежной системы	1	new through import_export	8	1
2434	2018-12-25 11:35:09.296973+00	353	Этот вопрос лучше задать представителям банка.	1	new through import_export	8	1
2435	2018-12-25 11:35:09.299158+00	354	Этот вопрос лучше задать представителям банка.	1	new through import_export	8	1
2436	2018-12-25 11:35:09.300671+00	355	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2437	2018-12-25 11:35:09.302048+00	356	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2438	2018-12-25 11:35:09.3035+00	357	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2439	2018-12-25 11:35:09.30493+00	358	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2443	2018-12-25 11:35:09.311626+00	362	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2444	2018-12-25 11:35:09.313389+00	363	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2445	2018-12-25 11:35:09.315091+00	364	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2446	2018-12-25 11:35:09.316724+00	365	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2447	2018-12-25 11:35:09.318298+00	366	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2448	2018-12-25 11:35:09.319882+00	367	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2449	2018-12-25 11:35:09.32158+00	368	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2450	2018-12-25 11:35:09.323606+00	369	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2451	2018-12-25 11:35:09.325808+00	370	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2452	2018-12-25 11:35:09.327539+00	371	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2453	2018-12-25 11:35:09.329159+00	372	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2454	2018-12-25 11:35:09.33074+00	373	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2455	2018-12-25 11:35:09.332511+00	374	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2456	2018-12-25 11:35:09.334504+00	375	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2457	2018-12-25 11:35:09.336561+00	376	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2458	2018-12-25 11:35:09.338577+00	377	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2459	2018-12-25 11:35:09.340862+00	378	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2460	2018-12-25 11:35:09.343401+00	379	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2461	2018-12-25 11:35:09.3457+00	380	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2462	2018-12-25 11:35:09.347746+00	381	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2463	2018-12-25 11:35:09.349855+00	382	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2464	2018-12-25 11:35:09.351482+00	383	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2465	2018-12-25 11:35:09.35336+00	384	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2466	2018-12-25 11:35:09.355303+00	385	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2467	2018-12-25 11:35:09.357364+00	386	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2468	2018-12-25 11:35:09.358945+00	387	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2469	2018-12-25 11:35:09.361035+00	388	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2470	2018-12-25 11:35:09.362845+00	389	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2471	2018-12-25 11:35:09.364952+00	390	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2472	2018-12-25 11:35:09.366451+00	391	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2473	2018-12-25 11:35:09.368081+00	392	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2474	2018-12-25 11:35:09.369889+00	393	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2475	2018-12-25 11:35:09.371503+00	394	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2476	2018-12-25 11:35:09.373293+00	395	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2477	2018-12-25 11:35:09.375476+00	396	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2478	2018-12-25 11:35:09.37778+00	397	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2479	2018-12-25 11:35:09.379854+00	398	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2480	2018-12-25 11:35:09.38167+00	399	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2481	2018-12-25 11:35:09.383432+00	400	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2482	2018-12-25 11:35:09.385237+00	401	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2483	2018-12-25 11:35:09.386964+00	402	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2484	2018-12-25 11:35:09.388845+00	403	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2485	2018-12-25 11:35:09.390605+00	404	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2486	2018-12-25 11:35:09.392258+00	405	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2487	2018-12-25 11:35:09.393802+00	406	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2488	2018-12-25 11:35:09.396233+00	407	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2489	2018-12-25 11:35:09.397859+00	408	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2490	2018-12-25 11:35:09.399407+00	409	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2491	2018-12-25 11:35:09.400993+00	410	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2492	2018-12-25 11:35:09.40278+00	411	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2493	2018-12-25 11:35:09.404475+00	412	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2494	2018-12-25 11:35:09.406075+00	413	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2495	2018-12-25 11:35:09.407632+00	414	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2496	2018-12-25 11:35:09.409201+00	415	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2497	2018-12-25 11:35:09.410683+00	416	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2498	2018-12-25 11:35:09.412347+00	417	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2499	2018-12-25 11:35:09.413842+00	418	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2500	2018-12-25 11:35:09.415483+00	419	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2501	2018-12-25 11:35:09.41736+00	420	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2502	2018-12-25 11:35:09.419174+00	421	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2503	2018-12-25 11:35:09.420948+00	422	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2504	2018-12-25 11:35:09.422375+00	423	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2505	2018-12-25 11:35:09.423924+00	424	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2506	2018-12-25 11:35:09.425632+00	425	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2507	2018-12-25 11:35:09.427571+00	426	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2508	2018-12-25 11:35:09.429473+00	427	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2509	2018-12-25 11:35:09.431311+00	428	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2510	2018-12-25 11:35:09.433831+00	429	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2511	2018-12-25 11:35:09.435744+00	430	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2512	2018-12-25 11:35:09.437681+00	431	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2513	2018-12-25 11:35:09.439528+00	432	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2514	2018-12-25 11:35:09.44164+00	433	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	1	new through import_export	8	1
2515	2018-12-25 11:35:09.443565+00	434	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	1	new through import_export	8	1
2516	2018-12-25 11:35:09.445825+00	435	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	1	new through import_export	8	1
2517	2018-12-25 11:35:09.447553+00	436	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	1	new through import_export	8	1
2518	2018-12-25 11:35:09.44912+00	437	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	1	new through import_export	8	1
2519	2018-12-25 11:35:09.450709+00	438	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2520	2018-12-25 11:35:09.4525+00	439	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2521	2018-12-25 11:35:09.45411+00	440	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2522	2018-12-25 11:35:09.455882+00	441	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2523	2018-12-25 11:35:09.457595+00	442	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2524	2018-12-25 11:35:09.459173+00	443	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2525	2018-12-25 11:35:09.460895+00	444	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2526	2018-12-25 11:35:09.462498+00	445	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2527	2018-12-25 11:35:09.464442+00	446	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2528	2018-12-25 11:35:09.466346+00	447	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2529	2018-12-25 11:35:09.468422+00	448	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2530	2018-12-25 11:35:09.470142+00	449	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2531	2018-12-25 11:35:09.471896+00	450	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2532	2018-12-25 11:35:09.474043+00	451	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2533	2018-12-25 11:35:09.476349+00	452	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2534	2018-12-25 11:35:09.478278+00	453	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2535	2018-12-25 11:35:09.480153+00	454	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2536	2018-12-25 11:35:09.482142+00	455	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2537	2018-12-25 11:35:09.484273+00	456	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2538	2018-12-25 11:35:09.486242+00	457	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2539	2018-12-25 11:35:09.488375+00	458	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2540	2018-12-25 11:35:09.490307+00	459	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2541	2018-12-25 11:35:09.492436+00	460	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2542	2018-12-25 11:35:09.494316+00	461	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2543	2018-12-25 11:35:09.496089+00	462	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2544	2018-12-25 11:35:09.497965+00	463	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2545	2018-12-25 11:35:09.499881+00	464	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2546	2018-12-25 11:35:09.501774+00	465	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2547	2018-12-25 11:35:09.503858+00	466	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2548	2018-12-25 11:35:09.505952+00	467	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2549	2018-12-25 11:35:09.507741+00	468	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2550	2018-12-25 11:35:09.509595+00	469	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2551	2018-12-25 11:35:09.511407+00	470	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2552	2018-12-25 11:35:09.513407+00	471	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2553	2018-12-25 11:35:09.515466+00	472	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2554	2018-12-25 11:35:09.517122+00	473	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2555	2018-12-25 11:35:09.518861+00	474	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2556	2018-12-25 11:35:09.520859+00	475	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2557	2018-12-25 11:35:09.522867+00	476	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2558	2018-12-25 11:35:09.525473+00	477	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2559	2018-12-25 11:35:09.527335+00	478	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2560	2018-12-25 11:35:09.528922+00	479	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2561	2018-12-25 11:35:09.530395+00	480	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2562	2018-12-25 11:35:09.53251+00	481	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2563	2018-12-25 11:35:09.535083+00	482	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2564	2018-12-25 11:35:09.536923+00	483	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2565	2018-12-25 11:35:09.538758+00	484	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2566	2018-12-25 11:35:09.540568+00	485	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2567	2018-12-25 11:35:09.542237+00	486	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2568	2018-12-25 11:35:09.544305+00	487	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	1	new through import_export	8	1
2569	2018-12-25 11:35:09.546264+00	488	Ищите способы обхода блокировок в поисковике.	1	new through import_export	8	1
2570	2018-12-25 11:35:09.548259+00	489	Ищите способы обхода блокировок в поисковике.	1	new through import_export	8	1
2571	2018-12-25 11:35:09.550017+00	490	Ищите способы обхода блокировок в поисковике.	1	new through import_export	8	1
2572	2018-12-25 11:35:09.551645+00	491	Ищите способы обхода блокировок в поисковике.	1	new through import_export	8	1
2573	2018-12-25 11:35:09.55334+00	492	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2574	2018-12-25 11:35:09.5552+00	493	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2575	2018-12-25 11:35:09.557108+00	494	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2576	2018-12-25 11:35:09.55895+00	495	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2577	2018-12-25 11:35:09.560926+00	496	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2578	2018-12-25 11:35:09.562685+00	497	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2579	2018-12-25 11:35:09.564278+00	498	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2580	2018-12-25 11:35:09.566003+00	499	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2581	2018-12-25 11:35:09.568179+00	500	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2582	2018-12-25 11:35:09.569999+00	501	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2583	2018-12-25 11:35:09.57153+00	502	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2584	2018-12-25 11:35:09.573274+00	503	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2585	2018-12-25 11:35:09.574835+00	504	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2586	2018-12-25 11:35:09.576678+00	505	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2587	2018-12-25 11:35:09.578732+00	506	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2588	2018-12-25 11:35:09.580696+00	507	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2589	2018-12-25 11:35:09.582741+00	508	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2590	2018-12-25 11:35:09.584447+00	509	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2591	2018-12-25 11:35:09.586319+00	510	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2592	2018-12-25 11:35:09.588142+00	511	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2595	2018-12-25 11:35:09.593638+00	514	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2596	2018-12-25 11:35:09.595296+00	515	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2597	2018-12-25 11:35:09.597064+00	516	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2598	2018-12-25 11:35:09.598935+00	517	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2599	2018-12-25 11:35:09.600794+00	518	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2600	2018-12-25 11:35:09.602635+00	519	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2601	2018-12-25 11:35:09.604683+00	520	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2602	2018-12-25 11:35:09.606879+00	521	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2603	2018-12-25 11:35:09.608808+00	522	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2604	2018-12-25 11:35:09.610393+00	523	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2605	2018-12-25 11:35:09.61204+00	524	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2606	2018-12-25 11:35:09.613484+00	525	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2607	2018-12-25 11:35:09.615006+00	526	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2608	2018-12-25 11:35:09.616738+00	527	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2609	2018-12-25 11:35:09.618526+00	528	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2610	2018-12-25 11:35:09.620232+00	529	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2611	2018-12-25 11:35:09.622146+00	530	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2612	2018-12-25 11:35:09.62406+00	531	Ищите способы обхода блокировок в поисковике. 	1	new through import_export	8	1
2613	2018-12-25 11:35:09.625602+00	532	Критерии оценки капперов/капперских сайтов доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/	1	new through import_export	8	1
2614	2018-12-25 11:35:09.627385+00	533	Критерии оценки капперов/капперских сайтов доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/	1	new through import_export	8	1
2615	2018-12-25 11:35:09.629259+00	534	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	1	new through import_export	8	1
2616	2018-12-25 11:35:09.630972+00	535	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	1	new through import_export	8	1
2617	2018-12-25 11:35:09.632883+00	536	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	1	new through import_export	8	1
2618	2018-12-25 11:35:09.634621+00	537	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	1	new through import_export	8	1
2619	2018-12-25 11:35:09.636383+00	538	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	1	new through import_export	8	1
2620	2018-12-25 11:35:09.638294+00	539	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	1	new through import_export	8	1
2621	2018-12-25 11:35:09.640394+00	540	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.	1	new through import_export	8	1
2622	2018-12-25 11:35:09.642643+00	541	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.	1	new through import_export	8	1
2623	2018-12-25 11:35:09.64475+00	542	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.	1	new through import_export	8	1
2624	2018-12-25 11:35:09.646861+00	543	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.	1	new through import_export	8	1
2625	2018-12-25 11:35:09.649107+00	544	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.	1	new through import_export	8	1
2626	2018-12-25 11:35:09.651374+00	545	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	1	new through import_export	8	1
2778	2018-12-25 11:35:09.934547+00	697	Приложение РБ для iOS доступно здесь: https://itunes.apple.com/ru/app/рб-прогнозы-на-спорт/id1188607891?mt=8	1	new through import_export	8	1
2627	2018-12-25 11:35:09.65338+00	546	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	1	new through import_export	8	1
2628	2018-12-25 11:35:09.655422+00	547	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	1	new through import_export	8	1
2629	2018-12-25 11:35:09.657321+00	548	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	1	new through import_export	8	1
2630	2018-12-25 11:35:09.659008+00	549	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют. В любом случае, мы не рекомендуем повторную рег	1	new through import_export	8	1
2631	2018-12-25 11:35:09.660928+00	550	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют. В любом случае, мы не рекомендуем повторную рег	1	new through import_export	8	1
2632	2018-12-25 11:35:09.662993+00	551	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют. В любом случае, мы не рекомендуем повторную рег	1	new through import_export	8	1
2633	2018-12-25 11:35:09.664985+00	552	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	1	new through import_export	8	1
2634	2018-12-25 11:35:09.666911+00	553	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	1	new through import_export	8	1
2635	2018-12-25 11:35:09.669075+00	554	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	1	new through import_export	8	1
2636	2018-12-25 11:35:09.671193+00	555	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	1	new through import_export	8	1
2637	2018-12-25 11:35:09.673409+00	556	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок	1	new through import_export	8	1
2638	2018-12-25 11:35:09.675515+00	557	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок	1	new through import_export	8	1
2639	2018-12-25 11:35:09.677536+00	558	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок	1	new through import_export	8	1
2640	2018-12-25 11:35:09.679325+00	559	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок	1	new through import_export	8	1
2641	2018-12-25 11:35:09.68122+00	560	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	1	new through import_export	8	1
2642	2018-12-25 11:35:09.683326+00	561	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	1	new through import_export	8	1
2643	2018-12-25 11:35:09.685408+00	562	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	1	new through import_export	8	1
2644	2018-12-25 11:35:09.687452+00	563	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	1	new through import_export	8	1
2645	2018-12-25 11:35:09.689453+00	564	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.	1	new through import_export	8	1
3118	2018-12-25 11:46:37.321833+00	53	Можно привязать карту платежной системы, например, Skrill. 	2	update through import_export	8	1
2646	2018-12-25 11:35:09.6916+00	565	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.	1	new through import_export	8	1
2647	2018-12-25 11:35:09.693642+00	566	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.	1	new through import_export	8	1
2648	2018-12-25 11:35:09.695584+00	567	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.	1	new through import_export	8	1
2649	2018-12-25 11:35:09.697448+00	568	Информация о букмекерских вилках находится здесь: https://bookmaker-ratings.ru/bukmekerskie-vilki-chto-e-to-i-kak-zarabotat-na-nih/	1	new through import_export	8	1
2650	2018-12-25 11:35:09.698925+00	569	Информация о букмекерских вилках находится здесь: https://bookmaker-ratings.ru/bukmekerskie-vilki-chto-e-to-i-kak-zarabotat-na-nih/	1	new through import_export	8	1
2651	2018-12-25 11:35:09.700538+00	570	Информация о букмекерских вилках находится здесь: https://bookmaker-ratings.ru/bukmekerskie-vilki-chto-e-to-i-kak-zarabotat-na-nih/	1	new through import_export	8	1
2652	2018-12-25 11:35:09.702066+00	571	БК не хочет с вами играть, смените контору. 	1	new through import_export	8	1
2653	2018-12-25 11:35:09.704143+00	572	БК не хочет с вами играть, смените контору. 	1	new through import_export	8	1
2654	2018-12-25 11:35:09.706224+00	573	БК не хочет с вами играть, смените контору. 	1	new through import_export	8	1
2655	2018-12-25 11:35:09.707983+00	574	БК не хочет с вами играть, смените контору. 	1	new through import_export	8	1
2656	2018-12-25 11:35:09.70968+00	575	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	1	new through import_export	8	1
2657	2018-12-25 11:35:09.711492+00	576	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	1	new through import_export	8	1
2658	2018-12-25 11:35:09.713225+00	577	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	1	new through import_export	8	1
2659	2018-12-25 11:35:09.715191+00	578	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	1	new through import_export	8	1
2660	2018-12-25 11:35:09.717133+00	579	«Коридором» обычно называют комбинацию из двух ставок в различных букмекерских конторах. Хотя данные две ставки должны быть поставлены на взаимоисключающие исходы, обе имеют шанс сработать одновременн	1	new through import_export	8	1
2661	2018-12-25 11:35:09.718674+00	580	«Коридором» обычно называют комбинацию из двух ставок в различных букмекерских конторах. Хотя данные две ставки должны быть поставлены на взаимоисключающие исходы, обе имеют шанс сработать одновременн	1	new through import_export	8	1
2662	2018-12-25 11:35:09.720817+00	581	Информация о ставках на фору здесь: https://bookmaker-ratings.ru/wiki/stavki-na-fory/	1	new through import_export	8	1
2663	2018-12-25 11:35:09.722918+00	582	Информация о ставках на фору здесь: https://bookmaker-ratings.ru/wiki/stavki-na-fory/	1	new through import_export	8	1
2664	2018-12-25 11:35:09.724893+00	583	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	1	new through import_export	8	1
2665	2018-12-25 11:35:09.726543+00	584	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	1	new through import_export	8	1
2666	2018-12-25 11:35:09.728467+00	585	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	1	new through import_export	8	1
2667	2018-12-25 11:35:09.730546+00	586	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	1	new through import_export	8	1
2668	2018-12-25 11:35:09.732906+00	587	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	1	new through import_export	8	1
2712	2018-12-25 11:35:09.813987+00	631	Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=legal-only/	1	new through import_export	8	1
2669	2018-12-25 11:35:09.734774+00	588	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при у	1	new through import_export	8	1
2670	2018-12-25 11:35:09.736686+00	589	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при у	1	new through import_export	8	1
2671	2018-12-25 11:35:09.738936+00	590	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при у	1	new through import_export	8	1
2672	2018-12-25 11:35:09.740662+00	591	Попробуйте обратиться в службу поддержки "Киви". 	1	new through import_export	8	1
2673	2018-12-25 11:35:09.742489+00	592	Попробуйте обратиться в службу поддержки "Киви". 	1	new through import_export	8	1
2674	2018-12-25 11:35:09.744317+00	593	Попробуйте обратиться в службу поддержки "Киви". 	1	new through import_export	8	1
2675	2018-12-25 11:35:09.746166+00	594	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.	1	new through import_export	8	1
2676	2018-12-25 11:35:09.748049+00	595	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.	1	new through import_export	8	1
2677	2018-12-25 11:35:09.74966+00	596	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.	1	new through import_export	8	1
2678	2018-12-25 11:35:09.751353+00	597	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридор	1	new through import_export	8	1
2679	2018-12-25 11:35:09.75305+00	598	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридор	1	new through import_export	8	1
2680	2018-12-25 11:35:09.754627+00	599	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридор	1	new through import_export	8	1
2681	2018-12-25 11:35:09.756554+00	600	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.	1	new through import_export	8	1
2682	2018-12-25 11:35:09.758456+00	601	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.	1	new through import_export	8	1
2683	2018-12-25 11:35:09.760304+00	602	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.	1	new through import_export	8	1
2684	2018-12-25 11:35:09.762156+00	603	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2685	2018-12-25 11:35:09.763957+00	604	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2686	2018-12-25 11:35:09.765862+00	605	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2687	2018-12-25 11:35:09.76747+00	606	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	1	new through import_export	8	1
2688	2018-12-25 11:35:09.769447+00	607	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	1	new through import_export	8	1
2689	2018-12-25 11:35:09.771773+00	608	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	1	new through import_export	8	1
2690	2018-12-25 11:35:09.774277+00	609	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	1	new through import_export	8	1
2691	2018-12-25 11:35:09.776533+00	610	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	1	new through import_export	8	1
2692	2018-12-25 11:35:09.778629+00	611	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	1	new through import_export	8	1
2693	2018-12-25 11:35:09.780752+00	612	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	1	new through import_export	8	1
2694	2018-12-25 11:35:09.782664+00	613	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	1	new through import_export	8	1
2695	2018-12-25 11:35:09.784512+00	614	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	1	new through import_export	8	1
2696	2018-12-25 11:35:09.786398+00	615	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	1	new through import_export	8	1
2697	2018-12-25 11:35:09.787905+00	616	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	1	new through import_export	8	1
2698	2018-12-25 11:35:09.789321+00	617	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки	1	new through import_export	8	1
2699	2018-12-25 11:35:09.790823+00	618	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки	1	new through import_export	8	1
2700	2018-12-25 11:35:09.792553+00	619	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки	1	new through import_export	8	1
2701	2018-12-25 11:35:09.794557+00	620	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки	1	new through import_export	8	1
2702	2018-12-25 11:35:09.79663+00	621	Следите за новостями на нашем сайте.	1	new through import_export	8	1
2703	2018-12-25 11:35:09.798462+00	622	Следите за новостями на нашем сайте.	1	new through import_export	8	1
2704	2018-12-25 11:35:09.800017+00	623	Следите за новостями на нашем сайте.	1	new through import_export	8	1
2705	2018-12-25 11:35:09.801624+00	624	Следите за новостями на нашем сайте.	1	new through import_export	8	1
2706	2018-12-25 11:35:09.803295+00	625	Следите за новостями на нашем сайте.	1	new through import_export	8	1
2707	2018-12-25 11:35:09.804801+00	626	Следите за новостями на нашем сайте.	1	new through import_export	8	1
2708	2018-12-25 11:35:09.806497+00	627	Список букмекеров, поддерживающих русский язык доступен здесь: https://bookmaker-ratings.ru/supported_languages/russkij/	1	new through import_export	8	1
2709	2018-12-25 11:35:09.808354+00	628	Список букмекеров, поддерживающих русский язык доступен здесь: https://bookmaker-ratings.ru/supported_languages/russkij/	1	new through import_export	8	1
2710	2018-12-25 11:35:09.810498+00	629	Список букмекеров, принимающих ставки на киберспорт доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/bukmekery-prinimayushhie-stavki-na-kibersport/	1	new through import_export	8	1
2711	2018-12-25 11:35:09.812372+00	630	Список букмекеров, принимающих ставки на киберспорт доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/bukmekery-prinimayushhie-stavki-na-kibersport/	1	new through import_export	8	1
2713	2018-12-25 11:35:09.815556+00	632	Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=legal-only/	1	new through import_export	8	1
2714	2018-12-25 11:35:09.817692+00	633	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/	1	new through import_export	8	1
2715	2018-12-25 11:35:09.81952+00	634	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/	1	new through import_export	8	1
2716	2018-12-25 11:35:09.821272+00	635	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/	1	new through import_export	8	1
2717	2018-12-25 11:35:09.823018+00	636	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/	1	new through import_export	8	1
2718	2018-12-25 11:35:09.824753+00	637	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	1	new through import_export	8	1
2719	2018-12-25 11:35:09.826585+00	638	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	1	new through import_export	8	1
2720	2018-12-25 11:35:09.82836+00	639	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	1	new through import_export	8	1
2721	2018-12-25 11:35:09.830116+00	640	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	1	new through import_export	8	1
2722	2018-12-25 11:35:09.832552+00	641	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	1	new through import_export	8	1
2723	2018-12-25 11:35:09.834581+00	642	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	1	new through import_export	8	1
2724	2018-12-25 11:35:09.836438+00	643	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/	1	new through import_export	8	1
2725	2018-12-25 11:35:09.838099+00	644	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/	1	new through import_export	8	1
2726	2018-12-25 11:35:09.839729+00	645	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/	1	new through import_export	8	1
2727	2018-12-25 11:35:09.841505+00	646	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/	1	new through import_export	8	1
2728	2018-12-25 11:35:09.843084+00	647	Маржа — комиссия букмекера с рынка ставок, которая закладывается в коэффициенты конторы. Подробнее здесь: https://bookmaker-ratings.ru/wiki/marzha/	1	new through import_export	8	1
2729	2018-12-25 11:35:09.844846+00	648	Маржа — комиссия букмекера с рынка ставок, которая закладывается в коэффициенты конторы. Подробнее здесь: https://bookmaker-ratings.ru/wiki/marzha/	1	new through import_export	8	1
2730	2018-12-25 11:35:09.846518+00	649	Маржа — комиссия букмекера с рынка ставок, которая закладывается в коэффициенты конторы. Подробнее здесь: https://bookmaker-ratings.ru/wiki/marzha/	1	new through import_export	8	1
2731	2018-12-25 11:35:09.848541+00	650	Система — разновидность ставок, представляющих собой несколько экспресс-ставок. Подобнее здесь: https://bookmaker-ratings.ru/wiki/sistema/	1	new through import_export	8	1
2732	2018-12-25 11:35:09.85044+00	651	Система — разновидность ставок, представляющих собой несколько экспресс-ставок. Подобнее здесь: https://bookmaker-ratings.ru/wiki/sistema/	1	new through import_export	8	1
2733	2018-12-25 11:35:09.852287+00	652	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugi	1	new through import_export	8	1
2734	2018-12-25 11:35:09.854169+00	653	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugi	1	new through import_export	8	1
2735	2018-12-25 11:35:09.856296+00	654	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugi	1	new through import_export	8	1
2736	2018-12-25 11:35:09.858076+00	655	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugi	1	new through import_export	8	1
2737	2018-12-25 11:35:09.859828+00	656	Букмекерские СРО (саморегулируемые организации букмекеров) — некоммерческие организации, объединяющие букмекерские конторы и тотализаторы в Российской Федерации. Подробнее здесь: https://bookmaker-rat	1	new through import_export	8	1
2738	2018-12-25 11:35:09.861654+00	657	Букмекерские СРО (саморегулируемые организации букмекеров) — некоммерческие организации, объединяющие букмекерские конторы и тотализаторы в Российской Федерации. Подробнее здесь: https://bookmaker-rat	1	new through import_export	8	1
2739	2018-12-25 11:35:09.86353+00	658	Материалы про интернет-издания с рейтингами букмекерских контор доступны здесь: https://bookmaker-ratings.ru/wiki-category/wiki-izdaniya-s-rejtingami/	1	new through import_export	8	1
2740	2018-12-25 11:35:09.865102+00	659	Материалы про интернет-издания с рейтингами букмекерских контор доступны здесь: https://bookmaker-ratings.ru/wiki-category/wiki-izdaniya-s-rejtingami/	1	new through import_export	8	1
2741	2018-12-25 11:35:09.866593+00	660	Сканеры вилок – это программы, сканирующие линию ставок многочисленных онлайн-букмекеров в режиме реального времени и определяющие арбитражные ситуации, известные также как букмекерские вилки. Подробн	1	new through import_export	8	1
2742	2018-12-25 11:35:09.868365+00	661	Сканеры вилок – это программы, сканирующие линию ставок многочисленных онлайн-букмекеров в режиме реального времени и определяющие арбитражные ситуации, известные также как букмекерские вилки. Подробн	1	new through import_export	8	1
2743	2018-12-25 11:35:09.870008+00	662	Мультиаккаунтинг – регистрация более одного счета на сайте букмекерской конторы, в том числе на поддельные или чужие паспортные данные. Подобнее здесь: https://bookmaker-ratings.ru/wiki/mul-tiakkaunti	1	new through import_export	8	1
2744	2018-12-25 11:35:09.871933+00	663	Мультиаккаунтинг – регистрация более одного счета на сайте букмекерской конторы, в том числе на поддельные или чужие паспортные данные. Подобнее здесь: https://bookmaker-ratings.ru/wiki/mul-tiakkaunti	1	new through import_export	8	1
2745	2018-12-25 11:35:09.873975+00	664	Верификация игрока — проверка игрока букмекерской конторой, в ходе которой компания устанавливает соответствие личности игрока указанным им паспортным данным, а также верифицирует другую информацию сч	1	new through import_export	8	1
2746	2018-12-25 11:35:09.87589+00	665	Верификация игрока — проверка игрока букмекерской конторой, в ходе которой компания устанавливает соответствие личности игрока указанным им паспортным данным, а также верифицирует другую информацию сч	1	new through import_export	8	1
2747	2018-12-25 11:35:09.877922+00	666	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все об	1	new through import_export	8	1
2748	2018-12-25 11:35:09.8799+00	667	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все об	1	new through import_export	8	1
2749	2018-12-25 11:35:09.881741+00	668	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все об	1	new through import_export	8	1
2750	2018-12-25 11:35:09.883415+00	669	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все об	1	new through import_export	8	1
2751	2018-12-25 11:35:09.885304+00	670	Имеется в виду получение выигрыша с оффшорной БК? В настоящий момент актуальной является не проблема получения крупной суммы, а возможность перевода из иностранных контор денег на карты российских бан	1	new through import_export	8	1
2752	2018-12-25 11:35:09.886941+00	671	Имеется в виду получение выигрыша с оффшорной БК? В настоящий момент актуальной является не проблема получения крупной суммы, а возможность перевода из иностранных контор денег на карты российских бан	1	new through import_export	8	1
2753	2018-12-25 11:35:09.888541+00	672	На деле, это распространенное правило, и действует оно в большинстве букмекерских контор. То, как и к кому применяется это правило, зависит от конкретного случая.	1	new through import_export	8	1
2754	2018-12-25 11:35:09.890273+00	673	На западе отсутствует понятие «регистрация». Адрес человека там, где он живет. За ваш адрес принимается указанный на выписке из банка или квитанции за коммунальный платеж.	1	new through import_export	8	1
2755	2018-12-25 11:35:09.891973+00	674	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.	1	new through import_export	8	1
2756	2018-12-25 11:35:09.893666+00	675	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.	1	new through import_export	8	1
2757	2018-12-25 11:35:09.895494+00	676	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.	1	new through import_export	8	1
2758	2018-12-25 11:35:09.897435+00	677	При условии, что все документы для проверки личности и адреса были вами предоставлены, вы должны отправлять в букмекерские конторы более 2500 евро в месяц.	1	new through import_export	8	1
2759	2018-12-25 11:35:09.899274+00	678	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профес	1	new through import_export	8	1
2760	2018-12-25 11:35:09.90089+00	679	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профес	1	new through import_export	8	1
2761	2018-12-25 11:35:09.902596+00	680	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профес	1	new through import_export	8	1
2762	2018-12-25 11:35:09.904315+00	681	На территории РФ блокируют сайты БК, у которых нет лицензии ФНС. Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=	1	new through import_export	8	1
2763	2018-12-25 11:35:09.906098+00	682	На территории РФ блокируют сайты БК, у которых нет лицензии ФНС. Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=	1	new through import_export	8	1
2764	2018-12-25 11:35:09.908034+00	683	На самом сайте минимум полезной информации о сути сделки и ее условиях. Никаких статистических данных для оцнки эффективности нет.  Также сотрудник этого ресурса уверял, что они имеют отношение к БК О	1	new through import_export	8	1
2765	2018-12-25 11:35:09.910093+00	684	Нет. Сроки перевода следует уточнить в банке или у сотрудников платежной системы, если вы отправили средства в банк из нее. Обычно это занимает 3-5 банковских дней.	1	new through import_export	8	1
2766	2018-12-25 11:35:09.912101+00	685	Обычно перевод осуществляется в тот же или на следующий день. В то же время, точный срок зависит от букмекерской конторы, клиентом которой вы являетесь.	1	new through import_export	8	1
2767	2018-12-25 11:35:09.913837+00	686	Обычно перевод осуществляется в тот же или на следующий день. В то же время, точный срок зависит от букмекерской конторы, клиентом которой вы являетесь.	1	new through import_export	8	1
2768	2018-12-25 11:35:09.915702+00	687	Ответ на этот вопрос зависит от того, о каком букмекере и о карте какого банка идет речь. Мы настоятельно рекомендуем использовать для этих целей Visa Classic, поскольку Electron предназначена в перву	1	new through import_export	8	1
2769	2018-12-25 11:35:09.917437+00	688	Перепроверь все еще раз. Понимаю что звучит глупо, но мне как то помогло то что я почистил кэш, cookie , историю в браузерах и потом получилось зайти. Попробуй проверить почту на которую регистрировал	1	new through import_export	8	1
2770	2018-12-25 11:35:09.919263+00	689	Перепроверь все еще раз. Понимаю что звучит глупо, но мне как то помогло то что я почистил кэш, cookie , историю в браузерах и потом получилось зайти. Попробуйте проверить почту на которую регистриров	1	new through import_export	8	1
2771	2018-12-25 11:35:09.921371+00	690	По правилам букмекерских контор, они не несут ответственности за предоставленную в лайве информацию, так как эти данные (счет матча, т.д.) получают от партнеров. Потому ставку не вернут.	1	new through import_export	8	1
2772	2018-12-25 11:35:09.923755+00	691	По правилам букмекерских контор, они не несут ответственности за предоставленную в лайве информацию, так как эти данные (счет матча, т.д.) получают от партнеров. Потому ставку не вернут.	1	new through import_export	8	1
2773	2018-12-25 11:35:09.925886+00	692	Подойдет общая выписка по счету, главное, чтобы в ней был указан ваш адрес – тот же, который вы указали при регистрации в выбранной вами платежной системе.	1	new through import_export	8	1
2774	2018-12-25 11:35:09.927823+00	693	При регистрации в зарубежных букмекерских конторах поля можно заполнить, использовав либо перевод, либо транслитерацию.	1	new through import_export	8	1
2775	2018-12-25 11:35:09.929426+00	694	Приложение РБ для Android доступно здесь: https://bookmaker-ratings.ru/android-app/	1	new through import_export	8	1
2776	2018-12-25 11:35:09.931077+00	695	Приложение РБ для Android доступно здесь: https://bookmaker-ratings.ru/android-app/	1	new through import_export	8	1
2777	2018-12-25 11:35:09.932921+00	696	Приложение РБ для iOS доступно здесь: https://itunes.apple.com/ru/app/рб-прогнозы-на-спорт/id1188607891?mt=8	1	new through import_export	8	1
2779	2018-12-25 11:35:09.93651+00	698	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.	1	new through import_export	8	1
2780	2018-12-25 11:35:09.93847+00	699	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.	1	new through import_export	8	1
2781	2018-12-25 11:35:09.940348+00	700	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.	1	new through import_export	8	1
2782	2018-12-25 11:35:09.942077+00	701	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.	1	new through import_export	8	1
2783	2018-12-25 11:35:09.944276+00	702	Из тех, которые могли бы порекомендовать: Marathonbet, Sbobet.	1	new through import_export	8	1
2784	2018-12-25 11:35:09.946265+00	703	Из тех, которые могли бы порекомендовать: Marathonbet, Sbobet.	1	new through import_export	8	1
2785	2018-12-25 11:35:09.94801+00	704	На мастер карт можно выводить через систему Ecommpay, максимальная сумма на одну транзакцию 15000 рублей. Советую пользоваться платежными системами Skrill или Neteller. Вывод через них намного быстрее	1	new through import_export	8	1
2786	2018-12-25 11:35:09.949901+00	705	У всех бывают серии неудач. Никто не заставляет ставить по мнению экспертов. Наоборот, если вы уверены в их убыточной стратегии, ставьте на противоположный исход. 	1	new through import_export	8	1
2787	2018-12-25 11:35:09.951761+00	706	У всех бывают серии неудач. Никто не заставляет ставить по мнению экспертов. Наоборот, если вы уверены в их убыточной стратегии, ставьте на противоположный исход. 	1	new through import_export	8	1
2788	2018-12-25 11:35:09.953482+00	707	У всех бывают серии неудач. Никто не заставляет ставить по мнению экспертов. Наоборот, если вы уверены в их убыточной стратегии, ставьте на противоположный исход. 	1	new through import_export	8	1
2789	2018-12-25 11:35:09.955535+00	708	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.	1	new through import_export	8	1
2790	2018-12-25 11:35:09.95796+00	709	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.	1	new through import_export	8	1
2791	2018-12-25 11:35:09.959943+00	710	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.	1	new through import_export	8	1
2792	2018-12-25 11:35:09.961617+00	711	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.	1	new through import_export	8	1
2793	2018-12-25 11:35:09.963282+00	712	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/	1	new through import_export	8	1
2794	2018-12-25 11:35:09.96495+00	713	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/	1	new through import_export	8	1
2795	2018-12-25 11:35:09.966754+00	714	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/	1	new through import_export	8	1
2796	2018-12-25 11:35:09.968524+00	715	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/	1	new through import_export	8	1
2797	2018-12-25 11:35:09.970264+00	716	У нас есть рейтинг букмекеров от пользователей – демонстрация настоящей демократии на «РБ». Мы никак не влияем на эти оценки. Только вы решаете, какое место займет контора: https://bookmaker-ratings.r	1	new through import_export	8	1
2798	2018-12-25 11:35:09.972034+00	717	У нас есть рейтинг букмекеров от пользователей – демонстрация настоящей демократии на «РБ». Мы никак не влияем на эти оценки. Только вы решаете, какое место займет контора: https://bookmaker-ratings.r	1	new through import_export	8	1
2799	2018-12-25 11:35:09.973854+00	718	Проходимость прогнозов не учитывается в рейтинге капперов. Мы оцениваем капперов по нашим  критериям: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/	1	new through import_export	8	1
2800	2018-12-25 11:35:09.975513+00	719	Проходимость прогнозов не учитывается в рейтинге капперов. Мы оцениваем капперов по нашим  критериям: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/	1	new through import_export	8	1
2801	2018-12-25 11:35:09.977373+00	720	Разумеется. Можно играть во всех существующих БК, никаких запретов на это нет. Учтите, мы рекомендуем играть только в тех конторах, которые имеют оценку «4» и «5» нашего рейтинга: https://bookmaker-ra	1	new through import_export	8	1
2825	2018-12-25 11:35:10.024098+00	744	Это зависит как от популярности события, так и от возможных ограничений (порезка максимумов), наложенных букмекерской конторой на ваш аккаунт.	1	new through import_export	8	1
2802	2018-12-25 11:35:09.979089+00	721	Разумеется. Можно играть во всех существующих БК, никаких запретов на это нет. Учтите, мы рекомендуем играть только в тех конторах, которые имеют оценку «4» и «5» нашего рейтинга: https://bookmaker-ra	1	new through import_export	8	1
2803	2018-12-25 11:35:09.980987+00	722	Режут максимальную ставку или вовсе могут заблокировать счет, если это прописано в правилах. Но профессиональные БК, которые не ограничивают размер максимальной ставки и не вводят другие санкции для и	1	new through import_export	8	1
2804	2018-12-25 11:35:09.983016+00	723	Режут максимальную ставку или вовсе могут заблокировать счет, если это прописано в правилах. Но профессиональные БК, которые не ограничивают размер максимальной ставки и не вводят другие санкции для и	1	new through import_export	8	1
2805	2018-12-25 11:35:09.984742+00	724	Самостоятельных ограничений нет. Но мы можем проверить пользователя на какие-либо нарушения с его стороны. Если Вы считаете, что пользователь нарушил правила,  то напишите, пожалуйста, на почту: suppo	1	new through import_export	8	1
2806	2018-12-25 11:35:09.986464+00	725	Скорее всего Вам придется пройти процедуру верификации после запроса на вывод средств. 	1	new through import_export	8	1
2807	2018-12-25 11:35:09.988435+00	726	Скорее всего вы не подтвердили свою почту. Вам должно были прислать письмо с подтверждением почты и только после подтверждения будут приходить прогнозы. 	1	new through import_export	8	1
2808	2018-12-25 11:35:09.990526+00	727	Скорее всего, вы пользуетесь разными почтовыми адресами, и разными соц сетями. Попробуйте зайти с другого профиля.	1	new through import_export	8	1
2809	2018-12-25 11:35:09.992602+00	728	Советуем изначально выбрать БК с русской версией и поддержкой на русском языке. Вы найдете список таких контор здесь: https://bookmaker-ratings.ru/rejting-bukmekerov/bukmekery-na-russkom/	1	new through import_export	8	1
2810	2018-12-25 11:35:09.994372+00	729	Ставки на страйк-ауты принимает Марафон и Бетсити	1	new through import_export	8	1
2811	2018-12-25 11:35:09.99614+00	730	Такие верификаторы есть. Их можно легко найти в поисковике. 	1	new through import_export	8	1
2812	2018-12-25 11:35:09.998397+00	731	Такие сайты есть. Воспользуйтесь поисковиком для их нахождения. Также можно обратиться к стандартным инструментам "Эксель".	1	new through import_export	8	1
2813	2018-12-25 11:35:10.000381+00	732	Только если у вас есть все документы на эти номера, и вы можете подтвердить что вы являетесь их владельцем. Обратитесь в поддержку букмекера.	1	new through import_export	8	1
2814	2018-12-25 11:35:10.002326+00	733	У каждой конторы свои правила расчета карточек. Кто-то красную за две желтых считает, то есть как два очка, грубо говоря. И неважно, прямая она или нет. А кто-то вообще даже две ЖК повлекшие удаление 	1	new through import_export	8	1
2815	2018-12-25 11:35:10.004405+00	734	Удобнее всего найти подробную информацию по данным лигам можно на сайтах этих самых лиг и их представительствах в социальных сетях. Особо обширно лиги и команды низших дивизионов представлены в Twitte	1	new through import_export	8	1
2816	2018-12-25 11:35:10.006133+00	735	Указанная Вами БК не работает в рамках российского законодательства, поэтому и блокируется Роскомнадзором. Мы, в свою очередь, не имеем права размещать на своем сайте ссылки, которые ведут на запрещен	1	new through import_export	8	1
2817	2018-12-25 11:35:10.008027+00	736	Уточните, пожалуйста, данный вопрос у службы поддержки БК.	1	new through import_export	8	1
2818	2018-12-25 11:35:10.010082+00	737	Уточните, пожалуйста, данный вопрос у службы поддержки БК.	1	new through import_export	8	1
2819	2018-12-25 11:35:10.012503+00	738	Учетная запись через соцсеть тоже может принимать участие в конкурсе - необходимо просто нажать на соответствующую кнопку на этой странице   	1	new through import_export	8	1
2820	2018-12-25 11:35:10.014748+00	739	Во многих БК для вывода денег без комиссии необходимо проставить сумму депозита. Подробности лучше уточнить в службе поддержки БК.	1	new through import_export	8	1
2821	2018-12-25 11:35:10.016528+00	740	Чтобы начать пользоваться всеми возможностями Skrill, нужно пройти процедуру верификации. Для верификации счета вам потребуется отсканировать и послать документы, подтверждающие вашу личность и адрес.	1	new through import_export	8	1
2822	2018-12-25 11:35:10.018469+00	741	Чтобы узнать, какие БК и какой бонус предлагают, зайдите в наш рейтинг букмекерских контор и выберите «Упорядочить по бонусу». Детальная информация о бонусе указана в обзорах букмекеров.	1	new through import_export	8	1
2823	2018-12-25 11:35:10.020325+00	742	Эти деньги попали на ваш счет в Skrill. Вы с ними можете делать что захотите.  	1	new through import_export	8	1
2824	2018-12-25 11:35:10.022185+00	743	Это два разных сайта. Если вы просто не можете зайти на сайт, воспользуйтесь одним из средств обхода блокировки, описанных в сети.	1	new through import_export	8	1
2826	2018-12-25 11:35:10.02625+00	745	Это любой другой счет, который не указан в росписи, обычно ставка выигрывает, когда одна из команд забивает как минимум 4 гола. Это что касается футбола.	1	new through import_export	8	1
2827	2018-12-25 11:35:10.028163+00	746	Это можно сделать при помощи банковского перевода или кредитной карточки.	1	new through import_export	8	1
2828	2018-12-25 11:35:10.030137+00	747	Это мультиаккаунтинг. Контора имеет право Вас заблокировать. 	1	new through import_export	8	1
2829	2018-12-25 11:35:10.032419+00	748	Биржи ставок отличаются от букмекерских контор тем, что игроки делают ставки не против букмекера, а друг против друга: https://bookmaker-ratings.ru/bookmakers-homepage/birzhi-stavok/	1	new through import_export	8	1
2830	2018-12-25 11:35:10.034371+00	749	Биржи ставок отличаются от букмекерских контор тем, что игроки делают ставки не против букмекера, а друг против друга: https://bookmaker-ratings.ru/bookmakers-homepage/birzhi-stavok/	1	new through import_export	8	1
2831	2018-12-25 11:35:10.03664+00	750	Я-бот. Я отвечаю только на вопросы, связанные с РБ	1	new through import_export	8	1
2832	2018-12-25 11:35:10.038618+00	751	Я-бот. Я отвечаю только на вопросы, связанные с РБ	1	new through import_export	8	1
2833	2018-12-25 11:35:10.040801+00	752	Я-бот. Я отвечаю только на вопросы, связанные с РБ	1	new through import_export	8	1
2834	2018-12-25 11:35:10.042801+00	753	Я-бот. Я отвечаю только на вопросы, связанные с РБ	1	new through import_export	8	1
2835	2018-12-25 11:35:10.045032+00	754	Я-бот. Я отвечаю только на вопросы, связанные с РБ	1	new through import_export	8	1
2836	2018-12-25 11:35:10.047222+00	755	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	1	new through import_export	8	1
2837	2018-12-25 11:35:10.048825+00	756	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	1	new through import_export	8	1
2838	2018-12-25 11:35:10.050485+00	757	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	1	new through import_export	8	1
2839	2018-12-25 11:35:10.052493+00	758	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	1	new through import_export	8	1
2840	2018-12-25 11:35:10.054306+00	759	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	1	new through import_export	8	1
2841	2018-12-25 11:35:10.056096+00	760	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	1	new through import_export	8	1
2842	2018-12-25 11:35:10.058021+00	761	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	1	new through import_export	8	1
2843	2018-12-25 11:35:10.059903+00	762	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	1	new through import_export	8	1
2844	2018-12-25 11:35:10.061814+00	763	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	1	new through import_export	8	1
2845	2018-12-25 11:46:36.822549+00	0	Зайдите в свой профиль и нажмите на вкладку "Дать прогноз" или перейдите по ссылке: https://bookmaker-ratings.ru/tribune/add-tip/	2	update through import_export	8	1
2846	2018-12-25 11:46:36.82572+00	0	Зайдите в свой профиль и нажмите на вкладку "Дать прогноз" или перейдите по ссылке: https://bookmaker-ratings.ru/tribune/add-tip/	2	update through import_export	8	1
2847	2018-12-25 11:46:36.828031+00	0	Зайдите в свой профиль и нажмите на вкладку "Дать прогноз" или перейдите по ссылке: https://bookmaker-ratings.ru/tribune/add-tip/	2	update through import_export	8	1
2848	2018-12-25 11:46:36.830614+00	0	Зайдите в свой профиль и нажмите на вкладку "Дать прогноз" или перейдите по ссылке: https://bookmaker-ratings.ru/tribune/add-tip/	2	update through import_export	8	1
2849	2018-12-25 11:46:36.833475+00	1	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2850	2018-12-25 11:46:36.835431+00	1	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2851	2018-12-25 11:46:36.837145+00	1	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2852	2018-12-25 11:46:36.838808+00	1	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2853	2018-12-25 11:46:36.841072+00	1	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2854	2018-12-25 11:46:36.842497+00	1	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модерато	2	update through import_export	8	1
2855	2018-12-25 11:46:36.844168+00	2	Условная сумма каждой ставки — 1000 рублей. Подробнее: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
2856	2018-12-25 11:46:36.845589+00	2	Условная сумма каждой ставки — 1000 рублей. Подробнее: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
2857	2018-12-25 11:46:36.847281+00	2	Условная сумма каждой ставки — 1000 рублей. Подробнее: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
2858	2018-12-25 11:46:36.8488+00	3	Вы можете разместить не более трёх ставок в одном материале. 	2	update through import_export	8	1
2859	2018-12-25 11:46:36.850648+00	3	Вы можете разместить не более трёх ставок в одном материале. 	2	update through import_export	8	1
2860	2018-12-25 11:46:36.852455+00	3	Вы можете разместить не более трёх ставок в одном материале. 	2	update through import_export	8	1
2861	2018-12-25 11:46:36.854024+00	3	Вы можете разместить не более трёх ставок в одном материале. 	2	update through import_export	8	1
2862	2018-12-25 11:46:36.855837+00	4	Вы можете добавить видео к описанию прогноза, вставив ссылку в соответствующее поле. В описании вашего видео на Youtube обязательно должна быть ссылка на «Рейтинг Букмекеров». Текстовая часть прогноза	2	update through import_export	8	1
2863	2018-12-25 11:46:36.857807+00	4	Вы можете добавить видео к описанию прогноза, вставив ссылку в соответствующее поле. В описании вашего видео на Youtube обязательно должна быть ссылка на «Рейтинг Букмекеров». Текстовая часть прогноза	2	update through import_export	8	1
2864	2018-12-25 11:46:36.859792+00	4	Вы можете добавить видео к описанию прогноза, вставив ссылку в соответствующее поле. В описании вашего видео на Youtube обязательно должна быть ссылка на «Рейтинг Букмекеров». Текстовая часть прогноза	2	update through import_export	8	1
2865	2018-12-25 11:46:36.86178+00	4	Вы можете добавить видео к описанию прогноза, вставив ссылку в соответствующее поле. В описании вашего видео на Youtube обязательно должна быть ссылка на «Рейтинг Букмекеров». Текстовая часть прогноза	2	update through import_export	8	1
2866	2018-12-25 11:46:36.863428+00	5	При публикации прогноза в поле "Тип ставки" необходимо выбрать "Экспресс". Затем нужно добавить необходимое количество исходов, нажав кнопку "Добавить событие".	2	update through import_export	8	1
2867	2018-12-25 11:46:36.865006+00	5	При публикации прогноза в поле "Тип ставки" необходимо выбрать "Экспресс". Затем нужно добавить необходимое количество исходов, нажав кнопку "Добавить событие".	2	update through import_export	8	1
2868	2018-12-25 11:46:36.866636+00	6	Напишите, пожалуйста, нам на почту (support@bookmaker-ratings.ru), указав названия команд. Также Вы можете выбрать вид спорта "Другие" и самостоятельноо заполнить все поля прогноза.	2	update through import_export	8	1
2869	2018-12-25 11:46:36.871567+00	6	Напишите, пожалуйста, нам на почту (support@bookmaker-ratings.ru), указав названия команд. Также Вы можете выбрать вид спорта "Другие" и самостоятельноо заполнить все поля прогноза.	2	update through import_export	8	1
2870	2018-12-25 11:46:36.873633+00	7	Картинка должна иметь отношение к событию в прогнозе. Идеальные параметры — 760?480 или хотя бы что-то около того.	2	update through import_export	8	1
2871	2018-12-25 11:46:36.87527+00	7	Картинка должна иметь отношение к событию в прогнозе. Идеальные параметры — 760?480 или хотя бы что-то около того.	2	update through import_export	8	1
2872	2018-12-25 11:46:36.876846+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2873	2018-12-25 11:46:36.878276+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2874	2018-12-25 11:46:36.879764+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2875	2018-12-25 11:46:36.881214+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
3009	2018-12-25 11:46:37.120431+00	31	Статистику прогнозов нашей команды экспертов можно найти здесь: https://bookmaker-ratings.ru/infographics-template/tips_stats/	2	update through import_export	8	1
2876	2018-12-25 11:46:36.882698+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2877	2018-12-25 11:46:36.884724+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2878	2018-12-25 11:46:36.886165+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2879	2018-12-25 11:46:36.88784+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2880	2018-12-25 11:46:36.889566+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2881	2018-12-25 11:46:36.891259+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2882	2018-12-25 11:46:36.893133+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2883	2018-12-25 11:46:36.89483+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2884	2018-12-25 11:46:36.896832+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2885	2018-12-25 11:46:36.898755+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2886	2018-12-25 11:46:36.900732+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2887	2018-12-25 11:46:36.902394+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2888	2018-12-25 11:46:36.903936+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2889	2018-12-25 11:46:36.905645+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2890	2018-12-25 11:46:36.907219+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2891	2018-12-25 11:46:36.908764+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2892	2018-12-25 11:46:36.910236+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2893	2018-12-25 11:46:36.911832+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2894	2018-12-25 11:46:36.913453+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2895	2018-12-25 11:46:36.915159+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2896	2018-12-25 11:46:36.916744+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2897	2018-12-25 11:46:36.918097+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2898	2018-12-25 11:46:36.919603+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2899	2018-12-25 11:46:36.921155+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2900	2018-12-25 11:46:36.922921+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2901	2018-12-25 11:46:36.92454+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2902	2018-12-25 11:46:36.926082+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2903	2018-12-25 11:46:36.92777+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2904	2018-12-25 11:46:36.929621+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2905	2018-12-25 11:46:36.931442+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2906	2018-12-25 11:46:36.933783+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2907	2018-12-25 11:46:36.935995+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2908	2018-12-25 11:46:36.937859+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2909	2018-12-25 11:46:36.939871+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2910	2018-12-25 11:46:36.941814+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2911	2018-12-25 11:46:36.943469+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2912	2018-12-25 11:46:36.945215+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2913	2018-12-25 11:46:36.946781+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2914	2018-12-25 11:46:36.948474+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2915	2018-12-25 11:46:36.950213+00	8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu	2	update through import_export	8	1
2916	2018-12-25 11:46:36.952023+00	9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2917	2018-12-25 11:46:36.953993+00	9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2918	2018-12-25 11:46:36.956013+00	9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2919	2018-12-25 11:46:36.957729+00	9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2920	2018-12-25 11:46:36.959531+00	9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2921	2018-12-25 11:46:36.961409+00	9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2922	2018-12-25 11:46:36.963155+00	9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2923	2018-12-25 11:46:36.965063+00	9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2924	2018-12-25 11:46:36.966741+00	9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2925	2018-12-25 11:46:36.968364+00	9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются ув	2	update through import_export	8	1
2926	2018-12-25 11:46:36.969991+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2927	2018-12-25 11:46:36.971644+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2928	2018-12-25 11:46:36.973341+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2929	2018-12-25 11:46:36.975134+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2930	2018-12-25 11:46:36.977096+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2931	2018-12-25 11:46:36.978881+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2932	2018-12-25 11:46:36.98074+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2933	2018-12-25 11:46:36.982585+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2934	2018-12-25 11:46:36.984288+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2935	2018-12-25 11:46:36.985926+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2936	2018-12-25 11:46:36.987643+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2937	2018-12-25 11:46:36.989377+00	10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00	2	update through import_export	8	1
2938	2018-12-25 11:46:36.991354+00	11	 Если Вы принимаете участие в конкурсе, выбор букмекера при размещении прогноза недоступен.	2	update through import_export	8	1
2939	2018-12-25 11:46:36.993091+00	11	 Если Вы принимаете участие в конкурсе, выбор букмекера при размещении прогноза недоступен.	2	update through import_export	8	1
2940	2018-12-25 11:46:36.995173+00	11	 Если Вы принимаете участие в конкурсе, выбор букмекера при размещении прогноза недоступен.	2	update through import_export	8	1
2941	2018-12-25 11:46:36.997205+00	12	Прогнозы на РБ рассчитываются в соответствии с правилами БК, которую вы выбираете при публикации прогноза. Если где-то закралась ошибка, укажите об этом в комментарии к самому прогнозу. 	2	update through import_export	8	1
2942	2018-12-25 11:46:36.999018+00	12	Прогнозы на РБ рассчитываются в соответствии с правилами БК, которую вы выбираете при публикации прогноза. Если где-то закралась ошибка, укажите об этом в комментарии к самому прогнозу. 	2	update through import_export	8	1
2943	2018-12-25 11:46:37.001064+00	13	Пожалуйста, напишите об этом непосредственно в комментариях к прогнозу.	2	update through import_export	8	1
2944	2018-12-25 11:46:37.003207+00	13	Пожалуйста, напишите об этом непосредственно в комментариях к прогнозу.	2	update through import_export	8	1
2945	2018-12-25 11:46:37.005044+00	13	Пожалуйста, напишите об этом непосредственно в комментариях к прогнозу.	2	update through import_export	8	1
2946	2018-12-25 11:46:37.007152+00	13	Пожалуйста, напишите об этом непосредственно в комментариях к прогнозу.	2	update through import_export	8	1
2947	2018-12-25 11:46:37.009042+00	14	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
2948	2018-12-25 11:46:37.010876+00	14	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
2949	2018-12-25 11:46:37.012744+00	14	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
2950	2018-12-25 11:46:37.01459+00	14	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. О	2	update through import_export	8	1
2951	2018-12-25 11:46:37.016467+00	15	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Но если Ваша статистика будет действительно впечатляющей, 	2	update through import_export	8	1
2952	2018-12-25 11:46:37.018361+00	15	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Но если Ваша статистика будет действительно впечатляющей, 	2	update through import_export	8	1
2953	2018-12-25 11:46:37.020188+00	15	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Но если Ваша статистика будет действительно впечатляющей, 	2	update through import_export	8	1
2954	2018-12-25 11:46:37.022108+00	15	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Но если Ваша статистика будет действительно впечатляющей, 	2	update through import_export	8	1
2955	2018-12-25 11:46:37.024185+00	16	Мой профиль, вкладка "Прогнозы".	2	update through import_export	8	1
2956	2018-12-25 11:46:37.026073+00	16	Мой профиль, вкладка "Прогнозы".	2	update through import_export	8	1
2957	2018-12-25 11:46:37.027805+00	17	Мой профиль, вкладка "Статистика".	2	update through import_export	8	1
2958	2018-12-25 11:46:37.029319+00	17	Мой профиль, вкладка "Статистика".	2	update through import_export	8	1
2959	2018-12-25 11:46:37.031099+00	18	Перейдите в профиль интересующего вас каппера и выберите вкладку "Статистика".	2	update through import_export	8	1
2960	2018-12-25 11:46:37.033636+00	18	Перейдите в профиль интересующего вас каппера и выберите вкладку "Статистика".	2	update through import_export	8	1
2961	2018-12-25 11:46:37.036009+00	18	Перейдите в профиль интересующего вас каппера и выберите вкладку "Статистика".	2	update through import_export	8	1
2962	2018-12-25 11:46:37.037821+00	18	Перейдите в профиль интересующего вас каппера и выберите вкладку "Статистика".	2	update through import_export	8	1
2963	2018-12-25 11:46:37.04017+00	19	Мой профиль, вкладка "Подписки".	2	update through import_export	8	1
2964	2018-12-25 11:46:37.042157+00	19	Мой профиль, вкладка "Подписки".	2	update through import_export	8	1
2965	2018-12-25 11:46:37.043994+00	20	Количество подписанных на Вас пользователей можно посмотреть в своём профиле, вкладка "Подписчики".	2	update through import_export	8	1
2966	2018-12-25 11:46:37.045851+00	20	Количество подписанных на Вас пользователей можно посмотреть в своём профиле, вкладка "Подписчики".	2	update through import_export	8	1
2967	2018-12-25 11:46:37.047734+00	20	Количество подписанных на Вас пользователей можно посмотреть в своём профиле, вкладка "Подписчики".	2	update through import_export	8	1
2968	2018-12-25 11:46:37.050434+00	20	Количество подписанных на Вас пользователей можно посмотреть в своём профиле, вкладка "Подписчики".	2	update through import_export	8	1
2969	2018-12-25 11:46:37.052222+00	21	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2970	2018-12-25 11:46:37.053818+00	21	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2971	2018-12-25 11:46:37.055489+00	21	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2972	2018-12-25 11:46:37.057053+00	21	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2973	2018-12-25 11:46:37.058726+00	21	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2974	2018-12-25 11:46:37.060313+00	21	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.	2	update through import_export	8	1
2975	2018-12-25 11:46:37.061672+00	22	Заходите в "Настойки профиля", выбираете вкладку "Интересы". Конторы в которых Вы играете отмечены цветным логотипом, а в которых не играете - черно-белым.	2	update through import_export	8	1
2976	2018-12-25 11:46:37.063606+00	22	Заходите в "Настойки профиля", выбираете вкладку "Интересы". Конторы в которых Вы играете отмечены цветным логотипом, а в которых не играете - черно-белым.	2	update through import_export	8	1
2977	2018-12-25 11:46:37.065059+00	23	Выберите вкладку "Уведомления" в выпадающем меню профиля.	2	update through import_export	8	1
2978	2018-12-25 11:46:37.066684+00	23	Выберите вкладку "Уведомления" в выпадающем меню профиля.	2	update through import_export	8	1
2979	2018-12-25 11:46:37.068368+00	24	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.	2	update through import_export	8	1
2980	2018-12-25 11:46:37.069834+00	24	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.	2	update through import_export	8	1
2981	2018-12-25 11:46:37.071441+00	24	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.	2	update through import_export	8	1
2982	2018-12-25 11:46:37.072942+00	24	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.	2	update through import_export	8	1
2983	2018-12-25 11:46:37.074285+00	24	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.	2	update through import_export	8	1
3010	2018-12-25 11:46:37.122095+00	32	Вы можете увидеть 12 лучших капперов "Трибуны" за последние 30 дней здесь: https://bookmaker-ratings.ru/tribune/	2	update through import_export	8	1
2984	2018-12-25 11:46:37.075659+00	25	Комментарий может быть удален по причине наличия спама, оскорблений, мата, откровенного обмана, рекламы или запрещенных ссылок.  	2	update through import_export	8	1
2985	2018-12-25 11:46:37.077364+00	25	Комментарий может быть удален по причине наличия спама, оскорблений, мата, откровенного обмана, рекламы или запрещенных ссылок.  	2	update through import_export	8	1
2986	2018-12-25 11:46:37.07893+00	25	Комментарий может быть удален по причине наличия спама, оскорблений, мата, откровенного обмана, рекламы или запрещенных ссылок.  	2	update through import_export	8	1
2987	2018-12-25 11:46:37.08126+00	26	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  	2	update through import_export	8	1
2988	2018-12-25 11:46:37.082736+00	26	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  	2	update through import_export	8	1
2989	2018-12-25 11:46:37.084078+00	26	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  	2	update through import_export	8	1
2990	2018-12-25 11:46:37.085487+00	26	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  	2	update through import_export	8	1
2991	2018-12-25 11:46:37.08773+00	26	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  	2	update through import_export	8	1
2992	2018-12-25 11:46:37.089373+00	27	Вы можете редактировать отзыв, выбрав его во вкладке "Отзывы" Вашего профиля. Учтите, измененный отзыв вновь проходит модерацию.	2	update through import_export	8	1
2993	2018-12-25 11:46:37.090756+00	27	Вы можете редактировать отзыв, выбрав его во вкладке "Отзывы" Вашего профиля. Учтите, измененный отзыв вновь проходит модерацию.	2	update through import_export	8	1
2994	2018-12-25 11:46:37.092506+00	28	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2995	2018-12-25 11:46:37.094282+00	28	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2996	2018-12-25 11:46:37.096052+00	28	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2997	2018-12-25 11:46:37.097906+00	28	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2998	2018-12-25 11:46:37.099609+00	28	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
2999	2018-12-25 11:46:37.101918+00	28	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
3000	2018-12-25 11:46:37.10392+00	28	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете н	2	update through import_export	8	1
3001	2018-12-25 11:46:37.105755+00	29	Ежегодно мы разыгрываем место в команде экспертов РБ. Следите за конкусами и побеждайте в них.	2	update through import_export	8	1
3002	2018-12-25 11:46:37.1079+00	29	Ежегодно мы разыгрываем место в команде экспертов РБ. Следите за конкусами и побеждайте в них.	2	update through import_export	8	1
3003	2018-12-25 11:46:37.109714+00	29	Ежегодно мы разыгрываем место в команде экспертов РБ. Следите за конкусами и побеждайте в них.	2	update through import_export	8	1
3004	2018-12-25 11:46:37.111519+00	30	Методика подсчета прибыли/убытка очень проста: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
3005	2018-12-25 11:46:37.113153+00	30	Методика подсчета прибыли/убытка очень проста: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
3006	2018-12-25 11:46:37.114883+00	30	Методика подсчета прибыли/убытка очень проста: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
3007	2018-12-25 11:46:37.116374+00	30	Методика подсчета прибыли/убытка очень проста: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/	2	update through import_export	8	1
3008	2018-12-25 11:46:37.118427+00	31	Статистику прогнозов нашей команды экспертов можно найти здесь: https://bookmaker-ratings.ru/infographics-template/tips_stats/	2	update through import_export	8	1
3117	2018-12-25 11:46:37.32009+00	53	Можно привязать карту платежной системы, например, Skrill. 	2	update through import_export	8	1
3011	2018-12-25 11:46:37.123897+00	32	Вы можете увидеть 12 лучших капперов "Трибуны" за последние 30 дней здесь: https://bookmaker-ratings.ru/tribune/	2	update through import_export	8	1
3012	2018-12-25 11:46:37.125986+00	33	В ротаторе показаны 12 спортивных прогнозистов «Трибуны», которые были лучшими за последний месяц по статистике прогнозов, допущенных на главную страницу раздела (среди написавших более 4 прогнозов).	2	update through import_export	8	1
3013	2018-12-25 11:46:37.127663+00	33	В ротаторе показаны 12 спортивных прогнозистов «Трибуны», которые были лучшими за последний месяц по статистике прогнозов, допущенных на главную страницу раздела (среди написавших более 4 прогнозов).	2	update through import_export	8	1
3014	2018-12-25 11:46:37.129871+00	34	Аргументированость прогнозов и хорошая статистика заметно увеличивают количество подписчиков. 	2	update through import_export	8	1
3015	2018-12-25 11:46:37.131666+00	34	Аргументированость прогнозов и хорошая статистика заметно увеличивают количество подписчиков. 	2	update through import_export	8	1
3016	2018-12-25 11:46:37.133572+00	34	Аргументированость прогнозов и хорошая статистика заметно увеличивают количество подписчиков. 	2	update through import_export	8	1
3017	2018-12-25 11:46:37.135373+00	35	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru	2	update through import_export	8	1
3018	2018-12-25 11:46:37.137549+00	35	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru	2	update through import_export	8	1
3019	2018-12-25 11:46:37.139605+00	35	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru	2	update through import_export	8	1
3020	2018-12-25 11:46:37.141522+00	35	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru	2	update through import_export	8	1
3021	2018-12-25 11:46:37.143567+00	36	На главной странице РБ размещаются только прогнозы экспертов. Для капперских прогнозов есть раздел "Трибуна". 	2	update through import_export	8	1
3022	2018-12-25 11:46:37.14557+00	36	На главной странице РБ размещаются только прогнозы экспертов. Для капперских прогнозов есть раздел "Трибуна". 	2	update through import_export	8	1
3023	2018-12-25 11:46:37.147175+00	37	Мы не рассчитываем прогнозы, которые не попали на главную страницу "Трибуны" и не участвуют в конкурсе.	2	update through import_export	8	1
3024	2018-12-25 11:46:37.149083+00	37	Мы не рассчитываем прогнозы, которые не попали на главную страницу "Трибуны" и не участвуют в конкурсе.	2	update through import_export	8	1
3025	2018-12-25 11:46:37.15071+00	38	При размещении прогноза в выпадающем меню поля "Букмекер" доступны только лучшие зарубежные конторы и БК, имеющие лицензию ФНС.   	2	update through import_export	8	1
3026	2018-12-25 11:46:37.152315+00	38	При размещении прогноза в выпадающем меню поля "Букмекер" доступны только лучшие зарубежные конторы и БК, имеющие лицензию ФНС.   	2	update through import_export	8	1
3027	2018-12-25 11:46:37.153941+00	39	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
3028	2018-12-25 11:46:37.155549+00	39	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
3029	2018-12-25 11:46:37.157515+00	39	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
3030	2018-12-25 11:46:37.159356+00	39	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
3031	2018-12-25 11:46:37.161194+00	39	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
3032	2018-12-25 11:46:37.16275+00	39	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
3033	2018-12-25 11:46:37.164421+00	39	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
3034	2018-12-25 11:46:37.166731+00	39	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/	2	update through import_export	8	1
3035	2018-12-25 11:46:37.168679+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3036	2018-12-25 11:46:37.170289+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3037	2018-12-25 11:46:37.1719+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3038	2018-12-25 11:46:37.173508+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3039	2018-12-25 11:46:37.175067+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3040	2018-12-25 11:46:37.17685+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3041	2018-12-25 11:46:37.178639+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3042	2018-12-25 11:46:37.180414+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3043	2018-12-25 11:46:37.181921+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3044	2018-12-25 11:46:37.183429+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3045	2018-12-25 11:46:37.185156+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3046	2018-12-25 11:46:37.187029+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3047	2018-12-25 11:46:37.188762+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3048	2018-12-25 11:46:37.190621+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3049	2018-12-25 11:46:37.192498+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3050	2018-12-25 11:46:37.194111+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3051	2018-12-25 11:46:37.195823+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3052	2018-12-25 11:46:37.197481+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3053	2018-12-25 11:46:37.199221+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3054	2018-12-25 11:46:37.201261+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3055	2018-12-25 11:46:37.203314+00	40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3056	2018-12-25 11:46:37.2052+00	41	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.	2	update through import_export	8	1
3057	2018-12-25 11:46:37.206889+00	41	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.	2	update through import_export	8	1
3058	2018-12-25 11:46:37.208449+00	41	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.	2	update through import_export	8	1
3059	2018-12-25 11:46:37.210018+00	41	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.	2	update through import_export	8	1
3060	2018-12-25 11:46:37.211851+00	42	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.	2	update through import_export	8	1
3061	2018-12-25 11:46:37.213552+00	42	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.	2	update through import_export	8	1
3062	2018-12-25 11:46:37.215104+00	42	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.	2	update through import_export	8	1
3063	2018-12-25 11:46:37.216815+00	42	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.	2	update through import_export	8	1
3064	2018-12-25 11:46:37.218401+00	42	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.	2	update through import_export	8	1
3065	2018-12-25 11:46:37.219993+00	43	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 	2	update through import_export	8	1
3066	2018-12-25 11:46:37.221822+00	43	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 	2	update through import_export	8	1
3067	2018-12-25 11:46:37.224015+00	43	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 	2	update through import_export	8	1
3068	2018-12-25 11:46:37.225778+00	43	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 	2	update through import_export	8	1
3069	2018-12-25 11:46:37.227465+00	44	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic	2	update through import_export	8	1
3070	2018-12-25 11:46:37.229365+00	44	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic	2	update through import_export	8	1
3071	2018-12-25 11:46:37.231197+00	44	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic	2	update through import_export	8	1
3072	2018-12-25 11:46:37.233342+00	44	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic	2	update through import_export	8	1
3073	2018-12-25 11:46:37.235281+00	45	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
3074	2018-12-25 11:46:37.237097+00	45	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
3075	2018-12-25 11:46:37.239162+00	45	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
3076	2018-12-25 11:46:37.242209+00	45	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
3077	2018-12-25 11:46:37.244925+00	45	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
3078	2018-12-25 11:46:37.246931+00	45	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
3079	2018-12-25 11:46:37.248794+00	45	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
3080	2018-12-25 11:46:37.25041+00	45	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.	2	update through import_export	8	1
3081	2018-12-25 11:46:37.252072+00	46	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
3082	2018-12-25 11:46:37.253889+00	46	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
3083	2018-12-25 11:46:37.255596+00	46	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
3084	2018-12-25 11:46:37.257744+00	46	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
3085	2018-12-25 11:46:37.259783+00	46	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
3086	2018-12-25 11:46:37.261851+00	46	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
3087	2018-12-25 11:46:37.264081+00	46	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
3088	2018-12-25 11:46:37.266153+00	46	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
3089	2018-12-25 11:46:37.26862+00	46	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/	2	update through import_export	8	1
3090	2018-12-25 11:46:37.270815+00	47	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских контор	2	update through import_export	8	1
3091	2018-12-25 11:46:37.272619+00	47	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских контор	2	update through import_export	8	1
3092	2018-12-25 11:46:37.274556+00	47	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских контор	2	update through import_export	8	1
3093	2018-12-25 11:46:37.276557+00	48	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.	2	update through import_export	8	1
3094	2018-12-25 11:46:37.278441+00	48	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.	2	update through import_export	8	1
3095	2018-12-25 11:46:37.280004+00	48	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.	2	update through import_export	8	1
3096	2018-12-25 11:46:37.282573+00	48	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.	2	update through import_export	8	1
3097	2018-12-25 11:46:37.284749+00	49	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
3098	2018-12-25 11:46:37.286449+00	49	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
3099	2018-12-25 11:46:37.288642+00	49	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
3100	2018-12-25 11:46:37.290363+00	49	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
3101	2018-12-25 11:46:37.291816+00	49	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
3102	2018-12-25 11:46:37.293264+00	49	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
3103	2018-12-25 11:46:37.294707+00	49	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
3104	2018-12-25 11:46:37.296178+00	49	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
3105	2018-12-25 11:46:37.297864+00	49	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!	2	update through import_export	8	1
3106	2018-12-25 11:46:37.299672+00	50	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	2	update through import_export	8	1
3107	2018-12-25 11:46:37.301579+00	50	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	2	update through import_export	8	1
3108	2018-12-25 11:46:37.303783+00	50	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если 	2	update through import_export	8	1
3109	2018-12-25 11:46:37.305844+00	50	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы. Если	2	update through import_export	8	1
3110	2018-12-25 11:46:37.307741+00	51	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  	2	update through import_export	8	1
3111	2018-12-25 11:46:37.309424+00	51	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  	2	update through import_export	8	1
3112	2018-12-25 11:46:37.311413+00	51	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  	2	update through import_export	8	1
3113	2018-12-25 11:46:37.313355+00	51	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  	2	update through import_export	8	1
3114	2018-12-25 11:46:37.314827+00	52	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 	2	update through import_export	8	1
3115	2018-12-25 11:46:37.316453+00	52	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 	2	update through import_export	8	1
3116	2018-12-25 11:46:37.318157+00	52	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 	2	update through import_export	8	1
3119	2018-12-25 11:46:37.323848+00	53	Можно привязать карту платежной системы, например, Skrill. 	2	update through import_export	8	1
3120	2018-12-25 11:46:37.325538+00	53	Можно привязать карту платежной системы, например, Skrill. 	2	update through import_export	8	1
3121	2018-12-25 11:46:37.326928+00	54	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/	2	update through import_export	8	1
3122	2018-12-25 11:46:37.328329+00	54	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/	2	update through import_export	8	1
3123	2018-12-25 11:46:37.329779+00	54	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/	2	update through import_export	8	1
3124	2018-12-25 11:46:37.331157+00	54	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/	2	update through import_export	8	1
3125	2018-12-25 11:46:37.332767+00	55	Методы пополнения/вывода средств доступны в обзоре БК	2	update through import_export	8	1
3126	2018-12-25 11:46:37.334434+00	55	Методы пополнения/вывода средств доступны в обзоре БК	2	update through import_export	8	1
3127	2018-12-25 11:46:37.336272+00	55	Методы пополнения/вывода средств доступны в обзоре БК	2	update through import_export	8	1
3128	2018-12-25 11:46:37.338055+00	55	Методы пополнения/вывода средств доступны в обзоре БК	2	update through import_export	8	1
3129	2018-12-25 11:46:37.339723+00	55	Методы пополнения/вывода средств доступны в обзоре БК	2	update through import_export	8	1
3130	2018-12-25 11:46:37.341954+00	55	Методы пополнения/вывода средств доступны в обзоре БК	2	update through import_export	8	1
3131	2018-12-25 11:46:37.344333+00	56	Информация о лицензии доступна в обзоре БК.	2	update through import_export	8	1
3132	2018-12-25 11:46:37.346297+00	56	Информация о лицензии доступна в обзоре БК.	2	update through import_export	8	1
3133	2018-12-25 11:46:37.348579+00	57	Информация о контактах букмекера доступна в обзоре БК.	2	update through import_export	8	1
3134	2018-12-25 11:46:37.350944+00	57	Информация о контактах букмекера доступна в обзоре БК.	2	update through import_export	8	1
3135	2018-12-25 11:46:37.353018+00	58	С отзывами можно ознакомиться в обзоре БК.	2	update through import_export	8	1
3136	2018-12-25 11:46:37.355096+00	58	С отзывами можно ознакомиться в обзоре БК.	2	update through import_export	8	1
3137	2018-12-25 11:46:37.357453+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3138	2018-12-25 11:46:37.359512+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3139	2018-12-25 11:46:37.361849+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3140	2018-12-25 11:46:37.363907+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3141	2018-12-25 11:46:37.366188+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3142	2018-12-25 11:46:37.368588+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3143	2018-12-25 11:46:37.370961+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3144	2018-12-25 11:46:37.372522+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3145	2018-12-25 11:46:37.374047+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3216	2018-12-25 11:46:37.502934+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3146	2018-12-25 11:46:37.375902+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3147	2018-12-25 11:46:37.378469+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3148	2018-12-25 11:46:37.380794+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3149	2018-12-25 11:46:37.38248+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3150	2018-12-25 11:46:37.384355+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3151	2018-12-25 11:46:37.388481+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3152	2018-12-25 11:46:37.390331+00	59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается р	2	update through import_export	8	1
3153	2018-12-25 11:46:37.392054+00	60	Если вы находитесь на территории РФ, перейти можно только на лицензированные и легальные в России БК (требования Роскомнадзора).	2	update through import_export	8	1
3154	2018-12-25 11:46:37.393651+00	60	Если вы находитесь на территории РФ, перейти можно только на лицензированные и легальные в России БК (требования Роскомнадзора).	2	update through import_export	8	1
3155	2018-12-25 11:46:37.39538+00	60	Если вы находитесь на территории РФ, перейти можно только на лицензированные и легальные в России БК (требования Роскомнадзора).	2	update through import_export	8	1
3156	2018-12-25 11:46:37.396853+00	61	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.	2	update through import_export	8	1
3157	2018-12-25 11:46:37.398305+00	61	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.	2	update through import_export	8	1
3158	2018-12-25 11:46:37.400137+00	61	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.	2	update through import_export	8	1
3159	2018-12-25 11:46:37.401769+00	61	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.	2	update through import_export	8	1
3160	2018-12-25 11:46:37.403395+00	61	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.	2	update through import_export	8	1
3161	2018-12-25 11:46:37.40527+00	62	 К ответственности могут быть призваны букмекеры, а не их клиенты. 	2	update through import_export	8	1
3162	2018-12-25 11:46:37.407182+00	62	 К ответственности могут быть призваны букмекеры, а не их клиенты. 	2	update through import_export	8	1
3163	2018-12-25 11:46:37.408852+00	62	 К ответственности могут быть призваны букмекеры, а не их клиенты. 	2	update through import_export	8	1
3164	2018-12-25 11:46:37.410417+00	62	 К ответственности могут быть призваны букмекеры, а не их клиенты. 	2	update through import_export	8	1
3165	2018-12-25 11:46:37.412601+00	62	 К ответственности могут быть призваны букмекеры, а не их клиенты. 	2	update through import_export	8	1
3166	2018-12-25 11:46:37.414454+00	63	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов	2	update through import_export	8	1
3167	2018-12-25 11:46:37.416355+00	63	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов	2	update through import_export	8	1
3217	2018-12-25 11:46:37.504506+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3168	2018-12-25 11:46:37.418036+00	63	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов	2	update through import_export	8	1
3169	2018-12-25 11:46:37.419717+00	63	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов	2	update through import_export	8	1
3170	2018-12-25 11:46:37.421118+00	64	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	2	update through import_export	8	1
3171	2018-12-25 11:46:37.422518+00	64	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	2	update through import_export	8	1
3172	2018-12-25 11:46:37.424201+00	64	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	2	update through import_export	8	1
3173	2018-12-25 11:46:37.426088+00	64	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в ин	2	update through import_export	8	1
3174	2018-12-25 11:46:37.427744+00	65	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	2	update through import_export	8	1
3175	2018-12-25 11:46:37.430173+00	65	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	2	update through import_export	8	1
3176	2018-12-25 11:46:37.432254+00	65	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	2	update through import_export	8	1
3177	2018-12-25 11:46:37.434026+00	65	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	2	update through import_export	8	1
3178	2018-12-25 11:46:37.435604+00	65	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	2	update through import_export	8	1
3179	2018-12-25 11:46:37.43694+00	65	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.	2	update through import_export	8	1
3180	2018-12-25 11:46:37.438458+00	66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	2	update through import_export	8	1
3181	2018-12-25 11:46:37.440067+00	66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	2	update through import_export	8	1
3182	2018-12-25 11:46:37.442153+00	66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	2	update through import_export	8	1
3183	2018-12-25 11:46:37.443908+00	66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	2	update through import_export	8	1
3184	2018-12-25 11:46:37.44622+00	66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	2	update through import_export	8	1
3185	2018-12-25 11:46:37.448409+00	66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	2	update through import_export	8	1
3186	2018-12-25 11:46:37.450219+00	66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	2	update through import_export	8	1
3187	2018-12-25 11:46:37.451845+00	66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	2	update through import_export	8	1
3218	2018-12-25 11:46:37.506198+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3188	2018-12-25 11:46:37.453514+00	66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	2	update through import_export	8	1
3189	2018-12-25 11:46:37.455326+00	66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.	2	update through import_export	8	1
3190	2018-12-25 11:46:37.456977+00	67	Переводы, которые проводятся через банк, занимают больше времени, чем переводы посредством платежных интернет-систем (к примеру, платежной системы Skrill).	2	update through import_export	8	1
3191	2018-12-25 11:46:37.458531+00	67	Переводы, которые проводятся через банк, занимают больше времени, чем переводы посредством платежных интернет-систем (к примеру, платежной системы Skrill).	2	update through import_export	8	1
3192	2018-12-25 11:46:37.460336+00	68	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были в	2	update through import_export	8	1
3193	2018-12-25 11:46:37.462176+00	68	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были в	2	update through import_export	8	1
3194	2018-12-25 11:46:37.464047+00	68	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были в	2	update through import_export	8	1
3195	2018-12-25 11:46:37.466031+00	69	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК, и ограничения для конкретной платежной системы	2	update through import_export	8	1
3196	2018-12-25 11:46:37.468844+00	69	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК, и ограничения для конкретной платежной системы	2	update through import_export	8	1
3197	2018-12-25 11:46:37.470873+00	69	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК, и ограничения для конкретной платежной системы	2	update through import_export	8	1
3198	2018-12-25 11:46:37.472664+00	70	Этот вопрос лучше задать представителям банка.	2	update through import_export	8	1
3199	2018-12-25 11:46:37.4743+00	70	Этот вопрос лучше задать представителям банка.	2	update through import_export	8	1
3200	2018-12-25 11:46:37.476196+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3201	2018-12-25 11:46:37.477816+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3202	2018-12-25 11:46:37.479411+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3203	2018-12-25 11:46:37.481416+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3204	2018-12-25 11:46:37.482926+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3205	2018-12-25 11:46:37.484499+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3206	2018-12-25 11:46:37.48599+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3207	2018-12-25 11:46:37.487679+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3208	2018-12-25 11:46:37.48963+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3209	2018-12-25 11:46:37.491282+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3210	2018-12-25 11:46:37.492856+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3211	2018-12-25 11:46:37.494639+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3212	2018-12-25 11:46:37.496309+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3213	2018-12-25 11:46:37.497947+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3214	2018-12-25 11:46:37.4996+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3215	2018-12-25 11:46:37.501376+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3219	2018-12-25 11:46:37.508068+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3220	2018-12-25 11:46:37.510074+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3221	2018-12-25 11:46:37.512303+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3222	2018-12-25 11:46:37.514115+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3223	2018-12-25 11:46:37.515948+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3224	2018-12-25 11:46:37.517605+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3225	2018-12-25 11:46:37.519823+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3226	2018-12-25 11:46:37.521681+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3227	2018-12-25 11:46:37.523583+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3228	2018-12-25 11:46:37.525608+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3229	2018-12-25 11:46:37.527583+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3230	2018-12-25 11:46:37.529558+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3231	2018-12-25 11:46:37.531797+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3232	2018-12-25 11:46:37.533885+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3233	2018-12-25 11:46:37.535662+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3234	2018-12-25 11:46:37.537357+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3235	2018-12-25 11:46:37.539064+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3236	2018-12-25 11:46:37.540921+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3237	2018-12-25 11:46:37.542646+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3238	2018-12-25 11:46:37.544548+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3239	2018-12-25 11:46:37.546329+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3240	2018-12-25 11:46:37.548093+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3241	2018-12-25 11:46:37.550322+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3242	2018-12-25 11:46:37.552178+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3243	2018-12-25 11:46:37.554043+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3244	2018-12-25 11:46:37.555765+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3245	2018-12-25 11:46:37.557467+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3246	2018-12-25 11:46:37.559152+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3247	2018-12-25 11:46:37.560997+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3248	2018-12-25 11:46:37.562735+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3249	2018-12-25 11:46:37.564563+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3250	2018-12-25 11:46:37.566296+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3251	2018-12-25 11:46:37.568037+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3252	2018-12-25 11:46:37.570159+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3253	2018-12-25 11:46:37.572203+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3254	2018-12-25 11:46:37.573927+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3255	2018-12-25 11:46:37.57541+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3256	2018-12-25 11:46:37.576773+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3257	2018-12-25 11:46:37.578156+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3258	2018-12-25 11:46:37.57955+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3259	2018-12-25 11:46:37.581224+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3260	2018-12-25 11:46:37.582927+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3261	2018-12-25 11:46:37.584427+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3262	2018-12-25 11:46:37.58586+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3263	2018-12-25 11:46:37.587691+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3264	2018-12-25 11:46:37.589141+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3265	2018-12-25 11:46:37.590781+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3266	2018-12-25 11:46:37.592771+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3267	2018-12-25 11:46:37.594898+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3268	2018-12-25 11:46:37.600305+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3269	2018-12-25 11:46:37.60239+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3270	2018-12-25 11:46:37.604019+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3271	2018-12-25 11:46:37.605723+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3272	2018-12-25 11:46:37.607296+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3273	2018-12-25 11:46:37.608892+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3274	2018-12-25 11:46:37.610453+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3275	2018-12-25 11:46:37.612399+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3276	2018-12-25 11:46:37.614002+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3277	2018-12-25 11:46:37.615434+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3278	2018-12-25 11:46:37.616823+00	71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.	2	update through import_export	8	1
3279	2018-12-25 11:46:37.618174+00	72	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	2	update through import_export	8	1
3280	2018-12-25 11:46:37.619528+00	72	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	2	update through import_export	8	1
3281	2018-12-25 11:46:37.620899+00	72	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	2	update through import_export	8	1
3282	2018-12-25 11:46:37.622328+00	72	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.	2	update through import_export	8	1
3283	2018-12-25 11:46:37.623864+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3284	2018-12-25 11:46:37.625362+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3285	2018-12-25 11:46:37.626916+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3286	2018-12-25 11:46:37.628481+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3287	2018-12-25 11:46:37.630059+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3288	2018-12-25 11:46:37.631725+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3289	2018-12-25 11:46:37.633588+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3290	2018-12-25 11:46:37.635253+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3291	2018-12-25 11:46:37.636806+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3292	2018-12-25 11:46:37.638317+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3293	2018-12-25 11:46:37.639889+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3294	2018-12-25 11:46:37.641757+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3295	2018-12-25 11:46:37.643248+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3296	2018-12-25 11:46:37.644712+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3297	2018-12-25 11:46:37.646518+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3298	2018-12-25 11:46:37.648197+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3299	2018-12-25 11:46:37.650013+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3300	2018-12-25 11:46:37.651929+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3301	2018-12-25 11:46:37.653868+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3302	2018-12-25 11:46:37.655904+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3303	2018-12-25 11:46:37.657878+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3304	2018-12-25 11:46:37.659667+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3305	2018-12-25 11:46:37.661405+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3306	2018-12-25 11:46:37.663685+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3307	2018-12-25 11:46:37.665362+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3308	2018-12-25 11:46:37.667142+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3309	2018-12-25 11:46:37.66906+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3310	2018-12-25 11:46:37.670828+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3311	2018-12-25 11:46:37.672681+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3312	2018-12-25 11:46:37.674341+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3313	2018-12-25 11:46:37.675799+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3314	2018-12-25 11:46:37.677043+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3315	2018-12-25 11:46:37.678393+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3316	2018-12-25 11:46:37.679746+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3317	2018-12-25 11:46:37.681115+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3318	2018-12-25 11:46:37.682528+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3319	2018-12-25 11:46:37.684211+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3320	2018-12-25 11:46:37.686079+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3321	2018-12-25 11:46:37.687531+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3322	2018-12-25 11:46:37.688985+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3323	2018-12-25 11:46:37.690606+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3324	2018-12-25 11:46:37.692308+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3325	2018-12-25 11:46:37.694215+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3326	2018-12-25 11:46:37.696285+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3327	2018-12-25 11:46:37.698103+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3328	2018-12-25 11:46:37.700093+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3329	2018-12-25 11:46:37.701637+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3330	2018-12-25 11:46:37.702936+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3331	2018-12-25 11:46:37.704317+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3332	2018-12-25 11:46:37.705596+00	73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).	2	update through import_export	8	1
3333	2018-12-25 11:46:37.707065+00	74	Ищите способы обхода блокировок в поисковике.	2	update through import_export	8	1
3334	2018-12-25 11:46:37.708646+00	74	Ищите способы обхода блокировок в поисковике.	2	update through import_export	8	1
3335	2018-12-25 11:46:37.709988+00	74	Ищите способы обхода блокировок в поисковике.	2	update through import_export	8	1
3336	2018-12-25 11:46:37.711597+00	74	Ищите способы обхода блокировок в поисковике.	2	update through import_export	8	1
3337	2018-12-25 11:46:37.713641+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3338	2018-12-25 11:46:37.715366+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3339	2018-12-25 11:46:37.717153+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3340	2018-12-25 11:46:37.71884+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3341	2018-12-25 11:46:37.720465+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3342	2018-12-25 11:46:37.722184+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3343	2018-12-25 11:46:37.72397+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3344	2018-12-25 11:46:37.725635+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3345	2018-12-25 11:46:37.727365+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3346	2018-12-25 11:46:37.729017+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3347	2018-12-25 11:46:37.730698+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3348	2018-12-25 11:46:37.732279+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3349	2018-12-25 11:46:37.733833+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3350	2018-12-25 11:46:37.735754+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3351	2018-12-25 11:46:37.737588+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3352	2018-12-25 11:46:37.739104+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3353	2018-12-25 11:46:37.740654+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3354	2018-12-25 11:46:37.742122+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3355	2018-12-25 11:46:37.743815+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3356	2018-12-25 11:46:37.745718+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3357	2018-12-25 11:46:37.747527+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3358	2018-12-25 11:46:37.749213+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3359	2018-12-25 11:46:37.751157+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3360	2018-12-25 11:46:37.752942+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3361	2018-12-25 11:46:37.754749+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3362	2018-12-25 11:46:37.756956+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3363	2018-12-25 11:46:37.758408+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3364	2018-12-25 11:46:37.760134+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3365	2018-12-25 11:46:37.761793+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3366	2018-12-25 11:46:37.763497+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3367	2018-12-25 11:46:37.765082+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3368	2018-12-25 11:46:37.766688+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3369	2018-12-25 11:46:37.768166+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3370	2018-12-25 11:46:37.769572+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3371	2018-12-25 11:46:37.770877+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3372	2018-12-25 11:46:37.772151+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3373	2018-12-25 11:46:37.773615+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3374	2018-12-25 11:46:37.775382+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3375	2018-12-25 11:46:37.777283+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3376	2018-12-25 11:46:37.779086+00	74	Ищите способы обхода блокировок в поисковике. 	2	update through import_export	8	1
3377	2018-12-25 11:46:37.780711+00	75	Критерии оценки капперов/капперских сайтов доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/	2	update through import_export	8	1
3378	2018-12-25 11:46:37.782186+00	75	Критерии оценки капперов/капперских сайтов доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/	2	update through import_export	8	1
3379	2018-12-25 11:46:37.783725+00	76	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	2	update through import_export	8	1
3380	2018-12-25 11:46:37.785158+00	76	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	2	update through import_export	8	1
3381	2018-12-25 11:46:37.7867+00	76	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	2	update through import_export	8	1
3382	2018-12-25 11:46:37.788317+00	76	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	2	update through import_export	8	1
3383	2018-12-25 11:46:37.790066+00	76	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	2	update through import_export	8	1
3384	2018-12-25 11:46:37.792003+00	76	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/	2	update through import_export	8	1
3385	2018-12-25 11:46:37.794599+00	77	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.	2	update through import_export	8	1
3386	2018-12-25 11:46:37.796668+00	77	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.	2	update through import_export	8	1
3387	2018-12-25 11:46:37.798967+00	77	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.	2	update through import_export	8	1
3388	2018-12-25 11:46:37.801391+00	77	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.	2	update through import_export	8	1
3389	2018-12-25 11:46:37.803086+00	77	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.	2	update through import_export	8	1
3390	2018-12-25 11:46:37.805508+00	78	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	2	update through import_export	8	1
3391	2018-12-25 11:46:37.807054+00	78	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	2	update through import_export	8	1
3392	2018-12-25 11:46:37.808754+00	78	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	2	update through import_export	8	1
3393	2018-12-25 11:46:37.810297+00	78	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.	2	update through import_export	8	1
3394	2018-12-25 11:46:37.811868+00	79	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют. В любом случае, мы не рекомендуем повторную рег	2	update through import_export	8	1
3395	2018-12-25 11:46:37.813405+00	79	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют. В любом случае, мы не рекомендуем повторную рег	2	update through import_export	8	1
3396	2018-12-25 11:46:37.814745+00	79	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют. В любом случае, мы не рекомендуем повторную рег	2	update through import_export	8	1
3397	2018-12-25 11:46:37.816291+00	80	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	2	update through import_export	8	1
3398	2018-12-25 11:46:37.817999+00	80	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	2	update through import_export	8	1
3399	2018-12-25 11:46:37.819418+00	80	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	2	update through import_export	8	1
3400	2018-12-25 11:46:37.820996+00	80	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».	2	update through import_export	8	1
3401	2018-12-25 11:46:37.822643+00	81	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок	2	update through import_export	8	1
3402	2018-12-25 11:46:37.824765+00	81	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок	2	update through import_export	8	1
3403	2018-12-25 11:46:37.826608+00	81	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок	2	update through import_export	8	1
3404	2018-12-25 11:46:37.828367+00	81	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок	2	update through import_export	8	1
3405	2018-12-25 11:46:37.830001+00	82	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	2	update through import_export	8	1
3406	2018-12-25 11:46:37.833058+00	82	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	2	update through import_export	8	1
3407	2018-12-25 11:46:37.835271+00	82	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	2	update through import_export	8	1
3408	2018-12-25 11:46:37.837187+00	82	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается 	2	update through import_export	8	1
3409	2018-12-25 11:46:37.839198+00	83	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.	2	update through import_export	8	1
3410	2018-12-25 11:46:37.841169+00	83	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.	2	update through import_export	8	1
3411	2018-12-25 11:46:37.843142+00	83	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.	2	update through import_export	8	1
3412	2018-12-25 11:46:37.844932+00	83	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.	2	update through import_export	8	1
3413	2018-12-25 11:46:37.846624+00	84	Информация о букмекерских вилках находится здесь: https://bookmaker-ratings.ru/bukmekerskie-vilki-chto-e-to-i-kak-zarabotat-na-nih/	2	update through import_export	8	1
3414	2018-12-25 11:46:37.849342+00	84	Информация о букмекерских вилках находится здесь: https://bookmaker-ratings.ru/bukmekerskie-vilki-chto-e-to-i-kak-zarabotat-na-nih/	2	update through import_export	8	1
3415	2018-12-25 11:46:37.851162+00	84	Информация о букмекерских вилках находится здесь: https://bookmaker-ratings.ru/bukmekerskie-vilki-chto-e-to-i-kak-zarabotat-na-nih/	2	update through import_export	8	1
3416	2018-12-25 11:46:37.852954+00	85	БК не хочет с вами играть, смените контору. 	2	update through import_export	8	1
3417	2018-12-25 11:46:37.854932+00	85	БК не хочет с вами играть, смените контору. 	2	update through import_export	8	1
3418	2018-12-25 11:46:37.857235+00	85	БК не хочет с вами играть, смените контору. 	2	update through import_export	8	1
3419	2018-12-25 11:46:37.859271+00	85	БК не хочет с вами играть, смените контору. 	2	update through import_export	8	1
3420	2018-12-25 11:46:37.863592+00	86	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	2	update through import_export	8	1
3421	2018-12-25 11:46:37.866283+00	86	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	2	update through import_export	8	1
3422	2018-12-25 11:46:37.86841+00	86	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	2	update through import_export	8	1
3423	2018-12-25 11:46:37.870144+00	86	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или бол	2	update through import_export	8	1
3424	2018-12-25 11:46:37.871883+00	87	«Коридором» обычно называют комбинацию из двух ставок в различных букмекерских конторах. Хотя данные две ставки должны быть поставлены на взаимоисключающие исходы, обе имеют шанс сработать одновременн	2	update through import_export	8	1
3425	2018-12-25 11:46:37.873619+00	87	«Коридором» обычно называют комбинацию из двух ставок в различных букмекерских конторах. Хотя данные две ставки должны быть поставлены на взаимоисключающие исходы, обе имеют шанс сработать одновременн	2	update through import_export	8	1
3426	2018-12-25 11:46:37.875451+00	88	Информация о ставках на фору здесь: https://bookmaker-ratings.ru/wiki/stavki-na-fory/	2	update through import_export	8	1
3427	2018-12-25 11:46:37.877417+00	88	Информация о ставках на фору здесь: https://bookmaker-ratings.ru/wiki/stavki-na-fory/	2	update through import_export	8	1
3428	2018-12-25 11:46:37.879199+00	89	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	2	update through import_export	8	1
3429	2018-12-25 11:46:37.880938+00	89	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	2	update through import_export	8	1
3430	2018-12-25 11:46:37.882518+00	89	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	2	update through import_export	8	1
3431	2018-12-25 11:46:37.884333+00	89	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	2	update through import_export	8	1
3432	2018-12-25 11:46:37.886275+00	89	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем ут	2	update through import_export	8	1
3433	2018-12-25 11:46:37.887804+00	90	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при у	2	update through import_export	8	1
3434	2018-12-25 11:46:37.889378+00	90	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при у	2	update through import_export	8	1
3435	2018-12-25 11:46:37.890867+00	90	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при у	2	update through import_export	8	1
3436	2018-12-25 11:46:37.892323+00	91	Попробуйте обратиться в службу поддержки "Киви". 	2	update through import_export	8	1
3437	2018-12-25 11:46:37.893769+00	91	Попробуйте обратиться в службу поддержки "Киви". 	2	update through import_export	8	1
3438	2018-12-25 11:46:37.89545+00	91	Попробуйте обратиться в службу поддержки "Киви". 	2	update through import_export	8	1
3439	2018-12-25 11:46:37.897278+00	92	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.	2	update through import_export	8	1
3484	2018-12-25 11:46:37.976431+00	104	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	2	update through import_export	8	1
3440	2018-12-25 11:46:37.900325+00	92	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.	2	update through import_export	8	1
3441	2018-12-25 11:46:37.902101+00	92	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.	2	update through import_export	8	1
3442	2018-12-25 11:46:37.903616+00	93	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридор	2	update through import_export	8	1
3443	2018-12-25 11:46:37.905072+00	93	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридор	2	update through import_export	8	1
3444	2018-12-25 11:46:37.906529+00	93	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридор	2	update through import_export	8	1
3445	2018-12-25 11:46:37.908073+00	94	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.	2	update through import_export	8	1
3446	2018-12-25 11:46:37.90953+00	94	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.	2	update through import_export	8	1
3447	2018-12-25 11:46:37.911856+00	94	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.	2	update through import_export	8	1
3448	2018-12-25 11:46:37.913564+00	95	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3449	2018-12-25 11:46:37.915112+00	95	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3450	2018-12-25 11:46:37.91654+00	95	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3451	2018-12-25 11:46:37.918488+00	95	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/	2	update through import_export	8	1
3452	2018-12-25 11:46:37.920278+00	96	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	2	update through import_export	8	1
3453	2018-12-25 11:46:37.92194+00	96	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	2	update through import_export	8	1
3454	2018-12-25 11:46:37.923709+00	96	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	2	update through import_export	8	1
3455	2018-12-25 11:46:37.925313+00	96	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	2	update through import_export	8	1
3456	2018-12-25 11:46:37.926965+00	96	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документ	2	update through import_export	8	1
3457	2018-12-25 11:46:37.928735+00	97	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	2	update through import_export	8	1
3458	2018-12-25 11:46:37.930522+00	97	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	2	update through import_export	8	1
3459	2018-12-25 11:46:37.93246+00	97	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	2	update through import_export	8	1
3460	2018-12-25 11:46:37.933971+00	97	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	2	update through import_export	8	1
3461	2018-12-25 11:46:37.935473+00	97	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские	2	update through import_export	8	1
3462	2018-12-25 11:46:37.936781+00	98	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки	2	update through import_export	8	1
3463	2018-12-25 11:46:37.938135+00	98	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки	2	update through import_export	8	1
3464	2018-12-25 11:46:37.939891+00	98	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки	2	update through import_export	8	1
3465	2018-12-25 11:46:37.941959+00	98	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки	2	update through import_export	8	1
3466	2018-12-25 11:46:37.943943+00	99	Следите за новостями на нашем сайте.	2	update through import_export	8	1
3467	2018-12-25 11:46:37.945838+00	99	Следите за новостями на нашем сайте.	2	update through import_export	8	1
3468	2018-12-25 11:46:37.947365+00	99	Следите за новостями на нашем сайте.	2	update through import_export	8	1
3469	2018-12-25 11:46:37.948806+00	99	Следите за новостями на нашем сайте.	2	update through import_export	8	1
3470	2018-12-25 11:46:37.950423+00	99	Следите за новостями на нашем сайте.	2	update through import_export	8	1
3471	2018-12-25 11:46:37.95195+00	99	Следите за новостями на нашем сайте.	2	update through import_export	8	1
3472	2018-12-25 11:46:37.953661+00	100	Список букмекеров, поддерживающих русский язык доступен здесь: https://bookmaker-ratings.ru/supported_languages/russkij/	2	update through import_export	8	1
3473	2018-12-25 11:46:37.955483+00	100	Список букмекеров, поддерживающих русский язык доступен здесь: https://bookmaker-ratings.ru/supported_languages/russkij/	2	update through import_export	8	1
3474	2018-12-25 11:46:37.957234+00	101	Список букмекеров, принимающих ставки на киберспорт доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/bukmekery-prinimayushhie-stavki-na-kibersport/	2	update through import_export	8	1
3475	2018-12-25 11:46:37.958763+00	101	Список букмекеров, принимающих ставки на киберспорт доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/bukmekery-prinimayushhie-stavki-na-kibersport/	2	update through import_export	8	1
3476	2018-12-25 11:46:37.961936+00	102	Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=legal-only/	2	update through import_export	8	1
3477	2018-12-25 11:46:37.964016+00	102	Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=legal-only/	2	update through import_export	8	1
3478	2018-12-25 11:46:37.966049+00	103	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/	2	update through import_export	8	1
3479	2018-12-25 11:46:37.968126+00	103	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/	2	update through import_export	8	1
3480	2018-12-25 11:46:37.969979+00	103	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/	2	update through import_export	8	1
3481	2018-12-25 11:46:37.971641+00	103	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/	2	update through import_export	8	1
3482	2018-12-25 11:46:37.973245+00	104	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	2	update through import_export	8	1
3483	2018-12-25 11:46:37.974775+00	104	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	2	update through import_export	8	1
3485	2018-12-25 11:46:37.979596+00	104	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	2	update through import_export	8	1
3486	2018-12-25 11:46:37.984802+00	104	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	2	update through import_export	8	1
3487	2018-12-25 11:46:37.986761+00	104	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru	2	update through import_export	8	1
3488	2018-12-25 11:46:37.988422+00	105	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/	2	update through import_export	8	1
3489	2018-12-25 11:46:37.990233+00	105	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/	2	update through import_export	8	1
3490	2018-12-25 11:46:37.991865+00	105	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/	2	update through import_export	8	1
3491	2018-12-25 11:46:37.993364+00	105	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/	2	update through import_export	8	1
3492	2018-12-25 11:46:37.994809+00	106	Маржа — комиссия букмекера с рынка ставок, которая закладывается в коэффициенты конторы. Подробнее здесь: https://bookmaker-ratings.ru/wiki/marzha/	2	update through import_export	8	1
3493	2018-12-25 11:46:37.996416+00	106	Маржа — комиссия букмекера с рынка ставок, которая закладывается в коэффициенты конторы. Подробнее здесь: https://bookmaker-ratings.ru/wiki/marzha/	2	update through import_export	8	1
3494	2018-12-25 11:46:37.997826+00	106	Маржа — комиссия букмекера с рынка ставок, которая закладывается в коэффициенты конторы. Подробнее здесь: https://bookmaker-ratings.ru/wiki/marzha/	2	update through import_export	8	1
3495	2018-12-25 11:46:37.999504+00	107	Система — разновидность ставок, представляющих собой несколько экспресс-ставок. Подобнее здесь: https://bookmaker-ratings.ru/wiki/sistema/	2	update through import_export	8	1
3496	2018-12-25 11:46:38.001749+00	107	Система — разновидность ставок, представляющих собой несколько экспресс-ставок. Подобнее здесь: https://bookmaker-ratings.ru/wiki/sistema/	2	update through import_export	8	1
3497	2018-12-25 11:46:38.004089+00	108	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugi	2	update through import_export	8	1
3498	2018-12-25 11:46:38.006479+00	108	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugi	2	update through import_export	8	1
3499	2018-12-25 11:46:38.008436+00	108	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugi	2	update through import_export	8	1
3500	2018-12-25 11:46:38.010465+00	108	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugi	2	update through import_export	8	1
3501	2018-12-25 11:46:38.012507+00	109	Букмекерские СРО (саморегулируемые организации букмекеров) — некоммерческие организации, объединяющие букмекерские конторы и тотализаторы в Российской Федерации. Подробнее здесь: https://bookmaker-rat	2	update through import_export	8	1
3502	2018-12-25 11:46:38.014156+00	109	Букмекерские СРО (саморегулируемые организации букмекеров) — некоммерческие организации, объединяющие букмекерские конторы и тотализаторы в Российской Федерации. Подробнее здесь: https://bookmaker-rat	2	update through import_export	8	1
3503	2018-12-25 11:46:38.015854+00	110	Материалы про интернет-издания с рейтингами букмекерских контор доступны здесь: https://bookmaker-ratings.ru/wiki-category/wiki-izdaniya-s-rejtingami/	2	update through import_export	8	1
3504	2018-12-25 11:46:38.017431+00	110	Материалы про интернет-издания с рейтингами букмекерских контор доступны здесь: https://bookmaker-ratings.ru/wiki-category/wiki-izdaniya-s-rejtingami/	2	update through import_export	8	1
3505	2018-12-25 11:46:38.018967+00	111	Сканеры вилок – это программы, сканирующие линию ставок многочисленных онлайн-букмекеров в режиме реального времени и определяющие арбитражные ситуации, известные также как букмекерские вилки. Подробн	2	update through import_export	8	1
3506	2018-12-25 11:46:38.021094+00	111	Сканеры вилок – это программы, сканирующие линию ставок многочисленных онлайн-букмекеров в режиме реального времени и определяющие арбитражные ситуации, известные также как букмекерские вилки. Подробн	2	update through import_export	8	1
3507	2018-12-25 11:46:38.023245+00	112	Мультиаккаунтинг – регистрация более одного счета на сайте букмекерской конторы, в том числе на поддельные или чужие паспортные данные. Подобнее здесь: https://bookmaker-ratings.ru/wiki/mul-tiakkaunti	2	update through import_export	8	1
3508	2018-12-25 11:46:38.025165+00	112	Мультиаккаунтинг – регистрация более одного счета на сайте букмекерской конторы, в том числе на поддельные или чужие паспортные данные. Подобнее здесь: https://bookmaker-ratings.ru/wiki/mul-tiakkaunti	2	update through import_export	8	1
3509	2018-12-25 11:46:38.026725+00	113	Верификация игрока — проверка игрока букмекерской конторой, в ходе которой компания устанавливает соответствие личности игрока указанным им паспортным данным, а также верифицирует другую информацию сч	2	update through import_export	8	1
3510	2018-12-25 11:46:38.028448+00	113	Верификация игрока — проверка игрока букмекерской конторой, в ходе которой компания устанавливает соответствие личности игрока указанным им паспортным данным, а также верифицирует другую информацию сч	2	update through import_export	8	1
3511	2018-12-25 11:46:38.030135+00	114	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все об	2	update through import_export	8	1
3512	2018-12-25 11:46:38.03165+00	114	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все об	2	update through import_export	8	1
3513	2018-12-25 11:46:38.033543+00	114	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все об	2	update through import_export	8	1
3514	2018-12-25 11:46:38.035459+00	114	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все об	2	update through import_export	8	1
3515	2018-12-25 11:46:38.037593+00	115	Имеется в виду получение выигрыша с оффшорной БК? В настоящий момент актуальной является не проблема получения крупной суммы, а возможность перевода из иностранных контор денег на карты российских бан	2	update through import_export	8	1
3516	2018-12-25 11:46:38.039547+00	115	Имеется в виду получение выигрыша с оффшорной БК? В настоящий момент актуальной является не проблема получения крупной суммы, а возможность перевода из иностранных контор денег на карты российских бан	2	update through import_export	8	1
3517	2018-12-25 11:46:38.041044+00	116	На деле, это распространенное правило, и действует оно в большинстве букмекерских контор. То, как и к кому применяется это правило, зависит от конкретного случая.	2	update through import_export	8	1
3518	2018-12-25 11:46:38.042558+00	117	На западе отсутствует понятие «регистрация». Адрес человека там, где он живет. За ваш адрес принимается указанный на выписке из банка или квитанции за коммунальный платеж.	2	update through import_export	8	1
3519	2018-12-25 11:46:38.04399+00	118	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.	2	update through import_export	8	1
3520	2018-12-25 11:46:38.045588+00	118	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.	2	update through import_export	8	1
3521	2018-12-25 11:46:38.047204+00	118	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.	2	update through import_export	8	1
3522	2018-12-25 11:46:38.048638+00	119	При условии, что все документы для проверки личности и адреса были вами предоставлены, вы должны отправлять в букмекерские конторы более 2500 евро в месяц.	2	update through import_export	8	1
3523	2018-12-25 11:46:38.050067+00	120	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профес	2	update through import_export	8	1
3524	2018-12-25 11:46:38.052367+00	120	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профес	2	update through import_export	8	1
3525	2018-12-25 11:46:38.054018+00	120	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профес	2	update through import_export	8	1
3526	2018-12-25 11:46:38.055675+00	121	На территории РФ блокируют сайты БК, у которых нет лицензии ФНС. Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=	2	update through import_export	8	1
3527	2018-12-25 11:46:38.057252+00	121	На территории РФ блокируют сайты БК, у которых нет лицензии ФНС. Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=	2	update through import_export	8	1
3528	2018-12-25 11:46:38.058877+00	122	На самом сайте минимум полезной информации о сути сделки и ее условиях. Никаких статистических данных для оцнки эффективности нет.  Также сотрудник этого ресурса уверял, что они имеют отношение к БК О	2	update through import_export	8	1
3529	2018-12-25 11:46:38.060646+00	123	Нет. Сроки перевода следует уточнить в банке или у сотрудников платежной системы, если вы отправили средства в банк из нее. Обычно это занимает 3-5 банковских дней.	2	update through import_export	8	1
3530	2018-12-25 11:46:38.06239+00	124	Обычно перевод осуществляется в тот же или на следующий день. В то же время, точный срок зависит от букмекерской конторы, клиентом которой вы являетесь.	2	update through import_export	8	1
3531	2018-12-25 11:46:38.064157+00	124	Обычно перевод осуществляется в тот же или на следующий день. В то же время, точный срок зависит от букмекерской конторы, клиентом которой вы являетесь.	2	update through import_export	8	1
3532	2018-12-25 11:46:38.065672+00	125	Ответ на этот вопрос зависит от того, о каком букмекере и о карте какого банка идет речь. Мы настоятельно рекомендуем использовать для этих целей Visa Classic, поскольку Electron предназначена в перву	2	update through import_export	8	1
3533	2018-12-25 11:46:38.067157+00	126	Перепроверь все еще раз. Понимаю что звучит глупо, но мне как то помогло то что я почистил кэш, cookie , историю в браузерах и потом получилось зайти. Попробуй проверить почту на которую регистрировал	2	update through import_export	8	1
3534	2018-12-25 11:46:38.068543+00	126	Перепроверь все еще раз. Понимаю что звучит глупо, но мне как то помогло то что я почистил кэш, cookie , историю в браузерах и потом получилось зайти. Попробуйте проверить почту на которую регистриров	2	update through import_export	8	1
3535	2018-12-25 11:46:38.069919+00	127	По правилам букмекерских контор, они не несут ответственности за предоставленную в лайве информацию, так как эти данные (счет матча, т.д.) получают от партнеров. Потому ставку не вернут.	2	update through import_export	8	1
3536	2018-12-25 11:46:38.071284+00	127	По правилам букмекерских контор, они не несут ответственности за предоставленную в лайве информацию, так как эти данные (счет матча, т.д.) получают от партнеров. Потому ставку не вернут.	2	update through import_export	8	1
3537	2018-12-25 11:46:38.072949+00	128	Подойдет общая выписка по счету, главное, чтобы в ней был указан ваш адрес – тот же, который вы указали при регистрации в выбранной вами платежной системе.	2	update through import_export	8	1
3538	2018-12-25 11:46:38.074602+00	129	При регистрации в зарубежных букмекерских конторах поля можно заполнить, использовав либо перевод, либо транслитерацию.	2	update through import_export	8	1
3539	2018-12-25 11:46:38.076056+00	130	Приложение РБ для Android доступно здесь: https://bookmaker-ratings.ru/android-app/	2	update through import_export	8	1
3540	2018-12-25 11:46:38.077494+00	130	Приложение РБ для Android доступно здесь: https://bookmaker-ratings.ru/android-app/	2	update through import_export	8	1
3541	2018-12-25 11:46:38.078903+00	131	Приложение РБ для iOS доступно здесь: https://itunes.apple.com/ru/app/рб-прогнозы-на-спорт/id1188607891?mt=8	2	update through import_export	8	1
3542	2018-12-25 11:46:38.080389+00	131	Приложение РБ для iOS доступно здесь: https://itunes.apple.com/ru/app/рб-прогнозы-на-спорт/id1188607891?mt=8	2	update through import_export	8	1
3543	2018-12-25 11:46:38.082287+00	132	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.	2	update through import_export	8	1
3544	2018-12-25 11:46:38.084083+00	132	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.	2	update through import_export	8	1
3545	2018-12-25 11:46:38.085937+00	132	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.	2	update through import_export	8	1
3546	2018-12-25 11:46:38.088728+00	132	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.	2	update through import_export	8	1
3547	2018-12-25 11:46:38.090441+00	133	Из тех, которые могли бы порекомендовать: Marathonbet, Sbobet.	2	update through import_export	8	1
3548	2018-12-25 11:46:38.092168+00	133	Из тех, которые могли бы порекомендовать: Marathonbet, Sbobet.	2	update through import_export	8	1
3549	2018-12-25 11:46:38.093562+00	134	На мастер карт можно выводить через систему Ecommpay, максимальная сумма на одну транзакцию 15000 рублей. Советую пользоваться платежными системами Skrill или Neteller. Вывод через них намного быстрее	2	update through import_export	8	1
3550	2018-12-25 11:46:38.095173+00	135	У всех бывают серии неудач. Никто не заставляет ставить по мнению экспертов. Наоборот, если вы уверены в их убыточной стратегии, ставьте на противоположный исход. 	2	update through import_export	8	1
3551	2018-12-25 11:46:38.096521+00	135	У всех бывают серии неудач. Никто не заставляет ставить по мнению экспертов. Наоборот, если вы уверены в их убыточной стратегии, ставьте на противоположный исход. 	2	update through import_export	8	1
3552	2018-12-25 11:46:38.097987+00	135	У всех бывают серии неудач. Никто не заставляет ставить по мнению экспертов. Наоборот, если вы уверены в их убыточной стратегии, ставьте на противоположный исход. 	2	update through import_export	8	1
3553	2018-12-25 11:46:38.09951+00	136	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.	2	update through import_export	8	1
3554	2018-12-25 11:46:38.10164+00	136	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.	2	update through import_export	8	1
3555	2018-12-25 11:46:38.103154+00	136	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.	2	update through import_export	8	1
3556	2018-12-25 11:46:38.106706+00	136	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.	2	update through import_export	8	1
3557	2018-12-25 11:46:38.108611+00	137	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/	2	update through import_export	8	1
3558	2018-12-25 11:46:38.110301+00	137	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/	2	update through import_export	8	1
3559	2018-12-25 11:46:38.112018+00	137	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/	2	update through import_export	8	1
3560	2018-12-25 11:46:38.113485+00	137	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/	2	update through import_export	8	1
3561	2018-12-25 11:46:38.114926+00	138	У нас есть рейтинг букмекеров от пользователей – демонстрация настоящей демократии на «РБ». Мы никак не влияем на эти оценки. Только вы решаете, какое место займет контора: https://bookmaker-ratings.r	2	update through import_export	8	1
3562	2018-12-25 11:46:38.116539+00	138	У нас есть рейтинг букмекеров от пользователей – демонстрация настоящей демократии на «РБ». Мы никак не влияем на эти оценки. Только вы решаете, какое место займет контора: https://bookmaker-ratings.r	2	update through import_export	8	1
3563	2018-12-25 11:46:38.118155+00	139	Проходимость прогнозов не учитывается в рейтинге капперов. Мы оцениваем капперов по нашим  критериям: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/	2	update through import_export	8	1
3564	2018-12-25 11:46:38.119954+00	139	Проходимость прогнозов не учитывается в рейтинге капперов. Мы оцениваем капперов по нашим  критериям: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/	2	update through import_export	8	1
3565	2018-12-25 11:46:38.121433+00	140	Разумеется. Можно играть во всех существующих БК, никаких запретов на это нет. Учтите, мы рекомендуем играть только в тех конторах, которые имеют оценку «4» и «5» нашего рейтинга: https://bookmaker-ra	2	update through import_export	8	1
3566	2018-12-25 11:46:38.123091+00	140	Разумеется. Можно играть во всех существующих БК, никаких запретов на это нет. Учтите, мы рекомендуем играть только в тех конторах, которые имеют оценку «4» и «5» нашего рейтинга: https://bookmaker-ra	2	update through import_export	8	1
3567	2018-12-25 11:46:38.124835+00	141	Режут максимальную ставку или вовсе могут заблокировать счет, если это прописано в правилах. Но профессиональные БК, которые не ограничивают размер максимальной ставки и не вводят другие санкции для и	2	update through import_export	8	1
3568	2018-12-25 11:46:38.126502+00	141	Режут максимальную ставку или вовсе могут заблокировать счет, если это прописано в правилах. Но профессиональные БК, которые не ограничивают размер максимальной ставки и не вводят другие санкции для и	2	update through import_export	8	1
3569	2018-12-25 11:46:38.128196+00	142	Самостоятельных ограничений нет. Но мы можем проверить пользователя на какие-либо нарушения с его стороны. Если Вы считаете, что пользователь нарушил правила,  то напишите, пожалуйста, на почту: suppo	2	update through import_export	8	1
3570	2018-12-25 11:46:38.12987+00	143	Скорее всего Вам придется пройти процедуру верификации после запроса на вывод средств. 	2	update through import_export	8	1
3571	2018-12-25 11:46:38.131471+00	144	Скорее всего вы не подтвердили свою почту. Вам должно были прислать письмо с подтверждением почты и только после подтверждения будут приходить прогнозы. 	2	update through import_export	8	1
3572	2018-12-25 11:46:38.133487+00	145	Скорее всего, вы пользуетесь разными почтовыми адресами, и разными соц сетями. Попробуйте зайти с другого профиля.	2	update through import_export	8	1
3573	2018-12-25 11:46:38.135516+00	146	Советуем изначально выбрать БК с русской версией и поддержкой на русском языке. Вы найдете список таких контор здесь: https://bookmaker-ratings.ru/rejting-bukmekerov/bukmekery-na-russkom/	2	update through import_export	8	1
3574	2018-12-25 11:46:38.137359+00	147	Ставки на страйк-ауты принимает Марафон и Бетсити	2	update through import_export	8	1
3575	2018-12-25 11:46:38.139161+00	148	Такие верификаторы есть. Их можно легко найти в поисковике. 	2	update through import_export	8	1
3576	2018-12-25 11:46:38.141022+00	149	Такие сайты есть. Воспользуйтесь поисковиком для их нахождения. Также можно обратиться к стандартным инструментам "Эксель".	2	update through import_export	8	1
3577	2018-12-25 11:46:38.142664+00	150	Только если у вас есть все документы на эти номера, и вы можете подтвердить что вы являетесь их владельцем. Обратитесь в поддержку букмекера.	2	update through import_export	8	1
3578	2018-12-25 11:46:38.144475+00	151	У каждой конторы свои правила расчета карточек. Кто-то красную за две желтых считает, то есть как два очка, грубо говоря. И неважно, прямая она или нет. А кто-то вообще даже две ЖК повлекшие удаление 	2	update through import_export	8	1
3579	2018-12-25 11:46:38.146527+00	152	Удобнее всего найти подробную информацию по данным лигам можно на сайтах этих самых лиг и их представительствах в социальных сетях. Особо обширно лиги и команды низших дивизионов представлены в Twitte	2	update through import_export	8	1
3580	2018-12-25 11:46:38.148374+00	153	Указанная Вами БК не работает в рамках российского законодательства, поэтому и блокируется Роскомнадзором. Мы, в свою очередь, не имеем права размещать на своем сайте ссылки, которые ведут на запрещен	2	update through import_export	8	1
3581	2018-12-25 11:46:38.149963+00	154	Уточните, пожалуйста, данный вопрос у службы поддержки БК.	2	update through import_export	8	1
3582	2018-12-25 11:46:38.151557+00	154	Уточните, пожалуйста, данный вопрос у службы поддержки БК.	2	update through import_export	8	1
3583	2018-12-25 11:46:38.153162+00	155	Учетная запись через соцсеть тоже может принимать участие в конкурсе - необходимо просто нажать на соответствующую кнопку на этой странице   	2	update through import_export	8	1
3584	2018-12-25 11:46:38.15555+00	156	Во многих БК для вывода денег без комиссии необходимо проставить сумму депозита. Подробности лучше уточнить в службе поддержки БК.	2	update through import_export	8	1
3585	2018-12-25 11:46:38.157525+00	157	Чтобы начать пользоваться всеми возможностями Skrill, нужно пройти процедуру верификации. Для верификации счета вам потребуется отсканировать и послать документы, подтверждающие вашу личность и адрес.	2	update through import_export	8	1
3586	2018-12-25 11:46:38.159536+00	158	Чтобы узнать, какие БК и какой бонус предлагают, зайдите в наш рейтинг букмекерских контор и выберите «Упорядочить по бонусу». Детальная информация о бонусе указана в обзорах букмекеров.	2	update through import_export	8	1
3587	2018-12-25 11:46:38.161588+00	159	Эти деньги попали на ваш счет в Skrill. Вы с ними можете делать что захотите.  	2	update through import_export	8	1
3588	2018-12-25 11:46:38.163773+00	160	Это два разных сайта. Если вы просто не можете зайти на сайт, воспользуйтесь одним из средств обхода блокировки, описанных в сети.	2	update through import_export	8	1
3589	2018-12-25 11:46:38.165907+00	161	Это зависит как от популярности события, так и от возможных ограничений (порезка максимумов), наложенных букмекерской конторой на ваш аккаунт.	2	update through import_export	8	1
3590	2018-12-25 11:46:38.16829+00	162	Это любой другой счет, который не указан в росписи, обычно ставка выигрывает, когда одна из команд забивает как минимум 4 гола. Это что касается футбола.	2	update through import_export	8	1
3591	2018-12-25 11:46:38.170072+00	163	Это можно сделать при помощи банковского перевода или кредитной карточки.	2	update through import_export	8	1
3592	2018-12-25 11:46:38.171678+00	164	Это мультиаккаунтинг. Контора имеет право Вас заблокировать. 	2	update through import_export	8	1
3593	2018-12-25 11:46:38.173252+00	165	Биржи ставок отличаются от букмекерских контор тем, что игроки делают ставки не против букмекера, а друг против друга: https://bookmaker-ratings.ru/bookmakers-homepage/birzhi-stavok/	2	update through import_export	8	1
3594	2018-12-25 11:46:38.175076+00	165	Биржи ставок отличаются от букмекерских контор тем, что игроки делают ставки не против букмекера, а друг против друга: https://bookmaker-ratings.ru/bookmakers-homepage/birzhi-stavok/	2	update through import_export	8	1
3595	2018-12-25 11:46:38.176669+00	166	Я-бот. Я отвечаю только на вопросы, связанные с РБ	2	update through import_export	8	1
3596	2018-12-25 11:46:38.178916+00	166	Я-бот. Я отвечаю только на вопросы, связанные с РБ	2	update through import_export	8	1
3597	2018-12-25 11:46:38.180835+00	166	Я-бот. Я отвечаю только на вопросы, связанные с РБ	2	update through import_export	8	1
3598	2018-12-25 11:46:38.182671+00	166	Я-бот. Я отвечаю только на вопросы, связанные с РБ	2	update through import_export	8	1
3599	2018-12-25 11:46:38.184447+00	166	Я-бот. Я отвечаю только на вопросы, связанные с РБ	2	update through import_export	8	1
3600	2018-12-25 11:46:38.186063+00	167	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	2	update through import_export	8	1
3601	2018-12-25 11:46:38.187792+00	167	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	2	update through import_export	8	1
3602	2018-12-25 11:46:38.189473+00	167	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	2	update through import_export	8	1
3603	2018-12-25 11:46:38.190986+00	167	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	2	update through import_export	8	1
3604	2018-12-25 11:46:38.192624+00	167	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	2	update through import_export	8	1
3605	2018-12-25 11:46:38.194319+00	167	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	2	update through import_export	8	1
3606	2018-12-25 11:46:38.196897+00	167	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	2	update through import_export	8	1
3607	2018-12-25 11:46:38.198541+00	167	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	2	update through import_export	8	1
3608	2018-12-25 11:46:38.200227+00	167	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/	2	update through import_export	8	1
3609	2019-02-13 14:29:18.394156+00	764	Переведите меня на оператора пожалуйста	1	[{"added": {}}]	9	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	faq	answer
9	faq	question
10	faq	rating
11	faq	statistic
12	faq	s7data
13	faq	s7question
14	faq	s7answer
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-11-27 11:32:57.649281+00
2	auth	0001_initial	2018-11-27 11:32:57.743527+00
3	admin	0001_initial	2018-11-27 11:32:57.784651+00
4	admin	0002_logentry_remove_auto_add	2018-11-27 11:32:57.803147+00
5	admin	0003_logentry_add_action_flag_choices	2018-11-27 11:32:57.817829+00
6	contenttypes	0002_remove_content_type_name	2018-11-27 11:32:57.846317+00
7	auth	0002_alter_permission_name_max_length	2018-11-27 11:32:57.854487+00
8	auth	0003_alter_user_email_max_length	2018-11-27 11:32:57.870201+00
9	auth	0004_alter_user_username_opts	2018-11-27 11:32:57.88627+00
10	auth	0005_alter_user_last_login_null	2018-11-27 11:32:57.903646+00
11	auth	0006_require_contenttypes_0002	2018-11-27 11:32:57.90715+00
12	auth	0007_alter_validators_add_error_messages	2018-11-27 11:32:57.926096+00
13	auth	0008_alter_user_username_max_length	2018-11-27 11:32:57.94986+00
14	auth	0009_alter_user_last_name_max_length	2018-11-27 11:32:57.970629+00
15	authtoken	0001_initial	2018-11-27 11:32:58.023271+00
16	authtoken	0002_auto_20160226_1747	2018-11-27 11:32:58.084337+00
17	faq	0001_initial	2018-11-27 11:32:58.151215+00
18	faq	0002_question_answer_label	2018-11-27 11:32:58.161423+00
19	sessions	0001_initial	2018-11-27 11:32:58.181425+00
20	faq	0003_s7answer_s7data_s7question	2018-12-11 05:58:02.3651+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
w76103aaprissmrbr5g5fv54h3t5b8bf	YmJiYzVhMDYzODY4ODZmZWM0ZDY4MWJjYTZiMjU4NzdlODZiOGMzYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWQyYTI5ZGU3ZTc0NzI3Y2RkMDYyZjk0ZGFjNjg4YjJhY2FhYTYyIn0=	2018-12-11 11:42:23.998951+00
dykaj1vwcavbvhv9f91mutxm5h27qlc0	YmJiYzVhMDYzODY4ODZmZWM0ZDY4MWJjYTZiMjU4NzdlODZiOGMzYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWQyYTI5ZGU3ZTc0NzI3Y2RkMDYyZjk0ZGFjNjg4YjJhY2FhYTYyIn0=	2019-01-08 10:37:44.556325+00
qsvurpbmaa19v1kdyn09g5e3syaq9bsy	YmJiYzVhMDYzODY4ODZmZWM0ZDY4MWJjYTZiMjU4NzdlODZiOGMzYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWQyYTI5ZGU3ZTc0NzI3Y2RkMDYyZjk0ZGFjNjg4YjJhY2FhYTYyIn0=	2019-02-27 13:54:33.32402+00
66bxwa3fl94ydd9a4h20ktnqh4zqsib1	YmJiYzVhMDYzODY4ODZmZWM0ZDY4MWJjYTZiMjU4NzdlODZiOGMzYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWQyYTI5ZGU3ZTc0NzI3Y2RkMDYyZjk0ZGFjNjg4YjJhY2FhYTYyIn0=	2019-02-27 13:58:40.165058+00
vq28lcc9eblurxqc4yf3v0kpr8kjebyc	YmJiYzVhMDYzODY4ODZmZWM0ZDY4MWJjYTZiMjU4NzdlODZiOGMzYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWQyYTI5ZGU3ZTc0NzI3Y2RkMDYyZjk0ZGFjNjg4YjJhY2FhYTYyIn0=	2019-02-27 14:22:02.372782+00
ja5pgpv9r2u9uupqqevpwjetn3pwdvds	YmJiYzVhMDYzODY4ODZmZWM0ZDY4MWJjYTZiMjU4NzdlODZiOGMzYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4ZWQyYTI5ZGU3ZTc0NzI3Y2RkMDYyZjk0ZGFjNjg4YjJhY2FhYTYyIn0=	2019-02-27 16:58:28.353946+00
\.


--
-- Data for Name: faq_answer; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.faq_answer (id, answer) FROM stdin;
214	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.
225	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic
128	Подойдет общая выписка по счету, главное, чтобы в ней был указан ваш адрес – тот же, который вы указали при регистрации в выбранной вами платежной системе.
168	В ротаторе показаны 12 спортивных прогнозистов «Трибуны», которые были лучшими за последний месяц по статистике прогнозов, допущенных на главную страницу раздела (среди написавших более 4 прогнозов).
169	Аргументированость прогнозов и хорошая статистика заметно увеличивают количество подписчиков. 
170	Аргументированость прогнозов и хорошая статистика заметно увеличивают количество подписчиков. 
171	Аргументированость прогнозов и хорошая статистика заметно увеличивают количество подписчиков. 
172	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru
173	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru
174	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru
175	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru
176	На главной странице РБ размещаются только прогнозы экспертов. Для капперских прогнозов есть раздел "Трибуна". 
177	На главной странице РБ размещаются только прогнозы экспертов. Для капперских прогнозов есть раздел "Трибуна". 
178	Мы не рассчитываем прогнозы, которые не попали на главную страницу "Трибуны" и не участвуют в конкурсе.
184	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/
185	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/
186	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/
187	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/
188	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/
190	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
191	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
192	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
193	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
194	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
195	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
196	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
198	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
199	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
200	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
201	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
202	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
203	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
204	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
205	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
206	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
207	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
208	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
209	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
210	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
211	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.
212	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.
213	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.
215	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.
216	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.
217	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.
218	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.
219	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.
220	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 
221	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 
222	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 
223	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 
224	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic
226	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic
227	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic
228	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.
229	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.
230	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.
231	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.
232	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.
236	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/
237	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/
238	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/
239	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/
240	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/
241	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/
242	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/
243	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/
233	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.
244	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/
245	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских конторах. Рассчитывать, удерживать и перечислять в бюджет суммы налога на выигрыш обязана букмекерская компания (налоговый агент).Налоги идут государству.
246	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских конторах. Рассчитывать, удерживать и перечислять в бюджет суммы налога на выигрыш обязана букмекерская компания (налоговый агент).Налоги идут государству.
247	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских конторах. Рассчитывать, удерживать и перечислять в бюджет суммы налога на выигрыш обязана букмекерская компания (налоговый агент).Налоги идут государству.
248	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.
249	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.
250	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.
251	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.
252	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!
253	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!
254	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!
255	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!
256	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!
257	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!
258	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!
259	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!
260	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!
261	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если вы собираетесь играть в нескольких конторах, и перекидывать деньги из одной в другую, то лучше выбрать платежную систему. Например Skrill. Почти везде на Skrill выплаты обрабатываются в течении нескольких часов.Недостаток платежных систем в том, что там нужно пройти  верификацию .
262	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если вы собираетесь играть в нескольких конторах, и перекидывать деньги из одной в другую, то лучше выбрать платежную систему. Например Skrill. Почти везде на Skrill выплаты обрабатываются в течении нескольких часов.Недостаток платежных систем в том, что там нужно пройти  верификацию .
263	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы.Если вы собираетесь играть в нескольких конторах, и перекидывать деньги из одной в другую, то лучше выбрать платежную систему. Например Skrill. Почти везде на Skrill выплаты обрабатываются в течении нескольких часов.Недостаток платежных систем в том, что там нужно пройти  верификацию .
234	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.
264	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы. Если вы собираетесь играть в нескольких конторах, и перекидывать деньги из одной в другую, то лучше выбрать платежную систему. Например Skrill. Почти везде на Skrill выплаты обрабатываются в течении нескольких часов.Недостаток платежных систем в том, что там нужно пройти  верификацию.
265	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  
266	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  
267	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  
268	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  
269	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 
270	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 
271	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 
272	Можно привязать карту платежной системы, например, Skrill. 
273	Можно привязать карту платежной системы, например, Skrill. 
274	Можно привязать карту платежной системы, например, Skrill. 
275	Можно привязать карту платежной системы, например, Skrill. 
276	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/
277	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/
278	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/
279	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/
280	Методы пополнения/вывода средств доступны в обзоре БК
281	Методы пополнения/вывода средств доступны в обзоре БК
282	Методы пополнения/вывода средств доступны в обзоре БК
283	Методы пополнения/вывода средств доступны в обзоре БК
284	Методы пополнения/вывода средств доступны в обзоре БК
285	Методы пополнения/вывода средств доступны в обзоре БК
286	Информация о лицензии доступна в обзоре БК.
287	Информация о лицензии доступна в обзоре БК.
288	Информация о контактах букмекера доступна в обзоре БК.
289	Информация о контактах букмекера доступна в обзоре БК.
290	С отзывами можно ознакомиться в обзоре БК.
291	С отзывами можно ознакомиться в обзоре БК.
292	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
293	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
294	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
235	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.
295	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
296	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
297	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
298	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
299	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
300	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
301	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
302	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
303	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
304	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
305	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
306	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
307	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
308	Если вы находитесь на территории РФ, перейти можно только на лицензированные и легальные в России БК (требования Роскомнадзора).
309	Если вы находитесь на территории РФ, перейти можно только на лицензированные и легальные в России БК (требования Роскомнадзора).
310	Если вы находитесь на территории РФ, перейти можно только на лицензированные и легальные в России БК (требования Роскомнадзора).
311	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.
312	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.
313	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.
314	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.
315	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.
316	 К ответственности могут быть призваны букмекеры, а не их клиенты. 
317	 К ответственности могут быть призваны букмекеры, а не их клиенты. 
318	 К ответственности могут быть призваны букмекеры, а не их клиенты. 
319	 К ответственности могут быть призваны букмекеры, а не их клиенты. 
320	 К ответственности могут быть призваны букмекеры, а не их клиенты. 
321	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов. 
322	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов. 
323	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов. 
324	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов. 
325	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в интернете запрещены, потому европейские букмекеры не работают с клиентами из Америки. А «серые» рынки стран бывшего СССР попросту не интересны некоторым БК. Информацию о запрещенных странах для конкретной БК можно узнать в обзоре букмекера. 
326	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в интернете запрещены, потому европейские букмекеры не работают с клиентами из Америки. А «серые» рынки стран бывшего СССР попросту не интересны некоторым БК. Информацию о запрещенных странах для конкретной БК можно узнать в обзоре букмекера. 
327	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в интернете запрещены, потому европейские букмекеры не работают с клиентами из Америки. А «серые» рынки стран бывшего СССР попросту не интересны некоторым БК. Информацию о запрещенных странах для конкретной БК можно узнать в обзоре букмекера. 
328	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в интернете запрещены, потому европейские букмекеры не работают с клиентами из Америки. А «серые» рынки стран бывшего СССР попросту не интересны некоторым БК. Информацию о запрещенных странах для конкретной БК можно узнать в обзоре букмекера. 
329	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.
330	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.
331	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.
332	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.
333	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.
334	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.
335	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
336	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
337	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
338	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
339	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
340	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
341	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
342	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
343	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
344	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
345	Переводы, которые проводятся через банк, занимают больше времени, чем переводы посредством платежных интернет-систем (к примеру, платежной системы Skrill).
346	Переводы, которые проводятся через банк, занимают больше времени, чем переводы посредством платежных интернет-систем (к примеру, платежной системы Skrill).
347	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были введены. Если они были введены несколькими методами, букмекеры оставляют за собой право выбрать тот, которым вы сможете вывести средства или ввести ограничение пропорциональности оборота средств по платежным системам. 
348	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были введены. Если они были введены несколькими методами, букмекеры оставляют за собой право выбрать тот, которым вы сможете вывести средства или ввести ограничение пропорциональности оборота средств по платежным системам. 
349	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были введены. Если они были введены несколькими методами, букмекеры оставляют за собой право выбрать тот, которым вы сможете вывести средства или ввести ограничение пропорциональности оборота средств по платежным системам. 
350	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК, и ограничения для конкретной платежной системы
351	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК, и ограничения для конкретной платежной системы
352	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК, и ограничения для конкретной платежной системы
353	Этот вопрос лучше задать представителям банка.
354	Этот вопрос лучше задать представителям банка.
355	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
356	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
357	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
358	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
359	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
360	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
361	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
362	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
363	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
364	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
365	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
366	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
367	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
368	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
369	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
370	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
371	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
372	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
373	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
374	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
375	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
376	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
377	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
378	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
379	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
380	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
381	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
382	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
383	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
384	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
385	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
386	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
387	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
388	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
389	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
390	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
391	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
392	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
393	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
394	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
395	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
396	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
397	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
398	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
399	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
400	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
401	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
402	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
403	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
404	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
405	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
406	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
407	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
408	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
409	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
410	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
411	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
412	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
413	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
414	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
415	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
416	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
417	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
418	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
419	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
420	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
421	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
422	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
423	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
424	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
425	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
426	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
427	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
428	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
429	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
430	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
431	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
432	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
433	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
434	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.
435	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.
436	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.
437	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.
438	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
439	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
440	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
441	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
442	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
443	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
444	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
445	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
446	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
447	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
448	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
449	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
450	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
451	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
452	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
453	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
454	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
455	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
456	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
457	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
458	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
459	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
460	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
461	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
462	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
463	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
464	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
465	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
466	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
467	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
468	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
469	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
470	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
471	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
472	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
473	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
474	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
475	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
476	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
477	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
478	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
479	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
480	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
481	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
482	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
483	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
484	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
485	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
486	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
487	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
488	Ищите способы обхода блокировок в поисковике.
489	Ищите способы обхода блокировок в поисковике.
490	Ищите способы обхода блокировок в поисковике.
491	Ищите способы обхода блокировок в поисковике.
492	Ищите способы обхода блокировок в поисковике. 
493	Ищите способы обхода блокировок в поисковике. 
494	Ищите способы обхода блокировок в поисковике. 
495	Ищите способы обхода блокировок в поисковике. 
496	Ищите способы обхода блокировок в поисковике. 
497	Ищите способы обхода блокировок в поисковике. 
498	Ищите способы обхода блокировок в поисковике. 
499	Ищите способы обхода блокировок в поисковике. 
500	Ищите способы обхода блокировок в поисковике. 
501	Ищите способы обхода блокировок в поисковике. 
502	Ищите способы обхода блокировок в поисковике. 
503	Ищите способы обхода блокировок в поисковике. 
504	Ищите способы обхода блокировок в поисковике. 
505	Ищите способы обхода блокировок в поисковике. 
506	Ищите способы обхода блокировок в поисковике. 
507	Ищите способы обхода блокировок в поисковике. 
508	Ищите способы обхода блокировок в поисковике. 
509	Ищите способы обхода блокировок в поисковике. 
510	Ищите способы обхода блокировок в поисковике. 
511	Ищите способы обхода блокировок в поисковике. 
512	Ищите способы обхода блокировок в поисковике. 
513	Ищите способы обхода блокировок в поисковике. 
514	Ищите способы обхода блокировок в поисковике. 
515	Ищите способы обхода блокировок в поисковике. 
516	Ищите способы обхода блокировок в поисковике. 
517	Ищите способы обхода блокировок в поисковике. 
518	Ищите способы обхода блокировок в поисковике. 
519	Ищите способы обхода блокировок в поисковике. 
520	Ищите способы обхода блокировок в поисковике. 
521	Ищите способы обхода блокировок в поисковике. 
522	Ищите способы обхода блокировок в поисковике. 
523	Ищите способы обхода блокировок в поисковике. 
524	Ищите способы обхода блокировок в поисковике. 
525	Ищите способы обхода блокировок в поисковике. 
526	Ищите способы обхода блокировок в поисковике. 
527	Ищите способы обхода блокировок в поисковике. 
528	Ищите способы обхода блокировок в поисковике. 
529	Ищите способы обхода блокировок в поисковике. 
530	Ищите способы обхода блокировок в поисковике. 
531	Ищите способы обхода блокировок в поисковике. 
532	Критерии оценки капперов/капперских сайтов доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/
533	Критерии оценки капперов/капперских сайтов доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/
534	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/
535	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/
536	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/
537	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/
538	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/
539	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/
540	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.
541	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.
542	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.
543	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.
544	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.
545	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.
546	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.
547	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.
548	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.
549	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют. В любом случае, мы не рекомендуем повторную регистрацию – если вы забыли логин или пароль от своего аккаунта в БК, свяжитесь по этому поводу со службой поддержки конторы.
550	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют. В любом случае, мы не рекомендуем повторную регистрацию – если вы забыли логин или пароль от своего аккаунта в БК, свяжитесь по этому поводу со службой поддержки конторы.
551	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют. В любом случае, мы не рекомендуем повторную регистрацию – если вы забыли логин или пароль от своего аккаунта в БК, свяжитесь по этому поводу со службой поддержки конторы.
552	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».
553	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».
554	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».
555	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».
556	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок стали мизерными.   
557	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок стали мизерными.   
558	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок стали мизерными.   
559	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок стали мизерными.   
560	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается в том, что букмекер уменьшает игроку максимально возможную сумму ставки на определенные события или для счета в целом, вплоть до нескольких долларов США, что делает профессиональную игру в БК невозможной.Порезка счетов, или снижение лимита ставок, практикуется фундаментальными букмекерскими конторами на счетах игроков-вилочников и прочих спекулирующих на линиях контор игроков. Сумма ставок, выигрыши или проигрыши не влияют на решение трейдера снизить максимум на том или ином счету. Режут счета из-за стиля ставок, а не их количества или суммы выигрышей. Если не ставить на «вилки», «коридоры» и «валуи», шансы быть порезанным ничтожны. 
561	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается в том, что букмекер уменьшает игроку максимально возможную сумму ставки на определенные события или для счета в целом, вплоть до нескольких долларов США, что делает профессиональную игру в БК невозможной.Порезка счетов, или снижение лимита ставок, практикуется фундаментальными букмекерскими конторами на счетах игроков-вилочников и прочих спекулирующих на линиях контор игроков. Сумма ставок, выигрыши или проигрыши не влияют на решение трейдера снизить максимум на том или ином счету. Режут счета из-за стиля ставок, а не их количества или суммы выигрышей. Если не ставить на «вилки», «коридоры» и «валуи», шансы быть порезанным ничтожны. 
562	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается в том, что букмекер уменьшает игроку максимально возможную сумму ставки на определенные события или для счета в целом, вплоть до нескольких долларов США, что делает профессиональную игру в БК невозможной.Порезка счетов, или снижение лимита ставок, практикуется фундаментальными букмекерскими конторами на счетах игроков-вилочников и прочих спекулирующих на линиях контор игроков. Сумма ставок, выигрыши или проигрыши не влияют на решение трейдера снизить максимум на том или ином счету. Режут счета из-за стиля ставок, а не их количества или суммы выигрышей. Если не ставить на «вилки», «коридоры» и «валуи», шансы быть порезанным ничтожны. 
563	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается в том, что букмекер уменьшает игроку максимально возможную сумму ставки на определенные события или для счета в целом, вплоть до нескольких долларов США, что делает профессиональную игру в БК невозможной.Порезка счетов, или снижение лимита ставок, практикуется фундаментальными букмекерскими конторами на счетах игроков-вилочников и прочих спекулирующих на линиях контор игроков. Сумма ставок, выигрыши или проигрыши не влияют на решение трейдера снизить максимум на том или ином счету. Режут счета из-за стиля ставок, а не их количества или суммы выигрышей. Если не ставить на «вилки», «коридоры» и «валуи», шансы быть порезанным ничтожны. 
564	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.
565	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.
566	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.
567	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.
568	Информация о букмекерских вилках находится здесь: https://bookmaker-ratings.ru/bukmekerskie-vilki-chto-e-to-i-kak-zarabotat-na-nih/
569	Информация о букмекерских вилках находится здесь: https://bookmaker-ratings.ru/bukmekerskie-vilki-chto-e-to-i-kak-zarabotat-na-nih/
570	Информация о букмекерских вилках находится здесь: https://bookmaker-ratings.ru/bukmekerskie-vilki-chto-e-to-i-kak-zarabotat-na-nih/
571	БК не хочет с вами играть, смените контору. 
572	БК не хочет с вами играть, смените контору. 
573	БК не хочет с вами играть, смените контору. 
574	БК не хочет с вами играть, смените контору. 
575	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или более выбора из разных событий, где ставка выигрывает, если хотя бы один выбор не совпадет с результатом.(Напомним, в экспрессе наоборот, чтобы выиграть ставку, необходимо, чтобы все выборы совпали с результатами). Итоговый коэффициент антиэкспресса рассчитывается на основе вероятности, противоположной вероятности выигрыша по экспрессу, составленному из тех же выборов.
576	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или более выбора из разных событий, где ставка выигрывает, если хотя бы один выбор не совпадет с результатом.(Напомним, в экспрессе наоборот, чтобы выиграть ставку, необходимо, чтобы все выборы совпали с результатами).Итоговый коэффициент антиэкспресса рассчитывается на основе вероятности, противоположной вероятности выигрыша по экспрессу, составленному из тех же выборов.
577	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или более выбора из разных событий, где ставка выигрывает, если хотя бы один выбор не совпадет с результатом.(Напомним, в экспрессе наоборот, чтобы выиграть ставку, необходимо, чтобы все выборы совпали с результатами).Итоговый коэффициент антиэкспресса рассчитывается на основе вероятности, противоположной вероятности выигрыша по экспрессу, составленному из тех же выборов.
578	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или более выбора из разных событий, где ставка выигрывает, если хотя бы один выбор не совпадет с результатом.(Напомним, в экспрессе наоборот, чтобы выиграть ставку, необходимо, чтобы все выборы совпали с результатами).Итоговый коэффициент антиэкспресса рассчитывается на основе вероятности, противоположной вероятности выигрыша по экспрессу, составленному из тех же выборов.
579	«Коридором» обычно называют комбинацию из двух ставок в различных букмекерских конторах. Хотя данные две ставки должны быть поставлены на взаимоисключающие исходы, обе имеют шанс сработать одновременно. В основу этих ставок поставлена разница (коридор) между значениями тоталов или фор.
580	«Коридором» обычно называют комбинацию из двух ставок в различных букмекерских конторах. Хотя данные две ставки должны быть поставлены на взаимоисключающие исходы, обе имеют шанс сработать одновременно. В основу этих ставок поставлена разница (коридор) между значениями тоталов или фор.
581	Информация о ставках на фору здесь: https://bookmaker-ratings.ru/wiki/stavki-na-fory/
582	Информация о ставках на фору здесь: https://bookmaker-ratings.ru/wiki/stavki-na-fory/
583	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем уточнить у службы поддержки вашего букмекера или в его правилах.
584	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем уточнить у службы поддержки вашего букмекера или в его правилах.
585	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем уточнить у службы поддержки вашего букмекера или в его правилах.
586	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем уточнить у службы поддержки вашего букмекера или в его правилах.
587	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем уточнить у службы поддержки вашего букмекера или в его правилах.
588	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при условии, что с этой системы будет сделан депозит (хотя бы минимально допустимый).
589	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при условии, что с этой системы будет сделан депозит (хотя бы минимально допустимый).
590	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при условии, что с этой системы будет сделан депозит (хотя бы минимально допустимый).
591	Попробуйте обратиться в службу поддержки "Киви". 
592	Попробуйте обратиться в службу поддержки "Киви". 
593	Попробуйте обратиться в службу поддержки "Киви". 
594	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.
595	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.
596	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.
597	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридористы», «послегольщики», организаторы договорных матчей и так далее.
598	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридористы», «послегольщики», организаторы договорных матчей и так далее.
599	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридористы», «послегольщики», организаторы договорных матчей и так далее.
600	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.
601	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.
602	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.
603	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
604	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
605	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
606	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
607	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документы, мошенничество с кредитными картами, ставка на договорной матч. В некоторых конторах игра без элемента риска («вилки» и другие тактики профессиональной игры) может послужить поводом для блокировки счета, но это редкость, обычная мера в таких случаях – порезка максимумов.
608	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документы, мошенничество с кредитными картами, ставка на договорной матч. В некоторых конторах игра без элемента риска («вилки» и другие тактики профессиональной игры) может послужить поводом для блокировки счета, но это редкость, обычная мера в таких случаях – порезка максимумов.
609	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документы, мошенничество с кредитными картами, ставка на договорной матч. В некоторых конторах игра без элемента риска («вилки» и другие тактики профессиональной игры) может послужить поводом для блокировки счета, но это редкость, обычная мера в таких случаях – порезка максимумов.
610	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документы, мошенничество с кредитными картами, ставка на договорной матч. В некоторых конторах игра без элемента риска («вилки» и другие тактики профессиональной игры) может послужить поводом для блокировки счета, но это редкость, обычная мера в таких случаях – порезка максимумов.
611	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документы, мошенничество с кредитными картами, ставка на договорной матч. В некоторых конторах игра без элемента риска («вилки» и другие тактики профессиональной игры) может послужить поводом для блокировки счета, но это редкость, обычная мера в таких случаях – порезка максимумов.
612	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские карты и платежные системы. После того как счет пополнен, Вы можете выбирать интересующие Вас события, анализировать коэффициенты и делать ставки. Если Вас интересует технический момент, как делать эти самые ставки, укажите конкретную БК. Однако, я думаю, Вы сможете разобраться самостоятельно, ведь практически все современные конторы имеют интуитивно понятный интерфейс. 
613	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские карты и платежные системы. После того как счет пополнен, Вы можете выбирать интересующие Вас события, анализировать коэффициенты и делать ставки. Если Вас интересует технический момент, как делать эти самые ставки, укажите конкретную БК. Однако, я думаю, Вы сможете разобраться самостоятельно, ведь практически все современные конторы имеют интуитивно понятный интерфейс. 
614	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские карты и платежные системы. После того как счет пополнен, Вы можете выбирать интересующие Вас события, анализировать коэффициенты и делать ставки. Если Вас интересует технический момент, как делать эти самые ставки, укажите конкретную БК. Однако, я думаю, Вы сможете разобраться самостоятельно, ведь практически все современные конторы имеют интуитивно понятный интерфейс. 
615	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские карты и платежные системы. После того как счет пополнен, Вы можете выбирать интересующие Вас события, анализировать коэффициенты и делать ставки. Если Вас интересует технический момент, как делать эти самые ставки, укажите конкретную БК. Однако, я думаю, Вы сможете разобраться самостоятельно, ведь практически все современные конторы имеют интуитивно понятный интерфейс. 
616	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские карты и платежные системы. После того как счет пополнен, Вы можете выбирать интересующие Вас события, анализировать коэффициенты и делать ставки. Если Вас интересует технический момент, как делать эти самые ставки, укажите конкретную БК. Однако, я думаю, Вы сможете разобраться самостоятельно, ведь практически все современные конторы имеют интуитивно понятный интерфейс. 
617	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки БК.
618	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки БК.
619	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки БК.
620	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки БК.
621	Следите за новостями на нашем сайте.
622	Следите за новостями на нашем сайте.
623	Следите за новостями на нашем сайте.
624	Следите за новостями на нашем сайте.
625	Следите за новостями на нашем сайте.
626	Следите за новостями на нашем сайте.
627	Список букмекеров, поддерживающих русский язык доступен здесь: https://bookmaker-ratings.ru/supported_languages/russkij/
628	Список букмекеров, поддерживающих русский язык доступен здесь: https://bookmaker-ratings.ru/supported_languages/russkij/
629	Список букмекеров, принимающих ставки на киберспорт доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/bukmekery-prinimayushhie-stavki-na-kibersport/
630	Список букмекеров, принимающих ставки на киберспорт доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/bukmekery-prinimayushhie-stavki-na-kibersport/
631	Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=legal-only/
632	Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=legal-only/
633	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/
634	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/
635	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/
636	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/
637	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru
638	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru
639	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru
640	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru
641	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru
642	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru
643	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/
644	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/
645	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/
646	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/
647	Маржа — комиссия букмекера с рынка ставок, которая закладывается в коэффициенты конторы. Подробнее здесь: https://bookmaker-ratings.ru/wiki/marzha/
648	Маржа — комиссия букмекера с рынка ставок, которая закладывается в коэффициенты конторы. Подробнее здесь: https://bookmaker-ratings.ru/wiki/marzha/
649	Маржа — комиссия букмекера с рынка ставок, которая закладывается в коэффициенты конторы. Подробнее здесь: https://bookmaker-ratings.ru/wiki/marzha/
650	Система — разновидность ставок, представляющих собой несколько экспресс-ставок. Подобнее здесь: https://bookmaker-ratings.ru/wiki/sistema/
651	Система — разновидность ставок, представляющих собой несколько экспресс-ставок. Подобнее здесь: https://bookmaker-ratings.ru/wiki/sistema/
652	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugie-metodyi-obmana/
653	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugie-metodyi-obmana/
654	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugie-metodyi-obmana/
655	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugie-metodyi-obmana/
656	Букмекерские СРО (саморегулируемые организации букмекеров) — некоммерческие организации, объединяющие букмекерские конторы и тотализаторы в Российской Федерации. Подробнее здесь: https://bookmaker-ratings.ru/wiki/bukmekerskie-sro/
657	Букмекерские СРО (саморегулируемые организации букмекеров) — некоммерческие организации, объединяющие букмекерские конторы и тотализаторы в Российской Федерации. Подробнее здесь: https://bookmaker-ratings.ru/wiki/bukmekerskie-sro/
658	Материалы про интернет-издания с рейтингами букмекерских контор доступны здесь: https://bookmaker-ratings.ru/wiki-category/wiki-izdaniya-s-rejtingami/
659	Материалы про интернет-издания с рейтингами букмекерских контор доступны здесь: https://bookmaker-ratings.ru/wiki-category/wiki-izdaniya-s-rejtingami/
660	Сканеры вилок – это программы, сканирующие линию ставок многочисленных онлайн-букмекеров в режиме реального времени и определяющие арбитражные ситуации, известные также как букмекерские вилки. Подробнее здесь: https://bookmaker-ratings.ru/wiki/skanery-vilok-bukmekerskie/
661	Сканеры вилок – это программы, сканирующие линию ставок многочисленных онлайн-букмекеров в режиме реального времени и определяющие арбитражные ситуации, известные также как букмекерские вилки. Подробнее здесь: https://bookmaker-ratings.ru/wiki/skanery-vilok-bukmekerskie/
662	Мультиаккаунтинг – регистрация более одного счета на сайте букмекерской конторы, в том числе на поддельные или чужие паспортные данные. Подобнее здесь: https://bookmaker-ratings.ru/wiki/mul-tiakkaunting/
663	Мультиаккаунтинг – регистрация более одного счета на сайте букмекерской конторы, в том числе на поддельные или чужие паспортные данные. Подобнее здесь: https://bookmaker-ratings.ru/wiki/mul-tiakkaunting/
664	Верификация игрока — проверка игрока букмекерской конторой, в ходе которой компания устанавливает соответствие личности игрока указанным им паспортным данным, а также верифицирует другую информацию счета. Подробнее здесь: https://bookmaker-ratings.ru/wiki/verifikatsiya-igroka-bukmekerskoj-kontory/
665	Верификация игрока — проверка игрока букмекерской конторой, в ходе которой компания устанавливает соответствие личности игрока указанным им паспортным данным, а также верифицирует другую информацию счета. Подробнее здесь: https://bookmaker-ratings.ru/wiki/verifikatsiya-igroka-bukmekerskoj-kontory/
666	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все обстоятельства и постараться найти пути решения жалоб игроков.
667	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все обстоятельства и постараться найти пути решения жалоб игроков.
668	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все обстоятельства и постараться найти пути решения жалоб игроков.
669	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все обстоятельства и постараться найти пути решения жалоб игроков.
670	Имеется в виду получение выигрыша с оффшорной БК? В настоящий момент актуальной является не проблема получения крупной суммы, а возможность перевода из иностранных контор денег на карты российских банков в целом. Если ваш банк обслуживает счета оффшорных БК, то проблем быть не должно. 
671	Имеется в виду получение выигрыша с оффшорной БК? В настоящий момент актуальной является не проблема получения крупной суммы, а возможность перевода из иностранных контор денег на карты российских банков в целом. Если ваш банк обслуживает счета оффшорных БК, то проблем быть не должно. 
672	На деле, это распространенное правило, и действует оно в большинстве букмекерских контор. То, как и к кому применяется это правило, зависит от конкретного случая.
673	На западе отсутствует понятие «регистрация». Адрес человека там, где он живет. За ваш адрес принимается указанный на выписке из банка или квитанции за коммунальный платеж.
674	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.
675	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.
676	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.
677	При условии, что все документы для проверки личности и адреса были вами предоставлены, вы должны отправлять в букмекерские конторы более 2500 евро в месяц.
678	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профессиональную live-статистику. Их услугами, как правило, пользуются букмекеры, которые не имеют собственных скаутов.  Самая актуальная статистика, пожалуй, у ODDS.RU
679	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профессиональную live-статистику. Их услугами, как правило, пользуются букмекеры, которые не имеют собственных скаутов.  Самая актуальная статистика, пожалуй, у ODDS.RU
680	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профессиональную live-статистику. Их услугами, как правило, пользуются букмекеры, которые не имеют собственных скаутов.  Самая актуальная статистика, пожалуй, у ODDS.RU
681	На территории РФ блокируют сайты БК, у которых нет лицензии ФНС. Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=legal-only/
682	На территории РФ блокируют сайты БК, у которых нет лицензии ФНС. Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=legal-only/
683	На самом сайте минимум полезной информации о сути сделки и ее условиях. Никаких статистических данных для оцнки эффективности нет.  Также сотрудник этого ресурса уверял, что они имеют отношение к БК Олимп (или Olimp). Представители этих БК, которые работают с нами, это опровергли.  Я не рекомендую Вам доверять им деньги. 
684	Нет. Сроки перевода следует уточнить в банке или у сотрудников платежной системы, если вы отправили средства в банк из нее. Обычно это занимает 3-5 банковских дней.
685	Обычно перевод осуществляется в тот же или на следующий день. В то же время, точный срок зависит от букмекерской конторы, клиентом которой вы являетесь.
686	Обычно перевод осуществляется в тот же или на следующий день. В то же время, точный срок зависит от букмекерской конторы, клиентом которой вы являетесь.
687	Ответ на этот вопрос зависит от того, о каком букмекере и о карте какого банка идет речь. Мы настоятельно рекомендуем использовать для этих целей Visa Classic, поскольку Electron предназначена в первую очередь для использования в банкоматах и наземных терминалах.
688	Перепроверь все еще раз. Понимаю что звучит глупо, но мне как то помогло то что я почистил кэш, cookie , историю в браузерах и потом получилось зайти. Попробуй проверить почту на которую регистрировался и попробуй восстановить пароль.  Надеюсь решите проблему.
689	Перепроверь все еще раз. Понимаю что звучит глупо, но мне как то помогло то что я почистил кэш, cookie , историю в браузерах и потом получилось зайти. Попробуйте проверить почту на которую регистрировались и восстановить пароль.  Надеюсь решите проблему.
690	По правилам букмекерских контор, они не несут ответственности за предоставленную в лайве информацию, так как эти данные (счет матча, т.д.) получают от партнеров. Потому ставку не вернут.
691	По правилам букмекерских контор, они не несут ответственности за предоставленную в лайве информацию, так как эти данные (счет матча, т.д.) получают от партнеров. Потому ставку не вернут.
692	Подойдет общая выписка по счету, главное, чтобы в ней был указан ваш адрес – тот же, который вы указали при регистрации в выбранной вами платежной системе.
693	При регистрации в зарубежных букмекерских конторах поля можно заполнить, использовав либо перевод, либо транслитерацию.
694	Приложение РБ для Android доступно здесь: https://bookmaker-ratings.ru/android-app/
695	Приложение РБ для Android доступно здесь: https://bookmaker-ratings.ru/android-app/
696	Приложение РБ для iOS доступно здесь: https://itunes.apple.com/ru/app/рб-прогнозы-на-спорт/id1188607891?mt=8
697	Приложение РБ для iOS доступно здесь: https://itunes.apple.com/ru/app/рб-прогнозы-на-спорт/id1188607891?mt=8
698	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.
699	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.
700	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.
701	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.
702	Из тех, которые могли бы порекомендовать: Marathonbet, Sbobet.
703	Из тех, которые могли бы порекомендовать: Marathonbet, Sbobet.
704	На мастер карт можно выводить через систему Ecommpay, максимальная сумма на одну транзакцию 15000 рублей. Советую пользоваться платежными системами Skrill или Neteller. Вывод через них намного быстрее и выводить можно гораздо больше.
705	У всех бывают серии неудач. Никто не заставляет ставить по мнению экспертов. Наоборот, если вы уверены в их убыточной стратегии, ставьте на противоположный исход. 
706	У всех бывают серии неудач. Никто не заставляет ставить по мнению экспертов. Наоборот, если вы уверены в их убыточной стратегии, ставьте на противоположный исход. 
707	У всех бывают серии неудач. Никто не заставляет ставить по мнению экспертов. Наоборот, если вы уверены в их убыточной стратегии, ставьте на противоположный исход. 
708	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.
709	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.
710	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.
711	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.
712	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/
713	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/
714	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/
715	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/
716	У нас есть рейтинг букмекеров от пользователей – демонстрация настоящей демократии на «РБ». Мы никак не влияем на эти оценки. Только вы решаете, какое место займет контора: https://bookmaker-ratings.ru/bookmakers-homepage/user-rating/
717	У нас есть рейтинг букмекеров от пользователей – демонстрация настоящей демократии на «РБ». Мы никак не влияем на эти оценки. Только вы решаете, какое место займет контора: https://bookmaker-ratings.ru/bookmakers-homepage/user-rating/
718	Проходимость прогнозов не учитывается в рейтинге капперов. Мы оцениваем капперов по нашим  критериям: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/
719	Проходимость прогнозов не учитывается в рейтинге капперов. Мы оцениваем капперов по нашим  критериям: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/
720	Разумеется. Можно играть во всех существующих БК, никаких запретов на это нет. Учтите, мы рекомендуем играть только в тех конторах, которые имеют оценку «4» и «5» нашего рейтинга: https://bookmaker-ratings.ru/rejting-bukmekerov/vse-bukmekery/
721	Разумеется. Можно играть во всех существующих БК, никаких запретов на это нет. Учтите, мы рекомендуем играть только в тех конторах, которые имеют оценку «4» и «5» нашего рейтинга: https://bookmaker-ratings.ru/rejting-bukmekerov/vse-bukmekery/
722	Режут максимальную ставку или вовсе могут заблокировать счет, если это прописано в правилах. Но профессиональные БК, которые не ограничивают размер максимальной ставки и не вводят другие санкции для игроков, независимо от того, выигрывают или проигрывают. Список: https://bookmaker-ratings.ru/bookmakers-homepage/bukmekerskie-kontory-dlya-professionalov/ 
723	Режут максимальную ставку или вовсе могут заблокировать счет, если это прописано в правилах. Но профессиональные БК, которые не ограничивают размер максимальной ставки и не вводят другие санкции для игроков, независимо от того, выигрывают или проигрывают. Список: https://bookmaker-ratings.ru/bookmakers-homepage/bukmekerskie-kontory-dlya-professionalov/ 
724	Самостоятельных ограничений нет. Но мы можем проверить пользователя на какие-либо нарушения с его стороны. Если Вы считаете, что пользователь нарушил правила,  то напишите, пожалуйста, на почту: support@bookmaker-ratings.ru.
725	Скорее всего Вам придется пройти процедуру верификации после запроса на вывод средств. 
726	Скорее всего вы не подтвердили свою почту. Вам должно были прислать письмо с подтверждением почты и только после подтверждения будут приходить прогнозы. 
727	Скорее всего, вы пользуетесь разными почтовыми адресами, и разными соц сетями. Попробуйте зайти с другого профиля.
728	Советуем изначально выбрать БК с русской версией и поддержкой на русском языке. Вы найдете список таких контор здесь: https://bookmaker-ratings.ru/rejting-bukmekerov/bukmekery-na-russkom/
729	Ставки на страйк-ауты принимает Марафон и Бетсити
730	Такие верификаторы есть. Их можно легко найти в поисковике. 
731	Такие сайты есть. Воспользуйтесь поисковиком для их нахождения. Также можно обратиться к стандартным инструментам "Эксель".
732	Только если у вас есть все документы на эти номера, и вы можете подтвердить что вы являетесь их владельцем. Обратитесь в поддержку букмекера.
733	У каждой конторы свои правила расчета карточек. Кто-то красную за две желтых считает, то есть как два очка, грубо говоря. И неважно, прямая она или нет. А кто-то вообще даже две ЖК повлекшие удаление не считает за ЖК. В любом случае, главное чтобы с правилами конторы расчет ставки не расходился.
734	Удобнее всего найти подробную информацию по данным лигам можно на сайтах этих самых лиг и их представительствах в социальных сетях. Особо обширно лиги и команды низших дивизионов представлены в Twitter.
735	Указанная Вами БК не работает в рамках российского законодательства, поэтому и блокируется Роскомнадзором. Мы, в свою очередь, не имеем права размещать на своем сайте ссылки, которые ведут на запрещенные сайты. Поэтому Вы и перенаправляетесь на ""1хставку"", поскольку эта БК разрешена в РФ.
736	Уточните, пожалуйста, данный вопрос у службы поддержки БК.
737	Уточните, пожалуйста, данный вопрос у службы поддержки БК.
738	Учетная запись через соцсеть тоже может принимать участие в конкурсе - необходимо просто нажать на соответствующую кнопку на этой странице   
739	Во многих БК для вывода денег без комиссии необходимо проставить сумму депозита. Подробности лучше уточнить в службе поддержки БК.
740	Чтобы начать пользоваться всеми возможностями Skrill, нужно пройти процедуру верификации. Для верификации счета вам потребуется отсканировать и послать документы, подтверждающие вашу личность и адрес. Для подтверждения личности подойдут паспорт, водительские права, военный билет. Для подтверждения адреса подойдут выписка со счета в банке с вашим именем и адресом или квитанция оплаты за коммунальные услуги.
741	Чтобы узнать, какие БК и какой бонус предлагают, зайдите в наш рейтинг букмекерских контор и выберите «Упорядочить по бонусу». Детальная информация о бонусе указана в обзорах букмекеров.
742	Эти деньги попали на ваш счет в Skrill. Вы с ними можете делать что захотите.  
743	Это два разных сайта. Если вы просто не можете зайти на сайт, воспользуйтесь одним из средств обхода блокировки, описанных в сети.
744	Это зависит как от популярности события, так и от возможных ограничений (порезка максимумов), наложенных букмекерской конторой на ваш аккаунт.
745	Это любой другой счет, который не указан в росписи, обычно ставка выигрывает, когда одна из команд забивает как минимум 4 гола. Это что касается футбола.
746	Это можно сделать при помощи банковского перевода или кредитной карточки.
747	Это мультиаккаунтинг. Контора имеет право Вас заблокировать. 
748	Биржи ставок отличаются от букмекерских контор тем, что игроки делают ставки не против букмекера, а друг против друга: https://bookmaker-ratings.ru/bookmakers-homepage/birzhi-stavok/
749	Биржи ставок отличаются от букмекерских контор тем, что игроки делают ставки не против букмекера, а друг против друга: https://bookmaker-ratings.ru/bookmakers-homepage/birzhi-stavok/
750	Я-бот. Я отвечаю только на вопросы, связанные с РБ
751	Я-бот. Я отвечаю только на вопросы, связанные с РБ
752	Я-бот. Я отвечаю только на вопросы, связанные с РБ
753	Я-бот. Я отвечаю только на вопросы, связанные с РБ
754	Я-бот. Я отвечаю только на вопросы, связанные с РБ
755	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/
756	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/
757	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/
758	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/
759	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/
760	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/
761	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/
762	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/
763	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/
0	Зайдите в свой профиль и нажмите на вкладку "Дать прогноз" или перейдите по ссылке: https://bookmaker-ratings.ru/tribune/add-tip/
1	Вы можете редактировать текстовую часть прогноза до его размещения на главной странице "Трибуны". Если ошибка допущена в заголовке или ставке, напишите об этом в комментариях к прогнозу, наши модераторы внесут необходимые изменения. 
13	Пожалуйста, напишите об этом непосредственно в комментариях к прогнозу.
81	 Стабильный выигрыш сам по себе спекуляцией не является. Вероятность снижения суммы максимальной ставки увеличивается, если вы очень успешный игрок, но всегда можно уйти в другую БК, если суммы ставок стали мизерными.   
2	Условная сумма каждой ставки — 1000 рублей. Подробнее: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/
3	Вы можете разместить не более трёх ставок в одном материале. 
4	Вы можете добавить видео к описанию прогноза, вставив ссылку в соответствующее поле. В описании вашего видео на Youtube обязательно должна быть ссылка на «Рейтинг Букмекеров». Текстовая часть прогноза обязательна.
5	При публикации прогноза в поле "Тип ставки" необходимо выбрать "Экспресс". Затем нужно добавить необходимое количество исходов, нажав кнопку "Добавить событие".
6	Напишите, пожалуйста, нам на почту (support@bookmaker-ratings.ru), указав названия команд. Также Вы можете выбрать вид спорта "Другие" и самостоятельноо заполнить все поля прогноза.
7	Картинка должна иметь отношение к событию в прогнозе. Идеальные параметры — 760?480 или хотя бы что-то около того.
14	 Заголовки прописываются вручную в момент оформления прогноза, соответственно, изменить их уже нельзя, поскольку технически пользователи не могут вносить корректировки в ранее размещенные материалы. Однако все прогнозы останутся в Вашей учетной записи и будут доступны для ознакомления.  
15	 Трибуна была создана для того, чтобы пользователи могли делиться своими мыслями. Никаких поощрений за количество прогнозов не предусмотрено. Но если Ваша статистика будет действительно впечатляющей, руководство РБ обязательно обратит на это внимание.
16	Мой профиль, вкладка "Прогнозы".
23	Выберите вкладку "Уведомления" в выпадающем меню профиля.
52	 Вывести можно на ту систему через которую пополняли. Нужно вывести средства на Skrill, потом пополнить через Neteller и дальше можno вывести на Neteller. 
24	Вы можете управлять уведомлениями, выбрав вкладку "Настройки уведомлений" из выпадающего меню профиля.
25	Комментарий может быть удален по причине наличия спама, оскорблений, мата, откровенного обмана, рекламы или запрещенных ссылок.  
26	 Все отзывы проходят модерацию, поэтому публикуются с небольшой задержкой.  
27	Вы можете редактировать отзыв, выбрав его во вкладке "Отзывы" Вашего профиля. Учтите, измененный отзыв вновь проходит модерацию.
28	Конкурсы на сайте можно найти в соответствующем разделе: https://bookmaker-ratings.ru/competitions/ Учтите, конкурсы проводятся не только на сайте, но и в наших пабликах, ссылки на которые Вы можете найти на главной странице сайта (немного выше прогнозов).
29	Ежегодно мы разыгрываем место в команде экспертов РБ. Следите за конкусами и побеждайте в них.
30	Методика подсчета прибыли/убытка очень проста: https://bookmaker-ratings.ru/kapperskaya-tribuna-kak-my-podschity-vaem-statistiku-prognozov/
31	Статистику прогнозов нашей команды экспертов можно найти здесь: https://bookmaker-ratings.ru/infographics-template/tips_stats/
32	Вы можете увидеть 12 лучших капперов "Трибуны" за последние 30 дней здесь: https://bookmaker-ratings.ru/tribune/
33	В ротаторе показаны 12 спортивных прогнозистов «Трибуны», которые были лучшими за последний месяц по статистике прогнозов, допущенных на главную страницу раздела (среди написавших более 4 прогнозов).
34	Аргументированость прогнозов и хорошая статистика заметно увеличивают количество подписчиков. 
35	 Мы принимаем все замечания и предложения от наших пользователей. Напишите, нам на почту, пожалуйста: support@bookmaker-ratings.ru
38	При размещении прогноза в выпадающем меню поля "Букмекер" доступны только лучшие зарубежные конторы и БК, имеющие лицензию ФНС.   
44	Общая статистика по жалобам доступна здесь: https://bookmaker-ratings.ru/complaints/#statistic
45	Обычно документы проверяют в течении двух-трех дней. Если с момента отправки документов прошло более 2 недель, заполняйте форму жалобы.
49	Мы рекомендуем ставить у букмекеров с оценкой 4 и 5!
55	Методы пополнения/вывода средств доступны в обзоре БК
56	Информация о лицензии доступна в обзоре БК.
57	Информация о контактах букмекера доступна в обзоре БК.
80	В конторах с оценкой «4» и «5» в нашего рейтинга за «догон» санкции против игрока не принимают, поскольку эта стратегия предполагает риск – вы можете так и не «догнать».
58	С отзывами можно ознакомиться в обзоре БК.
64	В большинстве случаев это зависит от законодательства данной страны или от того, заинтересована ли букмекерская компания в организации своей деятельности в этой стране. Так, в США ставки на спорт в интернете запрещены, потому европейские букмекеры не работают с клиентами из Америки. А «серые» рынки стран бывшего СССР попросту не интересны некоторым БК. Информацию о запрещенных странах для конкретной БК можно узнать в обзоре букмекера. 
83	Если вам снизили максимумы, обратитесь в службу поддержки БК, но вряд ли их поднимут до прежнего уровня.
87	«Коридором» обычно называют комбинацию из двух ставок в различных букмекерских конторах. Хотя данные две ставки должны быть поставлены на взаимоисключающие исходы, обе имеют шанс сработать одновременно. В основу этих ставок поставлена разница (коридор) между значениями тоталов или фор.
89	Большинство контор не запрещают оформление ставок на один и тот же исход более одного раза (например, William Hill разрешает). Впрочем, в некоторых конторах это все же запрещено, потому рекомендуем уточнить у службы поддержки вашего букмекера или в его правилах.
90	В некоторых БК он работает только на ввод, вам следует уточнить у службы поддержки вашего букмекера. Вывести баланс в таких конторах можно на карту, банковский счет или другую платежную систему, при условии, что с этой системы будет сделан депозит (хотя бы минимально допустимый).
95	Если речь о БК, принимающих РБ в качестве посредника, и вы уже безрезультатно обращались в ее службу поддержки, заполните форму жалобы:  https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
96	Поводов для блокировки несколько и они могут незначительно разниться от конторы к конторе. Так, среди возможных причин блокировки счета регистрация более одного счета на свое имя или на чужие документы, мошенничество с кредитными картами, ставка на договорной матч. В некоторых конторах игра без элемента риска («вилки» и другие тактики профессиональной игры) может послужить поводом для блокировки счета, но это редкость, обычная мера в таких случаях – порезка максимумов.
103	Бонусы и акции в букмекерских конторах доступны в разделе "Бонусы": https://bookmaker-ratings.ru/bonusy-bukmekerov/
104	«Матч-центр» от «Рейтинга Букмекеров» – ваш источник спортивной статистики, календаря, результатов и прогнозов: https://odds.ru
105	В разделе "Знания" опубликованы материалы, которые помогут вам научиться ставкам на спорт и отточить свои навыки: https://bookmaker-ratings.ru/knowledge/
114	Рейтинг БК может быть понижен по причине большого количества обоснованных жалоб, проигнорированной жалобы, отказа реагировать на жалобы. Этот процесс не мгновенный, ведь нужно детально взвесить все обстоятельства и постараться найти пути решения жалоб игроков.
115	Имеется в виду получение выигрыша с оффшорной БК? В настоящий момент актуальной является не проблема получения крупной суммы, а возможность перевода из иностранных контор денег на карты российских банков в целом. Если ваш банк обслуживает счета оффшорных БК, то проблем быть не должно. 
116	На деле, это распространенное правило, и действует оно в большинстве букмекерских контор. То, как и к кому применяется это правило, зависит от конкретного случая.
117	На западе отсутствует понятие «регистрация». Адрес человека там, где он живет. За ваш адрес принимается указанный на выписке из банка или квитанции за коммунальный платеж.
118	Минимумов нет, но использоваться Skrill выгодно крупным игрокам, так как депозиты с кредитных карт и выплаты становятся бесплатными только после получения VIP статуса.
119	При условии, что все документы для проверки личности и адреса были вами предоставлены, вы должны отправлять в букмекерские конторы более 2500 евро в месяц.
122	На самом сайте минимум полезной информации о сути сделки и ее условиях. Никаких статистических данных для оцнки эффективности нет.  Также сотрудник этого ресурса уверял, что они имеют отношение к БК Олимп (или Olimp). Представители этих БК, которые работают с нами, это опровергли.  Я не рекомендую Вам доверять им деньги. 
136	Внимательно прочитайте правила букмекера. Там указаны все условия и нюансы по ставке. Также Вы можете обратиться в службу поддержки букмекера.
137	Вы можете самостоятельно настроить нужные фильтры (столбик слева) в разделе "Букмекеры": https://bookmaker-ratings.ru/bookmakers-homepage/vse-bukmekerskie-kontory/
72	Если у Вас возникают технические трудности с сайтом, можете написать на почту support@bookmaker-ratings.ru, подробно описав свою проблему.
123	Нет. Сроки перевода следует уточнить в банке или у сотрудников платежной системы, если вы отправили средства в банк из нее. Обычно это занимает 3-5 банковских дней.
124	Обычно перевод осуществляется в тот же или на следующий день. В то же время, точный срок зависит от букмекерской конторы, клиентом которой вы являетесь.
125	Ответ на этот вопрос зависит от того, о каком букмекере и о карте какого банка идет речь. Мы настоятельно рекомендуем использовать для этих целей Visa Classic, поскольку Electron предназначена в первую очередь для использования в банкоматах и наземных терминалах.
126	Перепроверь все еще раз. Понимаю что звучит глупо, но мне как то помогло то что я почистил кэш, cookie , историю в браузерах и потом получилось зайти. Попробуйте проверить почту на которую регистрировались и восстановить пароль.  Надеюсь решите проблему.
127	По правилам букмекерских контор, они не несут ответственности за предоставленную в лайве информацию, так как эти данные (счет матча, т.д.) получают от партнеров. Потому ставку не вернут.
179	Мы не рассчитываем прогнозы, которые не попали на главную страницу "Трибуны" и не участвуют в конкурсе.
73	Напишите, пожалуйста, в нашу службу поддержки (support@bookmaker-ratings.ru).
21	Это можно сделать выбрав вкладку "Настройки профиля" из выпадающего меню профиля.
129	При регистрации в зарубежных букмекерских конторах поля можно заполнить, использовав либо перевод, либо транслитерацию.
130	Приложение РБ для Android доступно здесь: https://bookmaker-ratings.ru/android-app/
131	Приложение РБ для iOS доступно здесь: https://itunes.apple.com/ru/app/рб-прогнозы-на-спорт/id1188607891?mt=8
132	По закону доход с выигрышей в зарубежной БК облагается налогом, но на деле почти никто не платит.
133	Из тех, которые могли бы порекомендовать: Marathonbet, Sbobet.
134	На мастер карт можно выводить через систему Ecommpay, максимальная сумма на одну транзакцию 15000 рублей. Советую пользоваться платежными системами Skrill или Neteller. Вывод через них намного быстрее и выводить можно гораздо больше.
135	У всех бывают серии неудач. Никто не заставляет ставить по мнению экспертов. Наоборот, если вы уверены в их убыточной стратегии, ставьте на противоположный исход. 
140	Разумеется. Можно играть во всех существующих БК, никаких запретов на это нет. Учтите, мы рекомендуем играть только в тех конторах, которые имеют оценку «4» и «5» нашего рейтинга: https://bookmaker-ratings.ru/rejting-bukmekerov/vse-bukmekery/
141	Режут максимальную ставку или вовсе могут заблокировать счет, если это прописано в правилах. Но профессиональные БК, которые не ограничивают размер максимальной ставки и не вводят другие санкции для игроков, независимо от того, выигрывают или проигрывают. Список: https://bookmaker-ratings.ru/bookmakers-homepage/bukmekerskie-kontory-dlya-professionalov/ 
142	Самостоятельных ограничений нет. Но мы можем проверить пользователя на какие-либо нарушения с его стороны. Если Вы считаете, что пользователь нарушил правила,  то напишите, пожалуйста, на почту: support@bookmaker-ratings.ru.
143	Скорее всего Вам придется пройти процедуру верификации после запроса на вывод средств. 
144	Скорее всего вы не подтвердили свою почту. Вам должно были прислать письмо с подтверждением почты и только после подтверждения будут приходить прогнозы. 
145	Скорее всего, вы пользуетесь разными почтовыми адресами, и разными соц сетями. Попробуйте зайти с другого профиля.
146	Советуем изначально выбрать БК с русской версией и поддержкой на русском языке. Вы найдете список таких контор здесь: https://bookmaker-ratings.ru/rejting-bukmekerov/bukmekery-na-russkom/
157	Чтобы начать пользоваться всеми возможностями Skrill, нужно пройти процедуру верификации. Для верификации счета вам потребуется отсканировать и послать документы, подтверждающие вашу личность и адрес. Для подтверждения личности подойдут паспорт, водительские права, военный билет. Для подтверждения адреса подойдут выписка со счета в банке с вашим именем и адресом или квитанция оплаты за коммунальные услуги.
180	При размещении прогноза в выпадающем меню поля "Букмекер" доступны только лучшие зарубежные конторы и БК, имеющие лицензию ФНС.   
181	При размещении прогноза в выпадающем меню поля "Букмекер" доступны только лучшие зарубежные конторы и БК, имеющие лицензию ФНС.   
182	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/
183	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/
189	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/
197	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
74	Ищите способы обхода блокировок в поисковике. 
75	Критерии оценки капперов/капперских сайтов доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/
76	 Обратитесь к капперу. Если у вас есть обоснованные претензии, заполняйте форму жалобы: https://bookmaker-ratings.ru/help-homepage/add-kapper-complaint/
77	 Если пополнить два счета с одной карты, то это мультиаккаунтинг. Если вы вынуждены играть с одного устройства, обязательно поставьте в известность  букмекерскую контору.
78	Букмекерская контора квалифицирует это как мультиаккаунтинг. Не нужно было регистрироваться повторно, не известив об этом контору.
79	Букмекерские конторы запрещают повторную регистрацию. В подавляющем большинстве контор повторно зарегистрированные счет (-а) лимитируют или заблокируют. В любом случае, мы не рекомендуем повторную регистрацию – если вы забыли логин или пароль от своего аккаунта в БК, свяжитесь по этому поводу со службой поддержки конторы.
8	 Для того, чтобы Ваш прогноз претендовал на попадание на главную страницу "Трибуны", он должен соответствовать рекомендациям по написанию прогнозов: https://bookmaker-ratings.ru/kak-popast-na-glavnuyu-tribuny-esli-ne-umeesh-pisat-po-russki/ . Если Вы учли все рекомендации, но прогноз не попал на главную страницу "Трибуны", напишите об этом в комментариях к прогнозу. 
9	 Скорее всего, работает автоматическая система проверки уникальности текста.  В случае низкой уникальности прогноз удаляется автоматически.  Наши модераторы очень редко удаляют прогнозы и стараются уведомлять о причинах, если это не очевидно (вместо прогноза — реклама или что-то другое, не являющееся прогнозом, наличие мата и оскорблений).  Если у Вас остались вопросы по удаленному прогнозу, пожалуйста, поясните, на какое событие он делался и когда Вы его опубликовали, чтобы модераторы смогли провести поиск в удаленном. 
62	 К ответственности могут быть призваны букмекеры, а не их клиенты. 
10	Ожидайте, пожалуйста. Модераторы проверяют опубликованные прогнозы на соответствие рекомендациям по написанию прогнозов и рассчитывают ставки ежедневно с 9:00 до 10:00, с 14:00 до 15:00, с 19:00 до 00:00 (МСК).
11	 Если Вы принимаете участие в конкурсе, выбор букмекера при размещении прогноза недоступен.
12	Прогнозы на РБ рассчитываются в соответствии с правилами БК, которую вы выбираете при публикации прогноза. Если где-то закралась ошибка, укажите об этом в комментарии к самому прогнозу. 
17	Мой профиль, вкладка "Статистика".
18	Перейдите в профиль интересующего вас каппера и выберите вкладку "Статистика".
19	Мой профиль, вкладка "Подписки".
20	Количество подписанных на Вас пользователей можно посмотреть в своём профиле, вкладка "Подписчики".
22	Заходите в "Настойки профиля", выбираете вкладку "Интересы". Конторы в которых Вы играете отмечены цветным логотипом, а в которых не играете - черно-белым.
36	На главной странице РБ размещаются только прогнозы экспертов. Для капперских прогнозов есть раздел "Трибуна". 
37	Мы не рассчитываем прогнозы, которые не попали на главную страницу "Трибуны" и не участвуют в конкурсе.
39	Подробнее о статусах можно узнать здесь: https://bookmaker-ratings.ru/ot-novichka-do-guru-pol-zovateli-rb-poluchat-status/
40	Заполните форму жалобы, если не нарушали правил БК: https://bookmaker-ratings.ru/help-homepage/forma-zhalob/
41	Как правило, жалоба публикуется в течении суток, но из-за большой нагрузки это процесс может занять больше времени. Ожидайте, пожалуйста.
42	Сроки решения по жалобе во многом зависят от оперативности представителей букмекера. При всех изменениях по жалобе Вам на почту будет поступать уведомление. Ожидайте, пожалуйста.
43	Вопросы по жалобе целесообразнее задавать непосредственно в ней, где Вам сможет ответить наш модератор жалоб. 
46	Информация о налогах по доходам от выигрышей в букмекерских компаниях доступна здесь: https://bookmaker-ratings.ru/kak-platit-nalogi-s-vy-igry-shej-sporny-e-voprosy-i-sovety-igrokam/
47	В соответствии с действующим законодательством РФ, доходы физических лиц облагаются налогом в размере 13% от полученного дохода (налоговой базы). То же самое касается и выигрышей в букмекерских конторах. Рассчитывать, удерживать и перечислять в бюджет суммы налога на выигрыш обязана букмекерская компания (налоговый агент).Налоги идут государству.
48	Большинство ППС компенсируют размер налога на выигрыш, но подобные нюансы лучше уточнять в службе поддержки.
50	Зависит от количества контор в которых вы собираетесь играть. Если это одна контора, то самый удобный метод это карточка VISA. В отличии от Mastercard на нее выплачивают все букмекерские конторы. Если вы собираетесь играть в нескольких конторах, и перекидывать деньги из одной в другую, то лучше выбрать платежную систему. Например Skrill. Почти везде на Skrill выплаты обрабатываются в течении нескольких часов.Недостаток платежных систем в том, что там нужно пройти  верификацию.
51	 Вы сможете пользоваться счетами, если данная контора не ограничивает игроков из этой страны. Список запрещенных стран можно посмотреть в обзоре букмекерской конторы.  
53	Можно привязать карту платежной системы, например, Skrill. 
54	Критерии оценивания БК доступны здесь: https://bookmaker-ratings.ru/wiki/kriterii-dlya-vy-sokih-otsenok-kontor-v-rejtinge-bukmekerov/
59	 Это разные конторы с юридической точки зрения. Одна работает легально в рамках российского законодательства, в то время как другая считается офшорной БК (нелегальной на территории РФ). Что касается регистрации, проблем в плане мультиаккаунтинга возникнуть не должно.   
60	Если вы находитесь на территории РФ, перейти можно только на лицензированные и легальные в России БК (требования Роскомнадзора).
61	БК 1xbet имеет рейтиг "2", не принимает РБ в качестве посредника и не реагирует на жалобы. Мы крайне не рекомендуем играть у этого букмекера.
63	Обратитесь в службу поддержки букмекера. В большинстве букмекерских контор исправляют такие опечатки, если они не имеют массовости и не связаны с умышленной опечаткой для регистрации нескольких счетов. 
65	 Все без исключения БК запрашивают документы для идентификации личности. Эта процедура называется верификация.
66	Все зависит от конторы и способа вывода средств. Где-то деньги приходят в течении часа, а где-то 3-5 рабочих дня. Подобную информацию о сроках вывода можно узнать в обзоре БК.
67	Переводы, которые проводятся через банк, занимают больше времени, чем переводы посредством платежных интернет-систем (к примеру, платежной системы Skrill).
68	Да, вы можете использовать более одной платежной системы, играя в отдельно взятой букмекерской конторе. Но следует учесть: многие конторы требуют, чтоб деньги выводились тем же методом, которым были введены. Если они были введены несколькими методами, букмекеры оставляют за собой право выбрать тот, которым вы сможете вывести средства или ввести ограничение пропорциональности оборота средств по платежным системам. 
69	Ориентируйтесь на правила вывода средств со счета, которые могут отличаться у разных БК, и ограничения для конкретной платежной системы
70	Этот вопрос лучше задать представителям банка.
71	Обратитесь в службу поддержки букмекера. Контакты можно найти в обзоре БК.
82	Порезка счетов (или снижение максимумов) – одна из разновидностей ограничений счета, применяемых в фундаментальных букмекерских конторах к профессиональным игрокам. Суть этого ограничения заключается в том, что букмекер уменьшает игроку максимально возможную сумму ставки на определенные события или для счета в целом, вплоть до нескольких долларов США, что делает профессиональную игру в БК невозможной.Порезка счетов, или снижение лимита ставок, практикуется фундаментальными букмекерскими конторами на счетах игроков-вилочников и прочих спекулирующих на линиях контор игроков. Сумма ставок, выигрыши или проигрыши не влияют на решение трейдера снизить максимум на том или ином счету. Режут счета из-за стиля ставок, а не их количества или суммы выигрышей. Если не ставить на «вилки», «коридоры» и «валуи», шансы быть порезанным ничтожны. 
84	Информация о букмекерских вилках находится здесь: https://bookmaker-ratings.ru/bukmekerskie-vilki-chto-e-to-i-kak-zarabotat-na-nih/
85	БК не хочет с вами играть, смените контору. 
86	Антиэкспресс - тип ставки, противоположный экспрессу по способу определения выигрыша, т.е. ставка выигрывает, если соответствующий экспресс проигрывает. Иначе, антиэкспресс – это ставка на два или более выбора из разных событий, где ставка выигрывает, если хотя бы один выбор не совпадет с результатом.(Напомним, в экспрессе наоборот, чтобы выиграть ставку, необходимо, чтобы все выборы совпали с результатами).Итоговый коэффициент антиэкспресса рассчитывается на основе вероятности, противоположной вероятности выигрыша по экспрессу, составленному из тех же выборов.
88	Информация о ставках на фору здесь: https://bookmaker-ratings.ru/wiki/stavki-na-fory/
91	Попробуйте обратиться в службу поддержки "Киви". 
92	Возможно, БК заблокировала Ваш счет в связи с нарушением правил. Посмотрите, не приходило ли Вам письмо от БК на личную почту. Также можно обратится в службу поддержки для разъяснения ситуации.
93	Вы попали в категорию «нежелательных клиентов», потому ваш счет был закрыт. Все игроки, в ставках которых отсутствует элемент риска, классифицируются как нежелательные, среди них «вилочники», «коридористы», «послегольщики», организаторы договорных матчей и так далее.
94	Данная ошибка "говорит" о проблемах при подключении к серверу мобильного приложения. В таких случаях рекомендуется обновить настройки GPRS на Вашем мобильном устройстве или подключиться позднее.
111	Сканеры вилок – это программы, сканирующие линию ставок многочисленных онлайн-букмекеров в режиме реального времени и определяющие арбитражные ситуации, известные также как букмекерские вилки. Подробнее здесь: https://bookmaker-ratings.ru/wiki/skanery-vilok-bukmekerskie/
97	Прежде всего, Вам нужно зарегистрироваться в букмекерской конторе, которая Вам приглянулась или подходит по стилю игры. Далее необходимо выбрать метод оплаты. Как правило, игроки используют банковские карты и платежные системы. После того как счет пополнен, Вы можете выбирать интересующие Вас события, анализировать коэффициенты и делать ставки. Если Вас интересует технический момент, как делать эти самые ставки, укажите конкретную БК. Однако, я думаю, Вы сможете разобраться самостоятельно, ведь практически все современные конторы имеют интуитивно понятный интерфейс. 
98	При входе в свой аккаунт нажмите кнопку "Забыли пароль?". Существуют 2 способа восстановления доступа к сайту - через e-mail и по номеру телефона. Если возникнут вопросы, обратитесь в службу поддержки БК.
99	Следите за новостями на нашем сайте.
100	Список букмекеров, поддерживающих русский язык доступен здесь: https://bookmaker-ratings.ru/supported_languages/russkij/
101	Список букмекеров, принимающих ставки на киберспорт доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/bukmekery-prinimayushhie-stavki-na-kibersport/
102	Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=legal-only/
106	Маржа — комиссия букмекера с рынка ставок, которая закладывается в коэффициенты конторы. Подробнее здесь: https://bookmaker-ratings.ru/wiki/marzha/
107	Система — разновидность ставок, представляющих собой несколько экспресс-ставок. Подобнее здесь: https://bookmaker-ratings.ru/wiki/sistema/
108	Если Вам предлагают информацию о договорных матчах и прочие чудеса, бегите! Подобнее здесь: https://bookmaker-ratings.ru/5-shem-razvoda-igrokov-na-stavkah-dogovornyie-matchi-prodazha-prognozov-i-drugie-metodyi-obmana/
109	Букмекерские СРО (саморегулируемые организации букмекеров) — некоммерческие организации, объединяющие букмекерские конторы и тотализаторы в Российской Федерации. Подробнее здесь: https://bookmaker-ratings.ru/wiki/bukmekerskie-sro/
110	Материалы про интернет-издания с рейтингами букмекерских контор доступны здесь: https://bookmaker-ratings.ru/wiki-category/wiki-izdaniya-s-rejtingami/
112	Мультиаккаунтинг – регистрация более одного счета на сайте букмекерской конторы, в том числе на поддельные или чужие паспортные данные. Подобнее здесь: https://bookmaker-ratings.ru/wiki/mul-tiakkaunting/
113	Верификация игрока — проверка игрока букмекерской конторой, в ходе которой компания устанавливает соответствие личности игрока указанным им паспортным данным, а также верифицирует другую информацию счета. Подробнее здесь: https://bookmaker-ratings.ru/wiki/verifikatsiya-igroka-bukmekerskoj-kontory/
120	Многие конторы отправляют на матчи своих скаутов, которые отслеживают происходящее в онлайн-режиме и передают в БК соответствующие данные. Существуют также и сторонние компании, предоставляющие профессиональную live-статистику. Их услугами, как правило, пользуются букмекеры, которые не имеют собственных скаутов.  Самая актуальная статистика, пожалуй, у ODDS.RU
121	На территории РФ блокируют сайты БК, у которых нет лицензии ФНС. Список легальных на территории РФ букмекеов доступен здесь: https://bookmaker-ratings.ru/bookmakers-homepage/legal-bookmakers/legality=legal-only/
138	У нас есть рейтинг букмекеров от пользователей – демонстрация настоящей демократии на «РБ». Мы никак не влияем на эти оценки. Только вы решаете, какое место займет контора: https://bookmaker-ratings.ru/bookmakers-homepage/user-rating/
139	Проходимость прогнозов не учитывается в рейтинге капперов. Мы оцениваем капперов по нашим  критериям: https://bookmaker-ratings.ru/wiki/kriterii-otsenki-kapperov-kapperskih-sajtov/
147	Ставки на страйк-ауты принимает Марафон и Бетсити
148	Такие верификаторы есть. Их можно легко найти в поисковике. 
149	Такие сайты есть. Воспользуйтесь поисковиком для их нахождения. Также можно обратиться к стандартным инструментам "Эксель".
150	Только если у вас есть все документы на эти номера, и вы можете подтвердить что вы являетесь их владельцем. Обратитесь в поддержку букмекера.
151	У каждой конторы свои правила расчета карточек. Кто-то красную за две желтых считает, то есть как два очка, грубо говоря. И неважно, прямая она или нет. А кто-то вообще даже две ЖК повлекшие удаление не считает за ЖК. В любом случае, главное чтобы с правилами конторы расчет ставки не расходился.
152	Удобнее всего найти подробную информацию по данным лигам можно на сайтах этих самых лиг и их представительствах в социальных сетях. Особо обширно лиги и команды низших дивизионов представлены в Twitter.
153	Указанная Вами БК не работает в рамках российского законодательства, поэтому и блокируется Роскомнадзором. Мы, в свою очередь, не имеем права размещать на своем сайте ссылки, которые ведут на запрещенные сайты. Поэтому Вы и перенаправляетесь на ""1хставку"", поскольку эта БК разрешена в РФ.
154	Уточните, пожалуйста, данный вопрос у службы поддержки БК.
155	Учетная запись через соцсеть тоже может принимать участие в конкурсе - необходимо просто нажать на соответствующую кнопку на этой странице   
156	Во многих БК для вывода денег без комиссии необходимо проставить сумму депозита. Подробности лучше уточнить в службе поддержки БК.
158	Чтобы узнать, какие БК и какой бонус предлагают, зайдите в наш рейтинг букмекерских контор и выберите «Упорядочить по бонусу». Детальная информация о бонусе указана в обзорах букмекеров.
159	Эти деньги попали на ваш счет в Skrill. Вы с ними можете делать что захотите.  
160	Это два разных сайта. Если вы просто не можете зайти на сайт, воспользуйтесь одним из средств обхода блокировки, описанных в сети.
161	Это зависит как от популярности события, так и от возможных ограничений (порезка максимумов), наложенных букмекерской конторой на ваш аккаунт.
162	Это любой другой счет, который не указан в росписи, обычно ставка выигрывает, когда одна из команд забивает как минимум 4 гола. Это что касается футбола.
163	Это можно сделать при помощи банковского перевода или кредитной карточки.
164	Это мультиаккаунтинг. Контора имеет право Вас заблокировать. 
165	Биржи ставок отличаются от букмекерских контор тем, что игроки делают ставки не против букмекера, а друг против друга: https://bookmaker-ratings.ru/bookmakers-homepage/birzhi-stavok/
166	Я-бот. Я отвечаю только на вопросы, связанные с РБ
167	не ругайтесь, лучше посмотрите на красивых девушек: https://bookmaker-ratings.ru/media-category/devushka-dnya/
\.


--
-- Data for Name: faq_question; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.faq_question (id, question, answer_id_id, answer_label) FROM stdin;
0	Как мне разместить прогноз?	0	0
1	Каким образом я могу опубликовать прогноз?	0	0
764	Переведите меня на оператора пожалуйста	483	\N
2	Я хочу выложить свой прогноз	0	0
3	Где я могу дать свой прогноз на матч?	0	0
4	Как редактировать свой прогноз? Сделал опечатку в самом заголовке.	1	1
5	После того как прогнозист публикует свой прогноз, почему нет возможности редактировать, потому что в ходе прогноза вполне возможно ошибиться?!	1	1
6	Почему я не могу изменить свой прогноз? Мог же где то ошибиться или опечататься и понять потом. Помогите мне его отредактировать	1	1
7	Как я могу отредактировать прогноз? Сделал мелкую опечатку в заголовке	1	1
8	Ошибся в заголовке прогноза. Как внести изменения? нигде не нашел этой функции	1	1
9	Как я могу внести правки в прогноз который уже опубликован? нигде не могу найти.	1	1
10	Куда вводить сумму ставки в моем прогнозе?	2	2
11	Не нашел где ввести сумму ставки моего прогноза	2	2
12	Я разместил прогноз но не указал сумму ставки	2	2
13	Сколько прогнозов можно разместить в одном материале?	3	3
14	Хочу сделать несколько ставок, можно ли сделать в одном прогнозе, в одном посте, в одной статье?	3	3
15	Надо ли делать отдельны публикации для каждого прогноза или можно дать прогнозы вместе?	3	3
16	Если я хочу написать несколько прогнозов на разные матчи одного чемпионата, то могу ли я давать их в одной публикации отдельными ординарами или же надо для каждого прогноза делать отдельную публикацию?	3	3
17	Я хочу разместить видеопрогноз	4	4
18	Как я могу выложить видео к своему прогнозу?	4	4
19	Я прикрепил видео к прогнозу, нужен ли текст?	4	4
20	Нужно ли описание к прогнозу, если прикрепил видео?	4	4
21	Как сделать прогноз на экспресс?	5	5
22	Хочу дать экспресс в прогнозе, как это сделать?	5	5
23	Не находит событие при добавлении прогноза. Что делать?	6	6
24	Хочу сделать прогноз на футбол, но такого события нет	6	6
25	Какую картинку выбрать при оформлении прогноза?	7	7
26	Какого размера должно быть фото в прогнозе?	7	7
27	Почему мой прогноз не прошел проверку? Все же было нормально. Хороший прогноз, но все равно не прошел	8	8
28	Написал отличный прогноз, но он не появился на трибуне. Что я написал не так? Как надо его писать чтобы он прошел проверку и появился на трибуне?	8	8
29	Почему прогноз не прошел модерацию? Вы пускаете на трибуну обычных людей или надо что то сделать?	8	8
30	Сделала  прогноз, но вы его не разместили. Почему он не прошел модерацию?	8	8
31	Почему мой прогноз не прошел проверку? Всё же написано нормально	8	8
32	Мой прогноз не попал на Трибуну. В чем проблема?	8	8
33	Две ставки не допустили на трибуну, загружал с картинками, что ещё не так делаю?)	8	8
34	Доброго времени суток! Мои два прогноза не попали на трибуну (один на нба, второй на КХЛ). Коэффициента брал с Вильям Хилла, картинка соответствующего размера.	8	8
35	Добрый вечер, мой прогноз не попал на главную страницу трибуны по не понятным мне причинам.Может быть, он совпадает с прогнозом кого-либо, но я не могу каждый раз проверять все прогнозы на матч, дабы избежать копипаста.	8	8
36	Добрый день, не могли бы указать на мои ошибки, что я не так сделал? Мой прогноз не попал на трибуну. Чтоб я в дальнейшим исправился и не делал прежних ошибок.  	8	8
37	Здраствуйте,опубликовал прогноз,а что нужно сделать что бы он попал в каперскую трибуну?	8	8
38	хотел узнать почему мой прогноз не был допущен на главную страницу трибуны?	8	8
39	Скажите.А почему мой прогноз Манчестер Юнайтед- Суонси не выставили на трибуну?Спасибо	8	8
40	Я вылаживаю прогноз на трибуне, но при просмотре ставки ее удаляют, почему? Подозрение в копипасте? Этот прогноз я выложил еще на vprognoze.ru Могу подтвердить что там тоже моя страница привязана к сайту "Вконтакте" ка ки эт страница.	8	8
41	Мой прогноз не опубликовали на Трибуну, как можно узнать, почему? и можно ли отредактировать, чтобы прогноз пропустили на трибуну?  	8	8
42	Сделал прогноз на матч Ростов - Андерлехт прогноз не прошел модерацию	8	8
43	прогноз не допущен на главную трибуну, УКАЖИТЕ пожалуйста на ошибки допущенные мной	8	8
44	почему не выложили мой последний прогноз?	8	8
45	Почему не одобряют прогноз?	8	8
46	я оставлял прогноз на лигу чемпионов но его не допустили.можно узнать почему?	8	8
47	что значит прогноз не прошел модерацию и почему,в связи с чем как узнать	8	8
48	Выложил прогноз,а он не прошел почему то модерацию,в чем причина?!  	8	8
49	Второй раз подряд не публикуют прогноз на трибуну ? Могу узнать причину?	8	8
50	Почему я не могу добавить прогноз? Почему не меняется с любителя на игрок? я уже сделал 2 отзыва	8	8
51	ДАЛ 2 ПРОГНОЗА-НИ ОДИН НЕ ПРОШЕЛ МОДЕРАЦИЮ-ЧТО ТАКОЕ?	8	8
52	можно узнать причину не попадания моего прогноза на футбол , чтобы исправить мои ошибкы.?	8	8
53	Пот какой причине мои прогнозы не публикуются на главную страницу трибуны?	8	8
54	Снова не допустили прогноз на трибуну, хочется уже узнать что не так в этот раз.	8	8
55	Я выложил свой прогноз на теннис, на что через время среагировали Ваши модераторы значком "Прогноз не допущен на трибуну". Почему? Даже никаких объяснений не увидел.	8	8
56	объясните хотя бы причину по которой неопубликован прогноз. Хочу попробовать себя в роли прогнозиста.	8	8
57	Из-за чего отклонили мой прогноз? Он достаточно правильный, с точки зрения русского языка.	8	8
58	Почему прогноз не прошёл на трибуну?  	8	8
59	Добрый день! Почему мой прогноз не прошел модерацию? Прогноз был опубликован в 23:40. Матч начинался в 00:00.	8	8
60	Что значит " прогноз не прошёл модерацию, и не будет рассчитан?"	8	8
61	Опубликовал около 2 часа ранее прогноз на матч МЛС, но его не опубликовали, проста хочу узнать причину?	8	8
62	Не добавлен прогноз на страницу Трибуны на матч Манчестер Сити - Барселона	8	8
63	теперь заставка не содержит никаких ссылок,но прогноз опять не допущен на главную трибуну	8	8
64	Не показывает причину не прохода модерация, хотя сам прогноз сделал от часа - 30 минут до матча. и опубликовал	8	8
65	Хотел бы узнать причину не допуска прогноза на Трибуну.	8	8
66	Опубликовал прогноз,но его все еще нет на Трибуне,на рассмотрении почему то	8	8
67	Почему прогноз не прошел модерацию? Как понять причину? Никто не объясняет	8	8
68	Почему в моем прогнозе красный глаз?	8	8
69	За что могут завернуть не дать опубликовать прогноз на трибуну? Почему обычно не проходят модерацию?	8	8
70	Прогноз не прошёл модерацию.На просьбу пояснить ответить нужным не считают.	8	8
71	почему мои прогнозы удаляют?	9	9
72	Публикую прогноз на матч во второй или третий раз и он почему-то пропадает. Остальные прогнозы публикуются нормальною	9	9
74	Спустя час после публикации прогноз был удалён	9	9
75	Добрый день. Сегодня был по непонятной мне причине удалён прогноз "Лестер"-"Челси". Прогноз Дмитрия Юркина. Висел весь день, было 400 просмотров. Все названия команд в кавычках, написано грамотно и со знаками. Прошу объяснить с чем связано удаление.	9	9
76	Что за бред ??? какой день уже в подряд удаляют прогноз без обяснение , причем быстро. Где справедливость , или это палки в колеса ? Админы вообще в адеквате ?	9	9
77	Почему в профиле не отображается прогноз?	9	9
78	Разместил 2 прогноза, но через 5 минут после размещения они исчезли из моего профиля. В чем проблема?	9	9
79	Почему был удалён мой прогноз?	9	9
80	Пропал мой прогноз, хотя он был ранее.	9	9
81	В последнее время долго рассматриваются ставки модераторами и долго рассчитываются так долго будет? Просто надеюсь на ваше понимание :)	10	10
82	Можете ли вы посмотреть мой прогноз и допустить его на трибуну?	10	10
83	Сколько вы будете рассматривать мой прогноз?	10	10
84	Сделал прогноз примерно в 4 утра, первый матч по прогнозу в 9 утра,в чем проблема?	10	10
85	Можно ли, как можно быстрее, рассчитать мои прогнозы за прошлый вечер?	10	10
86	Подскажите, пожалуйста, в течении какого времени расчитываються прогнозы? Просто мои 2 матча закончились утром , и один в обед, а до сих пор написано - Ожидание. Заранее спасибо.	10	10
87	Если я сделал прогноз в трибуне,после окончания прогноза надо самому писать результат и сиграл прогноз или нет если да то как?	10	10
88	В течение какого времени модератор проверяет прогноз и распределяет его по спортивной категории(хоккей,баскетбол,футбол)?	10	10
89	Почему мой прогноз не разыгран если я его правильный сделал?	10	10
90	Почему желтый глаз в прогнозе, на рассмотрении	10	10
91	Рассчитайте пожалуйта прогноз	10	10
92	Матч завершился вчера а ставка не рассчитана на рассмотрении	10	10
93	При вводе прогноза не могу выбрать букмекера,в поиске ничего нельзя найти. Как можно исправить эту проблему?	11	11
94	участвую в конкурсе капперов, но при написании прогноза в окне непосредственно ставки не могу выбрать букмекера, выпадает пустой список и при написании ничего не находит. Хэлп	11	11
95	Не могу дать прогноз, так как нет выбора букмекерской конторы. Как можно исправить эту не поладку? Или это ограничение?	11	11
96	Если же игрок в стартовом составе не вышел, то должен быть возврат. Такие правила во всех БК, тогда почему здесь на сайте это проигрыш?	12	12
97	Полузащитник забил гол, букмекер засчитал ставку,а на Трибуне расчитали проигрышем.	12	12
98	Ставка выиграла, а вы рассчитали проигрыш	13	13
99	Почему моя ставка сыграла, но в прогнозе поражение?	13	13
100	Неправильно рассчитали ставку в моем прогнозе	13	13
101	Исправьте рассчет ставки в моем прогнозе	13	13
102	Если я сменю данные пользователя, например имя и фамилию, то изменятся ли они в моих ставках прогнозах комментариях и тп до этого?	14	14
103	Сменил фамилию, если я изменю ее в профиле то изменится ли она в прогнозах?	14	14
104	ПОчему не изменяются имя и фамилия в прогнозах постах ставках, если я сменил ее в настройках	14	14
105	Вопрос такой: А если в настройках профиля сменить имя и фамилию, то возможно ли сменить имя и фамилию в заголовках моих завершенных ранее ставок?	14	14
106	Поощряют ли как то людей, часто делающих прогнозы на трибуне? если нет, то в чем смысл?	15	15
107	Зачем размещать свои прогнозы на трибуне? есть какие то призы?	15	15
108	Что я получу за размещение своих прогнозов? В чем смысл?	15	15
109	Подскажите пожайлуста есть ли смысл размещать свои прогнозы на стене трибуны? За большое количество успешных прогнозов есть ли какая-то система поощрения? Cпасибо!	15	15
110	Где я могу посмотреть мои прогнозы?	16	16
111	Не могу найти где увидеть свои прогнозы и ставки.	16	16
112	Где можно посмотреть свою статистику?	17	17
114	Как определить успешность вашего эксперта, прогнозиста?	18	18
115	Где можно увидеть статистику эксперта, прогнозиста?	18	18
116	Как посмотреть все ставки и прогнозы прогнозиста или каппера?	18	18
117	Как посмотреть все прогнозы прогнозиста, есть ли где то архив всех его постов?	18	18
119	На скольких людей я подписался, где посмотреть?	19	19
120	Могу ли я как-то посмотреть всех, кто на меня подписался? ИЛи получать уведомления о подписке. Ну или хотя бы количество подписавшихся	20	20
121	Как понять, сколько человек на меня подписалось? Можно ли настроить уведомления о подписках	20	20
122	Сколько человек на меня подписано?	20	20
123	Такой вопрос, можно ли каким-то способом посмотреть кол-во подписок на меня? Приходит ли при новой подписке уведомление на почту и т.д.?	20	20
124	Как сменить пароль на рб?	21	21
125	Хочу сменить пароль, как это сделать?	21	21
126	где поминять имя, логин на сайте?	21	21
127	где можно изменить имя и фамилию на сайте?	21	21
128	Как добавить ссылку на социальную сеть в профиль	21	21
129	Как прикрепить ссылку на учетную запись вконтакте, Facebook, Twitter, Instagram	21	21
130	Добрый день. Как можно удалить из профиля\\в личном кабинете - БК, в которых я не играю? 	22	22
131	как к себе добавить букмекера в раздел "играет"?	22	22
132	Где посмотреть прогнозы, на которые я подписан?	23	23
133	Мне дали ответ на комментарий. Где его найти?	23	23
134	Как мне отписаться от прогнозиста?	24	24
135	Прекратите присылать уведомления о прогнозах.	24	24
136	Не хочу получать от вас письма на почту	24	24
137	Не присылайте мне уведомления на мой емаил	24	24
138	Хочу отписаться от вашей рассылки	24	24
139	Почему удалили мой комментарий?	25	25
140	Написал, оставил комментарий, но его удалили. Какая причина?	25	25
141	Удалили мой негативный комментарий. Вам заплатили?	25	25
142	Создается впечатление что негативные отзывы не размещаются	26	26
143	Мой негативный отзыв не появился на сайте! Вы специально? сколько вам за это платят?	26	26
144	Почему не опубликовали мой отзыв?	26	26
145	Где мой отзыв? он негативный, они не публикуются?	26	26
146	Я составил жалобу на бк, негативную, в виде отзыва, почему не опубликовали? Когда появится на сайте?	26	26
147	Я хочу изменить свой отзыв о БК	27	27
148	Как я могу отредактировать отзыв на букмекера?	27	27
149	Как принять участие в конкурсе капперов ?	28	28
150	Как поучавствовать в вашем конкурсе? не вижу где зарегистрироваться	28	28
151	Как поучаствовать в конкурсе прогнозистов?	28	28
152	Где ваши конкурсы?	28	28
153	Какие сейчас у вас конкурсы	28	28
154	Какие у вас проходят сейчас конкурсы?	28	28
155	А скажите пожалуйста в каком конкурсе прогнозов можно поучаствовать в ближайшее время?? есть ли какие нибудь варианты заработать на этом сайте?	28	28
156	Как попасть в команду прогнозистов	29	29
157	Как стать вашим прогнозистом, прогнозистом РБ	29	29
158	Возможно ли попасть в команду профессиональных прогнозистов?	29	29
159	подскажите, сколько процентов идет на ставку? по какому принципу высчитывается прибыль в конце месяца у экспертов, а так же у обычных участников,которые выкладывают свои прогнозы?	30	30
160	как вы считаете прибыль экспертов и прогнозистов?	30	30
161	каким образом вы высчитываете статистику?	30	30
162	Доходы прогнозиста, эксперта. Как подсчитать?	30	30
163	Хочу сравнить успешность ваших экспертов. Как это сделать?	31	31
164	У какого эксперта лучшая статистика, кто из них самый прибыльный?	31	31
165	Где сравнить статистику пользователей, прогнозистов?	32	32
166	Кто лучший каппер Трибуны?	32	32
167	Как попасть в топ-12 Трибуны?	33	33
168	Каким образом попасть в список лучших капперов Трибуны??	33	33
169	Как максимально быстро можно сделать, чтобы больше людей узнали о моих прогнозах и стало больше подписчиков?	34	34
170	Что нужно делать чтобы появились у меня подписчики?	34	34
171	Хочу больше подписчиков, где их взять?	34	34
172	Система расчета прибыли не очень хорошо работает	35	35
173	Плохо работает ваш сайт. Будут ли внесены изменения, подсчет работает плохо	35	35
174	Схема рассчета сломана, некорректно показывает коэфициенты	35	35
175	Люди часто описывают недостатки существующей системы подсчитывания коэфициентов и выигрышей, прибыли. Скажите, будут ли внесены изменения в формулу расчёта прибыли? Иначе ставки с кэфом меньше 2 не имеют смыла. Спасибо!	35	35
176	Хочу чтобы мои прогнозы публиковали на главной странице РБ	36	36
177	У меня отличные прогнозы, перенесите их на первую страницу сайта.	36	36
178	Почуму уже 2 дня не рассчитывают прогноз?	37	37
179	Дал прогноз неделю назад, ставка до сих пор не разыгранна	37	37
180	При размещении прогнза не много букмекеров. Почему?	38	38
181	Не нашел свою БК в списке при оформлении прогноза	38	38
182	Что это за статусы у пользователей?	39	39
183	Как мне повысить статус до профи?	39	39
184	Зачем нужны статусы, что они дают?	39	39
185	Какая польза от этих статусов?	39	39
186	За что дают статус гуру	39	39
187	ЧТо за гуру у вас на сайте и как его получить	39	39
188	как стать гуру, профи у вас на сайте	39	39
189	Видел где то на сайте, что за размещение прогноза, дадут статус "гуру") Прогноз разместил, мой экспресс выиграл) статуса не получил. Может мне приснилось, т.к. объявления я этого больше не вижу.	39	39
190	Делал ставку на футбол, общая сумма выигрыш составила 13.000 грн . Данная БК отказывается выплачивать средства, ссылаясь на непонятные причины. Что мне делать ? Заранее спасибо	40	40
191	Я сделал ставку на кассе получил чек выиграл но деньги мне не отдают я поставил 200 шт выигрыш составляет 233 шт подскажите что можно сделать это контора мошенников	40	40
192	Вчера в лайве поставил победу Спартака при счете 0-1 в пользу Амкара, кф-27. Сделали возврат пишут: Ваши ставки рассчитаны с коэффициентом 1 , так как были поставлены на известный исход .	40	40
193	1хставка украла деньги со счета, где пожаловаться?	40	40
194	1хbet проставил мои деньги за меня, что делать?	40	40
195	К кому можна обратиться по поводу блокировки счета в БК "Бетсити"?	40	40
196	Безосновательно заблокировали счет, поддержка не отвечает	40	40
197	Где заполнить жалобу?	40	40
198	Бетсити не выплачивает выигрыш! Говорят: ставка не рассчитана, результат уточняется...уже два года уточняют На официальных сайтах есть данные с результатами...Как помочь конторе Бетсити уточнить счет и рассчитать ставку??	40	40
199	Здравствуйте еще раз,заблокировали счет, попросили выслать им документы,все выслали  они не отвечают месяц,как быть,куда написать?	40	40
200	Мне произвели разблокировку счета, а баланс со счета списали, что делать и возможно ли вернуть деньги? Если выяснили что я не мошенник и никаких противоправных действий не совершал почему забрали мои деньги?	40	40
201	Я заказал на вывод средств через киви кошелёк мне пришёл отказ хотя у меня счёт верифецирован и я не однократно снимал деньги. В службе поддержке мне ничего не отвечают.	40	40
202	не могу вывести денег,саппорт молчит,.отсылаю фото с паспортом тут же отклонено , бред какой и где там лайв чат??прошел кеф 40 и бонус отыграл(	40	40
203	ФонБет отказывается выплачивать мой выграш. уже почти 5 дней веду с ними переписку но бесполезно. блокировка счета. деньги не выводятся не на визу не на скрил. Как мне поступить ?	40	40
204	Почему бк конфисковало у меня балансы и заблокировало меня? С документами проблем нет и не было.	40	40
205	За что букмекерская контора, бк, контора, может заблокировать мой счет? Или конфисковать деньги. Документы в порядке, ну нормальные и не поддельные.	40	40
206	БК забрала деньги и дала бан, заблокировало.  С документами все ок.	40	40
207	Букмекер неправильно рассчитал ставку, хотя на официальном сайте результат есть	40	40
208	Правил не нарушал, букмекер заблокировал счет и забрал деньги	40	40
209	Мошенники! Не дают вывести деньги со счета.	40	40
210	Блокировка счета, поддержка не отвечает	40	40
211	Когда опубликуют мою жалобу?	41	41
212	Моя жалоба уже два дня на рассмотрении, сколько еще ждать?	41	41
213	Заполнил жалобу, но её нигде нет, не опубликовали	41	41
214	Сколько времени занимает публикация жалобы?	41	41
215	Что там по моей жалобе?	42	42
216	Когда будут результаты по жалобе, прошла неделя?	42	42
217	Уже месяц моя жалоба в обработке. Сколько еще ждать?	42	42
218	Какие примерные сроки решения по жалобе?	42	42
219	Прошло больше двух недель, но по жалобе тишина. Долго мне ожидать?	42	42
220	Жалоба признана безосновательной, но это ложь, не может быть	43	43
221	Посчитали мою жалобу безосновательной, но у меня есть доказательства правоты	43	43
222	Жалоба сменила статус на безосновательна, что это за мошенничество	43	43
223	Почему жалоба безосновательная, я не нарушал правил БК?	43	43
224	Вы хоть помогаете людям, решаете жалобы?	44	44
225	Для чего нужны эти жалобы, РБ хоть кому-то помог?	44	44
226	Какой смысл в жалобе, что она даст?	44	44
227	РБ вернул деньги хоть одному человеку?	44	44
228	Направил документы в зенитбет для верификации счета еще 18 июня,Сегодня уже 29 июня но так и не могу вывести денежные средства.Сколько еще ждать?	45	45
229	Заблокировали аккаунт на Лиге ставок, документы отправил в тот же день. Прошло два дня ни ответа ни привета. Неприятно.......	45	45
230	запросили документы на БК, отправил весь пакет документов, отличного качества, написали ожидайте, прошла неделя, я пишу уже 2 дня они игнорируют мои сообщения!	45	45
231	Сколько длится верификация Подскажите	45	45
232	Здравствуйте,уважаемые специалисты.Пожалуйста подскажите-сколько времени длиться проверка документов в следующих конторах:Betfair,Liga stavok,SBOBET?	45	45
233	Попросили фото паспорта я скинул и теперь говорят что я в очереди. эта очередь вообще существует ? и сколько мне ждать пока проверять данные ?	45	45
234	Заблокировали счет. Попросили все нужные документы для идентификации. Отправил всё что запрашивали. Но четвертый день с заблокированным счетом и замороженным балансом на нем. Подскажите пожалуйста сколько происходит идентификация по времени?	45	45
235	Хотел вывести средства, запросили документы ... Сказали ожидать... Прошло около недели... Это нормально? И по каким прияинам мой счет проверяют?? Контора бетсити...	45	45
236	Что такое Цупис, зачем он?	46	46
237	Какой-то цупис. Для чего он нужен?	46	46
238	Почему кто то берет налог а кто то нет? ПО какому принципу?	46	46
239	Как понять какие БК берут налог, а какие нет? В легальных? но иногда же не берут	46	46
240	Так и не понимаю в каких БК берут налог с выигрыша, в каких нет. Или в каждой легальной берут, но только у некоторых игроков?	46	46
241	Как подсчитать налог, куда его отдавать?	46	46
242	Должен ли я платить налог со ставок или букмекер это сделает вместо меня?	46	46
243	Каким образом высчитать сумму налога, если я играл в нескольких БК	46	46
244	Мой выигрыш составил более 15 тыс. рублей, мне платить налог?	46	46
245	зачем мы платим налог 13% кому он идет	47	47
246	что за налог в 13 процентов и зачем он?	47	47
247	налог на выигрыш 13% в лиге ставок , куда он идет !?	47	47
248	Есть ли налог в оффлайн точках букмекеров	48	48
249	Играя в ппс есть ли налог? В наземных точках, оффлайн точках	48	48
250	Надо ли платить налог играя с ППС?	48	48
251	Плтатит ли игрок наземного ППС какие либо налоги?	48	48
252	Решил ставить ставки, какую букмекерскую конторы посоветуете?	49	49
253	В какой бк лучше делать ставки?	49	49
254	Доброго времени суток! Можно ли использовать бк только для игры в тотализатор и не более? В случае выигрыша не возникнут ли проблемы с выплатами ( джекпота :-)) )?	49	49
255	Посоветуйте бк которые дают высокий кеф на ничью в лайфе (футбол)	49	49
256	Какие топовые зарубежные БК принимают рубли?	49	49
257	Подскажите нормальная контора бк bwin	49	49
258	подскажите пожалуйста БК?в которой все честно и где есть гарантия того что не кинут,а то я тут почитал отзывы о Фонбете! И что то желания у меня пропало в ней играть	49	49
259	Какую БК мне выбрать, чтобы не было проблем?	49	49
260	Какой букмекер самый лучший?	49	49
261	Если играть на крупные суммы, как лучше всего выводить деньги? какую валюты выбрать? чтобы проценты были минимальные.	50	50
262	Как лучше выводить деньги в какой валюте, если играешь на крупные суммы? Скрилл? чтобы % были маленькие.	50	50
263	Играю много и на большие суммы. Не уверен что вывожу деньги лучшим способом. Чем лучше всего это делать?	50	50
264	Если играть довольно на крупные суммы, то счет в какой валюте лучше всего выбрать, что бы с минимальными % можно было выводить деньги в платежную систему, а потом и на банковскую карту.	50	50
265	Если я буду играть в Италии Франции Кипре любой другой строне, не в россии, со счета контор в которых я регался регистрировался из россии, смогу ли я делать ставки и вывести деньги?	51	51
266	Могу ли я играть со своего российского аккаунта в другой странне?	51	51
267	Могу ли я играть в другой стране с российских букмекеров?	51	51
268	Если я перееду в другую страну, смогу ли я пользоваться своими счетами зарегистрированными в России, т.е делать ставки и выводить деньги, скажем из Италии, и кому в таком случае платить налоги?	51	51
269	могу ли вывести депозит в скрилл через нетеллер	52	52
270	skrill skkril skril скрил скрилл нетеллер нетелер neteller могу ли вывести деньги через них?	52	52
271	депозит делал через skrill смогу ли вывести через neteller в бет 365, пинакл , сбобет , мачбук , бетфаир.	52	52
272	Как не привязывать карту банка и играть делать ставки на сайте БК	53	53
273	Можно ли обойтись без банковской карты	53	53
274	Могу ли я не привязывать карту банка на аккаунт бк?	53	53
276	Как вы ставите рейтинг, оценку БК	54	54
277	Каким обазом вы оцениваете букмекеров	54	54
278	Почему у Париматч оценка 5?	54	54
279	Откуда такой высокий рейтинг у букмекера?	54	54
280	Каким способом я могу пополнить счет в конторе?	55	55
281	какой метод для пополнения своего счета в БК	55	55
282	Как узнать, через что можно вывести деньги у БК? У букмекерской конторы.	55	55
283	Как узнать какие платежные инструменты системы поддерживает контора?	55	55
284	Как узнать через что можно закинуть или вывести деньги на счет букмекерских контор, БК?	55	55
285	Как узнать, какие платежные системы позволяет использовать букмекерская контора?	55	55
286	Есть ли лицензия у букмекера?	56	56
287	Где посмотреть информацию о лицензии БК?	56	56
288	Напишите мне почту, телефон службы поддержки букмекера	57	57
289	как связаться со службой поддержки БК?	57	57
290	Где ознакомиться с отзывами о БК?	58	58
291	Хочу почитать отзывы на букмекера. 	58	58
292	Можно ли перевести средства, закрыть аккаунт из winline com на winline ру и играть по человечески? спасибо.	59	59
293	Можно ли перевести средства из winline.com на winline.ru?	59	59
294	Можно ли перевести средства из bkfon.ru на fonbet.com?	59	59
295	Можно ли перевести средства между 1хставкой и 1хбетом? 1xbet 1xставка разные конторы вообще или нет?	59	59
296	Здравствуйте fonbet .ком И bkfon.ru это разные букмекеры? и могут ли возникнуть какие либо проблемы если зарегистрирован там и там	59	59
297	Разноцветные фонбеты, в чем разница? Красный и синий.	59	59
298	Чем различается фонбет и бетфон? 	59	59
299	Две конторы Фонбет красная и синяя, чем они отличаются ? Или это одна ?	59	59
300	париматч.ru и париматч.com в чем разница?	59	59
301	1хставка это и есть 1xbet	59	59
302	Какая разница между 1хбетом и 1хставкой?	59	59
303	В чем разница между 1xbet и 1xставкой. Также известные как 1хбет и 1хставка	59	59
304	В чем принципиальная разница между этими двумя конторами? Почему у них разные оценки? речь про 1хбет и 1хставка.	59	59
305	В чем разница между 1xbet и 1xставкой. Также известные как 1хбет и 1хставка	59	59
306	В чем принципиальная разница между этими двумя конторами? Почему у них разные оценки? речь про 1хбет и 1хставка.	59	59
307	Букмекерская контора winline находится в двух отделах по оценкам. Winline есть 5 звёзд и 3 звезды, что вводит в не понятки. Прошу разъяснить ситуацию!	59	59
308	Что за странная ссылка, при нажатии кнопки - перейти на сайт? Причем нерабочая. На сайт так и не попал.	60	60
309	Почему при переходе на 1xbet меня направляет на 1хставка	60	60
310	Надижаю перейти на сайт, переводит на другого букмекера. В чем дело?	60	60
311	Развели 1хбет, можно ли как то привлечь их к ответственности? Мошенники! У них есть официальное представительство в россии? 1xbet	61	61
312	1xbet вывели с моего счета деньги. как привлечь их к ответственности? Они совсем мошенники? Они официально дейстуют в РФ, России?	61	61
313	Как играть на 1xbet? Сайт заблокирован в России.	61	61
314	1xbet это официальная бк или нет? Помогите разобраться в действиях этой букмекерской конторы. 1хбет.	61	61
315	Скажите, официальные ли действия 1xbet на территории РФ?	61	61
316	Какая ответственность за игру на нелегальных букмекерах? Уголовная или административная? Могут ли меня найти и наказать?	62	62
317	Если я постоянно играю и вывожу деньги с букмекеров запрещенных в россии могут ли меня наказать? Есть ли какая то статья для этого? они же не просто так нелегальные.	62	62
318	Как избежать ответственности за игру на запрещенных букмекерах в россии? Есть ли вообще эта ответственность? Я про букмекеров запрещенных РКН роскомнадзором, в общем, которые в реесте запрещенных сайтов находятся	62	62
319	Могут ли меня наказать за игру на незаконных букмекерах? Те кто не ведут свою деятельность из россии.	62	62
320	Является ли игра, на сайтах букмекерских контор, которые попали в реестр запрещенных сайтов (William Hill, Betfair и т.д.) уголовно-наказуемой? а так же получение постоянной прибыли с них	62	62
321	при регистрации в бк сделал опечатку, могут ли они заблокировать или исправят по просьбе? добавил лишнюю букву а в друго месте перепутал букву	63	63
322	перепутал букву, проста опечатка, при регистрации в букмекерской конторе. могут ли они ее исправить или забанят? Заблокируют то есть.	63	63
323	сделал ошибку когда регистрировался у букмекера, можно ли ее исправить?	63	63
324	при регистрации сделал в имени одну ошибку, тоесть букву добавил, как быть в этом случае, могут ли они меня заблокировать если я им об этом скажу и отправлю паспорт? конечно не специально, просто техническая ошибка с моей стороны.	63	63
325	Почему БК не принимает клиентов из тех или иных стран?	64	64
326	Почему букмекерская контора не принимает ставки из каких то стран?	64	64
327	Почему БК не хочет принимать мои ставки на основе гражданства?	64	64
328	Почему БК дискриминирует клиентам по гражданству? например, ставки граждан одной страны принимает, а другой нет?	64	64
329	Безопасно ли передавать букмекеру свои данные паспорта?	65	65
330	Зачем конторе мои паспортные данные? Гражданство влияет на что то? Что конкретно им нужно?	65	65
331	Что конкретно нужно конторе из моих паспортных данных?	65	65
332	Контора просит у меня паспортные данные для полной регистрации!	65	65
333	БК требует место прописки или выписку	65	65
334	букмекер затребовал сделать фото на фоне переписки	65	65
335	Как долго идут деньги до карты, если вывод подтвержден	66	66
336	Сколько выводятся деньги до карты если бк согласовала	66	66
337	Как долго выводятся деньги, скоро придут на карту?	66	66
338	Если в запрос на вывод подтвержден оператором то через какое время деньги поступят на карту visa?	66	66
339	Долго идет выигрыш на карту, что делать?	66	66
340	Вывел деньги из бк, очень долго, прямо продолжительное время они не доходят, не поступают на карту. Букмекерская контора косячит?	66	66
341	Выведенные из БК деньги продолжительное время не поступают на кредитную карту. Что делать?	66	66
342	Подскажите если кто знает.Сколько времени занимает вывод с 1хбет на карту MasterCard ?	66	66
343	Сделал запрос на вывод выигрыша с бк вильям хилл деньги со счета ушли но на карта и не поступили что мне делать	66	66
344	Через какой промежуток времени поступают деньги, отправленные на вывод?	66	66
345	Какой способ перевода денег более быстрый?	67	67
346	Как быстрее всего вывести средства?	67	67
347	Можно ли использовать несколько способов вывода и пополнения в одной и той же бк	68	68
348	Можно ли выводить деньги с разных систем в одной и той же конторе?	68	68
349	Можно ли использовать несколько платёжных систем при работе с одной и той же БК?	68	68
350	Какими суммами лучше выводить, слышал лучше каждый день по 1,5к так меньше вероятность что на счет поставят ограничегия	69	69
351	Какая минимальная сумма для вывода средств?	69	69
352	Какая максимальная сумма для вывода средств?	69	69
353	Сделал запрос на вывод средств, пришла смс от банка что деньги пришли в размере указанной суммы, но баланс карты не был увеличен. Такое возможно?	70	70
354	Деньги пришли на карту, но сумма не увеличена.	70	70
355	Что делать если не работает способ вывода денег	71	71
356	Не могу вывести депозит	71	71
357	Не получается вывести деньги, что делать?	71	71
358	Я инвалид 2группы и позтому индентификацию могу пройти заочно.Для этого 7.04.2017 заполнил все требуемые паспортные данные и также повторил по скайпу.Но оказалось ,что -то не прошёл.Прошу сообщить пожалуйста мне ошибку и повторить только заочно для уточнения не соответствия.	71	71
359	Я сделал ставку, потом уже через 3 дня пишут что сайт заблокировали, могу я вернуть деньги ?	71	71
360	Я вожу числа с карточки , деньги снимаются на пару минут , и потом снова перекидываются на аккаунт Помогите пожалуйста	71	71
361	Как перевести деньги если на выводе средств в 1xbet нет такого пункта как Сбербанк онлайн	71	71
362	Кинул деньги на сайт через киви кошелёк они не пришли. Много раз так делал все было хорошо а сейчас деньги не пришли остался чек. Как быть.	71	71
363	не принимает деньги по картам, по киви прошла оплата. в чем дело?	71	71
364	прошла ставка!выиграл деньги. после чего решил вывести их. захожу, на счет -он заблокирован! мне пришло от вас письмо с паролем! что с ним делать? как вывести деньги? с кем связаться? вот такое письмо мне пришло.	71	71
365	Запрос на вывод был одобрен, но деньги все никак не проходят. В окошке обозначено, что перевод в процессе и ожидает подтверждения у оператора. Но что-то долго он не подтверждает. Сколько времени придется ждать?	71	71
366	Сделал запрос на вывод средств, одобрили но деньги не приходят они в процессе уже 3 день, но попробовал вывести 100 рублей сразу перевели	71	71
367	В техподдержке уже неделю пишут что проблемы со шлюзом и деньги нельзя вывести. Выводы висят в обработке день, затем возвращаются с пометкой "Перезакажите выплату"	71	71
368	Только зарегистрировалась и положила деньги на счет а номер счета не по смотрела приложение вылетело тут же захожу нет профиля как узнать номер счета?	71	71
73	Даю прогнозы на РБ , но спустя несколько часов они просто исчезают , и даже если они нормально написаны , то у других то прогнозы остаются , а мои убирают с сайта , что за дискриминация	9	9
369	Здравствуйте,я вчера пополнил счёт 2 раза деньги не пришли.В чем дело?3026293	71	71
370	Забыл номер счета,он мне пришел на телефон а это сообщение удалил,что мне делать	71	71
371	я создал через мобильное прил номер счета потом мне придложили скачать другую версию!!!!! когда я хотел снять со счета деньги он попросил авторизоватся я зарегистрировался заново и не могу вывести деньги со старого что делать?	71	71
372	не могу вывести денежные средства со счета, не приходит индефикация? Как мне быть?	71	71
373	Как получить бесплатный бонус, после пополнения счёта и после скольких игр, его можно вывести ?	71	71
374	что делать если забыли секретные вопросы?	71	71
375	Квитанция:2453 Терминал:10261474 Дата:02.05.2017 15:33:36 Поставщик: Киви банк Зачислено:100 руб. Номер телефона/счета: 79670847870 Код операции:3891908147 Почему деньги не пришел на моего личного кабинета ???	71	71
376	Не работает приложение БК.	71	71
377	уважаемый админ! Ответьте, пожалуйста на вопрос. Как мне вывести деньги со счета БК Марафон, если я не помню ответа на секретный вопрос? Ответ по глупости оказался не записан и со временем забыт. Возможно ли получить новый секретный вопрос?	71	71
378	Нет возможности делать запросы в личном кабинете через пк.	71	71
379	Добрый день, не выводят на киви уже в течении трёх дней, проблема как будто не решается, возможно ли вывести другим способом деньги? 	71	71
380	Ограничения по количеству ставок в экспрессе отсутствует?	71	71
381	Здрасте. Когда Марафон станет белым, пушистым и будет работать через ЦУПИС? Чехарда с перебоями в работе из-за блокировок уже утомила. Раз ваши программисты не могут наладить бесперебойную работу, как винлайн, леон или лига ставок, то сделайте официальный сайт...	71	71
382	Как осуществляется (или осуществляется ли) удержание налога с выигрышных ставок?	71	71
383	Доброго времени суток. Год назад были порезаны максимумы по счёту 93768GU из-за нескольких ставок по вилкам, это стратегий давно не пользуюсь. Есть ли возможность восстановить максимумы для комфортной игры?	71	71
384	Зарегистрировался на Лига ставок по вашей партнёрке, бонус не начислен, Телепняк Максим Анатольевич, номер счёта 997468834	71	71
385	Скиньте сылку на Фонбет в апстори	71	71
386	давно не заходил в приложение(ФОНБЕТ)на айфоне,недавно попытался зайти,не чего не открывает и выдаёт непонятные ошибки,чтобы перезайти не помню не логин не пароль. подскажите как быть?	71	71
387	Подскажие что нужно сделать для того чтобы отправить свой ресурс на проверку Вашей компанией?	71	71
388	Не могу зайти на свой профиль,пишет безопасное подключение не возможно	71	71
389	Никак не получается зайти на страницу входа,где я смог бы ввести свой логин и пароль,главная страница,страница поддержки и т.д. спокойно открываются.Подскажите пожалуйста,в чем дело?	71	71
390	несколько раз пробовал снять деньги на карту, но показывает что какая то ошибка	71	71
391	на счете в бк находится депозит оплаченный истекшей картой. Если я сейчас сделаю пополнение новой картой, смогу ли снять потом и предыдущий депозит? Или только банковский перевод?	71	71
392	При регистрации пишет, что пользователь с данным lp уже зарегистрирован	71	71
393	Подскажите, не будет ли проблем (при выводе средств с букмекерской конторы) при использовании НЕ именной карты? могут ли они потребовать её фото и не вызовет ли она каких-либо вопросов или подозрений?	71	71
678	Где лучше всего получать лайв стату статистику	120	120
714	Самый крутой букмекер в прематче?	137	137
725	Играю в международной конторе, не верифицировал счёт. Надёжно ли это?	143	143
394	Через рейтинг букмекеров по бонусной программе в бк Леон не проходит регистрация?Все поля заполнил правильно!Пишут добавить 1цифру или букву в пароль.Добавил аж до двадцати включая символы!-и так раз двадцать!Бесполезно! Что делать?	71	71
395	Когда я хочу пополнить счёт с карты,то пишет ваш депозит заблокирован,что делать?	71	71
396	Вчера только что зарегистрировался на сайте,а сегодня уже не могу туда зайти,пишет ваш щет заблокировать,как так что это такое	71	71
397	Заблокировали игровой счёт, почему?	71	71
398	Уже третьи сутки не пополняется счёт в бетсити с карты VISA. Вводу все данные нажимаю продолжить и пишет сразу счёт не выставлен ошибка пополнения. Помогите	71	71
399	Не могу зайти в аккаунт, пишет, что не правильный логин или пароль, хотя логин мой майл, пароль поменяла, но всё равно пишет, что не правильно!! Что я делаю не так?	71	71
400	Дело в том что я хочу зарегистрироваться в БК но имею временную прописку,по этому хочу узнать возникнут ли у меня с этим проблемы с дальнейшей идентификацией.	71	71
401	Вазможно ли восстановить 1 ый аккаунт 1xBet по паспортным данным ели я потерял номер счёта и пароль ?	71	71
402	Правда ли что есть такие ограничения? Я ни где не нашёл это в их правилах	71	71
403	просят верифицироваться на сайте но я не могу найти где это можно сделать, подскажите пожалуйста	71	71
404	Как восстановить пароль?	71	71
405	Будут ли в этом году традиционные новогодние фрибеты от компании фонбет?	71	71
406	Почему в белорусской версии сайта и на ППС не предлагаются дополнительные исходы на статистику футбол, теннис, хоккей?	71	71
407	Я бы хотел поменять мой электронный адрес на сайте Винлайн.com я указал неверный ошибочно как это сделать?	71	71
408	Скажите Можно ли восстановить пароль с помощью номера телефона через который я регистрировался?	71	71
409	Зарегистрировал не правильный номер,не могу поменять,не открывает страницу	71	71
410	Интересует количество накопленных баллов	71	71
411	Что у вас за платформа .Как мне войти на покер онлайн.Всё время пишет не верный пароль .Пробовал менять .Открывается всё кроме покера онлайн .Мой логин 3370813.	71	71
412	Пройдёт ли верификация если счёт зарегистрирован на старый паспорт (номер,прописка и т.д) а я пришлю ксерокопию нового паспорта (заменил в 20 лет)	71	71
413	Такой вопрос я играю по бою и довольно таки не плохо могу выкатать играя в лайве. Скажите после какой суммы вы меня обрежете?? Ставлю не вилки не доги и т.д. По бою но выиграть могу много	71	71
414	живу в украине,bet365 заблокировал аккаунт,пвх получила,документы заверила и отослала,отправила банковские реквизиты они не подходят,они не могут переслать средства через американский банк посредник,что делать подскажите	71	71
415	Зарегистрировался в конторе Leon. Ввел бонусный код. Зачисление бонусных денег не произошло. Что делать?	71	71
416	как поменять номер телефона	71	71
417	А скажите пожалуйста в каком конкурсе прогнозов можно поучаствовать в ближайшее время?? есть ли какие нибудь варианты заработать на этом сайте?	71	71
418	Выкинуло с моего аккаунта и не заходит и вобще олимп не работает	71	71
419	Хочу знать какие страны запрещены на Winline	71	71
420	А скажите пожалуйста в каком конкурсе прогнозов можно поучаствовать в ближайшее время?? есть ли какие нибудь варианты заработать на этом сайте?	71	71
421	Прошло почти 2 недели, как мой счет заблокирован в БК Марафон после моего обращения о неавторизированном использовании игрового счета. Хотелось бы конкретики относительно сроков рассмотрения деталей произошедшего соответствующим отделом.	71	71
422	В БК проводятся ремонтные работы, сайт не работает?	71	71
423	У моего друга заблокировали счет в БК "Олимп".Видимо , потому что , он очень много выиграл.Как вернуть деньги и разблокировать счет?	71	71
424	Букмекер уже 2 дня не расчитывает ставку.	71	71
675	Какой миним у Skrill	118	118
425	Здравствуйте не могу зайти на сайт?	71	71
426	Добрый день, у меня вопрос касательно конторы 1xbet. Поставил свою первую ставку в этой конторе (крупную сумму) на событие ночью с коэффициентом 1,43, утром захожу в историю ставок стоит 1,2. Скрины не делал. Насколько реально доказать их мошенничество?	71	71
427	три дня назад поставил ставку выбрал экспресс вроде бы все съиграло только я незнаю одной игры из экспресса тенисный матч ну я думаю что моя ставка съиграла. я не могу получить расчет уже 3 дня	71	71
428	Что делать если взломали и забрали деньги ?	71	71
429	почему опять возврат по выиграшной ставке?	71	71
430	я не пойму почему пару моих ставок застыли и ничего не происходит с ними,написано не рассчитано и всё!!!как это понимать?	71	71
431	Букмекер неправильно рассчитал матч, что делать?	71	71
432	Этот чек подлинный или подделка?	71	71
433	Я хочу сменить валюту счета	71	71
434	Сайт плохо работает, что делать.	72	72
435	Плохо работает сайт	72	72
436	Сайт не работает, виснет, лагает, зависает	72	72
437	Недавно зарегистрировался , испытываю проблемы с сайтом	72	72
438	Добрый день, как попасть к Вам в раздел капперы?	73	73
439	Добрый вечер! Как можно удалить свой аккаунт ?	73	73
440	Здравствуйьте. Искал ответ на вопрос на сайте,но не нашел. В контакте часто вижу наклейку на аватарках групп о том,что они прошли Вашу проверку. Как сделать так,чтобы и моя группа прошла вашу проверку?	73	73
441	Здравствуйте Уважаемый Рейтинг букмекеров.Как можно получить вашу проверку на вкладку капперы,т.е попасть в список проверенных капперских сайтов?	73	73
442	Добрый вечер уважаемые "РБ" . Хочу попасть в ваш рейтинг капперов,точнее свою группу дать на проверку..	73	73
443	Куда можно предложить сайт каппера на проверку?	73	73
444	Доброго времени суток! Наблюдаю что многие сайты и группы в вк отмечены тем что прошли проверку "Рейтинга Букмекеров". Скажите пожалуйста как пройти вашу проверку?	73	73
445	Добрый день,хочу отправить свою группу по ставкам на проверку и получить одобрение,как это возможно сделать?	73	73
446	Добрый день. Как я могу пройти проверку на вашем ресурсе? Наш сайт streambet.ru.	73	73
447	Как пройти проверку у Вас, если у меня есть паблик 3800 участников?	73	73
448	Здравствуйте я занимаюсь прогнозами на спорт и их продажей в социальной сити вконтакте. Есть ли возможность пройти у вас проверку?	73	73
449	Здравствуйте я администратор одного из пабликов в ВК по тематике "Прогнозы на спорт" хотел бы пройти проверку у вас. Куда обратиться?	73	73
450	Всем доброго времени! такой вопрос:как пройти проверку прогнозистов , веду группу, планирую создать сайт,хотелось бы пройти проверку и вступить в ваш рейтинг!	73	73
451	приветствую, веду свой паблик в ВК ставки полностью верфицированы на сервисе betonsuccess, как пройти вашу проверку? /Комментарий был отредактирован. Ссылки на сторонние ресурсы запрещены/	73	73
452	Как подать заявку на проверку своей группы вконтакте?	73	73
453	Есть свой капперский проект, хочу пройти проверку сайта "Рейтинг букмекеров". Куда надо подать заявку?	73	73
454	А можно как то новость создать?Сегодня зашел ординаром кф 101)))хотел дать прогноз но что в трибуне на это событие но что то рука не дошла)))	73	73
455	Доброго времени суток. Я точно не помню был ли ранее зарегистрирован на Вашем ресурсе. Сегодня прошел регистрацию, но так как планирую принять участие в конкурсе, то возникает вопрос - не получу я в случаи повторной регистрации БАН.	73	73
456	Как попасть моей группе в ваш раздел Капперы. ? Занимаюсь Прогнозами на движение коэффициента на бирже бетфаир до начала игры. И обычными ординарными ставками.по выгодным коэффициентам.Все бесплатно в моей группе .Хочу поддержку и обширную аудиторию	73	73
457	Добрый день ! Каким образом можно попасть в список "Рейтинг капперских сайтов" . Группа ВК 750 участников	73	73
458	Удалите мой аккаунт на РБ	73	73
741	Какие конторы предлагают бонус? А бонус для России?	158	158
459	Приветствую, администрация РБ, хотел узнать, каким образом моя группа могла бы попасть в рейтинг капперов. Она полностью соответствует требованиям РБ. Все проверки готов пройт	73	73
460	Можно-ли удалить свой профиль на сайте РБ? Если да, то как?	73	73
461	Как удалить прогноз на сайте РБ?	73	73
462	Статус не обновился через 2 месяца, почему?	73	73
463	Статус понижен с Гуру на Профи, хотя все условия соблюдены	73	73
464	логина, сегодня первый раз получилось войти, но потом вылетел и снова не могу войти. Может вы в курсе в вем проблема?	73	73
465	Нашла одно приложение в аб сторе , но там не даёт Приложение регистрации , пишит введите номер купона. Но у меня его нет . Как мне на айфон скачать приложение и зарегистрироватся?	73	73
466	не могу зайти в личный кабинет пишет не правильный пароль,а все пишу правильно,и восстановить так же не получается,что делать?	73	73
468	хочу поменять почту на РБ	73	73
469	доброго времени суток. у меня на сайте два профиля. один я хочу удалить. подскажите как	73	73
470	подскажите как добавить каппера в рейтинг? заранее спс	73	73
471	Как добавить свою группу вк в рейтинг капперов ?	73	73
472	Проблемы с системой Skrill	73	73
473	Не могу найти как удалить свою страницу.	73	73
474	Почему вы меня заблокировали?	73	73
475	Как добавить свою группу вк по спорт.прогнозам в рейтинг?	73	73
476	Хотелось бы добавить свою группу к вам на сайт. Что для это нужно сделать?	73	73
477	Хотелось узнать на какой стадии мой запрос, и какое решение было принято.	73	73
478	Что нужно сделать, чтобы моя капперская группа в вк попала в ваш рейтинг?	73	73
479	Столкнулась с группой прогнозистов  verbalen. В ваших отзывах о каперах о них ничего не написано. Статистика у них отличная. Пожалуйста проверьте эту группу, не рисуют ли они статистику. Спасибо))	73	73
480	Я хочу предложить идею для развития сайта, конкурса	73	73
481	Не могли бы вы улучшить сайт, внеся необходимые изменения	73	73
482	не работает ваше приложение, что случилось?	73	73
483	у меня есть предложение о сотрудничестве	73	73
484	я представитель букмекерской компании	73	73
485	Не могу зайти в личный кабинет, для пополнения счета, сервер не отвечает, почему?	73	73
486	Не могу зайти к себе в личный кабинет !	73	73
487	Как удалить свой аккаунт на всегда?	73	73
488	расширения давно перестали помогать, даже кровные хз как вывести, подскажите дельным советом пожалуйста.	74	74
489	Сайты все перевели на один 1х ставка, но для ставок в 1хставке требуется сходить в контору, может кто знает другое приложение подобное леону или где-нибудь с файлообменника ссылку кинет	74	74
490	Не могу попасть на сайт лиги ставок	74	74
491	Не могу попасть на сайт вильям хил, чтобы посмотреть коэффициенты для участям в конкурсе. Как решить эту проблему ?	74	74
492	Я не могу зайти на свой логин .нет доступа.с Казахстана сам.для нас заблокирован ?	74	74
493	скиньте новый сайт зенит бк	74	74
494	Как выйти на сайт бк пари-матч.ком?	74	74
495	Вчера и сегодня безуспешно пытаюсь войти на сайты БК "Марафон" и БК "Фонбет". В чем причина? Опять блокировка?	74	74
496	Нет входа ни с браузеров ПК ни с телефона андроид. Только мобильная версия работает. По ссылке РБ тоже не получается войти. Сам сайт не загружается вообще.	74	74
497	Сделал прогноз для конурса, его удалили, т.к. такой ставки нет в БК Вильям Хилл. Как узнать, если ли данный исход, если у Вильям Хилл нет сайта ?	74	74
498	подскажите пожалуйста, как войти на вильям хилл? сегодня блокнул провайдер. расширения или зеркала? есть мозилла и опера турбо. спасибо	74	74
499	Здравствуйте,не могу зайти на сайты букмекерских контор,они заблокированы,как обойти это?	74	74
500	Нахожусь в Испании, не заходит на BetFair.com перекидывает на BetFair.es. подскажите, как решить эту проблему?	74	74
681	То, что в РФ блокируют сайты, не означает что они запрещены?	121	121
501	я не могу зайти в 1xbet когда я захожу там написано страница заблокирована что делать?	74	74
502	Как зайти на Вильям Хилл?	74	74
503	не могу получить доступ к сайту	74	74
504	Заблокировали Winline22, есть зеркало?	74	74
505	Не могу перейти на вилиям хилл почему?	74	74
506	Помогите войти на сайт Вильям Хилл	74	74
507	Заходил на этот сайт в течении 2 месяцев ... Бац и заходу сегодня и пишет доступ ограничен	74	74
508	Вопрос прост: многие сайты бекмекерских контор в России регулярно блокируются по требованию росинтернетнадзора (или как их там). В частности, страдает WH, где не очень оперативно создают зеркала и двойники. Кто как выкручивается?	74	74
509	при верификации на бетфайр при отправке доков нужно ли отключать плагин ZenMate(так как сижу с немецкого IP а паспорт отправляю российский) не возникнет ли у меня проблем?	74	74
510	Вопрос такого характера: два дня назад пропало соединение с БК Winline, работает ли сайт? не заблокировали его?	74	74
511	Хотел бы открыть счет, но оператор МТС(Россия) блокирует вход на официальный сайт. Как то возможно обойти данную преграду?	74	74
513	без всяких проблем ставил в интернете в БК 1хбет... А сейчас зайти не могу, сайт заблокирован. Не подскажите в чем дело?	74	74
514	Не могу зайти на сайт может есть какой-нибудь другой сайт фонбета	74	74
515	дайте зеркало	74	74
516	не могу зайти на сайт pinnacle, есть средства на счету,как можно их вывести?	74	74
517	Сайт иногда блокируют.Каким образом обойти блокировку?	74	74
518	Не могу войти на сайт, есть ссылка?	74	74
519	Сайт на котором я играл заблокировали , что делать подскажите?	74	74
520	Друзья, помогите разобраться. С телефона не могу зайти на этот сайт, блокирует (MTC-BLOK) что за хрень? до этого все работало.	74	74
521	Известно ли почему не работает сайт Виллиам Хилл? И когда на него можно будет зайти?	74	74
522	не могу зайти на сайт	74	74
523	Как зайти на сайт БК Титанбет?	74	74
524	весь день не могу зайти на сайт,раньше заходил без проблем	74	74
525	Немогу попасть на сайт, зеркало	74	74
526	Я не могу зайти на сайт появляется изображение что доступ ограничен	74	74
527	Не могу зайти на сайт LEON	74	74
528	Я не могу зайти на сайт ресурс заблокирован везде	74	74
529	Мужчины и леди, доброго времени суток. Столкнулся я с такой проблемой: не нахожу ссылку на William Hill. Воооот. Быть может, кто в курсе, окажет мне помощь?? Безмерно благодарен)))	74	74
530	Как попасть на сайт БК William hill? Пробую, но он заблокирован. Есть ли другой способ?	74	74
531	Как зайти бк William Hill, никак не могу найти альтернативную ссылку.	74	74
532	Какие критерии для капперских сайтов	75	75
533	каким критериям нужно соответствовать каперской группе, ресурсу?	75	75
534	Почему ничего не приходит на почту когда подписался на каппера? И не могу посмотреть его прогнозы	76	76
535	Не могу посмотреть прогнозы каппера, не приходят уведомления и ничего тоже	76	76
536	Подписался на каппера но ничего не приходит, что делать	76	76
537	Добрый день. Подписался на каппера, но не могу посмотреть его прогнозы на сегодня и завтра. На почту также ничего не приходит. Объясните пожалуйста, что я сделал не так. (первый день на сайте)	76	76
538	Капперская группа подделывает статистику и обманывает	76	76
539	каппер мошенник	76	76
540	Мы играем с женой, с одной карты на двух аккаунтах. Будет ли это считаться мультиаккаунтингом? С одного устройства	77	77
541	Если играем с братом другом с одной карты на разных двух нескольких аккаунтах, считается ли это мультиаккаунтингом? Мультиакком, мультиком, или как он там. Устройства разные	77	77
542	Одна кредитка, то есть кредитная карта, и два аккаунта. могут ли забанить? Если я пополнил так. И почему. Устройство одно	77	77
543	Забанили за мультиакк, друг пополнил с моей карты аккаунт. Как так?	77	77
512	Перехожу на сайт и его блокирует как сотовый так и интернет провайдер,как зайти?	74	74
544	если мой брат будет играть в той же конторе что и я, с одного компа, пополнять счет с одной карты на разные счета - это мультиаккаунтинг???	77	77
545	Зарегался с другого устройства, не могу вывести средства. Типа зареган другой логин	78	78
546	Забыл логин пароль от акка, зарегался с другого, не могу вывести средства	78	78
547	Потерял телефон, зарегался со второго, деньги не выводятся. Не могу восстановить симку	78	78
548	Был зарегестрирован с первого своего телефона и забыл логин пароль. Зарегестрировал с второго телефона и не могу вывести средства. Пишут что на ваши данные зарегестрирован другой логин. Что делать. Восстановить старый не получается	78	78
549	Можно ли зарегистрироваться зарегаться заново если забыл пароль заблокируют или нет	79	79
550	Что делать если забыл пароль можно ли пройти регистрацию заново	79	79
551	Забыл пароль к своему счету. Могу ли я пройти регистрацию заново, станет ли это поводом для конторы заблокировать мой счет?	79	79
552	Как относится бк леон 1хбет марафон легалбет лига ставок к догонам?	80	80
553	Какие конторы блокируют за догоны? Банят ли за это, нарушает ли это правила игры?	80	80
554	Могут ли меня заблокировать за догоны	80	80
555	Как относиться бк марафон к догонам?	80	80
556	Если я стабильно выигрываю в бк, могут ли меня забанить или порезать максимумы?	81	81
557	Несколько аккаунтов в разных бк букмекерских конторах, могут ли мне порезать максимумы или заблокировать, забанить? Если я стабильно выигрываю. Считается ли это спекуляцией?	81	81
558	Стабильный выигрыш это спекуляция? Могут заблокировать?	81	81
559	У меня есть счета во многих БК. стабильно выигрывать, какова вероятность что мне порежут максимумы? Считается ли стабильный выигрыш спекуляцией???	81	81
560	За что режут максимумы	82	82
561	порезка счетов, что это и почему	82	82
562	Почему порезали максимумы, что это вообще такое, что за ограничение	82	82
563	Почему понизили максимумы на сумму ставки? Что с этим можно сделать?	82	82
564	как я могу поднять свои лимиты?	83	83
565	мне снизили максимумы, как повысить их обратно	83	83
566	хочу поднять лимиты, как это сделать	83	83
567	Как поднять лимиты в лайве?	83	83
568	я играю на вилках, чего опасаться?	84	84
569	как можно выигрывать на вилках?	84	84
570	вилочники законны или нет?	84	84
571	Не могу играть, порезаны ставки. Порезаны максимумы. Могу ставить только маленькие суммы. Что делать?	85	85
572	ЧТо делать если не могу поставить нормальные ставки?	85	85
573	Что делать если режут максимумы	85	85
574	Не могу поставить ни одной ставки, т.к. порезаны максимумы....даже тупо беру любой попавшийся прогноз с кэф 34 и то там максимально возможная сумма ставки 1 р.	85	85
575	Как играть антиэкспресс? что это такое?	86	86
576	Что такое антиэкспресс	86	86
577	СЛышал про антиэкспресс, расскажите что это	86	86
578	Скажите как правильно играет антиэкспресс?	86	86
579	Коридор - что это такое? 	87	87
580	Коридорщики это кто такие?	87	87
581	Что значит фора -0,25, +0,75, -1,25	88	88
582	как рассчитать азиатсую фору  +0,25, -0,75, +1,25	88	88
583	Сделал две ставки с одним исходом. Так можно? Могут ли наказать?	89	89
584	Может ли бк заблокировать или как то наказать за ординар с одним и тем же исходом несколько раз?	89	89
585	Могут ли заблокировать за одинаковый ординар?	89	89
587	Можно ли ставить несколько раз на один и тот же исход (ординарами)?	89	89
588	Можно ли пользоваться киви для вывода? В каких можно?	90	90
589	КИви-кошелек. можно через него выводить деньги и где?	90	90
590	Можно ли использовать QIWI-кошелек для вывода средств в зарубежных БК?	90	90
591	ПРоблемы с киви	91	91
592	есть проблемы с выводом на QIWI	91	91
593	Утеряна симка, но доступ к киви-кошельку остался. При переводе денежных средств приложение постоянно запрашивает подтверждение по смс-номеру кошелька. Как быть? Восстановлению сим-карта не подлежит, и терять деньги не хотелось бы... Посоветуйте пожалуйста что можно предпртнять в таком случае?	91	91
594	Не могу войти в аккаунт бк что делать	92	92
595	Нельзя делать ставку не могу ставить заблокировали что делать	92	92
596	Не могу войти на аккаунт причина: "Нельзя делать ставки и пополнять баланс". Как решить эту проблему?	92	92
597	Что за категория нежелательных клиентов?	93	93
598	Что такое нежелательные клиенты? Заблокировали, но дали вывести деньги.	93	93
599	Букмекерская компания заблокировала мой счет, предварительно дав вывести баланс. Почему?	93	93
600	ошибка 32 что значит	94	94
601	что за ошибка 32	94	94
602	почему при входе в фонбет выскакивает ошибка 32	94	94
603	все сделал но не получил бонус что делать	95	95
604	не дали бонус хоть все условия акции сделал, что делать	95	95
605	что делать если не начислили бонус, условия выполнены	95	95
606	Я выполнил все условия промоакции, но не получил автоматически начисляемый бонус. Что делать?	95	95
607	За что бк может меня заблокировать забанить?	96	96
608	За что обычно блокируют букмекерские конторы?	96	96
609	Почему делают блок букмекеры?	96	96
610	За что могут заблокировать счет в БК	96	96
611	За что мой счет в БК может быть заблокирован?	96	96
612	Как делать ставки?	97	97
613	Хочу начать играть. Как это сделать? с чего начать? как зарегистрироваться в бк?	97	97
614	Хочу сделать ставку, как зарегаться у букмекера	97	97
615	Как начать играть, как пополнить счет. что делать?	97	97
616	как пополнить счет и как делать ставки?	97	97
617	Забыл свой айдишник, айди, что делать чтобы его восстановить?	98	98
618	Как можно восстановить айди? Id, я забыл его	98	98
619	Забыл свой ID, что делать?	98	98
620	Забыл пароль 	98	98
621	Есть ли новая информация о законах по ставкам	99	99
627	Посоветуйте русскоязычную БК, служба поддержки на русском языке	100	100
629	какие букмекеры принимают ставки на киберспорт?	101	101
630	где я могу поставить на киберспорт, в какой БК?	101	101
631	Какие букмекеры легальные в России?	102	102
632	Хочу играть в легальных БК, из каких выбирать? 	102	102
633	Дайте промокод для регистрации	103	103
634	Какие есть бонусы в БК?	103	103
635	Есть фрибеты для регистрации?	103	103
636	Какие акции сейчас в букмекеских конторах?	103	103
637	Где можно посмотреть статистику команд?	104	104
638	Где найти статистику чемпионата?	104	104
639	Где узнать результаты футбольных матчей?	104	104
640	Как посмотреть историю изменений коэффициентов?	104	104
641	Какие прогнозы на матч Бавария - Боруссия?	104	104
642	Есть мысли по ставкам на игру Арсенал - Ливерпуль?	104	104
643	Посоветуйте литературу, книги по ставкам, стратегии ставок	105	105
644	Есть какие-то издания, материалы для начинающих капперов, прогнозистов	105	105
645	Что такое тотал, фора?	105	105
646	Учебники по беттингу, где найти?	105	105
647	Что такое маржа?	106	106
648	Все пишут о марже, а что это?	106	106
649	Как определить маржу букмекера?	106	106
650	Что еще за система, как это?	107	107
651	Как правильно посчитать прибыль по системе?	107	107
652	Вконтакте предлагают договорные матчи, это развод?	108	108
653	Купил точный счет договорного матча, но ставка не сыграла	108	108
654	Мне предлагают архивированный файл на почту	108	108
655	Раскрутка счета, гарантированные прогнозы, 100% прибыль	108	108
656	Что такое Первая СРО, для чего она?	109	109
657	Зачем нужна СРО Букмекеров?	109	109
113	Как узнать свою статистику на РБ?	17	17
658	Есть зарубежный аналог Рейтинга букмекеров?	110	110
659	Есть еще что-то воде рейтинга букмекеров?	110	110
660	Для чего нужны сканеры вилок?	111	111
661	Сканер вилок, что это такое? 	111	111
662	Что такое мультиаккаунтинг?	112	112
663	Мультиаккаунтинг, это что и как избежать? 	112	112
664	Что такое верификация?	113	113
665	Для чего нужна верификация?	113	113
666	Срочно понижайте оценку букмекера	114	114
667	Переносите БК в черный список, они не реагируют на жалобы	114	114
668	Почему вы не снижаете рейтинг букмекера	114	114
669	Вам платят за рейтинг? Срочно понижайте рейтинг!	114	114
670	В каком банке(РФ) в случае перевода крупной суммы на кредитную карту будет меньше проблем с получением этих денег?Если будут проблемы, то какие?	115	115
671	Сбербанк заблокировал перевод зарубежного букмекера.	115	115
672	Нашел в правилах промоакции букмекерской конторы следующее: мы оставляем за собой право отменять данное предложение либо изменять любые из его правил и условий в любое время без уведомлений или объяснения причин. Компания также оставляет за собой право не допускать некоторых владельцев счетов к участию в данной акции. Справедливо ли это правило?	116	116
673	Для верификации адреса в зарубежных платежных системах обязательно иметь квитанцию за коммунальные платежи с адресом, совпадающим с пропиской?	117	117
674	Есть ли минимумы у скрилл	118	118
676	Какой минимум на депозит и на вывод в Skrill?	118	118
677	Что нужно для получения VIP-статуса в Skrill?	119	119
679	Как букмекеры получают лайв статистику	120	120
680	Где букмекеры берут live статистику? есть ли такие сайты с live статистикой более быстрые и точные чем myscore и тому подобные? спасибо	120	120
682	на территории РФ блокируют всех букмекеров или только избранных?	121	121
683	Наткнулся на контору Olimp-smart. Есть и в инстаграмме и в интернете есть сайт. предлагают хорошие условия. Можно ли доверять этой конторе?	122	122
684	Является ли банковский перевод моментальным?	123	123
685	Как долго идут деньги с вебмани, сколько ждать	124	124
687	Пойдет ли Visa Electron для ввода и вывода средств в БК?	125	125
688	Ало! Логин и пароль все на листочки, заходил все норм было,сейчас пишет Неверный пароль или Логин!200 что делать?	126	126
689	10 раз уже вводил, но пишет неверный пароль	126	126
690	ставил лайв, но гол забили после того, как я поставил ставку	127	127
691	Вернут ли ставку, если счет в лайве был неправильным, а я проиграл, сделав ставку?	127	127
692	Для верификации адреса в платежной системе нужна банковская выписка по переводу именно в ту систему, в которой я прохожу проверку личности?	128	128
693	Нужно ли при регистрации в зарубежных БК переводить паспортные данные?	129	129
694	Пользуюсь вашим сайтом. Но с мобильного телефона немного неудобно. Хотелось бы иметь приложение на Android?. Если оно есть. И если его нет, то будете ли вы его создавать?	130	130
695	Есть ли мобильное приложение Вашего сайта для устройств на Andriod?	130	130
696	Есть ли приложение ios для РБ	131	131
697	Уменя apple, ifone, есть приложение рейтинга букмекеов?	131	131
698	По логике раз бк не зарегистрирована на тер.РФ и нет контроля, то платить налог должна бк и если ваш банк заблокировал счет, то им достаточно дать понять, что это не финансирование терроризма или отмывание денег.	132	132
699	Нужно ли платить налог за игру в зарубежных БК	132	132
700	Играю в офшорной, нелегальной БК, платить налог?	132	132
701	Платить ли налог, если играешь у зарубежного букмекера?	132	132
702	Добрый день, подскажите БК в которой дают фиксированные коэффициенты на лошадиные скачки в США, надёжного и принимающего игроков из РФ.	133	133
703	Где можно поставить на лошадиный скачки?	133	133
704	Здравствуйте подскажите пожалуйста , сколько выводятся деньги с конторы на банковскую карту мастер карт.	134	134
586	Можно ли несколько раз поставить одну и ту же ставку? На одинаковый исход. Ординарами например	89	89
686	Как долго ждать перевода на Webmoney из букмекерской конторы?	124	124
705	Почему топ капперы сайта дают столько минусов? Они делают специально чтоб люди заходили в минус?	135	135
706	Ваши эксперты специально работают на контору, давая неправильный результат?	135	135
707	Сколько букмекеры платят вашим экспертам?	135	135
708	ставка: какой игрок гол. например я взял какой то игрок забьет гол, но этот игрок не вышел в составе и на замену тоже. это считается ВОЗВРАТ или ПРОИГРЫШ?	136	136
709	поставил что забьет полузащитник, но рассчитали проигрышем	136	136
710	Тычет мне на какой-то пункт правил	136	136
711	поставил на основное время матча, но ставка рассчитана с дополнительный таймом	136	136
712	Какие конторы посоветуете для игры в лайве, онлайн?	137	137
713	Какая БК дает широкую линий на live?	137	137
715	У какой БК самая широкая роспись, линия?	137	137
716	у вас неправильный рейтинг, он должен основываться на мнении игроков	138	138
717	почему при составлении рейтинга не обращают внимание на мнение людей?	138	138
718	Посоветуйте пожалуйста хорошего каппера с которым можно поднять банк.	139	139
719	Какой каппер имеют лучшую проходимость ставок?	139	139
720	Разрешено ли регистрироваться и играть в нескольких букмекерских конторах?	140	140
721	можно регистриовать сразу в трех, четырех БК?	140	140
722	Что грозит вилочнику, если БК вычислит игру на вилках?	141	141
723	что будет за игру на вилках?	141	141
724	Я могу ограничить себя от комментариев и прочего вообще появления на мои глаза одного человека ?	142	142
726	На эл.почту не приходят прогнозы	144	144
727	Почему, когда я пишу комментарии будучи авторизованным под данным профилем, они публикуются от имени другого профиля?	145	145
728	Как быть, если для общения со службой поддержки БК требуется знание английского языка, а я им не владею?	146	146
729	В какой букмекерской конторе можно делать ставки в mlb именно на победу питчера, а не на победу команды ?	147	147
730	Если верификаторы, которые ведут статистику по лайв-ставкам?	148	148
731	Есть ли сайты с помощью которых можно вычислять верояность?? Например, где есть поля для ввода предпологаемых значений, а автоматом выдает вероятностью	149	149
732	Я хочу изменить свой электронный кошелек, чтобы сделать вывод деньги. Номер моего игрового счета 2732557 , мой электронный кошелек(qiwi) +77087489341 , хочу изменить на +77072611996 . Заранее спасибо, нового электронного кошелька я сделал депозит.	150	150
733	Скажите пожалуйста почему в БК Betcity прямая красная карточка не рассчитывается как две ЖК, и более того вторая ЖК повлёкшая за собой красную карточку тоже не считается в общий Тотал ЖК?	151	151
734	Ищу информационные порталы, посвященные лигам английского футбола начиная от Чемпионшипа (про АПЛ пишут везде и много). Подскажите, если у вас есть подобные.	152	152
735	С помощью Вашего сайта хотел перейти на сайт БК Пиннакл,с удивлением для меня был перенаправлен на 1хбет,это что сработала партнерская программа с этим букмекером?	153	153
736	Мой фактический адрес проживания отличается от прописки в паспорте. Какой мне адрес указывать	154	154
737	Помогите решить проблему, на ФобетКлиент (Программа для Windows) постоянное подключение на сервер.	154	154
738	По правилам необходимо именно зарегистрироваться, т.е вход через соц сети не считается регистрацией?	155	155
739	Добрый день, хочу уточнить если я положил на счет например 3 тыс рублей, 1 тыс проиграл, могу ли я вывести эти деньги обратно? Фонбет	156	156
740	Какие документы потребуются для прохождения верификации в платежной системе Skrill? Можно ли отослать цифровые фото документов вместо сканированных копий?	157	157
118	Как узнать на кого я подписан?	19	19
275	Обязательно привязывать карту банка?	53	53
467	Удалите спам	73	73
622	Когда будет материал о ставках	99	99
623	Когда будет обещаный конкурс	99	99
624	подскажите пожалуйста планируются какие нибудь конкурсы на сайте?))	99	99
625	нужны рекомендаций советы стратегий-относительно команд(ы) (включая саму игру) имеет ли значение опыт - из чего исходить именно ???	99	99
626	Когда стартует анонсированный в новогоднем поздравлении конкурс на 1.5 млн рублей?	99	99
628	Какие букмекеры используют русский язык?	100	100
742	Добрый день. Закидывал день с помощью MasterCard, списали со счета почти 3 бакса за верификацию. Их вообще вернут обратно? Конечно я лопух, ведь вывести деньги можно только на Visa и банковский счет.	159	159
743	не могу зайди на сайт 1xbet хочу снять деньги , захожу на сайт 1xставка ввожу свои данные пишут не правильные что делать ?	160	160
744	Какую максимальную ставку я могу сделать на тот или иной исход (событие)?	161	161
745	обьясните пожалуйста. Бк дает кф на точный счет+исход "другое". Что это значит?	162	162
746	Как можно положить деньги на Skrill?	163	163
747	Зарегистрировал 3 аккаунта на одну карту в БК Winline! Все заблокировали!	164	164
748	Что такое биржа ставок и чем она отличается?	165	165
749	Какие есть биржи ставок, что посоветуете?	165	165
750	Как дела?	166	166
751	привет как дела	166	166
752	ты кто такой	166	166
753	как настроение?	166	166
754	как ты?	166	166
755	ах ты пидор	167	167
756	мудила ебаная	167	167
757	пидорас обоссаный 	167	167
758	блядь ебись ты	167	167
759	иди нахуй	167	167
760	сука блядь	167	167
761	застрелите ваших программистов	167	167
762	РБ мошенники и уроды	167	167
763	скоты продажные, чтоб вы сдохли	167	167
\.


--
-- Data for Name: faq_rating; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.faq_rating (id, name, vote_score) FROM stdin;
\.


--
-- Data for Name: faq_s7answer; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.faq_s7answer (id, answer) FROM stdin;
\.


--
-- Data for Name: faq_s7data; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.faq_s7data (id, question, answer) FROM stdin;
\.


--
-- Data for Name: faq_s7question; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.faq_s7question (id, question, answer_label, answer_id_id) FROM stdin;
\.


--
-- Data for Name: faq_statistic; Type: TABLE DATA; Schema: public; Owner: app
--

COPY public.faq_statistic (id, created_at, question, answer, right_answer, user_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3609, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: faq_answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.faq_answer_id_seq', 763, true);


--
-- Name: faq_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.faq_question_id_seq', 764, true);


--
-- Name: faq_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.faq_rating_id_seq', 1, false);


--
-- Name: faq_s7answer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.faq_s7answer_id_seq', 1, false);


--
-- Name: faq_s7data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.faq_s7data_id_seq', 1, false);


--
-- Name: faq_s7question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.faq_s7question_id_seq', 1, false);


--
-- Name: faq_statistic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: app
--

SELECT pg_catalog.setval('public.faq_statistic_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: faq_answer faq_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_answer
    ADD CONSTRAINT faq_answer_pkey PRIMARY KEY (id);


--
-- Name: faq_question faq_question_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_question
    ADD CONSTRAINT faq_question_pkey PRIMARY KEY (id);


--
-- Name: faq_rating faq_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_rating
    ADD CONSTRAINT faq_rating_pkey PRIMARY KEY (id);


--
-- Name: faq_s7answer faq_s7answer_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_s7answer
    ADD CONSTRAINT faq_s7answer_pkey PRIMARY KEY (id);


--
-- Name: faq_s7data faq_s7data_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_s7data
    ADD CONSTRAINT faq_s7data_pkey PRIMARY KEY (id);


--
-- Name: faq_s7question faq_s7question_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_s7question
    ADD CONSTRAINT faq_s7question_pkey PRIMARY KEY (id);


--
-- Name: faq_statistic faq_statistic_pkey; Type: CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_statistic
    ADD CONSTRAINT faq_statistic_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: faq_question_answer_id_id_d958b1c2; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX faq_question_answer_id_id_d958b1c2 ON public.faq_question USING btree (answer_id_id);


--
-- Name: faq_s7question_answer_id_id_f352c6d5; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX faq_s7question_answer_id_id_f352c6d5 ON public.faq_s7question USING btree (answer_id_id);


--
-- Name: faq_statistic_user_id_68960ce6; Type: INDEX; Schema: public; Owner: app
--

CREATE INDEX faq_statistic_user_id_68960ce6 ON public.faq_statistic USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: faq_question faq_question_answer_id_id_d958b1c2_fk_faq_answer_id; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_question
    ADD CONSTRAINT faq_question_answer_id_id_d958b1c2_fk_faq_answer_id FOREIGN KEY (answer_id_id) REFERENCES public.faq_answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: faq_s7question faq_s7question_answer_id_id_f352c6d5_fk_faq_s7answer_id; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_s7question
    ADD CONSTRAINT faq_s7question_answer_id_id_f352c6d5_fk_faq_s7answer_id FOREIGN KEY (answer_id_id) REFERENCES public.faq_s7answer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: faq_statistic faq_statistic_user_id_68960ce6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: app
--

ALTER TABLE ONLY public.faq_statistic
    ADD CONSTRAINT faq_statistic_user_id_68960ce6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

