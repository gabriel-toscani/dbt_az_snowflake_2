{% snapshot customers_snapshot %}

    {{
        config(
          target_schema='dbt_gtoscani',
          strategy='check',
          unique_key='id',
          check_cols=['phone']
        )
    }}

    select * 
    from {{ source('northwind', 'customer') }}

{% endsnapshot %}