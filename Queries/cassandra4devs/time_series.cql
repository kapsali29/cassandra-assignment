create keyspace if not exists pluralsight with replication = {'class':'SimpleStrategy', 'replication_factor':1};
use pluralsight;

CREATE TABLE IF NOT EXISTS course_page_views (
    course_id varchar,
    view_id timeuuid,
    PRIMARY KEY (course_id, view_id)
) WITH CLUSTERING ORDER BY (view_id desc );

insert into course_page_views (COURSE_ID, VIEW_ID) VALUES ('nodejs-big-picture', now()) using TTL 31536000;
insert into course_page_views (COURSE_ID, VIEW_ID) VALUES ('nodejs-big-picture', now()) using TTL 31536000;
insert into course_page_views (COURSE_ID, VIEW_ID) VALUES ('nodejs-big-picture', now()) using TTL 31536000;
insert into course_page_views (COURSE_ID, VIEW_ID) VALUES ('nodejs-big-picture', now()) using TTL 31536000;

SELECT * FROM course_page_views;
SELECT dateOf(view_id) FROM course_page_views;
SELECT dateOf(view_id) FROM course_page_views WHERE course_id='nodejs-big-picture' order by view_id ASC ;
SELECT dateOf(view_id) FROM course_page_views WHERE course_id='nodejs-big-picture' and view_id >= maxTimeuuid('2019-10-30') and view_id < minTimeuuid('2019-11-02');

TRUNCATE course_page_views;

ALTER TABLE course_page_views add last_view_id timeuuid static ;

INSERT INTO course_page_views (course_id, last_view_id, view_id) VALUES ('nodejs-big-picture', now(), now()) using TTL 21536000;
SELECT * from course_page_views;


