with 
    staging as (
        select *
        from {{ref("stg_northwind__product")}}
    )

    select
        {{dbt_utils.generate_surrogate_key(['ID'])}} as product_sk
        , *
    from staging