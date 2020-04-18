create keyspace pluralsight with replication = {'class':'SimpleStrategy', 'replication_factor':1};
use pluralsight;

create table IF NOT EXISTS courses1 (
  id varchar PRIMARY KEY
);

ALTER TABLE courses1 add duration int;
ALTER TABLE courses1 add released timestamp;
ALTER TABLE courses1 add author varchar;
ALTER TABLE courses1 with comment = 'A table of courses';

drop table courses;

CREATE TABLE IF NOT EXISTS courses (
  id varchar PRIMARY KEY ,
  name varchar,
  author varchar,
  duration int,
  cc boolean,
  released timestamp,
  audiance int
) WITH COMMENT = 'A table of courses';
ALTER TABLE courses add title varchar;
ALTER TABLE courses add audiance int;

SELECT id, title from courses;
SELECT title, duration AS length FROM courses WHERE id ='cassandra-developers';
SELECT title , name AS published FROM courses WHERE id in ('cassandra-developers', 'nodejs-big-picture');
SELECT * FROM courses LIMIT 100;

INSERT INTO courses (id, author) VALUES ('cassandra-developers', 'paul-ofallon');

UPDATE courses SET author = 'paul ofalon' WHERE id = 'cassandra-developers';
UPDATE courses SET author = 'paul-ofallon' WHERE id in ('cassandra-developers', 'nodejs-big-picture');

SELECT id, WRITETIME(author) FROM courses;

DELETE FROM courses WHERE id='cassandra-developers';
DELETE author FROM courses WHERE id='cassandra-developers';

UPDATE users USING TTL 32400
SET reset_token = '1dhfhd' WHERE id='john-doe';

SELECT TTL(reset_token) FROM users WHERE id='john-doe';
INSERT INTO users (id, token) VALUES ('john-doe', '12NHDFH') USING TTL 10800;

CREATE TABLE IF NOT EXISTS reset_tokens (
    id VARCHAR PRIMARY KEY,
    token VARCHAR
) WITH default_time_to_live =10800;

// DEMO
INSERT INTO courses (id, name, author, duration, cc, released)
VALUES ('advance-python', 'Advanced Python', 'Robert Smallshire', 13980, TRUE, '2017-06-24');
INSERT INTO courses (id, name, author, duration, cc, released, audiance)
VALUES ('advance-javascript', 'Advanced Javascript', 'Kyle Simpson', 24900, TRUE, '2015-04-09', 2);
INSERT INTO courses (id, name, author, duration, cc, released, audiance)
VALUES ('nodejs-big-picture', 'Node js Big Picture', 'Paul OFallon', 3240, TRUE, '2019-06-03', 1);
INSERT INTO courses (id, name, author, duration, cc, released, audiance)
VALUES ('raspberry-pi-for-developers', 'Raspberry Pi for Developers', 'John Flanders', 8640, TRUE, '2013-05-30', 2);
INSERT INTO courses (id, name, author, duration, cc, released, audiance)
VALUES ('react-big-picture', 'React The Big Picture', 'Cory House', 3240, TRUE, '2017-11-21', 1);

SELECT * FROM courses;
SELECT id, cc, writetime(cc) FROM courses WHERE id='advance-javascript';
UPDATE courses SET cc=FALSE WHERE id='advance-javascript';
select id, name, writetime(name) FROM courses WHERE id='advance-javascript';
SELECT id, token(id) FROM courses;


CREATE TABLE IF NOT EXISTS users (
    id varchar primary key ,
    first_name varchar,
    last_name varchar,
    email varchar,
    password varchar
) with comment = 'a table of users';

INSERT INTO users (id, first_name, last_name) values ('john-doe', 'John', 'Doe');
UPDATE users SET first_name = 'Jane', last_name='Doe' WHERE id = 'jane-doe';

ALTER TABLE users add reset_token varchar;
update users SET reset_token='abc1' ttl 120 WHERE id='john-doe';

select ttl(reset_token) from users;
