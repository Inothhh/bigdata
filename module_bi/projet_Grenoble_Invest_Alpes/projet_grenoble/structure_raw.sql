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
         SELECT base_entreprises.siret_txt,
            base_entreprises.siret,
            base_entreprises."société",
            base_entreprises.nom_historique,
            base_entreprises.naf732,
            base_entreprises.secteur,
            base_entreprises."activité_naf_détaillée_(insee)",
            base_entreprises.enseigne,
            base_entreprises."année_de_création_de_létablissement",
            base_entreprises.commune,
            base_entreprises.code_commune_insee,
            base_entreprises.epci,
            base_entreprises.effectifs_2024,
            base_entreprises."date_de_mise_à_jour_des_effectifs",
            base_entreprises.segmentation,
            base_entreprises."sport-montagne",
            base_entreprises.sportdomaine,
            base_entreprises.cleantech,
            base_entreprises.sante,
            base_entreprises.santedomaine,
            base_entreprises.energie,
            base_entreprises.energiedomaine,
            base_entreprises.numerique,
            base_entreprises.num_domaine,
            base_entreprises.chimie,
            base_entreprises.chimiedomaine
           FROM raw.base_entreprises
        ), renamed AS (
         SELECT source.siret_txt,
            source.siret,
            source."société" AS nom_societe,
            source.nom_historique,
            source.naf732 AS code_naf,
            source.secteur,
            source."activité_naf_détaillée_(insee)" AS activite_naf_detaillee,
            source.enseigne,
            (source."année_de_création_de_létablissement")::integer AS annee_creation,
            source.commune,
            (source.code_commune_insee)::integer AS code_commune_insee,
            source.epci,
            (source.effectifs_2024)::integer AS effectifs_2024,
            source."date_de_mise_à_jour_des_effectifs",
            source.segmentation,
            source."sport-montagne",
            source.sportdomaine,
            source.cleantech,
            source.sante,
            source.santedomaine
           FROM source
        )
 SELECT siret_txt,
    siret,
    nom_societe,
    nom_historique,
    code_naf,
    secteur,
    activite_naf_detaillee,
    enseigne,
    annee_creation,
    commune,
    code_commune_insee,
    epci,
    effectifs_2024,
    "date_de_mise_à_jour_des_effectifs",
    segmentation,
    "sport-montagne",
    sportdomaine,
    cleantech,
    sante,
    santedomaine
   FROM renamed;


ALTER VIEW raw.stg_base_entreprise OWNER TO binome8;

--
-- PostgreSQL database dump complete
--

