WITH top_5_users AS (
    SELECT oi.USER_ID, oi.Sale_Price, u.ID, u.FIRST_NAME, u.LAST_NAME, oi.STATUS FROM
        {{ ref('stg_orderitems') }} oi
    JOIN
        {{ ref('stg_users') }} u
    ON
        oi.USER_ID = u.ID
    WHERE
        oi.Status NOT IN ('Cancelled', 'Returned')
),
total_revenue AS (
    SELECT
        ID,
        SUM(Sale_Price) AS Total_Revenue
    FROM
        top_5_users
    GROUP BY
        ID
),
ranked_categories AS (
    SELECT
        ID,
        Total_Revenue,
        ROW_NUMBER() OVER (
            ORDER BY Total_Revenue DESC
        ) AS rank
    FROM
        total_revenue
),
top_users as (
SELECT
    ID,
    Total_Revenue
FROM
    ranked_categories
WHERE
    rank <= 5
)
SELECT  u.FIRST_NAME, u.LAST_NAME,  tu.Total_Revenue FROM
        top_users tu
    JOIN
        {{ ref('stg_users') }} u
    ON
        tu.ID = u.ID