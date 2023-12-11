select 
    productname
    , sum(orderdetail.unitprice * quantity) as revenue
from {{ref("stg_northwind__orderdetail")}} orderdetail
left join {{ref("stg_northwind__product")}} product on orderdetail.productid = product.id
group by productname