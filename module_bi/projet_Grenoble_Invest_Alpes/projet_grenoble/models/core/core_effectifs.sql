select
    siret,
    nom_societe,
    commune,
    secteur,
    coalesce(effectifs_2024, 0) as effectifs,
    case 
        when effectifs_2024 >= 100 then 'Grande entreprise'
        when effectifs_2024 >= 10 then 'PME'
        else 'TPE'
    end as categorie_taille
from {{ ref('stg_base_entreprise') }}
where effectifs_2024 is not null
