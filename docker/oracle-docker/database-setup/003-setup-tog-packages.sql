
-- Add Stored Procedure to TOGDATA Schema

CREATE OR REPLACE PACKAGE TOGDATA.employee AS
    PROCEDURE get_employee_salary(
        p_employee_id IN NUMBER,
        p_salary OUT NUMBER
    );
    PROCEDURE get_employee_name(
        p_employee_id IN NUMBER,
        p_salary OUT VARCHAR2
    );
END employee;

CREATE OR REPLACE PACKAGE BODY TOGDATA.employee AS

    PROCEDURE get_employee_salary(p_employee_id IN NUMBER, p_salary OUT NUMBER) IS
    BEGIN
        SELECT salary
        INTO p_salary
        FROM employees
        WHERE employee_id = p_employee_id;
    END get_employee_salary;

    PROCEDURE get_employee_name(p_employee_id IN NUMBER, p_name OUT VARCHAR2) IS
    BEGIN
        SELECT first_name
        INTO p_name
        FROM employees
        WHERE employee_id = p_employee_id;
    END get_employee_name;
END employee;


-- Commit Changes
COMMIT;