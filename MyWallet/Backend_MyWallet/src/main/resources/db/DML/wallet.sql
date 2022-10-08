--liquibase formatted sql
--changeset author:kris nvoxland:1653243972
CREATE TABLE wallet
(
    id              bigint NOT NULL generated always as identity (increment by 1),
    user_id         bigint REFERENCES t_sys_user (id),
    name            varchar(255),
    amount_of_money decimal,
    CONSTRAINT PK_WALLET PRIMARY KEY (id)
);
CREATE INDEX UX_WALLET ON wallet (user_id);

CREATE TABLE bank
(
    id              bigint NOT NULL generated always as identity (increment by 1),
    user_id         bigint REFERENCES t_sys_user (id),
    wallet_id       bigint REFERENCES wallet (id),
    name            varchar(255),
    amount_of_money decimal,
    CONSTRAINT PK_BANK PRIMARY KEY (id)
);
CREATE INDEX UX_BANK ON bank (user_id);
CREATE INDEX UX_BANK_WALLET ON bank (wallet_id);

CREATE TABLE transaction_category
(
    id      bigint NOT NULL generated always as identity (increment by 1),
    user_id bigint REFERENCES t_sys_user (id),
    name    varchar(255),
    CONSTRAINT PK_TRANSACTION_CATEGORY PRIMARY KEY (id)
);
CREATE INDEX UX_TRANSACTION_CATEGORY ON transaction_category (user_id);

CREATE TABLE transaction
(
    id          bigint NOT NULL generated always as identity (increment by 1),
    user_id     bigint REFERENCES t_sys_user (id),
    name        varchar(255),
    amount      decimal,
    timestamp   timestamptz,
    category_id bigint NOT NULL REFERENCES transaction_category (id),
    bank_id     bigint NOT NULL REFERENCES bank (id),
    wallet_id   bigint NOT NULL REFERENCES wallet (id),
    CONSTRAINT PK_TRANSACTION PRIMARY KEY (id)
);
CREATE INDEX UX_TRANSACTION ON transaction (user_id);
CREATE INDEX UX_BANK_TRANSACTION ON transaction (bank_id);
CREATE INDEX UX_WALLET_TRANSACTION ON transaction (wallet_id);
