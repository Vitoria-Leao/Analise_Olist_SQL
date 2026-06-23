SELECT x.Data, 
ROUND((x.Receita-x.Receita_Mes_Anterior)/x.Receita_Mes_Anterior,2) AS Crescimento_Receita
FROM (
  SELECT  STRFTIME('%m-%Y',o.order_purchase_t) AS Data, 
  ROUND(SUM(p.payment_value),2) as Receita,
  LAG(SUM(p.payment_value),1) OVER (ORDER BY STRFTIME('%Y-%m',o.order_purchase_t)) AS Receita_Mes_Anterior
  FROM olist_orders_dataset AS o
  INNER JOIN olist_order_payments_dataset AS p 
  ON o.order_id = p.order_id
  GROUP BY Data) AS x;