# 🛒 Product Sales Analytics

## 📌 Solution

### 1. What are the top 5 products with the highest sales in the past year?

```sql
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

```

**Answer:**

**These are the list of the top products with highest sales in the past year (2019).**
| Products | sales |
| ------------------------ | -------- |
| AAA Batteries (4-pack) | 31012 |
| AA Batteries (4-pack) | 27635 |
| USB-C Charging Cable | 23971 |
| Lightning Charging Cable | 23211 |
| Wired Headphones | 20553 |

**The AAA Batteries (4-pack) have the highest quantity, while Wired Headphones have the lowest in this top 5 sales.**
