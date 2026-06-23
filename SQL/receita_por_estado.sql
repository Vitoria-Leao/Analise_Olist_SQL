CREATE VIEW vw_Receita_Estadual AS
SELECT c.customer_state AS Estado,
(CAST(ROUND(SUM(p.payment_value)/1000000,2) as TEXT)|| ' Milhões') as Receita_Por_Estado
FROM olist_customers_dataset AS c 
INNER JOIN olist_orders_dataset as o 
ON c.customer_id = o.customer_id
INNER JOIN olist_order_payments_dataset AS p 
ON o.order_id = p.order_id
GROUP BY Estado
ORDER BY Receita_Por_Estado DESC;

SELECT * FROM vw_Receita_Estadual;