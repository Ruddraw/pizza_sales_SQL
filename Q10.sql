-- Determine the top 3 most ordered pizza types based on revenue.
SELECT 
    pizza_menu.name,
    SUM(order_details.quantity * pizzas.price) AS revenue
FROM
    pizza_menu
        JOIN
    pizzas ON pizzas.pizza_type_id = pizza_menu.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_menu.name
ORDER BY revenue DESC
LIMIT 3 