create keyspace if not exists pluralsight with replication = {'class':'SimpleStrategy', 'replication_factor':1};
use pluralsight;

CREATE TABLE IF NOT EXISTS courses (
  id varchar,
  name varchar static,
  author varchar static,
  audience int static,
  duration int static,
  released timestamp static,
  module_id int,
  module_name varchar,
  module_duration int,
  primary key ( id, module_id )
) with comment = 'a table of courses and modules';

INSERT INTO courses (id, name, author, audience, duration, released) VALUES ('nodejs-big-picture', 'Nodejs The Big Picture', 'Paul OFallon', 4, 31234, '2019-02-03');

INSERT INTO courses(id, module_id, module_name, module_duration) VALUES ('nodejs-big-picture', 1, 'Overview', 70);
INSERT INTO courses(id, module_id, module_name, module_duration) VALUES ('nodejs-big-picture', 2, 'Considering Node.js', 870);

ALTER TABLE courses add features set<varchar> static ;

UPDATE courses set features = {'cc'} where id='nodejs-big-picture';
SELECT distinct id, name, features from courses;

UPDATE courses set features = features + {'f1', 'f2'} WHERE id='nodejs-big-picture';
SELECT distinct id, name, features from courses;

UPDATE courses set features = features - {'f1', 'f2'} WHERE id='nodejs-big-picture';
SELECT distinct id, name, features from courses;

ALTER TABLE courses add clips list<varchar>;

UPDATE courses set clips = ['Course Overview'] WHERE id='nodejs-big-picture' and module_id=1;
SELECT * FROM courses where id='nodejs-big-picture' and module_id=1;

UPDATE courses set clips = clips + ['Course Intro'] where id = 'nodejs-big-picture' and module_id=2;
SELECT * FROM courses where id='nodejs-big-picture' and module_id=2;

UPDATE courses set clips[0] = 'Course Introduction' where id = 'nodejs-big-picture' and module_id=2;
SELECT * FROM courses where id='nodejs-big-picture' and module_id=2;

UPDATE courses set clips = clips + ['clip1' ,'clip2'] WHERE id='nodejs-big-picture' and module_id=1;
SELECT * FROM courses where id='nodejs-big-picture' and module_id=1;

UPDATE courses set clips = clips - ['clip1', 'clip2'] WHERE id='nodejs-big-picture' and module_id=1;
SELECT * FROM courses where id='nodejs-big-picture' and module_id=1;


