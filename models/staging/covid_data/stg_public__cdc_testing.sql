with 

source as (

    select * from {{ source('covid_data', 'cdc_testing') }}

),

renamed as (

    select
        iso3166_1,
        iso3166_2,
        date,
        positive,
        negative,
        inconclusive

    from source

)

select * from renamed
