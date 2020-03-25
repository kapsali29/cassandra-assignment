CREATE KEYSPACE assignment WITH replication = {'replication_factor': 3, 'class': 'SimpleStrategy'};
USE assignment;

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

