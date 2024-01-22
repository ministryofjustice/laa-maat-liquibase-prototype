--liquibase formatted sql

--changeset mtac50:001-genre runOnChange:true
CREATE OR REPLACE PACKAGE BODY MLA.genre AS
    PROCEDURE get_genre_name(p_genre_id IN NUMBER, p_genre_name OUT VARCHAR2) IS
    BEGIN
        SELECT genre_name
        INTO p_genre_name
        FROM genres
        WHERE genre_id = p_genre_id;
    END get_genre_name;
END genre;