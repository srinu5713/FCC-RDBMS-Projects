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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    has_life boolean,
    description text,
    galaxy_id integer
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    has_life boolean,
    description text
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
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    has_life boolean,
    description text,
    planet_id integer
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
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    has_life boolean,
    description text,
    star_id integer
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
    name character varying NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    has_life boolean,
    description text,
    galaxy_id integer
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 4500, 11, 4.5, true, false, 'Famous periodic comet', 1);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 4500, 14, 4.5, true, false, 'A very bright comet', 1);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 4500, 40, 4.5, true, false, 'A comet with a long tail', 1);
INSERT INTO public.comet VALUES (4, 'Borrelly', 4500, 31, 4.5, true, false, 'A comet with a distinctive nucleus', 1);
INSERT INTO public.comet VALUES (5, 'Tempel 1', 4500, 22, 4.5, true, false, 'A comet visited by a spacecraft', 1);
INSERT INTO public.comet VALUES (6, 'Wild 2', 4500, 12, 4.5, true, false, 'A comet with a chaotic orbit', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 10000, 25000, 13.51, true, false, 'Our galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 11000, 2537000, 10.00, true, false, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 3000000, 9.00, true, false, 'A spiral galaxy');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 13000, 23000000, 6.00, true, false, 'A spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 14000, 29000000, 7.00, true, false, 'An unbarred spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 15000, 12000000, 8.00, true, false, 'A grand design spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (7, 'Moon', 4500, 1, 4.5, true, false, 'Earths moon', 13);
INSERT INTO public.moon VALUES (8, 'Phobos', 4500, 2, 4.5, true, false, 'Mars moon', 15);
INSERT INTO public.moon VALUES (9, 'Deimos', 4500, 3, 4.5, true, false, 'Mars moon', 15);
INSERT INTO public.moon VALUES (10, 'Europa', 4500, 4, 4.5, true, false, 'A moon of Jupiter', 14);
INSERT INTO public.moon VALUES (11, 'Ganymede', 4500, 5, 4.5, true, false, 'Largest moon of Jupiter', 14);
INSERT INTO public.moon VALUES (12, 'Titan', 4500, 6, 4.5, true, false, 'A moon of Saturn', 15);
INSERT INTO public.moon VALUES (13, 'Enceladus', 4500, 7, 4.5, true, false, 'Another moon of Saturn', 15);
INSERT INTO public.moon VALUES (14, 'Oberon', 4500, 8, 4.5, true, false, 'A moon of Uranus', 16);
INSERT INTO public.moon VALUES (15, 'Titania', 4500, 9, 4.5, true, false, 'Largest moon of Uranus', 16);
INSERT INTO public.moon VALUES (16, 'Umbriel', 4500, 10, 4.5, true, false, 'Another moon of Uranus', 16);
INSERT INTO public.moon VALUES (17, 'Triton', 4500, 11, 4.5, true, false, 'Largest moon of Neptune', 16);
INSERT INTO public.moon VALUES (18, 'Nereid', 4500, 12, 4.5, true, false, 'Another moon of Neptune', 16);
INSERT INTO public.moon VALUES (19, 'Charon', 4500, 13, 4.5, true, false, 'A moon of Pluto', 17);
INSERT INTO public.moon VALUES (20, 'Proxima b I', 6000, 14, 6.0, true, false, 'A moon of Proxima b', 17);
INSERT INTO public.moon VALUES (21, 'Proxima c I', 6000, 15, 6.0, true, false, 'A moon of Proxima c', 18);
INSERT INTO public.moon VALUES (22, 'Betelgeuse b I', 8500, 16, 8.0, true, false, 'A moon of Betelgeuse b', 19);
INSERT INTO public.moon VALUES (23, 'Sirius b I', 300, 17, 13, true, false, 'A moon of Sirius b', 23);
INSERT INTO public.moon VALUES (24, 'Rigel b I', 8600, 18, 47, true, false, 'A moon of Rigel b', 21);
INSERT INTO public.moon VALUES (25, 'Rigel 1 I', 8600, 19, 47, true, false, 'A moon of Rigel 1', 21);
INSERT INTO public.moon VALUES (26, 'Rigel c I', 8600, 20, 8.6, true, false, 'A moon of Rigel c', 24);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 4500, 0, 4.5, true, true, 'Our home planet', 6);
INSERT INTO public.planet VALUES (14, 'Mars', 4500, 1, 4.5, true, false, 'The red planet', 6);
INSERT INTO public.planet VALUES (15, 'Venus', 4500, 2, 4.5, true, false, 'The hottest planet', 6);
INSERT INTO public.planet VALUES (16, 'Jupiter', 4500, 5, 4.5, true, false, 'The largest planet', 6);
INSERT INTO public.planet VALUES (17, 'Saturn', 4500, 10, 4.5, true, false, 'Known for its rings', 6);
INSERT INTO public.planet VALUES (18, 'Proxima b', 6000, 4, 6.0, true, false, 'Closest exoplanet', 7);
INSERT INTO public.planet VALUES (19, 'Proxima c', 6000, 14, 6.0, true, false, 'An exoplanet in Proxima Centauri', 7);
INSERT INTO public.planet VALUES (20, 'Betelgeuse b', 8500, 643, 8.0, true, false, 'A planet orbiting Betelgeuse', 8);
INSERT INTO public.planet VALUES (21, 'Sirius b', 300, 9, 10.3, true, false, 'A white dwarf companion to Sirius', 9);
INSERT INTO public.planet VALUES (22, 'Rigel b', 8600, 863, 28.6, true, false, 'A planet orbiting Rigel', 11);
INSERT INTO public.planet VALUES (23, 'Rigel c', 8600, 82, 38.6, true, false, 'Another planet orbiting Rigel', 11);
INSERT INTO public.planet VALUES (24, 'Alpha Centauri b', 5500, 44, 5.0, true, false, 'A planet in Alpha Centauri system', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (6, 'Sun', 4500, 0, 5.5, true, false, 'Our star', 1);
INSERT INTO public.star VALUES (7, 'Alpha Centauri', 5500, 4, 5.0, true, false, 'Closest star system', 2);
INSERT INTO public.star VALUES (8, 'Betelgeuse', 8500, 642, 8.0, true, false, 'A red supergiant star', 3);
INSERT INTO public.star VALUES (9, 'Sirius', 300, 9, 10.3, true, false, 'Brightest star in the night sky', 4);
INSERT INTO public.star VALUES (10, 'Proxima Centauri', 6000, 2, 6.0, true, false, 'Nearest known star', 5);
INSERT INTO public.star VALUES (11, 'Rigel', 8600, 863, 8.6, true, false, 'Brightest star in Orion', 6);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: comet comet_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_distance_from_earth_key UNIQUE (distance_from_earth);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_distance_from_earth_key UNIQUE (distance_from_earth);


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
-- Name: moon moon_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_distance_from_earth_key UNIQUE (distance_from_earth);


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
-- Name: planet planet_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_distance_from_earth_key UNIQUE (distance_from_earth);


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
-- Name: star star_distance_from_earth_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_distance_from_earth_key UNIQUE (distance_from_earth);


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
-- Name: comet comet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

