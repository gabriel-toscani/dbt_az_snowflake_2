with 
    customer as (
        select *
        from {{ref('dim_customers')}}
    )

    , product as (
        select *
        from {{ref("dim_products")}}
    )

    , orderdetails as (
        select *
        from {{ref('int_join_orders_and_details')}}
    )

    , revenue_calculation as (
        select 
            customer.customer_sk
            , product.product_sk
            , sum(quantity * orderdetails.unitprice)
        from orderdetails
        left join customer on orderdetails.customerid = customer.id
        left join product on orderdetails.productid = product.id
        group by customer_sk, product_sk
    )

    select *
    from revenue_calculation