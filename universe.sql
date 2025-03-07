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
    name character varying(100) NOT NULL,
    age_in_billions numeric(6,3),
    type character varying(50),
    num_stars_in_billions numeric(20,0),
    discovered_by character varying(100),
    discovery_yr integer,
    diameters_in_lightyears integer,
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
    orbit_in_days numeric(12,4),
    distance_from_planet_km numeric(12,2),
    discovered_by character varying(100),
    discovery_yr integer,
    has_subsurface_ocean boolean,
    notes text,
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
    name character varying(100) NOT NULL,
    type character varying(50),
    mass_to_earth numeric(10,4),
    has_moons boolean,
    discovered_by character varying(100),
    discovery_yr integer,
    is_habitable boolean,
    notes text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_network; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_network (
    planet_network_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    planet_id integer,
    moon_id integer,
    discovered_by character varying(100),
    discovery_yr integer,
    notes text
);


ALTER TABLE public.planet_network OWNER TO freecodecamp;

--
-- Name: planet_network_planet_network_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_network_planet_network_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_network_planet_network_id_seq OWNER TO freecodecamp;

--
-- Name: planet_network_planet_network_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_network_planet_network_id_seq OWNED BY public.planet_network.planet_network_id;


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
    name character varying(100) NOT NULL,
    temp_in_kelvin integer,
    type character varying(50),
    radius_in_km numeric(15,2),
    age_in_billions numeric(6,2),
    has_planets boolean,
    notes text,
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
-- Name: planet_network planet_network_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_network ALTER COLUMN planet_network_id SET DEFAULT nextval('public.planet_network_planet_network_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.610, 'Spiral', 100, 'Galileo Galilei', 1610, 100000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Cigar Galaxy', 13.300, 'Starburst', 30, 'Johann Elert Bode', 1774, 37000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', 0.400, 'Ring', NULL, 'Fritz Zwicky', 1941, 144300, 'There are an estimated several billion stars, though the exact number isn''t clear since some of the brighter areas aren''t actually stars.');
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 13.280, 'Spiral', 100, 'Edward Pigott', 1779, 56000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Fireworks Galaxy', 12.000, 'Spiral', 100, 'Sir William Herschel', 1798, 40000, 'Alteratively known as NGC 6946.');
INSERT INTO public.galaxy VALUES (7, 'Canis Major Dwarf', 13.000, 'Irregular', 1, NULL, 2003, 5000, 'Discovered by a team of astronomers from France, Italy, Australia, and The United Kingdom.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon (Earth''s Satellite)', 27.3000, 384400.00, 'Ancient Astronomers', NULL, false, 'Earth''s only natural satellite.', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.3189, 9376.00, 'Asaph Hall', 1877, false, 'Slowly spiraling towards Mars.', 3);
INSERT INTO public.moon VALUES (3, 'Deimos', 1.2600, 23460.00, 'Asaph Hall', 1877, false, 'Smaller and farther than Phobos.', 3);
INSERT INTO public.moon VALUES (4, 'Charon', 6.3870, 19640.00, 'James Christy', 1978, false, 'Largest moon of Pluto, tidally locked.', 9);
INSERT INTO public.moon VALUES (5, 'Nix', 24.8600, 48690.00, 'Hubble Space Telescope', 2005, false, 'Irregularly shaped, chaotic rotation.', 9);
INSERT INTO public.moon VALUES (6, 'Hydra', 38.2000, 64738.00, 'Hubble Space Telescope', 2005, false, 'Second largest moon of Pluto.', 9);
INSERT INTO public.moon VALUES (7, 'Kerberos', 32.1000, 57750.00, 'Hubble Space Telescope', 2011, false, 'Appears to have a double-lobed shape.', 9);
INSERT INTO public.moon VALUES (8, 'Styx', 20.2000, 42656.00, 'Hubble Space Telescope', 2012, false, 'Smallest of Pluto''s five moons.', 9);
INSERT INTO public.moon VALUES (9, 'Namaka', 18.3000, 256700.00, 'Michael Brown et al.', 2005, false, 'Inner moon of Haumea.', 11);
INSERT INTO public.moon VALUES (10, 'Hi''iaka', 49.1000, 49880.00, 'Michael Brown et al.', 2005, false, 'Larger than Namaka, orbits further away.', 11);
INSERT INTO public.moon VALUES (11, 'Dysnomia', 15.8000, 37370.00, 'Michael Brown et al.', 2005, false, 'Only known moon of Eris.', 12);
INSERT INTO public.moon VALUES (12, 'Ganymede', 7.1500, 1070400.00, 'Galileo Galilei', 1610, true, 'Largest moon in the Solar System.', 2);
INSERT INTO public.moon VALUES (13, 'Io', 1.7700, 421800.00, 'Galileo Galilei', 1610, false, 'Most volcanically active body in the Solar System.', 2);
INSERT INTO public.moon VALUES (14, 'Titania', 8.7100, 435910.00, 'William Herschel', 1787, false, 'Largest moon of Uranus.', 8);
INSERT INTO public.moon VALUES (15, 'Callisto', 16.6900, 1882700.00, 'Galileo Galilei', 1610, false, 'Second largest Galilean moon, heavily cratered.', 2);
INSERT INTO public.moon VALUES (16, 'Oberon', 13.4600, 583520.00, 'William Herschel', 1787, false, 'Second largest moon of Uranus', 8);
INSERT INTO public.moon VALUES (17, 'Ariel', 2.5200, 191020.00, 'William Lassell', 1851, false, 'Has evidence of cryovolcanism.', 8);
INSERT INTO public.moon VALUES (18, 'Triton', 5.8800, 354759.00, 'William Lassell', 1846, true, 'Retrograde orbit, potential subsurface ocean.', 7);
INSERT INTO public.moon VALUES (19, 'Proteus', 1.1200, 117647.00, 'Voyager 2', 1989, false, 'Second largest moon of Neptune', 7);
INSERT INTO public.moon VALUES (20, 'Nereid', 360.1000, 5513400.00, 'Gerard Kuiper', 1949, false, 'Highly eccentric orbit.', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 1.0000, true, 'Ancient Astronomers', NULL, true, 'The only planet known to support life.', 2);
INSERT INTO public.planet VALUES (2, 'Jupiter', 'Gas Giant', 317.8000, true, 'Ancient Astronomers', NULL, false, 'Largest planet in the Solar System, famous for the Great Red Spot.', 2);
INSERT INTO public.planet VALUES (3, 'Mars', 'Terrestrial', 0.1070, true, 'Ancient Astronomers', NULL, false, 'Known as the Red Planet, has evidence of past liquid water.', 2);
INSERT INTO public.planet VALUES (4, 'Venus', 'Terrestrial', 0.8150, false, 'Ancient Astronomers', NULL, false, 'Hottest planet in the Solar System due to runaway greenhouse effect.', 2);
INSERT INTO public.planet VALUES (5, 'Mercury', 'Terrestrial', 0.0550, false, 'Ancient Astronomers', NULL, false, 'Smallest planet in the Solar System, closest to the Sun.', 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 95.2000, true, 'Ancient Astronomers', NULL, false, 'Famous for its extensive ring system.', 2);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice Giant', 17.1000, true, 'Johann Galle', 1846, false, 'First planet discovered via mathematical predictions.', 2);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Ice Giant', 14.5000, true, 'William Herschel', 1781, false, 'Rotates on its side with an extreme axial tilt.', 2);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf Planet', 0.0022, true, 'Clyde Tombaugh', 1930, false, 'Demoted from planetary status in 2006.', 2);
INSERT INTO public.planet VALUES (10, 'Ceres', 'Dwarf Planet', 0.0002, false, 'Giuseppe Piazzi', 1801, false, 'Largest object in the asteroid belt.', 2);
INSERT INTO public.planet VALUES (11, 'Haumea', 'Dwarf Planet', 0.0007, true, 'Michael Brown et al.', 2004, false, 'Has a fast rotation causing an elongated shape.', 2);
INSERT INTO public.planet VALUES (12, 'Eris', 'Dwarf Planet', 0.0028, true, 'Michael Brown et al.', 2005, false, 'More massive than Pluto, led the redefinition of planets.', 2);


