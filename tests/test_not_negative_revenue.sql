{{ config(error_if = '>50', warn_if = '>20') }}

with
    orderdetail as (
        select *
        from {{ref("stg_northwind__orderdetail")}}
    )

    , product as (
        select *
        from {{ref("stg_northwind__product")}}
    )

select 
    productname
    , sum(orderdetail.unitprice * quantity) as revenue
from orderdetail
left join product on orderdetail.productid = product.id
group by productname
having revenue <= 10000