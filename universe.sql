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
    name character varying(100) NOT NULL,
    magnitude numeric,
    dist_kpc integer,
    notes text
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
    name character varying(100) NOT NULL,
    planet_id integer,
    eq_rad_km integer,
    mass_yg numeric,
    dist_ly numeric,
    notes text
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
    name character varying(100) NOT NULL,
    star_id integer,
    eq_rad_km integer,
    mass_yg integer,
    dist_ly numeric,
    has_rings boolean,
    has_life boolean,
    notes text
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    latin_name character varying(100),
    is_extinct boolean,
    notes text
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    mass numeric,
    dist_ly numeric,
    notes text
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
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', -6.5, 0, 'This is the galaxy containing the Sun and its Solar System, and therefore Earth. Most things visible to the naked eye in the sky are part of it, including the Milky Way composing the Zone of Avoidance.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', -3.4, 770, 'Once called the Great Andromeda Nebula, it is situated in the Andromeda constellation.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy ', 5.7, 890, 'Being a diffuse object, its visibility is strongly affected by even small amounts of light pollution, ranging from easily visible in direct vision in truly dark skies to a difficult averted vision object in rural/suburban skies.');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 6.84, 4200, 'Centaurus A has been spotted with the naked eye by Stephen James O''Meara.');
INSERT INTO public.galaxy VALUES (5, 'Bode''s Galaxy', 6.94, 3700, 'Highly experienced amateur astronomers may be able to see Messier 81 under exceptional observing conditions.');
INSERT INTO public.galaxy VALUES (6, 'Sculptor Galaxy', 7.2, 3700, 'NGC 253 has been observed with the naked eye by Timo Karhula.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1378, 73.42, 0, 'Sometimes caled Luna');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 0.0000000000000000000010659, 0, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 0.0000000000000000000014762, 0, NULL);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, 89.31938, 0, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, 47.99844, 0, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 148.19, 0, NULL);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 107.5938, 0, NULL);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 84, 0.00208, 0, NULL);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 85, 0.0042, 0, NULL);
INSERT INTO public.moon VALUES (10, 'Elara', 5, 43, NULL, 0, NULL);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 5, 30, NULL, 0, NULL);
INSERT INTO public.moon VALUES (12, 'Callirrhoe', 5, 4, 0.000000869227691, 0, NULL);
INSERT INTO public.moon VALUES (13, 'Sinope', 5, 19, 0.0000075, 0, NULL);
INSERT INTO public.moon VALUES (14, 'Lysithea', 5, 18, 0.0000777, 0, NULL);
INSERT INTO public.moon VALUES (15, 'Carme', 5, 23, 0.000131882822112553, 0, NULL);
INSERT INTO public.moon VALUES (16, 'Ananke', 5, 14, 0.0000299733686619439, 0, NULL);
INSERT INTO public.moon VALUES (17, 'Leda', 5, 10, 0.00000568, 0, NULL);
INSERT INTO public.moon VALUES (18, 'Thebe', 5, 49, 0.00043, 0, NULL);
INSERT INTO public.moon VALUES (19, 'Adrastea', 5, 8, 0.000002, 0, NULL);
INSERT INTO public.moon VALUES (20, 'Metis', 5, 22, 0.0000956, 0, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 2440, 330, 0, false, false, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 6051, 4869, 0, false, false, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6378, 5872, 0, false, true, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 3396, 641, 0, false, false, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 71492, 1898700, 0, true, false, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 60268, 568510, 0, true, false, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 25559, 86849, 0, true, false, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 24764, 102440, 0, true, false, NULL);
INSERT INTO public.planet VALUES (9, 'Ceres', 1, 473, 1, 0, false, false, NULL);
INSERT INTO public.planet VALUES (10, 'Pluto', 1, 1188, 13, 0, false, false, NULL);
INSERT INTO public.planet VALUES (11, 'Haumea', 1, 816, 4, 0, true, false, NULL);
INSERT INTO public.planet VALUES (12, 'Spe', 7, 82215, 9113760, 249.2, NULL, NULL, NULL);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Human', 3, 'Homo sapiens', false, 'Only living human species left.');
INSERT INTO public.species VALUES (2, 'T-Rex', 3, 'Tyrannosaurus rex', true, 'Dinosaur');
INSERT INTO public.species VALUES (3, 'Poodle', 3, 'Canis lupus familiaris', false, NULL);
INSERT INTO public.species VALUES (4, 'Elephant', 3, 'Loxodonta', false, NULL);
INSERT INTO public.species VALUES (5, 'Zebra', 3, 'Equus quagga', false, 'Black and white stripes');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'A (Rigil Kentaurus)$', 1, 1.079, 4.3441, 'one directly-imaged habitable-zone planet candidate');
INSERT INTO public.star VALUES (2, 'B (Toliman)$', 1, 0.909, 4.3441, 'one suspected planet');
INSERT INTO public.star VALUES (3, 'M31-RV', 2, NULL, NULL, 'M31-RV is a possible red cataclysmic variable star located in the Andromeda Galaxy that experienced an outburst in 1988, which is similar to the outburst V838 Monocerotis experienced in 2002');
INSERT INTO public.star VALUES (4, 'AE Andromedae', 2, NULL, NULL, 'AE Andromedae (AE And) is a luminous blue variable (LBV), a type of variable star. The star is one of the most luminous variables in M31, the Andromeda Galaxy.');
INSERT INTO public.star VALUES (5, 'Sun', 1, 1, 0.0000158, 'eight known planets');
INSERT INTO public.star VALUES (6, 'C (Proxima Centauri, V645 Centauri)', 1, 0.122, 4.2465, 'flare star, three confirmed planets');
INSERT INTO public.star VALUES (7, '14 Andromedae', 2, 1.12, 247, 'also named Veritate');


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


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
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: species fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

