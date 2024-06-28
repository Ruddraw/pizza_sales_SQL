-- Analyze the cumulative revenue generated over time.

SELECT 
    date,
    SUM(revenue) OVER (ORDER BY date) AS cumulative_revenue
FROM (
    SELECT 
        o.date,
        SUM(od.quantity * p.price) AS revenue
    FROM 
        order_details od
        JOIN pizzas p ON od.pizza_id = p.pizza_id
        JOIN orders o ON o.order_id = od.order_id
    GROUP BY 
        o.date
) AS sales
ORDER BY date;

