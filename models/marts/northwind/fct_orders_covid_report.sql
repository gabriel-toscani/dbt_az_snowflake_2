with 
    orders_and_details as (
        select *
        from {{ref('int_order_and_detail')}}
    )

    , us_cities as (
        select *
        from {{ref('seed_us_cities_states_counties')}}
    )

    , covid_report as (
        select *
        from {{ref('int_covid_report')}}
    )

    