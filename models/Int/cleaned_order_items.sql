with source_data as(
    select *,( row_number() over
    (partition by ORDER_ID,PRODUCT_ID order by CREATED_AT desc)) as fil 
    from {{ref('int_orderitems')}}
)

select * from source_data where fil = 1