-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.

WITH ranked_pizzas AS (
    SELECT 
        pm.category,
        pm.name,
        SUM(od.quantity * p.price) AS revenue,
        RANK() OVER (PARTITION BY pm.category ORDER BY SUM(od.quantity * p.price) DESC) AS rn
    FROM 
        pizza_menu pm
        JOIN pizzas p ON pm.pizza_type_id = p.pizza_type_id
        JOIN order_details od ON od.pizza_id = p.pizza_id
    GROUP BY 
        pm.category, pm.name
)
SELECT 
    category, 
    name, 
    revenue
FROM 
    ranked_pizzas
WHERE 
    rn <= 3
ORDER BY 
    category, 
    revenue DESC;

-- optimise by chatpgt