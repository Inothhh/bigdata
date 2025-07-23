-- models/staging/stg_base_entreprises.sql
select
  siret,
  société as nom_societe,
  cast(effectifs_2024 as integer) as nb_effectifs,
  lower(commune) as commune_normalisée
from {{ source('raw', 'base_entreprises') }}
