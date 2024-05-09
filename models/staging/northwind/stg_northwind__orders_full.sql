with 

source as (

    select * from {{ source('northwind', 'orders_full') }}

),

renamed as (

    select
        new_id,
        id,
        customerid,
        employeeid,
        orderdate,
        requireddate,
        shippeddate,
        shipvia,
        freight,
        shipname,
        shipaddress,
        shipcity,
        shipregion,
        shippostalcode,
        shipcountry,
        productid,
        unitprice,
        quantity,
        extraction_date

    from source

)

select * from renamed
