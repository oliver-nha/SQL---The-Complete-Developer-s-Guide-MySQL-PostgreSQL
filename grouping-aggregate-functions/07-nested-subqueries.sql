SELECT booking_date
FROM bookings
GROUP BY booking_date
HAVING SUM(amount_billed) = (
        SELECT MIN(daily_sum)
        FROM (
                SELECT booking_date,
                    SUM(amount_billed) as daily_sum
                FROM bookings
                GROUP BY booking_date
            ) as daily_table
    )


-- SELECT LOWER(i.invoice_period) as mnth,
--        SUM (i.net_total_in_cents) / 100.0 as billed,
--        SUM (i.net_total_in_cents) FILTER (WHERE status = 'invoiced') / 100.00 as uncollected,
--        SUM (i.net_total_in_cents) FILTER (WHERE status = 'paid') / 100.00 as collected
-- FROM invoices i
-- GROUP BY 1
-- ORDER BY 1 desc;

-- SELECT
--     c.customer_id,
--     CONCAT(c.first_name, ' ', c.last_name) AS full_name,
--     customer_totals.total_spent,
--     customer_totals.total_quantity,
--     customer_totals.avg_spent_per_purchase,
--     customer_totals.first_purchase_date,
--     customer_totals.last_purchase_date
-- FROM
--     (
--         SELECT
--             s.customer_id,
--             SUM(s.total_amount) AS total_spent,
--             SUM(s.quantity) AS total_quantity,
--             AVG(s.total_amount) AS avg_spent_per_purchase,
--             MIN(s.sale_date) AS first_purchase_date,
--             MAX(s.sale_date) AS last_purchase_date
--         FROM
--             sales s
--             JOIN products p ON s.product_id = p.product_id
--         WHERE
--             p.category = 'Electronics'
--             AND s.sale_date >= CURRENT_DATE - INTERVAL '1 year'
--         GROUP BY
--             s.customer_id
--     ) AS customer_totals
--     JOIN customers c ON customer_totals.customer_id = c.customer_id
-- ORDER BY
--     customer_totals.total_spent DESC
-- LIMIT 5;
