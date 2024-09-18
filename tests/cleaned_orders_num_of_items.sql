with source_data as (
    select p.order_id,p.num_of_item,d.orders_count from {{ref('int_orders_clean')}} p,
    (SELECT order_id, COUNT(*) AS orders_count FROM {{ref("cleaned_order_items")}} GROUP BY order_id having order_id = 109366) d
    where 
    p.order_id = 109366

)

Select count(*) as cnt_value from source_data having cnt_value<1

