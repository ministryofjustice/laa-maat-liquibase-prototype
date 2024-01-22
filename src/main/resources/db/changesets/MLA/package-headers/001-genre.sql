--liquibase formatted sql

--changeset mtac50:001-genre runOnChange:true
CREATE OR REPLACE PACKAGE MLA.genre AS
    PROCEDURE get_genre_name(p_genre_id IN NUMBER, p_genre_name OUT VARCHAR2);
END genre;