--liquibase formatted sql

--changeset mtac50:001-dummy-procedure runOnChange:true splitStatements:false stripComments:false
CREATE OR REPLACE PROCEDURE TOGDATA.dummy_procedure AS
    begin
        select * from TOGDATA.employees;
    end;
END;