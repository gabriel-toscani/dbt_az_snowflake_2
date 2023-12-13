{{config(materialized='incremental', strategy='delete+insert')}}

with 

source as (

    select * from {{ source('northwind', 'orders_big') }}

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

  -- this filter will only be applied on an incremental run
  -- (uses > to include records whose timestamp occurred since the last run of this model)
  where extraction_date > (select max(extraction_date) from {{ this }})
    {% endif %}

)

select * from renamed
