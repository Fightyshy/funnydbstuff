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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (107, 2018, 'Final', 750, 751, 4, 2);
INSERT INTO public.games VALUES (108, 2018, 'Third Place', 752, 753, 2, 0);
INSERT INTO public.games VALUES (109, 2018, 'Semi-Final', 751, 753, 2, 1);
INSERT INTO public.games VALUES (110, 2018, 'Semi-Final', 750, 752, 1, 0);
INSERT INTO public.games VALUES (111, 2018, 'Quarter-Final', 751, 756, 3, 2);
INSERT INTO public.games VALUES (112, 2018, 'Quarter-Final', 753, 757, 2, 0);
INSERT INTO public.games VALUES (113, 2018, 'Quarter-Final', 752, 758, 2, 1);
INSERT INTO public.games VALUES (114, 2018, 'Quarter-Final', 750, 759, 2, 0);
INSERT INTO public.games VALUES (115, 2018, 'Eighth-Final', 753, 760, 2, 1);
INSERT INTO public.games VALUES (116, 2018, 'Eighth-Final', 757, 761, 1, 0);
INSERT INTO public.games VALUES (117, 2018, 'Eighth-Final', 752, 762, 3, 2);
INSERT INTO public.games VALUES (118, 2018, 'Eighth-Final', 758, 763, 2, 0);
INSERT INTO public.games VALUES (119, 2018, 'Eighth-Final', 751, 764, 2, 1);
INSERT INTO public.games VALUES (120, 2018, 'Eighth-Final', 756, 765, 2, 1);
INSERT INTO public.games VALUES (121, 2018, 'Eighth-Final', 759, 766, 2, 1);
INSERT INTO public.games VALUES (122, 2018, 'Eighth-Final', 750, 767, 4, 3);
INSERT INTO public.games VALUES (123, 2014, 'Final', 768, 767, 1, 0);
INSERT INTO public.games VALUES (124, 2014, 'Third Place', 770, 758, 3, 0);
INSERT INTO public.games VALUES (125, 2014, 'Semi-Final', 767, 770, 1, 0);
INSERT INTO public.games VALUES (126, 2014, 'Semi-Final', 768, 758, 7, 1);
INSERT INTO public.games VALUES (127, 2014, 'Quarter-Final', 770, 774, 1, 0);
INSERT INTO public.games VALUES (128, 2014, 'Quarter-Final', 767, 752, 1, 0);
INSERT INTO public.games VALUES (129, 2014, 'Quarter-Final', 758, 760, 2, 1);
INSERT INTO public.games VALUES (130, 2014, 'Quarter-Final', 768, 750, 1, 0);
INSERT INTO public.games VALUES (131, 2014, 'Eighth-Final', 758, 778, 2, 1);
INSERT INTO public.games VALUES (132, 2014, 'Eighth-Final', 760, 759, 2, 0);
INSERT INTO public.games VALUES (133, 2014, 'Eighth-Final', 750, 780, 2, 0);
INSERT INTO public.games VALUES (134, 2014, 'Eighth-Final', 768, 781, 2, 1);
INSERT INTO public.games VALUES (135, 2014, 'Eighth-Final', 770, 763, 2, 1);
INSERT INTO public.games VALUES (136, 2014, 'Eighth-Final', 774, 783, 2, 1);
INSERT INTO public.games VALUES (137, 2014, 'Eighth-Final', 767, 761, 1, 0);
INSERT INTO public.games VALUES (138, 2014, 'Eighth-Final', 752, 785, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (750, 'France');
INSERT INTO public.teams VALUES (751, 'Croatia');
INSERT INTO public.teams VALUES (752, 'Belgium');
INSERT INTO public.teams VALUES (753, 'England');
INSERT INTO public.teams VALUES (756, 'Russia');
INSERT INTO public.teams VALUES (757, 'Sweden');
INSERT INTO public.teams VALUES (758, 'Brazil');
INSERT INTO public.teams VALUES (759, 'Uruguay');
INSERT INTO public.teams VALUES (760, 'Colombia');
INSERT INTO public.teams VALUES (761, 'Switzerland');
INSERT INTO public.teams VALUES (762, 'Japan');
INSERT INTO public.teams VALUES (763, 'Mexico');
INSERT INTO public.teams VALUES (764, 'Denmark');
INSERT INTO public.teams VALUES (765, 'Spain');
INSERT INTO public.teams VALUES (766, 'Portugal');
INSERT INTO public.teams VALUES (767, 'Argentina');
INSERT INTO public.teams VALUES (768, 'Germany');
INSERT INTO public.teams VALUES (770, 'Netherlands');
INSERT INTO public.teams VALUES (774, 'Costa Rica');
INSERT INTO public.teams VALUES (778, 'Chile');
INSERT INTO public.teams VALUES (780, 'Nigeria');
INSERT INTO public.teams VALUES (781, 'Algeria');
INSERT INTO public.teams VALUES (783, 'Greece');
INSERT INTO public.teams VALUES (785, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 138, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 785, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

