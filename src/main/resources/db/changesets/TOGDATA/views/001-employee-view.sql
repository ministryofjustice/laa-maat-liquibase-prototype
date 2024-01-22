--liquibase formatted sql

--changeset mtac50:001-dummy-view runOnChange:true
CREATE OR REPLACE FORCE VIEW TOGDATA.Employee_View AS
SELECT
    first_name,
    last_name
FROM
    TOGDATA.employees;