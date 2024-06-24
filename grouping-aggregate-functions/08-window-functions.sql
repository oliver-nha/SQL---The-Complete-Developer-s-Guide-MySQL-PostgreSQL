-- select booking_date,
--     amount_tipped,
--     sum(amount_tipped) OVER(
--         PARTITION BY booking_date
--         ORDER BY amount_billed
--     )
-- FROM bookings;

select booking_date,
    amount_tipped,
    RANK() OVER(
        PARTITION BY booking_date
        ORDER BY amount_tipped DESC
    )
FROM bookings;

-- select booking_date,
--     amount_tipped,
--     row_number() OVER(
--         PARTITION BY booking_date
--         ORDER BY amount_tipped DESC
--     )
-- FROM bookings;


