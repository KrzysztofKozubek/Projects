--liquibase formatted sql
--changeset author:kris nvoxland:1653243971

INSERT INTO t_sys_auth (auth_name, permission)
VALUES (' Edit permissions of system users ', 'ADD_WALLET');
INSERT INTO t_sys_auth (auth_name, permission)
VALUES (' Edit permissions of system users ', 'EDIT_WALLET');
INSERT INTO t_sys_auth (auth_name, permission)
VALUES (' System user query authority ', 'VIEW_WALLET');



INSERT INTO t_sys_role (role_name, role_code)
VALUES (' Ordinary employees ', 'USER');
INSERT INTO t_sys_role (role_name, role_code)
VALUES (' project manager ', 'PM');


INSERT INTO t_sys_role_auth (role_id, auth_id)
VALUES (1, 1);
INSERT INTO t_sys_role_auth (role_id, auth_id)
VALUES (1, 2);
INSERT INTO t_sys_role_auth (role_id, auth_id)
VALUES (1, 3);
INSERT INTO t_sys_role_auth (role_id, auth_id)
VALUES (2, 1);
INSERT INTO t_sys_role_auth (role_id, auth_id)
VALUES (2, 2);
INSERT INTO t_sys_role_auth (role_id, auth_id)
VALUES (2, 3);

INSERT INTO t_sys_user (login, nickname, password)
VALUES ('user', 'C3Stones', '$2a$13$jx2nJtsaqVwrng7uw19bm.ayLcO3qSJI4nz36axsF4hv8D83xdmlq');
INSERT INTO t_sys_user (login, nickname, password)
VALUES ('system', ' Administrators ', '$2a$13$iLElkIyj2JilXgHL23Zx9eqrUpulwiciehbev17iyJ/mItjV0e6V6');

INSERT INTO t_sys_user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO t_sys_user_role (user_id, role_id) VALUES (2, 2);