with source as (

    select * from {{ source('raw', 'base_entreprises') }}

),

renamed as (

    select
        siret_txt,
        siret,
        société as nom_societe,
        nom_historique,
        naf732 as code_naf,
        secteur,
        "activité_naf_détaillée_(insee)" as activite_naf_detaillee,
        enseigne,
        "année_de_création_de_létablissement"::int as annee_creation,
        commune,
        code_commune_insee::int,
        epci,
        effectifs_2024::int,
        "date_de_mise_à_jour_des_effectifs",
        segmentation,
        "sport-montagne",
        sportdomaine,
        cleantech,
        sante,
        santedomaine

    from source
)

select * from renamed
