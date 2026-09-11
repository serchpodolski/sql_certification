--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    shape text,
    distance numeric NOT NULL,
    coordinates numeric,
    is_isolated boolean,
    is_interacting boolean
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
    size integer NOT NULL,
    discovery_year integer,
    diameter numeric,
    mass numeric,
    surface_type character varying(30),
    is_geologically_active boolean,
    planet_id integer NOT NULL
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
-- Name: observatories_telescopes; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observatories_telescopes (
    observatories_telescopes_id character varying(30) NOT NULL,
    name character varying(100) NOT NULL,
    location_type character varying(20),
    location text,
    cost numeric,
    mirror_diameter_meters numeric,
    is_operational boolean DEFAULT true,
    CONSTRAINT observatories_telescopes_location_type_check CHECK (((location_type)::text = ANY ((ARRAY['Ground-Based'::character varying, 'Space-Based'::character varying])::text[])))
);


ALTER TABLE public.observatories_telescopes OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    size integer NOT NULL,
    discovery_year integer,
    diameter numeric,
    mass numeric,
    density numeric,
    distance_from_star numeric,
    has_athmosphere boolean,
    athmo_composition text,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    size integer NOT NULL,
    mass numeric,
    luminosity numeric,
    temperature numeric,
    is_naked_eye boolean,
    galaxy_id integer NOT NULL
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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0, 0.00, false, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.537, 10.68, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2.73, 23.46, false, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', 0.163, 80.89, false, true);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Dwarf Irregular', 0.204, 13.19, false, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Unbarred Spiral', 31.13, 190.00, true, false);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool Galaxy', 'Grand Design Spiral', 23.00, 202.47, false, true);
INSERT INTO public.galaxy VALUES (8, 'Pinwheel Galaxy', 'Spiral', 20.90, 210.80, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, NULL, 3474, 0.0123, 'Regolith', false, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 1877, 22, 0.000000001, 'Rocky', false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 1877, 12, 0.0000000002, 'Rocky', false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1821, 1610, 3643, 0.015, 'Volcanic Basalt', true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1560, 1610, 3121, 0.008, 'Water Ice', true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 2634, 1610, 5268, 0.025, 'Silicate/Ice', false, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2410, 1610, 4820, 0.018, 'Impacted Ice', false, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 83, 1892, 167, 0.0000003, 'Porous Ice', false, 5);
INSERT INTO public.moon VALUES (9, 'Himalia', 85, 1904, 170, 0.0000007, 'Rocky', false, 5);
INSERT INTO public.moon VALUES (10, 'Mimas', 198, 1789, 396, 0.000006, 'Water Ice', false, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 252, 1789, 504, 0.000018, 'Clean Ice', true, 6);
INSERT INTO public.moon VALUES (12, 'Tethys', 531, 1684, 1062, 0.000100, 'Water Ice', false, 6);
INSERT INTO public.moon VALUES (13, 'Dione', 561, 1684, 1122, 0.000180, 'Ice/Rock', false, 6);
INSERT INTO public.moon VALUES (14, 'Rhea', 763, 1672, 1527, 0.000380, 'Water Ice', false, 6);
INSERT INTO public.moon VALUES (15, 'Titan', 2574, 1655, 5149, 0.022500, 'Hydrocarbon Ice', true, 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', 734, 1671, 1469, 0.000300, 'Ice/Carbonaceous', false, 6);
INSERT INTO public.moon VALUES (17, 'Miranda', 235, 1948, 471, 0.000011, 'Ice/Silicate', true, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 578, 1851, 1157, 0.000220, 'Ice/Rock', false, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', 584, 1851, 1169, 0.000200, 'Dark Ice', false, 7);
INSERT INTO public.moon VALUES (20, 'Titania', 788, 1787, 1576, 0.000590, 'Ice/Rock', false, 7);
INSERT INTO public.moon VALUES (21, 'Oberon', 761, 1787, 1522, 0.000500, 'Icy Silicate', false, 7);
INSERT INTO public.moon VALUES (22, 'Triton', 1353, 1846, 2706, 0.003500, 'Nitrogen Ice', true, 8);
INSERT INTO public.moon VALUES (23, 'Proteus', 210, 1989, 420, 0.000008, 'Carbonaceous', false, 8);
INSERT INTO public.moon VALUES (24, 'Nereid', 170, 1949, 340, 0.000005, 'Water Ice', false, 8);
INSERT INTO public.moon VALUES (25, 'Charon', 606, 1978, 1212, 0.000250, 'Water Ice', false, 9);


--
-- Data for Name: observatories_telescopes; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observatories_telescopes VALUES ('TEL01', 'Hubble Space Telescope', 'Space-Based', 'Low Earth Orbit', 2500000000, 2.4, true);
INSERT INTO public.observatories_telescopes VALUES ('TEL02', 'James Webb Space Telescope', 'Space-Based', 'Sun-Earth L2 Orbit', 10000000000, 6.5, true);
INSERT INTO public.observatories_telescopes VALUES ('TEL03', 'Very Large Telescope', 'Ground-Based', 'Atacama Desert, Chile', 1500000000, 8.2, true);
INSERT INTO public.observatories_telescopes VALUES ('TEL04', 'Keck Observatory', 'Ground-Based', 'Mauna Kea, Hawaii', 140000000, 10.0, true);
INSERT INTO public.observatories_telescopes VALUES ('TEL05', 'Arecibo Observatory', 'Ground-Based', 'Arecibo, Puerto Rico', 9300000, 305.0, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 2440, NULL, 4879, 0.055, 5.43, 0.39, false, 'Trace Oxygen, Sodium', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 6051, NULL, 12104, 0.815, 5.24, 0.72, true, 'Carbon Dioxide, Nitrogen', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 6371, NULL, 12742, 1.000, 5.51, 1.00, true, 'Nitrogen, Oxygen', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 3389, NULL, 6779, 0.107, 3.93, 1.52, true, 'Carbon Dioxide, Argon', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 69911, NULL, 139822, 317.8, 1.33, 5.20, true, 'Hydrogen, Helium', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 58232, NULL, 116464, 95.2, 0.69, 9.58, true, 'Hydrogen, Helium', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 25362, 1781, 50724, 14.5, 1.27, 19.22, true, 'Hydrogen, Helium, Methane', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 24622, 1846, 49244, 17.1, 1.64, 30.05, true, 'Hydrogen, Helium, Methane', 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Terrestrial', 6800, 2016, 13000, 1.17, 5.20, 0.05, true, 'Unknown', 2);
INSERT INTO public.planet VALUES (10, 'Proxima c', 'Super-Earth', 9000, 2019, 18000, 7.00, 4.10, 1.49, false, NULL, 2);
INSERT INTO public.planet VALUES (11, 'Sirius b1', 'Exoplanet', 5000, 2021, 10000, 2.30, 4.80, 2.10, false, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Betelgeuse b', 'Gas Giant', 80000, 2022, 160000, 400.0, 0.90, 8.50, true, 'Hydrogen', 4);
INSERT INTO public.planet VALUES (13, 'Andromedae b', 'Gas Giant', 75000, 2015, 150000, 250.0, 1.10, 1.20, true, 'Helium', 5);
INSERT INTO public.planet VALUES (14, 'Trianguli b', 'Ice Giant', 22000, 2018, 44000, 12.0, 1.40, 15.00, true, 'Methane', 6);
INSERT INTO public.planet VALUES (15, 'Magellan b', 'Terrestrial', 5500, 2020, 11000, 0.90, 5.10, 0.95, true, 'Nitrogen', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 1, 1.00, 1.00, 5778, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', 2, 0.12, 0.0017, 3042, false, 1);
INSERT INTO public.star VALUES (3, 'Sirius A', 'Main Sequence', 3, 2.06, 25.4, 9940, true, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red Supergiant', 4, 16.5, 126000, 3500, true, 1);
INSERT INTO public.star VALUES (5, 'Andromedae Alpha', 'Subgiant', 5, 3.80, 240, 13800, true, 2);
INSERT INTO public.star VALUES (6, 'Trianguli Alpha', 'Subgiant', 6, 1.50, 13, 6500, true, 3);
INSERT INTO public.star VALUES (7, 'Sanduleak -69 202', 'Blue Supergiant', 7, 20.0, 110000, 16000, false, 4);
INSERT INTO public.star VALUES (8, 'SMC WR7', 'Wolf-Rayet', 8, 18.0, 200000, 50000, false, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: observatories_telescopes observatories_telescopes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatories_telescopes
    ADD CONSTRAINT observatories_telescopes_name_key UNIQUE (name);


--
-- Name: observatories_telescopes observatories_telescopes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observatories_telescopes
    ADD CONSTRAINT observatories_telescopes_pkey PRIMARY KEY (observatories_telescopes_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_size_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_size_key UNIQUE (size);


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

