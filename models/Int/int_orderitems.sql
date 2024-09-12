with source_data as (
    select *,{{time_travel('CREATED_AT',10,'years')}}  as n_created_at,
    {{time_travel('DELIVERED_AT',10,'years')}}  as n_delivered_at,
    {{time_travel('RETURNED_AT',20,'years')}}  as n_returned_at,
    {{time_travel('SHIPPED_AT',-1,'years')}}  as n_shipped_at
    from {{ref('stg_orderitems')}}
)

select * from source_data