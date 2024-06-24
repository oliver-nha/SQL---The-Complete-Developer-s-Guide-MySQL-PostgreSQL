-- SELECT booking_date, COUNT(booking_date)
-- FROM bookings
-- WHERE amount_billed > 30
-- GROUP BY booking_date;

SELECT booking_date, COUNT(booking_date)
FROM bookings
GROUP BY booking_date
HAVING SUM(amount_billed) > 30;


--- bool_and & bool_or func

-- bool_and => all true then true
-- bool_or => at lest one true then true

-- stddev_samp(height_inches),
-- stddev_pop(height_inches),
-- var_samp(height_inches),
-- var_pop(height_inches)
-- GROUP by gender


-- SELECT
--     brand,
--     segment,
--     SUM (quantity)
-- FROM
--     sales
-- GROUP BY
--     ROLLUP (brand, segment) --- Rollup make total sum of null brand and null segment
-- ORDER BY
--     brand,
--     segment;

-- select category_id,
-- size,
-- count(*),
-- min(price) as "lowest price",
-- max(price) as "highest price",
-- avg(price) as "average price"
-- from inventory.products
-- group by cube (category_id,size)
-- order by category_id,size;  -- return all possible combinations