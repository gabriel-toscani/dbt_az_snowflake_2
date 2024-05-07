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
    limit 100
    {%endif%}

)

select * from renamed
