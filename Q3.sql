-- Identify the highest-priced pizza.
SELECT 
    pizza_menu.name, pizzas.price
FROM
    pizza_menu
        JOIN
    pizzas ON pizza_menu.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC
LIMIT 1

