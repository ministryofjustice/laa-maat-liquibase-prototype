--liquibase formatted sql

--changeset mtac50:001-dummy-type runOnChange:true
CREATE OR REPLACE FORCE VIEW MLA.Genre_View AS
SELECT
    genre_name
FROM
    MLA.genres;