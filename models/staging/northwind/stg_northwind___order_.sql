{{config(materialized='incremental')}}

with 

source as (

    select * from {{ source('northwind', '_order_') }}

),

renamed as (

    select
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
        shipcountry

    from source
    {% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  -- (uses > to include records whose timestamp occurred since the last run of this model)
  where orderdate > (select max(orderdate) from {{ this }})
    {% endif %}
)

select * from renamed
