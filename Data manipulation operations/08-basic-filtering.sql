-- select * from sales where volume >= 1000;

-- SELECT * FROM sales WHERE is_recurring = TRUE;

SELECT * FROM sales WHERE (is_disputed IS TRUE) AND (volume > 5000);
