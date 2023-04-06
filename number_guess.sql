--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(25) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer DEFAULT 0
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (130, 'UserTest', 0, 0);
INSERT INTO public.users VALUES (131, 'UserTest2', 0, 0);
INSERT INTO public.users VALUES (132, 'UserTest3', 1, 18);
INSERT INTO public.users VALUES (134, 'user_1680784306113', 2, 500);
INSERT INTO public.users VALUES (151, 'user_1680784951703', 2, 910);
INSERT INTO public.users VALUES (133, 'user_1680784306114', 5, 891);
INSERT INTO public.users VALUES (150, 'user_1680784951704', 4, 831);
INSERT INTO public.users VALUES (136, 'user_1680784312389', 2, 822);
INSERT INTO public.users VALUES (135, 'user_1680784312390', 5, 977);
INSERT INTO public.users VALUES (153, 'user_1680784969699', 2, 149);
INSERT INTO public.users VALUES (138, 'user_1680784318310', 2, 722);
INSERT INTO public.users VALUES (137, 'user_1680784318311', 5, 967);
INSERT INTO public.users VALUES (152, 'user_1680784969700', 4, 737);
INSERT INTO public.users VALUES (140, 'user_1680784333235', 1, 389);
INSERT INTO public.users VALUES (139, 'user_1680784333236', 5, 826);
INSERT INTO public.users VALUES (155, 'user_1680784996866', 2, 952);
INSERT INTO public.users VALUES (142, 'user_1680784822586', 2, 696);
INSERT INTO public.users VALUES (154, 'user_1680784996867', 4, 898);
INSERT INTO public.users VALUES (141, 'user_1680784822587', 5, 872);
INSERT INTO public.users VALUES (144, 'user_1680784874423', 1, 437);
INSERT INTO public.users VALUES (143, 'user_1680784874424', 5, 974);
INSERT INTO public.users VALUES (157, 'user_1680785035146', 2, 902);
INSERT INTO public.users VALUES (146, 'user_1680784883170', 2, 890);
INSERT INTO public.users VALUES (156, 'user_1680785035147', 5, 948);
INSERT INTO public.users VALUES (145, 'user_1680784883171', 5, 929);
INSERT INTO public.users VALUES (148, 'user_1680784897351', 2, 480);
INSERT INTO public.users VALUES (147, 'user_1680784897352', 4, 969);
INSERT INTO public.users VALUES (149, 'UserTest4', 1, 11);
INSERT INTO public.users VALUES (159, 'user_1680785088981', 2, 937);
INSERT INTO public.users VALUES (158, 'user_1680785088982', 4, 544);
INSERT INTO public.users VALUES (161, 'user_1680785106517', 2, 833);
INSERT INTO public.users VALUES (160, 'user_1680785106518', 5, 916);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 161, true);


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
-- PostgreSQL database dump complete
--

