with source_store AS (
    select ID,ORDER_ID,PRODUCT_ID,STATUS,USER_ID,SALE_PRICE,
    cast(replace(CREATED_AT,' UTC','') as timestamp) as CREATED_AT,
    cast(replace(DELIVERED_AT,' UTC','') as timestamp) as DELIVERED_AT,
    cast(replace(RETURNED_AT,' UTC','') as timestamp) as RETURNED_AT,
    cast(replace(RETURNED_AT,' UTC','') as timestamp) as SHIPPED_AT 
    from {{ source("DBT_HANDSON_1_SOURCES", "ORDER_ITEMS")}}
)


select * from source_store
