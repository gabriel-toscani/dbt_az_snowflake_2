with
    customers as (
        select *
        from {{ref('stg_northwind__customer')}}
    )

select 
    *
from customers