with 
    source as (
        select *
        from {{source('northwind', '_order_')}}
    )

select *
from source