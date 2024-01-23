--liquibase formatted sql

--changeset mtac50:001-dummy-procedure runOnChange:true splitStatements:false stripComments:false
CREATE OR REPLACE PROCEDURE MLA.dummy_procedure AS
    begin
        select * from MLA.genres;
    end;
END;