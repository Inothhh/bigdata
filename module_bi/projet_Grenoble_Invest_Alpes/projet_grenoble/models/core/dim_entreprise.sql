{{ config(
    materialized='view',
    schema='core'
) }}


with base as (
    select
        siret_txt,
        siret,
        nom_societe,
        nom_historique,
        code_naf,
        secteur,
        activite_naf_detaillee,
        enseigne,
        annee_creation,
        commune,
        code_commune_insee
    from {{ ref('stg_base_entreprise') }}
    where annee_creation::text ~ '^[0-9]{4}$'
)

select
    *,
    case
        when annee_creation >= 2000 then 'Récente'
        when annee_creation >= 1980 then 'Moderne'
        else 'Ancienne'
    end as tranche_anciennete
from base
