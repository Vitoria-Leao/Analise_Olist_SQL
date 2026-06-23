WITH ds_ultimo_pedido (customer_id,Ultimo_Pedido,Data_Limite) AS
(SELECT customer_id,
MAX(order_purchase_t) AS Ultimo_Pedido,
DATETIME('now','-90 days') AS Data_Limite
FROM olist_orders_dataset
GROUP BY customer_id)
 
Select customer_id AS Clientes_Inativos, Ultimo_Pedido
FROM ds_ultimo_pedido
WHERE Ultimo_Pedido < Data_Limite;