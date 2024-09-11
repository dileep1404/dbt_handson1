with source_store AS (
    select * from {{ source("DBT_HANDSON_1_SOURCES", "PRODUCTS")}}
)


select * from source_store