with source_store AS (
    select ORDER_ID,
	USER_ID,
	STATUS,
	GENDER,
    NUM_OF_ITEM,
    cast(replace(CREATED_AT,' UTC','') as timestamp) as CREATED_AT,
    cast(replace(DELIVERED_AT,' UTC','') as timestamp) as DELIVERED_AT,
    cast(replace(RETURNED_AT,' UTC','') as timestamp) as RETURNED_AT,
    cast(replace(RETURNED_AT,' UTC','') as timestamp) as SHIPPED_AT 
    from {{ source("DBT_HANDSON_1_SOURCES", "ORDERS")}}
)

select * from source_store