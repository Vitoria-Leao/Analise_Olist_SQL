SELECT STRFTIME('%m-%Y',o.order_purchase_t) AS Data, 
ROUND(SUM(p.payment_value),2) as Receita, 
ROUND(SUM(SUM(p.payment_value)) OVER (PARTITION BY STRFTIME('%Y',o.order_purchase_t) ORDER BY o.order_purchase_t ASC),2) AS Receita_Acumulada
FROM olist_orders_dataset AS o
INNER JOIN olist_order_payments_dataset AS p 
ON o.order_id = p.order_id
GROUP BY Data;