--
-- Data for Name: planet_network; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_network VALUES (1, 'Solar System: Earth', 2, 1, NULL, 'Ancient Astronomers', NULL, 'Earth orbits the Sun in the Solar System.');
INSERT INTO public.planet_network VALUES (2, 'Solar System: Mars & Phobos', 2, 3, 2, 'Asaph Hall', 1877, 'Phobos is a moon of Mars.');
INSERT INTO public.planet_network VALUES (3, 'Solar System: Mars & Deimos', 2, 3, 3, 'Asaph Hall', 1877, 'Deimos is a moon of Mars.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 5772, 'G2V', 696340.00, 4.60, true, 'The largest object in our Solar System.', 1);
INSERT INTO public.star VALUES (3, 'Rigel', 12100, 'B8la', 54890000.00, 0.90, false, 'Seventh brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 3500, 'RSG', 617000000.00, 0.10, false, 'One of the largest stars visible to the naked eye.', 1);
INSERT INTO public.star VALUES (5, 'Arcturus', 4290, 'K1.5lll', 17671000.00, 7.11, false, 'Fourth brightest star in the night sky.', 1);
INSERT INTO public.star VALUES (6, 'Stephenson 2-18', 3200, 'RSG', 1495800000.00, 0.14, false, 'Incredibly bright luminosity that''s estimated to be over 10 million times that of the Sun.', 1);
INSERT INTO public.star VALUES (1, 'Sirius', 9940, 'RSG', 1700000.00, 0.23, false, 'Brightest star in the night sky.', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_network_planet_network_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_network_planet_network_id_seq', 3, true);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet_network planet_network_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_network
    ADD CONSTRAINT planet_network_name_key UNIQUE (name);


--
-- Name: planet_network planet_network_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_network
    ADD CONSTRAINT planet_network_pkey PRIMARY KEY (planet_network_id);


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
-- Name: planet_network planet_network_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_network
    ADD CONSTRAINT planet_network_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: planet_network planet_network_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_network
    ADD CONSTRAINT planet_network_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_network planet_network_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_network
    ADD CONSTRAINT planet_network_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

