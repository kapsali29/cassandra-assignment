CREATE KEYSPACE cassandra WITH replication = {'replication_factor': 3, 'class': 'SimpleStrategy'};
USE cassandra;

// SELECT USER BY NAME

CREATE TYPE IF NOT EXISTS user_address (
    city text,
    street text,
    number int,
    postcode text
    );

CREATE TYPE IF NOT EXISTS card (
    card_number text,
    expiration text
    );

CREATE TABLE IF NOT EXISTS UserByName (
    user_name text,
    user_address map<text, frozen<user_address>>,
    user_pay_info map<text, frozen<card>>,
    PRIMARY KEY (user_name)
);

INSERT INTO UserByName (user_name, user_address, user_pay_info)
VALUES ('user1', {'user_address': {city:'Athens', street:'athens_Street1', number:1, postcode:'1233'}}, {'user_pay_info': {card_number: '122222222', expiration: '2016-02-02'}});

INSERT INTO UserByName (user_name, user_address, user_pay_info)
VALUES ('user2', {'user_address': {city: 'Patras', street: 'Patras Street1', number: 1, postcode: '122222'}}, {'user_pay_info':{card_number: '444444', expiration: '2032-02-02'}});

SELECT * FROM UserByName WHERE user_name='user2';
SELECT * FROM UserByName WHERE user_name='user1';


// Search song by its name

CREATE TABLE IF NOT EXISTS SongByName (
  song_name text,
  artist text,
  album text,
  genre text,
  year int,
  PRIMARY KEY (song_name)
);

INSERT INTO SongByName (song_name, artist, album, genre, year) VALUES ('one song', 'one artist', 'one album', 'rock', 2000);
INSERT INTO SongByName (song_name, artist, album, genre, year) VALUES ('two song', 'two artist', 'two album', 'rock', 2001);
INSERT INTO SongByName (song_name, artist, album, genre, year) VALUES ('pop song', 'pop artist', 'pop album', 'pop', 2010);
INSERT INTO SongByName (song_name, artist, album, genre, year) VALUES ('three song', 'three artist', 'three album', 'hip hop', 2000);

SELECT * FROM SongByName WHERE song_name='pop song';

// Get songs played by user in reverse date order

CREATE TABLE IF NOT EXISTS SongsPlayedByUser (
    song_name text,
    user_name text,
    genre text,
    date_played date,
    PRIMARY KEY (user_name, date_played)
);

INSERT INTO SongsPlayedByUser (song_name, user_name, genre, date_played) VALUES ('this_song', 'user1', 'rock', '2017-01-01');
INSERT INTO SongsPlayedByUser (song_name, user_name, genre, date_played) VALUES ('this_song2', 'user1', 'pop', '2017-01-02');
INSERT INTO SongsPlayedByUser (song_name, user_name, genre, date_played) VALUES ('this_song3', 'user1', 'hip hop', '2017-01-03');
INSERT INTO SongsPlayedByUser (song_name, user_name, genre, date_played) VALUES ('that_song', 'user1', 'rock', '2018-01-01');

SELECT * FROM SongsPlayedByUser WHERE user_name='user1';

// Search playlist by name

CREATE TABLE IF NOT EXISTS SearchPlayListByName (
    name text,
    description text,
    genre text,
    creator text,
    songs list<text>,
    PRIMARY KEY (name)
);

INSERT INTO  SearchPlayListByName (name, description, genre, creator, songs)
VALUES ('playlist1', 'this is playlist1', 'rock', 'creator 1', ['song1', 'song2', 'song3']);
INSERT INTO  SearchPlayListByName (name, description, genre, creator, songs)
VALUES ('playlist2', 'this is playlist2', 'rock', 'creator 2', ['song12', 'song22', 'song32']);
INSERT INTO  SearchPlayListByName (name, description, genre, creator, songs)
VALUES ('playlist3', 'this is playlist3', 'rock', 'creator 3', ['song13', 'song23', 'song33']);

SELECT * FROM SearchPlayListByName WHERE name='playlist1';