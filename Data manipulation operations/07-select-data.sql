SELECT 'Hello',
    2500,
    date_created,
    customer_name,
    product_name,
    volume / 1000 as "Total_sales"
FROM sales;