-- Calculate the percentage contribution of each pizza type to total revenue
WITH total_sales AS (
    SELECT 
        SUM(od.quantity * p.price) AS total_revenue
    FROM
        order_details od
        JOIN pizzas p ON od.pizza_id = p.pizza_id
)
SELECT 
    pm.category,
    ROUND((SUM(od.quantity * p.price) / ts.total_revenue) * 100, 2) AS revenue_percentage
FROM
    pizza_menu pm
    JOIN pizzas p ON pm.pizza_type_id = p.pizza_type_id
    JOIN order_details od ON od.pizza_id = p.pizza_id
    CROSS JOIN total_sales ts
GROUP BY pm.category, ts.total_revenue
ORDER BY revenue_percentage DESC;

-- wrote the code by my self but later optimised it using chatgpt for learning purposes