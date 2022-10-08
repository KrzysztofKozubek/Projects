--liquibase formatted sql
--changeset author:kris nvoxland:2

CREATE TABLE transaction_group_category
(
    id       bigint NOT NULL generated always as identity (increment by 1),
    user_id  bigint REFERENCES t_sys_user (id),
    name     varchar(255),
    color    varchar(255),
    keywords varchar(255),
    CONSTRAINT PK_TRANSACTION_GROUP_CATEGORY PRIMARY KEY (id)
);
CREATE INDEX UX_TRANSACTION_GROUP_CATEGORY ON transaction_group_category (user_id);