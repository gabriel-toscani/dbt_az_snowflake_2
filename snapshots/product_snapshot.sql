{% snapshot product_snapshot %}

    {{
        config(
          target_schema='snapshots',
          strategy='check',
          unique_key='id',
          check_cols=['unitsinstock'],
        )
    }}

    select * from {{ source('northwind', 'product') }}

{% endsnapshot %}