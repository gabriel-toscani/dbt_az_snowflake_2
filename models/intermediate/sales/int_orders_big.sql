with orders_big as (
    select *
    from {{ref("stg_northwind__orders_big")}}
)

select *
from orders_big