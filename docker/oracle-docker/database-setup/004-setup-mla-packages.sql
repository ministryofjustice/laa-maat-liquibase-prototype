
-- Add Stored Procedure to MLA Schema
CREATE OR REPLACE PACKAGE MLA.books AS
    CREATE OR REPLACE PROCEDURE get_book_author(p_book_id IN NUMBER, p_author OUT VARCHAR2);
END books;

CREATE OR REPLACE PACKAGE BODY MLA.books AS
    CREATE OR REPLACE PROCEDURE get_book_author(p_book_id IN NUMBER, p_author OUT VARCHAR2) IS
    BEGIN
        SELECT author
        INTO p_author
        FROM books
        WHERE book_id = p_book_id;
    END get_book_author;
END books;

-- Commit Changes
COMMIT;