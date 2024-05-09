with
    orders_and_details as (
        select *
        from {{ref('join_order_and_detail')}}
    )


    , us_states as (
        select *
        from {{ref('seed_us_cities_states_counties')}}
    )


    , covid_report as (
        select *
        from {{ref('int_covid_report')}}
    )


    , revenue_by_state as (
        select
            us_states."State full" as state
            , sum(total_revenue) as total_revenue
        from orders_and_details
        left join us_states on orders_and_details.shipcity = us_states."City"
        group by us_states."State full"
    )


    , add_covid_data as (
        select
            covid_report.*
            , total_revenue
        from covid_report
        left join revenue_by_state on covid_report.state = revenue_by_state.state
    )


select *
from add_covid_data
