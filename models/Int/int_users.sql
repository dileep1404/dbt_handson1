with source_data as (
    select *,{{time_travel('CREATED_AT',10,'years')}} as n_created_at
    from {{ref('stg_users')}}
)

select * from source_data