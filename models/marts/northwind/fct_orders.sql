with 
    product as (
        select *
        from {{ref('dim_products')}}
    )

    , customer as (
        select *
        from {{ref('dim_customers')}}
    )

    , order_and_details as (
        select *
        from {{ref('join_order_and_detail')}}
    )

select 
    product_sk
    , customer_sk
    , order_and_details.* 
from order_and_details
left join product on order_and_details.productid = product.id
left join customer on order_and_details.customerid = customer.id