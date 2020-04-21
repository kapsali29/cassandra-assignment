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

ALTER TABLE users add last_login map<varchar, timestamp>;

UPDATE users SET last_login = last_login + {'38345455': '2019-10-30 09:02:24'} WHERE id = 'john-doe';
SELECT * FROM users;

UPDATE users using TTL 60 SET last_login = last_login + {'38345456': '2019-10-30 09:02:24'} where id='john-doe';
SELECT * FROM users;
