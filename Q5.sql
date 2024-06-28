-- List the top 5 most ordered pizza types along with their quantities.
SELECT 
    pizza_menu.name, SUM(order_details.quantity) AS quantity
FROM
    pizza_menu
        JOIN
    pizzas ON pizza_menu.pizza_type_id = pizzas.pizza_type_id
        JOIN
    order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_menu.name
ORDER BY quantity DESC
LIMIT 5


