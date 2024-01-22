--liquibase formatted sql

--changeset mtac50:001-dummy-type-body runOnChange:true splitStatements:false stripComments:false
CREATE OR REPLACE TYPE BODY MLA.DummyType AS
  constructor function DummyType return self as result as
    BEGIN
        return;
    END;
END;