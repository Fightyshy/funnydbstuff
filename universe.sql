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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: commet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.commet (
    name character varying(20),
    last_spotted date,
    star_id integer NOT NULL,
    trail_length numeric(4,2),
    official_designation text NOT NULL,
    commet_id integer NOT NULL
);


ALTER TABLE public.commet OWNER TO freecodecamp;

--
-- Name: commets_commet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.commets_commet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commets_commet_id_seq OWNER TO freecodecamp;

--
-- Name: commets_commet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.commets_commet_id_seq OWNED BY public.commet.commet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20),
    galaxy_type character varying(20),
    official_designation text NOT NULL,
    horizontal_diameter_au numeric(4,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    moon_type character varying(20),
    is_spherical boolean,
    planet_id integer NOT NULL,
    orbit_type character varying(20),
    official_designation text NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    planet_type character varying(20),
    has_life boolean,
    star_id integer NOT NULL,
    number_of_moons integer,
    age_in_millions_of_years numeric(2,1),
    official_designation text NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    sun_type character varying(20),
    galaxy_id integer NOT NULL,
    number_of_planets integer,
    age_in_billions_of_years numeric(2,1),
    official_designation text NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: commet commet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.commet ALTER COLUMN commet_id SET DEFAULT nextval('public.commets_commet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: commet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.commet VALUES ('Odins Trail', '1950-07-19', 34, 9.90, 'ODN', 1);
INSERT INTO public.commet VALUES ('Lost Star', '1950-07-19', 34, 9.90, 'LST', 2);
INSERT INTO public.commet VALUES ('Firebrand', '1950-07-19', 35, 9.90, 'FRB', 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'BCA-32', 23.20);
INSERT INTO public.galaxy VALUES (2, 'test1', 'spiral', 'QWF-321', 10.20);
INSERT INTO public.galaxy VALUES (3, 'test2', 'blob', 'WFP-543', 11.20);
INSERT INTO public.galaxy VALUES (4, 'test3', 'binary core galaxy', 'ARS-234', 22.10);
INSERT INTO public.galaxy VALUES (5, 'test4', 'unknown', 'BGV-897', 5.20);
INSERT INTO public.galaxy VALUES (6, 'test8', 'unknown', 'EYL-332', 4.20);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'mun', 'natural satelite', true, 1, 'eliptical', 'ABC-123a');
INSERT INTO public.moon VALUES (2, 'test1', 'Moon', true, 31, 'eliptical', 'XCD-432e1');
INSERT INTO public.moon VALUES (3, 'test2', 'Moon', true, 31, 'eliptical', 'XCD-432e2');
INSERT INTO public.moon VALUES (4, 'test3', 'Moon', true, 31, 'eliptical', 'XCD-432e3');
INSERT INTO public.moon VALUES (5, 'test4', 'Moon', true, 31, 'eliptical', 'XCD-432e4');
INSERT INTO public.moon VALUES (6, 'test5', 'Moon', true, 31, 'eliptical', 'XCD-432e5');
INSERT INTO public.moon VALUES (7, 'test6', 'Moon', true, 31, 'eliptical', 'XCD-432e6');
INSERT INTO public.moon VALUES (8, 'test7', 'Moon', true, 31, 'eliptical', 'XCD-432e7');
INSERT INTO public.moon VALUES (9, 'test8', 'Moon', true, 31, 'eliptical', 'XCD-432e8');
INSERT INTO public.moon VALUES (10, 'test9', 'Moon', true, 31, 'eliptical', 'XCD-432e9');
INSERT INTO public.moon VALUES (11, 'test10', 'Moon', true, 31, 'eliptical', 'XCD-432e10');
INSERT INTO public.moon VALUES (12, 'test11', 'Moon', true, 31, 'eliptical', 'XCD-432e11');
INSERT INTO public.moon VALUES (13, 'test12', 'Moon', true, 31, 'eliptical', 'XCD-432e12');
INSERT INTO public.moon VALUES (14, 'test13', 'Moon', true, 31, 'eliptical', 'XCD-432e13');
INSERT INTO public.moon VALUES (15, 'test14', 'Moon', true, 31, 'eliptical', 'XCD-432e14');
INSERT INTO public.moon VALUES (16, 'test15', 'Moon', true, 31, 'eliptical', 'XCD-432e15');
INSERT INTO public.moon VALUES (17, 'test16', 'Moon', true, 31, 'eliptical', 'XCD-432e16');
INSERT INTO public.moon VALUES (18, 'test17', 'Moon', true, 31, 'eliptical', 'XCD-432e17');
INSERT INTO public.moon VALUES (19, 'test18', 'Moon', true, 31, 'eliptical', 'XCD-432e18');
INSERT INTO public.moon VALUES (20, 'test19', 'Moon', true, 31, 'eliptical', 'XCD-432e19');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planet', 'Water world', true, 1, 2, 5.0, 'ABC-332');
INSERT INTO public.planet VALUES (22, 'test1', 'Terran', false, 34, 1, 4.8, 'TDS-321a');
INSERT INTO public.planet VALUES (23, 'test2', 'Terran', false, 34, 1, 3.2, 'TDS-321b');
INSERT INTO public.planet VALUES (24, 'test3', 'Martian', false, 34, 2, 2.2, 'TDS-321c');
INSERT INTO public.planet VALUES (25, 'test4', 'Dwarf planet', false, 34, 4, 1.1, 'TDS-321d');
INSERT INTO public.planet VALUES (26, 'test5', 'Gas giant', false, 34, 23, 8.8, 'TDS-321e');
INSERT INTO public.planet VALUES (27, 'test6', 'Terran', true, 35, 2, 4.5, 'XCD-432a');
INSERT INTO public.planet VALUES (28, 'test7', 'Barren', false, 35, 5, 3.5, 'XCD-432b');
INSERT INTO public.planet VALUES (29, 'test8', 'Rocky', false, 35, 5, 2.2, 'XCD-432c');
INSERT INTO public.planet VALUES (30, 'test9', 'Unknown', false, 35, 7, 6.7, 'XCD-432d');
INSERT INTO public.planet VALUES (31, 'test10', 'Unknown', false, 35, 88, 8.8, 'XCD-432e');
INSERT INTO public.planet VALUES (32, 'test11', 'Unknown', false, 35, 9, 3.3, 'XCD-432f');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Star', 1, 7, 4.8, 'FPT-323');
INSERT INTO public.star VALUES (34, 'Ferrum', 'Red star', 2, 5, 7.5, 'TDS-321');
INSERT INTO public.star VALUES (35, 'Argenium', 'Yellow star', 3, 4, 6.8, 'XCD-432');
INSERT INTO public.star VALUES (36, 'test3', 'Quasar', 4, 0, 9.9, 'ETS-843');
INSERT INTO public.star VALUES (37, 'Phosphos', 'Blue Dwarf', 5, 6, 8.9, 'YEM-873');
INSERT INTO public.star VALUES (38, 'Tertium', 'Binary yellow star', 6, 8, 5.5, 'EU-323');


--
-- Name: commets_commet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.commets_commet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 32, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 38, true);


--
-- Name: commet commets_official_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.commet
    ADD CONSTRAINT commets_official_designation_key UNIQUE (official_designation);


--
-- Name: commet commets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.commet
    ADD CONSTRAINT commets_pkey PRIMARY KEY (commet_id);


--
-- Name: galaxy galaxy_official_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_official_designation_key UNIQUE (official_designation);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_official_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_official_designation_key UNIQUE (official_designation);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_official_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_official_designation_key UNIQUE (official_designation);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_official_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_official_designation_key UNIQUE (official_designation);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

