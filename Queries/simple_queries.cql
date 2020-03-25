CREATE KEYSPACE tutorialspoint
WITH replication = {'class':'SimpleStrategy', 'replication_factor' : 3};

USE tutorialspoint;

CREATE TABLE emp(
  emp_id int PRIMARY KEY ,
  emp_name text,
  emp_city text,
  emp_sal varint,
  emp_phone varint
);
select * from emp;

INSERT INTO emp (emp_id, emp_name, emp_city, emp_sal, emp_phone) VALUES (1, 'ram', 'Hyderabad', 9848022338, 50000);
INSERT INTO emp (emp_id, emp_name, emp_city, emp_sal, emp_phone) VALUES (2, 'robin', 'Hyderabad', 9848022339, 40000);
INSERT INTO emp (emp_id, emp_name, emp_city, emp_sal, emp_phone) VALUES (3, 'rahman', 'Chennai', 9848022330, 45000);

SELECT * FROM emp;

UPDATE emp SET emp_city='Delhi', emp_sal=50000 WHERE emp_id=2;

SELECT emp_city, emp_name FROM emp;

CREATE INDEX ON emp(emp_sal);
SELECT * FROM emp WHERE emp_sal=50000;

DELETE emp_sal FROM emp WHERE emp_id=3;
SELECT * FROM emp;

DELETE FROM emp WHERE emp_id=3;
SELECT * FROM emp;