--liquibase formatted sql

--changeset mtac50:001-employee runOnChange:true splitStatements:false stripComments:false
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