CREATE VIEW vw_Receita_Mensal AS 
SELECT STRFTIME('%Y',o.order_purchase_t) AS Ano, STRFTIME('%m-%Y',o.order_purchase_t) AS Data, SUM(p.payment_value) as Receita_Total
FROM olist_order_payments_dataset as p
INNER JOIN olist_orders_dataset AS o
ON p.order_id = o.order_id
GROUP BY Data
ORDER BY Ano ASC;

SELECT * FROM vw_Receita_Mensal;