with 
    staging as (
        select *
        from {{ref("stg_northwind__customer")}}
    )

    select
        {{dbt_utils.generate_surrogate_key(['ID'])}} as customer_sk
        , *
    from staging