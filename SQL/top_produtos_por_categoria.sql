SELECT p.product_id,
p.product_category,
ROUND(SUM(o.price+o.freight_value),2) AS Receita_Por_Produto,
DENSE_RANK() OVER (PARTITION BY p.product_category ORDER BY SUM(o.price+o.freight_value) DESC)
FROM olist_order_items_dataset AS o 
INNER JOIN olist_products_dataset AS p
ON o.product_id = p.product_id
GROUP BY p.product_id;