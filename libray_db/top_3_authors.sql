SELECT
    a.author_id,
    CONCAT(a.first_name, ' ', a.last_name) AS full_name,
    author_loans.total_loans,
    author_loans.most_borrowed_book_title,
    author_loans.most_borrowed_book_loans
FROM
    (
        SELECT
            b.author_id,
            COUNT(l.loan_id) AS total_loans,
            most_borrowed_book.book_id,
            most_borrowed_book.title AS most_borrowed_book_title,
            most_borrowed_book.borrow_count AS most_borrowed_book_loans
        FROM
            loans l
            JOIN books b ON l.book_id = b.book_id
            JOIN (
                SELECT
                    b.author_id,
                    l.book_id,
                    COUNT(l.loan_id) AS borrow_count,
                    b.title
                FROM
                    loans l
                    JOIN books b ON l.book_id = b.book_id
                WHERE
                    l.loan_date >= CURRENT_DATE - INTERVAL '6 months'
                GROUP BY
                    b.author_id, l.book_id, b.title
                ORDER BY
                    b.author_id, borrow_count DESC
            ) AS most_borrowed_book ON b.author_id = most_borrowed_book.author_id
            AND b.book_id = most_borrowed_book.book_id
        WHERE
            l.loan_date >= CURRENT_DATE - INTERVAL '6 months'
        GROUP BY
            b.author_id, most_borrowed_book.book_id, most_borrowed_book.title, most_borrowed_book.borrow_count
    ) AS author_loans
    JOIN authors a ON author_loans.author_id = a.author_id
ORDER BY
    author_loans.total_loans DESC
LIMIT 3;
