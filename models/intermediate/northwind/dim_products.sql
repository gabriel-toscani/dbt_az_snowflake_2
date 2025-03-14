with
    products as (
        select *
        from {{ref('stg_northwind__customer')}}
    )

select 
    row_number() over(order by id desc) as product_sk
    , *
from products