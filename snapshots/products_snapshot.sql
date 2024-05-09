{% snapshot product_snapshot %}

    {{
        config(
          target_schema='dbt_gtoscani_snapshots',
          strategy='check',
          unique_key='id',
          check_cols=['unitprice', 'unitsinstock']
        )
    }}

    select * 
    from {{ source('northwind', 'product') }}

{% endsnapshot %}