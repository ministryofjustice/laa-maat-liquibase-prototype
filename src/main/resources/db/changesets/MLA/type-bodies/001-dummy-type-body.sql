--liquibase formatted sql

--changeset mtac50:001-dummy-type-body runOnChange:true
CREATE OR REPLACE TYPE BODY MLA.DummyType AS
    MEMBER FUNCTION getFullName RETURN VARCHAR2 IS
    BEGIN
        RETURN name;
    END;
END;