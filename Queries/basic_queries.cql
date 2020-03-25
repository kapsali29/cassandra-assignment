CREATE KEYSPACE guru WITH replication = {'replication_factor': 3, 'class': 'SimpleStrategy'};
USE guru;

CREATE TABLE MusicPlaylist (
    SongId int,
    SongName text,
    Year int,
    Singer text,
    PRIMARY KEY ((SongId, Year), SongName)
);

CREATE TABLE StudentCourse (
    Student_rollno int primary key,
    Student_name text,
    Course_name text

);
