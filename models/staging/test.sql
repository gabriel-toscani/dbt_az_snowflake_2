{{ config(materialized = 'table')}}

select *
from NORTHWIND.RAW_NORTHWIND._ORDER_