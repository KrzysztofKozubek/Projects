--liquibase formatted sql
--changeset author:kris nvoxland:1653243970

CREATE TABLE t_sys_log
(
    id     bigint NOT NULL generated always as identity (increment by 1),
    method varchar(255),
    uri    varchar(255),
    params varchar(255),
    time   bigint,
    CONSTRAINT PK_LOG PRIMARY KEY (id)
);

CREATE TABLE t_sys_auth
(
    id         bigint      NOT NULL generated always as identity (increment by 1),
    auth_name  varchar(50) NOT NULL,
    permission varchar(200),
    CONSTRAINT PK_AUTH PRIMARY KEY (id)
);

CREATE TABLE t_sys_role
(
    id        bigint NOT NULL generated always as identity (increment by 1),
    role_name varchar(50),
    role_code varchar(50),
    CONSTRAINT PK_ROLE PRIMARY KEY (id)
);

CREATE TABLE t_sys_role_auth
(
    id      bigint NOT NULL generated always as identity (increment by 1),
    role_id bigint NOT NULL REFERENCES t_sys_role (id),
    auth_id bigint NOT NULL REFERENCES t_sys_auth (id)
);
CREATE INDEX UX_ROLES ON t_sys_role_auth (role_id);
CREATE INDEX UX_AUTH ON t_sys_role_auth (auth_id);

CREATE TABLE t_sys_user
(
    id       bigint NOT NULL generated always as identity (increment by 1),
    login    varchar(50),
    nickname varchar(100),
    password varchar(255),
    CONSTRAINT PK_USER PRIMARY KEY (id)
);
CREATE INDEX UX_USERNAME ON t_sys_user (login);

CREATE TABLE t_sys_user_role
(
    id      bigint NOT NULL generated always as identity (increment by 1),
    user_id bigint NOT NULL REFERENCES t_sys_user (id),
    role_id bigint NOT NULL REFERENCES t_sys_role (id),
    CONSTRAINT PK_USER_ROLE PRIMARY KEY (id)
);
CREATE INDEX UX_USER_ROLE ON t_sys_user_role (user_id);