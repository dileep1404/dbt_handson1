WITH top5_category AS (
    SELECT
        oi.ID,
        oi.Sale_Price,
        p.Category
    FROM
        {{ ref('int_orderitems') }} oi
    JOIN
        {{ ref('int_products') }} p
    ON
        oi.Product_Id = p.ID
    WHERE
        oi.Status NOT IN ('Cancelled', 'Returned')
),

total_revenue AS (
    SELECT
        Category,
        SUM(Sale_Price) AS Total_Revenue
    FROM
        top5_category
    GROUP BY
        Category
),

ranked_categories AS (
    SELECT
        Category,
        Total_Revenue,
        ROW_NUMBER() OVER (
            ORDER BY Total_Revenue DESC
        ) AS rank
    FROM
        total_revenue
)

SELECT
    Category,
    Total_Revenue
FROM
    ranked_categories
WHERE
    rank <= 5