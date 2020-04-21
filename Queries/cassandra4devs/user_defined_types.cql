create keyspace if not exists pluralsight with replication = {'class':'SimpleStrategy', 'replication_factor':1};
use pluralsight;

CREATE TABLE IF NOT EXISTS courses (
  id varchar,
  name varchar static,
  author varchar static,
  audience int static,
  duration int static,
  cc boolean static,
  released timestamp static,
  module_id int,
  module_name varchar,
  module_duration int,
  primary key ( id, module_id )
) with comment = 'a table of courses and modules';

INSERT INTO courses (id, name, author, audience, duration, cc, released) VALUES ('nodejs-big-picture', 'Nodejs The Big Picture', 'Paul OFallon', 4, 31234, True, '2019-02-03');

INSERT INTO courses(id, module_id, module_name, module_duration) VALUES ('nodejs-big-picture', 1, 'Overview', 70);
INSERT INTO courses(id, module_id, module_name, module_duration) VALUES ('nodejs-big-picture', 2, 'Considering Node.js', 870);


CREATE TYPE IF NOT EXISTS clip (
    name varchar,
    duration int
    );

ALTER TABLE courses add clips list<frozen<clip>>;

INSERT INTO courses (id, module_id, clips) VALUES ('nodejs-big-picture', 1, [{name: 'Course Introduction', duration: 31234}]);
SELECT * FROM courses where id='nodejs-big-picture' and module_id=1;

UPDATE courses set clips = clips + [{name: 'Course Overview and Intro', duration: 21344}] where id='nodejs-big-picture' and module_id=2;
SELECT * FROM courses where id='nodejs-big-picture' and module_id=2;

SELECT JSON * FROM courses where id='nodejs-big-picture';