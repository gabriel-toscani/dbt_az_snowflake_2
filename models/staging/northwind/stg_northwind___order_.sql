{{config(materialized='incremental', unique_key='id')}}

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

    from 
)

select * from renamed
