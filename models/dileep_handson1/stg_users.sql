with source_store AS (
    select ID,
	FIRST_NAME,
	LAST_NAME,
	EMAIL,
	AGE,
	GENDER,
	STATE,
	STREET_ADDRESS,
	POSTAL_CODE,
	CITY,
	COUNTRY,
	LATITUDE,
	LONGITUDE,
	TRAFFIC_SOURCE,
	cast (replace(CREATED_AT,'UTC','')as timestamp) as CREATED_AT
    from {{ source("DBT_HANDSON_1_SOURCES", "USERS")}}
)


select * from source_store