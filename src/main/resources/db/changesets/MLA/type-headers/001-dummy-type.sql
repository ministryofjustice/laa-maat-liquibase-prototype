--liquibase formatted sql

--changeset mtac50:001-dummy-type runOnChange:true splitStatements:false stripComments:false
CREATE OR REPLACE TYPE MLA.DummyType AS OBJECT (
    id NUMBER,
    name VARCHAR2(255)
) ALTER TYPE MLA.DummyType ADD constructor function DummyType RETURN self as result CASCADE;