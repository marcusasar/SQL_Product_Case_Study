-- 1. What are the top 5 products with the highest sales in the past year? --

WITH product_highest_sales (products, quantity) AS (
    SELECT
      product,
      SUM(quantity_ordered)
    FROM
      sales
    WHERE
      YEAR(order_date) = "2019"
    GROUP BY
      product
)
SELECT
	*
FROM
	product_highest_sales
ORDER BY
	quantity DESC
LIMIT 5;