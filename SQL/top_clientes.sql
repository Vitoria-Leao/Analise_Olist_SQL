CREATE VIEW vw_Top_Clientes AS
SELECT c.customer_id as Cliente, 
SUM(p.payment_value) AS Total_Receita_Cliente,
DENSE_RANK() OVER (ORDER BY SUM(p.payment_value) DESC) AS Ranking
FROM olist_customers_dataset as c
INNER JOIN olist_orders_dataset as o
ON c.customer_id = o.customer_id
INNER JOIN olist_order_payments_dataset AS p
ON o.order_id = p.order_id
GROUP BY Cliente
ORDER BY Total_Receita_Cliente DESC
LIMIT 10;

SELECT * FROM vw_Top_Clientes;