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

**These are the list of the top 5 products with highest sales in the past year (2019).**
| Products | Quantity |
| ------------------------ | -------- |
| AAA Batteries (4-pack) | 31012 |
| AA Batteries (4-pack) | 27635 |
| USB-C Charging Cable | 23971 |
| Lightning Charging Cable | 23211 |
| Wired Headphones | 20553 |

**The AAA Batteries (4-pack) have the highest quantity, while Wired Headphones have the lowest in this top 5 sales.**

### 2. What are the top 5 products with the least sales in last year?

```sql
WITH product_least_sales (products, quantity) AS (
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
    product_least_sales
ORDER BY
    quantity ASC
LIMIT 5;
```

**Answer:**

**Top 5 products with least sales in last year**
| Products | Quantity |
| ------------------ | -------- |
| LG Dryer | 646 |
| LG Washing Machine | 666 |
| Vareebadd Phone | 2067 |
| 20in Monitor | 4126 |
| ThinkPad Laptop | 4128 |

## Q3. What was the sale volume for each city during last year?

```sql
WITH sales_by_city(city, total_quantitys) AS (
	SELECT
		city,
        SUM(quantity_ordered) AS total_sales
	FROM
		sales
	WHERE
		YEAR(order_date) = "2019"
	GROUP BY
		city
)
SELECT
	*
FROM
	sales_by_city
ORDER BY
	total_quantity DESC;
```

| City          | total_quantity |
| ------------- | -------------- |
| San Francisco | 50226          |
| Los Angeles   | 33288          |
| New York City | 27916          |
| Boston        | 22524          |
| Atlanta       | 16602          |
| Seattle       | 16552          |
| Portland      | 14051          |
| Austin        | 11151          |

The sales data for several major cities reveals the following:

- **San Francisco** leads with the highest total sales of **$50,226**, significantly outpacing all other cities.
- **Los Angeles** follows with **$33,288** in sales, nearly 17,000 less than San Francisco.
- **New York City** comes next with **$27,916** in total sales.
- **Boston** reports **$22,524** in sales, slightly ahead of the remaining cities.
- **Dallas** and **Atlanta** have similar figures, with **$16,728** and **$16,602** in sales respectively.
- **Seattle** is slightly behind Atlanta at **$16,552** in sales.
- **Portland** follows with **$14,051** in sales, and **Austin** has the lowest total sales at **$11,151**.

In summary, San Francisco stands out as the leader in total sales, while cities like Austin and Portland are at the bottom of the list.
