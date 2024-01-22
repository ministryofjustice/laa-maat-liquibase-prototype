--liquibase formatted sql

--changeset mtac50:001-dummy-trigger runOnChange:true splitStatements:false stripComments:false
CREATE OR REPLACE TRIGGER MLA.dummy_trigger
BEFORE INSERT OR UPDATE OR DELETE
ON MLA.genres
FOR EACH ROW
BEGIN
    NULL; -- No actions, just a dummy trigger
END;