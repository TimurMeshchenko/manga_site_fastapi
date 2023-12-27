--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

-- Started on 2023-12-27 20:32:12

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
-- TOC entry 214 (class 1259 OID 121498)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 121816)
-- Name: remanga_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remanga_categories (
    id bigint NOT NULL,
    name character varying(100)
);


ALTER TABLE public.remanga_categories OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 121815)
-- Name: remanga_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remanga_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remanga_categories_id_seq OWNER TO postgres;

--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 217
-- Name: remanga_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remanga_categories_id_seq OWNED BY public.remanga_categories.id;


--
-- TOC entry 234 (class 1259 OID 130293)
-- Name: remanga_comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remanga_comment (
    id integer NOT NULL,
    author_id bigint,
    title_id bigint,
    content text,
    created_at timestamp with time zone,
    likes integer
);


ALTER TABLE public.remanga_comment OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 130292)
-- Name: remanga_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remanga_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remanga_comment_id_seq OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 233
-- Name: remanga_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remanga_comment_id_seq OWNED BY public.remanga_comment.id;


--
-- TOC entry 236 (class 1259 OID 130372)
-- Name: remanga_comment_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remanga_comment_rating (
    id integer NOT NULL,
    user_id bigint,
    title_id bigint,
    comment_id bigint,
    is_liked boolean
);


ALTER TABLE public.remanga_comment_rating OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 130371)
-- Name: remanga_comment_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remanga_comment_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remanga_comment_rating_id_seq OWNER TO postgres;

--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 235
-- Name: remanga_comment_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remanga_comment_rating_id_seq OWNED BY public.remanga_comment_rating.id;


--
-- TOC entry 216 (class 1259 OID 121809)
-- Name: remanga_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remanga_genres (
    id bigint NOT NULL,
    name character varying(100)
);


ALTER TABLE public.remanga_genres OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 121808)
-- Name: remanga_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remanga_genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remanga_genres_id_seq OWNER TO postgres;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 215
-- Name: remanga_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remanga_genres_id_seq OWNED BY public.remanga_genres.id;


--
-- TOC entry 220 (class 1259 OID 121823)
-- Name: remanga_title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remanga_title (
    id bigint NOT NULL,
    rus_name character varying(100),
    dir_name character varying(100),
    img_url character varying(100),
    manga_type character varying(100),
    avg_rating double precision,
    count_rating integer,
    issue_year integer,
    count_bookmarks integer,
    count_chapters integer,
    description character varying(1500)
);


ALTER TABLE public.remanga_title OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 121882)
-- Name: remanga_title_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remanga_title_categories (
    id bigint NOT NULL,
    title_id bigint,
    categories_id bigint
);


ALTER TABLE public.remanga_title_categories OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 121881)
-- Name: remanga_title_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remanga_title_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remanga_title_categories_id_seq OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 225
-- Name: remanga_title_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remanga_title_categories_id_seq OWNED BY public.remanga_title_categories.id;


--
-- TOC entry 232 (class 1259 OID 130278)
-- Name: remanga_title_chapters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remanga_title_chapters (
    id bigint NOT NULL,
    title_id bigint,
    chapter integer,
    tome integer
);


ALTER TABLE public.remanga_title_chapters OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 130277)
-- Name: remanga_title_chapters_new_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remanga_title_chapters_new_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remanga_title_chapters_new_id_seq OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 231
-- Name: remanga_title_chapters_new_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remanga_title_chapters_new_id_seq OWNED BY public.remanga_title_chapters.id;


--
-- TOC entry 224 (class 1259 OID 121865)
-- Name: remanga_title_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remanga_title_genres (
    id bigint NOT NULL,
    title_id bigint,
    genres_id bigint
);


ALTER TABLE public.remanga_title_genres OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 121864)
-- Name: remanga_title_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remanga_title_genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remanga_title_genres_id_seq OWNER TO postgres;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 223
-- Name: remanga_title_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remanga_title_genres_id_seq OWNED BY public.remanga_title_genres.id;


--
-- TOC entry 219 (class 1259 OID 121822)
-- Name: remanga_title_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remanga_title_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remanga_title_id_seq OWNER TO postgres;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 219
-- Name: remanga_title_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remanga_title_id_seq OWNED BY public.remanga_title.id;


--
-- TOC entry 228 (class 1259 OID 122120)
-- Name: remanga_title_rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.remanga_title_rating (
    id integer NOT NULL,
    user_id bigint,
    title_id bigint,
    rating integer
);


ALTER TABLE public.remanga_title_rating OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 122119)
-- Name: remanga_title_rating_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.remanga_title_rating_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.remanga_title_rating_id_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 227
-- Name: remanga_title_rating_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.remanga_title_rating_id_seq OWNED BY public.remanga_title_rating.id;


--
-- TOC entry 222 (class 1259 OID 121856)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id bigint NOT NULL,
    password character varying(128),
    last_login timestamp with time zone,
    is_superuser boolean,
    username character varying(150),
    first_name character varying(150),
    last_name character varying(150),
    email character varying(254),
    is_staff boolean,
    is_active boolean,
    date_joined timestamp with time zone,
    avatar character varying(100)
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 122143)
-- Name: user_bookmarks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_bookmarks (
    id bigint NOT NULL,
    user_id bigint,
    title_id bigint
);


ALTER TABLE public.user_bookmarks OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 122142)
-- Name: user_bookmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_bookmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_bookmarks_id_seq OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 229
-- Name: user_bookmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_bookmarks_id_seq OWNED BY public.user_bookmarks.id;


--
-- TOC entry 221 (class 1259 OID 121855)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- TOC entry 3228 (class 2604 OID 121819)
-- Name: remanga_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_categories ALTER COLUMN id SET DEFAULT nextval('public.remanga_categories_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 130296)
-- Name: remanga_comment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_comment ALTER COLUMN id SET DEFAULT nextval('public.remanga_comment_id_seq'::regclass);


--
-- TOC entry 3237 (class 2604 OID 130375)
-- Name: remanga_comment_rating id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_comment_rating ALTER COLUMN id SET DEFAULT nextval('public.remanga_comment_rating_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 121812)
-- Name: remanga_genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_genres ALTER COLUMN id SET DEFAULT nextval('public.remanga_genres_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 121826)
-- Name: remanga_title id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title ALTER COLUMN id SET DEFAULT nextval('public.remanga_title_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 121885)
-- Name: remanga_title_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_categories ALTER COLUMN id SET DEFAULT nextval('public.remanga_title_categories_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 130281)
-- Name: remanga_title_chapters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_chapters ALTER COLUMN id SET DEFAULT nextval('public.remanga_title_chapters_new_id_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 121868)
-- Name: remanga_title_genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_genres ALTER COLUMN id SET DEFAULT nextval('public.remanga_title_genres_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 122123)
-- Name: remanga_title_rating id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_rating ALTER COLUMN id SET DEFAULT nextval('public.remanga_title_rating_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 121859)
-- Name: user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 122146)
-- Name: user_bookmarks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_bookmarks ALTER COLUMN id SET DEFAULT nextval('public.user_bookmarks_id_seq'::regclass);


--
-- TOC entry 3418 (class 0 OID 121498)
-- Dependencies: 214
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
51efe9c2e474
\.


--
-- TOC entry 3422 (class 0 OID 121816)
-- Dependencies: 218
-- Data for Name: remanga_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remanga_categories (id, name) FROM stdin;
1	Веб
4	В цвете
5	Монстры
6	Боги
7	Воспоминания из другого мира
8	ГГ мужчина
9	Жестокий мир
10	Животные компаньоны
11	Магическая академия
12	Месть
13	Навыки
14	Ёнкома
15	Сборник
16	Сингл
17	Реинкарнация
18	Зомби
19	Демоны
20	Кулинария
21	Медицина
22	Культивация
23	Зверолюди
24	Хикикомори
25	Магия
26	Горничные
27	Средневековье
28	Антигерой
29	Гяру
30	Ниндзя
31	Офисные работники
32	Полиция
33	Самураи
34	Традиционные игры
35	Видеоигры
36	Криминал
37	Музыка
38	Обратный Гарем
39	Выживание
40	Путешествия во времени
41	Алхимия
42	Ангелы
43	Антиутопия
44	Апокалипсис
45	Армия
46	Артефакты
47	Борьба за власть
48	Будущее
49	Вестерн
50	Владыка демонов
51	Волшебные существа
52	Геймеры
53	Гильдии
54	ГГ женщина
55	Дружба
56	Ранги силы
57	Игровые элементы
58	Космос
59	Наёмники
60	Насилие / жестокость
61	Нежить
62	Пародия
63	Подземелья
64	Политика
65	Разумные расы
66	Роботы
67	Рыцари
68	Система
69	Стимпанк
70	Скрытие личности
71	Спасение мира
72	Супергерои
73	Учитель / ученик
74	Шантаж
75	Лоли
76	Тупой ГГ
77	ГГ имба
78	Умный ГГ
79	Управление территорией
80	Исекай
81	Аристократия
82	Амнезия
83	Бои на мечах
84	ГГ не человек
85	Упоротость
86	Грузовик-сан
87	Учебное заведение
\.


--
-- TOC entry 3438 (class 0 OID 130293)
-- Dependencies: 234
-- Data for Name: remanga_comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remanga_comment (id, author_id, title_id, content, created_at, likes) FROM stdin;
1	1	1		2023-12-20 00:02:16.658198+03	0
2	1	1		2023-12-20 00:02:22.194659+03	0
3	1	1		2023-12-20 00:02:24.117545+03	0
4	1	1		2023-12-20 00:02:27.906094+03	0
5	1	1		2023-12-20 00:02:31.213489+03	0
6	1	1		2023-12-20 00:02:38.737956+03	0
7	1	1		2023-12-20 00:03:10.722264+03	0
8	1	1	g	2023-12-20 00:05:23.885242+03	0
9	1	1	g	2023-12-20 00:05:36.553963+03	0
10	1	1	gas	2023-12-20 00:06:46.125934+03	0
11	1	1	fwafwasfa	2023-12-20 00:27:51.700323+03	0
12	1	1	fwafwasfasafafzxcsafw	2023-12-20 00:27:53.772094+03	0
13	1	1	fwafwasfasafafzxcsafw421	2023-12-20 00:27:55.699898+03	0
14	1	1	fwafwasafw421	2023-12-20 00:27:57.403275+03	0
15	1	1	gesges	2023-12-20 00:28:20.0368+03	0
16	1	1	a	2023-12-20 00:28:58.092199+03	0
17	1	1	<a href="/">a</a>	2023-12-20 00:34:25.746005+03	0
18	1	1	<a href="/">a</a>\n	2023-12-20 00:34:40.974032+03	0
19	1	1	SELECT * FROM user;	2023-12-20 00:38:08.79292+03	0
20	1	1	SELECT version();	2023-12-20 00:40:21.540103+03	0
21	1	1	fwafa	2023-12-20 00:41:09.386645+03	0
22	1	6	drhdr	2023-12-20 00:41:22.402408+03	0
23	1	1	INSERT INTO alembic_version(version_num) VALUES("1")	2023-12-20 00:44:59.981629+03	0
24	1	1	<a href="/">a</a>	2023-12-20 00:47:42.38396+03	0
25	1	1	a	2023-12-20 01:20:34.862496+03	0
26	1	1	b	2023-12-20 01:20:47.733428+03	0
27	1	1	c	2023-12-20 01:37:36.511173+03	0
28	1	1	d	2023-12-20 01:38:23.681883+03	0
29	1	1	e	2023-12-20 01:38:23.686047+03	0
30	1	1	e	2023-12-20 01:41:03.476583+03	0
31	1	1	h	2023-12-20 01:41:03.48135+03	0
32	1	6	fawfwa	2023-12-20 20:05:16.378275+03	0
33	1	6	fwfawwa	2023-12-20 20:05:18.172762+03	0
34	1	6		2023-12-20 20:05:18.180156+03	0
35	1	6	fwfw	2023-12-20 20:05:21.064591+03	0
36	1	6	egsegs	2023-12-20 20:07:04.488866+03	0
37	1	6	wrarwr	2023-12-20 20:05:23.288516+03	0
38	1	6	rwaraw	2023-12-20 20:07:04.494692+03	0
39	1	6	safsafxz	2023-12-20 20:07:06.224536+03	0
40	1	6	awgwgwa	2023-12-20 20:07:08.272606+03	0
41	1	6	sdawdq	2023-12-20 20:07:10.032362+03	0
42	1	6	a	2023-12-20 20:07:11.616964+03	0
43	1	6	b	2023-12-20 20:07:13.404693+03	0
44	1	6	xczxc	2023-12-20 20:07:14.753057+03	0
45	1	6	gesge	2023-12-20 20:07:16.031463+03	0
46	1	6	fwafwaaf	2023-12-20 20:07:17.632293+03	0
47	1	6	1	2023-12-20 20:12:54.814214+03	0
48	1	6	2	2023-12-20 20:12:56.168198+03	0
49	1	6	3	2023-12-20 20:12:54.820052+03	0
50	1	6	4	2023-12-20 20:12:56.176243+03	0
51	1	1	gaw	2023-12-20 20:30:18.211686+03	0
52	1	1	q	2023-12-20 20:30:11.555409+03	0
53	1	1	w	2023-12-20 20:30:18.218633+03	0
54	1	6	f	2023-12-20 20:30:14.258517+03	0
55	1	1		2023-12-20 22:35:32.748687+03	0
56	1	1		2023-12-20 22:36:48.608684+03	0
57	1	1		2023-12-20 22:37:17.352356+03	0
58	1	1		2023-12-20 22:37:20.968696+03	0
59	1	1		2023-12-20 22:37:37.872176+03	0
60	1	1		2023-12-20 22:37:41.536274+03	0
61	1	1	2	2023-12-20 22:47:14.712724+03	0
62	1	1	5	2023-12-20 22:47:16.27246+03	0
63	1	1	6	2023-12-20 22:47:14.717658+03	0
70	1	1	gzs	2023-12-20 22:50:05.985163+03	1
69	1	1	gsz	2023-12-20 22:48:11.28284+03	-1
67	1	1	hds	2023-12-20 22:47:36.501557+03	1
66	1	1	gwa	2023-12-20 22:47:36.496661+03	-1
65	1	1	abfa	2023-12-20 22:47:18.761023+03	1
79	1	1	fwaafsz	2023-12-23 14:08:15.502255+03	1
75	1	1	fwaaws	2023-12-21 02:15:57.502861+03	1
77	1	1	fwaf	2023-12-23 14:05:47.267937+03	0
72	2	1	t	2023-12-21 01:56:09.859879+03	1
71	1	1	632	2023-12-20 22:50:07.431831+03	-1
73	1	1	fwa	2023-12-21 02:13:04.620555+03	-1
64	1	1	8	2023-12-20 22:47:16.27804+03	0
74	1	1	fwasa	2023-12-21 02:13:31.343494+03	1
78	1	1	waw	2023-12-23 14:05:56.683396+03	0
68	1	6	6	2023-12-20 22:49:12.931806+03	-1
80	1	1	re	2023-12-23 15:28:27.140339+03	0
86	5	1	jgf	2023-12-27 04:05:34.929157+03	-1
82	1	1	jtjt	2023-12-25 02:52:12.894627+03	-1
76	1	6	fwafaw	2023-12-21 02:16:11.726127+03	-1
81	1	1	jtjf	2023-12-23 21:56:44.466725+03	1
87	5	1	kgk	2023-12-27 04:06:03.055227+03	1
85	1	1	jgjf	2023-12-27 01:10:01.986467+03	1
83	1	1	ygy	2023-12-27 01:09:31.262251+03	1
84	1	1	fwa	2023-12-27 01:10:01.980879+03	-1
\.


--
-- TOC entry 3440 (class 0 OID 130372)
-- Dependencies: 236
-- Data for Name: remanga_comment_rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remanga_comment_rating (id, user_id, title_id, comment_id, is_liked) FROM stdin;
56	1	1	73	f
57	1	1	74	t
129	1	1	79	t
73	1	6	68	f
78	1	6	76	f
20	1	1	70	t
22	1	1	69	f
23	1	1	67	t
24	1	1	66	f
25	1	1	65	t
142	1	1	81	t
33	1	1	71	f
149	1	1	82	f
151	1	1	83	t
154	5	1	86	f
156	5	1	85	t
157	5	1	84	f
44	2	1	72	t
161	5	1	87	t
117	1	1	75	t
\.


--
-- TOC entry 3420 (class 0 OID 121809)
-- Dependencies: 216
-- Data for Name: remanga_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remanga_genres (id, name) FROM stdin;
2	Экшен
3	Приключения
4	Трагедия
5	Фэнтези
6	Боевые искусства
7	Гарем
8	Гендерная интрига
9	Героическое фэнтези
10	Детектив
11	Дзёсэй
12	Додзинси
13	Драма
14	История
15	Киберпанк
16	Кодомо
17	Комедия
18	Махо-сёдзё
19	Меха
20	Мистика
21	Мурим
22	Научная фантастика
23	Повседневность
24	Постапокалиптика
25	Психология
26	Романтика
27	Сверхъестественное
28	Сёдзё
29	Сёдзё-ай
30	Сёнэн
31	Сёнэн-ай
32	Спорт
33	Сэйнэн
34	Триллер
35	Ужасы
36	Фантастика
37	Школьная жизнь
38	Элементы юмора
39	Этти
40	Юри
41	Яой
\.


--
-- TOC entry 3424 (class 0 OID 121823)
-- Dependencies: 220
-- Data for Name: remanga_title; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remanga_title (id, rus_name, dir_name, img_url, manga_type, avg_rating, count_rating, issue_year, count_bookmarks, count_chapters, description) FROM stdin;
6	Прирождённый наёмник	the-strongest-mercenary	the-strongest-mercenary/203c75395dd09fc4c8b103bd5be067c9.jpg	Манхва	0	0	2020	2	166	<p>Юй Идзинь когда-то был единственным выжившим в авиакатастрофе. Чтобы выжить, он становится наёмником. Спустя 10 лет он возвращается к своей семье в родной город. Сможет ли он забыть свое прошлое и жить жизнью обычного школьника?</p>
1	Всеведущий читатель	omniscient-reader	omniscient-reader/0130c65d23185690a4b0d7f4a833fe06.jpg	Манхва	7.333333333333333	6	2020	16	184	<p>&laquo;Я знаю то, что сейчас произойдёт&raquo;.Когда он подумал об этом, всё изменилось.С того момента началась игра со смертью в мире, где каждый должен сделать всё, чтобы выжить. В мире, конец которого известен только ему.</p>
12	Возрождение Хуашань	return-volcano	return-volcano/652ceac5b9d286d3df09fd99e1103283.jpg	Манхва	0	0	2021	0	102	<p>13-й ученик великой школы Хуашань, один из трех величайших фехтовальщиков в мире - благородный клинок цветущей сливы Чхон Мён.<br />\r\nПоследним ударом клинка он убивает Чхонма, повергшего весь мир в хаос, и погибает на вершине горы из голов тысячи демонов.<br />\r\nА спустя 100 лет он перерождается в теле ребенка, чтобы возродить из пепла некогда одну из самых великих, но ныне всеми забытую школу Мурима - Хуашань.<br />\r\nЦветки сливы рано или поздно опадают. Однако когда приходит холодная зима, а за ней - весна, слива распускается в своем полном великолепии.</p>
13	Жнец дрейфующей Луны	reaper-mont	reaper-mont/a0a30dfca4226f8f2ddd06c4234abb56.jpg	Манхва	0	0	2022	0	65	<p>Он оказался в самой глубине Цзянху. Не зевайте, если не хотите, чтобы вас поглотила бездна.</p>
14	Ублюдок FFF-ранга	fffclass-trashero	fffclass-trashero/high_cover.jpg	Манхва	0	0	2019	0	172	<p>Когда ценой жизни своих товарищей герой добрался до замка Владыки Демонов и одолел его хозяина, ему нужно было только одно &ndash; возвращение на землю. Весь этот мир и люди, его населяющие, не стоили для парня ни гроша. Однако, вместо того, чтобы вернуться обратно домой, он получил ранг F за всё, что натворил. Ублюдку F-ранга придется начать все заново!</p>
15	Новая жизнь убийцы богов	two-new-life	two-new-life/f64c96eaab11057ba1ac6e99069b309f.jpg	Манхва	0	0	2021	0	99	<p>Возвращение самой желанной фантазии человечества.<br />\r\n&quot;Уж если противные боги дали мне этот шанс, я воспользуюсь им. Хоть я и хочу умереть, но я должен убить их.&quot;<br />\r\nДжефир - последний оставшийся в живых человек. Битва с демонами закончилась поражением, но боги дали ему возможность вернуться на 10 лет назад. Демоны, которые забрали у людей всё, и боги, которые спокойно наблюдали за этим. В этот раз я не дам вам спокойно жить.</p>
16	Чёртова реинкарнация	damn-reicarnation	damn-reicarnation/f339b6ee9a8d5b89b0fe4bedb6627007.jpg	Манхва	0	0	2022	0	77	<p>Во время путешествия, призванного сокрушить всех демонов, Гамель отважно жертвует собственной жизнью ради спасения товарища, а перед смертью берет с него клятву закончить их общее дело.</p>\r\n\r\n<p>Спустя многие годы наш герой перерождается в семье того самого друга - воина Вермута, которого он когда-то спас, и, вопреки ожиданиям, узнает, что миссия по уничтожению демонов так и не была завершена.</p>\r\n\r\n<p>Теперь он - Юджин Лайонхарт. Потомок великого гения с бесценным опытом прошлой жизни и невиданным прежде талантом. И благодаря усердным тренировкам в этот раз он обязательно добьется своей цели.</p>
30	Реинкарнация врача	medical-reincarnation	medical-reincarnation/ad125a4552ce166c8852d0de57225392.jpg	Манхва	0	0	2019	0	149	<p>Ким Джи Хун живёт жизнью безуспешного хирурга. Но ему предоставился шанс обрести новую жизнь и он возвращается к школьным будням, чтобы стать лучшим дерматологом и грести много&nbsp;денег!</p>
10	Я стал графским ублюдком	trash-of-the-counts-family	trash-of-the-counts-family/92591200027bfd0079701e44237e2f02.jpg	Манхва	0	0	2020	1	110	<p>Я очнулся в романе, в теле молодого наследника графства, прославленного не без помощи его жестоких выродков.<br />\r\nНо я не собираюсь быть таким же ублюдком.</p>
17	Легенда о северном клинке	legend-of-the-northern-blade	legend-of-the-northern-blade/d82b3c2026790ee0387f87a5e8788fa9.jpg	Манхва	0	0	2019	0	171	<p>Когда мир погрузился во тьму, мастера боевых искусств собрались, чтобы сформировать &laquo;Северный небесный клан&raquo;. Благодаря клану люди снова обрели мир и покой. Однако с течением времени мастера боевых искусств начали строить заговор против &laquo;северного небесного клана&raquo;, который в конечном итоге привел к смерти лидера клана, Джин Кван-Хо, и уничтожению клана вместе с ним. Когда все покинули клан, единственный сын Джин Кван-Хо, Джин Му-Вон, остался в нем. Му-Вон никогда не изучал боевые искусства, но он находит Технику, тайно оставленную его отцом, и начинает изучать боевые искусства Северного Небесного Клана.</p>
18	Воин-скелет не смог удержать подземелье	skeleton_soldier_couldnt_protect_the_dungeon	skeleton_soldier_couldnt_protect_the_dungeon/bca6489ad16f240f3c4d6cb7e6b936eb.jpg	Манхва	0	0	2018	0	263	<p>Он проснулся в могиле под дождем, и не помнит кто он....<br />\r\nЗащитить хозяйку было его единственным предназначением которое он хотел выполнить больше всего, но он не смог исполнить его. Однако судьба каждый раз дарует ему новый шанс, а может и проклятие... Шанс стать сильнее и спасти свою госпожу. Шанс переписать историю, и узнать кто же он на самом деле...<br />\r\n&nbsp;</p>
19	Эволюция монстров-питомцев	gods-pet-evolution	gods-pet-evolution/42e9c0e89bbdb0e3ffaf5d5e64a64bde.jpg	Маньхуа	0	0	2021	0	261	<p>Мир пережил катаклизм, и теперь по Земле бродят монстры. Из-за катастрофы люди начали открывать в себе удивительный дар. Эта эра ознаменовалась появлением новой профессии. Тренеры &ndash; люди, которые обучают и используют монстров в своих целях. С этого момента и начинается история Гао Пэна. Амбициозный молодой человек с собственными мечтами, которому повезло родиться в золотой век выращивания монстров.&nbsp;<br />\r\n&nbsp; &ldquo;Даже если это - червь, я смогу превратить его в дракона, который взлетит к небесам!&rdquo;</p>
20	Выбери меня!	the-pick-me-up	the-pick-me-up/b0b4c6229f0563beb475292b5c8f75ac.jpg	Манхва	0	0	2022	0	70	<p><br />\r\nОт студии, создавшей &laquo;Поднятие Уровня в одиночку&raquo;, &laquo;Возвращение героя уровня катастрофы&raquo; и &laquo;Всеведущий читатель&raquo;!<br />\r\n<br />\r\n&laquo;Выбери меня!&raquo; &ndash; мобильная гача, известная невероятной сложностью. Хан Со Джин, один из пяти сильнейших &quot;мастеров&quot; мира, теряет сознание во время прохождения особого подземелья, а просыпается уже в теле 1-звёздочного персонажа по имени Хан Ислат под управлением другого игрока.<br />\r\n<br />\r\nЧтобы вернуться обратно, ему придётся возглавить команду героев и пройти 100 уровней подземелья без права на ошибку.</p>
21	Игрок, который вернулся спустя 10 000 лет	player-who-returned-10000-years-laters	player-who-returned-10000-years-laters/a3678dee8752836ed8cbf5b6977fc02a.jpg	Манхва	0	0	2022	0	65	<p>Внезапно оказавшись в Аду, всё, что у него осталось это вера и тяга к жизни. Он уничтожал тысячи демонов на всех кругах Преисподней. Даже семь верховных герцогов Ада пали после встречи с ним.</p><p> </p><p>— Владыка, зачем вам обратно на землю? Вся Преисподняя в ваших руках!</p><p>— Заткнись и продолжай подготовку к обряду!</p><p> </p><p>Ни вкусной пищи, ни привычных развлечений… лишь ужасающие демоны и безжизненные пустыни.</p><p> </p><p>— Как же хочется вернуться обратно домой…</p><p> </p><p>Спустя 10,000 лет Игрок возвращается на землю.</p>
22	Ветролом	wind_breaker	wind_breaker/6439bba67c9e5a152ca08644123045db.jpg	Манхва	0	0	2013	0	478	<p>Ветролом &mdash; драма о юных уличных гонщиках, мечтающих о свободе.Главный герой, Джа Хён &mdash; сын успешных родителей и лучший ученик в своей школе. Он никогда не знал, что значит &laquo;бороться за свою мечту&raquo;, ведь вся его жизнь определялась родителями, которые хотят для сына только одного &mdash; успешного окончания школы. Но однажды Джа Хён, с детства любящий велоспорт, оказывается втянут в деятельность местных гонщиков, что заставляет героя пересмотреть приоритеты родителей и прислушаться к себе, ведь на своем новом пути он обретает друзей, любовь и приключения.</p>
67	Друид с Сеульского вокзала	seoul-station-druid	seoul-station-druid/853f9086f13cc7b6849b973e566789f8.jpg	Манхва	0	0	2021	0	118	<p>Пак Су Хо, провел тысячу лет с животными и стал друидом.<br />\r\nТем временем мир превратился в мир жестокости и появились монстры. Друид и царь зверей, выживший в ожесточенной битве за выживание в течение тысячи лет, отправляется покорять мир.<br />\r\n&quot;Отныне я правитель!&quot;</p>
23	Сказания о демонах и богах	tales_of_demons_and_gods	tales_of_demons_and_gods/0685323f81241e9161fa096a8b0be461.jpg	Маньхуа	0	0	2015	0	451	<p>Сильнейший в мире заклинатель демонов Не Ли погиб в битве с Мудрецом-Императором. Но его душа воплотилась вновь, вернувшись на десятилетия назад, в нём самом, тринадцатилетнем подростке. Теперь у него есть шанс исправить все ошибки, совершённые в прошлом: спасти от монстров родной город, защитить любимую, друзей и семью. В детстве Не Ли &nbsp;был самым слабым учеником в классе, имея духовную силу на уровне простых людей. Он и мечтать не смел стать воином, не говоря уже о заклинателе демонов, но опыт и знания, накопленные в предыдущей жизни, помогут ему стать сильнее. Ведь сейчас он знает то, что неведомо профессорам в их боевой академии.&nbsp;</p>
24	Ублюдок	bastard-hwang-youngchan	bastard-hwang-youngchan/4f4e6ff55dc2bbf6ad1a4b595d5fc1d9.jpg	Манхва	0	0	2014	0	94	<p>&laquo;В моем доме серийный убийца!&raquo;. Сон У Джин &mdash; паренек со слабым здоровьем, находящийся на нижней ступени школьной иерархии, но он не так прост, каким кажется на первый взгляд. &laquo;Bastard&raquo; &mdash; веб-манхва, повествующая нам о серийном убийце. Отличная мрачная рисовка и кровавый сюжет заставят вас не отрываться от экрана монитора до самого конца.</p>
25	Элисед	eleceed	eleceed/192da4a25a7efe417d1ff3ee76e84631.jpg	Манхва	0	0	2018	0	273	<p>Кайден - загадочный человек, который словно комета спустился с неба. Весь израненный, почти потерявший последние силы, он решает скрыть свое присутствие - ведь по-другому от погони не уйти. По дороге Кайден встречает обычную дворовую кошку и, почти не думая, решает вселиться в ее тело. Со Джи У - энергичный и общительный молодой человек из средней школы, который очень любит кошек. Один раз по пути домой он встречает до боли потрепанного кота и берет его к себе домой. Наш У не только добрый, но еще и обладает одной скрытой способностью. Какой же?</p>
26	Боксёр	the-boxer	the-boxer/9481f914bccb6def4a28b28bd35ae2bb.jpg	Манхва	0	0	2019	0	133	<p>Шокирующий талант, с которым никто не может столкнуться! Это благословение или проклятие?!</p>
27	Реинкарнация тёмного магистра	the-celestial-horse-cant-live-ordinary	the-celestial-horse-cant-live-ordinary/45d89489fd9c804a4f3717e2dad94d88.jpg	Манхва	0	0	2021	0	98	<p>Демон Пэк Чун Хёк.<br />\r\nНекогда сильнейшая личность в Муриме умирает и обнаруживает себя в теле старшего сына дома Дмитрий. В теле человека, которого все называют дураком. Человека, который постоянно находится в тени своего младшего брата и которому глубоко плевать на мнение окружающих.<br />\r\nНо теперь, демон... Нет, Роман Дмитрий больше не сможет жить привычной жизнью.</p>
28	Младший сын мастера меча	the-younget-son-of-a-swordman	the-younget-son-of-a-swordman/6c99ef7d7ee5e5a69fdb3f182adc15e7.jpg	Манхва	0	0	2022	0	100	<p>Джин Ранкандел &ndash; младший сын в семье самых великих мечников в стране, бросивший тень на всех Ранканделов. Со скандалом его выперли из дома, но судьба дала ему ещё один шанс.<br />\r\n&ndash; Как ты распорядишься своей силой?<br />\r\n&ndash; Использую для достижения своих целей.<br />\r\nВоспоминания о былых днях, невероятный талант и контракт с Богом.<br />\r\nТеперь он готов взойти на вершину.</p>
29	От нерадивого аристократа до усердного гения	lazy-confucius-becomes-a-genius	lazy-confucius-becomes-a-genius/e0a5818a113e0b394e020501ef6850ae.jpg	Манхва	0	0	2021	0	103	<p>Юный Айрон Парейра сделал свой мир грёз убежищем от боли трагедии прошлого. Людей забавляло это, они подняли его на смех и прозвали нерадивым аристократом. Однако подобное отношение никак не задевало нашего героя необходимостью меняться.<br />\r\nТак бы всё и продолжалось, не повстречай он во сне бездарного юношу, который тридцать семь лет подряд обучался владению мечом, да так и умер с оружием в руках.</p>
31	Мир после разрушения	world-after-destrucion	world-after-destrucion/25bc8a52726a02d37aed61630c425e4a.jpg	Манхва	0	0	2022	0	104	<p><strong>Авторская история от создателя &quot;Всеведущего читателя&quot; о человеке, отказавшемся вернуться в прошлое.</strong></p><p></p><p><em>Люди были призваны стать ходоками и захватить башню, чтобы спасти человечество.</em></p><p><em>На 77 этаже башни они нашли <strong>&quot;Камень Возвращения&quot;</strong>, благодаря чему появилась возможность вернуться в прошлое.</em></p><p><em>Многие покинули настоящее, поэтому последней надеждой стал отряд <strong>&quot;Лови момент&quot;</strong>, сформированный оставшимися ходоками.</em></p><p><em>Последний из отряда достиг 100 этажа, но он уже не знает, чему верить</em></p>
32	Возвращение безумного демона	light-horse-regression	light-horse-regression/b87004ca012351efd6ef521fae277b7c.jpg	Манхва	0	0	2021	0	97	<p>Изаха&nbsp;- безумец повёрнутый на боевых&nbsp;искусствах. Во время погони сектантов за ним, в неравной схватке он решил спрыгнуть с утёса. И казалось бы, всё уже кончено, но открыв глаза, некая сущность вознаградила его шансом на новую жизнь. Вспышка, весь избитый&nbsp;Изаха&nbsp;лежит в кровати. Тут&nbsp;он понимает, что перенёсся на много лет назад, во времена, когда он был никем и никому не нужен, в один из худших периодов его&nbsp;жизни, когда его избили за нелепую шутку. Безумец, что вернулся&nbsp;в своё прошлое, изменит ли он ход времени? Станет ли он вновь известен в народе как &quot;Безумный демон&quot;? Или он просто покарает всех своих врагов?</p>
33	Сильнейший пробужденный из психушки	the-strongest-from-the-asylum	the-strongest-from-the-asylum/267c363adf61c22e4431322d47934fd3.jpg	Маньхуа	0	0	2021	0	205	<p>Это мир, где злые существа сеют хаос. Однако, даже если злые существа сильны, все они исчезают после этой психушки и даже превращаются в ингредиенты и домашних животных без всякого достоинства. Это психиатрическая больница &quot;Цинь Шань&quot;, где таланты изобилуют, а сильные окружены. В ответ на это Линь Фань, тяжело больной человек с системой, сказал: Я точно не псих, я обычный человек, который любит заниматься культивацией. Обычно я просто трогаю розетки, залезаю на высоковольтную коробку и в дни грозы стою на крыше, чтобы подарить небесам танец с палочками.</p>\r\n\r\n<p>&nbsp;</p>
34	Однажды я стала принцессой	suddenly-became-a-princess-one-day	suddenly-became-a-princess-one-day/295162e8179a147b4cf14cf1cbce22e0.jpg	Манхва	0	0	2017	0	126	<p>Когда я открыла глаза, я стала принцессой.&nbsp;Но почему из всех персонажей этой истории именно принцессой, судьба которой тесно переплетена с кровавым Императором?&nbsp;Если я хочу выжить, то должна быть неприметной для его глаз.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&laquo;Когда это в моём замке начали жить ничтожные людишки?&raquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Человек, у которого нет ни капли сочувствия, ни слезы, этот холодный император Клод!&nbsp;Неужели Атанасия, пойманная императором, сможет выжить?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&laquo;Я...Что мне делать?..&raquo;</p>
35	Я прокачиваюсь во сне, убивая монстров	gao-wu-landing-10000-years-into-the-future	gao-wu-landing-10000-years-into-the-future/e1f8349eb71447a674965efcf89dfd7e.jpg	Маньхуа	0	0	2023	0	71	<p>В эру рассвета боевых искусств на человечество нападают монстры из других миров. Лу Шень, главный герой, перерождается и попадает в эту эру, где люди из-за мутации в генах раскрыли истинный потенциал человеческого тела, возведя мастерство боевых искусств в абсолют, ведь на монстров больше не действует привычное вооружение.<br />\r\nОднако у Лу Шеня нет никаких талантов, он беспечно прожигает свою жизнь, играя в компьютер. И в один момент ему начинают сниться сны, где он попадает на 10 000 лет вперёд, в апокалиптичный мир, населённый зомби. Случайно наткнувшись на одного из ходячих трупов, главный герой убивает его.<br />\r\nВ последствии выясняется, что убив нежить, Лу Шень поглощает его память.<br />\r\nС этого момента начинается путь к вершине и спасению мира!</p>
36	Убийство героя	kill-the-hero	kill-the-hero/c1b3e705bc955ae7f44e984d051bc0f6.jpg	Манхва	0	0	2020	0	146	<p>Этот мир не был милосерден, и я отвечал ему столь же искренней ненавистью. Когда он стал Игрой, для меня не изменилось ничего. Однако встреча с Ли Сэ-Чжуном &ndash; героем, Воином, членом самой почитаемой из гильдий &ndash; дала мне дом, товарищей и смысл жизни. Смыслом этим стало &ndash; уничтожить эти чертовы подземелья и закончить Игру! Я умер от меча в спину. От меча того, кому верил, у врат последнего подземелья&hellip; Теперь я вернулся и знаю точно, кто станет добычей &laquo;охотничьего пса&raquo; Ким У-Джина, чего бы мне это ни стоило!</p>
37	Моё перерождение в древо: Начало эволюции	evolution-frm-the-big-tree	evolution-frm-the-big-tree/7bb930961e137c362e1c4076a5091fc4.jpg	Маньхуа	0	0	2022	0	103	<p>После смерти Юй Цзыюй перерождается и становится&hellip; <strong>Ивой</strong>!</p>\r\n\r\n<p>И неизвестно, сумеет ли он приспособиться к такой знакомой, но в то же время чуждой окружающей среде &ndash; ведь так совпало, что его перерождение случилось как раз во время <strong>Великой эпохи возрождения духовной энергии</strong>.</p>\r\n\r\n<p>Возрождение духовной энергии знаменует возвышение всех существ&hellip;</p>\r\n\r\n<p>Рев хищных зверей стал способен сотрясти горы и взволновать реки, а существа с могущественной силой наводнили этот мир в таком количестве, что он вот-вот лопнет по швам.</p>\r\n\r\n<p>Но, несмотря на все это, во время подобной эпохи выросла величественная ива, способная безгранично развиваться и эволюционировать.</p>\r\n\r\n<p>Плоды, что растут на ней, способны даровать другим необычайные способности, а духовная энергия, которую она распространяет, укрепляет силы зверей, что обитают на ее территории.</p>\r\n\r\n<p>&hellip;</p>\r\n\r\n<p>Одни величают ее мировым древом &ndash; Иггдрасилем, день за днем восславляя его существование!</p>\r\n\r\n<p>Другие &ndash; &laquo;великим божественным древом&raquo;, подпирающим небосвод!</p>\r\n\r\n<p>Разумеется, большинство просто зовут его &laquo;священным древом&raquo;, или &laquo;проклятым деревом&raquo;, или же &laquo;дьявольским деревом&raquo;&hellip; Да и еще много как.</p>\r\n\r\n<p><strong>И все же, при любом его упоминании в голосе каждого ясно слышится благоговейный трепет.</strong></p>
38	Поднятие уровня с богами	19651-with-god-up-level	19651-with-god-up-level/f45e0d6697fbe48b2fe492ab6491b5f5.jpg	Манхва	0	0	2021	0	96	<p>Он был храбрейшим и сильнейшим из всех, но даже его в самом конце ожидало лишь отчаяние. В последние мгновения ему был дан еще один шанс. Благодаря жертве бога времени &laquo;Хроноса&raquo; его судьба еще не была предрешена. Вернувшись в прошлое, он снова попытается взобраться на &laquo;Башню&raquo; со своим непревзойденным талантом, чтобы побороть древнее зло, которое грозит уничтожить этот мир.</p>
39	Я получил предмет мифического класса	i-got-a-mythical-class-item	i-got-a-mythical-class-item/7c00da0d8daec9321b85b160fe713930.jpg	Манхва	0	0	2022	0	84	<p>&nbsp;</p>\r\n\r\n<p>Я получил единственный в мире мифический предмет. Но что? Этот предмет принадлежит мне?</p>
40	Как демон-император стал дворецким	how-the-demon-emperor-became-a-butler	how-the-demon-emperor-became-a-butler/33d7a28cca50eac631deac6e4023a8c2.jpg	Маньхуа	0	0	2019	0	432	<p>Издревле демон-император возвышался над всеми и поэтому его титул передавался по наследству. Однажды он умер из-за предательства близкого человека. Возродившись, он потерял свои силы, но с ним остался его внутренний демон, который втягивал его в неприятности. Он замкнулся в себе. Ему пришлось стать личным дворецким старшей дочери одной важной семьи. Пройдя путь от демона-императора до дворецкого, как же ему теперь уживаться с Госпожой и демоном внутри него? Как возглавить гибнущий клан? Каким образом они вместе вернутся на вершину этого мира?!</p>
41	Освободите эту Ведьму	release-that-witch	release-that-witch/7d105ef171b5d63c6fc6633526723fba.jpg	Маньхуа	0	0	2018	0	553	<p>Чэн Янь прошел сквозь время и попал в мир, подобный Средневековой Европе, став Роландом, 4-м принцем королевства. Но этот мир не такой, к какому он уже привык. Ведьмы и магия здесь &mdash; нормальное явление. Сможет ли Роланд заполучить трон короля и решить выпавшие на его долю проблемы? Только его опыт современных технологий и помощь ведьм, известных как &laquo;слуги Дьявола&raquo;, позволит ему добиться успеха!</p>
42	Это и вправду герой?	this-is-the-real-story-of-a-hero	this-is-the-real-story-of-a-hero/2c14d05d755a261bd1f8bcd59f9a10d3.jpg	Манхва	0	0	2022	0	97	<p>Никогда ещё не было таких героев. То ли герой, то ли сам дьявол. Кан Хансу вместе с одноклассниками переместился в другой мир. Его друзья пришли в неописуемый восторг от магии и нового окружения, но сам Хансу желал лишь возвращения домой.<br />\r\nС какой это стати он должен оставить свой тёплый, уютный дом и начать приключения в чужом мире?..<br />\r\nДаже призвавшая их богиня лишь развела руками от бессилия и пообещала отправить Хансу домой. Вот только...<br />\r\nОткрыв глаза, он вновь увидел этот мир! Все друзья исчезли, а вокруг были лишь монстры!<br />\r\nБогиня меня обманула?<br />\r\nКак вернуться домой?<br />\r\nНо больше всего меня волнует другой вопрос&hellip; Как здесь выжить?!</p>
43	Выходи замуж за моего супруга!	marriage-with-a-killer	marriage-with-a-killer/7a6da6e0ffcb44c70b9e719e31162998.jpg	Манхва	0	0	2021	0	68	<p><strong>&quot;Умоляю, не порть нашу жизнь, хорошо? Живые люди должны жить, а ты ведь всё равно умрешь!..&quot;.<br />\r\nНа моих глазах, моя единственная подруга горестно плакала, а я умерла на руках у мужа, в спальне, где они изменили мне, даже не прожив отведённого врачами срока.</strong></p>\r\n\r\n<p><strong>Как вдруг:<br />\r\n&quot;Чивона, обед уже закончился!&quot;</strong></p>\r\n\r\n<p><strong>Я очнулась в своём офисе, в компании, где работала 10 лет назад.<br />\r\nМне был подарен второй шанс.</strong></p>\r\n\r\n<p><strong>Теперь, чтобы изменить свою судьбу, кто-то должен встать на моё место.<br />\r\nЭтим &quot;кто-то&quot; будет моя лучшая подруга.</strong></p>\r\n\r\n<p><strong>Ты хотела моего мужа -&nbsp;ты выйдешь за него замуж.</strong><br />\r\n&nbsp;</p>
44	Безграничный маг	a-infinite-wizard	a-infinite-wizard/98a7d1dcb086de927833b07335b8bc55.jpg	Манхва	0	0	2022	0	57	<p>Ребёнок, брошенный в конюшне и воспитанный как простолюдин, Широн. Дитя, которое благодаря своей врождённой проницательности научилось читать. В один прекрасный день он выезжает в город и сталкивается с так сильно интересующей его магией... По этой причине Широн и начинает мечтать стать магом. Однако перед ним возникает множество преград из-за его статуса. Он узнаёт об обратной стороне этого мира задолго до своего взросления. В этом странном, каком-то искажённом мире... Сможет ли он осуществить свою мечту стать магом?</p>
45	Герой иного мнения	hero-with-another-opinion	hero-with-another-opinion/4a77436ade36f6fd110367da5718af4a.jpg	Рукомикс	0	0	2020	0	22	<p>Иногда жизнь может преподносить своеобразные сюрпризы, что диву даёшься. И это говорю я, что прожил одну жизнь демоном, а вторую человеком.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Теперь же меня ждёт ещё третья &mdash; в роли Героя на стороне добра. Причем в мире том, самом первом. Ирония? Меня не раз называли сволочью и психом, а тут я стану борцом за светлое будущее.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>И у меня, как Бывшего Темного Повелителя, есть свое мнение.</p>
46	От рыцаря самого низкого ранга до монарха	from-the-lowest-ranked-knight-to-monarch	from-the-lowest-ranked-knight-to-monarch/9fe837d8b314cc1a98046cd08c095350.jpg	Манхва	0	0	2021	0	129	<p>В пятнадцать я лишился правой руки на поле битвы, став калекой.<br/>Последующие двадцать четыре года мало кто верил, что для такого, как я, подходит путь воина: меня отговаривали, смотрели с сочувствием, презирали... А в тридцать девять отрубили вторую руку и вынудили спрыгнуть с утеса.<br/>И я умер. Умер, но перед собственной смертью умудрился подгадить отправившему меня на тот свет засранцу. Да так удачно, что... вернулся в свои пятнадцать лет! На то самое поле боя, где мне вот-вот отрубят правую руку!</p>
47	Месть железнокровной Гончей Меча	the-return-of-the-a-ironblooded-hound	the-return-of-the-a-ironblooded-hound/baaabc7d21230873b1e26af4732e23dc.jpg	Манхва	0	0	2023	0	53	<p>Он был гончей семьи Баскервиль: Викир.<br />\r\nНо его преданность была вознаграждена клеветой и лезвием гильотины.<br />\r\n&quot;Я больше никогда не буду жить жизнью гончей&quot;.<br />\r\nНа пороге смерти возникла неожиданная возможность.<br />\r\nГлаза Викира загорелись красным, когда он точил свои клыки в темноте.<br />\r\n&quot;Ну погоди, Хьюго. На этот раз я перережу тебе глотку&quot;.<br />\r\nПришло время гончей отомстить своему хозяину.</p>
49	Возвращение героя максимального уровня	full-level-hero-is-returning	full-level-hero-is-returning/7ea257e489aab9ab9036f3a8e3ad97b9.jpg	Манхва	0	0	2020	0	146	<p>Дейви - бессильный принц маленькой страны.<br />\r\nКогда он впал в кому и его душа покинула тело, она переместилась в огромную галерею душ былых героев.<br />\r\nВзяв все в свои руки, Дейви возвращается.</p>
50	Я стану хозяйкой этой жизни	in-this-life-ill-become-the-head-of-the-family	in-this-life-ill-become-the-head-of-the-family/f7e7305b424894726072fe32fd88d332.jpg	Манхва	0	0	2021	0	127	<p>&mdash; Фирентия переродилась внебрачной дочерью главы самого влиятельного рода империи. Но однажды её отец умер, родственники выставили её за порог, а те аристократы, с которыми она хорошо ладила, отвернулись от неё.&nbsp;<br />\r\nА затем её, подвыпившую, сбил экипаж, и вдруг, открыв глаза, она вернулась в свои семь лет.&nbsp;<br />\r\nТам, в прошлой жизни, подобно большому псу, за ней увивался второй принц, который станет врагом всего её рода.&nbsp;<br />\r\n- Тия, ты намного красивее меня!&nbsp;<br />\r\n- Шутить изволил?&nbsp;<br />\r\n- Нет, я правду говорю.&nbsp;<br />\r\nНу и ладно, и второй принц, и родовое имущество, всё это моё!&nbsp;<br />\r\nЯ обязательно стану хозяйкой этой жизни.</p>
51	Безграничные пассивные навыки	lag	lag/3bd0caab80527233ede7c28d0def1470.jpg	Манхва	0	0	2022	0	96	<p>Что будет, если дать расчётливому человеку возможность бесконечно наращивать количество пассивных навыков и поставить перед ним целью выбраться из заточения, в которое он попал против своей воли? L.A.G - мистическое сооружение с огромным количеством помещений и этажей, что бесконечно тянутся вниз. Здесь люди вынуждены сражаться за свою жизнь в попытках попасть на самый нижний этаж, в котором, предположительно, они найдут все ответы. В придачу ко всему, L.A.G играет роль системы, благодаря которой игроки получают навыки и постоянно наращивают боевой потенциал. Здесь не выживает сильнейший - сильнейшим становится тот, кто выжил.</p>
52	Логин Мурим	murim-login	murim-login/03451c15339f37dd1b89c4c1854feae8.jpg	Манхва	0	0	2020	0	178	<p>Эпоха, когда охотники зарабатывают, зачищая врата от монстров. Джин Тэ-Кён - низкоранговый охотник, подобравший VR капсулу и случайно зашедший в игру, сюжет которой разворачивается в мире боевых искусств. После множества взлетов и падений Тэ-кён все-таки смог выбраться из этого мира. Сила и навыки, которые Джин получил в Муриме, появились у него и в реальном мире. Благодаря этому, он смог продолжить получать деньги, работая охотником... Однако он все же решает вернуться в Мурим из-за беспокойства за его друзей-NPC&nbsp;</p>
53	Становление богом	one_hundred_to_make_god	one_hundred_to_make_god/86a77e61b95507bda3d352fb3dbbbb65.jpg	Маньхуа	0	0	2015	0	1133	<p>Луо Чжень, для того что бы спасти свою сестру Луо Янь, встал на путь изучения высшего боевого искусства &laquo;Становление Богом&raquo;. Только так он сможет вернуть Луо Янь свободу. Правда, чем ближе он к своей цели, тем сложнее препятствия, появляющиеся на его пути!</p>
54	Туториал продвинутого игрока в башне	the-tutorial-tower-of-the-advances-player	the-tutorial-tower-of-the-advances-player/491e7d66481fee68a020d55928f4a2c3.jpg	Манхва	0	0	2019	0	189	<p>В мире появились монстры и таинственная Башня. Главный герой стал охотником, но в отличии от других, он не смог выйти из башни после её зачистки. И спустя 12 лет после того как башня была освобождена... Он вернулся!</p>
55	Возвращение замороженного игрока	return-of-the-frozen-player	return-of-the-frozen-player/f804ac0bd88320b0f7470c00768362a3.jpg	Манхва	0	0	2021	0	95	<p>В 2019 году мир переменился, и появились такие явления как: врата, монстры, система и игроки, - которых ранее не существовало.&nbsp;<br />\r\nНа протяжении 5 лет между человечеством и захватчиками происходила борьба за власть и территории.<br />\r\n[Финальный босс &quot;Снежная королева&quot; появился]<br />\r\nЕсли убить его, человечество сможет обрести свободу и вернуться к прежней жизни.&nbsp;<br />\r\n24 ноября 2024 года четверо из 5 игроков вошли в последнее подземелье на Антарктиде, чтобы победить финального босса на территории Земли. Одним взмахом руки &quot;Снежная королева&quot; заморозила Тихий океан, повергнув человечество в отчаяние.&nbsp;<br />\r\nПоследнему игроку удалось победить финального босса, однако в процессе поглощения ее &quot;ядра&quot; он превратился в ледяную глыбу. А спустя 25 лет, когда поглощение завершилось, он очнулся от криогенного сна, получив фрост-способность EX-класса.&nbsp;</p>
56	Я основал Клуб Бессмертия	club-of-the-immortals	club-of-the-immortals/614cd1a8271703e0f30d3f58af0c7bbc.jpg	Маньхуа	0	0	2021	0	249	<p>Лу Ли самый заурядный и не имеющий никаких жизненных целей работник, который однажды получает необычные способности. С тех пор ему подвластно замедление и ускорение времени, но самое главное - продажа и покупка продолжительности жизни. Приобретение новых способностей побудило главного героя основать элитный клуб - клуб бессмертных.&nbsp;</p>
57	Моя судьба злодея	i-dstiny-villin	i-dstiny-villin/3c8b49f6ff559996b68428c91c5e40d0.jpg	Маньхуа	0	0	2021	0	103	<p>Гу Чангэ попадает в фэнтези-мир, где, по-классике, оказывается в шкуре главного козла отпущения.<br />\r\nУдивительно, что главный герой сразу же снизыскал расположение у императрицы, чем вызвал бурю ненависти в свой адрес. К счастью, Чангэ - уважаемый человек в городе и единственное, что его спасает от кары в данной ситуации это высокий статус в обществе. Подождите-ка... а вы уже знаете, что здесь есть необычная система рангов, в которой присутствуют яркие герои всех мастей? Проанализировав события, герой понимает, что выгоднее всего вжиться в свою новую роль и пойти по пути персонажа-злодея!</p>
58	Легендарный механик	super-god-mechanic	super-god-mechanic/db10e048cb795095c6bb00237cec2362.jpg	Маньхуа	0	0	2021	0	251	<p>Играя в &quot;Звёздное море&quot;, известный бустер Хан Сяо погибает и переносится в мир игры десятилетней давности. Там он становится обычным НПС с системой игрока. Переродившись на базе противников, Хан Сяо выбирает класс &quot;механик&quot;, чтобы получить возможность вернуть свою жизнь. Знаменитый бустер, зная все патчи игры наизусть, попытается уничтожить противников, попутно создавая себе личную армию!</p>
188	Чистый Злодей	pure-vilain	pure-vilain/1cea38fbecc101577dd3096a1a7804a0.jpg	Манхва	0	0	2022	0	74	В этом мире существует особая полиция, борющаяся с преступниками-сверхлюдьми. Лучшему стражу порядка Хан До Рёну, проводившему мирные и спокойные деньки, приходится иметь дело с несносной злодейкой! Это история наихудшей бандитки Роуз Парк, которая влюблена в сильнейшего героя.
68	Прокачка в Аду	rad-in-hell	rad-in-hell/2158fdd5f948b8081bedc78305e33842.jpg	Манхва	0	0	2021	0	57	<p>Кан Хёнму - нищий парень. Его мечты стать охотником разбиты в дребезги. И в один момент, когда он замечтался о том, чтобы быстро разбогатеть, перед его глазами возникло загадочное уведомление: &quot;Уровень сложности: Ад. Локация: Планета Апокалипсис&quot;. Теперь ему суждено прокачивать скиллы на Земле будущего, наводнённой монстрами!</p>
59	Факультет зачистки подземелий	hero-high-school-dungeon-attack-department	hero-high-school-dungeon-attack-department/2505df2e85aca2e70989a1deb2dfe1b7.jpg	Манхва	0	0	2022	0	45	Двадцать первый век. На планету Земля проникли части иного мира и изменили её до неузнаваемости... Настала эпоха существования Подземелий, кишащих монстрами, Охотников, которые эти Подземелья зачищают, а также лучшего элитного заведения, занимающегося воспитанием и подготовкой этих Охотников, - Старшей школы героев.\r\n\r\nОтец Ю Ча Рёна некогда был лучшим Охотником Азии, но в настоящем его репутация испорчена, он болен и забыт.\r\n\r\nРади лечения отца сын занимается контрабандой, незаконно зачищая Подземелья. Но однажды он встречает девушку, которая просит его помочь ей поступить в Старшую школу.\r\n\r\nЭто история о юноше, вынужденном скрывать своё происхождение и забыть о своей мечте, но которому, наконец, представилась возможность себя отыскать в мире Подземелий.
60	Возмездие величайшего копейщика	regression-of-the-history-of-changi	regression-of-the-history-of-changi/bf527ab272d3270bb39b47c22e1e6fee.jpg	Манхва	0	0	2021	0	116	<p>Непревзойденный копейщик.<br />\r\n<br />\r\nСтереотип о необходимости владения мечом разрушает ярчайшая звезда из герцогской семьи. Герой, что положил конец войне империи, и имя ему - Джошуа Сандерс.<br />\r\n<br />\r\nНесмотря на его величие и репутацию, теперь он полумертвый истекает багрового цвета кровью. Ранен он не кем иным, как рукой собственного императора, - Кайзера...<br />\r\n<br />\r\n&quot;Кайзер!.. Не мечтай, что всё закончится так легко!!!&quot;.<br />\r\n<br />\r\nПоследние мгновения смерти сопроводили излияния огромного количества энергии от его соратника - копья, что носило имя &quot;Ругия&quot;...<br />\r\n<br />\r\nЯ... Помолодел?.. Ругия, что ты, черт возьми, такое?!<br />\r\n<br />\r\nДжошуа вернул себе молодое тело, и его месть начнется с этого момента!</p>
61	Реинкарнация Мага Тьмы спустя 66666 лет	the-black-sorcerer-reincarnated-in-66666-years	the-black-sorcerer-reincarnated-in-66666-years/eed4ed7fb90c82160a331e79fa704933.jpg	Манхва	0	0	2021	0	100	<p>Могущественный колдун Диабло Вольфир запечатан на века по замыслу бога.<br />\r\nС тех пор уже прошло 66666 лет, и могучий колдун снова ступил на эту землю!</p>
62	Сильнейшая секта на все века	the-strongest-sect-for-all-ages	the-strongest-sect-for-all-ages/7e120c5fa0dfb60e3d7a2554ebfdb8c2.jpg	Маньхуа	0	0	2021	0	289	<p>Сделать днищенскую секту сильнейшей всего за 100 лет? Нет ничего проще (и веселее)! С помощью супер совершенной Системой лучших сект в мире главный герой должен возвысить свою секту Железной Кости... или помереть.</p>
63	Берегись этой чертовки!	beware-of-the-villainess	beware-of-the-villainess/401bdef0bbc8c988e4680741a1912505.jpg	Манхва	0	0	2020	0	125	<p>Я стала злодейкой романа! Ненавижу ли я это? Нет!<br />\r\nЭто довольно интересно. Дочь герцога - это безработный богатый человек. Как я могу упустить такой шанс?! Это лучший шанс наслаждаться жизнью. Я должна забыть сюжет и просто жить так, как мне хочется! Вскоре после того, как я проснулась злодейкой, я увидела, как мой жених, главный герой романа, изменил мне. Я видела, как он обнимал другую женщину, и он так мило улыбался. У меня потекли слезы... Ха-ха! Шучу! я не плакала! Мои слезы стоят слишком много, чтобы тратить их на этот мусор. Вместо слез я закричала: &quot;Ваше высочество, вы так низко пали?!&quot; Возлюбленная главного героя, которая полностью перевернёт главную историю! Почему? Потому что это пустая трата времени для девушки - быть окруженной дешевыми мужчинами.</p>
64	Созвездие, вернувшееся из бездны	43828-the-constellation-from-hells	43828-the-constellation-from-hells/29c2c83540d45d043b668a5a562ef165.jpg	Манхва	0	0	2021	0	132	<p>Я вернулся из ада спустя несколько тысяч лет, чтобы спасти человечество от гибели</p>
65	Король меча	sword-king	sword-king/4a3de49a637927e5bbe59249c1c5be5b.jpg	Манхва	0	0	2019	0	186	<p>В момент, когда его переместили в другой мир, Рю Хан-Бин был обычным человеком, который недавно вернулся из армии. Хоть он и остался один в пустынном мире с кучей монстров, ему дали задание - стать сильнее. Но есть одна проблема - &quot;система&quot;, которая должна была давать подсказки, полна недоработок.&nbsp;</p>
66	Убить злодея	villain-to-kill	villain-to-kill/65a13e3346f7b1ace1fe73c911d28527.jpg	Манхва	0	0	2021	0	119	<p>Кассиана убили и&nbsp;ложно обвинили&nbsp;в убийстве своего друга. Когда он умирая думал о том, что это конец, его душа переселилась в&nbsp;тело школьника.<br />\r\nПсайкер высшего класса решает перестать геройствовать и ступает на путь злодея.</p>
69	Искатель подземелий	the_dungeon_seeker	the_dungeon_seeker/480ff896495c713e1d324a8e47c07421.jpg	Манга	0	0	2016	0	33	<p>Дзюмпэй Такэда, ученик старшей школы, с детства знаком с Норико Тацумией и хулиганом Кидо Сётой. Однажды во время обычных издевательств над Дзюмпэем, все они перенеслись в другой мир по зову некоего &laquo;Бога&raquo;. Призванные Герои должны были обладать могуществом, но оказывается, что характеристики Дзюмпэя еще ниже, чем у простого крестьянина. Втянутый в смертельный лабиринт той единственной, кому он верил, он ищет путь, чтобы отомстить.</p>
70	Истинное образование	true-education	true-education/10c4e028ff21b8d50fc22dccb513fe1d.jpg	Манхва	0	0	2020	0	125	<p>На Хва Джин, член бюро по образованию, со всей серьезностью борется со студентами, дабы восстановить разрушенный авторитет преподавателей!</p>
71	Гениальный маг, пожирающий лекарства	drugeating-genius	drugeating-genius/64e25087abceef8644905b0c7cb2c1ff.jpg	Манхва	0	0	2023	0	48	<p>Достигнув предела своего таланта в магии, главный герой в наказание был отправлен в игровой мир &mdash; в огромный город под названием Валкан. Чтобы выжить, пытается выстроить отношения с другими людьми и исследует тайну &laquo;закрытого мира&raquo;, стремясь предотвратить конец света.</p>
72	Сильнейший профессор магии	i-got-a-fake-job-at-the-acadmy	i-got-a-fake-job-at-the-acadmy/9829929388180122cd13c59c4d9e6acb.jpg	Манхва	0	0	2022	0	76	<p>Я стал профессором в лучшей академии Теон, потому что меня... приняли за другого?.. Являясь сильнейшим магом и рыцарем, мне было не трудно прикинуться каким-то профессором в академии, но всё оказалось куда сложнее, чем я думал. Сейчас я сижу на двух стульях и пытаюсь собрать информацию, но куда же приведет меня эта опасная ситуация с ходьбой на краю обрыва?</p>
73	Насколько же богат этот граф?!	lords-coins-are-not-reduced	lords-coins-are-not-reduced/aa95568ac06074340fb0a56b19f3b402.jpg	Манхва	0	0	2021	0	115	<p>На рынке измерений, появился новичок, превосходящий любого!<br />\r\nЧеловек, в прошлой жизни Потерявший всё состояние, погибший от рук жалких наёмников и проигравший злейшему врагу...<br />\r\nЭрн Стилгард переродился!<br />\r\n<br />\r\nЗначит, моя книга измерений и все воспоминания остались со мной? Ну держитесь! Я переверну ваш рынок с ног на голову!&nbsp;</p>\r\n\r\n<p>&nbsp;</p>
74	Существование	being	being/3e5466e6fdb2c45105ecb4916b04c94e.jpg	Манхва	0	0	2022	0	71	<p>В один день он - муравей, в другой - огромный динозавр. Настало последнее перерождение существа, пережившего десятки тысяч реинкарнаций. Он родился, обладая умениями каждого существа, которым некогда являлся. Почему ему дана эта способность? Ли Чжа Ин наконец-то понял: &quot;Я существую, чтобы уничтожить человечество!&quot;.</p>
75	О моём перерождении в слизь	regarding_reincarnated_to_slime	regarding_reincarnated_to_slime/high_cover.jpg	Манга	0	0	2015	0	113	<p><strong>37-летний японец-холостяк был зарезан на улице каким-то мерзавцем-грабителем. </strong></p><p></p><p><strong>Тут бы и истории конец, да всё обернулось иначе, неожиданно он переродился слизью в фэнтезийном мире. </strong></p><p></p><p><strong>Но что может сделать, пускай и разумная, но слизь?</strong></p>
76	Я неизбежно стала вороной	if-you-do-you-become-a-crow	if-you-do-you-become-a-crow/91fdc87e3e914b48d86e86a8ac1080d2.jpg	Манхва	0	0	2022	0	93	<p>После смерти в результате несчастного случая она переродилась в отомэ-игре... как ворона!.. Не могу поверить, что я &ndash; ворона! Не какой-то там второстепенный персонаж, а птица... Я пыталась найти человека, который растил бы меня, кормил и заботился, и первым встречным был не кто иной, как наследный принц Камут.<br />\r\n&ndash; Ты такая милая, Рэйнел.<br />\r\n&ndash; Кар, кар-кар! [Так возьми меня к себе в качестве питомца!]<br />\r\nКронпринц действительно взял меня к себе: любил, холил и лелеял. Вот я и подумала, что ничего страшного, если буду заигрывать с ним, ведь я же ворона, в конце да концов! И то, что моё сердце трепещет из-за него &ndash; это ничего, между нами ничего и быть не могло, поэтому я особо ни на что не рассчитывала... Но однажды...<br />\r\n&ndash; Привет, Рэйнел.<br />\r\n&ndash; Ч-что со мной происходит?..</p>
109	Я — ранкер, даже когда сплю	even-if-i-sleep-i-rank	even-if-i-sleep-i-rank/d9996f27393c73291110113b1b2f8c9b.jpg	Манхва	0	0	2022	0	98	<p>&mdash; Онни, он только что отдохнул секунд за 30, да? Это же мне не причудилось?<br />\r\n&mdash; &hellip;Да.<br />\r\nХён Сон после 15 часов работы охотником, снова отправился в бой после 30 секунд отдыха. Это специальный навык Хён Сона.<br />\r\n&laquo;Нарколепсия Тананоса активирована&raquo;.<br />\r\n&laquo;Вы принудительно уснете&raquo;.<br />\r\nТы получил новый предмет после того, как немного поспал?<br />\r\nЧитайте историю несокрушимого потомка Тананоса, Хён Сона, владельца божественного класса.</p>
77	S-Ранг притворяющийся слабаком	school-life-that-pretended-to-be-a-waste	school-life-that-pretended-to-be-a-waste/67a10943ad49d8c0237d6b2d5087d0d6.jpg	Манхва	0	0	2022	0	52	<p><strong>Человечество раскрыло сущность души, Эдею, и достигло её материализации. </strong></p><p><strong>Всё общество оказалось зависимо от неуязвимой для обычного оружия Эдеи. </strong></p><p><strong>Люди стали думать только о её боевой мощи. Главный герой, Пак Чжин Сон, обладал открытой душой и выраженными боевыми способностями. </strong></p><p></p><p><strong>Однако после введения системы рангов и слабой военной подготовки в старшей школе он присоединился к числу слабейших и был вынужден страдать от насмешек сверстников на протяжение 10 лет… Но в действительности его Эдея представляла собой </strong></p><p><strong><em>«Нескончаемую жажду смерти» S-ранга. </em></strong></p><p>Пак Чжин Сон был сильно обеспокоен постоянными мыслями об убийстве и продолжал жить, считая себя неудачником F-ранга. </p><p><strong>Сможет ли Пак Чжин Сон, жаждущий смерти, взять под контроль свои желания и доказать, что душа лежит вне ранговой системы?</strong></p>
78	Игрок, который не может повысить уровень	a-player-who-cant-level-up	a-player-who-cant-level-up/b8246c2ba3f4a04b5e51e06b00483fb7.jpg	Манхва	0	0	2021	0	125	<p><strong>В возрасте восемнадцати лет Ким Ги Кю стал Игроком и был призван в Башню. Он считал, что теперь его жизнь просто обязана наладиться&hellip;<br />\r\nНо что бы он не делал, как бы не старался, даже спустя пять лет его уровень оставался прежним.<br />\r\nНикто, в том числе и сам Ким Ги Кю, не предполагал, что его способностям только предстоит раскрыться и сотрясти Башню до основания!</strong></p>
79	Величайший в истории младший сын маркиза	youngest-son-of-the-marquis	youngest-son-of-the-marquis/40cc958cde03fdcb5eeac0b56d93d3c5.jpg	Манхва	0	0	2021	0	88	<p>Я пришел сюда с единственной целью - отомстить. Я сверг империю Тулкан, единую нацию, которая доминировала на континенте. Я всегда добивался победы. Я добился всего, что мне было нужно, и был доволен. Поэтому я смирился со своей приближающейся смертью. У меня больше не было причин жить. И вот мое сердце перестало биться. Я точно почувствовал, что оно остановилось. Однако, что же произошло? &quot;Это не черная магия, и на иллюзию это тоже не похоже&quot;. В зеркале отражался мальчик с короткими черными волосами. Я выглядел точно так же, как в 14 лет, то есть 20 лет назад. Юноша, еще не потерявший свой детский жир, похлопал себя по щекам и пробормотал: &quot;Как это возможно?&quot;. Я вернулся. В то время, о котором я сожалею.</p>
80	Невероятное обучение	tutorial-is-too-difficult	tutorial-is-too-difficult/cb8243aebbd28af8589a15f214cd6f79.jpg	Манхва	0	0	2021	0	139	<p>Однажды, посреди серых скучных будней, перед глазами появляется уведомление. [Вы хотите пройти обучение?]<br />\r\n<br />\r\nЗа ним сразу же вылезло окно выбора сложности. [Лёгкая] [Обычная] [Сложная] [Адская]. Я без колебаний выбрал адскую сложность.<br />\r\n<br />\r\nИ пожалел.<br />\r\nЗнаю, она называется адской, но это слишком.</p>
81	Злодейка, перевернувшая песочные часы	the-villainess-reverses-the-hourglass	the-villainess-reverses-the-hourglass/9c71787b3e461b396a7e54ac72d486a1.jpg	Манхва	0	0	2020	0	125	<p>С замужеством ее матери-проститутки за графа, статус Арии в обществе тут же вознёсся до небес. Проведя жизнь в роскоши, Ария несправедливо встречает смерть из-за планов своей сестры Миэль. И прямо перед смертью она видит, как песочные часы падают, как будто это была фантазия. И вот так она чудесным образом вернулась в прошлое.&ldquo;Я хочу стать очень элегантной, как моя сестра Миэль.&rdquo;Чтобы противостоять злодейке, она должна стать еще более злой злодейкой. Это был новый путь, который Ария выбрала, чтобы отомстить Миэль, убившей ее и ее мать.</p>
82	Как защитить старшего брата главной героини	how-to-protect-the-main-heroines-brothers	how-to-protect-the-main-heroines-brothers/703306c5f928fc29b06f9cec25624f10.jpg	Манхва	0	0	2021	0	43	<p>Я переродилась в новелле 19+ с реверс-гаремом.<br />\r\n<br />\r\nПроблема в том, что я стала старшей сестрой второго, злого главного героя...<br />\r\nМой чертов отец в конце концов похитил старшего брата главной героини.<br />\r\nТеперь осталось только дожидаться мести от главной героини и разрушения рода?<br />\r\nАх, избежать смертельной концовки и правда тяжело.<br />\r\n<br />\r\n&quot;Я тоже заинтересована в этой игрушке&quot;.<br />\r\n<br />\r\nРаз уж так вышло, то я тебя защищу. Поэтому обязательно отплати мне той же монетой, понял?</p>
83	Супер бог зоомагазина	super-god-pets-shop	super-god-pets-shop/4dcda51b3b969ae4c5f38f66ee6ca48c.jpg	Маньхуа	0	0	2022	0	128	<p>В эпоху небесных зверей сила домашних питомцев определяет все! Все мастера боевых зверей усердно трудились и постепенно улучшали силу своих питомцев. Пока не появился таинственный зоомагазин! Всего за несколько дней совершенствования скелеты низшего уровня действительно могут убить золотого дракона одним ножом?! Работающая девушка в магазине даже утверждала, что она богиня... Что касается босса Су Пина: разве это не рутинное дело по превращению милых домашних питомцев в сильнейших королевских зверей?</p>
84	Нань Хао и Шан Фэн	nan-hao-and-shang-feng	nan-hao-and-shang-feng/6415d5891ac4d8578be5e8d3d7b5c196.jpg	Маньхуа	0	0	2019	0	99	<p bis_size="{&quot;x&quot;:20,&quot;y&quot;:20,&quot;w&quot;:795,&quot;h&quot;:20,&quot;abs_x&quot;:264,&quot;abs_y&quot;:403}">История о буднях двух школьных друзей. Иногда весёлая, иногда грустная, иногда драматичная, но всегда интересная!</p>
85	Незначительный персонаж собственной истории	extra-novel	extra-novel/410ecd5cef038dc8a05f04c01956a4c7.jpg	Манхва	0	0	2022	0	84	<p>В каждом романе часто присутствует свой собственный мир и множество персонажей, живущих в нём. Однако помимо главных героев и их помощников, а также нескольких других второстепенных личностей мы ничего не знаем о них.<br />\r\n&laquo;Чхундон, ты какого уровня?&raquo;<br />\r\nЯ понятия не имею, кто я такой. Мне даже не известно, почему меня именно так зовут. Весь мой рассказ может быть ограничен фактом о поступлении в специализированное военное училище. Моя линия практически не соприкасается с основной линией, и поэтому моё имя сложно найти на страницах этого романа.<br />\r\nЯ просто вне сюжета&hellip; точнее, я лишь одна из множества декораций&hellip;</p>
86	Инструкция по перерождению	regression-instruction	regression-instruction/e976a271950e6882bec3ab7c3fc2f883.jpg	Манхва	0	0	2021	0	88	<p>Однажды меня призвали в этот мир.<br />\r\nОтовсюду посыпалось множество монстров, настало тяжёлое время.<br />\r\nКо всему прочему, мой талант оказался худшим из всех.<br />\r\n[Уровень таланта игрока худший из худших.] [Большая часть характеристик ничтожно низка.]<br />\r\nБудь ты воин или маг.<br />\r\nБудь ты регрессор из будущего.<br />\r\nЯ использую вас всех ради того, чтобы выжить!&nbsp;&nbsp;</p>
87	Смертельная мгла	dark-mortal	dark-mortal/938aacf481dae6141793789fccb9fe9a.jpg	Манхва	0	0	2019	0	81	<p>Из-за пожара Каннам потерял родителей и ослеп. Он не мог видеть ничего, кроме существа по имени Ккамджан. Этот Ккамджан &mdash; галлюцинация или нечто большее? &laquo;Твои шрамы, твои глаза и даже&hellip; твоя сила! Я всё для тебя изменю.&raquo;</p>
88	Башня Бога	tower_of_god	tower_of_god/83068d5bf414739309abbc7de537031b.jpg	Манхва	0	0	2010	0	603	<p><strong>Башня &mdash; место, в котором испытывается воля и где исполняются самые невероятные желания.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Если Башня избрала тебя, то всё, что надо сделать: покорить её, и тогда всё: богатство, власть, сила &mdash; что бы ты ни пожелал станет твоим.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Однако покорение может занять годы, если не века. А ты готов покорить Башню?</strong></p>
89	Некромант-одиночка	necromancer-alone	necromancer-alone/157d40dee67e244627c14fe5e14d3510.jpg	Манхва	0	0	2021	0	106	<p>Мир на грани разрушения. Существа, упоминания о которых встречались лишь в мифах и легендах, теперь заполоняют города, обживаются под людскими жилищами и в метро, пожирая всё живое.<br />\r\nА что до человечества&hellip; Ему будет предложено занять новую роль в нынешнем мире выживания.<br />\r\nСонву выбрал класс &laquo;некромант&raquo;, и теперь трупы, что обагряют Землю, ему только на руку.</p>
90	S-ранги, Которых Я Воспитал	sclasses-i-grew-up-wit	sclasses-i-grew-up-wit/176c066961a08763b8e1631657488f0b.jpg	Манхва	0	0	2021	0	111	<p>Охотник F-ранга. И вдобавок ко всему, старший брат, который даже не может начать догонять своего великолепного младшего брата, который уже стал S-ранговым.<br />\r\nПрожив жизнь, которая развалилась на части, и даже разрушив жизнь своего младшего брата, я получил еще один шанс, регрессировав на пять лет назад, я принял следующее решение:<br />\r\n&mdash; Я стану &laquo;идеальным воспитателем&raquo;.<br />\r\nПравильно, на этот раз, вместо того, чтобы быть посредственным охотником, я буду тихо поддерживать тех, кто способнее.<br />\r\nВот о чём я думал, но... S-ранги немного... странные.</p>
264	Целитель, пожирающий яд	poison-healer	poison-healer/203e8782714bcd8c2cb8827fb0e6da19.jpg	Манхва	0	0	2022	0	50	Чон Хесон — главный герой, смертельно больной из-за различных ядов. Парень, которого никогда нигде не были рады, поведает о том, как он стал сильнейшим охотником на Земле, на которую напали монстры, вырвавшиеся из подземелий!
91	Слишком сильный новичок	newee-is-too-strong	newee-is-too-strong/592166b8d08f8c790f501e71efde91e3.jpg	Манхва	0	0	2022	0	83	<p>Джэджу (с корейского навык/талант) рос без родителей в приюте, полностью оправдывая своё имя. Однажды он услышал, что приют переживает не лучшие времена и вынужден закрыться через 3 года. Пытаясь накопить денег, Джэджу получает оповещение на телефоне. Там он видит видео с собой, покоряющим башню в прямом эфире. Семь лет назад в мире внезапно появилась башня, случайным образом забирающая людей. Те, кто успешно прошёл башню, становятся &laquo;пробуждёнными&raquo;, и богатство для них лишь вопрос времени!</p>
92	Ванпанчмен	one_punch_man	one_punch_man/3dc09e7d0989027e1f0556675ec3ca11.jpg	Манга	0	0	2011	0	277	<p bis_size="{&quot;x&quot;:20,&quot;y&quot;:20,&quot;w&quot;:795,&quot;h&quot;:166,&quot;abs_x&quot;:264,&quot;abs_y&quot;:403}">Хорошо известная поговорка гласит: &quot;Всегда найдётся кто-то сильнее&quot;. Но что если достигнуть таких высот, что даже равных по силе не видать? Обычный парень по имени Сайтама, после того как его уволили, а затем и не приняли на другую работу, решает стать на путь героя. Пройдя через изнурительные тренировки и жестокие битвы, наш герой в совершенстве овладевает своим телом и познаёт что такое настоящая сила. Ну и попутно лысеет. А что поделать, за силу нужно платить. Вроде всё должно быть замечательно, ведь теперь ему ничего не страшно и он сможет справиться с любыми напастями, обрушивающимися на человечество. Но не тут-то было! Как быть, если все монстры и злодеи не могут выдержать даже одного удара героя? Как дальше заниматься любимым делом, если оно стало рутиной? Как вновь ощутить азарт схватки? Сможет ли хоть что-то развеять эту скуку? Сайтама не знает ответы на эти вопросы, но он постарается их найти.</p>
93	Я обрел бессмертие в другом мире	invincible-at-the-strt	invincible-at-the-strt/3604d2f86326410b144a4eda89cae093.jpg	Маньхуа	0	0	2021	0	108	<p>&quot;Динь, пользователь открыл систему!&quot; - на грани смерти Чхэнь Чханань открывает систему, которая делает его непобедимым внутри области. Как обладатель люто имбовой системы, он решается прокачивать её, путешествуя по миру фантазии, сражаясь с культиваторами, монстрами, богами, бессмертными и демонами. За короткое время, он буквально перевернул мир на 180 градусов и не собирается останавливаться.</p>
94	Я злой бог	im-an-evil-god	im-an-evil-god/high_cover.jpg	Маньхуа	0	0	2019	0	399	<p>Среди всех королевств появился самый мужественный и самый красивый злой бог в истории! Несравненный красавец Се Янь попал в логово лисицы. Чтобы не погибнуть, он стал путешествовать между различными царствами. Убив сына Божьего и отталкивая конфедерацию Ян И он...</p>
95	Борьба в прямом эфире	how-to-fight	how-to-fight/9310961eb51fb24ac77612c4bcadb681.jpg	Манхва	0	0	2019	0	197	<p>Ю Хобин &ndash; ничем не выделяющийся школьник, над которым постоянно издеваются его одноклассники-отморозки, чувствующие свое превосходство над ним. Парню ничего не остается, кроме как и дальше игнорировать их, потому что его жизнь и без того полна трудностей. Однако один непредвиденный инцидент полностью переворачивает его жизнь. Он становится знаменитым благодаря случайно загруженному и ставшему хайповым видео! Деньги и популярность &ndash; что может быть лучше?! Но, так как все вышло случайно, повторить успех первого ролика будет уже не так просто. Искушенный запахом денег, которые можно на этом поднять, и его внезапным всплеском популярности, он планирует делать более увлекательный контент, который будет интересен людям и поможет ему собрать больше подписчиков... Но, чтобы достичь этого, Хобину предстоит научиться сражаться, и именно с этого момента начинается история его канала &laquo;HOW TO FIGHT&raquo;!</p>
96	Восхождение в тени	the-eminence-in-shadow	the-eminence-in-shadow/1b39575ae6e8c9ae5be79c842d6e9441.jpg	Манга	0	0	2018	0	60	<p>Подобно тому, как некоторые в детстве боготворят героев, один юноша обожал силы, скрывающиеся в тени. Скрыв свою силу и прожив посредственную жизнь посредственного персонажа, проходя в это время через безумные ночные тренировки, он в конце концов перерождается в ином мире, обретая абсолютную силу. Юноша, отыгрывающий роль скрывающейся в тени силы, его неправильно всё понимающие подчинённые и огромная стёртая в пыль теневая организация... Это история о юноше, обожавшем скрывающиеся во мраке силы, который, вероятно, в итоге обретёт власть над теневой стороной иного мира. </p>
97	Хроники Святого Демона	chronicles-of-heavenly-demon	chronicles-of-heavenly-demon/high_cover.jpg	Манхва	0	0	2018	0	217	<p>&laquo;Лишь твои поступки поддерживают гармонию в жизни&hellip; Именно на это ты должен опираться!..&raquo; Преемник секты Искусного Копья и его ученик Хёк Ун-Сон были застигнуты за изучением запретного Демонического искусства и в последствии были наказаны смертью. &laquo;Жалкие лицемеры, опирающиеся на устои своей секты!..&raquo; Но в момент, когда Хёк Ун-Сон предстал перед вратами в ад, артефакт секты Искусного Копья стал излучать странный свет, одаривший юношу новой жизнью. Две противоположности: секта, исповедующая лишь добро, и секта, погрязшая в изучении демонических техник. Приняв свою судьбу и вспоминая всю ту злобу, что накопилась в нём, Ун-Сон начинает свой путь к становлению боевым мастером, чтобы потом отомстить&hellip; Отомстить ублюдкам, что предали его! История о жизни и смерти, о добре и зле, о случайных встречах и удаче&hellip; Начинается!</p>
98	Как переманить мужа на свою сторону	how-to-make-my-husband-on-my-side	how-to-make-my-husband-on-my-side/95abb63b9e72d3529a4b216be0d9223e.jpg	Манхва	0	0	2021	0	91	<p>Я стала Рудбекией, второстепенным антагонистом, которая умирает от рук собственного мужа в фантастическом романе. Чёртов отец из этого мира вновь завёл разговор о моём партнёре в политическом браке. Однако проблемка в том, что им как раз-таки и является тот самый муж, от рук которого мне суждено погибнуть! Как бы то ни было, сперва я должна найти способ выжить. Если я покажу себя максимально безобидной людям севера, защищу младшую сестру мужа, которую в оригинале романа я убиваю, а затем сделаю вид, что влюбилась в супруга, пощадит ли он меня? &laquo;Я влюбилась в вас!&raquo; Поэтому умоляю, не убивай!</p>
99	Второе пришествие обжорства	the-second-coming-of-gluttony	the-second-coming-of-gluttony/19a01ee41f2041875e7cc6efb59db733.jpg	Манхва	0	0	2019	0	109	<p>Он был наркоманом, неудачником, жалким человеком. Но один мимолётный сон, который мог быть реальностью, пробудил его однажды утерянные чувства. Обладая уникальной способностью, он будет использовать её и странный сон, чтобы проложить свой собственный путь в мир ныне известный как Потерянный Рай.</p>
100	Клинок, рассекающий демонов	blade_of_demon_destruction	blade_of_demon_destruction/2b39e3f41d3e8edc73c55027263b86f2.jpg	Манга	0	0	2016	0	224	<p>Танджиро - старший сын в семье, потерявшей кормильца. Однажды он уходит в другой город, чтобы продать древесный уголь, но в конце концов остаётся на ночь в чужом доме, вместо того, чтобы идти домой. А всё из-за слухов о демоне, который разгуливает в горах под покровом темноты. Утром парень вернётся домой живым и невредимым... Но его ждут ужасные известия.</p>
101	Мастер меча, живущий на крыше	blade-master-from-the-roof	blade-master-from-the-roof/07b4fd6c7c96d3133ac9969fe52629cc.jpg	Манхва	0	0	2020	0	117	<p>Во время учёбы в средней школе главный герой Так Се Ён был избит восемью одноклассниками. Спустя девять месяцев, отойдя от комы, он узнает, что его родители покончили собой, дабы привлечь внимание общественности на произошедшее с сыном. Вследствие, было возбуждено уголовное дело об избиении и, несмотря на усилия нападавших, что хотели сокрыть это дело, они все же были наказаны. И хотя правосудие свершилось, Се Ена не покидало чувство ненависти и боязнь к окружающему миру. Прошло несколько лет, но он так и не смог выйти из дома. Но вот однажды он слышит странный звук и решается переступить порог своей квартиры. А за дверью, на крыше дома, его ожидает &quot;Меч воина&quot; (он живёт в надстройке, а потому за дверью у него не лестница, а крыша). Голос духа шепчет ему: &quot;Хочешь стать сильнее: возьми меч и беги, беги и маши, маши, пока все силы не иссякнут. Вот и все!&quot; И так, он берет этот меч и месть его начинается.</p>
102	Герой вернулся	the-warrior-is-bacc	the-warrior-is-bacc/94b0cebe2fd10b1caecdc6116d2298a9.jpg	Манхва	0	0	2021	0	109	<p>Пак Чон Су, герой, что спас мир только по одной причине - вернуться и отомстить Ким Мин Су.<br />\r\nОн спасся сам, но не смог спасти тех, кто были всем его миром. Пак Чон Су намерен уничтожить того, кто сотворил с ним это.<br />\r\n<br />\r\nИстория без счастливого конца. Пробирающая до костей реальность, в которой герой убивает себе подобных.</p>
280	Первобытный Охотник	the-first-hunter	the-first-hunter/4849331ad884bc43c16c7cea96449b54.jpg	Манхва	0	0	2018	0	101	<p>В один миг, Мир канул в Лету и орда Монстров пришла, чтобы взять контроль над землей, но в этом хаосе пробудилась группа людей, и получила разные способности. Они погрузились в ожесточенную битву, дабы защитить свой дом.</p>
103	Изменщик должен умереть	cheating-men-must-die	cheating-men-must-die/61857568070c6fc2bd518183c2f61b00.jpg	Маньхуа	0	0	2019	0	683	<p>&laquo;Я всегда считала что мерзавцы крутые&raquo;</p>\r\n\r\n<p> Уничтожение одного&nbsp;подонка дарит мгновение удовлетворения, но жизнь, потраченная на уничтожение подонков&nbsp;&mdash;&nbsp;жизнь, полная наслаждения... Сю Люй Сянвей, наша главная героиня, путешествует по мирам и с помощью &quot;Системы отмщения второстепенных женских персонажей&quot; помогает брошенным женщинам восстановить справедливость. </p>\r\n\r\n<p>Сю Люй Сянвей: &laquo;Единственное, что может утешить меня&nbsp;&mdash;&nbsp;слезы раскаяния мёртвых и боль проституток&raquo;</p>\r\n\r\n<p>Система: &laquo;Жива ли моя хозяйка сегодня? Нет&raquo;</p>
104	Запомнить	memorizes	memorizes/f8d5ba8023f19ea07bc41de7dc13ea15.jpg	Манхва	0	0	2020	0	101	<p>Мир, отличающийся от настоящего - Адская Долина. В один из дней после демобилизации из армии, Ким Су Хен был внезапно перемещен в мир под названием &quot;Адская Долина&quot;. Хоть он и смог в конце концов вернуть все в прежнее русло, 10 лет, которые он провёл в адской долине, стали пятном, напоминающим про ужасное прошлое. Для того, чтобы изменить ужасное прошлое, Ким Су Хен решает использовать силу &laquo;кода зеро&raquo;.&nbsp;<br />\r\n<br />\r\n&ldquo;Это глупо использовать предмет, который имеет мощнейшую силу просто ради того, чтобы откатать время назад. В последний раз спрашиваю. Пользователь Ким Су Хен, вы действительно хотите повторить свои мучительные 10 лет?&raquo;&nbsp;<br />\r\n<br />\r\nСерафима, закончившая говорить, теперь смотрела на меня с умоляющими глазами. Вдруг из меня вышел смешок, не имевший никаких предпосылок. Это буквально был смех без какой либо причины.</p>
105	Владея Ничем	a-nobriner-retur	a-nobriner-retur/cd910937afb7de4ee87872470511a4be.jpg	Манхва	0	0	2022	0	62	<p>Ли Сун Мин &ndash; обычный школьник. Он попадает в мир под названием Эрия. Без особых способностей и сил он, тем не менее, выживает в этом мире в течении десятилетий. Но встречает позорную смерть. Однако, на этом его история не заканчивается, после смерти он получает второй шанс &ndash; артефакт под названием Камень Прошлой Жизни возвращает его в прошлое. Но и на этот раз он оказывается на грани выживания, лишённый любых преимуществ. Между ним и теми, у кого есть таланты и способности &ndash; пропасть. Он чувствует себя обделенным, и тем не менее, продолжает бороться за место под солнцем. &ldquo;Что бы мне не пришлось пережить, на этот раз я обязательно проживу свою жизнь лучше!&rdquo;.</p>
106	Бесконечное Поднятие Уровня в Муриме	infinite-levelup-in-moorim	infinite-levelup-in-moorim/6dac53712081b2033533d856377a4520.jpg	Манхва	0	0	2020	0	173	<p><strong>Тан Ю Сон, младший воин, не имевший таланта, с низким уровнем подготовки, погиб на поле боя.</strong></p><p></p><p><strong>Но когда он открыл глаза, он был сильно удивлён!</strong></p><p></p><p><strong>Он вернулся в свое прошлое, когда ещё был ребёнком!</strong></p><p></p><p><strong>Теперь он может изменить будущее!</strong></p>
107	Королева со скальпелем	queen_with_a_scalpel	queen_with_a_scalpel/high_cover.jpg	Манхва	0	0	2018	0	144	<p>В первой жизни она была ужасной королевой, навлёкшей на страну беды, и, в конечном итоге, сожжённой своим же королём на костре. Во второй жизни она стала талантливым хирургом, искупающим свою вину за прошлое, спасая людей. Но из-за авиакатастрофы талантливый хирург Сон Чжи Хён возвращается в свою первую жизнь! В этот раз она решает всё изменить, став врачом.</p>
108	Выживая в игре за варвара	survive-as-a-barbarian-ingame	survive-as-a-barbarian-ingame/f18e029757b55952e2b93f91c294e481.jpg	Манхва	0	0	2023	0	39	<p>Главный герой Ли Хан Су наконец-то достиг комнаты финального босса после девяти лет игры в &laquo;Подземелье и камень&raquo;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Но стоило войти, как появилось уведомление, что он завершил обучение и получает тело варвара Бьёрна.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>В игре &laquo;Подземелье и камень&raquo; после разрушения мира остался только один город. Каждый месяц открывается лабиринт, предлагая исследователям возможность пройти его и получить вознаграждение.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Варвары считаются бесполезными во всём, кроме битвы. И если выяснится, что человек захватил тело персонажа, его окрестят &laquo;злым духом&raquo; и убьют.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>С навыками, которые он накопил за девять лет задротства, и невероятно мускулистым телом варвара, Ли Хан Су сделает всё возможное, чтобы сражаться в лабиринте и выжить!</p>
110	Фермерство в башне в одиночку	farming-in-the-tower-alone	farming-in-the-tower-alone/cbf204cb9991b8fb87c1054bbc970d7c.jpg	Манхва	0	0	2023	0	37	<p>Внезапно в один прекрасный день в городе появилась таинственная башня. Люди решили назвать её подземельем, и хоть внутри находилась сплошная пересеченная местность с ордой опасных монстров, она была также и землей возможностей, где находились несметные сокровища. Седжун, молодой человек, ведущий повседневную жизнь, был очень взволнован, когда неожиданно получил приглашение в подземелье. По приглашению он оказывается в ловушке в секретной зоне таинственной башни. У него есть только его тело и несколько семян. Теперь Седжуну предстоит выращивать урожай, собирать припасы и разрабатывать свой собственный план выживания!</p>
111	Призванный в параллельные фэнтези миры несколько раз	summoned-to-a-parallel-fantasy-world-many-times	summoned-to-a-parallel-fantasy-world-many-times/93abe6180e5195829eb46bb340fc5e43.jpg	Манга	0	0	2020	0	46	<p>Весь класс парня призывают в другой мир, за исключением того, что он единственный, кого перенесли во второй раз в другой мир. Как только он привыкает к своей новой жизни, его снова и снова вызывают в другой мир.</p>
112	Мастер Укрощения	tming-master	tming-master/230830734533b3772c585c7caadb8153.jpg	Манхва	0	0	2020	0	127	<p>Самая популярная в&nbsp;мире игра виртуальной реальности, &laquo;Кайллан&raquo;. Всем известный игрок виртуальной реальности, Ян. Он&nbsp;удалил своего персонажа 93 уровня, чтобы получить скрытый класс&hellip; Однако этот класс в&nbsp;итоге оказался самым бесполезным в&nbsp;Кайллане&nbsp;&mdash; призывателем! Кроме того, внезапный звонок от&nbsp;его профессора практически сводит его с&nbsp;ума! Чтобы избежать испытательного срока в&nbsp;академии, ему необходимо поднять тот&nbsp;же уровень, что был у&nbsp;его удаленного персонажа, всего за&nbsp;два месяца!</p>
113	Регрессия Падшего Созвездия	return-of-the-broken-constellatio	return-of-the-broken-constellatio/4bc6cd08a6008ca8de885301df258a66.jpg	Манхва	0	0	2021	0	91	<p><strong>«Сумрачный бог» - простой человек, возвысившийся до звания бога. Прославившись как злой бог, он потерял все: свое созвездие, веру и статус. Его божественность была отозвана, а божественная сила исчезла.<br/><br/>«Я бы хотел, чтобы ты поработал со мной». Именно эти слова он услышал от хозяина подземного мира, Танатоса, когда он протянул ему свою руку...<br/><br/>Взяв Танатоса за руку, «Сумрачный бог» решил снова жить как игрок «Ли Чхан Сон», чтобы отомстить богам, которые бросили его в преисподнюю!<br/><br/>«Итак, я действительно ЩАС ВСЕХ ПЕРЕРЕЖУ!.</strong></p>
114	Маг, поглощающий Таланты	talent-swalowed-wizard	talent-swalowed-wizard/d7db7c473fac8b293670359427467b06.jpg	Манхва	0	0	2022	0	51	<p>Элрик Мелвингер.<br />\r\nЕдинственный наследник уважаемой магической семьи.<br />\r\nХоть юноша и обладал врождённым талантом, он был настолько выдающимся, что мешал Элрику изучать магию. Тем не менее, он получил благословение от своих предков.<br />\r\n<br />\r\n[Поедай демонов.]<br />\r\n[Поглощай демонов.]<br />\r\n[Пей демонов.]<br />\r\n[Продолжай накапливать демонов в себе и постигай новую магию.]<br />\r\n<br />\r\nДостигать вершин.<br />\r\nВзобраться настолько высоко, чтобы никто не смог меня достать.</p>
115	Король-рыцарь, вернувшийся с богами	the-king-of-knights-returns-with-the-gods	the-king-of-knights-returns-with-the-gods/b3a7f67235df3c39bff8e2bacbff044d.jpg	Манхва	0	0	2023	0	35	<p>После 300 лет охоты на демонов в другом мире, он вернулся на Землю. Однако он пришёл не один.</p>
116	Перерождение бессмертного горожанина-культиватора	rebirth-of-the-urban-immortal-cultivator	rebirth-of-the-urban-immortal-cultivator/a074927d7853c8e013a2c22c51f05646.jpg	Маньхуа	0	0	2017	0	917	<p>Чэнь Фань потерпел неудачу в процессе своего вознесения и по необъяснимым причинам вернулся на 500 лет назад, во времена его молодости. Магия, святые и сильнейшие боевые эксперты &mdash; всё это осталось лишь в его воспоминаниях. Чэнь Фань не забыл обиды своей прошлой жизни&hellip; Обуреваемый желанием отплатить, он начинает свой путь сначала.</p>
124	Мой навык – копировать способности других	i-can-replicate-talent	i-can-replicate-talent/33073c40c9c3c98b0aa8081ca20101bd.jpg	Маньхуа	0	0	2021	0	62	<p>Молодой парень Е Тянь приобрел навык копировать способности других, и с тех пор изменил свою судьбу, дабы защитить младшую сестру и постараться выжить в конце света, вызванном вторжением чудовищ. Чтобы стать сильнее, он начал исследовать неизвестные миры, и постепенно раскрыл секрет вторжения других измерений.</p>
117	Реинкарнация безработного ~История о приключениях в другом мире~	mushoku_tensei_if_i_get_to_a_parallel_universe_ill_bring	mushoku_tensei_if_i_get_to_a_parallel_universe_ill_bring/23c0da60ceb0af276cb1173ccc524406.jpg	Манга	0	0	2014	0	103	<p>34-летний отаку-затворник был выгнан из дома своей семьёй. Этот жирный и уродливый девственник без гроша в кармане осознал, что его жизнь подошла к концу. Затем он понял, что его жизнь вообще могла бы быть намного лучше, если бы он мог избавиться от тёмных страниц своей жизни. Пребывая в сожалениях, он увидел, как грузовик со спящим водителем быстро надвигается на трёх школьников. Собрав все свои силы, он попытался спасти их и погиб.А открыв глаза, он уже переродился в мире меча и магии, как Рудеус Грейрат. Родившись в новом мире, начав новую жизнь, Рудеус решил, что &quot;В этот раз, я проживу свою жизнь на полную, безо всяких сожалений!&quot; И так началось приключение человека, пожелавшего заново начать свою жизнь.</p>
118	Свинарник	pigpen	pigpen/bb9796970369dbdb3373f2d3ea57e9a9.jpg	Манхва	0	0	2019	0	68	<p>Главный герой оказывается на необитаемом острове, где перед ним предстает загадочная семья.</p>
119	Мальчик с ружьем	hunting-rifle-boy	hunting-rifle-boy/664a452d82ec1011a6e752209752aae8.jpg	Манхва	0	0	2021	0	69	<p>Новый проект от популярного автора Ким Карнби. Расскажет нам о мальчике, который станет оружием.</p>
120	Некромант - я катастрофа	necromancer-i-am-the-disaster	necromancer-i-am-the-disaster/6df09f7fefa4128f89516254b7fd60ce.jpg	Маньхуа	0	0	2023	0	42	<p>Игра становится реальностью, правила этого мира меняются, человечество вступает в эпоху смены профессий. </p><p>Смени профессию! </p><p>Прокачивайся и становись сильнее! </p><p>Стань повелителем этого мира! </p><p>В день смены профессий Линь Мо Юй стал единственным, кому выпала скрытая профессия - профессия некроманта. Все существа, что им призваны, никогда не умрут, как и он сам. </p><p>&quot;Я восседаю на троне из костей, шагаю на границе жизни и смерти&quot;. </p><p>&quot;Я - настоящая катастрофа!&quot;</p>
121	Стала женой главного героя	a-became-my-heroines-wife	a-became-my-heroines-wife/90f1a613decb697af1e75a0398686823.jpg	Манхва	0	0	2021	0	92	<p>Я попала в тело Фионы, главной злодейки, чья душа была приговорена к вечным страданиям после ужасной кончины от рук главного героя. Её семья издевалась над ней только потому, что она была незаконнорожденной.</p>\r\n\r\n<p>И вот, переселившись в тело за 6 лет до начала романа, меня отправили на войну в возрасте 13 лет! К счастью, Фиона как главная злодейка романа оказалась гениальным магом. Я должна пережить нашествие монстров, но сейчас не могу находиться в центре поля боя. Как раз перед тем как я выдохлась, я столкнулась с главным героем-подростком.</p>\r\n\r\n<p>&hellip;Почему он здесь? Что ж, если главный герой здесь умрёт, то мир будет разрушен. Так что давайте сначала спасём его!</p>
122	Путь Варвара	barbarian-ques	barbarian-ques/8729ed7be6409bdf786890d16af93c3e.jpg	Манхва	0	0	2022	0	84	<p>Ульрих - величайший воин племени каменных топоров.<br />\r\nОн смог выйти за пределы &quot;Небесных Гор&quot;, превосходя всех своих соплеменников.<br />\r\nНо оказавшись там, он увидел...<br />\r\nЛюдей, говорящих на незнакомых языках, облаченных в доспехи, сплавленные из железа!<br />\r\n-Так, значит, мир за горами не был чистилищем для мертвых душ!<br />\r\nНовый неизведанный мир и человек, решивший его сотрясти.<br />\r\nВарвар Ульрих отправляется в цивилизацию!&nbsp;</p>
123	Реинкарнация Военного	god-of-blackfield	god-of-blackfield/685951a1b2d45f5bc1fb0cfb554aef68.jpg	Манхва	0	0	2020	0	197	<p>Те, кто сражался с ним на поле боя в Африке, в страхе и трепете называл его &laquo;богом Черного Поля&raquo;. Однако, Кан Чан, руководивший операцией по убийству Масаллана, лидера суннитской группировки SISS, был убит таинственной пулей, которая пролетела позади него. В промежутках между тем, как его глаза медленно закрывались и открывались, он постепенно один за одним терял своих коллег, которые верили и следовали за ним. В конце концов его глаза беспомощно сомкнулись. Потерпевший предательство Кан Чан ждал своей смерти, однако каким-то неведомым образом он переносится через 3 года и возвращается в Корею. Ему 19 лет, он изгой и это совсем другой &laquo;Кан Чан&raquo;. Так начинается путешествие Кан Чана в поисках правды о реинкарнации и мести предателю!</p>
125	Мой сольный бесконечный рост	im-alone-the-trait-grows-infinitely	im-alone-the-trait-grows-infinitely/9a9941957c5fefd6f26dc8a8cd14de04.jpg	Манхва	0	0	2022	0	61	<p><strong>От студии, создавшей &laquo;Поднятие Уровня в одиночку&raquo;, &laquo;Возвращение героя уровня катастрофы&raquo;!</strong></p>\r\n\r\n<p>Я думал, что никогда не смогу стать охотником. Никогда не надеялся, что у меня появится шанс. Однако я ошибался. &quot;Башня испытаний&quot; отобрала определённых людей с Земли.&nbsp;Пожалуйста выберите уровень сложности. Вознаграждение будет полностью зависеть от степени сложности, выбранной вами. Теперь у меня появился шанс. Это нечто особенное.</p>
126	Я стала приемной дочерью главного героя	43915-i-became-the-male-leads-adopted-daughter-webtoon	43915-i-became-the-male-leads-adopted-daughter-webtoon/61ae0d1a82821dbbaf566175d155aad6.jpg	Манхва	0	0	2021	0	87	<p>- Я собираюсь усыновить ребёнка.</p>\r\n\r\n<p>Импульсивное решение герцога Пеллио Борреотти потрясло всех в особняке. Он не только сделал её своей дочерью, но и дал ей имя &quot;зверя&quot;, которое могли получить только прямые члены родословной.</p>\r\n\r\n<p>- Даже сейчас, пока ты дышишь, я зарабатываю деньги.</p>\r\n\r\n<p>- Это уверенность, а не высокомерие.</p>\r\n\r\n<p>- У моего лица действительно есть свои преимущества.</p>\r\n\r\n<p>- В любом случае, она - кладезь талантов. Моя дочь - гений. Её лицо похоже на моё, поэтому она так красива.</p>\r\n\r\n<p>- Но...</p>\r\n\r\n<p>&quot;Я люблю мышцы больше всего!&quot;, &quot;Покажи мне свои мышцы бёдер! Твоя задница могла быть ещё лучше!&quot;</p>\r\n\r\n<p>- Я признаю, моя дочь - извращенка.</p>\r\n\r\n<p>Самый высокомерный отец во всём мире и его испорченная дочь.</p>
127	Возвращение ранкера SSS-ранга	sssclss-rnkrs-rturn	sssclss-rnkrs-rturn/21cd0a8bfb60dd9bf9799a6feb4b638b.jpg	Манхва	0	0	2022	0	84	<p>Рокан был &quot;королем насилия&quot;, который правил как сильнейший в игре виртуальной реальности &quot;Властелин&quot;. К сожалению, из-за приказа об убийстве, отданного вражеской гильдией, он потерял все. К его удивлению, когда он проснулся в следующий раз, он вернулся на три года назад!<br />\r\n<br />\r\n&quot;Чертовы отродья, только подождите. Я вас всех сожру!&quot;<br />\r\n<br />\r\nНовая история начинается с того, что Рокан, который путешествовал в прошлое, снова взбирается на вершину!</p>
128	Белая кровь	white-blood	white-blood/high_cover.jpg	Манхва	0	0	2020	0	94	Корею поглотил хаос. Уже как десять лет вампиры терроризируют мирных граждан, а правительство бессильно. Пак Хаян (имя означает "белый") - 20-летняя студентка колледжа, желающая просто иметь друзей и проводить свои дни, как самый обычный человек, хоть и является вампиром. Все меняется, когда Хаян обнаруживают и на нее открывают охоту как люди, так и её сородичи.
129	Девушка из анонимного чата!	the-girl-from-random-chatting	the-girl-from-random-chatting/41cf611d5762cd30d580c36367ef82a7.jpg	Манхва	0	0	2017	0	314	<p>Джун У ненавидит школу и с трудом заводит друзей. Единственное, что приносит ему счастье &mdash; разговоры с незнакомцами в анонимном чате. В этом АнонЧате Джун У знакомится с девушкой, которая оказывается его одноклассницей, по имени Сон А. Сон А даже не догадывается о том, кто её новый знакомый! Сможет ли Джун У побороть свою социофобию и стать ближе к ней в реальной жизни?</p>
130	Восхождение тирана	became-a-tyrant-of-defense-games	became-a-tyrant-of-defense-games/6860f68aa19e889828d2c99dbf8ec62c.jpg	Манхва	0	0	2022	0	71	<p>Tower Defense &amp; Dungeon Offense RPG. Я был единственным, кто прошёл эту игру на максимальной сложности... И вот однажды, я оказался в центре сражения из игры! Многие предпочли бы сдаться, но я не такой... Я игрок, который не умеет сдаваться, и именно я смогу поработить всех и вся, став величайшим тираном и властелином этого сраного мира!</p>
154	Последний человек	the-last-human	the-last-human/444756d136d77d8411a0404957ccb836.jpg	Маньхуа	0	0	2017	0	525	<p>Цзо Тянь Чэнь&nbsp;&ndash; последний выживший человек в городе, зараженном зомби-инфекцией. Будучи на грани смерти, он внезапно оказался в своем теле десять лет назад, когда город еще не был заражен. Он решил, что в этот раз спасёт близких ему людей и воссоединится со своей старой любовью.&nbsp;Следите за его приключениями, в которых он использует свои воспоминания о следующих 10 годах, чтобы выжить и спасти своих близких!</p>
219	Злодейка-марионетка	villainess-is-marionette	villainess-is-marionette/520a02f8763170c46c96a2b2c6573cad.jpg	Манхва	0	0	2021	0	81	<p>Принцесса Каена, прославившаяся своей красотой на всю Империю, не знает ничего, кроме алчности и злобы. Долгое время она пыталась избавиться от своего младшего брата-тирана, но встретила смерть от руки своего мужа.  - Я помогу тебе стать Императором.  - Сестра... вы обо мне?..  - Но в обмен... ты подаришь мне свободу.  До того, как &quot;я&quot; стану принцессой Каеной.</p>
131	Бессмертный мечник в обратном мире	immortal-swordsman-in-the-reverse-world	immortal-swordsman-in-the-reverse-world/61469d500945453e6ed0a1220513dfc9.jpg	Маньхуа	0	0	2019	0	382	<p>&laquo;Чу Цин - мастер по фехтовальщик мечей, который 300 лет назад случайно попал в сказочный мир. В течение этих 300 он начал свое совершенствование. Когда он достиг обители природы, не ожидалось, что он вместо этого откроет коридор пространства и времени и вернется на землю в возрасте 17 лет. Но когда он увидел ситуацию, оказалось, что это была не земля, на которой он когда-то жил, а мир перевернулся между ролями женщин и мужчин. Каким было его путешествие, чтобы найти способ вернуться в изначальный мир, победить и покорить сильных женщин мира ... &raquo;</p>
132	Отец, я не буду выходить замуж!	dad-im-not-going-to-get-married	dad-im-not-going-to-get-married/97d6285d02531f1af33a0219c5ed8863.jpg	Манхва	0	0	2021	0	121	<p>Я переродилась как Джубелиан Элой Флойен &ndash; злодейка прочитанной мной новеллы. Я была обречена на смерть, но не тут-то было! Используя воспоминания о прошлой жизни, я собираюсь избежать своей гибели!</p>\r\n\r\n<p>&laquo;Я не выйду замуж за мужчину&nbsp;без чести, семьи, имущества и силы!&raquo;</p>\r\n\r\n<p>Как только я заявила о своём желании жить великолепной и роскошной жизнью, мой отец решил сделать меня невестой кронпринца! Он сумасшедший?! Ведь я буду рассматривать помолвку только в качестве крайней меры.</p>\r\n\r\n<p>&laquo;Почему ты избегаешь помолвки с наследным принцем?&raquo;</p>\r\n\r\n<p>&laquo;Он меня пугает! Он сразу же убивает тех, кто ослушался его!&raquo;</p>\r\n\r\n<p>Через несколько дней наследный принц отправил письмо. &laquo;Не переживай, тебя я не убью&raquo;.</p>\r\n\r\n<p>О, нет... неужели я уже что-то натворила? Что-то, за что должна умереть?</p>
133	Возвращение темного мага	i-returned-but-it-was-the-day-before-enlistment	i-returned-but-it-was-the-day-before-enlistment/6b3e9d15997767a263ec9e362c276cdf.jpg	Манхва	0	0	2023	0	43	<p>Ким Минджун &ndash; обычный корейский старшеклассник &ndash; неожиданно был призван в другой мир, где ему пришлось стать <strong>тёмным магом</strong>.</p>\r\n\r\n<p>Преисполненный желания вернуться домой, он преодолел множество трудностей и в конце концов спас мир с помощью тёмной магии, а после, отринув всю честь и славу, благополучно вернулся домой.</p>\r\n\r\n<p>Но Ким Минджун не смог насладиться мирными деньками: неожиданно из подземелья вырвалась орда монстров.</p>\r\n\r\n<p>У Минджуна не осталось иного выбора, кроме как... <strong>снова броситься в бой в первый же день возвращения!!!</strong></p>
134	Возвращение Еретика	the-return-of-the-immortals	the-return-of-the-immortals/ed2e70b6839121f2cdf8f9694ecc7e8f.jpg	Манхва	0	0	2022	0	77	<p>Тан У Хён &mdash; Дух Всемогущий, стал самым страшным из бедствий этого мира. Он думал, что будет вечно править на земле. Но всё изменилось, когда Восемь Бессмертных, охраняющих покой и порядок в Срединных Землях, запечатали его на дне озера Дончонхо... Минула тысяча лет. За это время Тан У Хён успокоился, а его тяга к кровопролитию канула в небытие. Лишь гнетущее и изнуряющее одиночество осталось у Всемогущего Духа. В один из дней бесцельно бродящий Тан У Хён, встречает маленькую девочку Хва Со Ми. Одинокий странник почувствовал небывалую связь с малюткой, ведь она также одинока, как и сам путник. История необычной семьи из Срединных Земель. Воин с ледяным сердцем и милая искренняя девочка никого не оставят равнодушным.</p>
135	Одиночный игрок-багоюзер	i-am-alone-with-bugs	i-am-alone-with-bugs/981084e136aace693c31ac13f16e8bb3.jpg	Манхва	0	0	2020	0	120	Если можно добиться успеха, используя окольные пути и ухищрения, то я только за!
136	Истинный злодей	how-villains-live	how-villains-live/135781bc79e45a8909fde64f4465241c.jpg	Манхва	0	0	2021	0	114	<p>Будь ты хоть мерзавцем, хоть убийцей или насильником, ты всё равно имеешь&nbsp;право участвовать в ней. Участвовать в игре, которая определит преемника бога. И я отношусь к самым худшим из людей. Подлая, грязная, слабохарактерная мразь, которая никогда не стеснялась проявлять свою истинную натуру</p>
137	Я просто хочу спокойно играть в игры	i-just-want-to-play-game-quietly	i-just-want-to-play-game-quietly/9953459f5cd2aa9049afb1727060e1a4.jpg	Маньхуа	0	0	2022	0	126	<p>Пространственные штормы обрушились, и на Земле появилось много внепространственных областей. Все виды таинственных внепространственных жизней рождаются в этих областях. Чтобы стать сильными, люди начали проникать в эти опасные районы, чтобы охотиться и убивать внепространственных существ. Но я, Чжоу Вэнь, превратил эти области в подземелья в моей мобильной игре. Повышая уровень своего игрового персонажа, я буду повышать свою силу в реальности. Когда другие рискуют своей жизнью, я здесь становлюсь сильнее, играя.</p>
138	Моя типичная реинкарнация	reincarnation-plan	reincarnation-plan/bea01ed999dc1b5f48553a516cd89c26.jpg	Манхва	0	0	2022	0	79	<p>Сильнейший мечник Самион.<br />\r\nДавен был двоюродным братом Самиона, и он был наполовину одиноким человеком без правой руки.<br />\r\nПреодолевая насмешки и презрение однорукого, он превзошел даже гениальность прямой линии Самиона.<br />\r\nВ конце концов, он был предан своими родителями и семьей и встретил самый жалкий конец.<br />\r\nНо это был не конец.<br />\r\n<br />\r\n&mdash; У меня есть правая рука?<br />\r\n<br />\r\nВраг новой семьи.<br />\r\nТело природного таланта.<br />\r\nпредыдущий жизненный опыт.<br />\r\nИ даже Бог с ним.<br />\r\n<br />\r\nКогда я переродился, все изменилось.</p>
139	Я скоро умру	i-will-die-soon	i-will-die-soon/high_cover.jpg	Манхва	0	0	2019	0	66	<p>&laquo;Потерпев неудачу в этой жизни, я смогу добиться успеха в следующей.&raquo;Это история моей тринадцатой жизни, лично я называю её &laquo;Наедине со скорой Смертью&raquo;.</p>
140	Я не тот, за кого меня принимают	im-not-that-kind	im-not-that-kind/47d381a7e7a8680891dd414541099b85.jpg	Манхва	0	0	2022	0	60	<p>Я, Деон Харт, слабый, больной человек, у которого идёт кровь от малейшего стресса. Однако, в то же время, меня ошибочно приняли за сильнейшего человека. И теперь, в демоническом царстве я известен как Демон Арут, командир 0 отряда Короля Демонов.</p>
141	Маг, пожирающий книги	the-bookeating-wizard	the-bookeating-wizard/4b88d38518ed4f38453f316531d5fcda.jpg	Манхва	0	0	2021	0	108	<p>Теодор Миллер -&nbsp;лучший ученик магической академии по части теории, но худший на практике, уже в третий раз ему приходит уведомление&nbsp;о том, что его оставляют на второй год. С каждым днём его мечта стать магом становится всё дальше и дальше. Однако, одним прекрасным вечером, этот одновременно талантливый и безнадежный студент обнаруживает, что теперь он может питаться... книгами, при этом обучаясь описанным в них заклинаниям.</p>
142	Да здравствует король!	hail-the-king	hail-the-king/high_cover.jpg	Маньхуа	0	0	2016	0	126	<p>Он был самым обычным студентом, пока однажды случайно не оказался в другом мире в...теле короля?! Теперь с помощью своей новой &quot;способности&quot;, ему суждено вершить великие дела. Это история о короле, покорившем континенты и оставившем легенду, которая будет передаваться в веках!</p>
143	Раб "Б" ранга	b-rank-slave	b-rank-slave/95608974f0072eecfe44bfe35c0f2633.jpg	Манхва	0	0	2020	0	80	Ниро родился в мире, гармония которого была нарушена Повелителем Теней "Секнеоном". В младенчестве полуэльфа приютила пара рабов, но через несколько лет они умерли, и мальчик остался сиротой. Теперь Ниро предстоит защитить свою маленькую семью.\r\nЧтобы снять клеймо раба, юноша должен окончить академию "Эксканум", подобно нынешнему императору, который в прошлом тоже был рабом.
144	Ублюдок покоряет магическую академию!	the-demon-kings-goes-to-the-academy	the-demon-kings-goes-to-the-academy/a5a16c7e0eebb469a66c617b775021d7.jpg	Манхва	0	0	2023	0	46	<p>Ну вот надо же умудриться сдохнуть, отвечая хейтерам...<br />\r\n<br />\r\nЕщё и какая-то гнида появилась, представившаяся &quot;Мрачным жнецом&quot;... Сказал, что быть плохим писателем - грех. Дабы искупить вину и попасть на небеса, мне нужно пережить финал одного из моих романов.<br />\r\n<br />\r\nИ вот, я вошёл в роман &lsquo;Смерть принца демонов&rsquo;...<br />\r\n<br />\r\n&ldquo;Какого хрена, ублюдки! Почему я не мог просто сдохнуть?!&rdquo;<br />\r\n<br />\r\nПерсонаж, чьё место я занял, был Принцем Демонов, который подох от своей беспомощности в самом начале сюжета!<br />\r\n<br />\r\nЭто пи**ец, товарищи... Конкретный.</p>
145	Ещё раз в свет	once-again-into-the-light	once-again-into-the-light/b604278f1790b48d84a9f5565bbbb18f.jpg	Манхва	0	0	2021	0	80	<p>Меня ложно обвинили в попытке убить мою младшую сестру, которой поклонялись как Святой. Не было ни одного человека, который поверил бы мне и не было ни одного человека, который заступился бы за меня. Даже моя кровная родственница. Мне было 14 лет. На дворе была зима. Я, Четвертая принцесса Эденбелла, была прискорбно обезглавлена на глазах у толпы. После моей смерти я проснулась, и то, что произошло&hellip; &ldquo;Моя малышка, моя драгоценная младшая сестренка&quot;&hellip; С восхитительной улыбкой он держал меня на своих руках. Этот теплый жест, тепло и прикосновение. Он пел мне колыбельную, нежно обнимая меня и покачивая.</p>
169	Я - монстр	became-an-evolving-space-monster	became-an-evolving-space-monster/bf1bb3e5bbf56893993e58260e26df8c.jpg	Манхва	0	0	2023	0	19	<p>Посреди просторов космоса, в грузовом отсеке холодного металлического корабля, я был вынужден признать, что стал враждебным инопланетным существом в научно-фантастической игре на выживание.</p>
146	Кости	the-bone	the-bone/213b77c905be8ef5e45806095e9ee994.jpg	Манхва	0	0	2023	0	3	<p>Джи Хён, преследуемый болью и внутренним гневом, вступил на путь охотника с мечтой стать непобедимым. Но жестокая судьба распорядилась иначе, лишив его самого драгоценного - материнской любви и здоровья. Погрязнув в отчаянии, но не покорившись судьбе, Джи Хён встал на кромке пропасти мести. Ставший тенью самого себя, он восстал из пепла и вновь затмил небеса своим непримиримым решимым. Это история о рождении нового героя, воплощающего всю ярость и решимость, чьи действия будут резонировать по всему миру.</p><p></p><p></p>
147	Легенда о Суре: Ядовитый Дракон	legend-of-sura-poison-dragon	legend-of-sura-poison-dragon/54a86d17177c7b069b83fc407d89ff10.jpg	Манхва	0	0	2021	0	134	<p>Чин Джа Ган &ndash; единственный выживший из семьи древнего рода Як, людей которого нещадно истребляют. В столь юном возрасте ему пришлось столкнуться с несправедливостью, узнав, что есть ад отчаяния, питаемый видами рек крови и гор трупов. Дойдя до апогея терпения, в нём пробудился демон, который не успокоится, пока не воздаст должное каждому, пока не убьёт каждого&hellip;</p>
148	Я вышел из игры	i-come-from-game	i-come-from-game/7bf3f0fe9387358e40c6c49a526ffb50.jpg	Маньхуа	0	0	2021	0	86	<p>Лин Цэ вернулся в прошлое на три года назад, сохранив все свои воспоминания и умения. Награда это или испытание? Раньше он не мог даже защитить себя, но теперь он может добиться всего и стать самым сильным Пробужденным.</p>
149	Реалити-квест	rlity-qust	rlity-qust/71b98e413b42de422152d8af93de6f77.jpg	Манхва	0	0	2021	0	115	<p><strong>После угроз и запугиваний школьного хулигана, который требовал добыть предметы, Ха До Ван всю неделю проводит ночи напролет за играми, умирает и перерождается в школьном кабинете за неделю до этого... Все было точно таким же, как в тот день.</strong></p><p><strong>Изменилось только одно - это &quot;Оповещение о квесте&quot;, которое всплыло перед глазами! Что? От меня требуется победить этого хулигана, используя все мои игровые навыки?</strong></p>
150	Эволюция меча: Поднятие уровня в подземелье	the-blade-of-evolutionwalking-alone-in-the-dungeon	the-blade-of-evolutionwalking-alone-in-the-dungeon/a435dd969fb507e719dca0a9b39fbb58.jpg	Маньхуа	0	0	2020	0	76	<p>Человек пробудил силу целителя внутри себя, но она оказалась&nbsp;полным мусором. Во время миссии в подземелье члены его команды были убиты. Это произошло из-за &quot;рассерженного священника&quot;, которого они освободили. В подземелье этот человек обрёл меч и стал учиться им пользоваться. Но что сделает одиночка в огромном подземелье?</p>
151	Прорыв с запретным мастером	a-breakthrough-brought-by-forbidden-master-and-disciple	a-breakthrough-brought-by-forbidden-master-and-disciple/655ef0e402eebaa29a647d5fa9e6b3f9.jpg	Манга	0	0	2020	0	20	<p>Эрз - сын одного из восьми великих героев, победивших Короля Демонов. Общество ожидает, что и он будет великим воином, однако Эрз не может оправдать их ожиданий. Какие усилия он бы не прикладывал, он всегда оставался вторым и окружающим этого было мало. Все твердят ему, что он должен быть первым, раз уж он - сын героя, и постоянно сравнивают их.&nbsp;</p>\r\n\r\n<p>Но однажды он встречается с самим королём демонов, поверженым его отцом. Оказывается, их души связаны и Эрз начинает тренироваться вместе с ним, чтоб наконец показать остальным на что он способен. Близится выпускной - турнир, на котором сразятся лучшие ученики школы, и Эрз хочет победить в нём благодаря своему новому мастеру.</p>
152	Новичок с аккаунтом повелителя	royal-system	royal-system/66f60f2bc5af3538b9592c913f008745.jpg	Маньхуа	0	0	2020	0	343	<p>Внезапный кризис привел Землю прямо к эпохе OL, и все человечество было низведено на пальму первенства неизвестных сил. Все люди стали первоклассными игроками. В жестокую эпоху слабых и сильных, ученик средней школы Е Хао оставался на третьем уровне и не мог расти. Когда он собирался умереть,он случайно открыл систему обновления учётной записи короля, сможет ли Е Хао стать самым сильным королем?</p>
153	Царство боевых искусств	martial-arts-reigns	martial-arts-reigns/75d7215cb46244f8f4c8aaf4fb71ba1d.jpg	Маньхуа	0	0	2018	0	631	<p>Мин Е, восходящая звезда семьи Е, - гений среди своих сверстников-культиваторов. Но его двоюродный брат повредил ему меридианы, искалечил и безжалостно порезал сухожилия. Мин Е не сдается, потому что он пожертвовал бы всем, чтобы отомстить за своих умерших родителей, которые были убиты семьей Хуан. Он не знает, что его считают занозой в шее для семьи Е и хотят его убрать&hellip;...</p>
155	Младший сын конгломерата	youngest-son-of-a-conglomerate	youngest-son-of-a-conglomerate/80e31187bddf2ac5d315b83f9bba5343.jpg	Манхва	0	0	2022	0	75	Вернуть 13 лет тяжелой работы через предательство! Юн Хён У, глава Sunyang Group, который жил как слуга и был брошен. В тот момент, когда он думал, что все кончено, он просыпается как Джин До Джун, внук председателя группы "Суньян" Чжина! Однако Джин До Джун, младший сын семьи Чеболь, далек от права наследования. Сможет ли он стать окончательным победителем в семейной политической драме? Захватывающая драма мести Юн Хён У, призванная поглотить группу Sunyang, начинается!
156	50 рецептов чая от герцогини	the-duchess-50-tea-recipes	the-duchess-50-tea-recipes/2167b724db222668652a4139b758fd63.jpg	Манхва	0	0	2019	0	143	<p>Когда я открыла глаза, то уже стала герцогиней. Однако что-то было не так. Дошло до того, что я стала главной героиней, но оказалось, что герцогиней я была только по статусу. На самом же деле вся прислуга издевается надо мной, а муж и вовсе игнорирует. Какая жалкая жизнь! Боже, я не знаю, что же мне делать дальше. Буду просто наслаждаться своим чаем, так я думала. &ldquo;Ты приготовишь для меня тот чай в следующий раз?&rdquo; Что не так с моим мужем и его холодным отношением ко мне?!</p>
157	Академия Ранкеров	i-became-a-student-at-the-transcendntal-academy	i-became-a-student-at-the-transcendntal-academy/7c635dd8ad09684941a26eb78722e93b.jpg	Манхва	0	0	2022	0	86	<p>Со Джун долго копил деньги, чтобы расплатиться с долгами погибших родителей и поступить в академию охотников. Но из-за несчастного случая, все деньги пришлось потратить на лечение.<br />\r\nИ вот, когда он был на грани отчаяния, появилась странная реклама:<br />\r\n&quot;Ты тоже можешь стать пробужденным!&quot;<br />\r\nТерять уже было нечего, и он решил попробовать.<br />\r\n&quot;Господин Ким Со Джун. Приветствуем в Академии Трансцендентов!&quot;<br />\r\nАкадемия охотников, находящаяся в другом измерении! В наше время охотником может стать каждый, но вам выпал шанс стать трансцендентом!</p>
158	Вор-читер в мире судного дня	the-last-days-of-thieves	the-last-days-of-thieves/56406df27210cafde6d0c4a7dacf9a46.jpg	Маньхуа	0	0	2021	0	163	<p>Космическая буря привела к множеству различных мутаций. В городе появились ядовитые зомби-тролли, безумно ревущие и размахивающие огромными топорами. В лесах появились редкие животные, борющиеся за территорию. У людей также появились необыкновенные способности, которые назвали &laquo;Звездной силой&raquo;&hellip; Не имеющий такой &laquo;Звездной силы&raquo; Чжоу Чжен, попал в этот мир судного дня. Используя способности игрового персонажа вора, он пытается разрушить темный туман и стремится к высшей силе!</p>
159	Возрождение иного императора	another-emperor-reborn	another-emperor-reborn/cd58140e363fb92b36a6dac3c19832c4.jpg	Маньхуа	0	0	2020	0	310	<p>Однажды, весь мир захлестнула невообразимая энергия. Так, по всему земному шару начали появляться люди с невиданными доселе способностями. Но одновременно с тем, толчок в развитии получили и высшие существа. Некоторые таинственные могущественные расы начали постепенно отходить&hellip; от беспробудного векового сна. С течением времени, вся власть над миром перешла в руки одной королевской семьи. Но вот, в один прекрасный день, в тело незаурядного человеческого паренька вселяется душа императорского принца.</p>
160	Реинкарнация Ранкера-Некроманта в муриме	moorimse-is-a-former-ran	moorimse-is-a-former-ran/a5a3c1d288fd757b927bcb59767cc15d.jpg	Манхва	0	0	2021	0	109	<p>Кан Тэ Ха, охотник SSS-ранга, в одиночку бросает вызов сильнейшей Гильдии &quot;Грифон&quot;, но погибает после ожесточенного сражения! Однако&hellip;<br />\r\n<br />\r\n&mdash;&hellip;Я стал свиньей?<br />\r\n<br />\r\nЭто мир Мурима? Теперь я &ndash; Ю Шин Ун, старший наследник клана Пэк Ун. Ситуация не из простых и отдыхать некогда, ведь за спиной уже строят козни!<br />\r\n<br />\r\n&mdash;Неужели вы всё ещё не понимаете, кто я?<br />\r\n<br />\r\nНекромантия из прошлой жизни. Боевые искусства из нынешней. Ему подвластно всё! Кажется, этот мир ждут новые потрясения!</p>
170	Система вампира	biting-is-wrong	biting-is-wrong/0e91ad0b2268eaf2a386e675cedf66a6.jpg	Маньхуа	0	0	2020	0	118	<p>Что? Быть плохим, чтобы стать сильнее? Что является злом в этой системе?</p>
171	Вторая жизнь бандита	second-good-life	second-good-life/c4292cbfc0e9451580cd31d565557619.jpg	Манхва	0	0	2018	0	137	<p>41 год. Чон-Сок О, который до сих пор работал в организации, совершая всевозможные плохие поступки, занял высшее положение в организации.</p>\r\n\r\n<p>Но конец той жизни был бы таким плачевным ...</p>\r\n\r\n<p>Как оказалось смерть не стала его последней остановкой, ангел даровал ему второй шанс и переродил опытного бандита&nbsp;в молодое тело...</p>\r\n\r\n<p>как же он решит прожить свою жизнь?</p>
161	Регрессия актёра	i-will-live-as-an-actor	i-will-live-as-an-actor/ea7c5a0f4a9e4bdf74e847e328863ad6.jpg	Манхва	0	0	2022	0	64	Чан Ён Гук - парень, добившийся большого успеха в качестве актёра. Ради этого он прошёл долгий и тернистый путь, давший свои плоды. В день получения своей первой почётной премии, за лучшую мужскую роль второго плана, он узнаёт, что совсем недавно его мать скончалась от продолжительной болезни. Он был опустошён из-за её смерти, так как совсем пренебрёг ею, поставив карьеру и деньги на первый план. Не захотев мириться с такой реальностью, он решается на самоубийство. В моменты, когда вся жизнь пролетает перед его глазами, он вспоминает тёплые воспоминания связанные со своей матерью, жалея о потерянном времени. Именно тогда, неожиданно... он возвращается в своё прошлое! «Я вернулся к той жизни, о которой сожалел, жалкой жизни «эгоиста...». И снова начинается история человека, который хочет быть актёром. Сможет ли он прожить счастливую жизнь, не похожую на прошлую?
162	Босс школы	boss-in-school	boss-in-school/ba56ec531c239f1b2e07c3d4704d4827.jpg	Манхва	0	0	2017	0	199	<p>Сет Квон, прирождённый боец, прекращает драться из-за данного матери обещания&hellip; Но всё меняется, когда его отец оставляет ему сообщение: &laquo;Хватит позволять другим бить себя. Это выглядит жалко&raquo;. Теперь, когда он перевёлся в новую школу, никто не сможет победить его.</p>
163	Изумрудная корона жизни	recorded-crown	recorded-crown/79ae861c4de724c507f4a0d1b0010488.jpg	Манхва	0	0	2020	0	83	<p>После автомобильной аварии главная героиня перемещается в собственный роман, написанный ею в 15 лет, и занимает тело девушки, что должна была умереть по трагичной случайности. Ран Ромелия Де Лация - второстепенный персонаж романа и любимая дочь тираничной мачехи главного героя.&nbsp;<br />\r\nЗа 3 года до начала оригинальной истории вся семья погибает. Новый наследник в лице Юстафа возвращается из академии, и Ран во что бы то ни стало необходимо переманить его на свою сторону, пока барон, занявший роль его опекуна, не начал строить свои козни.&nbsp;</p>
164	Я Король-Волшебник	i-am-the-sorcerer-king	i-am-the-sorcerer-king/8f37b2b8d67ad5cbd5884f2565363d0c.jpg	Манхва	0	0	2019	0	60	<p>10 лет назад орда монстров из разлома в пространстве и времени начала атаковать человечество. В то же время люди начали пробуждать силу и охотиться на монстров за славой и деньгами. Санхун, нуждающийся в деньгах из-за болезни своей матери, берёт опасную работу, помогая охотиться на этих монстров четыре раза в месяц в качестве приманки. Но однажды, оказавшись тяжело раненным, он вспомнит свою прошлую жизнь. &laquo;Я что, только что умер? Погоди-ка, я был королём-волшебником Кратра в прошлой жизни?!&raquo;</p>
165	Любовный совет от Великого Герцога Ада	love-advice-from-the-great-duke-of-hell	love-advice-from-the-great-duke-of-hell/4db4fc7402f257c5c49682a42212b55b.jpg	Западный комикс	0	0	2018	0	137	<p>История о любви, дружбе и призыве демона.</p>
166	Лучший в мире мастер боевых искусств	worlds-strongest-hero	worlds-strongest-hero/2f8e2b728e5b5ae8bd1011027073b864.jpg	Маньхуа	0	0	2020	0	226	<p>Перерождение - это только начало чего-то великого.</p>
167	Возвращение игрока	return-of-the-player	return-of-the-player/487e27aa87a7a8e5ff295bc14751b4f6.jpg	Манхва	0	0	2020	0	140	<p>В один день мир превратился в игру. Неожиданно появившиеся монстры стали убивать людей, а те в свою очередь были вынуждены начать выполнять различные квесты. Во всём этом хаосе апокалипсиса выделился игрок по имени Ким Сехан. Удастся ли ему найти и уничтожить систему, сделавшую мир таким?</p>
168	Легенда о Регрессии	regression-legend	regression-legend/d6db99abead3382c635ccea1dbafd15a.jpg	Манхва	0	0	2021	0	95	<p>Из-за 2-го мирового экономического кризиса, компания по ценным бумагам, в которой работал Чан Тхэ-сан, обанкротилась. Пристрастившись к азартным играм Чан Тхэ-сан превратился в бродягу и нищего.&nbsp;<br />\r\nВ один день он погибает, спасая ученика начальной школы, которого чуть не сбила машина, и благодаря доброму делу, которое он совершил, Чан Тхэ-сан возвращается в прошлое на 14 лет назад и начинает новую жизнь.&nbsp;<br />\r\nВместе с радостью о возращении к жизни, к нему вернулась, и забота о вступительном экзамене по математике в институт, от которого просто взрыв мозга. Мало того, что нужно заново сдать экзамен по математике, к этому еще надо и заново сдать, тот самый экзамен по юриспруденции&hellip;&nbsp;<br />\r\nНо ко всему этому в его голове, четко запечатлелся график фондового рынка, который он видел в то время, когда был биржевым маклером ...&nbsp;<br />\r\n&nbsp;<br />\r\nПрошлая жизнь была разрушена, а жизнь после возвращения гарантирует только успех!</p>
172	Система жизни	the-live-system	the-live-system/69d4a742a40fab1af467d24f5f3efa00.jpg	Манхва	0	0	2020	0	167	<p>Юн Чжэ потерял свою жену и дочь в результате несчастного случая. Лишившись смысла жизни, он прожигает свою жизнь напрасно. Ему достался лишь дневник его супруги, который она оставила ему на будущее. Может... Он сможет встретиться со своей семьёй ещё раз? &quot;Святой грааль&quot; - главная награда игрока, который смог пройти &quot;игру&quot; и занять первое место. Если Юн Чжэ сможет заполучить его, то его семья снова будет с ним. Однако в жестоком мире, где правит лишь сила, ему придётся преодолеть не мало препятствий, чтобы достичь желаемого. Сможет ли Юн Чжэ стать сильнейшим игроком?Нет!</p>
173	Легендарный лунный скульптор	legendary_moonlight_sculptor	legendary_moonlight_sculptor/b5b6315af5cd6fd5cf9324a5d2e35bfd.jpg	Манхва	0	0	2015	0	170	<p>Главный герой Хэн пережил очень трудное детство в нищете, это сделало его очень сильной, безумной и навязчивой личностью. Он всеми силами пытается избежать повтора событий и обезопасить свою сестру и бабушку от бед внешнего мира, поэтому он погружается во всемирно известную игру жанра VRMMO - &quot;Королевская дорога&quot;. На протяжении всего пути ему будут встречаться очень уникальные люди, с которыми у него будут весьма неординарные отношения.</p>
174	Я убил Бессмертного	i-killed-the-immortal	i-killed-the-immortal/04a808c2a7b0887753116556c9201e4b.jpg	Рукомикс	0	0	2021	0	16	<p>Меня зовут Артур Готфрид и я просто хотел жениться на дочери мэра.<br />\r\nТеперь мои ноги лежат в двух метрах от меня.</p>\r\n\r\n<p>Но даже отойти на тот свет мне не дали. Бессмертный вырвал меня из лап смерти и сделал своим учеником.<br />\r\n&mdash; Убей меня. &ndash; сказал он мне, - И тогда ты вернешься домой.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Зачем ему это?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Он так и не сказал.</p>
175	Меч девяти небес	gucheongu-sword	gucheongu-sword/4469a1bbeea3e2e1c16fe9071437189e.jpg	Манхва	0	0	2022	0	74	«Он — правитель девяти небес». Йон Джоха с детства подвергался всевозможным издевательствам со стороны мачехи и сводных братьев и сёстр. После смерти отца его заперли в складе, но десять лет спустя он сумел сбежать, изучив боевые искусства, выходящие за грань понимания человека. Захватывающие приключения главного героя начинаются прямо сейчас!
176	Герой, жаждущий мести, уничтожит врагов Силой Тьмы	the-hero-who-seeks-revenge-shall-exterminate-with-darkness	the-hero-who-seeks-revenge-shall-exterminate-with-darkness/69ad4ec3cb77beaa919a61e2060c1124.jpg	Манга	0	0	2019	0	100	<p><strong>Рауль</strong>, который победил <strong>короля демонов</strong> как сильнейший герой, должен был стать спасителем мира.Этого не произошло. Вместо этого, Рауля казнили по ложному обвинению, которое выдвинула против него Принцесса. Вся родня героя погибла, так что&nbsp; некому было спасать его жизнь. Незадолго до того, как он погиб, сердце Рауля погрузилось во тьму&hellip;&laquo;Я разорву этих предателей на куски. Сожгу их на костре. Расчленю их. Буду пронзать их. Я убью всех этих ублюдков беспощадно и заставлю их вкусить адские страдания!!!&raquo;&nbsp;Получив силу тьмы, Рауль возродился. Усмехаясь, он поклялся отомстить.&laquo;О, я с нетерпением жду этого &ndash; с этого момента я буду купаться в их крови, как мне заблагорассудится.&raquo;Через несколько дней после реинкарнации Рауля в столице страны, где цветут самые красивые цветы в мире, проходит свадьба, на которой замуж выйдет та самая Принцесса&hellip;</p>
177	Мастер Гу	master-of-gu	master-of-gu/high_cover.jpg	Маньхуа	0	0	2018	0	97	<p>Это история о злодее Фан Юане, который попал в прошлое на 500 лет назад, переродившись при помощи&nbsp;цикады&nbsp;ЧуньЦю, которую долгое время выращивал. С его глубокой мудростью, боевым и жизненным опытом он стремится победить своих врагов умом и превосходными навыками! Он безжалостен и аморален, у него нет причин сдерживаться, преследуя свои конечные цели. В мире жестокости, где человек совершенствуется, используя Гу &mdash; волшебные существа этого мира, Фан Юань должен подняться выше всех при помощи своей собственной силы.</p>\r\n\r\n<p>Гу &mdash; легендарное ядовитое насекомое, часто используемое в практиках чёрной магии. Оно принимает форму некоторых насекомых, обычно змей, сверчков, червей и т. д.</p>
178	Жрец порчи	priest-of-decay	priest-of-decay/d2e24779341966913e21ffee7cb4bc2f.jpg	Манхва	0	0	2023	0	33	<p>Я использовал читы, чтобы получить особый класс в игре. Но стоило нажать кнопку запуска, как я сам стал &laquo;жрецом порчи&raquo; и оказался в игре!</p>\r\n\r\n<p>Это персонаж с отвратительными характеристиками, которого все ненавидят! А из предметов у меня только роба и засохшая женская ладонь, которая оказалась рукой богини!</p>
179	Создатель злодейки	evil-her-maker	evil-her-maker/18e51aa03dbd378e0079219d4f4cebc4.jpg	Манхва	0	0	2021	0	72	<p>Я очутилась в теле злодейки романа. К тому же это был фэнтезийный роман, который я сама написала лет 10 назад. Злодейка Айла - женщина, которая проклинала главную героиню, и которой было судьбой уготована смерть от рук главного героя. Но что если я не стану злодейкой, что тогда?<br />\r\n- В этот раз я буду бездельничать как безработная богачка всю свою жизнь!<br />\r\nОднако, стоило мне начать болтаться без дела, как внезапно один и тот же день начал повторяться снова и снова. Возможно ли, что причиной этому стало то, что я решила не вести себя, как злодейка?! Я не хочу умирать!<br />\r\n- Пожалуйста, остановите временную петлю...<br />\r\n- Это легко сделать. Тебе лишь нужно стать настоящей злодейкой.<br />\r\n- Настоящей злодейкой?<br />\r\n- Богатство, власть, почёт, мужчины... Ты можешь присвоить себе всё что угодно.<br />\r\nОднажды ко мне пришёл колдун, от которого так и веяло опасностью.<br />\r\n- Если желаешь, я заберу у неё корону и с радостью возложу на твою голову. И после проложу для тебя дорогу к трону...<br />\r\nЭтот мужчина, словно Дьявол, нашёптывал мне сладкие слова на ушко своим нежнейшим голосом.<br />\r\n- Итак, твой ответ?<br />\r\nИ правда, смогу ли я остановить временную петлю и переродиться истинной злодейкой?</p>
180	У меня каждую неделю новая профессия	i-randomly-have--new-career-every-week	i-randomly-have--new-career-every-week/449284617828b40b40f8664a15e48d18.jpg	Маньхуа	0	0	2021	0	550	После увольнения из компании Линь И по ошибке получил систему «Мастер во всем». Лин И полагался на различные профессии и щедрые вознаграждения, предоставляемые системой, для достижения своих амбиций и постепенного обогащения, чтобы стать всемогущим.
181	Победитель по жизни	the-loser	the-loser/77e1b4ff244a95df88b3a37530bbede5.jpg	Маньхуа	0	0	2020	0	240	<p>Мэн Фань был хорошим парнем, но по трагической случайности погиб совсем молодым, так и не успев ничего сделать. Для того чтобы восстановить справедливость, Вселенная отправляет его назад за три месяца до гибели и создаёт для него систему, при которой у него не получится впустую тратить жизнь. В первом задании ему нужно будет получить 100 отказов от девушек...</p>
182	Лукизм	lookism	lookism/e54532628ae3e192c424c4ee2ef05921.jpg	Манхва	0	0	2016	0	467	<p>Пак Хён Сок &ndash; непривлекательный старшеклассник, страдающий от избыточного веса, из-за чего регулярно подвергается травле и насмешкам со стороны окружающих. Но происходит чудо&hellip;</p>
183	Сильнейший ранкер-тролль	best-troller-in-game	best-troller-in-game/8e597b067038239e69f351360e58984c.jpg	Манхва	0	0	2022	0	60	<p>Самая невероятная игра. Реальность, где возможно всё.</p>\r\n\r\n<p>[Добро пожаловать в фантастический мир Аркадии.]</p>\r\n\r\n<p>Удивительное приключение профессионального тролля начинается!</p>
184	Я был финальным боссом башни	was-the-boss	was-the-boss/f0da5ef26050f599f59bc1144612cdf2.jpg	Манхва	0	0	2022	0	57	<p>Бафомет, босс Башни Бездны, живёт в вечном ожидании сильного противника. Однообразные бои наскучили ему и, благодаря добытым в бою трофеям из мира людей, стал им интересоваться. Однажды появляется достойный противник, и это только укрепляет восхищение Бафомета человечеством. Он приходит к мысли, что и сам хотел бы стать человеком&hellip;</p>
185	Перезапуск подземелья	dungeon-reset	dungeon-reset/a95bdf4976aaa176423be4479cb1a544.jpg	Манхва	0	0	2020	0	185	<p>[Идет перезагрузка Подземелья.] Подземелье или ловушки, в которых была игра, проходят стадию перезагрузки для следующих пользователей.Может, эта &laquo;перезагрузка&raquo; применима и ко мне?! Единственное существо, которое свободно от постоянно перезапускаемой Пещеры. Вооружившись грандиозной силой, Чон Да Ун начинает освоение Подземелья!</p>
186	Жизнь Неудачника	loser-life	loser-life/ccf50de93eb984f07c0fa0515a183033.jpg	Манхва	0	0	2019	0	56	<p>21-летний Джан Анчул быстро шел к успеху, когда его проклял одноклассник, над которым он издевался 3 года назад в старшей школе. Теперь, помещенному&nbsp;в тело неудачника, над которым он издевался 3 года назад, ему надо&nbsp;реабилитировать себя в прошлом, чтобы снять проклятие. Как же он пройдёт этот путь, находясь под вечными издевательствами?</p>
187	Да, я паук, и что с того?	im_a_spider_so_what	im_a_spider_so_what/c121e0348fb9a6eeb8923f3e11247baa.jpg	Манга	0	0	2015	0	142	<p>История берёт своё начало в мире, где Герой и Повелитель демонов &mdash; два заклятых врага и ведут бесконечную войну друг с другом не на жизнь, а на смерть. Под влиянием могущественной магии граница между нашим и их мирами стирается, и взрыв, сопровождающий появление сражающейся парочки, уничтожает учебный класс вместе со всеми учениками, включая и нашу героиню. Девушка, которая в прошлом имела плохую репутацию в школе и была мишенью для издевательств, переродилась в виде... паука-монстра! Впрочем, долго горевать она не стала и, свыкшись с новым обликом, решила бороться за своё существование в новом мире.</p>
189	Реинкарнация в безумного наследника	reincarnated-as-a-naughty-small-schoolmaster-exclusive	reincarnated-as-a-naughty-small-schoolmaster-exclusive/2e1d7c96041752084d225737ba255d5e.jpg	Манхва	0	0	2021	0	108	<p>Ян Чагак, убитый ядом во время политических войн в Муриме, после смерти&nbsp;очнулся в неизвестном месте и вскоре выяснил, что находится в демоническом культе, а изучаемые&nbsp;им техники - высшее искусство владыки демонов, к тому же тело принадлежит безумному наследнику, жаждущему женщин.<br />\r\nP.S. Произведение от студии, что создала:&nbsp;&quot;Solo Leveling&quot; и &quot;Omniscient Reader&quot;</p>
190	Второй брак императрицы	remarried-empress	remarried-empress/fd13618bfa84c8dd89a76eadaa2a2e27.jpg	Манхва	0	0	2019	0	160	<p>Я приняла решение. Если я не смогу быть императрицей здесь, то стану в другом месте.</p>
191	Вторая жизнь хирурга	congressman-live-again	congressman-live-again/3666066dad8c67a27659d6b5d0b4a069.jpg	Манхва	0	0	2021	0	138	<p>Поехал на медицинское волонтёрство, а попал на гражданскую войну. Хотел спасти пациента &ndash; получил пулю и умер. А после&hellip; стал ребенком?!<br />\r\nРазграбленные повозки, люди в необычных одеждах &ndash; всё это напоминает мир Мурим. Оказав первую помощь пострадавшим, после встретив спасательный отряд из &laquo;Лечебницы трёх поколений поднебесной&raquo; и самого Пэк Рин Ый Сона, я осознал, что нахожусь в мире романа про боевые искусства &laquo;Величайший небесный демон&raquo;.<br />\r\nОдин из тогда спасённых мною &ndash; главный герой книги, будущий небесный демон &ndash; Ё Ха Рюн. &laquo;Эй, за то, что спас, можешь звать меня старшим братом&raquo; &ndash; вот так мы с ним сдружились. А Пэк Рин Ый Сон, рассмотревший во мне талант, стал мне учителем.<br />\r\nМеня зовут Чин Чхон Хи, я - последняя надежда Канхо, и это моя история!</p>
192	На подработке у богов	albanian-of-the-gods	albanian-of-the-gods/050c9e91a0e3c5a458de130a15a2ea2e.jpg	Манхва	0	0	2023	0	42	<p>У главного героя Ю Дамдока нет Таланта &ndash; особого свойства, без которого в современном мире не найти работу. Потерпев крах на очередном собеседовании, он на чём свет стоит клянет Бога. Ответ не заставил себя долго ждать &ndash; Дамдока мигом сражает молния. Первое, что он увидел, когда очнулся &ndash; странное окно с вакансиями от богов. Терять нечего, &ndash; думает Дамдок и откликается на первое попавшееся предложение. Теперь он человек в мире богов. Вот только &laquo;начальство&raquo; думает, что он бог низшего уровня&hellip;</p>
193	Мой папа слишком сильный	my-dad-is-too-strong	my-dad-is-too-strong/408c298182436aec21cd983f9f70f7b7.jpg	Манхва	0	0	2020	0	150	<p>Самый обычный госслужащий без каких-либо талантов возвращается после смерти.<br />\r\nПосле того, как перенёс неисчислимые страдания и мучения в лесу, он решает прожить оставшуюся жизнь как обычный человек.<br />\r\n&laquo;Пожалуйста, стань моим папой. Это только до выпускного&raquo;<br />\r\nНо в его судьбу вмешивается дочь?</p>
194	100-я Регрессия Игрока Максимального Уровня	the-100th-regression-of-a-maxlevel-player	the-100th-regression-of-a-maxlevel-player/44a7a84b74c374fb97673f9404f7eeb9.jpg	Манхва	0	0	2023	0	31	<p>Земле конец. Люди в возрасте от 15 до 29 лет по всему миру должны принять участие в смертельной игре из двадцати раундов. Главный герой начинает свое 100-е испытание благодаря способности к регрессии.</p><p>Пройдя игру 99 раз и дойдя до финала, он наконец получил шанс стать сильнейшим. Условием последнего раунда является наличие группы не менее чем из пяти человек. Поэтому Рю Мин начинает принимать в свою команду других участников, чтобы не повторить своих прошлых ошибок.</p>
195	Безупречный отец	peerless-dad	peerless-dad/high_cover.jpg	Манхва	0	0	2017	0	275	<p>История бесподобного отца, которому известна воля небес. Автор Но Гён Чхан широко известен по манхве Красная Буря, но если вам нужна другая причина для чтения, то это удивительная история приключений мастера боевых искусств, включающая свадьбу, заботы отца и битвы. Она во многом похожа на Красную Бурю: крутой мастер, главный герой, беспокоящийся о своей семье, трагическая предыстория.&nbsp;Обязательно к прочтению для каждого, кому понравилась Красная Буря.</p>
210	Суперзвезда с рождения	superstar-from-age-0	superstar-from-age-0/ab4c48e6bb9cd5e4b7190eaeb0a3db03.jpg	Манхва	0	0	2023	0	22	<p>После бесчисленного количества реинкарнаций в эльфов, фей, слизней, подарочных коробок, дьяволов и многого другого, Я, Ли Со Чун, переродился человеческим ребёнком!</p>\r\n\r\n<p>В библиотеке, где хранятся все мои воспоминания, я нахожу заветную мечту из самой первой жизни.</p>\r\n\r\n<p>Бог наградил меня красивым лицом и актёрским талантом, поэтому я буду усердно трудиться, чтобы исполнить мечту и стать суперзвездой!</p>
196	Я так и не смогла усмирить эту злую натуру	i-have-never-been-able-to-pacify-this-evil-nature	i-have-never-been-able-to-pacify-this-evil-nature/2afbd47f96a1bf54656c4fd3a57d2964.jpg	Манхва	0	0	2022	0	88	<p>Серебристые волосы и алые глаза... на девятый день рождения отец подарил Валлетте юного раба, в котором девочка почти сразу же признала будущего хранителя магической башни и главного антагониста истории.</p>\r\n\r\n<p>Пробудив свой магический дар, Рейнхарт прольет темный гнев на каждого, кто когда-либо посмел его задеть или унизить, а бывшие хозяева станут первыми жертвами на пути его мести. Темная, мрачная и злая натура, от которой невозможно избавиться или убежать и которую она вновь не сможет усмирить&hellip;</p>
197	Преимущества реинкарнации	privileges-for-possesors	privileges-for-possesors/5a7fc8bdfdbfdd2384b6b7cf747a4406.jpg	Манхва	0	0	2022	0	70	<p>Готовьтесь к загробной жизни! Я получила странное спам-смс незадолго до своей смерти. Я думала, что умерла, но очнулась в бюро оценки воскресших. Загробная жизнь действительно существует? Меня собираются переселить в книгу? &laquo;Какой твой любимый жанр?&raquo; В прошлой жизни я была фанатом всех жанров. У меня была нелегкая жизнь, поэтому в новой жизни я хотела быть милой маленькой девочкой и иметь всю любовь мира. Сюжет, который мне достался &mdash; это бесконечная реинкарнация, полная сладких бататов, уровень сложности выживания S: &laquo;Воскрешение во спасение мира&raquo;. Персонаж, в которого меня переселят &mdash; дочь простолюдина-слуги, которым командует негодяй-аристократ, злоупотребляя властью! Но я получила особые привилегии благодаря полному пакету страхования жизни воскресшего, который я подписала незадолго до смерти. Это история сладкого выживания, с добродетелями, страховыми выплатами и привилегиями от Бога!</p>
198	Блондинка-призывательница	blonde-elemental	blonde-elemental/e4fbabb5913baa1a640cc7290c6131aa.jpg	Манхва	0	0	2019	0	108	<p>Я думала, что умерла, но когда я открыла глаза, я возродилась как благородная дочь?! В свoи 17 лет я умерла, нo вoт я снова жива! Я не хoчу умереть снoва! Вoт мoя 2-я жизнь! Сильная и независимая Джин начинает исследовать дикий континент Кроуэлл!</p>
199	Восхождение безымянного бога	temporarily-closed-for-personal-reasons	temporarily-closed-for-personal-reasons/e1bb41ba29e5e441b59df1bd1e96aa51.jpg	Манхва	0	0	2022	0	80	<p>Я - третьесортный писатель новелл по имени Ю Ильшин. По звучанию, мое имя на корейском похоже на &quot;Единственный бог&quot;, только не надо меня подкалывать, я и без вас понимаю, что неудачник...На самом деле я не бог, это просто имя. И хоть только охотников уважают в этом мире, это не означает что все они равны. Когда ваш класс будет определён, жизнь изменится навсегда.Однажды, мои способности, о которых я так долго мечтал, пробудились. Но эти способности немного странные... В этом потустороннем мире, с которым я соединен через&nbsp; мобильный телефон, слабые и никчёмные муравьи почитают меня как бога?.. И вот, оказывается, что такой бесполезный неудачник как я, должен спасать мир... Да хрен там плавал, здесь явно что-то не так!</p>
200	Её прислужник	her-summon	her-summon/55ca48008c826681411b8279c672894a.jpg	Манхва	0	0	2018	0	62	<p>Чжинкён, поклонник женской поп-группы, произнёс ошибочное слово в интервью на прямой трансляции на ТВ. Спустя 3 года из-за чувства угнетения он совершенно отдалился от этого мира и общества реальных людей, став настоящим любителем 2D! И однажды, пока он продолжал жить такой жизнью, его неожиданно призвали в невиданный им мир. И там он столкнулся с призывательницей&hellip; В этом мире психическая травма Чжинкёна не давала о себе знать, а сам он стал прислужником невероятной мощи!&nbsp; &nbsp;&nbsp;Бывший фанат женской группы, который теперь помешан на 2D, прислужник Чжинкён и начинающая призывательница Хейз &mdash; их приключения начинаются прямо сейчас!</p>
201	Дьявол возвращается в школьные годы	school-of-evil	school-of-evil/3a387fc8db0179d41825e6aa12c46e07.jpg	Манхва	0	0	2023	0	39	<p>Хорошие оценки, привлекательная внешность, боевые навыки выше среднего и немного праведности. Накануне выпускного вечера Ким Хён Сон, которого столкнули с крыши, впадает в вегетативное состояние. Не в силах умереть, сохранив лишь слух и сознание, он проводит следующие десять лет в аду, пока внезапно не возвращается в тот день, когда начались издевательства.</p>
202	Я вошла в семью злодея по контракту	i-bcm--contrct-fmily-with-th-villin	i-bcm--contrct-fmily-with-th-villin/e54ca5b130ce6404f696798168fdbf4f.jpg	Манхва	0	0	2021	0	99	<p>Ария предложила заключить брачный контракт. И из всех она выбрала продавшего душу дьяволу молодого принца Валентина, чтобы защитить себя и его. &mdash; Женись на мне. Ария, дрожа всем телом, давала брачный обет с листом в руках. &mdash; Развод состоится через 10 лет по истечению брачного контракта... Затем молодой принц забрал документ из ее рук и разорвал. &mdash; Так где мне поставить печать? &mdash; Я же сказала, что разведусь с тобой. Внезапно он, охваченный дьяволом, наклонился к ней и произнес: &mdash; Ты уже немаленькая, нам нужно заключить взрослый контракт.</p>
203	Злодейка сегодня счастлива	the-wench-is-happy-today	the-wench-is-happy-today/266f518ce678cc8f6fafc273b3edf38d.jpg	Манхва	0	0	2021	0	77	<p>Подруга увела моего парня, а затем осмелилась с улыбкой вручить приглашение на свадьбу?<br />\r\nХа! Восторгаясь своей местью, я вернулась домой и заснула...<br />\r\nНо, проснувшись, обнаружила себя в теле злодейки фэнтези-романа, у которой было всё: красота, ресурсы и интеллект.<br />\r\nЕдинственное, чего девушке не хватало, проницательности в оценке мужчин.<br />\r\nОставим ублюдочного принца главной героине, а сами насладимся роскошью власти и денег!<br />\r\n&nbsp;</p>
204	Поднятие уровня с нуля	the-people-on-earth-are-too-ferociou	the-people-on-earth-are-too-ferociou/b6829e86346f6f3cb197efe47e193841.jpg	Маньхуа	0	0	2021	0	228	<p>50 лет назад в городе Лунчэн прошла ожесточенная битва, между земной цивилизацией и ужасающими иноземными монстрами.<br />\r\nМэн Чао, что попал под эту битву умирает, воскресает молодым. Он осознает, что ему нужно стать сильнее, чтобы переписать свою историю. Итак, наш возродившийся главный герой начал уничтожать монстров, растаптывать демонов, разрывать голыми руками древних богов и подчинять миры. В этой жизни он поклялся, что всеми силами станет сильнейшим!</p>
205	Поднятие уровня начиная с максимально возможного	leveling-up-at-maximum-level	leveling-up-at-maximum-level/37bea0615eda1c537091ed953e7d5728.jpg	Манхва	0	0	2021	0	53	<p><strong>Вы достигли максимального уровня.</strong></p>\r\n\r\n<p><br />\r\n<strong>Ча Шин Хён бесспорно лучший в мире. Почему после конца пустоты и возвращения, Земля настолько изменилась?</strong></p>\r\n\r\n<p><br />\r\n<strong>Мир, в котором монстры выходят из подземелий, и охотники повышающие уровень за счет окна статуса.</strong></p>\r\n\r\n<p><br />\r\n<strong>&laquo;Начать с 1 уровня? Что же мне делать, если я уже достиг максимального уровня?&raquo;</strong></p>
206	Возвращение Героя	hero-returns	hero-returns/a20d839497ad4b9af3fc6ad8f4dd0dd7.jpg	Манхва	0	0	2022	0	70	<p>Сильнейший герой человечества Ким Сон Бин. Он бросил все на кон и сражался, но&hellip;&nbsp;не cмог предотвратить разрушение мира. Однако его легенда только начинается, когда Сон Бин возвращается на 20 лет в прошлое.</p>
207	Регрессия Сильнейшего Мастера	star-armor-soul-will-pass	star-armor-soul-will-pass/e284a397df9eb86e8e0e3681851cf714.jpg	Маньхуа	0	0	2021	0	168	<p>Последний из Мастеров Звездной Души, Сун Юньсян. В юности из-за дефекта души на него смотрели с пренебрежением, из-за того, что он был слишком слаб. На его глазах погибли его родственники и друзья. Повернув время вспять благодаря системе Звездной души, у него за спиной был шестидесятилетний опыт сражений и знаний стратегии. Снова вернувшись в Школу, с его знаниями он мог создать лучшего Генерала звездной души&hellip; всё, о чем он когда-то жалел, люди, которые когда-то предали его... В этот раз он не оставит места для сожалений.</p>
208	Рай монстров	monster-paradise	monster-paradise/589ef0f7ea85466d149ce18904df8cd0.jpg	Маньхуа	0	0	2021	0	113	<p>800 лет назад, 3 000 пространственных врат открылись по всему миру. Как будто 3 000 разноцветных глаз открылись и монстры хлынули из них, словно слёзы. Некоторые могли одним ударом уничтожить городские стены, тела их были гигантские и питались они людьми. Некоторые крепились к людям, вытягивали из них питательные вещества и порабощали их. Некоторые проникали в города, маскируясь под обычных жителей, в то время как питались они человеческой кровью, чтобы поддерживать свою жизнь.<br />\r\n<br />\r\nВ одну ночь человеческая раса упала на дно пищевой цепи, и мир превратился в рай для монстров...</p>
209	Великий маг в прямом эфире	bj-grad-mage	bj-grad-mage/c4bb6cbd55c3310ba871c19c9dd06419.jpg	Манхва	0	0	2022	0	90	<p>От автора манхвы &ldquo;Убить героя&rdquo;: Джун Хён У не обладал ни деньгами, ни талантом, ни даже удачей. &ldquo;Почему я вижу скрытую информацию в игре?&rdquo; После несчастного случая (удара током), Джун Хён У начал видеть в онлайн игре то, чего никто другой не мог видеть.</p>
211	Дракон внутри меня	dragon-inside-me	dragon-inside-me/ac90bc54115373cbbac41394ced26963.jpg	Маньхуа	0	0	2018	0	630	<p>Наставник императора небесного царства переродился во время учебы в старшей школы. Однако, он к удивлению, обнаружил, что в его теле также находится дракон&hellip; Сможешь ли ты сопротивляться угнетающим обстоятельствам или сдашься, когда ты еще очень слаб? В прошлой жизни он подчинился, но в этой жизни&hellip;выдающийся наставник императора теперь главенствует в городе, может одной ладонью обрушить небеса, но только в его голове крутилась лишь одна мысль: почему я, великий царь, оказался среди людей?</p>
212	Квестовое Превосходство	qust-suprmcy	qust-suprmcy/f1e2b87b97afa9535881e83a07b4cb57.jpg	Манхва	0	0	2021	0	112	<p><strong>[Действие происходит в той же вселенной, что и «Лукизм» и «Борьба в прямом эфире»] </strong></p><p></p><p><strong>Ким Сухён – обычный старшеклассник. Он не очень хорош в учебе, борьбе и совсем не привлекателен.</strong></p><p> </p><p><strong>Внезапно прямо перед ним возникает окно квестов.</strong></p><p> </p><p><strong>Получив возможности игровой [Системы] из ниоткуда, как наш герой будет противостоять стоящим перед ним вызовам?</strong></p>
213	Я единственный, кто использует заклинания	im-the-only-one-who-uses-spells	im-the-only-one-who-uses-spells/ef075f9c499612158623cc690cc9e9d5.jpg	Манхва	0	0	2020	0	134	<p>&quot;Было бы здорово, если бы я смог использовать все эти способности в жизни!&quot;<br />\r\nЯ думал, что исполнить это желание не под силу даже Богу, но в момент смертельной опасности, похоже он услышал меня.<br />\r\nСамое время сыграть в реальность!<br />\r\nДа, теперь я единственный, кто использует заклинания!</p>
214	Симбиоз между кроликом и чёрной пантерой	symbiosis-between-rabbit-and-panther	symbiosis-between-rabbit-and-panther/1ff95a9ed197f5404e8d9047d65c06a6.jpg	Манхва	0	0	2020	0	123	<p>Я кролик-оборотень, не сумевшая превратиться в человека к церемонии своего совершеннолетия. Моя семья сказала, что я лишь слабая полукровка, и бросили меня, оставив в корзинке&hellip;</p>
215	Архимаг, Преодолевающий Регрессию	74456-the-archmage-who-transcends-by-returning	74456-the-archmage-who-transcends-by-returning/50b5a35f43a76e9857ecb2d4fed893c9.jpg	Манхва	0	0	2022	0	80	<p>Михаил Вальфургис, единственный в мире маг 9-го круга, пал в ожесточенном бою из-за воина, проигравшего гнусному демону. В последний момент, на пороге смерти, он сумел применить могущественное магическое заклинание &lt;Возращение во времени&gt;. Обратив время вспять, он вернулся на 20 лет назад. &quot;Отлично, теперь я займу место того воина&quot;</p>
216	Гельмут: Отвергнутое дитя	hlmut	hlmut/b7d767c20c79dce0119b44ff2d5880f6.jpg	Манхва	0	0	2022	0	45	<p>Гельмут &ndash; ребёнок, которого младенцем бросили в лесу Демонических зверей. Лишь в юношестве он встретил своего первого человека &ndash; им оказался сам Дариэн &laquo;Святой Меч&raquo;. Вряд ли тогда он понимал, насколько кардинальна эта встреча изменит всю его жизнь... &mdash;Если хочешь выбраться отсюда, ты должен стать сильнее. Взращённый созданиями тьмы, Гельмут внезапно попал в мир людей! Он был несравнимым воином, обладал выдающейся внешностью и острым умом, только одного ему не хватало: человечности. &mdash;Отныне именно я &ndash; настоящий хищник!</p>
217	Бурный век	volcanic_age	volcanic_age/dea3a708a83af2f5301ae8b64dcb787d.jpg	Манхва	0	0	2017	0	251	<p>На смертном одре старейшина Чу Сочхон (주서천) жалеет о прожитой жизни, полной сомнений и сожалений. Он умирает, но вместо загробного мира возвращается в прошлое. Сможет ли он исправить свои ошибки и вновь прожить жизнь так, чтобы не сожалеть?</p>
218	Магический стрелок	matans-shooters	matans-shooters/8db727d37e096884d17504c59f61bcbc.jpg	Манхва	0	0	2021	0	136	<p><strong>Сериал про гиперреалистичную фэнтезийную игру! </strong></p><p></p><p><em>«Сержант Ха, ты сумасшедший ублюдок. </em></p><p><em>Ты выстрелил еще раз в пулю?» </em></p><p></p><p><strong>Меткий стрелок Ха ЛиХа просто хотел навсегда стать частью армии. </strong></p><p><strong>Однако из-за несчастного случая он стал парализованным и был отброшен обратно в общество. </strong></p><p><strong>Революционная игра VR [Средиземье] подарила ему новую жизнь. Деньги, полученные в [Средиземье], имеют реальную ценность!</strong></p><p><strong> Тем не менее, он испортил свой шанс, выбрав персонажа самого низкого уровня! «Я не такой, как другие.</strong></p><p><strong> Это все, что у меня есть». Черный порох, железные шары и шомполы ...</strong></p><p><strong><em> Я вам всем покажу, что такое настоящий «мушкетер»!</em></strong></p>
220	Семья мужа одержима мной	sworld-is-obsssd-with-m	sworld-is-obsssd-with-m/fc10a1cc2e9eafe224cb34f55ed7a228.jpg	Манхва	0	0	2021	0	83	<p>Семья моего мужа убила меня из-за наследства. Чтобы спасти свою жизнь и наследство, я вернулась в прошлое и заключила с графом Лафиреоном брак по договору сроком на один год.<br />\r\nТеперь мне необходимо благополучно развестись с ним..<br />\r\n&quot;Дорогая, ты думала, что сможешь сбежать от меня?&quot;<br />\r\nМой муж и вся его семья внезапно стали одержимы мной</p>
221	Чтобы не умереть	in-order-not-to-die	in-order-not-to-die/858d675f861d9bf7d6bf16966d4a3a25.jpg	Манхва	0	0	2021	0	106	<p><strong>Лим Даджун -&nbsp;ученик старшей школы и&nbsp;извечная&nbsp;мишень для издевок в школе. </strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Будучи уже на грани того, чтобы отказаться от своей жизни, он случайно натыкается на интервью по телевизору, в котором говорилось о школьнике,&nbsp;убившем своих одноклассников, которые издевались над ним.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Даджун вдохновляется увиденным и тоже решает отомстить.</p>\r\n\r\n<p><br />\r\n<strong>Месть удается, однако его&nbsp;жизнь переворачивается с ног на голову. Школьным денькам&nbsp;конец, и&nbsp;теперь ему придется выживать в жестоком уличном мире.</strong></p>
222	Гений необычайных кровей	extraordinary-pedigee-genius	extraordinary-pedigee-genius/4d3411235e01ed96e83a0fee7557074c.jpg	Манхва	0	0	2022	0	51	<p>Я просто хочу перебить всех захватчиков и жить своей обычной жизнью.<br />\r\nРазве я так многого прошу?<br />\r\nНо все только твердят: &quot;За двумя зайцами погонишься ни одного не поймаешь&quot;</p>
223	Шальные девчонки	girl_the_wilds	girl_the_wilds/high_cover.jpg	Манхва	0	0	2011	0	263	<p>Как вы думаете &mdash; какая самая главная проблема в романтике нашего времени? Конечно же, нехватка женственности и мужества. Зная творения писателей золотого века литературы, мы можем с лёгкостью сказать, какими милыми и воспитанными девушки были в те времена. Но годы идут, всё меняется... И об этих изменениях и расскажет эта манхва. &nbsp;&nbsp; Давайте представим обычную школу для девушек, &nbsp;в которой главную роль при обучении отводят боевым искусствам. Однажды управляющий этой школы призадумался и решил, что его ученицам не хватает женственности. В итоге школа переходит на совместное обучение. И вроде всё идёт как по маслу, но... Только&nbsp;один&nbsp;ученик мужского пола подал заявку на поступление. Без отца и матери он самостоятельно приглядывает за сестрой и братом. Вот и соблазнился стипендией за любые отметки, да и решил поступить в это заведение. Вот только не знал он, что в школе его поджидают девчонки - шальные, неудержимые и юные.</p>
224	Восхождение небесного демона	cultivation-of-havn	cultivation-of-havn/173fb9ca3468d8b438c6c658de59ee63.jpg	Манхва	0	0	2021	0	94	<p>Группа разведчиков была направлена в район секты горы Хуаньшань их великим лидером Мантисом. Главный герой, Соль Хви, сталкивается с Мастером секты Хуаньшань &ndash; Гу Чжон Мен и оказывается на грани смерти. Появляется окно статуса, которое возвращает его в то время, когда он ещё не принял роковую миссию.&nbsp;<br />\r\nВновь получив этот билет в один конец, Соль Хви изо всех сил пытается изменить свою судьбу. Окно статуса, которое появляется в критические моменты. Выбор с неизвестными последствиями.&nbsp;<br />\r\nЭто история Соль Хви, пытающегося найти лучшее решение, идущего по грани жизни и смерти.</p>
225	Бог войны, регрессировавший на 2 уровень	the-warlord-who-returned-to-level-2	the-warlord-who-returned-to-level-2/3cd88208df25eeb495171fe9aa0ce90c.jpg	Манхва	0	0	2023	0	37	<p>Battle Net – игра, обернувшаяся катастрофой для человечества. После создания Космической лиги все живые организмы во вселенной были вынуждены сражаться за своё выживание. Представители Земли, люди, терпели неудачу за неудачей, пока не были удалены за свою бесполезность. Выжил лишь один человек, боевой святой Сон Джихан, чья способность препятствовала его удалению. Благодаря этому случаю человечество получило ещё один шанс, воплотить который дано лишь Сон Джихану. Ему уже известно, чего ждать от игры, поэтому в этот раз всё будет иначе.</p>
226	Моя дочь — финальный босс	my-daughter-is-the-final-bos	my-daughter-is-the-final-bos/e0bb6dec89054da75d45fdbdd1d72dc1.jpg	Манхва	0	0	2022	0	102	<p>Моя дочь разрушила мир. В конце её дивергенции я беспомощно умер. Когда снова открыл глаза, передо мной стояла моя пятилетняя дочь. [Остановите пять несчастий Соль-а Ли. (0/5)] Мне дали ещё один шанс. Если её неправильно воспитать, то мир погибнет.</p>
227	Я застрял в одном и том же дне на тысячу лет	ive-been-stuck-on-the-same-day-for-a-thousand-years	ive-been-stuck-on-the-same-day-for-a-thousand-years/900190e689c44f961f8cec443fb337d1.jpg	Маньхуа	0	0	2022	0	52	<p>У Чэнь попал в ловушку постоянного повторения одного и того же 7 июля 2020 года! Он предавался безумству, совершал всевозможные преступления и в отчаянии расправлялся с собой, но в итоге все начиналось сначала. И так он повторял один и тот же день тысячу лет, пока однажды внезапно все не встало на свои места. Время: 8 июля 2020 года.</p>
228	Я оказалась в мире фэнтези романа	anyway-its-ok	anyway-its-ok/ce9b7fa2aa8044172d126f9459a6264f.jpg	Манхва	0	0	2021	0	96	По стандарту любого фэнтези романа, главная героиня Литтера попадает в мир новеллы. Для того, чтобы обрести счастливую жизнь, она предлагает Великому Герцогу северных земель заключить брак по договору. В представлении Литтеры герцог казался красивым молодым человеком с прекрасным характером, однако... на самом деле у него косматая борода, огромные шрамы по всему телу и яростный взгляд... "Когда фэнтези роман успел превратиться в новеллу о боевых искусствах?!" Интересно, сможет ли Литтера обрести свое счастье в этом непростом романе?
229	Бессмертный культиватор против суперспособностей	an-immortal-cultivator-against-superpowers	an-immortal-cultivator-against-superpowers/3e2453def560f933a51abf3549ac4b5a.jpg	Маньхуа	0	0	2020	0	281	<p>Могущественный человек с бессмертного континента случайно переместился в современное героическое общество, и на этой крошечной земле существуют суперспособности! Известные в этом мире супергерои, боровшиеся со злом, увидев в небе странного человека, сразу же решили разобраться с ним. Неизвестный никому стоящий в небе молодой парень, хотел лишь спросить, что это за место. Но супергерои не стали церемониться, даже не выслушав его, они решили показать все свои силы. И это оказалось для них огромнейшей ошибкой...</p>
230	Перерождение Убийцы в Копа	the-killer-police	the-killer-police/bbdfed2738d01115145da20b4e8597d9.jpg	Манхва	0	0	2023	0	39	<p><strong>Воспитанный убийцами знаменитый киллер Ким Кён Су по прозвищу &quot;Яркий Декабрь&quot; готовится исполнить свою последнюю миссию.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>однако погибает в результате предательства.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Легендарный убийца перерождается в теле полицейского и клянется отомстить обманщикам из клана Хвагукса.</strong></p>
231	Жуткий фармацевт: все мои пациенты ужасны	creepy-pharmacist-all-my-patients-are-horrible	creepy-pharmacist-all-my-patients-are-horrible/c115bcddcc481f4cf43c6172bb0ae096.jpg	Маньхуа	0	0	2023	0	176	<p>Поглотит ли его коварная тьма, или он превратится в страшное существо и выживет? Как врач, который должен лечить людей, попал в мир чудовищ? Лин Ан лечит «нежно» и «искренне» радуется каждому пациенту! «Анестезия? Используем в следующий раз». «Мой нож быстро справится с задачей, потерпите!» Добро пожаловать в аптеку «Кровавая пила», мы будем рады обслужить вас!</p>
232	Перерождение: Монстр	re_monster	re_monster/a161c8fa029c8f9b6d2a2ea329591fed.jpg	Манга	0	0	2014	0	100	<p>После смерти Томоки Каната возрождается слабым гоблином по имени Роу. Сохранив все воспоминания своей прежней жизни, он необычайно быстро эволюционирует, становясь сильнее и получая способности того, кого съест.Действия манги разворачиваются в альтернативном мире, где выживают лишь самые приспособленные. Сможет ли пати обычных гоблинов стать его героями в водовороте блестящих сюжетных поворотов нестандартного сценария?&nbsp;</p>
233	неОРДИНАРНЫЕ	unordinary	unordinary/59bdbdb48a4e9a559b61f353dd514119.jpg	Западный комикс	0	0	2015	0	330	<p>Не только <strong>супергерои</strong> обладают <strong>суперспособностями</strong>.<br />\r\nИногда и обычные люди могут удивить уникальными <strong>силами</strong>...</p>
289	Я стала горничной герцога	i-became-a-dukes-maid	i-became-a-dukes-maid/6ac546a91b39e10a887fc372af4d36c6.jpg	Манхва	0	0	2019	0	110	<p>Однажды, открыв глаза, я оказалась внутри популярной новеллы в качестве горничной герцога, второстепенного персонажа и злодея этой истории, Леандро Кийо Вел Лавити.&nbsp;Изменится ли судьба Леандро с появлением нового &laquo;особого&raquo; персонажа? И что же скрывается за его проклятием?</p>
234	Я создал бункер в замороженном мире	freezing-the-world-i-built-a-doomsday-safehouse	freezing-the-world-i-built-a-doomsday-safehouse/8e188fd7288ff13f9813e3cdac0c4d87.jpg	Маньхуа	0	0	2023	0	144	<p>Мир поглотил Ледниковый период, 95% человечества вымерло! В прошлой жизни чжан И погиб от руки человека, которому помог по доброте и наивности. Переродившись, он пробудил силу космоса, и стал словно безумец заниматься сбором ресурсов. Я стану единственным правителем этого ледяного ужаса! Клянусь, что отплачу за прошлую боль в стократном размере!</p>
235	Сорок тысяч лет культиваций	forty-millenniums-of-cultivation	forty-millenniums-of-cultivation/high_cover.jpg	Маньхуа	0	0	2016	0	374	<p>В современном мире духовная сила и технологии соединились воедино, это соединение дало начало Эре Культивирований!</p>\r\n\r\n<p>Это история о юноше, который хочет стать лучшим мастером артефактов в Эре Культивирований и исполнить мечту своего старика!</p>
236	Реинкарнация скелета	the-revolt-of-the-bones-from-the-fire-and-ash	the-revolt-of-the-bones-from-the-fire-and-ash/e6cd98c9d83966be0e5ac2cdec4bc627.jpg	Манхва	0	0	2021	0	24	<p>Давным-давно по всему миру начали образовываться порталы подземелий, из которых вылазили огромные монстры. В то же время среди людей начали появляться люди, обладающие сверхчеловеческой силой. Их именовали пробужденными. Этот мир, который больше похож на фэнтези новеллу... мир, в котором я живу. Однажды я случайно попал в одно из таких подземелий через портал странного цвета. Отныне моя жизнь, в которой мне приходилось только зарабатывать деньги ради выживания, полностью изменится.</p>
237	Вернувшийся игрок	a-relife-player	a-relife-player/2b29dced06a17186b67d9b8d15da9243.jpg	Манхва	0	0	2022	0	59	<p>[От создателей &lt;Чёртова реинкарнация&gt; и &lt;S-Ранг притворяющийся слабаком&gt;!]<br />\r\n&lt;Несмертный&gt; Но Юнха.<br />\r\nПосле трагической потери своей семьи он закрылся в себе с единственным желанием: найти и убить как можно больше чудовищ.<br />\r\nПрямо перед концом своей жизни в &lt;Подземелье Бездны&gt; я вернулся к началу своего жизненного пути.<br />\r\nРаз уж я переродился, стоит изменить мою жизнь.<br />\r\nРади своего счастья я пойду на всё.<br />\r\nРади выживания я буду делать всё, что угодно, включая бесчисленные убийства.<br />\r\nДаже если я должен пройти эту тернистую дорогу один и никто не узнает обо мне.<br />\r\nВ этой жизни я...</p>
238	Недосягаемая леди	unaccessible-lady	unaccessible-lady/8f5f6bbe2398b15d824f8330690c190e.jpg	Манхва	0	0	2020	0	122	<p>&mdash; Пожалуйста, Хиллис. Пожалуйста, умри вместо Габриэль. &mdash; произнёс мужчина.<br />\r\n<br />\r\nВпервые мой всегда величественный брат умолял меня. Он хотел, чтобы я отдала жизнь вместо нашей сестры, с которой мы даже не одной крови.<br />\r\n<br />\r\n&mdash; В первый и последний раз я прошу тебя об этом.<br />\r\n<br />\r\nЯ всегда была несчастна. В седьмой раз, когда меня предали и убили, я полностью освободилась от своих чувств к ним.<br />\r\n<br />\r\n&mdash; Рада, что ты так и остался мерзавцем.<br />\r\n<br />\r\nЯ больше никогда не поддамся влиянию любви. Теперь мой черёд быть эгоисткой.</p>
239	Я попал в мир ужасов с системой богатства	opening-trillions-of-plutonium	opening-trillions-of-plutonium/38bf37333ac6694058dab5e71f3841b3.jpg	Маньхуа	0	0	2023	0	73	<p>Однажды Линь Юй пробуждает Божественную систему, которая каждый день выплачивает ему деньги. Жалко лишь деньги не простые, а так называемые минби, что можно использовать только после смерти! Через несколько лет его накопления пробили отметку в триллион и внезапно ему пришло приглашение на бета-тест триллер-игры. Только вот это не компьютерная игра... в назначенный момент его переносят в мир ужасов, где обитают злые духи, что без проблем могут убить тебя. Единственный способ выжить - стать повелителем призраков! В то время как другие все еще со страхом пытаются угодить духам, Линь Юй со своим статусом Бога из-за данной ему системы отдыхает словно на курорте! Оказывается, когда есть деньги, можно и черта заставить крутить жернова!</p>
240	Учитель Святых Созвездий	constellations-are-my-disciples	constellations-are-my-disciples/b1f00ec28168d1009ae804868e81916d.jpg	Манхва	0	0	2023	0	44	<p>В прошлом, много лет назад, Богу боевых искусств Ким Хён О удалось освободить мир от угрозы начала конца, одолев Барче, босса Башни разрушения, под завалами которой Хён О и встретил свою смерть. Однако спустя три сотни лет он неожиданно переродился в теле 17-летнего Ким Джу Хёка, узнав, что &ldquo;созвездия&rdquo;, появившиеся за время его забвения &mdash; на самом деле его собственные ученики. Чтобы встретиться с каждым из них, он решил отправиться в долгое путешествие.</p>
241	Надоело быть профи, хочу отдыхать!	how-a-pro-from-a-previous-life-sucks-honey	how-a-pro-from-a-previous-life-sucks-honey/1b9a1cc1c0fd59ccff235da02a82e7d4.jpg	Манхва	0	0	2023	0	50	<p>Чёрт... я опять переродился. Это уже какое... 101 перерождение? Да и ещё фэнтези? Да как же меня всё это достало!</p><p>В этой жизни я принц, мать которого была служанкой. С одной стороны я принц, а с другой - никакое наследство мне не грозит. Вроде не всё так плохо: я ноунейм, на которого всем посрать.</p><p>Надеюсь, мне не потребуется опять спасать мир, а то я уже задолбался...</p>
242	Безграничный Некромант	the-all-master-necromancer	the-all-master-necromancer/82282c6135ffd1c82df3c8ee821e12d2.jpg	Манхва	0	0	2023	0	41	<p><strong>История от автора &laquo;Моей типичной Реинкарнации&raquo;.</strong><br />\r\n<br />\r\nБашня - загадочное место неустанных перемен.<br />\r\nДесять лет спустя я перевоплотился в тело мальчика, живущего на Земле в Южной Корее.<br />\r\n<br />\r\n&quot;Урод, что вонзил мне нож в спину, и тот, кто за ним стоит&hellip; Я им отомщу!&quot;<br />\r\n<br />\r\n<strong>Духовный мастер Ча Джин Хёк - человек, достигший вершины и получивший высший класс. Будучи &ldquo;Всемогущим&rdquo;, он отомстит, поднявшись на башню в качестве некроманта.</strong></p>
243	Я должен быть монстром	i-must-be-a-monster	i-must-be-a-monster/fd7a80191296925a379bde0a7230b026.jpg	Маньхуа	0	0	2022	0	44	<p>Спокойно защищая человечество, герой Сяо Цю внезапно оказывается в центре недопонимания и презрения от своих же соратников. Прожив не самую лучшую жизнь и вновь переродившись, он решает встать на путь хладнокровного и безжалостного монстра. &laquo;Спасать человечество?.. Хах, разве люди того стоят?&raquo;</p>
244	Игрок скрывает прошлое	the-player-hides-past	the-player-hides-past/fb40f644d8886e1afaebf0f6bdbf0bb5.jpg	Манхва	0	0	2023	0	31	<p>VR-игра «История континента Аркана» внезапно стала частью реальности. Для защиты мира появились синхронизированные с настоящими людьми «игроки».</p><p></p><p>Ли Хо Ёль, обычный офисный работник, получил тело персонажа, которого он создал ещё в средней школе – «Грандфелл Клауди Арфей Ромео». В обычной ситуации это было бы полным провалом, но не в случае Грандфелла, последнего «охотника на демонов»!</p>
245	Вернувшийся из ада - Хан Дэсон	daesung-han-came-back-from-hell	daesung-han-came-back-from-hell/4109ecf868e7bb27e1f42d04e6c887b5.jpg	Манхва	0	0	2023	0	61	<p>Хан Дэсон 80 лет провел в аду. Но вернувшись на Землю из абсолютного ада, пообещал отныне жить нормальной жизнью, но... Земля изменилась. Те, кто противостоят мне, я дам вам вкусить адскую боль!</p>
246	Это не твой ребенок	the-baby-isnt-your	the-baby-isnt-your/c5355e799d7826777755cf1c14428adf.jpg	Манхва	0	0	2022	0	60	<p>- &quot;...Это правда ребёнок? Внутри меня растёт малыш?&quot; Великая героиня Калия когда-то положила конец кровопролитной войне. Но однажды она узнаёт, что беременна. Отец ребёнка - архимаг империи и по совместительству лучший друг герцог Шаймон, с которым она провела всего одну страстную ночь.</p>\r\n\r\n<p>- &quot;Ты... всё ещё ненавидишь детей?&quot;</p>\r\n\r\n<p>-&quot;Ненавижу. Всё ещё. И буду продолжать ненавидеть&quot;. Из-за ответа Шаймона, Калия решила не раскрывать правду и, объявив об уходе с поста главнокомандующей рыцарского ордена, исчезла без следа.</p>
247	Удобно и хорошо, потому что ты злодейка?	its-nice-and-comfortable-because-youre-villainess	its-nice-and-comfortable-because-youre-villainess/4a8afee94d1f646c2f43a1015103227f.jpg	Манхва	0	0	2022	0	45	<p>&quot;Удобно и хорошо, потому что ты злодейка?&quot; - это манхва о том, как главная героиня Юн Дохви оставила свою жизнь неудачницы и перевоплотилась в злодейку, родившуюся с ложкой из орихалка во рту. Теперь она соединяет в себе милый характер, внешность коварной женщины и обширные знания.</p>
248	Мукхян — Дарк Леди	mookhyang--dark-lady	mookhyang--dark-lady/6a65fdb50f262c27ce2b5aea83a84bc7.jpg	Манхва	0	0	2019	0	200	<p>Будучи мастером школы темных искусств и непобедимым незыблемым истым демоном, Мукхян, к несчастью, попадает в странный фэнтезийный мир из-за магии своих врагов (школа искусств крови). В новом мире эльфов, колдунов, рыцарей и драконов, разворачивается приключение Мукхяна по поиску пути назад в его старый мир, Мурим.</p>
249	Токийские мстители	toukyou-revengers	toukyou-revengers/1b8782e90655c832e8e0ec088cbb9b33.jpg	Манга	0	0	2017	0	287	<p>В один день 26 летний девственник-неудачник, Такемичи, узнаёт, что единственная девушка, которая с ним встречалась, погибла в ходе разборок токийской группировки &ldquo;Свастоны&rdquo;. После того, как он падает под поезд, Такемичи перемещается на 12 лет назад, во времена средней школы. Он решает изменить будущее, дабы спасти девушку. Заручившись помощью от её младшего брата, Такемичи начинает свой путь к верхушкам самой опасной группировки города.</p>
250	Сказания о Бессмертных и го	lan-ke-qi-yuan	lan-ke-qi-yuan/76110e3fef12e386596405aa56d479e8.jpg	Маньхуа	0	0	2021	0	180	<p>Позвольте для начала рассказать вам легенду, что была заложена в название этой маньхуа &quot;Легенда Ланкешань&quot; (&quot;Гора&quot; с гнилой рукоятью топора) Легенда гласит о лесорубе, что забрел глубоко в лес, и встретил двух бессмертных, играющих в &quot;Го&quot; (Китайские шахматы). Лесоруба заинтересовала их игра, так что он отложил свой топор и наблюдал за игрой. Один из игроков в го дал ему что-то вроде семечки, чтобы тот не чувствовал ни голода, ни жажды. Впав в транс, и наблюдая за игрой час, а может два, он наконец очнувшись обернулся. &nbsp;Он обнаружил свой топор, рукоятка которой уже почти вся сгнила, а он сам оброс бородой. &nbsp;Вернувшись в свою деревню он обнаружил, что его семья исчезла, а в деревне его уже никто не знал.</p>\r\n\r\n<p>События в наши дни: Теперь главный герой выбрался на кемпинг, а его товарищи попросили сходить и набрать дров. Зайдя чуть в лес, он обнаружил одинокую доску для &quot;Го&quot; и почти сгнивший топор рядом с ней. Чуть задержавшись и сделав один ход, наш главный герой решил вернуться и рассказать об этом своим товарищам, но его встретила только поисковая группа, которая искала вот уже больше полумесяца, как вы уже догадались именно его, на ряду со всем случившимся, он потерял сознание, и в возрасте 19 лет &nbsp;умер от обезвоживания, и переродился в суровом и жестоком мире. Что его ждёт? Какова его дальнейшая судьба?</p>
251	Переродившийся убийца — гений фехтования	reincarnated-assassin-is-a-swordsman-genius	reincarnated-assassin-is-a-swordsman-genius/e2726b2be6a1570f7919f1cde7cf69dd.jpg	Манхва	0	0	2023	0	29	<p>Всю свою жизнь Раон словно пёс на цепи.<br />\r\n<br />\r\nОднако, благодаря повороту судьбы, он обрёл новую жизнь &mdash; пусть даже гнев остался в обрывках его порванного поводка.<br />\r\n<br />\r\nНаконец-то он смог встать на ноги и решил жить как диктует его воля.<br />\r\n<br />\r\n&mdash; Я убью любого, кто встанет на моем пути... даже если это будет бог.</p>
252	Бог боевых искусств	god_of_martial_arts	god_of_martial_arts/e6a29c5b1bed6c1b3b662533fb998eed.jpg	Маньхуа	0	0	2017	0	382	<p>В этом мире пользуются уважением боевые искусства. У слабых боевых искусств достаточно силы, чтобы рассекать валуны. Сильные же могут разделить реки и расколоть горы. Есть среди мастеров Короли боевых искусств, всезнающие и способные пересечь Вселенную. Боевое искусство здесь решает всё &mdash; судьбу, жизнь и смерть. Статус людей в этом мире определяет их уровень боевых искусств. Слабых унижают, пока сильные смотрят на мир свысока. Каждая фракция борется за титул &laquo;Сильнейшей&raquo;. Только у сильных есть право на выживание. Неважно, в каком&nbsp;клане или фракции ты состоишь, если ты слаб, над тобой будут издеваться и изгонять без пощады.</p>
253	Моя эволюция в демона	i-evolution-devil	i-evolution-devil/bd7468d9991c6893599ed301b6840066.jpg	Маньхуа	0	0	2023	0	38	<p>Сильнейший воин человечества, Ан, находясь на грани смерти, странным образом перемещается на 60 лет в будущее, где узнаёт, что внутри него скрыта неоднозначная сила &laquo;самого могущественного демона&raquo;.<br />\r\nЧтобы исправить свои прежнее ошибки и докопаться до правды, ему остаётся только постоянно &laquo;эволюционировать&raquo;, только так можно избежать повторения судьбы прошлого.<br />\r\n&laquo;Теперь не нужно полагаться на удачу, мое будущее в моих руках!&raquo;</p>
254	Игрок	player	player/fcc418f5b25255676fc4913b360c7ea7.jpg	Манхва	0	0	2020	0	186	Из-за обещания данного в лучшем комментарии, я стал главным героем вебтуна.
255	Безумная эволюция	evolution-frnzy	evolution-frnzy/cf9f28d2e9f5cd6da6e66e0640bbaa43.jpg	Маньхуа	0	0	2021	0	160	<p>После смерти Дуань Фэй возвращается на 20 лет назад во времени всего за несколько часов до начала вирусной катастрофы, и ему выпал шанс исправить то, о чем он сожалел последние 20 долгих лет. Он использует все знания, которые накопил до того, как попасть в прошлое, чтобы вооружиться и быть готовым к надвигающемуся апокалипсису. Его недавно приобретенное &laquo;Эволюционное древо&raquo; также помогает ему постоянно улучшать свою силу. Дуань Фэй, который из последних сил пытался выжить в своей предыдущей жизни, теперь герой и будущий спаситель мира.</p>
263	Мукхян: Начало	mukhyang-the-origin	mukhyang-the-origin/c54557324556b450fdf7e4b66d07d3e1.jpg	Манхва	0	0	2021	0	47	Эта история разворачивается в легендарном Муриме, где многочисленные силы борются за превосходство. Номер 2044 ещё в детстве похищает демонический культ, чтобы воспитать из него наёмного убийцу. Но он сумел выжить в тяжёлых тренировках, прошёл через множество испытаний и получил имя “Мукхян” в знак признания своих навыков.\r\n\r\nОднако Мукхян на протяжении всей жизни испытывал неудовлетворённую тягу к следованию пути меча! Образ жизни убийцы не смог помочь ему утихомирить то, что у него внутри, но всё меняется, когда он встречает учителя - “Хван Сагом Юпэка”. Сможет ли Мукхян достигнуть уровня Тальма – наивысшей точки мастерства в боевых искусствах?\r\n\r\nМукхяну предстоит сразиться со множеством мастеров и узнать, есть ли предел его силе!\r\n\r\nВозвращение легендарного героя!
256	Сильнейшие люди мира одержимы мной	the-strongest-people-in-the-world-are-bsessed-with-me	the-strongest-people-in-the-world-are-bsessed-with-me/22479d35318c58662a960b8eb2997db4.jpg	Манхва	0	0	2021	0	96	<p>Однажды, когда ей было тринадцать лет, внезапно вспомнила свою прошлую жизнь. Это обедневший игровой мир отомэ, где главные герои сходят с ума, а она родилась сестрой худшего злодея будущего!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Нельзя допустить такого конца! Семья будет истреблена, а меня выбросят. Так что, несмотря ни на что, я должна как можно скорее покинуть эту семью!</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&laquo;Теперь, когда это так, мне нужно ослабить их бдительность и убежать.&raquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Чтобы избавиться от родственников, которые нацелены на семью и лукавого императора, лучше иметь благосклонность к моему брату.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&laquo;Я хочу танцевать с Далией. В чем проблема?&raquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&laquo;Мне очень жаль, но моя сестра стесняется&raquo;.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&laquo;Далия сказала, что я ее любимец!&raquo;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Почему-то я приручила не только своего брата, но и все сильнейшие персонажи в этом мире одержимы мной!</p>
257	Осколок времени	house-of-time	house-of-time/a58960b151f21a8d5685c95ab13f0097.jpg	Манхва	0	0	2020	0	130	Девушка, подвергшаяся насилию. Встречается с мужчиной средних лет, обладающим ужасным характером и всё это время жившем в мире, где ничего нет.
258	Выжить в романе	to-survive-in-the-novel	to-survive-in-the-novel/37268279adf0d27824c05fccbcfc7cbc.jpg	Манхва	0	0	2021	0	102	<p>Чарли ведет блаженную и комфортную жизнь в любовном романе. Она настолько сильно зациклена на главном герое романа - Джине, что все статисты превращаются в буквально в черные тени. Но вот однажды ее история внезапно меняет жанры. И вот она осознает, что, если она хочет жить, то ей нужно будет объединиться с статистами, которых она раньше игнорировала, и работать с ними вместе, чтобы выжить.</p>
259	Создатель концовки	43208-endings-maker	43208-endings-maker/36fdb210a0cfddf0eb90a133ac75d8f9.jpg	Манхва	0	0	2022	0	56	<p>Два профессиональных игрока в игре &quot;Легенда Героев 2&quot;: Кан Чжин Хо - Первый в мировом топе и Хон Ю Хи - вторая в мировом топе, однажды открыли глаза и оказались внутри своей любимой игры в телах игровых персонажей.</p>\r\n\r\n<p><br />\r\n- Эй, и ты... тоже?</p>\r\n\r\n<p><br />\r\n- Д-да, и я...</p>\r\n\r\n<p><br />\r\nФиналом &quot;Легенды Героев 2 &quot; является разрушение человеческого мира.&nbsp;<br />\r\nОднако, если они не одни... если топ 1 и топ 2 мира вместе... то... Они вновь пройдут по протоптанному пути с намерениями добиться &quot;Хорошей Концовки&quot;!</p>
260	Ограниченный временем тёмный рыцарь	the-timelimited-genius-dark-knight	the-timelimited-genius-dark-knight/08f27560b1849259ca95f83ece3a5386.jpg	Манхва	0	0	2023	0	34	<p>- Фэнтезийная RPG, печально известная своей высокой сложностью.<br/><br/>Только вот для Ючхона, у которого в юном возрасте была диагностирована неизлечимая болезнь, эта игра была всей его жизнью и теперь стала реальностью.<br/><br/>Отныне Ючхон должен выживать в этом мире как Нокс фон Рейнхард, худший злодей в первом акте игры. Сможет ли он благополучно дойти до конца истории?</p>
261	Имбовая деревянная дубинка 99-го Уровня	99-reinfored-wood-stick	99-reinfored-wood-stick/abb816c100cb45ebd7c5669f54a1e744.jpg	Манхва	0	0	2022	0	85	<p>В онлайн игре Chrono Life я познал страшную тайну о законах, которые на самом деле царят в этом совершенном фентезийном мире. Каким-то чудом мне удалось прокачать совершенно бесполезное оружие для новичков - деревянную дубинку - до имбового уровня 99+. И теперь настал мой час отомстить тем, кто потешался надо мной! Начнём имбовое приключение!</p>
262	Распятие Шести	juujika-no-rokunin	juujika-no-rokunin/4c2e1c9c7a0513990eadfd5a018807f7.jpg	Манга	0	0	2020	0	145	<p>&laquo;Можно ли убивать людей?&raquo;<br />\r\n&laquo;Сюн, если он&nbsp;перевоплотился, отпусти его. Ему нужно дать шанс&raquo;.<br />\r\n&laquo;Дедушка, надеюсь, он не переродится&raquo;.<br />\r\nЧтобы победить нескольких бесчеловечных монстров, мальчик сам стал чем-то ужасным.<br />\r\nСюн Урума, ученик шестого класса, которого пять одноклассников назвали &laquo;Экспериментальным телом: А&raquo;, они подвергали его жестоким издевательствам, он жил в аду. Единственной отрадой были младший брат и родители, которые защищали его .... пока пять монстров их не убили.<br />\r\nКогда он наконец теряет все и сталкивается с настоящим адом, внутри Сюна рождается тёмное &laquo;желание&raquo;. Он переродился под воздействием тренировок своего деда, который служил в секретном подразделении во время Второй мировой войны. Теперь, четыре года спустя, он предстанет перед своим судьбоносным врагом.<br />\r\n&laquo;Я не позволю НИКОМУ забрать мою&nbsp;месть&raquo;.</p>
265	Эстио	esti	esti/2fb246fcb217ae09048aba2862301a50.jpg	Манхва	0	0	2022	0	94	<p>&laquo;Это ты звал меня?&raquo; Черношёрстный зверь смотрел на него снизу своими жёлтыми сияющими глазами. &laquo;Теперь всё хорошо. Больше не будет больно. Поэтому всё хорошо&raquo;. Эстио &ndash; младший сын, рождённый в семье фермера. Но все люди его презирали. Он ребёнок, который читает души животных и людей. И&hellip; &laquo;Ребёнок, получивший проклятие&raquo;. Наконец, церемония взросления, которая проводится, как только человеку исполняется 19 лет. И вот Эстио отправляется в путешествие, чтобы обрести своё счастье. По мотивам веб-романа известного писателя Кон Дынтхапа.</p>
266	Раскол	pounding	pounding/high_cover.jpg	Манхва	0	0	2018	0	81	<p>Я был в отчаянии из-за своей никчемной жизни. Все изменилось, когда я встретил его. Он мой спаситель, но ... также и мой злейший враг.</p>
267	Я не святой, а доктор!	the-saint-is-the-horn-the-power-of-modern-medcine	the-saint-is-the-horn-the-power-of-modern-medcine/28e97794c82255e8b4fed9f6d6034978.jpg	Манхва	0	0	2022	0	72	<p>Ю Сонг &ndash; гениальный врач, широко известный в мире медицины. Всю свою жизнь он провёл в операционной. Попав в ДТП, Ю Сонг очнулся в другом мире. Но... Святой? Священная Империя? Магия исцеления?</p>\r\n\r\n<p>&laquo;Я приложил столько усилий, изучая медицину, но теперь всё, что мне нужно сделать: это прикоснуться к кому-нибудь, и он будет полностью здоров? Серьёзно, кажется, я сошёл с ума&raquo;.</p>
268	Всё, что тебе нужно - это убивать	edge_of_tomorrow	edge_of_tomorrow/high_cover.jpg	Манга	0	0	2014	0	17	<p>Сюжет подаётся от лица Кэйдзи Кирии &mdash; нового рекрута Объединённого Фронта Обороны, ведущего войну с таинственными пришельцами, нападающими на Землю. Первый же бой оказывается для Кэйдзи последним. Но, вместо того, чтобы спокойно отойти в мир иной, он попадает во временную петлю. После каждой смерти его переносит в прошлое, ровно за один день до судьбоносной битвы. Застряв в этом цикле смертей и перерождений, Кэйдзи постепенно набирается боевого опыта и безуспешно старается изменить свою судьбу. Позже он встречает девушку и надеется с ее помощью покинуть этот замкнутый круг.</p>
269	Игрок 1-го уровня	level-1-player	level-1-player/2d6742a51075657a54545b30379bef41.jpg	Манхва	0	0	2022	0	80	<p>[Он &ndash; исключение из правил, которым подчиняется мир охотников, не кто иной, как первоуровневый, способный уничтожать ранкеров!]<br />\r\n&laquo;Ты пробудился&raquo;.<br />\r\nС ним наконец произошло настоящее долгожданное &laquo;чудо&raquo;! Казалось бы, теперь жизнь изменится и дела пойдут на лад...<br />\r\n&ndash; Подожди. Почему я не могу повысить свой уровень?<br />\r\nМало того, что стата пошла по пи**е, так ещё и навыков ноль!.. Когда Хен Сон от отчаяния начал сетовать на своего проклятого персонажа и судьбу-злодейку, заметил странный уникальный навык.<br />\r\n&ndash; Продажа и покупка.<br />\r\n&nbsp;</p>
270	Принцесса, запечатлевшая изменника	princess-imprinted-the-traitor	princess-imprinted-the-traitor/902b7703b34c4cd35d8a7845c0fbb652.jpg	Манхва	0	0	2021	0	58	<p>После падения императорской семьи от рук гомункулов, седьмая принцесса Ивенроуз умирает, выпив яд, предложенный сестрой. Очнувшись, она узнает, что вернулась на восемь лет назад и решает сделать Михаэлиса, короля гомункулов и чудовища, своим личным рыцарем, чтобы предотвратить восстание и гибель своего рода.<br />\r\n&quot;Михаэлис, ты мне нужен. Очень сильно. &quot;</p>
271	Я стала женой принца-монстра	i-became-the-wife-of-a-monster-prince	i-became-the-wife-of-a-monster-prince/f449beecf4ffa6ba3b404ab08b6a71cd.jpg	Манхва	0	0	2021	0	88	<p><strong>Она переселилась в тело Ансии, нынешней жены чудовищного наследного принца Блейка, в любовном романе 19+.<br />\r\n<br />\r\nВ оригинальной истории Ансия покончила с собой в день их свадьбы, в результате чего Блейк получил тяжелую травму. Но на этот раз Ансия не сделает ничего подобного.<br />\r\n<br />\r\nВ оригинальном романе Блейк был второстепенным персонажем. Его изображали как зверя, обладающего невероятной красотой. Но сейчас он подобен милому кролику.<br />\r\n<br />\r\nЕдинственный человек, который может снять проклятие наследного принца, &mdash; это героиня Диана. Моя же роль состоит в том, дабы не дать этому маленькому кролику пострадать, а затем погибнуть, но&hellip;<br />\r\n<br />\r\n&mdash; Ансия, не оставляй меня!<br />\r\n<br />\r\nЭтот прекрасный кролик продолжает преследовать меня. Что же мне делать?</strong></p>
272	Моя девушка - зомби	my-girlfriend-is-a-zombie	my-girlfriend-is-a-zombie/18f3f6ab45060c28809c1a83026cd40b.jpg	Маньхуа	0	0	2019	0	382	<p>Когда люди начали превращаться в зомби, у обычного парня по имени Лин Мо пробудилась способность управлять ими. Он использовал свою силу, чтобы найти свою девушку по имени Ё Лиан, которая превратилась в зомби... По роману Хэй-Ань Личжи «Моя девушка — зомби» (кит. 我的女友是丧尸). Китайское название маньхуа отличается от романа: «我的病毒女友» — «Моя заражённая девушка».</p>
273	Ради моего брошенного любимого	for-my-lost-love	for-my-lost-love/42766e47dfa1705630debb53341e144a.jpg	Манхва	0	0	2022	0	61	<p>Только спаси моего любимого!.. Хестия взахлеб прочитала до конца роман и заснула, а очнулась персонажем произведения &ndash; но не главной героиней, а &quot;экстра&quot;, лишней единицей. Она любовалась главными героями издалека, не вмешиваясь, и роман дошёл до финала согласно сюжету. Но ожидание возвращения в реальную жизнь разбилось вдребезги. Хестия застряла в романе ещё на год, пока однажды её любимый не столкнулся с ней. &quot;Теперь я защищу своего любимого!&quot;</p>
274	Давайте сменим жанр	lets-change-the-genre	lets-change-the-genre/d2acb7a92372b2ecaf81e3934ddd9ff3.jpg	Манхва	0	0	2021	0	81	<p>В любимом романе я превратилась в злую тетку главного героя.</p>\r\n\r\n<p>Я оберегала и заботилась о своем племяннике, зная, что скоро мне придется с ним расстаться.</p>\r\n\r\n<p>Но когда за племянником пришел привлекательный мужчина и спросил, можно ли взять его с собой,</p>\r\n\r\n<p>племянник вдруг подбежал ко мне, обнял за талию и закричал &quot;мама&quot;.</p>
275	Легендарный хирург	surgen-who-got-burned-out	surgen-who-got-burned-out/07e5a0fa335660edc0224d40492d779f.jpg	Манхва	0	0	2022	0	90	<p>Из-за своего прямолинейного характера Хан Джин Су, врач-интерн 3 года в отделении общей хирургии, однажды умер. Но благодаря хорошим поступкам, получил возможность возрождения от ангела, дьявола или какой-то неизвестной системы. И вот уже Хан Джин Су воскресает в теле убитого разбойниками господина. Кстати, это что, тело легендарного хирурга Хуа То?!&nbsp;</p>\r\n\r\n<p>В эпоху героев и военной смуты, в эпоху гостепреимства и грубых слов, Хан Джин Су пытается с достоинством прожить жизнь прославленного хирурга...</p>\r\n\r\n<p>Да начнется необычное приключение молодого хирурга в мире &quot;Троецарствия&quot;!</p>
276	С сегодняшнего дня я лорд города	starting-from-today-ill-work-as-a-city-lord	starting-from-today-ill-work-as-a-city-lord/da931310cbdbde304c83e0c71451a750.jpg	Маньхуа	0	0	2019	0	465	Нашего героя-отаку убило лёгким движением ноги в 220 вольт , Ну и что ? Неко-тян сестра, лиса Лоли, милая кролик младшая сестра... это не зоопарк! Это другой мир куда закинуло нашего ГГ , где сильные охотятся на слабых, но опять же не все так замечательно как хотелось бы!
277	Маг на полную ставку	versatile_mage	versatile_mage/ddb74ecc19e2fe05d7cd978b9a9e071c.jpg	Маньхуа	0	0	2018	0	1013	<p>Он проснулся в знакомом мире, который так сильно изменился. Его знакомая школа стала магической школой, которая учит волшебству, побуждая всех стать могущественными волшебниками. За пределами города бродят множество монстров. Мир науки и технологии превратился в мир магии!<br />\r\nНесмотря на это, его амбиции и положение в обществе не изменилось. Он отброс общества, у которого сестра-инвалид, которая не может ходить. Тем не менее, Мо Фань обнаружил, что все люди могут управлять лишь одним элементом, но только не он, ему подвластно больше!</p>
278	Гениальный Мечник Академии	academy-genius-swordsman	academy-genius-swordsman/a47f4d8e13585561d4c6786a0e9f952b.jpg	Манхва	0	0	2023	0	24	<p>Жизнь Ронана была бесцельной и полной сожалений. Но в конце его бестолковых дней ему выпал второй шанс - он вернулся на десять лет назад! Он полон решимости начать новую жизнь во имя людей, пожертвовавших своими жизнями ради него.</p>
279	Две Луны	two-moon	two-moon/ce07eea8f280998fb3b76ecf1c883de1.jpg	Манхва	0	0	2015	0	84	<p>Принцу Джину одиннадцать, когда он исчезает в лесу посреди ночи. Он встречает таинственное существо, которое захватывает его тело и превращает его в гибрид с огромной силой. Пять лет спустя он возвращается и требует земли и богатства своей семьи. Они были переданы дочери Императора, которая теперь живет на его земле. Благодаря своему медальону Джин доказал что он принц, поэтому королева Бёк Ха вынуждена уйти. Некоторые люди хотят избавиться от него, послав ниндзя, чтобы убить его... Но уничтожить его будет нелегко! Его сверхчеловеческие способности позволяют ему защищать себя и сражаться.</p>
281	Не приходите в канцелярский магазин злодейки!	dont-come-to-the-villans-stationery-shop	dont-come-to-the-villans-stationery-shop/f0a6d0a262dc044d6bb26b175b5c83c0.jpg	Манхва	0	0	2022	0	76	<p>&mdash;Ты позоришь имя нашей семьи. Забирай эти деньги и вали отсюда!<br />\r\n&mdash;Отлично! Пока-пока!<br />\r\n<br />\r\nОна очнулась ни на что не способной злодейкой, которая творила зло, чтобы завоевать любовь её жениха, главного героя.<br />\r\n<br />\r\nЕё репутация и без того была на дне, а главные герои, которые не могут жить друг без друга, закрутили роман.<br />\r\n&mdash;Меня хоть и выперли, но дали деньги &ndash; уже неплохо!<br />\r\n<br />\r\nПосле того, как её выгнали из дома, она открыла первый магазин канцелярских товаров прямо перед школой. Помимо прочего, там продаются закуски, сладости и даже жвачка! Ну, детишки, держитесь!<br />\r\n<br />\r\nНо&hellip; Почему её юные клиенты такие странные?<br />\r\n<br />\r\n&mdash;Я найду тебе красивого и скромного парня, а не дурня, ходящего налево, как мой брат!<br />\r\n&mdash;Ха, а как насчет моего брата, наследного принца?<br />\r\n&mdash;Хозяин Башни просто лучший.<br />\r\n<br />\r\nВеликий магический воин, королевский принц, ужасающий владелец башни и таинственный злодей.<br />\r\n<br />\r\nМирная жизнь, которую она хотела от магазина канцелярии, обернулась совсем иначе.<br />\r\nПомогите! Я просто хотела жить нормальной жизнью!</p>
282	Рыцарь огня	knight-of-the-remaining-fire	knight-of-the-remaining-fire/0b06200339c3d0cf742ce1fb9ff95d97.jpg	Манхва	0	0	2021	0	113	<p>Мой брат-близнец, единственный член семьи, восходящая звезда и главный кандидат на становление рыцарем, был убит. В отличие от него, у меня совсем не было таланта к боевым искусствам. Однако ради того, чтобы отомстить за своего брата, я должен стать сильнее.</p>
283	Прорыв игрока	game-master	game-master/31fd8b270e1f047f9c43ee3219d1f432.jpg	Манхва	0	0	2020	0	125	<p>Ким Ки Бон, молодой парень, оказался в ловушке из-за неизвестных ему обстоятельств. И только через три тысячи лет, он смог &quot;пробудиться&quot;. Но в реальности прошло лишь 10 лет, и за это время, весь мир был наводнён разными и ужасными монстрами..<br />\r\nИ с этого момента, пробудившийся Ким Ки Бон вступает в битву, чтобы найти ответы на все свои вопросы.</p>
284	Ген Супер Бога	supergene	supergene/1e0173d83c0227585c606b4c4b5c18a0.jpg	Маньхуа	0	0	2022	0	186	<p>В межзвёздном будущем на планету вторглись бесчисленные инопланетные звери, поедая которых люди могут получить новые гены. Хан Сен, новичок, на первый взгляд &quot;демон&quot;, но также &quot;Бог&quot;, на которого все равняются!<br />\r\n&laquo;Увы, но я единственный, кто может получить ген Сверхбога!&raquo;</p>
285	Шаман великого духа	shaman-of-stormy-spirit	shaman-of-stormy-spirit/16886a26260ca9beb732500a961aa1a4.jpg	Манхва	0	0	2020	0	116	<p>Он отправится в ад, если Жнец Смерти трижды назовёт его имя: (Хюкренмуган), (Хюкренмуган), (Хюкренму&hellip;) Эй, ты, мерзавец! Изыди, ведь я должен жить!!! Не могу поверить, что, съев траву вечной молодости, остался в живых. Но, очнувшись, не мог понять, почему меня окружают даосские монахи, и надеялся, что это лишь сон! Везде эти мастера из Мутанга?! И какого чёрта я оказался в теле мальчишки на побегушках&hellip; Я сошёл с ума?! Да чтоб я&hellip; Всемогущий Хюкренмуган, хозяин Сапэчхона! Мерзавцы-мастера Мутанга, это всё ваших рук дело! Нужно оставаться хладнокровным. Став главным учеником Мутанга, вам несдобровать. Ну что ж, следите за судьбой самого безжалостного и подлого властелина Мурима, хозяина Сапэчхона, Хюкренмугана вместе с нами!</p>
286	Лучший наставник	a-place	a-place/b0203c2aa0d684a3c29135905fa9dece.jpg	Манхва	0	0	2021	0	99	<p>Он обучился сильнейшим техникам боевых искусств,&nbsp;только чтобы быть убитым и переродиться в деревенского наставника по имени Пэк Сурён, известного как &laquo;Один удар&raquo;!</p>
287	Свет и тень	light__shadow	light__shadow/high_cover.jpg	Манхва	0	0	2016	0	103	<p>Это грубое оскорбление, когда замуж за герцога Элая отдают скромную и упрямую горничную Эдну, а не благородную девушку, которую он ждал. Однако амбициозная горничная скрывает еще большую тайну, ту, которая может изменить историю самого королевства. Могут ли эти двое найти свободу, искупление и любовь - не обводя друг друга мечами?</p>
288	Небылица мачехи	a-stepmothers-fairy-tale	a-stepmothers-fairy-tale/ee724530260a71c6758b0372ae7917f6.jpg	Манхва	0	0	2017	0	121	<p>&laquo;Железная вдова&raquo;, &laquo;чёрная вдова&raquo;, &laquo;охотница на мужчин&raquo;, &laquo;ведьма из замка Нойванштайн&raquo;, позор всех благородных дам&hellip; Все эти слова использовались для описания маркизы, Сури ван Нойванштайн. Несмотря на то, что она подверглась такой критике от всего мира, у неё получилось вырастить и воспитать детей, которые не имели с ней кровного родства.<br />\r\nИ наконец, в день свадьбы первого сына Джереми, она почувствовала, что весь её тяжёлый труд был не напрасен. Но маркиза ужасно ошиблась. Она получила сообщение с просьбой не присутствовать на свадьбе и попала в аварию, покидая замок. Но когда вновь открыла глаза, то проснулась в день похорон своего мужа, семь лет назад.&laquo;Я отказываюсь больше страдать. В этот раз я не буду жить так, как раньше!&raquo;</p>
290	Таков закон	this-is-the-law	this-is-the-law/a9213016b6c8bbc9436852c221cb1d41.jpg	Манхва	0	0	2021	0	115	<p>Фантастика о возвращении гениального адвоката! Но Хёнджин был выпускником университета с отличием по адвокатуре, и так называемым успешным адвокатом с 95% выигрышам по делам! В борьбе со злом в лице высшей власти Южной Корее, пытаясь вернуть справедливость в свою страну, он был безжалостно убит агентами национального агентства разведки.<br />\r\n<br />\r\n&ldquo;Он не должен был умирать&hellip;&rdquo; Но Хёнджин был возвращен императором Ёмра, чтобы очистить коррупцию на Земле, вернув его назад во времени и дав некую силу. Что же за силу ему даровал император? Сможет ли Но Хёнджин изменить как своё будущее, так и всей Южной Кореи?!</p>
291	Лунный бог, приключение и другой мир	moon_led	moon_led/7454ee7db4b512d9a1eeb61d25f3aef2.jpg	Манга	0	0	2015	0	90	<p><strong>Мидзуми Макото &ndash; ученик старшей школы, перенесенный в другой мир богом Цукуёми. </strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Он должен был стать героем, но пришелся не по нраву местной богине.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Выброшенный на край мира, Макото должен найти свой собственный путь!</strong></p>
292	Битва Сверхлюдей	superman-game	superman-game/baa083648a0d4cb256b9d52a94a58582.jpg	Манхва	0	0	2022	0	83	<p><strong>Когда-то Со Мун Еоп был самым сильным сверхчеловеком в мире и он пожертвовал своей жизнью ради спасения человечества. Он думал, что умер, но не тут то было - неведомая сила перемещает его во времени на 17 лет вперёд, в мирное будущее, где сверхчеловеческие соревнования совершенно меняют смысл и суть. Футуристический экшн-блокбастер начинается!</strong></p>
293	Смерть от меня всё никак не отстаёт	my-death-flags-show-no-sign-of-ending	my-death-flags-show-no-sign-of-ending/edd5720b14941f89f2caaafe582a9aca.jpg	Манга	0	0	2018	0	62	<p><strong>Когда он пришел в себя, Хирасава Казуки, обычный студент университета, обнаружил, что обладает телом игрового персонажа.</strong></p>
294	Операция "Истинная любовь"	operation-name-pure-love	operation-name-pure-love/194babb4fe958bef9d3ef32f5fc86d2c.jpg	Манхва	0	0	2022	0	88	<p>Я застала поцелуй своего парня и лучшей подруги. Невольным свидетелем поцелуя стал не кто иной, как мой одноклассник Ко Ынхёк, с которым у меня нелучшие отношения. Я в полном замешательстве&hellip; Количество любви, которое получает каждый человек за всю жизнь, как-то предопределено?? И у меня это количество равно нулю??? План &laquo;измена&raquo; с участием бедной Суэ, которая пытается изменить свою судьбу и Ынхёка, который впутался в это дело! Они лишь собирались сделать вид, что изменяют, но это постепенно перерастает во что-то большее?! Этот план&hellip; ведь сработает?</p>
295	Возрождение мага восьми кругов	the-rebirth-of-an-8thcircled-mage	the-rebirth-of-an-8thcircled-mage/6484b0f77eb50a88aeff7229866df8bf.jpg	Манхва	0	0	2020	0	152	<p>Герой, спасший целый континент Верховный архимаг восьми кругов Генри Морис. После смерти императора Сондэ, с которым он был близок, аристократы превратили сына императора в марионетку, а он был казнён за измену. Уже умирая, в момент, когда все должно было закончиться, он перемещается в тело слабого и, по всей видимости, ленивого сына барона по имени &quot;Генри&quot;. Теперь великий маг восьми кругов станет мастером меча! Роскошная и жестокая месть Генри начинается сейчас!</p>
296	Только троньте моего братика, и всем вам конец	if-you-touch-my-brother-you-are-all-dead	if-you-touch-my-brother-you-are-all-dead/00c4ba97140eac60fcba9c6e7362ad34.jpg	Манхва	0	0	2021	0	74	<p>Я стала шестнадцатилетней Розалитой.Свалившись с кровати и открыв глаза, я обнаружила себя в классической сумасшедшей, страстной, но утомляющей BL новелле &laquo;Астерион голубого звёздного неба&raquo;. Из всех возможных вариантов, я стала старшей сестрой главного героя Астериона, которому суждено покончить жизнь самоубийством.</p>\r\n\r\n<p>Я решила просто плыть по течению и дойти так до финала новеллы, но стоило этому произойти, меня вернуло обратно в тело Розалиты.</p>\r\n\r\n<p>Поскольку прошлое решение было неверным, во второй раз я попробовала растить своего братика в любви, но и на этот раз он погиб, пусть и не по своей воле. Я же вновь вернулась к началу.</p>\r\n\r\n<p>Тогда я попробовала совершенно другую тактику &ndash; сфокусироваться не на брате, а на самой себе. Но и это не помогло. Я переродилась, даже обучившись магии, прямо во время написания моего выпускного диплома в башне.</p>\r\n\r\n<p>А раз я постоянно возвращаюсь в тело Розалиты Роксбог, стоит попробовать найти способ для собственной красивой смерти.</p>
48	Почтенный бессмертный Ло Вуцзи	xianzun-luo-wuji	xianzun-luo-wuji/f5d1e757dc5388e80fc5fa95fe0eb647.jpg	Маньхуа	8	1	2021	1	247	<p>Бессмертный Ло Вуцзи, возрождается в наше время, когда он еще был подростком.</p>
2	Пик боевых искусств	martial_peak	martial_peak/56169d91c6668d8ab647b3c781e453fc.jpg	Маньхуа	8	1	2018	0	3631	<p>На основе одноименного романа. Путь на вершину боевых искусств - путь одинокий и длинный. Перед лицом невзгод ты должен оставаться сильным и неотступным. Только тогда ты сможешь преодолеть все препятствия и стать по-настоящему сильным. Небесная Башня обучает своих учеников самым суровым образом, чтобы они могли выстоять в мире боевых искусств. Но только из-за одного самого незначительного проступка наш главный герой, Ян Кай, может быть исключен из Небесной Башни.</p>
5	Нуб максимального уровня	i-am-a-fulltime-newbie-exclusive	i-am-a-fulltime-newbie-exclusive/d9cf8ea470bdd2f51efdc6b127747538.jpg	Манхва	0	0	2021	1	130	<p>Главный герой Джин Хек &ndash; игрок и стример, единственный, кто прошёл до конца&nbsp;&laquo;Башню испытаний&raquo;.<br />\r\nКогда он увидел концовку игры, захотел бросить её. Но в тот же день &laquo;Башня испытания&raquo; стала реальностью. И главному герою не осталось ничего, кроме как показать, на что способен тот, кто знает все нюансы игры.<br />\r\n<br />\r\n&laquo;Я покажу вам, что такое настоящий задрот!&raquo;</p>
4	Милый дом	sweet_home_hwang_youngchan	sweet_home_hwang_youngchan/8526d40b663441e5189f6263cefca146.jpg	Манхва	0	0	2017	0	141	<p>Много ли для счастья надо хикикомори? Знай себе в четырех стенах сиди, остальных нахрен посылай и в один комп вникай. А что родители с сестренкой внезапно померли? Так и чёрт с ними, оставили после себя &laquo;копейки&raquo;: пришлось в дешевую общагу переехать, жить на фастфуде и даже день Х назначить, чтоб delete-нуться из этого мира. Только не знал наш герой, что не суждено ему сдохнуть человеческими методами, ибо, как говорится, &laquo;ночь темна и полна ужасов&raquo;, а днем и тем паче &mdash; не забалуешь.</p>
11	Пламя бесчисленных невзгод	flame-of-countless-adversity	flame-of-countless-adversity/14a2dd21bfed08f6ba5a99f5849debab.jpg	Маньхуа	7	1	2021	1	112	<p>Линь Цзе, добрый и отзывчивый владелец книжного магазинчика в другом мире. Он всегда рекомендует посетителям книги, помогающие им в трудной ситуации, и иногда предлагает свои собственные труды. Со временем они начинают относиться к нему с искренним уважением и в благодарность время от времени приносят, по мнению Линь Цзе, простые сувениры, а так же рассазывают окружающим о не совсем обычном владельце книжного. </p><p> </p>
7	Регрессия мага 8-го класса	regression-of-class-8-wizard	regression-of-class-8-wizard/82ab9edb86767eb3786f1da8f2afead7.jpg	Манхва	6	1	2021	0	81	<p>История рассказывает об Иане Пэйдже, архимаге и первом человеке, который прорвался через уровень шестого класса, а затем и седьмого, став самым могущественным магом восьмого класса.<br />\r\n<br />\r\nПосле целой жизни, состоящей из войн и убийств, он сумел окончательно объединить континент. Состарившись, единственными его желаниями стали стремление прожить остаток жизни в мире и попытки найти спасение от горестей, привнесённых пролитой им кровью. Тем не менее его старый друг, обезумев от паранойи, не мог спокойно сосуществовать рядом с кем-то настолько сильным и предал Иана, убив его.<br />\r\n<br />\r\nНа последнем издыхании Иан использовал магию времени, которая переместила его в прошлое, в то время, когда он был маленьким мальчиком. Имея при себе все свои знания из прошлого, Иан решил сделать нечто большее, чтобы просто прожить жизнь с меньшим количеством сожалений.</p>
8	Наномашины	machines	machines/4440e5f7f133e292d5b4ef42161b4134.jpg	Манхва	7	1	2020	4	181	<p>Чен Ёун — незаконнорожденный принц, появившийся на свет без единой частички Нейгуна. С самого раннего детства он находился под гнетом всеобщего отвращения. Всеми забытый, с отсутствием какой-либо мотивации, год за годом Ёун влачил свое жалкое существование. Ни на что не рассчитывая... и не претендуя. Будучи изгоем, исконно презираемым шестью великими кланами, в один прекрасный день он оказался в окружении десятка подосланных убийц. Когда глаза практически застлала пелена белого света... и казалось, он уже начал теряться, проваливаясь в пучину безграничного отчаяния, на горизонте возникла еле заметная фигура. Неизвестный &quot;потомок&quot;, снизошедший из будущего, в мгновение ока уничтожил всех врагов. Прошептав нечто непонятное, он подсадил в тело нашего героя какой-то странный предмет... наномашину. С этого момента его судьба кардинально переменилась. Поселившийся где-то внутри искусственный интеллект дал его жизни невероятный импульс. Больше не будет как прежде. Это... новая ветвь истории. Истории о парне, который бросил вызов небесам.</p>
9	Система всемогущего дизайнера	the-greatest-estate-designer	the-greatest-estate-designer/410eea7b75616a31ba7029f3beabf62b.jpg	Манхва	10	1	2021	0	120	<p>Инженер-строитель Ким Су Хо стал аристократом на страницах романа. Но вот незадача! Поместье на грани банкротства? Тогда нужно спасать землю. Проектировать, строить и продавать. [Уникальная возможность, которую так ждал весь континент! Вас ждут идеальная транспортная развязка, лучший школьный район, приятный лесной массив и барон Фронтера, владелец уникальной недвижимости премиум-класса. Договор купли-продажи заключается в порядке очереди!]</p>
3	Охотник SSS-уровня	sss-level-hunter	sss-level-hunter/10c4175d9c7f128e1d8b1eeb682eabeb.jpg	Манхва	4.5	2	2019	1	104	<p>Ким Кон Чжа спокойно живет в своей халупе, завидуя всем популярным охотникам. Однажды его желание быть лучше всех сбывается и он получает легендарный навык &ldquo;Копирование способностей&rdquo;... ценой своей жизни.</p>\r\n\r\n<p>Прежде чем он успевает понять это, его убивает охотник №1, Летний дух! Но это активирует его навык, и теперь он скопировал новый, &ldquo;Путешествие во времени после смерти&rdquo;.</p>\r\n\r\n<p>Как Ким Кон Чжа же будет использовать эти навыки, чтобы победить конкурентов и подняться на вершину?</p>
\.


--
-- TOC entry 3430 (class 0 OID 121882)
-- Dependencies: 226
-- Data for Name: remanga_title_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remanga_title_categories (id, title_id, categories_id) FROM stdin;
1	1	1
2	1	4
3	1	19
4	1	23
5	1	25
6	1	28
7	1	5
8	1	39
9	1	6
10	1	44
11	1	46
12	1	8
13	1	9
14	1	57
15	1	60
16	2	4
17	2	19
18	2	21
19	2	22
20	2	6
21	2	41
22	2	46
23	2	47
24	2	51
25	2	8
26	2	56
27	3	1
28	3	4
29	3	17
30	3	40
31	3	53
32	3	8
33	3	56
34	3	13
35	3	73
36	3	78
37	4	1
38	4	4
39	4	24
40	4	36
41	4	5
42	4	39
43	4	44
44	4	8
45	4	60
46	5	1
47	5	4
48	5	25
49	5	5
50	5	51
51	5	53
52	5	8
53	5	57
54	5	13
55	5	63
56	5	68
57	5	77
58	5	78
59	6	1
60	6	4
61	6	36
62	6	45
63	6	8
64	6	55
65	6	12
66	6	13
67	6	59
68	6	60
69	6	64
70	6	70
71	6	77
72	7	1
73	7	4
74	7	17
75	7	19
76	7	25
77	7	27
78	7	51
79	7	8
80	7	12
81	7	67
82	8	1
83	8	4
84	8	21
85	8	22
86	8	27
87	8	39
88	8	55
89	8	13
90	8	59
91	8	68
92	8	73
93	8	77
94	8	83
95	9	1
96	9	4
97	9	25
98	9	27
99	9	5
100	9	40
101	9	47
102	9	7
103	9	8
104	9	55
105	9	56
106	9	13
107	9	64
108	9	67
109	9	68
110	9	78
111	9	80
112	9	81
113	9	83
114	10	1
115	10	4
116	10	27
117	10	51
118	10	7
119	10	8
120	10	10
121	10	13
122	10	77
123	10	78
124	10	80
125	10	81
126	11	1
127	11	4
128	11	19
129	11	25
130	11	5
131	11	6
132	11	46
133	11	51
134	11	7
135	11	8
136	11	56
137	11	9
138	11	78
139	11	80
140	12	17
141	12	28
142	12	39
143	12	46
144	12	47
145	12	8
146	12	56
147	12	9
148	12	13
149	12	77
150	12	78
151	12	83
152	13	46
153	13	47
154	13	51
155	13	8
156	13	56
157	13	9
158	13	12
159	13	13
160	13	59
161	13	60
162	13	65
163	13	70
164	13	77
165	14	1
166	14	4
167	14	19
168	14	25
169	14	27
170	14	28
171	14	5
172	14	6
173	14	50
174	14	51
175	14	8
176	14	57
177	14	12
178	14	13
179	14	65
180	15	1
181	15	4
182	15	17
183	15	19
184	15	25
185	15	28
186	15	5
187	15	39
188	15	40
189	15	6
190	15	41
191	15	42
192	15	44
193	15	51
194	15	8
195	15	63
196	15	77
197	15	83
198	16	1
199	16	4
200	16	17
201	16	19
202	16	26
203	16	27
204	16	36
205	17	1
206	17	4
207	17	22
208	17	27
209	17	33
210	17	5
211	17	39
212	17	8
213	17	55
214	17	9
215	17	12
216	17	70
217	17	77
218	17	78
219	17	83
220	18	1
221	18	4
222	18	17
223	18	23
224	18	25
225	18	27
226	18	5
227	18	50
228	18	8
229	18	9
230	18	57
231	18	13
232	18	84
233	19	1
234	19	4
235	19	39
236	19	46
237	19	51
238	19	53
239	19	8
240	19	55
241	19	56
242	19	9
243	19	10
244	19	57
245	19	11
246	20	1
247	20	4
248	20	25
249	20	5
250	20	39
251	20	46
252	20	51
253	20	8
254	20	13
255	20	60
256	20	63
257	20	68
258	20	77
259	20	78
260	20	83
261	21	1
262	21	23
263	21	25
264	21	26
265	21	28
266	21	39
267	21	8
268	21	56
269	21	9
270	21	75
271	21	77
272	22	4
273	22	36
274	22	8
275	22	55
276	22	60
277	22	77
278	22	78
279	23	4
280	23	17
281	23	22
282	23	40
283	23	41
284	23	8
285	23	55
286	23	56
287	23	13
288	23	71
289	23	77
290	23	78
291	24	1
292	24	4
293	24	28
294	24	60
295	25	1
296	25	4
297	25	25
298	25	36
299	25	53
300	25	8
301	25	55
302	25	9
303	25	10
304	25	11
305	25	13
306	25	60
307	25	70
308	25	73
309	25	77
310	26	1
311	26	4
312	26	43
313	26	47
314	26	8
315	26	55
316	26	9
317	26	60
318	26	73
319	26	74
320	26	77
321	26	78
322	27	1
323	27	4
324	27	17
325	27	19
326	27	22
327	27	25
328	27	27
329	27	28
330	27	36
331	27	39
332	27	40
333	27	8
334	27	77
335	27	79
336	28	1
337	28	4
338	28	17
339	28	19
340	28	23
341	28	25
342	28	27
343	28	6
344	28	46
345	28	47
346	28	51
347	28	8
348	28	9
349	28	12
350	28	78
351	28	83
352	29	1
353	29	4
354	29	25
355	29	27
356	29	47
357	29	7
358	29	53
359	29	8
360	29	55
361	29	56
362	29	9
363	30	1
364	30	4
365	30	21
366	30	40
367	30	8
368	30	78
369	30	87
370	31	1
371	31	4
372	31	17
373	31	25
374	31	28
375	31	5
376	31	39
377	31	44
378	31	46
379	31	8
380	31	9
381	31	13
382	31	68
383	31	77
384	31	83
385	32	1
386	32	4
387	32	17
388	32	22
389	32	28
390	32	47
391	32	8
392	32	56
393	32	9
394	32	13
395	32	60
396	32	77
397	32	83
398	33	1
399	33	4
400	33	22
401	33	5
402	33	51
403	33	8
404	33	57
405	33	13
406	33	65
407	33	68
408	33	76
409	33	77
410	34	1
411	34	4
412	34	17
413	34	25
414	34	38
415	34	51
416	34	7
417	34	54
418	34	13
419	34	75
420	34	78
421	34	80
422	34	81
423	35	4
424	35	22
425	35	28
426	35	40
427	35	44
428	35	46
429	35	47
430	35	48
431	35	8
432	35	9
433	35	11
434	35	60
435	35	77
436	35	78
437	36	1
438	36	4
439	36	17
440	36	5
441	36	8
442	36	57
443	36	12
444	36	13
445	36	61
446	36	63
447	36	68
448	36	77
449	36	78
450	37	1
451	37	4
452	37	17
453	37	19
454	37	22
455	37	25
456	37	5
457	37	39
458	37	6
459	37	51
460	37	8
461	37	56
462	37	9
463	37	13
464	37	68
465	37	79
466	37	80
467	37	84
468	38	1
469	38	4
470	38	18
471	38	25
472	38	5
473	38	40
474	38	13
475	38	60
476	38	61
477	38	63
478	38	68
479	38	71
480	38	77
481	39	1
482	39	4
483	39	17
484	39	18
485	39	19
486	39	25
487	39	28
488	39	36
489	39	5
490	39	77
491	40	1
492	40	4
493	40	17
494	40	19
495	40	22
496	40	28
497	40	46
498	40	51
499	40	8
500	40	56
501	40	60
502	40	77
503	40	78
504	41	1
505	41	4
506	41	17
507	41	19
508	41	25
509	41	27
510	41	5
511	41	47
512	41	78
513	41	79
514	41	81
515	42	4
516	42	19
517	42	25
518	42	28
519	42	6
520	42	8
521	42	9
522	42	12
523	42	13
524	42	60
525	42	68
526	42	77
527	42	80
528	43	1
529	43	4
530	43	17
531	43	31
532	43	40
533	43	54
534	43	12
535	43	74
536	43	78
537	44	1
538	44	4
539	44	25
540	44	27
541	44	51
542	44	8
543	44	55
544	44	11
545	44	67
546	44	73
547	44	77
548	44	81
549	44	83
550	45	1
551	45	4
552	45	17
553	45	19
554	45	25
555	45	28
556	45	39
557	45	50
558	45	8
559	45	56
560	45	9
561	45	57
562	45	13
563	45	68
564	45	78
565	46	1
566	46	4
567	46	17
568	46	27
569	46	39
570	46	13
571	46	63
572	46	79
573	46	81
574	47	1
575	47	4
576	47	17
577	47	19
578	47	23
579	47	25
580	47	27
581	47	5
582	47	39
583	47	47
584	47	7
585	47	8
586	47	9
587	47	12
588	47	77
589	47	81
590	48	1
591	48	4
592	48	17
593	48	19
594	48	22
595	48	25
596	48	46
597	48	8
598	48	13
599	48	77
600	49	1
601	49	4
602	49	25
603	49	27
604	49	40
605	49	47
606	49	7
607	49	8
608	49	9
609	49	66
610	49	67
611	49	68
612	49	75
613	49	77
614	49	78
615	49	79
616	49	80
617	49	81
618	49	83
619	50	1
620	50	4
621	50	17
622	50	27
623	50	39
624	50	40
625	50	47
626	50	54
627	50	64
628	50	78
629	50	81
630	51	1
631	51	4
632	51	17
633	51	5
634	51	39
635	51	8
636	51	9
637	51	57
638	51	13
639	51	60
640	51	68
641	51	70
642	51	77
643	51	78
644	52	1
645	52	4
646	52	27
647	52	5
648	52	7
649	52	53
650	52	9
651	52	63
652	52	68
653	52	77
654	52	78
655	53	4
656	53	19
657	53	22
658	53	5
659	53	41
660	53	46
661	53	51
662	53	8
663	53	56
664	53	65
665	53	77
666	53	78
667	53	83
668	54	1
669	54	4
670	54	19
671	54	22
672	54	25
673	54	28
674	54	5
675	54	39
676	54	6
677	54	42
678	54	77
679	55	1
680	55	4
681	55	18
682	55	19
683	55	25
684	55	5
685	55	39
686	55	46
687	55	53
688	55	8
689	55	57
690	55	13
691	56	1
692	56	4
693	56	25
694	56	40
695	56	47
696	56	8
697	56	13
698	56	60
699	56	68
700	56	74
701	56	77
702	56	78
703	56	79
704	57	1
705	57	4
706	57	17
707	57	22
708	57	25
709	57	27
710	57	28
711	57	40
712	57	46
713	57	47
714	57	7
715	57	8
716	57	56
717	58	1
718	58	4
719	58	17
720	58	25
721	58	28
722	58	35
723	58	5
724	58	44
725	58	45
726	58	46
727	58	48
728	58	7
729	58	52
730	58	53
731	59	8
732	59	68
733	59	70
734	59	78
735	60	1
736	60	4
737	60	17
738	60	19
739	60	25
740	60	27
741	60	5
742	60	39
743	60	46
744	60	83
745	61	1
746	61	4
747	61	17
748	61	19
749	61	25
750	61	27
751	61	28
752	61	5
753	61	39
754	61	6
755	61	46
756	61	53
757	61	8
758	61	56
759	62	1
760	62	4
761	62	17
762	62	22
763	62	53
764	62	8
765	62	56
766	62	13
767	62	68
768	62	73
769	62	77
770	62	78
771	62	79
772	62	80
773	63	1
774	63	4
775	63	17
776	63	19
777	63	23
778	63	25
779	63	27
780	63	5
781	63	38
782	63	6
783	63	54
784	64	1
785	64	4
786	64	19
787	64	5
788	64	39
789	64	6
790	64	41
791	64	42
792	64	43
793	65	4
794	65	5
795	65	8
796	65	55
797	65	9
798	65	57
799	65	13
800	65	60
801	65	68
802	65	77
803	65	80
804	66	1
805	66	4
806	66	17
807	66	36
808	66	8
809	66	56
810	67	1
811	67	4
812	67	5
813	67	45
814	67	46
815	67	7
816	67	53
817	67	8
818	67	10
819	67	13
820	67	60
821	67	63
822	67	68
823	67	77
824	68	1
825	68	4
826	68	17
827	68	19
828	68	22
829	68	28
830	68	5
831	68	6
832	68	46
833	68	51
834	68	8
835	68	10
836	68	13
837	68	59
838	68	65
839	68	77
840	68	79
841	68	80
842	69	1
843	69	18
844	69	23
845	69	25
846	69	27
847	69	5
848	69	39
849	69	6
850	69	51
851	69	8
852	69	9
853	69	57
854	69	13
855	69	60
856	69	63
857	69	65
858	69	67
859	69	77
860	69	78
861	69	80
862	70	1
863	70	28
864	70	47
865	70	8
866	70	9
867	70	64
868	70	73
869	70	78
870	71	1
871	71	4
872	71	25
873	71	39
874	71	44
875	71	48
876	71	51
877	71	8
878	71	9
879	71	13
880	71	71
881	71	77
882	71	78
883	72	17
884	72	25
885	72	28
886	72	5
887	72	39
888	72	41
889	72	46
890	72	7
891	72	8
892	72	56
893	72	9
894	72	11
895	72	60
896	72	64
897	72	70
898	72	73
899	72	77
900	72	81
901	72	83
902	73	1
903	73	4
904	73	17
905	73	22
906	73	25
907	73	26
908	73	27
909	73	40
910	73	47
911	73	8
912	73	56
913	73	9
914	73	77
915	73	81
916	74	1
917	74	4
918	74	17
919	74	25
920	74	39
921	74	45
922	74	47
923	74	7
924	74	8
925	74	9
926	74	12
927	74	13
928	74	60
929	74	65
930	74	77
931	74	78
932	75	17
933	75	19
934	75	23
935	75	25
936	75	5
937	75	50
938	75	7
939	75	8
940	75	77
941	75	79
942	75	80
943	75	84
944	76	1
945	76	4
946	76	17
947	76	19
948	76	23
949	76	25
950	76	27
951	76	5
952	76	6
953	76	46
954	76	47
955	76	51
956	76	7
957	76	54
958	76	10
959	76	13
960	76	65
961	76	78
962	76	80
963	76	81
964	76	84
965	77	1
966	77	4
967	77	25
968	77	28
969	77	5
970	77	46
971	77	8
972	77	56
973	77	9
974	77	57
975	77	13
976	77	60
977	77	77
978	77	78
979	78	1
980	78	4
981	78	18
982	78	25
983	78	36
984	78	5
985	78	46
986	79	1
987	79	4
988	79	17
989	79	25
990	79	5
991	79	40
992	79	8
993	79	56
994	79	13
995	79	60
996	79	77
997	79	78
998	79	81
999	80	1
1000	80	4
1001	80	5
1002	80	39
1003	80	6
1004	80	46
1005	80	51
1006	80	7
1007	80	52
1008	80	53
1009	80	8
1010	80	68
1011	81	1
1012	81	4
1013	81	17
1014	81	28
1015	81	39
1016	81	40
1017	81	46
1018	81	54
1019	81	12
1020	81	13
1021	81	67
1022	81	78
1023	81	81
1024	82	1
1025	82	4
1026	82	17
1027	82	7
1028	82	54
1029	82	60
1030	82	78
1031	83	1
1032	83	17
1033	83	22
1034	83	5
1035	83	46
1036	83	51
1037	83	8
1038	83	56
1039	83	10
1040	83	57
1041	83	13
1042	83	63
1043	83	68
1044	83	78
1045	83	80
1046	84	1
1047	84	4
1048	84	8
1049	84	55
1050	84	62
1051	85	1
1052	85	4
1053	85	25
1054	85	35
1055	85	53
1056	85	8
1057	85	13
1058	85	80
1059	86	1
1060	86	4
1061	86	25
1062	86	28
1063	86	5
1064	86	39
1065	86	41
1066	86	46
1067	86	8
1068	86	57
1069	86	13
1070	86	60
1071	86	63
1072	86	68
1073	86	70
1074	86	78
1075	86	80
1076	86	83
1077	87	1
1078	87	4
1079	87	28
1080	87	51
1081	87	8
1082	87	55
1083	87	9
1084	87	12
1085	87	60
1086	87	70
1087	87	77
1088	87	82
1089	88	1
1090	88	4
1091	88	17
1092	88	25
1093	88	5
1094	88	39
1095	88	6
1096	88	46
1097	88	47
1098	88	8
1099	88	57
1100	88	77
1101	89	1
1102	89	4
1103	89	25
1104	89	35
1105	89	5
1106	89	39
1107	89	44
1108	89	46
1109	89	51
1110	89	8
1111	89	55
1112	89	56
1113	89	57
1114	89	13
1115	89	61
1116	89	63
1117	89	68
1118	89	77
1119	89	78
1120	90	1
1121	90	4
1122	90	40
1123	90	8
1124	90	55
1125	90	10
1126	90	57
1127	90	13
1128	90	63
1129	90	68
1130	90	73
1131	90	78
1132	91	1
1133	91	4
1134	91	46
1135	91	51
1136	91	8
1137	91	56
1138	91	9
1139	91	10
1140	91	57
1141	91	13
1142	91	68
1143	91	78
1144	91	80
1145	92	8
1146	92	56
1147	92	9
1148	92	60
1149	92	72
1150	92	73
1151	92	77
1152	93	1
1153	93	4
1154	93	19
1155	93	22
1156	93	5
1157	93	6
1158	93	46
1159	93	47
1160	93	56
1161	93	68
1162	93	77
1163	94	1
1164	94	4
1165	94	17
1166	94	22
1167	94	40
1168	94	8
1169	94	56
1170	94	9
1171	94	57
1172	94	13
1173	94	68
1174	94	70
1175	94	77
1176	94	78
1177	94	80
1178	94	86
1179	95	1
1180	95	4
1181	95	36
1182	95	47
1183	95	8
1184	95	55
1185	95	12
1186	95	13
1187	95	60
1188	95	70
1189	95	73
1190	96	17
1191	96	28
1192	96	7
1193	96	8
1194	96	9
1195	96	77
1196	96	78
1197	96	80
1198	96	81
1199	96	83
1200	96	86
1201	97	1
1202	97	4
1203	97	17
1204	97	22
1205	97	28
1206	97	47
1207	97	8
1208	97	56
1209	97	9
1210	97	12
1211	97	13
1212	97	60
1213	97	70
1214	97	77
1215	97	78
1216	98	1
1217	98	4
1218	98	17
1219	98	25
1220	98	26
1221	98	27
1222	98	6
1223	98	46
1224	98	51
1225	98	7
1226	98	54
1227	98	56
1228	98	9
1229	98	60
1230	98	78
1231	98	81
1232	99	1
1233	99	4
1234	99	17
1235	99	5
1236	99	39
1237	99	40
1238	99	6
1239	99	42
1240	100	19
1241	100	8
1242	100	83
1243	101	1
1244	101	4
1245	101	24
1246	101	28
1247	101	36
1248	101	39
1249	101	8
1250	101	9
1251	101	12
1252	101	60
1253	101	77
1254	102	1
1255	102	4
1256	102	17
1257	102	28
1258	102	44
1259	102	50
1260	102	8
1261	102	9
1262	102	13
1263	102	60
1264	102	68
1265	102	77
1266	103	1
1267	103	4
1268	103	17
1269	103	19
1270	103	21
1271	103	22
1272	103	25
1273	103	26
1274	103	27
1275	103	28
1276	103	54
1277	104	1
1278	104	4
1279	104	19
1280	104	28
1281	104	5
1282	104	39
1283	104	40
1284	104	6
1285	104	41
1286	104	42
1287	104	43
1288	105	1
1289	105	4
1290	105	17
1291	105	19
1292	105	22
1293	105	25
1294	105	27
1295	105	5
1296	105	39
1297	105	40
1298	105	6
1299	105	46
1300	105	7
1301	105	8
1302	105	55
1303	105	56
1304	105	9
1305	105	57
1306	105	13
1307	105	60
1308	105	63
1309	105	65
1310	105	71
1311	105	73
1312	105	80
1313	106	1
1314	106	4
1315	106	17
1316	106	8
1317	106	57
1318	106	13
1319	106	59
1320	106	60
1321	106	68
1322	106	71
1323	106	73
1324	106	77
1325	106	78
1326	106	83
1327	107	1
1328	107	4
1329	107	17
1330	107	21
1331	107	7
1332	107	54
1333	107	13
1334	107	78
1335	107	80
1336	107	81
1337	108	1
1338	108	4
1339	108	25
1340	108	27
1341	108	5
1342	108	39
1343	108	46
1344	108	8
1345	108	9
1346	108	57
1347	108	13
1348	108	63
1349	108	65
1350	108	68
1351	108	78
1352	108	83
1353	109	56
1354	109	9
1355	109	57
1356	109	12
1357	109	13
1358	109	59
1359	109	60
1360	109	65
1361	109	70
1362	109	77
1363	109	78
1364	109	83
1365	110	4
1366	110	20
1367	110	5
1368	110	53
1369	110	8
1370	110	55
1371	110	10
1372	110	57
1373	110	13
1374	110	63
1375	110	65
1376	110	68
1377	110	79
1378	111	25
1379	111	28
1380	111	6
1381	111	8
1382	111	60
1383	111	77
1384	111	78
1385	111	80
1386	111	83
1387	111	84
1388	112	1
1389	112	4
1390	112	19
1391	112	20
1392	112	25
1393	112	27
1394	113	1
1395	113	4
1396	113	17
1397	113	19
1398	113	5
1399	113	39
1400	113	40
1401	113	51
1402	113	8
1403	113	56
1404	113	9
1405	113	12
1406	113	13
1407	113	64
1408	113	70
1409	113	77
1410	113	78
1411	114	1
1412	114	4
1413	114	19
1414	114	21
1415	114	25
1416	114	5
1417	114	39
1418	114	6
1419	114	41
1420	114	42
1421	114	46
1422	114	47
1423	114	50
1424	114	51
1425	114	8
1426	114	55
1427	114	56
1428	114	9
1429	114	13
1430	114	60
1431	114	61
1432	114	63
1433	114	65
1434	114	77
1435	114	78
1436	114	83
1437	115	1
1438	115	4
1439	115	17
1440	115	19
1441	115	25
1442	115	5
1443	115	6
1444	115	51
1445	115	7
1446	115	8
1447	115	13
1448	115	61
1449	115	63
1450	115	68
1451	115	77
1452	115	78
1453	115	80
1454	116	1
1455	116	4
1456	116	17
1457	116	22
1458	116	46
1459	116	47
1460	116	8
1461	116	58
1462	116	12
1463	116	70
1464	116	77
1465	117	17
1466	117	23
1467	117	25
1468	117	5
1469	117	39
1470	117	6
1471	117	46
1472	117	51
1473	117	8
1474	118	1
1475	118	4
1476	118	28
1477	118	36
1478	118	8
1479	118	60
1480	118	82
1481	119	1
1482	119	4
1483	119	24
1484	119	5
1485	119	39
1486	119	8
1487	119	55
1488	119	9
1489	119	12
1490	119	60
1491	120	22
1492	120	25
1493	120	5
1494	120	44
1495	120	45
1496	120	46
1497	120	8
1498	120	56
1499	120	9
1500	120	57
1501	120	13
1502	120	61
1503	120	68
1504	120	70
1505	120	77
1506	120	78
1507	120	83
1508	121	1
1509	121	4
1510	121	17
1511	121	25
1512	121	7
1513	121	54
1514	121	9
1515	121	67
1516	121	71
1517	121	81
1518	121	83
1519	122	1
1520	122	4
1521	122	27
1522	122	39
1523	122	47
1524	122	8
1525	122	55
1526	122	9
1527	122	59
1528	122	60
1529	122	73
1530	122	77
1531	122	78
1532	122	81
1533	122	83
1534	123	1
1535	123	4
1536	123	17
1537	123	36
1538	123	8
1539	123	9
1540	123	12
1541	123	59
1542	123	60
1543	123	77
1544	123	78
1545	124	1
1546	124	4
1547	124	19
1548	124	28
1549	124	5
1550	124	39
1551	124	44
1552	124	46
1553	124	50
1554	124	51
1555	124	8
1556	124	56
1557	124	9
1558	124	13
1559	124	60
1560	124	65
1561	124	68
1562	124	71
1563	124	77
1564	124	83
1565	125	1
1566	125	4
1567	125	19
1568	125	5
1569	125	46
1570	125	8
1571	125	56
1572	125	9
1573	125	57
1574	125	13
1575	125	63
1576	125	65
1577	125	68
1578	125	77
1579	125	83
1580	126	1
1581	126	4
1582	126	17
1583	126	27
1584	126	40
1585	126	54
1586	126	55
1587	126	12
1588	126	67
1589	126	70
1590	126	75
1591	126	78
1592	126	81
1593	126	83
1594	127	1
1595	127	4
1596	127	35
1597	127	12
1598	128	1
1599	128	4
1600	128	54
1601	128	12
1602	129	1
1603	129	4
1604	129	24
1605	129	36
1606	129	8
1607	129	55
1608	129	9
1609	129	12
1610	129	60
1611	129	74
1612	129	78
1613	130	1
1614	130	4
1615	130	17
1616	130	19
1617	130	25
1618	130	28
1619	130	35
1620	130	52
1621	130	8
1622	130	57
1623	130	78
1624	130	83
1625	131	1
1626	131	4
1627	131	17
1628	131	22
1629	131	46
1630	131	7
1631	131	8
1632	131	75
1633	131	77
1634	132	4
1635	132	17
1636	132	27
1637	132	40
1638	132	7
1639	132	54
1640	132	64
1641	132	67
1642	132	70
1643	132	74
1644	132	78
1645	132	80
1646	132	81
1647	132	83
1648	133	4
1649	133	25
1650	133	5
1651	133	39
1652	133	40
1653	133	45
1654	133	46
1655	133	51
1656	133	8
1657	133	56
1658	133	13
1659	133	63
1660	133	70
1661	133	71
1662	133	77
1663	134	1
1664	134	4
1665	134	22
1666	134	6
1667	134	8
1668	134	73
1669	134	77
1670	134	78
1671	134	83
1672	135	1
1673	135	4
1674	135	17
1675	135	19
1676	135	25
1677	135	27
1678	135	46
1679	135	47
1680	135	51
1681	135	7
1682	135	52
1683	135	8
1684	135	56
1685	135	57
1686	135	13
1687	135	63
1688	135	64
1689	135	65
1690	135	67
1691	135	68
1692	135	71
1693	135	73
1694	135	77
1695	135	78
1696	135	79
1697	135	80
1698	135	81
1699	136	1
1700	136	4
1701	136	51
1702	136	53
1703	136	8
1704	136	9
1705	136	57
1706	136	60
1707	136	63
1708	136	67
1709	136	68
1710	136	77
1711	136	78
1712	136	83
1713	137	1
1714	137	4
1715	137	31
1716	137	34
1717	137	35
1718	137	36
1719	137	5
1720	137	39
1721	137	52
1722	137	57
1723	137	13
1724	137	77
1725	138	1
1726	138	4
1727	138	17
1728	138	18
1729	138	19
1730	138	21
1731	138	22
1732	138	25
1733	138	28
1734	138	39
1735	138	56
1736	138	65
1737	138	70
1738	138	77
1739	138	78
1740	138	79
1741	138	81
1742	138	83
1743	138	84
1744	139	1
1745	139	4
1746	139	15
1747	139	17
1748	139	39
1749	139	8
1750	139	9
1751	139	12
1752	139	60
1753	139	70
1754	139	74
1755	140	1
1756	140	4
1757	140	19
1758	140	25
1759	140	5
1760	140	50
1761	140	8
1762	140	56
1763	140	9
1764	140	13
1765	140	70
1766	140	77
1767	140	78
1768	141	4
1769	141	25
1770	141	5
1771	141	46
1772	141	51
1773	141	53
1774	141	8
1775	141	56
1776	141	10
1777	141	13
1778	141	68
1779	141	78
1780	142	1
1781	142	4
1782	142	17
1783	142	25
1784	142	27
1785	142	28
1786	142	35
1787	142	5
1788	142	39
1789	142	46
1790	142	7
1791	142	52
1792	142	8
1793	142	56
1794	142	57
1795	142	13
1796	142	61
1797	142	67
1798	142	70
1799	142	79
1800	142	81
1801	143	4
1802	143	25
1803	143	27
1804	143	51
1805	143	8
1806	143	9
1807	143	11
1808	143	60
1809	143	65
1810	143	70
1811	143	73
1812	143	76
1813	143	81
1814	143	83
1815	144	17
1816	144	19
1817	144	25
1818	144	28
1819	144	51
1820	144	7
1821	144	8
1822	144	55
1823	144	9
1824	144	57
1825	144	11
1826	144	68
1827	144	81
1828	144	83
1829	144	84
1830	145	1
1831	145	4
1832	145	17
1833	145	25
1834	145	26
1835	145	27
1836	145	6
1837	145	45
1838	145	46
1839	145	7
1840	145	53
1841	145	54
1842	145	55
1843	145	13
1844	145	59
1845	145	64
1846	145	67
1847	145	73
1848	145	80
1849	145	81
1850	145	83
1851	146	4
1852	146	28
1853	146	8
1854	146	12
1855	146	60
1856	146	77
1857	147	1
1858	147	4
1859	147	30
1860	147	33
1861	147	47
1862	147	8
1863	147	56
1864	147	13
1865	147	64
1866	147	78
1867	148	1
1868	148	4
1869	148	25
1870	148	27
1871	148	5
1872	148	40
1873	148	7
1874	148	8
1875	148	56
1876	148	9
1877	148	57
1878	148	60
1879	148	68
1880	148	77
1881	148	78
1882	149	1
1883	149	4
1884	149	35
1885	149	36
1886	149	39
1887	149	46
1888	149	47
1889	149	8
1890	149	68
1891	149	77
1892	150	1
1893	150	4
1894	150	17
1895	150	6
1896	150	41
1897	150	45
1898	150	53
1899	150	8
1900	150	55
1901	150	56
1902	151	19
1903	151	25
1904	151	26
1905	151	27
1906	151	30
1907	151	33
1908	151	5
1909	151	39
1910	151	50
1911	151	51
1912	151	53
1913	151	8
1914	151	55
1915	151	9
1916	151	11
1917	151	13
1918	151	67
1919	151	70
1920	151	73
1921	151	83
1922	152	1
1923	152	4
1924	152	19
1925	152	25
1926	152	5
1927	152	46
1928	152	53
1929	152	56
1930	152	11
1931	152	13
1932	152	68
1933	152	77
1934	153	1
1935	153	4
1936	153	19
1937	153	21
1938	153	22
1939	153	25
1940	153	5
1941	153	41
1942	153	46
1943	153	47
1944	153	51
1945	153	53
1946	153	8
1947	153	56
1948	153	11
1949	153	12
1950	153	13
1951	153	59
1952	153	65
1953	153	73
1954	153	77
1955	153	78
1956	153	83
1957	154	4
1958	154	17
1959	154	18
1960	154	22
1961	154	36
1962	154	39
1963	154	40
1964	154	43
1965	154	44
1966	154	46
1967	154	8
1968	154	55
1969	154	9
1970	154	13
1971	154	60
1972	154	61
1973	154	71
1974	154	73
1975	154	77
1976	154	78
1977	154	79
1978	155	1
1979	155	4
1980	155	17
1981	155	47
1982	155	8
1983	155	9
1984	155	12
1985	155	13
1986	155	64
1987	155	70
1988	155	78
1989	156	1
1990	156	4
1991	156	17
1992	156	26
1993	156	27
1994	156	40
1995	156	47
1996	156	7
1997	156	54
1998	156	13
1999	156	64
2000	156	67
2001	156	78
2002	156	81
2003	157	1
2004	157	4
2005	157	17
2006	157	19
2007	157	21
2008	157	25
2009	157	5
2010	157	6
2011	157	41
2012	157	45
2013	157	46
2014	157	11
2015	157	68
2016	158	1
2017	158	4
2018	158	17
2019	158	18
2020	158	5
2021	158	7
2022	158	8
2023	158	56
2024	158	57
2025	158	13
2026	158	63
2027	158	68
2028	158	77
2029	158	80
2030	159	17
2031	159	22
2032	159	5
2033	159	39
2034	159	40
2035	159	51
2036	159	8
2037	159	12
2038	159	60
2039	159	75
2040	159	77
2041	159	80
2042	159	84
2043	160	1
2044	160	4
2045	160	18
2046	160	27
2047	160	5
2048	160	47
2049	160	7
2050	160	8
2051	160	56
2052	160	9
2053	160	12
2054	160	60
2055	160	61
2056	160	68
2057	160	77
2058	161	1
2059	161	4
2060	161	17
2061	161	31
2062	161	8
2063	161	55
2064	161	9
2065	161	78
2066	162	1
2067	162	4
2068	162	36
2069	162	8
2070	162	12
2071	162	60
2072	162	77
2073	163	1
2074	163	4
2075	163	17
2076	163	25
2077	163	26
2078	163	27
2079	163	39
2080	163	40
2081	163	47
2082	163	7
2083	163	54
2084	163	9
2085	163	64
2086	163	67
2087	163	78
2088	163	79
2089	163	80
2090	164	1
2091	164	4
2092	164	17
2093	164	25
2094	164	28
2095	164	5
2096	164	6
2097	164	7
2098	164	8
2099	164	56
2100	164	57
2101	164	13
2102	164	63
2103	164	65
2104	164	68
2105	164	77
2106	164	78
2107	164	79
2108	164	80
2109	165	1
2110	165	4
2111	165	19
2112	165	25
2113	165	50
2114	165	51
2115	165	8
2116	165	55
2117	165	65
2118	165	70
2119	165	77
2120	165	84
2121	166	1
2122	166	4
2123	166	17
2124	166	22
2125	166	25
2126	166	5
2127	166	40
2128	166	43
2129	166	45
2130	166	46
2131	166	48
2132	166	7
2133	166	8
2134	166	56
2135	166	9
2136	166	57
2137	166	13
2138	166	60
2139	166	63
2140	166	68
2141	166	70
2142	166	73
2143	166	77
2144	166	80
2145	167	4
2146	167	25
2147	167	39
2148	167	40
2149	167	8
2150	167	57
2151	167	13
2152	167	68
2153	167	77
2154	167	78
2155	168	1
2156	168	4
2157	168	15
2158	168	17
2159	168	22
2160	168	31
2161	168	32
2162	168	36
2163	168	40
2164	168	6
2165	168	8
2166	168	13
2167	168	60
2168	168	64
2169	168	74
2170	168	77
2171	168	78
2172	169	1
2173	169	4
2174	169	5
2175	169	39
2176	169	58
2177	169	13
2178	169	68
2179	169	77
2180	169	78
2181	169	84
2182	170	1
2183	170	4
2184	170	17
2185	170	19
2186	170	23
2187	170	25
2188	170	5
2189	170	45
2190	170	47
2191	170	51
2192	170	8
2193	170	55
2194	170	9
2195	170	12
2196	170	13
2197	170	59
2198	170	60
2199	170	64
2200	170	65
2201	170	68
2202	170	70
2203	170	72
2204	170	77
2205	170	78
2206	170	79
2207	170	80
2208	170	81
2209	170	82
2210	170	83
2211	170	84
2212	171	1
2213	171	4
2214	171	17
2215	171	36
2216	171	40
2217	171	6
2218	171	42
2219	171	7
2220	171	8
2221	171	55
2222	171	60
2223	172	1
2224	172	4
2225	172	19
2226	172	25
2227	172	27
2228	172	39
2229	172	6
2230	172	46
2231	172	53
2232	172	8
2233	172	55
2234	172	56
2235	172	9
2236	172	57
2237	172	12
2238	172	13
2239	172	59
2240	172	63
2241	172	68
2242	172	70
2243	172	77
2244	172	78
2245	172	83
2246	173	4
2247	173	25
2248	173	27
2249	173	5
2250	173	46
2251	173	52
2252	173	8
2253	173	55
2254	173	57
2255	173	13
2256	173	68
2257	173	78
2258	174	1
2259	174	4
2260	174	17
2261	174	19
2262	174	25
2263	174	28
2264	174	44
2265	174	46
2266	174	51
2267	174	8
2268	174	12
2269	174	63
2270	174	65
2271	175	1
2272	175	4
2273	175	19
2274	175	6
2275	175	46
2276	175	51
2277	175	8
2278	175	9
2279	175	13
2280	175	73
2281	175	77
2282	175	83
2283	176	18
2284	176	19
2285	176	25
2286	176	27
2287	176	28
2288	176	5
2289	176	39
2290	176	6
2291	176	50
2292	176	51
2293	176	8
2294	176	9
2295	176	12
2296	176	60
2297	176	77
2298	176	78
2299	176	81
2300	177	1
2301	177	4
2302	177	17
2303	177	22
2304	177	28
2305	177	8
2306	177	9
2307	177	78
2308	178	4
2309	178	19
2310	178	25
2311	178	5
2312	178	6
2313	178	46
2314	178	7
2315	178	8
2316	178	57
2317	178	13
2318	178	59
2319	178	60
2320	178	68
2321	178	77
2322	178	78
2323	178	83
2324	179	1
2325	179	4
2326	179	25
2327	179	27
2328	179	28
2329	179	39
2330	179	7
2331	179	54
2332	179	12
2333	179	81
2334	180	1
2335	180	4
2336	180	21
2337	180	31
2338	180	36
2339	180	6
2340	180	8
2341	180	57
2342	180	13
2343	180	59
2344	180	68
2345	180	70
2346	180	73
2347	180	77
2348	180	78
2349	181	1
2350	181	4
2351	181	17
2352	181	20
2353	181	31
2354	181	36
2355	181	7
2356	181	56
2357	181	57
2358	181	68
2359	181	70
2360	181	77
2361	182	1
2362	182	4
2363	182	8
2364	182	55
2365	182	60
2366	182	70
2367	182	77
2368	182	78
2369	183	1
2370	183	19
2371	183	25
2372	183	28
2373	183	35
2374	183	5
2375	183	39
2376	183	41
2377	183	45
2378	183	46
2379	183	50
2380	183	51
2381	183	53
2382	183	8
2383	183	57
2384	183	13
2385	183	77
2386	183	83
2387	184	1
2388	184	4
2389	184	17
2390	184	19
2391	184	25
2392	184	28
2393	184	50
2394	184	8
2395	184	56
2396	184	60
2397	184	63
2398	184	68
2399	184	77
2400	184	84
2401	185	1
2402	185	4
2403	185	20
2404	185	5
2405	185	39
2406	185	8
2407	185	10
2408	185	57
2409	185	13
2410	185	63
2411	185	68
2412	185	77
2413	185	78
2414	186	1
2415	186	4
2416	186	28
2417	186	36
2418	186	40
2419	186	8
2420	186	55
2421	186	9
2422	186	12
2423	187	17
2424	187	25
2425	187	28
2426	187	5
2427	187	39
2428	187	7
2429	187	54
2430	187	57
2431	187	13
2432	187	60
2433	187	63
2434	187	68
2435	187	78
2436	187	80
2437	187	84
2438	188	1
2439	188	4
2440	188	25
2441	188	28
2442	188	32
2443	188	36
2444	188	5
2445	188	54
2446	188	55
2447	188	13
2448	188	70
2449	188	71
2450	188	72
2451	188	77
2452	188	78
2453	189	1
2454	189	4
2455	189	17
2456	189	22
2457	189	27
2458	189	47
2459	189	8
2460	189	56
2461	189	9
2462	189	79
2463	189	81
2464	190	1
2465	190	4
2466	190	26
2467	190	27
2468	190	47
2469	190	54
2470	190	67
2471	190	70
2472	190	78
2473	190	81
2474	191	1
2475	191	4
2476	191	17
2477	191	21
2478	191	22
2479	191	27
2480	191	7
2481	191	8
2482	191	70
2483	191	73
2484	191	78
2485	191	80
2486	192	1
2487	192	4
2488	192	25
2489	192	5
2490	192	6
2491	192	46
2492	192	51
2493	192	53
2494	192	8
2495	192	56
2496	192	13
2497	192	63
2498	192	65
2499	192	68
2500	192	77
2501	193	1
2502	193	4
2503	193	25
2504	193	31
2505	193	5
2506	193	46
2507	193	51
2508	193	7
2509	193	53
2510	193	8
2511	193	9
2512	193	10
2513	193	57
2514	193	13
2515	193	59
2516	193	63
2517	193	65
2518	193	68
2519	193	77
2520	193	86
2521	194	4
2522	194	17
2523	194	19
2524	194	25
2525	194	5
2526	194	44
2527	194	46
2528	194	8
2529	194	56
2530	194	57
2531	194	13
2532	194	60
2533	194	63
2534	194	68
2535	194	77
2536	194	78
2537	195	1
2538	195	4
2539	195	22
2540	195	27
2541	195	8
2542	195	56
2543	195	9
2544	195	59
2545	196	1
2546	196	21
2547	196	25
2548	196	41
2549	196	51
2550	196	54
2551	196	9
2552	196	10
2553	196	11
2554	196	12
2555	196	13
2556	197	1
2557	197	4
2558	197	17
2559	197	25
2560	197	27
2561	197	39
2562	197	7
2563	197	54
2564	197	55
2565	197	12
2566	197	68
2567	197	80
2568	197	81
2569	197	86
2570	198	1
2571	198	4
2572	198	17
2573	198	19
2574	198	21
2575	198	25
2576	198	27
2577	198	6
2578	198	42
2579	198	46
2580	198	54
2581	199	25
2582	199	28
2583	199	5
2584	199	6
2585	199	46
2586	199	51
2587	199	8
2588	199	56
2589	199	9
2590	199	57
2591	199	13
2592	199	60
2593	199	68
2594	199	77
2595	199	83
2596	199	84
2597	200	1
2598	200	4
2599	200	19
2600	200	23
2601	200	24
2602	200	80
2603	200	81
2604	200	83
2605	201	4
2606	201	40
2607	201	8
2608	201	9
2609	201	12
2610	201	60
2611	201	77
2612	201	78
2613	201	87
2614	202	1
2615	202	4
2616	202	17
2617	202	25
2618	202	27
2619	202	39
2620	202	40
2621	202	51
2622	202	54
2623	202	9
2624	202	60
2625	202	81
2626	202	84
2627	203	1
2628	203	4
2629	203	23
2630	203	26
2631	203	27
2632	203	40
2633	203	47
2634	203	54
2635	203	55
2636	203	64
2637	203	67
2638	203	78
2639	203	79
2640	203	80
2641	203	81
2642	203	83
2643	204	1
2644	204	4
2645	204	17
2646	204	22
2647	204	25
2648	204	5
2649	204	8
2650	204	9
2651	204	68
2652	204	78
2653	205	1
2654	205	4
2655	205	22
2656	205	25
2657	205	28
2658	205	5
2659	205	6
2660	205	47
2661	205	53
2662	205	8
2663	205	9
2664	205	12
2665	205	13
2666	205	60
2667	205	63
2668	205	68
2669	205	77
2670	206	1
2671	206	4
2672	206	17
2673	206	25
2674	206	51
2675	206	7
2676	206	8
2677	206	56
2678	206	13
2679	206	68
2680	206	77
2681	206	78
2682	207	1
2683	207	4
2684	207	17
2685	207	22
2686	207	40
2687	207	41
2688	207	44
2689	207	45
2690	207	7
2691	207	56
2692	207	68
2693	207	70
2694	207	71
2695	207	77
2696	207	78
2697	207	81
2698	207	83
2699	208	1
2700	208	4
2701	208	19
2702	208	25
2703	208	26
2704	208	5
2705	208	40
2706	208	8
2707	208	56
2708	208	10
2709	208	68
2710	208	70
2711	208	77
2712	208	78
2713	208	83
2714	209	1
2715	209	4
2716	209	25
2717	209	5
2718	209	46
2719	209	51
2720	209	52
2721	209	53
2722	209	8
2723	209	57
2724	209	13
2725	209	77
2726	209	78
2727	210	1
2728	210	4
2729	210	17
2730	210	5
2731	210	39
2732	210	6
2733	210	7
2734	210	8
2735	210	13
2736	210	68
2737	210	77
2738	210	78
2739	210	80
2740	211	1
2741	211	4
2742	211	17
2743	211	22
2744	211	40
2745	211	47
2746	211	8
2747	211	77
2748	212	1
2749	212	4
2750	212	25
2751	212	46
2752	212	47
2753	212	8
2754	212	56
2755	212	57
2756	212	13
2757	212	60
2758	212	68
2759	212	77
2760	213	1
2761	213	19
2762	213	25
2763	213	35
2764	213	13
2765	213	63
2766	213	68
2767	213	77
2768	213	78
2769	213	81
2770	213	83
2771	214	1
2772	214	4
2773	214	17
2774	214	23
2775	214	25
2776	214	54
2777	214	65
2778	214	80
2779	214	81
2780	215	1
2781	215	4
2782	215	17
2783	215	19
2784	215	25
2785	215	12
2786	215	13
2787	215	63
2788	215	70
2789	215	71
2790	215	77
2791	215	78
2792	215	83
2793	216	1
2794	216	4
2795	216	19
2796	216	25
2797	216	27
2798	216	36
2799	216	5
2800	216	39
2801	216	51
2802	216	8
2803	216	9
2804	216	12
2805	216	60
2806	216	77
2807	216	83
2808	217	1
2809	217	4
2810	217	17
2811	217	22
2812	217	40
2813	217	41
2814	217	47
2815	217	8
2816	217	70
2817	217	77
2818	217	78
2819	218	4
2820	218	21
2821	218	25
2822	218	39
2823	218	51
2824	218	52
2825	218	53
2826	218	8
2827	218	56
2828	218	57
2829	218	13
2830	218	63
2831	218	68
2832	218	77
2833	219	1
2834	219	4
2835	219	17
2836	219	54
2837	220	1
2838	220	4
2839	220	17
2840	220	27
2841	220	39
2842	220	40
2843	220	54
2844	220	55
2845	220	12
2846	220	60
2847	220	78
2848	220	81
2849	221	1
2850	221	28
2851	221	36
2852	221	39
2853	221	8
2854	221	9
2855	221	12
2856	221	60
2857	221	70
2858	221	73
2859	221	79
2860	222	1
2861	222	4
2862	222	19
2863	222	5
2864	222	39
2865	222	45
2866	222	51
2867	222	53
2868	222	8
2869	222	56
2870	222	13
2871	222	63
2872	222	77
2873	223	1
2874	223	4
2875	223	8
2876	223	55
2877	223	9
2878	223	60
2879	224	1
2880	224	4
2881	224	17
2882	224	22
2883	224	30
2884	224	33
2885	224	46
2886	224	13
2887	224	59
2888	224	60
2889	224	68
2890	224	81
2891	224	83
2892	225	1
2893	225	4
2894	225	25
2895	225	5
2896	225	39
2897	225	46
2898	225	51
2899	225	8
2900	225	55
2901	225	56
2902	225	9
2903	225	57
2904	225	65
2905	225	68
2906	225	71
2907	225	77
2908	226	1
2909	226	4
2910	226	17
2911	226	25
2912	226	5
2913	226	8
2914	226	55
2915	226	57
2916	226	13
2917	226	63
2918	226	71
2919	226	78
2920	227	1
2921	227	4
2922	227	28
2923	227	40
2924	227	47
2925	227	8
2926	227	13
2927	227	68
2928	227	70
2929	227	77
2930	227	78
2931	228	1
2932	228	4
2933	228	27
2934	228	40
2935	228	47
2936	228	54
2937	228	9
2938	228	78
2939	228	81
2940	228	83
2941	229	1
2942	229	4
2943	229	22
2944	229	25
2945	229	5
2946	229	7
2947	229	8
2948	229	13
2949	229	72
2950	229	77
2951	229	80
2952	230	4
2953	230	17
2954	230	28
2955	230	32
2956	230	36
2957	230	8
2958	230	9
2959	230	12
2960	230	59
2961	230	60
2962	230	70
2963	230	77
2964	230	78
2965	230	83
2966	231	1
2967	231	4
2968	231	19
2969	231	21
2970	231	23
2971	231	5
2972	231	8
2973	231	9
2974	231	60
2975	231	61
2976	231	65
2977	231	68
2978	231	78
2979	232	17
2980	232	23
2981	232	51
2982	232	7
2983	232	8
2984	232	57
2985	232	65
2986	232	68
2987	232	77
2988	232	80
2989	232	84
2990	233	1
2991	233	4
2992	233	28
2993	233	47
2994	233	8
2995	233	56
2996	233	9
2997	233	12
2998	233	13
2999	233	60
3000	233	77
3001	233	78
3002	234	1
3003	234	4
3004	234	17
3005	234	18
3006	234	44
3007	234	8
3008	234	9
3009	234	57
3010	234	60
3011	234	68
3012	234	77
3013	234	78
3014	234	79
3015	235	4
3016	235	17
3017	235	19
3018	235	22
3019	235	23
3020	235	5
3021	235	46
3022	235	51
3023	235	7
3024	235	8
3025	235	56
3026	235	58
3027	235	65
3028	235	66
3029	235	77
3030	235	78
3031	236	1
3032	236	4
3033	236	17
3034	236	19
3035	236	25
3036	236	5
3037	236	39
3038	236	45
3039	236	46
3040	236	8
3041	236	56
3042	236	9
3043	236	57
3044	236	13
3045	236	60
3046	236	61
3047	236	63
3048	236	67
3049	236	68
3050	236	78
3051	236	83
3052	236	84
3053	237	1
3054	237	4
3055	237	17
3056	237	19
3057	237	22
3058	237	5
3059	237	6
3060	237	41
3061	237	8
3062	237	13
3063	237	61
3064	237	77
3065	237	83
3066	238	1
3067	238	4
3068	238	27
3069	238	40
3070	238	47
3071	238	54
3072	238	9
3073	238	78
3074	238	81
3075	239	1
3076	239	4
3077	239	18
3078	239	5
3079	239	39
3080	239	40
3081	239	46
3082	239	8
3083	239	57
3084	239	60
3085	239	61
3086	239	68
3087	239	77
3088	239	78
3089	239	84
3090	240	1
3091	240	4
3092	240	40
3093	240	46
3094	240	53
3095	240	8
3096	240	56
3097	240	57
3098	240	13
3099	240	68
3100	240	73
3101	240	77
3102	241	4
3103	241	17
3104	241	25
3105	241	26
3106	241	27
3107	241	28
3108	241	41
3109	241	46
3110	241	51
3111	241	7
3112	241	8
3113	241	67
3114	241	77
3115	241	78
3116	241	80
3117	241	83
3118	242	17
3119	242	19
3120	242	25
3121	242	28
3122	242	5
3123	242	6
3124	242	46
3125	242	51
3126	242	8
3127	242	56
3128	242	9
3129	242	12
3130	242	13
3131	242	61
3132	242	63
3133	242	68
3134	242	77
3135	243	1
3136	243	4
3137	243	17
3138	243	25
3139	243	28
3140	243	39
3141	243	70
3142	243	71
3143	243	77
3144	243	78
3145	243	83
3146	244	4
3147	244	19
3148	244	25
3149	244	5
3150	244	46
3151	244	8
3152	244	56
3153	244	9
3154	244	57
3155	244	13
3156	244	60
3157	244	63
3158	244	68
3159	244	77
3160	244	78
3161	244	83
3162	245	4
3163	245	19
3164	245	22
3165	245	23
3166	245	28
3167	245	50
3168	245	51
3169	245	7
3170	245	8
3171	245	13
3172	245	61
3173	245	68
3174	245	77
3175	246	1
3176	246	4
3177	246	25
3178	246	26
3179	246	27
3180	246	45
3181	246	51
3182	246	54
3183	246	55
3184	246	56
3185	246	65
3186	246	67
3187	246	70
3188	246	71
3189	246	73
3190	246	77
3191	246	78
3192	246	81
3193	246	83
3194	247	1
3195	247	4
3196	247	17
3197	247	54
3198	247	55
3199	247	9
3200	247	60
3201	247	64
3202	247	67
3203	247	70
3204	247	78
3205	247	80
3206	247	81
3207	248	1
3208	248	4
3209	248	22
3210	248	25
3211	248	27
3212	248	5
3213	248	54
3214	248	8
3215	248	56
3216	248	9
3217	248	59
3218	248	77
3219	248	80
3220	248	83
3221	249	36
3222	249	40
3223	249	47
3224	249	8
3225	250	1
3226	250	4
3227	250	17
3228	250	19
3229	250	22
3230	250	27
3231	250	39
3232	250	40
3233	250	46
3234	250	51
3235	250	8
3236	250	9
3237	250	10
3238	250	13
3239	250	70
3240	250	71
3241	250	73
3242	250	77
3243	250	78
3244	250	83
3245	251	1
3246	251	4
3247	251	17
3248	251	22
3249	251	25
3250	251	51
3251	251	7
3252	251	8
3253	251	55
3254	251	9
3255	251	11
3256	251	12
3257	251	64
3258	251	67
3259	251	78
3260	251	83
3261	252	1
3262	252	4
3263	252	17
3264	252	19
3265	252	22
3266	252	25
3267	252	27
3268	252	6
3269	252	41
3270	252	46
3271	252	47
3272	252	51
3273	252	7
3274	252	8
3275	252	56
3276	252	9
3277	252	12
3278	252	13
3279	252	60
3280	252	77
3281	252	78
3282	252	79
3283	252	80
3284	252	81
3285	252	83
3286	253	1
3287	253	4
3288	253	17
3289	253	19
3290	253	25
3291	253	5
3292	253	39
3293	253	40
3294	253	8
3295	253	56
3296	253	9
3297	253	13
3298	253	65
3299	253	71
3300	253	76
3301	253	77
3302	253	84
3303	254	4
3304	254	23
3305	254	5
3306	254	6
3307	254	46
3308	254	7
3309	254	8
3310	254	56
3311	254	13
3312	254	65
3313	254	68
3314	254	77
3315	254	80
3316	255	1
3317	255	4
3318	255	17
3319	255	18
3320	255	25
3321	255	5
3322	255	68
3323	255	71
3324	255	77
3325	255	83
3326	256	1
3327	256	4
3328	256	17
3329	256	25
3330	256	27
3331	256	5
3332	256	38
3333	256	6
3334	256	7
3335	256	54
3336	256	67
3337	256	70
3338	256	78
3339	256	80
3340	256	81
3341	256	83
3342	257	1
3343	257	4
3344	257	19
3345	257	23
3346	257	25
3347	257	27
3348	257	5
3349	257	40
3350	257	6
3351	257	45
3352	257	47
3353	257	50
3354	257	51
3355	257	53
3356	257	8
3357	257	56
3358	257	13
3359	257	60
3360	257	65
3361	257	71
3362	257	77
3363	257	78
3364	257	81
3365	258	1
3366	258	4
3367	258	17
3368	258	18
3369	258	5
3370	258	39
3371	258	40
3372	258	7
3373	258	54
3374	258	55
3375	258	9
3376	258	60
3377	258	61
3378	259	4
3379	259	25
3380	259	5
3381	259	6
3382	259	46
3383	259	51
3384	259	7
3385	259	52
3386	259	54
3387	259	8
3388	259	55
3389	259	57
3390	259	13
3391	259	65
3392	259	71
3393	260	4
3394	260	17
3395	260	19
3396	260	25
3397	260	28
3398	260	39
3399	260	41
3400	260	42
3401	260	8
3402	260	55
3403	260	9
3404	260	11
3405	260	68
3406	260	78
3407	261	1
3408	261	4
3409	261	19
3410	261	25
3411	261	6
3412	261	41
3413	261	45
3414	261	46
3415	261	47
3416	261	7
3417	261	8
3418	261	55
3419	261	56
3420	261	9
3421	261	10
3422	261	57
3423	261	12
3424	261	13
3425	261	59
3426	261	60
3427	261	64
3428	261	65
3429	261	70
3430	261	73
3431	261	77
3432	261	78
3433	261	79
3434	261	82
3435	261	83
3436	262	28
3437	262	32
3438	262	36
3439	262	8
3440	262	9
3441	262	12
3442	262	60
3443	262	73
3444	262	74
3445	262	77
3446	262	78
3447	263	1
3448	263	4
3449	263	18
3450	263	22
3451	263	36
3452	263	5
3453	263	39
3454	263	51
3455	263	53
3456	263	8
3457	263	56
3458	263	9
3459	263	59
3460	263	60
3461	263	61
3462	263	77
3463	263	78
3464	263	83
3465	264	1
3466	264	4
3467	264	21
3468	264	25
3469	264	28
3470	264	5
3471	264	41
3472	264	46
3473	264	53
3474	264	8
3475	264	56
3476	264	9
3477	264	57
3478	264	13
3479	264	60
3480	264	63
3481	264	83
3482	265	1
3483	265	4
3484	265	24
3485	265	25
3486	265	27
3487	265	36
3488	265	5
3489	265	39
3490	265	47
3491	265	51
3492	265	8
3493	265	55
3494	265	67
3495	265	84
3496	266	1
3497	266	4
3498	266	47
3499	266	49
3500	266	8
3501	266	12
3502	266	60
3503	266	70
3504	266	78
3505	267	1
3506	267	4
3507	267	19
3508	267	21
3509	267	25
3510	267	26
3511	267	27
3512	267	39
3513	267	6
3514	267	8
3515	267	77
3516	267	80
3517	268	71
3518	268	77
3519	269	1
3520	269	4
3521	269	35
3522	269	5
3523	269	39
3524	269	46
3525	269	8
3526	269	56
3527	269	57
3528	269	13
3529	269	63
3530	269	65
3531	269	68
3532	269	77
3533	270	1
3534	270	4
3535	270	26
3536	270	27
3537	270	39
3538	270	40
3539	270	54
3540	270	9
3541	270	12
3542	270	70
3543	270	81
3544	271	1
3545	271	4
3546	271	25
3547	271	26
3548	271	27
3549	271	47
3550	271	7
3551	271	54
3552	271	64
3553	271	71
3554	271	78
3555	271	80
3556	271	81
3557	272	1
3558	272	4
3559	272	18
3560	272	39
3561	272	44
3562	272	8
3563	272	9
3564	272	13
3565	272	60
3566	272	77
3567	273	1
3568	273	4
3569	273	17
3570	273	27
3571	273	39
3572	273	7
3573	273	54
3574	273	55
3575	273	9
3576	273	78
3577	273	81
3578	274	1
3579	274	4
3580	274	14
3581	274	17
3582	274	25
3583	274	27
3584	274	34
3585	274	36
3586	274	37
3587	274	7
3588	274	54
3589	274	67
3590	274	80
3591	274	81
3592	275	1
3593	275	4
3594	275	17
3595	275	21
3596	275	22
3597	275	27
3598	275	30
3599	275	7
3600	275	8
3601	275	13
3602	275	59
3603	275	60
3604	275	64
3605	275	73
3606	275	78
3607	275	83
3608	276	23
3609	276	45
3610	276	47
3611	276	51
3612	276	7
3613	276	8
3614	276	57
3615	276	64
3616	276	78
3617	276	79
3618	276	80
3619	277	1
3620	277	4
3621	277	22
3622	277	25
3623	278	4
3624	278	5
3625	278	40
3626	278	8
3627	278	77
3628	278	78
3629	278	83
3630	279	1
3631	279	4
3632	279	22
3633	279	8
3634	279	9
3635	279	13
3636	279	60
3637	279	77
3638	280	4
3639	280	22
3640	280	25
3641	280	33
3642	280	5
3643	280	39
3644	280	44
3645	280	45
3646	280	46
3647	280	47
3648	280	48
3649	280	51
3650	280	53
3651	280	8
3652	280	56
3653	280	9
3654	280	13
3655	280	59
3656	280	60
3657	280	71
3658	280	77
3659	280	78
3660	280	83
3661	281	1
3662	281	4
3663	281	17
3664	281	21
3665	281	27
3666	281	46
3667	281	47
3668	281	7
3669	281	54
3670	281	13
3671	281	64
3672	281	70
3673	281	71
3674	281	78
3675	281	79
3676	281	81
3677	281	83
3678	282	1
3679	282	4
3680	282	25
3681	282	39
3682	282	8
3683	282	55
3684	282	9
3685	282	12
3686	282	13
3687	282	67
3688	282	70
3689	282	78
3690	282	83
3691	283	1
3692	283	4
3693	283	19
3694	283	25
3695	283	5
3696	283	39
3697	283	40
3698	283	43
3699	283	44
3700	283	45
3701	283	46
3702	283	47
3703	283	51
3704	283	52
3705	283	53
3706	283	8
3707	283	56
3708	283	9
3709	283	57
3710	283	13
3711	283	60
3712	283	61
3713	283	63
3714	283	64
3715	283	65
3716	283	68
3717	283	77
3718	284	1
3719	284	4
3720	284	5
3721	284	39
3722	284	6
3723	284	46
3724	284	48
3725	284	51
3726	284	8
3727	284	9
3728	284	60
3729	284	65
3730	284	68
3731	284	77
3732	284	78
3733	285	1
3734	285	4
3735	285	17
3736	285	73
3737	285	78
3738	285	83
3739	286	1
3740	286	4
3741	286	17
3742	286	8
3743	286	55
3744	286	9
3745	286	13
3746	286	60
3747	286	70
3748	286	73
3749	286	77
3750	286	83
3751	287	1
3752	287	4
3753	287	54
3754	287	81
3755	288	1
3756	288	4
3757	288	27
3758	288	40
3759	288	47
3760	288	54
3761	288	81
3762	288	83
3763	289	1
3764	289	4
3765	289	17
3766	289	25
3767	289	26
3768	289	27
3769	289	36
3770	289	39
3771	289	40
3772	289	46
3773	289	7
3774	289	54
3775	289	64
3776	289	80
3777	289	81
3778	290	1
3779	290	4
3780	290	17
3781	290	32
3782	290	36
3783	290	40
3784	290	6
3785	290	8
3786	290	12
3787	290	13
3788	291	1
3789	291	19
3790	291	21
3791	291	23
3792	291	27
3793	291	7
3794	291	8
3795	291	56
3796	291	57
3797	291	77
3798	291	78
3799	291	80
3800	292	1
3801	292	4
3802	292	17
3803	292	19
3804	292	35
3805	292	5
3806	292	44
3807	292	46
3808	292	52
3809	292	8
3810	292	55
3811	292	57
3812	292	13
3813	292	60
3814	292	61
3815	292	63
3816	292	68
3817	292	71
3818	292	73
3819	292	77
3820	292	83
3821	293	17
3822	293	25
3823	293	26
3824	293	28
3825	293	33
3826	293	47
3827	293	67
3828	293	77
3829	293	78
3830	293	80
3831	293	81
3832	293	83
3833	294	1
3834	294	4
3835	295	4
3836	295	17
3837	295	25
3838	295	27
3839	295	5
3840	295	40
3841	295	47
3842	295	51
3843	295	8
3844	295	9
3845	295	12
3846	295	64
3847	295	77
3848	295	78
3849	295	79
3850	295	81
3851	296	1
3852	296	4
3853	296	25
3854	296	54
\.


--
-- TOC entry 3436 (class 0 OID 130278)
-- Dependencies: 232
-- Data for Name: remanga_title_chapters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remanga_title_chapters (id, title_id, chapter, tome) FROM stdin;
1	1	183	1
2	1	182	1
3	1	181	1
4	1	180	1
5	1	179	1
6	1	178	1
7	1	177	1
8	1	176	1
9	1	175	1
10	1	174	1
11	1	173	1
12	1	172	1
13	1	171	1
14	1	170	1
15	1	169	1
16	1	168	1
17	1	167	1
18	1	166	1
19	1	165	1
20	1	164	1
21	1	163	1
22	1	162	1
23	1	161	1
24	1	160	1
25	1	159	1
26	1	158	1
27	1	157	1
28	1	156	1
29	1	155	1
30	1	154	1
31	1	153	1
32	1	152	1
33	1	151	1
34	1	150	1
35	1	149	1
36	1	148	1
37	1	147	1
38	1	146	1
39	1	145	1
40	1	144	1
41	1	143	1
42	1	142	1
43	1	141	1
44	1	140	1
45	1	139	1
46	1	138	1
47	1	137	1
48	1	136	1
49	1	135	1
50	1	134	1
51	1	133	1
52	1	132	1
53	1	131	1
54	1	130	1
55	1	129	1
56	1	128	1
57	1	127	1
58	1	126	1
59	1	125	1
60	1	124	1
61	1	123	1
62	1	122	1
63	1	121	1
64	1	120	1
65	1	119	1
66	1	118	1
67	1	117	1
68	1	116	1
69	1	115	1
70	1	114	1
71	1	113	1
72	1	112	1
73	1	111	1
74	1	110	1
75	1	109	1
76	1	108	1
77	1	107	1
78	1	106	1
79	1	105	1
80	1	104	1
81	1	103	1
82	1	102	1
83	1	101	1
84	1	100	1
85	1	99	1
86	1	98	1
87	1	97	1
88	1	96	1
89	1	95	1
90	1	94	1
91	1	93	1
92	1	92	1
93	1	91	1
94	1	90	1
95	1	89	1
96	1	88	1
97	1	87	1
98	1	86	1
99	1	85	1
100	1	84	1
101	1	83	1
102	1	82	1
103	1	81	1
104	1	80	1
105	1	79	1
106	1	78	1
107	1	77	1
108	1	76	1
109	1	75	1
110	1	74	1
111	1	73	1
112	1	72	1
113	1	71	1
114	1	70	1
115	1	69	1
116	1	68	1
117	1	67	1
118	1	66	1
119	1	65	1
120	1	64	1
121	1	63	1
122	1	62	1
123	1	61	1
124	1	60	1
125	1	59	1
126	1	58	1
127	1	57	1
128	1	56	1
129	1	55	1
130	1	54	1
131	1	53	1
132	1	52	1
133	1	51	1
134	1	50	1
135	1	49	1
136	1	48	1
137	1	47	1
138	1	46	1
139	1	45	1
140	1	44	1
141	1	43	1
142	1	42	1
143	1	41	1
144	1	40	1
145	1	39	1
146	1	38	1
147	1	37	1
148	1	36	1
149	1	35	1
150	1	34	1
151	1	33	1
152	1	32	1
153	1	31	1
154	1	30	1
155	1	29	1
156	1	28	1
157	1	27	1
158	1	26	1
159	1	25	1
160	1	24	1
161	1	23	1
162	1	22	1
163	1	21	1
164	1	20	1
165	1	19	1
166	1	18	1
167	1	17	1
168	1	16	1
169	1	15	1
170	1	14	1
171	1	13	1
172	1	12	1
173	1	11	1
174	1	10	1
175	1	9	1
176	1	8	1
177	1	7	1
178	1	6	1
179	1	5	1
180	1	4	1
181	1	3	1
182	1	2	1
183	1	1	1
184	1	0	1
185	2	3629	1
186	2	3628	1
187	2	3627	1
188	2	3626	1
189	2	3625	1
190	2	3624	1
191	2	3623	1
192	2	3622	1
193	2	3621	1
194	2	3620	1
195	2	3619	1
196	2	3618	1
197	2	3617	1
198	2	3616	1
199	2	3615	1
200	2	3614	1
201	2	3613	1
202	2	3612	1
203	2	3611	1
204	2	3610	1
205	2	3609	1
206	2	3608	1
207	2	3607	1
208	2	3606	1
209	2	3605	1
210	2	3604	1
211	2	3603	1
212	2	3602	1
213	2	3601	1
214	2	3600	1
215	2	3599	1
216	2	3598	1
217	2	3597	1
218	2	3596	1
219	2	3595	1
220	2	3594	1
221	2	3593	1
222	2	3592	1
223	2	3591	1
224	2	3590	1
225	2	3589	1
226	2	3588	1
227	2	3587	1
228	2	3586	1
229	2	3585	1
230	2	3584	1
231	2	3583	1
232	2	3582	1
233	2	3581	1
234	2	3580	1
235	2	3579	1
236	2	3578	1
237	2	3577	1
238	2	3576	1
239	2	3575	1
240	2	3574	1
241	2	3573	1
242	2	3572	1
243	2	3571	1
244	2	3570	1
245	2	3569	1
246	2	3568	1
247	2	3567	1
248	2	3566	1
249	2	3565	1
250	2	3564	1
251	2	3563	1
252	2	3562	1
253	2	3561	1
254	2	3560	1
255	2	3559	1
256	2	3558	1
257	2	3557	1
258	2	3556	1
259	2	3555	1
260	2	3554	1
261	2	3553	1
262	2	3552	1
263	2	3551	1
264	2	3550	1
265	2	3549	1
266	2	3548	1
267	2	3547	1
268	2	3546	1
269	2	3545	1
270	2	3544	1
271	2	3543	1
272	2	3542	1
273	2	3541	1
274	2	3540	1
275	2	3539	1
276	2	3538	1
277	2	3537	1
278	2	3536	1
279	2	3535	1
280	2	3534	1
281	2	3533	1
282	2	3532	1
283	2	3531	1
284	2	3530	1
285	2	3529	1
286	2	3528	1
287	2	3527	1
288	2	3526	1
289	2	3525	1
290	2	3524	1
291	2	3523	1
292	2	3522	1
293	2	3521	1
294	2	3520	1
295	2	3519	1
296	2	3518	1
297	2	3517	1
298	2	3516	1
299	2	3515	1
300	2	3514	1
301	2	3513	1
302	2	3512	1
303	2	3511	1
304	2	3510	1
305	2	3509	1
306	2	3508	1
307	2	3507	1
308	2	3506	1
309	2	3505	1
310	2	3504	1
311	2	3503	1
312	2	3502	1
313	2	3501	1
314	2	3500	1
315	2	3499	1
316	2	3498	1
317	2	3497	1
318	2	3496	1
319	2	3495	1
320	2	3494	1
321	2	3493	1
322	2	3492	1
323	2	3491	1
324	2	3490	1
325	2	3489	1
326	2	3488	1
327	2	3487	1
328	2	3486	1
329	2	3485	1
330	2	3484	1
331	2	3483	1
332	2	3482	1
333	2	3481	1
334	2	3480	1
335	2	3479	1
336	2	3478	1
337	2	3477	1
338	2	3476	1
339	2	3475	1
340	2	3474	1
341	2	3473	1
342	2	3472	1
343	2	3471	1
344	2	3470	1
345	2	3469	1
346	2	3468	1
347	2	3467	1
348	2	3466	1
349	2	3465	1
350	2	3464	1
351	2	3463	1
352	2	3462	1
353	2	3461	1
354	2	3460	1
355	2	3459	1
356	2	3458	1
357	2	3457	1
358	2	3456	1
359	2	3455	1
360	2	3454	1
361	2	3453	1
362	2	3452	1
363	2	3451	1
364	2	3450	1
365	2	3449	1
366	2	3448	1
367	2	3447	1
368	2	3446	1
369	2	3445	1
370	2	3444	1
371	2	3443	1
372	2	3442	1
373	2	3441	1
374	2	3440	1
375	2	3439	1
376	2	3438	1
377	2	3437	1
378	2	3436	1
379	2	3435	1
380	2	3434	1
381	2	3433	1
382	2	3432	1
383	2	3431	1
384	2	3430	1
385	2	3429	1
386	2	3428	1
387	2	3427	1
388	2	3426	1
389	2	3425	1
390	2	3424	1
391	2	3423	1
392	2	3422	1
393	2	3421	1
394	2	3420	1
395	2	3419	1
396	2	3418	1
397	2	3417	1
398	2	3416	1
399	2	3415	1
400	2	3414	1
401	2	3413	1
402	2	3412	1
403	2	3411	1
404	2	3410	1
405	2	3409	1
406	2	3408	1
407	2	3407	1
408	2	3406	1
409	2	3405	1
410	2	3404	1
411	2	3403	1
412	2	3402	1
413	2	3401	1
414	2	3400	1
415	2	3399	1
416	2	3398	1
417	2	3397	1
418	2	3396	1
419	2	3395	1
420	2	3394	1
421	2	3393	1
422	2	3392	1
423	2	3391	1
424	2	3390	1
425	2	3389	1
426	2	3388	1
427	2	3387	1
428	2	3386	1
429	2	3385	1
430	2	3384	1
431	2	3383	1
432	2	3382	1
433	2	3381	1
434	2	3380	1
435	2	3379	1
436	2	3378	1
437	2	3377	1
438	2	3376	1
439	2	3375	1
440	2	3374	1
441	2	3373	1
442	2	3372	1
443	2	3371	1
444	2	3370	1
445	2	3369	1
446	2	3368	1
447	2	3367	1
448	2	3366	1
449	2	3365	1
450	2	3364	1
451	2	3363	1
452	2	3362	1
453	2	3361	1
454	2	3360	1
455	2	3359	1
456	2	3358	1
457	2	3357	1
458	2	3356	1
459	2	3355	1
460	2	3354	1
461	2	3353	1
462	2	3352	1
463	2	3351	1
464	2	3350	1
465	2	3349	1
466	2	3348	1
467	2	3347	1
468	2	3346	1
469	2	3345	1
470	2	3344	1
471	2	3343	1
472	2	3342	1
473	2	3341	1
474	2	3340	1
475	2	3339	1
476	2	3338	1
477	2	3337	1
478	2	3336	1
479	2	3335	1
480	2	3334	1
481	2	3333	1
482	2	3332	1
483	2	3331	1
484	2	3330	1
485	2	3329	1
486	2	3328	1
487	2	3327	1
488	2	3326	1
489	2	3325	1
490	2	3324	1
491	2	3323	1
492	2	3322	1
493	2	3321	1
494	2	3320	1
495	2	3319	1
496	2	3318	1
497	2	3317	1
498	2	3316	1
499	2	3315	1
500	2	3314	1
501	2	3313	1
502	2	3312	1
503	2	3311	1
504	2	3310	1
505	2	3309	1
506	2	3308	1
507	2	3307	1
508	2	3306	1
509	2	3305	1
510	2	3304	1
511	2	3303	1
512	2	3302	1
513	2	3301	1
514	2	3300	1
515	2	3299	1
516	2	3298	1
517	2	3297	1
518	2	3296	1
519	2	3295	1
520	2	3294	1
521	2	3293	1
522	2	3292	1
523	2	3291	1
524	2	3290	1
525	2	3289	1
526	2	3288	1
527	2	3287	1
528	2	3286	1
529	2	3285	1
530	2	3284	1
531	2	3283	1
532	2	3282	1
533	2	3281	1
534	2	3280	1
535	2	3279	1
536	2	3278	1
537	2	3277	1
538	2	3276	1
539	2	3275	1
540	2	3274	1
541	2	3273	1
542	2	3272	1
543	2	3271	1
544	2	3270	1
545	2	3269	1
546	2	3268	1
547	2	3267	1
548	2	3266	1
549	2	3265	1
550	2	3264	1
551	2	3263	1
552	2	3262	1
553	2	3261	1
554	2	3260	1
555	2	3259	1
556	2	3258	1
557	2	3257	1
558	2	3256	1
559	2	3255	1
560	2	3254	1
561	2	3253	1
562	2	3252	1
563	2	3251	1
564	2	3250	1
565	2	3249	1
566	2	3248	1
567	2	3247	1
568	2	3246	1
569	2	3245	1
570	2	3244	1
571	2	3243	1
572	2	3242	1
573	2	3241	1
574	2	3240	1
575	2	3239	1
576	2	3238	1
577	2	3237	1
578	2	3236	1
579	2	3235	1
580	2	3234	1
581	2	3233	1
582	2	3232	1
583	2	3231	1
584	2	3230	1
585	2	3229	1
586	2	3228	1
587	2	3227	1
588	2	3226	1
589	2	3225	1
590	2	3224	1
591	2	3223	1
592	2	3222	1
593	2	3221	1
594	2	3220	1
595	2	3219	1
596	2	3218	1
597	2	3217	1
598	2	3216	1
599	2	3215	1
600	2	3214	1
601	2	3213	1
602	2	3212	1
603	2	3211	1
604	2	3210	1
605	2	3209	1
606	2	3208	1
607	2	3207	1
608	2	3206	1
609	2	3205	1
610	2	3204	1
611	2	3203	1
612	2	3202	1
613	2	3201	1
614	2	3200	1
615	2	3199	1
616	2	3198	1
617	2	3197	1
618	2	3196	1
619	2	3195	1
620	2	3194	1
621	2	3193	1
622	2	3192	1
623	2	3191	1
624	2	3190	1
625	2	3189	1
626	2	3188	1
627	2	3187	1
628	2	3186	1
629	2	3185	1
630	2	3184	1
631	2	3183	1
632	2	3182	1
633	2	3181	1
634	2	3180	1
635	2	3179	1
636	2	3178	1
637	2	3177	1
638	2	3176	1
639	2	3175	1
640	2	3174	1
641	2	3173	1
642	2	3172	1
643	2	3171	1
644	2	3170	1
645	2	3169	1
646	2	3168	1
647	2	3167	1
648	2	3166	1
649	2	3165	1
650	2	3164	1
651	2	3163	1
652	2	3162	1
653	2	3161	1
654	2	3160	1
655	2	3159	1
656	2	3158	1
657	2	3157	1
658	2	3156	1
659	2	3155	1
660	2	3154	1
661	2	3153	1
662	2	3152	1
663	2	3151	1
664	2	3150	1
665	2	3149	1
666	2	3148	1
667	2	3147	1
668	2	3146	1
669	2	3145	1
670	2	3144	1
671	2	3143	1
672	2	3142	1
673	2	3141	1
674	2	3140	1
675	2	3139	1
676	2	3138	1
677	2	3137	1
678	2	3136	1
679	2	3135	1
680	2	3134	1
681	2	3133	1
682	2	3132	1
683	2	3131	1
684	2	3130	1
685	2	3129	1
686	2	3128	1
687	2	3127	1
688	2	3126	1
689	2	3125	1
690	2	3124	1
691	2	3123	1
692	2	3122	1
693	2	3121	1
694	2	3120	1
695	2	3119	1
696	2	3118	1
697	2	3117	1
698	2	3116	1
699	2	3115	1
700	2	3114	1
701	2	3113	1
702	2	3112	1
703	2	3111	1
704	2	3110	1
705	2	3109	1
706	2	3108	1
707	2	3107	1
708	2	3106	1
709	2	3105	1
710	2	3104	1
711	2	3103	1
712	2	3102	1
713	2	3101	1
714	2	3100	1
715	2	3099	1
716	2	3098	1
717	2	3097	1
718	2	3096	1
719	2	3095	1
720	2	3094	1
721	2	3093	1
722	2	3092	1
723	2	3091	1
724	2	3090	1
725	2	3089	1
726	2	3088	1
727	2	3087	1
728	2	3086	1
729	2	3085	1
730	2	3084	1
731	2	3083	1
732	2	3082	1
733	2	3081	1
734	2	3080	1
735	2	3079	1
736	2	3078	1
737	2	3077	1
738	2	3076	1
739	2	3075	1
740	2	3074	1
741	2	3073	1
742	2	3072	1
743	2	3071	1
744	2	3070	1
745	2	3069	1
746	2	3068	1
747	2	3067	1
748	2	3066	1
749	2	3065	1
750	2	3064	1
751	2	3063	1
752	2	3062	1
753	2	3061	1
754	2	3060	1
755	2	3059	1
756	2	3058	1
757	2	3057	1
758	2	3056	1
759	2	3055	1
760	2	3054	1
761	2	3053	1
762	2	3052	1
763	2	3051	1
764	2	3050	1
765	2	3049	1
766	2	3048	1
767	2	3047	1
768	2	3046	1
769	2	3045	1
770	2	3044	1
771	2	3043	1
772	2	3042	1
773	2	3041	1
774	2	3040	1
775	2	3039	1
776	2	3038	1
777	2	3037	1
778	2	3036	1
779	2	3035	1
780	2	3034	1
781	2	3033	1
782	2	3032	1
783	2	3031	1
784	2	3030	1
785	2	3029	1
786	2	3028	1
787	2	3027	1
788	2	3026	1
789	2	3025	1
790	2	3024	1
791	2	3023	1
792	2	3022	1
793	2	3021	1
794	2	3020	1
795	2	3019	1
796	2	3018	1
797	2	3017	1
798	2	3016	1
799	2	3015	1
800	2	3014	1
801	2	3013	1
802	2	3012	1
803	2	3011	1
804	2	3010	1
805	2	3009	1
806	2	3008	1
807	2	3007	1
808	2	3006	1
809	2	3005	1
810	2	3004	1
811	2	3003	1
812	2	3002	1
813	2	3001	1
814	2	3000	1
815	2	2999	1
816	2	2998	1
817	2	2997	1
818	2	2996	1
819	2	2995	1
820	2	2994	1
821	2	2993	1
822	2	2992	1
823	2	2991	1
824	2	2990	1
825	2	2989	1
826	2	2988	1
827	2	2987	1
828	2	2986	1
829	2	2985	1
830	2	2984	1
831	2	2983	1
832	2	2982	1
833	2	2981	1
834	2	2980	1
835	2	2979	1
836	2	2978	1
837	2	2977	1
838	2	2976	1
839	2	2975	1
840	2	2974	1
841	2	2973	1
842	2	2972	1
843	2	2971	1
844	2	2970	1
845	2	2969	1
846	2	2968	1
847	2	2967	1
848	2	2966	1
849	2	2965	1
850	2	2964	1
851	2	2963	1
852	2	2962	1
853	2	2961	1
854	2	2960	1
855	2	2959	1
856	2	2958	1
857	2	2957	1
858	2	2956	1
859	2	2955	1
860	2	2954	1
861	2	2953	1
862	2	2952	1
863	2	2951	1
864	2	2950	1
865	2	2949	1
866	2	2948	1
867	2	2947	1
868	2	2946	1
869	2	2945	1
870	2	2944	1
871	2	2943	1
872	2	2942	1
873	2	2941	1
874	2	2940	1
875	2	2939	1
876	2	2938	1
877	2	2937	1
878	2	2936	1
879	2	2935	1
880	2	2934	1
881	2	2933	1
882	2	2932	1
883	2	2931	1
884	2	2930	1
885	2	2929	1
886	2	2928	1
887	2	2927	1
888	2	2926	1
889	2	2925	1
890	2	2924	1
891	2	2923	1
892	2	2922	1
893	2	2921	1
894	2	2920	1
895	2	2919	1
896	2	2918	1
897	2	2917	1
898	2	2916	1
899	2	2915	1
900	2	2914	1
901	2	2913	1
902	2	2912	1
903	2	2911	1
904	2	2910	1
905	2	2909	1
906	2	2908	1
907	2	2907	1
908	2	2906	1
909	2	2905	1
910	2	2904	1
911	2	2903	1
912	2	2902	1
913	2	2901	1
914	2	2900	1
915	2	2899	1
916	2	2898	1
917	2	2897	1
918	2	2896	1
919	2	2895	1
920	2	2894	1
921	2	2893	1
922	2	2892	1
923	2	2891	1
924	2	2890	1
925	2	2889	1
926	2	2888	1
927	2	2887	1
928	2	2886	1
929	2	2885	1
930	2	2884	1
931	2	2883	1
932	2	2882	1
933	2	2881	1
934	2	2880	1
935	2	2879	1
936	2	2878	1
937	2	2877	1
938	2	2876	1
939	2	2875	1
940	2	2874	1
941	2	2873	1
942	2	2872	1
943	2	2871	1
944	2	2870	1
945	2	2869	1
946	2	2868	1
947	2	2867	1
948	2	2866	1
949	2	2865	1
950	2	2864	1
951	2	2863	1
952	2	2862	1
953	2	2861	1
954	2	2860	1
955	2	2859	1
956	2	2858	1
957	2	2857	1
958	2	2856	1
959	2	2855	1
960	2	2854	1
961	2	2853	1
962	2	2852	1
963	2	2851	1
964	2	2850	1
965	2	2849	1
966	2	2848	1
967	2	2847	1
968	2	2846	1
969	2	2845	1
970	2	2844	1
971	2	2843	1
972	2	2842	1
973	2	2841	1
974	2	2840	1
975	2	2839	1
976	2	2838	1
977	2	2837	1
978	2	2836	1
979	2	2835	1
980	2	2834	1
981	2	2833	1
982	2	2832	1
983	2	2831	1
984	2	2830	1
985	2	2829	1
986	2	2828	1
987	2	2827	1
988	2	2826	1
989	2	2825	1
990	2	2824	1
991	2	2823	1
992	2	2822	1
993	2	2821	1
994	2	2820	1
995	2	2819	1
996	2	2818	1
997	2	2817	1
998	2	2816	1
999	2	2815	1
1000	2	2814	1
1001	2	2813	1
1002	2	2812	1
1003	2	2811	1
1004	2	2810	1
1005	2	2809	1
1006	2	2808	1
1007	2	2807	1
1008	2	2806	1
1009	2	2805	1
1010	2	2804	1
1011	2	2803	1
1012	2	2802	1
1013	2	2801	1
1014	2	2800	1
1015	2	2799	1
1016	2	2798	1
1017	2	2797	1
1018	2	2796	1
1019	2	2795	1
1020	2	2794	1
1021	2	2793	1
1022	2	2792	1
1023	2	2791	1
1024	2	2790	1
1025	2	2789	1
1026	2	2788	1
1027	2	2787	1
1028	2	2786	1
1029	2	2785	1
1030	2	2784	1
1031	2	2783	1
1032	2	2782	1
1033	2	2781	1
1034	2	2780	1
1035	2	2779	1
1036	2	2778	1
1037	2	2777	1
1038	2	2776	1
1039	2	2775	1
1040	2	2774	1
1041	2	2773	1
1042	2	2772	1
1043	2	2771	1
1044	2	2770	1
1045	2	2769	1
1046	2	2768	1
1047	2	2767	1
1048	2	2766	1
1049	2	2765	1
1050	2	2764	1
1051	2	2763	1
1052	2	2762	1
1053	2	2761	1
1054	2	2760	1
1055	2	2759	1
1056	2	2758	1
1057	2	2757	1
1058	2	2756	1
1059	2	2755	1
1060	2	2754	1
1061	2	2753	1
1062	2	2752	1
1063	2	2751	1
1064	2	2750	1
1065	2	2749	1
1066	2	2748	1
1067	2	2747	1
1068	2	2746	1
1069	2	2745	1
1070	2	2744	1
1071	2	2743	1
1072	2	2742	1
1073	2	2741	1
1074	2	2740	1
1075	2	2739	1
1076	2	2738	1
1077	2	2737	1
1078	2	2736	1
1079	2	2735	1
1080	2	2734	1
1081	2	2733	1
1082	2	2732	1
1083	2	2731	1
1084	2	2730	1
1085	2	2729	1
1086	2	2728	1
1087	2	2727	1
1088	2	2726	1
1089	2	2725	1
1090	2	2724	1
1091	2	2723	1
1092	2	2722	1
1093	2	2721	1
1094	2	2720	1
1095	2	2719	1
1096	2	2718	1
1097	2	2717	1
1098	2	2716	1
1099	2	2715	1
1100	2	2714	1
1101	2	2713	1
1102	2	2712	1
1103	2	2711	1
1104	2	2710	1
1105	2	2709	1
1106	2	2708	1
1107	2	2707	1
1108	2	2706	1
1109	2	2705	1
1110	2	2704	1
1111	2	2703	1
1112	2	2702	1
1113	2	2701	1
1114	2	2700	1
1115	2	2699	1
1116	2	2698	1
1117	2	2697	1
1118	2	2696	1
1119	2	2695	1
1120	2	2694	1
1121	2	2693	1
1122	2	2692	1
1123	2	2691	1
1124	2	2690	1
1125	2	2689	1
1126	2	2688	1
1127	2	2687	1
1128	2	2686	1
1129	2	2685	1
1130	2	2684	1
1131	2	2683	1
1132	2	2682	1
1133	2	2681	1
1134	2	2680	1
1135	2	2679	1
1136	2	2678	1
1137	2	2677	1
1138	2	2676	1
1139	2	2675	1
1140	2	2674	1
1141	2	2673	1
1142	2	2672	1
1143	2	2671	1
1144	2	2670	1
1145	2	2669	1
1146	2	2668	1
1147	2	2667	1
1148	2	2666	1
1149	2	2665	1
1150	2	2664	1
1151	2	2663	1
1152	2	2662	1
1153	2	2661	1
1154	2	2660	1
1155	2	2659	1
1156	2	2658	1
1157	2	2657	1
1158	2	2656	1
1159	2	2655	1
1160	2	2654	1
1161	2	2653	1
1162	2	2652	1
1163	2	2651	1
1164	2	2650	1
1165	2	2649	1
1166	2	2648	1
1167	2	2647	1
1168	2	2646	1
1169	2	2645	1
1170	2	2644	1
1171	2	2643	1
1172	2	2642	1
1173	2	2641	1
1174	2	2640	1
1175	2	2639	1
1176	2	2638	1
1177	2	2637	1
1178	2	2636	1
1179	2	2635	1
1180	2	2634	1
1181	2	2633	1
1182	2	2632	1
1183	2	2631	1
1184	2	2630	1
1185	2	2629	1
1186	2	2628	1
1187	2	2627	1
1188	2	2626	1
1189	2	2625	1
1190	2	2624	1
1191	2	2623	1
1192	2	2622	1
1193	2	2621	1
1194	2	2620	1
1195	2	2619	1
1196	2	2618	1
1197	2	2617	1
1198	2	2616	1
1199	2	2615	1
1200	2	2614	1
1201	2	2613	1
1202	2	2612	1
1203	2	2611	1
1204	2	2610	1
1205	2	2609	1
1206	2	2608	1
1207	2	2607	1
1208	2	2606	1
1209	2	2605	1
1210	2	2604	1
1211	2	2603	1
1212	2	2602	1
1213	2	2601	1
1214	2	2600	1
1215	2	2599	1
1216	2	2598	1
1217	2	2597	1
1218	2	2596	1
1219	2	2595	1
1220	2	2594	1
1221	2	2593	1
1222	2	2592	1
1223	2	2591	1
1224	2	2590	1
1225	2	2589	1
1226	2	2588	1
1227	2	2587	1
1228	2	2586	1
1229	2	2585	1
1230	2	2584	1
1231	2	2583	1
1232	2	2582	1
1233	2	2581	1
1234	2	2580	1
1235	2	2579	1
1236	2	2578	1
1237	2	2577	1
1238	2	2576	1
1239	2	2575	1
1240	2	2574	1
1241	2	2573	1
1242	2	2572	1
1243	2	2571	1
1244	2	2570	1
1245	2	2569	1
1246	2	2568	1
1247	2	2567	1
1248	2	2566	1
1249	2	2565	1
1250	2	2564	1
1251	2	2563	1
1252	2	2562	1
1253	2	2561	1
1254	2	2560	1
1255	2	2559	1
1256	2	2558	1
1257	2	2557	1
1258	2	2556	1
1259	2	2555	1
1260	2	2554	1
1261	2	2553	1
1262	2	2552	1
1263	2	2551	1
1264	2	2550	1
1265	2	2549	1
1266	2	2548	1
1267	2	2547	1
1268	2	2546	1
1269	2	2545	1
1270	2	2544	1
1271	2	2543	1
1272	2	2542	1
1273	2	2541	1
1274	2	2540	1
1275	2	2539	1
1276	2	2538	1
1277	2	2537	1
1278	2	2536	1
1279	2	2535	1
1280	2	2534	1
1281	2	2533	1
1282	2	2532	1
1283	2	2531	1
1284	2	2530	1
1285	2	2529	1
1286	2	2528	1
1287	2	2527	1
1288	2	2526	1
1289	2	2525	1
1290	2	2524	1
1291	2	2523	1
1292	2	2522	1
1293	2	2521	1
1294	2	2520	1
1295	2	2519	1
1296	2	2518	1
1297	2	2517	1
1298	2	2516	1
1299	2	2515	1
1300	2	2514	1
1301	2	2513	1
1302	2	2512	1
1303	2	2511	1
1304	2	2510	1
1305	2	2509	1
1306	2	2508	1
1307	2	2507	1
1308	2	2506	1
1309	2	2505	1
1310	2	2504	1
1311	2	2503	1
1312	2	2502	1
1313	2	2501	1
1314	2	2500	1
1315	2	2499	1
1316	2	2498	1
1317	2	2497	1
1318	2	2496	1
1319	2	2495	1
1320	2	2494	1
1321	2	2493	1
1322	2	2492	1
1323	2	2491	1
1324	2	2490	1
1325	2	2489	1
1326	2	2488	1
1327	2	2487	1
1328	2	2486	1
1329	2	2485	1
1330	2	2484	1
1331	2	2483	1
1332	2	2482	1
1333	2	2481	1
1334	2	2480	1
1335	2	2479	1
1336	2	2478	1
1337	2	2477	1
1338	2	2476	1
1339	2	2475	1
1340	2	2474	1
1341	2	2473	1
1342	2	2472	1
1343	2	2471	1
1344	2	2470	1
1345	2	2469	1
1346	2	2468	1
1347	2	2467	1
1348	2	2466	1
1349	2	2465	1
1350	2	2464	1
1351	2	2463	1
1352	2	2462	1
1353	2	2461	1
1354	2	2460	1
1355	2	2459	1
1356	2	2458	1
1357	2	2457	1
1358	2	2456	1
1359	2	2455	1
1360	2	2454	1
1361	2	2453	1
1362	2	2452	1
1363	2	2451	1
1364	2	2450	1
1365	2	2449	1
1366	2	2448	1
1367	2	2447	1
1368	2	2446	1
1369	2	2445	1
1370	2	2444	1
1371	2	2443	1
1372	2	2442	1
1373	2	2441	1
1374	2	2440	1
1375	2	2439	1
1376	2	2438	1
1377	2	2437	1
1378	2	2436	1
1379	2	2435	1
1380	2	2434	1
1381	2	2433	1
1382	2	2432	1
1383	2	2431	1
1384	2	2430	1
1385	2	2429	1
1386	2	2428	1
1387	2	2427	1
1388	2	2426	1
1389	2	2425	1
1390	2	2424	1
1391	2	2423	1
1392	2	2422	1
1393	2	2421	1
1394	2	2420	1
1395	2	2419	1
1396	2	2418	1
1397	2	2417	1
1398	2	2416	1
1399	2	2415	1
1400	2	2414	1
1401	2	2413	1
1402	2	2412	1
1403	2	2411	1
1404	2	2410	1
1405	2	2409	1
1406	2	2408	1
1407	2	2407	1
1408	2	2406	1
1409	2	2405	1
1410	2	2404	1
1411	2	2403	1
1412	2	2402	1
1413	2	2401	1
1414	2	2400	1
1415	2	2399	1
1416	2	2398	1
1417	2	2397	1
1418	2	2396	1
1419	2	2395	1
1420	2	2394	1
1421	2	2393	1
1422	2	2392	1
1423	2	2391	1
1424	2	2390	1
1425	2	2389	1
1426	2	2388	1
1427	2	2387	1
1428	2	2386	1
1429	2	2385	1
1430	2	2384	1
1431	2	2383	1
1432	2	2382	1
1433	2	2381	1
1434	2	2380	1
1435	2	2379	1
1436	2	2378	1
1437	2	2377	1
1438	2	2376	1
1439	2	2375	1
1440	2	2374	1
1441	2	2373	1
1442	2	2372	1
1443	2	2371	1
1444	2	2370	1
1445	2	2369	1
1446	2	2368	1
1447	2	2367	1
1448	2	2366	1
1449	2	2365	1
1450	2	2364	1
1451	2	2363	1
1452	2	2362	1
1453	2	2361	1
1454	2	2360	1
1455	2	2359	1
1456	2	2358	1
1457	2	2357	1
1458	2	2356	1
1459	2	2355	1
1460	2	2354	1
1461	2	2353	1
1462	2	2352	1
1463	2	2351	1
1464	2	2350	1
1465	2	2349	1
1466	2	2348	1
1467	2	2347	1
1468	2	2346	1
1469	2	2345	1
1470	2	2344	1
1471	2	2343	1
1472	2	2342	1
1473	2	2341	1
1474	2	2340	1
1475	2	2339	1
1476	2	2338	1
1477	2	2337	1
1478	2	2336	1
1479	2	2335	1
1480	2	2334	1
1481	2	2333	1
1482	2	2332	1
1483	2	2331	1
1484	2	2330	1
1485	2	2329	1
1486	2	2328	1
1487	2	2327	1
1488	2	2326	1
1489	2	2325	1
1490	2	2324	1
1491	2	2323	1
1492	2	2322	1
1493	2	2321	1
1494	2	2320	1
1495	2	2319	1
1496	2	2318	1
1497	2	2317	1
1498	2	2316	1
1499	2	2315	1
1500	2	2314	1
1501	2	2313	1
1502	2	2312	1
1503	2	2311	1
1504	2	2310	1
1505	2	2309	1
1506	2	2308	1
1507	2	2307	1
1508	2	2306	1
1509	2	2305	1
1510	2	2304	1
1511	2	2303	1
1512	2	2302	1
1513	2	2301	1
1514	2	2300	1
1515	2	2299	1
1516	2	2298	1
1517	2	2297	1
1518	2	2296	1
1519	2	2295	1
1520	2	2294	1
1521	2	2293	1
1522	2	2292	1
1523	2	2291	1
1524	2	2290	1
1525	2	2289	1
1526	2	2288	1
1527	2	2287	1
1528	2	2286	1
1529	2	2285	1
1530	2	2284	1
1531	2	2283	1
1532	2	2282	1
1533	2	2281	1
1534	2	2280	1
1535	2	2279	1
1536	2	2278	1
1537	2	2277	1
1538	2	2276	1
1539	2	2275	1
1540	2	2274	1
1541	2	2273	1
1542	2	2272	1
1543	2	2271	1
1544	2	2270	1
1545	2	2269	1
1546	2	2268	1
1547	2	2267	1
1548	2	2266	1
1549	2	2265	1
1550	2	2264	1
1551	2	2263	1
1552	2	2262	1
1553	2	2261	1
1554	2	2260	1
1555	2	2259	1
1556	2	2258	1
1557	2	2257	1
1558	2	2256	1
1559	2	2255	1
1560	2	2254	1
1561	2	2253	1
1562	2	2252	1
1563	2	2251	1
1564	2	2250	1
1565	2	2249	1
1566	2	2248	1
1567	2	2247	1
1568	2	2246	1
1569	2	2245	1
1570	2	2244	1
1571	2	2243	1
1572	2	2242	1
1573	2	2241	1
1574	2	2240	1
1575	2	2239	1
1576	2	2238	1
1577	2	2237	1
1578	2	2236	1
1579	2	2235	1
1580	2	2234	1
1581	2	2233	1
1582	2	2232	1
1583	2	2231	1
1584	2	2230	1
1585	2	2229	1
1586	2	2228	1
1587	2	2227	1
1588	2	2226	1
1589	2	2225	1
1590	2	2224	1
1591	2	2223	1
1592	2	2222	1
1593	2	2221	1
1594	2	2220	1
1595	2	2219	1
1596	2	2218	1
1597	2	2217	1
1598	2	2216	1
1599	2	2215	1
1600	2	2214	1
1601	2	2213	1
1602	2	2212	1
1603	2	2211	1
1604	2	2210	1
1605	2	2209	1
1606	2	2208	1
1607	2	2207	1
1608	2	2206	1
1609	2	2205	1
1610	2	2204	1
1611	2	2203	1
1612	2	2202	1
1613	2	2201	1
1614	2	2200	1
1615	2	2199	1
1616	2	2198	1
1617	2	2197	1
1618	2	2196	1
1619	2	2195	1
1620	2	2194	1
1621	2	2193	1
1622	2	2192	1
1623	2	2191	1
1624	2	2190	1
1625	2	2189	1
1626	2	2188	1
1627	2	2187	1
1628	2	2186	1
1629	2	2185	1
1630	2	2184	1
1631	2	2183	1
1632	2	2182	1
1633	2	2181	1
1634	2	2180	1
1635	2	2179	1
1636	2	2178	1
1637	2	2177	1
1638	2	2176	1
1639	2	2175	1
1640	2	2174	1
1641	2	2173	1
1642	2	2172	1
1643	2	2171	1
1644	2	2170	1
1645	2	2169	1
1646	2	2168	1
1647	2	2167	1
1648	2	2166	1
1649	2	2165	1
1650	2	2164	1
1651	2	2163	1
1652	2	2162	1
1653	2	2161	1
1654	2	2160	1
1655	2	2159	1
1656	2	2158	1
1657	2	2157	1
1658	2	2156	1
1659	2	2155	1
1660	2	2154	1
1661	2	2153	1
1662	2	2152	1
1663	2	2151	1
1664	2	2150	1
1665	2	2149	1
1666	2	2148	1
1667	2	2147	1
1668	2	2146	1
1669	2	2145	1
1670	2	2144	1
1671	2	2143	1
1672	2	2142	1
1673	2	2141	1
1674	2	2140	1
1675	2	2139	1
1676	2	2138	1
1677	2	2137	1
1678	2	2136	1
1679	2	2135	1
1680	2	2134	1
1681	2	2133	1
1682	2	2132	1
1683	2	2131	1
1684	2	2130	1
1685	2	2129	1
1686	2	2128	1
1687	2	2127	1
1688	2	2126	1
1689	2	2125	1
1690	2	2124	1
1691	2	2123	1
1692	2	2122	1
1693	2	2121	1
1694	2	2120	1
1695	2	2119	1
1696	2	2118	1
1697	2	2117	1
1698	2	2116	1
1699	2	2115	1
1700	2	2114	1
1701	2	2113	1
1702	2	2112	1
1703	2	2111	1
1704	2	2110	1
1705	2	2109	1
1706	2	2108	1
1707	2	2107	1
1708	2	2106	1
1709	2	2105	1
1710	2	2104	1
1711	2	2103	1
1712	2	2102	1
1713	2	2101	1
1714	2	2100	1
1715	2	2099	1
1716	2	2098	1
1717	2	2097	1
1718	2	2096	1
1719	2	2095	1
1720	2	2094	1
1721	2	2093	1
1722	2	2092	1
1723	2	2091	1
1724	2	2090	1
1725	2	2089	1
1726	2	2088	1
1727	2	2087	1
1728	2	2086	1
1729	2	2085	1
1730	2	2084	1
1731	2	2083	1
1732	2	2082	1
1733	2	2081	1
1734	2	2080	1
1735	2	2079	1
1736	2	2078	1
1737	2	2077	1
1738	2	2076	1
1739	2	2075	1
1740	2	2074	1
1741	2	2073	1
1742	2	2072	1
1743	2	2071	1
1744	2	2070	1
1745	2	2069	1
1746	2	2068	1
1747	2	2067	1
1748	2	2066	1
1749	2	2065	1
1750	2	2064	1
1751	2	2063	1
1752	2	2062	1
1753	2	2061	1
1754	2	2060	1
1755	2	2059	1
1756	2	2058	1
1757	2	2057	1
1758	2	2056	1
1759	2	2055	1
1760	2	2054	1
1761	2	2053	1
1762	2	2052	1
1763	2	2051	1
1764	2	2050	1
1765	2	2049	1
1766	2	2048	1
1767	2	2047	1
1768	2	2046	1
1769	2	2045	1
1770	2	2044	1
1771	2	2043	1
1772	2	2042	1
1773	2	2041	1
1774	2	2040	1
1775	2	2039	1
1776	2	2038	1
1777	2	2037	1
1778	2	2036	1
1779	2	2035	1
1780	2	2034	1
1781	2	2033	1
1782	2	2032	1
1783	2	2031	1
1784	2	2030	1
1785	2	2029	1
1786	2	2028	1
1787	2	2027	1
1788	2	2026	1
1789	2	2025	1
1790	2	2024	1
1791	2	2023	1
1792	2	2022	1
1793	2	2021	1
1794	2	2020	1
1795	2	2019	1
1796	2	2018	1
1797	2	2017	1
1798	2	2016	1
1799	2	2015	1
1800	2	2014	1
1801	2	2013	1
1802	2	2012	1
1803	2	2011	1
1804	2	2010	1
1805	2	2009	1
1806	2	2008	1
1807	2	2007	1
1808	2	2006	1
1809	2	2005	1
1810	2	2004	1
1811	2	2003	1
1812	2	2002	1
1813	2	2001	1
1814	2	2000	1
1815	2	1999	1
1816	2	1998	1
1817	2	1997	1
1818	2	1996	1
1819	2	1995	1
1820	2	1994	1
1821	2	1993	1
1822	2	1992	1
1823	2	1991	1
1824	2	1990	1
1825	2	1989	1
1826	2	1988	1
1827	2	1987	1
1828	2	1986	1
1829	2	1985	1
1830	2	1984	1
1831	2	1983	1
1832	2	1982	1
1833	2	1981	1
1834	2	1980	1
1835	2	1979	1
1836	2	1978	1
1837	2	1977	1
1838	2	1976	1
1839	2	1975	1
1840	2	1974	1
1841	2	1973	1
1842	2	1972	1
1843	2	1971	1
1844	2	1970	1
1845	2	1969	1
1846	2	1968	1
1847	2	1967	1
1848	2	1966	1
1849	2	1965	1
1850	2	1964	1
1851	2	1963	1
1852	2	1962	1
1853	2	1961	1
1854	2	1960	1
1855	2	1959	1
1856	2	1958	1
1857	2	1957	1
1858	2	1956	1
1859	2	1955	1
1860	2	1954	1
1861	2	1953	1
1862	2	1952	1
1863	2	1951	1
1864	2	1950	1
1865	2	1949	1
1866	2	1948	1
1867	2	1947	1
1868	2	1946	1
1869	2	1945	1
1870	2	1944	1
1871	2	1943	1
1872	2	1942	1
1873	2	1941	1
1874	2	1940	1
1875	2	1939	1
1876	2	1938	1
1877	2	1937	1
1878	2	1936	1
1879	2	1935	1
1880	2	1934	1
1881	2	1933	1
1882	2	1932	1
1883	2	1931	1
1884	2	1930	1
1885	2	1929	1
1886	2	1928	1
1887	2	1927	1
1888	2	1926	1
1889	2	1925	1
1890	2	1924	1
1891	2	1923	1
1892	2	1922	1
1893	2	1921	1
1894	2	1920	1
1895	2	1919	1
1896	2	1918	1
1897	2	1917	1
1898	2	1916	1
1899	2	1915	1
1900	2	1914	1
1901	2	1913	1
1902	2	1912	1
1903	2	1911	1
1904	2	1910	1
1905	2	1909	1
1906	2	1908	1
1907	2	1907	1
1908	2	1906	1
1909	2	1905	1
1910	2	1904	1
1911	2	1903	1
1912	2	1902	1
1913	2	1901	1
1914	2	1900	1
1915	2	1899	1
1916	2	1898	1
1917	2	1897	1
1918	2	1896	1
1919	2	1895	1
1920	2	1894	1
1921	2	1893	1
1922	2	1892	1
1923	2	1891	1
1924	2	1890	1
1925	2	1889	1
1926	2	1888	1
1927	2	1887	1
1928	2	1886	1
1929	2	1885	1
1930	2	1884	1
1931	2	1883	1
1932	2	1882	1
1933	2	1881	1
1934	2	1880	1
1935	2	1879	1
1936	2	1878	1
1937	2	1877	1
1938	2	1876	1
1939	2	1875	1
1940	2	1874	1
1941	2	1873	1
1942	2	1872	1
1943	2	1871	1
1944	2	1870	1
1945	2	1869	1
1946	2	1868	1
1947	2	1867	1
1948	2	1866	1
1949	2	1865	1
1950	2	1864	1
1951	2	1863	1
1952	2	1862	1
1953	2	1861	1
1954	2	1860	1
1955	2	1859	1
1956	2	1858	1
1957	2	1857	1
1958	2	1856	1
1959	2	1855	1
1960	2	1854	1
1961	2	1853	1
1962	2	1852	1
1963	2	1851	1
1964	2	1850	1
1965	2	1849	1
1966	2	1848	1
1967	2	1847	1
1968	2	1846	1
1969	2	1845	1
1970	2	1844	1
1971	2	1843	1
1972	2	1842	1
1973	2	1841	1
1974	2	1840	1
1975	2	1839	1
1976	2	1838	1
1977	2	1837	1
1978	2	1836	1
1979	2	1835	1
1980	2	1834	1
1981	2	1833	1
1982	2	1832	1
1983	2	1831	1
1984	2	1830	1
1985	2	1829	1
1986	2	1828	1
1987	2	1827	1
1988	2	1826	1
1989	2	1825	1
1990	2	1824	1
1991	2	1823	1
1992	2	1822	1
1993	2	1821	1
1994	2	1820	1
1995	2	1819	1
1996	2	1818	1
1997	2	1817	1
1998	2	1816	1
1999	2	1815	1
2000	2	1814	1
2001	2	1813	1
2002	2	1812	1
2003	2	1811	1
2004	2	1810	1
2005	2	1809	1
2006	2	1808	1
2007	2	1807	1
2008	2	1806	1
2009	2	1805	1
2010	2	1804	1
2011	2	1803	1
2012	2	1802	1
2013	2	1801	1
2014	2	1800	1
2015	2	1799	1
2016	2	1798	1
2017	2	1797	1
2018	2	1796	1
2019	2	1795	1
2020	2	1794	1
2021	2	1793	1
2022	2	1792	1
2023	2	1791	1
2024	2	1790	1
2025	2	1789	1
2026	2	1788	1
2027	2	1787	1
2028	2	1786	1
2029	2	1785	1
2030	2	1784	1
2031	2	1783	1
2032	2	1782	1
2033	2	1781	1
2034	2	1780	1
2035	2	1779	1
2036	2	1778	1
2037	2	1777	1
2038	2	1776	1
2039	2	1775	1
2040	2	1774	1
2041	2	1773	1
2042	2	1772	1
2043	2	1771	1
2044	2	1770	1
2045	2	1769	1
2046	2	1768	1
2047	2	1767	1
2048	2	1766	1
2049	2	1765	1
2050	2	1764	1
2051	2	1763	1
2052	2	1762	1
2053	2	1761	1
2054	2	1760	1
2055	2	1759	1
2056	2	1758	1
2057	2	1757	1
2058	2	1756	1
2059	2	1755	1
2060	2	1754	1
2061	2	1753	1
2062	2	1752	1
2063	2	1751	1
2064	2	1750	1
2065	2	1749	1
2066	2	1748	1
2067	2	1747	1
2068	2	1746	1
2069	2	1745	1
2070	2	1744	1
2071	2	1743	1
2072	2	1742	1
2073	2	1741	1
2074	2	1740	1
2075	2	1739	1
2076	2	1738	1
2077	2	1737	1
2078	2	1736	1
2079	2	1735	1
2080	2	1734	1
2081	2	1733	1
2082	2	1732	1
2083	2	1731	1
2084	2	1730	1
2085	2	1729	1
2086	2	1728	1
2087	2	1727	1
2088	2	1726	1
2089	2	1725	1
2090	2	1724	1
2091	2	1723	1
2092	2	1722	1
2093	2	1721	1
2094	2	1720	1
2095	2	1719	1
2096	2	1718	1
2097	2	1717	1
2098	2	1716	1
2099	2	1715	1
2100	2	1714	1
2101	2	1713	1
2102	2	1712	1
2103	2	1711	1
2104	2	1710	1
2105	2	1709	1
2106	2	1708	1
2107	2	1707	1
2108	2	1706	1
2109	2	1705	1
2110	2	1704	1
2111	2	1703	1
2112	2	1702	1
2113	2	1701	1
2114	2	1700	1
2115	2	1699	1
2116	2	1698	1
2117	2	1697	1
2118	2	1696	1
2119	2	1695	1
2120	2	1694	1
2121	2	1693	1
2122	2	1692	1
2123	2	1691	1
2124	2	1690	1
2125	2	1689	1
2126	2	1688	1
2127	2	1687	1
2128	2	1686	1
2129	2	1685	1
2130	2	1684	1
2131	2	1683	1
2132	2	1682	1
2133	2	1681	1
2134	2	1680	1
2135	2	1679	1
2136	2	1678	1
2137	2	1677	1
2138	2	1676	1
2139	2	1675	1
2140	2	1674	1
2141	2	1673	1
2142	2	1672	1
2143	2	1671	1
2144	2	1670	1
2145	2	1669	1
2146	2	1668	1
2147	2	1667	1
2148	2	1666	1
2149	2	1665	1
2150	2	1664	1
2151	2	1663	1
2152	2	1662	1
2153	2	1661	1
2154	2	1660	1
2155	2	1659	1
2156	2	1658	1
2157	2	1657	1
2158	2	1656	1
2159	2	1655	1
2160	2	1654	1
2161	2	1653	1
2162	2	1652	1
2163	2	1651	1
2164	2	1650	1
2165	2	1649	1
2166	2	1648	1
2167	2	1647	1
2168	2	1646	1
2169	2	1645	1
2170	2	1644	1
2171	2	1643	1
2172	2	1642	1
2173	2	1641	1
2174	2	1640	1
2175	2	1639	1
2176	2	1638	1
2177	2	1637	1
2178	2	1636	1
2179	2	1635	1
2180	2	1634	1
2181	2	1633	1
2182	2	1632	1
2183	2	1631	1
2184	2	1630	1
2185	2	1629	1
2186	2	1628	1
2187	2	1627	1
2188	2	1626	1
2189	2	1625	1
2190	2	1624	1
2191	2	1623	1
2192	2	1622	1
2193	2	1621	1
2194	2	1620	1
2195	2	1619	1
2196	2	1618	1
2197	2	1617	1
2198	2	1616	1
2199	2	1615	1
2200	2	1614	1
2201	2	1613	1
2202	2	1612	1
2203	2	1611	1
2204	2	1610	1
2205	2	1609	1
2206	2	1608	1
2207	2	1607	1
2208	2	1606	1
2209	2	1605	1
2210	2	1604	1
2211	2	1603	1
2212	2	1602	1
2213	2	1601	1
2214	2	1600	1
2215	2	1599	1
2216	2	1598	1
2217	2	1597	1
2218	2	1596	1
2219	2	1595	1
2220	2	1594	1
2221	2	1593	1
2222	2	1592	1
2223	2	1591	1
2224	2	1590	1
2225	2	1589	1
2226	2	1588	1
2227	2	1587	1
2228	2	1586	1
2229	2	1585	1
2230	2	1584	1
2231	2	1583	1
2232	2	1582	1
2233	2	1581	1
2234	2	1580	1
2235	2	1579	1
2236	2	1578	1
2237	2	1577	1
2238	2	1576	1
2239	2	1575	1
2240	2	1574	1
2241	2	1573	1
2242	2	1572	1
2243	2	1571	1
2244	2	1570	1
2245	2	1569	1
2246	2	1568	1
2247	2	1567	1
2248	2	1566	1
2249	2	1565	1
2250	2	1564	1
2251	2	1563	1
2252	2	1562	1
2253	2	1561	1
2254	2	1560	1
2255	2	1559	1
2256	2	1558	1
2257	2	1557	1
2258	2	1556	1
2259	2	1555	1
2260	2	1554	1
2261	2	1553	1
2262	2	1552	1
2263	2	1551	1
2264	2	1550	1
2265	2	1549	1
2266	2	1548	1
2267	2	1547	1
2268	2	1546	1
2269	2	1545	1
2270	2	1544	1
2271	2	1543	1
2272	2	1542	1
2273	2	1541	1
2274	2	1540	1
2275	2	1539	1
2276	2	1538	1
2277	2	1537	1
2278	2	1536	1
2279	2	1535	1
2280	2	1534	1
2281	2	1533	1
2282	2	1532	1
2283	2	1531	1
2284	2	1530	1
2285	2	1529	1
2286	2	1528	1
2287	2	1527	1
2288	2	1526	1
2289	2	1525	1
2290	2	1524	1
2291	2	1523	1
2292	2	1522	1
2293	2	1521	1
2294	2	1520	1
2295	2	1519	1
2296	2	1518	1
2297	2	1517	1
2298	2	1516	1
2299	2	1515	1
2300	2	1514	1
2301	2	1513	1
2302	2	1512	1
2303	2	1511	1
2304	2	1510	1
2305	2	1509	1
2306	2	1508	1
2307	2	1507	1
2308	2	1506	1
2309	2	1505	1
2310	2	1504	1
2311	2	1503	1
2312	2	1502	1
2313	2	1501	1
2314	2	1500	1
2315	2	1499	1
2316	2	1498	1
2317	2	1497	1
2318	2	1496	1
2319	2	1495	1
2320	2	1494	1
2321	2	1493	1
2322	2	1492	1
2323	2	1491	1
2324	2	1490	1
2325	2	1489	1
2326	2	1488	1
2327	2	1487	1
2328	2	1486	1
2329	2	1485	1
2330	2	1484	1
2331	2	1483	1
2332	2	1482	1
2333	2	1481	1
2334	2	1480	1
2335	2	1479	1
2336	2	1478	1
2337	2	1477	1
2338	2	1476	1
2339	2	1475	1
2340	2	1474	1
2341	2	1473	1
2342	2	1472	1
2343	2	1471	1
2344	2	1470	1
2345	2	1469	1
2346	2	1468	1
2347	2	1467	1
2348	2	1466	1
2349	2	1465	1
2350	2	1464	1
2351	2	1463	1
2352	2	1462	1
2353	2	1461	1
2354	2	1460	1
2355	2	1459	1
2356	2	1458	1
2357	2	1457	1
2358	2	1456	1
2359	2	1455	1
2360	2	1454	1
2361	2	1453	1
2362	2	1452	1
2363	2	1451	1
2364	2	1450	1
2365	2	1449	1
2366	2	1448	1
2367	2	1447	1
2368	2	1446	1
2369	2	1445	1
2370	2	1444	1
2371	2	1443	1
2372	2	1442	1
2373	2	1441	1
2374	2	1440	1
2375	2	1439	1
2376	2	1438	1
2377	2	1437	1
2378	2	1436	1
2379	2	1435	1
2380	2	1434	1
2381	2	1433	1
2382	2	1432	1
2383	2	1431	1
2384	2	1430	1
2385	2	1429	1
2386	2	1428	1
2387	2	1427	1
2388	2	1426	1
2389	2	1425	1
2390	2	1424	1
2391	2	1423	1
2392	2	1422	1
2393	2	1421	1
2394	2	1420	1
2395	2	1419	1
2396	2	1418	1
2397	2	1417	1
2398	2	1416	1
2399	2	1415	1
2400	2	1414	1
2401	2	1413	1
2402	2	1412	1
2403	2	1411	1
2404	2	1410	1
2405	2	1409	1
2406	2	1408	1
2407	2	1407	1
2408	2	1406	1
2409	2	1405	1
2410	2	1404	1
2411	2	1403	1
2412	2	1402	1
2413	2	1401	1
2414	2	1400	1
2415	2	1399	1
2416	2	1398	1
2417	2	1397	1
2418	2	1396	1
2419	2	1395	1
2420	2	1394	1
2421	2	1393	1
2422	2	1392	1
2423	2	1391	1
2424	2	1390	1
2425	2	1389	1
2426	2	1388	1
2427	2	1387	1
2428	2	1386	1
2429	2	1385	1
2430	2	1384	1
2431	2	1383	1
2432	2	1382	1
2433	2	1381	1
2434	2	1380	1
2435	2	1379	1
2436	2	1378	1
2437	2	1377	1
2438	2	1376	1
2439	2	1375	1
2440	2	1374	1
2441	2	1373	1
2442	2	1372	1
2443	2	1371	1
2444	2	1370	1
2445	2	1369	1
2446	2	1368	1
2447	2	1367	1
2448	2	1366	1
2449	2	1365	1
2450	2	1364	1
2451	2	1363	1
2452	2	1362	1
2453	2	1361	1
2454	2	1360	1
2455	2	1359	1
2456	2	1358	1
2457	2	1357	1
2458	2	1356	1
2459	2	1355	1
2460	2	1354	1
2461	2	1353	1
2462	2	1352	1
2463	2	1351	1
2464	2	1350	1
2465	2	1349	1
2466	2	1348	1
2467	2	1347	1
2468	2	1346	1
2469	2	1345	1
2470	2	1344	1
2471	2	1343	1
2472	2	1342	1
2473	2	1341	1
2474	2	1340	1
2475	2	1339	1
2476	2	1338	1
2477	2	1337	1
2478	2	1336	1
2479	2	1335	1
2480	2	1334	1
2481	2	1333	1
2482	2	1332	1
2483	2	1331	1
2484	2	1330	1
2485	2	1329	1
2486	2	1328	1
2487	2	1327	1
2488	2	1326	1
2489	2	1325	1
2490	2	1324	1
2491	2	1323	1
2492	2	1322	1
2493	2	1321	1
2494	2	1320	1
2495	2	1319	1
2496	2	1318	1
2497	2	1317	1
2498	2	1316	1
2499	2	1315	1
2500	2	1314	1
2501	2	1313	1
2502	2	1312	1
2503	2	1311	1
2504	2	1310	1
2505	2	1309	1
2506	2	1308	1
2507	2	1307	1
2508	2	1306	1
2509	2	1305	1
2510	2	1304	1
2511	2	1303	1
2512	2	1302	1
2513	2	1301	1
2514	2	1300	1
2515	2	1299	1
2516	2	1298	1
2517	2	1297	1
2518	2	1296	1
2519	2	1295	1
2520	2	1294	1
2521	2	1293	1
2522	2	1292	1
2523	2	1291	1
2524	2	1290	1
2525	2	1289	1
2526	2	1288	1
2527	2	1287	1
2528	2	1286	1
2529	2	1285	1
2530	2	1284	1
2531	2	1283	1
2532	2	1282	1
2533	2	1281	1
2534	2	1280	1
2535	2	1279	1
2536	2	1278	1
2537	2	1277	1
2538	2	1276	1
2539	2	1275	1
2540	2	1274	1
2541	2	1273	1
2542	2	1272	1
2543	2	1271	1
2544	2	1270	1
2545	2	1269	1
2546	2	1268	1
2547	2	1267	1
2548	2	1266	1
2549	2	1265	1
2550	2	1264	1
2551	2	1263	1
2552	2	1262	1
2553	2	1261	1
2554	2	1260	1
2555	2	1259	1
2556	2	1258	1
2557	2	1257	1
2558	2	1256	1
2559	2	1255	1
2560	2	1254	1
2561	2	1253	1
2562	2	1252	1
2563	2	1251	1
2564	2	1250	1
2565	2	1249	1
2566	2	1248	1
2567	2	1247	1
2568	2	1246	1
2569	2	1245	1
2570	2	1244	1
2571	2	1243	1
2572	2	1242	1
2573	2	1241	1
2574	2	1240	1
2575	2	1239	1
2576	2	1238	1
2577	2	1237	1
2578	2	1236	1
2579	2	1235	1
2580	2	1234	1
2581	2	1233	1
2582	2	1232	1
2583	2	1231	1
2584	2	1230	1
2585	2	1229	1
2586	2	1228	1
2587	2	1227	1
2588	2	1226	1
2589	2	1225	1
2590	2	1224	1
2591	2	1223	1
2592	2	1222	1
2593	2	1221	1
2594	2	1220	1
2595	2	1219	1
2596	2	1218	1
2597	2	1217	1
2598	2	1216	1
2599	2	1215	1
2600	2	1214	1
2601	2	1213	1
2602	2	1212	1
2603	2	1211	1
2604	2	1210	1
2605	2	1209	1
2606	2	1208	1
2607	2	1207	1
2608	2	1206	1
2609	2	1205	1
2610	2	1204	1
2611	2	1203	1
2612	2	1202	1
2613	2	1201	1
2614	2	1200	1
2615	2	1199	1
2616	2	1198	1
2617	2	1197	1
2618	2	1196	1
2619	2	1195	1
2620	2	1194	1
2621	2	1193	1
2622	2	1192	1
2623	2	1191	1
2624	2	1190	1
2625	2	1189	1
2626	2	1188	1
2627	2	1187	1
2628	2	1186	1
2629	2	1185	1
2630	2	1184	1
2631	2	1183	1
2632	2	1182	1
2633	2	1181	1
2634	2	1180	1
2635	2	1179	1
2636	2	1178	1
2637	2	1177	1
2638	2	1176	1
2639	2	1175	1
2640	2	1174	1
2641	2	1173	1
2642	2	1172	1
2643	2	1171	1
2644	2	1170	1
2645	2	1169	1
2646	2	1168	1
2647	2	1167	1
2648	2	1166	1
2649	2	1165	1
2650	2	1164	1
2651	2	1163	1
2652	2	1162	1
2653	2	1161	1
2654	2	1160	1
2655	2	1159	1
2656	2	1158	1
2657	2	1157	1
2658	2	1156	1
2659	2	1155	1
2660	2	1154	1
2661	2	1153	1
2662	2	1152	1
2663	2	1151	1
2664	2	1150	1
2665	2	1149	1
2666	2	1148	1
2667	2	1147	1
2668	2	1146	1
2669	2	1145	1
2670	2	1144	1
2671	2	1143	1
2672	2	1142	1
2673	2	1141	1
2674	2	1140	1
2675	2	1139	1
2676	2	1138	1
2677	2	1137	1
2678	2	1136	1
2679	2	1135	1
2680	2	1134	1
2681	2	1133	1
2682	2	1132	1
2683	2	1131	1
2684	2	1130	1
2685	2	1129	1
2686	2	1128	1
2687	2	1127	1
2688	2	1126	1
2689	2	1125	1
2690	2	1124	1
2691	2	1123	1
2692	2	1122	1
2693	2	1121	1
2694	2	1120	1
2695	2	1119	1
2696	2	1118	1
2697	2	1117	1
2698	2	1116	1
2699	2	1115	1
2700	2	1114	1
2701	2	1113	1
2702	2	1112	1
2703	2	1111	1
2704	2	1110	1
2705	2	1109	1
2706	2	1108	1
2707	2	1107	1
2708	2	1106	1
2709	2	1105	1
2710	2	1104	1
2711	2	1103	1
2712	2	1102	1
2713	2	1101	1
2714	2	1100	1
2715	2	1099	1
2716	2	1098	1
2717	2	1097	1
2718	2	1096	1
2719	2	1095	1
2720	2	1094	1
2721	2	1093	1
2722	2	1092	1
2723	2	1091	1
2724	2	1090	1
2725	2	1089	1
2726	2	1088	1
2727	2	1087	1
2728	2	1086	1
2729	2	1085	1
2730	2	1084	1
2731	2	1083	1
2732	2	1082	1
2733	2	1081	1
2734	2	1080	1
2735	2	1079	1
2736	2	1078	1
2737	2	1077	1
2738	2	1076	1
2739	2	1075	1
2740	2	1074	1
2741	2	1073	1
2742	2	1072	1
2743	2	1071	1
2744	2	1070	1
2745	2	1069	1
2746	2	1068	1
2747	2	1067	1
2748	2	1066	1
2749	2	1065	1
2750	2	1064	1
2751	2	1063	1
2752	2	1062	1
2753	2	1061	1
2754	2	1060	1
2755	2	1059	1
2756	2	1058	1
2757	2	1057	1
2758	2	1056	1
2759	2	1055	1
2760	2	1054	1
2761	2	1053	1
2762	2	1052	1
2763	2	1051	1
2764	2	1050	1
2765	2	1049	1
2766	2	1048	1
2767	2	1047	1
2768	2	1046	1
2769	2	1045	1
2770	2	1044	1
2771	2	1043	1
2772	2	1042	1
2773	2	1041	1
2774	2	1040	1
2775	2	1039	1
2776	2	1038	1
2777	2	1037	1
2778	2	1036	1
2779	2	1035	1
2780	2	1034	1
2781	2	1033	1
2782	2	1032	1
2783	2	1031	1
2784	2	1030	1
2785	2	1029	1
2786	2	1028	1
2787	2	1027	1
2788	2	1026	1
2789	2	1025	1
2790	2	1024	1
2791	2	1023	1
2792	2	1022	1
2793	2	1021	1
2794	2	1020	1
2795	2	1019	1
2796	2	1018	1
2797	2	1017	1
2798	2	1016	1
2799	2	1015	1
2800	2	1014	1
2801	2	1013	1
2802	2	1012	1
2803	2	1011	1
2804	2	1010	1
2805	2	1009	1
2806	2	1008	1
2807	2	1007	1
2808	2	1006	1
2809	2	1005	1
2810	2	1004	1
2811	2	1003	1
2812	2	1002	1
2813	2	1001	1
2814	2	1000	1
2815	2	999	1
2816	2	998	1
2817	2	997	1
2818	2	996	1
2819	2	995	1
2820	2	994	1
2821	2	993	1
2822	2	992	1
2823	2	991	1
2824	2	990	1
2825	2	989	1
2826	2	988	1
2827	2	987	1
2828	2	986	1
2829	2	985	1
2830	2	984	1
2831	2	983	1
2832	2	982	1
2833	2	981	1
2834	2	980	1
2835	2	979	1
2836	2	978	1
2837	2	977	1
2838	2	976	1
2839	2	975	1
2840	2	974	1
2841	2	973	1
2842	2	972	1
2843	2	971	1
2844	2	970	1
2845	2	969	1
2846	2	968	1
2847	2	967	1
2848	2	966	1
2849	2	965	1
2850	2	964	1
2851	2	963	1
2852	2	962	1
2853	2	961	1
2854	2	960	1
2855	2	959	1
2856	2	958	1
2857	2	957	1
2858	2	956	1
2859	2	955	1
2860	2	954	1
2861	2	953	1
2862	2	952	1
2863	2	951	1
2864	2	950	1
2865	2	949	1
2866	2	948	1
2867	2	947	1
2868	2	946	1
2869	2	945	1
2870	2	944	1
2871	2	943	1
2872	2	942	1
2873	2	941	1
2874	2	940	1
2875	2	939	1
2876	2	938	1
2877	2	937	1
2878	2	936	1
2879	2	935	1
2880	2	934	1
2881	2	933	1
2882	2	932	1
2883	2	931	1
2884	2	930	1
2885	2	929	1
2886	2	928	1
2887	2	927	1
2888	2	926	1
2889	2	925	1
2890	2	924	1
2891	2	923	1
2892	2	922	1
2893	2	921	1
2894	2	920	1
2895	2	919	1
2896	2	918	1
2897	2	917	1
2898	2	916	1
2899	2	915	1
2900	2	914	1
2901	2	913	1
2902	2	912	1
2903	2	911	1
2904	2	910	1
2905	2	909	1
2906	2	908	1
2907	2	907	1
2908	2	906	1
2909	2	905	1
2910	2	904	1
2911	2	903	1
2912	2	902	1
2913	2	901	1
2914	2	900	1
2915	2	899	1
2916	2	898	1
2917	2	897	1
2918	2	896	1
2919	2	895	1
2920	2	894	1
2921	2	893	1
2922	2	892	1
2923	2	891	1
2924	2	890	1
2925	2	889	1
2926	2	888	1
2927	2	887	1
2928	2	886	1
2929	2	885	1
2930	2	884	1
2931	2	883	1
2932	2	882	1
2933	2	881	1
2934	2	880	1
2935	2	879	1
2936	2	878	1
2937	2	877	1
2938	2	876	1
2939	2	875	1
2940	2	874	1
2941	2	873	1
2942	2	872	1
2943	2	871	1
2944	2	870	1
2945	2	869	1
2946	2	868	1
2947	2	867	1
2948	2	866	1
2949	2	865	1
2950	2	864	1
2951	2	863	1
2952	2	862	1
2953	2	861	1
2954	2	860	1
2955	2	859	1
2956	2	858	1
2957	2	857	1
2958	2	856	1
2959	2	855	1
2960	2	854	1
2961	2	853	1
2962	2	852	1
2963	2	851	1
2964	2	850	1
2965	2	849	1
2966	2	848	1
2967	2	847	1
2968	2	846	1
2969	2	845	1
2970	2	844	1
2971	2	843	1
2972	2	842	1
2973	2	841	1
2974	2	840	1
2975	2	839	1
2976	2	838	1
2977	2	837	1
2978	2	836	1
2979	2	835	1
2980	2	834	1
2981	2	833	1
2982	2	832	1
2983	2	831	1
2984	2	830	1
2985	2	829	1
2986	2	828	1
2987	2	827	1
2988	2	826	1
2989	2	825	1
2990	2	824	1
2991	2	823	1
2992	2	822	1
2993	2	821	1
2994	2	820	1
2995	2	819	1
2996	2	818	1
2997	2	817	1
2998	2	816	1
2999	2	815	1
3000	2	814	1
3001	2	813	1
3002	2	812	1
3003	2	811	1
3004	2	810	1
3005	2	809	1
3006	2	808	1
3007	2	807	1
3008	2	806	1
3009	2	805	1
3010	2	804	1
3011	2	803	1
3012	2	802	1
3013	2	801	1
3014	2	800	1
3015	2	799	1
3016	2	798	1
3017	2	797	1
3018	2	796	1
3019	2	795	1
3020	2	794	1
3021	2	793	1
3022	2	792	1
3023	2	791	1
3024	2	790	1
3025	2	789	1
3026	2	788	1
3027	2	787	1
3028	2	786	1
3029	2	785	1
3030	2	784	1
3031	2	783	1
3032	2	782	1
3033	2	781	1
3034	2	780	1
3035	2	779	1
3036	2	778	1
3037	2	777	1
3038	2	776	1
3039	2	775	1
3040	2	774	1
3041	2	773	1
3042	2	772	1
3043	2	771	1
3044	2	770	1
3045	2	769	1
3046	2	768	1
3047	2	767	1
3048	2	766	1
3049	2	765	1
3050	2	764	1
3051	2	763	1
3052	2	762	1
3053	2	761	1
3054	2	760	1
3055	2	759	1
3056	2	758	1
3057	2	757	1
3058	2	756	1
3059	2	755	1
3060	2	754	1
3061	2	753	1
3062	2	752	1
3063	2	751	1
3064	2	750	1
3065	2	749	1
3066	2	748	1
3067	2	747	1
3068	2	746	1
3069	2	745	1
3070	2	744	1
3071	2	743	1
3072	2	742	1
3073	2	741	1
3074	2	740	1
3075	2	739	1
3076	2	738	1
3077	2	737	1
3078	2	736	1
3079	2	735	1
3080	2	734	1
3081	2	733	1
3082	2	732	1
3083	2	731	1
3084	2	730	1
3085	2	729	1
3086	2	728	1
3087	2	727	1
3088	2	726	1
3089	2	725	1
3090	2	724	1
3091	2	723	1
3092	2	722	1
3093	2	721	1
3094	2	720	1
3095	2	719	1
3096	2	718	1
3097	2	717	1
3098	2	716	1
3099	2	715	1
3100	2	714	1
3101	2	713	1
3102	2	712	1
3103	2	711	1
3104	2	710	1
3105	2	709	1
3106	2	708	1
3107	2	707	1
3108	2	706	1
3109	2	705	1
3110	2	704	1
3111	2	703	1
3112	2	702	1
3113	2	701	1
3114	2	700	1
3115	2	699	1
3116	2	698	1
3117	2	697	1
3118	2	696	1
3119	2	695	1
3120	2	694	1
3121	2	693	1
3122	2	692	1
3123	2	691	1
3124	2	690	1
3125	2	689	1
3126	2	688	1
3127	2	687	1
3128	2	686	1
3129	2	685	1
3130	2	684	1
3131	2	683	1
3132	2	682	1
3133	2	681	1
3134	2	680	1
3135	2	679	1
3136	2	678	1
3137	2	677	1
3138	2	676	1
3139	2	675	1
3140	2	674	1
3141	2	673	1
3142	2	672	1
3143	2	671	1
3144	2	670	1
3145	2	669	1
3146	2	668	1
3147	2	667	1
3148	2	666	1
3149	2	665	1
3150	2	664	1
3151	2	663	1
3152	2	662	1
3153	2	661	1
3154	2	660	1
3155	2	659	1
3156	2	658	1
3157	2	657	1
3158	2	656	1
3159	2	655	1
3160	2	654	1
3161	2	653	1
3162	2	652	1
3163	2	651	1
3164	2	650	1
3165	2	649	1
3166	2	648	1
3167	2	647	1
3168	2	646	1
3169	2	645	1
3170	2	644	1
3171	2	643	1
3172	2	642	1
3173	2	641	1
3174	2	640	1
3175	2	639	1
3176	2	638	1
3177	2	637	1
3178	2	636	1
3179	2	635	1
3180	2	634	1
3181	2	633	1
3182	2	632	1
3183	2	631	1
3184	2	630	1
3185	2	629	1
3186	2	628	1
3187	2	627	1
3188	2	626	1
3189	2	625	1
3190	2	624	1
3191	2	623	1
3192	2	622	1
3193	2	621	1
3194	2	620	1
3195	2	619	1
3196	2	618	1
3197	2	617	1
3198	2	616	1
3199	2	615	1
3200	2	614	1
3201	2	613	1
3202	2	612	1
3203	2	611	1
3204	2	610	1
3205	2	609	1
3206	2	608	1
3207	2	607	1
3208	2	606	1
3209	2	605	1
3210	2	604	1
3211	2	603	1
3212	2	602	1
3213	2	601	1
3214	2	600	1
3215	2	599	1
3216	2	598	1
3217	2	597	1
3218	2	596	1
3219	2	595	1
3220	2	594	1
3221	2	593	1
3222	2	592	1
3223	2	591	1
3224	2	590	1
3225	2	589	1
3226	2	588	1
3227	2	587	1
3228	2	586	1
3229	2	585	1
3230	2	584	1
3231	2	583	1
3232	2	582	1
3233	2	581	1
3234	2	580	1
3235	2	579	1
3236	2	578	1
3237	2	577	1
3238	2	576	1
3239	2	575	1
3240	2	574	1
3241	2	573	1
3242	2	572	1
3243	2	571	1
3244	2	570	1
3245	2	569	1
3246	2	568	1
3247	2	567	1
3248	2	566	1
3249	2	565	1
3250	2	564	1
3251	2	563	1
3252	2	562	1
3253	2	561	1
3254	2	560	1
3255	2	559	1
3256	2	558	1
3257	2	557	1
3258	2	556	1
3259	2	555	1
3260	2	554	1
3261	2	553	1
3262	2	552	1
3263	2	551	1
3264	2	550	1
3265	2	549	1
3266	2	548	1
3267	2	547	1
3268	2	546	1
3269	2	545	1
3270	2	544	1
3271	2	543	1
3272	2	542	1
3273	2	541	1
3274	2	540	1
3275	2	539	1
3276	2	538	1
3277	2	537	1
3278	2	536	1
3279	2	535	1
3280	2	534	1
3281	2	533	1
3282	2	532	1
3283	2	531	1
3284	2	530	1
3285	2	529	1
3286	2	528	1
3287	2	527	1
3288	2	526	1
3289	2	525	1
3290	2	524	1
3291	2	523	1
3292	2	522	1
3293	2	521	1
3294	2	520	1
3295	2	519	1
3296	2	518	1
3297	2	517	1
3298	2	516	1
3299	2	515	1
3300	2	514	1
3301	2	513	1
3302	2	512	1
3303	2	511	1
3304	2	510	1
3305	2	509	1
3306	2	508	1
3307	2	507	1
3308	2	506	1
3309	2	505	1
3310	2	504	1
3311	2	503	1
3312	2	502	1
3313	2	501	1
3314	2	500	1
3315	2	499	1
3316	2	498	1
3317	2	497	1
3318	2	496	1
3319	2	495	1
3320	2	494	1
3321	2	493	1
3322	2	492	1
3323	2	491	1
3324	2	490	1
3325	2	489	1
3326	2	488	1
3327	2	487	1
3328	2	486	1
3329	2	485	1
3330	2	484	1
3331	2	483	1
3332	2	482	1
3333	2	481	1
3334	2	480	1
3335	2	479	1
3336	2	478	1
3337	2	477	1
3338	2	476	1
3339	2	475	1
3340	2	474	1
3341	2	473	1
3342	2	472	1
3343	2	471	1
3344	2	470	1
3345	2	469	1
3346	2	468	1
3347	2	467	1
3348	2	466	1
3349	2	465	1
3350	2	464	1
3351	2	463	1
3352	2	462	1
3353	2	461	1
3354	2	460	1
3355	2	459	1
3356	2	458	1
3357	2	457	1
3358	2	456	1
3359	2	455	1
3360	2	454	1
3361	2	453	1
3362	2	452	1
3363	2	451	1
3364	2	450	1
3365	2	449	1
3366	2	448	1
3367	2	447	1
3368	2	446	1
3369	2	445	1
3370	2	444	1
3371	2	443	1
3372	2	442	1
3373	2	441	1
3374	2	440	1
3375	2	439	1
3376	2	438	1
3377	2	437	1
3378	2	436	1
3379	2	435	1
3380	2	434	1
3381	2	433	1
3382	2	432	1
3383	2	431	1
3384	2	430	1
3385	2	429	1
3386	2	428	1
3387	2	427	1
3388	2	426	1
3389	2	425	1
3390	2	424	1
3391	2	423	1
3392	2	422	1
3393	2	421	1
3394	2	420	1
3395	2	419	1
3396	2	418	1
3397	2	417	1
3398	2	416	1
3399	2	415	1
3400	2	414	1
3401	2	413	1
3402	2	412	1
3403	2	411	1
3404	2	410	1
3405	2	409	1
3406	2	408	1
3407	2	407	1
3408	2	406	1
3409	2	405	1
3410	2	404	1
3411	2	403	1
3412	2	402	1
3413	2	401	1
3414	2	400	1
3415	2	399	1
3416	2	398	1
3417	2	397	1
3418	2	396	1
3419	2	395	1
3420	2	394	1
3421	2	393	1
3422	2	392	1
3423	2	391	1
3424	2	390	1
3425	2	389	1
3426	2	388	1
3427	2	387	1
3428	2	386	1
3429	2	385	1
3430	2	384	1
3431	2	383	1
3432	2	382	1
3433	2	381	1
3434	2	380	1
3435	2	379	1
3436	2	378	1
3437	2	377	1
3438	2	376	1
3439	2	375	1
3440	2	374	1
3441	2	373	1
3442	2	372	1
3443	2	371	1
3444	2	370	1
3445	2	369	1
3446	2	368	1
3447	2	367	1
3448	2	366	1
3449	2	365	1
3450	2	364	1
3451	2	363	1
3452	2	362	1
3453	2	361	1
3454	2	360	1
3455	2	359	1
3456	2	358	1
3457	2	357	1
3458	2	356	1
3459	2	355	1
3460	2	354	1
3461	2	353	1
3462	2	352	1
3463	2	351	1
3464	2	350	1
3465	2	349	1
3466	2	348	1
3467	2	347	1
3468	2	346	1
3469	2	345	1
3470	2	344	1
3471	2	343	1
3472	2	342	1
3473	2	341	1
3474	2	340	1
3475	2	339	1
3476	2	338	1
3477	2	337	1
3478	2	336	1
3479	2	335	1
3480	2	334	1
3481	2	333	1
3482	2	332	1
3483	2	331	1
3484	2	330	1
3485	2	329	1
3486	2	328	1
3487	2	327	1
3488	2	326	1
3489	2	325	1
3490	2	324	1
3491	2	323	1
3492	2	322	1
3493	2	321	1
3494	2	320	1
3495	2	319	1
3496	2	318	1
3497	2	317	1
3498	2	316	1
3499	2	315	1
3500	2	314	1
3501	2	313	1
3502	2	312	1
3503	2	311	1
3504	2	310	1
3505	2	309	1
3506	2	308	1
3507	2	307	1
3508	2	306	1
3509	2	305	1
3510	2	304	1
3511	2	303	1
3512	2	302	1
3513	2	301	1
3514	2	300	1
3515	2	299	1
3516	2	298	1
3517	2	297	1
3518	2	296	1
3519	2	295	1
3520	2	294	1
3521	2	293	1
3522	2	292	1
3523	2	291	1
3524	2	290	1
3525	2	289	1
3526	2	288	1
3527	2	287	1
3528	2	286	1
3529	2	285	1
3530	2	284	1
3531	2	283	1
3532	2	282	1
3533	2	281	1
3534	2	280	1
3535	2	279	1
3536	2	278	1
3537	2	277	1
3538	2	276	1
3539	2	275	1
3540	2	274	1
3541	2	273	1
3542	2	272	1
3543	2	271	1
3544	2	270	1
3545	2	269	1
3546	2	268	1
3547	2	267	1
3548	2	266	1
3549	2	265	1
3550	2	264	1
3551	2	263	1
3552	2	262	1
3553	2	261	1
3554	2	260	1
3555	2	259	1
3556	2	258	1
3557	2	257	1
3558	2	256	1
3559	2	255	1
3560	2	254	1
3561	2	253	1
3562	2	252	1
3563	2	251	1
3564	2	250	1
3565	2	249	1
3566	2	248	1
3567	2	247	1
3568	2	246	1
3569	2	245	1
3570	2	244	1
3571	2	243	1
3572	2	242	1
3573	2	241	1
3574	2	240	1
3575	2	239	1
3576	2	238	1
3577	2	237	1
3578	2	236	1
3579	2	235	1
3580	2	234	1
3581	2	233	1
3582	2	232	1
3583	2	231	1
3584	2	230	1
3585	2	229	1
3586	2	228	1
3587	2	227	1
3588	2	226	1
3589	2	225	1
3590	2	224	1
3591	2	223	1
3592	2	222	1
3593	2	221	1
3594	2	220	1
3595	2	219	1
3596	2	218	1
3597	2	217	1
3598	2	216	1
3599	2	215	1
3600	2	214	1
3601	2	213	1
3602	2	212	1
3603	2	211	1
3604	2	210	1
3605	2	209	1
3606	2	208	1
3607	2	207	1
3608	2	206	1
3609	2	205	1
3610	2	204	1
3611	2	203	1
3612	2	202	1
3613	2	201	1
3614	2	200	1
3615	2	199	1
3616	2	198	1
3617	2	197	1
3618	2	196	1
3619	2	195	1
3620	2	194	1
3621	2	193	1
3622	2	192	1
3623	2	191	1
3624	2	190	1
3625	2	189	1
3626	2	188	1
3627	2	187	1
3628	2	186	1
3629	2	185	1
3630	2	184	1
3631	2	183	1
3632	2	182	1
3633	2	181	1
3634	2	180	1
3635	2	179	1
3636	2	178	1
3637	2	177	1
3638	2	176	1
3639	2	175	1
3640	2	174	1
3641	2	173	1
3642	2	172	1
3643	2	171	1
3644	2	170	1
3645	2	169	1
3646	2	168	1
3647	2	167	1
3648	2	166	1
3649	2	165	1
3650	2	164	1
3651	2	163	1
3652	2	162	1
3653	2	161	1
3654	2	160	1
3655	2	159	1
3656	2	158	1
3657	2	157	1
3658	2	156	1
3659	2	155	1
3660	2	154	1
3661	2	153	1
3662	2	152	1
3663	2	151	1
3664	2	150	1
3665	2	149	1
3666	2	148	1
3667	2	147	1
3668	2	146	1
3669	2	145	1
3670	2	144	1
3671	2	143	1
3672	2	142	1
3673	2	141	1
3674	2	140	1
3675	2	139	1
3676	2	138	1
3677	2	137	1
3678	2	136	1
3679	2	135	1
3680	2	134	1
3681	2	133	1
3682	2	132	1
3683	2	131	1
3684	2	130	1
3685	2	129	1
3686	2	128	1
3687	2	127	1
3688	2	126	1
3689	2	125	1
3690	2	124	1
3691	2	123	1
3692	2	122	1
3693	2	121	1
3694	2	120	1
3695	2	119	1
3696	2	118	1
3697	2	117	1
3698	2	116	1
3699	2	115	1
3700	2	114	1
3701	2	113	1
3702	2	112	1
3703	2	111	1
3704	2	110	1
3705	2	109	1
3706	2	108	1
3707	2	107	1
3708	2	106	1
3709	2	105	1
3710	2	104	1
3711	2	103	1
3712	2	102	1
3713	2	101	1
3714	2	100	1
3715	2	99	1
3716	2	98	1
3717	2	97	1
3718	2	96	1
3719	2	95	1
3720	2	94	1
3721	2	93	1
3722	2	92	1
3723	2	91	1
3724	2	90	1
3725	2	89	1
3726	2	88	1
3727	2	87	1
3728	2	86	1
3729	2	85	1
3730	2	84	1
3731	2	83	1
3732	2	82	1
3733	2	81	1
3734	2	80	1
3735	2	79	1
3736	2	78	1
3737	2	77	1
3738	2	76	1
3739	2	75	1
3740	2	74	1
3741	2	73	1
3742	2	72	1
3743	2	71	1
3744	2	70	1
3745	2	69	1
3746	2	68	1
3747	2	67	1
3748	2	66	1
3749	2	65	1
3750	2	64	1
3751	2	63	1
3752	2	62	1
3753	2	61	1
3754	2	60	1
3755	2	59	1
3756	2	58	1
3757	2	57	1
3758	2	56	1
3759	2	55	1
3760	2	54	1
3761	2	53	1
3762	2	52	1
3763	2	51	1
3764	2	50	1
3765	2	49	1
3766	2	48	1
3767	2	47	1
3768	2	46	1
3769	2	45	1
3770	2	44	1
3771	2	43	1
3772	2	42	1
3773	2	41	1
3774	2	40	1
3775	2	39	1
3776	2	38	1
3777	2	37	1
3778	2	36	1
3779	2	35	1
3780	2	34	1
3781	2	33	1
3782	2	32	1
3783	2	31	1
3784	2	30	1
3785	2	29	1
3786	2	28	1
3787	2	27	1
3788	2	26	1
3789	2	25	1
3790	2	24	1
3791	2	23	1
3792	2	22	1
3793	2	21	1
3794	2	20	1
3795	2	19	1
3796	2	18	1
3797	2	17	1
3798	2	16	1
3799	2	15	1
3800	2	14	1
3801	2	13	1
3802	2	12	1
3803	2	11	1
3804	2	10	1
3805	2	9	1
3806	2	8	1
3807	2	7	1
3808	2	6	1
3809	2	5	1
3810	2	4	1
3811	2	3	1
3812	2	2	1
3813	2	1	1
3814	3	104	3
3815	3	103	3
3816	3	102	3
3817	3	101	3
3818	3	100	3
3819	3	99	3
3820	3	98	3
3821	3	97	3
3822	3	96	3
3823	3	95	3
3824	3	94	3
3825	3	93	3
3826	3	92	3
3827	3	91	3
3828	3	90	3
3829	3	89	3
3830	3	88	3
3831	3	87	3
3832	3	86	3
3833	3	85	3
3834	3	84	3
3835	3	83	3
3836	3	82	3
3837	3	81	3
3838	3	80	2
3839	3	79	2
3840	3	78	2
3841	3	77	2
3842	3	76	2
3843	3	75	2
3844	3	74	2
3845	3	73	2
3846	3	72	2
3847	3	71	2
3848	3	70	2
3849	3	69	2
3850	3	68	2
3851	3	67	2
3852	3	66	2
3853	3	65	2
3854	3	64	2
3855	3	63	2
3856	3	62	2
3857	3	61	2
3858	3	60	2
3859	3	59	2
3860	3	58	2
3861	3	57	2
3862	3	56	2
3863	3	55	2
3864	3	54	2
3865	3	53	2
3866	3	52	2
3867	3	51	2
3868	3	50	2
3869	3	49	2
3870	3	48	2
3871	3	47	2
3872	3	46	2
3873	3	45	2
3874	3	44	2
3875	3	43	2
3876	3	42	2
3877	3	41	2
3878	3	40	1
3879	3	39	1
3880	3	38	1
3881	3	37	1
3882	3	36	1
3883	3	35	1
3884	3	34	1
3885	3	33	1
3886	3	32	1
3887	3	31	1
3888	3	30	1
3889	3	29	1
3890	3	28	1
3891	3	27	1
3892	3	26	1
3893	3	25	1
3894	3	24	1
3895	3	23	1
3896	3	22	1
3897	3	21	1
3898	3	20	1
3899	3	19	1
3900	3	18	1
3901	3	17	1
3902	3	16	1
3903	3	15	1
3904	3	14	1
3905	3	13	1
3906	3	12	1
3907	3	11	1
3908	3	10	1
3909	3	9	1
3910	3	8	1
3911	3	7	1
3912	3	6	1
3913	3	5	1
3914	3	4	1
3915	3	3	1
3916	3	2	1
3917	3	1	1
3918	4	140	1
3919	4	139	1
3920	4	138	1
3921	4	137	1
3922	4	136	1
3923	4	135	1
3924	4	134	1
3925	4	133	1
3926	4	132	1
3927	4	131	1
3928	4	130	1
3929	4	129	1
3930	4	128	1
3931	4	127	1
3932	4	126	1
3933	4	125	1
3934	4	124	1
3935	4	123	1
3936	4	122	1
3937	4	121	1
3938	4	120	1
3939	4	119	1
3940	4	118	1
3941	4	117	1
3942	4	116	1
3943	4	115	1
3944	4	114	1
3945	4	113	1
3946	4	112	1
3947	4	111	1
3948	4	110	1
3949	4	109	1
3950	4	108	1
3951	4	107	1
3952	4	106	1
3953	4	105	1
3954	4	104	1
3955	4	103	1
3956	4	102	1
3957	4	101	1
3958	4	100	1
3959	4	99	1
3960	4	98	1
3961	4	97	1
3962	4	96	1
3963	4	95	1
3964	4	94	1
3965	4	93	1
3966	4	92	1
3967	4	91	1
3968	4	90	1
3969	4	89	1
3970	4	88	1
3971	4	87	1
3972	4	86	1
3973	4	85	1
3974	4	84	1
3975	4	83	1
3976	4	82	1
3977	4	81	1
3978	4	80	1
3979	4	79	1
3980	4	78	1
3981	4	77	1
3982	4	76	1
3983	4	75	1
3984	4	74	1
3985	4	73	1
3986	4	72	1
3987	4	71	1
3988	4	70	1
3989	4	69	1
3990	4	68	1
3991	4	67	1
3992	4	66	1
3993	4	65	1
3994	4	64	1
3995	4	63	1
3996	4	62	1
3997	4	61	1
3998	4	60	1
3999	4	59	1
4000	4	58	1
4001	4	57	1
4002	4	56	1
4003	4	55	1
4004	4	54	1
4005	4	53	1
4006	4	52	1
4007	4	51	1
4008	4	50	1
4009	4	49	1
4010	4	48	1
4011	4	47	1
4012	4	46	1
4013	4	45	1
4014	4	44	1
4015	4	43	1
4016	4	42	1
4017	4	41	1
4018	4	40	1
4019	4	39	1
4020	4	38	1
4021	4	37	1
4022	4	36	1
4023	4	35	1
4024	4	34	1
4025	4	33	1
4026	4	32	1
4027	4	31	1
4028	4	30	1
4029	4	29	1
4030	4	28	1
4031	4	27	1
4032	4	26	1
4033	4	25	1
4034	4	24	1
4035	4	23	1
4036	4	22	1
4037	4	21	1
4038	4	20	1
4039	4	19	1
4040	4	18	1
4041	4	17	1
4042	4	16	1
4043	4	15	1
4044	4	14	1
4045	4	13	1
4046	4	12	1
4047	4	11	1
4048	4	10	1
4049	4	9	1
4050	4	8	1
4051	4	7	1
4052	4	6	1
4053	4	5	1
4054	4	4	1
4055	4	3	1
4056	4	2	1
4057	4	1	1
4058	4	0	1
4059	5	129	1
4060	5	128	1
4061	5	127	1
4062	5	126	1
4063	5	125	1
4064	5	124	1
4065	5	123	1
4066	5	122	1
4067	5	121	1
4068	5	120	1
4069	5	119	1
4070	5	118	1
4071	5	117	1
4072	5	116	1
4073	5	115	1
4074	5	114	1
4075	5	113	1
4076	5	112	1
4077	5	111	1
4078	5	110	1
4079	5	109	1
4080	5	108	1
4081	5	107	1
4082	5	106	1
4083	5	105	1
4084	5	104	1
4085	5	103	1
4086	5	102	1
4087	5	101	1
4088	5	100	1
4089	5	99	1
4090	5	98	1
4091	5	97	1
4092	5	96	1
4093	5	95	1
4094	5	94	1
4095	5	93	1
4096	5	92	1
4097	5	91	1
4098	5	90	1
4099	5	89	1
4100	5	88	1
4101	5	87	1
4102	5	86	1
4103	5	85	1
4104	5	84	1
4105	5	83	1
4106	5	82	1
4107	5	81	1
4108	5	80	1
4109	5	79	1
4110	5	78	1
4111	5	77	1
4112	5	76	1
4113	5	75	1
4114	5	74	1
4115	5	73	1
4116	5	72	1
4117	5	71	1
4118	5	70	1
4119	5	69	1
4120	5	68	1
4121	5	67	1
4122	5	66	1
4123	5	65	1
4124	5	64	1
4125	5	63	1
4126	5	62	1
4127	5	61	1
4128	5	60	1
4129	5	59	1
4130	5	58	1
4131	5	57	1
4132	5	56	1
4133	5	55	1
4134	5	54	1
4135	5	53	1
4136	5	52	1
4137	5	51	1
4138	5	50	1
4139	5	49	1
4140	5	48	1
4141	5	47	1
4142	5	46	1
4143	5	45	1
4144	5	44	1
4145	5	43	1
4146	5	42	1
4147	5	41	1
4148	5	40	1
4149	5	39	1
4150	5	38	1
4151	5	37	1
4152	5	36	1
4153	5	35	1
4154	5	34	1
4155	5	33	1
4156	5	32	1
4157	5	31	1
4158	5	30	1
4159	5	29	1
4160	5	28	1
4161	5	27	1
4162	5	26	1
4163	5	25	1
4164	5	24	1
4165	5	23	1
4166	5	22	1
4167	5	21	1
4168	5	20	1
4169	5	19	1
4170	5	18	1
4171	5	17	1
4172	5	16	1
4173	5	15	1
4174	5	14	1
4175	5	13	1
4176	5	12	1
4177	5	11	1
4178	5	10	1
4179	5	9	1
4180	5	8	1
4181	5	7	1
4182	5	6	1
4183	5	5	1
4184	5	4	1
4185	5	3	1
4186	5	2	1
4187	5	1	1
4188	5	0	1
4189	6	165	1
4190	6	164	1
4191	6	163	1
4192	6	162	1
4193	6	161	1
4194	6	160	1
4195	6	159	1
4196	6	158	1
4197	6	157	1
4198	6	156	1
4199	6	155	1
4200	6	154	1
4201	6	153	1
4202	6	152	1
4203	6	151	1
4204	6	150	1
4205	6	149	1
4206	6	148	1
4207	6	147	1
4208	6	146	1
4209	6	145	1
4210	6	144	1
4211	6	143	1
4212	6	142	1
4213	6	141	1
4214	6	140	1
4215	6	139	1
4216	6	138	1
4217	6	137	1
4218	6	136	1
4219	6	135	1
4220	6	134	1
4221	6	133	1
4222	6	132	1
4223	6	131	1
4224	6	130	1
4225	6	129	1
4226	6	128	1
4227	6	127	1
4228	6	126	1
4229	6	125	1
4230	6	124	1
4231	6	123	1
4232	6	122	1
4233	6	121	1
4234	6	120	1
4235	6	119	1
4236	6	118	1
4237	6	117	1
4238	6	116	1
4239	6	115	1
4240	6	114	1
4241	6	113	1
4242	6	112	1
4243	6	111	1
4244	6	110	1
4245	6	109	1
4246	6	108	1
4247	6	107	1
4248	6	106	1
4249	6	105	1
4250	6	104	1
4251	6	103	1
4252	6	102	1
4253	6	101	1
4254	6	100	1
4255	6	99	1
4256	6	98	1
4257	6	97	1
4258	6	96	1
4259	6	95	1
4260	6	94	1
4261	6	93	1
4262	6	92	1
4263	6	91	1
4264	6	90	1
4265	6	89	1
4266	6	88	1
4267	6	87	1
4268	6	86	1
4269	6	85	1
4270	6	84	1
4271	6	83	1
4272	6	82	1
4273	6	81	1
4274	6	80	1
4275	6	79	1
4276	6	78	1
4277	6	77	1
4278	6	76	1
4279	6	75	1
4280	6	74	1
4281	6	73	1
4282	6	72	1
4283	6	71	1
4284	6	70	1
4285	6	69	1
4286	6	68	1
4287	6	67	1
4288	6	66	1
4289	6	65	1
4290	6	64	1
4291	6	63	1
4292	6	62	1
4293	6	61	1
4294	6	60	1
4295	6	59	1
4296	6	58	1
4297	6	57	1
4298	6	56	1
4299	6	55	1
4300	6	54	1
4301	6	53	1
4302	6	52	1
4303	6	51	1
4304	6	50	1
4305	6	49	1
4306	6	48	1
4307	6	47	1
4308	6	46	1
4309	6	45	1
4310	6	44	1
4311	6	43	1
4312	6	42	1
4313	6	41	1
4314	6	40	1
4315	6	39	1
4316	6	38	1
4317	6	37	1
4318	6	36	1
4319	6	35	1
4320	6	34	1
4321	6	33	1
4322	6	32	1
4323	6	31	1
4324	6	30	1
4325	6	29	1
4326	6	28	1
4327	6	27	1
4328	6	26	1
4329	6	25	1
4330	6	24	1
4331	6	23	1
4332	6	22	1
4333	6	21	1
4334	6	20	1
4335	6	19	1
4336	6	18	1
4337	6	17	1
4338	6	16	1
4339	6	15	1
4340	6	14	1
4341	6	13	1
4342	6	12	1
4343	6	11	1
4344	6	10	1
4345	6	9	1
4346	6	8	1
4347	6	7	1
4348	6	6	1
4349	6	5	1
4350	6	4	1
4351	6	3	1
4352	6	2	1
4353	6	1	1
4354	6	0	1
4355	7	81	2
4356	7	80	2
4357	7	79	2
4358	7	78	2
4359	7	77	2
4360	7	76	2
4361	7	75	2
4362	7	74	2
4363	7	73	2
4364	7	72	2
4365	7	71	2
4366	7	70	2
4367	7	69	2
4368	7	68	2
4369	7	67	2
4370	7	66	2
4371	7	65	2
4372	7	64	2
4373	7	63	2
4374	7	62	2
4375	7	61	2
4376	7	60	2
4377	7	59	2
4378	7	58	2
4379	7	57	2
4380	7	56	2
4381	7	55	2
4382	7	54	2
4383	7	53	2
4384	7	52	2
4385	7	51	2
4386	7	50	2
4387	7	49	2
4388	7	48	2
4389	7	47	2
4390	7	46	2
4391	7	45	2
4392	7	44	2
4393	7	43	2
4394	7	42	2
4395	7	41	2
4396	7	40	1
4397	7	39	1
4398	7	38	1
4399	7	37	1
4400	7	36	1
4401	7	35	1
4402	7	34	1
4403	7	33	1
4404	7	32	1
4405	7	31	1
4406	7	30	1
4407	7	29	1
4408	7	28	1
4409	7	27	1
4410	7	26	1
4411	7	25	1
4412	7	24	1
4413	7	23	1
4414	7	22	1
4415	7	21	1
4416	7	20	1
4417	7	19	1
4418	7	18	1
4419	7	17	1
4420	7	16	1
4421	7	15	1
4422	7	14	1
4423	7	13	1
4424	7	12	1
4425	7	11	1
4426	7	10	1
4427	7	9	1
4428	7	8	1
4429	7	7	1
4430	7	6	1
4431	7	5	1
4432	7	4	1
4433	7	3	1
4434	7	2	1
4435	7	1	1
4436	8	181	2
4437	8	180	2
4438	8	179	2
4439	8	178	2
4440	8	177	2
4441	8	176	2
4442	8	175	2
4443	8	174	2
4444	8	173	2
4445	8	172	2
4446	8	171	2
4447	8	170	2
4448	8	169	2
4449	8	168	2
4450	8	167	2
4451	8	166	2
4452	8	165	2
4453	8	164	2
4454	8	163	2
4455	8	162	2
4456	8	161	2
4457	8	160	2
4458	8	159	2
4459	8	158	2
4460	8	157	2
4461	8	156	2
4462	8	155	2
4463	8	154	2
4464	8	153	2
4465	8	152	2
4466	8	151	2
4467	8	150	2
4468	8	149	2
4469	8	148	2
4470	8	147	2
4471	8	146	2
4472	8	145	2
4473	8	144	2
4474	8	143	2
4475	8	142	1
4476	8	141	1
4477	8	140	1
4478	8	139	1
4479	8	138	1
4480	8	137	1
4481	8	136	1
4482	8	135	1
4483	8	134	1
4484	8	133	1
4485	8	132	1
4486	8	131	1
4487	8	130	1
4488	8	129	1
4489	8	128	1
4490	8	127	1
4491	8	126	1
4492	8	125	1
4493	8	124	1
4494	8	123	1
4495	8	122	1
4496	8	121	1
4497	8	120	1
4498	8	119	1
4499	8	118	1
4500	8	117	1
4501	8	116	1
4502	8	115	1
4503	8	114	1
4504	8	113	1
4505	8	112	1
4506	8	111	1
4507	8	110	1
4508	8	109	1
4509	8	108	1
4510	8	107	1
4511	8	106	1
4512	8	105	1
4513	8	104	1
4514	8	103	1
4515	8	102	1
4516	8	101	1
4517	8	100	1
4518	8	99	1
4519	8	98	1
4520	8	97	1
4521	8	96	1
4522	8	95	1
4523	8	94	1
4524	8	93	1
4525	8	92	1
4526	8	91	1
4527	8	90	1
4528	8	89	1
4529	8	88	1
4530	8	87	1
4531	8	86	1
4532	8	85	1
4533	8	84	1
4534	8	83	1
4535	8	82	1
4536	8	81	1
4537	8	80	1
4538	8	79	1
4539	8	78	1
4540	8	77	1
4541	8	76	1
4542	8	75	1
4543	8	74	1
4544	8	73	1
4545	8	72	1
4546	8	71	1
4547	8	70	1
4548	8	69	1
4549	8	68	1
4550	8	67	1
4551	8	66	1
4552	8	65	1
4553	8	64	1
4554	8	63	1
4555	8	62	1
4556	8	61	1
4557	8	60	1
4558	8	59	1
4559	8	58	1
4560	8	57	1
4561	8	56	1
4562	8	55	1
4563	8	54	1
4564	8	53	1
4565	8	52	1
4566	8	51	1
4567	8	50	1
4568	8	49	1
4569	8	48	1
4570	8	47	1
4571	8	46	1
4572	8	45	1
4573	8	44	1
4574	8	43	1
4575	8	42	1
4576	8	41	1
4577	8	40	1
4578	8	39	1
4579	8	38	1
4580	8	37	1
4581	8	36	1
4582	8	35	1
4583	8	34	1
4584	8	33	1
4585	8	32	1
4586	8	31	1
4587	8	30	1
4588	8	29	1
4589	8	28	1
4590	8	27	1
4591	8	26	1
4592	8	25	1
4593	8	24	1
4594	8	23	1
4595	8	22	1
4596	8	21	1
4597	8	20	1
4598	8	19	1
4599	8	18	1
4600	8	17	1
4601	8	16	1
4602	8	15	1
4603	8	14	1
4604	8	13	1
4605	8	12	1
4606	8	11	1
4607	8	10	1
4608	8	9	1
4609	8	8	1
4610	8	7	1
4611	8	6	1
4612	8	5	1
4613	8	4	1
4614	8	3	1
4615	8	2	1
4616	8	1	1
4617	9	115	2
4618	9	114	2
4619	9	113	2
4620	9	112	2
4621	9	111	2
4622	9	110	2
4623	9	109	2
4624	9	108	2
4625	9	107	2
4626	9	106	2
4627	9	105	2
4628	9	104	1
4629	9	103	1
4630	9	102	1
4631	9	101	1
4632	9	100	1
4633	9	99	1
4634	9	98	1
4635	9	97	1
4636	9	96	1
4637	9	95	1
4638	9	94	1
4639	9	93	1
4640	9	92	1
4641	9	91	1
4642	9	90	1
4643	9	89	1
4644	9	88	1
4645	9	87	1
4646	9	86	1
4647	9	85	1
4648	9	84	1
4649	9	83	1
4650	9	82	1
4651	9	81	1
4652	9	80	1
4653	9	79	1
4654	9	78	1
4655	9	77	1
4656	9	76	1
4657	9	75	1
4658	9	74	1
4659	9	73	1
4660	9	72	1
4661	9	71	1
4662	9	70	1
4663	9	69	1
4664	9	68	1
4665	9	67	1
4666	9	66	1
4667	9	65	1
4668	9	64	1
4669	9	63	1
4670	9	62	1
4671	9	61	1
4672	9	60	1
4673	9	59	1
4674	9	58	1
4675	9	57	1
4676	9	56	1
4677	9	55	1
4678	9	54	1
4679	9	53	1
4680	9	52	1
4681	9	51	1
4682	9	50	1
4683	9	49	1
4684	9	48	1
4685	9	47	1
4686	9	46	1
4687	9	45	1
4688	9	44	1
4689	9	43	1
4690	9	42	1
4691	9	41	1
4692	9	40	1
4693	9	39	1
4694	9	38	1
4695	9	37	1
4696	9	36	1
4697	9	35	1
4698	9	34	1
4699	9	33	1
4700	9	32	1
4701	9	31	1
4702	9	30	1
4703	9	29	1
4704	9	28	1
4705	9	27	1
4706	9	26	1
4707	9	25	1
4708	9	24	1
4709	9	23	1
4710	9	22	1
4711	9	21	1
4712	9	20	1
4713	9	19	1
4714	9	18	1
4715	9	17	1
4716	9	16	1
4717	9	15	1
4718	9	14	1
4719	9	13	1
4720	9	12	1
4721	9	11	1
4722	9	10	1
4723	9	9	1
4724	9	8	1
4725	9	7	1
4726	9	6	1
4727	9	5	1
4728	9	4	1
4729	9	3	1
4730	9	2	1
4731	9	1	1
4732	10	109	3
4733	10	108	3
4734	10	107	3
4735	10	106	3
4736	10	105	3
4737	10	104	3
4738	10	103	3
4739	10	102	3
4740	10	101	3
4741	10	100	3
4742	10	99	3
4743	10	98	3
4744	10	97	3
4745	10	96	3
4746	10	95	3
4747	10	94	3
4748	10	93	3
4749	10	92	2
4750	10	91	2
4751	10	90	2
4752	10	89	2
4753	10	88	2
4754	10	87	2
4755	10	86	2
4756	10	85	2
4757	10	84	2
4758	10	83	2
4759	10	82	2
4760	10	81	2
4761	10	80	2
4762	10	79	2
4763	10	78	2
4764	10	77	2
4765	10	76	2
4766	10	75	2
4767	10	74	2
4768	10	73	2
4769	10	72	2
4770	10	71	2
4771	10	70	2
4772	10	69	2
4773	10	68	2
4774	10	67	2
4775	10	66	2
4776	10	65	2
4777	10	64	2
4778	10	63	2
4779	10	62	2
4780	10	61	2
4781	10	60	2
4782	10	59	2
4783	10	58	2
4784	10	57	2
4785	10	56	2
4786	10	55	2
4787	10	54	2
4788	10	53	2
4789	10	52	1
4790	10	51	1
4791	10	50	1
4792	10	49	1
4793	10	48	1
4794	10	47	1
4795	10	46	1
4796	10	45	1
4797	10	44	1
4798	10	43	1
4799	10	42	1
4800	10	41	1
4801	10	40	1
4802	10	39	1
4803	10	38	1
4804	10	37	1
4805	10	36	1
4806	10	35	1
4807	10	34	1
4808	10	33	1
4809	10	32	1
4810	10	31	1
4811	10	30	1
4812	10	29	1
4813	10	28	1
4814	10	27	1
4815	10	26	1
4816	10	25	1
4817	10	24	1
4818	10	23	1
4819	10	22	1
4820	10	21	1
4821	10	20	1
4822	10	19	1
4823	10	18	1
4824	10	17	1
4825	10	16	1
4826	10	15	1
4827	10	14	1
4828	10	13	1
4829	10	12	1
4830	10	11	1
4831	10	10	1
4832	10	9	1
4833	10	8	1
4834	10	7	1
4835	10	6	1
4836	10	5	1
4837	10	4	1
4838	10	3	1
4839	10	2	1
4840	10	1	1
4841	10	0	1
4842	11	110	3
4843	11	109	3
4844	11	108	3
4845	11	107	3
4846	11	106	3
4847	11	105	3
4848	11	104	3
4849	11	103	3
4850	11	102	3
4851	11	101	3
4852	11	100	3
4853	11	99	3
4854	11	98	3
4855	11	97	3
4856	11	96	3
4857	11	95	3
4858	11	94	3
4859	11	93	3
4860	11	92	3
4861	11	91	3
4862	11	90	3
4863	11	89	3
4864	11	88	3
4865	11	87	3
4866	11	86	3
4867	11	85	3
4868	11	84	3
4869	11	83	3
4870	11	82	3
4871	11	81	3
4872	11	80	3
4873	11	79	3
4874	11	78	3
4875	11	77	3
4876	11	76	3
4877	11	75	3
4878	11	74	3
4879	11	73	3
4880	11	72	3
4881	11	71	3
4882	11	70	3
4883	11	69	3
4884	11	68	3
4885	11	67	3
4886	11	66	3
4887	11	65	2
4888	11	64	2
4889	11	63	2
4890	11	62	2
4891	11	61	2
4892	11	60	2
4893	11	59	1
4894	11	58	1
4895	11	57	1
4896	11	56	1
4897	11	55	1
4898	11	54	1
4899	11	53	1
4900	11	52	1
4901	11	51	1
4902	11	50	1
4903	11	49	1
4904	11	48	1
4905	11	47	1
4906	11	46	1
4907	11	45	1
4908	11	44	1
4909	11	43	1
4910	11	42	1
4911	11	41	1
4912	11	40	1
4913	11	39	1
4914	11	38	1
4915	11	37	1
4916	11	36	1
4917	11	35	1
4918	11	34	1
4919	11	33	1
4920	11	32	1
4921	11	31	1
4922	11	30	1
4923	11	29	1
4924	11	28	1
4925	11	27	1
4926	11	26	1
4927	11	25	1
4928	11	24	1
4929	11	23	1
4930	11	22	1
4931	11	21	1
4932	11	20	1
4933	11	19	1
4934	11	18	1
4935	11	17	1
4936	11	16	1
4937	11	15	1
4938	11	14	1
4939	11	13	1
4940	11	12	1
4941	11	11	1
4942	11	10	1
4943	11	9	1
4944	11	8	1
4945	11	7	1
4946	11	6	1
4947	11	5	1
4948	11	4	1
4949	11	3	1
4950	11	2	1
4951	11	1	1
4952	12	101	3
4953	12	100	3
4954	12	99	3
4955	12	98	3
4956	12	97	3
4957	12	96	3
4958	12	95	3
4959	12	94	3
4960	12	93	3
4961	12	92	3
4962	12	91	3
4963	12	90	3
4964	12	89	3
4965	12	88	3
4966	12	87	3
4967	12	86	3
4968	12	85	3
4969	12	84	3
4970	12	83	3
4971	12	82	3
4972	12	81	3
4973	12	80	3
4974	12	79	3
4975	12	78	3
4976	12	77	3
4977	12	76	3
4978	12	75	3
4979	12	74	3
4980	12	73	3
4981	12	72	2
4982	12	71	2
4983	12	70	2
4984	12	69	2
4985	12	68	2
4986	12	67	2
4987	12	66	2
4988	12	65	2
4989	12	64	2
4990	12	63	2
4991	12	62	2
4992	12	61	2
4993	12	60	2
4994	12	59	2
4995	12	58	2
4996	12	57	2
4997	12	56	2
4998	12	55	2
4999	12	54	2
5000	12	53	2
5001	12	52	1
5002	12	51	1
5003	12	50	1
5004	12	49	1
5005	12	48	1
5006	12	47	1
5007	12	46	1
5008	12	45	1
5009	12	44	1
5010	12	43	1
5011	12	42	1
5012	12	41	1
5013	12	40	1
5014	12	39	1
5015	12	38	1
5016	12	37	1
5017	12	36	1
5018	12	35	1
5019	12	34	1
5020	12	33	1
5021	12	32	1
5022	12	31	1
5023	12	30	1
5024	12	29	1
5025	12	28	1
5026	12	27	1
5027	12	26	1
5028	12	25	1
5029	12	24	1
5030	12	23	1
5031	12	22	1
5032	12	21	1
5033	12	20	1
5034	12	19	1
5035	12	18	1
5036	12	17	1
5037	12	16	1
5038	12	15	1
5039	12	14	1
5040	12	13	1
5041	12	12	1
5042	12	11	1
5043	12	10	1
5044	12	9	1
5045	12	8	1
5046	12	7	1
5047	12	6	1
5048	12	5	1
5049	12	4	1
5050	12	3	1
5051	12	2	1
5052	12	1	1
5053	13	64	2
5054	13	63	2
5055	13	62	2
5056	13	61	2
5057	13	60	2
5058	13	59	2
5059	13	58	2
5060	13	57	2
5061	13	56	2
5062	13	55	1
5063	13	54	1
5064	13	53	1
5065	13	52	1
5066	13	51	1
5067	13	50	1
5068	13	49	1
5069	13	48	1
5070	13	47	1
5071	13	46	1
5072	13	45	1
5073	13	44	1
5074	13	43	1
5075	13	42	1
5076	13	41	1
5077	13	40	1
5078	13	39	1
5079	13	38	1
5080	13	37	1
5081	13	36	1
5082	13	35	1
5083	13	34	1
5084	13	33	1
5085	13	32	1
5086	13	31	1
5087	13	30	1
5088	13	29	1
5089	13	28	1
5090	13	27	1
5091	13	26	1
5092	13	25	1
5093	13	24	1
5094	13	23	1
5095	13	22	1
5096	13	21	1
5097	13	20	1
5098	13	19	1
5099	13	18	1
5100	13	17	1
5101	13	16	1
5102	13	15	1
5103	13	14	1
5104	13	13	1
5105	13	12	1
5106	13	11	1
5107	13	10	1
5108	13	9	1
5109	13	8	1
5110	13	7	1
5111	13	6	1
5112	13	5	1
5113	13	4	1
5114	13	3	1
5115	13	2	1
5116	13	1	1
5117	13	0	1
5118	14	172	4
5119	14	171	4
5120	14	170	4
5121	14	169	4
5122	14	168	4
5123	14	167	4
5124	14	166	4
5125	14	165	4
5126	14	164	4
5127	14	163	4
5128	14	162	4
5129	14	161	4
5130	14	160	4
5131	14	159	4
5132	14	158	4
5133	14	157	4
5134	14	156	4
5135	14	155	4
5136	14	154	4
5137	14	153	4
5138	14	152	4
5139	14	151	4
5140	14	150	4
5141	14	149	4
5142	14	148	4
5143	14	147	4
5144	14	146	4
5145	14	145	4
5146	14	144	4
5147	14	143	4
5148	14	142	4
5149	14	141	4
5150	14	140	4
5151	14	139	4
5152	14	138	4
5153	14	137	4
5154	14	136	4
5155	14	135	4
5156	14	134	4
5157	14	133	4
5158	14	132	4
5159	14	131	4
5160	14	130	4
5161	14	129	4
5162	14	128	4
5163	14	127	4
5164	14	126	4
5165	14	125	4
5166	14	124	4
5167	14	123	4
5168	14	122	4
5169	14	121	4
5170	14	120	4
5171	14	119	4
5172	14	118	4
5173	14	117	4
5174	14	116	4
5175	14	115	4
5176	14	114	4
5177	14	113	4
5178	14	112	4
5179	14	111	4
5180	14	110	4
5181	14	109	4
5182	14	108	4
5183	14	107	4
5184	14	106	4
5185	14	105	4
5186	14	104	4
5187	14	103	4
5188	14	102	4
5189	14	101	4
5190	14	100	3
5191	14	99	3
5192	14	98	3
5193	14	97	3
5194	14	96	3
5195	14	95	3
5196	14	94	3
5197	14	93	3
5198	14	92	2
5199	14	91	2
5200	14	90	2
5201	14	89	2
5202	14	88	2
5203	14	87	2
5204	14	86	2
5205	14	85	2
5206	14	84	2
5207	14	83	2
5208	14	82	2
5209	14	81	2
5210	14	80	2
5211	14	79	2
5212	14	78	2
5213	14	77	2
5214	14	76	2
5215	14	75	2
5216	14	74	2
5217	14	73	2
5218	14	72	2
5219	14	71	2
5220	14	70	2
5221	14	69	2
5222	14	68	2
5223	14	67	2
5224	14	66	2
5225	14	65	2
5226	14	64	2
5227	14	63	2
5228	14	62	2
5229	14	61	2
5230	14	60	2
5231	14	59	2
5232	14	58	2
5233	14	57	2
5234	14	56	2
5235	14	55	2
5236	14	54	2
5237	14	53	2
5238	14	52	1
5239	14	51	1
5240	14	50	1
5241	14	49	1
5242	14	48	1
5243	14	47	1
5244	14	46	1
5245	14	45	1
5246	14	44	1
5247	14	43	1
5248	14	42	1
5249	14	41	1
5250	14	40	1
5251	14	39	1
5252	14	38	1
5253	14	37	1
5254	14	36	1
5255	14	35	1
5256	14	34	1
5257	14	33	1
5258	14	32	1
5259	14	31	1
5260	14	30	1
5261	14	29	1
5262	14	28	1
5263	14	27	1
5264	14	26	1
5265	14	25	1
5266	14	24	1
5267	14	23	1
5268	14	22	1
5269	14	21	1
5270	14	20	1
5271	14	19	1
5272	14	18	1
5273	14	17	1
5274	14	16	1
5275	14	15	1
5276	14	14	1
5277	14	13	1
5278	14	12	1
5279	14	11	1
5280	14	10	1
5281	14	9	1
5282	14	8	1
5283	14	7	1
5284	14	6	1
5285	14	5	1
5286	14	4	1
5287	14	3	1
5288	14	2	1
5289	14	1	1
5290	15	99	1
5291	15	98	1
5292	15	97	1
5293	15	96	1
5294	15	95	1
5295	15	94	1
5296	15	93	1
5297	15	92	1
5298	15	91	1
5299	15	90	1
5300	15	89	1
5301	15	88	1
5302	15	87	1
5303	15	86	1
5304	15	85	1
5305	15	84	1
5306	15	83	1
5307	15	82	1
5308	15	81	1
5309	15	80	1
5310	15	79	1
5311	15	78	1
5312	15	77	1
5313	15	76	1
5314	15	75	1
5315	15	74	1
5316	15	73	1
5317	15	72	1
5318	15	71	1
5319	15	70	1
5320	15	69	1
5321	15	68	1
5322	15	67	1
5323	15	66	1
5324	15	65	1
5325	15	64	1
5326	15	63	1
5327	15	62	1
5328	15	61	1
5329	15	60	1
5330	15	59	1
5331	15	58	1
5332	15	57	1
5333	15	56	1
5334	15	55	1
5335	15	54	1
5336	15	53	1
5337	15	52	1
5338	15	51	1
5339	15	50	1
5340	15	49	1
5341	15	48	1
5342	15	47	1
5343	15	46	1
5344	15	45	1
5345	15	44	1
5346	15	43	1
5347	15	42	1
5348	15	41	1
5349	15	40	1
5350	15	39	1
5351	15	38	1
5352	15	37	1
5353	15	36	1
5354	15	35	1
5355	15	34	1
5356	15	33	1
5357	15	32	1
5358	15	31	1
5359	15	30	1
5360	15	29	1
5361	15	28	1
5362	15	27	1
5363	15	26	1
5364	15	25	1
5365	15	24	1
5366	15	23	1
5367	15	22	1
5368	15	21	1
5369	15	20	1
5370	15	19	1
5371	15	18	1
5372	15	17	1
5373	15	16	1
5374	15	15	1
5375	15	14	1
5376	15	13	1
5377	15	12	1
5378	15	11	1
5379	15	10	1
5380	15	9	1
5381	15	8	1
5382	15	7	1
5383	15	6	1
5384	15	5	1
5385	15	4	1
5386	15	3	1
5387	15	2	1
5388	15	1	1
5389	16	77	2
5390	16	76	2
5391	16	75	2
5392	16	74	2
5393	16	73	2
5394	16	72	2
5395	16	71	2
5396	16	70	2
5397	16	69	2
5398	16	68	2
5399	16	67	2
5400	16	66	2
5401	16	65	2
5402	16	64	2
5403	16	63	2
5404	16	62	2
5405	16	61	2
5406	16	60	2
5407	16	59	2
5408	16	58	2
5409	16	57	2
5410	16	56	2
5411	16	55	2
5412	16	54	2
5413	16	53	2
5414	16	52	2
5415	16	51	2
5416	16	50	1
5417	16	49	1
5418	16	48	1
5419	16	47	1
5420	16	46	1
5421	16	45	1
5422	16	44	1
5423	16	43	1
5424	16	42	1
5425	16	41	1
5426	16	40	1
5427	16	39	1
5428	16	38	1
5429	16	37	1
5430	16	36	1
5431	16	35	1
5432	16	34	1
5433	16	33	1
5434	16	32	1
5435	16	31	1
5436	16	30	1
5437	16	29	1
5438	16	28	1
5439	16	27	1
5440	16	26	1
5441	16	25	1
5442	16	24	1
5443	16	23	1
5444	16	22	1
5445	16	21	1
5446	16	20	1
5447	16	19	1
5448	16	18	1
5449	16	17	1
5450	16	16	1
5451	16	15	1
5452	16	14	1
5453	16	13	1
5454	16	12	1
5455	16	11	1
5456	16	10	1
5457	16	9	1
5458	16	8	1
5459	16	7	1
5460	16	6	1
5461	16	5	1
5462	16	4	1
5463	16	3	1
5464	16	2	1
5465	16	1	1
5466	17	171	2
5467	17	170	2
5468	17	169	2
5469	17	168	2
5470	17	167	2
5471	17	166	2
5472	17	165	2
5473	17	164	2
5474	17	163	2
5475	17	162	2
5476	17	161	2
5477	17	160	2
5478	17	159	2
5479	17	158	2
5480	17	157	2
5481	17	156	2
5482	17	155	2
5483	17	154	2
5484	17	153	2
5485	17	152	2
5486	17	151	2
5487	17	150	2
5488	17	149	2
5489	17	148	2
5490	17	147	2
5491	17	146	2
5492	17	145	2
5493	17	144	2
5494	17	143	2
5495	17	142	2
5496	17	141	2
5497	17	140	2
5498	17	139	2
5499	17	138	2
5500	17	137	2
5501	17	136	2
5502	17	135	2
5503	17	134	2
5504	17	133	2
5505	17	132	2
5506	17	131	2
5507	17	130	1
5508	17	129	1
5509	17	128	1
5510	17	127	1
5511	17	126	1
5512	17	125	1
5513	17	124	1
5514	17	123	1
5515	17	122	1
5516	17	121	1
5517	17	120	1
5518	17	119	1
5519	17	118	1
5520	17	117	1
5521	17	116	1
5522	17	115	1
5523	17	114	1
5524	17	113	1
5525	17	112	1
5526	17	111	1
5527	17	110	1
5528	17	109	1
5529	17	108	1
5530	17	107	1
5531	17	106	1
5532	17	105	1
5533	17	104	1
5534	17	103	1
5535	17	102	1
5536	17	101	1
5537	17	100	1
5538	17	99	1
5539	17	98	1
5540	17	97	1
5541	17	96	1
5542	17	95	1
5543	17	94	1
5544	17	93	1
5545	17	92	1
5546	17	91	1
5547	17	90	1
5548	17	89	1
5549	17	88	1
5550	17	87	1
5551	17	86	1
5552	17	85	1
5553	17	84	1
5554	17	83	1
5555	17	82	1
5556	17	81	1
5557	17	80	1
5558	17	79	1
5559	17	78	1
5560	17	77	1
5561	17	76	1
5562	17	75	1
5563	17	74	1
5564	17	73	1
5565	17	72	1
5566	17	71	1
5567	17	70	1
5568	17	69	1
5569	17	68	1
5570	17	67	1
5571	17	66	1
5572	17	65	1
5573	17	64	1
5574	17	63	1
5575	17	62	1
5576	17	61	1
5577	17	60	1
5578	17	59	1
5579	17	58	1
5580	17	57	1
5581	17	56	1
5582	17	55	1
5583	17	54	1
5584	17	53	1
5585	17	52	1
5586	17	51	1
5587	17	50	1
5588	17	49	1
5589	17	48	1
5590	17	47	1
5591	17	46	1
5592	17	45	1
5593	17	44	1
5594	17	43	1
5595	17	42	1
5596	17	41	1
5597	17	40	1
5598	17	39	1
5599	17	38	1
5600	17	37	1
5601	17	36	1
5602	17	35	1
5603	17	34	1
5604	17	33	1
5605	17	32	1
5606	17	31	1
5607	17	30	1
5608	17	29	1
5609	17	28	1
5610	17	27	1
5611	17	26	1
5612	17	25	1
5613	17	24	1
5614	17	23	1
5615	17	22	1
5616	17	21	1
5617	17	20	1
5618	17	19	1
5619	17	18	1
5620	17	17	1
5621	17	16	1
5622	17	15	1
5623	17	14	1
5624	17	13	1
5625	17	12	1
5626	17	11	1
5627	17	10	1
5628	17	9	1
5629	17	8	1
5630	17	7	1
5631	17	6	1
5632	17	5	1
5633	17	4	1
5634	17	3	1
5635	17	2	1
5636	17	1	1
5637	18	263	4
5638	18	262	4
5639	18	261	4
5640	18	260	4
5641	18	259	4
5642	18	258	4
5643	18	257	4
5644	18	256	4
5645	18	255	4
5646	18	254	4
5647	18	253	4
5648	18	252	4
5649	18	251	4
5650	18	250	4
5651	18	249	4
5652	18	248	4
5653	18	247	4
5654	18	246	4
5655	18	245	4
5656	18	244	4
5657	18	243	4
5658	18	242	4
5659	18	241	4
5660	18	240	4
5661	18	239	4
5662	18	238	4
5663	18	237	4
5664	18	236	4
5665	18	235	4
5666	18	234	4
5667	18	233	4
5668	18	232	4
5669	18	231	4
5670	18	230	4
5671	18	229	4
5672	18	228	4
5673	18	227	4
5674	18	226	4
5675	18	225	4
5676	18	224	4
5677	18	223	4
5678	18	222	4
5679	18	221	4
5680	18	220	4
5681	18	219	4
5682	18	218	4
5683	18	217	4
5684	18	216	4
5685	18	215	4
5686	18	214	4
5687	18	213	4
5688	18	212	4
5689	18	211	4
5690	18	210	4
5691	18	209	4
5692	18	208	4
5693	18	207	4
5694	18	206	4
5695	18	205	4
5696	18	204	4
5697	18	203	4
5698	18	202	4
5699	18	201	4
5700	18	200	3
5701	18	199	3
5702	18	198	3
5703	18	197	3
5704	18	196	3
5705	18	195	3
5706	18	194	3
5707	18	193	3
5708	18	192	3
5709	18	191	3
5710	18	190	3
5711	18	189	3
5712	18	188	3
5713	18	187	3
5714	18	186	3
5715	18	185	3
5716	18	184	3
5717	18	183	3
5718	18	182	3
5719	18	181	3
5720	18	180	3
5721	18	179	3
5722	18	178	3
5723	18	177	3
5724	18	176	3
5725	18	175	3
5726	18	174	3
5727	18	173	3
5728	18	172	3
5729	18	171	3
5730	18	170	3
5731	18	169	3
5732	18	168	3
5733	18	167	3
5734	18	166	3
5735	18	165	3
5736	18	164	3
5737	18	163	3
5738	18	162	3
5739	18	161	3
5740	18	160	3
5741	18	159	3
5742	18	158	3
5743	18	157	3
5744	18	156	3
5745	18	155	3
5746	18	154	3
5747	18	153	3
5748	18	152	3
5749	18	151	3
5750	18	150	3
5751	18	149	3
5752	18	148	3
5753	18	147	3
5754	18	146	3
5755	18	145	3
5756	18	144	3
5757	18	143	3
5758	18	142	3
5759	18	141	2
5760	18	140	2
5761	18	139	2
5762	18	138	2
5763	18	137	2
5764	18	136	2
5765	18	135	2
5766	18	134	2
5767	18	133	2
5768	18	132	2
5769	18	131	2
5770	18	130	2
5771	18	129	2
5772	18	128	2
5773	18	127	2
5774	18	126	2
5775	18	125	2
5776	18	124	2
5777	18	123	2
5778	18	122	2
5779	18	121	2
5780	18	120	2
5781	18	119	2
5782	18	118	2
5783	18	117	2
5784	18	116	2
5785	18	115	2
5786	18	114	2
5787	18	113	2
5788	18	112	2
5789	18	111	2
5790	18	110	2
5791	18	109	2
5792	18	108	2
5793	18	107	2
5794	18	106	2
5795	18	105	2
5796	18	104	2
5797	18	103	2
5798	18	102	2
5799	18	101	2
5800	18	100	2
5801	18	99	2
5802	18	98	2
5803	18	97	2
5804	18	96	2
5805	18	95	2
5806	18	94	2
5807	18	93	2
5808	18	92	2
5809	18	91	2
5810	18	90	2
5811	18	89	2
5812	18	88	2
5813	18	87	2
5814	18	86	2
5815	18	85	2
5816	18	84	2
5817	18	83	2
5818	18	82	2
5819	18	81	2
5820	18	80	2
5821	18	79	2
5822	18	78	2
5823	18	77	2
5824	18	76	2
5825	18	75	2
5826	18	74	2
5827	18	73	2
5828	18	72	2
5829	18	71	2
5830	18	70	2
5831	18	69	2
5832	18	68	2
5833	18	67	2
5834	18	66	1
5835	18	65	1
5836	18	64	1
5837	18	63	1
5838	18	62	1
5839	18	61	1
5840	18	60	1
5841	18	59	1
5842	18	58	1
5843	18	57	1
5844	18	56	1
5845	18	55	1
5846	18	54	1
5847	18	53	1
5848	18	52	1
5849	18	51	1
5850	18	50	1
5851	18	49	1
5852	18	48	1
5853	18	47	1
5854	18	46	1
5855	18	45	1
5856	18	44	1
5857	18	43	1
5858	18	42	1
5859	18	41	1
5860	18	40	1
5861	18	39	1
5862	18	38	1
5863	18	37	1
5864	18	36	1
5865	18	35	1
5866	18	34	1
5867	18	33	1
5868	18	32	1
5869	18	31	1
5870	18	30	1
5871	18	29	1
5872	18	28	1
5873	18	27	1
5874	18	26	1
5875	18	25	1
5876	18	24	1
5877	18	23	1
5878	18	22	1
5879	18	21	1
5880	18	20	1
5881	18	19	1
5882	18	18	1
5883	18	17	1
5884	18	16	1
5885	18	15	1
5886	18	14	1
5887	18	13	1
5888	18	12	1
5889	18	11	1
5890	18	10	1
5891	18	9	1
5892	18	8	1
5893	18	7	1
5894	18	6	1
5895	18	5	1
5896	18	4	1
5897	18	3	1
5898	18	2	1
5899	18	1	1
5900	19	260	1
5901	19	259	1
5902	19	258	1
5903	19	257	1
5904	19	256	1
5905	19	255	1
5906	19	254	1
5907	19	253	1
5908	19	252	1
5909	19	251	1
5910	19	250	1
5911	19	249	1
5912	19	248	1
5913	19	247	1
5914	19	246	1
5915	19	245	1
5916	19	244	1
5917	19	243	1
5918	19	242	1
5919	19	241	1
5920	19	240	1
5921	19	239	1
5922	19	238	1
5923	19	237	1
5924	19	236	1
5925	19	235	1
5926	19	234	1
5927	19	233	1
5928	19	232	1
5929	19	231	1
5930	19	230	1
5931	19	229	1
5932	19	228	1
5933	19	227	1
5934	19	226	1
5935	19	225	1
5936	19	224	1
5937	19	223	1
5938	19	222	1
5939	19	221	1
5940	19	220	1
5941	19	219	1
5942	19	218	1
5943	19	217	1
5944	19	216	1
5945	19	215	1
5946	19	214	1
5947	19	213	1
5948	19	212	1
5949	19	211	1
5950	19	210	1
5951	19	209	1
5952	19	208	1
5953	19	207	1
5954	19	206	1
5955	19	205	1
5956	19	204	1
5957	19	203	1
5958	19	202	1
5959	19	201	1
5960	19	200	1
5961	19	199	1
5962	19	198	1
5963	19	197	1
5964	19	196	1
5965	19	195	1
5966	19	194	1
5967	19	193	1
5968	19	192	1
5969	19	191	1
5970	19	190	1
5971	19	189	1
5972	19	188	1
5973	19	187	1
5974	19	186	1
5975	19	185	1
5976	19	184	1
5977	19	183	1
5978	19	182	1
5979	19	181	1
5980	19	180	1
5981	19	179	1
5982	19	178	1
5983	19	177	1
5984	19	176	1
5985	19	175	1
5986	19	174	1
5987	19	173	1
5988	19	172	1
5989	19	171	1
5990	19	170	1
5991	19	169	1
5992	19	168	1
5993	19	167	1
5994	19	166	1
5995	19	165	1
5996	19	164	1
5997	19	163	1
5998	19	162	1
5999	19	161	1
6000	19	160	1
6001	19	159	1
6002	19	158	1
6003	19	157	1
6004	19	156	1
6005	19	155	1
6006	19	154	1
6007	19	153	1
6008	19	152	1
6009	19	151	1
6010	19	150	1
6011	19	149	1
6012	19	148	1
6013	19	147	1
6014	19	146	1
6015	19	145	1
6016	19	144	1
6017	19	143	1
6018	19	142	1
6019	19	141	1
6020	19	140	1
6021	19	139	1
6022	19	138	1
6023	19	137	1
6024	19	136	1
6025	19	135	1
6026	19	134	1
6027	19	133	1
6028	19	132	1
6029	19	131	1
6030	19	130	1
6031	19	129	1
6032	19	128	1
6033	19	127	1
6034	19	126	1
6035	19	125	1
6036	19	124	1
6037	19	123	1
6038	19	122	1
6039	19	121	1
6040	19	120	1
6041	19	119	1
6042	19	118	1
6043	19	117	1
6044	19	116	1
6045	19	115	1
6046	19	114	1
6047	19	113	1
6048	19	112	1
6049	19	111	1
6050	19	110	1
6051	19	109	1
6052	19	108	1
6053	19	107	1
6054	19	106	1
6055	19	105	1
6056	19	104	1
6057	19	103	1
6058	19	102	1
6059	19	101	1
6060	19	100	1
6061	19	99	1
6062	19	98	1
6063	19	97	1
6064	19	96	1
6065	19	95	1
6066	19	94	1
6067	19	93	1
6068	19	92	1
6069	19	91	1
6070	19	90	1
6071	19	89	1
6072	19	88	1
6073	19	87	1
6074	19	86	1
6075	19	85	1
6076	19	84	1
6077	19	83	1
6078	19	82	1
6079	19	81	1
6080	19	80	1
6081	19	79	1
6082	19	78	1
6083	19	77	1
6084	19	76	1
6085	19	75	1
6086	19	74	1
6087	19	73	1
6088	19	72	1
6089	19	71	1
6090	19	70	1
6091	19	69	1
6092	19	68	1
6093	19	67	1
6094	19	66	1
6095	19	65	1
6096	19	64	1
6097	19	63	1
6098	19	62	1
6099	19	61	1
6100	19	60	1
6101	19	59	1
6102	19	58	1
6103	19	57	1
6104	19	56	1
6105	19	55	1
6106	19	54	1
6107	19	53	1
6108	19	52	1
6109	19	51	1
6110	19	50	1
6111	19	49	1
6112	19	48	1
6113	19	47	1
6114	19	46	1
6115	19	45	1
6116	19	44	1
6117	19	43	1
6118	19	42	1
6119	19	41	1
6120	19	40	1
6121	19	39	1
6122	19	38	1
6123	19	37	1
6124	19	36	1
6125	19	35	1
6126	19	34	1
6127	19	33	1
6128	19	32	1
6129	19	31	1
6130	19	30	1
6131	19	29	1
6132	19	28	1
6133	19	27	1
6134	19	26	1
6135	19	25	1
6136	19	24	1
6137	19	23	1
6138	19	22	1
6139	19	21	1
6140	19	20	1
6141	19	19	1
6142	19	18	1
6143	19	17	1
6144	19	16	1
6145	19	15	1
6146	19	14	1
6147	19	13	1
6148	19	12	1
6149	19	11	1
6150	19	10	1
6151	19	9	1
6152	19	8	1
6153	19	7	1
6154	19	6	1
6155	19	5	1
6156	19	4	1
6157	19	3	1
6158	19	2	1
6159	19	1	1
6160	19	0	1
6161	20	70	1
6162	20	69	1
6163	20	68	1
6164	20	67	1
6165	20	66	1
6166	20	65	1
6167	20	64	1
6168	20	63	1
6169	20	62	1
6170	20	61	1
6171	20	60	1
6172	20	59	1
6173	20	58	1
6174	20	57	1
6175	20	56	1
6176	20	55	1
6177	20	54	1
6178	20	53	1
6179	20	52	1
6180	20	51	1
6181	20	50	1
6182	20	49	1
6183	20	48	1
6184	20	47	1
6185	20	46	1
6186	20	45	1
6187	20	44	1
6188	20	43	1
6189	20	42	1
6190	20	41	1
6191	20	40	1
6192	20	39	1
6193	20	38	1
6194	20	37	1
6195	20	36	1
6196	20	35	1
6197	20	34	1
6198	20	33	1
6199	20	32	1
6200	20	31	1
6201	20	30	1
6202	20	29	1
6203	20	28	1
6204	20	27	1
6205	20	26	1
6206	20	25	1
6207	20	24	1
6208	20	23	1
6209	20	22	1
6210	20	21	1
6211	20	20	1
6212	20	19	1
6213	20	18	1
6214	20	17	1
6215	20	16	1
6216	20	15	1
6217	20	14	1
6218	20	13	1
6219	20	12	1
6220	20	11	1
6221	20	10	1
6222	20	9	1
6223	20	8	1
6224	20	7	1
6225	20	6	1
6226	20	5	1
6227	20	4	1
6228	20	3	1
6229	20	2	1
6230	20	1	1
6231	21	65	1
6232	21	64	1
6233	21	63	1
6234	21	62	1
6235	21	61	1
6236	21	60	1
6237	21	59	1
6238	21	58	1
6239	21	57	1
6240	21	56	1
6241	21	55	1
6242	21	54	1
6243	21	53	1
6244	21	52	1
6245	21	51	1
6246	21	50	1
6247	21	49	1
6248	21	48	1
6249	21	47	1
6250	21	46	1
6251	21	45	1
6252	21	44	1
6253	21	43	1
6254	21	42	1
6255	21	41	1
6256	21	40	1
6257	21	39	1
6258	21	38	1
6259	21	37	1
6260	21	36	1
6261	21	35	1
6262	21	34	1
6263	21	33	1
6264	21	32	1
6265	21	31	1
6266	21	30	1
6267	21	29	1
6268	21	28	1
6269	21	27	1
6270	21	26	1
6271	21	25	1
6272	21	24	1
6273	21	23	1
6274	21	22	1
6275	21	21	1
6276	21	20	1
6277	21	19	1
6278	21	18	1
6279	21	17	1
6280	21	16	1
6281	21	15	1
6282	21	14	1
6283	21	13	1
6284	21	12	1
6285	21	11	1
6286	21	10	1
6287	21	9	1
6288	21	8	1
6289	21	7	1
6290	21	6	1
6291	21	5	1
6292	21	4	1
6293	21	3	1
6294	21	2	1
6295	21	1	1
6296	22	96	5
6297	22	95	5
6298	22	94	5
6299	22	93	5
6300	22	92	5
6301	22	91	5
6302	22	90	5
6303	22	89	5
6304	22	88	5
6305	22	87	5
6306	22	86	5
6307	22	85	5
6308	22	84	5
6309	22	83	5
6310	22	82	5
6311	22	81	5
6312	22	80	5
6313	22	79	5
6314	22	78	5
6315	22	77	5
6316	22	76	5
6317	22	75	5
6318	22	74	5
6319	22	73	5
6320	22	72	5
6321	22	71	5
6322	22	70	5
6323	22	69	5
6324	22	68	5
6325	22	67	5
6326	22	66	5
6327	22	65	5
6328	22	64	5
6329	22	63	5
6330	22	62	5
6331	22	61	5
6332	22	60	5
6333	22	59	5
6334	22	58	5
6335	22	57	5
6336	22	56	5
6337	22	55	5
6338	22	54	5
6339	22	53	5
6340	22	52	5
6341	22	51	5
6342	22	50	5
6343	22	49	5
6344	22	48	5
6345	22	47	5
6346	22	46	5
6347	22	45	5
6348	22	44	5
6349	22	43	5
6350	22	42	5
6351	22	41	5
6352	22	40	5
6353	22	39	5
6354	22	38	5
6355	22	37	5
6356	22	36	5
6357	22	35	5
6358	22	34	5
6359	22	33	5
6360	22	32	5
6361	22	31	5
6362	22	30	5
6363	22	29	5
6364	22	28	5
6365	22	27	5
6366	22	26	5
6367	22	25	5
6368	22	24	5
6369	22	23	5
6370	22	22	5
6371	22	21	5
6372	22	20	5
6373	22	19	5
6374	22	18	5
6375	22	17	5
6376	22	16	5
6377	22	15	5
6378	22	14	5
6379	22	13	5
6380	22	12	5
6381	22	11	5
6382	22	10	5
6383	22	9	5
6384	22	8	5
6385	22	7	5
6386	22	6	5
6387	22	5	5
6388	22	4	5
6389	22	3	5
6390	22	2	5
6391	22	1	5
6392	22	128	4
6393	22	127	4
6394	22	126	4
6395	22	125	4
6396	22	124	4
6397	22	123	4
6398	22	122	4
6399	22	121	4
6400	22	120	4
6401	22	119	4
6402	22	118	4
6403	22	117	4
6404	22	116	4
6405	22	115	4
6406	22	114	4
6407	22	113	4
6408	22	112	4
6409	22	111	4
6410	22	110	4
6411	22	109	4
6412	22	108	4
6413	22	107	4
6414	22	106	4
6415	22	105	4
6416	22	104	4
6417	22	103	4
6418	22	102	4
6419	22	101	4
6420	22	100	4
6421	22	99	4
6422	22	98	4
6423	22	97	4
6424	22	96	4
6425	22	95	4
6426	22	94	4
6427	22	93	4
6428	22	92	4
6429	22	91	4
6430	22	90	4
6431	22	89	4
6432	22	88	4
6433	22	87	4
6434	22	86	4
6435	22	85	4
6436	22	84	4
6437	22	83	4
6438	22	82	4
6439	22	81	4
6440	22	80	4
6441	22	79	4
6442	22	78	4
6443	22	77	4
6444	22	76	4
6445	22	75	4
6446	22	74	4
6447	22	73	4
6448	22	72	4
6449	22	71	4
6450	22	70	4
6451	22	69	4
6452	22	68	4
6453	22	67	4
6454	22	66	4
6455	22	65	4
6456	22	64	4
6457	22	63	4
6458	22	62	4
6459	22	61	4
6460	22	60	4
6461	22	59	4
6462	22	58	4
6463	22	57	4
6464	22	56	4
6465	22	55	4
6466	22	54	4
6467	22	53	4
6468	22	52	4
6469	22	51	4
6470	22	50	4
6471	22	49	4
6472	22	48	4
6473	22	47	4
6474	22	46	4
6475	22	45	4
6476	22	44	4
6477	22	43	4
6478	22	42	4
6479	22	41	4
6480	22	40	4
6481	22	39	4
6482	22	38	4
6483	22	37	4
6484	22	36	4
6485	22	35	4
6486	22	34	4
6487	22	33	4
6488	22	32	4
6489	22	31	4
6490	22	30	4
6491	22	29	4
6492	22	28	4
6493	22	27	4
6494	22	26	4
6495	22	25	4
6496	22	24	4
6497	22	23	4
6498	22	22	4
6499	22	21	4
6500	22	20	4
6501	22	19	4
6502	22	18	4
6503	22	17	4
6504	22	16	4
6505	22	15	4
6506	22	14	4
6507	22	13	4
6508	22	12	4
6509	22	11	4
6510	22	10	4
6511	22	9	4
6512	22	8	4
6513	22	7	4
6514	22	6	4
6515	22	5	4
6516	22	4	4
6517	22	3	4
6518	22	2	4
6519	22	1	4
6520	22	117	3
6521	22	116	3
6522	22	115	3
6523	22	114	3
6524	22	113	3
6525	22	112	3
6526	22	111	3
6527	22	110	3
6528	22	109	3
6529	22	108	3
6530	22	107	3
6531	22	106	3
6532	22	105	3
6533	22	104	3
6534	22	103	3
6535	22	102	3
6536	22	101	3
6537	22	100	3
6538	22	99	3
6539	22	98	3
6540	22	97	3
6541	22	96	3
6542	22	95	3
6543	22	94	3
6544	22	93	3
6545	22	92	3
6546	22	91	3
6547	22	90	3
6548	22	89	3
6549	22	88	3
6550	22	87	3
6551	22	86	3
6552	22	85	3
6553	22	84	3
6554	22	83	3
6555	22	82	3
6556	22	81	3
6557	22	80	3
6558	22	79	3
6559	22	78	3
6560	22	77	3
6561	22	76	3
6562	22	75	3
6563	22	74	3
6564	22	73	3
6565	22	72	3
6566	22	71	3
6567	22	70	3
6568	22	69	3
6569	22	68	3
6570	22	67	3
6571	22	66	3
6572	22	65	3
6573	22	64	3
6574	22	63	3
6575	22	62	3
6576	22	61	3
6577	22	60	3
6578	22	59	3
6579	22	58	3
6580	22	57	3
6581	22	56	3
6582	22	55	3
6583	22	54	3
6584	22	53	3
6585	22	52	3
6586	22	51	3
6587	22	50	3
6588	22	49	3
6589	22	48	3
6590	22	47	3
6591	22	46	3
6592	22	45	3
6593	22	44	3
6594	22	43	3
6595	22	42	3
6596	22	41	3
6597	22	40	3
6598	22	39	3
6599	22	38	3
6600	22	37	3
6601	22	36	3
6602	22	35	3
6603	22	34	3
6604	22	33	3
6605	22	32	3
6606	22	31	3
6607	22	30	3
6608	22	29	3
6609	22	28	3
6610	22	27	3
6611	22	26	3
6612	22	25	3
6613	22	24	3
6614	22	23	3
6615	22	22	3
6616	22	21	3
6617	22	20	3
6618	22	19	3
6619	22	18	3
6620	22	17	3
6621	22	16	3
6622	22	15	3
6623	22	14	3
6624	22	13	3
6625	22	12	3
6626	22	11	3
6627	22	10	3
6628	22	9	3
6629	22	8	3
6630	22	7	3
6631	22	6	3
6632	22	5	3
6633	22	4	3
6634	22	3	3
6635	22	2	3
6636	22	1	3
6637	22	65	2
6638	22	64	2
6639	22	63	2
6640	22	62	2
6641	22	61	2
6642	22	60	2
6643	22	59	2
6644	22	58	2
6645	22	57	2
6646	22	56	2
6647	22	55	2
6648	22	54	2
6649	22	53	2
6650	22	52	2
6651	22	51	2
6652	22	50	2
6653	22	49	2
6654	22	48	2
6655	22	47	2
6656	22	46	2
6657	22	45	2
6658	22	44	2
6659	22	43	2
6660	22	42	2
6661	22	41	2
6662	22	40	2
6663	22	39	2
6664	22	38	2
6665	22	37	2
6666	22	36	2
6667	22	35	2
6668	22	34	2
6669	22	33	2
6670	22	32	2
6671	22	31	2
6672	22	30	2
6673	22	29	2
6674	22	28	2
6675	22	27	2
6676	22	26	2
6677	22	25	2
6678	22	24	2
6679	22	23	2
6680	22	22	2
6681	22	21	2
6682	22	20	2
6683	22	19	2
6684	22	18	2
6685	22	17	2
6686	22	16	2
6687	22	15	2
6688	22	14	2
6689	22	13	2
6690	22	12	2
6691	22	11	2
6692	22	10	2
6693	22	9	2
6694	22	8	2
6695	22	7	2
6696	22	6	2
6697	22	5	2
6698	22	4	2
6699	22	3	2
6700	22	2	2
6701	22	1	2
6702	22	0	2
6703	22	66	1
6704	22	65	1
6705	22	64	1
6706	22	63	1
6707	22	62	1
6708	22	61	1
6709	22	60	1
6710	22	59	1
6711	22	58	1
6712	22	57	1
6713	22	56	1
6714	22	55	1
6715	22	54	1
6716	22	53	1
6717	22	52	1
6718	22	51	1
6719	22	50	1
6720	22	49	1
6721	22	48	1
6722	22	47	1
6723	22	46	1
6724	22	45	1
6725	22	44	1
6726	22	43	1
6727	22	42	1
6728	22	41	1
6729	22	40	1
6730	22	39	1
6731	22	38	1
6732	22	37	1
6733	22	36	1
6734	22	35	1
6735	22	34	1
6736	22	33	1
6737	22	32	1
6738	22	31	1
6739	22	30	1
6740	22	29	1
6741	22	28	1
6742	22	27	1
6743	22	26	1
6744	22	25	1
6745	22	24	1
6746	22	23	1
6747	22	22	1
6748	22	21	1
6749	22	20	1
6750	22	19	1
6751	22	18	1
6752	22	17	1
6753	22	16	1
6754	22	15	1
6755	22	14	1
6756	22	13	1
6757	22	12	1
6758	22	11	1
6759	22	10	1
6760	22	9	1
6761	22	8	1
6762	22	7	1
6763	22	6	1
6764	22	5	1
6765	22	4	1
6766	22	3	1
6767	22	2	1
6768	22	1	1
6769	22	0	1
6770	23	449	2
6771	23	448	2
6772	23	447	2
6773	23	446	2
6774	23	445	2
6775	23	444	2
6776	23	443	2
6777	23	442	2
6778	23	441	2
6779	23	440	2
6780	23	439	2
6781	23	438	2
6782	23	437	2
6783	23	436	2
6784	23	435	2
6785	23	434	2
6786	23	433	2
6787	23	432	2
6788	23	431	2
6789	23	430	2
6790	23	429	2
6791	23	428	2
6792	23	427	2
6793	23	426	2
6794	23	425	2
6795	23	424	2
6796	23	423	2
6797	23	422	2
6798	23	421	2
6799	23	420	2
6800	23	419	2
6801	23	418	2
6802	23	417	2
6803	23	416	2
6804	23	415	2
6805	23	414	2
6806	23	413	2
6807	23	412	2
6808	23	411	2
6809	23	410	2
6810	23	409	2
6811	23	408	2
6812	23	407	2
6813	23	406	2
6814	23	405	2
6815	23	404	2
6816	23	403	2
6817	23	402	2
6818	23	401	2
6819	23	400	2
6820	23	399	2
6821	23	398	2
6822	23	397	2
6823	23	396	2
6824	23	395	2
6825	23	394	2
6826	23	393	2
6827	23	392	2
6828	23	391	2
6829	23	390	2
6830	23	389	2
6831	23	388	2
6832	23	387	2
6833	23	386	2
6834	23	385	2
6835	23	384	2
6836	23	383	2
6837	23	382	2
6838	23	381	2
6839	23	380	2
6840	23	379	2
6841	23	378	2
6842	23	377	2
6843	23	376	2
6844	23	375	2
6845	23	374	2
6846	23	373	2
6847	23	372	2
6848	23	371	2
6849	23	370	2
6850	23	369	2
6851	23	368	2
6852	23	367	2
6853	23	366	2
6854	23	365	2
6855	23	364	2
6856	23	363	2
6857	23	362	2
6858	23	361	2
6859	23	360	2
6860	23	359	2
6861	23	358	2
6862	23	357	2
6863	23	356	2
6864	23	355	2
6865	23	354	2
6866	23	353	2
6867	23	352	2
6868	23	351	2
6869	23	350	2
6870	23	349	2
6871	23	348	2
6872	23	347	2
6873	23	346	2
6874	23	345	2
6875	23	344	2
6876	23	343	2
6877	23	342	2
6878	23	341	2
6879	23	340	2
6880	23	339	2
6881	23	338	2
6882	23	337	2
6883	23	336	2
6884	23	335	2
6885	23	334	2
6886	23	333	2
6887	23	332	2
6888	23	331	2
6889	23	330	2
6890	23	329	2
6891	23	328	2
6892	23	327	2
6893	23	326	2
6894	23	325	2
6895	23	324	2
6896	23	323	2
6897	23	322	2
6898	23	321	2
6899	23	320	2
6900	23	319	2
6901	23	318	2
6902	23	317	2
6903	23	316	2
6904	23	315	2
6905	23	314	2
6906	23	313	2
6907	23	312	2
6908	23	311	2
6909	23	310	2
6910	23	309	2
6911	23	308	2
6912	23	307	2
6913	23	306	2
6914	23	305	2
6915	23	304	2
6916	23	303	2
6917	23	302	2
6918	23	301	2
6919	23	300	1
6920	23	299	1
6921	23	298	1
6922	23	297	1
6923	23	296	1
6924	23	295	1
6925	23	294	1
6926	23	293	1
6927	23	292	1
6928	23	291	1
6929	23	290	1
6930	23	289	1
6931	23	288	1
6932	23	287	1
6933	23	286	1
6934	23	285	1
6935	23	284	1
6936	23	283	1
6937	23	282	1
6938	23	281	1
6939	23	280	1
6940	23	279	1
6941	23	278	1
6942	23	277	1
6943	23	276	1
6944	23	275	1
6945	23	274	1
6946	23	273	1
6947	23	272	1
6948	23	271	1
6949	23	270	1
6950	23	269	1
6951	23	268	1
6952	23	267	1
6953	23	266	1
6954	23	265	1
6955	23	264	1
6956	23	263	1
6957	23	262	1
6958	23	261	1
6959	23	260	1
6960	23	259	1
6961	23	258	1
6962	23	257	1
6963	23	256	1
6964	23	255	1
6965	23	254	1
6966	23	253	1
6967	23	252	1
6968	23	251	1
6969	23	250	1
6970	23	249	1
6971	23	248	1
6972	23	247	1
6973	23	246	1
6974	23	245	1
6975	23	244	1
6976	23	243	1
6977	23	242	1
6978	23	241	1
6979	23	240	1
6980	23	239	1
6981	23	238	1
6982	23	237	1
6983	23	236	1
6984	23	235	1
6985	23	234	1
6986	23	233	1
6987	23	232	1
6988	23	231	1
6989	23	230	1
6990	23	229	1
6991	23	228	1
6992	23	227	1
6993	23	226	1
6994	23	225	1
6995	23	224	1
6996	23	223	1
6997	23	222	1
6998	23	221	1
6999	23	220	1
7000	23	219	1
7001	23	218	1
7002	23	217	1
7003	23	216	1
7004	23	215	1
7005	23	214	1
7006	23	213	1
7007	23	212	1
7008	23	211	1
7009	23	210	1
7010	23	209	1
7011	23	208	1
7012	23	207	1
7013	23	206	1
7014	23	205	1
7015	23	204	1
7016	23	203	1
7017	23	202	1
7018	23	201	1
7019	23	200	1
7020	23	199	1
7021	23	198	1
7022	23	197	1
7023	23	196	1
7024	23	195	1
7025	23	194	1
7026	23	193	1
7027	23	192	1
7028	23	191	1
7029	23	190	1
7030	23	189	1
7031	23	188	1
7032	23	187	1
7033	23	186	1
7034	23	185	1
7035	23	184	1
7036	23	183	1
7037	23	182	1
7038	23	181	1
7039	23	180	1
7040	23	179	1
7041	23	178	1
7042	23	177	1
7043	23	176	1
7044	23	175	1
7045	23	174	1
7046	23	173	1
7047	23	172	1
7048	23	171	1
7049	23	170	1
7050	23	169	1
7051	23	168	1
7052	23	167	1
7053	23	166	1
7054	23	165	1
7055	23	164	1
7056	23	163	1
7057	23	162	1
7058	23	161	1
7059	23	160	1
7060	23	159	1
7061	23	158	1
7062	23	157	1
7063	23	156	1
7064	23	155	1
7065	23	154	1
7066	23	153	1
7067	23	152	1
7068	23	151	1
7069	23	150	1
7070	23	149	1
7071	23	148	1
7072	23	147	1
7073	23	146	1
7074	23	145	1
7075	23	144	1
7076	23	143	1
7077	23	142	1
7078	23	141	1
7079	23	140	1
7080	23	139	1
7081	23	138	1
7082	23	137	1
7083	23	136	1
7084	23	135	1
7085	23	134	1
7086	23	133	1
7087	23	132	1
7088	23	131	1
7089	23	130	1
7090	23	129	1
7091	23	128	1
7092	23	127	1
7093	23	126	1
7094	23	125	1
7095	23	124	1
7096	23	123	1
7097	23	122	1
7098	23	121	1
7099	23	120	1
7100	23	119	1
7101	23	118	1
7102	23	117	1
7103	23	116	1
7104	23	115	1
7105	23	114	1
7106	23	113	1
7107	23	112	1
7108	23	111	1
7109	23	110	1
7110	23	109	1
7111	23	108	1
7112	23	107	1
7113	23	106	1
7114	23	105	1
7115	23	104	1
7116	23	103	1
7117	23	102	1
7118	23	101	1
7119	23	100	1
7120	23	99	1
7121	23	98	1
7122	23	97	1
7123	23	96	1
7124	23	95	1
7125	23	94	1
7126	23	93	1
7127	23	92	1
7128	23	91	1
7129	23	90	1
7130	23	89	1
7131	23	88	1
7132	23	87	1
7133	23	86	1
7134	23	85	1
7135	23	84	1
7136	23	83	1
7137	23	82	1
7138	23	81	1
7139	23	80	1
7140	23	79	1
7141	23	78	1
7142	23	77	1
7143	23	76	1
7144	23	75	1
7145	23	74	1
7146	23	73	1
7147	23	72	1
7148	23	71	1
7149	23	70	1
7150	23	69	1
7151	23	68	1
7152	23	67	1
7153	23	66	1
7154	23	65	1
7155	23	64	1
7156	23	63	1
7157	23	62	1
7158	23	61	1
7159	23	60	1
7160	23	59	1
7161	23	58	1
7162	23	57	1
7163	23	56	1
7164	23	55	1
7165	23	54	1
7166	23	53	1
7167	23	52	1
7168	23	51	1
7169	23	50	1
7170	23	49	1
7171	23	48	1
7172	23	47	1
7173	23	46	1
7174	23	45	1
7175	23	44	1
7176	23	43	1
7177	23	42	1
7178	23	41	1
7179	23	40	1
7180	23	39	1
7181	23	38	1
7182	23	37	1
7183	23	36	1
7184	23	35	1
7185	23	34	1
7186	23	33	1
7187	23	32	1
7188	23	31	1
7189	23	30	1
7190	23	29	1
7191	23	28	1
7192	23	27	1
7193	23	26	1
7194	23	25	1
7195	23	24	1
7196	23	23	1
7197	23	22	1
7198	23	21	1
7199	23	20	1
7200	23	19	1
7201	23	18	1
7202	23	17	1
7203	23	16	1
7204	23	15	1
7205	23	14	1
7206	23	13	1
7207	23	12	1
7208	23	11	1
7209	23	10	1
7210	23	9	1
7211	23	8	1
7212	23	7	1
7213	23	6	1
7214	23	5	1
7215	23	4	1
7216	23	3	1
7217	23	2	1
7218	23	1	1
7219	24	93	1
7220	24	92	1
7221	24	91	1
7222	24	90	1
7223	24	89	1
7224	24	88	1
7225	24	87	1
7226	24	86	1
7227	24	85	1
7228	24	84	1
7229	24	83	1
7230	24	82	1
7231	24	81	1
7232	24	80	1
7233	24	79	1
7234	24	78	1
7235	24	77	1
7236	24	76	1
7237	24	75	1
7238	24	74	1
7239	24	73	1
7240	24	72	1
7241	24	71	1
7242	24	70	1
7243	24	69	1
7244	24	68	1
7245	24	67	1
7246	24	66	1
7247	24	65	1
7248	24	64	1
7249	24	63	1
7250	24	62	1
7251	24	61	1
7252	24	60	1
7253	24	59	1
7254	24	58	1
7255	24	57	1
7256	24	56	1
7257	24	55	1
7258	24	54	1
7259	24	53	1
7260	24	52	1
7261	24	51	1
7262	24	50	1
7263	24	49	1
7264	24	48	1
7265	24	47	1
7266	24	46	1
7267	24	45	1
7268	24	44	1
7269	24	43	1
7270	24	42	1
7271	24	41	1
7272	24	40	1
7273	24	39	1
7274	24	38	1
7275	24	37	1
7276	24	36	1
7277	24	35	1
7278	24	34	1
7279	24	33	1
7280	24	32	1
7281	24	31	1
7282	24	30	1
7283	24	29	1
7284	24	28	1
7285	24	27	1
7286	24	26	1
7287	24	25	1
7288	24	24	1
7289	24	23	1
7290	24	22	1
7291	24	21	1
7292	24	20	1
7293	24	19	1
7294	24	18	1
7295	24	17	1
7296	24	16	1
7297	24	15	1
7298	24	14	1
7299	24	13	1
7300	24	12	1
7301	24	11	1
7302	24	10	1
7303	24	9	1
7304	24	8	1
7305	24	7	1
7306	24	6	1
7307	24	5	1
7308	24	4	1
7309	24	3	1
7310	24	2	1
7311	24	1	1
7312	24	0	1
7313	25	273	1
7314	25	272	1
7315	25	271	1
7316	25	270	1
7317	25	269	1
7318	25	268	1
7319	25	267	1
7320	25	266	1
7321	25	265	1
7322	25	264	1
7323	25	263	1
7324	25	262	1
7325	25	261	1
7326	25	260	1
7327	25	259	1
7328	25	258	1
7329	25	257	1
7330	25	256	1
7331	25	255	1
7332	25	254	1
7333	25	253	1
7334	25	252	1
7335	25	251	1
7336	25	250	1
7337	25	249	1
7338	25	248	1
7339	25	247	1
7340	25	246	1
7341	25	245	1
7342	25	244	1
7343	25	243	1
7344	25	242	1
7345	25	241	1
7346	25	240	1
7347	25	239	1
7348	25	238	1
7349	25	237	1
7350	25	236	1
7351	25	235	1
7352	25	234	1
7353	25	233	1
7354	25	232	1
7355	25	231	1
7356	25	230	1
7357	25	229	1
7358	25	228	1
7359	25	227	1
7360	25	226	1
7361	25	225	1
7362	25	224	1
7363	25	223	1
7364	25	222	1
7365	25	221	1
7366	25	220	1
7367	25	219	1
7368	25	218	1
7369	25	217	1
7370	25	216	1
7371	25	215	1
7372	25	214	1
7373	25	213	1
7374	25	212	1
7375	25	211	1
7376	25	210	1
7377	25	209	1
7378	25	208	1
7379	25	207	1
7380	25	206	1
7381	25	205	1
7382	25	204	1
7383	25	203	1
7384	25	202	1
7385	25	201	1
7386	25	200	1
7387	25	199	1
7388	25	198	1
7389	25	197	1
7390	25	196	1
7391	25	195	1
7392	25	194	1
7393	25	193	1
7394	25	192	1
7395	25	191	1
7396	25	190	1
7397	25	189	1
7398	25	188	1
7399	25	187	1
7400	25	186	1
7401	25	185	1
7402	25	184	1
7403	25	183	1
7404	25	182	1
7405	25	181	1
7406	25	180	1
7407	25	179	1
7408	25	178	1
7409	25	177	1
7410	25	176	1
7411	25	175	1
7412	25	174	1
7413	25	173	1
7414	25	172	1
7415	25	171	1
7416	25	170	1
7417	25	169	1
7418	25	168	1
7419	25	167	1
7420	25	166	1
7421	25	165	1
7422	25	164	1
7423	25	163	1
7424	25	162	1
7425	25	161	1
7426	25	160	1
7427	25	159	1
7428	25	158	1
7429	25	157	1
7430	25	156	1
7431	25	155	1
7432	25	154	1
7433	25	153	1
7434	25	152	1
7435	25	151	1
7436	25	150	1
7437	25	149	1
7438	25	148	1
7439	25	147	1
7440	25	146	1
7441	25	145	1
7442	25	144	1
7443	25	143	1
7444	25	142	1
7445	25	141	1
7446	25	140	1
7447	25	139	1
7448	25	138	1
7449	25	137	1
7450	25	136	1
7451	25	135	1
7452	25	134	1
7453	25	133	1
7454	25	132	1
7455	25	131	1
7456	25	130	1
7457	25	129	1
7458	25	128	1
7459	25	127	1
7460	25	126	1
7461	25	125	1
7462	25	124	1
7463	25	123	1
7464	25	122	1
7465	25	121	1
7466	25	120	1
7467	25	119	1
7468	25	118	1
7469	25	117	1
7470	25	116	1
7471	25	115	1
7472	25	114	1
7473	25	113	1
7474	25	112	1
7475	25	111	1
7476	25	110	1
7477	25	109	1
7478	25	108	1
7479	25	107	1
7480	25	106	1
7481	25	105	1
7482	25	104	1
7483	25	103	1
7484	25	102	1
7485	25	101	1
7486	25	100	1
7487	25	99	1
7488	25	98	1
7489	25	97	1
7490	25	96	1
7491	25	95	1
7492	25	94	1
7493	25	93	1
7494	25	92	1
7495	25	91	1
7496	25	90	1
7497	25	89	1
7498	25	88	1
7499	25	87	1
7500	25	86	1
7501	25	85	1
7502	25	84	1
7503	25	83	1
7504	25	82	1
7505	25	81	1
7506	25	80	1
7507	25	79	1
7508	25	78	1
7509	25	77	1
7510	25	76	1
7511	25	75	1
7512	25	74	1
7513	25	73	1
7514	25	72	1
7515	25	71	1
7516	25	70	1
7517	25	69	1
7518	25	68	1
7519	25	67	1
7520	25	66	1
7521	25	65	1
7522	25	64	1
7523	25	63	1
7524	25	62	1
7525	25	61	1
7526	25	60	1
7527	25	59	1
7528	25	58	1
7529	25	57	1
7530	25	56	1
7531	25	55	1
7532	25	54	1
7533	25	53	1
7534	25	52	1
7535	25	51	1
7536	25	50	1
7537	25	49	1
7538	25	48	1
7539	25	47	1
7540	25	46	1
7541	25	45	1
7542	25	44	1
7543	25	43	1
7544	25	42	1
7545	25	41	1
7546	25	40	1
7547	25	39	1
7548	25	38	1
7549	25	37	1
7550	25	36	1
7551	25	35	1
7552	25	34	1
7553	25	33	1
7554	25	32	1
7555	25	31	1
7556	25	30	1
7557	25	29	1
7558	25	28	1
7559	25	27	1
7560	25	26	1
7561	25	25	1
7562	25	24	1
7563	25	23	1
7564	25	22	1
7565	25	21	1
7566	25	20	1
7567	25	19	1
7568	25	18	1
7569	25	17	1
7570	25	16	1
7571	25	15	1
7572	25	14	1
7573	25	13	1
7574	25	12	1
7575	25	11	1
7576	25	10	1
7577	25	9	1
7578	25	8	1
7579	25	7	1
7580	25	6	1
7581	25	5	1
7582	25	4	1
7583	25	3	1
7584	25	2	1
7585	25	1	1
7586	26	123	2
7587	26	122	2
7588	26	121	2
7589	26	120	2
7590	26	119	2
7591	26	118	2
7592	26	117	2
7593	26	116	2
7594	26	115	2
7595	26	114	2
7596	26	113	2
7597	26	112	2
7598	26	111	2
7599	26	110	2
7600	26	109	2
7601	26	108	2
7602	26	107	2
7603	26	106	2
7604	26	105	2
7605	26	104	1
7606	26	103	1
7607	26	102	1
7608	26	101	1
7609	26	100	1
7610	26	99	1
7611	26	98	1
7612	26	97	1
7613	26	96	1
7614	26	95	1
7615	26	94	1
7616	26	93	1
7617	26	92	1
7618	26	91	1
7619	26	90	1
7620	26	89	1
7621	26	88	1
7622	26	87	1
7623	26	86	1
7624	26	85	1
7625	26	84	1
7626	26	83	1
7627	26	82	1
7628	26	81	1
7629	26	80	1
7630	26	79	1
7631	26	78	1
7632	26	77	1
7633	26	76	1
7634	26	75	1
7635	26	74	1
7636	26	73	1
7637	26	72	1
7638	26	71	1
7639	26	70	1
7640	26	69	1
7641	26	68	1
7642	26	67	1
7643	26	66	1
7644	26	65	1
7645	26	64	1
7646	26	63	1
7647	26	62	1
7648	26	61	1
7649	26	60	1
7650	26	59	1
7651	26	58	1
7652	26	57	1
7653	26	56	1
7654	26	55	1
7655	26	54	1
7656	26	53	1
7657	26	52	1
7658	26	51	1
7659	26	50	1
7660	26	49	1
7661	26	48	1
7662	26	47	1
7663	26	46	1
7664	26	45	1
7665	26	44	1
7666	26	43	1
7667	26	42	1
7668	26	41	1
7669	26	40	1
7670	26	39	1
7671	26	38	1
7672	26	37	1
7673	26	36	1
7674	26	35	1
7675	26	34	1
7676	26	33	1
7677	26	32	1
7678	26	31	1
7679	26	30	1
7680	26	29	1
7681	26	28	1
7682	26	27	1
7683	26	26	1
7684	26	25	1
7685	26	24	1
7686	26	23	1
7687	26	22	1
7688	26	21	1
7689	26	20	1
7690	26	19	1
7691	26	18	1
7692	26	17	1
7693	26	16	1
7694	26	15	1
7695	26	14	1
7696	26	13	1
7697	26	12	1
7698	26	11	1
7699	26	10	1
7700	26	9	1
7701	26	8	1
7702	26	7	1
7703	26	6	1
7704	26	5	1
7705	26	4	1
7706	26	3	1
7707	26	2	1
7708	26	1	1
7709	27	98	2
7710	27	97	2
7711	27	96	2
7712	27	95	2
7713	27	94	2
7714	27	93	2
7715	27	92	2
7716	27	91	2
7717	27	90	2
7718	27	89	2
7719	27	88	2
7720	27	87	2
7721	27	86	2
7722	27	85	2
7723	27	84	2
7724	27	83	2
7725	27	82	2
7726	27	81	2
7727	27	80	2
7728	27	79	2
7729	27	78	2
7730	27	77	2
7731	27	76	2
7732	27	75	2
7733	27	74	2
7734	27	73	2
7735	27	72	2
7736	27	71	2
7737	27	70	1
7738	27	69	1
7739	27	68	1
7740	27	67	1
7741	27	66	1
7742	27	65	1
7743	27	64	1
7744	27	63	1
7745	27	62	1
7746	27	61	1
7747	27	60	1
7748	27	59	1
7749	27	58	1
7750	27	57	1
7751	27	56	1
7752	27	55	1
7753	27	54	1
7754	27	53	1
7755	27	52	1
7756	27	51	1
7757	27	50	1
7758	27	49	1
7759	27	48	1
7760	27	47	1
7761	27	46	1
7762	27	45	1
7763	27	44	1
7764	27	43	1
7765	27	42	1
7766	27	41	1
7767	27	40	1
7768	27	39	1
7769	27	38	1
7770	27	37	1
7771	27	36	1
7772	27	35	1
7773	27	34	1
7774	27	33	1
7775	27	32	1
7776	27	31	1
7777	27	30	1
7778	27	29	1
7779	27	28	1
7780	27	27	1
7781	27	26	1
7782	27	25	1
7783	27	24	1
7784	27	23	1
7785	27	22	1
7786	27	21	1
7787	27	20	1
7788	27	19	1
7789	27	18	1
7790	27	17	1
7791	27	16	1
7792	27	15	1
7793	27	14	1
7794	27	13	1
7795	27	12	1
7796	27	11	1
7797	27	10	1
7798	27	9	1
7799	27	8	1
7800	27	7	1
7801	27	6	1
7802	27	5	1
7803	27	4	1
7804	27	3	1
7805	27	2	1
7806	27	1	1
7807	28	100	1
7808	28	99	1
7809	28	98	1
7810	28	97	1
7811	28	96	1
7812	28	95	1
7813	28	94	1
7814	28	93	1
7815	28	92	1
7816	28	91	1
7817	28	90	1
7818	28	89	1
7819	28	88	1
7820	28	87	1
7821	28	86	1
7822	28	85	1
7823	28	84	1
7824	28	83	1
7825	28	82	1
7826	28	81	1
7827	28	80	1
7828	28	79	1
7829	28	78	1
7830	28	77	1
7831	28	76	1
7832	28	75	1
7833	28	74	1
7834	28	73	1
7835	28	72	1
7836	28	71	1
7837	28	70	1
7838	28	69	1
7839	28	68	1
7840	28	67	1
7841	28	66	1
7842	28	65	1
7843	28	64	1
7844	28	63	1
7845	28	62	1
7846	28	61	1
7847	28	60	1
7848	28	59	1
7849	28	58	1
7850	28	57	1
7851	28	56	1
7852	28	55	1
7853	28	54	1
7854	28	53	1
7855	28	52	1
7856	28	51	1
7857	28	50	1
7858	28	49	1
7859	28	48	1
7860	28	47	1
7861	28	46	1
7862	28	45	1
7863	28	44	1
7864	28	43	1
7865	28	42	1
7866	28	41	1
7867	28	40	1
7868	28	39	1
7869	28	38	1
7870	28	37	1
7871	28	36	1
7872	28	35	1
7873	28	34	1
7874	28	33	1
7875	28	32	1
7876	28	31	1
7877	28	30	1
7878	28	29	1
7879	28	28	1
7880	28	27	1
7881	28	26	1
7882	28	25	1
7883	28	24	1
7884	28	23	1
7885	28	22	1
7886	28	21	1
7887	28	20	1
7888	28	19	1
7889	28	18	1
7890	28	17	1
7891	28	16	1
7892	28	15	1
7893	28	14	1
7894	28	13	1
7895	28	12	1
7896	28	11	1
7897	28	10	1
7898	28	9	1
7899	28	8	1
7900	28	7	1
7901	28	6	1
7902	28	5	1
7903	28	4	1
7904	28	3	1
7905	28	2	1
7906	28	1	1
7907	29	102	3
7908	29	101	3
7909	29	100	3
7910	29	99	3
7911	29	98	3
7912	29	97	3
7913	29	96	3
7914	29	95	3
7915	29	94	3
7916	29	93	3
7917	29	92	3
7918	29	91	3
7919	29	90	3
7920	29	89	3
7921	29	88	3
7922	29	87	3
7923	29	86	2
7924	29	85	2
7925	29	84	2
7926	29	83	2
7927	29	82	2
7928	29	81	2
7929	29	80	2
7930	29	79	2
7931	29	78	2
7932	29	77	2
7933	29	76	2
7934	29	75	2
7935	29	74	2
7936	29	73	2
7937	29	72	2
7938	29	71	2
7939	29	70	2
7940	29	69	2
7941	29	68	2
7942	29	67	2
7943	29	66	2
7944	29	65	2
7945	29	64	2
7946	29	63	2
7947	29	62	2
7948	29	61	2
7949	29	60	2
7950	29	59	2
7951	29	58	2
7952	29	57	2
7953	29	56	2
7954	29	55	2
7955	29	54	2
7956	29	53	2
7957	29	52	2
7958	29	51	2
7959	29	50	2
7960	29	49	2
7961	29	48	2
7962	29	47	2
7963	29	46	2
7964	29	45	2
7965	29	44	2
7966	29	43	2
7967	29	42	2
7968	29	41	1
7969	29	40	1
7970	29	39	1
7971	29	38	1
7972	29	37	1
7973	29	36	1
7974	29	35	1
7975	29	34	1
7976	29	33	1
7977	29	32	1
7978	29	31	1
7979	29	30	1
7980	29	29	1
7981	29	28	1
7982	29	27	1
7983	29	26	1
7984	29	25	1
7985	29	24	1
7986	29	23	1
7987	29	22	1
7988	29	21	1
7989	29	20	1
7990	29	19	1
7991	29	18	1
7992	29	17	1
7993	29	16	1
7994	29	15	1
7995	29	14	1
7996	29	13	1
7997	29	12	1
7998	29	11	1
7999	29	10	1
8000	29	9	1
8001	29	8	1
8002	29	7	1
8003	29	6	1
8004	29	5	1
8005	29	4	1
8006	29	3	1
8007	29	2	1
8008	29	1	1
8009	30	148	1
8010	30	147	1
8011	30	146	1
8012	30	145	1
8013	30	144	1
8014	30	143	1
8015	30	142	1
8016	30	141	1
8017	30	140	1
8018	30	139	1
8019	30	138	1
8020	30	137	1
8021	30	136	1
8022	30	135	1
8023	30	134	1
8024	30	133	1
8025	30	132	1
8026	30	131	1
8027	30	130	1
8028	30	129	1
8029	30	128	1
8030	30	127	1
8031	30	126	1
8032	30	125	1
8033	30	124	1
8034	30	123	1
8035	30	122	1
8036	30	121	1
8037	30	120	1
8038	30	119	1
8039	30	118	1
8040	30	117	1
8041	30	116	1
8042	30	115	1
8043	30	114	1
8044	30	113	1
8045	30	112	1
8046	30	111	1
8047	30	110	1
8048	30	109	1
8049	30	108	1
8050	30	107	1
8051	30	106	1
8052	30	105	1
8053	30	104	1
8054	30	103	1
8055	30	102	1
8056	30	101	1
8057	30	100	1
8058	30	99	1
8059	30	98	1
8060	30	97	1
8061	30	96	1
8062	30	95	1
8063	30	94	1
8064	30	93	1
8065	30	92	1
8066	30	91	1
8067	30	90	1
8068	30	89	1
8069	30	88	1
8070	30	87	1
8071	30	86	1
8072	30	85	1
8073	30	84	1
8074	30	83	1
8075	30	82	1
8076	30	81	1
8077	30	80	1
8078	30	79	1
8079	30	78	1
8080	30	77	1
8081	30	76	1
8082	30	75	1
8083	30	74	1
8084	30	73	1
8085	30	72	1
8086	30	71	1
8087	30	70	1
8088	30	69	1
8089	30	68	1
8090	30	67	1
8091	30	66	1
8092	30	65	1
8093	30	64	1
8094	30	63	1
8095	30	62	1
8096	30	61	1
8097	30	60	1
8098	30	59	1
8099	30	58	1
8100	30	57	1
8101	30	56	1
8102	30	55	1
8103	30	54	1
8104	30	53	1
8105	30	52	1
8106	30	51	1
8107	30	50	1
8108	30	49	1
8109	30	48	1
8110	30	47	1
8111	30	46	1
8112	30	45	1
8113	30	44	1
8114	30	43	1
8115	30	42	1
8116	30	41	1
8117	30	40	1
8118	30	39	1
8119	30	38	1
8120	30	37	1
8121	30	36	1
8122	30	35	1
8123	30	34	1
8124	30	33	1
8125	30	32	1
8126	30	31	1
8127	30	30	1
8128	30	29	1
8129	30	28	1
8130	30	27	1
8131	30	26	1
8132	30	25	1
8133	30	24	1
8134	30	23	1
8135	30	22	1
8136	30	21	1
8137	30	20	1
8138	30	19	1
8139	30	18	1
8140	30	17	1
8141	30	16	1
8142	30	15	1
8143	30	14	1
8144	30	13	1
8145	30	12	1
8146	30	11	1
8147	30	10	1
8148	30	9	1
8149	30	8	1
8150	30	7	1
8151	30	6	1
8152	30	5	1
8153	30	4	1
8154	30	3	1
8155	30	2	1
8156	30	1	1
8157	30	0	1
8158	31	102	1
8159	31	101	1
8160	31	100	1
8161	31	99	1
8162	31	98	1
8163	31	97	1
8164	31	96	1
8165	31	95	1
8166	31	94	1
8167	31	93	1
8168	31	92	1
8169	31	91	1
8170	31	90	1
8171	31	89	1
8172	31	88	1
8173	31	87	1
8174	31	86	1
8175	31	85	1
8176	31	84	1
8177	31	83	1
8178	31	82	1
8179	31	81	1
8180	31	80	1
8181	31	79	1
8182	31	78	1
8183	31	77	1
8184	31	76	1
8185	31	75	1
8186	31	74	1
8187	31	73	1
8188	31	72	1
8189	31	71	1
8190	31	70	1
8191	31	69	1
8192	31	68	1
8193	31	67	1
8194	31	66	1
8195	31	65	1
8196	31	64	1
8197	31	63	1
8198	31	62	1
8199	31	61	1
8200	31	60	1
8201	31	59	1
8202	31	58	1
8203	31	57	1
8204	31	56	1
8205	31	55	1
8206	31	54	1
8207	31	53	1
8208	31	52	1
8209	31	51	1
8210	31	50	1
8211	31	49	1
8212	31	48	1
8213	31	47	1
8214	31	46	1
8215	31	45	1
8216	31	44	1
8217	31	43	1
8218	31	42	1
8219	31	41	1
8220	31	40	1
8221	31	39	1
8222	31	38	1
8223	31	37	1
8224	31	36	1
8225	31	35	1
8226	31	34	1
8227	31	33	1
8228	31	32	1
8229	31	31	1
8230	31	30	1
8231	31	29	1
8232	31	28	1
8233	31	27	1
8234	31	26	1
8235	31	25	1
8236	31	24	1
8237	31	23	1
8238	31	22	1
8239	31	21	1
8240	31	20	1
8241	31	19	1
8242	31	18	1
8243	31	17	1
8244	31	16	1
8245	31	15	1
8246	31	14	1
8247	31	13	1
8248	31	12	1
8249	31	11	1
8250	31	10	1
8251	31	9	1
8252	31	8	1
8253	31	7	1
8254	31	6	1
8255	31	5	1
8256	31	4	1
8257	31	3	1
8258	31	2	1
8259	31	1	1
8260	31	0	1
8261	32	97	2
8262	32	96	2
8263	32	95	2
8264	32	94	2
8265	32	93	2
8266	32	92	2
8267	32	91	2
8268	32	90	2
8269	32	89	2
8270	32	88	2
8271	32	87	2
8272	32	86	2
8273	32	85	2
8274	32	84	2
8275	32	83	2
8276	32	82	2
8277	32	81	2
8278	32	80	2
8279	32	79	2
8280	32	78	2
8281	32	77	2
8282	32	76	2
8283	32	75	2
8284	32	74	2
8285	32	73	2
8286	32	72	2
8287	32	71	2
8288	32	70	2
8289	32	69	2
8290	32	68	2
8291	32	67	2
8292	32	66	2
8293	32	65	2
8294	32	64	2
8295	32	63	1
8296	32	62	1
8297	32	61	1
8298	32	60	1
8299	32	59	1
8300	32	58	1
8301	32	57	1
8302	32	56	1
8303	32	55	1
8304	32	54	1
8305	32	53	1
8306	32	52	1
8307	32	51	1
8308	32	50	1
8309	32	49	1
8310	32	48	1
8311	32	47	1
8312	32	46	1
8313	32	45	1
8314	32	44	1
8315	32	43	1
8316	32	42	1
8317	32	41	1
8318	32	40	1
8319	32	39	1
8320	32	38	1
8321	32	37	1
8322	32	36	1
8323	32	35	1
8324	32	34	1
8325	32	33	1
8326	32	32	1
8327	32	31	1
8328	32	30	1
8329	32	29	1
8330	32	28	1
8331	32	27	1
8332	32	26	1
8333	32	25	1
8334	32	24	1
8335	32	23	1
8336	32	22	1
8337	32	21	1
8338	32	20	1
8339	32	19	1
8340	32	18	1
8341	32	17	1
8342	32	16	1
8343	32	15	1
8344	32	14	1
8345	32	13	1
8346	32	12	1
8347	32	11	1
8348	32	10	1
8349	32	9	1
8350	32	8	1
8351	32	7	1
8352	32	6	1
8353	32	5	1
8354	32	4	1
8355	32	3	1
8356	32	2	1
8357	32	1	1
8358	33	205	1
8359	33	204	1
8360	33	203	1
8361	33	202	1
8362	33	201	1
8363	33	200	1
8364	33	199	1
8365	33	198	1
8366	33	197	1
8367	33	196	1
8368	33	195	1
8369	33	194	1
8370	33	193	1
8371	33	192	1
8372	33	191	1
8373	33	190	1
8374	33	189	1
8375	33	188	1
8376	33	187	1
8377	33	186	1
8378	33	185	1
8379	33	184	1
8380	33	183	1
8381	33	182	1
8382	33	181	1
8383	33	180	1
8384	33	179	1
8385	33	178	1
8386	33	177	1
8387	33	176	1
8388	33	175	1
8389	33	174	1
8390	33	173	1
8391	33	172	1
8392	33	171	1
8393	33	170	1
8394	33	169	1
8395	33	168	1
8396	33	167	1
8397	33	166	1
8398	33	165	1
8399	33	164	1
8400	33	163	1
8401	33	162	1
8402	33	161	1
8403	33	160	1
8404	33	159	1
8405	33	158	1
8406	33	157	1
8407	33	156	1
8408	33	155	1
8409	33	154	1
8410	33	153	1
8411	33	152	1
8412	33	151	1
8413	33	150	1
8414	33	149	1
8415	33	148	1
8416	33	147	1
8417	33	146	1
8418	33	145	1
8419	33	144	1
8420	33	143	1
8421	33	142	1
8422	33	141	1
8423	33	140	1
8424	33	139	1
8425	33	138	1
8426	33	137	1
8427	33	136	1
8428	33	135	1
8429	33	134	1
8430	33	133	1
8431	33	132	1
8432	33	131	1
8433	33	130	1
8434	33	129	1
8435	33	128	1
8436	33	127	1
8437	33	126	1
8438	33	125	1
8439	33	124	1
8440	33	123	1
8441	33	122	1
8442	33	121	1
8443	33	120	1
8444	33	119	1
8445	33	118	1
8446	33	117	1
8447	33	116	1
8448	33	115	1
8449	33	114	1
8450	33	113	1
8451	33	112	1
8452	33	111	1
8453	33	110	1
8454	33	109	1
8455	33	108	1
8456	33	107	1
8457	33	106	1
8458	33	105	1
8459	33	104	1
8460	33	103	1
8461	33	102	1
8462	33	101	1
8463	33	100	1
8464	33	99	1
8465	33	98	1
8466	33	97	1
8467	33	96	1
8468	33	95	1
8469	33	94	1
8470	33	93	1
8471	33	92	1
8472	33	91	1
8473	33	90	1
8474	33	89	1
8475	33	88	1
8476	33	87	1
8477	33	86	1
8478	33	85	1
8479	33	84	1
8480	33	83	1
8481	33	82	1
8482	33	81	1
8483	33	80	1
8484	33	79	1
8485	33	78	1
8486	33	77	1
8487	33	76	1
8488	33	75	1
8489	33	74	1
8490	33	73	1
8491	33	72	1
8492	33	71	1
8493	33	70	1
8494	33	69	1
8495	33	68	1
8496	33	67	1
8497	33	66	1
8498	33	65	1
8499	33	64	1
8500	33	63	1
8501	33	62	1
8502	33	61	1
8503	33	60	1
8504	33	59	1
8505	33	58	1
8506	33	57	1
8507	33	56	1
8508	33	55	1
8509	33	54	1
8510	33	53	1
8511	33	52	1
8512	33	51	1
8513	33	50	1
8514	33	49	1
8515	33	48	1
8516	33	47	1
8517	33	46	1
8518	33	45	1
8519	33	44	1
8520	33	43	1
8521	33	42	1
8522	33	41	1
8523	33	40	1
8524	33	39	1
8525	33	38	1
8526	33	37	1
8527	33	36	1
8528	33	35	1
8529	33	34	1
8530	33	33	1
8531	33	32	1
8532	33	31	1
8533	33	30	1
8534	33	29	1
8535	33	28	1
8536	33	27	1
8537	33	26	1
8538	33	25	1
8539	33	24	1
8540	33	23	1
8541	33	22	1
8542	33	21	1
8543	33	20	1
8544	33	19	1
8545	33	18	1
8546	33	17	1
8547	33	16	1
8548	33	15	1
8549	33	14	1
8550	33	13	1
8551	33	12	1
8552	33	11	1
8553	33	10	1
8554	33	9	1
8555	33	8	1
8556	33	7	1
8557	33	6	1
8558	33	5	1
8559	33	4	1
8560	33	3	1
8561	33	2	1
8562	33	1	1
8563	34	125	4
8564	34	124	4
8565	34	123	3
8566	34	122	3
8567	34	121	3
8568	34	120	3
8569	34	119	3
8570	34	118	3
8571	34	117	3
8572	34	116	3
8573	34	115	3
8574	34	114	3
8575	34	113	3
8576	34	112	3
8577	34	111	3
8578	34	110	3
8579	34	109	3
8580	34	108	3
8581	34	107	3
8582	34	106	3
8583	34	105	3
8584	34	104	3
8585	34	103	3
8586	34	102	3
8587	34	101	3
8588	34	100	3
8589	34	99	3
8590	34	98	3
8591	34	97	3
8592	34	96	3
8593	34	95	3
8594	34	94	3
8595	34	93	3
8596	34	92	3
8597	34	91	3
8598	34	90	3
8599	34	89	3
8600	34	88	3
8601	34	87	3
8602	34	86	3
8603	34	85	3
8604	34	84	3
8605	34	83	3
8606	34	82	3
8607	34	81	2
8608	34	80	2
8609	34	79	2
8610	34	78	2
8611	34	77	2
8612	34	76	2
8613	34	75	2
8614	34	74	2
8615	34	73	2
8616	34	72	2
8617	34	71	2
8618	34	70	2
8619	34	69	2
8620	34	68	2
8621	34	67	2
8622	34	66	2
8623	34	65	2
8624	34	64	2
8625	34	63	2
8626	34	62	2
8627	34	61	2
8628	34	60	2
8629	34	59	2
8630	34	58	2
8631	34	57	2
8632	34	56	2
8633	34	55	2
8634	34	54	2
8635	34	53	2
8636	34	52	2
8637	34	51	2
8638	34	50	2
8639	34	49	2
8640	34	48	2
8641	34	47	2
8642	34	46	1
8643	34	45	1
8644	34	44	1
8645	34	43	1
8646	34	42	1
8647	34	41	1
8648	34	40	1
8649	34	39	1
8650	34	38	1
8651	34	37	1
8652	34	36	1
8653	34	35	1
8654	34	34	1
8655	34	33	1
8656	34	32	1
8657	34	31	1
8658	34	30	1
8659	34	29	1
8660	34	28	1
8661	34	27	1
8662	34	26	1
8663	34	25	1
8664	34	24	1
8665	34	23	1
8666	34	22	1
8667	34	21	1
8668	34	20	1
8669	34	19	1
8670	34	18	1
8671	34	17	1
8672	34	16	1
8673	34	15	1
8674	34	14	1
8675	34	13	1
8676	34	12	1
8677	34	11	1
8678	34	10	1
8679	34	9	1
8680	34	8	1
8681	34	7	1
8682	34	6	1
8683	34	5	1
8684	34	4	1
8685	34	3	1
8686	34	2	1
8687	34	1	1
8688	35	71	1
8689	35	70	1
8690	35	69	1
8691	35	68	1
8692	35	67	1
8693	35	66	1
8694	35	65	1
8695	35	64	1
8696	35	63	1
8697	35	62	1
8698	35	61	1
8699	35	60	1
8700	35	59	1
8701	35	58	1
8702	35	57	1
8703	35	56	1
8704	35	55	1
8705	35	54	1
8706	35	53	1
8707	35	52	1
8708	35	51	1
8709	35	50	1
8710	35	49	1
8711	35	48	1
8712	35	47	1
8713	35	46	1
8714	35	45	1
8715	35	44	1
8716	35	43	1
8717	35	42	1
8718	35	41	1
8719	35	40	1
8720	35	39	1
8721	35	38	1
8722	35	37	1
8723	35	36	1
8724	35	35	1
8725	35	34	1
8726	35	33	1
8727	35	32	1
8728	35	31	1
8729	35	30	1
8730	35	29	1
8731	35	28	1
8732	35	27	1
8733	35	26	1
8734	35	25	1
8735	35	24	1
8736	35	23	1
8737	35	22	1
8738	35	21	1
8739	35	20	1
8740	35	19	1
8741	35	18	1
8742	35	17	1
8743	35	16	1
8744	35	15	1
8745	35	14	1
8746	35	13	1
8747	35	12	1
8748	35	11	1
8749	35	10	1
8750	35	9	1
8751	35	8	1
8752	35	7	1
8753	35	6	1
8754	35	5	1
8755	35	4	1
8756	35	3	1
8757	35	2	1
8758	35	1	1
8759	36	146	4
8760	36	145	4
8761	36	144	4
8762	36	143	3
8763	36	142	3
8764	36	141	3
8765	36	140	3
8766	36	139	3
8767	36	138	3
8768	36	137	3
8769	36	136	3
8770	36	135	3
8771	36	134	3
8772	36	133	3
8773	36	132	3
8774	36	131	3
8775	36	130	3
8776	36	129	3
8777	36	128	3
8778	36	127	3
8779	36	126	3
8780	36	125	3
8781	36	124	3
8782	36	123	3
8783	36	122	3
8784	36	121	3
8785	36	120	3
8786	36	119	3
8787	36	118	3
8788	36	117	3
8789	36	116	3
8790	36	115	3
8791	36	114	3
8792	36	113	3
8793	36	112	3
8794	36	111	3
8795	36	110	3
8796	36	109	3
8797	36	108	3
8798	36	107	3
8799	36	106	3
8800	36	105	3
8801	36	104	3
8802	36	103	3
8803	36	102	3
8804	36	101	3
8805	36	100	2
8806	36	99	2
8807	36	98	2
8808	36	97	2
8809	36	96	2
8810	36	95	2
8811	36	94	2
8812	36	93	2
8813	36	92	2
8814	36	91	2
8815	36	90	2
8816	36	89	2
8817	36	88	2
8818	36	87	2
8819	36	86	2
8820	36	85	2
8821	36	84	2
8822	36	83	2
8823	36	82	2
8824	36	81	2
8825	36	80	2
8826	36	79	2
8827	36	78	2
8828	36	77	2
8829	36	76	2
8830	36	75	2
8831	36	74	2
8832	36	73	2
8833	36	72	2
8834	36	71	2
8835	36	70	2
8836	36	69	2
8837	36	68	2
8838	36	67	2
8839	36	66	2
8840	36	65	2
8841	36	64	2
8842	36	63	2
8843	36	62	2
8844	36	61	2
8845	36	60	2
8846	36	59	2
8847	36	58	2
8848	36	57	2
8849	36	56	2
8850	36	55	2
8851	36	54	2
8852	36	53	1
8853	36	52	1
8854	36	51	1
8855	36	50	1
8856	36	49	1
8857	36	48	1
8858	36	47	1
8859	36	46	1
8860	36	45	1
8861	36	44	1
8862	36	43	1
8863	36	42	1
8864	36	41	1
8865	36	40	1
8866	36	39	1
8867	36	38	1
8868	36	37	1
8869	36	36	1
8870	36	35	1
8871	36	34	1
8872	36	33	1
8873	36	32	1
8874	36	31	1
8875	36	30	1
8876	36	29	1
8877	36	28	1
8878	36	27	1
8879	36	26	1
8880	36	25	1
8881	36	24	1
8882	36	23	1
8883	36	22	1
8884	36	21	1
8885	36	20	1
8886	36	19	1
8887	36	18	1
8888	36	17	1
8889	36	16	1
8890	36	15	1
8891	36	14	1
8892	36	13	1
8893	36	12	1
8894	36	11	1
8895	36	10	1
8896	36	9	1
8897	36	8	1
8898	36	7	1
8899	36	6	1
8900	36	5	1
8901	36	4	1
8902	36	3	1
8903	36	2	1
8904	36	1	1
8905	37	103	1
8906	37	102	1
8907	37	101	1
8908	37	100	1
8909	37	99	1
8910	37	98	1
8911	37	97	1
8912	37	96	1
8913	37	95	1
8914	37	94	1
8915	37	93	1
8916	37	92	1
8917	37	91	1
8918	37	90	1
8919	37	89	1
8920	37	88	1
8921	37	87	1
8922	37	86	1
8923	37	85	1
8924	37	84	1
8925	37	83	1
8926	37	82	1
8927	37	81	1
8928	37	80	1
8929	37	79	1
8930	37	78	1
8931	37	77	1
8932	37	76	1
8933	37	75	1
8934	37	74	1
8935	37	73	1
8936	37	72	1
8937	37	71	1
8938	37	70	1
8939	37	69	1
8940	37	68	1
8941	37	67	1
8942	37	66	1
8943	37	65	1
8944	37	64	1
8945	37	63	1
8946	37	62	1
8947	37	61	1
8948	37	60	1
8949	37	59	1
8950	37	58	1
8951	37	57	1
8952	37	56	1
8953	37	55	1
8954	37	54	1
8955	37	53	1
8956	37	52	1
8957	37	51	1
8958	37	50	1
8959	37	49	1
8960	37	48	1
8961	37	47	1
8962	37	46	1
8963	37	45	1
8964	37	44	1
8965	37	43	1
8966	37	42	1
8967	37	41	1
8968	37	40	1
8969	37	39	1
8970	37	38	1
8971	37	37	1
8972	37	36	1
8973	37	35	1
8974	37	34	1
8975	37	33	1
8976	37	32	1
8977	37	31	1
8978	37	30	1
8979	37	29	1
8980	37	28	1
8981	37	27	1
8982	37	26	1
8983	37	25	1
8984	37	24	1
8985	37	23	1
8986	37	22	1
8987	37	21	1
8988	37	20	1
8989	37	19	1
8990	37	18	1
8991	37	17	1
8992	37	16	1
8993	37	15	1
8994	37	14	1
8995	37	13	1
8996	37	12	1
8997	37	11	1
8998	37	10	1
8999	37	9	1
9000	37	8	1
9001	37	7	1
9002	37	6	1
9003	37	5	1
9004	37	4	1
9005	37	3	1
9006	37	2	1
9007	37	1	1
9008	38	96	2
9009	38	95	2
9010	38	94	2
9011	38	93	2
9012	38	92	2
9013	38	91	2
9014	38	90	2
9015	38	89	2
9016	38	88	2
9017	38	87	2
9018	38	86	2
9019	38	85	2
9020	38	84	2
9021	38	83	2
9022	38	82	2
9023	38	81	2
9024	38	80	2
9025	38	79	2
9026	38	78	2
9027	38	77	2
9028	38	76	2
9029	38	75	2
9030	38	74	2
9031	38	73	2
9032	38	72	2
9033	38	71	2
9034	38	70	2
9035	38	69	2
9036	38	68	2
9037	38	67	2
9038	38	66	2
9039	38	65	2
9040	38	64	2
9041	38	63	2
9042	38	62	2
9043	38	61	1
9044	38	60	1
9045	38	59	1
9046	38	58	1
9047	38	57	1
9048	38	56	1
9049	38	55	1
9050	38	54	1
9051	38	53	1
9052	38	52	1
9053	38	51	1
9054	38	50	1
9055	38	49	1
9056	38	48	1
9057	38	47	1
9058	38	46	1
9059	38	45	1
9060	38	44	1
9061	38	43	1
9062	38	42	1
9063	38	41	1
9064	38	40	1
9065	38	39	1
9066	38	38	1
9067	38	37	1
9068	38	36	1
9069	38	35	1
9070	38	34	1
9071	38	33	1
9072	38	32	1
9073	38	31	1
9074	38	30	1
9075	38	29	1
9076	38	28	1
9077	38	27	1
9078	38	26	1
9079	38	25	1
9080	38	24	1
9081	38	23	1
9082	38	22	1
9083	38	21	1
9084	38	20	1
9085	38	19	1
9086	38	18	1
9087	38	17	1
9088	38	16	1
9089	38	15	1
9090	38	14	1
9091	38	13	1
9092	38	12	1
9093	38	11	1
9094	38	10	1
9095	38	9	1
9096	38	8	1
9097	38	7	1
9098	38	6	1
9099	38	5	1
9100	38	4	1
9101	38	3	1
9102	38	2	1
9103	38	1	1
9104	39	83	1
9105	39	82	1
9106	39	81	1
9107	39	80	1
9108	39	79	1
9109	39	78	1
9110	39	77	1
9111	39	76	1
9112	39	75	1
9113	39	74	1
9114	39	73	1
9115	39	72	1
9116	39	71	1
9117	39	70	1
9118	39	69	1
9119	39	68	1
9120	39	67	1
9121	39	66	1
9122	39	65	1
9123	39	64	1
9124	39	63	1
9125	39	62	1
9126	39	61	1
9127	39	60	1
9128	39	59	1
9129	39	58	1
9130	39	57	1
9131	39	56	1
9132	39	55	1
9133	39	54	1
9134	39	53	1
9135	39	52	1
9136	39	51	1
9137	39	50	1
9138	39	49	1
9139	39	48	1
9140	39	47	1
9141	39	46	1
9142	39	45	1
9143	39	44	1
9144	39	43	1
9145	39	42	1
9146	39	41	1
9147	39	40	1
9148	39	39	1
9149	39	38	1
9150	39	37	1
9151	39	36	1
9152	39	35	1
9153	39	34	1
9154	39	33	1
9155	39	32	1
9156	39	31	1
9157	39	30	1
9158	39	29	1
9159	39	28	1
9160	39	27	1
9161	39	26	1
9162	39	25	1
9163	39	24	1
9164	39	23	1
9165	39	22	1
9166	39	21	1
9167	39	20	1
9168	39	19	1
9169	39	18	1
9170	39	17	1
9171	39	16	1
9172	39	15	1
9173	39	14	1
9174	39	13	1
9175	39	12	1
9176	39	11	1
9177	39	10	1
9178	39	9	1
9179	39	8	1
9180	39	7	1
9181	39	6	1
9182	39	5	1
9183	39	4	1
9184	39	3	1
9185	39	2	1
9186	39	1	1
9187	39	0	1
9188	40	432	3
9189	40	431	3
9190	40	430	3
9191	40	429	3
9192	40	428	3
9193	40	427	3
9194	40	426	3
9195	40	425	3
9196	40	424	3
9197	40	423	3
9198	40	422	3
9199	40	421	3
9200	40	420	3
9201	40	419	3
9202	40	418	3
9203	40	417	3
9204	40	416	3
9205	40	415	3
9206	40	414	3
9207	40	413	3
9208	40	412	3
9209	40	411	3
9210	40	410	3
9211	40	409	3
9212	40	408	3
9213	40	407	3
9214	40	406	3
9215	40	405	3
9216	40	404	3
9217	40	403	3
9218	40	402	3
9219	40	401	3
9220	40	400	3
9221	40	399	3
9222	40	398	3
9223	40	397	3
9224	40	396	3
9225	40	395	3
9226	40	394	3
9227	40	393	3
9228	40	392	3
9229	40	391	3
9230	40	390	3
9231	40	389	3
9232	40	388	3
9233	40	387	3
9234	40	386	3
9235	40	385	3
9236	40	384	3
9237	40	383	3
9238	40	382	3
9239	40	381	3
9240	40	380	3
9241	40	379	3
9242	40	378	3
9243	40	377	3
9244	40	376	3
9245	40	375	3
9246	40	374	3
9247	40	373	3
9248	40	372	3
9249	40	371	3
9250	40	370	3
9251	40	369	3
9252	40	368	3
9253	40	367	3
9254	40	366	3
9255	40	365	3
9256	40	364	3
9257	40	363	3
9258	40	362	3
9259	40	361	3
9260	40	360	3
9261	40	359	3
9262	40	358	3
9263	40	357	3
9264	40	356	3
9265	40	355	3
9266	40	354	1
9267	40	353	1
9268	40	352	1
9269	40	351	1
9270	40	350	1
9271	40	349	1
9272	40	348	1
9273	40	347	1
9274	40	346	1
9275	40	345	1
9276	40	344	1
9277	40	343	1
9278	40	342	1
9279	40	341	1
9280	40	340	1
9281	40	339	1
9282	40	338	1
9283	40	337	1
9284	40	336	1
9285	40	335	1
9286	40	334	1
9287	40	333	1
9288	40	332	1
9289	40	331	1
9290	40	330	1
9291	40	329	1
9292	40	328	1
9293	40	327	1
9294	40	326	1
9295	40	325	1
9296	40	324	1
9297	40	323	1
9298	40	322	1
9299	40	321	1
9300	40	320	1
9301	40	319	1
9302	40	318	1
9303	40	317	1
9304	40	316	1
9305	40	315	1
9306	40	314	1
9307	40	313	1
9308	40	312	1
9309	40	311	1
9310	40	310	1
9311	40	309	1
9312	40	308	1
9313	40	307	1
9314	40	306	1
9315	40	305	1
9316	40	304	1
9317	40	303	1
9318	40	302	1
9319	40	301	1
9320	40	300	1
9321	40	299	1
9322	40	298	1
9323	40	297	1
9324	40	296	1
9325	40	295	1
9326	40	294	1
9327	40	293	1
9328	40	292	1
9329	40	291	1
9330	40	290	1
9331	40	289	1
9332	40	288	1
9333	40	287	1
9334	40	286	1
9335	40	285	1
9336	40	284	1
9337	40	283	1
9338	40	282	1
9339	40	281	1
9340	40	280	1
9341	40	279	1
9342	40	278	1
9343	40	277	1
9344	40	276	1
9345	40	275	1
9346	40	274	1
9347	40	273	1
9348	40	272	1
9349	40	271	1
9350	40	270	1
9351	40	269	1
9352	40	268	1
9353	40	267	1
9354	40	266	1
9355	40	265	1
9356	40	264	1
9357	40	263	1
9358	40	262	1
9359	40	261	1
9360	40	260	1
9361	40	259	1
9362	40	258	1
9363	40	257	1
9364	40	256	1
9365	40	255	1
9366	40	254	1
9367	40	253	1
9368	40	252	1
9369	40	251	1
9370	40	250	1
9371	40	249	1
9372	40	248	1
9373	40	247	1
9374	40	246	1
9375	40	245	1
9376	40	244	1
9377	40	243	1
9378	40	242	1
9379	40	241	1
9380	40	240	1
9381	40	239	1
9382	40	238	1
9383	40	237	1
9384	40	236	1
9385	40	235	1
9386	40	234	1
9387	40	233	1
9388	40	232	1
9389	40	231	1
9390	40	230	1
9391	40	229	1
9392	40	228	1
9393	40	227	1
9394	40	226	1
9395	40	225	1
9396	40	224	1
9397	40	223	1
9398	40	222	1
9399	40	221	1
9400	40	220	1
9401	40	219	1
9402	40	218	1
9403	40	217	1
9404	40	216	1
9405	40	215	1
9406	40	214	1
9407	40	213	1
9408	40	212	1
9409	40	211	1
9410	40	210	1
9411	40	209	1
9412	40	208	1
9413	40	207	1
9414	40	206	1
9415	40	205	1
9416	40	204	1
9417	40	203	1
9418	40	202	1
9419	40	201	1
9420	40	200	1
9421	40	199	1
9422	40	198	1
9423	40	197	1
9424	40	196	1
9425	40	195	1
9426	40	194	1
9427	40	193	1
9428	40	192	1
9429	40	191	1
9430	40	190	1
9431	40	189	1
9432	40	188	1
9433	40	187	1
9434	40	186	1
9435	40	185	1
9436	40	184	1
9437	40	183	1
9438	40	182	1
9439	40	181	1
9440	40	180	1
9441	40	179	1
9442	40	178	1
9443	40	177	1
9444	40	176	1
9445	40	175	1
9446	40	174	1
9447	40	173	1
9448	40	172	1
9449	40	171	1
9450	40	170	1
9451	40	169	1
9452	40	168	1
9453	40	167	1
9454	40	166	1
9455	40	165	1
9456	40	164	1
9457	40	163	1
9458	40	162	1
9459	40	161	1
9460	40	160	1
9461	40	159	1
9462	40	158	1
9463	40	157	1
9464	40	156	1
9465	40	155	1
9466	40	154	1
9467	40	153	1
9468	40	152	1
9469	40	151	1
9470	40	150	1
9471	40	149	1
9472	40	148	1
9473	40	147	1
9474	40	146	1
9475	40	145	1
9476	40	144	1
9477	40	143	1
9478	40	142	1
9479	40	141	1
9480	40	140	1
9481	40	139	1
9482	40	138	1
9483	40	137	1
9484	40	136	1
9485	40	135	1
9486	40	134	1
9487	40	133	1
9488	40	132	1
9489	40	131	1
9490	40	130	1
9491	40	129	1
9492	40	128	1
9493	40	127	1
9494	40	126	1
9495	40	125	1
9496	40	124	1
9497	40	123	1
9498	40	122	1
9499	40	121	1
9500	40	120	1
9501	40	119	1
9502	40	118	1
9503	40	117	1
9504	40	116	1
9505	40	115	1
9506	40	114	1
9507	40	113	1
9508	40	112	1
9509	40	111	1
9510	40	110	1
9511	40	109	1
9512	40	108	1
9513	40	107	1
9514	40	106	1
9515	40	105	1
9516	40	104	1
9517	40	103	1
9518	40	102	1
9519	40	101	1
9520	40	100	1
9521	40	99	1
9522	40	98	1
9523	40	97	1
9524	40	96	1
9525	40	95	1
9526	40	94	1
9527	40	93	1
9528	40	92	1
9529	40	91	1
9530	40	90	1
9531	40	89	1
9532	40	88	1
9533	40	87	1
9534	40	86	1
9535	40	85	1
9536	40	84	1
9537	40	83	1
9538	40	82	1
9539	40	81	1
9540	40	80	1
9541	40	79	1
9542	40	78	1
9543	40	77	1
9544	40	76	1
9545	40	75	1
9546	40	74	1
9547	40	73	1
9548	40	72	1
9549	40	71	1
9550	40	70	1
9551	40	69	1
9552	40	68	1
9553	40	67	1
9554	40	66	1
9555	40	65	1
9556	40	64	1
9557	40	63	1
9558	40	62	1
9559	40	61	1
9560	40	60	1
9561	40	59	1
9562	40	58	1
9563	40	57	1
9564	40	56	1
9565	40	55	1
9566	40	54	1
9567	40	53	1
9568	40	52	1
9569	40	51	1
9570	40	50	1
9571	40	49	1
9572	40	48	1
9573	40	47	1
9574	40	46	1
9575	40	45	1
9576	40	44	1
9577	40	43	1
9578	40	42	1
9579	40	41	1
9580	40	40	1
9581	40	39	1
9582	40	38	1
9583	40	37	1
9584	40	36	1
9585	40	35	1
9586	40	34	1
9587	40	33	1
9588	40	32	1
9589	40	31	1
9590	40	30	1
9591	40	29	1
9592	40	28	1
9593	40	27	1
9594	40	26	1
9595	40	25	1
9596	40	24	1
9597	40	23	1
9598	40	22	1
9599	40	21	1
9600	40	20	1
9601	40	19	1
9602	40	18	1
9603	40	17	1
9604	40	16	1
9605	40	15	1
9606	40	14	1
9607	40	13	1
9608	40	12	1
9609	40	11	1
9610	40	10	1
9611	40	9	1
9612	40	8	1
9613	40	7	1
9614	40	6	1
9615	40	5	1
9616	40	4	1
9617	40	3	1
9618	40	2	1
9619	40	1	1
9620	41	550	1
9621	41	549	1
9622	41	548	1
9623	41	547	1
9624	41	546	1
9625	41	545	1
9626	41	544	1
9627	41	543	1
9628	41	542	1
9629	41	541	1
9630	41	540	1
9631	41	539	1
9632	41	538	1
9633	41	537	1
9634	41	536	1
9635	41	535	1
9636	41	534	1
9637	41	533	1
9638	41	532	1
9639	41	531	1
9640	41	530	1
9641	41	529	1
9642	41	528	1
9643	41	527	1
9644	41	526	1
9645	41	525	1
9646	41	524	1
9647	41	523	1
9648	41	522	1
9649	41	521	1
9650	41	520	1
9651	41	519	1
9652	41	518	1
9653	41	517	1
9654	41	516	1
9655	41	515	1
9656	41	514	1
9657	41	513	1
9658	41	512	1
9659	41	511	1
9660	41	510	1
9661	41	509	1
9662	41	508	1
9663	41	507	1
9664	41	506	1
9665	41	505	1
9666	41	504	1
9667	41	503	1
9668	41	502	1
9669	41	501	1
9670	41	500	1
9671	41	499	1
9672	41	498	1
9673	41	497	1
9674	41	496	1
9675	41	495	1
9676	41	494	1
9677	41	493	1
9678	41	492	1
9679	41	491	1
9680	41	490	1
9681	41	489	1
9682	41	488	1
9683	41	487	1
9684	41	486	1
9685	41	485	1
9686	41	484	1
9687	41	483	1
9688	41	482	1
9689	41	481	1
9690	41	480	1
9691	41	479	1
9692	41	478	1
9693	41	477	1
9694	41	476	1
9695	41	475	1
9696	41	474	1
9697	41	473	1
9698	41	472	1
9699	41	471	1
9700	41	470	1
9701	41	469	1
9702	41	468	1
9703	41	467	1
9704	41	466	1
9705	41	465	1
9706	41	464	1
9707	41	463	1
9708	41	462	1
9709	41	461	1
9710	41	460	1
9711	41	459	1
9712	41	458	1
9713	41	457	1
9714	41	456	1
9715	41	455	1
9716	41	454	1
9717	41	453	1
9718	41	452	1
9719	41	451	1
9720	41	450	1
9721	41	449	1
9722	41	448	1
9723	41	447	1
9724	41	446	1
9725	41	445	1
9726	41	444	1
9727	41	443	1
9728	41	442	1
9729	41	441	1
9730	41	440	1
9731	41	439	1
9732	41	438	1
9733	41	437	1
9734	41	436	1
9735	41	435	1
9736	41	434	1
9737	41	433	1
9738	41	432	1
9739	41	431	1
9740	41	430	1
9741	41	429	1
9742	41	428	1
9743	41	427	1
9744	41	426	1
9745	41	425	1
9746	41	424	1
9747	41	423	1
9748	41	422	1
9749	41	421	1
9750	41	420	1
9751	41	419	1
9752	41	418	1
9753	41	417	1
9754	41	416	1
9755	41	415	1
9756	41	414	1
9757	41	413	1
9758	41	412	1
9759	41	411	1
9760	41	410	1
9761	41	409	1
9762	41	408	1
9763	41	407	1
9764	41	406	1
9765	41	405	1
9766	41	404	1
9767	41	403	1
9768	41	402	1
9769	41	401	1
9770	41	400	1
9771	41	399	1
9772	41	398	1
9773	41	397	1
9774	41	396	1
9775	41	395	1
9776	41	394	1
9777	41	393	1
9778	41	392	1
9779	41	391	1
9780	41	390	1
9781	41	389	1
9782	41	388	1
9783	41	387	1
9784	41	386	1
9785	41	385	1
9786	41	384	1
9787	41	383	1
9788	41	382	1
9789	41	381	1
9790	41	380	1
9791	41	379	1
9792	41	378	1
9793	41	377	1
9794	41	376	1
9795	41	375	1
9796	41	374	1
9797	41	373	1
9798	41	372	1
9799	41	371	1
9800	41	370	1
9801	41	369	1
9802	41	368	1
9803	41	367	1
9804	41	366	1
9805	41	365	1
9806	41	364	1
9807	41	363	1
9808	41	362	1
9809	41	361	1
9810	41	360	1
9811	41	359	1
9812	41	358	1
9813	41	357	1
9814	41	356	1
9815	41	355	1
9816	41	354	1
9817	41	353	1
9818	41	352	1
9819	41	351	1
9820	41	350	1
9821	41	349	1
9822	41	348	1
9823	41	347	1
9824	41	346	1
9825	41	345	1
9826	41	344	1
9827	41	343	1
9828	41	342	1
9829	41	341	1
9830	41	340	1
9831	41	339	1
9832	41	338	1
9833	41	337	1
9834	41	336	1
9835	41	335	1
9836	41	334	1
9837	41	333	1
9838	41	332	1
9839	41	331	1
9840	41	330	1
9841	41	329	1
9842	41	328	1
9843	41	327	1
9844	41	326	1
9845	41	325	1
9846	41	324	1
9847	41	323	1
9848	41	322	1
9849	41	321	1
9850	41	320	1
9851	41	319	1
9852	41	318	1
9853	41	317	1
9854	41	316	1
9855	41	315	1
9856	41	314	1
9857	41	313	1
9858	41	312	1
9859	41	311	1
9860	41	310	1
9861	41	309	1
9862	41	308	1
9863	41	307	1
9864	41	306	1
9865	41	305	1
9866	41	304	1
9867	41	303	1
9868	41	302	1
9869	41	301	1
9870	41	300	1
9871	41	299	1
9872	41	298	1
9873	41	297	1
9874	41	296	1
9875	41	295	1
9876	41	294	1
9877	41	293	1
9878	41	292	1
9879	41	291	1
9880	41	290	1
9881	41	289	1
9882	41	288	1
9883	41	287	1
9884	41	286	1
9885	41	285	1
9886	41	284	1
9887	41	283	1
9888	41	282	1
9889	41	281	1
9890	41	280	1
9891	41	279	1
9892	41	278	1
9893	41	277	1
9894	41	276	1
9895	41	275	1
9896	41	274	1
9897	41	273	1
9898	41	272	1
9899	41	271	1
9900	41	270	1
9901	41	269	1
9902	41	268	1
9903	41	267	1
9904	41	266	1
9905	41	265	1
9906	41	264	1
9907	41	263	1
9908	41	262	1
9909	41	261	1
9910	41	260	1
9911	41	259	1
9912	41	258	1
9913	41	257	1
9914	41	256	1
9915	41	255	1
9916	41	254	1
9917	41	253	1
9918	41	252	1
9919	41	251	1
9920	41	250	1
9921	41	249	1
9922	41	248	1
9923	41	247	1
9924	41	246	1
9925	41	245	1
9926	41	244	1
9927	41	243	1
9928	41	242	1
9929	41	241	1
9930	41	240	1
9931	41	239	1
9932	41	238	1
9933	41	237	1
9934	41	236	1
9935	41	235	1
9936	41	234	1
9937	41	233	1
9938	41	232	1
9939	41	231	1
9940	41	230	1
9941	41	229	1
9942	41	228	1
9943	41	227	1
9944	41	226	1
9945	41	225	1
9946	41	224	1
9947	41	223	1
9948	41	222	1
9949	41	221	1
9950	41	220	1
9951	41	219	1
9952	41	218	1
9953	41	217	1
9954	41	216	1
9955	41	215	1
9956	41	214	1
9957	41	213	1
9958	41	212	1
9959	41	211	1
9960	41	210	1
9961	41	209	1
9962	41	208	1
9963	41	207	1
9964	41	206	1
9965	41	205	1
9966	41	204	1
9967	41	203	1
9968	41	202	1
9969	41	201	1
9970	41	200	1
9971	41	199	1
9972	41	198	1
9973	41	197	1
9974	41	196	1
9975	41	195	1
9976	41	194	1
9977	41	193	1
9978	41	192	1
9979	41	191	1
9980	41	190	1
9981	41	189	1
9982	41	188	1
9983	41	187	1
9984	41	186	1
9985	41	185	1
9986	41	184	1
9987	41	183	1
9988	41	182	1
9989	41	181	1
9990	41	180	1
9991	41	179	1
9992	41	178	1
9993	41	177	1
9994	41	176	1
9995	41	175	1
9996	41	174	1
9997	41	173	1
9998	41	172	1
9999	41	171	1
10000	41	170	1
10001	41	169	1
10002	41	168	1
10003	41	167	1
10004	41	166	1
10005	41	165	1
10006	41	164	1
10007	41	163	1
10008	41	162	1
10009	41	161	1
10010	41	160	1
10011	41	159	1
10012	41	158	1
10013	41	157	1
10014	41	156	1
10015	41	155	1
10016	41	154	1
10017	41	153	1
10018	41	152	1
10019	41	151	1
10020	41	150	1
10021	41	149	1
10022	41	148	1
10023	41	147	1
10024	41	146	1
10025	41	145	1
10026	41	144	1
10027	41	143	1
10028	41	142	1
10029	41	141	1
10030	41	140	1
10031	41	139	1
10032	41	138	1
10033	41	137	1
10034	41	136	1
10035	41	135	1
10036	41	134	1
10037	41	133	1
10038	41	132	1
10039	41	131	1
10040	41	130	1
10041	41	129	1
10042	41	128	1
10043	41	127	1
10044	41	126	1
10045	41	125	1
10046	41	124	1
10047	41	123	1
10048	41	122	1
10049	41	121	1
10050	41	120	1
10051	41	119	1
10052	41	118	1
10053	41	117	1
10054	41	116	1
10055	41	115	1
10056	41	114	1
10057	41	113	1
10058	41	112	1
10059	41	111	1
10060	41	110	1
10061	41	109	1
10062	41	108	1
10063	41	107	1
10064	41	106	1
10065	41	105	1
10066	41	104	1
10067	41	103	1
10068	41	102	1
10069	41	101	1
10070	41	100	1
10071	41	99	1
10072	41	98	1
10073	41	97	1
10074	41	96	1
10075	41	95	1
10076	41	94	1
10077	41	93	1
10078	41	92	1
10079	41	91	1
10080	41	90	1
10081	41	89	1
10082	41	88	1
10083	41	87	1
10084	41	86	1
10085	41	85	1
10086	41	84	1
10087	41	83	1
10088	41	82	1
10089	41	81	1
10090	41	80	1
10091	41	79	1
10092	41	78	1
10093	41	77	1
10094	41	76	1
10095	41	75	1
10096	41	74	1
10097	41	73	1
10098	41	72	1
10099	41	71	1
10100	41	70	1
10101	41	69	1
10102	41	68	1
10103	41	67	1
10104	41	66	1
10105	41	65	1
10106	41	64	1
10107	41	63	1
10108	41	62	1
10109	41	61	1
10110	41	60	1
10111	41	59	1
10112	41	58	1
10113	41	57	1
10114	41	56	1
10115	41	55	1
10116	41	54	1
10117	41	53	1
10118	41	52	1
10119	41	51	1
10120	41	50	1
10121	41	49	1
10122	41	48	1
10123	41	47	1
10124	41	46	1
10125	41	45	1
10126	41	44	1
10127	41	43	1
10128	41	42	1
10129	41	41	1
10130	41	40	1
10131	41	39	1
10132	41	38	1
10133	41	37	1
10134	41	36	1
10135	41	35	1
10136	41	34	1
10137	41	33	1
10138	41	32	1
10139	41	31	1
10140	41	30	1
10141	41	29	1
10142	41	28	1
10143	41	27	1
10144	41	26	1
10145	41	25	1
10146	41	24	1
10147	41	23	1
10148	41	22	1
10149	41	21	1
10150	41	20	1
10151	41	19	1
10152	41	18	1
10153	41	17	1
10154	41	16	1
10155	41	15	1
10156	41	14	1
10157	41	13	1
10158	41	12	1
10159	41	11	1
10160	41	10	1
10161	41	9	1
10162	41	8	1
10163	41	7	1
10164	41	6	1
10165	41	5	1
10166	41	4	1
10167	41	3	1
10168	41	2	1
10169	41	1	1
10170	41	0	1
10171	42	97	1
10172	42	96	1
10173	42	95	1
10174	42	94	1
10175	42	93	1
10176	42	92	1
10177	42	91	1
10178	42	90	1
10179	42	89	1
10180	42	88	1
10181	42	87	1
10182	42	86	1
10183	42	85	1
10184	42	84	1
10185	42	83	1
10186	42	82	1
10187	42	81	1
10188	42	80	1
10189	42	79	1
10190	42	78	1
10191	42	77	1
10192	42	76	1
10193	42	75	1
10194	42	74	1
10195	42	73	1
10196	42	72	1
10197	42	71	1
10198	42	70	1
10199	42	69	1
10200	42	68	1
10201	42	67	1
10202	42	66	1
10203	42	65	1
10204	42	64	1
10205	42	63	1
10206	42	62	1
10207	42	61	1
10208	42	60	1
10209	42	59	1
10210	42	58	1
10211	42	57	1
10212	42	56	1
10213	42	55	1
10214	42	54	1
10215	42	53	1
10216	42	52	1
10217	42	51	1
10218	42	50	1
10219	42	49	1
10220	42	48	1
10221	42	47	1
10222	42	46	1
10223	42	45	1
10224	42	44	1
10225	42	43	1
10226	42	42	1
10227	42	41	1
10228	42	40	1
10229	42	39	1
10230	42	38	1
10231	42	37	1
10232	42	36	1
10233	42	35	1
10234	42	34	1
10235	42	33	1
10236	42	32	1
10237	42	31	1
10238	42	30	1
10239	42	29	1
10240	42	28	1
10241	42	27	1
10242	42	26	1
10243	42	25	1
10244	42	24	1
10245	42	23	1
10246	42	22	1
10247	42	21	1
10248	42	20	1
10249	42	19	1
10250	42	18	1
10251	42	17	1
10252	42	16	1
10253	42	15	1
10254	42	14	1
10255	42	13	1
10256	42	12	1
10257	42	11	1
10258	42	10	1
10259	42	9	1
10260	42	8	1
10261	42	7	1
10262	42	6	1
10263	42	5	1
10264	42	4	1
10265	42	3	1
10266	42	2	1
10267	42	1	1
10268	43	68	1
10269	43	67	1
10270	43	66	1
10271	43	65	1
10272	43	64	1
10273	43	63	1
10274	43	62	1
10275	43	61	1
10276	43	60	1
10277	43	59	1
10278	43	58	1
10279	43	57	1
10280	43	56	1
10281	43	55	1
10282	43	54	1
10283	43	53	1
10284	43	52	1
10285	43	51	1
10286	43	50	1
10287	43	49	1
10288	43	48	1
10289	43	47	1
10290	43	46	1
10291	43	45	1
10292	43	44	1
10293	43	43	1
10294	43	42	1
10295	43	41	1
10296	43	40	1
10297	43	39	1
10298	43	38	1
10299	43	37	1
10300	43	36	1
10301	43	35	1
10302	43	34	1
10303	43	33	1
10304	43	32	1
10305	43	31	1
10306	43	30	1
10307	43	29	1
10308	43	28	1
10309	43	27	1
10310	43	26	1
10311	43	25	1
10312	43	24	1
10313	43	23	1
10314	43	22	1
10315	43	21	1
10316	43	20	1
10317	43	19	1
10318	43	18	1
10319	43	17	1
10320	43	16	1
10321	43	15	1
10322	43	14	1
10323	43	13	1
10324	43	12	1
10325	43	11	1
10326	43	10	1
10327	43	9	1
10328	43	8	1
10329	43	7	1
10330	43	6	1
10331	43	5	1
10332	43	4	1
10333	43	3	1
10334	43	2	1
10335	43	1	1
10336	44	57	1
10337	44	56	1
10338	44	55	1
10339	44	54	1
10340	44	53	1
10341	44	52	1
10342	44	51	1
10343	44	50	1
10344	44	49	1
10345	44	48	1
10346	44	47	1
10347	44	46	1
10348	44	45	1
10349	44	44	1
10350	44	43	1
10351	44	42	1
10352	44	41	1
10353	44	40	1
10354	44	39	1
10355	44	38	1
10356	44	37	1
10357	44	36	1
10358	44	35	1
10359	44	34	1
10360	44	33	1
10361	44	32	1
10362	44	31	1
10363	44	30	1
10364	44	29	1
10365	44	28	1
10366	44	27	1
10367	44	26	1
10368	44	25	1
10369	44	24	1
10370	44	23	1
10371	44	22	1
10372	44	21	1
10373	44	20	1
10374	44	19	1
10375	44	18	1
10376	44	17	1
10377	44	16	1
10378	44	15	1
10379	44	14	1
10380	44	13	1
10381	44	12	1
10382	44	11	1
10383	44	10	1
10384	44	9	1
10385	44	8	1
10386	44	7	1
10387	44	6	1
10388	44	5	1
10389	44	4	1
10390	44	3	1
10391	44	2	1
10392	44	1	1
10393	45	22	1
10394	45	21	1
10395	45	20	1
10396	45	19	1
10397	45	18	1
10398	45	17	1
10399	45	16	1
10400	45	15	1
10401	45	14	1
10402	45	13	1
10403	45	12	1
10404	45	11	1
10405	45	10	1
10406	45	9	1
10407	45	8	1
10408	45	7	1
10409	45	6	1
10410	45	5	1
10411	45	4	1
10412	45	3	1
10413	45	2	1
10414	45	1	1
10415	46	129	2
10416	46	128	2
10417	46	127	2
10418	46	126	2
10419	46	125	2
10420	46	124	2
10421	46	123	2
10422	46	122	2
10423	46	121	2
10424	46	120	2
10425	46	119	2
10426	46	118	2
10427	46	117	2
10428	46	116	2
10429	46	115	2
10430	46	114	2
10431	46	113	2
10432	46	112	2
10433	46	111	2
10434	46	110	2
10435	46	109	2
10436	46	108	2
10437	46	107	2
10438	46	106	2
10439	46	105	2
10440	46	104	2
10441	46	103	2
10442	46	102	2
10443	46	101	2
10444	46	100	2
10445	46	99	2
10446	46	98	2
10447	46	97	2
10448	46	96	2
10449	46	95	2
10450	46	94	2
10451	46	93	2
10452	46	92	2
10453	46	91	2
10454	46	90	2
10455	46	89	2
10456	46	88	2
10457	46	87	2
10458	46	86	2
10459	46	85	2
10460	46	84	2
10461	46	83	2
10462	46	82	2
10463	46	81	2
10464	46	80	2
10465	46	79	2
10466	46	78	2
10467	46	77	2
10468	46	76	2
10469	46	75	2
10470	46	74	2
10471	46	73	2
10472	46	72	2
10473	46	71	2
10474	46	70	2
10475	46	69	2
10476	46	68	2
10477	46	67	2
10478	46	66	2
10479	46	65	2
10480	46	64	2
10481	46	63	2
10482	46	62	2
10483	46	61	2
10484	46	60	2
10485	46	59	2
10486	46	58	2
10487	46	57	2
10488	46	56	2
10489	46	55	2
10490	46	54	2
10491	46	53	2
10492	46	52	2
10493	46	51	2
10494	46	50	1
10495	46	49	1
10496	46	48	1
10497	46	47	1
10498	46	46	1
10499	46	45	1
10500	46	44	1
10501	46	43	1
10502	46	42	1
10503	46	41	1
10504	46	40	1
10505	46	39	1
10506	46	38	1
10507	46	37	1
10508	46	36	1
10509	46	35	1
10510	46	34	1
10511	46	33	1
10512	46	32	1
10513	46	31	1
10514	46	30	1
10515	46	29	1
10516	46	28	1
10517	46	27	1
10518	46	26	1
10519	46	25	1
10520	46	24	1
10521	46	23	1
10522	46	22	1
10523	46	21	1
10524	46	20	1
10525	46	19	1
10526	46	18	1
10527	46	17	1
10528	46	16	1
10529	46	15	1
10530	46	14	1
10531	46	13	1
10532	46	12	1
10533	46	11	1
10534	46	10	1
10535	46	9	1
10536	46	8	1
10537	46	7	1
10538	46	6	1
10539	46	5	1
10540	46	4	1
10541	46	3	1
10542	46	2	1
10543	46	1	1
10544	47	53	1
10545	47	52	1
10546	47	51	1
10547	47	50	1
10548	47	49	1
10549	47	48	1
10550	47	47	1
10551	47	46	1
10552	47	45	1
10553	47	44	1
10554	47	43	1
10555	47	42	1
10556	47	41	1
10557	47	40	1
10558	47	39	1
10559	47	38	1
10560	47	37	1
10561	47	36	1
10562	47	35	1
10563	47	34	1
10564	47	33	1
10565	47	32	1
10566	47	31	1
10567	47	30	1
10568	47	29	1
10569	47	28	1
10570	47	27	1
10571	47	26	1
10572	47	25	1
10573	47	24	1
10574	47	23	1
10575	47	22	1
10576	47	21	1
10577	47	20	1
10578	47	19	1
10579	47	18	1
10580	47	17	1
10581	47	16	1
10582	47	15	1
10583	47	14	1
10584	47	13	1
10585	47	12	1
10586	47	11	1
10587	47	10	1
10588	47	9	1
10589	47	8	1
10590	47	7	1
10591	47	6	1
10592	47	5	1
10593	47	4	1
10594	47	3	1
10595	47	2	1
10596	47	1	1
10597	48	247	1
10598	48	246	1
10599	48	245	1
10600	48	244	1
10601	48	243	1
10602	48	242	1
10603	48	241	1
10604	48	240	1
10605	48	239	1
10606	48	238	1
10607	48	237	1
10608	48	236	1
10609	48	235	1
10610	48	234	1
10611	48	233	1
10612	48	232	1
10613	48	231	1
10614	48	230	1
10615	48	229	1
10616	48	228	1
10617	48	227	1
10618	48	226	1
10619	48	225	1
10620	48	224	1
10621	48	223	1
10622	48	222	1
10623	48	221	1
10624	48	220	1
10625	48	219	1
10626	48	218	1
10627	48	217	1
10628	48	216	1
10629	48	215	1
10630	48	214	1
10631	48	213	1
10632	48	212	1
10633	48	211	1
10634	48	210	1
10635	48	209	1
10636	48	208	1
10637	48	207	1
10638	48	206	1
10639	48	205	1
10640	48	204	1
10641	48	203	1
10642	48	202	1
10643	48	201	1
10644	48	200	1
10645	48	199	1
10646	48	198	1
10647	48	197	1
10648	48	196	1
10649	48	195	1
10650	48	194	1
10651	48	193	1
10652	48	192	1
10653	48	191	1
10654	48	190	1
10655	48	189	1
10656	48	188	1
10657	48	187	1
10658	48	186	1
10659	48	185	1
10660	48	184	1
10661	48	183	1
10662	48	182	1
10663	48	181	1
10664	48	180	1
10665	48	179	1
10666	48	178	1
10667	48	177	1
10668	48	176	1
10669	48	175	1
10670	48	174	1
10671	48	173	1
10672	48	172	1
10673	48	171	1
10674	48	170	1
10675	48	169	1
10676	48	168	1
10677	48	167	1
10678	48	166	1
10679	48	165	1
10680	48	164	1
10681	48	163	1
10682	48	162	1
10683	48	161	1
10684	48	160	1
10685	48	159	1
10686	48	158	1
10687	48	157	1
10688	48	156	1
10689	48	155	1
10690	48	154	1
10691	48	153	1
10692	48	152	1
10693	48	151	1
10694	48	150	1
10695	48	149	1
10696	48	148	1
10697	48	147	1
10698	48	146	1
10699	48	145	1
10700	48	144	1
10701	48	143	1
10702	48	142	1
10703	48	141	1
10704	48	140	1
10705	48	139	1
10706	48	138	1
10707	48	137	1
10708	48	136	1
10709	48	135	1
10710	48	134	1
10711	48	133	1
10712	48	132	1
10713	48	131	1
10714	48	130	1
10715	48	129	1
10716	48	128	1
10717	48	127	1
10718	48	126	1
10719	48	125	1
10720	48	124	1
10721	48	123	1
10722	48	122	1
10723	48	121	1
10724	48	120	1
10725	48	119	1
10726	48	118	1
10727	48	117	1
10728	48	116	1
10729	48	115	1
10730	48	114	1
10731	48	113	1
10732	48	112	1
10733	48	111	1
10734	48	110	1
10735	48	109	1
10736	48	108	1
10737	48	107	1
10738	48	106	1
10739	48	105	1
10740	48	104	1
10741	48	103	1
10742	48	102	1
10743	48	101	1
10744	48	100	1
10745	48	99	1
10746	48	98	1
10747	48	97	1
10748	48	96	1
10749	48	95	1
10750	48	94	1
10751	48	93	1
10752	48	92	1
10753	48	91	1
10754	48	90	1
10755	48	89	1
10756	48	88	1
10757	48	87	1
10758	48	86	1
10759	48	85	1
10760	48	84	1
10761	48	83	1
10762	48	82	1
10763	48	81	1
10764	48	80	1
10765	48	79	1
10766	48	78	1
10767	48	77	1
10768	48	76	1
10769	48	75	1
10770	48	74	1
10771	48	73	1
10772	48	72	1
10773	48	71	1
10774	48	70	1
10775	48	69	1
10776	48	68	1
10777	48	67	1
10778	48	66	1
10779	48	65	1
10780	48	64	1
10781	48	63	1
10782	48	62	1
10783	48	61	1
10784	48	60	1
10785	48	59	1
10786	48	58	1
10787	48	57	1
10788	48	56	1
10789	48	55	1
10790	48	54	1
10791	48	53	1
10792	48	52	1
10793	48	51	1
10794	48	50	1
10795	48	49	1
10796	48	48	1
10797	48	47	1
10798	48	46	1
10799	48	45	1
10800	48	44	1
10801	48	43	1
10802	48	42	1
10803	48	41	1
10804	48	40	1
10805	48	39	1
10806	48	38	1
10807	48	37	1
10808	48	36	1
10809	48	35	1
10810	48	34	1
10811	48	33	1
10812	48	32	1
10813	48	31	1
10814	48	30	1
10815	48	29	1
10816	48	28	1
10817	48	27	1
10818	48	26	1
10819	48	25	1
10820	48	24	1
10821	48	23	1
10822	48	22	1
10823	48	21	1
10824	48	20	1
10825	48	19	1
10826	48	18	1
10827	48	17	1
10828	48	16	1
10829	48	15	1
10830	48	14	1
10831	48	13	1
10832	48	12	1
10833	48	11	1
10834	48	10	1
10835	48	9	1
10836	48	8	1
10837	48	7	1
10838	48	6	1
10839	48	5	1
10840	48	4	1
10841	48	3	1
10842	48	2	1
10843	48	1	1
10844	49	146	3
10845	49	145	3
10846	49	144	3
10847	49	143	3
10848	49	142	2
10849	49	141	2
10850	49	140	2
10851	49	139	2
10852	49	138	2
10853	49	137	2
10854	49	136	2
10855	49	135	2
10856	49	134	2
10857	49	133	2
10858	49	132	2
10859	49	131	2
10860	49	130	2
10861	49	129	2
10862	49	128	2
10863	49	127	2
10864	49	126	2
10865	49	125	2
10866	49	124	2
10867	49	123	2
10868	49	122	2
10869	49	121	2
10870	49	120	2
10871	49	119	2
10872	49	118	2
10873	49	117	2
10874	49	116	2
10875	49	115	2
10876	49	114	2
10877	49	113	2
10878	49	112	2
10879	49	111	2
10880	49	110	2
10881	49	109	2
10882	49	108	2
10883	49	107	2
10884	49	106	2
10885	49	105	2
10886	49	104	2
10887	49	103	2
10888	49	102	2
10889	49	101	2
10890	49	100	2
10891	49	99	2
10892	49	98	2
10893	49	97	2
10894	49	96	2
10895	49	95	2
10896	49	94	2
10897	49	93	2
10898	49	92	2
10899	49	91	2
10900	49	90	2
10901	49	89	2
10902	49	88	2
10903	49	87	2
10904	49	86	2
10905	49	85	2
10906	49	84	2
10907	49	83	2
10908	49	82	2
10909	49	81	2
10910	49	80	2
10911	49	79	2
10912	49	78	2
10913	49	77	2
10914	49	76	2
10915	49	75	1
10916	49	74	1
10917	49	73	1
10918	49	72	1
10919	49	71	1
10920	49	70	1
10921	49	69	1
10922	49	68	1
10923	49	67	1
10924	49	66	1
10925	49	65	1
10926	49	64	1
10927	49	63	1
10928	49	62	1
10929	49	61	1
10930	49	60	1
10931	49	59	1
10932	49	58	1
10933	49	57	1
10934	49	56	1
10935	49	55	1
10936	49	54	1
10937	49	53	1
10938	49	52	1
10939	49	51	1
10940	49	50	1
10941	49	49	1
10942	49	48	1
10943	49	47	1
10944	49	46	1
10945	49	45	1
10946	49	44	1
10947	49	43	1
10948	49	42	1
10949	49	41	1
10950	49	40	1
10951	49	39	1
10952	49	38	1
10953	49	37	1
10954	49	36	1
10955	49	35	1
10956	49	34	1
10957	49	33	1
10958	49	32	1
10959	49	31	1
10960	49	30	1
10961	49	29	1
10962	49	28	1
10963	49	27	1
10964	49	26	1
10965	49	25	1
10966	49	24	1
10967	49	23	1
10968	49	22	1
10969	49	21	1
10970	49	20	1
10971	49	19	1
10972	49	18	1
10973	49	17	1
10974	49	16	1
10975	49	15	1
10976	49	14	1
10977	49	13	1
10978	49	12	1
10979	49	11	1
10980	49	10	1
10981	49	9	1
10982	49	8	1
10983	49	7	1
10984	49	6	1
10985	49	5	1
10986	49	4	1
10987	49	3	1
10988	49	2	1
10989	49	1	1
10990	50	125	3
10991	50	124	3
10992	50	123	3
10993	50	122	3
10994	50	121	3
10995	50	120	3
10996	50	119	3
10997	50	118	2
10998	50	117	2
10999	50	116	2
11000	50	115	2
11001	50	114	2
11002	50	113	2
11003	50	112	2
11004	50	111	2
11005	50	110	2
11006	50	109	2
11007	50	108	2
11008	50	107	2
11009	50	106	2
11010	50	105	2
11011	50	104	2
11012	50	103	2
11013	50	102	2
11014	50	101	2
11015	50	100	2
11016	50	99	2
11017	50	98	2
11018	50	97	2
11019	50	96	2
11020	50	95	2
11021	50	94	2
11022	50	93	2
11023	50	92	2
11024	50	91	2
11025	50	90	2
11026	50	89	2
11027	50	88	2
11028	50	87	2
11029	50	86	2
11030	50	85	2
11031	50	84	2
11032	50	83	2
11033	50	82	2
11034	50	81	2
11035	50	80	2
11036	50	79	2
11037	50	78	2
11038	50	77	2
11039	50	76	2
11040	50	75	2
11041	50	74	2
11042	50	73	2
11043	50	72	2
11044	50	71	2
11045	50	70	2
11046	50	69	2
11047	50	68	2
11048	50	67	2
11049	50	66	2
11050	50	65	2
11051	50	64	2
11052	50	63	2
11053	50	62	2
11054	50	61	2
11055	50	60	2
11056	50	59	2
11057	50	58	2
11058	50	57	2
11059	50	56	2
11060	50	55	2
11061	50	54	2
11062	50	53	2
11063	50	52	2
11064	50	51	1
11065	50	50	1
11066	50	49	1
11067	50	48	1
11068	50	47	1
11069	50	46	1
11070	50	45	1
11071	50	44	1
11072	50	43	1
11073	50	42	1
11074	50	41	1
11075	50	40	1
11076	50	39	1
11077	50	38	1
11078	50	37	1
11079	50	36	1
11080	50	35	1
11081	50	34	1
11082	50	33	1
11083	50	32	1
11084	50	31	1
11085	50	30	1
11086	50	29	1
11087	50	28	1
11088	50	27	1
11089	50	26	1
11090	50	25	1
11091	50	24	1
11092	50	23	1
11093	50	22	1
11094	50	21	1
11095	50	20	1
11096	50	19	1
11097	50	18	1
11098	50	17	1
11099	50	16	1
11100	50	15	1
11101	50	14	1
11102	50	13	1
11103	50	12	1
11104	50	11	1
11105	50	10	1
11106	50	9	1
11107	50	8	1
11108	50	7	1
11109	50	6	1
11110	50	5	1
11111	50	4	1
11112	50	3	1
11113	50	2	1
11114	50	1	1
11115	50	0	1
11116	51	96	1
11117	51	95	1
11118	51	94	1
11119	51	93	1
11120	51	92	1
11121	51	91	1
11122	51	90	1
11123	51	89	1
11124	51	88	1
11125	51	87	1
11126	51	86	1
11127	51	85	1
11128	51	84	1
11129	51	83	1
11130	51	82	1
11131	51	81	1
11132	51	80	1
11133	51	79	1
11134	51	78	1
11135	51	77	1
11136	51	76	1
11137	51	75	1
11138	51	74	1
11139	51	73	1
11140	51	72	1
11141	51	71	1
11142	51	70	1
11143	51	69	1
11144	51	68	1
11145	51	67	1
11146	51	66	1
11147	51	65	1
11148	51	64	1
11149	51	63	1
11150	51	62	1
11151	51	61	1
11152	51	60	1
11153	51	59	1
11154	51	58	1
11155	51	57	1
11156	51	56	1
11157	51	55	1
11158	51	54	1
11159	51	53	1
11160	51	52	1
11161	51	51	1
11162	51	50	1
11163	51	49	1
11164	51	48	1
11165	51	47	1
11166	51	46	1
11167	51	45	1
11168	51	44	1
11169	51	43	1
11170	51	42	1
11171	51	41	1
11172	51	40	1
11173	51	39	1
11174	51	38	1
11175	51	37	1
11176	51	36	1
11177	51	35	1
11178	51	34	1
11179	51	33	1
11180	51	32	1
11181	51	31	1
11182	51	30	1
11183	51	29	1
11184	51	28	1
11185	51	27	1
11186	51	26	1
11187	51	25	1
11188	51	24	1
11189	51	23	1
11190	51	22	1
11191	51	21	1
11192	51	20	1
11193	51	19	1
11194	51	18	1
11195	51	17	1
11196	51	16	1
11197	51	15	1
11198	51	14	1
11199	51	13	1
11200	51	12	1
11201	51	11	1
11202	51	10	1
11203	51	9	1
11204	51	8	1
11205	51	7	1
11206	51	6	1
11207	51	5	1
11208	51	4	1
11209	51	3	1
11210	51	2	1
11211	51	1	1
11212	52	178	2
11213	52	177	2
11214	52	176	2
11215	52	175	2
11216	52	174	2
11217	52	173	2
11218	52	172	2
11219	52	171	2
11220	52	170	2
11221	52	169	2
11222	52	168	2
11223	52	167	2
11224	52	166	2
11225	52	165	2
11226	52	164	2
11227	52	163	2
11228	52	162	2
11229	52	161	2
11230	52	160	2
11231	52	159	2
11232	52	158	2
11233	52	157	2
11234	52	156	2
11235	52	155	2
11236	52	154	2
11237	52	153	2
11238	52	152	2
11239	52	151	2
11240	52	150	2
11241	52	149	2
11242	52	148	2
11243	52	147	2
11244	52	146	2
11245	52	145	2
11246	52	144	2
11247	52	143	2
11248	52	142	2
11249	52	141	2
11250	52	140	2
11251	52	139	2
11252	52	138	2
11253	52	137	2
11254	52	136	2
11255	52	135	2
11256	52	134	2
11257	52	133	2
11258	52	132	2
11259	52	131	2
11260	52	130	2
11261	52	129	2
11262	52	128	2
11263	52	127	2
11264	52	126	2
11265	52	125	2
11266	52	124	2
11267	52	123	2
11268	52	122	2
11269	52	121	2
11270	52	120	2
11271	52	119	2
11272	52	118	2
11273	52	117	1
11274	52	116	1
11275	52	115	1
11276	52	114	1
11277	52	113	1
11278	52	112	1
11279	52	111	1
11280	52	110	1
11281	52	109	1
11282	52	108	1
11283	52	107	1
11284	52	106	1
11285	52	105	1
11286	52	104	1
11287	52	103	1
11288	52	102	1
11289	52	101	1
11290	52	100	1
11291	52	99	1
11292	52	98	1
11293	52	97	1
11294	52	96	1
11295	52	95	1
11296	52	94	1
11297	52	93	1
11298	52	92	1
11299	52	91	1
11300	52	90	1
11301	52	89	1
11302	52	88	1
11303	52	87	1
11304	52	86	1
11305	52	85	1
11306	52	84	1
11307	52	83	1
11308	52	82	1
11309	52	81	1
11310	52	80	1
11311	52	79	1
11312	52	78	1
11313	52	77	1
11314	52	76	1
11315	52	75	1
11316	52	74	1
11317	52	73	1
11318	52	72	1
11319	52	71	1
11320	52	70	1
11321	52	69	1
11322	52	68	1
11323	52	67	1
11324	52	66	1
11325	52	65	1
11326	52	64	1
11327	52	63	1
11328	52	62	1
11329	52	61	1
11330	52	60	1
11331	52	59	1
11332	52	58	1
11333	52	57	1
11334	52	56	1
11335	52	55	1
11336	52	54	1
11337	52	53	1
11338	52	52	1
11339	52	51	1
11340	52	50	1
11341	52	49	1
11342	52	48	1
11343	52	47	1
11344	52	46	1
11345	52	45	1
11346	52	44	1
11347	52	43	1
11348	52	42	1
11349	52	41	1
11350	52	40	1
11351	52	39	1
11352	52	38	1
11353	52	37	1
11354	52	36	1
11355	52	35	1
11356	52	34	1
11357	52	33	1
11358	52	32	1
11359	52	31	1
11360	52	30	1
11361	52	29	1
11362	52	28	1
11363	52	27	1
11364	52	26	1
11365	52	25	1
11366	52	24	1
11367	52	23	1
11368	52	22	1
11369	52	21	1
11370	52	20	1
11371	52	19	1
11372	52	18	1
11373	52	17	1
11374	52	16	1
11375	52	15	1
11376	52	14	1
11377	52	13	1
11378	52	12	1
11379	52	11	1
11380	52	10	1
11381	52	9	1
11382	52	8	1
11383	52	7	1
11384	52	6	1
11385	52	5	1
11386	52	4	1
11387	52	3	1
11388	52	2	1
11389	52	1	1
11390	53	1133	3
11391	53	1132	3
11392	53	1131	3
11393	53	1130	3
11394	53	1129	3
11395	53	1128	3
11396	53	1127	3
11397	53	1126	3
11398	53	1125	3
11399	53	1124	3
11400	53	1123	3
11401	53	1122	3
11402	53	1121	3
11403	53	1120	3
11404	53	1119	3
11405	53	1118	3
11406	53	1117	3
11407	53	1116	3
11408	53	1115	3
11409	53	1114	3
11410	53	1113	2
11411	53	1112	2
11412	53	1111	2
11413	53	1110	2
11414	53	1109	2
11415	53	1108	2
11416	53	1107	2
11417	53	1106	2
11418	53	1105	2
11419	53	1104	2
11420	53	1103	2
11421	53	1102	2
11422	53	1101	2
11423	53	1100	2
11424	53	1099	2
11425	53	1098	2
11426	53	1097	2
11427	53	1096	2
11428	53	1095	2
11429	53	1094	2
11430	53	1093	2
11431	53	1092	2
11432	53	1091	2
11433	53	1090	2
11434	53	1089	2
11435	53	1088	2
11436	53	1087	2
11437	53	1086	2
11438	53	1085	2
11439	53	1084	2
11440	53	1083	2
11441	53	1082	2
11442	53	1081	2
11443	53	1080	2
11444	53	1079	2
11445	53	1078	2
11446	53	1077	2
11447	53	1076	2
11448	53	1075	2
11449	53	1074	2
11450	53	1073	2
11451	53	1072	2
11452	53	1071	2
11453	53	1070	2
11454	53	1069	2
11455	53	1068	2
11456	53	1067	2
11457	53	1066	2
11458	53	1065	2
11459	53	1064	2
11460	53	1063	2
11461	53	1062	2
11462	53	1061	2
11463	53	1060	2
11464	53	1059	2
11465	53	1058	2
11466	53	1057	2
11467	53	1056	2
11468	53	1055	2
11469	53	1054	2
11470	53	1053	2
11471	53	1052	2
11472	53	1051	2
11473	53	1050	2
11474	53	1049	2
11475	53	1048	2
11476	53	1047	2
11477	53	1046	2
11478	53	1045	2
11479	53	1044	2
11480	53	1043	2
11481	53	1042	2
11482	53	1041	2
11483	53	1040	2
11484	53	1039	2
11485	53	1038	2
11486	53	1037	2
11487	53	1036	2
11488	53	1035	2
11489	53	1034	2
11490	53	1033	2
11491	53	1032	2
11492	53	1031	2
11493	53	1030	2
11494	53	1029	2
11495	53	1028	2
11496	53	1027	2
11497	53	1026	2
11498	53	1025	2
11499	53	1024	2
11500	53	1023	2
11501	53	1022	2
11502	53	1021	2
11503	53	1020	2
11504	53	1019	2
11505	53	1018	2
11506	53	1017	2
11507	53	1016	2
11508	53	1015	2
11509	53	1014	2
11510	53	1013	2
11511	53	1012	2
11512	53	1011	2
11513	53	1010	2
11514	53	1009	2
11515	53	1008	2
11516	53	1007	2
11517	53	1006	2
11518	53	1005	2
11519	53	1004	2
11520	53	1003	2
11521	53	1002	2
11522	53	1001	2
11523	53	1000	2
11524	53	999	2
11525	53	998	2
11526	53	997	2
11527	53	996	2
11528	53	995	2
11529	53	994	2
11530	53	993	2
11531	53	992	2
11532	53	991	2
11533	53	990	2
11534	53	989	2
11535	53	988	2
11536	53	987	2
11537	53	986	2
11538	53	985	2
11539	53	984	2
11540	53	983	2
11541	53	982	2
11542	53	981	2
11543	53	980	2
11544	53	979	2
11545	53	978	2
11546	53	977	2
11547	53	976	2
11548	53	975	2
11549	53	974	2
11550	53	973	2
11551	53	972	2
11552	53	971	2
11553	53	970	2
11554	53	969	2
11555	53	968	2
11556	53	967	2
11557	53	966	2
11558	53	965	2
11559	53	964	2
11560	53	963	2
11561	53	962	2
11562	53	961	2
11563	53	960	2
11564	53	959	2
11565	53	958	2
11566	53	957	2
11567	53	956	2
11568	53	955	2
11569	53	954	2
11570	53	953	2
11571	53	952	2
11572	53	951	2
11573	53	950	2
11574	53	949	2
11575	53	948	2
11576	53	947	2
11577	53	946	2
11578	53	945	2
11579	53	944	2
11580	53	943	2
11581	53	942	2
11582	53	941	2
11583	53	940	2
11584	53	939	2
11585	53	938	2
11586	53	937	2
11587	53	936	2
11588	53	935	2
11589	53	934	2
11590	53	933	2
11591	53	932	2
11592	53	931	2
11593	53	930	2
11594	53	929	2
11595	53	928	2
11596	53	927	2
11597	53	926	2
11598	53	925	2
11599	53	924	2
11600	53	923	2
11601	53	922	2
11602	53	921	2
11603	53	920	2
11604	53	919	2
11605	53	918	2
11606	53	917	2
11607	53	916	2
11608	53	915	2
11609	53	914	2
11610	53	913	2
11611	53	912	2
11612	53	911	2
11613	53	910	2
11614	53	909	2
11615	53	908	2
11616	53	907	2
11617	53	906	2
11618	53	905	2
11619	53	904	2
11620	53	903	2
11621	53	902	2
11622	53	901	2
11623	53	900	2
11624	53	899	2
11625	53	898	2
11626	53	897	2
11627	53	896	2
11628	53	895	2
11629	53	894	2
11630	53	893	2
11631	53	892	2
11632	53	891	2
11633	53	890	2
11634	53	889	2
11635	53	888	2
11636	53	887	2
11637	53	886	2
11638	53	885	2
11639	53	884	2
11640	53	883	2
11641	53	882	2
11642	53	881	2
11643	53	880	2
11644	53	879	2
11645	53	878	2
11646	53	877	2
11647	53	876	2
11648	53	875	2
11649	53	874	2
11650	53	873	2
11651	53	872	2
11652	53	871	2
11653	53	870	2
11654	53	869	2
11655	53	868	2
11656	53	867	2
11657	53	866	2
11658	53	865	2
11659	53	864	2
11660	53	863	2
11661	53	862	2
11662	53	861	2
11663	53	860	2
11664	53	859	2
11665	53	858	2
11666	53	857	2
11667	53	856	2
11668	53	855	2
11669	53	854	2
11670	53	853	2
11671	53	852	2
11672	53	851	2
11673	53	850	2
11674	53	849	2
11675	53	848	2
11676	53	847	2
11677	53	846	2
11678	53	845	2
11679	53	844	2
11680	53	843	2
11681	53	842	2
11682	53	841	2
11683	53	840	2
11684	53	839	2
11685	53	838	2
11686	53	837	2
11687	53	836	2
11688	53	835	2
11689	53	834	2
11690	53	833	2
11691	53	832	2
11692	53	831	2
11693	53	830	2
11694	53	829	2
11695	53	828	2
11696	53	827	2
11697	53	826	2
11698	53	825	2
11699	53	824	2
11700	53	823	2
11701	53	822	2
11702	53	821	2
11703	53	820	2
11704	53	819	2
11705	53	818	2
11706	53	817	2
11707	53	816	2
11708	53	815	2
11709	53	814	2
11710	53	813	2
11711	53	812	2
11712	53	811	2
11713	53	810	2
11714	53	809	2
11715	53	808	2
11716	53	807	2
11717	53	806	2
11718	53	805	2
11719	53	804	2
11720	53	803	2
11721	53	802	2
11722	53	801	2
11723	53	800	2
11724	53	799	2
11725	53	798	2
11726	53	797	2
11727	53	796	2
11728	53	795	2
11729	53	794	2
11730	53	793	2
11731	53	792	2
11732	53	791	2
11733	53	790	2
11734	53	789	2
11735	53	788	2
11736	53	787	2
11737	53	786	2
11738	53	785	2
11739	53	784	2
11740	53	783	2
11741	53	782	2
11742	53	781	2
11743	53	780	2
11744	53	779	2
11745	53	778	2
11746	53	777	2
11747	53	776	2
11748	53	775	2
11749	53	774	2
11750	53	773	2
11751	53	772	2
11752	53	771	2
11753	53	770	2
11754	53	769	2
11755	53	768	2
11756	53	767	2
11757	53	766	2
11758	53	765	2
11759	53	764	2
11760	53	763	2
11761	53	762	2
11762	53	761	2
11763	53	760	2
11764	53	759	2
11765	53	758	2
11766	53	757	2
11767	53	756	2
11768	53	755	2
11769	53	754	2
11770	53	753	2
11771	53	752	2
11772	53	751	2
11773	53	750	2
11774	53	749	2
11775	53	748	2
11776	53	747	2
11777	53	746	2
11778	53	745	2
11779	53	744	2
11780	53	743	2
11781	53	742	2
11782	53	741	2
11783	53	740	2
11784	53	739	2
11785	53	738	2
11786	53	737	2
11787	53	736	2
11788	53	735	2
11789	53	734	2
11790	53	733	2
11791	53	732	2
11792	53	731	2
11793	53	730	2
11794	53	729	2
11795	53	728	2
11796	53	727	2
11797	53	726	2
11798	53	725	2
11799	53	724	2
11800	53	723	2
11801	53	722	2
11802	53	721	2
11803	53	720	2
11804	53	719	2
11805	53	718	2
11806	53	717	2
11807	53	716	2
11808	53	715	2
11809	53	714	2
11810	53	713	2
11811	53	712	2
11812	53	711	2
11813	53	710	2
11814	53	709	2
11815	53	708	2
11816	53	707	2
11817	53	706	2
11818	53	705	2
11819	53	704	2
11820	53	703	2
11821	53	702	2
11822	53	701	2
11823	53	700	2
11824	53	699	2
11825	53	698	2
11826	53	697	2
11827	53	696	2
11828	53	695	2
11829	53	694	2
11830	53	693	2
11831	53	692	2
11832	53	691	2
11833	53	690	2
11834	53	689	2
11835	53	688	2
11836	53	687	2
11837	53	686	2
11838	53	685	2
11839	53	684	2
11840	53	683	2
11841	53	682	2
11842	53	681	2
11843	53	680	2
11844	53	679	2
11845	53	678	2
11846	53	677	2
11847	53	676	2
11848	53	675	2
11849	53	674	2
11850	53	673	2
11851	53	672	2
11852	53	671	2
11853	53	670	2
11854	53	669	2
11855	53	668	2
11856	53	667	2
11857	53	666	2
11858	53	665	2
11859	53	664	2
11860	53	663	2
11861	53	662	2
11862	53	661	2
11863	53	660	2
11864	53	659	2
11865	53	658	2
11866	53	657	2
11867	53	656	2
11868	53	655	2
11869	53	654	2
11870	53	653	2
11871	53	652	2
11872	53	651	2
11873	53	650	2
11874	53	649	2
11875	53	648	2
11876	53	647	2
11877	53	646	2
11878	53	645	2
11879	53	644	2
11880	53	643	2
11881	53	642	2
11882	53	641	2
11883	53	640	2
11884	53	639	2
11885	53	638	2
11886	53	637	2
11887	53	636	2
11888	53	635	2
11889	53	634	2
11890	53	633	2
11891	53	632	2
11892	53	631	2
11893	53	630	2
11894	53	629	2
11895	53	628	2
11896	53	627	2
11897	53	626	2
11898	53	625	2
11899	53	624	2
11900	53	623	2
11901	53	622	2
11902	53	621	2
11903	53	620	2
11904	53	619	2
11905	53	618	2
11906	53	617	2
11907	53	616	2
11908	53	615	2
11909	53	614	2
11910	53	613	2
11911	53	612	2
11912	53	611	2
11913	53	610	2
11914	53	609	2
11915	53	608	2
11916	53	607	2
11917	53	606	2
11918	53	605	2
11919	53	604	2
11920	53	603	2
11921	53	602	2
11922	53	601	2
11923	53	600	2
11924	53	599	2
11925	53	598	2
11926	53	597	2
11927	53	596	2
11928	53	595	2
11929	53	594	2
11930	53	593	2
11931	53	592	2
11932	53	591	2
11933	53	590	2
11934	53	589	2
11935	53	588	2
11936	53	587	2
11937	53	586	2
11938	53	585	2
11939	53	584	2
11940	53	583	2
11941	53	582	2
11942	53	581	2
11943	53	580	2
11944	53	579	2
11945	53	578	2
11946	53	577	2
11947	53	576	2
11948	53	575	2
11949	53	574	2
11950	53	573	2
11951	53	572	2
11952	53	571	2
11953	53	570	2
11954	53	569	2
11955	53	568	2
11956	53	567	2
11957	53	566	2
11958	53	565	2
11959	53	564	2
11960	53	563	2
11961	53	562	2
11962	53	561	2
11963	53	560	2
11964	53	559	2
11965	53	558	2
11966	53	557	2
11967	53	556	2
11968	53	555	2
11969	53	554	2
11970	53	553	2
11971	53	552	2
11972	53	551	2
11973	53	550	2
11974	53	549	2
11975	53	548	2
11976	53	547	2
11977	53	546	2
11978	53	545	2
11979	53	544	2
11980	53	543	2
11981	53	542	2
11982	53	541	2
11983	53	540	2
11984	53	539	2
11985	53	538	2
11986	53	537	2
11987	53	536	2
11988	53	535	2
11989	53	534	2
11990	53	533	2
11991	53	532	2
11992	53	531	2
11993	53	530	2
11994	53	529	2
11995	53	528	2
11996	53	527	2
11997	53	526	2
11998	53	525	2
11999	53	524	2
12000	53	523	2
12001	53	522	2
12002	53	521	2
12003	53	520	2
12004	53	519	2
12005	53	518	2
12006	53	517	2
12007	53	516	2
12008	53	515	2
12009	53	514	2
12010	53	513	2
12011	53	512	2
12012	53	511	2
12013	53	510	2
12014	53	509	2
12015	53	508	2
12016	53	507	2
12017	53	506	2
12018	53	505	2
12019	53	504	2
12020	53	503	2
12021	53	502	2
12022	53	501	2
12023	53	500	2
12024	53	499	2
12025	53	498	2
12026	53	497	2
12027	53	496	2
12028	53	495	2
12029	53	494	2
12030	53	493	2
12031	53	492	2
12032	53	491	2
12033	53	490	2
12034	53	489	2
12035	53	488	2
12036	53	487	2
12037	53	486	2
12038	53	485	2
12039	53	484	2
12040	53	483	2
12041	53	482	2
12042	53	481	2
12043	53	480	2
12044	53	479	2
12045	53	478	2
12046	53	477	2
12047	53	476	2
12048	53	475	2
12049	53	474	2
12050	53	473	2
12051	53	472	2
12052	53	471	2
12053	53	470	2
12054	53	469	2
12055	53	468	2
12056	53	467	2
12057	53	466	2
12058	53	465	2
12059	53	464	2
12060	53	463	2
12061	53	462	2
12062	53	461	2
12063	53	460	2
12064	53	459	2
12065	53	458	2
12066	53	457	2
12067	53	456	2
12068	53	455	2
12069	53	454	2
12070	53	453	2
12071	53	452	2
12072	53	451	2
12073	53	450	2
12074	53	449	2
12075	53	448	2
12076	53	447	2
12077	53	446	2
12078	53	445	2
12079	53	444	2
12080	53	443	2
12081	53	442	2
12082	53	441	2
12083	53	440	2
12084	53	439	2
12085	53	438	2
12086	53	437	2
12087	53	436	2
12088	53	435	2
12089	53	434	2
12090	53	433	2
12091	53	432	2
12092	53	431	2
12093	53	430	2
12094	53	429	2
12095	53	428	2
12096	53	427	2
12097	53	426	2
12098	53	425	2
12099	53	424	2
12100	53	423	2
12101	53	422	2
12102	53	421	2
12103	53	420	2
12104	53	419	2
12105	53	418	2
12106	53	417	2
12107	53	416	2
12108	53	415	2
12109	53	414	2
12110	53	413	2
12111	53	412	2
12112	53	411	2
12113	53	410	2
12114	53	409	2
12115	53	408	2
12116	53	407	2
12117	53	406	2
12118	53	405	2
12119	53	404	2
12120	53	403	2
12121	53	402	2
12122	53	401	2
12123	53	400	2
12124	53	399	2
12125	53	398	2
12126	53	397	2
12127	53	396	2
12128	53	395	2
12129	53	394	2
12130	53	393	2
12131	53	392	2
12132	53	391	2
12133	53	390	2
12134	53	389	2
12135	53	388	2
12136	53	387	2
12137	53	386	2
12138	53	385	2
12139	53	384	2
12140	53	383	2
12141	53	382	2
12142	53	381	2
12143	53	380	2
12144	53	379	2
12145	53	378	2
12146	53	377	2
12147	53	376	2
12148	53	375	2
12149	53	374	2
12150	53	373	2
12151	53	372	2
12152	53	371	2
12153	53	370	2
12154	53	369	2
12155	53	368	2
12156	53	367	2
12157	53	366	2
12158	53	365	2
12159	53	364	2
12160	53	363	2
12161	53	362	2
12162	53	361	2
12163	53	360	2
12164	53	359	2
12165	53	358	2
12166	53	357	2
12167	53	356	2
12168	53	355	2
12169	53	354	2
12170	53	353	2
12171	53	352	2
12172	53	351	2
12173	53	350	2
12174	53	349	2
12175	53	348	2
12176	53	347	2
12177	53	346	2
12178	53	345	2
12179	53	344	2
12180	53	343	2
12181	53	342	2
12182	53	341	2
12183	53	340	2
12184	53	339	2
12185	53	338	2
12186	53	337	2
12187	53	336	2
12188	53	335	2
12189	53	334	2
12190	53	333	2
12191	53	332	2
12192	53	331	2
12193	53	330	2
12194	53	329	2
12195	53	328	2
12196	53	327	2
12197	53	326	2
12198	53	325	2
12199	53	324	2
12200	53	323	2
12201	53	322	2
12202	53	321	2
12203	53	320	2
12204	53	319	2
12205	53	318	2
12206	53	317	2
12207	53	316	2
12208	53	315	2
12209	53	314	2
12210	53	313	2
12211	53	312	2
12212	53	311	2
12213	53	310	2
12214	53	309	2
12215	53	308	2
12216	53	307	2
12217	53	306	2
12218	53	305	2
12219	53	304	2
12220	53	303	2
12221	53	302	2
12222	53	301	2
12223	53	300	1
12224	53	299	1
12225	53	298	1
12226	53	297	1
12227	53	296	1
12228	53	295	1
12229	53	294	1
12230	53	293	1
12231	53	292	1
12232	53	291	1
12233	53	290	1
12234	53	289	1
12235	53	288	1
12236	53	287	1
12237	53	286	1
12238	53	285	1
12239	53	284	1
12240	53	283	1
12241	53	282	1
12242	53	281	1
12243	53	280	1
12244	53	279	1
12245	53	278	1
12246	53	277	1
12247	53	276	1
12248	53	275	1
12249	53	274	1
12250	53	273	1
12251	53	272	1
12252	53	271	1
12253	53	270	1
12254	53	269	1
12255	53	268	1
12256	53	267	1
12257	53	266	1
12258	53	265	1
12259	53	264	1
12260	53	263	1
12261	53	262	1
12262	53	261	1
12263	53	260	1
12264	53	259	1
12265	53	258	1
12266	53	257	1
12267	53	256	1
12268	53	255	1
12269	53	254	1
12270	53	253	1
12271	53	252	1
12272	53	251	1
12273	53	250	1
12274	53	249	1
12275	53	248	1
12276	53	247	1
12277	53	246	1
12278	53	245	1
12279	53	244	1
12280	53	243	1
12281	53	242	1
12282	53	241	1
12283	53	240	1
12284	53	239	1
12285	53	238	1
12286	53	237	1
12287	53	236	1
12288	53	235	1
12289	53	234	1
12290	53	233	1
12291	53	232	1
12292	53	231	1
12293	53	230	1
12294	53	229	1
12295	53	228	1
12296	53	227	1
12297	53	226	1
12298	53	225	1
12299	53	224	1
12300	53	223	1
12301	53	222	1
12302	53	221	1
12303	53	220	1
12304	53	219	1
12305	53	218	1
12306	53	217	1
12307	53	216	1
12308	53	215	1
12309	53	214	1
12310	53	213	1
12311	53	212	1
12312	53	211	1
12313	53	210	1
12314	53	209	1
12315	53	208	1
12316	53	207	1
12317	53	206	1
12318	53	205	1
12319	53	204	1
12320	53	203	1
12321	53	202	1
12322	53	201	1
12323	53	200	1
12324	53	199	1
12325	53	198	1
12326	53	197	1
12327	53	196	1
12328	53	195	1
12329	53	194	1
12330	53	193	1
12331	53	192	1
12332	53	191	1
12333	53	190	1
12334	53	189	1
12335	53	188	1
12336	53	187	1
12337	53	186	1
12338	53	185	1
12339	53	184	1
12340	53	183	1
12341	53	182	1
12342	53	181	1
12343	53	180	1
12344	53	179	1
12345	53	178	1
12346	53	177	1
12347	53	176	1
12348	53	175	1
12349	53	174	1
12350	53	173	1
12351	53	172	1
12352	53	171	1
12353	53	170	1
12354	53	169	1
12355	53	168	1
12356	53	167	1
12357	53	166	1
12358	53	165	1
12359	53	164	1
12360	53	163	1
12361	53	162	1
12362	53	161	1
12363	53	160	1
12364	53	159	1
12365	53	158	1
12366	53	157	1
12367	53	156	1
12368	53	155	1
12369	53	154	1
12370	53	153	1
12371	53	152	1
12372	53	151	1
12373	53	150	1
12374	53	149	1
12375	53	148	1
12376	53	147	1
12377	53	146	1
12378	53	145	1
12379	53	144	1
12380	53	143	1
12381	53	142	1
12382	53	141	1
12383	53	140	1
12384	53	139	1
12385	53	138	1
12386	53	137	1
12387	53	136	1
12388	53	135	1
12389	53	134	1
12390	53	133	1
12391	53	132	1
12392	53	131	1
12393	53	130	1
12394	53	129	1
12395	53	128	1
12396	53	127	1
12397	53	126	1
12398	53	125	1
12399	53	124	1
12400	53	123	1
12401	53	122	1
12402	53	121	1
12403	53	120	1
12404	53	119	1
12405	53	118	1
12406	53	117	1
12407	53	116	1
12408	53	115	1
12409	53	114	1
12410	53	113	1
12411	53	112	1
12412	53	111	1
12413	53	110	1
12414	53	109	1
12415	53	108	1
12416	53	107	1
12417	53	106	1
12418	53	105	1
12419	53	104	1
12420	53	103	1
12421	53	102	1
12422	53	101	1
12423	53	100	1
12424	53	99	1
12425	53	98	1
12426	53	97	1
12427	53	96	1
12428	53	95	1
12429	53	94	1
12430	53	93	1
12431	53	92	1
12432	53	91	1
12433	53	90	1
12434	53	89	1
12435	53	88	1
12436	53	87	1
12437	53	86	1
12438	53	85	1
12439	53	84	1
12440	53	83	1
12441	53	82	1
12442	53	81	1
12443	53	80	1
12444	53	79	1
12445	53	78	1
12446	53	77	1
12447	53	76	1
12448	53	75	1
12449	53	74	1
12450	53	73	1
12451	53	72	1
12452	53	71	1
12453	53	70	1
12454	53	69	1
12455	53	68	1
12456	53	67	1
12457	53	66	1
12458	53	65	1
12459	53	64	1
12460	53	63	1
12461	53	62	1
12462	53	61	1
12463	53	60	1
12464	53	59	1
12465	53	58	1
12466	53	57	1
12467	53	56	1
12468	53	55	1
12469	53	54	1
12470	53	53	1
12471	53	52	1
12472	53	51	1
12473	53	50	1
12474	53	49	1
12475	53	48	1
12476	53	47	1
12477	53	46	1
12478	53	45	1
12479	53	44	1
12480	53	43	1
12481	53	42	1
12482	53	41	1
12483	53	40	1
12484	53	39	1
12485	53	38	1
12486	53	37	1
12487	53	36	1
12488	53	35	1
12489	53	34	1
12490	53	33	1
12491	53	32	1
12492	53	31	1
12493	53	30	1
12494	53	29	1
12495	53	28	1
12496	53	27	1
12497	53	26	1
12498	53	25	1
12499	53	24	1
12500	53	23	1
12501	53	22	1
12502	53	21	1
12503	53	20	1
12504	53	19	1
12505	53	18	1
12506	53	17	1
12507	53	16	1
12508	53	15	1
12509	53	14	1
12510	53	13	1
12511	53	12	1
12512	53	11	1
12513	53	10	1
12514	53	9	1
12515	53	8	1
12516	53	7	1
12517	53	6	1
12518	53	5	1
12519	53	4	1
12520	53	3	1
12521	53	2	1
12522	53	1	1
12523	54	189	2
12524	54	188	2
12525	54	187	2
12526	54	186	2
12527	54	185	2
12528	54	184	2
12529	54	183	2
12530	54	182	2
12531	54	181	2
12532	54	180	2
12533	54	179	2
12534	54	178	2
12535	54	177	2
12536	54	176	2
12537	54	175	2
12538	54	174	2
12539	54	173	2
12540	54	172	2
12541	54	171	2
12542	54	170	2
12543	54	169	2
12544	54	168	2
12545	54	167	2
12546	54	166	2
12547	54	165	2
12548	54	164	2
12549	54	163	2
12550	54	162	2
12551	54	161	2
12552	54	160	2
12553	54	159	2
12554	54	158	2
12555	54	157	2
12556	54	156	2
12557	54	155	2
12558	54	154	2
12559	54	153	2
12560	54	152	2
12561	54	151	2
12562	54	150	2
12563	54	149	2
12564	54	148	2
12565	54	147	2
12566	54	146	2
12567	54	145	2
12568	54	144	2
12569	54	143	2
12570	54	142	2
12571	54	141	2
12572	54	140	2
12573	54	139	2
12574	54	138	2
12575	54	137	2
12576	54	136	2
12577	54	135	2
12578	54	134	2
12579	54	133	2
12580	54	132	2
12581	54	131	2
12582	54	130	2
12583	54	129	2
12584	54	128	2
12585	54	127	2
12586	54	126	2
12587	54	125	2
12588	54	124	2
12589	54	123	2
12590	54	122	2
12591	54	121	2
12592	54	120	2
12593	54	119	2
12594	54	118	2
12595	54	117	2
12596	54	116	2
12597	54	115	2
12598	54	114	2
12599	54	113	2
12600	54	112	2
12601	54	111	2
12602	54	110	2
12603	54	109	2
12604	54	108	2
12605	54	107	2
12606	54	106	2
12607	54	105	2
12608	54	104	2
12609	54	103	2
12610	54	102	2
12611	54	101	2
12612	54	100	2
12613	54	99	2
12614	54	98	2
12615	54	97	2
12616	54	96	2
12617	54	95	2
12618	54	94	2
12619	54	93	2
12620	54	92	2
12621	54	91	2
12622	54	90	2
12623	54	89	2
12624	54	88	2
12625	54	87	2
12626	54	86	2
12627	54	85	2
12628	54	84	2
12629	54	83	2
12630	54	82	2
12631	54	81	2
12632	54	80	2
12633	54	79	2
12634	54	78	2
12635	54	77	2
12636	54	76	2
12637	54	75	2
12638	54	74	2
12639	54	73	2
12640	54	72	2
12641	54	71	2
12642	54	70	2
12643	54	69	2
12644	54	68	2
12645	54	67	2
12646	54	66	2
12647	54	65	2
12648	54	64	2
12649	54	63	2
12650	54	62	2
12651	54	61	2
12652	54	60	2
12653	54	59	2
12654	54	58	2
12655	54	57	2
12656	54	56	2
12657	54	55	2
12658	54	54	2
12659	54	53	2
12660	54	52	2
12661	54	51	2
12662	54	50	2
12663	54	49	2
12664	54	48	2
12665	54	47	2
12666	54	46	2
12667	54	45	2
12668	54	44	2
12669	54	43	2
12670	54	42	1
12671	54	41	1
12672	54	40	1
12673	54	39	1
12674	54	38	1
12675	54	37	1
12676	54	36	1
12677	54	35	1
12678	54	34	1
12679	54	33	1
12680	54	32	1
12681	54	31	1
12682	54	30	1
12683	54	29	1
12684	54	28	1
12685	54	27	1
12686	54	26	1
12687	54	25	1
12688	54	24	1
12689	54	23	1
12690	54	22	1
12691	54	21	1
12692	54	20	1
12693	54	19	1
12694	54	18	1
12695	54	17	1
12696	54	16	1
12697	54	15	1
12698	54	14	1
12699	54	13	1
12700	54	12	1
12701	54	11	1
12702	54	10	1
12703	54	9	1
12704	54	8	1
12705	54	7	1
12706	54	6	1
12707	54	5	1
12708	54	4	1
12709	54	3	1
12710	54	2	1
12711	54	1	1
12712	55	94	2
12713	55	93	2
12714	55	92	2
12715	55	91	2
12716	55	90	2
12717	55	89	2
12718	55	88	2
12719	55	87	2
12720	55	86	2
12721	55	85	2
12722	55	84	2
12723	55	83	2
12724	55	82	2
12725	55	81	2
12726	55	80	2
12727	55	79	2
12728	55	78	2
12729	55	77	2
12730	55	76	2
12731	55	75	2
12732	55	74	2
12733	55	73	2
12734	55	72	2
12735	55	71	2
12736	55	70	2
12737	55	69	2
12738	55	68	2
12739	55	67	2
12740	55	66	2
12741	55	65	2
12742	55	64	2
12743	55	63	2
12744	55	62	2
12745	55	61	2
12746	55	60	2
12747	55	59	2
12748	55	58	2
12749	55	57	2
12750	55	56	2
12751	55	55	2
12752	55	54	2
12753	55	53	2
12754	55	52	2
12755	55	51	2
12756	55	50	2
12757	55	49	1
12758	55	48	1
12759	55	47	1
12760	55	46	1
12761	55	45	1
12762	55	44	1
12763	55	43	1
12764	55	42	1
12765	55	41	1
12766	55	40	1
12767	55	39	1
12768	55	38	1
12769	55	37	1
12770	55	36	1
12771	55	35	1
12772	55	34	1
12773	55	33	1
12774	55	32	1
12775	55	31	1
12776	55	30	1
12777	55	29	1
12778	55	28	1
12779	55	27	1
12780	55	26	1
12781	55	25	1
12782	55	24	1
12783	55	23	1
12784	55	22	1
12785	55	21	1
12786	55	20	1
12787	55	19	1
12788	55	18	1
12789	55	17	1
12790	55	16	1
12791	55	15	1
12792	55	14	1
12793	55	13	1
12794	55	12	1
12795	55	11	1
12796	55	10	1
12797	55	9	1
12798	55	8	1
12799	55	7	1
12800	55	6	1
12801	55	5	1
12802	55	4	1
12803	55	3	1
12804	55	2	1
12805	55	1	1
12806	55	0	1
12807	56	249	1
12808	56	248	1
12809	56	247	1
12810	56	246	1
12811	56	245	1
12812	56	244	1
12813	56	243	1
12814	56	242	1
12815	56	241	1
12816	56	240	1
12817	56	239	1
12818	56	238	1
12819	56	237	1
12820	56	236	1
12821	56	235	1
12822	56	234	1
12823	56	233	1
12824	56	232	1
12825	56	231	1
12826	56	230	1
12827	56	229	1
12828	56	228	1
12829	56	227	1
12830	56	226	1
12831	56	225	1
12832	56	224	1
12833	56	223	1
12834	56	222	1
12835	56	221	1
12836	56	220	1
12837	56	219	1
12838	56	218	1
12839	56	217	1
12840	56	216	1
12841	56	215	1
12842	56	214	1
12843	56	213	1
12844	56	212	1
12845	56	211	1
12846	56	210	1
12847	56	209	1
12848	56	208	1
12849	56	207	1
12850	56	206	1
12851	56	205	1
12852	56	204	1
12853	56	203	1
12854	56	202	1
12855	56	201	1
12856	56	200	1
12857	56	199	1
12858	56	198	1
12859	56	197	1
12860	56	196	1
12861	56	195	1
12862	56	194	1
12863	56	193	1
12864	56	192	1
12865	56	191	1
12866	56	190	1
12867	56	189	1
12868	56	188	1
12869	56	187	1
12870	56	186	1
12871	56	185	1
12872	56	184	1
12873	56	183	1
12874	56	182	1
12875	56	181	1
12876	56	180	1
12877	56	179	1
12878	56	178	1
12879	56	177	1
12880	56	176	1
12881	56	175	1
12882	56	174	1
12883	56	173	1
12884	56	172	1
12885	56	171	1
12886	56	170	1
12887	56	169	1
12888	56	168	1
12889	56	167	1
12890	56	166	1
12891	56	165	1
12892	56	164	1
12893	56	163	1
12894	56	162	1
12895	56	161	1
12896	56	160	1
12897	56	159	1
12898	56	158	1
12899	56	157	1
12900	56	156	1
12901	56	155	1
12902	56	154	1
12903	56	153	1
12904	56	152	1
12905	56	151	1
12906	56	150	1
12907	56	149	1
12908	56	148	1
12909	56	147	1
12910	56	146	1
12911	56	145	1
12912	56	144	1
12913	56	143	1
12914	56	142	1
12915	56	141	1
12916	56	140	1
12917	56	139	1
12918	56	138	1
12919	56	137	1
12920	56	136	1
12921	56	135	1
12922	56	134	1
12923	56	133	1
12924	56	132	1
12925	56	131	1
12926	56	130	1
12927	56	129	1
12928	56	128	1
12929	56	127	1
12930	56	126	1
12931	56	125	1
12932	56	124	1
12933	56	123	1
12934	56	122	1
12935	56	121	1
12936	56	120	1
12937	56	119	1
12938	56	118	1
12939	56	117	1
12940	56	116	1
12941	56	115	1
12942	56	114	1
12943	56	113	1
12944	56	112	1
12945	56	111	1
12946	56	110	1
12947	56	109	1
12948	56	108	1
12949	56	107	1
12950	56	106	1
12951	56	105	1
12952	56	104	1
12953	56	103	1
12954	56	102	1
12955	56	101	1
12956	56	100	1
12957	56	99	1
12958	56	98	1
12959	56	97	1
12960	56	96	1
12961	56	95	1
12962	56	94	1
12963	56	93	1
12964	56	92	1
12965	56	91	1
12966	56	90	1
12967	56	89	1
12968	56	88	1
12969	56	87	1
12970	56	86	1
12971	56	85	1
12972	56	84	1
12973	56	83	1
12974	56	82	1
12975	56	81	1
12976	56	80	1
12977	56	79	1
12978	56	78	1
12979	56	77	1
12980	56	76	1
12981	56	75	1
12982	56	74	1
12983	56	73	1
12984	56	72	1
12985	56	71	1
12986	56	70	1
12987	56	69	1
12988	56	68	1
12989	56	67	1
12990	56	66	1
12991	56	65	1
12992	56	64	1
12993	56	63	1
12994	56	62	1
12995	56	61	1
12996	56	60	1
12997	56	59	1
12998	56	58	1
12999	56	57	1
13000	56	56	1
13001	56	55	1
13002	56	54	1
13003	56	53	1
13004	56	52	1
13005	56	51	1
13006	56	50	1
13007	56	49	1
13008	56	48	1
13009	56	47	1
13010	56	46	1
13011	56	45	1
13012	56	44	1
13013	56	43	1
13014	56	42	1
13015	56	41	1
13016	56	40	1
13017	56	39	1
13018	56	38	1
13019	56	37	1
13020	56	36	1
13021	56	35	1
13022	56	34	1
13023	56	33	1
13024	56	32	1
13025	56	31	1
13026	56	30	1
13027	56	29	1
13028	56	28	1
13029	56	27	1
13030	56	26	1
13031	56	25	1
13032	56	24	1
13033	56	23	1
13034	56	22	1
13035	56	21	1
13036	56	20	1
13037	56	19	1
13038	56	18	1
13039	56	17	1
13040	56	16	1
13041	56	15	1
13042	56	14	1
13043	56	13	1
13044	56	12	1
13045	56	11	1
13046	56	10	1
13047	56	9	1
13048	56	8	1
13049	56	7	1
13050	56	6	1
13051	56	5	1
13052	56	4	1
13053	56	3	1
13054	56	2	1
13055	56	1	1
13056	57	103	1
13057	57	102	1
13058	57	101	1
13059	57	100	1
13060	57	99	1
13061	57	98	1
13062	57	97	1
13063	57	96	1
13064	57	95	1
13065	57	94	1
13066	57	93	1
13067	57	92	1
13068	57	91	1
13069	57	90	1
13070	57	89	1
13071	57	88	1
13072	57	87	1
13073	57	86	1
13074	57	85	1
13075	57	84	1
13076	57	83	1
13077	57	82	1
13078	57	81	1
13079	57	80	1
13080	57	79	1
13081	57	78	1
13082	57	77	1
13083	57	76	1
13084	57	75	1
13085	57	74	1
13086	57	73	1
13087	57	72	1
13088	57	71	1
13089	57	70	1
13090	57	69	1
13091	57	68	1
13092	57	67	1
13093	57	66	1
13094	57	65	1
13095	57	64	1
13096	57	63	1
13097	57	62	1
13098	57	61	1
13099	57	60	1
13100	57	59	1
13101	57	58	1
13102	57	57	1
13103	57	56	1
13104	57	55	1
13105	57	54	1
13106	57	53	1
13107	57	52	1
13108	57	51	1
13109	57	50	1
13110	57	49	1
13111	57	48	1
13112	57	47	1
13113	57	46	1
13114	57	45	1
13115	57	44	1
13116	57	43	1
13117	57	42	1
13118	57	41	1
13119	57	40	1
13120	57	39	1
13121	57	38	1
13122	57	37	1
13123	57	36	1
13124	57	35	1
13125	57	34	1
13126	57	33	1
13127	57	32	1
13128	57	31	1
13129	57	30	1
13130	57	29	1
13131	57	28	1
13132	57	27	1
13133	57	26	1
13134	57	25	1
13135	57	24	1
13136	57	23	1
13137	57	22	1
13138	57	21	1
13139	57	20	1
13140	57	19	1
13141	57	18	1
13142	57	17	1
13143	57	16	1
13144	57	15	1
13145	57	14	1
13146	57	13	1
13147	57	12	1
13148	57	11	1
13149	57	10	1
13150	57	9	1
13151	57	8	1
13152	57	7	1
13153	57	6	1
13154	57	5	1
13155	57	4	1
13156	57	3	1
13157	57	2	1
13158	57	1	1
13159	58	251	1
13160	58	250	1
13161	58	249	1
13162	58	248	1
13163	58	247	1
13164	58	246	1
13165	58	245	1
13166	58	244	1
13167	58	243	1
13168	58	242	1
13169	58	241	1
13170	58	240	1
13171	58	239	1
13172	58	238	1
13173	58	237	1
13174	58	236	1
13175	58	235	1
13176	58	234	1
13177	58	233	1
13178	58	232	1
13179	58	231	1
13180	58	230	1
13181	58	229	1
13182	58	228	1
13183	58	227	1
13184	58	226	1
13185	58	225	1
13186	58	224	1
13187	58	223	1
13188	58	222	1
13189	58	221	1
13190	58	220	1
13191	58	219	1
13192	58	218	1
13193	58	217	1
13194	58	216	1
13195	58	215	1
13196	58	214	1
13197	58	213	1
13198	58	212	1
13199	58	211	1
13200	58	210	1
13201	58	209	1
13202	58	208	1
13203	58	207	1
13204	58	206	1
13205	58	205	1
13206	58	204	1
13207	58	203	1
13208	58	202	1
13209	58	201	1
13210	58	200	1
13211	58	199	1
13212	58	198	1
13213	58	197	1
13214	58	196	1
13215	58	195	1
13216	58	194	1
13217	58	193	1
13218	58	192	1
13219	58	191	1
13220	58	190	1
13221	58	189	1
13222	58	188	1
13223	58	187	1
13224	58	186	1
13225	58	185	1
13226	58	184	1
13227	58	183	1
13228	58	182	1
13229	58	181	1
13230	58	180	1
13231	58	179	1
13232	58	178	1
13233	58	177	1
13234	58	176	1
13235	58	175	1
13236	58	174	1
13237	58	173	1
13238	58	172	1
13239	58	171	1
13240	58	170	1
13241	58	169	1
13242	58	168	1
13243	58	167	1
13244	58	166	1
13245	58	165	1
13246	58	164	1
13247	58	163	1
13248	58	162	1
13249	58	161	1
13250	58	160	1
13251	58	159	1
13252	58	158	1
13253	58	157	1
13254	58	156	1
13255	58	155	1
13256	58	154	1
13257	58	153	1
13258	58	152	1
13259	58	151	1
13260	58	150	1
13261	58	149	1
13262	58	148	1
13263	58	147	1
13264	58	146	1
13265	58	145	1
13266	58	144	1
13267	58	143	1
13268	58	142	1
13269	58	141	1
13270	58	140	1
13271	58	139	1
13272	58	138	1
13273	58	137	1
13274	58	136	1
13275	58	135	1
13276	58	134	1
13277	58	133	1
13278	58	132	1
13279	58	131	1
13280	58	130	1
13281	58	129	1
13282	58	128	1
13283	58	127	1
13284	58	126	1
13285	58	125	1
13286	58	124	1
13287	58	123	1
13288	58	122	1
13289	58	121	1
13290	58	120	1
13291	58	119	1
13292	58	118	1
13293	58	117	1
13294	58	116	1
13295	58	115	1
13296	58	114	1
13297	58	113	1
13298	58	112	1
13299	58	111	1
13300	58	110	1
13301	58	109	1
13302	58	108	1
13303	58	107	1
13304	58	106	1
13305	58	105	1
13306	58	104	1
13307	58	103	1
13308	58	102	1
13309	58	101	1
13310	58	100	1
13311	58	99	1
13312	58	98	1
13313	58	97	1
13314	58	96	1
13315	58	95	1
13316	58	94	1
13317	58	93	1
13318	58	92	1
13319	58	91	1
13320	58	90	1
13321	58	89	1
13322	58	88	1
13323	58	87	1
13324	58	86	1
13325	58	85	1
13326	58	84	1
13327	58	83	1
13328	58	82	1
13329	58	81	1
13330	58	80	1
13331	58	79	1
13332	58	78	1
13333	58	77	1
13334	58	76	1
13335	58	75	1
13336	58	74	1
13337	58	73	1
13338	58	72	1
13339	58	71	1
13340	58	70	1
13341	58	69	1
13342	58	68	1
13343	58	67	1
13344	58	66	1
13345	58	65	1
13346	58	64	1
13347	58	63	1
13348	58	62	1
13349	58	61	1
13350	58	60	1
13351	58	59	1
13352	58	58	1
13353	58	57	1
13354	58	56	1
13355	58	55	1
13356	58	54	1
13357	58	53	1
13358	58	52	1
13359	58	51	1
13360	58	50	1
13361	58	49	1
13362	58	48	1
13363	58	47	1
13364	58	46	1
13365	58	45	1
13366	58	44	1
13367	58	43	1
13368	58	42	1
13369	58	41	1
13370	58	40	1
13371	58	39	1
13372	58	38	1
13373	58	37	1
13374	58	36	1
13375	58	35	1
13376	58	34	1
13377	58	33	1
13378	58	32	1
13379	58	31	1
13380	58	30	1
13381	58	29	1
13382	58	28	1
13383	58	27	1
13384	58	26	1
13385	58	25	1
13386	58	24	1
13387	58	23	1
13388	58	22	1
13389	58	21	1
13390	58	20	1
13391	58	19	1
13392	58	18	1
13393	58	17	1
13394	58	16	1
13395	58	15	1
13396	58	14	1
13397	58	13	1
13398	58	12	1
13399	58	11	1
13400	58	10	1
13401	58	9	1
13402	58	8	1
13403	58	7	1
13404	58	6	1
13405	58	5	1
13406	58	4	1
13407	58	3	1
13408	58	2	1
13409	58	1	1
13410	59	45	1
13411	59	44	1
13412	59	43	1
13413	59	42	1
13414	59	41	1
13415	59	40	1
13416	59	39	1
13417	59	38	1
13418	59	37	1
13419	59	36	1
13420	59	35	1
13421	59	34	1
13422	59	33	1
13423	59	32	1
13424	59	31	1
13425	59	30	1
13426	59	29	1
13427	59	28	1
13428	59	27	1
13429	59	26	1
13430	59	25	1
13431	59	24	1
13432	59	23	1
13433	59	22	1
13434	59	21	1
13435	59	20	1
13436	59	19	1
13437	59	18	1
13438	59	17	1
13439	59	16	1
13440	59	15	1
13441	59	14	1
13442	59	13	1
13443	59	12	1
13444	59	11	1
13445	59	10	1
13446	59	9	1
13447	59	8	1
13448	59	7	1
13449	59	6	1
13450	59	5	1
13451	59	4	1
13452	59	3	1
13453	59	2	1
13454	59	1	1
13455	60	116	3
13456	60	115	3
13457	60	114	3
13458	60	113	3
13459	60	112	3
13460	60	111	3
13461	60	110	3
13462	60	109	3
13463	60	108	3
13464	60	107	3
13465	60	106	3
13466	60	105	3
13467	60	104	3
13468	60	103	3
13469	60	102	3
13470	60	101	3
13471	60	100	3
13472	60	99	2
13473	60	98	2
13474	60	97	2
13475	60	96	2
13476	60	95	2
13477	60	94	2
13478	60	93	2
13479	60	92	2
13480	60	91	2
13481	60	90	2
13482	60	89	2
13483	60	88	2
13484	60	87	2
13485	60	86	2
13486	60	85	2
13487	60	84	2
13488	60	83	2
13489	60	82	2
13490	60	81	2
13491	60	80	2
13492	60	79	2
13493	60	78	2
13494	60	77	2
13495	60	76	2
13496	60	75	2
13497	60	74	2
13498	60	73	2
13499	60	72	2
13500	60	71	2
13501	60	70	2
13502	60	69	2
13503	60	68	2
13504	60	67	2
13505	60	66	2
13506	60	65	2
13507	60	64	2
13508	60	63	2
13509	60	62	2
13510	60	61	2
13511	60	60	2
13512	60	59	2
13513	60	58	2
13514	60	57	2
13515	60	56	2
13516	60	55	2
13517	60	54	2
13518	60	53	2
13519	60	52	2
13520	60	51	2
13521	60	50	2
13522	60	49	2
13523	60	48	2
13524	60	47	2
13525	60	46	2
13526	60	45	2
13527	60	44	2
13528	60	43	2
13529	60	42	2
13530	60	41	1
13531	60	40	1
13532	60	39	1
13533	60	38	1
13534	60	37	1
13535	60	36	1
13536	60	35	1
13537	60	34	1
13538	60	33	1
13539	60	32	1
13540	60	31	1
13541	60	30	1
13542	60	29	1
13543	60	28	1
13544	60	27	1
13545	60	26	1
13546	60	25	1
13547	60	24	1
13548	60	23	1
13549	60	22	1
13550	60	21	1
13551	60	20	1
13552	60	19	1
13553	60	18	1
13554	60	17	1
13555	60	16	1
13556	60	15	1
13557	60	14	1
13558	60	13	1
13559	60	12	1
13560	60	11	1
13561	60	10	1
13562	60	9	1
13563	60	8	1
13564	60	7	1
13565	60	6	1
13566	60	5	1
13567	60	4	1
13568	60	3	1
13569	60	2	1
13570	60	1	1
13571	61	100	2
13572	61	99	2
13573	61	98	2
13574	61	97	2
13575	61	96	2
13576	61	95	2
13577	61	94	2
13578	61	93	2
13579	61	92	2
13580	61	91	2
13581	61	90	2
13582	61	89	2
13583	61	88	2
13584	61	87	2
13585	61	86	2
13586	61	85	2
13587	61	84	2
13588	61	83	2
13589	61	82	2
13590	61	81	2
13591	61	80	2
13592	61	79	2
13593	61	78	2
13594	61	77	2
13595	61	76	2
13596	61	75	2
13597	61	74	2
13598	61	73	2
13599	61	72	2
13600	61	71	2
13601	61	70	2
13602	61	69	2
13603	61	68	2
13604	61	67	2
13605	61	66	2
13606	61	65	2
13607	61	64	2
13608	61	63	2
13609	61	62	2
13610	61	61	2
13611	61	60	2
13612	61	59	2
13613	61	58	2
13614	61	57	1
13615	61	56	1
13616	61	55	1
13617	61	54	1
13618	61	53	1
13619	61	52	1
13620	61	51	1
13621	61	50	1
13622	61	49	1
13623	61	48	1
13624	61	47	1
13625	61	46	1
13626	61	45	1
13627	61	44	1
13628	61	43	1
13629	61	42	1
13630	61	41	1
13631	61	40	1
13632	61	39	1
13633	61	38	1
13634	61	37	1
13635	61	36	1
13636	61	35	1
13637	61	34	1
13638	61	33	1
13639	61	32	1
13640	61	31	1
13641	61	30	1
13642	61	29	1
13643	61	28	1
13644	61	27	1
13645	61	26	1
13646	61	25	1
13647	61	24	1
13648	61	23	1
13649	61	22	1
13650	61	21	1
13651	61	20	1
13652	61	19	1
13653	61	18	1
13654	61	17	1
13655	61	16	1
13656	61	15	1
13657	61	14	1
13658	61	13	1
13659	61	12	1
13660	61	11	1
13661	61	10	1
13662	61	9	1
13663	61	8	1
13664	61	7	1
13665	61	6	1
13666	61	5	1
13667	61	4	1
13668	61	3	1
13669	61	2	1
13670	61	1	1
13671	62	289	2
13672	62	288	2
13673	62	287	2
13674	62	286	2
13675	62	285	2
13676	62	284	2
13677	62	283	2
13678	62	282	2
13679	62	281	2
13680	62	280	2
13681	62	279	2
13682	62	278	2
13683	62	277	2
13684	62	276	2
13685	62	275	2
13686	62	274	2
13687	62	273	2
13688	62	272	2
13689	62	271	2
13690	62	270	2
13691	62	269	2
13692	62	268	2
13693	62	267	2
13694	62	266	2
13695	62	265	2
13696	62	264	2
13697	62	263	2
13698	62	262	2
13699	62	261	2
13700	62	260	2
13701	62	259	2
13702	62	258	2
13703	62	257	2
13704	62	256	2
13705	62	255	2
13706	62	254	2
13707	62	253	2
13708	62	252	2
13709	62	251	2
13710	62	250	2
13711	62	249	2
13712	62	248	2
13713	62	247	2
13714	62	246	2
13715	62	245	2
13716	62	244	2
13717	62	243	2
13718	62	242	2
13719	62	241	2
13720	62	240	2
13721	62	239	2
13722	62	238	2
13723	62	237	2
13724	62	236	2
13725	62	235	2
13726	62	234	2
13727	62	233	2
13728	62	232	2
13729	62	231	2
13730	62	230	2
13731	62	229	2
13732	62	228	2
13733	62	227	2
13734	62	226	2
13735	62	225	2
13736	62	224	2
13737	62	223	2
13738	62	222	2
13739	62	221	2
13740	62	220	2
13741	62	219	2
13742	62	218	2
13743	62	217	2
13744	62	216	2
13745	62	215	2
13746	62	214	2
13747	62	213	2
13748	62	212	2
13749	62	211	2
13750	62	210	2
13751	62	209	2
13752	62	208	2
13753	62	207	2
13754	62	206	2
13755	62	205	2
13756	62	204	2
13757	62	203	2
13758	62	202	2
13759	62	201	2
13760	62	200	2
13761	62	199	2
13762	62	198	2
13763	62	197	2
13764	62	196	2
13765	62	195	2
13766	62	194	2
13767	62	193	2
13768	62	192	2
13769	62	191	2
13770	62	190	2
13771	62	189	2
13772	62	188	2
13773	62	187	2
13774	62	186	2
13775	62	185	2
13776	62	184	2
13777	62	183	2
13778	62	182	2
13779	62	181	2
13780	62	180	2
13781	62	179	2
13782	62	178	2
13783	62	177	2
13784	62	176	2
13785	62	175	2
13786	62	174	2
13787	62	173	2
13788	62	172	2
13789	62	171	2
13790	62	170	2
13791	62	169	2
13792	62	168	2
13793	62	167	2
13794	62	166	2
13795	62	165	2
13796	62	164	2
13797	62	163	2
13798	62	162	2
13799	62	161	2
13800	62	160	2
13801	62	159	2
13802	62	158	2
13803	62	157	2
13804	62	156	2
13805	62	155	2
13806	62	154	2
13807	62	153	2
13808	62	152	2
13809	62	151	2
13810	62	150	2
13811	62	149	2
13812	62	148	2
13813	62	147	2
13814	62	146	2
13815	62	145	2
13816	62	144	2
13817	62	143	2
13818	62	142	2
13819	62	141	2
13820	62	140	2
13821	62	139	2
13822	62	138	2
13823	62	137	2
13824	62	136	2
13825	62	135	2
13826	62	134	2
13827	62	133	2
13828	62	132	2
13829	62	131	2
13830	62	130	2
13831	62	129	2
13832	62	128	2
13833	62	127	2
13834	62	126	2
13835	62	125	2
13836	62	124	2
13837	62	123	2
13838	62	122	2
13839	62	121	2
13840	62	120	2
13841	62	119	2
13842	62	118	2
13843	62	117	2
13844	62	116	2
13845	62	115	2
13846	62	114	2
13847	62	113	2
13848	62	112	2
13849	62	111	2
13850	62	110	2
13851	62	109	2
13852	62	108	2
13853	62	107	2
13854	62	106	2
13855	62	105	2
13856	62	104	2
13857	62	103	2
13858	62	102	2
13859	62	101	2
13860	62	100	2
13861	62	99	2
13862	62	98	2
13863	62	97	2
13864	62	96	2
13865	62	95	2
13866	62	94	2
13867	62	93	2
13868	62	92	2
13869	62	91	2
13870	62	90	2
13871	62	89	2
13872	62	88	2
13873	62	87	2
13874	62	86	2
13875	62	85	2
13876	62	84	2
13877	62	83	2
13878	62	82	2
13879	62	81	2
13880	62	80	2
13881	62	79	2
13882	62	78	2
13883	62	77	2
13884	62	76	2
13885	62	75	2
13886	62	74	2
13887	62	73	2
13888	62	72	2
13889	62	71	2
13890	62	70	2
13891	62	69	2
13892	62	68	2
13893	62	67	2
13894	62	66	2
13895	62	65	2
13896	62	64	2
13897	62	63	2
13898	62	62	2
13899	62	61	2
13900	62	60	2
13901	62	59	2
13902	62	58	2
13903	62	57	2
13904	62	56	2
13905	62	55	2
13906	62	54	1
13907	62	53	1
13908	62	52	1
13909	62	51	1
13910	62	50	1
13911	62	49	1
13912	62	48	1
13913	62	47	1
13914	62	46	1
13915	62	45	1
13916	62	44	1
13917	62	43	1
13918	62	42	1
13919	62	41	1
13920	62	40	1
13921	62	39	1
13922	62	38	1
13923	62	37	1
13924	62	36	1
13925	62	35	1
13926	62	34	1
13927	62	33	1
13928	62	32	1
13929	62	31	1
13930	62	30	1
13931	62	29	1
13932	62	28	1
13933	62	27	1
13934	62	26	1
13935	62	25	1
13936	62	24	1
13937	62	23	1
13938	62	22	1
13939	62	21	1
13940	62	20	1
13941	62	19	1
13942	62	18	1
13943	62	17	1
13944	62	16	1
13945	62	15	1
13946	62	14	1
13947	62	13	1
13948	62	12	1
13949	62	11	1
13950	62	10	1
13951	62	9	1
13952	62	8	1
13953	62	7	1
13954	62	6	1
13955	62	5	1
13956	62	4	1
13957	62	3	1
13958	62	2	1
13959	62	1	1
13960	63	33	3
13961	63	32	3
13962	63	31	3
13963	63	30	3
13964	63	29	3
13965	63	28	3
13966	63	27	3
13967	63	26	3
13968	63	25	3
13969	63	24	3
13970	63	23	3
13971	63	22	3
13972	63	21	3
13973	63	20	3
13974	63	19	3
13975	63	18	3
13976	63	17	3
13977	63	16	3
13978	63	15	3
13979	63	14	3
13980	63	13	3
13981	63	12	3
13982	63	11	3
13983	63	10	3
13984	63	9	3
13985	63	8	3
13986	63	7	3
13987	63	6	3
13988	63	5	3
13989	63	4	3
13990	63	3	3
13991	63	2	3
13992	63	1	3
13993	63	91	2
13994	63	90	2
13995	63	89	2
13996	63	88	2
13997	63	87	2
13998	63	86	2
13999	63	85	2
14000	63	84	2
14001	63	83	2
14002	63	82	2
14003	63	81	2
14004	63	80	2
14005	63	79	2
14006	63	78	2
14007	63	77	2
14008	63	76	2
14009	63	75	2
14010	63	74	2
14011	63	73	2
14012	63	72	2
14013	63	71	2
14014	63	70	2
14015	63	69	2
14016	63	68	2
14017	63	67	2
14018	63	66	2
14019	63	65	2
14020	63	64	2
14021	63	63	2
14022	63	62	2
14023	63	61	2
14024	63	60	2
14025	63	59	2
14026	63	58	2
14027	63	57	1
14028	63	56	1
14029	63	55	1
14030	63	54	1
14031	63	53	1
14032	63	52	1
14033	63	51	1
14034	63	50	1
14035	63	49	1
14036	63	48	1
14037	63	47	1
14038	63	46	1
14039	63	45	1
14040	63	44	1
14041	63	43	1
14042	63	42	1
14043	63	41	1
14044	63	40	1
14045	63	39	1
14046	63	38	1
14047	63	37	1
14048	63	36	1
14049	63	35	1
14050	63	34	1
14051	63	33	1
14052	63	32	1
14053	63	31	1
14054	63	30	1
14055	63	29	1
14056	63	28	1
14057	63	27	1
14058	63	26	1
14059	63	25	1
14060	63	24	1
14061	63	23	1
14062	63	22	1
14063	63	21	1
14064	63	20	1
14065	63	19	1
14066	63	18	1
14067	63	17	1
14068	63	16	1
14069	63	15	1
14070	63	14	1
14071	63	13	1
14072	63	12	1
14073	63	11	1
14074	63	10	1
14075	63	9	1
14076	63	8	1
14077	63	7	1
14078	63	6	1
14079	63	5	1
14080	63	4	1
14081	63	3	1
14082	63	2	1
14083	63	1	1
14084	63	0	1
14085	64	132	1
14086	64	131	1
14087	64	130	1
14088	64	129	1
14089	64	128	1
14090	64	127	1
14091	64	126	1
14092	64	125	1
14093	64	124	1
14094	64	123	1
14095	64	122	1
14096	64	121	1
14097	64	120	1
14098	64	119	1
14099	64	118	1
14100	64	117	1
14101	64	116	1
14102	64	115	1
14103	64	114	1
14104	64	113	1
14105	64	112	1
14106	64	111	1
14107	64	110	1
14108	64	109	1
14109	64	108	1
14110	64	107	1
14111	64	106	1
14112	64	105	1
14113	64	104	1
14114	64	103	1
14115	64	102	1
14116	64	101	1
14117	64	100	1
14118	64	99	1
14119	64	98	1
14120	64	97	1
14121	64	96	1
14122	64	95	1
14123	64	94	1
14124	64	93	1
14125	64	92	1
14126	64	91	1
14127	64	90	1
14128	64	89	1
14129	64	88	1
14130	64	87	1
14131	64	86	1
14132	64	85	1
14133	64	84	1
14134	64	83	1
14135	64	82	1
14136	64	81	1
14137	64	80	1
14138	64	79	1
14139	64	78	1
14140	64	77	1
14141	64	76	1
14142	64	75	1
14143	64	74	1
14144	64	73	1
14145	64	72	1
14146	64	71	1
14147	64	70	1
14148	64	69	1
14149	64	68	1
14150	64	67	1
14151	64	66	1
14152	64	65	1
14153	64	64	1
14154	64	63	1
14155	64	62	1
14156	64	61	1
14157	64	60	1
14158	64	59	1
14159	64	58	1
14160	64	57	1
14161	64	56	1
14162	64	55	1
14163	64	54	1
14164	64	53	1
14165	64	52	1
14166	64	51	1
14167	64	50	1
14168	64	49	1
14169	64	48	1
14170	64	47	1
14171	64	46	1
14172	64	45	1
14173	64	44	1
14174	64	43	1
14175	64	42	1
14176	64	41	1
14177	64	40	1
14178	64	39	1
14179	64	38	1
14180	64	37	1
14181	64	36	1
14182	64	35	1
14183	64	34	1
14184	64	33	1
14185	64	32	1
14186	64	31	1
14187	64	30	1
14188	64	29	1
14189	64	28	1
14190	64	27	1
14191	64	26	1
14192	64	25	1
14193	64	24	1
14194	64	23	1
14195	64	22	1
14196	64	21	1
14197	64	20	1
14198	64	19	1
14199	64	18	1
14200	64	17	1
14201	64	16	1
14202	64	15	1
14203	64	14	1
14204	64	13	1
14205	64	12	1
14206	64	11	1
14207	64	10	1
14208	64	9	1
14209	64	8	1
14210	64	7	1
14211	64	6	1
14212	64	5	1
14213	64	4	1
14214	64	3	1
14215	64	2	1
14216	64	1	1
14217	65	185	4
14218	65	184	4
14219	65	183	4
14220	65	182	4
14221	65	181	4
14222	65	180	4
14223	65	179	4
14224	65	178	4
14225	65	177	4
14226	65	176	4
14227	65	175	4
14228	65	174	4
14229	65	173	4
14230	65	172	4
14231	65	171	4
14232	65	170	4
14233	65	169	4
14234	65	168	4
14235	65	167	4
14236	65	166	4
14237	65	165	4
14238	65	164	4
14239	65	163	4
14240	65	162	4
14241	65	161	4
14242	65	160	4
14243	65	159	4
14244	65	158	4
14245	65	157	4
14246	65	156	4
14247	65	155	4
14248	65	154	4
14249	65	153	4
14250	65	152	4
14251	65	151	4
14252	65	150	4
14253	65	149	4
14254	65	148	4
14255	65	147	4
14256	65	146	3
14257	65	145	3
14258	65	144	3
14259	65	143	3
14260	65	142	3
14261	65	141	3
14262	65	140	3
14263	65	139	3
14264	65	138	3
14265	65	137	3
14266	65	136	3
14267	65	135	3
14268	65	134	3
14269	65	133	3
14270	65	132	3
14271	65	131	3
14272	65	130	3
14273	65	129	3
14274	65	128	3
14275	65	127	3
14276	65	126	3
14277	65	125	3
14278	65	124	3
14279	65	123	3
14280	65	122	3
14281	65	121	3
14282	65	120	3
14283	65	119	3
14284	65	118	3
14285	65	117	3
14286	65	116	3
14287	65	115	3
14288	65	114	3
14289	65	113	3
14290	65	112	3
14291	65	111	3
14292	65	110	3
14293	65	109	3
14294	65	108	3
14295	65	107	3
14296	65	106	3
14297	65	105	2
14298	65	104	2
14299	65	103	2
14300	65	102	2
14301	65	101	2
14302	65	100	2
14303	65	99	2
14304	65	98	2
14305	65	97	2
14306	65	96	2
14307	65	95	2
14308	65	94	2
14309	65	93	2
14310	65	92	2
14311	65	91	2
14312	65	90	2
14313	65	89	2
14314	65	88	2
14315	65	87	2
14316	65	86	2
14317	65	85	2
14318	65	84	2
14319	65	83	2
14320	65	82	2
14321	65	81	2
14322	65	80	2
14323	65	79	2
14324	65	78	2
14325	65	77	2
14326	65	76	2
14327	65	75	2
14328	65	74	2
14329	65	73	2
14330	65	72	2
14331	65	71	2
14332	65	70	2
14333	65	69	2
14334	65	68	2
14335	65	67	2
14336	65	66	2
14337	65	65	2
14338	65	64	2
14339	65	63	2
14340	65	62	2
14341	65	61	2
14342	65	60	2
14343	65	59	2
14344	65	58	2
14345	65	57	2
14346	65	56	2
14347	65	55	2
14348	65	54	2
14349	65	53	2
14350	65	52	2
14351	65	51	2
14352	65	50	1
14353	65	49	1
14354	65	48	1
14355	65	47	1
14356	65	46	1
14357	65	45	1
14358	65	44	1
14359	65	43	1
14360	65	42	1
14361	65	41	1
14362	65	40	1
14363	65	39	1
14364	65	38	1
14365	65	37	1
14366	65	36	1
14367	65	35	1
14368	65	34	1
14369	65	33	1
14370	65	32	1
14371	65	31	1
14372	65	30	1
14373	65	29	1
14374	65	28	1
14375	65	27	1
14376	65	26	1
14377	65	25	1
14378	65	24	1
14379	65	23	1
14380	65	22	1
14381	65	21	1
14382	65	20	1
14383	65	19	1
14384	65	18	1
14385	65	17	1
14386	65	16	1
14387	65	15	1
14388	65	14	1
14389	65	13	1
14390	65	12	1
14391	65	11	1
14392	65	10	1
14393	65	9	1
14394	65	8	1
14395	65	7	1
14396	65	6	1
14397	65	5	1
14398	65	4	1
14399	65	3	1
14400	65	2	1
14401	65	1	1
14402	65	0	1
14403	66	118	2
14404	66	117	2
14405	66	116	2
14406	66	115	2
14407	66	114	2
14408	66	113	2
14409	66	112	2
14410	66	111	2
14411	66	110	2
14412	66	109	2
14413	66	108	2
14414	66	107	2
14415	66	106	2
14416	66	105	2
14417	66	104	2
14418	66	103	2
14419	66	102	2
14420	66	101	2
14421	66	100	2
14422	66	99	2
14423	66	98	2
14424	66	97	2
14425	66	96	2
14426	66	95	2
14427	66	94	2
14428	66	93	2
14429	66	92	2
14430	66	91	2
14431	66	90	2
14432	66	89	2
14433	66	88	2
14434	66	87	2
14435	66	86	2
14436	66	85	2
14437	66	84	2
14438	66	83	2
14439	66	82	2
14440	66	81	2
14441	66	80	2
14442	66	79	2
14443	66	78	2
14444	66	77	2
14445	66	76	2
14446	66	75	2
14447	66	74	2
14448	66	73	2
14449	66	72	2
14450	66	71	2
14451	66	70	2
14452	66	69	2
14453	66	68	2
14454	66	67	2
14455	66	66	2
14456	66	65	2
14457	66	64	2
14458	66	63	2
14459	66	62	2
14460	66	61	2
14461	66	60	2
14462	66	59	2
14463	66	58	2
14464	66	57	2
14465	66	56	2
14466	66	55	2
14467	66	54	1
14468	66	53	1
14469	66	52	1
14470	66	51	1
14471	66	50	1
14472	66	49	1
14473	66	48	1
14474	66	47	1
14475	66	46	1
14476	66	45	1
14477	66	44	1
14478	66	43	1
14479	66	42	1
14480	66	41	1
14481	66	40	1
14482	66	39	1
14483	66	38	1
14484	66	37	1
14485	66	36	1
14486	66	35	1
14487	66	34	1
14488	66	33	1
14489	66	32	1
14490	66	31	1
14491	66	30	1
14492	66	29	1
14493	66	28	1
14494	66	27	1
14495	66	26	1
14496	66	25	1
14497	66	24	1
14498	66	23	1
14499	66	22	1
14500	66	21	1
14501	66	20	1
14502	66	19	1
14503	66	18	1
14504	66	17	1
14505	66	16	1
14506	66	15	1
14507	66	14	1
14508	66	13	1
14509	66	12	1
14510	66	11	1
14511	66	10	1
14512	66	9	1
14513	66	8	1
14514	66	7	1
14515	66	6	1
14516	66	5	1
14517	66	4	1
14518	66	3	1
14519	66	2	1
14520	66	1	1
14521	66	0	1
14522	67	118	1
14523	67	117	1
14524	67	116	1
14525	67	115	1
14526	67	114	1
14527	67	113	1
14528	67	112	1
14529	67	111	1
14530	67	110	1
14531	67	109	1
14532	67	108	1
14533	67	107	1
14534	67	106	1
14535	67	105	1
14536	67	104	1
14537	67	103	1
14538	67	102	1
14539	67	101	1
14540	67	100	1
14541	67	99	1
14542	67	98	1
14543	67	97	1
14544	67	96	1
14545	67	95	1
14546	67	94	1
14547	67	93	1
14548	67	92	1
14549	67	91	1
14550	67	90	1
14551	67	89	1
14552	67	88	1
14553	67	87	1
14554	67	86	1
14555	67	85	1
14556	67	84	1
14557	67	83	1
14558	67	82	1
14559	67	81	1
14560	67	80	1
14561	67	79	1
14562	67	78	1
14563	67	77	1
14564	67	76	1
14565	67	75	1
14566	67	74	1
14567	67	73	1
14568	67	72	1
14569	67	71	1
14570	67	70	1
14571	67	69	1
14572	67	68	1
14573	67	67	1
14574	67	66	1
14575	67	65	1
14576	67	64	1
14577	67	63	1
14578	67	62	1
14579	67	61	1
14580	67	60	1
14581	67	59	1
14582	67	58	1
14583	67	57	1
14584	67	56	1
14585	67	55	1
14586	67	54	1
14587	67	53	1
14588	67	52	1
14589	67	51	1
14590	67	50	1
14591	67	49	1
14592	67	48	1
14593	67	47	1
14594	67	46	1
14595	67	45	1
14596	67	44	1
14597	67	43	1
14598	67	42	1
14599	67	41	1
14600	67	40	1
14601	67	39	1
14602	67	38	1
14603	67	37	1
14604	67	36	1
14605	67	35	1
14606	67	34	1
14607	67	33	1
14608	67	32	1
14609	67	31	1
14610	67	30	1
14611	67	29	1
14612	67	28	1
14613	67	27	1
14614	67	26	1
14615	67	25	1
14616	67	24	1
14617	67	23	1
14618	67	22	1
14619	67	21	1
14620	67	20	1
14621	67	19	1
14622	67	18	1
14623	67	17	1
14624	67	16	1
14625	67	15	1
14626	67	14	1
14627	67	13	1
14628	67	12	1
14629	67	11	1
14630	67	10	1
14631	67	9	1
14632	67	8	1
14633	67	7	1
14634	67	6	1
14635	67	5	1
14636	67	4	1
14637	67	3	1
14638	67	2	1
14639	67	1	1
14640	68	56	2
14641	68	55	2
14642	68	54	2
14643	68	53	2
14644	68	52	2
14645	68	51	2
14646	68	50	2
14647	68	49	2
14648	68	48	2
14649	68	47	2
14650	68	46	2
14651	68	45	2
14652	68	44	2
14653	68	43	2
14654	68	42	2
14655	68	41	2
14656	68	40	1
14657	68	39	1
14658	68	38	1
14659	68	37	1
14660	68	36	1
14661	68	35	1
14662	68	34	1
14663	68	33	1
14664	68	32	1
14665	68	31	1
14666	68	30	1
14667	68	29	1
14668	68	28	1
14669	68	27	1
14670	68	26	1
14671	68	25	1
14672	68	24	1
14673	68	23	1
14674	68	22	1
14675	68	21	1
14676	68	20	1
14677	68	19	1
14678	68	18	1
14679	68	17	1
14680	68	16	1
14681	68	15	1
14682	68	14	1
14683	68	13	1
14684	68	12	1
14685	68	11	1
14686	68	10	1
14687	68	9	1
14688	68	8	1
14689	68	7	1
14690	68	6	1
14691	68	5	1
14692	68	4	1
14693	68	3	1
14694	68	2	1
14695	68	1	1
14696	68	0	1
14697	69	33	4
14698	69	32	4
14699	69	31	4
14700	69	30	4
14701	69	29	4
14702	69	28	4
14703	69	27	4
14704	69	26	4
14705	69	25	4
14706	69	24	3
14707	69	23	3
14708	69	22	3
14709	69	21	3
14710	69	20	3
14711	69	19	3
14712	69	18	3
14713	69	17	2
14714	69	16	2
14715	69	15	2
14716	69	14	2
14717	69	13	2
14718	69	12	2
14719	69	11	2
14720	69	10	2
14721	69	9	1
14722	69	8	1
14723	69	7	1
14724	69	6	1
14725	69	5	1
14726	69	4	1
14727	69	3	1
14728	69	2	1
14729	69	1	1
14730	70	125	2
14731	70	124	2
14732	70	123	2
14733	70	122	2
14734	70	121	2
14735	70	120	2
14736	70	119	2
14737	70	118	2
14738	70	117	2
14739	70	116	2
14740	70	115	2
14741	70	114	2
14742	70	113	2
14743	70	112	2
14744	70	111	1
14745	70	110	1
14746	70	109	1
14747	70	108	1
14748	70	107	1
14749	70	106	1
14750	70	105	1
14751	70	104	1
14752	70	103	1
14753	70	102	1
14754	70	101	1
14755	70	100	1
14756	70	99	1
14757	70	98	1
14758	70	97	1
14759	70	96	1
14760	70	95	1
14761	70	94	1
14762	70	93	1
14763	70	92	1
14764	70	91	1
14765	70	90	1
14766	70	89	1
14767	70	88	1
14768	70	87	1
14769	70	86	1
14770	70	85	1
14771	70	84	1
14772	70	83	1
14773	70	82	1
14774	70	81	1
14775	70	80	1
14776	70	79	1
14777	70	78	1
14778	70	77	1
14779	70	76	1
14780	70	75	1
14781	70	74	1
14782	70	73	1
14783	70	72	1
14784	70	71	1
14785	70	70	1
14786	70	69	1
14787	70	68	1
14788	70	67	1
14789	70	66	1
14790	70	65	1
14791	70	64	1
14792	70	63	1
14793	70	62	1
14794	70	61	1
14795	70	60	1
14796	70	59	1
14797	70	58	1
14798	70	57	1
14799	70	56	1
14800	70	55	1
14801	70	54	1
14802	70	53	1
14803	70	52	1
14804	70	51	1
14805	70	50	1
14806	70	49	1
14807	70	48	1
14808	70	47	1
14809	70	46	1
14810	70	45	1
14811	70	44	1
14812	70	43	1
14813	70	42	1
14814	70	41	1
14815	70	40	1
14816	70	39	1
14817	70	38	1
14818	70	37	1
14819	70	36	1
14820	70	35	1
14821	70	34	1
14822	70	33	1
14823	70	32	1
14824	70	31	1
14825	70	30	1
14826	70	29	1
14827	70	28	1
14828	70	27	1
14829	70	26	1
14830	70	25	1
14831	70	24	1
14832	70	23	1
14833	70	22	1
14834	70	21	1
14835	70	20	1
14836	70	19	1
14837	70	18	1
14838	70	17	1
14839	70	16	1
14840	70	15	1
14841	70	14	1
14842	70	13	1
14843	70	12	1
14844	70	11	1
14845	70	10	1
14846	70	9	1
14847	70	8	1
14848	70	7	1
14849	70	6	1
14850	70	5	1
14851	70	4	1
14852	70	3	1
14853	70	2	1
14854	70	1	1
14855	71	48	1
14856	71	47	1
14857	71	46	1
14858	71	45	1
14859	71	44	1
14860	71	43	1
14861	71	42	1
14862	71	41	1
14863	71	40	1
14864	71	39	1
14865	71	38	1
14866	71	37	1
14867	71	36	1
14868	71	35	1
14869	71	34	1
14870	71	33	1
14871	71	32	1
14872	71	31	1
14873	71	30	1
14874	71	29	1
14875	71	28	1
14876	71	27	1
14877	71	26	1
14878	71	25	1
14879	71	24	1
14880	71	23	1
14881	71	22	1
14882	71	21	1
14883	71	20	1
14884	71	19	1
14885	71	18	1
14886	71	17	1
14887	71	16	1
14888	71	15	1
14889	71	14	1
14890	71	13	1
14891	71	12	1
14892	71	11	1
14893	71	10	1
14894	71	9	1
14895	71	8	1
14896	71	7	1
14897	71	6	1
14898	71	5	1
14899	71	4	1
14900	71	3	1
14901	71	2	1
14902	71	1	1
14903	72	75	2
14904	72	74	2
14905	72	73	2
14906	72	72	2
14907	72	71	2
14908	72	70	2
14909	72	69	2
14910	72	68	2
14911	72	67	2
14912	72	66	2
14913	72	65	2
14914	72	64	2
14915	72	63	2
14916	72	62	2
14917	72	61	2
14918	72	60	2
14919	72	59	2
14920	72	58	2
14921	72	57	2
14922	72	56	2
14923	72	55	2
14924	72	54	2
14925	72	53	1
14926	72	52	1
14927	72	51	1
14928	72	50	1
14929	72	49	1
14930	72	48	1
14931	72	47	1
14932	72	46	1
14933	72	45	1
14934	72	44	1
14935	72	43	1
14936	72	42	1
14937	72	41	1
14938	72	40	1
14939	72	39	1
14940	72	38	1
14941	72	37	1
14942	72	36	1
14943	72	35	1
14944	72	34	1
14945	72	33	1
14946	72	32	1
14947	72	31	1
14948	72	30	1
14949	72	29	1
14950	72	28	1
14951	72	27	1
14952	72	26	1
14953	72	25	1
14954	72	24	1
14955	72	23	1
14956	72	22	1
14957	72	21	1
14958	72	20	1
14959	72	19	1
14960	72	18	1
14961	72	17	1
14962	72	16	1
14963	72	15	1
14964	72	14	1
14965	72	13	1
14966	72	12	1
14967	72	11	1
14968	72	10	1
14969	72	9	1
14970	72	8	1
14971	72	7	1
14972	72	6	1
14973	72	5	1
14974	72	4	1
14975	72	3	1
14976	72	2	1
14977	72	1	1
14978	73	115	3
14979	73	114	3
14980	73	113	3
14981	73	112	3
14982	73	111	3
14983	73	110	3
14984	73	109	3
14985	73	108	3
14986	73	107	3
14987	73	106	3
14988	73	105	3
14989	73	104	3
14990	73	103	3
14991	73	102	3
14992	73	101	3
14993	73	100	3
14994	73	99	3
14995	73	98	3
14996	73	97	3
14997	73	96	3
14998	73	95	3
14999	73	94	3
15000	73	93	3
15001	73	92	3
15002	73	91	3
15003	73	90	3
15004	73	89	3
15005	73	88	3
15006	73	87	3
15007	73	86	3
15008	73	85	3
15009	73	84	2
15010	73	83	2
15011	73	82	2
15012	73	81	2
15013	73	80	2
15014	73	79	2
15015	73	78	2
15016	73	77	2
15017	73	76	2
15018	73	75	2
15019	73	74	2
15020	73	73	2
15021	73	72	2
15022	73	71	2
15023	73	70	2
15024	73	69	2
15025	73	68	2
15026	73	67	2
15027	73	66	2
15028	73	65	2
15029	73	64	2
15030	73	63	2
15031	73	62	2
15032	73	61	2
15033	73	60	2
15034	73	59	2
15035	73	58	2
15036	73	57	2
15037	73	56	2
15038	73	55	2
15039	73	54	2
15040	73	53	2
15041	73	52	2
15042	73	51	2
15043	73	50	2
15044	73	49	2
15045	73	48	2
15046	73	47	2
15047	73	46	2
15048	73	45	2
15049	73	44	1
15050	73	43	1
15051	73	42	1
15052	73	41	1
15053	73	40	1
15054	73	39	1
15055	73	38	1
15056	73	37	1
15057	73	36	1
15058	73	35	1
15059	73	34	1
15060	73	33	1
15061	73	32	1
15062	73	31	1
15063	73	30	1
15064	73	29	1
15065	73	28	1
15066	73	27	1
15067	73	26	1
15068	73	25	1
15069	73	24	1
15070	73	23	1
15071	73	22	1
15072	73	21	1
15073	73	20	1
15074	73	19	1
15075	73	18	1
15076	73	17	1
15077	73	16	1
15078	73	15	1
15079	73	14	1
15080	73	13	1
15081	73	12	1
15082	73	11	1
15083	73	10	1
15084	73	9	1
15085	73	8	1
15086	73	7	1
15087	73	6	1
15088	73	5	1
15089	73	4	1
15090	73	3	1
15091	73	2	1
15092	73	1	1
15093	74	70	1
15094	74	69	1
15095	74	68	1
15096	74	67	1
15097	74	66	1
15098	74	65	1
15099	74	64	1
15100	74	63	1
15101	74	62	1
15102	74	61	1
15103	74	60	1
15104	74	59	1
15105	74	58	1
15106	74	57	1
15107	74	56	1
15108	74	55	1
15109	74	54	1
15110	74	53	1
15111	74	52	1
15112	74	51	1
15113	74	50	1
15114	74	49	1
15115	74	48	1
15116	74	47	1
15117	74	46	1
15118	74	45	1
15119	74	44	1
15120	74	43	1
15121	74	42	1
15122	74	41	1
15123	74	40	1
15124	74	39	1
15125	74	38	1
15126	74	37	1
15127	74	36	1
15128	74	35	1
15129	74	34	1
15130	74	33	1
15131	74	32	1
15132	74	31	1
15133	74	30	1
15134	74	29	1
15135	74	28	1
15136	74	27	1
15137	74	26	1
15138	74	25	1
15139	74	24	1
15140	74	23	1
15141	74	22	1
15142	74	21	1
15143	74	20	1
15144	74	19	1
15145	74	18	1
15146	74	17	1
15147	74	16	1
15148	74	15	1
15149	74	14	1
15150	74	13	1
15151	74	12	1
15152	74	11	1
15153	74	10	1
15154	74	9	1
15155	74	8	1
15156	74	7	1
15157	74	6	1
15158	74	5	1
15159	74	4	1
15160	74	3	1
15161	74	2	1
15162	74	1	1
15163	74	0	1
15164	75	112	15
15165	75	111	15
15166	75	110	15
15167	75	109	15
15168	75	108	15
15169	75	107	15
15170	75	106	15
15171	75	105	15
15172	75	104	15
15173	75	103	15
15174	75	102	15
15175	75	101	15
15176	75	100	15
15177	75	99	15
15178	75	98	15
15179	75	97	15
15180	75	96	15
15181	75	95	15
15182	75	94	15
15183	75	93	15
15184	75	92	15
15185	75	91	15
15186	75	90	15
15187	75	89	15
15188	75	88	15
15189	75	87	15
15190	75	86	15
15191	75	85	15
15192	75	84	15
15193	75	83	15
15194	75	82	15
15195	75	81	15
15196	75	80	15
15197	75	79	15
15198	75	78	15
15199	75	77	15
15200	75	76	15
15201	75	75	15
15202	75	74	15
15203	75	73	15
15204	75	72	15
15205	75	71	15
15206	75	70	13
15207	75	69	13
15208	75	68	13
15209	75	67	13
15210	75	66	13
15211	75	65	13
15212	75	64	13
15213	75	63	13
15214	75	62	13
15215	75	61	13
15216	75	60	13
15217	75	59	13
15218	75	58	12
15219	75	57	12
15220	75	56	12
15221	75	55	12
15222	75	54	12
15223	75	53	12
15224	75	52	11
15225	75	51	11
15226	75	50	11
15227	75	49	11
15228	75	48	11
15229	75	47	10
15230	75	46	10
15231	75	45	10
15232	75	44	10
15233	75	43	9
15234	75	42	9
15235	75	41	9
15236	75	40	9
15237	75	39	8
15238	75	38	8
15239	75	37	8
15240	75	36	8
15241	75	35	7
15242	75	34	7
15243	75	33	7
15244	75	32	7
15245	75	31	6
15246	75	30	6
15247	75	29	6
15248	75	28	6
15249	75	27	5
15250	75	26	5
15251	75	25	5
15252	75	24	5
15253	75	23	5
15254	75	22	4
15255	75	21	4
15256	75	20	4
15257	75	19	4
15258	75	18	4
15259	75	17	3
15260	75	16	3
15261	75	15	3
15262	75	14	3
15263	75	13	3
15264	75	12	3
15265	75	11	2
15266	75	10	2
15267	75	9	2
15268	75	8	2
15269	75	7	2
15270	75	6	1
15271	75	5	1
15272	75	4	1
15273	75	3	1
15274	75	2	1
15275	75	1	1
15276	76	93	2
15277	76	92	2
15278	76	91	2
15279	76	90	2
15280	76	89	2
15281	76	88	2
15282	76	87	2
15283	76	86	2
15284	76	85	2
15285	76	84	2
15286	76	83	2
15287	76	82	2
15288	76	81	2
15289	76	80	2
15290	76	79	2
15291	76	78	2
15292	76	77	2
15293	76	76	2
15294	76	75	2
15295	76	74	2
15296	76	73	2
15297	76	72	2
15298	76	71	2
15299	76	70	2
15300	76	69	2
15301	76	68	2
15302	76	67	2
15303	76	66	2
15304	76	65	2
15305	76	64	2
15306	76	63	2
15307	76	62	2
15308	76	61	2
15309	76	60	2
15310	76	59	2
15311	76	58	2
15312	76	57	2
15313	76	56	2
15314	76	55	2
15315	76	54	2
15316	76	53	2
15317	76	52	2
15318	76	51	2
15319	76	50	2
15320	76	49	1
15321	76	48	1
15322	76	47	1
15323	76	46	1
15324	76	45	1
15325	76	44	1
15326	76	43	1
15327	76	42	1
15328	76	41	1
15329	76	40	1
15330	76	39	1
15331	76	38	1
15332	76	37	1
15333	76	36	1
15334	76	35	1
15335	76	34	1
15336	76	33	1
15337	76	32	1
15338	76	31	1
15339	76	30	1
15340	76	29	1
15341	76	28	1
15342	76	27	1
15343	76	26	1
15344	76	25	1
15345	76	24	1
15346	76	23	1
15347	76	22	1
15348	76	21	1
15349	76	20	1
15350	76	19	1
15351	76	18	1
15352	76	17	1
15353	76	16	1
15354	76	15	1
15355	76	14	1
15356	76	13	1
15357	76	12	1
15358	76	11	1
15359	76	10	1
15360	76	9	1
15361	76	8	1
15362	76	7	1
15363	76	6	1
15364	76	5	1
15365	76	4	1
15366	76	3	1
15367	76	2	1
15368	76	1	1
15369	77	52	1
15370	77	51	1
15371	77	50	1
15372	77	49	1
15373	77	48	1
15374	77	47	1
15375	77	46	1
15376	77	45	1
15377	77	44	1
15378	77	43	1
15379	77	42	1
15380	77	41	1
15381	77	40	1
15382	77	39	1
15383	77	38	1
15384	77	37	1
15385	77	36	1
15386	77	35	1
15387	77	34	1
15388	77	33	1
15389	77	32	1
15390	77	31	1
15391	77	30	1
15392	77	29	1
15393	77	28	1
15394	77	27	1
15395	77	26	1
15396	77	25	1
15397	77	24	1
15398	77	23	1
15399	77	22	1
15400	77	21	1
15401	77	20	1
15402	77	19	1
15403	77	18	1
15404	77	17	1
15405	77	16	1
15406	77	15	1
15407	77	14	1
15408	77	13	1
15409	77	12	1
15410	77	11	1
15411	77	10	1
15412	77	9	1
15413	77	8	1
15414	77	7	1
15415	77	6	1
15416	77	5	1
15417	77	4	1
15418	77	3	1
15419	77	2	1
15420	77	1	1
15421	78	125	3
15422	78	124	3
15423	78	123	3
15424	78	122	2
15425	78	121	2
15426	78	120	2
15427	78	119	2
15428	78	118	2
15429	78	117	2
15430	78	116	2
15431	78	115	2
15432	78	114	2
15433	78	113	2
15434	78	112	2
15435	78	111	2
15436	78	110	2
15437	78	109	2
15438	78	108	2
15439	78	107	2
15440	78	106	2
15441	78	105	2
15442	78	104	2
15443	78	103	2
15444	78	102	2
15445	78	101	2
15446	78	100	2
15447	78	99	2
15448	78	98	2
15449	78	97	2
15450	78	96	2
15451	78	95	2
15452	78	94	2
15453	78	93	2
15454	78	92	2
15455	78	91	2
15456	78	90	2
15457	78	89	2
15458	78	88	2
15459	78	87	2
15460	78	86	2
15461	78	85	2
15462	78	84	2
15463	78	83	2
15464	78	82	2
15465	78	81	2
15466	78	80	2
15467	78	79	2
15468	78	78	2
15469	78	77	2
15470	78	76	2
15471	78	75	2
15472	78	74	2
15473	78	73	2
15474	78	72	2
15475	78	71	2
15476	78	70	2
15477	78	69	2
15478	78	68	2
15479	78	67	2
15480	78	66	2
15481	78	65	2
15482	78	64	2
15483	78	63	2
15484	78	62	2
15485	78	61	2
15486	78	60	2
15487	78	59	2
15488	78	58	2
15489	78	57	2
15490	78	56	2
15491	78	55	2
15492	78	54	2
15493	78	53	2
15494	78	52	2
15495	78	51	2
15496	78	50	2
15497	78	49	2
15498	78	48	2
15499	78	47	2
15500	78	46	2
15501	78	45	2
15502	78	44	2
15503	78	43	2
15504	78	42	2
15505	78	41	2
15506	78	40	2
15507	78	39	1
15508	78	38	1
15509	78	37	1
15510	78	36	1
15511	78	35	1
15512	78	34	1
15513	78	33	1
15514	78	32	1
15515	78	31	1
15516	78	30	1
15517	78	29	1
15518	78	28	1
15519	78	27	1
15520	78	26	1
15521	78	25	1
15522	78	24	1
15523	78	23	1
15524	78	22	1
15525	78	21	1
15526	78	20	1
15527	78	19	1
15528	78	18	1
15529	78	17	1
15530	78	16	1
15531	78	15	1
15532	78	14	1
15533	78	13	1
15534	78	12	1
15535	78	11	1
15536	78	10	1
15537	78	9	1
15538	78	8	1
15539	78	7	1
15540	78	6	1
15541	78	5	1
15542	78	4	1
15543	78	3	1
15544	78	2	1
15545	78	1	1
15546	79	88	2
15547	79	87	2
15548	79	86	2
15549	79	85	2
15550	79	84	2
15551	79	83	2
15552	79	82	2
15553	79	81	2
15554	79	80	2
15555	79	79	2
15556	79	78	2
15557	79	77	2
15558	79	76	2
15559	79	75	2
15560	79	74	2
15561	79	73	2
15562	79	72	2
15563	79	71	2
15564	79	70	2
15565	79	69	2
15566	79	68	2
15567	79	67	2
15568	79	66	2
15569	79	65	2
15570	79	64	2
15571	79	63	2
15572	79	62	2
15573	79	61	2
15574	79	60	2
15575	79	59	2
15576	79	58	2
15577	79	57	2
15578	79	56	2
15579	79	55	1
15580	79	54	1
15581	79	53	1
15582	79	52	1
15583	79	51	1
15584	79	50	1
15585	79	49	1
15586	79	48	1
15587	79	47	1
15588	79	46	1
15589	79	45	1
15590	79	44	1
15591	79	43	1
15592	79	42	1
15593	79	41	1
15594	79	40	1
15595	79	39	1
15596	79	38	1
15597	79	37	1
15598	79	36	1
15599	79	35	1
15600	79	34	1
15601	79	33	1
15602	79	32	1
15603	79	31	1
15604	79	30	1
15605	79	29	1
15606	79	28	1
15607	79	27	1
15608	79	26	1
15609	79	25	1
15610	79	24	1
15611	79	23	1
15612	79	22	1
15613	79	21	1
15614	79	20	1
15615	79	19	1
15616	79	18	1
15617	79	17	1
15618	79	16	1
15619	79	15	1
15620	79	14	1
15621	79	13	1
15622	79	12	1
15623	79	11	1
15624	79	10	1
15625	79	9	1
15626	79	8	1
15627	79	7	1
15628	79	6	1
15629	79	5	1
15630	79	4	1
15631	79	3	1
15632	79	2	1
15633	79	1	1
15634	80	138	1
15635	80	137	1
15636	80	136	1
15637	80	135	1
15638	80	134	1
15639	80	133	1
15640	80	132	1
15641	80	131	1
15642	80	130	1
15643	80	129	1
15644	80	128	1
15645	80	127	1
15646	80	126	1
15647	80	125	1
15648	80	124	1
15649	80	123	1
15650	80	122	1
15651	80	121	1
15652	80	120	1
15653	80	119	1
15654	80	118	1
15655	80	117	1
15656	80	116	1
15657	80	115	1
15658	80	114	1
15659	80	113	1
15660	80	112	1
15661	80	111	1
15662	80	110	1
15663	80	109	1
15664	80	108	1
15665	80	107	1
15666	80	106	1
15667	80	105	1
15668	80	104	1
15669	80	103	1
15670	80	102	1
15671	80	101	1
15672	80	100	1
15673	80	99	1
15674	80	98	1
15675	80	97	1
15676	80	96	1
15677	80	95	1
15678	80	94	1
15679	80	93	1
15680	80	92	1
15681	80	91	1
15682	80	90	1
15683	80	89	1
15684	80	88	1
15685	80	87	1
15686	80	86	1
15687	80	85	1
15688	80	84	1
15689	80	83	1
15690	80	82	1
15691	80	81	1
15692	80	80	1
15693	80	79	1
15694	80	78	1
15695	80	77	1
15696	80	76	1
15697	80	75	1
15698	80	74	1
15699	80	73	1
15700	80	72	1
15701	80	71	1
15702	80	70	1
15703	80	69	1
15704	80	68	1
15705	80	67	1
15706	80	66	1
15707	80	65	1
15708	80	64	1
15709	80	63	1
15710	80	62	1
15711	80	61	1
15712	80	60	1
15713	80	59	1
15714	80	58	1
15715	80	57	1
15716	80	56	1
15717	80	55	1
15718	80	54	1
15719	80	53	1
15720	80	52	1
15721	80	51	1
15722	80	50	1
15723	80	49	1
15724	80	48	1
15725	80	47	1
15726	80	46	1
15727	80	45	1
15728	80	44	1
15729	80	43	1
15730	80	42	1
15731	80	41	1
15732	80	40	1
15733	80	39	1
15734	80	38	1
15735	80	37	1
15736	80	36	1
15737	80	35	1
15738	80	34	1
15739	80	33	1
15740	80	32	1
15741	80	31	1
15742	80	30	1
15743	80	29	1
15744	80	28	1
15745	80	27	1
15746	80	26	1
15747	80	25	1
15748	80	24	1
15749	80	23	1
15750	80	22	1
15751	80	21	1
15752	80	20	1
15753	80	19	1
15754	80	18	1
15755	80	17	1
15756	80	16	1
15757	80	15	1
15758	80	14	1
15759	80	13	1
15760	80	12	1
15761	80	11	1
15762	80	10	1
15763	80	9	1
15764	80	8	1
15765	80	7	1
15766	80	6	1
15767	80	5	1
15768	80	4	1
15769	80	3	1
15770	80	2	1
15771	80	1	1
15772	80	0	1
15773	81	125	3
15774	81	124	3
15775	81	123	3
15776	81	122	3
15777	81	121	3
15778	81	120	3
15779	81	119	3
15780	81	118	3
15781	81	117	3
15782	81	116	3
15783	81	115	3
15784	81	114	3
15785	81	113	3
15786	81	112	3
15787	81	111	3
15788	81	110	3
15789	81	109	3
15790	81	108	3
15791	81	107	3
15792	81	106	3
15793	81	105	3
15794	81	104	3
15795	81	103	3
15796	81	102	3
15797	81	101	3
15798	81	100	3
15799	81	99	3
15800	81	98	3
15801	81	97	3
15802	81	96	3
15803	81	95	3
15804	81	94	3
15805	81	93	3
15806	81	92	3
15807	81	91	3
15808	81	90	3
15809	81	89	3
15810	81	88	3
15811	81	87	2
15812	81	86	2
15813	81	85	2
15814	81	84	2
15815	81	83	2
15816	81	82	2
15817	81	81	2
15818	81	80	2
15819	81	79	2
15820	81	78	2
15821	81	77	2
15822	81	76	2
15823	81	75	2
15824	81	74	2
15825	81	73	2
15826	81	72	2
15827	81	71	2
15828	81	70	2
15829	81	69	2
15830	81	68	2
15831	81	67	2
15832	81	66	2
15833	81	65	2
15834	81	64	2
15835	81	63	2
15836	81	62	2
15837	81	61	2
15838	81	60	2
15839	81	59	2
15840	81	58	2
15841	81	57	2
15842	81	56	2
15843	81	55	2
15844	81	54	2
15845	81	53	2
15846	81	52	2
15847	81	51	2
15848	81	50	2
15849	81	49	2
15850	81	48	2
15851	81	47	2
15852	81	46	2
15853	81	45	1
15854	81	44	1
15855	81	43	1
15856	81	42	1
15857	81	41	1
15858	81	40	1
15859	81	39	1
15860	81	38	1
15861	81	37	1
15862	81	36	1
15863	81	35	1
15864	81	34	1
15865	81	33	1
15866	81	32	1
15867	81	31	1
15868	81	30	1
15869	81	29	1
15870	81	28	1
15871	81	27	1
15872	81	26	1
15873	81	25	1
15874	81	24	1
15875	81	23	1
15876	81	22	1
15877	81	21	1
15878	81	20	1
15879	81	19	1
15880	81	18	1
15881	81	17	1
15882	81	16	1
15883	81	15	1
15884	81	14	1
15885	81	13	1
15886	81	12	1
15887	81	11	1
15888	81	10	1
15889	81	9	1
15890	81	8	1
15891	81	7	1
15892	81	6	1
15893	81	5	1
15894	81	4	1
15895	81	3	1
15896	81	2	1
15897	81	1	1
15898	82	43	2
15899	82	42	2
15900	82	41	2
15901	82	40	2
15902	82	39	2
15903	82	38	2
15904	82	37	2
15905	82	36	2
15906	82	35	1
15907	82	34	1
15908	82	33	1
15909	82	32	1
15910	82	31	1
15911	82	30	1
15912	82	29	1
15913	82	28	1
15914	82	27	1
15915	82	26	1
15916	82	25	1
15917	82	24	1
15918	82	23	1
15919	82	22	1
15920	82	21	1
15921	82	20	1
15922	82	19	1
15923	82	18	1
15924	82	17	1
15925	82	16	1
15926	82	15	1
15927	82	14	1
15928	82	13	1
15929	82	12	1
15930	82	11	1
15931	82	10	1
15932	82	9	1
15933	82	8	1
15934	82	7	1
15935	82	6	1
15936	82	5	1
15937	82	4	1
15938	82	3	1
15939	82	2	1
15940	82	1	1
15941	83	128	2
15942	83	127	2
15943	83	126	2
15944	83	125	2
15945	83	124	2
15946	83	123	2
15947	83	122	2
15948	83	121	2
15949	83	120	2
15950	83	119	2
15951	83	118	2
15952	83	117	2
15953	83	116	2
15954	83	115	2
15955	83	114	1
15956	83	113	1
15957	83	112	1
15958	83	111	1
15959	83	110	1
15960	83	109	1
15961	83	108	1
15962	83	107	1
15963	83	106	1
15964	83	105	1
15965	83	104	1
15966	83	103	1
15967	83	102	1
15968	83	101	1
15969	83	100	1
15970	83	99	1
15971	83	98	1
15972	83	97	1
15973	83	96	1
15974	83	95	1
15975	83	94	1
15976	83	93	1
15977	83	92	1
15978	83	91	1
15979	83	90	1
15980	83	89	1
15981	83	88	1
15982	83	87	1
15983	83	86	1
15984	83	85	1
15985	83	84	1
15986	83	83	1
15987	83	82	1
15988	83	81	1
15989	83	80	1
15990	83	79	1
15991	83	78	1
15992	83	77	1
15993	83	76	1
15994	83	75	1
15995	83	74	1
15996	83	73	1
15997	83	72	1
15998	83	71	1
15999	83	70	1
16000	83	69	1
16001	83	68	1
16002	83	67	1
16003	83	66	1
16004	83	65	1
16005	83	64	1
16006	83	63	1
16007	83	62	1
16008	83	61	1
16009	83	60	1
16010	83	59	1
16011	83	58	1
16012	83	57	1
16013	83	56	1
16014	83	55	1
16015	83	54	1
16016	83	53	1
16017	83	52	1
16018	83	51	1
16019	83	50	1
16020	83	49	1
16021	83	48	1
16022	83	47	1
16023	83	46	1
16024	83	45	1
16025	83	44	1
16026	83	43	1
16027	83	42	1
16028	83	41	1
16029	83	40	1
16030	83	39	1
16031	83	38	1
16032	83	37	1
16033	83	36	1
16034	83	35	1
16035	83	34	1
16036	83	33	1
16037	83	32	1
16038	83	31	1
16039	83	30	1
16040	83	29	1
16041	83	28	1
16042	83	27	1
16043	83	26	1
16044	83	25	1
16045	83	24	1
16046	83	23	1
16047	83	22	1
16048	83	21	1
16049	83	20	1
16050	83	19	1
16051	83	18	1
16052	83	17	1
16053	83	16	1
16054	83	15	1
16055	83	14	1
16056	83	13	1
16057	83	12	1
16058	83	11	1
16059	83	10	1
16060	83	9	1
16061	83	8	1
16062	83	7	1
16063	83	6	1
16064	83	5	1
16065	83	4	1
16066	83	3	1
16067	83	2	1
16068	83	1	1
16069	84	99	1
16070	84	98	1
16071	84	97	1
16072	84	96	1
16073	84	95	1
16074	84	94	1
16075	84	93	1
16076	84	92	1
16077	84	91	1
16078	84	90	1
16079	84	89	1
16080	84	88	1
16081	84	87	1
16082	84	86	1
16083	84	85	1
16084	84	84	1
16085	84	83	1
16086	84	82	1
16087	84	81	1
16088	84	80	1
16089	84	79	1
16090	84	78	1
16091	84	77	1
16092	84	76	1
16093	84	75	1
16094	84	74	1
16095	84	73	1
16096	84	72	1
16097	84	71	1
16098	84	70	1
16099	84	69	1
16100	84	68	1
16101	84	67	1
16102	84	66	1
16103	84	65	1
16104	84	64	1
16105	84	63	1
16106	84	62	1
16107	84	61	1
16108	84	60	1
16109	84	59	1
16110	84	58	1
16111	84	57	1
16112	84	56	1
16113	84	55	1
16114	84	54	1
16115	84	51	1
16116	84	50	1
16117	84	49	1
16118	84	48	1
16119	84	47	1
16120	84	46	1
16121	84	45	1
16122	84	44	1
16123	84	43	1
16124	84	42	1
16125	84	41	1
16126	84	40	1
16127	84	39	1
16128	84	38	1
16129	84	37	1
16130	84	36	1
16131	84	35	1
16132	84	34	1
16133	84	33	1
16134	84	32	1
16135	84	31	1
16136	84	30	1
16137	84	29	1
16138	84	28	1
16139	84	27	1
16140	84	26	1
16141	84	25	1
16142	84	24	1
16143	84	23	1
16144	84	22	1
16145	84	21	1
16146	84	20	1
16147	84	19	1
16148	84	18	1
16149	84	17	1
16150	84	16	1
16151	84	15	1
16152	84	14	1
16153	84	13	1
16154	84	12	1
16155	84	11	1
16156	84	10	1
16157	84	9	1
16158	84	8	1
16159	84	7	1
16160	84	6	1
16161	84	5	1
16162	84	4	1
16163	84	3	1
16164	84	2	1
16165	84	1	1
16166	85	84	2
16167	85	83	2
16168	85	82	2
16169	85	81	2
16170	85	80	2
16171	85	79	2
16172	85	78	2
16173	85	77	2
16174	85	76	2
16175	85	75	2
16176	85	74	2
16177	85	73	2
16178	85	72	2
16179	85	71	2
16180	85	70	2
16181	85	69	2
16182	85	68	2
16183	85	67	2
16184	85	66	2
16185	85	65	2
16186	85	64	2
16187	85	63	2
16188	85	62	2
16189	85	61	2
16190	85	60	2
16191	85	59	2
16192	85	58	2
16193	85	57	2
16194	85	56	2
16195	85	55	2
16196	85	54	2
16197	85	53	2
16198	85	52	2
16199	85	51	2
16200	85	50	1
16201	85	49	1
16202	85	48	1
16203	85	47	1
16204	85	46	1
16205	85	45	1
16206	85	44	1
16207	85	43	1
16208	85	42	1
16209	85	41	1
16210	85	40	1
16211	85	39	1
16212	85	38	1
16213	85	37	1
16214	85	36	1
16215	85	35	1
16216	85	34	1
16217	85	33	1
16218	85	32	1
16219	85	31	1
16220	85	30	1
16221	85	29	1
16222	85	28	1
16223	85	27	1
16224	85	26	1
16225	85	25	1
16226	85	24	1
16227	85	23	1
16228	85	22	1
16229	85	21	1
16230	85	20	1
16231	85	19	1
16232	85	18	1
16233	85	17	1
16234	85	16	1
16235	85	15	1
16236	85	14	1
16237	85	13	1
16238	85	12	1
16239	85	11	1
16240	85	10	1
16241	85	9	1
16242	85	8	1
16243	85	7	1
16244	85	6	1
16245	85	5	1
16246	85	4	1
16247	85	3	1
16248	85	2	1
16249	85	1	1
16250	86	88	2
16251	86	87	2
16252	86	86	2
16253	86	85	2
16254	86	84	2
16255	86	83	2
16256	86	82	2
16257	86	81	2
16258	86	80	2
16259	86	79	2
16260	86	78	2
16261	86	77	2
16262	86	76	2
16263	86	75	2
16264	86	74	2
16265	86	73	2
16266	86	72	2
16267	86	71	2
16268	86	70	2
16269	86	69	2
16270	86	68	2
16271	86	67	2
16272	86	66	2
16273	86	65	2
16274	86	64	2
16275	86	63	2
16276	86	62	2
16277	86	61	2
16278	86	60	2
16279	86	59	2
16280	86	58	2
16281	86	57	2
16282	86	56	2
16283	86	55	2
16284	86	54	2
16285	86	53	2
16286	86	52	2
16287	86	51	2
16288	86	50	1
16289	86	49	1
16290	86	48	1
16291	86	47	1
16292	86	46	1
16293	86	45	1
16294	86	44	1
16295	86	43	1
16296	86	42	1
16297	86	41	1
16298	86	40	1
16299	86	39	1
16300	86	38	1
16301	86	37	1
16302	86	36	1
16303	86	35	1
16304	86	34	1
16305	86	33	1
16306	86	32	1
16307	86	31	1
16308	86	30	1
16309	86	29	1
16310	86	28	1
16311	86	27	1
16312	86	26	1
16313	86	25	1
16314	86	24	1
16315	86	23	1
16316	86	22	1
16317	86	21	1
16318	86	20	1
16319	86	19	1
16320	86	18	1
16321	86	17	1
16322	86	16	1
16323	86	15	1
16324	86	14	1
16325	86	13	1
16326	86	12	1
16327	86	11	1
16328	86	10	1
16329	86	9	1
16330	86	8	1
16331	86	7	1
16332	86	6	1
16333	86	5	1
16334	86	4	1
16335	86	3	1
16336	86	2	1
16337	86	1	1
16338	87	34	2
16339	87	33	2
16340	87	32	2
16341	87	31	2
16342	87	30	2
16343	87	29	2
16344	87	28	2
16345	87	27	2
16346	87	26	2
16347	87	25	2
16348	87	24	2
16349	87	23	2
16350	87	22	2
16351	87	21	2
16352	87	20	2
16353	87	19	2
16354	87	18	2
16355	87	17	2
16356	87	16	2
16357	87	15	2
16358	87	14	2
16359	87	13	2
16360	87	12	2
16361	87	11	2
16362	87	10	2
16363	87	9	2
16364	87	8	2
16365	87	7	2
16366	87	6	2
16367	87	5	2
16368	87	4	2
16369	87	3	2
16370	87	2	2
16371	87	1	2
16372	87	46	1
16373	87	45	1
16374	87	44	1
16375	87	43	1
16376	87	42	1
16377	87	41	1
16378	87	40	1
16379	87	39	1
16380	87	38	1
16381	87	37	1
16382	87	36	1
16383	87	35	1
16384	87	34	1
16385	87	33	1
16386	87	32	1
16387	87	31	1
16388	87	30	1
16389	87	29	1
16390	87	28	1
16391	87	27	1
16392	87	26	1
16393	87	25	1
16394	87	24	1
16395	87	23	1
16396	87	22	1
16397	87	21	1
16398	87	20	1
16399	87	19	1
16400	87	18	1
16401	87	17	1
16402	87	16	1
16403	87	15	1
16404	87	14	1
16405	87	13	1
16406	87	12	1
16407	87	11	1
16408	87	10	1
16409	87	9	1
16410	87	8	1
16411	87	7	1
16412	87	6	1
16413	87	5	1
16414	87	4	1
16415	87	3	1
16416	87	2	1
16417	87	1	1
16418	88	183	3
16419	88	182	3
16420	88	181	3
16421	88	180	3
16422	88	179	3
16423	88	178	3
16424	88	177	3
16425	88	176	3
16426	88	175	3
16427	88	174	3
16428	88	173	3
16429	88	172	3
16430	88	171	3
16431	88	170	3
16432	88	169	3
16433	88	168	3
16434	88	167	3
16435	88	166	3
16436	88	165	3
16437	88	164	3
16438	88	163	3
16439	88	162	3
16440	88	161	3
16441	88	160	3
16442	88	159	3
16443	88	158	3
16444	88	157	3
16445	88	156	3
16446	88	155	3
16447	88	154	3
16448	88	153	3
16449	88	152	3
16450	88	151	3
16451	88	150	3
16452	88	149	3
16453	88	148	3
16454	88	147	3
16455	88	146	3
16456	88	145	3
16457	88	144	3
16458	88	143	3
16459	88	142	3
16460	88	141	3
16461	88	140	3
16462	88	139	3
16463	88	138	3
16464	88	137	3
16465	88	136	3
16466	88	135	3
16467	88	134	3
16468	88	133	3
16469	88	132	3
16470	88	131	3
16471	88	130	3
16472	88	129	3
16473	88	128	3
16474	88	127	3
16475	88	126	3
16476	88	125	3
16477	88	124	3
16478	88	123	3
16479	88	122	3
16480	88	121	3
16481	88	120	3
16482	88	119	3
16483	88	118	3
16484	88	117	3
16485	88	116	3
16486	88	115	3
16487	88	114	3
16488	88	113	3
16489	88	112	3
16490	88	111	3
16491	88	110	3
16492	88	109	3
16493	88	108	3
16494	88	107	3
16495	88	106	3
16496	88	105	3
16497	88	104	3
16498	88	103	3
16499	88	102	3
16500	88	101	3
16501	88	100	3
16502	88	99	3
16503	88	98	3
16504	88	97	3
16505	88	96	3
16506	88	95	3
16507	88	94	3
16508	88	93	3
16509	88	92	3
16510	88	91	3
16511	88	90	3
16512	88	89	3
16513	88	88	3
16514	88	87	3
16515	88	86	3
16516	88	85	3
16517	88	84	3
16518	88	83	3
16519	88	82	3
16520	88	81	3
16521	88	80	3
16522	88	79	3
16523	88	78	3
16524	88	77	3
16525	88	76	3
16526	88	75	3
16527	88	74	3
16528	88	73	3
16529	88	72	3
16530	88	71	3
16531	88	70	3
16532	88	69	3
16533	88	68	3
16534	88	67	3
16535	88	66	3
16536	88	65	3
16537	88	64	3
16538	88	63	3
16539	88	62	3
16540	88	61	3
16541	88	60	3
16542	88	59	3
16543	88	58	3
16544	88	57	3
16545	88	56	3
16546	88	55	3
16547	88	54	3
16548	88	53	3
16549	88	52	3
16550	88	51	3
16551	88	50	3
16552	88	49	3
16553	88	48	3
16554	88	47	3
16555	88	46	3
16556	88	45	3
16557	88	44	3
16558	88	43	3
16559	88	42	3
16560	88	41	3
16561	88	40	3
16562	88	39	3
16563	88	38	3
16564	88	37	3
16565	88	36	3
16566	88	35	3
16567	88	34	3
16568	88	33	3
16569	88	32	3
16570	88	31	3
16571	88	30	3
16572	88	29	3
16573	88	28	3
16574	88	27	3
16575	88	26	3
16576	88	25	3
16577	88	24	3
16578	88	23	3
16579	88	22	3
16580	88	21	3
16581	88	20	3
16582	88	19	3
16583	88	18	3
16584	88	17	3
16585	88	16	3
16586	88	15	3
16587	88	14	3
16588	88	13	3
16589	88	12	3
16590	88	11	3
16591	88	10	3
16592	88	9	3
16593	88	8	3
16594	88	7	3
16595	88	6	3
16596	88	5	3
16597	88	4	3
16598	88	3	3
16599	88	2	3
16600	88	1	3
16601	88	337	2
16602	88	336	2
16603	88	335	2
16604	88	334	2
16605	88	333	2
16606	88	332	2
16607	88	331	2
16608	88	330	2
16609	88	329	2
16610	88	328	2
16611	88	327	2
16612	88	326	2
16613	88	325	2
16614	88	324	2
16615	88	323	2
16616	88	322	2
16617	88	321	2
16618	88	320	2
16619	88	319	2
16620	88	318	2
16621	88	317	2
16622	88	316	2
16623	88	315	2
16624	88	314	2
16625	88	313	2
16626	88	312	2
16627	88	311	2
16628	88	310	2
16629	88	309	2
16630	88	308	2
16631	88	307	2
16632	88	306	2
16633	88	305	2
16634	88	304	2
16635	88	303	2
16636	88	302	2
16637	88	301	2
16638	88	300	2
16639	88	299	2
16640	88	298	2
16641	88	297	2
16642	88	296	2
16643	88	295	2
16644	88	294	2
16645	88	293	2
16646	88	292	2
16647	88	291	2
16648	88	290	2
16649	88	289	2
16650	88	288	2
16651	88	287	2
16652	88	286	2
16653	88	285	2
16654	88	284	2
16655	88	283	2
16656	88	282	2
16657	88	281	2
16658	88	280	2
16659	88	279	2
16660	88	278	2
16661	88	277	2
16662	88	276	2
16663	88	275	2
16664	88	274	2
16665	88	273	2
16666	88	272	2
16667	88	271	2
16668	88	270	2
16669	88	269	2
16670	88	268	2
16671	88	267	2
16672	88	266	2
16673	88	265	2
16674	88	264	2
16675	88	263	2
16676	88	262	2
16677	88	261	2
16678	88	260	2
16679	88	259	2
16680	88	258	2
16681	88	257	2
16682	88	256	2
16683	88	255	2
16684	88	254	2
16685	88	253	2
16686	88	252	2
16687	88	251	2
16688	88	250	2
16689	88	249	2
16690	88	248	2
16691	88	247	2
16692	88	246	2
16693	88	245	2
16694	88	244	2
16695	88	243	2
16696	88	242	2
16697	88	241	2
16698	88	240	2
16699	88	239	2
16700	88	238	2
16701	88	237	2
16702	88	236	2
16703	88	235	2
16704	88	234	2
16705	88	233	2
16706	88	232	2
16707	88	231	2
16708	88	230	2
16709	88	229	2
16710	88	228	2
16711	88	227	2
16712	88	226	2
16713	88	225	2
16714	88	224	2
16715	88	223	2
16716	88	222	2
16717	88	221	2
16718	88	220	2
16719	88	219	2
16720	88	218	2
16721	88	217	2
16722	88	216	2
16723	88	215	2
16724	88	214	2
16725	88	213	2
16726	88	212	2
16727	88	211	2
16728	88	210	2
16729	88	209	2
16730	88	208	2
16731	88	207	2
16732	88	206	2
16733	88	205	2
16734	88	204	2
16735	88	203	2
16736	88	202	2
16737	88	201	2
16738	88	200	2
16739	88	199	2
16740	88	198	2
16741	88	197	2
16742	88	196	2
16743	88	195	2
16744	88	194	2
16745	88	193	2
16746	88	192	2
16747	88	191	2
16748	88	190	2
16749	88	189	2
16750	88	188	2
16751	88	187	2
16752	88	186	2
16753	88	185	2
16754	88	184	2
16755	88	183	2
16756	88	182	2
16757	88	181	2
16758	88	180	2
16759	88	179	2
16760	88	178	2
16761	88	177	2
16762	88	176	2
16763	88	175	2
16764	88	174	2
16765	88	173	2
16766	88	172	2
16767	88	171	2
16768	88	170	2
16769	88	169	2
16770	88	168	2
16771	88	167	2
16772	88	166	2
16773	88	165	2
16774	88	164	2
16775	88	163	2
16776	88	162	2
16777	88	161	2
16778	88	160	2
16779	88	159	2
16780	88	158	2
16781	88	157	2
16782	88	156	2
16783	88	155	2
16784	88	154	2
16785	88	153	2
16786	88	152	2
16787	88	151	2
16788	88	150	2
16789	88	149	2
16790	88	148	2
16791	88	147	2
16792	88	146	2
16793	88	145	2
16794	88	144	2
16795	88	143	2
16796	88	142	2
16797	88	141	2
16798	88	140	2
16799	88	139	2
16800	88	138	2
16801	88	137	2
16802	88	136	2
16803	88	135	2
16804	88	134	2
16805	88	133	2
16806	88	132	2
16807	88	131	2
16808	88	130	2
16809	88	129	2
16810	88	128	2
16811	88	127	2
16812	88	126	2
16813	88	125	2
16814	88	124	2
16815	88	123	2
16816	88	122	2
16817	88	121	2
16818	88	120	2
16819	88	119	2
16820	88	118	2
16821	88	117	2
16822	88	116	2
16823	88	115	2
16824	88	114	2
16825	88	113	2
16826	88	112	2
16827	88	111	2
16828	88	110	2
16829	88	109	2
16830	88	108	2
16831	88	107	2
16832	88	106	2
16833	88	105	2
16834	88	104	2
16835	88	103	2
16836	88	102	2
16837	88	101	2
16838	88	100	2
16839	88	99	2
16840	88	98	2
16841	88	97	2
16842	88	96	2
16843	88	95	2
16844	88	94	2
16845	88	93	2
16846	88	92	2
16847	88	91	2
16848	88	90	2
16849	88	89	2
16850	88	88	2
16851	88	87	2
16852	88	86	2
16853	88	85	2
16854	88	84	2
16855	88	83	2
16856	88	82	2
16857	88	81	2
16858	88	80	2
16859	88	79	2
16860	88	78	2
16861	88	77	2
16862	88	76	2
16863	88	75	2
16864	88	74	2
16865	88	73	2
16866	88	72	2
16867	88	71	2
16868	88	70	2
16869	88	69	2
16870	88	68	2
16871	88	67	2
16872	88	66	2
16873	88	65	2
16874	88	64	2
16875	88	63	2
16876	88	62	2
16877	88	61	2
16878	88	60	2
16879	88	59	2
16880	88	58	2
16881	88	57	2
16882	88	56	2
16883	88	55	2
16884	88	54	2
16885	88	53	2
16886	88	52	2
16887	88	51	2
16888	88	50	2
16889	88	49	2
16890	88	48	2
16891	88	47	2
16892	88	46	2
16893	88	45	2
16894	88	44	2
16895	88	43	2
16896	88	42	2
16897	88	41	2
16898	88	40	2
16899	88	39	2
16900	88	38	2
16901	88	37	2
16902	88	36	2
16903	88	35	2
16904	88	34	2
16905	88	33	2
16906	88	32	2
16907	88	31	2
16908	88	30	2
16909	88	29	2
16910	88	28	2
16911	88	27	2
16912	88	26	2
16913	88	25	2
16914	88	24	2
16915	88	23	2
16916	88	22	2
16917	88	21	2
16918	88	20	2
16919	88	19	2
16920	88	18	2
16921	88	17	2
16922	88	16	2
16923	88	15	2
16924	88	14	2
16925	88	13	2
16926	88	12	2
16927	88	11	2
16928	88	10	2
16929	88	9	2
16930	88	8	2
16931	88	7	2
16932	88	6	2
16933	88	5	2
16934	88	4	2
16935	88	3	2
16936	88	2	2
16937	88	1	2
16938	88	0	2
16939	88	81	1
16940	88	80	1
16941	88	79	1
16942	88	78	1
16943	88	77	1
16944	88	76	1
16945	88	75	1
16946	88	74	1
16947	88	73	1
16948	88	72	1
16949	88	71	1
16950	88	70	1
16951	88	69	1
16952	88	68	1
16953	88	67	1
16954	88	66	1
16955	88	65	1
16956	88	64	1
16957	88	63	1
16958	88	62	1
16959	88	61	1
16960	88	60	1
16961	88	59	1
16962	88	58	1
16963	88	57	1
16964	88	56	1
16965	88	55	1
16966	88	54	1
16967	88	53	1
16968	88	52	1
16969	88	51	1
16970	88	50	1
16971	88	49	1
16972	88	48	1
16973	88	47	1
16974	88	46	1
16975	88	45	1
16976	88	44	1
16977	88	43	1
16978	88	42	1
16979	88	41	1
16980	88	40	1
16981	88	39	1
16982	88	38	1
16983	88	37	1
16984	88	36	1
16985	88	35	1
16986	88	34	1
16987	88	33	1
16988	88	32	1
16989	88	31	1
16990	88	30	1
16991	88	29	1
16992	88	28	1
16993	88	27	1
16994	88	26	1
16995	88	25	1
16996	88	24	1
16997	88	23	1
16998	88	22	1
16999	88	21	1
17000	88	20	1
17001	88	19	1
17002	88	18	1
17003	88	17	1
17004	88	16	1
17005	88	15	1
17006	88	14	1
17007	88	13	1
17008	88	12	1
17009	88	11	1
17010	88	10	1
17011	88	9	1
17012	88	8	1
17013	88	7	1
17014	88	6	1
17015	88	5	1
17016	88	4	1
17017	88	3	1
17018	88	2	1
17019	88	1	1
17020	88	0	1
17021	89	106	1
17022	89	105	1
17023	89	104	1
17024	89	103	1
17025	89	102	1
17026	89	101	1
17027	89	100	1
17028	89	99	1
17029	89	98	1
17030	89	97	1
17031	89	96	1
17032	89	95	1
17033	89	94	1
17034	89	93	1
17035	89	92	1
17036	89	91	1
17037	89	90	1
17038	89	89	1
17039	89	88	1
17040	89	87	1
17041	89	86	1
17042	89	85	1
17043	89	84	1
17044	89	83	1
17045	89	82	1
17046	89	81	1
17047	89	80	1
17048	89	79	1
17049	89	78	1
17050	89	77	1
17051	89	76	1
17052	89	75	1
17053	89	74	1
17054	89	73	1
17055	89	72	1
17056	89	71	1
17057	89	70	1
17058	89	69	1
17059	89	68	1
17060	89	67	1
17061	89	66	1
17062	89	65	1
17063	89	64	1
17064	89	63	1
17065	89	62	1
17066	89	61	1
17067	89	60	1
17068	89	59	1
17069	89	58	1
17070	89	57	1
17071	89	56	1
17072	89	55	1
17073	89	54	1
17074	89	53	1
17075	89	52	1
17076	89	51	1
17077	89	50	1
17078	89	49	1
17079	89	48	1
17080	89	47	1
17081	89	46	1
17082	89	45	1
17083	89	44	1
17084	89	43	1
17085	89	42	1
17086	89	41	1
17087	89	40	1
17088	89	39	1
17089	89	38	1
17090	89	37	1
17091	89	36	1
17092	89	35	1
17093	89	34	1
17094	89	33	1
17095	89	32	1
17096	89	31	1
17097	89	30	1
17098	89	29	1
17099	89	28	1
17100	89	27	1
17101	89	26	1
17102	89	25	1
17103	89	24	1
17104	89	23	1
17105	89	22	1
17106	89	21	1
17107	89	20	1
17108	89	19	1
17109	89	18	1
17110	89	17	1
17111	89	16	1
17112	89	15	1
17113	89	14	1
17114	89	13	1
17115	89	12	1
17116	89	11	1
17117	89	10	1
17118	89	9	1
17119	89	8	1
17120	89	7	1
17121	89	6	1
17122	89	5	1
17123	89	4	1
17124	89	3	1
17125	89	2	1
17126	89	1	1
17127	90	111	1
17128	90	110	1
17129	90	109	1
17130	90	108	1
17131	90	107	1
17132	90	106	1
17133	90	105	1
17134	90	104	1
17135	90	103	1
17136	90	102	1
17137	90	101	1
17138	90	100	1
17139	90	99	1
17140	90	98	1
17141	90	97	1
17142	90	96	1
17143	90	95	1
17144	90	94	1
17145	90	93	1
17146	90	92	1
17147	90	91	1
17148	90	90	1
17149	90	89	1
17150	90	88	1
17151	90	87	1
17152	90	86	1
17153	90	85	1
17154	90	84	1
17155	90	83	1
17156	90	82	1
17157	90	81	1
17158	90	80	1
17159	90	79	1
17160	90	78	1
17161	90	77	1
17162	90	76	1
17163	90	75	1
17164	90	74	1
17165	90	73	1
17166	90	72	1
17167	90	71	1
17168	90	70	1
17169	90	69	1
17170	90	68	1
17171	90	67	1
17172	90	66	1
17173	90	65	1
17174	90	64	1
17175	90	63	1
17176	90	62	1
17177	90	61	1
17178	90	60	1
17179	90	59	1
17180	90	58	1
17181	90	57	1
17182	90	56	1
17183	90	55	1
17184	90	54	1
17185	90	53	1
17186	90	52	1
17187	90	51	1
17188	90	50	1
17189	90	49	1
17190	90	48	1
17191	90	47	1
17192	90	46	1
17193	90	45	1
17194	90	44	1
17195	90	43	1
17196	90	42	1
17197	90	41	1
17198	90	40	1
17199	90	39	1
17200	90	38	1
17201	90	37	1
17202	90	36	1
17203	90	35	1
17204	90	34	1
17205	90	33	1
17206	90	32	1
17207	90	31	1
17208	90	30	1
17209	90	29	1
17210	90	28	1
17211	90	27	1
17212	90	26	1
17213	90	25	1
17214	90	24	1
17215	90	23	1
17216	90	22	1
17217	90	21	1
17218	90	20	1
17219	90	19	1
17220	90	18	1
17221	90	17	1
17222	90	16	1
17223	90	15	1
17224	90	14	1
17225	90	13	1
17226	90	12	1
17227	90	11	1
17228	90	10	1
17229	90	9	1
17230	90	8	1
17231	90	7	1
17232	90	6	1
17233	90	5	1
17234	90	4	1
17235	90	3	1
17236	90	2	1
17237	90	1	1
17238	91	83	2
17239	91	82	2
17240	91	81	2
17241	91	80	2
17242	91	79	2
17243	91	78	2
17244	91	77	2
17245	91	76	2
17246	91	75	2
17247	91	74	2
17248	91	73	2
17249	91	72	2
17250	91	71	2
17251	91	70	2
17252	91	69	2
17253	91	68	2
17254	91	67	2
17255	91	66	2
17256	91	65	2
17257	91	64	2
17258	91	63	2
17259	91	62	2
17260	91	61	2
17261	91	60	2
17262	91	59	2
17263	91	58	2
17264	91	57	2
17265	91	56	2
17266	91	55	2
17267	91	54	2
17268	91	53	2
17269	91	52	2
17270	91	51	2
17271	91	50	2
17272	91	49	2
17273	91	48	2
17274	91	47	2
17275	91	46	2
17276	91	45	2
17277	91	44	2
17278	91	43	2
17279	91	42	2
17280	91	41	2
17281	91	40	1
17282	91	39	1
17283	91	38	1
17284	91	37	1
17285	91	36	1
17286	91	35	1
17287	91	34	1
17288	91	33	1
17289	91	32	1
17290	91	31	1
17291	91	30	1
17292	91	29	1
17293	91	28	1
17294	91	27	1
17295	91	26	1
17296	91	25	1
17297	91	24	1
17298	91	23	1
17299	91	22	1
17300	91	21	1
17301	91	20	1
17302	91	19	1
17303	91	18	1
17304	91	17	1
17305	91	16	1
17306	91	15	1
17307	91	14	1
17308	91	13	1
17309	91	12	1
17310	91	11	1
17311	91	10	1
17312	91	9	1
17313	91	8	1
17314	91	7	1
17315	91	6	1
17316	91	5	1
17317	91	4	1
17318	91	3	1
17319	91	2	1
17320	91	1	1
17321	92	241	31
17322	92	240	31
17323	92	239	31
17324	92	238	31
17325	92	237	31
17326	92	236	31
17327	92	235	31
17328	92	234	31
17329	92	233	31
17330	92	232	31
17331	92	231	31
17332	92	230	31
17333	92	229	31
17334	92	228	31
17335	92	227	31
17336	92	226	31
17337	92	225	31
17338	92	224	31
17339	92	223	31
17340	92	222	31
17341	92	221	31
17342	92	220	31
17343	92	219	31
17344	92	218	31
17345	92	217	31
17346	92	216	31
17347	92	215	31
17348	92	214	31
17349	92	213	31
17350	92	212	31
17351	92	211	31
17352	92	210	31
17353	92	209	30
17354	92	208	30
17355	92	207	30
17356	92	206	30
17357	92	205	30
17358	92	204	30
17359	92	203	30
17360	92	202	30
17361	92	201	30
17362	92	200	30
17363	92	199	29
17364	92	198	29
17365	92	197	29
17366	92	196	29
17367	92	195	29
17368	92	193	29
17369	92	192	29
17370	92	191	29
17371	92	190	29
17372	92	189	28
17373	92	188	28
17374	92	187	28
17375	92	186	28
17376	92	185	28
17377	92	184	28
17378	92	183	28
17379	92	182	28
17380	92	181	28
17381	92	180	28
17382	92	179	27
17383	92	178	27
17384	92	177	27
17385	92	176	27
17386	92	175	27
17387	92	174	27
17388	92	173	27
17389	92	172	27
17390	92	171	27
17391	92	170	26
17392	92	169	26
17393	92	168	26
17394	92	167	26
17395	92	166	26
17396	92	165	26
17397	92	164	26
17398	92	163	25
17399	92	162	25
17400	92	161	25
17401	92	160	25
17402	92	159	25
17403	92	158	25
17404	92	157	25
17405	92	156	25
17406	92	155	25
17407	92	154	25
17408	92	153	24
17409	92	152	24
17410	92	151	24
17411	92	150	24
17412	92	149	23
17413	92	148	23
17414	92	147	23
17415	92	146	23
17416	92	145	22
17417	92	144	22
17418	92	143	22
17419	92	142	22
17420	92	141	22
17421	92	140	22
17422	92	139	21
17423	92	138	21
17424	92	137	21
17425	92	136	21
17426	92	135	20
17427	92	134	20
17428	92	133	19
17429	92	132	19
17430	92	131	19
17431	92	130	18
17432	92	129	18
17433	92	128	18
17434	92	127	17
17435	92	126	17
17436	92	125	16
17437	92	124	16
17438	92	123	16
17439	92	122	16
17440	92	121	15
17441	92	120	15
17442	92	119	14
17443	92	118	14
17444	92	117	14
17445	92	116	14
17446	92	115	14
17447	92	114	14
17448	92	113	14
17449	92	112	14
17450	92	111	13
17451	92	110	13
17452	92	109	13
17453	92	108	13
17454	92	107	13
17455	92	106	13
17456	92	105	13
17457	92	104	13
17458	92	103	12
17459	92	102	12
17460	92	101	12
17461	92	100	12
17462	92	99	12
17463	92	98	12
17464	92	97	12
17465	92	96	12
17466	92	95	12
17467	92	94	12
17468	92	93	11
17469	92	92	11
17470	92	91	11
17471	92	90	11
17472	92	89	11
17473	92	88	11
17474	92	87	11
17475	92	86	11
17476	92	85	11
17477	92	84	11
17478	92	83	11
17479	92	82	11
17480	92	81	10
17481	92	80	10
17482	92	79	10
17483	92	78	10
17484	92	77	10
17485	92	76	10
17486	92	75	10
17487	92	74	10
17488	92	73	10
17489	92	72	10
17490	92	71	10
17491	92	70	10
17492	92	69	9
17493	92	68	9
17494	92	67	9
17495	92	66	9
17496	92	65	9
17497	92	64	9
17498	92	63	9
17499	92	62	9
17500	92	61	9
17501	92	60	9
17502	92	59	9
17503	92	58	9
17504	92	57	9
17505	92	56	8
17506	92	55	8
17507	92	54	8
17508	92	53	8
17509	92	52	8
17510	92	51	8
17511	92	50	8
17512	92	49	8
17513	92	48	7
17514	92	47	7
17515	92	46	7
17516	92	45	7
17517	92	44	7
17518	92	43	7
17519	92	42	6
17520	92	41	6
17521	92	40	6
17522	92	39	6
17523	92	38	6
17524	92	37	6
17525	92	36	5
17526	92	35	5
17527	92	34	5
17528	92	33	5
17529	92	32	5
17530	92	31	4
17531	92	30	4
17532	92	29	4
17533	92	28	4
17534	92	27	4
17535	92	26	4
17536	92	25	4
17537	92	24	4
17538	92	23	4
17539	92	22	3
17540	92	21	3
17541	92	20	3
17542	92	19	3
17543	92	18	3
17544	92	17	3
17545	92	16	3
17546	92	15	2
17547	92	14	2
17548	92	13	2
17549	92	12	2
17550	92	11	2
17551	92	10	2
17552	92	9	2
17553	92	8	1
17554	92	7	1
17555	92	6	1
17556	92	5	1
17557	92	4	1
17558	92	3	1
17559	92	2	1
17560	92	1	1
17561	93	108	1
17562	93	107	1
17563	93	106	1
17564	93	105	1
17565	93	104	1
17566	93	103	1
17567	93	102	1
17568	93	101	1
17569	93	100	1
17570	93	99	1
17571	93	98	1
17572	93	97	1
17573	93	96	1
17574	93	95	1
17575	93	94	1
17576	93	93	1
17577	93	92	1
17578	93	91	1
17579	93	90	1
17580	93	89	1
17581	93	88	1
17582	93	87	1
17583	93	86	1
17584	93	85	1
17585	93	84	1
17586	93	83	1
17587	93	82	1
17588	93	81	1
17589	93	80	1
17590	93	79	1
17591	93	78	1
17592	93	77	1
17593	93	76	1
17594	93	75	1
17595	93	74	1
17596	93	73	1
17597	93	72	1
17598	93	71	1
17599	93	70	1
17600	93	69	1
17601	93	68	1
17602	93	67	1
17603	93	66	1
17604	93	65	1
17605	93	64	1
17606	93	63	1
17607	93	62	1
17608	93	61	1
17609	93	60	1
17610	93	59	1
17611	93	58	1
17612	93	57	1
17613	93	56	1
17614	93	55	1
17615	93	54	1
17616	93	53	1
17617	93	52	1
17618	93	51	1
17619	93	50	1
17620	93	49	1
17621	93	48	1
17622	93	47	1
17623	93	46	1
17624	93	45	1
17625	93	44	1
17626	93	43	1
17627	93	42	1
17628	93	41	1
17629	93	40	1
17630	93	39	1
17631	93	38	1
17632	93	37	1
17633	93	36	1
17634	93	35	1
17635	93	34	1
17636	93	33	1
17637	93	32	1
17638	93	31	1
17639	93	30	1
17640	93	29	1
17641	93	28	1
17642	93	27	1
17643	93	26	1
17644	93	25	1
17645	93	24	1
17646	93	23	1
17647	93	22	1
17648	93	21	1
17649	93	20	1
17650	93	19	1
17651	93	18	1
17652	93	17	1
17653	93	16	1
17654	93	15	1
17655	93	14	1
17656	93	13	1
17657	93	12	1
17658	93	11	1
17659	93	10	1
17660	93	9	1
17661	93	8	1
17662	93	7	1
17663	93	6	1
17664	93	5	1
17665	93	4	1
17666	93	3	1
17667	93	2	1
17668	93	1	1
17669	94	399	1
17670	94	398	1
17671	94	397	1
17672	94	396	1
17673	94	395	1
17674	94	394	1
17675	94	393	1
17676	94	392	1
17677	94	391	1
17678	94	390	1
17679	94	389	1
17680	94	388	1
17681	94	387	1
17682	94	386	1
17683	94	385	1
17684	94	384	1
17685	94	383	1
17686	94	382	1
17687	94	381	1
17688	94	380	1
17689	94	379	1
17690	94	378	1
17691	94	377	1
17692	94	376	1
17693	94	375	1
17694	94	374	1
17695	94	373	1
17696	94	372	1
17697	94	371	1
17698	94	370	1
17699	94	369	1
17700	94	368	1
17701	94	367	1
17702	94	366	1
17703	94	365	1
17704	94	364	1
17705	94	363	1
17706	94	362	1
17707	94	361	1
17708	94	360	1
17709	94	359	1
17710	94	358	1
17711	94	357	1
17712	94	356	1
17713	94	355	1
17714	94	354	1
17715	94	353	1
17716	94	352	1
17717	94	351	1
17718	94	350	1
17719	94	349	1
17720	94	348	1
17721	94	347	1
17722	94	346	1
17723	94	345	1
17724	94	344	1
17725	94	343	1
17726	94	342	1
17727	94	341	1
17728	94	340	1
17729	94	339	1
17730	94	338	1
17731	94	337	1
17732	94	336	1
17733	94	335	1
17734	94	334	1
17735	94	333	1
17736	94	332	1
17737	94	331	1
17738	94	330	1
17739	94	329	1
17740	94	328	1
17741	94	327	1
17742	94	326	1
17743	94	325	1
17744	94	324	1
17745	94	323	1
17746	94	322	1
17747	94	321	1
17748	94	320	1
17749	94	319	1
17750	94	318	1
17751	94	317	1
17752	94	316	1
17753	94	315	1
17754	94	314	1
17755	94	313	1
17756	94	312	1
17757	94	311	1
17758	94	310	1
17759	94	309	1
17760	94	308	1
17761	94	307	1
17762	94	306	1
17763	94	305	1
17764	94	304	1
17765	94	303	1
17766	94	302	1
17767	94	301	1
17768	94	300	1
17769	94	299	1
17770	94	298	1
17771	94	297	1
17772	94	296	1
17773	94	295	1
17774	94	294	1
17775	94	293	1
17776	94	292	1
17777	94	291	1
17778	94	290	1
17779	94	289	1
17780	94	288	1
17781	94	287	1
17782	94	286	1
17783	94	285	1
17784	94	284	1
17785	94	283	1
17786	94	282	1
17787	94	281	1
17788	94	280	1
17789	94	279	1
17790	94	278	1
17791	94	277	1
17792	94	276	1
17793	94	275	1
17794	94	274	1
17795	94	273	1
17796	94	272	1
17797	94	271	1
17798	94	270	1
17799	94	269	1
17800	94	268	1
17801	94	267	1
17802	94	266	1
17803	94	265	1
17804	94	264	1
17805	94	263	1
17806	94	262	1
17807	94	261	1
17808	94	260	1
17809	94	259	1
17810	94	258	1
17811	94	257	1
17812	94	256	1
17813	94	255	1
17814	94	254	1
17815	94	253	1
17816	94	252	1
17817	94	251	1
17818	94	250	1
17819	94	249	1
17820	94	248	1
17821	94	247	1
17822	94	246	1
17823	94	245	1
17824	94	244	1
17825	94	243	1
17826	94	242	1
17827	94	241	1
17828	94	240	1
17829	94	239	1
17830	94	238	1
17831	94	237	1
17832	94	236	1
17833	94	235	1
17834	94	234	1
17835	94	233	1
17836	94	232	1
17837	94	231	1
17838	94	230	1
17839	94	229	1
17840	94	228	1
17841	94	227	1
17842	94	226	1
17843	94	225	1
17844	94	224	1
17845	94	223	1
17846	94	222	1
17847	94	221	1
17848	94	220	1
17849	94	219	1
17850	94	218	1
17851	94	217	1
17852	94	216	1
17853	94	215	1
17854	94	214	1
17855	94	213	1
17856	94	212	1
17857	94	211	1
17858	94	210	1
17859	94	209	1
17860	94	208	1
17861	94	207	1
17862	94	206	1
17863	94	205	1
17864	94	204	1
17865	94	203	1
17866	94	202	1
17867	94	201	1
17868	94	200	1
17869	94	199	1
17870	94	198	1
17871	94	197	1
17872	94	196	1
17873	94	195	1
17874	94	194	1
17875	94	193	1
17876	94	192	1
17877	94	191	1
17878	94	190	1
17879	94	189	1
17880	94	188	1
17881	94	187	1
17882	94	186	1
17883	94	185	1
17884	94	184	1
17885	94	183	1
17886	94	182	1
17887	94	181	1
17888	94	180	1
17889	94	179	1
17890	94	178	1
17891	94	177	1
17892	94	176	1
17893	94	175	1
17894	94	174	1
17895	94	173	1
17896	94	172	1
17897	94	171	1
17898	94	170	1
17899	94	169	1
17900	94	168	1
17901	94	167	1
17902	94	166	1
17903	94	165	1
17904	94	164	1
17905	94	163	1
17906	94	162	1
17907	94	161	1
17908	94	160	1
17909	94	159	1
17910	94	158	1
17911	94	157	1
17912	94	156	1
17913	94	155	1
17914	94	154	1
17915	94	153	1
17916	94	152	1
17917	94	151	1
17918	94	150	1
17919	94	149	1
17920	94	148	1
17921	94	147	1
17922	94	146	1
17923	94	145	1
17924	94	144	1
17925	94	143	1
17926	94	142	1
17927	94	141	1
17928	94	140	1
17929	94	139	1
17930	94	138	1
17931	94	137	1
17932	94	136	1
17933	94	135	1
17934	94	134	1
17935	94	133	1
17936	94	132	1
17937	94	131	1
17938	94	130	1
17939	94	129	1
17940	94	128	1
17941	94	127	1
17942	94	126	1
17943	94	125	1
17944	94	124	1
17945	94	123	1
17946	94	122	1
17947	94	121	1
17948	94	120	1
17949	94	119	1
17950	94	118	1
17951	94	117	1
17952	94	116	1
17953	94	115	1
17954	94	114	1
17955	94	113	1
17956	94	112	1
17957	94	111	1
17958	94	110	1
17959	94	109	1
17960	94	108	1
17961	94	107	1
17962	94	106	1
17963	94	105	1
17964	94	104	1
17965	94	103	1
17966	94	102	1
17967	94	101	1
17968	94	100	1
17969	94	99	1
17970	94	98	1
17971	94	97	1
17972	94	96	1
17973	94	95	1
17974	94	94	1
17975	94	93	1
17976	94	92	1
17977	94	91	1
17978	94	90	1
17979	94	89	1
17980	94	88	1
17981	94	87	1
17982	94	86	1
17983	94	85	1
17984	94	84	1
17985	94	83	1
17986	94	82	1
17987	94	81	1
17988	94	80	1
17989	94	79	1
17990	94	78	1
17991	94	77	1
17992	94	76	1
17993	94	75	1
17994	94	74	1
17995	94	73	1
17996	94	72	1
17997	94	71	1
17998	94	70	1
17999	94	69	1
18000	94	68	1
18001	94	67	1
18002	94	66	1
18003	94	65	1
18004	94	64	1
18005	94	63	1
18006	94	62	1
18007	94	61	1
18008	94	60	1
18009	94	59	1
18010	94	58	1
18011	94	57	1
18012	94	56	1
18013	94	55	1
18014	94	54	1
18015	94	53	1
18016	94	52	1
18017	94	51	1
18018	94	50	1
18019	94	49	1
18020	94	48	1
18021	94	47	1
18022	94	46	1
18023	94	45	1
18024	94	44	1
18025	94	43	1
18026	94	42	1
18027	94	41	1
18028	94	40	1
18029	94	39	1
18030	94	38	1
18031	94	37	1
18032	94	36	1
18033	94	35	1
18034	94	34	1
18035	94	33	1
18036	94	32	1
18037	94	31	1
18038	94	30	1
18039	94	29	1
18040	94	28	1
18041	94	27	1
18042	94	26	1
18043	94	25	1
18044	94	24	1
18045	94	23	1
18046	94	22	1
18047	94	21	1
18048	94	20	1
18049	94	19	1
18050	94	18	1
18051	94	17	1
18052	94	16	1
18053	94	15	1
18054	94	14	1
18055	94	13	1
18056	94	12	1
18057	94	11	1
18058	94	10	1
18059	94	9	1
18060	94	8	1
18061	94	7	1
18062	94	6	1
18063	94	5	1
18064	94	4	1
18065	94	3	1
18066	94	2	1
18067	94	1	1
18068	95	191	2
18069	95	190	2
18070	95	189	2
18071	95	188	2
18072	95	187	2
18073	95	186	2
18074	95	185	2
18075	95	184	2
18076	95	183	2
18077	95	182	2
18078	95	181	2
18079	95	180	2
18080	95	179	2
18081	95	178	2
18082	95	177	2
18083	95	176	2
18084	95	175	2
18085	95	174	2
18086	95	173	2
18087	95	172	1
18088	95	171	1
18089	95	170	1
18090	95	169	1
18091	95	168	1
18092	95	167	1
18093	95	166	1
18094	95	165	1
18095	95	164	1
18096	95	163	1
18097	95	162	1
18098	95	161	1
18099	95	160	1
18100	95	159	1
18101	95	158	1
18102	95	157	1
18103	95	156	1
18104	95	155	1
18105	95	154	1
18106	95	153	1
18107	95	152	1
18108	95	151	1
18109	95	150	1
18110	95	149	1
18111	95	148	1
18112	95	147	1
18113	95	146	1
18114	95	145	1
18115	95	144	1
18116	95	143	1
18117	95	142	1
18118	95	141	1
18119	95	140	1
18120	95	139	1
18121	95	138	1
18122	95	137	1
18123	95	136	1
18124	95	135	1
18125	95	134	1
18126	95	133	1
18127	95	132	1
18128	95	131	1
18129	95	130	1
18130	95	129	1
18131	95	128	1
18132	95	127	1
18133	95	126	1
18134	95	125	1
18135	95	124	1
18136	95	123	1
18137	95	122	1
18138	95	121	1
18139	95	120	1
18140	95	119	1
18141	95	118	1
18142	95	117	1
18143	95	116	1
18144	95	115	1
18145	95	114	1
18146	95	113	1
18147	95	112	1
18148	95	111	1
18149	95	110	1
18150	95	109	1
18151	95	108	1
18152	95	107	1
18153	95	106	1
18154	95	105	1
18155	95	104	1
18156	95	103	1
18157	95	102	1
18158	95	101	1
18159	95	100	1
18160	95	99	1
18161	95	98	1
18162	95	97	1
18163	95	96	1
18164	95	95	1
18165	95	94	1
18166	95	93	1
18167	95	92	1
18168	95	91	1
18169	95	90	1
18170	95	89	1
18171	95	88	1
18172	95	87	1
18173	95	86	1
18174	95	85	1
18175	95	84	1
18176	95	83	1
18177	95	82	1
18178	95	81	1
18179	95	80	1
18180	95	79	1
18181	95	78	1
18182	95	77	1
18183	95	76	1
18184	95	75	1
18185	95	74	1
18186	95	73	1
18187	95	72	1
18188	95	71	1
18189	95	70	1
18190	95	69	1
18191	95	68	1
18192	95	67	1
18193	95	66	1
18194	95	65	1
18195	95	64	1
18196	95	63	1
18197	95	62	1
18198	95	61	1
18199	95	60	1
18200	95	59	1
18201	95	58	1
18202	95	57	1
18203	95	56	1
18204	95	55	1
18205	95	54	1
18206	95	53	1
18207	95	52	1
18208	95	51	1
18209	95	50	1
18210	95	49	1
18211	95	48	1
18212	95	47	1
18213	95	46	1
18214	95	45	1
18215	95	44	1
18216	95	43	1
18217	95	42	1
18218	95	41	1
18219	95	40	1
18220	95	39	1
18221	95	38	1
18222	95	37	1
18223	95	36	1
18224	95	35	1
18225	95	34	1
18226	95	33	1
18227	95	32	1
18228	95	31	1
18229	95	30	1
18230	95	29	1
18231	95	28	1
18232	95	27	1
18233	95	26	1
18234	95	25	1
18235	95	24	1
18236	95	23	1
18237	95	22	1
18238	95	21	1
18239	95	20	1
18240	95	19	1
18241	95	18	1
18242	95	17	1
18243	95	16	1
18244	95	15	1
18245	95	14	1
18246	95	13	1
18247	95	12	1
18248	95	11	1
18249	95	10	1
18250	95	9	1
18251	95	8	1
18252	95	7	1
18253	95	1	1
18254	95	0	1
18255	96	59	9
18256	96	58	9
18257	96	57	9
18258	96	56	9
18259	96	55	9
18260	96	54	9
18261	96	53	9
18262	96	52	9
18263	96	51	9
18264	96	50	9
18265	96	49	9
18266	96	48	9
18267	96	47	9
18268	96	46	8
18269	96	45	8
18270	96	44	8
18271	96	43	8
18272	96	42	8
18273	96	41	8
18274	96	40	8
18275	96	39	8
18276	96	38	8
18277	96	37	8
18278	96	36	8
18279	96	35	8
18280	96	34	8
18281	96	33	8
18282	96	32	8
18283	96	31	7
18284	96	30	7
18285	96	29	7
18286	96	28	7
18287	96	27	7
18288	96	26	7
18289	96	25	6
18290	96	24	6
18291	96	23	6
18292	96	22	6
18293	96	21	5
18294	96	20	5
18295	96	19	5
18296	96	18	5
18297	96	17	5
18298	96	16	4
18299	96	15	4
18300	96	14	4
18301	96	13	4
18302	96	12	3
18303	96	11	3
18304	96	9	3
18305	96	8	2
18306	96	7	2
18307	96	6	2
18308	96	5	2
18309	96	4	1
18310	96	3	1
18311	96	2	1
18312	96	1	1
18313	97	217	4
18314	97	216	4
18315	97	215	4
18316	97	214	4
18317	97	213	4
18318	97	212	3
18319	97	211	3
18320	97	210	3
18321	97	209	3
18322	97	208	3
18323	97	207	3
18324	97	206	3
18325	97	205	3
18326	97	204	3
18327	97	203	3
18328	97	202	3
18329	97	201	3
18330	97	200	3
18331	97	199	3
18332	97	198	3
18333	97	197	3
18334	97	196	3
18335	97	195	3
18336	97	194	3
18337	97	193	3
18338	97	192	3
18339	97	191	3
18340	97	190	3
18341	97	189	3
18342	97	188	3
18343	97	187	3
18344	97	186	3
18345	97	185	3
18346	97	184	3
18347	97	183	3
18348	97	182	3
18349	97	181	3
18350	97	180	3
18351	97	179	3
18352	97	178	3
18353	97	177	3
18354	97	176	3
18355	97	175	3
18356	97	174	3
18357	97	173	3
18358	97	172	3
18359	97	171	3
18360	97	170	3
18361	97	169	3
18362	97	168	3
18363	97	167	3
18364	97	166	3
18365	97	165	3
18366	97	164	3
18367	97	163	3
18368	97	162	3
18369	97	161	3
18370	97	160	3
18371	97	159	3
18372	97	158	3
18373	97	157	3
18374	97	156	3
18375	97	155	3
18376	97	154	3
18377	97	153	3
18378	97	152	3
18379	97	151	2
18380	97	150	2
18381	97	149	2
18382	97	148	2
18383	97	147	2
18384	97	146	2
18385	97	145	2
18386	97	144	2
18387	97	143	2
18388	97	142	2
18389	97	141	2
18390	97	140	2
18391	97	139	2
18392	97	138	2
18393	97	137	2
18394	97	136	2
18395	97	135	2
18396	97	134	2
18397	97	133	2
18398	97	132	2
18399	97	131	2
18400	97	130	2
18401	97	129	2
18402	97	128	2
18403	97	127	2
18404	97	126	2
18405	97	125	2
18406	97	124	2
18407	97	123	2
18408	97	122	2
18409	97	121	2
18410	97	120	2
18411	97	119	2
18412	97	118	2
18413	97	117	2
18414	97	116	2
18415	97	115	2
18416	97	114	2
18417	97	113	2
18418	97	112	2
18419	97	111	2
18420	97	110	2
18421	97	109	2
18422	97	108	2
18423	97	107	2
18424	97	106	2
18425	97	105	2
18426	97	104	2
18427	97	103	2
18428	97	102	2
18429	97	101	2
18430	97	100	2
18431	97	99	2
18432	97	98	2
18433	97	97	2
18434	97	96	2
18435	97	95	2
18436	97	94	2
18437	97	93	2
18438	97	92	2
18439	97	91	2
18440	97	90	2
18441	97	89	2
18442	97	88	2
18443	97	87	2
18444	97	86	2
18445	97	85	2
18446	97	84	2
18447	97	83	2
18448	97	82	2
18449	97	81	2
18450	97	80	2
18451	97	79	2
18452	97	78	2
18453	97	77	2
18454	97	76	2
18455	97	75	2
18456	97	74	2
18457	97	73	2
18458	97	72	2
18459	97	71	2
18460	97	70	2
18461	97	69	2
18462	97	68	2
18463	97	67	2
18464	97	66	1
18465	97	65	1
18466	97	64	1
18467	97	63	1
18468	97	62	1
18469	97	61	1
18470	97	60	1
18471	97	59	1
18472	97	58	1
18473	97	57	1
18474	97	56	1
18475	97	55	1
18476	97	54	1
18477	97	53	1
18478	97	52	1
18479	97	51	1
18480	97	50	1
18481	97	49	1
18482	97	48	1
18483	97	47	1
18484	97	46	1
18485	97	45	1
18486	97	44	1
18487	97	43	1
18488	97	42	1
18489	97	41	1
18490	97	40	1
18491	97	39	1
18492	97	38	1
18493	97	37	1
18494	97	36	1
18495	97	35	1
18496	97	34	1
18497	97	33	1
18498	97	32	1
18499	97	31	1
18500	97	30	1
18501	97	29	1
18502	97	28	1
18503	97	27	1
18504	97	26	1
18505	97	25	1
18506	97	24	1
18507	97	23	1
18508	97	22	1
18509	97	21	1
18510	97	20	1
18511	97	19	1
18512	97	18	1
18513	97	17	1
18514	97	16	1
18515	97	15	1
18516	97	14	1
18517	97	13	1
18518	97	12	1
18519	97	11	1
18520	97	10	1
18521	97	9	1
18522	97	8	1
18523	97	7	1
18524	97	6	1
18525	97	5	1
18526	97	4	1
18527	97	3	1
18528	97	2	1
18529	97	1	1
18530	98	91	2
18531	98	90	2
18532	98	89	2
18533	98	88	2
18534	98	87	2
18535	98	86	2
18536	98	85	2
18537	98	84	2
18538	98	83	2
18539	98	82	2
18540	98	81	2
18541	98	80	2
18542	98	79	2
18543	98	78	2
18544	98	77	2
18545	98	76	2
18546	98	75	2
18547	98	74	2
18548	98	73	2
18549	98	72	2
18550	98	71	2
18551	98	70	2
18552	98	69	2
18553	98	68	2
18554	98	67	2
18555	98	66	2
18556	98	65	1
18557	98	64	1
18558	98	63	1
18559	98	62	1
18560	98	61	1
18561	98	60	1
18562	98	59	1
18563	98	58	1
18564	98	57	1
18565	98	56	1
18566	98	55	1
18567	98	54	1
18568	98	53	1
18569	98	52	1
18570	98	51	1
18571	98	50	1
18572	98	49	1
18573	98	48	1
18574	98	47	1
18575	98	46	1
18576	98	45	1
18577	98	44	1
18578	98	43	1
18579	98	42	1
18580	98	41	1
18581	98	40	1
18582	98	39	1
18583	98	38	1
18584	98	37	1
18585	98	36	1
18586	98	35	1
18587	98	34	1
18588	98	33	1
18589	98	32	1
18590	98	31	1
18591	98	30	1
18592	98	29	1
18593	98	28	1
18594	98	27	1
18595	98	26	1
18596	98	25	1
18597	98	24	1
18598	98	23	1
18599	98	22	1
18600	98	21	1
18601	98	20	1
18602	98	19	1
18603	98	18	1
18604	98	17	1
18605	98	16	1
18606	98	15	1
18607	98	14	1
18608	98	13	1
18609	98	12	1
18610	98	11	1
18611	98	10	1
18612	98	9	1
18613	98	8	1
18614	98	7	1
18615	98	6	1
18616	98	5	1
18617	98	4	1
18618	98	3	1
18619	98	2	1
18620	98	1	1
18621	99	63	2
18622	99	62	2
18623	99	61	2
18624	99	60	2
18625	99	59	2
18626	99	58	2
18627	99	57	2
18628	99	56	2
18629	99	55	2
18630	99	54	2
18631	99	53	2
18632	99	52	2
18633	99	51	2
18634	99	50	2
18635	99	49	2
18636	99	48	2
18637	99	47	2
18638	99	46	2
18639	99	45	2
18640	99	44	2
18641	99	43	2
18642	99	42	2
18643	99	41	2
18644	99	40	2
18645	99	39	2
18646	99	38	2
18647	99	37	2
18648	99	36	2
18649	99	35	2
18650	99	34	2
18651	99	33	2
18652	99	32	2
18653	99	31	2
18654	99	30	2
18655	99	29	2
18656	99	28	2
18657	99	27	2
18658	99	26	2
18659	99	25	2
18660	99	24	2
18661	99	23	2
18662	99	22	2
18663	99	21	2
18664	99	20	2
18665	99	19	2
18666	99	18	2
18667	99	17	2
18668	99	16	2
18669	99	15	2
18670	99	14	2
18671	99	13	2
18672	99	12	2
18673	99	11	2
18674	99	10	2
18675	99	9	2
18676	99	8	2
18677	99	7	2
18678	99	6	2
18679	99	5	2
18680	99	4	2
18681	99	3	2
18682	99	2	2
18683	99	1	2
18684	99	46	1
18685	99	45	1
18686	99	44	1
18687	99	43	1
18688	99	42	1
18689	99	41	1
18690	99	40	1
18691	99	39	1
18692	99	38	1
18693	99	37	1
18694	99	36	1
18695	99	35	1
18696	99	34	1
18697	99	33	1
18698	99	32	1
18699	99	31	1
18700	99	30	1
18701	99	29	1
18702	99	28	1
18703	99	27	1
18704	99	26	1
18705	99	25	1
18706	99	24	1
18707	99	23	1
18708	99	22	1
18709	99	21	1
18710	99	20	1
18711	99	19	1
18712	99	18	1
18713	99	17	1
18714	99	16	1
18715	99	15	1
18716	99	14	1
18717	99	13	1
18718	99	12	1
18719	99	11	1
18720	99	10	1
18721	99	9	1
18722	99	8	1
18723	99	7	1
18724	99	6	1
18725	99	5	1
18726	99	4	1
18727	99	3	1
18728	99	2	1
18729	99	1	1
18730	100	205	24
18731	100	204	24
18732	100	203	23
18733	100	202	23
18734	100	201	23
18735	100	200	23
18736	100	199	23
18737	100	198	23
18738	100	197	23
18739	100	196	23
18740	100	195	23
18741	100	194	23
18742	100	193	23
18743	100	192	22
18744	100	191	22
18745	100	190	22
18746	100	189	22
18747	100	188	21
18748	100	187	21
18749	100	186	21
18750	100	185	21
18751	100	184	21
18752	100	183	21
18753	100	182	21
18754	100	181	20
18755	100	180	20
18756	100	179	20
18757	100	178	20
18758	100	177	20
18759	100	176	20
18760	100	175	20
18761	100	174	20
18762	100	173	20
18763	100	172	20
18764	100	171	20
18765	100	170	20
18766	100	169	19
18767	100	168	19
18768	100	167	19
18769	100	166	19
18770	100	165	19
18771	100	164	19
18772	100	163	19
18773	100	162	19
18774	100	161	19
18775	100	160	18
18776	100	159	18
18777	100	158	18
18778	100	157	18
18779	100	156	18
18780	100	155	18
18781	100	154	18
18782	100	153	18
18783	100	152	18
18784	100	151	17
18785	100	150	17
18786	100	149	17
18787	100	148	17
18788	100	147	17
18789	100	146	17
18790	100	145	17
18791	100	144	17
18792	100	143	17
18793	100	142	16
18794	100	141	16
18795	100	140	16
18796	100	139	16
18797	100	138	16
18798	100	137	16
18799	100	136	16
18800	100	135	16
18801	100	134	16
18802	100	133	15
18803	100	132	15
18804	100	131	15
18805	100	130	15
18806	100	129	15
18807	100	128	15
18808	100	127	15
18809	100	126	15
18810	100	125	15
18811	100	124	14
18812	100	123	14
18813	100	122	14
18814	100	121	14
18815	100	120	14
18816	100	119	14
18817	100	118	14
18818	100	117	14
18819	100	116	14
18820	100	115	13
18821	100	114	13
18822	100	113	13
18823	100	112	13
18824	100	111	13
18825	100	110	13
18826	100	109	13
18827	100	108	13
18828	100	107	13
18829	100	106	12
18830	100	105	12
18831	100	104	12
18832	100	103	12
18833	100	102	12
18834	100	101	12
18835	100	100	12
18836	100	99	12
18837	100	98	12
18838	100	97	11
18839	100	96	11
18840	100	95	11
18841	100	94	11
18842	100	93	11
18843	100	92	11
18844	100	91	11
18845	100	90	11
18846	100	89	11
18847	100	88	10
18848	100	87	10
18849	100	86	10
18850	100	85	10
18851	100	84	10
18852	100	83	10
18853	100	82	10
18854	100	81	10
18855	100	80	10
18856	100	79	9
18857	100	78	9
18858	100	77	9
18859	100	76	9
18860	100	75	9
18861	100	74	9
18862	100	73	9
18863	100	72	9
18864	100	71	9
18865	100	70	8
18866	100	69	8
18867	100	68	8
18868	100	67	8
18869	100	66	8
18870	100	65	8
18871	100	64	8
18872	100	63	8
18873	100	62	8
18874	100	61	7
18875	100	60	7
18876	100	59	7
18877	100	58	7
18878	100	57	7
18879	100	56	7
18880	100	55	7
18881	100	54	7
18882	100	53	7
18883	100	52	6
18884	100	51	6
18885	100	50	6
18886	100	49	6
18887	100	48	6
18888	100	47	6
18889	100	46	6
18890	100	45	6
18891	100	44	6
18892	100	43	5
18893	100	42	5
18894	100	41	5
18895	100	40	5
18896	100	39	5
18897	100	38	5
18898	100	37	5
18899	100	36	5
18900	100	35	5
18901	100	34	4
18902	100	33	4
18903	100	32	4
18904	100	31	4
18905	100	30	4
18906	100	29	4
18907	100	28	4
18908	100	27	4
18909	100	26	4
18910	100	25	3
18911	100	24	3
18912	100	23	3
18913	100	22	3
18914	100	21	3
18915	100	20	3
18916	100	19	3
18917	100	18	3
18918	100	17	3
18919	100	16	2
18920	100	15	2
18921	100	14	2
18922	100	13	2
18923	100	12	2
18924	100	11	2
18925	100	10	2
18926	100	9	2
18927	100	8	2
18928	100	7	1
18929	100	6	1
18930	100	5	1
18931	100	4	1
18932	100	3	1
18933	100	2	1
18934	100	1	1
18935	101	117	2
18936	101	116	2
18937	101	115	2
18938	101	114	2
18939	101	113	2
18940	101	112	2
18941	101	111	2
18942	101	110	2
18943	101	109	2
18944	101	108	2
18945	101	107	2
18946	101	106	2
18947	101	105	2
18948	101	104	2
18949	101	103	2
18950	101	102	2
18951	101	101	2
18952	101	100	2
18953	101	99	2
18954	101	98	2
18955	101	97	2
18956	101	96	2
18957	101	95	2
18958	101	94	2
18959	101	93	2
18960	101	92	1
18961	101	91	1
18962	101	90	1
18963	101	89	1
18964	101	88	1
18965	101	87	1
18966	101	86	1
18967	101	85	1
18968	101	84	1
18969	101	83	1
18970	101	82	1
18971	101	81	1
18972	101	80	1
18973	101	79	1
18974	101	78	1
18975	101	77	1
18976	101	76	1
18977	101	75	1
18978	101	74	1
18979	101	73	1
18980	101	72	1
18981	101	71	1
18982	101	70	1
18983	101	69	1
18984	101	68	1
18985	101	67	1
18986	101	66	1
18987	101	65	1
18988	101	64	1
18989	101	63	1
18990	101	62	1
18991	101	61	1
18992	101	60	1
18993	101	59	1
18994	101	58	1
18995	101	57	1
18996	101	56	1
18997	101	55	1
18998	101	54	1
18999	101	53	1
19000	101	52	1
19001	101	51	1
19002	101	50	1
19003	101	49	1
19004	101	48	1
19005	101	47	1
19006	101	46	1
19007	101	45	1
19008	101	44	1
19009	101	43	1
19010	101	42	1
19011	101	41	1
19012	101	40	1
19013	101	39	1
19014	101	38	1
19015	101	37	1
19016	101	36	1
19017	101	35	1
19018	101	34	1
19019	101	33	1
19020	101	32	1
19021	101	31	1
19022	101	30	1
19023	101	29	1
19024	101	28	1
19025	101	27	1
19026	101	26	1
19027	101	25	1
19028	101	24	1
19029	101	23	1
19030	101	22	1
19031	101	21	1
19032	101	20	1
19033	101	19	1
19034	101	18	1
19035	101	17	1
19036	101	16	1
19037	101	15	1
19038	101	14	1
19039	101	13	1
19040	101	12	1
19041	101	11	1
19042	101	10	1
19043	101	9	1
19044	101	8	1
19045	101	7	1
19046	101	6	1
19047	101	5	1
19048	101	4	1
19049	101	3	1
19050	101	2	1
19051	101	1	1
19052	102	23	2
19053	102	22	2
19054	102	21	2
19055	102	20	2
19056	102	19	2
19057	102	18	2
19058	102	17	2
19059	102	16	2
19060	102	15	2
19061	102	14	2
19062	102	13	2
19063	102	12	2
19064	102	11	2
19065	102	10	2
19066	102	9	2
19067	102	8	2
19068	102	7	2
19069	102	6	2
19070	102	5	2
19071	102	4	2
19072	102	3	2
19073	102	2	2
19074	102	1	2
19075	102	0	2
19076	102	84	1
19077	102	83	1
19078	102	82	1
19079	102	81	1
19080	102	80	1
19081	102	79	1
19082	102	78	1
19083	102	77	1
19084	102	76	1
19085	102	75	1
19086	102	74	1
19087	102	73	1
19088	102	72	1
19089	102	71	1
19090	102	70	1
19091	102	69	1
19092	102	68	1
19093	102	67	1
19094	102	66	1
19095	102	65	1
19096	102	64	1
19097	102	63	1
19098	102	62	1
19099	102	61	1
19100	102	60	1
19101	102	59	1
19102	102	58	1
19103	102	57	1
19104	102	56	1
19105	102	55	1
19106	102	54	1
19107	102	53	1
19108	102	52	1
19109	102	51	1
19110	102	50	1
19111	102	49	1
19112	102	48	1
19113	102	47	1
19114	102	46	1
19115	102	45	1
19116	102	44	1
19117	102	43	1
19118	102	42	1
19119	102	41	1
19120	102	40	1
19121	102	39	1
19122	102	38	1
19123	102	37	1
19124	102	36	1
19125	102	35	1
19126	102	34	1
19127	102	33	1
19128	102	32	1
19129	102	31	1
19130	102	30	1
19131	102	29	1
19132	102	28	1
19133	102	27	1
19134	102	26	1
19135	102	25	1
19136	102	24	1
19137	102	23	1
19138	102	22	1
19139	102	21	1
19140	102	20	1
19141	102	19	1
19142	102	18	1
19143	102	17	1
19144	102	16	1
19145	102	15	1
19146	102	14	1
19147	102	13	1
19148	102	12	1
19149	102	11	1
19150	102	10	1
19151	102	9	1
19152	102	8	1
19153	102	7	1
19154	102	6	1
19155	102	5	1
19156	102	4	1
19157	102	3	1
19158	102	2	1
19159	102	1	1
19160	103	668	30
19161	103	667	30
19162	103	666	29
19163	103	665	29
19164	103	664	29
19165	103	663	29
19166	103	662	29
19167	103	661	29
19168	103	660	29
19169	103	659	29
19170	103	658	29
19171	103	657	29
19172	103	656	29
19173	103	655	29
19174	103	654	29
19175	103	653	29
19176	103	652	29
19177	103	651	29
19178	103	650	29
19179	103	649	29
19180	103	648	29
19181	103	647	29
19182	103	646	29
19183	103	645	29
19184	103	644	29
19185	103	643	28
19186	103	642	28
19187	103	641	28
19188	103	640	28
19189	103	639	28
19190	103	638	28
19191	103	637	28
19192	103	636	28
19193	103	635	28
19194	103	634	28
19195	103	633	28
19196	103	632	28
19197	103	631	28
19198	103	630	28
19199	103	629	28
19200	103	628	28
19201	103	627	28
19202	103	626	28
19203	103	625	28
19204	103	624	28
19205	103	623	28
19206	103	622	28
19207	103	621	28
19208	103	620	28
19209	103	619	28
19210	103	618	27
19211	103	617	27
19212	103	616	27
19213	103	615	27
19214	103	614	27
19215	103	613	27
19216	103	612	27
19217	103	611	27
19218	103	610	27
19219	103	609	27
19220	103	608	27
19221	103	607	27
19222	103	606	27
19223	103	605	27
19224	103	604	27
19225	103	603	27
19226	103	602	27
19227	103	601	27
19228	103	600	27
19229	103	599	27
19230	103	598	27
19231	103	597	27
19232	103	596	27
19233	103	595	25
19234	103	594	25
19235	103	593	25
19236	103	592	25
19237	103	591	25
19238	103	590	25
19239	103	589	25
19240	103	588	25
19241	103	587	25
19242	103	586	25
19243	103	585	25
19244	103	584	25
19245	103	583	25
19246	103	582	25
19247	103	581	25
19248	103	580	25
19249	103	579	25
19250	103	578	25
19251	103	577	25
19252	103	576	25
19253	103	575	25
19254	103	574	25
19255	103	573	25
19256	103	572	25
19257	103	571	25
19258	103	570	24
19259	103	569	24
19260	103	568	24
19261	103	567	24
19262	103	566	24
19263	103	565	24
19264	103	564	24
19265	103	563	24
19266	103	562	24
19267	103	561	24
19268	103	560	24
19269	103	559	24
19270	103	558	24
19271	103	557	24
19272	103	556	24
19273	103	555	24
19274	103	554	24
19275	103	553	24
19276	103	552	24
19277	103	551	24
19278	103	550	23
19279	103	549	23
19280	103	548	23
19281	103	547	23
19282	103	546	23
19283	103	545	23
19284	103	544	23
19285	103	543	23
19286	103	542	23
19287	103	541	23
19288	103	540	23
19289	103	539	23
19290	103	538	23
19291	103	537	23
19292	103	536	23
19293	103	535	23
19294	103	534	23
19295	103	533	23
19296	103	532	23
19297	103	531	23
19298	103	530	23
19299	103	529	23
19300	103	528	22
19301	103	527	22
19302	103	526	22
19303	103	525	22
19304	103	524	22
19305	103	523	22
19306	103	522	22
19307	103	521	22
19308	103	520	22
19309	103	519	22
19310	103	518	22
19311	103	517	22
19312	103	516	22
19313	103	515	22
19314	103	514	22
19315	103	513	22
19316	103	512	22
19317	103	511	22
19318	103	510	22
19319	103	509	22
19320	103	508	22
19321	103	507	22
19322	103	506	22
19323	103	505	22
19324	103	504	21
19325	103	503	21
19326	103	502	21
19327	103	501	21
19328	103	500	21
19329	103	499	21
19330	103	498	21
19331	103	497	21
19332	103	496	21
19333	103	495	21
19334	103	494	21
19335	103	493	21
19336	103	492	21
19337	103	491	21
19338	103	490	21
19339	103	489	21
19340	103	488	21
19341	103	487	21
19342	103	486	21
19343	103	485	21
19344	103	484	21
19345	103	483	21
19346	103	482	21
19347	103	481	21
19348	103	480	21
19349	103	479	21
19350	103	478	21
19351	103	477	21
19352	103	476	21
19353	103	475	21
19354	103	474	21
19355	103	473	21
19356	103	472	21
19357	103	471	21
19358	103	470	21
19359	103	469	21
19360	103	468	21
19361	103	467	21
19362	103	466	21
19363	103	465	21
19364	103	464	21
19365	103	463	21
19366	103	462	21
19367	103	461	21
19368	103	460	21
19369	103	459	21
19370	103	458	21
19371	103	457	21
19372	103	456	20
19373	103	455	20
19374	103	454	20
19375	103	453	20
19376	103	452	20
19377	103	451	20
19378	103	450	20
19379	103	449	20
19380	103	448	20
19381	103	447	20
19382	103	446	20
19383	103	445	20
19384	103	444	20
19385	103	443	20
19386	103	442	20
19387	103	441	20
19388	103	440	20
19389	103	439	20
19390	103	438	20
19391	103	437	20
19392	103	436	20
19393	103	435	20
19394	103	434	20
19395	103	433	20
19396	103	432	19
19397	103	431	19
19398	103	430	19
19399	103	429	19
19400	103	428	19
19401	103	427	19
19402	103	426	19
19403	103	425	19
19404	103	424	19
19405	103	423	19
19406	103	422	19
19407	103	421	19
19408	103	420	19
19409	103	419	19
19410	103	418	19
19411	103	417	19
19412	103	416	19
19413	103	415	19
19414	103	414	19
19415	103	413	19
19416	103	412	19
19417	103	411	19
19418	103	410	19
19419	103	409	19
19420	103	408	19
19421	103	407	18
19422	103	406	18
19423	103	405	18
19424	103	404	18
19425	103	403	18
19426	103	402	18
19427	103	401	18
19428	103	400	18
19429	103	399	18
19430	103	398	18
19431	103	397	18
19432	103	396	18
19433	103	395	18
19434	103	394	18
19435	103	393	18
19436	103	392	18
19437	103	391	18
19438	103	390	18
19439	103	389	18
19440	103	388	17
19441	103	387	17
19442	103	386	17
19443	103	385	17
19444	103	384	17
19445	103	383	17
19446	103	382	17
19447	103	381	17
19448	103	380	17
19449	103	379	17
19450	103	378	17
19451	103	377	17
19452	103	376	17
19453	103	375	17
19454	103	374	17
19455	103	373	17
19456	103	372	17
19457	103	371	17
19458	103	370	17
19459	103	369	17
19460	103	368	17
19461	103	367	17
19462	103	366	17
19463	103	365	17
19464	103	364	17
19465	103	363	17
19466	103	362	17
19467	103	361	17
19468	103	360	17
19469	103	359	17
19470	103	358	16
19471	103	357	16
19472	103	356	16
19473	103	355	16
19474	103	354	16
19475	103	353	16
19476	103	352	16
19477	103	351	16
19478	103	350	16
19479	103	349	16
19480	103	348	16
19481	103	347	16
19482	103	346	16
19483	103	345	16
19484	103	344	16
19485	103	343	16
19486	103	342	16
19487	103	341	16
19488	103	340	16
19489	103	339	16
19490	103	338	16
19491	103	337	16
19492	103	336	16
19493	103	335	16
19494	103	334	16
19495	103	333	16
19496	103	332	16
19497	103	331	15
19498	103	330	15
19499	103	329	15
19500	103	328	15
19501	103	327	15
19502	103	326	15
19503	103	325	15
19504	103	324	15
19505	103	323	15
19506	103	322	15
19507	103	321	15
19508	103	320	15
19509	103	319	15
19510	103	318	15
19511	103	317	15
19512	103	316	15
19513	103	315	15
19514	103	314	15
19515	103	313	15
19516	103	312	15
19517	103	311	14
19518	103	310	14
19519	103	309	14
19520	103	308	14
19521	103	307	14
19522	103	306	14
19523	103	305	14
19524	103	304	14
19525	103	303	14
19526	103	302	14
19527	103	301	14
19528	103	300	14
19529	103	299	14
19530	103	298	14
19531	103	297	14
19532	103	296	14
19533	103	295	14
19534	103	294	14
19535	103	293	14
19536	103	292	14
19537	103	291	14
19538	103	290	14
19539	103	289	14
19540	103	288	13
19541	103	287	13
19542	103	286	13
19543	103	285	13
19544	103	284	13
19545	103	283	13
19546	103	282	13
19547	103	281	13
19548	103	280	13
19549	103	279	13
19550	103	278	13
19551	103	277	13
19552	103	276	13
19553	103	275	13
19554	103	274	13
19555	103	273	13
19556	103	272	13
19557	103	271	13
19558	103	270	13
19559	103	269	13
19560	103	268	12
19561	103	267	12
19562	103	266	12
19563	103	265	12
19564	103	264	12
19565	103	263	12
19566	103	262	12
19567	103	261	12
19568	103	260	12
19569	103	259	12
19570	103	258	12
19571	103	257	12
19572	103	256	12
19573	103	255	12
19574	103	254	12
19575	103	253	12
19576	103	252	12
19577	103	251	12
19578	103	250	12
19579	103	249	12
19580	103	248	12
19581	103	247	12
19582	103	246	12
19583	103	245	12
19584	103	244	12
19585	103	243	12
19586	103	242	12
19587	103	241	12
19588	103	240	12
19589	103	239	12
19590	103	238	11
19591	103	237	11
19592	103	236	11
19593	103	235	11
19594	103	234	11
19595	103	233	11
19596	103	232	11
19597	103	231	11
19598	103	230	11
19599	103	229	11
19600	103	228	11
19601	103	227	11
19602	103	226	11
19603	103	225	11
19604	103	224	11
19605	103	223	11
19606	103	222	11
19607	103	221	11
19608	103	220	11
19609	103	219	11
19610	103	218	11
19611	103	217	11
19612	103	216	10
19613	103	215	10
19614	103	214	10
19615	103	213	10
19616	103	212	10
19617	103	211	10
19618	103	210	10
19619	103	209	10
19620	103	208	10
19621	103	207	10
19622	103	206	10
19623	103	205	10
19624	103	204	10
19625	103	203	10
19626	103	202	10
19627	103	201	10
19628	103	200	10
19629	103	199	10
19630	103	198	10
19631	103	197	10
19632	103	196	10
19633	103	195	10
19634	103	194	10
19635	103	193	10
19636	103	192	10
19637	103	191	9
19638	103	190	9
19639	103	189	9
19640	103	188	9
19641	103	187	9
19642	103	186	9
19643	103	185	9
19644	103	184	9
19645	103	183	9
19646	103	182	9
19647	103	181	9
19648	103	180	9
19649	103	179	9
19650	103	178	9
19651	103	177	9
19652	103	176	9
19653	103	175	9
19654	103	174	9
19655	103	173	9
19656	103	172	9
19657	103	171	9
19658	103	170	9
19659	103	169	8
19660	103	168	8
19661	103	167	8
19662	103	166	8
19663	103	165	8
19664	103	164	8
19665	103	163	8
19666	103	162	8
19667	103	161	8
19668	103	160	8
19669	103	159	8
19670	103	158	8
19671	103	157	8
19672	103	156	8
19673	103	155	8
19674	103	154	8
19675	103	153	8
19676	103	152	8
19677	103	151	8
19678	103	150	8
19679	103	149	8
19680	103	148	8
19681	103	147	7
19682	103	146	7
19683	103	145	7
19684	103	144	7
19685	103	143	7
19686	103	142	7
19687	103	141	7
19688	103	140	7
19689	103	139	7
19690	103	138	7
19691	103	137	7
19692	103	136	7
19693	103	135	7
19694	103	134	7
19695	103	133	7
19696	103	132	7
19697	103	131	7
19698	103	130	7
19699	103	129	7
19700	103	128	7
19701	103	127	7
19702	103	126	7
19703	103	125	7
19704	103	124	7
19705	103	123	6
19706	103	122	6
19707	103	121	6
19708	103	120	6
19709	103	119	6
19710	103	118	6
19711	103	117	6
19712	103	116	6
19713	103	115	6
19714	103	114	6
19715	103	113	6
19716	103	112	6
19717	103	111	6
19718	103	110	6
19719	103	109	6
19720	103	108	6
19721	103	107	6
19722	103	106	5
19723	103	105	5
19724	103	104	5
19725	103	103	5
19726	103	102	5
19727	103	101	5
19728	103	100	5
19729	103	99	5
19730	103	98	5
19731	103	97	5
19732	103	96	5
19733	103	95	5
19734	103	94	5
19735	103	93	5
19736	103	92	5
19737	103	91	5
19738	103	90	5
19739	103	89	5
19740	103	88	5
19741	103	87	5
19742	103	86	5
19743	103	85	4
19744	103	84	4
19745	103	83	4
19746	103	82	4
19747	103	81	4
19748	103	80	4
19749	103	79	4
19750	103	78	4
19751	103	77	4
19752	103	76	4
19753	103	75	4
19754	103	74	4
19755	103	73	4
19756	103	72	4
19757	103	71	4
19758	103	70	4
19759	103	69	4
19760	103	68	4
19761	103	67	4
19762	103	66	4
19763	103	65	4
19764	103	64	4
19765	103	63	4
19766	103	62	4
19767	103	61	4
19768	103	60	4
19769	103	59	3
19770	103	58	3
19771	103	57	3
19772	103	56	3
19773	103	55	3
19774	103	54	3
19775	103	53	3
19776	103	52	3
19777	103	51	3
19778	103	50	3
19779	103	49	3
19780	103	48	3
19781	103	47	3
19782	103	46	3
19783	103	45	3
19784	103	44	3
19785	103	43	3
19786	103	42	3
19787	103	41	3
19788	103	40	3
19789	103	39	3
19790	103	38	3
19791	103	37	3
19792	103	36	2
19793	103	35	2
19794	103	34	2
19795	103	33	2
19796	103	32	2
19797	103	31	2
19798	103	30	2
19799	103	29	2
19800	103	28	2
19801	103	27	2
19802	103	26	2
19803	103	25	2
19804	103	24	2
19805	103	23	2
19806	103	22	2
19807	103	21	2
19808	103	20	1
19809	103	19	1
19810	103	18	1
19811	103	17	1
19812	103	16	1
19813	103	15	1
19814	103	14	1
19815	103	13	1
19816	103	12	1
19817	103	11	1
19818	103	10	1
19819	103	9	1
19820	103	8	1
19821	103	7	1
19822	103	6	1
19823	103	5	1
19824	103	4	1
19825	103	3	1
19826	103	2	1
19827	103	1	1
19828	103	0	1
19829	104	100	1
19830	104	99	1
19831	104	98	1
19832	104	97	1
19833	104	96	1
19834	104	95	1
19835	104	94	1
19836	104	93	1
19837	104	92	1
19838	104	91	1
19839	104	90	1
19840	104	89	1
19841	104	88	1
19842	104	87	1
19843	104	86	1
19844	104	85	1
19845	104	84	1
19846	104	83	1
19847	104	82	1
19848	104	81	1
19849	104	80	1
19850	104	79	1
19851	104	78	1
19852	104	77	1
19853	104	76	1
19854	104	75	1
19855	104	74	1
19856	104	73	1
19857	104	72	1
19858	104	71	1
19859	104	70	1
19860	104	69	1
19861	104	68	1
19862	104	67	1
19863	104	66	1
19864	104	65	1
19865	104	64	1
19866	104	63	1
19867	104	62	1
19868	104	61	1
19869	104	60	1
19870	104	59	1
19871	104	58	1
19872	104	57	1
19873	104	56	1
19874	104	55	1
19875	104	54	1
19876	104	53	1
19877	104	52	1
19878	104	51	1
19879	104	50	1
19880	104	49	1
19881	104	48	1
19882	104	47	1
19883	104	46	1
19884	104	45	1
19885	104	44	1
19886	104	43	1
19887	104	42	1
19888	104	41	1
19889	104	40	1
19890	104	39	1
19891	104	38	1
19892	104	37	1
19893	104	36	1
19894	104	35	1
19895	104	34	1
19896	104	33	1
19897	104	32	1
19898	104	31	1
19899	104	30	1
19900	104	29	1
19901	104	28	1
19902	104	27	1
19903	104	26	1
19904	104	25	1
19905	104	24	1
19906	104	23	1
19907	104	22	1
19908	104	21	1
19909	104	20	1
19910	104	19	1
19911	104	18	1
19912	104	17	1
19913	104	16	1
19914	104	15	1
19915	104	14	1
19916	104	13	1
19917	104	12	1
19918	104	11	1
19919	104	10	1
19920	104	9	1
19921	104	8	1
19922	104	7	1
19923	104	6	1
19924	104	5	1
19925	104	4	1
19926	104	3	1
19927	104	2	1
19928	104	1	1
19929	104	0	1
19930	105	62	1
19931	105	61	1
19932	105	60	1
19933	105	59	1
19934	105	58	1
19935	105	57	1
19936	105	56	1
19937	105	55	1
19938	105	54	1
19939	105	53	1
19940	105	52	1
19941	105	51	1
19942	105	50	1
19943	105	49	1
19944	105	48	1
19945	105	47	1
19946	105	46	1
19947	105	45	1
19948	105	44	1
19949	105	43	1
19950	105	42	1
19951	105	41	1
19952	105	40	1
19953	105	39	1
19954	105	38	1
19955	105	37	1
19956	105	36	1
19957	105	35	1
19958	105	34	1
19959	105	33	1
19960	105	32	1
19961	105	31	1
19962	105	30	1
19963	105	29	1
19964	105	28	1
19965	105	27	1
19966	105	26	1
19967	105	25	1
19968	105	24	1
19969	105	23	1
19970	105	22	1
19971	105	21	1
19972	105	20	1
19973	105	19	1
19974	105	18	1
19975	105	17	1
19976	105	16	1
19977	105	15	1
19978	105	14	1
19979	105	13	1
19980	105	12	1
19981	105	11	1
19982	105	10	1
19983	105	9	1
19984	105	8	1
19985	105	7	1
19986	105	6	1
19987	105	5	1
19988	105	4	1
19989	105	3	1
19990	105	2	1
19991	105	1	1
19992	106	172	2
19993	106	171	2
19994	106	170	2
19995	106	169	2
19996	106	168	2
19997	106	167	2
19998	106	166	2
19999	106	165	2
20000	106	164	2
20001	106	163	2
20002	106	162	2
20003	106	161	2
20004	106	160	2
20005	106	159	2
20006	106	158	2
20007	106	157	2
20008	106	156	2
20009	106	155	2
20010	106	154	2
20011	106	153	2
20012	106	152	2
20013	106	151	2
20014	106	150	2
20015	106	149	2
20016	106	148	2
20017	106	147	2
20018	106	146	2
20019	106	145	2
20020	106	144	2
20021	106	143	2
20022	106	142	2
20023	106	141	2
20024	106	140	2
20025	106	139	2
20026	106	138	2
20027	106	137	2
20028	106	136	2
20029	106	135	2
20030	106	134	2
20031	106	133	2
20032	106	132	2
20033	106	131	2
20034	106	130	2
20035	106	129	1
20036	106	128	1
20037	106	127	1
20038	106	126	1
20039	106	125	1
20040	106	124	1
20041	106	123	1
20042	106	122	1
20043	106	121	1
20044	106	120	1
20045	106	119	1
20046	106	118	1
20047	106	117	1
20048	106	116	1
20049	106	115	1
20050	106	114	1
20051	106	113	1
20052	106	112	1
20053	106	111	1
20054	106	110	1
20055	106	109	1
20056	106	108	1
20057	106	107	1
20058	106	106	1
20059	106	105	1
20060	106	104	1
20061	106	103	1
20062	106	102	1
20063	106	101	1
20064	106	100	1
20065	106	99	1
20066	106	98	1
20067	106	97	1
20068	106	96	1
20069	106	95	1
20070	106	94	1
20071	106	93	1
20072	106	92	1
20073	106	91	1
20074	106	90	1
20075	106	89	1
20076	106	88	1
20077	106	87	1
20078	106	86	1
20079	106	85	1
20080	106	84	1
20081	106	83	1
20082	106	82	1
20083	106	81	1
20084	106	80	1
20085	106	79	1
20086	106	78	1
20087	106	77	1
20088	106	76	1
20089	106	75	1
20090	106	74	1
20091	106	73	1
20092	106	72	1
20093	106	71	1
20094	106	70	1
20095	106	69	1
20096	106	68	1
20097	106	67	1
20098	106	66	1
20099	106	65	1
20100	106	64	1
20101	106	63	1
20102	106	62	1
20103	106	61	1
20104	106	60	1
20105	106	59	1
20106	106	58	1
20107	106	57	1
20108	106	56	1
20109	106	55	1
20110	106	54	1
20111	106	53	1
20112	106	52	1
20113	106	51	1
20114	106	50	1
20115	106	49	1
20116	106	48	1
20117	106	47	1
20118	106	46	1
20119	106	45	1
20120	106	44	1
20121	106	43	1
20122	106	42	1
20123	106	41	1
20124	106	40	1
20125	106	39	1
20126	106	38	1
20127	106	37	1
20128	106	36	1
20129	106	35	1
20130	106	34	1
20131	106	33	1
20132	106	32	1
20133	106	31	1
20134	106	30	1
20135	106	29	1
20136	106	28	1
20137	106	27	1
20138	106	26	1
20139	106	25	1
20140	106	24	1
20141	106	23	1
20142	106	22	1
20143	106	21	1
20144	106	20	1
20145	106	19	1
20146	106	18	1
20147	106	17	1
20148	106	16	1
20149	106	15	1
20150	106	14	1
20151	106	13	1
20152	106	12	1
20153	106	11	1
20154	106	10	1
20155	106	9	1
20156	106	8	1
20157	106	7	1
20158	106	6	1
20159	106	5	1
20160	106	4	1
20161	106	3	1
20162	106	2	1
20163	106	1	1
20164	107	143	4
20165	107	142	4
20166	107	141	4
20167	107	140	4
20168	107	139	4
20169	107	138	4
20170	107	137	4
20171	107	136	4
20172	107	135	4
20173	107	134	4
20174	107	133	4
20175	107	132	4
20176	107	131	4
20177	107	130	4
20178	107	129	4
20179	107	128	4
20180	107	127	4
20181	107	126	4
20182	107	125	4
20183	107	124	4
20184	107	123	4
20185	107	122	4
20186	107	121	4
20187	107	120	4
20188	107	119	4
20189	107	118	4
20190	107	117	4
20191	107	116	4
20192	107	115	4
20193	107	114	4
20194	107	113	4
20195	107	112	4
20196	107	111	4
20197	107	110	4
20198	107	109	3
20199	107	108	3
20200	107	107	3
20201	107	106	3
20202	107	105	3
20203	107	104	3
20204	107	103	3
20205	107	102	3
20206	107	101	3
20207	107	100	3
20208	107	99	3
20209	107	98	3
20210	107	97	3
20211	107	96	3
20212	107	95	3
20213	107	94	3
20214	107	93	3
20215	107	92	3
20216	107	91	3
20217	107	90	3
20218	107	89	3
20219	107	88	3
20220	107	87	3
20221	107	86	3
20222	107	85	3
20223	107	84	3
20224	107	83	3
20225	107	82	2
20226	107	81	2
20227	107	80	2
20228	107	79	2
20229	107	78	2
20230	107	77	2
20231	107	76	2
20232	107	75	2
20233	107	74	2
20234	107	73	2
20235	107	72	2
20236	107	71	2
20237	107	70	2
20238	107	69	2
20239	107	68	2
20240	107	67	2
20241	107	66	2
20242	107	65	2
20243	107	64	2
20244	107	63	2
20245	107	62	2
20246	107	61	2
20247	107	60	2
20248	107	59	2
20249	107	58	2
20250	107	57	2
20251	107	56	2
20252	107	55	2
20253	107	54	2
20254	107	53	2
20255	107	52	2
20256	107	51	2
20257	107	50	2
20258	107	49	2
20259	107	48	2
20260	107	47	2
20261	107	46	2
20262	107	45	2
20263	107	44	2
20264	107	43	2
20265	107	42	2
20266	107	41	2
20267	107	40	1
20268	107	39	1
20269	107	38	1
20270	107	37	1
20271	107	36	1
20272	107	35	1
20273	107	34	1
20274	107	33	1
20275	107	32	1
20276	107	31	1
20277	107	30	1
20278	107	29	1
20279	107	28	1
20280	107	27	1
20281	107	26	1
20282	107	25	1
20283	107	24	1
20284	107	23	1
20285	107	22	1
20286	107	21	1
20287	107	20	1
20288	107	19	1
20289	107	18	1
20290	107	17	1
20291	107	16	1
20292	107	15	1
20293	107	14	1
20294	107	13	1
20295	107	12	1
20296	107	11	1
20297	107	10	1
20298	107	9	1
20299	107	8	1
20300	107	7	1
20301	107	6	1
20302	107	5	1
20303	107	4	1
20304	107	3	1
20305	107	2	1
20306	107	1	1
20307	107	0	1
20308	108	39	1
20309	108	38	1
20310	108	37	1
20311	108	36	1
20312	108	35	1
20313	108	34	1
20314	108	33	1
20315	108	32	1
20316	108	31	1
20317	108	30	1
20318	108	29	1
20319	108	28	1
20320	108	27	1
20321	108	26	1
20322	108	25	1
20323	108	24	1
20324	108	23	1
20325	108	22	1
20326	108	21	1
20327	108	20	1
20328	108	19	1
20329	108	18	1
20330	108	17	1
20331	108	16	1
20332	108	15	1
20333	108	14	1
20334	108	13	1
20335	108	12	1
20336	108	11	1
20337	108	10	1
20338	108	9	1
20339	108	8	1
20340	108	7	1
20341	108	6	1
20342	108	5	1
20343	108	4	1
20344	108	3	1
20345	108	2	1
20346	108	1	1
20347	109	98	2
20348	109	97	2
20349	109	96	2
20350	109	95	2
20351	109	94	2
20352	109	93	2
20353	109	92	2
20354	109	91	2
20355	109	90	2
20356	109	89	2
20357	109	88	2
20358	109	87	2
20359	109	86	2
20360	109	85	2
20361	109	84	2
20362	109	83	2
20363	109	82	2
20364	109	81	2
20365	109	80	2
20366	109	79	2
20367	109	78	2
20368	109	77	2
20369	109	76	2
20370	109	75	2
20371	109	74	2
20372	109	73	2
20373	109	72	2
20374	109	71	2
20375	109	70	2
20376	109	69	2
20377	109	68	2
20378	109	67	2
20379	109	66	2
20380	109	65	2
20381	109	64	2
20382	109	63	2
20383	109	62	2
20384	109	61	1
20385	109	60	1
20386	109	59	1
20387	109	58	1
20388	109	57	1
20389	109	56	1
20390	109	55	1
20391	109	54	1
20392	109	53	1
20393	109	52	1
20394	109	51	1
20395	109	50	1
20396	109	49	1
20397	109	48	1
20398	109	47	1
20399	109	46	1
20400	109	45	1
20401	109	44	1
20402	109	43	1
20403	109	42	1
20404	109	41	1
20405	109	40	1
20406	109	39	1
20407	109	38	1
20408	109	37	1
20409	109	36	1
20410	109	35	1
20411	109	34	1
20412	109	33	1
20413	109	32	1
20414	109	31	1
20415	109	30	1
20416	109	29	1
20417	109	28	1
20418	109	27	1
20419	109	26	1
20420	109	25	1
20421	109	24	1
20422	109	23	1
20423	109	22	1
20424	109	21	1
20425	109	20	1
20426	109	19	1
20427	109	18	1
20428	109	17	1
20429	109	16	1
20430	109	15	1
20431	109	14	1
20432	109	13	1
20433	109	12	1
20434	109	11	1
20435	109	10	1
20436	109	9	1
20437	109	8	1
20438	109	7	1
20439	109	6	1
20440	109	5	1
20441	109	4	1
20442	109	3	1
20443	109	2	1
20444	109	1	1
20445	110	37	1
20446	110	36	1
20447	110	35	1
20448	110	34	1
20449	110	33	1
20450	110	32	1
20451	110	31	1
20452	110	30	1
20453	110	29	1
20454	110	28	1
20455	110	27	1
20456	110	26	1
20457	110	25	1
20458	110	24	1
20459	110	23	1
20460	110	22	1
20461	110	21	1
20462	110	20	1
20463	110	19	1
20464	110	18	1
20465	110	17	1
20466	110	16	1
20467	110	15	1
20468	110	14	1
20469	110	13	1
20470	110	12	1
20471	110	11	1
20472	110	10	1
20473	110	9	1
20474	110	8	1
20475	110	7	1
20476	110	6	1
20477	110	5	1
20478	110	4	1
20479	110	3	1
20480	110	2	1
20481	110	1	1
20482	111	32	6
20483	111	31	6
20484	111	30	6
20485	111	29	6
20486	111	28	6
20487	111	27	6
20488	111	26	5
20489	111	25	5
20490	111	24	5
20491	111	23	5
20492	111	22	5
20493	111	21	4
20494	111	20	4
20495	111	19	4
20496	111	18	4
20497	111	17	4
20498	111	16	3
20499	111	15	3
20500	111	13	3
20501	111	12	2
20502	111	10	2
20503	111	9	1
20504	111	8	1
20505	111	7	1
20506	111	6	1
20507	111	5	1
20508	111	4	1
20509	111	2	1
20510	111	1	1
20511	112	127	3
20512	112	126	3
20513	112	125	3
20514	112	124	3
20515	112	123	3
20516	112	122	3
20517	112	121	3
20518	112	120	3
20519	112	119	3
20520	112	118	3
20521	112	117	3
20522	112	116	3
20523	112	115	3
20524	112	114	3
20525	112	113	3
20526	112	112	3
20527	112	111	3
20528	112	110	3
20529	112	109	3
20530	112	108	3
20531	112	107	3
20532	112	106	3
20533	112	105	3
20534	112	104	3
20535	112	103	3
20536	112	102	3
20537	112	101	3
20538	112	100	3
20539	112	99	3
20540	112	98	3
20541	112	97	3
20542	112	96	3
20543	112	95	3
20544	112	94	3
20545	112	93	3
20546	112	92	3
20547	112	91	3
20548	112	90	3
20549	112	89	3
20550	112	88	3
20551	112	87	3
20552	112	86	3
20553	112	85	3
20554	112	84	3
20555	112	83	3
20556	112	82	3
20557	112	81	3
20558	112	80	3
20559	112	79	3
20560	112	78	3
20561	112	77	3
20562	112	76	3
20563	112	75	3
20564	112	74	3
20565	112	73	3
20566	112	72	3
20567	112	71	3
20568	112	70	3
20569	112	69	3
20570	112	68	3
20571	112	67	2
20572	112	66	2
20573	112	65	2
20574	112	64	2
20575	112	63	2
20576	112	62	2
20577	112	61	2
20578	112	60	1
20579	112	59	1
20580	112	58	1
20581	112	57	1
20582	112	56	1
20583	112	55	1
20584	112	54	1
20585	112	53	1
20586	112	52	1
20587	112	51	1
20588	112	50	1
20589	112	49	1
20590	112	48	1
20591	112	47	1
20592	112	46	1
20593	112	45	1
20594	112	44	1
20595	112	43	1
20596	112	42	1
20597	112	41	1
20598	112	40	1
20599	112	39	1
20600	112	38	1
20601	112	37	1
20602	112	36	1
20603	112	35	1
20604	112	34	1
20605	112	33	1
20606	112	32	1
20607	112	31	1
20608	112	30	1
20609	112	29	1
20610	112	28	1
20611	112	27	1
20612	112	26	1
20613	112	25	1
20614	112	24	1
20615	112	23	1
20616	112	22	1
20617	112	21	1
20618	112	20	1
20619	112	19	1
20620	112	18	1
20621	112	17	1
20622	112	16	1
20623	112	15	1
20624	112	14	1
20625	112	13	1
20626	112	12	1
20627	112	11	1
20628	112	10	1
20629	112	9	1
20630	112	8	1
20631	112	7	1
20632	112	6	1
20633	112	5	1
20634	112	4	1
20635	112	3	1
20636	112	2	1
20637	112	1	1
20638	113	91	2
20639	113	90	2
20640	113	89	2
20641	113	88	2
20642	113	87	2
20643	113	86	2
20644	113	85	2
20645	113	84	2
20646	113	83	2
20647	113	82	2
20648	113	81	2
20649	113	80	2
20650	113	79	2
20651	113	78	2
20652	113	77	2
20653	113	76	2
20654	113	75	2
20655	113	74	2
20656	113	73	2
20657	113	72	2
20658	113	71	2
20659	113	70	2
20660	113	69	2
20661	113	68	2
20662	113	67	2
20663	113	66	2
20664	113	65	2
20665	113	64	2
20666	113	63	2
20667	113	62	2
20668	113	61	2
20669	113	60	1
20670	113	59	1
20671	113	58	1
20672	113	57	1
20673	113	56	1
20674	113	55	1
20675	113	54	1
20676	113	53	1
20677	113	52	1
20678	113	51	1
20679	113	50	1
20680	113	49	1
20681	113	48	1
20682	113	47	1
20683	113	46	1
20684	113	45	1
20685	113	44	1
20686	113	43	1
20687	113	42	1
20688	113	41	1
20689	113	40	1
20690	113	39	1
20691	113	38	1
20692	113	37	1
20693	113	36	1
20694	113	35	1
20695	113	34	1
20696	113	33	1
20697	113	32	1
20698	113	31	1
20699	113	30	1
20700	113	29	1
20701	113	28	1
20702	113	27	1
20703	113	26	1
20704	113	25	1
20705	113	24	1
20706	113	23	1
20707	113	22	1
20708	113	21	1
20709	113	20	1
20710	113	19	1
20711	113	18	1
20712	113	17	1
20713	113	16	1
20714	113	15	1
20715	113	14	1
20716	113	13	1
20717	113	12	1
20718	113	11	1
20719	113	10	1
20720	113	9	1
20721	113	8	1
20722	113	7	1
20723	113	6	1
20724	113	5	1
20725	113	4	1
20726	113	3	1
20727	113	2	1
20728	113	1	1
20729	114	50	1
20730	114	49	1
20731	114	48	1
20732	114	47	1
20733	114	46	1
20734	114	45	1
20735	114	44	1
20736	114	43	1
20737	114	42	1
20738	114	41	1
20739	114	40	1
20740	114	39	1
20741	114	38	1
20742	114	37	1
20743	114	36	1
20744	114	35	1
20745	114	34	1
20746	114	33	1
20747	114	32	1
20748	114	31	1
20749	114	30	1
20750	114	29	1
20751	114	28	1
20752	114	27	1
20753	114	26	1
20754	114	25	1
20755	114	24	1
20756	114	23	1
20757	114	22	1
20758	114	21	1
20759	114	20	1
20760	114	19	1
20761	114	18	1
20762	114	17	1
20763	114	16	1
20764	114	15	1
20765	114	14	1
20766	114	13	1
20767	114	12	1
20768	114	11	1
20769	114	10	1
20770	114	9	1
20771	114	8	1
20772	114	7	1
20773	114	6	1
20774	114	5	1
20775	114	4	1
20776	114	3	1
20777	114	2	1
20778	114	1	1
20779	114	0	1
20780	115	35	1
20781	115	34	1
20782	115	33	1
20783	115	32	1
20784	115	31	1
20785	115	30	1
20786	115	29	1
20787	115	28	1
20788	115	27	1
20789	115	26	1
20790	115	25	1
20791	115	24	1
20792	115	23	1
20793	115	22	1
20794	115	21	1
20795	115	20	1
20796	115	19	1
20797	115	18	1
20798	115	17	1
20799	115	16	1
20800	115	15	1
20801	115	14	1
20802	115	13	1
20803	115	12	1
20804	115	11	1
20805	115	10	1
20806	115	9	1
20807	115	8	1
20808	115	7	1
20809	115	6	1
20810	115	5	1
20811	115	4	1
20812	115	3	1
20813	115	2	1
20814	115	1	1
20815	116	917	1
20816	116	916	1
20817	116	915	1
20818	116	914	1
20819	116	913	1
20820	116	912	1
20821	116	911	1
20822	116	910	1
20823	116	909	1
20824	116	908	1
20825	116	907	1
20826	116	906	1
20827	116	905	1
20828	116	904	1
20829	116	903	1
20830	116	902	1
20831	116	901	1
20832	116	900	1
20833	116	899	1
20834	116	898	1
20835	116	897	1
20836	116	896	1
20837	116	895	1
20838	116	894	1
20839	116	893	1
20840	116	892	1
20841	116	891	1
20842	116	890	1
20843	116	889	1
20844	116	888	1
20845	116	887	1
20846	116	886	1
20847	116	885	1
20848	116	884	1
20849	116	883	1
20850	116	882	1
20851	116	881	1
20852	116	880	1
20853	116	879	1
20854	116	878	1
20855	116	877	1
20856	116	876	1
20857	116	875	1
20858	116	874	1
20859	116	873	1
20860	116	872	1
20861	116	871	1
20862	116	870	1
20863	116	869	1
20864	116	868	1
20865	116	867	1
20866	116	866	1
20867	116	865	1
20868	116	864	1
20869	116	863	1
20870	116	862	1
20871	116	861	1
20872	116	860	1
20873	116	859	1
20874	116	858	1
20875	116	857	1
20876	116	856	1
20877	116	855	1
20878	116	854	1
20879	116	853	1
20880	116	852	1
20881	116	851	1
20882	116	850	1
20883	116	849	1
20884	116	848	1
20885	116	847	1
20886	116	846	1
20887	116	845	1
20888	116	844	1
20889	116	843	1
20890	116	842	1
20891	116	841	1
20892	116	840	1
20893	116	839	1
20894	116	838	1
20895	116	837	1
20896	116	836	1
20897	116	835	1
20898	116	834	1
20899	116	833	1
20900	116	832	1
20901	116	831	1
20902	116	830	1
20903	116	829	1
20904	116	828	1
20905	116	827	1
20906	116	826	1
20907	116	825	1
20908	116	824	1
20909	116	823	1
20910	116	822	1
20911	116	821	1
20912	116	820	1
20913	116	819	1
20914	116	818	1
20915	116	817	1
20916	116	816	1
20917	116	815	1
20918	116	814	1
20919	116	813	1
20920	116	812	1
20921	116	811	1
20922	116	810	1
20923	116	809	1
20924	116	808	1
20925	116	807	1
20926	116	806	1
20927	116	805	1
20928	116	804	1
20929	116	803	1
20930	116	802	1
20931	116	801	1
20932	116	800	1
20933	116	799	1
20934	116	798	1
20935	116	797	1
20936	116	796	1
20937	116	795	1
20938	116	794	1
20939	116	793	1
20940	116	792	1
20941	116	791	1
20942	116	790	1
20943	116	789	1
20944	116	788	1
20945	116	787	1
20946	116	786	1
20947	116	785	1
20948	116	784	1
20949	116	783	1
20950	116	782	1
20951	116	781	1
20952	116	780	1
20953	116	779	1
20954	116	778	1
20955	116	777	1
20956	116	776	1
20957	116	775	1
20958	116	774	1
20959	116	773	1
20960	116	772	1
20961	116	771	1
20962	116	770	1
20963	116	769	1
20964	116	768	1
20965	116	767	1
20966	116	766	1
20967	116	765	1
20968	116	764	1
20969	116	763	1
20970	116	762	1
20971	116	761	1
20972	116	760	1
20973	116	759	1
20974	116	758	1
20975	116	757	1
20976	116	756	1
20977	116	755	1
20978	116	754	1
20979	116	753	1
20980	116	752	1
20981	116	751	1
20982	116	750	1
20983	116	749	1
20984	116	748	1
20985	116	747	1
20986	116	746	1
20987	116	745	1
20988	116	744	1
20989	116	743	1
20990	116	742	1
20991	116	741	1
20992	116	740	1
20993	116	739	1
20994	116	738	1
20995	116	737	1
20996	116	736	1
20997	116	735	1
20998	116	734	1
20999	116	733	1
21000	116	732	1
21001	116	731	1
21002	116	730	1
21003	116	729	1
21004	116	728	1
21005	116	727	1
21006	116	726	1
21007	116	725	1
21008	116	724	1
21009	116	723	1
21010	116	722	1
21011	116	721	1
21012	116	720	1
21013	116	719	1
21014	116	718	1
21015	116	717	1
21016	116	716	1
21017	116	715	1
21018	116	714	1
21019	116	713	1
21020	116	712	1
21021	116	711	1
21022	116	710	1
21023	116	709	1
21024	116	708	1
21025	116	707	1
21026	116	706	1
21027	116	705	1
21028	116	704	1
21029	116	703	1
21030	116	702	1
21031	116	701	1
21032	116	700	1
21033	116	699	1
21034	116	698	1
21035	116	697	1
21036	116	696	1
21037	116	695	1
21038	116	694	1
21039	116	693	1
21040	116	692	1
21041	116	691	1
21042	116	690	1
21043	116	689	1
21044	116	688	1
21045	116	687	1
21046	116	686	1
21047	116	685	1
21048	116	684	1
21049	116	683	1
21050	116	682	1
21051	116	681	1
21052	116	680	1
21053	116	679	1
21054	116	678	1
21055	116	677	1
21056	116	676	1
21057	116	675	1
21058	116	674	1
21059	116	673	1
21060	116	672	1
21061	116	671	1
21062	116	670	1
21063	116	669	1
21064	116	668	1
21065	116	667	1
21066	116	666	1
21067	116	665	1
21068	116	664	1
21069	116	663	1
21070	116	662	1
21071	116	661	1
21072	116	660	1
21073	116	659	1
21074	116	658	1
21075	116	657	1
21076	116	656	1
21077	116	655	1
21078	116	654	1
21079	116	653	1
21080	116	652	1
21081	116	651	1
21082	116	650	1
21083	116	649	1
21084	116	648	1
21085	116	647	1
21086	116	646	1
21087	116	645	1
21088	116	644	1
21089	116	643	1
21090	116	642	1
21091	116	641	1
21092	116	640	1
21093	116	639	1
21094	116	638	1
21095	116	637	1
21096	116	636	1
21097	116	635	1
21098	116	634	1
21099	116	633	1
21100	116	632	1
21101	116	631	1
21102	116	630	1
21103	116	629	1
21104	116	628	1
21105	116	627	1
21106	116	626	1
21107	116	625	1
21108	116	624	1
21109	116	623	1
21110	116	622	1
21111	116	621	1
21112	116	620	1
21113	116	619	1
21114	116	618	1
21115	116	617	1
21116	116	616	1
21117	116	615	1
21118	116	614	1
21119	116	613	1
21120	116	612	1
21121	116	611	1
21122	116	610	1
21123	116	609	1
21124	116	608	1
21125	116	607	1
21126	116	606	1
21127	116	605	1
21128	116	604	1
21129	116	603	1
21130	116	602	1
21131	116	601	1
21132	116	600	1
21133	116	599	1
21134	116	598	1
21135	116	597	1
21136	116	596	1
21137	116	595	1
21138	116	594	1
21139	116	593	1
21140	116	592	1
21141	116	591	1
21142	116	590	1
21143	116	589	1
21144	116	588	1
21145	116	587	1
21146	116	586	1
21147	116	585	1
21148	116	584	1
21149	116	583	1
21150	116	582	1
21151	116	581	1
21152	116	580	1
21153	116	579	1
21154	116	578	1
21155	116	577	1
21156	116	576	1
21157	116	575	1
21158	116	574	1
21159	116	573	1
21160	116	572	1
21161	116	571	1
21162	116	570	1
21163	116	569	1
21164	116	568	1
21165	116	567	1
21166	116	566	1
21167	116	565	1
21168	116	564	1
21169	116	563	1
21170	116	562	1
21171	116	561	1
21172	116	560	1
21173	116	559	1
21174	116	558	1
21175	116	557	1
21176	116	556	1
21177	116	555	1
21178	116	554	1
21179	116	553	1
21180	116	552	1
21181	116	551	1
21182	116	550	1
21183	116	549	1
21184	116	548	1
21185	116	547	1
21186	116	546	1
21187	116	545	1
21188	116	544	1
21189	116	543	1
21190	116	542	1
21191	116	541	1
21192	116	540	1
21193	116	539	1
21194	116	538	1
21195	116	537	1
21196	116	536	1
21197	116	535	1
21198	116	534	1
21199	116	533	1
21200	116	532	1
21201	116	531	1
21202	116	530	1
21203	116	529	1
21204	116	528	1
21205	116	527	1
21206	116	526	1
21207	116	525	1
21208	116	524	1
21209	116	523	1
21210	116	522	1
21211	116	521	1
21212	116	520	1
21213	116	519	1
21214	116	518	1
21215	116	517	1
21216	116	516	1
21217	116	515	1
21218	116	514	1
21219	116	513	1
21220	116	512	1
21221	116	511	1
21222	116	510	1
21223	116	509	1
21224	116	508	1
21225	116	507	1
21226	116	506	1
21227	116	505	1
21228	116	504	1
21229	116	503	1
21230	116	502	1
21231	116	501	1
21232	116	500	1
21233	116	499	1
21234	116	498	1
21235	116	497	1
21236	116	496	1
21237	116	495	1
21238	116	494	1
21239	116	493	1
21240	116	492	1
21241	116	491	1
21242	116	490	1
21243	116	489	1
21244	116	488	1
21245	116	487	1
21246	116	486	1
21247	116	485	1
21248	116	484	1
21249	116	483	1
21250	116	482	1
21251	116	481	1
21252	116	480	1
21253	116	479	1
21254	116	478	1
21255	116	477	1
21256	116	476	1
21257	116	475	1
21258	116	474	1
21259	116	473	1
21260	116	472	1
21261	116	471	1
21262	116	470	1
21263	116	469	1
21264	116	468	1
21265	116	467	1
21266	116	466	1
21267	116	465	1
21268	116	464	1
21269	116	463	1
21270	116	462	1
21271	116	461	1
21272	116	460	1
21273	116	459	1
21274	116	458	1
21275	116	457	1
21276	116	456	1
21277	116	455	1
21278	116	454	1
21279	116	453	1
21280	116	452	1
21281	116	451	1
21282	116	450	1
21283	116	449	1
21284	116	448	1
21285	116	447	1
21286	116	446	1
21287	116	445	1
21288	116	444	1
21289	116	443	1
21290	116	442	1
21291	116	441	1
21292	116	440	1
21293	116	439	1
21294	116	438	1
21295	116	437	1
21296	116	436	1
21297	116	435	1
21298	116	434	1
21299	116	433	1
21300	116	432	1
21301	116	431	1
21302	116	430	1
21303	116	429	1
21304	116	428	1
21305	116	427	1
21306	116	426	1
21307	116	425	1
21308	116	424	1
21309	116	423	1
21310	116	422	1
21311	116	421	1
21312	116	420	1
21313	116	419	1
21314	116	418	1
21315	116	417	1
21316	116	416	1
21317	116	415	1
21318	116	414	1
21319	116	413	1
21320	116	412	1
21321	116	411	1
21322	116	410	1
21323	116	409	1
21324	116	408	1
21325	116	407	1
21326	116	406	1
21327	116	405	1
21328	116	404	1
21329	116	403	1
21330	116	402	1
21331	116	401	1
21332	116	400	1
21333	116	399	1
21334	116	398	1
21335	116	397	1
21336	116	396	1
21337	116	395	1
21338	116	394	1
21339	116	393	1
21340	116	392	1
21341	116	391	1
21342	116	390	1
21343	116	389	1
21344	116	388	1
21345	116	387	1
21346	116	386	1
21347	116	385	1
21348	116	384	1
21349	116	383	1
21350	116	382	1
21351	116	381	1
21352	116	380	1
21353	116	379	1
21354	116	378	1
21355	116	377	1
21356	116	376	1
21357	116	375	1
21358	116	374	1
21359	116	373	1
21360	116	372	1
21361	116	371	1
21362	116	370	1
21363	116	369	1
21364	116	368	1
21365	116	367	1
21366	116	366	1
21367	116	365	1
21368	116	364	1
21369	116	363	1
21370	116	362	1
21371	116	361	1
21372	116	360	1
21373	116	359	1
21374	116	358	1
21375	116	357	1
21376	116	356	1
21377	116	355	1
21378	116	354	1
21379	116	353	1
21380	116	352	1
21381	116	351	1
21382	116	350	1
21383	116	349	1
21384	116	348	1
21385	116	347	1
21386	116	346	1
21387	116	345	1
21388	116	344	1
21389	116	343	1
21390	116	342	1
21391	116	341	1
21392	116	340	1
21393	116	339	1
21394	116	338	1
21395	116	337	1
21396	116	336	1
21397	116	335	1
21398	116	334	1
21399	116	333	1
21400	116	332	1
21401	116	331	1
21402	116	330	1
21403	116	329	1
21404	116	328	1
21405	116	327	1
21406	116	326	1
21407	116	325	1
21408	116	324	1
21409	116	323	1
21410	116	322	1
21411	116	321	1
21412	116	320	1
21413	116	319	1
21414	116	318	1
21415	116	317	1
21416	116	316	1
21417	116	315	1
21418	116	314	1
21419	116	313	1
21420	116	312	1
21421	116	311	1
21422	116	310	1
21423	116	309	1
21424	116	308	1
21425	116	307	1
21426	116	306	1
21427	116	305	1
21428	116	304	1
21429	116	303	1
21430	116	302	1
21431	116	301	1
21432	116	300	1
21433	116	299	1
21434	116	298	1
21435	116	297	1
21436	116	296	1
21437	116	295	1
21438	116	294	1
21439	116	293	1
21440	116	292	1
21441	116	291	1
21442	116	290	1
21443	116	289	1
21444	116	288	1
21445	116	287	1
21446	116	286	1
21447	116	285	1
21448	116	284	1
21449	116	283	1
21450	116	282	1
21451	116	281	1
21452	116	280	1
21453	116	279	1
21454	116	278	1
21455	116	277	1
21456	116	276	1
21457	116	275	1
21458	116	274	1
21459	116	273	1
21460	116	272	1
21461	116	271	1
21462	116	270	1
21463	116	269	1
21464	116	268	1
21465	116	267	1
21466	116	266	1
21467	116	265	1
21468	116	264	1
21469	116	263	1
21470	116	262	1
21471	116	261	1
21472	116	260	1
21473	116	259	1
21474	116	258	1
21475	116	257	1
21476	116	256	1
21477	116	255	1
21478	116	254	1
21479	116	253	1
21480	116	252	1
21481	116	251	1
21482	116	250	1
21483	116	249	1
21484	116	248	1
21485	116	247	1
21486	116	246	1
21487	116	245	1
21488	116	244	1
21489	116	243	1
21490	116	242	1
21491	116	241	1
21492	116	240	1
21493	116	239	1
21494	116	238	1
21495	116	237	1
21496	116	236	1
21497	116	235	1
21498	116	234	1
21499	116	233	1
21500	116	232	1
21501	116	231	1
21502	116	230	1
21503	116	229	1
21504	116	228	1
21505	116	227	1
21506	116	226	1
21507	116	225	1
21508	116	224	1
21509	116	223	1
21510	116	222	1
21511	116	221	1
21512	116	220	1
21513	116	219	1
21514	116	218	1
21515	116	217	1
21516	116	216	1
21517	116	215	1
21518	116	214	1
21519	116	213	1
21520	116	212	1
21521	116	211	1
21522	116	210	1
21523	116	209	1
21524	116	208	1
21525	116	207	1
21526	116	206	1
21527	116	205	1
21528	116	204	1
21529	116	203	1
21530	116	202	1
21531	116	201	1
21532	116	200	1
21533	116	199	1
21534	116	198	1
21535	116	197	1
21536	116	196	1
21537	116	195	1
21538	116	194	1
21539	116	193	1
21540	116	192	1
21541	116	191	1
21542	116	190	1
21543	116	189	1
21544	116	188	1
21545	116	187	1
21546	116	186	1
21547	116	185	1
21548	116	184	1
21549	116	183	1
21550	116	182	1
21551	116	181	1
21552	116	180	1
21553	116	179	1
21554	116	178	1
21555	116	177	1
21556	116	176	1
21557	116	175	1
21558	116	174	1
21559	116	173	1
21560	116	172	1
21561	116	171	1
21562	116	170	1
21563	116	169	1
21564	116	168	1
21565	116	167	1
21566	116	166	1
21567	116	165	1
21568	116	164	1
21569	116	163	1
21570	116	162	1
21571	116	161	1
21572	116	160	1
21573	116	159	1
21574	116	158	1
21575	116	157	1
21576	116	156	1
21577	116	155	1
21578	116	154	1
21579	116	153	1
21580	116	152	1
21581	116	151	1
21582	116	150	1
21583	116	149	1
21584	116	148	1
21585	116	147	1
21586	116	146	1
21587	116	145	1
21588	116	144	1
21589	116	143	1
21590	116	142	1
21591	116	141	1
21592	116	140	1
21593	116	139	1
21594	116	138	1
21595	116	137	1
21596	116	136	1
21597	116	135	1
21598	116	134	1
21599	116	133	1
21600	116	132	1
21601	116	131	1
21602	116	130	1
21603	116	129	1
21604	116	128	1
21605	116	127	1
21606	116	126	1
21607	116	125	1
21608	116	124	1
21609	116	123	1
21610	116	122	1
21611	116	121	1
21612	116	120	1
21613	116	119	1
21614	116	118	1
21615	116	117	1
21616	116	116	1
21617	116	115	1
21618	116	114	1
21619	116	113	1
21620	116	112	1
21621	116	111	1
21622	116	110	1
21623	116	109	1
21624	116	108	1
21625	116	107	1
21626	116	106	1
21627	116	105	1
21628	116	104	1
21629	116	103	1
21630	116	102	1
21631	116	101	1
21632	116	100	1
21633	116	99	1
21634	116	98	1
21635	116	97	1
21636	116	96	1
21637	116	95	1
21638	116	94	1
21639	116	93	1
21640	116	92	1
21641	116	91	1
21642	116	90	1
21643	116	89	1
21644	116	88	1
21645	116	87	1
21646	116	86	1
21647	116	85	1
21648	116	84	1
21649	116	83	1
21650	116	82	1
21651	116	81	1
21652	116	80	1
21653	116	79	1
21654	116	78	1
21655	116	77	1
21656	116	76	1
21657	116	75	1
21658	116	74	1
21659	116	73	1
21660	116	72	1
21661	116	71	1
21662	116	70	1
21663	116	69	1
21664	116	68	1
21665	116	67	1
21666	116	66	1
21667	116	65	1
21668	116	64	1
21669	116	63	1
21670	116	62	1
21671	116	61	1
21672	116	60	1
21673	116	59	1
21674	116	58	1
21675	116	57	1
21676	116	56	1
21677	116	55	1
21678	116	54	1
21679	116	53	1
21680	116	52	1
21681	116	51	1
21682	116	50	1
21683	116	49	1
21684	116	48	1
21685	116	47	1
21686	116	46	1
21687	116	45	1
21688	116	44	1
21689	116	43	1
21690	116	42	1
21691	116	41	1
21692	116	40	1
21693	116	39	1
21694	116	38	1
21695	116	37	1
21696	116	36	1
21697	116	35	1
21698	116	34	1
21699	116	33	1
21700	116	32	1
21701	116	31	1
21702	116	30	1
21703	116	29	1
21704	116	28	1
21705	116	27	1
21706	116	26	1
21707	116	25	1
21708	116	24	1
21709	116	23	1
21710	116	22	1
21711	116	21	1
21712	116	20	1
21713	116	19	1
21714	116	18	1
21715	116	17	1
21716	116	16	1
21717	116	15	1
21718	116	14	1
21719	116	13	1
21720	116	12	1
21721	116	11	1
21722	116	10	1
21723	116	9	1
21724	116	8	1
21725	116	7	1
21726	116	6	1
21727	116	5	1
21728	116	4	1
21729	116	3	1
21730	116	2	1
21731	116	1	1
21732	117	95	18
21733	117	94	18
21734	117	93	18
21735	117	92	18
21736	117	91	18
21737	117	90	18
21738	117	89	17
21739	117	88	17
21740	117	87	17
21741	117	86	17
21742	117	85	17
21743	117	84	17
21744	117	83	17
21745	117	82	17
21746	117	81	16
21747	117	80	16
21748	117	79	16
21749	117	78	16
21750	117	77	16
21751	117	76	15
21752	117	75	15
21753	117	74	15
21754	117	73	15
21755	117	72	14
21756	117	71	14
21757	117	70	14
21758	117	69	13
21759	117	68	13
21760	117	67	13
21761	117	66	13
21762	117	65	13
21763	117	64	13
21764	117	63	13
21765	117	62	13
21766	117	61	13
21767	117	60	12
21768	117	59	12
21769	117	58	12
21770	117	57	12
21771	117	56	11
21772	117	55	11
21773	117	54	11
21774	117	53	11
21775	117	52	11
21776	117	51	10
21777	117	50	10
21778	117	49	10
21779	117	48	10
21780	117	47	9
21781	117	46	9
21782	117	45	9
21783	117	44	9
21784	117	43	9
21785	117	41	8
21786	117	40	8
21787	117	39	8
21788	117	38	8
21789	117	37	7
21790	117	36	7
21791	117	35	7
21792	117	34	7
21793	117	33	7
21794	117	32	7
21795	117	31	6
21796	117	30	6
21797	117	29	6
21798	117	28	5
21799	117	27	5
21800	117	26	5
21801	117	25	5
21802	117	24	5
21803	117	23	5
21804	117	22	5
21805	117	21	4
21806	117	20	4
21807	117	19	4
21808	117	18	4
21809	117	17	4
21810	117	16	3
21811	117	15	3
21812	117	14	3
21813	117	13	3
21814	117	12	3
21815	117	11	3
21816	117	10	2
21817	117	9	2
21818	117	8	2
21819	117	7	2
21820	117	6	2
21821	117	5	1
21822	117	4	1
21823	117	3	1
21824	117	2	1
21825	117	1	1
21826	118	67	1
21827	118	66	1
21828	118	65	1
21829	118	64	1
21830	118	63	1
21831	118	62	1
21832	118	61	1
21833	118	60	1
21834	118	59	1
21835	118	58	1
21836	118	57	1
21837	118	56	1
21838	118	55	1
21839	118	54	1
21840	118	53	1
21841	118	52	1
21842	118	51	1
21843	118	50	1
21844	118	49	1
21845	118	48	1
21846	118	47	1
21847	118	46	1
21848	118	45	1
21849	118	44	1
21850	118	43	1
21851	118	42	1
21852	118	41	1
21853	118	40	1
21854	118	39	1
21855	118	38	1
21856	118	37	1
21857	118	36	1
21858	118	35	1
21859	118	34	1
21860	118	33	1
21861	118	32	1
21862	118	31	1
21863	118	30	1
21864	118	29	1
21865	118	28	1
21866	118	27	1
21867	118	26	1
21868	118	25	1
21869	118	24	1
21870	118	23	1
21871	118	22	1
21872	118	21	1
21873	118	20	1
21874	118	19	1
21875	118	18	1
21876	118	17	1
21877	118	16	1
21878	118	15	1
21879	118	14	1
21880	118	13	1
21881	118	12	1
21882	118	11	1
21883	118	10	1
21884	118	9	1
21885	118	8	1
21886	118	7	1
21887	118	6	1
21888	118	5	1
21889	118	4	1
21890	118	3	1
21891	118	2	1
21892	118	1	1
21893	118	0	1
21894	119	68	1
21895	119	67	1
21896	119	66	1
21897	119	65	1
21898	119	64	1
21899	119	63	1
21900	119	62	1
21901	119	61	1
21902	119	60	1
21903	119	59	1
21904	119	58	1
21905	119	57	1
21906	119	56	1
21907	119	55	1
21908	119	54	1
21909	119	53	1
21910	119	52	1
21911	119	51	1
21912	119	50	1
21913	119	49	1
21914	119	48	1
21915	119	47	1
21916	119	46	1
21917	119	45	1
21918	119	44	1
21919	119	43	1
21920	119	42	1
21921	119	41	1
21922	119	40	1
21923	119	39	1
21924	119	38	1
21925	119	37	1
21926	119	36	1
21927	119	35	1
21928	119	34	1
21929	119	33	1
21930	119	32	1
21931	119	31	1
21932	119	30	1
21933	119	29	1
21934	119	28	1
21935	119	27	1
21936	119	26	1
21937	119	25	1
21938	119	24	1
21939	119	23	1
21940	119	22	1
21941	119	21	1
21942	119	20	1
21943	119	19	1
21944	119	18	1
21945	119	17	1
21946	119	16	1
21947	119	15	1
21948	119	14	1
21949	119	13	1
21950	119	12	1
21951	119	11	1
21952	119	10	1
21953	119	9	1
21954	119	8	1
21955	119	7	1
21956	119	6	1
21957	119	5	1
21958	119	4	1
21959	119	3	1
21960	119	2	1
21961	119	1	1
21962	119	0	1
21963	120	42	1
21964	120	41	1
21965	120	40	1
21966	120	39	1
21967	120	38	1
21968	120	37	1
21969	120	36	1
21970	120	35	1
21971	120	34	1
21972	120	33	1
21973	120	32	1
21974	120	31	1
21975	120	30	1
21976	120	29	1
21977	120	28	1
21978	120	27	1
21979	120	26	1
21980	120	25	1
21981	120	24	1
21982	120	23	1
21983	120	22	1
21984	120	21	1
21985	120	20	1
21986	120	19	1
21987	120	18	1
21988	120	17	1
21989	120	16	1
21990	120	15	1
21991	120	14	1
21992	120	13	1
21993	120	12	1
21994	120	11	1
21995	120	10	1
21996	120	9	1
21997	120	8	1
21998	120	7	1
21999	120	6	1
22000	120	5	1
22001	120	4	1
22002	120	3	1
22003	120	2	1
22004	120	1	1
22005	121	92	3
22006	121	91	3
22007	121	90	3
22008	121	89	3
22009	121	88	3
22010	121	87	3
22011	121	86	3
22012	121	85	3
22013	121	84	3
22014	121	83	3
22015	121	82	3
22016	121	81	3
22017	121	80	3
22018	121	79	3
22019	121	78	3
22020	121	77	3
22021	121	76	3
22022	121	75	3
22023	121	74	3
22024	121	73	3
22025	121	72	3
22026	121	71	3
22027	121	70	2
22028	121	69	2
22029	121	68	2
22030	121	67	2
22031	121	66	2
22032	121	65	2
22033	121	64	2
22034	121	63	2
22035	121	62	2
22036	121	61	2
22037	121	60	2
22038	121	59	2
22039	121	58	2
22040	121	57	2
22041	121	56	2
22042	121	55	2
22043	121	54	2
22044	121	53	2
22045	121	52	2
22046	121	51	2
22047	121	50	2
22048	121	49	2
22049	121	48	2
22050	121	47	2
22051	121	46	2
22052	121	45	2
22053	121	44	2
22054	121	43	2
22055	121	42	2
22056	121	41	2
22057	121	40	1
22058	121	39	1
22059	121	38	1
22060	121	37	1
22061	121	36	1
22062	121	35	1
22063	121	34	1
22064	121	33	1
22065	121	32	1
22066	121	31	1
22067	121	30	1
22068	121	29	1
22069	121	28	1
22070	121	27	1
22071	121	26	1
22072	121	25	1
22073	121	24	1
22074	121	23	1
22075	121	22	1
22076	121	21	1
22077	121	20	1
22078	121	19	1
22079	121	18	1
22080	121	17	1
22081	121	16	1
22082	121	15	1
22083	121	14	1
22084	121	13	1
22085	121	12	1
22086	121	11	1
22087	121	10	1
22088	121	9	1
22089	121	8	1
22090	121	7	1
22091	121	6	1
22092	121	5	1
22093	121	4	1
22094	121	3	1
22095	121	2	1
22096	121	1	1
22097	122	84	2
22098	122	83	2
22099	122	82	2
22100	122	81	2
22101	122	80	2
22102	122	79	2
22103	122	78	2
22104	122	77	2
22105	122	76	2
22106	122	75	2
22107	122	74	2
22108	122	73	2
22109	122	72	1
22110	122	71	1
22111	122	70	1
22112	122	69	1
22113	122	68	1
22114	122	67	1
22115	122	66	1
22116	122	65	1
22117	122	64	1
22118	122	63	1
22119	122	62	1
22120	122	61	1
22121	122	60	1
22122	122	59	1
22123	122	58	1
22124	122	57	1
22125	122	56	1
22126	122	55	1
22127	122	54	1
22128	122	53	1
22129	122	52	1
22130	122	51	1
22131	122	50	1
22132	122	49	1
22133	122	48	1
22134	122	47	1
22135	122	46	1
22136	122	45	1
22137	122	44	1
22138	122	43	1
22139	122	42	1
22140	122	41	1
22141	122	40	1
22142	122	39	1
22143	122	38	1
22144	122	37	1
22145	122	36	1
22146	122	35	1
22147	122	34	1
22148	122	33	1
22149	122	32	1
22150	122	31	1
22151	122	30	1
22152	122	29	1
22153	122	28	1
22154	122	27	1
22155	122	26	1
22156	122	25	1
22157	122	24	1
22158	122	23	1
22159	122	22	1
22160	122	21	1
22161	122	20	1
22162	122	19	1
22163	122	18	1
22164	122	17	1
22165	122	16	1
22166	122	15	1
22167	122	14	1
22168	122	13	1
22169	122	12	1
22170	122	11	1
22171	122	10	1
22172	122	9	1
22173	122	8	1
22174	122	7	1
22175	122	6	1
22176	122	5	1
22177	122	4	1
22178	122	3	1
22179	122	2	1
22180	122	1	1
22181	123	197	3
22182	123	196	3
22183	123	195	3
22184	123	194	3
22185	123	193	3
22186	123	192	3
22187	123	191	3
22188	123	190	3
22189	123	189	3
22190	123	188	3
22191	123	187	3
22192	123	186	3
22193	123	185	3
22194	123	184	3
22195	123	183	3
22196	123	182	3
22197	123	181	3
22198	123	180	3
22199	123	179	3
22200	123	178	3
22201	123	177	3
22202	123	176	3
22203	123	175	3
22204	123	174	3
22205	123	173	3
22206	123	172	3
22207	123	171	3
22208	123	170	3
22209	123	169	2
22210	123	168	2
22211	123	167	2
22212	123	166	2
22213	123	165	2
22214	123	164	2
22215	123	163	2
22216	123	162	2
22217	123	161	2
22218	123	160	2
22219	123	159	2
22220	123	158	2
22221	123	157	2
22222	123	156	2
22223	123	155	2
22224	123	154	2
22225	123	153	2
22226	123	152	2
22227	123	151	2
22228	123	150	2
22229	123	149	2
22230	123	148	2
22231	123	147	2
22232	123	146	2
22233	123	145	2
22234	123	144	2
22235	123	143	2
22236	123	142	2
22237	123	141	2
22238	123	140	2
22239	123	139	2
22240	123	138	2
22241	123	137	2
22242	123	136	2
22243	123	135	2
22244	123	134	2
22245	123	133	2
22246	123	132	2
22247	123	131	2
22248	123	130	2
22249	123	129	2
22250	123	128	2
22251	123	127	2
22252	123	126	2
22253	123	125	2
22254	123	124	2
22255	123	123	2
22256	123	122	2
22257	123	121	2
22258	123	120	2
22259	123	119	2
22260	123	118	2
22261	123	117	2
22262	123	116	2
22263	123	115	2
22264	123	114	2
22265	123	113	2
22266	123	112	2
22267	123	111	2
22268	123	110	2
22269	123	109	2
22270	123	108	2
22271	123	107	2
22272	123	106	2
22273	123	105	2
22274	123	104	2
22275	123	103	2
22276	123	102	2
22277	123	101	2
22278	123	100	2
22279	123	99	2
22280	123	98	2
22281	123	97	2
22282	123	96	2
22283	123	95	2
22284	123	94	2
22285	123	93	2
22286	123	92	2
22287	123	91	2
22288	123	90	2
22289	123	89	1
22290	123	88	1
22291	123	87	1
22292	123	86	1
22293	123	85	1
22294	123	84	1
22295	123	83	1
22296	123	82	1
22297	123	81	1
22298	123	80	1
22299	123	79	1
22300	123	78	1
22301	123	77	1
22302	123	76	1
22303	123	75	1
22304	123	74	1
22305	123	73	1
22306	123	72	1
22307	123	71	1
22308	123	70	1
22309	123	69	1
22310	123	68	1
22311	123	67	1
22312	123	66	1
22313	123	65	1
22314	123	64	1
22315	123	63	1
22316	123	62	1
22317	123	61	1
22318	123	60	1
22319	123	59	1
22320	123	58	1
22321	123	57	1
22322	123	56	1
22323	123	55	1
22324	123	54	1
22325	123	53	1
22326	123	52	1
22327	123	51	1
22328	123	50	1
22329	123	49	1
22330	123	48	1
22331	123	47	1
22332	123	46	1
22333	123	45	1
22334	123	44	1
22335	123	43	1
22336	123	42	1
22337	123	41	1
22338	123	40	1
22339	123	39	1
22340	123	38	1
22341	123	37	1
22342	123	36	1
22343	123	35	1
22344	123	34	1
22345	123	33	1
22346	123	32	1
22347	123	31	1
22348	123	30	1
22349	123	29	1
22350	123	28	1
22351	123	27	1
22352	123	26	1
22353	123	25	1
22354	123	24	1
22355	123	23	1
22356	123	22	1
22357	123	21	1
22358	123	20	1
22359	123	19	1
22360	123	18	1
22361	123	17	1
22362	123	16	1
22363	123	15	1
22364	123	14	1
22365	123	13	1
22366	123	12	1
22367	123	11	1
22368	123	10	1
22369	123	9	1
22370	123	8	1
22371	123	7	1
22372	123	6	1
22373	123	5	1
22374	123	4	1
22375	123	3	1
22376	123	2	1
22377	123	1	1
22378	124	59	1
22379	124	58	1
22380	124	57	1
22381	124	56	1
22382	124	55	1
22383	124	54	1
22384	124	53	1
22385	124	52	1
22386	124	51	1
22387	124	50	1
22388	124	49	1
22389	124	48	1
22390	124	47	1
22391	124	46	1
22392	124	45	1
22393	124	44	1
22394	124	43	1
22395	124	42	1
22396	124	41	1
22397	124	40	1
22398	124	39	1
22399	124	38	1
22400	124	37	1
22401	124	36	1
22402	124	35	1
22403	124	34	1
22404	124	33	1
22405	124	32	1
22406	124	31	1
22407	124	30	1
22408	124	29	1
22409	124	28	1
22410	124	27	1
22411	124	26	1
22412	124	25	1
22413	124	24	1
22414	124	23	1
22415	124	22	1
22416	124	21	1
22417	124	20	1
22418	124	19	1
22419	124	18	1
22420	124	17	1
22421	124	16	1
22422	124	15	1
22423	124	14	1
22424	124	13	1
22425	124	12	1
22426	124	11	1
22427	124	10	1
22428	124	9	1
22429	124	8	1
22430	124	7	1
22431	124	6	1
22432	124	5	1
22433	124	4	1
22434	124	3	1
22435	124	2	1
22436	124	1	1
22437	125	61	1
22438	125	60	1
22439	125	59	1
22440	125	58	1
22441	125	57	1
22442	125	56	1
22443	125	55	1
22444	125	54	1
22445	125	53	1
22446	125	52	1
22447	125	51	1
22448	125	50	1
22449	125	49	1
22450	125	48	1
22451	125	47	1
22452	125	46	1
22453	125	45	1
22454	125	44	1
22455	125	43	1
22456	125	42	1
22457	125	41	1
22458	125	40	1
22459	125	39	1
22460	125	38	1
22461	125	37	1
22462	125	36	1
22463	125	35	1
22464	125	34	1
22465	125	33	1
22466	125	32	1
22467	125	31	1
22468	125	30	1
22469	125	29	1
22470	125	28	1
22471	125	27	1
22472	125	26	1
22473	125	25	1
22474	125	24	1
22475	125	23	1
22476	125	22	1
22477	125	21	1
22478	125	20	1
22479	125	19	1
22480	125	18	1
22481	125	17	1
22482	125	16	1
22483	125	15	1
22484	125	14	1
22485	125	13	1
22486	125	12	1
22487	125	11	1
22488	125	10	1
22489	125	9	1
22490	125	8	1
22491	125	7	1
22492	125	6	1
22493	125	5	1
22494	125	4	1
22495	125	3	1
22496	125	2	1
22497	125	1	1
22498	126	87	2
22499	126	86	2
22500	126	85	2
22501	126	84	2
22502	126	83	2
22503	126	82	2
22504	126	81	2
22505	126	80	2
22506	126	79	2
22507	126	78	2
22508	126	77	2
22509	126	76	2
22510	126	75	2
22511	126	74	2
22512	126	73	2
22513	126	72	2
22514	126	71	2
22515	126	70	2
22516	126	69	2
22517	126	68	2
22518	126	67	2
22519	126	66	2
22520	126	65	2
22521	126	64	2
22522	126	63	2
22523	126	62	2
22524	126	61	2
22525	126	60	2
22526	126	59	2
22527	126	58	2
22528	126	57	2
22529	126	56	2
22530	126	55	2
22531	126	54	2
22532	126	53	2
22533	126	52	2
22534	126	51	2
22535	126	50	1
22536	126	49	1
22537	126	48	1
22538	126	47	1
22539	126	46	1
22540	126	45	1
22541	126	44	1
22542	126	43	1
22543	126	42	1
22544	126	41	1
22545	126	40	1
22546	126	39	1
22547	126	38	1
22548	126	37	1
22549	126	36	1
22550	126	35	1
22551	126	34	1
22552	126	33	1
22553	126	32	1
22554	126	31	1
22555	126	30	1
22556	126	29	1
22557	126	28	1
22558	126	27	1
22559	126	26	1
22560	126	25	1
22561	126	24	1
22562	126	23	1
22563	126	22	1
22564	126	21	1
22565	126	20	1
22566	126	19	1
22567	126	18	1
22568	126	17	1
22569	126	16	1
22570	126	15	1
22571	126	14	1
22572	126	13	1
22573	126	12	1
22574	126	11	1
22575	126	10	1
22576	126	9	1
22577	126	8	1
22578	126	7	1
22579	126	6	1
22580	126	5	1
22581	126	4	1
22582	126	3	1
22583	126	2	1
22584	126	1	1
22585	127	84	1
22586	127	83	1
22587	127	82	1
22588	127	81	1
22589	127	80	1
22590	127	79	1
22591	127	78	1
22592	127	77	1
22593	127	76	1
22594	127	75	1
22595	127	74	1
22596	127	73	1
22597	127	72	1
22598	127	71	1
22599	127	70	1
22600	127	69	1
22601	127	68	1
22602	127	67	1
22603	127	66	1
22604	127	65	1
22605	127	64	1
22606	127	63	1
22607	127	62	1
22608	127	61	1
22609	127	60	1
22610	127	59	1
22611	127	58	1
22612	127	57	1
22613	127	56	1
22614	127	55	1
22615	127	54	1
22616	127	53	1
22617	127	52	1
22618	127	51	1
22619	127	50	1
22620	127	49	1
22621	127	48	1
22622	127	47	1
22623	127	46	1
22624	127	45	1
22625	127	44	1
22626	127	43	1
22627	127	42	1
22628	127	41	1
22629	127	40	1
22630	127	39	1
22631	127	38	1
22632	127	37	1
22633	127	36	1
22634	127	35	1
22635	127	34	1
22636	127	33	1
22637	127	32	1
22638	127	31	1
22639	127	30	1
22640	127	29	1
22641	127	28	1
22642	127	27	1
22643	127	26	1
22644	127	25	1
22645	127	24	1
22646	127	23	1
22647	127	22	1
22648	127	21	1
22649	127	20	1
22650	127	19	1
22651	127	18	1
22652	127	17	1
22653	127	16	1
22654	127	15	1
22655	127	14	1
22656	127	13	1
22657	127	12	1
22658	127	11	1
22659	127	10	1
22660	127	9	1
22661	127	8	1
22662	127	7	1
22663	127	6	1
22664	127	5	1
22665	127	4	1
22666	127	3	1
22667	127	2	1
22668	127	1	1
22669	128	92	2
22670	128	91	2
22671	128	90	2
22672	128	89	2
22673	128	88	2
22674	128	87	2
22675	128	86	2
22676	128	85	2
22677	128	84	2
22678	128	83	2
22679	128	82	2
22680	128	81	2
22681	128	80	2
22682	128	79	2
22683	128	78	2
22684	128	77	2
22685	128	76	2
22686	128	75	2
22687	128	74	2
22688	128	73	2
22689	128	72	2
22690	128	71	2
22691	128	70	2
22692	128	69	2
22693	128	68	2
22694	128	67	2
22695	128	66	2
22696	128	65	2
22697	128	64	2
22698	128	63	2
22699	128	62	2
22700	128	61	2
22701	128	60	2
22702	128	59	2
22703	128	58	1
22704	128	57	1
22705	128	56	1
22706	128	55	1
22707	128	54	1
22708	128	53	1
22709	128	52	1
22710	128	51	1
22711	128	50	1
22712	128	49	1
22713	128	48	1
22714	128	47	1
22715	128	46	1
22716	128	45	1
22717	128	44	1
22718	128	43	1
22719	128	42	1
22720	128	41	1
22721	128	40	1
22722	128	39	1
22723	128	38	1
22724	128	37	1
22725	128	36	1
22726	128	35	1
22727	128	34	1
22728	128	33	1
22729	128	32	1
22730	128	31	1
22731	128	30	1
22732	128	29	1
22733	128	28	1
22734	128	27	1
22735	128	26	1
22736	128	25	1
22737	128	24	1
22738	128	23	1
22739	128	22	1
22740	128	21	1
22741	128	20	1
22742	128	19	1
22743	128	18	1
22744	128	17	1
22745	128	16	1
22746	128	15	1
22747	128	14	1
22748	128	13	1
22749	128	12	1
22750	128	11	1
22751	128	10	1
22752	128	9	1
22753	128	8	1
22754	128	7	1
22755	128	6	1
22756	128	5	1
22757	128	4	1
22758	128	3	1
22759	128	2	1
22760	128	1	1
22761	128	0	0
22762	129	314	31
22763	129	313	31
22764	129	312	31
22765	129	311	31
22766	129	310	31
22767	129	309	31
22768	129	308	31
22769	129	307	31
22770	129	306	31
22771	129	305	31
22772	129	304	31
22773	129	303	31
22774	129	302	31
22775	129	301	31
22776	129	300	31
22777	129	299	31
22778	129	298	31
22779	129	297	31
22780	129	296	31
22781	129	295	31
22782	129	294	31
22783	129	293	31
22784	129	292	31
22785	129	291	31
22786	129	290	31
22787	129	289	31
22788	129	288	31
22789	129	287	31
22790	129	286	31
22791	129	285	31
22792	129	284	31
22793	129	283	31
22794	129	282	31
22795	129	281	31
22796	129	280	31
22797	129	279	31
22798	129	278	31
22799	129	277	31
22800	129	276	31
22801	129	275	30
22802	129	274	30
22803	129	273	30
22804	129	272	30
22805	129	271	30
22806	129	270	30
22807	129	269	30
22808	129	268	30
22809	129	267	30
22810	129	266	30
22811	129	265	30
22812	129	264	30
22813	129	263	30
22814	129	262	30
22815	129	261	30
22816	129	260	30
22817	129	259	30
22818	129	258	30
22819	129	257	30
22820	129	256	30
22821	129	255	30
22822	129	254	30
22823	129	253	30
22824	129	252	30
22825	129	251	30
22826	129	250	30
22827	129	249	29
22828	129	248	29
22829	129	247	29
22830	129	246	29
22831	129	245	29
22832	129	244	28
22833	129	243	28
22834	129	242	28
22835	129	241	28
22836	129	240	28
22837	129	239	28
22838	129	238	28
22839	129	237	28
22840	129	236	27
22841	129	235	27
22842	129	234	27
22843	129	233	27
22844	129	232	27
22845	129	231	27
22846	129	230	26
22847	129	229	26
22848	129	228	26
22849	129	227	26
22850	129	226	26
22851	129	225	26
22852	129	224	26
22853	129	223	26
22854	129	222	26
22855	129	221	26
22856	129	220	25
22857	129	219	25
22858	129	218	25
22859	129	217	25
22860	129	216	25
22861	129	215	25
22862	129	214	25
22863	129	213	25
22864	129	212	25
22865	129	211	25
22866	129	210	25
22867	129	209	25
22868	129	208	25
22869	129	207	24
22870	129	206	24
22871	129	205	24
22872	129	204	24
22873	129	203	23
22874	129	202	23
22875	129	201	23
22876	129	200	23
22877	129	199	23
22878	129	198	23
22879	129	197	23
22880	129	196	23
22881	129	195	23
22882	129	194	23
22883	129	193	23
22884	129	192	22
22885	129	191	22
22886	129	190	22
22887	129	189	22
22888	129	188	22
22889	129	187	21
22890	129	186	21
22891	129	185	21
22892	129	184	21
22893	129	183	21
22894	129	182	21
22895	129	181	21
22896	129	180	21
22897	129	179	21
22898	129	178	20
22899	129	177	20
22900	129	176	20
22901	129	175	20
22902	129	174	20
22903	129	173	20
22904	129	172	19
22905	129	171	19
22906	129	170	19
22907	129	169	19
22908	129	168	19
22909	129	167	19
22910	129	166	19
22911	129	165	19
22912	129	164	19
22913	129	163	19
22914	129	162	18
22915	129	161	18
22916	129	160	18
22917	129	159	18
22918	129	158	17
22919	129	157	17
22920	129	156	17
22921	129	155	17
22922	129	154	17
22923	129	153	17
22924	129	152	17
22925	129	151	17
22926	129	150	16
22927	129	149	16
22928	129	148	16
22929	129	147	16
22930	129	146	16
22931	129	145	16
22932	129	144	16
22933	129	143	16
22934	129	142	16
22935	129	141	16
22936	129	140	16
22937	129	139	15
22938	129	138	15
22939	129	137	15
22940	129	136	15
22941	129	135	15
22942	129	134	15
22943	129	133	14
22944	129	132	14
22945	129	131	14
22946	129	130	14
22947	129	129	14
22948	129	128	13
22949	129	127	13
22950	129	126	13
22951	129	125	13
22952	129	124	13
22953	129	123	13
22954	129	122	13
22955	129	121	13
22956	129	120	13
22957	129	119	13
22958	129	118	13
22959	129	117	12
22960	129	116	12
22961	129	115	12
22962	129	114	12
22963	129	113	12
22964	129	112	12
22965	129	111	12
22966	129	110	12
22967	129	109	12
22968	129	108	12
22969	129	107	12
22970	129	106	12
22971	129	105	11
22972	129	104	11
22973	129	103	11
22974	129	102	11
22975	129	101	11
22976	129	100	11
22977	129	99	10
22978	129	98	10
22979	129	97	10
22980	129	96	10
22981	129	95	10
22982	129	94	10
22983	129	93	10
22984	129	92	10
22985	129	91	9
22986	129	90	9
22987	129	89	9
22988	129	88	9
22989	129	87	9
22990	129	86	9
22991	129	85	9
22992	129	84	9
22993	129	83	9
22994	129	82	8
22995	129	81	8
22996	129	80	8
22997	129	79	8
22998	129	78	8
22999	129	77	8
23000	129	76	8
23001	129	75	8
23002	129	74	8
23003	129	73	7
23004	129	72	7
23005	129	71	7
23006	129	70	7
23007	129	69	7
23008	129	68	7
23009	129	67	7
23010	129	66	7
23011	129	65	6
23012	129	64	6
23013	129	63	6
23014	129	62	6
23015	129	61	6
23016	129	60	6
23017	129	59	6
23018	129	58	6
23019	129	57	6
23020	129	56	6
23021	129	55	5
23022	129	54	5
23023	129	53	5
23024	129	52	5
23025	129	51	5
23026	129	50	5
23027	129	49	5
23028	129	48	5
23029	129	47	5
23030	129	46	4
23031	129	45	4
23032	129	44	4
23033	129	43	4
23034	129	42	4
23035	129	41	4
23036	129	40	4
23037	129	39	3
23038	129	38	3
23039	129	37	3
23040	129	36	3
23041	129	35	3
23042	129	34	3
23043	129	33	3
23044	129	32	3
23045	129	31	3
23046	129	30	3
23047	129	29	3
23048	129	28	3
23049	129	27	2
23050	129	26	2
23051	129	25	2
23052	129	24	2
23053	129	23	2
23054	129	22	2
23055	129	21	2
23056	129	20	2
23057	129	19	2
23058	129	18	2
23059	129	17	2
23060	129	16	2
23061	129	15	2
23062	129	14	2
23063	129	13	1
23064	129	12	1
23065	129	11	1
23066	129	10	1
23067	129	9	1
23068	129	8	1
23069	129	7	1
23070	129	6	1
23071	129	5	1
23072	129	4	1
23073	129	3	1
23074	129	2	1
23075	129	1	1
23076	130	71	1
23077	130	70	1
23078	130	69	1
23079	130	68	1
23080	130	67	1
23081	130	66	1
23082	130	65	1
23083	130	64	1
23084	130	63	1
23085	130	62	1
23086	130	61	1
23087	130	60	1
23088	130	59	1
23089	130	58	1
23090	130	57	1
23091	130	56	1
23092	130	55	1
23093	130	54	1
23094	130	53	1
23095	130	52	1
23096	130	51	1
23097	130	50	1
23098	130	49	1
23099	130	48	1
23100	130	47	1
23101	130	46	1
23102	130	45	1
23103	130	44	1
23104	130	43	1
23105	130	42	1
23106	130	41	1
23107	130	40	1
23108	130	39	1
23109	130	38	1
23110	130	37	1
23111	130	36	1
23112	130	35	1
23113	130	34	1
23114	130	33	1
23115	130	32	1
23116	130	31	1
23117	130	30	1
23118	130	29	1
23119	130	28	1
23120	130	27	1
23121	130	26	1
23122	130	25	1
23123	130	24	1
23124	130	23	1
23125	130	22	1
23126	130	21	1
23127	130	20	1
23128	130	19	1
23129	130	18	1
23130	130	17	1
23131	130	16	1
23132	130	15	1
23133	130	14	1
23134	130	13	1
23135	130	12	1
23136	130	11	1
23137	130	10	1
23138	130	9	1
23139	130	8	1
23140	130	7	1
23141	130	6	1
23142	130	5	1
23143	130	4	1
23144	130	3	1
23145	130	2	1
23146	130	1	1
23147	131	381	1
23148	131	380	1
23149	131	379	1
23150	131	378	1
23151	131	377	1
23152	131	376	1
23153	131	375	1
23154	131	374	1
23155	131	373	1
23156	131	372	1
23157	131	371	1
23158	131	370	1
23159	131	369	1
23160	131	368	1
23161	131	367	1
23162	131	366	1
23163	131	365	1
23164	131	364	1
23165	131	363	1
23166	131	362	1
23167	131	361	1
23168	131	360	1
23169	131	359	1
23170	131	358	1
23171	131	357	1
23172	131	356	1
23173	131	355	1
23174	131	354	1
23175	131	353	1
23176	131	352	1
23177	131	351	1
23178	131	350	1
23179	131	349	1
23180	131	348	1
23181	131	347	1
23182	131	346	1
23183	131	345	1
23184	131	344	1
23185	131	343	1
23186	131	342	1
23187	131	341	1
23188	131	340	1
23189	131	339	1
23190	131	338	1
23191	131	337	1
23192	131	336	1
23193	131	335	1
23194	131	334	1
23195	131	333	1
23196	131	332	1
23197	131	331	1
23198	131	330	1
23199	131	329	1
23200	131	328	1
23201	131	327	1
23202	131	326	1
23203	131	325	1
23204	131	324	1
23205	131	323	1
23206	131	322	1
23207	131	321	1
23208	131	320	1
23209	131	319	1
23210	131	318	1
23211	131	317	1
23212	131	316	1
23213	131	315	1
23214	131	314	1
23215	131	313	1
23216	131	312	1
23217	131	311	1
23218	131	310	1
23219	131	309	1
23220	131	308	1
23221	131	307	1
23222	131	306	1
23223	131	305	1
23224	131	304	1
23225	131	303	1
23226	131	302	1
23227	131	301	1
23228	131	300	1
23229	131	299	1
23230	131	298	1
23231	131	297	1
23232	131	296	1
23233	131	295	1
23234	131	294	1
23235	131	293	1
23236	131	292	1
23237	131	291	1
23238	131	290	1
23239	131	289	1
23240	131	288	1
23241	131	287	1
23242	131	286	1
23243	131	285	1
23244	131	284	1
23245	131	283	1
23246	131	282	1
23247	131	281	1
23248	131	280	1
23249	131	279	1
23250	131	278	1
23251	131	277	1
23252	131	276	1
23253	131	275	1
23254	131	274	1
23255	131	273	1
23256	131	272	1
23257	131	271	1
23258	131	270	1
23259	131	269	1
23260	131	268	1
23261	131	267	1
23262	131	266	1
23263	131	265	1
23264	131	264	1
23265	131	263	1
23266	131	262	1
23267	131	261	1
23268	131	260	1
23269	131	259	1
23270	131	258	1
23271	131	257	1
23272	131	256	1
23273	131	255	1
23274	131	254	1
23275	131	253	1
23276	131	252	1
23277	131	251	1
23278	131	250	1
23279	131	249	1
23280	131	248	1
23281	131	247	1
23282	131	246	1
23283	131	245	1
23284	131	244	1
23285	131	243	1
23286	131	242	1
23287	131	241	1
23288	131	240	1
23289	131	239	1
23290	131	238	1
23291	131	237	1
23292	131	236	1
23293	131	235	1
23294	131	234	1
23295	131	233	1
23296	131	232	1
23297	131	231	1
23298	131	230	1
23299	131	229	1
23300	131	228	1
23301	131	227	1
23302	131	226	1
23303	131	225	1
23304	131	224	1
23305	131	223	1
23306	131	222	1
23307	131	221	1
23308	131	220	1
23309	131	219	1
23310	131	218	1
23311	131	217	1
23312	131	216	1
23313	131	215	1
23314	131	214	1
23315	131	213	1
23316	131	212	1
23317	131	211	1
23318	131	210	1
23319	131	209	1
23320	131	208	1
23321	131	207	1
23322	131	206	1
23323	131	205	1
23324	131	204	1
23325	131	203	1
23326	131	202	1
23327	131	201	1
23328	131	200	1
23329	131	199	1
23330	131	198	1
23331	131	197	1
23332	131	196	1
23333	131	195	1
23334	131	194	1
23335	131	193	1
23336	131	192	1
23337	131	191	1
23338	131	190	1
23339	131	189	1
23340	131	188	1
23341	131	187	1
23342	131	186	1
23343	131	185	1
23344	131	184	1
23345	131	183	1
23346	131	182	1
23347	131	181	1
23348	131	180	1
23349	131	179	1
23350	131	178	1
23351	131	177	1
23352	131	176	1
23353	131	175	1
23354	131	174	1
23355	131	173	1
23356	131	172	1
23357	131	171	1
23358	131	170	1
23359	131	169	1
23360	131	168	1
23361	131	167	1
23362	131	166	1
23363	131	165	1
23364	131	164	1
23365	131	163	1
23366	131	162	1
23367	131	161	1
23368	131	160	1
23369	131	159	1
23370	131	158	1
23371	131	157	1
23372	131	156	1
23373	131	155	1
23374	131	154	1
23375	131	153	1
23376	131	152	1
23377	131	151	1
23378	131	150	1
23379	131	149	1
23380	131	148	1
23381	131	147	1
23382	131	146	1
23383	131	145	1
23384	131	144	1
23385	131	143	1
23386	131	142	1
23387	131	141	1
23388	131	140	1
23389	131	139	1
23390	131	138	1
23391	131	137	1
23392	131	136	1
23393	131	135	1
23394	131	134	1
23395	131	133	1
23396	131	132	1
23397	131	131	1
23398	131	130	1
23399	131	129	1
23400	131	128	1
23401	131	127	1
23402	131	126	1
23403	131	125	1
23404	131	124	1
23405	131	123	1
23406	131	122	1
23407	131	121	1
23408	131	120	1
23409	131	119	1
23410	131	118	1
23411	131	117	1
23412	131	116	1
23413	131	115	1
23414	131	114	1
23415	131	113	1
23416	131	112	1
23417	131	111	1
23418	131	110	1
23419	131	109	1
23420	131	108	1
23421	131	107	1
23422	131	106	1
23423	131	105	1
23424	131	104	1
23425	131	103	1
23426	131	102	1
23427	131	101	1
23428	131	100	1
23429	131	99	1
23430	131	98	1
23431	131	97	1
23432	131	96	1
23433	131	95	1
23434	131	94	1
23435	131	93	1
23436	131	92	1
23437	131	91	1
23438	131	90	1
23439	131	89	1
23440	131	88	1
23441	131	87	1
23442	131	86	1
23443	131	85	1
23444	131	84	1
23445	131	83	1
23446	131	82	1
23447	131	81	1
23448	131	80	1
23449	131	79	1
23450	131	78	1
23451	131	77	1
23452	131	76	1
23453	131	75	1
23454	131	74	1
23455	131	73	1
23456	131	72	1
23457	131	71	1
23458	131	70	1
23459	131	69	1
23460	131	68	1
23461	131	67	1
23462	131	66	1
23463	131	65	1
23464	131	64	1
23465	131	63	1
23466	131	62	1
23467	131	61	1
23468	131	60	1
23469	131	59	1
23470	131	58	1
23471	131	57	1
23472	131	56	1
23473	131	55	1
23474	131	54	1
23475	131	53	1
23476	131	52	1
23477	131	51	1
23478	131	50	1
23479	131	49	1
23480	131	48	1
23481	131	47	1
23482	131	46	1
23483	131	45	1
23484	131	44	1
23485	131	43	1
23486	131	42	1
23487	131	41	1
23488	131	40	1
23489	131	39	1
23490	131	38	1
23491	131	37	1
23492	131	36	1
23493	131	35	1
23494	131	34	1
23495	131	33	1
23496	131	32	1
23497	131	31	1
23498	131	30	1
23499	131	29	1
23500	131	28	1
23501	131	27	1
23502	131	26	1
23503	131	25	1
23504	131	24	1
23505	131	23	1
23506	131	22	1
23507	131	21	1
23508	131	20	1
23509	131	19	1
23510	131	18	1
23511	131	17	1
23512	131	16	1
23513	131	15	1
23514	131	14	1
23515	131	13	1
23516	131	12	1
23517	131	11	1
23518	131	10	1
23519	131	9	1
23520	131	8	1
23521	131	7	1
23522	131	6	1
23523	131	5	1
23524	131	4	1
23525	131	3	1
23526	131	2	1
23527	131	1	1
23528	132	121	3
23529	132	120	3
23530	132	119	3
23531	132	118	3
23532	132	117	3
23533	132	116	3
23534	132	115	3
23535	132	114	3
23536	132	113	3
23537	132	112	3
23538	132	111	3
23539	132	110	3
23540	132	109	3
23541	132	108	3
23542	132	107	3
23543	132	106	3
23544	132	105	3
23545	132	104	3
23546	132	103	3
23547	132	102	3
23548	132	101	3
23549	132	100	3
23550	132	99	3
23551	132	98	3
23552	132	97	3
23553	132	96	3
23554	132	95	3
23555	132	94	3
23556	132	93	3
23557	132	92	3
23558	132	91	2
23559	132	90	2
23560	132	89	2
23561	132	88	2
23562	132	87	2
23563	132	86	2
23564	132	85	2
23565	132	84	2
23566	132	83	2
23567	132	82	2
23568	132	81	2
23569	132	80	2
23570	132	79	2
23571	132	78	2
23572	132	77	2
23573	132	76	2
23574	132	75	2
23575	132	74	2
23576	132	73	2
23577	132	72	2
23578	132	71	2
23579	132	70	2
23580	132	69	2
23581	132	68	2
23582	132	67	2
23583	132	66	2
23584	132	65	2
23585	132	64	2
23586	132	63	2
23587	132	62	2
23588	132	61	2
23589	132	60	2
23590	132	59	2
23591	132	58	2
23592	132	57	2
23593	132	56	2
23594	132	55	2
23595	132	54	2
23596	132	53	1
23597	132	52	1
23598	132	51	1
23599	132	50	1
23600	132	49	1
23601	132	48	1
23602	132	47	1
23603	132	46	1
23604	132	45	1
23605	132	44	1
23606	132	43	1
23607	132	42	1
23608	132	41	1
23609	132	40	1
23610	132	39	1
23611	132	38	1
23612	132	37	1
23613	132	36	1
23614	132	35	1
23615	132	34	1
23616	132	33	1
23617	132	32	1
23618	132	31	1
23619	132	30	1
23620	132	29	1
23621	132	28	1
23622	132	27	1
23623	132	26	1
23624	132	25	1
23625	132	24	1
23626	132	23	1
23627	132	22	1
23628	132	21	1
23629	132	20	1
23630	132	19	1
23631	132	18	1
23632	132	17	1
23633	132	16	1
23634	132	15	1
23635	132	14	1
23636	132	13	1
23637	132	12	1
23638	132	11	1
23639	132	10	1
23640	132	9	1
23641	132	8	1
23642	132	7	1
23643	132	6	1
23644	132	5	1
23645	132	4	1
23646	132	3	1
23647	132	2	1
23648	132	1	1
23649	133	43	1
23650	133	42	1
23651	133	41	1
23652	133	40	1
23653	133	39	1
23654	133	38	1
23655	133	37	1
23656	133	36	1
23657	133	35	1
23658	133	34	1
23659	133	33	1
23660	133	32	1
23661	133	31	1
23662	133	30	1
23663	133	29	1
23664	133	28	1
23665	133	27	1
23666	133	26	1
23667	133	25	1
23668	133	24	1
23669	133	23	1
23670	133	22	1
23671	133	21	1
23672	133	20	1
23673	133	19	1
23674	133	18	1
23675	133	17	1
23676	133	16	1
23677	133	15	1
23678	133	14	1
23679	133	13	1
23680	133	12	1
23681	133	11	1
23682	133	10	1
23683	133	9	1
23684	133	8	1
23685	133	7	1
23686	133	6	1
23687	133	5	1
23688	133	4	1
23689	133	3	1
23690	133	2	1
23691	133	1	1
23692	134	77	2
23693	134	76	2
23694	134	75	2
23695	134	74	2
23696	134	73	2
23697	134	72	2
23698	134	71	2
23699	134	70	2
23700	134	69	2
23701	134	68	2
23702	134	67	2
23703	134	66	2
23704	134	65	2
23705	134	64	2
23706	134	63	2
23707	134	62	2
23708	134	61	2
23709	134	60	2
23710	134	59	2
23711	134	58	2
23712	134	57	2
23713	134	56	2
23714	134	55	2
23715	134	54	2
23716	134	53	2
23717	134	52	2
23718	134	51	2
23719	134	50	2
23720	134	49	2
23721	134	48	2
23722	134	47	2
23723	134	46	2
23724	134	45	1
23725	134	44	1
23726	134	43	1
23727	134	42	1
23728	134	41	1
23729	134	40	1
23730	134	39	1
23731	134	38	1
23732	134	37	1
23733	134	36	1
23734	134	35	1
23735	134	34	1
23736	134	33	1
23737	134	32	1
23738	134	31	1
23739	134	30	1
23740	134	29	1
23741	134	28	1
23742	134	27	1
23743	134	26	1
23744	134	25	1
23745	134	24	1
23746	134	23	1
23747	134	22	1
23748	134	21	1
23749	134	20	1
23750	134	19	1
23751	134	18	1
23752	134	17	1
23753	134	16	1
23754	134	15	1
23755	134	14	1
23756	134	13	1
23757	134	12	1
23758	134	11	1
23759	134	10	1
23760	134	9	1
23761	134	8	1
23762	134	7	1
23763	134	6	1
23764	134	5	1
23765	134	4	1
23766	134	3	1
23767	134	2	1
23768	134	1	1
23769	135	120	3
23770	135	119	3
23771	135	118	3
23772	135	117	3
23773	135	116	3
23774	135	115	3
23775	135	114	3
23776	135	113	3
23777	135	112	3
23778	135	111	3
23779	135	110	3
23780	135	109	3
23781	135	108	3
23782	135	107	3
23783	135	106	3
23784	135	105	3
23785	135	104	3
23786	135	103	3
23787	135	102	3
23788	135	101	3
23789	135	100	3
23790	135	99	3
23791	135	98	3
23792	135	97	3
23793	135	96	3
23794	135	95	3
23795	135	94	3
23796	135	93	3
23797	135	92	3
23798	135	91	3
23799	135	90	3
23800	135	89	3
23801	135	88	3
23802	135	87	3
23803	135	86	3
23804	135	85	3
23805	135	84	3
23806	135	83	3
23807	135	82	3
23808	135	81	3
23809	135	80	2
23810	135	79	2
23811	135	78	2
23812	135	77	2
23813	135	76	2
23814	135	75	2
23815	135	74	2
23816	135	73	2
23817	135	72	2
23818	135	71	2
23819	135	70	2
23820	135	69	2
23821	135	68	2
23822	135	67	2
23823	135	66	2
23824	135	65	2
23825	135	64	2
23826	135	63	2
23827	135	62	2
23828	135	61	2
23829	135	60	2
23830	135	59	2
23831	135	58	2
23832	135	57	2
23833	135	56	2
23834	135	55	2
23835	135	54	2
23836	135	53	2
23837	135	52	2
23838	135	51	2
23839	135	50	2
23840	135	49	2
23841	135	48	2
23842	135	47	2
23843	135	46	2
23844	135	45	2
23845	135	44	2
23846	135	43	2
23847	135	42	2
23848	135	41	2
23849	135	40	1
23850	135	39	1
23851	135	38	1
23852	135	37	1
23853	135	36	1
23854	135	35	1
23855	135	34	1
23856	135	33	1
23857	135	32	1
23858	135	31	1
23859	135	30	1
23860	135	29	1
23861	135	28	1
23862	135	27	1
23863	135	26	1
23864	135	25	1
23865	135	24	1
23866	135	23	1
23867	135	22	1
23868	135	21	1
23869	135	20	1
23870	135	19	1
23871	135	18	1
23872	135	17	1
23873	135	16	1
23874	135	15	1
23875	135	14	1
23876	135	13	1
23877	135	12	1
23878	135	11	1
23879	135	10	1
23880	135	9	1
23881	135	8	1
23882	135	7	1
23883	135	6	1
23884	135	5	1
23885	135	4	1
23886	135	3	1
23887	135	2	1
23888	135	1	1
23889	136	114	1
23890	136	113	1
23891	136	112	1
23892	136	111	1
23893	136	110	1
23894	136	109	1
23895	136	108	1
23896	136	107	1
23897	136	106	1
23898	136	105	1
23899	136	104	1
23900	136	103	1
23901	136	102	1
23902	136	101	1
23903	136	100	1
23904	136	99	1
23905	136	98	1
23906	136	97	1
23907	136	96	1
23908	136	95	1
23909	136	94	1
23910	136	93	1
23911	136	92	1
23912	136	91	1
23913	136	90	1
23914	136	89	1
23915	136	88	1
23916	136	87	1
23917	136	86	1
23918	136	85	1
23919	136	84	1
23920	136	83	1
23921	136	82	1
23922	136	81	1
23923	136	80	1
23924	136	79	1
23925	136	78	1
23926	136	77	1
23927	136	76	1
23928	136	75	1
23929	136	74	1
23930	136	73	1
23931	136	72	1
23932	136	71	1
23933	136	70	1
23934	136	69	1
23935	136	68	1
23936	136	67	1
23937	136	66	1
23938	136	65	1
23939	136	64	1
23940	136	63	1
23941	136	62	1
23942	136	61	1
23943	136	60	1
23944	136	59	1
23945	136	58	1
23946	136	57	1
23947	136	56	1
23948	136	55	1
23949	136	54	1
23950	136	53	1
23951	136	52	1
23952	136	51	1
23953	136	50	1
23954	136	49	1
23955	136	48	1
23956	136	47	1
23957	136	46	1
23958	136	45	1
23959	136	44	1
23960	136	43	1
23961	136	42	1
23962	136	41	1
23963	136	40	1
23964	136	39	1
23965	136	38	1
23966	136	37	1
23967	136	36	1
23968	136	35	1
23969	136	34	1
23970	136	33	1
23971	136	32	1
23972	136	31	1
23973	136	30	1
23974	136	29	1
23975	136	28	1
23976	136	27	1
23977	136	26	1
23978	136	25	1
23979	136	24	1
23980	136	23	1
23981	136	22	1
23982	136	21	1
23983	136	20	1
23984	136	19	1
23985	136	18	1
23986	136	17	1
23987	136	16	1
23988	136	15	1
23989	136	14	1
23990	136	13	1
23991	136	12	1
23992	136	11	1
23993	136	10	1
23994	136	9	1
23995	136	8	1
23996	136	7	1
23997	136	6	1
23998	136	5	1
23999	136	4	1
24000	136	3	1
24001	136	2	1
24002	136	1	1
24003	137	126	1
24004	137	125	1
24005	137	124	1
24006	137	123	1
24007	137	122	1
24008	137	121	1
24009	137	120	1
24010	137	119	1
24011	137	118	1
24012	137	117	1
24013	137	116	1
24014	137	115	1
24015	137	114	1
24016	137	113	1
24017	137	112	1
24018	137	111	1
24019	137	110	1
24020	137	109	1
24021	137	108	1
24022	137	107	1
24023	137	106	1
24024	137	105	1
24025	137	104	1
24026	137	103	1
24027	137	102	1
24028	137	101	1
24029	137	100	1
24030	137	99	1
24031	137	98	1
24032	137	97	1
24033	137	96	1
24034	137	95	1
24035	137	94	1
24036	137	93	1
24037	137	92	1
24038	137	91	1
24039	137	90	1
24040	137	89	1
24041	137	88	1
24042	137	87	1
24043	137	86	1
24044	137	85	1
24045	137	84	1
24046	137	83	1
24047	137	82	1
24048	137	81	1
24049	137	80	1
24050	137	79	1
24051	137	78	1
24052	137	77	1
24053	137	76	1
24054	137	75	1
24055	137	74	1
24056	137	73	1
24057	137	72	1
24058	137	71	1
24059	137	70	1
24060	137	69	1
24061	137	68	1
24062	137	67	1
24063	137	66	1
24064	137	65	1
24065	137	64	1
24066	137	63	1
24067	137	62	1
24068	137	61	1
24069	137	60	1
24070	137	59	1
24071	137	58	1
24072	137	57	1
24073	137	56	1
24074	137	55	1
24075	137	54	1
24076	137	53	1
24077	137	52	1
24078	137	51	1
24079	137	50	1
24080	137	49	1
24081	137	48	1
24082	137	47	1
24083	137	46	1
24084	137	45	1
24085	137	44	1
24086	137	43	1
24087	137	42	1
24088	137	41	1
24089	137	40	1
24090	137	39	1
24091	137	38	1
24092	137	37	1
24093	137	36	1
24094	137	35	1
24095	137	34	1
24096	137	33	1
24097	137	32	1
24098	137	31	1
24099	137	30	1
24100	137	29	1
24101	137	28	1
24102	137	27	1
24103	137	26	1
24104	137	25	1
24105	137	24	1
24106	137	23	1
24107	137	22	1
24108	137	21	1
24109	137	20	1
24110	137	19	1
24111	137	18	1
24112	137	17	1
24113	137	16	1
24114	137	15	1
24115	137	14	1
24116	137	13	1
24117	137	12	1
24118	137	11	1
24119	137	10	1
24120	137	9	1
24121	137	8	1
24122	137	7	1
24123	137	6	1
24124	137	5	1
24125	137	4	1
24126	137	3	1
24127	137	2	1
24128	137	1	1
24129	138	79	2
24130	138	78	2
24131	138	77	2
24132	138	76	2
24133	138	75	2
24134	138	74	2
24135	138	73	2
24136	138	72	2
24137	138	71	2
24138	138	70	2
24139	138	69	2
24140	138	68	2
24141	138	67	2
24142	138	66	2
24143	138	65	2
24144	138	64	2
24145	138	63	2
24146	138	62	2
24147	138	61	2
24148	138	60	2
24149	138	59	2
24150	138	58	2
24151	138	57	2
24152	138	56	2
24153	138	55	2
24154	138	54	1
24155	138	53	1
24156	138	52	1
24157	138	51	1
24158	138	50	1
24159	138	49	1
24160	138	48	1
24161	138	47	1
24162	138	46	1
24163	138	45	1
24164	138	44	1
24165	138	43	1
24166	138	42	1
24167	138	41	1
24168	138	40	1
24169	138	39	1
24170	138	38	1
24171	138	37	1
24172	138	36	1
24173	138	35	1
24174	138	34	1
24175	138	33	1
24176	138	32	1
24177	138	31	1
24178	138	30	1
24179	138	29	1
24180	138	28	1
24181	138	27	1
24182	138	26	1
24183	138	25	1
24184	138	24	1
24185	138	23	1
24186	138	22	1
24187	138	21	1
24188	138	20	1
24189	138	19	1
24190	138	18	1
24191	138	17	1
24192	138	16	1
24193	138	15	1
24194	138	14	1
24195	138	13	1
24196	138	12	1
24197	138	11	1
24198	138	10	1
24199	138	9	1
24200	138	8	1
24201	138	7	1
24202	138	6	1
24203	138	5	1
24204	138	4	1
24205	138	3	1
24206	138	2	1
24207	138	1	1
24208	139	66	1
24209	139	65	1
24210	139	64	1
24211	139	63	1
24212	139	62	1
24213	139	61	1
24214	139	60	1
24215	139	59	1
24216	139	58	1
24217	139	57	1
24218	139	56	1
24219	139	55	1
24220	139	54	1
24221	139	53	1
24222	139	52	1
24223	139	51	1
24224	139	50	1
24225	139	49	1
24226	139	48	1
24227	139	47	1
24228	139	46	1
24229	139	45	1
24230	139	44	1
24231	139	43	1
24232	139	42	1
24233	139	41	1
24234	139	40	1
24235	139	39	1
24236	139	38	1
24237	139	37	1
24238	139	36	1
24239	139	35	1
24240	139	34	1
24241	139	33	1
24242	139	32	1
24243	139	31	1
24244	139	30	1
24245	139	29	1
24246	139	28	1
24247	139	27	1
24248	139	26	1
24249	139	25	1
24250	139	24	1
24251	139	23	1
24252	139	22	1
24253	139	21	1
24254	139	20	1
24255	139	19	1
24256	139	18	1
24257	139	17	1
24258	139	16	1
24259	139	15	1
24260	139	14	1
24261	139	13	1
24262	139	12	1
24263	139	11	1
24264	139	10	1
24265	139	9	1
24266	139	8	1
24267	139	7	1
24268	139	6	1
24269	139	5	1
24270	139	4	1
24271	139	3	1
24272	139	2	1
24273	139	1	1
24274	140	60	1
24275	140	59	1
24276	140	58	1
24277	140	57	1
24278	140	56	1
24279	140	55	1
24280	140	54	1
24281	140	53	1
24282	140	52	1
24283	140	51	1
24284	140	50	1
24285	140	49	1
24286	140	48	1
24287	140	47	1
24288	140	46	1
24289	140	45	1
24290	140	44	1
24291	140	43	1
24292	140	42	1
24293	140	41	1
24294	140	40	1
24295	140	39	1
24296	140	38	1
24297	140	37	1
24298	140	36	1
24299	140	35	1
24300	140	34	1
24301	140	33	1
24302	140	32	1
24303	140	31	1
24304	140	30	1
24305	140	29	1
24306	140	28	1
24307	140	27	1
24308	140	26	1
24309	140	25	1
24310	140	24	1
24311	140	23	1
24312	140	22	1
24313	140	21	1
24314	140	20	1
24315	140	19	1
24316	140	18	1
24317	140	17	1
24318	140	16	1
24319	140	15	1
24320	140	14	1
24321	140	13	1
24322	140	12	1
24323	140	11	1
24324	140	10	1
24325	140	9	1
24326	140	8	1
24327	140	7	1
24328	140	6	1
24329	140	5	1
24330	140	4	1
24331	140	3	1
24332	140	2	1
24333	140	1	1
24334	141	108	2
24335	141	107	2
24336	141	106	2
24337	141	105	2
24338	141	104	2
24339	141	103	2
24340	141	102	2
24341	141	101	2
24342	141	100	2
24343	141	99	2
24344	141	98	2
24345	141	97	2
24346	141	96	2
24347	141	95	2
24348	141	94	2
24349	141	93	2
24350	141	92	2
24351	141	91	2
24352	141	90	2
24353	141	89	2
24354	141	88	2
24355	141	87	2
24356	141	86	2
24357	141	85	2
24358	141	84	2
24359	141	83	2
24360	141	82	2
24361	141	81	2
24362	141	80	2
24363	141	79	2
24364	141	78	2
24365	141	77	2
24366	141	76	2
24367	141	75	2
24368	141	74	2
24369	141	73	2
24370	141	72	2
24371	141	71	2
24372	141	70	2
24373	141	69	2
24374	141	68	2
24375	141	67	2
24376	141	66	2
24377	141	65	2
24378	141	64	2
24379	141	63	2
24380	141	62	2
24381	141	61	2
24382	141	60	2
24383	141	59	2
24384	141	58	2
24385	141	57	2
24386	141	56	2
24387	141	55	2
24388	141	54	2
24389	141	53	2
24390	141	52	2
24391	141	51	2
24392	141	50	2
24393	141	49	2
24394	141	48	2
24395	141	47	2
24396	141	46	2
24397	141	45	2
24398	141	44	2
24399	141	43	1
24400	141	42	1
24401	141	41	1
24402	141	40	1
24403	141	39	1
24404	141	38	1
24405	141	37	1
24406	141	36	1
24407	141	35	1
24408	141	34	1
24409	141	33	1
24410	141	32	1
24411	141	31	1
24412	141	30	1
24413	141	29	1
24414	141	28	1
24415	141	27	1
24416	141	26	1
24417	141	25	1
24418	141	24	1
24419	141	23	1
24420	141	22	1
24421	141	21	1
24422	141	20	1
24423	141	19	1
24424	141	18	1
24425	141	17	1
24426	141	16	1
24427	141	15	1
24428	141	14	1
24429	141	13	1
24430	141	12	1
24431	141	11	1
24432	141	10	1
24433	141	9	1
24434	141	8	1
24435	141	7	1
24436	141	6	1
24437	141	5	1
24438	141	4	1
24439	141	3	1
24440	141	2	1
24441	141	1	1
24442	142	126	1
24443	142	125	1
24444	142	124	1
24445	142	123	1
24446	142	122	1
24447	142	121	1
24448	142	120	1
24449	142	119	1
24450	142	118	1
24451	142	117	1
24452	142	116	1
24453	142	115	1
24454	142	114	1
24455	142	113	1
24456	142	112	1
24457	142	111	1
24458	142	110	1
24459	142	109	1
24460	142	108	1
24461	142	107	1
24462	142	106	1
24463	142	105	1
24464	142	104	1
24465	142	103	1
24466	142	102	1
24467	142	101	1
24468	142	100	1
24469	142	99	1
24470	142	98	1
24471	142	97	1
24472	142	96	1
24473	142	95	1
24474	142	94	1
24475	142	93	1
24476	142	92	1
24477	142	91	1
24478	142	90	1
24479	142	89	1
24480	142	88	1
24481	142	87	1
24482	142	86	1
24483	142	85	1
24484	142	84	1
24485	142	83	1
24486	142	82	1
24487	142	81	1
24488	142	80	1
24489	142	79	1
24490	142	78	1
24491	142	77	1
24492	142	76	1
24493	142	75	1
24494	142	74	1
24495	142	73	1
24496	142	72	1
24497	142	71	1
24498	142	70	1
24499	142	69	1
24500	142	68	1
24501	142	67	1
24502	142	66	1
24503	142	65	1
24504	142	64	1
24505	142	63	1
24506	142	62	1
24507	142	61	1
24508	142	60	1
24509	142	59	1
24510	142	58	1
24511	142	57	1
24512	142	56	1
24513	142	55	1
24514	142	54	1
24515	142	53	1
24516	142	52	1
24517	142	51	1
24518	142	50	1
24519	142	49	1
24520	142	48	1
24521	142	47	1
24522	142	46	1
24523	142	45	1
24524	142	44	1
24525	142	43	1
24526	142	42	1
24527	142	41	1
24528	142	40	1
24529	142	39	1
24530	142	38	1
24531	142	37	1
24532	142	36	1
24533	142	35	1
24534	142	34	1
24535	142	33	1
24536	142	32	1
24537	142	31	1
24538	142	30	1
24539	142	29	1
24540	142	28	1
24541	142	27	1
24542	142	26	1
24543	142	25	1
24544	142	24	1
24545	142	23	1
24546	142	22	1
24547	142	21	1
24548	142	20	1
24549	142	19	1
24550	142	18	1
24551	142	17	1
24552	142	16	1
24553	142	15	1
24554	142	14	1
24555	142	13	1
24556	142	12	1
24557	142	11	1
24558	142	10	1
24559	142	9	1
24560	142	8	1
24561	142	7	1
24562	142	6	1
24563	142	5	1
24564	142	4	1
24565	142	3	1
24566	142	2	1
24567	142	1	1
24568	143	80	2
24569	143	79	2
24570	143	78	2
24571	143	77	2
24572	143	76	2
24573	143	75	2
24574	143	74	2
24575	143	73	2
24576	143	72	2
24577	143	71	2
24578	143	70	2
24579	143	69	2
24580	143	68	2
24581	143	67	2
24582	143	66	2
24583	143	65	2
24584	143	64	2
24585	143	63	2
24586	143	62	2
24587	143	61	2
24588	143	60	2
24589	143	59	2
24590	143	58	2
24591	143	57	2
24592	143	56	2
24593	143	55	2
24594	143	54	2
24595	143	53	2
24596	143	52	2
24597	143	51	2
24598	143	50	1
24599	143	49	1
24600	143	48	1
24601	143	47	1
24602	143	46	1
24603	143	45	1
24604	143	44	1
24605	143	43	1
24606	143	42	1
24607	143	41	1
24608	143	40	1
24609	143	39	1
24610	143	38	1
24611	143	37	1
24612	143	36	1
24613	143	35	1
24614	143	34	1
24615	143	33	1
24616	143	32	1
24617	143	31	1
24618	143	30	1
24619	143	29	1
24620	143	28	1
24621	143	27	1
24622	143	26	1
24623	143	25	1
24624	143	24	1
24625	143	23	1
24626	143	22	1
24627	143	21	1
24628	143	20	1
24629	143	19	1
24630	143	18	1
24631	143	17	1
24632	143	16	1
24633	143	15	1
24634	143	14	1
24635	143	13	1
24636	143	12	1
24637	143	11	1
24638	143	10	1
24639	143	9	1
24640	143	8	1
24641	143	7	1
24642	143	6	1
24643	143	5	1
24644	143	4	1
24645	143	3	1
24646	143	2	1
24647	143	1	1
24648	144	45	2
24649	144	44	2
24650	144	43	1
24651	144	42	1
24652	144	41	1
24653	144	40	1
24654	144	39	1
24655	144	38	1
24656	144	37	1
24657	144	36	1
24658	144	35	1
24659	144	34	1
24660	144	33	1
24661	144	32	1
24662	144	31	1
24663	144	30	1
24664	144	29	1
24665	144	28	1
24666	144	27	1
24667	144	26	1
24668	144	25	1
24669	144	24	1
24670	144	23	1
24671	144	22	1
24672	144	21	1
24673	144	20	1
24674	144	19	1
24675	144	18	1
24676	144	17	1
24677	144	16	1
24678	144	15	1
24679	144	14	1
24680	144	13	1
24681	144	12	1
24682	144	11	1
24683	144	10	1
24684	144	9	1
24685	144	8	1
24686	144	7	1
24687	144	6	1
24688	144	5	1
24689	144	4	1
24690	144	3	1
24691	144	2	1
24692	144	1	1
24693	144	0	1
24694	145	80	2
24695	145	79	2
24696	145	78	2
24697	145	77	2
24698	145	76	2
24699	145	75	2
24700	145	74	2
24701	145	73	2
24702	145	72	2
24703	145	71	2
24704	145	70	2
24705	145	69	2
24706	145	68	2
24707	145	67	2
24708	145	66	2
24709	145	65	2
24710	145	64	2
24711	145	63	2
24712	145	62	2
24713	145	61	2
24714	145	60	2
24715	145	59	2
24716	145	58	2
24717	145	57	2
24718	145	56	2
24719	145	55	2
24720	145	54	2
24721	145	53	2
24722	145	52	2
24723	145	51	2
24724	145	50	2
24725	145	49	2
24726	145	48	2
24727	145	47	2
24728	145	46	1
24729	145	45	1
24730	145	44	1
24731	145	43	1
24732	145	42	1
24733	145	41	1
24734	145	40	1
24735	145	39	1
24736	145	38	1
24737	145	37	1
24738	145	36	1
24739	145	35	1
24740	145	34	1
24741	145	33	1
24742	145	32	1
24743	145	31	1
24744	145	30	1
24745	145	29	1
24746	145	28	1
24747	145	27	1
24748	145	26	1
24749	145	25	1
24750	145	24	1
24751	145	23	1
24752	145	22	1
24753	145	21	1
24754	145	20	1
24755	145	19	1
24756	145	18	1
24757	145	17	1
24758	145	16	1
24759	145	15	1
24760	145	14	1
24761	145	13	1
24762	145	12	1
24763	145	11	1
24764	145	10	1
24765	145	9	1
24766	145	8	1
24767	145	7	1
24768	145	6	1
24769	145	5	1
24770	145	4	1
24771	145	3	1
24772	145	2	1
24773	145	1	1
24774	146	3	1
24775	146	2	1
24776	146	1	1
24777	147	133	1
24778	147	132	1
24779	147	131	1
24780	147	130	1
24781	147	129	1
24782	147	128	1
24783	147	127	1
24784	147	126	1
24785	147	125	1
24786	147	124	1
24787	147	123	1
24788	147	122	1
24789	147	121	1
24790	147	120	1
24791	147	119	1
24792	147	118	1
24793	147	117	1
24794	147	116	1
24795	147	115	1
24796	147	114	1
24797	147	113	1
24798	147	112	1
24799	147	111	1
24800	147	110	1
24801	147	109	1
24802	147	108	1
24803	147	107	1
24804	147	106	1
24805	147	105	1
24806	147	104	1
24807	147	103	1
24808	147	102	1
24809	147	101	1
24810	147	100	1
24811	147	99	1
24812	147	98	1
24813	147	97	1
24814	147	96	1
24815	147	95	1
24816	147	94	1
24817	147	93	1
24818	147	92	1
24819	147	91	1
24820	147	90	1
24821	147	89	1
24822	147	88	1
24823	147	87	1
24824	147	86	1
24825	147	85	1
24826	147	84	1
24827	147	83	1
24828	147	82	1
24829	147	81	1
24830	147	80	1
24831	147	79	1
24832	147	78	1
24833	147	77	1
24834	147	76	1
24835	147	75	1
24836	147	74	1
24837	147	73	1
24838	147	72	1
24839	147	71	1
24840	147	70	1
24841	147	69	1
24842	147	68	1
24843	147	67	1
24844	147	66	1
24845	147	65	1
24846	147	64	1
24847	147	63	1
24848	147	62	1
24849	147	61	1
24850	147	60	1
24851	147	59	1
24852	147	58	1
24853	147	57	1
24854	147	56	1
24855	147	55	1
24856	147	54	1
24857	147	53	1
24858	147	52	1
24859	147	51	1
24860	147	50	1
24861	147	49	1
24862	147	48	1
24863	147	47	1
24864	147	46	1
24865	147	45	1
24866	147	44	1
24867	147	43	1
24868	147	42	1
24869	147	41	1
24870	147	40	1
24871	147	39	1
24872	147	38	1
24873	147	37	1
24874	147	36	1
24875	147	35	1
24876	147	34	1
24877	147	33	1
24878	147	32	1
24879	147	31	1
24880	147	30	1
24881	147	29	1
24882	147	28	1
24883	147	27	1
24884	147	26	1
24885	147	25	1
24886	147	24	1
24887	147	23	1
24888	147	22	1
24889	147	21	1
24890	147	20	1
24891	147	19	1
24892	147	18	1
24893	147	17	1
24894	147	16	1
24895	147	15	1
24896	147	14	1
24897	147	13	1
24898	147	12	1
24899	147	11	1
24900	147	10	1
24901	147	9	1
24902	147	8	1
24903	147	7	1
24904	147	6	1
24905	147	5	1
24906	147	4	1
24907	147	3	1
24908	147	2	1
24909	147	1	1
24910	147	0	1
24911	148	86	1
24912	148	85	1
24913	148	84	1
24914	148	83	1
24915	148	82	1
24916	148	81	1
24917	148	80	1
24918	148	79	1
24919	148	78	1
24920	148	77	1
24921	148	76	1
24922	148	75	1
24923	148	74	1
24924	148	73	1
24925	148	72	1
24926	148	71	1
24927	148	70	1
24928	148	69	1
24929	148	68	1
24930	148	67	1
24931	148	66	1
24932	148	65	1
24933	148	64	1
24934	148	63	1
24935	148	62	1
24936	148	61	1
24937	148	60	1
24938	148	59	1
24939	148	58	1
24940	148	57	1
24941	148	56	1
24942	148	55	1
24943	148	54	1
24944	148	53	1
24945	148	52	1
24946	148	51	1
24947	148	50	1
24948	148	49	1
24949	148	48	1
24950	148	47	1
24951	148	46	1
24952	148	45	1
24953	148	44	1
24954	148	43	1
24955	148	42	1
24956	148	41	1
24957	148	40	1
24958	148	39	1
24959	148	38	1
24960	148	37	1
24961	148	36	1
24962	148	35	1
24963	148	34	1
24964	148	33	1
24965	148	32	1
24966	148	31	1
24967	148	30	1
24968	148	29	1
24969	148	28	1
24970	148	27	1
24971	148	26	1
24972	148	25	1
24973	148	24	1
24974	148	23	1
24975	148	22	1
24976	148	21	1
24977	148	20	1
24978	148	19	1
24979	148	18	1
24980	148	17	1
24981	148	16	1
24982	148	15	1
24983	148	14	1
24984	148	13	1
24985	148	12	1
24986	148	11	1
24987	148	10	1
24988	148	9	1
24989	148	8	1
24990	148	7	1
24991	148	6	1
24992	148	5	1
24993	148	4	1
24994	148	3	1
24995	148	2	1
24996	148	1	1
24997	149	115	1
24998	149	114	1
24999	149	113	1
25000	149	112	1
25001	149	111	1
25002	149	110	1
25003	149	109	1
25004	149	108	1
25005	149	107	1
25006	149	106	1
25007	149	105	1
25008	149	104	1
25009	149	103	1
25010	149	102	1
25011	149	101	1
25012	149	100	1
25013	149	99	1
25014	149	98	1
25015	149	97	1
25016	149	96	1
25017	149	95	1
25018	149	94	1
25019	149	93	1
25020	149	92	1
25021	149	91	1
25022	149	90	1
25023	149	89	1
25024	149	88	1
25025	149	87	1
25026	149	86	1
25027	149	85	1
25028	149	84	1
25029	149	83	1
25030	149	82	1
25031	149	81	1
25032	149	80	1
25033	149	79	1
25034	149	78	1
25035	149	77	1
25036	149	76	1
25037	149	75	1
25038	149	74	1
25039	149	73	1
25040	149	72	1
25041	149	71	1
25042	149	70	1
25043	149	69	1
25044	149	68	1
25045	149	67	1
25046	149	66	1
25047	149	65	1
25048	149	64	1
25049	149	63	1
25050	149	62	1
25051	149	61	1
25052	149	60	1
25053	149	59	1
25054	149	58	1
25055	149	57	1
25056	149	56	1
25057	149	55	1
25058	149	54	1
25059	149	53	1
25060	149	52	1
25061	149	51	1
25062	149	50	1
25063	149	49	1
25064	149	48	1
25065	149	47	1
25066	149	46	1
25067	149	45	1
25068	149	44	1
25069	149	43	1
25070	149	42	1
25071	149	41	1
25072	149	40	1
25073	149	39	1
25074	149	38	1
25075	149	37	1
25076	149	36	1
25077	149	35	1
25078	149	34	1
25079	149	33	1
25080	149	32	1
25081	149	31	1
25082	149	30	1
25083	149	29	1
25084	149	28	1
25085	149	27	1
25086	149	26	1
25087	149	25	1
25088	149	24	1
25089	149	23	1
25090	149	22	1
25091	149	21	1
25092	149	20	1
25093	149	19	1
25094	149	18	1
25095	149	17	1
25096	149	16	1
25097	149	15	1
25098	149	14	1
25099	149	13	1
25100	149	12	1
25101	149	11	1
25102	149	10	1
25103	149	9	1
25104	149	8	1
25105	149	7	1
25106	149	6	1
25107	149	5	1
25108	149	4	1
25109	149	3	1
25110	149	2	1
25111	149	1	1
25112	150	75	1
25113	150	74	1
25114	150	73	1
25115	150	72	1
25116	150	71	1
25117	150	70	1
25118	150	69	1
25119	150	68	1
25120	150	67	1
25121	150	66	1
25122	150	65	1
25123	150	64	1
25124	150	63	1
25125	150	62	1
25126	150	61	1
25127	150	60	1
25128	150	59	1
25129	150	58	1
25130	150	57	1
25131	150	56	1
25132	150	55	1
25133	150	54	1
25134	150	53	1
25135	150	52	1
25136	150	51	1
25137	150	50	1
25138	150	49	1
25139	150	48	1
25140	150	47	1
25141	150	46	1
25142	150	45	1
25143	150	44	1
25144	150	43	1
25145	150	42	1
25146	150	41	1
25147	150	40	1
25148	150	39	1
25149	150	38	1
25150	150	37	1
25151	150	36	1
25152	150	35	1
25153	150	34	1
25154	150	33	1
25155	150	32	1
25156	150	31	1
25157	150	30	1
25158	150	29	1
25159	150	28	1
25160	150	27	1
25161	150	26	1
25162	150	25	1
25163	150	24	1
25164	150	23	1
25165	150	22	1
25166	150	21	1
25167	150	20	1
25168	150	19	1
25169	150	18	1
25170	150	17	1
25171	150	16	1
25172	150	15	1
25173	150	14	1
25174	150	13	1
25175	150	12	1
25176	150	11	1
25177	150	10	1
25178	150	9	1
25179	150	8	1
25180	150	7	1
25181	150	6	1
25182	150	5	1
25183	150	4	1
25184	150	3	1
25185	150	2	1
25186	150	1	1
25187	151	18	4
25188	151	17	4
25189	151	16	4
25190	151	15	4
25191	151	14	3
25192	151	13	3
25193	151	12	3
25194	151	11	3
25195	151	10	2
25196	151	9	2
25197	151	8	2
25198	151	7	2
25199	151	6	2
25200	151	5	1
25201	151	4	1
25202	151	3	1
25203	151	2	1
25204	151	1	1
25205	152	342	1
25206	152	341	1
25207	152	340	1
25208	152	339	1
25209	152	338	1
25210	152	337	1
25211	152	336	1
25212	152	335	1
25213	152	334	1
25214	152	333	1
25215	152	332	1
25216	152	331	1
25217	152	330	1
25218	152	329	1
25219	152	328	1
25220	152	327	1
25221	152	326	1
25222	152	325	1
25223	152	324	1
25224	152	323	1
25225	152	322	1
25226	152	321	1
25227	152	320	1
25228	152	319	1
25229	152	318	1
25230	152	317	1
25231	152	316	1
25232	152	315	1
25233	152	314	1
25234	152	313	1
25235	152	312	1
25236	152	311	1
25237	152	310	1
25238	152	309	1
25239	152	308	1
25240	152	307	1
25241	152	306	1
25242	152	305	1
25243	152	304	1
25244	152	303	1
25245	152	302	1
25246	152	301	1
25247	152	300	1
25248	152	299	1
25249	152	298	1
25250	152	297	1
25251	152	296	1
25252	152	295	1
25253	152	294	1
25254	152	293	1
25255	152	292	1
25256	152	291	1
25257	152	290	1
25258	152	289	1
25259	152	288	1
25260	152	287	1
25261	152	286	1
25262	152	285	1
25263	152	284	1
25264	152	283	1
25265	152	282	1
25266	152	281	1
25267	152	280	1
25268	152	279	1
25269	152	278	1
25270	152	277	1
25271	152	276	1
25272	152	275	1
25273	152	274	1
25274	152	273	1
25275	152	272	1
25276	152	271	1
25277	152	270	1
25278	152	269	1
25279	152	268	1
25280	152	267	1
25281	152	266	1
25282	152	265	1
25283	152	264	1
25284	152	263	1
25285	152	262	1
25286	152	261	1
25287	152	260	1
25288	152	259	1
25289	152	258	1
25290	152	257	1
25291	152	256	1
25292	152	255	1
25293	152	254	1
25294	152	253	1
25295	152	252	1
25296	152	251	1
25297	152	250	1
25298	152	249	1
25299	152	248	1
25300	152	247	1
25301	152	246	1
25302	152	245	1
25303	152	244	1
25304	152	243	1
25305	152	242	1
25306	152	241	1
25307	152	240	1
25308	152	239	1
25309	152	238	1
25310	152	237	1
25311	152	236	1
25312	152	235	1
25313	152	234	1
25314	152	233	1
25315	152	232	1
25316	152	231	1
25317	152	230	1
25318	152	229	1
25319	152	228	1
25320	152	227	1
25321	152	226	1
25322	152	225	1
25323	152	224	1
25324	152	223	1
25325	152	222	1
25326	152	221	1
25327	152	220	1
25328	152	219	1
25329	152	218	1
25330	152	217	1
25331	152	216	1
25332	152	215	1
25333	152	214	1
25334	152	213	1
25335	152	212	1
25336	152	211	1
25337	152	210	1
25338	152	209	1
25339	152	208	1
25340	152	207	1
25341	152	206	1
25342	152	205	1
25343	152	204	1
25344	152	203	1
25345	152	202	1
25346	152	201	1
25347	152	200	1
25348	152	199	1
25349	152	198	1
25350	152	197	1
25351	152	196	1
25352	152	195	1
25353	152	194	1
25354	152	193	1
25355	152	192	1
25356	152	191	1
25357	152	190	1
25358	152	189	1
25359	152	188	1
25360	152	187	1
25361	152	186	1
25362	152	185	1
25363	152	184	1
25364	152	183	1
25365	152	182	1
25366	152	181	1
25367	152	180	1
25368	152	179	1
25369	152	178	1
25370	152	177	1
25371	152	176	1
25372	152	175	1
25373	152	174	1
25374	152	173	1
25375	152	172	1
25376	152	171	1
25377	152	170	1
25378	152	169	1
25379	152	168	1
25380	152	167	1
25381	152	166	1
25382	152	165	1
25383	152	164	1
25384	152	163	1
25385	152	162	1
25386	152	161	1
25387	152	160	1
25388	152	159	1
25389	152	158	1
25390	152	157	1
25391	152	156	1
25392	152	155	1
25393	152	154	1
25394	152	153	1
25395	152	152	1
25396	152	151	1
25397	152	150	1
25398	152	149	1
25399	152	148	1
25400	152	147	1
25401	152	146	1
25402	152	145	1
25403	152	144	1
25404	152	143	1
25405	152	142	1
25406	152	141	1
25407	152	140	1
25408	152	139	1
25409	152	138	1
25410	152	137	1
25411	152	136	1
25412	152	135	1
25413	152	134	1
25414	152	133	1
25415	152	132	1
25416	152	131	1
25417	152	130	1
25418	152	129	1
25419	152	128	1
25420	152	127	1
25421	152	126	1
25422	152	125	1
25423	152	124	1
25424	152	123	1
25425	152	122	1
25426	152	121	1
25427	152	120	1
25428	152	119	1
25429	152	118	1
25430	152	117	1
25431	152	116	1
25432	152	115	1
25433	152	114	1
25434	152	113	1
25435	152	112	1
25436	152	111	1
25437	152	110	1
25438	152	109	1
25439	152	108	1
25440	152	107	1
25441	152	106	1
25442	152	105	1
25443	152	104	1
25444	152	103	1
25445	152	102	1
25446	152	101	1
25447	152	100	1
25448	152	99	1
25449	152	98	1
25450	152	97	1
25451	152	96	1
25452	152	95	1
25453	152	94	1
25454	152	93	1
25455	152	92	1
25456	152	91	1
25457	152	90	1
25458	152	89	1
25459	152	88	1
25460	152	87	1
25461	152	86	1
25462	152	85	1
25463	152	84	1
25464	152	83	1
25465	152	82	1
25466	152	81	1
25467	152	80	1
25468	152	79	1
25469	152	78	1
25470	152	77	1
25471	152	76	1
25472	152	75	1
25473	152	74	1
25474	152	73	1
25475	152	72	1
25476	152	71	1
25477	152	70	1
25478	152	69	1
25479	152	68	1
25480	152	67	1
25481	152	66	1
25482	152	65	1
25483	152	64	1
25484	152	63	1
25485	152	62	1
25486	152	61	1
25487	152	60	1
25488	152	59	1
25489	152	58	1
25490	152	57	1
25491	152	56	1
25492	152	55	1
25493	152	54	1
25494	152	53	1
25495	152	52	1
25496	152	51	1
25497	152	50	1
25498	152	49	1
25499	152	48	1
25500	152	47	1
25501	152	46	1
25502	152	45	1
25503	152	44	1
25504	152	43	1
25505	152	42	1
25506	152	41	1
25507	152	40	1
25508	152	39	1
25509	152	38	1
25510	152	37	1
25511	152	36	1
25512	152	35	1
25513	152	34	1
25514	152	33	1
25515	152	32	1
25516	152	31	1
25517	152	30	1
25518	152	29	1
25519	152	28	1
25520	152	27	1
25521	152	26	1
25522	152	25	1
25523	152	24	1
25524	152	23	1
25525	152	22	1
25526	152	21	1
25527	152	20	1
25528	152	19	1
25529	152	18	1
25530	152	17	1
25531	152	16	1
25532	152	15	1
25533	152	14	1
25534	152	13	1
25535	152	12	1
25536	152	11	1
25537	152	10	1
25538	152	9	1
25539	152	8	1
25540	152	7	1
25541	152	6	1
25542	152	5	1
25543	152	4	1
25544	152	3	1
25545	152	2	1
25546	152	1	1
25547	152	0	1
25548	153	631	1
25549	153	630	1
25550	153	629	1
25551	153	628	1
25552	153	627	1
25553	153	626	1
25554	153	625	1
25555	153	624	1
25556	153	623	1
25557	153	622	1
25558	153	621	1
25559	153	620	1
25560	153	619	1
25561	153	618	1
25562	153	617	1
25563	153	616	1
25564	153	615	1
25565	153	614	1
25566	153	613	1
25567	153	612	1
25568	153	611	1
25569	153	610	1
25570	153	609	1
25571	153	608	1
25572	153	607	1
25573	153	606	1
25574	153	605	1
25575	153	604	1
25576	153	603	1
25577	153	602	1
25578	153	601	1
25579	153	600	1
25580	153	599	1
25581	153	598	1
25582	153	597	1
25583	153	596	1
25584	153	595	1
25585	153	594	1
25586	153	593	1
25587	153	592	1
25588	153	591	1
25589	153	590	1
25590	153	589	1
25591	153	588	1
25592	153	587	1
25593	153	586	1
25594	153	585	1
25595	153	584	1
25596	153	583	1
25597	153	582	1
25598	153	581	1
25599	153	580	1
25600	153	579	1
25601	153	578	1
25602	153	577	1
25603	153	576	1
25604	153	575	1
25605	153	574	1
25606	153	573	1
25607	153	572	1
25608	153	571	1
25609	153	570	1
25610	153	569	1
25611	153	568	1
25612	153	567	1
25613	153	566	1
25614	153	565	1
25615	153	564	1
25616	153	563	1
25617	153	562	1
25618	153	561	1
25619	153	560	1
25620	153	559	1
25621	153	558	1
25622	153	557	1
25623	153	556	1
25624	153	555	1
25625	153	554	1
25626	153	553	1
25627	153	552	1
25628	153	551	1
25629	153	550	1
25630	153	549	1
25631	153	548	1
25632	153	547	1
25633	153	546	1
25634	153	545	1
25635	153	544	1
25636	153	543	1
25637	153	542	1
25638	153	541	1
25639	153	540	1
25640	153	539	1
25641	153	538	1
25642	153	537	1
25643	153	536	1
25644	153	535	1
25645	153	534	1
25646	153	533	1
25647	153	532	1
25648	153	531	1
25649	153	530	1
25650	153	529	1
25651	153	528	1
25652	153	527	1
25653	153	526	1
25654	153	525	1
25655	153	524	1
25656	153	523	1
25657	153	522	1
25658	153	521	1
25659	153	520	1
25660	153	519	1
25661	153	518	1
25662	153	517	1
25663	153	516	1
25664	153	515	1
25665	153	514	1
25666	153	513	1
25667	153	512	1
25668	153	511	1
25669	153	510	1
25670	153	509	1
25671	153	508	1
25672	153	507	1
25673	153	506	1
25674	153	505	1
25675	153	504	1
25676	153	503	1
25677	153	502	1
25678	153	501	1
25679	153	500	1
25680	153	499	1
25681	153	498	1
25682	153	497	1
25683	153	496	1
25684	153	495	1
25685	153	494	1
25686	153	493	1
25687	153	492	1
25688	153	491	1
25689	153	490	1
25690	153	489	1
25691	153	488	1
25692	153	487	1
25693	153	486	1
25694	153	485	1
25695	153	484	1
25696	153	483	1
25697	153	482	1
25698	153	481	1
25699	153	480	1
25700	153	479	1
25701	153	478	1
25702	153	477	1
25703	153	476	1
25704	153	475	1
25705	153	474	1
25706	153	473	1
25707	153	472	1
25708	153	471	1
25709	153	470	1
25710	153	469	1
25711	153	468	1
25712	153	467	1
25713	153	466	1
25714	153	465	1
25715	153	464	1
25716	153	463	1
25717	153	462	1
25718	153	461	1
25719	153	460	1
25720	153	459	1
25721	153	458	1
25722	153	457	1
25723	153	456	1
25724	153	455	1
25725	153	454	1
25726	153	453	1
25727	153	452	1
25728	153	451	1
25729	153	450	1
25730	153	449	1
25731	153	448	1
25732	153	447	1
25733	153	446	1
25734	153	445	1
25735	153	444	1
25736	153	443	1
25737	153	442	1
25738	153	441	1
25739	153	440	1
25740	153	439	1
25741	153	438	1
25742	153	437	1
25743	153	436	1
25744	153	435	1
25745	153	434	1
25746	153	433	1
25747	153	432	1
25748	153	431	1
25749	153	430	1
25750	153	429	1
25751	153	428	1
25752	153	427	1
25753	153	426	1
25754	153	425	1
25755	153	424	1
25756	153	423	1
25757	153	422	1
25758	153	421	1
25759	153	420	1
25760	153	419	1
25761	153	418	1
25762	153	417	1
25763	153	416	1
25764	153	415	1
25765	153	414	1
25766	153	413	1
25767	153	412	1
25768	153	411	1
25769	153	410	1
25770	153	409	1
25771	153	408	1
25772	153	407	1
25773	153	406	1
25774	153	405	1
25775	153	404	1
25776	153	403	1
25777	153	402	1
25778	153	401	1
25779	153	400	1
25780	153	399	1
25781	153	398	1
25782	153	397	1
25783	153	396	1
25784	153	395	1
25785	153	394	1
25786	153	393	1
25787	153	392	1
25788	153	391	1
25789	153	390	1
25790	153	389	1
25791	153	388	1
25792	153	387	1
25793	153	386	1
25794	153	385	1
25795	153	384	1
25796	153	383	1
25797	153	382	1
25798	153	381	1
25799	153	380	1
25800	153	379	1
25801	153	378	1
25802	153	377	1
25803	153	376	1
25804	153	375	1
25805	153	374	1
25806	153	373	1
25807	153	372	1
25808	153	371	1
25809	153	370	1
25810	153	369	1
25811	153	368	1
25812	153	367	1
25813	153	366	1
25814	153	365	1
25815	153	364	1
25816	153	363	1
25817	153	362	1
25818	153	361	1
25819	153	360	1
25820	153	359	1
25821	153	358	1
25822	153	357	1
25823	153	356	1
25824	153	355	1
25825	153	354	1
25826	153	353	1
25827	153	352	1
25828	153	351	1
25829	153	350	1
25830	153	349	1
25831	153	348	1
25832	153	347	1
25833	153	346	1
25834	153	345	1
25835	153	344	1
25836	153	343	1
25837	153	342	1
25838	153	341	1
25839	153	340	1
25840	153	339	1
25841	153	338	1
25842	153	337	1
25843	153	336	1
25844	153	335	1
25845	153	334	1
25846	153	333	1
25847	153	332	1
25848	153	331	1
25849	153	330	1
25850	153	329	1
25851	153	328	1
25852	153	327	1
25853	153	326	1
25854	153	325	1
25855	153	324	1
25856	153	323	1
25857	153	322	1
25858	153	321	1
25859	153	320	1
25860	153	319	1
25861	153	318	1
25862	153	317	1
25863	153	316	1
25864	153	315	1
25865	153	314	1
25866	153	313	1
25867	153	312	1
25868	153	311	1
25869	153	310	1
25870	153	309	1
25871	153	308	1
25872	153	307	1
25873	153	306	1
25874	153	305	1
25875	153	304	1
25876	153	303	1
25877	153	302	1
25878	153	301	1
25879	153	300	1
25880	153	299	1
25881	153	298	1
25882	153	297	1
25883	153	296	1
25884	153	295	1
25885	153	294	1
25886	153	293	1
25887	153	292	1
25888	153	291	1
25889	153	290	1
25890	153	289	1
25891	153	288	1
25892	153	287	1
25893	153	286	1
25894	153	285	1
25895	153	284	1
25896	153	283	1
25897	153	282	1
25898	153	281	1
25899	153	280	1
25900	153	279	1
25901	153	278	1
25902	153	277	1
25903	153	276	1
25904	153	275	1
25905	153	274	1
25906	153	273	1
25907	153	272	1
25908	153	271	1
25909	153	270	1
25910	153	269	1
25911	153	268	1
25912	153	267	1
25913	153	266	1
25914	153	265	1
25915	153	264	1
25916	153	263	1
25917	153	262	1
25918	153	261	1
25919	153	260	1
25920	153	259	1
25921	153	258	1
25922	153	257	1
25923	153	256	1
25924	153	255	1
25925	153	254	1
25926	153	253	1
25927	153	252	1
25928	153	251	1
25929	153	250	1
25930	153	249	1
25931	153	248	1
25932	153	247	1
25933	153	246	1
25934	153	245	1
25935	153	244	1
25936	153	243	1
25937	153	242	1
25938	153	241	1
25939	153	240	1
25940	153	239	1
25941	153	238	1
25942	153	237	1
25943	153	236	1
25944	153	235	1
25945	153	234	1
25946	153	233	1
25947	153	232	1
25948	153	231	1
25949	153	230	1
25950	153	229	1
25951	153	228	1
25952	153	227	1
25953	153	226	1
25954	153	225	1
25955	153	224	1
25956	153	223	1
25957	153	222	1
25958	153	221	1
25959	153	220	1
25960	153	219	1
25961	153	218	1
25962	153	217	1
25963	153	216	1
25964	153	215	1
25965	153	214	1
25966	153	213	1
25967	153	212	1
25968	153	211	1
25969	153	210	1
25970	153	209	1
25971	153	208	1
25972	153	207	1
25973	153	206	1
25974	153	205	1
25975	153	204	1
25976	153	203	1
25977	153	202	1
25978	153	201	1
25979	153	200	1
25980	153	199	1
25981	153	198	1
25982	153	197	1
25983	153	196	1
25984	153	195	1
25985	153	194	1
25986	153	193	1
25987	153	192	1
25988	153	191	1
25989	153	190	1
25990	153	189	1
25991	153	188	1
25992	153	187	1
25993	153	186	1
25994	153	185	1
25995	153	184	1
25996	153	183	1
25997	153	182	1
25998	153	181	1
25999	153	180	1
26000	153	179	1
26001	153	178	1
26002	153	177	1
26003	153	176	1
26004	153	175	1
26005	153	174	1
26006	153	173	1
26007	153	172	1
26008	153	171	1
26009	153	170	1
26010	153	169	1
26011	153	168	1
26012	153	167	1
26013	153	166	1
26014	153	165	1
26015	153	164	1
26016	153	163	1
26017	153	162	1
26018	153	161	1
26019	153	160	1
26020	153	159	1
26021	153	158	1
26022	153	157	1
26023	153	156	1
26024	153	155	1
26025	153	154	1
26026	153	153	1
26027	153	152	1
26028	153	151	1
26029	153	150	1
26030	153	149	1
26031	153	148	1
26032	153	147	1
26033	153	146	1
26034	153	145	1
26035	153	144	1
26036	153	143	1
26037	153	142	1
26038	153	141	1
26039	153	140	1
26040	153	139	1
26041	153	138	1
26042	153	137	1
26043	153	136	1
26044	153	135	1
26045	153	134	1
26046	153	133	1
26047	153	132	1
26048	153	131	1
26049	153	130	1
26050	153	129	1
26051	153	128	1
26052	153	127	1
26053	153	126	1
26054	153	125	1
26055	153	124	1
26056	153	123	1
26057	153	122	1
26058	153	121	1
26059	153	120	1
26060	153	119	1
26061	153	118	1
26062	153	117	1
26063	153	116	1
26064	153	115	1
26065	153	114	1
26066	153	113	1
26067	153	112	1
26068	153	111	1
26069	153	110	1
26070	153	109	1
26071	153	108	1
26072	153	107	1
26073	153	106	1
26074	153	105	1
26075	153	104	1
26076	153	103	1
26077	153	102	1
26078	153	101	1
26079	153	100	1
26080	153	99	1
26081	153	98	1
26082	153	97	1
26083	153	96	1
26084	153	95	1
26085	153	94	1
26086	153	93	1
26087	153	92	1
26088	153	91	1
26089	153	90	1
26090	153	89	1
26091	153	88	1
26092	153	87	1
26093	153	86	1
26094	153	85	1
26095	153	84	1
26096	153	83	1
26097	153	82	1
26098	153	81	1
26099	153	80	1
26100	153	79	1
26101	153	78	1
26102	153	77	1
26103	153	76	1
26104	153	75	1
26105	153	74	1
26106	153	73	1
26107	153	72	1
26108	153	71	1
26109	153	70	1
26110	153	69	1
26111	153	68	1
26112	153	67	1
26113	153	66	1
26114	153	65	1
26115	153	64	1
26116	153	63	1
26117	153	62	1
26118	153	61	1
26119	153	60	1
26120	153	59	1
26121	153	58	1
26122	153	57	1
26123	153	56	1
26124	153	55	1
26125	153	54	1
26126	153	53	1
26127	153	52	1
26128	153	51	1
26129	153	50	1
26130	153	49	1
26131	153	48	1
26132	153	47	1
26133	153	46	1
26134	153	45	1
26135	153	44	1
26136	153	43	1
26137	153	42	1
26138	153	41	1
26139	153	40	1
26140	153	39	1
26141	153	38	1
26142	153	37	1
26143	153	36	1
26144	153	35	1
26145	153	34	1
26146	153	33	1
26147	153	32	1
26148	153	31	1
26149	153	30	1
26150	153	29	1
26151	153	28	1
26152	153	27	1
26153	153	26	1
26154	153	25	1
26155	153	24	1
26156	153	23	1
26157	153	22	1
26158	153	21	1
26159	153	20	1
26160	153	19	1
26161	153	18	1
26162	153	17	1
26163	153	16	1
26164	153	15	1
26165	153	14	1
26166	153	13	1
26167	153	12	1
26168	153	11	1
26169	153	10	1
26170	153	9	1
26171	153	8	1
26172	153	7	1
26173	153	6	1
26174	153	5	1
26175	153	4	1
26176	153	3	1
26177	153	2	1
26178	153	1	1
26179	154	524	1
26180	154	523	1
26181	154	522	1
26182	154	521	1
26183	154	520	1
26184	154	519	1
26185	154	518	1
26186	154	517	1
26187	154	516	1
26188	154	515	1
26189	154	514	1
26190	154	513	1
26191	154	512	1
26192	154	511	1
26193	154	510	1
26194	154	509	1
26195	154	508	1
26196	154	507	1
26197	154	506	1
26198	154	505	1
26199	154	504	1
26200	154	503	1
26201	154	502	1
26202	154	501	1
26203	154	500	1
26204	154	499	1
26205	154	498	1
26206	154	497	1
26207	154	496	1
26208	154	495	1
26209	154	494	1
26210	154	493	1
26211	154	492	1
26212	154	491	1
26213	154	490	1
26214	154	489	1
26215	154	488	1
26216	154	487	1
26217	154	486	1
26218	154	485	1
26219	154	484	1
26220	154	483	1
26221	154	482	1
26222	154	481	1
26223	154	480	1
26224	154	479	1
26225	154	478	1
26226	154	477	1
26227	154	476	1
26228	154	475	1
26229	154	474	1
26230	154	473	1
26231	154	472	1
26232	154	471	1
26233	154	470	1
26234	154	469	1
26235	154	468	1
26236	154	467	1
26237	154	466	1
26238	154	465	1
26239	154	464	1
26240	154	463	1
26241	154	462	1
26242	154	461	1
26243	154	460	1
26244	154	459	1
26245	154	458	1
26246	154	457	1
26247	154	456	1
26248	154	455	1
26249	154	454	1
26250	154	453	1
26251	154	452	1
26252	154	451	1
26253	154	450	1
26254	154	449	1
26255	154	448	1
26256	154	447	1
26257	154	446	1
26258	154	445	1
26259	154	444	1
26260	154	443	1
26261	154	442	1
26262	154	441	1
26263	154	440	1
26264	154	439	1
26265	154	438	1
26266	154	437	1
26267	154	436	1
26268	154	435	1
26269	154	434	1
26270	154	433	1
26271	154	432	1
26272	154	431	1
26273	154	430	1
26274	154	429	1
26275	154	428	1
26276	154	427	1
26277	154	426	1
26278	154	425	1
26279	154	424	1
26280	154	423	1
26281	154	422	1
26282	154	421	1
26283	154	420	1
26284	154	419	1
26285	154	418	1
26286	154	417	1
26287	154	416	1
26288	154	415	1
26289	154	414	1
26290	154	413	1
26291	154	412	1
26292	154	411	1
26293	154	410	1
26294	154	409	1
26295	154	408	1
26296	154	407	1
26297	154	406	1
26298	154	405	1
26299	154	404	1
26300	154	403	1
26301	154	402	1
26302	154	401	1
26303	154	400	1
26304	154	399	1
26305	154	398	1
26306	154	397	1
26307	154	396	1
26308	154	395	1
26309	154	394	1
26310	154	393	1
26311	154	392	1
26312	154	391	1
26313	154	390	1
26314	154	389	1
26315	154	388	1
26316	154	387	1
26317	154	386	1
26318	154	385	1
26319	154	384	1
26320	154	383	1
26321	154	382	1
26322	154	381	1
26323	154	380	1
26324	154	379	1
26325	154	378	1
26326	154	377	1
26327	154	376	1
26328	154	375	1
26329	154	374	1
26330	154	373	1
26331	154	372	1
26332	154	371	1
26333	154	370	1
26334	154	369	1
26335	154	368	1
26336	154	367	1
26337	154	366	1
26338	154	365	1
26339	154	364	1
26340	154	363	1
26341	154	362	1
26342	154	361	1
26343	154	360	1
26344	154	359	1
26345	154	358	1
26346	154	357	1
26347	154	356	1
26348	154	355	1
26349	154	354	1
26350	154	353	1
26351	154	352	1
26352	154	351	1
26353	154	350	1
26354	154	349	1
26355	154	348	1
26356	154	347	1
26357	154	346	1
26358	154	345	1
26359	154	344	1
26360	154	343	1
26361	154	342	1
26362	154	341	1
26363	154	340	1
26364	154	339	1
26365	154	338	1
26366	154	337	1
26367	154	336	1
26368	154	335	1
26369	154	334	1
26370	154	333	1
26371	154	332	1
26372	154	331	1
26373	154	330	1
26374	154	329	1
26375	154	328	1
26376	154	327	1
26377	154	326	1
26378	154	325	1
26379	154	324	1
26380	154	323	1
26381	154	322	1
26382	154	321	1
26383	154	320	1
26384	154	319	1
26385	154	318	1
26386	154	317	1
26387	154	316	1
26388	154	315	1
26389	154	314	1
26390	154	313	1
26391	154	312	1
26392	154	311	1
26393	154	310	1
26394	154	309	1
26395	154	308	1
26396	154	307	1
26397	154	306	1
26398	154	305	1
26399	154	304	1
26400	154	303	1
26401	154	302	1
26402	154	301	1
26403	154	300	1
26404	154	299	1
26405	154	298	1
26406	154	297	1
26407	154	296	1
26408	154	295	1
26409	154	294	1
26410	154	293	1
26411	154	292	1
26412	154	291	1
26413	154	290	1
26414	154	289	1
26415	154	288	1
26416	154	287	1
26417	154	286	1
26418	154	285	1
26419	154	284	1
26420	154	283	1
26421	154	282	1
26422	154	281	1
26423	154	280	1
26424	154	279	1
26425	154	278	1
26426	154	277	1
26427	154	276	1
26428	154	275	1
26429	154	274	1
26430	154	273	1
26431	154	272	1
26432	154	271	1
26433	154	270	1
26434	154	269	1
26435	154	268	1
26436	154	267	1
26437	154	266	1
26438	154	265	1
26439	154	264	1
26440	154	263	1
26441	154	262	1
26442	154	261	1
26443	154	260	1
26444	154	259	1
26445	154	258	1
26446	154	257	1
26447	154	256	1
26448	154	255	1
26449	154	254	1
26450	154	253	1
26451	154	252	1
26452	154	251	1
26453	154	250	1
26454	154	249	1
26455	154	248	1
26456	154	247	1
26457	154	246	1
26458	154	245	1
26459	154	244	1
26460	154	243	1
26461	154	242	1
26462	154	241	1
26463	154	240	1
26464	154	239	1
26465	154	238	1
26466	154	237	1
26467	154	236	1
26468	154	235	1
26469	154	234	1
26470	154	233	1
26471	154	232	1
26472	154	231	1
26473	154	230	1
26474	154	229	1
26475	154	228	1
26476	154	227	1
26477	154	226	1
26478	154	225	1
26479	154	224	1
26480	154	223	1
26481	154	222	1
26482	154	221	1
26483	154	220	1
26484	154	219	1
26485	154	218	1
26486	154	217	1
26487	154	216	1
26488	154	215	1
26489	154	214	1
26490	154	213	1
26491	154	212	1
26492	154	211	1
26493	154	210	1
26494	154	209	1
26495	154	208	1
26496	154	207	1
26497	154	206	1
26498	154	205	1
26499	154	204	1
26500	154	203	1
26501	154	202	1
26502	154	201	1
26503	154	200	1
26504	154	199	1
26505	154	198	1
26506	154	197	1
26507	154	196	1
26508	154	195	1
26509	154	194	1
26510	154	193	1
26511	154	192	1
26512	154	191	1
26513	154	190	1
26514	154	189	1
26515	154	188	1
26516	154	187	1
26517	154	186	1
26518	154	185	1
26519	154	184	1
26520	154	183	1
26521	154	182	1
26522	154	181	1
26523	154	180	1
26524	154	179	1
26525	154	178	1
26526	154	177	1
26527	154	176	1
26528	154	175	1
26529	154	174	1
26530	154	173	1
26531	154	172	1
26532	154	171	1
26533	154	170	1
26534	154	169	1
26535	154	168	1
26536	154	167	1
26537	154	166	1
26538	154	165	1
26539	154	164	1
26540	154	163	1
26541	154	162	1
26542	154	161	1
26543	154	160	1
26544	154	159	1
26545	154	158	1
26546	154	157	1
26547	154	156	1
26548	154	155	1
26549	154	154	1
26550	154	153	1
26551	154	152	1
26552	154	151	1
26553	154	150	1
26554	154	149	1
26555	154	148	1
26556	154	147	1
26557	154	146	1
26558	154	145	1
26559	154	144	1
26560	154	143	1
26561	154	142	1
26562	154	141	1
26563	154	140	1
26564	154	139	1
26565	154	138	1
26566	154	137	1
26567	154	136	1
26568	154	135	1
26569	154	134	1
26570	154	133	1
26571	154	132	1
26572	154	131	1
26573	154	130	1
26574	154	129	1
26575	154	128	1
26576	154	127	1
26577	154	126	1
26578	154	125	1
26579	154	124	1
26580	154	123	1
26581	154	122	1
26582	154	121	1
26583	154	120	1
26584	154	119	1
26585	154	118	1
26586	154	117	1
26587	154	116	1
26588	154	115	1
26589	154	114	1
26590	154	113	1
26591	154	112	1
26592	154	111	1
26593	154	110	1
26594	154	109	1
26595	154	108	1
26596	154	107	1
26597	154	106	1
26598	154	105	1
26599	154	104	1
26600	154	103	1
26601	154	102	1
26602	154	101	1
26603	154	100	1
26604	154	99	1
26605	154	98	1
26606	154	97	1
26607	154	96	1
26608	154	95	1
26609	154	94	1
26610	154	93	1
26611	154	92	1
26612	154	91	1
26613	154	90	1
26614	154	89	1
26615	154	88	1
26616	154	87	1
26617	154	86	1
26618	154	85	1
26619	154	84	1
26620	154	83	1
26621	154	82	1
26622	154	81	1
26623	154	80	1
26624	154	79	1
26625	154	78	1
26626	154	77	1
26627	154	76	1
26628	154	75	1
26629	154	74	1
26630	154	73	1
26631	154	72	1
26632	154	71	1
26633	154	70	1
26634	154	69	1
26635	154	68	1
26636	154	67	1
26637	154	66	1
26638	154	65	1
26639	154	64	1
26640	154	63	1
26641	154	62	1
26642	154	61	1
26643	154	60	1
26644	154	59	1
26645	154	58	1
26646	154	57	1
26647	154	56	1
26648	154	55	1
26649	154	54	1
26650	154	53	1
26651	154	52	1
26652	154	51	1
26653	154	50	1
26654	154	49	1
26655	154	48	1
26656	154	47	1
26657	154	46	1
26658	154	45	1
26659	154	44	1
26660	154	43	1
26661	154	42	1
26662	154	41	1
26663	154	40	1
26664	154	39	1
26665	154	38	1
26666	154	37	1
26667	154	36	1
26668	154	35	1
26669	154	34	1
26670	154	33	1
26671	154	32	1
26672	154	31	1
26673	154	30	1
26674	154	29	1
26675	154	28	1
26676	154	27	1
26677	154	26	1
26678	154	25	1
26679	154	24	1
26680	154	23	1
26681	154	22	1
26682	154	21	1
26683	154	20	1
26684	154	19	1
26685	154	18	1
26686	154	17	1
26687	154	16	1
26688	154	15	1
26689	154	14	1
26690	154	13	1
26691	154	12	1
26692	154	11	1
26693	154	10	1
26694	154	9	1
26695	154	8	1
26696	154	7	1
26697	154	6	1
26698	154	5	1
26699	154	4	1
26700	154	3	1
26701	154	2	1
26702	154	1	1
26703	155	75	1
26704	155	74	1
26705	155	73	1
26706	155	72	1
26707	155	71	1
26708	155	70	1
26709	155	69	1
26710	155	68	1
26711	155	67	1
26712	155	66	1
26713	155	65	1
26714	155	64	1
26715	155	63	1
26716	155	62	1
26717	155	61	1
26718	155	60	1
26719	155	59	1
26720	155	58	1
26721	155	57	1
26722	155	56	1
26723	155	55	1
26724	155	54	1
26725	155	53	1
26726	155	52	1
26727	155	51	1
26728	155	50	1
26729	155	49	1
26730	155	48	1
26731	155	47	1
26732	155	46	1
26733	155	45	1
26734	155	44	1
26735	155	43	1
26736	155	42	1
26737	155	41	1
26738	155	40	1
26739	155	39	1
26740	155	38	1
26741	155	37	1
26742	155	36	1
26743	155	35	1
26744	155	34	1
26745	155	33	1
26746	155	32	1
26747	155	31	1
26748	155	30	1
26749	155	29	1
26750	155	28	1
26751	155	27	1
26752	155	26	1
26753	155	25	1
26754	155	24	1
26755	155	23	1
26756	155	22	1
26757	155	21	1
26758	155	20	1
26759	155	19	1
26760	155	18	1
26761	155	17	1
26762	155	16	1
26763	155	15	1
26764	155	14	1
26765	155	13	1
26766	155	12	1
26767	155	11	1
26768	155	10	1
26769	155	9	1
26770	155	8	1
26771	155	7	1
26772	155	6	1
26773	155	5	1
26774	155	4	1
26775	155	3	1
26776	155	2	1
26777	155	1	1
26778	156	143	2
26779	156	142	2
26780	156	141	2
26781	156	140	2
26782	156	139	2
26783	156	138	2
26784	156	137	2
26785	156	136	2
26786	156	135	2
26787	156	134	2
26788	156	133	2
26789	156	132	2
26790	156	131	2
26791	156	130	2
26792	156	129	2
26793	156	128	1
26794	156	127	1
26795	156	126	1
26796	156	125	1
26797	156	124	1
26798	156	123	1
26799	156	122	1
26800	156	121	1
26801	156	120	1
26802	156	119	1
26803	156	118	1
26804	156	117	1
26805	156	116	1
26806	156	115	1
26807	156	114	1
26808	156	113	1
26809	156	112	1
26810	156	111	1
26811	156	110	1
26812	156	109	1
26813	156	108	1
26814	156	107	1
26815	156	106	1
26816	156	105	1
26817	156	104	1
26818	156	103	1
26819	156	102	1
26820	156	101	1
26821	156	100	1
26822	156	99	1
26823	156	98	1
26824	156	97	1
26825	156	96	1
26826	156	95	1
26827	156	94	1
26828	156	93	1
26829	156	92	1
26830	156	91	1
26831	156	90	1
26832	156	89	1
26833	156	88	1
26834	156	87	1
26835	156	86	1
26836	156	85	1
26837	156	84	1
26838	156	83	1
26839	156	82	1
26840	156	81	1
26841	156	80	1
26842	156	79	1
26843	156	78	1
26844	156	77	1
26845	156	76	1
26846	156	75	1
26847	156	74	1
26848	156	73	1
26849	156	72	1
26850	156	71	1
26851	156	70	1
26852	156	69	1
26853	156	68	1
26854	156	67	1
26855	156	66	1
26856	156	65	1
26857	156	64	1
26858	156	63	1
26859	156	62	1
26860	156	61	1
26861	156	60	1
26862	156	59	1
26863	156	58	1
26864	156	57	1
26865	156	56	1
26866	156	55	1
26867	156	54	1
26868	156	53	1
26869	156	52	1
26870	156	51	1
26871	156	50	1
26872	156	49	1
26873	156	48	1
26874	156	47	1
26875	156	46	1
26876	156	45	1
26877	156	44	1
26878	156	43	1
26879	156	42	1
26880	156	41	1
26881	156	40	1
26882	156	39	1
26883	156	38	1
26884	156	37	1
26885	156	36	1
26886	156	35	1
26887	156	34	1
26888	156	33	1
26889	156	32	1
26890	156	31	1
26891	156	30	1
26892	156	29	1
26893	156	28	1
26894	156	27	1
26895	156	26	1
26896	156	25	1
26897	156	24	1
26898	156	23	1
26899	156	22	1
26900	156	21	1
26901	156	20	1
26902	156	19	1
26903	156	18	1
26904	156	17	1
26905	156	16	1
26906	156	15	1
26907	156	14	1
26908	156	13	1
26909	156	12	1
26910	156	11	1
26911	156	10	1
26912	156	9	1
26913	156	8	1
26914	156	7	1
26915	156	6	1
26916	156	5	1
26917	156	4	1
26918	156	3	1
26919	156	2	1
26920	156	1	1
26921	157	85	2
26922	157	84	2
26923	157	83	2
26924	157	82	2
26925	157	81	2
26926	157	80	2
26927	157	79	2
26928	157	78	2
26929	157	77	2
26930	157	76	2
26931	157	75	2
26932	157	74	2
26933	157	73	2
26934	157	72	2
26935	157	71	2
26936	157	70	2
26937	157	69	2
26938	157	68	2
26939	157	67	2
26940	157	66	2
26941	157	65	2
26942	157	64	2
26943	157	63	2
26944	157	62	2
26945	157	61	2
26946	157	60	2
26947	157	59	2
26948	157	58	2
26949	157	57	2
26950	157	56	2
26951	157	55	1
26952	157	54	1
26953	157	53	1
26954	157	52	1
26955	157	51	1
26956	157	50	1
26957	157	49	1
26958	157	48	1
26959	157	47	1
26960	157	46	1
26961	157	45	1
26962	157	44	1
26963	157	43	1
26964	157	42	1
26965	157	41	1
26966	157	40	1
26967	157	39	1
26968	157	38	1
26969	157	37	1
26970	157	36	1
26971	157	35	1
26972	157	34	1
26973	157	33	1
26974	157	32	1
26975	157	31	1
26976	157	30	1
26977	157	29	1
26978	157	28	1
26979	157	27	1
26980	157	26	1
26981	157	25	1
26982	157	24	1
26983	157	23	1
26984	157	22	1
26985	157	21	1
26986	157	20	1
26987	157	19	1
26988	157	18	1
26989	157	17	1
26990	157	16	1
26991	157	15	1
26992	157	14	1
26993	157	13	1
26994	157	12	1
26995	157	11	1
26996	157	10	1
26997	157	9	1
26998	157	8	1
26999	157	7	1
27000	157	6	1
27001	157	5	1
27002	157	4	1
27003	157	3	1
27004	157	2	1
27005	157	1	1
27006	157	0	1
27007	158	163	1
27008	158	162	1
27009	158	161	1
27010	158	160	1
27011	158	159	1
27012	158	158	1
27013	158	157	1
27014	158	156	1
27015	158	155	1
27016	158	154	1
27017	158	153	1
27018	158	152	1
27019	158	151	1
27020	158	150	1
27021	158	149	1
27022	158	148	1
27023	158	147	1
27024	158	146	1
27025	158	145	1
27026	158	144	1
27027	158	143	1
27028	158	142	1
27029	158	141	1
27030	158	140	1
27031	158	139	1
27032	158	138	1
27033	158	137	1
27034	158	136	1
27035	158	135	1
27036	158	134	1
27037	158	133	1
27038	158	132	1
27039	158	131	1
27040	158	130	1
27041	158	129	1
27042	158	128	1
27043	158	127	1
27044	158	126	1
27045	158	125	1
27046	158	124	1
27047	158	123	1
27048	158	122	1
27049	158	121	1
27050	158	120	1
27051	158	119	1
27052	158	118	1
27053	158	117	1
27054	158	116	1
27055	158	115	1
27056	158	114	1
27057	158	113	1
27058	158	112	1
27059	158	111	1
27060	158	110	1
27061	158	109	1
27062	158	108	1
27063	158	107	1
27064	158	106	1
27065	158	105	1
27066	158	104	1
27067	158	103	1
27068	158	102	1
27069	158	101	1
27070	158	100	1
27071	158	99	1
27072	158	98	1
27073	158	97	1
27074	158	96	1
27075	158	95	1
27076	158	94	1
27077	158	93	1
27078	158	92	1
27079	158	91	1
27080	158	90	1
27081	158	89	1
27082	158	88	1
27083	158	87	1
27084	158	86	1
27085	158	85	1
27086	158	84	1
27087	158	83	1
27088	158	82	1
27089	158	81	1
27090	158	80	1
27091	158	79	1
27092	158	78	1
27093	158	77	1
27094	158	76	1
27095	158	75	1
27096	158	74	1
27097	158	73	1
27098	158	72	1
27099	158	71	1
27100	158	70	1
27101	158	69	1
27102	158	68	1
27103	158	67	1
27104	158	66	1
27105	158	65	1
27106	158	64	1
27107	158	63	1
27108	158	62	1
27109	158	61	1
27110	158	60	1
27111	158	59	1
27112	158	58	1
27113	158	57	1
27114	158	56	1
27115	158	55	1
27116	158	54	1
27117	158	53	1
27118	158	52	1
27119	158	51	1
27120	158	50	1
27121	158	49	1
27122	158	48	1
27123	158	47	1
27124	158	46	1
27125	158	45	1
27126	158	44	1
27127	158	43	1
27128	158	42	1
27129	158	41	1
27130	158	40	1
27131	158	39	1
27132	158	38	1
27133	158	37	1
27134	158	36	1
27135	158	35	1
27136	158	34	1
27137	158	33	1
27138	158	32	1
27139	158	31	1
27140	158	30	1
27141	158	29	1
27142	158	28	1
27143	158	27	1
27144	158	26	1
27145	158	25	1
27146	158	24	1
27147	158	23	1
27148	158	22	1
27149	158	21	1
27150	158	20	1
27151	158	19	1
27152	158	18	1
27153	158	17	1
27154	158	16	1
27155	158	15	1
27156	158	14	1
27157	158	13	1
27158	158	12	1
27159	158	11	1
27160	158	10	1
27161	158	9	1
27162	158	8	1
27163	158	7	1
27164	158	6	1
27165	158	5	1
27166	158	4	1
27167	158	3	1
27168	158	2	1
27169	158	1	1
27170	159	310	1
27171	159	309	1
27172	159	308	1
27173	159	307	1
27174	159	306	1
27175	159	305	1
27176	159	304	1
27177	159	303	1
27178	159	302	1
27179	159	301	1
27180	159	300	1
27181	159	299	1
27182	159	298	1
27183	159	297	1
27184	159	296	1
27185	159	295	1
27186	159	294	1
27187	159	293	1
27188	159	292	1
27189	159	291	1
27190	159	290	1
27191	159	289	1
27192	159	288	1
27193	159	287	1
27194	159	286	1
27195	159	285	1
27196	159	284	1
27197	159	283	1
27198	159	282	1
27199	159	281	1
27200	159	280	1
27201	159	279	1
27202	159	278	1
27203	159	277	1
27204	159	276	1
27205	159	275	1
27206	159	274	1
27207	159	273	1
27208	159	272	1
27209	159	271	1
27210	159	270	1
27211	159	269	1
27212	159	268	1
27213	159	267	1
27214	159	266	1
27215	159	265	1
27216	159	264	1
27217	159	263	1
27218	159	262	1
27219	159	261	1
27220	159	260	1
27221	159	259	1
27222	159	258	1
27223	159	257	1
27224	159	256	1
27225	159	255	1
27226	159	254	1
27227	159	253	1
27228	159	252	1
27229	159	251	1
27230	159	250	1
27231	159	249	1
27232	159	248	1
27233	159	247	1
27234	159	246	1
27235	159	245	1
27236	159	244	1
27237	159	243	1
27238	159	242	1
27239	159	241	1
27240	159	240	1
27241	159	239	1
27242	159	238	1
27243	159	237	1
27244	159	236	1
27245	159	235	1
27246	159	234	1
27247	159	233	1
27248	159	232	1
27249	159	231	1
27250	159	230	1
27251	159	229	1
27252	159	228	1
27253	159	227	1
27254	159	226	1
27255	159	225	1
27256	159	224	1
27257	159	223	1
27258	159	222	1
27259	159	221	1
27260	159	220	1
27261	159	219	1
27262	159	218	1
27263	159	217	1
27264	159	216	1
27265	159	215	1
27266	159	214	1
27267	159	213	1
27268	159	212	1
27269	159	211	1
27270	159	210	1
27271	159	209	1
27272	159	208	1
27273	159	207	1
27274	159	206	1
27275	159	205	1
27276	159	204	1
27277	159	203	1
27278	159	202	1
27279	159	201	1
27280	159	200	1
27281	159	199	1
27282	159	198	1
27283	159	197	1
27284	159	196	1
27285	159	195	1
27286	159	194	1
27287	159	193	1
27288	159	192	1
27289	159	191	1
27290	159	190	1
27291	159	189	1
27292	159	188	1
27293	159	187	1
27294	159	186	1
27295	159	185	1
27296	159	184	1
27297	159	183	1
27298	159	182	1
27299	159	181	1
27300	159	180	1
27301	159	179	1
27302	159	178	1
27303	159	177	1
27304	159	176	1
27305	159	175	1
27306	159	174	1
27307	159	173	1
27308	159	172	1
27309	159	171	1
27310	159	170	1
27311	159	169	1
27312	159	168	1
27313	159	167	1
27314	159	166	1
27315	159	165	1
27316	159	164	1
27317	159	163	1
27318	159	162	1
27319	159	161	1
27320	159	160	1
27321	159	159	1
27322	159	158	1
27323	159	157	1
27324	159	156	1
27325	159	155	1
27326	159	154	1
27327	159	153	1
27328	159	152	1
27329	159	151	1
27330	159	150	1
27331	159	149	1
27332	159	148	1
27333	159	147	1
27334	159	146	1
27335	159	145	1
27336	159	144	1
27337	159	143	1
27338	159	142	1
27339	159	141	1
27340	159	140	1
27341	159	139	1
27342	159	138	1
27343	159	137	1
27344	159	136	1
27345	159	135	1
27346	159	134	1
27347	159	133	1
27348	159	132	1
27349	159	131	1
27350	159	130	1
27351	159	129	1
27352	159	128	1
27353	159	127	1
27354	159	126	1
27355	159	125	1
27356	159	124	1
27357	159	123	1
27358	159	122	1
27359	159	121	1
27360	159	120	1
27361	159	119	1
27362	159	118	1
27363	159	117	1
27364	159	116	1
27365	159	115	1
27366	159	114	1
27367	159	113	1
27368	159	112	1
27369	159	111	1
27370	159	110	1
27371	159	109	1
27372	159	108	1
27373	159	107	1
27374	159	106	1
27375	159	105	1
27376	159	104	1
27377	159	103	1
27378	159	102	1
27379	159	101	1
27380	159	100	1
27381	159	99	1
27382	159	98	1
27383	159	97	1
27384	159	96	1
27385	159	95	1
27386	159	94	1
27387	159	93	1
27388	159	92	1
27389	159	91	1
27390	159	90	1
27391	159	89	1
27392	159	88	1
27393	159	87	1
27394	159	86	1
27395	159	85	1
27396	159	84	1
27397	159	83	1
27398	159	82	1
27399	159	81	1
27400	159	80	1
27401	159	79	1
27402	159	78	1
27403	159	77	1
27404	159	76	1
27405	159	75	1
27406	159	74	1
27407	159	73	1
27408	159	72	1
27409	159	71	1
27410	159	70	1
27411	159	69	1
27412	159	68	1
27413	159	67	1
27414	159	66	1
27415	159	65	1
27416	159	64	1
27417	159	63	1
27418	159	62	1
27419	159	61	1
27420	159	60	1
27421	159	59	1
27422	159	58	1
27423	159	57	1
27424	159	56	1
27425	159	55	1
27426	159	54	1
27427	159	53	1
27428	159	52	1
27429	159	51	1
27430	159	50	1
27431	159	49	1
27432	159	48	1
27433	159	47	1
27434	159	46	1
27435	159	45	1
27436	159	44	1
27437	159	43	1
27438	159	42	1
27439	159	41	1
27440	159	40	1
27441	159	39	1
27442	159	38	1
27443	159	37	1
27444	159	36	1
27445	159	35	1
27446	159	34	1
27447	159	33	1
27448	159	32	1
27449	159	31	1
27450	159	30	1
27451	159	29	1
27452	159	28	1
27453	159	27	1
27454	159	26	1
27455	159	25	1
27456	159	24	1
27457	159	23	1
27458	159	22	1
27459	159	21	1
27460	159	20	1
27461	159	19	1
27462	159	18	1
27463	159	17	1
27464	159	16	1
27465	159	15	1
27466	159	14	1
27467	159	13	1
27468	159	12	1
27469	159	11	1
27470	159	10	1
27471	159	9	1
27472	159	8	1
27473	159	7	1
27474	159	6	1
27475	159	5	1
27476	159	4	1
27477	159	3	1
27478	159	2	1
27479	159	1	1
27480	160	109	2
27481	160	108	2
27482	160	107	2
27483	160	106	2
27484	160	105	2
27485	160	104	2
27486	160	103	2
27487	160	102	2
27488	160	101	2
27489	160	100	2
27490	160	99	2
27491	160	98	2
27492	160	97	2
27493	160	96	2
27494	160	95	2
27495	160	94	2
27496	160	93	2
27497	160	92	2
27498	160	91	2
27499	160	90	2
27500	160	89	2
27501	160	88	2
27502	160	87	2
27503	160	86	2
27504	160	85	2
27505	160	84	2
27506	160	83	2
27507	160	82	1
27508	160	81	1
27509	160	80	1
27510	160	79	1
27511	160	78	1
27512	160	77	1
27513	160	76	1
27514	160	75	1
27515	160	74	1
27516	160	73	1
27517	160	72	1
27518	160	71	1
27519	160	70	1
27520	160	69	1
27521	160	68	1
27522	160	67	1
27523	160	66	1
27524	160	65	1
27525	160	64	1
27526	160	63	1
27527	160	62	1
27528	160	61	1
27529	160	60	1
27530	160	59	1
27531	160	58	1
27532	160	57	1
27533	160	56	1
27534	160	55	1
27535	160	54	1
27536	160	53	1
27537	160	52	1
27538	160	51	1
27539	160	50	1
27540	160	49	1
27541	160	48	1
27542	160	47	1
27543	160	46	1
27544	160	45	1
27545	160	44	1
27546	160	43	1
27547	160	42	1
27548	160	41	1
27549	160	40	1
27550	160	39	1
27551	160	38	1
27552	160	37	1
27553	160	36	1
27554	160	35	1
27555	160	34	1
27556	160	33	1
27557	160	32	1
27558	160	31	1
27559	160	30	1
27560	160	29	1
27561	160	28	1
27562	160	27	1
27563	160	26	1
27564	160	25	1
27565	160	24	1
27566	160	23	1
27567	160	22	1
27568	160	21	1
27569	160	20	1
27570	160	19	1
27571	160	18	1
27572	160	17	1
27573	160	16	1
27574	160	15	1
27575	160	14	1
27576	160	13	1
27577	160	12	1
27578	160	11	1
27579	160	10	1
27580	160	9	1
27581	160	8	1
27582	160	7	1
27583	160	6	1
27584	160	5	1
27585	160	4	1
27586	160	3	1
27587	160	2	1
27588	160	1	1
27589	161	64	2
27590	161	63	2
27591	161	62	2
27592	161	61	2
27593	161	60	2
27594	161	59	2
27595	161	58	2
27596	161	57	2
27597	161	56	2
27598	161	55	2
27599	161	54	2
27600	161	53	2
27601	161	52	2
27602	161	51	2
27603	161	50	2
27604	161	49	2
27605	161	48	2
27606	161	47	2
27607	161	46	1
27608	161	45	1
27609	161	44	1
27610	161	43	1
27611	161	42	1
27612	161	41	1
27613	161	40	1
27614	161	39	1
27615	161	38	1
27616	161	37	1
27617	161	36	1
27618	161	35	1
27619	161	34	1
27620	161	33	1
27621	161	32	1
27622	161	31	1
27623	161	30	1
27624	161	29	1
27625	161	28	1
27626	161	27	1
27627	161	26	1
27628	161	25	1
27629	161	24	1
27630	161	23	1
27631	161	22	1
27632	161	21	1
27633	161	20	1
27634	161	19	1
27635	161	18	1
27636	161	17	1
27637	161	16	1
27638	161	15	1
27639	161	14	1
27640	161	13	1
27641	161	12	1
27642	161	11	1
27643	161	10	1
27644	161	9	1
27645	161	8	1
27646	161	7	1
27647	161	6	1
27648	161	5	1
27649	161	4	1
27650	161	3	1
27651	161	2	1
27652	161	1	1
27653	162	199	3
27654	162	198	3
27655	162	197	3
27656	162	196	3
27657	162	195	3
27658	162	194	3
27659	162	193	3
27660	162	192	3
27661	162	191	3
27662	162	190	3
27663	162	189	3
27664	162	188	3
27665	162	187	3
27666	162	186	3
27667	162	185	3
27668	162	184	3
27669	162	183	3
27670	162	182	3
27671	162	181	3
27672	162	180	3
27673	162	179	3
27674	162	178	3
27675	162	177	3
27676	162	176	3
27677	162	175	3
27678	162	174	3
27679	162	173	3
27680	162	172	3
27681	162	171	3
27682	162	170	3
27683	162	169	3
27684	162	168	3
27685	162	167	3
27686	162	166	3
27687	162	165	3
27688	162	164	3
27689	162	163	3
27690	162	162	3
27691	162	161	3
27692	162	160	3
27693	162	159	3
27694	162	158	3
27695	162	157	3
27696	162	156	3
27697	162	155	3
27698	162	154	3
27699	162	153	3
27700	162	152	3
27701	162	151	3
27702	162	150	3
27703	162	149	3
27704	162	148	3
27705	162	147	3
27706	162	146	3
27707	162	145	3
27708	162	144	3
27709	162	143	3
27710	162	142	3
27711	162	141	3
27712	162	140	3
27713	162	139	3
27714	162	138	3
27715	162	137	3
27716	162	136	3
27717	162	135	3
27718	162	134	3
27719	162	133	3
27720	162	132	3
27721	162	131	3
27722	162	130	3
27723	162	129	3
27724	162	128	3
27725	162	127	3
27726	162	126	3
27727	162	125	3
27728	162	124	3
27729	162	123	3
27730	162	122	3
27731	162	121	3
27732	162	120	3
27733	162	119	3
27734	162	118	2
27735	162	117	2
27736	162	116	2
27737	162	115	2
27738	162	114	2
27739	162	113	2
27740	162	112	2
27741	162	111	2
27742	162	110	2
27743	162	109	2
27744	162	108	2
27745	162	107	2
27746	162	106	2
27747	162	105	2
27748	162	104	2
27749	162	103	2
27750	162	102	2
27751	162	101	2
27752	162	100	2
27753	162	99	2
27754	162	98	2
27755	162	97	2
27756	162	96	2
27757	162	95	2
27758	162	94	2
27759	162	93	2
27760	162	92	2
27761	162	91	2
27762	162	90	2
27763	162	89	2
27764	162	88	2
27765	162	87	2
27766	162	86	2
27767	162	85	2
27768	162	84	2
27769	162	83	2
27770	162	82	2
27771	162	81	2
27772	162	80	2
27773	162	79	2
27774	162	78	2
27775	162	77	2
27776	162	76	2
27777	162	75	2
27778	162	74	2
27779	162	73	2
27780	162	72	2
27781	162	71	2
27782	162	70	2
27783	162	69	2
27784	162	68	2
27785	162	67	2
27786	162	66	2
27787	162	65	2
27788	162	64	2
27789	162	63	2
27790	162	62	2
27791	162	61	1
27792	162	60	1
27793	162	59	1
27794	162	58	1
27795	162	57	1
27796	162	56	1
27797	162	55	1
27798	162	54	1
27799	162	53	1
27800	162	52	1
27801	162	51	1
27802	162	50	1
27803	162	49	1
27804	162	48	1
27805	162	47	1
27806	162	46	1
27807	162	45	1
27808	162	44	1
27809	162	43	1
27810	162	42	1
27811	162	41	1
27812	162	40	1
27813	162	39	1
27814	162	38	1
27815	162	37	1
27816	162	36	1
27817	162	35	1
27818	162	34	1
27819	162	33	1
27820	162	32	1
27821	162	31	1
27822	162	30	1
27823	162	29	1
27824	162	28	1
27825	162	27	1
27826	162	26	1
27827	162	25	1
27828	162	24	1
27829	162	23	1
27830	162	22	1
27831	162	21	1
27832	162	20	1
27833	162	19	1
27834	162	18	1
27835	162	17	1
27836	162	16	1
27837	162	15	1
27838	162	14	1
27839	162	13	1
27840	162	12	1
27841	162	11	1
27842	162	10	1
27843	162	9	1
27844	162	8	1
27845	162	7	1
27846	162	6	1
27847	162	5	1
27848	162	4	1
27849	162	3	1
27850	162	2	1
27851	162	1	1
27852	163	83	2
27853	163	82	2
27854	163	81	2
27855	163	80	2
27856	163	79	2
27857	163	78	2
27858	163	77	2
27859	163	76	2
27860	163	75	2
27861	163	74	2
27862	163	73	2
27863	163	72	2
27864	163	71	2
27865	163	70	2
27866	163	69	2
27867	163	68	2
27868	163	67	2
27869	163	66	2
27870	163	65	2
27871	163	64	2
27872	163	63	2
27873	163	62	2
27874	163	61	2
27875	163	60	2
27876	163	59	2
27877	163	58	2
27878	163	57	2
27879	163	56	2
27880	163	55	2
27881	163	54	2
27882	163	53	2
27883	163	52	2
27884	163	51	2
27885	163	50	1
27886	163	49	1
27887	163	48	1
27888	163	47	1
27889	163	46	1
27890	163	45	1
27891	163	44	1
27892	163	43	1
27893	163	42	1
27894	163	41	1
27895	163	40	1
27896	163	39	1
27897	163	38	1
27898	163	37	1
27899	163	36	1
27900	163	35	1
27901	163	34	1
27902	163	33	1
27903	163	32	1
27904	163	31	1
27905	163	30	1
27906	163	29	1
27907	163	28	1
27908	163	27	1
27909	163	26	1
27910	163	25	1
27911	163	24	1
27912	163	23	1
27913	163	22	1
27914	163	21	1
27915	163	20	1
27916	163	19	1
27917	163	18	1
27918	163	17	1
27919	163	16	1
27920	163	15	1
27921	163	14	1
27922	163	13	1
27923	163	12	1
27924	163	11	1
27925	163	10	1
27926	163	9	1
27927	163	8	1
27928	163	7	1
27929	163	6	1
27930	163	5	1
27931	163	4	1
27932	163	3	1
27933	163	2	1
27934	163	1	1
27935	164	143	1
27936	164	142	1
27937	164	141	1
27938	164	140	1
27939	164	139	1
27940	164	138	1
27941	164	137	1
27942	164	136	1
27943	164	135	1
27944	164	134	1
27945	164	133	1
27946	164	132	1
27947	164	48	1
27948	164	47	1
27949	164	46	1
27950	164	45	1
27951	164	44	1
27952	164	43	1
27953	164	42	1
27954	164	41	1
27955	164	40	1
27956	164	39	1
27957	164	38	1
27958	164	37	1
27959	164	36	1
27960	164	35	1
27961	164	34	1
27962	164	33	1
27963	164	32	1
27964	164	31	1
27965	164	30	1
27966	164	29	1
27967	164	28	1
27968	164	27	1
27969	164	26	1
27970	164	25	1
27971	164	24	1
27972	164	23	1
27973	164	22	1
27974	164	21	1
27975	164	20	1
27976	164	19	1
27977	164	18	1
27978	164	17	1
27979	164	16	1
27980	164	15	1
27981	164	14	1
27982	164	13	1
27983	164	12	1
27984	164	11	1
27985	164	10	1
27986	164	9	1
27987	164	8	1
27988	164	7	1
27989	164	6	1
27990	164	5	1
27991	164	4	1
27992	164	3	1
27993	164	2	1
27994	164	1	1
27995	165	133	3
27996	165	132	3
27997	165	131	3
27998	165	130	3
27999	165	129	3
28000	165	128	3
28001	165	127	3
28002	165	126	3
28003	165	125	3
28004	165	124	3
28005	165	123	3
28006	165	122	3
28007	165	121	3
28008	165	120	3
28009	165	119	3
28010	165	118	3
28011	165	117	3
28012	165	116	3
28013	165	115	3
28014	165	114	3
28015	165	113	3
28016	165	112	3
28017	165	111	3
28018	165	110	3
28019	165	109	3
28020	165	108	3
28021	165	107	3
28022	165	106	3
28023	165	105	3
28024	165	104	3
28025	165	103	3
28026	165	102	3
28027	165	101	3
28028	165	100	3
28029	165	99	3
28030	165	98	3
28031	165	97	2
28032	165	96	2
28033	165	95	2
28034	165	94	2
28035	165	93	2
28036	165	92	2
28037	165	91	2
28038	165	90	2
28039	165	89	2
28040	165	88	2
28041	165	87	2
28042	165	86	2
28043	165	85	2
28044	165	84	2
28045	165	83	2
28046	165	82	2
28047	165	81	2
28048	165	80	2
28049	165	79	2
28050	165	78	2
28051	165	77	2
28052	165	76	2
28053	165	75	2
28054	165	74	2
28055	165	73	2
28056	165	72	2
28057	165	71	2
28058	165	70	2
28059	165	69	2
28060	165	68	2
28061	165	67	1
28062	165	66	1
28063	165	65	1
28064	165	64	1
28065	165	63	1
28066	165	62	1
28067	165	61	1
28068	165	60	1
28069	165	59	1
28070	165	58	1
28071	165	57	1
28072	165	56	1
28073	165	55	1
28074	165	54	1
28075	165	53	1
28076	165	52	1
28077	165	51	1
28078	165	49	1
28079	165	48	1
28080	165	47	1
28081	165	46	1
28082	165	45	1
28083	165	44	1
28084	165	43	1
28085	165	42	1
28086	165	41	1
28087	165	40	1
28088	165	39	1
28089	165	38	1
28090	165	37	1
28091	165	36	1
28092	165	35	1
28093	165	34	1
28094	165	33	1
28095	165	32	1
28096	165	31	1
28097	165	30	1
28098	165	29	1
28099	165	28	1
28100	165	27	1
28101	165	26	1
28102	165	25	1
28103	165	24	1
28104	165	23	1
28105	165	22	1
28106	165	21	1
28107	165	20	1
28108	165	19	1
28109	165	18	1
28110	165	17	1
28111	165	16	1
28112	165	15	1
28113	165	14	1
28114	165	13	1
28115	165	12	1
28116	165	11	1
28117	165	10	1
28118	165	9	1
28119	165	8	1
28120	165	7	1
28121	165	6	1
28122	165	5	1
28123	165	4	1
28124	165	3	1
28125	165	2	1
28126	165	1	1
28127	166	225	1
28128	166	224	1
28129	166	223	1
28130	166	222	1
28131	166	221	1
28132	166	220	1
28133	166	219	1
28134	166	218	1
28135	166	217	1
28136	166	216	1
28137	166	215	1
28138	166	214	1
28139	166	213	1
28140	166	212	1
28141	166	211	1
28142	166	210	1
28143	166	209	1
28144	166	208	1
28145	166	207	1
28146	166	206	1
28147	166	205	1
28148	166	204	1
28149	166	203	1
28150	166	202	1
28151	166	201	1
28152	166	200	1
28153	166	199	1
28154	166	198	1
28155	166	197	1
28156	166	196	1
28157	166	195	1
28158	166	194	1
28159	166	193	1
28160	166	192	1
28161	166	191	1
28162	166	190	1
28163	166	189	1
28164	166	188	1
28165	166	187	1
28166	166	186	1
28167	166	185	1
28168	166	184	1
28169	166	183	1
28170	166	182	1
28171	166	181	1
28172	166	180	1
28173	166	179	1
28174	166	178	1
28175	166	177	1
28176	166	176	1
28177	166	175	1
28178	166	174	1
28179	166	173	1
28180	166	172	1
28181	166	171	1
28182	166	170	1
28183	166	169	1
28184	166	168	1
28185	166	167	1
28186	166	166	1
28187	166	165	1
28188	166	164	1
28189	166	163	1
28190	166	162	1
28191	166	161	1
28192	166	160	1
28193	166	159	1
28194	166	158	1
28195	166	157	1
28196	166	156	1
28197	166	155	1
28198	166	154	1
28199	166	153	1
28200	166	152	1
28201	166	151	1
28202	166	150	1
28203	166	149	1
28204	166	148	1
28205	166	147	1
28206	166	146	1
28207	166	145	1
28208	166	144	1
28209	166	143	1
28210	166	142	1
28211	166	141	1
28212	166	140	1
28213	166	139	1
28214	166	138	1
28215	166	137	1
28216	166	136	1
28217	166	135	1
28218	166	134	1
28219	166	133	1
28220	166	132	1
28221	166	131	1
28222	166	130	1
28223	166	129	1
28224	166	128	1
28225	166	127	1
28226	166	126	1
28227	166	125	1
28228	166	124	1
28229	166	123	1
28230	166	122	1
28231	166	121	1
28232	166	120	1
28233	166	119	1
28234	166	118	1
28235	166	117	1
28236	166	116	1
28237	166	115	1
28238	166	114	1
28239	166	113	1
28240	166	112	1
28241	166	111	1
28242	166	110	1
28243	166	109	1
28244	166	108	1
28245	166	107	1
28246	166	106	1
28247	166	105	1
28248	166	104	1
28249	166	103	1
28250	166	102	1
28251	166	101	1
28252	166	100	1
28253	166	99	1
28254	166	98	1
28255	166	97	1
28256	166	96	1
28257	166	95	1
28258	166	94	1
28259	166	93	1
28260	166	92	1
28261	166	91	1
28262	166	90	1
28263	166	89	1
28264	166	88	1
28265	166	87	1
28266	166	86	1
28267	166	85	1
28268	166	84	1
28269	166	83	1
28270	166	82	1
28271	166	81	1
28272	166	80	1
28273	166	79	1
28274	166	78	1
28275	166	77	1
28276	166	76	1
28277	166	75	1
28278	166	74	1
28279	166	73	1
28280	166	72	1
28281	166	71	1
28282	166	70	1
28283	166	69	1
28284	166	68	1
28285	166	67	1
28286	166	66	1
28287	166	65	1
28288	166	64	1
28289	166	63	1
28290	166	62	1
28291	166	61	1
28292	166	60	1
28293	166	59	1
28294	166	58	1
28295	166	57	1
28296	166	56	1
28297	166	55	1
28298	166	54	1
28299	166	53	1
28300	166	52	1
28301	166	51	1
28302	166	50	1
28303	166	49	1
28304	166	48	1
28305	166	47	1
28306	166	46	1
28307	166	45	1
28308	166	44	1
28309	166	43	1
28310	166	42	1
28311	166	41	1
28312	166	40	1
28313	166	39	1
28314	166	38	1
28315	166	37	1
28316	166	36	1
28317	166	35	1
28318	166	34	1
28319	166	33	1
28320	166	32	1
28321	166	31	1
28322	166	30	1
28323	166	29	1
28324	166	28	1
28325	166	27	1
28326	166	26	1
28327	166	25	1
28328	166	24	1
28329	166	23	1
28330	166	22	1
28331	166	21	1
28332	166	20	1
28333	166	19	1
28334	166	18	1
28335	166	17	1
28336	166	16	1
28337	166	15	1
28338	166	14	1
28339	166	13	1
28340	166	12	1
28341	166	11	1
28342	166	10	1
28343	166	9	1
28344	166	8	1
28345	166	7	1
28346	166	6	1
28347	166	5	1
28348	166	4	1
28349	166	3	1
28350	166	2	1
28351	166	1	1
28352	166	0	1
28353	167	140	3
28354	167	139	3
28355	167	138	3
28356	167	137	3
28357	167	136	3
28358	167	135	3
28359	167	134	3
28360	167	133	3
28361	167	132	3
28362	167	131	3
28363	167	130	3
28364	167	129	3
28365	167	128	3
28366	167	127	3
28367	167	126	3
28368	167	125	3
28369	167	124	3
28370	167	123	3
28371	167	122	3
28372	167	121	3
28373	167	120	3
28374	167	119	3
28375	167	118	3
28376	167	117	3
28377	167	116	3
28378	167	115	3
28379	167	114	3
28380	167	113	3
28381	167	112	3
28382	167	111	3
28383	167	110	2
28384	167	109	2
28385	167	108	2
28386	167	107	2
28387	167	106	2
28388	167	105	2
28389	167	104	2
28390	167	103	2
28391	167	102	2
28392	167	101	2
28393	167	100	2
28394	167	99	2
28395	167	98	2
28396	167	97	2
28397	167	96	2
28398	167	95	2
28399	167	94	2
28400	167	93	2
28401	167	92	2
28402	167	91	2
28403	167	90	2
28404	167	89	2
28405	167	88	2
28406	167	87	2
28407	167	86	2
28408	167	85	2
28409	167	84	2
28410	167	83	2
28411	167	82	2
28412	167	81	2
28413	167	80	2
28414	167	79	2
28415	167	78	2
28416	167	77	2
28417	167	76	2
28418	167	75	2
28419	167	74	2
28420	167	73	2
28421	167	72	2
28422	167	71	2
28423	167	70	2
28424	167	69	2
28425	167	68	2
28426	167	67	2
28427	167	66	2
28428	167	65	2
28429	167	64	2
28430	167	63	2
28431	167	62	2
28432	167	61	2
28433	167	60	2
28434	167	59	2
28435	167	58	2
28436	167	57	2
28437	167	56	2
28438	167	55	2
28439	167	54	2
28440	167	53	2
28441	167	52	2
28442	167	51	1
28443	167	50	1
28444	167	49	1
28445	167	48	1
28446	167	47	1
28447	167	46	1
28448	167	45	1
28449	167	44	1
28450	167	43	1
28451	167	42	1
28452	167	41	1
28453	167	40	1
28454	167	39	1
28455	167	38	1
28456	167	37	1
28457	167	36	1
28458	167	35	1
28459	167	34	1
28460	167	33	1
28461	167	32	1
28462	167	31	1
28463	167	30	1
28464	167	29	1
28465	167	28	1
28466	167	27	1
28467	167	26	1
28468	167	25	1
28469	167	24	1
28470	167	23	1
28471	167	22	1
28472	167	21	1
28473	167	20	1
28474	167	19	1
28475	167	18	1
28476	167	17	1
28477	167	16	1
28478	167	15	1
28479	167	14	1
28480	167	13	1
28481	167	12	1
28482	167	11	1
28483	167	10	1
28484	167	9	1
28485	167	8	1
28486	167	7	1
28487	167	6	1
28488	167	5	1
28489	167	4	1
28490	167	3	1
28491	167	2	1
28492	167	1	1
28493	168	95	1
28494	168	94	1
28495	168	93	1
28496	168	92	1
28497	168	91	1
28498	168	90	1
28499	168	89	1
28500	168	88	1
28501	168	87	1
28502	168	86	1
28503	168	85	1
28504	168	84	1
28505	168	83	1
28506	168	82	1
28507	168	81	1
28508	168	80	1
28509	168	79	1
28510	168	78	1
28511	168	77	1
28512	168	76	1
28513	168	75	1
28514	168	74	1
28515	168	73	1
28516	168	72	1
28517	168	71	1
28518	168	70	1
28519	168	69	1
28520	168	68	1
28521	168	67	1
28522	168	66	1
28523	168	65	1
28524	168	64	1
28525	168	63	1
28526	168	62	1
28527	168	61	1
28528	168	60	1
28529	168	59	1
28530	168	58	1
28531	168	57	1
28532	168	56	1
28533	168	55	1
28534	168	54	1
28535	168	53	1
28536	168	52	1
28537	168	51	1
28538	168	50	1
28539	168	49	1
28540	168	48	1
28541	168	47	1
28542	168	46	1
28543	168	45	1
28544	168	44	1
28545	168	43	1
28546	168	42	1
28547	168	41	1
28548	168	40	1
28549	168	39	1
28550	168	38	1
28551	168	37	1
28552	168	36	1
28553	168	35	1
28554	168	34	1
28555	168	33	1
28556	168	32	1
28557	168	31	1
28558	168	30	1
28559	168	29	1
28560	168	28	1
28561	168	27	1
28562	168	26	1
28563	168	25	1
28564	168	24	1
28565	168	23	1
28566	168	22	1
28567	168	21	1
28568	168	20	1
28569	168	19	1
28570	168	18	1
28571	168	17	1
28572	168	16	1
28573	168	15	1
28574	168	14	1
28575	168	13	1
28576	168	12	1
28577	168	11	1
28578	168	10	1
28579	168	9	1
28580	168	8	1
28581	168	7	1
28582	168	6	1
28583	168	5	1
28584	168	4	1
28585	168	3	1
28586	168	2	1
28587	168	1	1
28588	169	17	1
28589	169	16	1
28590	169	15	1
28591	169	14	1
28592	169	13	1
28593	169	12	1
28594	169	11	1
28595	169	10	1
28596	169	9	1
28597	169	8	1
28598	169	7	1
28599	169	6	1
28600	169	5	1
28601	169	4	1
28602	169	3	1
28603	169	2	1
28604	169	1	1
28605	169	0	1
28606	170	118	1
28607	170	117	1
28608	170	116	1
28609	170	115	1
28610	170	114	1
28611	170	113	1
28612	170	112	1
28613	170	111	1
28614	170	110	1
28615	170	109	1
28616	170	108	1
28617	170	107	1
28618	170	106	1
28619	170	105	1
28620	170	104	1
28621	170	103	1
28622	170	102	1
28623	170	101	1
28624	170	100	1
28625	170	99	1
28626	170	98	1
28627	170	97	1
28628	170	96	1
28629	170	95	1
28630	170	94	1
28631	170	93	1
28632	170	92	1
28633	170	91	1
28634	170	90	1
28635	170	89	1
28636	170	88	1
28637	170	87	1
28638	170	86	1
28639	170	85	1
28640	170	84	1
28641	170	83	1
28642	170	82	1
28643	170	81	1
28644	170	80	1
28645	170	79	1
28646	170	78	1
28647	170	77	1
28648	170	76	1
28649	170	75	1
28650	170	74	1
28651	170	73	1
28652	170	72	1
28653	170	71	1
28654	170	70	1
28655	170	69	1
28656	170	68	1
28657	170	67	1
28658	170	66	1
28659	170	65	1
28660	170	64	1
28661	170	63	1
28662	170	62	1
28663	170	61	1
28664	170	60	1
28665	170	59	1
28666	170	58	1
28667	170	57	1
28668	170	56	1
28669	170	55	1
28670	170	54	1
28671	170	53	1
28672	170	52	1
28673	170	51	1
28674	170	50	1
28675	170	49	1
28676	170	48	1
28677	170	47	1
28678	170	46	1
28679	170	45	1
28680	170	44	1
28681	170	43	1
28682	170	42	1
28683	170	41	1
28684	170	40	1
28685	170	39	1
28686	170	38	1
28687	170	37	1
28688	170	36	1
28689	170	35	1
28690	170	34	1
28691	170	33	1
28692	170	32	1
28693	170	31	1
28694	170	30	1
28695	170	29	1
28696	170	28	1
28697	170	27	1
28698	170	26	1
28699	170	25	1
28700	170	24	1
28701	170	23	1
28702	170	22	1
28703	170	21	1
28704	170	20	1
28705	170	19	1
28706	170	18	1
28707	170	17	1
28708	170	16	1
28709	170	15	1
28710	170	14	1
28711	170	13	1
28712	170	12	1
28713	170	11	1
28714	170	10	1
28715	170	9	1
28716	170	8	1
28717	170	7	1
28718	170	6	1
28719	170	5	1
28720	170	4	1
28721	170	3	1
28722	170	2	1
28723	170	1	1
28724	171	85	2
28725	171	84	2
28726	171	83	2
28727	171	82	2
28728	171	81	2
28729	171	80	2
28730	171	79	2
28731	171	78	2
28732	171	77	2
28733	171	76	2
28734	171	75	2
28735	171	74	2
28736	171	73	2
28737	171	72	2
28738	171	71	2
28739	171	70	2
28740	171	69	2
28741	171	68	2
28742	171	67	2
28743	171	66	2
28744	171	65	2
28745	171	64	2
28746	171	63	2
28747	171	62	2
28748	171	61	2
28749	171	60	2
28750	171	59	2
28751	171	58	2
28752	171	57	2
28753	171	56	2
28754	171	55	2
28755	171	54	2
28756	171	53	2
28757	171	52	2
28758	171	51	2
28759	171	50	2
28760	171	49	2
28761	171	48	2
28762	171	47	2
28763	171	46	2
28764	171	45	2
28765	171	44	2
28766	171	43	2
28767	171	42	2
28768	171	41	2
28769	171	40	2
28770	171	39	2
28771	171	38	2
28772	171	37	2
28773	171	36	2
28774	171	35	2
28775	171	34	2
28776	171	33	2
28777	171	32	2
28778	171	31	2
28779	171	30	2
28780	171	29	2
28781	171	28	2
28782	171	27	2
28783	171	26	2
28784	171	25	2
28785	171	24	2
28786	171	23	2
28787	171	22	2
28788	171	21	2
28789	171	20	2
28790	171	19	2
28791	171	18	2
28792	171	17	2
28793	171	16	2
28794	171	15	2
28795	171	14	2
28796	171	13	2
28797	171	12	2
28798	171	11	2
28799	171	10	2
28800	171	9	2
28801	171	8	2
28802	171	7	2
28803	171	6	2
28804	171	5	2
28805	171	4	2
28806	171	3	2
28807	171	2	2
28808	171	1	2
28809	171	51	1
28810	171	50	1
28811	171	49	1
28812	171	48	1
28813	171	47	1
28814	171	46	1
28815	171	45	1
28816	171	44	1
28817	171	43	1
28818	171	42	1
28819	171	41	1
28820	171	40	1
28821	171	39	1
28822	171	38	1
28823	171	37	1
28824	171	36	1
28825	171	35	1
28826	171	34	1
28827	171	33	1
28828	171	32	1
28829	171	31	1
28830	171	30	1
28831	171	29	1
28832	171	28	1
28833	171	27	1
28834	171	26	1
28835	171	25	1
28836	171	24	1
28837	171	23	1
28838	171	22	1
28839	171	21	1
28840	171	20	1
28841	171	19	1
28842	171	18	1
28843	171	17	1
28844	171	16	1
28845	171	15	1
28846	171	14	1
28847	171	13	1
28848	171	12	1
28849	171	11	1
28850	171	10	1
28851	171	9	1
28852	171	8	1
28853	171	7	1
28854	171	6	1
28855	171	5	1
28856	171	4	1
28857	171	3	1
28858	171	2	1
28859	171	1	1
28860	172	167	2
28861	172	166	2
28862	172	165	2
28863	172	164	2
28864	172	163	2
28865	172	162	2
28866	172	161	2
28867	172	160	2
28868	172	159	2
28869	172	158	2
28870	172	157	2
28871	172	156	2
28872	172	155	2
28873	172	154	2
28874	172	153	2
28875	172	152	2
28876	172	151	2
28877	172	150	2
28878	172	149	2
28879	172	148	2
28880	172	147	2
28881	172	146	2
28882	172	145	2
28883	172	144	2
28884	172	143	2
28885	172	142	2
28886	172	141	2
28887	172	140	2
28888	172	139	2
28889	172	138	2
28890	172	137	2
28891	172	136	2
28892	172	135	2
28893	172	134	2
28894	172	133	2
28895	172	132	2
28896	172	131	2
28897	172	130	2
28898	172	129	2
28899	172	128	2
28900	172	127	2
28901	172	126	2
28902	172	125	2
28903	172	124	2
28904	172	123	2
28905	172	122	2
28906	172	121	2
28907	172	120	2
28908	172	119	2
28909	172	118	2
28910	172	117	2
28911	172	116	2
28912	172	115	2
28913	172	114	2
28914	172	113	2
28915	172	112	2
28916	172	111	2
28917	172	110	2
28918	172	109	2
28919	172	108	2
28920	172	107	2
28921	172	106	2
28922	172	105	2
28923	172	104	2
28924	172	103	2
28925	172	102	2
28926	172	101	2
28927	172	100	2
28928	172	99	2
28929	172	98	2
28930	172	97	2
28931	172	96	2
28932	172	95	2
28933	172	94	2
28934	172	93	2
28935	172	92	2
28936	172	91	2
28937	172	90	2
28938	172	89	2
28939	172	88	2
28940	172	87	2
28941	172	86	2
28942	172	85	2
28943	172	84	2
28944	172	83	1
28945	172	82	1
28946	172	81	1
28947	172	80	1
28948	172	79	1
28949	172	78	1
28950	172	77	1
28951	172	76	1
28952	172	75	1
28953	172	74	1
28954	172	73	1
28955	172	72	1
28956	172	71	1
28957	172	70	1
28958	172	69	1
28959	172	68	1
28960	172	67	1
28961	172	66	1
28962	172	65	1
28963	172	64	1
28964	172	63	1
28965	172	62	1
28966	172	61	1
28967	172	60	1
28968	172	59	1
28969	172	58	1
28970	172	57	1
28971	172	56	1
28972	172	55	1
28973	172	54	1
28974	172	53	1
28975	172	52	1
28976	172	51	1
28977	172	50	1
28978	172	49	1
28979	172	48	1
28980	172	47	1
28981	172	46	1
28982	172	45	1
28983	172	44	1
28984	172	43	1
28985	172	42	1
28986	172	41	1
28987	172	40	1
28988	172	39	1
28989	172	38	1
28990	172	37	1
28991	172	36	1
28992	172	35	1
28993	172	34	1
28994	172	33	1
28995	172	32	1
28996	172	31	1
28997	172	30	1
28998	172	29	1
28999	172	28	1
29000	172	27	1
29001	172	26	1
29002	172	25	1
29003	172	24	1
29004	172	23	1
29005	172	22	1
29006	172	21	1
29007	172	20	1
29008	172	19	1
29009	172	18	1
29010	172	17	1
29011	172	16	1
29012	172	15	1
29013	172	14	1
29014	172	13	1
29015	172	12	1
29016	172	11	1
29017	172	10	1
29018	172	9	1
29019	172	8	1
29020	172	7	1
29021	172	6	1
29022	172	5	1
29023	172	4	1
29024	172	3	1
29025	172	2	1
29026	172	1	1
29027	173	169	3
29028	173	168	3
29029	173	167	3
29030	173	166	3
29031	173	165	3
29032	173	164	3
29033	173	163	3
29034	173	162	3
29035	173	161	3
29036	173	160	3
29037	173	159	3
29038	173	158	3
29039	173	157	3
29040	173	156	3
29041	173	155	3
29042	173	154	3
29043	173	153	3
29044	173	152	3
29045	173	151	3
29046	173	150	3
29047	173	149	3
29048	173	148	3
29049	173	147	3
29050	173	146	3
29051	173	145	3
29052	173	144	3
29053	173	143	3
29054	173	142	3
29055	173	141	3
29056	173	140	3
29057	173	139	3
29058	173	138	3
29059	173	137	3
29060	173	136	3
29061	173	135	3
29062	173	134	3
29063	173	133	3
29064	173	132	3
29065	173	131	3
29066	173	130	3
29067	173	129	3
29068	173	128	3
29069	173	127	3
29070	173	126	3
29071	173	125	3
29072	173	124	3
29073	173	123	3
29074	173	122	3
29075	173	121	3
29076	173	120	3
29077	173	119	3
29078	173	118	3
29079	173	117	2
29080	173	116	2
29081	173	115	2
29082	173	114	2
29083	173	113	2
29084	173	112	2
29085	173	111	2
29086	173	110	2
29087	173	109	2
29088	173	108	2
29089	173	107	2
29090	173	106	2
29091	173	105	2
29092	173	104	2
29093	173	103	2
29094	173	102	2
29095	173	101	2
29096	173	100	2
29097	173	99	2
29098	173	98	2
29099	173	97	2
29100	173	96	2
29101	173	95	2
29102	173	94	2
29103	173	93	2
29104	173	92	2
29105	173	91	2
29106	173	90	2
29107	173	89	2
29108	173	88	2
29109	173	87	2
29110	173	86	2
29111	173	85	2
29112	173	84	2
29113	173	83	2
29114	173	82	2
29115	173	81	2
29116	173	80	2
29117	173	79	2
29118	173	78	2
29119	173	77	2
29120	173	76	2
29121	173	75	2
29122	173	74	2
29123	173	73	2
29124	173	72	2
29125	173	71	2
29126	173	70	2
29127	173	69	2
29128	173	68	2
29129	173	67	2
29130	173	66	2
29131	173	65	2
29132	173	64	2
29133	173	63	2
29134	173	62	2
29135	173	61	2
29136	173	60	2
29137	173	59	2
29138	173	58	2
29139	173	57	2
29140	173	56	2
29141	173	55	2
29142	173	54	2
29143	173	53	2
29144	173	52	1
29145	173	51	1
29146	173	50	1
29147	173	49	1
29148	173	48	1
29149	173	47	1
29150	173	46	1
29151	173	45	1
29152	173	44	1
29153	173	43	1
29154	173	42	1
29155	173	41	1
29156	173	40	1
29157	173	39	1
29158	173	38	1
29159	173	37	1
29160	173	36	1
29161	173	35	1
29162	173	34	1
29163	173	33	1
29164	173	32	1
29165	173	31	1
29166	173	30	1
29167	173	29	1
29168	173	28	1
29169	173	27	1
29170	173	26	1
29171	173	25	1
29172	173	24	1
29173	173	23	1
29174	173	22	1
29175	173	21	1
29176	173	20	1
29177	173	19	1
29178	173	18	1
29179	173	17	1
29180	173	16	1
29181	173	15	1
29182	173	14	1
29183	173	13	1
29184	173	12	1
29185	173	11	1
29186	173	10	1
29187	173	9	1
29188	173	8	1
29189	173	7	1
29190	173	6	1
29191	173	5	1
29192	173	4	1
29193	173	3	1
29194	173	2	1
29195	173	1	1
29196	173	0	1
29197	174	16	1
29198	174	15	1
29199	174	14	1
29200	174	13	1
29201	174	12	1
29202	174	11	1
29203	174	10	1
29204	174	9	1
29205	174	8	1
29206	174	7	1
29207	174	6	1
29208	174	5	1
29209	174	4	1
29210	174	3	1
29211	174	2	1
29212	174	1	1
29213	175	74	1
29214	175	73	1
29215	175	72	1
29216	175	71	1
29217	175	70	1
29218	175	69	1
29219	175	68	1
29220	175	67	1
29221	175	66	1
29222	175	65	1
29223	175	64	1
29224	175	63	1
29225	175	62	1
29226	175	61	1
29227	175	60	1
29228	175	59	1
29229	175	58	1
29230	175	57	1
29231	175	56	1
29232	175	55	1
29233	175	54	1
29234	175	53	1
29235	175	52	1
29236	175	51	1
29237	175	50	1
29238	175	49	1
29239	175	48	1
29240	175	47	1
29241	175	46	1
29242	175	45	1
29243	175	44	1
29244	175	43	1
29245	175	42	1
29246	175	41	1
29247	175	40	1
29248	175	39	1
29249	175	38	1
29250	175	37	1
29251	175	36	1
29252	175	35	1
29253	175	34	1
29254	175	33	1
29255	175	32	1
29256	175	31	1
29257	175	30	1
29258	175	29	1
29259	175	28	1
29260	175	27	1
29261	175	26	1
29262	175	25	1
29263	175	24	1
29264	175	23	1
29265	175	22	1
29266	175	21	1
29267	175	20	1
29268	175	19	1
29269	175	18	1
29270	175	17	1
29271	175	16	1
29272	175	15	1
29273	175	14	1
29274	175	13	1
29275	175	12	1
29276	175	11	1
29277	175	10	1
29278	175	9	1
29279	175	8	1
29280	175	7	1
29281	175	6	1
29282	175	5	1
29283	175	4	1
29284	175	3	1
29285	175	2	1
29286	175	1	1
29287	176	86	1
29288	176	85	1
29289	176	84	1
29290	176	83	1
29291	176	82	1
29292	176	81	1
29293	176	80	1
29294	176	79	1
29295	176	78	1
29296	176	77	1
29297	176	76	1
29298	176	75	1
29299	176	74	1
29300	176	73	1
29301	176	72	1
29302	176	71	1
29303	176	70	1
29304	176	69	1
29305	176	68	1
29306	176	67	1
29307	176	66	1
29308	176	65	1
29309	176	64	1
29310	176	63	1
29311	176	62	1
29312	176	61	1
29313	176	60	1
29314	176	59	1
29315	176	58	1
29316	176	57	1
29317	176	56	1
29318	176	55	1
29319	176	54	1
29320	176	53	1
29321	176	52	1
29322	176	51	1
29323	176	50	1
29324	176	49	1
29325	176	48	1
29326	176	47	1
29327	176	46	1
29328	176	45	1
29329	176	44	1
29330	176	43	1
29331	176	42	1
29332	176	41	1
29333	176	40	1
29334	176	39	1
29335	176	38	1
29336	176	37	1
29337	176	36	1
29338	176	35	1
29339	176	34	1
29340	176	33	1
29341	176	32	1
29342	176	31	1
29343	176	30	1
29344	176	29	1
29345	176	28	1
29346	176	27	1
29347	176	26	1
29348	176	25	1
29349	176	24	1
29350	176	23	1
29351	176	22	1
29352	176	21	1
29353	176	20	1
29354	176	19	1
29355	176	18	1
29356	176	17	1
29357	176	16	1
29358	176	15	1
29359	176	14	1
29360	176	13	1
29361	176	12	1
29362	176	11	1
29363	176	10	1
29364	176	9	1
29365	176	8	1
29366	176	7	1
29367	176	6	1
29368	176	5	1
29369	176	1	1
29370	177	96	1
29371	177	95	1
29372	177	94	1
29373	177	93	1
29374	177	92	1
29375	177	91	1
29376	177	90	1
29377	177	89	1
29378	177	88	1
29379	177	87	1
29380	177	86	1
29381	177	85	1
29382	177	84	1
29383	177	83	1
29384	177	82	1
29385	177	81	1
29386	177	80	1
29387	177	79	1
29388	177	78	1
29389	177	77	1
29390	177	76	1
29391	177	75	1
29392	177	74	1
29393	177	73	1
29394	177	72	1
29395	177	71	1
29396	177	70	1
29397	177	69	1
29398	177	68	1
29399	177	67	1
29400	177	66	1
29401	177	65	1
29402	177	64	1
29403	177	63	1
29404	177	62	1
29405	177	61	1
29406	177	60	1
29407	177	59	1
29408	177	58	1
29409	177	57	1
29410	177	56	1
29411	177	55	1
29412	177	54	1
29413	177	53	1
29414	177	52	1
29415	177	51	1
29416	177	50	1
29417	177	49	1
29418	177	48	1
29419	177	47	1
29420	177	46	1
29421	177	45	1
29422	177	44	1
29423	177	43	1
29424	177	42	1
29425	177	41	1
29426	177	40	1
29427	177	39	1
29428	177	38	1
29429	177	37	1
29430	177	36	1
29431	177	35	1
29432	177	34	1
29433	177	33	1
29434	177	32	1
29435	177	31	1
29436	177	30	1
29437	177	29	1
29438	177	28	1
29439	177	27	1
29440	177	26	1
29441	177	25	1
29442	177	24	1
29443	177	23	1
29444	177	22	1
29445	177	21	1
29446	177	20	1
29447	177	19	1
29448	177	18	1
29449	177	17	1
29450	177	16	1
29451	177	15	1
29452	177	14	1
29453	177	13	1
29454	177	12	1
29455	177	11	1
29456	177	10	1
29457	177	9	1
29458	177	8	1
29459	177	7	1
29460	177	6	1
29461	177	5	1
29462	177	4	1
29463	177	3	1
29464	177	2	1
29465	177	1	1
29466	178	33	1
29467	178	32	1
29468	178	31	1
29469	178	30	1
29470	178	29	1
29471	178	28	1
29472	178	27	1
29473	178	26	1
29474	178	25	1
29475	178	24	1
29476	178	23	1
29477	178	22	1
29478	178	21	1
29479	178	20	1
29480	178	19	1
29481	178	18	1
29482	178	17	1
29483	178	16	1
29484	178	15	1
29485	178	14	1
29486	178	13	1
29487	178	12	1
29488	178	11	1
29489	178	10	1
29490	178	9	1
29491	178	8	1
29492	178	7	1
29493	178	6	1
29494	178	5	1
29495	178	4	1
29496	178	3	1
29497	178	2	1
29498	178	1	1
29499	179	72	2
29500	179	71	2
29501	179	70	2
29502	179	69	2
29503	179	68	2
29504	179	67	2
29505	179	66	2
29506	179	65	2
29507	179	64	2
29508	179	63	2
29509	179	62	2
29510	179	61	2
29511	179	60	2
29512	179	59	2
29513	179	58	2
29514	179	57	2
29515	179	56	2
29516	179	55	2
29517	179	54	2
29518	179	53	2
29519	179	52	2
29520	179	51	2
29521	179	50	2
29522	179	49	2
29523	179	48	2
29524	179	47	2
29525	179	46	2
29526	179	45	2
29527	179	44	2
29528	179	43	2
29529	179	42	1
29530	179	41	1
29531	179	40	1
29532	179	39	1
29533	179	38	1
29534	179	37	1
29535	179	36	1
29536	179	35	1
29537	179	34	1
29538	179	33	1
29539	179	32	1
29540	179	31	1
29541	179	30	1
29542	179	29	1
29543	179	28	1
29544	179	27	1
29545	179	26	1
29546	179	25	1
29547	179	24	1
29548	179	23	1
29549	179	22	1
29550	179	21	1
29551	179	20	1
29552	179	19	1
29553	179	18	1
29554	179	17	1
29555	179	16	1
29556	179	15	1
29557	179	14	1
29558	179	13	1
29559	179	12	1
29560	179	11	1
29561	179	10	1
29562	179	9	1
29563	179	8	1
29564	179	7	1
29565	179	6	1
29566	179	5	1
29567	179	4	1
29568	179	3	1
29569	179	2	1
29570	179	1	1
29571	180	550	1
29572	180	549	1
29573	180	548	1
29574	180	547	1
29575	180	546	1
29576	180	545	1
29577	180	544	1
29578	180	543	1
29579	180	542	1
29580	180	541	1
29581	180	540	1
29582	180	539	1
29583	180	538	1
29584	180	537	1
29585	180	536	1
29586	180	535	1
29587	180	534	1
29588	180	533	1
29589	180	532	1
29590	180	531	1
29591	180	530	1
29592	180	529	1
29593	180	528	1
29594	180	527	1
29595	180	526	1
29596	180	525	1
29597	180	524	1
29598	180	523	1
29599	180	522	1
29600	180	521	1
29601	180	520	1
29602	180	519	1
29603	180	518	1
29604	180	517	1
29605	180	516	1
29606	180	515	1
29607	180	514	1
29608	180	513	1
29609	180	512	1
29610	180	511	1
29611	180	510	1
29612	180	509	1
29613	180	508	1
29614	180	507	1
29615	180	506	1
29616	180	505	1
29617	180	504	1
29618	180	503	1
29619	180	502	1
29620	180	501	1
29621	180	500	1
29622	180	499	1
29623	180	498	1
29624	180	497	1
29625	180	496	1
29626	180	495	1
29627	180	494	1
29628	180	493	1
29629	180	492	1
29630	180	491	1
29631	180	490	1
29632	180	489	1
29633	180	488	1
29634	180	487	1
29635	180	486	1
29636	180	485	1
29637	180	484	1
29638	180	483	1
29639	180	482	1
29640	180	481	1
29641	180	480	1
29642	180	479	1
29643	180	478	1
29644	180	477	1
29645	180	476	1
29646	180	475	1
29647	180	474	1
29648	180	473	1
29649	180	472	1
29650	180	471	1
29651	180	470	1
29652	180	469	1
29653	180	468	1
29654	180	467	1
29655	180	466	1
29656	180	465	1
29657	180	464	1
29658	180	463	1
29659	180	462	1
29660	180	461	1
29661	180	460	1
29662	180	459	1
29663	180	458	1
29664	180	457	1
29665	180	456	1
29666	180	455	1
29667	180	454	1
29668	180	453	1
29669	180	452	1
29670	180	451	1
29671	180	450	1
29672	180	449	1
29673	180	448	1
29674	180	447	1
29675	180	446	1
29676	180	445	1
29677	180	444	1
29678	180	443	1
29679	180	442	1
29680	180	441	1
29681	180	440	1
29682	180	439	1
29683	180	438	1
29684	180	437	1
29685	180	436	1
29686	180	435	1
29687	180	434	1
29688	180	433	1
29689	180	432	1
29690	180	431	1
29691	180	430	1
29692	180	429	1
29693	180	428	1
29694	180	427	1
29695	180	426	1
29696	180	425	1
29697	180	424	1
29698	180	423	1
29699	180	422	1
29700	180	421	1
29701	180	420	1
29702	180	419	1
29703	180	418	1
29704	180	417	1
29705	180	416	1
29706	180	415	1
29707	180	414	1
29708	180	413	1
29709	180	412	1
29710	180	411	1
29711	180	410	1
29712	180	409	1
29713	180	408	1
29714	180	407	1
29715	180	406	1
29716	180	405	1
29717	180	404	1
29718	180	403	1
29719	180	402	1
29720	180	401	1
29721	180	400	1
29722	180	399	1
29723	180	398	1
29724	180	397	1
29725	180	396	1
29726	180	395	1
29727	180	394	1
29728	180	393	1
29729	180	392	1
29730	180	391	1
29731	180	390	1
29732	180	389	1
29733	180	388	1
29734	180	387	1
29735	180	386	1
29736	180	385	1
29737	180	384	1
29738	180	383	1
29739	180	382	1
29740	180	381	1
29741	180	380	1
29742	180	379	1
29743	180	378	1
29744	180	377	1
29745	180	376	1
29746	180	375	1
29747	180	374	1
29748	180	373	1
29749	180	372	1
29750	180	371	1
29751	180	370	1
29752	180	369	1
29753	180	368	1
29754	180	367	1
29755	180	366	1
29756	180	365	1
29757	180	364	1
29758	180	363	1
29759	180	362	1
29760	180	361	1
29761	180	360	1
29762	180	359	1
29763	180	358	1
29764	180	357	1
29765	180	356	1
29766	180	355	1
29767	180	354	1
29768	180	353	1
29769	180	352	1
29770	180	351	1
29771	180	350	1
29772	180	349	1
29773	180	348	1
29774	180	347	1
29775	180	346	1
29776	180	345	1
29777	180	344	1
29778	180	343	1
29779	180	342	1
29780	180	341	1
29781	180	340	1
29782	180	339	1
29783	180	338	1
29784	180	337	1
29785	180	336	1
29786	180	335	1
29787	180	334	1
29788	180	333	1
29789	180	332	1
29790	180	331	1
29791	180	330	1
29792	180	329	1
29793	180	328	1
29794	180	327	1
29795	180	326	1
29796	180	325	1
29797	180	324	1
29798	180	323	1
29799	180	322	1
29800	180	321	1
29801	180	320	1
29802	180	319	1
29803	180	318	1
29804	180	317	1
29805	180	316	1
29806	180	315	1
29807	180	314	1
29808	180	313	1
29809	180	312	1
29810	180	311	1
29811	180	310	1
29812	180	309	1
29813	180	308	1
29814	180	307	1
29815	180	306	1
29816	180	305	1
29817	180	304	1
29818	180	303	1
29819	180	302	1
29820	180	301	1
29821	180	300	1
29822	180	299	1
29823	180	298	1
29824	180	297	1
29825	180	296	1
29826	180	295	1
29827	180	294	1
29828	180	293	1
29829	180	292	1
29830	180	291	1
29831	180	290	1
29832	180	289	1
29833	180	288	1
29834	180	287	1
29835	180	286	1
29836	180	285	1
29837	180	284	1
29838	180	283	1
29839	180	282	1
29840	180	281	1
29841	180	280	1
29842	180	279	1
29843	180	278	1
29844	180	277	1
29845	180	276	1
29846	180	275	1
29847	180	274	1
29848	180	273	1
29849	180	272	1
29850	180	271	1
29851	180	270	1
29852	180	269	1
29853	180	268	1
29854	180	267	1
29855	180	266	1
29856	180	265	1
29857	180	264	1
29858	180	263	1
29859	180	262	1
29860	180	261	1
29861	180	260	1
29862	180	259	1
29863	180	258	1
29864	180	257	1
29865	180	256	1
29866	180	255	1
29867	180	254	1
29868	180	253	1
29869	180	252	1
29870	180	251	1
29871	180	250	1
29872	180	249	1
29873	180	248	1
29874	180	247	1
29875	180	246	1
29876	180	245	1
29877	180	244	1
29878	180	243	1
29879	180	242	1
29880	180	241	1
29881	180	240	1
29882	180	239	1
29883	180	238	1
29884	180	237	1
29885	180	236	1
29886	180	235	1
29887	180	234	1
29888	180	233	1
29889	180	232	1
29890	180	231	1
29891	180	230	1
29892	180	229	1
29893	180	228	1
29894	180	227	1
29895	180	226	1
29896	180	225	1
29897	180	224	1
29898	180	223	1
29899	180	222	1
29900	180	221	1
29901	180	220	1
29902	180	219	1
29903	180	218	1
29904	180	217	1
29905	180	216	1
29906	180	215	1
29907	180	214	1
29908	180	213	1
29909	180	212	1
29910	180	211	1
29911	180	210	1
29912	180	209	1
29913	180	208	1
29914	180	207	1
29915	180	206	1
29916	180	205	1
29917	180	204	1
29918	180	203	1
29919	180	202	1
29920	180	201	1
29921	180	200	1
29922	180	199	1
29923	180	198	1
29924	180	197	1
29925	180	196	1
29926	180	195	1
29927	180	194	1
29928	180	193	1
29929	180	192	1
29930	180	191	1
29931	180	190	1
29932	180	189	1
29933	180	188	1
29934	180	187	1
29935	180	186	1
29936	180	185	1
29937	180	184	1
29938	180	183	1
29939	180	182	1
29940	180	181	1
29941	180	180	1
29942	180	179	1
29943	180	178	1
29944	180	177	1
29945	180	176	1
29946	180	175	1
29947	180	174	1
29948	180	173	1
29949	180	172	1
29950	180	171	1
29951	180	170	1
29952	180	169	1
29953	180	168	1
29954	180	167	1
29955	180	166	1
29956	180	165	1
29957	180	164	1
29958	180	163	1
29959	180	162	1
29960	180	161	1
29961	180	160	1
29962	180	159	1
29963	180	158	1
29964	180	157	1
29965	180	156	1
29966	180	155	1
29967	180	154	1
29968	180	153	1
29969	180	152	1
29970	180	151	1
29971	180	150	1
29972	180	149	1
29973	180	148	1
29974	180	147	1
29975	180	146	1
29976	180	145	1
29977	180	144	1
29978	180	143	1
29979	180	142	1
29980	180	141	1
29981	180	140	1
29982	180	139	1
29983	180	138	1
29984	180	137	1
29985	180	136	1
29986	180	135	1
29987	180	134	1
29988	180	133	1
29989	180	132	1
29990	180	131	1
29991	180	130	1
29992	180	129	1
29993	180	128	1
29994	180	127	1
29995	180	126	1
29996	180	125	1
29997	180	124	1
29998	180	123	1
29999	180	122	1
30000	180	121	1
30001	180	120	1
30002	180	119	1
30003	180	118	1
30004	180	117	1
30005	180	116	1
30006	180	115	1
30007	180	114	1
30008	180	113	1
30009	180	112	1
30010	180	111	1
30011	180	110	1
30012	180	109	1
30013	180	108	1
30014	180	107	1
30015	180	106	1
30016	180	105	1
30017	180	104	1
30018	180	103	1
30019	180	102	1
30020	180	101	1
30021	180	100	1
30022	180	99	1
30023	180	98	1
30024	180	97	1
30025	180	96	1
30026	180	95	1
30027	180	94	1
30028	180	93	1
30029	180	92	1
30030	180	91	1
30031	180	90	1
30032	180	89	1
30033	180	88	1
30034	180	87	1
30035	180	86	1
30036	180	85	1
30037	180	84	1
30038	180	83	1
30039	180	82	1
30040	180	81	1
30041	180	80	1
30042	180	79	1
30043	180	78	1
30044	180	77	1
30045	180	76	1
30046	180	75	1
30047	180	74	1
30048	180	73	1
30049	180	72	1
30050	180	71	1
30051	180	70	1
30052	180	69	1
30053	180	68	1
30054	180	67	1
30055	180	66	1
30056	180	65	1
30057	180	64	1
30058	180	63	1
30059	180	62	1
30060	180	61	1
30061	180	60	1
30062	180	59	1
30063	180	58	1
30064	180	57	1
30065	180	56	1
30066	180	55	1
30067	180	54	1
30068	180	53	1
30069	180	52	1
30070	180	51	1
30071	180	50	1
30072	180	49	1
30073	180	48	1
30074	180	47	1
30075	180	46	1
30076	180	45	1
30077	180	44	1
30078	180	43	1
30079	180	42	1
30080	180	41	1
30081	180	40	1
30082	180	39	1
30083	180	38	1
30084	180	37	1
30085	180	36	1
30086	180	35	1
30087	180	34	1
30088	180	33	1
30089	180	32	1
30090	180	31	1
30091	180	30	1
30092	180	29	1
30093	180	28	1
30094	180	27	1
30095	180	26	1
30096	180	25	1
30097	180	24	1
30098	180	23	1
30099	180	22	1
30100	180	21	1
30101	180	20	1
30102	180	19	1
30103	180	18	1
30104	180	17	1
30105	180	16	1
30106	180	15	1
30107	180	14	1
30108	180	13	1
30109	180	12	1
30110	180	11	1
30111	180	10	1
30112	180	9	1
30113	180	8	1
30114	180	7	1
30115	180	6	1
30116	180	5	1
30117	180	4	1
30118	180	3	1
30119	180	2	1
30120	180	1	1
30121	181	239	1
30122	181	238	1
30123	181	237	1
30124	181	236	1
30125	181	235	1
30126	181	234	1
30127	181	233	1
30128	181	232	1
30129	181	231	1
30130	181	230	1
30131	181	229	1
30132	181	228	1
30133	181	227	1
30134	181	226	1
30135	181	225	1
30136	181	224	1
30137	181	223	1
30138	181	222	1
30139	181	221	1
30140	181	220	1
30141	181	219	1
30142	181	218	1
30143	181	217	1
30144	181	216	1
30145	181	215	1
30146	181	214	1
30147	181	213	1
30148	181	212	1
30149	181	211	1
30150	181	210	1
30151	181	209	1
30152	181	208	1
30153	181	207	1
30154	181	206	1
30155	181	205	1
30156	181	204	1
30157	181	203	1
30158	181	202	1
30159	181	201	1
30160	181	200	1
30161	181	199	1
30162	181	198	1
30163	181	197	1
30164	181	196	1
30165	181	195	1
30166	181	194	1
30167	181	193	1
30168	181	192	1
30169	181	191	1
30170	181	190	1
30171	181	189	1
30172	181	188	1
30173	181	187	1
30174	181	186	1
30175	181	185	1
30176	181	184	1
30177	181	183	1
30178	181	182	1
30179	181	181	1
30180	181	180	1
30181	181	179	1
30182	181	178	1
30183	181	177	1
30184	181	176	1
30185	181	175	1
30186	181	174	1
30187	181	173	1
30188	181	172	1
30189	181	171	1
30190	181	170	1
30191	181	169	1
30192	181	168	1
30193	181	167	1
30194	181	166	1
30195	181	165	1
30196	181	164	1
30197	181	163	1
30198	181	162	1
30199	181	161	1
30200	181	160	1
30201	181	159	1
30202	181	158	1
30203	181	157	1
30204	181	156	1
30205	181	155	1
30206	181	154	1
30207	181	153	1
30208	181	152	1
30209	181	151	1
30210	181	150	1
30211	181	149	1
30212	181	148	1
30213	181	147	1
30214	181	146	1
30215	181	145	1
30216	181	144	1
30217	181	143	1
30218	181	142	1
30219	181	141	1
30220	181	140	1
30221	181	139	1
30222	181	138	1
30223	181	137	1
30224	181	136	1
30225	181	135	1
30226	181	134	1
30227	181	133	1
30228	181	132	1
30229	181	131	1
30230	181	130	1
30231	181	129	1
30232	181	128	1
30233	181	127	1
30234	181	126	1
30235	181	125	1
30236	181	124	1
30237	181	123	1
30238	181	122	1
30239	181	121	1
30240	181	120	1
30241	181	119	1
30242	181	118	1
30243	181	117	1
30244	181	116	1
30245	181	115	1
30246	181	114	1
30247	181	113	1
30248	181	112	1
30249	181	111	1
30250	181	110	1
30251	181	109	1
30252	181	108	1
30253	181	107	1
30254	181	106	1
30255	181	105	1
30256	181	104	1
30257	181	103	1
30258	181	102	1
30259	181	101	1
30260	181	100	1
30261	181	99	1
30262	181	98	1
30263	181	97	1
30264	181	96	1
30265	181	95	1
30266	181	94	1
30267	181	93	1
30268	181	92	1
30269	181	91	1
30270	181	90	1
30271	181	89	1
30272	181	88	1
30273	181	87	1
30274	181	86	1
30275	181	85	1
30276	181	84	1
30277	181	83	1
30278	181	82	1
30279	181	81	1
30280	181	80	1
30281	181	79	1
30282	181	78	1
30283	181	77	1
30284	181	76	1
30285	181	75	1
30286	181	74	1
30287	181	73	1
30288	181	72	1
30289	181	71	1
30290	181	70	1
30291	181	69	1
30292	181	68	1
30293	181	67	1
30294	181	66	1
30295	181	65	1
30296	181	64	1
30297	181	63	1
30298	181	62	1
30299	181	61	1
30300	181	60	1
30301	181	59	1
30302	181	58	1
30303	181	57	1
30304	181	56	1
30305	181	55	1
30306	181	54	1
30307	181	53	1
30308	181	52	1
30309	181	51	1
30310	181	50	1
30311	181	49	1
30312	181	48	1
30313	181	47	1
30314	181	46	1
30315	181	45	1
30316	181	44	1
30317	181	43	1
30318	181	42	1
30319	181	41	1
30320	181	40	1
30321	181	39	1
30322	181	38	1
30323	181	37	1
30324	181	36	1
30325	181	35	1
30326	181	34	1
30327	181	33	1
30328	181	32	1
30329	181	31	1
30330	181	30	1
30331	181	29	1
30332	181	28	1
30333	181	27	1
30334	181	26	1
30335	181	25	1
30336	181	24	1
30337	181	23	1
30338	181	22	1
30339	181	21	1
30340	181	20	1
30341	181	19	1
30342	181	18	1
30343	181	17	1
30344	181	16	1
30345	181	15	1
30346	181	14	1
30347	181	13	1
30348	181	12	1
30349	181	11	1
30350	181	10	1
30351	181	9	1
30352	181	8	1
30353	181	7	1
30354	181	6	1
30355	181	5	1
30356	181	4	1
30357	181	3	1
30358	181	2	1
30359	181	1	1
30360	182	467	1
30361	182	466	1
30362	182	465	1
30363	182	464	1
30364	182	463	1
30365	182	462	1
30366	182	461	1
30367	182	460	1
30368	182	459	1
30369	182	458	1
30370	182	457	1
30371	182	456	1
30372	182	455	1
30373	182	454	1
30374	182	453	1
30375	182	452	1
30376	182	451	1
30377	182	450	1
30378	182	449	1
30379	182	448	1
30380	182	447	1
30381	182	446	1
30382	182	445	1
30383	182	444	1
30384	182	443	1
30385	182	442	1
30386	182	441	1
30387	182	440	1
30388	182	439	1
30389	182	438	1
30390	182	437	1
30391	182	436	1
30392	182	435	1
30393	182	434	1
30394	182	433	1
30395	182	432	1
30396	182	431	1
30397	182	430	1
30398	182	429	1
30399	182	428	1
30400	182	427	1
30401	182	426	1
30402	182	425	1
30403	182	424	1
30404	182	423	1
30405	182	422	1
30406	182	421	1
30407	182	420	1
30408	182	419	1
30409	182	418	1
30410	182	417	1
30411	182	416	1
30412	182	415	1
30413	182	414	1
30414	182	413	1
30415	182	412	1
30416	182	411	1
30417	182	410	1
30418	182	409	1
30419	182	408	1
30420	182	407	1
30421	182	406	1
30422	182	405	1
30423	182	404	1
30424	182	403	1
30425	182	402	1
30426	182	401	1
30427	182	400	1
30428	182	399	1
30429	182	398	1
30430	182	397	1
30431	182	396	1
30432	182	395	1
30433	182	394	1
30434	182	393	1
30435	182	392	1
30436	182	391	1
30437	182	390	1
30438	182	389	1
30439	182	388	1
30440	182	387	1
30441	182	386	1
30442	182	385	1
30443	182	384	1
30444	182	383	1
30445	182	382	1
30446	182	381	1
30447	182	380	1
30448	182	379	1
30449	182	378	1
30450	182	377	1
30451	182	376	1
30452	182	375	1
30453	182	374	1
30454	182	373	1
30455	182	372	1
30456	182	371	1
30457	182	370	1
30458	182	369	1
30459	182	368	1
30460	182	367	1
30461	182	366	1
30462	182	365	1
30463	182	364	1
30464	182	363	1
30465	182	362	1
30466	182	361	1
30467	182	360	1
30468	182	359	1
30469	182	358	1
30470	182	357	1
30471	182	356	1
30472	182	355	1
30473	182	354	1
30474	182	353	1
30475	182	352	1
30476	182	351	1
30477	182	350	1
30478	182	349	1
30479	182	348	1
30480	182	347	1
30481	182	346	1
30482	182	345	1
30483	182	344	1
30484	182	343	1
30485	182	342	1
30486	182	341	1
30487	182	340	1
30488	182	339	1
30489	182	338	1
30490	182	337	1
30491	182	336	1
30492	182	335	1
30493	182	334	1
30494	182	333	1
30495	182	332	1
30496	182	331	1
30497	182	330	1
30498	182	329	1
30499	182	328	1
30500	182	327	1
30501	182	326	1
30502	182	325	1
30503	182	324	1
30504	182	323	1
30505	182	322	1
30506	182	321	1
30507	182	320	1
30508	182	319	1
30509	182	318	1
30510	182	317	1
30511	182	316	1
30512	182	315	1
30513	182	314	1
30514	182	313	1
30515	182	312	1
30516	182	311	1
30517	182	310	1
30518	182	309	1
30519	182	308	1
30520	182	307	1
30521	182	306	1
30522	182	305	1
30523	182	304	1
30524	182	303	1
30525	182	302	1
30526	182	301	1
30527	182	300	1
30528	182	299	1
30529	182	298	1
30530	182	297	1
30531	182	296	1
30532	182	295	1
30533	182	294	1
30534	182	293	1
30535	182	292	1
30536	182	291	1
30537	182	290	1
30538	182	289	1
30539	182	288	1
30540	182	287	1
30541	182	286	1
30542	182	285	1
30543	182	284	1
30544	182	283	1
30545	182	282	1
30546	182	281	1
30547	182	280	1
30548	182	279	1
30549	182	278	1
30550	182	277	1
30551	182	276	1
30552	182	275	1
30553	182	274	1
30554	182	273	1
30555	182	272	1
30556	182	271	1
30557	182	270	1
30558	182	269	1
30559	182	268	1
30560	182	267	1
30561	182	266	1
30562	182	265	1
30563	182	264	1
30564	182	263	1
30565	182	262	1
30566	182	261	1
30567	182	260	1
30568	182	259	1
30569	182	258	1
30570	182	257	1
30571	182	256	1
30572	182	255	1
30573	182	254	1
30574	182	253	1
30575	182	252	1
30576	182	251	1
30577	182	250	1
30578	182	249	1
30579	182	248	1
30580	182	247	1
30581	182	246	1
30582	182	245	1
30583	182	244	1
30584	182	243	1
30585	182	242	1
30586	182	241	1
30587	182	240	1
30588	182	239	1
30589	182	238	1
30590	182	237	1
30591	182	236	1
30592	182	235	1
30593	182	234	1
30594	182	233	1
30595	182	232	1
30596	182	231	1
30597	182	230	1
30598	182	229	1
30599	182	228	1
30600	182	227	1
30601	182	226	1
30602	182	225	1
30603	182	224	1
30604	182	223	1
30605	182	222	1
30606	182	221	1
30607	182	220	1
30608	182	219	1
30609	182	218	1
30610	182	217	1
30611	182	216	1
30612	182	215	1
30613	182	214	1
30614	182	213	1
30615	182	212	1
30616	182	211	1
30617	182	210	1
30618	182	209	1
30619	182	208	1
30620	182	207	1
30621	182	206	1
30622	182	205	1
30623	182	204	1
30624	182	203	1
30625	182	202	1
30626	182	201	1
30627	182	200	1
30628	182	199	1
30629	182	198	1
30630	182	197	1
30631	182	196	1
30632	182	195	1
30633	182	194	1
30634	182	193	1
30635	182	192	1
30636	182	191	1
30637	182	190	1
30638	182	189	1
30639	182	188	1
30640	182	187	1
30641	182	186	1
30642	182	185	1
30643	182	184	1
30644	182	183	1
30645	182	182	1
30646	182	181	1
30647	182	180	1
30648	182	179	1
30649	182	178	1
30650	182	177	1
30651	182	176	1
30652	182	175	1
30653	182	174	1
30654	182	173	1
30655	182	172	1
30656	182	171	1
30657	182	170	1
30658	182	169	1
30659	182	168	1
30660	182	167	1
30661	182	166	1
30662	182	165	1
30663	182	164	1
30664	182	163	1
30665	182	162	1
30666	182	161	1
30667	182	160	1
30668	182	159	1
30669	182	158	1
30670	182	157	1
30671	182	156	1
30672	182	155	1
30673	182	154	1
30674	182	153	1
30675	182	152	1
30676	182	151	1
30677	182	150	1
30678	182	149	1
30679	182	148	1
30680	182	147	1
30681	182	146	1
30682	182	145	1
30683	182	144	1
30684	182	143	1
30685	182	142	1
30686	182	141	1
30687	182	140	1
30688	182	139	1
30689	182	138	1
30690	182	137	1
30691	182	136	1
30692	182	135	1
30693	182	134	1
30694	182	133	1
30695	182	132	1
30696	182	131	1
30697	182	130	1
30698	182	129	1
30699	182	128	1
30700	182	127	1
30701	182	126	1
30702	182	125	1
30703	182	124	1
30704	182	123	1
30705	182	122	1
30706	182	121	1
30707	182	120	1
30708	182	119	1
30709	182	118	1
30710	182	117	1
30711	182	116	1
30712	182	115	1
30713	182	114	1
30714	182	113	1
30715	182	112	1
30716	182	111	1
30717	182	110	1
30718	182	109	1
30719	182	108	1
30720	182	107	1
30721	182	106	1
30722	182	105	1
30723	182	104	1
30724	182	103	1
30725	182	102	1
30726	182	101	1
30727	182	100	1
30728	182	99	1
30729	182	98	1
30730	182	97	1
30731	182	96	1
30732	182	95	1
30733	182	94	1
30734	182	93	1
30735	182	92	1
30736	182	91	1
30737	182	90	1
30738	182	89	1
30739	182	88	1
30740	182	87	1
30741	182	86	1
30742	182	85	1
30743	182	84	1
30744	182	83	1
30745	182	82	1
30746	182	81	1
30747	182	80	1
30748	182	79	1
30749	182	78	1
30750	182	77	1
30751	182	76	1
30752	182	75	1
30753	182	74	1
30754	182	73	1
30755	182	72	1
30756	182	71	1
30757	182	70	1
30758	182	69	1
30759	182	68	1
30760	182	67	1
30761	182	66	1
30762	182	65	1
30763	182	64	1
30764	182	63	1
30765	182	62	1
30766	182	61	1
30767	182	60	1
30768	182	59	1
30769	182	58	1
30770	182	57	1
30771	182	56	1
30772	182	55	1
30773	182	54	1
30774	182	53	1
30775	182	52	1
30776	182	51	1
30777	182	50	1
30778	182	49	1
30779	182	48	1
30780	182	47	1
30781	182	46	1
30782	182	45	1
30783	182	44	1
30784	182	43	1
30785	182	42	1
30786	182	41	1
30787	182	40	1
30788	182	39	1
30789	182	38	1
30790	182	37	1
30791	182	36	1
30792	182	35	1
30793	182	34	1
30794	182	33	1
30795	182	32	1
30796	182	31	1
30797	182	30	1
30798	182	29	1
30799	182	28	1
30800	182	27	1
30801	182	26	1
30802	182	25	1
30803	182	24	1
30804	182	23	1
30805	182	22	1
30806	182	21	1
30807	182	20	1
30808	182	19	1
30809	182	18	1
30810	182	17	1
30811	182	16	1
30812	182	15	1
30813	182	14	1
30814	182	13	1
30815	182	12	1
30816	182	11	1
30817	182	10	1
30818	182	9	1
30819	182	8	1
30820	182	7	1
30821	182	6	1
30822	182	5	1
30823	182	4	1
30824	182	3	1
30825	182	2	1
30826	182	1	1
30827	183	60	1
30828	183	59	1
30829	183	58	1
30830	183	57	1
30831	183	56	1
30832	183	55	1
30833	183	54	1
30834	183	53	1
30835	183	52	1
30836	183	51	1
30837	183	50	1
30838	183	49	1
30839	183	48	1
30840	183	47	1
30841	183	46	1
30842	183	45	1
30843	183	44	1
30844	183	43	1
30845	183	42	1
30846	183	41	1
30847	183	40	1
30848	183	39	1
30849	183	38	1
30850	183	37	1
30851	183	36	1
30852	183	35	1
30853	183	34	1
30854	183	33	1
30855	183	32	1
30856	183	31	1
30857	183	30	1
30858	183	29	1
30859	183	28	1
30860	183	27	1
30861	183	26	1
30862	183	25	1
30863	183	24	1
30864	183	23	1
30865	183	22	1
30866	183	21	1
30867	183	20	1
30868	183	19	1
30869	183	18	1
30870	183	17	1
30871	183	16	1
30872	183	15	1
30873	183	14	1
30874	183	13	1
30875	183	12	1
30876	183	11	1
30877	183	10	1
30878	183	9	1
30879	183	8	1
30880	183	7	1
30881	183	6	1
30882	183	5	1
30883	183	4	1
30884	183	3	1
30885	183	2	1
30886	183	1	1
30887	184	57	1
30888	184	56	1
30889	184	55	1
30890	184	54	1
30891	184	53	1
30892	184	52	1
30893	184	51	1
30894	184	50	1
30895	184	49	1
30896	184	48	1
30897	184	47	1
30898	184	46	1
30899	184	45	1
30900	184	44	1
30901	184	43	1
30902	184	42	1
30903	184	41	1
30904	184	40	1
30905	184	39	1
30906	184	38	1
30907	184	37	1
30908	184	36	1
30909	184	35	1
30910	184	34	1
30911	184	33	1
30912	184	32	1
30913	184	31	1
30914	184	30	1
30915	184	29	1
30916	184	28	1
30917	184	27	1
30918	184	26	1
30919	184	25	1
30920	184	24	1
30921	184	23	1
30922	184	22	1
30923	184	21	1
30924	184	20	1
30925	184	19	1
30926	184	18	1
30927	184	17	1
30928	184	16	1
30929	184	15	1
30930	184	14	1
30931	184	13	1
30932	184	12	1
30933	184	11	1
30934	184	10	1
30935	184	9	1
30936	184	8	1
30937	184	7	1
30938	184	6	1
30939	184	5	1
30940	184	4	1
30941	184	3	1
30942	184	2	1
30943	184	1	1
30944	185	185	3
30945	185	184	3
30946	185	183	3
30947	185	182	3
30948	185	181	3
30949	185	180	3
30950	185	179	3
30951	185	178	3
30952	185	177	3
30953	185	176	3
30954	185	175	3
30955	185	174	3
30956	185	173	3
30957	185	172	3
30958	185	171	3
30959	185	170	3
30960	185	169	3
30961	185	168	3
30962	185	167	3
30963	185	166	3
30964	185	165	3
30965	185	164	3
30966	185	163	3
30967	185	162	3
30968	185	161	3
30969	185	160	3
30970	185	159	3
30971	185	158	3
30972	185	157	3
30973	185	156	3
30974	185	155	3
30975	185	154	3
30976	185	153	3
30977	185	152	3
30978	185	151	3
30979	185	150	3
30980	185	149	3
30981	185	148	3
30982	185	147	3
30983	185	146	3
30984	185	145	3
30985	185	144	3
30986	185	143	3
30987	185	142	3
30988	185	141	3
30989	185	140	3
30990	185	139	3
30991	185	138	3
30992	185	137	3
30993	185	136	3
30994	185	135	3
30995	185	134	3
30996	185	133	3
30997	185	132	3
30998	185	131	3
30999	185	130	3
31000	185	129	3
31001	185	128	2
31002	185	127	2
31003	185	126	2
31004	185	125	2
31005	185	124	2
31006	185	123	2
31007	185	122	2
31008	185	121	2
31009	185	120	2
31010	185	119	2
31011	185	118	2
31012	185	117	2
31013	185	116	2
31014	185	115	2
31015	185	114	2
31016	185	113	2
31017	185	112	2
31018	185	111	2
31019	185	110	2
31020	185	109	2
31021	185	108	2
31022	185	107	2
31023	185	106	2
31024	185	105	2
31025	185	104	2
31026	185	103	2
31027	185	102	2
31028	185	101	2
31029	185	100	2
31030	185	99	2
31031	185	98	2
31032	185	97	2
31033	185	96	2
31034	185	95	2
31035	185	94	2
31036	185	93	2
31037	185	92	2
31038	185	91	2
31039	185	90	2
31040	185	89	2
31041	185	88	2
31042	185	87	2
31043	185	86	2
31044	185	85	2
31045	185	84	2
31046	185	83	2
31047	185	82	1
31048	185	81	1
31049	185	80	1
31050	185	79	1
31051	185	78	1
31052	185	77	1
31053	185	76	1
31054	185	75	1
31055	185	74	1
31056	185	73	1
31057	185	72	1
31058	185	71	1
31059	185	70	1
31060	185	69	1
31061	185	68	1
31062	185	67	1
31063	185	66	1
31064	185	65	1
31065	185	64	1
31066	185	63	1
31067	185	62	1
31068	185	61	1
31069	185	60	1
31070	185	59	1
31071	185	58	1
31072	185	57	1
31073	185	56	1
31074	185	55	1
31075	185	54	1
31076	185	53	1
31077	185	52	1
31078	185	51	1
31079	185	50	1
31080	185	49	1
31081	185	48	1
31082	185	47	1
31083	185	46	1
31084	185	45	1
31085	185	44	1
31086	185	43	1
31087	185	42	1
31088	185	41	1
31089	185	40	1
31090	185	39	1
31091	185	38	1
31092	185	37	1
31093	185	36	1
31094	185	35	1
31095	185	34	1
31096	185	33	1
31097	185	32	1
31098	185	31	1
31099	185	30	1
31100	185	29	1
31101	185	28	1
31102	185	27	1
31103	185	26	1
31104	185	25	1
31105	185	24	1
31106	185	23	1
31107	185	22	1
31108	185	21	1
31109	185	20	1
31110	185	19	1
31111	185	18	1
31112	185	17	1
31113	185	16	1
31114	185	15	1
31115	185	14	1
31116	185	13	1
31117	185	12	1
31118	185	11	1
31119	185	10	1
31120	185	9	1
31121	185	8	1
31122	185	7	1
31123	185	6	1
31124	185	5	1
31125	185	4	1
31126	185	3	1
31127	185	2	1
31128	185	1	1
31129	186	55	1
31130	186	54	1
31131	186	53	1
31132	186	52	1
31133	186	51	1
31134	186	50	1
31135	186	49	1
31136	186	48	1
31137	186	47	1
31138	186	46	1
31139	186	45	1
31140	186	44	1
31141	186	43	1
31142	186	42	1
31143	186	41	1
31144	186	40	1
31145	186	39	1
31146	186	38	1
31147	186	37	1
31148	186	36	1
31149	186	35	1
31150	186	34	1
31151	186	33	1
31152	186	32	1
31153	186	31	1
31154	186	30	1
31155	186	29	1
31156	186	28	1
31157	186	27	1
31158	186	26	1
31159	186	25	1
31160	186	24	1
31161	186	23	1
31162	186	22	1
31163	186	21	1
31164	186	20	1
31165	186	19	1
31166	186	18	1
31167	186	17	1
31168	186	16	1
31169	186	15	1
31170	186	14	1
31171	186	13	1
31172	186	12	1
31173	186	11	1
31174	186	10	1
31175	186	9	1
31176	186	8	1
31177	186	7	1
31178	186	6	1
31179	186	5	1
31180	186	4	1
31181	186	3	1
31182	186	2	1
31183	186	1	1
31184	186	0	1
31185	187	26	5
31186	187	17	4
31187	187	16	3
31188	187	13	2
31189	187	12	2
31190	187	9	2
31191	187	8	2
31192	187	7	2
31193	187	4	1
31194	187	3	1
31195	187	2	1
31196	187	1	1
31197	187	0	1
31198	187	0	0
31199	188	74	1
31200	188	73	1
31201	188	72	1
31202	188	71	1
31203	188	70	1
31204	188	69	1
31205	188	68	1
31206	188	67	1
31207	188	66	1
31208	188	65	1
31209	188	64	1
31210	188	63	1
31211	188	62	1
31212	188	61	1
31213	188	60	1
31214	188	59	1
31215	188	58	1
31216	188	57	1
31217	188	56	1
31218	188	55	1
31219	188	54	1
31220	188	53	1
31221	188	52	1
31222	188	51	1
31223	188	50	1
31224	188	49	1
31225	188	48	1
31226	188	47	1
31227	188	46	1
31228	188	45	1
31229	188	44	1
31230	188	43	1
31231	188	42	1
31232	188	41	1
31233	188	40	1
31234	188	39	1
31235	188	38	1
31236	188	37	1
31237	188	36	1
31238	188	35	1
31239	188	34	1
31240	188	33	1
31241	188	32	1
31242	188	31	1
31243	188	30	1
31244	188	29	1
31245	188	28	1
31246	188	27	1
31247	188	26	1
31248	188	25	1
31249	188	24	1
31250	188	23	1
31251	188	22	1
31252	188	21	1
31253	188	20	1
31254	188	19	1
31255	188	18	1
31256	188	17	1
31257	188	16	1
31258	188	15	1
31259	188	14	1
31260	188	13	1
31261	188	12	1
31262	188	11	1
31263	188	10	1
31264	188	9	1
31265	188	8	1
31266	188	7	1
31267	188	6	1
31268	188	5	1
31269	188	4	1
31270	188	3	1
31271	188	2	1
31272	188	1	1
31273	189	107	1
31274	189	106	1
31275	189	105	1
31276	189	104	1
31277	189	103	1
31278	189	102	1
31279	189	101	1
31280	189	100	1
31281	189	99	1
31282	189	98	1
31283	189	97	1
31284	189	96	1
31285	189	95	1
31286	189	94	1
31287	189	93	1
31288	189	92	1
31289	189	91	1
31290	189	90	1
31291	189	89	1
31292	189	88	1
31293	189	87	1
31294	189	86	1
31295	189	85	1
31296	189	84	1
31297	189	83	1
31298	189	82	1
31299	189	81	1
31300	189	80	1
31301	189	79	1
31302	189	78	1
31303	189	77	1
31304	189	76	1
31305	189	75	1
31306	189	74	1
31307	189	73	1
31308	189	72	1
31309	189	71	1
31310	189	70	1
31311	189	69	1
31312	189	68	1
31313	189	67	1
31314	189	66	1
31315	189	65	1
31316	189	64	1
31317	189	63	1
31318	189	62	1
31319	189	61	1
31320	189	60	1
31321	189	59	1
31322	189	58	1
31323	189	57	1
31324	189	56	1
31325	189	55	1
31326	189	54	1
31327	189	53	1
31328	189	52	1
31329	189	51	1
31330	189	50	1
31331	189	49	1
31332	189	48	1
31333	189	47	1
31334	189	46	1
31335	189	45	1
31336	189	44	1
31337	189	43	1
31338	189	42	1
31339	189	41	1
31340	189	40	1
31341	189	39	1
31342	189	38	1
31343	189	37	1
31344	189	36	1
31345	189	35	1
31346	189	34	1
31347	189	33	1
31348	189	32	1
31349	189	31	1
31350	189	30	1
31351	189	29	1
31352	189	28	1
31353	189	27	1
31354	189	26	1
31355	189	25	1
31356	189	24	1
31357	189	23	1
31358	189	22	1
31359	189	21	1
31360	189	20	1
31361	189	19	1
31362	189	18	1
31363	189	17	1
31364	189	16	1
31365	189	15	1
31366	189	14	1
31367	189	13	1
31368	189	12	1
31369	189	11	1
31370	189	10	1
31371	189	9	1
31372	189	8	1
31373	189	7	1
31374	189	6	1
31375	189	5	1
31376	189	4	1
31377	189	3	1
31378	189	2	1
31379	189	1	1
31380	189	0	1
31381	190	156	3
31382	190	155	3
31383	190	154	3
31384	190	153	3
31385	190	152	3
31386	190	151	3
31387	190	150	3
31388	190	149	3
31389	190	148	3
31390	190	147	3
31391	190	146	3
31392	190	145	3
31393	190	144	3
31394	190	143	3
31395	190	142	3
31396	190	141	3
31397	190	140	3
31398	190	139	3
31399	190	138	3
31400	190	137	3
31401	190	136	3
31402	190	135	3
31403	190	134	3
31404	190	133	3
31405	190	132	3
31406	190	131	3
31407	190	130	3
31408	190	129	3
31409	190	128	3
31410	190	127	3
31411	190	126	3
31412	190	125	3
31413	190	124	3
31414	190	123	3
31415	190	122	2
31416	190	121	2
31417	190	120	2
31418	190	119	2
31419	190	118	2
31420	190	117	2
31421	190	116	2
31422	190	115	2
31423	190	114	2
31424	190	113	2
31425	190	112	2
31426	190	111	2
31427	190	110	2
31428	190	109	2
31429	190	108	2
31430	190	107	2
31431	190	106	2
31432	190	105	2
31433	190	104	2
31434	190	103	2
31435	190	102	2
31436	190	101	2
31437	190	100	2
31438	190	99	2
31439	190	98	2
31440	190	97	2
31441	190	96	2
31442	190	95	2
31443	190	94	2
31444	190	93	2
31445	190	92	2
31446	190	91	2
31447	190	90	2
31448	190	89	2
31449	190	88	2
31450	190	87	2
31451	190	86	2
31452	190	85	1
31453	190	84	1
31454	190	83	1
31455	190	82	1
31456	190	81	1
31457	190	80	1
31458	190	79	1
31459	190	78	1
31460	190	77	1
31461	190	76	1
31462	190	75	1
31463	190	74	1
31464	190	73	1
31465	190	72	1
31466	190	71	1
31467	190	70	1
31468	190	69	1
31469	190	68	1
31470	190	67	1
31471	190	66	1
31472	190	65	1
31473	190	64	1
31474	190	63	1
31475	190	62	1
31476	190	61	1
31477	190	60	1
31478	190	59	1
31479	190	58	1
31480	190	57	1
31481	190	56	1
31482	190	55	1
31483	190	54	1
31484	190	53	1
31485	190	52	1
31486	190	51	1
31487	190	50	1
31488	190	49	1
31489	190	48	1
31490	190	47	1
31491	190	46	1
31492	190	45	1
31493	190	44	1
31494	190	43	1
31495	190	42	1
31496	190	41	1
31497	190	40	1
31498	190	39	1
31499	190	38	1
31500	190	37	1
31501	190	36	1
31502	190	35	1
31503	190	34	1
31504	190	33	1
31505	190	32	1
31506	190	31	1
31507	190	30	1
31508	190	29	1
31509	190	28	1
31510	190	27	1
31511	190	26	1
31512	190	25	1
31513	190	24	1
31514	190	23	1
31515	190	22	1
31516	190	21	1
31517	190	20	1
31518	190	19	1
31519	190	18	1
31520	190	17	1
31521	190	16	1
31522	190	15	1
31523	190	14	1
31524	190	13	1
31525	190	12	1
31526	190	11	1
31527	190	10	1
31528	190	9	1
31529	190	8	1
31530	190	7	1
31531	190	6	1
31532	190	5	1
31533	190	4	1
31534	190	3	1
31535	190	2	1
31536	190	1	1
31537	191	138	3
31538	191	137	3
31539	191	136	3
31540	191	135	3
31541	191	134	3
31542	191	133	3
31543	191	132	3
31544	191	131	3
31545	191	130	3
31546	191	129	3
31547	191	128	3
31548	191	127	3
31549	191	126	3
31550	191	125	3
31551	191	124	3
31552	191	123	3
31553	191	122	3
31554	191	121	3
31555	191	120	3
31556	191	119	2
31557	191	118	2
31558	191	117	2
31559	191	116	2
31560	191	115	2
31561	191	114	2
31562	191	113	2
31563	191	112	2
31564	191	111	2
31565	191	110	2
31566	191	109	2
31567	191	108	2
31568	191	107	2
31569	191	106	2
31570	191	105	2
31571	191	104	2
31572	191	103	2
31573	191	102	2
31574	191	101	2
31575	191	100	2
31576	191	99	2
31577	191	98	2
31578	191	97	2
31579	191	96	2
31580	191	95	2
31581	191	94	2
31582	191	93	2
31583	191	92	2
31584	191	91	2
31585	191	90	2
31586	191	89	2
31587	191	88	2
31588	191	87	2
31589	191	86	2
31590	191	85	2
31591	191	84	2
31592	191	83	2
31593	191	82	2
31594	191	81	2
31595	191	80	2
31596	191	79	2
31597	191	78	2
31598	191	77	2
31599	191	76	2
31600	191	75	2
31601	191	74	2
31602	191	73	2
31603	191	72	2
31604	191	71	2
31605	191	70	2
31606	191	69	2
31607	191	68	2
31608	191	67	2
31609	191	66	2
31610	191	65	1
31611	191	64	1
31612	191	63	1
31613	191	62	1
31614	191	61	1
31615	191	60	1
31616	191	59	1
31617	191	58	1
31618	191	57	1
31619	191	56	1
31620	191	55	1
31621	191	54	1
31622	191	53	1
31623	191	52	1
31624	191	51	1
31625	191	50	1
31626	191	49	1
31627	191	48	1
31628	191	47	1
31629	191	46	1
31630	191	45	1
31631	191	44	1
31632	191	43	1
31633	191	42	1
31634	191	41	1
31635	191	40	1
31636	191	39	1
31637	191	38	1
31638	191	37	1
31639	191	36	1
31640	191	35	1
31641	191	34	1
31642	191	33	1
31643	191	32	1
31644	191	31	1
31645	191	30	1
31646	191	29	1
31647	191	28	1
31648	191	27	1
31649	191	26	1
31650	191	25	1
31651	191	24	1
31652	191	23	1
31653	191	22	1
31654	191	21	1
31655	191	20	1
31656	191	19	1
31657	191	18	1
31658	191	17	1
31659	191	16	1
31660	191	15	1
31661	191	14	1
31662	191	13	1
31663	191	12	1
31664	191	11	1
31665	191	10	1
31666	191	9	1
31667	191	8	1
31668	191	7	1
31669	191	6	1
31670	191	5	1
31671	191	4	1
31672	191	3	1
31673	191	2	1
31674	191	1	1
31675	192	42	2
31676	192	41	2
31677	192	40	2
31678	192	39	2
31679	192	38	2
31680	192	37	2
31681	192	36	2
31682	192	35	1
31683	192	34	1
31684	192	33	1
31685	192	32	1
31686	192	31	1
31687	192	30	1
31688	192	29	1
31689	192	28	1
31690	192	27	1
31691	192	26	1
31692	192	25	1
31693	192	24	1
31694	192	23	1
31695	192	22	1
31696	192	21	1
31697	192	20	1
31698	192	19	1
31699	192	18	1
31700	192	17	1
31701	192	16	1
31702	192	15	1
31703	192	14	1
31704	192	13	1
31705	192	12	1
31706	192	11	1
31707	192	10	1
31708	192	9	1
31709	192	8	1
31710	192	7	1
31711	192	6	1
31712	192	5	1
31713	192	4	1
31714	192	3	1
31715	192	2	1
31716	192	1	1
31717	193	150	2
31718	193	149	2
31719	193	148	2
31720	193	147	2
31721	193	146	2
31722	193	145	2
31723	193	144	2
31724	193	143	2
31725	193	142	2
31726	193	141	2
31727	193	140	2
31728	193	139	2
31729	193	138	2
31730	193	137	2
31731	193	136	2
31732	193	135	2
31733	193	134	2
31734	193	133	2
31735	193	132	2
31736	193	131	2
31737	193	130	2
31738	193	129	2
31739	193	128	2
31740	193	127	2
31741	193	126	2
31742	193	125	2
31743	193	124	2
31744	193	123	2
31745	193	122	2
31746	193	121	2
31747	193	120	2
31748	193	119	2
31749	193	118	2
31750	193	117	2
31751	193	116	2
31752	193	115	2
31753	193	114	2
31754	193	113	2
31755	193	112	2
31756	193	111	2
31757	193	110	2
31758	193	109	2
31759	193	108	2
31760	193	107	2
31761	193	106	2
31762	193	105	2
31763	193	104	2
31764	193	103	2
31765	193	102	2
31766	193	101	2
31767	193	100	2
31768	193	99	2
31769	193	98	2
31770	193	97	2
31771	193	96	2
31772	193	95	2
31773	193	94	2
31774	193	93	2
31775	193	92	2
31776	193	91	2
31777	193	90	2
31778	193	89	2
31779	193	88	2
31780	193	87	2
31781	193	86	2
31782	193	85	2
31783	193	84	2
31784	193	83	2
31785	193	82	2
31786	193	81	2
31787	193	80	2
31788	193	79	2
31789	193	78	2
31790	193	77	2
31791	193	76	2
31792	193	75	2
31793	193	74	2
31794	193	73	2
31795	193	72	2
31796	193	71	2
31797	193	70	2
31798	193	69	2
31799	193	68	2
31800	193	67	2
31801	193	66	2
31802	193	65	2
31803	193	64	2
31804	193	63	2
31805	193	62	2
31806	193	61	2
31807	193	60	2
31808	193	59	2
31809	193	58	2
31810	193	57	2
31811	193	56	2
31812	193	55	2
31813	193	54	2
31814	193	53	2
31815	193	52	1
31816	193	51	1
31817	193	50	1
31818	193	49	1
31819	193	48	1
31820	193	47	1
31821	193	46	1
31822	193	45	1
31823	193	44	1
31824	193	43	1
31825	193	42	1
31826	193	41	1
31827	193	40	1
31828	193	39	1
31829	193	38	1
31830	193	37	1
31831	193	36	1
31832	193	35	1
31833	193	34	1
31834	193	33	1
31835	193	32	1
31836	193	31	1
31837	193	30	1
31838	193	29	1
31839	193	28	1
31840	193	27	1
31841	193	26	1
31842	193	25	1
31843	193	24	1
31844	193	23	1
31845	193	22	1
31846	193	21	1
31847	193	20	1
31848	193	19	1
31849	193	18	1
31850	193	17	1
31851	193	16	1
31852	193	15	1
31853	193	14	1
31854	193	13	1
31855	193	12	1
31856	193	11	1
31857	193	10	1
31858	193	9	1
31859	193	8	1
31860	193	7	1
31861	193	6	1
31862	193	5	1
31863	193	4	1
31864	193	3	1
31865	193	2	1
31866	193	1	1
31867	194	30	1
31868	194	29	1
31869	194	28	1
31870	194	27	1
31871	194	26	1
31872	194	25	1
31873	194	24	1
31874	194	23	1
31875	194	22	1
31876	194	21	1
31877	194	20	1
31878	194	19	1
31879	194	18	1
31880	194	17	1
31881	194	16	1
31882	194	15	1
31883	194	14	1
31884	194	13	1
31885	194	12	1
31886	194	11	1
31887	194	10	1
31888	194	9	1
31889	194	8	1
31890	194	7	1
31891	194	6	1
31892	194	5	1
31893	194	4	1
31894	194	3	1
31895	194	2	1
31896	194	1	1
31897	194	0	1
31898	195	273	2
31899	195	272	2
31900	195	271	2
31901	195	270	2
31902	195	269	2
31903	195	268	2
31904	195	267	2
31905	195	266	2
31906	195	265	2
31907	195	264	2
31908	195	263	2
31909	195	262	2
31910	195	261	2
31911	195	260	2
31912	195	259	2
31913	195	258	2
31914	195	257	2
31915	195	256	2
31916	195	255	2
31917	195	254	2
31918	195	253	2
31919	195	252	2
31920	195	251	2
31921	195	250	2
31922	195	249	2
31923	195	248	2
31924	195	247	2
31925	195	246	2
31926	195	245	2
31927	195	244	2
31928	195	243	2
31929	195	242	2
31930	195	241	2
31931	195	240	2
31932	195	239	2
31933	195	238	2
31934	195	237	2
31935	195	236	2
31936	195	235	2
31937	195	234	2
31938	195	233	2
31939	195	232	2
31940	195	231	2
31941	195	230	2
31942	195	229	2
31943	195	228	2
31944	195	227	2
31945	195	226	2
31946	195	225	2
31947	195	224	2
31948	195	223	2
31949	195	222	2
31950	195	221	2
31951	195	220	2
31952	195	219	2
31953	195	218	2
31954	195	217	2
31955	195	216	2
31956	195	215	2
31957	195	214	2
31958	195	213	2
31959	195	212	2
31960	195	211	2
31961	195	210	2
31962	195	209	2
31963	195	208	2
31964	195	207	2
31965	195	206	2
31966	195	205	2
31967	195	204	2
31968	195	203	2
31969	195	202	2
31970	195	201	2
31971	195	200	2
31972	195	199	2
31973	195	198	2
31974	195	197	2
31975	195	196	2
31976	195	195	2
31977	195	194	2
31978	195	193	2
31979	195	192	2
31980	195	191	2
31981	195	190	2
31982	195	189	2
31983	195	188	2
31984	195	187	2
31985	195	186	2
31986	195	185	2
31987	195	184	2
31988	195	183	2
31989	195	182	2
31990	195	181	2
31991	195	180	2
31992	195	179	2
31993	195	178	2
31994	195	177	2
31995	195	176	2
31996	195	175	2
31997	195	174	2
31998	195	173	2
31999	195	172	2
32000	195	171	2
32001	195	170	2
32002	195	169	2
32003	195	168	2
32004	195	167	2
32005	195	166	2
32006	195	165	2
32007	195	164	2
32008	195	163	2
32009	195	162	2
32010	195	161	2
32011	195	160	2
32012	195	159	2
32013	195	158	2
32014	195	157	2
32015	195	156	2
32016	195	155	2
32017	195	154	2
32018	195	153	2
32019	195	152	2
32020	195	151	2
32021	195	150	2
32022	195	149	2
32023	195	148	2
32024	195	147	2
32025	195	146	2
32026	195	145	2
32027	195	144	2
32028	195	143	2
32029	195	142	2
32030	195	141	2
32031	195	140	2
32032	195	139	2
32033	195	138	2
32034	195	137	2
32035	195	136	2
32036	195	135	2
32037	195	134	2
32038	195	133	2
32039	195	132	2
32040	195	131	2
32041	195	130	2
32042	195	129	2
32043	195	128	2
32044	195	127	2
32045	195	126	2
32046	195	125	2
32047	195	124	2
32048	195	123	2
32049	195	122	2
32050	195	121	2
32051	195	120	2
32052	195	119	2
32053	195	118	2
32054	195	117	2
32055	195	116	2
32056	195	115	2
32057	195	114	2
32058	195	113	2
32059	195	112	2
32060	195	111	2
32061	195	110	2
32062	195	109	2
32063	195	108	2
32064	195	107	2
32065	195	106	2
32066	195	105	2
32067	195	104	2
32068	195	103	2
32069	195	102	2
32070	195	101	2
32071	195	100	2
32072	195	99	2
32073	195	98	2
32074	195	97	2
32075	195	96	2
32076	195	95	2
32077	195	94	2
32078	195	93	2
32079	195	92	2
32080	195	91	2
32081	195	90	2
32082	195	89	2
32083	195	88	2
32084	195	87	2
32085	195	86	2
32086	195	85	2
32087	195	84	2
32088	195	83	2
32089	195	82	2
32090	195	81	2
32091	195	80	2
32092	195	79	2
32093	195	78	2
32094	195	77	2
32095	195	76	2
32096	195	75	2
32097	195	74	2
32098	195	73	2
32099	195	72	2
32100	195	71	2
32101	195	70	2
32102	195	69	2
32103	195	68	2
32104	195	67	2
32105	195	66	2
32106	195	65	2
32107	195	64	2
32108	195	63	2
32109	195	62	2
32110	195	61	2
32111	195	60	2
32112	195	59	2
32113	195	58	2
32114	195	57	2
32115	195	56	2
32116	195	55	2
32117	195	54	2
32118	195	53	2
32119	195	52	2
32120	195	51	2
32121	195	50	1
32122	195	49	1
32123	195	48	1
32124	195	47	1
32125	195	46	1
32126	195	45	1
32127	195	44	1
32128	195	43	1
32129	195	42	1
32130	195	41	1
32131	195	40	1
32132	195	39	1
32133	195	38	1
32134	195	37	1
32135	195	36	1
32136	195	35	1
32137	195	34	1
32138	195	33	1
32139	195	32	1
32140	195	31	1
32141	195	30	1
32142	195	29	1
32143	195	28	1
32144	195	27	1
32145	195	26	1
32146	195	25	1
32147	195	24	1
32148	195	23	1
32149	195	22	1
32150	195	21	1
32151	195	20	1
32152	195	19	1
32153	195	18	1
32154	195	17	1
32155	195	16	1
32156	195	15	1
32157	195	14	1
32158	195	13	1
32159	195	12	1
32160	195	11	1
32161	195	10	1
32162	195	9	1
32163	195	8	1
32164	195	7	1
32165	195	6	1
32166	195	5	1
32167	195	4	1
32168	195	3	1
32169	195	2	1
32170	195	1	1
32171	195	0	1
32172	196	88	3
32173	196	87	3
32174	196	86	3
32175	196	85	3
32176	196	84	3
32177	196	83	3
32178	196	82	3
32179	196	81	3
32180	196	80	3
32181	196	79	3
32182	196	78	3
32183	196	77	3
32184	196	76	3
32185	196	75	3
32186	196	74	2
32187	196	73	2
32188	196	72	2
32189	196	71	2
32190	196	70	2
32191	196	69	2
32192	196	68	2
32193	196	67	2
32194	196	66	2
32195	196	65	2
32196	196	64	2
32197	196	63	2
32198	196	62	2
32199	196	61	2
32200	196	60	2
32201	196	59	2
32202	196	58	2
32203	196	57	2
32204	196	56	2
32205	196	55	2
32206	196	54	2
32207	196	53	2
32208	196	52	2
32209	196	51	2
32210	196	50	2
32211	196	49	2
32212	196	48	2
32213	196	47	2
32214	196	46	2
32215	196	45	2
32216	196	44	1
32217	196	43	1
32218	196	42	1
32219	196	41	1
32220	196	40	1
32221	196	39	1
32222	196	38	1
32223	196	37	1
32224	196	36	1
32225	196	35	1
32226	196	34	1
32227	196	33	1
32228	196	32	1
32229	196	31	1
32230	196	30	1
32231	196	29	1
32232	196	28	1
32233	196	27	1
32234	196	26	1
32235	196	25	1
32236	196	24	1
32237	196	23	1
32238	196	22	1
32239	196	21	1
32240	196	20	1
32241	196	19	1
32242	196	18	1
32243	196	17	1
32244	196	16	1
32245	196	15	1
32246	196	14	1
32247	196	13	1
32248	196	12	1
32249	196	11	1
32250	196	10	1
32251	196	9	1
32252	196	8	1
32253	196	7	1
32254	196	6	1
32255	196	5	1
32256	196	4	1
32257	196	3	1
32258	196	2	1
32259	196	1	1
32260	197	70	2
32261	197	69	2
32262	197	68	2
32263	197	67	2
32264	197	66	2
32265	197	65	2
32266	197	64	2
32267	197	63	2
32268	197	62	2
32269	197	61	2
32270	197	60	2
32271	197	59	2
32272	197	58	2
32273	197	57	2
32274	197	56	2
32275	197	55	2
32276	197	54	2
32277	197	53	2
32278	197	52	2
32279	197	51	2
32280	197	50	2
32281	197	49	2
32282	197	48	2
32283	197	47	2
32284	197	46	2
32285	197	45	2
32286	197	44	2
32287	197	43	2
32288	197	42	1
32289	197	41	1
32290	197	40	1
32291	197	39	1
32292	197	38	1
32293	197	37	1
32294	197	36	1
32295	197	35	1
32296	197	34	1
32297	197	33	1
32298	197	32	1
32299	197	31	1
32300	197	30	1
32301	197	29	1
32302	197	28	1
32303	197	27	1
32304	197	26	1
32305	197	25	1
32306	197	24	1
32307	197	23	1
32308	197	22	1
32309	197	21	1
32310	197	20	1
32311	197	19	1
32312	197	18	1
32313	197	17	1
32314	197	16	1
32315	197	15	1
32316	197	14	1
32317	197	13	1
32318	197	12	1
32319	197	11	1
32320	197	10	1
32321	197	9	1
32322	197	8	1
32323	197	7	1
32324	197	6	1
32325	197	5	1
32326	197	4	1
32327	197	3	1
32328	197	2	1
32329	197	1	1
32330	198	108	3
32331	198	107	3
32332	198	106	3
32333	198	105	3
32334	198	104	3
32335	198	103	3
32336	198	102	3
32337	198	101	3
32338	198	100	3
32339	198	99	3
32340	198	98	3
32341	198	97	3
32342	198	96	3
32343	198	95	3
32344	198	94	3
32345	198	93	3
32346	198	92	3
32347	198	91	3
32348	198	90	3
32349	198	89	3
32350	198	88	3
32351	198	87	3
32352	198	86	3
32353	198	85	3
32354	198	84	3
32355	198	83	3
32356	198	82	3
32357	198	81	3
32358	198	80	3
32359	198	79	3
32360	198	78	3
32361	198	77	3
32362	198	76	3
32363	198	75	3
32364	198	74	3
32365	198	73	2
32366	198	72	2
32367	198	71	2
32368	198	70	2
32369	198	69	2
32370	198	68	2
32371	198	67	2
32372	198	66	2
32373	198	65	2
32374	198	64	2
32375	198	63	2
32376	198	62	2
32377	198	61	2
32378	198	60	2
32379	198	59	2
32380	198	58	2
32381	198	57	2
32382	198	56	2
32383	198	55	2
32384	198	54	2
32385	198	53	2
32386	198	52	2
32387	198	51	2
32388	198	50	2
32389	198	49	2
32390	198	48	2
32391	198	47	2
32392	198	46	1
32393	198	45	1
32394	198	44	1
32395	198	43	1
32396	198	42	1
32397	198	41	1
32398	198	40	1
32399	198	39	1
32400	198	38	1
32401	198	37	1
32402	198	36	1
32403	198	35	1
32404	198	34	1
32405	198	33	1
32406	198	32	1
32407	198	31	1
32408	198	30	1
32409	198	29	1
32410	198	28	1
32411	198	27	1
32412	198	26	1
32413	198	25	1
32414	198	24	1
32415	198	23	1
32416	198	22	1
32417	198	21	1
32418	198	20	1
32419	198	19	1
32420	198	18	1
32421	198	17	1
32422	198	16	1
32423	198	15	1
32424	198	14	1
32425	198	13	1
32426	198	12	1
32427	198	11	1
32428	198	10	1
32429	198	9	1
32430	198	8	1
32431	198	7	1
32432	198	6	1
32433	198	5	1
32434	198	4	1
32435	198	3	1
32436	198	2	1
32437	198	1	1
32438	199	79	1
32439	199	78	1
32440	199	77	1
32441	199	76	1
32442	199	75	1
32443	199	74	1
32444	199	73	1
32445	199	72	1
32446	199	71	1
32447	199	70	1
32448	199	69	1
32449	199	68	1
32450	199	67	1
32451	199	66	1
32452	199	65	1
32453	199	64	1
32454	199	63	1
32455	199	62	1
32456	199	61	1
32457	199	60	1
32458	199	59	1
32459	199	58	1
32460	199	57	1
32461	199	56	1
32462	199	55	1
32463	199	54	1
32464	199	53	1
32465	199	52	1
32466	199	51	1
32467	199	50	1
32468	199	49	1
32469	199	48	1
32470	199	47	1
32471	199	46	1
32472	199	45	1
32473	199	44	1
32474	199	43	1
32475	199	42	1
32476	199	41	1
32477	199	40	1
32478	199	39	1
32479	199	38	1
32480	199	37	1
32481	199	36	1
32482	199	35	1
32483	199	34	1
32484	199	33	1
32485	199	32	1
32486	199	31	1
32487	199	30	1
32488	199	29	1
32489	199	28	1
32490	199	27	1
32491	199	26	1
32492	199	25	1
32493	199	24	1
32494	199	23	1
32495	199	22	1
32496	199	21	1
32497	199	20	1
32498	199	19	1
32499	199	18	1
32500	199	17	1
32501	199	16	1
32502	199	15	1
32503	199	14	1
32504	199	13	1
32505	199	12	1
32506	199	11	1
32507	199	10	1
32508	199	9	1
32509	199	8	1
32510	199	7	1
32511	199	6	1
32512	199	5	1
32513	199	4	1
32514	199	3	1
32515	199	2	1
32516	199	1	1
32517	199	0	1
32518	200	61	2
32519	200	60	2
32520	200	59	2
32521	200	58	2
32522	200	57	2
32523	200	56	2
32524	200	55	2
32525	200	54	2
32526	200	53	2
32527	200	52	2
32528	200	51	2
32529	200	50	2
32530	200	49	2
32531	200	48	2
32532	200	47	2
32533	200	46	2
32534	200	45	2
32535	200	44	2
32536	200	43	2
32537	200	42	2
32538	200	41	2
32539	200	40	2
32540	200	39	2
32541	200	38	2
32542	200	37	2
32543	200	36	2
32544	200	35	2
32545	200	34	2
32546	200	33	1
32547	200	32	1
32548	200	31	1
32549	200	30	1
32550	200	29	1
32551	200	28	1
32552	200	27	1
32553	200	26	1
32554	200	25	1
32555	200	24	1
32556	200	23	1
32557	200	22	1
32558	200	21	1
32559	200	20	1
32560	200	19	1
32561	200	18	1
32562	200	17	1
32563	200	16	1
32564	200	15	1
32565	200	14	1
32566	200	13	1
32567	200	12	1
32568	200	11	1
32569	200	10	1
32570	200	9	1
32571	200	8	1
32572	200	7	1
32573	200	6	1
32574	200	5	1
32575	200	4	1
32576	200	3	1
32577	200	2	1
32578	200	1	1
32579	200	0	1
32580	201	39	1
32581	201	38	1
32582	201	37	1
32583	201	36	1
32584	201	35	1
32585	201	34	1
32586	201	33	1
32587	201	32	1
32588	201	31	1
32589	201	30	1
32590	201	29	1
32591	201	28	1
32592	201	27	1
32593	201	26	1
32594	201	25	1
32595	201	24	1
32596	201	23	1
32597	201	22	1
32598	201	21	1
32599	201	20	1
32600	201	19	1
32601	201	18	1
32602	201	17	1
32603	201	16	1
32604	201	15	1
32605	201	14	1
32606	201	13	1
32607	201	12	1
32608	201	11	1
32609	201	10	1
32610	201	9	1
32611	201	8	1
32612	201	7	1
32613	201	6	1
32614	201	5	1
32615	201	4	1
32616	201	3	1
32617	201	2	1
32618	201	1	1
32619	202	99	2
32620	202	98	2
32621	202	97	2
32622	202	96	2
32623	202	95	2
32624	202	94	2
32625	202	93	2
32626	202	92	2
32627	202	91	2
32628	202	90	2
32629	202	89	2
32630	202	88	2
32631	202	87	2
32632	202	86	2
32633	202	85	2
32634	202	84	2
32635	202	83	2
32636	202	82	2
32637	202	81	2
32638	202	80	2
32639	202	79	2
32640	202	78	2
32641	202	77	2
32642	202	76	2
32643	202	75	2
32644	202	74	2
32645	202	73	2
32646	202	72	2
32647	202	71	2
32648	202	70	2
32649	202	69	2
32650	202	68	2
32651	202	67	2
32652	202	66	2
32653	202	65	2
32654	202	64	2
32655	202	63	2
32656	202	62	2
32657	202	61	2
32658	202	60	2
32659	202	59	2
32660	202	58	2
32661	202	57	2
32662	202	56	2
32663	202	55	2
32664	202	54	2
32665	202	53	2
32666	202	52	2
32667	202	51	2
32668	202	50	1
32669	202	49	1
32670	202	48	1
32671	202	47	1
32672	202	46	1
32673	202	45	1
32674	202	44	1
32675	202	43	1
32676	202	42	1
32677	202	41	1
32678	202	40	1
32679	202	39	1
32680	202	38	1
32681	202	37	1
32682	202	36	1
32683	202	35	1
32684	202	34	1
32685	202	33	1
32686	202	32	1
32687	202	31	1
32688	202	30	1
32689	202	29	1
32690	202	28	1
32691	202	27	1
32692	202	26	1
32693	202	25	1
32694	202	24	1
32695	202	23	1
32696	202	22	1
32697	202	21	1
32698	202	20	1
32699	202	19	1
32700	202	18	1
32701	202	17	1
32702	202	16	1
32703	202	15	1
32704	202	14	1
32705	202	13	1
32706	202	12	1
32707	202	11	1
32708	202	10	1
32709	202	9	1
32710	202	8	1
32711	202	7	1
32712	202	6	1
32713	202	5	1
32714	202	4	1
32715	202	3	1
32716	202	2	1
32717	202	1	1
32718	203	77	2
32719	203	76	2
32720	203	75	2
32721	203	74	2
32722	203	73	2
32723	203	72	2
32724	203	71	2
32725	203	70	2
32726	203	69	2
32727	203	68	2
32728	203	67	2
32729	203	66	2
32730	203	65	2
32731	203	64	2
32732	203	63	2
32733	203	62	2
32734	203	61	2
32735	203	60	2
32736	203	59	2
32737	203	58	2
32738	203	57	2
32739	203	56	2
32740	203	55	2
32741	203	54	2
32742	203	53	2
32743	203	52	2
32744	203	51	2
32745	203	50	2
32746	203	49	2
32747	203	48	2
32748	203	47	2
32749	203	46	2
32750	203	45	2
32751	203	44	2
32752	203	43	2
32753	203	42	2
32754	203	41	2
32755	203	40	1
32756	203	39	1
32757	203	38	1
32758	203	37	1
32759	203	36	1
32760	203	35	1
32761	203	34	1
32762	203	33	1
32763	203	32	1
32764	203	31	1
32765	203	30	1
32766	203	29	1
32767	203	28	1
32768	203	27	1
32769	203	26	1
32770	203	25	1
32771	203	24	1
32772	203	23	1
32773	203	22	1
32774	203	21	1
32775	203	20	1
32776	203	19	1
32777	203	18	1
32778	203	17	1
32779	203	16	1
32780	203	15	1
32781	203	14	1
32782	203	13	1
32783	203	12	1
32784	203	11	1
32785	203	10	1
32786	203	9	1
32787	203	8	1
32788	203	7	1
32789	203	6	1
32790	203	5	1
32791	203	4	1
32792	203	3	1
32793	203	2	1
32794	203	1	1
32795	204	227	1
32796	204	226	1
32797	204	225	1
32798	204	224	1
32799	204	223	1
32800	204	222	1
32801	204	221	1
32802	204	220	1
32803	204	219	1
32804	204	218	1
32805	204	217	1
32806	204	216	1
32807	204	215	1
32808	204	214	1
32809	204	213	1
32810	204	212	1
32811	204	211	1
32812	204	210	1
32813	204	209	1
32814	204	208	1
32815	204	207	1
32816	204	206	1
32817	204	205	1
32818	204	204	1
32819	204	203	1
32820	204	202	1
32821	204	201	1
32822	204	200	1
32823	204	199	1
32824	204	198	1
32825	204	197	1
32826	204	196	1
32827	204	195	1
32828	204	194	1
32829	204	193	1
32830	204	192	1
32831	204	191	1
32832	204	190	1
32833	204	189	1
32834	204	188	1
32835	204	187	1
32836	204	186	1
32837	204	185	1
32838	204	184	1
32839	204	183	1
32840	204	182	1
32841	204	181	1
32842	204	180	1
32843	204	179	1
32844	204	178	1
32845	204	177	1
32846	204	176	1
32847	204	175	1
32848	204	174	1
32849	204	173	1
32850	204	172	1
32851	204	171	1
32852	204	170	1
32853	204	169	1
32854	204	168	1
32855	204	167	1
32856	204	166	1
32857	204	165	1
32858	204	164	1
32859	204	163	1
32860	204	162	1
32861	204	161	1
32862	204	160	1
32863	204	159	1
32864	204	158	1
32865	204	157	1
32866	204	156	1
32867	204	155	1
32868	204	154	1
32869	204	153	1
32870	204	152	1
32871	204	151	1
32872	204	150	1
32873	204	149	1
32874	204	148	1
32875	204	147	1
32876	204	146	1
32877	204	145	1
32878	204	144	1
32879	204	143	1
32880	204	142	1
32881	204	141	1
32882	204	140	1
32883	204	139	1
32884	204	138	1
32885	204	137	1
32886	204	136	1
32887	204	135	1
32888	204	134	1
32889	204	133	1
32890	204	132	1
32891	204	131	1
32892	204	130	1
32893	204	129	1
32894	204	128	1
32895	204	127	1
32896	204	126	1
32897	204	125	1
32898	204	124	1
32899	204	123	1
32900	204	122	1
32901	204	121	1
32902	204	120	1
32903	204	119	1
32904	204	118	1
32905	204	117	1
32906	204	116	1
32907	204	115	1
32908	204	114	1
32909	204	113	1
32910	204	112	1
32911	204	111	1
32912	204	110	1
32913	204	109	1
32914	204	108	1
32915	204	107	1
32916	204	106	1
32917	204	105	1
32918	204	104	1
32919	204	103	1
32920	204	102	1
32921	204	101	1
32922	204	100	1
32923	204	99	1
32924	204	98	1
32925	204	97	1
32926	204	96	1
32927	204	95	1
32928	204	94	1
32929	204	93	1
32930	204	92	1
32931	204	91	1
32932	204	90	1
32933	204	89	1
32934	204	88	1
32935	204	87	1
32936	204	86	1
32937	204	85	1
32938	204	84	1
32939	204	83	1
32940	204	82	1
32941	204	81	1
32942	204	80	1
32943	204	79	1
32944	204	78	1
32945	204	77	1
32946	204	76	1
32947	204	75	1
32948	204	74	1
32949	204	73	1
32950	204	72	1
32951	204	71	1
32952	204	70	1
32953	204	69	1
32954	204	68	1
32955	204	67	1
32956	204	66	1
32957	204	65	1
32958	204	64	1
32959	204	63	1
32960	204	62	1
32961	204	61	1
32962	204	60	1
32963	204	59	1
32964	204	58	1
32965	204	57	1
32966	204	56	1
32967	204	55	1
32968	204	54	1
32969	204	53	1
32970	204	52	1
32971	204	51	1
32972	204	50	1
32973	204	49	1
32974	204	48	1
32975	204	47	1
32976	204	46	1
32977	204	45	1
32978	204	44	1
32979	204	43	1
32980	204	42	1
32981	204	41	1
32982	204	40	1
32983	204	39	1
32984	204	38	1
32985	204	37	1
32986	204	36	1
32987	204	35	1
32988	204	34	1
32989	204	33	1
32990	204	32	1
32991	204	31	1
32992	204	30	1
32993	204	29	1
32994	204	28	1
32995	204	27	1
32996	204	26	1
32997	204	25	1
32998	204	24	1
32999	204	23	1
33000	204	22	1
33001	204	21	1
33002	204	20	1
33003	204	19	1
33004	204	18	1
33005	204	17	1
33006	204	16	1
33007	204	15	1
33008	204	14	1
33009	204	13	1
33010	204	12	1
33011	204	11	1
33012	204	10	1
33013	204	9	1
33014	204	8	1
33015	204	7	1
33016	204	6	1
33017	204	5	1
33018	204	4	1
33019	204	3	1
33020	204	2	1
33021	204	1	1
33022	204	0	1
33023	205	53	1
33024	205	52	1
33025	205	51	1
33026	205	50	1
33027	205	49	1
33028	205	48	1
33029	205	47	1
33030	205	46	1
33031	205	45	1
33032	205	44	1
33033	205	43	1
33034	205	42	1
33035	205	41	1
33036	205	40	1
33037	205	39	1
33038	205	38	1
33039	205	37	1
33040	205	36	1
33041	205	35	1
33042	205	34	1
33043	205	33	1
33044	205	32	1
33045	205	31	1
33046	205	30	1
33047	205	29	1
33048	205	28	1
33049	205	27	1
33050	205	26	1
33051	205	25	1
33052	205	24	1
33053	205	23	1
33054	205	22	1
33055	205	21	1
33056	205	20	1
33057	205	19	1
33058	205	18	1
33059	205	17	1
33060	205	16	1
33061	205	15	1
33062	205	14	1
33063	205	13	1
33064	205	12	1
33065	205	11	1
33066	205	10	1
33067	205	9	1
33068	205	8	1
33069	205	7	1
33070	205	6	1
33071	205	5	1
33072	205	4	1
33073	205	3	1
33074	205	2	1
33075	205	1	1
33076	206	70	2
33077	206	69	2
33078	206	68	2
33079	206	67	2
33080	206	66	2
33081	206	65	2
33082	206	64	2
33083	206	63	2
33084	206	62	2
33085	206	61	2
33086	206	60	2
33087	206	59	2
33088	206	58	2
33089	206	57	2
33090	206	56	2
33091	206	55	2
33092	206	54	2
33093	206	53	2
33094	206	52	2
33095	206	51	2
33096	206	50	2
33097	206	49	2
33098	206	48	2
33099	206	47	1
33100	206	46	1
33101	206	45	1
33102	206	44	1
33103	206	43	1
33104	206	42	1
33105	206	41	1
33106	206	40	1
33107	206	39	1
33108	206	38	1
33109	206	37	1
33110	206	36	1
33111	206	35	1
33112	206	34	1
33113	206	33	1
33114	206	32	1
33115	206	31	1
33116	206	30	1
33117	206	29	1
33118	206	28	1
33119	206	27	1
33120	206	26	1
33121	206	25	1
33122	206	24	1
33123	206	23	1
33124	206	22	1
33125	206	21	1
33126	206	20	1
33127	206	19	1
33128	206	18	1
33129	206	17	1
33130	206	16	1
33131	206	15	1
33132	206	14	1
33133	206	13	1
33134	206	12	1
33135	206	11	1
33136	206	10	1
33137	206	9	1
33138	206	8	1
33139	206	7	1
33140	206	6	1
33141	206	5	1
33142	206	4	1
33143	206	3	1
33144	206	2	1
33145	206	1	1
33146	207	165	1
33147	207	164	1
33148	207	163	1
33149	207	162	1
33150	207	161	1
33151	207	160	1
33152	207	159	1
33153	207	158	1
33154	207	157	1
33155	207	156	1
33156	207	155	1
33157	207	154	1
33158	207	153	1
33159	207	152	1
33160	207	151	1
33161	207	150	1
33162	207	149	1
33163	207	148	1
33164	207	147	1
33165	207	146	1
33166	207	145	1
33167	207	144	1
33168	207	143	1
33169	207	142	1
33170	207	141	1
33171	207	140	1
33172	207	139	1
33173	207	138	1
33174	207	137	1
33175	207	136	1
33176	207	135	1
33177	207	134	1
33178	207	133	1
33179	207	132	1
33180	207	131	1
33181	207	130	1
33182	207	129	1
33183	207	128	1
33184	207	127	1
33185	207	126	1
33186	207	125	1
33187	207	124	1
33188	207	123	1
33189	207	122	1
33190	207	121	1
33191	207	120	1
33192	207	119	1
33193	207	118	1
33194	207	117	1
33195	207	116	1
33196	207	115	1
33197	207	114	1
33198	207	113	1
33199	207	112	1
33200	207	111	1
33201	207	110	1
33202	207	109	1
33203	207	108	1
33204	207	107	1
33205	207	106	1
33206	207	105	1
33207	207	104	1
33208	207	103	1
33209	207	102	1
33210	207	101	1
33211	207	100	1
33212	207	99	1
33213	207	98	1
33214	207	97	1
33215	207	96	1
33216	207	95	1
33217	207	94	1
33218	207	93	1
33219	207	92	1
33220	207	91	1
33221	207	90	1
33222	207	89	1
33223	207	88	1
33224	207	87	1
33225	207	86	1
33226	207	85	1
33227	207	84	1
33228	207	83	1
33229	207	82	1
33230	207	81	1
33231	207	80	1
33232	207	79	1
33233	207	78	1
33234	207	77	1
33235	207	76	1
33236	207	75	1
33237	207	74	1
33238	207	73	1
33239	207	72	1
33240	207	71	1
33241	207	70	1
33242	207	69	1
33243	207	68	1
33244	207	67	1
33245	207	66	1
33246	207	65	1
33247	207	64	1
33248	207	63	1
33249	207	62	1
33250	207	61	1
33251	207	60	1
33252	207	59	1
33253	207	58	1
33254	207	57	1
33255	207	56	1
33256	207	55	1
33257	207	54	1
33258	207	53	1
33259	207	52	1
33260	207	51	1
33261	207	50	1
33262	207	49	1
33263	207	48	1
33264	207	47	1
33265	207	46	1
33266	207	45	1
33267	207	44	1
33268	207	43	1
33269	207	42	1
33270	207	41	1
33271	207	40	1
33272	207	39	1
33273	207	38	1
33274	207	37	1
33275	207	36	1
33276	207	35	1
33277	207	34	1
33278	207	33	1
33279	207	32	1
33280	207	31	1
33281	207	30	1
33282	207	29	1
33283	207	28	1
33284	207	27	1
33285	207	26	1
33286	207	25	1
33287	207	24	1
33288	207	23	1
33289	207	22	1
33290	207	21	1
33291	207	20	1
33292	207	19	1
33293	207	18	1
33294	207	17	1
33295	207	16	1
33296	207	15	1
33297	207	14	1
33298	207	13	1
33299	207	12	1
33300	207	11	1
33301	207	10	1
33302	207	9	1
33303	207	8	1
33304	207	7	1
33305	207	6	1
33306	207	5	1
33307	207	4	1
33308	207	3	1
33309	207	2	1
33310	207	1	1
33311	207	0	1
33312	208	112	1
33313	208	111	1
33314	208	110	1
33315	208	109	1
33316	208	108	1
33317	208	107	1
33318	208	106	1
33319	208	105	1
33320	208	104	1
33321	208	103	1
33322	208	102	1
33323	208	101	1
33324	208	100	1
33325	208	99	1
33326	208	98	1
33327	208	97	1
33328	208	96	1
33329	208	95	1
33330	208	94	1
33331	208	93	1
33332	208	92	1
33333	208	91	1
33334	208	90	1
33335	208	89	1
33336	208	88	1
33337	208	87	1
33338	208	86	1
33339	208	85	1
33340	208	84	1
33341	208	83	1
33342	208	82	1
33343	208	81	1
33344	208	80	1
33345	208	79	1
33346	208	78	1
33347	208	77	1
33348	208	76	1
33349	208	75	1
33350	208	74	1
33351	208	73	1
33352	208	72	1
33353	208	71	1
33354	208	70	1
33355	208	69	1
33356	208	68	1
33357	208	67	1
33358	208	66	1
33359	208	65	1
33360	208	64	1
33361	208	63	1
33362	208	62	1
33363	208	61	1
33364	208	60	1
33365	208	59	1
33366	208	58	1
33367	208	57	1
33368	208	56	1
33369	208	55	1
33370	208	54	1
33371	208	53	1
33372	208	52	1
33373	208	51	1
33374	208	50	1
33375	208	49	1
33376	208	48	1
33377	208	47	1
33378	208	46	1
33379	208	45	1
33380	208	44	1
33381	208	43	1
33382	208	42	1
33383	208	41	1
33384	208	40	1
33385	208	39	1
33386	208	38	1
33387	208	37	1
33388	208	36	1
33389	208	35	1
33390	208	34	1
33391	208	33	1
33392	208	32	1
33393	208	31	1
33394	208	30	1
33395	208	29	1
33396	208	28	1
33397	208	27	1
33398	208	26	1
33399	208	25	1
33400	208	24	1
33401	208	23	1
33402	208	22	1
33403	208	21	1
33404	208	20	1
33405	208	19	1
33406	208	18	1
33407	208	17	1
33408	208	16	1
33409	208	15	1
33410	208	14	1
33411	208	13	1
33412	208	12	1
33413	208	11	1
33414	208	10	1
33415	208	9	1
33416	208	8	1
33417	208	7	1
33418	208	6	1
33419	208	5	1
33420	208	4	1
33421	208	3	1
33422	208	2	1
33423	208	1	1
33424	208	0	1
33425	209	90	2
33426	209	89	2
33427	209	88	2
33428	209	87	2
33429	209	86	2
33430	209	85	2
33431	209	84	2
33432	209	83	2
33433	209	82	2
33434	209	81	2
33435	209	80	2
33436	209	79	2
33437	209	78	2
33438	209	77	2
33439	209	76	2
33440	209	75	2
33441	209	74	2
33442	209	73	2
33443	209	72	2
33444	209	71	2
33445	209	70	2
33446	209	69	2
33447	209	68	2
33448	209	67	2
33449	209	66	2
33450	209	65	2
33451	209	64	2
33452	209	63	2
33453	209	62	2
33454	209	61	2
33455	209	60	2
33456	209	59	2
33457	209	58	2
33458	209	57	2
33459	209	56	2
33460	209	55	2
33461	209	54	2
33462	209	53	2
33463	209	52	2
33464	209	51	2
33465	209	50	2
33466	209	49	2
33467	209	48	2
33468	209	47	2
33469	209	46	2
33470	209	45	1
33471	209	44	1
33472	209	43	1
33473	209	42	1
33474	209	41	1
33475	209	40	1
33476	209	39	1
33477	209	38	1
33478	209	37	1
33479	209	36	1
33480	209	35	1
33481	209	34	1
33482	209	33	1
33483	209	32	1
33484	209	31	1
33485	209	30	1
33486	209	29	1
33487	209	28	1
33488	209	27	1
33489	209	26	1
33490	209	25	1
33491	209	24	1
33492	209	23	1
33493	209	22	1
33494	209	21	1
33495	209	20	1
33496	209	19	1
33497	209	18	1
33498	209	17	1
33499	209	16	1
33500	209	15	1
33501	209	14	1
33502	209	13	1
33503	209	12	1
33504	209	11	1
33505	209	10	1
33506	209	9	1
33507	209	8	1
33508	209	7	1
33509	209	6	1
33510	209	5	1
33511	209	4	1
33512	209	3	1
33513	209	2	1
33514	209	1	1
33515	210	22	1
33516	210	21	1
33517	210	20	1
33518	210	19	1
33519	210	18	1
33520	210	17	1
33521	210	16	1
33522	210	15	1
33523	210	14	1
33524	210	13	1
33525	210	12	1
33526	210	11	1
33527	210	10	1
33528	210	9	1
33529	210	8	1
33530	210	7	1
33531	210	6	1
33532	210	5	1
33533	210	4	1
33534	210	3	1
33535	210	2	1
33536	210	1	1
33537	211	630	1
33538	211	629	1
33539	211	628	1
33540	211	627	1
33541	211	626	1
33542	211	625	1
33543	211	624	1
33544	211	623	1
33545	211	622	1
33546	211	621	1
33547	211	620	1
33548	211	619	1
33549	211	618	1
33550	211	617	1
33551	211	616	1
33552	211	615	1
33553	211	614	1
33554	211	613	1
33555	211	612	1
33556	211	611	1
33557	211	610	1
33558	211	609	1
33559	211	608	1
33560	211	607	1
33561	211	606	1
33562	211	605	1
33563	211	604	1
33564	211	603	1
33565	211	602	1
33566	211	601	1
33567	211	600	1
33568	211	599	1
33569	211	598	1
33570	211	597	1
33571	211	596	1
33572	211	595	1
33573	211	594	1
33574	211	593	1
33575	211	592	1
33576	211	591	1
33577	211	590	1
33578	211	589	1
33579	211	588	1
33580	211	587	1
33581	211	586	1
33582	211	585	1
33583	211	584	1
33584	211	583	1
33585	211	582	1
33586	211	581	1
33587	211	580	1
33588	211	579	1
33589	211	578	1
33590	211	577	1
33591	211	576	1
33592	211	575	1
33593	211	574	1
33594	211	573	1
33595	211	572	1
33596	211	571	1
33597	211	570	1
33598	211	569	1
33599	211	568	1
33600	211	567	1
33601	211	566	1
33602	211	565	1
33603	211	564	1
33604	211	563	1
33605	211	562	1
33606	211	561	1
33607	211	560	1
33608	211	559	1
33609	211	558	1
33610	211	557	1
33611	211	556	1
33612	211	555	1
33613	211	554	1
33614	211	553	1
33615	211	552	1
33616	211	551	1
33617	211	550	1
33618	211	549	1
33619	211	548	1
33620	211	547	1
33621	211	546	1
33622	211	545	1
33623	211	544	1
33624	211	543	1
33625	211	542	1
33626	211	541	1
33627	211	540	1
33628	211	539	1
33629	211	538	1
33630	211	537	1
33631	211	536	1
33632	211	535	1
33633	211	534	1
33634	211	533	1
33635	211	532	1
33636	211	531	1
33637	211	530	1
33638	211	529	1
33639	211	528	1
33640	211	527	1
33641	211	526	1
33642	211	525	1
33643	211	524	1
33644	211	523	1
33645	211	522	1
33646	211	521	1
33647	211	520	1
33648	211	519	1
33649	211	518	1
33650	211	517	1
33651	211	516	1
33652	211	515	1
33653	211	514	1
33654	211	513	1
33655	211	512	1
33656	211	511	1
33657	211	510	1
33658	211	509	1
33659	211	508	1
33660	211	507	1
33661	211	506	1
33662	211	505	1
33663	211	504	1
33664	211	503	1
33665	211	502	1
33666	211	501	1
33667	211	500	1
33668	211	499	1
33669	211	498	1
33670	211	497	1
33671	211	496	1
33672	211	495	1
33673	211	494	1
33674	211	493	1
33675	211	492	1
33676	211	491	1
33677	211	490	1
33678	211	489	1
33679	211	488	1
33680	211	487	1
33681	211	486	1
33682	211	485	1
33683	211	484	1
33684	211	483	1
33685	211	482	1
33686	211	481	1
33687	211	480	1
33688	211	479	1
33689	211	478	1
33690	211	477	1
33691	211	476	1
33692	211	475	1
33693	211	474	1
33694	211	473	1
33695	211	472	1
33696	211	471	1
33697	211	470	1
33698	211	469	1
33699	211	468	1
33700	211	467	1
33701	211	466	1
33702	211	465	1
33703	211	464	1
33704	211	463	1
33705	211	462	1
33706	211	461	1
33707	211	460	1
33708	211	459	1
33709	211	458	1
33710	211	457	1
33711	211	456	1
33712	211	455	1
33713	211	454	1
33714	211	453	1
33715	211	452	1
33716	211	451	1
33717	211	450	1
33718	211	449	1
33719	211	448	1
33720	211	447	1
33721	211	446	1
33722	211	445	1
33723	211	444	1
33724	211	443	1
33725	211	442	1
33726	211	441	1
33727	211	440	1
33728	211	439	1
33729	211	438	1
33730	211	437	1
33731	211	436	1
33732	211	435	1
33733	211	434	1
33734	211	433	1
33735	211	432	1
33736	211	431	1
33737	211	430	1
33738	211	429	1
33739	211	428	1
33740	211	427	1
33741	211	426	1
33742	211	425	1
33743	211	424	1
33744	211	423	1
33745	211	422	1
33746	211	421	1
33747	211	420	1
33748	211	419	1
33749	211	418	1
33750	211	417	1
33751	211	416	1
33752	211	415	1
33753	211	414	1
33754	211	413	1
33755	211	412	1
33756	211	411	1
33757	211	410	1
33758	211	409	1
33759	211	408	1
33760	211	407	1
33761	211	406	1
33762	211	405	1
33763	211	404	1
33764	211	403	1
33765	211	402	1
33766	211	401	1
33767	211	400	1
33768	211	399	1
33769	211	398	1
33770	211	397	1
33771	211	396	1
33772	211	395	1
33773	211	394	1
33774	211	393	1
33775	211	392	1
33776	211	391	1
33777	211	390	1
33778	211	389	1
33779	211	388	1
33780	211	387	1
33781	211	386	1
33782	211	385	1
33783	211	384	1
33784	211	383	1
33785	211	382	1
33786	211	381	1
33787	211	380	1
33788	211	379	1
33789	211	378	1
33790	211	377	1
33791	211	376	1
33792	211	375	1
33793	211	374	1
33794	211	373	1
33795	211	372	1
33796	211	371	1
33797	211	370	1
33798	211	369	1
33799	211	368	1
33800	211	367	1
33801	211	366	1
33802	211	365	1
33803	211	364	1
33804	211	363	1
33805	211	362	1
33806	211	361	1
33807	211	360	1
33808	211	359	1
33809	211	358	1
33810	211	357	1
33811	211	356	1
33812	211	355	1
33813	211	354	1
33814	211	353	1
33815	211	352	1
33816	211	351	1
33817	211	350	1
33818	211	349	1
33819	211	348	1
33820	211	347	1
33821	211	346	1
33822	211	345	1
33823	211	344	1
33824	211	343	1
33825	211	342	1
33826	211	341	1
33827	211	340	1
33828	211	339	1
33829	211	338	1
33830	211	337	1
33831	211	336	1
33832	211	335	1
33833	211	334	1
33834	211	333	1
33835	211	332	1
33836	211	331	1
33837	211	330	1
33838	211	329	1
33839	211	328	1
33840	211	327	1
33841	211	326	1
33842	211	325	1
33843	211	324	1
33844	211	323	1
33845	211	322	1
33846	211	321	1
33847	211	320	1
33848	211	319	1
33849	211	318	1
33850	211	317	1
33851	211	316	1
33852	211	315	1
33853	211	314	1
33854	211	313	1
33855	211	312	1
33856	211	311	1
33857	211	310	1
33858	211	309	1
33859	211	308	1
33860	211	307	1
33861	211	306	1
33862	211	305	1
33863	211	304	1
33864	211	303	1
33865	211	302	1
33866	211	301	1
33867	211	300	1
33868	211	299	1
33869	211	298	1
33870	211	297	1
33871	211	296	1
33872	211	295	1
33873	211	294	1
33874	211	293	1
33875	211	292	1
33876	211	291	1
33877	211	290	1
33878	211	289	1
33879	211	288	1
33880	211	287	1
33881	211	286	1
33882	211	285	1
33883	211	284	1
33884	211	283	1
33885	211	282	1
33886	211	281	1
33887	211	280	1
33888	211	279	1
33889	211	278	1
33890	211	277	1
33891	211	276	1
33892	211	275	1
33893	211	274	1
33894	211	273	1
33895	211	272	1
33896	211	271	1
33897	211	270	1
33898	211	269	1
33899	211	268	1
33900	211	267	1
33901	211	266	1
33902	211	265	1
33903	211	264	1
33904	211	263	1
33905	211	262	1
33906	211	261	1
33907	211	260	1
33908	211	259	1
33909	211	258	1
33910	211	257	1
33911	211	256	1
33912	211	255	1
33913	211	254	1
33914	211	253	1
33915	211	252	1
33916	211	251	1
33917	211	250	1
33918	211	249	1
33919	211	248	1
33920	211	247	1
33921	211	246	1
33922	211	245	1
33923	211	244	1
33924	211	243	1
33925	211	242	1
33926	211	241	1
33927	211	240	1
33928	211	239	1
33929	211	238	1
33930	211	237	1
33931	211	236	1
33932	211	235	1
33933	211	234	1
33934	211	233	1
33935	211	232	1
33936	211	231	1
33937	211	230	1
33938	211	229	1
33939	211	228	1
33940	211	227	1
33941	211	226	1
33942	211	225	1
33943	211	224	1
33944	211	223	1
33945	211	222	1
33946	211	221	1
33947	211	220	1
33948	211	219	1
33949	211	218	1
33950	211	217	1
33951	211	216	1
33952	211	215	1
33953	211	214	1
33954	211	213	1
33955	211	212	1
33956	211	211	1
33957	211	210	1
33958	211	209	1
33959	211	208	1
33960	211	207	1
33961	211	206	1
33962	211	205	1
33963	211	204	1
33964	211	203	1
33965	211	202	1
33966	211	201	1
33967	211	200	1
33968	211	199	1
33969	211	198	1
33970	211	197	1
33971	211	196	1
33972	211	195	1
33973	211	194	1
33974	211	193	1
33975	211	192	1
33976	211	191	1
33977	211	190	1
33978	211	189	1
33979	211	188	1
33980	211	187	1
33981	211	186	1
33982	211	185	1
33983	211	184	1
33984	211	183	1
33985	211	182	1
33986	211	181	1
33987	211	180	1
33988	211	179	1
33989	211	178	1
33990	211	177	1
33991	211	176	1
33992	211	175	1
33993	211	174	1
33994	211	173	1
33995	211	172	1
33996	211	171	1
33997	211	170	1
33998	211	169	1
33999	211	168	1
34000	211	167	1
34001	211	166	1
34002	211	165	1
34003	211	164	1
34004	211	163	1
34005	211	162	1
34006	211	161	1
34007	211	160	1
34008	211	159	1
34009	211	158	1
34010	211	157	1
34011	211	156	1
34012	211	155	1
34013	211	154	1
34014	211	153	1
34015	211	152	1
34016	211	151	1
34017	211	150	1
34018	211	149	1
34019	211	148	1
34020	211	147	1
34021	211	146	1
34022	211	145	1
34023	211	144	1
34024	211	143	1
34025	211	142	1
34026	211	141	1
34027	211	140	1
34028	211	139	1
34029	211	138	1
34030	211	137	1
34031	211	136	1
34032	211	135	1
34033	211	134	1
34034	211	133	1
34035	211	132	1
34036	211	131	1
34037	211	130	1
34038	211	129	1
34039	211	128	1
34040	211	127	1
34041	211	126	1
34042	211	125	1
34043	211	124	1
34044	211	123	1
34045	211	122	1
34046	211	121	1
34047	211	120	1
34048	211	119	1
34049	211	118	1
34050	211	117	1
34051	211	116	1
34052	211	115	1
34053	211	114	1
34054	211	113	1
34055	211	112	1
34056	211	111	1
34057	211	110	1
34058	211	109	1
34059	211	108	1
34060	211	107	1
34061	211	106	1
34062	211	105	1
34063	211	104	1
34064	211	103	1
34065	211	102	1
34066	211	101	1
34067	211	100	1
34068	211	99	1
34069	211	98	1
34070	211	97	1
34071	211	96	1
34072	211	95	1
34073	211	94	1
34074	211	93	1
34075	211	92	1
34076	211	91	1
34077	211	90	1
34078	211	89	1
34079	211	88	1
34080	211	87	1
34081	211	86	1
34082	211	85	1
34083	211	84	1
34084	211	83	1
34085	211	82	1
34086	211	81	1
34087	211	80	1
34088	211	79	1
34089	211	78	1
34090	211	77	1
34091	211	76	1
34092	211	75	1
34093	211	74	1
34094	211	73	1
34095	211	72	1
34096	211	71	1
34097	211	70	1
34098	211	69	1
34099	211	68	1
34100	211	67	1
34101	211	66	1
34102	211	65	1
34103	211	64	1
34104	211	63	1
34105	211	62	1
34106	211	61	1
34107	211	60	1
34108	211	59	1
34109	211	58	1
34110	211	57	1
34111	211	56	1
34112	211	55	1
34113	211	54	1
34114	211	53	1
34115	211	52	1
34116	211	51	1
34117	211	50	1
34118	211	49	1
34119	211	48	1
34120	211	47	1
34121	211	46	1
34122	211	45	1
34123	211	44	1
34124	211	43	1
34125	211	42	1
34126	211	41	1
34127	211	40	1
34128	211	39	1
34129	211	38	1
34130	211	37	1
34131	211	36	1
34132	211	35	1
34133	211	34	1
34134	211	33	1
34135	211	32	1
34136	211	31	1
34137	211	30	1
34138	211	29	1
34139	211	28	1
34140	211	27	1
34141	211	26	1
34142	211	25	1
34143	211	24	1
34144	211	23	1
34145	211	22	1
34146	211	21	1
34147	211	20	1
34148	211	19	1
34149	211	18	1
34150	211	17	1
34151	211	16	1
34152	211	15	1
34153	211	14	1
34154	211	13	1
34155	211	12	1
34156	211	11	1
34157	211	10	1
34158	211	9	1
34159	211	8	1
34160	211	7	1
34161	211	6	1
34162	211	5	1
34163	211	4	1
34164	211	3	1
34165	211	2	1
34166	211	1	1
34167	212	112	1
34168	212	111	1
34169	212	110	1
34170	212	109	1
34171	212	108	1
34172	212	107	1
34173	212	106	1
34174	212	105	1
34175	212	104	1
34176	212	103	1
34177	212	102	1
34178	212	101	1
34179	212	100	1
34180	212	99	1
34181	212	98	1
34182	212	97	1
34183	212	96	1
34184	212	95	1
34185	212	94	1
34186	212	93	1
34187	212	92	1
34188	212	91	1
34189	212	90	1
34190	212	89	1
34191	212	88	1
34192	212	87	1
34193	212	86	1
34194	212	85	1
34195	212	84	1
34196	212	83	1
34197	212	82	1
34198	212	81	1
34199	212	80	1
34200	212	79	1
34201	212	78	1
34202	212	77	1
34203	212	76	1
34204	212	75	1
34205	212	74	1
34206	212	73	1
34207	212	72	1
34208	212	71	1
34209	212	70	1
34210	212	69	1
34211	212	68	1
34212	212	67	1
34213	212	66	1
34214	212	65	1
34215	212	64	1
34216	212	63	1
34217	212	62	1
34218	212	61	1
34219	212	60	1
34220	212	59	1
34221	212	58	1
34222	212	57	1
34223	212	56	1
34224	212	55	1
34225	212	54	1
34226	212	53	1
34227	212	52	1
34228	212	51	1
34229	212	50	1
34230	212	49	1
34231	212	48	1
34232	212	47	1
34233	212	46	1
34234	212	45	1
34235	212	44	1
34236	212	43	1
34237	212	42	1
34238	212	41	1
34239	212	40	1
34240	212	39	1
34241	212	38	1
34242	212	37	1
34243	212	36	1
34244	212	35	1
34245	212	34	1
34246	212	33	1
34247	212	32	1
34248	212	31	1
34249	212	30	1
34250	212	29	1
34251	212	28	1
34252	212	27	1
34253	212	26	1
34254	212	25	1
34255	212	24	1
34256	212	23	1
34257	212	22	1
34258	212	21	1
34259	212	20	1
34260	212	19	1
34261	212	18	1
34262	212	17	1
34263	212	16	1
34264	212	15	1
34265	212	14	1
34266	212	13	1
34267	212	12	1
34268	212	11	1
34269	212	10	1
34270	212	9	1
34271	212	8	1
34272	212	7	1
34273	212	6	1
34274	212	5	1
34275	212	4	1
34276	212	3	1
34277	212	2	1
34278	212	1	1
34279	213	134	1
34280	213	133	1
34281	213	132	1
34282	213	131	1
34283	213	130	1
34284	213	129	1
34285	213	128	1
34286	213	127	1
34287	213	126	1
34288	213	125	1
34289	213	124	1
34290	213	123	1
34291	213	122	1
34292	213	121	1
34293	213	120	1
34294	213	119	1
34295	213	118	1
34296	213	117	1
34297	213	116	1
34298	213	115	1
34299	213	114	1
34300	213	113	1
34301	213	112	1
34302	213	111	1
34303	213	110	1
34304	213	109	1
34305	213	108	1
34306	213	107	1
34307	213	106	1
34308	213	105	1
34309	213	104	1
34310	213	103	1
34311	213	102	1
34312	213	101	1
34313	213	100	1
34314	213	99	1
34315	213	98	1
34316	213	97	1
34317	213	96	1
34318	213	95	1
34319	213	94	1
34320	213	93	1
34321	213	92	1
34322	213	91	1
34323	213	90	1
34324	213	89	1
34325	213	88	1
34326	213	87	1
34327	213	86	1
34328	213	85	1
34329	213	84	1
34330	213	83	1
34331	213	82	1
34332	213	81	1
34333	213	80	1
34334	213	79	1
34335	213	78	1
34336	213	77	1
34337	213	76	1
34338	213	75	1
34339	213	74	1
34340	213	73	1
34341	213	72	1
34342	213	71	1
34343	213	70	1
34344	213	69	1
34345	213	68	1
34346	213	67	1
34347	213	66	1
34348	213	65	1
34349	213	64	1
34350	213	63	1
34351	213	62	1
34352	213	61	1
34353	213	60	1
34354	213	59	1
34355	213	58	1
34356	213	57	1
34357	213	56	1
34358	213	55	1
34359	213	54	1
34360	213	53	1
34361	213	52	1
34362	213	51	1
34363	213	50	1
34364	213	49	1
34365	213	48	1
34366	213	47	1
34367	213	46	1
34368	213	45	1
34369	213	44	1
34370	213	43	1
34371	213	42	1
34372	213	41	1
34373	213	40	1
34374	213	39	1
34375	213	38	1
34376	213	37	1
34377	213	36	1
34378	213	35	1
34379	213	34	1
34380	213	33	1
34381	213	32	1
34382	213	31	1
34383	213	30	1
34384	213	29	1
34385	213	28	1
34386	213	27	1
34387	213	26	1
34388	213	25	1
34389	213	24	1
34390	213	23	1
34391	213	22	1
34392	213	21	1
34393	213	20	1
34394	213	19	1
34395	213	18	1
34396	213	17	1
34397	213	16	1
34398	213	15	1
34399	213	14	1
34400	213	13	1
34401	213	12	1
34402	213	11	1
34403	213	10	1
34404	213	9	1
34405	213	8	1
34406	213	7	1
34407	213	6	1
34408	213	5	1
34409	213	4	1
34410	213	3	1
34411	213	2	1
34412	213	1	1
34413	214	123	3
34414	214	122	3
34415	214	121	3
34416	214	120	3
34417	214	119	3
34418	214	118	3
34419	214	117	3
34420	214	116	3
34421	214	115	3
34422	214	114	3
34423	214	113	3
34424	214	112	3
34425	214	111	3
34426	214	110	3
34427	214	109	3
34428	214	108	3
34429	214	107	3
34430	214	106	3
34431	214	105	3
34432	214	104	3
34433	214	103	3
34434	214	102	3
34435	214	101	3
34436	214	100	3
34437	214	99	3
34438	214	98	3
34439	214	97	3
34440	214	96	3
34441	214	95	3
34442	214	94	3
34443	214	93	3
34444	214	92	3
34445	214	91	3
34446	214	90	3
34447	214	89	2
34448	214	88	2
34449	214	87	2
34450	214	86	2
34451	214	85	2
34452	214	84	2
34453	214	83	2
34454	214	82	2
34455	214	81	2
34456	214	80	2
34457	214	79	2
34458	214	78	2
34459	214	77	2
34460	214	76	2
34461	214	75	2
34462	214	74	2
34463	214	73	2
34464	214	72	2
34465	214	71	2
34466	214	70	2
34467	214	69	2
34468	214	68	2
34469	214	67	2
34470	214	66	2
34471	214	65	2
34472	214	64	2
34473	214	63	2
34474	214	62	2
34475	214	61	2
34476	214	60	2
34477	214	59	2
34478	214	58	2
34479	214	57	2
34480	214	56	2
34481	214	55	2
34482	214	54	2
34483	214	53	2
34484	214	52	2
34485	214	51	2
34486	214	50	2
34487	214	49	2
34488	214	48	2
34489	214	47	2
34490	214	46	2
34491	214	45	2
34492	214	44	1
34493	214	43	1
34494	214	42	1
34495	214	41	1
34496	214	40	1
34497	214	39	1
34498	214	38	1
34499	214	37	1
34500	214	36	1
34501	214	35	1
34502	214	34	1
34503	214	33	1
34504	214	32	1
34505	214	31	1
34506	214	30	1
34507	214	29	1
34508	214	28	1
34509	214	27	1
34510	214	26	1
34511	214	25	1
34512	214	24	1
34513	214	23	1
34514	214	22	1
34515	214	21	1
34516	214	20	1
34517	214	19	1
34518	214	18	1
34519	214	17	1
34520	214	16	1
34521	214	15	1
34522	214	14	1
34523	214	13	1
34524	214	12	1
34525	214	11	1
34526	214	10	1
34527	214	9	1
34528	214	8	1
34529	214	7	1
34530	214	6	1
34531	214	5	1
34532	214	4	1
34533	214	3	1
34534	214	2	1
34535	214	1	1
34536	215	80	1
34537	215	79	1
34538	215	78	1
34539	215	77	1
34540	215	76	1
34541	215	75	1
34542	215	74	1
34543	215	73	1
34544	215	72	1
34545	215	71	1
34546	215	70	1
34547	215	69	1
34548	215	68	1
34549	215	67	1
34550	215	66	1
34551	215	65	1
34552	215	64	1
34553	215	63	1
34554	215	62	1
34555	215	61	1
34556	215	60	1
34557	215	59	1
34558	215	58	1
34559	215	57	1
34560	215	56	1
34561	215	55	1
34562	215	54	1
34563	215	53	1
34564	215	52	1
34565	215	51	1
34566	215	50	1
34567	215	49	1
34568	215	48	1
34569	215	47	1
34570	215	46	1
34571	215	45	1
34572	215	44	1
34573	215	43	1
34574	215	42	1
34575	215	41	1
34576	215	40	1
34577	215	39	1
34578	215	38	1
34579	215	37	1
34580	215	36	1
34581	215	35	1
34582	215	34	1
34583	215	33	1
34584	215	32	1
34585	215	31	1
34586	215	30	1
34587	215	29	1
34588	215	28	1
34589	215	27	1
34590	215	26	1
34591	215	25	1
34592	215	24	1
34593	215	23	1
34594	215	22	1
34595	215	21	1
34596	215	20	1
34597	215	19	1
34598	215	18	1
34599	215	17	1
34600	215	16	1
34601	215	15	1
34602	215	14	1
34603	215	13	1
34604	215	12	1
34605	215	11	1
34606	215	10	1
34607	215	9	1
34608	215	8	1
34609	215	7	1
34610	215	6	1
34611	215	5	1
34612	215	4	1
34613	215	3	1
34614	215	2	1
34615	215	1	1
34616	216	45	2
34617	216	44	2
34618	216	43	2
34619	216	42	2
34620	216	41	2
34621	216	40	1
34622	216	39	1
34623	216	38	1
34624	216	37	1
34625	216	36	1
34626	216	35	1
34627	216	34	1
34628	216	33	1
34629	216	32	1
34630	216	31	1
34631	216	30	1
34632	216	29	1
34633	216	28	1
34634	216	27	1
34635	216	26	1
34636	216	25	1
34637	216	24	1
34638	216	23	1
34639	216	22	1
34640	216	21	1
34641	216	20	1
34642	216	19	1
34643	216	18	1
34644	216	17	1
34645	216	16	1
34646	216	15	1
34647	216	14	1
34648	216	13	1
34649	216	12	1
34650	216	11	1
34651	216	10	1
34652	216	9	1
34653	216	8	1
34654	216	7	1
34655	216	6	1
34656	216	5	1
34657	216	4	1
34658	216	3	1
34659	216	2	1
34660	216	1	1
34661	217	251	5
34662	217	250	5
34663	217	249	5
34664	217	248	5
34665	217	247	5
34666	217	246	5
34667	217	245	5
34668	217	244	5
34669	217	243	5
34670	217	242	5
34671	217	241	5
34672	217	240	4
34673	217	239	4
34674	217	238	4
34675	217	237	4
34676	217	236	4
34677	217	235	4
34678	217	234	4
34679	217	233	4
34680	217	232	4
34681	217	231	4
34682	217	230	4
34683	217	229	4
34684	217	228	4
34685	217	227	4
34686	217	226	4
34687	217	225	4
34688	217	224	4
34689	217	223	4
34690	217	222	4
34691	217	221	4
34692	217	220	4
34693	217	219	4
34694	217	218	4
34695	217	217	4
34696	217	216	4
34697	217	215	4
34698	217	214	4
34699	217	213	4
34700	217	212	4
34701	217	211	4
34702	217	210	4
34703	217	209	4
34704	217	208	4
34705	217	207	4
34706	217	206	4
34707	217	205	4
34708	217	204	4
34709	217	203	4
34710	217	202	4
34711	217	201	4
34712	217	200	4
34713	217	199	4
34714	217	198	4
34715	217	197	4
34716	217	196	4
34717	217	195	4
34718	217	194	4
34719	217	193	4
34720	217	192	4
34721	217	191	4
34722	217	190	4
34723	217	189	3
34724	217	188	3
34725	217	187	3
34726	217	186	3
34727	217	185	3
34728	217	184	3
34729	217	183	3
34730	217	182	3
34731	217	181	3
34732	217	180	3
34733	217	179	3
34734	217	178	3
34735	217	177	3
34736	217	176	3
34737	217	175	3
34738	217	174	3
34739	217	173	3
34740	217	172	3
34741	217	171	3
34742	217	170	3
34743	217	169	3
34744	217	168	3
34745	217	167	3
34746	217	166	3
34747	217	165	3
34748	217	164	3
34749	217	163	3
34750	217	162	3
34751	217	161	3
34752	217	160	3
34753	217	159	3
34754	217	158	3
34755	217	157	3
34756	217	156	3
34757	217	155	3
34758	217	154	3
34759	217	153	3
34760	217	152	3
34761	217	151	3
34762	217	150	3
34763	217	149	3
34764	217	148	3
34765	217	147	3
34766	217	146	3
34767	217	145	3
34768	217	144	3
34769	217	143	3
34770	217	142	3
34771	217	141	3
34772	217	140	3
34773	217	139	3
34774	217	138	3
34775	217	137	3
34776	217	136	3
34777	217	135	3
34778	217	134	3
34779	217	133	3
34780	217	132	3
34781	217	131	2
34782	217	130	2
34783	217	129	2
34784	217	128	2
34785	217	127	2
34786	217	126	2
34787	217	125	2
34788	217	124	2
34789	217	123	2
34790	217	122	2
34791	217	121	2
34792	217	120	2
34793	217	119	2
34794	217	118	2
34795	217	117	2
34796	217	116	2
34797	217	115	2
34798	217	114	2
34799	217	113	2
34800	217	112	2
34801	217	111	2
34802	217	110	2
34803	217	109	2
34804	217	108	2
34805	217	107	2
34806	217	106	2
34807	217	105	2
34808	217	104	2
34809	217	103	2
34810	217	102	2
34811	217	101	2
34812	217	100	2
34813	217	99	2
34814	217	98	2
34815	217	97	2
34816	217	96	2
34817	217	95	2
34818	217	94	2
34819	217	93	2
34820	217	92	2
34821	217	91	2
34822	217	90	2
34823	217	89	2
34824	217	88	2
34825	217	87	2
34826	217	86	2
34827	217	85	2
34828	217	84	2
34829	217	83	2
34830	217	82	2
34831	217	81	2
34832	217	80	2
34833	217	79	2
34834	217	78	2
34835	217	77	2
34836	217	76	2
34837	217	75	2
34838	217	74	2
34839	217	73	1
34840	217	72	1
34841	217	71	1
34842	217	70	1
34843	217	69	1
34844	217	68	1
34845	217	67	1
34846	217	66	1
34847	217	65	1
34848	217	64	1
34849	217	63	1
34850	217	62	1
34851	217	61	1
34852	217	60	1
34853	217	59	1
34854	217	58	1
34855	217	57	1
34856	217	56	1
34857	217	55	1
34858	217	54	1
34859	217	53	1
34860	217	52	1
34861	217	51	1
34862	217	50	1
34863	217	49	1
34864	217	48	1
34865	217	47	1
34866	217	46	1
34867	217	45	1
34868	217	44	1
34869	217	43	1
34870	217	42	1
34871	217	41	1
34872	217	40	1
34873	217	39	1
34874	217	38	1
34875	217	37	1
34876	217	36	1
34877	217	35	1
34878	217	34	1
34879	217	33	1
34880	217	32	1
34881	217	31	1
34882	217	30	1
34883	217	29	1
34884	217	28	1
34885	217	27	1
34886	217	26	1
34887	217	25	1
34888	217	24	1
34889	217	23	1
34890	217	22	1
34891	217	21	1
34892	217	20	1
34893	217	19	1
34894	217	18	1
34895	217	17	1
34896	217	16	1
34897	217	15	1
34898	217	14	1
34899	217	13	1
34900	217	12	1
34901	217	11	1
34902	217	10	1
34903	217	9	1
34904	217	8	1
34905	217	7	1
34906	217	6	1
34907	217	5	1
34908	217	4	1
34909	217	3	1
34910	217	2	1
34911	217	1	1
34912	218	135	3
34913	218	134	3
34914	218	133	3
34915	218	132	3
34916	218	131	3
34917	218	130	3
34918	218	129	3
34919	218	128	3
34920	218	127	3
34921	218	126	3
34922	218	125	3
34923	218	124	3
34924	218	123	3
34925	218	122	3
34926	218	121	3
34927	218	120	3
34928	218	119	3
34929	218	118	3
34930	218	117	3
34931	218	116	3
34932	218	115	3
34933	218	114	3
34934	218	113	3
34935	218	112	3
34936	218	111	3
34937	218	110	3
34938	218	109	3
34939	218	108	3
34940	218	107	3
34941	218	106	3
34942	218	105	3
34943	218	104	3
34944	218	103	3
34945	218	102	3
34946	218	101	3
34947	218	100	3
34948	218	99	3
34949	218	98	3
34950	218	97	3
34951	218	96	3
34952	218	95	3
34953	218	94	2
34954	218	93	2
34955	218	92	2
34956	218	91	2
34957	218	90	2
34958	218	89	2
34959	218	88	2
34960	218	87	2
34961	218	86	2
34962	218	85	2
34963	218	84	2
34964	218	83	2
34965	218	82	2
34966	218	81	2
34967	218	80	2
34968	218	79	2
34969	218	78	2
34970	218	77	2
34971	218	76	2
34972	218	75	2
34973	218	74	2
34974	218	73	2
34975	218	72	2
34976	218	71	2
34977	218	70	2
34978	218	69	2
34979	218	68	2
34980	218	67	2
34981	218	66	2
34982	218	65	2
34983	218	64	2
34984	218	63	2
34985	218	62	2
34986	218	61	2
34987	218	60	2
34988	218	59	2
34989	218	58	2
34990	218	57	2
34991	218	56	2
34992	218	55	2
34993	218	54	2
34994	218	53	2
34995	218	52	2
34996	218	51	2
34997	218	50	2
34998	218	49	1
34999	218	48	1
35000	218	47	1
35001	218	46	1
35002	218	45	1
35003	218	44	1
35004	218	43	1
35005	218	42	1
35006	218	41	1
35007	218	40	1
35008	218	39	1
35009	218	38	1
35010	218	37	1
35011	218	36	1
35012	218	35	1
35013	218	34	1
35014	218	33	1
35015	218	32	1
35016	218	31	1
35017	218	30	1
35018	218	29	1
35019	218	28	1
35020	218	27	1
35021	218	26	1
35022	218	25	1
35023	218	24	1
35024	218	23	1
35025	218	22	1
35026	218	21	1
35027	218	20	1
35028	218	19	1
35029	218	18	1
35030	218	17	1
35031	218	16	1
35032	218	15	1
35033	218	14	1
35034	218	13	1
35035	218	12	1
35036	218	11	1
35037	218	10	1
35038	218	9	1
35039	218	8	1
35040	218	7	1
35041	218	6	1
35042	218	5	1
35043	218	4	1
35044	218	3	1
35045	218	2	1
35046	218	1	1
35047	219	80	2
35048	219	79	2
35049	219	78	2
35050	219	77	2
35051	219	76	2
35052	219	75	2
35053	219	74	2
35054	219	73	2
35055	219	72	2
35056	219	71	2
35057	219	70	2
35058	219	69	2
35059	219	68	2
35060	219	67	2
35061	219	66	2
35062	219	65	2
35063	219	64	2
35064	219	63	2
35065	219	62	2
35066	219	61	2
35067	219	60	2
35068	219	59	2
35069	219	58	2
35070	219	57	2
35071	219	56	2
35072	219	55	2
35073	219	54	2
35074	219	53	2
35075	219	52	2
35076	219	51	2
35077	219	50	2
35078	219	49	2
35079	219	48	2
35080	219	47	2
35081	219	46	2
35082	219	45	1
35083	219	44	1
35084	219	43	1
35085	219	42	1
35086	219	41	1
35087	219	40	1
35088	219	39	1
35089	219	38	1
35090	219	37	1
35091	219	36	1
35092	219	35	1
35093	219	34	1
35094	219	33	1
35095	219	32	1
35096	219	31	1
35097	219	30	1
35098	219	29	1
35099	219	28	1
35100	219	27	1
35101	219	26	1
35102	219	25	1
35103	219	24	1
35104	219	23	1
35105	219	22	1
35106	219	21	1
35107	219	20	1
35108	219	19	1
35109	219	18	1
35110	219	17	1
35111	219	16	1
35112	219	15	1
35113	219	14	1
35114	219	13	1
35115	219	12	1
35116	219	11	1
35117	219	10	1
35118	219	9	1
35119	219	8	1
35120	219	7	1
35121	219	6	1
35122	219	5	1
35123	219	4	1
35124	219	3	1
35125	219	2	1
35126	219	1	1
35127	219	0	1
35128	220	82	2
35129	220	81	2
35130	220	80	2
35131	220	79	2
35132	220	78	2
35133	220	77	2
35134	220	76	2
35135	220	75	1
35136	220	74	1
35137	220	73	1
35138	220	72	1
35139	220	71	1
35140	220	70	1
35141	220	69	1
35142	220	68	1
35143	220	67	1
35144	220	66	1
35145	220	65	1
35146	220	64	1
35147	220	63	1
35148	220	62	1
35149	220	61	1
35150	220	60	1
35151	220	59	1
35152	220	58	1
35153	220	57	1
35154	220	56	1
35155	220	55	1
35156	220	54	1
35157	220	53	1
35158	220	52	1
35159	220	51	1
35160	220	50	1
35161	220	49	1
35162	220	48	1
35163	220	47	1
35164	220	46	1
35165	220	45	1
35166	220	44	1
35167	220	43	1
35168	220	42	1
35169	220	41	1
35170	220	40	1
35171	220	39	1
35172	220	38	1
35173	220	37	1
35174	220	36	1
35175	220	35	1
35176	220	34	1
35177	220	33	1
35178	220	32	1
35179	220	31	1
35180	220	30	1
35181	220	29	1
35182	220	28	1
35183	220	27	1
35184	220	26	1
35185	220	25	1
35186	220	24	1
35187	220	23	1
35188	220	22	1
35189	220	21	1
35190	220	20	1
35191	220	19	1
35192	220	18	1
35193	220	17	1
35194	220	16	1
35195	220	15	1
35196	220	14	1
35197	220	13	1
35198	220	12	1
35199	220	11	1
35200	220	10	1
35201	220	9	1
35202	220	8	1
35203	220	7	1
35204	220	6	1
35205	220	5	1
35206	220	4	1
35207	220	3	1
35208	220	2	1
35209	220	1	1
35210	220	0	1
35211	221	36	2
35212	221	35	2
35213	221	34	2
35214	221	33	2
35215	221	32	2
35216	221	31	2
35217	221	30	2
35218	221	29	2
35219	221	28	2
35220	221	27	2
35221	221	26	2
35222	221	25	2
35223	221	24	2
35224	221	23	2
35225	221	22	2
35226	221	21	2
35227	221	20	2
35228	221	19	2
35229	221	18	2
35230	221	17	2
35231	221	16	2
35232	221	15	2
35233	221	14	2
35234	221	13	2
35235	221	12	2
35236	221	11	2
35237	221	10	2
35238	221	9	2
35239	221	8	2
35240	221	7	2
35241	221	6	2
35242	221	5	2
35243	221	4	2
35244	221	3	2
35245	221	2	2
35246	221	1	2
35247	221	70	1
35248	221	69	1
35249	221	68	1
35250	221	67	1
35251	221	66	1
35252	221	65	1
35253	221	64	1
35254	221	63	1
35255	221	62	1
35256	221	61	1
35257	221	60	1
35258	221	59	1
35259	221	58	1
35260	221	57	1
35261	221	56	1
35262	221	55	1
35263	221	54	1
35264	221	53	1
35265	221	52	1
35266	221	51	1
35267	221	50	1
35268	221	49	1
35269	221	48	1
35270	221	47	1
35271	221	46	1
35272	221	45	1
35273	221	44	1
35274	221	43	1
35275	221	42	1
35276	221	41	1
35277	221	40	1
35278	221	39	1
35279	221	38	1
35280	221	37	1
35281	221	36	1
35282	221	35	1
35283	221	34	1
35284	221	33	1
35285	221	32	1
35286	221	31	1
35287	221	30	1
35288	221	29	1
35289	221	28	1
35290	221	27	1
35291	221	26	1
35292	221	25	1
35293	221	24	1
35294	221	23	1
35295	221	22	1
35296	221	21	1
35297	221	20	1
35298	221	19	1
35299	221	18	1
35300	221	17	1
35301	221	16	1
35302	221	15	1
35303	221	14	1
35304	221	13	1
35305	221	12	1
35306	221	11	1
35307	221	10	1
35308	221	9	1
35309	221	8	1
35310	221	7	1
35311	221	6	1
35312	221	5	1
35313	221	4	1
35314	221	3	1
35315	221	2	1
35316	221	1	1
35317	222	50	1
35318	222	49	1
35319	222	48	1
35320	222	47	1
35321	222	46	1
35322	222	45	1
35323	222	44	1
35324	222	43	1
35325	222	42	1
35326	222	41	1
35327	222	40	1
35328	222	39	1
35329	222	38	1
35330	222	37	1
35331	222	36	1
35332	222	35	1
35333	222	34	1
35334	222	33	1
35335	222	32	1
35336	222	31	1
35337	222	30	1
35338	222	29	1
35339	222	28	1
35340	222	27	1
35341	222	26	1
35342	222	25	1
35343	222	24	1
35344	222	23	1
35345	222	22	1
35346	222	21	1
35347	222	20	1
35348	222	19	1
35349	222	18	1
35350	222	17	1
35351	222	16	1
35352	222	15	1
35353	222	14	1
35354	222	13	1
35355	222	12	1
35356	222	11	1
35357	222	10	1
35358	222	9	1
35359	222	8	1
35360	222	7	1
35361	222	6	1
35362	222	5	1
35363	222	4	1
35364	222	3	1
35365	222	2	1
35366	222	1	1
35367	222	0	1
35368	223	260	2
35369	223	259	2
35370	223	258	2
35371	223	257	2
35372	223	256	2
35373	223	255	2
35374	223	254	2
35375	223	253	2
35376	223	252	2
35377	223	251	2
35378	223	250	2
35379	223	249	2
35380	223	248	2
35381	223	247	2
35382	223	246	2
35383	223	245	2
35384	223	244	2
35385	223	243	2
35386	223	242	2
35387	223	241	2
35388	223	240	2
35389	223	239	2
35390	223	238	2
35391	223	237	2
35392	223	236	2
35393	223	235	2
35394	223	234	2
35395	223	233	2
35396	223	232	2
35397	223	231	2
35398	223	230	2
35399	223	229	2
35400	223	228	2
35401	223	227	2
35402	223	226	2
35403	223	225	2
35404	223	224	2
35405	223	223	2
35406	223	222	2
35407	223	221	2
35408	223	220	2
35409	223	219	2
35410	223	218	2
35411	223	217	2
35412	223	216	2
35413	223	215	2
35414	223	214	2
35415	223	213	2
35416	223	212	2
35417	223	211	2
35418	223	210	2
35419	223	209	2
35420	223	208	2
35421	223	207	2
35422	223	206	2
35423	223	205	2
35424	223	204	1
35425	223	203	1
35426	223	202	1
35427	223	201	1
35428	223	200	1
35429	223	199	1
35430	223	198	1
35431	223	197	1
35432	223	196	1
35433	223	195	1
35434	223	194	1
35435	223	193	1
35436	223	192	1
35437	223	191	1
35438	223	190	1
35439	223	189	1
35440	223	188	1
35441	223	187	1
35442	223	186	1
35443	223	185	1
35444	223	184	1
35445	223	183	1
35446	223	182	1
35447	223	181	1
35448	223	180	1
35449	223	179	1
35450	223	178	1
35451	223	177	1
35452	223	176	1
35453	223	175	1
35454	223	174	1
35455	223	173	1
35456	223	172	1
35457	223	171	1
35458	223	170	1
35459	223	169	1
35460	223	168	1
35461	223	167	1
35462	223	166	1
35463	223	165	1
35464	223	164	1
35465	223	163	1
35466	223	162	1
35467	223	161	1
35468	223	160	1
35469	223	159	1
35470	223	158	1
35471	223	157	1
35472	223	156	1
35473	223	155	1
35474	223	154	1
35475	223	153	1
35476	223	152	1
35477	223	151	1
35478	223	150	1
35479	223	149	1
35480	223	148	1
35481	223	147	1
35482	223	146	1
35483	223	145	1
35484	223	144	1
35485	223	143	1
35486	223	142	1
35487	223	141	1
35488	223	140	1
35489	223	139	1
35490	223	138	1
35491	223	137	1
35492	223	136	1
35493	223	135	1
35494	223	134	1
35495	223	133	1
35496	223	132	1
35497	223	131	1
35498	223	130	1
35499	223	129	1
35500	223	128	1
35501	223	127	1
35502	223	126	1
35503	223	125	1
35504	223	124	1
35505	223	123	1
35506	223	122	1
35507	223	121	1
35508	223	120	1
35509	223	119	1
35510	223	118	1
35511	223	117	1
35512	223	116	1
35513	223	115	1
35514	223	114	1
35515	223	113	1
35516	223	112	1
35517	223	111	1
35518	223	110	1
35519	223	109	1
35520	223	108	1
35521	223	107	1
35522	223	106	1
35523	223	105	1
35524	223	104	1
35525	223	103	1
35526	223	102	1
35527	223	101	1
35528	223	100	1
35529	223	99	1
35530	223	98	1
35531	223	97	1
35532	223	96	1
35533	223	95	1
35534	223	94	1
35535	223	93	1
35536	223	92	1
35537	223	91	1
35538	223	90	1
35539	223	89	1
35540	223	88	1
35541	223	87	1
35542	223	86	1
35543	223	85	1
35544	223	84	1
35545	223	83	1
35546	223	82	1
35547	223	81	1
35548	223	80	1
35549	223	79	1
35550	223	78	1
35551	223	77	1
35552	223	76	1
35553	223	75	1
35554	223	74	1
35555	223	73	1
35556	223	72	1
35557	223	71	1
35558	223	70	1
35559	223	69	1
35560	223	68	1
35561	223	67	1
35562	223	66	1
35563	223	65	1
35564	223	64	1
35565	223	63	1
35566	223	62	1
35567	223	61	1
35568	223	60	1
35569	223	59	1
35570	223	58	1
35571	223	57	1
35572	223	56	1
35573	223	55	1
35574	223	54	1
35575	223	53	1
35576	223	52	1
35577	223	51	1
35578	223	50	1
35579	223	49	1
35580	223	48	1
35581	223	47	1
35582	223	46	1
35583	223	45	1
35584	223	44	1
35585	223	43	1
35586	223	42	1
35587	223	41	1
35588	223	40	1
35589	223	39	1
35590	223	38	1
35591	223	37	1
35592	223	36	1
35593	223	35	1
35594	223	34	1
35595	223	33	1
35596	223	32	1
35597	223	31	1
35598	223	30	1
35599	223	29	1
35600	223	28	1
35601	223	27	1
35602	223	26	1
35603	223	25	1
35604	223	24	1
35605	223	23	1
35606	223	22	1
35607	223	21	1
35608	223	20	1
35609	223	19	1
35610	223	18	1
35611	223	17	1
35612	223	16	1
35613	223	15	1
35614	223	14	1
35615	223	13	1
35616	223	12	1
35617	223	11	1
35618	223	10	1
35619	223	9	1
35620	223	8	1
35621	223	7	1
35622	223	6	1
35623	223	5	1
35624	223	4	1
35625	223	3	1
35626	223	2	1
35627	223	1	1
35628	223	1	0
35629	224	94	1
35630	224	93	1
35631	224	92	1
35632	224	91	1
35633	224	90	1
35634	224	89	1
35635	224	88	1
35636	224	87	1
35637	224	86	1
35638	224	85	1
35639	224	84	1
35640	224	83	1
35641	224	82	1
35642	224	81	1
35643	224	80	1
35644	224	79	1
35645	224	78	1
35646	224	77	1
35647	224	76	1
35648	224	75	1
35649	224	74	1
35650	224	73	1
35651	224	72	1
35652	224	71	1
35653	224	70	1
35654	224	69	1
35655	224	68	1
35656	224	67	1
35657	224	66	1
35658	224	65	1
35659	224	64	1
35660	224	63	1
35661	224	62	1
35662	224	61	1
35663	224	60	1
35664	224	59	1
35665	224	58	1
35666	224	57	1
35667	224	56	1
35668	224	55	1
35669	224	54	1
35670	224	53	1
35671	224	52	1
35672	224	51	1
35673	224	50	1
35674	224	49	1
35675	224	48	1
35676	224	47	1
35677	224	46	1
35678	224	45	1
35679	224	44	1
35680	224	43	1
35681	224	42	1
35682	224	41	1
35683	224	40	1
35684	224	39	1
35685	224	38	1
35686	224	37	1
35687	224	36	1
35688	224	35	1
35689	224	34	1
35690	224	33	1
35691	224	32	1
35692	224	31	1
35693	224	30	1
35694	224	29	1
35695	224	28	1
35696	224	27	1
35697	224	26	1
35698	224	25	1
35699	224	24	1
35700	224	23	1
35701	224	22	1
35702	224	21	1
35703	224	20	1
35704	224	19	1
35705	224	18	1
35706	224	17	1
35707	224	16	1
35708	224	15	1
35709	224	14	1
35710	224	13	1
35711	224	12	1
35712	224	11	1
35713	224	10	1
35714	224	9	1
35715	224	8	1
35716	224	7	1
35717	224	6	1
35718	224	5	1
35719	224	4	1
35720	224	3	1
35721	224	2	1
35722	224	1	1
35723	225	37	1
35724	225	36	1
35725	225	35	1
35726	225	34	1
35727	225	33	1
35728	225	32	1
35729	225	31	1
35730	225	30	1
35731	225	29	1
35732	225	28	1
35733	225	27	1
35734	225	26	1
35735	225	25	1
35736	225	24	1
35737	225	23	1
35738	225	22	1
35739	225	21	1
35740	225	20	1
35741	225	19	1
35742	225	18	1
35743	225	17	1
35744	225	16	1
35745	225	15	1
35746	225	14	1
35747	225	13	1
35748	225	12	1
35749	225	11	1
35750	225	10	1
35751	225	9	1
35752	225	8	1
35753	225	7	1
35754	225	6	1
35755	225	5	1
35756	225	4	1
35757	225	3	1
35758	225	2	1
35759	225	1	1
35760	226	102	2
35761	226	101	2
35762	226	100	2
35763	226	99	2
35764	226	98	2
35765	226	97	2
35766	226	96	2
35767	226	95	2
35768	226	94	2
35769	226	93	2
35770	226	92	2
35771	226	91	2
35772	226	90	2
35773	226	89	2
35774	226	88	2
35775	226	87	2
35776	226	86	2
35777	226	85	2
35778	226	84	2
35779	226	83	2
35780	226	82	2
35781	226	81	2
35782	226	80	2
35783	226	79	2
35784	226	78	2
35785	226	77	2
35786	226	76	2
35787	226	75	2
35788	226	74	2
35789	226	73	2
35790	226	72	2
35791	226	71	2
35792	226	70	2
35793	226	69	2
35794	226	68	2
35795	226	67	2
35796	226	66	2
35797	226	65	2
35798	226	64	2
35799	226	63	1
35800	226	62	1
35801	226	61	1
35802	226	60	1
35803	226	59	1
35804	226	58	1
35805	226	57	1
35806	226	56	1
35807	226	55	1
35808	226	54	1
35809	226	53	1
35810	226	52	1
35811	226	51	1
35812	226	50	1
35813	226	49	1
35814	226	48	1
35815	226	47	1
35816	226	46	1
35817	226	45	1
35818	226	44	1
35819	226	43	1
35820	226	42	1
35821	226	41	1
35822	226	40	1
35823	226	39	1
35824	226	38	1
35825	226	37	1
35826	226	36	1
35827	226	35	1
35828	226	34	1
35829	226	33	1
35830	226	32	1
35831	226	31	1
35832	226	30	1
35833	226	29	1
35834	226	28	1
35835	226	27	1
35836	226	26	1
35837	226	25	1
35838	226	24	1
35839	226	23	1
35840	226	22	1
35841	226	21	1
35842	226	20	1
35843	226	19	1
35844	226	18	1
35845	226	17	1
35846	226	16	1
35847	226	15	1
35848	226	14	1
35849	226	13	1
35850	226	12	1
35851	226	11	1
35852	226	10	1
35853	226	9	1
35854	226	8	1
35855	226	7	1
35856	226	6	1
35857	226	5	1
35858	226	4	1
35859	226	3	1
35860	226	2	1
35861	226	1	1
35862	227	52	1
35863	227	51	1
35864	227	50	1
35865	227	49	1
35866	227	48	1
35867	227	47	1
35868	227	46	1
35869	227	45	1
35870	227	44	1
35871	227	43	1
35872	227	42	1
35873	227	41	1
35874	227	40	1
35875	227	39	1
35876	227	38	1
35877	227	37	1
35878	227	36	1
35879	227	35	1
35880	227	34	1
35881	227	33	1
35882	227	32	1
35883	227	31	1
35884	227	30	1
35885	227	29	1
35886	227	28	1
35887	227	27	1
35888	227	26	1
35889	227	25	1
35890	227	24	1
35891	227	23	1
35892	227	22	1
35893	227	21	1
35894	227	20	1
35895	227	19	1
35896	227	18	1
35897	227	17	1
35898	227	16	1
35899	227	15	1
35900	227	14	1
35901	227	13	1
35902	227	12	1
35903	227	11	1
35904	227	10	1
35905	227	9	1
35906	227	8	1
35907	227	7	1
35908	227	6	1
35909	227	5	1
35910	227	4	1
35911	227	3	1
35912	227	2	1
35913	227	1	1
35914	228	90	2
35915	228	89	2
35916	228	88	2
35917	228	87	2
35918	228	86	2
35919	228	85	2
35920	228	84	2
35921	228	83	2
35922	228	82	2
35923	228	81	2
35924	228	80	2
35925	228	79	2
35926	228	78	2
35927	228	77	2
35928	228	76	2
35929	228	75	2
35930	228	74	2
35931	228	73	2
35932	228	72	2
35933	228	71	2
35934	228	70	2
35935	228	69	2
35936	228	68	2
35937	228	67	2
35938	228	66	2
35939	228	65	2
35940	228	64	2
35941	228	63	2
35942	228	62	2
35943	228	61	2
35944	228	60	2
35945	228	59	2
35946	228	58	2
35947	228	57	2
35948	228	56	2
35949	228	55	2
35950	228	54	2
35951	228	53	2
35952	228	52	2
35953	228	51	2
35954	228	50	2
35955	228	49	2
35956	228	48	2
35957	228	48	1
35958	228	47	1
35959	228	46	1
35960	228	45	1
35961	228	44	1
35962	228	43	1
35963	228	42	1
35964	228	41	1
35965	228	40	1
35966	228	39	1
35967	228	38	1
35968	228	37	1
35969	228	36	1
35970	228	35	1
35971	228	34	1
35972	228	33	1
35973	228	32	1
35974	228	31	1
35975	228	30	1
35976	228	29	1
35977	228	28	1
35978	228	27	1
35979	228	26	1
35980	228	25	1
35981	228	24	1
35982	228	23	1
35983	228	22	1
35984	228	21	1
35985	228	20	1
35986	228	19	1
35987	228	18	1
35988	228	17	1
35989	228	16	1
35990	228	15	1
35991	228	14	1
35992	228	13	1
35993	228	12	1
35994	228	11	1
35995	228	10	1
35996	228	9	1
35997	228	8	1
35998	228	7	1
35999	228	6	1
36000	228	5	1
36001	228	4	1
36002	228	3	1
36003	228	2	1
36004	228	1	1
36005	228	0	1
36006	229	280	1
36007	229	279	1
36008	229	278	1
36009	229	277	1
36010	229	276	1
36011	229	275	1
36012	229	274	1
36013	229	273	1
36014	229	272	1
36015	229	271	1
36016	229	270	1
36017	229	269	1
36018	229	268	1
36019	229	267	1
36020	229	266	1
36021	229	265	1
36022	229	264	1
36023	229	263	1
36024	229	262	1
36025	229	261	1
36026	229	260	1
36027	229	259	1
36028	229	258	1
36029	229	257	1
36030	229	256	1
36031	229	255	1
36032	229	254	1
36033	229	253	1
36034	229	252	1
36035	229	251	1
36036	229	250	1
36037	229	249	1
36038	229	248	1
36039	229	247	1
36040	229	246	1
36041	229	245	1
36042	229	244	1
36043	229	243	1
36044	229	242	1
36045	229	241	1
36046	229	240	1
36047	229	239	1
36048	229	238	1
36049	229	237	1
36050	229	236	1
36051	229	235	1
36052	229	234	1
36053	229	233	1
36054	229	232	1
36055	229	231	1
36056	229	230	1
36057	229	229	1
36058	229	228	1
36059	229	227	1
36060	229	226	1
36061	229	225	1
36062	229	224	1
36063	229	223	1
36064	229	222	1
36065	229	221	1
36066	229	220	1
36067	229	219	1
36068	229	218	1
36069	229	217	1
36070	229	216	1
36071	229	215	1
36072	229	214	1
36073	229	213	1
36074	229	212	1
36075	229	211	1
36076	229	210	1
36077	229	209	1
36078	229	208	1
36079	229	207	1
36080	229	206	1
36081	229	205	1
36082	229	204	1
36083	229	203	1
36084	229	202	1
36085	229	201	1
36086	229	200	1
36087	229	199	1
36088	229	198	1
36089	229	197	1
36090	229	196	1
36091	229	195	1
36092	229	194	1
36093	229	193	1
36094	229	192	1
36095	229	191	1
36096	229	190	1
36097	229	189	1
36098	229	188	1
36099	229	187	1
36100	229	186	1
36101	229	185	1
36102	229	184	1
36103	229	183	1
36104	229	182	1
36105	229	181	1
36106	229	180	1
36107	229	179	1
36108	229	178	1
36109	229	177	1
36110	229	176	1
36111	229	175	1
36112	229	174	1
36113	229	173	1
36114	229	172	1
36115	229	171	1
36116	229	170	1
36117	229	169	1
36118	229	168	1
36119	229	167	1
36120	229	166	1
36121	229	165	1
36122	229	164	1
36123	229	163	1
36124	229	162	1
36125	229	161	1
36126	229	160	1
36127	229	159	1
36128	229	158	1
36129	229	157	1
36130	229	156	1
36131	229	155	1
36132	229	154	1
36133	229	153	1
36134	229	152	1
36135	229	151	1
36136	229	150	1
36137	229	149	1
36138	229	148	1
36139	229	147	1
36140	229	146	1
36141	229	145	1
36142	229	144	1
36143	229	143	1
36144	229	142	1
36145	229	141	1
36146	229	140	1
36147	229	139	1
36148	229	138	1
36149	229	137	1
36150	229	136	1
36151	229	135	1
36152	229	134	1
36153	229	133	1
36154	229	132	1
36155	229	131	1
36156	229	130	1
36157	229	129	1
36158	229	128	1
36159	229	127	1
36160	229	126	1
36161	229	125	1
36162	229	124	1
36163	229	123	1
36164	229	122	1
36165	229	121	1
36166	229	120	1
36167	229	119	1
36168	229	118	1
36169	229	117	1
36170	229	116	1
36171	229	115	1
36172	229	114	1
36173	229	113	1
36174	229	112	1
36175	229	111	1
36176	229	110	1
36177	229	109	1
36178	229	108	1
36179	229	107	1
36180	229	106	1
36181	229	105	1
36182	229	104	1
36183	229	103	1
36184	229	102	1
36185	229	101	1
36186	229	100	1
36187	229	99	1
36188	229	98	1
36189	229	97	1
36190	229	96	1
36191	229	95	1
36192	229	94	1
36193	229	93	1
36194	229	92	1
36195	229	91	1
36196	229	90	1
36197	229	89	1
36198	229	88	1
36199	229	87	1
36200	229	86	1
36201	229	85	1
36202	229	84	1
36203	229	83	1
36204	229	82	1
36205	229	81	1
36206	229	80	1
36207	229	79	1
36208	229	78	1
36209	229	77	1
36210	229	76	1
36211	229	75	1
36212	229	74	1
36213	229	73	1
36214	229	72	1
36215	229	71	1
36216	229	70	1
36217	229	69	1
36218	229	68	1
36219	229	67	1
36220	229	66	1
36221	229	65	1
36222	229	64	1
36223	229	63	1
36224	229	62	1
36225	229	61	1
36226	229	60	1
36227	229	59	1
36228	229	58	1
36229	229	57	1
36230	229	56	1
36231	229	55	1
36232	229	54	1
36233	229	53	1
36234	229	52	1
36235	229	51	1
36236	229	50	1
36237	229	49	1
36238	229	48	1
36239	229	47	1
36240	229	46	1
36241	229	45	1
36242	229	44	1
36243	229	43	1
36244	229	42	1
36245	229	41	1
36246	229	40	1
36247	229	39	1
36248	229	38	1
36249	229	37	1
36250	229	36	1
36251	229	35	1
36252	229	34	1
36253	229	33	1
36254	229	32	1
36255	229	31	1
36256	229	30	1
36257	229	29	1
36258	229	28	1
36259	229	27	1
36260	229	26	1
36261	229	25	1
36262	229	24	1
36263	229	23	1
36264	229	22	1
36265	229	21	1
36266	229	20	1
36267	229	19	1
36268	229	18	1
36269	229	17	1
36270	229	16	1
36271	229	15	1
36272	229	14	1
36273	229	13	1
36274	229	12	1
36275	229	11	1
36276	229	10	1
36277	229	9	1
36278	229	8	1
36279	229	7	1
36280	229	6	1
36281	229	5	1
36282	229	4	1
36283	229	3	1
36284	229	2	1
36285	229	1	1
36286	229	0	1
36287	230	39	1
36288	230	38	1
36289	230	37	1
36290	230	36	1
36291	230	35	1
36292	230	34	1
36293	230	33	1
36294	230	32	1
36295	230	31	1
36296	230	30	1
36297	230	29	1
36298	230	28	1
36299	230	27	1
36300	230	26	1
36301	230	25	1
36302	230	24	1
36303	230	23	1
36304	230	22	1
36305	230	21	1
36306	230	20	1
36307	230	19	1
36308	230	18	1
36309	230	17	1
36310	230	16	1
36311	230	15	1
36312	230	14	1
36313	230	13	1
36314	230	12	1
36315	230	11	1
36316	230	10	1
36317	230	9	1
36318	230	8	1
36319	230	7	1
36320	230	6	1
36321	230	5	1
36322	230	4	1
36323	230	3	1
36324	230	2	1
36325	230	1	1
36326	231	176	1
36327	231	175	1
36328	231	174	1
36329	231	173	1
36330	231	172	1
36331	231	171	1
36332	231	170	1
36333	231	169	1
36334	231	168	1
36335	231	167	1
36336	231	166	1
36337	231	165	1
36338	231	164	1
36339	231	163	1
36340	231	162	1
36341	231	161	1
36342	231	160	1
36343	231	159	1
36344	231	158	1
36345	231	157	1
36346	231	156	1
36347	231	155	1
36348	231	154	1
36349	231	153	1
36350	231	152	1
36351	231	151	1
36352	231	150	1
36353	231	149	1
36354	231	148	1
36355	231	147	1
36356	231	146	1
36357	231	145	1
36358	231	144	1
36359	231	143	1
36360	231	142	1
36361	231	141	1
36362	231	140	1
36363	231	139	1
36364	231	138	1
36365	231	137	1
36366	231	136	1
36367	231	135	1
36368	231	134	1
36369	231	133	1
36370	231	132	1
36371	231	131	1
36372	231	130	1
36373	231	129	1
36374	231	128	1
36375	231	127	1
36376	231	126	1
36377	231	125	1
36378	231	124	1
36379	231	123	1
36380	231	122	1
36381	231	121	1
36382	231	120	1
36383	231	119	1
36384	231	118	1
36385	231	117	1
36386	231	116	1
36387	231	115	1
36388	231	114	1
36389	231	113	1
36390	231	112	1
36391	231	111	1
36392	231	110	1
36393	231	109	1
36394	231	108	1
36395	231	107	1
36396	231	106	1
36397	231	105	1
36398	231	104	1
36399	231	103	1
36400	231	102	1
36401	231	101	1
36402	231	100	1
36403	231	99	1
36404	231	98	1
36405	231	97	1
36406	231	96	1
36407	231	95	1
36408	231	94	1
36409	231	93	1
36410	231	92	1
36411	231	91	1
36412	231	90	1
36413	231	89	1
36414	231	88	1
36415	231	87	1
36416	231	86	1
36417	231	85	1
36418	231	84	1
36419	231	83	1
36420	231	82	1
36421	231	81	1
36422	231	80	1
36423	231	79	1
36424	231	78	1
36425	231	77	1
36426	231	76	1
36427	231	75	1
36428	231	74	1
36429	231	73	1
36430	231	72	1
36431	231	71	1
36432	231	70	1
36433	231	69	1
36434	231	68	1
36435	231	67	1
36436	231	66	1
36437	231	65	1
36438	231	64	1
36439	231	63	1
36440	231	62	1
36441	231	61	1
36442	231	60	1
36443	231	59	1
36444	231	58	1
36445	231	57	1
36446	231	56	1
36447	231	55	1
36448	231	54	1
36449	231	53	1
36450	231	52	1
36451	231	51	1
36452	231	50	1
36453	231	49	1
36454	231	48	1
36455	231	47	1
36456	231	46	1
36457	231	45	1
36458	231	44	1
36459	231	43	1
36460	231	42	1
36461	231	41	1
36462	231	40	1
36463	231	39	1
36464	231	38	1
36465	231	37	1
36466	231	36	1
36467	231	35	1
36468	231	34	1
36469	231	33	1
36470	231	32	1
36471	231	31	1
36472	231	30	1
36473	231	29	1
36474	231	28	1
36475	231	27	1
36476	231	26	1
36477	231	25	1
36478	231	24	1
36479	231	23	1
36480	231	22	1
36481	231	21	1
36482	231	20	1
36483	231	19	1
36484	231	18	1
36485	231	17	1
36486	231	16	1
36487	231	15	1
36488	231	14	1
36489	231	13	1
36490	231	12	1
36491	231	11	1
36492	231	10	1
36493	231	9	1
36494	231	8	1
36495	231	7	1
36496	231	6	1
36497	231	5	1
36498	231	4	1
36499	231	3	1
36500	231	2	1
36501	231	1	1
36502	232	95	7
36503	232	94	7
36504	232	93	7
36505	232	92	7
36506	232	91	7
36507	232	90	7
36508	232	89	7
36509	232	88	7
36510	232	87	7
36511	232	86	7
36512	232	85	7
36513	232	84	7
36514	232	83	7
36515	232	82	7
36516	232	81	7
36517	232	80	7
36518	232	79	7
36519	232	78	7
36520	232	77	7
36521	232	76	7
36522	232	75	7
36523	232	74	7
36524	232	73	7
36525	232	72	7
36526	232	71	7
36527	232	70	7
36528	232	69	7
36529	232	68	7
36530	232	67	7
36531	232	66	7
36532	232	65	7
36533	232	64	7
36534	232	63	7
36535	232	62	7
36536	232	61	7
36537	232	60	7
36538	232	59	7
36539	232	58	7
36540	232	57	7
36541	232	56	7
36542	232	55	6
36543	232	54	6
36544	232	53	6
36545	232	52	6
36546	232	51	6
36547	232	50	6
36548	232	49	6
36549	232	48	6
36550	232	47	6
36551	232	46	5
36552	232	45	5
36553	232	44	5
36554	232	43	5
36555	232	42	5
36556	232	41	5
36557	232	40	5
36558	232	38	5
36559	232	37	5
36560	232	36	5
36561	232	35	5
36562	232	34	5
36563	232	33	5
36564	232	32	5
36565	232	31	4
36566	232	28	4
36567	232	27	4
36568	232	26	4
36569	232	25	4
36570	232	24	4
36571	232	23	4
36572	232	22	4
36573	232	19	2
36574	232	18	2
36575	232	17	2
36576	232	16	2
36577	232	15	2
36578	232	14	2
36579	232	13	2
36580	232	12	2
36581	232	11	2
36582	232	10	1
36583	232	9	1
36584	232	8	1
36585	232	7	1
36586	232	6	1
36587	232	5	1
36588	232	4	1
36589	232	3	1
36590	232	2	1
36591	232	1	1
36592	233	318	2
36593	233	317	2
36594	233	316	2
36595	233	315	2
36596	233	314	2
36597	233	313	2
36598	233	312	2
36599	233	311	2
36600	233	310	2
36601	233	309	2
36602	233	308	2
36603	233	307	2
36604	233	306	2
36605	233	305	2
36606	233	304	2
36607	233	303	2
36608	233	302	2
36609	233	301	2
36610	233	300	2
36611	233	299	2
36612	233	298	2
36613	233	297	2
36614	233	296	2
36615	233	295	2
36616	233	294	2
36617	233	293	2
36618	233	292	2
36619	233	291	2
36620	233	290	2
36621	233	289	2
36622	233	288	2
36623	233	287	2
36624	233	286	2
36625	233	285	2
36626	233	284	2
36627	233	283	2
36628	233	282	2
36629	233	281	2
36630	233	280	2
36631	233	279	2
36632	233	278	2
36633	233	277	2
36634	233	276	2
36635	233	275	2
36636	233	274	2
36637	233	273	2
36638	233	272	2
36639	233	271	2
36640	233	270	2
36641	233	269	2
36642	233	268	2
36643	233	267	2
36644	233	266	2
36645	233	265	2
36646	233	264	2
36647	233	263	2
36648	233	262	2
36649	233	261	2
36650	233	260	2
36651	233	259	2
36652	233	258	2
36653	233	257	2
36654	233	256	2
36655	233	255	2
36656	233	254	2
36657	233	253	2
36658	233	252	2
36659	233	251	2
36660	233	250	2
36661	233	249	2
36662	233	248	2
36663	233	247	2
36664	233	246	2
36665	233	245	2
36666	233	244	2
36667	233	243	2
36668	233	242	2
36669	233	241	2
36670	233	240	2
36671	233	239	2
36672	233	238	2
36673	233	237	2
36674	233	236	2
36675	233	235	2
36676	233	234	2
36677	233	233	2
36678	233	232	2
36679	233	231	2
36680	233	230	2
36681	233	229	2
36682	233	228	2
36683	233	227	2
36684	233	226	2
36685	233	225	2
36686	233	224	2
36687	233	223	2
36688	233	222	2
36689	233	221	2
36690	233	220	2
36691	233	219	2
36692	233	218	2
36693	233	217	2
36694	233	216	2
36695	233	215	2
36696	233	214	2
36697	233	213	2
36698	233	212	2
36699	233	211	2
36700	233	210	2
36701	233	209	2
36702	233	208	2
36703	233	207	2
36704	233	206	2
36705	233	205	2
36706	233	204	2
36707	233	203	2
36708	233	202	2
36709	233	201	2
36710	233	200	2
36711	233	199	2
36712	233	198	2
36713	233	197	2
36714	233	196	2
36715	233	195	2
36716	233	194	2
36717	233	193	2
36718	233	192	2
36719	233	191	2
36720	233	190	2
36721	233	189	2
36722	233	188	2
36723	233	187	2
36724	233	186	2
36725	233	185	2
36726	233	184	2
36727	233	183	2
36728	233	182	2
36729	233	181	2
36730	233	180	2
36731	233	179	2
36732	233	178	2
36733	233	177	2
36734	233	176	2
36735	233	175	2
36736	233	174	2
36737	233	173	2
36738	233	172	2
36739	233	171	2
36740	233	170	2
36741	233	169	2
36742	233	168	2
36743	233	167	2
36744	233	166	2
36745	233	165	2
36746	233	164	2
36747	233	163	2
36748	233	162	2
36749	233	161	2
36750	233	160	2
36751	233	159	2
36752	233	158	2
36753	233	157	2
36754	233	156	2
36755	233	155	1
36756	233	154	1
36757	233	153	1
36758	233	152	1
36759	233	151	1
36760	233	150	1
36761	233	149	1
36762	233	148	1
36763	233	147	1
36764	233	146	1
36765	233	145	1
36766	233	144	1
36767	233	143	1
36768	233	142	1
36769	233	141	1
36770	233	140	1
36771	233	139	1
36772	233	138	1
36773	233	137	1
36774	233	136	1
36775	233	135	1
36776	233	134	1
36777	233	133	1
36778	233	132	1
36779	233	131	1
36780	233	130	1
36781	233	129	1
36782	233	128	1
36783	233	127	1
36784	233	126	1
36785	233	125	1
36786	233	124	1
36787	233	123	1
36788	233	122	1
36789	233	121	1
36790	233	120	1
36791	233	119	1
36792	233	118	1
36793	233	117	1
36794	233	116	1
36795	233	115	1
36796	233	114	1
36797	233	113	1
36798	233	112	1
36799	233	111	1
36800	233	110	1
36801	233	109	1
36802	233	108	1
36803	233	107	1
36804	233	106	1
36805	233	105	1
36806	233	104	1
36807	233	103	1
36808	233	102	1
36809	233	101	1
36810	233	100	1
36811	233	99	1
36812	233	98	1
36813	233	97	1
36814	233	96	1
36815	233	95	1
36816	233	94	1
36817	233	93	1
36818	233	92	1
36819	233	91	1
36820	233	90	1
36821	233	89	1
36822	233	88	1
36823	233	87	1
36824	233	86	1
36825	233	85	1
36826	233	84	1
36827	233	83	1
36828	233	82	1
36829	233	81	1
36830	233	80	1
36831	233	79	1
36832	233	78	1
36833	233	77	1
36834	233	76	1
36835	233	75	1
36836	233	74	1
36837	233	73	1
36838	233	72	1
36839	233	71	1
36840	233	70	1
36841	233	69	1
36842	233	68	1
36843	233	67	1
36844	233	66	1
36845	233	65	1
36846	233	64	1
36847	233	63	1
36848	233	62	1
36849	233	61	1
36850	233	60	1
36851	233	59	1
36852	233	58	1
36853	233	57	1
36854	233	56	1
36855	233	55	1
36856	233	54	1
36857	233	53	1
36858	233	52	1
36859	233	51	1
36860	233	50	1
36861	233	49	1
36862	233	48	1
36863	233	47	1
36864	233	46	1
36865	233	45	1
36866	233	44	1
36867	233	43	1
36868	233	42	1
36869	233	41	1
36870	233	40	1
36871	233	39	1
36872	233	38	1
36873	233	37	1
36874	233	36	1
36875	233	35	1
36876	233	34	1
36877	233	33	1
36878	233	32	1
36879	233	31	1
36880	233	30	1
36881	233	29	1
36882	233	28	1
36883	233	27	1
36884	233	26	1
36885	233	25	1
36886	233	24	1
36887	233	23	1
36888	233	22	1
36889	233	21	1
36890	233	20	1
36891	233	19	1
36892	233	18	1
36893	233	17	1
36894	233	16	1
36895	233	15	1
36896	233	14	1
36897	233	13	1
36898	233	12	1
36899	233	11	1
36900	233	10	1
36901	233	9	1
36902	233	8	1
36903	233	7	1
36904	233	6	1
36905	233	5	1
36906	233	4	1
36907	233	3	1
36908	233	2	1
36909	233	1	1
36910	233	0	1
36911	234	143	1
36912	234	142	1
36913	234	141	1
36914	234	140	1
36915	234	139	1
36916	234	138	1
36917	234	137	1
36918	234	136	1
36919	234	135	1
36920	234	134	1
36921	234	133	1
36922	234	132	1
36923	234	131	1
36924	234	130	1
36925	234	129	1
36926	234	128	1
36927	234	127	1
36928	234	126	1
36929	234	125	1
36930	234	124	1
36931	234	123	1
36932	234	122	1
36933	234	121	1
36934	234	120	1
36935	234	119	1
36936	234	118	1
36937	234	117	1
36938	234	116	1
36939	234	115	1
36940	234	114	1
36941	234	113	1
36942	234	112	1
36943	234	111	1
36944	234	110	1
36945	234	109	1
36946	234	108	1
36947	234	107	1
36948	234	106	1
36949	234	105	1
36950	234	104	1
36951	234	103	1
36952	234	102	1
36953	234	101	1
36954	234	100	1
36955	234	99	1
36956	234	98	1
36957	234	97	1
36958	234	96	1
36959	234	95	1
36960	234	94	1
36961	234	93	1
36962	234	92	1
36963	234	91	1
36964	234	90	1
36965	234	89	1
36966	234	88	1
36967	234	87	1
36968	234	86	1
36969	234	85	1
36970	234	84	1
36971	234	83	1
36972	234	82	1
36973	234	81	1
36974	234	80	1
36975	234	79	1
36976	234	78	1
36977	234	77	1
36978	234	76	1
36979	234	75	1
36980	234	74	1
36981	234	73	1
36982	234	72	1
36983	234	71	1
36984	234	70	1
36985	234	69	1
36986	234	68	1
36987	234	67	1
36988	234	66	1
36989	234	65	1
36990	234	64	1
36991	234	63	1
36992	234	62	1
36993	234	61	1
36994	234	60	1
36995	234	59	1
36996	234	58	1
36997	234	57	1
36998	234	56	1
36999	234	55	1
37000	234	54	1
37001	234	53	1
37002	234	52	1
37003	234	51	1
37004	234	50	1
37005	234	49	1
37006	234	48	1
37007	234	47	1
37008	234	46	1
37009	234	45	1
37010	234	44	1
37011	234	43	1
37012	234	42	1
37013	234	41	1
37014	234	40	1
37015	234	39	1
37016	234	38	1
37017	234	37	1
37018	234	36	1
37019	234	35	1
37020	234	34	1
37021	234	33	1
37022	234	32	1
37023	234	31	1
37024	234	30	1
37025	234	29	1
37026	234	28	1
37027	234	27	1
37028	234	26	1
37029	234	25	1
37030	234	24	1
37031	234	23	1
37032	234	22	1
37033	234	21	1
37034	234	20	1
37035	234	19	1
37036	234	18	1
37037	234	17	1
37038	234	16	1
37039	234	15	1
37040	234	14	1
37041	234	13	1
37042	234	12	1
37043	234	11	1
37044	234	10	1
37045	234	9	1
37046	234	8	1
37047	234	7	1
37048	234	6	1
37049	234	5	1
37050	234	4	1
37051	234	3	1
37052	234	2	1
37053	234	1	1
37054	234	0	1
37055	235	374	1
37056	235	373	1
37057	235	372	1
37058	235	371	1
37059	235	370	1
37060	235	369	1
37061	235	368	1
37062	235	367	1
37063	235	366	1
37064	235	365	1
37065	235	364	1
37066	235	363	1
37067	235	362	1
37068	235	361	1
37069	235	360	1
37070	235	359	1
37071	235	358	1
37072	235	357	1
37073	235	356	1
37074	235	355	1
37075	235	354	1
37076	235	353	1
37077	235	352	1
37078	235	351	1
37079	235	350	1
37080	235	349	1
37081	235	348	1
37082	235	347	1
37083	235	346	1
37084	235	345	1
37085	235	344	1
37086	235	343	1
37087	235	342	1
37088	235	341	1
37089	235	340	1
37090	235	339	1
37091	235	338	1
37092	235	337	1
37093	235	336	1
37094	235	335	1
37095	235	334	1
37096	235	333	1
37097	235	332	1
37098	235	331	1
37099	235	330	1
37100	235	329	1
37101	235	328	1
37102	235	327	1
37103	235	326	1
37104	235	325	1
37105	235	324	1
37106	235	323	1
37107	235	322	1
37108	235	321	1
37109	235	320	1
37110	235	319	1
37111	235	318	1
37112	235	317	1
37113	235	316	1
37114	235	315	1
37115	235	314	1
37116	235	313	1
37117	235	312	1
37118	235	311	1
37119	235	310	1
37120	235	309	1
37121	235	308	1
37122	235	307	1
37123	235	306	1
37124	235	305	1
37125	235	304	1
37126	235	303	1
37127	235	302	1
37128	235	301	1
37129	235	300	1
37130	235	299	1
37131	235	298	1
37132	235	297	1
37133	235	296	1
37134	235	295	1
37135	235	294	1
37136	235	293	1
37137	235	292	1
37138	235	291	1
37139	235	290	1
37140	235	289	1
37141	235	288	1
37142	235	287	1
37143	235	286	1
37144	235	285	1
37145	235	284	1
37146	235	283	1
37147	235	282	1
37148	235	281	1
37149	235	280	1
37150	235	279	1
37151	235	278	1
37152	235	277	1
37153	235	276	1
37154	235	275	1
37155	235	274	1
37156	235	273	1
37157	235	272	1
37158	235	271	1
37159	235	270	1
37160	235	269	1
37161	235	268	1
37162	235	267	1
37163	235	266	1
37164	235	265	1
37165	235	264	1
37166	235	263	1
37167	235	262	1
37168	235	261	1
37169	235	260	1
37170	235	259	1
37171	235	258	1
37172	235	257	1
37173	235	256	1
37174	235	255	1
37175	235	254	1
37176	235	253	1
37177	235	252	1
37178	235	251	1
37179	235	250	1
37180	235	249	1
37181	235	248	1
37182	235	247	1
37183	235	246	1
37184	235	245	1
37185	235	244	1
37186	235	243	1
37187	235	242	1
37188	235	241	1
37189	235	240	1
37190	235	239	1
37191	235	238	1
37192	235	237	1
37193	235	236	1
37194	235	235	1
37195	235	234	1
37196	235	233	1
37197	235	232	1
37198	235	231	1
37199	235	230	1
37200	235	229	1
37201	235	228	1
37202	235	227	1
37203	235	226	1
37204	235	225	1
37205	235	224	1
37206	235	223	1
37207	235	222	1
37208	235	221	1
37209	235	220	1
37210	235	219	1
37211	235	218	1
37212	235	217	1
37213	235	216	1
37214	235	215	1
37215	235	214	1
37216	235	213	1
37217	235	212	1
37218	235	211	1
37219	235	210	1
37220	235	209	1
37221	235	208	1
37222	235	207	1
37223	235	206	1
37224	235	205	1
37225	235	204	1
37226	235	203	1
37227	235	202	1
37228	235	201	1
37229	235	200	1
37230	235	199	1
37231	235	198	1
37232	235	197	1
37233	235	196	1
37234	235	195	1
37235	235	194	1
37236	235	193	1
37237	235	192	1
37238	235	191	1
37239	235	190	1
37240	235	189	1
37241	235	188	1
37242	235	187	1
37243	235	186	1
37244	235	185	1
37245	235	184	1
37246	235	183	1
37247	235	182	1
37248	235	181	1
37249	235	180	1
37250	235	179	1
37251	235	178	1
37252	235	177	1
37253	235	176	1
37254	235	175	1
37255	235	174	1
37256	235	173	1
37257	235	172	1
37258	235	171	1
37259	235	170	1
37260	235	169	1
37261	235	168	1
37262	235	167	1
37263	235	166	1
37264	235	165	1
37265	235	164	1
37266	235	163	1
37267	235	162	1
37268	235	161	1
37269	235	160	1
37270	235	159	1
37271	235	158	1
37272	235	157	1
37273	235	156	1
37274	235	155	1
37275	235	154	1
37276	235	153	1
37277	235	152	1
37278	235	151	1
37279	235	150	1
37280	235	149	1
37281	235	148	1
37282	235	147	1
37283	235	146	1
37284	235	145	1
37285	235	144	1
37286	235	143	1
37287	235	142	1
37288	235	141	1
37289	235	140	1
37290	235	139	1
37291	235	138	1
37292	235	137	1
37293	235	136	1
37294	235	135	1
37295	235	134	1
37296	235	133	1
37297	235	132	1
37298	235	131	1
37299	235	130	1
37300	235	129	1
37301	235	128	1
37302	235	127	1
37303	235	126	1
37304	235	125	1
37305	235	124	1
37306	235	123	1
37307	235	122	1
37308	235	121	1
37309	235	120	1
37310	235	119	1
37311	235	118	1
37312	235	117	1
37313	235	116	1
37314	235	115	1
37315	235	114	1
37316	235	113	1
37317	235	112	1
37318	235	111	1
37319	235	110	1
37320	235	109	1
37321	235	108	1
37322	235	107	1
37323	235	106	1
37324	235	105	1
37325	235	104	1
37326	235	103	1
37327	235	102	1
37328	235	101	1
37329	235	100	1
37330	235	99	1
37331	235	98	1
37332	235	97	1
37333	235	96	1
37334	235	95	1
37335	235	94	1
37336	235	93	1
37337	235	92	1
37338	235	91	1
37339	235	90	1
37340	235	89	1
37341	235	88	1
37342	235	87	1
37343	235	86	1
37344	235	85	1
37345	235	84	1
37346	235	83	1
37347	235	82	1
37348	235	81	1
37349	235	80	1
37350	235	79	1
37351	235	78	1
37352	235	77	1
37353	235	76	1
37354	235	75	1
37355	235	74	1
37356	235	73	1
37357	235	72	1
37358	235	71	1
37359	235	70	1
37360	235	69	1
37361	235	68	1
37362	235	67	1
37363	235	66	1
37364	235	65	1
37365	235	64	1
37366	235	63	1
37367	235	62	1
37368	235	61	1
37369	235	60	1
37370	235	59	1
37371	235	58	1
37372	235	57	1
37373	235	56	1
37374	235	55	1
37375	235	54	1
37376	235	53	1
37377	235	52	1
37378	235	51	1
37379	235	50	1
37380	235	49	1
37381	235	48	1
37382	235	47	1
37383	235	46	1
37384	235	45	1
37385	235	44	1
37386	235	43	1
37387	235	42	1
37388	235	41	1
37389	235	40	1
37390	235	39	1
37391	235	38	1
37392	235	37	1
37393	235	36	1
37394	235	35	1
37395	235	34	1
37396	235	33	1
37397	235	32	1
37398	235	31	1
37399	235	30	1
37400	235	29	1
37401	235	28	1
37402	235	27	1
37403	235	26	1
37404	235	25	1
37405	235	24	1
37406	235	23	1
37407	235	22	1
37408	235	21	1
37409	235	20	1
37410	235	19	1
37411	235	18	1
37412	235	17	1
37413	235	16	1
37414	235	15	1
37415	235	14	1
37416	235	13	1
37417	235	12	1
37418	235	11	1
37419	235	10	1
37420	235	9	1
37421	235	8	1
37422	235	7	1
37423	235	6	1
37424	235	5	1
37425	235	4	1
37426	235	3	1
37427	235	2	1
37428	235	1	1
37429	236	8	2
37430	236	7	2
37431	236	6	2
37432	236	5	2
37433	236	4	2
37434	236	3	2
37435	236	2	2
37436	236	1	2
37437	236	15	1
37438	236	14	1
37439	236	13	1
37440	236	12	1
37441	236	11	1
37442	236	10	1
37443	236	9	1
37444	236	8	1
37445	236	7	1
37446	236	6	1
37447	236	5	1
37448	236	4	1
37449	236	3	1
37450	236	2	1
37451	236	1	1
37452	236	0	1
37453	237	59	2
37454	237	58	2
37455	237	57	2
37456	237	56	2
37457	237	55	2
37458	237	54	2
37459	237	53	2
37460	237	52	1
37461	237	51	1
37462	237	50	1
37463	237	49	1
37464	237	48	1
37465	237	47	1
37466	237	46	1
37467	237	45	1
37468	237	44	1
37469	237	43	1
37470	237	42	1
37471	237	41	1
37472	237	40	1
37473	237	39	1
37474	237	38	1
37475	237	37	1
37476	237	36	1
37477	237	35	1
37478	237	34	1
37479	237	33	1
37480	237	32	1
37481	237	31	1
37482	237	30	1
37483	237	29	1
37484	237	28	1
37485	237	27	1
37486	237	26	1
37487	237	25	1
37488	237	24	1
37489	237	23	1
37490	237	22	1
37491	237	21	1
37492	237	20	1
37493	237	19	1
37494	237	18	1
37495	237	17	1
37496	237	16	1
37497	237	15	1
37498	237	14	1
37499	237	13	1
37500	237	12	1
37501	237	11	1
37502	237	10	1
37503	237	9	1
37504	237	8	1
37505	237	7	1
37506	237	6	1
37507	237	5	1
37508	237	4	1
37509	237	3	1
37510	237	2	1
37511	237	1	1
37512	238	122	3
37513	238	121	3
37514	238	120	3
37515	238	119	3
37516	238	118	3
37517	238	117	3
37518	238	116	3
37519	238	115	3
37520	238	114	3
37521	238	113	3
37522	238	112	3
37523	238	111	3
37524	238	110	3
37525	238	109	3
37526	238	108	3
37527	238	107	3
37528	238	106	3
37529	238	105	3
37530	238	104	3
37531	238	103	3
37532	238	102	3
37533	238	101	3
37534	238	100	3
37535	238	99	3
37536	238	98	3
37537	238	97	3
37538	238	96	3
37539	238	95	3
37540	238	94	3
37541	238	93	3
37542	238	92	3
37543	238	91	3
37544	238	90	3
37545	238	89	3
37546	238	88	2
37547	238	87	2
37548	238	86	2
37549	238	85	2
37550	238	84	2
37551	238	83	2
37552	238	82	2
37553	238	81	2
37554	238	80	2
37555	238	79	2
37556	238	78	2
37557	238	77	2
37558	238	76	2
37559	238	75	2
37560	238	74	2
37561	238	73	2
37562	238	72	2
37563	238	71	2
37564	238	70	2
37565	238	69	2
37566	238	68	2
37567	238	67	2
37568	238	66	2
37569	238	65	2
37570	238	64	2
37571	238	63	2
37572	238	62	2
37573	238	61	2
37574	238	60	2
37575	238	59	2
37576	238	58	2
37577	238	57	2
37578	238	56	2
37579	238	55	2
37580	238	54	2
37581	238	53	2
37582	238	52	2
37583	238	51	2
37584	238	50	2
37585	238	49	2
37586	238	48	2
37587	238	47	1
37588	238	46	1
37589	238	45	1
37590	238	44	1
37591	238	43	1
37592	238	42	1
37593	238	41	1
37594	238	40	1
37595	238	39	1
37596	238	38	1
37597	238	37	1
37598	238	36	1
37599	238	35	1
37600	238	34	1
37601	238	33	1
37602	238	32	1
37603	238	31	1
37604	238	30	1
37605	238	29	1
37606	238	28	1
37607	238	27	1
37608	238	26	1
37609	238	25	1
37610	238	24	1
37611	238	23	1
37612	238	22	1
37613	238	21	1
37614	238	20	1
37615	238	19	1
37616	238	18	1
37617	238	17	1
37618	238	16	1
37619	238	15	1
37620	238	14	1
37621	238	13	1
37622	238	12	1
37623	238	11	1
37624	238	10	1
37625	238	9	1
37626	238	8	1
37627	238	7	1
37628	238	6	1
37629	238	5	1
37630	238	4	1
37631	238	3	1
37632	238	2	1
37633	238	1	1
37634	239	73	1
37635	239	72	1
37636	239	71	1
37637	239	70	1
37638	239	69	1
37639	239	68	1
37640	239	67	1
37641	239	66	1
37642	239	65	1
37643	239	64	1
37644	239	63	1
37645	239	62	1
37646	239	61	1
37647	239	60	1
37648	239	59	1
37649	239	58	1
37650	239	57	1
37651	239	56	1
37652	239	55	1
37653	239	54	1
37654	239	53	1
37655	239	52	1
37656	239	51	1
37657	239	50	1
37658	239	49	1
37659	239	48	1
37660	239	47	1
37661	239	46	1
37662	239	45	1
37663	239	44	1
37664	239	43	1
37665	239	42	1
37666	239	41	1
37667	239	40	1
37668	239	39	1
37669	239	38	1
37670	239	37	1
37671	239	36	1
37672	239	35	1
37673	239	34	1
37674	239	33	1
37675	239	32	1
37676	239	31	1
37677	239	30	1
37678	239	29	1
37679	239	28	1
37680	239	27	1
37681	239	26	1
37682	239	25	1
37683	239	24	1
37684	239	23	1
37685	239	22	1
37686	239	21	1
37687	239	20	1
37688	239	19	1
37689	239	18	1
37690	239	17	1
37691	239	16	1
37692	239	15	1
37693	239	14	1
37694	239	13	1
37695	239	12	1
37696	239	11	1
37697	239	10	1
37698	239	9	1
37699	239	8	1
37700	239	7	1
37701	239	6	1
37702	239	5	1
37703	239	4	1
37704	239	3	1
37705	239	2	1
37706	239	1	1
37707	240	44	1
37708	240	43	1
37709	240	42	1
37710	240	41	1
37711	240	40	1
37712	240	39	1
37713	240	38	1
37714	240	37	1
37715	240	36	1
37716	240	35	1
37717	240	34	1
37718	240	33	1
37719	240	32	1
37720	240	31	1
37721	240	30	1
37722	240	29	1
37723	240	28	1
37724	240	27	1
37725	240	26	1
37726	240	25	1
37727	240	24	1
37728	240	23	1
37729	240	22	1
37730	240	21	1
37731	240	20	1
37732	240	19	1
37733	240	18	1
37734	240	17	1
37735	240	16	1
37736	240	15	1
37737	240	14	1
37738	240	13	1
37739	240	12	1
37740	240	11	1
37741	240	10	1
37742	240	9	1
37743	240	8	1
37744	240	7	1
37745	240	6	1
37746	240	5	1
37747	240	4	1
37748	240	3	1
37749	240	2	1
37750	240	1	1
37751	241	50	1
37752	241	49	1
37753	241	48	1
37754	241	47	1
37755	241	46	1
37756	241	45	1
37757	241	44	1
37758	241	43	1
37759	241	42	1
37760	241	41	1
37761	241	40	1
37762	241	39	1
37763	241	38	1
37764	241	37	1
37765	241	36	1
37766	241	35	1
37767	241	34	1
37768	241	33	1
37769	241	32	1
37770	241	31	1
37771	241	30	1
37772	241	29	1
37773	241	28	1
37774	241	27	1
37775	241	26	1
37776	241	25	1
37777	241	24	1
37778	241	23	1
37779	241	22	1
37780	241	21	1
37781	241	20	1
37782	241	19	1
37783	241	18	1
37784	241	17	1
37785	241	16	1
37786	241	15	1
37787	241	14	1
37788	241	13	1
37789	241	12	1
37790	241	11	1
37791	241	10	1
37792	241	9	1
37793	241	8	1
37794	241	7	1
37795	241	6	1
37796	241	5	1
37797	241	4	1
37798	241	3	1
37799	241	2	1
37800	241	1	1
37801	242	41	1
37802	242	40	1
37803	242	39	1
37804	242	38	1
37805	242	37	1
37806	242	36	1
37807	242	35	1
37808	242	34	1
37809	242	33	1
37810	242	32	1
37811	242	31	1
37812	242	30	1
37813	242	29	1
37814	242	28	1
37815	242	27	1
37816	242	26	1
37817	242	25	1
37818	242	24	1
37819	242	23	1
37820	242	22	1
37821	242	21	1
37822	242	20	1
37823	242	19	1
37824	242	18	1
37825	242	17	1
37826	242	16	1
37827	242	15	1
37828	242	14	1
37829	242	13	1
37830	242	12	1
37831	242	11	1
37832	242	10	1
37833	242	9	1
37834	242	8	1
37835	242	7	1
37836	242	6	1
37837	242	5	1
37838	242	4	1
37839	242	3	1
37840	242	2	1
37841	242	1	1
37842	243	43	1
37843	243	42	1
37844	243	41	1
37845	243	40	1
37846	243	39	1
37847	243	38	1
37848	243	37	1
37849	243	36	1
37850	243	35	1
37851	243	34	1
37852	243	33	1
37853	243	32	1
37854	243	31	1
37855	243	30	1
37856	243	29	1
37857	243	28	1
37858	243	27	1
37859	243	26	1
37860	243	25	1
37861	243	24	1
37862	243	23	1
37863	243	22	1
37864	243	21	1
37865	243	20	1
37866	243	19	1
37867	243	18	1
37868	243	17	1
37869	243	16	1
37870	243	15	1
37871	243	14	1
37872	243	13	1
37873	243	12	1
37874	243	11	1
37875	243	10	1
37876	243	9	1
37877	243	8	1
37878	243	7	1
37879	243	6	1
37880	243	5	1
37881	243	4	1
37882	243	3	1
37883	243	2	1
37884	243	1	1
37885	244	31	1
37886	244	30	1
37887	244	29	1
37888	244	28	1
37889	244	27	1
37890	244	26	1
37891	244	25	1
37892	244	24	1
37893	244	23	1
37894	244	22	1
37895	244	21	1
37896	244	20	1
37897	244	19	1
37898	244	18	1
37899	244	17	1
37900	244	16	1
37901	244	15	1
37902	244	14	1
37903	244	13	1
37904	244	12	1
37905	244	11	1
37906	244	10	1
37907	244	9	1
37908	244	8	1
37909	244	7	1
37910	244	6	1
37911	244	5	1
37912	244	4	1
37913	244	3	1
37914	244	2	1
37915	244	1	1
37916	245	60	1
37917	245	59	1
37918	245	58	1
37919	245	57	1
37920	245	56	1
37921	245	55	1
37922	245	54	1
37923	245	53	1
37924	245	52	1
37925	245	51	1
37926	245	50	1
37927	245	49	1
37928	245	48	1
37929	245	47	1
37930	245	46	1
37931	245	45	1
37932	245	44	1
37933	245	43	1
37934	245	42	1
37935	245	41	1
37936	245	40	1
37937	245	39	1
37938	245	38	1
37939	245	37	1
37940	245	36	1
37941	245	35	1
37942	245	34	1
37943	245	33	1
37944	245	32	1
37945	245	31	1
37946	245	30	1
37947	245	29	1
37948	245	28	1
37949	245	27	1
37950	245	26	1
37951	245	25	1
37952	245	24	1
37953	245	23	1
37954	245	22	1
37955	245	21	1
37956	245	20	1
37957	245	19	1
37958	245	18	1
37959	245	17	1
37960	245	16	1
37961	245	15	1
37962	245	14	1
37963	245	13	1
37964	245	12	1
37965	245	11	1
37966	245	10	1
37967	245	9	1
37968	245	8	1
37969	245	7	1
37970	245	6	1
37971	245	5	1
37972	245	4	1
37973	245	3	1
37974	245	2	1
37975	245	1	1
37976	245	0	1
37977	246	60	2
37978	246	59	2
37979	246	58	2
37980	246	57	2
37981	246	56	2
37982	246	55	2
37983	246	54	2
37984	246	53	2
37985	246	52	2
37986	246	51	2
37987	246	50	2
37988	246	49	2
37989	246	48	1
37990	246	47	1
37991	246	46	1
37992	246	45	1
37993	246	44	1
37994	246	43	1
37995	246	42	1
37996	246	41	1
37997	246	40	1
37998	246	39	1
37999	246	38	1
38000	246	37	1
38001	246	36	1
38002	246	35	1
38003	246	34	1
38004	246	33	1
38005	246	32	1
38006	246	31	1
38007	246	30	1
38008	246	29	1
38009	246	28	1
38010	246	27	1
38011	246	26	1
38012	246	25	1
38013	246	24	1
38014	246	23	1
38015	246	22	1
38016	246	21	1
38017	246	20	1
38018	246	19	1
38019	246	18	1
38020	246	17	1
38021	246	16	1
38022	246	15	1
38023	246	14	1
38024	246	13	1
38025	246	12	1
38026	246	11	1
38027	246	10	1
38028	246	9	1
38029	246	8	1
38030	246	7	1
38031	246	6	1
38032	246	5	1
38033	246	4	1
38034	246	3	1
38035	246	2	1
38036	246	1	1
38037	247	45	1
38038	247	44	1
38039	247	43	1
38040	247	42	1
38041	247	41	1
38042	247	40	1
38043	247	39	1
38044	247	38	1
38045	247	37	1
38046	247	36	1
38047	247	35	1
38048	247	34	1
38049	247	33	1
38050	247	32	1
38051	247	31	1
38052	247	30	1
38053	247	29	1
38054	247	28	1
38055	247	27	1
38056	247	26	1
38057	247	25	1
38058	247	24	1
38059	247	23	1
38060	247	22	1
38061	247	21	1
38062	247	20	1
38063	247	19	1
38064	247	18	1
38065	247	17	1
38066	247	16	1
38067	247	15	1
38068	247	14	1
38069	247	13	1
38070	247	12	1
38071	247	11	1
38072	247	10	1
38073	247	9	1
38074	247	8	1
38075	247	7	1
38076	247	6	1
38077	247	5	1
38078	247	4	1
38079	247	3	1
38080	247	2	1
38081	247	1	1
38082	248	199	3
38083	248	198	3
38084	248	197	3
38085	248	196	3
38086	248	195	3
38087	248	194	3
38088	248	193	3
38089	248	192	3
38090	248	191	3
38091	248	190	3
38092	248	189	3
38093	248	188	3
38094	248	187	3
38095	248	186	3
38096	248	185	3
38097	248	184	3
38098	248	183	3
38099	248	182	3
38100	248	181	3
38101	248	180	3
38102	248	179	3
38103	248	178	3
38104	248	177	3
38105	248	176	3
38106	248	175	3
38107	248	174	3
38108	248	173	3
38109	248	172	3
38110	248	171	3
38111	248	170	3
38112	248	169	3
38113	248	168	3
38114	248	167	2
38115	248	166	2
38116	248	165	2
38117	248	164	2
38118	248	163	2
38119	248	162	2
38120	248	161	2
38121	248	160	2
38122	248	159	2
38123	248	158	2
38124	248	157	2
38125	248	156	2
38126	248	155	2
38127	248	154	2
38128	248	153	2
38129	248	152	2
38130	248	151	2
38131	248	150	2
38132	248	149	2
38133	248	148	2
38134	248	147	2
38135	248	146	2
38136	248	145	2
38137	248	144	2
38138	248	143	2
38139	248	142	2
38140	248	141	2
38141	248	140	2
38142	248	139	2
38143	248	138	2
38144	248	137	2
38145	248	136	2
38146	248	135	2
38147	248	134	2
38148	248	133	2
38149	248	132	2
38150	248	131	2
38151	248	130	2
38152	248	129	2
38153	248	128	2
38154	248	127	2
38155	248	126	2
38156	248	125	2
38157	248	124	2
38158	248	123	1
38159	248	122	1
38160	248	121	1
38161	248	120	1
38162	248	119	1
38163	248	118	1
38164	248	117	1
38165	248	116	1
38166	248	115	1
38167	248	114	1
38168	248	113	1
38169	248	112	1
38170	248	111	1
38171	248	110	1
38172	248	109	1
38173	248	108	1
38174	248	107	1
38175	248	106	1
38176	248	105	1
38177	248	104	1
38178	248	103	1
38179	248	102	1
38180	248	101	1
38181	248	100	1
38182	248	99	1
38183	248	98	1
38184	248	97	1
38185	248	96	1
38186	248	95	1
38187	248	94	1
38188	248	93	1
38189	248	92	1
38190	248	91	1
38191	248	90	1
38192	248	89	1
38193	248	88	1
38194	248	87	1
38195	248	86	1
38196	248	85	1
38197	248	84	1
38198	248	83	1
38199	248	82	1
38200	248	81	1
38201	248	80	1
38202	248	79	1
38203	248	78	1
38204	248	77	1
38205	248	76	1
38206	248	75	1
38207	248	74	1
38208	248	73	1
38209	248	72	1
38210	248	71	1
38211	248	70	1
38212	248	69	1
38213	248	68	1
38214	248	67	1
38215	248	66	1
38216	248	65	1
38217	248	64	1
38218	248	63	1
38219	248	62	1
38220	248	61	1
38221	248	60	1
38222	248	59	1
38223	248	58	1
38224	248	57	1
38225	248	56	1
38226	248	55	1
38227	248	54	1
38228	248	53	1
38229	248	52	1
38230	248	51	1
38231	248	50	1
38232	248	49	1
38233	248	48	1
38234	248	47	1
38235	248	46	1
38236	248	45	1
38237	248	44	1
38238	248	43	1
38239	248	42	1
38240	248	41	1
38241	248	40	1
38242	248	39	1
38243	248	38	1
38244	248	37	1
38245	248	36	1
38246	248	35	1
38247	248	34	1
38248	248	33	1
38249	248	32	1
38250	248	31	1
38251	248	30	1
38252	248	29	1
38253	248	28	1
38254	248	27	1
38255	248	26	1
38256	248	25	1
38257	248	24	1
38258	248	23	1
38259	248	22	1
38260	248	21	1
38261	248	20	1
38262	248	19	1
38263	248	18	1
38264	248	17	1
38265	248	16	1
38266	248	15	1
38267	248	14	1
38268	248	13	1
38269	248	12	1
38270	248	11	1
38271	248	10	1
38272	248	9	1
38273	248	8	1
38274	248	7	1
38275	248	6	1
38276	248	5	1
38277	248	4	1
38278	248	3	1
38279	248	2	1
38280	248	1	1
38281	248	0	1
38282	249	8	32
38283	249	7	32
38284	249	6	32
38285	249	5	32
38286	249	4	32
38287	249	3	32
38288	249	2	32
38289	249	1	32
38290	249	278	31
38291	249	277	31
38292	249	276	31
38293	249	275	31
38294	249	274	31
38295	249	273	31
38296	249	272	31
38297	249	271	31
38298	249	270	31
38299	249	269	30
38300	249	268	30
38301	249	267	30
38302	249	266	30
38303	249	265	30
38304	249	264	30
38305	249	263	30
38306	249	262	30
38307	249	261	30
38308	249	260	29
38309	249	259	29
38310	249	258	29
38311	249	257	29
38312	249	256	29
38313	249	255	29
38314	249	254	29
38315	249	253	29
38316	249	252	29
38317	249	251	28
38318	249	250	28
38319	249	249	28
38320	249	248	28
38321	249	247	28
38322	249	246	28
38323	249	245	28
38324	249	244	28
38325	249	243	28
38326	249	242	27
38327	249	241	27
38328	249	240	27
38329	249	239	27
38330	249	238	27
38331	249	237	27
38332	249	236	27
38333	249	235	27
38334	249	234	27
38335	249	233	26
38336	249	232	26
38337	249	231	26
38338	249	230	26
38339	249	229	26
38340	249	228	26
38341	249	227	26
38342	249	226	26
38343	249	225	26
38344	249	224	25
38345	249	223	25
38346	249	222	25
38347	249	221	25
38348	249	220	25
38349	249	219	25
38350	249	218	25
38351	249	217	25
38352	249	216	25
38353	249	215	24
38354	249	214	24
38355	249	213	24
38356	249	212	24
38357	249	211	24
38358	249	210	24
38359	249	209	24
38360	249	208	24
38361	249	207	24
38362	249	206	23
38363	249	205	23
38364	249	204	23
38365	249	203	23
38366	249	202	23
38367	249	201	23
38368	249	200	23
38369	249	199	23
38370	249	198	23
38371	249	197	22
38372	249	196	22
38373	249	195	22
38374	249	194	22
38375	249	193	22
38376	249	192	22
38377	249	191	22
38378	249	190	22
38379	249	189	22
38380	249	188	21
38381	249	187	21
38382	249	186	21
38383	249	185	21
38384	249	184	21
38385	249	183	21
38386	249	182	21
38387	249	181	21
38388	249	180	21
38389	249	179	20
38390	249	178	20
38391	249	177	20
38392	249	176	20
38393	249	175	20
38394	249	174	20
38395	249	173	20
38396	249	172	20
38397	249	171	20
38398	249	170	19
38399	249	169	19
38400	249	168	19
38401	249	167	19
38402	249	166	19
38403	249	165	19
38404	249	164	19
38405	249	163	19
38406	249	162	19
38407	249	161	18
38408	249	160	18
38409	249	159	18
38410	249	158	18
38411	249	157	18
38412	249	156	18
38413	249	155	18
38414	249	154	18
38415	249	153	18
38416	249	152	17
38417	249	151	17
38418	249	150	17
38419	249	149	17
38420	249	148	17
38421	249	147	17
38422	249	146	17
38423	249	145	17
38424	249	144	16
38425	249	143	16
38426	249	142	16
38427	249	141	16
38428	249	140	16
38429	249	139	16
38430	249	138	16
38431	249	137	16
38432	249	136	16
38433	249	135	15
38434	249	134	15
38435	249	133	15
38436	249	132	15
38437	249	131	15
38438	249	130	15
38439	249	129	15
38440	249	128	15
38441	249	127	15
38442	249	126	15
38443	249	125	14
38444	249	124	14
38445	249	123	14
38446	249	122	14
38447	249	121	14
38448	249	120	14
38449	249	119	14
38450	249	118	14
38451	249	117	14
38452	249	116	13
38453	249	115	13
38454	249	114	13
38455	249	113	13
38456	249	112	13
38457	249	111	13
38458	249	110	13
38459	249	109	13
38460	249	108	13
38461	249	107	12
38462	249	106	12
38463	249	105	12
38464	249	104	12
38465	249	103	12
38466	249	102	12
38467	249	101	12
38468	249	100	12
38469	249	99	12
38470	249	98	12
38471	249	97	11
38472	249	96	11
38473	249	95	11
38474	249	94	11
38475	249	93	11
38476	249	92	11
38477	249	91	11
38478	249	90	11
38479	249	89	11
38480	249	88	10
38481	249	87	10
38482	249	86	10
38483	249	85	10
38484	249	84	10
38485	249	83	10
38486	249	82	10
38487	249	81	10
38488	249	80	10
38489	249	79	9
38490	249	78	9
38491	249	77	9
38492	249	76	9
38493	249	75	9
38494	249	74	9
38495	249	73	9
38496	249	72	9
38497	249	71	9
38498	249	70	8
38499	249	69	8
38500	249	68	8
38501	249	67	8
38502	249	66	8
38503	249	65	8
38504	249	64	8
38505	249	63	8
38506	249	62	8
38507	249	61	8
38508	249	60	7
38509	249	59	7
38510	249	58	7
38511	249	57	7
38512	249	56	7
38513	249	55	7
38514	249	54	7
38515	249	53	7
38516	249	52	7
38517	249	51	6
38518	249	50	6
38519	249	49	6
38520	249	48	6
38521	249	47	6
38522	249	46	6
38523	249	45	6
38524	249	44	6
38525	249	43	6
38526	249	42	5
38527	249	41	5
38528	249	40	5
38529	249	39	5
38530	249	38	5
38531	249	37	5
38532	249	36	5
38533	249	35	5
38534	249	34	5
38535	249	33	4
38536	249	32	4
38537	249	31	4
38538	249	30	4
38539	249	29	4
38540	249	28	4
38541	249	27	4
38542	249	26	4
38543	249	25	4
38544	249	24	4
38545	249	23	3
38546	249	22	3
38547	249	21	3
38548	249	20	3
38549	249	19	3
38550	249	18	3
38551	249	17	3
38552	249	16	3
38553	249	15	3
38554	249	14	2
38555	249	13	2
38556	249	12	2
38557	249	11	2
38558	249	10	2
38559	249	9	2
38560	249	8	2
38561	249	7	2
38562	249	6	2
38563	249	5	1
38564	249	4	1
38565	249	3	1
38566	249	2	1
38567	249	1	1
38568	250	179	1
38569	250	178	1
38570	250	177	1
38571	250	176	1
38572	250	175	1
38573	250	174	1
38574	250	173	1
38575	250	172	1
38576	250	171	1
38577	250	170	1
38578	250	169	1
38579	250	168	1
38580	250	167	1
38581	250	166	1
38582	250	165	1
38583	250	164	1
38584	250	163	1
38585	250	162	1
38586	250	161	1
38587	250	160	1
38588	250	159	1
38589	250	158	1
38590	250	157	1
38591	250	156	1
38592	250	155	1
38593	250	154	1
38594	250	153	1
38595	250	152	1
38596	250	151	1
38597	250	150	1
38598	250	149	1
38599	250	148	1
38600	250	147	1
38601	250	146	1
38602	250	145	1
38603	250	144	1
38604	250	143	1
38605	250	142	1
38606	250	141	1
38607	250	140	1
38608	250	139	1
38609	250	138	1
38610	250	137	1
38611	250	136	1
38612	250	135	1
38613	250	134	1
38614	250	133	1
38615	250	132	1
38616	250	131	1
38617	250	130	1
38618	250	129	1
38619	250	128	1
38620	250	127	1
38621	250	126	1
38622	250	125	1
38623	250	124	1
38624	250	123	1
38625	250	122	1
38626	250	121	1
38627	250	120	1
38628	250	119	1
38629	250	118	1
38630	250	117	1
38631	250	116	1
38632	250	115	1
38633	250	114	1
38634	250	113	1
38635	250	112	1
38636	250	111	1
38637	250	110	1
38638	250	109	1
38639	250	108	1
38640	250	107	1
38641	250	106	1
38642	250	105	1
38643	250	104	1
38644	250	103	1
38645	250	102	1
38646	250	101	1
38647	250	100	1
38648	250	99	1
38649	250	98	1
38650	250	97	1
38651	250	96	1
38652	250	95	1
38653	250	94	1
38654	250	93	1
38655	250	92	1
38656	250	91	1
38657	250	90	1
38658	250	89	1
38659	250	88	1
38660	250	87	1
38661	250	86	1
38662	250	85	1
38663	250	84	1
38664	250	83	1
38665	250	82	1
38666	250	81	1
38667	250	80	1
38668	250	79	1
38669	250	78	1
38670	250	77	1
38671	250	76	1
38672	250	75	1
38673	250	74	1
38674	250	73	1
38675	250	72	1
38676	250	71	1
38677	250	70	1
38678	250	69	1
38679	250	68	1
38680	250	67	1
38681	250	66	1
38682	250	65	1
38683	250	64	1
38684	250	63	1
38685	250	62	1
38686	250	61	1
38687	250	60	1
38688	250	59	1
38689	250	58	1
38690	250	57	1
38691	250	56	1
38692	250	55	1
38693	250	54	1
38694	250	53	1
38695	250	52	1
38696	250	51	1
38697	250	50	1
38698	250	49	1
38699	250	48	1
38700	250	47	1
38701	250	46	1
38702	250	45	1
38703	250	44	1
38704	250	43	1
38705	250	42	1
38706	250	41	1
38707	250	40	1
38708	250	39	1
38709	250	38	1
38710	250	37	1
38711	250	36	1
38712	250	35	1
38713	250	34	1
38714	250	33	1
38715	250	32	1
38716	250	31	1
38717	250	30	1
38718	250	29	1
38719	250	28	1
38720	250	27	1
38721	250	26	1
38722	250	25	1
38723	250	24	1
38724	250	23	1
38725	250	22	1
38726	250	21	1
38727	250	20	1
38728	250	19	1
38729	250	18	1
38730	250	17	1
38731	250	16	1
38732	250	15	1
38733	250	14	1
38734	250	13	1
38735	250	12	1
38736	250	11	1
38737	250	10	1
38738	250	9	1
38739	250	8	1
38740	250	7	1
38741	250	6	1
38742	250	5	1
38743	250	4	1
38744	250	3	1
38745	250	2	1
38746	250	1	1
38747	250	0	1
38748	251	29	1
38749	251	28	1
38750	251	27	1
38751	251	26	1
38752	251	25	1
38753	251	24	1
38754	251	23	1
38755	251	22	1
38756	251	21	1
38757	251	20	1
38758	251	19	1
38759	251	18	1
38760	251	17	1
38761	251	16	1
38762	251	15	1
38763	251	14	1
38764	251	13	1
38765	251	12	1
38766	251	11	1
38767	251	10	1
38768	251	9	1
38769	251	8	1
38770	251	7	1
38771	251	6	1
38772	251	5	1
38773	251	4	1
38774	251	3	1
38775	251	2	1
38776	251	1	1
38777	252	110	1
38778	252	109	1
38779	252	108	1
38780	252	107	1
38781	252	106	1
38782	252	105	1
38783	252	104	1
38784	252	103	1
38785	252	102	1
38786	252	101	1
38787	252	100	1
38788	252	99	1
38789	252	98	1
38790	252	97	1
38791	252	96	1
38792	252	95	1
38793	252	94	1
38794	252	93	1
38795	252	92	1
38796	252	91	1
38797	252	90	1
38798	252	89	1
38799	252	88	1
38800	252	87	1
38801	252	86	1
38802	252	85	1
38803	252	84	1
38804	252	83	1
38805	252	82	1
38806	252	81	1
38807	252	80	1
38808	252	79	1
38809	252	78	1
38810	252	77	1
38811	252	76	1
38812	252	75	1
38813	252	74	1
38814	252	73	1
38815	252	72	1
38816	252	71	1
38817	252	70	1
38818	252	69	1
38819	252	68	1
38820	252	67	1
38821	252	66	1
38822	252	65	1
38823	252	64	1
38824	252	63	1
38825	252	62	1
38826	252	61	1
38827	252	60	1
38828	252	59	1
38829	252	58	1
38830	252	57	1
38831	252	56	1
38832	252	55	1
38833	252	54	1
38834	252	53	1
38835	252	52	1
38836	252	51	1
38837	252	50	1
38838	252	49	1
38839	252	48	1
38840	252	47	1
38841	252	46	1
38842	252	45	1
38843	252	44	1
38844	252	43	1
38845	252	42	1
38846	252	41	1
38847	252	40	1
38848	252	39	1
38849	252	38	1
38850	252	37	1
38851	252	36	1
38852	252	35	1
38853	252	34	1
38854	252	33	1
38855	252	32	1
38856	252	31	1
38857	252	30	1
38858	252	29	1
38859	252	28	1
38860	252	27	1
38861	252	26	1
38862	252	25	1
38863	252	24	1
38864	252	23	1
38865	252	22	1
38866	252	21	1
38867	252	20	1
38868	252	19	1
38869	252	18	1
38870	252	17	1
38871	252	16	1
38872	252	15	1
38873	252	14	1
38874	252	13	1
38875	252	12	1
38876	252	11	1
38877	252	10	1
38878	252	9	1
38879	252	8	1
38880	252	7	1
38881	252	6	1
38882	252	5	1
38883	252	4	1
38884	252	3	1
38885	252	2	1
38886	252	1	1
38887	253	38	1
38888	253	37	1
38889	253	36	1
38890	253	35	1
38891	253	34	1
38892	253	33	1
38893	253	32	1
38894	253	31	1
38895	253	30	1
38896	253	29	1
38897	253	28	1
38898	253	27	1
38899	253	26	1
38900	253	25	1
38901	253	24	1
38902	253	23	1
38903	253	22	1
38904	253	21	1
38905	253	20	1
38906	253	19	1
38907	253	18	1
38908	253	17	1
38909	253	16	1
38910	253	15	1
38911	253	14	1
38912	253	13	1
38913	253	12	1
38914	253	11	1
38915	253	10	1
38916	253	9	1
38917	253	8	1
38918	253	7	1
38919	253	6	1
38920	253	5	1
38921	253	4	1
38922	253	3	1
38923	253	2	1
38924	253	1	1
38925	254	186	1
38926	254	185	1
38927	254	184	1
38928	254	183	1
38929	254	182	1
38930	254	181	1
38931	254	180	1
38932	254	179	1
38933	254	178	1
38934	254	177	1
38935	254	176	1
38936	254	175	1
38937	254	174	1
38938	254	173	1
38939	254	172	1
38940	254	171	1
38941	254	170	1
38942	254	169	1
38943	254	168	1
38944	254	167	1
38945	254	166	1
38946	254	165	1
38947	254	164	1
38948	254	163	1
38949	254	162	1
38950	254	161	1
38951	254	160	1
38952	254	159	1
38953	254	158	1
38954	254	157	1
38955	254	156	1
38956	254	155	1
38957	254	154	1
38958	254	153	1
38959	254	152	1
38960	254	151	1
38961	254	150	1
38962	254	149	1
38963	254	148	1
38964	254	147	1
38965	254	146	1
38966	254	145	1
38967	254	144	1
38968	254	143	1
38969	254	142	1
38970	254	141	1
38971	254	140	1
38972	254	139	1
38973	254	138	1
38974	254	137	1
38975	254	136	1
38976	254	135	1
38977	254	134	1
38978	254	133	1
38979	254	132	1
38980	254	131	1
38981	254	130	1
38982	254	129	1
38983	254	128	1
38984	254	127	1
38985	254	126	1
38986	254	125	1
38987	254	124	1
38988	254	123	1
38989	254	122	1
38990	254	121	1
38991	254	120	1
38992	254	119	1
38993	254	118	1
38994	254	117	1
38995	254	116	1
38996	254	115	1
38997	254	114	1
38998	254	113	1
38999	254	112	1
39000	254	111	1
39001	254	110	1
39002	254	109	1
39003	254	108	1
39004	254	107	1
39005	254	106	1
39006	254	105	1
39007	254	104	1
39008	254	103	1
39009	254	102	1
39010	254	101	1
39011	254	100	1
39012	254	99	1
39013	254	98	1
39014	254	97	1
39015	254	96	1
39016	254	95	1
39017	254	94	1
39018	254	93	1
39019	254	92	1
39020	254	91	1
39021	254	90	1
39022	254	89	1
39023	254	88	1
39024	254	87	1
39025	254	86	1
39026	254	85	1
39027	254	84	1
39028	254	83	1
39029	254	82	1
39030	254	81	1
39031	254	80	1
39032	254	79	1
39033	254	78	1
39034	254	77	1
39035	254	76	1
39036	254	75	1
39037	254	74	1
39038	254	73	1
39039	254	72	1
39040	254	71	1
39041	254	70	1
39042	254	69	1
39043	254	68	1
39044	254	67	1
39045	254	66	1
39046	254	65	1
39047	254	64	1
39048	254	63	1
39049	254	62	1
39050	254	61	1
39051	254	60	1
39052	254	59	1
39053	254	58	1
39054	254	57	1
39055	254	56	1
39056	254	55	1
39057	254	54	1
39058	254	53	1
39059	254	52	1
39060	254	51	1
39061	254	50	1
39062	254	49	1
39063	254	48	1
39064	254	47	1
39065	254	46	1
39066	254	45	1
39067	254	44	1
39068	254	43	1
39069	254	42	1
39070	254	41	1
39071	254	40	1
39072	254	39	1
39073	254	38	1
39074	254	37	1
39075	254	36	1
39076	254	35	1
39077	254	34	1
39078	254	33	1
39079	254	32	1
39080	254	31	1
39081	254	30	1
39082	254	29	1
39083	254	28	1
39084	254	27	1
39085	254	26	1
39086	254	25	1
39087	254	24	1
39088	254	23	1
39089	254	22	1
39090	254	21	1
39091	254	20	1
39092	254	19	1
39093	254	18	1
39094	254	17	1
39095	254	16	1
39096	254	15	1
39097	254	14	1
39098	254	13	1
39099	254	12	1
39100	254	11	1
39101	254	10	1
39102	254	9	1
39103	254	8	1
39104	254	7	1
39105	254	6	1
39106	254	5	1
39107	254	4	1
39108	254	3	1
39109	254	2	1
39110	254	1	1
39111	255	160	1
39112	255	159	1
39113	255	158	1
39114	255	157	1
39115	255	156	1
39116	255	155	1
39117	255	154	1
39118	255	153	1
39119	255	152	1
39120	255	151	1
39121	255	150	1
39122	255	149	1
39123	255	148	1
39124	255	147	1
39125	255	146	1
39126	255	145	1
39127	255	144	1
39128	255	143	1
39129	255	142	1
39130	255	141	1
39131	255	140	1
39132	255	139	1
39133	255	138	1
39134	255	137	1
39135	255	136	1
39136	255	135	1
39137	255	134	1
39138	255	133	1
39139	255	132	1
39140	255	131	1
39141	255	130	1
39142	255	129	1
39143	255	128	1
39144	255	127	1
39145	255	126	1
39146	255	125	1
39147	255	124	1
39148	255	123	1
39149	255	122	1
39150	255	121	1
39151	255	120	1
39152	255	119	1
39153	255	118	1
39154	255	117	1
39155	255	116	1
39156	255	115	1
39157	255	114	1
39158	255	113	1
39159	255	112	1
39160	255	111	1
39161	255	110	1
39162	255	109	1
39163	255	108	1
39164	255	107	1
39165	255	106	1
39166	255	105	1
39167	255	104	1
39168	255	103	1
39169	255	102	1
39170	255	101	1
39171	255	100	1
39172	255	99	1
39173	255	98	1
39174	255	97	1
39175	255	96	1
39176	255	95	1
39177	255	94	1
39178	255	93	1
39179	255	92	1
39180	255	91	1
39181	255	90	1
39182	255	89	1
39183	255	88	1
39184	255	87	1
39185	255	86	1
39186	255	85	1
39187	255	84	1
39188	255	83	1
39189	255	82	1
39190	255	81	1
39191	255	80	1
39192	255	79	1
39193	255	78	1
39194	255	77	1
39195	255	76	1
39196	255	75	1
39197	255	74	1
39198	255	73	1
39199	255	72	1
39200	255	71	1
39201	255	70	1
39202	255	69	1
39203	255	68	1
39204	255	67	1
39205	255	66	1
39206	255	65	1
39207	255	64	1
39208	255	63	1
39209	255	62	1
39210	255	61	1
39211	255	60	1
39212	255	59	1
39213	255	58	1
39214	255	57	1
39215	255	56	1
39216	255	55	1
39217	255	54	1
39218	255	53	1
39219	255	52	1
39220	255	51	1
39221	255	50	1
39222	255	49	1
39223	255	48	1
39224	255	47	1
39225	255	46	1
39226	255	45	1
39227	255	44	1
39228	255	43	1
39229	255	42	1
39230	255	41	1
39231	255	40	1
39232	255	39	1
39233	255	38	1
39234	255	37	1
39235	255	36	1
39236	255	35	1
39237	255	34	1
39238	255	33	1
39239	255	32	1
39240	255	31	1
39241	255	30	1
39242	255	29	1
39243	255	28	1
39244	255	27	1
39245	255	26	1
39246	255	25	1
39247	255	24	1
39248	255	23	1
39249	255	22	1
39250	255	21	1
39251	255	20	1
39252	255	19	1
39253	255	18	1
39254	255	17	1
39255	255	16	1
39256	255	15	1
39257	255	14	1
39258	255	13	1
39259	255	12	1
39260	255	11	1
39261	255	10	1
39262	255	9	1
39263	255	8	1
39264	255	7	1
39265	255	6	1
39266	255	5	1
39267	255	4	1
39268	255	3	1
39269	255	2	1
39270	255	1	1
39271	256	96	3
39272	256	95	3
39273	256	94	3
39274	256	93	3
39275	256	92	3
39276	256	91	3
39277	256	90	3
39278	256	89	3
39279	256	88	3
39280	256	87	3
39281	256	86	3
39282	256	85	3
39283	256	84	3
39284	256	83	3
39285	256	82	3
39286	256	81	3
39287	256	80	3
39288	256	79	2
39289	256	78	2
39290	256	77	2
39291	256	76	2
39292	256	75	2
39293	256	74	2
39294	256	73	2
39295	256	72	2
39296	256	71	2
39297	256	70	2
39298	256	69	2
39299	256	68	2
39300	256	67	2
39301	256	66	2
39302	256	65	2
39303	256	64	2
39304	256	63	2
39305	256	62	2
39306	256	61	2
39307	256	60	2
39308	256	59	2
39309	256	58	2
39310	256	57	2
39311	256	56	2
39312	256	55	2
39313	256	54	2
39314	256	53	2
39315	256	52	2
39316	256	51	2
39317	256	50	2
39318	256	49	1
39319	256	48	1
39320	256	47	1
39321	256	46	1
39322	256	45	1
39323	256	44	1
39324	256	43	1
39325	256	42	1
39326	256	41	1
39327	256	40	1
39328	256	39	1
39329	256	38	1
39330	256	37	1
39331	256	36	1
39332	256	35	1
39333	256	34	1
39334	256	33	1
39335	256	32	1
39336	256	31	1
39337	256	30	1
39338	256	29	1
39339	256	28	1
39340	256	27	1
39341	256	26	1
39342	256	25	1
39343	256	24	1
39344	256	23	1
39345	256	22	1
39346	256	21	1
39347	256	20	1
39348	256	19	1
39349	256	18	1
39350	256	17	1
39351	256	16	1
39352	256	15	1
39353	256	14	1
39354	256	13	1
39355	256	12	1
39356	256	11	1
39357	256	10	1
39358	256	9	1
39359	256	8	1
39360	256	7	1
39361	256	6	1
39362	256	5	1
39363	256	4	1
39364	256	3	1
39365	256	2	1
39366	256	1	1
39367	257	127	3
39368	257	126	3
39369	257	125	3
39370	257	124	3
39371	257	123	3
39372	257	122	3
39373	257	121	3
39374	257	120	3
39375	257	119	3
39376	257	118	3
39377	257	117	3
39378	257	116	3
39379	257	115	3
39380	257	114	3
39381	257	113	3
39382	257	112	3
39383	257	111	3
39384	257	110	3
39385	257	109	3
39386	257	108	3
39387	257	107	3
39388	257	106	3
39389	257	105	3
39390	257	104	3
39391	257	103	3
39392	257	102	3
39393	257	101	3
39394	257	100	3
39395	257	99	3
39396	257	98	3
39397	257	97	3
39398	257	96	3
39399	257	95	3
39400	257	94	3
39401	257	93	3
39402	257	92	3
39403	257	91	3
39404	257	90	3
39405	257	89	3
39406	257	88	3
39407	257	87	3
39408	257	86	3
39409	257	85	3
39410	257	84	3
39411	257	83	3
39412	257	82	3
39413	257	81	3
39414	257	80	3
39415	257	79	3
39416	257	78	3
39417	257	77	3
39418	257	76	3
39419	257	75	3
39420	257	74	3
39421	257	73	3
39422	257	72	3
39423	257	71	3
39424	257	70	3
39425	257	69	3
39426	257	68	3
39427	257	67	3
39428	257	66	3
39429	257	65	3
39430	257	64	3
39431	257	63	3
39432	257	62	3
39433	257	61	3
39434	257	60	3
39435	257	59	3
39436	257	58	3
39437	257	57	3
39438	257	56	3
39439	257	55	3
39440	257	54	3
39441	257	53	3
39442	257	52	3
39443	257	51	3
39444	257	50	2
39445	257	49	2
39446	257	48	2
39447	257	47	2
39448	257	46	2
39449	257	45	2
39450	257	44	2
39451	257	43	2
39452	257	42	2
39453	257	41	2
39454	257	40	2
39455	257	39	2
39456	257	38	2
39457	257	37	2
39458	257	36	2
39459	257	35	2
39460	257	34	2
39461	257	33	2
39462	257	32	2
39463	257	31	2
39464	257	30	1
39465	257	29	1
39466	257	28	1
39467	257	27	1
39468	257	26	1
39469	257	25	1
39470	257	24	1
39471	257	23	1
39472	257	22	1
39473	257	21	1
39474	257	20	1
39475	257	19	1
39476	257	18	1
39477	257	17	1
39478	257	16	1
39479	257	15	1
39480	257	14	1
39481	257	13	1
39482	257	12	1
39483	257	11	1
39484	257	10	1
39485	257	9	1
39486	257	8	1
39487	257	7	1
39488	257	6	1
39489	257	5	1
39490	257	4	1
39491	257	3	1
39492	257	2	1
39493	257	1	1
39494	258	101	2
39495	258	100	2
39496	258	99	2
39497	258	98	2
39498	258	97	2
39499	258	96	2
39500	258	95	2
39501	258	94	2
39502	258	93	2
39503	258	92	2
39504	258	91	2
39505	258	90	2
39506	258	89	2
39507	258	88	2
39508	258	87	2
39509	258	86	2
39510	258	85	2
39511	258	84	2
39512	258	83	2
39513	258	82	2
39514	258	81	2
39515	258	80	2
39516	258	79	2
39517	258	78	2
39518	258	77	2
39519	258	76	2
39520	258	75	2
39521	258	74	2
39522	258	73	2
39523	258	72	2
39524	258	71	2
39525	258	70	2
39526	258	69	2
39527	258	68	2
39528	258	67	2
39529	258	66	2
39530	258	65	2
39531	258	64	2
39532	258	63	2
39533	258	62	2
39534	258	61	2
39535	258	60	2
39536	258	59	2
39537	258	58	1
39538	258	57	1
39539	258	56	1
39540	258	55	1
39541	258	54	1
39542	258	53	1
39543	258	52	1
39544	258	51	1
39545	258	50	1
39546	258	49	1
39547	258	48	1
39548	258	47	1
39549	258	46	1
39550	258	45	1
39551	258	44	1
39552	258	43	1
39553	258	42	1
39554	258	41	1
39555	258	40	1
39556	258	39	1
39557	258	38	1
39558	258	37	1
39559	258	36	1
39560	258	35	1
39561	258	34	1
39562	258	33	1
39563	258	32	1
39564	258	31	1
39565	258	30	1
39566	258	29	1
39567	258	28	1
39568	258	27	1
39569	258	26	1
39570	258	25	1
39571	258	24	1
39572	258	23	1
39573	258	22	1
39574	258	21	1
39575	258	20	1
39576	258	19	1
39577	258	18	1
39578	258	17	1
39579	258	16	1
39580	258	15	1
39581	258	14	1
39582	258	13	1
39583	258	12	1
39584	258	11	1
39585	258	10	1
39586	258	9	1
39587	258	8	1
39588	258	7	1
39589	258	6	1
39590	258	5	1
39591	258	4	1
39592	258	3	1
39593	258	2	1
39594	258	1	1
39595	259	56	2
39596	259	55	2
39597	259	54	2
39598	259	53	2
39599	259	52	2
39600	259	51	2
39601	259	50	2
39602	259	49	2
39603	259	48	2
39604	259	47	2
39605	259	46	2
39606	259	45	2
39607	259	44	2
39608	259	43	2
39609	259	42	2
39610	259	41	2
39611	259	40	2
39612	259	39	2
39613	259	38	1
39614	259	37	1
39615	259	36	1
39616	259	35	1
39617	259	34	1
39618	259	33	1
39619	259	32	1
39620	259	31	1
39621	259	30	1
39622	259	29	1
39623	259	28	1
39624	259	27	1
39625	259	26	1
39626	259	25	1
39627	259	24	1
39628	259	23	1
39629	259	22	1
39630	259	21	1
39631	259	20	1
39632	259	19	1
39633	259	18	1
39634	259	17	1
39635	259	16	1
39636	259	15	1
39637	259	14	1
39638	259	13	1
39639	259	12	1
39640	259	11	1
39641	259	10	1
39642	259	9	1
39643	259	8	1
39644	259	7	1
39645	259	6	1
39646	259	5	1
39647	259	4	1
39648	259	3	1
39649	259	2	1
39650	259	1	1
39651	260	34	1
39652	260	33	1
39653	260	32	1
39654	260	31	1
39655	260	30	1
39656	260	29	1
39657	260	28	1
39658	260	27	1
39659	260	26	1
39660	260	25	1
39661	260	24	1
39662	260	23	1
39663	260	22	1
39664	260	21	1
39665	260	20	1
39666	260	19	1
39667	260	18	1
39668	260	17	1
39669	260	16	1
39670	260	15	1
39671	260	14	1
39672	260	13	1
39673	260	12	1
39674	260	11	1
39675	260	10	1
39676	260	9	1
39677	260	8	1
39678	260	7	1
39679	260	6	1
39680	260	5	1
39681	260	4	1
39682	260	3	1
39683	260	2	1
39684	260	1	1
39685	261	85	1
39686	261	84	1
39687	261	83	1
39688	261	82	1
39689	261	81	1
39690	261	80	1
39691	261	79	1
39692	261	78	1
39693	261	77	1
39694	261	76	1
39695	261	75	1
39696	261	74	1
39697	261	73	1
39698	261	72	1
39699	261	71	1
39700	261	70	1
39701	261	69	1
39702	261	68	1
39703	261	67	1
39704	261	66	1
39705	261	65	1
39706	261	64	1
39707	261	63	1
39708	261	62	1
39709	261	61	1
39710	261	60	1
39711	261	59	1
39712	261	58	1
39713	261	57	1
39714	261	56	1
39715	261	55	1
39716	261	54	1
39717	261	53	1
39718	261	52	1
39719	261	51	1
39720	261	50	1
39721	261	49	1
39722	261	48	1
39723	261	47	1
39724	261	46	1
39725	261	45	1
39726	261	44	1
39727	261	43	1
39728	261	42	1
39729	261	41	1
39730	261	40	1
39731	261	39	1
39732	261	38	1
39733	261	37	1
39734	261	36	1
39735	261	35	1
39736	261	34	1
39737	261	33	1
39738	261	32	1
39739	261	31	1
39740	261	30	1
39741	261	29	1
39742	261	28	1
39743	261	27	1
39744	261	26	1
39745	261	25	1
39746	261	24	1
39747	261	23	1
39748	261	22	1
39749	261	21	1
39750	261	20	1
39751	261	19	1
39752	261	18	1
39753	261	17	1
39754	261	16	1
39755	261	15	1
39756	261	14	1
39757	261	13	1
39758	261	12	1
39759	261	11	1
39760	261	10	1
39761	261	9	1
39762	261	8	1
39763	261	7	1
39764	261	6	1
39765	261	5	1
39766	261	4	1
39767	261	3	1
39768	261	2	1
39769	261	1	1
39770	262	145	9
39771	262	144	9
39772	262	143	9
39773	262	142	9
39774	262	141	9
39775	262	140	9
39776	262	139	9
39777	262	138	9
39778	262	137	9
39779	262	136	9
39780	262	135	9
39781	262	134	9
39782	262	133	9
39783	262	132	9
39784	262	131	9
39785	262	130	9
39786	262	129	9
39787	262	128	9
39788	262	127	9
39789	262	126	9
39790	262	125	9
39791	262	124	9
39792	262	123	9
39793	262	122	9
39794	262	121	9
39795	262	120	9
39796	262	119	9
39797	262	118	9
39798	262	117	9
39799	262	116	9
39800	262	115	9
39801	262	114	9
39802	262	113	9
39803	262	112	9
39804	262	111	9
39805	262	110	9
39806	262	109	9
39807	262	108	9
39808	262	107	9
39809	262	106	9
39810	262	105	9
39811	262	104	9
39812	262	103	9
39813	262	102	9
39814	262	101	8
39815	262	100	8
39816	262	99	8
39817	262	98	7
39818	262	97	7
39819	262	96	7
39820	262	95	7
39821	262	94	7
39822	262	93	7
39823	262	92	7
39824	262	91	7
39825	262	90	7
39826	262	89	7
39827	262	88	7
39828	262	87	7
39829	262	86	7
39830	262	85	7
39831	262	84	7
39832	262	83	7
39833	262	82	7
39834	262	81	6
39835	262	80	6
39836	262	79	6
39837	262	78	6
39838	262	77	6
39839	262	76	6
39840	262	75	6
39841	262	74	6
39842	262	73	6
39843	262	72	6
39844	262	71	6
39845	262	70	6
39846	262	69	6
39847	262	68	6
39848	262	67	5
39849	262	66	5
39850	262	65	5
39851	262	64	5
39852	262	63	5
39853	262	62	5
39854	262	61	5
39855	262	60	5
39856	262	59	4
39857	262	58	4
39858	262	57	4
39859	262	56	4
39860	262	55	4
39861	262	54	4
39862	262	53	4
39863	262	52	4
39864	262	51	4
39865	262	50	4
39866	262	49	4
39867	262	48	4
39868	262	47	4
39869	262	46	4
39870	262	45	4
39871	262	44	4
39872	262	43	4
39873	262	42	4
39874	262	41	4
39875	262	40	4
39876	262	39	4
39877	262	38	4
39878	262	37	3
39879	262	36	3
39880	262	35	3
39881	262	34	3
39882	262	33	3
39883	262	32	3
39884	262	31	3
39885	262	30	3
39886	262	29	3
39887	262	28	3
39888	262	27	3
39889	262	26	3
39890	262	25	3
39891	262	24	3
39892	262	23	3
39893	262	22	3
39894	262	21	2
39895	262	20	2
39896	262	19	2
39897	262	18	2
39898	262	17	2
39899	262	16	2
39900	262	15	2
39901	262	14	2
39902	262	13	2
39903	262	12	2
39904	262	11	2
39905	262	10	2
39906	262	9	2
39907	262	8	2
39908	262	7	2
39909	262	6	2
39910	262	5	1
39911	262	4	1
39912	262	3	1
39913	262	2	1
39914	262	1	1
39915	263	47	1
39916	263	46	1
39917	263	45	1
39918	263	44	1
39919	263	43	1
39920	263	42	1
39921	263	41	1
39922	263	40	1
39923	263	39	1
39924	263	38	1
39925	263	37	1
39926	263	36	1
39927	263	35	1
39928	263	34	1
39929	263	33	1
39930	263	32	1
39931	263	31	1
39932	263	30	1
39933	263	29	1
39934	263	28	1
39935	263	27	1
39936	263	26	1
39937	263	25	1
39938	263	24	1
39939	263	23	1
39940	263	22	1
39941	263	21	1
39942	263	20	1
39943	263	19	1
39944	263	18	1
39945	263	17	1
39946	263	16	1
39947	263	15	1
39948	263	14	1
39949	263	13	1
39950	263	12	1
39951	263	11	1
39952	263	10	1
39953	263	9	1
39954	263	8	1
39955	263	7	1
39956	263	6	1
39957	263	5	1
39958	263	4	1
39959	263	3	1
39960	263	2	1
39961	263	1	1
39962	264	50	1
39963	264	49	1
39964	264	48	1
39965	264	47	1
39966	264	46	1
39967	264	45	1
39968	264	44	1
39969	264	43	1
39970	264	42	1
39971	264	41	1
39972	264	40	1
39973	264	39	1
39974	264	38	1
39975	264	37	1
39976	264	36	1
39977	264	35	1
39978	264	34	1
39979	264	33	1
39980	264	32	1
39981	264	31	1
39982	264	30	1
39983	264	29	1
39984	264	28	1
39985	264	27	1
39986	264	26	1
39987	264	25	1
39988	264	24	1
39989	264	23	1
39990	264	22	1
39991	264	21	1
39992	264	20	1
39993	264	19	1
39994	264	18	1
39995	264	17	1
39996	264	16	1
39997	264	15	1
39998	264	14	1
39999	264	13	1
40000	264	12	1
40001	264	11	1
40002	264	10	1
40003	264	9	1
40004	264	8	1
40005	264	7	1
40006	264	6	1
40007	264	5	1
40008	264	4	1
40009	264	3	1
40010	264	2	1
40011	264	1	1
40012	265	94	2
40013	265	93	2
40014	265	92	2
40015	265	91	2
40016	265	90	2
40017	265	89	2
40018	265	88	2
40019	265	87	2
40020	265	86	2
40021	265	85	2
40022	265	84	2
40023	265	83	2
40024	265	82	2
40025	265	81	2
40026	265	80	2
40027	265	79	2
40028	265	78	2
40029	265	77	2
40030	265	76	2
40031	265	75	2
40032	265	74	2
40033	265	73	2
40034	265	72	2
40035	265	71	2
40036	265	70	2
40037	265	69	2
40038	265	68	2
40039	265	67	2
40040	265	66	2
40041	265	65	2
40042	265	64	2
40043	265	63	2
40044	265	62	2
40045	265	61	2
40046	265	60	1
40047	265	59	1
40048	265	58	1
40049	265	57	1
40050	265	56	1
40051	265	55	1
40052	265	54	1
40053	265	53	1
40054	265	52	1
40055	265	51	1
40056	265	50	1
40057	265	49	1
40058	265	48	1
40059	265	47	1
40060	265	46	1
40061	265	45	1
40062	265	44	1
40063	265	43	1
40064	265	42	1
40065	265	41	1
40066	265	40	1
40067	265	39	1
40068	265	38	1
40069	265	37	1
40070	265	36	1
40071	265	35	1
40072	265	34	1
40073	265	33	1
40074	265	32	1
40075	265	31	1
40076	265	30	1
40077	265	29	1
40078	265	28	1
40079	265	27	1
40080	265	26	1
40081	265	25	1
40082	265	24	1
40083	265	23	1
40084	265	22	1
40085	265	21	1
40086	265	20	1
40087	265	19	1
40088	265	18	1
40089	265	17	1
40090	265	16	1
40091	265	15	1
40092	265	14	1
40093	265	13	1
40094	265	12	1
40095	265	11	1
40096	265	10	1
40097	265	9	1
40098	265	8	1
40099	265	7	1
40100	265	6	1
40101	265	5	1
40102	265	4	1
40103	265	3	1
40104	265	2	1
40105	265	1	1
40106	266	80	1
40107	266	79	1
40108	266	78	1
40109	266	77	1
40110	266	76	1
40111	266	75	1
40112	266	74	1
40113	266	73	1
40114	266	72	1
40115	266	71	1
40116	266	70	1
40117	266	69	1
40118	266	68	1
40119	266	67	1
40120	266	66	1
40121	266	65	1
40122	266	64	1
40123	266	63	1
40124	266	62	1
40125	266	61	1
40126	266	60	1
40127	266	59	1
40128	266	58	1
40129	266	57	1
40130	266	56	1
40131	266	55	1
40132	266	54	1
40133	266	53	1
40134	266	52	1
40135	266	51	1
40136	266	50	1
40137	266	49	1
40138	266	48	1
40139	266	47	1
40140	266	46	1
40141	266	45	1
40142	266	44	1
40143	266	43	1
40144	266	42	1
40145	266	41	1
40146	266	40	1
40147	266	39	1
40148	266	38	1
40149	266	37	1
40150	266	36	1
40151	266	35	1
40152	266	34	1
40153	266	33	1
40154	266	32	1
40155	266	31	1
40156	266	30	1
40157	266	29	1
40158	266	28	1
40159	266	27	1
40160	266	26	1
40161	266	25	1
40162	266	24	1
40163	266	23	1
40164	266	22	1
40165	266	21	1
40166	266	20	1
40167	266	19	1
40168	266	18	1
40169	266	17	1
40170	266	16	1
40171	266	15	1
40172	266	14	1
40173	266	13	1
40174	266	12	1
40175	266	11	1
40176	266	10	1
40177	266	9	1
40178	266	8	1
40179	266	7	1
40180	266	6	1
40181	266	5	1
40182	266	4	1
40183	266	3	1
40184	266	2	1
40185	266	1	1
40186	266	0	1
40187	267	72	2
40188	267	71	2
40189	267	70	2
40190	267	69	2
40191	267	68	2
40192	267	67	2
40193	267	66	2
40194	267	65	2
40195	267	64	2
40196	267	63	2
40197	267	62	2
40198	267	61	2
40199	267	60	2
40200	267	59	2
40201	267	58	2
40202	267	57	2
40203	267	56	2
40204	267	55	2
40205	267	54	2
40206	267	53	2
40207	267	52	2
40208	267	51	2
40209	267	50	2
40210	267	49	2
40211	267	48	2
40212	267	47	2
40213	267	46	2
40214	267	45	2
40215	267	44	2
40216	267	43	1
40217	267	42	1
40218	267	41	1
40219	267	40	1
40220	267	39	1
40221	267	38	1
40222	267	37	1
40223	267	36	1
40224	267	35	1
40225	267	34	1
40226	267	33	1
40227	267	32	1
40228	267	31	1
40229	267	30	1
40230	267	29	1
40231	267	28	1
40232	267	27	1
40233	267	26	1
40234	267	25	1
40235	267	24	1
40236	267	23	1
40237	267	22	1
40238	267	21	1
40239	267	20	1
40240	267	19	1
40241	267	18	1
40242	267	17	1
40243	267	16	1
40244	267	15	1
40245	267	14	1
40246	267	13	1
40247	267	12	1
40248	267	11	1
40249	267	10	1
40250	267	9	1
40251	267	8	1
40252	267	7	1
40253	267	6	1
40254	267	5	1
40255	267	4	1
40256	267	3	1
40257	267	2	1
40258	267	1	1
40259	268	17	2
40260	268	16	2
40261	268	15	2
40262	268	14	2
40263	268	13	2
40264	268	12	2
40265	268	11	2
40266	268	10	2
40267	268	9	2
40268	268	8	2
40269	268	7	1
40270	268	6	1
40271	268	5	1
40272	268	4	1
40273	268	3	1
40274	268	2	1
40275	268	1	1
40276	269	80	2
40277	269	79	2
40278	269	78	2
40279	269	77	2
40280	269	76	2
40281	269	75	2
40282	269	74	2
40283	269	73	2
40284	269	72	2
40285	269	71	2
40286	269	70	2
40287	269	69	2
40288	269	68	2
40289	269	67	2
40290	269	66	2
40291	269	65	2
40292	269	64	2
40293	269	63	2
40294	269	62	2
40295	269	61	2
40296	269	60	2
40297	269	59	2
40298	269	58	2
40299	269	57	2
40300	269	56	2
40301	269	55	2
40302	269	54	2
40303	269	53	2
40304	269	52	2
40305	269	51	2
40306	269	50	2
40307	269	49	2
40308	269	48	2
40309	269	47	2
40310	269	46	1
40311	269	45	1
40312	269	44	1
40313	269	43	1
40314	269	42	1
40315	269	41	1
40316	269	40	1
40317	269	39	1
40318	269	38	1
40319	269	37	1
40320	269	36	1
40321	269	35	1
40322	269	34	1
40323	269	33	1
40324	269	32	1
40325	269	31	1
40326	269	30	1
40327	269	29	1
40328	269	28	1
40329	269	27	1
40330	269	26	1
40331	269	25	1
40332	269	24	1
40333	269	23	1
40334	269	22	1
40335	269	21	1
40336	269	20	1
40337	269	19	1
40338	269	18	1
40339	269	17	1
40340	269	16	1
40341	269	15	1
40342	269	14	1
40343	269	13	1
40344	269	12	1
40345	269	11	1
40346	269	10	1
40347	269	9	1
40348	269	8	1
40349	269	7	1
40350	269	6	1
40351	269	5	1
40352	269	4	1
40353	269	3	1
40354	269	2	1
40355	269	1	1
40356	270	58	2
40357	270	57	2
40358	270	56	2
40359	270	55	2
40360	270	54	2
40361	270	53	2
40362	270	52	2
40363	270	51	2
40364	270	50	2
40365	270	49	2
40366	270	48	2
40367	270	47	2
40368	270	46	2
40369	270	45	2
40370	270	44	2
40371	270	43	2
40372	270	42	2
40373	270	41	2
40374	270	40	1
40375	270	39	1
40376	270	38	1
40377	270	37	1
40378	270	36	1
40379	270	35	1
40380	270	34	1
40381	270	33	1
40382	270	32	1
40383	270	31	1
40384	270	30	1
40385	270	29	1
40386	270	28	1
40387	270	27	1
40388	270	26	1
40389	270	25	1
40390	270	24	1
40391	270	23	1
40392	270	22	1
40393	270	21	1
40394	270	20	1
40395	270	19	1
40396	270	18	1
40397	270	17	1
40398	270	16	1
40399	270	15	1
40400	270	14	1
40401	270	13	1
40402	270	12	1
40403	270	11	1
40404	270	10	1
40405	270	9	1
40406	270	8	1
40407	270	7	1
40408	270	6	1
40409	270	5	1
40410	270	4	1
40411	270	3	1
40412	270	2	1
40413	270	1	1
40414	271	88	3
40415	271	87	3
40416	271	86	3
40417	271	85	3
40418	271	84	3
40419	271	83	3
40420	271	82	3
40421	271	81	3
40422	271	80	2
40423	271	79	2
40424	271	78	2
40425	271	77	2
40426	271	76	2
40427	271	75	2
40428	271	74	2
40429	271	73	2
40430	271	72	2
40431	271	71	2
40432	271	70	2
40433	271	69	2
40434	271	68	2
40435	271	67	2
40436	271	66	2
40437	271	65	2
40438	271	64	2
40439	271	63	2
40440	271	62	2
40441	271	61	2
40442	271	60	2
40443	271	59	2
40444	271	58	2
40445	271	57	2
40446	271	56	2
40447	271	55	2
40448	271	54	2
40449	271	53	2
40450	271	52	2
40451	271	51	2
40452	271	50	2
40453	271	49	2
40454	271	48	2
40455	271	47	2
40456	271	46	2
40457	271	45	2
40458	271	44	2
40459	271	43	2
40460	271	42	2
40461	271	41	2
40462	271	40	1
40463	271	39	1
40464	271	38	1
40465	271	37	1
40466	271	36	1
40467	271	35	1
40468	271	34	1
40469	271	33	1
40470	271	32	1
40471	271	31	1
40472	271	30	1
40473	271	29	1
40474	271	28	1
40475	271	27	1
40476	271	26	1
40477	271	25	1
40478	271	24	1
40479	271	23	1
40480	271	22	1
40481	271	21	1
40482	271	20	1
40483	271	19	1
40484	271	18	1
40485	271	17	1
40486	271	16	1
40487	271	15	1
40488	271	14	1
40489	271	13	1
40490	271	12	1
40491	271	11	1
40492	271	10	1
40493	271	9	1
40494	271	8	1
40495	271	7	1
40496	271	6	1
40497	271	5	1
40498	271	4	1
40499	271	3	1
40500	271	2	1
40501	271	1	1
40502	272	380	1
40503	272	379	1
40504	272	378	1
40505	272	377	1
40506	272	376	1
40507	272	375	1
40508	272	374	1
40509	272	373	1
40510	272	372	1
40511	272	371	1
40512	272	370	1
40513	272	369	1
40514	272	368	1
40515	272	367	1
40516	272	366	1
40517	272	365	1
40518	272	364	1
40519	272	363	1
40520	272	362	1
40521	272	361	1
40522	272	360	1
40523	272	359	1
40524	272	358	1
40525	272	357	1
40526	272	356	1
40527	272	355	1
40528	272	354	1
40529	272	353	1
40530	272	352	1
40531	272	351	1
40532	272	350	1
40533	272	349	1
40534	272	348	1
40535	272	347	1
40536	272	346	1
40537	272	345	1
40538	272	344	1
40539	272	343	1
40540	272	342	1
40541	272	341	1
40542	272	340	1
40543	272	339	1
40544	272	338	1
40545	272	337	1
40546	272	336	1
40547	272	335	1
40548	272	334	1
40549	272	333	1
40550	272	332	1
40551	272	331	1
40552	272	330	1
40553	272	329	1
40554	272	328	1
40555	272	327	1
40556	272	326	1
40557	272	325	1
40558	272	324	1
40559	272	323	1
40560	272	322	1
40561	272	321	1
40562	272	320	1
40563	272	319	1
40564	272	318	1
40565	272	317	1
40566	272	316	1
40567	272	315	1
40568	272	314	1
40569	272	313	1
40570	272	312	1
40571	272	311	1
40572	272	310	1
40573	272	309	1
40574	272	308	1
40575	272	307	1
40576	272	306	1
40577	272	305	1
40578	272	304	1
40579	272	303	1
40580	272	302	1
40581	272	301	1
40582	272	300	1
40583	272	299	1
40584	272	298	1
40585	272	297	1
40586	272	296	1
40587	272	295	1
40588	272	294	1
40589	272	293	1
40590	272	292	1
40591	272	291	1
40592	272	290	1
40593	272	289	1
40594	272	288	1
40595	272	287	1
40596	272	286	1
40597	272	285	1
40598	272	284	1
40599	272	283	1
40600	272	282	1
40601	272	281	1
40602	272	280	1
40603	272	279	1
40604	272	278	1
40605	272	277	1
40606	272	276	1
40607	272	275	1
40608	272	274	1
40609	272	273	1
40610	272	272	1
40611	272	271	1
40612	272	270	1
40613	272	269	1
40614	272	268	1
40615	272	267	1
40616	272	266	1
40617	272	265	1
40618	272	264	1
40619	272	263	1
40620	272	262	1
40621	272	261	1
40622	272	260	1
40623	272	259	1
40624	272	258	1
40625	272	257	1
40626	272	256	1
40627	272	255	1
40628	272	254	1
40629	272	253	1
40630	272	252	1
40631	272	251	1
40632	272	250	1
40633	272	249	1
40634	272	248	1
40635	272	247	1
40636	272	246	1
40637	272	245	1
40638	272	244	1
40639	272	243	1
40640	272	242	1
40641	272	241	1
40642	272	240	1
40643	272	239	1
40644	272	238	1
40645	272	237	1
40646	272	236	1
40647	272	235	1
40648	272	234	1
40649	272	233	1
40650	272	232	1
40651	272	231	1
40652	272	230	1
40653	272	229	1
40654	272	228	1
40655	272	227	1
40656	272	226	1
40657	272	225	1
40658	272	224	1
40659	272	223	1
40660	272	222	1
40661	272	221	1
40662	272	220	1
40663	272	219	1
40664	272	218	1
40665	272	217	1
40666	272	216	1
40667	272	215	1
40668	272	214	1
40669	272	213	1
40670	272	212	1
40671	272	211	1
40672	272	210	1
40673	272	209	1
40674	272	208	1
40675	272	207	1
40676	272	206	1
40677	272	205	1
40678	272	204	1
40679	272	203	1
40680	272	202	1
40681	272	201	1
40682	272	200	1
40683	272	199	1
40684	272	198	1
40685	272	197	1
40686	272	196	1
40687	272	195	1
40688	272	194	1
40689	272	193	1
40690	272	192	1
40691	272	191	1
40692	272	190	1
40693	272	189	1
40694	272	188	1
40695	272	187	1
40696	272	186	1
40697	272	185	1
40698	272	184	1
40699	272	183	1
40700	272	182	1
40701	272	181	1
40702	272	180	1
40703	272	179	1
40704	272	178	1
40705	272	177	1
40706	272	176	1
40707	272	175	1
40708	272	174	1
40709	272	173	1
40710	272	172	1
40711	272	171	1
40712	272	170	1
40713	272	169	1
40714	272	168	1
40715	272	167	1
40716	272	166	1
40717	272	165	1
40718	272	164	1
40719	272	163	1
40720	272	162	1
40721	272	161	1
40722	272	160	1
40723	272	159	1
40724	272	158	1
40725	272	157	1
40726	272	156	1
40727	272	155	1
40728	272	154	1
40729	272	153	1
40730	272	152	1
40731	272	151	1
40732	272	150	1
40733	272	149	1
40734	272	148	1
40735	272	147	1
40736	272	146	1
40737	272	145	1
40738	272	144	1
40739	272	143	1
40740	272	142	1
40741	272	141	1
40742	272	140	1
40743	272	139	1
40744	272	138	1
40745	272	137	1
40746	272	136	1
40747	272	135	1
40748	272	134	1
40749	272	133	1
40750	272	132	1
40751	272	131	1
40752	272	130	1
40753	272	129	1
40754	272	128	1
40755	272	127	1
40756	272	126	1
40757	272	125	1
40758	272	124	1
40759	272	123	1
40760	272	122	1
40761	272	121	1
40762	272	120	1
40763	272	119	1
40764	272	118	1
40765	272	117	1
40766	272	116	1
40767	272	115	1
40768	272	114	1
40769	272	113	1
40770	272	112	1
40771	272	111	1
40772	272	110	1
40773	272	109	1
40774	272	108	1
40775	272	107	1
40776	272	106	1
40777	272	105	1
40778	272	104	1
40779	272	103	1
40780	272	102	1
40781	272	101	1
40782	272	100	1
40783	272	99	1
40784	272	98	1
40785	272	97	1
40786	272	96	1
40787	272	95	1
40788	272	94	1
40789	272	93	1
40790	272	92	1
40791	272	91	1
40792	272	90	1
40793	272	89	1
40794	272	88	1
40795	272	87	1
40796	272	86	1
40797	272	85	1
40798	272	84	1
40799	272	83	1
40800	272	82	1
40801	272	81	1
40802	272	80	1
40803	272	79	1
40804	272	78	1
40805	272	77	1
40806	272	76	1
40807	272	75	1
40808	272	74	1
40809	272	73	1
40810	272	72	1
40811	272	71	1
40812	272	70	1
40813	272	69	1
40814	272	68	1
40815	272	67	1
40816	272	66	1
40817	272	65	1
40818	272	64	1
40819	272	63	1
40820	272	62	1
40821	272	61	1
40822	272	60	1
40823	272	59	1
40824	272	58	1
40825	272	57	1
40826	272	56	1
40827	272	55	1
40828	272	54	1
40829	272	53	1
40830	272	52	1
40831	272	51	1
40832	272	50	1
40833	272	49	1
40834	272	48	1
40835	272	47	1
40836	272	46	1
40837	272	45	1
40838	272	44	1
40839	272	43	1
40840	272	42	1
40841	272	41	1
40842	272	40	1
40843	272	39	1
40844	272	38	1
40845	272	37	1
40846	272	36	1
40847	272	35	1
40848	272	34	1
40849	272	33	1
40850	272	32	1
40851	272	31	1
40852	272	30	1
40853	272	29	1
40854	272	28	1
40855	272	27	1
40856	272	26	1
40857	272	25	1
40858	272	24	1
40859	272	23	1
40860	272	22	1
40861	272	21	1
40862	272	20	1
40863	272	19	1
40864	272	18	1
40865	272	17	1
40866	272	16	1
40867	272	15	1
40868	272	14	1
40869	272	13	1
40870	272	12	1
40871	272	11	1
40872	272	10	1
40873	272	9	1
40874	272	8	1
40875	272	7	1
40876	272	6	1
40877	272	5	1
40878	272	4	1
40879	272	3	1
40880	272	2	1
40881	272	1	1
40882	272	0	1
40883	273	61	2
40884	273	60	2
40885	273	59	2
40886	273	58	2
40887	273	57	2
40888	273	56	2
40889	273	55	1
40890	273	54	1
40891	273	53	1
40892	273	52	1
40893	273	51	1
40894	273	50	1
40895	273	49	1
40896	273	48	1
40897	273	47	1
40898	273	46	1
40899	273	45	1
40900	273	44	1
40901	273	43	1
40902	273	42	1
40903	273	41	1
40904	273	40	1
40905	273	39	1
40906	273	38	1
40907	273	37	1
40908	273	36	1
40909	273	35	1
40910	273	34	1
40911	273	33	1
40912	273	32	1
40913	273	31	1
40914	273	30	1
40915	273	29	1
40916	273	28	1
40917	273	27	1
40918	273	26	1
40919	273	25	1
40920	273	24	1
40921	273	23	1
40922	273	22	1
40923	273	21	1
40924	273	20	1
40925	273	19	1
40926	273	18	1
40927	273	17	1
40928	273	16	1
40929	273	15	1
40930	273	14	1
40931	273	13	1
40932	273	12	1
40933	273	11	1
40934	273	10	1
40935	273	9	1
40936	273	8	1
40937	273	7	1
40938	273	6	1
40939	273	5	1
40940	273	4	1
40941	273	3	1
40942	273	2	1
40943	273	1	1
40944	274	81	3
40945	274	80	3
40946	274	79	3
40947	274	78	2
40948	274	77	2
40949	274	76	2
40950	274	75	2
40951	274	74	2
40952	274	73	2
40953	274	72	2
40954	274	71	2
40955	274	70	2
40956	274	69	2
40957	274	68	2
40958	274	67	2
40959	274	66	2
40960	274	65	2
40961	274	64	2
40962	274	63	2
40963	274	62	2
40964	274	61	2
40965	274	60	2
40966	274	59	2
40967	274	58	2
40968	274	57	2
40969	274	56	2
40970	274	55	2
40971	274	54	2
40972	274	53	2
40973	274	52	2
40974	274	51	2
40975	274	50	2
40976	274	49	2
40977	274	48	2
40978	274	47	2
40979	274	46	2
40980	274	45	2
40981	274	44	2
40982	274	43	2
40983	274	42	2
40984	274	41	1
40985	274	40	1
40986	274	39	1
40987	274	38	1
40988	274	37	1
40989	274	36	1
40990	274	35	1
40991	274	34	1
40992	274	33	1
40993	274	32	1
40994	274	31	1
40995	274	30	1
40996	274	29	1
40997	274	28	1
40998	274	27	1
40999	274	26	1
41000	274	25	1
41001	274	24	1
41002	274	23	1
41003	274	22	1
41004	274	21	1
41005	274	20	1
41006	274	19	1
41007	274	18	1
41008	274	17	1
41009	274	16	1
41010	274	15	1
41011	274	14	1
41012	274	13	1
41013	274	12	1
41014	274	11	1
41015	274	10	1
41016	274	9	1
41017	274	8	1
41018	274	7	1
41019	274	6	1
41020	274	5	1
41021	274	4	1
41022	274	3	1
41023	274	2	1
41024	274	1	1
41025	275	90	2
41026	275	89	2
41027	275	88	2
41028	275	87	2
41029	275	86	2
41030	275	85	2
41031	275	84	2
41032	275	83	2
41033	275	82	2
41034	275	81	2
41035	275	80	2
41036	275	79	2
41037	275	78	2
41038	275	77	2
41039	275	76	2
41040	275	75	2
41041	275	74	2
41042	275	73	2
41043	275	72	2
41044	275	71	2
41045	275	70	2
41046	275	69	2
41047	275	68	2
41048	275	67	2
41049	275	66	2
41050	275	65	1
41051	275	64	1
41052	275	63	1
41053	275	62	1
41054	275	61	1
41055	275	60	1
41056	275	59	1
41057	275	58	1
41058	275	57	1
41059	275	56	1
41060	275	55	1
41061	275	54	1
41062	275	53	1
41063	275	52	1
41064	275	51	1
41065	275	50	1
41066	275	49	1
41067	275	48	1
41068	275	47	1
41069	275	46	1
41070	275	45	1
41071	275	44	1
41072	275	43	1
41073	275	42	1
41074	275	41	1
41075	275	40	1
41076	275	39	1
41077	275	38	1
41078	275	37	1
41079	275	36	1
41080	275	35	1
41081	275	34	1
41082	275	33	1
41083	275	32	1
41084	275	31	1
41085	275	30	1
41086	275	29	1
41087	275	28	1
41088	275	27	1
41089	275	26	1
41090	275	25	1
41091	275	24	1
41092	275	23	1
41093	275	22	1
41094	275	21	1
41095	275	20	1
41096	275	19	1
41097	275	18	1
41098	275	17	1
41099	275	16	1
41100	275	15	1
41101	275	14	1
41102	275	13	1
41103	275	12	1
41104	275	11	1
41105	275	10	1
41106	275	9	1
41107	275	8	1
41108	275	7	1
41109	275	6	1
41110	275	5	1
41111	275	4	1
41112	275	3	1
41113	275	2	1
41114	275	1	1
41115	276	463	1
41116	276	462	1
41117	276	461	1
41118	276	460	1
41119	276	459	1
41120	276	458	1
41121	276	457	1
41122	276	456	1
41123	276	455	1
41124	276	454	1
41125	276	453	1
41126	276	452	1
41127	276	451	1
41128	276	450	1
41129	276	449	1
41130	276	448	1
41131	276	447	1
41132	276	446	1
41133	276	445	1
41134	276	444	1
41135	276	443	1
41136	276	442	1
41137	276	441	1
41138	276	440	1
41139	276	439	1
41140	276	438	1
41141	276	437	1
41142	276	436	1
41143	276	435	1
41144	276	434	1
41145	276	433	1
41146	276	432	1
41147	276	431	1
41148	276	430	1
41149	276	429	1
41150	276	428	1
41151	276	427	1
41152	276	426	1
41153	276	425	1
41154	276	424	1
41155	276	423	1
41156	276	422	1
41157	276	421	1
41158	276	420	1
41159	276	419	1
41160	276	418	1
41161	276	417	1
41162	276	416	1
41163	276	415	1
41164	276	414	1
41165	276	413	1
41166	276	412	1
41167	276	411	1
41168	276	410	1
41169	276	409	1
41170	276	408	1
41171	276	407	1
41172	276	406	1
41173	276	405	1
41174	276	404	1
41175	276	403	1
41176	276	402	1
41177	276	401	1
41178	276	400	1
41179	276	399	1
41180	276	398	1
41181	276	397	1
41182	276	396	1
41183	276	395	1
41184	276	394	1
41185	276	393	1
41186	276	392	1
41187	276	391	1
41188	276	390	1
41189	276	389	1
41190	276	388	1
41191	276	387	1
41192	276	386	1
41193	276	385	1
41194	276	384	1
41195	276	383	1
41196	276	382	1
41197	276	381	1
41198	276	380	1
41199	276	379	1
41200	276	378	1
41201	276	377	1
41202	276	376	1
41203	276	375	1
41204	276	374	1
41205	276	373	1
41206	276	372	1
41207	276	371	1
41208	276	370	1
41209	276	369	1
41210	276	368	1
41211	276	367	1
41212	276	366	1
41213	276	365	1
41214	276	364	1
41215	276	363	1
41216	276	362	1
41217	276	361	1
41218	276	360	1
41219	276	359	1
41220	276	358	1
41221	276	357	1
41222	276	356	1
41223	276	355	1
41224	276	354	1
41225	276	353	1
41226	276	352	1
41227	276	351	1
41228	276	350	1
41229	276	349	1
41230	276	348	1
41231	276	347	1
41232	276	346	1
41233	276	345	1
41234	276	344	1
41235	276	343	1
41236	276	342	1
41237	276	341	1
41238	276	340	1
41239	276	339	1
41240	276	338	1
41241	276	337	1
41242	276	336	1
41243	276	335	1
41244	276	334	1
41245	276	333	1
41246	276	332	1
41247	276	331	1
41248	276	330	1
41249	276	329	1
41250	276	328	1
41251	276	327	1
41252	276	326	1
41253	276	325	1
41254	276	324	1
41255	276	323	1
41256	276	322	1
41257	276	321	1
41258	276	320	1
41259	276	319	1
41260	276	318	1
41261	276	317	1
41262	276	316	1
41263	276	315	1
41264	276	314	1
41265	276	313	1
41266	276	312	1
41267	276	311	1
41268	276	310	1
41269	276	309	1
41270	276	308	1
41271	276	307	1
41272	276	306	1
41273	276	305	1
41274	276	304	1
41275	276	303	1
41276	276	302	1
41277	276	301	1
41278	276	300	1
41279	276	299	1
41280	276	298	1
41281	276	297	1
41282	276	296	1
41283	276	295	1
41284	276	294	1
41285	276	293	1
41286	276	292	1
41287	276	291	1
41288	276	290	1
41289	276	289	1
41290	276	288	1
41291	276	287	1
41292	276	286	1
41293	276	285	1
41294	276	284	1
41295	276	283	1
41296	276	282	1
41297	276	281	1
41298	276	280	1
41299	276	279	1
41300	276	278	1
41301	276	277	1
41302	276	276	1
41303	276	275	1
41304	276	274	1
41305	276	273	1
41306	276	272	1
41307	276	271	1
41308	276	270	1
41309	276	269	1
41310	276	268	1
41311	276	267	1
41312	276	266	1
41313	276	265	1
41314	276	264	1
41315	276	263	1
41316	276	262	1
41317	276	261	1
41318	276	260	1
41319	276	259	1
41320	276	258	1
41321	276	257	1
41322	276	256	1
41323	276	255	1
41324	276	254	1
41325	276	253	1
41326	276	252	1
41327	276	251	1
41328	276	250	1
41329	276	249	1
41330	276	248	1
41331	276	247	1
41332	276	246	1
41333	276	245	1
41334	276	244	1
41335	276	243	1
41336	276	242	1
41337	276	241	1
41338	276	240	1
41339	276	239	1
41340	276	238	1
41341	276	237	1
41342	276	236	1
41343	276	235	1
41344	276	234	1
41345	276	233	1
41346	276	232	1
41347	276	231	1
41348	276	230	1
41349	276	229	1
41350	276	228	1
41351	276	227	1
41352	276	226	1
41353	276	225	1
41354	276	224	1
41355	276	223	1
41356	276	222	1
41357	276	221	1
41358	276	220	1
41359	276	219	1
41360	276	218	1
41361	276	217	1
41362	276	216	1
41363	276	215	1
41364	276	214	1
41365	276	213	1
41366	276	212	1
41367	276	211	1
41368	276	210	1
41369	276	209	1
41370	276	208	1
41371	276	207	1
41372	276	206	1
41373	276	205	1
41374	276	204	1
41375	276	203	1
41376	276	202	1
41377	276	201	1
41378	276	200	1
41379	276	199	1
41380	276	198	1
41381	276	197	1
41382	276	196	1
41383	276	195	1
41384	276	194	1
41385	276	193	1
41386	276	192	1
41387	276	191	1
41388	276	190	1
41389	276	189	1
41390	276	188	1
41391	276	187	1
41392	276	186	1
41393	276	185	1
41394	276	184	1
41395	276	183	1
41396	276	182	1
41397	276	181	1
41398	276	180	1
41399	276	179	1
41400	276	178	1
41401	276	177	1
41402	276	176	1
41403	276	175	1
41404	276	174	1
41405	276	173	1
41406	276	172	1
41407	276	171	1
41408	276	170	1
41409	276	169	1
41410	276	168	1
41411	276	167	1
41412	276	166	1
41413	276	165	1
41414	276	164	1
41415	276	163	1
41416	276	162	1
41417	276	161	1
41418	276	160	1
41419	276	159	1
41420	276	158	1
41421	276	157	1
41422	276	156	1
41423	276	155	1
41424	276	154	1
41425	276	153	1
41426	276	152	1
41427	276	151	1
41428	276	150	1
41429	276	149	1
41430	276	148	1
41431	276	147	1
41432	276	146	1
41433	276	145	1
41434	276	144	1
41435	276	143	1
41436	276	142	1
41437	276	141	1
41438	276	140	1
41439	276	139	1
41440	276	138	1
41441	276	137	1
41442	276	136	1
41443	276	135	1
41444	276	134	1
41445	276	133	1
41446	276	132	1
41447	276	131	1
41448	276	130	1
41449	276	129	1
41450	276	127	1
41451	276	126	1
41452	276	125	1
41453	276	124	1
41454	276	123	1
41455	276	122	1
41456	276	121	1
41457	276	120	1
41458	276	119	1
41459	276	118	1
41460	276	117	1
41461	276	116	1
41462	276	115	1
41463	276	114	1
41464	276	113	1
41465	276	112	1
41466	276	111	1
41467	276	110	1
41468	276	109	1
41469	276	108	1
41470	276	107	1
41471	276	106	1
41472	276	105	1
41473	276	104	1
41474	276	103	1
41475	276	102	1
41476	276	101	1
41477	276	100	1
41478	276	99	1
41479	276	98	1
41480	276	97	1
41481	276	96	1
41482	276	95	1
41483	276	94	1
41484	276	93	1
41485	276	92	1
41486	276	91	1
41487	276	90	1
41488	276	89	1
41489	276	88	1
41490	276	87	1
41491	276	86	1
41492	276	85	1
41493	276	84	1
41494	276	83	1
41495	276	82	1
41496	276	81	1
41497	276	80	1
41498	276	79	1
41499	276	78	1
41500	276	77	1
41501	276	76	1
41502	276	75	1
41503	276	74	1
41504	276	73	1
41505	276	72	1
41506	276	71	1
41507	276	70	1
41508	276	69	1
41509	276	68	1
41510	276	67	1
41511	276	66	1
41512	276	65	1
41513	276	64	1
41514	276	63	1
41515	276	62	1
41516	276	61	1
41517	276	60	1
41518	276	59	1
41519	276	58	1
41520	276	57	1
41521	276	56	1
41522	276	55	1
41523	276	54	1
41524	276	53	1
41525	276	52	1
41526	276	51	1
41527	276	50	1
41528	276	49	1
41529	276	48	1
41530	276	47	1
41531	276	46	1
41532	276	45	1
41533	276	44	1
41534	276	43	1
41535	276	42	1
41536	276	41	1
41537	276	40	1
41538	276	39	1
41539	276	38	1
41540	276	37	1
41541	276	36	1
41542	276	35	1
41543	276	34	1
41544	276	33	1
41545	276	32	1
41546	276	31	1
41547	276	30	1
41548	276	29	1
41549	276	28	1
41550	276	27	1
41551	276	26	1
41552	276	25	1
41553	276	24	1
41554	276	23	1
41555	276	22	1
41556	276	21	1
41557	276	20	1
41558	276	19	1
41559	276	18	1
41560	276	17	1
41561	276	16	1
41562	276	15	1
41563	276	14	1
41564	276	13	1
41565	276	12	1
41566	276	11	1
41567	276	10	1
41568	276	9	1
41569	276	8	1
41570	276	7	1
41571	276	6	1
41572	276	5	1
41573	276	4	1
41574	276	3	1
41575	276	2	1
41576	276	1	1
41577	276	0	1
41578	277	1013	1
41579	277	1012	1
41580	277	1011	1
41581	277	1010	1
41582	277	1009	1
41583	277	1008	1
41584	277	1007	1
41585	277	1006	1
41586	277	1005	1
41587	277	1004	1
41588	277	1003	1
41589	277	1002	1
41590	277	1001	1
41591	277	1000	1
41592	277	999	1
41593	277	998	1
41594	277	997	1
41595	277	996	1
41596	277	995	1
41597	277	994	1
41598	277	993	1
41599	277	992	1
41600	277	991	1
41601	277	990	1
41602	277	989	1
41603	277	988	1
41604	277	987	1
41605	277	986	1
41606	277	985	1
41607	277	984	1
41608	277	983	1
41609	277	982	1
41610	277	981	1
41611	277	980	1
41612	277	979	1
41613	277	978	1
41614	277	977	1
41615	277	976	1
41616	277	975	1
41617	277	974	1
41618	277	973	1
41619	277	972	1
41620	277	971	1
41621	277	970	1
41622	277	969	1
41623	277	968	1
41624	277	967	1
41625	277	966	1
41626	277	965	1
41627	277	964	1
41628	277	963	1
41629	277	962	1
41630	277	961	1
41631	277	960	1
41632	277	959	1
41633	277	958	1
41634	277	957	1
41635	277	956	1
41636	277	955	1
41637	277	954	1
41638	277	953	1
41639	277	952	1
41640	277	951	1
41641	277	950	1
41642	277	949	1
41643	277	948	1
41644	277	947	1
41645	277	946	1
41646	277	945	1
41647	277	944	1
41648	277	943	1
41649	277	942	1
41650	277	941	1
41651	277	940	1
41652	277	939	1
41653	277	938	1
41654	277	937	1
41655	277	936	1
41656	277	935	1
41657	277	934	1
41658	277	933	1
41659	277	932	1
41660	277	931	1
41661	277	930	1
41662	277	929	1
41663	277	928	1
41664	277	927	1
41665	277	926	1
41666	277	925	1
41667	277	924	1
41668	277	923	1
41669	277	922	1
41670	277	921	1
41671	277	920	1
41672	277	919	1
41673	277	918	1
41674	277	917	1
41675	277	916	1
41676	277	915	1
41677	277	914	1
41678	277	913	1
41679	277	912	1
41680	277	911	1
41681	277	910	1
41682	277	909	1
41683	277	908	1
41684	277	907	1
41685	277	906	1
41686	277	905	1
41687	277	904	1
41688	277	903	1
41689	277	902	1
41690	277	901	1
41691	277	900	1
41692	277	899	1
41693	277	898	1
41694	277	897	1
41695	277	896	1
41696	277	895	1
41697	277	894	1
41698	277	893	1
41699	277	892	1
41700	277	891	1
41701	277	890	1
41702	277	889	1
41703	277	888	1
41704	277	887	1
41705	277	886	1
41706	277	885	1
41707	277	884	1
41708	277	883	1
41709	277	882	1
41710	277	881	1
41711	277	880	1
41712	277	879	1
41713	277	878	1
41714	277	877	1
41715	277	876	1
41716	277	875	1
41717	277	874	1
41718	277	873	1
41719	277	872	1
41720	277	871	1
41721	277	870	1
41722	277	869	1
41723	277	868	1
41724	277	867	1
41725	277	866	1
41726	277	865	1
41727	277	864	1
41728	277	863	1
41729	277	862	1
41730	277	861	1
41731	277	860	1
41732	277	859	1
41733	277	858	1
41734	277	857	1
41735	277	856	1
41736	277	855	1
41737	277	854	1
41738	277	853	1
41739	277	852	1
41740	277	851	1
41741	277	850	1
41742	277	849	1
41743	277	848	1
41744	277	847	1
41745	277	846	1
41746	277	845	1
41747	277	844	1
41748	277	843	1
41749	277	842	1
41750	277	841	1
41751	277	840	1
41752	277	839	1
41753	277	838	1
41754	277	837	1
41755	277	836	1
41756	277	835	1
41757	277	834	1
41758	277	833	1
41759	277	832	1
41760	277	831	1
41761	277	830	1
41762	277	829	1
41763	277	828	1
41764	277	827	1
41765	277	826	1
41766	277	825	1
41767	277	824	1
41768	277	823	1
41769	277	822	1
41770	277	821	1
41771	277	820	1
41772	277	819	1
41773	277	818	1
41774	277	817	1
41775	277	816	1
41776	277	815	1
41777	277	814	1
41778	277	813	1
41779	277	812	1
41780	277	811	1
41781	277	810	1
41782	277	809	1
41783	277	808	1
41784	277	807	1
41785	277	806	1
41786	277	805	1
41787	277	804	1
41788	277	803	1
41789	277	802	1
41790	277	801	1
41791	277	800	1
41792	277	799	1
41793	277	798	1
41794	277	797	1
41795	277	796	1
41796	277	795	1
41797	277	794	1
41798	277	793	1
41799	277	792	1
41800	277	791	1
41801	277	790	1
41802	277	789	1
41803	277	788	1
41804	277	787	1
41805	277	786	1
41806	277	785	1
41807	277	784	1
41808	277	783	1
41809	277	782	1
41810	277	781	1
41811	277	780	1
41812	277	779	1
41813	277	778	1
41814	277	777	1
41815	277	776	1
41816	277	775	1
41817	277	774	1
41818	277	773	1
41819	277	772	1
41820	277	771	1
41821	277	770	1
41822	277	769	1
41823	277	768	1
41824	277	767	1
41825	277	766	1
41826	277	765	1
41827	277	764	1
41828	277	763	1
41829	277	762	1
41830	277	761	1
41831	277	760	1
41832	277	759	1
41833	277	758	1
41834	277	757	1
41835	277	756	1
41836	277	755	1
41837	277	754	1
41838	277	753	1
41839	277	752	1
41840	277	751	1
41841	277	750	1
41842	277	749	1
41843	277	748	1
41844	277	747	1
41845	277	746	1
41846	277	745	1
41847	277	744	1
41848	277	743	1
41849	277	742	1
41850	277	741	1
41851	277	740	1
41852	277	739	1
41853	277	738	1
41854	277	737	1
41855	277	736	1
41856	277	735	1
41857	277	734	1
41858	277	733	1
41859	277	732	1
41860	277	731	1
41861	277	730	1
41862	277	729	1
41863	277	728	1
41864	277	727	1
41865	277	726	1
41866	277	725	1
41867	277	724	1
41868	277	723	1
41869	277	722	1
41870	277	721	1
41871	277	720	1
41872	277	719	1
41873	277	718	1
41874	277	717	1
41875	277	716	1
41876	277	715	1
41877	277	714	1
41878	277	713	1
41879	277	712	1
41880	277	711	1
41881	277	710	1
41882	277	709	1
41883	277	708	1
41884	277	707	1
41885	277	706	1
41886	277	705	1
41887	277	704	1
41888	277	703	1
41889	277	702	1
41890	277	701	1
41891	277	700	1
41892	277	699	1
41893	277	698	1
41894	277	697	1
41895	277	696	1
41896	277	695	1
41897	277	694	1
41898	277	693	1
41899	277	692	1
41900	277	691	1
41901	277	690	1
41902	277	689	1
41903	277	688	1
41904	277	687	1
41905	277	686	1
41906	277	685	1
41907	277	684	1
41908	277	683	1
41909	277	682	1
41910	277	681	1
41911	277	680	1
41912	277	679	1
41913	277	678	1
41914	277	677	1
41915	277	676	1
41916	277	675	1
41917	277	674	1
41918	277	673	1
41919	277	672	1
41920	277	671	1
41921	277	670	1
41922	277	669	1
41923	277	668	1
41924	277	667	1
41925	277	666	1
41926	277	665	1
41927	277	664	1
41928	277	663	1
41929	277	662	1
41930	277	661	1
41931	277	660	1
41932	277	659	1
41933	277	658	1
41934	277	657	1
41935	277	656	1
41936	277	655	1
41937	277	654	1
41938	277	653	1
41939	277	652	1
41940	277	651	1
41941	277	650	1
41942	277	649	1
41943	277	648	1
41944	277	647	1
41945	277	646	1
41946	277	645	1
41947	277	644	1
41948	277	643	1
41949	277	642	1
41950	277	641	1
41951	277	640	1
41952	277	639	1
41953	277	638	1
41954	277	637	1
41955	277	636	1
41956	277	635	1
41957	277	634	1
41958	277	633	1
41959	277	632	1
41960	277	631	1
41961	277	630	1
41962	277	629	1
41963	277	628	1
41964	277	627	1
41965	277	626	1
41966	277	625	1
41967	277	624	1
41968	277	623	1
41969	277	622	1
41970	277	621	1
41971	277	620	1
41972	277	619	1
41973	277	618	1
41974	277	617	1
41975	277	616	1
41976	277	615	1
41977	277	614	1
41978	277	613	1
41979	277	612	1
41980	277	611	1
41981	277	610	1
41982	277	609	1
41983	277	608	1
41984	277	607	1
41985	277	606	1
41986	277	605	1
41987	277	604	1
41988	277	603	1
41989	277	602	1
41990	277	601	1
41991	277	600	1
41992	277	599	1
41993	277	598	1
41994	277	597	1
41995	277	596	1
41996	277	595	1
41997	277	594	1
41998	277	593	1
41999	277	592	1
42000	277	591	1
42001	277	590	1
42002	277	589	1
42003	277	588	1
42004	277	587	1
42005	277	586	1
42006	277	585	1
42007	277	584	1
42008	277	583	1
42009	277	582	1
42010	277	581	1
42011	277	580	1
42012	277	579	1
42013	277	578	1
42014	277	577	1
42015	277	576	1
42016	277	575	1
42017	277	574	1
42018	277	573	1
42019	277	572	1
42020	277	571	1
42021	277	570	1
42022	277	569	1
42023	277	568	1
42024	277	567	1
42025	277	566	1
42026	277	565	1
42027	277	564	1
42028	277	563	1
42029	277	562	1
42030	277	561	1
42031	277	560	1
42032	277	559	1
42033	277	558	1
42034	277	557	1
42035	277	556	1
42036	277	555	1
42037	277	554	1
42038	277	553	1
42039	277	552	1
42040	277	551	1
42041	277	550	1
42042	277	549	1
42043	277	548	1
42044	277	547	1
42045	277	546	1
42046	277	545	1
42047	277	544	1
42048	277	543	1
42049	277	542	1
42050	277	541	1
42051	277	540	1
42052	277	539	1
42053	277	538	1
42054	277	537	1
42055	277	536	1
42056	277	535	1
42057	277	534	1
42058	277	533	1
42059	277	532	1
42060	277	531	1
42061	277	530	1
42062	277	529	1
42063	277	528	1
42064	277	527	1
42065	277	526	1
42066	277	525	1
42067	277	524	1
42068	277	523	1
42069	277	522	1
42070	277	521	1
42071	277	520	1
42072	277	519	1
42073	277	518	1
42074	277	517	1
42075	277	516	1
42076	277	515	1
42077	277	514	1
42078	277	513	1
42079	277	512	1
42080	277	511	1
42081	277	510	1
42082	277	509	1
42083	277	508	1
42084	277	507	1
42085	277	506	1
42086	277	505	1
42087	277	504	1
42088	277	503	1
42089	277	502	1
42090	277	501	1
42091	277	500	1
42092	277	499	1
42093	277	498	1
42094	277	497	1
42095	277	496	1
42096	277	495	1
42097	277	494	1
42098	277	493	1
42099	277	492	1
42100	277	491	1
42101	277	490	1
42102	277	489	1
42103	277	488	1
42104	277	487	1
42105	277	486	1
42106	277	485	1
42107	277	484	1
42108	277	483	1
42109	277	482	1
42110	277	481	1
42111	277	480	1
42112	277	479	1
42113	277	478	1
42114	277	477	1
42115	277	476	1
42116	277	475	1
42117	277	474	1
42118	277	473	1
42119	277	472	1
42120	277	471	1
42121	277	470	1
42122	277	469	1
42123	277	468	1
42124	277	467	1
42125	277	466	1
42126	277	465	1
42127	277	464	1
42128	277	463	1
42129	277	462	1
42130	277	461	1
42131	277	460	1
42132	277	459	1
42133	277	458	1
42134	277	457	1
42135	277	456	1
42136	277	455	1
42137	277	454	1
42138	277	453	1
42139	277	452	1
42140	277	451	1
42141	277	450	1
42142	277	449	1
42143	277	448	1
42144	277	447	1
42145	277	446	1
42146	277	445	1
42147	277	444	1
42148	277	443	1
42149	277	442	1
42150	277	441	1
42151	277	440	1
42152	277	439	1
42153	277	438	1
42154	277	437	1
42155	277	436	1
42156	277	435	1
42157	277	434	1
42158	277	433	1
42159	277	432	1
42160	277	431	1
42161	277	430	1
42162	277	429	1
42163	277	428	1
42164	277	427	1
42165	277	426	1
42166	277	425	1
42167	277	424	1
42168	277	423	1
42169	277	422	1
42170	277	421	1
42171	277	420	1
42172	277	419	1
42173	277	418	1
42174	277	417	1
42175	277	416	1
42176	277	415	1
42177	277	414	1
42178	277	413	1
42179	277	412	1
42180	277	411	1
42181	277	410	1
42182	277	409	1
42183	277	408	1
42184	277	407	1
42185	277	406	1
42186	277	405	1
42187	277	404	1
42188	277	403	1
42189	277	402	1
42190	277	401	1
42191	277	400	1
42192	277	399	1
42193	277	398	1
42194	277	397	1
42195	277	396	1
42196	277	395	1
42197	277	394	1
42198	277	393	1
42199	277	392	1
42200	277	391	1
42201	277	390	1
42202	277	389	1
42203	277	388	1
42204	277	387	1
42205	277	386	1
42206	277	385	1
42207	277	384	1
42208	277	383	1
42209	277	382	1
42210	277	381	1
42211	277	380	1
42212	277	379	1
42213	277	378	1
42214	277	377	1
42215	277	376	1
42216	277	375	1
42217	277	374	1
42218	277	373	1
42219	277	372	1
42220	277	371	1
42221	277	370	1
42222	277	369	1
42223	277	368	1
42224	277	367	1
42225	277	366	1
42226	277	365	1
42227	277	364	1
42228	277	363	1
42229	277	362	1
42230	277	361	1
42231	277	360	1
42232	277	359	1
42233	277	358	1
42234	277	357	1
42235	277	356	1
42236	277	355	1
42237	277	354	1
42238	277	353	1
42239	277	352	1
42240	277	351	1
42241	277	350	1
42242	277	349	1
42243	277	348	1
42244	277	347	1
42245	277	346	1
42246	277	345	1
42247	277	344	1
42248	277	343	1
42249	277	342	1
42250	277	341	1
42251	277	340	1
42252	277	339	1
42253	277	338	1
42254	277	337	1
42255	277	336	1
42256	277	335	1
42257	277	334	1
42258	277	333	1
42259	277	332	1
42260	277	331	1
42261	277	330	1
42262	277	329	1
42263	277	328	1
42264	277	327	1
42265	277	326	1
42266	277	325	1
42267	277	324	1
42268	277	323	1
42269	277	322	1
42270	277	321	1
42271	277	320	1
42272	277	319	1
42273	277	318	1
42274	277	317	1
42275	277	316	1
42276	277	315	1
42277	277	314	1
42278	277	313	1
42279	277	312	1
42280	277	311	1
42281	277	310	1
42282	277	309	1
42283	277	308	1
42284	277	307	1
42285	277	306	1
42286	277	305	1
42287	277	304	1
42288	277	303	1
42289	277	302	1
42290	277	301	1
42291	277	300	1
42292	277	299	1
42293	277	298	1
42294	277	297	1
42295	277	296	1
42296	277	295	1
42297	277	294	1
42298	277	293	1
42299	277	292	1
42300	277	291	1
42301	277	290	1
42302	277	289	1
42303	277	288	1
42304	277	287	1
42305	277	286	1
42306	277	285	1
42307	277	284	1
42308	277	283	1
42309	277	282	1
42310	277	281	1
42311	277	280	1
42312	277	279	1
42313	277	278	1
42314	277	277	1
42315	277	276	1
42316	277	275	1
42317	277	274	1
42318	277	273	1
42319	277	272	1
42320	277	271	1
42321	277	270	1
42322	277	269	1
42323	277	268	1
42324	277	267	1
42325	277	266	1
42326	277	265	1
42327	277	264	1
42328	277	263	1
42329	277	262	1
42330	277	261	1
42331	277	260	1
42332	277	259	1
42333	277	258	1
42334	277	257	1
42335	277	256	1
42336	277	255	1
42337	277	254	1
42338	277	253	1
42339	277	252	1
42340	277	251	1
42341	277	250	1
42342	277	249	1
42343	277	248	1
42344	277	247	1
42345	277	246	1
42346	277	245	1
42347	277	244	1
42348	277	243	1
42349	277	242	1
42350	277	241	1
42351	277	240	1
42352	277	239	1
42353	277	238	1
42354	277	237	1
42355	277	236	1
42356	277	235	1
42357	277	234	1
42358	277	233	1
42359	277	232	1
42360	277	231	1
42361	277	230	1
42362	277	229	1
42363	277	228	1
42364	277	227	1
42365	277	226	1
42366	277	225	1
42367	277	224	1
42368	277	223	1
42369	277	222	1
42370	277	221	1
42371	277	220	1
42372	277	219	1
42373	277	218	1
42374	277	217	1
42375	277	216	1
42376	277	215	1
42377	277	214	1
42378	277	213	1
42379	277	212	1
42380	277	211	1
42381	277	210	1
42382	277	209	1
42383	277	208	1
42384	277	207	1
42385	277	206	1
42386	277	205	1
42387	277	204	1
42388	277	203	1
42389	277	202	1
42390	277	201	1
42391	277	200	1
42392	277	199	1
42393	277	198	1
42394	277	197	1
42395	277	196	1
42396	277	195	1
42397	277	194	1
42398	277	193	1
42399	277	192	1
42400	277	191	1
42401	277	190	1
42402	277	189	1
42403	277	188	1
42404	277	187	1
42405	277	186	1
42406	277	185	1
42407	277	184	1
42408	277	183	1
42409	277	182	1
42410	277	181	1
42411	277	180	1
42412	277	179	1
42413	277	178	1
42414	277	177	1
42415	277	176	1
42416	277	175	1
42417	277	174	1
42418	277	173	1
42419	277	172	1
42420	277	171	1
42421	277	170	1
42422	277	169	1
42423	277	168	1
42424	277	167	1
42425	277	166	1
42426	277	165	1
42427	277	164	1
42428	277	163	1
42429	277	162	1
42430	277	161	1
42431	277	160	1
42432	277	159	1
42433	277	158	1
42434	277	157	1
42435	277	156	1
42436	277	155	1
42437	277	154	1
42438	277	153	1
42439	277	152	1
42440	277	151	1
42441	277	150	1
42442	277	149	1
42443	277	148	1
42444	277	147	1
42445	277	146	1
42446	277	145	1
42447	277	144	1
42448	277	143	1
42449	277	142	1
42450	277	141	1
42451	277	140	1
42452	277	139	1
42453	277	138	1
42454	277	137	1
42455	277	136	1
42456	277	135	1
42457	277	134	1
42458	277	133	1
42459	277	132	1
42460	277	131	1
42461	277	130	1
42462	277	129	1
42463	277	128	1
42464	277	127	1
42465	277	126	1
42466	277	125	1
42467	277	124	1
42468	277	123	1
42469	277	122	1
42470	277	121	1
42471	277	120	1
42472	277	119	1
42473	277	118	1
42474	277	117	1
42475	277	116	1
42476	277	115	1
42477	277	114	1
42478	277	113	1
42479	277	112	1
42480	277	111	1
42481	277	110	1
42482	277	109	1
42483	277	108	1
42484	277	107	1
42485	277	106	1
42486	277	105	1
42487	277	104	1
42488	277	103	1
42489	277	102	1
42490	277	101	1
42491	277	100	1
42492	277	99	1
42493	277	98	1
42494	277	97	1
42495	277	96	1
42496	277	95	1
42497	277	94	1
42498	277	93	1
42499	277	92	1
42500	277	91	1
42501	277	90	1
42502	277	89	1
42503	277	88	1
42504	277	87	1
42505	277	86	1
42506	277	85	1
42507	277	84	1
42508	277	83	1
42509	277	82	1
42510	277	81	1
42511	277	80	1
42512	277	79	1
42513	277	78	1
42514	277	77	1
42515	277	76	1
42516	277	75	1
42517	277	74	1
42518	277	73	1
42519	277	72	1
42520	277	71	1
42521	277	70	1
42522	277	69	1
42523	277	68	1
42524	277	67	1
42525	277	66	1
42526	277	65	1
42527	277	64	1
42528	277	63	1
42529	277	62	1
42530	277	61	1
42531	277	60	1
42532	277	59	1
42533	277	58	1
42534	277	57	1
42535	277	56	1
42536	277	55	1
42537	277	54	1
42538	277	53	1
42539	277	52	1
42540	277	51	1
42541	277	50	1
42542	277	49	1
42543	277	48	1
42544	277	47	1
42545	277	46	1
42546	277	45	1
42547	277	44	1
42548	277	43	1
42549	277	42	1
42550	277	41	1
42551	277	40	1
42552	277	39	1
42553	277	38	1
42554	277	37	1
42555	277	36	1
42556	277	35	1
42557	277	34	1
42558	277	33	1
42559	277	32	1
42560	277	31	1
42561	277	30	1
42562	277	29	1
42563	277	28	1
42564	277	27	1
42565	277	26	1
42566	277	25	1
42567	277	24	1
42568	277	23	1
42569	277	22	1
42570	277	21	1
42571	277	20	1
42572	277	19	1
42573	277	18	1
42574	277	17	1
42575	277	16	1
42576	277	15	1
42577	277	14	1
42578	277	13	1
42579	277	12	1
42580	277	11	1
42581	277	10	1
42582	277	9	1
42583	277	8	1
42584	277	7	1
42585	277	6	1
42586	277	5	1
42587	277	4	1
42588	277	3	1
42589	277	2	1
42590	277	1	1
42591	278	24	1
42592	278	23	1
42593	278	22	1
42594	278	21	1
42595	278	20	1
42596	278	19	1
42597	278	18	1
42598	278	17	1
42599	278	16	1
42600	278	15	1
42601	278	14	1
42602	278	13	1
42603	278	12	1
42604	278	11	1
42605	278	10	1
42606	278	9	1
42607	278	8	1
42608	278	7	1
42609	278	6	1
42610	278	5	1
42611	278	4	1
42612	278	3	1
42613	278	2	1
42614	278	1	1
42615	279	50	2
42616	279	49	2
42617	279	48	2
42618	279	47	2
42619	279	46	2
42620	279	45	2
42621	279	44	2
42622	279	43	2
42623	279	42	2
42624	279	41	2
42625	279	40	2
42626	279	39	2
42627	279	38	2
42628	279	37	2
42629	279	36	2
42630	279	35	2
42631	279	34	2
42632	279	33	2
42633	279	32	2
42634	279	31	2
42635	279	30	2
42636	279	29	2
42637	279	28	2
42638	279	27	2
42639	279	26	2
42640	279	25	2
42641	279	24	2
42642	279	23	2
42643	279	22	2
42644	279	21	2
42645	279	20	2
42646	279	19	2
42647	279	18	2
42648	279	17	2
42649	279	16	2
42650	279	15	2
42651	279	14	2
42652	279	13	2
42653	279	12	2
42654	279	11	2
42655	279	10	2
42656	279	9	2
42657	279	8	2
42658	279	7	2
42659	279	6	2
42660	279	5	2
42661	279	4	2
42662	279	3	2
42663	279	2	2
42664	279	1	2
42665	279	33	1
42666	279	32	1
42667	279	31	1
42668	279	30	1
42669	279	29	1
42670	279	28	1
42671	279	27	1
42672	279	26	1
42673	279	25	1
42674	279	24	1
42675	279	23	1
42676	279	22	1
42677	279	21	1
42678	279	20	1
42679	279	19	1
42680	279	18	1
42681	279	17	1
42682	279	16	1
42683	279	15	1
42684	279	14	1
42685	279	13	1
42686	279	12	1
42687	279	11	1
42688	279	10	1
42689	279	9	1
42690	279	8	1
42691	279	7	1
42692	279	6	1
42693	279	5	1
42694	279	4	1
42695	279	3	1
42696	279	2	1
42697	279	1	1
42698	279	0	1
42699	280	101	2
42700	280	100	2
42701	280	99	2
42702	280	98	2
42703	280	97	2
42704	280	96	2
42705	280	95	2
42706	280	94	2
42707	280	93	2
42708	280	92	2
42709	280	91	2
42710	280	90	2
42711	280	89	2
42712	280	88	2
42713	280	87	2
42714	280	86	2
42715	280	85	2
42716	280	84	2
42717	280	83	2
42718	280	82	2
42719	280	81	2
42720	280	80	2
42721	280	79	2
42722	280	78	2
42723	280	77	2
42724	280	76	2
42725	280	75	2
42726	280	74	2
42727	280	73	2
42728	280	72	2
42729	280	71	2
42730	280	70	2
42731	280	69	2
42732	280	68	2
42733	280	67	2
42734	280	66	2
42735	280	65	2
42736	280	64	2
42737	280	63	2
42738	280	62	2
42739	280	61	2
42740	280	60	2
42741	280	59	2
42742	280	58	2
42743	280	57	2
42744	280	56	2
42745	280	55	2
42746	280	54	2
42747	280	53	2
42748	280	52	2
42749	280	51	2
42750	280	50	2
42751	280	49	2
42752	280	48	1
42753	280	47	1
42754	280	46	1
42755	280	45	1
42756	280	44	1
42757	280	43	1
42758	280	42	1
42759	280	41	1
42760	280	40	1
42761	280	39	1
42762	280	38	1
42763	280	37	1
42764	280	36	1
42765	280	35	1
42766	280	34	1
42767	280	33	1
42768	280	32	1
42769	280	31	1
42770	280	30	1
42771	280	29	1
42772	280	28	1
42773	280	27	1
42774	280	26	1
42775	280	25	1
42776	280	24	1
42777	280	23	1
42778	280	22	1
42779	280	21	1
42780	280	20	1
42781	280	19	1
42782	280	18	1
42783	280	17	1
42784	280	16	1
42785	280	15	1
42786	280	14	1
42787	280	13	1
42788	280	12	1
42789	280	11	1
42790	280	10	1
42791	280	9	1
42792	280	8	1
42793	280	7	1
42794	280	6	1
42795	280	5	1
42796	280	4	1
42797	280	3	1
42798	280	2	1
42799	280	1	1
42800	281	76	2
42801	281	75	2
42802	281	74	2
42803	281	73	2
42804	281	72	2
42805	281	71	2
42806	281	70	2
42807	281	69	2
42808	281	68	2
42809	281	67	2
42810	281	66	2
42811	281	65	2
42812	281	64	2
42813	281	63	2
42814	281	62	2
42815	281	61	2
42816	281	60	2
42817	281	59	2
42818	281	58	2
42819	281	57	2
42820	281	56	2
42821	281	55	2
42822	281	54	2
42823	281	53	2
42824	281	52	2
42825	281	51	2
42826	281	50	2
42827	281	49	2
42828	281	48	2
42829	281	47	2
42830	281	46	2
42831	281	45	2
42832	281	44	2
42833	281	43	2
42834	281	42	2
42835	281	41	2
42836	281	40	1
42837	281	39	1
42838	281	38	1
42839	281	37	1
42840	281	36	1
42841	281	35	1
42842	281	34	1
42843	281	33	1
42844	281	32	1
42845	281	31	1
42846	281	30	1
42847	281	29	1
42848	281	28	1
42849	281	27	1
42850	281	26	1
42851	281	25	1
42852	281	24	1
42853	281	23	1
42854	281	22	1
42855	281	21	1
42856	281	20	1
42857	281	19	1
42858	281	18	1
42859	281	17	1
42860	281	16	1
42861	281	15	1
42862	281	14	1
42863	281	13	1
42864	281	12	1
42865	281	11	1
42866	281	10	1
42867	281	9	1
42868	281	8	1
42869	281	7	1
42870	281	6	1
42871	281	5	1
42872	281	4	1
42873	281	3	1
42874	281	2	1
42875	281	1	1
42876	282	113	1
42877	282	112	1
42878	282	111	1
42879	282	110	1
42880	282	109	1
42881	282	108	1
42882	282	107	1
42883	282	106	1
42884	282	105	1
42885	282	104	1
42886	282	103	1
42887	282	102	1
42888	282	101	1
42889	282	100	1
42890	282	99	1
42891	282	98	1
42892	282	97	1
42893	282	96	1
42894	282	95	1
42895	282	94	1
42896	282	93	1
42897	282	92	1
42898	282	91	1
42899	282	90	1
42900	282	89	1
42901	282	88	1
42902	282	87	1
42903	282	86	1
42904	282	85	1
42905	282	84	1
42906	282	83	1
42907	282	82	1
42908	282	81	1
42909	282	80	1
42910	282	79	1
42911	282	78	1
42912	282	77	1
42913	282	76	1
42914	282	75	1
42915	282	74	1
42916	282	73	1
42917	282	72	1
42918	282	71	1
42919	282	70	1
42920	282	69	1
42921	282	68	1
42922	282	67	1
42923	282	66	1
42924	282	65	1
42925	282	64	1
42926	282	63	1
42927	282	62	1
42928	282	61	1
42929	282	60	1
42930	282	59	1
42931	282	58	1
42932	282	57	1
42933	282	56	1
42934	282	55	1
42935	282	54	1
42936	282	53	1
42937	282	52	1
42938	282	51	1
42939	282	50	1
42940	282	49	1
42941	282	48	1
42942	282	47	1
42943	282	46	1
42944	282	45	1
42945	282	44	1
42946	282	43	1
42947	282	42	1
42948	282	41	1
42949	282	40	1
42950	282	39	1
42951	282	38	1
42952	282	37	1
42953	282	36	1
42954	282	35	1
42955	282	34	1
42956	282	33	1
42957	282	32	1
42958	282	31	1
42959	282	30	1
42960	282	29	1
42961	282	28	1
42962	282	27	1
42963	282	26	1
42964	282	25	1
42965	282	24	1
42966	282	23	1
42967	282	22	1
42968	282	21	1
42969	282	20	1
42970	282	19	1
42971	282	18	1
42972	282	17	1
42973	282	16	1
42974	282	15	1
42975	282	14	1
42976	282	13	1
42977	282	12	1
42978	282	11	1
42979	282	10	1
42980	282	9	1
42981	282	8	1
42982	282	7	1
42983	282	6	1
42984	282	5	1
42985	282	4	1
42986	282	3	1
42987	282	2	1
42988	282	1	1
42989	283	45	2
42990	283	44	2
42991	283	43	2
42992	283	42	2
42993	283	41	2
42994	283	40	2
42995	283	39	2
42996	283	38	2
42997	283	37	2
42998	283	36	2
42999	283	35	2
43000	283	34	2
43001	283	33	2
43002	283	32	2
43003	283	31	2
43004	283	30	2
43005	283	29	2
43006	283	28	2
43007	283	27	2
43008	283	26	2
43009	283	25	2
43010	283	24	2
43011	283	23	2
43012	283	22	2
43013	283	21	2
43014	283	20	2
43015	283	19	2
43016	283	18	2
43017	283	17	2
43018	283	16	2
43019	283	15	2
43020	283	14	2
43021	283	13	2
43022	283	12	2
43023	283	11	2
43024	283	10	2
43025	283	9	2
43026	283	8	2
43027	283	7	2
43028	283	6	2
43029	283	5	2
43030	283	4	2
43031	283	3	2
43032	283	2	2
43033	283	1	2
43034	283	80	1
43035	283	79	1
43036	283	78	1
43037	283	77	1
43038	283	76	1
43039	283	75	1
43040	283	74	1
43041	283	73	1
43042	283	72	1
43043	283	71	1
43044	283	70	1
43045	283	69	1
43046	283	68	1
43047	283	67	1
43048	283	66	1
43049	283	65	1
43050	283	64	1
43051	283	63	1
43052	283	62	1
43053	283	61	1
43054	283	60	1
43055	283	59	1
43056	283	58	1
43057	283	57	1
43058	283	56	1
43059	283	55	1
43060	283	54	1
43061	283	53	1
43062	283	52	1
43063	283	51	1
43064	283	50	1
43065	283	49	1
43066	283	48	1
43067	283	47	1
43068	283	46	1
43069	283	45	1
43070	283	44	1
43071	283	43	1
43072	283	42	1
43073	283	41	1
43074	283	40	1
43075	283	39	1
43076	283	38	1
43077	283	37	1
43078	283	36	1
43079	283	35	1
43080	283	34	1
43081	283	33	1
43082	283	32	1
43083	283	31	1
43084	283	30	1
43085	283	29	1
43086	283	28	1
43087	283	27	1
43088	283	26	1
43089	283	25	1
43090	283	24	1
43091	283	23	1
43092	283	22	1
43093	283	21	1
43094	283	20	1
43095	283	19	1
43096	283	18	1
43097	283	17	1
43098	283	16	1
43099	283	15	1
43100	283	14	1
43101	283	13	1
43102	283	12	1
43103	283	11	1
43104	283	10	1
43105	283	9	1
43106	283	8	1
43107	283	7	1
43108	283	6	1
43109	283	5	1
43110	283	4	1
43111	283	3	1
43112	283	2	1
43113	283	1	1
43114	284	186	1
43115	284	185	1
43116	284	184	1
43117	284	183	1
43118	284	182	1
43119	284	181	1
43120	284	180	1
43121	284	179	1
43122	284	178	1
43123	284	177	1
43124	284	176	1
43125	284	175	1
43126	284	174	1
43127	284	173	1
43128	284	172	1
43129	284	171	1
43130	284	170	1
43131	284	169	1
43132	284	168	1
43133	284	167	1
43134	284	166	1
43135	284	165	1
43136	284	164	1
43137	284	163	1
43138	284	162	1
43139	284	161	1
43140	284	160	1
43141	284	159	1
43142	284	158	1
43143	284	157	1
43144	284	156	1
43145	284	155	1
43146	284	154	1
43147	284	153	1
43148	284	152	1
43149	284	151	1
43150	284	150	1
43151	284	149	1
43152	284	148	1
43153	284	147	1
43154	284	146	1
43155	284	145	1
43156	284	144	1
43157	284	143	1
43158	284	142	1
43159	284	141	1
43160	284	140	1
43161	284	139	1
43162	284	138	1
43163	284	137	1
43164	284	136	1
43165	284	135	1
43166	284	134	1
43167	284	133	1
43168	284	132	1
43169	284	131	1
43170	284	130	1
43171	284	129	1
43172	284	128	1
43173	284	127	1
43174	284	126	1
43175	284	125	1
43176	284	124	1
43177	284	123	1
43178	284	122	1
43179	284	121	1
43180	284	120	1
43181	284	119	1
43182	284	118	1
43183	284	117	1
43184	284	116	1
43185	284	115	1
43186	284	114	1
43187	284	113	1
43188	284	112	1
43189	284	111	1
43190	284	110	1
43191	284	109	1
43192	284	108	1
43193	284	107	1
43194	284	106	1
43195	284	105	1
43196	284	104	1
43197	284	103	1
43198	284	102	1
43199	284	101	1
43200	284	100	1
43201	284	99	1
43202	284	98	1
43203	284	97	1
43204	284	96	1
43205	284	95	1
43206	284	94	1
43207	284	93	1
43208	284	92	1
43209	284	91	1
43210	284	90	1
43211	284	89	1
43212	284	88	1
43213	284	87	1
43214	284	86	1
43215	284	85	1
43216	284	84	1
43217	284	83	1
43218	284	82	1
43219	284	81	1
43220	284	80	1
43221	284	79	1
43222	284	78	1
43223	284	77	1
43224	284	76	1
43225	284	75	1
43226	284	74	1
43227	284	73	1
43228	284	72	1
43229	284	71	1
43230	284	70	1
43231	284	69	1
43232	284	68	1
43233	284	67	1
43234	284	66	1
43235	284	65	1
43236	284	64	1
43237	284	63	1
43238	284	62	1
43239	284	61	1
43240	284	60	1
43241	284	59	1
43242	284	58	1
43243	284	57	1
43244	284	56	1
43245	284	55	1
43246	284	54	1
43247	284	53	1
43248	284	52	1
43249	284	51	1
43250	284	50	1
43251	284	49	1
43252	284	48	1
43253	284	47	1
43254	284	46	1
43255	284	45	1
43256	284	44	1
43257	284	43	1
43258	284	42	1
43259	284	41	1
43260	284	40	1
43261	284	39	1
43262	284	38	1
43263	284	37	1
43264	284	36	1
43265	284	35	1
43266	284	34	1
43267	284	33	1
43268	284	32	1
43269	284	31	1
43270	284	30	1
43271	284	29	1
43272	284	28	1
43273	284	27	1
43274	284	26	1
43275	284	25	1
43276	284	24	1
43277	284	23	1
43278	284	22	1
43279	284	21	1
43280	284	20	1
43281	284	19	1
43282	284	18	1
43283	284	17	1
43284	284	16	1
43285	284	15	1
43286	284	14	1
43287	284	13	1
43288	284	12	1
43289	284	11	1
43290	284	10	1
43291	284	9	1
43292	284	8	1
43293	284	7	1
43294	284	6	1
43295	284	5	1
43296	284	4	1
43297	284	3	1
43298	284	2	1
43299	284	1	1
43300	285	116	3
43301	285	115	3
43302	285	114	3
43303	285	113	3
43304	285	112	3
43305	285	111	3
43306	285	110	3
43307	285	109	3
43308	285	108	3
43309	285	107	3
43310	285	106	3
43311	285	105	3
43312	285	104	3
43313	285	103	3
43314	285	102	3
43315	285	101	3
43316	285	100	3
43317	285	99	3
43318	285	98	3
43319	285	97	3
43320	285	96	3
43321	285	95	3
43322	285	94	3
43323	285	93	3
43324	285	92	3
43325	285	91	3
43326	285	90	3
43327	285	89	3
43328	285	88	3
43329	285	87	3
43330	285	86	3
43331	285	85	3
43332	285	84	3
43333	285	83	3
43334	285	82	3
43335	285	81	3
43336	285	80	3
43337	285	79	3
43338	285	78	2
43339	285	77	2
43340	285	76	2
43341	285	75	2
43342	285	74	2
43343	285	73	2
43344	285	72	2
43345	285	71	2
43346	285	70	2
43347	285	69	2
43348	285	68	2
43349	285	67	2
43350	285	66	2
43351	285	65	2
43352	285	64	2
43353	285	63	2
43354	285	62	2
43355	285	61	2
43356	285	60	2
43357	285	59	2
43358	285	58	2
43359	285	57	2
43360	285	56	2
43361	285	55	2
43362	285	54	2
43363	285	53	2
43364	285	52	2
43365	285	51	2
43366	285	50	2
43367	285	49	2
43368	285	48	2
43369	285	47	2
43370	285	46	2
43371	285	45	2
43372	285	44	2
43373	285	43	2
43374	285	42	2
43375	285	41	2
43376	285	40	1
43377	285	39	1
43378	285	38	1
43379	285	37	1
43380	285	36	1
43381	285	35	1
43382	285	34	1
43383	285	33	1
43384	285	32	1
43385	285	31	1
43386	285	30	1
43387	285	29	1
43388	285	28	1
43389	285	27	1
43390	285	26	1
43391	285	25	1
43392	285	24	1
43393	285	23	1
43394	285	22	1
43395	285	21	1
43396	285	20	1
43397	285	19	1
43398	285	18	1
43399	285	17	1
43400	285	16	1
43401	285	15	1
43402	285	14	1
43403	285	13	1
43404	285	12	1
43405	285	11	1
43406	285	10	1
43407	285	9	1
43408	285	8	1
43409	285	7	1
43410	285	6	1
43411	285	5	1
43412	285	4	1
43413	285	3	1
43414	285	2	1
43415	285	1	1
43416	286	99	1
43417	286	98	1
43418	286	97	1
43419	286	96	1
43420	286	95	1
43421	286	94	1
43422	286	93	1
43423	286	92	1
43424	286	91	1
43425	286	90	1
43426	286	89	1
43427	286	88	1
43428	286	87	1
43429	286	86	1
43430	286	85	1
43431	286	84	1
43432	286	83	1
43433	286	82	1
43434	286	81	1
43435	286	80	1
43436	286	79	1
43437	286	78	1
43438	286	77	1
43439	286	76	1
43440	286	75	1
43441	286	74	1
43442	286	73	1
43443	286	72	1
43444	286	71	1
43445	286	70	1
43446	286	69	1
43447	286	68	1
43448	286	67	1
43449	286	66	1
43450	286	65	1
43451	286	64	1
43452	286	63	1
43453	286	62	1
43454	286	61	1
43455	286	60	1
43456	286	59	1
43457	286	58	1
43458	286	57	1
43459	286	56	1
43460	286	55	1
43461	286	54	1
43462	286	53	1
43463	286	52	1
43464	286	51	1
43465	286	50	1
43466	286	49	1
43467	286	48	1
43468	286	47	1
43469	286	46	1
43470	286	45	1
43471	286	44	1
43472	286	43	1
43473	286	42	1
43474	286	41	1
43475	286	40	1
43476	286	39	1
43477	286	38	1
43478	286	37	1
43479	286	36	1
43480	286	35	1
43481	286	34	1
43482	286	33	1
43483	286	32	1
43484	286	31	1
43485	286	30	1
43486	286	29	1
43487	286	28	1
43488	286	27	1
43489	286	26	1
43490	286	25	1
43491	286	24	1
43492	286	23	1
43493	286	22	1
43494	286	21	1
43495	286	20	1
43496	286	19	1
43497	286	18	1
43498	286	17	1
43499	286	16	1
43500	286	15	1
43501	286	14	1
43502	286	13	1
43503	286	12	1
43504	286	11	1
43505	286	10	1
43506	286	9	1
43507	286	8	1
43508	286	7	1
43509	286	6	1
43510	286	5	1
43511	286	4	1
43512	286	3	1
43513	286	2	1
43514	286	1	1
43515	287	103	2
43516	287	102	2
43517	287	101	2
43518	287	100	2
43519	287	99	2
43520	287	98	2
43521	287	97	2
43522	287	96	2
43523	287	95	2
43524	287	94	2
43525	287	93	2
43526	287	92	2
43527	287	91	2
43528	287	90	2
43529	287	89	2
43530	287	88	2
43531	287	87	2
43532	287	86	2
43533	287	85	2
43534	287	84	2
43535	287	83	2
43536	287	82	2
43537	287	81	2
43538	287	80	2
43539	287	79	2
43540	287	78	2
43541	287	77	2
43542	287	76	2
43543	287	75	2
43544	287	74	2
43545	287	73	2
43546	287	72	2
43547	287	71	2
43548	287	70	2
43549	287	69	2
43550	287	68	2
43551	287	67	2
43552	287	66	2
43553	287	65	2
43554	287	64	2
43555	287	63	2
43556	287	62	2
43557	287	61	2
43558	287	60	2
43559	287	59	2
43560	287	58	2
43561	287	57	2
43562	287	56	2
43563	287	55	2
43564	287	54	2
43565	287	53	2
43566	287	52	2
43567	287	51	2
43568	287	50	2
43569	287	49	2
43570	287	48	2
43571	287	47	2
43572	287	46	2
43573	287	45	2
43574	287	44	2
43575	287	43	2
43576	287	42	2
43577	287	41	2
43578	287	40	2
43579	287	39	2
43580	287	38	2
43581	287	37	2
43582	287	36	2
43583	287	35	1
43584	287	34	1
43585	287	33	1
43586	287	32	1
43587	287	31	1
43588	287	30	1
43589	287	29	1
43590	287	28	1
43591	287	27	1
43592	287	26	1
43593	287	25	1
43594	287	24	1
43595	287	23	1
43596	287	22	1
43597	287	21	1
43598	287	20	1
43599	287	19	1
43600	287	18	1
43601	287	17	1
43602	287	16	1
43603	287	15	1
43604	287	14	1
43605	287	13	1
43606	287	12	1
43607	287	11	1
43608	287	10	1
43609	287	9	1
43610	287	8	1
43611	287	7	1
43612	287	6	1
43613	287	5	1
43614	287	4	1
43615	287	3	1
43616	287	2	1
43617	287	1	1
43618	288	55	2
43619	288	54	2
43620	288	53	2
43621	288	52	2
43622	288	51	2
43623	288	50	2
43624	288	49	2
43625	288	48	2
43626	288	47	2
43627	288	46	2
43628	288	45	2
43629	288	44	2
43630	288	43	2
43631	288	42	2
43632	288	41	2
43633	288	40	2
43634	288	39	2
43635	288	38	2
43636	288	37	2
43637	288	36	2
43638	288	35	2
43639	288	34	2
43640	288	33	2
43641	288	32	2
43642	288	31	2
43643	288	30	2
43644	288	29	2
43645	288	28	2
43646	288	27	2
43647	288	26	2
43648	288	25	2
43649	288	24	2
43650	288	23	2
43651	288	22	2
43652	288	21	2
43653	288	20	2
43654	288	19	2
43655	288	18	2
43656	288	17	2
43657	288	16	2
43658	288	15	2
43659	288	14	2
43660	288	13	2
43661	288	12	2
43662	288	11	2
43663	288	10	2
43664	288	9	2
43665	288	8	2
43666	288	7	2
43667	288	6	2
43668	288	5	2
43669	288	4	2
43670	288	3	2
43671	288	2	2
43672	288	1	2
43673	288	65	1
43674	288	64	1
43675	288	63	1
43676	288	62	1
43677	288	61	1
43678	288	60	1
43679	288	59	1
43680	288	58	1
43681	288	57	1
43682	288	56	1
43683	288	55	1
43684	288	54	1
43685	288	53	1
43686	288	52	1
43687	288	51	1
43688	288	50	1
43689	288	49	1
43690	288	48	1
43691	288	47	1
43692	288	46	1
43693	288	45	1
43694	288	44	1
43695	288	43	1
43696	288	42	1
43697	288	41	1
43698	288	40	1
43699	288	39	1
43700	288	38	1
43701	288	37	1
43702	288	36	1
43703	288	35	1
43704	288	34	1
43705	288	33	1
43706	288	32	1
43707	288	31	1
43708	288	30	1
43709	288	29	1
43710	288	28	1
43711	288	27	1
43712	288	26	1
43713	288	25	1
43714	288	24	1
43715	288	23	1
43716	288	22	1
43717	288	21	1
43718	288	20	1
43719	288	19	1
43720	288	18	1
43721	288	17	1
43722	288	16	1
43723	288	15	1
43724	288	14	1
43725	288	13	1
43726	288	12	1
43727	288	11	1
43728	288	10	1
43729	288	9	1
43730	288	8	1
43731	288	7	1
43732	288	6	1
43733	288	5	1
43734	288	4	1
43735	288	3	1
43736	288	2	1
43737	288	1	1
43738	288	0	1
43739	289	110	4
43740	289	109	4
43741	289	108	4
43742	289	107	4
43743	289	106	4
43744	289	105	4
43745	289	104	4
43746	289	103	3
43747	289	102	3
43748	289	101	3
43749	289	100	3
43750	289	99	3
43751	289	98	3
43752	289	97	3
43753	289	96	3
43754	289	95	3
43755	289	94	3
43756	289	93	3
43757	289	92	3
43758	289	91	3
43759	289	90	3
43760	289	89	3
43761	289	88	3
43762	289	87	3
43763	289	86	2
43764	289	85	2
43765	289	84	2
43766	289	83	2
43767	289	82	2
43768	289	81	2
43769	289	80	2
43770	289	79	2
43771	289	78	2
43772	289	77	2
43773	289	76	2
43774	289	75	2
43775	289	74	2
43776	289	73	2
43777	289	72	2
43778	289	71	2
43779	289	70	2
43780	289	69	2
43781	289	68	2
43782	289	67	2
43783	289	66	2
43784	289	65	2
43785	289	64	2
43786	289	63	2
43787	289	62	2
43788	289	61	2
43789	289	60	2
43790	289	59	2
43791	289	58	2
43792	289	57	2
43793	289	56	2
43794	289	55	2
43795	289	54	2
43796	289	53	2
43797	289	52	2
43798	289	51	2
43799	289	50	2
43800	289	49	2
43801	289	48	2
43802	289	47	2
43803	289	46	2
43804	289	45	1
43805	289	44	1
43806	289	43	1
43807	289	42	1
43808	289	41	1
43809	289	40	1
43810	289	39	1
43811	289	38	1
43812	289	37	1
43813	289	36	1
43814	289	35	1
43815	289	34	1
43816	289	33	1
43817	289	32	1
43818	289	31	1
43819	289	30	1
43820	289	29	1
43821	289	28	1
43822	289	27	1
43823	289	26	1
43824	289	25	1
43825	289	24	1
43826	289	23	1
43827	289	22	1
43828	289	21	1
43829	289	20	1
43830	289	19	1
43831	289	18	1
43832	289	17	1
43833	289	16	1
43834	289	15	1
43835	289	14	1
43836	289	13	1
43837	289	12	1
43838	289	11	1
43839	289	10	1
43840	289	9	1
43841	289	8	1
43842	289	7	1
43843	289	6	1
43844	289	5	1
43845	289	4	1
43846	289	3	1
43847	289	2	1
43848	289	1	1
43849	290	115	3
43850	290	114	3
43851	290	113	3
43852	290	112	3
43853	290	111	3
43854	290	110	3
43855	290	109	3
43856	290	108	3
43857	290	107	3
43858	290	106	3
43859	290	105	3
43860	290	104	3
43861	290	103	3
43862	290	102	3
43863	290	101	3
43864	290	100	3
43865	290	99	3
43866	290	98	3
43867	290	97	3
43868	290	96	3
43869	290	95	3
43870	290	94	3
43871	290	93	3
43872	290	92	3
43873	290	91	3
43874	290	90	2
43875	290	89	2
43876	290	88	2
43877	290	87	2
43878	290	86	2
43879	290	85	2
43880	290	84	2
43881	290	83	2
43882	290	82	2
43883	290	81	2
43884	290	80	2
43885	290	79	2
43886	290	78	2
43887	290	77	2
43888	290	76	2
43889	290	75	2
43890	290	74	2
43891	290	73	2
43892	290	72	2
43893	290	71	2
43894	290	70	2
43895	290	69	2
43896	290	68	2
43897	290	67	2
43898	290	66	2
43899	290	65	2
43900	290	64	2
43901	290	63	2
43902	290	62	2
43903	290	61	2
43904	290	60	2
43905	290	59	2
43906	290	58	2
43907	290	57	2
43908	290	56	2
43909	290	55	2
43910	290	54	2
43911	290	53	2
43912	290	52	2
43913	290	51	2
43914	290	50	2
43915	290	49	2
43916	290	48	2
43917	290	47	2
43918	290	46	2
43919	290	45	2
43920	290	44	1
43921	290	43	1
43922	290	42	1
43923	290	41	1
43924	290	40	1
43925	290	39	1
43926	290	38	1
43927	290	37	1
43928	290	36	1
43929	290	35	1
43930	290	34	1
43931	290	33	1
43932	290	32	1
43933	290	31	1
43934	290	30	1
43935	290	29	1
43936	290	28	1
43937	290	27	1
43938	290	26	1
43939	290	25	1
43940	290	24	1
43941	290	23	1
43942	290	22	1
43943	290	21	1
43944	290	20	1
43945	290	19	1
43946	290	18	1
43947	290	17	1
43948	290	16	1
43949	290	15	1
43950	290	14	1
43951	290	13	1
43952	290	12	1
43953	290	11	1
43954	290	10	1
43955	290	9	1
43956	290	8	1
43957	290	7	1
43958	290	6	1
43959	290	5	1
43960	290	4	1
43961	290	3	1
43962	290	2	1
43963	290	1	1
43964	291	90	7
43965	291	89	7
43966	291	88	7
43967	291	87	7
43968	291	86	7
43969	291	85	7
43970	291	84	7
43971	291	83	7
43972	291	82	7
43973	291	81	7
43974	291	80	7
43975	291	79	7
43976	291	78	7
43977	291	77	7
43978	291	76	7
43979	291	75	7
43980	291	74	7
43981	291	73	7
43982	291	72	7
43983	291	71	7
43984	291	70	7
43985	291	69	7
43986	291	68	7
43987	291	67	7
43988	291	66	7
43989	291	65	7
43990	291	64	7
43991	291	63	7
43992	291	62	7
43993	291	61	7
43994	291	60	7
43995	291	59	7
43996	291	58	7
43997	291	57	7
43998	291	56	7
43999	291	55	7
44000	291	54	6
44001	291	53	6
44002	291	52	6
44003	291	51	6
44004	291	50	6
44005	291	49	6
44006	291	48	6
44007	291	47	6
44008	291	46	6
44009	291	45	6
44010	291	44	6
44011	291	43	6
44012	291	42	6
44013	291	41	6
44014	291	40	6
44015	291	39	6
44016	291	38	6
44017	291	37	6
44018	291	36	6
44019	291	35	5
44020	291	34	5
44021	291	33	5
44022	291	32	5
44023	291	31	5
44024	291	30	5
44025	291	29	4
44026	291	28	4
44027	291	27	3
44028	291	26	3
44029	291	25	3
44030	291	24	3
44031	291	23	3
44032	291	22	3
44033	291	21	3
44034	291	20	3
44035	291	19	2
44036	291	18	2
44037	291	17	2
44038	291	16	2
44039	291	15	2
44040	291	14	2
44041	291	13	2
44042	291	12	2
44043	291	11	2
44044	291	10	1
44045	291	9	1
44046	291	8	1
44047	291	7	1
44048	291	6	1
44049	291	5	1
44050	291	4	1
44051	291	3	1
44052	291	2	1
44053	291	1	1
44054	292	83	1
44055	292	82	1
44056	292	81	1
44057	292	80	1
44058	292	79	1
44059	292	78	1
44060	292	77	1
44061	292	76	1
44062	292	75	1
44063	292	74	1
44064	292	73	1
44065	292	72	1
44066	292	71	1
44067	292	70	1
44068	292	69	1
44069	292	68	1
44070	292	67	1
44071	292	66	1
44072	292	65	1
44073	292	64	1
44074	292	63	1
44075	292	62	1
44076	292	61	1
44077	292	60	1
44078	292	59	1
44079	292	58	1
44080	292	57	1
44081	292	56	1
44082	292	55	1
44083	292	54	1
44084	292	53	1
44085	292	52	1
44086	292	51	1
44087	292	50	1
44088	292	49	1
44089	292	48	1
44090	292	47	1
44091	292	46	1
44092	292	45	1
44093	292	44	1
44094	292	43	1
44095	292	42	1
44096	292	41	1
44097	292	40	1
44098	292	39	1
44099	292	38	1
44100	292	37	1
44101	292	36	1
44102	292	35	1
44103	292	34	1
44104	292	33	1
44105	292	32	1
44106	292	31	1
44107	292	30	1
44108	292	29	1
44109	292	28	1
44110	292	27	1
44111	292	26	1
44112	292	25	1
44113	292	24	1
44114	292	23	1
44115	292	22	1
44116	292	21	1
44117	292	20	1
44118	292	19	1
44119	292	18	1
44120	292	17	1
44121	292	16	1
44122	292	15	1
44123	292	14	1
44124	292	13	1
44125	292	12	1
44126	292	11	1
44127	292	10	1
44128	292	9	1
44129	292	8	1
44130	292	7	1
44131	292	6	1
44132	292	5	1
44133	292	4	1
44134	292	3	1
44135	292	2	1
44136	292	1	1
44137	293	60	7
44138	293	59	7
44139	293	58	7
44140	293	57	7
44141	293	56	7
44142	293	55	7
44143	293	54	7
44144	293	53	7
44145	293	52	7
44146	293	51	7
44147	293	50	7
44148	293	49	7
44149	293	48	7
44150	293	46	7
44151	293	45	7
44152	293	44	7
44153	293	43	7
44154	293	42	7
44155	293	41	7
44156	293	40	7
44157	293	39	6
44158	293	38	6
44159	293	37	6
44160	293	36	6
44161	293	35	6
44162	293	34	5
44163	293	33	5
44164	293	32	5
44165	293	31	5
44166	293	30	5
44167	293	29	4
44168	293	28	4
44169	293	27	4
44170	293	26	4
44171	293	25	4
44172	293	24	3
44173	293	23	3
44174	293	22	3
44175	293	21	3
44176	293	20	3
44177	293	19	3
44178	293	18	3
44179	293	17	3
44180	293	16	3
44181	293	15	3
44182	293	14	2
44183	293	13	2
44184	293	12	2
44185	293	11	2
44186	293	10	2
44187	293	9	2
44188	293	8	2
44189	293	7	1
44190	293	6	1
44191	293	5	1
44192	293	4	1
44193	293	3	1
44194	293	2	1
44195	293	1	1
44196	294	87	1
44197	294	86	1
44198	294	85	1
44199	294	84	1
44200	294	83	1
44201	294	82	1
44202	294	81	1
44203	294	80	1
44204	294	79	1
44205	294	78	1
44206	294	77	1
44207	294	76	1
44208	294	75	1
44209	294	74	1
44210	294	73	1
44211	294	72	1
44212	294	71	1
44213	294	70	1
44214	294	69	1
44215	294	68	1
44216	294	67	1
44217	294	66	1
44218	294	65	1
44219	294	64	1
44220	294	63	1
44221	294	62	1
44222	294	61	1
44223	294	60	1
44224	294	59	1
44225	294	58	1
44226	294	57	1
44227	294	56	1
44228	294	55	1
44229	294	54	1
44230	294	53	1
44231	294	52	1
44232	294	51	1
44233	294	50	1
44234	294	49	1
44235	294	48	1
44236	294	47	1
44237	294	46	1
44238	294	45	1
44239	294	44	1
44240	294	43	1
44241	294	42	1
44242	294	41	1
44243	294	40	1
44244	294	39	1
44245	294	38	1
44246	294	37	1
44247	294	36	1
44248	294	35	1
44249	294	34	1
44250	294	33	1
44251	294	32	1
44252	294	31	1
44253	294	30	1
44254	294	29	1
44255	294	28	1
44256	294	27	1
44257	294	26	1
44258	294	25	1
44259	294	24	1
44260	294	23	1
44261	294	22	1
44262	294	21	1
44263	294	20	1
44264	294	19	1
44265	294	18	1
44266	294	17	1
44267	294	16	1
44268	294	15	1
44269	294	14	1
44270	294	13	1
44271	294	12	1
44272	294	11	1
44273	294	10	1
44274	294	9	1
44275	294	8	1
44276	294	7	1
44277	294	6	1
44278	294	5	1
44279	294	4	1
44280	294	3	1
44281	294	2	1
44282	294	1	1
44283	294	0	1
44284	295	152	4
44285	295	151	4
44286	295	150	4
44287	295	149	4
44288	295	148	4
44289	295	147	4
44290	295	146	4
44291	295	145	4
44292	295	144	4
44293	295	143	4
44294	295	142	4
44295	295	141	4
44296	295	140	4
44297	295	139	4
44298	295	138	4
44299	295	137	4
44300	295	136	4
44301	295	135	4
44302	295	134	4
44303	295	133	4
44304	295	132	4
44305	295	131	4
44306	295	130	4
44307	295	129	4
44308	295	128	4
44309	295	127	4
44310	295	126	4
44311	295	125	4
44312	295	124	4
44313	295	123	4
44314	295	122	4
44315	295	121	4
44316	295	120	4
44317	295	119	4
44318	295	118	4
44319	295	117	4
44320	295	116	4
44321	295	115	4
44322	295	114	4
44323	295	113	4
44324	295	112	4
44325	295	111	4
44326	295	110	4
44327	295	109	4
44328	295	108	4
44329	295	107	4
44330	295	106	4
44331	295	105	3
44332	295	104	3
44333	295	103	3
44334	295	102	3
44335	295	101	3
44336	295	100	3
44337	295	99	3
44338	295	98	3
44339	295	97	3
44340	295	96	3
44341	295	95	3
44342	295	94	3
44343	295	93	3
44344	295	92	3
44345	295	91	3
44346	295	90	3
44347	295	89	3
44348	295	88	3
44349	295	87	3
44350	295	86	3
44351	295	85	3
44352	295	84	3
44353	295	83	3
44354	295	82	3
44355	295	81	3
44356	295	80	3
44357	295	79	3
44358	295	78	3
44359	295	77	3
44360	295	76	3
44361	295	75	3
44362	295	74	3
44363	295	73	3
44364	295	72	3
44365	295	71	3
44366	295	70	3
44367	295	69	3
44368	295	68	3
44369	295	67	3
44370	295	66	3
44371	295	65	3
44372	295	64	3
44373	295	63	3
44374	295	62	3
44375	295	61	3
44376	295	60	2
44377	295	59	2
44378	295	58	2
44379	295	57	2
44380	295	56	2
44381	295	55	2
44382	295	54	2
44383	295	53	2
44384	295	52	2
44385	295	51	2
44386	295	50	2
44387	295	49	2
44388	295	48	2
44389	295	47	2
44390	295	46	2
44391	295	45	2
44392	295	44	2
44393	295	43	2
44394	295	42	2
44395	295	41	2
44396	295	40	2
44397	295	39	2
44398	295	38	2
44399	295	37	2
44400	295	36	1
44401	295	35	1
44402	295	34	1
44403	295	33	1
44404	295	32	1
44405	295	31	1
44406	295	30	1
44407	295	29	1
44408	295	28	1
44409	295	27	1
44410	295	26	1
44411	295	25	1
44412	295	24	1
44413	295	23	1
44414	295	22	1
44415	295	21	1
44416	295	20	1
44417	295	19	1
44418	295	18	1
44419	295	17	1
44420	295	16	1
44421	295	15	1
44422	295	14	1
44423	295	13	1
44424	295	12	1
44425	295	11	1
44426	295	10	1
44427	295	9	1
44428	295	8	1
44429	295	7	1
44430	295	6	1
44431	295	5	1
44432	295	4	1
44433	295	3	1
44434	295	2	1
44435	295	1	1
44436	296	74	2
44437	296	73	2
44438	296	72	2
44439	296	71	2
44440	296	70	2
44441	296	69	2
44442	296	68	2
44443	296	67	2
44444	296	66	2
44445	296	65	2
44446	296	64	2
44447	296	63	2
44448	296	62	2
44449	296	61	2
44450	296	60	2
44451	296	59	2
44452	296	58	2
44453	296	57	2
44454	296	56	2
44455	296	55	2
44456	296	54	2
44457	296	53	2
44458	296	52	2
44459	296	51	2
44460	296	50	1
44461	296	49	1
44462	296	48	1
44463	296	47	1
44464	296	46	1
44465	296	45	1
44466	296	44	1
44467	296	43	1
44468	296	42	1
44469	296	41	1
44470	296	40	1
44471	296	39	1
44472	296	38	1
44473	296	37	1
44474	296	36	1
44475	296	35	1
44476	296	34	1
44477	296	33	1
44478	296	32	1
44479	296	31	1
44480	296	30	1
44481	296	29	1
44482	296	28	1
44483	296	27	1
44484	296	26	1
44485	296	25	1
44486	296	24	1
44487	296	23	1
44488	296	22	1
44489	296	21	1
44490	296	20	1
44491	296	19	1
44492	296	18	1
44493	296	17	1
44494	296	16	1
44495	296	15	1
44496	296	14	1
44497	296	13	1
44498	296	12	1
44499	296	11	1
44500	296	10	1
44501	296	9	1
44502	296	8	1
44503	296	7	1
44504	296	6	1
44505	296	5	1
44506	296	4	1
44507	296	3	1
44508	296	2	1
44509	296	1	1
\.


--
-- TOC entry 3428 (class 0 OID 121865)
-- Dependencies: 224
-- Data for Name: remanga_title_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remanga_title_genres (id, title_id, genres_id) FROM stdin;
1	1	2
2	1	24
3	1	3
4	1	27
5	1	36
6	2	2
7	2	6
8	2	7
9	2	38
10	2	3
11	2	26
12	2	27
13	2	36
14	2	5
15	3	2
16	3	6
17	3	13
18	3	26
19	3	30
20	3	5
21	3	21
22	4	2
23	4	13
24	4	24
25	4	25
26	4	26
27	4	27
28	4	33
29	4	34
30	4	35
31	4	36
32	5	2
33	5	6
34	5	38
35	5	3
36	5	30
37	5	17
38	6	2
39	6	23
40	6	3
41	6	30
42	6	37
43	7	2
44	7	20
45	7	3
46	7	30
47	7	5
48	8	2
49	8	6
50	8	38
51	8	22
52	8	3
53	8	30
54	8	21
55	9	2
56	9	6
57	9	13
58	9	14
59	9	38
60	9	3
61	9	30
62	9	5
63	9	17
64	10	30
65	10	5
66	11	2
67	11	38
68	11	20
69	11	25
70	11	27
71	11	5
72	12	2
73	12	6
74	12	13
75	12	14
76	12	38
77	12	30
78	12	5
79	12	21
80	13	2
81	13	6
82	13	30
83	13	33
84	13	36
85	13	5
86	13	21
87	14	2
88	14	9
89	14	38
90	14	3
91	14	5
92	15	6
93	15	30
94	16	2
95	16	6
96	16	38
97	16	3
98	16	27
99	16	30
100	16	4
101	16	34
102	16	36
103	17	2
104	17	6
105	17	3
106	17	26
107	17	21
108	18	2
109	18	3
110	18	26
111	18	27
112	18	4
113	18	5
114	19	2
115	19	6
116	19	38
117	19	3
118	19	36
119	19	5
120	19	17
121	20	2
122	20	3
123	20	30
124	20	5
125	21	2
126	21	6
127	21	13
128	21	38
129	21	3
130	21	25
131	21	30
132	21	5
133	22	13
134	22	38
135	22	23
136	22	26
137	22	30
138	22	32
139	22	37
140	22	17
141	23	2
142	23	6
143	23	7
144	23	9
145	23	38
146	23	3
147	23	26
148	23	5
149	23	37
150	24	13
151	24	25
152	24	26
153	24	4
154	24	34
155	24	35
156	24	37
157	25	2
158	25	38
159	25	3
160	25	5
161	26	2
162	26	6
163	26	13
164	26	3
165	26	25
166	26	26
167	26	27
168	26	30
169	26	32
170	26	4
171	26	5
172	26	37
173	27	2
174	27	6
175	27	9
176	27	27
177	27	30
178	27	5
179	28	33
180	28	5
181	29	2
182	29	9
183	29	38
184	29	20
185	29	3
186	29	27
187	29	30
188	29	5
189	29	17
190	30	13
191	30	23
192	30	25
193	30	26
194	30	30
195	30	5
196	30	37
197	31	2
198	31	30
199	31	5
200	32	6
201	32	38
202	32	3
203	32	30
204	32	33
205	32	5
206	32	21
207	33	2
208	33	6
209	33	38
210	33	27
211	33	5
212	33	17
213	34	7
214	34	13
215	34	26
216	34	28
217	35	6
218	35	9
219	35	3
220	35	30
221	35	4
222	35	5
223	36	9
224	36	38
225	36	3
226	36	30
227	36	5
228	37	5
229	38	2
230	38	3
231	38	30
232	38	5
233	39	2
234	39	13
235	39	20
236	39	24
237	39	3
238	39	30
239	39	35
240	39	36
241	39	5
242	40	2
243	40	6
244	40	13
245	40	3
246	40	5
247	41	2
248	41	13
249	41	14
250	41	23
251	41	3
252	41	26
253	41	27
254	41	5
255	42	2
256	42	9
257	42	13
258	42	3
259	42	30
260	42	5
261	42	17
262	43	10
263	43	13
264	43	38
265	43	23
266	43	3
267	43	25
268	43	26
269	43	28
270	43	4
271	43	36
272	43	37
273	44	6
274	44	13
275	44	3
276	44	30
277	44	5
278	44	37
279	45	2
280	45	13
281	45	3
282	45	5
283	45	17
284	46	2
285	46	6
286	46	9
287	46	14
288	46	38
289	46	23
290	46	3
291	46	25
292	46	30
293	46	5
294	46	17
295	47	30
296	47	5
297	48	2
298	48	6
299	48	38
300	48	20
301	48	23
302	48	3
303	48	27
304	48	36
305	49	9
306	49	30
307	49	17
308	50	14
309	50	26
310	50	28
311	51	2
312	51	27
313	51	30
314	51	4
315	51	36
316	52	2
317	52	6
318	52	38
319	52	3
320	52	27
321	52	30
322	52	36
323	52	17
324	52	21
325	53	2
326	53	6
327	53	7
328	53	3
329	53	5
330	54	2
331	54	6
332	54	38
333	54	3
334	54	30
335	54	36
336	55	9
337	55	13
338	55	38
339	55	3
340	55	5
341	56	13
342	56	38
343	56	20
344	56	3
345	56	25
346	56	36
347	57	2
348	57	6
349	57	3
350	57	27
351	57	36
352	58	2
353	58	6
354	58	19
355	58	22
356	58	3
357	59	38
358	59	23
359	59	30
360	59	5
361	60	2
362	60	6
363	60	9
364	60	13
365	60	38
366	60	3
367	60	26
368	60	27
369	60	30
370	60	5
371	61	2
372	61	38
373	61	3
374	61	27
375	61	30
376	61	5
377	62	2
378	62	6
379	62	38
380	62	26
381	62	5
382	62	17
383	63	13
384	63	20
385	63	3
386	63	26
387	63	28
388	63	5
389	63	17
390	64	2
391	64	6
392	64	9
393	64	38
394	64	3
395	64	35
396	64	36
397	64	5
398	65	2
399	65	9
400	65	30
401	65	5
402	65	17
403	66	2
404	66	13
405	66	38
406	66	20
407	66	3
408	66	27
409	66	30
410	66	36
411	66	5
412	66	37
413	67	2
414	67	38
415	67	3
416	67	27
417	67	33
418	67	36
419	68	2
420	68	30
421	69	2
422	69	13
423	69	3
424	69	33
425	69	34
426	69	5
427	70	2
428	70	38
429	70	37
430	71	15
431	71	3
432	71	27
433	71	30
434	71	5
435	72	5
436	73	6
437	73	38
438	73	3
439	73	30
440	73	33
441	73	5
442	74	23
443	75	2
444	75	8
445	75	9
446	75	13
447	75	38
448	75	3
449	75	33
450	75	5
451	76	13
452	76	38
453	76	3
454	76	26
455	76	28
456	76	5
457	77	22
458	77	3
459	77	27
460	77	30
461	77	36
462	77	5
463	78	2
464	78	38
465	78	23
466	78	3
467	78	30
468	78	36
469	78	5
470	78	17
471	79	9
472	79	3
473	79	30
474	79	36
475	79	5
476	80	6
477	80	3
478	80	27
479	80	30
480	80	4
481	80	36
482	80	5
483	81	13
484	81	3
485	81	26
486	81	28
487	81	5
488	82	26
489	82	28
490	83	2
491	83	3
492	83	27
493	83	36
494	83	5
495	84	38
496	84	23
497	84	3
498	84	30
499	84	37
500	84	17
501	85	2
502	85	23
503	85	30
504	85	5
505	85	17
506	86	2
507	86	3
508	86	25
509	86	30
510	86	36
511	86	5
512	87	13
513	87	20
514	87	23
515	87	25
516	87	27
517	87	30
518	87	33
519	87	34
520	87	36
521	87	37
522	88	2
523	88	13
524	88	38
525	88	3
526	88	27
527	88	30
528	88	4
529	88	5
530	89	2
531	89	9
532	89	13
533	89	20
534	89	3
535	89	27
536	89	30
537	89	36
538	89	5
539	90	2
540	90	6
541	90	3
542	90	36
543	90	5
544	91	2
545	91	3
546	91	30
547	91	5
548	91	17
549	92	2
550	92	6
551	92	9
552	92	38
553	92	23
554	92	3
555	92	27
556	92	30
557	92	33
558	92	36
559	92	17
560	93	2
561	93	6
562	93	7
563	93	20
564	93	3
565	93	27
566	93	30
567	93	5
568	93	17
569	94	6
570	94	5
571	95	2
572	95	6
573	95	13
574	95	3
575	95	26
576	95	30
577	95	32
578	95	4
579	95	37
580	95	17
581	96	2
582	96	7
583	96	3
584	96	33
585	96	34
586	96	5
587	96	39
588	96	17
589	97	2
590	97	6
591	97	38
592	97	3
593	97	27
594	97	5
595	97	21
596	98	26
597	98	28
598	98	5
599	99	2
600	99	38
601	99	3
602	99	30
603	99	5
604	100	2
605	100	13
606	100	14
607	100	38
608	100	24
609	100	3
610	100	25
611	100	27
612	100	4
613	100	35
614	100	5
615	101	2
616	101	3
617	101	27
618	101	30
619	101	36
620	101	5
621	102	2
622	102	5
623	103	7
624	103	8
625	103	14
626	103	38
627	103	3
628	103	26
629	103	28
630	103	17
631	104	2
632	104	24
633	104	3
634	104	5
635	105	2
636	105	6
637	105	9
638	105	3
639	105	26
640	105	5
641	106	2
642	106	6
643	106	9
644	106	38
645	106	30
646	106	21
647	107	14
648	107	26
649	107	28
650	107	5
651	108	6
652	108	3
653	108	30
654	108	5
655	109	2
656	109	6
657	109	30
658	109	5
659	109	17
660	110	38
661	110	23
662	110	3
663	110	30
664	110	5
665	111	2
666	111	13
667	111	38
668	111	3
669	111	26
670	111	30
671	111	5
672	111	39
673	112	2
674	112	6
675	112	7
676	112	9
677	112	13
678	113	9
679	113	3
680	113	30
681	114	2
682	114	6
683	114	30
684	114	36
685	114	5
686	115	3
687	115	30
688	115	5
689	116	2
690	116	6
691	116	13
692	116	3
693	116	26
694	116	5
695	116	37
696	117	2
697	117	7
698	117	8
699	117	13
700	117	23
701	117	3
702	117	26
703	117	33
704	117	5
705	118	25
706	118	27
707	118	33
708	118	4
709	118	35
710	119	2
711	119	23
712	119	24
713	119	25
714	119	34
715	119	35
716	119	37
717	120	3
718	120	30
719	121	2
720	121	13
721	121	3
722	121	26
723	121	28
724	121	5
725	122	2
726	122	6
727	122	14
728	122	3
729	122	30
730	123	2
731	123	13
732	123	26
733	123	27
734	123	4
735	123	34
736	123	37
737	124	2
738	124	6
739	124	3
740	124	30
741	124	36
742	125	2
743	125	9
744	125	30
745	125	5
746	126	38
747	126	3
748	126	26
749	126	28
750	126	5
751	126	17
752	127	2
753	127	6
754	127	9
755	127	13
756	127	3
757	127	30
758	127	17
759	128	2
760	128	26
761	128	5
762	129	13
763	129	38
764	129	23
765	129	25
766	129	26
767	129	30
768	129	37
769	129	17
770	130	2
771	130	13
772	130	38
773	130	20
774	130	3
775	130	27
776	130	30
777	130	5
778	131	2
779	131	6
780	131	7
781	131	26
782	131	30
783	131	5
784	132	13
785	132	23
786	132	3
787	132	26
788	132	28
789	132	5
790	133	3
791	133	30
792	133	5
793	134	2
794	134	6
795	134	13
796	134	14
797	134	38
798	134	3
799	134	27
800	134	30
801	134	4
802	134	21
803	135	2
804	135	7
805	135	9
806	135	3
807	135	5
808	136	2
809	136	6
810	136	3
811	136	30
812	137	2
813	137	13
814	137	38
815	137	22
816	137	3
817	137	25
818	137	39
819	138	5
820	139	13
821	139	23
822	139	25
823	139	26
824	139	27
825	139	4
826	140	9
827	140	38
828	140	3
829	140	30
830	140	33
831	140	5
832	140	17
833	141	6
834	141	7
835	141	9
836	141	13
837	141	3
838	141	26
839	141	30
840	141	5
841	142	2
842	142	7
843	142	38
844	142	3
845	142	26
846	142	5
847	143	9
848	143	3
849	143	26
850	143	33
851	144	38
852	144	3
853	144	30
854	144	5
855	145	13
856	145	3
857	145	26
858	145	28
859	145	5
860	146	2
861	146	3
862	146	30
863	146	34
864	146	5
865	147	2
866	147	6
867	147	9
868	147	12
869	147	13
870	147	20
871	147	3
872	147	25
873	147	27
874	147	35
875	147	5
876	147	21
877	148	23
878	148	3
879	148	36
880	148	5
881	148	17
882	149	2
883	149	38
884	149	23
885	149	3
886	149	26
887	149	27
888	149	30
889	149	37
890	149	17
891	150	2
892	150	20
893	150	3
894	150	30
895	150	36
896	151	2
897	151	6
898	151	13
899	151	38
900	151	3
901	151	25
902	151	26
903	151	27
904	151	33
905	151	4
906	151	5
907	151	37
908	152	7
909	152	38
910	152	24
911	152	3
912	152	30
913	153	2
914	153	6
915	153	7
916	153	3
917	153	26
918	153	5
919	153	17
920	154	24
921	154	26
922	154	27
923	154	35
924	154	36
925	154	5
926	154	37
927	155	13
928	155	38
929	155	23
930	155	25
931	155	17
932	156	13
933	156	14
934	156	38
935	156	26
936	156	28
937	156	5
938	157	6
939	157	24
940	157	3
941	157	27
942	157	30
943	157	36
944	157	5
945	158	2
946	158	6
947	158	3
948	158	27
949	158	34
950	158	5
951	159	2
952	159	7
953	159	3
954	159	26
955	159	30
956	159	5
957	159	17
958	160	2
959	160	21
960	161	13
961	161	14
962	161	38
963	161	23
964	161	25
965	161	26
966	161	4
967	161	37
968	161	17
969	162	2
970	162	6
971	162	33
972	162	37
973	163	13
974	163	14
975	163	26
976	163	28
977	163	5
978	164	2
979	164	6
980	164	3
981	164	5
982	165	13
983	165	20
984	165	23
985	165	3
986	165	26
987	165	27
988	165	5
989	165	17
990	166	2
991	166	6
992	166	3
993	166	25
994	166	27
995	166	34
996	166	36
997	166	5
998	166	37
999	167	2
1000	167	3
1001	167	26
1002	167	30
1003	168	2
1004	168	6
1005	168	10
1006	168	13
1007	168	38
1008	168	23
1009	168	26
1010	168	30
1011	168	36
1012	168	37
1013	169	2
1014	169	6
1015	169	22
1016	169	3
1017	169	27
1018	169	36
1019	169	17
1020	170	2
1021	170	13
1022	170	3
1023	170	27
1024	170	30
1025	170	36
1026	170	5
1027	170	37
1028	171	13
1029	171	3
1030	171	26
1031	171	27
1032	171	30
1033	171	36
1034	171	37
1035	171	17
1036	172	2
1037	172	3
1038	172	4
1039	172	5
1040	173	2
1041	173	6
1042	173	13
1043	173	38
1044	173	22
1045	173	23
1046	173	3
1047	173	26
1048	173	33
1049	173	5
1050	174	2
1051	174	13
1052	174	26
1053	174	30
1054	175	2
1055	175	6
1056	175	3
1057	175	30
1058	175	5
1059	175	21
1060	176	2
1061	176	6
1062	176	13
1063	176	20
1064	176	33
1065	176	4
1066	176	5
1067	176	39
1068	177	2
1069	177	6
1070	177	3
1071	177	5
1072	178	3
1073	178	30
1074	178	36
1075	178	5
1076	179	13
1077	179	14
1078	179	38
1079	179	3
1080	179	26
1081	179	28
1082	179	5
1083	180	2
1084	180	6
1085	180	7
1086	180	38
1087	180	27
1088	180	5
1089	180	39
1090	181	2
1091	181	6
1092	181	38
1093	181	3
1094	181	30
1095	181	32
1096	181	39
1097	181	17
1098	182	2
1099	182	13
1100	182	38
1101	182	23
1102	182	25
1103	182	27
1104	182	30
1105	182	34
1106	182	37
1107	183	2
1108	183	30
1109	184	3
1110	184	30
1111	184	36
1112	184	5
1113	185	9
1114	185	30
1115	185	5
1116	186	2
1117	186	10
1118	186	13
1119	186	25
1120	186	27
1121	186	30
1122	186	4
1123	186	37
1124	186	17
1125	187	2
1126	187	13
1127	187	38
1128	187	3
1129	187	5
1130	188	26
1131	188	28
1132	188	36
1133	188	5
1134	188	17
1135	189	6
1136	189	3
1137	189	25
1138	189	26
1139	189	30
1140	189	4
1141	189	5
1142	189	21
1143	190	14
1144	190	26
1145	190	28
1146	190	5
1147	191	6
1148	191	23
1149	191	3
1150	191	21
1151	192	3
1152	192	30
1153	192	5
1154	193	2
1155	193	9
1156	193	38
1157	193	23
1158	193	3
1159	193	30
1160	193	5
1161	193	17
1162	194	2
1163	194	3
1164	194	30
1165	194	5
1166	195	2
1167	195	6
1168	195	13
1169	195	38
1170	195	3
1171	195	5
1172	195	21
1173	196	11
1174	196	13
1175	196	27
1176	196	28
1177	196	4
1178	196	5
1179	197	38
1180	197	26
1181	197	28
1182	197	5
1183	198	26
1184	198	5
1185	199	2
1186	199	6
1187	199	30
1188	199	17
1189	200	2
1190	200	13
1191	200	38
1192	200	3
1193	200	30
1194	200	5
1195	201	3
1196	201	30
1197	202	3
1198	202	26
1199	202	28
1200	202	5
1201	203	14
1202	203	26
1203	203	28
1204	204	2
1205	204	6
1206	204	38
1207	204	22
1208	204	23
1209	204	24
1210	204	3
1211	204	30
1212	204	36
1213	204	17
1214	205	6
1215	205	26
1216	205	21
1217	206	2
1218	206	9
1219	206	13
1220	206	3
1221	206	30
1222	206	5
1223	207	2
1224	207	19
1225	207	36
1226	208	2
1227	208	6
1228	208	3
1229	208	30
1230	209	9
1231	209	38
1232	209	30
1233	210	23
1234	210	30
1235	210	5
1236	211	2
1237	211	6
1238	211	7
1239	211	5
1240	211	37
1241	212	38
1242	212	23
1243	212	3
1244	212	27
1245	212	30
1246	212	36
1247	212	37
1248	213	2
1249	213	6
1250	213	9
1251	213	26
1252	213	30
1253	213	36
1254	213	5
1255	214	38
1256	214	26
1257	214	28
1258	214	36
1259	214	17
1260	215	9
1261	215	13
1262	215	38
1263	215	3
1264	215	30
1265	216	2
1266	216	6
1267	216	3
1268	216	30
1269	216	5
1270	217	2
1271	217	6
1272	217	3
1273	217	30
1274	217	5
1275	217	21
1276	218	3
1277	218	30
1278	218	5
1279	219	26
1280	219	28
1281	219	5
1282	220	3
1283	220	25
1284	220	26
1285	220	28
1286	220	4
1287	220	34
1288	220	5
1289	221	2
1290	221	6
1291	221	13
1292	221	38
1293	221	25
1294	221	30
1295	221	4
1296	222	2
1297	222	38
1298	222	30
1299	222	5
1300	223	2
1301	223	6
1302	223	7
1303	223	13
1304	223	38
1305	223	23
1306	223	26
1307	223	37
1308	224	2
1309	224	6
1310	224	13
1311	224	38
1312	224	3
1313	224	5
1314	224	21
1315	225	2
1316	225	3
1317	225	30
1318	225	5
1319	226	23
1320	226	30
1321	226	36
1322	226	5
1323	227	2
1324	227	30
1325	227	5
1326	228	2
1327	228	13
1328	228	14
1329	228	38
1330	228	3
1331	228	26
1332	228	28
1333	228	5
1334	229	2
1335	229	6
1336	229	9
1337	229	3
1338	229	27
1339	229	5
1340	229	17
1341	230	6
1342	230	13
1343	230	3
1344	230	30
1345	230	36
1346	231	3
1347	231	30
1348	232	6
1349	232	7
1350	232	3
1351	232	33
1352	232	5
1353	233	2
1354	233	6
1355	233	10
1356	233	23
1357	233	26
1358	233	27
1359	233	37
1360	233	17
1361	234	6
1362	234	38
1363	234	24
1364	234	3
1365	234	30
1366	234	5
1367	235	2
1368	235	6
1369	235	38
1370	235	3
1371	235	26
1372	235	5
1373	236	2
1374	236	6
1375	236	3
1376	236	27
1377	236	30
1378	236	4
1379	236	36
1380	236	5
1381	237	2
1382	237	6
1383	237	20
1384	237	30
1385	237	5
1386	237	37
1387	238	2
1388	238	26
1389	238	28
1390	239	20
1391	239	27
1392	239	30
1393	239	34
1394	239	35
1395	240	2
1396	240	3
1397	240	30
1398	241	38
1399	241	3
1400	241	30
1401	241	5
1402	242	6
1403	242	3
1404	242	30
1405	243	2
1406	243	27
1407	243	5
1408	244	3
1409	244	30
1410	244	36
1411	244	5
1412	245	38
1413	245	3
1414	245	27
1415	245	5
1416	246	2
1417	246	6
1418	246	13
1419	246	38
1420	246	3
1421	246	26
1422	246	27
1423	246	28
1424	246	30
1425	246	5
1426	247	26
1427	247	28
1428	247	5
1429	248	2
1430	248	6
1431	248	8
1432	248	19
1433	248	3
1434	248	5
1435	249	2
1436	249	13
1437	249	30
1438	249	36
1439	249	37
1440	250	2
1441	250	6
1442	250	9
1443	250	14
1444	250	3
1445	250	5
1446	251	6
1447	251	3
1448	251	30
1449	251	36
1450	252	2
1451	252	6
1452	252	7
1453	252	13
1454	252	3
1455	252	26
1456	252	30
1457	252	33
1458	253	22
1459	253	24
1460	253	3
1461	254	2
1462	254	14
1463	254	38
1464	254	26
1465	254	30
1466	254	36
1467	254	17
1468	255	2
1469	255	6
1470	255	24
1471	255	3
1472	255	27
1473	255	30
1474	255	35
1475	255	36
1476	255	5
1477	255	37
1478	256	26
1479	256	28
1480	256	5
1481	256	17
1482	257	13
1483	257	3
1484	257	27
1485	257	30
1486	257	4
1487	257	5
1488	258	13
1489	258	38
1490	258	23
1491	258	3
1492	258	25
1493	258	26
1494	258	27
1495	258	28
1496	258	4
1497	258	37
1498	258	17
1499	259	2
1500	259	38
1501	259	26
1502	259	30
1503	259	5
1504	260	2
1505	260	3
1506	260	30
1507	260	36
1508	260	5
1509	261	2
1510	262	10
1511	262	13
1512	262	25
1513	262	26
1514	262	30
1515	262	4
1516	262	34
1517	263	2
1518	263	6
1519	263	3
1520	263	30
1521	263	5
1522	263	21
1523	264	3
1524	264	30
1525	265	2
1526	265	6
1527	265	10
1528	265	13
1529	265	23
1530	265	30
1531	265	4
1532	265	5
1533	266	2
1534	266	13
1535	266	23
1536	266	37
1537	267	2
1538	267	6
1539	267	13
1540	267	26
1541	267	30
1542	267	5
1543	267	17
1544	268	2
1545	268	13
1546	268	19
1547	268	25
1548	268	33
1549	268	4
1550	268	35
1551	269	38
1552	269	3
1553	269	30
1554	269	5
1555	270	13
1556	270	26
1557	270	28
1558	270	5
1559	271	14
1560	271	23
1561	271	3
1562	271	26
1563	271	28
1564	271	4
1565	271	5
1566	272	2
1567	272	7
1568	272	24
1569	272	3
1570	272	26
1571	272	35
1572	272	5
1573	272	39
1574	272	17
1575	273	13
1576	273	38
1577	273	3
1578	273	26
1579	273	28
1580	273	5
1581	274	13
1582	274	14
1583	274	26
1584	274	28
1585	274	5
1586	275	6
1587	275	13
1588	275	3
1589	275	30
1590	276	2
1591	276	7
1592	276	38
1593	276	23
1594	276	26
1595	276	33
1596	276	5
1597	277	2
1598	277	13
1599	277	20
1600	277	3
1601	277	26
1602	277	27
1603	277	5
1604	277	37
1605	278	6
1606	278	9
1607	278	3
1608	278	5
1609	279	2
1610	279	6
1611	279	3
1612	279	30
1613	279	36
1614	279	5
1615	280	2
1616	280	24
1617	280	3
1618	280	30
1619	280	4
1620	280	34
1621	280	36
1622	280	5
1623	281	26
1624	281	28
1625	281	5
1626	282	2
1627	282	13
1628	282	3
1629	282	25
1630	282	30
1631	282	5
1632	283	2
1633	283	6
1634	283	3
1635	283	27
1636	283	5
1637	284	2
1638	284	6
1639	284	30
1640	284	36
1641	284	5
1642	285	2
1643	285	6
1644	285	14
1645	285	38
1646	285	3
1647	285	30
1648	285	36
1649	285	21
1650	286	6
1651	286	14
1652	286	38
1653	286	3
1654	286	30
1655	286	21
1656	287	11
1657	287	13
1658	287	14
1659	287	3
1660	287	26
1661	287	5
1662	288	2
1663	288	6
1664	288	13
1665	288	3
1666	288	26
1667	288	28
1668	288	5
1669	289	6
1670	289	13
1671	289	26
1672	289	28
1673	289	36
1674	289	5
1675	290	2
1676	290	10
1677	290	13
1678	290	38
1679	290	22
1680	290	23
1681	290	30
1682	290	36
1683	290	5
1684	291	7
1685	291	9
1686	291	38
1687	291	3
1688	291	26
1689	291	27
1690	291	30
1691	291	5
1692	292	2
1693	292	38
1694	292	23
1695	292	3
1696	292	30
1697	293	2
1698	293	6
1699	293	9
1700	293	13
1701	293	23
1702	293	3
1703	293	25
1704	293	26
1705	293	30
1706	293	5
1707	294	13
1708	294	23
1709	294	26
1710	294	27
1711	294	28
1712	294	37
1713	295	38
1714	295	3
1715	295	30
1716	295	5
1717	296	25
1718	296	26
1719	296	28
1720	296	5
1721	296	17
\.


--
-- TOC entry 3432 (class 0 OID 122120)
-- Dependencies: 228
-- Data for Name: remanga_title_rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.remanga_title_rating (id, user_id, title_id, rating) FROM stdin;
73	1	1	7
76	5	1	10
18	1	3	5
32	2	3	4
35	2	1	10
40	2	9	10
48	1	11	7
\.


--
-- TOC entry 3426 (class 0 OID 121856)
-- Dependencies: 222
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, avatar) FROM stdin;
2	$2b$12$VLjYbqb6RbOw..TTAjoKAuhSZ0UuV5lW1BwB1ir6oosl3ocWcSe5m	\N	f	test2	\N	\N	adb@mail.ru	f	t	\N	
3	$2b$12$UZcxlCi8q69ooAtfo6Kct.KrI9uFdByCK4jYZ9qh12FSHzTJ0uNZm	\N	f	test3	\N	\N	adb@mail.ru	f	t	\N	
4	$2b$12$l1zcSoahy3GUr5q6dZOSGui81DwZURivy7kSV3bn0GWn5Nc3xbWp6	\N	f	fnawfnwa	\N	\N	a@gmail.com	f	t	\N	
1	$2b$12$Qir6HU4EBnz.gHPIdHv44.hHZnfAPEgMqFeA1PdegoecID8xPHLSK	\N	f	test	\N	\N	otjnoecpulakz@logodesignex.com	f	t	\N	1.jpg
5	$2b$12$OvIeLy7PXLFYnPeuMHEXROLGwb.6WMOTuY5Xx89Ly2Ml92OOnTmVC	\N	f	test5	\N	\N	otjnoecpulakz@logodesignex.com	f	t	\N	5.jpg
\.


--
-- TOC entry 3434 (class 0 OID 122143)
-- Dependencies: 230
-- Data for Name: user_bookmarks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_bookmarks (id, user_id, title_id) FROM stdin;
60	1	11
4	2	3
5	2	6
8	2	8
187	1	1
55	1	10
122	1	6
\.


--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 217
-- Name: remanga_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remanga_categories_id_seq', 1, false);


--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 233
-- Name: remanga_comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remanga_comment_id_seq', 87, true);


--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 235
-- Name: remanga_comment_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remanga_comment_rating_id_seq', 161, true);


--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 215
-- Name: remanga_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remanga_genres_id_seq', 1, false);


--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 225
-- Name: remanga_title_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remanga_title_categories_id_seq', 1, false);


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 231
-- Name: remanga_title_chapters_new_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remanga_title_chapters_new_id_seq', 44509, true);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 223
-- Name: remanga_title_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remanga_title_genres_id_seq', 1, false);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 219
-- Name: remanga_title_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remanga_title_id_seq', 1, false);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 227
-- Name: remanga_title_rating_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.remanga_title_rating_id_seq', 76, true);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 229
-- Name: user_bookmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_bookmarks_id_seq', 188, true);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 221
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 5, true);


--
-- TOC entry 3239 (class 2606 OID 121502)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3243 (class 2606 OID 121821)
-- Name: remanga_categories remanga_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_categories
    ADD CONSTRAINT remanga_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3259 (class 2606 OID 130300)
-- Name: remanga_comment remanga_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_comment
    ADD CONSTRAINT remanga_comment_pkey PRIMARY KEY (id);


--
-- TOC entry 3261 (class 2606 OID 130377)
-- Name: remanga_comment_rating remanga_comment_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_comment_rating
    ADD CONSTRAINT remanga_comment_rating_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 121814)
-- Name: remanga_genres remanga_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_genres
    ADD CONSTRAINT remanga_genres_pkey PRIMARY KEY (id);


--
-- TOC entry 3251 (class 2606 OID 121887)
-- Name: remanga_title_categories remanga_title_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_categories
    ADD CONSTRAINT remanga_title_categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3257 (class 2606 OID 130283)
-- Name: remanga_title_chapters remanga_title_chapters_new_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_chapters
    ADD CONSTRAINT remanga_title_chapters_new_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 121870)
-- Name: remanga_title_genres remanga_title_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_genres
    ADD CONSTRAINT remanga_title_genres_pkey PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 121830)
-- Name: remanga_title remanga_title_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title
    ADD CONSTRAINT remanga_title_pkey PRIMARY KEY (id);


--
-- TOC entry 3253 (class 2606 OID 122125)
-- Name: remanga_title_rating remanga_title_rating_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_rating
    ADD CONSTRAINT remanga_title_rating_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 122148)
-- Name: user_bookmarks user_bookmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_bookmarks
    ADD CONSTRAINT user_bookmarks_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 121863)
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 130301)
-- Name: remanga_comment remanga_comment_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_comment
    ADD CONSTRAINT remanga_comment_author_id_fkey FOREIGN KEY (author_id) REFERENCES public."user"(id);


--
-- TOC entry 3273 (class 2606 OID 130388)
-- Name: remanga_comment_rating remanga_comment_rating_comment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_comment_rating
    ADD CONSTRAINT remanga_comment_rating_comment_id_fkey FOREIGN KEY (comment_id) REFERENCES public.remanga_comment(id);


--
-- TOC entry 3274 (class 2606 OID 130383)
-- Name: remanga_comment_rating remanga_comment_rating_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_comment_rating
    ADD CONSTRAINT remanga_comment_rating_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.remanga_title(id);


--
-- TOC entry 3275 (class 2606 OID 130378)
-- Name: remanga_comment_rating remanga_comment_rating_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_comment_rating
    ADD CONSTRAINT remanga_comment_rating_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 3272 (class 2606 OID 130306)
-- Name: remanga_comment remanga_comment_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_comment
    ADD CONSTRAINT remanga_comment_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.remanga_title(id);


--
-- TOC entry 3264 (class 2606 OID 121888)
-- Name: remanga_title_categories remanga_title_categories_categories_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_categories
    ADD CONSTRAINT remanga_title_categories_categories_id_fkey FOREIGN KEY (categories_id) REFERENCES public.remanga_categories(id);


--
-- TOC entry 3265 (class 2606 OID 121893)
-- Name: remanga_title_categories remanga_title_categories_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_categories
    ADD CONSTRAINT remanga_title_categories_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.remanga_title(id);


--
-- TOC entry 3270 (class 2606 OID 130284)
-- Name: remanga_title_chapters remanga_title_chapters_new_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_chapters
    ADD CONSTRAINT remanga_title_chapters_new_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.remanga_title(id);


--
-- TOC entry 3262 (class 2606 OID 121871)
-- Name: remanga_title_genres remanga_title_genres_genres_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_genres
    ADD CONSTRAINT remanga_title_genres_genres_id_fkey FOREIGN KEY (genres_id) REFERENCES public.remanga_genres(id);


--
-- TOC entry 3263 (class 2606 OID 121876)
-- Name: remanga_title_genres remanga_title_genres_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_genres
    ADD CONSTRAINT remanga_title_genres_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.remanga_title(id);


--
-- TOC entry 3266 (class 2606 OID 122131)
-- Name: remanga_title_rating remanga_title_rating_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_rating
    ADD CONSTRAINT remanga_title_rating_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.remanga_title(id);


--
-- TOC entry 3267 (class 2606 OID 122126)
-- Name: remanga_title_rating remanga_title_rating_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.remanga_title_rating
    ADD CONSTRAINT remanga_title_rating_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 3268 (class 2606 OID 122154)
-- Name: user_bookmarks user_bookmarks_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_bookmarks
    ADD CONSTRAINT user_bookmarks_title_id_fkey FOREIGN KEY (title_id) REFERENCES public.remanga_title(id);


--
-- TOC entry 3269 (class 2606 OID 122149)
-- Name: user_bookmarks user_bookmarks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_bookmarks
    ADD CONSTRAINT user_bookmarks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2023-12-27 20:32:12

--
-- PostgreSQL database dump complete
--

