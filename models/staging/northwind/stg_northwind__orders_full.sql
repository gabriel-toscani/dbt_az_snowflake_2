{{ config(materialized = 'incremental'
        , unique_key = 'new_id') }}

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
{% if is_incremental() %}

where extraction_date > (select max(extraction_date) from {{ this }})

{% endif %}

)

select * from renamed
