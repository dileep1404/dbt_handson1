
with source_store AS (
    select * from {{ source("DBT_HANDSON_1_SOURCES", "ORDERS")}}
)

select * from source_store