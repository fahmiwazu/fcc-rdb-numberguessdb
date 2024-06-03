--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guessdb;
--
-- Name: number_guessdb; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessdb OWNER TO freecodecamp;

\connect number_guessdb

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_guesses integer NOT NULL,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 751, 1);
INSERT INTO public.games VALUES (2, 155, 1);
INSERT INTO public.games VALUES (3, 221, 2);
INSERT INTO public.games VALUES (4, 228, 2);
INSERT INTO public.games VALUES (5, 468, 1);
INSERT INTO public.games VALUES (6, 76, 1);
INSERT INTO public.games VALUES (7, 912, 1);
INSERT INTO public.games VALUES (8, 9, 3);
INSERT INTO public.games VALUES (9, 258, 4);
INSERT INTO public.games VALUES (10, 477, 4);
INSERT INTO public.games VALUES (11, 228, 5);
INSERT INTO public.games VALUES (12, 871, 5);
INSERT INTO public.games VALUES (13, 593, 4);
INSERT INTO public.games VALUES (14, 1002, 4);
INSERT INTO public.games VALUES (15, 201, 4);
INSERT INTO public.games VALUES (16, 641, 6);
INSERT INTO public.games VALUES (17, 7, 6);
INSERT INTO public.games VALUES (18, 91, 7);
INSERT INTO public.games VALUES (19, 248, 7);
INSERT INTO public.games VALUES (20, 187, 6);
INSERT INTO public.games VALUES (21, 920, 6);
INSERT INTO public.games VALUES (22, 820, 6);
INSERT INTO public.games VALUES (23, 732, 8);
INSERT INTO public.games VALUES (24, 893, 8);
INSERT INTO public.games VALUES (25, 980, 9);
INSERT INTO public.games VALUES (26, 599, 9);
INSERT INTO public.games VALUES (27, 940, 8);
INSERT INTO public.games VALUES (28, 112, 8);
INSERT INTO public.games VALUES (29, 737, 8);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1717424903391');
INSERT INTO public.users VALUES (2, 'user_1717424903390');
INSERT INTO public.users VALUES (3, 'waz');
INSERT INTO public.users VALUES (4, 'user_1717425087451');
INSERT INTO public.users VALUES (5, 'user_1717425087450');
INSERT INTO public.users VALUES (6, 'user_1717425145608');
INSERT INTO public.users VALUES (7, 'user_1717425145607');
INSERT INTO public.users VALUES (8, 'user_1717425327566');
INSERT INTO public.users VALUES (9, 'user_1717425327565');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 29, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 9, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

