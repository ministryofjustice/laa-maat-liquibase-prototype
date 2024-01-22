--liquibase formatted sql

--changeset mtac50:001-dummy-trigger runOnChange:true
CREATE OR REPLACE TRIGGER TOGDATA.dummy_trigger
BEFORE INSERT OR UPDATE OR DELETE
ON TOGDATA.employees
FOR EACH ROW
BEGIN
    NULL; -- No actions, just a dummy trigger
END;