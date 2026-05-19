\conninfo

\echo ==== List Databases before change ====
select datname from pg_database;

\echo ==== Dropping Database gisdb if exist ====
DROP DATABASE IF EXISTS gisdb;

\echo ==== Creating Database gisdb ====
CREATE DATABASE gisdb;

\echo ==== Switching to gisdb ====
\c gisdb

\conninfo

\echo ==== Creating customer table in gisdb ====
CREATE TABLE customer (
  id INT,
  custname VARCHAR(100)
);

\echo ==== Inserting rows into customer  ====
INSERT INTO customer (id, custname) VALUES
(1, 'ABC Co'),
(2, 'Honda Co'),
(3, 'Yamaha'),
(4, 'Hyundai'),
(5, 'IBM'),
(5, 'ICICI');

UPDATE customer 
SET id = 6 
WHERE custname = 'ICICI';

\echo ==== Display customer data ====
Select * from customer;

\echo ==== Final database list after change ====
select datname from pg_database;
