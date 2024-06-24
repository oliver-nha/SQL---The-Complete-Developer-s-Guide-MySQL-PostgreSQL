SELECT
    m.member_id,
    CONCAT(m.first_name, ' ', m.last_name) AS full_name,
    member_loans.total_books_borrowed,
    member_loans.most_borrowed_book_title,
    member_loans.most_borrowed_book_loans
FROM
    (
        SELECT
            l.member_id,
            COUNT(l.loan_id) AS total_books_borrowed,
            most_borrowed_book.book_id,
            most_borrowed_book.title AS most_borrowed_book_title,
            most_borrowed_book.borrow_count AS most_borrowed_book_loans
        FROM
            loans l
            JOIN (
                SELECT
                    l.member_id,
                    l.book_id,
                    COUNT(l.loan_id) AS borrow_count,
                    b.title
                FROM
                    loans l
                    JOIN books b ON l.book_id = b.book_id
                WHERE
                    l.loan_date >= CURRENT_DATE - INTERVAL '3 months'
                GROUP BY
                    l.member_id, l.book_id, b.title
                ORDER BY
                    l.member_id, borrow_count DESC
            ) AS most_borrowed_book ON l.member_id = most_borrowed_book.member_id
            AND l.book_id = most_borrowed_book.book_id
        WHERE
            l.loan_date >= CURRENT_DATE - INTERVAL '3 months'
        GROUP BY
            l.member_id, most_borrowed_book.book_id, most_borrowed_book.title, most_borrowed_book.borrow_count
    ) AS member_loans
    JOIN members m ON member_loans.member_id = m.member_id
ORDER BY
    member_loans.total_books_borrowed DESC
LIMIT 5;
