with 
    orders as (
        select *
        from {{ref('stg_northwind___order_')}}
    )

    , orderdetails as (
        select *
        from {{ref('stg_northwind__orderdetail')}}
    )

    select
        orders.*
        , orderdetails.productid
        , orderdetails.quantity
        , orderdetails.unitprice
    from orders
    left join orderdetails on orders.id = orderdetails.orderid