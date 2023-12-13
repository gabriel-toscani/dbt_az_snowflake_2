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
        discount,
        {{ cents_to_dollars("unitprice", scale=0) }}

    from source

)

select * from renamed
