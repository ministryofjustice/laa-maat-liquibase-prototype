--liquibase formatted sql

--changeset mtac50:001-employee runOnChange:true splitStatements:false stripComments:false
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
        SELECT first_name || ' ' || second_name
        INTO p_name
        FROM employees
        WHERE employee_id = p_employee_id;
    END get_employee_name;
END employee;