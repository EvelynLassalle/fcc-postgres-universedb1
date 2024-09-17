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
    name character varying(200) NOT NULL,
    light_years_from_earth integer,
    description text,
    size numeric(20,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(200) NOT NULL,
    planet_id integer NOT NULL,
    planet character varying(200),
    radius numeric(15,2)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(200) NOT NULL,
    star_id integer,
    has_moon boolean DEFAULT false NOT NULL,
    number_of_moons integer,
    has_atmosphere boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: space_station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_station (
    space_station_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_operational boolean,
    galaxy_id integer
);


ALTER TABLE public.space_station OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(200) NOT NULL,
    galaxy_id integer,
    distance_light_yrs integer,
    constellation character varying(150)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2180000, 'Also known as Messier 31, a sprial galaxy that is the brightest external galaxy you can see', 1.00);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 25800, 'A spiral galaxy which we live in, appearing as a milky band of light in the sky', 52850.00);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 500000000, 'An elliptical galaxy with billions of stars in its featurless oval, the dark streaks in the visable image are bands of dust blocking the starlight', 510000.00);
INSERT INTO public.galaxy VALUES (4, 'Canis Major Dwarf', 12000, 'A dwarf galaxy closest to the milky way found to date, that is roughly elliptical in shape', 25000.00);
INSERT INTO public.galaxy VALUES (5, 'Magellanic Clouds', 158200, 'Irregular galaxies that share a gaseous envelope and lie about 22 degrees apart in the sky near teh south celestial pole', 7000.00);
INSERT INTO public.galaxy VALUES (6, 'Virgo A', 55000000, 'An elliptical galaxy with over 700 galaxies appearing in the cluster including the milky way', 7500000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Moon', 1, 'Earth', 155.30);
INSERT INTO public.moon VALUES (3, 'Io', 4, 'Pluto', 652.00);
INSERT INTO public.moon VALUES (4, 'Titan', 1, 'Saturn', 569.40);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Jupiter', 543.20);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Earth', 684.70);
INSERT INTO public.moon VALUES (7, 'Amalthea', 7, 'Uranus', 635.70);
INSERT INTO public.moon VALUES (8, 'Callisto', 6, 'Mars', 367.60);
INSERT INTO public.moon VALUES (9, 'Adrastea', 8, 'Neptune', 632.70);
INSERT INTO public.moon VALUES (10, 'Himalia', 9, 'Charon', 752.60);
INSERT INTO public.moon VALUES (11, 'Ananke', 10, '2003 UB313', 945.23);
INSERT INTO public.moon VALUES (13, 'Carme', 12, 'Mercury', 953.30);
INSERT INTO public.moon VALUES (14, 'Carpo', 10, 'Venus', 341.60);
INSERT INTO public.moon VALUES (15, 'Herse', 9, 'Jupiter', 536.90);
INSERT INTO public.moon VALUES (16, 'Thebe', 2, 'Jupiter', 354.80);
INSERT INTO public.moon VALUES (17, 'Aitne', 4, 'Jupiter', 123.30);
INSERT INTO public.moon VALUES (18, 'Kalyke', 3, 'Jupiter', 366.90);
INSERT INTO public.moon VALUES (19, 'Arche', 1, 'Jupiter', 358.90);
INSERT INTO public.moon VALUES (20, 'Sponde', 1, 'Jupiter', 126.30);
INSERT INTO public.moon VALUES (21, 'Dione', 8, 'Saturn', 236.40);
INSERT INTO public.moon VALUES (23, 'Dione1', 3, 'Saturn', 234.40);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 1, false, 7, true);
INSERT INTO public.planet VALUES (3, 'Mars', 2, true, 8, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 5, false, 79, true);
INSERT INTO public.planet VALUES (5, 'Saturn', 6, true, 82, false);
INSERT INTO public.planet VALUES (6, 'Uranus', 1, true, 27, true);
INSERT INTO public.planet VALUES (7, 'Neptune', 5, false, 11, false);
INSERT INTO public.planet VALUES (8, 'Charon', 2, false, 0, false);
INSERT INTO public.planet VALUES (9, '2003 UB313', 3, false, 10, false);
INSERT INTO public.planet VALUES (10, 'Ceres', 4, false, 0, true);
INSERT INTO public.planet VALUES (12, 'Venus', 5, false, 360, false);
INSERT INTO public.planet VALUES (13, 'Venus2', 5, false, 360, false);
INSERT INTO public.planet VALUES (1, 'Pluto', 2, true, 5, false);


--
-- Data for Name: space_station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_station VALUES (1, 'International Space Station', false, 5);
INSERT INTO public.space_station VALUES (2, 'Tiangong Space Station', true, 3);
INSERT INTO public.space_station VALUES (3, 'Skylab Space Station', false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', 1, 9500, 'Scutum');
INSERT INTO public.star VALUES (2, 'V766 Centauri Aa', 2, 8300, 'Centaurus');
INSERT INTO public.star VALUES (3, 'KY Cygni', 3, 5000, 'Cygnus');
INSERT INTO public.star VALUES (4, 'AH Scorpii', 1, 1060, 'Scorpius');
INSERT INTO public.star VALUES (5, 'W Cephei', 4, 163082, 'Cepheus');
INSERT INTO public.star VALUES (6, 'Westerlund 1 W237', 5, 8500, 'Ara');


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
-- Name: space_station space_station_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_name_key UNIQUE (name);


--
-- Name: space_station space_station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_station
    ADD CONSTRAINT space_station_pkey PRIMARY KEY (space_station_id);


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
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

