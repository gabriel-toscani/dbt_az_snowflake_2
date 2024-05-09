with 

source as (

    select * from {{ source('covid_data', 'cdc_policy_measures') }}

),

renamed as (

    select
        state_id,
        county,
        fips_code,
        policy_level,
        date,
        policy_type,
        start_stop,
        comments,
        source,
        total_phase,
        iso3166_1,
        iso3166_2,
        last_update_date,
        last_reported_flag

    from source

)

select * from renamed
