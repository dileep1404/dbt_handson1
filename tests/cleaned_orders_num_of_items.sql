with source_data as (
    select p.order_id,p.num_of_item,d.orders_count from {{ref('int_orders_clean')}} p,
    (SELECT order_id, COUNT(*) AS orders_count FROM {{ref("stg_orderitems_clean")}} GROUP BY order_id having order_id = 109366) d
    where 
    p.order_id = 109366

)

select * from source_data

