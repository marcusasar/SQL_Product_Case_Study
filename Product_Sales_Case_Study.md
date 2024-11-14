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

These are the list of the top 5 products with highest sales in the past year (2019).
| Products | Total_Quantity |
| ------------------------ | -------- |
| AAA Batteries (4-pack) | 31012 |
| AA Batteries (4-pack) | 27635 |
| USB-C Charging Cable | 23971 |
| Lightning Charging Cable | 23211 |
| Wired Headphones | 20553 |

The AAA Batteries (4-pack) have the highest quantity, while Wired Headphones have the lowest in this top 5 sales.

### 2. What are the top 5 products with the least sales in last year?

```sql
WITH product_least_sales (products, quantity) AS (
    SELECT product,
        SUM(quantity_ordered)
    FROM sales
    WHERE YEAR(order_date) = "2019"
    GROUP BY product
)
SELECT *
FROM product_least_sales
ORDER BY quantity ASC
LIMIT 5;
```

**Answer:**

Top 5 products with least sales in last year.
| Products | Total_Quantity |
| ------------------ | -------- |
| LG Dryer | 646 |
| LG Washing Machine | 666 |
| Vareebadd Phone | 2067 |
| 20in Monitor | 4126 |
| ThinkPad Laptop | 4128 |

LG Dryer and LG Washing Machine were the products with least quantity ordered by customers, while 20in Monitor and ThinkPad Laptop had some good sales among the list.

### 3. What was the sales volume for each city during last year?

```sql
WITH sales_by_city(city, total_quantity) AS (
	SELECT
		city,
        SUM(quantity_ordered)
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

| City          | Total_quantity |
| ------------- | -------------- |
| San Francisco | 50226          |
| Los Angeles   | 33288          |
| New York City | 27916          |
| Boston        | 22524          |
| Dallas        | 16728          |
| Atlanta       | 16602          |
| Seattle       | 16552          |
| Portland      | 14051          |
| Austin        | 11151          |

The data on total quantities sold across different cities reveals the following trends:

- **San Francisco** leads with the highest total quantity sold, reaching **50,226** units, marking it as the top city.
- **Los Angeles** follows with **33,288** units, still significantly behind San Francisco but leading the second tier of cities.
- **New York City** comes in third, with **27,916** units sold, maintaining a strong position among the top cities.
- **Boston** shows a solid performance with **22,524** units sold, higher than the cities trailing behind it.
- **Dallas** and **Atlanta** are close in sales quantity, with **16,728** and **16,602** units sold, respectively.
- **Seattle** is also within this range, at **16,552** units, showing similar sales performance to Dallas and Atlanta.
- **Portland** has sold **14,051** units, and **Austin** has the lowest sales quantity at **11,151** units.

In summary, San Francisco stands out in both total quantity sold figures, while cities like Austin and Portland report significantly lower quantities sold compared to the leaders in the list.

### 4. Which product made high sales in each of these cities?

```sql
WITH product_sales_by_city(city, product, total_quantity) AS (
    SELECT
        city,
        product,
        SUM(quantity_ordered) AS total_quantity
    FROM
        sales
    GROUP BY
        city,
        product

),ranking AS (
SELECT
    *,
     DENSE_RANK() OVER(PARTITION BY city ORDER BY total_quantity DESC) AS rn
FROM
    product_sales_by_city
)
SELECT
    *
FROM
    ranking
WHERE
    rn <= 1;
```

**Answer:**

| City          | Product                | Total_quantity |
| ------------- | ---------------------- | -------------- |
| Atlanta       | AAA Batteries (4-pack) | 2359           |
| Austin        | AAA Batteries (4-pack) | 1668           |
| Boston        | AAA Batteries (4-pack) | 3461           |
| Dallas        | AAA Batteries (4-pack) | 2504           |
| Los Angeles   | AAA Batteries (4-pack) | 4967           |
| New York City | AAA Batteries (4-pack) | 4124           |
| Portland      | AAA Batteries (4-pack) | 2080           |
| San Francisco | AAA Batteries (4-pack) | 7408           |
| Seattle       | AAA Batteries (4-pack) | 2446           |

The output clearly shows that AAA Batteries (4-pack) was the product with high sales volume in each city:

- **San Francisco** leads in sales with **7,408** units of AAA batteries sold, far outpacing all other cities.
- **Los Angeles** follows with **4,967** units, securing the second spot.
- **New York City** also performs strongly with **4,124** units sold, ranking third.
- **Boston** reports a solid **3,461** units sold, while **Dallas** is slightly ahead at **2,504** units.
- **Atlanta** sells **2,359** units, while **Seattle** is close behind with **2,446** units sold.
- **Austin** and **Portland** have the lowest sales, with **1,668** and **2,080** units sold, respectively.

In summary, **San Francisco** dominates the market for AAA batteries, followed by major cities like **Los Angeles** and **New York City**, while cities such as **Austin** and **Portland** see much lower sales volumes.
