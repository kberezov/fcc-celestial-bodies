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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age integer,
    type text,
    size integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    has_life boolean,
    planet_id integer,
    age integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: nebulae; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.nebulae (
    nebulae_id integer NOT NULL,
    name character varying(20) NOT NULL,
    type text,
    age numeric(2,2),
    galaxy_id integer
);


ALTER TABLE public.nebulae OWNER TO freecodecamp;

--
-- Name: nebulae_nebulae_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.nebulae_nebulae_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nebulae_nebulae_id_seq OWNER TO freecodecamp;

--
-- Name: nebulae_nebulae_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.nebulae_nebulae_id_seq OWNED BY public.nebulae.nebulae_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    planet_type character varying(10),
    star_id integer,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    star_desc text,
    galaxy_id integer,
    color text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: nebulae nebulae_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae ALTER COLUMN nebulae_id SET DEFAULT nextval('public.nebulae_nebulae_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 13, 'spiral', 52000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 17, 'spiral', 13000);
INSERT INTO public.galaxy VALUES (3, 'Whatevername', 5, 'irregular', 20000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 18, 'elliptical', 40000);
INSERT INTO public.galaxy VALUES (5, 'Thoreda', 21, 'elliptical', 13000);
INSERT INTO public.galaxy VALUES (6, 'Lokida', 22, 'spiral', 10000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 1, 2000);
INSERT INTO public.moon VALUES (2, 'Titan', false, 3, 3000);
INSERT INTO public.moon VALUES (3, 'Rhea', true, 2, 5000);
INSERT INTO public.moon VALUES (4, 'Dione', false, 4, 40000);
INSERT INTO public.moon VALUES (5, 'Mimas', true, 5, 200);
INSERT INTO public.moon VALUES (6, 'Tethys', false, 6, 600);
INSERT INTO public.moon VALUES (7, 'Dione1', false, 7, 400);
INSERT INTO public.moon VALUES (8, 'Mimas1', true, 8, 300);
INSERT INTO public.moon VALUES (9, 'Hyperion', false, 9, 700);
INSERT INTO public.moon VALUES (10, 'Locaste', false, 10, 1000);
INSERT INTO public.moon VALUES (11, 'Locaste2', false, 11, 1000);
INSERT INTO public.moon VALUES (12, 'Aitne', false, 12, 500);
INSERT INTO public.moon VALUES (13, 'Aitne2', false, 13, 500);
INSERT INTO public.moon VALUES (14, 'Arche', true, 14, 600);
INSERT INTO public.moon VALUES (15, 'Arche2', false, 15, 6000);
INSERT INTO public.moon VALUES (16, 'Isonoe', true, 16, 700);
INSERT INTO public.moon VALUES (17, 'Ersa', false, 17, 400);
INSERT INTO public.moon VALUES (18, 'Pandia', false, 18, 4000);
INSERT INTO public.moon VALUES (19, 'Pandia2', true, 19, 5000);
INSERT INTO public.moon VALUES (20, 'Kale', false, 20, 2000);


--
-- Data for Name: nebulae; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.nebulae VALUES (1, 'Eagle', 'emission', 0.20, 1);
INSERT INTO public.nebulae VALUES (2, 'Omega', 'dark', 0.30, 2);
INSERT INTO public.nebulae VALUES (3, 'Lagoon', 'planetary', 0.40, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'rocky', 1, true);
INSERT INTO public.planet VALUES (2, 'Neptune', 'rocky', 1, false);
INSERT INTO public.planet VALUES (3, 'Venus', 'gas giant', 2, true);
INSERT INTO public.planet VALUES (4, 'Uranus', 'rocky', 3, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas giant', 4, false);
INSERT INTO public.planet VALUES (6, 'Mars', 'gas like', 3, true);
INSERT INTO public.planet VALUES (7, 'Saturn', 'rocky', 3, false);
INSERT INTO public.planet VALUES (8, 'Someplanet', 'gas giant', 5, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 'rocky', 4, true);
INSERT INTO public.planet VALUES (10, 'Mercury', 'gas giant', 6, false);
INSERT INTO public.planet VALUES (11, 'Ceres', 'rocky', 6, true);
INSERT INTO public.planet VALUES (12, 'Makemake', 'rocky', 5, false);
INSERT INTO public.planet VALUES (13, 'Eris', 'gas giant', 6, true);
INSERT INTO public.planet VALUES (14, 'Haumea', 'rocky', 5, false);
INSERT INTO public.planet VALUES (15, 'Earth2', 'rocky', 6, true);
INSERT INTO public.planet VALUES (16, 'Mars2', 'gas giant', 1, true);
INSERT INTO public.planet VALUES (17, 'Ceres2', 'rocky', 3, true);
INSERT INTO public.planet VALUES (18, 'Eris2', 'gas giant', 4, true);
INSERT INTO public.planet VALUES (19, 'Venus2', 'gas giant', 5, false);
INSERT INTO public.planet VALUES (20, 'Mars3', 'rocky', 2, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Polaris', 'guiding star', 1, 'white');
INSERT INTO public.star VALUES (2, 'Castor', 'twin of Pollux', 2, 'white');
INSERT INTO public.star VALUES (3, 'Pollux', 'twin of Castor', 2, 'red');
INSERT INTO public.star VALUES (4, 'Orion', 'most visible at plain sight', 3, 'yellow');
INSERT INTO public.star VALUES (5, 'Sirius', 'not the radio station', 4, 'white');
INSERT INTO public.star VALUES (6, 'Altair', 'Arabic origin', 5, 'yellow');


--
-- Name: nebulae_nebulae_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.nebulae_nebulae_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: nebulae nebulae_nebulae_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae
    ADD CONSTRAINT nebulae_nebulae_id_key UNIQUE (nebulae_id);


--
-- Name: nebulae nebulae_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae
    ADD CONSTRAINT nebulae_pkey PRIMARY KEY (nebulae_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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
-- Name: nebulae nebulae_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.nebulae
    ADD CONSTRAINT nebulae_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

