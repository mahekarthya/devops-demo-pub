\conninfo

\l

DROP DATABASE IF EXISTS gisdb;

CREATE DATABASE gisdb;

-- switch connection
\c gisdb

\conninfo

CREATE TABLE customer (
  id INT,
  custname VARCHAR(100)
);

INSERT INTO customer (id, custname) VALUES
(1, 'ABC Co'),
(2, 'Honda Co'),
(3, 'Yamaha');

Select * from customer;

\l