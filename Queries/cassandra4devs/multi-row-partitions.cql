create keyspace pluralsight with replication = {'class':'SimpleStrategy', 'replication_factor':1};
use pluralsight;

CREATE TABLE IF NOT EXISTS courses (
  id varchar,
  name varchar,
  author varchar,
  audience int,
  duration int,
  cc boolean,
  released timestamp,
  module_id int,
  module_name varchar,
  module_duration int,
  primary key ( id, module_id )
) with comment = 'a table of courses and modules';

INSERT INTO courses (id, name, author, audience, duration, cc, released, module_id, module_name, module_duration) VALUES
('advance-python', 'Advanced Python', 'Robert Smallshire', 3, 13980, TRUE, '2017-06-24', 1, 'overview', 123);
INSERT INTO courses (id, name, author, audience, duration, cc, released, module_id, module_name, module_duration) VALUES
('nodejs-big-picture', 'Node js Big Picture', 'Paul OFallon', 1,3240, TRUE, '2019-06-03', 2, 'getting started', 123);
INSERT INTO courses (id, name, author, audience, duration, cc, released, module_id, module_name, module_duration) VALUES
('nodejs-big-picture', 'Node js Big Picture', 'Paul OFallon', 2,3240, TRUE, '2019-06-03', 3, 'getting started2', 123);
INSERT INTO courses (id, name, author, audience, duration, cc, released, module_id, module_name, module_duration) VALUES
('nodejs-big-picture', 'Node js Big Picture', 'Paul OFallon', 2,3240, TRUE, '2019-06-03', 4, 'getting started3', 123);
INSERT INTO courses (id, name, author, audience, duration, cc, released, module_id, module_name, module_duration) VALUES
('nodejs-big-picture', 'Node js Big Picture', 'Paul OFallon', 2,3240, TRUE, '2019-06-03', 5, 'getting started4', 123);
INSERT INTO courses (id, name, author, audience, duration, cc, released, module_id, module_name, module_duration) VALUES
('react-big-picture', 'React The Big Picture',  'Cory House',4, 3240, TRUE, '2017-11-21', 2, 'getting started', 123);

select * from courses;
select * from courses where id='nodejs-big-picture';
select * from courses where id='nodejs-big-picture' and module_id=2;

select * from courses where module_id=2 allow filtering ;

select * from courses where id='nodejs-big-picture' and module_id in (3,4,5);
select * from courses where id='nodejs-big-picture' order by module_id desc ;