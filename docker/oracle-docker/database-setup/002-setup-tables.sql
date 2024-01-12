

-- Create Tables in TOGDATA Schema
CREATE TABLE TOGDATA.employees
(
    employee_id NUMBER PRIMARY KEY,
    first_name  VARCHAR2(50),
    last_name   VARCHAR2(50),
    salary      NUMBER
);

CREATE TABLE TOGDATA.departments
(
    department_id   NUMBER PRIMARY KEY,
    department_name VARCHAR2(50)
);

CREATE TABLE TOGDATA.projects
(
    project_id   NUMBER PRIMARY KEY,
    project_name VARCHAR2(50),
    start_date   DATE,
    end_date     DATE
);


-- Create Tables in MLA Schema
CREATE TABLE MLA.books
(
    book_id          NUMBER PRIMARY KEY,
    title            VARCHAR2(100),
    author           VARCHAR2(100),
    publication_date DATE
);

CREATE TABLE MLA.publishers
(
    publisher_id   NUMBER PRIMARY KEY,
    publisher_name VARCHAR2(100)
);

CREATE TABLE MLA.genres
(
    genre_id   NUMBER PRIMARY KEY,
    genre_name VARCHAR2(50)
);

-- Commit Changes
COMMIT;