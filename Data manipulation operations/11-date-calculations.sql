-- select * from sales where date_fulfilled is not null;

-- SELECT * FROM sales
-- WHERE date_fulfilled - date_created <= 5;


SELECT * FROM sales
WHERE EXTRACT(DAY FROM date_fulfilled - date_created) <= 5;