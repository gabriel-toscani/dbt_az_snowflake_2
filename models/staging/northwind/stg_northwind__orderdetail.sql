with 

source as (

    select * from {{ source('northwind', 'orderdetail') }}

),

renamed as (

    select
        id,
        orderid,
        productid,
        unitprice,
        quantity,
        discount

    from source

    {% if env_var("DBT_TARGET_SCHEMA") == 'prod' %}

    where reference_date >= current_date() - 'INTERVAL 7 DAYS'
    
    {% endif %}

)

select * from renamed
