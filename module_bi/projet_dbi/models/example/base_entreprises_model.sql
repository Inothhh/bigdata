-- modèle de transformation
SELECT 
    siret,
    société,
    commune,
    secteur,
    effectifs_2024
FROM {{ source('raw', 'base_entreprises') }}
WHERE commune IS NOT NULL;
