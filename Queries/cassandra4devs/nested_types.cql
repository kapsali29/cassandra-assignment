create keyspace if not exists pluralsight with replication = {'class':'SimpleStrategy', 'replication_factor':1};
use pluralsight;

CREATE TABLE IF NOT EXISTS users (
    id varchar primary key ,
    first_name varchar,
    last_name varchar,
    email varchar,
    password varchar
) with comment = 'a table of users';

INSERT INTO users (id, first_name, last_name) values ('john-doe', 'John', 'Doe');
UPDATE users SET first_name = 'Jane', last_name='Doe' WHERE id = 'jane-doe';

ALTER TABLE users add last_login map<varchar, frozen<tuple<timestamp, inet>>>;

UPDATE users set last_login = last_login + {'23456789':('2019-10-30 09:02:24', '123.156.1.1')} where id='john-doe';
SELECT * FROM users;
