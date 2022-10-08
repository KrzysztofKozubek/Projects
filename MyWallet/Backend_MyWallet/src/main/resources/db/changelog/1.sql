--liquibase formatted sql
--changeset author:kris nvoxland:1

ALTER TABLE transaction_category
    ADD COLUMN keywords varchar;