--liquibase formatted sql

--changeset mtac50:001-dummy-type runOnChange:true
CREATE OR REPLACE TYPE TOGDATA.DummyType AS OBJECT (
    id NUMBER,
    name VARCHAR2(255)
);