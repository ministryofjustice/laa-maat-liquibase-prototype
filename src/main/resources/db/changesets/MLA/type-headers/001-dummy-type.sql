--liquibase formatted sql

--changeset mtac50:001-dummy-type runOnChange:true
CREATE OR REPLACE TYPE MLA.DummyType AS OBJECT (
    id NUMBER,
    name VARCHAR2(255)
);