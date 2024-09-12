with source_data as (
    select * from {{ref('stg_products')}}
)

select * from source_data