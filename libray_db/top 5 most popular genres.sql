SELECT
    b.genre,
    COUNT(l.loan_id) AS total_books_borrowed,
    most_borrowed_book.title AS most_borrowed_book_title,
    most_borrowed_book.borrow_count AS most_borrowed_book_loans
FROM
    loans l
    JOIN books b ON l.book_id = b.book_id
    JOIN (
        SELECT
            b.genre,
            l.book_id,
            COUNT(l.loan_id) AS borrow_count,
            b.title
        FROM
            loans l
            JOIN books b ON l.book_id = b.book_id
        WHERE
            l.loan_date >= CURRENT_DATE - INTERVAL '3 months'
        GROUP BY
            b.genre, l.book_id, b.title
        ORDER BY
            b.genre, borrow_count DESC
    ) AS most_borrowed_book ON b.genre = most_borrowed_book.genre
    AND l.book_id = most_borrowed_book.book_id
GROUP BY
    b.genre, most_borrowed_book.title, most_borrowed_book.borrow_count
ORDER BY
    total_books_borrowed DESC
LIMIT 5;
