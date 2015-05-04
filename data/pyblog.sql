--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: blog_comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_comment (
    id integer NOT NULL,
    author character varying(60) NOT NULL,
    body text NOT NULL,
    post_id integer NOT NULL,
    created timestamp with time zone NOT NULL
);


ALTER TABLE public.blog_comment OWNER TO postgres;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_comment_id_seq OWNER TO postgres;

--
-- Name: blog_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_comment_id_seq OWNED BY blog_comment.id;


--
-- Name: blog_post; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_post (
    id integer NOT NULL,
    title character varying(60) NOT NULL,
    body text NOT NULL,
    created timestamp with time zone NOT NULL,
    alias character varying(60),
    image character varying(100),
    show boolean NOT NULL,
    main smallint NOT NULL,
    CONSTRAINT blog_post_main_70ca1f1e_check CHECK ((main >= 0))
);


ALTER TABLE public.blog_post OWNER TO postgres;

--
-- Name: blog_post_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_post_id_seq OWNER TO postgres;

--
-- Name: blog_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_post_id_seq OWNED BY blog_post.id;


--
-- Name: blog_post_tags; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_post_tags (
    id integer NOT NULL,
    post_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.blog_post_tags OWNER TO postgres;

--
-- Name: blog_post_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_post_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_post_tags_id_seq OWNER TO postgres;

--
-- Name: blog_post_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_post_tags_id_seq OWNED BY blog_post_tags.id;


--
-- Name: blog_tag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE blog_tag (
    id integer NOT NULL,
    title character varying(60) NOT NULL,
    alias character varying(60),
    count integer NOT NULL
);


ALTER TABLE public.blog_tag OWNER TO postgres;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE blog_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blog_tag_id_seq OWNER TO postgres;

--
-- Name: blog_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE blog_tag_id_seq OWNED BY blog_tag.id;


--
-- Name: captcha_captchastore; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE captcha_captchastore (
    id integer NOT NULL,
    challenge character varying(32) NOT NULL,
    response character varying(32) NOT NULL,
    hashkey character varying(40) NOT NULL,
    expiration timestamp with time zone NOT NULL
);


ALTER TABLE public.captcha_captchastore OWNER TO postgres;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE captcha_captchastore_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.captcha_captchastore_id_seq OWNER TO postgres;

--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE captcha_captchastore_id_seq OWNED BY captcha_captchastore.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE guardian_groupobjectpermission (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.guardian_groupobjectpermission OWNER TO postgres;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE guardian_groupobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guardian_groupobjectpermission_id_seq OWNER TO postgres;

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE guardian_groupobjectpermission_id_seq OWNED BY guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE guardian_userobjectpermission (
    id integer NOT NULL,
    permission_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.guardian_userobjectpermission OWNER TO postgres;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE guardian_userobjectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guardian_userobjectpermission_id_seq OWNER TO postgres;

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE guardian_userobjectpermission_id_seq OWNED BY guardian_userobjectpermission.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_comment ALTER COLUMN id SET DEFAULT nextval('blog_comment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post ALTER COLUMN id SET DEFAULT nextval('blog_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_tags ALTER COLUMN id SET DEFAULT nextval('blog_post_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_tag ALTER COLUMN id SET DEFAULT nextval('blog_tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY captcha_captchastore ALTER COLUMN id SET DEFAULT nextval('captcha_captchastore_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('guardian_userobjectpermission_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add captcha store	7	add_captchastore
20	Can change captcha store	7	change_captchastore
21	Can delete captcha store	7	delete_captchastore
22	Can add user object permission	8	add_userobjectpermission
23	Can change user object permission	8	change_userobjectpermission
24	Can delete user object permission	8	delete_userobjectpermission
25	Can add group object permission	9	add_groupobjectpermission
26	Can change group object permission	9	change_groupobjectpermission
27	Can delete group object permission	9	delete_groupobjectpermission
28	Can add tag	10	add_tag
29	Can change tag	10	change_tag
30	Can delete tag	10	delete_tag
31	Can add post	11	add_post
32	Can change post	11	change_post
33	Can delete post	11	delete_post
34	Can add comment	12	add_comment
35	Can change comment	12	change_comment
36	Can delete comment	12	delete_comment
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 36, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
-1		2015-05-04 04:19:16.82669+03	f	AnonymousUser				f	t	2015-05-04 04:19:16.826773+03
1	pbkdf2_sha256$15000$JU0GdRIRmhIc$aWjfrSZpv0JUNU7B733hEkKsgIefUyf2TLKNdBUwn9g=	2015-05-04 04:21:26.237363+03	t	cheva	Dmitry	Cheva	dmitry.cheva@gmail.com	t	t	2015-05-04 04:21:09.26449+03
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: blog_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_comment (id, author, body, post_id, created) FROM stdin;
1	cheva	cillum dolore eu fugiat nulla pariatur	1	2014-12-20 20:15:00.256381+02
2	buba	Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n	1	2014-12-21 01:16:22.822994+02
3	(≧◡≦) cheva 2014	Jinja!!!	3	2014-12-21 01:56:25.613234+02
20	qwe	qwe	14	2014-12-21 17:43:21.993231+02
21	(≧◡≦) cheva 2014	(≧◡≦) (≧◡≦)(≧◡≦)(≧◡≦)(≧◡≦)(≧◡≦)(≧◡≦)	14	2014-12-21 17:51:04.612556+02
22	(≧◡≦) cheva 2014 ツ powered by Django	buba\r\n2014-12-20 23:12\r\nExcepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	14	2014-12-21 17:51:45.354134+02
23	Aenean a ipsum	 at dui malesuada, id tempus urna ultricies. Aliquam et consectetur dui. Ut fringilla tortor mattis sollicitudin iaculis. Aenean a ipsum eget nisl volutpat rhoncus. Vestibulum quis neque sit amet nulla mattis egestas. Phasellus eu orci mi. Aenean sagittis ligula sit	6	2014-12-21 22:38:00.820206+02
24	123	123	16	2014-12-21 22:43:16.997265+02
25	Системный администратор 	\r\nСистемный администратор поделился(лась) фотография Александры Решмедиловой.	14	2014-12-21 23:08:51.537112+02
26	(≧◡≦) cheva	ツ powered by Django	2	2014-12-22 10:30:49.529089+02
27	(≧◡≦) cheva 2014	Etiam aliquet porttitor diam. Nullam placerat semper sapien in condimentum. Etiam blandit arcu et aliquam laoreet. Donec ante nisl, tristique sit amet mi sit amet, hendrerit iaculis nunc. Fusce posuere odio et dui mattis molestie. Proin dictum iaculis sapien eu interdum.\r\nEtiam aliquet porttitor diam. Nullam placerat semper sapien in condimentum. Etiam blandit arcu et aliquam laoreet. Donec ante nisl, tristique sit amet mi sit amet, hendrerit iaculis nunc. Fusce posuere odio et dui mattis molestie. Proin dictum iaculis sapien eu interdum.	8	2014-12-25 01:51:51.951093+02
28	(≧◡≦) cheva 2014	Etiam aliquet porttitor diam. Nullam placerat semper sapien in condimentum. Etiam blandit arcu et aliquam laoreet. Donec ante nisl, tristique sit amet mi sit amet, hendrerit iaculis nunc. Fusce posuere odio et dui mattis molestie. Proin dictum iaculis sapien eu interdum.\r\nEtiam aliquet porttitor diam. Nullam placerat semper sapien in condimentum. Etiam blandit arcu et aliquam laoreet. Donec ante nisl, tristique sit amet mi sit amet, hendrerit iaculis nunc. Fusce posuere odio et dui mattis molestie. Proin dictum iaculis sapien eu interdum.	8	2014-12-25 01:54:13.965758+02
29	qwerty	Leave a Comment:\r\nAuthor:\t\r\nBody:\t\r\nCaptcha:	6	2014-12-30 03:24:38.039177+02
30	dcheva	Blog Widget Well\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.\r\n	16	2014-12-30 10:31:40.019109+02
31	тыдыщ	пыщ!	17	2015-01-24 01:50:44.776838+02
\.


--
-- Name: blog_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_comment_id_seq', 31, true);


--
-- Data for Name: blog_post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_post (id, title, body, created, alias, image, show, main) FROM stdin;
3	Nullam velit lorem	Nullam velit lorem, feugiat pulvinar fringilla id, accumsan vel purus. Mauris a congue nulla, malesuada tempus turpis. Donec id dictum libero. Fusce bibendum, nunc id hendrerit suscipit, ligula massa ullamcorper ante, vitae aliquam justo urna a diam. Praesent sem velit, porttitor vitae euismod sit amet, malesuada vel odio. Nullam fringilla dapibus nunc, ac pulvinar justo maximus rhoncus. Proin id tortor semper, viverra justo accumsan, viverra nunc. Sed eu orci sed ante convallis aliquet. Phasellus accumsan, purus at euismod feugiat, augue lectus finibus orci, vel gravida neque erat hendrerit nibh. Nullam molestie urna quam, ut lacinia sapien maximus facilisis.\r\n	2014-12-21 01:18:35.690802+02	\N	\N	t	0
4	Nam lobortis feugiat odio	Nam lobortis feugiat odio, ac fringilla lacus pharetra ut. Praesent lobortis ligula nec egestas viverra. Morbi sit amet felis condimentum, maximus risus mollis, ornare sem. Integer porttitor metus eu blandit faucibus. Etiam semper vitae erat in porta. Aliquam erat volutpat. In ac justo id enim hendrerit sodales. Nam enim nunc, rhoncus quis arcu ut, consequat tempor diam.\r\n	2014-12-21 01:18:59.642344+02	\N	\N	t	0
8	Integer vitae porta dui	Integer vitae porta dui. Cras posuere nibh vel blandit tincidunt. Phasellus neque odio, lobortis id mi at, ultrices malesuada justo. Maecenas id congue ipsum. Nam semper lacus tortor, quis pellentesque libero laoreet nec. Fusce sagittis id risus in vestibulum. Etiam aliquet porttitor diam. Nullam placerat semper sapien in condimentum. Etiam blandit arcu et aliquam laoreet. Donec ante nisl, tristique sit amet mi sit amet, hendrerit iaculis nunc. Fusce posuere odio et dui mattis molestie. Proin dictum iaculis sapien eu interdum.\r\n	2014-12-21 01:20:31.555297+02	\N	\N	t	0
1	Lorem ipsum	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.	2014-12-20 20:14:40.01073+02			t	0
13	Философия	Зачем мы используем функцию get_object_or_404() вместо того, чтобы автоматически перехватывать исключения ObjectDoesNotExist уровнем выше, или вызывать на уровне API моделей исключение Http404 вместо ObjectDoesNotExist?\r\n\r\nПотому что это связывает уровень моделей с уровнем представления. Один из главных принципов проектирования Django – слабая связанность. Некоторая связанная функциональность находится в модуле django.shortcuts.	2014-12-21 08:56:47.224669+02	\N	\N	t	0
14	Система шаблонов	Система шаблонов использует точку для доступа к атрибутам переменной. Например, для {{ question.question_text }} Django сначала пытается обратиться к question как к словарю. При неудаче ищется атрибут переменной, в данном случае он и используется. Если атрибут не найден, будет искаться индекс в списке.	2014-12-21 08:57:06.2076+02	\N	\N	t	0
7	vel rutrum felis erat nec ex	Vivamus tortor orci, rutrum a congue quis, ultricies at elit. Mauris eleifend consectetur metus, ut lacinia ante venenatis eget. Nam pulvinar erat urna, at bibendum felis lobortis non. Nulla vestibulum finibus dignissim. Curabitur ac malesuada libero. Donec sagittis urna porta arcu tristique, at porta nibh ullamcorper. Sed vitae viverra augue. Integer vitae pretium mi, quis lacinia elit. Phasellus vitae nisl condimentum, sodales neque nec, ornare magna. Nam id ipsum libero. Nulla nec ligula scelerisque augue maximus euismod. Phasellus id ligula fringilla, lobortis quam consectetur, luctus eros. Ut tincidunt, elit id eleifend posuere, nisi quam tempus ipsum, et molestie risus lorem quis mauris. Integer fermentum, lorem id imperdiet aliquam, mauris quam fermentum ex, vel rutrum felis erat nec ex.\r\n	2014-12-21 01:20:12.885646+02			t	14
9	Maecenas mollis vel erat finibus placerat. Pellentesque elei	Maecenas mollis vel erat finibus placerat. Pellentesque eleifend tempor odio et auctor. Nam efficitur nulla nec velit facilisis, vel ultrices nunc vulputate. Vestibulum sed justo pellentesque, porta neque in, vehicula lacus. Sed faucibus bibendum velit. Proin a risus erat. Etiam nec eros quis eros eleifend pellentesque ultrices vitae tortor. Suspendisse ornare dapibus enim eget tincidunt. Phasellus pellentesque risus elementum libero gravida lacinia. Etiam augue ligula, viverra id placerat ac, hendrerit et nisl. Vestibulum sodales lobortis odio sed lobortis. Vivamus tortor quam, laoreet nec luctus quis, semper a nulla. Duis a tempor erat. Nam molestie leo dui.\r\n	2014-12-21 01:20:51.137725+02			t	16
12	Add post	Django administration\r\nWelcome, Dmitry. Change password / Log out\r\nHome › Blog › Posts › Add post\r\nAdd post\r\nTitle:\r\nBody:	2014-12-21 08:43:28.24362+02			t	0
11	Згенеровано 11 абзаців, 977 слів, 6720 байт тексту Lorem	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eget libero porttitor, tristique metus at, blandit turpis. Etiam facilisis sapien interdum arcu lobortis, vel fermentum dui consequat. Nullam volutpat quam vitae enim eleifend eleifend. Nulla sed tellus in velit finibus molestie. Aliquam malesuada nisl nulla, sit amet vehicula nisi viverra sit amet. Mauris fermentum tellus ut libero molestie dictum. Curabitur vel diam eu dolor consectetur accumsan non id neque. Mauris gravida felis id risus ornare commodo. Maecenas a nunc condimentum, fermentum lorem ac, mollis magna. Nullam at lacinia velit, vel posuere ipsum. Phasellus elementum neque justo, sit amet scelerisque risus semper mollis. Nulla id lacus ac dui ultrices pellentesque. Praesent mollis viverra scelerisque. Nulla velit ipsum, scelerisque in nisl sed, sodales interdum mauris. Phasellus turpis odio, volutpat vel condimentum vitae, pretium varius ligula.\r\n\r\nSuspendisse potenti. Mauris quis dolor nunc. Vivamus consectetur sit amet velit eget blandit. Cras hendrerit lacinia mi, sit amet eleifend risus egestas eget. Duis blandit diam vitae odio sollicitudin vehicula. In vitae lectus turpis. Cras vitae ornare mauris, sed congue tortor. Suspendisse sodales interdum tellus, sit amet pharetra arcu convallis non. Praesent aliquam ex mattis sem fermentum laoreet. Nunc porta imperdiet ullamcorper. Vestibulum at finibus libero, sit amet varius nisl. Aenean quis magna facilisis, porta mauris vitae, molestie neque.\r\n\r\nDonec bibendum sem ac tempor faucibus. Praesent sagittis tempor lectus. Mauris eu hendrerit nunc. Curabitur in nulla erat. Proin congue id enim a interdum. Fusce porta placerat odio, in consectetur enim iaculis ultrices. Vestibulum et orci ac lorem maximus ultrices ut in nibh. Sed id laoreet felis. Ut maximus orci in ligula lobortis accumsan. Curabitur nec odio eget nunc facilisis vulputate id sed turpis. Morbi vitae arcu vel ligula faucibus bibendum non mollis nunc. Cras dictum augue quis varius pharetra. Mauris non leo et ipsum finibus porttitor et sit amet ante.\r\n\r\nPellentesque viverra augue eget nisl auctor bibendum. Donec id facilisis justo, ut euismod ex. Pellentesque ut laoreet neque. Donec sed purus porta, accumsan orci quis, ullamcorper tortor. Proin commodo pretium turpis, ac eleifend velit auctor ac. Pellentesque vehicula purus commodo felis semper euismod. Aenean mollis volutpat arcu, sit amet tincidunt lacus ultricies et. Aenean orci ligula, volutpat vel lacinia id, posuere sed augue. Curabitur ullamcorper ante vitae nulla hendrerit pharetra.\r\n\r\nVestibulum eu velit mattis, consequat diam quis, viverra ex. Nulla ut est a eros efficitur efficitur at vitae sapien. Integer eu commodo urna. Nunc ipsum justo, sagittis eget tortor id, convallis lobortis tortor. Suspendisse accumsan mi sed eros tristique porta. Vestibulum at finibus nunc. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nulla finibus consequat enim, a maximus ipsum semper consequat. Etiam non vehicula elit. Curabitur porttitor porttitor enim, id fringilla dui imperdiet vitae. Phasellus rhoncus nibh velit, sed feugiat quam vestibulum ac. Cras eget lorem vulputate, efficitur eros ac, pharetra massa.\r\n\r\nQuisque fermentum sapien id ultricies egestas. Morbi feugiat aliquet ante, at fermentum lectus suscipit vel. Aliquam feugiat est orci, ut interdum mauris efficitur iaculis. Praesent sagittis lacus lacus, ut feugiat odio molestie a. Proin finibus velit vitae egestas aliquam. Nullam sit amet erat sem. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Morbi eu velit fringilla, posuere odio ut, lobortis enim. Curabitur lobortis porta elit, sit amet ultrices arcu scelerisque dictum. Phasellus ornare enim in ultrices tincidunt.\r\n\r\nNam aliquet bibendum nibh, sit amet auctor tellus. Mauris mattis orci ac nibh bibendum interdum. Sed in consequat erat. Phasellus eget augue elit. Integer laoreet bibendum ultricies. Nam in massa a magna porta accumsan eget at enim. Curabitur sodales tellus a vestibulum ultrices.\r\n\r\nPraesent quam elit, commodo vitae mauris et, pharetra luctus massa. Praesent ac urna sed enim euismod efficitur. Aenean pellentesque malesuada urna. Etiam quis nibh dapibus, tempor nunc at, efficitur enim. Vivamus tristique nisl ut purus euismod posuere. Duis lobortis tempor aliquam. Etiam id orci dictum, varius eros sed, porttitor diam. Pellentesque quis fermentum nibh, et volutpat nulla. Aliquam erat volutpat. Mauris congue lectus nisl, non varius felis mollis sed. Mauris sed justo nulla. Pellentesque mauris dui, varius interdum laoreet sit amet, interdum volutpat enim. Phasellus vehicula sem a lorem consectetur, non auctor est consequat. Aenean vel massa pellentesque, vestibulum augue sit amet, rutrum eros.\r\n\r\nDonec fermentum metus sem, at sagittis eros maximus eget. Pellentesque rutrum, magna vitae consectetur facilisis, lacus orci blandit sem, venenatis sollicitudin magna ex sit amet massa. Curabitur ultrices justo in lorem ornare hendrerit. Mauris vel velit id quam ullamcorper sollicitudin vel at risus. Cras sem erat, viverra et malesuada sed, ultrices sed magna. Phasellus convallis justo felis, ut mollis enim cursus at. Curabitur semper imperdiet pretium. Integer scelerisque magna nec diam mattis, ac sodales odio tristique. Donec vitae tempor purus. Duis at ligula fringilla magna pellentesque iaculis.\r\n\r\nFusce nec ante eget ex tincidunt tincidunt. Mauris laoreet suscipit sapien, suscipit dapibus metus tincidunt eu. Sed viverra eros eu imperdiet lacinia. Nullam tortor dolor, rhoncus nec semper rhoncus, pharetra non neque. Phasellus ac mi consectetur augue condimentum pellentesque a vitae tellus. Duis blandit sagittis nulla, non pellentesque turpis. Nulla malesuada eget justo quis porttitor. Curabitur eu tincidunt ante. Morbi cursus enim porttitor magna luctus, sed porttitor orci elementum. Curabitur fringilla tellus libero, ut vulputate ex porta quis. Fusce faucibus varius ligula et egestas. Vestibulum ut neque vitae ex fermentum aliquet. Cras dictum mattis dapibus. Ut luctus, elit vitae maximus commodo, nibh enim ultrices nisl, eget aliquet felis nulla ut mi.\r\n\r\nProin et rutrum nulla. Morbi aliquet, dolor id tristique rhoncus, sem elit tempor augue, vestibulum dapibus turpis ex vel risus. Curabitur finibus nunc et nisi cursus imperdiet. Nullam at augue augue. Curabitur in sem quis ipsum tristique pellentesque. Donec malesuada eros pellentesque euismod pharetra. Ut in augue eleifend, tempor ligula a, semper elit. Quisque egestas ornare magna, non sollicitudin nunc fringilla id. Nam vel congue eros. Pellentesque id massa rutrum, scelerisque leo imperdiet, varius ante. Suspendisse mattis porttitor magna a luctus.	2014-12-21 01:21:55.970611+02			t	10
2	Що таке Lorem Ipsum?	Lorem Ipsum - це текст-"риба", що використовується в друкарстві та дизайні. Lorem Ipsum є, фактично, стандартною "рибою" аж з XVI сторіччя, коли невідомий друкар взяв шрифтову гранку та склав на ній підбірку зразків шрифтів. "Риба" не тільки успішно пережила п'ять століть, але й прижилася в електронному верстуванні, залишаючись по суті незмінною. Вона популяризувалась в 60-их роках минулого сторіччя завдяки виданню зразків шрифтів Letraset, які містили уривки з Lorem Ipsum, і вдруге - нещодавно завдяки програмам комп'ютерного верстування на кшталт Aldus Pagemaker, які використовували різні версії Lorem Ipsum.	2014-12-21 01:17:54.099539+02		static/images/lorem.png	t	3
6	Pellentesque elementum	Pellentesque elementum, metus in laoreet dignissim, ante enim porttitor risus, vel auctor ipsum eros eu purus. Suspendisse tempor ex at dui malesuada, id tempus urna ultricies. Aliquam et consectetur dui. Ut fringilla tortor mattis sollicitudin iaculis. Aenean a ipsum eget nisl volutpat rhoncus. Vestibulum quis neque sit amet nulla mattis egestas. Phasellus eu orci mi. Aenean sagittis ligula sit amet velit aliquet convallis.	2014-12-21 01:19:54.954591+02		static/images/Pellentesque_elementum.jpg	t	6
5	Aliquam erat volutpat	Curabitur et eleifend ante, quis cursus erat. Aliquam erat volutpat. Aenean id vulputate ex. Integer luctus, nisl nec maximus viverra, felis augue pretium erat, id fringilla sapien tellus eu sem. In malesuada, ligula et porta accumsan, enim ligula gravida erat, quis interdum ante odio vel libero. Nullam dignissim metus sollicitudin dui scelerisque, nec malesuada risus maximus. Curabitur at urna vel tortor aliquam mattis. Praesent sit amet gravida mauris, a vulputate nunc.\r\n\r\nDonec vitae ex nunc. Vestibulum faucibus posuere tortor eget semper. Donec euismod lorem turpis, ac dignissim justo egestas ut. Vivamus tempus dignissim neque et mollis. Nullam et lectus mollis, tincidunt leo ut, sodales nibh. Sed a purus sit amet enim accumsan convallis sed ac dui. In nisi purus, ornare sed erat eget, dapibus luctus lectus. Etiam gravida eros egestas, tempus lectus id, porta nisl. Duis est mauris, condimentum non felis quis, vehicula pellentesque nisi. Quisque sit amet auctor turpis. Proin vel sem mauris. Curabitur fermentum vitae ex a commodo.\r\n\r\nCurabitur sodales erat ligula, non lacinia nisl interdum feugiat. Donec vitae volutpat massa, a luctus odio. Nam ut mi ornare, feugiat velit eu, tempor sem. In eget varius nisl, a tempor lacus. Vestibulum consectetur porta sollicitudin. Pellentesque eget felis tincidunt, posuere libero vitae, fermentum ex. Maecenas luctus magna at convallis tincidunt. Proin vel dui vestibulum, viverra quam quis, vulputate velit. Suspendisse nunc lacus, fringilla quis elit finibus, euismod accumsan ante. Interdum et malesuada fames ac ante ipsum primis in faucibus. Aliquam congue lacus sagittis tellus faucibus posuere. Quisque consequat sed diam nec commodo. Sed faucibus porta neque, et laoreet urna vehicula ac. Aliquam erat volutpat.	2014-12-21 01:19:32.083516+02			t	12
15	Ссылка ведет на страницу опроса	Этот код загружает шаблон polls/index.html и передает ему контекст. Контекст - это словарь, содержащий название переменных шаблона и соответствующие им значения.\r\n\r\nЗагрузите страницу в браузере по адресу “/polls/”, вы должны увидеть список с опросом “What’s up” из Части 1. Ссылка ведет на страницу опроса.	2014-12-21 17:49:59.084998+02		static/images/Что_бы_вы_хотели_видеть_рус.jpg	t	8
16	Вызов 404 исключения¶	Теперь создадим страницу опроса, которая отображает вопрос и варианты ответа. Вот так будет выглядеть наше представление:\r\n\r\npolls/views.py\r\nfrom django.http import Http404\r\nfrom django.shortcuts import render\r\n\r\nfrom polls.models import Question\r\n# ...\r\ndef detail(request, question_id):\r\n    try:\r\n        question = Question.objects.get(pk=question_id)\r\n    except Question.DoesNotExist:\r\n        raise Http404\r\n    return render(request, 'polls/detail.html', {'question': question})\r\nПредставление вызывает исключение Http404, если вопрос с указанным ID не существует.\r\n\r\nСодержимое шаблона polls/detail.html обсудим позже, но если хотите прям вот сразу, чтобы все заработало, вот его содержимое:\r\n\r\npolls/templates/polls/detail.html\r\n{{ question }}\r\nчтобы можно было загрузить страницу.	2014-12-21 17:50:17.543434+02	call_404_error	static/images/404.png	t	4
18	Вселенная – голограмма! Это означает, что нас нет!	Появляется все больше свидетельств того, что некоторые части Вселенной могут быть особенными.\r\nОдним из краеугольных камней современной астрофизики является космологический принцип.Согласно нему, наблюдатели на Земле видят то же самое, что наблюдатели из любой другой точки Вселенной, и что законы физики везде одинаковы.\r\nМножество наблюдений подтверждают эту идею. К примеру, Вселенная выглядит более-менее одинаково во всех направлениях, с примерно одинаковым распределением галактик по всем сторонам.\r\n<br />\r\nНо в последние годы, некоторые космологи стали сомневаться в верности этого принципа.\r\n<br />\r\nОни указывают на данные, полученные в ходе изучения сверхновых 1 типа, которые удаляются от нас со все увеличивающейся скоростью, что указывает не только на то, что Вселенная расширяется, но и на все большее ускорение этого расширения.\r\n<br />\r\nЛюбопытно, что ускорение не является единым для всех направлений. В некоторых направлениях Вселенная ускоряется быстрее, чем в других.\r\n<h3>Вселенная – голограмма.</h3>\r\n<br />\r\nНо насколько можно доверять этим данным? Возможно, что в некоторых направлениях мы наблюдаем статистическую погрешность, которая исчезнет при правильном анализе полученных данных.\r\n<br />\r\nРонг-Джен Кай и Жонг-Лианг Туо из института теоретической физики при Китайской академии наук в Пекине, еще раз проверили данные полученные от 557 сверхновых из всех частей Вселенной и провели повторные расчеты.\r\n<br />\r\nСегодня они подтвердили наличие неоднородности. Согласно их расчетам, быстрей всего ускорение происходит в созвездии Лисички северного полушария. Эти данные согласуются с данными других исследований, согласно которым существует неоднородность в космическом микроволновом фоновом излучении.\r\n<br />\r\nЭто может заставить космологов прийти к смелому выводу: космологический принцип ошибочен.\r\n<br />\r\nВозникает волнующий вопрос: почему Вселенная неоднородна и как это отразится на существующих моделях космоса?\r\n<br /><br />\r\n<a href="http://golbis.com/pin/nauchnyiy-mir-stoit-na-poroge-grandioznogo-otkryitiya-nas-ne-sushhestvuet-golbis/" target="_blank">Полный текст <span class="glyphicon glyphicon-chevron-right"></span></a>	2015-01-30 12:50:06.667199+02	we-are-hologram-nas-ne-sushhestvuet	static/images/catseye_composite_big.jpg	t	2
17	Коловрат или Солнцеворот	<p>\r\nКоловрат или Солнцеворот - один из древнейших древнерусских символов, олицетворяющий Солнце и солнечных богов Сварога, Даждьбога и Хорса. От слова "коло" - солнце и произошло название символа. Сам символ выглядит как круг с загнутыми лучами. Этот выбор был продиктован многовековым поклонением людей Солнцу, причем подобная традиция встречается практически у каждого народа. Также стоит отметить, что германские и Славянские племена первоначально являлись одним индоевропейским народом.\r\n<p>\r\n<img class="img-responsive" src="/static/images/kolovrat.jpg" alt="Коловрат" style="float:left;max-width:220px;margin-right:10px;">\r\nЖизнь наших предков подчинялась исключительно солнечному круговороту - все праздники и важные события были связаны с солнцем. Считалось, что именно солнце играет самую важную роль в мироздании, оно - средоточие силы, жизни, кипучей энергии и плодородия. Потому-то самым распространенным символом, использовавшимся в различных ювелирных изделиях и украшавших одежду Русичей, был Коловрат, считавшийся мужским символом. Его вышивали на стягах и кружевах, вырезали на дереве и металле, его использовали в древних Ведических обрядах.\r\n<p>\r\nПосле кровавого Крещения Руси этот символ был запрещен, равно как и другие древнерусские атрибуты веры. А между тем Коловрат олицетворяет собой не что иное, как Ярило-солнце, без которого невозможна сама жизнь на Земле. Не зря этот символ, вышитый на воинских знаменах повергал в ужас вражеские племена и обращал их в бегство. Никто и ничто не могло противостоять силе древнерусских воинов под знаком Солнцеворота.\r\n<p>\r\nНедавно астрологи смогли полностью объяснить, наконец, значение Коловрата. Если рассмотреть на звездной карте расположение созвездий Большой и Малой медведицы в 00.00 ч/мин 22 декабря и 22 июня, а также 21 марта и 23 сентября (это время зимнего и летнего солнцестояния, и время весеннего и осеннего равноденствия). Если провести воображаемую линию от этих созвездий к полярной звезде, то получатся элементы Коловрата. А если соединить на одной картинке положения созвездий 22 декабря, 22 июня, 21 марта и 23 сентября, перед вами появится не что иное как изображение Коловрата. Вероятно, наши предки первоначально использовали Коловрат для определения местонахождения по звездам.	2014-12-29 14:59:50.826113+02	kolovrat	static/images/Milky_Way_galaxy_banner.jpg	t	1
\.


--
-- Name: blog_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_post_id_seq', 18, true);


--
-- Data for Name: blog_post_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_post_tags (id, post_id, tag_id) FROM stdin;
12	1	2
29	5	4
30	7	4
31	9	4
32	16	3
33	2	2
34	6	4
35	15	4
36	12	4
38	11	4
47	18	2
56	17	2
57	17	3
\.


--
-- Name: blog_post_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_post_tags_id_seq', 57, true);


--
-- Data for Name: blog_tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY blog_tag (id, title, alias, count) FROM stdin;
2	информация	info	2
3	истории	stories	1
4	Lorem	lorem	0
\.


--
-- Name: blog_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('blog_tag_id_seq', 4, true);


--
-- Data for Name: captcha_captchastore; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY captcha_captchastore (id, challenge, response, hashkey, expiration) FROM stdin;
1568	RTUI	rtui	cd7f5aad9891255cf4200948ff5442fe88130a6d	2015-05-04 04:26:35.980498+03
1565	VFFE	vffe	a5ab1ae83e1318ac75fbe02e7169ba5ee0fc58c2	2015-05-04 04:25:20.802239+03
1569	DXRI	dxri	49c62f274cbd2f19f57e80e4a0f10ae69fae3d21	2015-05-04 04:28:44.555111+03
1570	PKOS	pkos	87b4b6e5cbbdb820fa7d85e33a240a755473a878	2015-05-04 04:32:01.160919+03
1567	BADE	bade	64af8477884cc44729d5e01080cf9d0270617e89	2015-05-04 04:26:09.591295+03
\.


--
-- Name: captcha_captchastore_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('captcha_captchastore_id_seq', 1570, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 1, false);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	captcha store	captcha	captchastore
8	user object permission	guardian	userobjectpermission
9	group object permission	guardian	groupobjectpermission
10	tag	blog	tag
11	post	blog	post
12	comment	blog	comment
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 12, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_migrations (id, app, name, applied) FROM stdin;
4	sessions	0001_initial	2014-12-20 12:38:21.516778+02
5	captcha	0001_initial	2014-12-21 04:44:53.494641+02
6	blog	0001_initial	2014-12-21 04:48:09.049589+02
7	blog	0002_auto_20141221_0708	2014-12-21 07:08:17.68876+02
8	blog	0003_auto_20150123_1633	2015-01-23 16:33:24.409072+02
9	blog	0004_auto_20150123_1705	2015-01-23 17:05:37.123661+02
10	blog	0005_auto_20150123_1713	2015-01-23 17:13:28.363005+02
11	blog	0006_auto_20150123_1724	2015-01-23 17:24:21.703235+02
12	blog	0007_auto_20150123_1726	2015-01-23 17:26:35.185338+02
13	blog	0008_auto_20150123_1729	2015-01-23 17:29:09.33916+02
14	blog	0009_auto_20150123_1851	2015-01-23 18:51:50.225066+02
15	blog	0010_auto_20150123_1943	2015-01-23 19:43:05.943952+02
16	contenttypes	0002_remove_content_type_name	2015-05-03 22:50:38.079844+03
17	auth	0002_alter_permission_name_max_length	2015-05-03 22:50:38.127515+03
18	auth	0003_alter_user_email_max_length	2015-05-03 22:50:38.186097+03
19	auth	0004_alter_user_username_opts	2015-05-03 22:50:38.209753+03
20	auth	0005_alter_user_last_login_null	2015-05-03 22:50:38.244421+03
21	auth	0006_require_contenttypes_0002	2015-05-03 22:50:38.252705+03
22	contenttypes	0001_initial	2015-05-04 04:19:15.68191+03
23	auth	0001_initial	2015-05-04 04:19:16.490304+03
24	admin	0001_initial	2015-05-04 04:19:16.683031+03
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_migrations_id_seq', 24, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
imat7okx1ayno3ss9u7v6nhn0hmqtsvk	YmU0NGFlOTFjNTg5MGE0ODI2YzNiNWExN2YyYWI0NTc3NTM3YTg2Mzp7fQ==	2015-02-07 01:19:28.81648+02
ynpq1v1aglc9heb57ofg466q0knp8tht	ZjE2MTFmMTQ0ZGM4ZDg4Nzc5MmJkMzNiY2QwNTQ4YTIzNmY2YTZlNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjhiOWQ5ZjRjZWNlMjNlMDgyYjBlYzg5NGU3MjA2ZGVlOTYyZGM5ZWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-01-05 12:42:28.220665+02
60mzg093ewesrj2anhni5vc9e0p5k9wn	ZjE2MTFmMTQ0ZGM4ZDg4Nzc5MmJkMzNiY2QwNTQ4YTIzNmY2YTZlNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjhiOWQ5ZjRjZWNlMjNlMDgyYjBlYzg5NGU3MjA2ZGVlOTYyZGM5ZWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-01-07 10:56:14.770471+02
7q9j5p7bzi84ve5hn6h49pco7j8wlax1	YmU0NGFlOTFjNTg5MGE0ODI2YzNiNWExN2YyYWI0NTc3NTM3YTg2Mzp7fQ==	2015-01-12 08:37:52.81482+02
wwn4noe1e3p1t0cidylnp4oi63a5kpjw	ZjE2MTFmMTQ0ZGM4ZDg4Nzc5MmJkMzNiY2QwNTQ4YTIzNmY2YTZlNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjhiOWQ5ZjRjZWNlMjNlMDgyYjBlYzg5NGU3MjA2ZGVlOTYyZGM5ZWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-01-11 23:36:26.491767+02
8g1h05p8fcxh99cbven7fxpyfkif488q	ZjE2MTFmMTQ0ZGM4ZDg4Nzc5MmJkMzNiY2QwNTQ4YTIzNmY2YTZlNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjhiOWQ5ZjRjZWNlMjNlMDgyYjBlYzg5NGU3MjA2ZGVlOTYyZGM5ZWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-04-17 18:00:30.052012+03
fza1v9eaei0jicpyojndz5k05fpaahu4	OTIzMjBlZjI3Mjk2YTA2N2U2OTczNzQ4NTY1NWNhMDkxZmU4ZWQ0NTp7Il9hdXRoX3VzZXJfaGFzaCI6IjI2MTI4YThhMDJjMDNiMmFlZWVkZDI3NWI2MjIwYTQzZmQ3ODZjNTMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-05-18 04:21:26.246596+03
li8jkt10w8hycoonx1keq9w60w1gspm4	YmU0NGFlOTFjNTg5MGE0ODI2YzNiNWExN2YyYWI0NTc3NTM3YTg2Mzp7fQ==	2015-01-12 03:12:13.245131+02
flwbzhyjqpifvuzp8hytb6go2q1etp3h	YmU0NGFlOTFjNTg5MGE0ODI2YzNiNWExN2YyYWI0NTc3NTM3YTg2Mzp7fQ==	2015-01-12 03:13:27.544653+02
dtl3icsftybdrcz95pf6mvl9pbtgojc9	YmU0NGFlOTFjNTg5MGE0ODI2YzNiNWExN2YyYWI0NTc3NTM3YTg2Mzp7fQ==	2015-01-12 03:15:09.439674+02
je2803jo153pi5iaa3yazy4tyzc4b8v9	YmU0NGFlOTFjNTg5MGE0ODI2YzNiNWExN2YyYWI0NTc3NTM3YTg2Mzp7fQ==	2015-01-13 19:47:16.437093+02
462qek5lckxjxt9tshcvrnqhcoen1f37	NjZiODE4YzRkMGUxMGUxZjljNjk0MDE4MjdmNTQ3M2I0MTM3ODk5ODp7Il9hdXRoX3VzZXJfaGFzaCI6ImQwYzgyOWE3ZjhjOGVhMWZlNThjMzkzOGRlN2U1Y2FmNWVjODE1NzIiLCJfYXV0aF91c2VyX2lkIjoxMSwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==	2015-01-13 02:08:04.406435+02
ow4unp4eyqsylvpmi9zycwoytpu29gev	YmU0NGFlOTFjNTg5MGE0ODI2YzNiNWExN2YyYWI0NTc3NTM3YTg2Mzp7fQ==	2015-01-13 17:53:17.80562+02
bdpp5qtzdd4e499l6oo3xhu08cgeyubl	YmU0NGFlOTFjNTg5MGE0ODI2YzNiNWExN2YyYWI0NTc3NTM3YTg2Mzp7fQ==	2015-02-06 23:11:11.468213+02
dp7c3w3onrvsg3o4zuj4ucmdyj127f45	ZjE2MTFmMTQ0ZGM4ZDg4Nzc5MmJkMzNiY2QwNTQ4YTIzNmY2YTZlNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjhiOWQ5ZjRjZWNlMjNlMDgyYjBlYzg5NGU3MjA2ZGVlOTYyZGM5ZWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-02-07 11:26:23.165467+02
dlyhb9lr7nsx2rpqrz1bwlibhwbkp5vd	YmU0NGFlOTFjNTg5MGE0ODI2YzNiNWExN2YyYWI0NTc3NTM3YTg2Mzp7fQ==	2015-02-12 21:04:34.884267+02
h7ma5ofmdznvbqqav92kgbosznkhr354	ZjE2MTFmMTQ0ZGM4ZDg4Nzc5MmJkMzNiY2QwNTQ4YTIzNmY2YTZlNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjhiOWQ5ZjRjZWNlMjNlMDgyYjBlYzg5NGU3MjA2ZGVlOTYyZGM5ZWYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOjF9	2015-04-16 08:54:43.706667+03
\.


--
-- Data for Name: guardian_groupobjectpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY guardian_groupobjectpermission (id, permission_id, content_type_id, object_pk, group_id) FROM stdin;
\.


--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('guardian_groupobjectpermission_id_seq', 1, false);


--
-- Data for Name: guardian_userobjectpermission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY guardian_userobjectpermission (id, permission_id, content_type_id, object_pk, user_id) FROM stdin;
\.


--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('guardian_userobjectpermission_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: blog_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_comment
    ADD CONSTRAINT blog_comment_pkey PRIMARY KEY (id);


--
-- Name: blog_post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_post
    ADD CONSTRAINT blog_post_pkey PRIMARY KEY (id);


--
-- Name: blog_post_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_post_tags
    ADD CONSTRAINT blog_post_tags_pkey PRIMARY KEY (id);


--
-- Name: blog_post_tags_post_id_tag_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_post_tags
    ADD CONSTRAINT blog_post_tags_post_id_tag_id_key UNIQUE (post_id, tag_id);


--
-- Name: blog_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY blog_tag
    ADD CONSTRAINT blog_tag_pkey PRIMARY KEY (id);


--
-- Name: captcha_captchastore_hashkey_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_hashkey_key UNIQUE (hashkey);


--
-- Name: captcha_captchastore_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY captcha_captchastore
    ADD CONSTRAINT captcha_captchastore_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_3ec8c61c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_3ec8c61c_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: guardian_groupobjectpermissio_group_id_permission_id_object_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermissio_group_id_permission_id_object_key UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission_user_id_permission_id_object__key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_permission_id_object__key UNIQUE (user_id, permission_id, object_pk);


--
-- Name: auth_group_name_331666e8_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_331666e8_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_0e939a4f ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_8373b171 ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_417f1b1c ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_0e939a4f; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_0e939a4f ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_e8701ad4 ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_8373b171; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_8373b171 ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_e8701ad4 ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_94b8aae_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_94b8aae_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: blog_comment_post_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_comment_post_id ON blog_comment USING btree (post_id);


--
-- Name: blog_post_tags_76f094bc; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_post_tags_76f094bc ON blog_post_tags USING btree (tag_id);


--
-- Name: blog_post_tags_f3aa1999; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX blog_post_tags_f3aa1999 ON blog_post_tags USING btree (post_id);


--
-- Name: django_admin_log_417f1b1c; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_417f1b1c ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_e8701ad4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_e8701ad4 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_de54fa62; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_de54fa62 ON django_session USING btree (expire_date);


--
-- Name: guardian_groupobjectpermission_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_content_type_id ON guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_group_id ON guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX guardian_groupobjectpermission_permission_id ON guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_content_type_id ON guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_permission_id ON guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX guardian_userobjectpermission_user_id ON guardian_userobjectpermission USING btree (user_id);


--
-- Name: auth_group_permiss_permission_id_23962d04_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permiss_permission_id_23962d04_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_58c48ba9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_58c48ba9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permiss_content_type_id_51277a81_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permiss_content_type_id_51277a81_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_30a071c9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_30a071c9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_24702650_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_24702650_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_per_permission_id_3d7071f0_fk_auth_permission_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_per_permission_id_3d7071f0_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_comment_post_id_68e49f12_fk_blog_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_comment
    ADD CONSTRAINT blog_comment_post_id_68e49f12_fk_blog_post_id FOREIGN KEY (post_id) REFERENCES blog_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post_tags_post_id_5bab89b5_fk_blog_post_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_tags
    ADD CONSTRAINT blog_post_tags_post_id_5bab89b5_fk_blog_post_id FOREIGN KEY (post_id) REFERENCES blog_post(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: blog_post_tags_tag_id_4567bd44_fk_blog_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY blog_post_tags
    ADD CONSTRAINT blog_post_tags_tag_id_4567bd44_fk_blog_tag_id FOREIGN KEY (tag_id) REFERENCES blog_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_content_type_id_5151027a_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_content_type_id_5151027a_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_1c5f563_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_1c5f563_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

