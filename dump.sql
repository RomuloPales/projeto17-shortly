--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    "userId" integer NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: shortens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.shortens (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    views integer DEFAULT 0 NOT NULL
);


--
-- Name: shortens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.shortens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shortens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.shortens_id_seq OWNED BY public.shortens.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
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
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: shortens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shortens ALTER COLUMN id SET DEFAULT nextval('public.shortens_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, '27c1521b-cd6f-48eb-89ed-d9489aa8be56', true, 11);
INSERT INTO public.sessions VALUES (2, 'b8bfe7c7-8c99-4152-b2f6-8581e1db878e', true, 11);
INSERT INTO public.sessions VALUES (3, '24ddfbc1-9590-452c-acef-520f3264f27d', true, 11);
INSERT INTO public.sessions VALUES (4, '27e89f9f-3de4-4c2b-9ee9-1d4e77b28a8f', true, 13);
INSERT INTO public.sessions VALUES (5, '88880e88-6b41-45d6-b0c8-63d09f239517', true, 2);
INSERT INTO public.sessions VALUES (6, '709b3ab7-6586-4a4e-b0a3-9a2ed4d28885', true, 2);
INSERT INTO public.sessions VALUES (7, '763c92c0-48c7-4fd4-8813-cd1bbbb21636', true, 2);
INSERT INTO public.sessions VALUES (8, 'e9d44dbd-caf5-48a8-a908-df83f9c74d21', true, 11);
INSERT INTO public.sessions VALUES (9, '302c8939-9bc9-4437-a574-82d49ba625f3', true, 11);
INSERT INTO public.sessions VALUES (10, 'a5a40c41-db4b-45e0-a8e2-1e35eee62953', true, 11);
INSERT INTO public.sessions VALUES (11, '53a1af11-41fd-4885-955c-17c8e6b4a19d', true, 11);
INSERT INTO public.sessions VALUES (12, '4e2b8cef-f6d6-4cb3-a56c-3435a3932f26', true, 2);


--
-- Data for Name: shortens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.shortens VALUES (3, 'https://www.google.com.br', '3ZJXzTOf', 11, '2023-09-05 13:40:27.214198', 0);
INSERT INTO public.shortens VALUES (5, 'https://www.google.com.br', 'JRxqGK59', 11, '2023-09-05 13:53:50.754781', 0);
INSERT INTO public.shortens VALUES (6, 'https://www.google.com.br', 'yJgxDMCh', 11, '2023-09-05 13:53:52.866829', 0);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Rômulo', 'romulo@romulo.com', '12345', '2023-08-31 13:58:17.948419');
INSERT INTO public.users VALUES (2, 'pales', 'pales@romulo.com', '$2b$10$pnNuDrkzGvV3pElJDUWPv.ycXJIH2BssBda7x4a51wr8qJYLnbW4O', '2023-08-31 14:14:05.955474');
INSERT INTO public.users VALUES (3, 'joao', 'joao@romulo.com', '$2b$10$8RTcWeDlc1m1RXk0WB913O071H0mhVZOmZvEXPlVv.ny//.ljVKAS', '2023-08-31 14:15:11.572543');
INSERT INTO public.users VALUES (4, 'pedro  ', 'pedro@romulo.com', '12345', '2023-08-31 14:18:49.28165');
INSERT INTO public.users VALUES (5, 'joao  ', 'marcos@romulo.com', '12345', '2023-08-31 14:23:13.813232');
INSERT INTO public.users VALUES (6, 'joao  ', 'pedro@gmail.com', '$2b$10$a8irZ///AVJIQfmEcZJEcOIn1rP8GIsV8l3SP9N5UM75pTFFFLBb6', '2023-08-31 14:26:19.682663');
INSERT INTO public.users VALUES (7, 'joao  ', 'marcio@gmail.com', '$2b$10$Hss8gJok6JgsVsI/QQnZV.XkI0RfhgVnClx/qULvkXmYry2TudXay', '2023-08-31 14:26:35.093787');
INSERT INTO public.users VALUES (8, 'joao  ', 'fernando@gmail.com', '$2b$10$7dO632NqkkIlOhgW7jtbA.3SoMJdrgr7xXL0zcBHg0jAnwTQjxf5m', '2023-08-31 14:37:41.790063');
INSERT INTO public.users VALUES (9, 'joao  ', 'padro@gmail.com', '$2b$10$oWRbQe.EuIx5VSyp7rVYZOUxY305BPcPrOBkHq6IpkePKx6dss6ZW', '2023-08-31 14:41:28.027555');
INSERT INTO public.users VALUES (10, 'joao  ', 'joao@gmail.com', '$2b$10$ZBAPLVVJbuFvB92gbB35lugsydN2MQdvsjhw953I75pUaA0ykIzQ6', '2023-08-31 14:41:31.270062');
INSERT INTO public.users VALUES (11, 'marcioo  ', 'marcioo@gmail.com', '$2b$10$2SWNXlpWAmm4FbunaKGbWeDaTu58G/Oa5iggZeVjpHg8StZ.KBQI6', '2023-08-31 14:44:54.85439');
INSERT INTO public.users VALUES (12, 'pedro', 'pedrinho@gmail.com', '$2b$10$b7eKyUZCA17VI0jaFW4MB.O16XqYWSn57DEWDRQwM5oWxGawY95Wu', '2023-08-31 14:59:44.490404');
INSERT INTO public.users VALUES (13, 'marcio', 'marcinho@gmail.com', '$2b$10$95WBA04Na44K6z3DqYq03.3NIJIdPaM8fu5awgK.Y35NHF/RNt7ua', '2023-09-05 14:07:15.574169');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 12, true);


--
-- Name: shortens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.shortens_id_seq', 16, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: shortens shortens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shortens
    ADD CONSTRAINT shortens_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: shortens shortens_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.shortens
    ADD CONSTRAINT "shortens_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

