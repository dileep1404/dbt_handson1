with source_data as(
select p.ORDER_ID,p.USER_ID, p.STATUS,p.GENDER,
p.CREATED_AT,p.SHIPPED_AT,p.DELIVERED_AT,p.RETURNED_AT
,d.orders_count as num_of_item from {{ref("int_orders")}} p
inner join
(SELECT order_id, COUNT(*) AS orders_count FROM {{ref("stg_orderitems_clean")}} GROUP BY order_id) d
on p.order_id = d.order_id
)


select * from source_data