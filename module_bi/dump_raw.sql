--
-- PostgreSQL database dump
--

-- Dumped from database version 16.8 (Debian 16.8-1.pgdg120+1)
-- Dumped by pg_dump version 16.9 (Ubuntu 16.9-0ubuntu0.24.04.1)

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

--
-- Name: raw; Type: SCHEMA; Schema: -; Owner: binome8
--

CREATE SCHEMA raw;


ALTER SCHEMA raw OWNER TO binome8;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: base_entreprises; Type: TABLE; Schema: raw; Owner: binome8
--

CREATE TABLE raw.base_entreprises (
    siret_txt text,
    siret text,
    "société" text,
    nom_historique text,
    naf732 text,
    secteur text,
    "activité_naf_détaillée_(insee)" text,
    enseigne text,
    "année_de_création_de_létablissement" text,
    commune text,
    code_commune_insee double precision,
    epci text,
    effectifs_2024 double precision,
    "date_de_mise_à_jour_des_effectifs" text,
    segmentation double precision,
    "sport-montagne" double precision,
    sportdomaine text,
    cleantech double precision,
    sante double precision,
    santedomaine text,
    energie double precision,
    energiedomaine text,
    numerique double precision,
    num_domaine text,
    chimie double precision,
    chimiedomaine text
);


ALTER TABLE raw.base_entreprises OWNER TO binome8;

--
-- Name: my_first_dbt_model; Type: TABLE; Schema: raw; Owner: binome8
--

CREATE TABLE raw.my_first_dbt_model (
    id integer
);


ALTER TABLE raw.my_first_dbt_model OWNER TO binome8;

--
-- Name: my_second_dbt_model; Type: VIEW; Schema: raw; Owner: binome8
--

CREATE VIEW raw.my_second_dbt_model AS
 SELECT id
   FROM raw.my_first_dbt_model
  WHERE (id = 1);


ALTER VIEW raw.my_second_dbt_model OWNER TO binome8;

--
-- Name: stg_base_entreprise; Type: VIEW; Schema: raw; Owner: binome8
--

CREATE VIEW raw.stg_base_entreprise AS
 WITH source AS (
         SELECT base_entreprises_1.siret_txt,
            base_entreprises_1.siret,
            base_entreprises_1."société",
            base_entreprises_1.nom_historique,
            base_entreprises_1.naf732,
            base_entreprises_1.secteur,
            base_entreprises_1."activité_naf_détaillée_(insee)",
            base_entreprises_1.enseigne,
            base_entreprises_1."année_de_création_de_létablissement",
            base_entreprises_1.commune,
            base_entreprises_1.code_commune_insee,
            base_entreprises_1.epci,
            base_entreprises_1.effectifs_2024,
            base_entreprises_1."date_de_mise_à_jour_des_effectifs",
            base_entreprises_1.segmentation,
            base_entreprises_1."sport-montagne",
            base_entreprises_1.sportdomaine,
            base_entreprises_1.cleantech,
            base_entreprises_1.sante,
            base_entreprises_1.santedomaine,
            base_entreprises_1.energie,
            base_entreprises_1.energiedomaine,
            base_entreprises_1.numerique,
            base_entreprises_1.num_domaine,
            base_entreprises_1.chimie,
            base_entreprises_1.chimiedomaine
           FROM raw.base_entreprises base_entreprises_1
        )
 SELECT siret_txt,
    "société" AS denomination,
    commune,
    code_commune_insee,
    "année_de_création_de_létablissement" AS annee_creation,
    secteur,
    effectifs_2024
   FROM raw.base_entreprises;


ALTER VIEW raw.stg_base_entreprise OWNER TO binome8;

--
-- PostgreSQL database dump complete
--

