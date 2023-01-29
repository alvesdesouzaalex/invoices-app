CREATE TABLE IF NOT EXISTS "user" (

	id BIGINT   PRIMARY KEY   NOT NULL,
	"name"            VARCHAR(100)  NOT NULL,
	email           VARCHAR(100)  UNIQUE NOT NULL,
	password           VARCHAR(255)  NOT NULL,
    attachment           VARCHAR(255)

);

CREATE SEQUENCE IF NOT EXISTS user_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE IF NOT EXISTS permission (
	id BIGINT PRIMARY KEY NOT NULL,
	description VARCHAR(50) NOT NULL
);

CREATE SEQUENCE IF NOT EXISTS permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE IF NOT EXISTS  user_permission (
	user_id BIGINT NOT NULL,
	permission_id BIGINT NOT NULL,
	PRIMARY KEY (user_id, permission_id),
	FOREIGN KEY (user_id) REFERENCES "user"(id),
	FOREIGN KEY (permission_id) REFERENCES permission(id)
);


INSERT INTO "user" (id, "name", email, password)
VALUES (nextval('user_seq'), 'Administrador','alvesdesouzaalex@gmail.com', '$2a$10$KMYBIUAj8Lpk9BNDZxWMieGUESFYTb/XU0kPDqBHeyvwfppW.rKlG'),
       (nextval('user_seq'), 'Administrador','aas.zal.1977@gmail.com', '$2a$10$0SRMSVY60PiIfnDfnN6uGOFSbxPirSmkAwhKVlMEzXf4qCppA/cwi');

INSERT INTO permission (id, description)
VALUES (1, 'ROLE_ADMIN'),
       (2, 'ROLE_USER');

-- admin
INSERT INTO user_permission (user_id, permission_id)
VALUES ((select id from "user" where email = 'alvesdesouzaalex@gmail.com'), 1),
       ((select id from "user" where email = 'aas.zal.1977@gmail.com'), 2);