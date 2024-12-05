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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_desc text,
    galaxy_has_life boolean,
    galaxy_age integer,
    galaxy_distance numeric(5,2)
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
    name character varying(30) NOT NULL,
    moon_desc text,
    moon_has_life boolean,
    moon_age integer,
    moon_distance numeric(5,2),
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
    name character varying(30) NOT NULL,
    planet_desc text,
    planet_has_life boolean,
    planet_age integer,
    planet_distance numeric(5,2),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moons (
    planet_moons_id integer NOT NULL,
    planet_id integer,
    moon_id integer,
    details text NOT NULL,
    name character varying(30)
);


ALTER TABLE public.planet_moons OWNER TO freecodecamp;

--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_moons_planet_moons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_moons_planet_moons_id_seq OWNER TO freecodecamp;

--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_moons_planet_moons_id_seq OWNED BY public.planet_moons.planet_moons_id;


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
    name character varying(30) NOT NULL,
    star_desc text,
    star_has_life boolean,
    star_age integer,
    star_distance numeric(5,2),
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
-- Name: planet_moons planet_moons_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons ALTER COLUMN planet_moons_id SET DEFAULT nextval('public.planet_moons_planet_moons_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Milky way is a galaxy that our planet stay', true, 28329, 829.99);
INSERT INTO public.galaxy VALUES (2, 'Bima Sakti', 'Bima sakti is another galaxy', false, 19238, 228.28);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'Andromeda is a galaxy', false, 28388, 103.28);
INSERT INTO public.galaxy VALUES (4, 'Cokorokok', 'Cokorokok is the best galaxy', true, 29399, 991.82);
INSERT INTO public.galaxy VALUES (5, 'Makerokd', 'Makeroks is rock galaxy', false, 99232, 283.28);
INSERT INTO public.galaxy VALUES (6, 'MNDWoo', 'This is red galaxy', true, 929321, 928.33);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon1', 'moon moon1', false, 129, 392.23, 4);
INSERT INTO public.moon VALUES (2, 'moon2', 'moon moon2', false, 122, 492.23, 4);
INSERT INTO public.moon VALUES (3, 'moon3', 'moon moon3', false, 121, 122.23, 4);
INSERT INTO public.moon VALUES (4, 'moon4', 'moon moon4', false, 139, 491.73, 4);
INSERT INTO public.moon VALUES (5, 'moon5', 'moon moon5', false, 229, 142.93, 4);
INSERT INTO public.moon VALUES (6, 'moon6', 'moon moon6', false, 529, 592.53, 7);
INSERT INTO public.moon VALUES (7, 'moon7', 'moon moon7', false, 829, 992.23, 9);
INSERT INTO public.moon VALUES (8, 'moon8', 'moon moon8', false, 929, 492.03, 2);
INSERT INTO public.moon VALUES (9, 'moon9', 'moon moon9', false, 29, 322.93, 12);
INSERT INTO public.moon VALUES (10, 'moon10', 'moon moon10', false, 139, 442.33, 10);
INSERT INTO public.moon VALUES (11, 'moon11', 'moon moon11', false, 829, 792.23, 11);
INSERT INTO public.moon VALUES (12, 'moon12', 'moon moon12', false, 179, 692.83, 8);
INSERT INTO public.moon VALUES (13, 'moon13', 'moon moon13', false, 139, 491.73, 4);
INSERT INTO public.moon VALUES (14, 'moon14', 'moon moon14', false, 29, 147.93, 4);
INSERT INTO public.moon VALUES (15, 'moon15', 'moon moon15', false, 429, 572.53, 7);
INSERT INTO public.moon VALUES (16, 'moon16', 'moon moon16', false, 529, 972.23, 9);
INSERT INTO public.moon VALUES (17, 'moon17', 'moon moon17', false, 925, 462.03, 2);
INSERT INTO public.moon VALUES (18, 'moon18', 'moon moon18', false, 293, 352.93, 12);
INSERT INTO public.moon VALUES (19, 'moon19', 'moon moon19', false, 134, 452.33, 10);
INSERT INTO public.moon VALUES (20, 'moon20', 'moon moon20', false, 826, 742.23, 11);
INSERT INTO public.moon VALUES (21, 'moon21', 'moon moon21', false, 177, 632.83, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Merkurius', 'Merkurius is the closest planet to the sun', false, 929, 400.23, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Venus is the second that close to the sun', false, 733, 300.22, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 'Mars is the closest planet to the earth', true, 201, 100.23, 2);
INSERT INTO public.planet VALUES (4, 'Earth', 'Earth is our planet', true, 2399, 100.23, 2);
INSERT INTO public.planet VALUES (5, 'Neptune', 'Neptune is the biggest planet', false, 2931, 500.23, 3);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn is a planet that has a ring', false, 4252, 523.12, 3);
INSERT INTO public.planet VALUES (7, 'Uranus2', 'Uranus is a blue cold planet', false, 5021, 692.21, 4);
INSERT INTO public.planet VALUES (8, 'pluto', 'Pluto was a planet before', false, 5231, 699.23, 4);
INSERT INTO public.planet VALUES (9, 'namek', 'namek is a planet mek', false, 39431, 299.32, 5);
INSERT INTO public.planet VALUES (10, 'aov', 'aov is a planet that play aov', true, 2932, 992.24, 5);
INSERT INTO public.planet VALUES (11, 'mke2', 'mkewe2 planet boodos', false, 923, 293.29, 6);
INSERT INTO public.planet VALUES (12, 'dwd', 'dwd planet borejs', true, 9231, 193.29, 6);


--
-- Data for Name: planet_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moons VALUES (1, 1, 1, 'hehe1', NULL);
INSERT INTO public.planet_moons VALUES (2, 2, 2, 'hehe2', NULL);
INSERT INTO public.planet_moons VALUES (3, 3, 3, 'hehe3', NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'bakekok-1', 'bakekok is shining star', true, 291, 399.22, 3);
INSERT INTO public.star VALUES (2, 'owojacko-18', 'owojancok is default star', false, 21, 199.33, 2);
INSERT INTO public.star VALUES (3, 'owi-23', 'owi is nepotism star', true, 10, 123.39, 1);
INSERT INTO public.star VALUES (4, 'miftah-66', 'miftah is naughty star', false, 35, 923.21, 5);
INSERT INTO public.star VALUES (5, 'pulisi-jancok', 'pulisi is a badest star', true, 299, 934.21, 6);
INSERT INTO public.star VALUES (6, 'brong-299', 'brong is a loudest star', false, 293, 922.32, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_moons_planet_moons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_moons_planet_moons_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_moons planet_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_pkey PRIMARY KEY (planet_moons_id);


--
-- Name: planet_moons planet_moons_planet_moons_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moons
    ADD CONSTRAINT planet_moons_planet_moons_id_key UNIQUE (planet_moons_id);


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

